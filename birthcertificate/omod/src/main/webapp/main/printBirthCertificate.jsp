<%-- 
    Document   : printBirthCertificate
    Created on : Nov 24, 2016, 12:00:44 PM
    Author     : Khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/headerMinimal.jsp"%>
<%@ include file="../includes/js_css.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
    .bs-example{
    	margin: 20px;
    }

 table, th, td 
            {
                border: 1px solid black;
          
         }
            table, tr, td 
            {
                border: 1px solid black;
               
            }
			
			
				td{
					width:750px;
					}
			h2{
					
       width:80%;
        margin-left:10%;
        margin-top: 10px;
		color:green;
		font-family:Arival;
		margin-bottom: 10px;
        padding: 20px;
        background-color: #EAE7E7;
        border: 25px solid silver	;
        border-radius: 16px;
        box-shadow: 0 0 20px #A4A4A4;			
				
			}


    .tdn a{text-decoration: none;
    }
    .generic-container {
        width:80%;
        margin-left:10%;
        margin-top: 20px;
        margin-bottom: 20px;
        padding: 40px;
        background-color: #EAE7E7;
        border: 35px solid #ddd;
        border-radius: 16px;
        box-shadow: 0 0 20px #A4A4A4;

    }
 
    .spaceButton a{
        margin: 10px;
        text-decoration: none;
    }
</style>

<script>
    if (SESSION.checkSession()) {
        jQuery(document).ready(function () {

        });
    }
</script>



<script>
    $(function () {
        $('#myModal').modal(options);
    });
</script>

<nav class="navbar navbar-default tdn" role="navigation">            
    <div class="container">
        <div class="navbar-collapse" uib-collapse="vm.isNavbarCollapsed" ng-switch="vm.isAuthenticated()">
            <ul class="nav navbar-nav navbar-right">
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
                        <li> <a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/"> <span class="glyphicon glyphicon-home"></span>
                                <span class="hidden-sm">Home</span></a></li>

                        <li role="presentation" class="divider"></li>
                        <li><a role="menuitem" tabindex="-1" href='${pageContext.request.contextPath}/logout'>
                                <span class="glyphicon glyphicon-log-out"></span>&nbsp; Log Out</a></li>

                    </ul>
                </li>
            </ul> 
        </div>
    </div>
</nav> 

<div class="container">
    <h2><center><b>Birth Certificate Information</b></center></h2>

	
	
        <table class="table table-bordered">

        <tr>
            <th>Memo No </th>
            <td>${birthRegistration.memoNo}</td>
        </tr>



        <tr>
            <th>Issue Date </th>
            <td><fmt:formatDate value="${birthRegistration.date}" pattern="dd/MM/yyyy"/></td>
        </tr>



        <tr>
            <th>Registration No </th>
            <td>${birthRegistration.registrationNo}</td>
        </tr>


        <tr>
            <th>Patient Name </th>
            <td>${birthRegistration.name}</td>
        </tr>

        <tr>
            <th>Gender </th>
            <td>${birthRegistration.sex}</td>
        </tr>

        <tr>
            <th>Birth Date </th>
            <td><fmt:formatDate value="${birthRegistration.dateOfBirth}" pattern="dd/MM/yyyy"/></td>
        </tr>

        <tr>
            <th>Birth Time </th>
            <td>${birthRegistration.timeOfBirth}</td>

        </tr>

        <tr>
            <th>Mother Name </th>
            <td>${birthRegistration.mothersName}</td>
        </tr>

        <tr>
            <th>Mother National ID </th>
            <td>${birthRegistration.nidMoth}</td>
        </tr>

        <tr>
            <th>Father Name </th>
            <td>${birthRegistration.fathersName}</td>
        </tr>

        <tr>
            <th>Father National ID </th>
            <td>${birthRegistration.nidFath}</td>
        </tr>

        <tr>
            <th>Present Address  </th>
            <td>${birthRegistration.presentAdd}</td>
        </tr>

        <tr>
            <th>Permanent Address </th>
            <td>${birthRegistration.permanentAdd}</td>
        </tr>

       

    </table>
    <div class="spaceButton">
        <button class="btn btn-success" value="Print" onClick="printDiv3();"> Print  <i class="fa fa-print" aria-hidden="true"></i></button>

        <a class="btn btn-primary" href="edit.form?id=${birthRegistration.id}"><span style="color:#fff;"> Edit <i class="fa fa-pencil-square-o" aria-hidden="true"></i> </span></a>
        <a class="btn btn-danger" href="remove.form?id=${birthRegistration.id}" id="myModal"><span style="color:#fff;"> Delete <i class="fa fa-times" aria-hidden="true"></i>
            </span></a>
    </div>

</div>
</div>
</table>
</div>


<script>
    function printDiv3() {
        var printer = window.open('left=0', 'top=0', 'width=300,height=300');
        printer.document.open("text/html");
        printer.document.write(document.getElementById('printDiv').innerHTML);
        printer.print();
        printer.document.close();
        printer.window.close();
        jQuery("#billPrint").submit();
        // window.location = "directbillingqueue.form";
    }
</script>

</table>
<div id="printDiv" style="">

    <table>
        <tr>
            <td colspan="2" style="cellspacing:0; margin:0;"></td>
            <td colspan="1">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <b>${birthRegistration.memoNo}</b>
            </td>
            <td colspan="1">
                <b style="font-size:15px;"><fmt:formatDate value="${birthRegistration.date}" pattern="dd/MM/yyyy"/></b>
            </td>
        </tr>
        <br>
        <tr>
            <td colspan="1"></td>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <b style="font-size:15px;">${birthRegistration.registrationNo}</b>
            </td>
        </tr>
        <br>
        <tr>
            <td colspan="1"></td>
            <td colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <b>${birthRegistration.name}</b>
            </td>

            <td colspan="1">
                &nbsp;&nbsp;&nbsp;
                <b> ${birthRegistration.sex}</b>
            </td>
        </tr>
        <br>
        <tr>
            <td colspan="1"></td>
            <td colspan="1">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <b><fmt:formatDate value="${birthRegistration.dateOfBirth}" pattern="dd/MM/yyyy"/></b>
            </td>
            <td colspan="1"></td>
            <td colspan="1">
                <b> ${birthRegistration.timeOfBirth}</b>
            </td>
        </tr>
        <br>
        <tr>
            <td colspan="1"></td>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-size:15px; font-weight:bold;"> ${birthRegistration.mothersName}</span>
            </td>
        </tr>
        <br>
        <tr>
            <td colspan="1"></td>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-size:15px; font-weight:bold;"> ${birthRegistration.nidMoth}</span>
            </td>
        </tr>
        <br>
        <tr>
            <td colspan="1"></td>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-size:15px; font-weight:bold;"> ${birthRegistration.fathersName}</span>
            </td>
        </tr>
        <br>
        <tr>
            <td colspan="1"></td>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-size:15px; font-weight:bold;"> ${birthRegistration.nidFath}</span>
            </td>
        </tr>
        <br>
        <tr>
            <td colspan="1"></td>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-size:15px; font-weight:bold;"> ${birthRegistration.presentAdd}</span>
            </td>
        </tr>
        <br><br>
        <tr>
            <td colspan="1"></td>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span style="font-size:15px; font-weight:bold;"> ${birthRegistration.permanentAdd}</span>
            </td>
        </tr>
       
    </table>  

</div>


