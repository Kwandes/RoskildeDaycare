import java.sql.ResultSet;
import java.sql.SQLException;

public class ManageBeing {
    public static ResultSet getQueryResultSet(String query){
        // call the DB and get results
        return DBInteraction.sendQuery(query);
    }

    //return a table with all the information about one of the human being table
    public static void seeBeing(String tableName){
        String query = "SELECT "+ tableName+"_id, first_name, last_name, birth_date FROM roskilde_daycare."+tableName; //create a query to the DB
        ResultSet rs = getQueryResultSet(query);
        try{
            while(rs.next()){
                System.out.println("ID: " + rs.getString(tableName+"_id") + " | " +
                        "Name: " + rs.getString("first_name") + " " +
                        rs.getString("last_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
