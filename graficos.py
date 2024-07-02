import pymysql
import pandas as pd
import matplotlib.pyplot as plt

# Passo 1: Conectar ao Banco de Dados
conn = pymysql.connect(host='localhost', user='root', password='', db='delivery_app')

# Passo 2: Realizar a Consulta SQL
# Consulta SQL para obter os dados
query_vendas = '''
SELECT restaurante_nome, SUM(item_pedido.item_pedido_subtotal) AS total_vendas
FROM item_pedido
JOIN pedidos ON item_pedido.pedido_id = pedidos.pedido_id
JOIN item_menu ON item_pedido.item_menu_id = item_menu.item_menu_id
JOIN restaurantes ON item_menu.restaurante_id = restaurantes.restaurante_id
GROUP BY restaurante_nome
ORDER BY total_vendas DESC
'''

query_pedidos_status = '''
SELECT pedido_status, COUNT(*) AS total
FROM pedidos
GROUP BY pedido_status
'''

query_pedidos_restaurante = '''
SELECT restaurante_nome, COUNT(pedidos.pedido_id) AS num_pedidos
FROM pedidos
JOIN item_pedido ON item_pedido.pedido_id = pedidos.pedido_id
JOIN item_menu ON item_pedido.item_menu_id = item_menu.item_menu_id
JOIN restaurantes ON item_menu.restaurante_id = restaurantes.restaurante_id
GROUP BY restaurante_nome
ORDER BY num_pedidos DESC
'''

# Carregar os dados em DataFrames
df_vendas = pd.read_sql(query_vendas, conn)
df_pedidos_status = pd.read_sql(query_pedidos_status, conn)
df_pedidos_restaurante = pd.read_sql(query_pedidos_restaurante, conn)

# Fechar a conexão com o banco de dados
conn.close()

# Gráfico 1: Valor total de venda dos restaurantes
plt.figure(figsize=(12, 8))
plt.barh(df_vendas['restaurante_nome'], df_vendas['total_vendas'], color='skyblue')
plt.xlabel('Valor Total de Vendas')
plt.ylabel('Restaurantes')
plt.title('Valor Total de Vendas por Restaurante')
plt.grid(axis='x')
plt.tight_layout()
plt.show()

# Gráfico 2: Quantos pedidos foram entregues e quantos foram cancelados
plt.figure(figsize=(8, 6))
plt.pie(df_pedidos_status['total'], labels=df_pedidos_status['pedido_status'], autopct='%1.1f%%', startangle=140)
plt.title('Distribuição de Pedidos: Entregues vs Cancelados')
plt.tight_layout()
plt.show()

# Gráfico 3: Número de pedidos que cada restaurante recebeu
plt.figure(figsize=(12, 8))
plt.barh(df_pedidos_restaurante['restaurante_nome'], df_pedidos_restaurante['num_pedidos'], color='lightgreen')
plt.xlabel('Número de Pedidos')
plt.ylabel('Restaurantes')
plt.title('Número de Pedidos por Restaurante')
plt.grid(axis='x')
plt.tight_layout()
plt.show()

conn.close()