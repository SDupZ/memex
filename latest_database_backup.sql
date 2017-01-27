--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO docker;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO docker;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO docker;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO docker;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO docker;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO docker;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO docker;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO docker;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO docker;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO docker;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO docker;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO docker;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_blogpost; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE blog_blogpost (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    title character varying(150) NOT NULL,
    slug character varying(150) NOT NULL,
    blurb text,
    content text,
    header_image_id integer
);


ALTER TABLE blog_blogpost OWNER TO docker;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE blog_blogpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_id_seq OWNER TO docker;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE blog_blogpost_id_seq OWNED BY blog_blogpost.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO docker;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO docker;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO docker;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO docker;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO docker;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO docker;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO docker;

--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE easy_thumbnails_source OWNER TO docker;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_source_id_seq OWNER TO docker;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE easy_thumbnails_thumbnail OWNER TO docker;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_thumbnail_id_seq OWNER TO docker;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE easy_thumbnails_thumbnaildimensions OWNER TO docker;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_thumbnaildimensions_id_seq OWNER TO docker;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: filer_clipboard; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE filer_clipboard (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE filer_clipboard OWNER TO docker;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE filer_clipboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_clipboard_id_seq OWNER TO docker;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE filer_clipboard_id_seq OWNED BY filer_clipboard.id;


--
-- Name: filer_clipboarditem; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE filer_clipboarditem (
    id integer NOT NULL,
    clipboard_id integer NOT NULL,
    file_id integer NOT NULL
);


ALTER TABLE filer_clipboarditem OWNER TO docker;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE filer_clipboarditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_clipboarditem_id_seq OWNER TO docker;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE filer_clipboarditem_id_seq OWNED BY filer_clipboarditem.id;


--
-- Name: filer_file; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE filer_file (
    id integer NOT NULL,
    file character varying(255),
    _file_size integer,
    sha1 character varying(40) NOT NULL,
    has_all_mandatory_data boolean NOT NULL,
    original_filename character varying(255),
    name character varying(255) NOT NULL,
    description text,
    uploaded_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    is_public boolean NOT NULL,
    folder_id integer,
    owner_id integer,
    polymorphic_ctype_id integer
);


ALTER TABLE filer_file OWNER TO docker;

--
-- Name: filer_file_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE filer_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_file_id_seq OWNER TO docker;

--
-- Name: filer_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE filer_file_id_seq OWNED BY filer_file.id;


--
-- Name: filer_folder; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE filer_folder (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    owner_id integer,
    parent_id integer,
    CONSTRAINT filer_folder_level_check CHECK ((level >= 0)),
    CONSTRAINT filer_folder_lft_check CHECK ((lft >= 0)),
    CONSTRAINT filer_folder_rght_check CHECK ((rght >= 0)),
    CONSTRAINT filer_folder_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE filer_folder OWNER TO docker;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE filer_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_folder_id_seq OWNER TO docker;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE filer_folder_id_seq OWNED BY filer_folder.id;


--
-- Name: filer_folderpermission; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE filer_folderpermission (
    id integer NOT NULL,
    type smallint NOT NULL,
    everybody boolean NOT NULL,
    can_edit smallint,
    can_read smallint,
    can_add_children smallint,
    folder_id integer,
    group_id integer,
    user_id integer
);


ALTER TABLE filer_folderpermission OWNER TO docker;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE filer_folderpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_folderpermission_id_seq OWNER TO docker;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE filer_folderpermission_id_seq OWNED BY filer_folderpermission.id;


--
-- Name: filer_image; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE filer_image (
    file_ptr_id integer NOT NULL,
    _height integer,
    _width integer,
    date_taken timestamp with time zone,
    default_alt_text character varying(255),
    default_caption character varying(255),
    author character varying(255),
    must_always_publish_author_credit boolean NOT NULL,
    must_always_publish_copyright boolean NOT NULL,
    subject_location character varying(64) NOT NULL
);


ALTER TABLE filer_image OWNER TO docker;

--
-- Name: filer_thumbnailoption; Type: TABLE; Schema: public; Owner: docker; Tablespace: 
--

CREATE TABLE filer_thumbnailoption (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    crop boolean NOT NULL,
    upscale boolean NOT NULL
);


ALTER TABLE filer_thumbnailoption OWNER TO docker;

--
-- Name: filer_thumbnailoption_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE filer_thumbnailoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_thumbnailoption_id_seq OWNER TO docker;

--
-- Name: filer_thumbnailoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE filer_thumbnailoption_id_seq OWNED BY filer_thumbnailoption.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY blog_blogpost ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_clipboard ALTER COLUMN id SET DEFAULT nextval('filer_clipboard_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_clipboarditem ALTER COLUMN id SET DEFAULT nextval('filer_clipboarditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_file ALTER COLUMN id SET DEFAULT nextval('filer_file_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_folder ALTER COLUMN id SET DEFAULT nextval('filer_folder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_folderpermission ALTER COLUMN id SET DEFAULT nextval('filer_folderpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_thumbnailoption ALTER COLUMN id SET DEFAULT nextval('filer_thumbnailoption_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add source	7	add_source
20	Can change source	7	change_source
21	Can delete source	7	delete_source
22	Can add thumbnail	8	add_thumbnail
23	Can change thumbnail	8	change_thumbnail
24	Can delete thumbnail	8	delete_thumbnail
25	Can add thumbnail dimensions	9	add_thumbnaildimensions
26	Can change thumbnail dimensions	9	change_thumbnaildimensions
27	Can delete thumbnail dimensions	9	delete_thumbnaildimensions
28	Can add thumbnail option	10	add_thumbnailoption
29	Can change thumbnail option	10	change_thumbnailoption
30	Can delete thumbnail option	10	delete_thumbnailoption
31	Can add file	11	add_file
32	Can change file	11	change_file
33	Can delete file	11	delete_file
34	Can add Folder	12	add_folder
35	Can change Folder	12	change_folder
36	Can delete Folder	12	delete_folder
37	Can use directory listing	12	can_use_directory_listing
38	Can add clipboard item	13	add_clipboarditem
39	Can change clipboard item	13	change_clipboarditem
40	Can delete clipboard item	13	delete_clipboarditem
41	Can add clipboard	14	add_clipboard
42	Can change clipboard	14	change_clipboard
43	Can delete clipboard	14	delete_clipboard
44	Can add folder permission	15	add_folderpermission
45	Can change folder permission	15	change_folderpermission
46	Can delete folder permission	15	delete_folderpermission
47	Can add image	16	add_image
48	Can change image	16	change_image
49	Can delete image	16	delete_image
50	Can add Blog Post	17	add_blogpost
51	Can change Blog Post	17	change_blogpost
52	Can delete Blog Post	17	delete_blogpost
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('auth_permission_id_seq', 52, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$30000$egSys7abLjEf$mpxYTV7+Z3hUoqO6wStCKjHU2SEvPtfyCWP1J96HlSc=	2017-01-27 01:01:56.756232+00	t	admin				t	t	2017-01-27 01:01:47.511554+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_blogpost; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY blog_blogpost (id, created, modified, title, slug, blurb, content, header_image_id) FROM stdin;
1	2017-01-27 01:02:30.816136+00	2017-01-27 01:02:30.816159+00	Blog Post One	blog-post-one	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla lorem augue, ac faucibus mi rhoncus vel. Nullam non lacus mattis, accumsan ipsum nec, efficitur ex. Nunc luctus ante non lectus mattis malesuada eget vitae nibh. Proin pulvinar, neque eu semper sagittis, lorem lorem condimentum risus, id tristique leo lacus eu diam. Fusce dui nisi, suscipit vitae ipsum nec, rhoncus consectetur quam. Proin lobortis ullamcorper accumsan. Praesent non cursus ipsum. In ac mi vitae nisi dapibus lacinia et id lectus. Morbi ac turpis risus. Nulla lorem lectus, ornare sed nibh quis, semper maximus lorem. Vivamus quis risus elementum, fermentum tellus nec, rhoncus ipsum. Ut scelerisque quis ligula in dictum. Phasellus tincidunt porttitor imperdiet. Vivamus metus dui, commodo ac sollicitudin at, eleifend quis nunc.</p>\r\n\r\n<p>Pellentesque vitae tempor tortor, ac consequat sem. Nam ipsum massa, tristique sit amet nulla et, hendrerit viverra velit. Aenean ac augue eu risus vehicula varius rutrum vel ligula. Maecenas mattis posuere orci non lacinia. Cras aliquet scelerisque hendrerit. Suspendisse potenti. Etiam ex mauris, mollis ac ante in, lobortis congue nisi. Integer eget sapien at ipsum porttitor finibus in vitae risus. Nunc rhoncus turpis at sagittis eleifend. Nunc at ligula sapien.</p>\r\n\r\n<p>Suspendisse potenti. Fusce volutpat massa sem, at ornare diam efficitur vitae. Aenean eu mi et lectus sagittis fermentum. Cras vehicula purus magna, in hendrerit nisi consectetur sit amet. Nam purus elit, sodales at mi eget, tincidunt fringilla erat. Nam gravida arcu ac rutrum elementum. Pellentesque est nisl, iaculis ac porta vel, tincidunt vitae quam.</p>\r\n\r\n<p>Duis imperdiet velit urna, vitae efficitur felis volutpat ac. Duis ut nibh malesuada, commodo massa ut, dignissim nisl. Duis mi eros, tincidunt id dapibus at, sagittis ut sem. Fusce sit amet blandit urna. Donec ut orci rhoncus, tempor nibh eu, viverra nunc. Vivamus leo risus, mattis a elementum non, tristique in mi. In tincidunt imperdiet pharetra. In id efficitur neque. Aliquam porttitor lectus ut arcu porta ultrices. Pellentesque efficitur vitae massa vitae dapibus. Fusce lobortis leo non ipsum pharetra cursus. In laoreet enim tortor, et venenatis diam faucibus ac. Pellentesque eleifend dolor sed volutpat fermentum. Proin iaculis molestie vulputate. Aliquam condimentum nulla quis mauris vestibulum bibendum.</p>\r\n\r\n<p>Maecenas venenatis ex id metus convallis pretium. Donec viverra urna ac magna porttitor condimentum. Cras vel nisi vel neque tincidunt sodales. Aenean lobortis felis eu porttitor laoreet. Pellentesque eget viverra nisl. Vestibulum eleifend, purus non semper semper, velit orci pretium ante, et fringilla sapien arcu id justo. Donec venenatis ligula ut libero mollis interdum. Aliquam volutpat vel dui a pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut vel enim sem. Phasellus nec orci ut justo cursus tempus. Maecenas a nisl rutrum, posuere dui eu, tristique dolor. Mauris luctus nec purus sed gravida. Mauris lacinia eget orci in vehicula. Etiam pretium eu est vel viverra.</p>	2
2	2017-01-27 01:02:55.998746+00	2017-01-27 01:02:55.998769+00	Blog Post Two	blog-post-two	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla lorem augue, ac faucibus mi rhoncus vel. Nullam non lacus mattis, accumsan ipsum nec, efficitur ex. Nunc luctus ante non lectus mattis malesuada eget vitae nibh. Proin pulvinar, neque eu semper sagittis, lorem lorem condimentum risus, id tristique leo lacus eu diam. Fusce dui nisi, suscipit vitae ipsum nec, rhoncus consectetur quam. Proin lobortis ullamcorper accumsan. Praesent non cursus ipsum. In ac mi vitae nisi dapibus lacinia et id lectus. Morbi ac turpis risus. Nulla lorem lectus, ornare sed nibh quis, semper maximus lorem. Vivamus quis risus elementum, fermentum tellus nec, rhoncus ipsum. Ut scelerisque quis ligula in dictum. Phasellus tincidunt porttitor imperdiet. Vivamus metus dui, commodo ac sollicitudin at, eleifend quis nunc.</p>\r\n\r\n<p>Pellentesque vitae tempor tortor, ac consequat sem. Nam ipsum massa, tristique sit amet nulla et, hendrerit viverra velit. Aenean ac augue eu risus vehicula varius rutrum vel ligula. Maecenas mattis posuere orci non lacinia. Cras aliquet scelerisque hendrerit. Suspendisse potenti. Etiam ex mauris, mollis ac ante in, lobortis congue nisi. Integer eget sapien at ipsum porttitor finibus in vitae risus. Nunc rhoncus turpis at sagittis eleifend. Nunc at ligula sapien.</p>\r\n\r\n<p>Suspendisse potenti. Fusce volutpat massa sem, at ornare diam efficitur vitae. Aenean eu mi et lectus sagittis fermentum. Cras vehicula purus magna, in hendrerit nisi consectetur sit amet. Nam purus elit, sodales at mi eget, tincidunt fringilla erat. Nam gravida arcu ac rutrum elementum. Pellentesque est nisl, iaculis ac porta vel, tincidunt vitae quam.</p>\r\n\r\n<p>Duis imperdiet velit urna, vitae efficitur felis volutpat ac. Duis ut nibh malesuada, commodo massa ut, dignissim nisl. Duis mi eros, tincidunt id dapibus at, sagittis ut sem. Fusce sit amet blandit urna. Donec ut orci rhoncus, tempor nibh eu, viverra nunc. Vivamus leo risus, mattis a elementum non, tristique in mi. In tincidunt imperdiet pharetra. In id efficitur neque. Aliquam porttitor lectus ut arcu porta ultrices. Pellentesque efficitur vitae massa vitae dapibus. Fusce lobortis leo non ipsum pharetra cursus. In laoreet enim tortor, et venenatis diam faucibus ac. Pellentesque eleifend dolor sed volutpat fermentum. Proin iaculis molestie vulputate. Aliquam condimentum nulla quis mauris vestibulum bibendum.</p>\r\n\r\n<p>Maecenas venenatis ex id metus convallis pretium. Donec viverra urna ac magna porttitor condimentum. Cras vel nisi vel neque tincidunt sodales. Aenean lobortis felis eu porttitor laoreet. Pellentesque eget viverra nisl. Vestibulum eleifend, purus non semper semper, velit orci pretium ante, et fringilla sapien arcu id justo. Donec venenatis ligula ut libero mollis interdum. Aliquam volutpat vel dui a pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut vel enim sem. Phasellus nec orci ut justo cursus tempus. Maecenas a nisl rutrum, posuere dui eu, tristique dolor. Mauris luctus nec purus sed gravida. Mauris lacinia eget orci in vehicula. Etiam pretium eu est vel viverra.</p>	3
3	2017-01-27 01:03:14.122296+00	2017-01-27 01:03:14.122319+00	Blog Post Three	blog-post-three	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla lorem augue	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla lorem augue, ac faucibus mi rhoncus vel. Nullam non lacus mattis, accumsan ipsum nec, efficitur ex. Nunc luctus ante non lectus mattis malesuada eget vitae nibh. Proin pulvinar, neque eu semper sagittis, lorem lorem condimentum risus, id tristique leo lacus eu diam. Fusce dui nisi, suscipit vitae ipsum nec, rhoncus consectetur quam. Proin lobortis ullamcorper accumsan. Praesent non cursus ipsum. In ac mi vitae nisi dapibus lacinia et id lectus. Morbi ac turpis risus. Nulla lorem lectus, ornare sed nibh quis, semper maximus lorem. Vivamus quis risus elementum, fermentum tellus nec, rhoncus ipsum. Ut scelerisque quis ligula in dictum. Phasellus tincidunt porttitor imperdiet. Vivamus metus dui, commodo ac sollicitudin at, eleifend quis nunc.</p>\r\n\r\n<p>Pellentesque vitae tempor tortor, ac consequat sem. Nam ipsum massa, tristique sit amet nulla et, hendrerit viverra velit. Aenean ac augue eu risus vehicula varius rutrum vel ligula. Maecenas mattis posuere orci non lacinia. Cras aliquet scelerisque hendrerit. Suspendisse potenti. Etiam ex mauris, mollis ac ante in, lobortis congue nisi. Integer eget sapien at ipsum porttitor finibus in vitae risus. Nunc rhoncus turpis at sagittis eleifend. Nunc at ligula sapien.</p>\r\n\r\n<p>Suspendisse potenti. Fusce volutpat massa sem, at ornare diam efficitur vitae. Aenean eu mi et lectus sagittis fermentum. Cras vehicula purus magna, in hendrerit nisi consectetur sit amet. Nam purus elit, sodales at mi eget, tincidunt fringilla erat. Nam gravida arcu ac rutrum elementum. Pellentesque est nisl, iaculis ac porta vel, tincidunt vitae quam.</p>\r\n\r\n<p>Duis imperdiet velit urna, vitae efficitur felis volutpat ac. Duis ut nibh malesuada, commodo massa ut, dignissim nisl. Duis mi eros, tincidunt id dapibus at, sagittis ut sem. Fusce sit amet blandit urna. Donec ut orci rhoncus, tempor nibh eu, viverra nunc. Vivamus leo risus, mattis a elementum non, tristique in mi. In tincidunt imperdiet pharetra. In id efficitur neque. Aliquam porttitor lectus ut arcu porta ultrices. Pellentesque efficitur vitae massa vitae dapibus. Fusce lobortis leo non ipsum pharetra cursus. In laoreet enim tortor, et venenatis diam faucibus ac. Pellentesque eleifend dolor sed volutpat fermentum. Proin iaculis molestie vulputate. Aliquam condimentum nulla quis mauris vestibulum bibendum.</p>\r\n\r\n<p>Maecenas venenatis ex id metus convallis pretium. Donec viverra urna ac magna porttitor condimentum. Cras vel nisi vel neque tincidunt sodales. Aenean lobortis felis eu porttitor laoreet. Pellentesque eget viverra nisl. Vestibulum eleifend, purus non semper semper, velit orci pretium ante, et fringilla sapien arcu id justo. Donec venenatis ligula ut libero mollis interdum. Aliquam volutpat vel dui a pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut vel enim sem. Phasellus nec orci ut justo cursus tempus. Maecenas a nisl rutrum, posuere dui eu, tristique dolor. Mauris luctus nec purus sed gravida. Mauris lacinia eget orci in vehicula. Etiam pretium eu est vel viverra.</p>	1
\.


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('blog_blogpost_id_seq', 3, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-01-27 01:02:30.817782+00	1	blog-post-one	1	[{"added": {}}]	17	1
2	2017-01-27 01:02:55.999472+00	2	blog-post-two	1	[{"added": {}}]	17	1
3	2017-01-27 01:03:14.123031+00	3	blog-post-three	1	[{"added": {}}]	17	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 3, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	user
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	easy_thumbnails	source
8	easy_thumbnails	thumbnail
9	easy_thumbnails	thumbnaildimensions
10	filer	thumbnailoption
11	filer	file
12	filer	folder
13	filer	clipboarditem
14	filer	clipboard
15	filer	folderpermission
16	filer	image
17	blog	blogpost
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('django_content_type_id_seq', 17, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-01-27 00:58:18.044365+00
2	auth	0001_initial	2017-01-27 00:58:19.865233+00
3	admin	0001_initial	2017-01-27 00:58:20.187413+00
4	admin	0002_logentry_remove_auto_add	2017-01-27 00:58:20.290498+00
5	contenttypes	0002_remove_content_type_name	2017-01-27 00:58:20.351365+00
6	auth	0002_alter_permission_name_max_length	2017-01-27 00:58:20.381394+00
7	auth	0003_alter_user_email_max_length	2017-01-27 00:58:20.417928+00
8	auth	0004_alter_user_username_opts	2017-01-27 00:58:20.441342+00
9	auth	0005_alter_user_last_login_null	2017-01-27 00:58:20.51172+00
10	auth	0006_require_contenttypes_0002	2017-01-27 00:58:20.548241+00
11	auth	0007_alter_validators_add_error_messages	2017-01-27 00:58:20.59229+00
12	auth	0008_alter_user_username_max_length	2017-01-27 00:58:20.717816+00
13	filer	0001_initial	2017-01-27 00:58:22.69905+00
14	filer	0002_auto_20150606_2003	2017-01-27 00:58:22.908133+00
15	filer	0003_thumbnailoption	2017-01-27 00:58:23.090859+00
16	filer	0004_auto_20160328_1434	2017-01-27 00:58:23.183405+00
17	filer	0005_auto_20160623_1425	2017-01-27 00:58:23.400792+00
18	filer	0006_auto_20160623_1627	2017-01-27 00:58:23.465837+00
19	filer	0007_auto_20161016_1055	2017-01-27 00:58:23.49398+00
20	blog	0001_initial	2017-01-27 00:58:24.253638+00
21	easy_thumbnails	0001_initial	2017-01-27 00:58:25.493762+00
22	easy_thumbnails	0002_thumbnaildimensions	2017-01-27 00:58:25.701905+00
23	sessions	0001_initial	2017-01-27 00:58:25.975874+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('django_migrations_id_seq', 23, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
a08dac78rh85d5nengmk1d17mzem3a7c	MTk3YjM1ODU2NzQ0ZDFmYzQ0YTY0OTVlZGZlYTA4N2ZjMDA2YmRhMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyZGU0ZTg0MmZhZjcyYmQwYWE1MTExM2IxYzJlZWM4MDJjMjhlN2YiLCJmaWxlcl9sYXN0X2ZvbGRlcl9pZCI6bnVsbCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2017-02-10 01:03:12.023733+00
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
2	f9bde26a1556cd667f742bd34ec7c55e	filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png	2017-01-27 01:02:23.942403+00
1	f9bde26a1556cd667f742bd34ec7c55e	filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png	2017-01-27 01:02:23.941299+00
3	f9bde26a1556cd667f742bd34ec7c55e	filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png	2017-01-27 01:02:24.207942+00
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 3, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
1	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png__32x32_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:24.155973+00	2
2	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png__32x32_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:24.178817+00	1
3	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png__32x32_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:24.283393+00	2
4	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png__32x32_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:24.329843+00	3
5	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png__32x32_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:24.355686+00	1
6	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png__64x64_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:24.47814+00	2
7	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png__32x32_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:24.513695+00	3
8	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png__64x64_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:24.519522+00	1
9	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png__64x64_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:24.557504+00	2
10	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png__64x64_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:24.610844+00	3
11	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png__64x64_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:24.62396+00	1
12	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png__48x48_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:24.741806+00	2
13	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png__48x48_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:24.753105+00	1
14	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png__64x64_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:24.74841+00	3
15	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png__48x48_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:24.864981+00	2
16	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png__48x48_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:24.899038+00	3
17	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png__48x48_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:24.905818+00	1
18	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png__16x16_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:24.964532+00	2
19	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png__16x16_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:25.02022+00	1
20	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png__48x48_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:25.017609+00	3
21	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png__16x16_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:25.037561+00	2
22	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png__16x16_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:25.066627+00	1
23	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png__16x16_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:25.155397+00	3
24	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png__180x180_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:25.228045+00	2
25	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png__16x16_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:25.236365+00	3
26	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png__180x180_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:25.246256+00	1
27	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png__180x180_q85_crop_subsampling-2_upscale.png	2017-01-27 01:02:25.397549+00	3
28	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png__180x180_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:25.471051+00	2
29	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png__180x180_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:25.48917+00	1
30	f9bde26a1556cd667f742bd34ec7c55e	filer_public_thumbnails/filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png__180x180_q85_crop_subsampling-2_upscale@2x.png	2017-01-27 01:02:25.811422+00	3
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 30, true);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: filer_clipboard; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY filer_clipboard (id, user_id) FROM stdin;
1	1
\.


--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('filer_clipboard_id_seq', 1, true);


--
-- Data for Name: filer_clipboarditem; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY filer_clipboarditem (id, clipboard_id, file_id) FROM stdin;
\.


--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('filer_clipboarditem_id_seq', 1, false);


--
-- Data for Name: filer_file; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY filer_file (id, file, _file_size, sha1, has_all_mandatory_data, original_filename, name, description, uploaded_at, modified_at, is_public, folder_id, owner_id, polymorphic_ctype_id) FROM stdin;
1	filer_public/f5/2b/f52b355a-1642-45c1-a578-2c8e3f2b8496/news2.png	699539	54b1bbe9bbe64c949d1061718719a691ef9d8c5a	f	news2.png		\N	2017-01-27 01:02:23.697766+00	2017-01-27 01:02:23.697838+00	t	\N	1	16
2	filer_public/0b/34/0b349abb-3327-48c5-880b-77c8a432ec50/news0.png	605831	96b9e810b116d5658ba549693e6e4746d95129e4	f	news0.png		\N	2017-01-27 01:02:23.702742+00	2017-01-27 01:02:23.70277+00	t	\N	1	16
3	filer_public/43/a5/43a5b05d-bd2c-4aaf-9592-edecd607bac4/news1.png	672239	470adbf2c9a2a69e83805a5afe1004475bc85553	f	news1.png		\N	2017-01-27 01:02:23.963115+00	2017-01-27 01:02:23.963131+00	t	\N	1	16
\.


--
-- Name: filer_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('filer_file_id_seq', 3, true);


--
-- Data for Name: filer_folder; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY filer_folder (id, name, uploaded_at, created_at, modified_at, lft, rght, tree_id, level, owner_id, parent_id) FROM stdin;
\.


--
-- Name: filer_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('filer_folder_id_seq', 1, false);


--
-- Data for Name: filer_folderpermission; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY filer_folderpermission (id, type, everybody, can_edit, can_read, can_add_children, folder_id, group_id, user_id) FROM stdin;
\.


--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('filer_folderpermission_id_seq', 1, false);


--
-- Data for Name: filer_image; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY filer_image (file_ptr_id, _height, _width, date_taken, default_alt_text, default_caption, author, must_always_publish_author_credit, must_always_publish_copyright, subject_location) FROM stdin;
1	512	1024	2017-01-27 01:02:23.685054+00	\N	\N	\N	f	f	
2	546	1024	2017-01-27 01:02:23.693901+00	\N	\N	\N	f	f	
3	429	1024	2017-01-27 01:02:23.959798+00	\N	\N	\N	f	f	
\.


--
-- Data for Name: filer_thumbnailoption; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY filer_thumbnailoption (id, name, width, height, crop, upscale) FROM stdin;
\.


--
-- Name: filer_thumbnailoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('filer_thumbnailoption_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_slug_key; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_slug_key UNIQUE (slug);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: filer_clipboard_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT filer_clipboard_pkey PRIMARY KEY (id);


--
-- Name: filer_clipboarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_pkey PRIMARY KEY (id);


--
-- Name: filer_file_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_pkey PRIMARY KEY (id);


--
-- Name: filer_folder_parent_id_bc773258_uniq; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_parent_id_bc773258_uniq UNIQUE (parent_id, name);


--
-- Name: filer_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_pkey PRIMARY KEY (id);


--
-- Name: filer_folderpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_pkey PRIMARY KEY (id);


--
-- Name: filer_image_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT filer_image_pkey PRIMARY KEY (file_ptr_id);


--
-- Name: filer_thumbnailoption_pkey; Type: CONSTRAINT; Schema: public; Owner: docker; Tablespace: 
--

ALTER TABLE ONLY filer_thumbnailoption
    ADD CONSTRAINT filer_thumbnailoption_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blogpost_9ae73c65; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX blog_blogpost_9ae73c65 ON blog_blogpost USING btree (modified);


--
-- Name: blog_blogpost_c16de916; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX blog_blogpost_c16de916 ON blog_blogpost USING btree (header_image_id);


--
-- Name: blog_blogpost_d5d3db17; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX blog_blogpost_d5d3db17 ON blog_blogpost USING btree (title);


--
-- Name: blog_blogpost_e2fa5388; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX blog_blogpost_e2fa5388 ON blog_blogpost USING btree (created);


--
-- Name: blog_blogpost_slug_9e84ade1_like; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX blog_blogpost_slug_9e84ade1_like ON blog_blogpost USING btree (slug varchar_pattern_ops);


--
-- Name: blog_blogpost_title_a4261c9a_like; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX blog_blogpost_title_a4261c9a_like ON blog_blogpost USING btree (title varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b068931c ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b454e115 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: filer_clipboard_e8701ad4; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_clipboard_e8701ad4 ON filer_clipboard USING btree (user_id);


--
-- Name: filer_clipboarditem_2655b062; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_clipboarditem_2655b062 ON filer_clipboarditem USING btree (clipboard_id);


--
-- Name: filer_clipboarditem_814552b9; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_clipboarditem_814552b9 ON filer_clipboarditem USING btree (file_id);


--
-- Name: filer_file_5e7b1936; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_file_5e7b1936 ON filer_file USING btree (owner_id);


--
-- Name: filer_file_a8a44dbb; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_file_a8a44dbb ON filer_file USING btree (folder_id);


--
-- Name: filer_file_d3e32c49; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_file_d3e32c49 ON filer_file USING btree (polymorphic_ctype_id);


--
-- Name: filer_folder_3cfbd988; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_folder_3cfbd988 ON filer_folder USING btree (rght);


--
-- Name: filer_folder_5e7b1936; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_folder_5e7b1936 ON filer_folder USING btree (owner_id);


--
-- Name: filer_folder_656442a0; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_folder_656442a0 ON filer_folder USING btree (tree_id);


--
-- Name: filer_folder_6be37982; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_folder_6be37982 ON filer_folder USING btree (parent_id);


--
-- Name: filer_folder_c9e9a848; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_folder_c9e9a848 ON filer_folder USING btree (level);


--
-- Name: filer_folder_caf7cc51; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_folder_caf7cc51 ON filer_folder USING btree (lft);


--
-- Name: filer_folderpermission_0e939a4f; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_folderpermission_0e939a4f ON filer_folderpermission USING btree (group_id);


--
-- Name: filer_folderpermission_a8a44dbb; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_folderpermission_a8a44dbb ON filer_folderpermission USING btree (folder_id);


--
-- Name: filer_folderpermission_e8701ad4; Type: INDEX; Schema: public; Owner: docker; Tablespace: 
--

CREATE INDEX filer_folderpermission_e8701ad4 ON filer_folderpermission USING btree (user_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpo_header_image_id_f289ac01_fk_filer_image_file_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpo_header_image_id_f289ac01_fk_filer_image_file_ptr_id FOREIGN KEY (header_image_id) REFERENCES filer_image(file_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboard_user_id_b52ff0bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT filer_clipboard_user_id_b52ff0bc_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboarditem_clipboard_id_7a76518b_fk_filer_clipboard_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_clipboard_id_7a76518b_fk_filer_clipboard_id FOREIGN KEY (clipboard_id) REFERENCES filer_clipboard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboarditem_file_id_06196f80_fk_filer_file_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_file_id_06196f80_fk_filer_file_id FOREIGN KEY (file_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_f_polymorphic_ctype_id_f44903c1_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_f_polymorphic_ctype_id_f44903c1_fk_django_content_type_id FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file_folder_id_af803bbb_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_folder_id_af803bbb_fk_filer_folder_id FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file_owner_id_b9e32671_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_owner_id_b9e32671_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folder_owner_id_be530fb4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_owner_id_be530fb4_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folder_parent_id_308aecda_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_parent_id_308aecda_fk_filer_folder_id FOREIGN KEY (parent_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission_folder_id_5d02f1da_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_folder_id_5d02f1da_fk_filer_folder_id FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission_group_id_8901bafa_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_group_id_8901bafa_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission_user_id_7673d4b6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_user_id_7673d4b6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_image_file_ptr_id_3e21d4f0_fk_filer_file_id; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT filer_image_file_ptr_id_3e21d4f0_fk_filer_file_id FOREIGN KEY (file_ptr_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

