package com.codflix.backend.features.episode;

import com.codflix.backend.core.Database;
import com.codflix.backend.models.Episode;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class EpisodeDao {

    public List<Episode> getAllEpisodes() {
        List<Episode> episodes = new ArrayList<>();

        Connection connection = Database.get().getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM episode ORDER BY release_date DESC");
            while (rs.next()) {
                episodes.add(mapToEpisode(rs));
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }

        return episodes;
    }

    public ArrayList<Episode> getEpisodeByMediaId(int id) {
        ArrayList<Episode> episodes = new ArrayList<Episode>();

        Episode episode = null;

        Connection connection = Database.get().getConnection();

        ResultSet rs = null;
        String requete = "SELECT * FROM episode WHERE media_id=" + id;

        try {
            Statement stmt = connection.createStatement();
            rs = stmt.executeQuery(requete);

            while (rs.next()) {
                episode = mapToEpisode(rs);
                episodes.add(episode);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }

        return episodes;
    }

    // Return the next episode of the serie
    public Episode getNextEpisode(Episode myEpisode) {
        Episode episode = null;

        if (myEpisode != null) {

            int media_id = myEpisode.getMediaId();
            int season = myEpisode.getSeason();
            int numEpisode = myEpisode.getEpisodeNumber() + 1;

            Connection connection = Database.get().getConnection();

            ResultSet rs = null;
            String requete = "SELECT * FROM episode WHERE media_id=" + media_id + " AND season=" + season + " AND num_episode=" + numEpisode;

            try {
                Statement stmt = connection.createStatement();
                rs = stmt.executeQuery(requete);

                if (rs.next()) {
                    episode = mapToEpisode(rs);

                } else {
                    requete = "SELECT * FROM episode WHERE media_id=" + media_id + " AND season>" + season + " ORDER BY season ASC, num_episode ASC LIMIT 1";

                    stmt = connection.createStatement();
                    rs = stmt.executeQuery(requete);

                    if (rs.next()) {
                        episode = mapToEpisode(rs);
                    }
                }
            } catch (SQLException | ParseException e) {
                e.printStackTrace();
            }
        }

        return episode;
    }

    // Return the previous episode of the serie
    public Episode getPreviousEpisode(Episode myEpisode) {
        Episode episode = null;

        if (myEpisode != null) {

            int media_id = myEpisode.getMediaId();
            int season = myEpisode.getSeason();
            int numEpisode = myEpisode.getEpisodeNumber() - 1;

            Connection connection = Database.get().getConnection();

            ResultSet rs = null;
            String requete = "SELECT * FROM episode WHERE media_id=" + media_id + " AND season=" + season + " AND num_episode=" + numEpisode;

            try {
                Statement stmt = connection.createStatement();
                rs = stmt.executeQuery(requete);

                if (rs.next()) {
                    episode = mapToEpisode(rs);

                } else {
                    requete = "SELECT * FROM episode WHERE media_id=" + media_id + " AND season<" + season + " ORDER BY season DESC, num_episode DESC LIMIT 1";

                    stmt = connection.createStatement();
                    rs = stmt.executeQuery(requete);

                    if (rs.next()) {
                        episode = mapToEpisode(rs);
                    }
                }
            } catch (SQLException | ParseException e) {
                e.printStackTrace();
            }
        }

        return episode;
    }

    public Episode getEpisodeById(int id) {
        Episode episode = null;

        Connection connection = Database.get().getConnection();
        try {
            PreparedStatement st = connection.prepareStatement("SELECT * FROM episode WHERE id=?");

            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                episode = mapToEpisode(rs);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }

        return episode;
    }

    private Episode mapToEpisode(ResultSet rs) throws SQLException, ParseException {
        return new Episode(
                rs.getInt(1), // id
                rs.getInt(2), // media_id
                rs.getString(3), // title
                rs.getInt(4), // season
                rs.getInt(5), // episodeNumber
                rs.getInt(6), // timeMinute
                rs.getString(7), // summary
                rs.getString(8) // trailer_url
        );
    }
}
