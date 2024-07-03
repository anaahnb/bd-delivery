SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

SET NAMES utf8mb4;

--
-- Banco de dados: `delivery_app`
--

CREATE DATABASE IF NOT EXISTS `delivery_app`;
USE `delivery_app`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `cliente_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cliente_nome` varchar(191) NOT NULL,
  `cliente_endereco` varchar(191) NOT NULL,
  `cliente_telefone` varchar(15) NOT NULL,
  `cliente_email` varchar(191) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `clientes_cliente_telefone_unique` (`cliente_telefone`)
);

-- Dados para tabela `clientes`
INSERT INTO `clientes` (`cliente_id`, `cliente_nome`, `cliente_endereco`, `cliente_telefone`, `cliente_email`) VALUES
(1, 'João Silva', 'Rua das Flores, 123, São Paulo, SP', '(11) 91234-5678', 'joao.silva@example.com'),
(2, 'Maria Oliveira', 'Av. Paulista, 456, São Paulo, SP', '(11) 92345-6789', 'maria.oliveira@example.com'),
(3, 'Pedro Santos', 'Rua A, 789, Rio de Janeiro, RJ', '(21) 93456-7890', 'pedro.santos@example.com'),
(4, 'Ana Costa', 'Rua B, 321, Rio de Janeiro, RJ', '(21) 94567-8901', 'ana.costa@example.com'),
(5, 'Lucas Lima', 'Rua C, 654, Belo Horizonte, MG', '(31) 95678-9012', 'lucas.lima@example.com'),
(6, 'Clara Souza', 'Rua D, 987, Curitiba, PR', '(41) 96789-0123', 'clara.souza@example.com'),
(7, 'Paulo Mendes', 'Av. Brasil, 159, Porto Alegre, RS', '(51) 97890-1234', 'paulo.mendes@example.com'),
(8, 'Fernanda Rocha', 'Rua E, 753, Salvador, BA', '(71) 98901-2345', 'fernanda.rocha@example.com'),
(9, 'Ricardo Almeida', 'Rua F, 357, Fortaleza, CE', '(85) 99012-3456', 'ricardo.almeida@example.com'),
(10, 'Juliana Araújo', 'Rua G, 951, Recife, PE', '(81) 90123-4567', 'juliana.araujo@example.com'),
(11, 'Carlos Pereira', 'Rua H, 147, Manaus, AM', '(92) 91234-5678', 'carlos.pereira@example.com'),
(12, 'Mariana Fernandes', 'Rua I, 258, Goiânia, GO', '(62) 92345-6789', 'mariana.fernandes@example.com'),
(13, 'Roberto Lima', 'Rua J, 369, Brasília, DF', '(61) 93456-7890', 'roberto.lima@example.com'),
(14, 'Aline Gomes', 'Rua K, 471, Florianópolis, SC', '(48) 94567-8901', 'aline.gomes@example.com'),
(15, 'Diego Barbosa', 'Rua L, 582, Vitória, ES', '(27) 95678-9012', 'diego.barbosa@example.com'),
(16, 'Gabriela Ribeiro', 'Rua M, 693, Natal, RN', '(84) 96789-0123', 'gabriela.ribeiro@example.com'),
(17, 'Renato Castro', 'Rua N, 784, Teresina, PI', '(86) 97890-1234', 'renato.castro@example.com'),
(18, 'Larissa Martins', 'Rua O, 895, João Pessoa, PB', '(83) 98901-2345', 'larissa.martins@example.com'),
(19, 'Thiago Moreira', 'Rua P, 916, Campo Grande, MS', '(67) 99012-3456', 'thiago.moreira@example.com'),
(20, 'Viviane Cardoso', 'Rua Q, 107, Cuiabá, MT', '(65) 90123-4567', 'viviane.cardoso@example.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `entregadores`
--

DROP TABLE IF EXISTS `entregadores`;
CREATE TABLE `entregadores` (
  `entregador_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entregador_nome` varchar(191) NOT NULL,
  `entregador_telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`entregador_id`)
);

-- Dados para tabela `entregadores`
INSERT INTO `entregadores` (`entregador_id`, `entregador_nome`, `entregador_telefone`) VALUES
(1, 'Luiz Souza', '(11) 91234-5678'),
(2, 'Camila Alves', '(21) 92345-6789'),
(3, 'Rafael Teixeira', '(31) 93456-7890'),
(4, 'Sofia Lima', '(41) 94567-8901'),
(5, 'Felipe Costa', '(51) 95678-9012'),
(6, 'Amanda Rocha', '(61) 96789-0123'),
(7, 'Leonardo Mendes', '(71) 97890-1234'),
(8, 'Isabela Ferreira', '(81) 98901-2345'),
(9, 'Gustavo Pinto', '(85) 99012-3456'),
(10, 'Natália Oliveira', '(92) 90123-4567'),
(11, 'Rodrigo Santos', '(11) 91234-5678'),
(12, 'Bruna Moreira', '(21) 92345-6789'),
(13, 'Marcelo Ribeiro', '(31) 93456-7890'),
(14, 'Patrícia Martins', '(41) 94567-8901'),
(15, 'Júlio Almeida', '(51) 95678-9012'),
(16, 'Carolina Barbosa', '(61) 96789-0123'),
(17, 'Eduardo Araújo', '(71) 97890-1234'),
(18, 'Vanessa Pereira', '(81) 98901-2345'),
(19, 'Bruno Lima', '(85) 99012-3456'),
(20, 'Alice Fernandes', '(92) 90123-4567');

-- --------------------------------------------------------

--
-- Estrutura para tabela `restaurantes`
--

DROP TABLE IF EXISTS `restaurantes`;
CREATE TABLE `restaurantes` (
  `restaurante_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurante_nome` varchar(191) NOT NULL,
  `restaurante_endereco` varchar(191) NOT NULL,
  `restaurante_telefone` varchar(15) NOT NULL,
  `restaurante_culinaria` varchar(191) NOT NULL,
  PRIMARY KEY (`restaurante_id`)
);

-- Dados para tabela `restaurantes`
INSERT INTO `restaurantes` (`restaurante_id`, `restaurante_nome`, `restaurante_endereco`, `restaurante_telefone`, `restaurante_culinaria`) VALUES
(1, 'La Bella Itália', 'Rua da Paz, 100, São Paulo, SP', '(11) 91234-5678', 'Italiana'),
(2, 'Sushi Saito', 'Av. Liberdade, 200, São Paulo, SP', '(11) 92345-6789', 'Japonesa'),
(3, 'Churrascaria Gaúcha', 'Av. Ipiranga, 300, Porto Alegre, RS', '(51) 93456-7890', 'Brasileira'),
(4, 'Trattoria Milano', 'Rua das Oliveiras, 400, Curitiba, PR', '(41) 94567-8901', 'Italiana'),
(5, 'Temaki House', 'Av. Paulista, 500, São Paulo, SP', '(11) 95678-9012', 'Japonesa'),
(6, 'Picanha na Brasa', 'Rua Afonso Pena, 600, Belo Horizonte, MG', '(31) 96789-0123', 'Brasileira'),
(7, 'Ristorante Roma', 'Rua das Flores, 700, São Paulo, SP', '(11) 97890-1234', 'Italiana'),
(8, 'Sushi do Chef', 'Rua da Glória, 800, Rio de Janeiro, RJ', '(21) 98901-2345', 'Japonesa'),
(9, 'Churrasco & Cia', 'Av. Brasil, 900, Salvador, BA', '(71) 99012-3456', 'Brasileira'),
(10, 'Cantina Toscana', 'Rua dos Pinheiros, 1000, São Paulo, SP', '(11) 90123-4567', 'Italiana'),
(11, 'Sushi Zen', 'Av. Atlântica, 1100, Rio de Janeiro, RJ', '(21) 91234-5678', 'Japonesa'),
(12, 'Boi na Brasa', 'Rua da República, 1200, Belo Horizonte, MG', '(31) 92345-6789', 'Brasileira'),
(13, 'La Trattoria', 'Av. Sete de Setembro, 1300, Curitiba, PR', '(41) 93456-7890', 'Italiana'),
(14, 'Sashimi House', 'Rua do Comércio, 1400, São Paulo, SP', '(11) 94567-8901', 'Japonesa'),
(15, 'Costelão do Sul', 'Av. Borges de Medeiros, 1500, Porto Alegre, RS', '(51) 95678-9012', 'Brasileira'),
(16, 'Osteria di Roma', 'Rua Augusta, 1600, São Paulo, SP', '(11) 96789-0123', 'Italiana'),
(17, 'Yakisoba Express', 'Av. Rebouças, 1700, São Paulo, SP', '(11) 97890-1234', 'Japonesa'),
(18, 'Fogo de Chão', 'Av. Brigadeiro Faria Lima, 1800, São Paulo, SP', '(11) 98901-2345', 'Brasileira'),
(19, 'Mamma Mia', 'Rua dos Andradas, 1900, Porto Alegre, RS', '(51) 99012-3456', 'Italiana'),
(20, 'Ramen House', 'Av. Angélica, 2000, São Paulo, SP', '(11) 90123-4567', 'Japonesa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_menu`
--

DROP TABLE IF EXISTS `item_menu`;
CREATE TABLE `item_menu` (
  `item_menu_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurante_id` bigint UNSIGNED NOT NULL,
  `item_menu_nome` varchar(191) NOT NULL,
  `item_menu_descricao` varchar(191) NOT NULL,
  `item_menu_preco` int NOT NULL,
  PRIMARY KEY (`item_menu_id`),
  KEY `restaurante_id` (`restaurante_id`)
);

-- Dados para tabela `item_menu`
INSERT INTO `item_menu` (`item_menu_id`, `restaurante_id`, `item_menu_nome`, `item_menu_descricao`, `item_menu_preco`) VALUES
(1, 1, 'Spaghetti Carbonara', 'Massa italiana com molho de ovos, queijo e bacon.', 45),
(2, 2, 'Sushi Combinado', 'Combinado de sushis variados.', 60),
(3, 3, 'Picanha na Brasa', 'Picanha assada na brasa com acompanhamentos.', 70),
(4, 4, 'Fettuccine Alfredo', 'Massa italiana com molho cremoso de queijo.', 50),
(5, 5, 'Temaki de Salmão', 'Temaki recheado com salmão fresco.', 25),
(6, 6, 'Costela no Bafo', 'Costela bovina cozida lentamente.', 65),
(7, 7, 'Ravioli de Ricota', 'Massa recheada com ricota e espinafre.', 55),
(8, 8, 'Sashimi de Atum', 'Fatias finas de atum fresco.', 35),
(9, 9, 'Fraldinha Grelhada', 'Fraldinha grelhada com acompanhamentos.', 60),
(10, 10, 'Lasagna Bolonhesa', 'Massa em camadas com molho bolonhesa.', 50),
(11, 11, 'Uramaki Califórnia', 'Rolinho de arroz recheado com kani e pepino.', 40),
(12, 12, 'Frango ao Molho Pardo', 'Frango cozido com molho pardo.', 45),
(13, 13, 'Risotto de Cogumelos', 'Arroz cremoso com cogumelos.', 55),
(14, 14, 'Yakitori', 'Espetinho de frango grelhado.', 30),
(15, 15, 'Costela ao Molho Barbecue', 'Costela assada com molho barbecue.', 65),
(16, 16, 'Gnocchi ao Pesto', 'Massa de batata com molho pesto.', 50),
(17, 17, 'Yakisoba de Frango', 'Massa com legumes e frango.', 45),
(18, 18, 'Churrasco Misto', 'Variedade de carnes assadas.', 80),
(19, 19, 'Tiramisu', 'Sobremesa italiana de café e mascarpone.', 25),
(20, 20, 'Ramen de Porco', 'Sopa japonesa com carne de porco.', 40);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `pedido_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `pedido_data_hora` datetime NOT NULL,
  `pedido_status` varchar(191) NOT NULL,
  `pedido_total` int NOT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `cliente_id` (`cliente_id`)
);

-- Dados para tabela `pedidos`
INSERT INTO `pedidos` (`pedido_id`, `cliente_id`, `pedido_data_hora`, `pedido_status`, `pedido_total`) VALUES
(1, 1, '2024-01-15 12:34:56', 'Entregue', 150),
(2, 2, '2024-01-16 13:45:12', 'Saiu para entrega', 200),
(3, 3, '2024-01-17 14:56:34', 'Saiu para entrega', 250),
(4, 4, '2024-01-18 15:34:45', 'Entregue', 100),
(5, 5, '2024-01-19 16:23:56', 'Entregue', 175),
(6, 6, '2024-01-20 17:45:23', 'Saiu para entrega', 220),
(7, 7, '2024-01-21 18:56:34', 'Saiu para entrega', 195),
(8, 8, '2024-01-22 19:34:45', 'Entregue', 130),
(9, 9, '2024-01-23 20:23:56', 'Entregue', 165),
(10, 10, '2024-01-24 21:45:23', 'Saiu para entrega', 240),
(11, 11, '2024-01-25 22:56:34', 'Saiu para entrega', 185),
(12, 12, '2024-01-26 23:34:45', 'Entregue', 120),
(13, 13, '2024-01-27 10:23:56', 'Entregue', 170),
(14, 14, '2024-01-28 11:45:23', 'Saiu para entrega', 230),
(15, 15, '2024-01-29 12:56:34', 'Saiu para entrega', 190),
(16, 16, '2024-01-30 13:34:45', 'Entregue', 110),
(17, 17, '2024-01-31 14:23:56', 'Entregue', 160),
(18, 18, '2024-02-01 15:45:23', 'Saiu para entrega', 250),
(19, 19, '2024-02-02 16:56:34', 'Saiu para entrega', 200),
(20, 20, '2024-02-03 17:34:45', 'Entregue', 125),
(21, 21, '2024-02-04 18:34:45', 'Entregue', 175),
(22, 22, '2024-02-05 19:45:23', 'Saiu para entrega', 220),
(23, 23, '2024-02-06 20:56:34', 'Saiu para entrega', 195),
(24, 24, '2024-02-07 21:34:45', 'Entregue', 130),
(25, 25, '2024-02-08 22:23:56', 'Entregue', 165),
(26, 26, '2024-02-09 23:45:23', 'Saiu para entrega', 240),
(27, 27, '2024-02-10 10:56:34', 'Saiu para entrega', 185),
(28, 28, '2024-02-11 11:34:45', 'Entregue', 120),
(29, 29, '2024-02-12 12:23:56', 'Entregue', 170),
(30, 30, '2024-02-13 13:45:23', 'Saiu para entrega', 230),
(31, 31, '2024-02-14 14:56:34', 'Saiu para entrega', 190),
(32, 32, '2024-02-15 15:34:45', 'Entregue', 110),
(33, 33, '2024-02-16 16:23:56', 'Entregue', 160),
(34, 34, '2024-02-17 17:45:23', 'Saiu para entrega', 250),
(35, 35, '2024-02-18 18:56:34', 'Saiu para entrega', 200),
(36, 36, '2024-02-19 19:34:45', 'Entregue', 125),
(37, 37, '2024-02-20 20:23:56', 'Entregue', 175),
(38, 38, '2024-02-21 21:45:23', 'Saiu para entrega', 220),
(39, 39, '2024-02-22 22:56:34', 'Saiu para entrega', 195),
(40, 40, '2024-02-23 23:34:45', 'Entregue', 130),
(41, 41, '2024-02-24 10:23:56', 'Entregue', 165),
(42, 42, '2024-02-25 11:45:23', 'Saiu para entrega', 240),
(43, 43, '2024-02-26 12:56:34', 'Pendente', 185),
(44, 44, '2024-02-27 13:34:45', 'Entregue', 120),
(45, 45, '2024-02-28 14:23:56', 'Entregue', 170),
(46, 46, '2024-03-01 15:45:23', 'Saiu para entrega', 230),
(47, 47, '2024-03-02 16:56:34', 'Pendente', 190),
(48, 48, '2024-03-03 17:34:45', 'Cancelado', 110),
(49, 49, '2024-03-04 18:23:56', 'Entregue', 160),
(50, 50, '2024-03-05 19:45:23', 'Saiu para entrega', 250),
(51, 51, '2024-03-06 20:56:34', 'Pendente', 200),
(52, 52, '2024-03-07 21:34:45', 'Cancelado', 125),
(53, 53, '2024-03-08 22:23:56', 'Entregue', 175),
(54, 54, '2024-03-09 23:45:23', 'Saiu para entrega', 220),
(55, 55, '2024-03-10 10:56:34', 'Pendente', 195),
(56, 56, '2024-03-11 11:34:45', 'Cancelado', 130),
(57, 57, '2024-03-12 12:23:56', 'Entregue', 165),
(58, 58, '2024-03-13 13:45:23', 'Saiu para entrega', 240),
(59, 59, '2024-03-14 14:56:34', 'Pendente', 185),
(60, 60, '2024-03-15 15:34:45', 'Cancelado', 120),
(61, 61, '2024-03-16 16:23:56', 'Entregue', 170),
(62, 62, '2024-03-17 17:45:23', 'Saiu para entrega', 230),
(63, 63, '2024-03-18 18:56:34', 'Pendente', 190),
(64, 64, '2024-03-19 19:34:45', 'Cancelado', 125),
(65, 65, '2024-03-20 20:23:56', 'Entregue', 175),
(66, 66, '2024-03-21 21:45:23', 'Saiu para entrega', 220),
(67, 67, '2024-03-22 22:56:34', 'Pendente', 195),
(68, 68, '2024-03-23 23:34:45', 'Cancelado', 130),
(69, 69, '2024-03-24 10:23:56', 'Entregue', 165),
(70, 70, '2024-03-25 11:45:23', 'Saiu para entrega', 240),
(71, 71, '2024-03-26 12:56:34', 'Pendente', 185),
(72, 72, '2024-03-27 13:34:45', 'Cancelado', 120),
(73, 73, '2024-03-28 14:23:56', 'Entregue', 170),
(74, 74, '2024-03-29 15:45:23', 'Saiu para entrega', 230),
(75, 75, '2024-03-30 16:56:34', 'Pendente', 190),
(76, 76, '2024-03-31 17:34:45', 'Cancelado', 110),
(77, 77, '2024-04-01 18:23:56', 'Entregue', 160),
(78, 78, '2024-04-02 19:45:23', 'Saiu para entrega', 250),
(79, 79, '2024-04-03 20:56:34', 'Pendente', 200),
(80, 80, '2024-04-04 21:34:45', 'Cancelado', 125),
(81, 81, '2024-04-05 22:23:56', 'Entregue', 175),
(82, 82, '2024-04-06 23:45:23', 'Saiu para entrega', 220),
(83, 83, '2024-04-07 10:56:34', 'Pendente', 195),
(84, 84, '2024-04-08 11:34:45', 'Cancelado', 130),
(85, 85, '2024-04-09 12:23:56', 'Entregue', 165),
(86, 86, '2024-04-10 13:45:23', 'Saiu para entrega', 240),
(87, 87, '2024-04-11 14:56:34', 'Pendente', 185),
(88, 88, '2024-04-12 15:34:45', 'Cancelado', 120),
(89, 89, '2024-04-13 16:23:56', 'Entregue', 170),
(90, 90, '2024-04-14 17:45:23', 'Saiu para entrega', 230),
(91, 91, '2024-04-15 18:56:34', 'Pendente', 190),
(92, 92, '2024-04-16 19:34:45', 'Cancelado', 110),
(93, 93, '2024-04-17 20:23:56', 'Entregue', 160),
(94, 94, '2024-04-18 21:45:23', 'Saiu para entrega', 250),
(95, 95, '2024-04-19 22:56:34', 'Pendente', 200),
(96, 96, '2024-04-20 23:34:45', 'Cancelado', 125),
(97, 97, '2024-04-21 10:23:56', 'Entregue', 175),
(98, 98, '2024-04-22 11:45:23', 'Saiu para entrega', 220),
(99, 99, '2024-04-23 12:56:34', 'Pendente', 195),
(100, 100, '2024-04-24 13:34:45', 'Cancelado', 130);


-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
CREATE TABLE `item_pedido` (
  `item_pedido_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint UNSIGNED NOT NULL,
  `item_menu_id` bigint UNSIGNED NOT NULL,
  `item_pedido_quantidade` int NOT NULL,
  `item_pedido_subtotal` int NOT NULL,
  PRIMARY KEY (`item_pedido_id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `item_menu_id` (`item_menu_id`)
);

-- Dados para tabela `item_pedido`
-- Dados para tabela `item_pedido`
INSERT INTO `item_pedido` (`item_pedido_id`, `pedido_id`, `item_menu_id`, `item_pedido_quantidade`, `item_pedido_subtotal`) VALUES
(1, 1, 6, 2, 300),
(2, 2, 6, 1, 150),
(3, 3, 6, 3, 600),
(4, 4, 6, 2, 400),
(5, 5, 6, 1, 250),
(6, 6, 6, 2, 500),
(7, 7, 6, 4, 400),
(8, 8, 6, 2, 200),
(9, 9, 6, 3, 525),
(10, 10, 8, 2, 350),
(11, 11, 1, 5, 1100),
(12, 12, 2, 3, 660),
(13, 13, 3, 2, 390),
(14, 14, 4, 4, 780),
(15, 15, 5, 3, 390),
(16, 16, 6, 2, 260),
(17, 17, 7, 4, 660),
(18, 18, 18, 1, 165),
(19, 19, 19, 3, 720),
(20, 20, 20, 2, 480),
(21, 21, 2, 2, 370),
(22, 22, 3, 1, 185),
(23, 23, 4, 3, 360),
(24, 24, 5, 2, 240),
(25, 25, 6, 1, 170),
(26, 26, 7, 2, 340),
(27, 27, 8, 4, 920),
(28, 28, 9, 2, 460),
(29, 29, 10, 3, 570),
(30, 30, 1, 2, 380),
(31, 31, 2, 5, 550),
(32, 32, 3, 3, 330),
(33, 33, 4, 2, 320),
(34, 34, 5, 4, 640),
(35, 35, 6, 3, 750),
(36, 36, 7, 2, 500),
(37, 37, 8, 4, 780),
(38, 38, 19, 1, 195),
(39, 39, 20, 3, 600),
(40, 40, 1, 2, 400),
(41, 41, 3, 2, 350),
(42, 42, 14, 1, 175),
(43, 43, 5, 3, 660),
(44, 44, 6, 2, 440),
(45, 45, 7, 1, 195),
(46, 46, 8, 2, 390),
(47, 47, 9, 4, 520),
(48, 48, 10, 2, 260),
(49, 49, 11, 3, 495),
(50, 50, 12, 2, 330),
(51, 51, 13, 5, 1100),
(52, 52, 14, 3, 660),
(53, 53, 5, 2, 370),
(54, 54, 16, 4, 740),
(55, 55, 17, 3, 390),
(56, 56, 8, 2, 260),
(57, 57, 19, 4, 680),
(58, 58, 20, 1, 170),
(59, 59, 1, 3, 690),
(60, 60, 12, 2, 460),
(61, 61, 4, 2, 380),
(62, 62, 5, 1, 190),
(63, 63, 6, 3, 330),
(64, 64, 7, 2, 220),
(65, 65, 8, 1, 160),
(66, 66, 9, 2, 320),
(67, 67, 10, 4, 1000),
(68, 68, 11, 2, 500),
(69, 69, 2, 3, 750),
(70, 70, 3, 2, 500),
(71, 71, 14, 5, 1000),
(72, 72, 15, 3, 600),
(73, 73, 6, 2, 350),
(74, 74, 17, 4, 700),
(75, 75, 18, 3, 390),
(76, 76, 19, 2, 260),
(77, 77, 20, 4, 780),
(78, 78, 1, 1, 195),
(79, 79, 2, 3, 570),
(80, 80, 3, 2, 380),
(81, 81, 5, 2, 330),
(82, 82, 6, 1, 165),
(83, 83, 7, 3, 720),
(84, 84, 8, 2, 480),
(85, 85, 9, 1, 185),
(86, 86, 10, 2, 370),
(87, 87, 11, 4, 920),
(88, 88, 12, 2, 460),
(89, 89, 13, 3, 510),
(90, 90, 14, 2, 340),
(91, 91, 15, 5, 1150),
(92, 92, 16, 3, 690),
(93, 93, 7, 2, 390),
(94, 94, 18, 4, 780),
(95, 95, 9, 3, 330),
(96, 96, 20, 2, 220),
(97, 97, 1, 4, 640),
(98, 98, 2, 1, 160),
(99, 99, 3, 3, 750),
(100, 100, 4, 2, 500);


-- --------------------------------------------------------

--
-- Estrutura para tabela `problemas`
--

DROP TABLE IF EXISTS `problemas`;
CREATE TABLE `problemas` (
  `problema_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint UNSIGNED NOT NULL,
  `problema_descricao` varchar(191) NOT NULL,
  `problema_tipo` varchar(191) NOT NULL,
  `problema_horario` time NOT NULL,
  `problema_status` varchar(191) NOT NULL,
  PRIMARY KEY (`problema_id`),
  KEY `pedido_id` (`pedido_id`)
);

-- Dados para tabela `problemas`
INSERT INTO `problemas` (`problema_id`, `pedido_id`, `problema_descricao`, `problema_tipo`, `problema_horario`, `problema_status`) VALUES
(1, 1, 'Atraso na entrega', 'Atraso', '12:00:00', 'Resolvido'),
(2, 2, 'Pedido errado', 'Pedido incorreto', '13:00:00', 'Pendente'),
(3, 3, 'Produto danificado', 'Produto danificado', '14:00:00', 'Em andamento'),
(4, 4, 'Atraso na entrega', 'Atraso', '15:00:00', 'Resolvido'),
(5, 5, 'Pedido errado', 'Pedido incorreto', '16:00:00', 'Pendente'),
(6, 6, 'Produto danificado', 'Produto danificado', '17:00:00', 'Em andamento'),
(7, 7, 'Atraso na entrega', 'Atraso', '18:00:00', 'Resolvido'),
(8, 8, 'Pedido errado', 'Pedido incorreto', '19:00:00', 'Pendente'),
(9, 9, 'Produto danificado', 'Produto danificado', '20:00:00', 'Em andamento'),
(10, 10, 'Atraso na entrega', 'Atraso', '21:00:00', 'Resolvido'),
(11, 11, 'Pedido errado', 'Pedido incorreto', '22:00:00', 'Pendente'),
(12, 12, 'Produto danificado', 'Produto danificado', '23:00:00', 'Em andamento'),
(13, 13, 'Atraso na entrega', 'Atraso', '10:00:00', 'Resolvido'),
(14, 14, 'Pedido errado', 'Pedido incorreto', '11:00:00', 'Pendente'),
(15, 15, 'Produto danificado', 'Produto danificado', '12:00:00', 'Em andamento'),
(16, 16, 'Atraso na entrega', 'Atraso', '13:00:00', 'Resolvido'),
(17, 17, 'Pedido errado', 'Pedido incorreto', '14:00:00', 'Pendente'),
(18, 18, 'Produto danificado', 'Produto danificado', '15:00:00', 'Em andamento'),
(19, 19, 'Atraso na entrega', 'Atraso', '16:00:00', 'Resolvido'),
(20, 20, 'Pedido errado', 'Pedido incorreto', '17:00:00', 'Pendente');

COMMIT;