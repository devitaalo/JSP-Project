package model;

import java.io.Serializable;

public class ModelLogin implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Long id;
	
	private String nome;
	
	private String email;
	
	private String login;
	
	private String senha;
	
	private boolean useradmin;
	
	private String perfil;
	
	private String sexo;
	
	private String extensaofotouser;
	
	public ModelLogin() {
		
	}
	
	public boolean isNovo() {
		if(this.id == null) {
			return true;
		}
		return false;
	}
	
	public ModelLogin(String login, String senha) {
		this.login = login;
		this.senha = senha;
	}
	
	
	
	public ModelLogin(String nome, String email, String login, String senha) {
		this.nome = nome;
		this.email = email;
		this.login = login;
		this.senha = senha;
	}



	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	public boolean getUseradmin() {
		return useradmin;
	}

	public void setUseradmin(boolean useradmin) {
		this.useradmin = useradmin;
	}
	
	

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	@Override
	public String toString() {
		return "ModelLogin [id=" + id + ", nome=" + nome + ", email=" + email + ", login=" + login + ", senha=" + senha
				+ ", useradmin=" + useradmin + ", perfil=" + perfil + "]";
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getExtensaofotouser() {
		return extensaofotouser;
	}

	public void setExtensaofotouser(String extensaofotouser) {
		this.extensaofotouser = extensaofotouser;
	}

	
	
	

}
