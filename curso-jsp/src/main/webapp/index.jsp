<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Curso JSP</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	
	
	<link rel="stylesheet" href="Style.css">
	
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">


	<main class="form-signin w-100 m-auto">
	
		<form action="ServletLogin" method="post" class="needs-validation">
			<input type="hidden" value="<% request.getParameter("url"); %>" name="url">
			
			<img class="mb-4" src="https://upload.wikimedia.org/wikipedia/pt/f/f6/Charlotte_Hornets.png">
			
			<h1 class="h3 mb-3 fw-normal">Bem vindo ao curso de JSP</h1>
			
			<div class="form-floating pb-2">
				<input name="login" type="text" id="floatingInput" class="form-control" placeholder="Seu usuário" required>
				<label for="floatingInput">Usuario</label>
				
			</div>
			
			<div class="form-floating pb-5">
			
				<input name="senha" type="password" id="floatingPassword" class="form-control" placeholder="Sua senha" required>
				<label for="floatingPassword">Senha</label>
				
			</div>
			
			<button class="btn btn-primary w-100 py-2" type="submit">Entrar</button>
			
			<p class="mt-5 mb-3 text-body-secondary">© 2024 - ITALO MIRANDA FONTENELE</p>

		</form>
		
	 	<h4 class="msg-error">${msg}</h4>
	
	</main>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(() => {
		  'use strict'
	
		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  const forms = document.querySelectorAll('.needs-validation')
	
		  // Loop over them and prevent submission
		  Array.from(forms).forEach(form => {
		    form.addEventListener('submit', event => {
		      if (!form.checkValidity()) {
		        event.preventDefault()
		        event.stopPropagation()
		      }
	
		      form.classList.add('was-validated')
		    }, false)
		  })
		})()
		
	
	
	</script>

</body>
</html>