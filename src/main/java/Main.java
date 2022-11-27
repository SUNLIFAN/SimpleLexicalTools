import CppLexical.CppLexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;

import java.io.IOException;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {
        if(args.length != 1){
            System.out.println("Incorrect Amount of Arguments.");
            System.exit(1);
        }

        String fileName = args[0];

        CharStream input = CharStreams.fromFileName(fileName);
        CppLexer cppLexer = new CppLexer(input);


        List<? extends Token> tokens = cppLexer.getAllTokens();
        for(Token token :tokens){
            System.out.println(token.getText());
        }
    }
}
