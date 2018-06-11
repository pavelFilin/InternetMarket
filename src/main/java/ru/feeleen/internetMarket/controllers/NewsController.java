package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.feeleen.internetMarket.entities.News;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.helpers.ErrorHelpers.ControllerUtils;
import ru.feeleen.internetMarket.repositories.NewsRepository;
import ru.feeleen.internetMarket.services.NewsService;

import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("news")
public class NewsController {
    @Autowired
    private NewsRepository newsRepository;
    @Autowired
    private NewsService newsService;

    @GetMapping
    public String getNews(Model model) {

        model.addAttribute("news", newsService.findAllByOrderByDateCreatedDesc());
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
                          @RequestParam("file") MultipartFile file,
                          @Valid News news,
                          BindingResult bindingResult,
                          Model model
    ) throws IOException {
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("news", news);
            return "addnews";
        } else {
            News newNews = newsService.add(news.getTitle(), news.getText(), user, file);
            model.addAttribute("news", newNews);
            return "redirect:/news/" + newNews.getId();
        }
    }

    @PostMapping("newsedit/{news}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String editNews(@PathVariable News news,
                           @RequestParam String title,
                           @RequestParam String text,
                           @RequestParam("file") MultipartFile file) throws IOException {
        newsService.updateNews(news, title, text ,file);
        return "redirect:/news/" + news.getId();
    }
}
