-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Jun-2022 às 01:03
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `empresa2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `id` int(11) NOT NULL,
  `Nome Completo` varchar(100) DEFAULT NULL,
  `CPF` int(11) NOT NULL,
  `RG` varchar(30) NOT NULL,
  `Data Nascimento` date DEFAULT NULL,
  `Usuário` varchar(30) NOT NULL,
  `uf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id`, `Nome Completo`, `CPF`, `RG`, `Data Nascimento`, `Usuário`, `uf_id`) VALUES
(1, 'Fortaleza', 0, '', NULL, '', 6),
(4, 'Caucaia', 0, '', NULL, '', 6),
(5, 'Natal', 0, '', NULL, '', 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(12) NOT NULL,
  `data_nascimento` date NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `logradouro` varchar(20) NOT NULL,
  `numero` char(6) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(20) NOT NULL,
  `cliente_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_completo`, `cpf`, `rg`, `data_nascimento`, `usuario`, `logradouro`, `numero`, `complemento`, `bairro`, `cliente_fk`) VALUES
(1, 'Cauã Marinho de Sousa', '234.243.765-45', '1234567899.3', '2004-01-01', 'Marin123456', 'Lot.Parque Deodato', '123456', 'Em frente a uma casa amarela.', 'arrozcomovo', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `logradouro` varchar(20) NOT NULL,
  `numero` char(6) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(20) NOT NULL,
  `cidade` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`) VALUES
(1, 'praça da replubica', '547', 'Rua sem saida', 'Aldeota', 'Fortaleza-ce'),
(5, 'Praça Hermes pereira', '675', '', 'Vilha velha', 'Fortaleza-ce'),
(6, 'praça da sé', '6549', '', 'José walter', 'Fortaleza-ce'),
(7, 'praça três irmãos', '451', '', 'Pirumbu', 'Fortaleza-ce'),
(8, 'Praça do ibirapuera', '5345', 'N° 32', 'São paulo', 'São paulo'),
(9, 'praça dois irmãos', '728', '', 'chisto redentor', 'Caucaia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `idfun` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `profissao` varchar(30) NOT NULL,
  `dtnascto` date NOT NULL,
  `estadocivil` varchar(10) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uf`
--

CREATE TABLE `uf` (
  `id_uf` int(4) NOT NULL,
  `Sigla` varchar(2) NOT NULL,
  `Estado` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `uf`
--

INSERT INTO `uf` (`id_uf`, `Sigla`, `Estado`) VALUES
(1, 'AC', 'Acre'),
(2, 'AL', 'Alagoas'),
(3, 'AP', 'Amapá'),
(4, 'AM', 'Amazonas'),
(5, 'BA', 'Bahia'),
(6, 'CE', 'Ceará'),
(7, 'DF', 'Distrito Federal'),
(8, 'ES', 'Espírito Santo'),
(9, 'GO', 'Goiás'),
(10, 'MA', 'Maranhão'),
(11, 'MT', 'Mato Grosso'),
(12, 'MS', 'Mato Grosso do Sul'),
(13, 'MG', 'Minas Gerais'),
(14, 'PA', 'Pará'),
(15, 'PB', 'Paraíba'),
(16, 'PR', 'Paraná'),
(17, 'PE', 'Pernambuco'),
(18, 'PI', 'Piauí'),
(19, 'RJ', 'Rio de Janeiro'),
(20, 'RN', 'Rio Grande do Norte'),
(21, 'RS', 'Rio Grande do Sul'),
(22, 'RO', 'Rondônia'),
(23, 'RR', 'Roraima'),
(24, 'SC', 'Santa Catarina'),
(25, 'SP', 'São Paulo'),
(26, 'SE', 'Sergipe'),
(27, 'TO', 'Tocantins');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uf_id` (`uf_id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Índices para tabela `uf`
--
ALTER TABLE `uf`
  ADD PRIMARY KEY (`id_uf`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `uf`
--
ALTER TABLE `uf`
  MODIFY `id_uf` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`uf_id`) REFERENCES `uf` (`id_uf`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_endereco` FOREIGN KEY (`id_cliente`) REFERENCES `endereco` (`id_endereco`);

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_uf` FOREIGN KEY (`id_endereco`) REFERENCES `uf` (`id_uf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
