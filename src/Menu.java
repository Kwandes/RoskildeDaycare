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
                case 3:
                    createBeing();
                    break;
                case 4: //update user information (change or delete)
                    updateBeing();
                    break;
                case 5:
                    seePhoneNumbers();
                    break;
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
        printFormat(1, "Display information about people");
        printFormat(2, "Create a new user");
        printFormat(3, "Update user information");
        printFormat(4, "See phone numbers");

        int input = ScannerReader.scannerInt(1,4);

        int choice = -1; // -1 in case of input error, then we know if its input or not updated
        switch (input)
        {
            case 1: //see or search users
                screenNumber=2;
                break;
            case 2: //create a user
                screenNumber=3;
                break;
            case 3: //update being (edit / delete)
                screenNumber=4;
                break;
            case 4: //see phone numbers
                screenNumber=5;
                break;
        }
    }

    //region screenNumber = 2
    // see a list of all users or search for a specific
    private static void seeBeing()
    {
        decorationHeader("Display information about people");
        printFormat(1, "See a list of all information people by type");
        printFormat(2, "Search for a specific person's information");
        int input = ScannerReader.scannerInt(1,6);
        switch (input)
        {
            case 1: //see a list of all people of a specific type
                decorationHeader("See a list of all people by type");
                String tableName = ManageBeing.chooseTable();
                ManageBeing.seeBeing(tableName);
                break;
            case 2: //search for a user
                decorationHeader("Search for a specific person's information");
                ManageBeing.createSearchQuery( ManageBeing.chooseTable(),  ManageBeing.searchField());
                break;
        }
        returnToMainMenuOrQuit();
    }
    //region end

    public static void  createBeing()
    {
        decorationHeader("Create a new user");
        String query = ManageBeing.createQueryForAddBeing();
        if (query != null)
        {
            DBInteraction.updateDB(query);
        }
        returnToMainMenuOrQuit();
    }

    public static void updateBeing()
    {
        decorationHeader("Update user information");
        String query = ManageBeing.fullSearchBeing();
        if (query != null)
        {
            DBInteraction.updateDB(query);
        }
        returnToMainMenuOrQuit();
    }

    public static void seePhoneNumbers()
    {
        decorationHeader("See phone numbers"); //temp waiting for telephone class
        String table = ManagePhone.chooseTable();
        ManagePhone.seePhone(table);
        returnToMainMenuOrQuit();
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
