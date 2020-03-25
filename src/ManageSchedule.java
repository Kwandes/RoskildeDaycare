import java.sql.ResultSet;
import java.sql.SQLException;

public class ManageSchedule {
    //create new employee's schedule
    static void createSchedule(String startTime, String endTime, String position, int employeeID, int groupID){
        DBInteraction.updateDB(
                "INSERT INTO roskilde_daycare.schedule(start_time, end_time, position, employee_id, group_id) VALUES ('"+
                        startTime+"','" +endTime + "','" + position + "'," + employeeID + "," + groupID + ");");
    }
    //update the existed schedule
    static void updateSchedule(String columnName, String newValue,  int scheduleId){
        DBInteraction.updateDB(
                "UPDATE roskilde_daycare.schedule SET " + columnName +" = '" + newValue + "' WHERE schedule_id =  " + scheduleId);
    }
    //delete schedule
    static void deleteSchedule(int scheduleId){
        DBInteraction.updateDB(
                "DELETE FROM roskilde_daycare.schedule WHERE schedule_id =" + scheduleId);

    }
     static void seeSchedule(){

            // Example select using the getData(query) method
            ResultSet rs = DBInteraction.getData("SELECT * FROM roskilde_daycare.schedule");

            try
            {
                // iterate over the results and display the contents
                while (rs.next())
                {
                    // resultSet consists of rows, with specific columns accessible with both a number and the column name
                    System.out.println("ID: " + rs.getString("schedule_id") + " | " +
                            "start_time: " + rs.getString("start_time") + " " +
                            rs.getString("end_time")+" " + rs.getString("position"));
                }
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
    }

}
