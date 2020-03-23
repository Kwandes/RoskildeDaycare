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
        // Example Insert using the update(query) method
        System.out.println(DBInteraction.updateDB(
                "INSERT INTO roskilde_daycare.child(first_name, last_name, birth_date, cpr, special_request, is_waiting, signup_date)\n" +
                        "VALUES ('Barbara', 'Spencer', '1420-06-09', 'wesrdtcfyuvgibuhniojmolkæ4', 'Corona', FALSE,\n" +
                        "        '2020-01-01 11:11:11');"));

        // Example select using the getData(query) method
        ResultSet rs = DBInteraction.getData("SELECT * FROM roskilde_daycare.child");

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
