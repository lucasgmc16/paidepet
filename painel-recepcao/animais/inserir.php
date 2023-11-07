<?php 
require_once("../../conexao.php"); 

$tipo_animal = $_POST['tipo_animal'];
$raca = $_POST['raca'];
$cliente = $_POST['cliente'];

@$antigo = $_POST['antigo'];
@$id = $_POST['txtid2'];


//VERIFICAR SE O CLIENTE EXISTE
$query = $pdo->query("SELECT * FROM clientes where cpf = '$cliente' ");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg == 0){
		echo 'O Cliente não está cadastrado ou o CPF está incorreto!';
		exit();
}

if($raca == ""){
	echo 'O raca é Obrigatório!';
	exit();
}

if($tipo_animal == ""){
	echo 'A tipo_animal é Obrigatória!';
	exit();
}


if($id == ""){
	$res = $pdo->prepare("INSERT INTO animais SET tipo_animal = :tipo_animal, raca = :raca, cliente = :cliente, data = curDate()");	

}else{
	$res = $pdo->prepare("UPDATE animais SET tipo_animal = :tipo_animal, raca = :raca, cliente = :cliente WHERE id = '$id'");
	
}

$res->bindValue(":tipo_animal", $tipo_animal);
$res->bindValue(":raca", $raca);
$res->bindValue(":cliente", $cliente);

$res->execute();


echo 'Salvo com Sucesso!';

?>