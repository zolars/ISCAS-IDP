package userManage.action;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import userManage.dao.RolesDAO;
import userManage.dao.UserDAO;
import userManage.dao.impl.RolesDAOImpl;
import userManage.dao.impl.UserDAOImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import hibernatePOJO.UserPermission;
//import net.sf.json.JSON;
//import net.sf.json.JSONObject;


public class updateRoleInfoAction extends ActionSupport {
    private static final long serialVersionUID = 13L;
    private String result;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }


    /* 更新角色
     */
    public String execute() throws Exception {
        try {//获取数据
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            request.setCharacterEncoding("utf-8");

            //String monitorpointid = request.getParameter("monitorpointid");
            String rid = request.getParameter("rid");
            String rname = request.getParameter("rname");
            String rextra = request.getParameter("rextra");

            RolesDAO dao = new RolesDAOImpl();
            Boolean rt = dao.updateRoleInfo(rid, rname, rextra);

            JSONObject jsonObject = new JSONObject();

            if(rt)
                jsonObject.put("提示", "修改成功！");
            else
                jsonObject.put("提示", "修改失败，请重试！");

            result = JSON.toJSONString(jsonObject);

        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        return "success";//ERROR;
    }

}
