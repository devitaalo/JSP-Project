package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/principal/*"})
public class FilterAutenticacao extends HttpFilter implements Filter {
       
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Connection connection;

    public FilterAutenticacao() {

    }


    /*Encerra os processos quando servidor é parado*/
    //Matar os processos de conexao com o banco
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//Intercepta as requisições e dá as respostas no sistema
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		try {
			
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			
			String usuarioLogado = (String) session.getAttribute("usuario");
			
			String urlParaAutenticar = req.getServletPath();
			
			
			/*Validar para ver se ta logado senao redireciona para tela de login */
			if(usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/principal/ServletLogin")){
				RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
				request.setAttribute("msg", "Por favor realize o login para acessar a url: " + urlParaAutenticar);
				redirecionar.forward(request, response);
				return;
			}else {
				chain.doFilter(request, response);	
			}
			
			
			connection.commit();
		}catch (Exception e) {
			
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("Erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			
			
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		
			
	}

	
	/*Executado quando inicia o sistema*/
	//Iniciar conexao com o banco
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnectionBanco.getConnection();
	}

}
