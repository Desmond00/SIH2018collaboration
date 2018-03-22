package tpc;

public class LoginClass {
		private String email;
		private String password;
		 
		LoginClass(){
			this.email=null;
			this.password=null; 
		}

		LoginClass(String email,String pass){
			this.email = email;
			this.password = pass;
		}
		
		public void setEmail(String string){
			this.email = string;
		}
		public void setPassword(String string){
			this.password = string;
		}
		String getEmail(){
			return this.email;
		}
		String getPassword()
		{
			return this.password;
		}

}