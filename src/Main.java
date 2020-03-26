/*
    This project is a project for Kea for SWC, SWD and ITO subjects.
    It combines Java and SQL using the JDBC connector driver
    Made by: jan
 */

public class Main
{

    public static void main(String[] args)
    {
        // prepare the DB for usage
        dbSetup();
        securitySetup();

        // launch the actual user interface
        Menu.display();
    }

    // setup the DB connection information and credentials
    public static void dbSetup()
    {
        DBInteraction.setUrl("minecraft.net");
        DBInteraction.setUser("user");
        DBInteraction.setPasswd("passwd");
    }

    public static void securitySetup()
    {
        Security.setKey("secretKeyForEncryptingData");
    }
}
