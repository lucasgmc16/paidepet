<?php 
require_once("../../conexao.php"); 
@session_start();

$cliente = $_POST['cliente'];
$animal = @$_POST['animal'];
$servico = $_POST['servico'];

$data_entrega = $_POST['data_entrega'];
$obs = $_POST['obs'];

$query_cat = $pdo->query("SELECT * FROM servicos where id = '$servico' ");
$res_cat = $query_cat->fetchAll(PDO::FETCH_ASSOC);
$descricao = $res_cat[0]['nome'];
$valor = $res_cat[0]['valor'];

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
	$res = $pdo->prepare("INSERT INTO os SET cliente = :cliente, animal = :animal, descricao = :descricao, valor = :valor, data_entrega = :data_entrega, veterinario = '$_SESSION[cpf_usuario]', data = curDate(), obs = :obs, concluido = 'Não', valor_mao_obra = :valor, tipo = 'Serviço'");	

}else{
	$res = $pdo->prepare("UPDATE os SET cliente = :cliente, animal = :animal, descricao = :descricao, valor = :valor, data_entrega = :data_entrega, veterinario = '$_SESSION[cpf_usuario]', obs = :obs, concluido = 'Não', valor_mao_obra = :valor WHERE id = '$id'");
	
}

$res->bindValue(":cliente", $cliente);
$res->bindValue(":animal", $animal);
$res->bindValue(":descricao", $descricao);
$res->bindValue(":valor", $valor);
$res->bindValue(":data_entrega", $data_entrega);
$res->bindValue(":obs", $obs);

$res->execute();


//ENTRADA DO ANIMAL
$query = $pdo->query("SELECT * FROM controles where animal = '$animal' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
	if($total_reg == 0){
	$pdo->query("INSERT INTO controles SET animal = '$animal', veterinario = '$_SESSION[cpf_usuario]', data = curDate(), descricao = '$descricao' ");
}


echo 'Salvo com Sucesso!';

?>