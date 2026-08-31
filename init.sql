--
-- PostgreSQL database dump
--

\restrict r0rKspphFvf0uwhD8kivMSWOW7waLOTK8ZL0fe9ZPxP4iIv507aSlRT4vbVCHnr

-- Dumped from database version 15.18 (Debian 15.18-1.pgdg13+1)
-- Dumped by pg_dump version 15.18 (Debian 15.18-1.pgdg13+1)

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

ALTER TABLE IF EXISTS ONLY public.taxon_publication DROP CONSTRAINT IF EXISTS taxon_publication_taxon_id_fkey;
ALTER TABLE IF EXISTS ONLY public.taxon_publication DROP CONSTRAINT IF EXISTS taxon_publication_publication_id_fkey;
ALTER TABLE IF EXISTS ONLY public.taxon_media DROP CONSTRAINT IF EXISTS taxon_media_taxon_id_fkey;
ALTER TABLE IF EXISTS ONLY public.taxon_media DROP CONSTRAINT IF EXISTS taxon_media_media_id_fkey;
ALTER TABLE IF EXISTS ONLY public.taxon_publication DROP CONSTRAINT IF EXISTS taxon_publication_pkey;
ALTER TABLE IF EXISTS ONLY public.taxon DROP CONSTRAINT IF EXISTS taxon_pkey;
ALTER TABLE IF EXISTS ONLY public.taxon DROP CONSTRAINT IF EXISTS taxon_name_key;
ALTER TABLE IF EXISTS ONLY public.taxon_media DROP CONSTRAINT IF EXISTS taxon_media_pkey;
ALTER TABLE IF EXISTS ONLY public.publication DROP CONSTRAINT IF EXISTS publication_pkey;
ALTER TABLE IF EXISTS ONLY public.media DROP CONSTRAINT IF EXISTS media_pkey;
ALTER TABLE IF EXISTS ONLY public.alembic_version DROP CONSTRAINT IF EXISTS alembic_version_pkc;
ALTER TABLE IF EXISTS public.taxon ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.publication ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.media ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.taxon_publication;
DROP TABLE IF EXISTS public.taxon_media;
DROP SEQUENCE IF EXISTS public.taxon_id_seq;
DROP TABLE IF EXISTS public.taxon;
DROP SEQUENCE IF EXISTS public.publication_id_seq;
DROP TABLE IF EXISTS public.publication;
DROP SEQUENCE IF EXISTS public.media_id_seq;
DROP TABLE IF EXISTS public.media;
DROP TABLE IF EXISTS public.alembic_version;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: paleo_admin
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO paleo_admin;

--
-- Name: media; Type: TABLE; Schema: public; Owner: paleo_admin
--

CREATE TABLE public.media (
    id integer NOT NULL,
    file_path character varying(500) NOT NULL,
    media_type character varying(50),
    description character varying(250)
);


ALTER TABLE public.media OWNER TO paleo_admin;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: paleo_admin
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO paleo_admin;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paleo_admin
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: publication; Type: TABLE; Schema: public; Owner: paleo_admin
--

CREATE TABLE public.publication (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    year integer,
    authors text,
    abstract text,
    doi character varying(150),
    description text
);


ALTER TABLE public.publication OWNER TO paleo_admin;

--
-- Name: publication_id_seq; Type: SEQUENCE; Schema: public; Owner: paleo_admin
--

CREATE SEQUENCE public.publication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publication_id_seq OWNER TO paleo_admin;

--
-- Name: publication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paleo_admin
--

ALTER SEQUENCE public.publication_id_seq OWNED BY public.publication.id;


--
-- Name: taxon; Type: TABLE; Schema: public; Owner: paleo_admin
--

CREATE TABLE public.taxon (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    geologic_time character varying(150),
    location character varying(200),
    fossil_site character varying(250),
    coloration_data text,
    method_used character varying(250)
);


ALTER TABLE public.taxon OWNER TO paleo_admin;

--
-- Name: taxon_id_seq; Type: SEQUENCE; Schema: public; Owner: paleo_admin
--

CREATE SEQUENCE public.taxon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxon_id_seq OWNER TO paleo_admin;

--
-- Name: taxon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paleo_admin
--

ALTER SEQUENCE public.taxon_id_seq OWNED BY public.taxon.id;


--
-- Name: taxon_media; Type: TABLE; Schema: public; Owner: paleo_admin
--

CREATE TABLE public.taxon_media (
    taxon_id integer NOT NULL,
    media_id integer NOT NULL
);


ALTER TABLE public.taxon_media OWNER TO paleo_admin;

--
-- Name: taxon_publication; Type: TABLE; Schema: public; Owner: paleo_admin
--

CREATE TABLE public.taxon_publication (
    taxon_id integer NOT NULL,
    publication_id integer NOT NULL
);


ALTER TABLE public.taxon_publication OWNER TO paleo_admin;

--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: publication id; Type: DEFAULT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.publication ALTER COLUMN id SET DEFAULT nextval('public.publication_id_seq'::regclass);


--
-- Name: taxon id; Type: DEFAULT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.taxon ALTER COLUMN id SET DEFAULT nextval('public.taxon_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: paleo_admin
--

COPY public.alembic_version (version_num) FROM stdin;
75b1fa03fbce
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: paleo_admin
--

COPY public.media (id, file_path, media_type, description) FROM stdin;
2	Anchiornis/Anchiornis_r.jpg	reconstruction	Реконструкция прижизненной окраски Anchiornis huxleyi.
25	Huadanosaurus/Huadanosaurus_s.png	size_comparison	Размеры Huadanosaurus sinensis.
6	Caihong/Caihong_f.jpg	fossil_photo	Голотип Caihong juji (экземпляр PMoL-B00175).
7	Caihong/Caihong_r.jpg	reconstruction	Художественная реконструкция прижизненного облика Caihong juji.
9	Psittacosaurus/Psittacosaurus_f.png	fossil_photo	Экземпляр Psittacosaurus (SMF R 4970) с сохранившейся пигментацией кожи и щетиной на хвосте.
10	Psittacosaurus/Psittacosaurus_r.jpeg	reconstruction	Модель пситтакозавра, основанная на особенностях кожи и рисунке пигментации образца SMF R 4970.
12	Microraptor/Microraptor_f.png	fossil_photo	Экземпляр BMNHC PH881.
13	Microraptor/Microraptor_s.png	size_comparison	Сравнение размера микрораптора с человеком.
14	Microraptor/Microraptor_r.jpg	reconstruction	Реконструкция прижизненной окраски микрораптора.
1	Anchiornis/Li_et_al_2010.pdf	pdf_article	Публикация Li et al. (2010) в журнале Science. Первая реконструкция окраски Anchiornis huxleyi.
20	Anchiornis/Anchiornis_f1.png	fossil_photo	Часть образца BMNHC PH828 с телом Anchiornis huxleyi.
21	Anchiornis/Anchiornis_f2.png	fossil_photo	Голова Anchiornis huxleyi. Часть образца BMNHC PH828.
4	Anchiornis/Anchiornis_s.png	size_comparison	Сравнение размера Anchiornis huxleyi с человеком.
22	Anchiornis/Lindgren_et_al_2015.pdf	pdf_article	Статья об исследовании молекулярного состава оперения анхиорниса.
26	Huadanosaurus/Qiu_et_al_2025.pdf	pdf_article	Выделение Huadanosaurus sinensis, ранее относимого к роду Sinosauropteryx.
5	Caihong/Hu_et_al._2018.pdf	pdf_article	Оригинальная статья из журнала Nature Communications.
23	Caihong/Caihong_s.png	size_comparison	Размер Caihong juji по данным образца PMoL-B00175.
8	Psittacosaurus/Vinther_et_al_2016.pdf	pdf_article	Статья из Current Biology.
24	Psittacosaurus/Psittacosaurus_s.png	size_comparison	Сравнение размеров пситтакозавра с человеком.
11	Microraptor/Li_et_al_2012.pdf	pdf_article	Оригинальная публикация в журнале Science.
16	Sinosauropteryx/Sinosauropteryx_f.jpg	fossil_photo	Голотип Sinosauropteryx prima (GMV 2123).
17	Sinosauropteryx/Sinosauropteryx_s.png	size_comparison	Размеры взрослой и подростковой особей в сравнении с человеком.
18	Huadanosaurus/Huadanosaurus_r.png	reconstruction	Реконструкция Huadanosaurus sinensis.
19	Huadanosaurus/Huadanosaurus_f.png	fossil_photo	Голотип Huadanosaurus sinensis (образец IVPP V14202, описанный в статье Nature 2010 года как Sinosauropteryx).
27	Sinosauropteryx/Smithwick_et_al_2017.pdf	pdf_article	Исследование, подтвердившее полосатый хвост у Sinosauropteryx prima и открывшее у них маскировочную полосу на глазах.
28	Sinornithosaurus/Sinornithosaurus_sr.jpeg	reconstruction	Реконструкция и размер Sinornithosaurus millenii.
29	Sinornithosaurus/Sinornithosaurus_f1.jpg	fossil_photo	Полный образец IVPP V12811.
30	Sinornithosaurus/Sinornithosaurus_f2.png	fossil_photo	Часть образца IVPP V12811, которая была изучена в работе Zhang et al. (2010).
31	Confuciusornis/Wogelius_et_al_2011.pdf	pdf_article	Картирование микроэлементов у Confuciusornis sanctus и связь их распределения с эумеланином.
32	Confuciusornis/Li_et_al_2018.pdf	pdf_article	Реконструкция узора оперения у Confuciusornis.
33	Confuciusornis/Confuciusornis_s.png	size_comparison	Размеры Confuciusornis sanctus.
34	Confuciusornis/Confuciusornis_f1.png	fossil_photo	Образец CUGB P1401, рассмотренный в Li et al. (2018).
35	Confuciusornis/Confuciusornis_f2.png	fossil_photo	Образец Confuciusornis sanctus с хвостовыми перьями из музея естественной истории в Вене.
36	Confuciusornis/Confuciusornis_r1.png	reconstruction	Возможная окраска Confuciusornis sanctus.
37	Confuciusornis/Confuciusornis_r2.png	reconstruction	Монохромная реконструкция расцветки Confuciusornis sanctus из работы Li et al. (2018).
38	Borealopelta/Borealopelta_sr.jpeg	reconstruction	Размер и окраска Borealopelta markmitchelli.
39	Borealopelta/Borealopelta_fr.png	fossil_photo	Фотография образца TMP 2011.033.0001.
40	Borealopelta/Brown_et_al_2017.pdf	pdf_article	Статья из Current Biology, посвященная окраске Borealopelta markmitchelli.
41	Yi qi/Xu_et_al_2015.pdf	pdf_article	Статья из журнала Nature с описанием Yi qi.
42	Yi qi/Yi_r.png	reconstruction	 Yi qi в представлении художника.
43	Yi qi/Yi_f.png	fossil_photo	Образец STM 31-2.
44	Yi qi/Yi_s.png	size_comparison	Сравнение размера Yi qi с человеком.
45	Sinopterus/Wu_et_al_2026.pdf	pdf_article	Препринт статьи о Sinopterus dongi с сайта biorxiv.org.
46	Sinopterus/Sinopterus_r.png	reconstruction	Художественная реконструкция   Sinopterus dongi из Wu et al., 2026.
47	Sinopterus/Sinopterus_f.png	fossil_photo	Образец CUGB-P2201.
48	Sinopterus/Sinopterus_s.png	size_comparison	Размеры Sinopterus dongi.
151	Saurolophus/Saurolophus_s.png	size_comparison	Размеры зауролофов.
49	Diplodocus/Gallagher_et_al_2025.pdf	pdf_article	Статья из Royal Society Open Science об окраске Diplodocus sp.
50	Diplodocus/Diplodocus_r.jpeg	reconstruction	Детеныши диплодока в представлении художника.
51	Diplodocus/Diplodocus_s.png	size_comparison	Размеры взрослого диплодока.
52	Diplodocus/Diplodocus_f.png	fossil_photo	Фотографии образцов чешуи диплодока из Gallagher et al., 2025.
53	Yuanchuavis/Wang_et_al_2021.pdf	pdf_article	Статья из Current Biology, содержащая данные об окраске Yuanchuavis kompsosoura.
54	Yuanchuavis/Yuanchuavis_r.png	reconstruction	Yuanchuavis kompsosoura в представлении художника.
56	Wulong/Croudace_et_al_2023.pdf	pdf_article	Статья из Acta Palaeontologica Polonica об окраске молодой особи Wulong bohaiensis.
57	Wulong/Wulong_r.png	reconstruction	Реконструкция Wulong bohaiensis из Croudace et al. (2023).
58	Wulong/Wulong_f.png	fossil_photo	Образец DNHM D2933.
59	Wulong/Wulong_s.png	size_comparison	Размеры Wulong bohaiensis.
60	Stenopterygius/Stenopterygius_s.png	size_comparison	Размеры ихтиозавра.
61	Stenopterygius/Stenopterygius_r.png	reconstruction	Возможная окраска ихтиозавра.
62	Stenopterygius/Stenopterygius_f.png	fossil_photo	Stenopterygius specimen MH 432.
63	Tylosaurus/Tylosaurus_r.png	reconstruction	Возможная окраска мозазавра Tylosaurus nepaeolicus.
64	Tylosaurus/Tylosaurus_s.png	size_comparison	Размеры Tylosaurus в сравнении с человеком.
65	Tylosaurus/Tylosaurus_f.png	fossil_photo	Фото образца SMU 76532.
66	Wiwaxia/Wiwaxia_r.png	reconstruction	Реконструкция внешнего вида Wiwaxia corrugata.
67	Wiwaxia/Wiwaxia_f.png	fossil_photo	Ископаемый образец Wiwaxia corrugata.
68	Wiwaxia/Wiwaxia_s.png	size_comparison	Размеры Wiwaxia corrugata.
70	Canadia/Canadia_r.png	reconstruction	Реконструкция внешнего вида Canadia spinosa.
71	Canadia/Canadia_fs.png	fossil_photo	Фотография образца Canadia spinosa с миллиметровой шкалой для масштаба.
72	Marrella/Marrella_r.png	reconstruction	Реконструкция внешнего вида Marrella splendens.
73	Marrella/Marrella_fs.png	fossil_photo	Ископаемый образец Marrella splendens.
74	Anurognathidae/Yang_et_al_2019_preprint.pdf	pdf_article	Препринт работы Yang et al. (2019) с сайта researchgate.net.
75	Anurognathidae/Anurognathidae_f.png	fossil_photo	Фотографии образца CAGS-Z070.
76	Anurognathidae/Anurognathidae_r1.png	reconstruction	Анурогнатидный птерозавр в представлении художника.
77	Anurognathidae/Anurognathidae_s.png	size_comparison	Размеры различных анурогнатидных птерозавров.
78	Anurognathidae/Anurognathidae_r2.png	reconstruction	Художественная реконструкция из Yang et al. (2019).
79	Megalograptus/Megalograptus_r.png	reconstruction	Прижизненная окраска мегалограпта.
80	Megalograptus/Megalograptus_f.jpg	fossil_photo	Один из образцов Megalograptus ohioensis.
81	Megalograptus/Megalograptus_s.png	size_comparison	Размеры Megalograptus williamsae (слева) и Megalograptus ohioensis (справа).
82	Carcinosoma/Carcinosoma_r.png	reconstruction	Художественная реконструкция Carcinosoma newlini.
83	Carcinosoma/Carcinosoma_f.png	fossil_photo	Ископаемый образец Carcinosoma newlini.
84	Carcinosoma/Carcinosoma_s.png	size_comparison	Размеры различных видов карциносом.
69	Wiwaxia/Parker_1998.pdf	pdf_article	Статья Parker (1998) про Wiwaxia corrugata, Canadia spinosa и Marrella splendens.
85	Archaeopteryx/Carney_2012.pdf	pdf_article	Статья Carney et al., 2012.
86	Archaeopteryx/Carney_2020.pdf	pdf_article	Статья Carney et al., 2020.
87	Archaeopteryx/Manning_2013.pdf	pdf_article	Статья Manning et al., 2013.
88	Archaeopteryx/Archaeopteryx_r.png	reconstruction	Художественная реконструкция Archaeopteryx lithographica.
89	Archaeopteryx/Archaeopteryx_r2.png	reconstruction	Макет Archaeopteryx lithographica с предполагаемой прижизненной окраской на основе Берлинского образца HMN 1880/81.
90	Archaeopteryx/Archaeopteryx_f.png	fossil_photo	Изученное перо Archaeopteryx lithographica и Берлинский образец HMN 1880/81.
91	Archaeopteryx/Archaeopteryx_s.png	size_comparison	Размеры Archaeopteryx lithographica.
92	Tupandactylus/Cincotta_et_al_2022.pdf	pdf_article	Статья Cincotta et al., 2022 (Nature) об окраске Tupandactylus imperator.
93	Tupandactylus/Tupandactylus_f.png	fossil_photo	Фотографии исследованных участков образца  MCT.R.1884.
94	Tupandactylus/Tupandactylus_r.png	reconstruction	Реконструкция внешнего вида Tupandactylus imperator.
95	Tupandactylus/Tupandactylus_s.png	size_comparison	Размеры Tupandactylus imperator.
97	Changzuiornis/Huang_et_al_2016.pdf	pdf_article	Исследование Changzuiornis ahgmi и описание его окраски.
98	Changzuiornis/Changzuiornis_f.png	fossil_photo	Фото образца AGB5840.
99	Beipiaosaurus/Beipiaosaurus_r.png	reconstruction	Beipiaosaurus в представлении художника.
100	Beipiaosaurus/Beipiaosaurus_f.jpg	fossil_photo	Фото образца BMNHC PH000911.
101	Beipiaosaurus/Li_et_al_2014.pdf	pdf_article	Статья из журнала Nature о связи формы меланосом с окраской.
102	Beipiaosaurus/Beipiaosaurus_s.jpeg	size_comparison	Размеры бэйпяозавра.
104	Caudipteryx/Caudipteryx_r.png	reconstruction	Художественная реконструкция Caudipteryx zoui.
105	Caudipteryx/Caudipteryx_s.png	size_comparison	Размеры Caudipteryx zoui.
106	Caudipteryx/Caudipteryx_f.png	fossil_photo	Фото образца PMOL AD00020.
55	Yuanchuavis/Yuanchuavis_f.jpg	fossil_photo	Образец IVPP V27883. Масштабная линейка 20 мм.
107	Eoconfuciusornis/Eoconfuciusornis_r.png	reconstruction	Реконструкция внешнего вида Eoconfuciusornis.
108	Eoconfuciusornis/Zheng_et_al_2017.pdf	pdf_article	Статья с исследованием окраски Eoconfuciusornis.
111	CUGB P1202/Peteya_et_al_2016.pdf	pdf_article	Исследование окраски образца CUGB P1202 энанциорнисовой птицы.
112	CUGB P1202/CUGB P1202_r.png	reconstruction	Энанциорнисовая птица CUGB P1202 в представлении художника.
113	Pterorhynchus/Pterorhynchus_r.png	reconstruction	Реконструкция головы Pterorhynchus wellnhoferi.
114	Pterorhynchus/Czerkas_&_Ji_2002_abridged.pdf	pdf_article	Сокращенная версия работы Stephen A. Czerkas & Qiang Ji (2002) с сайта Музея Динозавров в Юте.
115	Pterorhynchus/Pterorhynchus_f.png	fossil_photo	Фото ископаемого образца Pterorhynchus wellnhoferi.
116	Pterorhynchus/Pterorhynchus_s.png	size_comparison	Размеры Pterorhynchus wellnhoferi.
117	Roy_et_al_2020.pdf	pdf_article	Обзорная статья по палеоколористике амниот в Biological reviews of the Cambridge Philosophical Society.
118	Platecarpus/Platecarpus_r.png	reconstruction	Platecarpus в представлении художника.
119	Platecarpus/Platecarpus_f1.png	fossil_photo	Фото образца LACM 128319.
120	Platecarpus/Platecarpus_f2.png	fossil_photo	Чешуя Platecarpus tympaniticus. Возможные следы прижизненного окраса представлены на рисунках C и F.
121	Platecarpus/Platecarpus_s.png	size_comparison	Размеры Platecarpus.
122	Platecarpus/Lindgren_et_al_2010.pdf	pdf_article	Статья с исследованием образца LACM 128319.
127	Trilobites/Trilobites_f1.png	fossil_photo	Фотографии образцов трилобитов Isotellus maximus (1, 2), Anomocare vittata (3) и Proetus tenuituberculus (4) 
128	Trilobites/Trilobites_f2.png	fossil_photo	Пигментные пятна на панцире трилобита Eldredgeops crassituberculata.
129	Trilobites/Schoenemann_et_al_2014.pdf	pdf_article	Статья Schoenemann et al., 2014 об окраске девонских трилобитов.
130	Trilobites/Schoenemann_et_al_2015.pdf	pdf_article	Статья Schoenemann et al., 2015 о флуоресценции глаз трилобитов.
132	Cephalopods/Cephalopods_r1.png	reconstruction	Палеозойские прямораковинные моллюски.
133	Cephalopods/Cephalopods_r2.png	reconstruction	Варианты узоров на раковинах прямораковинных головоногих моллюсков (из Manda & Turek (2025)).
134	Cephalopods/Manda_&_Turek_2025.pdf	pdf_article	Статья Manda & Turek (2025).
137	Cephalopods/Cephalopods_f3.png	fossil_photo	Узоры на раковине Pseudocyrtoceras. Масштабная линейка 5 мм.
135	Cephalopods/Cephalopods_f1.png	fossil_photo	Фотография раковины Orthoceras anguliferum (девон, Германия).
138	Vinther_2015.pdf	pdf_article	Обзорная статья по восстановлению окраски ископаемых животных.
139	Same_as_modern/Yang_et_al_2014.pdf	pdf_article	Исследование окраски мезозойских сетчатокрылых.
141	Same_as_modern/Cai_et_al_2020.pdf	pdf_article	Исследование структурной окраски мезозойских насекомых.
143	Same_as_modern/Insects_f.png	fossil_photo	Жуки, мухи и осы в меловом янтаре.
144	Same_as_modern/Kalligrammatidae_f.png	fossil_photo	Ископаемые сетчатокрылые семейства Kalligrammatidae.
145	Same_as_modern/Thrissops_f.png	fossil_photo	Позднеюрская рыба Thrissops со следами прижизненной окраски на чешуе.
142	Same_as_modern/Same_as_modern_r.png	reconstruction	\N
146	Same_as_modern/Brachiopoda_f.png	fossil_photo	Ископаемые брахиоподы со следами прижизненной окраски.
147	Mesozoic mammaliaforms/Li_et_al_2025.pdf	pdf_article	Исследование окраски мезозойских млекопитающих.
149	Mesozoic mammaliaforms/Mesozoic mammaliaforms_f.jpg	fossil_photo	Ископаемый образец Arboroharamiya fuscus.
148	Mesozoic mammaliaforms/Mesozoic mammaliaforms_r.jpg	reconstruction	Животные, изученные в Li et al., 2025 в представлении художника (картинка из статьи). Сверху вниз: A. fuscus (CUGB-P1901), V. diplomylos (SDUST-V0010), M. mammaliaformis (PMOL-AM00007) и докодонты SDUST-V0006 и SDUST-V0007.
150	Saurolophus/Bell_2012.pdf	pdf_article	Статья об исследовании чешуи Saurolophus angustirostris и Saurolophus osborni.
124	Eggs/Heyuannia_eggs_r.png	reconstruction	Модель гнезда Heyuannia huangi.
125	Eggs/Heyuannia_eggs_fs.png	fossil_photo	Ископаемые яйца Heyuannia huangi и модель яйца.
109	Eoconfuciusornis/Eoconfuciusornis_f.png	fossil_photo	Фото образца STM7-144. Масштабная линейка 20 мм.
110	CUGB P1202/CUGB P1202_f.jpg	fossil_photo	Фото образца CUGB P1202. Масштабная линейка 1 см.
136	Cephalopods/Cephalopods_f2.png	fossil_photo	Узоры на раковине Pellucidoceras decipiens. Масштабная линейка 1 см.
96	Changzuiornis/Changzuiornis_r.png	reconstruction	Художественная реконструкция Changzuiornis ahgmi (цвет изменен, автор оригинала — José Carlos Cortés).
126	Trilobites/Trilobites_r.png	reconstruction	Реконструкция внешнего вида трилобита Eldredgeops с пятнистым узором на панцире. Автор оригинала — Emily S. Damstra.
152	Saurolophus/Saurolophus_angustirostris_r.png	reconstruction	Saurolophus angustirostris в представлении художника.
157	Hadrosauridae/Hadrosauridae_r.png	reconstruction	Реконструкция YPMPU 016969 из Fabbri et al. (2019).
153	Saurolophus/Saurolophus_osborni_r.png	reconstruction	Saurolophus osborni в представлении художника.
158	Hadrosauridae/Hadrosauridae_f.png	fossil_photo	Образцы кожи YPMPU 016969.
154	Saurolophus/Saurolophus_angustirostris_f.png	fossil_photo	Образец кожи Saurolophus angustirostris.
155	Saurolophus/Saurolophus_osborni_f.png	fossil_photo	Образцы кожи Saurolophus osborni.
156	Hadrosauridae/Fabbri_et_al_2019.pdf	pdf_article	Исследование кожи гадрозавра YPMPU 016969.
159	Serikornis/Serikornis_r.png	reconstruction	Serikornis sungei в представлении художника.
160	Serikornis/Serikornis_f1.png	fossil_photo	Фотография и зарисовка образца PMOL-AB00200.
161	Serikornis/Serikornis_f2.png	fossil_photo	Участки оперения Serikornis sungei, в том числе с сохранившимися цветовыми отметинами.
191	Enantiornithes/Enantiornithes_r.png	reconstruction	Художественная реконструкция птенца из бирманского янтаря
162	Serikornis/Serikornis_s.png	size_comparison	Размеры Serikornis sungei.
163	Edmontosaurus/Osborn_1912.pdf	pdf_article	Статья Генри Осборна с описанием чешуи Edmontosaurus annectens.
164	Edmontosaurus/Drumheller_et_al_2022.pdf	pdf_article	Статья, содержащая художественную реконструкцию Edmontosaurus annectens.
165	Edmontosaurus/Edmontosaurus_r.png	reconstruction	Художественная реконструкция Edmontosaurus annectens.
166	Edmontosaurus/Edmontosaurus_f1.png	fossil_photo	Участок кожи образца эдмонтозавра AMNH 5060.
167	Edmontosaurus/Edmontosaurus_f2.png	fossil_photo	Зарисовки чешуи Edmontosaurus annectens из Osborn (1912).
168	Edmontosaurus/Edmontosaurus_s.png	size_comparison	Размеры Edmontosaurus annectens.
169	Edmontosaurus/Edmontosaurus_f3.png	fossil_photo	Передняя лапа образца NDGS 2000.
170	Edmontosaurus/Edmontosaurus_f4.png	fossil_photo	Мумия эдмонтозавра.
171	DIP-V-15103/DIP-V-15103_r.jpg	reconstruction	Художественная реконструкция детеныша целурозавра из Мьянмы.
172	DIP-V-15103/DIP-V-15103_f.jpg	fossil_photo	Фотография образца DIP-V-15103.
173	DIP-V-15103/Xing_et_al_2016.pdf	pdf_article	Исследование детеныша целурозавра из бирманского янтаря.
174	Cruralispennia/Wang_et_al_2017.pdf	pdf_article	Статья о Cruralispennia multidonta.
175	Cruralispennia/Cruralispennia_r.jpg	reconstruction	Художественная реконструкция Cruralispennia multidonta.
177	Protopteryx/Protopteryx_r.png	reconstruction	Protopteryx fengningensis в представлении художника.
178	Protopteryx/Protopteryx_f.png	fossil_photo	Ископаемый образец Protopteryx fengningensis.
179	Protopteryx/Protopteryx_s.png	size_comparison	Размеры протоптерикса.
180	Iteravis/Iteravis_r.png	reconstruction	Iteravis huchzermeyeri в представлении художника.
181	Iteravis/Iteravis_f.jpg	fossil_photo	Ископаемый образец Iteravis huchzermeyeri.
182	Iteravis/Wang_et_al_2018.pdf	pdf_article	Статья, содержащая данные об окраске Iteravis huchzermeyeri.
184	Shangyang/Shangyang_f.png	fossil_photo	Образец IVPP V26899.
185	Shangyang/Li_et_al_2025.pdf	pdf_article	Исследование окраски хохолка Shangyang.
123	Eggs/Wiemann_et_al_2015.pdf	pdf_article	Статья с описанием цвета скорлупы яиц Heyuannia huangi.
186	Eggs/Eggs_r.png	reconstruction	Реконструкция формы и цвета яиц меловых и более поздних видов, их рамановские спектры, фотографии образцов и обозначения типов гнездования: зарытое, открытое наземное и открытое древесное из работы Wiemann et al. (2018).
188	Ammonoid/Ammonoid_f1.png	fossil_photo	Следы прижизненной окраски (поперечные полосы) аммонитов Cardioceratidae из верхнемеловых отложений Рязанской и Саратовской областей.
189	Ammonoid/Ammonoid_f2.png	fossil_photo	Продольные цветовые полосы (см. стрелки) на образце Xipheroceras sp. из Германии.
190	Ammonoid/Ammonoid_f3.png	fossil_photo	Пять родов аммоноидей из поздней юры с иризирующими продольными цветовыми полосами. Российские (a–o) и польские (p–q).
187	Ammonoid/Ammonoid_r.png	reconstruction	Реконструкция Kachpurites fulgens (A) и Garniericeras catenulatum (B), выполненная Андреем Атучиным.
192	Enantiornithes/Xing_et_al_2016.pdf	pdf_article	Исследование крыльев мезозойских птиц в янтаре.
193	Enantiornithes/Enantiornithes_f1.png	fossil_photo	Фотографии образца DIP-V-15100 из Xing et al. (2016).
194	Enantiornithes/Enantiornithes_f2.png	fossil_photo	Фотографии образца DIP-V-15101 из Xing et al. (2016).
15	Sinosauropteryx/Sinosauropteryx_r.jpeg	reconstruction	Sinosauropteryx prima в представлении художника.
176	Cruralispennia/Cruralispennia_f.jpg	fossil_photo	Фотография и зарисовка образца IVPP V21711. Масштабная линейка 10 мм.
197	Stenopterygius/Lindgren_et_al_2018.pdf	pdf_article	Исследование экземпляра MH 432 ихтиозавра Stenopterygius sp.
198	Ammonoid/Mironenko_2015.pdf	pdf_article	Публикация Александра Мироненко о прижизненной окраске аммонитов.
195	Enantiornithes/Enantiornithes_f3.png	fossil_photo	Образец HPG-15-1, его реконструкция по результатам компьютерной томографии и схематическое изображение из Xing et al. (2017). Масштабная линейка 10 мм.
131	Trilobites/Trilobites_f3.png	fossil_photo	Фотография экземпляра Illaenus из Санкт-Петербурга с темными радиальными полосами на пигидии.
183	Shangyang/Shangyang_r.png	reconstruction	Голова Shangyang в представлении художника.
199	Same_as_modern/Lichenipolystoechotes_f.png	fossil_photo	Фотографии и зарисовки крыльев Lichenipolystoechotes.
200	Same_as_modern/Fang_et_al_2020.pdf	pdf_article	Статья о юрских сетчатокрылых Lichenipolystoechotes, мимикрирующих под лишайник.
\.


--
-- Data for Name: publication; Type: TABLE DATA; Schema: public; Owner: paleo_admin
--

COPY public.publication (id, title, year, authors, abstract, doi, description) FROM stdin;
5	Fossilised melanosomes and the colour of Cretaceous dinosaurs and birds	2010	Fucheng Zhang, Stuart L. Kearns, Patrick J. Orr, Michael J. Benton, Zhonghe Zhou, Diane Johnson, Xing Xu, Xiaolin Wang	Spectacular fossils from the Early Cretaceous Jehol Group of northeastern China have greatly expanded our knowledge of the diversity and palaeobiology of dinosaurs and early birds, and contributed to our understanding of the origin of birds, of flight, and of feathers. Pennaceous (vaned) feathers and integumentary filaments are preserved in birds and non-avian theropod dinosaurs, but little is known of their microstructure. Here we report that melanosomes (colour-bearing organelles) are not only preserved in the pennaceous feathers of early birds, but also in an identical manner in integumentary filaments of non-avian dinosaurs, thus refuting recent claims that the filaments are partially decayed dermal collagen fibres. Examples of both eumelanosomes and phaeomelanosomes have been identified, and they are often preserved in life position within the structure of partially degraded feathers and filaments. Furthermore, the data here provide empirical evidence for reconstructing the colours and colour patterning of these extinct birds and theropod dinosaurs: for example, the dark-coloured stripes on the tail of the theropod dinosaur Sinosauropteryx can reasonably be inferred to have exhibited chestnut to reddish-brown tones.	https://doi.org/10.1038/nature08740	Статья из журнала Nature, в которой описаны Huadanosaurus (здесь он обозначен как Sinosauropteryx, что исправлено в дальнейших работах), Sinornithosaurus и Confuciusornis.
4	Reconstruction of Microraptor and the Evolution of Iridescent Plumage	2012	Quanguo Li, Ke-Qin Gao, Qingjin Meng, Julia A. Clarke, Matthew D. Shawkey, Liliana D'Alba, Rui Pei, Mick Ellison, Mark A. Norell, Jakob Vinther	Iridescent feather colors involved in displays of many extant birds are produced by nanoscale arrays of melanin-containing organelles (melanosomes). Data relevant to the evolution of these colors and the properties of melanosomes involved in their generation have been limited. A data set sampling variables of extant avian melanosomes reveals that those forming most iridescent arrays are distinctly narrow. Quantitative comparison of these data with melanosome imprints densely sampled from a previously unknown specimen of the Early Cretaceous feathered Microraptor predicts that its plumage was predominantly iridescent. The capacity for simple iridescent arrays is thus minimally inferred in paravian dinosaurs. This finding and estimation of Microraptor feathering consistent with an ornamental function for the tail suggest a centrality for signaling in early evolution of plumage and feather color.	https://doi.org/10.1126/science.1213780	Исследование окраски микрораптора.
2	A bony-crested Jurassic dinosaur with evidence of iridescent plumage highlights complexity in early paravian evolution	2018	 Dongyu Hu, Julia A. Clarke, Chad M. Eliason, Rui Qiu, Quanguo Li, Matthew D. Shawkey, Cuilin Zhao, Liliana D'Alba, Jinkai Jiang, Xing Xu	The Jurassic Yanliao theropods have offered rare glimpses of the early paravian evolution and particularly of bird origins, but, with the exception of the bizarre scansoriopterygids, they have shown similar skeletal and integumentary morphologies. Here we report a distinctive new Yanliao theropod species bearing prominent lacrimal crests, bony ornaments previously known from more basal theropods. It shows longer arm and leg feathers than Anchiornis and tail feathers with asymmetrical vanes forming a tail surface area even larger than that in Archaeopteryx. Nanostructures, interpreted as melanosomes, are morphologically similar to organized, platelet-shaped organelles that produce bright iridescent colours in extant birds. The new species indicates the presence of bony ornaments, feather colour and ﬂight-related features consistent with proposed rapid character evolution and signiﬁcant diversity in signalling and locomotor strategies near bird origins.	https://doi.org/10.1038/s41467-017-02515-y	Исследование окраски Caihong juji.
1	Plumage Color Patterns of an Extinct Dinosaur	2010	Quanguo Li, Ke-Qin Gao, Jakob Vinther, Matthew D. Shawkey, Julia A. Clarke, Liliana D'Alba, Qingjin Meng, Derek E. G. Briggs, Richard O. Prum	For as long as dinosaurs have been known to exist, there has been speculation about their appearance. Fossil feathers can preserve the morphology of color-imparting melanosomes, which allow color patterns in feathered dinosaurs to be reconstructed. Here, we have mapped feather color patterns in a Late Jurassic basal paravian theropod dinosaur. Quantitative comparisons with melanosome shape and density in extant feathers indicate that the body was gray and dark and the face had rufous speckles. The crown was rufous, and the long limb feathers were white with distal black spangles. The evolution of melanin-based within-feather pigmentation patterns may coincide with that of elongate pennaceous feathers in the common ancestor of Maniraptora, before active powered flight. Feathers may thus have played a role in sexual selection or other communication.	https://doi.org/10.1126/science.1186290	Публикация в журнале Science (2010). Восстановление окраски динозавра путем анализа ископаемых меланосом.
3	3D Camouflage in an Ornithischian Dinosaur	2016	Jakob Vinther, Robert Nicholls, Stephan Lautenschlager, Michael Pittman, Thomas G. Kaye, Emily Rayfield, Gerald Mayr, Innes C. Cuthill	Countershading was one of the first proposed mechanisms of camouflage [1, 2]. A dark dorsum and light ventrum counteract the gradient created by illumination from above, obliterating cues to 3D shape [3-6]. Because the optimal countershading varies strongly with light environment [7-9], pigmentation patterns give clues to an animal's habitat. Indeed, comparative evidence from ungulates [9] shows that interspecific variation in countershading matches predictions: in open habitats, where direct overhead sunshine dominates, a sharp dark-light color transition high up the body is evident; in closed habitats (e.g., under forest canopy), diffuse illumination dominates and a smoother dorsoventral gradation is found. We can apply this approach to extinct animals in which the preservation of fossil melanin allows reconstruction of coloration [10-15]. Here we present a study of an exceptionally well-preserved specimen of Psittacosaurus sp. from the Chinese Jehol biota [16, 17]. This Psittacosaurus was countershaded [16] with a light underbelly and tail, whereas the chest was more pigmented. Other patterns resemble disruptive camouflage, whereas the chin and jugal bosses on the face appear dark. We projected the color patterns onto an anatomically accurate life-size model in order to assess their function experimentally. The patterns are compared to the predicted optimal countershading from the measured radiance patterns generated on an identical uniform gray model in direct versus diffuse illumination. These studies suggest that Psittacosaurus sp. inhabited a closed habitat such as a forest with a relatively dense canopy.	https://doi.org/10.1016/j.cub.2016.06.065	Исследование меланосом и пигментных узоров пситтакозавра.
6	Molecular composition and ultrastructure of Jurassic paravian feathers	2015	Johan Lindgren, Peter Sjövall, Ryan M. Carney, Aude Cincotta, Per Uvdal, Steven W. Hutcheson, Ola Gustafsson, Ulysse Lefèvre, François Escuillié, Jimmy Heimdal, Anders Engdahl, Johan A. Gren, Benjamin P. Kear, Kazumasa Wakamatsu, Johan Yans & Pascal Godefroit 	Feathers are amongst the most complex epidermal structures known and they have a well-documented evolutionary trajectory across non-avian dinosaurs and basal birds. Moreover, melanosome-like microbodies preserved in association with fossil plumage have been used to reconstruct original colour, behaviour and physiology. However, these putative ancient melanosomes might alternatively represent microorganismal residues, a conflicting interpretation compounded by a lack of unambiguous chemical data. We therefore used sensitive molecular imaging, supported by multiple independent analytical tests, to demonstrate that the filamentous epidermal appendages in a new specimen of the Jurassic paravian Anchiornis comprise remnant eumelanosomes and fibril-like microstructures, preserved as endogenous eumelanin and authigenic calcium phosphate. These results provide novel insights into the early evolution of feathers at the sub-cellular level and unequivocally determine that melanosomes can be preserved in fossil feathers.	https://doi.org/10.1038/srep13520	Масс-спектрометрия экземпляра YFGP-T5199. Подтверждено наличие эумеланина в хохолке динозавра, но не обнаружен феомеланин.
7	Two new compsognathid-like theropods show diversified predation strategies in theropod dinosaurs 	2025	 Rui Qiu, Xiaolin Wang, Shunxing Jiang, Jin Meng, Zhonghe Zhou	The Compsognathidae was originally considered an early-diverging clade of coelurosaur theropods. However, recent study suggests that Compsognathidae is not monophyletic. Here, we describe two new compsognathid-like species, Sinosauropteryx lingyuanensis sp. nov. and Huadanosaurus sinensis gen. et sp. nov. from the Lower Cretaceous Yixian Formation of Dawangzhangzi (Lingyuan, Western Liaoning, China). The phylogenetic results indicate that all compsognathid-like theropods from the Early Cretaceous Jehol Biota form a monophyletic group Sinosauropterygidae nested among early-diverging coelurosaurs. Morphological comparison between various species of sinosauropterygids from the Early Cretaceous of Northeast China, combined with the phylogenetic results, suggests that at least three distinct hunting strategies were present among coeval species. The diversification of theropods should be attributed to the landscape caused by the destruction of the North China craton.	https://doi.org/10.1093/nsr/nwaf068	Статья, определяющая образец IVPP V14202 как голотип Huadanosaurus sinensis.
8	Countershading and Stripes in the Theropod Dinosaur Sinosauropteryx Reveal Heterogeneous Habitats in the Early Cretaceous Jehol Biota	2017	Fiann M. Smithwick, Robert Nicholls, Innes C. Cuthill, Jakob Vinther 	Countershading is common across a variety of lineages and ecological time. A dark dorsum and lighter ventrum helps to mask the three-dimensional shape of the body by reducing self-shadowing and decreasing conspicuousness, thus helping to avoid detection by predators and prey. The optimal countershading pattern is dictated by the lighting environment, which is in turn dependent upon habitat. With the discovery of fossil melanin, it is possible to infer original color patterns from fossils, including countershading. Applying these principles, we describe the pattern of countershading in the diminutive theropod dinosaur Sinosauropteryx from the Early Cretaceous Jehol Biota of Liaoning, China. From reconstructions based on exceptional fossils, the color pattern is compared to predicted optimal countershading transitions based on 3D reconstructions of the animal's abdomen, imaged in different lighting environments. Reconstructed patterns match well with those predicted for animals living in open habitats. Jehol is presumed to have been a predominantly closed forested environment, but our results indicate a more heterogeneous range of habitats. Sinosauropteryx is also shown to exhibit a "bandit mask," a common pattern in many living vertebrates, particularly birds, that serves multiple functions including camouflage. Sinosauropteryx therefore shows multiple color pattern features likely related to the habitat in which it lived. Our results show how reconstructing the color of extinct animals can inform on their ecologies beyond what may be obvious from skeletal remains alone.	https://doi.org/10.1016/j.cub.2017.09.032	Исследование окраски Sinosauropteryx prima.
11	An Exceptionally Preserved Three-Dimensional Armored Dinosaur Reveals Insights into Coloration and Cretaceous Predator-Prey Dynamics	2017	Caleb M Brown, Donald M Henderson, Jakob Vinther, Ian Fletcher, Ainara Sistiaga, Jorsua Herrera, Roger E Summons	Predator-prey dynamics are an important evolutionary driver of escalating predation mode and efficiency, and commensurate responses of prey. Among these strategies, camouflage is important for visual concealment, with countershading the most universally observed. Extant terrestrial herbivores free of significant predation pressure, due to large size or isolation, do not exhibit countershading. Modern predator-prey dynamics may not be directly applicable to those of the Mesozoic due to the dominance of very large, visually oriented theropod dinosaurs. Despite thyreophoran dinosaurs' possessing extensive dermal armor, some of the most extreme examples of anti-predator structures, little direct evidence of predation on these and other dinosaur megaherbivores has been documented. Here we describe a new, exquisitely three-dimensionally preserved nodosaurid ankylosaur, Borealopelta markmitchelli gen. et sp. nov., from the Early Cretaceous of Alberta, which preserves integumentary structures as organic layers, including continuous fields of epidermal scales and intact horn sheaths capping the body armor. We identify melanin in the organic residues through mass spectroscopic analyses and observe lighter pigmentation of the large parascapular spines, consistent with display, and a pattern of countershading across the body. With an estimated body mass exceeding 1,300 kg, B. markmitchelli was much larger than modern terrestrial mammals that either are countershaded or experience significant predation pressure as adults. Presence of countershading suggests predation pressure strong enough to select for concealment in this megaherbivore despite possession of massive dorsal and lateral armor, illustrating a significant dichotomy between Mesozoic predator-prey dynamics and those of modern terrestrial systems. 	https://doi.org/10.1016/j.cub.2017.06.071	Исследование окраски Borealopelta markmitchelli.
12	A bizarre Jurassic maniraptoran theropod with preserved evidence of membranous wings	2015	Xing Xu, Xiaoting Zheng, Corwin Sullivan, Xiaoli Wang, Lida Xing, Yan Wang, Xiaomei Zhang, Jingmai K. O’Connor, Fucheng Zhang & Yanhong Pan	The wings of birds and their closest theropod relatives share a uniform fundamental architecture, with pinnate flight feathers as the key component. Here we report a new scansoriopterygid theropod, Yi qi gen. et sp. nov., based on a new specimen from the Middle-Upper Jurassic period Tiaojishan Formation of Hebei Province, China. Yi is nested phylogenetically among winged theropods but has large stiff filamentous feathers of an unusual type on both the forelimb and hindlimb. However, the filamentous feathers of Yi resemble pinnate feathers in bearing morphologically diverse melanosomes. Most surprisingly, Yi has a long rod-like bone extending from each wrist, and patches of membranous tissue preserved between the rod-like bones and the manual digits. Analogous features are unknown in any dinosaur but occur in various flying and gliding tetrapods, suggesting the intriguing possibility that Yi had membranous aerodynamic surfaces totally different from the archetypal feathered wings of birds and their closest relatives. Documentation of the unique forelimbs of Yi greatly increases the morphological disparity known to exist among dinosaurs, and highlights the extraordinary breadth and richness of the evolutionary experimentation that took place close to the origin of birds.	https://doi.org/10.1038/nature14423	Статья с описанием Yi qi и его окраски.
10	Elaborate plumage patterning in a Cretaceous bird	2018	Quanguo Li, Julia A. Clarke, Ke-Qin Gao, Jennifer A. Peteya, Matthew D. Shawkey	Integumentary patterns and colors can differentiate species, sexes, and life changes and can inform on habitat and ecology. However, they are rarely preserved in the fossil record. Here, we report on an extremely well-preserved specimen of the Cretaceous bird Confuciusornis with unprecedented complexity, including small spots on the wings, crest, and throat. Morphological and chemical evidence suggest that these patterns are produced by melanin, but unusual preservation prevents assignment of specific colors. Based on comparisons with extant birds, these patterns were likely used for camouflage, although other functions including sexual signaling cannot be ruled out. Our data show that even more elaborate plumage patterns than the spangles in Anchiornis and stripes in Sinosauropteryx were present at a relatively early stage of avian evolution, showing the significance of coloration and patterning to feather evolution.	https://doi.org/10.7717/peerj.5831	Восстановление узора оперения Confuciusornis.
14	Fossilized melanosomes reveal colour patterning of a sauropod dinosaur	2025	Tess Gallagher, Dan Folkes, Michael Pittman, Tom G. Kaye, Glenn W. Storrs, Jason Schein	Integumentary fossils have improved understanding of dinosaur physiology, appearance and ecological niches. Fossil melanin and fossil melanosome organelles that produced melanin have made it possible to reconstruct dinosaur colour patterns, evidencing fundamental but previously elusive behaviours like camouflage. However, the colouration of several important groups, including sauropods, is still unknown. Here, we propose the first evidence of colouration in a sauropod based on potential melanosome-bearing epidermal scales. The fossil skin originates from juvenile diplodocids from the Mother’s Day Quarry of the Morrison formation in Montana, USA. Scanning electron microscopy reveals two fossilized epidermal layers in the scales that vary in microbody and carbon density. Two distinct microbodies are grouped together and dispersed within the potential outermost epidermal layer. The first are oblong-shaped and interpreted as melanosomes. The nature of the second disc-shaped microbody is unclear, but their flat shape is reminiscent of platelet melanosomes, though they are smaller in size.	https://doi.org/10.1098/rsos.251232	Исследование окраски детеныша диплодока.
16	Iridescent plumage in a juvenile dromaeosaurid theropod dinosaur	2023	Angus D. Croudace, Caizhi Shen, Junchang Lü, Stephen L. Brusatte, Jakob Vinther 	Colour reconstructions have provided new insights into the lives of dinosaurs and other extinct animals, by predicting colouration patterns from fossilised pigment-bearing organelles called melanosomes. Although these methods have become increasingly popular, only a small number of dinosaurs have been studied using these techniques, which require exceptional preservation of fossil feathers, leaving open key questions such as whether dinosaurs changed their plumage patterns during ontogeny. Here we reconstruct the feather colouration of an approximately one-year-old individual of the Early Cretaceous dromaeosaurid theropod Wulong bohaiensis, which to our knowledge is the first unequivocal juvenile paravian for which aspects of the original colour has been predicted. Using quadratic discriminant analysis (QDA) and multinomial logistic regression (MLR) on the most comprehensive available datasets, we find strong evidence for iridescent plumage of the forelimb and hindlimb remiges and grey plumage on other portions of the body. This suggests that some juvenile paravians used shiny iridescent feathers for signalling purposes, possibly even before reaching somatic or sexual maturity, and thus we can conclude that this paravian used iridescent signalling for intraspecific communication other than sexual signalling. Finally, our results show that when analysing fossil datasets that are entirely comprised of solid and cylindrical melanosomes QDA consistently outperforms MLR, providing more accurate and higher classification probability colour predictions.	https://doi.org/10.4202/app.01004.2022	Изучение окраски Wulong bohaiensis.
44	Earliest fossil evidence for protective pigmentation in an actinopterygian fish	1989	Michael D. Gottfried	The oldest known occurrence of an actinopterygian fish with preserved cryptic and disruptive pigmentation is a single specimen from a Permocarboniferous site in southeastern Kansas, U.S.A. It is a juvenile assignable to the Elonichthys species complex within the paraphyletic lower actinopterygian group “Palaeoniscoidea”;. The preserved pattern consists of dark dorsal mottlings and two lateral stripes that run the length of the body. These markings provide the earliest evidence in primitive fossil actinopterygians for (respectively) countershading and the use of disruptive markings to break up the body outline, two of the most common protective coloration strategies in Recent fishes. Anti‐predator protective markings therefore evolved in actinopterygians by at least the latter part of the Paleozoic (nearly 300 million years ago).	https://doi.org/10.1080/08912968909386514	Описание ископаемых свидетельств наружной защитной пигментации у пермской лучеперой рыбы.
17	Skin pigmentation provides evidence of convergent melanism in extinct marine reptiles	2014	Johan Lindgren, Peter Sjövall, Ryan M. Carney, Per Uvdal, Johan A. Gren, Gareth Dyke, Bo Pagh Schultz, Matthew Shawkey, Kenneth R. Barnes, Michael J. Polcyn	Throughout the animal kingdom, adaptive colouration serves critical functions ranging from inconspicuous camouflage to ostentatious sexual display, and can provide important information about the environment and biology of a particular organism. The most ubiquitous and abundant pigment, melanin, also has a diverse range of non-visual roles, including thermoregulation in ectotherms. However, little is known about the functional evolution of this important biochrome through deep time, owing to our limited ability to unambiguously identify traces of it in the fossil record. Here we present direct chemical evidence of pigmentation in fossilized skin, from three distantly related marine reptiles: a leatherback turtle, a mosasaur and an ichthyosaur. We demonstrate that dark traces of soft tissue in these fossils are dominated by molecularly preserved eumelanin, in intimate association with fossilized melanosomes. In addition, we suggest that contrary to the countershading of many pelagic animals, at least some ichthyosaurs were uniformly dark-coloured in life. Our analyses expand current knowledge of pigmentation in fossil integument beyond that of feathers, allowing for the reconstruction of colour over much greater ranges of extinct taxa and anatomy. In turn, our results provide evidence of convergent melanism in three disparate lineages of secondarily aquatic tetrapods. Based on extant marine analogues, we propose that the benefits of thermoregulation and/or crypsis are likely to have contributed to this melanisation, with the former having implications for the ability of each group to exploit cold environments.	https://doi.org/10.1038/nature12899	Статья с исследованием окраски ихтиозавра, мозазавра и эоценовой морской черепахи.
58	Iridescent structural coloration in a crested Cretaceous enantiornithine bird from the Jehol Biota	2025	Zhiheng Li, Jinsheng Hu, Thomas A. Stidham, Mao Ye, Min Wang, Yanhong Pan, Tao Zhao, Jingshu Li, Zhonghe Zhou, Julia A. Clarke	 Key Laboratory of Vertebrate Evolution and Human Origins, Institute of Vertebrate Paleontology and Paleoanthropology, Chinese Academy of Sciences, China; School of Instrumentation and Optoelectronic Engineering, Beihang University, China; Department of Biology, Austin College, United States; State Key Laboratory of Critical Earth Material Cycling and Mineral Deposits, School of Earth Sciences and Engineering, Centre for Research and Education on Biological Evolution and Environment and Frontiers Science Center for Critical Earth Material Cycling, Nanjing University, China; Institute of Palaeontology, Yunnan Key Laboratory of Earth System Science, Yunnan University, China; College of Earth and Planetary Sciences, University of Chinese Academy of Sciences, China; Department of Earth and Planetary Sciences, Jackson School of Geosciences, The University of Texas at Austin, United States	https://doi.org/10.7554/eLife.103628.3	Исследование окраски хохолка Shangyang.
18	Soft-tissue evidence for homeothermy and crypsis in a Jurassic ichthyosaur	2018	Johan Lindgren, Peter Sjövall, Volker Thiel, Wenxia Zheng, Shosuke Ito, Kazumasa Wakamatsu, Rolf Hauff, Benjamin P. Kear, Anders Engdahl, Carl Alwmark, Mats E. Eriksson, Martin Jarenmark, Sven Sachs, Per E. Ahlberg, Federica Marone, Takeo Kuriyama, Ola Gustafsson, Per Malmberg, Aurélien Thomen, Irene Rodríguez-Meizoso, Per Uvdal, Makoto Ojika & Mary H. Schweitzer 	Ichthyosaurs are extinct marine reptiles that display a notable external similarity to modern toothed whales. Here we show that this resemblance is more than skin deep. We apply a multidisciplinary experimental approach to characterize the cellular and molecular composition of integumental tissues in an exceptionally preserved specimen of the Early Jurassic ichthyosaur Stenopterygius. Our analyses recovered still-flexible remnants of the original scaleless skin, which comprises morphologically distinct epidermal and dermal layers. These are underlain by insulating blubber that would have augmented streamlining, buoyancy and homeothermy. Additionally, we identify endogenous proteinaceous and lipid constituents, together with keratinocytes and branched melanophores that contain eumelanin pigment. Distributional variation of melanophores across the body suggests countershading, possibly enhanced by physiological adjustments of colour to enable photoprotection, concealment and/or thermoregulation. Convergence of ichthyosaurs with extant marine amniotes thus extends to the ultrastructural and molecular levels, reflecting the omnipresent constraints of their shared adaptation to pelagic life.	https://doi.org/10.1038/s41586-018-0775-x	Исследование окраски ихтиозавра.
19	Colour in Burgess Shale animals and the effect of light on evolution in the Cambrian	1998	Parker A. R.	Diffraction gratings are reported from external surfaces of the hard, protective parts of Wiwaxia corrugata, Canadia spinosa and Marrella splendens from the Burgess Shale (Middle Cambrian (515 million years), British Columbia). As a consequence, these animals would have displayed iridescence in their natural environment: Cambrian animals have previously been accurately reconstructed in black and white only. A diversity of extant marine animals inhabiting a similar depth to the Burgess Shale fauna possess functional diffraction gratings. The Cambrian is a unique period in the history of animal life where predatory lifestyles and eyes capable of producing visual images were evolving rapidly. The discovery of colour in Cambrian animals prompts a new hypothesis on the initiation of the 'Big Bang' in animal evolution which occurred during the Cambrian: light was introduced into the behavioural systems of metazoan animals for the first time. This introduction, of what was to become generally the most powerful stimulus in metazoan behavioural systems, would have triggered turbulence in metazoan evolution.	https://doi.org/10.1098/rspb.1998.0385	Исследование окраски Wiwaxia corrugata, Canadia spinosa и Marrella splendens.
21	Upper Ordovician eurypterids of Ohio	1964	Caster & Kjellesvig-Waering	A metabentonite deposit in the upper Elkhorn formation (Richmond subseries, Cincinnatian series, Upper Ordovician) near Manchester, Adams County, Ohio, has yielded some of the most complete eurypterids known anywhere. The chitinous exoskeletons are preserved in an inflated state with the chitin still flexible and retaining what seems to be original "scorpionid" color pattern. Many of the specimens are completely articulated, and some have been largely freed from the matrix. Males, females, and various growth stages are known. The association is typically marine biocoenose with many characteristic upper Richmond marine invertebrates present (brachiopods, Bryozoa, pelecypods, trilobites). The general aspect of the organisms is that of mixopteroid eurypterids having exaggeratedly spinose grasping appendages. The whole body was scaly, porous and generally heavily hirsute, owing to the presence of many sensory bristles. Although referable to Megalograptus Miller, 1874 (based on an eurypterid leg originally mistakenly considered to be a giant graptolite), the species is new, and a new family is required. In several respects this is the most primitive eurypterid known, although by no means the oldest. It is at the same time curiously specialized: its body terminates in a horizontally opposable pair of scimitar-like cereal blades lying beneath the short stout telson which was capable of considerable vertical movement. Such a protective or copulatory device as the cereal blades is hitherto unknown among fossils, and among Recent forms only the earwigs (Insecta) are comparable. The systematics of the study include a reanalysis of the Caster and Kjellesvig-Waering (1955) families Megalograptidae and Mixopteridae. Under the former monotypic family all known species are considered: Megalograptus welchi Miller, the type species (Liberty formation); M. alveolatus (Shuler) (Bays formation of Virginia); M. ohioensis C. and Kj.-W., the main object of this paper (Elkhorn formation); M. shideleri, nov. sp. (Saluda formation); M. williamsae, nov. sp. (Waynesville formation), and a new form from the Whitewater formation too poorly represented for taxonomy. Stormer's (1934, 1955) Carcinosomatidae is emended to include four genera, two of which are proposed as new: Carcinosoma Claypole; PARACARCINOSOMA: P. scorpionis (Grote and Pitt); Rhinocarcinosoma Novojilov: and EOCARCINOMA, E. batrachophthalmus, nov. gen., nov. sp. A reclassification of the Eurypterida is proposed in which the Eurypterida are considered an order under the Class Merostomata. Two suborders, based on the structure of the chelicerae, are proposed: Eurypterida and Pterygotida. Three superfamilies are recognized for the suborder Eurypterida, namely Mixopteracea, Eurypteracea and Stylonuracea. The controversial habitat of the Eurypterida is reviewed with the conclusion that the eurypterids are found to have lived in three main marine ecological environments and remained in their ecological niches throughout their existence. The two more marine zone members reached extinction much earlier (essentially pre-Middle Devonian) that those of the more brackish water zone which continued to at least Middle Permian.	https://www.biodiversitylibrary.org/item/40619#page/381/mode/1up	Публикация с описанием прижизненной окраски Megalograptus ohioensis и родственных видов.
20	Pterosaur integumentary structures with complex feather-like branching	2019	Zixiao Yang, Baoyu Jiang, Maria E. McNamara, Stuart L. Kearns, Michael Pittman, Thomas G. Kaye, Patrick J. Orr, Xing Xu & Michael J. Benton	Pterosaurs were the first vertebrates to achieve true flapping flight, but in the absence of living representatives, many questions concerning their biology and lifestyle remain unresolved. Pycnofibres—the integumentary coverings of pterosaurs—are particularly enigmatic: although many reconstructions depict fur-like coverings composed of pycnofibres, their affinities and function are not fully understood. Here, we report the preservation in two anurognathid pterosaur specimens of morphologically diverse pycnofibres that show diagnostic features of feathers, including non-vaned grouped filaments and bilaterally branched filaments, hitherto considered unique to maniraptoran dinosaurs, and preserved melanosomes with diverse geometries. These findings could imply that feathers had deep evolutionary origins in ancestral archosaurs, or that these structures arose independently in pterosaurs. The presence of feather-like structures suggests that anurognathids, and potentially other pterosaurs, possessed a dense filamentous covering that probably functioned in thermoregulation, tactile sensing, signalling and aerodynamics.	https://doi.org/10.1038/s41559-018-0728-7	Исследование, описывающее четыре типа пикнофибр с ветвлением у двух анурогнатидных птерозавров.
22	Some Previously Unknown Morphological Structures of Carcinosoma newlini (Claypole)	1958	Erik N. Kjellesvig-Waering	An unusually well-preserved whole specimen of Carcinosoma newlini (Claypole) from the Silurian Kokomo dolomite at Kokomo, Indiana, exhibiting the original coloration and underside, as well as a definitely segmented structure posterior to the terminal spike, is described. A complete restoration of dorsal and ventral sides is given.	https://www.jstor.org/stable/1300736?googleloggedin=true&seq=1	Публикация с описанием прижизненной окраски Carcinosoma newlini.
23	New evidence on the colour and nature of the isolated Archaeopteryx feather	2012	Ryan M. Carney, Jakob Vinther, Matthew D. Shawkey, Liliana D'Alba & Jörg Ackermann	Archaeopteryx has been regarded as an icon of evolution ever since its discovery from the Late Jurassic limestone deposits of Solnhofen, Germany in 1861. Here we report the first evidence of colour from Archaeopteryx based on fossilized colour-imparting melanosomes discovered in this isolated feather specimen. Using a phylogenetically diverse database of extant bird feathers, statistical analysis of melanosome morphology predicts that the original colour of this Archaeopteryx feather was black, with 95% probability. Furthermore, reexamination of the feather's morphology leads us to interpret it as an upper major primary covert, contrary to previous interpretations. Additional findings reveal that the specimen is preserved as an organosulphur residue, and that barbule microstructure identical to that of modern bird feathers had evolved as early as the Jurassic. As in extant birds, the extensive melanization would have provided structural advantages to the Archaeopteryx wing feather during this early evolutionary stage of dinosaur flight.	https://doi.org/10.1038/ncomms1642	Первое исследование окраски изолированного пера археоптерикса.
24	Evidence corroborates identity of isolated fossil feather as a wing covert of Archaeopteryx	2020	Ryan M. Carney, Helmut Tischlinger & Matthew D. Shawkey	The historic fossil feather from the Jurassic Solnhofen has played a pivotal but controversial role in our evolutionary understanding of dinosaurs and birds. Recently, a study confirmed the diagnostic morphology of the feather’s original calamus, but nonetheless challenged the proposed identity as an Archaeopteryx covert. However, there are errors in the results and interpretations presented. Here we show that the feather is most likely an upper major primary covert, based on its long calamus (23.3% total length) and eight other anatomical attributes. Critically, this hypothesis is independently supported by evidence of similar primary coverts in multiple specimens of Archaeopteryx–including from the same fossil site and horizon as the isolated feather. We also provide additional insights, such as an updated colour reconstruction of the entire feather as matte black, with 90% probability. Given the isolated nature of the fossil feather, we can never know the anatomical and taxonomic provenance with 100% certainty. However, based on all available evidence, the most empirical and parsimonious conclusion is that this feather represents a primary covert from the ancient wing of Archaeopteryx.	https://doi.org/10.1038/s41598-020-65336-y	Повторное исследование пера археоптерикса.
26	Pterosaur melanosomes support signalling functions for early feathers	2022	Aude Cincotta, Michaël Nicolaï, Hebert Bruno Nascimento Campos, Maria McNamara, Liliana D’Alba, Matthew D. Shawkey, Edio-Ernst Kischlat, Johan Yans, Robert Carleer, François Escuillié & Pascal Godefroit	Remarkably well-preserved soft tissues in Mesozoic fossils have yielded substantial insights into the evolution of feathers. New evidence of branched feathers in pterosaurs suggests that feathers originated in the avemetatarsalian ancestor of pterosaurs and dinosaurs in the Early Triassic, but the homology of these pterosaur structures with feathers is controversial. Reports of pterosaur feathers with homogeneous ovoid melanosome geometries suggest that they exhibited limited variation in colour, supporting hypotheses that early feathers functioned primarily in thermoregulation. Here we report the presence of diverse melanosome geometries in the skin and simple and branched feathers of a tapejarid pterosaur from the Early Cretaceous found in Brazil. The melanosomes form distinct populations in different feather types and the skin, a feature previously known only in theropod dinosaurs, including birds. These tissue-specific melanosome geometries in pterosaurs indicate that manipulation of feather colour—and thus functions of feathers in visual communication—has deep evolutionary origins. These features show that genetic regulation of melanosome chemistry and shape was active early in feather evolution.	https://doi.org/10.1038/s41586-022-04622-3	Исследование окраски Tupandactylus imperator.
27	A new ornithurine from the Early Cretaceous of China sheds light on the evolution of early ecological and cranial diversity in birds	2016	Jiandong Huang, Xia Wang​, Yuanchao Hu, Jia Liu, Jennifer A. Peteya, Julia A. Clarke​	Despite the increasing number of exceptional feathered fossils discovered in the Late Jurassic and Cretaceous of northeastern China, representatives of Ornithurae, a clade that includes comparatively-close relatives of crown clade Aves (extant birds) and that clade, are still comparatively rare. Here, we report a new ornithurine species Changzuiornis ahgmi from the Early Cretaceous Jiufotang Formation. The new species shows an extremely elongate rostrum so far unknown in basal ornithurines and changes our understanding of the evolution of aspects of extant avian ecology and cranial evolution. Most of this elongate rostrum in Changzuiornis ahgmi is made up of maxilla, a characteristic not present in the avian crown clade in which most of the rostrum and nearly the entire facial margin is made up by premaxilla. The only other avialans known to exhibit an elongate rostrum with the facial margin comprised primarily of maxilla are derived ornithurines previously placed phylogenetically as among the closest outgroups to the avian crown clade as well as one derived enantiornithine clade. We find that, consistent with a proposed developmental shift in cranial ontogeny late in avialan evolution, this elongate rostrum is achieved through elongation of the maxilla while the premaxilla remains only a small part of rostral length. Thus, only in Late Cretaceous ornithurine taxa does the premaxilla begin to play a larger role. The rostral and postcranial proportions of Changzuiornis suggest an ecology not previously reported in Ornithurae; the only other species with an elongate rostrum are two marine Late Cretacous taxa interpreted as showing a derived picivorous diet.	https://doi.org/10.7717/peerj.1765	Статья с первоописанием вида Changzuiornis ahgmi. В работе приводятся сведения об обнаружении отпечатков меланосом в перьях хвоста и крыльев, что легло в основу реконструкции их черного цвета.
28	Melanosome evolution indicates a key physiological shift within feathered dinosaurs	2014	Quanguo Li, Julia A. Clarke, Ke-Qin Gao, Chang-Fu Zhou, Qingjin Meng, Daliang Li, Liliana D’Alba & Matthew D. Shawkey	Inference of colour patterning in extinct dinosaurs has been based on the relationship between the morphology of melanin-containing organelles (melanosomes) and colour in extant bird feathers. When this relationship evolved relative to the origin of feathers and other novel integumentary structures, such as hair and filamentous body covering in extinct archosaurs, has not been evaluated. Here we sample melanosomes from the integument of 181 extant amniote taxa and 13 lizard, turtle, dinosaur and pterosaur fossils from the Upper-Jurassic and Lower-Cretaceous of China. We find that in the lineage leading to birds, the observed increase in the diversity of melanosome morphologies appears abruptly, near the origin of pinnate feathers in maniraptoran dinosaurs. Similarly, mammals show an increased diversity of melanosome form compared to all ectothermic amniotes. In these two clades, mammals and maniraptoran dinosaurs including birds, melanosome form and colour are linked and colour reconstruction may be possible. By contrast, melanosomes in lizard, turtle and crocodilian skin, as well as the archosaurian filamentous body coverings (dinosaur 'protofeathers' and pterosaur 'pycnofibres'), show a limited diversity of form that is uncorrelated with colour in extant taxa. These patterns may be explained by convergent changes in the key melanocortin system of mammals and birds, which is known to affect pleiotropically both melanin-based colouration and energetic processes such as metabolic rate in vertebrates, and may therefore support a significant physiological shift in maniraptoran dinosaurs.	https://doi.org/10.1038/nature12973	Статья о связи формы меланосом с окраской для большого числа ископаемых видов из разных групп.
29	Exceptional preservation of soft tissue in a new specimen of Eoconfuciusornis and its biological implications	2017	Xiaoting Zheng, Jingmai K. O’Connor, Xiaoli Wang, Yanhong Pan, Yan Wang, Min Wang, Zhonghe Zhou	We report on an exceptional specimen of Eoconfuciusornis preserving rare soft-tissue traces of the ovary and wing. Ovarian follicles preserve a greater hierarchy than observed in Jeholornis and enantiornithines, suggesting confuciusornithiforms evolved higher rates of yolk deposition in parallel with the neornithine lineage. The preserved soft tissues of the wing indicate the presence of a propatagium and postpatagium, whereas an alular patagium is absent. Preserved remnants of the internal support network of the propatagium bear remarkable similarity to that of living birds. Soft tissue suggests the confuciusornithiform propatagium could maintain a cambered profile and generate lift. The feathers of the wing preserve remnants of their original patterning; however, this is not strongly reflected by observable differences under scanning electron microscopy (SEM). The tail plumage lacks elongate rectrices, suggesting that the earliest known confuciusornithiforms were sexually dimorphic in their plumage.	https://doi.org/10.1093/nsr/nwx004	Исследование окраски Eoconfuciusornis.
30	The plumage and colouration of an enantiornithine bird from the early cretaceous of china	2016	Jennifer A. Peteya, Julia A. Clarke, Quanguo Li, Ke-Qin Gao, Matthew D. Shawkey	Brilliant colour displays and diverse feather morphologies that are often sexual ornaments are common throughout much of extant Avialae. Here we describe a new basal enantiornithine bird specimen recovered from the Early Cretaceous Jiufotang Formation of Liaoning Province in northeastern China. We present new information on the plumage of Bohaiornithidae as well as the first detailed colour reconstruction of an enantiornithine bird. The new specimen retains subadult skeletal characteristics, including periosteal pitting of the long bone epiphyses and unfused elements, while also preserving plumage evidence consistent with sexual maturity at the time of death. Exceptionally-preserved feathers cover the body, including elongate crown feathers, body contour feathers, asymmetrically-veined wing primaries, an alula and two elongate rachis-dominated rectrices that may have been sexual ornaments. The crown, neck, and body contour feathers retain elongate melanosome morphologies associated with weakly iridescent colouration in extant feathers. We provide additional evidence of preserved melanin using Raman spectroscopy; a rapid, non-destructive chemical technique. The new specimen provides data on skeletal ontogeny in the Bohaiornithidae as well as evidence for intraspecific communication functions of plumage.	https://doi.org/10.1111/pala.12270	Описание окраски экземпляра энанциорнисовой птицы из биоты Джехол.
31	A NEW RHAMPHORHYNCHOID WITH A HEADCREST AND COMPLEX INTEGUMENTARY STRUCTURES	2002	Stephen A. Czerkas & Qiang Ji	A new rhamphorhynchoid is described with a headcrest that is unprecedented among the long-tailed pterosaurs. The preservation of the headcrest presents significant implications regarding the physical appearance and aerodynamics of all pterosaurs. Also, "hair-like" integumentary structures of this pterosaur are shown to be complex multi-strand structures which presents evidence on the origin of feathers and the possibility of a remarkably early ancestral relationship between pterosaurs and birds.	https://dinosaur-museum.org/featheredinosaurs/chapters.htm	Первоописание голотипа птерозавра Pterorhynchus wellnhoferi. Опубликовано в книге "Feathered Dinosaurs and the Origin of Flight", изданной Музеем Динозавров в городе Бландинг, штат Юта, США.
34	The blue-green eggs of dinosaurs: How fossil metabolites provide insights into the evolution of bird reproduction	2015	Jasmina Wiemann​, Tzu-Ruei Yang, Philipp N. N Sander, Marion Schneider, Marianne Engeser, Stephanie Kath-Schorr, Christa E Müller, P. Martin Sander	Open-nesting birds use biological pigments in eggshell to camouflage their unhatched offspring, varying the colour to account for the nesting environment and location. The tetrapyrrolic pigments protoporphyrin (PP) and biliverdin (BV), which both participate in the haem metabolism, are responsible for the reddish brown of chicken eggs and the brilliant blue of robin and emu eggs. However, eggshell pigmentation correlates with the nest type in a wide range of avian species and suggests that coloured eggs are basal to the avian lineage, extending back to their non-avian dinosaur origins. Detecting preserved eggshell pigments could thus shed light on dinosaur nesting behaviour. Using HPLC separation coupled to ESI-Q-TOF mass spectrometry, we here provide the first record of the eggshell pigments PP and BV preserved in fossils from three different localities, in 66 million year-old oviraptorid eggshell (Macroolithus yaotunensis). These eggs were presumably laid in at least partially open nests by the oviraptorid Heyuannia huangi and camouflaged by an originally blue-greenish egg colouration. Such a blue-greenish eggshell pigmentation hints at increased paternal care in Heyuannia. Shell porosity measurements, preserved clutches and parental animals support an open nesting behaviour for oviraptorid dinosaurs. Furthermore, the detection of PP, together with supporting microscopic observations, represents the first evidence for cuticle preservation in fossil eggshell. Our study demonstrates that molecular biomarkers, such as preserved metabolites, can be used to trace the evolution of modern avian traits, and to provide insights into dinosaur reproductive biology and the preservation of endogenous organic matter in fossil vertebrates.	https://doi.org/10.7287/peerj.preprints.1080v1	Изучение маркеров окраски в ископаемой скорлупе Heyuannia huangi.
35	The fossil record, function, and possible origins of shell color patterns in Paleozoic marine invertebrates	1989	David R. Kobluk & Royal H. Mapes	Fossil invertebrate shells and carapaces displaying preserved original color patterns are among the rarest fossils. The fossil record of color patterns extends into the Middle Cambrian where the trilobite Anomocare displays a fan-like array of stripes on the pygidium. About 180 Paleozoic genera are known with patterns, including trilobites, cephalopods, gastropods, brachiopods, bivalves, crinoids, and crustaceans. Based upon an analysis of these taxa, it appears that patterns and pigments in middle and late Paleozoic invertebrates may have served several functions such as warning displays, light screening, camouflage, or waste disposal. However, the presence of color patterns in fossil invertebrates in the early Paleozoic may have developed prior to the evolution of vision sufficiently sophisticated to see them. This suggests that camouflage and warning displays were not the original functions of color patterns, and that in the earliest Paleozoic they may not have been functional. We propose a hypothesis that involves three developmental phases in the evolution of invertebrate color patterns: 1) the incorporation of metabolic by-products, perhaps some pigmented and some not pigmented, into shells and carapaces as a means of disposal of dietary or metabolic wastes, 2) use of these pigments and patterns as an environmental adaptation, such as light screening, and 3) the use of patterns for camouflage, mimicry, and warning display during and following the evolution of vision in predators sufficiently sophisticated to see the patterns.	https://doi.org/10.2307/3514734	Обзорная статья по окраске морских беспозвоночных палеозоя.
36	Colour Patterns in Devonian Trilobites	2014	Brigitte Schoenemann , Euan. N.K. Clarkson, Uwe Ryck	Many living marine animals exhibit striking colour patterns on their external skeletons or on exposed flesh. Such colour patterns surely existed in fossil animals, but usually have faded, partially or more often completely, or have been modified by diagenesis. Some reported patterns may indeed have resulted from diagenesis alone and thus are not original. Here we assess colour patterns in trilobites in Devonian specimens from North America and in new material from Germany. Specimens of Eldredgeops crassituberculata (Stumm, 1953) from the Middle Devonian Silica Shale, Sylvania, Ohio show spots on the pleurae, a brown band on the axial ribs and shadowy brown patches on the glabella. We advance reasons why these are most likely original. Distinctive patterns in the pygidia of Scutellum geesense Rud. & E. Richter 1956, Calycoscutellum sp., Scabriscutellum scabrum (Goldfuss, 1842) and Thysanopeltella acanthopeltis Barrande 1852 from the Devonian of Germany are illustrated here. Several specimens from different localities show a medium brown band fading to whitish towards the margin of the pygidium. These patterns are most unlikely to be random or, as argued here, diagenetic. They represent, in our opinion, original colour bands. We speculate that these colour patterns may have functioned as camouflage in a shallow-water visual world determined by ever-changing patterns of light.	https://doi.org/10.2174/1874262901408010113	Статья об окраске девонских трилобитов.
37	Supposed Color-Markings in Ordovician Trilobites From Ohio	1942	Wells, J. W.	Description of specimens of Isotellus maximus from the upper Cincinnati stage in southwestern Ohio. Consistent darkenings of the test in parts of the cephalon, thorax, and pygidium are interpreted as traces of a simple original color pattern.	https://doi.org/10.2475/ajs.240.10.710	Статья об окраске ордовикских трилобитов из Огайо.
38	Why did the UV-A-induced photoluminescent blue–green glow in trilobite eyes and exoskeletons not cause problems for trilobites?	2015	Brigitte Schoenemann, Euan N.K. Clarkson and Gábor Horváth	The calcitic lenses in the eyes of Palaeozoic trilobites are unique in the animal kingdom, although the use of calcite would have conveyed great advantages for vision in aquatic systems. Calcite lenses are transparent, and due to their high refractive index they would facilitate the focusing of light. In some respects, however, calcite lenses bear evident disadvantages. Birefringence would cause double images at different depths, but this is not a problem for trilobites since the difference in the paths of the ordinary and extraordinary rays is less than the diameter of the receptor cells. Another point, not discussed hitherto, is that calcite fluoresces when illuminated with UV-A. Here we show experimentally that calcite lenses fluoresce, and we discuss why fluorescence does not diminish the optical quality of these lenses and the image formed by them. In the environments in which the trilobites lived, UV-A would not have been a relevant factor, and thus fluorescence would not have disturbed or confused their visual system. We also argue that whatever the reason that calcite was never again used successfully in the visual systems of aquatic arthropods, it was not fluorescence.	https://doi.org/10.7717/peerj.1492	Статья о флуоресценции глаз трилобитов.
40	A guide to the field of palaeo colour: Melanin and other pigments can fossilise: Reconstructing colour patterns from ancient organisms can give new insights to ecology and behaviour	2015	Jakob Vinther	Melanin, and other pigments have recently been shown to preserve over geologic time scales, and are found in several different organisms. This opens up the possibility of inferring colours and colour patterns ranging from invertebrates to feathered dinosaurs and mammals. An emerging discipline is palaeo colour: colour plays an important role in display and camouflage as well as in integumental strengthening and protection, which makes possible the hitherto difficult task of doing inferences about past ecologies, behaviours, and organismal appearance. Several studies and techniques have been presented in the last couple of years that have described ways to characterize pigment patterns. Here, I will review the available methods and the likely applications to understand past ecologies. A golden age of colourized dinosaurs and other animals is now dawning upon us, which may elucidate the nature of ancient predator prey interactions and display structures. 	https://doi.org/10.1002/bies.201500018	Обзор методов реконструкции палеоокраски.
41	Isolation and characterization of the earliest taxon-specific organic molecules (Mississippian, Crinoidea)	2013	Christina E. O’Malley; William I. Ausich; Yu-Ping Chin	Biomarkers and other ancient preserved molecules are rapidly being discovered and used to study the evolution of life on Earth. We report the existence of echinoderm-specific organic molecules from different lower Mississippian (340 Ma) crinoid species that occur in the same sedimentary bed. These are the oldest examples of biomarker molecules extracted directly from fossilized remains. These biomarker molecules appear to resemble aromatic or polyaromatic quinones, based upon ultraviolet and visible light spectroscopy, fluorescence excitation-emission matrix spectroscopy, and electrospray ionization time-of-flight mass spectrometry. Results suggest that the preservation of diagnostic organic molecules is much more common that previously realized, and that preserved organic molecules may provide an independent method to unravel phylogenetic relationships among echinoderms and, perhaps, other fossilized organisms.	https://doi.org/10.1130/G33792.1	Химическое исследование каменноугольных морских лилий, доказывающее сохранение в них органических пигментов.
42	Mesozoic lacewings from China provide phylogenetic insight into evolution of the Kalligrammatidae (Neuroptera)	2014	Qiang Yang, Yongjie Wang, Conrad C. Labandeira, Chungkun Shih & Dong Ren	Background: The Kalligrammatidae are distinctive, large, conspicuous, lacewings found in Eurasia from the Middle\r\nJurassic to mid Early Cretaceous. Because of incomplete and often inadequate fossil preservation, an absence of\r\ndetailed morphology, unclear relationships, and unknown evolutionary trends, the Kalligrammatidae are poorly\r\nunderstood.\r\nResults: We describe three new subfamilies, four new genera, twelve new species and four unassigned species\r\nfrom the late Middle Jurassic Jiulongshan and mid Early Cretaceous Yixian Formations of China. These\r\nkalligrammatid taxa exhibit diverse morphological characters, such as mandibulate mouthparts in one major clade\r\nand siphonate mouthparts in the remaining four major clades, the presence or absence of a variety of distinctive\r\nwing markings such as stripes, wing spots and eyespots, as well as multiple major wing shapes. Based on\r\nphylogenetic analyses, the Kalligrammatidae are divided into five principal clades: Kalligrammatinae Handlirsch,\r\n1906, Kallihemerobiinae Ren & Engel, 2008, Meioneurinae subfam. nov., Oregrammatinae subfam. nov. and\r\nSophogrammatinae subfam. nov., each of which is accorded subfamily-level status. Our results show significant\r\nmorphological and evolutionary differentiation of the Kalligrammatidae family during a 40 million-year-interval of\r\nthe mid Mesozoic.\r\nConclusion: A new phylogeny and classification of five subfamilies and their constituent genera is proposed for the\r\nKalligrammatidae. These diverse, yet highly specialized taxa from northeastern China suggest that eastern Eurasia\r\nlikely was an important diversification center for the Kalligrammatidae. Kalligrammatids possess an extraordinary\r\nmorphological breadth and panoply of adaptations during the mid-Mesozoic that highlight our conclusion that\r\ntheir evolutionary biology is much more complex than heretofore realized.	https://doi.org/10.1186/1471-2148-14-126	Изучение окраски мезозойских сетчатокрылых насекомых семейства Kalligrammatidae.
45	Structural colours in diverse Mesozoic insects	2020	Chenyang Cai; Erik Tihelka; Yanhong Pan; Ziwei Yin; Rixin Jiang; Fangyuan Xia; Diying Huang	Structural colours, nature's most pure and intense colours, originate when light is scattered via nanoscale modulations of the refractive index. Original colours in fossils illuminate the ecological interactions among extinct organisms and functional evolution of colours. Here, we report multiple examples of vivid metallic colours in diverse insects from mid-Cretaceous amber. Scanning and transmission electron microscopy revealed a smooth outer surface and five alternating electron-dense and electron-lucent layers in the epicuticle of a fossil wasp, suggesting that multilayer reflectors, the most common biophotonic nanostructure in animals and even plants, are responsible for the exceptional preservation of colour in amber fossils. Based on theoretical modelling of the reflectance spectra, a reflective peak of wavelength of 514 nm was calculated, corresponding to the bluish-green colour observed under white light. The green to blue structural colours in fossil wasps, beetles and a fly most likely functioned as camouflage, although other functions such as thermoregulation cannot be ruled out. This discovery not only provides critical evidence of evolution of structural colours in arthropods, but also sheds light on the preservation potential of nanostructures of ancient animals through geological time.	https://doi.org/10.1098/rspb.2020.0301	Исследование насекомых со структурной окраской из мелового бирманского янтаря.
46	Mesozoic mammaliaforms illuminate the origins of pelage coloration	2025	Ruoshuang Li, Liliana D’Alba, Gerben Debruyn, Jessica L. Dobson, Chang-Fu Zhou, Julia A. Clarke, Jakob Vinther, Quanguo Li, Matthew D. Shawkey 	Pelage coloration, which serves numerous functions, is crucial to the evolution of behavior, physiology, and habitat preferences of mammals. However, little is known about the coloration of Mesozoic mammaliaforms that coevolved with dinosaurs. In this study, we used a dataset of melanosome (melanin-containing organelle) morphology and quantitatively measured hair colors from 116 extant mammals to reliably reconstruct the coloration of six Mesozoic mammaliaforms, including a previously undescribed euharamiyidan. Unlike the highly diverse melanosomes discovered in feathered dinosaurs, hairs in six mammaliaforms of different lineages and diverse ecomorphotypes showed uniform melanosome geometry, corresponding to dark-brown coloration consistent with crypsis and nocturnality. Our results suggest that the melanosome variation and color expansion seen in extant mammals may have occurred during their rapid radiation and diversification after the Cretaceous-Paleogene extinction.	https://doi.org/10.1126/science.ads9734	Исследование окраски мезозойских млекопитающих.
48	Three-dimensional soft tissue preservation revealed in the skin of a non-avian dinosaur	2019	Matteo Fabbri, Jasmina Wiemann, Fabio Manucci, Derek E. G. Briggs	The most commonly preserved soft tissues associated with ornithischian dinosaurs are skin remains. The apparent resistance of hadrosaur skin to decay, and its abundance in the fossil record relative to that of other tetrapods, has been attributed to factors such as thickness and composition. Here we report additional intrinsic factors within hadrosaur skin: 3D-preserved eumelanin-bearing bodies, dermal cells and blood vessel fragments in an organic matrix composed of protein fossilization products. The skin is much thinner than that of living mammals of similar size. It is likely that the preservation of hadrosaur skin is related to the arrangement of the layers composing it.	https://doi.org/10.5061/dryad.3bk3j9kf1	Исследование кожи гадрозавра YPMPU 016969.
49	A new Jurassic theropod from China documents a transitional step in the macrostructure of feathers	2017	Ulysse Lefèvre, Andrea Cau, Aude Cincotta, Dongyu Hu, Anusuya Chinsamy, François Escuillié & Pascal Godefroit 	Genuine fossils with exquisitely preserved plumage from the Late Jurassic and Early Cretaceous of northeastern China have recently revealed that bird-like theropod dinosaurs had long pennaceous feathers along their hindlimbs and may have used their four wings to glide or fly. Thus, it has been postulated that early bird flight might initially have involved four wings (Xu et al. Nature 421:335–340, 2003; Hu et al. Nature 461:640–643, 2009; Han et al. Nat Commun 5:4382, 2014). Here, we describe Serikornis sungei gen. et sp. nov., a new feathered theropod from the Tiaojishan Fm (Late Jurassic) of Liaoning Province, China. Its skeletal morphology suggests a ground-dwelling ecology with no flying adaptations. Our phylogenetic analysis places Serikornis, together with other Late Jurassic paravians from China, as a basal paravians, outside the Eumaniraptora clade. The tail of Serikornis is covered proximally by filaments and distally by slender rectrices. Thin symmetrical remiges lacking barbules are attached along its forelimbs and elongate hindlimb feathers extend up to its toes, suggesting that hindlimb remiges evolved in ground-dwelling maniraptorans before being co-opted to an arboreal lifestyle or flight.	http://dx.doi.org/10.1007/s00114-017-1496-y	Статья с описанием Serikornis sungei.
51	INTEGUMENT OF THE IGUANODONT DINOSAUR TRACHODON	1912	HENRY FAIRFIELD OSBORN	Отсутствует (см. источник).	https://digitallibrary.amnh.org/items/10190e09-d3c8-4eeb-81e2-1ba8291425b4	Статья Генри Осборна с описанием чешуи Edmontosaurus annectens (используется устаревшее название Trachodon annectens).
50	Serikornis, per gli amici: Silky! (на итальянском)	2017	Andrea Cau	Отсутствует (см. источник).	https://theropoda.blogspot.com/2017/08/serikornis-per-gli-amici-silky.html	Статья из блога Андреа Кау с описанием Serikornis sungei и упоминанием полос на его перьях.
52	Mummified dinosaur unveiled	2007	National Geographic	Отсутствует (см. источник).	https://www.sott.net/article/144750-Mummified-Dinosaur-Unveiled	Публикация на основе обсуждения образца «Дакота» с Филлипом Мэннингом.
53	Biostratinomic alterations of an Edmontosaurus “mummy” reveal a pathway for soft tissue preservation without invoking “exceptional conditions”	2022	 Stephanie K. Drumheller, Clint A. Boyd , Becky M. S. Barnes, Mindy L. Householder	Removal or protection from biostratinomic agents of decomposition, such as predators and scavengers, is widely seen as a requirement for high-quality preservation of soft tissues in the fossil record. In this context, extremely rapid burial is an oft-cited mechanism for shielding remains from degradation, but not all fossils fit nicely into this paradigm. Dinosaurian mummies in particular seemingly require two mutually exclusive taphonomic processes to preserve under that framework: desiccation and rapid burial. Here we present a recently prepared Edmontosaurus mummy that reveals an alternate fossilization pathway for resistant soft tissues (e.g., skin and nails). While the skin on this specimen is well-preserved in three dimensions and contains biomarkers, it is deflated and marked by the first documented examples of injuries consistent with carnivore activity on dinosaurian soft tissue during the perimortem interval. Incomplete scavenging of the carcass provided a route for the gases, fluids, and microbes associated with decomposition to escape, allowing more durable soft tissues to persist through the weeks to months required for desiccation prior to entombment and fossilization. This pathway is consistent with actualistic observations and explains why dinosaurian skin, while rare, is more commonly preserved than expected if extreme circumstances were required for its preservation. More broadly, our assumptions guide specimen collection and research, and the presence of soft tissues and biomolecules in fossils that demonstrably were not rapidly buried, such as this mummy, suggests that such types of evidence may be substantially more common than previously assumed.	https://doi.org/10.1371/journal.pone.0275240	Статья о мумификации эдмонтозавра NDGS 2000, содержащая его актуальную художественную реконструкцию (но без учета полос, о которых говорил Мэннинг).
56	New information on the plumage of Protopteryx (Aves: Enantiornithes) from a new specimen	2020	O'Connor, Jingmai K.; Zheng, Xiaoting; Pan, Yanhong; Wang, Xiaoli; Wang, Yan; Zhang, Xiaomei; Zhou, Zhonghe	Protopteryx fengningensis is from the 130-129 Ma (uppermost Hauterivian-lowermost Barremian, Lower Cretaceous) making it one of the oldest known enantiornithines. Contributing to its significance, this taxon is also commonly resolved as the basal-most enantiornithine in phylogenetic analyses. Protopteryx preserves several unusual morphologies that are otherwise absent in the Enantiornithes but common in the Ornithuromorpha such as the procoracoid and lateral processes on the coracoid and proximally convex humeral head. Thus, the morphology of this taxon hints at the morphology of the ornithothoracine common ancestor. Here we supplement existing data with information from a new specimen as well as new morphological data from the holotype and paratype. The new specimen preserves gaps in the right wing suggestive of a sequential molt. The presence of two gaps suggests that, unlike neornithines, primaries and secondaries molted simultaneously. This represents an intermediate condition between Microraptor, in which several feathers are growing simultaneously and sequentially, and modern birds with sequential molts, in which a single feather is replaced at a time. A single patch of feathers was sampled revealing preserved eumelanosomes, indicating that at least part of the remiges was darkly colored.	https://doi.org/10.1016/j.cretres.2020.104577	Статья O'Connor et al. (2020) о новом образце Protopteryx fengningensis.
55	A bizarre Early Cretaceous enantiornithine bird with unique crural feathers and an ornithuromorph plough-shaped pygostyle	2017	Min Wang, Jingmai K. O’Connor, Yanhong Pan & Zhonghe Zhou 	Enantiornithes are the most successful clade of Mesozoic birds. Here, we describe a new enantiornithine bird, Cruralispennia multidonta gen. et sp. nov., from the Protopteryx-horizon of the Early Cretaceous Huajiying Formation of China. Despite being among the oldest known enantiornithines, Cruralispennia displays derived morphologies that are unexpected at such an early stage in the evolution of this clade. A plough-shaped pygostyle, like that of the Ornithuromorpha, evolved convergently in the Cruralispennia lineage, highlighting the homoplastic nature of early avian evolution. The extremely slender coracoid morphology was previously unknown among Early Cretaceous enantiornithines but is common in Late Cretaceous taxa, indicating that by 131 million years ago this clade had already experienced considerable morphological differentiation. Cruralispennia preserves unusual crural feathers that are proximally wire-like with filamentous distal tips, a new morphotype previously unknown among fossil or modern feathers, further increasing the known diversity of primitive feather morphologies.	https://doi.org/10.1038/ncomms14141	Статья с описанием Cruralispennia multidonta и исследованием ее окраски.
57	The earliest evidence for a supraorbital salt gland in dinosaurs in new Early Cretaceous ornithurines	2018	Xia Wang, Jiandong Huang, Yuanchao Hu, Xiaoyu Liu, Jennifer Peteya & Julia A. Clarke	Supraorbital fossae occur when salt glands are well developed, a condition most pronounced in marine and desert-dwelling taxa in which salt regulation is key. Here, we report the first specimens from lacustrine environments of the Jehol Biota that preserve a distinct fossa above the orbit, where the salt gland fossa is positioned in living birds. The Early Cretaceous ornithurine bird specimens reported here are about 40 million years older than previously reported Late Cretaceous marine birds and represent the earliest described occurrence of the fossa. We find no evidence of avian salt gland fossae in phylogenetically earlier stem birds or non-avialan dinosaurs, even in those argued to be predominantly marine or desert dwelling. The apparent absence of this feature in more basal dinosaurs may indicate that it is only after miniaturization close to the origin of flight that excretory mechanisms were favored over exclusively renal mechanisms of salt regulation resulting in an increase in gland size leaving a bony trace. The ecology of ornithurine birds is more diverse than in other stem birds and may have included seasonal shifts in foraging range, or, the environments of some of the Jehol lakes may have included more pronounced periods of high salinity.	https://doi.org/10.1038/s41598-018-22412-8	Исследование Iteravis huchzermeyeri.
62	A mid-Cretaceous enantiornithine (Aves) hatchling preserved in Burmese amber with unusual plumage	2017	Lida Xing, Jingmai K. O'Connor, Ryan C. McKellar, Luis M. Chiappe, Kuowei Tseng, Gang Li, Ming Bai	Burmese amber has recently provided some detailed glimpses of plumage, soft tissues, and osteology of juvenile enantiornithine birds, but these insights have been restricted to isolated wing apices. Here we describe nearly half of a hatchling individual, based on osteological and soft tissue data obtained from the skull, neck, feet, and wing, and identified as a member of the extinct avian clade Enantiornithes. Preserved soft tissue provides the unique opportunity to observe the external opening of the ear, the eyelid, and fine details of tarsal scutellation. The new amber specimen yields the most complete view of hatchling plumage and integument yet to be recovered from the Cretaceous, including details of pterylosis, feather microstructure, and pigmentation patterns. The hatchling was encapsulated during the earliest stages of its feather production, providing a point for comparisons to other forms of body fossils, as well as isolated feathers found in Cretaceous ambers. The plumage preserves an unusual combination of precocial and altricial features unlike any living hatchling bird, having functional remiges combined with sparse body feathers. Unusual feather morphotypes on the legs, feet, and tail suggest that first generation feathers in the Enantiornithes may have been much more like contour feathers than the natal down observed in many modern birds. However, these regions also preserve filamentous feathers that appear comparable to the protofeathers observed in more primitive theropods. Overall, the new specimen brings a new level of detail to our understanding of the anatomy of the juvenile stages of the most species-rich clade of pre-modern birds and contributes to mounting data that enantiornithine development drastically differed from that of Neornithes.	https://doi.org/10.1016/j.gr.2017.06.001	Исследование птенца, целиком сохранившегося в бирманском янтаре.
59	Dinosaur egg colour had a single evolutionary origin	2018	Jasmina Wiemann, Tzu-Ruei Yang & Mark A. Norell 	Birds are the only living amniotes with coloured eggs, which have long been considered to be an avian innovation. A recent study has demonstrated the presence of both red-brown protoporphyrin IX and blue-green biliverdin—the pigments responsible for all the variation in avian egg colour—in fossilized eggshell of a nonavian dinosaur. This raises the fundamental question of whether modern birds inherited egg colour from their nonavian dinosaur ancestors, or whether egg colour evolved independently multiple times. Here we present a phylogenetic assessment of egg colour in nonavian dinosaurs. We applied high-resolution Raman microspectroscopy to eggshells that represent all of the major clades of dinosaurs, and found that egg colour pigments were preserved in all eumaniraptorans: egg colour had a single evolutionary origin in nonavian theropod dinosaurs. The absence of colour in ornithischian and sauropod eggs represents a true signal rather than a taphonomic artefact. Pigment surface maps revealed that nonavian eumaniraptoran eggs were spotted and speckled, and colour pattern diversity in these eggs approaches that in extant birds, which indicates that reproductive behaviours in nonavian dinosaurs were far more complex than previously known. Depth profiles demonstrated identical mechanisms of pigment deposition in nonavian and avian dinosaur eggs. Birds were not the first amniotes to produce coloured eggs: as with many other characteristics this is an attribute that evolved deep within the dinosaur tree and long before the spectacular radiation of modern birds.	https://doi.org/10.1038/s41586-018-0646-5	Исследование окраски яиц разных видов.
60	Ammonoid Color Patterns	2015	Royal H. Mapes & Neal L. Larson 	Color patterns on ammonoid cephalopods are rarely preserved despite the fact that millions of the shells of these extinct animals have been recovered from Devonian through the Upper Cretaceous rocks that were deposited in a wide variety of marine environments around the world. New information on this biological feature continues to be slowly discovered; however, rarity continues to limit the study of this phenomenon. New discoveries of the past twenty years include several cases of false color patterns and the documentation of iridescent color patterns that appear to have become extinct at the end of the Cretaceous with the demise of the ammonites. Additionally, there appears to be a direct relationship to different color patterns (longitudinal bands, transverse bands, monochromatic shells and no preserved color pattern) in the Lower Triassic to habitat and life mode. It is unknown if this relationship holds true for post Triassic occurrences.	https://doi.org/10.1007/978-94-017-9630-9_2	Обзор окраски раковин аммонитов.
61	Mummified precocial bird wings in mid-Cretaceous Burmese amber	2016	Lida Xing, Ryan C. McKellar, Min Wang, Ming Bai, Jingmai K. O’Connor, Michael J. Benton, Jianping Zhang, Yan Wang, Kuowei Tseng, Martin G. Lockley, Gang Li, Weiwei Zhang & Xing Xu 	Our knowledge of Cretaceous plumage is limited by the fossil record itself: compression fossils surrounding skeletons lack the finest morphological details and seldom preserve visible traces of colour, while discoveries in amber have been disassociated from their source animals. Here we report the osteology, plumage and pterylosis of two exceptionally preserved theropod wings from Burmese amber, with vestiges of soft tissues. The extremely small size and osteological development of the wings, combined with their digit proportions, strongly suggests that the remains represent precocial hatchlings of enantiornithine birds. These specimens demonstrate that the plumage types associated with modern birds were present within single individuals of Enantiornithes by the Cenomanian (99 million years ago), providing insights into plumage arrangement and microstructure alongside immature skeletal remains. This finding brings new detail to our understanding of infrequently preserved juveniles, including the first concrete examples of follicles, feather tracts and apteria in Cretaceous avialans.	https://doi.org/10.1038/ncomms12089	Исследование крыльев мезозойских птиц в янтаре.
63	Color patterns in Jurassic ammonites from Central Russia	2015	Aleksandr Mironenko	Remnants of a color pattern on the shells of Middle Jurassic (Callovian) and Upper Jurassic (Volgian) ammonites from Central Russia are described. In Callovian Funiferites and Quenstedtoceras, the color pattern is represented by dark stripes on a light background. This pattern is very similar to the coloration of Triassic ammonoids from Nevada. In Quenstedtoceras, the stripes coincide with “temporary apertures” - areas of growth interruption. The color pattern of Callovian Brightia and Sublunulocerasis represented by frequent, thin longitudinal stripes. Their frequency and location coincides with the ridges on the wrinkle layer of these ammonites. The color pattern of Upper Volgian Craspedites and Kachpurites is represented by frequent and relatively wide dark stripes on a light shell surface. In all cases, the color pattern is unstable and may fade on exposure to sunlight.	https://www.researchgate.net/publication/274513123_Color_patterns_in_Jurassic_ammonites_from_Central_Russia	Описание остатков цветового рисунка на раковинах среднеюрских и верхнеюрских аммонитов из Центральной России.
13	Iridescence in pterosaur pycnofibers and the evolution of integumentary coloration	2026	Zelin Wu, Liliana D’Alba, Chang-Fu Zhou, Julia A. Clarke, Jinhua Li, Matthew D. Shawkey, Quanguo Li	The bodies of pterosaurs, the first flying vertebrates, are covered with integumentary filaments (pycnofibres) thought to be homologous to feathers in dinosaurs, but their coloration remains unknown. Here, we report a layered internal arrangement of melanosomes containing a photonic nanostructure within the monofilaments in a previously undescribed specimen of tapejarid pterosaur Sinopterus dongi from the Early Cretaceous Jehol Biota. Optical simulations showed that this structure reflects green to magenta iridescent coloration, confirming the presence of melanosome-based iridescent coloration previously thought to be unique to birds. This finding deepens our understanding of structure/color gamut relationships in amniotes, while supporting further shared characteristics associated with derived genetic and regulatory shifts in archosaurs.	https://doi.org/10.64898/2026.05.06.723168 	Исследование окраски Sinopterus dongi (препринт).
9	Trace Metals as Biomarkers for Eumelanin Pigment in the Fossil Record	2011	R. A. Wogelius, P. L. Manning, H. E. Barden, N. P. Edwards, S. M. Webb, W. I. Sellers, K. G. Taylor, P. L. Larson, P. Dodson, H. You, L. Da-qing, U. Bergmann	Well-preserved fossils of pivotal early bird and nonavian theropod species have provided unequivocal evidence for feathers and/or downlike integuments. Recent studies have reconstructed color on the basis of melanosome structure; however, the chemistry of these proposed melanosomes has remained unknown. We applied synchrotron x-ray techniques to several fossil and extant organisms, including Confuciusornis sanctus, in order to map and characterize possible chemical residues of melanin pigments. Results show that trace metals, such as copper, are present in fossils as organometallic compounds most likely derived from original eumelanin. The distribution of these compounds provides a long-lived biomarker of melanin presence and density within a range of fossilized organisms. Metal zoning patterns may be preserved long after melanosome structures have been destroyed.	https://doi.org/10.1126/science.1205748	Картирование пигментации у Confuciusornis sanctus на основе распределения меди.
15	An Early Cretaceous enantiornithine bird with a pintail	2021	Min Wang, Jingmai K. O'Connor, Tao Zhao, Yanhong Pan, Xiaoting Zheng, Xiaoli Wang, Zhonghe Zhou	Enantiornithes are the most successful group of Mesozoic birds, arguably representing the first global avian radiation, and commonly resolved as the sister to the Ornithuromorpha, the clade within which all living birds are nested. The wealth of fossils makes it feasible to comparatively test evolutionary hypotheses about the pattern and mode of eco-morphological diversity of these sister clades that co-existed for approximately 65 Ma. Here, we report a new Early Cretaceous enantiornithine, Yuanchuavis kompsosoura gen. et. sp. nov., with a rectricial fan combined with an elongate central pair of fully pennaceous rachis-dominated plumes, constituting a new tail plumage previously unknown among nonavialan dinosaurs and Mesozoic birds but which strongly resembles the pintail in many neornithines. The extravagant but aerodynamically costly long central plumes, as an honest signal of quality, likely evolved in enantiornithines through the handicap process of sexual selection. The contrasting tail morphotypes observed between enantiornithines and early ornithuromorphs reflect the complex interplay between sexual and natural selections and indicate that each lineage experienced unique pressures reflecting ecological differences. As in neornithines, early avialans repeatedly evolved extravagant structures highlighting the importance of sexual selection in shaping the plumage of feathered dinosaurs, even early in their evolutionary history.	https://doi.org/10.1016/j.cub.2021.08.044	Статья о Yuanchuavis kompsosoura.
25	Synchrotron-based chemical imaging reveals plumage patterns in a 150 million year old early bird	2013	Phillip L. Manning; Nicholas P. Edwards; Roy A. Wogelius; Uwe Bergmann; Holly E. Barden; Peter L. Larson; Daniela Schwarz-Wings; Victoria M. Egerton; Dimosthenis Sokaras; Roberto A. Mori; William I. Sellers	Charles Darwin acknowledged the importance of colour in the natural selection of bird plumage. Colour can indicate age, sex, and diet, as well as play roles in camouflage, mating and establishing territories. Feather and integument colour depend on both chemical and structural characteristics and so melanosome structure and trace metal biomarkers can be used to infer colour and pigment patterns in a range of extant and fossil organisms. In this study, three key specimens of Archaeopteryx were subjected to non-destructive chemical analysis in order to investigate the potential preservation of original pigmentation in early fossil feathers. Synchrotron Rapid Scanning X-ray Fluorescence (SRS-XRF) maps are combined with sulphur X-ray Absorption Near Edge Structure (XANES) spectroscopy to provide the first map of organic sulphur distribution within whole fossils, and demonstrate that organically derived endogenous compounds are present. The distribution of trace-metals and organic sulphur in Archaeopteryx strongly suggests that remnants of endogenous eumelanin pigment have been preserved in the feathers of this iconic fossil. These distributions are used here to predict the complete feather pigment pattern and show that the distal tips and outer vanes of feathers were more heavily pigmented than inner vanes, contrary to recent studies. This pigment adaptation might have impacted upon the structural and mechanical properties of early feathers, steering plumage evolution in Archaeopteryx and other feathered theropod dinosaurs.	https://doi.org/10.1039/c3ja50077b	Исследование окраски крыла археоптерикса.
54	A Feathered Dinosaur Tail with Primitive Plumage Trapped in Mid-Cretaceous Amber 	2016	Lida Xing, Ryan C. McKellar, Xing Xu, Gang Li, Ming Bai, W. Scott Persons 4th, Tetsuto Miyashita, Michael J. Benton, Jianping Zhang, Alexander P. Wolfe, Qiru Yi, Kuowei Tseng, Hao Ran, Philip J. Currie	In the two decades since the discovery of feathered dinosaurs, the range of plumage known from non-avialan theropods has expanded significantly, confirming several features predicted by developmentally informed models of feather evolution. However, three-dimensional feather morphology and evolutionary patterns remain difficult to interpret, due to compression in sedimentary rocks. Recent discoveries in Cretaceous amber from Canada, France, Japan, Lebanon, Myanmar, and the United States reveal much finer levels of structural detail, but taxonomic placement is uncertain because plumage is rarely associated with identifiable skeletal material. Here we describe the feathered tail of a non-avialan theropod preserved in mid-Cretaceous (∼99 Ma) amber from Kachin State, Myanmar, with plumage structure that directly informs the evolutionary developmental pathway of feathers. This specimen provides an opportunity to document pristine feathers in direct association with a putative juvenile coelurosaur, preserving fine morphological details, including the spatial arrangement of follicles and feathers on the body, and micrometer-scale features of the plumage. Many feathers exhibit a short, slender rachis with alternating barbs and a uniform series of contiguous barbules, supporting the developmental hypothesis that barbs already possessed barbules when they fused to form the rachis. Beneath the feathers, carbonized soft tissues offer a glimpse of preservational potential and history for the inclusion; abundant Fe2+ suggests that vestiges of primary hemoglobin and ferritin remain trapped within the tail. The new finding highlights the unique preservation potential of amber for understanding the morphology and evolution of coelurosaurian integumentary structures. 	https://doi.org/10.1016/j.cub.2016.10.008	Статья с описанием образца DIP-V-15103 из бирманского янтаря.
32	Recent advances in amniote palaeocolour reconstruction and a framework for future research	2020	Arindam Roy, Michael Pittman, Evan T. Saitta, Thomas G. Kaye, Xing Xu	Preserved melanin pigments have been discovered in fossilised integumentary appendages of several amniote lineages (fishes, frogs, snakes, marine reptiles, non‐avialan dinosaurs, birds, and mammals) excavated from lagerstätten across the globe. Melanisation is a leading factor in organic integument preservation in these fossils. Melanin in extant vertebrates is typically stored in rod‐ to sphere‐shaped, lysosome‐derived, membrane‐bound vesicles called melanosomes. Black, dark brown, and grey colours are produced by eumelanin, and reddish‐brown colours are produced by phaeomelanin. Specific morphotypes and nanostructural arrangements of melanosomes and their relation to the keratin matrix in integumentary appendages create the so‐called 'structural colours'. Reconstruction of colour patterns in ancient animals has opened an exciting new avenue for studying their life, behaviour and ecology. Modern relationships between the shape, arrangement, and size of avian melanosomes, melanin chemistry, and feather colour have been applied to reconstruct the hues and colour patterns of isolated feathers and plumages of the dinosaurs Anchiornis, Sinosauropteryx, and Microraptor in seminal papers that initiated the field of palaeocolour reconstruction. Since then, further research has identified countershading camouflage patterns, and informed subsequent predictions on the ecology and behaviour of these extinct animals. However, palaeocolour reconstruction remains a nascent field, and current approaches have considerable potential for further refinement, standardisation, and expansion. This includes detailed study of non‐melanic pigments that might be preserved in fossilised integuments. A common issue among existing palaeocolour studies is the lack of contextualisation of different lines of evidence and the wide variety of techniques currently employed. To that end, this review focused on fossil amniotes: (i) produces an overarching framework that appropriately reconstructs palaeocolour by accounting for the chemical signatures of various pigments, morphology and local arrangement of pigment‐bearing vesicles, pigment concentration, macroscopic colour patterns, and taphonomy; (ii) provides background context for the evolution of colour‐producing mechanisms; and (iii) encourages future efforts in palaeocolour reconstructions particularly of less‐studied groups such as non‐dinosaur archosaurs and non‐archosaur amniotes.	https://doi.org/10.1111/brv.12552	Обзорная статья по палеоколористике амниот.
33	Convergent Evolution in Aquatic Tetrapods: Insights from an Exceptional Fossil Mosasaur	2010	Johan Lindgren, Michael W. Caldwell, Takuya Konishi, Luis M. Chiappe	Mosasaurs (family Mosasauridae) are a diverse group of secondarily aquatic lizards that radiated into marine environments during the Late Cretaceous (98–65 million years ago). For the most part, they have been considered to be simple anguilliform swimmers – i.e., their propulsive force was generated by means of lateral undulations incorporating the greater part of the body – with unremarkable, dorsoventrally narrow tails and long, lizard-like bodies. Convergence with the specialized fusiform body shape and inferred carangiform locomotory style (in which only a portion of the posterior body participates in the thrust-producing flexure) of ichthyosaurs and metriorhynchid crocodyliform reptiles, along with cetaceans, has so far only been recognized in Plotosaurus, the most highly derived member of the Mosasauridae. Here we report on an exceptionally complete specimen (LACM 128319) of the moderately derived genus Platecarpus that preserves soft tissues and anatomical details (e.g., large portions of integument, a partial body outline, putative skin color markings, a downturned tail, branching bronchial tubes, and probable visceral traces) to an extent that has never been seen previously in any mosasaur. Our study demonstrates that a streamlined body plan and crescent-shaped caudal fin were already well established in Platecarpus, a taxon that preceded Plotosaurus by 20 million years. These new data expand our understanding of convergent evolution among marine reptiles, and provide insights into their evolution's tempo and mode.	https://doi.org/10.1371/journal.pone.0011998	Статья с описанием образца мозазавра Platecarpus (LACM 128319).
39	Colour patterns in Palaeozoic orthoceratoid cephalopods - diversification of striping	2025	Manda Š., Turek V.	The evolution of shell colouration in Palaeozoic cephalopods is still poorly understood. To date, thirty-six species of orthoceratoids have been described that display colour patterns on their shell. Thirteen species are newly added herein or re-described from the Ludlow of Bohemia and two from the Mississippian of Belgium. The colour pattern is best documented in pseudorthoceratids. Some gaps in the fossil record still exist and seemingly separate periods dominated by specific types of shell colour patterns. Ordovician pseudorthoceratids have uniform, regular and evenly spaced longitudinal stripes. A similar but less regular type of colouration also occurs in Silurian pseudorthoceratids - rhythmised, irregular, interrupted and anastomosing colour stripes. After a gap in the Early Devonian, younger pseudorthoceratids possess a chevron pattern. A difference in the colour pattern in hatchlings and later growth stages is documented in the Carboniferous Pseudocyrtoceras. The restriction of colouration to the dorsal side of the shell in Devonian and Carboniferous pseudorthoceratids, which was previously interpreted as reflecting horizontal biological orientation of the shell and countershading, is questioned. The adaptive control and protective function of the shell colour patterns are indicated by the diversification of colour patterns in the Silurian, the emergence of the chevron pattern in the Devonian and early Carboniferous, the relationship between colour patterns and shell shape, the colour pattern polymorphism, and the ontogenetic changes in colouration. The pseudorthoceratid Pellucidoceras gen. nov. is established herein. Its type species, the Silurian P. decipiens, shows an intraspecific variability in the number, width, and spacing of stripes, and possibly represents case of colour pattern polymorphism.	https://doi.org/10.3140/bull.geosci.1956	Обзор паттернов окраски прямораковинных головоногих палеозоя.
47	Standardized Terminology and Potential Taxonomic Utility for Hadrosaurid Skin Impressions: A Case Study for Saurolophus from Canada and Mongolia	2012	Phil R. Bell	The characterization of palaeospecies typically relies on hard-tissue anatomy, such as bones or teeth that is more readily fossilized than soft parts. Among dinosaurs, skin impressions are commonly associated with partial and complete hadrosaurid skeletons, and consist of non-imbricating tubercles or scales. Skin impressions from various parts of the body of two species of the hadrosaurine Saurolophus (S. angustirostris from Mongolia and S. osborni from Canada) are described from multiple specimens. These species, recently validated on osteological grounds, can be differentiated based solely on soft-tissue anatomy, namely scale shape and pattern. This study demonstrates for the first time the applicability of soft-tissue (i.e., scale impressions) as a means to differentiate species within the Dinosauria. Differences are most spectacular in the tail, where S. angustirostris is differentiated by the presence of vertical bands of morphologically distinct scales, a grid-like arrangement of circular feature-scales, and tabular scales along the dorsal midline. Preliminary results indicate scale architecture remained consistent throughout ontogeny in S. angustirostris. These results support previous assertions that hadrosaurid scale architecture has a positive phylogenetic signal. As such, future taxonomic descriptions should include, where possible, the standardized description of skin impressions including the position and orientation of these impressions on the body.	https://doi.org/10.1371/journal.pone.0031295	Исследование кожи зауролофов из Монголии и Канады.
64	Lichen mimesis in mid-Mesozoic lacewings	2020	Hui Fang, Conrad C. Labandeira, Yiming Ma, Bingyu Zheng, Dong Ren, Xinli Wei, Jiaxi Liu, Yongjie Wang	Animals mimicking other organisms or using camouflage to deceive predators are vital survival strategies. Modern and fossil insects can simulate diverse objects. Lichens are an ancient symbiosis between a fungus and an alga or a cyanobacterium that sometimes have a plant-like appearance and occasionally are mimicked by modern animals. Nevertheless, lichen models are almost absent in fossil record of mimicry. Here, we provide the earliest fossil evidence of a mimetic relationship between the moth lacewing mimic Lichenipolystoechotes gen. nov. and its co-occurring fossil lichen model Daohugouthallus ciliiferus. We corroborate the lichen affinity of D. ciliiferus and document this mimetic relationship by providing structural similarities and detailed measurements of the mimic’s wing and correspondingly the model’s thallus. Our discovery of lichen mimesis predates modern lichen-insect associations by 165 million years, indicating that during the mid-Mesozoic, the lichen-insect mimesis system was well established and provided lacewings with highly honed survival strategies.	https://doi.org/10.7554/eLife.59007	Описание нового рода Lichenipolystoechotes юрских сетчатокрылых из Китая, узор на крыльях которых имитирует внешний вид современного им лишайника Daohugouthallus ciliiferus.
\.


--
-- Data for Name: taxon; Type: TABLE DATA; Schema: public; Owner: paleo_admin
--

COPY public.taxon (id, name, geologic_time, location, fossil_site, coloration_data, method_used) FROM stdin;
29	Bohaiornithid (CUGB P1202)	Ранний мел (~120 млн лет назад)	Провинция Ляонин, Китай	Формация Цзюфотан, биота Джехол	Анализ меланосом образца CUGB P1202 показал, что контурные перья на голове, затылке и теле имели переливающийся окрас. Меланосомы также были обнаружены в маховых перьях крыла, однако их морфологическая структура оказалась слишком разрушенной процессом фоссилизации, чтобы с уверенностью реконструировать цвет крыльев.	Сканирующая электронная микроскопия (СЭМ) и рамановская спектроскопия.
27	Caudipteryx zoui	Ранний мел (~125 млн лет назад)	Провинция Ляонин, Китай	Формация Исянь	Анализ сохранившихся перьев на различных участках тела указывает на преобладание темного (черного или темно-серого) окраса. При этом перья в области хвоста демонстрируют выраженное чередование темных и светлых поперечных полос, что свидетельствует о контрастном полосатом окрасе хвоста, который животное могло использовать для демонстрационного поведения.	Сканирующая электронная микроскопия (СЭМ).
4	Microraptor sp.	Ранний мел (~120 млн лет назад)	Провинция Ляонин, Китай	Формация Цзюфотан, биота Джехол	Для поиска меланосом в образце BMNHC PH881 исследовано 26 проб с перьев по всему телу. Установлено, что микрораптор имел темное оперение с металлическим блеском (как у современных грачей или ворон). Авторы указывают, что конкретный цвет отлива (синий, зеленый, фиолетовый) восстановить невозможно, потому что он зависит от толщины слоя кератина над меланосомами, который не сохраняется. Они реконструируют его как черный с глянцевым/слабо иридисцентным блеском.	Сканирующая электронная микроскопия (СЭМ).
6	Huadanosaurus sinensis	 Ранний мел (~124 млн лет назад)	Провинция Ляонин, Китай	Формация Исянь, биота Джехол	Тело животного было покрыто нитевидным оперением. На хвосте чередовались светлые (вероятно, белые) и темные полосы. Темные участки имели каштановый или красновато-коричневый цвет. Окраска остального тела достоверно неизвестна, но, вероятно, была выдержана в тех же рыжих тонах.	Сканирующая электронная микроскопия (СЭМ) образца IVPP V14202.
2	Caihong juji	Поздняя юра (~161 млн лет назад)	Провинция Хэбэй, Китай	Формация Тяоцзишань (Биота Яньляо)	В работе Hu et al. (2018) проведен анализ меланосом с 66 участков экземпляра PMoL-B00175. Согласно исследованию, основная часть тела была покрыта темными, скорее всего, черными перьями. Однако на голове, шее, груди и у основания хвоста располагались перья с радужным металлическим отливом (иридисценцией), подобным блестящему оперению современных колибри или ворон. Исследование не затрагивает лишь те участки тела, которые не были оперены. Точный цвет перелива перьев неизвестен, так как он определяется не только формой меланосом, но и расстоянием между ними, а также наличием немеланиновых пигментов. 	Сканирующая электронная микроскопия (СЭМ) и сопоставление с базой данных меланосом современных птиц.
7	Sinornithosaurus millenii	Ранний мел (~125 млн лет назад)	Провинция Ляонин, Китай	Формация Исянь, биота Джехол	В образце IVPP V12811 были обнаружены скопления как эумеланосом (отвечающих за черный/серый цвет), так и феомеланосом (отвечающих за рыжие оттенки). Изучена задняя часть головы, часть шеи и передняя конечность.	Сканирующая электронная микроскопия (СЭМ).
30	Pterorhynchus wellnhoferi	Юра (~164–160 млн лет)	Китай (Внутренняя Монголия)	Формация Тяоцзишань	На гребне образца CAGS02-IG-gausa-2/M 608 птерозавра Pterorhynchus wellnhoferi сохранились следы, образующие цветовой узор в виде чередующихся полос. Точные цвета пигментации гребня и окраска остального тела реконструированы не были.	Визуальное исследование окаменевших отпечатков мягких тканей (следов на гребне).
8	Confuciusornis sanctus	Ранний мел (~125 млн лет назад)	Провинции Ляонин и Хэбэй, Китай	Формации Исянь и Тяоцзишань	В исследовании Zhang et al. (2010) были взяты образцы с периферии экземпляра IVPP V13171. Изучено более 200 фрагментов, почти все содержали меланосомы, причем как феомеланосомы (отвечающие за рыжие оттенки), так и эумеланосомы (отвечающие за черный/серый цвет). Наличие обоих типов меланосом означает, что оперение конфуциусорниса сочетало черные и рыжевато-коричневые тона. Изменение относительной плотности фео- и эумеланосом на коротких участках пера говорит о сложном цветовом узоре (полосы, пятна или градиенты) в пределах одного пера. В работе Wogelius et al. (2011) ученые провели картирование микроэлементов в ископаемых перьях образца BHI-6358. Было обнаружено, что медь образует стойкие комплексы с эумеланином. На основе распределения меди изучена пигментация у Confuciusornis sanctus. Далее в работе Li et al. (2018) изучен новый экземпляр CUGB P140. Авторы не реконструируют точные цвета, но выявляют узор на уровне всего тела.	Сканирующая электронная микроскопия (СЭМ) и синхротронная рентгенофлуоресцентная спектроскопия (SRS-XRF).
1	Anchiornis huxleyi	Поздняя юра (~160 млн лет назад)	Провинция Ляонин, Китай	Формация Тяоцзишань	В работе Li et al., 2010 изучено 29 участков экземпляра BMNHC PH828, по которым путем анализа меланосом восстановлена окраска животного, кроме хвоста и неоперенных частей тела (см. художественную реконструкцию).  После этого в исследовании Lindgren et al., 2015 ученые не обнаружили феомеланин, отвечающий за рыжую окраску, в хохолке Anchiornis huxleyi экземпляра YFGP-T5199. При этом авторы отмечают, что из-за разницы в размерах и небольших анатомических отличий этот образец может представлять другую возрастную стадию, свидетельствовать о половом диморфизме или даже принадлежать к другому, но близкородственному виду оперенных динозавров.	Сканирующая электронная микроскопия (СЭМ) для изучения формы и плотности меланосом и их сравнение с меланосомами современных птиц. Масс-спектрометрия для анализа молекулярного состава.
10	Yi qi	Средняя–поздняя юра (~160 млн лет назад)	Провинция Хэбэй, Китай	Формация Тяоцзишань	Yi qi впервые описан в публикации Xu et al. (2015) по образцу STM 31-2. Для исследования меланосом в перьях взяты пробы с головы, шеи, плеча, локтя и голени. Установлено, что разные участки тела имели разное сочетание меланосом. Yi qi, вероятно, имел смешанную окраску: темные (серые, черные, коричневые) оттенки в перьях с возможными рыжеватыми участками на голове, а крылья могли быть более светлыми. Всего исследованы 12 проб из разных частей тела: перья над черепом, перья на шее, перья вдоль плечевой кости, перья вдоль локтевой кости, перья вдоль голени, перепончатая ткань рядом с пальцем II, перепончатая ткань рядом с пальцем IV.	Сканирующая электронная микроскопия (СЭМ).
12	Diplodocus sp. (детеныш)	Поздняя юра (~150–145 млн лет назад)	США (штат Монтана)	Формация Моррисон, карьер Mother's Day	В исследовании Gallagher et al., 2025 изучены экземпляры CMC VP 20857, CMC VP 20858, CMC VP 15915, CMC VP 10660, VP 10662 и VP 10659, принадлежащие детенышу диплодока. Соответствие этих фрагментов конкретным участкам тела не установлено. В чешуе обнаружены микротельца продолговатой формы, интерпретируемые как меланосомы. Их размеры попадают в диапазон размеров бурых (феомеланиновых) меланосом современных птиц, а также меланосом черного каймана — единственного нептичьего архозавра с близкими размерами пигментных клеток. Разнообразие этих структур указывает на то, что кожа диплодока могла иметь сложный цветовой паттерн. Вероятно, молодые особи диплодока были пятнистыми или пестрыми. Однако, из-за возможного изменения формы ископаемых меланосом со временем, точные цвета узора неизвестны.	Сканирующая электронная микроскопия (СЭМ).
17	Wiwaxia corrugata	Вторая эпоха кембрия (~508 млн лет назад)	Канада (Британская Колумбия)	Сланцы Берджес	В работе Parker (1998) исследовано несколько образцов Wiwaxia corrugata. На поверхности склеритов были выявлены параллельные микроскопические бороздки, физика которых идентична дифракционным решеткам, создающим перелив у современных морских червей.	Электронная микроскопия.
18	Canadia spinosa	Вторая эпоха кембрия (~508 млн лет назад)	Канада (Британская Колумбия)	Сланцы Берджес	На щетинках образца USNM 202335, принадлежащего полихетному червю Canadia spinosa, обнаружены параллельные бороздки с постоянным периодом, образующие дифракционную решетку, что придавало животному переливающуюся окраску. Такое же устройство имеют щетинки у морской мыши - современного представителя полихет.	Электронная микроскопия.
15	Stenopterygius sp.	Ранняя юра (~180 млн лет назад)	Германия (Баден-Вюртемберг)	Посидониевые сланцы	Окраска ихтиозавров исследовалась несколько раз. Сначала в работе Lindgren et al. (2014) был изучен хвост образца YORYM 1993.338, принадлежащего неопределенному ихтиозавру. На основании исследования этого образца и других ископаемых с полным контуром тела, авторы делают вывод, что ихтиозавры были равномерно темно-окрашенными. Но в последующей публикации Lindgren et al. (2018) произведено более подробное исследование экземпляра MH 432 ихтиозавра Stenopterygius sp. из Германии. Распределение пигментации указывает на то, что животное, вероятно, имело маскировочную противотеневую окраску (темный верх, светлый низ). Кроме того, у ихтиозавра были обнаружены разветвленные меланофоры, которые у современных рептилий способны к физиологическому изменению цвета (перераспределению пигмента).	Комплексный молекулярный и клеточный анализ (включая СЭМ, SRXTM, SRS-XRF, ToF-SIMS и др.).
19	Marrella splendens	Вторая эпоха кембрия (~508 млн лет назад)	Канада (Британская Колумбия)	Сланцы Берджес	Электронная микроскопия образца AM F38262 выявила наличие параллельных микроскопических бороздок на наружных выростах головного щита Marrella splendens, что придавало им переливающуюся окраску из-за дифракции света.	Электронная микроскопия.
11	Sinopterus dongi	Ранний мел (~120 млн лет)	Провинция Ляонин, Китай	Формация Цзюфотан, биота Джехол	В работе Wu et al., 2026 изучен образец CUGB-P2201 птерозавра Sinopterus dongi. Исследователи сообщают о слоистом внутреннем расположении меланосом, образующих фотонную наноструктуру внутри пикнофибр. Оптические симуляции показали, что эта структура отражает иризирующие цвета от зеленого (при угле 0°) до пурпурного (на 40°). На коже возле гребня обнаружены три полосы с повышенной концентрацией элементов (Cu, Ni, S) и меланосом. В этой работе в контексте окраски исследованы только отдельные монофиламенты и участок кожи на гребне. Полная цветовая картина Sinopterus не реконструирована.	Сканирующая электронная микроскопия (СЭМ), масс-спектрометрия (ToF-SIMS) и оптическое моделирование.
16	Tylosaurus nepaeolicus	Поздний мел (~85-80 млн лет назад)	США (штат Канзас)	Формация Ниобрара	В чешуе экземпляра SMU 76532, принадлежащего мозазавру Tylosaurus nepaeolicus, обнаружены структуры, по форме и размерам соответствующие меланосомам, и их химический состав с высокой точностью совпадает с эумеланином — пигментом, отвечающим за черную и коричневую окраску. Анализ проводился только на отдельном образце кожи, поэтому определить, была ли окраска сплошной или с более светлым брюхом (как у современных животных с контрзатенением), невозможно.	Сканирующая электронная микроскопия (СЭМ) и времяпролетная масс-спектрометрия вторичных ионов (ToF-SIMS) для анализа химического состава ткани.
22	Carcinosoma newlini	Поздний силур (~420 млн лет назад)	США (штат Индиана)	Кокомовский доломит	В работе Kjellesvig-Waering (1958) описан экземпляр Carcinosoma newlini из силурийского доломита Кокомо (Индиана), который сохранил прижизненную окраску. Непористый, непроницаемый характер породы предотвратил замещение хитина минералами, позволив сохранить органический материал. Окраска изучена практически у всего тела, за исключением мягких тканей и хелицер, которые не сохранились. Вся спинная сторона животного, включая головогрудь, среднюю часть тела и сегменты хвоста, имела светло-коричневый цвет. Нижняя сторона тела, включая жаберные крышки и брюшные пластины, была заметно светлее спины. Она описывается как светло-коричневая, почти бежевая (желтовато-коричневая). При этом чешуйки на животе были темнее основного фона. Панцирь ракоскорпиона покрывали различные чешуйки, которые создавали цветовой контраст: удлиненные чешуйки были темно-коричневыми, а на самых кончиках переходили в черный цвет. Более мелкие чешуйки, расположенные вдоль передних краев хвостовых сегментов, были просто коричневыми, но все равно хорошо выделялись на фоне более светлого панциря. Ходильные ноги были темно-коричневыми. Чешуйки на них имели черные кончики. Острые шипы, которыми были усеяны ноги, у основания были темно-коричневыми, а к кончикам — чернели. Самые ближние к телу членики ходильных ног были светло-коричневыми с более темными чешуйками. Специальные жевательные выросты на основаниях этих ног, с помощью которых ракоскорпионы измельчали пищу, были полностью черными. Основная часть плавательных ног была коричневой, а широкая уплощенная часть на конце была окаймлена вытянутыми чешуйками, которые переходили в черный цвет. Шипы на самом конце плавательной ноги также были черными. Хвостовой шип был полностью черным.	Прямое наблюдение сохранившихся органических покровов.
23	Archaeopteryx lithographica	Поздняя юра (~150 млн лет назад)	Германия (Бавария)	Зольнхофенские известняки	Проведено несколько исследований окраски перьев крыла археоптерикса. Судя по распределению меди (биомаркера темного пигмента эумеланина), у археоптерикса почти все перья на крыле имели сходный паттерн — темные наружные края и более светлые внутренние части. При этом верхние кроющие перья были полностью матово-черными без какого-либо металлического перелива. Остальные участки тела не были изучены с точки зрения окраски.	Сканирующая электронная микроскопия (СЭМ) для изучения формы меланосом в изолированном пере. Синхротронная рентгенофлуоресцентная спектроскопия (SRS-XRF) для картирования биомаркеров эумеланина вокруг полного скелета HMN 1880.
21	Megalograptus ohioensis	Поздний ордовик (~450 млн лет назад)	США (штат Огайо)	Формация Уэйнсвилл	В статье Caster & Kjellesvig-Waering (1964) описана прижизненная окраска ракоскорпиона Megalograptus ohioensis. Органический покров некоторых экземпляров Megalograptus сохранился без полного минерального замещения, что позволило ученым исследовать оригинальные пигменты всего панциря. Хитин сохранился в трехмерном виде, не сплюснутый, что позволило увидеть рельеф чешуи и щетинок, а также остался гибким (можно было отслаивать от матрикса), что говорит об отсутствии минеральной замены. Общий фон хитинового панциря был темно-коричневым, сочленения - светло-коричневыми, а все остальные части тела (чешуи, щетинки, шипы и жевательные отростки) - черными. Авторы также описывают несколько других видов того же рода из разных горизонтов верхнего ордовика Огайо и соседних штатов. Все они известны по фрагментам, но их окраска (где сохранилась) аналогична — черные чешуи на темно-коричневом фоне.	Прямое наблюдение оригинальной органической кутикулы.
24	Tupandactylus imperator	Ранний мел (~115 млн лет назад)	Бразилия (штат Сеара)	Формация Крато, бассейн Арарипи	Исследование Tupandactylus imperator (MCT.R.1884) из раннемеловой формации Крато в Бразилии показало, что форма меланосом различается в зависимости от типа ткани: в коже гребня, монофиламентах и ветвящихся перьях обнаружены разные популяции меланосом. Кожа гребня имела неоднородную пигментацию. Разная форма меланосом на разных участках указывает на то, что цвет кожи мог варьироваться — возможно, от темно-коричневого до более светлых оттенков. Однако точный цвет остается неизвестным. Монофиламенты, расположенные у проксимальной (лежащей ближе к центру организма) части затылочного отростка, содержат удлиненные меланосомы. Их форма характерна для эумеланина и часто ассоциируется с черной или очень темной окраской у современных птиц. Ветвящиеся структуры, расположенные у дистальной (дальней от тела) части затылочного отростка, содержат овальные меланосомы, форма которых отличается от меланосом монофиламентов и кожи. Они были окрашены в темный цвет, но, возможно, иного оттенка, чем монофиламенты.	Сканирующая электронная микроскопия (СЭМ).
25	Changzuiornis ahgmi	Ранний мел (~122 млн лет назад)	Провинция Ляонин, Китай	Формация Цзюфотан, биота Джехол	Изучение отпечатков меланосом показало наличие удлиненных структур в перьях крыльев и хвоста, что свидетельствует о том, что эти участки оперения имели черный или темно-коричневый окрас. Окраска остального тела на данный момент остается неизвестной, так как соответствующие химические и морфологические анализы для других частей ископаемого не проводились.	Сканирующая электронная микроскопия (СЭМ) для анализа морфологии отпечатков меланосом.
5	Sinosauropteryx prima	Ранний мел (~124 млн лет назад)	Провинция Ляонин, Китай	Формация Исянь, биота Джехол	Окраска животного служила камуфляжем на открытой местности. Спина была темной, а живот — светлым. Хвост был украшен контрастными темными и светлыми кольцами. На морде через глаза проходила темная продольная полоса. Однако используемый в большинстве реконструкций рыже-коричневый цвет этого узора является гипотетическим, так как изначально он был определен по образцу, который в 2025 году переклассифицирован как Huadanosaurus.	Изучение распределения темных отпечатков перьев на трех плитах-окаменелостях. Создание полноразмерной 3D-модели динозавра для тестирования теней под различными источниками света.
14	Wulong bohaiensis (молодая особь)	Ранний мел (~120 млн лет назад)	Провинция Ляонин, Китай	Формация Цзюфотан, биота Джехол	В Croudace et al. (2023) изучен образец DNHM D2933 годовалой особи Wulong bohaiensis. Анализ показал с высокой вероятностью, что перья на предплечьях и голенях были иридисцентными. Предполагается, что маховые перья на передних и задних конечностях имели радужный/глянцевый блеск. Образцы с туловища, от спины и груди, определены как серые. Мелкие овальные меланосомы из грудной области дали противоречивый результат: QDA — серый, MLR — бурый. Авторы предполагают, что это может быть промежуточный цвет (между серым и бурым) или артефакт наложения разных перьев. Голова, хвост и брюшная полость не исследованы с точки зрения окраски.	Сканирующая электронная микроскопия (СЭМ) и статистический анализ формы меланосом (QDA и MLR).
34	Прямораковинные головоногие	Ордовик, силур, девон, карбон, пермь, триас	Глобальное распространение (Швеция, Чехия, США и др.)	Множество местонахождений в разных странах	На данный момент найдено множество раковин прямораковинных головоногих моллюсков со следами прижизненной окраски. Они представляют собой продольные или поперечные полосы (в том числе нерегулярные и прерывистые) и зигзагообразные узоры.	Визуальное исследование пигментных узоров на раковинах.
33	Трилобиты	Кембрий, ордовик, силур, девон, карбон	Глобальное распространение (США, Германия, Россия и др.)	Множество местонахождений в разных странах	У многих видов трилобитов на панцирях и задних хвостовых щитах (пигидиях) задокументированы прижизненные узоры в виде темных полос и пятен. Кроме того, кальцитовые линзы их фасеточных глаз при облучении ультрафиолетом излучали сине-зеленое свечение. Это породило мнение, что глаза трилобитов светились в темноте. Однако такое вряд ли было возможно в естественной донной среде, куда УФ-лучи почти не проникали (подробно об этом можно почитать в работе Schoenemann et al., 2015).	Визуальное исследование пигментных узоров на панцирях.
37	Saurolophus angustirostris	Поздний мел (~70 млн лет назад)	Монголия (пустыня Гоби)	Формация Немегт	На хвосте динозавра обнаружено чередование зон разной чешуи, откуда делается вывод, что он, вероятнее всего, имел вертикальную полосатую окраску. Обосновывается это тем, что у современных рептилий смена цвета часто, хотя и не всегда, сопровождается сменой типа, размера или текстуры чешуи.	Анализ морфологии ископаемой чешуи.
36	Мезозойские млекопитающие	Юра, мел	Китай	Биоты Джехол и Яньляо	В работе Li et al. (2025) исследована окраска 6 мезозойских видов млекопитающих: юрские Arboroharamiya fuscus, Vilevolodon diplomylos, Megaconus mammaliaformis, а также меловые докодонты и эутерий. Несмотря на различия в систематическом положении и образе жизни, все шесть видов имели однородную темно-коричневую окраску без узоров. Это объясняется отсутствием разнообразия форм меланосом и согласуется с гипотезой о ночном образе жизни и отсутствием полового диморфизма или внутривидовой визуальной сигнализации.	Сканирующая электронная микроскопия (СЭМ).
39	Hadrosauridae indet. (экз. YPMPU 016969)	 Поздний мел	США	N/A	Сканирующая электронная микроскопия фрагмента кожи образца YPMPU 016969 показала аморфный органический слой без сохранения исходной геометрической формы меланосом. Однако спектроскопическими методами удалось определить наличие эумеланина (черно-серого пигмента) в коже животного. При этом феомеланиновые маркеры отсутствуют. Это указывает на вероятную однотонную серую или темно-серую окраску. Окончательная реконструкция цвета ограничена отсутствием данных о немеланиновых пигментах, а также о других частях тела динозавра.	Сканирующая электронная микроскопия (СЭМ), рамановская микроспектроскопия и энергодисперсионная рентгеновская спектроскопия.
38	Saurolophus osborni	Поздний мел (~70 млн лет назад)	Канада (провинция Альберта)	Формация каньона Хорсшу	На ископаемой коже хвоста динозавра разные по размеру чешуйки группируются в хаотичные мозаичные узоры. Предполагается, что окраска этого вида была крапчатой или пятнистой. Обосновывается это тем, что у современных рептилий смена цвета часто, хотя и не всегда, сопровождается сменой типа, размера или текстуры чешуи.	Анализ морфологии ископаемой чешуи.
40	Serikornis sungei	Поздняя юра (~160 млн лет назад)	Провинция Ляонин, Китай	Формация Тяоцзишань	Окраска Serikornis sungei больше обсуждается в СМИ, чем в научных публикациях. В статье Lefèvre et al. (2017), где описан голотип серикорниса PMOL-AB00200, ничего не сказано об окраске, но приводятся фотографии оперения конечностей и хвоста, на которых сохранился узор в виде чередования темных и светлых полос. Эти полосы упомянуты в блоге одного из авторов исследования - Андреа Кау. 	Осмотр перьев с сохранившимися цветовыми отметинами.
41	Edmontosaurus annectens	Поздний мел (~68–66 млн лет назад)	США (Северная Дакота, Вайоминг, Монтана)	Формации Хелл-Крик и Лэнс	На сегодняшний день найдено как минимум 5 ископаемых образцов эдмонтозавров (например, AMNH 5060, SMF R 4036 и NDGS 2000), у которых сохранился практически полный скелет с окаменевшими участками кожи и мягкими тканями. В публикации Генри Осборна 1912 года «Integument of the Iguanodont Dinosaur Trachodon» было высказано предположение, что морфология чешуи динозавра может указывать на наличие узора на его коже. Осборн задокументировал, что кожа эдмонтозавра (образец AMNH 5060) покрыта мелкой чешуей, среди которой хаотично разбросаны скопления более крупной, «мостовидной» чешуи. Ученый пишет: «По аналогии с существующими ящерицами и змеями мы можем предположить, что кластеры «мостовидных» бугорков представляют собой более глубоко пигментированные участки, которые, будучи широко рассеянными по брюшной поверхности тела, концентрировались в большие пигментированные пятна вдоль спины, по бокам горла и на внешних сторонах конечностей... Нижние поверхности тела могли быть, соответственно, более бледными». Аналогичное предположение о связи морфологии чешуи с окрасом сделала группа Филлипа Мэннинга, изучающая мумию эдмонтозавра по прозвищу «Дакота» (образец NDGS 2000). Расположение чешуи этого образца указывает на то, что на передних конечностях животного возле локтя мог присутствовать полосатый узор.	Изучение морфологии чешуи.
43	Cruralispennia multidonta	Ранний мел (~131 млн лет назад)	Провинция Хэбэй, Китай	Формация Хуацзиин, биота Джехол	Для изучения окраски было взято 5 проб с разных частей образца IVPP V21711: области возле черепа, левого и правого крыла, хвоста и перьев на голени. Во всех были найдены палочковидные структуры, идентифицированные как эумеланосомы (отвечают за черные, серые и темно-коричневые цвета). Различия в соотношении сторон меланосом между участками указывают на то, что перья на голени имели иной цвет, чем остальное тело. Авторы не дают точной цветовой реконструкции, но указывают, что окраска была дифференцированной.	Сканирующая электронная микроскопия (СЭМ).
45	Iteravis huchzermeyeri	Ранний мел (~120 млн лет назад)	Провинция Ляонин, Китай	Формация Исянь / Цзюфотан (биота Джехол)	Пробы для исследования окраски Iteravis huchzermeyeri взяты с двух участков образца AGB5841: контурное перо (грудь) и маховое перо (крыло). В обоих были обнаружены эумеланосомы, указывающие на глубокий темный (вероятно, полностью черный) цвет. Меланосомы не организованы в упорядоченные слои, что указывает на матовый оттенок перьев, без перелива. Являлась ли птица черной целиком — неизвестно.	Сканирующая электронная микроскопия (СЭМ).
42	Coelurosauria indet. (DIP-V-15103)	Середина мела (~99 млн лет назад)	Мьянма (штат Качин, долина Хуконг)	Бирманский янтарь	В бирманском янтаре обнаружен кусок хвоста детеныша целурозавра (образец DIP-V-15103). Он сохранил следы прижизненной окраски: верхняя сторона хвоста каштаново-коричневая, а нижняя — очень бледная или белая. Из-за возможного тафономического искажения цвета при жизни перья динозавра могли быть более темными или иметь немного другой оттенок бурого. Установлено, что меланосомы в перьях хвоста имеют простую форму и хаотично распределены. Это позволяет утверждать, что хвост этого детеныша был матовым и не имел металлического или радужного перелива.	Сканирующая электронная микроскопия (СЭМ), синхротронная рентгенофлуоресценция (SR XRF) и визуальный осмотр макропигментации, сохраненной в смоле.
44	Protopteryx fengningensis	Ранний мел (131 млн лет назад)	Провинция Хэбэй, Китай	Формация Хуацзиин, биота Джехол	При исследовании образца STM7-143 взята проба с дистального (дальнего от тела) конца одного из внешних маховых перьев правого крыла. Обнаружены многочисленные эумеланосомы, отвечающие за черную или темную окраску у современных птиц. Их большое количество и неупорядоченное расположение указывают на черный цвет без иризации. Больше ничего о цвете оперения протоптерикса неизвестно.	Сканирующая электронная микроскопия (СЭМ).
32	Скорлупа яиц	Мел	США, Китай, Монголия, Аргентина, Франция	Множество местонахождений в разных странах	В работе Wiemann et al. (2015) исследуется окраска яичной скорлупы овирапторида Heyuannia huangi по молекулярным маркерам окраски — пигментам протопорфирину и биливердину. Авторы предполагают, что яйца Heyuannia могли быть оливково-зелеными (если без пятен) или крапчато-коричневыми на сине-зеленом фоне (если была пятнистость). Далее в Wiemann et al. (2018) проводится исследование скорлупы яиц выборки животных от мелового периода до наших дней. Мезозойские представители включают Maiasaura peeblesorum, Deinonychus antirrhopus и троодонтида из США; энанциорниса, микротроодонтида и троодонтида из Монголии; сальтазаврида из Аргентины; титанозавра из Франции и упомянутого выше Heyuannia huangi из Китая. Установлено, что все проанализированные яйца меловых нептичьих динозавров — орнитисхий и зауропод — были лишены пигментов. Напротив, все яйца меловых эуманирапторов оказались окрашенными. Единственным исключением среди последних стал североамериканский троодонтид, у которого пигменты не сохранились, что авторы интерпретируют как вторичную потерю окраски.	Жидкостная хроматография (HPLC), масс-спектрометрия ESI-Q-TOF и рамановская спектроскопия высокого разрешения.
48	Enantiornithes indet. из бирманского янтаря (птенцы)	Середина мела (~99 млн лет назад)	Мьянма (штат Качин, долина Хуконг)	Бирманский янтарь	В бирманском янтаре найдены части птичьих крыльев и целый птенец энанциорниса. Визуальный анализ сохранившейся пигментации крыльев показал, что маховые перья имели коричневую окраску с более темными вершинами, дорсальные (задние) контурные перья были темно-коричневыми, тогда как вентральная (передняя) сторона и пух были бледными или белыми, а у основания алюлы (мелких перьев на первом пальце крыла) обоих крыльев присутствовало светлое пятно. У птенца HPG-15-1 обнаружены темно-пигментированные щетинковидные структуры на ногах и хвосте, напоминающие примитивные протоперья. Его маховые перья были коричневыми с бледными поперечными полосами и светлыми вершинами.	Прямой визуальный и микроскопический анализ сохраненных пигментов в проходящем и отраженном свете через прозрачную смолу.
47	Аммониты	Триас, юра, мел	Глобальное распространение (Россия, США, Мадагаскар, Франция, Польша и др.)	Множество местонахождений в разных странах	В обзоре Mapes и Larson (2015) обобщены все известные на тот момент случаи сохранения окраски у аммоноидей, охватывающие более 50 родов из триаса, юры и мела. Истинные пигментные узоры (в основном темные поперечные или продольные полосы на светлом фоне) зафиксированы у многочисленных таксонов, причем самые древние достоверные образцы происходят из раннего триаса Невады (США). Главным открытием, описанным в статье, стали иризирующие продольные полосы, обнаруженные у представителей юры (Россия, Польша) и мела (Мадагаскар, Франция, США). Их природа, вероятно, структурная (связана с микростроением призматического слоя раковины), а не пигментная. Авторы также предупреждают о ложных цветовых узорах, возникающих из-за утолщения раковины, пиритизации или минерализации камер.	Визуальное наблюдение, фото, растворение в кислоте.
20	Anurognathidae	Средняя–поздняя юра (~164–160 млн лет назад)	Китай (Внутренняя Монголия и пров. Ляонин)	Биота Яньляо — отложения Даохугоу и формация Тяоцзишань	Сканирующая электронная микроскопия образцов двух анурогнатидных птерозавров (NJU-57003 и CAGS-Z070) выявила плотно упакованные микротельца в пикнофибрах. Большинство — овальные, что интерпретируется как феомеланосомы (бурый/рыжий цвет). Немногочисленные палочковидные интерпретируются как эумеланосомы (черный цвет). При этом спектры образцов ближе к структурам, богатым феомеланином, чем к эумеланину, то есть окраска животных, скорее всего, была рыжевато-коричневой.	Сканирующая электронная микроскопия (СЭМ), инфракрасная спектроскопия FTIR, энергодисперсионная спектроскопия EDX.
26	Beipiaosaurus	Ранний мел (~125 млн лет назад)	Провинция Ляонин, Китай	Формация Исянь	Форма меланосом в ископаемых перьях, отобранных из области шеи образца BMNHC PH000911, свидетельствует о коричневом окрасе. Окраска остальных частей тела остается неизвестной, так как для них нет химических или морфологических данных. Авторы исследования предупреждают, что для нептичьих динозавров и птерозавров с нитевидными покровами реконструкция окраски на основании исключительно формы меланосом может давать недостоверный результат. Так, например, у современных рептилий меланосомы имеют однообразную форму, которая не коррелирует с цветом кожи. Связь между формой меланосом и цветом достоверно установлена только для современных птиц и млекопитающих. В более поздних работах, таких как исследования птерозавров и детенышей диплодока с точки зрения окраски, было обнаружено, что у них присутствуют различные типы меланосом. Это позволяет предположить, что окраска этих групп также могла быть связана с формой меланосом, как и в случае с современными птицами.	Сканирующая электронная микроскопия (СЭМ).
31	Platecarpus tympaniticus	Поздний мел (~84-81 млн лет назад)	США (штат Канзас)	Формация Ниобрара 	В области глаз образца LACM 128319 были обнаружены сохранившиеся меланосомы. Сами меланосомы не дают информации о цвете радужки или склеры, но они указывают на наличие пигментированной сетчатки, что характерно для дневных или сумеречных животных. Также на отпечатках кожи на головке левого ребра шестого шейного позвонка и на третьем шейном позвонке видны макроскопические цветовые отметины в виде полос и неоднородной окраски чешуй. Однако авторы указывают, что это может быть следствием как прижизненного распределения окраски, так и неодинаковой сохранности образца.	Сканирующая электронная микроскопия (СЭМ) и визуальный анализ чешуи животного.
46	Shangyang sp.	Ранний мел (~120 млн лет назад)	Провинция Ляонин, Китай	Формация Цзюфотан, биота Джехол	У образца IVPP V26899 исследована окраска хохолка. Плотная асимметричная упаковка найденных в нем палочковидных меланосом была проанализирована с помощью оптического моделирования. Расчеты показали, что эта наноструктура придавала перьям переливающуюся окраску, дающую разные цвета при разных углах обзора. При малых углах падения света (≤30°) перья выглядят темными, а при углах 40°–70° отраженный свет меняется от красного к синему (угол отсчитывается от нормали к поверхности пера).	Сканирующая электронная микроскопия (СЭМ) и FDTD-моделирование.
3	Psittacosaurus sp.	Ранний мел (~125 млн лет назад)	Провинция Ляонин, Китай	Формация Исянь, биота Джехол	Исследования экземпляра SMF R 4970 позволили восстановить окраску всего тела животного, кроме небольшой части спины и щетин на хвосте. Общий тон был коричневатым или красновато-коричневым. Присутствовал эффект противотени: спина была темной, а брюхо — светлым. Сильная пигментация на морде образовывала темную маску вокруг клюва. На передних и задних лапах имелись темные пятна и контрастные полосы с внутренней стороны. Область клоаки под хвостом выделялась ярким темным пятном. Авторы обсуждают, что у рептилий есть хроматофоры, которые могут создавать структурные цвета (зеленый, синий), но они не сохраняются в ископаемом состоянии. В принципе, пситтакозавр мог иметь такие цвета, но доказательств нет, а наблюдаемые узоры у него четко привязаны к чешуе, что не характерно для хроматофоров, которые находятся глубже в коже). Авторы склоняются к тому, что хроматофоры у пситтакозавра либо отсутствовали, либо не влияли на видимый узор. В работе также утверждается, что окраска пситтакозавра указывает на его среду обитания. Граница перехода от темного к светлому на его теле расположена очень низко на брюхе. Такой камуфляж позволяет скрывать тело в условиях рассеянного света, свойственных лесам. Если бы динозавр жил на открытых равнинах под прямым солнцем, граница светлого брюха поднималась бы гораздо выше по бокам.	 Сканирующая электронная микроскопия (СЭМ) для идентификации меланосом. Лазерно-индуцированная флуоресценция (LIF), выявившая скрытые детали пигментации. Тестирование камуфляжа на скульптуре 1:1 под разным освещением.
13	Yuanchuavis kompsosoura	Ранний мел (~120 млн лет назад)	Провинция Ляонин, Китай	Формация Цзюфотан, биота Джехол	В работе Wang et al. (2021) изучены меланосомы в хвостовых перьях образца IVPP V27883. Хвост птицы имел контрастную окраску. Два центральных пера были очень темными (черными или темно-коричневыми). Оперение короткого веера у основания хвоста было более светлым — серым, либо имело непереливающийся структурный цвет. В природе такой тип структурного цвета обычно выглядит как насыщенный синий или голубой. Другие участки тела не исследовались с точки зрения окраски.	Сканирующая электронная микроскопия (СЭМ).
9	Borealopelta markmitchelli	Ранний мел (~110 млн лет назад)	Канада (провинция Альберта)	Формация Клируотер	В работе Brown et al. (2017) исследован экземпляр TMP 2011.033.0001. Взято 147 проб с разных участков образца, что позволило изучить практически все тело динозавра (за исключением конечностей, частей брюха и хвоста). Обнаружены органические остатки, химически соответствующие феомеланину, сохранившиеся в кератиновых чехлах остеодерм и чешуе. Распределение пигмента указывает на противотеневую окраску, которая выполняет функцию камуфляжа. Установлено, что кожа Borealopelta markmitchelli имела бурый цвет (точный оттенок неизвестен), брюхо и шипы были светлее остального панциря.	Времяпролетная масс-спектрометрия вторичных ионов (ToF-SIMS) и пиролизная газохроматография-масс-спектрометрия (Py-GC-MS).
28	Eoconfuciusornis	Ранний мел (~131 млн лет назад)	Провинция Хэбэй, Китай	Формация Хуацзиин	Для исследования окраски образца эоконфуциусорниса STM7-144 было взято 24 пробы из разных участков тела: с крыльев, хвоста, шеи, головы и ног. При помощи сканирующей электронной микроскопии были обнаружены меланосомы разных типов. Большинство перьев, включая кроющие крыла, маховые перья, а также перья на шее, хвосте и ногах, содержали вытянутые меланосомы, характерные для эумеланина. Это означает, что эти части тела птицы были окрашены в черный или очень темный цвет. На второстепенных маховых перьях и кроющих перьях крыла ученые заметили слабый узор: темные пятна и кончики на более светлом фоне. На теменных перьях и перьях голени были обнаружены более крупные овальные эумеланосомы, которые могли придавать им сероватый оттенок. На подбородочных перьях нашли маленькие круглые меланосомы, которые являются признаком феомеланина — пигмента, отвечающего за рыжие и коричневые тона.	Сканирующая электронная микроскопия (СЭМ).
35	Слабо изменившиеся животные	Девон, карбон, пермь, триас, юра, мел	 Глобальное распространение (США, Китай, Германия, Великобритания и др.)	Множество местонахождений в разных странах	Чешуя многих ископаемых рыб сохранила прижизненные паттерны окраски. У мезозойских насекомых (например, сетчатокрылых насекомых семейства Kalligrammatidae) обнаружены пятна и полосы на крыльях, а у древних ос, мух и жуков — структурная переливающаяся окраска. Насекомые рода Lichenipolystoechotes использовали ветвящийся узор на крыльях для маскировки под лишайник. В окаменелостях морских лилий найдены органические пигменты, идентичные современным, на основании чего сделан вывод, что ископаемые морские лилии при жизни обладали такими же яркими цветами, что и современные. Также восстановлены элементы окраски множества раковин моллюсков и брахиопод.	Сканирующая электронная микроскопия (СЭМ), химический анализ маркеров окраски, визуальный анализ пигментных отпечатков.
\.


--
-- Data for Name: taxon_media; Type: TABLE DATA; Schema: public; Owner: paleo_admin
--

COPY public.taxon_media (taxon_id, media_id) FROM stdin;
1	2
6	25
2	6
2	7
3	9
3	10
4	12
4	13
4	14
1	1
1	20
1	21
1	4
1	22
6	26
2	5
2	23
3	8
3	24
4	11
5	15
5	16
5	17
6	18
6	19
5	27
7	28
7	29
7	30
8	31
8	32
8	33
8	34
8	35
8	36
8	37
9	38
9	39
9	40
10	41
10	42
10	43
10	44
11	45
11	46
11	47
11	48
12	49
12	50
12	51
12	52
13	53
13	54
13	55
14	56
14	57
14	58
14	59
15	60
15	61
15	62
16	63
16	64
16	65
17	66
17	67
17	68
17	69
18	70
18	69
18	71
19	69
19	72
19	73
20	74
20	75
20	76
20	77
20	78
21	79
21	80
21	81
22	82
22	83
22	84
23	85
23	86
23	87
23	88
23	89
23	90
23	91
24	92
24	93
24	94
24	95
25	96
25	97
25	98
26	99
26	100
26	101
26	102
27	104
27	105
27	106
28	107
28	108
28	109
29	110
29	111
29	112
30	113
30	114
30	115
30	116
2	117
4	117
27	117
29	117
1	117
8	117
7	117
20	117
30	117
10	117
15	117
3	117
5	117
23	117
24	117
25	117
26	117
9	117
28	117
31	117
31	118
31	119
31	120
31	121
31	122
32	117
32	123
32	124
32	125
33	126
33	127
33	128
33	129
33	130
33	131
34	132
34	133
34	134
34	135
34	136
34	137
27	138
4	138
8	138
30	138
1	138
15	138
23	138
31	138
5	138
33	138
35	138
34	138
35	139
35	141
35	142
35	143
35	144
35	145
35	146
36	147
36	148
36	149
37	150
38	150
37	151
38	151
37	152
38	153
37	154
38	155
39	156
39	157
39	158
40	159
40	160
40	161
40	162
41	163
41	164
41	165
41	166
41	167
41	168
41	169
41	170
42	171
42	172
42	173
43	174
43	175
43	176
44	177
44	178
44	179
45	180
45	181
45	182
46	183
46	184
46	185
32	186
47	187
47	188
47	189
47	190
48	191
48	192
48	193
48	194
48	195
15	197
47	198
35	199
35	200
\.


--
-- Data for Name: taxon_publication; Type: TABLE DATA; Schema: public; Owner: paleo_admin
--

COPY public.taxon_publication (taxon_id, publication_id) FROM stdin;
1	1
2	2
3	3
4	4
6	5
1	6
6	7
5	8
7	5
8	5
8	9
8	10
9	11
10	12
11	13
12	14
13	15
14	16
15	17
15	18
16	17
17	19
18	19
19	19
20	20
21	21
22	22
23	23
23	24
23	25
24	26
25	27
26	28
27	28
28	29
29	30
30	31
2	32
4	32
27	32
29	32
1	32
8	32
7	32
20	32
30	32
10	32
15	32
3	32
5	32
23	32
24	32
25	32
26	32
9	32
28	32
31	32
31	33
32	32
32	34
33	35
33	36
33	37
33	38
34	35
34	39
35	35
27	40
4	40
8	40
30	40
1	40
15	40
23	40
31	40
5	40
33	40
35	40
34	40
35	41
35	42
35	44
35	45
36	46
37	47
38	47
39	48
40	49
40	50
41	51
41	52
41	53
42	54
43	55
44	56
45	57
46	58
32	59
47	60
48	61
48	62
47	63
35	64
\.


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paleo_admin
--

SELECT pg_catalog.setval('public.media_id_seq', 200, true);


--
-- Name: publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paleo_admin
--

SELECT pg_catalog.setval('public.publication_id_seq', 64, true);


--
-- Name: taxon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paleo_admin
--

SELECT pg_catalog.setval('public.taxon_id_seq', 48, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: publication publication_pkey; Type: CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.publication
    ADD CONSTRAINT publication_pkey PRIMARY KEY (id);


--
-- Name: taxon_media taxon_media_pkey; Type: CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.taxon_media
    ADD CONSTRAINT taxon_media_pkey PRIMARY KEY (taxon_id, media_id);


--
-- Name: taxon taxon_name_key; Type: CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.taxon
    ADD CONSTRAINT taxon_name_key UNIQUE (name);


--
-- Name: taxon taxon_pkey; Type: CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.taxon
    ADD CONSTRAINT taxon_pkey PRIMARY KEY (id);


--
-- Name: taxon_publication taxon_publication_pkey; Type: CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.taxon_publication
    ADD CONSTRAINT taxon_publication_pkey PRIMARY KEY (taxon_id, publication_id);


--
-- Name: taxon_media taxon_media_media_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.taxon_media
    ADD CONSTRAINT taxon_media_media_id_fkey FOREIGN KEY (media_id) REFERENCES public.media(id);


--
-- Name: taxon_media taxon_media_taxon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.taxon_media
    ADD CONSTRAINT taxon_media_taxon_id_fkey FOREIGN KEY (taxon_id) REFERENCES public.taxon(id);


--
-- Name: taxon_publication taxon_publication_publication_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.taxon_publication
    ADD CONSTRAINT taxon_publication_publication_id_fkey FOREIGN KEY (publication_id) REFERENCES public.publication(id);


--
-- Name: taxon_publication taxon_publication_taxon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: paleo_admin
--

ALTER TABLE ONLY public.taxon_publication
    ADD CONSTRAINT taxon_publication_taxon_id_fkey FOREIGN KEY (taxon_id) REFERENCES public.taxon(id);


--
-- PostgreSQL database dump complete
--

\unrestrict r0rKspphFvf0uwhD8kivMSWOW7waLOTK8ZL0fe9ZPxP4iIv507aSlRT4vbVCHnr

