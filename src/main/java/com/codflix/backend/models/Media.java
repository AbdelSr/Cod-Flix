package com.codflix.backend.models;

import com.codflix.backend.features.episode.EpisodeDao;
import com.codflix.backend.features.genre.GenreDao;

import java.util.*;

public class Media {
    private int id;
    private int genreId;
    private String title;
    private String type;
    private String status;
    private Date releaseDate;
    private String summary;
    private String trailerUrl;
    private int timeMinute;

    private GenreDao gd = new GenreDao();
    private EpisodeDao ed = new EpisodeDao();

    public Media(int id, int genreId, String title, String type, String status, Date releaseDate, String summary, String trailerUrl, int timeMinute) {
        this.id = id;
        this.genreId = genreId;
        this.title = title;
        this.type = type;
        this.status = status;
        this.releaseDate = releaseDate;
        this.summary = summary;
        this.trailerUrl = trailerUrl;
        this.timeMinute = timeMinute;
    }

    @Override
    public String toString() {
        return "Media{" +
                "id=" + id +
                ", genreId=" + genreId +
                ", title='" + title + '\'' +
                ", type='" + type + '\'' +
                ", status='" + status + '\'' +
                ", releaseDate=" + releaseDate +
                ", summary='" + summary + '\'' +
                ", trailerUrl='" + trailerUrl + '\'' +
                ", timeMinute='" + timeMinute + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGenreId() {
        return genreId;
    }

    public void setGenreId(int genreId) {
        this.genreId = genreId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    // The method compare the id of our genre with all id of the genre list from database and return the right name
    public String getGenre() {
        Genre genre = this.gd.getGenreById(this.genreId);

        if (genre != null)
            return genre.getName();

        return null;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    // Return only the year of the date
    public int getReleaseYear() {
        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Europe/Paris"));
        cal.setTime(releaseDate);
        int year = cal.get(Calendar.YEAR);
        return year;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getTrailerUrl() {
        return trailerUrl;
    }

    public void setTrailerUrl(String trailerUrl) {
        this.trailerUrl = trailerUrl;
    }

    public int getTimeMinute() {
        return timeMinute;
    }

    public boolean isTimeMinuteNotNull() {
        if (this.timeMinute == 0)
            return false;

        return true;
    }

    public String getStringTimeMinute() {
        int hours = ((int) this.timeMinute / 60);
        int minutes = this.timeMinute - (hours * 60);

        if (hours == 0) {
            if (minutes < 10)
                return "0" + minutes + "mn";

            return "0" + minutes + "mn";
        }

        if (minutes < 10)
            return hours + "h" + "0" + minutes;

        return hours + "h" + minutes;
    }

    public void setTimeMinute(int timeMinute) {
        this.timeMinute = timeMinute;
    }

    // Return the list of all episodes if it's a serie ordered by seasons
    public LinkedHashMap<Integer, ArrayList<Episode>> getEpisodes() {

        LinkedHashMap<Integer, ArrayList<Episode>> lhm = new LinkedHashMap<Integer, ArrayList<Episode>>();
        ArrayList<Episode> episodes = this.ed.getEpisodeByMediaId(this.id);

        for (Episode episode : episodes) {
            if (lhm.get(episode.getSeason()) == null) {
                ArrayList<Episode> newListeEpisodes = new ArrayList<Episode>();
                newListeEpisodes.add(episode);
                lhm.put(episode.getSeason(), newListeEpisodes);

            } else {
                ArrayList<Episode> listeEpisodes = lhm.get(episode.getSeason());
                listeEpisodes.add(episode);
            }
        }

        return lhm;
    }

    public boolean isSerie() {
        if (this.type.equals("serie"))
            return true;

        return false;
    }

    // Return the duration of all episodes from all seasons combined
    public String getAllEpisodesDurationHours() {

        ArrayList<Episode> episodes = this.ed.getEpisodeByMediaId(this.id);
        int duration = 0;

        for (Episode episode : episodes) {
            if (episode != null)
                duration += episode.getTimeMinute();
        }

        int hours = ((int) duration / 60);
        int minutes = duration - (hours * 60);

        if (hours == 0) {
            if (minutes < 10)
                return "0" + minutes + "mn";

            return "0" + minutes + "mn";
        }

        if (minutes < 10)
            return hours + "h" + "0" + minutes;

        return hours + "h" + minutes;
    }
}

