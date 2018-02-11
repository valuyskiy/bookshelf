<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="textarea" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/styles.css" type="text/css">
    <title>
        <c:if test="${book.id > 0}">
            Редактирование книги
        </c:if>
        <c:if test="${book.id == null}">
            Новая книга!
        </c:if>
    </title>
</head>
<body>
<table style="width: 50%; height: 100%; text-align: left; margin-left: auto; margin-right: auto; border-collapse:collapse;"
       border="0">
    <tbody>
    <tr>
        <td></td>
    </tr>
    <tr>
        <td>
            <c:if test="${book.id == null}">
                <b>Новая книга:</b>
            </c:if>
            <form:form method="POST" modelAttribute="book" action="${pageContext.request.contextPath}/save">
                <form:hidden path="id"/>
                <table class="showbook" border="0">
                    <tbody>
                    <tr>
                        <td>
                            <table style="width: 100%;" border="0">
                                <tr style="text-align: left; width: 20%;">
                                    <td>
                                        Автор:
                                    </td>
                                    <td>
                                        <c:if test="${book.id > 0}">
                                            <form:label path="author" maxlength="100" size="100"/><b>${book.author}</b>
                                            <form:hidden path="author"/>
                                        </c:if>
                                        <c:if test="${book.id == null}">
                                            <form:input path="author" maxlength="100" size="100"/>
                                            <form:errors path="author" cssClass="error"/>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Название:
                                    </td>
                                    <td>
                                        <form:input path="title" maxlength="100" size="100"/>
                                        <form:errors path="title" cssClass="error"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        Описание:
                                    </td>
                                    <td>
                            <textarea name="description" id="description" cols="95%"
                                      rows="3">${book.description}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ISBN:
                                    </td>
                                    <td>
                                        <form:input path="isbn" maxlength="20" size="20"/>
                                        <form:errors path="isbn" cssClass="error"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        Год издания:
                                    </td>
                                    <td>
                                        <form:input path="printYear" maxlength="4" size="20"/>
                                        <form:errors path="printYear" cssClass="error"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br>
                            <table style="width: 100%;">
                                <tr>
                                    <td style="text-align: center;">
                                        <form:button name="submit">Сохранить</form:button>
                                    </td>
                                    <td style="text-align: center;">
                                        <form>
                                            <button id="cancel" name="cancel" value="cancel" type="button"
                                                    onclick="history.back();">
                                                Отмена
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form:form>
            <br><br>
            <c:if test="${book.id > 0}">
                <a href="<c:url value="/delete/${book.id}"/>">Удалить книгу</a>
            </c:if>
        </td>
    </tr>
    <tr>
        <td></td>
    </tr>
    </tbody>
</table>
</body>
</html>
