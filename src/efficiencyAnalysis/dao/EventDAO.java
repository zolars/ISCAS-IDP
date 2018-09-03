package efficiencyAnalysis.dao;


import java.util.List;
import java.util.Map;

public interface EventDAO {

    public List getLocalAllPowerEvent(String rid, String starttime, String endtime);

    public List getLocalLastPowerEvent(String rid);

    public boolean setAssessInfo(Integer red_yellow, Integer yellow_green);

    public List getAllCityEvent();

    public Map getAllProvinceEvent();

    public List getOneProvinceEvent(String pid, String stime, String etime);

}
