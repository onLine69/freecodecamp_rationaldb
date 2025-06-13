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
    name character varying(40) NOT NULL,
    description text,
    diameters_in_light_years numeric(10,0),
    is_big boolean DEFAULT true
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
-- Name: me; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.me (
    me_id integer NOT NULL,
    greetings text NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.me OWNER TO freecodecamp;

--
-- Name: me_me_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.me_me_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.me_me_id_seq OWNER TO freecodecamp;

--
-- Name: me_me_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.me_me_id_seq OWNED BY public.me.me_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    description text,
    diameters_in_km numeric(6,0)
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
    name character varying(40) NOT NULL,
    star_id integer,
    description text,
    diameters_in_km numeric(8,0),
    number_of_moons integer,
    is_in_solar_system boolean
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
    name character varying(40) NOT NULL,
    galaxy_id integer,
    description text,
    diameters_in_km numeric(10,0),
    number_of_planets integer,
    is_in_milky_way boolean
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
-- Name: me me_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.me ALTER COLUMN me_id SET DEFAULT nextval('public.me_me_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System.', 105700, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way.', 220000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group of galaxies.', 60000, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A classic spiral galaxy located in the constellation Canes Venatici.', 76000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A spiral galaxy in the constellation Virgo, known for its bright nucleus.', 50000, true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way.', 14000, true);


--
-- Data for Name: me; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.me VALUES (1, 'Hello, I am Alex!', 'Alex');
INSERT INTO public.me VALUES (2, 'Hey there, this is Sam.', 'Sam');
INSERT INTO public.me VALUES (3, 'Good day! My name is Jamie.', 'Jamie');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth’s only natural satellite.', 3475);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'The larger and closer of Mars two moons.', 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'The smaller and more distant moon of Mars.', 12);
INSERT INTO public.moon VALUES (4, 'Proxima b I', 5, 'A potential exomoon orbiting Proxima b.', 3000);
INSERT INTO public.moon VALUES (5, 'Sirius Ab I', 6, 'A cold moon around Sirius Ab.', 1500);
INSERT INTO public.moon VALUES (6, 'Andromeda X-1a', 7, 'The largest moon of Andromeda X-1.', 3200);
INSERT INTO public.moon VALUES (7, 'Andromeda X-1b', 7, 'A volcanic moon with a thin atmosphere.', 2900);
INSERT INTO public.moon VALUES (8, 'Andromeda X-1c', 7, 'An icy moon orbiting far from the planet.', 2700);
INSERT INTO public.moon VALUES (9, 'Andromeda X-2a', 8, 'A rocky satellite of X-2.', 1800);
INSERT INTO public.moon VALUES (10, 'Triangulum-Prime I', 9, 'Frozen moon orbiting the exoplanet.', 2000);
INSERT INTO public.moon VALUES (11, 'LMC-1a', 10, 'A massive moon with subsurface oceans.', 5000);
INSERT INTO public.moon VALUES (12, 'LMC-1b', 10, 'Smaller companion moon with rough terrain.', 2100);
INSERT INTO public.moon VALUES (13, 'LMC-1c', 10, 'Tiny moon with a cratered surface.', 900);
INSERT INTO public.moon VALUES (14, 'LMC-1d', 10, 'Captured asteroid in stable orbit.', 400);
INSERT INTO public.moon VALUES (15, 'LMC-2a', 11, 'Only moon of the desert planet LMC-2.', 1500);
INSERT INTO public.moon VALUES (16, 'Kepler-X I', 12, 'Largest of the gas giant’s many moons.', 3500);
INSERT INTO public.moon VALUES (17, 'Kepler-X II', 12, 'Known for its active geysers.', 2800);
INSERT INTO public.moon VALUES (18, 'Kepler-X III', 12, 'Highly reflective icy moon.', 2600);
INSERT INTO public.moon VALUES (19, 'Kepler-X IV', 12, 'Densely cratered ancient satellite.', 2400);
INSERT INTO public.moon VALUES (20, 'Kepler-X V', 12, 'Outermost large moon of Kepler-X.', 2100);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'The smallest planet in the Solar System.', 4879, 0, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Similar in size to Earth, but with a toxic atmosphere.', 12104, 0, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'The only known planet to support life.', 12742, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'The Red Planet, known for its thin atmosphere.', 6779, 2, true);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 'An exoplanet orbiting Proxima Centauri in the habitable zone.', 11400, 0, false);
INSERT INTO public.planet VALUES (6, 'Sirius Ab', 3, 'A hypothetical exoplanet orbiting Sirius A.', 13000, 1, false);
INSERT INTO public.planet VALUES (7, 'Andromeda X-1', 4, 'A giant gas planet in the Andromeda galaxy.', 50000, 10, false);
INSERT INTO public.planet VALUES (8, 'Andromeda X-2', 4, 'A rocky planet believed to orbit Alpha Andromedae.', 13000, 2, false);
INSERT INTO public.planet VALUES (9, 'Triangulum-Prime', 5, 'An icy exoplanet in the Triangulum galaxy.', 15000, 1, false);
INSERT INTO public.planet VALUES (10, 'LMC-1', 6, 'A massive exoplanet in the Large Magellanic Cloud.', 60000, 4, false);
INSERT INTO public.planet VALUES (11, 'LMC-2', 6, 'A desert-like exoplanet orbiting R136a1.', 20000, 0, false);
INSERT INTO public.planet VALUES (12, 'Kepler-X', 3, 'A distant gas giant hypothetically orbiting Sirius.', 71000, 12, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The star at the center of the Solar System.', 1392000, 8, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'The closest known star to the Sun.', 200000, 1, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'The brightest star in the night sky.', 2396000, 2, true);
INSERT INTO public.star VALUES (4, 'Alpha Andromedae', 2, 'A bright star system in the Andromeda Galaxy.', 3000000, 0, false);
INSERT INTO public.star VALUES (5, 'M33-V1', 3, 'A Cepheid variable star in the Triangulum Galaxy.', 1200000, 0, false);
INSERT INTO public.star VALUES (6, 'R136a1', 6, 'One of the most massive known stars, located in the Large Magellanic Cloud.', 30000000, 0, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: me_me_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.me_me_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: me me_greetings_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.me
    ADD CONSTRAINT me_greetings_key UNIQUE (greetings);


--
-- Name: me me_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.me
    ADD CONSTRAINT me_pkey PRIMARY KEY (me_id);


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

