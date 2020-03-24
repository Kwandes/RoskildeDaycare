import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class ManageTelephone {

    public static ResultSet getQueryResultSet(String query){
        // call the DB and get results
        return DBInteraction.getData(query);
    }

    //return a table with all the information about one of the human being table
    public static void showResultSetOfTelephone(String query,String tableName)
    {
        ResultSet rs = getQueryResultSet(query); //getting ResultSet from the DB
        System.out.println("Phonenumber");
        System.out.println("_________________________________________________________________");
        try{
            while(rs.next()){ //iterating throw the resultSet and print it out
                System.out.printf("%-7s%-20s%-20s%1s\n", rs.getString("phone_number") + (rs.getString("parent_id") +
                        (rs.getString("employee_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void seeTelephone(String tableName)
    {
        String query = "SELECT "+ tableName+"partent_id," + tableName + "employee_id," + tableName +"phone_number FROM roskilde_daycare."+tableName; //create a query to the DB
        showResultSetOfTelephone(query, tableName);
    }

    public static void createQueryForAddTelephone() {
        //collecting requirement for any kind of human being
        System.out.println("please type phone number");
        String phoneNumber = ScannerReader.scannerWords();

        //start to create the values part of the query
        String query = " VALUES ('" + phoneNumber + "')";
    }

    public static String searchField()
    {
        //user will choose the field to search in
        System.out.println("What would you like to search by?\n" +
                "[1] First Name\n"+
                "[2] Last Name\n" +
                "[3] birth Date\n" +
                "[4] CPR");
        int userInput = ScannerReader.scannerInt(1,4);
        switch (userInput){
            case 1:
                return "first_name";
            case 2:
                return "last_name";
            case 3:
                return "birth_date";
            case 4:
                return "cpr";
            default:
                System.out.println("something went wrong");
                return null;
        }
    }

    public static String createSearchQuery(String tableName, String searchField)
    {
        String selectQuery = "SELECT "+ tableName+"phone_number FROM roskilde_daycare."+tableName;
        System.out.println("type your search");
        String userInput = ScannerReader.scannerAll();
        String whereQuery = " WHERE " +searchField +" = '" + userInput+"'";
        String query = selectQuery+whereQuery;
        showResultSetOfTelephone(query,tableName);
        return query;
    }

    public static int chooseTelephoneFromSearchResult(String query, String tableName)
    {
        System.out.println("which one would you like to change? ");
        ResultSet rs = getQueryResultSet(query);
        int i = 1;
        try {
            while (rs.next()) {
                System.out.println(" ["+i+"] " + (rs.getString("phone_number")));
                i++;
            }
            System.out.println("[0] for cancel ");
            int userInput = ScannerReader.scannerInt(0,i);
            rs.absolute(userInput);
            int id = rs.getInt(tableName+"_id");System.out.println(id);
            return id;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static String searchInTelephoneTable()
    {
        String tableName = chooseTable();
        String field = searchField();
        String query = createSearchQuery(tableName,field);
        int phoneNumberForUpdate = chooseTelephoneFromSearchResult(query,tableName);
        System.out.println("phonenumber" + phoneNumberForUpdate);
        return phoneNumberForUpdate +" "+ tableName;
    }

