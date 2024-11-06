--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2024-11-06 08:25:53

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

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16398)
-- Name: event_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    display_order integer NOT NULL
);


ALTER TABLE public.event_categories OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16403)
-- Name: event_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_categories_id_seq OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 217
-- Name: event_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_categories_id_seq OWNED BY public.event_categories.id;


--
-- TOC entry 218 (class 1259 OID 16404)
-- Name: event_enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_enrollments (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_user integer NOT NULL,
    description character varying NOT NULL,
    registration_date_time timestamp without time zone NOT NULL,
    attended boolean NOT NULL,
    observations character varying NOT NULL,
    rating integer NOT NULL
);


ALTER TABLE public.event_enrollments OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16409)
-- Name: event_enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_enrollments_id_seq OWNER TO postgres;

--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 219
-- Name: event_enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_enrollments_id_seq OWNED BY public.event_enrollments.id;


--
-- TOC entry 220 (class 1259 OID 16410)
-- Name: event_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_locations (
    id integer NOT NULL,
    id_location integer NOT NULL,
    name character varying NOT NULL,
    full_address character varying NOT NULL,
    max_capacity character varying NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    id_creator_user integer NOT NULL
);


ALTER TABLE public.event_locations OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16415)
-- Name: event_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_locations_id_seq OWNER TO postgres;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 221
-- Name: event_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_locations_id_seq OWNED BY public.event_locations.id;


--
-- TOC entry 222 (class 1259 OID 16416)
-- Name: event_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_tags (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_tag integer NOT NULL
);


ALTER TABLE public.event_tags OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16419)
-- Name: event_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_tags_id_seq OWNER TO postgres;

--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 223
-- Name: event_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_tags_id_seq OWNED BY public.event_tags.id;


--
-- TOC entry 224 (class 1259 OID 16420)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    id_event_category integer,
    id_event_location integer,
    start_date timestamp without time zone NOT NULL,
    duration_in_minutes integer NOT NULL,
    price numeric NOT NULL,
    enabled_for_enrollment boolean NOT NULL,
    max_assistance integer NOT NULL,
    id_creator_user integer NOT NULL,
    imagen character varying(5000000)[]
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16425)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 225
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 226 (class 1259 OID 16426)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying NOT NULL,
    id_province integer NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16431)
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO postgres;

--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 227
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- TOC entry 228 (class 1259 OID 16432)
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying NOT NULL,
    full_name character varying NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    display_order integer NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16437)
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.provinces_id_seq OWNER TO postgres;

--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 229
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;


--
-- TOC entry 230 (class 1259 OID 16438)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16443)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_id_seq OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 231
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 232 (class 1259 OID 16444)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16449)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 233
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4675 (class 2604 OID 16450)
-- Name: event_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_categories ALTER COLUMN id SET DEFAULT nextval('public.event_categories_id_seq'::regclass);


--
-- TOC entry 4676 (class 2604 OID 16451)
-- Name: event_enrollments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments ALTER COLUMN id SET DEFAULT nextval('public.event_enrollments_id_seq'::regclass);


--
-- TOC entry 4677 (class 2604 OID 16452)
-- Name: event_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations ALTER COLUMN id SET DEFAULT nextval('public.event_locations_id_seq'::regclass);


--
-- TOC entry 4678 (class 2604 OID 16453)
-- Name: event_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags ALTER COLUMN id SET DEFAULT nextval('public.event_tags_id_seq'::regclass);


--
-- TOC entry 4679 (class 2604 OID 16454)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 4680 (class 2604 OID 16455)
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- TOC entry 4681 (class 2604 OID 16456)
-- Name: provinces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);


--
-- TOC entry 4682 (class 2604 OID 16457)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 4683 (class 2604 OID 16458)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4854 (class 0 OID 16398)
-- Dependencies: 216
-- Data for Name: event_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_categories (id, name, display_order) VALUES (1, 'Music', 1);
INSERT INTO public.event_categories (id, name, display_order) VALUES (2, 'Art', 2);
INSERT INTO public.event_categories (id, name, display_order) VALUES (3, 'Technology', 3);


--
-- TOC entry 4856 (class 0 OID 16404)
-- Dependencies: 218
-- Data for Name: event_enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_enrollments (id, id_event, id_user, description, registration_date_time, attended, observations, rating) VALUES (1, 1, 1, 'Registered for concert', '2024-05-01 10:00:00', false, '', 0);
INSERT INTO public.event_enrollments (id, id_event, id_user, description, registration_date_time, attended, observations, rating) VALUES (2, 2, 2, 'Registered for exhibition', '2024-05-02 11:00:00', false, '', 0);
INSERT INTO public.event_enrollments (id, id_event, id_user, description, registration_date_time, attended, observations, rating) VALUES (3, 3, 3, 'Registered for tech talk', '2024-05-03 12:00:00', false, '', 0);


--
-- TOC entry 4858 (class 0 OID 16410)
-- Dependencies: 220
-- Data for Name: event_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) VALUES (3, 3, 'Open Space', '789 Oak St', '200', 37.7749, -122.4194, 3);
INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) VALUES (4, 2, 'Office', '123 Elm St', '100', 40.7128, -74.006, 1);
INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) VALUES (5, 2, 'Office', '123 Elm St', '100', 40.7128, -74.006, 1);
INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) VALUES (6, 2, 'Office', '123 Elm St', '100', 40.7128, -74.006, 2);
INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) VALUES (7, 2, 'Office', '123 Elm St', '100', 40.7128, -74.006, 2);
INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) VALUES (8, 2, 'Office', '123 Elm St', '100', 40.7128, -74.006, 2);
INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) VALUES (9, 2, 'Office', '123 Elm St', '100', 40.7128, -74.006, 2);


--
-- TOC entry 4860 (class 0 OID 16416)
-- Dependencies: 222
-- Data for Name: event_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_tags (id, id_event, id_tag) VALUES (1, 1, 1);
INSERT INTO public.event_tags (id, id_event, id_tag) VALUES (2, 2, 2);
INSERT INTO public.event_tags (id, id_event, id_tag) VALUES (3, 3, 3);


--
-- TOC entry 4862 (class 0 OID 16420)
-- Dependencies: 224
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user, imagen) VALUES (1, 'Concert', 'Live music event', 1, NULL, '2024-06-01 18:00:00', 120, 50.00, true, 100, 1, '{data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMVFhUXGBcZFhcYGBgfGBcdGBoXFx0bGBgYHSggGB0lHRcaITEhJSkrLjAuGh8zODMsNygtLisBCgoKDg0OGxAQGy0lICUwLTUtLS0vLy0tLS0tLi8vLS8tLS0tLS0tLS0tLS0tLS0tLS0tLS8tLS0tLS0tLS0tLf/AABEIAKgBKwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAEAAIDBQYBBwj/xABDEAACAQMDAQUGBAMHAgQHAAABAhEAAyEEEjFBBSJRYXEGEzKBkaFCscHRI1LwFGJygpLh8QcVM7LS4hYkY3OTosL/xAAaAQACAwEBAAAAAAAAAAAAAAACAwABBAUG/8QAMREAAgIBAwIDBAsBAQAAAAAAAAECEQMSITEEQRNRYSKBkaEFFDJCcbHB0eHw8TMj/9oADAMBAAIRAxEAPwDxEU8HxpbZyPvXCDREHK4pFajpA1CHStcpwepDB/2qUQhFPNIJV+up0X9iKm2/9r3yHn+GV8CvOPEdapuiFAy1yubjXRmqIdDRkVIzBh4GowPr4ftTSxqFnDSp4z60wiroofbI858iP2orUjcoYGT14x48UIi1Np3gxPNWQHpA0+8m0x9KZVECNIsk1HdHeNSaMtPdEmKjcmTIzJqixu3zovUDAUATA6gfnUeit7niPEn5D94qW+oZjg4x8QH2IqFXvQM9p4yDH9dRUVObb0kesH9BSAqEHIOtdu3N3lFNZprkVCzlcinhfKfKn3Le3nnwHT1NQoiApRXd1dNwkAeE/OfGrIMpRTgldJqUQbFdmmzSioQ7urldilUIciu7aW6uRU2IdnzpZrlKrIO313HpTZpVEQelokwMzimFYq47B7VNgi4otkoQYaDuk/yn4o8OnNB9o6oXGZ4yxkj8I9B0o6jpu9xalPXTW3mC23yJmOscx5VZ6vQhhvsW77W4yXUTPls5FVgI9Kms6u4mEuMB4AkfalNPsNTXcha3TCKeXM5knzoixeQqysgLErDy0rEyAAYM+YPGIqMgy3cEQwkdD+IZ6H95qJlrT2fZO81lrqDcFCkkcJuP4icTGfmKzmpBBgxjGAP05qRafBGQgUQlvdjr086hu3Sxk+mKk0zZGYokDJ0tiR9IQgbxJHHh50OcVv8AXdq6R9GtpEHvgxPvow0qsjYfhzif7s9axtnSKwZrl1UgwBBLMT1gcKPGjkl2E4sjlal2OKu62bmDswR1IPX5frUfvhtJCp4Zjd6jFTDRn3r27Le8WSA3whh4wSCPSpdd7Oai0SHVRBj/AMS368Fpggg8daW9mPTtWC6G7DYUkxwPl5VE7SScgyegxU2m09xTuAGMYZSfHgGadpezbtw90KSehuWxP1YUNoLsOs6N/dNfV1Cg7DOGJwYAzPIoEjzB+tX9rsTUqyW7yvZtGCTJgBs7gu7vfKhLmksC66G44SSEuBJnPLLz44GaOtrF6lq0lYLWPtTnEYrRantyydHbsLYVbqsxa9jcZAEERH/A86zRegi2+wbFU1i1uIExPU0OWqZNUwIzkceVWyI0nbvstd0aWrtyFFxNy96S04kRxiD86zO2TAFaHR3Lmqe1auXSBAWXPcGZlj05ORU/tX2YNDfBs3BIYlClwOyxENuUACZwOcGelLi3w+QpJcrgywt+dKegzXHJYkmc5JNNgU1AE97SXFALCAfMT9KhC/KlNcioiB9zUWvdoqptdd29wSd88Y6R5c0NevzgCPP9PSoQfKpNTe3MWCqgJnas7V8hJJj1NW5NlKKRHFcpRSqqLFNKlXalEDz2UejofqPzFNPZl0cKG/wkGj1NSqKjZaRSXNHcHNth8jUJHyrT25HBIpzBjzn1AP50OuglAy1ICtG2lQ821+Qj/wAsVE3Zto9GX0b/ANQNTWitJQzSq5bsUdLh+a/qD+lDv2Q/Qq3oT+RFEnqdIqS0q2BqBMFsen70/YozIP8AXhUlzsy6ObbfLP5UI6lTBBHriicWuQYzjLh2avTe1t9dK2nUgWpkIAAPMnEt86zWpvbjMVCDU9rWFVK7UIMySoJz4E5HyoEkghtwLJ2SV6bvi+cGK5aOePt+1M2/1NdmOQDz1P1welEmU9yz1vuVaLVx2TaMssHdEkRPE4mgbigqDuEmcZkR44gz5TUG3/jr/X71yaJu2BGGlUE6TUvbJ2uyzhtrbdw8Cf3rQe1+stai1pbm4f2hbfu73eVgwU9xpXrHMgdPCs9p8tnaBPyifPJrT9v3NE1qwunBV/dgXC0wTuOVg4+fSKVJ7jEUvZtu3sPdD3i0Kst8O0kmNkcxncOOKA0yruXdlZG70kT9qn7Ost74LwQSDIwIBBkU7sgqG3uQFEAyJmfL0BoeGw3ukXntn7Qm/fuNaci24UbcxtChQAGQFeCYBPJrMEAAGZJ5xxk8Gc4g9Oa0/tlqtLccNprZtptUFTElgi5mTjy9ayhNFHgBj0bInInIHUUVr9TacJ7u1shYbvE7jPxZ49KBIqQ2yMgGPGMeFGnQLjbsaBUlvPdCyZmRO6AOImI68T501yW7zEngSZ6CAJ9B9qbP9f71QQS6OkE4njIPEHgHFRtek5zPPzqKakt6R24U+vA+pxVFCNwdB9aYjxPdBkRmcZBkQecfc1Z6HsC5czKKBzmT9v3qys+zVvG+6TPgI/emxwykrSM+Tq8WN03uZg1wVftobasRtBg/in8pqRFj4YHoAPypfBoW6so7ekc5CN9KmHZrnkqPU5+gmrdgTyabtqrLorx2aPxP/pX96euktjox9TH2Ao1rZ56Uho3kDY0mCMHM8H0q0ymgRdo4RB8pP3Nd9+fEf6V/aih2ddIYi20Dnun8uvyoe7pnBgoQfAgz+VMFtlpYsWjbyYafEyO8nA4I27zPiB8yv7DYPF+PUT8iB1HjwZxwarRU+nsM5CqCSeAOvWkuQ5RLPRdmI5I96BmAMScA/wA0HqJmMTNE/wDbbcGLyk5jgTEzyefDyoPS6FyPh6EiesQPrJGPOjV7MuTG3gA8r1+fkfpSpP0GpeoPf7HAAi9bJJAgEdSB+ufSmDsc7iodCZWIODMjn5fcUW3ZrwGiAes8YnIHlT07Gu+A+oob9CV6kF7sG4oJhTE/iEwOonpQ/ZekDO0zAHT5VO1nnyp/Zt0W2JKzIjnzFO6Wa8aIjrscn0065oe+gPQ/WqbX2m3EZOMjnp4VpxckcRP94flzVJ2iSHJBIwPXiun9IOsa/H9zhfQzlLM1Ly/VGeuWFJgov0g/aKHu6FPAj0P7g1pLF29yLyif5mWY+Y8+Kl1T3AN5uWW4xFsn/Ttrl6j0OkzK9gsUDqwySII4jrIn+jQ97sq8sMQGHQg+AnyPA+1b72fDBQqhQ53hCcAEy08RRfa3Y7Mm43LO4bi8MMwpEicsT1wMzzW2EISivwXxObl6jJCTS3pv4HlmqDBiGMkY/wBs+tN390ZJz8JHdjxBmZmje17f8do6x+UVYf8AagFG4TuAZTjghsT1ErWeKuNm6TSlRnxU4Rm4BMeE/erLsTsr3weSQVKR4Z3TOD4D71zs66tssHRbgmNpzwt0SB6kVU01G0VjlGU3C+OQa32bqJ3i2xPjP3majudnXl5Qj5j8po2zrVJIIsoMnvWUImQdvdQt0jiptF2lb98PepZ93jdFlIiSeiyOenQUq8i7IelB9ym1CMDnHl4U61pHIkISPHEfnVzp9Wlwmzsswwxc2N7w/iwQYB5ExwKludh7bTvB2K4UHPUc/CTzWnFByjZkyZYwnoM9dsleVI9aI0+ja4JXksFA8yPH9hVl2j2WRp1uhYXdt+e379fDiifZfGzE7bxaDPRVPTPSqnHTJLzr5hKacJSXa/kCL7M3QNzhwsxOxgJ9T/WK4/ZGwxsLHzknp0WtdrfaN7rXEuLaQZHwndPPLHBknPNVnaYI2kEiRkj1+9HKDWLVJU7+QjHm151GL2r5gFjs29ErZZR47dv3xRNjsy4edogwZdeeI5qMLaMTcunHVR59S1Pa3bkbCx8dwA9OCazSZuiiy0LbbTbeSRnwwaFXU3QY3zPjRumHcPqP1qB7UmBBPy58OfvW3pZPw1uYOr6fHqbrd9/cBQPeH3snJ3RyT9fHzqUPYAH8NyevexPyqG5bzTrKrneCcGIPXoT5Vjk92bIxqKJ7eqtACLILCOTjj96fa7SAJIs25PUiekGMdZz/AMR3dp8jY45g+sZ+Lp4edK21ifgeIYczz8J56D/ipZKGHtRwGUKoDGTg+EeOfnzmcYoax2jctxtMQCBgYmB9YAFWCtp4Mo/JjieTEn0gR4jzpt5tLB7rDIiAZiIM9456jpMT1q0VJehV3+17xAXfABBACqAIgjp0gfSg37Qukzvb5YH0GKVwVEUFHYFFgBU+ncqdykgic+oj8qjUVLbFZpM1JBVi88L3mxxk464+YoxLrnlm8fiP70HY9B/Xzq609heRuP8AlUD6ms8pMdFFddnAz+1RKp86ubqIOg+bn/8Amqu6BuMcfP8AXNCmE0S2xTFaGJHT0/WpbRqftUorj3YiVhpDc+c9fGMU/pX/AOqYrqEnja8yCz2hk7usbfIGhu0LXePoKA1V1FbvMBx1Ap2t7ZtASN7Y6IYMeZgV0OrySyY9Pkzn9L0uLDm1ra1+wOqDdBMedS6u0BBBn6foaqB2vucBFgsQAWzz/dA/Wudr9rX3yzjzgDnyGY4rDofB0FJU32Nnq9almyBtFwlQDmAA4G6I/FBK+UnqMUt3ty2ICsURVVQpeTySxIEAkkknHy6Vk72odx3nZvUk/aktnubvlHUZ6iteOfhpbWY82JZm+3mT9pXT72R1Cn7Ur3aN9lBLttQBBnAHegY+dRuhuNuWM4EkfhUGnvp3VAkSbkNAyw27owPImlRbobJJyv4EVm7d/C7AHmGgY8c+dd02qKsGYbx1BMTmckZoh1CouFZpYuMzB2hZ6Dr6UNc05JAXMiYHSQWj1irTbRTxpMIFwXLoRbSbncAd5iDuIAE+GabevBGKm1bJUlTliJU8zOePvQ/unRlOQwYbfI8g/wBeFTa3RsHIJWcHwHeniegIgnpVLbYjjfbcFWZkY9DFFC7e2bd77T3tu5ox1iY4FcuaR0XcQI6ZBnoR/X7VaWdGt2wgDBXBO7yBaBHjO6pKemg4Ytd3yVB1VzbtLttBnaWO2eJiYq57I1D6cb3Uja4IkSO9bH1wyn5ihtZpFSwdzKbhbgRPdIU8Ejr9jQiHuXFHBKkA84OcfOrycLe+Aca3aquTYj2zDK29E7+6Ja4IB/xEg5oO9dDoNuYAGKzmuQe6sxyN4ceB3SPswzTO0wBsAIkAho6EEiMfpUhFeG0tiZPZypvfb81uaTR6fcpOxjAkkRgSFk/NgOKYgzWeGrYAbGYYzJmTJPB+VS2O2LgIwreo/aglFvgJSSN2dMyTbPxAjjzE/rUjaLvFSY2g72AwRAYCevWs/Z9oip33LZ8ZUg/ODEVZab2ussZLEf4gR98iteFaI09jPmepprcFvoQ7AiCCQR6VGRXVuq7FlZTJJwRUjrHOKxN7mnkYtgmSASBzjx9PSl7kj/g/tUlvcMgT8yPyIqb3j7S227tUwWDSoPmSCOvj1okgbV0BsPT61DcQ/wBH9qL1F/cMkkz1C+fUUHcWrIwRxURqe6tQ7aYhTRYqKntrQV7tC0uC8n+6CaHftxfwWyfNjA+1ZdEpcGnVFcl9ZUTzVigUZMkfQfUmsW3bGo/C6L47AJHqarNVq7jHv3Gb1J/Kr+ryXJPGXY9C1nbumS0qHZ7wFizckg8CF+X0qg1XtNanuoWPyUfvWUpE1awR7gvPJmhue0V38KovyLH74qp1HaF64YNxifAYH0FSbJMZjyoTu7xOFnMcxRQUVwi533FbB+LzH71dPpTsLMZ7p6AGIwJnH0qnuxBZSI3GFjvAZj5fOtyxSxZD3CWdlR1STkMduJBJg5gR8q3dNTUrexg6qTi4pK2zCaRe+m7jcpPpImrHti1L90jaI7vwniSDIEEcZpnZ2jLo6wN4WV3D8Od2Se7yIMRzT9RaN0rtU7wih7YGBsEbgeIIgkeJNYZNarOhBPTp8wAOgDQCSQRkCFypkZ5wR86da0piTMQDiYE/zHp6dZFXC2v7MltmWzcL7mAJ37hgAQI2jMzn9KXZegZna21wiAVMKWEfEdpB7pJH38zVPNavsRYKe/P9oE0WmJlkWVAE+GDBk4jxn86M1ep2gDYhKiA4AO4li+8N4SSATEzI8Bc9o9km3a3qA4FtRAx3ZgmMFjhobnOYqnfRb7iFy+wMlvdCglWaFI6tFsEzGCINKWRS3HODiqRFZ1oNshiZInjDZJbECMSuDnHUYD7S1MsAphRwBPJGTJz1Az4Vo9fo7Fm4ikbi1uXUTsQkO0IqyQpwcYifGh37HR7bXLe4mQqoxAbulCvdJmPdgkzwQACRVxyR58ypwk1VlFobKuLhZ9pRC6gKCGIBgGcDP59abZVdu58w4x3pKgEsJmADgeP6zIoHvVPPw+PwmMZ8qGNvAPI4M9CRyB8uaanbYl7JBOosqF7qnlzlxlTA24PxKYyOZ4xTAjISVIPdGccMBuXyfMFfAmu6SwWJQQGAbIIIOAY4Jk8COpo7U6HZaDnkNtcRgCF7wuHEziIERVOSWwSTasdua6G3bLY5JCgMFEGF24PAmYI4k8VW6jTlTBjOOPHnaYzBgetGaa26MrLxcTvgTIiZBjIBccDyqfT6G4Nu8Kyr3CkbjLgiWCHvREgzyAOtDq0h1qKFkaMTxJ54EV0gNMlVgDo2fpMVZDs+9aysFhukbQYgqIzKkkFTCz8QplvRMyNsUs4MuAp7uMAjnoTx40etVyKWJt1QJ/ZiAQCGIn4TOB1EciuaKzuuC2MliAoHUnpU1q2oZN0lIBuAnbtmRHXxGetS6fs5kYkzKsAuwyzDIJUjECRJ6SKOE0nuBPG2vZLDtvs42g30mTEDp4MJ6nNZ9LZOAV9SY/Pitl2zq7NzTXAB7u4onaxgtL3FhQ2TAUTHVqyDbVAImY68ZxiK0dQ4tpx4Zl6ZSpqapof2faViQTnkefPWiVuXUI23GjxBaD6bh+lM7EtguQY+EwD1iCftNWGutzuwJ2sTHl4ZmPr0isjlUqN0YXCwJO27gOdrecQfqKtNL7Wsts2u8qs24xBk4zJE9BWYakKOhCk07NYva1pxG9B5ldp+1SFZ4IPoR+XNZ3RBSrSoPgYzmB0mevTrXYE90AYwQxxnBbb1PH7UzwtrsHxOxcX0I5EetaLs97lq2EOjDkT3iUzJJ/WPlWJ0eoulwi3Mnicg4JzHHHHnVhZtalhKrbIyJERgkGMeIquOSp7jNGNItwh1mAR3iCCQfpJBH0oWw+53IcKOcwvOBEcHA4n0NVJozsh4ueoI5I8xBHHFXi+2iT+yywuIwUSVKcFjGGIn8WWaByMTjFV/aOlKbSTMiT5eA5yfTFbbSaQQAit3T8UiBnPGIkEYIPMg5kPtzQkWzuMoqZMCTx4KADI5HHzroT6e4swQ6pa0jEg0ga4asbPZm677lWLMyr7sgYZmAIBHTkiehrlyaXJ04xcuArR2SVU/zEKCZiTjJio+0ezzbui1cQKxIJMmQvUECfWirHZzLa/isoCXSHs53mAScqevHpB4qD3YLbtu0BQXYkmQWJVhgngAH0xzSIve09jZL7CTX97kV3sspf2MGCmWVkh8cgggwwGJNFHTYT+0s6k4RyDgAqAA7fgABwP1q1tdoWil8HYzNsZbkuxDgSqjfDFSx2kRGegmqrU3bupuIuwvcUlQE2Ko/F8UHcT3iSapTk+dl3+H95BcIrjfyB9SSk7bpZQ0CCTOCQ3OCASCMZojsvSi4QFRgoRi5BAZ15xJjDKfDAigrNjNwmLe1lUo3OSVMGOQRnHU1zSXhv74LoFghcTHByPuKY1adARdPcuLPZ6Mls2FXeO8xLQdsHfJbu908MBx4mYI7Jtpvt+7mMi6w+HMARI+ISZMcR41UX3Q7Usl42nelxguWkDYZyNrDkgkA+NT6ftm7plNnbbKkZKkgsGAhpBI3cGYmRSZRk1S3GxnFO2q9TQ6kWk0s2roZwsN/Dv7hsO3A37UG7yI5qgv3bQQKUbf8RysA8fHt3bSYlBmQc5xfexjE3TdvrcYOoG8iACMyx3d6ZI65rvbfZtlr5vG7tDASq7jJBxkxyOfOfWsyzrHleOV+d/psafBeTGpx+H6kHauqthNO5KHYNoe0SRMRBFxBP8AMMngzEg1T2r2nSbigwCQLe9w248HepnaVmf70DgyDX7HsO0rcZBmOpn58D0qZewtOoBN1z1IxtOZOOk49I60azYoqrfzAlhyN8IotLpy5bYrPuJYKoZmHPOJMTE+VQf2hcyiuwyS24mAYg+GPlWm7QeyqmCtv3sBeQwKEEOCRAXdg56HiJqq12ktMSbV1mLFmYMoBAMcsrEMfHpmtGOTlHW1SM2WovQmD9mdrrbbd7vfA5Y96SRALAfDAjbwc46Vb9n9tsihGdigJX3HuwQZLFUlhugkA88niKrtFo7akB5K7gxA6keMcjnH5VsdI/Zpf3rWu+SpyWiViDExOKzdTnhH7rf4b/maMGGb+8kYrVi4lwuFVVXcFdUC7h0kDqQOPM0X2ULqm3ctEJK+Bbecym0ZO6AT8KgeknX+0mt019CittLdV/L51gL1425tgubYcbiGYbwIG09AI/Sr6bM88N40/J+RM+JYZbO1+pZaVWu3PeBG2yEK2+bboAAQhPfQbgCMYNS9r6dFKhG2OVh2U91wkruPiWMYGAIHMir29pfdae3qNAwS3KtDEbhuBRgw3H3hk/CRiOkVSduu19mNoq2+ZKgrBTmNw7ygADAUA/Wig9UrXH95BlUY093z/hntPYZ1ZgPhk8gcQWOecA9eSI60+32k6C0FcdwkjaACJMmTHe5PMiKf2fadwLbEIIgORAVckgxzJEZ6xmuPpmtq7FZDAQdrCATGSeMjgE/nGq1dMzJNK0Q3Lty9ckguz4UnmBjE+AxniodvMQGwoXJPgY/rxojQK892BgtyAAPMkyBS01hSrOwMH4WQg7SQTtIJGSPPEcUVpA02T+zV9EuDfEsyICSQFDE7m3AYiAPnR/tZZZGO7JIBmeZODznA+9UEMe6vgAfCT/vUwslg6hpCCe80QAcwOJJ4AoXD29VhxyPw3CgKYrlSXThRjiZHOehpyJDL+LgwPP8AD69KajPRodFplS0rzuLGFEN8ImcKN0ExBxlh4VHc7NGWIVpOWBjnIO3mCQRG2e8PCtDpdKzWkO0sNm5hvJJ3Zxgngx0EjxoPtPRbUNwSYDbnLGeZ2g4JgkwTkQozzXSljVHMhmuXPczF3uswJEoIUgkzPEECOOh8TUFrtG6g2rcdQOACQB14FR6q+WO48n+v0qIvPNc+VNnSjsh+2TCgmeBGftXLT7SG8CDWs9kme3aN+1slCTdDwNyruYqjHltsmDiM8irLtns7s/WWjqLF+3p7v40uHartE8Hg/wB4CDmRM0nxqlwHotFho9QLVoXyruoIOEMKGK97bAmI6ljnmK57f66wNMtu0yXHuMJCtOxVIJZo4kkCD4nwisXc9o9QtgWBCqVKlgJLLJWFY4AxEjwoI3QCIiGUKSAcn9/Kujm6u1UO6/05eD6P9vXk7P8Az5kLaX4yGB2xgddxiBVvpjctKl67ANruKhAW4VaepE93p1HSKrruh90VFwhdwyIkj1A6+VGNrUa9cJDMGSJuGWXiYJmY4FcyT1cbo7MVp52Ze9l9r22b3Rti41wKEa4Syh/5nDHjMk8jMeFUvbiP/aG99d3CWBZRGVmAF8AcA5xTe0Qi3BcsSLXdI7pKboEgyR4ceVc0aW79m5veLqZtgkQwPIA5JmlRio+2r3+KGSm5ey/4YNfvNtXaycAQEVW+IxmOZbmcx1iitKbwfKCXIG4gDvAHO/C8A44pvZfaK2w++zbcODE7u75DxXrHjWn0/suF0zXtU/uVZpRVZAMBmDKzSADgCJOY6xRZJxjs/wDSscXLdP8AgoH0BUC8zt3i0mJBkYYR0KyJGVMdCKrntKGKjjcQGk8HiYHmDxWk9mNQbiM112W3bEFgVHKkAQcEyR4CCZ6Vc9o3NHpdIijTW7t9lJRywhuP4kA4WThZnHzoPGlF6at+gTxxlG1sYq7pURpSboOCCoGR15MjNFez3YD3rpUnbA/EkyDIxuET+9O7PubzZTbtbvgu07WnILE8EcdRnpWv7B1ZED6Ujq+oyY4NR5H9NghNpyLvsv2TRAASzHiZPpxx9qo+0NRpveMgtswUkbgRBjw8qs+2/axEW5Ytz73aBIGF3cmfEDIHpWZ7N09YOh6XLkvLnb347e8d1XVqD0Yq9Qm32fbY/C4/0/vR1vsOz/8AV+i/vR2itCri1ZFdP6vH1+Jh+szPOPbrs5EW06BhH8PPhLvJg8y1L2A09txeFxSx7sRHnPPqK13tr2er6RztkpDj5c/aah9lOzVtPeRQArJYuL4kMrA//tP1FaNEXi0CNcvE1DrnZlkDFlvmR+1VWu0aRAsR/m/9tba5aEVVa22INZlggnx82aPHn5mXu+zZNtbqHBE+nQg+hxQY3W1ZCsqwIYEcg+Na7svtq3p1ZLqMyEgqVA7s4aZIxxx4VYdu9iKRuUAg5EcGazZdUJU+OxpxTUltyeX6LTvJtLaRmuEKmWLbmZc94kZjkRitD2p7OW9Pu2M91zbcPcLBUtncg7jEQYJk4nNRvqBo7hubSWCsLZkQCw2zg7pAJExAmelZzRdo6hmZdybC0szgMuJON/OeB4x61tx6sitGXK4wdMZqyZubdp93bRWKmQ0MO9P4ieZ8jTdKw96N4F1YCkNKkgjDAn4TAwfTxo7t/TrItWjbuO5UMUPfaVQ5TaFUAiYUxU/amosi6TIR1tqvwyqndkkITLRjk/FnNM1bL1BXO/YBWxaa7CW7ty0qqXG6WaDxKrCiT18qbr9YHtW0+GyCSrBciTBXnkCcdcE1LpbAto2oDbkG7YkEESfxCTsBUkjOR4xBE06i+rSiILaTuG6WIHUkkBesADpVquey/Mj8u7JNCqKj3EucDvWrjQYJ/DHx90iOs0fb0dpkupZ3FnCHcCe8SUHuygwFLEmTJwOaotIwQiUDHcRkYnKjPgJmKs0X3dwDeXZAd+0woAA2gOMuZzMDmpKPqXCXocHZ72rAIa2FugNnLMwzsPQYzHNVZsNPvIYAgsp2ngdfIc54qx09q7qV22rDPcMB7nePJ3Ykws+AEnpQmuttaJUkgwJQk7lDAHIPGCMcjrFFF713Aktk+xoezfbHu2EKJaCOqu43FdgEGFGQfr08KuvbfVW/7LvtslxWEKQQRJIHQ8iMYxtrzq53/EsxkAdP64Aovs7Q28m7dUeKbs48R+grfDqZ6Wn3OVl6PGpqcdq99gem0Vy5JUSB1J+0mmMR/KPvVvqNWbp93a7ttfDkjjj9OlUhBNIqjVGTfJoey1uCy4S1uVgSNpkwQN1u5wdpABkcED0rvs3p90FHtK6sPdblBuMxAw3hb7p7w4J+VVGq7QmdgKS24wx56ccRQ7QIPWeuZ6/160mWPmn7xsZ7K0eq/wDerGpB0vaNpVuJw2FGTzbIyBHUYxmKz/bPsfd08vZPv7MhsAG4I4kD4h5j6Cs1p7wZdsZLElWYBR3eUc5VpEdRxVx2Z29e06r3jcsnMGQy+o6eokUpQcH7Pw7fwHqTKbVnrt3Znx8oPhEUy0UjaZgwc/haPQY/etlct6XXiVOy4c4gMY8Rw/50BpfZb3Tlr0MnAO0lY6l4kqfDp4mo5qMdwlu9is7M1dq37stZZ4Lky0qSZAO3jHBn1FV+73bYO24rngggejDB8DR/a12w1zZp0hEB3MDG8jkgNgYngecV3WWbK2o9xftsxmXAKyAfgeAT0PHSOsiotc09/P8A0KV8WtgbRof4l5WtDbmLhBaSN0oOZ3cEVMWN4oQzBmO0oskCMAx1EkDHn8w79hFcADeWCwqnIYwR6+nmKt20GpW0qJdIIB3LuErmYUqJA8RPNSUkt75Ki+zG3OxksoLvvZ2uFNq4pQOQJO3vGQPH09Kd2VatX7u25cCWMkq9zJbgBTu7xnrxFZ/3De8CNILGO9zzya03ZGmaw071cR1TvAnwJyPrQ5paYNat3wMwx1STrbuafV6NFAVAAAAAPAeVDaq8LFo3D4YH5f1+1SaYljJP+w8az3tDrfe3gg+C3j1P+36muX02GWSel+839TmUI2vcQ6BCTubLMZJ9av8AStEAVS6dKs9KvnXaZx0aLSXx1+xq2s6lfGs/pEXzq107KOlAEEdpX1azdUNBNt4PntMZ6Z61WWtYPfaW4ZUtZe24iMkI4wYmGU4HjROs1QMW15bnyFU/ZepDqx4Fk7bf5T+f1q09iq3NRd1K9KqtTf5qa7fDAGq/UHzqiyv1pBkGtR7D9oe+sNp3MvawPEoeI9OPSKyWpofsvtI6bUJeEwDDjxU8j9R5gUOTHrhReOeiVmg9qezSiu6kFiDgpIHkCuVH2rzHtBTuAdgWbLQZC5MAeHp0xX0LbKNLKN8wQBElTmVn1ms/2r2aLyul+0jAFgGx8J4YNyjAYP51gw9V4Nprb5m/J0/i15njvZWpZWuBLPvAykHaDvUdSrAErIkHpmm6x0BP8NlYhfjbcRnO7HJjqPDxp15PdXNoWVDmN4w6hup8COYrTdp3uzGskqm24RhEQe8RvDAAgHzzXTcqd09zDp2q+DK63WtgDasoA2yRPOHPU/oeaNf/AOZSLZO/4mWAF4CxgSxJiP0qrGnfdLKw3YG4EA/Wlp7xtOHTB6cH1B8RTHG91yAp9nwH3bmy2NOVlmcNuH4g3Hnnigr1kqdoVg8xAkyDnHpgRV42rCRfuWkR+LaryScs7DpE4HixqXTW72rug2bbFY+OBz03M3dj5GhipXsiTlFK5S2ArzXdFcZFdsgb4Lf6T8PdJ6x6ExmbR9lajWMzqFVWw1xpJ6AiTJnyB8vKtw3s/bVfeay8WVc7Cx92I4nrcI86qtb7RPdJsaK2QBjfgQvEgcIsdZ9KdDBS1T2Zln1upuOHdeb2QJqNJpuz0k9+6cD+b/2is/rtLcvE3GCoSCUQ7QxAzwYxE5NHbLOnBuSL94NDHPu1PMBiO839QKo+0e1rl2QSQpJMbieehJPHlgUcn2SBxxd3dvz/AGIWuFBCY3qNx6+YHgDj6UMCPD8662OefDwHnTIoLHpHbbkTHUQa7TQacKEI77w0Tptc6wA7AAyBMgTzKnBBoWK5RdtwS8RbbwVIsXTHB/hP+qmeh486tdH7S3tP3L6ls4LHED+V4JPzn5Vl9JcThiRPXlfmKKtaxk/hna6fyNlf8rdPnS3HsFZsDp9HrZMbLnXhW8cEd1+PPiq7Wex98FVS4GQTAYkFf8vH0qlWwpMWXNtjzbucH0bg/OrPRe0Oo05C3d23wfvL1+FiZH1+VKcX91hqQNe1D2ggZCty2NhV0BS4oYlTnIInkfUdWDth2uqxCqkbSighYPPJJJ65JrWWfaDT3gBdQAHxG9R84kesU+77L6e6N1o7fAqQw+hyPrStNcxGakzH6m5cVzbUbh0YiSAeM+I8TVn2Zo2IBYn6CrP/AOF7ij4hcHTJBA9Dx9auOydEEgMsdT+1Zs+alVGnBBc2dsaRghMZPTyHSsCqjcxHBZj9TNb72z1xt6Vygy0KSPwK2Mfl8683s6pfGKb0MKi5eYvq5W0i2svRtm9VPa1Cnhh9RRdu5WxoyF/p9X50V/bwAc1nbb1HcvkiZ6xFVpLssG7QJJacmfv/ALUzQajYGH8xYn6yPyqsLVNcuSZHgPsKtopF7pNdgj51y7qapbbsDijZJE0FBiu3aA1YkEZyIxyKmu3UX4nUepFV/aPaNuIV/WJ/OjQDPU3vi12cGt94JZUWieWMBU/zFiPrQHaOmcW1tvcdiFAJZmbdAAJMnJmsl7Pdq3HsW9PDm2t8PvA3MqpDkbRJj3hQz5nwrb9oalLyzbYN4RzPUEeOeKwZcbi69TfjyJqzz/tXSOQVL+fA+1CezetbSaj3jglY2uPFWzK+hAPyjrWyu+zGpuwVtlfN+6I9Dk/SjLH/AE7U51F0tH4beBH+I5+1asOHI1TWxk6jqcMd9Vv03Mr2h2jo71wom8I53ZDKisOSg7zFmErgDB8hVf2f7E6m8x2Jstz3XfcsjoQD3q9M932doFJAtoQYJwzz4FjwfWKoO0/b52b3emslmPG4MWPTCjOPp51vjijFe0zmy6jJP/nGvxJNF7FaWwBc1T+8I6uYQdYA5bmmdq+2dq2Pd6VA5BCrC9z/AChfiIqn1nZt68fea28LKHozqW/wgTtA8JLR4UKO37Flmt6W2ASIF5iWYznAAJY5woIE+FG51tFClh1u5vU/l/fwO9oJcYi7rbrAtPu7Sf8AiPiIVBIQeZk56UDrO1WtW3tqVt7hiyiglOZNy4TlyOeT6davW9puGMe8ViIa5cJ98w8JPwL5L9TVWoJ4pblvZqjj2pkmo1LPAZiYwB0HoB4+NMCwJPPQfqamt2l6yT6Gk9CMvsgdVnJp806a6FqIsgpKKVKowh1cJpUqohwCkaVKoQkS7iOR4Hj/AG+VG6btFlG0NK/yXO8vyPSlSqOKa3KuiUNYbJ3WGPG3KHz/AK8aMRb699SLg6PbYhvKcg/IGlSpOT2VYa3LXR+1rLhyZ8Li5x/M2I9AGNW1j2sQxuXoMowYCeBtba30BpUqvRFksNv67T3khnXawgh5UnyhoNVNz2R0z5TcP8Dz/wCaaVKqjBLgkpNgF/2JX8N1h/iUH8iKBuex90fDcQ/UfvSpUxREyyNER9mtUOGX5Of1AqNuw9YOhPo6/qaVKi0APO0Idja3+Rv9af8AqqS12DrjgAj1df0NcpVfhlPqGuwSnsnrW5YD1uH9BRVn2A1LfHdtj5s36ClSoliXmLfVS8g/S/8ATMk97UrH91DP3NXOj/6Z6UfHduv5SFH2pUqaoRQmWfI+5pOzux+z9II/hpMTvuZaJjBOeT9aKve0+ktYVkBmIAVSY8AxUt6iaVKo0lwMxw8RXJszus/6kDIt28mNpLATP/3ApnjCq1U9692jqhlmRTOWOxfnuUE//i+ddpUtSbYU4xxpUuSt1djTWnm/da/dMnZYBJzjLzuj/CU64qDUe0FxFi1btaO2c94Brz+ezk+rf6qVKhhK1Y6UFdPczGu7R94xJLOxgF7hz6hFwvX+amJrhbEWo3Gd1wjvZ6ID8I+58q7SqPYZpQLbQuZMnxPX6mjAgHAHl4f80qVRCZyd0MYz+tMJpUqsKKImFc2nzpUqgVn/2Q==}');
INSERT INTO public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user, imagen) VALUES (2, 'Art Exhibition', 'Modern art gallery', 2, NULL, '2024-06-02 10:00:00', 180, 20.00, true, 50, 2, '{data:image/jpeg;base64,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}');
INSERT INTO public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user, imagen) VALUES (3, 'Tech Talk', 'Latest in technology', 3, 3, '2024-06-03 14:00:00', 90, 0.00, true, 200, 3, '{data:image/jpeg;base64,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}');
INSERT INTO public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user, imagen) VALUES (4, 'Evento de prueba', 'Descripción del evento de prueba', 1, NULL, '2024-07-05 10:00:00', 120, 50, true, 100, 1, '{data:image/jpeg;base64,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}');
INSERT INTO public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user, imagen) VALUES (5, 'Evento de prueba', 'Descripción del evento de prueba', 1, NULL, '2024-07-05 10:00:00', 120, 50, true, 100, 1, '{https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5l-5cFzbwGu8rmj71rcIYCXkQKS1OXyhSoA&s}');


--
-- TOC entry 4864 (class 0 OID 16426)
-- Dependencies: 226
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locations (id, name, id_province, latitude, longitude) VALUES (1, 'New York', 1, 40.7128, -74.0060);
INSERT INTO public.locations (id, name, id_province, latitude, longitude) VALUES (2, 'Los Angeles', 2, 34.0522, -118.2437);
INSERT INTO public.locations (id, name, id_province, latitude, longitude) VALUES (3, 'San Francisco', 3, 37.7749, -122.4194);


--
-- TOC entry 4866 (class 0 OID 16432)
-- Dependencies: 228
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.provinces (id, name, full_name, latitude, longitude, display_order) VALUES (1, 'NY', 'New York', 40.7128, -74.0060, 1);
INSERT INTO public.provinces (id, name, full_name, latitude, longitude, display_order) VALUES (2, 'CA', 'California', 34.0522, -118.2437, 2);
INSERT INTO public.provinces (id, name, full_name, latitude, longitude, display_order) VALUES (3, 'CA', 'California', 37.7749, -122.4194, 3);


--
-- TOC entry 4868 (class 0 OID 16438)
-- Dependencies: 230
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tags (id, name) VALUES (1, 'Music');
INSERT INTO public.tags (id, name) VALUES (2, 'Art');
INSERT INTO public.tags (id, name) VALUES (3, 'Technology');


--
-- TOC entry 4870 (class 0 OID 16444)
-- Dependencies: 232
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, first_name, last_name, username, password) VALUES (4, 'Maxi', 'Garbarino', 'maxi@gmail.com', 'HolaProfe');
INSERT INTO public.users (id, first_name, last_name, username, password) VALUES (1, 'John', 'Doe', 'jdoe@gmail.com', 'password1');
INSERT INTO public.users (id, first_name, last_name, username, password) VALUES (5, 'Maxi', 'Garbarino', 'maxi@gmail.com', 'HolaProfe');
INSERT INTO public.users (id, first_name, last_name, username, password) VALUES (2, 'Jane', 'Smith', 'jsmith@gmail.com', 'password2');
INSERT INTO public.users (id, first_name, last_name, username, password) VALUES (3, 'Alice', 'Johnson', 'ajohnson@gmail.com', 'password3');


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 217
-- Name: event_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_categories_id_seq', 1, false);


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 219
-- Name: event_enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_enrollments_id_seq', 1, false);


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 221
-- Name: event_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_locations_id_seq', 1, false);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 223
-- Name: event_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_tags_id_seq', 1, false);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 225
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 5, true);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 227
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 229
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 1, false);


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 231
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 233
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4685 (class 2606 OID 16460)
-- Name: event_categories PK_EventCategories; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT "PK_EventCategories" PRIMARY KEY (id);


--
-- TOC entry 4687 (class 2606 OID 16462)
-- Name: event_enrollments PK_EventEnrollments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT "PK_EventEnrollments" PRIMARY KEY (id);


--
-- TOC entry 4689 (class 2606 OID 16464)
-- Name: event_locations PK_EventLocations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT "PK_EventLocations" PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 16466)
-- Name: event_tags PK_EventTags; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT "PK_EventTags" PRIMARY KEY (id);


--
-- TOC entry 4693 (class 2606 OID 16468)
-- Name: events PK_Events; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT "PK_Events" PRIMARY KEY (id);


--
-- TOC entry 4697 (class 2606 OID 16470)
-- Name: provinces PK_Provinces ; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT "PK_Provinces " PRIMARY KEY (id);


--
-- TOC entry 4699 (class 2606 OID 16472)
-- Name: tags PK_Tags; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT "PK_Tags" PRIMARY KEY (id);


--
-- TOC entry 4701 (class 2606 OID 16474)
-- Name: users PK_Users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_Users" PRIMARY KEY (id);


--
-- TOC entry 4695 (class 2606 OID 16476)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 16477)
-- Name: event_enrollments FK_Event_enrollments_Events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT "FK_Event_enrollments_Events" FOREIGN KEY (id_event) REFERENCES public.events(id) NOT VALID;


--
-- TOC entry 4703 (class 2606 OID 16482)
-- Name: event_enrollments FK_Event_enrollments_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT "FK_Event_enrollments_Users" FOREIGN KEY (id_user) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 4705 (class 2606 OID 16487)
-- Name: event_tags FK_Event_tags_Event; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT "FK_Event_tags_Event" FOREIGN KEY (id_event) REFERENCES public.events(id) NOT VALID;


--
-- TOC entry 4706 (class 2606 OID 16492)
-- Name: event_tags FK_Event_tags_Tags; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT "FK_Event_tags_Tags" FOREIGN KEY (id_tag) REFERENCES public.tags(id) NOT VALID;


--
-- TOC entry 4704 (class 2606 OID 16497)
-- Name: event_locations FK_EventlocationLocations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT "FK_EventlocationLocations" FOREIGN KEY (id_location) REFERENCES public.locations(id) NOT VALID;


--
-- TOC entry 4707 (class 2606 OID 16502)
-- Name: events FK_EventsEvent_categories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT "FK_EventsEvent_categories" FOREIGN KEY (id_event_category) REFERENCES public.event_categories(id) NOT VALID;


--
-- TOC entry 4708 (class 2606 OID 16507)
-- Name: events FK_EventsEvent_locations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT "FK_EventsEvent_locations" FOREIGN KEY (id_event_location) REFERENCES public.event_locations(id) NOT VALID;


--
-- TOC entry 4709 (class 2606 OID 16512)
-- Name: events FK_EventsUsers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT "FK_EventsUsers" FOREIGN KEY (id_creator_user) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 4710 (class 2606 OID 16517)
-- Name: locations FK_LocationsProvince; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT "FK_LocationsProvince" FOREIGN KEY (id_province) REFERENCES public.provinces(id) NOT VALID;


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2024-11-06 08:25:53

--
-- PostgreSQL database dump complete
--

