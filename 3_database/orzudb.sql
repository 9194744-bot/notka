--
-- Database "orzudb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.10.1)
-- Dumped by pg_dump version 14.13 (Ubuntu 14.13-1.pgdg22.04+1)

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
-- Name: orzudb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE orzudb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE orzudb OWNER TO postgres;

\connect orzudb

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO backend;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO backend;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO backend;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO backend;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO backend;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO backend;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO backend;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO backend;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO backend;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO backend;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO backend;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO backend;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO backend;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO backend;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO backend;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO backend;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO backend;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO backend;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO backend;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO backend;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: news_news; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.news_news (
    id bigint NOT NULL,
    photo character varying(100) NOT NULL,
    landscape_photo character varying(100) NOT NULL,
    created_on date NOT NULL,
    description_en text,
    description_ru text,
    description_uz text NOT NULL,
    title_en character varying(150),
    title_ru character varying(150),
    title_uz character varying(150) NOT NULL
);


ALTER TABLE public.news_news OWNER TO backend;

--
-- Name: news_news_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.news_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_news_id_seq OWNER TO backend;

--
-- Name: news_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.news_news_id_seq OWNED BY public.news_news.id;


--
-- Name: products_banners; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.products_banners (
    id bigint NOT NULL,
    photo character varying(100) NOT NULL
);


ALTER TABLE public.products_banners OWNER TO backend;

--
-- Name: products_banners_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.products_banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_banners_id_seq OWNER TO backend;

--
-- Name: products_banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.products_banners_id_seq OWNED BY public.products_banners.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.products_product (
    id bigint NOT NULL,
    "order" integer NOT NULL,
    name_uz character varying(200) NOT NULL,
    photo character varying(100) NOT NULL,
    weight double precision,
    artikul character varying(50) NOT NULL,
    carbohydrates double precision NOT NULL,
    calories double precision NOT NULL,
    fats double precision NOT NULL,
    is_top boolean NOT NULL,
    category_id bigint NOT NULL,
    country_id bigint NOT NULL,
    _order integer NOT NULL,
    description_en text,
    description_ru text,
    description_uz text NOT NULL,
    name_en character varying(200),
    name_ru character varying(200),
    top_photo character varying(100) NOT NULL,
    subtitle_en character varying(150),
    subtitle_ru character varying(150),
    subtitle_uz character varying(150),
    CONSTRAINT products_product_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.products_product OWNER TO backend;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO backend;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;


--
-- Name: products_productcategory; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.products_productcategory (
    id bigint NOT NULL,
    title_en character varying(100),
    title_ru character varying(100),
    title_uz character varying(100) NOT NULL,
    photo character varying(100),
    slider_photo character varying(100)
);


ALTER TABLE public.products_productcategory OWNER TO backend;

--
-- Name: products_productcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.products_productcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productcategory_id_seq OWNER TO backend;

--
-- Name: products_productcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.products_productcategory_id_seq OWNED BY public.products_productcategory.id;


--
-- Name: products_productcountry; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.products_productcountry (
    id bigint NOT NULL,
    name_en character varying(50),
    name_ru character varying(50),
    name_uz character varying(50) NOT NULL
);


ALTER TABLE public.products_productcountry OWNER TO backend;

--
-- Name: products_productcountry_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.products_productcountry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productcountry_id_seq OWNER TO backend;

--
-- Name: products_productcountry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.products_productcountry_id_seq OWNED BY public.products_productcountry.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO backend;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO backend;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO backend;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO backend;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO backend;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO backend;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO backend;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO backend;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO backend;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.users_user OWNER TO backend;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO backend;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO backend;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO backend;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO backend;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO backend;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: news_news id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.news_news ALTER COLUMN id SET DEFAULT nextval('public.news_news_id_seq'::regclass);


--
-- Name: products_banners id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.products_banners ALTER COLUMN id SET DEFAULT nextval('public.products_banners_id_seq'::regclass);


--
-- Name: products_product id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: products_productcategory id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.products_productcategory ALTER COLUMN id SET DEFAULT nextval('public.products_productcategory_id_seq'::regclass);


--
-- Name: products_productcountry id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.products_productcountry ALTER COLUMN id SET DEFAULT nextval('public.products_productcountry_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add session	4	add_session
14	Can change session	4	change_session
15	Can delete session	4	delete_session
16	Can view session	4	view_session
17	Can add site	5	add_site
18	Can change site	5	change_site
19	Can delete site	5	delete_site
20	Can view site	5	view_site
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add email address	7	add_emailaddress
26	Can change email address	7	change_emailaddress
27	Can delete email address	7	delete_emailaddress
28	Can view email address	7	view_emailaddress
29	Can add email confirmation	8	add_emailconfirmation
30	Can change email confirmation	8	change_emailconfirmation
31	Can delete email confirmation	8	delete_emailconfirmation
32	Can view email confirmation	8	view_emailconfirmation
33	Can add social account	9	add_socialaccount
34	Can change social account	9	change_socialaccount
35	Can delete social account	9	delete_socialaccount
36	Can view social account	9	view_socialaccount
37	Can add social application	10	add_socialapp
38	Can change social application	10	change_socialapp
39	Can delete social application	10	delete_socialapp
40	Can view social application	10	view_socialapp
41	Can add social application token	11	add_socialtoken
42	Can change social application token	11	change_socialtoken
43	Can delete social application token	11	delete_socialtoken
44	Can view social application token	11	view_socialtoken
45	Can add Token	12	add_token
46	Can change Token	12	change_token
47	Can delete Token	12	delete_token
48	Can view Token	12	view_token
49	Can add token	13	add_tokenproxy
50	Can change token	13	change_tokenproxy
51	Can delete token	13	delete_tokenproxy
52	Can view token	13	view_tokenproxy
53	Can add kv store	14	add_kvstore
54	Can change kv store	14	change_kvstore
55	Can delete kv store	14	delete_kvstore
56	Can view kv store	14	view_kvstore
57	Can add user	15	add_user
58	Can change user	15	change_user
59	Can delete user	15	delete_user
60	Can view user	15	view_user
61	Can add Баннер	16	add_banners
62	Can change Баннер	16	change_banners
63	Can delete Баннер	16	delete_banners
64	Can view Баннер	16	view_banners
65	Can add Категория товара	17	add_productcategory
66	Can change Категория товара	17	change_productcategory
67	Can delete Категория товара	17	delete_productcategory
68	Can view Категория товара	17	view_productcategory
69	Can add Страна изготовления	18	add_productcountry
70	Can change Страна изготовления	18	change_productcountry
71	Can delete Страна изготовления	18	delete_productcountry
72	Can view Страна изготовления	18	view_productcountry
73	Can add Продукт	19	add_product
74	Can change Продукт	19	change_product
75	Can delete Продукт	19	delete_product
76	Can view Продукт	19	view_product
77	Can add Новость	20	add_news
78	Can change Новость	20	change_news
79	Can delete Новость	20	delete_news
80	Can view Новость	20	view_news
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
a52ae421710ab8534b5e697d014daecd4f348848	2023-01-25 08:22:49.844901+00	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-01-20 14:13:17.805904+00	1	notka.uz	2	[{"changed": {"fields": ["Domain name"]}}]	5	1
2	2023-01-20 14:13:34.195998+00	2	api.notka.uz	1	[{"added": {}}]	5	1
3	2023-01-20 14:14:23.301127+00	1	Banners object (1)	1	[{"added": {}}]	16	1
4	2023-01-20 14:38:46.641704+00	1	notka	1	[{"added": {}}]	17	1
5	2023-01-20 14:38:53.71536+00	2	yashil	1	[{"added": {}}]	17	1
6	2023-01-20 14:39:03.989444+00	3	kapla	1	[{"added": {}}]	17	1
7	2023-01-20 14:39:15.322715+00	4	paket	1	[{"added": {}}]	17	1
8	2023-01-20 14:39:25.090545+00	5	barbaris	1	[{"added": {}}]	17	1
9	2023-01-20 14:39:36.11756+00	6	bim bom	1	[{"added": {}}]	17	1
10	2023-01-20 14:39:49.38667+00	7	chikko	1	[{"added": {}}]	17	1
11	2023-01-20 14:39:55.92408+00	8	rich	1	[{"added": {}}]	17	1
12	2023-01-20 14:40:05.245071+00	9	qizil	1	[{"added": {}}]	17	1
13	2023-01-21 05:25:52.709146+00	1	ubz	1	[{"added": {}}]	18	1
14	2023-01-21 05:25:58.716447+00	1	uzb	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u044b"]}}]	18	1
15	2023-01-21 05:26:07.616036+00	2	russian	1	[{"added": {}}]	18	1
16	2023-01-21 05:26:16.633481+00	3	paris	1	[{"added": {}}]	18	1
17	2023-01-21 05:26:42.528052+00	4	england	1	[{"added": {}}]	18	1
18	2023-01-21 05:27:38.49742+00	1	qizil | Категория: qizil	1	[{"added": {}}]	19	1
19	2023-01-21 05:28:47.602867+00	2	bim bom | Категория: bim bom	1	[{"added": {}}]	19	1
20	2023-01-21 05:33:12.896646+00	3	3chikko | Категория: barbaris	1	[{"added": {}}]	19	1
21	2023-01-21 05:35:07.821111+00	4	kapla | Категория: kapla	1	[{"added": {}}]	19	1
22	2023-01-21 05:37:32.212153+00	5	rich | Категория: yashil	1	[{"added": {}}]	19	1
23	2023-01-21 05:43:11.636978+00	6	notka | Категория: chikko	1	[{"added": {}}]	19	1
24	2023-01-25 08:22:49.859296+00	1	a52ae421710ab8534b5e697d014daecd4f348848	1	[{"added": {}}]	13	1
25	2023-01-25 13:55:28.284355+00	9	lorem	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
26	2023-01-26 09:08:00.172207+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
27	2023-01-26 09:09:22.12932+00	8	Chikko	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
28	2023-01-26 09:10:35.324107+00	7	Barbaris	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
29	2023-01-26 10:28:55.998599+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
30	2023-01-26 10:29:08.613578+00	8	Chikko	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
31	2023-01-26 10:31:12.393008+00	7	Barbaris	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
32	2023-01-26 10:32:28.709534+00	6	Myata	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
33	2023-01-26 11:11:08.45065+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
34	2023-01-26 11:13:12.415594+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
35	2023-01-26 11:32:04.562153+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
36	2023-01-26 11:32:30.588349+00	8	Chikko	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
37	2023-01-26 11:32:49.612032+00	7	Barbaris	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
38	2023-01-26 11:33:08.736299+00	6	Myata	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
39	2023-01-26 11:37:53.571533+00	5	Rich	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
40	2023-01-26 11:38:42.765174+00	4	Bim Bom	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
41	2023-01-26 11:41:04.832075+00	3	Paket xon	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
42	2023-01-26 11:41:42.409906+00	2	Notka	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
43	2023-01-26 11:42:17.353723+00	1	lorem	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
44	2023-01-26 11:42:31.856687+00	7	Barbaris	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
45	2023-01-26 11:43:25.734821+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e"]}}]	17	1
46	2023-01-26 11:45:43.831762+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
47	2023-01-26 11:46:09.575669+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
48	2023-01-26 11:46:51.488638+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
49	2023-01-26 11:52:17.114147+00	1	Barbaris	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e"]}}]	17	1
50	2023-01-26 12:03:41.043828+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
51	2023-01-26 12:04:19.74745+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
52	2023-01-26 12:05:19.587698+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
53	2023-01-26 12:06:18.987786+00	8	Chikko	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
54	2023-01-26 12:07:13.944981+00	8	Chikko	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
55	2023-01-26 12:08:41.50006+00	7	Barbaris	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
56	2023-01-26 12:09:11.791191+00	7	Barbaris	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
57	2023-01-26 12:09:53.613617+00	6	Myata	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
58	2023-01-26 12:10:24.077619+00	5	Rich	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
59	2023-01-26 12:11:39.762664+00	4	Bim Bom	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
60	2023-01-26 12:12:02.133779+00	3	Paket xon	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
61	2023-01-26 12:12:21.730364+00	2	Notka	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
62	2023-01-26 12:12:43.950391+00	1	Barbaris	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
63	2023-01-27 05:41:03.16813+00	5	rich | Категория: Rich	2	[{"changed": {"fields": ["Name en", "Name ru", "\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru"]}}]	19	1
64	2023-01-27 05:41:43.82176+00	4	kapla | Категория: Kaplya	2	[{"changed": {"fields": ["Name en", "Name ru", "\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru"]}}]	19	1
65	2023-01-27 05:42:19.882297+00	3	myata | Категория: Myata	2	[{"changed": {"fields": ["Name uz", "Name en", "Name ru", "\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru"]}}]	19	1
66	2023-01-27 05:43:36.902503+00	2	paket xon | Категория: Paket xon	2	[{"changed": {"fields": ["Name uz", "Name en", "Name ru", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043f\\u0430\\u043a\\u0435\\u0442\\u0430", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435", "\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru"]}}]	19	1
67	2023-01-27 05:44:07.042369+00	2	paket xon | Категория: Paket xon	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043f\\u0430\\u043a\\u0435\\u0442\\u0430", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	19	1
68	2023-01-27 05:45:05.27683+00	1	barbaris | Категория: Barbaris	2	[{"changed": {"fields": ["Name uz", "Name en", "Name ru", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043f\\u0430\\u043a\\u0435\\u0442\\u0430", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435", "\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru"]}}]	19	1
69	2023-01-27 05:47:09.857324+00	6	notka | Категория: Notka	2	[{"changed": {"fields": ["Name en", "Name ru", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043f\\u0430\\u043a\\u0435\\u0442\\u0430", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435", "\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru"]}}]	19	1
70	2023-01-27 05:48:31.05765+00	7	chikko | Категория: Chikko	1	[{"added": {}}]	19	1
71	2023-01-27 05:49:42.820751+00	8	bim bom | Категория: Bim Bom	1	[{"added": {}}]	19	1
72	2023-01-27 05:51:01.087458+00	9	Barbaris oq | Категория: Barbaris	1	[{"added": {}}]	19	1
73	2023-01-27 05:52:23.825413+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
74	2023-01-27 05:53:36.630183+00	4	Bim Bom	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
75	2023-01-27 05:55:38.474461+00	4	Bim Bom	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
76	2023-01-27 10:50:11.03482+00	2	Notka	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
77	2023-01-27 11:00:22.021759+00	2	Notka	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
78	2023-01-27 11:04:23.700574+00	2	Notka	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
79	2023-01-27 11:11:30.623417+00	2	Notka	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
80	2023-01-27 11:26:06.367857+00	2	Notka	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
81	2023-01-27 11:28:35.209977+00	2	Notka	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
82	2023-01-27 11:31:03.567767+00	2	Notka	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
83	2023-02-01 07:05:58.814892+00	1	Barbaris	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
84	2023-02-01 08:11:13.858595+00	6	Myata	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
85	2023-02-01 08:12:26.747653+00	9	Kaplya	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
86	2023-02-01 08:12:43.306441+00	7	Barbaris	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
87	2023-02-01 08:13:18.176052+00	5	Rich	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
88	2023-02-01 08:13:32.872924+00	2	Notka	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
89	2023-02-01 08:17:54.433345+00	4	Bim Bom	2	[{"changed": {"fields": ["\\u0410\\u043b\\u044c\\u0431\\u043e\\u043c\\u043d\\u043e\\u0435 \\u0444\\u043e\\u0442\\u043e", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
90	2023-02-01 11:43:07.353914+00	7	chikko | Категория: Chikko	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0432 \\u0431\\u043b\\u043e\\u043a\\u0435 TOP"]}}]	19	1
91	2023-02-03 06:29:59.485151+00	9	Barbaris oq | Категория: Barbaris	3		19	1
92	2023-02-03 06:29:59.510029+00	8	bim bom | Категория: Bim Bom	3		19	1
93	2023-02-03 06:29:59.511192+00	7	chikko | Категория: Chikko	3		19	1
94	2023-02-03 06:29:59.511762+00	6	notka | Категория: Notka	3		19	1
95	2023-02-03 06:29:59.512406+00	5	rich | Категория: Rich	3		19	1
96	2023-02-03 06:29:59.513349+00	4	kapla | Категория: Kaplya	3		19	1
97	2023-02-03 06:29:59.514195+00	3	myata | Категория: Myata	3		19	1
98	2023-02-03 06:29:59.51491+00	2	paket xon | Категория: Paket xon	3		19	1
99	2023-02-03 06:29:59.515788+00	1	barbaris | Категория: Barbaris	3		19	1
100	2023-02-03 06:32:16.632528+00	9	Kaplya	3		17	1
101	2023-02-03 06:32:16.638074+00	8	Chikko	3		17	1
102	2023-02-03 06:32:16.638896+00	7	Barbaris	3		17	1
103	2023-02-03 06:32:16.639539+00	6	Myata	3		17	1
104	2023-02-03 06:32:16.640038+00	5	Rich	3		17	1
105	2023-02-03 06:32:16.640529+00	4	Bim Bom	3		17	1
106	2023-02-03 06:32:16.641033+00	3	Paket xon	3		17	1
107	2023-02-03 06:32:16.641568+00	2	Notka	3		17	1
108	2023-02-03 06:32:16.642082+00	1	Barbaris	3		17	1
109	2023-02-03 06:33:25.96288+00	10	Notka	1	[{"added": {}}]	17	1
110	2023-02-03 06:34:04.980417+00	10	Notka	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
111	2023-02-03 06:34:28.194208+00	10	Notka	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
112	2023-02-03 06:35:53.47136+00	10	Notka	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
113	2023-02-03 06:41:53.768418+00	11	Barbaris	1	[{"added": {}}]	17	1
114	2023-02-03 06:44:03.644927+00	11	Barbaris	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
115	2023-02-03 06:45:37.62688+00	12	Bim Bom	1	[{"added": {}}]	17	1
116	2023-02-04 09:40:53.027403+00	13	Barbaris	1	[{"added": {}}]	17	1
117	2023-02-04 09:40:54.213859+00	14	Barbaris	1	[{"added": {}}]	17	1
118	2023-02-04 09:41:37.104077+00	14	Barbaris	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
119	2023-02-04 09:42:31.603397+00	14	Barbaris	3		17	1
120	2023-02-04 09:43:16.051446+00	11	Barbaris	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
121	2023-02-04 10:22:04.6837+00	13	Barbaris	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
122	2023-02-04 10:26:03.425539+00	13	Barbaris	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430"]}}]	17	1
123	2023-02-04 11:36:34.623556+00	10	Barbaris | Категория: Barbaris	1	[{"added": {}}]	19	1
124	2023-02-04 11:43:40.822917+00	10	Barbaris | Категория: Barbaris	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	19	1
125	2023-02-04 11:44:54.398948+00	10	Barbaris | Категория: Barbaris	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0432 \\u0431\\u043b\\u043e\\u043a\\u0435 TOP", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	19	1
126	2023-02-04 11:56:38.27361+00	10	Barbaris | Категория: Barbaris	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	19	1
127	2023-02-04 11:57:11.931524+00	10	Barbaris | Категория: Barbaris	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	19	1
128	2023-02-04 12:01:46.598492+00	11	Barbaris qizil	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru"]}}]	17	1
129	2023-02-04 12:04:37.23321+00	11	Barbaris qizil	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430"]}}]	17	1
130	2023-02-04 12:05:12.989944+00	11	Barbaris qizil	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430"]}}]	17	1
131	2023-02-04 12:05:46.056553+00	11	Barbaris qizil	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
132	2023-02-04 12:06:52.706741+00	10	Notka	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
133	2023-02-04 12:09:33.649712+00	13	Barbaris oq	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru", "\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
134	2023-02-04 12:10:13.01179+00	12	Bim Bom	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430", "\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
135	2023-02-04 16:11:56.586536+00	10	Notka	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
136	2023-02-04 16:12:28.271995+00	11	Barbaris qizil	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
137	2023-02-04 16:12:56.108692+00	11	Barbaris qizil	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
138	2023-02-04 16:13:17.193846+00	12	Bim Bom	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
139	2023-02-04 16:13:40.234673+00	13	Barbaris oq	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	17	1
140	2023-02-04 16:15:58.005783+00	15	Chiko	1	[{"added": {}}]	17	1
141	2023-02-04 16:17:06.525841+00	16	Myata	1	[{"added": {}}]	17	1
142	2023-02-04 16:18:14.997405+00	17	Paket xon	1	[{"added": {}}]	17	1
143	2023-02-04 16:18:54.896034+00	18	Rich	1	[{"added": {}}]	17	1
144	2023-02-04 16:19:50.692842+00	19	Kaplya	1	[{"added": {}}]	17	1
145	2023-02-05 06:38:13.630339+00	11	Barbaris qizil	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en"]}}]	17	1
146	2023-02-05 06:41:18.262644+00	11	Notla | Категория: Notka	1	[{"added": {}}]	19	1
147	2023-02-05 06:41:49.467134+00	11	Notla | Категория: Notka	2	[{"changed": {"fields": ["\\u041c\\u0430\\u0441\\u0441\\u0430"]}}]	19	1
148	2023-02-05 06:42:36.629842+00	11	Notka | Категория: Notka	2	[{"changed": {"fields": ["Name uz"]}}]	19	1
149	2023-02-05 06:43:11.359662+00	10	Barbaris oq | Категория: Barbaris qizil	2	[{"changed": {"fields": ["Name uz", "Name en", "Name ru"]}}]	19	1
150	2023-02-05 06:44:41.499864+00	12	Rich | Категория: Rich	1	[{"added": {}}]	19	1
151	2023-02-05 06:45:24.322299+00	10	Barbaris oq | Категория: Barbaris oq	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430"]}}]	19	1
152	2023-02-05 06:47:58.407087+00	15	Chiko	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430"]}}]	17	1
153	2023-02-05 06:48:41.084312+00	16	Myata	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430"]}}]	17	1
154	2023-02-05 06:49:34.402918+00	17	Paket xon	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430"]}}]	17	1
155	2023-02-05 06:50:28.057073+00	18	Rich	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430"]}}]	17	1
156	2023-02-05 06:51:24.440105+00	19	Kaplya	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u044f \\u0441\\u043b\\u0430\\u0439\\u0434\\u0435\\u0440\\u0430"]}}]	17	1
157	2023-02-05 06:56:01.246889+00	13	Barbaris qizil | Категория: Barbaris qizil	1	[{"added": {}}]	19	1
158	2023-02-05 07:00:29.480189+00	14	Paket xon | Категория: Paket xon	1	[{"added": {}}]	19	1
159	2023-02-05 07:03:35.708452+00	15	Myata | Категория: Myata	1	[{"added": {}}]	19	1
160	2023-02-05 07:05:52.095158+00	16	Bim Bom | Категория: Bim Bom	1	[{"added": {}}]	19	1
161	2023-02-06 11:15:56.208485+00	13	Barbaris o	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz"]}}]	17	1
162	2023-02-06 11:16:02.284317+00	13	Barbaris oq	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz"]}}]	17	1
163	2023-02-06 12:03:02.70503+00	13	Barbaris qizil | Категория: Barbaris qizil	2	[{"changed": {"fields": ["\\u0412 \\u0442\\u043e\\u043f\\u0435?"]}}]	19	1
164	2023-02-06 12:03:39.374239+00	14	Paket xon | Категория: Paket xon	2	[{"changed": {"fields": ["\\u0412 \\u0442\\u043e\\u043f\\u0435?"]}}]	19	1
165	2023-02-06 12:30:43.744331+00	17	Chiko | Категория: Chiko	1	[{"added": {}}]	19	1
166	2023-02-06 12:32:16.074898+00	16	Bim Bom | Категория: Bim Bom	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 uz", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru", "\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0423\\u0433\\u043b\\u0435\\u0432\\u043e\\u0434\\u044b", "\\u041a\\u0430\\u043b\\u043e\\u0440\\u0438\\u0438", "\\u0416\\u0438\\u0440\\u044b"]}}]	19	1
167	2023-02-06 12:32:50.215824+00	15	Myata | Категория: Myata	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 uz", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru", "\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0423\\u0433\\u043b\\u0435\\u0432\\u043e\\u0434\\u044b", "\\u041a\\u0430\\u043b\\u043e\\u0440\\u0438\\u0438", "\\u0416\\u0438\\u0440\\u044b"]}}]	19	1
168	2023-02-06 12:33:18.150796+00	14	Paket xon | Категория: Paket xon	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 uz", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru", "\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0423\\u0433\\u043b\\u0435\\u0432\\u043e\\u0434\\u044b", "\\u041a\\u0430\\u043b\\u043e\\u0440\\u0438\\u0438", "\\u0416\\u0438\\u0440\\u044b"]}}]	19	1
211	2023-02-07 13:57:07.83467+00	26	Barbaris oq | Категория: Barbaris qizil	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430"]}}]	19	1
169	2023-02-06 12:33:45.856145+00	13	Barbaris qizil | Категория: Barbaris qizil	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 uz", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru", "\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0423\\u0433\\u043b\\u0435\\u0432\\u043e\\u0434\\u044b", "\\u041a\\u0430\\u043b\\u043e\\u0440\\u0438\\u0438", "\\u0416\\u0438\\u0440\\u044b"]}}]	19	1
170	2023-02-06 12:34:16.201964+00	12	Rich | Категория: Rich	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 uz", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru", "\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0423\\u0433\\u043b\\u0435\\u0432\\u043e\\u0434\\u044b", "\\u041a\\u0430\\u043b\\u043e\\u0440\\u0438\\u0438", "\\u0416\\u0438\\u0440\\u044b", "\\u0421\\u0442\\u0440\\u0430\\u043d\\u0430 \\u0438\\u0437\\u0433\\u043e\\u0442\\u043e\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f"]}}]	19	1
171	2023-02-06 12:34:45.843061+00	10	Barbaris oq | Категория: Barbaris oq	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 uz", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru", "\\u041c\\u0430\\u0441\\u0441\\u0430", "\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0423\\u0433\\u043b\\u0435\\u0432\\u043e\\u0434\\u044b", "\\u041a\\u0430\\u043b\\u043e\\u0440\\u0438\\u0438", "\\u0416\\u0438\\u0440\\u044b"]}}]	19	1
172	2023-02-06 12:35:39.279194+00	11	Notka | Категория: Notka	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 uz", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 en", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 ru", "\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0423\\u0433\\u043b\\u0435\\u0432\\u043e\\u0434\\u044b", "\\u041a\\u0430\\u043b\\u043e\\u0440\\u0438\\u0438", "\\u0416\\u0438\\u0440\\u044b"]}}]	19	1
173	2023-02-06 12:37:38.029586+00	4	Uzbekistan	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u044b uz", "\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u044b en", "\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u044b ru"]}}]	18	1
174	2023-02-06 12:37:47.96106+00	3	lorem	3		18	1
175	2023-02-06 12:37:47.96262+00	2	lorem	3		18	1
176	2023-02-06 12:37:47.963629+00	1	lorem	3		18	1
177	2023-02-06 12:39:59.359331+00	18	Chiko | Категория: Chiko	1	[{"added": {}}]	19	1
178	2023-02-06 12:41:56.275327+00	19	Myata | Категория: Myata	1	[{"added": {}}]	19	1
179	2023-02-06 12:43:30.172246+00	20	Notka | Категория: Notka	1	[{"added": {}}]	19	1
180	2023-02-06 12:44:57.780558+00	21	Bim Bom | Категория: Bim Bom	1	[{"added": {}}]	19	1
181	2023-02-06 12:46:58.697132+00	22	Barbaris | Категория: Barbaris qizil	1	[{"added": {}}]	19	1
182	2023-02-06 13:04:11.12382+00	23	Kaplya | Категория: Kaplya	1	[{"added": {}}]	19	1
183	2023-02-06 13:05:33.844286+00	24	Paket xon | Категория: Paket xon	1	[{"added": {}}]	19	1
184	2023-02-06 13:18:46.318678+00	23	Kaplya | Категория: Kaplya	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0432 \\u0431\\u043b\\u043e\\u043a\\u0435 TOP", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	19	1
185	2023-02-06 13:19:23.609343+00	24	Paket xon | Категория: Paket xon	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0432 \\u0431\\u043b\\u043e\\u043a\\u0435 TOP", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	19	1
186	2023-02-06 13:20:33.919233+00	25	Rich | Категория: Rich	1	[{"added": {}}]	19	1
187	2023-02-06 13:21:56.092369+00	26	Barbaris oq | Категория: Barbaris oq	1	[{"added": {}}]	19	1
188	2023-02-06 16:20:32.837963+00	10	Notka1	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz"]}}]	17	1
189	2023-02-06 16:21:41.443095+00	10	Notka	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz"]}}]	17	1
190	2023-02-06 16:36:54.788999+00	26	Barbaris oq | Категория: Barbaris oq	2	[{"changed": {"fields": ["Subtitle uz", "Subtitle en", "Subtitle ru"]}}]	19	1
191	2023-02-06 16:37:30.318314+00	25	Rich | Категория: Rich	2	[{"changed": {"fields": ["Subtitle uz", "Subtitle en", "Subtitle ru"]}}]	19	1
192	2023-02-06 16:38:32.302089+00	20	Notka | Категория: Notka	2	[{"changed": {"fields": ["Subtitle uz", "Subtitle en", "Subtitle ru"]}}]	19	1
193	2023-02-06 16:40:17.844341+00	18	Chiko | Категория: Chiko	2	[{"changed": {"fields": ["Subtitle uz", "Subtitle en", "Subtitle ru"]}}]	19	1
194	2023-02-06 16:40:34.924778+00	21	Bim Bom | Категория: Bim Bom	2	[{"changed": {"fields": ["Subtitle uz", "Subtitle en", "Subtitle ru"]}}]	19	1
195	2023-02-06 16:43:47.64676+00	1	News object (1)	1	[{"added": {}}]	20	1
196	2023-02-06 16:49:11.386615+00	2	News object (2)	1	[{"added": {}}]	20	1
197	2023-02-06 16:55:47.525127+00	3	News object (3)	1	[{"added": {}}]	20	1
198	2023-02-07 06:50:44.28167+00	19	Myata | Категория: Myata	2	[{"changed": {"fields": ["Subtitle uz", "Subtitle en", "Subtitle ru"]}}]	19	1
199	2023-02-07 09:00:23.332783+00	22	Barbaris qizil | Категория: Barbaris qizil	2	[{"changed": {"fields": ["Name uz", "Name en", "Name ru", "Subtitle uz", "Subtitle en", "Subtitle ru", "\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	19	1
200	2023-02-07 09:00:33.778712+00	26	Barbaris oq | Категория: Barbaris oq	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	19	1
201	2023-02-07 09:00:41.178765+00	25	Rich | Категория: Rich	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	19	1
202	2023-02-07 09:00:57.477093+00	24	Paket xon | Категория: Paket xon	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	19	1
203	2023-02-07 09:01:12.307453+00	23	Kaplya | Категория: Kaplya	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	19	1
204	2023-02-07 09:01:24.445788+00	22	Barbaris qizil | Категория: Barbaris qizil	2	[]	19	1
205	2023-02-07 09:01:33.70716+00	21	Bim Bom | Категория: Bim Bom	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	19	1
206	2023-02-07 09:01:42.063356+00	20	Notka | Категория: Notka	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	19	1
207	2023-02-07 09:01:51.555074+00	19	Myata | Категория: Myata	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	19	1
208	2023-02-07 09:01:58.826392+00	18	Chiko | Категория: Chiko	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	19	1
209	2023-02-07 10:15:30.749568+00	4	News object (4)	1	[{"added": {}}]	20	1
210	2023-02-07 10:20:18.048538+00	5	News object (5)	1	[{"added": {}}]	20	1
212	2023-02-07 13:57:44.705654+00	25	Rich | Категория: Bim Bom	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430"]}}]	19	1
213	2023-02-07 13:58:24.474095+00	24	Paket xon | Категория: Bim Bom	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430"]}}]	19	1
214	2023-02-07 13:58:40.049196+00	23	Kaplya | Категория: Barbaris qizil	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430"]}}]	19	1
215	2023-02-07 13:59:02.199926+00	19	Myata | Категория: Barbaris qizil	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430"]}}]	19	1
216	2023-02-07 13:59:17.428842+00	18	Chiko | Категория: Bim Bom	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430"]}}]	19	1
217	2023-02-07 13:59:29.853361+00	19	Kaplya	3		17	1
218	2023-02-07 13:59:29.855801+00	18	Rich	3		17	1
219	2023-02-07 13:59:29.856923+00	17	Paket xon	3		17	1
220	2023-02-07 13:59:29.857727+00	16	Myata	3		17	1
221	2023-02-07 13:59:29.85842+00	15	Chiko	3		17	1
222	2023-02-07 13:59:29.859252+00	13	Barbaris oq	3		17	1
223	2023-02-07 14:02:39.078022+00	11	Barbaris	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru"]}}]	17	1
224	2023-02-07 14:03:48.649758+00	10	Iris	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru"]}}]	17	1
225	2023-02-07 14:04:38.642413+00	12	Meva	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru"]}}]	17	1
226	2023-02-07 14:05:15.634631+00	11	Yalpiz	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru"]}}]	17	1
227	2023-02-11 05:32:22.206269+00	20	Notka | Категория: Iris	2	[{"changed": {"fields": ["\\u041c\\u0430\\u0441\\u0441\\u0430"]}}]	19	1
228	2023-02-11 05:37:07.293912+00	11	Karamel	2	[{"changed": {"fields": ["\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a uz", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a en", "\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a ru"]}}]	17	1
229	2023-02-27 09:30:20.031316+00	2	Banners object (2)	1	[{"added": {}}]	16	1
230	2023-02-27 09:30:40.454014+00	3	Banners object (3)	1	[{"added": {}}]	16	1
231	2023-02-27 10:04:23.285753+00	1	Banners object (1)	3		16	1
232	2023-03-08 13:17:08.889303+00	20	Notka | Категория: Iris	2	[{"changed": {"fields": ["Subtitle uz"]}}]	19	1
233	2023-03-08 13:58:35.576594+00	27	Choco Mix | Категория: Iris	1	[{"added": {}}]	19	1
234	2023-03-08 14:00:11.233094+00	27	Choco Mix | Категория: Iris	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	19	1
235	2023-03-08 14:05:31.375275+00	27	Choco Mix | Категория: Iris	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0432 \\u0431\\u043b\\u043e\\u043a\\u0435 TOP", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	19	1
236	2023-03-08 14:06:46.554778+00	27	Choco Mix | Категория: Iris	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0432 \\u0431\\u043b\\u043e\\u043a\\u0435 TOP", "\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	19	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	admin	logentry
7	account	emailaddress
8	account	emailconfirmation
9	socialaccount	socialaccount
10	socialaccount	socialapp
11	socialaccount	socialtoken
12	authtoken	token
13	authtoken	tokenproxy
14	thumbnail	kvstore
15	users	user
16	products	banners
17	products	productcategory
18	products	productcountry
19	products	product
20	news	news
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-01-18 21:57:06.251825+00
2	contenttypes	0002_remove_content_type_name	2023-01-18 21:57:06.2664+00
3	auth	0001_initial	2023-01-18 21:57:06.312509+00
4	auth	0002_alter_permission_name_max_length	2023-01-18 21:57:06.321992+00
5	auth	0003_alter_user_email_max_length	2023-01-18 21:57:06.329021+00
6	auth	0004_alter_user_username_opts	2023-01-18 21:57:06.334703+00
7	auth	0005_alter_user_last_login_null	2023-01-18 21:57:06.340744+00
8	auth	0006_require_contenttypes_0002	2023-01-18 21:57:06.343176+00
9	auth	0007_alter_validators_add_error_messages	2023-01-18 21:57:06.349217+00
10	auth	0008_alter_user_username_max_length	2023-01-18 21:57:06.355901+00
11	auth	0009_alter_user_last_name_max_length	2023-01-18 21:57:06.366192+00
12	auth	0010_alter_group_name_max_length	2023-01-18 21:57:06.376607+00
13	auth	0011_update_proxy_permissions	2023-01-18 21:57:06.383456+00
14	auth	0012_alter_user_first_name_max_length	2023-01-18 21:57:06.389612+00
15	users	0001_initial	2023-01-18 21:57:06.452202+00
16	account	0001_initial	2023-01-18 21:57:06.508807+00
17	account	0002_email_max_length	2023-01-18 21:57:06.532574+00
18	admin	0001_initial	2023-01-18 21:57:06.563678+00
19	admin	0002_logentry_remove_auto_add	2023-01-18 21:57:06.580117+00
20	admin	0003_logentry_add_action_flag_choices	2023-01-18 21:57:06.590105+00
21	authtoken	0001_initial	2023-01-18 21:57:06.608328+00
22	authtoken	0002_auto_20160226_1747	2023-01-18 21:57:06.649803+00
23	authtoken	0003_tokenproxy	2023-01-18 21:57:06.653923+00
24	news	0001_initial	2023-01-18 21:57:06.666173+00
25	products	0001_initial	2023-01-18 21:57:06.832116+00
26	sessions	0001_initial	2023-01-18 21:57:06.874685+00
27	sites	0001_initial	2023-01-18 21:57:06.886882+00
28	sites	0002_alter_domain_unique	2023-01-18 21:57:06.900014+00
29	sites	0003_set_site_domain_and_name	2023-01-18 21:57:06.930388+00
30	sites	0004_alter_options_ordering_domain	2023-01-18 21:57:06.937882+00
31	socialaccount	0001_initial	2023-01-18 21:57:07.092691+00
32	socialaccount	0002_token_max_lengths	2023-01-18 21:57:07.166021+00
33	socialaccount	0003_extra_data_default_dict	2023-01-18 21:57:07.181158+00
34	thumbnail	0001_initial	2023-01-18 21:57:07.205674+00
35	news	0002_remove_news_description_remove_news_title_and_more	2023-01-25 12:44:39.823879+00
36	products	0002_rename_name_product_name_uz_and_more	2023-01-25 12:44:39.96485+00
37	products	0003_productcategory_landscape_photo_and_more	2023-01-25 13:52:15.219744+00
38	products	0004_remove_product_packaging_photo_and_more	2023-02-01 11:05:14.656588+00
39	products	0005_product_subtitle_en_product_subtitle_ru_and_more	2023-02-06 16:23:42.482432+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
6v1rrfr69mnu5f5d0j1sh6jxojuu56o9	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pIGbQ:tnoz1hZU0PQZOZKgY8mJyJT_IEaLx9wnRXr-CMzgwCw	2023-02-01 22:08:16.730546+00
v9t8yx3e4om35j385wbl3zioxsat8s2x	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pIs7r:0m_M_0YhjGX41vtoHXMV4mfOkdrAv_rFqa0ANXHlxoQ	2023-02-03 14:12:15.646968+00
xn6o9kmm3jhdxdlhqo0dxs7imhuhvew8	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pIs9n:ZxSU5elrx_F27PWcTsqg__b5gK7lVYS-9uYy5pyYq1M	2023-02-03 14:14:15.806153+00
he3xo3vyn66v71j90kkmp3478eyab8b2	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pJASy:h9HEUR_RBhBOmrCfICIKDXn00FRiC9tohPa1EtXBWrQ	2023-02-04 09:47:16.275311+00
ipjebc8cb9l30ri9p7cjypxvvprextsw	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pJBSo:_wKzDVAIXMmqhT8hVMY4ZpZev9fMYBpBq_eq2uoFvto	2023-02-04 10:51:10.413287+00
6sjn8oqng3zsrtnuxw0q08x43ii2z0oc	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pKEcu:bWzeOch56yI8Op-MjxJXoRDbd2UjwWNfY9lIDcQ6Kxo	2023-02-07 08:25:56.797981+00
d6emva6ehxgn5xqbz4eivljmyotdvt8i	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pKb3H:H7tQZ7Uny28IERgAkarri2gFNITqfoEnd40AmayGmvs	2023-02-08 08:22:39.450106+00
st8xzkn7q2780bq49w549tw3tuhjrt97	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pKgEv:kiVfazkr5THUOpeBn5v5hudqhVkp4pDSnOp9RdJL8fE	2023-02-08 13:55:01.557265+00
xcjec86jtvsrb7netagkpqqxdghzpdyf	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pOCdl:prcQJxSJk8-8spezshWT7xM_zpO4_Ey38T08i5xxX5w	2023-02-18 07:07:13.633178+00
4o95twrjq8g3cybtwhopikosu67q8uwb	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pUNY8:ej0dOSL1oRn_8otE74ta2AeqcHnIHlylrf-U4vYTEwM	2023-03-07 07:58:56.753733+00
vt3wg4jd102q3l50eqx8snxa7hgw54tk	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pWYWU:td0tpiTxW2EO0ogNGZvYPrbBysGhLCDOIBxeT4BhpDo	2023-03-13 08:06:14.617651+00
32q31s7it6e1zxw9vhfejnni7amsah0y	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pWZoL:4ZrcMt3JppquRi_2EKuditfEA4R-Z8qpSdptb2XqcXM	2023-03-13 09:28:45.91202+00
pbyd3i5lk80c71jzls3o9d6felcsjua0	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pZtdI:tOAlUYrO76VO7FSrP90RORW1JibxXU_Jwf_z6uqNTbg	2023-03-22 13:15:04.080734+00
wyg5zvqffher4zxtev5t7fg4iqju3zjq	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pvDkT:H1sqX3akItfvcLnj9NS37nZah9gF_xO4C8DW9OCdF_s	2023-05-20 08:58:37.225565+00
li2xwlp50aii7qd0rvhn0bw6ec20nzns	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1pvVzj:t70suX5YR0qePzQhPf2qOrOQD-_9xoi0KYPczTCEAyw	2023-05-21 04:27:35.477395+00
7elme0j2k1w68vlyszughb0n6id44vl7	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1px3In:HVj70Patkgq2QX7FSCXRpgClm_FJ0QJHenvfsi50fLg	2023-05-25 10:13:37.549183+00
ncxshtnr2yemgts21d1m2q8mo6t2vwv5	.eJxVjMEOwiAQRP-FsyFAgQWP3v0GsltWqRpISnsy_rtt0oMmc5r3Zt4i4bqUtHae05TFWWhx-u0IxyfXHeQH1nuTY6vLPJHcFXnQLq8t8-tyuH8HBXvZ1reoshosIYaso47BeN4CAJ6jBc2jQ-M1OSByxMoPYMEpb4IyigOJzxfM0jbo:1qdpLz:zlfgsGri94avZdle8Ni0cHwClZ0np-loI5IWAcKkrWo	2023-09-20 10:01:43.689305+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.django_site (id, domain, name) FROM stdin;
1	notka.uz	Orzu Candy
2	api.notka.uz	Api Notka.uz
\.


--
-- Data for Name: news_news; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.news_news (id, photo, landscape_photo, created_on, description_en, description_ru, description_uz, title_en, title_ru, title_uz) FROM stdin;
1	news/news_None/image_2023-02-06_21-04-04.png	image_2023-02-06_21-04-04.png	2023-02-06	One of the best things about traveling is experiencing the local food scene. And in our book, candy counts as food. That’s especially true when you’re traveling with kids. What better way to get them excited about a journey than by speaking their language. Whether it’s taking a scenic ride through the Swiss Countryside on The Chocolate Train or experiencing the thrill of heart-pounding roller coasters at Hersheypark, here are seven candy experiences worth traveling for.	Одна из лучших вещей в путешествии — это знакомство с местной кухней. И в нашей книге конфеты считаются едой. Это особенно актуально, когда вы путешествуете с детьми. Что может быть лучше, чтобы заинтересовать их в путешествии, чем говорить на их языке. Будь то живописная поездка по швейцарской сельской местности на шоколадном поезде или острые ощущения от душераздирающих американских горок в Hersheypark, вот семь конфетных впечатлений, ради которых стоит отправиться в путешествие.	Sayohat qilishning eng yaxshi jihatlaridan biri bu mahalliy taomlar sahnasini boshdan kechirishdir. Bizning kitobimizda esa konfet oziq-ovqat hisoblanadi. Bu, ayniqsa, bolalar bilan sayohat qilganingizda to'g'ri keladi. Ularni sayohatga hayajonlantirishning o'z tillarida gapirishdan ko'ra yaxshiroq yo'l bor. Shokoladli poyezdda Shveytsariya qishloqlari bo‘ylab go‘zal sayohatda bo‘lasizmi yoki Hersheyparkda yurakni urib turuvchi rolikli qayiqlarning hayajonini boshdan kechirasizmi, bu yerda sayohat qilishga arziydigan yettita shirinlik tajribasi mavjud.	Get Your Sweet Fix with Notka Candies - The Ultimate Destination for Candy Lovers!	Получите свое сладкое лекарство с Notka Candies - идеальное место для любителей конфет!	Notka konfetlari bilan shirin tuzating - konfet sevuvchilar uchun eng yaxshi manzil!
2	news/news_None/image_2023-02-06_21-49-41-compressed.jpg	image_2023-02-06_21-49-41-compressed.jpg	2023-02-06	Confections and desserts are favorite treats in nearly every culture. Because of this, they’re the frontline items when it comes to trends affecting all foods—and they take the biggest hit when the top trends directly affect the purpose behind a sweet treat; that of comfort and indulgence.\r\n\r\nThe health and “green” movements, specifically, would seem opposed to all that is gooey and chocolaty. Yet the ingredients and techniques going into creating today’s sweet afters allow confectioners to meet these consumer demands, and more. Therefore, sweet indulgences remain a rapidly growing category.	Кондитерские изделия и десерты являются любимым лакомством почти в каждой культуре. Из-за этого они находятся на переднем крае, когда речь идет о тенденциях, затрагивающих все продукты питания, и они получают наибольший удар, когда основные тенденции напрямую влияют на цель сладкого лакомства; это комфорт и снисходительность. Здоровые и «зеленые» движения, в частности, кажутся противоположными всему липкому и шоколадному. Тем не менее, ингредиенты и методы, используемые для создания сегодняшних сладких десертов, позволяют кондитерам удовлетворить эти и многие другие требования потребителей. Таким образом, сладкие индульгенции остаются быстрорастущей категорией.	Qandolat va shirinliklar deyarli har bir madaniyatda sevimli taomdir. Shu sababli, ular barcha oziq-ovqatlarga ta'sir qiluvchi tendentsiyalar haqida gap ketganda, birinchi o'rinni egallaydilar va eng yaxshi tendentsiyalar shirin taomning maqsadiga bevosita ta'sir qilganda ular eng katta zarbani oladilar; bu qulaylik va indulgensiya. Salomatlik va "yashil" harakatlar, ayniqsa, shokoladli va shokoladli narsalarga qarama-qarshi bo'lib tuyuladi. Shunga qaramay, bugungi shirin taomlarni yaratishda ishlatiladigan ingredientlar va texnikalar qandolatchilarga iste'molchilarning ushbu talablarini qondirishga imkon beradi va boshqalar. Shu sababli, shirin indulgentsiyalar tez o'sib borayotgan toifa bo'lib qolmoqda.	Indulge in a World of Sweet Treats with Notka Candies - Quality Sweets and Candies!	Окунитесь в мир сладостей вместе с Notka Candies - качественные сладости и конфеты!	Notka konfetlari - sifatli shirinliklar va konfetlar bilan shirin taomlar olamidan zavqlaning!
3	news/news_None/image_2023-02-06_21-55-48.png	image_2023-02-06_21-55-48.png	2023-02-06	Candy, known also as sweets and confectionery, has a long history as a familiar food treat that is available in many varieties. Candy varieties are influenced by the size of the sugar crystals, aeration, sugar concentrations, colour and the types of sugar used. Simple sugar or sucrose is turned into candy by dissolving it in water, concentrating this solution through cooking and allowing the mass either to form a mutable solid or to recrystallize. Maple sugar candy has been made in this way for thousands of years, with concentration taking place from both freezing and heating.	Конфеты, известные также как сладости и кондитерские изделия, имеют долгую историю как знакомое лакомство, доступное во многих вариантах. На сорта конфет влияют размер кристаллов сахара, аэрация, концентрация сахара, цвет и типы используемого сахара. Простой сахар или сахарозу превращают в конфеты, растворяя их в воде, концентрируя этот раствор путем варки и позволяя массе либо образовывать изменчивое твердое вещество, либо перекристаллизовывать. Леденцы из кленового сахара производились таким образом на протяжении тысячелетий, при этом концентрация происходила как при замораживании, так и при нагревании.	Shirinliklar va qandolat mahsulotlari sifatida ham tanilgan konfet ko'plab navlarda mavjud bo'lgan tanish taom sifatida uzoq tarixga ega. Shakar navlariga shakar kristallarining kattaligi, shamollatish, shakar konsentratsiyasi, rangi va ishlatiladigan shakar turlari ta'sir qiladi. Oddiy shakar yoki saxaroza uni suvda eritib, bu eritmani pishirish orqali konsentratsiyalash va massaning o'zgaruvchan qattiq hosil bo'lishiga yoki qayta kristallanishiga imkon berish orqali konfetga aylanadi. Maple shakar konfeti ming yillar davomida shu tarzda ishlab chiqarilgan, konsentratsiya ham muzlatish, ham isitish natijasida hosil bo'ladi.	Say Goodbye to Boring Candies, Hello to Notka Candies - Unique Flavors and Quality Ingredients!	Попрощайтесь со скучными конфетами, привет конфетам Notka - Уникальные вкусы и качественные ингредиенты	Zerikarli konfetlar bilan xayrlashing, Notka konfetlari bilan salomlashing - noyob lazzat va sifatli ingredientlar!
4	news/news_None/image_2023-02-07_15-16-31.png	image_2023-02-07_15-16-31.png	2023-02-07	If you're a cookie-and-candy-craver, don't despair. Sweets can be part of a healthy, lifelong eating pattern. But for the least harm and -- don't forget this -- the fullest enjoyment, they should be eaten in moderation. That means in small amounts, or only a couple of times a week. Even a woman who has made a career out of eating candy admits they have cut back their consumption to one day a week. Hilary Liftin, blessedly svelte and cavity free, wrote the critically acclaimed.	Если вы любитель печенья и конфет, не отчаивайтесь. Сладости могут быть частью здорового питания на всю жизнь. Но для наименьшего вреда и — не забывайте об этом — для наибольшего удовольствия их следует есть в меру. Это означает, что в небольших количествах или только пару раз в неделю. Даже женщина, сделавшая карьеру на поедании конфет, признается, что сократила их потребление до одного дня в неделю. Хилари Лифтин, благословенно стройная и без кариеса, написала книгу, получившую признание критиков.	Agar siz pechenye va konfet iste'mol qiladigan bo'lsangiz, tushkunlikka tushmang. Shirinliklar sog'lom, umrbod ovqatlanish tartibining bir qismi bo'lishi mumkin. Ammo eng kam zarar va - buni unutmang - to'liq lazzatlanish uchun ularni me'yorida iste'mol qilish kerak. Bu oz miqdorda yoki haftada bir necha marta degan ma'noni anglatadi. Hatto konfet yeyish orqali martaba qilgan ayol ham iste'mol qilishni haftada bir kunga qisqartirganini tan oladi. Xillari Liftin, xushchaqchaq va bo'shliqsiz, tanqidchilar tomonidan e'tirof etilgan.	Treat Yourself to Something Sweet with Notka Candies - The Perfect Pick-Me-Up!	Побалуйте себя чем-нибудь сладким с конфетами Notka - Идеальный выбор	Notka konfetlari bilan o'zingizni shirin narsa bilan siylang - mukammal Pick-Me-Up!
5	news/news_None/image_2023-02-07_15-21-04-compressed.jpg	image_2023-02-07_15-21-04-compressed.jpg	2023-02-07	If you ask any dentist, they will tell you that the best candy for your teeth is no candy at all because of the high sugar content. However, we all know asking someone to refrain from sweets during the fall and winter holidays is a waste of breath. The good news is some candy is less damaging to your dental health and can be enjoyed in moderation.\r\n\r\nChocolate: Chocolate is by far the best candy for teeth. This is a good thing since it is the most popular candy and is found in many holiday desserts. Chocolate easily washes off the teeth, meaning it doesn’t stick around to cause cavities or other types of tooth damage. The best kind of chocolate for your dental health is dark chocolate because it contains less sugar. Some studies have even found that dark chocolate contains compounds that can help harden tooth enamel and provide plaque-fighting benefits. So, when you are picking out candy at a party or buying chocolate to make a dessert, opt for dark chocolate.	Если вы спросите любого стоматолога, он скажет вам, что лучшая конфета для ваших зубов — это вообще не конфета из-за высокого содержания сахара. Однако все мы знаем, что просить кого-то воздержаться от сладкого во время осенних и зимних праздников — пустая трата времени. Хорошей новостью является то, что некоторые конфеты менее вредны для здоровья ваших зубов, и ими можно наслаждаться в умеренных количествах.	Agar biron bir tish shifokoridan so'rasangiz, ular sizga tishlaringiz uchun eng yaxshi konfet shakar miqdori yuqori bo'lganligi sababli hech qanday konfet emasligini aytadilar. Biroq, hammamiz bilamizki, kuzgi va qishki ta'til paytida kimdandir shirinliklardan voz kechishni so'rash nafasni isrof qilishdir. Yaxshi xabar shundaki, ba'zi konfetlar tish sog'lig'iga kamroq zarar etkazadi va uni me'yorida iste'mol qilish mumkin.	Satisfy Your Sweet Tooth with Notka Candies - A Range of Candies and Sweets for Every Taste!	Удовлетворите своих сладкоежек с конфетами «Нотка» - ассортимент конфет и сладостей на любой вкус!	Notka konfetlari bilan shirin tishingizni qondiring - har qanday lazzat uchun konfetlar va shirinliklar assortimenti!
\.


--
-- Data for Name: products_banners; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.products_banners (id, photo) FROM stdin;
2	banners/banner_None/notka1.png
3	banners/banner_None/notka3.png
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.products_product (id, "order", name_uz, photo, weight, artikul, carbohydrates, calories, fats, is_top, category_id, country_id, _order, description_en, description_ru, description_uz, name_en, name_ru, top_photo, subtitle_en, subtitle_ru, subtitle_uz) FROM stdin;
19	1	Myata	products/product_None/ьнфе_tfxczbX.png	1	6	98	390	100	t	11	4	0	Sugar, starch molasses, citric acid, coloring, flavoring agent. Storage conditions The product should be kept at a temperature of (18±3)°C and a relative humidity of air not exceeding 75%. Shelf life: 6 months.	Сахар, патока крахмальная, кислота лимонная, краситель, ароматизатор. Условия хранения Продукт следует хранить при температуре (18±3)°С и относительной влажности воздуха не более 75%. Срок годности: 6 месяцев.	Shakar, kraxmal shinnisi, limon kislotasi, bo'yagich, hushbo'ylashtirgich. Saqlash sharoiti mahsulot (18±3)°C haroratda va 75% dan ortiq bo'lmagan havoning nisbiy namlikda saqlansin. Yaroqlilik muddati: 6 oy.	Myata	Мята	products/product_None/ьнфе_2_guE0y9k.png	Tropical flavored caramel	Карамель с тропическим вкусом	Tropik ta'mli karamel
20	2	Notka	products/product_None/notka_1_Rqmsgkm.png	0.5	6	98	390	100	t	10	4	0	Sugar, starch molasses, citric acid, coloring, flavoring agent. Storage conditions The product should be kept at a temperature of (18±3)°C and a relative humidity of air not exceeding 75%. Shelf life: 6 months.	Сахар, патока крахмальная, кислота лимонная, краситель, ароматизатор. Условия хранения Продукт следует хранить при температуре (18±3)°С и относительной влажности воздуха не более 75%. Срок годности: 6 месяцев.	Shakar, kraxmal shinnisi, limon kislotasi, bo'yagich, hushbo'ylashtirgich. Saqlash sharoiti mahsulot (18±3)°C haroratda va 75% dan ortiq bo'lmagan havoning nisbiy namlikda saqlansin. Yaroqlilik muddati: 6 oy.	Notka	Нотка	products/product_None/notka_1_2_BWP6xCW.png	Toffee flavored toffee	Тоффи со вкусом ириски	Shokalad ta'mli iris
18	0	Chiko	products/product_None/chiko_mUGgqUk.png	1	6	98	390	100	t	12	4	0	Sugar, starch molasses, citric acid, coloring, flavoring agent. Storage conditions The product should be kept at a temperature of (18±3)°C and a relative humidity of air not exceeding 75%. Shelf life: 6 months.	Сахар, патока крахмальная, кислота лимонная, краситель, ароматизатор. Условия хранения Продукт следует хранить при температуре (18±3)°С и относительной влажности воздуха не более 75%. Срок годности: 6 месяцев.	Shakar, kraxmal shinnisi, limon kislotasi, bo'yagich, hushbo'ylashtirgich. Saqlash sharoiti mahsulot (18±3)°C haroratda va 75% dan ortiq bo'lmagan havoning nisbiy namlikda saqlansin. Yaroqlilik muddati: 6 oy.	Chiko	Чико	products/product_None/chiko_2_3ZB1x4q.png	A collection of different fruits	Коллекция различных фруктов	Turli xil mevalar jamlanmasi
21	3	Bim Bom	products/product_None/bim_bom_2_lP2zlAi.png	1	6	98	390	100	t	12	4	0	Sugar, starch molasses, citric acid, coloring, flavoring agent. Storage conditions The product should be kept at a temperature of (18±3)°C and a relative humidity of air not exceeding 75%. Shelf life: 6 months.	Сахар, патока крахмальная, кислота лимонная, краситель, ароматизатор. Условия хранения Продукт следует хранить при температуре (18±3)°С и относительной влажности воздуха не более 75%. Срок годности: 6 месяцев.	Shakar, kraxmal shinnisi, limon kislotasi, bo'yagich, hushbo'ylashtirgich. Saqlash sharoiti mahsulot (18±3)°C haroratda va 75% dan ortiq bo'lmagan havoning nisbiy namlikda saqlansin. Yaroqlilik muddati: 6 oy.	Bim Bom	Бим Бом	products/product_None/bim_bom_3_OWisPzN.png	A collection of different fruits	Коллекция различных фруктов	Turli xil mevalar jamlanmasi
22	4	Barbaris qizil	products/product_None/barbaris_1_I1FTbZQ.png	1	6	98	390	100	t	11	4	0	Sugar, starch molasses, citric acid, coloring, flavoring agent. Storage conditions The product should be kept at a temperature of (18±3)°C and a relative humidity of air not exceeding 75%. Shelf life: 6 months.	Сахар, патока крахмальная, кислота лимонная, краситель, ароматизатор. Условия хранения Продукт следует хранить при температуре (18±3)°С и относительной влажности воздуха не более 75%. Срок годности: 6 месяцев.	Shakar, kraxmal shinnisi, limon kislotasi, bo'yagich, hushbo'ylashtirgich. Saqlash sharoiti mahsulot (18±3)°C haroratda va 75% dan ortiq bo'lmagan havoning nisbiy namlikda saqlansin. Yaroqlilik muddati: 6 oy.	Barbaris red	Барбарис красный	products/product_None/barbaris_1_2_HRaKj5f.png	A taste that adults appreciate	Вкус, который оценят взрослые	Kattalar qadrlagan ta'm
27	9	Choco Mix	products/product_27/jeg_gdldUxb.png	3	6	98	390	100	t	10	4	1	Sugar, starch molasses, citric acid, coloring, flavoring agent. Storage conditions The product should be kept at a temperature of (18±3)°C and a relative humidity of air not exceeding 75%. Shelf life: 6 months.	Сахар, патока крахмальная, кислота лимонная, краситель, ароматизатор. Условия хранения Продукт следует хранить при температуре (18±3)°С и относительной влажности воздуха не более 75%. Срок годности: 6 месяцев.	Shakar, kraxmal shinnisi, limon kislotasi, bo'yagich, hushbo'ylashtirgich. Saqlash sharoiti mahsulot (18±3)°C haroratda va 75% dan ortiq bo'lmagan havoning nisbiy namlikda saqlansin. Yaroqlilik muddati: 6 oy.	Choco Mix	Choco Mix	products/product_27/jeg_dSq8iFo.png	Toffee flavored toffee	Тоффи со вкусом ириски	Shokalad ta'mli iris
26	8	Barbaris oq	products/product_None/barbaris_2.png	1	6	98	390	100	f	11	4	0	Sugar, starch molasses, citric acid, coloring, flavoring agent. Storage conditions The product should be kept at a temperature of (18±3)°C and a relative humidity of air not exceeding 75%. Shelf life: 6 months.	Сахар, патока крахмальная, кислота лимонная, краситель, ароматизатор. Условия хранения Продукт следует хранить при температуре (18±3)°С и относительной влажности воздуха не более 75%. Срок годности: 6 месяцев.	Shakar, kraxmal shinnisi, limon kislotasi, bo'yagich, hushbo'ylashtirgich. Saqlash sharoiti mahsulot (18±3)°C haroratda va 75% dan ortiq bo'lmagan havoning nisbiy namlikda saqlansin. Yaroqlilik muddati: 6 oy.	Barbaris white	Барбарис белый	products/product_None/barbaris_2_2.png	Barbaris flavored candy	Конфеты со вкусом Барбарис	Barbaris ta'mli konfet
25	7	Rich	products/product_None/Rich_2_R13ISfK.png	1	6	98	390	100	f	12	4	0	Sugar, starch molasses, citric acid, coloring, flavoring agent. Storage conditions The product should be kept at a temperature of (18±3)°C and a relative humidity of air not exceeding 75%. Shelf life: 6 months.	Сахар, патока крахмальная, кислота лимонная, краситель, ароматизатор. Условия хранения Продукт следует хранить при температуре (18±3)°С и относительной влажности воздуха не более 75%. Срок годности: 6 месяцев.	Shakar, kraxmal shinnisi, limon kislotasi, bo'yagich, hushbo'ylashtirgich. Saqlash sharoiti mahsulot (18±3)°C haroratda va 75% dan ortiq bo'lmagan havoning nisbiy namlikda saqlansin. Yaroqlilik muddati: 6 oy.	Rich	Рич	products/product_None/Rich_3_Ujl4iwu.png	Tropical flavored caramel	Карамель с тропическим вкусом	Tropik ta'mli karamel
24	6	Paket xon	products/product_24/paket_xon.png	1	6	98	390	100	f	12	4	0	Sugar, starch molasses, citric acid, coloring, flavoring agent. Storage conditions The product should be kept at a temperature of (18±3)°C and a relative humidity of air not exceeding 75%. Shelf life: 6 months.	Сахар, патока крахмальная, кислота лимонная, краситель, ароматизатор. Условия хранения Продукт следует хранить при температуре (18±3)°С и относительной влажности воздуха не более 75%. Срок годности: 6 месяцев.	Shakar, kraxmal shinnisi, limon kislotasi, bo'yagich, hushbo'ylashtirgich. Saqlash sharoiti mahsulot (18±3)°C haroratda va 75% dan ortiq bo'lmagan havoning nisbiy namlikda saqlansin. Yaroqlilik muddati: 6 oy.	Paket xon	Пакет хон	products/product_24/paket_2.png	\N	\N	\N
23	5	Kaplya	products/product_23/лфзднф.png	1	6	98	390	100	f	11	4	0	Sugar, starch molasses, citric acid, coloring, flavoring agent. Storage conditions The product should be kept at a temperature of (18±3)°C and a relative humidity of air not exceeding 75%. Shelf life: 6 months.	Сахар, патока крахмальная, кислота лимонная, краситель, ароматизатор. Условия хранения Продукт следует хранить при температуре (18±3)°С и относительной влажности воздуха не более 75%. Срок годности: 6 месяцев.	Shakar, kraxmal shinnisi, limon kislotasi, bo'yagich, hushbo'ylashtirgich. Saqlash sharoiti mahsulot (18±3)°C haroratda va 75% dan ortiq bo'lmagan havoning nisbiy namlikda saqlansin. Yaroqlilik muddati: 6 oy.	Kaplya	Капля	products/product_23/kaplya_1_2.png	\N	\N	\N
\.


--
-- Data for Name: products_productcategory; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.products_productcategory (id, title_en, title_ru, title_uz, photo, slider_photo) FROM stdin;
11	Caramel	Карамель	Karamel	barbaris_1.png	87_XwR7KoN.png
10	Iris	Ирис	Iris	notka_1_iI3bxuW.png	f_2.png
12	Fruit	Фрукты	Meva	bim_bom_2_eNfBWpU.png	hjp.png
\.


--
-- Data for Name: products_productcountry; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.products_productcountry (id, name_en, name_ru, name_uz) FROM stdin;
4	Uzbekistan	Узбекистан	Uzbekistan
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||dc40cb5d0d6874b95c10b41902d5fca6	{"name": "banners/banner_None/image_53.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1760, 990]}
sorl-thumbnail||image||f7f51437bed27820339c88b5c07ceb23	{"name": "cache/0f/96/0f966779dc86800f8e46e6eebbe6e607.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 200]}
sorl-thumbnail||image||708c5a8380f40ce4405dd1a1a38963be	{"name": "products/product_None/bim_bom.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||5c71fea079b437022bd7668f4984b6ed	{"name": "cache/60/03/60032b52fdc38b5986dbe67a9c6d1944.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||16571365ec1ccf07ecf92032dd28832d	{"name": "products/product_None/chikko.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||affce449d60504eb976ecba53ea4d684	{"name": "cache/fb/8d/fb8d7729404765f6a908993a7a97dee4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||95097466586d5a8b0e9f419159738e42	{"name": "products/product_None/yashil.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||4d043cf457c58eaf8e321b8e345fd7e1	{"name": "cache/9b/96/9b96402e4a9639361002ea7c6b65d938.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||b8451a46ccf9ec714ba823fc40ce195b	{"name": "products/product_None/kapla.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||003303696ee44dbc0f9109dc03cbd45c	{"name": "cache/3b/7c/3b7c2534e70403d79a8f3e84e08814f6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||c4a16ba70c3d9a86298d59faed9eb681	{"name": "products/product_None/rich.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||016613237cb1532e4e523d76c7340da0	{"name": "cache/9f/65/9f6519e2bbf7abde3eb74535bd0d3f14.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||1db09143401c05aaf992d799aa326b3a	{"name": "products/product_None/notka_2laNoEj.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [6000, 6000]}
sorl-thumbnail||image||dd17528b188240e678005ec990e28d4c	{"name": "cache/dd/7e/dd7e17a806e356768905dd633c8108cf.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||da824e93b362308350453a485f80ad1d	{"name": "cache/c8/20/c8203aaefa3a79721ec8f6ae06a0673e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||708c5a8380f40ce4405dd1a1a38963be	["5c71fea079b437022bd7668f4984b6ed", "da824e93b362308350453a485f80ad1d"]
sorl-thumbnail||image||1b993ef5035e205b7a230a4c4012b402	{"name": "cache/5b/45/5b45a83676b9f97cc370f52c693d89b1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||c4a16ba70c3d9a86298d59faed9eb681	["016613237cb1532e4e523d76c7340da0", "1b993ef5035e205b7a230a4c4012b402"]
sorl-thumbnail||image||0a877991003264d7923fc8ee629f3b7d	{"name": "cache/73/04/73042b86cab4ff8d94785492f2113cfe.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||16571365ec1ccf07ecf92032dd28832d	["affce449d60504eb976ecba53ea4d684", "0a877991003264d7923fc8ee629f3b7d"]
sorl-thumbnail||image||02627890599eff2b777b899bb029fb03	{"name": "cache/8c/d3/8cd37694f3bcb327831f4eae03c3b319.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||95097466586d5a8b0e9f419159738e42	["02627890599eff2b777b899bb029fb03", "4d043cf457c58eaf8e321b8e345fd7e1"]
sorl-thumbnail||image||0c9871112f420b27940dc27434a356cf	{"name": "cache/d7/83/d7837809a381e8ee5885b75628077604.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||13b74f3159d8ea0aac25bbad901c8260	["ca2960e23742ddc43a21ae50564c14f4"]
sorl-thumbnail||image||ba04ae8ed47cc34de6abd7d2025e9035	{"name": "cache/d7/83/d7837809a381e8ee5885b75628077604_l5Q9HOC.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||image||7a0f714e5f86aa5bfc571158a030791c	{"name": "cache/e2/7c/e27c48226b4c92f86b869ba64bedee5d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||b8451a46ccf9ec714ba823fc40ce195b	["7a0f714e5f86aa5bfc571158a030791c", "003303696ee44dbc0f9109dc03cbd45c"]
sorl-thumbnail||thumbnails||1db09143401c05aaf992d799aa326b3a	["dd17528b188240e678005ec990e28d4c", "0c9871112f420b27940dc27434a356cf", "ba04ae8ed47cc34de6abd7d2025e9035"]
sorl-thumbnail||image||c0dbfd01da94292e9913d1d207eeea71	{"name": "cache/09/c3/09c30a15571b0cb880dd10fbf7fa4788.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||dc40cb5d0d6874b95c10b41902d5fca6	["f7f51437bed27820339c88b5c07ceb23", "c0dbfd01da94292e9913d1d207eeea71"]
sorl-thumbnail||image||90ac5cfd5d7d972d956b80d013525c47	{"name": "products/product_None/barbaris.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||41ac4c411889d8edf14f7139ecd93ca4	{"name": "cache/44/f9/44f9a87f849cfc1ce7db4566cb10aeed.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||90ac5cfd5d7d972d956b80d013525c47	["41ac4c411889d8edf14f7139ecd93ca4"]
sorl-thumbnail||image||ec767a6e73195788a74f7ab444fc2a60	{"name": "products/product_None/notka_jEAE1af.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [6000, 6000]}
sorl-thumbnail||image||8de11a185bc2813830c2f359285cad7a	{"name": "chikko_nk88Epc.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||e969a9d51b84519f69a71a4b03b84fe9	{"name": "cache/a1/67/a167c2c96bbaf0c4390fa23ed2ceb183.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||8de11a185bc2813830c2f359285cad7a	["e969a9d51b84519f69a71a4b03b84fe9"]
sorl-thumbnail||image||1f1cd86bc607bcd5eb08b6090d2f05e9	{"name": "chikko_wSsNXOH.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||fd2513e2cf7de18e30a0a9d3e54dd2c3	{"name": "cache/a5/b4/a5b4bc437248fb46fe3a3e46f7eaf9bb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||1f1cd86bc607bcd5eb08b6090d2f05e9	["fd2513e2cf7de18e30a0a9d3e54dd2c3"]
sorl-thumbnail||image||75422667c411962baff9f545ee51c9d5	{"name": "cache/8b/62/8b62d8c2b52e7891087209c810c97bba.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||ec767a6e73195788a74f7ab444fc2a60	["75422667c411962baff9f545ee51c9d5"]
sorl-thumbnail||image||49068cd95d11d192f27a4d03786280db	{"name": "products/product_None/bim_bom_j8G6RQd.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||ca95ccd94656cd3808ef5ebd8476605e	{"name": "cache/e7/22/e7228bd288c68b7ae1a1ddd19577c242.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||49068cd95d11d192f27a4d03786280db	["ca95ccd94656cd3808ef5ebd8476605e"]
sorl-thumbnail||image||f2dcea1341ac8054aa257d40e4741ad1	{"name": "products/product_None/notka.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [6000, 6000]}
sorl-thumbnail||image||caa9dd5dab852014a92fc848a291e3f7	{"name": "cache/59/de/59de0aeae15b48a20437fd793221dc52.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||f2dcea1341ac8054aa257d40e4741ad1	["caa9dd5dab852014a92fc848a291e3f7"]
sorl-thumbnail||image||9823dbbdbe713bc54f8c65d4f56a74fc	{"name": "products/product_None/qizil.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||8041e616974910fb463e378c93dafe10	{"name": "cache/66/2d/662d2e7eed69ef42543cb92ea4731747.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||9823dbbdbe713bc54f8c65d4f56a74fc	["8041e616974910fb463e378c93dafe10"]
sorl-thumbnail||image||9b99e9521a1b755205b5034d860784f5	{"name": "products/product_None/paket.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||3d7c0c08447e1e7daf9387322c29c748	{"name": "cache/b9/61/b961729fa93d64e12bfe4a2a51f91d97.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||9b99e9521a1b755205b5034d860784f5	["3d7c0c08447e1e7daf9387322c29c748"]
sorl-thumbnail||image||b17ece9194c92f894f6fc36c81750e84	{"name": "bg451.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [662, 382]}
sorl-thumbnail||image||21b412bd56e07c5930b5a128934a4e5d	{"name": "cache/5d/6c/5d6c94dd8e119eae3bb139fda78582fa.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||b17ece9194c92f894f6fc36c81750e84	["21b412bd56e07c5930b5a128934a4e5d"]
sorl-thumbnail||image||6f4697575173c3382c736ffcf37425fc	{"name": "bg453.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [800, 450]}
sorl-thumbnail||image||c046b25fe0d9c34858c3e58f86b637f7	{"name": "cache/d5/d0/d5d004cdb81513e9eeeeec4dd95124c4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||6f4697575173c3382c736ffcf37425fc	["c046b25fe0d9c34858c3e58f86b637f7"]
sorl-thumbnail||image||5aef3c84d18a7f28959e00de530c89a1	{"name": "kapla.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||4e617163b4139de2ae5a122ad963d273	{"name": "cache/4e/f3/4ef3469d35070fc2d0fe4bdba7d0a428.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||5aef3c84d18a7f28959e00de530c89a1	["4e617163b4139de2ae5a122ad963d273"]
sorl-thumbnail||image||59a1d32b5d6529631b79714c187d2521	{"name": "kapla_KVDIi0G.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||dfa0d4be7435234a513ba240af2c79ec	{"name": "cache/1e/85/1e85fce3a82c6321d4ec0805d47ae1cf.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||59a1d32b5d6529631b79714c187d2521	["dfa0d4be7435234a513ba240af2c79ec"]
sorl-thumbnail||image||0eca6d6ad0df34502f3b5a9bacdef3aa	{"name": "chikko.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||de613fd94fb1fec4f4737573e824dbd0	{"name": "cache/6b/03/6b0321893dab95094b8d8d3b002749bf.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||0eca6d6ad0df34502f3b5a9bacdef3aa	["de613fd94fb1fec4f4737573e824dbd0"]
sorl-thumbnail||image||1623655a326b6a17a30bcbc173f7cd25	{"name": "chikko_FeZ4pjX.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||4bc42d97def8ef2042391ccfa242c5d3	{"name": "cache/a5/bb/a5bbbdae7f5cc7ab3782697843fd458a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||1623655a326b6a17a30bcbc173f7cd25	["4bc42d97def8ef2042391ccfa242c5d3"]
sorl-thumbnail||image||26d4fc331bcee1b437d8fe4b66211c00	{"name": "barbaris.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||41150719b3738794ba2161eecfc86d6e	{"name": "cache/a7/e3/a7e3954025760d139f1242c6335d40c6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||26d4fc331bcee1b437d8fe4b66211c00	["41150719b3738794ba2161eecfc86d6e"]
sorl-thumbnail||image||036d1df134bcf3092f1e92c19844fc9c	{"name": "qizil.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||0ebfdfa8e8e8a3205b330b315cedf966	{"name": "cache/71/1d/711d2e854162132bc3a21af864cce065.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||036d1df134bcf3092f1e92c19844fc9c	["0ebfdfa8e8e8a3205b330b315cedf966"]
sorl-thumbnail||image||10c4423ebd2907200c25e434a4467e3b	{"name": "kapla_eJIe8yL.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||1e348178d1cd1918a42c3f068c5d4bb3	{"name": "cache/21/b0/21b0b6958d3d7c9f5e34b6174a9c8753.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||10c4423ebd2907200c25e434a4467e3b	["1e348178d1cd1918a42c3f068c5d4bb3"]
sorl-thumbnail||image||13b74f3159d8ea0aac25bbad901c8260	{"name": "kapla_odx3JoV.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||ca2960e23742ddc43a21ae50564c14f4	{"name": "cache/9e/44/9e448b9f8eeba7461a1faa85ceb218fa.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||image||e17dd09df00b86d579ddcaa804afd153	{"name": "barbaris_XUgLtjP.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||32a9dc30170c38d18791d0ef94c4bd4e	{"name": "cache/d4/6d/d46def3173b46254ccfc4204250ac3a1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||e17dd09df00b86d579ddcaa804afd153	["32a9dc30170c38d18791d0ef94c4bd4e"]
sorl-thumbnail||image||88e1a4803969e76a4a08619f35b49f48	{"name": "qizil_qXkwhBD.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||150e87c53867bac9aba059b9f4bdbec6	{"name": "cache/e5/bf/e5bffba763ec56fc439aad014667b067.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||88e1a4803969e76a4a08619f35b49f48	["150e87c53867bac9aba059b9f4bdbec6"]
sorl-thumbnail||image||c74ae709562996bc3131997cd4c373c2	{"name": "yashil.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||4442f0d3ad16abfd580018b3ca71d3a5	{"name": "cache/6e/1f/6e1f13f82c0df88d6f29a70f55a6677a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||c74ae709562996bc3131997cd4c373c2	["4442f0d3ad16abfd580018b3ca71d3a5"]
sorl-thumbnail||image||dbc18d9039129c17a6bca4a62bcc8077	{"name": "yashil_XQu5qrD.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||f794903f9dea2b02b1b37f8499446ad3	{"name": "cache/bb/c7/bbc7faba47ce9b692290b22b7ea78aa7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||dbc18d9039129c17a6bca4a62bcc8077	["f794903f9dea2b02b1b37f8499446ad3"]
sorl-thumbnail||image||60822cf8e8f636b5ee5fe7ebf186c5b2	{"name": "kapla_pvSHAwG.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||561da8270e317c6c1452b8f5f270e680	{"name": "cache/a9/76/a976b941f1a832f8761eacead8cab526.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||60822cf8e8f636b5ee5fe7ebf186c5b2	["561da8270e317c6c1452b8f5f270e680"]
sorl-thumbnail||image||970721541d8c0a70d57c56b817a1bac4	{"name": "kapla_RSvR7nC.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||e465fcfc440400b70f77722a86933d90	{"name": "cache/9b/b9/9bb91d342443a12f3162d10a2ca39fe5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||970721541d8c0a70d57c56b817a1bac4	["e465fcfc440400b70f77722a86933d90"]
sorl-thumbnail||image||e70b1fdb720d877b10dd4d072c411470	{"name": "kapla_hh9nTst.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||f4a901c0e4a0e15ae2849163f173a428	{"name": "cache/e6/ea/e6ea4c8ea0c6b0d621f4a65acaaacc65.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||e70b1fdb720d877b10dd4d072c411470	["f4a901c0e4a0e15ae2849163f173a428"]
sorl-thumbnail||image||3edda13c8260f90ed02ae5e21c2502d0	{"name": "kapla_77R0zCZ.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||e8740cd131016c8c06105c0ecfe6ab8a	{"name": "cache/2d/8c/2d8ce7588bcd98420e15892227e6f8e4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||3edda13c8260f90ed02ae5e21c2502d0	["e8740cd131016c8c06105c0ecfe6ab8a"]
sorl-thumbnail||image||e77261d69b4d27bb1296d3654a79d2a7	{"name": "kapla_MW6Ecxz.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||a3e70ee35ac5a203116d7fb87b18c6e5	{"name": "cache/4b/0b/4b0b0ffc320340635f33e05e6029c2a0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||e77261d69b4d27bb1296d3654a79d2a7	["a3e70ee35ac5a203116d7fb87b18c6e5"]
sorl-thumbnail||image||60dffa8c3f6b5c4ca21963929e489d05	{"name": "kapla_WIp55ZF.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||d313505527f7b05b9a13e6cfe8e7fab6	{"name": "cache/79/0d/790d2d2da4d7b65b042de95417a169f4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||60dffa8c3f6b5c4ca21963929e489d05	["d313505527f7b05b9a13e6cfe8e7fab6"]
sorl-thumbnail||image||dc7dda120cef05f13c821c83bd8919f8	{"name": "chikko_PHnIVAj.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||2d6a333150fda6ce4e9539434a771bec	{"name": "cache/6e/49/6e4949b7dfbb30b32a170a1fc4a947c0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||dc7dda120cef05f13c821c83bd8919f8	["2d6a333150fda6ce4e9539434a771bec"]
sorl-thumbnail||image||648d085856793857a796dd75ecfbc112	{"name": "chikko_BbMsMIk.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||24d91ed2cb9a8eeb9d8fbbe0bc6e48fb	{"name": "cache/b3/83/b3832994a63f3f703188870d5586f707.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||648d085856793857a796dd75ecfbc112	["24d91ed2cb9a8eeb9d8fbbe0bc6e48fb"]
sorl-thumbnail||image||ce169b3c6c234977152b0f0b5b558d1d	{"name": "barbaris_xsTCm9Z.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||12d1893999dc67c1a6e85590be60036a	{"name": "cache/5c/e9/5ce9c9e44ed1360033d17154b8fc8ff7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||ce169b3c6c234977152b0f0b5b558d1d	["12d1893999dc67c1a6e85590be60036a"]
sorl-thumbnail||image||840254cf57a8d05d34baaafc5191be7b	{"name": "qizil_cG0Zjas.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||03859429fbfaae26059d5be4efaf8515	{"name": "cache/e9/7a/e97a9e30208821d5ce362db2f7bf744e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||840254cf57a8d05d34baaafc5191be7b	["03859429fbfaae26059d5be4efaf8515"]
sorl-thumbnail||image||233247352a724b9be235fa6b38ae8f87	{"name": "yashil_BZr9nqy.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||bd883de721423a347755ee2ca7fd65de	{"name": "kapla_iMm2AGF.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||9f2bf966ebc063fdb2efeeb5a3528e84	{"name": "cache/0b/2f/0b2f73610e8709f857c98cf7b5d0173e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||233247352a724b9be235fa6b38ae8f87	["9f2bf966ebc063fdb2efeeb5a3528e84"]
sorl-thumbnail||image||e0b746c2c1629fb1d5a341e30a20b31e	{"name": "yashil_7c095Ra.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||841fdf22fc053ba863497d265b478c0f	{"name": "cache/b2/c4/b2c481a7ee68636d4dfdb6ac92396432.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||e0b746c2c1629fb1d5a341e30a20b31e	["841fdf22fc053ba863497d265b478c0f"]
sorl-thumbnail||image||ddfc868060812f52ca63c66313b56c56	{"name": "rich.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||14e8cd93d67b8fd555017fbfbefc8b0d	{"name": "cache/d6/14/d61410123c2153ac2a2616f173bd57c8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||ddfc868060812f52ca63c66313b56c56	["14e8cd93d67b8fd555017fbfbefc8b0d"]
sorl-thumbnail||image||3a4ff0a8ebd0400eab38c934e5382be8	{"name": "rich_doUErhD.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||814e6ba6637a4ca0475a29e7f458c228	{"name": "cache/17/8d/178d44e892d8bc6eed820e40a1aab3d4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||3a4ff0a8ebd0400eab38c934e5382be8	["814e6ba6637a4ca0475a29e7f458c228"]
sorl-thumbnail||image||ccb9d2199664cc7d953ae05c0571bec0	{"name": "bim_bom.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||b29fa039145e7be39969d30fcd838033	{"name": "cache/4d/a9/4da9a76b5bdd3d2b97b9c9803bc0ea82.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||ccb9d2199664cc7d953ae05c0571bec0	["b29fa039145e7be39969d30fcd838033"]
sorl-thumbnail||image||d99dfca505014cf422f1b17a7a579deb	{"name": "bim_bom_DylDuzT.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||c762c57d39c4cdaac3d88b7c266ff60c	{"name": "cache/b2/49/b24978ec14f6cfa91ea410dbe59eb3c1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||d99dfca505014cf422f1b17a7a579deb	["c762c57d39c4cdaac3d88b7c266ff60c"]
sorl-thumbnail||image||9ebeb1210457a69de5f3cddadf26161e	{"name": "paket.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||5d7b18db8d330c8203d06ddcc3da401f	{"name": "cache/ff/74/ff74737f511b2fa44921c1e655f4e643.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||9ebeb1210457a69de5f3cddadf26161e	["5d7b18db8d330c8203d06ddcc3da401f"]
sorl-thumbnail||image||01f2237ab429fbfb3bec19a260fd5646	{"name": "paket_GAFZf8g.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||81f7b18f537a15f2cc5675fdaf73468c	{"name": "cache/6e/ad/6eadc6507e6ae46ab00ab67fe830248f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||01f2237ab429fbfb3bec19a260fd5646	["81f7b18f537a15f2cc5675fdaf73468c"]
sorl-thumbnail||image||67fdfc4e1d2538bb3358eaa5e46a19ed	{"name": "notka.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||a5dfea43e88f64131ccb4d1cd9d341d3	{"name": "cache/f4/5c/f45cebf66192073255763ec491b9359c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||67fdfc4e1d2538bb3358eaa5e46a19ed	["a5dfea43e88f64131ccb4d1cd9d341d3"]
sorl-thumbnail||image||80d12ed2861c475a47feadaf49ec7de9	{"name": "notka_mre5imN.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||30233cf77419f5bf2de42a2dfda36b3d	{"name": "cache/b5/39/b5396dabf280fc8aa1f73085dfc996c1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||80d12ed2861c475a47feadaf49ec7de9	["30233cf77419f5bf2de42a2dfda36b3d"]
sorl-thumbnail||image||18ae6d66c8f4848addefe96912e9028e	{"name": "qizil_dpKXGsd.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||fe14a6276c83d91ec8ef210276f66af5	{"name": "cache/87/75/8775a8c07e9babfd414fb2e56913f12c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||18ae6d66c8f4848addefe96912e9028e	["fe14a6276c83d91ec8ef210276f66af5"]
sorl-thumbnail||image||136047088c1f9c7d29733b70d447e1ca	{"name": "qizil_NrzwU85.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||8bf4fed3305281575a977bf348f50f09	{"name": "cache/73/d0/73d065e764591b8d4ff51414aa6739fd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||136047088c1f9c7d29733b70d447e1ca	["8bf4fed3305281575a977bf348f50f09"]
sorl-thumbnail||image||c8cff29fcba07bf9748e6d5ecf07c3e3	{"name": "barbaris_ifql7p9.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||56513234b8f946dd61d6fdb35a62b256	{"name": "cache/06/d8/06d8045b44cdfe30f89cf35c433be9a2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||c8cff29fcba07bf9748e6d5ecf07c3e3	["56513234b8f946dd61d6fdb35a62b256"]
sorl-thumbnail||image||1914c229e5271f6bec8ab714c8f1218b	{"name": "8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 902]}
sorl-thumbnail||image||d107c54da17550b68d30602d1426af71	{"name": "cache/c1/a5/c1a5f51348bd1e51e663b0d7c21bed03.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||1914c229e5271f6bec8ab714c8f1218b	["d107c54da17550b68d30602d1426af71"]
sorl-thumbnail||image||1cee21e0dd03a6b57e8352f17c68f286	{"name": "8_STi7j23.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 902]}
sorl-thumbnail||image||fffb0349ffe2326b5aef55d28c5bdcd1	{"name": "cache/05/cf/05cfe73a0b58c1693ba02fc79898635f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||1cee21e0dd03a6b57e8352f17c68f286	["fffb0349ffe2326b5aef55d28c5bdcd1"]
sorl-thumbnail||image||f0a67ea70ce1f56293765e27fb9e82b8	{"name": "cache/0f/06/0f06854ff738f73a05927c7324d5e19c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||bd883de721423a347755ee2ca7fd65de	["f0a67ea70ce1f56293765e27fb9e82b8"]
sorl-thumbnail||image||9557e838f3f8443d444fefaaf40f7734	{"name": "kapla_Z0UGuPl.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||f532c38631e5eaa8f3aef0175fcb29c9	{"name": "cache/d9/09/d909cf3da53006174a6f6ade242fa2ad.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||9557e838f3f8443d444fefaaf40f7734	["f532c38631e5eaa8f3aef0175fcb29c9"]
sorl-thumbnail||image||ff63fb0f2142fddcde3a0b6207df53fe	{"name": "8_9T657e9.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1280, 902]}
sorl-thumbnail||image||a023084b5b6d11acdad3ac2f4a4fd3b9	{"name": "cache/d9/d4/d9d49da5d655191f29c23a67286d969c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||ff63fb0f2142fddcde3a0b6207df53fe	["a023084b5b6d11acdad3ac2f4a4fd3b9"]
sorl-thumbnail||image||f50b0cddba7c42bc5c07c8b9acb76fe1	{"name": "qizil_FIIxPNg.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||b6a88e48193ae56e601035e67f863506	{"name": "cache/a1/f7/a1f747a7b0155ace1e291cfa641a9ea1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||f50b0cddba7c42bc5c07c8b9acb76fe1	["b6a88e48193ae56e601035e67f863506"]
sorl-thumbnail||image||c751132584421a2a8c5c86d78259237e	{"name": "kapla_CfkbxGK.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||54493cb3f01729739e74d1963c672b5f	{"name": "cache/b8/f0/b8f0f6a894eefda81b9be4fca9a65c3b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||c751132584421a2a8c5c86d78259237e	["54493cb3f01729739e74d1963c672b5f"]
sorl-thumbnail||image||79817b8bb003897c6a2f450789a8dcb1	{"name": "kapla_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||3a3c9356dc7cd36a7d16b4f2615963c3	{"name": "cache/94/72/9472dc2c5a77085d7b92a22dbbbb9923.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||79817b8bb003897c6a2f450789a8dcb1	["3a3c9356dc7cd36a7d16b4f2615963c3"]
sorl-thumbnail||image||0d77699a0befe486e19dff82b2bee747	{"name": "kapla_0Yt9EQF.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||8bdc0a9fc4a189918a31e51a51b7426a	{"name": "cache/05/9a/059ac93b09710cf923d7f1eaa6d251de.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||0d77699a0befe486e19dff82b2bee747	["8bdc0a9fc4a189918a31e51a51b7426a"]
sorl-thumbnail||image||40094b4ef37c423f8449eb113855fb3c	{"name": "kapla_2_gSPL6qZ.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||7c10fa2b18a85810957b0912d6d12e89	{"name": "cache/de/d9/ded98e6b590b1df156732d86589eda41.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||40094b4ef37c423f8449eb113855fb3c	["7c10fa2b18a85810957b0912d6d12e89"]
sorl-thumbnail||image||a819bea806ff7e66cbebe851e78dec4f	{"name": "kapla_2_hXx6B3X.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||bee0f2c4e570b153fbcd793747ac5b33	{"name": "cache/70/7a/707aeb01b8083745da40c60e5b75886c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||a819bea806ff7e66cbebe851e78dec4f	["bee0f2c4e570b153fbcd793747ac5b33"]
sorl-thumbnail||image||5ce4c038561f05eab703cb3e43d0d091	{"name": "kapla_D8P9LU1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||247866f6b9af92e523bc0b5090a96fc6	{"name": "cache/1d/63/1d637228ee59cbb9bb374682c16fa087.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||5ce4c038561f05eab703cb3e43d0d091	["247866f6b9af92e523bc0b5090a96fc6"]
sorl-thumbnail||image||03c0e91155b3c9bed971d31dbeff771a	{"name": "chikko_5WMPeFq.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||e816aa62d1b2972e8265044048ea877b	{"name": "cache/6f/4f/6f4f5c3b1aef8e17731d3a0bfb55e7e3.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||03c0e91155b3c9bed971d31dbeff771a	["e816aa62d1b2972e8265044048ea877b"]
sorl-thumbnail||image||5a76c4f62b90f16fa5d4770f306eda35	{"name": "chikko_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||99d2d6d8a4f3c715f38fd4abbaccb60b	{"name": "cache/2e/3b/2e3b08986404248342998c5e83241802.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||5a76c4f62b90f16fa5d4770f306eda35	["99d2d6d8a4f3c715f38fd4abbaccb60b"]
sorl-thumbnail||image||cbcd4c8c6f5d7e70f8b93297f583aec4	{"name": "chikko_2_cz0x2gk.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||20361ffcac37c353c09c58e1cd9c5806	{"name": "cache/9d/b1/9db17903c2110839918714e5a420575c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||cbcd4c8c6f5d7e70f8b93297f583aec4	["20361ffcac37c353c09c58e1cd9c5806"]
sorl-thumbnail||image||c72703f8bcafa108b4fffeef40025dea	{"name": "chikko_fniUI4l.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||f13c42d918c455ecbcd4b514a64697c8	{"name": "cache/04/c4/04c497f28ced53a9068ecb070c5cd725.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||c72703f8bcafa108b4fffeef40025dea	["f13c42d918c455ecbcd4b514a64697c8"]
sorl-thumbnail||image||1eb04eab7f2deeb7287238cc67759304	{"name": "barbaris_pige2aS.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||0083426b2dca5ea0ae3704ecdc044bb5	{"name": "qizil_9S3WQOi.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||thumbnails||82a2d996678e2d7d633e46ae2e6809ca	["9ab43e8915d33cc3177590a055460e11"]
sorl-thumbnail||image||8e9204da4b05e22981cec32d4cca6b7d	{"name": "cache/57/8c/578c6028641157ad82a2f81722be5c72.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||1eb04eab7f2deeb7287238cc67759304	["8e9204da4b05e22981cec32d4cca6b7d"]
sorl-thumbnail||image||f37c143a4d870b5853423d07743eb71c	{"name": "barbaris_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||4e4be874416757d8215da6c3ee4d1586	{"name": "cache/74/4b/744b18d4eeb83c4fd087980b3dd07d88.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||f37c143a4d870b5853423d07743eb71c	["4e4be874416757d8215da6c3ee4d1586"]
sorl-thumbnail||image||e3759a0080c15e6704d6bf5301e098e2	{"name": "barbaris_2_qncNuPN.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||cc90cd9772662f5d15ff605dbede85f7	{"name": "cache/b9/c3/b9c3feeed920c1bbaa66e4211fe47007.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||e3759a0080c15e6704d6bf5301e098e2	["cc90cd9772662f5d15ff605dbede85f7"]
sorl-thumbnail||image||44c30c2b7253e54ae38627cfdeb9a604	{"name": "barbaris_kwkeNmS.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||ee78a91993c720b31dd7bf6a7c736cff	{"name": "cache/95/17/951775dcaad22ff75343dadeca089775.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||44c30c2b7253e54ae38627cfdeb9a604	["ee78a91993c720b31dd7bf6a7c736cff"]
sorl-thumbnail||image||e8444b262e32424617bbd4b142514b8d	{"name": "yashil_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||aae6b7d0921f6ef4f4f954c9793a550b	{"name": "cache/35/b6/35b6f5da70eafdfa730f1e53dc2d4e7c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||e8444b262e32424617bbd4b142514b8d	["aae6b7d0921f6ef4f4f954c9793a550b"]
sorl-thumbnail||image||059d52355796fb02ee306cc8249e8ed6	{"name": "yashil_d0scCNz.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||5d1d2e7210b6b7662038b5bda1f2aa85	{"name": "cache/da/ac/daace67b59a545bbfecbb2a3f81cb624.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||059d52355796fb02ee306cc8249e8ed6	["5d1d2e7210b6b7662038b5bda1f2aa85"]
sorl-thumbnail||image||ef6481fb05ef0a5694f4d195b348cd17	{"name": "Rich_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||df3ccdaf60bee0368424f5ed99857a72	{"name": "cache/cf/a2/cfa27d8804f681da29454fb10299a504.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||ef6481fb05ef0a5694f4d195b348cd17	["df3ccdaf60bee0368424f5ed99857a72"]
sorl-thumbnail||image||ed740de0fceedd7e295c21718e6542ae	{"name": "rich_zU3crZi.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||95fba67fb83e7f7b29c08a94a8c75f44	{"name": "cache/e5/c4/e5c459087824dffedf3fa199f4cdcd29.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||ed740de0fceedd7e295c21718e6542ae	["95fba67fb83e7f7b29c08a94a8c75f44"]
sorl-thumbnail||image||c872f704ec036e8af070783f34bb80d0	{"name": "bim_bom_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||65217f77eb536cafa1727e507fe416e7	{"name": "cache/2f/84/2f848e37721e0b5a8493532697a422cd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||c872f704ec036e8af070783f34bb80d0	["65217f77eb536cafa1727e507fe416e7"]
sorl-thumbnail||image||bb04cd1f4c7005cb3a8dd6d618462723	{"name": "bim_bom_zKMXFrD.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||32aea1bedf474e2aa62b3b1642b2aeea	{"name": "cache/c1/ce/c1ced973f0ef4dbcbd99f4b7bdd03240.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||bb04cd1f4c7005cb3a8dd6d618462723	["32aea1bedf474e2aa62b3b1642b2aeea"]
sorl-thumbnail||image||cfb050e5986bd969b0bb7fff68cfa781	{"name": "paket_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||dbc07a3b5f6bc79ce3a66dcb6f946925	{"name": "cache/67/b1/67b18defbf12ba0becdaa6e7e9caf062.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||cfb050e5986bd969b0bb7fff68cfa781	["dbc07a3b5f6bc79ce3a66dcb6f946925"]
sorl-thumbnail||image||59a79a864ec8bc2c4b9cabe62287c807	{"name": "paket_3LDZHCA.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||72122382cdb677186b24c9ba321f7912	{"name": "cache/b5/64/b5642cdc7537a0f9e4fc3d5d8e28643a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||59a79a864ec8bc2c4b9cabe62287c807	["72122382cdb677186b24c9ba321f7912"]
sorl-thumbnail||image||8c66b8b4f43640ca97f9618a5e24188b	{"name": "notka_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||4f30f3432ea4ab979571edb9562ae817	{"name": "cache/dc/d7/dcd76afaa70f5177a997854029b803cb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||8c66b8b4f43640ca97f9618a5e24188b	["4f30f3432ea4ab979571edb9562ae817"]
sorl-thumbnail||image||d24bfafae2d125d451f63617448ea8c9	{"name": "notka_pPhUbrn.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||09d3b437fecd38061aa17b6e804e3528	{"name": "cache/41/35/413506e98812e94b3cd6982c29a8979a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||d24bfafae2d125d451f63617448ea8c9	["09d3b437fecd38061aa17b6e804e3528"]
sorl-thumbnail||image||b6bfef1a606b12180285d63131d47b71	{"name": "qizil_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||4047a7f9ead0b5742b8416b3edbfae00	{"name": "cache/02/68/02688a6c7074c28e58351f2b20d94fd5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||b6bfef1a606b12180285d63131d47b71	["4047a7f9ead0b5742b8416b3edbfae00"]
sorl-thumbnail||image||63f79b2886c73d81f8805f7b51a476e9	{"name": "cache/cc/cc/ccccab58b1bdda1098db5ede8a4343b3.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||0083426b2dca5ea0ae3704ecdc044bb5	["63f79b2886c73d81f8805f7b51a476e9"]
sorl-thumbnail||image||7b467934ccc00a00f9527030b01c51f4	{"name": "products/product_2/paket_2_Ldgm2Ab.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||5eb698bbadccb57a29d9b94fddf866ef	{"name": "cache/00/58/00588eb50526b9e97068b93a4f2a3824.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||thumbnails||7b467934ccc00a00f9527030b01c51f4	["5eb698bbadccb57a29d9b94fddf866ef"]
sorl-thumbnail||image||46f5dc5ff33d26e95deadfc3ac2cc66e	{"name": "products/product_2/paket_BYlciA3.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||88d3b76f58d1cabef70ec1220d1edcbb	{"name": "cache/f1/12/f11255e28e7ce3fa5ed38504477ad4ff.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||cdc71f3068af1c793fb8216a67f9c059	{"name": "products/product_1/qizil_CtasF5f.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||1dd872517c1e5d3fb20da72cb3105758	{"name": "cache/b2/79/b279771b70c97b1d8ef17fa0c67feb03.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||efa3b4e79dfbd19c082db3097134b010	{"name": "products/product_1/qizil.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||db047dcaf71061036a0e7b23d50622a6	{"name": "cache/fa/d7/fad76b2692e4c59e85b74534570bda5c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||efa3b4e79dfbd19c082db3097134b010	["db047dcaf71061036a0e7b23d50622a6"]
sorl-thumbnail||image||fe950e88293245276f3d158feda29443	{"name": "cache/2e/cf/2ecfa33e9206496de92487b163aa122e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||cdc71f3068af1c793fb8216a67f9c059	["fe950e88293245276f3d158feda29443", "1dd872517c1e5d3fb20da72cb3105758"]
sorl-thumbnail||image||678631b1da5bd039756f8aacc11698fb	{"name": "products/product_2/paket.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||8748e970aaaa080ad2f744414a6140d4	{"name": "cache/4d/5b/4d5beec78439c3856ed5efdf9354f45a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||678631b1da5bd039756f8aacc11698fb	["8748e970aaaa080ad2f744414a6140d4"]
sorl-thumbnail||image||14cacc45444a93bb5615916b1ea85998	{"name": "cache/a9/25/a925b1fca510026da2294e1b2224eb58.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||46f5dc5ff33d26e95deadfc3ac2cc66e	["14cacc45444a93bb5615916b1ea85998", "88d3b76f58d1cabef70ec1220d1edcbb"]
sorl-thumbnail||image||dcfa49402773f3288a5aa37ab8cbfbcc	{"name": "products/product_6/notka_h8FVMqi.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||d3a0d85ebf962bc3b11a4af9bea0aa7e	{"name": "cache/11/37/113715b755f551815699e4ae0cd4a8d4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||5d1aaa9fdbe8005817ea2905125dd974	{"name": "products/product_6/notka.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||4cf82f28bb1cac3e02cad7cd5727aaae	{"name": "cache/d5/08/d508d9502b25321825787986bbede779.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||5d1aaa9fdbe8005817ea2905125dd974	["4cf82f28bb1cac3e02cad7cd5727aaae"]
sorl-thumbnail||image||5f3fb715da80c77c3a157da452d22f90	{"name": "cache/2c/42/2c428eb1e28868b0f0532e4da6efb25f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||dcfa49402773f3288a5aa37ab8cbfbcc	["d3a0d85ebf962bc3b11a4af9bea0aa7e", "5f3fb715da80c77c3a157da452d22f90"]
sorl-thumbnail||image||8a9aa3faa0ea3011e8dbf2733d8454a0	{"name": "products/product_None/chikko_nn56BqN.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||68f3bca30dda23cd676671704aaedb99	{"name": "cache/10/24/1024e0cea005a3adf7b9a4f2f8a4ec9e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||7d25b5ef577c10aab7b54ddb7744630b	{"name": "products/product_None/chikko_zszhMwM.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||0719f5a6eaf189a1d50425d2f26bacda	{"name": "cache/5d/64/5d64fef301706bc23b8cc93859c0bf04.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||7d25b5ef577c10aab7b54ddb7744630b	["0719f5a6eaf189a1d50425d2f26bacda"]
sorl-thumbnail||image||5fa5f9c9789d5020ed9ee66be2ac7dbf	{"name": "cache/ea/07/ea07a9e057f49b1450cb4a5426bc48c8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||8a9aa3faa0ea3011e8dbf2733d8454a0	["68f3bca30dda23cd676671704aaedb99", "5fa5f9c9789d5020ed9ee66be2ac7dbf"]
sorl-thumbnail||image||44bcc2ca48f5cffe9d76d3e08ee73e82	{"name": "products/product_None/bim_bom_BEwpfFd.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||bab8ddd1fd012176e3c3afb07b397d17	{"name": "cache/d3/e5/d3e5cac239a373a3c585a1e141c42563.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||5306bc67ceb870caaa4e2529d17eae25	{"name": "products/product_None/bim_bom_9wT4px3.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||2ae001c59eaecbe280e601227304bd91	{"name": "cache/b9/15/b91554c4569c1015491d9208924e5beb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||44bcc2ca48f5cffe9d76d3e08ee73e82	["4e80fca838524f0f1ad8f25ec1a1b110", "bab8ddd1fd012176e3c3afb07b397d17"]
sorl-thumbnail||thumbnails||5306bc67ceb870caaa4e2529d17eae25	["2ae001c59eaecbe280e601227304bd91"]
sorl-thumbnail||image||4e80fca838524f0f1ad8f25ec1a1b110	{"name": "cache/6e/2c/6e2c6d26cf3259b91044c72150c6f816.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||image||3cdadcde246d3755792600188c6c96e6	{"name": "BARBARIS.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||0e689f2ba9fbbaef5121d23e2a50e2eb	{"name": "products/product_None/barbaris_cWcGEVb.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||0b0959d349b2dd767d544b0da1fb705f	{"name": "cache/65/af/65af2e6b4633bc17380fc7b9036be5ce.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||b9ca4e5b8e83144a73c778913140f1f1	{"name": "products/product_None/barbaris_38h76dR.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||603c584b697ad83a2d2c03bf4064de97	{"name": "cache/e3/62/e36237dc07678a620a0730933ff5bf2d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||b9ca4e5b8e83144a73c778913140f1f1	["603c584b697ad83a2d2c03bf4064de97"]
sorl-thumbnail||image||5e2bdc663e7430d674a08b7aeb2702eb	{"name": "cache/cd/f5/cdf5fb111dea6c296791d29637273ae6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||0e689f2ba9fbbaef5121d23e2a50e2eb	["0b0959d349b2dd767d544b0da1fb705f", "5e2bdc663e7430d674a08b7aeb2702eb"]
sorl-thumbnail||image||e338cd4b5b2536df4fda09b30bd61463	{"name": "kapla_2_tMbHacM.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||d901d09e25ca40d86aa15f4c39c757fd	{"name": "cache/7a/55/7a55982825587c2673ccbf2ed6495274.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||e338cd4b5b2536df4fda09b30bd61463	["d901d09e25ca40d86aa15f4c39c757fd"]
sorl-thumbnail||image||197c0cc1b47232e383334b399219d64c	{"name": "kapla_0MBAPmk.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||707cf20de5b3b1953b714908b15afc7a	{"name": "cache/4f/f9/4ff9403460f01ce79b7e7a15c1d79392.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||197c0cc1b47232e383334b399219d64c	["707cf20de5b3b1953b714908b15afc7a"]
sorl-thumbnail||image||00e2233c993ad8b29c2a91b7ae9e4cb0	{"name": "bim_bom_pneiJ3G.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||05dd093e9bbd502f88497c3716dc80c5	{"name": "cache/80/0c/800cb751fcca4b8ce059abc4c9ad4949.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||00e2233c993ad8b29c2a91b7ae9e4cb0	["05dd093e9bbd502f88497c3716dc80c5"]
sorl-thumbnail||image||7f127c82ca4e76329c1c9547b0f92ca1	{"name": "bim_bom_2_9UJDapY.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||a101021a1790529542fd16163892abeb	{"name": "cache/66/8c/668cd5f814f49802a3fdfb4226cd7ea4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||7f127c82ca4e76329c1c9547b0f92ca1	["a101021a1790529542fd16163892abeb"]
sorl-thumbnail||image||db363ed98307db87aa2ae59ad52054a4	{"name": "bim_bom_2_QjaT5Ei.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||8d7b817cfd8b96031a12aee9c0360075	{"name": "cache/36/de/36deabb20dadc71b5be2ffd3afb64429.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||db363ed98307db87aa2ae59ad52054a4	["8d7b817cfd8b96031a12aee9c0360075"]
sorl-thumbnail||image||f532bdea62f65268926e1c51760c8888	{"name": "bim_bom_lXgaGPB.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||8bbda81aca84f575bf014df7236a6e69	{"name": "cache/5e/aa/5eaa7f9473b84128b041c80e2aa18408.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||f532bdea62f65268926e1c51760c8888	["8bbda81aca84f575bf014df7236a6e69"]
sorl-thumbnail||image||eb8e26f81773bd6db94d8f3e865bc885	{"name": "notkaaaa.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||16425859b01b3da7f8f5fde3fef7364b	{"name": "cache/f1/6f/f16ffc32cd941c311eb0bb94fbd9cd31.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||eb8e26f81773bd6db94d8f3e865bc885	["16425859b01b3da7f8f5fde3fef7364b"]
sorl-thumbnail||image||1ed2105cada6ecc92ced0a7a30e93d3f	{"name": "notkaaaa_opyjlwW.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||3101c71727ddb4cc8952d6acb7a5bdde	{"name": "cache/b5/80/b58011f79e5e2388eb3f98ea57baec6e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||1ed2105cada6ecc92ced0a7a30e93d3f	["3101c71727ddb4cc8952d6acb7a5bdde"]
sorl-thumbnail||image||985ea1f23040d551c653ab127ddd61b7	{"name": "notkaaaa_q9zxyMK.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||0e6439bf24f91adcd47dc1bcbdafbb77	{"name": "cache/c8/0c/c80cf6f88c2f12f928bffbc216a7f11a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||985ea1f23040d551c653ab127ddd61b7	["0e6439bf24f91adcd47dc1bcbdafbb77"]
sorl-thumbnail||image||685de0b4e1cc7128b672bb747e1df737	{"name": "notkaaaa_lHdGY7o.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||8d6b86f16a67dce74abdc1e41f37b212	{"name": "cache/5c/ac/5cacbb5c4f4f388739e8abfe9e668e87.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||685de0b4e1cc7128b672bb747e1df737	["8d6b86f16a67dce74abdc1e41f37b212"]
sorl-thumbnail||image||bbc8e9cc1e2abc3bd1aed85544f35a95	{"name": "notkaaaa_2PVglHB.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||1523157c57b6422633dd8a374aa8ac34	{"name": "cache/2f/1f/2f1ff08fdd9e2a4adfc73bd00534229e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||bbc8e9cc1e2abc3bd1aed85544f35a95	["1523157c57b6422633dd8a374aa8ac34"]
sorl-thumbnail||image||0a626ec077b94014d7dceaf6bcc7f063	{"name": "notkaaaa_T9PoMjq.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||df37193f6007b7e700e58433f8b302fd	{"name": "cache/20/39/2039ddf8efad192f606947062bb98b69.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||0a626ec077b94014d7dceaf6bcc7f063	["df37193f6007b7e700e58433f8b302fd"]
sorl-thumbnail||image||797be854522846864cc067edcac67110	{"name": "notkaaaa_boJJHWY.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||74aed683de1585bfde98836b567bca2c	{"name": "cache/18/99/18999e6214d58b7912fc6e2876ecb9bc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||797be854522846864cc067edcac67110	["74aed683de1585bfde98836b567bca2c"]
sorl-thumbnail||image||41f93cfe9279dd2bc2f595c25b9999f8	{"name": "notkaaaa_iiS16M7.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||599e84b75a02c6c0822e9657bc4ceda8	{"name": "cache/b4/31/b431eb9d9e72c0b8a2eeb8d55fbf3328.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||41f93cfe9279dd2bc2f595c25b9999f8	["599e84b75a02c6c0822e9657bc4ceda8"]
sorl-thumbnail||image||eff2c704bc30c3965602d0b052350db3	{"name": "notkaaaa_zm6xgs0.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||f90e1b06f87dabba1846e46436a34d9b	{"name": "cache/b0/6b/b06b843268312678da153dc598a115a6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||eff2c704bc30c3965602d0b052350db3	["f90e1b06f87dabba1846e46436a34d9b"]
sorl-thumbnail||image||e98e85f5ef3777b4d604a9991d24ad23	{"name": "notkaaaa_DZL8UY0.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||14d14ad71fcdc0d99e4bec26260240e0	{"name": "cache/9c/c5/9cc5f07c13bc3dd06dbbf69e2e91e1b9.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||e98e85f5ef3777b4d604a9991d24ad23	["14d14ad71fcdc0d99e4bec26260240e0"]
sorl-thumbnail||image||545b8ec61c643f6ba21b29d4a3a24f65	{"name": "notkaaaa_cW4ZUBZ.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||6c1448654159aba7238ffd150d9a7fb4	{"name": "cache/31/b3/31b3b89d3ebc494c722c938d8fb3b14c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||545b8ec61c643f6ba21b29d4a3a24f65	["6c1448654159aba7238ffd150d9a7fb4"]
sorl-thumbnail||image||54f61887825795cd3b75ff437dd90aa9	{"name": "notkaaaa_scCCswn.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||c4881095a2020fc5ae38786368f68ce9	{"name": "cache/2e/5e/2e5e6cb42a07b7f224061894326c4fa3.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||54f61887825795cd3b75ff437dd90aa9	["c4881095a2020fc5ae38786368f68ce9"]
sorl-thumbnail||image||45319158da85c14ac612982d7a06b97b	{"name": "notkaaaa_adWfHuu.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||a9def870b59f7ed186b489d501f201ec	{"name": "cache/6a/5d/6a5d462bf28bf26cbdfeaa50acdd0e3a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||45319158da85c14ac612982d7a06b97b	["a9def870b59f7ed186b489d501f201ec"]
sorl-thumbnail||image||ec797d822f33c460ba4586eac9d564ca	{"name": "notkaaaa_0lh1DUe.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||cd72034a0892851ace7a7ef31110ac4d	{"name": "cache/ff/43/ff43856ad8b655d5aedc5ad94f94295f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||ec797d822f33c460ba4586eac9d564ca	["cd72034a0892851ace7a7ef31110ac4d"]
sorl-thumbnail||image||5bfb32994e0691dc2fa42b73950de8fd	{"name": "fj.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||de8fc63628919b6393834abebab69dad	{"name": "cache/07/e6/07e6ce26c4319f26a6445f41a7ba82d5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||5bfb32994e0691dc2fa42b73950de8fd	["de8fc63628919b6393834abebab69dad"]
sorl-thumbnail||image||3ed6ec3cc03655f58c2adaae25312784	{"name": "fj_Vp1HqrY.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||0f7f3be51a8784197f0a73746ff0d985	{"name": "cache/18/66/18665f361fa0e08860e21a87256870ad.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||3ed6ec3cc03655f58c2adaae25312784	["0f7f3be51a8784197f0a73746ff0d985"]
sorl-thumbnail||image||5a57a4796c00209aeeae5716bca7317d	{"name": "fj_2D2SUXV.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||262df27e5606f402f7d48189baabb845	{"name": "cache/6e/bd/6ebd40bec2c0a73b2aa0fc48bdda2660.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||5a57a4796c00209aeeae5716bca7317d	["262df27e5606f402f7d48189baabb845"]
sorl-thumbnail||image||4c9bb2b37e05989007f84967fda078e6	{"name": "fj_HcrXQVf.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||f870fcc7a45b53daafdc5da2c2bb6c41	{"name": "cache/9c/80/9c8031a626f283f9a2ab05740eefe8fa.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||4c9bb2b37e05989007f84967fda078e6	["f870fcc7a45b53daafdc5da2c2bb6c41"]
sorl-thumbnail||image||01aaad2c450411b7491ca7bd6fe4068e	{"name": "fj_JRTVw14.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||44d6ee05dae7c84abba681b9aa5635fd	{"name": "cache/e3/ae/e3aec55827e0fb54786726ec5279e4c2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||01aaad2c450411b7491ca7bd6fe4068e	["44d6ee05dae7c84abba681b9aa5635fd"]
sorl-thumbnail||image||16a7c7e2b0b7984f6801dda120d23cb2	{"name": "fj_6u9Uawp.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||9c6b65cc358832a57fbff35cf0a9aa20	{"name": "cache/32/20/32208aec3b8568e7e81683bc84c37899.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||16a7c7e2b0b7984f6801dda120d23cb2	["9c6b65cc358832a57fbff35cf0a9aa20"]
sorl-thumbnail||image||218b6d8915f046dd211d9916dd56d5e3	{"name": "fj_UuEzdUd.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||643319511e137442fed2a9622376d67c	{"name": "cache/b0/de/b0de511e6c6f8a4bd6160c0cb71b50ea.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||218b6d8915f046dd211d9916dd56d5e3	["643319511e137442fed2a9622376d67c"]
sorl-thumbnail||image||827efbef32570bab2ee489cccb56b617	{"name": "fj_rT9Dsnm.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||a66b100599a8526da5d4688829576fda	{"name": "cache/f0/a1/f0a12ff420d38d0b9906ec023671259e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||827efbef32570bab2ee489cccb56b617	["a66b100599a8526da5d4688829576fda"]
sorl-thumbnail||image||79161bb2c505c1f1ea4b800c1d1b0f12	{"name": "fj_ejQEatV.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||259b92f3792cc43d20d28ba779c99dea	{"name": "cache/3c/27/3c27afee9ec6bc94a8d21225f9e38033.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||79161bb2c505c1f1ea4b800c1d1b0f12	["259b92f3792cc43d20d28ba779c99dea"]
sorl-thumbnail||image||d5cc0fee716ec83bd469f785b5bb68f8	{"name": "fj_OwdbKeN.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||b207b7c27518e79f6512cb6042677c5e	{"name": "cache/db/4f/db4f58df7dbb57faa9f8b9e79cf29218.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||d5cc0fee716ec83bd469f785b5bb68f8	["b207b7c27518e79f6512cb6042677c5e"]
sorl-thumbnail||image||28992743f522b33a11d40dd85d12ccfe	{"name": "fj_DcZKgrP.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||1453856caa716316489a3c19ffba8447	{"name": "cache/14/f5/14f5b03166ed662eec79699beace24af.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||28992743f522b33a11d40dd85d12ccfe	["1453856caa716316489a3c19ffba8447"]
sorl-thumbnail||image||c7e52574019393cd1d6f5950123f7a1c	{"name": "fj_ULW50nF.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [996, 746]}
sorl-thumbnail||image||637e9d814a4b271e5f42947347d1cb28	{"name": "cache/10/16/10161e05ce8efc30021915e02a67c046.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||c7e52574019393cd1d6f5950123f7a1c	["637e9d814a4b271e5f42947347d1cb28"]
sorl-thumbnail||image||08b2e720128bbaa5d0aef8a7d50dfdf7	{"name": "\\u043f\\u0432\\u0430.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||586524b56c065ef95683daef1ea8839d	{"name": "cache/d2/53/d25301529c4f7265d7906580108c55a2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||08b2e720128bbaa5d0aef8a7d50dfdf7	["586524b56c065ef95683daef1ea8839d"]
sorl-thumbnail||image||48c5e6fb6c4bd7c401a46b64e2342dfd	{"name": "\\u043f\\u0432\\u0430_DkNbu5W.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||38847d5f3f2da4a47a1c851c53b0c15c	{"name": "cache/95/86/95869bd15a492fa50dc538e95ae9ebfb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||48c5e6fb6c4bd7c401a46b64e2342dfd	["38847d5f3f2da4a47a1c851c53b0c15c"]
sorl-thumbnail||image||3ae5e539e959149861eb2bcf9a100ab8	{"name": "notkaa_PXhcJS9.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||b2b66579d2026d0cadee671694a90510	{"name": "cache/2b/87/2b87927b63479837efb8f6fecfabb19d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||3ae5e539e959149861eb2bcf9a100ab8	["b2b66579d2026d0cadee671694a90510"]
sorl-thumbnail||image||c1286da1a658dd66b50f6b6562a903c9	{"name": "notka_1_IQBFuZ7.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||8b142241517a077c4650e89f00c843e9	{"name": "cache/c3/48/c348c31fc6ab2ce42a69769a50721e77.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||c1286da1a658dd66b50f6b6562a903c9	["8b142241517a077c4650e89f00c843e9"]
sorl-thumbnail||image||1d5d7f41cd775b7ed5cddbf56c252a96	{"name": "notka_1_J03cA8c.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||9fed343416a5f186fd8d4dea4a7c9c0b	{"name": "cache/6a/b3/6ab37fc34a4d70540415915349c4a019.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||1d5d7f41cd775b7ed5cddbf56c252a96	["9fed343416a5f186fd8d4dea4a7c9c0b"]
sorl-thumbnail||image||b6ece3da69f9037f77509b5dbf138732	{"name": "notka_1_AaR8oud.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||5c7226423e66bdc5e44802f4ced7305f	{"name": "cache/1e/7b/1e7be3ec3f05e9a9e9637a33737f10c1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||b6ece3da69f9037f77509b5dbf138732	["5c7226423e66bdc5e44802f4ced7305f"]
sorl-thumbnail||image||7760e99141b8177622934aa8a45017bf	{"name": "barbaris_qizil_6ckZjbq.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||d55f3dbe8046a69536ee686e262f2f42	{"name": "cache/0d/9e/0d9e25d8c449d5bbf779aba2b8765290.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||7760e99141b8177622934aa8a45017bf	["d55f3dbe8046a69536ee686e262f2f42"]
sorl-thumbnail||image||5bba9286cd6e45013b7a8562ed25e9fb	{"name": "da_bM1VTr8.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||bef1f08374b893fa45ceb222af9faad2	{"name": "cache/c4/f6/c4f615ee39d8de62906dc79b8e966d5f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||5bba9286cd6e45013b7a8562ed25e9fb	["bef1f08374b893fa45ceb222af9faad2"]
sorl-thumbnail||image||82a2d996678e2d7d633e46ae2e6809ca	{"name": "BARBARIS_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||9ab43e8915d33cc3177590a055460e11	{"name": "cache/12/16/121619b51d5790fcd5277466c21e2da0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||image||3d529b7cae4788793d28f75bc9d67f2e	{"name": "cache/d4/fe/d4feb15d394087c5a41865cd39616d64.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||3cdadcde246d3755792600188c6c96e6	["3d529b7cae4788793d28f75bc9d67f2e"]
sorl-thumbnail||image||512cfbc7d2df588f68b98923b1feefbc	{"name": "BARBARIS_1_ajsfPd0.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||d4267fc8d718d16412228c24ccbd064d	{"name": "cache/45/0c/450c435d35ed3d937ccd8ee7ba994a1f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||512cfbc7d2df588f68b98923b1feefbc	["d4267fc8d718d16412228c24ccbd064d"]
sorl-thumbnail||image||02203d278544ab4e5712d701b37c2b92	{"name": "products/product_None/BARBARIS_1_A6YCL0U.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||fd951110dece0df53882c172c44fcef6	{"name": "cache/cf/4f/cf4f75ea2f44e11b7edc2977593c1550.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||f46f4dadc008a7145d28df3a3156421c	{"name": "cache/c1/7b/c17b926bed96ab754599e38cabb43822.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||02203d278544ab4e5712d701b37c2b92	["f46f4dadc008a7145d28df3a3156421c", "fd951110dece0df53882c172c44fcef6"]
sorl-thumbnail||image||b2efd2d1bd30a402bf8b605e237f4924	{"name": "products/product_10/barbaris_2_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||fe547749d6771af2f31a9814c9fa5202	{"name": "cache/80/83/808306171af281c64774ceff185eaa47.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||e5a797782607d2e51539d31617202a21	{"name": "cache/09/20/0920c74aa6f32bf8f129d27fa51b8196.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||b2efd2d1bd30a402bf8b605e237f4924	["fe547749d6771af2f31a9814c9fa5202", "e5a797782607d2e51539d31617202a21"]
sorl-thumbnail||image||a40569abee9f4a5279c7fd2f430a1f24	{"name": "products/product_10/BARBARIS_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||b402c5094fcc8b81a282a54c1d03b901	{"name": "cache/9c/bc/9cbc912c535df1165e3acda0e3c8bdfb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||bc1295e7c3b58bf72247083653f763db	{"name": "cache/10/e5/10e56772a4fee284eb69721cd3c66f55.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||a40569abee9f4a5279c7fd2f430a1f24	["bc1295e7c3b58bf72247083653f763db", "b402c5094fcc8b81a282a54c1d03b901"]
sorl-thumbnail||image||3ad00aa753a100e573bc000254c051bb	{"name": "products/product_10/barbaris_2_2_bLIPK6Z.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||c5350eafdabbacf4b4ab412d93de0cea	{"name": "cache/c2/13/c213f80ebe051eee0d546d42429c8b75.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||9bd7f1206f222cc3b0cb67a8f3fd05a5	{"name": "cache/50/68/50687749518518d68415d8df5a50a270.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||3ad00aa753a100e573bc000254c051bb	["9bd7f1206f222cc3b0cb67a8f3fd05a5", "c5350eafdabbacf4b4ab412d93de0cea"]
sorl-thumbnail||image||5dd950db496e60ec434d447ef893e630	{"name": "products/product_10/BARBARIS_1_gatwgZy.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||b61ce2863773946d6ed8a28f498cdaa8	{"name": "cache/30/2c/302c7add9a15e26e73d590deb478a2a8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||89000fa2fe8c21cc2f510eeeba23e1bb	{"name": "cache/38/6e/386e024a956a59d2a74499c04fdb0069.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||5dd950db496e60ec434d447ef893e630	["89000fa2fe8c21cc2f510eeeba23e1bb", "b61ce2863773946d6ed8a28f498cdaa8"]
sorl-thumbnail||image||3dc57f963e0acab2ed5a8c900d5eeb7f	{"name": "87_1XzElvM.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1920, 1080]}
sorl-thumbnail||image||4dd3e1592b79794c5e30a0be89e0e2a8	{"name": "cache/79/fd/79fd59d85b4c2235fd0636deb31b0ab6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||3dc57f963e0acab2ed5a8c900d5eeb7f	["4dd3e1592b79794c5e30a0be89e0e2a8"]
sorl-thumbnail||image||d2ad413aaa6b4b21605e9a95ed8851a5	{"name": "f_2_3foUMWU.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1920, 1080]}
sorl-thumbnail||image||c45fd929d8324eda5d012341269380ed	{"name": "cache/5f/0f/5f0f13e091a208db491273e18feff5d9.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||d2ad413aaa6b4b21605e9a95ed8851a5	["c45fd929d8324eda5d012341269380ed"]
sorl-thumbnail||image||92994e323569c79f5002cab592a62b37	{"name": "5_4_wd12ChU.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1920, 1080]}
sorl-thumbnail||image||9be12af872b5c088c1329c5aa010c8b9	{"name": "cache/2c/95/2c95e71c1499bf68e454a0fc1041260b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||92994e323569c79f5002cab592a62b37	["9be12af872b5c088c1329c5aa010c8b9"]
sorl-thumbnail||image||74ad5c9b8a252f75f8e08f087d78d8c9	{"name": "hjp_uM5fZgg.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1920, 1080]}
sorl-thumbnail||image||d60660e5ac1471075860e0ede00cc9d9	{"name": "cache/dd/08/dd086e5c7416992761f3dfad6784d792.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||74ad5c9b8a252f75f8e08f087d78d8c9	["d60660e5ac1471075860e0ede00cc9d9"]
sorl-thumbnail||image||ce5cebb0cbe4a094f3d7ad9425f24535	{"name": "notka_1_iI3bxuW.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||52bf129902423a1b628f0f649d861de1	{"name": "cache/ad/18/ad18388325a588f2d37c88126cbfc422.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||ce5cebb0cbe4a094f3d7ad9425f24535	["52bf129902423a1b628f0f649d861de1"]
sorl-thumbnail||image||14d8275414ef1bfe1a14d5bedca8765b	{"name": "barbaris_qizil_5GMZk5j.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1080, 1080]}
sorl-thumbnail||image||09bbccdddbf7d4496269efc9656064a2	{"name": "cache/4c/6a/4c6a1dc80dd8a4cc07c92f9ba0cc5500.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||14d8275414ef1bfe1a14d5bedca8765b	["09bbccdddbf7d4496269efc9656064a2"]
sorl-thumbnail||image||70606c4d5eb53cd17f4a20a2b6d69b94	{"name": "barbaris_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||bf42fc87ea9c1f276eba546846aa0260	{"name": "cache/84/5f/845f55aabb8fabc85eca004d7f9fd9df.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||70606c4d5eb53cd17f4a20a2b6d69b94	["bf42fc87ea9c1f276eba546846aa0260"]
sorl-thumbnail||image||e1c97069380061b0a4d67412db79655a	{"name": "bim_bom_2_eNfBWpU.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||d3c6f5c10ed89800382d4c9bc00c66e9	{"name": "cache/f2/98/f2980e0eb4aa4d655e49a27ebe425c1f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||e1c97069380061b0a4d67412db79655a	["d3c6f5c10ed89800382d4c9bc00c66e9"]
sorl-thumbnail||image||c17f60d9ac29a0e5d90c3a87bb860983	{"name": "barbaris_2_sPUgDpF.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||ae91a848ffb93559bbef64f625ad47d5	{"name": "cache/dc/ea/dcea14a7b297dfccbfb339f80449cc06.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||c17f60d9ac29a0e5d90c3a87bb860983	["ae91a848ffb93559bbef64f625ad47d5"]
sorl-thumbnail||image||ef8d990e9614408fbdd67cab17b2956c	{"name": "chiko.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||d7e4d5a35022fe687f2d7fc51594dd96	{"name": "cache/90/be/90be8320d2be3499db188a52888df139.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||ef8d990e9614408fbdd67cab17b2956c	["d7e4d5a35022fe687f2d7fc51594dd96"]
sorl-thumbnail||image||87af361bfa4d1cf432c76af687fbd371	{"name": "\\u044c\\u043d\\u0444\\u0435.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||6acfbc37ffe3990c97c3ee518349bf2c	{"name": "cache/d5/6c/d56c672d3609b47dee82ecf16131da95.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||87af361bfa4d1cf432c76af687fbd371	["6acfbc37ffe3990c97c3ee518349bf2c"]
sorl-thumbnail||image||91488851091e70b0d0e2d5cd62e8be5d	{"name": "paket_xon.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||2fb84819d4b8469d98a27c45ac67e307	{"name": "cache/e5/dd/e5dd1d317f44cc66eeb447b22389c547.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||91488851091e70b0d0e2d5cd62e8be5d	["2fb84819d4b8469d98a27c45ac67e307"]
sorl-thumbnail||image||6b3ae3a08d032fdefc182e7aa5b48729	{"name": "Rich_2_R30jC5d.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||8d2ce7c131365b6908f26edb9ac48a0d	{"name": "cache/da/c9/dac941a7ff355cacbaf0113ea887dc12.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||6b3ae3a08d032fdefc182e7aa5b48729	["8d2ce7c131365b6908f26edb9ac48a0d"]
sorl-thumbnail||image||66fde1eebef8e429b8418f297f011f58	{"name": "\\u043b\\u0444\\u0437\\u0434\\u043d\\u0444.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||8f1eab4ec15ff7bad7af790d31e4f96b	{"name": "cache/1f/c9/1fc9fa4eaae5c0be42e5a0800154ca43.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 600]}
sorl-thumbnail||thumbnails||66fde1eebef8e429b8418f297f011f58	["8f1eab4ec15ff7bad7af790d31e4f96b"]
sorl-thumbnail||image||480bc345b9c408ce6ceccc6fd1079cf5	{"name": "products/product_None/notka_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||62e1acb8d6e2fb4d1459eba1a8735493	{"name": "cache/57/73/5773f21d47ba6e197ff8197332ae25ad.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||2ad1254f1eab9961530e698e5d135fdf	{"name": "cache/da/f8/daf8a83542ad78cab47706903a60a543.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||480bc345b9c408ce6ceccc6fd1079cf5	["2ad1254f1eab9961530e698e5d135fdf", "62e1acb8d6e2fb4d1459eba1a8735493"]
sorl-thumbnail||image||ae686cb635b099c2b7fa57f3cffd06c0	{"name": "products/product_None/Rich_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||4a177bcfe2b796100bf43a27dc046e3e	{"name": "cache/68/d7/68d79ed27e276c555e2db9877cc045c2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||thumbnails||ae686cb635b099c2b7fa57f3cffd06c0	["4a177bcfe2b796100bf43a27dc046e3e", "ceaff4e83b75680b95ff785322c1b21d"]
sorl-thumbnail||image||ceaff4e83b75680b95ff785322c1b21d	{"name": "cache/29/fc/29fc460cd7933526ea9a69d46a49222b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||image||3a35645c8d6aab21e459a6b0ac642d40	{"name": "products/product_None/barbaris_1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||af2e3f978825d6598f0cc761b6af9e4e	{"name": "cache/99/e6/99e6a04700d83b24f767254525b40dfe.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||1f883307f2349f3326da87b0d55c685d	{"name": "cache/65/85/658563a6c89989f1b577fdc4fa10203d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||3a35645c8d6aab21e459a6b0ac642d40	["af2e3f978825d6598f0cc761b6af9e4e", "1f883307f2349f3326da87b0d55c685d"]
sorl-thumbnail||image||d83732a85f0ceedd0fe606943d95c473	{"name": "products/product_None/paket_xon.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||508ee2cb1ec25150322f9a2a0c82f409	{"name": "cache/70/59/70596804e6fbc7a9650e77f43c6797a0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||e4d7da23c1f82f71dea2bd7eecb9a7c0	{"name": "cache/7b/d6/7bd6c3ddc142940e9007b41c6a693369.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||d83732a85f0ceedd0fe606943d95c473	["e4d7da23c1f82f71dea2bd7eecb9a7c0", "508ee2cb1ec25150322f9a2a0c82f409"]
sorl-thumbnail||image||b702fd7686f22d44ee616523a0186fc0	{"name": "products/product_None/\\u044c\\u043d\\u0444\\u0435.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||90d20d9e3c43e40be2ee7442d97fd8e1	{"name": "cache/e9/bd/e9bdb393946ef70b436c11509fcad667.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||91d2cdc3fcddfcc39d960af0d7414775	{"name": "cache/f6/f1/f6f1886bcf2e6f6f04d73637d33c1daf.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||b702fd7686f22d44ee616523a0186fc0	["90d20d9e3c43e40be2ee7442d97fd8e1", "91d2cdc3fcddfcc39d960af0d7414775"]
sorl-thumbnail||image||b3f4d230535b3b89d2d39acbf7511bf7	{"name": "products/product_None/bim_bom_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||166e265b6edece2d03b46346d76b1aad	{"name": "cache/d5/e6/d5e6ff268e5bae1927d6ac2782c7e2b4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||9478ce2625596c668f9a5674752c7b19	{"name": "cache/f3/56/f3566e8abbbaee5224812ff081e7b434.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||b3f4d230535b3b89d2d39acbf7511bf7	["9478ce2625596c668f9a5674752c7b19", "166e265b6edece2d03b46346d76b1aad"]
sorl-thumbnail||image||f9ca2e880fd46f280a3486e4a6a0261d	{"name": "products/product_None/chiko.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||ed55a606095bf98b14686538742d92ff	{"name": "cache/3e/17/3e174636d090386a023b9d1583558354.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||59447040e7323c97213ac8a4ea2eba13	{"name": "cache/ef/4a/ef4aacd36ae3f29bab703cf1c3f661ca.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||f9ca2e880fd46f280a3486e4a6a0261d	["ed55a606095bf98b14686538742d92ff", "59447040e7323c97213ac8a4ea2eba13"]
sorl-thumbnail||image||823ee23fb9c93b1c0d0724fed7f6a2bf	{"name": "products/product_None/chiko_mUGgqUk.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||d5f395149e886297a5eb91ca85f3d513	{"name": "cache/a1/74/a1748dd03decd3fa6f6016721e5ecdea.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||e5e9a4510077af94ca43eada293b5102	{"name": "cache/46/cd/46cde8c83b96bb9ff80788db0436b7b1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||823ee23fb9c93b1c0d0724fed7f6a2bf	["e5e9a4510077af94ca43eada293b5102", "d5f395149e886297a5eb91ca85f3d513"]
sorl-thumbnail||image||8b529383f2ba18b503a6adb37870e78a	{"name": "products/product_None/\\u044c\\u043d\\u0444\\u0435_tfxczbX.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||e9cb6d97d73c6d6ba7aadfdc04d72694	{"name": "cache/2a/91/2a91952387031c4fc05e1aea4076e327.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||d0f3829645fdd75fb06be676c60db74a	{"name": "cache/c9/d9/c9d9f2db63bae2fcc8cc381f69572f02.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||8b529383f2ba18b503a6adb37870e78a	["e9cb6d97d73c6d6ba7aadfdc04d72694", "d0f3829645fdd75fb06be676c60db74a"]
sorl-thumbnail||image||19dd0e1ee7e71714d51291758088db98	{"name": "products/product_None/notka_1_Rqmsgkm.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||17a35bad1874b4624b6e63d23ea8ac29	{"name": "cache/f8/52/f8522aec0de4d126394c37c8399532bd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||6686f88e4c488b7362519a15a3fa9054	{"name": "cache/20/72/2072c0267d3a79ffb63b5de8a96653a4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||19dd0e1ee7e71714d51291758088db98	["17a35bad1874b4624b6e63d23ea8ac29", "6686f88e4c488b7362519a15a3fa9054"]
sorl-thumbnail||image||0f017e8368e7cf68d14da84e3ee815ea	{"name": "products/product_None/bim_bom_2_lP2zlAi.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||b36439144eb3579c21403c9feffc46c4	{"name": "cache/e4/61/e461b80718ea615ff8e1513521dd3813.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||01fb35c9f72bf310c37fe230c1635706	{"name": "cache/7f/7f/7f7f4ac0aa55a834c1fc8cd3f13dbc0a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||0f017e8368e7cf68d14da84e3ee815ea	["01fb35c9f72bf310c37fe230c1635706", "b36439144eb3579c21403c9feffc46c4"]
sorl-thumbnail||image||99c05fb1a63a994220742baa73ca7631	{"name": "products/product_None/barbaris_1_I1FTbZQ.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||a61616b9d2abbb220b024028538d3743	{"name": "cache/9a/66/9a66ea157e9e5642e110a78839418a75.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||b6170a5d2052a825bf6086f14152166d	{"name": "cache/04/78/047898944b55da4db4854d4216dadc8a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||99c05fb1a63a994220742baa73ca7631	["b6170a5d2052a825bf6086f14152166d", "a61616b9d2abbb220b024028538d3743"]
sorl-thumbnail||image||8170fbdd8ecde67e8a7fe428f5763246	{"name": "products/product_None/kapla_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [4500, 4500]}
sorl-thumbnail||image||206c8e2aab947c8dc28e4fcd239b152f	{"name": "cache/8b/c4/8bc4d0175ea21ca16b017d54fe4330ef.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||3f3d089a7c8d925b8bec68447e45959a	{"name": "products/product_None/paket_2_9z015B6.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||5b00febd4581fd4a02fc549f9ada7baf	{"name": "cache/d4/74/d47424d0c6c617aec31f19a9dc2a573c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||e6ee486af0dec954e6eb1db159030fc0	{"name": "cache/d0/d5/d0d5275c595ebfaf60f39c7a37ca45b0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||8170fbdd8ecde67e8a7fe428f5763246	["206c8e2aab947c8dc28e4fcd239b152f", "e6ee486af0dec954e6eb1db159030fc0"]
sorl-thumbnail||image||1cbfa336239a35bcf39a64c03335d5e3	{"name": "cache/3d/44/3d44a57b61f1df733ec93dc1b3c9ee1c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||3f3d089a7c8d925b8bec68447e45959a	["1cbfa336239a35bcf39a64c03335d5e3", "5b00febd4581fd4a02fc549f9ada7baf"]
sorl-thumbnail||image||ee723654863b311f6867744b48cc415e	{"name": "products/product_23/\\u043b\\u0444\\u0437\\u0434\\u043d\\u0444.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||8be82918583b9752632d74b0b9f4d631	{"name": "cache/0f/a6/0fa68b7af20e5417d6cfb4ad94ba8c82.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||70dd2176debd8bee0115769dc7d7d05c	{"name": "cache/86/4b/864b22a8767e7294cd6ef2fa4eaddd95.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||ee723654863b311f6867744b48cc415e	["70dd2176debd8bee0115769dc7d7d05c", "8be82918583b9752632d74b0b9f4d631"]
sorl-thumbnail||image||60771809cd83f22dfc5b4a7709f52270	{"name": "products/product_24/paket_xon.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||1a737781668cf5183b5084a083589ff6	{"name": "cache/1e/bc/1ebc6916adf3971911df312809d2b503.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||42c63032a96b9445e6ca122e90bef348	{"name": "cache/b8/47/b8478711f2d0943f7e497f77554c15f2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||60771809cd83f22dfc5b4a7709f52270	["42c63032a96b9445e6ca122e90bef348", "1a737781668cf5183b5084a083589ff6"]
sorl-thumbnail||image||b29817b69e77257908b4b00691694d64	{"name": "products/product_None/Rich_2_R13ISfK.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||eebec3ac922dcd937429ecb84cb90ef6	{"name": "cache/03/8c/038c6bc5e7bb982e6a7ab091bbb85de8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||1aa955830b45cedcf6b85f0e475e6135	{"name": "cache/c7/89/c7890ebe2ee1d4d4fc2c424daedf98b1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||b29817b69e77257908b4b00691694d64	["eebec3ac922dcd937429ecb84cb90ef6", "1aa955830b45cedcf6b85f0e475e6135"]
sorl-thumbnail||image||7e9da9c59ebe0b6bab32fdc2636173ab	{"name": "products/product_None/barbaris_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||0400e0d7581384ecc85690ce965cf2d8	{"name": "cache/84/ae/84aebcf7c12ecd3f3ecfdc00b153f79d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||721fb367dd6b8491d04e2516166fa253	{"name": "cache/4b/82/4b82e26dd535b86eb905eaf3db4e907d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||7e9da9c59ebe0b6bab32fdc2636173ab	["721fb367dd6b8491d04e2516166fa253", "0400e0d7581384ecc85690ce965cf2d8"]
sorl-thumbnail||image||1cfe3702000e340d850f08ff7c790b28	{"name": "banners/banner_None/notka1.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1920, 629]}
sorl-thumbnail||image||39d29aba05ac1d67e6e16d540d68fd03	{"name": "cache/b6/ad/b6ad236fba29c75ca83fe26aaaae732c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 200]}
sorl-thumbnail||image||122c595f896731ca5806cdaa6ced763a	{"name": "banners/banner_None/notka3.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [1920, 629]}
sorl-thumbnail||image||aced74b313ac26c20a2ca4f45e2bdb24	{"name": "cache/7e/6d/7e6d53c75afe7dcbef6af309cdf75f13.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [350, 200]}
sorl-thumbnail||thumbnails||1cfe3702000e340d850f08ff7c790b28	["86ec108bfe709ec55e8d0f5034c808da", "39d29aba05ac1d67e6e16d540d68fd03"]
sorl-thumbnail||thumbnails||122c595f896731ca5806cdaa6ced763a	["2c84517baa0bf5f4ef56c06c711c5393", "aced74b313ac26c20a2ca4f45e2bdb24"]
sorl-thumbnail||image||86ec108bfe709ec55e8d0f5034c808da	{"name": "cache/81/7d/817dddfe4f2955af0a15253d126bd089.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||image||2c84517baa0bf5f4ef56c06c711c5393	{"name": "cache/7d/34/7d347ac8ea2316859202ac5698404147.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||image||a0d81813a2b4ac08d08dc969177ce414	{"name": "products/product_None/notkaa_2.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 391]}
sorl-thumbnail||image||d0f881d46c4f579c3f55ebe1f4482e59	{"name": "cache/67/9b/679b3378fdcc44021844d2306130bb81.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||bd4cd60ad230148815e7b2012b715922	{"name": "cache/7f/b2/7fb2b51e126b3f6b98ec5d2a8493b9fd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||a0d81813a2b4ac08d08dc969177ce414	["bd4cd60ad230148815e7b2012b715922", "d0f881d46c4f579c3f55ebe1f4482e59"]
sorl-thumbnail||image||907da51196e5d3ac2a6a266ffc27793a	{"name": "products/product_27/jkjb.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [282, 169]}
sorl-thumbnail||image||e96fdd2ece6857a1a26a1ef0884c80f9	{"name": "cache/5d/3e/5d3e7f8d1feaa9b6ec24b0f3bac45862.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||de366e2cfe2f7f8320fc0493928b76b2	{"name": "cache/4a/68/4a682b48606bf7311197e4ef9876c007.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||907da51196e5d3ac2a6a266ffc27793a	["e96fdd2ece6857a1a26a1ef0884c80f9", "de366e2cfe2f7f8320fc0493928b76b2"]
sorl-thumbnail||image||bd31a59e311872498bff12edb5905650	{"name": "products/product_27/jeg_0LpOuAq.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [429, 241]}
sorl-thumbnail||image||608729125ff2fe6074e4ecc962274645	{"name": "cache/41/d1/41d1a26196f2fca1b2d4682632a0d894.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||175235346dc31b2e0afc1b796cd71ba6	{"name": "cache/7c/be/7cbeb621d4ca095f719e94b13bebba27.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||bd31a59e311872498bff12edb5905650	["175235346dc31b2e0afc1b796cd71ba6", "608729125ff2fe6074e4ecc962274645"]
sorl-thumbnail||image||ec0e7ae58e57fb3c6749f5cdd89ec2fe	{"name": "products/product_27/jeg_gdldUxb.png", "storage": "django.core.files.storage.FileSystemStorage", "size": [429, 241]}
sorl-thumbnail||image||718ed09a95cb07195f9f5add08c26097	{"name": "cache/1a/06/1a06d820442ffd0976b6f9d87455c0bc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [150, 150]}
sorl-thumbnail||image||501f12ece931bf679e1b87256c202947	{"name": "cache/59/6c/596c921df91f634846bf7a2be9bb1566.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [752, 350]}
sorl-thumbnail||thumbnails||ec0e7ae58e57fb3c6749f5cdd89ec2fe	["718ed09a95cb07195f9f5add08c26097", "501f12ece931bf679e1b87256c202947"]
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.users_user (id, password, last_login, is_superuser, username, email, is_staff, is_active, date_joined, name) FROM stdin;
1	argon2$argon2id$v=19$m=102400,t=2,p=8$UTRzQVpFV3RST3hyb2VIT1d4Nk1mTg$dq+fSUGwP9w/CYwqa34fZkd9K78H3Sl9Qb/VUq0Umn4	2023-09-11 08:11:33.937662+00	t	admin		t	t	2023-01-18 21:57:17.523584+00	
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 236, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.django_site_id_seq', 2, true);


--
-- Name: news_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.news_news_id_seq', 5, true);


--
-- Name: products_banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.products_banners_id_seq', 3, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.products_product_id_seq', 27, true);


--
-- Name: products_productcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.products_productcategory_id_seq', 19, true);


--
-- Name: products_productcountry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.products_productcountry_id_seq', 4, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: news_news news_news_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.news_news
    ADD CONSTRAINT news_news_pkey PRIMARY KEY (id);


--
-- Name: products_banners products_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.products_banners
    ADD CONSTRAINT products_banners_pkey PRIMARY KEY (id);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_productcategory products_productcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.products_productcategory
    ADD CONSTRAINT products_productcategory_pkey PRIMARY KEY (id);


--
-- Name: products_productcountry products_productcountry_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.products_productcountry
    ADD CONSTRAINT products_productcountry_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: thumbnail_kvstore thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: products_product_category_id_9b594869; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX products_product_category_id_9b594869 ON public.products_product USING btree (category_id);


--
-- Name: products_product_country_id_c92f609d; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX products_product_country_id_c92f609d ON public.products_product USING btree (country_id);


--
-- Name: products_product_order_2f26618e; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX products_product_order_2f26618e ON public.products_product USING btree ("order");


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: backend
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_category_id_9b594869_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_category_id_9b594869_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_productcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_country_id_c92f609d_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_country_id_c92f609d_fk_products_ FOREIGN KEY (country_id) REFERENCES public.products_productcountry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
