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
  UNIQUE KEY `clientes_cliente_telefone_unique` (`cliente_telefone`),
  UNIQUE KEY `clientes_cliente_email_unique` (`cliente_email`)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `entregadores`
--

DROP TABLE IF EXISTS `entregadores`;
CREATE TABLE `entregadores` (
  `entregador_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `entregador_nome` varchar(191) NOT NULL,
  `entregador_telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`entregador_id`),
  UNIQUE KEY `entregadores_entregador_telefone_unique` (`entregador_telefone`)
);

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
  KEY `item_menu_restaurante_id_foreign` (`restaurante_id`)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
CREATE TABLE `item_pedido` (
  `item_pedido_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint UNSIGNED NOT NULL,
  `item_menu_id` bigint UNSIGNED NOT NULL,
  `item_pedido_quantidae` int NOT NULL,
  `item_pedido_subtotal` int NOT NULL,
  PRIMARY KEY (`item_pedido_id`),
  KEY `item_pedido_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedido_item_menu_id_foreign` (`item_menu_id`)
);

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
  KEY `pedidos_cliente_id_foreign` (`cliente_id`)
);

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
  KEY `problemas_pedido_id_foreign` (`pedido_id`)
);

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
  PRIMARY KEY (`restaurante_id`),
  UNIQUE KEY `restaurantes_restaurante_telefone_unique` (`restaurante_telefone`)
);

-- --------------------------------------------------------

-- Inserir dados falsos na tabela `clientes`
INSERT INTO `clientes` (`cliente_nome`, `cliente_endereco`, `cliente_telefone`, `cliente_email`) VALUES
('Maria Silva', 'Rua das Flores, 123', '11987654321', 'maria.silva@example.com'),
('João Souza', 'Avenida Brasil, 456', '21987654321', 'joao.souza@example.com'),
('Ana Pereira', 'Rua da Alegria, 789', '31987654321', 'ana.pereira@example.com');

-- Inserir dados falsos na tabela `entregadores`
INSERT INTO `entregadores` (`entregador_nome`, `entregador_telefone`) VALUES
('Carlos Lima', '21987654322'),
('Roberto Almeida', '31987654323'),
('Juliana Santos', '11987654324');

-- Inserir dados falsos na tabela `restaurantes`
INSERT INTO `restaurantes` (`restaurante_nome`, `restaurante_endereco`, `restaurante_telefone`, `restaurante_culinaria`) VALUES
('Restaurante Saboroso', 'Rua das Acácias, 101', '31987654325', 'Italiana'),
('Bistrô Delícia', 'Avenida Central, 202', '21987654326', 'Francesa'),
('Pizzaria Massa', 'Rua da Praia, 303', '11987654327', 'Pizza');

-- Inserir dados falsos na tabela `item_menu`
INSERT INTO `item_menu` (`restaurante_id`, `item_menu_nome`, `item_menu_descricao`, `item_menu_preco`) VALUES
(1, 'Spaghetti Carbonara', 'Massa com molho carbonara', 45),
(1, 'Lasanha', 'Lasanha de carne com molho de tomate', 50),
(2, 'Croissant', 'Croissant com manteiga', 10),
(2, 'Quiche Lorraine', 'Quiche com bacon e queijo', 25),
(3, 'Pizza Margherita', 'Pizza com molho de tomate, mussarela e manjericão', 30),
(3, 'Calzone', 'Calzone recheado com presunto e queijo', 35);

-- Inserir dados falsos na tabela `pedidos`
INSERT INTO `pedidos` (`cliente_id`, `pedido_data_hora`, `pedido_status`, `pedido_total`) VALUES
(1, '2024-07-01 12:00:00', 'Entregue', 100),
(2, '2024-07-02 13:30:00', 'Entregue', 35),
(3, '2024-07-03 19:45:00', 'Pendente', 60);

-- Inserir dados falsos na tabela `item_pedido`
INSERT INTO `item_pedido` (`pedido_id`, `item_menu_id`, `item_pedido_quantidae`, `item_pedido_subtotal`) VALUES
(1, 1, 2, 90),
(1, 2, 1, 50),
(2, 3, 2, 20),
(3, 5, 1, 30),
(3, 6, 1, 35);

-- Inserir dados falsos na tabela `problemas`
INSERT INTO `problemas` (`pedido_id`, `problema_descricao`, `problema_tipo`, `problema_horario`, `problema_status`) VALUES
(1, 'Entrega atrasada', 'Atraso', '12:30:00', 'Resolvido'),
(2, 'Comida fria', 'Qualidade', '14:00:00', 'Resolvido'),
(3, 'Pedido incompleto', 'Erro', '20:00:00', 'Pendente');


COMMIT;

