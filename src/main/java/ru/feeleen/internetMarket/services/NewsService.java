package ru.feeleen.internetMarket.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import ru.feeleen.internetMarket.entities.News;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.helpers.fileHelpers.FileHelper;
import ru.feeleen.internetMarket.repositories.NewsRepository;

import java.io.IOException;
import java.util.List;

@Service
public class NewsService {
    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private NewsRepository newsRepository;
    public Iterable<News> findAll(){
     return newsRepository.findAll();
    }

    public News add(String title, String text, User user, MultipartFile file) throws IOException {
        News news = new News(title, text, user);
        news.setImageUrl(FileHelper.loadFile(file, uploadPath));
        newsRepository.save(news);
        return news;
    }

    public News updateNews(News news, String title, String text, MultipartFile file) throws IOException {
        if (!StringUtils.isEmpty(title)){
            news.setTitle(title);
        }

        if (!StringUtils.isEmpty(text)){
            news.setText(text);
        }

        String path = FileHelper.loadFile(file, uploadPath);
        if (!StringUtils.isEmpty(path)) {
            news.setImageUrl(path);
        }

        newsRepository.save(news);
        return news;
    }

    public List<News> findAllByOrderByDateCreatedDesc() {
        return newsRepository.findAllByOrderByDateCreatedDesc();
    }
}
