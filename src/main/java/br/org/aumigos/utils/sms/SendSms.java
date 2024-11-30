package br.org.aumigos.utils.sms;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Properties;

public class SendSms {

    public void send(String receiver, String name) throws IOException, InterruptedException {
        Properties properties = new Properties();

        try (InputStream input = SendSms.class.getClassLoader().getResourceAsStream("config.properties")) {
            properties.load(input);
        }

        String authKey = properties.getProperty("AUTH-KEY");

        SmsPayload payload = new SmsPayload("AUmigos", receiver, "Muito obrigado por se voluntariar " +
                "a ONG AUmigos " + name + " :)\r\n" +
                "Entraremos em contato em breve!");

        Gson gson = new Gson();

        String payloadJson = gson.toJson(payload);

        var client = HttpClient.newHttpClient();

        var request = HttpRequest.newBuilder(
                URI.create("https://sms.comtele.com.br/api/v2/send"))
                .header("Content-Type", "application/json")
                .header("auth-key", authKey)
                .POST(HttpRequest.BodyPublishers.ofString(payloadJson))
                .build();

        var response = client.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println(response.statusCode());
    }
}
