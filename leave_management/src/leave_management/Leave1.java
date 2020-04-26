package leave_management;

public class Leave1  implements java.io.Serializable {


    private int leaveid;
    private int studentid;
    private String reason;
    private String fdate;
    private byte[] file;
    private String tdate;

   public Leave1() {
   }

   public Leave1(int leaveid, int studentid, String reason, String fdate, byte[] file, String tdate) {
      this.leaveid = leaveid;
      this.studentid = studentid;
      this.reason = reason;
      this.fdate = fdate;
      this.file = file;
      this.tdate = tdate;
   }
  
   public int getLeaveid() {
       return this.leaveid;
   }
   
   public void setLeaveid(int leaveid) {
       this.leaveid = leaveid;
   }
   public int getStudentid() {
       return this.studentid;
   }
   
   public void setStudentid(int studentid) {
       this.studentid = studentid;
   }
   public String getReason() {
       return this.reason;
   }
   
   public void setReason(String reason) {
       this.reason = reason;
   }
   public String getFdate() {
       return this.fdate;
   }
   
   public void setFdate(String fdate) {
       this.fdate = fdate;
   }
   public byte[] getFile() {
       return this.file;
   }
   
   public void setFile(byte[] file) {
       this.file = file;
   }
   public String getTdate() {
       return this.tdate;
   }
   
   public void setTdate(String tdate) {
       this.tdate = tdate;
   }




}


