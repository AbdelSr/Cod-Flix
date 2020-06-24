package com.codflix.backend.features.genre;

import com.codflix.backend.core.Template;
import com.codflix.backend.features.media.MediaDao;
import com.codflix.backend.models.Genre;
import com.codflix.backend.models.Media;
import spark.Request;
import spark.Response;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GenreController {

    private final GenreDao genreDao = new GenreDao();

    public String list(Request request, Response response) {
        List<Genre> genres = genreDao.getAllGenres();

        Map<String, Object> model = new HashMap<>();
        model.put("genres", genres);
        return Template.render("genre_list.html", model);
    }

    public String detail(Request request, Response res) {
        int id = Integer.parseInt(request.params(":id"));

        MediaDao mediaDao = new MediaDao();
        Media media = mediaDao.getMediaById(id);

        if (media != null) {
            int id_genre = media.getGenreId();
            Genre genre = genreDao.getGenreById(id_genre);

            Map<String, Object> model = new HashMap<>();

            model.put("genre", genre);
            return Template.render("media_detail.html", model);
        }

        return null;
    }
}
