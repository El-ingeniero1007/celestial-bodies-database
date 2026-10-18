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
    description text,
    age_in_millions_of_years numeric NOT NULL,
    galaxy_types integer NOT NULL,
    has_life boolean
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    orbital_period_days integer NOT NULL,
    is_spherical boolean NOT NULL,
    albedo numeric
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    radius_in_km integer NOT NULL,
    distance_from_earth numeric,
    has_life boolean NOT NULL
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(50) NOT NULL,
    launch_year integer NOT NULL,
    is_active boolean NOT NULL,
    mission_type text
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_earth numeric,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy containing Earth.', 13600, 1, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major spiral galaxy.', 10000, 1, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Member of the Local Group.', 12000, 2, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unbarred spiral galaxy in Virgo.', 9000, 3, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Interacting grand-design spiral galaxy.', 400, 1, false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way.', 1100, 4, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 27, true, 0.12);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0, false, 0.07);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1, false, 0.06);
INSERT INTO public.moon VALUES (4, 'Io', 5, 2, true, 0.63);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4, true, 0.67);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7, true, 0.43);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 17, true, 0.22);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 16, true, 0.22);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 1, true, 0.81);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 1, true, 0.07);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 5, true, 0.65);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 3, true, 0.99);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 2, true, 1.00);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 79, true, 0.05);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 9, true, 0.27);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 13, true, 0.31);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 4, true, 0.21);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 3, true, 0.39);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 1, true, 0.32);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 6, true, 0.76);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2439, 91.7, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6051, 41.4, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, 0.0, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3389, 78.3, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, 628.7, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, 1275.0, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25362, 2723.9, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24622, 4351.4, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 7160, 4.2, false);
INSERT INTO public.planet VALUES (10, 'Sirius b I', 3, 3000, 8.6, false);
INSERT INTO public.planet VALUES (11, 'Vega Prime', 5, 5200, 25.0, false);
INSERT INTO public.planet VALUES (12, 'Polaris b', 6, 8900, 433.8, false);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', 1977, true, 'Interstellar probe');
INSERT INTO public.spacecraft VALUES (2, 'Hubble Space Telescope', 1990, true, 'Space telescope');
INSERT INTO public.spacecraft VALUES (3, 'James Webb Space Telescope', 2021, true, 'Infrared space telescope');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0.0, 4600, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 4.37, 5000, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 8.6, 240, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 642.5, 10, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 25.0, 455, true);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 433.8, 70, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

