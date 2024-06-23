<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.kitap.kitapatlasi.dao.UserDaoImplementation" %>
<%@ page import="com.kitap.kitapatlasi.entity.User" %>

<%
    // UserID parametresini al
    int userId = Integer.parseInt(request.getParameter("userId"));

    // Kullanıcıyı oluştur ve sil
    UserDaoImplementation userDao = new UserDaoImplementation();
   // Assuming setUserID method exists in User class

    boolean deleteSuccessful = userDao.deleteUser(userId);

    // Silme işlemi başarılıysa musteriyonetim.jsp'ye yönlendir
    if (deleteSuccessful) {
        response.sendRedirect("musteriyonetim.jsp?delete=success");
    } else {
        response.sendRedirect("musteriyonetim.jsp?delete=fail");
    }
%>
