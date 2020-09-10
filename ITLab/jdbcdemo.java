
import java.sql.*;

public class jdbcdemo {
	public static void main(String args[]) {
           String url = "jdbc:mysql://localhost/student";
           String userId = "root";
           String password = "",fname,lname;
           ResultSet results;
           Connection conn;
           Statement stmnt;
 try {
              Class.forName("com.mysql.cj.jdbc.Driver");
              conn = DriverManager.getConnection(url,userId,password);
              stmnt = conn.createStatement();
              String query="SELECT * FROM student";
              results=stmnt.executeQuery(query);
              boolean records = results.next();
             if(!records) {
                  System.out.println("No records found ");
              }

              else {
                do{
                    fname = results.getString(1);
                    lname = results.getString(2);
                    System.out.println(fname+" "+lname);
                  }while(results.next());
           }
           stmnt.close();
           conn.close();
        }
        catch(ClassNotFoundException e) {
                System.out.println("Driver not found");
        }
catch(SQLException e) {
          System.out.println(e);
        }
 }   
}
