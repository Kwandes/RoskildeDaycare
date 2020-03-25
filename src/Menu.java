/*
    Main menu which handles the user interface flow as well as majority of usage of DBInteraction class
    Created by: Jan
 */

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

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
        printFormat(1, "Show a list of people");
        printFormat(2, "Create a new user");
        printFormat(3, "Update user information");

        int input = ScannerReader.scannerInt(1,6);

        int choice = -1;
        switch (input)
        {
            case 1:
                printFormat(1, "See a list of all people by type");
                printFormat(2, "Search for a specific person");
                input = ScannerReader.scannerInt(1,6);
                switch (input)
                {
                    case 1:
                        decorationHeader("See a list of all people by type");
                        String tableName = ManageBeing.chooseTable();
                        ManageBeing.seeBeing(tableName);
                        returnToMainMenuOrQuit();
                        break;
                    case 2:
                        String person = ManageBeing.searchInBeingTable();
                        //questionable return
                        returnToMainMenuOrQuit();
                        break;
                }

                //screenNumber = 2;
                break;
            case 2: //create a user
                decorationHeader("Create a new user");
                String query = ManageBeing.createQueryForAddBeing();
                DBInteraction.updateDB(query);
                returnToMainMenuOrQuit();
                break;
            case 3:
                decorationHeader("Update user information");
                //update user information
                returnToMainMenuOrQuit();
                break;
            case 4:
                decorationHeader("Delete a user");
                //delete a user method
                returnToMainMenuOrQuit();
                break;
            case 6:
                System.out.println("Good bye");
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

    public static void printFormat(int num, String text)
    {
        System.out.println("["+ num +"] " + text);
    }

    public static void returnToMainMenuOrQuit()
    {
        System.out.println("");
        System.out.println("what would you like to do next?");
        System.out.println("[1] Return to main menu");
        System.out.println("[2] Quit the program");
        int choice = ScannerReader.scannerInt(1, 2);
        switch (choice)
        {
            case 1:
                screenNumber = 1;
                break;
            case 2:
                screenNumber = 99;
                break;
        }
    }
}
