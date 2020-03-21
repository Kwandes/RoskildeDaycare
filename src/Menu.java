/*
    Main menu which handles the user interface flow as well as majority of usage of DBInteraction class
    Created by: Jan
 */

import java.sql.ResultSet;
import java.sql.SQLException;

public class Menu
{
    public static void display()
    {
        // call the DB and get results
        ResultSet rs = DBInteraction.sendQuery("SELECT * FROM roskilde_daycare.child");

        try
        {
            // iterate over the results and display the contents
            while (rs.next())
            {
                // resultSet consists of rows, with specific columns accessible with both a number and the column name
                System.out.println("ID: " + rs.getString("child_id") + " | " +
                        "Name: " + rs.getString("first_name") + " " +
                        rs.getString("last_name"));
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
