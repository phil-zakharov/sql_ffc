--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_count_mln integer,
    star_count integer,
    has_black_hole boolean NOT NULL,
    type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    weight integer,
    age integer,
    radius numeric(5,5),
    description text,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    large boolean,
    tech_name character varying(255)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer NOT NULL,
    type text,
    weight integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: structure; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.structure (
    name character varying(255) NOT NULL,
    structure_id integer NOT NULL,
    description text,
    tech_name character varying(255),
    discovered_by character varying(255)
);


ALTER TABLE public.structure OWNER TO freecodecamp;

--
-- Name: structure_structure_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.structure ALTER COLUMN structure_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.structure_structure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 5, 5, false, 'Спиральная галактика с баром');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum Galaxy', 15, 25, false, 'Спиральная галактика типа Sc');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Водоворот', 160, 50, true, 'спиральная галактика');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Большое Магелланово Облако', 250, 100, true, 'относят к неправильным галактикам');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Чёрный Глаз', 300, 100, true, '');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda Galaxy', 140, 50, true, 'Спиральная галактика');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'moon 1', NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'moon 2', NULL, NULL, NULL, NULL, 1, 2);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'moon 3', NULL, NULL, NULL, NULL, 1, 2);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'moon 4', NULL, NULL, NULL, NULL, 2, 1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'moon 5', NULL, NULL, NULL, NULL, 2, 2);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'moon 6', NULL, NULL, NULL, NULL, 2, 3);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'moon 7', NULL, NULL, NULL, NULL, 2, 3);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'moon 8', NULL, NULL, NULL, NULL, 2, 4);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'moon 9', NULL, NULL, NULL, NULL, 3, 1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'moon 10', NULL, NULL, NULL, NULL, 3, 2);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'moon 11', NULL, NULL, NULL, NULL, 2, 1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'moon 12', NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'moon 13', NULL, NULL, NULL, NULL, 1, 4);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'moon 14', NULL, NULL, NULL, NULL, 1, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'moon 15', NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'moon 16', NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'moon 17', NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'moon 18', NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'moon 19', NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'moon 20', NULL, NULL, NULL, NULL, 1, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Арракис', 1, 2, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Себан', 1, 2, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Менарис', 1, 2, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Proxima b', 1, 3, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Proxima d', 1, 3, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Capella Aa', 1, 6, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Capella Ab', 1, 6, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'planet unknown', 1, 7, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'planet unknown', 1, 8, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'planet unknown', 1, 9, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'planet unknown', 1, 10, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'planet unknown', 1, 11, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (13, 'planet unknown', 2, 8, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (14, 'planet unknown', 2, 9, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (15, 'planet unknown', 2, 10, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (16, 'planet unknown', 3, 11, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (17, 'planet unknown', 3, 12, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (18, 'planet unknown', 3, 13, NULL, NULL);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (19, 'planet unknown', 3, 14, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Сириус', 1, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Канопус', 1, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Альфа Центавра', 1, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Арктур', 1, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Вега', 1, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Капелла', 1, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (7, 'Ригель', 1, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (8, 'AF Андромеды', 2, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (9, 'Звезды типа RR Лиры', 2, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (10, 'Яркие голубые переменные', 2, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (11, 'M33 X-7', 3, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (12, 'Звезда Романо', 3, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (13, 'Var 83', 3, NULL, NULL);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (14, 'Туманность NGC 604', 3, NULL, NULL);


--
-- Data for Name: structure; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.structure OVERRIDING SYSTEM VALUE VALUES ('спиральных галактик с перемычкой', 1, NULL, NULL, NULL);
INSERT INTO public.structure OVERRIDING SYSTEM VALUE VALUES ('спиральная галактика', 2, NULL, NULL, NULL);
INSERT INTO public.structure OVERRIDING SYSTEM VALUE VALUES ('спиральная галактика типа Sc', 3, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: structure_structure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.structure_structure_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_tech_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_tech_name_key UNIQUE (tech_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_weight_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_weight_key UNIQUE (weight);


--
-- Name: structure structure_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.structure
    ADD CONSTRAINT structure_pkey PRIMARY KEY (structure_id);


--
-- Name: structure structure_tech_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.structure
    ADD CONSTRAINT structure_tech_name_key UNIQUE (tech_name);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

