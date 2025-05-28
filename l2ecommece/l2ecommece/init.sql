DO $$ 
BEGIN
   -- Verifica se o banco existe e cria se não existir
   IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'ecommece') THEN
      CREATE DATABASE ecommece;
   END IF;
END $$;

-- Criação da tabela produto
CREATE TABLE IF NOT EXISTS produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    altura NUMERIC(10,2) NOT NULL,
    largura NUMERIC(10,2) NOT NULL,
    comprimento NUMERIC(10,2) NOT NULL
);

-- Criação da tabela pedido
CREATE TABLE IF NOT EXISTS pedido (
    id SERIAL PRIMARY KEY
);

-- Tabela associativa para pedidos e produtos (N para N)
CREATE TABLE IF NOT EXISTS pedido_produto (
    pedido_id INTEGER REFERENCES pedido(id),
    produto_id INTEGER REFERENCES produto(id),
    PRIMARY KEY (pedido_id, produto_id)
);

-- Inserção de produtos
INSERT INTO produto (nome, altura, largura, comprimento) VALUES
('Notebook', 2.00, 30.00, 20.00),
('Smartphone', 1.00, 7.00, 15.00),
('Monitor', 5.00, 50.00, 30.00);

-- Inserção de pedidos
INSERT INTO pedido DEFAULT VALUES;
INSERT INTO pedido DEFAULT VALUES;

-- Associação de produtos aos pedidos
INSERT INTO pedido_produto (pedido_id, produto_id) VALUES
(1, 1), -- Pedido 1, Produto Notebook
(1, 2), -- Pedido 1, Produto Smartphone
(2, 2), -- Pedido 2, Produto Smartphone
(2, 3); -- Pedido 2, Produto Monitor