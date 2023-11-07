<?php 
require_once("../../conexao.php"); 

$id = $_POST['id'];


if($comissao_veterinario == 'Sim'){
	$query = $pdo->query("SELECT * FROM os where id = '$id' ");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$valor_mao_obra = $res[0]['valor_mao_obra'];
	$veterinario = $res[0]['veterinario'];
	$tipo = $res[0]['tipo'];
	$id_orc = $res[0]['id_orc'];
	$animal = $res[0]['animal'];

	$comissao = $valor_mao_obra * $valor_comissao;

	if($tipo == 'Orçamento'){
		$pdo->query("INSERT INTO comissoes SET valor = '$comissao', veterinario = '$veterinario', tipo = '$tipo', id_servico = '$id_orc', data = curDate() ");
	}else{
		$pdo->query("INSERT INTO comissoes SET valor = '$comissao', veterinario = '$veterinario', tipo = '$tipo', id_servico = '$id', data = curDate() ");
	}
	


	//LANÇAR COMISSÃO NAS CONTAS A PAGAR
	$pdo->query("INSERT INTO contas_pagar SET descricao = 'Comissão', valor = '$comissao', funcionario = '$veterinario', data = curDate(), data_venc = curDate(), pago = 'Não' ");

}

//CONCLUIR STATUS DO ORÇAMENTO
if($tipo == 'Orçamento'){
	$pdo->query("UPDATE orcamentos SET status = 'Concluído' WHERE id = '$id_orc'");
}

$pdo->query("UPDATE os SET concluido = 'Sim' WHERE id = '$id'");


//LANÇAR NA TABELA DE RETORNOS
$query = $pdo->query("SELECT * FROM retornos where animal = '$animal' ");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	if(@count($res) == 0){
		$pdo->query("INSERT INTO retornos SET animal = '$animal', data_serv = curDate(), data_contato = curDate()");
	}else{
		$pdo->query("UPDATE retornos SET data_serv = curDate(), data_contato = curDate() WHERE animal = '$animal'");
	}
	



echo 'Concluído com Sucesso!';

?>