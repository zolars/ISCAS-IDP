package deviceManage.dao;

import java.util.List;

public interface DeviceThresholdDAO {

    public List searchFuzzyDeviceThreshold(String name);

    public List getOneDeviceThreshold(String name);

    public List getOneofOneDeviceThreshold(Integer dtid);

}