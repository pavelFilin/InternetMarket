package ru.feeleen.internetMarket.entities;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Calendar;
import java.util.Date;

import static javax.persistence.TemporalType.TIMESTAMP;

@Entity
@Table(name = "news")
public class News {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @Column(name = "title", nullable = false)
    @NotBlank(message = "Не может быть пустым")

    private String title;

    @Column(name = "text", nullable = false)
    @NotBlank(message = "Не может быть пустым")
    private String text;

    @Column(name = "imageURL")
    private String imageUrl;

    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "user_id")
    private User user;


    @Column(name = "date_created")
    @Temporal(TIMESTAMP)
    private Date dateCreated;


    public News() {
    }

    public News(String title, String text, User user) {
        this.title = title;
        this.text = text;
        this.user = user;
        dateCreated = new Date(Calendar.getInstance().getTimeInMillis());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }



    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }
}
