/*
    Main menu which handles the user interface flow as well as majority of usage of DBInteraction class
    Created by: Jan
 */

import java.sql.ResultSet;
import java.sql.SQLException;

public class Menu {
    //region class variables
    private static final String decorationLines = "_________________________________________________________________";
    private static final String decorationSymbol = " ";

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
                case 2:
                    seeBeing();
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
        decorationHeader("Main Menu");
        int input = 2;
        switch (input)
        {
            case 2:
                System.out.println("You chose to create Beings");
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

    //region artsy

    // this adds a title separated by two lines, as declared by the final variable
    // its modifiable by the decoration* variables at declaration.
    public static void decorationHeader(String title)
    {
        System.out.println(decorationLines);
        int decorationLength = decorationLines.length()/2;
        int titleLength = title.length()/2;
        int spacerLength = decorationLength-titleLength;

        for(int i =0; i < spacerLength; i++)
        {
            System.out.print(decorationSymbol);
        }
        System.out.print(title);

        for(int i =0; i < spacerLength; i++)
        {
            System.out.print(decorationSymbol);
        }
        System.out.println();
        System.out.println(decorationLines);
    }





}
