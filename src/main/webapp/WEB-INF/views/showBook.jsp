<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/styles.css" type="text/css">
    <title>${book.title}</title>
</head>
<body>

<table style="width: 60%; height: 100%; text-align: left; margin-left: auto; margin-right: auto; border-collapse:collapse;"
        border="0">
    <tbody>
    <tr>
        <td></td>
    </tr>
    <tr>
        <td>
            <table class="showbook">
                <tr>
                    <td style="width: 40%;">

                        <table style="width: 100%;" border="0"
                               cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <td style="vertical-align: top; width: 70%; padding: 10px;">
                                    <h2>${book.title}</h2>
                                    <h3>${book.author}</h3>
                                </td>
                                <td style="vertical-align:top; text-align: right; padding: 10px;">
                                    <p>ISBN: ${book.isbn}<br>
                                        Год издания: ${book.printYear}</p>
                                    ${!book.readAlready && !book.reading ? "<b>Новая книга</b>" : ""}
                                    ${book.reading ? "Книга отсутствует" : ""}
                                    ${book.readAlready && !book.reading ? "Книгу уже читали":""}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <p style="text-align: justify; padding: 10px;">${book.description}</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                        <table style="text-align: left; width: 100%;">
                            <tbody>
                            <tr>
                                <td style="width: 30%; text-align: center;">
                                    <c:if test="${!book.reading}">
                                        <a href="<c:url value="/edit/${book.id}"/>">Редактировать</a>
                                    </c:if>
                                    <c:if test="${book.reading}">
                                        Редактировать
                                    </c:if>
                                </td>
                                <td style="text-align: center;">
                                    <a href="<c:url value="/take/${book.id}"/>">
                                        ${book.reading ? "Вернуть книгу" : "Взять почитать"}
                                    </a>
                                </td>
                                <td style="width: 30%; text-align: center;">
                                    <a href="<c:url value="/books"/>">В каталог</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td></td>
    </tr>
    </tbody>
</table>

</body>
</html>
