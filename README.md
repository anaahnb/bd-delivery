
# Sistema de Delivery - Banco de Dados

Este documento fornece instruções para a configuração do banco de dados, execução das consultas SQL e utilização do sistema de delivery.

## Requisitos

- MySQL Server ou qualquer outro SGBD compatível com SQL.
- Ferramenta de gerenciamento de banco de dados (ex.: MySQL Workbench, phpMyAdmin, DBeaver).

## Configuração do Banco de Dados

### Passo 1: Criação do Banco de Dados

1. Abra seu SGBD e conecte-se ao servidor de banco de dados.
2. Crie um novo banco de dados para o sistema de delivery com o seguinte comando SQL:

```sql
CREATE DATABASE delivery_db;
USE delivery_db;
```

### Passo 2: Criação das Tabelas e Inserção de Dados

1. Importe o arquivo `delivery_app.sql` fornecido para criar as tabelas necessárias e inserir alguns dados iniciais.
2. No gerenciador de banco de dados da sua preferência, abra o arquivo `delivery_app.sql` e execute o script SQL.

### Estrutura das Tabelas

O banco de dados contém as seguintes tabelas principais:

- `Cliente`
- `Restaurante`
- `Entregador`
- `ItemMenu`
- `Pedido`
- `ItemPedido`
- `Problema`

## Execução das Consultas SQL

### Inserção de Dados

#### Inserir Cliente
```sql
INSERT INTO `clientes` (`cliente_nome`, `cliente_endereco`, `cliente_telefone`, `cliente_email`) VALUES
('Maria Silva', 'Rua das Flores, 123', '11987654321', 'maria.silva@example.com'),
('João Souza', 'Avenida Brasil, 456', '21987654321', 'joao.souza@example.com'),
('Ana Pereira', 'Rua da Alegria, 789', '31987654321', 'ana.pereira@example.com');
```

#### Inserir Restaurante
```sql
INSERT INTO `restaurantes` (`restaurante_nome`, `restaurante_endereco`, `restaurante_telefone`, `restaurante_culinaria`) VALUES
('Restaurante Saboroso', 'Rua das Acácias, 101', '31987654325', 'Italiana'),
('Bistrô Delícia', 'Avenida Central, 202', '21987654326', 'Francesa'),
('Pizzaria Massa', 'Rua da Praia, 303', '11987654327', 'Pizza');
```

#### Inserir Entregador
```sql
INSERT INTO `entregadores` (`entregador_nome`, `entregador_telefone`) VALUES
('Carlos Lima', '21987654322'),
('Roberto Almeida', '31987654323'),
('Juliana Santos', '11987654324');
```

#### Inserir Item no Menu
```sql
INSERT INTO `item_menu` (`restaurante_id`, `item_menu_nome`, `item_menu_descricao`, `item_menu_preco`) VALUES
(1, 'Spaghetti Carbonara', 'Massa com molho carbonara', 45),
(1, 'Lasanha', 'Lasanha de carne com molho de tomate', 50),
(2, 'Croissant', 'Croissant com manteiga', 10),
(2, 'Quiche Lorraine', 'Quiche com bacon e queijo', 25),
(3, 'Pizza Margherita', 'Pizza com molho de tomate, mussarela e manjericão', 30),
(3, 'Calzone', 'Calzone recheado com presunto e queijo', 35);
```

#### Inserir Pedido
```sql
INSERT INTO `pedidos` (`cliente_id`, `pedido_data_hora`, `pedido_status`, `pedido_total`) VALUES
(1, '2024-07-01 12:00:00', 'Entregue', 100),
(2, '2024-07-02 13:30:00', 'Entregue', 35),
(3, '2024-07-03 19:45:00', 'Pendente', 60);
```

#### Inserir ItemPedido
```sql
INSERT INTO `item_pedido` (`pedido_id`, `item_menu_id`, `item_pedido_quantidae`, `item_pedido_subtotal`) VALUES
(1, 1, 2, 90),
(1, 2, 1, 50),
(2, 3, 2, 20),
(3, 5, 1, 30),
(3, 6, 1, 35);
```

#### Inserir Problema
```sql
INSERT INTO `problemas` (`pedido_id`, `problema_descricao`, `problema_tipo`, `problema_horario`, `problema_status`) VALUES
(1, 'Entrega atrasada', 'Atraso', '12:30:00', 'Resolvido'),
(2, 'Comida fria', 'Qualidade', '14:00:00', 'Resolvido'),
(3, 'Pedido incompleto', 'Erro', '20:00:00', 'Pendente');
```

### Atualização de Dados

#### Atualizar Status do Pedido
```sql
UPDATE Pedido
SET pedido_status = 'Concluído'
WHERE pedido_id = 3;
```

#### Atualizar Informações do Cliente
```sql
UPDATE Cliente
SET cliente_endereco = 'Rua C, 789', cliente_telefone = '4444-4444'
WHERE cliente_id = 1;
```

### Exclusão de Dados

#### Excluir Cliente
```sql
DELETE FROM Cliente
WHERE cliente_id = 1;
```

#### Excluir Item do Menu
```sql
DELETE FROM ItemMenu
WHERE item_menu_id = 1;
```

### Seleção de Dados

#### Selecionar Todos os Clientes
```sql
SELECT * FROM Cliente;
```

#### Selecionar Todos os Restaurantes
```sql
SELECT * FROM Restaurante;
```

#### Selecionar Pedidos de um Cliente
```sql
SELECT * FROM Pedido
WHERE cliente_id = 1;
```

#### Selecionar Itens do Menu de um Restaurante
```sql
SELECT * FROM ItemMenu
WHERE restaurante_id = 1;
```

#### Selecionar Detalhes de um Pedido
```sql
SELECT p.pedido_id, p.pedido_data_hora, p.pedido_status, p.pedido_total, c.cliente_nome, r.restaurante_nome
FROM Pedido p
JOIN Cliente c ON p.cliente_id = c.cliente_id
JOIN Restaurante r ON p.restaurante_id = r.restaurante_id
WHERE p.pedido_id = 1;
```

#### Selecionar Itens Mais Vendidos
```sql
SELECT 
    im.item_menu_nome,
    SUM(ip.item_pedido_quantidade) AS total_vendido
FROM 
    ItemPedido ip
JOIN 
    ItemMenu im ON ip.item_menu_id = im.item_menu_id
GROUP BY 
    im.item_menu_nome
ORDER BY 
    total_vendido DESC;
```
