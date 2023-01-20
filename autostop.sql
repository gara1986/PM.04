-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 21 2023 г., 01:04
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
-- Структура таблицы `chardetail`
--

CREATE TABLE `chardetail` (
  `Характеристика` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Подробности` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `detail`
--

CREATE TABLE `detail` (
  `Название` text COLLATE utf8mb4_general_ci,
  `Модель` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `Наличие` text COLLATE utf8mb4_general_ci NOT NULL,
  `Цена` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `detail`
--

INSERT INTO `detail` (`Название`, `Модель`, `Наличие`, `Цена`) VALUES
('Поршневые кольца', 'Lada Niva Legend', 'есть', 1300),
('Поршневые кольца', 'Lada Samara', 'есть', 1500),
('Поршень', 'Lada Niva Legend', 'нет', 2500),
('Поршень', 'Lada Samara', 'есть', 2600),
('Подвески для двигателя', 'Lada Niva Legend', 'есть', 400),
('Подвески для двигателя', 'Lada Samara', 'есть', 650),
('Сальники', 'Lada Niva Legend', 'есть', 150),
('Сальники', 'Lada Samara', 'есть', 170),
('Комплект валов', 'Lada Niva Legend', 'есть', 8000),
('Комплект валов', 'Lada Samara', 'есть', 9000),
('Маховик', 'Lada Niva Legend', 'есть', 3500),
('Маховик', 'Lada Samara', 'есть', 4400);

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
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
