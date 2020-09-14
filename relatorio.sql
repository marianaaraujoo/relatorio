-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Set-2020 às 21:11
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `relatorio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `nomecliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nomecliente`) VALUES
(1, 'Maria'),
(2, 'José'),
(3, 'João');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `iditem` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double NOT NULL,
  `tipoitem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`iditem`, `descricao`, `quantidade`, `valor`, `tipoitem`) VALUES
(1, 'Lente1', 100, 13, 1),
(2, 'Lente2', 100, 12, 1),
(3, 'Lente3', 100, 15, 1),
(4, 'Lente4', 100, 31, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacao`
--

CREATE TABLE `transacao` (
  `idtransacao` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idvendedor` int(11) NOT NULL,
  `data` date NOT NULL,
  `tipotransacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `transacao`
--

INSERT INTO `transacao` (`idtransacao`, `idcliente`, `idvendedor`, `data`, `tipotransacao`) VALUES
(1, 3, 1, '2019-09-01', 1),
(2, 3, 1, '2019-10-01', 1),
(3, 3, 1, '2019-12-02', 1),
(4, 3, 2, '2019-03-01', 1),
(5, 3, 2, '2019-08-01', 1),
(6, 3, 3, '2019-01-01', 1),
(7, 3, 3, '2020-02-03', 1),
(8, 3, 3, '2019-04-01', 1),
(9, 3, 3, '2019-05-01', 1),
(10, 3, 3, '2019-06-01', 1),
(11, 3, 3, '2019-11-01', 1),
(12, 2, 1, '2019-02-01', 1),
(13, 2, 1, '2019-05-01', 1),
(14, 2, 1, '2019-09-01', 1),
(15, 2, 1, '2019-10-01', 1),
(16, 2, 1, '2019-11-01', 1),
(17, 2, 3, '2019-01-01', 1),
(18, 2, 3, '2019-03-01', 1),
(19, 2, 3, '2019-04-01', 1),
(20, 2, 3, '2019-06-01', 1),
(21, 2, 3, '2019-12-01', 1),
(22, 1, 2, '2019-01-01', 1),
(23, 1, 2, '2019-02-01', 1),
(24, 1, 2, '2019-03-01', 1),
(25, 1, 2, '2019-04-01', 1),
(26, 1, 2, '2019-05-01', 1),
(27, 1, 2, '2019-06-01', 1),
(28, 1, 2, '2019-08-01', 1),
(29, 1, 2, '2019-09-01', 1),
(30, 1, 2, '2019-11-01', 1),
(31, 1, 2, '2019-12-01', 1),
(32, 1, 3, '2019-07-01', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacaoitem`
--

CREATE TABLE `transacaoitem` (
  `idtransacaoitem` int(11) NOT NULL,
  `idtransacao` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `transacaoitem`
--

INSERT INTO `transacaoitem` (`idtransacaoitem`, `idtransacao`, `iditem`, `quantidade`) VALUES
(1, 1, 1, 20),
(2, 2, 2, 30),
(3, 3, 2, 30),
(4, 4, 2, 20),
(5, 5, 2, 10),
(6, 6, 1, 4),
(7, 7, 2, 6),
(8, 8, 1, 13),
(9, 9, 3, 1),
(10, 10, 4, 9),
(11, 11, 2, 13),
(12, 12, 4, 25),
(13, 13, 2, 1),
(14, 14, 2, 25),
(15, 15, 4, 39),
(16, 16, 2, 13),
(17, 17, 2, 5),
(18, 18, 1, 12),
(19, 19, 1, 11),
(20, 20, 3, 3),
(21, 21, 4, 12),
(22, 22, 2, 32),
(23, 23, 2, 3),
(24, 24, 2, 4),
(25, 25, 1, 13),
(26, 26, 2, 2),
(27, 27, 3, 3),
(28, 28, 1, 6),
(29, 29, 2, 7),
(30, 30, 2, 12),
(31, 31, 2, 15),
(32, 32, 1, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `idvendedor` int(11) NOT NULL,
  `nomevendedor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendedores`
--

INSERT INTO `vendedores` (`idvendedor`, `nomevendedor`) VALUES
(1, 'Antônio'),
(2, 'Francisco'),
(3, 'Raimundo');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`);

--
-- Índices para tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`iditem`);

--
-- Índices para tabela `transacao`
--
ALTER TABLE `transacao`
  ADD PRIMARY KEY (`idtransacao`),
  ADD KEY `idclientefk` (`idcliente`),
  ADD KEY `idvendedorfk` (`idvendedor`);

--
-- Índices para tabela `transacaoitem`
--
ALTER TABLE `transacaoitem`
  ADD PRIMARY KEY (`idtransacaoitem`),
  ADD KEY `idtransacaofk` (`idtransacao`),
  ADD KEY `iditemfk` (`iditem`);

--
-- Índices para tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`idvendedor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `iditem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `transacaoitem`
--
ALTER TABLE `transacaoitem`
  MODIFY `idtransacaoitem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `idvendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `transacao`
--
ALTER TABLE `transacao`
  ADD CONSTRAINT `idclientefk` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idvendedorfk` FOREIGN KEY (`idvendedor`) REFERENCES `vendedores` (`idvendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `transacaoitem`
--
ALTER TABLE `transacaoitem`
  ADD CONSTRAINT `iditemfk` FOREIGN KEY (`iditem`) REFERENCES `item` (`iditem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idtransacaofk` FOREIGN KEY (`idtransacao`) REFERENCES `transacao` (`idtransacao`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
