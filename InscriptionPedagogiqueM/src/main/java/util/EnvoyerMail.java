package util;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EnvoyerMail {

    public static void envoyer(String destinataire, String sujet, String messageHtml) throws MessagingException {
        final String expediteur = "tonemail@gmail.com"; // à remplacer
        final String motDePasse = "tonMotDePasseApp"; // mot de passe d'application

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(expediteur, motDePasse);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(expediteur));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinataire));
        message.setSubject(sujet);
        message.setContent(messageHtml, "text/html; charset=utf-8");

        Transport.send(message);
    }
}
