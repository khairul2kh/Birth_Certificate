<%-- 
    Document   : main
    Created on : Nov 8, 2016, 12:28:03 AM
    Author     : Khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/headerMinimal.jsp"%>
<%@ include file="../includes/js_css.jsp"%> 

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


                width:60%;

                margin-top: 20px;
                margin-bottom: 20px;
                padding: 20px;
                background-color:  #d6e9c6 ;
                border: 3px solid #33e0ff;
                border-radius: 8px;
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

            .spaceButton a{
                margin: 10px;
                margin-left: 3%;
                text-decoration: none;
            }
        </style>
    </head>
    <script>
        if (SESSION.checkSession()) {
            jQuery(document).ready(function() {

            });
        }

        function getPatient() {
            var searchKey = jQuery("#searchKey").val();
            jQuery.ajax({
                type: "GET",
                url: getContextPath() + "/module/birthcertificate/serarchPatient.htm",
                data: ({
                    searchKey: searchKey
                }),
                success: function(data) {
                    jQuery("#searchResult").html(data);
                },
            });
        }
        ;
        function edit(id) {
            window.location.href = openmrsContextPath + "/module/birthcertificate/edit.form?id=" + id;
        }
    </script>
    <body ng-app  class="ng-cloak tdn">

        <nav class="navbar navbar-default" role="navigation">            
            <div class="container">

                <div class="navbar-header" style="padding-top:12px;">
                    <span> Welcome Mr./Ms. : ${u.person.givenName} ${u.person.middleName} ${u.person.familyName} </span>
                </div>
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

                                <li role="presentation" class="divider"></li>
                                <li><a role="menuitem" tabindex="-1" href='${pageContext.request.contextPath}/logout'>
                                        <span class="glyphicon glyphicon-log-out"></span>&nbsp; Log Out</a></li>

                            </ul>
                        </li>
                    </ul> 
                </div>
            </div>
        </nav>  

        <div class="container theme-showcase" role="main">
            <div class="panel panel-success">
                <div class="panel-heading">Birth Certificate </div>
                <div class="panel-body"> 

                    <div class="row">	

                        <div class="col-sm-4">
                            <a class="btn btn-info btn-lg" href="main.form"><span style="color:#fff;">  Add New  <i class="glyphicon glyphicon-user"></i> </span></a>
                        </div>

                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label" for="inputGroup">Search By Reg. No / Name </label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="searchKey" name="searchKey"
                                           placeholder="Please Enter Registration No. / Name"  />  

                                    <span class="input-group-addon btn btn-success" onClick="getPatient();" >
                                        <i class="fa fa-search" style="cursor:pointer;"></i>
                                    </span>
                                </div>
                            </div>								

                        </div>							 
                    </div><!-- /.row -->


                </div> <!-- panel end -->

            </div>

            <div id="searchResult" ></div>

        </div>
    </div>


    <!-- Patient Search Div -->
    <div class="col-sm-14" id="patientSearch" ng-show = "IsVisible">



    </div>
</div>  

</body>
</html>

<%@ include file="/WEB-INF/template/footerMinimal.jsp"%>