-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Out-2021 às 02:57
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `simplerest`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `product_group_id` varchar(60) NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `name`, `status`, `product_group_id`, `price`, `stock`, `created_at`, `updated_at`) VALUES
('7132a63a-263f-11ec-99a7-842b2b7c79ea', 'Picanha', 1, '18ae1cb0-263f-11ec-99a7-842b2b7c79ea', 73.99, 50, '2021-10-06 00:50:46', '2021-10-06 00:50:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_groups`
--

CREATE TABLE `products_groups` (
  `id` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `products_groups`
--

INSERT INTO `products_groups` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
('18ae1cb0-263f-11ec-99a7-842b2b7c79ea', 'Carnes', 1, '2021-10-06 00:48:18', '2021-10-06 00:48:18'),
('18ae3bd1-263f-11ec-99a7-842b2b7c79ea', 'Bebidas', 1, '2021-10-06 00:48:18', '2021-10-06 00:48:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `age` int(11) NOT NULL COMMENT 'user age',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_group`
--

CREATE TABLE `users_group` (
  `id` varchar(60) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT 'Admin',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_users_group`
--

CREATE TABLE `users_users_group` (
  `id` varchar(60) NOT NULL,
  `users_id` varchar(60) NOT NULL,
  `users_groups_id` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `products_groups`
--
ALTER TABLE `products_groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users_group`
--
ALTER TABLE `users_group`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users_users_group`
--
ALTER TABLE `users_users_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_users_groups_fk_users` (`users_id`),
  ADD KEY `users_users_groups_fk_users_groups` (`users_groups_id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `users_users_group`
--
ALTER TABLE `users_users_group`
  ADD CONSTRAINT `uug_fk_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `uug_fk_usrs_groups` FOREIGN KEY (`users_groups_id`) REFERENCES `users_group` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
