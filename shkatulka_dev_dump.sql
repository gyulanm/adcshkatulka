--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    body text,
    post_id integer,
    post_type character varying,
    user_id integer,
    reply_to_comment_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO postgres;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: pg_search_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pg_search_documents (
    id bigint NOT NULL,
    content text,
    searchable_type character varying,
    searchable_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pg_search_documents OWNER TO postgres;

--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pg_search_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pg_search_documents_id_seq OWNER TO postgres;

--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pg_search_documents_id_seq OWNED BY public.pg_search_documents.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying,
    description text,
    slug character varying,
    post_image character varying,
    user_id integer,
    type character varying,
    content_link character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id bigint NOT NULL,
    username character varying,
    about text,
    user_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id bigint NOT NULL,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: supports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supports (
    id bigint NOT NULL,
    email character varying,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.supports OWNER TO postgres;

--
-- Name: supports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supports_id_seq OWNER TO postgres;

--
-- Name: supports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supports_id_seq OWNED BY public.supports.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggings (
    id bigint NOT NULL,
    tag_id bigint,
    taggable_type character varying,
    taggable_id bigint,
    tagger_type character varying,
    tagger_id bigint,
    context character varying(128),
    created_at timestamp without time zone,
    tenant character varying(128)
);


ALTER TABLE public.taggings OWNER TO postgres;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggings_id_seq OWNER TO postgres;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggings_id_seq OWNED BY public.taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    taggings_count integer DEFAULT 0
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    jti character varying NOT NULL,
    admin boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: pg_search_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pg_search_documents ALTER COLUMN id SET DEFAULT nextval('public.pg_search_documents_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: supports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supports ALTER COLUMN id SET DEFAULT nextval('public.supports_id_seq'::regclass);


--
-- Name: taggings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggings ALTER COLUMN id SET DEFAULT nextval('public.taggings_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-06-21 18:25:55.704986	2024-06-21 18:25:55.704986
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, body, post_id, post_type, user_id, reply_to_comment_id, created_at, updated_at) FROM stdin;
1	ASDSAD	1	IdeaPost	7	\N	2024-06-21 19:27:03.935117	2024-06-21 19:27:03.935117
2	asdsad	2	IdeaPost	9	\N	2024-06-23 18:25:39.442013	2024-06-23 18:25:39.442013
3	Мне всё нравится	1	IdeaPost	9	\N	2024-06-23 20:29:34.10388	2024-06-23 20:29:34.10388
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (id, post_id, user_id, created_at, updated_at) FROM stdin;
12	1	9	2024-06-24 16:20:04.272584	2024-06-24 16:20:04.272584
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
\.


--
-- Data for Name: pg_search_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pg_search_documents (id, content, searchable_type, searchable_id, created_at, updated_at) FROM stdin;
4	Камни/Циркон Цирко́н (нем. Zirkon ← перс. زرگون‎ [заргун] «золотистый») — минерал подкласса островных силикатов, ортосиликат циркония ZrSiO4. Содержит, как правило, 1−4 % гафния, изоморфно замещающего цирконий в кристаллической решётке. Также может содержать другие редкоземельные элементы в незначительных количествах.<br><br><br>Кристаллизуется в тетрагональной сингонии, образуя дипирамидальные и призматические кристаллы.Твердость по шкале Мооса 7—8; плотность 4,680—4,710 г/см³. Цвет варьирует в зависимости от содержания примесей: от коричневато-жёлтого до коричневого, сероватый, красный, розовый; иногда бесцветен. Блеск сильный алмазный, в условиях метамиктизации жирный. Спайность несовершенная по. Обычно радиоактивен, всегда содержит примеси редких (REE) и радиоактивных (U, Th) элементов, однако редко в значительных количествах. Образцы циркона, обладающие заметной примесью урана и его дочерних продуктов радиоактивного распада, непрозрачны из-за деградации кристаллической решётки.<br><br><br><br>Магматический, встречается в гранитах, сиенитах и др. породах, обычен в пегматитах. Почти во всех типах магматических горных пород присутствует в роли акцессорного минерала. В кристаллах с высоким содержанием радиоактивных элементов частицы, образующиеся в результате их распада, разрушают структуру циркона, в результате чего он становится метамиктным. Химически очень устойчив, поэтому часто используется для изучения геологического прошлого нашей планеты. При выветривании вмещающих его пород концентрируется в россыпях. В начале 2000-х годов в западной Австралии (местность Джек Хиллз[en]) найдены кристаллы циркона, возраст которых определён как превышающий 4 миллиарда лет. Это древнейший из материалов, обнаруженных на Земле. В России крупные месторождения циркона приурочены к щелочным породам (нефелиновые сиениты, миаскиты и пр.). Самые крупные запасы этого минерала находятся в Хибинском щелочном массиве нефелиновых сиенитов на Кольском полуострове, а также на Южном Урале, где циркон встречается в миаскитах (Вишневые горы).	Post	1	2024-06-24 15:10:04.23352	2024-06-24 15:10:04.23352
5	qweqweqwe asdasd	Post	2	2024-06-24 15:10:04.256447	2024-06-24 15:10:04.256447
6	sadasd sadsad	Post	3	2024-06-24 15:10:04.269683	2024-06-24 15:10:04.269683
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, title, description, slug, post_image, user_id, type, content_link, created_at, updated_at) FROM stdin;
2	qweqweqwe	asdasd	qweqweqwe	0145b192b9.jpg	9	IdeaPost	\N	2024-06-23 18:24:44.971967	2024-06-23 18:24:44.971967
3	sadasd	sadsad	sadasd	76023a37c9.jpg	9	IdeaPost	\N	2024-06-23 20:07:28.021003	2024-06-23 20:07:28.021003
1	Камни/Циркон	Цирко́н (нем. Zirkon ← перс. زرگون‎ [заргун] «золотистый») — минерал подкласса островных силикатов, ортосиликат циркония ZrSiO4. Содержит, как правило, 1−4 % гафния, изоморфно замещающего цирконий в кристаллической решётке. Также может содержать другие редкоземельные элементы в незначительных количествах.<br><br><br>Кристаллизуется в тетрагональной сингонии, образуя дипирамидальные и призматические кристаллы.Твердость по шкале Мооса 7—8; плотность 4,680—4,710 г/см³. Цвет варьирует в зависимости от содержания примесей: от коричневато-жёлтого до коричневого, сероватый, красный, розовый; иногда бесцветен. Блеск сильный алмазный, в условиях метамиктизации жирный. Спайность несовершенная по. Обычно радиоактивен, всегда содержит примеси редких (REE) и радиоактивных (U, Th) элементов, однако редко в значительных количествах. Образцы циркона, обладающие заметной примесью урана и его дочерних продуктов радиоактивного распада, непрозрачны из-за деградации кристаллической решётки.<br><br><br><br>Магматический, встречается в гранитах, сиенитах и др. породах, обычен в пегматитах. Почти во всех типах магматических горных пород присутствует в роли акцессорного минерала. В кристаллах с высоким содержанием радиоактивных элементов частицы, образующиеся в результате их распада, разрушают структуру циркона, в результате чего он становится метамиктным. Химически очень устойчив, поэтому часто используется для изучения геологического прошлого нашей планеты. При выветривании вмещающих его пород концентрируется в россыпях. В начале 2000-х годов в западной Австралии (местность Джек Хиллз[en]) найдены кристаллы циркона, возраст которых определён как превышающий 4 миллиарда лет. Это древнейший из материалов, обнаруженных на Земле. В России крупные месторождения циркона приурочены к щелочным породам (нефелиновые сиениты, миаскиты и пр.). Самые крупные запасы этого минерала находятся в Хибинском щелочном массиве нефелиновых сиенитов на Кольском полуострове, а также на Южном Урале, где циркон встречается в миаскитах (Вишневые горы).	zircon	76023a37c9.jpg	7	IdeaPost	zircon	2024-06-21 19:26:50.056591	2024-06-23 23:02:34.239361
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, username, about, user_id, created_at, updated_at) FROM stdin;
1	кастом кастомович	я делаю классный кастом!!!	1	2024-06-21 18:25:56.766126	2024-06-21 18:25:56.766126
2	кастом кастомович	я делаю классный кастом!!!	2	2024-06-21 18:25:57.434602	2024-06-21 18:25:57.434602
3	кастом кастомович	я делаю классный кастом!!!	3	2024-06-21 18:25:58.129717	2024-06-21 18:25:58.129717
4	кастом кастомович	я делаю классный кастом!!!	4	2024-06-21 18:25:58.80639	2024-06-21 18:25:58.80639
5	кастом кастомович	я делаю классный кастом!!!	5	2024-06-21 18:25:59.475873	2024-06-21 18:25:59.475873
6	кастом кастомович	я делаю классный кастом!!!	6	2024-06-21 18:26:00.143977	2024-06-21 18:26:00.143977
7	кастом кастомович	я делаю классный кастом!!!	7	2024-06-21 18:27:52.734422	2024-06-21 18:27:52.734422
8	кастом кастомович	я делаю классный кастом!!!	8	2024-06-21 19:33:50.413937	2024-06-21 19:33:50.413937
9	кастом кастомович	я делаю классный кастом!!!	9	2024-06-22 19:55:35.46006	2024-06-22 19:55:35.46006
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20231010211544
20231010212016
20231025005010
20231025023245
20231218200619
20231219182546
20231219182547
20231219182548
20231219182549
20231219182550
20231219182551
20231219182552
20240220102520
20240220143917
20240516214230
20240624123200
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, email, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: supports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supports (id, email, body, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggings (id, tag_id, taggable_type, taggable_id, tagger_type, tagger_id, context, created_at, tenant) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name, created_at, updated_at, taggings_count) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, jti, admin, created_at, updated_at) FROM stdin;
1	admin@email.com	$2a$12$wJkl/Y7tD.G/J8Awq5/bkO2dINBgBkG/gwcO5QGAPiLBcB2fh5NW6	\N	\N	\N	fcaa2401-0484-403d-8c08-20175a9fb3e1	t	2024-06-21 18:25:56.713552	2024-06-21 18:25:56.713552
2	user_0@email.com	$2a$12$WGeEDHKAStFuczMCMoVxWeyZQE5Mi7HyKSgTVFQpPgNN7yLb2Y2Qa	\N	\N	\N	a5c9a635-7f55-48f3-8169-680fd0ddb520	f	2024-06-21 18:25:57.425659	2024-06-21 18:25:57.425659
3	user_1@email.com	$2a$12$6d7nurmGhVZc9jYygs2LE.EZHtwFwu9g/eBXQAdQ2oac3guRtn7rO	\N	\N	\N	2ec76eee-d545-46b1-9d8f-7c59b27db14d	f	2024-06-21 18:25:58.120558	2024-06-21 18:25:58.120558
4	user_2@email.com	$2a$12$Opca2heefbHNc1DZw52x7O.si/HbONSSXG5r7sTMMBr0zz0Zc35fG	\N	\N	\N	0346dd57-b2d4-4430-ba99-fb007e38b1b6	f	2024-06-21 18:25:58.797838	2024-06-21 18:25:58.797838
5	user_3@email.com	$2a$12$.Inu.5POswvZ24wULYNhLu.UwUxDw94Tf4ehfaMSxjYL.6nslIak.	\N	\N	\N	5ced11a9-a69f-4190-9ab6-f20e48abdda6	f	2024-06-21 18:25:59.465099	2024-06-21 18:25:59.465099
6	user_4@email.com	$2a$12$26U.YAqK2UuM6vx7/lBzxell102Y1BHVinCgioPR1YgAGIXdIoPsO	\N	\N	\N	4db4c920-d59f-4589-b391-b478c9f0a219	f	2024-06-21 18:26:00.135714	2024-06-21 18:26:00.135714
7	tilcher@yandex.ru	$2a$12$E8FsDBikGGJVi6uyYUEgG.ZNsDBHI.UsyKWNsoS7hzRnRvEW5O6tO	\N	\N	\N	07574f23-62da-4e63-a92e-be861f7f3123	f	2024-06-21 18:27:52.660841	2024-06-21 18:27:52.660841
8	tilcher2@yandex.ru	$2a$12$hkX9yNrEfizg3XKkVmWPdeIyEoYdUZwDOLwhLx1Tv05NoCnyMpn2O	\N	\N	\N	fbdcaaf0-5bba-4b89-a304-79ece6c010a2	f	2024-06-21 19:33:50.399484	2024-06-21 19:33:50.399484
9	tilcher3@yandex.ru	$2a$12$KE21G1jUQcXQ8SP4jOBjue7fE6DaWP3alzUSyOMLSn27dAj3ZIGU2	\N	\N	\N	9494097a-4d40-46fd-b0ee-bffee4504bf1	f	2024-06-22 19:55:35.401073	2024-06-22 19:55:35.401073
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 3, true);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_id_seq', 12, true);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 1, false);


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pg_search_documents_id_seq', 6, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 3, true);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profiles_id_seq', 9, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, false);


--
-- Name: supports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supports_id_seq', 1, false);


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggings_id_seq', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: pg_search_documents pg_search_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pg_search_documents
    ADD CONSTRAINT pg_search_documents_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: supports supports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supports
    ADD CONSTRAINT supports_pkey PRIMARY KEY (id);


--
-- Name: taggings taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_favorites_on_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_favorites_on_post_id ON public.favorites USING btree (post_id);


--
-- Name: index_favorites_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_favorites_on_user_id ON public.favorites USING btree (user_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_type_and_sluggable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type_and_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_type, sluggable_id);


--
-- Name: index_pg_search_documents_on_searchable; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_pg_search_documents_on_searchable ON public.pg_search_documents USING btree (searchable_type, searchable_id);


--
-- Name: index_posts_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_posts_on_slug ON public.posts USING btree (slug);


--
-- Name: index_taggings_on_context; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_context ON public.taggings USING btree (context);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_tag_id ON public.taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_taggable_id ON public.taggings USING btree (taggable_id);


--
-- Name: index_taggings_on_taggable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_taggable_type ON public.taggings USING btree (taggable_type);


--
-- Name: index_taggings_on_taggable_type_and_taggable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_taggable_type_and_taggable_id ON public.taggings USING btree (taggable_type, taggable_id);


--
-- Name: index_taggings_on_tagger_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_tagger_id ON public.taggings USING btree (tagger_id);


--
-- Name: index_taggings_on_tagger_id_and_tagger_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_tagger_id_and_tagger_type ON public.taggings USING btree (tagger_id, tagger_type);


--
-- Name: index_taggings_on_tagger_type_and_tagger_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_tagger_type_and_tagger_id ON public.taggings USING btree (tagger_type, tagger_id);


--
-- Name: index_taggings_on_tenant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taggings_on_tenant ON public.taggings USING btree (tenant);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_tags_on_name ON public.tags USING btree (name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_jti; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_jti ON public.users USING btree (jti);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX taggings_idx ON public.taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: taggings_idy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggings_idy ON public.taggings USING btree (taggable_id, taggable_type, tagger_id, context);


--
-- Name: taggings_taggable_context_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggings_taggable_context_idx ON public.taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: taggings fk_rails_9fcd2e236b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT fk_rails_9fcd2e236b FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: favorites fk_rails_d15744e438; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_d15744e438 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: favorites fk_rails_dcaf44a136; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_dcaf44a136 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--

