<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 引入struts的标签库-->
<%@ taglib uri="/struts-tags" prefix="s"%>



<!--<!DOCTYPE html>-->
<!--[if IE 9 ]><!--<html class="ie9"><![endif]-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no">
    <meta charset="UTF-8">

    <meta name="description" content="Violate Responsive Admin Template">
    <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">

    <title>移动能效管理平台</title>

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="js/bootstrap-3.3.4.css">
    <link href="css/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="js/font-awesome.4.6.0.css">
    <link href="css/form.css" rel="stylesheet">
    <link href="css/calendar.css" rel="stylesheet">
    <link href="css/media-player.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/icons.css" rel="stylesheet">
    <link href="css/generics.css" rel="stylesheet">
    <link href="css/mstp_map.css" rel="stylesheet">
    <link href="css/menu.css" rel="stylesheet">

    <link href="css/mycss.css" rel="stylesheet">
</head>

<body id="skin-blur-blue">
    <header id="header" class="media">
        <a href="" id="menu-toggle"></a>
        <a class="logo pull-left" href="province.jsp">移动能效管理平台</a>

        <div class="media-body">
            <div class="media" id="top-menu">
                <div class="pull-left location-select">
                    <select class="form-control location-select-item" id="province_code" name="province_code" onchange="getCity()">
                        <option value="">请选择</option>
                    </select>

                    <select class="form-control location-select-item" id="city_code" name="city_code" onchange="getComproom()">
                        <option value="">请选择</option>
                    </select>

                    <select class="form-control location-select-item" id="comproom_code" name="comproom_code">
                        <option value="">请选择</option>
                    </select>
                </div>

                <div class="pull-right">欢迎用户${username}登录</div>

            </div>
        </div>
    </header>

    <div class="clearfix"></div>

    <section id="main" class="p-relative" role="main">

        <!-- Sidebar -->
        <!-- 动态加载菜单项 -->
        <aside id="sidebar">
            <ul id="ulbar" class="list-unstyled side-menu" style="width: 100%!important;padding-top: 20px;">
            </ul>
        </aside>

        <!-- Content -->
        <section id="content" class="container">

            <!-- Messages Drawer -->
            <div id="messages" class="tile drawer animated">
                <div class="listview narrow">
                    <div class="media">
                        <a href="">新消息</a>
                        <span class="drawer-close">&times;</span>

                    </div>
                    <div class="overflow" style="height: 254px">
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/1.png" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">调度班长 - 2分钟前</small>
                                <br>
                                <a class="t-overflow" href="">空调系统数据采集异常，请工作人员检查。</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/2.png" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">值班专员 - 15分钟前</small>
                                <br>
                                <a class="t-overflow" href="">办公室供暖系统出现异常，无法提供正常供暖，请排除故障!</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/3.png" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">自动化班长 - 3小时前</small>
                                <br>
                                <a class="t-overflow" href="">能源费用分布图以及报表数据有误差，请核对</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/4.png" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">值班人员 - 3小时前</small>
                                <br>
                                <a class="t-overflow" href="">锅炉房水温过高，告警系统启动，请及时查看.</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/1.jpg" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">办公室 - 4小时前</small>
                                <br>
                                <a class="t-overflow" href="">请各部门提供上周能耗统计数据，本周将针对关键能耗点进行技术优化</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/2.jpg" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">值班专员 - 5小时前</small>
                                <br>
                                <a class="t-overflow" href="">自动化班提供1#机房总耗电量远远超过预测值，请再次核对数据并及时告知！</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/3.png" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">办公室 - 6小时前</small>
                                <br>
                                <a class="t-overflow" href="">请提供“人均空调系统能耗”和“制冷系统能效比”两组数据</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/4.jpg" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">办公室专责 - 6小时前</small>
                                <br>
                                <a class="t-overflow" href="">请调度班提供2#机房和3#基站的能耗统计数据.</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/5.png" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">网管中心 - 7小时前</small>
                                <br>
                                <a class="t-overflow" href="">今天凌晨将进行断网检修，请各部门及时下载相关材料</a>
                            </div>
                        </div>
                    </div>
                    <div class="media text-center whiter l-100">
                        <a href="">
                            <small>查看所有</small>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Notification Drawer -->
            <div id="notifications" class="tile drawer animated">
                <div class="listview narrow">
                    <div class="media">
                        <a href="">实时告警</a>
                        <span class="drawer-close">&times;</span>
                    </div>
                    <div class="overflow" style="height: 254px">
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/1.png" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">值班人员 - 35秒前</small>
                                <br>
                                <a class="t-overflow" href="">供暖系统能耗数据采集异常</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/3.jpg" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">调度值班室 - 1分钟前</small>
                                <br>
                                <a class="t-overflow" href="">办公照明系统出现故障，请立即检修！</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/3.png" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">办公室 - 2分钟前</small>
                                <br>
                                <a class="t-overflow" href="">办公区空调1#机组无法正常工作，异响</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/4.png" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">值班专责 - 3分钟前</small>
                                <br>
                                <a class="t-overflow" href="">1#制冷站中级故障告警，请立即前往查看</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/4.jpg" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">值班人员 - 4分钟前</small>
                                <br>
                                <a class="t-overflow" href="">冷机用电量突变，请查看是否故障</a>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <img width="40" src="img/profile-pics/2.jpg" alt="">
                            </div>
                            <div class="media-body">
                                <small class="text-muted">办公室专责 - 5分钟前</small>
                                <br>
                                <a class="t-overflow" href="">新风系统告警，无法正常工作</a>
                            </div>
                        </div>
                    </div>
                    <div class="media text-center whiter l-100">
                        <a href="">
                            <small>查看所有</small>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Breadcrumb -->
            <ol class="breadcrumb hidden-xs">
                <li>
                    <a href="#">首页</a>
                </li>
                <li class="active">能耗全息图</li>
            </ol>
            <h4 class="page-title">青海省全息图</h4>

            <div class="block-area">

                <div class="row">
                    <!-- World Map -->
                    <div class="col-md-12">
                        <div class="tile">
                            <h2 class="tile-title"></h2>
                            <div class="tile-config dropdown">
                                <a data-toggle="dropdown" href="" class="tooltips tile-menu" title="Options"></a>
                                <ul class="dropdown-menu animated pull-right text-right">
                                    <li>
                                        <a href="">Refresh</a>
                                    </li>
                                    <li>
                                        <a href="">Settings</a>
                                    </li>
                                </ul>
                            </div>
                            <img style='height:100%;width:100%;' src="img/qinghai.jpg" />
                            <div class='absolute-area'>
                                <!-- 西宁、海东、黄南、果洛 -->
                                <div id='ab-xining' title='西宁' data='xining' onclick="clk_map(this)" class='active'></div>
                                <div id='ab-haibei' title='海北' data='haibei' onclick="clk_map(this)"></div>
                                <div id='ab-haidong' title='海东' data='haidong' onclick="clk_map(this)"></div>
                                <div id='ab-haixi' title='海西' data='haixi' onclick="clk_map(this)"></div>
                                <div id='ab-hainan' title='海南' data='hainan' onclick="clk_map(this)"></div>
                                <div id='ab-yushu' title='玉树' data='yushu' onclick="clk_map(this)"></div>
                                <div id='ab-huangnan' title='黄南' data='huangnan' onclick="clk_map(this)"></div>
                                <div id='ab-guoluo' title='果洛' data='guoluo' onclick="clk_map(this)"></div>
                                <div id='ab-geermu' title='格尔木' data='geermu' onclick="clk_map(this)"></div>
                            </div>
                            <!--<div id="qinghai-map" style="height: 400px"></div>-->
                        </div>
                    </div>
                </div>
            </div>
            <div class="block-area">
                <div class='row'>
                    <div class="tile col-md-4">
                        <h2 class="tile-title">
                            <span class='area'>西宁</span> 总体用电量</h2>
                        <div class="tile-config dropdown">
                            <a data-toggle="dropdown" href="" class="tooltips tile-menu" title="Options"></a>
                            <ul class="dropdown-menu pull-right text-right">
                                <li>
                                    <a href="">Refresh</a>
                                </li>
                                <li>
                                    <a href="">Settings</a>
                                </li>
                            </ul>
                        </div>
                        <div class='p-10 hide'>
                            总体用电量是所有电能能耗的总和，包括照明能耗、空调能耗、负载能耗等。
                        </div>
                        <div class="p-10">
                            <div id="bar-chart" class="main-chart" style="height: 250px"></div>
                        </div>
                    </div>
                    <div class="tile col-md-4">
                        <h2 class="tile-title">
                            <span class='area'>西宁</span> 总体用油量</h2>
                        <div class="tile-config dropdown">
                            <a data-toggle="dropdown" href="" class="tooltips tile-menu" title="Options"></a>
                            <ul class="dropdown-menu pull-right text-right">
                                <li>
                                    <a href="">Refresh</a>
                                </li>
                                <li>
                                    <a href="">Settings</a>
                                </li>
                            </ul>
                        </div>
                        <div class='p-10 hide'>
                            请补充文字。请补充文字。请补充文字。请补充文字。请补充文字。请补充文字。请补充文字。请补充文字。请补充文字。
                        </div>
                        <div class="p-10">
                            <div id="line-chart" class="main-chart" style="height: 250px"></div>
                        </div>
                    </div>
                    <div class="tile col-md-4">
                        <h2 class="tile-title">
                            <span class='area'>西宁</span> 实时能耗</h2>
                        <div class="tile-config dropdown">
                            <a data-toggle="dropdown" href="" class="tooltips tile-menu" title="Options"></a>
                            <ul class="dropdown-menu pull-right text-right">
                                <li>
                                    <a href="">Refresh</a>
                                </li>
                                <li>
                                    <a href="">Settings</a>
                                </li>
                            </ul>
                        </div>
                        <div class='p-10 hide'>
                            请补充文字。请补充文字。请补充文字。请补充文字。请补充文字。请补充文字。请补充文字。请补充文字。
                        </div>
                        <div class="p-10">
                            <div id="dynamic-chart" class="main-chart" style="height: 250px"></div>
                        </div>
                    </div>
                </div>
                <!-- Pies -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="tile">
                            <h2 class="tile-title">
                                <span class='area'>西宁</span> 用电量占比分析</h2>
                            <div class="tile-config dropdown">
                                <a data-toggle="dropdown" href="" class="tooltips tile-menu" title="Options"></a>
                                <ul class="dropdown-menu pull-right text-right">
                                    <li>
                                        <a href="">Refresh</a>
                                    </li>
                                    <li>
                                        <a href="">Settings</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="p-10">
                                <div id="pie-chart" class="main-chart" style="height: 300px"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="tile">
                            <h2 class="tile-title">
                                <span class='area'>西宁</span> 用油量占比分析</h2>
                            <div class="tile-config dropdown">
                                <a data-toggle="dropdown" href="" class="tooltips tile-menu" title="Options"></a>
                                <ul class="dropdown-menu pull-right text-right">
                                    <li>
                                        <a href="">Refresh</a>
                                    </li>
                                    <li>
                                        <a href="">Settings</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="p-10">
                                <div id="donut-chart" class="main-chart" style="height: 300px"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="block-area">
                <h3 class="block-title hide">
                    <span class='area'>西宁</span> 节能同比</h3>

                <!-- Easy Pie charts -->
                <div class="tile text-center hide">
                    <div class="tile-dark p-10">
                        <div class="pie-chart-tiny" data-percent="13">
                            <span class="percent"></span>
                            <span class="pie-title">办公楼</span>
                        </div>
                        <div class="pie-chart-tiny" data-percent="25">
                            <span class="percent"></span>
                            <span class="pie-title">核心机房</span>
                        </div>
                        <div class="pie-chart-tiny" data-percent="45">
                            <span class="percent"></span>
                            <span class="pie-title">基站</span>
                        </div>
                        <div class="pie-chart-tiny" data-percent="5">
                            <span class="percent"></span>
                            <span class="pie-title">中移动网点</span>
                        </div>
                        <div class="pie-chart-tiny" data-percent="12">
                            <span class="percent"></span>
                            <span class="pie-title">其他</span>
                        </div>
                    </div>
                </div>
                <!-- Sparkline -->
                <h3 class="block-title">
                    <span class='area'>西宁</span> 累计能耗</h3>
                <div class="row">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <div id="stats-line-2" class="pull-left"></div>
                            <div class="data">
                                <h2 data-value="1">0</h2>
                                <small>办公楼</small>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats media">
                            <div id="stats-line-3" class="pull-left"></div>
                            <div class="media-body">
                                <h2 data-value="3">0</h2>
                                <small>核心机房</small>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats media">

                            <div id="stats-line-4" class="pull-left"></div>

                            <div class="media-body">
                                <h2 data-value="123">0</h2>
                                <small>基站</small>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats media">
                            <div id="stats-line" class="pull-left"></div>
                            <div class="media-body">
                                <h2 data-value="23">0</h2>
                                <small>中移动网点</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <hr class="whiter m-t-20 m-b-20" />

            <br/>
            <br/>
            <br/>
        </section>
    </section>

    <!-- Javascript Libraries -->
    <!-- jQuery -->
    <script src="js/jquery-1.10.2.js"></script>
    <!-- jQuery Library -->
    <script src="js/jquery-ui-1.11.0.js"></script>
    <!-- jQuery UI -->
    <script src="js/jquery.easing.1.3.js"></script>
    <!-- jQuery Easing - Requirred for Lightbox -->

    <!-- Bootstrap -->
    <script src="js/bootstrap-3.3.4.js"></script>

    <!-- Charts -->
    <script src="js/charts/jquery.flot.js"></script>
    <!-- Flot Main -->
    <script src="js/charts/jquery.flot.time.js"></script>
    <!-- Flot sub -->
    <script src="js/charts/jquery.flot.animator.min.js"></script>
    <!-- Flot sub -->
    <script src="js/charts/jquery.flot.resize.min.js"></script>
    <!-- Flot sub - for repaint when resizing the screen -->
    <script src="js/charts/jquery.flot.orderBar.js"></script>
    <!-- Flot Bar chart -->
    <script src="js/charts/jquery.flot.pie.min.js"></script>
    <!-- Flot Pie chart -->

    <script src="js/sparkline.min.js"></script>
    <!-- Sparkline - Tiny charts -->
    <script src="js/easypiechart.js"></script>
    <!-- EasyPieChart - Animated Pie Charts -->
    <script src="js/mstp_map.js"></script>
    <!-- All the above chart related functions -->

    <!-- Map -->
    <script src="js/maps/jvectormap.min.js"></script>
    <!-- jVectorMap main library -->
    <!--Media Player-->
    <script src="js/media-player.min.js"></script>
    <!-- USA Map for jVectorMap -->

    <!-- UX -->
    <script src="js/scroll.min.js"></script>
    <!-- Custom Scrollbar -->

    <!-- Other -->
    <script src="js/calendar.min.js"></script>
    <!-- Calendar -->
    <script src="js/feeds.min.js"></script>
    <!-- News Feeds -->


    <!-- All JS functions -->
    <script src="js/functions.js"></script>

    <script type="text/javascript" src="/js/zTree/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="/js/zTree/jquery.ztree.core.js"></script>

   <%-- <script>

        var objprobank="<%=session.getAttribute("probank")%>";
        var objcitybank="<%=session.getAttribute("citybank")%>";
        var objcomputerroom="<%=session.getAttribute("computerroom")%>";

        /*var objcitybank2 = objcitybank.list;
        alert(objcitybank2);

        for(var key=0; key<objcitybank2.length; key++) {
            var temp = objcitybank2[key];
            console.log(temp);
        }
        alert(objcitybank2);*/

        var zTreeObj;
        // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
        var setting = {};
        // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
        var zNodes = [
            {name:objprobank, open:true, children:[
                    {name:objcitybank, open:true, children:[
                            {name:objcomputerroom}
                        ]
                    }
                ]
            }
        ];

        $(document).ready(function(){
            zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });

    </script>--%>

    <!-- 省\市\机房下拉菜单-->
    <script>
        var provinceid="<%=session.getAttribute("probank")%>";

        if(provinceid){//第一次进入这个页面，没有获取过
            $("#province_code").empty();
            $('#province_code').append("<option value='" + provinceid + "' >" + provinceid + "</option>");
        }
        else{
        }

        /*加载市下拉选*/
        function getCity() {
            var pname = $("#province_code").val();
            $("#city_code").empty();
            $("#comproom_code").empty();

            $.ajax({
                type: "post",
                url: "getCityTree",
                data: {provinceid: pname},
                dataType : "json",
                success: function (data) {
                    alert("33");
                    $('#city_code').append("<option value='' selected='selected' >" + '请选择' + "</option>");
                    $('#comproom_code').append("<option value='' selected='selected' >" + '请选择' + "</option>");

                    //alert(obj[0].cbname);
                    var obj = eval("(" + data + ")");
                    for (var i = 0; i < obj.length; i++) {
                        $('#city_code').append("<option value='" + obj[i].cbname + "' >" + obj[i].cbname + "</option>");
                    }

                },
                error: function () {
                    alert("加载市失败");
                }
            });
        }

        /*加载机房下拉选*/
        function getComproom() {
            var cname = $("#city_code").val();
            $("#comproom_code").empty();

            $.ajax({
                type: "post",
                url: "getCompTree",
                data: {cityid: cname},
                dataType : "json",
                success: function (data) {

                    $('#comproom_code').append("<option value='' selected='selected' >" + '请选择' + "</option>");

                    var obj = eval("(" + data + ")");
                    for (var i = 0; i < obj.length; i++) {
                        $('#comproom_code').append("<option value='" + obj[i].rname + "' >" + obj[i].rname + "</option>");
                    }
                },
                error: function () {
                    alert("加载机房失败");
                }
            });
        }

    </script>

    <!-- 动态加载菜单项 -->
    <script type="text/javascript">
        var menulist="<%=session.getAttribute("menulist")%>";
        var cbidstr = menulist.split(",");

        //处理第一个和最后一个
        cbidstr[0] = cbidstr[0].substring(1);
        cbidstr[0] = " " + cbidstr[0];

        var idx = cbidstr.length - 1;
        var len = cbidstr[idx].length;
        cbidstr[idx] = cbidstr[idx].substring(0, len - 1);

        for(var i = 0; i < cbidstr.length; i++){

            var menuname = "";
            if(cbidstr[i] == ' province.jsp')
                menuname = "集中监控";

            else if(cbidstr[i] == ' efficiencyDevice.jsp')
                menuname = "动力设施";

            else if(cbidstr[i] == ' onlineDetect.jsp')
                menuname = "在线监测";

            else if(cbidstr[i] == ' efficiencyAnalysis.jsp')
                menuname = "动力分析";

            else if(cbidstr[i] == ' efficiencyAssessment.jsp')
                menuname = "动力评估";

            else if(cbidstr[i] == ' reportChart.jsp')
                menuname = "报表功能";

            else if(cbidstr[i] == ' history.jsp') //userMng.jsp'
                menuname = "历史曲线";

            else if(cbidstr[i] == ' systemMng.jsp')
                menuname = "系统管理";

            $('#ulbar').append("<li><a href='" + cbidstr[i] + "'  id='menuurl'><i class='fa fa-calendar-o'></i><span>" + menuname + "</span></a></li>");
        }
    </script>

</body>

</html>