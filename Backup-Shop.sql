--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-26 01:33:58

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
-- TOC entry 223 (class 1259 OID 16661)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    customer_id integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16660)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 222
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 224 (class 1259 OID 16673)
-- Name: cart_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_product (
    cart_id integer,
    product_id integer
);


ALTER TABLE public.cart_product OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16527)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    name character varying(100),
    phone character varying(30),
    email character varying(100)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16526)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 214
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- TOC entry 221 (class 1259 OID 16657)
-- Name: dept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept (
    deptno integer,
    dname character varying(14),
    loc character varying(13)
);


ALTER TABLE public.dept OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16654)
-- Name: emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emp (
    empno integer NOT NULL,
    ename character varying(10),
    job character varying(9),
    mgr integer,
    hiredate date,
    sal integer,
    comm integer,
    deptno integer
);


ALTER TABLE public.emp OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16535)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(200),
    description character varying(200),
    price integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16534)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 216
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 219 (class 1259 OID 16542)
-- Name: product_photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_photo (
    id integer NOT NULL,
    url character varying(200),
    product_d integer
);


ALTER TABLE public.product_photo OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16541)
-- Name: product_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_photo_id_seq OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_photo_id_seq OWNED BY public.product_photo.id;


--
-- TOC entry 3206 (class 2604 OID 16664)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 16530)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 16538)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 16545)
-- Name: product_photo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_photo ALTER COLUMN id SET DEFAULT nextval('public.product_photo_id_seq'::regclass);


--
-- TOC entry 3371 (class 0 OID 16661)
-- Dependencies: 223
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart (id, customer_id, created_at) VALUES (1, 1, '2023-03-26 00:59:12.934108');


--
-- TOC entry 3372 (class 0 OID 16673)
-- Dependencies: 224
-- Data for Name: cart_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart_product (cart_id, product_id) VALUES (1, 1);
INSERT INTO public.cart_product (cart_id, product_id) VALUES (1, 2);


--
-- TOC entry 3363 (class 0 OID 16527)
-- Dependencies: 215
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer (id, name, phone, email) VALUES (1, 'Василий', '916', 'vas@gmail.com');
INSERT INTO public.customer (id, name, phone, email) VALUES (2, 'Георгий', '926', 'georg@gmail.com');
INSERT INTO public.customer (id, name, phone, email) VALUES (3, 'Алексей', '977', 'alex@gmail.com');


--
-- TOC entry 3369 (class 0 OID 16657)
-- Dependencies: 221
-- Data for Name: dept; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dept (deptno, dname, loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO public.dept (deptno, dname, loc) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO public.dept (deptno, dname, loc) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO public.dept (deptno, dname, loc) VALUES (40, 'OPERATIONS', 'BOSTON');


--
-- TOC entry 3368 (class 0 OID 16654)
-- Dependencies: 220
-- Data for Name: emp; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO public.emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);


--
-- TOC entry 3365 (class 0 OID 16535)
-- Dependencies: 217
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, name, description, price) VALUES (1, 'IPhone', 'Дорогой телефон', 105000);
INSERT INTO public.product (id, name, description, price) VALUES (2, 'Watch', 'Часы', 30000);
INSERT INTO public.product (id, name, description, price) VALUES (3, 'TV LG', 'Телевизор LG', 120000);


--
-- TOC entry 3367 (class 0 OID 16542)
-- Dependencies: 219
-- Data for Name: product_photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_photo (id, url, product_d) VALUES (1, 'iphone_photo', 1);
INSERT INTO public.product_photo (id, url, product_d) VALUES (2, 'watch_photo', 2);
INSERT INTO public.product_photo (id, url, product_d) VALUES (5, 'tv_photo', 3);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 222
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 214
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 3, true);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 216
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 3, true);


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_photo_id_seq', 5, true);


--
-- TOC entry 3215 (class 2606 OID 16667)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 16532)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 16547)
-- Name: product_photo product_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_photo
    ADD CONSTRAINT product_photo_pkey PRIMARY KEY (id);


--
-- TOC entry 3211 (class 2606 OID 16540)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 16668)
-- Name: cart cart_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.product(id);


--
-- TOC entry 3218 (class 2606 OID 16676)
-- Name: cart_product cart_product_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT cart_product_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- TOC entry 3219 (class 2606 OID 16681)
-- Name: cart_product cart_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_product
    ADD CONSTRAINT cart_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3216 (class 2606 OID 16548)
-- Name: product_photo product_photo_product_d_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_photo
    ADD CONSTRAINT product_photo_product_d_fkey FOREIGN KEY (product_d) REFERENCES public.product(id);


-- Completed on 2023-03-26 01:33:59

--
-- PostgreSQL database dump complete
--

