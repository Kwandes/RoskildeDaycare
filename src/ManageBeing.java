
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class ManageBeing
{
    public static ResultSet getQueryResultSet(String query)
    {
        // call the DB and get results
        return DBInteraction.sendQuery(query);
    }

    //return a table with all the information about one of the human being table
    public static void seeBeing(String tableName)
    {
        String query = "SELECT "+ tableName+"_id, first_name, last_name, birth_date FROM roskilde_daycare."+tableName; //create a query to the DB
        ResultSet rs = getQueryResultSet(query); //getting ResultSet from the DB
        System.out.printf("%-5s%4s\n","ID","Name");
        System.out.println("___________________");
        try{
            while(rs.next()){ //running throw the resultSet and print it out
                System.out.printf("%-5s%8s\n",(rs.getString(tableName+"_id")),
                        (rs.getString("first_name") + " " +
                        rs.getString("last_name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // collecting the information from the user and return a query for the DB.
    public static String createQueryForAddBeing()
    {
        System.out.println("which being would you like to add:\n[1] Employee\n[2] Parent \n[3] Child");
        int userChoice = ScannerReader.scannerInt(1,3);
        System.out.println("please type first name");
        String firstName = ScannerReader.scannerWords();
        System.out.println("Please type last name");
        String lastName = ScannerReader.scannerWords();
        System.out.println("Please type cpr number");
        String cpr = ScannerReader.scannerIntAsString(10);
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
        String birthDate = yearBirth + "-" + monthBirth +"-"+ dayBirth;
        String tableToUpdate;
        //start to create the values part of the query
        String query = "VALUES ('"+firstName+"', '"+lastName+"', '"+ cpr +"', '"+birthDate +"', '";
        switch (userChoice){
            case 1:
                System.out.println("Please type amount of the works hours");
                double hoursOfWork = ScannerReader.scannerDouble();
                System.out.println("Please type salary per hour of work");
                int salaryPerHour = ScannerReader.scannerInt();
                System.out.println("Please type the bank account number");
                String bankAccount = ScannerReader.scannerIntAsString();
                tableToUpdate = "employee";
                query = "INSERT INTO "+tableToUpdate+ " (first_name, last_name, cpr, birth_date, work_hours, bank_account)" +
                        query + hoursOfWork +"', '" +salaryPerHour+"', '"+bankAccount +"');"; //complete the query for employee
                break;
            case 2:
                System.out.println("Please type e-mail address");
                String email = ScannerReader.scannerEMail();
                tableToUpdate = "parent";
                query = "INSERT INTO" + tableToUpdate +  " (first_name, last_name, cpr, birth_date, email)" +
                        query +email + "');";
                break;
            case 3:
                System.out.println("is the child on the waiting list? \n[0] for not \n[1] for yes)");
                int isWaiting = ScannerReader.scannerInt(0,1);
                tableToUpdate = "child";
                query = "INSERT INTO "+tableToUpdate+ " (first_name, last_name, cpr, birth_date, is_waiting)"
                        + query + isWaiting + "')";
                break;
            default:
                break;
        }
        System.out.println(query);
        return query;
    }


}
