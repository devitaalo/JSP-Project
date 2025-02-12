<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
     
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

  <body>
  <!-- Pre-loader start -->
  <jsp:include page="theme-loader.jsp"></jsp:include>
  
  
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          <jsp:include page="navbar.jsp"></jsp:include>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                  
                <jsp:include page="navbarmainmenu.jsp"></jsp:include>
                  
                  
                  <div class="pcoded-content">
                      <!-- Page-header start -->
                       <jsp:include page="page-header.jsp"></jsp:include>
                      
                      <!-- Page-header end -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                            <h3>Cadastro de usuario</h3>

										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">

													<div class="card-block">

														<form enctype="multipart/form-data" class="form-material" action="<%= request.getContextPath() %>/ServletUsuarioController" method="post" id="form-user">
														
															<input type="hidden" name="acao" id="acao" value="">
														
															<div class="form-group form-primary form-static-label">
                                                                <input type="text" id="id" name="id" value="${modelLogin.id}" class="form-control" required readonly>
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Id:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default input-group mb-4">
                                                            	<div class="input-group-prepend">
                                                            		<img alt="Image User" src="" width="70px" id="fotoembase64">
                                                    
                                                            	</div>
                                                            
                                                            	<input type="file" accept="image/*" name="filefoto" onchange="visualizarImg('fotoembase64','filefoto');" id="filefoto" class="form-control-file" style="margin-top: 15px; margin-left: 10px;">
                                                            </div>

															<div class="form-group form-primary form-static-label">
                                                                <input type="text" id="nome" name="nome" value="${modelLogin.nome}" class="form-control" required>
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Nome:</label>
                                                            </div>

															
															<div class="form-group form-primary form-static-label">
																<input type="email" name="email" value="${modelLogin.email}" id="email"
																	class="form-control" required="required"> <span
																	class="form-bar"></span> <label class="float-label">Email:
																	</label>
															</div>

															<div class="form-group form-primary form-static-label">
																<select class="form-control form-select" name="perfil">
																	<option selected>[Selecione o perfil]</option>
																	<option value="ADMIN" <% 
																	
																	ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	
																	if (modelLogin != null && modelLogin.getPerfil().equals("ADMIN")) {
																		out.print(" ");
																		
																		out.print("selected");
																		
																		out.print(" ");
																		
																	}%>> ADMIN</option>
																	
																	<option value="SECRETARIA" <% 
																	
																	modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	
																	if (modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")) {
																		out.print(" ");
																		
																		out.print("selected");
																		
																		out.print(" ");
																		
																	}%>>SECRETARIA</option>
																	
																	<option value="AUXILIAR" <% 
																	
																		modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	
																		if (modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")) {
																		out.print(" ");
																		
																		out.print("selected");
																		
																		out.print(" ");
																		
																	}%>>AUXILIAR</option>
																</select>
															</div>
															
															
															<div class="form-group form-primary form-static-label">
																<input type="text" value="${modelLogin.login}" name="login" id="login"
																	class="form-control" required="required"> <span
																	class="form-bar"></span> <label class="float-label">Login:
																	</label>
															</div>
															<div class="form-group form-primary form-static-label">
																<input type="password" value="${modelLogin.senha}" name="senha" id="senha"
																	class="form-control" required="required"> <span
																	class="form-bar"></span> <label class="float-label">Senha:</label>
															</div>

															<div class="form-group form-primary form-static-label">


																<div class="form-check">
																	<input type="radio" name="sexo" checked value="MASCULINO" <% 
																		
																	modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	
																	if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")) {
																	out.print(" ");
																	
																	out.print("checked");
																	
																	out.print(" ");
																	}
																	%>>Masculino</>
																	
																	<input type="radio" name="sexo" value="FEMININO" <% 
																		
																	modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	
																	if (modelLogin != null && modelLogin.getSexo().equals("FEMININO")) {
																	out.print(" ");
																	
																	out.print("checked");
																	
																	out.print(" ");
																	}
																	%> >Feminino</>
																	
																</div>

															</div>

															<button type="submit" class="btn btn-success btn-round">Salvar</button>
															<button type="button" class="btn btn-danger btn-round" onclick="criarDeleteComAjax()">Excluir</button>
															<button type="button" class="btn btn-primary btn-round" onclick="limparForm()">Limpar</button>
															<button type="button" class="btn btn-secondary btn-round"
																data-toggle="modal" data-target="#exampleModal">
																Pesquisar</button>
														</form>

													</div>
												</div>
											</div>
										</div>
										
										<p id="mensagem">${msg}</p>

										<div style="height: 300px; overflow: scroll;">
											<table class="table" id="tabelaresultadosview">
												<thead>
													<tr>
														<th scope="col">ID</th>
														<th scope="col">Nome</th>
														<th scope="col">Ver</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${modelLogins}" var="ml">
														<tr>
															<td><c:out value="${ml.id}"></c:out></td>
															<td><c:out value="${ml.nome}"></c:out></td>
															<td><a class="btn btn-success" href="<%= request.getContextPath() %>/ServletUsuarioController?acao=buscarEditar&id=${ml.id}">Ver</a></td>
														</tr>
													
													</c:forEach>
												</tbody>
											</table>
										</div>

									</div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de usu�rio</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group mb-3">
						<input type="text" id="nomeBuscarModal" class="form-control"
							placeholder="Nome"
							aria-label="Nome" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="buscarUsuario()">Buscar</button>
						</div>
					</div>

				<div style="height: 300px; overflow: scroll;">
					<table class="table" id="tabelaResultados">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Nome</th>
								<th scope="col">Ver</th>
								
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
					
				<span id="totalResultados"></span>
					
				</div>
				<div class="modal-footer">
				
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Required Jquery -->
    <jsp:include page="javascriptFile.jsp"></jsp:include>

	<script>
	
	function verEditar(id){
		var urlAction = document.getElementById("form-user").action;

		window.location.href = urlAction + "?acao=buscarEditar&id="+ id;
		
	}

	function buscarUsuario(){
		
		var nomeBusca = document.getElementById("nomeBuscarModal").value;

		var urlAction = document.getElementById("form-user").action;

		
		if(nomeBusca != null && nomeBusca != "" && nomeBusca.trim() != ""){

			$.ajax({
				method:"get",
				url: urlAction,
				data: "nomeBusca="+nomeBusca + "&acao=buscarUserAjax",
				success: function(response) {
					
					var json = JSON.parse(response);
					
					$("#tabelaResultados > tbody > tr").remove();
					
					for(var p = 0; p < json.length; p++) {
						$("#tabelaResultados > tbody").append('<tr style="text-align: center;"> <td>' + json[p].id + '</td> <td> ' + json[p].nome + '</td>  <td> <button type="button" onclick="verEditar('+ json[p].id +')" class="btn btn-info">Ver</button> </td>  </tr>')
					}
					
					document.getElementById("totalResultados").textContent = "Resultados : " + json.length;
					
				}
				
				
				
			}).fail(function(xhr, status, errorThrow){
				alert("Erro ao buscar usuario por Nome " + xhr.responseText);
			});
		
		}
		
		
	}
	
	function criarDeleteComAjax(){
		
		if(confirm("Deseja excluir os dados?")) {
			var urlAction = document.getElementById("form-user").action;
			var idUser = document.getElementById("id").value;
			
			$.ajax({
				
				method:"get",
				url: urlAction,
				data: "id="+idUser + "&acao=deletarAjax",
				success: function(response) {
					limparForm();
					document.getElementById("mensagem").textContent = response;
				}
				
				
				
			}).fail(function(xhr, status, errorThrow){
				alert("Erro ao deletar usuario por ID " + xhr.responseText);
			});
			
			
			
		}
	}
	
	function criarDelete(){
		if(confirm("Deseja excluir os dados?")) {
			document.getElementById("form-user").method = "get";
			document.getElementById("acao").value = "deletar";
			document.getElementById("form-user").submit();
		}
	}
		
	function limparForm(){
		var elementos = document.getElementById("form-user").elements;
		console.log(elementos);
		
		for (p = 0; p < elementos.length; p++){
			elementos[p].value = "";
		}
		
	}
	
	function visualizarImg(fotoembase64, filefoto){
		
		var preview = document.getElementById(fotoembase64);
		console.log(preview)
		var fileUser = document.getElementById(filefoto).files[0];
		var reader = new FileReader();
		
		reader.onloadend = function (){
			preview.src = reader.result;
		
		};
		
		if(fileUser) {
			reader.readAsDataURL(fileUser);
		} else {
			preview.src = '';
		}
		
	}
	
	</script>

</body>

</html>
