import CSVUtils.CSVUtils;
import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;
import org.junit.Test;
import CSVUtils.BugFixPairBean;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public class CSVUtilsTest {

    @Test
    public void TestCsvToBean() throws FileNotFoundException {
        String csvPath = "src/test/srcode/dl_cpp_clean.csv";
        CSVUtils.CSV2BeanConvertor(csvPath).stream()
                .forEach(row-> System.out.println(row));
    }

    @Test
    public void TestBeanToCsv() throws IOException, CsvRequiredFieldEmptyException, CsvDataTypeMismatchException {
        String outputPath = "src/test/output/test.csv";
        List<BugFixPairBean> beans = CSVUtils.CSV2BeanConvertor("src/test/srcode/dl_cpp_clean.csv");
        CSVUtils.BeanToCsvConvertor(beans, outputPath);
    }
}
