package jdbctheory;
import java.sql.*;

public class practice4 {
	public static void main(String args[])
	{
        String url = "jdbc:mysql://localhost/jdbc1?serverTimezone=UTC";
       
        String userId = "root";
        String password = "",fname,lname="";
        int id;
        Connection conn;
        Statement stmnt;
        ResultSet results;
        try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url,userId,password);
			stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
             
			String query="select * from details where Fname=\"Gaurav\"";
			results=stmnt.executeQuery(query);
            results.moveToInsertRow();
            results.updateString(1, "vaibhav");
            results.updateString(2, "Gill");
	        results.updateInt(3,59);
	        results.updateInt(4,89);
	        results.updateInt(5,83);
		    results.insertRow();
		   
		    results.moveToInsertRow();
		    results.updateString(1, "Rohan");
            results.updateString(2, "Sharma");
	        results.updateInt(3,76);
	        results.updateInt(4,88);
	        results.updateInt(5,60);
		    results.insertRow();
		    
		    boolean records = results.first();
		    if(!records) {
                System.out.println("No records found ");
            }
            else {
                do{
                	id=results.getInt(1);
                    fname=results.getString(2);
                    System.out.println(id+" "+fname+" "+lname+" ");
               }while(results.next());
            }
            
			
		      
            stmnt.close();
            conn.close();
        }
		catch(ClassNotFoundException e)
		{
           	System.out.println("Driver not found");
        }
        catch(SQLException e) 
		{
			System.out.println(e);
        }
    }
}
