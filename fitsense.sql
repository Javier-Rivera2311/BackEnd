-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2024 a las 07:41:16
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fitsense`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userapp`
--

CREATE TABLE `userapp` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `exercise_level` enum('Poco o ningún ejercicio','Ejercicio ligero (1 - 3 días por semana)','Ejercicio moderado (3 - 5 días por semana)','Ejercicio fuerte (6 - 7 días por semana)') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `userapp`
--

INSERT INTO `userapp` (`ID`, `email`, `password`, `name`, `lastname`, `edad`, `altura`, `peso`, `exercise_level`) VALUES
(1, 'ejemplo@email.com', 'P12345.', 'test1', NULL, NULL, NULL, NULL, NULL),
(2, 'javier@gmail.com', '$2b$10$ExkNwLb3gt6EXXz0cG9DBOB.PRuN/g33TGu3jjVHphPBmMQ9/yWZ.', 'Javier', 'Rivera Pizarro', NULL, NULL, NULL, NULL),
(3, 'javier23@gmail.com', '$2b$10$GJtvI7MAzlXDTUqZgHds5uTyKcnlu.HvbNEZ9zMhvwF6vY/3TnSlC', 'Javier Ignacio', 'Rivera Pizarro', NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `userapp`
--
ALTER TABLE `userapp`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `userapp`
--
ALTER TABLE `userapp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userapp`
--

CREATE TABLE `tecnica_ejercicios` (
  `ID` int(11) NOT NULL,
  `nombre_ejercicio` varchar(255) DEFAULT NULL,
  `descripcion` TEXT DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Indices de la tabla `userapp`
--
ALTER TABLE `tecnica_ejercicios`
  ADD PRIMARY KEY (`ID`)

-- AUTO_INCREMENT de la tabla `userapp`
--
ALTER TABLE `tecnica_ejercicios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;


-- --------------------------------------------------------

-- Create the `rutinas` table
CREATE TABLE `rutinas` (
  `ID` int(11) NOT NULL,
  `nombre_rutina` varchar(255) NOT NULL,
  `ejercicio_id` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `repeticiones` int(11) NOT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `sensores` varchar(255) DEFAULT NULL,
  FOREIGN KEY (`ejercicio_id`) REFERENCES `tecnica_ejercicios`(`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Add primary key to `rutinas` table
ALTER TABLE `rutinas`
  ADD PRIMARY KEY (`ID`);

-- Add auto_increment to `rutinas` table
ALTER TABLE `rutinas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

COMMIT;

-- Create the `users_rutinas` table to link users with routines
CREATE TABLE `users_rutinas` (
  `user_id` int(11) NOT NULL,
  `rutina_id` int(11) NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `userapp`(`ID`),
  FOREIGN KEY (`rutina_id`) REFERENCES `rutinas`(`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Add primary key to `users_rutinas` table
ALTER TABLE `users_rutinas`
  ADD PRIMARY KEY (`user_id`, `rutina_id`);

-- --------------------------------------------------------

-- Create the `rutina_ejercicios` table to link routines with exercises
CREATE TABLE `rutina_ejercicios` (
  `ID` int(11) NOT NULL,
  `rutina_id` int(11) NOT NULL,
  `ejercicio_id` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `repeticiones` int(11) NOT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `sensores` varchar(255) DEFAULT NULL,
  FOREIGN KEY (`rutina_id`) REFERENCES `rutinas`(`ID`),
  FOREIGN KEY (`ejercicio_id`) REFERENCES `tecnica_ejercicios`(`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Add primary key to `rutina_ejercicios` table
ALTER TABLE `rutina_ejercicios`
  ADD PRIMARY KEY (`ID`);

-- Add auto_increment to `rutina_ejercicios` table
ALTER TABLE `rutina_ejercicios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;