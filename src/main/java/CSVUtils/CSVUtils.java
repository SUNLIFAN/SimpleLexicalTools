package CSVUtils;

import com.opencsv.bean.CsvToBeanBuilder;
import com.opencsv.bean.StatefulBeanToCsv;
import com.opencsv.bean.StatefulBeanToCsvBuilder;
import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;

import java.io.*;
import java.util.List;

public class CSVUtils {
    public static List<BugFixPairBean> CSV2BeanConvertor(String csvPath) throws FileNotFoundException {
        return new CsvToBeanBuilder<BugFixPairBean>(new FileReader(csvPath))
                .withType(BugFixPairBean.class).build().parse();
    }

    public static void BeanToCsvConvertor(List<BugFixPairBean> beans, String outputPath) throws IOException, CsvRequiredFieldEmptyException, CsvDataTypeMismatchException {
        Writer writer = new FileWriter(outputPath);
        StatefulBeanToCsv beanToCsv = new StatefulBeanToCsvBuilder(writer).build();
        beanToCsv.write(beans);
        writer.close();
    }
}
