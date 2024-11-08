--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE salon;
--
-- Name: salon; Type: DATABASE; Schema: -; Owner: marct
--

CREATE DATABASE salon WITH TEMPLATE = template0 ENCODING = 'WIN1252' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE salon OWNER TO marct;

\connect salon

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: marct
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    customer_id integer NOT NULL,
    service_id integer NOT NULL,
    "time" character varying(10)
);


ALTER TABLE public.appointments OWNER TO marct;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: marct
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_appointment_id_seq OWNER TO marct;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marct
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: appointments_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: marct
--

CREATE SEQUENCE public.appointments_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_customer_id_seq OWNER TO marct;

--
-- Name: appointments_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marct
--

ALTER SEQUENCE public.appointments_customer_id_seq OWNED BY public.appointments.customer_id;


--
-- Name: appointments_service_id_seq; Type: SEQUENCE; Schema: public; Owner: marct
--

CREATE SEQUENCE public.appointments_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_service_id_seq OWNER TO marct;

--
-- Name: appointments_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marct
--

ALTER SEQUENCE public.appointments_service_id_seq OWNED BY public.appointments.service_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: marct
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    phone character varying(12) NOT NULL,
    name character varying(45)
);


ALTER TABLE public.customers OWNER TO marct;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: marct
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO marct;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marct
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: marct
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying(45)
);


ALTER TABLE public.services OWNER TO marct;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: marct
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_service_id_seq OWNER TO marct;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marct
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: appointments customer_id; Type: DEFAULT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.appointments ALTER COLUMN customer_id SET DEFAULT nextval('public.appointments_customer_id_seq'::regclass);


--
-- Name: appointments service_id; Type: DEFAULT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.appointments ALTER COLUMN service_id SET DEFAULT nextval('public.appointments_service_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: marct
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: marct
--



--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: marct
--

INSERT INTO public.services VALUES (1, 'cut');
INSERT INTO public.services VALUES (2, 'color');
INSERT INTO public.services VALUES (3, 'perm');
INSERT INTO public.services VALUES (4, 'style');
INSERT INTO public.services VALUES (5, 'trim');


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marct
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 1, false);


--
-- Name: appointments_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marct
--

SELECT pg_catalog.setval('public.appointments_customer_id_seq', 1, false);


--
-- Name: appointments_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marct
--

SELECT pg_catalog.setval('public.appointments_service_id_seq', 1, false);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marct
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marct
--

SELECT pg_catalog.setval('public.services_service_id_seq', 5, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: appointments appointments_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: appointments appointments_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marct
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- PostgreSQL database dump complete
--

