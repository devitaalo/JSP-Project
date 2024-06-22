package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.ModelLogin;


import java.io.IOException;
import java.util.List;

import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DAOUsuarioRepository;

@MultipartConfig
public class ServletUsuarioController extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;
       
	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
    
    public ServletUsuarioController() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String acao = request.getParameter("acao");
			
			if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) {
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultarUsuariosTodosList(super.getUserLogado(request));
				
				request.setAttribute("modelLogins", modelLogins);
				
				String idUser = request.getParameter("id");
				daoUsuarioRepository.deletarUser(idUser);
				request.setAttribute("msg", "Excluido com sucesso!");

				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarAjax")) {
				String idUser = request.getParameter("id");
				daoUsuarioRepository.deletarUser(idUser);
				
				response.getWriter().write("Excluido com sucesso!");
				
			}else if( acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjax") ) {
				
				String nomeBusca = request.getParameter("nomeBusca");
				List<ModelLogin> dadosJsonUser = daoUsuarioRepository.consultaUsuarioList(nomeBusca, super.getUserLogado(request));
				
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(dadosJsonUser);
				
				response.getWriter().write(json);
				
				
			} else if( acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar") ) {
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultarUsuariosTodosList(super.getUserLogado(request));
								
				request.setAttribute("modelLogins", modelLogins);
				
				String id = request.getParameter("id");
				
				ModelLogin modelLogin = daoUsuarioRepository.consultaUsuarioID(id, super.getUserLogado(request));
				
				request.setAttribute("msg", "Usuario em edição");
				
				request.setAttribute("modelLogin", modelLogin);

				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
				
				
			} else if( acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listarUser") ) {
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultarUsuariosTodosList(super.getUserLogado(request));
				
				request.setAttribute("msg", "Usuário carregados");
				
				request.setAttribute("modelLogins", modelLogins);
				
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

			} 
			
			else {
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultarUsuariosTodosList(super.getUserLogado(request));
				
				request.setAttribute("modelLogins", modelLogins);
				
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);	
			}
			
			
		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("Erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
		
		
			
			
		
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			List<ModelLogin> modelLogins = daoUsuarioRepository.consultarUsuariosTodosList(super.getUserLogado(request));
			
			request.setAttribute("modelLogins", modelLogins);
			
			String msg = "Operação realizada com sucesso!";
			
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String perfil = request.getParameter("perfil");
			String sexo = request.getParameter("sexo");

			
			
			ModelLogin modelLogin = new ModelLogin(nome, email, login, senha);
			modelLogin.setPerfil(perfil);
			modelLogin.setSexo(sexo);
			
			modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			
			if(ServletFileUpload.isMultipartContent(request)) {
				Part part = request.getPart("filefoto");
				byte[] foto = IOUtils.toByteArray(part.getInputStream());
				String imagemBase64 = new Base64().encodeBase64String(foto);
				System.out.println(imagemBase64);
			}
			
			if(daoUsuarioRepository.validarLogin(modelLogin.getLogin()) && modelLogin.getId() == null) {
				msg = "Ja existe usuario com esse login, informe outro login!";
			}else {
				modelLogin = daoUsuarioRepository.gravarUsuario(modelLogin, super.getUserLogado(request));

			}

						
			request.setAttribute("msg", msg);
			request.setAttribute("modelLogin", modelLogin);
			
			request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("Erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			
		}
		
		
		
		}
}
