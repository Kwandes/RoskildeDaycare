/*
    Class responsible for connecting and receiving information from a database.
    Dependency used: jdbc-connector.jar. It has to be download and added. Put it in a ./lib/ dir
    Created by: Jan
 */

import java.sql.*;

public class DBInteraction
{
    //region Class variables for DB connection
    private static String url = "jdbc:mysql://*/";
    private static String user = "user";
    private static String passwd = "password";
    //endregion

    // takes a Select query and returns a ResultSet (RowSet interface)
    // Doesn't work with Insert, Update and Delete statements, only things that return actual data
    public static ResultSet getData(String query)
    {
        try
        {
            // connection setup
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, passwd);
            Statement st = con.createStatement();
            // execute query and get the data back as a ResultSet
            ResultSet rs = st.executeQuery(query);
            return rs;

        } catch (SQLException | ClassNotFoundException e)
        {
            // temporary printout, ideally DBInteraction doesn't have any console printouts
            System.out.println(e);
        }
        // if there was an exception the ResultSet will be empty
        return null;
    }

    // takes any non-Select query
    // returns the amount of rows affected (as an int)
    // 0 indicates that there was no data returned
    public static int updateDB(String query)
    {
        try
        {
            // connection setup
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, passwd);
            Statement st = con.createStatement();
            // execute query and get number of rows affected as an int
            int result = st.executeUpdate(query);

            return result;

        } catch (SQLException | ClassNotFoundException e)
        {
            // temporary printout, ideally DBInteraction doesn't have any console printouts
            System.out.println(e);
        }
        return 0;
    }

    //region getters and setters
    public static void setUrl(String url)
    {
        // normalise the url to be jdbc-compatible
        DBInteraction.url = "jdbc:mysql://" + url + "/";
    }

    public static String getUrl()
    {
        return url;
    }

    public static void setUser(String user)
    {
        DBInteraction.user = user;
    }

    public static String getUser()
    {
        return user;
    }

    public static void setPasswd(String passwd)
    {
        DBInteraction.passwd = passwd;
    }

    public static String getPasswd()
    {
        return passwd;
    }
    //endregion
}
