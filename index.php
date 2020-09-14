<html>
<head>
  	<title>Unilab - Relatório de Vendas</title>
  	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
  <div class="container">
	<table class="table table-hover">
    	<header>
      		<h2>Relatório de Vendas </h2>  
    	</header>
    	
    	<thead>
      		<tr>
        		<th scope="col">Cliente</th>
        		<th scope="col">Vendedor</th>
        		<th scope="col">Valor mensal</th>
        		<th scope="col">Meses</th>
      		</tr>
    	</thead>
     	
     	<?php

    	include 'conexao.php';   

    	@$query = mysqli_query($link, "SELECT i.valor, ti.quantidade, t.data, t.idcliente, t.idvendedor FROM item i 
    	INNER JOIN transacaoitem ti ON ti.iditem = i.iditem 
    	INNER JOIN transacao t ON t.idtransacao = ti.idtransacao");

    	while($row = mysqli_fetch_assoc($query)){

    		$data = $row['data'];
    		$mes = $data[5].$data[6];
  

    		$valor = $row['valor'];
    		$quantidade = $row['quantidade'];

    		$calculomensal = $valor * $quantidade;
    	
    	    if ($row['idcliente'] == 1) {
    			$cliente = "Maria";

    		}elseif ($row['idcliente'] == 2) {
    			$cliente = "José";
    	
    		}elseif ($row['idcliente'] == 3) {
    			$cliente = "João";
    		}

	
			if ($row['idvendedor'] == 1) {
    			$vendedor = "Antônio";

    		}elseif ($row['idvendedor'] == 2) {
    			$vendedor = "Francisco";
    	
    		}elseif ($row['idvendedor'] == 3) {
    			$vendedor = "Raimundo";
    		}    

    		if ($mes == 1) {
    			$mes = "Janeiro";
    		
    		}elseif ($mes == 2) {
    			$mes = "Fevereiro";
    		}elseif ($mes == 3) {
    			$mes = "Março";
    		}elseif ($mes == 4) {
    			$mes = "Abril";
    		}elseif ($mes == 5) {
    			$mes = "Maio";
    		}elseif ($mes == 6) {
    			$mes = "Junho";
    		}elseif ($mes == 7) {
    			$mes = "Julho";
    		}elseif ($mes == 8) {
    			$mes = "Agosto";
    		}elseif ($mes == 9) {
    			$mes = "Setembro";
    		}elseif ($mes == 10) {
    			$mes = "Outubro";
    		}elseif ($mes == 11) {
    			$mes = "Novembro";
    		}elseif ($mes == 12) {
    			$mes = "Dezembro";
    		}


    		echo "<tr>";
    		echo "<td>".$cliente."</td>";
    		echo "<td>".$vendedor."</td>";
    		echo "<td>".$calculomensal."</td>";
    		echo "<td>".$mes."</td>";
    		echo "</tr>";  	
    	}
	?>
  	</table>

  	<a href="relatorio.php">
  		<button class='btn btn-outline-primary'>Gerar Relatório</button>
  	</a>
</div>
</div>
</body>
</html>