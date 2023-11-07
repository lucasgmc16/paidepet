-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/11/2023 às 19:44
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `paidepet`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `animais`
--

CREATE TABLE `animais` (
  `id` int(11) NOT NULL,
  `tipo_animal` varchar(30) NOT NULL,
  `raca` varchar(30) NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `animais`
--

INSERT INTO `animais` (`id`, `tipo_animal`, `raca`, `cliente`, `data`) VALUES
(12, 'Cachorro', 'Pug', '121.212.121-21', '2023-11-07'),
(13, 'Gato', 'Não conheço raça de gato', '131.313.131-31', '2023-11-07'),
(14, 'Cavalo', 'Pé de pano', '141.414.141-41', '2023-11-07'),
(15, 'Touro', 'Touro Ferdinando', '151.515.151-51', '2023-11-07'),
(16, 'Coelho', 'Perna Longa', '161.616.161-61', '2023-11-07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(10, 'Brinquedos para Cachorro'),
(11, 'Vacinas'),
(12, 'Ração'),
(13, 'Brinquedos para Gato');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cpf`, `telefone`, `email`, `endereco`, `data`) VALUES
(6, 'clientinho1', '121.212.121-21', '(12) 12121-2121', 'clientinho1@gmail.com', 'Rua Clienti1', '2023-11-07'),
(7, 'clientinho2', '131.313.131-31', '(13) 13131-3131', 'clientinho2@gmail.com', 'Rua Clienti2', '2023-11-07'),
(8, 'clientinho3', '141.414.141-41', '(14) 14141-4141', 'clientinho3@gmail.com', 'Rua Clienti3', '2023-11-07'),
(9, 'clientinho4', '151.515.151-51', '(15) 15151-5151', 'clientinho4@gmail.com', 'Rua Clienti4', '2023-11-07'),
(10, 'clientinho5', '161.616.161-61', '(16) 16161-6161', 'clientinho5@gmail.com', 'Rua Clienti5', '2023-11-07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comissoes`
--

CREATE TABLE `comissoes` (
  `id` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `veterinario` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `id_servico` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `comissoes`
--

INSERT INTO `comissoes` (`id`, `valor`, `veterinario`, `tipo`, `id_servico`, `data`) VALUES
(20, 30.00, '111.111.111-11', 'Serviço', 42, '2023-11-07'),
(21, 6.00, '111.111.111-11', 'Serviço', 43, '2023-11-07'),
(22, 30.00, '111.111.111-11', 'Serviço', 44, '2023-11-07'),
(23, 30.00, '111.111.111-11', 'Serviço', 45, '2023-11-07'),
(24, 45.00, '111.111.111-11', 'Serviço', 46, '2023-11-07'),
(25, 6.00, '111.111.111-11', 'Serviço', 47, '2023-11-07'),
(26, 30.00, '111.111.111-11', 'Serviço', 48, '2023-11-07'),
(27, 9000.00, '111.111.111-11', 'Orçamento', 21, '2023-11-07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `funcionario` varchar(20) NOT NULL,
  `data` date NOT NULL,
  `id_conta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `compras`
--

INSERT INTO `compras` (`id`, `produto`, `valor`, `funcionario`, `data`, `id_conta`) VALUES
(12, 30, 2500.00, '000.000.000-00', '2023-11-07', 36),
(13, 27, 2400.00, '000.000.000-00', '2023-11-07', 37),
(14, 25, 240.00, '000.000.000-00', '2023-11-07', 38),
(15, 22, 80.00, '000.000.000-00', '2023-11-07', 39),
(16, 23, 15.00, '000.000.000-00', '2023-11-07', 40),
(17, 30, 200.00, '000.000.000-00', '2023-11-07', 41),
(18, 29, 250.00, '000.000.000-00', '2023-11-07', 42),
(19, 31, 210.00, '000.000.000-00', '2023-11-07', 43);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas_pagar`
--

CREATE TABLE `contas_pagar` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `funcionario` varchar(20) NOT NULL,
  `data` date NOT NULL,
  `data_venc` date NOT NULL,
  `pago` varchar(5) NOT NULL,
  `imagem` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `contas_pagar`
--

INSERT INTO `contas_pagar` (`id`, `descricao`, `valor`, `funcionario`, `data`, `data_venc`, `pago`, `imagem`) VALUES
(33, 'Compra de Produtos', 20.00, '000.000.000-00', '2023-11-07', '2023-11-07', 'Sim', NULL),
(35, 'Compra de Produtos', 80.00, '000.000.000-00', '2023-11-07', '2023-11-07', 'Não', NULL),
(36, 'Compra de Produtos', 2500.00, '000.000.000-00', '2023-11-07', '2023-11-07', 'Não', NULL),
(37, 'Compra de Produtos', 2400.00, '000.000.000-00', '2023-11-07', '2023-11-07', 'Não', NULL),
(38, 'Compra de Produtos', 240.00, '000.000.000-00', '2023-11-07', '2023-11-07', 'Não', NULL),
(39, 'Compra de Produtos', 80.00, '000.000.000-00', '2023-11-07', '2023-11-07', 'Sim', NULL),
(40, 'Compra de Produtos', 15.00, '000.000.000-00', '2023-11-07', '2023-11-07', 'Sim', NULL),
(41, 'Compra de Produtos', 200.00, '000.000.000-00', '2023-11-07', '2023-11-07', 'Sim', NULL),
(42, 'Compra de Produtos', 250.00, '000.000.000-00', '2023-11-07', '2023-11-07', 'Sim', NULL),
(43, 'Compra de Produtos', 210.00, '000.000.000-00', '2023-11-07', '2023-11-07', 'Sim', NULL),
(44, 'Caixa 2', 20000.00, '666.666.666-66', '2023-11-07', '2023-11-07', 'Não', 'sem-foto.jpg'),
(45, 'Comissão', 30.00, '111.111.111-11', '2023-11-07', '2023-11-07', 'Sim', NULL),
(46, 'Comissão', 6.00, '111.111.111-11', '2023-11-07', '2023-11-07', 'Não', NULL),
(47, 'Comissão', 30.00, '111.111.111-11', '2023-11-07', '2023-11-07', 'Não', NULL),
(48, 'Comissão', 30.00, '111.111.111-11', '2023-11-07', '2023-11-07', 'Não', NULL),
(49, 'Comissão', 45.00, '111.111.111-11', '2023-11-07', '2023-11-07', 'Não', NULL),
(50, 'Comissão', 6.00, '111.111.111-11', '2023-11-07', '2023-11-07', 'Não', NULL),
(51, 'Comissão', 30.00, '111.111.111-11', '2023-11-07', '2023-11-07', 'Não', NULL),
(52, 'Comissão', 9000.00, '111.111.111-11', '2023-11-07', '2023-11-07', 'Não', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas_receber`
--

CREATE TABLE `contas_receber` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `adiantamento` decimal(8,2) DEFAULT NULL,
  `veterinario` varchar(20) NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `funcionario` varchar(20) DEFAULT NULL,
  `data` date NOT NULL,
  `pago` varchar(5) NOT NULL,
  `id_servico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `contas_receber`
--

INSERT INTO `contas_receber` (`id`, `descricao`, `valor`, `adiantamento`, `veterinario`, `cliente`, `funcionario`, `data`, `pago`, `id_servico`) VALUES
(28, 'Orçamento', 30030.00, 0.00, '111.111.111-11', '141.414.141-41', NULL, '2023-11-07', 'Não', 21),
(29, 'Orçamento', 679.99, 0.00, '111.111.111-11', '151.515.151-51', NULL, '2023-11-07', 'Não', 22);

-- --------------------------------------------------------

--
-- Estrutura para tabela `controles`
--

CREATE TABLE `controles` (
  `id` int(11) NOT NULL,
  `animal` int(11) NOT NULL,
  `veterinario` varchar(20) NOT NULL,
  `data` date NOT NULL,
  `descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `controles`
--

INSERT INTO `controles` (`id`, `animal`, `veterinario`, `data`, `descricao`) VALUES
(9, 12, '111.111.111-11', '2023-11-07', 'Banho'),
(10, 13, '111.111.111-11', '2023-11-07', 'Vacinar'),
(11, 14, '111.111.111-11', '2023-11-07', 'Tosa'),
(12, 15, '111.111.111-11', '2023-11-07', 'Banho'),
(13, 16, '111.111.111-11', '2023-11-07', 'Banho e Tosa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo_pessoa` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `tipo_pessoa`, `cpf`, `telefone`, `email`, `endereco`) VALUES
(6, 'Ração dos Pets', 'Jurídica', '77.777.777/7777-77', '(77) 77777-7777', 'raçaoDosPets@gmail.com', 'RUA N7'),
(7, 'João Brinquedos', 'Física', '888.888.888-88', '(88) 88888-8888', 'joazinho@gmail.com', 'RUA N8'),
(8, 'Vacinador de Vacinas', 'Jurídica', '99.999.999/9999-99', '(99) 99999-9999', 'vacinei@gmail.com', 'RUA N9'),
(9, 'Marcos Equipamentos', 'Física', '101.010.101-01', '(10) 10101-0101', 'marquinhos@gmail.com', 'RUA N10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `funcionario` varchar(20) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `movimentacoes`
--

INSERT INTO `movimentacoes` (`id`, `tipo`, `descricao`, `valor`, `funcionario`, `data`) VALUES
(13, 'Saída', 'Compra de Produtos', 210.00, '666.666.666-66', '2023-11-07'),
(14, 'Saída', 'Compra de Produtos', 250.00, '666.666.666-66', '2023-11-07'),
(15, 'Saída', 'Compra de Produtos', 200.00, '666.666.666-66', '2023-11-07'),
(16, 'Saída', 'Compra de Produtos', 20.00, '666.666.666-66', '2023-11-07'),
(17, 'Saída', 'Compra de Produtos', 15.00, '666.666.666-66', '2023-11-07'),
(18, 'Saída', 'Compra de Produtos', 80.00, '666.666.666-66', '2023-11-07'),
(19, 'Saída', 'Comissão', 30.00, '666.666.666-66', '2023-11-07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `orcamentos`
--

CREATE TABLE `orcamentos` (
  `id` int(11) NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `animal` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `servico` int(11) NOT NULL,
  `data` date NOT NULL,
  `data_entrega` date NOT NULL,
  `veterinario` varchar(20) NOT NULL,
  `obs` text NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `orcamentos`
--

INSERT INTO `orcamentos` (`id`, `cliente`, `animal`, `descricao`, `valor`, `servico`, `data`, `data_entrega`, `veterinario`, `obs`, `status`) VALUES
(19, '121.212.121-21', 12, 'Tá fedendo muito! Isso não é um cachorro... É um porco! ', 50.00, 10, '2023-11-07', '2023-11-07', '111.111.111-11', 'Problemas respiratórios - Padrão Pug', 'Aberto'),
(20, '131.313.131-31', 13, 'Gato apresenta sintomas de Raiva! Principalmente por eu não saber a raça dele', 50.00, 13, '2023-11-07', '2023-11-07', '111.111.111-11', 'Ele tem muita raiva! Cuidado para não se arranhar', 'Aberto'),
(21, '141.414.141-41', 14, 'Cavalo famoso por participar do Toy Story. É importante aparar os pelos para ele aparecer na frente das câmeras.', 30000.00, 11, '2023-11-07', '2023-11-07', '111.111.111-11', 'Pedir um autógrafo! Ele é famoso!', 'Concluído'),
(22, '151.515.151-51', 15, 'Tá com muito sangue no corpo. Provavelmente matou alguém durante a tourada', 500.00, 10, '2023-11-07', '2023-11-07', '111.111.111-11', 'Também é famoso! Pedir um autógrafo na saída.', 'Aprovado'),
(23, '161.616.161-61', 16, 'O que é que há velhinho?', 1.00, 12, '2023-11-07', '2023-11-07', '111.111.111-11', 'Sérios problema em relação ao vício de cenoura e de repetir \"o que é que há velhinho\" algumas vezes.', 'Aberto');

-- --------------------------------------------------------

--
-- Estrutura para tabela `orc_prod`
--

CREATE TABLE `orc_prod` (
  `id` int(11) NOT NULL,
  `orcamento` int(11) NOT NULL,
  `produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `orc_prod`
--

INSERT INTO `orc_prod` (`id`, `orcamento`, `produto`) VALUES
(38, 23, 31),
(39, 23, 30),
(40, 23, 30),
(41, 23, 29),
(42, 22, 22),
(43, 22, 24),
(44, 22, 26),
(45, 19, 31),
(46, 19, 31),
(47, 21, 31),
(48, 22, 31);

-- --------------------------------------------------------

--
-- Estrutura para tabela `os`
--

CREATE TABLE `os` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `veterinario` varchar(20) NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `data_entrega` date NOT NULL,
  `concluido` varchar(5) NOT NULL,
  `valor_mao_obra` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `animal` int(11) NOT NULL,
  `garantia` int(11) DEFAULT NULL,
  `obs` text NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `id_orc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `os`
--

INSERT INTO `os` (`id`, `descricao`, `valor`, `veterinario`, `cliente`, `data_entrega`, `concluido`, `valor_mao_obra`, `data`, `animal`, `garantia`, `obs`, `tipo`, `id_orc`) VALUES
(42, 'Banho', 100.00, '111.111.111-11', '121.212.121-21', '2023-11-07', 'Sim', 100.00, '2023-11-07', 12, NULL, 'as', 'Serviço', NULL),
(43, 'Vacinar', 20.00, '111.111.111-11', '131.313.131-31', '2023-11-07', 'Sim', 20.00, '2023-11-07', 13, NULL, 'asdasd', 'Serviço', NULL),
(44, 'Tosa', 100.00, '111.111.111-11', '141.414.141-41', '2023-11-07', 'Sim', 100.00, '2023-11-07', 14, NULL, 'asdasda', 'Serviço', NULL),
(45, 'Banho', 100.00, '111.111.111-11', '151.515.151-51', '2023-11-07', 'Sim', 100.00, '2023-11-07', 15, NULL, '123123', 'Serviço', NULL),
(46, 'Banho e Tosa', 150.00, '111.111.111-11', '161.616.161-61', '2023-11-07', 'Sim', 150.00, '2023-11-07', 16, NULL, '', 'Serviço', NULL),
(47, 'Vacinar', 20.00, '111.111.111-11', '161.616.161-61', '2023-11-07', 'Sim', 20.00, '2023-11-07', 16, NULL, '123asd', 'Serviço', NULL),
(48, 'Tosa', 100.00, '111.111.111-11', '141.414.141-41', '2023-11-07', 'Sim', 100.00, '2023-11-07', 14, NULL, 'asdas', 'Serviço', NULL),
(49, 'Tosa', 30030.00, '111.111.111-11', '141.414.141-41', '2023-11-07', 'Sim', 30000.00, '2023-11-07', 14, NULL, 'Pedir um autógrafo! Ele é famoso!', 'Orçamento', 21),
(50, 'Banho', 679.99, '111.111.111-11', '151.515.151-51', '2023-11-07', 'Não', 500.00, '2023-11-07', 15, NULL, 'Também é famoso! Pedir um autógrafo na saída.', 'Orçamento', 22),
(51, 'Banho e Tosa', 150.00, '111.111.111-11', '161.616.161-61', '2023-11-07', 'Não', 150.00, '2023-11-07', 16, NULL, '', 'Serviço', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `categoria` int(11) NOT NULL,
  `fornecedor` int(11) NOT NULL,
  `valor_compra` decimal(8,2) NOT NULL,
  `valor_venda` decimal(8,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  `descricao` text DEFAULT NULL,
  `imagem` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `categoria`, `fornecedor`, `valor_compra`, `valor_venda`, `estoque`, `descricao`, `imagem`) VALUES
(19, 'Bola de Borracha', 10, 7, 10.00, 20.00, 50, 'Uma bola de borracha durável é um brinquedo clássico para cachorros. Eles adoram perseguir, morder e buscar a bola.', 'sem-foto.jpg'),
(20, 'Corda de nó', 10, 7, 20.00, 40.00, 20, 'As cordas de nó são ótimas para jogos de puxar e mastigar. Elas também ajudam a manter os dentes do seu cachorro limpos.', 'sem-foto.jpg'),
(21, 'Kong', 10, 7, 30.00, 40.00, 19, 'O Kong é um brinquedo oco que pode ser recheado com petiscos ou ração. Isso mantém o cachorro entretido e estimula o seu intelecto.', 'sem-foto.jpg'),
(22, 'Frisbee', 10, 7, 10.00, 15.00, 31, 'Um frisbee de borracha é excelente para jogar pegar. Certifique-se de escolher um feito de material não tóxico e seguro para cães.', 'sem-foto.jpg'),
(23, 'Ossos de nylon', 10, 7, 15.00, 35.00, 33, 'Os ossos de nylon são resistentes e duradouros, ideais para cachorros que gostam de mastigar. Eles ajudam a manter os dentes saudáveis.', 'sem-foto.jpg'),
(24, 'Varinha com penas', 13, 7, 21.00, 35.00, 29, 'As varinhas com penas são ótimas para estimular o instinto de caça do seu gato. Eles adoram perseguir as penas e saltar para pegá-las.', 'sem-foto.jpg'),
(25, 'Bolas de brinquedo', 13, 7, 5.00, 15.00, 71, ' Bolas pequenas com guizos ou sinos dentro são um sucesso entre os gatos. Eles gostam de persegui-las e batê-las com as patas.', 'sem-foto.jpg'),
(26, 'Arranhador', 13, 7, 55.00, 99.99, 34, 'Os arranhadores são brinquedos essenciais para gatos, pois ajudam a afiar as unhas e a manter a saúde das garras. Eles também proporcionam uma superfície para o gato se esticar.', 'sem-foto.jpg'),
(27, 'Catnip', 13, 7, 100.00, 200.00, 124, 'Muitos gatos adoram a catnip (maconha dos gatos), por isso, brinquedos recheados com catnip são muito populares. Esses brinquedos mantêm os gatos entretidos e ativos.', 'sem-foto.jpg'),
(28, 'Labirinto para petiscos', 13, 7, 12.00, 23.00, 14, 'Existem brinquedos que são labirintos ou quebra-cabeças que dispõem de petiscos no interior. O gato precisa usar suas habilidades para liberar os petiscos, o que os mantém mentalmente estimulados.', 'sem-foto.jpg'),
(29, 'Vacina contra a raiva', 11, 7, 50.00, 100.00, 17, 'A vacina contra a raiva é uma das mais importantes para cães e gatos, pois a raiva é uma doença viral mortal que pode ser transmitida para humanos. Geralmente, é administrada quando o animal é jovem e, em seguida, regularmente como um reforço.', 'sem-foto.jpg'),
(30, 'Vacina contra ódio', 11, 8, 50.00, 100.00, 69, 'A vacina contrao ódio é uma das mais importantes para cães e gatos, pois a raiva é uma doença viral mortal que pode ser transmitida para humanos. Geralmente, é administrada quando o animal é jovem e, em seguida, regularmente como um reforço.', 'sem-foto.jpg'),
(31, 'Comida', 12, 6, 10.00, 30.00, 119, 'Comidinha!!!', 'sem-foto.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `recepcionistas`
--

CREATE TABLE `recepcionistas` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `recepcionistas`
--

INSERT INTO `recepcionistas` (`id`, `nome`, `cpf`, `telefone`, `email`, `endereco`) VALUES
(6, 'Thiago Medeiros Costa', '444.444.444-44', '(44) 44444-4444', 'thiago@gmail.com', 'RUA N4'),
(7, 'Luiza Goes Morais', '555.555.555-55', '(55) 55555-5555', 'luiza@gmail.com', 'RUA N5'),
(8, 'Manuela de Melo Jesus', '666.666.666-66', '(66) 66666-6666', 'manu@gmail.com', 'RUA N6');

-- --------------------------------------------------------

--
-- Estrutura para tabela `retornos`
--

CREATE TABLE `retornos` (
  `id` int(11) NOT NULL,
  `animal` int(11) NOT NULL,
  `data_serv` date NOT NULL,
  `data_contato` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `retornos`
--

INSERT INTO `retornos` (`id`, `animal`, `data_serv`, `data_contato`) VALUES
(4, 12, '2023-11-07', '2023-11-07'),
(5, 13, '2023-11-07', '2023-11-07'),
(6, 14, '2023-11-07', '2023-11-07'),
(7, 15, '2023-11-07', '2023-11-07'),
(8, 16, '2023-11-07', '2023-11-07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `valor` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`, `valor`) VALUES
(10, 'Banho', 100.00),
(11, 'Tosa', 100.00),
(12, 'Banho e Tosa', 150.00),
(13, 'Vacinar', 20.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `nivel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `email`, `senha`, `nivel`) VALUES
(11, 'Administrador', '000.000.000-00', 'lgmc1@aluno.ifal.edu.br', '123', 'admin'),
(15, 'Marcelo Souza Tenório', '111.111.111-11', 'mst4@aluno.ifal.edu.br', '123', 'veterinario'),
(16, 'Melkyzedeque Augusto Silva', '222.222.222-22', 'mas33@aluno.ifal.edu.br', '123', 'veterinario'),
(17, 'Ytalo Gabriel Andrade dos Santos Eugenio', '333.333.333-33', 'ygase1@aluno.ifal.edu.br', '123', 'veterinario'),
(18, 'Thiago Medeiros Costa', '444.444.444-44', 'thiago@gmail.com', '123', 'recep'),
(19, 'Luiza Goes Morais', '555.555.555-55', 'luiza@gmail.com', '123', 'recep'),
(20, 'Manuela de Melo Jesus', '666.666.666-66', 'manu@gmail.com', '123', 'recep');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `funcionario` varchar(20) NOT NULL,
  `data` date NOT NULL,
  `id_orc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id`, `produto`, `valor`, `funcionario`, `data`, `id_orc`) VALUES
(7, 31, 30.00, '111.111.111-11', '2023-11-07', 21),
(8, 22, 15.00, '111.111.111-11', '2023-11-07', 22),
(9, 24, 35.00, '111.111.111-11', '2023-11-07', 22),
(10, 26, 99.99, '111.111.111-11', '2023-11-07', 22),
(11, 31, 30.00, '111.111.111-11', '2023-11-07', 22);

-- --------------------------------------------------------

--
-- Estrutura para tabela `veterinarios`
--

CREATE TABLE `veterinarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `endereco` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `veterinarios`
--

INSERT INTO `veterinarios` (`id`, `nome`, `cpf`, `telefone`, `email`, `endereco`) VALUES
(8, 'Marcelo Souza Tenório', '111.111.111-11', '(11) 11111-1111', 'mst4@aluno.ifal.edu.br', 'RUA N1'),
(9, 'Melkyzedeque Augusto Silva', '222.222.222-22', '(22) 22222-2222', 'mas33@aluno.ifal.edu.br', 'RUA N2'),
(10, 'Ytalo Gabriel Andrade dos Santos Eugenio', '333.333.333-33', '(33) 33333-3333', 'ygase1@aluno.ifal.edu.br', 'RUA N3');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `comissoes`
--
ALTER TABLE `comissoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contas_pagar`
--
ALTER TABLE `contas_pagar`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contas_receber`
--
ALTER TABLE `contas_receber`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `controles`
--
ALTER TABLE `controles`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `orc_prod`
--
ALTER TABLE `orc_prod`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `recepcionistas`
--
ALTER TABLE `recepcionistas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `retornos`
--
ALTER TABLE `retornos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `veterinarios`
--
ALTER TABLE `veterinarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `comissoes`
--
ALTER TABLE `comissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `contas_pagar`
--
ALTER TABLE `contas_pagar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `contas_receber`
--
ALTER TABLE `contas_receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `controles`
--
ALTER TABLE `controles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `orc_prod`
--
ALTER TABLE `orc_prod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `os`
--
ALTER TABLE `os`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `recepcionistas`
--
ALTER TABLE `recepcionistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `retornos`
--
ALTER TABLE `retornos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `veterinarios`
--
ALTER TABLE `veterinarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
