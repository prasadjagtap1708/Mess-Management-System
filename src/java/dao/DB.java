package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import pojo.*;
import pojo.AddNewSubadminBean;
import pojo.AdminLoginBean;
import pojo.BranchBean;

public class DB {
        //connection code
Connection conn;
ResultSet rs;
PreparedStatement stmt;
int id;
ArrayList al;
 public DB()throws Exception
  {
     Class.forName("com.mysql.jdbc.Driver");
     conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Register","root","");
     
 }
  public int getUserRegId()throws Exception
  {
   stmt=conn.prepareStatement("select max(id) from UserLogin");
   rs=stmt.executeQuery();
   if(rs.next())
   {
    id=rs.getInt(1);
   }
    return ++id;

   }

  public boolean isRegister(String ...data)throws Exception
  {
   int urid=this.getUserRegId();
      
   stmt=conn.prepareStatement("insert into UserLogin(name,email,Branch,contactNo,password,cpassword) values(?,?,?,?,?,?)");
   
   stmt.setString(1,data[0]);
   stmt.setString(2,data[1]);
   stmt.setString(3,data[2]);
   stmt.setString(4,data[3]);
   stmt.setString(5,data[4]);
   stmt.setString(6,data[5]);

   int value=stmt.executeUpdate();
   if(value>0)
   {
    return true;
   }
   else
   {
   return false;
   }
  }  
  public boolean isAdmin(String ...data)throws Exception
  {
   stmt=conn.prepareStatement("insert into admin values(?,?)");
   stmt.setString(1,data[0]);
   stmt.setString(2,data[1]);
   
   int value=stmt.executeUpdate();
   if(value>0)
   {
    return true;
   }
   else
   {
   return false;
   }
  }

  public ArrayList isValidate(String u,String p)throws Exception
  {
   al=new ArrayList();
   stmt=conn.prepareStatement("select * from UserLohin where email=? and password=?");
   stmt.setString(1,u);
   stmt.setString(2,p);
   rs=stmt.executeQuery();
   if(rs.next())
   {
    al.add(rs.getInt(1));
    al.add(rs.getString(2));
   }
return al;


  }
  
  /*
  public ResultSet getProfile(int userid)throws Exception
  {
   stmt=conn.prepareStatement("select txt_name,txt_mail,txt_cno from info where rId=?");
   stmt.setInt(1,userid);
   rs=stmt.executeQuery();
   return rs;
  }

  public boolean isFeedback(String ...data)throws Exception
  {
   int urid=this.getUserRegId();
   stmt=conn.prepareStatement("insert into feedback values(?,?,?,?)");
   stmt.setInt(1,urid);
   stmt.setString(2,data[0]);
   stmt.setString(3,data[1]);
   stmt.setString(4,data[2]);
   stmt.setString(5,data[3]);
   

   int value=stmt.executeUpdate();
   if(value>0)
   {
    return true;
   }
   else
   {
   return false;
   }
  }*/
public static Connection getConnection(){    
    Connection con=null;
            try{
            Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");  
            }catch(Exception e){}  
        return con;  
    }
  
  public static boolean validate(AdminLoginBean bean){  
        boolean status=false;  
        try{  
          
        Connection con=getConnection(); 
        PreparedStatement ps=con.prepareStatement("select * from adminLogin where email=? and password=?"); 

        ps.setString(1,bean.getUsername());  
        ps.setString(2, bean.getPassword());  

        ResultSet rs=ps.executeQuery();  
        
        status=rs.next();  
        System.out.print("Status="+status);

        }catch(Exception e){}  
        System.out.print("Status="+status);
        return status;  

        }
  
  public static int addNewSubadminMethod(AddNewSubadminBean u){  
    int status=0;  
    
    try{   
    Connection con=getConnection(); 
            System.out.println("inserted"+u.getName()+u.getContact()+u.getEmail()+u.getPassword()+u.getCpassword()+u.getBranch_id());
            PreparedStatement pstmt=con.prepareStatement("insert into subadmin(name,contact,email,password,cpassword,branch_id) values (?,?,?,?,?,?);");  
            pstmt.setString(1,u.getName()); 
            pstmt.setString(2,u.getContact());  
            pstmt.setString(3,u.getEmail()); 
            pstmt.setString(4,u.getPassword());  
            pstmt.setString(5,u.getCpassword());
            pstmt.setInt(6,u.getBranch_id());
            status=pstmt.executeUpdate();
                 System.out.println("inserted"+status);
           
      }
    catch(Exception e){}  
    System.out.println(status);  
    return status;  
    }
  
  
  public static int addNewBranch(BranchBean u){  
    int status=0;  
    
    try{   
    Connection con=getConnection(); 
            //System.out.println("inserted"+u.getName()+u.getContact()+u.getEmail()+u.getBranch_name()+u.getBranch_address()+con);
            PreparedStatement pstmt=con.prepareStatement("insert into branch(branch_name,branch_address) values (?,?);");  
            pstmt.setString(1,u.getBranch_name()); 
            pstmt.setString(2,u.getBranch_address());  
           
           // pstmt.setString(4,u.getBranch_name());  
           // pstmt.setString(5,u.getBranch_address());
            status=pstmt.executeUpdate();
                 System.out.println("inserted"+status);
           
      }
    catch(Exception e){}  
    System.out.println(status);  
    return status;  
    }
  
  
  
      public static List<AddNewSubadminBean> getSubAdmin()
     {  

       List<AddNewSubadminBean> list=new ArrayList<AddNewSubadminBean>();  
      
        try
        {  
            AddNewSubadminBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from subadmin");  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                AddNewSubadminBean u=new AddNewSubadminBean();  
                u.setName(rs.getString("name"));
                u.setContact(rs.getString("contact"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setCpassword(rs.getString("cpassword"));
                u.setBranch_id(rs.getInt("branch_id"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
      
      
      
      
       public static List<BranchBean> getBranch()
     {  

       List<BranchBean> list=new ArrayList<BranchBean>();  
      
        try
        {  
            BranchBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from branch");  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                BranchBean u=new BranchBean();  
                u.setId(rs.getInt("id"));
                u.setBranch_name(rs.getString("branch_name"));
                u.setBranch_address(rs.getString("branch_address"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
       
       
       public static List<BranchBean> getBranchDetails(String id)
     {  
         String ids=id;
       List<BranchBean> list=new ArrayList<BranchBean>();  
      
        try
        {  
            BranchBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from branch where id="+ids);  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                BranchBean u=new BranchBean();  
                u.setId(rs.getInt("id"));
                u.setBranch_name(rs.getString("branch_name"));
                u.setBranch_address(rs.getString("branch_address"));
                //u.setSubadmin_Id(rs.getInt("Subadmin_id"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
       
       
       public static List<BranchBean> getBranchDetailsName(String branch_name)
     {  
         String ids=branch_name;
         System.out.println(ids);
       List<BranchBean> list=new ArrayList<BranchBean>();  
      
        try
        {  
            BranchBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from branch where branch_name='"+ids+"'");  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                BranchBean u=new BranchBean();  
                u.setId(rs.getInt("id"));
                u.setBranch_name(rs.getString("branch_name"));
                u.setBranch_address(rs.getString("branch_address"));
                //u.setSubadmin_Id(rs.getInt("Subadmin_id"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
       
       
       public static List<AddNewSubadminBean> subadminDetails(int branch_id)
     {  
         int branch_ids=branch_id;
         System.out.println(branch_ids);
       List<AddNewSubadminBean> list=new ArrayList<AddNewSubadminBean>();  
      
        try
        {  
            AddNewSubadminBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from subadmin where branch_id="+branch_ids+"");  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                AddNewSubadminBean u=new AddNewSubadminBean();  
               // u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setContact(rs.getString("contact"));
                u.setId(rs.getInt("id"));
                u.setBranch_id(rs.getInt("branch_id"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
       
       
       public static int deleteSubadmin(int id,int branchid){  
    int status=0;  
    int ids=id;
    int bid=branchid;
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("delete from subadmin where id="+ids);
        PreparedStatement ps1=con.prepareStatement("delete from branch where id="+bid);
         
        status=ps.executeUpdate(); 
        status=ps1.executeUpdate();
    }catch(Exception e){System.out.println(e);}  
  
    return status;  
}
       
       public static int subadminUpdate(AddNewSubadminBean u){  
    int status=0; 
    System.out.println(u.getName()+""+u.getContact()+""+u.getEmail()+""+u.getBranch_id());
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("update subadmin set name='"+u.getName()+"',contact='"+u.getContact()+"',email='"+u.getEmail()+"' where branch_id="+u.getBranch_id());  
       /* ps.setString(1,u.getName());  
        ps.setString(2,u.getContact());  
        ps.setString(3,u.getEmail());*/ 
        status=ps.executeUpdate(); 
    }catch(Exception e){System.out.println(e);}  
    return status;  
    
}
       
      public static int addNewManagerMethod(AddNewManagerBean u){  
    int status=0;  
    
    try{   
    Connection con=getConnection(); 
            //System.out.println("inserted"+u.getName()+u.getContact()+u.getEmail()+u.getBranch_name()+u.getBranch_address()+con);
            PreparedStatement pstmt=con.prepareStatement("insert into manager(name,contact,email,branch_id) values (?,?,?,?);");  
            pstmt.setString(1,u.getName()); 
            pstmt.setString(2,u.getContact());  
            pstmt.setString(3,u.getEmail()); 
            pstmt.setInt(4,u.getBranch_id());  
            //pstmt.setString(5,u.getBranch_address());
            status=pstmt.executeUpdate();
                 System.out.println("inserted"+status);
           
      }
    catch(Exception e){}  
    System.out.println(status);  
    return status;  
    }
      
      
    public static List<AddNewManagerBean> getManager(int id)
     {  
         int ids=id;
       List<AddNewManagerBean> list=new ArrayList<AddNewManagerBean>();  
      
        try
        {  
            AddNewManagerBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from manager where branch_id="+ids);  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                AddNewManagerBean u=new AddNewManagerBean();  
                u.setName(rs.getString("name"));
                u.setContact(rs.getString("contact"));
                u.setEmail(rs.getString("email"));
                u.setBranch_id(rs.getInt("branch_id"));
                //u.setBranch_address(rs.getString("branch_address"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
      
    //********************* Add Cook*******************************************
       public static int addNewCookMethod(AddNewCookBean u){  
    int status=0;  
    
    try{   
    Connection con=getConnection(); 
            System.out.println("inserted"+u.getName()+u.getContact()+u.getEmail()+u.getBranch_name()+u.getBranch_address()+con);
            PreparedStatement pstmt=con.prepareStatement("insert into cook(name,contact,email,branch_id) values (?,?,?,?);");  
            pstmt.setString(1,u.getName()); 
            pstmt.setString(2,u.getContact());  
            pstmt.setString(3,u.getEmail()); 
            pstmt.setInt(4,u.getBranch_id());  
            //pstmt.setString(5,u.getBranch_address());
            status=pstmt.executeUpdate();
                 System.out.println("inserted"+status);
           
      }
    catch(Exception e){}  
    System.out.println(status);  
    return status;  
    }
       
        public static List<AddNewCookBean> getCook(int id)
     {  
         int ids=id;
       List<AddNewCookBean> list=new ArrayList<AddNewCookBean>();  
      
        try
        {  
            AddNewCookBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from cook where branch_id="+ids);  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                AddNewCookBean u=new AddNewCookBean();  
                u.setName(rs.getString("name"));
                u.setContact(rs.getString("contact"));
                u.setEmail(rs.getString("email"));
               u.setBranch_id(rs.getInt("branch_id"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
      
    //***************************Add Waiter*************************
       
    public static int addNewWaiterMethod(AddNewWaiterBean u){  
    int status=0;  
    
    try{   
    Connection con=getConnection(); 
            //System.out.println("inserted"+u.getName()+u.getContact()+u.getEmail()+u.getBranch_name()+u.getBranch_address()+con);
            PreparedStatement pstmt=con.prepareStatement("insert into waiter(name,contact,email,branch_id) values (?,?,?,?);");  
            pstmt.setString(1,u.getName()); 
            pstmt.setString(2,u.getContact());  
            pstmt.setString(3,u.getEmail()); 
            pstmt.setInt(4,u.getBranch_id());  
            //pstmt.setString(5,u.getBranch_address());
            status=pstmt.executeUpdate();
                 System.out.println("inserted"+status);
           
      }
    catch(Exception e){}  
    System.out.println(status);  
    return status;  
    }
      
      
    public static List<AddNewWaiterBean> getWaiter(int id)
     {  
         int ids=id;
       List<AddNewWaiterBean> list=new ArrayList<AddNewWaiterBean>();  
      
        try
        {  
            AddNewWaiterBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from waiter where branch_id="+ids);  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                AddNewWaiterBean u=new AddNewWaiterBean();  
                u.setName(rs.getString("name"));
                u.setContact(rs.getString("contact"));
                u.setEmail(rs.getString("email"));
                u.setBranch_id(rs.getInt("branch_id"));
                //u.setBranch_address(rs.getString("branch_address"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }  

    
    public static boolean validateSub(AddNewSubadminBean bean){  
        boolean status=false;  
        try{  
          
        Connection con=getConnection(); 
        PreparedStatement ps=con.prepareStatement("select * from subadmin where email=? and password=?"); 

        ps.setString(1,bean.getEmail());  
        ps.setString(2,bean.getPassword());  

        ResultSet rs=ps.executeQuery();  
        
        status=rs.next();  
        System.out.print("Status="+status+bean.getEmail()+bean.getPassword());

        }catch(Exception e){}  
        System.out.print("Status="+status);
        return status;  

        }
    
     public static boolean validateU(UserLoginBean bean){  
        boolean status=false;  
        try{  
          
        Connection con=getConnection(); 
        PreparedStatement ps=con.prepareStatement("select * from UserLogin where email=? and password=?"); 

        ps.setString(1,bean.getUsername());  
        ps.setString(2, bean.getPassword());  

        ResultSet rs=ps.executeQuery();  
        
        status=rs.next();  
        System.out.print("Status="+status);

        }catch(Exception e){}  
        System.out.print("Status="+status);
        return status;  

        }
    
    public static List<AddNewSubadminBean> getSubadminByEmail(String email)
     {  
         String emails=email;
       List<AddNewSubadminBean> list=new ArrayList<AddNewSubadminBean>();  
      
        try
        {  
            AddNewSubadminBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from subadmin where email='"+emails+"'");  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                AddNewSubadminBean u=new AddNewSubadminBean();  
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setContact(rs.getString("contact"));
                u.setName(rs.getString("name"));
                u.setBranch_id(rs.getInt("branch_id"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
  
    
    public static List<AddNewManagerBean> getManagerById(String id)
     {  
         String ids=id;
       List<AddNewManagerBean> list=new ArrayList<AddNewManagerBean>();  
      
        try
        {  
            AddNewManagerBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from manager where branch_id="+ids);  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                AddNewManagerBean u=new AddNewManagerBean();  
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setContact(rs.getString("contact"));
                //u.setSubadmin_Id(rs.getInt("Subadmin_id"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
    
    public static List<AddNewCookBean> getCookById(String id)
     {  
         String ids=id;
       List<AddNewCookBean> list=new ArrayList<AddNewCookBean>();  
      
        try
        {  
            AddNewCookBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from cook where branch_id="+ids);  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                AddNewCookBean u=new AddNewCookBean();  
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setContact(rs.getString("contact"));
                //u.setSubadmin_Id(rs.getInt("Subadmin_id"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
    
    
    public static List<AddNewWaiterBean> getWaiterById(String id)
     {  
         String ids=id;
       List<AddNewWaiterBean> list=new ArrayList<AddNewWaiterBean>();  
      
        try
        {  
            AddNewWaiterBean f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from waiter where branch_id="+ids);  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                AddNewWaiterBean u=new AddNewWaiterBean();  
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setContact(rs.getString("contact"));
                //u.setSubadmin_Id(rs.getInt("Subadmin_id"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
    
    
    public static List<UserPojo> getUserByEmail(String email)
     {  
         String emails=email;
       List<UserPojo> list=new ArrayList<UserPojo>();  
      
        try
        {  
            UserPojo f = null;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from userlogin where email='"+emails+"'");  
            //ps.setString(1, f.getSource());
            //ps.setString(2, f.getDest());
            //ps.setString(3, f.getDate());
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                UserPojo u=new UserPojo();  
                u.setrId(rs.getInt("id"));
                u.setTxt_name(rs.getString("name"));
                u.setTxt_mail(rs.getString("email"));
                u.setTxt_cno(rs.getString("contact"));
                list.add(u);  
            }  
        }
        catch(Exception e)
        {
            System.out.println(e);
        }  
        return list;  
    }
  
    
    
    
    public static int breakfastMethod(Breakfastbean u){  
    int status=0;  
    
    try{   
    Connection con=getConnection(); 
            System.out.println("inserted"+u.getBreakfast());
            PreparedStatement pstmt=con.prepareStatement("insert into userbreakfast(id,breakfast) values ("+u.getId()+",'"+u.getBreakfast()+"')");  
            //pstmt.setInt(1,u.getId()); 
            //pstmt.setString(2,u.getBreakfast()); 
            status=pstmt.executeUpdate();
            System.out.println("inserted"+status);
           
      }
    catch(Exception e){System.out.println(e);}  
    System.out.println(status);  
    return status;  
    }
    
    public static int lunchMethod(Lunchbean u){  
    int status=0;  
    
    try{   
    Connection con=getConnection(); 
            System.out.println("inserted"+u.getLunch_roti()+u.getLunch_sabji()+u.getLunch_rice());
            PreparedStatement pstmt=con.prepareStatement("insert into userlunch(id,lunch_roti,lunch_sabji,lunch_rice) values ("+u.getId()+",'"+u.getLunch_roti()+"','"+u.getLunch_sabji()+"','"+u.getLunch_rice()+"')");  
            //pstmt.setInt(1,u.getId()); 
            //pstmt.setString(2,u.getBreakfast()); 
            status=pstmt.executeUpdate();
            System.out.println("inserted"+status);
           
      }
    catch(Exception e){System.out.println(e);}  
    System.out.println(status);  
    return status;  
    }
    
     public static int dinnerMethod(Dinnerbean u){  
    int status=0;  
    
    try{   
    Connection con=getConnection(); 
            System.out.println("inserted"+u.getDinner_roti()+u.getDinner_sabji()+u.getDinner_rice()+u.getDinner_desert());
            PreparedStatement pstmt=con.prepareStatement("insert into userdinner(id,dinner_roti,dinner_sabji,dinner_rice,dinner_desert) values ("+u.getId()+",'"+u.getDinner_roti()+"','"+u.getDinner_sabji()+"','"+u.getDinner_rice()+"','"+u.getDinner_desert()+"')");  
            //pstmt.setInt(1,u.getId()); 
            //pstmt.setString(2,u.getBreakfast()); 
            status=pstmt.executeUpdate();
            System.out.println("inserted"+status);
           
      }
    catch(Exception e){System.out.println(e);}  
    System.out.println(status);  
    return status;  
    }
    
}
    