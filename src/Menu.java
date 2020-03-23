/*
    Main menu which handles the user interface flow as well as majority of usage of DBInteraction class
    Created by: Jan
 */

import java.sql.ResultSet;
import java.sql.SQLException;

public class Menu
{
    //region class variables
    private static int screenNumber = 1;
    private static String title = "Roskilde Daycare Project";
    //endregion

    public static void display()
    {
        while (true)
        {
            switch (screenNumber)
            {
                case 1:
                    starterScreen();
                    break;
                case 99:
                    return;
                default:
                    return;
            }
        }
    }

    // starter screen for the user
    // screenNumber = 1
    private static void starterScreen()
    {
        System.out.println("Hey I am main menu");
        int input = 2;
        switch (input)
        {
            case 2:
                System.out.println("You chose to see Beings");
                screenNumber = 2;
                break;
            default:
                System.out.println("Exiting out, bye");
                screenNumber = 99;
                break;
        }
    }

    // see being description
    // screenNumber = 2
    private static void seeBeing()
    {
        System.out.println("I want your phone");
        ManageBeing.createQueryForAddBeing();

        int input = 1;
        switch (input)
        {
            case 1:
                System.out.println("k going back to main menu");
                screenNumber = 1;
                break;
            default:
                System.out.println("Exiting out, bye");
                screenNumber = 99;
                break;
        }
    }
}
