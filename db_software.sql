--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: bloco; Type: TABLE; Schema: public; Owner: cli
--

CREATE TABLE public.bloco (
    cod_bloco integer NOT NULL,
    sigla character varying(20)
);


ALTER TABLE public.bloco OWNER TO cli;

--
-- Name: bloco_cod_bloco_seq; Type: SEQUENCE; Schema: public; Owner: cli
--

CREATE SEQUENCE public.bloco_cod_bloco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bloco_cod_bloco_seq OWNER TO cli;

--
-- Name: bloco_cod_bloco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cli
--

ALTER SEQUENCE public.bloco_cod_bloco_seq OWNED BY public.bloco.cod_bloco;


--
-- Name: programas; Type: TABLE; Schema: public; Owner: cli
--

CREATE TABLE public.programas (
    cod_prog integer NOT NULL,
    nome character varying(100),
    versao character varying(10)
);


ALTER TABLE public.programas OWNER TO cli;

--
-- Name: programas_cod_prog_seq; Type: SEQUENCE; Schema: public; Owner: cli
--

CREATE SEQUENCE public.programas_cod_prog_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programas_cod_prog_seq OWNER TO cli;

--
-- Name: programas_cod_prog_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cli
--

ALTER SEQUENCE public.programas_cod_prog_seq OWNED BY public.programas.cod_prog;


--
-- Name: relaciona; Type: TABLE; Schema: public; Owner: cli
--

CREATE TABLE public.relaciona (
    cod_rel integer NOT NULL,
    cod_bloco integer NOT NULL,
    sala integer NOT NULL,
    cod_prog integer NOT NULL
);


ALTER TABLE public.relaciona OWNER TO cli;

--
-- Name: relaciona_cod_rel_seq; Type: SEQUENCE; Schema: public; Owner: cli
--

CREATE SEQUENCE public.relaciona_cod_rel_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relaciona_cod_rel_seq OWNER TO cli;

--
-- Name: relaciona_cod_rel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cli
--

ALTER SEQUENCE public.relaciona_cod_rel_seq OWNED BY public.relaciona.cod_rel;


--
-- Name: salas; Type: TABLE; Schema: public; Owner: cli
--

CREATE TABLE public.salas (
    sala integer NOT NULL,
    cod_bloco integer NOT NULL
);


ALTER TABLE public.salas OWNER TO cli;

--
-- Name: bloco cod_bloco; Type: DEFAULT; Schema: public; Owner: cli
--

ALTER TABLE ONLY public.bloco ALTER COLUMN cod_bloco SET DEFAULT nextval('public.bloco_cod_bloco_seq'::regclass);


--
-- Name: programas cod_prog; Type: DEFAULT; Schema: public; Owner: cli
--

ALTER TABLE ONLY public.programas ALTER COLUMN cod_prog SET DEFAULT nextval('public.programas_cod_prog_seq'::regclass);


--
-- Name: relaciona cod_rel; Type: DEFAULT; Schema: public; Owner: cli
--

ALTER TABLE ONLY public.relaciona ALTER COLUMN cod_rel SET DEFAULT nextval('public.relaciona_cod_rel_seq'::regclass);


--
-- Data for Name: bloco; Type: TABLE DATA; Schema: public; Owner: cli
--

COPY public.bloco (cod_bloco, sigla) FROM stdin;
1	A
2	G
\.


--
-- Data for Name: programas; Type: TABLE DATA; Schema: public; Owner: cli
--

COPY public.programas (cod_prog, nome, versao) FROM stdin;
1	Python	3.11
\.


--
-- Data for Name: relaciona; Type: TABLE DATA; Schema: public; Owner: cli
--

COPY public.relaciona (cod_rel, cod_bloco, sala, cod_prog) FROM stdin;
3	1	17	1
5	1	33	1
6	2	27	1
\.


--
-- Data for Name: salas; Type: TABLE DATA; Schema: public; Owner: cli
--

COPY public.salas (sala, cod_bloco) FROM stdin;
16	1
17	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
33	1
36	1
10	2
18	2
27	2
\.


--
-- Name: bloco_cod_bloco_seq; Type: SEQUENCE SET; Schema: public; Owner: cli
--

SELECT pg_catalog.setval('public.bloco_cod_bloco_seq', 2, true);


--
-- Name: programas_cod_prog_seq; Type: SEQUENCE SET; Schema: public; Owner: cli
--

SELECT pg_catalog.setval('public.programas_cod_prog_seq', 1, true);


--
-- Name: relaciona_cod_rel_seq; Type: SEQUENCE SET; Schema: public; Owner: cli
--

SELECT pg_catalog.setval('public.relaciona_cod_rel_seq', 6, true);


--
-- Name: bloco bloco_pkey; Type: CONSTRAINT; Schema: public; Owner: cli
--

ALTER TABLE ONLY public.bloco
    ADD CONSTRAINT bloco_pkey PRIMARY KEY (cod_bloco);


--
-- Name: programas programas_pkey; Type: CONSTRAINT; Schema: public; Owner: cli
--

ALTER TABLE ONLY public.programas
    ADD CONSTRAINT programas_pkey PRIMARY KEY (cod_prog);


--
-- Name: relaciona relaciona_pkey; Type: CONSTRAINT; Schema: public; Owner: cli
--

ALTER TABLE ONLY public.relaciona
    ADD CONSTRAINT relaciona_pkey PRIMARY KEY (cod_bloco, sala, cod_prog);


--
-- Name: salas salas_pkey; Type: CONSTRAINT; Schema: public; Owner: cli
--

ALTER TABLE ONLY public.salas
    ADD CONSTRAINT salas_pkey PRIMARY KEY (sala, cod_bloco);


--
-- Name: salas fk_bloco; Type: FK CONSTRAINT; Schema: public; Owner: cli
--

ALTER TABLE ONLY public.salas
    ADD CONSTRAINT fk_bloco FOREIGN KEY (cod_bloco) REFERENCES public.bloco(cod_bloco);


--
-- PostgreSQL database dump complete
--

