package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.feeleen.internetMarket.entities.News;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.repositories.NewsRepository;
import ru.feeleen.internetMarket.services.NewsService;

import java.io.IOException;

@Controller
@RequestMapping("news")
public class NewsController {
    @Autowired
    private NewsRepository newsRepository;
    @Autowired
    private NewsService newsService;

    @GetMapping
    public String getNews(Model model) {

        model.addAttribute("news", newsRepository.findAll());
        return "news";
    }

    @GetMapping("{news}")
    public String getNewsView(@PathVariable News news, Model model) {
        model.addAttribute("news", news);
        return "newsview";
    }

    @GetMapping("addnews")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String getAddNews(Model model) {
        model.addAttribute("news", newsService.findAll());
        return "addnews";
    }

    @PostMapping("addnews")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String addNews(@AuthenticationPrincipal User user,
                          @RequestParam String title,
                          @RequestParam String text,
                          @RequestParam("file") MultipartFile file,
                          Model model
    ) throws IOException {
        News news = newsService.add(title, text, user, file);
        model.addAttribute("news", news);
        return "redirect:/news/" + news.getId();
    }
}
