<?php 
require_once("../../conexao.php"); 
@session_start();

$cliente = $_POST['cliente'];
$animal = @$_POST['animal'];
$servico = $_POST['servico'];
$descricao = $_POST['descricao'];
$data_entrega = $_POST['data_entrega'];
$valor = $_POST['valor'];
$obs = $_POST['obs'];

$valor = str_replace(',', '.', $valor);

@$id = $_POST['txtid2'];



//VERIFICAR SE O CLIENTE EXISTE
$query = $pdo->query("SELECT * FROM clientes where cpf = '$cliente' ");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg == 0){
		echo 'O Cliente não está cadastrado ou o CPF está incorreto!';
		exit();
}

if($cliente == ""){
	echo 'O CPF do Cliente é Obrigatório!';
	exit();
}

if($animal == ""){
	echo 'Você precisa selecionar um animal';
	exit();
}

if($valor == ""){
	echo 'O Valor é Obrigatório!';
	exit();
}



if($id == ""){
	$res = $pdo->prepare("INSERT INTO orcamentos SET cliente = :cliente, animal = :animal, descricao = :descricao, valor = :valor, servico = :servico, data_entrega = :data_entrega, veterinario = '$_SESSION[cpf_usuario]', data = curDate(), obs = :obs, status = 'Aberto'");	

}else{
	$res = $pdo->prepare("UPDATE orcamentos SET cliente = :cliente, animal = :animal, descricao = :descricao, valor = :valor, servico = :servico, data_entrega = :data_entrega, veterinario = '$_SESSION[cpf_usuario]', obs = :obs WHERE id = '$id'");
	
}

$res->bindValue(":cliente", $cliente);
$res->bindValue(":animal", $animal);
$res->bindValue(":descricao", $descricao);
$res->bindValue(":valor", $valor);
$res->bindValue(":servico", $servico);
$res->bindValue(":data_entrega", $data_entrega);
$res->bindValue(":obs", $obs);

$res->execute();


echo 'Salvo com Sucesso!';

?>