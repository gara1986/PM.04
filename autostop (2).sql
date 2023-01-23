-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 23 2023 г., 06:44
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `autostop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_catigories` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `id_catigories`) VALUES
(1, 'Niva Legend', 'nl'),
(2, 'Samara', 'sam');

-- --------------------------------------------------------

--
-- Структура таблицы `detail`
--

CREATE TABLE `detail` (
  `id` int UNSIGNED NOT NULL,
  `Название` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Модель` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `Цена` decimal(10,2) NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `detail`
--

INSERT INTO `detail` (`id`, `Название`, `Модель`, `Цена`, `img`) VALUES
(1, 'Поршневые кольца', 'Lada Niva Legend', '1300.00', 'PKNL.png'),
(2, 'Поршневые кольца', 'Lada Samara', '1500.00', 'PKSam.png'),
(3, 'Поршень', 'Lada Niva Legend', '2500.00', 'Por.png'),
(4, 'Поршень', 'Lada Samara', '2600.00', 'Por.png'),
(5, 'Подвески для двигателя', 'Lada Niva Legend', '400.00', 'PodNL.png'),
(6, 'Подвески для двигателя', 'Lada Samara', '650.00', 'PodSam.png'),
(7, 'Сальники', 'Lada Niva Legend', '150.00', 'SalNL.png'),
(8, 'Сальники', 'Lada Samara', '170.00', 'SalSam.png'),
(9, 'Комплект валов', 'Lada Niva Legend', '8000.00', 'ValNL.png'),
(10, 'Комплект валов', 'Lada Samara', '9000.00', 'ValSam.png'),
(11, 'Маховик', 'Lada Niva Legend', '3500.00', 'MahNL.png'),
(12, 'Маховик', 'Lada Samara', '4400.00', 'MahSam.png');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int UNSIGNED NOT NULL,
  `detinfo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `firstname` varchar(102) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(102) COLLATE utf8mb4_general_ci NOT NULL,
  `password` binary(60) NOT NULL,
  `contact` varchar(319) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`firstname`, `name`, `password`, `contact`, `address`, `id`) VALUES
('Кретин', 'Давид', 0x6f706f7373756d3134000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '89663338201', 'г.Москва,ул.Ленинградская,д.11,кв.10', 1),
('Качкин', 'Александр', 0x6772696765486f3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'kachk@mail.ru', 'г.Москва,ул.Калинина,д.4,кв.70', 2),
('Фурдюк', 'Дмитрий', 0x6c6f70757831310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '89777502103', 'г.Москва,пр.Вернандского,д.6,кв.7', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detindex` (`Название`),
  ADD KEY `modindex` (`Модель`),
  ADD KEY `Цена` (`Цена`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price` (`price`),
  ADD KEY `userid` (`userid`) USING BTREE,
  ADD KEY `detinfo` (`detinfo`) USING BTREE;

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `detail`
--
ALTER TABLE `detail`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
