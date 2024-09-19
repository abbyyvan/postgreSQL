--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Homebrew)
-- Dumped by pg_dump version 14.13 (Homebrew)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: jingyuan
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size numeric(10,2) NOT NULL,
    description text,
    is_active boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO jingyuan;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: jingyuan
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO jingyuan;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jingyuan
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: jingyuan
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    radius integer NOT NULL,
    surface_gravity numeric(5,2) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO jingyuan;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: jingyuan
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO jingyuan;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jingyuan
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: jingyuan
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter integer NOT NULL,
    distance_from_star numeric(10,2) NOT NULL,
    is_habitable boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO jingyuan;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: jingyuan
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO jingyuan;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jingyuan
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: jingyuan
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mass bigint NOT NULL,
    age bigint NOT NULL,
    is_active boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO jingyuan;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: jingyuan
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO jingyuan;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jingyuan
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: jingyuan
--

COPY public.galaxy (galaxy_id, name, size, description, is_active) FROM stdin;
1	Milky Way	100000.00	Spiral galaxy	t
2	Andromeda	220000.00	Largest galaxy in the local group	t
3	Triangulum	60000.00	Small spiral galaxy	t
4	Whirlpool	76000.00	Classic spiral galaxy	t
5	Sombrero	49000.00	Unusual shape resembling a hat	f
6	Cartwheel	150000.00	Ring-shaped galaxy	t
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: jingyuan
--

COPY public.moon (moon_id, name, radius, surface_gravity, planet_id) FROM stdin;
1	Moon	1737	1.62	1
2	Phobos	11	0.01	2
3	Deimos	6	0.00	2
4	Europa	1560	1.31	4
5	Ganymede	2634	1.43	4
6	Callisto	2410	1.24	4
7	Io	1821	1.80	4
8	Titan	2574	1.35	2
9	Enceladus	252	0.11	2
10	Triton	1353	0.78	2
11	Charon	606	0.06	5
12	Oberon	761	0.07	5
13	Titania	789	0.07	6
14	Umbriel	584	0.06	6
15	Ariel	578	0.06	6
16	Dione	1123	0.23	2
17	Tethys	1066	0.15	2
18	Rhea	1528	0.26	2
19	Mimas	396	0.08	2
20	Hyperion	270	0.05	2
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: jingyuan
--

COPY public.planet (planet_id, name, diameter, distance_from_star, is_habitable, star_id) FROM stdin;
1	Earth	12742	149.60	t	1
2	Mars	6779	227.94	f	1
3	Venus	12104	108.21	f	1
4	Mercury	4879	57.91	f	1
5	Proxima b	12000	7.50	t	5
6	Proxima c	15000	10.60	f	5
7	Alpha Centauri Bb	14000	12.00	f	2
8	Sirius A b	13000	15.00	t	4
9	Sirius B b	9000	18.00	f	4
10	Rigel b	20000	20.00	f	6
11	Betelgeuse b	18000	25.00	f	3
12	Betelgeuse c	16000	30.00	f	3
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: jingyuan
--

COPY public.star (star_id, name, mass, age, is_active, galaxy_id) FROM stdin;
1	Sun	1989000	4500000000	t	1
2	Alpha Centauri	2100000	5200000000	t	1
3	Betelgeuse	1200000	800000000	f	2
4	Sirius	2400000	250000000	t	2
5	Proxima Centauri	1020000	4300000000	t	1
6	Rigel	3000000	1000000000	f	3
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jingyuan
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jingyuan
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jingyuan
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jingyuan
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jingyuan
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

