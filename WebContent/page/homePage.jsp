<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%String path = request.getContextPath(); 
      String basePath = request.getScheme()+"://"+ request.getServerName()+":"+request.getServerPort()+path+"/";%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath%>">
<head>
    <title></title>
    <link href="css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css" />   
    <link rel="stylesheet" type="text/css" href="themes/icon.css" />
    
<script type="text/javascript" src="jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src='jquery/outlook2.js'> </script>
<script type="text/javascript" src="jquery/jquery.easyui.min.js"></script>

	

    <script type="text/javascript">
	 var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"资产管理",
							"menus":[{"menuname":"设备总览","icon":"icon-nav","url":"device/device_view.jsp"},
									{"menuname":"过保设备","icon":"icon-nav","url":"page/HelloJquery.jsp"},
									{"menuname":"废弃设备","icon":"icon-nav","url":"page/HelloJquery.jsp"}
									//{"menuname":"删除设备","icon":"icon-role","url":"page/HelloJquery.jsp"},
									//{"menuname":"权限设置","icon":"icon-set","url":"page/HelloJquery.jsp"},
									//{"menuname":"系统日志","icon":"icon-log","url":"page/HelloJquery.jsp"}
								]
						},{"menuid":"8","icon":"icon-sys","menuname":"维护管理",
							"menus":[{"menuname":"网络硬件配置","icon":"icon-nav","url":""},
									{"menuname":"配置更换历史","icon":"icon-nav","url":"page/HelloJquery.jsp"}
								]
						},{"menuid":"56","icon":"icon-sys","menuname":"系统设置",
							"menus":[{"menuname":"维护单位","icon":"icon-nav","url":"page/HelloJquery.jsp"},
									{"menuname":"设备型号","icon":"icon-nav","url":"page/HelloJquery.jsp"},
									{"menuname":"账号管理","icon":"icon-nav","url":"page/HelloJquery.jsp"},
									{"menuname":"权限管理","icon":"icon-nav","url":"page/HelloJquery.jsp"},
								]
						},{"menuid":"57","icon":"icon-sys","menuname":"报表",
							"menus":[
									]
							}
				]};
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false,
            });
        }
        //关闭登录窗口
        function close() {
            $('#w').window('close');
        }

        function closeLogin() {
        	close();
        }

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }

            $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            });
            
        }
		function detail() {
			//$("#p11").panel('refresh','<%=basePath%>page/loginPage.jsp');
		    var currTab =  self.parent.$('#tabs').tabs('getSelected'); //获得当前tab
		    //var url = $(currTab.panel('options').content).attr('src');
		    self.parent.$('#tabs').tabs('update', {
		      tab : currTab,
		      options : {
		       content : createFrame('<%=basePath%>page/loginPage.jsp')
		      }
		     });
		}
        $(function() {
        
            openPwd();
            //
            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            });

           

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = 'page/loginPage.jsp';
                    }
                });

            });
			
            $("#p11").panel({
                title: "标题",
                width: 300,
                height: 200,
                iconCls: "icon-add",
                collapsible: false,
                minimizable: false,
                maximizable: false,
                closable: false,
                href : '<%=basePath%>getAccountReceive',
                onLoad : function(data) {
                	//alert(data);
                	
                	
                	
                }
            });
			
			
        });
		
		

    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">你好，<%=request.getSession().getAttribute("current_user") %> <a href="javascript:void(0)" id="editpass">修改密码</a> <a href="javascript:void(0)" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "><img src="images/blocks.gif" width="20" height="20" align="absmiddle" /> 宁波汇民科技设备资源移动管理系统</span>
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">By 宁波汇民科技有限有限公司 Email:ming.liu@nbhmit.com</div>
    </div>
    <div region="west" split="true" title="导航菜单" style="width:130px;" id="west">
<div class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
				
			</div>

    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden; background: #F0FFFF" id="home" fit="true">
				
<!-- 			 <div id="p11" class="easyui-panel" title="My Panel" >   -->

<!--       				<p>panel content.</p>   -->

<!--       				<p>panel content.</p>   -->
<!--   				</div>  -->

			</div>
		</div>
    </div>
    
    
    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0);" >
                    确定</a> <a id="cancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0);"
                        onclick="closeLogin()">取消</a>
            </div>
        </div>
    </div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>


</body>
</html>