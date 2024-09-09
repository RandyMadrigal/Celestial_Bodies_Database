--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    has_own_sun boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_km numeric NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric,
    has_life boolean NOT NULL,
    is_spherical boolean,
    star_id integer,
    species_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer NOT NULL,
    galaxy_id integer,
    has_life boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our solar system', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest spiral galaxy to the Milky Way', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy located in the Triangulum constellation', true, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A giant elliptical galaxy in the Virgo cluster', true, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A classic spiral galaxy located in the constellation Canes Venatici', true, true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.1, false, true, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Io', 1821.6, false, true, 628300000, 2);
INSERT INTO public.moon VALUES (3, 'Europa', 1560.8, false, true, 628300000, 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2634.1, false, true, 628300000, 4);
INSERT INTO public.moon VALUES (5, 'Callisto', 2410.3, false, true, 628300000, 5);
INSERT INTO public.moon VALUES (6, 'Titan', 2575.0, false, true, 1221700, 6);
INSERT INTO public.moon VALUES (7, 'Rhea', 763.8, false, true, 527108, 7);
INSERT INTO public.moon VALUES (8, 'Iapetus', 736.0, false, true, 356300, 8);
INSERT INTO public.moon VALUES (9, 'Dione', 561.4, false, true, 377400, 9);
INSERT INTO public.moon VALUES (10, 'Enceladus', 504.2, false, true, 238000, 10);
INSERT INTO public.moon VALUES (11, 'Tethys', 1, false, true, 294660, 11);
INSERT INTO public.moon VALUES (12, 'Miranda', 235.8, false, true, 1293900, 12);
INSERT INTO public.moon VALUES (13, 'Ariel', 578.9, false, true, 1910200, 13);
INSERT INTO public.moon VALUES (14, 'Umbriel', 584.7, false, true, 2660300, 15);
INSERT INTO public.moon VALUES (15, 'Titania', 788.4, false, true, 2717900, 14);
INSERT INTO public.moon VALUES (16, 'Oberon', 761.4, false, true, 3017000, 1);
INSERT INTO public.moon VALUES (17, 'Charon', 1207.0, false, true, 591300, 2);
INSERT INTO public.moon VALUES (18, 'Mimas', 198.2, false, true, 185539, 3);
INSERT INTO public.moon VALUES (19, 'Hyperion', 266.0, false, true, 1, 4);
INSERT INTO public.moon VALUES (20, 'Phobos', 11.1, false, true, 9377, 5);
INSERT INTO public.moon VALUES (21, 'Deimos', 6.2, false, true, 23460, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, true, 1, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 2, false, true, 2, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 2, true, true, 3, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, true, 4, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 3, false, true, 5, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 3, false, true, 6, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, false, true, 1, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, false, true, 2, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, false, true, 3, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 1, false, true, 4, 2);
INSERT INTO public.planet VALUES (11, 'Ceres', 1, false, true, 5, 3);
INSERT INTO public.planet VALUES (12, 'Haumea', 1, false, true, 6, 4);
INSERT INTO public.planet VALUES (13, 'Makemake', 1, false, true, 1, 3);
INSERT INTO public.planet VALUES (14, 'Sedna', 1, false, true, 2, 3);
INSERT INTO public.planet VALUES (15, 'Charon', 1, false, true, 3, 3);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Human', 'A species of intelligent, tool-using primates.');
INSERT INTO public.species VALUES (2, 'Zorgon', 'Extraterrestrial beings with advanced technology and a hive mind.');
INSERT INTO public.species VALUES (3, 'Catfolk', 'Humanoid beings with feline characteristics, originating from Earth.');
INSERT INTO public.species VALUES (4, 'Klarion', 'Alien species with bioluminescent skin and telepathic abilities.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 9, 1, false);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 643, 2, false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 4, 3, false);
INSERT INTO public.star VALUES (4, 'Vega', 25, 4, false);
INSERT INTO public.star VALUES (5, 'Polaris', 433, 5, false);
INSERT INTO public.star VALUES (6, 'Altair', 17, 6, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 4, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon unique_name_moon_; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon_ UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: species unique_name_species_; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT unique_name_species_ UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_species_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES public.species(species_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

