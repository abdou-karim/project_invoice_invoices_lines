--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO admin;

--
-- Name: invoice; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.invoice (
    id integer NOT NULL,
    invoice_date date NOT NULL,
    invoice_number integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.invoice OWNER TO admin;

--
-- Name: invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_id_seq OWNER TO admin;

--
-- Name: invoice_lines; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.invoice_lines (
    id integer NOT NULL,
    invoice_id_id integer NOT NULL,
    description text NOT NULL,
    quantity double precision NOT NULL,
    vat_amount double precision NOT NULL,
    total_with_vat double precision NOT NULL
);


ALTER TABLE public.invoice_lines OWNER TO admin;

--
-- Name: invoice_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.invoice_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_lines_id_seq OWNER TO admin;

--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20220415091934	2022-04-15 13:05:01	52
\.


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.invoice (id, invoice_date, invoice_number, customer_id) FROM stdin;
1	2022-04-15	2060	4
2	2022-04-15	5196	10
3	2022-04-15	9636	4
4	2022-04-15	7152	7
5	2022-04-15	4785	9
\.


--
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.invoice_lines (id, invoice_id_id, description, quantity, vat_amount, total_with_vat) FROM stdin;
1	1	ssssssssss	1234	54332	123456
2	2	sidibe	1234	3333	33333
3	3	sidibe	1234	3333	33333
4	4	moc	22	22	22
5	5	ki	44	44	44
6	5	fr	55	55	55
\.


--
-- Name: invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.invoice_id_seq', 5, true);


--
-- Name: invoice_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.invoice_lines_id_seq', 6, true);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: invoice_lines invoice_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.invoice_lines
    ADD CONSTRAINT invoice_lines_pkey PRIMARY KEY (id);


--
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- Name: idx_72dbdc23429ecee2; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX idx_72dbdc23429ecee2 ON public.invoice_lines USING btree (invoice_id_id);


--
-- Name: invoice_lines fk_72dbdc23429ecee2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.invoice_lines
    ADD CONSTRAINT fk_72dbdc23429ecee2 FOREIGN KEY (invoice_id_id) REFERENCES public.invoice(id);


--
-- PostgreSQL database dump complete
--

