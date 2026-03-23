-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/03/2026 às 14:46
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_escolar`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `turma_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `faltas`
--

CREATE TABLE `faltas` (
  `id` int(11) NOT NULL,
  `aluno_id` int(11) DEFAULT NULL,
  `materia_id` int(11) DEFAULT NULL,
  `periodo_id` int(11) DEFAULT NULL,
  `faltas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `aluno_id` int(11) DEFAULT NULL,
  `materia_id` int(11) DEFAULT NULL,
  `periodo_id` int(11) DEFAULT NULL,
  `nota_id` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `periodos`
--

CREATE TABLE `periodos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor_materias`
--

CREATE TABLE `professor_materias` (
  `id` int(11) NOT NULL,
  `professor_id` int(11) DEFAULT NULL,
  `materia_id` int(11) DEFAULT NULL,
  `turma_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `ano` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `tipo` enum('admin','professor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `turma_id` (`turma_id`);

--
-- Índices de tabela `faltas`
--
ALTER TABLE `faltas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aluno_id` (`aluno_id`),
  ADD KEY `materia_id` (`materia_id`),
  ADD KEY `periodo_id` (`periodo_id`);

--
-- Índices de tabela `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aluno_id` (`aluno_id`),
  ADD KEY `materia_id` (`materia_id`),
  ADD KEY `periodo_id` (`periodo_id`);

--
-- Índices de tabela `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `professor_materias`
--
ALTER TABLE `professor_materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `professor_id` (`professor_id`),
  ADD KEY `materia_id` (`materia_id`),
  ADD KEY `turma_id` (`turma_id`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `faltas`
--
ALTER TABLE `faltas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor_materias`
--
ALTER TABLE `professor_materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`);

--
-- Restrições para tabelas `faltas`
--
ALTER TABLE `faltas`
  ADD CONSTRAINT `faltas_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  ADD CONSTRAINT `faltas_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `faltas_ibfk_3` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`id`);

--
-- Restrições para tabelas `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`),
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `notas_ibfk_3` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`id`);

--
-- Restrições para tabelas `professor_materias`
--
ALTER TABLE `professor_materias`
  ADD CONSTRAINT `professor_materias_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `professor_materias_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `professor_materias_ibfk_3` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
