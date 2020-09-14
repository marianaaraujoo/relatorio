<?php 

include 'conexao.php';

    @$query = mysqli_query($link, "SELECT i.valor, ti.quantidade, t.data, t.idcliente, t.idvendedor FROM item i 
    	INNER JOIN transacaoitem ti ON ti.iditem = i.iditem 
    	INNER JOIN transacao t ON t.idtransacao = ti.idtransacao");

    @$count = mysqli_num_rows($query);
	echo $count;

    for($i = 0; $i < 1; $i++){

    	$html[$i] = "";

    	$html[$i] .= "<table>";
    	$html[$i] .= "<tr>";
    	$html[$i] .= "<td><b>Cliente</b></td>";
    	$html[$i] .= "<td><b>Vendedor</b></td>";
    	$html[$i] .= "<td><b>Valor mensal</b></td>";
    	$html[$i] .= "<td><b>Mês</b></td>";
    	$html[$i] .= "</tr>";
    	$html[$i] .= "</table>";
    }


    $i = 1;

    while(@$row = mysqli_fetch_array($query)){

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

    	@$html[$i] .= "<table>";
     	@$html[$i] .= "<tr>";
        $html[$i] .= "<td align='center'>".$cliente. "</td>";
        $html[$i] .= "<td align='center'>".$vendedor."</td>";
        $html[$i] .= "<td align='center'>".$calculomensal."</td>";
        $html[$i] .= "<td align='center'>".$mes. "</td>";
        $html[$i] .= "</tr>";
        $html[$i] .= "</table>";

    $i++;	

    $arquivo = "relatorio". ".xls";
    header ("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
    header ("Last-Modified: " . gmdate("D,d M YH:i:s") . " GMT");
    header ("Cache-Control: no-cache, must-revalidate");
    header ("Pragma: no-cache");
    header ("Content-type: application/x-msexcel");
    header ("Content-Disposition: attachment; filename={$arquivo}" );
    header ("Content-Description: PHP Generated Data" );


    }

    for($i=0;$i<=$count;$i++){  
        echo $html[$i];
    }


    


?>