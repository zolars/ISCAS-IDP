package grabData;

import Util.HBSessionDaoImpl;
import hibernatePOJO.*;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import sms.SmsAlarm;

import javax.swing.*;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


public class alarmModelJob implements Job {

    /**
     * 判断当前日期是否为工作日时段
     *
     * @param
     * @return  true 周一到周五; false 周末
     * @Exception 发生异常
     */
    public boolean isWorkTime(String pTime){
        Boolean rt1 = false, rt2 = false;
        try{
            String dstr[] = pTime.split(" ");
            String day = dstr[0];
            String time = dstr[1];

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c = Calendar.getInstance();
            c.setTime(format.parse(day));
            int dayForWeek = 0;
            if(c.get(Calendar.DAY_OF_WEEK) == 1)
                dayForWeek = 7;
            else
                dayForWeek = c.get(Calendar.DAY_OF_WEEK) - 1;

            //获取时间
            String formattime = "yyyy-MM-dd HH:mm:ss:SS";
            Date nowTime = new SimpleDateFormat(formattime).parse(pTime);

            Date startTime = new SimpleDateFormat(formattime).parse(day+" 08:00:00:000");
            Date endTime = new SimpleDateFormat(formattime).parse(day+" 18:00:00:000");

            if (nowTime.getTime() == startTime.getTime()
                    || nowTime.getTime() == endTime.getTime())
                rt2 = true;

            Calendar date = Calendar.getInstance();
            date.setTime(nowTime);

            Calendar begin = Calendar.getInstance();
            begin.setTime(startTime);

            Calendar end = Calendar.getInstance();
            end.setTime(endTime);

            if (date.after(begin) && date.before(end)) {
                rt2 = true;
            } else {
                rt2 = false;
            }

            if(dayForWeek == 6 || dayForWeek ==7)
                rt1 = false;
            else rt1 = true;

        } catch ( Exception e) {
            // TODO: handle exception
            	System.out.println(e.getClass());
            	e.printStackTrace();
        }

        if(rt1&&rt2)
            return true;
        else return false;

    }

    @Override
    /*
    读取当前时间之前的30分钟内的告警事件、
    并分别根据设定的告警方式、执行短信、弹窗、平台告警
     */
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {

        System.out.println("开始执行告警模块:" + System.currentTimeMillis());

        HBSessionDaoImpl hbsessionDao = new HBSessionDaoImpl();

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.MINUTE, calendar.get(Calendar.MINUTE) - 30);   // 让分钟减少30
        String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SS").format(calendar.getTime());

        Calendar calendarnow = Calendar.getInstance();
        calendarnow.setTime(new Date());
        calendarnow.set(Calendar.MINUTE, calendar.get(Calendar.MINUTE));
        String nowtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SS").format(calendar.getTime());

        //1.1.获得当前市行的30分钟内的告警事件-电能事件
        //1.2.查询各个事件的告警方式、告警用户、告警时间范围
        //通过event_power.cid 找到 events_type中的type， 通过type 找到 device_threshold中的3条不同等级的记录，对应不同的tvalue[]
        //比较event_power.value 与 tvalue[] ，确定是哪一个等级的事件。tlevel
        //根据tlevel（0：不执行 1：弹窗 2：弹窗+短信/短信平台（工作日） 3.弹窗+短信/短信平台（全天））执行相应的告警

        List<EventPower> eventpowerlist = new ArrayList<>();
        List<EventsType> typelist = new ArrayList<>();
        List<DevicesThreshold> thresholdlist = new ArrayList<>();
        List<DeviceAlarmUser> alarmuserlist = new ArrayList<>();
        Integer tlevel = 0;

        eventpowerlist = hbsessionDao.search("FROM EventPower where time >'"+ date +"'");
        alarmuserlist = hbsessionDao.search("From DeviceAlarmUser");

        if(eventpowerlist != null){
            for(int i = 0; i < eventpowerlist.size(); i++){
                String did = eventpowerlist.get(i).getDid();
                Integer cid = eventpowerlist.get(i).getCid();
                Double value = eventpowerlist.get(i).getValue();
                Timestamp time = eventpowerlist.get(i).getTime();

                typelist = hbsessionDao.search("From EventsType where cid ='"+ cid +"'");

                String type = typelist.get(0).getType();
                String description = typelist.get(0).getDescription();

                thresholdlist = hbsessionDao.search("From DevicesThreshold where type ='"+ type +"' order by level desc");

                for(int j = 0 ; j < thresholdlist.size(); j++){

                    Double fval = thresholdlist.get(j).getFloorval();
                    Double cval = thresholdlist.get(j).getCellval();

                    if(fval != null) {
                        if (value > fval) {
                            tlevel = thresholdlist.get(j).getLevel();
                            break;
                        }
                    }
                    else if(cval != null){
                        if (value < cval) {
                            tlevel = thresholdlist.get(j).getLevel();
                            break;
                        }
                    }
                }

                System.out.println("事件"+ did +"的告警级别："+tlevel);

                Integer isSms = 0;
                Integer isAlart = 0;
                Integer isPlartform = 0;
                String precontent = "";
                String timeperiod = "";
                String govtelephone = "";
                String telephone = "";

                List<Object> aulist = hbsessionDao.search("select ta.isSms, ta.isAlert, ta.isPlantform, ta.precontent, ta.timeperiod, tb.govtelephone, tb.telephone" +
                        " from DeviceAlarmUser ta, User tb " +
                        "where ta.uid = tb.uid and ta.level='" + tlevel +"'");

                if(aulist.size() > 0){
                    Object[] objects=(Object[])aulist.get(0);
                    isSms =  (Integer)objects[0];
                    isAlart =  (Integer)objects[1];
                    isPlartform =  (Integer)objects[2];
                    precontent =  (String)objects[3];
                    timeperiod =  (String)objects[4];
                    govtelephone =  (String)objects[5];
                    telephone =  (String)objects[6];
                }

                if(timeperiod == "1") { //若是第二等级,即timeperiod == 1
                    if (isWorkTime(nowtime)) {
                        if (isSms == 1) { //执行短信报警
                            SmsAlarm s = new SmsAlarm();
                            if (govtelephone != "")
                                s.excuteSmsAlarm(govtelephone, description);
                            if (telephone != "")
                                s.excuteSmsAlarm(telephone, description);
                        }
                        if (isPlartform == 1) { //执行平台报警
                            System.out.println("执行平台报警");
                        }
                    }
                }

                else{ //非第二等级
                    if (isSms == 1) { //执行短信报警
                        SmsAlarm s = new SmsAlarm();
                        if(govtelephone != "")
                            s.excuteSmsAlarm(govtelephone, description);
                        if(telephone != "")
                            s.excuteSmsAlarm(telephone, description);
                    }
                    if (isPlartform == 1) { //执行平台报警
                        System.out.println("执行平台报警");
                    }
                }

                if(isAlart == 1){ //执行弹窗报警
                    JOptionPane.showMessageDialog(null,precontent+ "\r\n" + "时间：" + time + "\r\n信息：" +  description);
                }
            }
        }

        //2.1.环境事件
        List<EventEnvironment> alrmenvirolist = hbsessionDao.search(
                "FROM EventEnvironment where time >'"+ date +"'");

        //2.2.查询各个事件的告警方式、告警用户、告警时间范围


        //3.1.设备（治理）事件
        List<EventCtrl> alrmctrllist = hbsessionDao.search(
                "FROM EventCtrl where time >'"+ date +"'");

        //3.2.查询各个事件的告警方式、告警用户、告警时间范围




        System.out.println("完成告警模块:" + System.currentTimeMillis());
    }
}
