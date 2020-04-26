package leave_management;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class student {
	@Id
	private String sid;
	private String name;
	
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
