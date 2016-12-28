<%-- 
    Document   : main
    Created on : Nov 8, 2016, 12:28:03 AM
    Author     : Khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/headerMinimal.jsp"%>
<%@ include file="../includes/js_css.jsp"%> 
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>  
        <title>Birth Certificate Entry Form</title>  
        <style>
            .icon-success {
                color: #088A08;
            }
            body, #mainWrapper {
                height: 70%;
                background-color:rgb(245, 245, 245);
            }
            body, .form-control{
                font-size:12px!important;
            }
            .floatRight{
                float:right;
                margin-right: 18px;
            }
            .has-error{
                color:red;
            }
            .formcontainer{
                background-color: #DAE8E8;
                padding: 20px;
            }
            .tablecontainer{ 
                padding-left: 20px;
            }
            .generic-container {
                width:80%;
                margin-left: 10%;
                margin-top: 20px;
                margin-bottom: 20px;
                padding: 20px;
                background-color: #EAE7E7;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-shadow: 0 0 10px #A4A4A4;
            }
            .custom-width {
                width: 80px !important;
            }
            .tdn a{text-decoration: none;}
            .nav-tabs>li.active>a,
            .nav-tabs>li.active>a:hover,
            .nav-tabs>li.active>a:focus {
                color: #555;
                background-color: #F2F2F2;
                border: 1px solid #eee;
                border-bottom-color: transparent;
                cursor: default
            }
            .header{
                display:block;
                height:50px;
                position:relative;
                background: #50a3a2;
                background: -webkit-linear-gradient(top left, #50a3a2 0%, #53e3a6 100%);
                background: linear-gradient(to bottom right, #50a3a2 0%, #53e3a6 100%);
                width:100%;
            }
        </style>
    </head>

    <body>
        <nav class="navbar navbar-default" role="navigation">            
            <div class="container">

                <div class="navbar-collapse" uib-collapse="vm.isNavbarCollapsed" ng-switch="vm.isAuthenticated()">

                    <ul class="nav navbar-nav navbar-right">
                        <li ui-sref-active="active">
                            <a ui-sref="home" href="${pageContext.request.contextPath}/">
                                <span class="glyphicon glyphicon-home"></span>
                                <span class="hidden-sm">Home</span>
                            </a>
                        </li>

                        <li   class="dropdown pointer">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="" id="account-menu">
                                <span>
                                    <span class="glyphicon glyphicon-user"></span>
                                    <span class="hidden-sm">
                                        Account
                                    </span>
                                    <b class="caret"></b>
                                </span>
                            </a>
                            <ul class="dropdown-menu" role="menu" >
                                <li><a role="menuitem" tabindex="-1" href="#">HTML</a></li>
                                <li  ><a role="menuitem" tabindex="-1" href="#">CSS</a></li>
                                <li  ><a role="menuitem" tabindex="-1" href="#">JavaScript</a></li>
                                <li role="presentation" class="divider"></li>
                                <li><a role="menuitem" tabindex="-1" href='${pageContext.request.contextPath}/logout'>
                                        <span class="glyphicon glyphicon-log-out"></span>&nbsp; Log Out</a></li>

                            </ul>
                        </li>
                    </ul> 
                </div>
            </div>
        </nav>



    <center>
       <div class="generic-container">
            <div class="panel panel-default">
                <div class="panel-heading"><span class="lead">Update Birth Certificate Information </span></div>
                <div class="formcontainer">
        <f:form action="update.form" modelAttribute="id" class="form-horizontal">
            <table  class="table table-bordered">
                <input type="hidden" name="id" value="${birthRegistration.id}" />

              <div class="row">
                            <div class="form-group col-md-12">
                                <label class="control-label col-sm-4" for="memo">Memo No: MCHTI/Azim:/Birth/</label>
                                <div class="col-md-7">
                                    <input type="text" style="padding-left:10px;" name="memoNo" value="${birthRegistration.memoNo}" id="memoNo" class="form-control input-sm"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12 has-feedback">
                                <label class="control-label col-sm-4" >Date :</label>
                                <div class="col-md-3">
								
								 <input type="text" style="padding-left:10px;" name = "date" id="date" class="username form-control input-sm" value = "<fmt:formatDate value="${birthRegistration.date}" pattern="dd/MM/yyyy"/>"/>
								
                                                                         
                                    <span class="glyphicon glyphicon-calendar form-control-feedback icon-success" ></span>
                                </div>
                            </div>
                        </div>
						
						 <div class="row">
                            <div class="form-group col-md-12">
                                <label class="control-label col-sm-4" for="regNo">Registration No :</label>
                                <div class="col-md-7">
                                    <input type="text" style="padding-left:10px;" name="registrationNo" value="${birthRegistration.registrationNo}"  id="registrationNo" class="form-control input-sm"/>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12 has-feedback">
                                <label class="control-label col-sm-4">Name :</label>
                                <div class="col-md-4">
                                    <input type="text" style="padding-left:10px;" name="name" value="${birthRegistration.name}" id="name" class="username form-control input-sm"/>                  

                                </div>
                                <label class="control-label col-md-1" for="sex">Sex :</label>
                                <div class="col-md-2">
                                    <select class="form-control cursor-pointer" name="sex"  value="${birthRegistration.sex}" id="sex">
                                        <option value="Male"> Male</option>
                                        <option value="Female"> Female</option>
                                        <option value="Transgender">Transgender</option>
                                    </select>
                                </div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12 has-feedback">
                                 <label class="control-label col-sm-4" >Birth Date :</label>
                                <div class="col-md-3">
                                     <input type="text" style="padding-left:10px;" name = "dateOfBirth" id="dateOfBirth" class="username form-control input-sm" value = "<fmt:formatDate value="${birthRegistration.dateOfBirth}" pattern="dd/MM/yyyy"/>"/>                 
                                    <span class="glyphicon glyphicon-calendar form-control-feedback icon-success" ></span>
                                </div>
                                <label class="control-label col-sm-2" for="time">Time of Birth : </label>
                                <div class="col-md-2">
                                    <div class="clearfix">
                                        <div class="input-group clockpicker pull-center" data-placement="left" data-align="top" data-autoclose="true">
                                            <input type="text" name="timeOfBirth" value="${birthRegistration.timeOfBirth}" class="form-control" value="00:00">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-time"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="control-label col-sm-4" for="mothersName">Mother's Name : </label>
                                <div class="col-md-7">
                                    <input type="text" style="padding-left:10px;" name="mothersName" value="${birthRegistration.mothersName}" id="mothersName" class="form-control input-sm"/>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="control-label col-sm-4" for="nidMoth">NID No : </label>
                                <div class="col-md-7">
                                    <input type="text" style="padding-left:10px;" name="nidMoth" value="${birthRegistration.nidMoth}" id="nidMoth" class="form-control input-sm"/>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="control-label col-sm-4" for="fathersName">Father's Name : </label>
                                <div class="col-md-7">
                                    <input type="text" style="padding-left:10px;" name="fathersName" value="${birthRegistration.fathersName}" id="fathersName" class="form-control input-sm"/>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="control-label col-sm-4" for="nidFath">NID No : </label>
                                <div class="col-md-7">
                                    <input type="text" style="padding-left:10px;" name="nidFath" value="${birthRegistration.nidFath}" id="nidFath" class="form-control input-sm"/>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="control-label col-sm-4" for="presentAdd">Present Address : </label>
                                <div class="col-md-7">
                                   <textarea class="form-control" rows="5" name="presentAdd"><c:out value="${birthRegistration.presentAdd}"/></textarea>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="control-label col-sm-4" for="permanentAdd">Permanent Address : </label>
                                <div class="col-md-7">
                                    <textarea class="form-control" rows="5" name="permanentAdd"><c:out value="${birthRegistration.permanentAdd}"/></textarea>
                                </div>
                            </div> 
                        </div>

               
            </table>
			
			<div class="form-group">
                        <div class="row">
                            <div class="form-actions floatMiddle">
                                <button type="submit" class="btn btn-primary">
                                    <span class="fa fa-floppy-o fa-lg"></span> Update
                                </button>                           

                               
                            </div>
                        </div>
						 </div>
						
        </f:form>
    </center>

                </div>
            </div>
        </div>

    </nav>
    <script>
        jQuery(document).ready(function () {
            $("#date").css('cursor', 'pointer');
           jQuery('#date').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
            $("#dateOfBirth").css('cursor', 'pointer');
           jQuery('#dateOfBirth').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});

        });

        $('.clockpicker').clockpicker()
                .find('input').change(function () {
            console.log(this.value);
        });
        var input = $('#single-input').clockpicker({
            placement: 'bottom',
            align: 'left',
            autoclose: true,
            'default': 'now'
        });

        $('ul li a').click(function () {
            $('ul li.active').removeClass('active');
            $(this).closest('li').addClass('active');
        });
    </script>
</body>
</html>

<%@ include file="/WEB-INF/template/footerMinimal.jsp"%>