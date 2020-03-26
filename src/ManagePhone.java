import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class ManagePhone {

    public static ResultSet getQueryResultSet(String query)
    {
        // call the DB and get results
        return DBInteraction.getData(query);
    }

    //return a table with all the information about one of the human being table
    public static void showResultSetOfPhone (String query, String tableName)
    {
        ResultSet rs = getQueryResultSet(query); //getting ResultSet from the DB
        System.out.printf("%-7s%-20s%-20s%1s\n", " Phone ID ", " Phone_number ", " Phone_type ", " Parent_ID ", "Employee_ID");
        System.out.println("_________________________________________________________________");
        try {
            while (rs.next()) { //iterating throw the resultSet and print it out
                System.out.printf("%-7s%-20s%-20s%1s\n", (rs.getString(tableName + "idphone")),
                        (rs.getString("phone_number") + " " +
                                rs.getString("phone_type")), rs.getString("parent_id"), rs.getString("employee_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //show all the being from a chosen table
    public static void seePhone (String tableName)
    {
        String query = "SELECT " + tableName + " idphone, phone_number , phone_type , parent_id , employee_id FROM roskilde_daycare." + tableName; //create a query to the DB
        showResultSetOfPhone(query, tableName);
    }

    // collecting the information from the user and return a query for the DB.
    public static String createQueryForAddPhone ()
    {
        //collecting requirement for any kind of human being
        String tableName = chooseTable();
        System.out.println("please type phonenumber");
        String phoneNumber = ScannerReader.scannerWords();

        //start to create the values part of the query
        String query = " VALUES ('" + phoneNumber + "', '";
        // collecting the rest of the requirement for specific table
        switch (tableName) {
            case "employee":
                return "INSERT INTO  roskilde_daycare." + tableName + " (phone_number)" +
                        query + "');"; //complete the query for employee
            case "parent":
                return "INSERT INTO roskilde_daycare." + tableName + " (phone_number)" +
                        query + "');"; //complete query for parent
            default:
                System.out.println("something went wrong...");
                return null;
        }
    }

    //method that the user can choose which table to operates on.
    public static String chooseTable ()
    {
        //user choose the table to operate on
        System.out.println("which group of being would you like to operate on:\n[1] Employee\n[2] Parent \n[3] Child");
        int userChoice = ScannerReader.scannerInt(1, 2);
        switch (userChoice) {
            case 1:
                return "employee";
            case 2:
                return "parent";
            default:
                System.out.println("something went wrong");
                return null;
        }
    }

    //method to find which search field the user would like to search in the table
    public static String searchField ()
    {
        //user will choose the field to search in
        System.out.println("What would you like to search by?\n" +
                "[1] Phone ID\n" +
                "[2] Phone number\n" +
                "[3] Parent ID\n" +
                "[4] Employee ID");
        int userInput = ScannerReader.scannerInt(1, 4);
        switch (userInput) {
            case 1:
                return "phoneid";
            case 2:
                return "phone_number";
            case 3:
                return "parent_id";
            case 4:
                return "employee_id";
            default:
                System.out.println("something went wrong");
                return null;
        }
    }

    //create search query and print out the results.
    public static String createSearchQuery (String tableName, String searchField)
    {
        String selectQuery = "SELECT " + tableName + "phoneid, phone_number, phone_type, parent_id, employee_id FROM roskilde_daycare." + tableName;
        System.out.println("type your search");
        String userInput = ScannerReader.scannerAll();
        String whereQuery = " WHERE " + searchField + " = '" + userInput + "'";
        String query = selectQuery + whereQuery;
        showResultSetOfPhone(query, tableName);
        return query;
    }


    public static int choosePhoneFromSearchResult (String query, String tableName)
    {
        System.out.println("Whose phone number would you like to change? ");
        ResultSet rs = getQueryResultSet(query);
        int i = 1;
        try {
            while (rs.next()) {
                System.out.printf("%-7s%-20s%-20s%1s\n", "[" + i + "]", (rs.getString(tableName + "phoneid")),
                        (rs.getString("phone_number") + " " +
                                rs.getString("parent_id")), rs.getString("employee_id"));
                i++;
            }
            System.out.println("[0] for cancel ");
            int userInput = ScannerReader.scannerInt(0, i);
            rs.absolute(userInput);
            int id = rs.getInt(tableName + "phoneid");
            System.out.println(id);
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // allow you to search for specific phone number in one of the being table and it will return the id of the being
    public static String searchInPhoneTable ()
    {
        String tableName = chooseTable();
        String field = searchField();
        String query = createSearchQuery(tableName, field);
        int idForUpdate = choosePhoneFromSearchResult(query, tableName);
        return idForUpdate + " " + tableName;
    }

    public static void fullSearchPhone(){
        String result = searchInPhoneTable();
        if (result.length()<1){
            return;
        }
        System.out.println("What would you like to do \n" +
                "[1] Update \n" +
                "[2] delete \n" +
                "[0] return to the menu");
        int userInput = ScannerReader.scannerInt(0,2);
        switch (userInput){
            case 1:
                updatePhone(result);
                break;
            case 2:
                deletePhone(result);
                break;
            case 0:
                System.out.println("return to the menu");
                break;
            default:
                System.out.println("something went wrong");
        }

    }
    // a method to delete a being form one of the table, the string that you pass in should contain two words. first id that you would like to delete and second the table name.
    //it is made like this for continue method to searchInPhoneTable
    public static String deletePhone (String toDelete)
    {
        Scanner scanner = new Scanner(toDelete);
        int id = Integer.parseInt(scanner.next());
        String tableName = scanner.next();
        return "DELETE FROM roskilde_daycare." + tableName + " WHERE " + tableName + "_id = " + id;
    }

    //allow the user to update information about a being need to get call with a string (idNumeber + tableName)same as delete method.
    public static String updatePhone (String toUpdate)
    {
        Scanner scanner = new Scanner(toUpdate);
        int id = Integer.parseInt(scanner.next());
        String tableName = scanner.next();
        switch (tableName) {
            case "employee":
                return updateEmployee(id);
            case "parent":
                return updateParent(id);
            default:
                System.out.println("something went wrong");
                return null;
        }

    }

    public static String updateEmployee (int id)
    {
        String userChange;
        System.out.println("What do you want to change the phone number to?");
                userChange = ScannerReader.scannerIntAsString();
                return "UPDATE  roskilde_daycare.employee SET phone_number = '" + userChange + "' WHERE employee_id = " + id;
    }

    public static String updateParent (int id)
    {
        String userChange;
        System.out.println("What do you want to change the phone number to?");
            userChange = ScannerReader.scannerIntAsString();
            return "UPDATE  roskilde_daycare.parent SET phone_number = '" + userChange + "' WHERE parent_id = " + id;
    }
}
