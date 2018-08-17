package hibernatePOJO;

import java.util.Objects;

public class DevicesThreshold {
    private int dtid;
    private String name;
    private String type;
    private String unit;
    private Double standardval;
    private Double cellval;
    private Double floorval;
    private Integer isMark;
    private String alarmcontent;

    public int getDtid() {
        return dtid;
    }

    public void setDtid(int dtid) {
        this.dtid = dtid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Double getStandardval() {
        return standardval;
    }

    public void setStandardval(Double standardval) {
        this.standardval = standardval;
    }

    public Double getCellval() {
        return cellval;
    }

    public void setCellval(Double cellval) {
        this.cellval = cellval;
    }

    public Double getFloorval() {
        return floorval;
    }

    public void setFloorval(Double floorval) {
        this.floorval = floorval;
    }

    public Integer getIsMark() {
        return isMark;
    }

    public void setIsMark(Integer isMark) {
        this.isMark = isMark;
    }

    public String getAlarmcontent() {
        return alarmcontent;
    }

    public void setAlarmcontent(String alarmcontent) {
        this.alarmcontent = alarmcontent;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DevicesThreshold that = (DevicesThreshold) o;
        return dtid == that.dtid &&
                Objects.equals(name, that.name) &&
                Objects.equals(type, that.type) &&
                Objects.equals(unit, that.unit) &&
                Objects.equals(standardval, that.standardval) &&
                Objects.equals(cellval, that.cellval) &&
                Objects.equals(floorval, that.floorval) &&
                Objects.equals(isMark, that.isMark) &&
                Objects.equals(alarmcontent, that.alarmcontent);
    }

    @Override
    public int hashCode() {

        return Objects.hash(dtid, name, type, unit, standardval, cellval, floorval, isMark, alarmcontent);
    }
}
