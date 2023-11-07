<?php 

$nome_paidepet = "paidepet";
$url = "http://localhost/paidepet/";
$endereco_paidepet = "Terras IFALinas Maceió";
$telefone_paidepet = "(82)98888-8888";
$email_adm = 'lgmc1@aluno.ifal.edu.br';
$rodape_relatorios = "Desenvolvido Lucas Costa, Marcelo Souza e Melkyzedeque Augusto - Sistema de Informação Gerenciais";

//VARIAVEIS DO BANCO DE DADOS LOCAL
$servidor = 'localhost';
$usuario = 'root';
$senha = '';
$banco = 'paidepet';


//ALGUMAS VARIAVEIS GLOBAIS

//A PARTIR DE X PRODUTOS O NIVEL DO ESTOQUE ESTARÁ BAIXO
$nivel_estoque = 20;
$desconto_orc = 'Sim';
$valor_desconto = 5; //VALOR EM PORCENTAGEM, POR EXEMPLO 5 VAI SER 5 % SOBRE O VALOR FINAL
$validade_orcamento_dias = 5; //5 DIAS PARA VALIDADE DO ORÇAMENTO
$excluir_orcamento_dias = 15; //APÓS 15 DIAS O ORÇAMENTO QUE NÃO FOR APROVADO PELO CLIENTE SERÁ EXCLUÍDO

$comissao_veterinario = 'Sim';  // Se não for ter comissão no sisteema mude para não
$valor_comissao = 0.30; // COLOCAR O VALOR DA COMSISÃO COM A PORCENTAGEM MANTENDO O 0 NA FRENTEM, 0.30 COORESPONDE A 30% 

$dias_alerta_retorno = 180; //DIAS PARA AVISAR A RECEPÇÃO QUE O ANIMAL NÃO RETORNOU AO PETSHOP A PARTIR DE 180 DIAS

$mensagem_retorno = "Vimos que já faz um tempo que não vemos seu animal, estamos com uma promoção para serviços como: Banho, vacina e vários outros, aproveite nossa promoção... "; //TEXTO DA MENSAGEM NO EMAIL PARA O CLIENTE QUANDO COMPLETAR XX DIAS QUE ELE NÃO FAZ NENHUM SERVIÇO
 ?>