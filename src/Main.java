/*
    This project is a project for Kea for SWC, SWD and ITO subjects.
    It combines Java and SQL using the JDBC connector driver
    Made by: jan
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Properties;

public class Main {

    public static void main(String[] args)
    {
        // prepare the program - setup the Database and Security secret key for encryption
        boolean setupSuccessful = Setup.setupProgram();

        // Only lunch actual UI if the setup was successful
        if (setupSuccessful)
        {
            // launch the actual user interface
            Menu.display();
        }
    }
}
