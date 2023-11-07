<?php 
require_once("../../conexao.php"); 

$cpf = $_POST['cpf'];
$animal = $_POST['animal'];

$query = $pdo->query("SELECT * FROM clientes where cpf = '$cpf'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
if(@count($res) == 0){
	echo 'O cliente não existe, CPF Incorreto';
	exit();
}

echo '<select name="animal" class="form-control" id="animal">';

$query = $pdo->query("SELECT * FROM animais where cliente = '$cpf' order by id desc ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < @count($res); $i++) { 
	foreach ($res[$i] as $key => $value) {
	}
	$nome_reg = $res[$i]['tipo_animal'] . ' - ' . $res[$i]['raca'];
	$id_reg = $res[$i]['id'];
	
	if(@$animal == $id_reg){
		$selected = 'selected';
	}else{
		$selected = '';
	}

	echo '<option value=" '.$id_reg. '" '.$selected.'>'.$nome_reg.'</option>';
 } 

echo '</select>';

?>