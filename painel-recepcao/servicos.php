<?php 
@session_start();
if(@$_SESSION['nivel_usuario'] == null || @$_SESSION['nivel_usuario'] != 'recep'){
	echo "<script language='javascript'> window.location='../index.php' </script>";
}

$pag = "servicos";
require_once("../conexao.php"); 

$funcao = @$_GET['funcao'];

?>

<!-- DataTales Example -->
<div class="card shadow mb-4">

	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>Cliente</th>
						<th>Veterinário</th>
						<th>Valor Serviço</th>
						<th>Serviço</th>
						<th>Animais</th>
						<th>Data Entrega</th>
						<th>Ações</th>
					</tr>
				</thead>

				<tbody>

					<?php 

					$query = $pdo->query("SELECT * FROM os order by data_entrega asc, concluido asc");
					$res = $query->fetchAll(PDO::FETCH_ASSOC);
					
					for ($i=0; $i < @count($res); $i++) { 
						foreach ($res[$i] as $key => $value) {
						}
						$cliente = $res[$i]['cliente'];
						$animal = $res[$i]['animal'];
						$descricao = $res[$i]['descricao'];
						$valor = $res[$i]['valor'];
						$valor_mao_obra = $res[$i]['valor_mao_obra'];
						
						$data = $res[$i]['data'];
						$data_entrega = $res[$i]['data_entrega'];
						$concluido = $res[$i]['concluido'];
						$veterinario = $res[$i]['veterinario'];
						$tipo = $res[$i]['tipo'];
						$id = $res[$i]['id'];

						$data = implode('/', array_reverse(explode('-', $data)));
						$data_entrega = implode('/', array_reverse(explode('-', $data_entrega)));
						$valor = number_format($valor, 2, ',', '.');
						$valor_mao_obra = number_format($valor_mao_obra, 2, ',', '.');


						$query_cat = $pdo->query("SELECT * FROM clientes where cpf = '$cliente' ");
						$res_cat = $query_cat->fetchAll(PDO::FETCH_ASSOC);
						$nome_cli = $res_cat[0]['nome'];
						$email_cli = $res_cat[0]['email'];


						$query_cat = $pdo->query("SELECT * FROM veterinarios where cpf = '$veterinario' ");
						$res_cat = $query_cat->fetchAll(PDO::FETCH_ASSOC);
						$nome_vet = $res_cat[0]['nome'];
						

						$query_cat = $pdo->query("SELECT * FROM animais where id = '$animal' ");
						$res_cat = $query_cat->fetchAll(PDO::FETCH_ASSOC);
						$raca = $res_cat[0]['raca'];
						$tipo_animal = $res_cat[0]['tipo_animal'];


						
						$query_cat = $pdo->query("SELECT * FROM veterinarios where cpf = '$veterinario' ");
						$res_cat = $query_cat->fetchAll(PDO::FETCH_ASSOC);
						$nome_veterinario = $res_cat[0]['nome'];


						if($concluido == 'Sim'){
							$cor_pago = 'text-success';
						}else{
							$cor_pago = 'text-danger';
						}

						?>

						<tr>
							<td><i class='fas fa-square mr-1 <?php echo $cor_pago ?>'></i>
								<?php echo $nome_cli ?></td>
							<td><?php echo $nome_vet ?></td>
							<td>R$ <?php echo $valor ?></td>
							<td><?php echo $descricao ?></td>
							<td><?php echo $tipo_animal .' '.$raca ?></td>
							<td><?php echo $data_entrega ?></td>
							
							<td>
								
									<a href="../painel-veterinario/rel/rel_os.php?id=<?php echo $id ?>" target="_blank" class='text-info mr-1' title='Imprimir OS'><i class='far fa-file-alt'></i></a>

							</td>
						</tr>
					<?php } ?>





				</tbody>
			</table>
		</div>
	</div>
</div>





<script type="text/javascript">
	$(document).ready(function () {


		var funcao = "<?=$funcao?>";

		if(funcao.trim() === 'editar'){
			$('#btn-buscar').click();
		}else{
			$('#div-animal').text('Busque pelo CPF ao Lado');
		}


		$('#dataTable').dataTable({
			"ordering": false
		})

		$('#dataTable2').dataTable({
			"ordering": false
		})

	});
</script>



