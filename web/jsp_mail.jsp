<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%
	Properties propiedad = new Properties();
        propiedad.setProperty("mail.smtp.host", "smtp.gmail.com");
        propiedad.setProperty("mail.smtp.starttls.enable", "true");
        propiedad.setProperty("mail.smtp.port", "587");
        propiedad.setProperty("mail.smtp.auth", "true");
        propiedad.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        
        Session sesion = Session.getDefaultInstance(propiedad);
        
        String mensaje = request.getParameter("txtmensaje");
        String nombre = request.getParameter("txtnombre");
        String telefono = request.getParameter("txttelefono");
        String email = request.getParameter("txtemail");

        String correoEnvia = "veterinaria.huellitas.lmt@gmail.com";
        String contrasenia = "Grupo2WEB/";
        String asunto = "NOS QUIEREN CONTACTAR";  
        
        String mensajeFinal = "La persona "+nombre+" con numero de telefono "+telefono+" y correo "+ email+" se quiere poner en contacto con nosotros. Su mensaje es: "+mensaje;
        
        MimeMessage mail = new MimeMessage(sesion);
        
        mail.setFrom(new InternetAddress (correoEnvia));
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(correoEnvia));
            mail.setSubject(asunto);
            mail.setText(mensajeFinal);
            
            Transport transporte = sesion.getTransport("smtp");
            transporte.connect(correoEnvia,contrasenia);
            transporte.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));
            transporte.close();
%>



<html>
	<head>
		<title>Mensaje Enviado</title>
	</head>
	<body>
            
	</body>
</html>