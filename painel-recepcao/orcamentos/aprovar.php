<?php 
require_once("../../conexao.php"); 

$id = $_POST['id'];

//BUSCAR O VALOR DO ORÇAMENTO
$query_orc = $pdo->query("SELECT * FROM orcamentos where id = '$id' ");
$res_orc = $query_orc->fetchAll(PDO::FETCH_ASSOC);
$valor_orc = $res_orc[0]['valor'];
$cliente = $res_orc[0]['cliente'];
$veterinario = $res_orc[0]['veterinario'];
$data_entrega = $res_orc[0]['data_entrega'];
$servico = $res_orc[0]['servico'];
$animal = $res_orc[0]['animal'];
$obs = $res_orc[0]['obs'];

$query = $pdo->query("SELECT * FROM servicos where id = '$servico' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$nome_servico = $res[0]['nome'];

$total_prod = 0;

$query = $pdo->query("SELECT * FROM orc_prod where orcamento = '$id' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);

if(@count($res) == 0){
$total_pagar = $valor_orc;
}else{

for ($i=0; $i < @count($res); $i++) { 
	foreach ($res[$i] as $key => $value) {
	}
	$prod = $res[$i]['produto'];

	$query_pro = $pdo->query("SELECT * FROM produtos where id = '$prod' ");
	$res_pro = $query_pro->fetchAll(PDO::FETCH_ASSOC);
	$valor_prod = $res_pro[0]['valor_venda'];
	$estoque = $res_pro[0]['estoque'] - 1;
	
	$total_prod = $valor_prod + $total_prod;
	$total_pagar = $total_prod + $valor_orc;


	//ABATER DO ESTOQUE E LANÇAR NA VENDA
	$pdo->query("UPDATE produtos SET estoque = '$estoque' where id = '$prod' ");

	$pdo->query("INSERT INTO vendas SET produto = '$prod', valor = '$valor_prod', funcionario = '$veterinario', data = curDate(), id_orc = '$id' ");



}
}

//INSERIR NA TABELA DE CONTAS A RECEBER
	$pdo->query("INSERT INTO contas_receber SET descricao = 'Orçamento', valor = '$total_pagar', adiantamento = '0', veterinario = '$veterinario', cliente = '$cliente', data = curDate(), pago = 'Não', id_servico = '$id' ");

//INSERIR NA TABELA DE OS
	$pdo->query("INSERT INTO os SET descricao = '$nome_servico', valor = '$total_pagar', veterinario = '$veterinario', cliente = '$cliente', data_entrega = '$data_entrega', concluido = 'Não', valor_mao_obra = '$valor_orc', data = curDate(), animal = '$animal', obs = '$obs', tipo = 'Orçamento', id_orc = '$id' ");


	$pdo->query("UPDATE orcamentos SET status = 'Aprovado' WHERE id = '$id'");

	//ENTRADA DO ANIMAL
	$query = $pdo->query("SELECT * FROM controles where animal = '$animal' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
	if($total_reg == 0){
	$pdo->query("INSERT INTO controles SET animal = '$animal', veterinario = '$veterinario', data = curDate(), descricao = '$nome_servico' ");
}

	echo 'Aprovado com Sucesso!';

	?>