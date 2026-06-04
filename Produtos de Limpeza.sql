DROP DATABASE IF EXISTS produtos_de_limpeza;
CREATE DATABASE IF NOT EXISTS produtos de limpeza;
USE produtos de limpeza

CREATE TABLE IF NOT EXISTS `categorias` (
    `id_categoria` int AUTO_INCREMENT NOT NULL,
    `nome_categoria` varchar(100) NOT NULL,
    `descricao` text NOT NULL,
    PRIMARY KEY (`id_categoria`)
);


CREATE TABLE IF NOT EXISTS `fornecedores` (
    `id_fornecedor` int AUTO_INCREMENT NOT NULL,
    `nome` varchar(150) NOT NULL,
    `telefone` varchar(20) NOT NULL,
    `email` varchar(100) NOT NULL,
    `endereco` varchar(200) NOT NULL,
    PRIMARY KEY (`id_fornecedor`)
); 


CREATE TABLE IF NOT EXISTS `produtos` (
    `id_produto` int AUTO_INCREMENT NOT NULL,
    `nome` varchar(150) NOT NULL,
    `descricao` text NOT NULL,
    `quantidade_estoque` int NOT NULL,
    `unidade` varchar(20) NOT NULL,
    `validade` date NOT NULL,
    `id_categoria` int NOT NULL,
    `id_fornecedor` int NOT NULL,
    PRIMARY KEY (`id_produto`)
); 


CREATE TABLE IF NOT EXISTS `entradas_estoque` (
    `id_entrada` int AUTO_INCREMENT NOT NULL,
    `id_produto` int NOT NULL,
    `quantidade` int NOT NULL,
    `data_entrada` date NOT NULL,
    `responsavel` varchar(100) NOT NULL,
    PRIMARY KEY (`id_entrada`)
); 


CREATE TABLE IF NOT EXISTS `saidas_estoque` (
    `id_saida` int AUTO_INCREMENT NOT NULL,
    `id_produto` int NOT NULL,
    `quantidade` int NOT NULL,
    `data_saida` date NOT NULL,
    `destino` varchar(100) NOT NULL,
    PRIMARY KEY (`id_saida`)
); 



ALTER TABLE `produtos` 
    ADD CONSTRAINT `fk_produtos_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias`(`id_categoria`),
    ADD CONSTRAINT `fk_produtos_fornecedores` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores`(`id_fornecedor`);

ALTER TABLE `entradas_estoque` 
    ADD CONSTRAINT `fk_entradas_produtos` FOREIGN KEY (`id_produto`) REFERENCES `produtos`(`id_produto`);

ALTER TABLE `saidas_estoque` 
    ADD CONSTRAINT `fk_saidas_produtos` FOREIGN KEY (`id_produto`) REFERENCES `produtos`(`id_produto`);




INSERT INTO `categorias` (`nome_categoria`, `descricao`) VALUES
('Detergentes e Sabões', 'Produtos destinados à lavagem de louças, tecidos e superfícies gerais.'),
('Desinfetantes', 'Produtos químicos utilizados para destruição de microrganismos em superfícies inanimadas.'),
('Multiuso e Limpadores', 'Líquidos voltados para limpeza rápida de azulejos, plásticos e superfícies laváveis.'),
('Equipamentos e Acessórios', 'Itens de apoio à limpeza como panos, esponjas, rodos e vassouras.'),
('Removedores e Desengordurantes', 'Fórmulas concentradas para remoção de gorduras pesadas e ceras.');


INSERT INTO `fornecedores` (`nome`, `telefone`, `email`, `endereco`) VALUES
('Limpeza Total Distribuidora', '(11) 98888-1111', 'comercial@limpezatotal.com', 'Av. das Nações, 1500 - São Paulo/SP'),
('Química Central Ltda', '(21) 2555-2222', 'vendas@quimicacentral.com', 'Rua Industrial, 45 - Rio de Janeiro/RJ'),
('Acessórios Brilho Max', '(31) 3444-3333', 'contato@brilhomax.com', 'Av. dos Bandeirantes, 820 - Belo Horizonte/MG'),
('EcoClean Soluções Sustentáveis', '(41) 99999-4444', 'suporte@ecoclean.com', 'Rua das Flores, 300 - Curitiba/PR'),
('Atacadão do Sabão', '0800-777-5555', 'pedidos@atacadaodosabao.com', 'Via Expressa, Km 12 - Contagem/MG');


INSERT INTO `produtos` (`nome`, `descricao`, `quantidade_estoque`, `unidade`, `validade`, `id_categoria`, `id_fornecedor`) VALUES
('Detergente Líquido Neutro 500ml', 'Detergente para louças com alto poder desengordurante.', 120, 'Unidade', '2027-05-10', 1, 1),
('Desinfetante de Pinho 5L', 'Desinfetante concentrado de alta eficácia com aroma de pinho.', 45, 'Galão', '2026-12-15', 2, 2),
('Limpador Multiuso Clássico 500ml', 'Limpador instantâneo para superfícies diversas.', 85, 'Unidade', '2027-02-20', 3, 4),
('Esponja de Aço Dupla Face', 'Pacote com 4 unidades de esponja para limpeza pesada.', 200, 'Pacote', '2030-01-01', 4, 3),
('Desengordurante Squeeze 750ml', 'Desengordurante potente para fogões e cozinhas industriais.', 30, 'Unidade', '2026-10-30', 5, 5);


INSERT INTO `entradas_estoque` (`id_produto`, `quantidade`, `data_entrada`, `responsavel`) VALUES
(1, 100, '2026-01-10', 'Carlos Silva'),
(2, 40, '2026-01-12', 'Mariana Souza'),
(3, 50, '2026-01-15', 'Carlos Silva'),
(4, 150, '2026-01-20', 'Roberto Alves'),
(5, 25, '2026-01-22', 'Mariana Souza');


INSERT INTO `saidas_estoque` (`id_produto`, `quantidade`, `data_saida`, `destino`) VALUES
(1, 15, '2026-02-01', 'Setor de Cozinha - Refeitório Central'),
(2, 5, '2026-02-03', 'Limpeza dos Blocos Administrativos'),
(3, 10, '2026-02-05', 'Setor de Atendimento ao Cliente'),
(4, 20, '2026-02-06', 'Copa Geral - Prédio B'),
(5, 4, '2026-02-10', 'Cozinha Industrial - Bloco A');