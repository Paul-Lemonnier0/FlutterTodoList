package com.example.flutterappbackend;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;

@Document("TodoItem")
public class TodoItem {
    @Id
    private String id;
    private String title;
    private Date creationDate;
    private boolean isDone;

    public TodoItem(String id, String title) {
        this.id = id;
        this.title = title;
        this.creationDate = new Date();
        this.isDone = false;
    }

    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public boolean getIsDone() {
        return isDone;
    }

    public void setIsDone(boolean isDone) {
        this.isDone = isDone;
    }
}