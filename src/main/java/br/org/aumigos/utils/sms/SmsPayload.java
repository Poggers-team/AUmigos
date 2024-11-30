package br.org.aumigos.utils.sms;

public class SmsPayload {

    private String sender;
    private String receivers;
    private String content;

    protected SmsPayload(String sender, String receivers, String content) {
        this.sender = sender;
        this.receivers = receivers;
        this.content = content;
    }
}
