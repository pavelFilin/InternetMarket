package ru.feeleen.internetMarket.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.feeleen.internetMarket.entities.News;

public interface NewsRepository extends CrudRepository<News, Long> {
}
