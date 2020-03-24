/*Class that responsible to manage DB that contain info for a daycare.
created by Itai Gramse. A part of a project for KEA university.
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class ManageBeing
{
    public static ResultSet getQueryResultSet(String query)
    {
        // call the DB and get results
        return DBInteraction.getData(query);
    }

    //return a table with all the information about one of the human being table
    public static void showResultSetOfBeing(String query,String tableName)
    {
        ResultSet rs = getQueryResultSet(query); //getting ResultSet from the DB
        System.out.printf("%-7s%-20s%-20s%1s\n","ID","Name","Birth Date", "CPR");
        System.out.println("_________________________________________________________________");
        try{
            while(rs.next()){ //iterating throw the resultSet and print it out
                System.out.printf("%-7s%-20s%-20s%1s\n",(rs.getString(tableName+"_id")),
                        (rs.getString("first_name") + " " +
                                rs.getString("last_name")),rs.getString("birth_date"),rs.getString("cpr"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //show all the being from a chosen table
    public static void seeBeing(String tableName)
    {
        String query = "SELECT "+ tableName+"_id, first_name, last_name, birth_date, cpr FROM roskilde_daycare."+tableName; //create a query to the DB
        showResultSetOfBeing(query, tableName);
    }
    public static String collectBirthDayInfo()
    {
        System.out.println("Please type the day of birth");
        String dayBirth = ScannerReader.scannerInt(1,31) +"";
        //fitting the date format
        if(dayBirth.length()<2)
        {
            dayBirth = "0"+ dayBirth;
        }
        System.out.println("Please type the month of birth");
        String monthBirth = ScannerReader.scannerInt(1,12) + "";
        //fitting the date format
        if (monthBirth.length()<2)  {
            monthBirth = "0"+ monthBirth;
        }
        System.out.println("Please type the year of birth");
        int yearBirth = ScannerReader.scannerInt(1900,9999);
        return yearBirth + "-" + monthBirth +"-"+ dayBirth;

    }
    // collecting the information from the user and return a query for the DB.
    public static String createQueryForAddBeing()
    {
        //collecting requirement for any kind of human being
        String tableName = chooseTable();
        System.out.println("please type first name");
        String firstName = ScannerReader.scannerWords();
        System.out.println("Please type last name");
        String lastName = ScannerReader.scannerWords();
        System.out.println("Please type cpr number");
        String cpr = ScannerReader.scannerIntAsString(10);
        String birthDate = collectBirthDayInfo();

        //start to create the values part of the query
        String query = " VALUES ('"+firstName+"', '"+lastName+"', '"+ cpr +"', '"+birthDate +"', '";
        // collecting the rest of the requirement for specific table
        switch (tableName){
            case "employee":
                System.out.println("Please type amount of the works hours");
                double hoursOfWork = ScannerReader.scannerDouble();
                System.out.println("Please type salary per hour of work");
                int salaryPerHour = ScannerReader.scannerInt();
                System.out.println("Please type the bank account number");
                String bankAccount = ScannerReader.scannerIntAsString();
                //complete the query for employee
                query = "INSERT INTO  roskilde_daycare."+tableName+ " (first_name, last_name, cpr, birth_date, work_hours, salary_per_hour, bank_account)" +
                        query + hoursOfWork +"', '" +salaryPerHour+"', '"+bankAccount +"');"; //complete the query for employee
                break;
            case "parent":
                System.out.println("Please type e-mail address");
                String email = ScannerReader.scannerEMail();
                //complete the query for parent
                query = "INSERT INTO roskilde_daycare." + tableName +  " (first_name, last_name, cpr, birth_date, email)" +
                        query +email + "');";
                break;
            case "child":
                System.out.println("is the child on the waiting list? \n[0] for not \n[1] for yes)");
                int isWaiting = ScannerReader.scannerInt(0,1);
                //complete the query for child
                query = "INSERT INTO  roskilde_daycare."+tableName+ " (first_name, last_name, cpr, birth_date, is_waiting)"
                        + query + isWaiting + "')";
                break;
            default:
                System.out.println("something went wrong...");
                break;
        }
        System.out.println(query);
        return query;
    }

    //method that the user can choose which table to operates on.
    public static String chooseTable()
    {
        //user choose the table to operate on
        System.out.println("which group of being would you like to operate on:\n[1] Employee\n[2] Parent \n[3] Child");
        int userChoice = ScannerReader.scannerInt(1,3);
        switch (userChoice) {
            case 1:
                return "employee";
            case 2:
                return "parent";
            case 3:
                return "child";
            default:
                System.out.println("something went wrong");
                return null;
        }
    }
    //method to find which search field the user would like to search in the table
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

    //create search query and print out the results.
    public static String createSearchQuery(String tableName, String searchField)
    {
        String selectQuery = "SELECT "+ tableName+"_id, first_name, last_name, birth_date, cpr FROM roskilde_daycare."+tableName;
        System.out.println("type your search");
        String userInput = ScannerReader.scannerAll();
        String whereQuery = " WHERE " +searchField +" = '" + userInput+"'";
        String query = selectQuery+whereQuery;
        showResultSetOfBeing(query,tableName);
        return query;
    }


    public static int chooseBeingFromSearchResult(String query, String tableName)  {
        System.out.println("which one would you like to change? ");
        ResultSet rs = getQueryResultSet(query);
        int i = 1;
        try {
            while (rs.next()) {
                System.out.printf("%-7s%-20s%-20s%1s\n","["+i+"]",(rs.getString(tableName+"_id")),
                        (rs.getString("first_name") + " " +
                                rs.getString("last_name")),rs.getString("cpr"));
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

    // allow you to search for specific being in one of the being table and it will return the id of the being
    public static String searchInBeingTable(){
        String tableName = chooseTable();
        String field = searchField();
        String query = createSearchQuery(tableName,field);
        int idForUpdate = chooseBeingFromSearchResult(query,tableName);
        System.out.println("id is" + idForUpdate);
        return idForUpdate +" "+ tableName;
    }

    // a method to delete a being form one of the table, the string that you pass in should contain two words. first id that you would like to delete and second the table name.
    //it is made like this for continue method to searchInBeingTable
    public static String deleteBeing(String toDelete){
            Scanner scanner = new Scanner(toDelete);
            int id = Integer.parseInt(scanner.next());
            String tableName = scanner.next();
            String query = "DELETE FROM roskilde_daycare."+tableName+" WHERE "+tableName+"_id = "+id;
            return query;
    }

    //allow the user to update information about a being need to get call with a string (idNumeber + tableName)same as delete method.
    public static void updateBeing (String toUpdate){
        Scanner scanner = new Scanner(toUpdate);
        int id = Integer.parseInt(scanner.next());
        String tableName = scanner.next();
        String query;
        switch (tableName){
            case "employee":
                query = updateEmployee(id);
                break;
            case "parent":
                query = updateParent(id);
                break;
            case "child":

        }


    }
    public static String updateEmployee(int id){
        System.out.println("what would you like to change:\n" +
                "[1] First name\n" +
                "[2] Last name\n");
        int userInput = ScannerReader.scannerInt(1,2);
        String userChange;
        switch (userInput){
            case 1:
                System.out.println("which first name would you like to change to?");
                userChange = ScannerReader.scannerWords();
                return "UPDATE  roskilde_daycare.employee SET first_name = "+ userChange +"WHERE employee_id = "+id;
            case 2 :
                System.out.println("which last name would you like to change to?");
                userChange = ScannerReader.scannerWords();
                return "UPDATE  roskilde_daycare.employee SET last_name = "+ userChange +"WHERE employee_id = "+id;
            default:
                return null;
        }

    }

    public static String updateParent(int id){
        System.out.println("what would you like to change:\n" +
                "[1] First name\n" +
                "[2] Last name\n" +
                "[3] E-Mail address\n");
        int userInput = ScannerReader.scannerInt(1,3);
        String userChange;
        switch (userInput){
            case 1:
                System.out.println("which first name would you like to change to?");
                userChange = ScannerReader.scannerWords();
                return "UPDATE  roskilde_daycare.parent SET first_name = "+ userChange +"WHERE parent_id = "+id;
            case 2 :
                System.out.println("which last name would you like to change to?");
                userChange = ScannerReader.scannerWords();
                return "UPDATE  roskilde_daycare.parent SET last_name = "+ userChange +"WHERE parent_id = "+id;
            case 3:
                System.out.println("type the new E-mail address?");
                userChange = ScannerReader.scannerEMail();
                return "UPDATE  roskilde_daycare.parent SET last_name = "+ userChange +"WHERE parent_id = "+id;
            default:
                return null;
        }
    }
    public static String updateChild(int id){
        System.out.println("what would you like to change:\n" +
                "[1] First name\n" +
                "[2] Last name\n" )
        int userInput = ScannerReader.scannerInt(1,2);
        String userChange;
        switch (userInput){
            case 1:
                System.out.println("which first name would you like to change to?");
                userChange = ScannerReader.scannerWords();
                return "UPDATE  roskilde_daycare.child SET first_name = "+ userChange +"WHERE child_id = "+id;
            case 2 :
                System.out.println("which last name would you like to change to?");
                userChange = ScannerReader.scannerWords();
                return "UPDATE  roskilde_daycare.child SET last_name = "+ userChange +"WHERE child_id = "+id;
        }

}
