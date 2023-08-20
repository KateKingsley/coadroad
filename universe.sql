--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    galaxy_id integer NOT NULL,
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovered text,
    star_id integer NOT NULL,
    frequency text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_of_stars integer NOT NULL,
    discovered integer,
    visited boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    size integer,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    num_of_moons numeric,
    distance_star integer,
    size integer,
    has_life boolean,
    discovered text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    num_of_planets numeric NOT NULL,
    size integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 1, 'Percepalous', '2014', 1, 'Nightly');
INSERT INTO public.comet VALUES (1, 2, 'Kadoodle', '2014', 2, 'Daily');
INSERT INTO public.comet VALUES (1, 3, 'Sunshine', '2014', 3, 'Lunar day');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Dog', 1, 2009, true);
INSERT INTO public.galaxy VALUES (2, 'Cat', 2, 2014, true);
INSERT INTO public.galaxy VALUES (3, 'Bird', 4, 2006, true);
INSERT INTO public.galaxy VALUES (4, 'Squirl', 2, 2006, true);
INSERT INTO public.galaxy VALUES (5, 'Rabbit', 1, 2006, true);
INSERT INTO public.galaxy VALUES (6, 'Fish', 4, 2006, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lulu', 1, 90, false);
INSERT INTO public.moon VALUES (2, 'BK1', 1, 9, true);
INSERT INTO public.moon VALUES (3, 'BK2', 2, 13, false);
INSERT INTO public.moon VALUES (4, 'KM1', 2, 140, true);
INSERT INTO public.moon VALUES (5, 'Lewis', 3, 10, false);
INSERT INTO public.moon VALUES (6, 'Pedro', 3, 12, false);
INSERT INTO public.moon VALUES (7, 'GMP', 4, 55, false);
INSERT INTO public.moon VALUES (8, 'KM2', 4, 135, false);
INSERT INTO public.moon VALUES (9, 'Kekabean', 5, 136, false);
INSERT INTO public.moon VALUES (10, 'Grandpooper', 5, 60, false);
INSERT INTO public.moon VALUES (11, 'Lucius', 6, 12, false);
INSERT INTO public.moon VALUES (12, 'Pericus', 6, 14, false);
INSERT INTO public.moon VALUES (13, 'Oak', 11, 1, false);
INSERT INTO public.moon VALUES (14, 'Pecan', 11, 2, false);
INSERT INTO public.moon VALUES (15, 'Hazel', 12, 1, false);
INSERT INTO public.moon VALUES (16, 'Walnut', 12, 3, false);
INSERT INTO public.moon VALUES (17, 'Baby1', 13, 4, false);
INSERT INTO public.moon VALUES (18, 'Baby2', 13, 3, false);
INSERT INTO public.moon VALUES (19, 'Baby3', 13, 4, true);
INSERT INTO public.moon VALUES (20, 'Baby4', 13, 4, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'KP1', 1, 1, 6, 140, true, 'Discovered in early 40s');
INSERT INTO public.planet VALUES (2, 'KP2', 1, 3, 8, 95, true, 'Discovered in late 20s');
INSERT INTO public.planet VALUES (3, 'Occasional', 2, 2, 14, 56, true, '1400');
INSERT INTO public.planet VALUES (4, 'Constant', 2, 2, 2, 52, true, '1453');
INSERT INTO public.planet VALUES (5, 'Pat', 3, 2, 30, 29, true, '1533');
INSERT INTO public.planet VALUES (6, 'Pet', 3, 2, 30, 28, true, '854');
INSERT INTO public.planet VALUES (7, 'Bluebird', 4, 0, 20, 8, false, '724');
INSERT INTO public.planet VALUES (8, 'Redtail', 5, 0, 135, 8, false, '1845');
INSERT INTO public.planet VALUES (9, 'Lovey', 6, 0, 2, 5, false, 'Year round');
INSERT INTO public.planet VALUES (10, 'Red', 7, 0, 67, 3, false, 'Malts in fall');
INSERT INTO public.planet VALUES (11, 'Slappy', 8, 2, 76, 15, true, 'Always here');
INSERT INTO public.planet VALUES (12, 'Happy', 9, 2, 34, 10, true, 'Never seen');
INSERT INTO public.planet VALUES (13, 'Msbunny', 10, 4, 23, 4, true, 'Takes naps');
INSERT INTO public.planet VALUES (14, 'Fancy', 11, 0, 79, 7, false, '345');
INSERT INTO public.planet VALUES (15, 'Pink', 12, 0, 54, 18, false, '10');
INSERT INTO public.planet VALUES (16, 'Sunny', 13, 0, 34, 2, false, '356');
INSERT INTO public.planet VALUES (17, 'Justforthe', 14, 0, 87, 276, false, '1143');
INSERT INTO public.planet VALUES (18, 'Stripe', 15, 0, 20, 18, false, '1487');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Jamie', 1, 2, 60);
INSERT INTO public.star VALUES (2, 'Louie', 2, 2, 10);
INSERT INTO public.star VALUES (3, 'Percy', 2, 2, 13);
INSERT INTO public.star VALUES (4, 'Jay', 3, 1, 1);
INSERT INTO public.star VALUES (5, 'Hawk', 3, 1, 10);
INSERT INTO public.star VALUES (6, 'Dove', 3, 1, 2);
INSERT INTO public.star VALUES (7, 'Cardinal', 3, 1, 1);
INSERT INTO public.star VALUES (8, 'Greysquirl', 4, 1, 3);
INSERT INTO public.star VALUES (9, 'Blacksquirl', 4, 1, 2);
INSERT INTO public.star VALUES (10, 'Bunny', 5, 1, 3);
INSERT INTO public.star VALUES (11, 'Koi', 6, 1, 10);
INSERT INTO public.star VALUES (12, 'Samon', 6, 1, 25);
INSERT INTO public.star VALUES (13, 'Perch', 6, 1, 2);
INSERT INTO public.star VALUES (14, 'Halibut', 6, 1, 300);
INSERT INTO public.star VALUES (15, 'Bass', 6, 1, 15);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

