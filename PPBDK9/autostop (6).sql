-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 25 2023 г., 05:31
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
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(5, 'Комплект валов'),
(6, 'Маховик'),
(3, 'Подвеска для двигателя'),
(2, 'Поршень'),
(1, 'Поршневые кольца'),
(4, 'Сальники');

-- --------------------------------------------------------

--
-- Структура таблицы `detail`
--

CREATE TABLE `detail` (
  `id` int UNSIGNED NOT NULL,
  `detname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detmodelid` int UNSIGNED NOT NULL,
  `detprice` decimal(10,2) NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_categories` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `detail`
--

INSERT INTO `detail` (`id`, `detname`, `detmodelid`, `detprice`, `img`, `id_categories`) VALUES
(1, 'Поршневые кольца', 1, '1300.00', 'PKNL.png', 1),
(2, 'Поршневые кольца', 2, '1500.00', 'PKSam.png', 1),
(3, 'Поршень', 1, '2500.00', 'Por.png', 2),
(4, 'Поршень', 2, '2600.00', 'Por.png', 2),
(5, 'Подвески для двигателя', 1, '400.00', 'PodNL.png', 3),
(6, 'Подвески для двигателя', 2, '650.00', 'PodSam.png', 3),
(7, 'Сальники', 1, '150.00', 'SalNL.png', 4),
(8, 'Сальники', 2, '170.00', 'SalSam.png', 4),
(9, 'Комплект валов', 1, '8000.00', 'ValNL.png', 5),
(10, 'Комплект валов', 2, '9000.00', 'ValSam.png', 5),
(11, 'Маховик', 1, '3500.00', 'MahNL.png', 6),
(12, 'Маховик', 2, '4400.00', 'MahSam.png', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `models`
--

CREATE TABLE `models` (
  `modelid` int UNSIGNED NOT NULL,
  `modelname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `models`
--

INSERT INTO `models` (`modelid`, `modelname`) VALUES
(1, 'Niva Legend'),
(2, 'Samara');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int UNSIGNED NOT NULL,
  `detnameid` int UNSIGNED NOT NULL,
  `modelid` int UNSIGNED NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `userid` int NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `detnameid`, `modelid`, `price`, `userid`, `date_time`) VALUES
(1, 1, 1, '1300.00', 1, '2023-01-02 06:17:39'),
(2, 2, 2, '400.00', 2, '2023-01-18 06:17:39');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `firstname` varchar(102) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(102) COLLATE utf8mb4_general_ci NOT NULL,
  `password` binary(60) NOT NULL,
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `firstname`, `name`, `password`, `contact`, `address`) VALUES
(1, 'Кретин', 'Давид', 0x6f706f7373756d3134000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '89663338201', 'г.Москва,ул.Ленинградская,д.11,кв.10'),
(2, 'Качкин', 'Александр', 0x6772696765486f3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '89557906987', 'г.Москва,ул.Калинина,д.4,кв.70'),
(3, 'Фурдюк', 'Дмитрий', 0x6c6f70757831310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '89777502103', 'г.Москва,пр.Вернандского,д.6,кв.7');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Цена` (`detprice`),
  ADD KEY `categories` (`id_categories`),
  ADD KEY `detmodel` (`detmodelid`);

--
-- Индексы таблицы `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`modelid`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price` (`price`),
  ADD KEY `userid` (`userid`) USING BTREE,
  ADD KEY `detinfo` (`detnameid`) USING BTREE,
  ADD KEY `detid` (`detnameid`),
  ADD KEY `modelcar` (`modelid`),
  ADD KEY `detnameid` (`detnameid`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact` (`contact`),
  ADD KEY `contact_2` (`contact`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `detail`
--
ALTER TABLE `detail`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `models`
--
ALTER TABLE `models`
  MODIFY `modelid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `detail_ibfk_2` FOREIGN KEY (`detmodelid`) REFERENCES `models` (`modelid`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`detnameid`) REFERENCES `detail` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`price`) REFERENCES `detail` (`detprice`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`modelid`) REFERENCES `models` (`modelid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
