import CSVUtils.BugFixPairBean;
import CSVUtils.CSVUtils;
import CppLexical.CppLexer;
import PyLexical.PyLexer;
import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.Token;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * args: language csv_path, output_path
 */
public class Main {

    public static void main(String[] args) throws IOException, CsvRequiredFieldEmptyException, CsvDataTypeMismatchException {
        if(args.length != 3){
            System.out.println("Incorrect Amount of Arguments.");
            System.exit(1);
        }

        String lang = args[0];

        String csvPath = args[1];

        String outputPath = args[2];

        List<BugFixPairBean> beans = CSVUtils.CSV2BeanConvertor(csvPath);

        for(BugFixPairBean bean : beans){
            String buggyCode = bean.getBuggyCode();
            String fixCode = bean.getFixedCode();

            buggyCode = tokenize(lang, buggyCode);
            fixCode = tokenize(lang, fixCode);

            bean.setBuggyCode(buggyCode);
            bean.setFixedCode(fixCode);
        }

        CSVUtils.BeanToCsvConvertor(beans, outputPath);
    }

    private static Lexer buildLexer(String lang, String code) {
        CharStream input = CharStreams.fromString(code);
        if("py".equals(lang)){
            return new PyLexer(input);
        }else if("cpp".equals(lang)){
            return new CppLexer(input);
        }else {
            return null;
        }
    }

    private static String tokenize(String lang, String code) {

        Lexer lexer = buildLexer(lang, code);

        lexer.removeErrorListeners();

        List<? extends Token> tokens = lexer.getAllTokens();

        StringBuilder sb = new StringBuilder();

        for(Token token : tokens){
            sb.append(token.getText()).append(' ');
        }

        return sb.toString();
    }
}
