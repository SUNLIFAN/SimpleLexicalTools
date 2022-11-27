package CSVUtils;

import com.opencsv.bean.CsvBindByName;

public class BugFixPairBean {

    @CsvBindByName(column = "buggy_code")
    private String buggyCode;

    @CsvBindByName(column = "fixed_code")
    private String fixedCode;

    public String getBuggyCode() {
        return buggyCode;
    }

    public void setBuggyCode(String buggyCode) {
        this.buggyCode = buggyCode;
    }

    public String getFixedCode() {
        return fixedCode;
    }

    public void setFixedCode(String fixedCode) {
        this.fixedCode = fixedCode;
    }

    @Override
    public String toString() {
        return "BugFixPairBean{" +
                "buggyCode='" + buggyCode + '\'' +
                ", fixedCode='" + fixedCode + '\'' +
                '}';
    }
}
