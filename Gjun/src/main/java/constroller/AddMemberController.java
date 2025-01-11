package constroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.impl.MemberDaoImpl;
import model.Member;


@WebServlet("/AddMemberController")
public class AddMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		String Username=request.getParameter("username");
		boolean user=new MemberDaoImpl().findByUsername(Username);
		
		if(user)
		{
			response.sendRedirect("addMemberError.jsp");
		}
		else {
			String Name=request.getParameter("name");
			String Password=request.getParameter("password");
			String Address=request.getParameter("address");
			String Phone=request.getParameter("phone");
			String Mobile=request.getParameter("mobile");
			
			Member member=new Member(Name,Username,Password,Address,Phone,Mobile);
			new MemberDaoImpl().addMember(member);
			response.sendRedirect("addMemberSuccess.jsp");
		}
	}

}
