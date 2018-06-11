package ru.feeleen.internetMarket.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.feeleen.internetMarket.entities.News;

import java.util.List;

public interface NewsRepository extends CrudRepository<News, Long> {
    List<News> findAllByOrderByDateCreatedDesc();
}
