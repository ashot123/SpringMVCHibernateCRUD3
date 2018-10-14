<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Employee Page</title>
    <style type="text/css">
        .empTable {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .empTable2 {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .empTable th {
            font-family: Arial, sans-serif;
            font-size: 16px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 2px;
            overflow: hidden;
            word-break: normal;
            border-color: #9bc2e6;
            color: #000000;
            background-color: #5b9bd5;
        }

        .empTable td {
            font-family: Arial, sans-serif;
            font-size: 16px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #9bc2e6;
            color: rgba(0, 0, 0, 0.98);
            background-color: #ddebf7;
        }

        .empTable2 td {
            font-family: Arial, sans-serif;
            font-size: 16px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #9bc2e6;
            color: rgba(0, 0, 0, 0.98);
            background-color: #ddebf7;
        }

        .empTable .empTable-4eph {
            background-color: #C0C0C0
        }
    </style>
</head>
<body>

<c:if test="${empty employee.employeeId}">
    <h3>
        <spring:message code="AddEmployee"/>
    </h3>
</c:if>


<c:url var="addAction" value="/employee/add"/>

<form:form action="${addAction}" modelAttribute="employee">
    <table class="empTable2">
        <c:if test="${not empty employee.employeeId}">
            <h1><spring:message code="EditEmployee"/></h1>
            <tr>
                <td>
                    <form:label path="employeeId">
                        <spring:message code="EmployeeID"/>
                    </form:label>
                </td>
                <td>
                    <%--disabled="true" make 'id' as null--%>
                    <form:input path="employeeId" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="employeeId"/>
                    <%--disabled="true" is a litle bit not good view --%>
                    <%-- <form:input path="employeeId" readonly="true" size="8" cssStyle="background: lightgrey"/>--%>
                </td>
            </tr>
        </c:if>

        <tr>
            <td>
                <form:label path="firstName">
                    <spring:message code="FirstName"/>
                </form:label>
            </td>
            <td>
                <form:input path="firstName"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="lastName">
                    <spring:message code="LastName"/>
                </form:label>
            </td>
            <td>
                <form:input path="lastName"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="age">
                    <spring:message code="Age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="education">
                    <spring:message code="Education"/>
                </form:label>
            </td>
            <td>
                <form:input path="education"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="salary">
                    <spring:message code="Salary"/>
                </form:label>
            </td>
            <td>
                <form:input path="salary"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="submit"
                       value="<spring:message code="Submit"/>"/>
            </td>
        </tr>

    </table>
</form:form>
<br>

<c:if test="${not empty employeeList}">
    <h3><spring:message code="employeeList"/></h3>
    <table class="empTable">
        <tr>
            <th width="80">ID</th>
            <th width="120">First Name</th>
            <th width="120">Last Name</th>
            <th width="120">Age</th>
            <th width="120">Education</th>
            <th width="120">Salary</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>

        <c:forEach items="${employeeList}" var="employee">
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.firstName}</td>
                <td>${employee.lastName}</td>
                <td>${employee.age}</td>
                <td>${employee.education}</td>
                <td>${employee.salary}</td>
                <td><a href="<c:url value='/employee/edit/${employee.employeeId}' />">Edit</a></td>
                <td><a onclick="return confirm('Are you sure to delete this employee?')"
                       href="<c:url value='employee/remove/${employee.employeeId}' />">Delete</a></td>

            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
