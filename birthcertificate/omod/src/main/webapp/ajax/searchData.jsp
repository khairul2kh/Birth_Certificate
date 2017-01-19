<%-- 
    Document   : searchData
    Created on : Jan 10, 2017, 6:03:49 PM
    Author     : Manjarul
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="../includes/js_css.jsp"%> 

<table class="table table-bordered table-hover" style="cursor:pointer;">
    <thead>
        <tr > 
            <th> # </th>
            <th> Registration No </th>
            <th> Name </th>
            <th> Gender </th>
            <th> Father's Name </th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listBirth}" var="b" varStatus="index">
            <tr onclick="edit(${b.id})">
                <td>${index.count}</td>
                <td>${b.registrationNo}</td>
                <td>${b.name}</td>
                <td>${b.sex}</td>
                <td>${b.fathersName}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
