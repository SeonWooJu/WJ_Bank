package DB;
import java.sql.Connection;
 
import javax.naming.Context;
import javax.sql.DataSource;
 
public class DBConnection 
{
	public static Connection getConnection() throws Exception {
	    Connection conn = null;
	    Context initial = null;
	    DataSource ds = null;

	    try {
	        initial =  new javax.naming.InitialContext();
	        ds = (javax.sql.DataSource) initial.lookup("java:comp/env/jdbc/orcl");
	        conn = ds.getConnection();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (initial != null)
	        try {
	            initial.close();
	            initial = null;
	        } catch (Exception ee) {
	            ee.printStackTrace();
	        }
	    }

	    return conn;
	}
}