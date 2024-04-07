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
    galaxy_description text,
    galaxy_has_life boolean NOT NULL,
    galaxy_age_in_million_of_years numeric(20,1) NOT NULL,
    galaxy_distance_from_earth_in_km integer
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
-- Name: index; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.index (
    index_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.index OWNER TO freecodecamp;

--
-- Name: index_index_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.index_index_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.index_index_id_seq OWNER TO freecodecamp;

--
-- Name: index_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.index_index_id_seq OWNED BY public.index.index_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_description text,
    moon_has_life boolean NOT NULL,
    moon_age_in_million_of_years numeric(20,1) NOT NULL,
    moon_distance_from_earth_in_km integer,
    planet_id integer NOT NULL
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
    planet_description text,
    planet_has_life boolean NOT NULL,
    planet_age_in_million_of_years numeric(20,1) NOT NULL,
    planet_distance_from_earth_in_km bigint,
    star_id integer NOT NULL
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
    star_description text,
    star_has_life boolean NOT NULL,
    star_age_in_million_of_years numeric(20,1) NOT NULL,
    star_distance_from_earth_in_km integer,
    galaxy_id integer NOT NULL
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
-- Name: index index_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index ALTER COLUMN index_id SET DEFAULT nextval('public.index_index_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 13000.0, 26000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Neighboring galaxy', false, 10000.0, 2400000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy', false, 5000.0, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical galaxy', false, 6000.0, 53000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral galaxy', false, 4000.0, 31000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral galaxy', false, 28000.0, 31000000);


--
-- Data for Name: index; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.index VALUES (1, 1, 1, 1, 1, 'Milky Way - Sun - Mercury - Mercury Moon 1');
INSERT INTO public.index VALUES (2, 1, 1, 1, 2, 'Milky Way - Sun - Mercury - Mercury Moon 2');
INSERT INTO public.index VALUES (3, 1, 1, 2, 3, 'Milky Way - Sun - Venus - Venus Moon 1');
INSERT INTO public.index VALUES (4, 1, 1, 2, 4, 'Milky Way - Sun - Venus - Venus Moon 2');
INSERT INTO public.index VALUES (5, 1, 1, 3, 5, 'Milky Way - Sun - Earth - Earth Moon 1');
INSERT INTO public.index VALUES (6, 1, 1, 3, 6, 'Milky Way - Sun - Earth - Earth Moon 2');
INSERT INTO public.index VALUES (7, 1, 1, 4, 7, 'Milky Way - Sun - Mars - Mars Moon 1');
INSERT INTO public.index VALUES (8, 1, 1, 4, 8, 'Milky Way - Sun - Mars - Mars Moon 2');
INSERT INTO public.index VALUES (9, 1, 1, 5, 9, 'Milky Way - Sun - Jupiter - Jupiter Moon 1');
INSERT INTO public.index VALUES (10, 1, 1, 5, 10, 'Milky Way - Sun - Jupiter - Jupiter Moon 2');
INSERT INTO public.index VALUES (11, 1, 1, 6, 11, 'Milky Way - Sun - Saturn - Saturn Moon 1');
INSERT INTO public.index VALUES (12, 1, 1, 6, 12, 'Milky Way - Sun - Saturn - Saturn Moon 2');
INSERT INTO public.index VALUES (13, 1, 1, 7, 13, 'Milky Way - Sun - Uranus - Uranus Moon 1');
INSERT INTO public.index VALUES (14, 1, 1, 7, 14, 'Milky Way - Sun - Uranus - Uranus Moon 2');
INSERT INTO public.index VALUES (15, 1, 1, 8, 15, 'Milky Way - Sun - Neptune - Neptune Moon 1');
INSERT INTO public.index VALUES (16, 1, 1, 8, 16, 'Milky Way - Sun - Neptune - Neptune Moon 2');
INSERT INTO public.index VALUES (17, 1, 1, 9, 17, 'Milky Way - Sun - Pluto - Pluto Moon 1');
INSERT INTO public.index VALUES (18, 1, 1, 9, 18, 'Milky Way - Sun - Pluto - Pluto Moon 2');
INSERT INTO public.index VALUES (19, 1, 6, 10, 19, 'Milky Way - Proxima Centauri - Kepler-186f - Kepler-186f Moon 1');
INSERT INTO public.index VALUES (20, 1, 6, 10, 20, 'Milky Way - Proxima Centauri - Kepler-186f - Kepler-186f Moon 2');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mercury Moon 1', 'First moon of Mercury', false, 4400.1, 100000, 1);
INSERT INTO public.moon VALUES (2, 'Mercury Moon 2', 'Second moon of Mercury', false, 4400.2, 200000, 1);
INSERT INTO public.moon VALUES (3, 'Venus Moon 1', 'First moon of Venus', false, 4400.3, 150000, 2);
INSERT INTO public.moon VALUES (4, 'Venus Moon 2', 'Second moon of Venus', false, 4400.4, 250000, 2);
INSERT INTO public.moon VALUES (5, 'Earth Moon 1', 'First moon of Earth', false, 4500.1, 384400, 3);
INSERT INTO public.moon VALUES (6, 'Earth Moon 2', 'Second moon of Earth', false, 4500.2, 500000, 3);
INSERT INTO public.moon VALUES (7, 'Mars Moon 1', 'First moon of Mars', false, 4400.5, 9377, 4);
INSERT INTO public.moon VALUES (8, 'Mars Moon 2', 'Second moon of Mars', false, 4400.6, 23460, 4);
INSERT INTO public.moon VALUES (9, 'Jupiter Moon 1', 'First moon of Jupiter', false, 4500.3, 421700, 5);
INSERT INTO public.moon VALUES (10, 'Jupiter Moon 2', 'Second moon of Jupiter', false, 4500.4, 671034, 5);
INSERT INTO public.moon VALUES (11, 'Saturn Moon 1', 'First moon of Saturn', false, 4500.5, 1221868, 6);
INSERT INTO public.moon VALUES (12, 'Saturn Moon 2', 'Second moon of Saturn', false, 4500.6, 238037, 6);
INSERT INTO public.moon VALUES (13, 'Uranus Moon 1', 'First moon of Uranus', false, 4500.7, 354760, 7);
INSERT INTO public.moon VALUES (14, 'Uranus Moon 2', 'Second moon of Uranus', false, 4500.8, 19571, 7);
INSERT INTO public.moon VALUES (15, 'Neptune Moon 1', 'First moon of Neptune', false, 4500.9, 12952000, 8);
INSERT INTO public.moon VALUES (16, 'Neptune Moon 2', 'Second moon of Neptune', false, 4510.0, 527040, 8);
INSERT INTO public.moon VALUES (17, 'Pluto Moon 1', 'First moon of Pluto', false, 4400.7, 3561300, 9);
INSERT INTO public.moon VALUES (18, 'Pluto Moon 2', 'Second moon of Pluto', false, 4400.8, 129390, 9);
INSERT INTO public.moon VALUES (19, 'Kepler-186f Moon 1', 'First moon of Kepler-186f', false, 4501.0, 191020, 10);
INSERT INTO public.moon VALUES (20, 'Kepler-186f Moon 2', 'Second moon of Kepler-186f', false, 4501.1, 266300, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Innermost planet in the Solar System', false, 4.6, 77000000, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun', false, 4.6, 41000000, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Home planet of humanity', true, 4.6, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Fourth planet from the Sun', false, 4.6, 78000000, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in the Solar System', false, 4.6, 628730000, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Sixth planet from the Sun', false, 4.6, 1275000000, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Seventh planet from the Sun', false, 4.6, 2723950000, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Eighth planet from the Sun', false, 4.6, 4351400000, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Kuiper belt', false, 4.6, 5963000000, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Exoplanet orbiting within the habitable zone of its star', true, 1.1, 500000000, 6);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'First exoplanet to be discovered transiting in front of its star', false, 0.1, 153000000, 3);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 'Potentially habitable exoplanet orbiting the ultra-cool dwarf star TRAPPIST-1', true, 0.5, 39000000, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Main sequence star', true, 4.6, 149597870, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', false, 0.3, 9, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Closest star system to the Solar System', false, 4.3, 4, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant star', false, 8.2, 643, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'Bright star in the northern sky', false, 0.5, 25, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Closest known exoplanetary system', false, 0.1, 4, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: index_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.index_index_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


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
-- Name: index index_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_pkey PRIMARY KEY (index_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


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
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: index unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


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
-- Name: index index_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: index index_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: index index_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: index index_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.index
    ADD CONSTRAINT index_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

