package systemMng.dao;


import hibernatePOJO.RolesPermission;

import java.util.List;

public interface PermissionDAO {

    public List getPermissionTree();

    public RolesPermission getRolesPermissionTree(String rid);

    public Boolean setDeviceAlarmUserInfo(String level, String precontent);

    public List getDeviceAlarmUserInfoByLevel(String level);
}
