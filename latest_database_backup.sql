--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_blogpost; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE blog_blogpost OWNER TO postgres;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_blogpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_id_seq OWNER TO postgres;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_blogpost_id_seq OWNED BY blog_blogpost.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE easy_thumbnails_source OWNER TO postgres;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_source_id_seq OWNER TO postgres;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE easy_thumbnails_thumbnail OWNER TO postgres;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_thumbnail_id_seq OWNER TO postgres;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE easy_thumbnails_thumbnaildimensions OWNER TO postgres;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_thumbnaildimensions_id_seq OWNER TO postgres;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: filer_clipboard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE filer_clipboard (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE filer_clipboard OWNER TO postgres;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_clipboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_clipboard_id_seq OWNER TO postgres;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_clipboard_id_seq OWNED BY filer_clipboard.id;


--
-- Name: filer_clipboarditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE filer_clipboarditem (
    id integer NOT NULL,
    clipboard_id integer NOT NULL,
    file_id integer NOT NULL
);


ALTER TABLE filer_clipboarditem OWNER TO postgres;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_clipboarditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_clipboarditem_id_seq OWNER TO postgres;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_clipboarditem_id_seq OWNED BY filer_clipboarditem.id;


--
-- Name: filer_file; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE filer_file OWNER TO postgres;

--
-- Name: filer_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_file_id_seq OWNER TO postgres;

--
-- Name: filer_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_file_id_seq OWNED BY filer_file.id;


--
-- Name: filer_folder; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE filer_folder OWNER TO postgres;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_folder_id_seq OWNER TO postgres;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_folder_id_seq OWNED BY filer_folder.id;


--
-- Name: filer_folderpermission; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE filer_folderpermission OWNER TO postgres;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_folderpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_folderpermission_id_seq OWNER TO postgres;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_folderpermission_id_seq OWNED BY filer_folderpermission.id;


--
-- Name: filer_image; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE filer_image OWNER TO postgres;

--
-- Name: filer_thumbnailoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE filer_thumbnailoption (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    crop boolean NOT NULL,
    upscale boolean NOT NULL
);


ALTER TABLE filer_thumbnailoption OWNER TO postgres;

--
-- Name: filer_thumbnailoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_thumbnailoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_thumbnailoption_id_seq OWNER TO postgres;

--
-- Name: filer_thumbnailoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_thumbnailoption_id_seq OWNED BY filer_thumbnailoption.id;


--
-- Name: memes_meme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE memes_meme (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE memes_meme OWNER TO postgres;

--
-- Name: memes_meme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE memes_meme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE memes_meme_id_seq OWNER TO postgres;

--
-- Name: memes_meme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE memes_meme_id_seq OWNED BY memes_meme.id;


--
-- Name: memes_memefile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE memes_memefile (
    id integer NOT NULL,
    filename character varying(255) NOT NULL,
    meme_id integer NOT NULL
);


ALTER TABLE memes_memefile OWNER TO postgres;

--
-- Name: memes_memefile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE memes_memefile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE memes_memefile_id_seq OWNER TO postgres;

--
-- Name: memes_memefile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE memes_memefile_id_seq OWNED BY memes_memefile.id;


--
-- Name: reddit_redditpost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reddit_redditpost (
    id integer NOT NULL,
    submission_id character varying(100) NOT NULL,
    likely_meme_id integer NOT NULL,
    image_similarity numeric(8,4) NOT NULL,
    image_url character varying(200) NOT NULL,
    title character varying(400) NOT NULL,
    subreddit character varying(100) NOT NULL,
    subreddit_id character varying(100) NOT NULL,
    permalink character varying(200) NOT NULL,
    submission_created timestamp with time zone NOT NULL,
    author character varying(200) NOT NULL,
    closest_image_id integer NOT NULL,
    over_18 boolean NOT NULL
);


ALTER TABLE reddit_redditpost OWNER TO postgres;

--
-- Name: reddit_redditpost_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reddit_redditpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reddit_redditpost_id_seq OWNER TO postgres;

--
-- Name: reddit_redditpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reddit_redditpost_id_seq OWNED BY reddit_redditpost.id;


--
-- Name: reddit_redditpostsnapshot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reddit_redditpostsnapshot (
    id integer NOT NULL,
    date_crawled timestamp with time zone NOT NULL,
    score integer NOT NULL,
    gilded boolean NOT NULL,
    reddit_post_id integer NOT NULL,
    num_comments integer NOT NULL,
    rank integer NOT NULL
);


ALTER TABLE reddit_redditpostsnapshot OWNER TO postgres;

--
-- Name: reddit_redditpostsnapshot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reddit_redditpostsnapshot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reddit_redditpostsnapshot_id_seq OWNER TO postgres;

--
-- Name: reddit_redditpostsnapshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reddit_redditpostsnapshot_id_seq OWNED BY reddit_redditpostsnapshot.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_blogpost id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpost ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: easy_thumbnails_source id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: easy_thumbnails_thumbnail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: easy_thumbnails_thumbnaildimensions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: filer_clipboard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboard ALTER COLUMN id SET DEFAULT nextval('filer_clipboard_id_seq'::regclass);


--
-- Name: filer_clipboarditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboarditem ALTER COLUMN id SET DEFAULT nextval('filer_clipboarditem_id_seq'::regclass);


--
-- Name: filer_file id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_file ALTER COLUMN id SET DEFAULT nextval('filer_file_id_seq'::regclass);


--
-- Name: filer_folder id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folder ALTER COLUMN id SET DEFAULT nextval('filer_folder_id_seq'::regclass);


--
-- Name: filer_folderpermission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folderpermission ALTER COLUMN id SET DEFAULT nextval('filer_folderpermission_id_seq'::regclass);


--
-- Name: filer_thumbnailoption id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_thumbnailoption ALTER COLUMN id SET DEFAULT nextval('filer_thumbnailoption_id_seq'::regclass);


--
-- Name: memes_meme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY memes_meme ALTER COLUMN id SET DEFAULT nextval('memes_meme_id_seq'::regclass);


--
-- Name: memes_memefile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY memes_memefile ALTER COLUMN id SET DEFAULT nextval('memes_memefile_id_seq'::regclass);


--
-- Name: reddit_redditpost id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reddit_redditpost ALTER COLUMN id SET DEFAULT nextval('reddit_redditpost_id_seq'::regclass);


--
-- Name: reddit_redditpostsnapshot id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reddit_redditpostsnapshot ALTER COLUMN id SET DEFAULT nextval('reddit_redditpostsnapshot_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
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
28	Can add clipboard	10	add_clipboard
29	Can change clipboard	10	change_clipboard
30	Can delete clipboard	10	delete_clipboard
31	Can add clipboard item	11	add_clipboarditem
32	Can change clipboard item	11	change_clipboarditem
33	Can delete clipboard item	11	delete_clipboarditem
34	Can add file	12	add_file
35	Can change file	12	change_file
36	Can delete file	12	delete_file
37	Can add Folder	13	add_folder
38	Can change Folder	13	change_folder
39	Can delete Folder	13	delete_folder
40	Can use directory listing	13	can_use_directory_listing
41	Can add folder permission	14	add_folderpermission
42	Can change folder permission	14	change_folderpermission
43	Can delete folder permission	14	delete_folderpermission
44	Can add image	15	add_image
45	Can change image	15	change_image
46	Can delete image	15	delete_image
47	Can add thumbnail option	16	add_thumbnailoption
48	Can change thumbnail option	16	change_thumbnailoption
49	Can delete thumbnail option	16	delete_thumbnailoption
50	Can add Blog Post	17	add_blogpost
51	Can change Blog Post	17	change_blogpost
52	Can delete Blog Post	17	delete_blogpost
53	Can add Meme Filename	18	add_memefile
54	Can change Meme Filename	18	change_memefile
55	Can delete Meme Filename	18	delete_memefile
56	Can add Meme	19	add_meme
57	Can change Meme	19	change_meme
58	Can delete Meme	19	delete_meme
59	Can add reddit post snapshot	20	add_redditpostsnapshot
60	Can change reddit post snapshot	20	change_redditpostsnapshot
61	Can delete reddit post snapshot	20	delete_redditpostsnapshot
62	Can add Reddit Post	21	add_redditpost
63	Can change Reddit Post	21	change_redditpost
64	Can delete Reddit Post	21	delete_redditpost
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 64, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_blogpost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_blogpost (id, created, modified, title, slug, blurb, content, header_image_id) FROM stdin;
\.


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_blogpost_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	easy_thumbnails	source
8	easy_thumbnails	thumbnail
9	easy_thumbnails	thumbnaildimensions
10	filer	clipboard
11	filer	clipboarditem
12	filer	file
13	filer	folder
14	filer	folderpermission
15	filer	image
16	filer	thumbnailoption
17	blog	blogpost
18	memes	memefile
19	memes	meme
20	reddit	redditpostsnapshot
21	reddit	redditpost
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 21, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-02-26 10:42:20.808993+00
2	auth	0001_initial	2017-02-26 10:42:22.008803+00
3	admin	0001_initial	2017-02-26 10:42:22.268977+00
4	admin	0002_logentry_remove_auto_add	2017-02-26 10:42:22.308672+00
5	contenttypes	0002_remove_content_type_name	2017-02-26 10:42:22.368773+00
6	auth	0002_alter_permission_name_max_length	2017-02-26 10:42:22.398694+00
7	auth	0003_alter_user_email_max_length	2017-02-26 10:42:22.428772+00
8	auth	0004_alter_user_username_opts	2017-02-26 10:42:22.450292+00
9	auth	0005_alter_user_last_login_null	2017-02-26 10:42:22.519954+00
10	auth	0006_require_contenttypes_0002	2017-02-26 10:42:22.530117+00
11	auth	0007_alter_validators_add_error_messages	2017-02-26 10:42:22.558571+00
12	auth	0008_alter_user_username_max_length	2017-02-26 10:42:22.660043+00
13	filer	0001_initial	2017-02-26 10:42:24.41645+00
14	filer	0002_auto_20150606_2003	2017-02-26 10:42:24.510105+00
15	filer	0003_thumbnailoption	2017-02-26 10:42:24.596258+00
16	filer	0004_auto_20160328_1434	2017-02-26 10:42:24.645949+00
17	filer	0005_auto_20160623_1425	2017-02-26 10:42:24.803706+00
18	filer	0006_auto_20160623_1627	2017-02-26 10:42:24.856357+00
19	filer	0007_auto_20161016_1055	2017-02-26 10:42:24.884717+00
20	blog	0001_initial	2017-02-26 10:42:25.469416+00
21	easy_thumbnails	0001_initial	2017-02-26 10:42:26.25164+00
22	easy_thumbnails	0002_thumbnaildimensions	2017-02-26 10:42:26.392061+00
23	memes	0001_initial	2017-02-26 10:42:26.482748+00
24	memes	0002_meme_redditpost	2017-02-26 10:42:26.703614+00
25	memes	0003_auto_20170213_2255	2017-02-26 10:42:26.733419+00
26	memes	0004_auto_20170213_2257	2017-02-26 10:42:26.762346+00
27	memes	0005_auto_20170213_2258	2017-02-26 10:42:26.803331+00
28	memes	0006_auto_20170213_2259	2017-02-26 10:42:26.829867+00
29	memes	0007_auto_20170213_2301	2017-02-26 10:42:26.847477+00
30	memes	0008_delete_job	2017-02-26 10:42:26.873855+00
31	memes	0009_delete_redditpost	2017-02-26 10:42:26.900475+00
32	memes	0010_memefile	2017-02-26 10:42:56.439956+00
33	memes	0011_auto_20170225_0440	2017-02-26 10:42:56.466503+00
34	memes	0012_auto_20170225_2356	2017-02-26 10:42:56.636398+00
35	reddit	0001_initial	2017-02-26 10:42:56.74733+00
36	reddit	0002_auto_20170225_0440	2017-02-26 10:42:58.376918+00
37	reddit	0003_auto_20170225_0508	2017-02-26 10:42:59.219687+00
38	sessions	0001_initial	2017-02-26 10:42:59.487934+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 38, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: filer_clipboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_clipboard (id, user_id) FROM stdin;
\.


--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_clipboard_id_seq', 1, false);


--
-- Data for Name: filer_clipboarditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_clipboarditem (id, clipboard_id, file_id) FROM stdin;
\.


--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_clipboarditem_id_seq', 1, false);


--
-- Data for Name: filer_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_file (id, file, _file_size, sha1, has_all_mandatory_data, original_filename, name, description, uploaded_at, modified_at, is_public, folder_id, owner_id, polymorphic_ctype_id) FROM stdin;
\.


--
-- Name: filer_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_file_id_seq', 1, false);


--
-- Data for Name: filer_folder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_folder (id, name, uploaded_at, created_at, modified_at, lft, rght, tree_id, level, owner_id, parent_id) FROM stdin;
\.


--
-- Name: filer_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_folder_id_seq', 1, false);


--
-- Data for Name: filer_folderpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_folderpermission (id, type, everybody, can_edit, can_read, can_add_children, folder_id, group_id, user_id) FROM stdin;
\.


--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_folderpermission_id_seq', 1, false);


--
-- Data for Name: filer_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_image (file_ptr_id, _height, _width, date_taken, default_alt_text, default_caption, author, must_always_publish_author_credit, must_always_publish_copyright, subject_location) FROM stdin;
\.


--
-- Data for Name: filer_thumbnailoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_thumbnailoption (id, name, width, height, crop, upscale) FROM stdin;
\.


--
-- Name: filer_thumbnailoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_thumbnailoption_id_seq', 1, false);


--
-- Data for Name: memes_meme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY memes_meme (id, name) FROM stdin;
1	Futurama Fry
2	Annoyed Picard
3	Socially Awkward Penguin
4	Successful Black Man
5	Actual Advice Mallard
6	Good Guy Greg
7	First Day on the Internet Kid
8	Most Interesting Man in the World
9	First World Problem
10	Philosoraptor
11	10 Guy
12	Bad Luck Brian
13	Overly Attached Girlfriend
14	Conspiracy Keanu
15	One Does Not Simply
16	Annoying Facebook Girl
17	Insanity Wolf
18	Yao Ming
19	College Freshman
20	Internet Husband
21	Foul Bachelor Frog
22	Joseph Ducreux
23	Brace Yourselves
24	Ancient Aliens
25	Confessions Bear
26	Forever Alone
27	Courage Wolf
28	Sophisticated Cat
29	Lazy College Senior
30	Business Cat
31	Sudden Clarity Clarence
32	Hipster Barista
33	Socially Awesome Awkward Penguin
34	All the Things
35	Pedo Bear
36	Scumbag Steve
37	Grumpy Cat
38	Drunk Baby
39	Bad Joke Eel
40	Schrute Facts
41	Super Cool Ski Instructor
42	Scumbag Teacher
43	Sheltering Suburban Mom
44	Y U No
45	Butthurt Dweller
46	Bear Grylls
47	Paranoid Parrot
48	Almost Politically Correct Redneck
49	Scumbag Steph
50	Hipster Kitten
51	High Expectations Asian Father
52	Good Girl Gina
53	Annoying Childhood Friend
54	Baby Godfather
55	Captain Hindsight
56	Too Damn High
57	Skeptical 3rd World Kid
58	Willy Wonka
59	Ermahgerd
60	Push It Somewhere Else Patrick
61	Spider-Man Masterbating
62	Matrix Morpheus
63	Fuck Me, Right?
64	You Can't Explain That
65	Facepalm
66	Lame Pun Racoon
67	Grinds My Gears
68	Yo Dawg
69	Slowpoke
70	College Liberal
71	Am I The Only One Around Here?
72	Overly Manly Man
73	Stoner Dog
74	Downvoting Roman
75	Bold Move Cotton
76	Upvoting Obama
77	Pickup Line Panda
78	Good Guy Boss
79	It Was a Good Day
80	Everyone Loses Their Mind
81	Confession Kid
82	Evil Plotting Racoon
83	Pepperidge Farm Remembers
84	Neil deGrasse Tyson
85	Unpopular Opinion Puffin
86	Socially Awesome Penguin
87	I Guarantee It
88	Maury Lie Detector
89	So I Got That Goin' For Me, Which is Nice
90	I'll Have You Know
91	Rafiki The Wise
92	And It's Gone
93	Weird Stuff I Do Potoo
94	Success Kid
95	Third World Success
96	Awkward Moment Seal
97	Scumbag Parents
98	Sexually Oblivious Female
99	Scumbag Brain
100	Grandma Finds the Internet
101	Blackjack and Hookers
102	Small Fact Frog
103	Do You Want Ants?
104	Y'all Got Anymore of...
105	Minor Mistake Marvin
106	None of My Business
107	Afraid to Ask Andy
108	Satisfied Seal
109	American Pride Eagle
110	Roll Safe
111	That Would Be Great
112	Advice God
113	Cash Me Outside
\.


--
-- Name: memes_meme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('memes_meme_id_seq', 113, true);


--
-- Data for Name: memes_memefile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY memes_memefile (id, filename, meme_id) FROM stdin;
1	futurama-fry.png	1
2	annoyed-picard.jpg	2
3	socially-awkward-penguin.jpg	3
4	successful-black-man.jpg	4
5	actual-advice-mallard.jpg	5
6	good-guy-greg.jpg	6
7	first-day-on-the-internet-kid.jpg	7
8	most-interesting-man-in-the-world.jpg	8
9	first-world-problems.jpg	9
10	philosoraptor.jpg	10
11	10-guy.jpg	11
12	bad-luck-brian.jpg	12
13	overly-attached-girlfriend.jpg	13
14	conspiracy-keanu.jpg	14
15	one-does-not-simply.jpg	15
16	annoying-facebook-girl.jpg	16
17	insanity-wolf.jpg	17
18	yao-ming.png	18
19	college-freshman.jpg	19
20	internet-husband.jpg	20
21	foul-bachelor-frog.jpg	21
22	joseph-ducreux.jpg	22
23	brace-yourselves.jpg	23
24	ancient-aliens.jpg	24
25	confessions-bear.jpg	25
26	forever-alone.jpg	26
27	courage-wolf.jpg	27
28	sophisticated-cat.jpg	28
29	lazy-college-senior.jpg	29
30	business-cat.jpg	30
31	sudden-clairity-clarence.jpg	31
32	hipster-barista.jpg	32
33	socially-awesome-awkward-penguin.jpg	33
34	all-the-things.png	34
35	pedobear.png	35
36	scumbag-steve.jpg	36
37	grumpy-cat.jpg	37
38	drunk-baby.jpg	38
39	bad-joke-eel.jpg	39
40	schrute-facts.jpg	40
41	ski-instructor.jpg	41
42	scumbag-teacher.jpg	42
43	sheltering-suburban-mom.jpg	43
44	y-u-no.png	44
45	butthurt-dweller.jpg	45
46	bear-grylls.jpg	46
47	paranoid-parrot.jpg	47
48	politically-correct-redneck.jpg	48
49	scumbag-stacy.jpg	49
50	hipster-kitty.jpg	50
51	high-expectations-asian-father.jpg	51
52	good-girl-gina.jpg	52
53	annoying-childhood-friend.jpg	53
54	baby-godfather.jpg	54
55	captain-hindsight.jpg	55
56	too-damn-high.jpg	56
57	skeptical-3rd-world-kid.jpg	57
58	willy-wonka.jpg	58
59	ermahgerd.jpg	59
60	put-it-somewhere.jpg	60
61	spiderman.jpg	61
62	matrix-morpheus.jpg	62
63	fuck-me-right.jpg	63
64	you-cant-explain-that.jpg	64
65	picard-facepalm.jpg	65
66	lame-pun-racoon.jpg	66
67	grinds-my-gears.jpg	67
68	yo-dawg.jpg	68
69	slowpoke.jpg	69
70	college-liberal.jpg	70
71	am-i-the-only-one.jpg	71
72	overly-manly-man.jpg	72
73	stoner-dog.jpg	73
74	downvoting-roman.jpg	74
75	bold-move-cotton.jpg	75
76	thumbs-up-obama.jpg	76
77	pickup-line-panda.jpg	77
78	good-guy-boss.jpg	78
79	it-was-a-good-day.jpg	79
80	everyone-loses-their-mind.jpg	80
81	confession-kid.jpg	81
82	evil-plotting-racoon.jpg	82
83	pepperidge-farm-remembers.jpg	83
84	badass.png	84
85	unpopular-opinion-puffin.jpg	85
86	socially-awesome-penguin.jpg	86
87	i-guarantee-it.jpg	87
88	maury-lie-detector.jpg	88
89	caddy-shack.jpg	89
90	ill-have-you-know.jpg	90
91	rafiki-the-wise.jpg	91
92	and-its-gone.jpg	92
93	peculiar-potoo.jpg	93
94	success-kid.jpg	94
95	third-world-success.jpg	95
96	awkward-moment-seal.jpg	96
97	scumbag-parents.jpg	97
98	sexually-oblivious-female.jpg	98
99	scumbag-brain.jpg	99
100	grandma-finds-the-internet.jpg	100
101	blackjack-and-hookers.jpg	101
102	small-fact-frog.jpg	102
103	do-you-want-ants.jpg	103
104	dave-chapelle-crackhead.jpg	104
105	minor-mistake-marvin.jpg	105
106	none-of-my-business.jpg	106
107	afraid-to-ask-andy.jpg	107
108	satisfied-seal.jpg	108
109	american-pride-eagle.jpg	109
110	roll-safe.jpg	110
111	roll-safe-v1.JPG	110
112	roll-safe-v2.jpg	110
113	that-would-be-great.jpg	111
114	advice-god.jpg	112
115	cash-me-outside.jpg	113
\.


--
-- Name: memes_memefile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('memes_memefile_id_seq', 115, true);


--
-- Data for Name: reddit_redditpost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reddit_redditpost (id, submission_id, likely_meme_id, image_similarity, image_url, title, subreddit, subreddit_id, permalink, submission_created, author, closest_image_id, over_18) FROM stdin;
1	5w7kch	101	0.8595	http://imgur.com/91s11bu	Trump right now, probably	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w7kch/trump_right_now_probably/	2017-02-26 01:06:24+00	drewxdeficit	101	f
2	5w4n9q	36	0.7435	https://i.redd.it/nejm7bjzs0iy.jpg	He "cared" so much	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w4n9q/he_cared_so_much/	2017-02-25 15:48:46+00	PlantationMint	36	f
3	5w865v	25	0.3682	https://i.redd.it/dskvt6d5e4iy.png	The most interesting bear in the world...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w865v/the_most_interesting_bear_in_the_world/	2017-02-26 03:21:32+00	spacecadet2023	25	f
4	5w797x	110	0.5592	https://i.redd.it/dv3ulrzse3iy.jpg	When my bf unexpectedly slaps my butt...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w797x/when_my_bf_unexpectedly_slaps_my_butt/	2017-02-26 00:02:59+00	dancegirl10	112	f
5	5w3zc7	1	0.7326	http://imgur.com/30NMcII	When Fox News becomes the voice of reason	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w3zc7/when_fox_news_becomes_the_voice_of_reason/	2017-02-25 13:07:36+00	emotionalyoungperson	1	f
6	5w4s6w	90	0.5405	https://i.redd.it/in3ptz6z11iy.jpg	She said she'd never seen me cry in all her 25 years. I was relieved to be more amused than embarrassed about it. But also bemused – WTF?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w4s6w/she_said_shed_never_seen_me_cry_in_all_her_25/	2017-02-25 16:15:54+00	SailorVanIndium	90	f
7	5w4614	32	0.7661	https://i.reddituploads.com/21e9d15911f34058bf402b09171c4aa2?fit=max&h=1536&w=1536&s=39f09719c4fc45bc8d770b40a392252f	Reddit community in a nut shell.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w4614/reddit_community_in_a_nut_shell/	2017-02-25 13:59:11+00	McPiggers	32	f
8	5w6ok3	99	0.9232	https://imgur.com/LuPDi	Having social anxiety really sucks	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w6ok3/having_social_anxiety_really_sucks/	2017-02-25 22:11:20+00	Revoluci0n	99	f
9	5w4z18	3	0.8743	https://imgur.com/lXpIp	This is what happens when I try to be social	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w4z18/this_is_what_happens_when_i_try_to_be_social/	2017-02-25 16:53:17+00	Revoluci0n	3	f
10	5w8geh	51	0.5270	http://i.imgur.com/2SmbP5T.jpg	I herd Trump isn't going to correspondents dinner	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w8geh/i_herd_trump_isnt_going_to_correspondents_dinner/	2017-02-26 04:30:31+00	SpiderlordToeVests	51	f
11	5w7wmx	108	0.9051	https://i.redd.it/8covqpw934iy.jpg	One of the only good aspects of laundry-day	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w7wmx/one_of_the_only_good_aspects_of_laundryday/	2017-02-26 02:20:27+00	Ungodlydemon	108	f
12	5w51pa	25	0.6210	http://imgur.com/xngOJ4e	Not all grandmothers bake cookies and play bingo.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w51pa/not_all_grandmothers_bake_cookies_and_play_bingo/	2017-02-25 17:07:11+00	doublepulse	25	f
13	5w8qan	33	0.6460	https://i.redd.it/yhdl2rl835iy.jpg	I'm now sober, but laying awake, still petrified with social anxiety.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w8qan/im_now_sober_but_laying_awake_still_petrified/	2017-02-26 05:41:43+00	3LeggedJupiter	33	f
14	5w5h4v	14	0.5454	https://i.imgur.com/zfObbEN.png	As a 34-year-old with two kids, my reaction when my wife suggests we have sex.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w5h4v/as_a_34yearold_with_two_kids_my_reaction_when_my/	2017-02-25 18:28:22+00	amyfair	14	f
15	5w27cw	36	0.7390	http://i.imgur.com/cbevapg.png	So what does this make our "democracy"?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w27cw/so_what_does_this_make_our_democracy/	2017-02-25 03:57:28+00	Never-On-Reddit	36	f
16	5w62d2	49	0.5904	http://imgur.com/M5p8Qxa	Such a good daughter!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w62d2/such_a_good_daughter/	2017-02-25 20:17:01+00	TlGHTSHIRT	49	f
17	5w91pb	110	0.8104	http://imgur.com/20xnC8Y	4d Chess	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w91pb/4d_chess/	2017-02-26 07:17:12+00	OddlyShapedGinger	112	f
18	5w26ni	110	0.5372	https://i.reddituploads.com/a4edee5e33ac4851bd031ef1d69b91b1?fit=max&h=1536&w=1536&s=6d4e83e0870d9880cf92c2c26b6b6872	Ending a 6 year relationship	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w26ni/ending_a_6_year_relationship/	2017-02-25 03:52:28+00	Tigershark2112	112	f
19	5w82l4	8	0.8694	https://i.redd.it/18mctgc2a4iy.jpg	Two weeks in a row, folks. Two.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w82l4/two_weeks_in_a_row_folks_two/	2017-02-26 02:58:55+00	mallorymae	8	f
20	5w95uc	81	0.8500	http://imgur.com/0YfmAqp	I'm actually still not sure how it works.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w95uc/im_actually_still_not_sure_how_it_works/	2017-02-26 07:56:05+00	ouijahead	81	f
21	5w3874	110	0.8854	https://i.reddituploads.com/f08d50d9bdf14801ac248180f7baa0c9?fit=max&h=1536&w=1536&s=5ae2761da80c30f3c7dd59c750c11605	It's a constant struggle.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w3874/its_a_constant_struggle/	2017-02-25 08:47:33+00	12dudes	112	f
22	5w2h24	1	0.6233	http://imgur.com/hPKoD8p	As a man approaching my 30s, I honestly have no idea.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w2h24/as_a_man_approaching_my_30s_i_honestly_have_no/	2017-02-25 05:02:24+00	ReachTheSky	1	f
23	5w4ydn	1	0.7024	http://www.livememe.com/ncq0f35	With all of this unseasonable February weather we have been getting....	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w4ydn/with_all_of_this_unseasonable_february_weather_we/	2017-02-25 16:49:40+00	katiedid05	1	f
24	5w5u6d	110	0.8314	http://imgur.com/dVFb01D	When I ask my GF to send me nudes	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w5u6d/when_i_ask_my_gf_to_send_me_nudes/	2017-02-25 19:35:38+00	nessus_robe	112	f
25	5w1qwc	88	0.7445	https://i.reddituploads.com/835e7761920843ab9111efcf59091153?fit=max&h=1536&w=1536&s=f98a844c6f2b5dcdefc30abe3fb14af5	Trump: "And I love the First Amendment; nobody loves it better than me. Nobody."	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w1qwc/trump_and_i_love_the_first_amendment_nobody_loves/	2017-02-25 02:14:44+00	imperium44	88	f
26	5w8d3a	52	0.3351	http://imgur.com/rAHR9Xt	Like clockwork.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w8d3a/like_clockwork/	2017-02-26 04:07:31+00	WillTwirk4Beer	52	f
27	5w1a82	110	0.5166	https://i.redd.it/tj3s34h4gwhy.jpg	An angry question for the news agencies who were NOT blocked from attending White House briefing	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w1a82/an_angry_question_for_the_news_agencies_who_were/	2017-02-25 00:38:01+00	PlanetoftheAtheists	112	f
28	5w0oe1	110	0.8604	https://i.redd.it/spcv5iesvvhy.png	Trump has to silence those haters somehow.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w0oe1/trump_has_to_silence_those_haters_somehow/	2017-02-24 22:45:03+00	darexinfinity	112	f
29	5w6da1	107	0.5973	http://imgur.com/ePm0B3P	Seems like I've been doing this for an eternity	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w6da1/seems_like_ive_been_doing_this_for_an_eternity/	2017-02-25 21:13:26+00	ChickBrain	107	f
30	5w7byh	25	0.8872	https://imgflip.com/i/1kci6x#D3sTtQAPs0ShlDts.16	She Acts Awfully Towards All of Her Family, Aswell as my Fiance, and Even Towards My Future Mother-in-law, Who Takes Care of her 24/7.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w7byh/she_acts_awfully_towards_all_of_her_family_aswell/	2017-02-26 00:18:21+00	mbod	25	f
31	5w9c2e	110	0.5314	http://www.livememe.com/ridapkx	When your wife texts you to say that the guy trimming our trees looks shady	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w9c2e/when_your_wife_texts_you_to_say_that_the_guy/	2017-02-26 09:01:02+00	ManOfTheInBetween	110	f
32	5w5d9y	33	0.9218	https://i.redd.it/2gx2ef5cn1iy.jpg	Just had this beauty of a conversation starter	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w5d9y/just_had_this_beauty_of_a_conversation_starter/	2017-02-25 18:08:11+00	Hypnotic_Frog	33	f
33	5w66h4	96	0.8014	http://i.imgur.com/v7CJMm5.jpg	Terrorists stole IT acronym	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w66h4/terrorists_stole_it_acronym/	2017-02-25 20:38:12+00	Zigzaglife	96	f
34	5w8buq	94	0.7368	https://i.redd.it/ey4uhiytk4iy.jpg	You don't know how good it feels...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w8buq/you_dont_know_how_good_it_feels/	2017-02-26 03:59:06+00	Eioulloui3	94	f
35	5w7ddv	80	0.6275	https://i.imgflip.com/1kcisq.jpg	My family friend was fired from his teaching assistant job, this was his reaction:	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w7ddv/my_family_friend_was_fired_from_his_teaching/	2017-02-26 00:26:06+00	emoposer	80	f
36	5w0qv9	10	0.8545	https://i.reddituploads.com/d5bcd17903aa455eb88d0ba059456c22?fit=max&h=1536&w=1536&s=a5823ea1cb18a35aaace74d08e0db897	Wearing shorts in February? In the Midwest?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w0qv9/wearing_shorts_in_february_in_the_midwest/	2017-02-24 22:57:29+00	leslieinlouisville	10	f
37	5w30sp	111	0.7415	https://i.redd.it/m0yt7suqiyhy.png	After reading this on /r/all and being I'm a college student had me at..	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w30sp/after_reading_this_on_rall_and_being_im_a_college/	2017-02-25 07:36:21+00	Espryon	113	f
38	5w52sv	1	0.6262	http://imgur.com/LgSjpxY	I always get this look from my stepson and his cousin whenever I explain the ins and outs of high school.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w52sv/i_always_get_this_look_from_my_stepson_and_his/	2017-02-25 17:13:01+00	LarryGlue	1	f
39	5w1yg1	31	0.6181	https://i.imgur.com/vbeLoQv.png	Google can be clever sometimes.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w1yg1/google_can_be_clever_sometimes/	2017-02-25 03:00:13+00	C-Ron	31	f
40	5w04ic	5	0.6093	https://i.redd.it/6au8vcfvevhy.jpg	cheaters gonna cheat indeed.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w04ic/cheaters_gonna_cheat_indeed/	2017-02-24 21:09:22+00	TheRealBaseborn	5	f
41	5w545j	83	0.6407	http://i.imgur.com/LOvsBYk.jpg	Lack of LAN support and competitive matchmaking have ruined LAN Parties	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w545j/lack_of_lan_support_and_competitive_matchmaking/	2017-02-25 17:20:21+00	rhayward	83	f
42	5w0t1g	73	0.3655	https://i.redd.it/trdyb7420why.png	I was locked out of the house, my dog was locked in the house.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w0t1g/i_was_locked_out_of_the_house_my_dog_was_locked/	2017-02-24 23:08:04+00	NicoleMary27	73	f
43	5w6icw	11	0.5961	http://imgur.com/HOW04XW	I always blamed myself	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w6icw/i_always_blamed_myself/	2017-02-25 21:39:34+00	aeonicgnosis	11	f
44	5w6ebm	71	0.8137	http://i.imgur.com/KTZULjO.jpg	Hulu, Netflix, HBO, Showtime, and countless other channels and websites crop the fuck out of movies. The companies, the websites, and my friends don't give a fuck. I feel like a crazy person.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w6ebm/hulu_netflix_hbo_showtime_and_countless_other/	2017-02-25 21:19:02+00	roto_disc	71	f
45	5w5tcc	92	0.7648	http://i.imgur.com/ErpqOOT.png	Google Spaces bites the dust	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w5tcc/google_spaces_bites_the_dust/	2017-02-25 19:31:10+00	jun_sato	92	f
46	5w8jna	3	0.7353	http://imgur.com/T4mvoOO	Being Social for the win	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w8jna/being_social_for_the_win/	2017-02-26 04:53:22+00	Capt_Nettles	3	f
47	5w5as4	1	0.6656	https://i.reddituploads.com/a18c9eed3847406388a743d3d47b25d4?fit=max&h=1536&w=1536&s=34f918d7c6d745ec5f136d89d0ba07b6	Or sometimes, it's the urge of peeing	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w5as4/or_sometimes_its_the_urge_of_peeing/	2017-02-25 17:55:26+00	iAmDumber	1	f
48	5vyl0v	25	0.9500	https://i.redd.it/fgg7r2un5uhy.png	He is fine, but she can never know the truth	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5vyl0v/he_is_fine_but_she_can_never_know_the_truth/	2017-02-24 16:56:16+00	Whoshabooboo	25	f
49	5w8abj	28	0.8315	http://imgur.com/zR3vnPM	MRW hearing about American Pharaoh's stud fees	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w8abj/mrw_hearing_about_american_pharaohs_stud_fees/	2017-02-26 03:48:54+00	c1intr0n	28	f
50	5w94xo	24	0.6247	https://i.redd.it/q2fg30nap5iy.jpg	How quickly your luck can change.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w94xo/how_quickly_your_luck_can_change/	2017-02-26 07:46:51+00	wasabiface	24	f
51	5w7amc	110	0.8467	http://imgur.com/kdrs507	They don't know...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w7amc/they_dont_know/	2017-02-26 00:11:01+00	beanzo	112	f
52	5w4kq5	5	0.6899	https://i.redd.it/zpclpqtzv0iy.jpg	Just got hit by this - put a dent (albeit small) in my savings.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w4kq5/just_got_hit_by_this_put_a_dent_albeit_small_in/	2017-02-25 15:34:02+00	3LeggedJupiter	5	f
53	5w4u2u	106	0.5990	https://i.redd.it/e3khuimb51iy.jpg	In the world of media bans	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w4u2u/in_the_world_of_media_bans/	2017-02-25 16:26:16+00	likely_an_asshole	106	f
54	5w59lo	19	0.5408	http://i.imgur.com/RKMuKyc.jpg	Only soccer fans will understand this	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w59lo/only_soccer_fans_will_understand_this/	2017-02-25 17:49:03+00	IASWABTBJ	19	f
55	5w5ary	49	0.7226	http://imgur.com/In3Xnzt	My depression use to be a sexy taboo for this mental health worker.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w5ary/my_depression_use_to_be_a_sexy_taboo_for_this/	2017-02-25 17:55:24+00	aeonicgnosis	49	f
56	5w8c97	24	0.5242	http://imgur.com/eE0Rkd8	Let's start pointing fingers in the right direction here.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w8c97/lets_start_pointing_fingers_in_the_right/	2017-02-26 04:01:38+00	TonyTheDuke	24	f
57	5w8t6d	87	0.6200	https://i.redd.it/hpy12es675iy.jpg	Apparently, so did all Presidents from Jefferson-Taft. We'll see!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w8t6d/apparently_so_did_all_presidents_from/	2017-02-26 06:03:52+00	BShears	87	f
88	5w9s76	25	0.8689	https://i.redd.it/eznix1m2x6iy.jpg	It looks nice, but...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w9s76/it_looks_nice_but/	2017-02-26 11:51:09+00	Swag_like_goku	25	f
58	5w2lpf	33	0.8966	https://i.reddituploads.com/c64854a3a13246fba7986910d3e328da?fit=max&h=1536&w=1536&s=9a4e35652b95d3088b1515f0348716cc	It's late and his house was the only thing to look at...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w2lpf/its_late_and_his_house_was_the_only_thing_to_look/	2017-02-25 05:35:04+00	photobrewster	33	f
59	5w6n33	9	0.6892	https://i.redd.it/xzc6hlkit2iy.png	I guess I need to eat something .	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w6n33/i_guess_i_need_to_eat_something/	2017-02-25 22:04:11+00	Zyk40	9	f
60	5w7ugv	25	0.9378	http://imgur.com/yU9Q5ON	I might do it again...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w7ugv/i_might_do_it_again/	2017-02-26 02:07:08+00	athomeonmysofa	25	f
61	5w7lep	110	0.8911	https://i.redd.it/axpmhax8r3iy.jpg	Trying to potty train my 2-year old...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w7lep/trying_to_potty_train_my_2year_old/	2017-02-26 01:12:44+00	dinosaurskincondom	112	f
62	5w8bbi	101	0.8349	http://i.imgur.com/XBbd5yk.png	Progressives only option after Perez Became DNC chair	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w8bbi/progressives_only_option_after_perez_became_dnc/	2017-02-26 03:55:31+00	unofficialchemist	101	f
63	5vxge9	5	0.6362	https://i.redd.it/cjfx2nnf5thy.jpg	cheaters gonna cheat	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5vxge9/cheaters_gonna_cheat/	2017-02-24 13:33:07+00	hotrod75	5	f
64	5w843e	19	0.4288	http://imgur.com/v6po8zn	You can't	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w843e/you_cant/	2017-02-26 03:08:13+00	Themissinggallagher	19	f
65	5w7kp8	28	0.9079	http://imgur.com/u45of0a	After reading about the Triple Crown Winner.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w7kp8/after_reading_about_the_triple_crown_winner/	2017-02-26 01:08:37+00	RightersBlauc	28	f
66	5w5ykq	111	0.8769	https://i.redd.it/omrwuqgs62iy.jpg	Cleaning up after dirty roommates	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w5ykq/cleaning_up_after_dirty_roommates/	2017-02-25 19:57:44+00	sez6689	113	f
67	5w00mw	5	0.3724	http://imgur.com/qaeLKWD	I don't know if it's just my luck, but every car seller I've contacted so far on Graiglist has said that the vehicle was sold...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w00mw/i_dont_know_if_its_just_my_luck_but_every_car/	2017-02-24 20:50:40+00	NitroNihon	5	f
68	5w70u2	82	0.3972	http://www.livememe.com/fc9ey3l	Male here out of vitamins...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w70u2/male_here_out_of_vitamins/	2017-02-25 23:16:03+00	iam4real	82	f
69	5w3ix6	25	0.8917	http://i.imgur.com/pXJhCJN.png	I am just closet about my sexuality..	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w3ix6/i_am_just_closet_about_my_sexuality/	2017-02-25 10:33:45+00	Williamjacob30	25	f
70	5w7ver	25	0.8750	https://i.redd.it/6qrgjenz14iy.jpg	If something's good enough, everyone has the right to see it. I have a right to downvote it.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w7ver/if_somethings_good_enough_everyone_has_the_right/	2017-02-26 02:12:57+00	3LeggedJupiter	25	f
71	5w9jst	24	0.4803	http://i.imgur.com/mcZeuRn.jpg	Zooming in on that small text.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w9jst/zooming_in_on_that_small_text/	2017-02-26 10:23:05+00	sexyrichbigpenis	24	f
72	5w1jgn	5	0.3962	https://i.redd.it/2mt39uvepwhy.jpg	cheaters gonna help each other cheat.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w1jgn/cheaters_gonna_help_each_other_cheat/	2017-02-25 01:30:28+00	gafftaped	5	f
73	5w2to5	96	0.6265	http://i.imgur.com/E4TeMCl.jpg	Life as an ear damaged musician with a dirty mind (Potentially NSFW)	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w2to5/life_as_an_ear_damaged_musician_with_a_dirty_mind/	2017-02-25 06:36:46+00	fendergirl	96	t
74	5vydiz	6	0.7231	http://imgur.com/m5wJgb1	Saw this good guy dog walker at the park	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5vydiz/saw_this_good_guy_dog_walker_at_the_park/	2017-02-24 16:22:22+00	iHaveACatDog	6	f
75	5w298a	20	0.7941	http://imgur.com/Mo0YN7R	How else would I know exactly how it sounds?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w298a/how_else_would_i_know_exactly_how_it_sounds/	2017-02-25 04:09:35+00	Ramza_Claus	20	f
76	5w9cpt	67	0.7357	https://i.redd.it/6z1o2qm146iy.jpg	"Chord" is a musical term - not a wire. For flying-fuck's sake....	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w9cpt/chord_is_a_musical_term_not_a_wire_for/	2017-02-26 09:08:01+00	mistercolebert	67	f
77	5w527e	110	0.4975	http://www.livememe.com/24f1z5t	Steve Bannon right now	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w527e/steve_bannon_right_now/	2017-02-25 17:09:56+00	critcal_kurt	112	f
78	5vyc7g	96	0.6668	http://i.imgur.com/RBkaUP3.jpg	4 Time This Morning...and Counting.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5vyc7g/4_time_this_morningand_counting/	2017-02-24 16:16:24+00	Thom_Cruze_Missile	96	f
79	5vxhxg	55	0.7046	https://i.reddituploads.com/e9797bc4d33c455ea787501af3f35071?fit=max&h=1536&w=1536&s=2f4f09a7583022d318a939f33b01865e	Happens way to often around Atlanta....	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5vxhxg/happens_way_to_often_around_atlanta/	2017-02-24 13:42:49+00	gtrfrk83	55	f
80	5w6718	9	0.7013	http://imgur.com/lToh4M4	I live a tough life I swear	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w6718/i_live_a_tough_life_i_swear/	2017-02-25 20:41:16+00	BDKhXc	9	f
81	5vx51a	17	0.7505	http://imgur.com/gAUkvHx	My friends 4th-grader after not paying attention during lesson.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5vx51a/my_friends_4thgrader_after_not_paying_attention/	2017-02-24 12:14:45+00	DonDalle	17	f
82	5w5n6i	110	0.5900	http://imgur.com/omqHMKf	I would 'have a nice day' if I could bring home dinner tonight.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w5n6i/i_would_have_a_nice_day_if_i_could_bring_home/	2017-02-25 18:59:45+00	aeonicgnosis	111	f
83	5w7ns3	100	0.5804	http://i.imgur.com/61xeGvN.jpg	I feel so bad but at least the towels are dry	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w7ns3/i_feel_so_bad_but_at_least_the_towels_are_dry/	2017-02-26 01:26:45+00	Twist161	100	f
84	5w5jqc	110	0.5521	https://i.reddituploads.com/4e7506a71a764fe987254183e5c963e3?fit=max&h=1536&w=1536&s=aaaf49ff7b0995e95db7dc7109355ccd	Rural Alberta; every year the struggle is real	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w5jqc/rural_alberta_every_year_the_struggle_is_real/	2017-02-25 18:41:35+00	change1378	112	f
85	5w28bd	25	0.9647	https://i.imgflip.com/1kb2g8.jpg	It was motivational.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w28bd/it_was_motivational/	2017-02-25 04:03:39+00	Fat-Drunk-and-Sad	25	f
86	5vy4c5	9	0.6479	https://i.redd.it/85z4mad3sthy.jpg	Every time I come home from work. Every time.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5vy4c5/every_time_i_come_home_from_work_every_time/	2017-02-24 15:39:59+00	vlucas	9	f
87	5w6twp	5	0.5861	http://i.imgur.com/d56ft51.jpg	Handy for that awkward moment.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w6twp/handy_for_that_awkward_moment/	2017-02-25 22:39:18+00	OhTheHueManatee	5	f
89	5w9wt7	25	0.9122	http://imgur.com/91GaEgI	There must be some problem with your computer.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w9wt7/there_must_be_some_problem_with_your_computer/	2017-02-26 12:34:26+00	gummz13	25	f
90	5w9yos	50	0.3544	http://i.imgur.com/bAIZTlj.jpg	Cats Going Their Own Way	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w9yos/cats_going_their_own_way/	2017-02-26 12:51:59+00	cryobabe	50	f
91	5w8tg2	33	0.8917	http://i.imgur.com/Jh2r0ap.jpg	I don't like physical contact with people I don't know.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w8tg2/i_dont_like_physical_contact_with_people_i_dont/	2017-02-26 06:06:03+00	Liquorace	33	f
92	5w4pc0	36	0.6271	https://i.imgur.com/cBBq1ts.png	As long as we're using memes to point out political hypocrisy...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5w4pc0/as_long_as_were_using_memes_to_point_out/	2017-02-25 16:00:30+00	Euthy	36	f
93	5wa8lc	71	0.7292	http://imgur.com/TSHAJId	When I here someone has late fee on their rent.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wa8lc/when_i_here_someone_has_late_fee_on_their_rent/	2017-02-26 14:10:37+00	aeonicgnosis	71	f
94	5wa9gl	25	0.8493	http://imgur.com/GVA9L3T	I'm not too old, your programming just sucks	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wa9gl/im_not_too_old_your_programming_just_sucks/	2017-02-26 14:16:49+00	dmbc	25	f
95	5wab5w	1	0.5160	http://imgur.com/K46p7l6	Sorry if I voted Yellow and want to be an optimist for the next 4 to 8 years.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wab5w/sorry_if_i_voted_yellow_and_want_to_be_an/	2017-02-26 14:29:23+00	aeonicgnosis	1	f
96	5wad4n	110	0.5650	http://imgur.com/rnNBJCZ	Maybe I'm just too young, but your technology sucks	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wad4n/maybe_im_just_too_young_but_your_technology_sucks/	2017-02-26 14:42:42+00	aeonicgnosis	111	f
97	5waefu	88	0.4803	https://i.redd.it/7h2eca44t7iy.jpg	Trump supporters on my FB keep posting that meme comparing WWII vets on D-day to college kids and safe spaces: they need to read this.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5waefu/trump_supporters_on_my_fb_keep_posting_that_meme/	2017-02-26 14:51:10+00	TheEssexian	88	f
98	5wae8d	110	0.3439	https://imgflip.com/i/1kdcza#C8KVv3vG1OK1s20z.16	Hardly ever makes a difference	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wae8d/hardly_ever_makes_a_difference/	2017-02-26 14:49:55+00	notlaurensorry	112	f
99	5waeyd	23	0.8017	http://imgur.com/EY7CCEh	Happens every time...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5waeyd/happens_every_time/	2017-02-26 14:54:46+00	DminorFmajor	23	f
100	5wahal	5	0.8798	http://i.imgur.com/lHYTTR2.jpg	Always close your eyes when...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wahal/always_close_your_eyes_when/	2017-02-26 15:09:28+00	joyfield	5	f
101	5waje4	8	0.8050	http://www.livememe.com/7rnjmdd	Really, it's a compulsion.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5waje4/really_its_a_compulsion/	2017-02-26 15:21:41+00	formeraide	8	f
102	5waivm	69	0.9454	https://i.redd.it/yur1dgk2y7iy.jpg	Security	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5waivm/security/	2017-02-26 15:18:46+00	privateclick	69	f
103	5wakea	88	0.4971	http://www.livememe.com/rx2lxdt	To all Bernie supporters	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wakea/to_all_bernie_supporters/	2017-02-26 15:27:27+00	Anotherlink421	88	f
104	5wak0m	25	0.8199	http://i.imgur.com/Tfu8bgr.png	Really, it was customer service...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wak0m/really_it_was_customer_service/	2017-02-26 15:25:10+00	LuvinMclovin	25	f
105	5wamgr	110	0.5313	http://imgur.com/uNEi4nR	I don't wish bad karma on anyone but I'm not sure how else she'll get the point, besides cleaning up for her	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wamgr/i_dont_wish_bad_karma_on_anyone_but_im_not_sure/	2017-02-26 15:39:51+00	BigJ76	111	f
106	5waltu	110	0.8602	http://i.imgur.com/RlVHN4C.jpg	Flint logic	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5waltu/flint_logic/	2017-02-26 15:36:00+00	Professorjack88	112	f
107	5wan39	94	0.7456	https://imgflip.com/i/1kdfo3#5TH6QO153kwkbehZ.16	I think this means I'm becoming an adult. Right?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wan39/i_think_this_means_im_becoming_an_adult_right/	2017-02-26 15:43:40+00	Pandalungs	94	f
108	5waqw9	113	0.4121	http://imgur.com/f3g6Tf6	Game over man! RIP Bill Paxton	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5waqw9/game_over_man_rip_bill_paxton/	2017-02-26 16:06:01+00	kungfumilhouse	115	f
109	5waqo1	1	0.6656	http://imgur.com/vmpHkTc	Driving around in Colorado	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5waqo1/driving_around_in_colorado/	2017-02-26 16:05:01+00	PM_ME_YOUR_OROGENY	1	f
110	5waus5	104	0.5242	http://imgur.com/ndEt26i	Paxton's lesser known role, but we'll remembered.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5waus5/paxtons_lesser_known_role_but_well_remembered/	2017-02-26 16:27:10+00	kungfumilhouse	104	f
111	5wauhf	110	0.6187	https://i.reddituploads.com/eddc0c3c2bd6429dae585c9c2336757d?fit=max&h=1536&w=1536&s=9aeb66505f5b5c96556d806b3b0233f1	Today was barber day, this happens every damn time!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wauhf/today_was_barber_day_this_happens_every_damn_time/	2017-02-26 16:25:28+00	amayonazing	112	f
112	5wavwj	21	0.4483	https://i.redd.it/sruocw3eb8iy.jpg	Sometimes being single isn't gross, it's just pathetic...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wavwj/sometimes_being_single_isnt_gross_its_just/	2017-02-26 16:33:13+00	LacyGray	21	f
113	5wawjk	17	0.8090	http://imgur.com/3XmWf1r	Our ten year old daughter everyone. The heart of a lion. The attitude of a wolf.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wawjk/our_ten_year_old_daughter_everyone_the_heart_of_a/	2017-02-26 16:36:28+00	Finrod_the_awesome	17	f
114	5wazmx	71	0.6888	http://www.livememe.com/9dr9ept	After hearing most of the students in my classes complain about not starting their assignments that were due the next class day	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wazmx/after_hearing_most_of_the_students_in_my_classes/	2017-02-26 16:53:06+00	SheZowRaisedByWolves	71	f
115	5wb5a5	53	0.3843	https://i.redd.it/cvpo5tpbi8iy.jpg	The hate crime logic	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wb5a5/the_hate_crime_logic/	2017-02-26 17:21:46+00	Prophatetic	53	f
116	5wb680	88	0.5327	https://i.redd.it/5nsaavmxk8iy.jpg	RIP Bill	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wb680/rip_bill/	2017-02-26 17:26:16+00	theflyingb	88	f
117	5wb86k	5	0.8213	http://imgur.com/Ogbzj9b	A neat trick to beat the cold! It's never failed me once!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wb86k/a_neat_trick_to_beat_the_cold_its_never_failed_me/	2017-02-26 17:35:48+00	42words	5	f
118	5wb81q	70	0.7334	http://memedad.com/memes/1117915.jpg	And she's still "teaching" there	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wb81q/and_shes_still_teaching_there/	2017-02-26 17:35:05+00	dicentra	70	f
119	5wba0y	28	0.8896	http://imgur.com/20PVFss	A legit thought I had today while shopping. I guess I'm an adult now	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wba0y/a_legit_thought_i_had_today_while_shopping_i/	2017-02-26 17:44:58+00	theballinist	28	f
120	5wbc9c	70	0.7070	http://memedad.com/memes/1117917.jpg	Actual quote from this lunatic	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbc9c/actual_quote_from_this_lunatic/	2017-02-26 17:56:03+00	dicentra	70	f
121	5wbbxa	33	0.8129	http://imgur.com/lT2VytC	Short end of the stick	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbbxa/short_end_of_the_stick/	2017-02-26 17:54:22+00	mrscissorhands4	33	f
122	5wbjpa	104	0.5417	https://i.redd.it/5wh06x3sw8iy.jpg	It had to be done	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbjpa/it_had_to_be_done/	2017-02-26 18:32:49+00	ColonelDredd	104	f
123	5wbi9t	5	0.8532	http://imgur.com/qBQVEqV	The socially awkward circle jerk is strong here- you have to put yourself out there	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbi9t/the_socially_awkward_circle_jerk_is_strong_here/	2017-02-26 18:25:39+00	Coneskater	5	f
124	5wbmo0	110	0.5412	https://i.redd.it/x9cefy8dz8iy.jpg	I have a serious problem, the struggle is real.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbmo0/i_have_a_serious_problem_the_struggle_is_real/	2017-02-26 18:47:44+00	TheHalfBloodKing	112	f
125	5wbmc5	25	0.8323	http://imgur.com/07X4nlN	Mixed feelings when I heard the news...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbmc5/mixed_feelings_when_i_heard_the_news/	2017-02-26 18:46:05+00	Figgywithit	25	f
126	5wbm5k	23	0.7104	https://i.redd.it/mhulm5uqy8iy.png	The Daytona 500 is on TV today	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbm5k/the_daytona_500_is_on_tv_today/	2017-02-26 18:45:05+00	NotYourGoldStandard	23	f
127	5wbq6p	65	0.7343	http://imgur.com/uhvoyTU	Just because live action Aladdin and Lion King isn't your cup of tea doesn't mean it won't be good.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbq6p/just_because_live_action_aladdin_and_lion_king/	2017-02-26 19:04:31+00	aeonicgnosis	65	f
128	5wbs2c	6	0.6246	https://i.redd.it/5nt7y7g549iy.jpg	It was a nice thing to wake up to when you're expecting a package in the mail. Here's to you, good guy mailman!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbs2c/it_was_a_nice_thing_to_wake_up_to_when_youre/	2017-02-26 19:14:03+00	Slutallitits	6	f
129	5wbvrn	69	0.7068	https://i.redd.it/b7joxc2679iy.jpg	Me talk to my friends. It's hard to keep up.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbvrn/me_talk_to_my_friends_its_hard_to_keep_up/	2017-02-26 19:31:30+00	kgtz	69	f
130	5wbvh3	24	0.4804	https://i.redd.it/4i6kcelw69iy.jpg	Rest in peace Bill Pullman	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbvh3/rest_in_peace_bill_pullman/	2017-02-26 19:30:05+00	The_Tree_Beard	24	f
131	5wbx6z	11	0.6417	http://imgur.com/MwnAoEj	My friend is already drunk before the Oscars party this evening	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wbx6z/my_friend_is_already_drunk_before_the_oscars/	2017-02-26 19:38:32+00	NoClueDad	11	f
132	5wc0qc	25	0.8702	http://imgur.com/QQi63Kw	I'll miss you Bruno. Coolest cocker spaniel ever.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc0qc/ill_miss_you_bruno_coolest_cocker_spaniel_ever/	2017-02-26 19:55:47+00	WalterHPinkman	25	f
133	5wc0z2	110	0.6024	http://imgur.com/GuDtKqF	Too soon.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc0z2/too_soon/	2017-02-26 19:57:04+00	for_memes_only	111	f
134	5wc2a0	10	0.7702	http://imgur.com/RyalLEz	Those places must be utopias.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc2a0/those_places_must_be_utopias/	2017-02-26 20:03:16+00	aeonicgnosis	10	f
135	5wc590	58	0.5593	http://imgur.com/FgIfspo	Why are people racist against white people?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc590/why_are_people_racist_against_white_people/	2017-02-26 20:17:30+00	aeonicgnosis	58	f
136	5wc4j0	3	0.3978	http://imgur.com/0lACSJR	It wouldn't have mattered if they threw him. RIP Bill Paxton	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc4j0/it_wouldnt_have_mattered_if_they_threw_him_rip/	2017-02-26 20:14:02+00	IntrigueDossier	3	f
137	5wc4dx	63	0.6688	http://www.livememe.com/7s7loip	On the news they were comparing Baby Boomer voters with Millennial voters	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc4dx/on_the_news_they_were_comparing_baby_boomer/	2017-02-26 20:13:18+00	iam4real	63	f
138	5wc7x9	6	0.5689	https://i.redd.it/l7o1gtgth9iy.jpg	Good guy ride operator	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc7x9/good_guy_ride_operator/	2017-02-26 20:30:34+00	Blakesta999	6	f
139	5wc8dy	69	0.7068	https://i.redd.it/jw0bwpz5i9iy.jpg	It's hard to keep up	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc8dy/its_hard_to_keep_up/	2017-02-26 20:32:44+00	kgtz	69	f
140	5wc7xv	88	0.4868	http://www.livememe.com/kf6hcxt	America's Two Party System at its finest	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc7xv/americas_two_party_system_at_its_finest/	2017-02-26 20:30:38+00	Anotherlink421	88	f
141	5wc933	19	0.4710	http://imgur.com/QmFYKE1	Students: americas cash cow	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc933/students_americas_cash_cow/	2017-02-26 20:36:12+00	sysadmin001	19	f
142	5wc8up	11	0.6335	http://imgur.com/siup9jx	Obviously I grew up to be a pervert.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wc8up/obviously_i_grew_up_to_be_a_pervert/	2017-02-26 20:34:57+00	aeonicgnosis	11	f
143	5wcb68	70	0.7288	http://imgur.com/0ezmiFP	"The First 100 Lies."	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wcb68/the_first_100_lies/	2017-02-26 20:46:19+00	aeonicgnosis	70	f
144	5wccp6	110	0.5694	http://imgur.com/dZVOYd5	5 minutes in	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wccp6/5_minutes_in/	2017-02-26 20:53:49+00	PixlePieface	111	f
145	5wcfq3	110	0.4416	http://imgur.com/LWBQXJ9	My buddy made himself into a meme what do yall think? Sarcastic Sammy	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wcfq3/my_buddy_made_himself_into_a_meme_what_do_yall/	2017-02-26 21:08:32+00	New_CCNA	111	f
146	5wcift	113	0.5678	http://www.livememe.com/fn9ogsh	Deal breaker	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wcift/deal_breaker/	2017-02-26 21:22:10+00	iam4real	115	f
147	5wchyr	88	0.6873	http://i.imgur.com/2zsirwU.jpg	Time heals all wounds right?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wchyr/time_heals_all_wounds_right/	2017-02-26 21:19:39+00	savagedonzilla	88	f
148	5wch6c	24	0.8316	http://i.imgur.com/e1gCvGS.jpg	The modern version of "My dog ate my homework".	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wch6c/the_modern_version_of_my_dog_ate_my_homework/	2017-02-26 21:15:33+00	C-4	24	f
149	5wcjps	10	0.8160	http://imgur.com/kR6MEd5	You can't have it both ways.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wcjps/you_cant_have_it_both_ways/	2017-02-26 21:28:26+00	aeonicgnosis	10	f
150	5wcpec	110	0.5943	https://i.redd.it/n65rr0v4x9iy.jpg	It really sucks.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wcpec/it_really_sucks/	2017-02-26 21:56:25+00	Mike_Hawk_balls_deep	112	f
151	5wcsp4	49	0.5561	http://imgur.com/kOubZhy	Everyone: my ex girlfriend's logic.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wcsp4/everyone_my_ex_girlfriends_logic/	2017-02-26 22:12:05+00	yusbarrett	49	f
152	5wcu7u	96	0.6659	https://i.redd.it/r9nkwuga1aiy.jpg	Happens way to often...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wcu7u/happens_way_to_often/	2017-02-26 22:19:42+00	PinkSpoon28	96	f
153	5wcule	25	0.9012	http://i.imgur.com/NG5tM4L.png	But when I found out Bill Paxton died it really hurt ...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wcule/but_when_i_found_out_bill_paxton_died_it_really/	2017-02-26 22:21:39+00	Great-Pyrenees	25	f
154	5wcybv	45	0.5221	https://i.redd.it/z5rmnkix4aiy.jpg	Bill Paxton died?!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wcybv/bill_paxton_died/	2017-02-26 22:40:32+00	CaptainRelevant	45	f
155	5wcy8n	88	0.5957	http://imgur.com/zLKHBMV	And I don't wanna talk to a scientist, y'all motherfuckers lyin', and gettin' me pissed.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wcy8n/and_i_dont_wanna_talk_to_a_scientist_yall/	2017-02-26 22:40:04+00	CDC_	88	f
156	5wd3cx	87	0.6175	https://i.redd.it/h988c7849aiy.jpg	Something's bound to trigger his twitterfingers...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wd3cx/somethings_bound_to_trigger_his_twitterfingers/	2017-02-26 23:05:36+00	NerdGangster	87	f
157	5wd6e5	10	0.7846	https://i.imgflip.com/1ke7li.jpg	If you're on death row...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wd6e5/if_youre_on_death_row/	2017-02-26 23:21:19+00	classicrocker883	10	f
158	5wd5p1	25	0.8486	http://imgur.com/QGtSMF9	Independence Day was my favorite.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wd5p1/independence_day_was_my_favorite/	2017-02-26 23:17:54+00	haTface84	25	f
159	5wd6zf	2	0.8266	http://i.imgur.com/F9xBqUw.png	Who's failing, @NYT or Trump corp?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wd6zf/whos_failing_nyt_or_trump_corp/	2017-02-26 23:24:24+00	crawlerz2468	2	f
160	5wdaoq	73	0.3939	https://i.imgur.com/zEeekcm.png	Skeptical Pupper	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wdaoq/skeptical_pupper/	2017-02-26 23:44:17+00	TheUnchainedZebra	73	f
161	5wdeqt	23	0.6904	http://imgur.com/UiHehli	With the Oscars coming up...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wdeqt/with_the_oscars_coming_up/	2017-02-27 00:06:22+00	Th3muddler	23	f
162	5wdjrr	87	0.6043	http://i.imgur.com/ByhK9Z0.jpg	I'm no fan of Trump, but the hatred from Hollywood has almost gotten ridiculous	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wdjrr/im_no_fan_of_trump_but_the_hatred_from_hollywood/	2017-02-27 00:31:10+00	scotterson34	87	f
163	5wdjbx	48	0.5275	http://www.livememe.com/vk5e129	I was trying to tell a friend with car problems I'd follow her home...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wdjbx/i_was_trying_to_tell_a_friend_with_car_problems/	2017-02-27 00:28:43+00	iam4real	48	f
164	5wdl42	83	0.7971	https://i.reddituploads.com/fa08e529f63b4625ae27f43b3a6541d3?fit=max&h=1536&w=1536&s=2d7fce9fecd474d600b0f0be785e1f9f	If I wanted politics, I'd turn on C-SPAN.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wdl42/if_i_wanted_politics_id_turn_on_cspan/	2017-02-27 00:38:13+00	RocketshipHarry	83	f
165	5wdom0	23	0.6939	http://imgur.com/PAYuCeu	R.I.P Bill "Lonestar" P.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wdom0/rip_bill_lonestar_p/	2017-02-27 00:57:06+00	Quidfacis_	23	f
166	5wdr1j	25	0.8202	https://i.redd.it/ttqpi8qkvaiy.jpg	Couldn't let those McNuggets go to waste	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wdr1j/couldnt_let_those_mcnuggets_go_to_waste/	2017-02-27 01:09:54+00	wolferoo	25	f
167	5wdsut	88	0.5438	http://imgur.com/A3rCdrX	To the guy with the Forrest in their butter knife	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wdsut/to_the_guy_with_the_forrest_in_their_butter_knife/	2017-02-27 01:19:26+00	RVA_AndyB	88	f
168	5wdv8f	17	0.7925	http://imgur.com/O5B0ccu	I knew what I was getting into, and I did it anyway	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wdv8f/i_knew_what_i_was_getting_into_and_i_did_it_anyway/	2017-02-27 01:32:23+00	deltusverilan	17	f
169	5wdv80	25	0.8412	http://imgur.com/pG3mEVw	I'd love to be with her again, but the heartbreak was a valuable lesson for me.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wdv80/id_love_to_be_with_her_again_but_the_heartbreak/	2017-02-27 01:32:21+00	ChevanBLZ	25	f
170	5we05l	80	0.6464	http://www.livememe.com/a8d2x9d	I'm getting sick of this shit	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5we05l/im_getting_sick_of_this_shit/	2017-02-27 02:00:00+00	SheZowRaisedByWolves	80	f
171	5we1ce	82	0.3629	https://i.reddituploads.com/30f6616ea4404bdbba275381d6cdfb9d?fit=max&h=1536&w=1536&s=173f1eddb5116e7d2311c9636b1e5084	It makes me feel better and they keep trying	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5we1ce/it_makes_me_feel_better_and_they_keep_trying/	2017-02-27 02:06:56+00	Batmanvader	82	f
172	5we37d	27	0.9312	https://i.imgur.com/R6HFhuF.png	When a girl at the gym asks how many sets you got left	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5we37d/when_a_girl_at_the_gym_asks_how_many_sets_you_got/	2017-02-27 02:17:09+00	Alex_the_White	27	f
173	5we5vx	103	0.4740	http://i.imgur.com/s2GbZaW.jpg	So, even though humans have royally fucked up Earth...we want to make friends with other earth-like planets?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5we5vx/so_even_though_humans_have_royally_fucked_up/	2017-02-27 02:32:35+00	iam4real	103	f
174	5we8q2	110	0.5660	http://imgur.com/nWkLSQ6	Straight outta nominations.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5we8q2/straight_outta_nominations/	2017-02-27 02:49:08+00	damitbobsaget	111	f
175	5we82s	11	0.5728	https://imgflip.com/i/1keis3#i4RuoXEek0aCySLV.16	I knew my blood sugar was low when...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5we82s/i_knew_my_blood_sugar_was_low_when/	2017-02-27 02:45:23+00	madgepie198	11	f
176	5weg9g	110	0.5438	https://i.redd.it/cqfpjp3ykbiy.jpg	My daughters response when I thank her for finally stopping humming/singing that new Disney movie song	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5weg9g/my_daughters_response_when_i_thank_her_for/	2017-02-27 03:32:10+00	TOP_REPOST_BOT	111	f
177	5weexi	11	0.5793	http://imgur.com/i7tbLYw	Watching a Movie.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5weexi/watching_a_movie/	2017-02-27 03:24:30+00	aeonicgnosis	11	f
178	5wehm4	25	0.8394	https://i.redd.it/kix9r823mbiy.jpg	My childhood was all about the small victories	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wehm4/my_childhood_was_all_about_the_small_victories/	2017-02-27 03:40:12+00	by_His_command	25	f
179	5wejd7	25	0.3658	http://i.imgur.com/VfqEYrc.png	If you do this you deserve a cold place in hell	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wejd7/if_you_do_this_you_deserve_a_cold_place_in_hell/	2017-02-27 03:50:54+00	Alex_the_White	25	f
180	5wel4z	39	0.7897	http://i.imgur.com/4poCgHU.png	I'm getting hungry...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wel4z/im_getting_hungry/	2017-02-27 04:01:37+00	Pingantu	39	f
181	5wek1c	1	0.7900	https://i.redd.it/wbwkh071pbiy.jpg	In honour of that actor named Bill who passed away	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wek1c/in_honour_of_that_actor_named_bill_who_passed_away/	2017-02-27 03:55:04+00	TheEssexian	1	f
182	5wem3j	39	0.9184	http://i.imgur.com/9JdUkyi.png	What do you call an awkward female cow?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wem3j/what_do_you_call_an_awkward_female_cow/	2017-02-27 04:07:39+00	Pingantu	39	f
183	5wemt4	55	0.5555	http://imgur.com/pBFmcRx	The Oscars tonight	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wemt4/the_oscars_tonight/	2017-02-27 04:11:58+00	smj_406	55	f
184	5wenpy	81	0.7061	http://imgur.com/rBnFewa	It was really only ever candy purchases, but I would get nervous when I lost them	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wenpy/it_was_really_only_ever_candy_purchases_but_i/	2017-02-27 04:17:33+00	RaineRisin	81	f
185	5weq3a	11	0.6041	http://imgur.com/VSpNMQZ	Love Making = Bigotry Immunity	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5weq3a/love_making_bigotry_immunity/	2017-02-27 04:32:02+00	aeonicgnosis	11	f
186	5weswu	55	0.8010	http://imgur.com/2GM3WFF	Lookin' at you Manchester by the Sea...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5weswu/lookin_at_you_manchester_by_the_sea/	2017-02-27 04:50:03+00	3L3G4NT	55	f
187	5weswc	103	0.5385	https://i.redd.it/xgof2b0iybiy.jpg	Well the choice is obvious.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5weswc/well_the_choice_is_obvious/	2017-02-27 04:49:56+00	Stormx99	103	f
188	5wesom	110	0.8282	https://i.reddituploads.com/b4ac2ca9b9c34ca19772abcaa9906f41?fit=max&h=1536&w=1536&s=b176fc31c8f0f6e2d2aad588fa3d0efb	I have never been rejected before	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wesom/i_have_never_been_rejected_before/	2017-02-27 04:48:37+00	Swollwonder	112	f
189	5wexv0	64	0.5255	https://i.redd.it/ecygmmjf4ciy.jpg	Oh Steve...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wexv0/oh_steve/	2017-02-27 05:21:00+00	PaunchMonster	64	f
190	5wexz0	51	0.4486	http://imgur.com/O54u5sv	American logic?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wexz0/american_logic/	2017-02-27 05:21:41+00	javadintaiwan	51	f
191	5wexuw	69	0.7427	http://imgur.com/nPr6o13	I can't believe he read the wrong winner	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wexuw/i_cant_believe_he_read_the_wrong_winner/	2017-02-27 05:20:59+00	theatahhh	69	f
192	5wexng	42	0.5331	https://i.reddituploads.com/487be49a9e26490f91141e0d1826f0c9?fit=max&h=1536&w=1536&s=afc50f5d7af928f5f1403cc951be5aac	Well that was interesting...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wexng/well_that_was_interesting/	2017-02-27 05:19:40+00	foodude84	42	f
193	5wez0p	40	0.6477	http://imgur.com/aCL545j	FAKE NEWS	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wez0p/fake_news/	2017-02-27 05:28:04+00	drewxdeficit	40	f
194	5weypw	24	0.5357	https://i.redd.it/gf21boid5ciy.jpg	Academy Award for Best Picture	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5weypw/academy_award_for_best_picture/	2017-02-27 05:26:09+00	mahollinger	24	f
195	5wez2s	24	0.5862	http://imgur.com/sXJ0UJy	Steve Harvey is the real winner here	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wez2s/steve_harvey_is_the_real_winner_here/	2017-02-27 05:28:23+00	jovonhl27	24	f
196	5wezhf	110	0.5173	http://imgur.com/BxA8ZOt	Never go full Steve Harvey	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wezhf/never_go_full_steve_harvey/	2017-02-27 05:30:47+00	SpasticWalker	112	f
197	5wf1hh	87	0.6198	http://i.imgur.com/2WPDXjC.jpg	As long as the person handing them out isn't colorblind...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf1hh/as_long_as_the_person_handing_them_out_isnt/	2017-02-27 05:42:51+00	EmpyreanDraco	87	f
198	5wf1h6	14	0.5753	http://www.livememe.com/20qoctd	more than likely	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf1h6/more_than_likely/	2017-02-27 05:42:50+00	aMANescape	14	f
199	5wf0yj	19	0.4420	https://i.imgur.com/xg0ug8b.png	Not so fast La La Land	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf0yj/not_so_fast_la_la_land/	2017-02-27 05:39:45+00	9mac	19	f
200	5wf09v	12	0.6539	http://imgur.com/ao2PLuo	Hollywood tonight	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf09v/hollywood_tonight/	2017-02-27 05:35:35+00	tegu5309	12	f
201	5wf2t7	5	0.7626	http://imgur.com/gLudiCl	When subreddits, like T_D, take away your ability to up/downvote certain posts just remember it is still possible!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf2t7/when_subreddits_like_t_d_take_away_your_ability/	2017-02-27 05:51:47+00	FuzzyWazzyWasnt	5	f
202	5wf2h7	110	0.3847	https://i.redd.it/pd3cbn1i9ciy.jpg	Tonight's Oscars seemed really familiar	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf2h7/tonights_oscars_seemed_really_familiar/	2017-02-27 05:49:36+00	topchief1	112	f
203	5wf271	96	0.5382	https://i.redd.it/debr8l079ciy.jpg	I stayed silent and didn't know what to do.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf271/i_stayed_silent_and_didnt_know_what_to_do/	2017-02-27 05:47:34+00	SemperWolf21	96	f
204	5wf1zq	31	0.6824	http://imgur.com/wHHbjlE	I feel like an evolved caveman now	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf1zq/i_feel_like_an_evolved_caveman_now/	2017-02-27 05:46:12+00	aeonicgnosis	31	f
205	5wf1pt	76	0.6940	http://i.imgur.com/esV9QNR.png	your post isn't about the oscars?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf1pt/your_post_isnt_about_the_oscars/	2017-02-27 05:44:17+00	TheFuckerUpperOfShit	76	f
206	5wf2kj	25	0.8892	https://i.redd.it/c3zlr5eh9ciy.jpg	This is crazy	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf2kj/this_is_crazy/	2017-02-27 05:50:12+00	Radicle_Pass_A_Fist	25	f
207	5wf36u	92	0.6775	http://imgur.com/hA8b0rr	To the people who made La La Land possible	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf36u/to_the_people_who_made_la_la_land_possible/	2017-02-27 05:54:16+00	BrightenthatIdea	92	f
208	5wf4dn	94	0.6117	https://i.imgflip.com/1kespt.jpg	You can always turn your life around	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf4dn/you_can_always_turn_your_life_around/	2017-02-27 06:01:16+00	emoposer	94	f
209	5wf4lz	8	0.6391	https://i.imgflip.com/1kesqe.jpg	Credit where credit is due...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf4lz/credit_where_credit_is_due/	2017-02-27 06:02:39+00	The_estimator_is_in	8	f
210	5wf5yi	12	0.6539	http://imgur.com/1vJB2o1	Tonight in Hollywood...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf5yi/tonight_in_hollywood/	2017-02-27 06:11:38+00	GrandDaddyBlockchain	12	f
211	5wf5qj	110	0.5167	https://i.imgflip.com/1ket5d.jpg	Friend borrowed some money and paid me back with $50 Bills	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf5qj/friend_borrowed_some_money_and_paid_me_back_with/	2017-02-27 06:10:11+00	Squeezer999	111	f
212	5wf557	88	0.5299	https://i.redd.it/w838wgygcciy.png	If only...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf557/if_only/	2017-02-27 06:06:02+00	yoususfanwer	88	f
213	5wf6xy	33	0.7648	http://i.imgur.com/wjsCKqS.jpg	And the 2017 Oscar for Best Picture goes to...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf6xy/and_the_2017_oscar_for_best_picture_goes_to/	2017-02-27 06:18:21+00	HussDelRio	33	f
214	5wf6ph	107	0.5188	https://imgflip.com/i/1ketg5#fxMgQcDxm1yW6rSm.16	The Oscars need to have a surprise guest appearance to end the show	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf6ph/the_oscars_need_to_have_a_surprise_guest/	2017-02-27 06:16:35+00	furythree	107	f
215	5wf8y6	88	0.6147	https://i.redd.it/er9s6k1hgciy.jpg	2017 be like....	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf8y6/2017_be_like/	2017-02-27 06:32:04+00	sieteunoseis	88	f
216	5wf8k9	87	0.6513	https://i.redd.it/bdl6k2xogciy.jpg	It's all part of the plan	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf8k9/its_all_part_of_the_plan/	2017-02-27 06:29:35+00	Zedlol18	87	f
217	5wf9kt	64	0.5507	https://i.reddituploads.com/809963b92be84079a789962c87bb4f28?fit=max&h=1536&w=1536&s=052f01bcf72d3e2dd80379895ab80772	You would think reading what's in an envelope would be easy...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wf9kt/you_would_think_reading_whats_in_an_envelope/	2017-02-27 06:36:25+00	HackTheKnife	64	f
218	5wfbqd	69	0.8177	http://i.imgur.com/BJo3NL8.jpg	After years of being snubbed!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfbqd/after_years_of_being_snubbed/	2017-02-27 06:52:46+00	IHaeTypos	69	f
219	5wfbp0	32	0.5242	http://imgur.com/cXY8Npe	When you take credit for something you didn't do	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfbp0/when_you_take_credit_for_something_you_didnt_do/	2017-02-27 06:52:24+00	throel	32	f
220	5wfchd	25	0.8945	https://i.imgflip.com/1keuyt.jpg	Am I the only one who feels this way?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfchd/am_i_the_only_one_who_feels_this_way/	2017-02-27 06:58:51+00	Downvotesohoy	25	f
221	5wfcc3	90	0.4840	http://imgur.com/PbVNG5e	How the Oscars try to win over people.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfcc3/how_the_oscars_try_to_win_over_people/	2017-02-27 06:57:34+00	Frestyla	90	f
222	5wfeb6	40	0.5696	https://i.redd.it/dftm6sgaociy.jpg	"La La Land!"	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfeb6/la_la_land/	2017-02-27 07:12:28+00	checkyourdiction	40	f
223	5wfeul	88	0.5838	https://i.redd.it/vf7pnwjzociy.jpg	"La La Land!"	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfeul/la_la_land/	2017-02-27 07:16:19+00	checkyourdiction	88	f
224	5wfikj	49	0.5900	https://media.makeameme.org/created/well-i-will-xnf1ps.jpg	Gotta save that phone battery	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfikj/gotta_save_that_phone_battery/	2017-02-27 07:44:46+00	Haramu	49	f
225	5wfij8	104	0.4198	http://imgur.com/DxDDXhG	Was only gone from noon till 10pm, and i'm still lost	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfij8/was_only_gone_from_noon_till_10pm_and_im_still/	2017-02-27 07:44:28+00	JohnDeereWife	104	f
226	5wfkxq	14	0.7276	http://imgur.com/K8S2beO	Oscars are were on last night?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfkxq/oscars_are_were_on_last_night/	2017-02-27 08:05:02+00	CantDanceSober	14	f
227	5wflpl	69	0.7694	http://imgur.com/JrGfMz7	What a colossal mixup.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wflpl/what_a_colossal_mixup/	2017-02-27 08:11:18+00	Uban	69	f
228	5wfoza	88	0.5131	http://www.livememe.com/oixo6xt	Pizzagaters	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfoza/pizzagaters/	2017-02-27 08:40:10+00	chinagreenelvis	88	f
229	5wfoow	87	0.5363	http://i.imgur.com/CO1pld4.jpg	It's the 21st century for god sakes!!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wfoow/its_the_21st_century_for_god_sakes/	2017-02-27 08:37:34+00	ItsDarts	87	f
230	5wft3b	80	0.3952	https://i.imgur.com/FvVufBJ.png	YFW: The hot fart you laid in bed seeps out from under the covers.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/5wft3b/yfw_the_hot_fart_you_laid_in_bed_seeps_out_from/	2017-02-27 09:16:17+00	B_Sack	80	f
\.


--
-- Name: reddit_redditpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reddit_redditpost_id_seq', 230, true);


--
-- Data for Name: reddit_redditpostsnapshot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reddit_redditpostsnapshot (id, date_crawled, score, gilded, reddit_post_id, num_comments, rank) FROM stdin;
1	2017-02-26 10:53:02.472853+00	29053	t	2	871	2
2	2017-02-26 10:53:04.730706+00	501	f	3	13	3
3	2017-02-26 10:53:06.633745+00	821	f	4	27	4
4	2017-02-26 10:53:08.348053+00	14152	f	5	818	5
5	2017-02-26 10:53:10.04413+00	2448	f	6	84	6
6	2017-02-26 10:53:11.984017+00	2921	f	7	224	7
7	2017-02-26 10:53:13.752183+00	435	f	8	25	8
8	2017-02-26 10:53:15.367534+00	1111	f	9	38	9
9	2017-02-26 10:53:18.632625+00	93	f	10	12	11
10	2017-02-26 10:53:22.256713+00	84	f	11	5	13
11	2017-02-26 10:53:24.129201+00	468	f	12	17	14
12	2017-02-26 10:53:27.172524+00	40	f	13	4	16
13	2017-02-26 10:53:29.230269+00	322	f	14	18	17
14	2017-02-26 10:53:31.46238+00	9541	f	15	1040	18
15	2017-02-26 10:53:33.316762+00	216	f	16	13	19
16	2017-02-26 10:53:35.197854+00	28	f	17	5	20
17	2017-02-26 10:53:37.293529+00	5069	f	18	94	21
18	2017-02-26 10:53:39.087964+00	49	f	19	2	22
19	2017-02-26 10:53:40.802287+00	18	f	20	7	23
20	2017-02-26 10:53:42.777488+00	1303	f	21	12	24
21	2017-02-26 10:53:44.446095+00	2758	f	22	145	25
22	2017-02-26 10:53:48.144095+00	214	f	23	5	27
23	2017-02-26 10:53:49.987829+00	123	f	24	4	28
24	2017-02-26 10:53:51.931328+00	4447	f	25	290	29
25	2017-02-26 10:53:53.829736+00	25	f	26	5	30
26	2017-02-26 10:53:56.904155+00	6804	f	27	711	32
27	2017-02-26 10:53:58.708863+00	21820	f	28	1769	33
28	2017-02-26 10:54:00.631792+00	72	f	29	9	34
29	2017-02-26 10:54:02.41091+00	38	f	30	4	35
30	2017-02-26 10:54:04.671382+00	7	f	31	1	36
31	2017-02-26 10:54:06.509201+00	119	f	32	4	37
32	2017-02-26 10:54:08.404073+00	70	f	33	7	38
33	2017-02-26 10:54:10.399182+00	17	f	34	1	39
34	2017-02-26 10:54:12.266202+00	30	f	35	2	40
35	2017-02-26 10:54:14.124982+00	5187	f	36	190	41
36	2017-02-26 10:54:15.77909+00	647	f	37	27	42
37	2017-02-26 10:54:17.574198+00	113	f	38	1	43
38	2017-02-26 10:54:19.248422+00	1453	f	39	38	44
39	2017-02-26 10:54:22.735009+00	6389	f	40	105	46
40	2017-02-26 10:54:24.511227+00	94	f	41	9	47
41	2017-02-26 10:54:26.316926+00	2783	f	42	13	48
42	2017-02-26 10:54:29.486428+00	36	f	43	12	50
43	2017-02-26 10:54:31.261407+00	39	f	44	3	51
44	2017-02-26 10:54:33.152934+00	49	f	45	2	52
45	2017-02-26 10:54:35.02095+00	11	f	46	0	53
46	2017-02-26 10:54:36.975855+00	65	f	47	1	54
47	2017-02-26 10:54:38.834307+00	18079	f	48	887	55
48	2017-02-26 10:54:40.333504+00	9	f	49	1	56
49	2017-02-26 10:54:43.597909+00	5	f	50	1	58
50	2017-02-26 10:54:45.407079+00	16	f	51	1	59
51	2017-02-26 10:54:47.181709+00	73	f	52	13	60
52	2017-02-26 10:54:49.001025+00	58	f	53	28	61
53	2017-02-26 10:54:50.931415+00	44	f	54	8	62
54	2017-02-26 10:54:52.706176+00	36	f	55	1	63
55	2017-02-26 10:54:54.444626+00	5	f	56	32	64
56	2017-02-26 10:54:56.275823+00	5	f	57	1	65
57	2017-02-26 10:54:58.242258+00	363	f	58	22	66
58	2017-02-26 10:55:00.054162+00	17	f	59	3	67
59	2017-02-26 10:55:01.895059+00	7	f	60	3	68
60	2017-02-26 10:55:06.083409+00	9	f	61	1	70
61	2017-02-26 10:55:07.936164+00	4	f	62	0	71
62	2017-02-26 10:55:09.713318+00	32311	f	63	1969	72
63	2017-02-26 10:55:12.449954+00	6	f	64	0	74
64	2017-02-26 10:55:14.064009+00	8	f	65	1	75
65	2017-02-26 10:55:15.658237+00	20	f	66	1	76
66	2017-02-26 10:55:17.482722+00	1221	f	67	47	77
67	2017-02-26 10:55:19.608108+00	9	f	68	0	78
68	2017-02-26 10:55:21.182021+00	90	f	69	15	79
69	2017-02-26 10:55:24.910504+00	4	f	70	0	81
70	2017-02-26 10:55:26.665901+00	1	f	71	0	82
71	2017-02-26 10:55:28.460355+00	383	f	72	12	83
72	2017-02-26 10:55:30.29474+00	145	f	73	8	84
73	2017-02-26 10:55:32.009376+00	2079	f	74	24	85
74	2017-02-26 10:55:33.812721+00	211	f	75	7	86
75	2017-02-26 10:55:35.879372+00	0	f	76	3	87
76	2017-02-26 10:55:38.051688+00	20	f	77	0	88
77	2017-02-26 10:55:41.337707+00	1762	f	78	35	90
78	2017-02-26 10:55:43.183415+00	3204	f	79	180	91
79	2017-02-26 10:55:45.228632+00	9	f	80	5	92
80	2017-02-26 10:55:46.88841+00	4083	f	81	147	93
81	2017-02-26 10:55:48.830761+00	11	f	82	10	94
82	2017-02-26 10:55:50.742552+00	4	f	83	5	95
83	2017-02-26 10:55:52.441348+00	10	f	84	3	96
84	2017-02-26 10:55:54.197562+00	148	f	85	26	97
85	2017-02-26 10:55:56.01238+00	1417	f	86	20	98
86	2017-02-26 10:55:57.740212+00	6	f	87	3	99
87	2017-02-26 11:02:58.606515+00	29065	t	2	871	2
88	2017-02-26 11:02:58.685233+00	513	f	3	13	3
89	2017-02-26 11:02:58.711359+00	819	f	4	27	4
90	2017-02-26 11:02:58.726989+00	14150	f	5	818	5
91	2017-02-26 11:02:58.741284+00	2447	f	6	84	6
92	2017-02-26 11:02:58.756886+00	2923	f	7	224	7
93	2017-02-26 11:02:58.771545+00	439	f	8	25	8
94	2017-02-26 11:02:58.786876+00	1116	f	9	38	9
95	2017-02-26 11:03:00.244553+00	94	f	10	12	11
96	2017-02-26 11:03:02.003901+00	87	f	11	5	13
97	2017-02-26 11:03:02.070717+00	465	f	12	17	14
98	2017-02-26 11:03:03.396322+00	42	f	13	4	16
99	2017-02-26 11:03:03.419001+00	323	f	14	18	17
100	2017-02-26 11:03:03.433425+00	9546	f	15	1040	18
101	2017-02-26 11:03:03.448461+00	212	f	16	13	19
102	2017-02-26 11:03:03.463391+00	27	f	17	5	20
103	2017-02-26 11:03:03.478489+00	5070	f	18	94	21
104	2017-02-26 11:03:03.493452+00	51	f	19	2	22
105	2017-02-26 11:03:03.508547+00	1313	f	21	12	23
106	2017-02-26 11:03:03.523581+00	2762	f	22	146	24
107	2017-02-26 11:03:03.538685+00	16	f	20	7	25
108	2017-02-26 11:03:05.168351+00	216	f	23	5	27
109	2017-02-26 11:03:05.223735+00	127	f	24	4	28
110	2017-02-26 11:03:05.238517+00	4450	f	25	290	29
111	2017-02-26 11:03:05.253249+00	25	f	26	5	30
112	2017-02-26 11:03:06.660099+00	6802	f	27	711	32
113	2017-02-26 11:03:06.727473+00	21826	f	28	1769	33
114	2017-02-26 11:03:06.742438+00	70	f	29	9	34
115	2017-02-26 11:03:06.757207+00	41	f	30	4	35
116	2017-02-26 11:03:06.77239+00	8	f	31	1	36
117	2017-02-26 11:03:06.787129+00	117	f	32	4	37
118	2017-02-26 11:03:06.80249+00	73	f	33	7	38
119	2017-02-26 11:03:06.817199+00	30	f	35	2	39
120	2017-02-26 11:03:06.832485+00	17	f	34	1	40
121	2017-02-26 11:03:06.847219+00	5178	f	36	190	41
122	2017-02-26 11:03:06.862512+00	644	f	37	27	42
123	2017-02-26 11:03:06.877172+00	109	f	38	1	43
124	2017-02-26 11:03:06.892552+00	1461	f	39	38	44
125	2017-02-26 11:03:08.898924+00	6387	f	40	105	46
126	2017-02-26 11:03:09.04213+00	93	f	41	9	47
127	2017-02-26 11:03:09.058945+00	2787	f	42	13	48
128	2017-02-26 11:03:10.900897+00	37	f	43	12	50
129	2017-02-26 11:03:10.926321+00	40	f	44	3	51
130	2017-02-26 11:03:10.937717+00	47	f	45	2	52
131	2017-02-26 11:03:10.953348+00	8	f	46	0	53
132	2017-02-26 11:03:10.967699+00	66	f	47	1	54
133	2017-02-26 11:03:10.983295+00	18090	f	48	887	55
134	2017-02-26 11:03:10.997567+00	9	f	49	1	56
135	2017-02-26 11:03:12.546825+00	4	f	50	1	58
136	2017-02-26 11:03:12.612535+00	16	f	51	1	59
137	2017-02-26 11:03:12.628146+00	66	f	52	13	60
138	2017-02-26 11:03:12.642142+00	6	f	56	32	61
139	2017-02-26 11:03:12.657928+00	57	f	53	28	62
140	2017-02-26 11:03:12.672064+00	42	f	54	8	63
141	2017-02-26 11:03:12.687865+00	2	f	71	0	64
142	2017-02-26 11:03:12.702209+00	40	f	55	1	65
143	2017-02-26 11:03:12.717996+00	3	f	57	1	66
144	2017-02-26 11:03:12.732096+00	365	f	58	22	67
145	2017-02-26 11:03:12.748022+00	17	f	59	3	68
146	2017-02-26 11:03:12.768147+00	8	f	60	3	69
147	2017-02-26 11:03:14.370977+00	8	f	61	1	71
148	2017-02-26 11:03:14.396714+00	5	f	62	0	72
149	2017-02-26 11:03:14.412671+00	32311	f	63	1971	73
150	2017-02-26 11:03:15.754239+00	6	f	64	0	75
151	2017-02-26 11:03:15.830836+00	7	f	65	1	76
152	2017-02-26 11:03:15.846752+00	18	f	66	1	77
153	2017-02-26 11:03:15.86044+00	1221	f	67	47	78
154	2017-02-26 11:03:15.876508+00	8	f	68	0	79
155	2017-02-26 11:03:15.890403+00	86	f	69	15	80
156	2017-02-26 11:03:17.20533+00	5	f	70	0	82
157	2017-02-26 11:03:17.274149+00	384	f	72	12	83
158	2017-02-26 11:03:17.290246+00	146	f	73	8	84
159	2017-02-26 11:03:17.303836+00	2079	f	74	24	85
160	2017-02-26 11:03:17.313855+00	216	f	75	7	86
161	2017-02-26 11:03:17.323829+00	0	f	76	3	87
162	2017-02-26 11:03:17.33375+00	19	f	77	0	88
163	2017-02-26 11:03:18.474387+00	1767	f	78	35	90
164	2017-02-26 11:03:18.546228+00	3207	f	79	180	91
165	2017-02-26 11:03:18.557164+00	8	f	80	5	92
166	2017-02-26 11:03:18.573633+00	4083	f	81	147	93
167	2017-02-26 11:03:18.587156+00	12	f	82	10	94
168	2017-02-26 11:03:18.597056+00	2	f	83	5	95
169	2017-02-26 11:03:18.606991+00	10	f	84	3	96
170	2017-02-26 11:03:18.616954+00	150	f	85	26	97
171	2017-02-26 11:03:18.626909+00	1422	f	86	20	98
172	2017-02-26 11:03:18.636877+00	3	f	87	3	99
173	2017-02-26 11:12:58.391195+00	29074	t	2	871	2
174	2017-02-26 11:12:58.583432+00	518	f	3	13	3
175	2017-02-26 11:12:58.599364+00	833	f	4	27	4
176	2017-02-26 11:12:58.613778+00	14164	f	5	818	5
177	2017-02-26 11:12:58.629392+00	2445	f	6	84	6
178	2017-02-26 11:12:58.643595+00	2919	f	7	224	7
179	2017-02-26 11:12:58.659109+00	439	f	8	25	8
180	2017-02-26 11:12:58.673696+00	1116	f	9	38	9
181	2017-02-26 11:13:00.102166+00	96	f	10	12	11
182	2017-02-26 11:13:02.037657+00	84	f	11	5	13
183	2017-02-26 11:13:02.110674+00	462	f	12	17	14
184	2017-02-26 11:13:02.123159+00	39	f	13	4	15
185	2017-02-26 11:13:03.44925+00	331	f	14	18	17
186	2017-02-26 11:13:03.555396+00	9534	f	15	1040	18
187	2017-02-26 11:13:03.584189+00	215	f	16	13	19
188	2017-02-26 11:13:03.596773+00	24	f	17	6	20
189	2017-02-26 11:13:03.611685+00	5068	f	18	94	21
190	2017-02-26 11:13:03.626665+00	51	f	19	2	22
191	2017-02-26 11:13:03.641629+00	1304	f	21	12	23
192	2017-02-26 11:13:03.656676+00	2758	f	22	147	24
193	2017-02-26 11:13:03.671758+00	17	f	20	7	25
194	2017-02-26 11:13:05.432432+00	126	f	24	4	27
195	2017-02-26 11:13:05.738225+00	214	f	23	5	28
196	2017-02-26 11:13:05.752647+00	4447	f	25	290	29
197	2017-02-26 11:13:05.767336+00	26	f	26	5	30
198	2017-02-26 11:13:07.121096+00	6804	f	27	711	32
199	2017-02-26 11:13:07.193491+00	8	f	31	1	33
200	2017-02-26 11:13:07.206628+00	21827	f	28	1771	34
201	2017-02-26 11:13:07.223479+00	73	f	29	9	35
202	2017-02-26 11:13:07.236302+00	42	f	30	4	36
203	2017-02-26 11:13:07.250881+00	114	f	32	4	37
204	2017-02-26 11:13:07.266278+00	72	f	33	7	38
205	2017-02-26 11:13:07.280782+00	32	f	35	2	39
206	2017-02-26 11:13:07.296195+00	16	f	34	1	40
207	2017-02-26 11:13:07.311095+00	5184	f	36	190	41
208	2017-02-26 11:13:07.326327+00	643	f	37	27	42
209	2017-02-26 11:13:07.340896+00	110	f	38	1	43
210	2017-02-26 11:13:07.356347+00	1458	f	39	38	44
211	2017-02-26 11:13:08.939935+00	6400	f	40	105	46
212	2017-02-26 11:13:09.018185+00	96	f	41	9	47
213	2017-02-26 11:13:09.031215+00	2792	f	42	13	48
214	2017-02-26 11:13:10.595927+00	35	f	43	12	50
215	2017-02-26 11:13:10.680491+00	40	f	44	3	51
216	2017-02-26 11:13:10.6956+00	49	f	45	2	52
217	2017-02-26 11:13:10.712203+00	9	f	46	0	53
218	2017-02-26 11:13:10.725494+00	69	f	47	1	54
219	2017-02-26 11:13:10.739762+00	18083	f	48	887	55
220	2017-02-26 11:13:10.755553+00	10	f	49	1	56
221	2017-02-26 11:13:12.331664+00	4	f	50	1	58
222	2017-02-26 11:13:12.404313+00	15	f	51	1	59
223	2017-02-26 11:13:12.419951+00	70	f	52	13	60
224	2017-02-26 11:13:12.436269+00	7	f	56	32	61
225	2017-02-26 11:13:12.449888+00	59	f	53	28	62
226	2017-02-26 11:13:12.463967+00	46	f	54	8	63
227	2017-02-26 11:13:12.479966+00	2	f	71	1	64
228	2017-02-26 11:13:12.4941+00	9	f	60	3	65
229	2017-02-26 11:13:12.509946+00	36	f	55	1	66
230	2017-02-26 11:13:12.52401+00	9	f	61	1	67
231	2017-02-26 11:13:12.540023+00	4	f	57	1	68
232	2017-02-26 11:13:12.554057+00	365	f	58	22	69
233	2017-02-26 11:13:12.569977+00	16	f	59	3	70
234	2017-02-26 11:13:14.10514+00	6	f	62	0	72
235	2017-02-26 11:13:14.308278+00	32308	f	63	1972	73
236	2017-02-26 11:13:15.657989+00	6	f	64	0	75
237	2017-02-26 11:13:15.740772+00	7	f	65	1	76
238	2017-02-26 11:13:15.755238+00	18	f	66	1	77
239	2017-02-26 11:13:15.768927+00	1218	f	67	47	78
240	2017-02-26 11:13:15.785033+00	8	f	68	0	79
241	2017-02-26 11:13:15.79876+00	88	f	69	15	80
242	2017-02-26 11:13:17.085176+00	5	f	70	0	82
243	2017-02-26 11:13:17.108731+00	380	f	72	12	83
244	2017-02-26 11:13:17.122617+00	144	f	73	8	84
245	2017-02-26 11:13:17.138608+00	2085	f	74	24	85
246	2017-02-26 11:13:17.152601+00	216	f	75	7	86
247	2017-02-26 11:13:17.168376+00	0	f	76	3	87
248	2017-02-26 11:13:17.182304+00	22	f	77	0	88
249	2017-02-26 11:13:18.362012+00	1765	f	78	35	90
250	2017-02-26 11:13:18.421904+00	3209	f	79	180	91
251	2017-02-26 11:13:18.435807+00	7	f	80	5	92
252	2017-02-26 11:13:18.451654+00	4079	f	81	147	93
253	2017-02-26 11:13:18.465688+00	9	f	82	10	94
254	2017-02-26 11:13:18.481572+00	1	f	83	5	95
255	2017-02-26 11:13:18.495708+00	12	f	84	3	96
256	2017-02-26 11:13:18.511741+00	143	f	85	26	97
257	2017-02-26 11:13:18.525727+00	1418	f	86	20	98
258	2017-02-26 11:13:18.539185+00	4	f	87	3	99
259	2017-02-26 11:22:58.402952+00	29080	t	2	871	2
260	2017-02-26 11:22:58.490281+00	522	f	3	13	3
261	2017-02-26 11:22:58.507354+00	838	f	4	27	4
262	2017-02-26 11:22:58.523581+00	14167	f	5	820	5
263	2017-02-26 11:22:58.537071+00	2448	f	6	84	6
264	2017-02-26 11:22:58.551082+00	2920	f	7	224	7
265	2017-02-26 11:22:58.567108+00	445	f	8	25	8
266	2017-02-26 11:22:58.580964+00	1123	f	9	38	9
267	2017-02-26 11:23:00.051882+00	105	f	10	12	11
268	2017-02-26 11:23:01.830026+00	87	f	11	5	13
269	2017-02-26 11:23:01.85473+00	473	f	12	17	14
270	2017-02-26 11:23:01.86984+00	43	f	13	4	15
271	2017-02-26 11:23:03.171803+00	329	f	14	18	17
272	2017-02-26 11:23:03.259541+00	9546	f	15	1040	18
273	2017-02-26 11:23:03.273202+00	212	f	16	13	19
274	2017-02-26 11:23:03.289264+00	27	f	17	6	20
275	2017-02-26 11:23:03.303103+00	5068	f	18	94	21
276	2017-02-26 11:23:03.319203+00	51	f	19	2	22
277	2017-02-26 11:23:03.333009+00	1308	f	21	12	23
278	2017-02-26 11:23:03.349096+00	2764	f	22	147	24
279	2017-02-26 11:23:03.363037+00	19	f	20	7	25
280	2017-02-26 11:23:04.919792+00	129	f	24	4	27
281	2017-02-26 11:23:05.168911+00	212	f	23	5	28
282	2017-02-26 11:23:05.184186+00	4454	f	25	290	29
283	2017-02-26 11:23:05.197991+00	25	f	26	5	30
284	2017-02-26 11:23:06.515506+00	6792	f	27	711	32
285	2017-02-26 11:23:06.581792+00	9	f	31	1	33
286	2017-02-26 11:23:06.597836+00	21825	f	28	1771	34
287	2017-02-26 11:23:06.611603+00	71	f	29	9	35
288	2017-02-26 11:23:06.627624+00	38	f	30	4	36
289	2017-02-26 11:23:06.641655+00	121	f	32	4	37
290	2017-02-26 11:23:06.657549+00	74	f	33	7	38
291	2017-02-26 11:23:06.671449+00	33	f	35	2	39
292	2017-02-26 11:23:06.691508+00	18	f	34	1	40
293	2017-02-26 11:23:06.706739+00	5185	f	36	190	41
294	2017-02-26 11:23:06.721362+00	651	f	37	27	42
295	2017-02-26 11:23:06.736582+00	107	f	38	1	43
296	2017-02-26 11:23:06.751259+00	1462	f	39	38	44
297	2017-02-26 11:23:08.365007+00	6390	f	40	105	46
298	2017-02-26 11:23:08.392546+00	92	f	41	9	47
299	2017-02-26 11:23:08.406034+00	2786	f	42	13	48
300	2017-02-26 11:23:09.812495+00	37	f	43	12	50
301	2017-02-26 11:23:09.87998+00	42	f	44	3	51
302	2017-02-26 11:23:09.895872+00	54	f	45	2	52
303	2017-02-26 11:23:09.909414+00	10	f	46	0	53
304	2017-02-26 11:23:09.925074+00	65	f	47	1	54
305	2017-02-26 11:23:09.939479+00	18085	f	48	887	55
306	2017-02-26 11:23:09.955176+00	9	f	49	1	56
307	2017-02-26 11:23:11.6058+00	3	f	50	1	58
308	2017-02-26 11:23:11.674579+00	14	f	51	1	59
309	2017-02-26 11:23:11.690582+00	70	f	52	13	60
310	2017-02-26 11:23:11.704288+00	8	f	56	32	61
311	2017-02-26 11:23:11.720428+00	59	f	53	28	62
312	2017-02-26 11:23:11.734193+00	43	f	54	8	63
313	2017-02-26 11:23:11.749994+00	7	f	60	3	64
314	2017-02-26 11:23:11.774401+00	39	f	55	1	65
315	2017-02-26 11:23:11.787728+00	8	f	61	1	66
316	2017-02-26 11:23:11.801754+00	6	f	57	1	67
317	2017-02-26 11:23:11.814445+00	367	f	58	22	68
318	2017-02-26 11:23:11.827745+00	16	f	59	3	69
319	2017-02-26 11:23:13.382838+00	7	f	62	0	71
320	2017-02-26 11:23:13.512959+00	32310	f	63	1972	72
321	2017-02-26 11:23:14.980579+00	3	f	64	0	74
322	2017-02-26 11:23:15.050512+00	6	f	65	1	75
323	2017-02-26 11:23:15.066909+00	16	f	66	1	76
324	2017-02-26 11:23:15.083372+00	1228	f	67	47	77
325	2017-02-26 11:23:15.2479+00	9	f	68	0	78
326	2017-02-26 11:23:15.276345+00	88	f	69	15	79
327	2017-02-26 11:23:16.671823+00	5	f	70	0	81
328	2017-02-26 11:23:16.741741+00	1	f	71	1	82
329	2017-02-26 11:23:16.758015+00	382	f	72	12	83
330	2017-02-26 11:23:16.775019+00	146	f	73	8	84
331	2017-02-26 11:23:16.790925+00	2077	f	74	24	85
332	2017-02-26 11:23:16.804867+00	216	f	75	7	86
333	2017-02-26 11:23:16.82076+00	0	f	76	3	87
334	2017-02-26 11:23:16.834707+00	19	f	77	0	88
335	2017-02-26 11:23:18.200944+00	1768	f	78	35	90
336	2017-02-26 11:23:18.275027+00	3206	f	79	180	91
337	2017-02-26 11:23:18.291511+00	10	f	80	5	92
338	2017-02-26 11:23:18.304498+00	4081	f	81	147	93
339	2017-02-26 11:23:18.318401+00	10	f	82	10	94
340	2017-02-26 11:23:18.334479+00	2	f	83	5	95
341	2017-02-26 11:23:18.348456+00	9	f	84	3	96
342	2017-02-26 11:23:18.364464+00	147	f	85	26	97
343	2017-02-26 11:23:18.378467+00	1422	f	86	20	98
344	2017-02-26 11:23:18.43517+00	4	f	87	3	99
345	2017-02-26 11:32:58.739467+00	29098	t	2	871	2
346	2017-02-26 11:32:58.821827+00	539	f	3	13	3
347	2017-02-26 11:32:58.882257+00	844	f	4	27	4
348	2017-02-26 11:32:58.89893+00	14159	f	5	822	5
349	2017-02-26 11:32:58.911469+00	2455	f	6	84	6
350	2017-02-26 11:32:58.921373+00	2927	f	7	224	7
351	2017-02-26 11:32:58.931359+00	440	f	8	25	8
352	2017-02-26 11:32:58.94114+00	1128	f	9	38	9
353	2017-02-26 11:33:00.292754+00	102	f	10	12	11
354	2017-02-26 11:33:06.840978+00	85	f	11	5	13
355	2017-02-26 11:33:06.911922+00	464	f	12	17	14
356	2017-02-26 11:33:06.921593+00	46	f	13	4	15
357	2017-02-26 11:33:08.328876+00	326	f	14	18	17
358	2017-02-26 11:33:08.405388+00	9535	f	15	1040	18
359	2017-02-26 11:33:08.435241+00	216	f	16	13	19
360	2017-02-26 11:33:08.44536+00	24	f	17	6	20
361	2017-02-26 11:33:08.455256+00	5068	f	18	94	21
362	2017-02-26 11:33:08.471665+00	51	f	19	2	22
363	2017-02-26 11:33:08.48525+00	1312	f	21	12	23
364	2017-02-26 11:33:08.495151+00	2756	f	22	147	24
365	2017-02-26 11:33:08.505128+00	17	f	20	7	25
366	2017-02-26 11:33:10.283534+00	131	f	24	4	27
367	2017-02-26 11:33:10.360818+00	212	f	23	5	28
368	2017-02-26 11:33:10.370634+00	4451	f	25	290	29
369	2017-02-26 11:33:10.380537+00	27	f	26	5	30
370	2017-02-26 11:33:11.692014+00	6798	f	27	711	32
371	2017-02-26 11:33:11.764313+00	9	f	31	1	33
372	2017-02-26 11:33:11.774126+00	21826	f	28	1772	34
373	2017-02-26 11:33:11.783963+00	72	f	29	9	35
374	2017-02-26 11:33:11.794203+00	36	f	30	4	36
375	2017-02-26 11:33:11.803796+00	120	f	32	4	37
376	2017-02-26 11:33:11.813811+00	74	f	33	7	38
377	2017-02-26 11:33:11.823878+00	35	f	35	2	39
378	2017-02-26 11:33:11.833902+00	18	f	34	1	40
379	2017-02-26 11:33:11.894751+00	5185	f	36	190	41
380	2017-02-26 11:33:11.904467+00	646	f	37	27	42
381	2017-02-26 11:33:11.914261+00	110	f	38	1	43
382	2017-02-26 11:33:11.924231+00	1464	f	39	38	44
383	2017-02-26 11:33:13.469845+00	6393	f	40	105	46
384	2017-02-26 11:33:13.550329+00	95	f	41	9	47
385	2017-02-26 11:33:13.578667+00	2783	f	42	13	48
386	2017-02-26 11:33:15.142022+00	35	f	43	12	50
387	2017-02-26 11:33:15.21312+00	43	f	44	3	51
388	2017-02-26 11:33:15.222569+00	52	f	45	2	52
389	2017-02-26 11:33:15.232428+00	8	f	46	0	53
390	2017-02-26 11:33:15.242524+00	68	f	47	1	54
391	2017-02-26 11:33:15.252441+00	18095	f	48	887	55
392	2017-02-26 11:33:15.262415+00	7	f	49	1	56
393	2017-02-26 11:33:16.803408+00	2	f	50	1	58
394	2017-02-26 11:33:16.876346+00	16	f	51	1	59
395	2017-02-26 11:33:16.927302+00	70	f	52	13	60
396	2017-02-26 11:33:16.936928+00	7	f	56	32	61
397	2017-02-26 11:33:16.947037+00	61	f	53	28	62
398	2017-02-26 11:33:16.95695+00	40	f	54	8	63
399	2017-02-26 11:33:16.966882+00	8	f	60	4	64
400	2017-02-26 11:33:16.976868+00	42	f	55	1	65
401	2017-02-26 11:33:16.986912+00	10	f	61	1	66
402	2017-02-26 11:33:16.996935+00	3	f	57	1	67
403	2017-02-26 11:33:17.010305+00	358	f	58	22	68
404	2017-02-26 11:33:17.025664+00	19	f	59	3	69
405	2017-02-26 11:33:18.742875+00	6	f	62	0	71
406	2017-02-26 11:33:18.882156+00	32315	f	63	1972	72
407	2017-02-26 11:33:20.183366+00	3	f	64	0	74
408	2017-02-26 11:33:20.255861+00	7	f	65	1	75
409	2017-02-26 11:33:20.265741+00	20	f	66	1	76
410	2017-02-26 11:33:20.275567+00	1221	f	67	47	77
411	2017-02-26 11:33:20.285481+00	11	f	68	0	78
412	2017-02-26 11:33:20.295498+00	93	f	69	15	79
413	2017-02-26 11:33:21.647302+00	5	f	70	0	81
414	2017-02-26 11:33:21.71958+00	1	f	71	1	82
415	2017-02-26 11:33:21.729433+00	386	f	72	12	83
416	2017-02-26 11:33:21.739381+00	144	f	73	8	84
417	2017-02-26 11:33:21.74927+00	2078	f	74	24	85
418	2017-02-26 11:33:21.759065+00	213	f	75	7	86
419	2017-02-26 11:33:21.768949+00	0	f	76	3	87
420	2017-02-26 11:33:21.778972+00	17	f	77	0	88
421	2017-02-26 11:33:22.930473+00	1764	f	78	35	90
422	2017-02-26 11:33:22.982659+00	3208	f	79	180	91
423	2017-02-26 11:33:22.992505+00	8	f	80	5	92
424	2017-02-26 11:33:23.002427+00	4075	f	81	147	93
425	2017-02-26 11:33:23.012336+00	9	f	82	11	94
426	2017-02-26 11:33:23.022287+00	5	f	83	5	95
427	2017-02-26 11:33:23.032165+00	10	f	84	3	96
428	2017-02-26 11:33:23.042194+00	151	f	85	26	97
429	2017-02-26 11:33:23.052058+00	1424	f	86	20	98
430	2017-02-26 11:33:23.062171+00	4	f	87	3	99
431	2017-02-26 11:42:59.006101+00	29110	t	2	872	2
432	2017-02-26 11:42:59.248744+00	554	f	3	13	3
433	2017-02-26 11:42:59.264692+00	861	f	4	28	4
434	2017-02-26 11:42:59.278239+00	14162	f	5	822	5
435	2017-02-26 11:42:59.288285+00	2453	f	6	84	6
436	2017-02-26 11:42:59.298265+00	2936	f	7	224	7
437	2017-02-26 11:42:59.308209+00	452	f	8	25	8
438	2017-02-26 11:42:59.318112+00	1126	f	9	38	9
439	2017-02-26 11:43:00.876682+00	101	f	10	12	11
440	2017-02-26 11:43:02.654651+00	47	f	13	4	13
441	2017-02-26 11:43:02.767243+00	86	f	11	5	14
442	2017-02-26 11:43:02.783772+00	466	f	12	17	15
443	2017-02-26 11:43:04.178725+00	327	f	14	18	17
444	2017-02-26 11:43:04.311629+00	9542	f	15	1040	18
445	2017-02-26 11:43:04.33787+00	213	f	16	13	19
446	2017-02-26 11:43:04.351437+00	26	f	17	6	20
447	2017-02-26 11:43:04.367834+00	5067	f	18	94	21
448	2017-02-26 11:43:04.381085+00	53	f	19	2	22
449	2017-02-26 11:43:04.397521+00	1310	f	21	12	23
450	2017-02-26 11:43:04.411299+00	2760	f	22	147	24
451	2017-02-26 11:43:04.427566+00	18	f	20	7	25
452	2017-02-26 11:43:06.158921+00	128	f	24	4	27
453	2017-02-26 11:43:06.226364+00	209	f	23	5	28
454	2017-02-26 11:43:06.242571+00	4452	f	25	290	29
455	2017-02-26 11:43:07.530278+00	6796	f	27	711	31
456	2017-02-26 11:43:07.599771+00	22	f	26	5	32
457	2017-02-26 11:43:07.615897+00	9	f	31	1	33
458	2017-02-26 11:43:07.629513+00	21827	f	28	1772	34
459	2017-02-26 11:43:07.645806+00	70	f	29	9	35
460	2017-02-26 11:43:07.659396+00	40	f	30	4	36
461	2017-02-26 11:43:07.696968+00	121	f	32	4	37
462	2017-02-26 11:43:07.719544+00	77	f	33	7	38
463	2017-02-26 11:43:07.729503+00	34	f	35	2	39
464	2017-02-26 11:43:07.739579+00	18	f	34	1	40
465	2017-02-26 11:43:07.749622+00	5183	f	36	190	41
466	2017-02-26 11:43:07.759683+00	653	f	37	27	42
467	2017-02-26 11:43:07.769579+00	112	f	38	1	43
468	2017-02-26 11:43:07.779621+00	1463	f	39	38	44
469	2017-02-26 11:43:09.418525+00	6390	f	40	105	46
470	2017-02-26 11:43:09.534779+00	93	f	41	9	47
471	2017-02-26 11:43:09.56119+00	2788	f	42	13	48
472	2017-02-26 11:43:11.191728+00	41	f	43	12	50
473	2017-02-26 11:43:11.25929+00	40	f	44	3	51
474	2017-02-26 11:43:11.274986+00	48	f	45	2	52
475	2017-02-26 11:43:11.288876+00	10	f	46	0	53
476	2017-02-26 11:43:11.304906+00	63	f	47	1	54
477	2017-02-26 11:43:11.318662+00	18085	f	48	887	55
478	2017-02-26 11:43:11.32861+00	10	f	49	1	56
479	2017-02-26 11:43:12.874808+00	3	f	50	1	58
480	2017-02-26 11:43:12.953715+00	15	f	51	1	59
481	2017-02-26 11:43:12.969658+00	71	f	52	13	60
482	2017-02-26 11:43:12.983586+00	9	f	56	32	61
483	2017-02-26 11:43:12.999537+00	60	f	53	28	62
484	2017-02-26 11:43:13.013503+00	43	f	54	8	63
485	2017-02-26 11:43:13.029439+00	11	f	60	4	64
486	2017-02-26 11:43:13.043522+00	42	f	55	1	65
487	2017-02-26 11:43:13.059488+00	9	f	61	1	66
488	2017-02-26 11:43:13.073564+00	4	f	57	1	67
489	2017-02-26 11:43:13.089497+00	362	f	58	22	68
490	2017-02-26 11:43:13.103557+00	17	f	59	3	69
491	2017-02-26 11:43:15.618366+00	6	f	62	0	71
492	2017-02-26 11:43:15.670732+00	32312	f	63	1971	72
493	2017-02-26 11:43:17.094415+00	7	f	64	0	74
494	2017-02-26 11:43:17.164566+00	6	f	65	1	75
495	2017-02-26 11:43:17.180135+00	18	f	66	1	76
496	2017-02-26 11:43:17.19441+00	1226	f	67	47	77
497	2017-02-26 11:43:17.209941+00	11	f	68	0	78
498	2017-02-26 11:43:17.224285+00	89	f	69	15	79
499	2017-02-26 11:43:18.397992+00	6	f	70	0	81
500	2017-02-26 11:43:18.478206+00	1	f	71	1	82
501	2017-02-26 11:43:18.493558+00	384	f	72	12	83
502	2017-02-26 11:43:18.507832+00	148	f	73	8	84
503	2017-02-26 11:43:18.523474+00	2081	f	74	24	85
504	2017-02-26 11:43:18.543966+00	217	f	75	7	86
505	2017-02-26 11:43:18.557806+00	0	f	76	3	87
506	2017-02-26 11:43:18.573372+00	21	f	77	0	88
507	2017-02-26 11:43:19.994799+00	1764	f	78	35	90
508	2017-02-26 11:43:20.082411+00	3203	f	79	180	91
509	2017-02-26 11:43:20.097505+00	7	f	80	5	92
510	2017-02-26 11:43:20.112857+00	4082	f	81	147	93
511	2017-02-26 11:43:20.127403+00	11	f	82	12	94
512	2017-02-26 11:43:20.14197+00	4	f	83	5	95
513	2017-02-26 11:43:20.157429+00	8	f	84	3	96
514	2017-02-26 11:43:20.171963+00	147	f	85	26	97
515	2017-02-26 11:43:20.187516+00	1427	f	86	20	98
516	2017-02-26 11:43:20.202092+00	5	f	87	3	99
517	2017-02-26 11:52:59.030756+00	29125	t	2	872	2
518	2017-02-26 11:52:59.181169+00	570	f	3	13	3
519	2017-02-26 11:52:59.206373+00	860	f	4	28	4
520	2017-02-26 11:52:59.21625+00	14172	f	5	822	5
521	2017-02-26 11:52:59.226242+00	2461	f	6	84	6
522	2017-02-26 11:52:59.236201+00	2927	f	7	224	7
523	2017-02-26 11:52:59.246476+00	450	f	8	25	8
524	2017-02-26 11:52:59.256159+00	1131	f	9	38	9
525	2017-02-26 11:53:00.613989+00	104	f	10	13	11
526	2017-02-26 11:53:02.854601+00	48	f	13	5	13
527	2017-02-26 11:53:02.927808+00	88	f	11	5	14
528	2017-02-26 11:53:02.943167+00	468	f	12	17	15
529	2017-02-26 11:53:04.299945+00	325	f	14	18	17
530	2017-02-26 11:53:04.36668+00	9538	f	15	1040	18
531	2017-02-26 11:53:04.379233+00	212	f	16	13	19
532	2017-02-26 11:53:04.389189+00	27	f	17	6	20
533	2017-02-26 11:53:04.39906+00	5071	f	18	94	21
534	2017-02-26 11:53:04.409022+00	52	f	19	2	22
535	2017-02-26 11:53:04.419051+00	1311	f	21	12	23
536	2017-02-26 11:53:04.429223+00	2764	f	22	147	24
537	2017-02-26 11:53:04.439057+00	17	f	20	7	25
538	2017-02-26 11:53:06.051973+00	127	f	24	4	27
539	2017-02-26 11:53:06.131813+00	214	f	23	5	28
540	2017-02-26 11:53:06.153427+00	4459	f	25	290	29
541	2017-02-26 11:53:07.445862+00	6794	f	27	711	31
542	2017-02-26 11:53:07.517679+00	25	f	26	5	32
543	2017-02-26 11:53:07.527413+00	9	f	31	1	33
544	2017-02-26 11:53:07.537364+00	21823	f	28	1772	34
545	2017-02-26 11:53:07.547307+00	73	f	29	9	35
546	2017-02-26 11:53:07.557205+00	38	f	30	4	36
547	2017-02-26 11:53:07.56724+00	118	f	32	4	37
548	2017-02-26 11:53:07.577168+00	74	f	33	7	38
549	2017-02-26 11:53:07.587088+00	33	f	35	2	39
550	2017-02-26 11:53:07.59711+00	16	f	34	1	40
551	2017-02-26 11:53:07.607148+00	5185	f	36	190	41
552	2017-02-26 11:53:07.617129+00	647	f	37	27	42
553	2017-02-26 11:53:07.627183+00	112	f	38	1	43
554	2017-02-26 11:53:07.637218+00	1456	f	39	38	44
555	2017-02-26 11:53:09.300931+00	6393	f	40	105	46
556	2017-02-26 11:53:09.392476+00	95	f	41	9	47
557	2017-02-26 11:53:09.402342+00	2785	f	42	13	48
558	2017-02-26 11:53:10.994031+00	39	f	43	12	50
559	2017-02-26 11:53:11.063653+00	42	f	44	3	51
560	2017-02-26 11:53:11.09621+00	47	f	45	2	52
561	2017-02-26 11:53:11.12666+00	9	f	46	0	53
562	2017-02-26 11:53:11.136416+00	63	f	47	1	54
563	2017-02-26 11:53:11.146464+00	18089	f	48	887	55
564	2017-02-26 11:53:11.156305+00	11	f	49	1	56
565	2017-02-26 11:53:12.711743+00	5	f	50	1	58
566	2017-02-26 11:53:12.780672+00	15	f	51	1	59
567	2017-02-26 11:53:12.928952+00	67	f	52	13	60
568	2017-02-26 11:53:12.940943+00	8	f	56	32	61
569	2017-02-26 11:53:12.956385+00	59	f	53	28	62
570	2017-02-26 11:53:12.970867+00	44	f	54	8	63
571	2017-02-26 11:53:12.9806+00	11	f	60	4	64
572	2017-02-26 11:53:13.004801+00	36	f	55	1	65
573	2017-02-26 11:53:13.018261+00	12	f	61	1	66
574	2017-02-26 11:53:13.028189+00	2	f	57	1	67
575	2017-02-26 11:53:13.038168+00	360	f	58	22	68
576	2017-02-26 11:53:13.048215+00	17	f	59	3	69
577	2017-02-26 11:53:14.626147+00	5	f	62	0	71
578	2017-02-26 11:53:14.713379+00	32316	f	63	1971	72
579	2017-02-26 11:53:16.138119+00	3	f	64	0	74
580	2017-02-26 11:53:18.708206+00	1	f	88	0	75
581	2017-02-26 11:53:18.73105+00	9	f	65	1	76
582	2017-02-26 11:53:18.743419+00	20	f	66	1	77
583	2017-02-26 11:53:18.75335+00	1225	f	67	47	78
584	2017-02-26 11:53:18.763333+00	8	f	68	0	79
585	2017-02-26 11:53:18.773236+00	87	f	69	15	80
586	2017-02-26 11:53:19.929618+00	5	f	70	0	82
587	2017-02-26 11:53:20.064707+00	1	f	71	1	83
588	2017-02-26 11:53:20.09394+00	378	f	72	12	84
589	2017-02-26 11:53:20.10714+00	148	f	73	8	85
590	2017-02-26 11:53:20.123958+00	2082	f	74	24	86
591	2017-02-26 11:53:20.136875+00	219	f	75	7	87
592	2017-02-26 11:53:20.14698+00	1	f	76	3	88
593	2017-02-26 11:53:20.156801+00	19	f	77	0	89
594	2017-02-26 11:53:21.353265+00	1764	f	78	35	91
595	2017-02-26 11:53:21.595699+00	3206	f	79	180	92
596	2017-02-26 11:53:21.62215+00	10	f	80	5	93
597	2017-02-26 11:53:21.640806+00	4077	f	81	147	94
598	2017-02-26 11:53:21.650925+00	10	f	82	13	95
599	2017-02-26 11:53:21.660667+00	3	f	83	5	96
600	2017-02-26 11:53:21.670582+00	10	f	84	3	97
601	2017-02-26 11:53:21.680488+00	150	f	85	26	98
602	2017-02-26 11:53:21.690536+00	1422	f	86	20	99
603	2017-02-26 12:02:59.992419+00	29137	t	2	872	2
604	2017-02-26 12:03:00.040198+00	585	f	3	13	3
605	2017-02-26 12:03:00.056425+00	867	f	4	28	4
606	2017-02-26 12:03:00.069704+00	14184	f	5	822	5
607	2017-02-26 12:03:00.079613+00	2467	f	6	84	6
608	2017-02-26 12:03:00.08956+00	2941	f	7	224	7
609	2017-02-26 12:03:00.099761+00	452	f	8	25	8
610	2017-02-26 12:03:00.111547+00	1129	f	9	38	9
611	2017-02-26 12:03:01.578201+00	113	f	10	13	11
612	2017-02-26 12:03:03.529992+00	48	f	13	5	13
613	2017-02-26 12:03:03.587359+00	88	f	11	5	14
614	2017-02-26 12:03:03.599584+00	468	f	12	17	15
615	2017-02-26 12:03:04.909433+00	327	f	14	18	17
616	2017-02-26 12:03:04.981197+00	9543	f	15	1040	18
617	2017-02-26 12:03:05.020733+00	214	f	16	13	19
618	2017-02-26 12:03:05.032941+00	26	f	17	7	20
619	2017-02-26 12:03:05.042974+00	52	f	19	2	21
620	2017-02-26 12:03:05.052887+00	5066	f	18	94	22
621	2017-02-26 12:03:05.062824+00	1313	f	21	12	23
622	2017-02-26 12:03:05.072706+00	2755	f	22	147	24
623	2017-02-26 12:03:05.082674+00	18	f	20	7	25
624	2017-02-26 12:03:06.676538+00	124	f	24	4	27
625	2017-02-26 12:03:06.757854+00	211	f	23	5	28
626	2017-02-26 12:03:06.767728+00	4454	f	25	290	29
627	2017-02-26 12:03:08.083758+00	6803	f	27	711	31
628	2017-02-26 12:03:08.151611+00	24	f	26	5	32
629	2017-02-26 12:03:08.168464+00	10	f	31	1	33
630	2017-02-26 12:03:08.181116+00	21827	f	28	1772	34
631	2017-02-26 12:03:08.191183+00	76	f	29	9	35
632	2017-02-26 12:03:08.201047+00	41	f	30	4	36
633	2017-02-26 12:03:08.211029+00	118	f	32	4	37
634	2017-02-26 12:03:08.221009+00	75	f	33	7	38
635	2017-02-26 12:03:08.231106+00	30	f	35	2	39
636	2017-02-26 12:03:08.240957+00	16	f	34	1	40
637	2017-02-26 12:03:08.250984+00	5193	f	36	190	41
638	2017-02-26 12:03:08.260938+00	646	f	37	27	42
639	2017-02-26 12:03:08.270937+00	106	f	38	1	43
640	2017-02-26 12:03:08.28098+00	1459	f	39	38	44
641	2017-02-26 12:03:09.879795+00	6400	f	40	105	46
642	2017-02-26 12:03:09.936278+00	92	f	41	9	47
643	2017-02-26 12:03:09.953185+00	3	f	88	0	48
644	2017-02-26 12:03:09.96598+00	2790	f	42	13	49
645	2017-02-26 12:03:11.564388+00	35	f	43	12	51
646	2017-02-26 12:03:11.630728+00	43	f	44	3	52
647	2017-02-26 12:03:11.647586+00	52	f	45	2	53
648	2017-02-26 12:03:11.660484+00	7	f	46	0	54
649	2017-02-26 12:03:11.670381+00	64	f	47	1	55
650	2017-02-26 12:03:11.680362+00	18082	f	48	887	56
651	2017-02-26 12:03:11.705879+00	11	f	49	1	57
652	2017-02-26 12:03:13.312386+00	16	f	51	1	59
653	2017-02-26 12:03:13.375224+00	70	f	52	13	60
654	2017-02-26 12:03:13.391778+00	7	f	56	32	61
655	2017-02-26 12:03:13.404864+00	56	f	53	28	62
656	2017-02-26 12:03:13.414939+00	42	f	54	8	63
657	2017-02-26 12:03:13.424869+00	9	f	60	4	64
658	2017-02-26 12:03:13.43491+00	38	f	55	1	65
659	2017-02-26 12:03:13.444782+00	3	f	50	1	66
660	2017-02-26 12:03:13.454876+00	12	f	61	1	67
661	2017-02-26 12:03:13.464861+00	361	f	58	22	68
662	2017-02-26 12:03:13.474818+00	15	f	59	3	69
663	2017-02-26 12:03:15.136547+00	7	f	62	0	71
664	2017-02-26 12:03:15.196671+00	32313	f	63	1971	72
665	2017-02-26 12:03:16.650449+00	3	f	57	1	74
666	2017-02-26 12:03:16.760093+00	6	f	64	0	75
667	2017-02-26 12:03:16.773944+00	7	f	65	1	76
668	2017-02-26 12:03:16.790242+00	18	f	66	1	77
669	2017-02-26 12:03:16.803901+00	1223	f	67	47	78
670	2017-02-26 12:03:16.870758+00	7	f	68	0	79
671	2017-02-26 12:03:16.996018+00	95	f	69	15	80
672	2017-02-26 12:03:18.391947+00	4	f	70	0	82
673	2017-02-26 12:03:18.464885+00	0	f	71	1	83
674	2017-02-26 12:03:18.478359+00	382	f	72	12	84
675	2017-02-26 12:03:18.494634+00	143	f	73	8	85
676	2017-02-26 12:03:18.508345+00	2080	f	74	24	86
677	2017-02-26 12:03:18.524476+00	216	f	75	7	87
678	2017-02-26 12:03:18.538228+00	0	f	76	3	88
679	2017-02-26 12:03:18.554478+00	15	f	77	0	89
680	2017-02-26 12:03:19.825294+00	1771	f	78	35	91
681	2017-02-26 12:03:19.918655+00	3210	f	79	180	92
682	2017-02-26 12:03:19.939342+00	7	f	80	5	93
683	2017-02-26 12:03:19.951912+00	4075	f	81	147	94
684	2017-02-26 12:03:19.967977+00	9	f	82	13	95
685	2017-02-26 12:03:19.981874+00	4	f	83	5	96
686	2017-02-26 12:03:19.998035+00	12	f	84	3	97
687	2017-02-26 12:03:20.012047+00	146	f	85	26	98
688	2017-02-26 12:03:20.028164+00	1421	f	86	20	99
689	2017-02-26 12:13:00.170438+00	29157	t	2	872	2
690	2017-02-26 12:13:00.255798+00	606	f	3	13	3
691	2017-02-26 12:13:00.270167+00	878	f	4	28	4
692	2017-02-26 12:13:00.284836+00	14178	f	5	822	5
693	2017-02-26 12:13:00.300047+00	2460	f	6	85	6
694	2017-02-26 12:13:00.314794+00	2937	f	7	226	7
695	2017-02-26 12:13:00.330041+00	451	f	8	25	8
696	2017-02-26 12:13:00.344735+00	1139	f	9	38	9
697	2017-02-26 12:13:01.703283+00	107	f	10	13	11
698	2017-02-26 12:13:03.606317+00	51	f	13	5	13
699	2017-02-26 12:13:03.749252+00	93	f	11	6	14
700	2017-02-26 12:13:03.769059+00	474	f	12	18	15
701	2017-02-26 12:13:05.138609+00	327	f	14	18	17
702	2017-02-26 12:13:05.248099+00	29	f	17	7	18
703	2017-02-26 12:13:05.263008+00	9546	f	15	1040	19
704	2017-02-26 12:13:05.277682+00	216	f	16	13	20
705	2017-02-26 12:13:05.292665+00	55	f	19	2	21
706	2017-02-26 12:13:05.307391+00	5077	f	18	94	22
707	2017-02-26 12:13:05.322626+00	17	f	20	7	23
708	2017-02-26 12:13:05.337311+00	1311	f	21	12	24
709	2017-02-26 12:13:05.352674+00	2754	f	22	147	25
710	2017-02-26 12:13:07.023138+00	7	f	88	1	27
711	2017-02-26 12:13:07.092455+00	130	f	24	4	28
712	2017-02-26 12:13:07.107102+00	213	f	23	5	29
713	2017-02-26 12:13:07.121822+00	4454	f	25	290	30
714	2017-02-26 12:13:07.137095+00	10	f	31	1	31
715	2017-02-26 12:13:07.152085+00	24	f	26	5	32
716	2017-02-26 12:13:08.454165+00	6796	f	27	711	34
717	2017-02-26 12:13:08.526308+00	21821	f	28	1772	35
718	2017-02-26 12:13:08.541214+00	45	f	30	4	36
719	2017-02-26 12:13:08.555923+00	70	f	29	9	37
720	2017-02-26 12:13:08.570992+00	121	f	32	4	38
721	2017-02-26 12:13:08.585773+00	72	f	33	7	39
722	2017-02-26 12:13:08.600949+00	18	f	34	1	40
723	2017-02-26 12:13:08.61579+00	35	f	35	2	41
724	2017-02-26 12:13:08.655949+00	5182	f	36	190	42
725	2017-02-26 12:13:10.264703+00	647	f	37	27	44
726	2017-02-26 12:13:10.360961+00	106	f	38	1	45
727	2017-02-26 12:13:10.375866+00	1459	f	39	38	46
728	2017-02-26 12:13:10.390574+00	6393	f	40	105	47
729	2017-02-26 12:13:10.40573+00	95	f	41	9	48
730	2017-02-26 12:13:10.42045+00	2789	f	42	13	49
731	2017-02-26 12:13:12.037731+00	36	f	43	13	51
732	2017-02-26 12:13:12.105358+00	39	f	44	3	52
733	2017-02-26 12:13:12.120562+00	52	f	45	2	53
734	2017-02-26 12:13:12.135169+00	8	f	46	0	54
735	2017-02-26 12:13:12.150431+00	62	f	47	1	55
736	2017-02-26 12:13:12.165023+00	18087	f	48	887	56
737	2017-02-26 12:13:12.180469+00	8	f	49	1	57
738	2017-02-26 12:13:13.755936+00	16	f	51	1	59
739	2017-02-26 12:13:13.835393+00	61	f	53	29	60
740	2017-02-26 12:13:13.864807+00	69	f	52	13	61
741	2017-02-26 12:13:13.895075+00	43	f	54	8	62
742	2017-02-26 12:13:13.90957+00	8	f	60	4	63
743	2017-02-26 12:13:13.925086+00	42	f	55	1	64
744	2017-02-26 12:13:13.939551+00	6	f	56	32	65
745	2017-02-26 12:13:13.955127+00	3	f	50	1	66
746	2017-02-26 12:13:13.969523+00	9	f	61	1	67
747	2017-02-26 12:13:13.985064+00	355	f	58	22	68
748	2017-02-26 12:13:13.999449+00	16	f	59	3	69
749	2017-02-26 12:13:15.998601+00	4	f	62	0	71
750	2017-02-26 12:13:16.080876+00	32312	f	63	1971	72
751	2017-02-26 12:13:18.975899+00	3	f	57	1	74
752	2017-02-26 12:13:19.021842+00	4	f	64	0	75
753	2017-02-26 12:13:19.047674+00	7	f	65	1	76
754	2017-02-26 12:13:19.062406+00	19	f	66	1	77
755	2017-02-26 12:13:19.078455+00	1219	f	67	47	78
756	2017-02-26 12:13:19.092466+00	9	f	68	0	79
757	2017-02-26 12:13:19.108602+00	90	f	69	15	80
758	2017-02-26 12:13:20.422715+00	7	f	70	0	82
759	2017-02-26 12:13:20.492857+00	1	f	71	1	83
760	2017-02-26 12:13:20.506391+00	384	f	72	12	84
761	2017-02-26 12:13:20.522585+00	145	f	73	8	85
762	2017-02-26 12:13:20.536146+00	2080	f	74	24	86
763	2017-02-26 12:13:20.552378+00	215	f	75	7	87
764	2017-02-26 12:13:20.566226+00	0	f	76	3	88
765	2017-02-26 12:13:20.581381+00	17	f	77	0	89
766	2017-02-26 12:13:21.770779+00	1769	f	78	35	91
767	2017-02-26 12:13:21.826348+00	3204	f	79	180	92
768	2017-02-26 12:13:21.839827+00	7	f	80	5	93
769	2017-02-26 12:13:21.855956+00	4087	f	81	147	94
770	2017-02-26 12:13:21.869534+00	12	f	82	13	95
771	2017-02-26 12:13:21.885816+00	2	f	83	5	96
772	2017-02-26 12:13:21.899499+00	11	f	84	3	97
773	2017-02-26 12:13:21.914703+00	150	f	85	26	98
774	2017-02-26 12:13:21.929561+00	1427	f	86	20	99
775	2017-02-26 12:23:00.386014+00	29155	t	2	872	2
776	2017-02-26 12:23:00.496835+00	631	f	3	13	3
777	2017-02-26 12:23:00.572049+00	892	f	4	28	4
778	2017-02-26 12:23:00.589662+00	14190	f	5	822	5
779	2017-02-26 12:23:00.602868+00	2468	f	6	85	6
780	2017-02-26 12:23:00.619041+00	2941	f	7	226	7
781	2017-02-26 12:23:00.63287+00	456	f	8	25	8
782	2017-02-26 12:23:00.649028+00	1143	f	9	38	9
783	2017-02-26 12:23:01.998479+00	112	f	10	13	11
784	2017-02-26 12:23:03.889463+00	51	f	13	5	13
785	2017-02-26 12:23:03.911201+00	93	f	11	6	14
786	2017-02-26 12:23:03.927638+00	471	f	12	18	15
787	2017-02-26 12:23:05.282179+00	33	f	17	7	17
788	2017-02-26 12:23:05.432531+00	332	f	14	18	18
789	2017-02-26 12:23:05.485271+00	9538	f	15	1040	19
790	2017-02-26 12:23:05.501977+00	218	f	16	13	20
791	2017-02-26 12:23:05.515125+00	54	f	19	2	21
792	2017-02-26 12:23:05.525126+00	5067	f	18	94	22
793	2017-02-26 12:23:05.535116+00	21	f	20	7	23
794	2017-02-26 12:23:05.544986+00	9	f	88	1	24
795	2017-02-26 12:23:05.555087+00	1311	f	21	12	25
796	2017-02-26 12:23:05.565077+00	2760	f	22	147	26
797	2017-02-26 12:23:07.137751+00	11	f	31	1	28
798	2017-02-26 12:23:07.208587+00	127	f	24	4	29
799	2017-02-26 12:23:07.219834+00	214	f	23	5	30
800	2017-02-26 12:23:07.236564+00	4450	f	25	290	31
801	2017-02-26 12:23:07.249631+00	23	f	26	5	32
802	2017-02-26 12:23:08.586808+00	6799	f	27	711	34
803	2017-02-26 12:23:08.679043+00	21821	f	28	1772	35
804	2017-02-26 12:23:08.703695+00	40	f	30	4	36
805	2017-02-26 12:23:08.713535+00	69	f	29	9	37
806	2017-02-26 12:23:08.723454+00	75	f	33	7	38
807	2017-02-26 12:23:08.733351+00	118	f	32	4	39
808	2017-02-26 12:23:08.743334+00	19	f	34	1	40
809	2017-02-26 12:23:08.75323+00	32	f	35	2	41
810	2017-02-26 12:23:08.763415+00	5180	f	36	191	42
811	2017-02-26 12:23:10.335703+00	651	f	37	27	44
812	2017-02-26 12:23:10.579093+00	109	f	38	1	45
813	2017-02-26 12:23:10.628499+00	1457	f	39	38	46
814	2017-02-26 12:23:10.638633+00	6388	f	40	105	47
815	2017-02-26 12:23:10.648353+00	95	f	41	9	48
816	2017-02-26 12:23:10.658323+00	2782	f	42	13	49
817	2017-02-26 12:23:12.308442+00	38	f	43	14	51
818	2017-02-26 12:23:12.381835+00	42	f	44	3	52
819	2017-02-26 12:23:12.393023+00	48	f	45	2	53
820	2017-02-26 12:23:12.572261+00	9	f	46	0	54
821	2017-02-26 12:23:12.583471+00	64	f	47	1	55
822	2017-02-26 12:23:12.59337+00	18090	f	48	887	56
823	2017-02-26 12:23:12.603343+00	8	f	49	1	57
824	2017-02-26 12:23:14.128743+00	16	f	51	1	59
825	2017-02-26 12:23:14.207772+00	58	f	53	29	60
826	2017-02-26 12:23:14.232239+00	69	f	52	13	61
827	2017-02-26 12:23:14.247459+00	6	f	56	32	62
828	2017-02-26 12:23:14.25746+00	41	f	54	8	63
829	2017-02-26 12:23:14.267436+00	12	f	61	1	64
830	2017-02-26 12:23:14.277489+00	9	f	60	4	65
831	2017-02-26 12:23:14.287419+00	42	f	55	1	66
832	2017-02-26 12:23:14.297429+00	2	f	50	1	67
833	2017-02-26 12:23:14.307481+00	359	f	58	22	68
834	2017-02-26 12:23:14.317337+00	19	f	59	3	69
835	2017-02-26 12:23:15.856412+00	7	f	70	0	71
836	2017-02-26 12:23:15.9521+00	6	f	62	0	72
837	2017-02-26 12:23:15.961869+00	32319	f	63	1971	73
838	2017-02-26 12:23:17.314794+00	3	f	57	1	75
839	2017-02-26 12:23:17.384469+00	4	f	64	0	76
840	2017-02-26 12:23:17.395599+00	7	f	65	1	77
841	2017-02-26 12:23:17.405512+00	18	f	66	1	78
842	2017-02-26 12:23:17.415427+00	1223	f	67	47	79
843	2017-02-26 12:23:17.425326+00	10	f	68	0	80
844	2017-02-26 12:23:17.435404+00	89	f	69	15	81
845	2017-02-26 12:23:18.647921+00	2	f	71	1	83
846	2017-02-26 12:23:18.707543+00	381	f	72	12	84
847	2017-02-26 12:23:18.718789+00	148	f	73	8	85
848	2017-02-26 12:23:18.728725+00	2079	f	74	24	86
849	2017-02-26 12:23:18.738645+00	215	f	75	7	87
850	2017-02-26 12:23:18.748665+00	0	f	76	3	88
851	2017-02-26 12:23:18.758698+00	21	f	77	0	89
852	2017-02-26 12:23:20.049271+00	1768	f	78	35	91
853	2017-02-26 12:23:20.072214+00	3208	f	79	180	92
854	2017-02-26 12:23:20.0822+00	10	f	80	5	93
855	2017-02-26 12:23:20.092202+00	4085	f	81	147	94
856	2017-02-26 12:23:20.10212+00	11	f	82	13	95
857	2017-02-26 12:23:20.112845+00	3	f	83	5	96
858	2017-02-26 12:23:20.122052+00	9	f	84	3	97
859	2017-02-26 12:23:20.13207+00	149	f	85	26	98
860	2017-02-26 12:23:20.142159+00	1417	f	86	20	99
861	2017-02-26 12:33:00.849953+00	29173	t	2	873	2
862	2017-02-26 12:33:00.919138+00	643	f	3	13	3
863	2017-02-26 12:33:00.935513+00	906	f	4	29	4
864	2017-02-26 12:33:00.94889+00	14196	f	5	823	5
865	2017-02-26 12:33:00.966016+00	2471	f	6	85	6
866	2017-02-26 12:33:00.97929+00	2944	f	7	228	7
867	2017-02-26 12:33:00.995851+00	460	f	8	25	8
868	2017-02-26 12:33:01.009005+00	1144	f	9	38	9
869	2017-02-26 12:33:02.361141+00	107	f	10	13	11
870	2017-02-26 12:33:04.075703+00	51	f	13	5	13
871	2017-02-26 12:33:04.1362+00	93	f	11	6	14
872	2017-02-26 12:33:04.147399+00	36	f	17	7	15
873	2017-02-26 12:33:04.163728+00	469	f	12	18	16
874	2017-02-26 12:33:05.476745+00	329	f	14	19	18
875	2017-02-26 12:33:05.500921+00	9550	f	15	1040	19
876	2017-02-26 12:33:05.517111+00	219	f	16	13	20
877	2017-02-26 12:33:05.530714+00	11	f	88	1	21
878	2017-02-26 12:33:05.546942+00	58	f	19	2	22
879	2017-02-26 12:33:05.560756+00	20	f	20	7	23
880	2017-02-26 12:33:05.5769+00	5070	f	18	94	24
881	2017-02-26 12:33:05.590758+00	1312	f	21	12	25
882	2017-02-26 12:33:05.601143+00	2756	f	22	147	26
883	2017-02-26 12:33:07.182811+00	11	f	31	1	28
884	2017-02-26 12:33:07.256442+00	129	f	24	4	29
885	2017-02-26 12:33:07.271762+00	213	f	23	5	30
886	2017-02-26 12:33:07.285601+00	4452	f	25	290	31
887	2017-02-26 12:33:07.301725+00	26	f	26	5	32
888	2017-02-26 12:33:08.857496+00	6799	f	27	711	34
889	2017-02-26 12:33:08.940244+00	21824	f	28	1773	35
890	2017-02-26 12:33:08.955889+00	43	f	30	4	36
891	2017-02-26 12:33:08.969932+00	71	f	29	9	37
892	2017-02-26 12:33:08.985893+00	75	f	33	8	38
893	2017-02-26 12:33:08.999844+00	120	f	32	4	39
894	2017-02-26 12:33:09.015699+00	19	f	34	1	40
895	2017-02-26 12:33:09.029797+00	35	f	35	2	41
896	2017-02-26 12:33:09.045704+00	5189	f	36	191	42
897	2017-02-26 12:33:10.624801+00	648	f	37	27	44
898	2017-02-26 12:33:10.715042+00	110	f	38	1	45
899	2017-02-26 12:33:10.730425+00	1462	f	39	38	46
900	2017-02-26 12:33:10.879476+00	6395	f	40	105	47
901	2017-02-26 12:33:10.895256+00	92	f	41	9	48
902	2017-02-26 12:33:10.910916+00	2784	f	42	13	49
903	2017-02-26 12:33:12.319081+00	36	f	43	14	51
904	2017-02-26 12:33:12.389524+00	40	f	44	3	52
905	2017-02-26 12:33:12.404882+00	54	f	45	2	53
906	2017-02-26 12:33:12.419231+00	8	f	46	0	54
907	2017-02-26 12:33:12.434614+00	63	f	47	1	55
908	2017-02-26 12:33:14.1908+00	18087	f	48	887	57
909	2017-02-26 12:33:14.27194+00	8	f	49	1	58
910	2017-02-26 12:33:14.29393+00	16	f	51	1	59
911	2017-02-26 12:33:14.313986+00	60	f	53	29	60
912	2017-02-26 12:33:14.329323+00	68	f	52	13	61
913	2017-02-26 12:33:14.343923+00	8	f	56	32	62
914	2017-02-26 12:33:14.494844+00	46	f	54	8	63
915	2017-02-26 12:33:14.510224+00	9	f	61	1	64
916	2017-02-26 12:33:14.525985+00	9	f	60	4	65
917	2017-02-26 12:33:14.542364+00	38	f	55	1	66
918	2017-02-26 12:33:14.554695+00	3	f	50	1	67
919	2017-02-26 12:33:14.569935+00	366	f	58	22	68
920	2017-02-26 12:33:14.584693+00	16	f	59	3	69
921	2017-02-26 12:33:16.212765+00	6	f	70	0	71
922	2017-02-26 12:33:16.299879+00	6	f	62	0	72
923	2017-02-26 12:33:16.315392+00	32309	f	63	1971	73
924	2017-02-26 12:33:17.72592+00	2	f	57	1	75
925	2017-02-26 12:33:17.750514+00	6	f	64	0	76
926	2017-02-26 12:33:17.763094+00	6	f	65	1	77
927	2017-02-26 12:33:17.777927+00	16	f	66	1	78
928	2017-02-26 12:33:17.792955+00	1223	f	67	47	79
929	2017-02-26 12:33:17.807976+00	7	f	68	0	80
930	2017-02-26 12:33:17.822975+00	87	f	69	15	81
931	2017-02-26 12:33:19.121143+00	1	f	71	1	83
932	2017-02-26 12:33:19.222826+00	385	f	72	12	84
933	2017-02-26 12:33:19.245461+00	145	f	73	8	85
934	2017-02-26 12:33:19.267086+00	2084	f	74	24	86
935	2017-02-26 12:33:19.281863+00	220	f	75	7	87
936	2017-02-26 12:33:19.296985+00	1	f	76	3	88
937	2017-02-26 12:33:19.311849+00	18	f	77	0	89
938	2017-02-26 12:33:20.726787+00	1770	f	78	35	91
939	2017-02-26 12:33:20.795857+00	3214	f	79	180	92
940	2017-02-26 12:33:20.811197+00	7	f	80	5	93
941	2017-02-26 12:33:20.825753+00	4087	f	81	147	94
942	2017-02-26 12:33:20.841032+00	10	f	82	13	95
943	2017-02-26 12:33:20.855824+00	3	f	83	5	96
944	2017-02-26 12:33:20.871093+00	147	f	85	26	97
945	2017-02-26 12:33:20.8862+00	10	f	84	3	98
946	2017-02-26 12:33:20.901177+00	1425	f	86	20	99
947	2017-02-26 12:43:00.78236+00	29202	t	2	873	2
948	2017-02-26 12:43:00.847962+00	670	f	3	13	3
949	2017-02-26 12:43:00.86296+00	928	f	4	29	4
950	2017-02-26 12:43:00.877385+00	14197	f	5	823	5
951	2017-02-26 12:43:00.893069+00	2470	f	6	85	6
952	2017-02-26 12:43:00.907651+00	2943	f	7	228	7
953	2017-02-26 12:43:00.922998+00	458	f	8	25	8
954	2017-02-26 12:43:00.937432+00	1144	f	9	38	9
955	2017-02-26 12:43:02.281403+00	117	f	10	13	11
956	2017-02-26 12:43:04.061958+00	51	f	13	5	13
957	2017-02-26 12:43:04.17478+00	37	f	17	7	14
958	2017-02-26 12:43:04.195745+00	94	f	11	6	15
959	2017-02-26 12:43:04.338917+00	475	f	12	18	16
960	2017-02-26 12:43:04.352335+00	13	f	88	3	17
961	2017-02-26 12:43:05.741905+00	332	f	14	19	19
962	2017-02-26 12:43:05.831481+00	9542	f	15	1040	20
963	2017-02-26 12:43:05.846187+00	222	f	16	13	21
964	2017-02-26 12:43:05.861085+00	55	f	19	2	22
965	2017-02-26 12:43:05.876131+00	21	f	20	7	23
966	2017-02-26 12:43:06.041823+00	5063	f	18	94	24
967	2017-02-26 12:43:06.070888+00	1316	f	21	12	25
968	2017-02-26 12:43:06.086903+00	2761	f	22	147	26
969	2017-02-26 12:43:07.632061+00	11	f	31	1	28
970	2017-02-26 12:43:07.706144+00	128	f	24	4	29
971	2017-02-26 12:43:07.720963+00	217	f	23	5	30
972	2017-02-26 12:43:07.735941+00	4455	f	25	290	31
973	2017-02-26 12:43:07.750796+00	26	f	26	5	32
974	2017-02-26 12:43:09.092612+00	6798	f	27	711	34
975	2017-02-26 12:43:09.175+00	21829	f	28	1773	35
976	2017-02-26 12:43:09.194343+00	44	f	30	4	36
977	2017-02-26 12:43:09.209473+00	72	f	29	9	37
978	2017-02-26 12:43:09.224325+00	75	f	33	8	38
979	2017-02-26 12:43:09.239841+00	120	f	32	4	39
980	2017-02-26 12:43:09.254417+00	18	f	34	1	40
981	2017-02-26 12:43:09.269653+00	32	f	35	2	41
982	2017-02-26 12:43:09.284457+00	5182	f	36	191	42
983	2017-02-26 12:43:09.299759+00	646	f	37	27	43
984	2017-02-26 12:43:09.3146+00	112	f	38	1	44
985	2017-02-26 12:43:09.329882+00	1460	f	39	38	45
986	2017-02-26 12:43:12.655967+00	6387	f	40	105	48
987	2017-02-26 12:43:12.72931+00	92	f	41	9	49
988	2017-02-26 12:43:12.743898+00	2788	f	42	13	50
989	2017-02-26 12:43:12.759247+00	8	f	46	0	51
990	2017-02-26 12:43:12.773611+00	37	f	43	14	52
991	2017-02-26 12:43:12.789057+00	38	f	44	3	53
992	2017-02-26 12:43:12.803478+00	54	f	45	3	54
993	2017-02-26 12:43:12.819047+00	63	f	47	1	55
994	2017-02-26 12:43:16.030011+00	2	f	89	0	57
995	2017-02-26 12:43:16.046026+00	18084	f	48	887	58
996	2017-02-26 12:43:16.088079+00	11	f	49	1	59
997	2017-02-26 12:43:16.102025+00	18	f	51	1	60
998	2017-02-26 12:43:16.117833+00	63	f	53	29	61
999	2017-02-26 12:43:16.132019+00	72	f	52	13	62
1000	2017-02-26 12:43:16.147831+00	5	f	56	32	63
1001	2017-02-26 12:43:16.162137+00	43	f	54	8	64
1002	2017-02-26 12:43:16.178087+00	9	f	61	1	65
1003	2017-02-26 12:43:16.192225+00	11	f	60	4	66
1004	2017-02-26 12:43:16.208146+00	39	f	55	1	67
1005	2017-02-26 12:43:16.222188+00	4	f	50	1	68
1006	2017-02-26 12:43:16.238178+00	364	f	58	22	69
1007	2017-02-26 12:43:16.371207+00	17	f	59	3	70
1008	2017-02-26 12:43:18.075164+00	8	f	70	0	72
1009	2017-02-26 12:43:18.143985+00	4	f	62	0	73
1010	2017-02-26 12:43:18.157491+00	32314	f	63	1971	74
1011	2017-02-26 12:43:19.439497+00	5	f	57	1	76
1012	2017-02-26 12:43:19.511303+00	5	f	64	0	77
1013	2017-02-26 12:43:19.527336+00	6	f	65	1	78
1014	2017-02-26 12:43:19.544237+00	18	f	66	1	79
1015	2017-02-26 12:43:19.557004+00	1222	f	67	47	80
1016	2017-02-26 12:43:19.570848+00	10	f	68	0	81
1017	2017-02-26 12:43:19.58717+00	91	f	69	15	82
1018	2017-02-26 12:43:20.889757+00	1	f	71	1	84
1019	2017-02-26 12:43:20.910604+00	380	f	72	12	85
1020	2017-02-26 12:43:20.924263+00	148	f	73	8	86
1021	2017-02-26 12:43:20.938158+00	2081	f	74	24	87
1022	2017-02-26 12:43:20.954307+00	213	f	75	7	88
1023	2017-02-26 12:43:20.968094+00	1	f	76	3	89
1024	2017-02-26 12:43:20.980654+00	15	f	77	0	90
1025	2017-02-26 12:43:22.137106+00	1760	f	78	35	92
1026	2017-02-26 12:43:22.264815+00	3211	f	79	180	93
1027	2017-02-26 12:43:22.281966+00	8	f	80	5	94
1028	2017-02-26 12:43:22.298099+00	4082	f	81	147	95
1029	2017-02-26 12:43:22.314479+00	9	f	82	13	96
1030	2017-02-26 12:43:22.327993+00	3	f	83	5	97
1031	2017-02-26 12:43:22.341683+00	151	f	85	26	98
1032	2017-02-26 12:43:22.357969+00	12	f	84	3	99
1033	2017-02-26 12:53:00.937998+00	29201	t	2	873	2
1034	2017-02-26 12:53:01.044734+00	696	f	3	13	3
1035	2017-02-26 12:53:01.070057+00	940	f	4	30	4
1036	2017-02-26 12:53:01.079968+00	14208	f	5	823	5
1037	2017-02-26 12:53:01.089961+00	2475	f	6	85	6
1038	2017-02-26 12:53:01.099794+00	2941	f	7	229	7
1039	2017-02-26 12:53:01.109673+00	465	f	8	26	8
1040	2017-02-26 12:53:01.119785+00	1142	f	9	38	9
1041	2017-02-26 12:53:02.660465+00	117	f	10	14	11
1042	2017-02-26 12:53:04.442531+00	19	f	88	3	13
1043	2017-02-26 12:53:04.528831+00	58	f	13	5	14
1044	2017-02-26 12:53:04.538676+00	39	f	17	7	15
1045	2017-02-26 12:53:04.548626+00	93	f	11	6	16
1046	2017-02-26 12:53:04.5585+00	475	f	12	18	17
1047	2017-02-26 12:53:05.920915+00	331	f	14	19	19
1048	2017-02-26 12:53:05.983057+00	216	f	16	13	20
1049	2017-02-26 12:53:06.032782+00	9537	f	15	1040	21
1050	2017-02-26 12:53:06.042682+00	23	f	20	7	22
1051	2017-02-26 12:53:06.052531+00	56	f	19	2	23
1052	2017-02-26 12:53:06.062476+00	5071	f	18	94	24
1053	2017-02-26 12:53:06.072453+00	1310	f	21	12	25
1054	2017-02-26 12:53:06.082371+00	2757	f	22	147	26
1055	2017-02-26 12:53:07.663056+00	12	f	31	1	28
1056	2017-02-26 12:53:07.716992+00	126	f	24	6	29
1057	2017-02-26 12:53:07.726738+00	211	f	23	5	30
1058	2017-02-26 12:53:07.736656+00	4456	f	25	290	31
1059	2017-02-26 12:53:07.746629+00	25	f	26	5	32
1060	2017-02-26 12:53:09.120971+00	6800	f	27	711	34
1061	2017-02-26 12:53:09.256383+00	21827	f	28	1773	35
1062	2017-02-26 12:53:09.290857+00	70	f	29	9	36
1063	2017-02-26 12:53:09.330708+00	40	f	30	4	37
1064	2017-02-26 12:53:09.340648+00	4	f	89	2	38
1065	2017-02-26 12:53:09.350581+00	76	f	33	8	39
1066	2017-02-26 12:53:09.360527+00	116	f	32	4	40
1067	2017-02-26 12:53:09.370568+00	19	f	34	1	41
1068	2017-02-26 12:53:09.380535+00	32	f	35	2	42
1069	2017-02-26 12:53:09.390521+00	5189	f	36	191	43
1070	2017-02-26 12:53:12.620061+00	651	f	37	27	46
1071	2017-02-26 12:53:12.68961+00	113	f	38	1	47
1072	2017-02-26 12:53:12.699484+00	1462	f	39	38	48
1073	2017-02-26 12:53:12.709377+00	6388	f	40	105	49
1074	2017-02-26 12:53:12.719466+00	97	f	41	9	50
1075	2017-02-26 12:53:12.729168+00	12	f	46	0	51
1076	2017-02-26 12:53:12.739274+00	2786	f	42	13	52
1077	2017-02-26 12:53:14.284913+00	37	f	43	14	54
1078	2017-02-26 12:53:14.363955+00	40	f	44	3	55
1079	2017-02-26 12:53:14.373785+00	53	f	45	3	56
1080	2017-02-26 12:53:14.383683+00	67	f	47	1	57
1081	2017-02-26 12:53:14.393596+00	11	f	49	1	58
1082	2017-02-26 12:53:14.40359+00	18082	f	48	887	59
1083	2017-02-26 12:53:14.413556+00	7	f	56	32	60
1084	2017-02-26 12:53:14.423631+00	16	f	51	1	61
1085	2017-02-26 12:53:14.433662+00	14	f	61	1	62
1086	2017-02-26 12:53:14.453714+00	60	f	53	29	63
1087	2017-02-26 12:53:14.463682+00	66	f	52	13	64
1088	2017-02-26 12:53:14.473675+00	47	f	54	8	65
1089	2017-02-26 12:53:14.483621+00	43	f	55	1	66
1090	2017-02-26 12:53:14.503877+00	7	f	60	4	67
1091	2017-02-26 12:53:14.513885+00	3	f	50	1	68
1092	2017-02-26 12:53:14.523914+00	5	f	62	0	69
1093	2017-02-26 12:53:14.533836+00	5	f	57	1	70
1094	2017-02-26 12:53:14.543884+00	365	f	58	22	71
1095	2017-02-26 12:53:14.702558+00	9	f	70	0	72
1096	2017-02-26 12:53:14.745257+00	16	f	59	3	73
1097	2017-02-26 12:53:19.394181+00	1	f	90	0	76
1098	2017-02-26 12:53:19.40696+00	5	f	64	0	77
1099	2017-02-26 12:53:19.416575+00	32314	f	63	1971	78
1100	2017-02-26 12:53:19.426509+00	7	f	65	1	79
1101	2017-02-26 12:53:19.436389+00	18	f	66	1	80
1102	2017-02-26 12:53:19.446341+00	1227	f	67	47	81
1103	2017-02-26 12:53:19.456346+00	9	f	68	0	82
1104	2017-02-26 12:53:19.466389+00	93	f	69	15	83
1105	2017-02-26 12:53:22.049695+00	1	f	71	1	86
1106	2017-02-26 12:53:24.016064+00	1	f	91	1	87
1107	2017-02-26 12:53:24.028418+00	380	f	72	12	88
1108	2017-02-26 12:53:24.038371+00	147	f	73	8	89
1109	2017-02-26 12:53:24.048291+00	2076	f	74	24	90
1110	2017-02-26 12:53:24.058009+00	214	f	75	7	91
1111	2017-02-26 12:53:24.068033+00	0	f	76	3	92
1112	2017-02-26 12:53:24.078254+00	20	f	77	0	93
1113	2017-02-26 12:53:24.08798+00	1764	f	78	35	94
1114	2017-02-26 12:53:24.097986+00	3207	f	79	180	95
1115	2017-02-26 12:53:24.107903+00	8	f	80	5	96
1116	2017-02-26 12:53:24.11793+00	4078	f	81	147	97
1117	2017-02-26 12:53:24.138114+00	11	f	82	13	98
1118	2017-02-26 12:53:24.14836+00	3	f	83	5	99
1119	2017-02-26 13:03:01.953161+00	29207	t	2	874	2
1120	2017-02-26 13:03:02.055636+00	721	f	3	13	3
1121	2017-02-26 13:03:02.069889+00	959	f	4	32	4
1122	2017-02-26 13:03:02.085199+00	14211	f	5	823	5
1123	2017-02-26 13:03:02.099659+00	2483	f	6	85	6
1124	2017-02-26 13:03:02.115124+00	2949	f	7	230	7
1125	2017-02-26 13:03:02.129621+00	465	f	8	26	8
1126	2017-02-26 13:03:02.145071+00	1141	f	9	38	9
1127	2017-02-26 13:03:03.526436+00	121	f	10	14	11
1128	2017-02-26 13:03:03.612254+00	23	f	88	4	12
1129	2017-02-26 13:03:05.300657+00	63	f	13	5	14
1130	2017-02-26 13:03:05.357134+00	46	f	17	7	15
1131	2017-02-26 13:03:05.373552+00	95	f	11	6	16
1132	2017-02-26 13:03:05.388442+00	478	f	12	18	17
1133	2017-02-26 13:03:06.69213+00	342	f	14	19	19
1134	2017-02-26 13:03:06.750563+00	222	f	16	13	20
1135	2017-02-26 13:03:06.767163+00	9544	f	15	1040	21
1136	2017-02-26 13:03:06.782062+00	26	f	20	7	22
1137	2017-02-26 13:03:06.79704+00	60	f	19	2	23
1138	2017-02-26 13:03:06.811934+00	5079	f	18	94	24
1139	2017-02-26 13:03:06.873748+00	1309	f	21	12	25
1140	2017-02-26 13:03:06.910878+00	2765	f	22	146	26
1141	2017-02-26 13:03:08.516266+00	11	f	31	1	28
1142	2017-02-26 13:03:08.605425+00	7	f	89	4	29
1143	2017-02-26 13:03:08.622035+00	133	f	24	6	30
1144	2017-02-26 13:03:08.637003+00	212	f	23	5	31
1145	2017-02-26 13:03:08.651743+00	4461	f	25	290	32
1146	2017-02-26 13:03:08.666844+00	26	f	26	5	33
1147	2017-02-26 13:03:10.011543+00	6792	f	27	711	35
1148	2017-02-26 13:03:10.088981+00	21829	f	28	1774	36
1149	2017-02-26 13:03:10.105744+00	72	f	29	9	37
1150	2017-02-26 13:03:10.121124+00	38	f	30	4	38
1151	2017-02-26 13:03:10.135541+00	20	f	34	1	39
1152	2017-02-26 13:03:10.150996+00	76	f	33	8	40
1153	2017-02-26 13:03:10.165553+00	119	f	32	4	41
1154	2017-02-26 13:03:10.180913+00	29	f	35	2	42
1155	2017-02-26 13:03:10.266981+00	5183	f	36	191	43
1156	2017-02-26 13:03:11.820391+00	3	f	90	0	45
1157	2017-02-26 13:03:13.605703+00	648	f	37	27	47
1158	2017-02-26 13:03:13.678224+00	109	f	38	1	48
1159	2017-02-26 13:03:13.694764+00	1463	f	39	38	49
1160	2017-02-26 13:03:13.710334+00	6387	f	40	105	50
1161	2017-02-26 13:03:13.724522+00	94	f	41	9	51
1162	2017-02-26 13:03:13.740175+00	11	f	46	0	52
1163	2017-02-26 13:03:13.754463+00	2786	f	42	13	53
1164	2017-02-26 13:03:15.420138+00	38	f	43	14	55
1165	2017-02-26 13:03:15.502558+00	41	f	44	3	56
1166	2017-02-26 13:03:15.519143+00	52	f	45	3	57
1167	2017-02-26 13:03:15.534972+00	69	f	47	1	58
1168	2017-02-26 13:03:15.549045+00	12	f	49	1	59
1169	2017-02-26 13:03:15.564851+00	18084	f	48	887	60
1170	2017-02-26 13:03:15.579074+00	8	f	56	32	61
1171	2017-02-26 13:03:15.599143+00	17	f	51	1	62
1172	2017-02-26 13:03:15.614982+00	10	f	61	1	63
1173	2017-02-26 13:03:15.639234+00	61	f	53	29	64
1174	2017-02-26 13:03:15.655139+00	71	f	52	13	65
1175	2017-02-26 13:03:15.669251+00	42	f	54	8	66
1176	2017-02-26 13:03:15.685193+00	37	f	55	1	67
1177	2017-02-26 13:03:15.699418+00	9	f	60	4	68
1178	2017-02-26 13:03:15.715169+00	2	f	50	1	69
1179	2017-02-26 13:03:15.729269+00	6	f	62	0	70
1180	2017-02-26 13:03:15.749321+00	3	f	57	1	71
1181	2017-02-26 13:03:15.762624+00	362	f	58	22	72
1182	2017-02-26 13:03:15.77527+00	8	f	70	0	73
1183	2017-02-26 13:03:15.789384+00	17	f	59	3	74
1184	2017-02-26 13:03:18.646053+00	5	f	64	0	77
1185	2017-02-26 13:03:18.720828+00	32314	f	63	1971	78
1186	2017-02-26 13:03:18.737545+00	7	f	65	1	79
1187	2017-02-26 13:03:18.753602+00	19	f	66	1	80
1188	2017-02-26 13:03:18.767449+00	1221	f	67	47	81
1189	2017-02-26 13:03:18.783696+00	9	f	68	0	82
1190	2017-02-26 13:03:18.797336+00	89	f	69	15	83
1191	2017-02-26 13:03:21.425078+00	1	f	71	1	86
1192	2017-02-26 13:03:21.50489+00	1	f	91	1	87
1193	2017-02-26 13:03:21.520973+00	381	f	72	12	88
1194	2017-02-26 13:03:21.578175+00	148	f	73	8	89
1195	2017-02-26 13:03:21.594751+00	2078	f	74	24	90
1196	2017-02-26 13:03:21.611265+00	216	f	75	7	91
1197	2017-02-26 13:03:21.627785+00	0	f	76	3	92
1198	2017-02-26 13:03:21.641004+00	16	f	77	0	93
1199	2017-02-26 13:03:21.654577+00	1761	f	78	35	94
1200	2017-02-26 13:03:21.66778+00	3208	f	79	180	95
1201	2017-02-26 13:03:21.680969+00	8	f	80	5	96
1202	2017-02-26 13:03:21.694683+00	4081	f	81	147	97
1203	2017-02-26 13:03:21.707865+00	11	f	82	13	98
1204	2017-02-26 13:03:21.721124+00	3	f	83	5	99
1205	2017-02-26 13:13:02.176789+00	29225	t	2	874	2
1206	2017-02-26 13:13:02.279453+00	748	f	3	13	3
1207	2017-02-26 13:13:02.294403+00	978	f	4	32	4
1208	2017-02-26 13:13:02.308962+00	14221	f	5	823	5
1209	2017-02-26 13:13:02.324139+00	2480	f	6	87	6
1210	2017-02-26 13:13:02.338983+00	2947	f	7	229	7
1211	2017-02-26 13:13:02.354272+00	475	f	8	26	8
1212	2017-02-26 13:13:03.697152+00	1152	f	9	38	10
1213	2017-02-26 13:13:03.763191+00	119	f	10	14	11
1214	2017-02-26 13:13:03.777957+00	27	f	88	4	12
1215	2017-02-26 13:13:05.440475+00	65	f	13	5	14
1216	2017-02-26 13:13:05.508144+00	40	f	17	7	15
1217	2017-02-26 13:13:05.533031+00	101	f	11	6	16
1218	2017-02-26 13:13:05.548348+00	476	f	12	18	17
1219	2017-02-26 13:13:06.911442+00	335	f	14	19	19
1220	2017-02-26 13:13:06.936207+00	28	f	20	7	20
1221	2017-02-26 13:13:06.951734+00	219	f	16	13	21
1222	2017-02-26 13:13:06.966017+00	9539	f	15	1040	22
1223	2017-02-26 13:13:06.981712+00	59	f	19	2	23
1224	2017-02-26 13:13:06.995874+00	5071	f	18	94	24
1225	2017-02-26 13:13:07.008974+00	14	f	31	1	25
1226	2017-02-26 13:13:07.021666+00	1309	f	21	12	26
1227	2017-02-26 13:13:07.035984+00	2759	f	22	146	27
1228	2017-02-26 13:13:08.738175+00	7	f	89	4	29
1229	2017-02-26 13:13:08.807266+00	127	f	24	6	30
1230	2017-02-26 13:13:08.824235+00	30	f	26	5	31
1231	2017-02-26 13:13:08.836891+00	214	f	23	5	32
1232	2017-02-26 13:13:08.850964+00	4456	f	25	290	33
1233	2017-02-26 13:13:08.866928+00	4	f	90	0	34
1234	2017-02-26 13:13:10.183221+00	6800	f	27	711	36
1235	2017-02-26 13:13:10.432295+00	21824	f	28	1774	37
1236	2017-02-26 13:13:10.448342+00	21	f	34	1	38
1237	2017-02-26 13:13:10.472717+00	72	f	29	9	39
1238	2017-02-26 13:13:10.495213+00	42	f	30	4	40
1239	2017-02-26 13:13:10.511229+00	72	f	33	8	41
1240	2017-02-26 13:13:10.525169+00	120	f	32	4	42
1241	2017-02-26 13:13:10.541191+00	35	f	35	2	43
1242	2017-02-26 13:13:10.555158+00	5186	f	36	191	44
1243	2017-02-26 13:13:13.689048+00	114	f	38	1	47
1244	2017-02-26 13:13:13.760218+00	648	f	37	27	48
1245	2017-02-26 13:13:13.776732+00	12	f	46	0	49
1246	2017-02-26 13:13:13.789982+00	1456	f	39	38	50
1247	2017-02-26 13:13:13.806588+00	6393	f	40	105	51
1248	2017-02-26 13:13:13.819926+00	94	f	41	9	52
1249	2017-02-26 13:13:13.833445+00	2787	f	42	13	53
1250	2017-02-26 13:13:13.846447+00	36	f	43	14	54
1251	2017-02-26 13:13:15.400814+00	41	f	44	3	56
1252	2017-02-26 13:13:15.481342+00	51	f	45	3	57
1253	2017-02-26 13:13:15.512624+00	12	f	49	1	58
1254	2017-02-26 13:13:15.537975+00	67	f	47	1	59
1255	2017-02-26 13:13:15.554407+00	18091	f	48	887	60
1256	2017-02-26 13:13:15.567878+00	15	f	51	1	61
1257	2017-02-26 13:13:15.580883+00	8	f	56	32	62
1258	2017-02-26 13:13:15.594462+00	8	f	62	0	63
1259	2017-02-26 13:13:15.610982+00	14	f	61	1	64
1260	2017-02-26 13:13:15.624481+00	12	f	60	4	65
1261	2017-02-26 13:13:15.637979+00	71	f	52	13	66
1262	2017-02-26 13:13:15.651026+00	56	f	53	29	67
1263	2017-02-26 13:13:15.664583+00	45	f	54	8	68
1264	2017-02-26 13:13:15.6781+00	40	f	55	1	69
1265	2017-02-26 13:13:17.122599+00	18	f	59	3	71
1266	2017-02-26 13:13:17.212711+00	3	f	50	1	72
1267	2017-02-26 13:13:17.2293+00	4	f	57	1	73
1268	2017-02-26 13:13:17.245537+00	362	f	58	22	74
1269	2017-02-26 13:13:17.259153+00	9	f	70	0	75
1270	2017-02-26 13:13:18.964652+00	5	f	64	0	77
1271	2017-02-26 13:13:19.034379+00	32314	f	63	1971	78
1272	2017-02-26 13:13:20.477545+00	2	f	91	1	80
1273	2017-02-26 13:13:20.558589+00	19	f	66	1	81
1274	2017-02-26 13:13:20.579502+00	10	f	68	0	82
1275	2017-02-26 13:13:20.621405+00	9	f	65	1	83
1276	2017-02-26 13:13:20.638488+00	1223	f	67	47	84
1277	2017-02-26 13:13:20.654148+00	93	f	69	15	85
1278	2017-02-26 13:13:21.931436+00	1	f	71	1	87
1279	2017-02-26 13:13:22.001994+00	384	f	72	12	88
1280	2017-02-26 13:13:22.017767+00	145	f	73	8	89
1281	2017-02-26 13:13:22.034789+00	2078	f	74	24	90
1282	2017-02-26 13:13:22.047626+00	218	f	75	7	91
1283	2017-02-26 13:13:22.061701+00	0	f	76	3	92
1284	2017-02-26 13:13:22.077519+00	21	f	77	0	93
1285	2017-02-26 13:13:22.091815+00	9	f	80	5	94
1286	2017-02-26 13:13:22.107796+00	1764	f	78	35	95
1287	2017-02-26 13:13:22.121928+00	3204	f	79	180	96
1288	2017-02-26 13:13:22.175067+00	10	f	82	14	97
1289	2017-02-26 13:13:22.187791+00	4074	f	81	147	98
1290	2017-02-26 13:13:22.202052+00	3	f	83	5	99
1291	2017-02-26 13:23:01.969762+00	29238	t	2	874	2
1292	2017-02-26 13:23:02.039963+00	770	f	3	13	3
1293	2017-02-26 13:23:02.049908+00	999	f	4	33	4
1294	2017-02-26 13:23:02.059804+00	14215	f	5	823	5
1295	2017-02-26 13:23:02.069731+00	2491	f	6	87	6
1296	2017-02-26 13:23:02.079623+00	2961	f	7	229	7
1297	2017-02-26 13:23:02.089627+00	472	f	8	26	8
1298	2017-02-26 13:23:03.496651+00	1151	f	9	39	10
1299	2017-02-26 13:23:03.664048+00	32	f	88	5	11
1300	2017-02-26 13:23:03.684227+00	119	f	10	14	12
1301	2017-02-26 13:23:05.398315+00	70	f	13	5	14
1302	2017-02-26 13:23:05.458616+00	46	f	17	7	15
1303	2017-02-26 13:23:05.468411+00	100	f	11	7	16
1304	2017-02-26 13:23:05.478439+00	477	f	12	18	17
1305	2017-02-26 13:23:06.828469+00	336	f	14	19	19
1306	2017-02-26 13:23:06.922556+00	28	f	20	7	20
1307	2017-02-26 13:23:06.931927+00	219	f	16	13	21
1308	2017-02-26 13:23:06.941864+00	9548	f	15	1040	22
1309	2017-02-26 13:23:06.952168+00	61	f	19	2	23
1310	2017-02-26 13:23:06.96191+00	8	f	90	0	24
1311	2017-02-26 13:23:06.98202+00	5075	f	18	94	25
1312	2017-02-26 13:23:06.992045+00	16	f	31	1	26
1313	2017-02-26 13:23:07.002111+00	1311	f	21	12	27
1314	2017-02-26 13:23:07.012577+00	2764	f	22	146	28
1315	2017-02-26 13:23:08.582777+00	8	f	89	4	30
1316	2017-02-26 13:23:08.666921+00	126	f	24	6	31
1317	2017-02-26 13:23:08.676742+00	26	f	26	5	32
1318	2017-02-26 13:23:08.686691+00	218	f	23	5	33
1319	2017-02-26 13:23:08.696636+00	4456	f	25	290	34
1320	2017-02-26 13:23:09.999431+00	6798	f	27	711	36
1321	2017-02-26 13:23:10.070163+00	21824	f	28	1774	37
1322	2017-02-26 13:23:10.08+00	23	f	34	1	38
1323	2017-02-26 13:23:10.089933+00	71	f	29	9	39
1324	2017-02-26 13:23:10.099984+00	37	f	30	4	40
1325	2017-02-26 13:23:10.112121+00	77	f	33	8	41
1326	2017-02-26 13:23:10.119988+00	117	f	32	4	42
1327	2017-02-26 13:23:10.129963+00	34	f	35	2	43
1328	2017-02-26 13:23:10.150087+00	5187	f	36	191	44
1329	2017-02-26 13:23:13.597587+00	115	f	38	1	47
1330	2017-02-26 13:23:13.679757+00	654	f	37	27	48
1331	2017-02-26 13:23:13.689553+00	13	f	46	0	49
1332	2017-02-26 13:23:13.699373+00	1458	f	39	38	50
1333	2017-02-26 13:23:13.709299+00	6392	f	40	105	51
1334	2017-02-26 13:23:13.719202+00	92	f	41	9	52
1335	2017-02-26 13:23:13.729096+00	2787	f	42	13	53
1336	2017-02-26 13:23:13.739053+00	38	f	43	14	54
1337	2017-02-26 13:23:15.26665+00	38	f	44	3	56
1338	2017-02-26 13:23:15.333437+00	54	f	45	3	57
1339	2017-02-26 13:23:15.343226+00	12	f	49	1	58
1340	2017-02-26 13:23:15.353147+00	66	f	47	1	59
1341	2017-02-26 13:23:15.373181+00	18091	f	48	887	60
1342	2017-02-26 13:23:15.383199+00	16	f	51	1	61
1343	2017-02-26 13:23:15.39312+00	7	f	56	32	62
1344	2017-02-26 13:23:15.413197+00	8	f	62	0	63
1345	2017-02-26 13:23:15.433314+00	15	f	61	1	64
1346	2017-02-26 13:23:15.443333+00	13	f	60	4	65
1347	2017-02-26 13:23:15.45335+00	71	f	52	13	66
1348	2017-02-26 13:23:15.46342+00	56	f	53	29	67
1349	2017-02-26 13:23:15.473531+00	46	f	54	8	68
1350	2017-02-26 13:23:15.483455+00	39	f	55	1	69
1351	2017-02-26 13:23:16.815017+00	19	f	59	3	71
1352	2017-02-26 13:23:16.887821+00	1	f	50	1	72
1353	2017-02-26 13:23:16.897665+00	5	f	57	1	73
1354	2017-02-26 13:23:16.907799+00	368	f	58	22	74
1355	2017-02-26 13:23:16.927652+00	8	f	70	0	75
1356	2017-02-26 13:23:18.555748+00	6	f	64	0	77
1357	2017-02-26 13:23:18.632368+00	32312	f	63	1970	78
1358	2017-02-26 13:23:20.070193+00	1	f	91	1	80
1359	2017-02-26 13:23:20.136412+00	20	f	66	1	81
1360	2017-02-26 13:23:20.146017+00	10	f	68	0	82
1361	2017-02-26 13:23:20.156021+00	7	f	65	1	83
1362	2017-02-26 13:23:20.165869+00	1223	f	67	47	84
1363	2017-02-26 13:23:20.175876+00	92	f	69	15	85
1364	2017-02-26 13:23:21.621992+00	1	f	71	1	87
1365	2017-02-26 13:23:21.690701+00	386	f	72	12	88
1366	2017-02-26 13:23:21.700158+00	150	f	73	8	89
1367	2017-02-26 13:23:21.710039+00	2080	f	74	24	90
1368	2017-02-26 13:23:21.730211+00	214	f	75	7	91
1369	2017-02-26 13:23:21.740019+00	0	f	76	3	92
1370	2017-02-26 13:23:21.750047+00	16	f	77	0	93
1371	2017-02-26 13:23:21.760084+00	8	f	80	5	94
1372	2017-02-26 13:23:21.769975+00	1769	f	78	35	95
1373	2017-02-26 13:23:21.780034+00	3210	f	79	180	96
1374	2017-02-26 13:23:21.790052+00	11	f	82	14	97
1375	2017-02-26 13:23:21.800092+00	4083	f	81	147	98
1376	2017-02-26 13:23:21.860789+00	2	f	83	5	99
1377	2017-02-26 13:33:02.505891+00	813	f	3	13	2
1378	2017-02-26 13:33:02.773144+00	29249	t	2	874	3
1379	2017-02-26 13:33:02.899929+00	1023	f	4	33	4
1380	2017-02-26 13:33:02.912908+00	14216	f	5	823	5
1381	2017-02-26 13:33:02.929477+00	2493	f	6	87	6
1382	2017-02-26 13:33:02.942805+00	2954	f	7	229	7
1383	2017-02-26 13:33:02.957337+00	476	f	8	26	8
1384	2017-02-26 13:33:02.972836+00	35	f	88	6	9
1385	2017-02-26 13:33:04.298512+00	1161	f	9	39	11
1386	2017-02-26 13:33:04.367271+00	122	f	10	15	12
1387	2017-02-26 13:33:04.383286+00	75	f	13	5	13
1388	2017-02-26 13:33:06.075351+00	47	f	17	7	15
1389	2017-02-26 13:33:06.181569+00	102	f	11	7	16
1390	2017-02-26 13:33:06.198263+00	13	f	90	1	17
1391	2017-02-26 13:33:06.211298+00	477	f	12	18	18
1392	2017-02-26 13:33:06.225719+00	27	f	20	7	19
1393	2017-02-26 13:33:07.539309+00	342	f	14	19	21
1394	2017-02-26 13:33:07.626427+00	222	f	16	13	22
1395	2017-02-26 13:33:07.642258+00	9547	f	15	1040	23
1396	2017-02-26 13:33:07.655173+00	61	f	19	2	24
1397	2017-02-26 13:33:07.66956+00	5079	f	18	94	25
1398	2017-02-26 13:33:07.684917+00	15	f	31	1	26
1399	2017-02-26 13:33:07.699538+00	1315	f	21	12	27
1400	2017-02-26 13:33:07.715038+00	2766	f	22	146	28
1401	2017-02-26 13:33:09.3662+00	7	f	89	5	30
1402	2017-02-26 13:33:09.440041+00	133	f	24	6	31
1403	2017-02-26 13:33:09.457171+00	27	f	26	5	32
1404	2017-02-26 13:33:09.469699+00	214	f	23	5	33
1405	2017-02-26 13:33:09.484156+00	4454	f	25	290	34
1406	2017-02-26 13:33:11.076874+00	6804	f	27	711	36
1407	2017-02-26 13:33:11.284751+00	21824	f	28	1774	37
1408	2017-02-26 13:33:11.311737+00	19	f	34	1	38
1409	2017-02-26 13:33:11.334306+00	70	f	29	9	39
1410	2017-02-26 13:33:11.348923+00	42	f	30	4	40
1411	2017-02-26 13:33:11.364247+00	76	f	33	8	41
1412	2017-02-26 13:33:11.378828+00	120	f	32	4	42
1413	2017-02-26 13:33:11.394295+00	34	f	35	2	43
1414	2017-02-26 13:33:11.408802+00	5188	f	36	191	44
1415	2017-02-26 13:33:14.641356+00	111	f	38	1	47
1416	2017-02-26 13:33:14.713139+00	650	f	37	27	48
1417	2017-02-26 13:33:14.727685+00	12	f	46	0	49
1418	2017-02-26 13:33:14.743057+00	1454	f	39	38	50
1419	2017-02-26 13:33:14.757478+00	6391	f	40	105	51
1420	2017-02-26 13:33:14.772771+00	94	f	41	9	52
1421	2017-02-26 13:33:14.787436+00	2791	f	42	13	53
1422	2017-02-26 13:33:14.80298+00	40	f	43	14	54
1423	2017-02-26 13:33:16.640718+00	45	f	44	3	56
1424	2017-02-26 13:33:16.718975+00	54	f	45	3	57
1425	2017-02-26 13:33:16.746212+00	10	f	49	1	58
1426	2017-02-26 13:33:16.762648+00	63	f	47	1	59
1427	2017-02-26 13:33:16.777908+00	18082	f	48	887	60
1428	2017-02-26 13:33:16.792578+00	18	f	51	1	61
1429	2017-02-26 13:33:16.808158+00	8	f	56	32	62
1430	2017-02-26 13:33:16.828065+00	10	f	62	0	63
1431	2017-02-26 13:33:16.848124+00	14	f	61	1	64
1432	2017-02-26 13:33:16.868232+00	13	f	60	4	65
1433	2017-02-26 13:33:16.882655+00	66	f	52	13	66
1434	2017-02-26 13:33:16.898145+00	61	f	53	29	67
1435	2017-02-26 13:33:16.912524+00	45	f	54	8	68
1436	2017-02-26 13:33:16.927968+00	45	f	55	1	69
1437	2017-02-26 13:33:18.39356+00	18	f	59	3	71
1438	2017-02-26 13:33:18.507476+00	3	f	50	1	72
1439	2017-02-26 13:33:18.522661+00	5	f	57	1	73
1440	2017-02-26 13:33:18.537126+00	364	f	58	22	74
1441	2017-02-26 13:33:18.552438+00	9	f	70	0	75
1442	2017-02-26 13:33:20.169371+00	5	f	64	0	77
1443	2017-02-26 13:33:20.242017+00	32317	f	63	1970	78
1444	2017-02-26 13:33:21.608583+00	3	f	91	1	80
1445	2017-02-26 13:33:21.665681+00	19	f	66	1	81
1446	2017-02-26 13:33:21.691995+00	8	f	68	0	82
1447	2017-02-26 13:33:21.710672+00	8	f	65	1	83
1448	2017-02-26 13:33:21.725105+00	1225	f	67	47	84
1449	2017-02-26 13:33:21.740478+00	92	f	69	15	85
1450	2017-02-26 13:33:23.029511+00	1	f	71	1	87
1451	2017-02-26 13:33:23.099195+00	382	f	72	12	88
1452	2017-02-26 13:33:23.124394+00	148	f	73	8	89
1453	2017-02-26 13:33:23.13881+00	2078	f	74	24	90
1454	2017-02-26 13:33:23.154227+00	219	f	75	7	91
1455	2017-02-26 13:33:23.16853+00	0	f	76	3	92
1456	2017-02-26 13:33:23.183884+00	20	f	77	0	93
1457	2017-02-26 13:33:23.198595+00	8	f	80	5	94
1458	2017-02-26 13:33:23.214116+00	1766	f	78	35	95
1459	2017-02-26 13:33:23.228603+00	3211	f	79	180	96
1460	2017-02-26 13:33:23.24403+00	11	f	82	14	97
1461	2017-02-26 13:33:23.271192+00	4085	f	81	147	98
1462	2017-02-26 13:33:23.294202+00	2	f	83	5	99
1463	2017-02-26 13:43:02.489815+00	858	f	3	13	2
1464	2017-02-26 13:43:02.565968+00	29264	t	2	875	3
1465	2017-02-26 13:43:02.580722+00	1050	f	4	33	4
1466	2017-02-26 13:43:02.59565+00	14223	f	5	823	5
1467	2017-02-26 13:43:02.610627+00	2497	f	6	87	6
1468	2017-02-26 13:43:02.625424+00	484	f	8	26	7
1469	2017-02-26 13:43:02.640426+00	2960	f	7	229	8
1470	2017-02-26 13:43:02.655343+00	38	f	88	6	9
1471	2017-02-26 13:43:04.064732+00	1160	f	9	39	11
1472	2017-02-26 13:43:04.137768+00	129	f	10	14	12
1473	2017-02-26 13:43:04.155032+00	78	f	13	5	13
1474	2017-02-26 13:43:05.764842+00	48	f	17	8	15
1475	2017-02-26 13:43:05.908115+00	16	f	90	1	16
1476	2017-02-26 13:43:05.93225+00	101	f	11	7	17
1477	2017-02-26 13:43:05.949293+00	479	f	12	18	18
1478	2017-02-26 13:43:05.964283+00	29	f	20	7	19
1479	2017-02-26 13:43:07.345886+00	344	f	14	19	21
1480	2017-02-26 13:43:07.387836+00	223	f	16	13	22
1481	2017-02-26 13:43:07.40284+00	9542	f	15	1040	23
1482	2017-02-26 13:43:07.417719+00	60	f	19	2	24
1483	2017-02-26 13:43:07.432766+00	16	f	31	1	25
1484	2017-02-26 13:43:07.447654+00	5077	f	18	94	26
1485	2017-02-26 13:43:07.462766+00	1307	f	21	12	27
1486	2017-02-26 13:43:07.477657+00	2766	f	22	146	28
1487	2017-02-26 13:43:07.49269+00	7	f	89	6	29
1488	2017-02-26 13:43:09.248274+00	29	f	26	5	31
1489	2017-02-26 13:43:09.321809+00	128	f	24	6	32
1490	2017-02-26 13:43:09.337955+00	216	f	23	5	33
1491	2017-02-26 13:43:09.352755+00	4457	f	25	290	34
1492	2017-02-26 13:43:10.630174+00	6799	f	27	711	36
1493	2017-02-26 13:43:10.696697+00	21821	f	28	1775	37
1494	2017-02-26 13:43:10.711478+00	22	f	34	1	38
1495	2017-02-26 13:43:10.72627+00	72	f	29	9	39
1496	2017-02-26 13:43:10.741171+00	41	f	30	5	40
1497	2017-02-26 13:43:10.756203+00	80	f	33	9	41
1498	2017-02-26 13:43:10.771132+00	123	f	32	4	42
1499	2017-02-26 13:43:10.796023+00	33	f	35	2	43
1500	2017-02-26 13:43:10.821276+00	5191	f	36	191	44
1501	2017-02-26 13:43:13.933884+00	112	f	38	1	47
1502	2017-02-26 13:43:14.004984+00	649	f	37	27	48
1503	2017-02-26 13:43:14.019771+00	12	f	46	0	49
1504	2017-02-26 13:43:14.034626+00	1462	f	39	38	50
1505	2017-02-26 13:43:14.049633+00	6398	f	40	105	51
1506	2017-02-26 13:43:14.064496+00	94	f	41	9	52
1507	2017-02-26 13:43:14.079524+00	2789	f	42	13	53
1508	2017-02-26 13:43:14.094434+00	36	f	43	13	54
1509	2017-02-26 13:43:15.619561+00	42	f	44	3	56
1510	2017-02-26 13:43:15.689033+00	52	f	45	3	57
1511	2017-02-26 13:43:15.703937+00	9	f	49	1	58
1512	2017-02-26 13:43:15.718751+00	68	f	47	1	59
1513	2017-02-26 13:43:15.733845+00	18086	f	48	887	60
1514	2017-02-26 13:43:15.748643+00	18	f	51	1	61
1515	2017-02-26 13:43:15.763808+00	7	f	56	32	62
1516	2017-02-26 13:43:15.778758+00	9	f	62	0	63
1517	2017-02-26 13:43:15.808959+00	12	f	61	1	64
1518	2017-02-26 13:43:15.833922+00	11	f	60	4	65
1519	2017-02-26 13:43:15.84901+00	59	f	53	29	66
1520	2017-02-26 13:43:15.86471+00	67	f	52	13	67
1521	2017-02-26 13:43:15.878917+00	48	f	54	8	68
1522	2017-02-26 13:43:17.138828+00	39	f	55	1	70
1523	2017-02-26 13:43:17.212444+00	19	f	59	3	71
1524	2017-02-26 13:43:17.228143+00	4	f	50	1	72
1525	2017-02-26 13:43:17.383747+00	5	f	57	1	73
1526	2017-02-26 13:43:17.473793+00	361	f	58	22	74
1527	2017-02-26 13:43:17.488823+00	9	f	70	0	75
1528	2017-02-26 13:43:19.049957+00	6	f	64	0	77
1529	2017-02-26 13:43:19.117864+00	32315	f	63	1969	78
1530	2017-02-26 13:43:20.445004+00	4	f	91	1	80
1531	2017-02-26 13:43:20.511354+00	19	f	66	1	81
1532	2017-02-26 13:43:20.526204+00	8	f	68	0	82
1533	2017-02-26 13:43:20.54095+00	8	f	65	1	83
1534	2017-02-26 13:43:20.555997+00	1224	f	67	47	84
1535	2017-02-26 13:43:20.570865+00	94	f	69	15	85
1536	2017-02-26 13:43:21.86101+00	1	f	71	1	87
1537	2017-02-26 13:43:21.955294+00	376	f	72	12	88
1538	2017-02-26 13:43:21.969894+00	150	f	73	8	89
1539	2017-02-26 13:43:21.984549+00	2080	f	74	24	90
1540	2017-02-26 13:43:21.999692+00	219	f	75	7	91
1541	2017-02-26 13:43:22.01451+00	0	f	76	3	92
1542	2017-02-26 13:43:22.029563+00	18	f	77	0	93
1543	2017-02-26 13:43:22.098737+00	9	f	80	5	94
1544	2017-02-26 13:43:22.120508+00	1761	f	78	35	95
1545	2017-02-26 13:43:22.135209+00	3207	f	79	180	96
1546	2017-02-26 13:43:22.150252+00	12	f	82	14	97
1547	2017-02-26 13:43:22.165123+00	4083	f	81	147	98
1548	2017-02-26 13:43:22.18006+00	3	f	83	5	99
1549	2017-02-26 13:53:03.560848+00	29279	t	2	875	2
1550	2017-02-26 13:53:03.666329+00	1079	f	4	33	3
1551	2017-02-26 13:53:03.680883+00	14219	f	5	823	4
1552	2017-02-26 13:53:03.695985+00	2501	f	6	87	5
1553	2017-02-26 13:53:05.824359+00	2250	f	92	147	6
1554	2017-02-26 13:53:05.841699+00	46	f	88	6	7
1555	2017-02-26 13:53:05.856206+00	486	f	8	26	8
1556	2017-02-26 13:53:05.871458+00	2966	f	7	229	9
1557	2017-02-26 13:53:07.122654+00	1167	f	9	39	11
1558	2017-02-26 13:53:07.20008+00	133	f	10	15	12
1559	2017-02-26 13:53:07.215155+00	20	f	90	1	13
1560	2017-02-26 13:53:07.229734+00	75	f	13	5	14
1561	2017-02-26 13:53:09.854349+00	46	f	17	8	16
1562	2017-02-26 13:53:09.942538+00	102	f	11	7	17
1563	2017-02-26 13:53:09.957022+00	483	f	12	18	18
1564	2017-02-26 13:53:09.972318+00	30	f	20	7	19
1565	2017-02-26 13:53:09.986739+00	349	f	14	19	20
1566	2017-02-26 13:53:11.30024+00	226	f	16	13	22
1567	2017-02-26 13:53:11.456388+00	9549	f	15	1041	23
1568	2017-02-26 13:53:11.470939+00	59	f	19	2	24
1569	2017-02-26 13:53:11.486232+00	18	f	31	1	25
1570	2017-02-26 13:53:11.500604+00	5078	f	18	94	26
1571	2017-02-26 13:53:11.516121+00	1310	f	21	12	27
1572	2017-02-26 13:53:11.530483+00	2765	f	22	146	28
1573	2017-02-26 13:53:13.305841+00	7	f	89	6	30
1574	2017-02-26 13:53:13.381311+00	27	f	26	5	31
1575	2017-02-26 13:53:13.395705+00	132	f	24	6	32
1576	2017-02-26 13:53:13.411249+00	215	f	23	5	33
1577	2017-02-26 13:53:13.435664+00	4455	f	25	290	34
1578	2017-02-26 13:53:14.836085+00	6800	f	27	711	36
1579	2017-02-26 13:53:14.91014+00	21821	f	28	1775	37
1580	2017-02-26 13:53:14.925206+00	20	f	34	1	38
1581	2017-02-26 13:53:14.939433+00	73	f	29	9	39
1582	2017-02-26 13:53:14.955358+00	37	f	30	5	40
1583	2017-02-26 13:53:14.969212+00	118	f	32	4	41
1584	2017-02-26 13:53:14.985084+00	76	f	33	9	42
1585	2017-02-26 13:53:14.999206+00	38	f	35	2	43
1586	2017-02-26 13:53:15.019495+00	5183	f	36	191	44
1587	2017-02-26 13:53:18.105106+00	110	f	38	1	47
1588	2017-02-26 13:53:18.18442+00	648	f	37	27	48
1589	2017-02-26 13:53:18.197455+00	12	f	46	0	49
1590	2017-02-26 13:53:18.213538+00	1464	f	39	38	50
1591	2017-02-26 13:53:18.227361+00	6396	f	40	105	51
1592	2017-02-26 13:53:18.242653+00	93	f	41	9	52
1593	2017-02-26 13:53:18.257549+00	2787	f	42	13	53
1594	2017-02-26 13:53:18.272606+00	37	f	43	13	54
1595	2017-02-26 13:53:19.685227+00	42	f	44	3	56
1596	2017-02-26 13:53:19.767268+00	55	f	45	3	57
1597	2017-02-26 13:53:19.781785+00	10	f	49	1	58
1598	2017-02-26 13:53:19.797917+00	65	f	47	1	59
1599	2017-02-26 13:53:19.811643+00	18086	f	48	887	60
1600	2017-02-26 13:53:19.827864+00	16	f	51	1	61
1601	2017-02-26 13:53:19.841452+00	9	f	56	32	62
1602	2017-02-26 13:53:19.861575+00	10	f	62	0	63
1603	2017-02-26 13:53:19.881537+00	11	f	61	1	64
1604	2017-02-26 13:53:19.896937+00	13	f	60	4	65
1605	2017-02-26 13:53:19.911613+00	71	f	52	13	66
1606	2017-02-26 13:53:19.926898+00	61	f	53	29	67
1607	2017-02-26 13:53:19.941597+00	47	f	54	8	68
1608	2017-02-26 13:53:21.342678+00	40	f	55	1	70
1609	2017-02-26 13:53:21.426372+00	18	f	59	3	71
1610	2017-02-26 13:53:21.44251+00	2	f	50	1	72
1611	2017-02-26 13:53:21.455952+00	3	f	57	1	73
1612	2017-02-26 13:53:21.472335+00	364	f	58	22	74
1613	2017-02-26 13:53:21.485868+00	6	f	70	0	75
1614	2017-02-26 13:53:23.101724+00	7	f	64	0	77
1615	2017-02-26 13:53:23.170539+00	32309	f	63	1969	78
1616	2017-02-26 13:53:24.528307+00	1	f	91	1	80
1617	2017-02-26 13:53:24.59433+00	19	f	66	1	81
1618	2017-02-26 13:53:24.610958+00	11	f	68	0	82
1619	2017-02-26 13:53:24.624017+00	9	f	65	1	83
1620	2017-02-26 13:53:24.639741+00	1223	f	67	47	84
1621	2017-02-26 13:53:24.654017+00	90	f	69	15	85
1622	2017-02-26 13:53:25.915836+00	2	f	71	1	87
1623	2017-02-26 13:53:25.96771+00	387	f	72	12	88
1624	2017-02-26 13:53:25.984392+00	147	f	73	8	89
1625	2017-02-26 13:53:25.997444+00	2078	f	74	24	90
1626	2017-02-26 13:53:26.012563+00	221	f	75	7	91
1627	2017-02-26 13:53:26.027266+00	0	f	76	3	92
1628	2017-02-26 13:53:26.042568+00	16	f	77	0	93
1629	2017-02-26 13:53:26.075072+00	9	f	80	5	94
1630	2017-02-26 13:53:26.088008+00	1763	f	78	35	95
1631	2017-02-26 13:53:26.103318+00	3205	f	79	180	96
1632	2017-02-26 13:53:26.117734+00	12	f	82	14	97
1633	2017-02-26 13:53:26.13294+00	4077	f	81	147	98
1634	2017-02-26 13:53:26.147602+00	3	f	83	5	99
1635	2017-02-26 14:03:02.766398+00	29295	t	2	875	2
1636	2017-02-26 14:03:03.064459+00	1110	f	4	35	3
1637	2017-02-26 14:03:03.08695+00	14226	f	5	823	4
1638	2017-02-26 14:03:03.103863+00	2503	f	6	87	5
1639	2017-02-26 14:03:03.116645+00	57	f	88	6	6
1640	2017-02-26 14:03:03.134009+00	2258	f	92	147	7
1641	2017-02-26 14:03:03.146861+00	491	f	8	26	8
1642	2017-02-26 14:03:03.161953+00	2960	f	7	229	9
1643	2017-02-26 14:03:04.642045+00	30	f	90	1	11
1644	2017-02-26 14:03:04.849398+00	135	f	10	15	12
1645	2017-02-26 14:03:04.871144+00	1173	f	9	40	13
1646	2017-02-26 14:03:04.886038+00	78	f	13	5	14
1647	2017-02-26 14:03:06.548118+00	53	f	17	8	16
1648	2017-02-26 14:03:06.626014+00	103	f	11	7	17
1649	2017-02-26 14:03:06.643382+00	34	f	20	7	18
1650	2017-02-26 14:03:06.655767+00	489	f	12	18	19
1651	2017-02-26 14:03:06.670852+00	350	f	14	19	20
1652	2017-02-26 14:03:07.994992+00	223	f	16	13	22
1653	2017-02-26 14:03:08.054495+00	9548	f	15	1041	23
1654	2017-02-26 14:03:08.076846+00	59	f	19	2	24
1655	2017-02-26 14:03:08.0892+00	20	f	31	1	25
1656	2017-02-26 14:03:08.104119+00	5079	f	18	94	26
1657	2017-02-26 14:03:08.118985+00	1309	f	21	12	27
1658	2017-02-26 14:03:08.134778+00	2765	f	22	146	28
1659	2017-02-26 14:03:09.698428+00	6	f	89	6	30
1660	2017-02-26 14:03:09.768712+00	26	f	26	5	31
1661	2017-02-26 14:03:09.783278+00	135	f	24	6	32
1662	2017-02-26 14:03:09.79839+00	215	f	23	5	33
1663	2017-02-26 14:03:09.813222+00	4455	f	25	290	34
1664	2017-02-26 14:03:11.105583+00	6805	f	27	711	36
1665	2017-02-26 14:03:11.17735+00	21830	f	28	1775	37
1666	2017-02-26 14:03:11.22903+00	21	f	34	1	38
1667	2017-02-26 14:03:11.262762+00	69	f	29	9	39
1668	2017-02-26 14:03:11.32265+00	40	f	30	5	40
1669	2017-02-26 14:03:11.337379+00	118	f	32	4	41
1670	2017-02-26 14:03:11.35247+00	77	f	33	9	42
1671	2017-02-26 14:03:11.367448+00	36	f	35	2	43
1672	2017-02-26 14:03:11.382515+00	5184	f	36	191	44
1673	2017-02-26 14:03:14.591401+00	114	f	38	1	47
1674	2017-02-26 14:03:14.661347+00	648	f	37	27	48
1675	2017-02-26 14:03:14.6762+00	10	f	46	0	49
1676	2017-02-26 14:03:14.6912+00	1459	f	39	38	50
1677	2017-02-26 14:03:14.706017+00	6396	f	40	105	51
1678	2017-02-26 14:03:14.721034+00	97	f	41	9	52
1679	2017-02-26 14:03:14.735832+00	2783	f	42	13	53
1680	2017-02-26 14:03:14.750907+00	41	f	43	12	54
1681	2017-02-26 14:03:16.297827+00	42	f	44	3	56
1682	2017-02-26 14:03:16.370537+00	52	f	45	3	57
1683	2017-02-26 14:03:16.385347+00	12	f	49	1	58
1684	2017-02-26 14:03:16.400291+00	64	f	47	1	59
1685	2017-02-26 14:03:16.415179+00	18089	f	48	887	60
1686	2017-02-26 14:03:16.430043+00	15	f	51	1	61
1687	2017-02-26 14:03:16.445256+00	7	f	56	33	62
1688	2017-02-26 14:03:16.460195+00	6	f	62	0	63
1689	2017-02-26 14:03:16.475391+00	12	f	61	1	64
1690	2017-02-26 14:03:16.490342+00	9	f	60	4	65
1691	2017-02-26 14:03:16.505484+00	74	f	52	13	66
1692	2017-02-26 14:03:16.520431+00	55	f	53	29	67
1693	2017-02-26 14:03:16.535553+00	43	f	54	8	68
1694	2017-02-26 14:03:17.972602+00	43	f	55	1	70
1695	2017-02-26 14:03:18.045074+00	18	f	59	3	71
1696	2017-02-26 14:03:18.110048+00	5	f	57	1	72
1697	2017-02-26 14:03:18.125018+00	360	f	58	22	73
1698	2017-02-26 14:03:18.140143+00	10	f	70	0	74
1699	2017-02-26 14:03:19.689623+00	7	f	64	0	76
1700	2017-02-26 14:03:19.764387+00	32322	f	63	1969	77
1701	2017-02-26 14:03:21.126501+00	4	f	91	1	79
1702	2017-02-26 14:03:21.192846+00	17	f	66	1	80
1703	2017-02-26 14:03:21.207401+00	12	f	68	0	81
1704	2017-02-26 14:03:21.222433+00	8	f	65	1	82
1705	2017-02-26 14:03:21.237414+00	2	f	50	1	83
1706	2017-02-26 14:03:21.252428+00	1225	f	67	47	84
1707	2017-02-26 14:03:21.267454+00	92	f	69	15	85
1708	2017-02-26 14:03:22.608387+00	2	f	71	1	87
1709	2017-02-26 14:03:22.686679+00	383	f	72	12	88
1710	2017-02-26 14:03:22.701407+00	147	f	73	8	89
1711	2017-02-26 14:03:22.716297+00	2081	f	74	24	90
1712	2017-02-26 14:03:22.731378+00	217	f	75	7	91
1713	2017-02-26 14:03:22.746243+00	1	f	76	3	92
1714	2017-02-26 14:03:22.761218+00	20	f	77	0	93
1715	2017-02-26 14:03:22.776209+00	9	f	80	5	94
1716	2017-02-26 14:03:22.791369+00	1763	f	78	35	95
1717	2017-02-26 14:03:22.806301+00	3210	f	79	180	96
1718	2017-02-26 14:03:22.821611+00	4076	f	81	147	97
1719	2017-02-26 14:03:22.836339+00	10	f	82	13	98
1720	2017-02-26 14:03:22.851486+00	5	f	83	5	99
1721	2017-02-26 14:13:03.25364+00	29312	t	2	874	2
1722	2017-02-26 14:13:03.349696+00	1150	f	4	35	3
1723	2017-02-26 14:13:03.364966+00	14228	f	5	823	4
1724	2017-02-26 14:13:03.379484+00	69	f	88	6	5
1725	2017-02-26 14:13:03.394847+00	2517	f	6	87	6
1726	2017-02-26 14:13:03.40926+00	2272	f	92	148	7
1727	2017-02-26 14:13:03.42463+00	44	f	90	1	8
1728	2017-02-26 14:13:03.439259+00	492	f	8	26	9
1729	2017-02-26 14:13:03.454692+00	2968	f	7	229	10
1730	2017-02-26 14:13:03.469144+00	143	f	10	15	11
1731	2017-02-26 14:13:04.846917+00	1176	f	9	40	13
1732	2017-02-26 14:13:04.903295+00	83	f	13	5	14
1733	2017-02-26 14:13:06.591841+00	107	f	11	7	16
1734	2017-02-26 14:13:06.673637+00	34	f	20	7	17
1735	2017-02-26 14:13:06.687854+00	485	f	12	18	18
1736	2017-02-26 14:13:06.703177+00	347	f	14	19	19
1737	2017-02-26 14:13:08.212754+00	226	f	16	13	21
1738	2017-02-26 14:13:08.282059+00	9554	f	15	1041	22
1739	2017-02-26 14:13:08.307267+00	61	f	19	3	23
1740	2017-02-26 14:13:08.331387+00	21	f	31	1	24
1741	2017-02-26 14:13:08.347018+00	5075	f	18	94	25
1742	2017-02-26 14:13:08.3616+00	1313	f	21	12	26
1743	2017-02-26 14:13:08.376961+00	2759	f	22	146	27
1744	2017-02-26 14:13:08.391569+00	6	f	89	6	28
1745	2017-02-26 14:13:10.033637+00	135	f	24	6	30
1746	2017-02-26 14:13:10.092214+00	27	f	26	5	31
1747	2017-02-26 14:13:10.106569+00	212	f	23	5	32
1748	2017-02-26 14:13:10.122106+00	4463	f	25	290	33
1749	2017-02-26 14:13:11.474576+00	6805	f	27	711	35
1750	2017-02-26 14:13:11.586595+00	21824	f	28	1775	36
1751	2017-02-26 14:13:11.600338+00	23	f	34	1	37
1752	2017-02-26 14:13:11.634339+00	71	f	29	9	38
1753	2017-02-26 14:13:11.655651+00	42	f	30	5	39
1754	2017-02-26 14:13:11.670208+00	121	f	32	4	40
1755	2017-02-26 14:13:11.685676+00	77	f	33	9	41
1756	2017-02-26 14:13:11.700119+00	37	f	35	2	42
1757	2017-02-26 14:13:11.715757+00	5183	f	36	191	43
1758	2017-02-26 14:13:14.883601+00	109	f	38	1	46
1759	2017-02-26 14:13:14.95496+00	650	f	37	27	47
1760	2017-02-26 14:13:14.968877+00	12	f	46	0	48
1761	2017-02-26 14:13:14.984223+00	1460	f	39	38	49
1762	2017-02-26 14:13:14.998813+00	6396	f	40	105	50
1763	2017-02-26 14:13:15.014061+00	93	f	41	9	51
1764	2017-02-26 14:13:15.028775+00	2785	f	42	13	52
1765	2017-02-26 14:13:15.044016+00	40	f	43	12	53
1766	2017-02-26 14:13:16.617787+00	40	f	44	3	55
1767	2017-02-26 14:13:16.699081+00	49	f	45	3	56
1768	2017-02-26 14:13:16.713281+00	12	f	49	1	57
1769	2017-02-26 14:13:16.728681+00	66	f	47	1	58
1770	2017-02-26 14:13:16.743081+00	18088	f	48	887	59
1771	2017-02-26 14:13:16.758598+00	16	f	51	1	60
1772	2017-02-26 14:13:16.772959+00	10	f	56	33	61
1773	2017-02-26 14:13:16.788612+00	7	f	62	0	62
1774	2017-02-26 14:13:16.803032+00	11	f	61	1	63
1775	2017-02-26 14:13:16.818673+00	12	f	60	4	64
1776	2017-02-26 14:13:16.833028+00	68	f	52	13	65
1777	2017-02-26 14:13:16.848675+00	62	f	53	29	66
1778	2017-02-26 14:13:16.863296+00	47	f	54	8	67
1779	2017-02-26 14:13:18.612013+00	1	f	93	0	68
1780	2017-02-26 14:13:19.932329+00	41	f	55	1	70
1781	2017-02-26 14:13:20.027978+00	19	f	59	3	71
1782	2017-02-26 14:13:20.04166+00	5	f	57	1	72
1783	2017-02-26 14:13:20.057552+00	368	f	58	22	73
1784	2017-02-26 14:13:20.071571+00	8	f	70	0	74
1785	2017-02-26 14:13:21.697376+00	5	f	64	0	76
1786	2017-02-26 14:13:21.782642+00	32316	f	63	1969	77
1787	2017-02-26 14:13:23.109115+00	2	f	91	1	79
1788	2017-02-26 14:13:23.176211+00	19	f	66	1	80
1789	2017-02-26 14:13:23.189692+00	10	f	68	0	81
1790	2017-02-26 14:13:23.205818+00	8	f	65	1	82
1791	2017-02-26 14:13:23.219489+00	1225	f	67	47	83
1792	2017-02-26 14:13:23.235862+00	94	f	69	15	84
1793	2017-02-26 14:13:24.518673+00	1	f	71	1	86
1794	2017-02-26 14:13:24.610137+00	384	f	72	12	87
1795	2017-02-26 14:13:24.623545+00	151	f	73	8	88
1796	2017-02-26 14:13:24.63988+00	2081	f	74	24	89
1797	2017-02-26 14:13:24.653297+00	219	f	75	7	90
1798	2017-02-26 14:13:24.669618+00	0	f	76	3	91
1799	2017-02-26 14:13:24.683136+00	20	f	77	0	92
1800	2017-02-26 14:13:24.69859+00	8	f	80	5	93
1801	2017-02-26 14:13:24.713127+00	1765	f	78	35	94
1802	2017-02-26 14:13:24.728551+00	3206	f	79	181	95
1803	2017-02-26 14:13:24.743175+00	4080	f	81	147	96
1804	2017-02-26 14:13:24.758677+00	8	f	82	13	97
1805	2017-02-26 14:13:24.773209+00	5	f	83	5	98
1806	2017-02-26 14:13:24.788654+00	150	f	85	26	99
1807	2017-02-26 14:23:03.905881+00	29321	t	2	874	2
1808	2017-02-26 14:23:03.989353+00	1191	f	4	35	3
1809	2017-02-26 14:23:04.004905+00	14227	f	5	823	4
1810	2017-02-26 14:23:04.019082+00	89	f	88	7	5
1811	2017-02-26 14:23:04.034793+00	54	f	90	2	6
1812	2017-02-26 14:23:04.04894+00	2516	f	6	88	7
1813	2017-02-26 14:23:04.08068+00	2274	f	92	149	8
1814	2017-02-26 14:23:04.094744+00	499	f	8	26	9
1815	2017-02-26 14:23:04.110777+00	2965	f	7	229	10
1816	2017-02-26 14:23:04.124479+00	145	f	10	14	11
1817	2017-02-26 14:23:05.51358+00	1175	f	9	40	13
1818	2017-02-26 14:23:07.334415+00	85	f	13	7	15
1819	2017-02-26 14:23:07.359024+00	108	f	11	7	16
1820	2017-02-26 14:23:07.372759+00	36	f	20	7	17
1821	2017-02-26 14:23:07.389007+00	492	f	12	18	18
1822	2017-02-26 14:23:07.402745+00	354	f	14	19	19
1823	2017-02-26 14:23:08.753336+00	227	f	16	13	21
1824	2017-02-26 14:23:08.972953+00	21	f	31	1	22
1825	2017-02-26 14:23:09.002304+00	9552	f	15	1041	23
1826	2017-02-26 14:23:09.017226+00	10	f	89	6	24
1827	2017-02-26 14:23:09.033205+00	5081	f	18	94	25
1828	2017-02-26 14:23:09.046828+00	1315	f	21	12	26
1829	2017-02-26 14:23:09.062161+00	2761	f	22	146	27
1830	2017-02-26 14:23:10.673117+00	28	f	26	5	29
1831	2017-02-26 14:23:10.781109+00	129	f	24	6	30
1832	2017-02-26 14:23:10.797+00	215	f	23	5	31
1833	2017-02-26 14:23:10.811805+00	4455	f	25	290	32
1834	2017-02-26 14:23:12.152493+00	6802	f	27	711	34
1835	2017-02-26 14:23:12.226382+00	21828	f	28	1775	35
1836	2017-02-26 14:23:12.242241+00	22	f	34	1	36
1837	2017-02-26 14:23:12.255785+00	74	f	29	9	37
1838	2017-02-26 14:23:12.27204+00	39	f	30	5	38
1839	2017-02-26 14:23:12.285599+00	122	f	32	4	39
1840	2017-02-26 14:23:12.301984+00	79	f	33	9	40
1841	2017-02-26 14:23:12.315592+00	37	f	35	2	41
1842	2017-02-26 14:23:13.883743+00	5185	f	36	191	43
1843	2017-02-26 14:23:15.579521+00	111	f	38	1	45
1844	2017-02-26 14:23:15.65121+00	646	f	37	27	46
1845	2017-02-26 14:23:15.664631+00	12	f	46	0	47
1846	2017-02-26 14:23:15.681019+00	1457	f	39	38	48
1847	2017-02-26 14:23:15.694571+00	6394	f	40	105	49
1848	2017-02-26 14:23:15.711013+00	94	f	41	9	50
1849	2017-02-26 14:23:15.724541+00	2794	f	42	13	51
1850	2017-02-26 14:23:15.739308+00	41	f	43	11	52
1851	2017-02-26 14:23:17.15275+00	40	f	44	3	54
1852	2017-02-26 14:23:17.235978+00	53	f	45	4	55
1853	2017-02-26 14:23:17.24898+00	10	f	49	1	56
1854	2017-02-26 14:23:17.265266+00	70	f	47	1	57
1855	2017-02-26 14:23:17.278729+00	18094	f	48	887	58
1856	2017-02-26 14:23:17.293321+00	15	f	51	1	59
1857	2017-02-26 14:23:17.308729+00	6	f	56	33	60
1858	2017-02-26 14:23:17.32342+00	8	f	62	0	61
1859	2017-02-26 14:23:17.33891+00	13	f	61	1	62
1860	2017-02-26 14:23:17.353413+00	10	f	60	4	63
1861	2017-02-26 14:23:17.373398+00	72	f	52	13	64
1862	2017-02-26 14:23:17.388709+00	59	f	53	29	65
1863	2017-02-26 14:23:19.206382+00	1	f	94	1	66
1864	2017-02-26 14:23:19.230957+00	42	f	54	8	67
1865	2017-02-26 14:23:19.244141+00	1	f	93	1	68
1866	2017-02-26 14:23:20.653583+00	40	f	55	1	70
1867	2017-02-26 14:23:20.738472+00	20	f	59	3	71
1868	2017-02-26 14:23:20.754923+00	6	f	57	1	72
1869	2017-02-26 14:23:20.768214+00	361	f	58	22	73
1870	2017-02-26 14:23:20.784696+00	8	f	70	0	74
1871	2017-02-26 14:23:22.208617+00	6	f	64	0	76
1872	2017-02-26 14:23:22.28272+00	32312	f	63	1969	77
1873	2017-02-26 14:23:23.757367+00	2	f	91	1	79
1874	2017-02-26 14:23:23.816138+00	19	f	66	1	80
1875	2017-02-26 14:23:23.832804+00	12	f	68	0	81
1876	2017-02-26 14:23:23.846067+00	5	f	65	1	82
1877	2017-02-26 14:23:23.860012+00	1219	f	67	47	83
1878	2017-02-26 14:23:23.875867+00	90	f	69	15	84
1879	2017-02-26 14:23:25.050881+00	1	f	71	1	86
1880	2017-02-26 14:23:25.111967+00	382	f	72	12	87
1881	2017-02-26 14:23:25.126292+00	149	f	73	8	88
1882	2017-02-26 14:23:25.139364+00	2081	f	74	24	89
1883	2017-02-26 14:23:25.153317+00	217	f	75	7	90
1884	2017-02-26 14:23:25.16932+00	20	f	77	0	91
1885	2017-02-26 14:23:25.18362+00	1	f	76	3	92
1886	2017-02-26 14:23:25.199419+00	9	f	80	5	93
1887	2017-02-26 14:23:25.213251+00	1769	f	78	35	94
1888	2017-02-26 14:23:25.229305+00	3212	f	79	181	95
1889	2017-02-26 14:23:25.243373+00	4079	f	81	147	96
1890	2017-02-26 14:23:25.259427+00	11	f	82	13	97
1891	2017-02-26 14:23:25.273517+00	3	f	83	5	98
1892	2017-02-26 14:23:25.289564+00	152	f	85	26	99
1893	2017-02-26 14:33:03.435129+00	29342	t	2	876	2
1894	2017-02-26 14:33:03.501257+00	1223	f	4	36	3
1895	2017-02-26 14:33:03.510912+00	106	f	88	10	4
1896	2017-02-26 14:33:03.520788+00	14230	f	5	824	5
1897	2017-02-26 14:33:03.530744+00	67	f	90	2	6
1898	2017-02-26 14:33:03.540631+00	2530	f	6	90	7
1899	2017-02-26 14:33:03.550737+00	2290	f	92	150	8
1900	2017-02-26 14:33:03.560466+00	496	f	8	26	9
1901	2017-02-26 14:33:03.570469+00	156	f	10	14	10
1902	2017-02-26 14:33:03.580525+00	2966	f	7	229	11
1903	2017-02-26 14:33:04.974858+00	1184	f	9	40	13
1904	2017-02-26 14:33:06.743252+00	85	f	13	7	15
1905	2017-02-26 14:33:06.819554+00	111	f	11	7	16
1906	2017-02-26 14:33:06.839165+00	34	f	20	7	17
1907	2017-02-26 14:33:06.860138+00	488	f	12	18	18
1908	2017-02-26 14:33:06.869673+00	356	f	14	19	19
1909	2017-02-26 14:33:08.184941+00	22	f	31	1	21
1910	2017-02-26 14:33:08.253753+00	227	f	16	13	22
1911	2017-02-26 14:33:08.263651+00	12	f	89	6	23
1912	2017-02-26 14:33:08.273482+00	9548	f	15	1043	24
1913	2017-02-26 14:33:08.283367+00	5086	f	18	94	25
1914	2017-02-26 14:33:08.293266+00	6	f	94	2	26
1915	2017-02-26 14:33:08.30315+00	1313	f	21	12	27
1916	2017-02-26 14:33:08.313255+00	2765	f	22	146	28
1917	2017-02-26 14:33:09.845557+00	26	f	26	5	30
1918	2017-02-26 14:33:09.897721+00	129	f	24	6	31
1919	2017-02-26 14:33:09.907591+00	212	f	23	5	32
1920	2017-02-26 14:33:09.917512+00	4459	f	25	290	33
1921	2017-02-26 14:33:11.202663+00	6806	f	27	711	35
1922	2017-02-26 14:33:11.251773+00	21831	f	28	1775	36
1923	2017-02-26 14:33:11.291325+00	21	f	34	1	37
1924	2017-02-26 14:33:11.330652+00	72	f	29	9	38
1925	2017-02-26 14:33:11.341041+00	43	f	30	6	39
1926	2017-02-26 14:33:11.351037+00	126	f	32	4	40
1927	2017-02-26 14:33:11.370516+00	73	f	33	9	41
1928	2017-02-26 14:33:11.381991+00	36	f	35	2	42
1929	2017-02-26 14:33:13.078883+00	5191	f	36	191	44
1930	2017-02-26 14:33:14.706746+00	108	f	38	1	46
1931	2017-02-26 14:33:14.780154+00	651	f	37	27	47
1932	2017-02-26 14:33:14.789992+00	14	f	46	0	48
1933	2017-02-26 14:33:14.800033+00	1458	f	39	38	49
1934	2017-02-26 14:33:14.810152+00	6402	f	40	105	50
1935	2017-02-26 14:33:14.819804+00	92	f	41	10	51
1936	2017-02-26 14:33:14.829724+00	2791	f	42	13	52
1937	2017-02-26 14:33:14.839859+00	40	f	43	11	53
1938	2017-02-26 14:33:16.558311+00	39	f	44	3	55
1939	2017-02-26 14:33:16.624854+00	54	f	45	4	56
1940	2017-02-26 14:33:16.634621+00	10	f	49	1	57
1941	2017-02-26 14:33:16.644489+00	68	f	47	1	58
1942	2017-02-26 14:33:16.654409+00	18097	f	48	887	59
1943	2017-02-26 14:33:16.66433+00	10	f	56	33	60
1944	2017-02-26 14:33:16.674494+00	17	f	51	1	61
1945	2017-02-26 14:33:16.684382+00	9	f	62	0	62
1946	2017-02-26 14:33:16.704509+00	12	f	61	1	63
1947	2017-02-26 14:33:16.714562+00	10	f	60	4	64
1948	2017-02-26 14:33:16.724438+00	67	f	52	13	65
1949	2017-02-26 14:33:16.734411+00	63	f	53	29	66
1950	2017-02-26 14:33:18.517381+00	1	f	95	0	67
1951	2017-02-26 14:33:18.559839+00	42	f	54	8	68
1952	2017-02-26 14:33:19.969848+00	10	f	70	0	70
1953	2017-02-26 14:33:20.072737+00	39	f	55	1	71
1954	2017-02-26 14:33:20.083745+00	17	f	59	3	72
1955	2017-02-26 14:33:20.254959+00	5	f	57	1	73
1956	2017-02-26 14:33:20.272936+00	361	f	58	22	74
1957	2017-02-26 14:33:21.863829+00	7	f	64	0	76
1958	2017-02-26 14:33:21.948624+00	32318	f	63	1969	77
1959	2017-02-26 14:33:23.29114+00	4	f	91	1	79
1960	2017-02-26 14:33:23.362237+00	17	f	66	1	80
1961	2017-02-26 14:33:23.37203+00	11	f	68	0	81
1962	2017-02-26 14:33:23.381909+00	6	f	65	1	82
1963	2017-02-26 14:33:23.391879+00	1224	f	67	47	83
1964	2017-02-26 14:33:23.401787+00	93	f	69	15	84
1965	2017-02-26 14:33:24.677512+00	1	f	71	1	86
1966	2017-02-26 14:33:24.786772+00	383	f	72	12	87
1967	2017-02-26 14:33:24.816259+00	143	f	73	8	88
1968	2017-02-26 14:33:24.826123+00	2079	f	74	24	89
1969	2017-02-26 14:33:24.835955+00	220	f	75	7	90
1970	2017-02-26 14:33:24.845966+00	20	f	77	0	91
1971	2017-02-26 14:33:24.855875+00	0	f	76	4	92
1972	2017-02-26 14:33:24.865736+00	8	f	80	5	93
1973	2017-02-26 14:33:24.875768+00	1764	f	78	35	94
1974	2017-02-26 14:33:24.885721+00	3214	f	79	181	95
1975	2017-02-26 14:33:24.895793+00	4087	f	81	147	96
1976	2017-02-26 14:33:24.905753+00	8	f	82	13	97
1977	2017-02-26 14:33:24.915861+00	4	f	83	5	98
1978	2017-02-26 14:33:24.925841+00	151	f	85	26	99
1979	2017-02-26 14:43:03.439444+00	29357	t	2	875	2
1980	2017-02-26 14:43:03.587555+00	139	f	88	11	3
1981	2017-02-26 14:43:03.634013+00	1262	f	4	36	4
1982	2017-02-26 14:43:03.785407+00	100	f	90	2	5
1983	2017-02-26 14:43:03.929944+00	14235	f	5	824	6
1984	2017-02-26 14:43:04.055373+00	2527	f	6	90	7
1985	2017-02-26 14:43:04.069876+00	2302	f	92	150	8
1986	2017-02-26 14:43:04.084725+00	154	f	10	15	9
1987	2017-02-26 14:43:04.104118+00	505	f	8	26	10
1988	2017-02-26 14:43:04.119628+00	2961	f	7	227	11
1989	2017-02-26 14:43:05.47594+00	1192	f	9	40	13
1990	2017-02-26 14:43:07.190053+00	90	f	13	7	15
1991	2017-02-26 14:43:07.308244+00	13	f	94	4	16
1992	2017-02-26 14:43:07.327132+00	42	f	20	8	17
1993	2017-02-26 14:43:07.342828+00	112	f	11	7	18
1994	2017-02-26 14:43:07.358172+00	496	f	12	18	19
1995	2017-02-26 14:43:07.372824+00	351	f	14	19	20
1996	2017-02-26 14:43:07.388217+00	24	f	31	1	21
1997	2017-02-26 14:43:08.901706+00	12	f	89	6	23
1998	2017-02-26 14:43:08.993021+00	229	f	16	13	24
1999	2017-02-26 14:43:09.007397+00	9552	f	15	1043	25
2000	2017-02-26 14:43:09.022845+00	5078	f	18	94	26
2001	2017-02-26 14:43:09.037242+00	1317	f	21	12	27
2002	2017-02-26 14:43:09.052636+00	2765	f	22	146	28
2003	2017-02-26 14:43:10.619309+00	29	f	26	5	30
2004	2017-02-26 14:43:10.691904+00	131	f	24	6	31
2005	2017-02-26 14:43:10.707365+00	216	f	23	5	32
2006	2017-02-26 14:43:10.72166+00	4463	f	25	290	33
2007	2017-02-26 14:43:12.037724+00	6806	f	27	711	35
2008	2017-02-26 14:43:12.226051+00	24	f	34	1	36
2009	2017-02-26 14:43:12.241506+00	21832	f	28	1775	37
2010	2017-02-26 14:43:12.255606+00	72	f	29	9	38
2011	2017-02-26 14:43:12.271398+00	45	f	30	6	39
2012	2017-02-26 14:43:12.285486+00	124	f	32	4	40
2013	2017-02-26 14:43:12.302401+00	75	f	33	9	41
2014	2017-02-26 14:43:12.315398+00	33	f	35	2	42
2015	2017-02-26 14:43:15.280354+00	5186	f	36	191	45
2016	2017-02-26 14:43:15.339505+00	115	f	38	1	46
2017	2017-02-26 14:43:15.35317+00	651	f	37	27	47
2018	2017-02-26 14:43:15.369244+00	11	f	46	0	48
2019	2017-02-26 14:43:15.383122+00	1460	f	39	38	49
2020	2017-02-26 14:43:15.399351+00	6398	f	40	105	50
2021	2017-02-26 14:43:15.413242+00	95	f	41	10	51
2022	2017-02-26 14:43:15.429385+00	2789	f	42	13	52
2023	2017-02-26 14:43:17.071263+00	39	f	44	3	54
2024	2017-02-26 14:43:17.155012+00	36	f	43	11	55
2025	2017-02-26 14:43:17.16822+00	54	f	45	4	56
2026	2017-02-26 14:43:17.194416+00	13	f	49	2	57
2027	2017-02-26 14:43:17.20801+00	63	f	47	1	58
2028	2017-02-26 14:43:17.224331+00	11	f	56	33	59
2029	2017-02-26 14:43:17.238344+00	18095	f	48	887	60
2030	2017-02-26 14:43:17.254575+00	12	f	60	4	61
2031	2017-02-26 14:43:17.274701+00	18	f	51	1	62
2032	2017-02-26 14:43:17.288225+00	9	f	62	0	63
2033	2017-02-26 14:43:17.304611+00	13	f	61	1	64
2034	2017-02-26 14:43:19.187769+00	1	f	96	0	65
2035	2017-02-26 14:43:19.203428+00	69	f	52	13	66
2036	2017-02-26 14:43:19.219843+00	63	f	53	29	67
2037	2017-02-26 14:43:19.239886+00	1	f	95	0	68
2038	2017-02-26 14:43:19.253249+00	42	f	54	8	69
2039	2017-02-26 14:43:20.709683+00	3	f	71	1	71
2040	2017-02-26 14:43:20.797615+00	9	f	70	0	72
2041	2017-02-26 14:43:20.813891+00	44	f	55	1	73
2042	2017-02-26 14:43:20.827121+00	19	f	59	3	74
2043	2017-02-26 14:43:20.842901+00	4	f	57	1	75
2044	2017-02-26 14:43:20.857214+00	360	f	58	22	76
2045	2017-02-26 14:43:22.423896+00	6	f	64	0	78
2046	2017-02-26 14:43:22.502323+00	32319	f	63	1969	79
2047	2017-02-26 14:43:23.809752+00	5	f	91	1	81
2048	2017-02-26 14:43:23.882632+00	18	f	66	1	82
2049	2017-02-26 14:43:23.895116+00	10	f	68	0	83
2050	2017-02-26 14:43:23.915152+00	7	f	65	1	84
2051	2017-02-26 14:43:23.930972+00	1217	f	67	47	85
2052	2017-02-26 14:43:23.944893+00	89	f	69	15	86
2053	2017-02-26 14:43:25.228332+00	381	f	72	12	88
2054	2017-02-26 14:43:25.248475+00	146	f	73	8	89
2055	2017-02-26 14:43:25.264615+00	2079	f	74	24	90
2056	2017-02-26 14:43:25.278476+00	218	f	75	7	91
2057	2017-02-26 14:43:25.294557+00	19	f	77	0	92
2058	2017-02-26 14:43:25.308523+00	1	f	76	4	93
2059	2017-02-26 14:43:25.324755+00	8	f	80	5	94
2060	2017-02-26 14:43:25.338714+00	1769	f	78	35	95
2061	2017-02-26 14:43:25.354579+00	3211	f	79	181	96
2062	2017-02-26 14:43:25.368553+00	4080	f	81	147	97
2063	2017-02-26 14:43:25.384677+00	11	f	82	13	98
2064	2017-02-26 14:43:25.398574+00	4	f	83	5	99
2065	2017-02-26 14:53:03.916623+00	172	f	88	12	2
2066	2017-02-26 14:53:04.009475+00	29378	t	2	874	3
2067	2017-02-26 14:53:04.027051+00	130	f	90	2	4
2068	2017-02-26 14:53:04.039276+00	1309	f	4	37	5
2069	2017-02-26 14:53:04.049196+00	14246	f	5	824	6
2070	2017-02-26 14:53:04.059136+00	2535	f	6	90	7
2071	2017-02-26 14:53:04.069039+00	2318	f	92	150	8
2072	2017-02-26 14:53:04.079065+00	170	f	10	15	9
2073	2017-02-26 14:53:04.08904+00	515	f	8	26	10
2074	2017-02-26 14:53:04.099015+00	2963	f	7	227	11
2075	2017-02-26 14:53:05.400304+00	1198	f	9	40	13
2076	2017-02-26 14:53:07.292515+00	19	f	94	8	15
2077	2017-02-26 14:53:07.365407+00	96	f	13	7	16
2078	2017-02-26 14:53:07.378224+00	41	f	20	8	17
2079	2017-02-26 14:53:07.388118+00	112	f	11	7	18
2080	2017-02-26 14:53:07.398024+00	17	f	89	6	19
2081	2017-02-26 14:53:07.40795+00	26	f	31	1	20
2082	2017-02-26 14:53:07.428062+00	495	f	12	18	21
2083	2017-02-26 14:53:07.438038+00	362	f	14	19	22
2084	2017-02-26 14:53:08.853986+00	234	f	16	13	24
2085	2017-02-26 14:53:08.912644+00	9552	f	15	1043	25
2086	2017-02-26 14:53:08.929307+00	5091	f	18	94	26
2087	2017-02-26 14:53:08.961075+00	1322	f	21	12	27
2088	2017-02-26 14:53:08.981871+00	2765	f	22	146	28
2089	2017-02-26 14:53:10.792791+00	29	f	26	5	30
2090	2017-02-26 14:53:10.817099+00	129	f	24	6	31
2091	2017-02-26 14:53:10.827025+00	217	f	23	5	32
2092	2017-02-26 14:53:10.836945+00	4454	f	25	290	33
2093	2017-02-26 14:53:12.123988+00	6800	f	27	711	35
2094	2017-02-26 14:53:12.197921+00	22	f	34	1	36
2095	2017-02-26 14:53:12.210967+00	21839	f	28	1776	37
2096	2017-02-26 14:53:12.227737+00	43	f	30	6	38
2097	2017-02-26 14:53:12.240779+00	72	f	29	9	39
2098	2017-02-26 14:53:14.30203+00	123	f	32	4	41
2099	2017-02-26 14:53:14.426924+00	79	f	33	9	42
2100	2017-02-26 14:53:15.998647+00	34	f	35	2	44
2101	2017-02-26 14:53:16.098458+00	5190	f	36	191	45
2102	2017-02-26 14:53:16.11812+00	13	f	46	0	46
2103	2017-02-26 14:53:16.138115+00	110	f	38	1	47
2104	2017-02-26 14:53:16.151219+00	650	f	37	27	48
2105	2017-02-26 14:53:16.167547+00	1456	f	39	38	49
2106	2017-02-26 14:53:17.806015+00	6389	f	40	105	51
2107	2017-02-26 14:53:17.875902+00	92	f	41	10	52
2108	2017-02-26 14:53:17.892831+00	2789	f	42	13	53
2109	2017-02-26 14:53:17.905709+00	42	f	44	3	54
2110	2017-02-26 14:53:17.922056+00	38	f	43	11	55
2111	2017-02-26 14:53:17.935577+00	53	f	45	4	56
2112	2017-02-26 14:53:17.951871+00	12	f	49	2	57
2113	2017-02-26 14:53:17.96555+00	64	f	47	1	58
2114	2017-02-26 14:53:17.981789+00	8	f	56	33	59
2115	2017-02-26 14:53:18.002579+00	18089	f	48	887	60
2116	2017-02-26 14:53:18.015649+00	10	f	60	4	61
2117	2017-02-26 14:53:18.032656+00	15	f	51	1	62
2118	2017-02-26 14:53:18.045859+00	9	f	62	0	63
2119	2017-02-26 14:53:18.062112+00	14	f	61	1	64
2120	2017-02-26 14:53:20.817463+00	1	f	97	1	65
2121	2017-02-26 14:53:22.643033+00	1	f	98	0	66
2122	2017-02-26 14:53:22.658539+00	0	f	96	1	67
2123	2017-02-26 14:53:22.675139+00	58	f	53	29	68
2124	2017-02-26 14:53:22.688554+00	71	f	52	13	69
2125	2017-02-26 14:53:22.704132+00	44	f	54	8	70
2126	2017-02-26 14:53:24.145193+00	2	f	71	1	72
2127	2017-02-26 14:53:24.238598+00	9	f	70	0	73
2128	2017-02-26 14:53:24.252657+00	40	f	55	1	74
2129	2017-02-26 14:53:24.269273+00	19	f	59	3	75
2130	2017-02-26 14:53:24.282704+00	4	f	57	2	76
2131	2017-02-26 14:53:24.298083+00	364	f	58	22	77
2132	2017-02-26 14:53:25.904092+00	6	f	64	0	79
2133	2017-02-26 14:53:26.007687+00	32323	f	63	1969	80
2134	2017-02-26 14:53:27.319769+00	3	f	91	1	82
2135	2017-02-26 14:53:27.387769+00	18	f	66	1	83
2136	2017-02-26 14:53:27.407773+00	10	f	68	0	84
2137	2017-02-26 14:53:27.421076+00	8	f	65	1	85
2138	2017-02-26 14:53:27.437522+00	1220	f	67	47	86
2139	2017-02-26 14:53:27.450933+00	91	f	69	15	87
2140	2017-02-26 14:53:28.614343+00	382	f	72	12	89
2141	2017-02-26 14:53:28.721548+00	148	f	73	8	90
2142	2017-02-26 14:53:28.741249+00	2079	f	74	24	91
2143	2017-02-26 14:53:28.754532+00	222	f	75	7	92
2144	2017-02-26 14:53:28.770967+00	21	f	77	0	93
2145	2017-02-26 14:53:28.784312+00	0	f	76	4	94
2146	2017-02-26 14:53:28.79936+00	10	f	80	5	95
2147	2017-02-26 14:53:28.814434+00	1760	f	78	35	96
2148	2017-02-26 14:53:28.829344+00	3207	f	79	181	97
2149	2017-02-26 14:53:28.844108+00	4075	f	81	147	98
2150	2017-02-26 14:53:28.859304+00	11	f	82	13	99
2151	2017-02-26 15:03:04.261023+00	218	f	88	15	2
2152	2017-02-26 15:03:04.526757+00	175	f	90	3	3
2153	2017-02-26 15:03:04.547034+00	29392	t	2	874	4
2154	2017-02-26 15:03:04.560125+00	1355	f	4	37	5
2155	2017-02-26 15:03:04.578262+00	14243	f	5	824	6
2156	2017-02-26 15:03:04.589927+00	2537	f	6	90	7
2157	2017-02-26 15:03:04.605287+00	2327	f	92	150	8
2158	2017-02-26 15:03:04.620018+00	30	f	94	11	9
2159	2017-02-26 15:03:04.635472+00	172	f	10	15	10
2160	2017-02-26 15:03:04.650029+00	515	f	8	26	11
2161	2017-02-26 15:03:04.665359+00	2966	f	7	227	12
2162	2017-02-26 15:03:06.011157+00	1194	f	9	40	14
2163	2017-02-26 15:03:07.848967+00	103	f	13	8	16
2164	2017-02-26 15:03:07.919224+00	48	f	20	9	17
2165	2017-02-26 15:03:07.935435+00	115	f	11	7	18
2166	2017-02-26 15:03:07.94891+00	17	f	89	6	19
2167	2017-02-26 15:03:07.964216+00	31	f	31	1	20
2168	2017-02-26 15:03:07.979019+00	497	f	12	18	21
2169	2017-02-26 15:03:07.994257+00	357	f	14	19	22
2170	2017-02-26 15:03:09.329639+00	234	f	16	13	24
2171	2017-02-26 15:03:09.359532+00	9557	f	15	1043	25
2172	2017-02-26 15:03:09.373109+00	5087	f	18	94	26
2173	2017-02-26 15:03:09.389256+00	1320	f	21	12	27
2174	2017-02-26 15:03:09.402852+00	2770	f	22	146	28
2175	2017-02-26 15:03:11.067835+00	33	f	26	5	30
2176	2017-02-26 15:03:11.127788+00	134	f	24	6	31
2177	2017-02-26 15:03:11.14374+00	215	f	23	5	32
2178	2017-02-26 15:03:11.157421+00	4460	f	25	290	33
2179	2017-02-26 15:03:12.53119+00	6803	f	27	711	35
2180	2017-02-26 15:03:12.601643+00	24	f	34	1	36
2181	2017-02-26 15:03:12.617409+00	3	f	98	0	37
2182	2017-02-26 15:03:14.196391+00	21831	f	28	1776	39
2183	2017-02-26 15:03:14.275968+00	44	f	30	6	40
2184	2017-02-26 15:03:14.291702+00	71	f	29	9	41
2185	2017-02-26 15:03:14.305705+00	121	f	32	4	42
2186	2017-02-26 15:03:14.331653+00	78	f	33	9	43
2187	2017-02-26 15:03:15.950849+00	39	f	35	2	45
2188	2017-02-26 15:03:16.081171+00	5188	f	36	191	46
2189	2017-02-26 15:03:16.09623+00	16	f	46	0	47
2190	2017-02-26 15:03:16.110445+00	110	f	38	1	48
2191	2017-02-26 15:03:17.724718+00	646	f	37	27	50
2192	2017-02-26 15:03:19.331659+00	1458	f	39	39	52
2193	2017-02-26 15:03:19.497206+00	6396	f	40	105	53
2194	2017-02-26 15:03:19.656676+00	91	f	41	10	54
2195	2017-02-26 15:03:19.670204+00	2785	f	42	13	55
2196	2017-02-26 15:03:19.685322+00	14	f	49	2	56
2197	2017-02-26 15:03:19.699972+00	36	f	43	11	57
2198	2017-02-26 15:03:19.71535+00	38	f	44	3	58
2199	2017-02-26 15:03:19.729813+00	49	f	45	4	59
2200	2017-02-26 15:03:19.745098+00	69	f	47	1	60
2201	2017-02-26 15:03:19.759797+00	12	f	56	33	61
2202	2017-02-26 15:03:19.775105+00	18099	f	48	887	62
2203	2017-02-26 15:03:19.789934+00	11	f	60	4	63
2204	2017-02-26 15:03:19.805262+00	16	f	51	1	64
2205	2017-02-26 15:03:19.819887+00	8	f	62	0	65
2206	2017-02-26 15:03:19.835332+00	12	f	61	1	66
2207	2017-02-26 15:03:21.683339+00	0	f	99	0	67
2208	2017-02-26 15:03:21.695575+00	2	f	97	2	68
2209	2017-02-26 15:03:21.710873+00	0	f	96	1	69
2210	2017-02-26 15:03:21.725282+00	59	f	53	29	70
2211	2017-02-26 15:03:21.740667+00	65	f	52	13	71
2212	2017-02-26 15:03:21.755228+00	40	f	54	8	72
2213	2017-02-26 15:03:23.206433+00	3	f	71	1	74
2214	2017-02-26 15:03:23.275649+00	7	f	70	0	75
2215	2017-02-26 15:03:23.289815+00	40	f	55	1	76
2216	2017-02-26 15:03:23.304949+00	20	f	59	3	77
2217	2017-02-26 15:03:23.319516+00	5	f	91	1	78
2218	2017-02-26 15:03:23.334897+00	2	f	57	2	79
2219	2017-02-26 15:03:23.349499+00	364	f	58	22	80
2220	2017-02-26 15:03:25.179231+00	7	f	64	0	82
2221	2017-02-26 15:03:25.25034+00	32317	f	63	1969	83
2222	2017-02-26 15:03:26.458508+00	18	f	66	1	85
2223	2017-02-26 15:03:26.523981+00	9	f	68	0	86
2224	2017-02-26 15:03:26.538331+00	5	f	65	1	87
2225	2017-02-26 15:03:26.553629+00	1225	f	67	47	88
2226	2017-02-26 15:03:26.568249+00	94	f	69	15	89
2227	2017-02-26 15:03:27.751509+00	384	f	72	12	91
2228	2017-02-26 15:03:27.817369+00	143	f	73	8	92
2229	2017-02-26 15:03:27.831681+00	2078	f	74	24	93
2230	2017-02-26 15:03:27.847187+00	216	f	75	7	94
2231	2017-02-26 15:03:27.861563+00	20	f	77	0	95
2232	2017-02-26 15:03:27.876916+00	0	f	76	4	96
2233	2017-02-26 15:03:27.906991+00	7	f	80	5	97
2234	2017-02-26 15:03:27.921833+00	1761	f	78	35	98
2235	2017-02-26 15:03:27.937128+00	3208	f	79	181	99
2236	2017-02-26 15:13:04.186663+00	300	f	88	25	2
2237	2017-02-26 15:13:04.271794+00	245	f	90	3	3
2238	2017-02-26 15:13:04.289011+00	29409	t	2	875	4
2239	2017-02-26 15:13:04.304212+00	1415	f	4	37	5
2240	2017-02-26 15:13:04.318964+00	14252	f	5	824	6
2241	2017-02-26 15:13:04.334021+00	53	f	94	13	7
2242	2017-02-26 15:13:04.348844+00	2552	f	6	89	8
2243	2017-02-26 15:13:04.364118+00	2346	f	92	149	9
2244	2017-02-26 15:13:04.379+00	184	f	10	15	10
2245	2017-02-26 15:13:04.394139+00	523	f	8	26	11
2246	2017-02-26 15:13:05.789326+00	2970	f	7	227	13
2247	2017-02-26 15:13:07.638289+00	1200	f	9	41	15
2248	2017-02-26 15:13:07.742192+00	105	f	13	8	16
2249	2017-02-26 15:13:07.763406+00	56	f	20	9	17
2250	2017-02-26 15:13:07.777706+00	23	f	89	8	18
2251	2017-02-26 15:13:07.793182+00	118	f	11	7	19
2252	2017-02-26 15:13:07.807586+00	32	f	31	1	20
2253	2017-02-26 15:13:07.823078+00	493	f	12	18	21
2254	2017-02-26 15:13:07.837585+00	363	f	14	19	22
2255	2017-02-26 15:13:09.147117+00	235	f	16	13	24
2256	2017-02-26 15:13:09.305217+00	9559	f	15	1044	25
2257	2017-02-26 15:13:09.321513+00	5080	f	18	94	26
2258	2017-02-26 15:13:09.337175+00	1324	f	21	12	27
2259	2017-02-26 15:13:09.351357+00	5	f	97	2	28
2260	2017-02-26 15:13:09.367151+00	2766	f	22	146	29
2261	2017-02-26 15:13:10.962742+00	27	f	26	5	31
2262	2017-02-26 15:13:11.036469+00	5	f	98	0	32
2263	2017-02-26 15:13:11.052202+00	135	f	24	6	33
2264	2017-02-26 15:13:11.069582+00	219	f	23	5	34
2265	2017-02-26 15:13:11.086148+00	4463	f	25	290	35
2266	2017-02-26 15:13:12.415295+00	6809	f	27	711	37
2267	2017-02-26 15:13:12.443077+00	23	f	34	1	38
2268	2017-02-26 15:13:15.564355+00	21836	f	28	1776	41
2269	2017-02-26 15:13:15.63781+00	47	f	30	6	42
2270	2017-02-26 15:13:17.228843+00	74	f	29	9	44
2271	2017-02-26 15:13:17.302008+00	39	f	35	2	45
2272	2017-02-26 15:13:17.31834+00	79	f	33	9	46
2273	2017-02-26 15:13:17.331673+00	122	f	32	4	47
2274	2017-02-26 15:13:17.345594+00	16	f	46	0	48
2275	2017-02-26 15:13:17.361743+00	5187	f	36	191	49
2276	2017-02-26 15:13:17.375715+00	111	f	38	1	50
2277	2017-02-26 15:13:19.070643+00	643	f	37	27	52
2278	2017-02-26 15:13:19.147296+00	1456	f	39	39	53
2279	2017-02-26 15:13:19.163591+00	6393	f	40	105	54
2280	2017-02-26 15:13:19.176599+00	94	f	41	10	55
2281	2017-02-26 15:13:19.190755+00	2792	f	42	13	56
2282	2017-02-26 15:13:19.206493+00	12	f	49	2	57
2283	2017-02-26 15:13:19.220668+00	41	f	43	11	58
2284	2017-02-26 15:13:19.237111+00	40	f	44	3	59
2285	2017-02-26 15:13:19.25331+00	11	f	56	33	60
2286	2017-02-26 15:13:19.276622+00	53	f	45	4	61
2287	2017-02-26 15:13:19.290736+00	69	f	47	1	62
2288	2017-02-26 15:13:19.306611+00	18092	f	48	887	63
2289	2017-02-26 15:13:19.320734+00	11	f	60	4	64
2290	2017-02-26 15:13:19.336506+00	18	f	51	1	65
2291	2017-02-26 15:13:19.350701+00	14	f	61	2	66
2292	2017-02-26 15:13:21.184496+00	1	f	100	0	67
2293	2017-02-26 15:13:21.202433+00	0	f	99	0	68
2294	2017-02-26 15:13:21.218977+00	0	f	96	1	69
2295	2017-02-26 15:13:21.231847+00	61	f	53	29	70
2296	2017-02-26 15:13:21.246167+00	69	f	52	13	71
2297	2017-02-26 15:13:21.261807+00	7	f	62	0	72
2298	2017-02-26 15:13:21.276115+00	42	f	54	8	73
2299	2017-02-26 15:13:22.670168+00	3	f	71	1	75
2300	2017-02-26 15:13:22.740431+00	10	f	70	0	76
2301	2017-02-26 15:13:22.755794+00	45	f	55	1	77
2302	2017-02-26 15:13:22.770304+00	17	f	59	3	78
2303	2017-02-26 15:13:22.785746+00	4	f	91	1	79
2304	2017-02-26 15:13:22.800202+00	3	f	57	2	80
2305	2017-02-26 15:13:22.81564+00	361	f	58	22	81
2306	2017-02-26 15:13:24.352553+00	6	f	64	0	83
2307	2017-02-26 15:13:24.435169+00	32320	f	63	1969	84
2308	2017-02-26 15:13:25.774619+00	18	f	66	1	86
2309	2017-02-26 15:13:25.844276+00	9	f	68	0	87
2310	2017-02-26 15:13:25.85868+00	9	f	65	1	88
2311	2017-02-26 15:13:25.873759+00	1222	f	67	47	89
2312	2017-02-26 15:13:25.888508+00	89	f	69	15	90
2313	2017-02-26 15:13:27.214823+00	380	f	72	12	92
2314	2017-02-26 15:13:27.28574+00	150	f	73	8	93
2315	2017-02-26 15:13:27.302361+00	2084	f	74	24	94
2316	2017-02-26 15:13:27.317246+00	216	f	75	7	95
2317	2017-02-26 15:13:27.332248+00	17	f	77	0	96
2318	2017-02-26 15:13:27.347185+00	0	f	76	4	97
2319	2017-02-26 15:13:27.362189+00	10	f	80	5	98
2320	2017-02-26 15:13:27.377168+00	1764	f	78	35	99
2321	2017-02-26 15:23:04.323302+00	353	f	90	4	2
2322	2017-02-26 15:23:04.411597+00	382	f	88	30	3
2323	2017-02-26 15:23:04.424447+00	29424	t	2	876	4
2324	2017-02-26 15:23:04.441407+00	1467	f	4	37	5
2325	2017-02-26 15:23:04.454396+00	66	f	94	14	6
2326	2017-02-26 15:23:04.464262+00	14245	f	5	824	7
2327	2017-02-26 15:23:04.474236+00	2556	f	6	89	8
2328	2017-02-26 15:23:04.484166+00	2365	f	92	152	9
2329	2017-02-26 15:23:04.494086+00	197	f	10	16	10
2330	2017-02-26 15:23:04.504142+00	535	f	8	26	11
2331	2017-02-26 15:23:07.589381+00	2969	f	7	227	14
2332	2017-02-26 15:23:07.717295+00	111	f	13	8	15
2333	2017-02-26 15:23:07.733191+00	1201	f	9	41	16
2334	2017-02-26 15:23:07.749579+00	57	f	20	10	17
2335	2017-02-26 15:23:07.763048+00	26	f	89	8	18
2336	2017-02-26 15:23:07.772919+00	36	f	31	1	19
2337	2017-02-26 15:23:07.782973+00	126	f	11	7	20
2338	2017-02-26 15:23:07.79281+00	505	f	12	18	21
2339	2017-02-26 15:23:07.802985+00	9	f	97	2	22
2340	2017-02-26 15:23:07.812787+00	365	f	14	19	23
2341	2017-02-26 15:23:09.179405+00	233	f	16	13	25
2342	2017-02-26 15:23:09.297423+00	9551	f	15	1044	26
2343	2017-02-26 15:23:09.313858+00	5080	f	18	94	27
2344	2017-02-26 15:23:09.3273+00	1318	f	21	12	28
2345	2017-02-26 15:23:09.343706+00	6	f	98	0	29
2346	2017-02-26 15:23:09.357164+00	2768	f	22	146	30
2347	2017-02-26 15:23:10.887482+00	37	f	26	5	32
2348	2017-02-26 15:23:10.96851+00	134	f	24	6	33
2349	2017-02-26 15:23:10.981861+00	219	f	23	5	34
2350	2017-02-26 15:23:10.998085+00	4463	f	25	290	35
2351	2017-02-26 15:23:14.378476+00	6805	f	27	711	38
2352	2017-02-26 15:23:14.490865+00	24	f	34	1	39
2353	2017-02-26 15:23:16.219469+00	21834	f	28	1776	41
2354	2017-02-26 15:23:16.280961+00	42	f	30	6	42
2355	2017-02-26 15:23:17.881102+00	75	f	29	9	44
2356	2017-02-26 15:23:17.935951+00	43	f	35	2	45
2357	2017-02-26 15:23:17.949875+00	79	f	33	9	46
2358	2017-02-26 15:23:17.965506+00	121	f	32	4	47
2359	2017-02-26 15:23:17.979796+00	14	f	46	0	48
2360	2017-02-26 15:23:17.995425+00	5182	f	36	191	49
2361	2017-02-26 15:23:18.009739+00	108	f	38	1	50
2362	2017-02-26 15:23:19.607979+00	647	f	37	27	52
2363	2017-02-26 15:23:19.710553+00	1463	f	39	39	53
2364	2017-02-26 15:23:19.724778+00	6395	f	40	105	54
2365	2017-02-26 15:23:19.740229+00	92	f	41	10	55
2366	2017-02-26 15:23:19.754612+00	2791	f	42	13	56
2367	2017-02-26 15:23:19.769976+00	13	f	49	2	57
2368	2017-02-26 15:23:19.784492+00	37	f	43	11	58
2369	2017-02-26 15:23:19.799905+00	40	f	44	3	59
2370	2017-02-26 15:23:19.814365+00	53	f	45	4	60
2371	2017-02-26 15:23:19.829904+00	66	f	47	1	61
2372	2017-02-26 15:23:19.844594+00	10	f	56	34	62
2373	2017-02-26 15:23:19.860289+00	18097	f	48	887	63
2374	2017-02-26 15:23:19.874716+00	10	f	60	4	64
2375	2017-02-26 15:23:19.890037+00	15	f	51	1	65
2376	2017-02-26 15:23:19.90458+00	15	f	61	2	66
2377	2017-02-26 15:23:23.643155+00	1	f	101	0	68
2378	2017-02-26 15:23:25.843561+00	1	f	102	0	69
2379	2017-02-26 15:23:25.856037+00	1	f	100	0	70
2380	2017-02-26 15:23:25.871053+00	0	f	99	0	71
2381	2017-02-26 15:23:25.885558+00	11	f	70	0	72
2382	2017-02-26 15:23:25.900876+00	0	f	96	1	73
2383	2017-02-26 15:23:25.91584+00	60	f	53	29	74
2384	2017-02-26 15:23:25.930902+00	70	f	52	13	75
2385	2017-02-26 15:23:25.945678+00	7	f	62	0	76
2386	2017-02-26 15:23:25.961062+00	40	f	54	8	77
2387	2017-02-26 15:23:27.265964+00	1	f	71	1	79
2388	2017-02-26 15:23:27.335452+00	45	f	55	1	80
2389	2017-02-26 15:23:27.349606+00	19	f	59	3	81
2390	2017-02-26 15:23:27.364843+00	3	f	91	1	82
2391	2017-02-26 15:23:27.379397+00	363	f	58	22	83
2392	2017-02-26 15:23:27.394774+00	6	f	57	2	84
2393	2017-02-26 15:23:28.83631+00	6	f	64	0	86
2394	2017-02-26 15:23:28.883548+00	32318	f	63	1969	87
2395	2017-02-26 15:23:30.307489+00	20	f	66	1	89
2396	2017-02-26 15:23:30.38765+00	11	f	68	0	90
2397	2017-02-26 15:23:30.403046+00	8	f	65	1	91
2398	2017-02-26 15:23:30.417233+00	1223	f	67	47	92
2399	2017-02-26 15:23:30.432819+00	94	f	69	15	93
2400	2017-02-26 15:23:31.724739+00	383	f	72	12	95
2401	2017-02-26 15:23:31.781021+00	150	f	73	8	96
2402	2017-02-26 15:23:31.796472+00	2074	f	74	24	97
2403	2017-02-26 15:23:31.810928+00	218	f	75	7	98
2404	2017-02-26 15:23:31.846292+00	20	f	77	0	99
2405	2017-02-26 15:33:04.389792+00	478	f	88	34	2
2406	2017-02-26 15:33:04.577037+00	1524	f	4	38	3
2407	2017-02-26 15:33:04.592188+00	29454	t	2	879	4
2408	2017-02-26 15:33:04.606658+00	80	f	94	18	5
2409	2017-02-26 15:33:04.621959+00	14248	f	5	825	6
2410	2017-02-26 15:33:04.636768+00	2558	f	6	89	7
2411	2017-02-26 15:33:04.651989+00	2374	f	92	153	8
2412	2017-02-26 15:33:04.666737+00	201	f	10	16	9
2413	2017-02-26 15:33:04.682153+00	535	f	8	26	10
2414	2017-02-26 15:33:07.728309+00	121	f	13	10	13
2415	2017-02-26 15:33:07.83064+00	2967	f	7	227	14
2416	2017-02-26 15:33:07.845251+00	21	f	97	2	15
2417	2017-02-26 15:33:07.860511+00	1207	f	9	41	16
2418	2017-02-26 15:33:07.875189+00	58	f	20	11	17
2419	2017-02-26 15:33:07.890555+00	24	f	89	8	18
2420	2017-02-26 15:33:07.905237+00	40	f	31	1	19
2421	2017-02-26 15:33:07.92059+00	123	f	11	7	20
2422	2017-02-26 15:33:07.9353+00	506	f	12	18	21
2423	2017-02-26 15:33:07.950542+00	367	f	14	19	22
2424	2017-02-26 15:33:09.339251+00	231	f	16	13	24
2425	2017-02-26 15:33:09.364561+00	9561	f	15	1044	25
2426	2017-02-26 15:33:09.379372+00	5	f	98	0	26
2427	2017-02-26 15:33:09.39459+00	5083	f	18	94	27
2428	2017-02-26 15:33:09.40924+00	1316	f	21	12	28
2429	2017-02-26 15:33:09.424537+00	2769	f	22	146	29
2430	2017-02-26 15:33:11.035671+00	30	f	26	5	31
2431	2017-02-26 15:33:12.97316+00	137	f	24	6	33
2432	2017-02-26 15:33:13.029086+00	222	f	23	5	34
2433	2017-02-26 15:33:13.054055+00	4462	f	25	290	35
2434	2017-02-26 15:33:15.912065+00	6813	f	27	711	38
2435	2017-02-26 15:33:17.548433+00	22	f	34	1	40
2436	2017-02-26 15:33:17.606535+00	21835	f	28	1776	41
2437	2017-02-26 15:33:17.621257+00	41	f	30	6	42
2438	2017-02-26 15:33:17.636213+00	74	f	29	9	43
2439	2017-02-26 15:33:17.651084+00	41	f	35	2	44
2440	2017-02-26 15:33:17.67117+00	78	f	33	10	45
2441	2017-02-26 15:33:17.686157+00	121	f	32	4	46
2442	2017-02-26 15:33:19.295718+00	15	f	46	0	48
2443	2017-02-26 15:33:19.371219+00	5185	f	36	191	49
2444	2017-02-26 15:33:20.677403+00	2	f	100	0	51
2445	2017-02-26 15:33:20.734737+00	111	f	38	1	52
2446	2017-02-26 15:33:20.749358+00	647	f	37	27	53
2447	2017-02-26 15:33:20.764209+00	1455	f	39	39	54
2448	2017-02-26 15:33:20.779162+00	6404	f	40	105	55
2449	2017-02-26 15:33:20.794151+00	92	f	41	10	56
2450	2017-02-26 15:33:20.809194+00	13	f	49	2	57
2451	2017-02-26 15:33:20.824161+00	2790	f	42	13	58
2452	2017-02-26 15:33:20.839197+00	39	f	43	11	59
2453	2017-02-26 15:33:20.854237+00	43	f	44	3	60
2454	2017-02-26 15:33:20.872048+00	50	f	45	4	61
2455	2017-02-26 15:33:20.884352+00	65	f	47	1	62
2456	2017-02-26 15:33:20.899409+00	10	f	56	35	63
2457	2017-02-26 15:33:20.919566+00	18090	f	48	887	64
2458	2017-02-26 15:33:20.93451+00	12	f	60	4	65
2459	2017-02-26 15:33:20.9669+00	18	f	51	1	66
2460	2017-02-26 15:33:20.982502+00	14	f	61	2	67
2461	2017-02-26 15:33:23.601972+00	0	f	103	0	68
2462	2017-02-26 15:33:25.326279+00	1	f	104	0	69
2463	2017-02-26 15:33:25.338623+00	1	f	101	0	70
2464	2017-02-26 15:33:25.353551+00	0	f	102	0	71
2465	2017-02-26 15:33:25.368364+00	1	f	99	0	72
2466	2017-02-26 15:33:25.38355+00	10	f	70	0	73
2467	2017-02-26 15:33:25.403579+00	0	f	96	1	74
2468	2017-02-26 15:33:25.418443+00	58	f	53	31	75
2469	2017-02-26 15:33:25.4337+00	68	f	52	13	76
2470	2017-02-26 15:33:25.448541+00	8	f	62	0	77
2471	2017-02-26 15:33:25.479069+00	45	f	54	8	78
2472	2017-02-26 15:33:26.810999+00	2	f	71	1	80
2473	2017-02-26 15:33:26.86806+00	44	f	55	1	81
2474	2017-02-26 15:33:26.885549+00	17	f	59	3	82
2475	2017-02-26 15:33:26.901077+00	6	f	91	1	83
2476	2017-02-26 15:33:26.912544+00	367	f	58	22	84
2477	2017-02-26 15:33:26.927662+00	3	f	57	2	85
2478	2017-02-26 15:33:28.516294+00	8	f	64	0	87
2479	2017-02-26 15:33:28.597248+00	32323	f	63	1969	88
2480	2017-02-26 15:33:29.903358+00	20	f	66	1	90
2481	2017-02-26 15:33:29.970994+00	10	f	68	0	91
2482	2017-02-26 15:33:29.985734+00	6	f	65	1	92
2483	2017-02-26 15:33:30.132136+00	1225	f	67	47	93
2484	2017-02-26 15:33:30.146274+00	93	f	69	15	94
2485	2017-02-26 15:33:31.457251+00	379	f	72	12	96
2486	2017-02-26 15:33:31.51517+00	145	f	73	8	97
2487	2017-02-26 15:33:31.529862+00	2083	f	74	24	98
2488	2017-02-26 15:33:31.544997+00	218	f	75	7	99
2489	2017-02-26 15:43:05.154777+00	637	f	88	46	2
2490	2017-02-26 15:43:05.248028+00	118	f	94	24	3
2491	2017-02-26 15:43:05.263772+00	1588	f	4	39	4
2492	2017-02-26 15:43:05.278414+00	29469	t	2	880	5
2493	2017-02-26 15:43:05.293709+00	14247	f	5	825	6
2494	2017-02-26 15:43:05.30827+00	48	f	97	2	7
2495	2017-02-26 15:43:05.323584+00	2569	f	6	89	8
2496	2017-02-26 15:43:05.338344+00	219	f	10	16	9
2497	2017-02-26 15:43:05.360045+00	2396	f	92	153	10
2498	2017-02-26 15:43:07.031819+00	543	f	8	26	12
2499	2017-02-26 15:43:07.052992+00	131	f	13	11	13
2500	2017-02-26 15:43:08.475616+00	2974	f	7	227	15
2501	2017-02-26 15:43:08.61189+00	1209	f	9	41	16
2502	2017-02-26 15:43:08.667425+00	60	f	20	11	17
2503	2017-02-26 15:43:08.682718+00	43	f	31	1	18
2504	2017-02-26 15:43:08.69729+00	25	f	89	10	19
2505	2017-02-26 15:43:08.712792+00	128	f	11	7	20
2506	2017-02-26 15:43:08.727377+00	508	f	12	18	21
2507	2017-02-26 15:43:08.742878+00	372	f	14	19	22
2508	2017-02-26 15:43:10.035242+00	241	f	16	13	24
2509	2017-02-26 15:43:10.060977+00	9566	f	15	1044	25
2510	2017-02-26 15:43:10.076628+00	6	f	98	0	26
2511	2017-02-26 15:43:10.090714+00	5080	f	18	94	27
2512	2017-02-26 15:43:10.106256+00	1321	f	21	12	28
2513	2017-02-26 15:43:10.121067+00	2771	f	22	146	29
2514	2017-02-26 15:43:10.136325+00	36	f	26	5	30
2515	2017-02-26 15:43:11.715099+00	134	f	24	6	32
2516	2017-02-26 15:43:11.781388+00	217	f	23	5	33
2517	2017-02-26 15:43:11.79528+00	4461	f	25	290	34
2518	2017-02-26 15:43:16.243134+00	6803	f	27	711	38
2519	2017-02-26 15:43:17.924301+00	3	f	100	0	40
2520	2017-02-26 15:43:17.947036+00	23	f	34	1	41
2521	2017-02-26 15:43:17.961118+00	21837	f	28	1776	42
2522	2017-02-26 15:43:17.976713+00	72	f	29	9	43
2523	2017-02-26 15:43:17.990925+00	41	f	30	6	44
2524	2017-02-26 15:43:18.00678+00	38	f	35	2	45
2525	2017-02-26 15:43:18.021012+00	80	f	33	10	46
2526	2017-02-26 15:43:18.031217+00	121	f	32	4	47
2527	2017-02-26 15:43:19.581093+00	14	f	46	0	49
2528	2017-02-26 15:43:21.498651+00	2	f	105	0	50
2529	2017-02-26 15:43:23.37944+00	2	f	106	0	51
2530	2017-02-26 15:43:23.405798+00	5180	f	36	191	52
2531	2017-02-26 15:43:23.43581+00	2	f	104	0	53
2532	2017-02-26 15:43:23.451742+00	2	f	101	0	54
2533	2017-02-26 15:43:23.465803+00	115	f	38	1	55
2534	2017-02-26 15:43:23.481644+00	652	f	37	27	56
2535	2017-02-26 15:43:23.495829+00	2	f	99	0	57
2536	2017-02-26 15:43:23.511728+00	2	f	96	1	58
2537	2017-02-26 15:43:23.52585+00	1465	f	39	39	59
2538	2017-02-26 15:43:23.541805+00	6395	f	40	105	60
2539	2017-02-26 15:43:23.555977+00	90	f	41	10	61
2540	2017-02-26 15:43:23.572047+00	12	f	49	2	62
2541	2017-02-26 15:43:23.586097+00	2793	f	42	13	63
2542	2017-02-26 15:43:23.601964+00	40	f	43	11	64
2543	2017-02-26 15:43:23.616112+00	43	f	44	3	65
2544	2017-02-26 15:43:23.632063+00	55	f	45	4	66
2545	2017-02-26 15:43:23.646179+00	64	f	47	1	67
2546	2017-02-26 15:43:23.662022+00	9	f	56	35	68
2547	2017-02-26 15:43:23.682227+00	2	f	71	1	69
2548	2017-02-26 15:43:23.702327+00	18099	f	48	887	70
2549	2017-02-26 15:43:23.716364+00	14	f	60	4	71
2550	2017-02-26 15:43:23.732386+00	16	f	51	1	72
2551	2017-02-26 15:43:23.746506+00	14	f	61	2	73
2552	2017-02-26 15:43:23.762405+00	0	f	103	1	74
2553	2017-02-26 15:43:23.776535+00	1	f	102	0	75
2554	2017-02-26 15:43:23.792557+00	11	f	70	0	76
2555	2017-02-26 15:43:25.356146+00	3	f	91	1	78
2556	2017-02-26 15:43:25.380948+00	56	f	53	31	79
2557	2017-02-26 15:43:25.396847+00	70	f	52	13	80
2558	2017-02-26 15:43:25.410957+00	7	f	62	0	81
2559	2017-02-26 15:43:25.426931+00	39	f	54	8	82
2560	2017-02-26 15:43:25.440901+00	38	f	55	1	83
2561	2017-02-26 15:43:25.501485+00	18	f	59	3	84
2562	2017-02-26 15:43:25.517386+00	7	f	64	0	85
2563	2017-02-26 15:43:27.249487+00	363	f	58	22	87
2564	2017-02-26 15:43:27.32235+00	4	f	57	2	88
2565	2017-02-26 15:43:30.379394+00	3	f	76	4	91
2566	2017-02-26 15:43:30.454452+00	32317	f	63	1968	92
2567	2017-02-26 15:43:30.470022+00	9	f	65	1	93
2568	2017-02-26 15:43:30.483814+00	21	f	66	1	94
2569	2017-02-26 15:43:30.493881+00	10	f	68	0	95
2570	2017-02-26 15:43:30.503896+00	1227	f	67	47	96
2571	2017-02-26 15:43:30.513842+00	94	f	69	15	97
2572	2017-02-26 15:43:31.673697+00	385	f	72	12	99
2573	2017-02-26 15:53:05.380311+00	768	f	88	53	2
2574	2017-02-26 15:53:05.466875+00	134	f	94	24	3
2575	2017-02-26 15:53:05.484441+00	1642	f	4	43	4
2576	2017-02-26 15:53:05.500756+00	29484	t	2	879	5
2577	2017-02-26 15:53:05.516405+00	60	f	97	7	6
2578	2017-02-26 15:53:05.53066+00	14257	f	5	825	7
2579	2017-02-26 15:53:05.546371+00	240	f	10	17	8
2580	2017-02-26 15:53:05.560589+00	2572	f	6	91	9
2581	2017-02-26 15:53:05.576346+00	2409	f	92	154	10
2582	2017-02-26 15:53:05.590659+00	141	f	13	12	11
2583	2017-02-26 15:53:07.494717+00	558	f	8	26	13
2584	2017-02-26 15:53:08.992232+00	2975	f	7	227	15
2585	2017-02-26 15:53:09.070586+00	1227	f	9	41	16
2586	2017-02-26 15:53:09.085992+00	62	f	20	12	17
2587	2017-02-26 15:53:09.100389+00	51	f	31	1	18
2588	2017-02-26 15:53:09.11617+00	25	f	89	10	19
2589	2017-02-26 15:53:09.130539+00	131	f	11	7	20
2590	2017-02-26 15:53:09.190691+00	512	f	12	18	21
2591	2017-02-26 15:53:09.206168+00	369	f	14	19	22
2592	2017-02-26 15:53:10.707402+00	238	f	16	13	24
2593	2017-02-26 15:53:10.998382+00	9564	f	15	1044	25
2594	2017-02-26 15:53:11.011023+00	9	f	98	0	26
2595	2017-02-26 15:53:11.025292+00	5085	f	18	94	27
2596	2017-02-26 15:53:11.040792+00	1317	f	21	12	28
2597	2017-02-26 15:53:11.05527+00	2775	f	22	146	29
2598	2017-02-26 15:53:11.070861+00	33	f	26	5	30
2599	2017-02-26 15:53:12.64742+00	132	f	24	6	32
2600	2017-02-26 15:53:12.683119+00	219	f	23	5	33
2601	2017-02-26 15:53:12.705425+00	4462	f	25	290	34
2602	2017-02-26 15:53:14.046037+00	26	f	34	1	36
2603	2017-02-26 15:53:14.259808+00	3	f	104	0	37
2604	2017-02-26 15:53:15.904457+00	6804	f	27	711	39
2605	2017-02-26 15:53:17.572329+00	2	f	100	0	41
2606	2017-02-26 15:53:17.779421+00	21836	f	28	1776	42
2607	2017-02-26 15:53:17.812192+00	72	f	29	9	43
2608	2017-02-26 15:53:17.826632+00	37	f	30	6	44
2609	2017-02-26 15:53:17.841988+00	41	f	35	2	45
2610	2017-02-26 15:53:19.448164+00	76	f	33	10	47
2611	2017-02-26 15:53:19.534448+00	119	f	32	4	48
2612	2017-02-26 15:53:19.550948+00	15	f	46	0	49
2613	2017-02-26 15:53:21.474101+00	2	f	107	0	50
2614	2017-02-26 15:53:21.48942+00	5186	f	36	191	51
2615	2017-02-26 15:53:22.837144+00	2	f	101	0	53
2616	2017-02-26 15:53:22.934144+00	2	f	102	0	54
2617	2017-02-26 15:53:22.960162+00	111	f	38	1	55
2618	2017-02-26 15:53:22.975639+00	651	f	37	27	56
2619	2017-02-26 15:53:22.989986+00	2	f	99	0	57
2620	2017-02-26 15:53:23.005398+00	2	f	96	1	58
2621	2017-02-26 15:53:23.019868+00	1460	f	39	39	59
2622	2017-02-26 15:53:23.035413+00	6401	f	40	105	60
2623	2017-02-26 15:53:23.049992+00	93	f	41	10	61
2624	2017-02-26 15:53:23.065378+00	11	f	49	2	62
2625	2017-02-26 15:53:23.080022+00	2791	f	42	13	63
2626	2017-02-26 15:53:23.095351+00	36	f	43	11	64
2627	2017-02-26 15:53:23.109968+00	39	f	44	3	65
2628	2017-02-26 15:53:23.125553+00	52	f	45	4	66
2629	2017-02-26 15:53:23.140175+00	66	f	47	1	67
2630	2017-02-26 15:53:23.155661+00	10	f	56	35	68
2631	2017-02-26 15:53:23.17034+00	3	f	71	1	69
2632	2017-02-26 15:53:23.185791+00	18091	f	48	887	70
2633	2017-02-26 15:53:23.200422+00	0	f	105	0	71
2634	2017-02-26 15:53:23.215818+00	14	f	60	4	72
2635	2017-02-26 15:53:23.230392+00	1	f	106	0	73
2636	2017-02-26 15:53:23.245896+00	15	f	51	1	74
2637	2017-02-26 15:53:23.260581+00	14	f	61	2	75
2638	2017-02-26 15:53:23.275979+00	0	f	103	2	76
2639	2017-02-26 15:53:23.290683+00	11	f	70	0	77
2640	2017-02-26 15:53:24.855877+00	5	f	91	1	79
2641	2017-02-26 15:53:26.284332+00	62	f	53	31	81
2642	2017-02-26 15:53:26.311557+00	69	f	52	13	82
2643	2017-02-26 15:53:26.324145+00	7	f	62	0	83
2644	2017-02-26 15:53:26.338922+00	44	f	54	8	84
2645	2017-02-26 15:53:26.354233+00	42	f	55	1	85
2646	2017-02-26 15:53:26.368895+00	18	f	59	3	86
2647	2017-02-26 15:53:26.384133+00	7	f	64	0	87
2648	2017-02-26 15:53:26.399102+00	369	f	58	22	88
2649	2017-02-26 15:53:26.414228+00	6	f	57	2	89
2650	2017-02-26 15:53:29.402684+00	2	f	76	4	92
2651	2017-02-26 15:53:29.478144+00	32320	f	63	1968	93
2652	2017-02-26 15:53:29.492687+00	6	f	65	1	94
2653	2017-02-26 15:53:29.507965+00	9	f	68	0	95
2654	2017-02-26 15:53:29.522528+00	19	f	66	1	96
2655	2017-02-26 15:53:29.537697+00	1223	f	67	47	97
2656	2017-02-26 15:53:29.552454+00	90	f	69	15	98
2657	2017-02-26 16:03:04.862946+00	1130	f	88	62	1
2658	2017-02-26 16:03:04.936925+00	165	f	94	31	3
2659	2017-02-26 16:03:04.948993+00	111	f	97	15	4
2660	2017-02-26 16:03:04.958885+00	1696	f	4	44	5
2661	2017-02-26 16:03:04.968896+00	29482	t	2	879	6
2662	2017-02-26 16:03:04.978944+00	14257	f	5	825	7
2663	2017-02-26 16:03:04.989029+00	258	f	10	17	8
2664	2017-02-26 16:03:05.004559+00	2573	f	6	92	9
2665	2017-02-26 16:03:05.019562+00	2416	f	92	154	10
2666	2017-02-26 16:03:05.03476+00	161	f	13	12	11
2667	2017-02-26 16:03:06.724952+00	561	f	8	26	13
2668	2017-02-26 16:03:08.245059+00	63	f	31	1	15
2669	2017-02-26 16:03:08.317936+00	2965	f	7	227	16
2670	2017-02-26 16:03:08.333492+00	1230	f	9	41	17
2671	2017-02-26 16:03:08.347524+00	69	f	20	12	18
2672	2017-02-26 16:03:08.357761+00	26	f	89	10	19
2673	2017-02-26 16:03:08.367745+00	137	f	11	7	20
2674	2017-02-26 16:03:08.377361+00	510	f	12	18	21
2675	2017-02-26 16:03:08.387478+00	11	f	98	0	22
2676	2017-02-26 16:03:08.397551+00	372	f	14	19	23
2677	2017-02-26 16:03:09.929486+00	239	f	16	13	25
2678	2017-02-26 16:03:10.048265+00	9564	f	15	1044	26
2679	2017-02-26 16:03:10.062175+00	5092	f	18	94	27
2680	2017-02-26 16:03:10.071982+00	1324	f	21	12	28
2681	2017-02-26 16:03:10.082271+00	34	f	26	5	29
2682	2017-02-26 16:03:10.091876+00	2765	f	22	146	30
2683	2017-02-26 16:03:11.776335+00	4	f	104	0	32
2684	2017-02-26 16:03:14.585378+00	135	f	24	6	35
2685	2017-02-26 16:03:14.644172+00	219	f	23	5	36
2686	2017-02-26 16:03:14.653544+00	4461	f	25	289	37
2687	2017-02-26 16:03:17.521351+00	24	f	34	1	40
2688	2017-02-26 16:03:17.591291+00	6811	f	27	711	41
2689	2017-02-26 16:03:17.600935+00	21837	f	28	1776	42
2690	2017-02-26 16:03:19.117435+00	75	f	29	9	44
2691	2017-02-26 16:03:19.135107+00	44	f	30	6	45
2692	2017-02-26 16:03:19.145063+00	39	f	35	2	46
2693	2017-02-26 16:03:19.154986+00	75	f	33	10	47
2694	2017-02-26 16:03:19.164743+00	121	f	32	4	48
2695	2017-02-26 16:03:19.174789+00	16	f	46	0	49
2696	2017-02-26 16:03:19.191944+00	2	f	107	0	50
2697	2017-02-26 16:03:19.205041+00	5186	f	36	191	51
2698	2017-02-26 16:03:19.214916+00	1	f	101	0	52
2699	2017-02-26 16:03:19.224805+00	2	f	102	0	53
2700	2017-02-26 16:03:19.234924+00	2	f	100	0	54
2701	2017-02-26 16:03:19.245038+00	113	f	38	1	55
2702	2017-02-26 16:03:19.25947+00	651	f	37	27	56
2703	2017-02-26 16:03:19.272319+00	1	f	99	0	57
2704	2017-02-26 16:03:19.285551+00	1456	f	39	39	58
2705	2017-02-26 16:03:19.295264+00	6395	f	40	105	59
2706	2017-02-26 16:03:19.305465+00	94	f	41	10	60
2707	2017-02-26 16:03:19.322313+00	11	f	49	2	61
2708	2017-02-26 16:03:19.335857+00	2792	f	42	13	62
2709	2017-02-26 16:03:19.345731+00	42	f	43	11	63
2710	2017-02-26 16:03:19.355442+00	42	f	44	3	64
2711	2017-02-26 16:03:19.365377+00	52	f	45	4	65
2712	2017-02-26 16:03:19.375397+00	65	f	47	1	66
2713	2017-02-26 16:03:19.385403+00	11	f	56	35	67
2714	2017-02-26 16:03:19.405809+00	3	f	71	1	68
2715	2017-02-26 16:03:19.422675+00	18089	f	48	887	69
2716	2017-02-26 16:03:19.436154+00	0	f	105	0	70
2717	2017-02-26 16:03:19.445836+00	14	f	60	4	71
2718	2017-02-26 16:03:19.455744+00	0	f	106	0	72
2719	2017-02-26 16:03:19.465764+00	16	f	51	1	73
2720	2017-02-26 16:03:19.475959+00	15	f	61	2	74
2721	2017-02-26 16:03:19.48588+00	0	f	103	2	75
2722	2017-02-26 16:03:19.495775+00	11	f	70	0	76
2723	2017-02-26 16:03:21.01889+00	5	f	91	1	78
2724	2017-02-26 16:03:21.090454+00	0	f	96	1	79
2725	2017-02-26 16:03:22.324821+00	56	f	53	31	81
2726	2017-02-26 16:03:22.350726+00	65	f	52	13	82
2727	2017-02-26 16:03:22.36328+00	8	f	62	0	83
2728	2017-02-26 16:03:22.372959+00	45	f	54	8	84
2729	2017-02-26 16:03:22.383204+00	43	f	55	1	85
2730	2017-02-26 16:03:22.393555+00	18	f	59	3	86
2731	2017-02-26 16:03:22.403291+00	6	f	64	0	87
2732	2017-02-26 16:03:22.413149+00	366	f	58	22	88
2733	2017-02-26 16:03:22.423184+00	5	f	57	2	89
2734	2017-02-26 16:03:25.256034+00	3	f	76	4	92
2735	2017-02-26 16:03:25.471376+00	32315	f	63	1968	93
2736	2017-02-26 16:03:25.480776+00	7	f	65	1	94
2737	2017-02-26 16:03:25.501132+00	10	f	68	0	95
2738	2017-02-26 16:03:25.511196+00	19	f	66	1	96
2739	2017-02-26 16:03:25.521064+00	1223	f	67	47	97
2740	2017-02-26 16:03:25.5312+00	93	f	69	15	98
2741	2017-02-26 16:13:05.432392+00	1668	f	88	81	1
2742	2017-02-26 16:13:05.522106+00	191	f	94	35	3
2743	2017-02-26 16:13:05.536697+00	161	f	97	19	4
2744	2017-02-26 16:13:05.549844+00	1731	f	4	45	5
2745	2017-02-26 16:13:05.590211+00	29487	t	2	879	6
2746	2017-02-26 16:13:05.600349+00	14256	f	5	825	7
2747	2017-02-26 16:13:05.610353+00	266	f	10	17	8
2748	2017-02-26 16:13:05.630571+00	2577	f	6	92	9
2749	2017-02-26 16:13:05.640527+00	173	f	13	14	10
2750	2017-02-26 16:13:05.650543+00	2424	f	92	154	11
2751	2017-02-26 16:13:07.520958+00	569	f	8	26	13
2752	2017-02-26 16:13:07.575495+00	75	f	31	1	14
2753	2017-02-26 16:13:09.016107+00	2982	f	7	227	16
2754	2017-02-26 16:13:09.089488+00	77	f	20	12	17
2755	2017-02-26 16:13:09.099067+00	1236	f	9	41	18
2756	2017-02-26 16:13:09.109295+00	29	f	89	10	19
2757	2017-02-26 16:13:09.119027+00	144	f	11	7	20
2758	2017-02-26 16:13:09.12895+00	516	f	12	18	21
2759	2017-02-26 16:13:09.139204+00	9	f	98	0	22
2760	2017-02-26 16:13:09.149445+00	373	f	14	19	23
2761	2017-02-26 16:13:11.095441+00	244	f	16	13	25
2762	2017-02-26 16:13:11.114438+00	7	f	104	1	26
2763	2017-02-26 16:13:11.124094+00	9564	f	15	1044	27
2764	2017-02-26 16:13:12.418135+00	5090	f	18	94	29
2765	2017-02-26 16:13:12.498272+00	36	f	26	5	30
2766	2017-02-26 16:13:12.507888+00	1321	f	21	12	31
2767	2017-02-26 16:13:12.518264+00	2767	f	22	146	32
2768	2017-02-26 16:13:15.640101+00	142	f	24	6	35
2769	2017-02-26 16:13:15.706291+00	220	f	23	5	36
2770	2017-02-26 16:13:15.716256+00	29	f	34	1	37
2771	2017-02-26 16:13:17.289714+00	4462	f	25	289	39
2772	2017-02-26 16:13:20.171246+00	6812	f	27	711	42
2773	2017-02-26 16:13:20.237375+00	2	f	99	0	43
2774	2017-02-26 16:13:20.247984+00	21831	f	28	1776	44
2775	2017-02-26 16:13:20.258135+00	74	f	29	9	45
2776	2017-02-26 16:13:20.278329+00	43	f	30	6	46
2777	2017-02-26 16:13:20.288198+00	43	f	35	2	47
2778	2017-02-26 16:13:20.298572+00	78	f	33	10	48
2779	2017-02-26 16:13:20.308157+00	121	f	32	4	49
2780	2017-02-26 16:13:20.318329+00	15	f	46	0	50
2781	2017-02-26 16:13:22.072078+00	2	f	108	0	51
2782	2017-02-26 16:13:22.083503+00	2	f	107	0	52
2783	2017-02-26 16:13:22.093373+00	5186	f	36	191	53
2784	2017-02-26 16:13:22.103216+00	1	f	101	0	54
2785	2017-02-26 16:13:22.11379+00	2	f	102	0	55
2786	2017-02-26 16:13:22.123663+00	1	f	100	0	56
2787	2017-02-26 16:13:22.133532+00	109	f	38	1	57
2788	2017-02-26 16:13:22.143539+00	647	f	37	27	58
2789	2017-02-26 16:13:22.153754+00	1462	f	39	39	59
2790	2017-02-26 16:13:22.163611+00	6397	f	40	105	60
2791	2017-02-26 16:13:22.173584+00	93	f	41	10	61
2792	2017-02-26 16:13:22.183508+00	14	f	49	2	62
2793	2017-02-26 16:13:22.193936+00	38	f	43	11	63
2794	2017-02-26 16:13:22.203793+00	2787	f	42	13	64
2795	2017-02-26 16:13:22.21368+00	41	f	44	3	65
2796	2017-02-26 16:13:22.223744+00	53	f	45	4	66
2797	2017-02-26 16:13:22.233684+00	11	f	56	35	67
2798	2017-02-26 16:13:22.243883+00	65	f	47	1	68
2799	2017-02-26 16:13:22.253822+00	3	f	71	1	69
2800	2017-02-26 16:13:22.263956+00	18097	f	48	887	70
2801	2017-02-26 16:13:23.764863+00	1	f	109	0	71
2802	2017-02-26 16:13:23.778282+00	0	f	105	0	72
2803	2017-02-26 16:13:23.787987+00	12	f	60	4	73
2804	2017-02-26 16:13:23.798011+00	0	f	106	0	74
2805	2017-02-26 16:13:23.808174+00	15	f	51	1	75
2806	2017-02-26 16:13:23.818041+00	15	f	61	2	76
2807	2017-02-26 16:13:24.956894+00	11	f	70	0	78
2808	2017-02-26 16:13:26.383756+00	5	f	91	1	80
2809	2017-02-26 16:13:26.405151+00	1	f	96	1	81
2810	2017-02-26 16:13:26.582233+00	59	f	53	31	82
2811	2017-02-26 16:13:26.720994+00	70	f	52	13	83
2812	2017-02-26 16:13:26.745822+00	7	f	62	0	84
2813	2017-02-26 16:13:26.755846+00	45	f	54	8	85
2814	2017-02-26 16:13:26.766194+00	41	f	55	1	86
2815	2017-02-26 16:13:26.775826+00	19	f	59	3	87
2816	2017-02-26 16:13:26.785786+00	7	f	64	0	88
2817	2017-02-26 16:13:26.795759+00	363	f	58	22	89
2818	2017-02-26 16:13:26.805812+00	5	f	57	2	90
2819	2017-02-26 16:13:29.787401+00	1	f	76	4	93
2820	2017-02-26 16:13:29.886663+00	32321	f	63	1968	94
2821	2017-02-26 16:13:29.92229+00	8	f	65	1	95
2822	2017-02-26 16:13:29.97115+00	10	f	68	0	96
2823	2017-02-26 16:13:29.984509+00	20	f	66	1	97
2824	2017-02-26 16:13:29.994276+00	1229	f	67	47	98
2825	2017-02-26 16:13:30.004237+00	90	f	69	15	99
2826	2017-02-26 16:23:05.473637+00	2261	f	88	116	1
2827	2017-02-26 16:23:05.556043+00	231	f	97	30	3
2828	2017-02-26 16:23:05.57272+00	218	f	94	38	4
2829	2017-02-26 16:23:05.587688+00	1772	f	4	45	5
2830	2017-02-26 16:23:05.602582+00	29499	t	2	879	6
2831	2017-02-26 16:23:05.61831+00	14251	f	5	825	7
2832	2017-02-26 16:23:05.632617+00	274	f	10	17	8
2833	2017-02-26 16:23:05.647761+00	2585	f	6	92	9
2834	2017-02-26 16:23:05.662652+00	177	f	13	14	10
2835	2017-02-26 16:23:05.677774+00	2427	f	92	156	11
2836	2017-02-26 16:23:08.387227+00	77	f	31	1	13
2837	2017-02-26 16:23:08.490616+00	574	f	8	26	14
2838	2017-02-26 16:23:09.882533+00	2982	f	7	227	16
2839	2017-02-26 16:23:09.95394+00	80	f	20	12	17
2840	2017-02-26 16:23:09.984088+00	1236	f	9	41	18
2841	2017-02-26 16:23:10.016681+00	32	f	89	10	19
2842	2017-02-26 16:23:10.029751+00	142	f	11	7	20
2843	2017-02-26 16:23:10.044136+00	13	f	98	0	21
2844	2017-02-26 16:23:10.059703+00	513	f	12	19	22
2845	2017-02-26 16:23:10.074181+00	380	f	14	19	23
2846	2017-02-26 16:23:10.089478+00	8	f	104	1	24
2847	2017-02-26 16:23:11.456116+00	247	f	16	13	26
2848	2017-02-26 16:23:11.528489+00	9563	f	15	1044	27
2849	2017-02-26 16:23:11.543682+00	5092	f	18	94	28
2850	2017-02-26 16:23:11.558004+00	42	f	26	5	29
2851	2017-02-26 16:23:11.573544+00	1326	f	21	12	30
2852	2017-02-26 16:23:11.587892+00	2771	f	22	146	31
2853	2017-02-26 16:23:16.208785+00	139	f	24	6	35
2854	2017-02-26 16:23:17.886535+00	218	f	23	5	37
2855	2017-02-26 16:23:17.944309+00	29	f	34	1	38
2856	2017-02-26 16:23:17.9704+00	3	f	108	0	39
2857	2017-02-26 16:23:17.983961+00	3	f	109	0	40
2858	2017-02-26 16:23:17.999888+00	4467	f	25	289	41
2859	2017-02-26 16:23:18.013874+00	3	f	107	0	42
2860	2017-02-26 16:23:20.94658+00	6802	f	27	711	45
2861	2017-02-26 16:23:21.011773+00	2	f	99	0	46
2862	2017-02-26 16:23:21.02791+00	21843	f	28	1776	47
2863	2017-02-26 16:23:21.041628+00	78	f	29	9	48
2864	2017-02-26 16:23:21.057979+00	46	f	35	2	49
2865	2017-02-26 16:23:21.071693+00	46	f	30	6	50
2866	2017-02-26 16:23:21.084908+00	77	f	33	10	51
2867	2017-02-26 16:23:21.104033+00	17	f	46	0	52
2868	2017-02-26 16:23:21.118033+00	121	f	32	4	53
2869	2017-02-26 16:23:21.131589+00	1	f	105	0	54
2870	2017-02-26 16:23:21.145034+00	5188	f	36	191	55
2871	2017-02-26 16:23:21.157897+00	1	f	101	0	56
2872	2017-02-26 16:23:21.171603+00	116	f	38	1	57
2873	2017-02-26 16:23:21.185012+00	645	f	37	27	58
2874	2017-02-26 16:23:21.197943+00	1461	f	39	39	59
2875	2017-02-26 16:23:21.211576+00	6393	f	40	105	60
2876	2017-02-26 16:23:21.239171+00	94	f	41	10	61
2877	2017-02-26 16:23:21.272602+00	14	f	49	2	62
2878	2017-02-26 16:23:21.288878+00	38	f	43	11	63
2879	2017-02-26 16:23:21.302519+00	2786	f	42	13	64
2880	2017-02-26 16:23:21.318737+00	39	f	44	3	65
2881	2017-02-26 16:23:21.33233+00	56	f	45	4	66
2882	2017-02-26 16:23:21.345636+00	64	f	47	1	67
2883	2017-02-26 16:23:21.358775+00	9	f	56	37	68
2884	2017-02-26 16:23:21.375845+00	2	f	71	1	69
2885	2017-02-26 16:23:21.395981+00	18090	f	48	887	70
2886	2017-02-26 16:23:21.408934+00	10	f	60	4	71
2887	2017-02-26 16:23:21.422663+00	0	f	106	0	72
2888	2017-02-26 16:23:21.435992+00	16	f	51	1	73
2889	2017-02-26 16:23:21.449086+00	13	f	61	2	74
2890	2017-02-26 16:23:22.89846+00	1	f	102	0	76
2891	2017-02-26 16:23:22.993726+00	12	f	70	0	77
2892	2017-02-26 16:23:23.006968+00	0	f	100	1	78
2893	2017-02-26 16:23:24.574246+00	5	f	91	1	80
2894	2017-02-26 16:23:24.642029+00	0	f	96	1	81
2895	2017-02-26 16:23:24.657874+00	58	f	53	32	82
2896	2017-02-26 16:23:24.671257+00	73	f	52	13	83
2897	2017-02-26 16:23:24.6877+00	9	f	62	0	84
2898	2017-02-26 16:23:24.701018+00	42	f	54	8	85
2899	2017-02-26 16:23:24.714632+00	41	f	55	1	86
2900	2017-02-26 16:23:24.734613+00	18	f	59	3	87
2901	2017-02-26 16:23:24.74758+00	8	f	64	0	88
2902	2017-02-26 16:23:24.760974+00	360	f	58	22	89
2903	2017-02-26 16:23:24.774724+00	2	f	57	2	90
2904	2017-02-26 16:23:27.925089+00	1	f	76	4	93
2905	2017-02-26 16:23:28.006857+00	32319	f	63	1968	94
2906	2017-02-26 16:23:28.023584+00	8	f	65	1	95
2907	2017-02-26 16:23:28.039636+00	9	f	68	0	96
2908	2017-02-26 16:23:28.053514+00	18	f	66	1	97
2909	2017-02-26 16:23:28.069545+00	1225	f	67	47	98
2910	2017-02-26 16:23:28.083435+00	91	f	69	15	99
2911	2017-02-26 16:33:05.98897+00	2807	f	88	136	1
2912	2017-02-26 16:33:06.060155+00	236	f	94	43	3
2913	2017-02-26 16:33:06.076471+00	1803	f	4	47	4
2914	2017-02-26 16:33:06.086292+00	29505	t	2	879	5
2915	2017-02-26 16:33:06.096207+00	14258	f	5	824	6
2916	2017-02-26 16:33:06.106122+00	281	f	10	17	7
2917	2017-02-26 16:33:06.116123+00	2589	f	6	93	8
2918	2017-02-26 16:33:06.126028+00	187	f	13	14	9
2919	2017-02-26 16:33:06.135965+00	2428	f	92	156	10
2920	2017-02-26 16:33:08.002795+00	86	f	31	1	12
2921	2017-02-26 16:33:08.071787+00	581	f	8	26	13
2922	2017-02-26 16:33:09.500738+00	78	f	20	12	15
2923	2017-02-26 16:33:09.56565+00	2980	f	7	227	16
2924	2017-02-26 16:33:09.575464+00	1244	f	9	41	17
2925	2017-02-26 16:33:09.585354+00	28	f	89	10	18
2926	2017-02-26 16:33:09.595321+00	16	f	98	0	19
2927	2017-02-26 16:33:09.605206+00	142	f	11	7	20
2928	2017-02-26 16:33:09.61524+00	513	f	12	19	21
2929	2017-02-26 16:33:09.625167+00	380	f	14	20	22
2930	2017-02-26 16:33:09.635122+00	7	f	109	1	23
2931	2017-02-26 16:33:11.092557+00	245	f	16	13	25
2932	2017-02-26 16:33:11.177703+00	7	f	104	1	26
2933	2017-02-26 16:33:11.1897+00	9561	f	15	1044	27
2934	2017-02-26 16:33:11.199705+00	5	f	107	0	28
2935	2017-02-26 16:33:11.20955+00	5089	f	18	94	29
2936	2017-02-26 16:33:11.219461+00	39	f	26	5	30
2937	2017-02-26 16:33:12.538669+00	1326	f	21	12	32
2938	2017-02-26 16:33:12.610971+00	2776	f	22	146	33
2939	2017-02-26 16:33:17.815871+00	144	f	24	6	37
2940	2017-02-26 16:33:17.997609+00	30	f	34	1	38
2941	2017-02-26 16:33:18.007523+00	4	f	99	0	39
2942	2017-02-26 16:33:19.960484+00	3	f	110	0	40
2943	2017-02-26 16:33:19.972773+00	221	f	23	5	41
2944	2017-02-26 16:33:19.982462+00	3	f	108	1	42
2945	2017-02-26 16:33:21.532924+00	4467	f	25	289	44
2946	2017-02-26 16:33:21.755101+00	3	f	105	0	45
2947	2017-02-26 16:33:23.124789+00	6806	f	27	711	47
2948	2017-02-26 16:33:23.201315+00	76	f	29	9	48
2949	2017-02-26 16:33:23.210923+00	41	f	35	2	49
2950	2017-02-26 16:33:23.220781+00	21842	f	28	1776	50
2951	2017-02-26 16:33:23.230988+00	40	f	30	6	51
2952	2017-02-26 16:33:23.240815+00	19	f	46	0	52
2953	2017-02-26 16:33:23.250925+00	75	f	33	10	53
2954	2017-02-26 16:33:23.260836+00	125	f	32	4	54
2955	2017-02-26 16:33:23.270869+00	5188	f	36	191	55
2956	2017-02-26 16:33:23.280871+00	1	f	101	0	56
2957	2017-02-26 16:33:23.290909+00	115	f	38	1	57
2958	2017-02-26 16:33:23.300824+00	648	f	37	27	58
2959	2017-02-26 16:33:24.856639+00	1464	f	39	39	60
2960	2017-02-26 16:33:24.915872+00	6393	f	40	105	61
2961	2017-02-26 16:33:24.95343+00	94	f	41	10	62
2962	2017-02-26 16:33:24.965682+00	13	f	49	2	63
2963	2017-02-26 16:33:24.97563+00	43	f	43	11	64
2964	2017-02-26 16:33:24.991714+00	2795	f	42	13	65
2965	2017-02-26 16:33:25.005458+00	43	f	44	3	66
2966	2017-02-26 16:33:25.015251+00	51	f	45	4	67
2967	2017-02-26 16:33:25.025132+00	66	f	47	1	68
2968	2017-02-26 16:33:25.035314+00	10	f	56	37	69
2969	2017-02-26 16:33:26.826115+00	1	f	111	0	70
2970	2017-02-26 16:33:26.850811+00	3	f	71	1	71
2971	2017-02-26 16:33:26.880787+00	18095	f	48	887	72
2972	2017-02-26 16:33:26.890692+00	15	f	61	2	73
2973	2017-02-26 16:33:26.900582+00	7	f	57	2	74
2974	2017-02-26 16:33:26.910594+00	12	f	60	4	75
2975	2017-02-26 16:33:26.92056+00	0	f	106	0	76
2976	2017-02-26 16:33:28.079612+00	1	f	102	0	78
2977	2017-02-26 16:33:28.144322+00	14	f	51	1	79
2978	2017-02-26 16:33:28.181795+00	11	f	70	0	80
2979	2017-02-26 16:33:28.194328+00	1	f	100	1	81
2980	2017-02-26 16:33:28.204329+00	7	f	91	1	82
2981	2017-02-26 16:33:28.214192+00	0	f	96	1	83
2982	2017-02-26 16:33:28.224038+00	61	f	53	32	84
2983	2017-02-26 16:33:28.233995+00	68	f	52	13	85
2984	2017-02-26 16:33:28.244049+00	6	f	62	0	86
2985	2017-02-26 16:33:28.253947+00	9	f	64	0	87
2986	2017-02-26 16:33:28.264012+00	45	f	54	8	88
2987	2017-02-26 16:33:28.274007+00	38	f	55	1	89
2988	2017-02-26 16:33:28.283969+00	18	f	59	3	90
2989	2017-02-26 16:33:28.293917+00	364	f	58	22	91
2990	2017-02-26 16:33:31.395526+00	2	f	76	4	94
2991	2017-02-26 16:33:31.452857+00	32324	f	63	1968	95
2992	2017-02-26 16:33:31.462642+00	9	f	65	1	96
2993	2017-02-26 16:33:31.472867+00	10	f	68	0	97
2994	2017-02-26 16:33:31.482553+00	19	f	66	1	98
2995	2017-02-26 16:33:31.492479+00	1224	f	67	47	99
2996	2017-02-26 16:43:06.145661+00	3452	f	88	164	1
2997	2017-02-26 16:43:06.293048+00	256	f	94	45	3
2998	2017-02-26 16:43:06.309416+00	1830	f	4	50	4
2999	2017-02-26 16:43:06.324019+00	29500	t	2	879	5
3000	2017-02-26 16:43:06.33934+00	14258	f	5	825	6
3001	2017-02-26 16:43:06.353982+00	296	f	10	18	7
3002	2017-02-26 16:43:06.369407+00	196	f	13	15	8
3003	2017-02-26 16:43:06.384025+00	2589	f	6	94	9
3004	2017-02-26 16:43:08.056382+00	2425	f	92	156	11
3005	2017-02-26 16:43:08.134838+00	94	f	31	1	12
3006	2017-02-26 16:43:08.149088+00	587	f	8	26	13
3007	2017-02-26 16:43:09.504642+00	86	f	20	12	15
3008	2017-02-26 16:43:09.670772+00	35	f	89	10	16
3009	2017-02-26 16:43:09.689839+00	2983	f	7	227	17
3010	2017-02-26 16:43:09.705522+00	1248	f	9	41	18
3011	2017-02-26 16:43:09.719637+00	16	f	98	0	19
3012	2017-02-26 16:43:09.735403+00	149	f	11	7	20
3013	2017-02-26 16:43:09.749576+00	8	f	109	2	21
3014	2017-02-26 16:43:09.765369+00	10	f	104	1	22
3015	2017-02-26 16:43:09.779459+00	518	f	12	19	23
3016	2017-02-26 16:43:09.795277+00	388	f	14	21	24
3017	2017-02-26 16:43:12.524203+00	245	f	16	13	27
3018	2017-02-26 16:43:12.5827+00	6	f	108	1	28
3019	2017-02-26 16:43:12.597008+00	9572	f	15	1044	29
3020	2017-02-26 16:43:12.612573+00	6	f	107	0	30
3021	2017-02-26 16:43:12.626978+00	5087	f	18	94	31
3022	2017-02-26 16:43:12.642535+00	40	f	26	5	32
3023	2017-02-26 16:43:12.656937+00	1329	f	21	12	33
3024	2017-02-26 16:43:12.672548+00	4	f	99	0	34
3025	2017-02-26 16:43:14.498724+00	2771	f	22	147	36
3026	2017-02-26 16:43:17.909026+00	27	f	34	1	39
3027	2017-02-26 16:43:18.043072+00	146	f	24	6	40
3028	2017-02-26 16:43:18.059338+00	3	f	110	0	41
3029	2017-02-26 16:43:18.07124+00	226	f	23	5	42
3030	2017-02-26 16:43:19.603926+00	4467	f	25	289	44
3031	2017-02-26 16:43:19.683968+00	2	f	105	0	45
3032	2017-02-26 16:43:20.884727+00	2	f	101	0	47
3033	2017-02-26 16:43:20.958001+00	6801	f	27	711	48
3034	2017-02-26 16:43:20.974047+00	44	f	35	2	49
3035	2017-02-26 16:43:20.999297+00	75	f	29	9	50
3036	2017-02-26 16:43:22.649901+00	21831	f	28	1776	52
3037	2017-02-26 16:43:22.708593+00	39	f	30	6	53
3038	2017-02-26 16:43:22.723347+00	19	f	46	0	54
3039	2017-02-26 16:43:22.73803+00	79	f	33	10	55
3040	2017-02-26 16:43:24.925476+00	3	f	112	0	56
3041	2017-02-26 16:43:24.97814+00	123	f	32	4	57
3042	2017-02-26 16:43:24.994377+00	1	f	106	0	58
3043	2017-02-26 16:43:25.009581+00	5188	f	36	191	59
3044	2017-02-26 16:43:25.024119+00	118	f	38	1	60
3045	2017-02-26 16:43:25.039508+00	653	f	37	27	61
3046	2017-02-26 16:43:25.054298+00	1459	f	39	39	62
3047	2017-02-26 16:43:25.069478+00	15	f	49	2	63
3048	2017-02-26 16:43:25.084219+00	6398	f	40	105	64
3049	2017-02-26 16:43:25.099451+00	93	f	41	10	65
3050	2017-02-26 16:43:25.11422+00	43	f	43	11	66
3051	2017-02-26 16:43:25.129523+00	2791	f	42	13	67
3052	2017-02-26 16:43:25.144213+00	43	f	44	3	68
3053	2017-02-26 16:43:25.15956+00	54	f	45	4	69
3054	2017-02-26 16:43:25.174329+00	67	f	47	1	70
3055	2017-02-26 16:43:25.18968+00	7	f	57	2	71
3056	2017-02-26 16:43:27.107609+00	1	f	113	0	72
3057	2017-02-26 16:43:27.123807+00	12	f	56	37	73
3058	2017-02-26 16:43:27.139777+00	1	f	111	0	74
3059	2017-02-26 16:43:27.155314+00	3	f	71	1	75
3060	2017-02-26 16:43:27.175186+00	18099	f	48	887	76
3061	2017-02-26 16:43:28.495085+00	14	f	60	4	78
3062	2017-02-26 16:43:28.517242+00	14	f	61	2	79
3063	2017-02-26 16:43:28.533176+00	11	f	70	0	80
3064	2017-02-26 16:43:28.548709+00	17	f	51	1	81
3065	2017-02-26 16:43:28.563098+00	1	f	102	0	82
3066	2017-02-26 16:43:28.57872+00	0	f	100	1	83
3067	2017-02-26 16:43:28.592975+00	6	f	91	1	84
3068	2017-02-26 16:43:28.608692+00	0	f	96	2	85
3069	2017-02-26 16:43:28.623078+00	57	f	53	32	86
3070	2017-02-26 16:43:28.638735+00	72	f	52	13	87
3071	2017-02-26 16:43:28.653129+00	6	f	62	0	88
3072	2017-02-26 16:43:28.668861+00	9	f	64	0	89
3073	2017-02-26 16:43:28.68337+00	44	f	54	8	90
3074	2017-02-26 16:43:28.698889+00	40	f	55	1	91
3075	2017-02-26 16:43:28.71338+00	17	f	59	3	92
3076	2017-02-26 16:43:28.729005+00	358	f	58	22	93
3077	2017-02-26 16:43:31.838527+00	3	f	76	4	96
3078	2017-02-26 16:43:31.912+00	32326	f	63	1967	97
3079	2017-02-26 16:43:31.927596+00	9	f	65	1	98
3080	2017-02-26 16:43:31.941682+00	11	f	68	0	99
3081	2017-02-26 16:53:06.582974+00	4129	f	88	195	1
3082	2017-02-26 16:53:06.670408+00	286	f	94	47	3
3083	2017-02-26 16:53:06.680368+00	1857	f	4	54	4
3084	2017-02-26 16:53:06.690328+00	29506	t	2	879	5
3085	2017-02-26 16:53:06.700244+00	14268	f	5	825	6
3086	2017-02-26 16:53:06.710314+00	303	f	10	18	7
3087	2017-02-26 16:53:06.720282+00	192	f	13	15	8
3088	2017-02-26 16:53:06.730295+00	2585	f	6	94	9
3089	2017-02-26 16:53:08.477404+00	89	f	31	1	11
3090	2017-02-26 16:53:08.555138+00	2426	f	92	156	12
3091	2017-02-26 16:53:08.565441+00	578	f	8	26	13
3092	2017-02-26 16:53:09.925219+00	85	f	20	12	15
3093	2017-02-26 16:53:10.009669+00	2983	f	7	227	16
3094	2017-02-26 16:53:10.029278+00	1250	f	9	42	17
3095	2017-02-26 16:53:10.039207+00	33	f	89	10	18
3096	2017-02-26 16:53:10.049052+00	17	f	98	0	19
3097	2017-02-26 16:53:10.058963+00	13	f	109	2	20
3098	2017-02-26 16:53:10.06903+00	147	f	11	7	21
3099	2017-02-26 16:53:10.079062+00	9	f	104	1	22
3100	2017-02-26 16:53:11.734889+00	9	f	108	2	24
3101	2017-02-26 16:53:11.793494+00	517	f	12	19	25
3102	2017-02-26 16:53:11.803823+00	385	f	14	21	26
3103	2017-02-26 16:53:13.466554+00	252	f	16	13	28
3104	2017-02-26 16:53:13.538392+00	9572	f	15	1044	29
3105	2017-02-26 16:53:13.548046+00	6	f	107	0	30
3106	2017-02-26 16:53:13.557918+00	4	f	105	0	31
3107	2017-02-26 16:53:13.567966+00	5092	f	18	94	32
3108	2017-02-26 16:53:13.577931+00	45	f	26	5	33
3109	2017-02-26 16:53:13.587925+00	1328	f	21	12	34
3110	2017-02-26 16:53:13.597943+00	6	f	99	0	35
3111	2017-02-26 16:53:15.238342+00	2773	f	22	147	37
3112	2017-02-26 16:53:18.956977+00	32	f	34	1	40
3113	2017-02-26 16:53:19.032395+00	143	f	24	6	41
3114	2017-02-26 16:53:19.04199+00	228	f	23	5	42
3115	2017-02-26 16:53:20.811396+00	4467	f	25	289	44
3116	2017-02-26 16:53:22.190872+00	4	f	101	0	46
3117	2017-02-26 16:53:22.340856+00	6810	f	27	711	47
3118	2017-02-26 16:53:22.350475+00	47	f	35	2	48
3119	2017-02-26 16:53:22.360409+00	78	f	29	9	49
3120	2017-02-26 16:53:23.93331+00	21841	f	28	1776	51
3121	2017-02-26 16:53:23.954786+00	41	f	30	6	52
3122	2017-02-26 16:53:23.964706+00	18	f	46	0	53
3123	2017-02-26 16:53:24.005811+00	79	f	33	10	54
3124	2017-02-26 16:53:24.015161+00	3	f	112	0	55
3125	2017-02-26 16:53:24.025036+00	126	f	32	4	56
3126	2017-02-26 16:53:24.03506+00	2	f	110	0	57
3127	2017-02-26 16:53:24.044932+00	1	f	106	0	58
3128	2017-02-26 16:53:24.05494+00	5190	f	36	191	59
3129	2017-02-26 16:53:24.064868+00	114	f	38	1	60
3130	2017-02-26 16:53:24.075036+00	651	f	37	27	61
3131	2017-02-26 16:53:24.084988+00	1461	f	39	39	62
3132	2017-02-26 16:53:24.094892+00	13	f	49	2	63
3133	2017-02-26 16:53:24.104846+00	6405	f	40	105	64
3134	2017-02-26 16:53:24.114861+00	94	f	41	10	65
3135	2017-02-26 16:53:24.124863+00	39	f	43	11	66
3136	2017-02-26 16:53:24.134931+00	2790	f	42	13	67
3137	2017-02-26 16:53:24.144937+00	44	f	44	3	68
3138	2017-02-26 16:53:24.155189+00	51	f	45	4	69
3139	2017-02-26 16:53:24.165021+00	64	f	47	1	70
3140	2017-02-26 16:53:24.175034+00	5	f	57	2	71
3141	2017-02-26 16:53:24.185039+00	1	f	113	0	72
3142	2017-02-26 16:53:24.195083+00	9	f	56	37	73
3143	2017-02-26 16:53:24.20509+00	1	f	111	0	74
3144	2017-02-26 16:53:24.225177+00	2	f	71	1	75
3145	2017-02-26 16:53:24.235558+00	18097	f	48	887	76
3146	2017-02-26 16:53:25.647391+00	13	f	60	4	78
3147	2017-02-26 16:53:25.719916+00	15	f	61	2	79
3148	2017-02-26 16:53:25.729816+00	10	f	70	0	80
3149	2017-02-26 16:53:25.739777+00	16	f	51	1	81
3150	2017-02-26 16:53:25.749641+00	1	f	102	0	82
3151	2017-02-26 16:53:25.759631+00	0	f	100	1	83
3152	2017-02-26 16:53:25.769466+00	5	f	91	1	84
3153	2017-02-26 16:53:25.779477+00	0	f	96	2	85
3154	2017-02-26 16:53:25.789437+00	58	f	53	32	86
3155	2017-02-26 16:53:25.799435+00	69	f	52	13	87
3156	2017-02-26 16:53:25.809412+00	9	f	62	0	88
3157	2017-02-26 16:53:25.819399+00	7	f	64	0	89
3158	2017-02-26 16:53:25.849523+00	46	f	54	8	90
3159	2017-02-26 16:53:25.879617+00	39	f	55	1	91
3160	2017-02-26 16:53:25.909869+00	18	f	59	3	92
3161	2017-02-26 16:53:25.920421+00	363	f	58	22	93
3162	2017-02-26 16:53:28.921344+00	3	f	76	4	96
3163	2017-02-26 16:53:29.015968+00	32319	f	63	1967	97
3164	2017-02-26 16:53:29.038482+00	9	f	65	1	98
3165	2017-02-26 16:53:29.04838+00	11	f	68	0	99
3166	2017-02-26 17:03:06.807213+00	4745	f	88	226	1
3167	2017-02-26 17:03:06.901061+00	306	f	94	49	3
3168	2017-02-26 17:03:06.917486+00	1876	f	4	54	4
3169	2017-02-26 17:03:06.933571+00	29502	t	2	878	5
3170	2017-02-26 17:03:06.949036+00	14263	f	5	825	6
3171	2017-02-26 17:03:06.963555+00	304	f	10	18	7
3172	2017-02-26 17:03:06.97931+00	201	f	13	15	8
3173	2017-02-26 17:03:06.993653+00	2593	f	6	94	9
3174	2017-02-26 17:03:08.669499+00	97	f	31	1	11
3175	2017-02-26 17:03:08.781442+00	2429	f	92	156	12
3176	2017-02-26 17:03:08.794347+00	585	f	8	26	13
3177	2017-02-26 17:03:10.340312+00	86	f	20	12	15
3178	2017-02-26 17:03:10.422965+00	2975	f	7	227	16
3179	2017-02-26 17:03:10.438397+00	1251	f	9	43	17
3180	2017-02-26 17:03:10.452482+00	32	f	89	10	18
3181	2017-02-26 17:03:10.468442+00	16	f	98	0	19
3182	2017-02-26 17:03:10.482554+00	148	f	11	7	20
3183	2017-02-26 17:03:10.498541+00	11	f	109	2	21
3184	2017-02-26 17:03:10.512603+00	11	f	104	1	22
3185	2017-02-26 17:03:11.862815+00	10	f	108	2	24
3186	2017-02-26 17:03:11.92068+00	520	f	12	20	25
3187	2017-02-26 17:03:11.936256+00	386	f	14	21	26
3188	2017-02-26 17:03:13.23042+00	6	f	110	1	28
3189	2017-02-26 17:03:13.264694+00	247	f	16	13	29
3190	2017-02-26 17:03:13.304604+00	9570	f	15	1044	30
3191	2017-02-26 17:03:13.319949+00	6	f	107	0	31
3192	2017-02-26 17:03:13.336047+00	7	f	105	0	32
3193	2017-02-26 17:03:13.34987+00	46	f	26	5	33
3194	2017-02-26 17:03:13.366169+00	5090	f	18	94	34
3195	2017-02-26 17:03:15.048824+00	1327	f	21	12	36
3196	2017-02-26 17:03:16.698237+00	2772	f	22	147	38
3197	2017-02-26 17:03:18.337045+00	31	f	34	1	40
3198	2017-02-26 17:03:18.409874+00	143	f	24	6	41
3199	2017-02-26 17:03:18.42303+00	4	f	112	0	42
3200	2017-02-26 17:03:18.439684+00	3	f	99	0	43
3201	2017-02-26 17:03:20.051236+00	227	f	23	5	45
3202	2017-02-26 17:03:21.72459+00	4464	f	25	289	47
3203	2017-02-26 17:03:23.113161+00	2	f	101	0	49
3204	2017-02-26 17:03:23.185312+00	6811	f	27	711	50
3205	2017-02-26 17:03:23.202328+00	46	f	35	2	51
3206	2017-02-26 17:03:23.222431+00	77	f	29	9	52
3207	2017-02-26 17:03:23.235004+00	42	f	30	6	53
3208	2017-02-26 17:03:23.250464+00	21840	f	28	1776	54
3209	2017-02-26 17:03:23.26479+00	19	f	46	0	55
3210	2017-02-26 17:03:23.282148+00	75	f	33	10	56
3211	2017-02-26 17:03:23.294882+00	127	f	32	4	57
3212	2017-02-26 17:03:23.310107+00	1	f	106	0	58
3213	2017-02-26 17:03:23.324894+00	5191	f	36	191	59
3214	2017-02-26 17:03:23.382776+00	117	f	38	1	60
3215	2017-02-26 17:03:23.39531+00	650	f	37	27	61
3216	2017-02-26 17:03:23.410516+00	1461	f	39	39	62
3217	2017-02-26 17:03:23.425374+00	15	f	49	2	63
3218	2017-02-26 17:03:23.440591+00	6406	f	40	105	64
3219	2017-02-26 17:03:23.45524+00	93	f	41	10	65
3220	2017-02-26 17:03:23.470536+00	41	f	43	11	66
3221	2017-02-26 17:03:23.48539+00	2792	f	42	13	67
3222	2017-02-26 17:03:23.500663+00	45	f	44	3	68
3223	2017-02-26 17:03:23.515439+00	51	f	45	4	69
3224	2017-02-26 17:03:25.915315+00	1	f	114	0	70
3225	2017-02-26 17:03:26.09891+00	68	f	47	1	71
3226	2017-02-26 17:03:26.122747+00	5	f	57	2	72
3227	2017-02-26 17:03:26.138575+00	0	f	113	0	73
3228	2017-02-26 17:03:26.152755+00	8	f	56	37	74
3229	2017-02-26 17:03:26.168032+00	1	f	111	0	75
3230	2017-02-26 17:03:26.182557+00	3	f	71	1	76
3231	2017-02-26 17:03:26.202687+00	18091	f	48	887	77
3232	2017-02-26 17:03:27.494389+00	15	f	60	4	79
3233	2017-02-26 17:03:27.576723+00	17	f	61	2	80
3234	2017-02-26 17:03:27.606681+00	11	f	70	0	81
3235	2017-02-26 17:03:27.626547+00	15	f	51	1	82
3236	2017-02-26 17:03:27.641961+00	1	f	102	0	83
3237	2017-02-26 17:03:27.656341+00	0	f	100	1	84
3238	2017-02-26 17:03:27.671834+00	6	f	91	1	85
3239	2017-02-26 17:03:27.686353+00	0	f	96	2	86
3240	2017-02-26 17:03:27.701751+00	61	f	53	32	87
3241	2017-02-26 17:03:27.716289+00	65	f	52	13	88
3242	2017-02-26 17:03:27.731761+00	9	f	62	0	89
3243	2017-02-26 17:03:27.746211+00	7	f	64	0	90
3244	2017-02-26 17:03:27.761755+00	47	f	54	8	91
3245	2017-02-26 17:03:27.776249+00	41	f	55	1	92
3246	2017-02-26 17:03:27.791736+00	17	f	59	3	93
3247	2017-02-26 17:03:27.806277+00	368	f	58	22	94
3248	2017-02-26 17:03:30.620792+00	2	f	76	4	97
3249	2017-02-26 17:03:30.692985+00	32319	f	63	1967	98
3250	2017-02-26 17:03:30.710119+00	8	f	65	1	99
3251	2017-02-26 17:13:06.673508+00	5324	f	88	255	1
3252	2017-02-26 17:13:06.739596+00	343	f	94	51	3
3253	2017-02-26 17:13:06.899135+00	1898	f	4	55	4
3254	2017-02-26 17:13:06.916364+00	29514	t	2	879	5
3255	2017-02-26 17:13:06.928616+00	14267	f	5	825	6
3256	2017-02-26 17:13:06.938665+00	316	f	10	19	7
3257	2017-02-26 17:13:06.958649+00	211	f	13	15	8
3258	2017-02-26 17:13:06.968576+00	100	f	31	2	9
3259	2017-02-26 17:13:06.978716+00	2595	f	6	94	10
3260	2017-02-26 17:13:08.740679+00	2433	f	92	156	12
3261	2017-02-26 17:13:08.934785+00	584	f	8	26	13
3262	2017-02-26 17:13:10.423355+00	88	f	20	12	15
3263	2017-02-26 17:13:10.599642+00	36	f	89	10	16
3264	2017-02-26 17:13:10.629045+00	2980	f	7	227	17
3265	2017-02-26 17:13:10.646301+00	1253	f	9	43	18
3266	2017-02-26 17:13:10.658883+00	18	f	98	0	19
3267	2017-02-26 17:13:10.67484+00	12	f	108	2	20
3268	2017-02-26 17:13:10.688724+00	13	f	109	2	21
3269	2017-02-26 17:13:10.704696+00	152	f	11	7	22
3270	2017-02-26 17:13:10.718624+00	12	f	104	1	23
3271	2017-02-26 17:13:12.158357+00	8	f	110	2	25
3272	2017-02-26 17:13:12.253519+00	519	f	12	20	26
3273	2017-02-26 17:13:12.269813+00	387	f	14	21	27
3274	2017-02-26 17:13:13.582426+00	249	f	16	13	29
3275	2017-02-26 17:13:13.651561+00	9566	f	15	1044	30
3276	2017-02-26 17:13:13.673592+00	6	f	107	0	31
3277	2017-02-26 17:13:13.686705+00	6	f	105	0	32
3278	2017-02-26 17:13:13.702746+00	44	f	26	5	33
3279	2017-02-26 17:13:13.716605+00	5099	f	18	94	34
3280	2017-02-26 17:13:13.732539+00	5	f	112	0	35
3281	2017-02-26 17:13:15.316364+00	1332	f	21	12	37
3282	2017-02-26 17:13:16.914553+00	2776	f	22	147	39
3283	2017-02-26 17:13:18.492257+00	34	f	34	1	41
3284	2017-02-26 17:13:18.559951+00	143	f	24	6	42
3285	2017-02-26 17:13:18.575915+00	4	f	99	0	43
3286	2017-02-26 17:13:20.305876+00	226	f	23	5	45
3287	2017-02-26 17:13:21.792413+00	4464	f	25	289	47
3288	2017-02-26 17:13:23.20855+00	3	f	101	0	49
3289	2017-02-26 17:13:23.282232+00	6810	f	27	711	50
3290	2017-02-26 17:13:23.297783+00	41	f	35	2	51
3291	2017-02-26 17:13:23.311796+00	78	f	29	9	52
3292	2017-02-26 17:13:23.327586+00	46	f	30	6	53
3293	2017-02-26 17:13:23.341806+00	21841	f	28	1776	54
3294	2017-02-26 17:13:23.35753+00	20	f	46	0	55
3295	2017-02-26 17:13:23.371841+00	80	f	33	10	56
3296	2017-02-26 17:13:23.387662+00	125	f	32	4	57
3297	2017-02-26 17:13:23.40187+00	2	f	106	0	58
3298	2017-02-26 17:13:23.417687+00	5194	f	36	191	59
3299	2017-02-26 17:13:23.431925+00	115	f	38	1	60
3300	2017-02-26 17:13:23.447872+00	651	f	37	27	61
3301	2017-02-26 17:13:23.461999+00	13	f	49	2	62
3302	2017-02-26 17:13:23.477955+00	1457	f	39	39	63
3303	2017-02-26 17:13:23.548902+00	43	f	43	11	64
3304	2017-02-26 17:13:23.562923+00	6399	f	40	105	65
3305	2017-02-26 17:13:23.578551+00	97	f	41	10	66
3306	2017-02-26 17:13:23.592692+00	46	f	44	3	67
3307	2017-02-26 17:13:23.608424+00	2789	f	42	13	68
3308	2017-02-26 17:13:23.622614+00	55	f	45	4	69
3309	2017-02-26 17:13:25.053307+00	1	f	114	0	71
3310	2017-02-26 17:13:25.120669+00	67	f	47	1	72
3311	2017-02-26 17:13:25.14263+00	7	f	57	2	73
3312	2017-02-26 17:13:25.169925+00	0	f	113	0	74
3313	2017-02-26 17:13:25.217936+00	11	f	56	37	75
3314	2017-02-26 17:13:25.257889+00	1	f	111	0	76
3315	2017-02-26 17:13:25.270269+00	3	f	71	1	77
3316	2017-02-26 17:13:25.280298+00	18101	f	48	887	78
3317	2017-02-26 17:13:26.561919+00	15	f	60	4	80
3318	2017-02-26 17:13:26.634272+00	15	f	61	2	81
3319	2017-02-26 17:13:26.644054+00	11	f	70	0	82
3320	2017-02-26 17:13:26.65404+00	18	f	51	1	83
3321	2017-02-26 17:13:26.66389+00	1	f	102	0	84
3322	2017-02-26 17:13:26.673795+00	1	f	100	1	85
3323	2017-02-26 17:13:26.683778+00	5	f	91	1	86
3324	2017-02-26 17:13:26.693849+00	0	f	96	2	87
3325	2017-02-26 17:13:26.703717+00	58	f	53	32	88
3326	2017-02-26 17:13:26.713699+00	68	f	52	13	89
3327	2017-02-26 17:13:26.723693+00	8	f	62	0	90
3328	2017-02-26 17:13:26.733714+00	8	f	64	0	91
3329	2017-02-26 17:13:26.743724+00	42	f	54	8	92
3330	2017-02-26 17:13:26.753674+00	38	f	55	1	93
3331	2017-02-26 17:13:26.763735+00	17	f	59	3	94
3332	2017-02-26 17:13:26.773721+00	361	f	58	22	95
3333	2017-02-26 17:13:29.692734+00	3	f	76	4	98
3334	2017-02-26 17:13:29.752+00	32330	f	63	1967	99
3335	2017-02-26 17:23:07.141595+00	5952	f	88	285	1
3336	2017-02-26 17:23:07.404256+00	366	f	94	55	3
3337	2017-02-26 17:23:07.420235+00	1906	f	4	56	4
3338	2017-02-26 17:23:07.444661+00	29510	t	2	880	5
3339	2017-02-26 17:23:07.460197+00	14266	f	5	825	6
3340	2017-02-26 17:23:07.47453+00	325	f	10	19	7
3341	2017-02-26 17:23:07.494753+00	223	f	13	15	8
3342	2017-02-26 17:23:07.510283+00	112	f	31	2	9
3343	2017-02-26 17:23:07.540437+00	2597	f	6	95	10
3344	2017-02-26 17:23:09.307083+00	2438	f	92	156	12
3345	2017-02-26 17:23:09.390179+00	591	f	8	26	13
3346	2017-02-26 17:23:10.774839+00	86	f	20	12	15
3347	2017-02-26 17:23:10.866774+00	37	f	89	10	16
3348	2017-02-26 17:23:10.883455+00	2981	f	7	227	17
3349	2017-02-26 17:23:10.899107+00	1250	f	9	43	18
3350	2017-02-26 17:23:10.913259+00	17	f	109	2	19
3351	2017-02-26 17:23:10.929136+00	18	f	98	0	20
3352	2017-02-26 17:23:12.359772+00	13	f	108	2	22
3353	2017-02-26 17:23:12.397403+00	153	f	11	7	23
3354	2017-02-26 17:23:12.413182+00	13	f	104	1	24
3355	2017-02-26 17:23:12.427326+00	11	f	110	2	25
3356	2017-02-26 17:23:12.443203+00	525	f	12	20	26
3357	2017-02-26 17:23:12.45723+00	385	f	14	21	27
3358	2017-02-26 17:23:13.789415+00	7	f	107	0	29
3359	2017-02-26 17:23:13.861508+00	8	f	112	0	30
3360	2017-02-26 17:23:13.877433+00	7	f	105	0	31
3361	2017-02-26 17:23:13.894158+00	250	f	16	13	32
3362	2017-02-26 17:23:13.90739+00	9566	f	15	1044	33
3363	2017-02-26 17:23:13.921114+00	48	f	26	5	34
3364	2017-02-26 17:23:13.937178+00	5096	f	18	94	35
3365	2017-02-26 17:23:15.465794+00	1332	f	21	12	37
3366	2017-02-26 17:23:17.130461+00	6	f	99	0	39
3367	2017-02-26 17:23:17.206281+00	2780	f	22	147	40
3368	2017-02-26 17:23:18.844817+00	30	f	34	1	42
3369	2017-02-26 17:23:18.90435+00	144	f	24	6	43
3370	2017-02-26 17:23:20.556187+00	226	f	23	5	45
3371	2017-02-26 17:23:22.055642+00	4474	f	25	289	47
3372	2017-02-26 17:23:23.312594+00	4	f	101	0	49
3373	2017-02-26 17:23:23.37836+00	6814	f	27	712	50
3374	2017-02-26 17:23:23.395392+00	44	f	35	2	51
3375	2017-02-26 17:23:23.412418+00	47	f	30	6	52
3376	2017-02-26 17:23:23.428045+00	74	f	29	8	53
3377	2017-02-26 17:23:24.776811+00	21833	f	28	1777	55
3378	2017-02-26 17:23:24.83212+00	1	f	114	0	56
3379	2017-02-26 17:23:24.849006+00	19	f	46	0	57
3380	2017-02-26 17:23:24.866391+00	83	f	33	10	58
3381	2017-02-26 17:23:24.881797+00	126	f	32	4	59
3382	2017-02-26 17:23:24.896308+00	2	f	111	0	60
3383	2017-02-26 17:23:24.911579+00	0	f	106	0	61
3384	2017-02-26 17:23:24.926157+00	5189	f	36	191	62
3385	2017-02-26 17:23:24.941705+00	1	f	102	0	63
3386	2017-02-26 17:23:24.956136+00	114	f	38	1	64
3387	2017-02-26 17:23:24.971596+00	1	f	100	1	65
3388	2017-02-26 17:23:24.986275+00	649	f	37	27	66
3389	2017-02-26 17:23:25.001651+00	13	f	49	2	67
3390	2017-02-26 17:23:25.016192+00	1466	f	39	39	68
3391	2017-02-26 17:23:25.031663+00	41	f	43	11	69
3392	2017-02-26 17:23:25.046298+00	6400	f	40	105	70
3393	2017-02-26 17:23:25.06162+00	94	f	41	10	71
3394	2017-02-26 17:23:25.076278+00	3	f	71	1	72
3395	2017-02-26 17:23:25.09185+00	43	f	44	3	73
3396	2017-02-26 17:23:25.106414+00	2793	f	42	13	74
3397	2017-02-26 17:23:27.576675+00	1	f	115	0	75
3398	2017-02-26 17:23:27.588694+00	8	f	57	2	76
3399	2017-02-26 17:23:27.603434+00	54	f	45	4	77
3400	2017-02-26 17:23:27.618542+00	11	f	56	37	78
3401	2017-02-26 17:23:29.020351+00	66	f	47	1	80
3402	2017-02-26 17:23:29.093023+00	13	f	60	4	81
3403	2017-02-26 17:23:29.110145+00	18099	f	48	887	82
3404	2017-02-26 17:23:29.122742+00	18	f	61	2	83
3405	2017-02-26 17:23:29.137569+00	14	f	70	0	84
3406	2017-02-26 17:23:29.152947+00	17	f	51	1	85
3407	2017-02-26 17:23:29.167615+00	5	f	91	1	86
3408	2017-02-26 17:23:29.182614+00	6	f	62	0	87
3409	2017-02-26 17:23:29.197531+00	10	f	64	0	88
3410	2017-02-26 17:23:29.212615+00	0	f	96	2	89
3411	2017-02-26 17:23:29.227495+00	56	f	53	32	90
3412	2017-02-26 17:23:29.242986+00	70	f	52	13	91
3413	2017-02-26 17:23:29.257646+00	42	f	54	8	92
3414	2017-02-26 17:23:29.27278+00	18	f	59	3	93
3415	2017-02-26 17:23:29.287591+00	37	f	55	1	94
3416	2017-02-26 17:23:29.3028+00	362	f	58	22	95
3417	2017-02-26 17:23:33.037238+00	2	f	76	4	98
3418	2017-02-26 17:23:33.178874+00	32320	f	63	1968	99
3419	2017-02-26 17:33:08.08891+00	6555	f	88	306	1
3420	2017-02-26 17:33:08.224843+00	395	f	94	57	3
3421	2017-02-26 17:33:08.260526+00	1927	f	4	56	4
3422	2017-02-26 17:33:08.280375+00	29514	t	2	880	5
3423	2017-02-26 17:33:08.292254+00	339	f	10	19	6
3424	2017-02-26 17:33:08.310297+00	14271	f	5	825	7
3425	2017-02-26 17:33:08.322211+00	227	f	13	15	8
3426	2017-02-26 17:33:08.33223+00	116	f	31	2	9
3427	2017-02-26 17:33:10.011408+00	2598	f	6	95	11
3428	2017-02-26 17:33:10.222478+00	2436	f	92	156	12
3429	2017-02-26 17:33:10.24755+00	593	f	8	26	13
3430	2017-02-26 17:33:11.728297+00	96	f	20	12	15
3431	2017-02-26 17:33:11.821815+00	18	f	109	2	16
3432	2017-02-26 17:33:11.851769+00	35	f	89	10	17
3433	2017-02-26 17:33:11.868486+00	2976	f	7	227	18
3434	2017-02-26 17:33:11.881533+00	1252	f	9	44	19
3435	2017-02-26 17:33:11.891509+00	14	f	110	2	20
3436	2017-02-26 17:33:11.901477+00	20	f	98	0	21
3437	2017-02-26 17:33:13.257845+00	12	f	112	0	23
3438	2017-02-26 17:33:13.456537+00	14	f	104	1	24
3439	2017-02-26 17:33:13.47249+00	150	f	11	7	25
3440	2017-02-26 17:33:13.643596+00	11	f	108	2	26
3441	2017-02-26 17:33:13.656164+00	10	f	107	1	27
3442	2017-02-26 17:33:13.67266+00	528	f	12	20	28
3443	2017-02-26 17:33:13.685982+00	6	f	105	0	29
3444	2017-02-26 17:33:13.695902+00	383	f	14	21	30
3445	2017-02-26 17:33:15.001645+00	249	f	16	13	32
3446	2017-02-26 17:33:15.21919+00	9573	f	15	1044	33
3447	2017-02-26 17:33:15.244741+00	47	f	26	5	34
3448	2017-02-26 17:33:15.266728+00	3	f	115	0	35
3449	2017-02-26 17:33:19.678635+00	5096	f	18	94	37
3450	2017-02-26 17:33:21.287466+00	1330	f	21	12	39
3451	2017-02-26 17:33:22.859285+00	5	f	99	0	41
3452	2017-02-26 17:33:22.939776+00	2780	f	22	147	42
3453	2017-02-26 17:33:24.550968+00	29	f	34	1	44
3454	2017-02-26 17:33:24.633869+00	141	f	24	6	45
3455	2017-02-26 17:33:26.150052+00	228	f	23	5	47
3456	2017-02-26 17:33:27.944239+00	4463	f	25	289	49
3457	2017-02-26 17:33:29.435911+00	2	f	101	0	51
3458	2017-02-26 17:33:29.50622+00	2	f	102	0	52
3459	2017-02-26 17:33:29.52315+00	6806	f	27	712	53
3460	2017-02-26 17:33:29.5361+00	44	f	35	2	54
3461	2017-02-26 17:33:29.552837+00	48	f	30	6	55
3462	2017-02-26 17:33:29.584134+00	79	f	29	8	56
3463	2017-02-26 17:33:29.606151+00	21846	f	28	1779	57
3464	2017-02-26 17:33:29.615976+00	1	f	114	0	58
3465	2017-02-26 17:33:29.625882+00	18	f	46	0	59
3466	2017-02-26 17:33:29.636039+00	83	f	33	10	60
3467	2017-02-26 17:33:29.646058+00	122	f	32	4	61
3468	2017-02-26 17:33:29.656041+00	2	f	111	0	62
3469	2017-02-26 17:33:29.666093+00	1	f	106	0	63
3470	2017-02-26 17:33:29.675957+00	5187	f	36	191	64
3471	2017-02-26 17:33:29.686007+00	115	f	38	1	65
3472	2017-02-26 17:33:29.696073+00	651	f	37	27	66
3473	2017-02-26 17:33:29.705965+00	16	f	49	2	67
3474	2017-02-26 17:33:29.715915+00	1461	f	39	39	68
3475	2017-02-26 17:33:29.725931+00	43	f	43	11	69
3476	2017-02-26 17:33:29.736149+00	6403	f	40	105	70
3477	2017-02-26 17:33:29.745992+00	96	f	41	10	71
3478	2017-02-26 17:33:29.756037+00	4	f	71	1	72
3479	2017-02-26 17:33:29.776187+00	43	f	44	3	73
3480	2017-02-26 17:33:29.786223+00	2789	f	42	13	74
3481	2017-02-26 17:33:32.162972+00	0	f	116	0	75
3482	2017-02-26 17:33:33.461305+00	8	f	57	2	77
3483	2017-02-26 17:33:33.546874+00	55	f	45	4	78
3484	2017-02-26 17:33:33.563426+00	10	f	56	37	79
3485	2017-02-26 17:33:33.576475+00	66	f	47	1	80
3486	2017-02-26 17:33:33.586393+00	13	f	60	4	81
3487	2017-02-26 17:33:33.596202+00	18098	f	48	887	82
3488	2017-02-26 17:33:33.613053+00	18	f	61	2	83
3489	2017-02-26 17:33:33.626293+00	15	f	70	0	84
3490	2017-02-26 17:33:33.63624+00	20	f	51	1	85
3491	2017-02-26 17:33:33.646572+00	7	f	91	1	86
3492	2017-02-26 17:33:33.656217+00	9	f	62	0	87
3493	2017-02-26 17:33:33.666189+00	0	f	100	1	88
3494	2017-02-26 17:33:33.676202+00	2	f	76	4	89
3495	2017-02-26 17:33:33.686164+00	9	f	64	0	90
3496	2017-02-26 17:33:33.69618+00	0	f	96	2	91
3497	2017-02-26 17:33:33.706194+00	60	f	53	32	92
3498	2017-02-26 17:33:33.716236+00	70	f	52	13	93
3499	2017-02-26 17:33:33.726164+00	48	f	54	8	94
3500	2017-02-26 17:33:35.015478+00	19	f	59	3	96
3501	2017-02-26 17:33:35.113777+00	39	f	55	1	97
3502	2017-02-26 17:33:36.829258+00	365	f	58	22	99
3503	2017-02-26 17:43:07.48204+00	7154	f	88	328	1
3504	2017-02-26 17:43:07.563251+00	410	f	94	57	3
3505	2017-02-26 17:43:07.579745+00	1951	f	4	57	4
3506	2017-02-26 17:43:07.59597+00	29529	t	2	880	5
3507	2017-02-26 17:43:07.609572+00	348	f	10	19	6
3508	2017-02-26 17:43:07.629724+00	14272	f	5	825	7
3509	2017-02-26 17:43:07.643072+00	234	f	13	15	8
3510	2017-02-26 17:43:07.655952+00	126	f	31	2	9
3511	2017-02-26 17:43:09.262838+00	2594	f	6	95	11
3512	2017-02-26 17:43:09.344445+00	2446	f	92	157	12
3513	2017-02-26 17:43:09.37076+00	26	f	109	2	13
3514	2017-02-26 17:43:09.384265+00	98	f	20	12	14
3515	2017-02-26 17:43:09.400603+00	595	f	8	26	15
3516	2017-02-26 17:43:10.764298+00	18	f	110	2	17
3517	2017-02-26 17:43:10.914626+00	38	f	89	10	18
3518	2017-02-26 17:43:10.935179+00	22	f	98	0	19
3519	2017-02-26 17:43:10.952015+00	2982	f	7	228	20
3520	2017-02-26 17:43:10.968284+00	16	f	112	1	21
3521	2017-02-26 17:43:10.981791+00	1259	f	9	45	22
3522	2017-02-26 17:43:12.389174+00	16	f	104	1	24
3523	2017-02-26 17:43:12.411981+00	14	f	108	2	25
3524	2017-02-26 17:43:12.425417+00	13	f	107	1	26
3525	2017-02-26 17:43:12.441889+00	153	f	11	7	27
3526	2017-02-26 17:43:12.455491+00	12	f	105	0	28
3527	2017-02-26 17:43:12.468476+00	523	f	12	20	29
3528	2017-02-26 17:43:12.481867+00	5	f	115	0	30
3529	2017-02-26 17:43:12.495341+00	389	f	14	21	31
3530	2017-02-26 17:43:13.830257+00	254	f	16	13	33
3531	2017-02-26 17:43:13.903123+00	9574	f	15	1044	34
3532	2017-02-26 17:43:13.919419+00	49	f	26	5	35
3533	2017-02-26 17:43:13.935842+00	5	f	99	0	36
3534	2017-02-26 17:43:16.894052+00	5102	f	18	94	39
3535	2017-02-26 17:43:16.977368+00	1335	f	21	12	40
3536	2017-02-26 17:43:18.907399+00	2773	f	22	147	42
3537	2017-02-26 17:43:20.552442+00	32	f	34	1	44
3538	2017-02-26 17:43:20.623257+00	144	f	24	6	45
3539	2017-02-26 17:43:22.669219+00	221	f	23	5	47
3540	2017-02-26 17:43:24.4162+00	4464	f	25	289	49
3541	2017-02-26 17:43:25.770302+00	1	f	101	0	51
3542	2017-02-26 17:43:25.854061+00	3	f	102	0	52
3543	2017-02-26 17:43:25.870123+00	6814	f	27	712	53
3544	2017-02-26 17:43:25.886146+00	42	f	35	2	54
3545	2017-02-26 17:43:25.899642+00	49	f	30	6	55
3546	2017-02-26 17:43:25.916009+00	79	f	29	8	56
3547	2017-02-26 17:43:25.929486+00	21839	f	28	1779	57
3548	2017-02-26 17:43:25.943553+00	1	f	114	0	58
3549	2017-02-26 17:43:25.959658+00	16	f	46	0	59
3550	2017-02-26 17:43:25.993793+00	83	f	33	10	60
3551	2017-02-26 17:43:26.009765+00	127	f	32	4	61
3552	2017-02-26 17:43:26.023861+00	2	f	111	0	62
3553	2017-02-26 17:43:26.039758+00	2	f	106	0	63
3554	2017-02-26 17:43:26.053797+00	5195	f	36	191	64
3555	2017-02-26 17:43:26.069737+00	116	f	38	1	65
3556	2017-02-26 17:43:26.083957+00	654	f	37	27	66
3557	2017-02-26 17:43:26.099916+00	13	f	49	2	67
3558	2017-02-26 17:43:26.113852+00	1466	f	39	39	68
3559	2017-02-26 17:43:26.126272+00	45	f	43	11	69
3560	2017-02-26 17:43:26.139813+00	6397	f	40	105	70
3561	2017-02-26 17:43:26.153996+00	97	f	41	10	71
3562	2017-02-26 17:43:26.169846+00	4	f	71	1	72
3563	2017-02-26 17:43:26.186577+00	43	f	44	3	73
3564	2017-02-26 17:43:28.097598+00	0	f	117	1	74
3565	2017-02-26 17:43:30.156087+00	1	f	118	0	75
3566	2017-02-26 17:43:30.172154+00	12	f	56	37	76
3567	2017-02-26 17:43:30.188134+00	2792	f	42	13	77
3568	2017-02-26 17:43:30.203122+00	0	f	116	0	78
3569	2017-02-26 17:43:31.609719+00	8	f	57	2	80
3570	2017-02-26 17:43:31.682427+00	56	f	45	4	81
3571	2017-02-26 17:43:31.697163+00	71	f	47	1	82
3572	2017-02-26 17:43:31.712083+00	13	f	60	4	83
3573	2017-02-26 17:43:31.732222+00	18095	f	48	887	84
3574	2017-02-26 17:43:31.746971+00	14	f	61	2	85
3575	2017-02-26 17:43:31.761853+00	13	f	70	0	86
3576	2017-02-26 17:43:31.776913+00	19	f	51	1	87
3577	2017-02-26 17:43:31.791788+00	6	f	91	1	88
3578	2017-02-26 17:43:31.807126+00	10	f	62	0	89
3579	2017-02-26 17:43:31.821865+00	2	f	100	1	90
3580	2017-02-26 17:43:31.836832+00	4	f	76	4	91
3581	2017-02-26 17:43:31.851921+00	7	f	64	0	92
3582	2017-02-26 17:43:33.306999+00	0	f	96	2	94
3583	2017-02-26 17:43:33.386932+00	57	f	53	32	95
3584	2017-02-26 17:43:33.406533+00	66	f	52	13	96
3585	2017-02-26 17:43:33.426382+00	44	f	54	8	97
3586	2017-02-26 17:43:33.441493+00	18	f	59	3	98
3587	2017-02-26 17:43:33.456293+00	40	f	55	1	99
3588	2017-02-26 17:53:08.524877+00	7639	f	88	353	1
3589	2017-02-26 17:53:08.618475+00	433	f	94	60	3
3590	2017-02-26 17:53:08.636066+00	1967	f	4	58	4
3591	2017-02-26 17:53:08.65279+00	29534	t	2	880	5
3592	2017-02-26 17:53:08.665876+00	349	f	10	19	6
3593	2017-02-26 17:53:08.67588+00	14275	f	5	825	7
3594	2017-02-26 17:53:08.685825+00	131	f	31	2	8
3595	2017-02-26 17:53:08.695904+00	237	f	13	15	9
3596	2017-02-26 17:53:10.416679+00	29	f	109	3	11
3597	2017-02-26 17:53:10.550763+00	2594	f	6	95	12
3598	2017-02-26 17:53:10.578165+00	2445	f	92	157	13
3599	2017-02-26 17:53:10.716716+00	96	f	20	12	14
3600	2017-02-26 17:53:10.741388+00	593	f	8	26	15
3601	2017-02-26 17:53:12.143834+00	19	f	112	1	17
3602	2017-02-26 17:53:12.215622+00	18	f	110	2	18
3603	2017-02-26 17:53:12.232625+00	26	f	98	0	19
3604	2017-02-26 17:53:12.245339+00	39	f	89	11	20
3605	2017-02-26 17:53:12.255289+00	2987	f	7	228	21
3606	2017-02-26 17:53:12.265205+00	1255	f	9	45	22
3607	2017-02-26 17:53:13.600455+00	16	f	104	1	24
3608	2017-02-26 17:53:13.649108+00	14	f	108	2	25
3609	2017-02-26 17:53:13.658935+00	14	f	107	1	26
3610	2017-02-26 17:53:13.668877+00	156	f	11	7	27
3611	2017-02-26 17:53:13.678766+00	12	f	105	0	28
3612	2017-02-26 17:53:13.688708+00	524	f	12	20	29
3613	2017-02-26 17:53:13.698736+00	6	f	115	0	30
3614	2017-02-26 17:53:15.176307+00	389	f	14	21	32
3615	2017-02-26 17:53:16.537414+00	255	f	16	13	34
3616	2017-02-26 17:53:16.58662+00	9	f	99	0	35
3617	2017-02-26 17:53:16.596616+00	9572	f	15	1044	36
3618	2017-02-26 17:53:16.606449+00	48	f	26	5	37
3619	2017-02-26 17:53:18.163681+00	5101	f	18	94	39
3620	2017-02-26 17:53:19.860386+00	1336	f	21	12	41
3621	2017-02-26 17:53:21.531467+00	2776	f	22	148	43
3622	2017-02-26 17:53:23.285667+00	3	f	101	0	45
3623	2017-02-26 17:53:23.343571+00	4	f	102	0	46
3624	2017-02-26 17:53:23.353166+00	32	f	34	1	47
3625	2017-02-26 17:53:23.363272+00	144	f	24	6	48
3626	2017-02-26 17:53:24.804756+00	229	f	23	5	50
3627	2017-02-26 17:53:24.90901+00	4467	f	25	289	51
3628	2017-02-26 17:53:26.588605+00	3	f	118	0	53
3629	2017-02-26 17:53:26.670431+00	6817	f	27	714	54
3630	2017-02-26 17:53:26.681802+00	46	f	35	2	55
3631	2017-02-26 17:53:26.691805+00	45	f	30	6	56
3632	2017-02-26 17:53:26.701675+00	76	f	29	8	57
3633	2017-02-26 17:53:26.711584+00	21841	f	28	1779	58
3634	2017-02-26 17:53:26.721553+00	2	f	114	0	59
3635	2017-02-26 17:53:26.731622+00	18	f	46	1	60
3636	2017-02-26 17:53:26.751673+00	83	f	33	10	61
3637	2017-02-26 17:53:26.761706+00	120	f	32	4	62
3638	2017-02-26 17:53:26.771718+00	2	f	111	0	63
3639	2017-02-26 17:53:26.781745+00	1	f	106	0	64
3640	2017-02-26 17:53:26.791802+00	5187	f	36	191	65
3641	2017-02-26 17:53:26.801812+00	117	f	38	1	66
3642	2017-02-26 17:53:26.811753+00	655	f	37	27	67
3643	2017-02-26 17:53:26.822438+00	17	f	49	2	68
3644	2017-02-26 17:53:26.832309+00	1465	f	39	39	69
3645	2017-02-26 17:53:26.84223+00	42	f	43	11	70
3646	2017-02-26 17:53:26.852101+00	6407	f	40	105	71
3647	2017-02-26 17:53:26.862021+00	94	f	41	10	72
3648	2017-02-26 17:53:26.872131+00	12	f	56	37	73
3649	2017-02-26 17:53:26.892041+00	4	f	71	1	74
3650	2017-02-26 17:53:28.6538+00	1	f	119	0	75
3651	2017-02-26 17:53:28.667276+00	44	f	44	3	76
3652	2017-02-26 17:53:28.677096+00	0	f	117	1	77
3653	2017-02-26 17:53:28.687002+00	2789	f	42	13	78
3654	2017-02-26 17:53:28.697001+00	0	f	116	0	79
3655	2017-02-26 17:53:30.001999+00	9	f	57	2	81
3656	2017-02-26 17:53:30.091872+00	53	f	45	4	82
3657	2017-02-26 17:53:30.100915+00	67	f	47	1	83
3658	2017-02-26 17:53:30.113199+00	12	f	60	4	84
3659	2017-02-26 17:53:30.130011+00	18098	f	48	887	85
3660	2017-02-26 17:53:30.140688+00	17	f	61	2	86
3661	2017-02-26 17:53:30.15071+00	13	f	70	0	87
3662	2017-02-26 17:53:30.170836+00	18	f	51	1	88
3663	2017-02-26 17:53:30.180951+00	6	f	91	1	89
3664	2017-02-26 17:53:30.200781+00	9	f	62	0	90
3665	2017-02-26 17:53:30.210807+00	0	f	100	1	91
3666	2017-02-26 17:53:30.220695+00	2	f	76	4	92
3667	2017-02-26 17:53:30.23072+00	9	f	64	0	93
3668	2017-02-26 17:53:31.666363+00	0	f	96	2	95
3669	2017-02-26 17:53:31.864951+00	60	f	53	32	96
3670	2017-02-26 17:53:31.875412+00	69	f	52	13	97
3671	2017-02-26 17:53:31.885307+00	46	f	54	8	98
3672	2017-02-26 17:53:31.895193+00	18	f	59	3	99
3673	2017-02-26 18:03:08.338483+00	8165	f	88	380	1
3674	2017-02-26 18:03:08.412021+00	453	f	94	60	3
3675	2017-02-26 18:03:08.428256+00	1982	f	4	59	4
3676	2017-02-26 18:03:08.440374+00	29536	t	2	880	5
3677	2017-02-26 18:03:08.450268+00	364	f	10	19	6
3678	2017-02-26 18:03:08.460153+00	14274	f	5	825	7
3679	2017-02-26 18:03:08.470109+00	138	f	31	2	8
3680	2017-02-26 18:03:08.480076+00	37	f	109	3	9
3681	2017-02-26 18:03:08.490063+00	245	f	13	16	10
3682	2017-02-26 18:03:08.50006+00	30	f	112	2	11
3683	2017-02-26 18:03:10.131645+00	24	f	110	3	13
3684	2017-02-26 18:03:10.237713+00	2603	f	6	95	14
3685	2017-02-26 18:03:10.263018+00	2446	f	92	157	15
3686	2017-02-26 18:03:10.275006+00	101	f	20	12	16
3687	2017-02-26 18:03:10.284952+00	598	f	8	26	17
3688	2017-02-26 18:03:11.804511+00	27	f	98	0	19
3689	2017-02-26 18:03:11.859481+00	35	f	89	11	20
3690	2017-02-26 18:03:11.869231+00	19	f	108	2	21
3691	2017-02-26 18:03:11.879271+00	2977	f	7	228	22
3692	2017-02-26 18:03:13.442686+00	1253	f	9	45	24
3693	2017-02-26 18:03:13.46324+00	17	f	104	1	25
3694	2017-02-26 18:03:13.473322+00	15	f	107	1	26
3695	2017-02-26 18:03:13.483284+00	16	f	105	0	27
3696	2017-02-26 18:03:13.493218+00	156	f	11	7	28
3697	2017-02-26 18:03:13.5032+00	6	f	115	0	29
3698	2017-02-26 18:03:13.513197+00	523	f	12	20	30
3699	2017-02-26 18:03:13.523244+00	385	f	14	21	31
3700	2017-02-26 18:03:16.348563+00	256	f	16	13	34
3701	2017-02-26 18:03:16.428918+00	9	f	99	0	35
3702	2017-02-26 18:03:16.441251+00	9569	f	15	1044	36
3703	2017-02-26 18:03:16.451215+00	55	f	26	5	37
3704	2017-02-26 18:03:18.077835+00	5100	f	18	94	39
3705	2017-02-26 18:03:19.844993+00	1335	f	21	12	41
3706	2017-02-26 18:03:21.436225+00	2773	f	22	148	43
3707	2017-02-26 18:03:23.06989+00	4	f	101	0	45
3708	2017-02-26 18:03:23.138739+00	6	f	102	0	46
3709	2017-02-26 18:03:23.161471+00	31	f	34	1	47
3710	2017-02-26 18:03:23.177181+00	145	f	24	6	48
3711	2017-02-26 18:03:24.726242+00	225	f	23	5	50
3712	2017-02-26 18:03:24.793085+00	4473	f	25	289	51
3713	2017-02-26 18:03:26.836268+00	3	f	120	1	52
3714	2017-02-26 18:03:26.848775+00	2	f	106	0	53
3715	2017-02-26 18:03:28.154127+00	3	f	118	0	55
3716	2017-02-26 18:03:28.222429+00	44	f	35	2	56
3717	2017-02-26 18:03:28.260793+00	6810	f	27	714	57
3718	2017-02-26 18:03:28.272287+00	45	f	30	6	58
3719	2017-02-26 18:03:28.28857+00	83	f	29	9	59
3720	2017-02-26 18:03:28.30203+00	17	f	46	1	60
3721	2017-02-26 18:03:28.318774+00	21838	f	28	1779	61
3722	2017-02-26 18:03:28.332272+00	2	f	114	0	62
3723	2017-02-26 18:03:28.50187+00	84	f	33	10	63
3724	2017-02-26 18:03:28.513059+00	126	f	32	4	64
3725	2017-02-26 18:03:28.529393+00	2	f	111	0	65
3726	2017-02-26 18:03:28.542937+00	5194	f	36	191	66
3727	2017-02-26 18:03:28.552836+00	117	f	38	2	67
3728	2017-02-26 18:03:28.562872+00	651	f	37	27	68
3729	2017-02-26 18:03:28.572793+00	13	f	49	2	69
3730	2017-02-26 18:03:28.582763+00	1465	f	39	39	70
3731	2017-02-26 18:03:28.592796+00	43	f	43	11	71
3732	2017-02-26 18:03:28.60282+00	6407	f	40	105	72
3733	2017-02-26 18:03:28.612775+00	91	f	41	10	73
3734	2017-02-26 18:03:28.622834+00	13	f	56	37	74
3735	2017-02-26 18:03:30.19099+00	3	f	71	1	76
3736	2017-02-26 18:03:31.970103+00	0	f	121	3	77
3737	2017-02-26 18:03:31.982726+00	44	f	44	3	78
3738	2017-02-26 18:03:31.998509+00	2793	f	42	13	79
3739	2017-02-26 18:03:32.012221+00	0	f	116	0	80
3740	2017-02-26 18:03:33.346209+00	8	f	57	3	82
3741	2017-02-26 18:03:33.424388+00	59	f	45	4	83
3742	2017-02-26 18:03:33.446057+00	68	f	47	1	84
3743	2017-02-26 18:03:33.463955+00	5	f	76	4	85
3744	2017-02-26 18:03:33.475858+00	15	f	60	4	86
3745	2017-02-26 18:03:33.491851+00	18102	f	48	887	87
3746	2017-02-26 18:03:33.50582+00	15	f	61	2	88
3747	2017-02-26 18:03:33.521783+00	12	f	70	0	89
3748	2017-02-26 18:03:33.535942+00	20	f	51	1	90
3749	2017-02-26 18:03:33.551958+00	6	f	91	1	91
3750	2017-02-26 18:03:33.565936+00	10	f	62	0	92
3751	2017-02-26 18:03:33.58195+00	0	f	100	1	93
3752	2017-02-26 18:03:33.595984+00	9	f	64	0	94
3753	2017-02-26 18:03:35.012385+00	1	f	96	2	96
3754	2017-02-26 18:03:35.081214+00	57	f	53	33	97
3755	2017-02-26 18:03:35.09656+00	69	f	52	13	98
3756	2017-02-26 18:03:35.112826+00	42	f	54	8	99
3757	2017-02-26 18:13:08.595026+00	8703	f	88	398	1
3758	2017-02-26 18:13:08.685498+00	483	f	94	60	3
3759	2017-02-26 18:13:08.701856+00	2003	f	4	59	4
3760	2017-02-26 18:13:08.718634+00	29534	t	2	880	5
3761	2017-02-26 18:13:08.731826+00	366	f	10	19	6
3762	2017-02-26 18:13:08.748589+00	38	f	112	2	7
3763	2017-02-26 18:13:08.761662+00	43	f	109	3	8
3764	2017-02-26 18:13:08.776923+00	14276	f	5	826	9
3765	2017-02-26 18:13:08.791591+00	139	f	31	2	10
3766	2017-02-26 18:13:08.807055+00	253	f	13	16	11
3767	2017-02-26 18:13:10.398588+00	28	f	110	3	13
3768	2017-02-26 18:13:10.466529+00	2602	f	6	96	14
3769	2017-02-26 18:13:10.481391+00	2448	f	92	157	15
3770	2017-02-26 18:13:10.49612+00	108	f	20	12	16
3771	2017-02-26 18:13:10.511309+00	598	f	8	26	17
3772	2017-02-26 18:13:11.843042+00	27	f	98	0	19
3773	2017-02-26 18:13:11.927454+00	23	f	108	2	20
3774	2017-02-26 18:13:11.940208+00	40	f	89	11	21
3775	2017-02-26 18:13:13.293506+00	2981	f	7	228	23
3776	2017-02-26 18:13:13.361055+00	1260	f	9	45	24
3777	2017-02-26 18:13:13.373647+00	19	f	104	1	25
3778	2017-02-26 18:13:13.38886+00	16	f	107	1	26
3779	2017-02-26 18:13:13.403494+00	17	f	105	0	27
3780	2017-02-26 18:13:13.418775+00	157	f	11	7	28
3781	2017-02-26 18:13:13.433475+00	9	f	115	3	29
3782	2017-02-26 18:13:13.448785+00	522	f	12	20	30
3783	2017-02-26 18:13:13.463508+00	391	f	14	21	31
3784	2017-02-26 18:13:16.189271+00	260	f	16	13	34
3785	2017-02-26 18:13:16.261412+00	7	f	99	0	35
3786	2017-02-26 18:13:16.276365+00	9577	f	15	1044	36
3787	2017-02-26 18:13:16.291021+00	52	f	26	5	37
3788	2017-02-26 18:13:16.306118+00	5	f	120	2	38
3789	2017-02-26 18:13:17.840587+00	5093	f	18	94	40
3790	2017-02-26 18:13:19.409588+00	4	f	102	0	42
3791	2017-02-26 18:13:19.43702+00	1334	f	21	12	43
3792	2017-02-26 18:13:20.858452+00	2778	f	22	148	45
3793	2017-02-26 18:13:22.552886+00	31	f	34	2	47
3794	2017-02-26 18:13:22.625709+00	5	f	101	0	48
3795	2017-02-26 18:13:22.642341+00	144	f	24	7	49
3796	2017-02-26 18:13:22.666999+00	226	f	23	5	50
3797	2017-02-26 18:13:24.209174+00	4469	f	25	289	52
3798	2017-02-26 18:13:26.244908+00	3	f	106	0	54
3799	2017-02-26 18:13:26.346959+00	48	f	35	2	55
3800	2017-02-26 18:13:26.362135+00	6816	f	27	714	56
3801	2017-02-26 18:13:26.376863+00	47	f	30	6	57
3802	2017-02-26 18:13:26.392021+00	75	f	29	9	58
3803	2017-02-26 18:13:26.406578+00	20	f	46	1	59
3804	2017-02-26 18:13:26.421869+00	21839	f	28	1779	60
3805	2017-02-26 18:13:26.436294+00	2	f	114	0	61
3806	2017-02-26 18:13:26.451921+00	82	f	33	10	62
3807	2017-02-26 18:13:26.466307+00	129	f	32	4	63
3808	2017-02-26 18:13:26.481752+00	2	f	111	0	64
3809	2017-02-26 18:13:26.506458+00	5193	f	36	191	65
3810	2017-02-26 18:13:26.521826+00	117	f	38	2	66
3811	2017-02-26 18:13:26.536418+00	655	f	37	27	67
3812	2017-02-26 18:13:26.551957+00	13	f	49	2	68
3813	2017-02-26 18:13:26.566562+00	1466	f	39	39	69
3814	2017-02-26 18:13:26.581941+00	45	f	43	11	70
3815	2017-02-26 18:13:26.596516+00	97	f	41	11	71
3816	2017-02-26 18:13:26.611964+00	6404	f	40	105	72
3817	2017-02-26 18:13:26.626538+00	14	f	56	38	73
3818	2017-02-26 18:13:28.388704+00	5	f	71	1	75
3819	2017-02-26 18:13:28.481+00	0	f	121	3	76
3820	2017-02-26 18:13:28.497494+00	44	f	44	3	77
3821	2017-02-26 18:13:28.512082+00	2	f	118	0	78
3822	2017-02-26 18:13:28.527429+00	2797	f	42	13	79
3823	2017-02-26 18:13:28.541899+00	0	f	116	0	80
3824	2017-02-26 18:13:29.84502+00	9	f	57	3	82
3825	2017-02-26 18:13:29.916165+00	56	f	45	4	83
3826	2017-02-26 18:13:29.931365+00	68	f	47	1	84
3827	2017-02-26 18:13:29.945752+00	4	f	76	4	85
3828	2017-02-26 18:13:29.961186+00	14	f	60	4	86
3829	2017-02-26 18:13:30.116539+00	18098	f	48	887	87
3830	2017-02-26 18:13:30.131822+00	18	f	61	2	88
3831	2017-02-26 18:13:30.146252+00	15	f	70	0	89
3832	2017-02-26 18:13:30.161833+00	17	f	51	1	90
3833	2017-02-26 18:13:30.176156+00	5	f	91	1	91
3834	2017-02-26 18:13:31.656095+00	6	f	62	0	93
3835	2017-02-26 18:13:31.759439+00	0	f	100	1	94
3836	2017-02-26 18:13:31.776044+00	9	f	64	0	95
3837	2017-02-26 18:13:31.79049+00	0	f	96	2	96
3838	2017-02-26 18:13:31.819029+00	57	f	53	33	97
3839	2017-02-26 18:13:31.830383+00	71	f	52	13	98
3840	2017-02-26 18:13:31.845942+00	47	f	54	8	99
3841	2017-02-26 18:23:09.001299+00	9184	f	88	429	1
3842	2017-02-26 18:23:09.080799+00	504	f	94	62	3
3843	2017-02-26 18:23:09.096836+00	2011	f	4	59	4
3844	2017-02-26 18:23:09.113932+00	29543	t	2	878	5
3845	2017-02-26 18:23:09.126628+00	48	f	112	2	6
3846	2017-02-26 18:23:09.136545+00	376	f	10	19	7
3847	2017-02-26 18:23:09.146561+00	43	f	109	3	8
3848	2017-02-26 18:23:09.156548+00	14280	f	5	826	9
3849	2017-02-26 18:23:09.166605+00	145	f	31	2	10
3850	2017-02-26 18:23:09.176606+00	256	f	13	17	11
3851	2017-02-26 18:23:09.18662+00	34	f	110	3	12
3852	2017-02-26 18:23:10.820968+00	2596	f	6	96	14
3853	2017-02-26 18:23:10.963039+00	2444	f	92	157	15
3854	2017-02-26 18:23:10.980239+00	107	f	20	12	16
3855	2017-02-26 18:23:10.991893+00	23	f	108	2	17
3856	2017-02-26 18:23:11.00188+00	606	f	8	26	18
3857	2017-02-26 18:23:12.432487+00	39	f	89	11	20
3858	2017-02-26 18:23:12.505965+00	27	f	98	0	21
3859	2017-02-26 18:23:13.838458+00	2985	f	7	228	23
3860	2017-02-26 18:23:13.889727+00	1265	f	9	45	24
3861	2017-02-26 18:23:13.906139+00	17	f	107	1	25
3862	2017-02-26 18:23:13.919409+00	21	f	104	1	26
3863	2017-02-26 18:23:13.929273+00	15	f	105	2	27
3864	2017-02-26 18:23:13.949536+00	157	f	11	7	28
3865	2017-02-26 18:23:13.959058+00	9	f	115	3	29
3866	2017-02-26 18:23:15.417332+00	520	f	12	20	31
3867	2017-02-26 18:23:15.490527+00	391	f	14	21	32
3868	2017-02-26 18:23:16.850824+00	262	f	16	13	34
3869	2017-02-26 18:23:16.927564+00	9	f	99	0	35
3870	2017-02-26 18:23:16.943903+00	51	f	26	5	36
3871	2017-02-26 18:23:16.957327+00	9580	f	15	1044	37
3872	2017-02-26 18:23:16.973764+00	6	f	102	0	38
3873	2017-02-26 18:23:20.218489+00	5100	f	18	94	41
3874	2017-02-26 18:23:22.042061+00	1338	f	21	12	43
3875	2017-02-26 18:23:22.120995+00	2777	f	22	148	44
3876	2017-02-26 18:23:23.623228+00	30	f	34	2	46
3877	2017-02-26 18:23:23.695085+00	4	f	101	0	47
3878	2017-02-26 18:23:23.7113+00	148	f	24	7	48
3879	2017-02-26 18:23:23.72494+00	228	f	23	5	49
3880	2017-02-26 18:23:25.524665+00	4468	f	25	289	51
3881	2017-02-26 18:23:25.676429+00	1	f	121	3	52
3882	2017-02-26 18:23:27.018952+00	1	f	106	0	54
3883	2017-02-26 18:23:27.124308+00	47	f	35	2	55
3884	2017-02-26 18:23:27.144063+00	6818	f	27	714	56
3885	2017-02-26 18:23:27.159775+00	47	f	30	6	57
3886	2017-02-26 18:23:27.173894+00	79	f	29	9	58
3887	2017-02-26 18:23:27.189669+00	20	f	46	1	59
3888	2017-02-26 18:23:27.20388+00	21843	f	28	1779	60
3889	2017-02-26 18:23:27.219646+00	81	f	33	10	61
3890	2017-02-26 18:23:27.233765+00	123	f	32	4	62
3891	2017-02-26 18:23:27.249726+00	5197	f	36	191	63
3892	2017-02-26 18:23:27.263852+00	117	f	38	2	64
3893	2017-02-26 18:23:27.431022+00	649	f	37	27	65
3894	2017-02-26 18:23:27.444718+00	15	f	49	2	66
3895	2017-02-26 18:23:27.464672+00	1457	f	39	39	67
3896	2017-02-26 18:23:27.480485+00	47	f	43	11	68
3897	2017-02-26 18:23:27.494606+00	95	f	41	11	69
3898	2017-02-26 18:23:27.514628+00	6400	f	40	105	70
3899	2017-02-26 18:23:27.536131+00	12	f	56	38	71
3900	2017-02-26 18:23:27.551658+00	2	f	120	4	72
3901	2017-02-26 18:23:29.167408+00	4	f	71	1	74
3902	2017-02-26 18:23:29.256626+00	44	f	44	3	75
3903	2017-02-26 18:23:29.26959+00	0	f	117	1	76
3904	2017-02-26 18:23:29.28531+00	0	f	118	0	77
3905	2017-02-26 18:23:29.299475+00	2796	f	42	13	78
3906	2017-02-26 18:23:29.315186+00	0	f	116	0	79
3907	2017-02-26 18:23:30.611673+00	58	f	45	4	81
3908	2017-02-26 18:23:30.753444+00	7	f	57	3	82
3909	2017-02-26 18:23:30.768881+00	1	f	114	0	83
3910	2017-02-26 18:23:30.7832+00	69	f	47	1	84
3911	2017-02-26 18:23:30.798826+00	3	f	76	4	85
3912	2017-02-26 18:23:30.813163+00	14	f	60	4	86
3913	2017-02-26 18:23:30.833075+00	18100	f	48	887	87
3914	2017-02-26 18:23:30.8488+00	17	f	61	2	88
3915	2017-02-26 18:23:30.863227+00	14	f	70	0	89
3916	2017-02-26 18:23:30.883352+00	17	f	51	1	90
3917	2017-02-26 18:23:30.899044+00	8	f	91	1	91
3918	2017-02-26 18:23:32.351972+00	8	f	62	0	93
3919	2017-02-26 18:23:32.435012+00	2	f	100	1	94
3920	2017-02-26 18:23:32.447863+00	9	f	64	0	95
3921	2017-02-26 18:23:32.464481+00	0	f	96	2	96
3922	2017-02-26 18:23:32.477746+00	59	f	53	33	97
3923	2017-02-26 18:23:32.493289+00	68	f	52	13	98
3924	2017-02-26 18:23:32.507987+00	44	f	54	8	99
3925	2017-02-26 18:33:08.940423+00	9618	f	88	436	1
3926	2017-02-26 18:33:09.1186+00	540	f	94	64	2
3927	2017-02-26 18:33:09.144107+00	2035	f	4	59	4
3928	2017-02-26 18:33:09.168894+00	29547	t	2	878	5
3929	2017-02-26 18:33:09.184562+00	54	f	112	2	6
3930	2017-02-26 18:33:09.211069+00	50	f	109	3	7
3931	2017-02-26 18:33:09.224651+00	379	f	10	19	8
3932	2017-02-26 18:33:09.238904+00	39	f	110	3	9
3933	2017-02-26 18:33:09.261785+00	150	f	31	2	10
3934	2017-02-26 18:33:09.298097+00	14288	f	5	826	11
3935	2017-02-26 18:33:09.311893+00	260	f	13	17	12
3936	2017-02-26 18:33:11.233319+00	29	f	108	3	14
3937	2017-02-26 18:33:11.304735+00	2602	f	6	96	15
3938	2017-02-26 18:33:11.320512+00	2446	f	92	157	16
3939	2017-02-26 18:33:11.336659+00	112	f	20	12	17
3940	2017-02-26 18:33:11.356664+00	33	f	98	0	18
3941	2017-02-26 18:33:11.370362+00	43	f	89	11	19
3942	2017-02-26 18:33:11.386598+00	604	f	8	26	20
3943	2017-02-26 18:33:11.400227+00	26	f	104	2	21
3944	2017-02-26 18:33:14.311946+00	21	f	105	2	24
3945	2017-02-26 18:33:14.507483+00	2985	f	7	228	25
3946	2017-02-26 18:33:14.522607+00	19	f	107	1	26
3947	2017-02-26 18:33:14.551618+00	1264	f	9	45	27
3948	2017-02-26 18:33:14.595289+00	164	f	11	7	28
3949	2017-02-26 18:33:14.609149+00	9	f	115	3	29
3950	2017-02-26 18:33:16.083328+00	524	f	12	20	31
3951	2017-02-26 18:33:16.198486+00	397	f	14	21	32
3952	2017-02-26 18:33:17.556755+00	263	f	16	13	34
3953	2017-02-26 18:33:17.630752+00	9	f	99	0	35
3954	2017-02-26 18:33:17.647201+00	53	f	26	5	36
3955	2017-02-26 18:33:17.662892+00	9575	f	15	1044	37
3956	2017-02-26 18:33:17.676869+00	7	f	102	0	38
3957	2017-02-26 18:33:22.363781+00	5104	f	18	94	42
3958	2017-02-26 18:33:22.43258+00	1333	f	21	12	43
3959	2017-02-26 18:33:22.444817+00	2773	f	22	148	44
3960	2017-02-26 18:33:24.070219+00	33	f	34	2	46
3961	2017-02-26 18:33:24.137216+00	5	f	101	0	47
3962	2017-02-26 18:33:24.153928+00	3	f	114	0	48
3963	2017-02-26 18:33:24.16931+00	144	f	24	7	49
3964	2017-02-26 18:33:24.183622+00	228	f	23	5	50
3965	2017-02-26 18:33:25.80254+00	4474	f	25	289	52
3966	2017-02-26 18:33:25.889093+00	2	f	121	4	53
3967	2017-02-26 18:33:27.213219+00	2	f	106	0	55
3968	2017-02-26 18:33:27.285132+00	48	f	35	2	56
3969	2017-02-26 18:33:27.297259+00	6808	f	27	714	57
3970	2017-02-26 18:33:27.311936+00	46	f	30	6	58
3971	2017-02-26 18:33:27.337216+00	78	f	29	9	59
3972	2017-02-26 18:33:27.351906+00	18	f	46	1	60
3973	2017-02-26 18:33:27.367043+00	21843	f	28	1781	61
3974	2017-02-26 18:33:27.381809+00	79	f	33	10	62
3975	2017-02-26 18:33:27.397077+00	128	f	32	4	63
3976	2017-02-26 18:33:27.411908+00	5193	f	36	191	64
3977	2017-02-26 18:33:27.427192+00	117	f	38	2	65
3978	2017-02-26 18:33:27.442033+00	656	f	37	27	66
3979	2017-02-26 18:33:30.012198+00	1	f	122	0	67
3980	2017-02-26 18:33:30.024572+00	16	f	49	2	68
3981	2017-02-26 18:33:33.197758+00	2	f	123	0	70
3982	2017-02-26 18:33:33.212528+00	1466	f	39	39	71
3983	2017-02-26 18:33:33.227528+00	48	f	43	11	72
3984	2017-02-26 18:33:33.242312+00	99	f	41	11	73
3985	2017-02-26 18:33:33.257624+00	6404	f	40	105	74
3986	2017-02-26 18:33:33.272319+00	13	f	56	38	75
3987	2017-02-26 18:33:33.287578+00	1	f	120	5	76
3988	2017-02-26 18:33:34.849043+00	3	f	71	1	78
3989	2017-02-26 18:33:34.914558+00	45	f	44	3	79
3990	2017-02-26 18:33:34.926791+00	0	f	117	1	80
3991	2017-02-26 18:33:34.94209+00	1	f	118	0	81
3992	2017-02-26 18:33:34.957179+00	2799	f	42	13	82
3993	2017-02-26 18:33:34.971995+00	0	f	116	2	83
3994	2017-02-26 18:33:36.285874+00	55	f	45	4	85
3995	2017-02-26 18:33:36.386288+00	6	f	57	3	86
3996	2017-02-26 18:33:36.416296+00	68	f	47	1	87
3997	2017-02-26 18:33:36.430876+00	2	f	76	4	88
3998	2017-02-26 18:33:36.446163+00	16	f	60	4	89
3999	2017-02-26 18:33:36.460688+00	18101	f	48	887	90
4000	2017-02-26 18:33:36.476202+00	16	f	61	2	91
4001	2017-02-26 18:33:36.516172+00	13	f	70	0	92
4002	2017-02-26 18:33:36.530986+00	17	f	51	1	93
4003	2017-02-26 18:33:36.545995+00	4	f	91	1	94
4004	2017-02-26 18:33:37.992366+00	7	f	62	0	96
4005	2017-02-26 18:33:38.014656+00	0	f	100	1	97
4006	2017-02-26 18:33:38.030258+00	9	f	64	0	98
4007	2017-02-26 18:33:38.044789+00	0	f	96	2	99
4008	2017-02-26 18:43:09.526462+00	10087	f	88	456	1
4009	2017-02-26 18:43:09.65904+00	578	f	94	66	2
4010	2017-02-26 18:43:09.686669+00	2057	f	4	60	4
4011	2017-02-26 18:43:09.723879+00	29549	t	2	878	5
4012	2017-02-26 18:43:09.738729+00	68	f	112	3	6
4013	2017-02-26 18:43:09.758364+00	56	f	109	3	7
4014	2017-02-26 18:43:09.769832+00	44	f	110	4	8
4015	2017-02-26 18:43:09.785439+00	381	f	10	20	9
4016	2017-02-26 18:43:09.799735+00	153	f	31	2	10
4017	2017-02-26 18:43:09.815094+00	14286	f	5	828	11
4018	2017-02-26 18:43:09.829793+00	266	f	13	18	12
4019	2017-02-26 18:43:11.544092+00	26	f	108	3	14
4020	2017-02-26 18:43:11.600467+00	2612	f	6	96	15
4021	2017-02-26 18:43:11.614713+00	112	f	20	12	16
4022	2017-02-26 18:43:11.629829+00	2456	f	92	157	17
4023	2017-02-26 18:43:11.64492+00	34	f	98	0	18
4024	2017-02-26 18:43:11.660099+00	27	f	104	2	19
4025	2017-02-26 18:43:11.674562+00	43	f	89	11	20
4026	2017-02-26 18:43:11.68975+00	612	f	8	26	21
4027	2017-02-26 18:43:14.51104+00	22	f	105	2	24
4028	2017-02-26 18:43:14.532126+00	2982	f	7	228	25
4029	2017-02-26 18:43:14.547676+00	19	f	107	1	26
4030	2017-02-26 18:43:14.562886+00	1262	f	9	45	27
4031	2017-02-26 18:43:14.57738+00	14	f	115	3	28
4032	2017-02-26 18:43:14.59227+00	164	f	11	7	29
4033	2017-02-26 18:43:16.051538+00	532	f	12	20	31
4034	2017-02-26 18:43:16.10615+00	395	f	14	21	32
4035	2017-02-26 18:43:17.497743+00	262	f	16	13	34
4036	2017-02-26 18:43:17.580154+00	9	f	99	0	35
4037	2017-02-26 18:43:17.599872+00	50	f	26	5	36
4038	2017-02-26 18:43:17.615581+00	9582	f	15	1044	37
4039	2017-02-26 18:43:19.484901+00	7	f	102	0	39
4040	2017-02-26 18:43:22.937196+00	4	f	114	0	42
4041	2017-02-26 18:43:23.024182+00	5107	f	18	94	43
4042	2017-02-26 18:43:23.043707+00	4	f	120	5	44
4043	2017-02-26 18:43:23.059121+00	1335	f	21	12	45
4044	2017-02-26 18:43:23.07357+00	2777	f	22	148	46
4045	2017-02-26 18:43:24.644323+00	31	f	34	2	48
4046	2017-02-26 18:43:24.717925+00	3	f	101	0	49
4047	2017-02-26 18:43:24.732924+00	146	f	24	7	50
4048	2017-02-26 18:43:24.747408+00	227	f	23	5	51
4049	2017-02-26 18:43:27.700492+00	4475	f	25	289	54
4050	2017-02-26 18:43:29.098981+00	2	f	106	0	56
4051	2017-02-26 18:43:29.160136+00	51	f	35	2	57
4052	2017-02-26 18:43:29.231168+00	6817	f	27	715	58
4053	2017-02-26 18:43:29.265367+00	45	f	30	6	59
4054	2017-02-26 18:43:29.305469+00	79	f	29	9	60
4055	2017-02-26 18:43:29.320074+00	18	f	46	1	61
4056	2017-02-26 18:43:29.335282+00	21844	f	28	1781	62
4057	2017-02-26 18:43:29.349863+00	81	f	33	10	63
4058	2017-02-26 18:43:29.364837+00	126	f	32	4	64
4059	2017-02-26 18:43:29.379795+00	5198	f	36	191	65
4060	2017-02-26 18:43:29.394728+00	112	f	38	2	66
4061	2017-02-26 18:43:29.409723+00	2	f	100	1	67
4062	2017-02-26 18:43:29.424725+00	648	f	37	27	68
4063	2017-02-26 18:43:29.439948+00	1	f	122	0	69
4064	2017-02-26 18:43:29.455134+00	15	f	49	2	70
4065	2017-02-26 18:43:29.470033+00	0	f	123	2	71
4066	2017-02-26 18:43:29.484851+00	1467	f	39	39	72
4067	2017-02-26 18:43:29.500282+00	47	f	43	11	73
4068	2017-02-26 18:43:29.515172+00	93	f	41	11	74
4069	2017-02-26 18:43:29.529958+00	6400	f	40	105	75
4070	2017-02-26 18:43:29.544922+00	12	f	56	38	76
4071	2017-02-26 18:43:31.081533+00	4	f	71	1	78
4072	2017-02-26 18:43:31.155741+00	0	f	121	4	79
4073	2017-02-26 18:43:31.169689+00	41	f	44	3	80
4074	2017-02-26 18:43:31.184946+00	0	f	118	0	81
4075	2017-02-26 18:43:31.199626+00	2795	f	42	13	82
4076	2017-02-26 18:43:31.214875+00	0	f	116	2	83
4077	2017-02-26 18:43:32.369286+00	54	f	45	4	85
4078	2017-02-26 18:43:32.443338+00	9	f	57	3	86
4079	2017-02-26 18:43:32.458546+00	66	f	47	1	87
4080	2017-02-26 18:43:32.473129+00	8	f	91	1	88
4081	2017-02-26 18:43:32.488309+00	4	f	76	4	89
4082	2017-02-26 18:43:32.502807+00	13	f	60	4	90
4083	2017-02-26 18:43:32.518539+00	18100	f	48	887	91
4084	2017-02-26 18:43:32.532885+00	15	f	61	2	92
4085	2017-02-26 18:43:32.548341+00	11	f	70	0	93
4086	2017-02-26 18:43:32.563305+00	18	f	51	1	94
4087	2017-02-26 18:43:33.972273+00	6	f	62	0	96
4088	2017-02-26 18:43:34.031987+00	8	f	64	0	97
4089	2017-02-26 18:43:34.047167+00	1	f	96	2	98
4090	2017-02-26 18:43:34.062526+00	61	f	53	33	99
4091	2017-02-26 18:53:09.684984+00	10497	f	88	476	1
4092	2017-02-26 18:53:09.75318+00	642	f	94	75	2
4093	2017-02-26 18:53:09.773923+00	2065	f	4	59	4
4094	2017-02-26 18:53:09.800808+00	78	f	112	3	5
4095	2017-02-26 18:53:09.812639+00	29549	t	2	878	6
4096	2017-02-26 18:53:09.823194+00	65	f	109	3	7
4097	2017-02-26 18:53:09.833187+00	46	f	110	4	8
4098	2017-02-26 18:53:09.842962+00	382	f	10	20	9
4099	2017-02-26 18:53:09.852684+00	163	f	31	2	10
4100	2017-02-26 18:53:09.872772+00	274	f	13	18	11
4101	2017-02-26 18:53:09.882878+00	14287	f	5	830	12
4102	2017-02-26 18:53:11.505766+00	30	f	108	3	14
4103	2017-02-26 18:53:11.706708+00	2608	f	6	96	15
4104	2017-02-26 18:53:11.727713+00	31	f	104	2	16
4105	2017-02-26 18:53:11.747985+00	29	f	105	2	17
4106	2017-02-26 18:53:11.757607+00	115	f	20	12	18
4107	2017-02-26 18:53:11.767649+00	29	f	98	0	19
4108	2017-02-26 18:53:11.77759+00	2457	f	92	157	20
4109	2017-02-26 18:53:13.153343+00	45	f	89	12	22
4110	2017-02-26 18:53:13.475466+00	612	f	8	26	23
4111	2017-02-26 18:53:14.917283+00	22	f	107	1	25
4112	2017-02-26 18:53:14.976666+00	15	f	115	3	26
4113	2017-02-26 18:53:14.986178+00	2987	f	7	229	27
4114	2017-02-26 18:53:14.996403+00	1258	f	9	45	28
4115	2017-02-26 18:53:15.005936+00	172	f	11	7	29
4116	2017-02-26 18:53:15.01602+00	7	f	120	5	30
4117	2017-02-26 18:53:16.494631+00	526	f	12	20	32
4118	2017-02-26 18:53:16.581034+00	393	f	14	21	33
4119	2017-02-26 18:53:18.880524+00	269	f	16	13	35
4120	2017-02-26 18:53:18.946744+00	57	f	26	5	36
4121	2017-02-26 18:53:18.956333+00	9580	f	15	1044	37
4122	2017-02-26 18:53:18.966222+00	6	f	99	0	38
4123	2017-02-26 18:53:21.0535+00	6	f	102	0	40
4124	2017-02-26 18:53:24.120198+00	4	f	114	0	43
4125	2017-02-26 18:53:24.189833+00	5104	f	18	94	44
4126	2017-02-26 18:53:24.199593+00	1334	f	21	12	45
4127	2017-02-26 18:53:24.209482+00	2777	f	22	148	46
4128	2017-02-26 18:53:25.741872+00	33	f	34	2	48
4129	2017-02-26 18:53:25.814231+00	4	f	101	0	49
4130	2017-02-26 18:53:25.823489+00	145	f	24	7	50
4131	2017-02-26 18:53:25.833326+00	229	f	23	5	51
4132	2017-02-26 18:53:28.616893+00	4468	f	25	289	54
4133	2017-02-26 18:53:30.017591+00	3	f	106	0	56
4134	2017-02-26 18:53:30.074705+00	45	f	35	2	57
4135	2017-02-26 18:53:30.084548+00	6821	f	27	715	58
4136	2017-02-26 18:53:30.094279+00	42	f	30	6	59
4137	2017-02-26 18:53:30.114375+00	77	f	29	9	60
4138	2017-02-26 18:53:30.134046+00	18	f	46	1	61
4139	2017-02-26 18:53:30.144129+00	21839	f	28	1781	62
4140	2017-02-26 18:53:30.154114+00	84	f	33	10	63
4141	2017-02-26 18:53:30.164695+00	124	f	32	4	64
4142	2017-02-26 18:53:30.174012+00	5199	f	36	191	65
4143	2017-02-26 18:53:30.184091+00	115	f	38	2	66
4144	2017-02-26 18:53:30.19414+00	3	f	100	1	67
4145	2017-02-26 18:53:32.458754+00	1	f	124	0	68
4146	2017-02-26 18:53:34.193348+00	0	f	125	0	69
4147	2017-02-26 18:53:34.205674+00	646	f	37	27	70
4148	2017-02-26 18:53:37.281465+00	1	f	126	0	71
4149	2017-02-26 18:53:37.293871+00	16	f	49	2	72
4150	2017-02-26 18:53:37.313609+00	1	f	123	2	73
4151	2017-02-26 18:53:37.323538+00	1460	f	39	39	74
4152	2017-02-26 18:53:37.333794+00	43	f	43	11	75
4153	2017-02-26 18:53:37.343496+00	95	f	41	11	76
4154	2017-02-26 18:53:37.353432+00	6409	f	40	105	77
4155	2017-02-26 18:53:37.363507+00	13	f	56	38	78
4156	2017-02-26 18:53:39.019023+00	3	f	71	1	80
4157	2017-02-26 18:53:39.098891+00	0	f	121	4	81
4158	2017-02-26 18:53:39.108755+00	45	f	44	3	82
4159	2017-02-26 18:53:39.119105+00	0	f	118	0	83
4160	2017-02-26 18:53:39.147895+00	2791	f	42	13	84
4161	2017-02-26 18:53:39.168537+00	1	f	116	2	85
4162	2017-02-26 18:53:40.468777+00	58	f	45	4	87
4163	2017-02-26 18:53:40.641684+00	8	f	57	3	88
4164	2017-02-26 18:53:40.6709+00	68	f	47	1	89
4165	2017-02-26 18:53:40.682699+00	7	f	91	1	90
4166	2017-02-26 18:53:40.692968+00	4	f	76	4	91
4167	2017-02-26 18:53:40.702489+00	15	f	60	4	92
4168	2017-02-26 18:53:40.712483+00	18102	f	48	887	93
4169	2017-02-26 18:53:40.722523+00	17	f	61	2	94
4170	2017-02-26 18:53:40.732803+00	15	f	70	0	95
4171	2017-02-26 18:53:40.742588+00	19	f	51	1	96
4172	2017-02-26 18:53:42.491804+00	8	f	62	0	98
4173	2017-02-26 18:53:42.54792+00	10	f	64	0	99
4174	2017-02-26 19:03:10.056084+00	10884	f	88	485	1
4175	2017-02-26 19:03:10.25002+00	668	f	94	78	2
4176	2017-02-26 19:03:10.269876+00	95	f	112	3	4
4177	2017-02-26 19:03:10.284973+00	2083	f	4	59	5
4178	2017-02-26 19:03:10.299833+00	29550	t	2	877	6
4179	2017-02-26 19:03:10.314666+00	69	f	109	3	7
4180	2017-02-26 19:03:10.329199+00	54	f	110	5	8
4181	2017-02-26 19:03:10.344544+00	391	f	10	21	9
4182	2017-02-26 19:03:10.359938+00	161	f	31	3	10
4183	2017-02-26 19:03:10.37449+00	276	f	13	21	11
4184	2017-02-26 19:03:10.389309+00	14290	f	5	831	12
4185	2017-02-26 19:03:10.404594+00	31	f	108	3	13
4186	2017-02-26 19:03:12.096605+00	33	f	104	2	15
4187	2017-02-26 19:03:12.173752+00	2608	f	6	96	16
4188	2017-02-26 19:03:12.194519+00	28	f	105	2	17
4189	2017-02-26 19:03:13.560721+00	120	f	20	12	19
4190	2017-02-26 19:03:13.634158+00	2454	f	92	157	20
4191	2017-02-26 19:03:13.648294+00	34	f	98	0	21
4192	2017-02-26 19:03:13.663836+00	18	f	115	3	22
4193	2017-02-26 19:03:13.678027+00	616	f	8	26	23
4194	2017-02-26 19:03:13.69363+00	41	f	89	12	24
4195	2017-02-26 19:03:15.050673+00	22	f	107	1	26
4196	2017-02-26 19:03:15.112262+00	2978	f	7	229	27
4197	2017-02-26 19:03:15.127756+00	1263	f	9	45	28
4198	2017-02-26 19:03:15.141832+00	9	f	120	5	29
4199	2017-02-26 19:03:15.157565+00	168	f	11	7	30
4200	2017-02-26 19:03:15.171841+00	527	f	12	20	31
4201	2017-02-26 19:03:15.187496+00	397	f	14	21	32
4202	2017-02-26 19:03:18.074559+00	266	f	16	13	35
4203	2017-02-26 19:03:19.506032+00	56	f	26	5	37
4204	2017-02-26 19:03:19.581066+00	9584	f	15	1044	38
4205	2017-02-26 19:03:19.593163+00	7	f	99	0	39
4206	2017-02-26 19:03:21.233104+00	4	f	102	0	41
4207	2017-02-26 19:03:24.455694+00	4	f	114	0	44
4208	2017-02-26 19:03:24.592893+00	5099	f	18	94	45
4209	2017-02-26 19:03:24.60632+00	1339	f	21	12	46
4210	2017-02-26 19:03:24.622567+00	2777	f	22	148	47
4211	2017-02-26 19:03:24.635727+00	33	f	34	2	48
4212	2017-02-26 19:03:26.211873+00	4	f	101	0	50
4213	2017-02-26 19:03:26.29082+00	147	f	24	7	51
4214	2017-02-26 19:03:26.368387+00	3	f	124	0	52
4215	2017-02-26 19:03:27.93247+00	229	f	23	5	54
4216	2017-02-26 19:03:28.002422+00	3	f	123	2	55
4217	2017-02-26 19:03:28.014673+00	4476	f	25	289	56
4218	2017-02-26 19:03:29.214426+00	2	f	106	0	58
4219	2017-02-26 19:03:29.297566+00	47	f	35	2	59
4220	2017-02-26 19:03:29.317664+00	46	f	30	6	60
4221	2017-02-26 19:03:29.327642+00	6821	f	27	715	61
4222	2017-02-26 19:03:29.337511+00	22	f	46	1	62
4223	2017-02-26 19:03:29.347602+00	80	f	29	9	63
4224	2017-02-26 19:03:29.357594+00	21844	f	28	1781	64
4225	2017-02-26 19:03:29.367706+00	86	f	33	10	65
4226	2017-02-26 19:03:29.377537+00	125	f	32	4	66
4227	2017-02-26 19:03:29.387578+00	5193	f	36	192	67
4228	2017-02-26 19:03:29.397648+00	113	f	38	2	68
4229	2017-02-26 19:03:29.407637+00	1	f	100	1	69
4230	2017-02-26 19:03:29.417547+00	1	f	125	2	70
4231	2017-02-26 19:03:29.427616+00	654	f	37	27	71
4232	2017-02-26 19:03:29.448517+00	2	f	126	0	72
4233	2017-02-26 19:03:29.458484+00	16	f	49	2	73
4234	2017-02-26 19:03:29.468466+00	1466	f	39	39	74
4235	2017-02-26 19:03:29.47856+00	46	f	43	11	75
4236	2017-02-26 19:03:29.498298+00	96	f	41	11	76
4237	2017-02-26 19:03:29.508264+00	6406	f	40	105	77
4238	2017-02-26 19:03:29.518194+00	15	f	56	38	78
4239	2017-02-26 19:03:31.158224+00	2	f	71	1	80
4240	2017-02-26 19:03:31.233292+00	0	f	121	4	81
4241	2017-02-26 19:03:31.269101+00	41	f	44	3	82
4242	2017-02-26 19:03:31.29344+00	0	f	118	0	83
4243	2017-02-26 19:03:31.350982+00	2789	f	42	13	84
4244	2017-02-26 19:03:31.362973+00	1	f	116	2	85
4245	2017-02-26 19:03:32.673883+00	57	f	45	4	87
4246	2017-02-26 19:03:32.745174+00	7	f	57	3	88
4247	2017-02-26 19:03:32.756966+00	70	f	47	1	89
4248	2017-02-26 19:03:32.766829+00	7	f	91	1	90
4249	2017-02-26 19:03:32.776682+00	4	f	76	4	91
4250	2017-02-26 19:03:32.786634+00	15	f	70	0	92
4251	2017-02-26 19:03:32.796646+00	16	f	60	4	93
4252	2017-02-26 19:03:32.80674+00	18096	f	48	887	94
4253	2017-02-26 19:03:32.816651+00	17	f	61	2	95
4254	2017-02-26 19:03:32.826694+00	18	f	51	1	96
4255	2017-02-26 19:03:34.254784+00	10	f	62	0	98
4256	2017-02-26 19:03:34.32871+00	10	f	64	0	99
4257	2017-02-26 19:13:10.089962+00	11303	f	88	509	1
4258	2017-02-26 19:13:10.192379+00	718	f	94	81	2
4259	2017-02-26 19:13:10.212255+00	106	f	112	3	4
4260	2017-02-26 19:13:10.241847+00	2090	f	4	59	5
4261	2017-02-26 19:13:10.256626+00	79	f	109	3	6
4262	2017-02-26 19:13:10.271875+00	29557	t	2	871	7
4263	2017-02-26 19:13:10.286589+00	61	f	110	5	8
4264	2017-02-26 19:13:10.301889+00	392	f	10	22	9
4265	2017-02-26 19:13:10.316671+00	169	f	31	3	10
4266	2017-02-26 19:13:10.332024+00	290	f	13	21	11
4267	2017-02-26 19:13:10.346747+00	14294	f	5	832	12
4268	2017-02-26 19:13:10.361969+00	38	f	108	3	13
4269	2017-02-26 19:13:12.143907+00	33	f	105	2	15
4270	2017-02-26 19:13:12.207382+00	31	f	104	2	16
4271	2017-02-26 19:13:13.70984+00	2610	f	6	96	18
4272	2017-02-26 19:13:13.818042+00	119	f	20	12	19
4273	2017-02-26 19:13:13.841636+00	34	f	98	0	20
4274	2017-02-26 19:13:13.856329+00	19	f	115	3	21
4275	2017-02-26 19:13:13.871525+00	2458	f	92	157	22
4276	2017-02-26 19:13:13.886279+00	44	f	89	12	23
4277	2017-02-26 19:13:13.901342+00	620	f	8	26	24
4278	2017-02-26 19:13:15.240506+00	22	f	107	1	26
4279	2017-02-26 19:13:15.320119+00	2983	f	7	229	27
4280	2017-02-26 19:13:15.360502+00	1259	f	9	45	28
4281	2017-02-26 19:13:15.375559+00	169	f	11	7	29
4282	2017-02-26 19:13:15.390416+00	8	f	120	5	30
4283	2017-02-26 19:13:18.332619+00	527	f	12	20	33
4284	2017-02-26 19:13:18.403491+00	393	f	14	21	34
4285	2017-02-26 19:13:19.722432+00	271	f	16	13	36
4286	2017-02-26 19:13:19.791446+00	55	f	26	5	37
4287	2017-02-26 19:13:19.806671+00	5	f	114	0	38
4288	2017-02-26 19:13:19.821537+00	9586	f	15	1044	39
4289	2017-02-26 19:13:19.836443+00	7	f	99	0	40
4290	2017-02-26 19:13:21.390178+00	4	f	102	0	42
4291	2017-02-26 19:13:23.303401+00	1	f	127	0	43
4292	2017-02-26 19:13:24.822396+00	4	f	125	2	45
4293	2017-02-26 19:13:26.456635+00	5104	f	18	94	47
4294	2017-02-26 19:13:26.53385+00	4	f	101	0	48
4295	2017-02-26 19:13:26.548585+00	1338	f	21	12	49
4296	2017-02-26 19:13:26.563605+00	2777	f	22	148	50
4297	2017-02-26 19:13:26.578107+00	37	f	34	2	51
4298	2017-02-26 19:13:29.670046+00	151	f	24	7	54
4299	2017-02-26 19:13:29.726496+00	230	f	23	5	55
4300	2017-02-26 19:13:29.741719+00	3	f	123	2	56
4301	2017-02-26 19:13:29.756633+00	4473	f	25	289	57
4302	2017-02-26 19:13:31.06449+00	2	f	106	0	59
4303	2017-02-26 19:13:31.210449+00	44	f	35	2	60
4304	2017-02-26 19:13:31.230254+00	47	f	30	6	61
4305	2017-02-26 19:13:31.255699+00	6820	f	27	715	62
4306	2017-02-26 19:13:31.270146+00	20	f	46	1	63
4307	2017-02-26 19:13:31.285576+00	82	f	29	9	64
4308	2017-02-26 19:13:31.300096+00	21843	f	28	1781	65
4309	2017-02-26 19:13:31.315475+00	86	f	33	10	66
4310	2017-02-26 19:13:31.330055+00	126	f	32	4	67
4311	2017-02-26 19:13:31.345515+00	5200	f	36	192	68
4312	2017-02-26 19:13:32.54222+00	117	f	38	2	70
4313	2017-02-26 19:13:32.6039+00	2	f	100	1	71
4314	2017-02-26 19:13:32.619172+00	648	f	37	27	72
4315	2017-02-26 19:13:32.633546+00	2	f	126	0	73
4316	2017-02-26 19:13:32.669069+00	15	f	49	2	74
4317	2017-02-26 19:13:32.683601+00	1461	f	39	39	75
4318	2017-02-26 19:13:32.699686+00	43	f	43	11	76
4319	2017-02-26 19:13:32.719489+00	97	f	41	11	77
4320	2017-02-26 19:13:32.733641+00	6409	f	40	105	78
4321	2017-02-26 19:13:32.74986+00	12	f	56	38	79
4322	2017-02-26 19:13:34.28445+00	2	f	71	1	81
4323	2017-02-26 19:13:34.379059+00	0	f	121	4	82
4324	2017-02-26 19:13:34.393763+00	43	f	44	3	83
4325	2017-02-26 19:13:34.408551+00	0	f	118	0	84
4326	2017-02-26 19:13:34.423566+00	2796	f	42	13	85
4327	2017-02-26 19:13:34.437996+00	0	f	116	2	86
4328	2017-02-26 19:13:35.713085+00	56	f	45	4	88
4329	2017-02-26 19:13:35.781912+00	10	f	57	3	89
4330	2017-02-26 19:13:35.807301+00	66	f	47	1	90
4331	2017-02-26 19:13:35.82174+00	6	f	91	1	91
4332	2017-02-26 19:13:35.837117+00	4	f	76	4	92
4333	2017-02-26 19:13:35.851618+00	13	f	70	0	93
4334	2017-02-26 19:13:35.867232+00	12	f	60	4	94
4335	2017-02-26 19:13:35.887478+00	18099	f	48	887	95
4336	2017-02-26 19:13:35.90168+00	15	f	61	2	96
4337	2017-02-26 19:13:35.917775+00	20	f	51	1	97
4338	2017-02-26 19:13:37.319422+00	7	f	62	0	99
4339	2017-02-26 19:23:10.269688+00	11678	f	88	527	1
4340	2017-02-26 19:23:10.340304+00	753	f	94	83	2
4341	2017-02-26 19:23:10.353047+00	125	f	112	4	4
4342	2017-02-26 19:23:10.369597+00	2108	f	4	59	5
4343	2017-02-26 19:23:10.379647+00	88	f	109	3	6
4344	2017-02-26 19:23:10.389605+00	29556	t	2	871	7
4345	2017-02-26 19:23:10.399539+00	73	f	110	6	8
4346	2017-02-26 19:23:10.409535+00	180	f	31	3	9
4347	2017-02-26 19:23:10.419596+00	408	f	10	22	10
4348	2017-02-26 19:23:10.42966+00	295	f	13	21	11
4349	2017-02-26 19:23:10.440058+00	14293	f	5	832	12
4350	2017-02-26 19:23:10.470348+00	38	f	108	3	13
4351	2017-02-26 19:23:12.114596+00	36	f	105	2	15
4352	2017-02-26 19:23:12.195096+00	40	f	104	2	16
4353	2017-02-26 19:23:12.205022+00	24	f	115	3	17
4354	2017-02-26 19:23:13.564305+00	2610	f	6	96	19
4355	2017-02-26 19:23:13.67202+00	34	f	98	0	20
4356	2017-02-26 19:23:13.688751+00	122	f	20	12	21
4357	2017-02-26 19:23:13.698778+00	25	f	107	1	22
4358	2017-02-26 19:23:13.708712+00	2453	f	92	157	23
4359	2017-02-26 19:23:13.727057+00	622	f	8	26	24
4360	2017-02-26 19:23:13.738614+00	46	f	89	12	25
4361	2017-02-26 19:23:15.030805+00	2980	f	7	229	27
4362	2017-02-26 19:23:15.113845+00	1266	f	9	45	28
4363	2017-02-26 19:23:15.122387+00	11	f	120	5	29
4364	2017-02-26 19:23:15.132321+00	173	f	11	7	30
4365	2017-02-26 19:23:17.871944+00	523	f	12	20	33
4366	2017-02-26 19:23:17.949749+00	395	f	14	21	34
4367	2017-02-26 19:23:18.012067+00	269	f	16	13	35
4368	2017-02-26 19:23:19.413471+00	56	f	26	5	37
4369	2017-02-26 19:23:19.484007+00	5	f	114	0	38
4370	2017-02-26 19:23:19.493463+00	9585	f	15	1044	39
4371	2017-02-26 19:23:19.503404+00	7	f	99	0	40
4372	2017-02-26 19:23:19.513372+00	4	f	102	0	41
4373	2017-02-26 19:23:19.523263+00	1	f	127	0	42
4374	2017-02-26 19:23:22.623253+00	3	f	125	2	45
4375	2017-02-26 19:23:24.190812+00	5104	f	18	94	47
4376	2017-02-26 19:23:24.2556+00	4	f	101	0	48
4377	2017-02-26 19:23:24.264958+00	1338	f	21	12	49
4378	2017-02-26 19:23:24.275071+00	2776	f	22	148	50
4379	2017-02-26 19:23:24.28508+00	33	f	34	2	51
4380	2017-02-26 19:23:27.360368+00	153	f	24	7	54
4381	2017-02-26 19:23:27.434233+00	226	f	23	5	55
4382	2017-02-26 19:23:27.453619+00	3	f	123	3	56
4383	2017-02-26 19:23:27.463592+00	4474	f	25	289	57
4384	2017-02-26 19:23:28.81077+00	3	f	106	0	59
4385	2017-02-26 19:23:28.86716+00	46	f	35	2	60
4386	2017-02-26 19:23:28.877016+00	45	f	30	6	61
4387	2017-02-26 19:23:28.886999+00	6820	f	27	715	62
4388	2017-02-26 19:23:28.896971+00	20	f	46	1	63
4389	2017-02-26 19:23:28.916997+00	82	f	29	9	64
4390	2017-02-26 19:23:28.9274+00	21837	f	28	1781	65
4391	2017-02-26 19:23:28.936979+00	83	f	33	10	66
4392	2017-02-26 19:23:28.947052+00	126	f	32	4	67
4393	2017-02-26 19:23:28.957029+00	5193	f	36	192	68
4394	2017-02-26 19:23:31.692604+00	0	f	128	0	69
4395	2017-02-26 19:23:32.896296+00	117	f	38	2	71
4396	2017-02-26 19:23:33.009463+00	3	f	100	1	72
4397	2017-02-26 19:23:33.018376+00	652	f	37	27	73
4398	2017-02-26 19:23:33.028328+00	1	f	126	1	74
4399	2017-02-26 19:23:33.038238+00	17	f	49	2	75
4400	2017-02-26 19:23:33.048184+00	1464	f	39	39	76
4401	2017-02-26 19:23:33.058036+00	41	f	43	11	77
4402	2017-02-26 19:23:33.078169+00	96	f	41	11	78
4403	2017-02-26 19:23:33.088439+00	6409	f	40	105	79
4404	2017-02-26 19:23:33.098124+00	13	f	56	38	80
4405	2017-02-26 19:23:34.63147+00	4	f	71	1	82
4406	2017-02-26 19:23:34.696913+00	1	f	121	4	83
4407	2017-02-26 19:23:34.712855+00	43	f	44	3	84
4408	2017-02-26 19:23:34.722528+00	0	f	118	0	85
4409	2017-02-26 19:23:34.732479+00	2797	f	42	13	86
4410	2017-02-26 19:23:34.74255+00	1	f	116	2	87
4411	2017-02-26 19:23:36.039395+00	57	f	45	4	89
4412	2017-02-26 19:23:36.107047+00	8	f	57	3	90
4413	2017-02-26 19:23:36.116516+00	66	f	47	1	91
4414	2017-02-26 19:23:36.126481+00	9	f	91	1	92
4415	2017-02-26 19:23:36.136429+00	3	f	76	4	93
4416	2017-02-26 19:23:36.146368+00	15	f	70	0	94
4417	2017-02-26 19:23:36.156261+00	12	f	60	4	95
4418	2017-02-26 19:23:36.166411+00	18105	f	48	887	96
4419	2017-02-26 19:23:36.176384+00	16	f	61	2	97
4420	2017-02-26 19:23:36.18642+00	18	f	51	1	98
4421	2017-02-26 19:33:11.12859+00	12040	f	88	542	1
4422	2017-02-26 19:33:11.238579+00	774	f	94	85	2
4423	2017-02-26 19:33:11.257492+00	151	f	112	4	4
4424	2017-02-26 19:33:11.274326+00	2122	f	4	59	5
4425	2017-02-26 19:33:11.287953+00	102	f	109	3	6
4426	2017-02-26 19:33:11.304267+00	80	f	110	6	7
4427	2017-02-26 19:33:11.31781+00	29553	t	2	871	8
4428	2017-02-26 19:33:11.373073+00	188	f	31	3	9
4429	2017-02-26 19:33:11.388549+00	418	f	10	22	10
4430	2017-02-26 19:33:11.404831+00	44	f	108	3	11
4431	2017-02-26 19:33:11.418523+00	301	f	13	22	12
4432	2017-02-26 19:33:11.435208+00	44	f	105	2	13
4433	2017-02-26 19:33:11.448469+00	33	f	115	3	14
4434	2017-02-26 19:33:11.464813+00	14289	f	5	832	15
4435	2017-02-26 19:33:13.179677+00	40	f	104	2	17
4436	2017-02-26 19:33:14.685487+00	2607	f	6	96	19
4437	2017-02-26 19:33:14.938834+00	39	f	98	0	20
4438	2017-02-26 19:33:14.953934+00	122	f	20	12	21
4439	2017-02-26 19:33:14.96789+00	28	f	107	1	22
4440	2017-02-26 19:33:14.983754+00	2458	f	92	157	23
4441	2017-02-26 19:33:14.997702+00	47	f	89	12	24
4442	2017-02-26 19:33:15.01383+00	619	f	8	26	25
4443	2017-02-26 19:33:16.35728+00	12	f	120	5	27
4444	2017-02-26 19:33:16.438015+00	2990	f	7	229	28
4445	2017-02-26 19:33:16.465699+00	1267	f	9	45	29
4446	2017-02-26 19:33:16.502365+00	170	f	11	7	30
4447	2017-02-26 19:33:19.573369+00	5	f	125	2	33
4448	2017-02-26 19:33:19.656707+00	530	f	12	20	34
4449	2017-02-26 19:33:19.67042+00	403	f	14	21	35
4450	2017-02-26 19:33:19.686241+00	277	f	16	13	36
4451	2017-02-26 19:33:21.040648+00	59	f	26	5	38
4452	2017-02-26 19:33:21.110242+00	5	f	114	0	39
4453	2017-02-26 19:33:21.124244+00	9585	f	15	1044	40
4454	2017-02-26 19:33:21.14427+00	8	f	99	0	41
4455	2017-02-26 19:33:24.368895+00	5	f	101	0	44
4456	2017-02-26 19:33:24.438791+00	4	f	102	0	45
4457	2017-02-26 19:33:24.453038+00	1	f	127	0	46
4458	2017-02-26 19:33:26.021347+00	3	f	123	3	48
4459	2017-02-26 19:33:26.08026+00	5108	f	18	94	49
4460	2017-02-26 19:33:26.09213+00	1342	f	21	12	50
4461	2017-02-26 19:33:26.107096+00	35	f	34	2	51
4462	2017-02-26 19:33:26.122044+00	2780	f	22	148	52
4463	2017-02-26 19:33:26.137041+00	4	f	106	0	53
4464	2017-02-26 19:33:29.415537+00	149	f	24	7	56
4465	2017-02-26 19:33:29.512101+00	231	f	23	5	57
4466	2017-02-26 19:33:29.529034+00	4472	f	25	289	58
4467	2017-02-26 19:33:30.879617+00	48	f	35	2	60
4468	2017-02-26 19:33:30.952826+00	45	f	30	6	61
4469	2017-02-26 19:33:30.964915+00	6818	f	27	715	62
4470	2017-02-26 19:33:30.98007+00	20	f	46	1	63
4471	2017-02-26 19:33:30.994527+00	2	f	100	1	64
4472	2017-02-26 19:33:31.010194+00	80	f	29	9	65
4473	2017-02-26 19:33:31.060612+00	21849	f	28	1781	66
4474	2017-02-26 19:33:31.07503+00	82	f	33	10	67
4475	2017-02-26 19:33:31.090298+00	128	f	32	4	68
4476	2017-02-26 19:33:33.53918+00	1	f	129	0	69
4477	2017-02-26 19:33:35.604343+00	1	f	130	0	70
4478	2017-02-26 19:33:35.616813+00	5191	f	36	192	71
4479	2017-02-26 19:33:35.632498+00	2	f	128	0	72
4480	2017-02-26 19:33:37.107721+00	116	f	38	2	74
4481	2017-02-26 19:33:37.166786+00	655	f	37	27	75
4482	2017-02-26 19:33:37.180446+00	1	f	126	1	76
4483	2017-02-26 19:33:37.223788+00	17	f	49	2	77
4484	2017-02-26 19:33:37.240776+00	1463	f	39	39	78
4485	2017-02-26 19:33:37.256745+00	47	f	43	11	79
4486	2017-02-26 19:33:37.270609+00	95	f	41	11	80
4487	2017-02-26 19:33:37.287232+00	6407	f	40	105	81
4488	2017-02-26 19:33:37.300609+00	15	f	56	38	82
4489	2017-02-26 19:33:38.837076+00	4	f	71	1	84
4490	2017-02-26 19:33:38.905606+00	0	f	121	4	85
4491	2017-02-26 19:33:38.920931+00	41	f	44	3	86
4492	2017-02-26 19:33:38.934668+00	0	f	118	0	87
4493	2017-02-26 19:33:38.944671+00	2795	f	42	13	88
4494	2017-02-26 19:33:38.954702+00	1	f	116	2	89
4495	2017-02-26 19:33:40.272687+00	56	f	45	4	91
4496	2017-02-26 19:33:40.355402+00	7	f	57	3	92
4497	2017-02-26 19:33:40.368847+00	71	f	47	1	93
4498	2017-02-26 19:33:40.385256+00	6	f	91	1	94
4499	2017-02-26 19:33:40.398673+00	5	f	76	4	95
4500	2017-02-26 19:33:40.415004+00	15	f	70	0	96
4501	2017-02-26 19:33:40.428639+00	16	f	60	4	97
4502	2017-02-26 19:33:40.445183+00	18106	f	48	887	98
4503	2017-02-26 19:33:40.458748+00	16	f	61	2	99
4504	2017-02-26 19:43:13.708937+00	12384	f	88	552	1
4505	2017-02-26 19:43:14.035255+00	176	f	112	5	3
4506	2017-02-26 19:43:14.072409+00	121	f	109	3	4
4507	2017-02-26 19:43:14.088175+00	2135	f	4	59	5
4508	2017-02-26 19:43:14.103327+00	86	f	110	7	6
4509	2017-02-26 19:43:14.118629+00	29566	t	2	871	7
4510	2017-02-26 19:43:14.133048+00	43	f	115	5	8
4511	2017-02-26 19:43:14.148428+00	188	f	31	3	9
4512	2017-02-26 19:43:14.163163+00	423	f	10	23	10
4513	2017-02-26 19:43:14.178693+00	52	f	108	3	11
4514	2017-02-26 19:43:14.193241+00	312	f	13	22	12
4515	2017-02-26 19:43:14.208896+00	47	f	105	2	13
4516	2017-02-26 19:43:14.223391+00	14294	f	5	832	14
4517	2017-02-26 19:43:14.238903+00	44	f	104	2	15
4518	2017-02-26 19:43:17.679779+00	20	f	120	5	18
4519	2017-02-26 19:43:17.779043+00	36	f	98	0	19
4520	2017-02-26 19:43:17.795842+00	123	f	20	12	20
4521	2017-02-26 19:43:17.815656+00	2611	f	6	96	21
4522	2017-02-26 19:43:17.828226+00	31	f	107	1	22
4523	2017-02-26 19:43:17.842646+00	2458	f	92	157	23
4524	2017-02-26 19:43:17.85812+00	43	f	89	12	24
4525	2017-02-26 19:43:17.872597+00	617	f	8	26	25
4526	2017-02-26 19:43:19.186516+00	2989	f	7	229	27
4527	2017-02-26 19:43:19.343488+00	1268	f	9	45	28
4528	2017-02-26 19:43:19.360229+00	10	f	125	4	29
4529	2017-02-26 19:43:20.904277+00	174	f	11	7	31
4530	2017-02-26 19:43:20.976694+00	8	f	123	3	32
4531	2017-02-26 19:43:22.523198+00	527	f	12	20	34
4532	2017-02-26 19:43:22.590683+00	398	f	14	21	35
4533	2017-02-26 19:43:22.614957+00	272	f	16	13	36
4534	2017-02-26 19:43:24.026193+00	3	f	127	0	38
4535	2017-02-26 19:43:24.363194+00	8	f	99	0	39
4536	2017-02-26 19:43:26.483712+00	57	f	26	5	41
4537	2017-02-26 19:43:26.520423+00	3	f	114	0	42
4538	2017-02-26 19:43:26.534634+00	9584	f	15	1044	43
4539	2017-02-26 19:43:26.550179+00	5	f	106	0	44
4540	2017-02-26 19:43:28.250278+00	7	f	101	0	46
4541	2017-02-26 19:43:30.036371+00	5105	f	18	94	48
4542	2017-02-26 19:43:30.291112+00	6	f	102	0	49
4543	2017-02-26 19:43:30.318454+00	1341	f	21	12	50
4544	2017-02-26 19:43:30.33428+00	37	f	34	2	51
4545	2017-02-26 19:43:30.349885+00	2777	f	22	148	52
4546	2017-02-26 19:43:33.631964+00	3	f	128	0	55
4547	2017-02-26 19:43:33.657277+00	153	f	24	7	56
4548	2017-02-26 19:43:33.672892+00	228	f	23	5	57
4549	2017-02-26 19:43:33.688493+00	4481	f	25	289	58
4550	2017-02-26 19:43:34.854997+00	52	f	35	2	60
4551	2017-02-26 19:43:35.136357+00	48	f	30	6	61
4552	2017-02-26 19:43:35.166943+00	6821	f	27	715	62
4553	2017-02-26 19:43:35.212517+00	21	f	46	1	63
4554	2017-02-26 19:43:35.226686+00	2	f	100	1	64
4555	2017-02-26 19:43:35.242397+00	83	f	29	9	65
4556	2017-02-26 19:43:35.256709+00	21840	f	28	1781	66
4557	2017-02-26 19:43:35.272444+00	87	f	33	10	67
4558	2017-02-26 19:43:35.286801+00	129	f	32	4	68
4559	2017-02-26 19:43:37.089559+00	2	f	131	0	69
4560	2017-02-26 19:43:37.141527+00	5196	f	36	192	70
4561	2017-02-26 19:43:37.16711+00	120	f	38	2	71
4562	2017-02-26 19:43:37.181865+00	648	f	37	27	72
4563	2017-02-26 19:43:37.197345+00	2	f	126	1	73
4564	2017-02-26 19:43:37.2117+00	12	f	57	3	74
4565	2017-02-26 19:43:37.247536+00	15	f	49	2	75
4566	2017-02-26 19:43:37.261764+00	1466	f	39	39	76
4567	2017-02-26 19:43:37.277476+00	47	f	43	11	77
4568	2017-02-26 19:43:37.297573+00	95	f	41	11	78
4569	2017-02-26 19:43:37.434913+00	6413	f	40	105	79
4570	2017-02-26 19:43:37.448216+00	12	f	56	38	80
4571	2017-02-26 19:43:39.063366+00	5	f	71	1	82
4572	2017-02-26 19:43:39.163059+00	0	f	121	4	83
4573	2017-02-26 19:43:39.186931+00	42	f	44	3	84
4574	2017-02-26 19:43:39.202535+00	0	f	118	0	85
4575	2017-02-26 19:43:39.21682+00	2790	f	42	13	86
4576	2017-02-26 19:43:39.232469+00	0	f	116	2	87
4577	2017-02-26 19:43:40.528745+00	53	f	45	4	89
4578	2017-02-26 19:43:40.636711+00	69	f	47	1	90
4579	2017-02-26 19:43:40.656061+00	9	f	91	1	91
4580	2017-02-26 19:43:40.670649+00	2	f	76	4	92
4581	2017-02-26 19:43:40.686336+00	14	f	70	0	93
4582	2017-02-26 19:43:40.700565+00	14	f	60	4	94
4583	2017-02-26 19:43:40.716244+00	18096	f	48	887	95
4584	2017-02-26 19:43:40.730404+00	14	f	61	2	96
4585	2017-02-26 19:43:42.019849+00	19	f	51	1	98
4586	2017-02-26 19:53:10.993354+00	12757	f	88	566	1
4587	2017-02-26 19:53:11.071276+00	209	f	112	8	3
4588	2017-02-26 19:53:11.088031+00	138	f	109	3	4
4589	2017-02-26 19:53:11.097916+00	2152	f	4	59	5
4590	2017-02-26 19:53:11.108015+00	96	f	110	7	6
4591	2017-02-26 19:53:11.117947+00	29558	t	2	872	7
4592	2017-02-26 19:53:11.127926+00	57	f	115	5	8
4593	2017-02-26 19:53:11.137894+00	57	f	108	3	9
4594	2017-02-26 19:53:11.14795+00	197	f	31	3	10
4595	2017-02-26 19:53:11.157925+00	438	f	10	23	11
4596	2017-02-26 19:53:11.182372+00	56	f	105	2	12
4597	2017-02-26 19:53:11.324398+00	314	f	13	23	13
4598	2017-02-26 19:53:11.338968+00	47	f	104	2	14
4599	2017-02-26 19:53:11.349019+00	14294	f	5	832	15
4600	2017-02-26 19:53:14.492146+00	24	f	120	5	18
4601	2017-02-26 19:53:14.612768+00	36	f	98	0	19
4602	2017-02-26 19:53:14.627463+00	31	f	107	1	20
4603	2017-02-26 19:53:14.637325+00	126	f	20	12	21
4604	2017-02-26 19:53:14.647266+00	2618	f	6	96	22
4605	2017-02-26 19:53:14.657143+00	2462	f	92	157	23
4606	2017-02-26 19:53:14.667069+00	50	f	89	12	24
4607	2017-02-26 19:53:14.677018+00	625	f	8	26	25
4608	2017-02-26 19:53:16.006125+00	11	f	125	3	27
4609	2017-02-26 19:53:16.121623+00	2990	f	7	229	28
4610	2017-02-26 19:53:16.131173+00	1265	f	9	45	29
4611	2017-02-26 19:53:16.141168+00	10	f	123	3	30
4612	2017-02-26 19:53:17.562048+00	174	f	11	7	32
4613	2017-02-26 19:53:19.105744+00	6	f	128	0	34
4614	2017-02-26 19:53:19.177903+00	4	f	127	0	35
4615	2017-02-26 19:53:19.189201+00	522	f	12	20	36
4616	2017-02-26 19:53:19.199206+00	402	f	14	21	37
4617	2017-02-26 19:53:19.209043+00	274	f	16	13	38
4618	2017-02-26 19:53:20.602469+00	4	f	114	0	40
4619	2017-02-26 19:53:20.662698+00	6	f	99	0	41
4620	2017-02-26 19:53:22.419078+00	57	f	26	5	43
4621	2017-02-26 19:53:22.587652+00	7	f	101	0	44
4622	2017-02-26 19:53:22.598254+00	9581	f	15	1044	45
4623	2017-02-26 19:53:26.025549+00	5114	f	18	94	48
4624	2017-02-26 19:53:26.096624+00	5	f	102	0	49
4625	2017-02-26 19:53:26.117529+00	1341	f	21	12	50
4626	2017-02-26 19:53:26.145362+00	40	f	34	2	51
4627	2017-02-26 19:53:26.157416+00	2771	f	22	148	52
4628	2017-02-26 19:53:27.606362+00	4	f	106	0	54
4629	2017-02-26 19:53:29.225997+00	151	f	24	7	56
4630	2017-02-26 19:53:29.296024+00	231	f	23	5	57
4631	2017-02-26 19:53:29.305805+00	4473	f	25	289	58
4632	2017-02-26 19:53:30.46188+00	51	f	35	2	60
4633	2017-02-26 19:53:30.517658+00	47	f	30	6	61
4634	2017-02-26 19:53:30.528904+00	6820	f	27	715	62
4635	2017-02-26 19:53:30.538841+00	22	f	46	1	63
4636	2017-02-26 19:53:30.575086+00	2	f	100	2	64
4637	2017-02-26 19:53:30.585056+00	81	f	29	9	65
4638	2017-02-26 19:53:30.595052+00	21848	f	28	1782	66
4639	2017-02-26 19:53:30.605029+00	84	f	33	10	67
4640	2017-02-26 19:53:30.614994+00	126	f	32	4	68
4641	2017-02-26 19:53:30.624909+00	2	f	131	0	69
4642	2017-02-26 19:53:30.635022+00	5200	f	36	192	70
4643	2017-02-26 19:53:30.644931+00	114	f	38	2	71
4644	2017-02-26 19:53:30.65484+00	653	f	37	27	72
4645	2017-02-26 19:53:30.664866+00	2	f	126	1	73
4646	2017-02-26 19:53:30.674879+00	11	f	57	3	74
4647	2017-02-26 19:53:30.684988+00	14	f	49	2	75
4648	2017-02-26 19:53:30.705111+00	1463	f	39	39	76
4649	2017-02-26 19:53:30.715168+00	45	f	43	11	77
4650	2017-02-26 19:53:30.725088+00	93	f	41	11	78
4651	2017-02-26 19:53:30.735142+00	6404	f	40	105	79
4652	2017-02-26 19:53:30.745142+00	13	f	56	38	80
4653	2017-02-26 19:53:32.489931+00	4	f	71	1	82
4654	2017-02-26 19:53:32.700741+00	0	f	121	4	83
4655	2017-02-26 19:53:32.76116+00	3	f	76	4	84
4656	2017-02-26 19:53:32.771214+00	45	f	44	3	85
4657	2017-02-26 19:53:32.781064+00	0	f	118	0	86
4658	2017-02-26 19:53:32.791067+00	2791	f	42	13	87
4659	2017-02-26 19:53:32.800855+00	2	f	116	2	88
4660	2017-02-26 19:53:32.810946+00	8	f	91	1	89
4661	2017-02-26 19:53:34.100744+00	56	f	45	4	91
4662	2017-02-26 19:53:34.173962+00	71	f	47	1	92
4663	2017-02-26 19:53:34.184582+00	17	f	61	2	93
4664	2017-02-26 19:53:34.1946+00	16	f	70	0	94
4665	2017-02-26 19:53:34.204407+00	13	f	60	4	95
4666	2017-02-26 19:53:34.214351+00	18100	f	48	887	96
4667	2017-02-26 19:53:34.224401+00	18	f	51	1	97
4668	2017-02-26 19:53:35.647583+00	12	f	64	0	99
4669	2017-02-26 20:03:11.559519+00	13104	f	88	578	1
4670	2017-02-26 20:03:11.6551+00	238	f	112	8	3
4671	2017-02-26 20:03:11.671556+00	143	f	109	3	4
4672	2017-02-26 20:03:11.681402+00	105	f	110	7	5
4673	2017-02-26 20:03:11.691364+00	2164	f	4	59	6
4674	2017-02-26 20:03:11.701324+00	29570	t	2	872	7
4675	2017-02-26 20:03:11.711312+00	59	f	115	5	8
4676	2017-02-26 20:03:11.721155+00	65	f	105	2	9
4677	2017-02-26 20:03:11.731173+00	59	f	108	3	10
4678	2017-02-26 20:03:11.741128+00	206	f	31	3	11
4679	2017-02-26 20:03:11.751094+00	447	f	10	25	12
4680	2017-02-26 20:03:11.761077+00	329	f	13	25	13
4681	2017-02-26 20:03:11.791246+00	55	f	104	2	14
4682	2017-02-26 20:03:13.166513+00	28	f	120	5	16
4683	2017-02-26 20:03:13.261051+00	14297	f	5	832	17
4684	2017-02-26 20:03:15.108012+00	39	f	98	0	19
4685	2017-02-26 20:03:15.179461+00	34	f	107	1	20
4686	2017-02-26 20:03:15.190626+00	127	f	20	12	21
4687	2017-02-26 20:03:15.200593+00	2615	f	6	97	22
4688	2017-02-26 20:03:15.21043+00	2467	f	92	157	23
4689	2017-02-26 20:03:15.22313+00	48	f	89	12	24
4690	2017-02-26 20:03:15.238726+00	623	f	8	26	25
4691	2017-02-26 20:03:16.68281+00	14	f	125	4	27
4692	2017-02-26 20:03:16.734509+00	2997	f	7	229	28
4693	2017-02-26 20:03:16.744408+00	1268	f	9	45	29
4694	2017-02-26 20:03:16.754393+00	11	f	123	4	30
4695	2017-02-26 20:03:18.283092+00	172	f	11	7	32
4696	2017-02-26 20:03:18.348401+00	8	f	128	0	33
4697	2017-02-26 20:03:19.814255+00	4	f	127	0	35
4698	2017-02-26 20:03:19.882604+00	523	f	12	20	36
4699	2017-02-26 20:03:19.892519+00	403	f	14	21	37
4700	2017-02-26 20:03:19.902536+00	273	f	16	13	38
4701	2017-02-26 20:03:21.218382+00	6	f	114	0	40
4702	2017-02-26 20:03:21.243732+00	9	f	99	0	41
4703	2017-02-26 20:03:22.94711+00	56	f	26	5	43
4704	2017-02-26 20:03:23.019005+00	8	f	101	0	44
4705	2017-02-26 20:03:24.742933+00	3	f	132	0	45
4706	2017-02-26 20:03:24.754976+00	9576	f	15	1044	46
4707	2017-02-26 20:03:27.962523+00	5109	f	18	94	49
4708	2017-02-26 20:03:28.104014+00	6	f	106	0	50
4709	2017-02-26 20:03:28.113461+00	3	f	102	0	51
4710	2017-02-26 20:03:28.123397+00	1342	f	21	12	52
4711	2017-02-26 20:03:28.133313+00	40	f	34	2	53
4712	2017-02-26 20:03:28.143348+00	2776	f	22	148	54
4713	2017-02-26 20:03:31.435329+00	149	f	24	7	57
4714	2017-02-26 20:03:31.640864+00	5	f	100	2	58
4715	2017-02-26 20:03:31.65231+00	230	f	23	5	59
4716	2017-02-26 20:03:31.662196+00	4477	f	25	289	60
4717	2017-02-26 20:03:33.089972+00	49	f	35	2	62
4718	2017-02-26 20:03:33.207335+00	49	f	30	6	63
4719	2017-02-26 20:03:33.224254+00	6819	f	27	715	64
4720	2017-02-26 20:03:33.236843+00	19	f	46	1	65
4721	2017-02-26 20:03:33.2469+00	76	f	29	9	66
4722	2017-02-26 20:03:33.259881+00	87	f	33	10	67
4723	2017-02-26 20:03:33.276826+00	21841	f	28	1783	68
4724	2017-02-26 20:03:33.435462+00	129	f	32	4	69
4725	2017-02-26 20:03:35.157403+00	1	f	133	0	70
4726	2017-02-26 20:03:35.171977+00	1	f	131	0	71
4727	2017-02-26 20:03:35.181669+00	5198	f	36	192	72
4728	2017-02-26 20:03:35.191569+00	5	f	71	1	73
4729	2017-02-26 20:03:35.201971+00	10	f	57	3	74
4730	2017-02-26 20:03:35.211811+00	118	f	38	2	75
4731	2017-02-26 20:03:35.22161+00	650	f	37	27	76
4732	2017-02-26 20:03:35.231588+00	2	f	126	1	77
4733	2017-02-26 20:03:35.241622+00	16	f	49	2	78
4734	2017-02-26 20:03:35.251813+00	1456	f	39	39	79
4735	2017-02-26 20:03:35.262263+00	14	f	56	38	80
4736	2017-02-26 20:03:35.271709+00	46	f	43	11	81
4737	2017-02-26 20:03:35.281743+00	95	f	41	11	82
4738	2017-02-26 20:03:35.291785+00	6406	f	40	105	83
4739	2017-02-26 20:03:36.856231+00	0	f	121	4	85
4740	2017-02-26 20:03:37.007075+00	3	f	76	4	86
4741	2017-02-26 20:03:37.034744+00	45	f	44	3	87
4742	2017-02-26 20:03:37.046927+00	0	f	118	0	88
4743	2017-02-26 20:03:37.056866+00	2790	f	42	13	89
4744	2017-02-26 20:03:37.066931+00	0	f	116	2	90
4745	2017-02-26 20:03:37.076662+00	8	f	91	1	91
4746	2017-02-26 20:03:38.242842+00	56	f	45	4	93
4747	2017-02-26 20:03:38.350434+00	73	f	47	1	94
4748	2017-02-26 20:03:39.777298+00	17	f	61	2	96
4749	2017-02-26 20:03:39.844636+00	15	f	70	0	97
4750	2017-02-26 20:03:39.861567+00	13	f	60	4	98
4751	2017-02-26 20:03:39.873802+00	18099	f	48	887	99
4752	2017-02-26 20:13:11.674148+00	13424	f	88	598	1
4753	2017-02-26 20:13:11.772426+00	269	f	112	8	3
4754	2017-02-26 20:13:11.788294+00	158	f	109	3	4
4755	2017-02-26 20:13:11.802642+00	116	f	110	8	5
4756	2017-02-26 20:13:11.828233+00	2176	f	4	60	6
4757	2017-02-26 20:13:11.842575+00	66	f	115	5	7
4758	2017-02-26 20:13:11.858181+00	29562	t	2	872	8
4759	2017-02-26 20:13:11.872601+00	66	f	108	3	9
4760	2017-02-26 20:13:11.888207+00	66	f	105	3	10
4761	2017-02-26 20:13:11.902665+00	206	f	31	4	11
4762	2017-02-26 20:13:11.918284+00	450	f	10	25	12
4763	2017-02-26 20:13:11.9327+00	57	f	104	2	13
4764	2017-02-26 20:13:11.948277+00	329	f	13	26	14
4765	2017-02-26 20:13:13.604519+00	32	f	120	6	16
4766	2017-02-26 20:13:13.830568+00	14300	f	5	832	17
4767	2017-02-26 20:13:15.514299+00	37	f	107	1	19
4768	2017-02-26 20:13:15.555469+00	42	f	98	0	20
4769	2017-02-26 20:13:15.577946+00	130	f	20	12	21
4770	2017-02-26 20:13:15.592291+00	2624	f	6	97	22
4771	2017-02-26 20:13:15.608097+00	53	f	89	12	23
4772	2017-02-26 20:13:15.663074+00	2467	f	92	157	24
4773	2017-02-26 20:13:15.678267+00	625	f	8	26	25
4774	2017-02-26 20:13:18.488488+00	14	f	125	5	28
4775	2017-02-26 20:13:18.560313+00	13	f	123	4	29
4776	2017-02-26 20:13:18.575908+00	2998	f	7	229	30
4777	2017-02-26 20:13:18.589949+00	1271	f	9	45	31
4778	2017-02-26 20:13:18.605546+00	176	f	11	7	32
4779	2017-02-26 20:13:18.633965+00	8	f	128	0	33
4780	2017-02-26 20:13:18.659624+00	4	f	127	0	34
4781	2017-02-26 20:13:20.108721+00	531	f	12	20	36
4782	2017-02-26 20:13:20.180402+00	404	f	14	21	37
4783	2017-02-26 20:13:20.194162+00	276	f	16	13	38
4784	2017-02-26 20:13:21.555134+00	5	f	114	0	40
4785	2017-02-26 20:13:21.617756+00	7	f	99	0	41
4786	2017-02-26 20:13:23.226328+00	57	f	26	5	43
4787	2017-02-26 20:13:23.297985+00	8	f	101	0	44
4788	2017-02-26 20:13:23.311968+00	3	f	132	0	45
4789	2017-02-26 20:13:23.327602+00	9580	f	15	1044	46
4790	2017-02-26 20:13:24.986687+00	4	f	106	0	48
4791	2017-02-26 20:13:26.612198+00	5116	f	18	94	50
4792	2017-02-26 20:13:26.710775+00	5	f	102	0	51
4793	2017-02-26 20:13:26.726246+00	2	f	133	0	52
4794	2017-02-26 20:13:26.740516+00	1343	f	21	12	53
4795	2017-02-26 20:13:26.756073+00	35	f	34	2	54
4796	2017-02-26 20:13:26.770415+00	2778	f	22	148	55
4797	2017-02-26 20:13:29.973137+00	151	f	24	7	58
4798	2017-02-26 20:13:30.044808+00	4	f	100	2	59
4799	2017-02-26 20:13:30.073059+00	230	f	23	5	60
4800	2017-02-26 20:13:30.098643+00	4474	f	25	289	61
4801	2017-02-26 20:13:30.114823+00	46	f	35	2	62
4802	2017-02-26 20:13:30.12928+00	0	f	121	4	63
4803	2017-02-26 20:13:31.488321+00	23	f	46	1	65
4804	2017-02-26 20:13:31.543029+00	43	f	30	6	66
4805	2017-02-26 20:13:31.55837+00	6823	f	27	715	67
4806	2017-02-26 20:13:31.572548+00	82	f	29	9	68
4807	2017-02-26 20:13:31.588235+00	89	f	33	10	69
4808	2017-02-26 20:13:31.602436+00	21838	f	28	1782	70
4809	2017-02-26 20:13:31.634978+00	125	f	32	4	71
4810	2017-02-26 20:13:31.672704+00	5	f	71	1	72
4811	2017-02-26 20:13:33.565914+00	0	f	134	0	73
4812	2017-02-26 20:13:33.578273+00	1	f	131	0	74
4813	2017-02-26 20:13:33.594016+00	5196	f	36	192	75
4814	2017-02-26 20:13:33.608023+00	13	f	57	3	76
4815	2017-02-26 20:13:33.617964+00	119	f	38	2	77
4816	2017-02-26 20:13:33.627926+00	16	f	49	2	78
4817	2017-02-26 20:13:33.643887+00	656	f	37	27	79
4818	2017-02-26 20:13:33.658112+00	1	f	126	1	80
4819	2017-02-26 20:13:33.673963+00	16	f	56	38	81
4820	2017-02-26 20:13:33.688029+00	49	f	43	11	82
4821	2017-02-26 20:13:33.704056+00	1463	f	39	39	83
4822	2017-02-26 20:13:33.718152+00	97	f	41	11	84
4823	2017-02-26 20:13:33.728249+00	6411	f	40	105	85
4824	2017-02-26 20:13:35.281607+00	6	f	76	4	87
4825	2017-02-26 20:13:35.487288+00	45	f	44	3	88
4826	2017-02-26 20:13:35.513263+00	0	f	118	0	89
4827	2017-02-26 20:13:35.529253+00	2799	f	42	13	90
4828	2017-02-26 20:13:35.543343+00	59	f	45	4	91
4829	2017-02-26 20:13:35.559172+00	0	f	116	2	92
4830	2017-02-26 20:13:35.573137+00	8	f	91	1	93
4831	2017-02-26 20:13:38.191625+00	72	f	47	1	96
4832	2017-02-26 20:13:38.260474+00	16	f	60	4	97
4833	2017-02-26 20:13:38.27612+00	19	f	61	2	98
4834	2017-02-26 20:13:38.290212+00	15	f	70	0	99
4835	2017-02-26 20:23:15.308386+00	13749	f	88	614	1
4836	2017-02-26 20:23:15.368296+00	316	f	112	8	3
4837	2017-02-26 20:23:15.384589+00	180	f	109	3	4
4838	2017-02-26 20:23:15.394569+00	132	f	110	10	5
4839	2017-02-26 20:23:15.404507+00	2187	f	4	60	6
4840	2017-02-26 20:23:15.414522+00	73	f	115	5	7
4841	2017-02-26 20:23:15.424425+00	29577	t	2	872	8
4842	2017-02-26 20:23:15.434391+00	67	f	108	3	9
4843	2017-02-26 20:23:15.444365+00	68	f	105	3	10
4844	2017-02-26 20:23:15.454417+00	41	f	120	8	11
4845	2017-02-26 20:23:15.464439+00	210	f	31	4	12
4846	2017-02-26 20:23:15.4745+00	457	f	10	25	13
4847	2017-02-26 20:23:16.852403+00	59	f	104	2	15
4848	2017-02-26 20:23:16.996518+00	337	f	13	27	16
4849	2017-02-26 20:23:17.008969+00	14300	f	5	832	17
4850	2017-02-26 20:23:18.720034+00	38	f	107	1	19
4851	2017-02-26 20:23:18.783391+00	43	f	98	0	20
4852	2017-02-26 20:23:18.793186+00	135	f	20	12	21
4853	2017-02-26 20:23:18.803579+00	2624	f	6	97	22
4854	2017-02-26 20:23:18.81309+00	52	f	89	12	23
4855	2017-02-26 20:23:18.82305+00	2470	f	92	157	24
4856	2017-02-26 20:23:20.237742+00	15	f	123	4	26
4857	2017-02-26 20:23:20.328215+00	625	f	8	27	27
4858	2017-02-26 20:23:20.338155+00	15	f	125	5	28
4859	2017-02-26 20:23:21.69577+00	10	f	128	0	30
4860	2017-02-26 20:23:21.761223+00	10	f	127	0	31
4861	2017-02-26 20:23:21.770689+00	2988	f	7	229	32
4862	2017-02-26 20:23:21.78057+00	1269	f	9	45	33
4863	2017-02-26 20:23:21.790626+00	172	f	11	7	34
4864	2017-02-26 20:23:23.236877+00	8	f	114	0	36
4865	2017-02-26 20:23:23.30509+00	532	f	12	20	37
4866	2017-02-26 20:23:23.314864+00	410	f	14	21	38
4867	2017-02-26 20:23:23.335112+00	7	f	106	0	39
4868	2017-02-26 20:23:23.344804+00	278	f	16	13	40
4869	2017-02-26 20:23:24.849432+00	8	f	99	0	42
4870	2017-02-26 20:23:26.579778+00	58	f	26	5	44
4871	2017-02-26 20:23:26.663099+00	5	f	101	0	45
4872	2017-02-26 20:23:26.673502+00	2	f	132	0	46
4873	2017-02-26 20:23:26.683493+00	9581	f	15	1044	47
4874	2017-02-26 20:23:29.784143+00	5117	f	18	94	50
4875	2017-02-26 20:23:29.900366+00	6	f	102	0	51
4876	2017-02-26 20:23:29.931543+00	1341	f	21	12	52
4877	2017-02-26 20:23:29.941473+00	36	f	34	2	53
4878	2017-02-26 20:23:29.951459+00	2784	f	22	148	54
4879	2017-02-26 20:23:33.095995+00	150	f	24	7	57
4880	2017-02-26 20:23:33.149617+00	3	f	100	2	58
4881	2017-02-26 20:23:33.159565+00	228	f	23	5	59
4882	2017-02-26 20:23:33.169337+00	4474	f	25	289	60
4883	2017-02-26 20:23:33.17978+00	51	f	35	2	61
4884	2017-02-26 20:23:33.199509+00	2	f	121	4	62
4885	2017-02-26 20:23:34.394522+00	19	f	46	1	64
4886	2017-02-26 20:23:34.412848+00	47	f	30	6	65
4887	2017-02-26 20:23:34.422825+00	6817	f	27	715	66
4888	2017-02-26 20:23:34.432791+00	77	f	29	9	67
4889	2017-02-26 20:23:34.442726+00	87	f	33	10	68
4890	2017-02-26 20:23:34.452623+00	21842	f	28	1782	69
4891	2017-02-26 20:23:34.472712+00	130	f	32	4	70
4892	2017-02-26 20:23:36.124467+00	0	f	135	0	71
4893	2017-02-26 20:23:38.190494+00	0	f	136	0	72
4894	2017-02-26 20:23:41.448696+00	1	f	137	0	73
4895	2017-02-26 20:23:41.461314+00	6	f	71	1	74
4896	2017-02-26 20:23:41.480923+00	0	f	133	0	75
4897	2017-02-26 20:23:41.490889+00	1	f	131	0	76
4898	2017-02-26 20:23:41.500767+00	5195	f	36	192	77
4899	2017-02-26 20:23:41.510818+00	11	f	57	3	78
4900	2017-02-26 20:23:41.530803+00	117	f	38	2	79
4901	2017-02-26 20:23:41.540725+00	16	f	49	2	80
4902	2017-02-26 20:23:41.550647+00	8	f	76	4	81
4903	2017-02-26 20:23:41.570691+00	654	f	37	27	82
4904	2017-02-26 20:23:41.580675+00	1	f	126	1	83
4905	2017-02-26 20:23:41.59061+00	52	f	43	11	84
4906	2017-02-26 20:23:41.600667+00	1460	f	39	39	85
4907	2017-02-26 20:23:41.610687+00	14	f	56	38	86
4908	2017-02-26 20:23:41.623841+00	98	f	41	11	87
4909	2017-02-26 20:23:41.630681+00	6408	f	40	105	88
4910	2017-02-26 20:23:41.640635+00	9	f	91	1	89
4911	2017-02-26 20:23:43.210331+00	45	f	44	3	91
4912	2017-02-26 20:23:43.413606+00	1	f	118	0	92
4913	2017-02-26 20:23:43.435913+00	2797	f	42	13	93
4914	2017-02-26 20:23:43.445826+00	55	f	45	4	94
4915	2017-02-26 20:23:43.45573+00	2	f	116	2	95
4916	2017-02-26 20:23:44.785505+00	17	f	60	5	97
4917	2017-02-26 20:23:46.341997+00	70	f	47	1	99
4918	2017-02-26 20:33:12.034201+00	14057	f	88	627	1
4919	2017-02-26 20:33:12.112718+00	352	f	112	11	2
4920	2017-02-26 20:33:12.151856+00	196	f	109	3	4
4921	2017-02-26 20:33:12.162183+00	141	f	110	12	5
4922	2017-02-26 20:33:12.172189+00	87	f	115	5	6
4923	2017-02-26 20:33:12.18854+00	2205	f	4	61	7
4924	2017-02-26 20:33:12.20969+00	29579	t	2	872	8
4925	2017-02-26 20:33:12.222416+00	76	f	108	4	9
4926	2017-02-26 20:33:12.232392+00	78	f	105	3	10
4927	2017-02-26 20:33:12.242455+00	43	f	120	8	11
4928	2017-02-26 20:33:12.259886+00	214	f	31	4	12
4929	2017-02-26 20:33:12.279886+00	63	f	104	2	13
4930	2017-02-26 20:33:12.292697+00	454	f	10	25	14
4931	2017-02-26 20:33:13.706611+00	343	f	13	28	16
4932	2017-02-26 20:33:13.77694+00	14309	f	5	832	17
4933	2017-02-26 20:33:13.803123+00	44	f	107	1	18
4934	2017-02-26 20:33:15.523248+00	42	f	98	0	20
4935	2017-02-26 20:33:15.581738+00	143	f	20	12	21
4936	2017-02-26 20:33:15.598733+00	2624	f	6	97	22
4937	2017-02-26 20:33:15.611448+00	48	f	89	13	23
4938	2017-02-26 20:33:15.62763+00	2470	f	92	157	24
4939	2017-02-26 20:33:17.151186+00	631	f	8	27	26
4940	2017-02-26 20:33:17.250535+00	15	f	125	5	27
4941	2017-02-26 20:33:18.634425+00	14	f	123	4	29
4942	2017-02-26 20:33:18.706932+00	10	f	128	0	30
4943	2017-02-26 20:33:18.729733+00	2995	f	7	229	31
4944	2017-02-26 20:33:18.759447+00	7	f	127	0	32
4945	2017-02-26 20:33:18.775589+00	1271	f	9	45	33
4946	2017-02-26 20:33:18.789361+00	180	f	11	7	34
4947	2017-02-26 20:33:20.248492+00	4	f	132	1	36
4948	2017-02-26 20:33:20.320838+00	8	f	114	0	37
4949	2017-02-26 20:33:20.334038+00	531	f	12	20	38
4950	2017-02-26 20:33:20.350664+00	414	f	14	21	39
4951	2017-02-26 20:33:20.363467+00	278	f	16	13	40
4952	2017-02-26 20:33:21.701053+00	8	f	99	0	42
4953	2017-02-26 20:33:23.404918+00	57	f	26	5	44
4954	2017-02-26 20:33:23.479425+00	7	f	106	0	45
4955	2017-02-26 20:33:23.49178+00	8	f	101	0	46
4956	2017-02-26 20:33:25.20137+00	9579	f	15	1044	48
4957	2017-02-26 20:33:26.91961+00	5107	f	18	94	50
4958	2017-02-26 20:33:29.331317+00	2	f	138	0	51
4959	2017-02-26 20:33:29.34478+00	2	f	137	0	52
4960	2017-02-26 20:33:29.359782+00	6	f	100	2	53
4961	2017-02-26 20:33:29.374226+00	38	f	34	2	54
4962	2017-02-26 20:33:29.389757+00	0	f	121	4	55
4963	2017-02-26 20:33:29.404255+00	1339	f	21	12	56
4964	2017-02-26 20:33:29.419895+00	2782	f	22	149	57
4965	2017-02-26 20:33:32.38521+00	151	f	24	7	60
4966	2017-02-26 20:33:32.462787+00	6	f	102	1	61
4967	2017-02-26 20:33:32.477898+00	230	f	23	5	62
4968	2017-02-26 20:33:32.492399+00	4472	f	25	289	63
4969	2017-02-26 20:33:32.507782+00	50	f	35	2	64
4970	2017-02-26 20:33:32.522372+00	22	f	46	1	65
4971	2017-02-26 20:33:33.868851+00	50	f	30	6	67
4972	2017-02-26 20:33:33.936307+00	6827	f	27	715	68
4973	2017-02-26 20:33:33.976767+00	81	f	29	9	69
4974	2017-02-26 20:33:33.991422+00	91	f	33	10	70
4975	2017-02-26 20:33:34.006131+00	21846	f	28	1782	71
4976	2017-02-26 20:33:35.774031+00	1	f	139	0	72
4977	2017-02-26 20:33:38.360554+00	1	f	140	0	73
4978	2017-02-26 20:33:39.779672+00	130	f	32	4	75
4979	2017-02-26 20:33:39.852093+00	0	f	136	0	76
4980	2017-02-26 20:33:39.876633+00	6	f	71	1	77
4981	2017-02-26 20:33:39.896646+00	0	f	133	0	78
4982	2017-02-26 20:33:39.911687+00	1	f	131	0	79
4983	2017-02-26 20:33:39.92646+00	5197	f	36	192	80
4984	2017-02-26 20:33:39.941637+00	11	f	57	3	81
4985	2017-02-26 20:33:39.95652+00	120	f	38	2	82
4986	2017-02-26 20:33:39.971698+00	17	f	49	2	83
4987	2017-02-26 20:33:39.988129+00	6	f	76	4	84
4988	2017-02-26 20:33:40.001795+00	657	f	37	27	85
4989	2017-02-26 20:33:40.016609+00	1	f	126	1	86
4990	2017-02-26 20:33:40.03183+00	14	f	56	38	87
4991	2017-02-26 20:33:40.046622+00	44	f	43	11	88
4992	2017-02-26 20:33:40.061832+00	1460	f	39	39	89
4993	2017-02-26 20:33:40.076682+00	94	f	41	11	90
4994	2017-02-26 20:33:40.091879+00	6410	f	40	105	91
4995	2017-02-26 20:33:40.106694+00	10	f	91	1	92
4996	2017-02-26 20:33:41.65213+00	43	f	44	3	94
4997	2017-02-26 20:33:41.711588+00	1	f	118	0	95
4998	2017-02-26 20:33:41.726658+00	2792	f	42	13	96
4999	2017-02-26 20:33:41.741245+00	54	f	45	4	97
5000	2017-02-26 20:33:41.756495+00	0	f	116	2	98
5001	2017-02-26 20:43:12.335075+00	14339	f	88	636	1
5002	2017-02-26 20:43:12.406486+00	395	f	112	14	2
5003	2017-02-26 20:43:12.421629+00	215	f	109	3	4
5004	2017-02-26 20:43:12.438897+00	170	f	110	11	5
5005	2017-02-26 20:43:12.448876+00	97	f	115	5	6
5006	2017-02-26 20:43:12.458719+00	2212	f	4	62	7
5007	2017-02-26 20:43:12.487393+00	77	f	108	5	8
5008	2017-02-26 20:43:12.499215+00	29573	t	2	872	9
5009	2017-02-26 20:43:12.509174+00	82	f	105	3	10
5010	2017-02-26 20:43:12.519121+00	49	f	120	8	11
5011	2017-02-26 20:43:12.529086+00	69	f	104	2	12
5012	2017-02-26 20:43:12.539119+00	218	f	31	3	13
5013	2017-02-26 20:43:14.309904+00	460	f	10	25	15
5014	2017-02-26 20:43:14.364675+00	344	f	13	28	16
5015	2017-02-26 20:43:14.374519+00	48	f	107	1	17
5016	2017-02-26 20:43:14.384326+00	14304	f	5	832	18
5017	2017-02-26 20:43:15.980998+00	44	f	98	0	20
5018	2017-02-26 20:43:16.049022+00	144	f	20	12	21
5019	2017-02-26 20:43:16.066108+00	2622	f	6	97	22
5020	2017-02-26 20:43:16.078542+00	19	f	123	4	23
5021	2017-02-26 20:43:16.088452+00	15	f	125	5	24
5022	2017-02-26 20:43:16.098433+00	51	f	89	13	25
5023	2017-02-26 20:43:16.108275+00	2475	f	92	157	26
5024	2017-02-26 20:43:17.60411+00	633	f	8	27	28
5025	2017-02-26 20:43:19.573779+00	12	f	127	0	30
5026	2017-02-26 20:43:19.657302+00	13	f	128	0	31
5027	2017-02-26 20:43:19.686995+00	2991	f	7	229	32
5028	2017-02-26 20:43:19.698224+00	1276	f	9	45	33
5029	2017-02-26 20:43:19.708032+00	7	f	132	1	34
5030	2017-02-26 20:43:19.717933+00	180	f	11	7	35
5031	2017-02-26 20:43:20.990244+00	3	f	138	0	37
5032	2017-02-26 20:43:21.059041+00	7	f	114	0	38
5033	2017-02-26 20:43:21.071467+00	534	f	12	20	39
5034	2017-02-26 20:43:21.081347+00	411	f	14	21	40
5035	2017-02-26 20:43:21.100184+00	7	f	106	0	41
5036	2017-02-26 20:43:21.111326+00	278	f	16	13	42
5037	2017-02-26 20:43:22.406278+00	8	f	101	0	44
5038	2017-02-26 20:43:22.475376+00	62	f	26	5	45
5039	2017-02-26 20:43:22.492583+00	8	f	99	0	46
5040	2017-02-26 20:43:22.504975+00	3	f	137	0	47
5041	2017-02-26 20:43:25.63607+00	9591	f	15	1044	50
5042	2017-02-26 20:43:25.712791+00	3	f	121	4	51
5043	2017-02-26 20:43:27.232179+00	5	f	100	2	53
5044	2017-02-26 20:43:27.305024+00	5115	f	18	94	54
5045	2017-02-26 20:43:29.023496+00	42	f	34	2	56
5046	2017-02-26 20:43:29.099769+00	1345	f	21	12	57
5047	2017-02-26 20:43:29.171436+00	2784	f	22	149	58
5048	2017-02-26 20:43:32.319073+00	151	f	24	7	61
5049	2017-02-26 20:43:32.377503+00	4	f	102	1	62
5050	2017-02-26 20:43:32.389836+00	232	f	23	5	63
5051	2017-02-26 20:43:32.399797+00	22	f	46	1	64
5052	2017-02-26 20:43:32.409751+00	4479	f	25	289	65
5053	2017-02-26 20:43:32.419747+00	51	f	35	2	66
5054	2017-02-26 20:43:33.704853+00	49	f	30	6	68
5055	2017-02-26 20:43:33.77147+00	6827	f	27	715	69
5056	2017-02-26 20:43:33.783461+00	82	f	29	9	70
5057	2017-02-26 20:43:33.793393+00	87	f	33	10	71
5058	2017-02-26 20:43:33.852723+00	21847	f	28	1782	72
5059	2017-02-26 20:43:35.495766+00	0	f	141	0	73
5060	2017-02-26 20:43:37.462377+00	0	f	142	0	74
5061	2017-02-26 20:43:37.473538+00	0	f	139	1	75
5062	2017-02-26 20:43:37.483138+00	1	f	140	1	76
5063	2017-02-26 20:43:37.493074+00	129	f	32	4	77
5064	2017-02-26 20:43:37.503256+00	0	f	136	0	78
5065	2017-02-26 20:43:37.51292+00	5	f	71	1	79
5066	2017-02-26 20:43:37.532947+00	0	f	133	0	80
5067	2017-02-26 20:43:37.542995+00	1	f	131	0	81
5068	2017-02-26 20:43:37.552876+00	5199	f	36	192	82
5069	2017-02-26 20:43:37.562851+00	11	f	57	3	83
5070	2017-02-26 20:43:37.582937+00	113	f	38	2	84
5071	2017-02-26 20:43:37.592961+00	17	f	49	2	85
5072	2017-02-26 20:43:37.602977+00	6	f	76	4	86
5073	2017-02-26 20:43:37.613051+00	648	f	37	27	87
5074	2017-02-26 20:43:37.62305+00	1	f	126	1	88
5075	2017-02-26 20:43:37.633042+00	15	f	56	38	89
5076	2017-02-26 20:43:37.643086+00	12	f	91	1	90
5077	2017-02-26 20:43:37.653146+00	47	f	43	11	91
5078	2017-02-26 20:43:37.663183+00	1464	f	39	39	92
5079	2017-02-26 20:43:37.673173+00	101	f	41	11	93
5080	2017-02-26 20:43:37.683134+00	6417	f	40	105	94
5081	2017-02-26 20:43:39.369287+00	46	f	44	3	96
5082	2017-02-26 20:43:39.44865+00	0	f	118	0	97
5083	2017-02-26 20:43:39.619657+00	2791	f	42	13	98
5084	2017-02-26 20:43:39.636687+00	59	f	45	4	99
5085	2017-02-26 20:53:12.91426+00	14648	f	88	643	1
5086	2017-02-26 20:53:12.994493+00	446	f	112	15	2
5087	2017-02-26 20:53:13.00943+00	230	f	109	3	4
5088	2017-02-26 20:53:13.024031+00	185	f	110	12	5
5089	2017-02-26 20:53:13.036145+00	103	f	115	5	6
5090	2017-02-26 20:53:13.046148+00	2225	f	4	62	7
5091	2017-02-26 20:53:13.066233+00	84	f	108	5	8
5092	2017-02-26 20:53:13.076145+00	56	f	120	9	9
5093	2017-02-26 20:53:13.086064+00	84	f	105	3	10
5094	2017-02-26 20:53:13.096084+00	29567	t	2	872	11
5095	2017-02-26 20:53:13.106103+00	78	f	104	2	12
5096	2017-02-26 20:53:13.116129+00	224	f	31	3	13
5097	2017-02-26 20:53:14.506367+00	460	f	10	26	15
5098	2017-02-26 20:53:14.578695+00	353	f	13	28	16
5099	2017-02-26 20:53:14.600224+00	48	f	107	1	17
5100	2017-02-26 20:53:14.620589+00	14303	f	5	832	18
5101	2017-02-26 20:53:16.272636+00	42	f	98	0	20
5102	2017-02-26 20:53:16.331753+00	24	f	123	4	21
5103	2017-02-26 20:53:16.344894+00	145	f	20	12	22
5104	2017-02-26 20:53:16.361522+00	2622	f	6	97	23
5105	2017-02-26 20:53:16.375014+00	16	f	125	5	24
5106	2017-02-26 20:53:16.391519+00	15	f	127	1	25
5107	2017-02-26 20:53:16.404944+00	45	f	89	13	26
5108	2017-02-26 20:53:16.414954+00	2474	f	92	157	27
5109	2017-02-26 20:53:17.896394+00	15	f	128	0	29
5110	2017-02-26 20:53:17.97981+00	632	f	8	27	30
5111	2017-02-26 20:53:19.133906+00	11	f	132	1	32
5112	2017-02-26 20:53:19.202978+00	2990	f	7	229	33
5113	2017-02-26 20:53:19.21909+00	1268	f	9	45	34
5114	2017-02-26 20:53:19.232901+00	177	f	11	7	35
5115	2017-02-26 20:53:19.248863+00	6	f	138	0	36
5116	2017-02-26 20:53:20.675359+00	6	f	114	0	38
5117	2017-02-26 20:53:20.747057+00	535	f	12	20	39
5118	2017-02-26 20:53:20.762733+00	408	f	14	21	40
5119	2017-02-26 20:53:20.776513+00	283	f	16	13	41
5120	2017-02-26 20:53:22.078454+00	60	f	26	5	43
5121	2017-02-26 20:53:23.750366+00	7	f	106	0	45
5122	2017-02-26 20:53:23.80509+00	7	f	101	0	46
5123	2017-02-26 20:53:25.578358+00	9588	f	15	1044	48
5124	2017-02-26 20:53:25.649576+00	7	f	99	0	49
5125	2017-02-26 20:53:27.19351+00	4	f	100	2	51
5126	2017-02-26 20:53:27.253724+00	5109	f	18	94	52
5127	2017-02-26 20:53:27.27043+00	1	f	139	1	53
5128	2017-02-26 20:53:29.004498+00	2	f	137	1	55
5129	2017-02-26 20:53:29.098624+00	40	f	34	2	56
5130	2017-02-26 20:53:29.115253+00	4	f	121	4	57
5131	2017-02-26 20:53:29.128387+00	1335	f	21	12	58
5132	2017-02-26 20:53:29.143869+00	2785	f	22	149	59
5133	2017-02-26 20:53:32.295181+00	155	f	24	7	62
5134	2017-02-26 20:53:32.377046+00	2	f	102	1	63
5135	2017-02-26 20:53:32.393468+00	230	f	23	5	64
5136	2017-02-26 20:53:32.406737+00	23	f	46	1	65
5137	2017-02-26 20:53:32.423412+00	4476	f	25	289	66
5138	2017-02-26 20:53:32.436745+00	49	f	35	2	67
5139	2017-02-26 20:53:33.691723+00	49	f	30	6	69
5140	2017-02-26 20:53:33.771213+00	6826	f	27	715	70
5141	2017-02-26 20:53:33.788364+00	81	f	29	9	71
5142	2017-02-26 20:53:33.800587+00	85	f	33	10	72
5143	2017-02-26 20:53:33.817014+00	21851	f	28	1782	73
5144	2017-02-26 20:53:35.803916+00	1	f	143	0	74
5145	2017-02-26 20:53:35.821389+00	0	f	141	2	75
5146	2017-02-26 20:53:35.836026+00	0	f	142	0	76
5147	2017-02-26 20:53:35.852407+00	131	f	32	4	77
5148	2017-02-26 20:53:35.865925+00	0	f	136	0	78
5149	2017-02-26 20:53:35.882377+00	5	f	71	1	79
5150	2017-02-26 20:53:35.895967+00	0	f	133	0	80
5151	2017-02-26 20:53:35.910946+00	1	f	131	0	81
5152	2017-02-26 20:53:35.925918+00	5199	f	36	192	82
5153	2017-02-26 20:53:35.94084+00	9	f	57	3	83
5154	2017-02-26 20:53:35.955878+00	115	f	38	2	84
5155	2017-02-26 20:53:35.971047+00	16	f	49	2	85
5156	2017-02-26 20:53:35.999912+00	6	f	76	4	86
5157	2017-02-26 20:53:36.015794+00	650	f	37	27	87
5158	2017-02-26 20:53:36.02984+00	1	f	126	1	88
5159	2017-02-26 20:53:36.045653+00	16	f	56	38	89
5160	2017-02-26 20:53:36.059854+00	10	f	91	1	90
5161	2017-02-26 20:53:36.069881+00	43	f	43	11	91
5162	2017-02-26 20:53:36.095942+00	1469	f	39	39	92
5163	2017-02-26 20:53:36.110021+00	98	f	41	11	93
5164	2017-02-26 20:53:36.119967+00	6411	f	40	105	94
5165	2017-02-26 20:53:37.662836+00	43	f	44	3	96
5166	2017-02-26 20:53:37.685031+00	1	f	118	0	97
5167	2017-02-26 20:53:37.700749+00	2796	f	42	13	98
5168	2017-02-26 20:53:37.714758+00	58	f	45	4	99
5169	2017-02-26 21:03:12.731851+00	14933	f	88	648	1
5170	2017-02-26 21:03:12.782525+00	514	f	112	16	2
5171	2017-02-26 21:03:12.80005+00	248	f	109	4	4
5172	2017-02-26 21:03:12.842767+00	206	f	110	13	5
5173	2017-02-26 21:03:12.887547+00	114	f	115	5	6
5174	2017-02-26 21:03:12.932792+00	2243	f	4	62	7
5175	2017-02-26 21:03:12.957709+00	69	f	120	10	8
5176	2017-02-26 21:03:12.977687+00	89	f	108	6	9
5177	2017-02-26 21:03:12.992742+00	92	f	105	3	10
5178	2017-02-26 21:03:13.007695+00	29583	t	2	872	11
5179	2017-02-26 21:03:13.022625+00	80	f	104	2	12
5180	2017-02-26 21:03:13.037321+00	231	f	31	4	13
5181	2017-02-26 21:03:14.437979+00	463	f	10	26	15
5182	2017-02-26 21:03:14.660542+00	361	f	13	30	16
5183	2017-02-26 21:03:14.687038+00	51	f	107	1	17
5184	2017-02-26 21:03:14.701607+00	14304	f	5	832	18
5185	2017-02-26 21:03:18.280659+00	27	f	123	4	20
5186	2017-02-26 21:03:18.35173+00	49	f	98	0	21
5187	2017-02-26 21:03:18.366519+00	140	f	20	12	22
5188	2017-02-26 21:03:18.401143+00	18	f	125	5	23
5189	2017-02-26 21:03:18.41629+00	2628	f	6	97	24
5190	2017-02-26 21:03:18.431556+00	15	f	127	1	25
5191	2017-02-26 21:03:18.446358+00	12	f	138	0	26
5192	2017-02-26 21:03:19.790486+00	46	f	89	13	28
5193	2017-02-26 21:03:19.98855+00	2481	f	92	157	29
5194	2017-02-26 21:03:20.150172+00	14	f	128	0	30
5195	2017-02-26 21:03:20.186629+00	630	f	8	27	31
5196	2017-02-26 21:03:21.52616+00	11	f	132	1	33
5197	2017-02-26 21:03:21.595113+00	2996	f	7	229	34
5198	2017-02-26 21:03:21.610322+00	1271	f	9	45	35
5199	2017-02-26 21:03:21.624746+00	181	f	11	7	36
5200	2017-02-26 21:03:23.172231+00	8	f	114	0	38
5201	2017-02-26 21:03:23.229031+00	532	f	12	20	39
5202	2017-02-26 21:03:23.244578+00	409	f	14	21	40
5203	2017-02-26 21:03:23.271596+00	283	f	16	13	41
5204	2017-02-26 21:03:24.670263+00	60	f	26	5	43
5205	2017-02-26 21:03:26.472552+00	7	f	106	0	45
5206	2017-02-26 21:03:26.543363+00	6	f	101	0	46
5207	2017-02-26 21:03:28.32884+00	9590	f	15	1044	48
5208	2017-02-26 21:03:28.473784+00	7	f	99	0	49
5209	2017-02-26 21:03:30.025261+00	5	f	100	2	51
5210	2017-02-26 21:03:30.072747+00	5112	f	18	94	52
5211	2017-02-26 21:03:30.08622+00	43	f	34	2	53
5212	2017-02-26 21:03:30.102441+00	1346	f	21	12	54
5213	2017-02-26 21:03:30.116243+00	2784	f	22	149	55
5214	2017-02-26 21:03:33.31655+00	149	f	24	7	58
5215	2017-02-26 21:03:33.399166+00	229	f	23	5	59
5216	2017-02-26 21:03:33.461419+00	21	f	46	1	60
5217	2017-02-26 21:03:33.474662+00	4472	f	25	289	61
5218	2017-02-26 21:03:33.489564+00	50	f	35	2	62
5219	2017-02-26 21:03:34.838498+00	1	f	121	4	64
5220	2017-02-26 21:03:34.928997+00	47	f	30	6	65
5221	2017-02-26 21:03:34.945379+00	3	f	102	1	66
5222	2017-02-26 21:03:34.958543+00	6824	f	27	715	67
5223	2017-02-26 21:03:34.97533+00	79	f	29	9	68
5224	2017-02-26 21:03:34.988294+00	87	f	33	10	69
5225	2017-02-26 21:03:36.931403+00	1	f	144	1	70
5226	2017-02-26 21:03:36.943893+00	21846	f	28	1782	71
5227	2017-02-26 21:03:36.960819+00	0	f	141	2	72
5228	2017-02-26 21:03:36.973621+00	0	f	139	1	73
5229	2017-02-26 21:03:36.988621+00	126	f	32	4	74
5230	2017-02-26 21:03:38.613059+00	1	f	137	1	76
5231	2017-02-26 21:03:38.891221+00	0	f	133	0	77
5232	2017-02-26 21:03:38.906033+00	0	f	131	0	78
5233	2017-02-26 21:03:38.918618+00	5199	f	36	192	79
5234	2017-02-26 21:03:38.933627+00	7	f	71	1	80
5235	2017-02-26 21:03:38.955821+00	12	f	57	3	81
5236	2017-02-26 21:03:38.975851+00	115	f	38	2	82
5237	2017-02-26 21:03:38.98854+00	18	f	49	2	83
5238	2017-02-26 21:03:39.005836+00	655	f	37	27	84
5239	2017-02-26 21:03:39.018555+00	0	f	126	1	85
5240	2017-02-26 21:03:39.033716+00	16	f	56	38	86
5241	2017-02-26 21:03:39.048616+00	8	f	91	1	87
5242	2017-02-26 21:03:39.066041+00	44	f	43	11	88
5243	2017-02-26 21:03:39.078759+00	1464	f	39	39	89
5244	2017-02-26 21:03:39.093756+00	98	f	41	11	90
5245	2017-02-26 21:03:39.108796+00	6407	f	40	105	91
5246	2017-02-26 21:03:40.522237+00	5	f	76	4	93
5247	2017-02-26 21:03:40.592939+00	49	f	44	3	94
5248	2017-02-26 21:03:40.61286+00	2	f	118	0	95
5249	2017-02-26 21:03:40.627898+00	2797	f	42	13	96
5250	2017-02-26 21:03:40.642826+00	21	f	61	2	97
5251	2017-02-26 21:03:40.657864+00	57	f	45	4	98
5252	2017-02-26 21:13:14.03134+00	15213	f	88	664	1
5253	2017-02-26 21:13:14.118131+00	585	f	112	17	2
5254	2017-02-26 21:13:14.13555+00	274	f	109	3	4
5255	2017-02-26 21:13:14.147816+00	219	f	110	14	5
5256	2017-02-26 21:13:14.162504+00	120	f	115	5	6
5257	2017-02-26 21:13:14.177664+00	90	f	120	10	7
5258	2017-02-26 21:13:14.192665+00	2247	f	4	62	8
5259	2017-02-26 21:13:14.223176+00	98	f	105	3	9
5260	2017-02-26 21:13:14.238332+00	86	f	108	7	10
5261	2017-02-26 21:13:14.253093+00	91	f	104	2	11
5262	2017-02-26 21:13:14.268253+00	29580	t	2	872	12
5263	2017-02-26 21:13:14.28333+00	231	f	31	4	13
5264	2017-02-26 21:13:15.651841+00	470	f	10	27	15
5265	2017-02-26 21:13:15.722622+00	362	f	13	30	16
5266	2017-02-26 21:13:15.737412+00	53	f	107	1	17
5267	2017-02-26 21:13:15.752334+00	28	f	123	4	18
5268	2017-02-26 21:13:15.767369+00	52	f	98	0	19
5269	2017-02-26 21:13:15.782341+00	14306	f	5	832	20
5270	2017-02-26 21:13:17.480189+00	24	f	125	5	22
5271	2017-02-26 21:13:17.562699+00	20	f	127	1	23
5272	2017-02-26 21:13:17.576963+00	147	f	20	12	24
5273	2017-02-26 21:13:17.608004+00	16	f	138	2	25
5274	2017-02-26 21:13:17.636153+00	17	f	128	0	26
5275	2017-02-26 21:13:17.652365+00	14	f	132	1	27
5276	2017-02-26 21:13:19.171769+00	2630	f	6	97	29
5277	2017-02-26 21:13:19.226891+00	51	f	89	15	30
5278	2017-02-26 21:13:19.241299+00	2481	f	92	157	31
5279	2017-02-26 21:13:19.256537+00	633	f	8	27	32
5280	2017-02-26 21:13:20.812481+00	3000	f	7	229	34
5281	2017-02-26 21:13:20.881105+00	1279	f	9	45	35
5282	2017-02-26 21:13:20.895002+00	181	f	11	7	36
5283	2017-02-26 21:13:22.395339+00	9	f	114	0	38
5284	2017-02-26 21:13:24.278585+00	8	f	101	0	40
5285	2017-02-26 21:13:24.421742+00	539	f	12	20	41
5286	2017-02-26 21:13:24.440558+00	413	f	14	21	42
5287	2017-02-26 21:13:24.454243+00	6	f	106	0	43
5288	2017-02-26 21:13:24.470457+00	278	f	16	13	44
5289	2017-02-26 21:13:24.48444+00	10	f	99	0	45
5290	2017-02-26 21:13:25.802428+00	3	f	139	1	47
5291	2017-02-26 21:13:25.868166+00	60	f	26	5	48
5292	2017-02-26 21:13:27.355283+00	6	f	100	2	50
5293	2017-02-26 21:13:29.020164+00	9591	f	15	1044	52
5294	2017-02-26 21:13:29.09654+00	3	f	144	1	53
5295	2017-02-26 21:13:29.112736+00	5118	f	18	94	54
5296	2017-02-26 21:13:29.126165+00	2	f	141	2	55
5297	2017-02-26 21:13:29.14261+00	41	f	34	2	56
5298	2017-02-26 21:13:29.15596+00	1343	f	21	12	57
5299	2017-02-26 21:13:29.165817+00	2779	f	22	149	58
5300	2017-02-26 21:13:32.284016+00	154	f	24	7	61
5301	2017-02-26 21:13:32.354593+00	5	f	102	1	62
5302	2017-02-26 21:13:32.370792+00	231	f	23	5	63
5303	2017-02-26 21:13:32.384002+00	23	f	46	1	64
5304	2017-02-26 21:13:32.393968+00	53	f	35	2	65
5305	2017-02-26 21:13:32.414188+00	4477	f	25	289	66
5306	2017-02-26 21:13:33.699425+00	49	f	30	6	68
5307	2017-02-26 21:13:33.778482+00	6834	f	27	715	69
5308	2017-02-26 21:13:35.671802+00	0	f	145	1	70
5309	2017-02-26 21:13:35.693186+00	82	f	29	9	71
5310	2017-02-26 21:13:35.702841+00	85	f	33	10	72
5311	2017-02-26 21:13:35.712931+00	21845	f	28	1782	73
5312	2017-02-26 21:13:35.790607+00	128	f	32	4	74
5313	2017-02-26 21:13:37.381059+00	0	f	133	0	76
5314	2017-02-26 21:13:37.447806+00	0	f	131	0	77
5315	2017-02-26 21:13:37.464959+00	5200	f	36	192	78
5316	2017-02-26 21:13:37.47761+00	5	f	71	1	79
5317	2017-02-26 21:13:37.494885+00	11	f	57	3	80
5318	2017-02-26 21:13:37.507643+00	15	f	56	38	81
5319	2017-02-26 21:13:37.517618+00	118	f	38	2	82
5320	2017-02-26 21:13:37.546243+00	17	f	49	2	83
5321	2017-02-26 21:13:37.556087+00	653	f	37	27	84
5322	2017-02-26 21:13:37.576187+00	0	f	126	1	85
5323	2017-02-26 21:13:37.585923+00	12	f	91	1	86
5324	2017-02-26 21:13:37.595954+00	47	f	43	11	87
5325	2017-02-26 21:13:37.605966+00	1465	f	39	39	88
5326	2017-02-26 21:13:37.615875+00	98	f	41	11	89
5327	2017-02-26 21:13:37.625984+00	6417	f	40	105	90
5328	2017-02-26 21:13:39.263944+00	0	f	121	4	92
5329	2017-02-26 21:13:39.341338+00	4	f	76	4	93
5330	2017-02-26 21:13:39.351118+00	45	f	44	3	94
5331	2017-02-26 21:13:39.361045+00	1	f	118	0	95
5332	2017-02-26 21:13:39.370946+00	2793	f	42	13	96
5333	2017-02-26 21:13:39.380917+00	21	f	61	2	97
5334	2017-02-26 21:13:39.390958+00	60	f	45	4	98
5335	2017-02-26 21:23:13.543068+00	15439	f	88	669	1
5336	2017-02-26 21:23:13.612471+00	663	f	112	19	2
5337	2017-02-26 21:23:13.651626+00	306	f	109	3	4
5338	2017-02-26 21:23:13.666215+00	244	f	110	15	5
5339	2017-02-26 21:23:13.681243+00	134	f	115	6	6
5340	2017-02-26 21:23:13.696055+00	109	f	120	11	7
5341	2017-02-26 21:23:13.711175+00	2258	f	4	62	8
5342	2017-02-26 21:23:13.746376+00	108	f	105	3	9
5343	2017-02-26 21:23:13.761464+00	93	f	108	8	10
5344	2017-02-26 21:23:13.776643+00	95	f	104	2	11
5345	2017-02-26 21:23:13.791469+00	29577	t	2	872	12
5346	2017-02-26 21:23:15.221867+00	235	f	31	4	14
5347	2017-02-26 21:23:15.293185+00	472	f	10	28	15
5348	2017-02-26 21:23:15.305896+00	375	f	13	30	16
5349	2017-02-26 21:23:15.320707+00	47	f	107	1	17
5350	2017-02-26 21:23:15.335793+00	31	f	123	4	18
5351	2017-02-26 21:23:15.350611+00	53	f	98	0	19
5352	2017-02-26 21:23:15.365744+00	14305	f	5	832	20
5353	2017-02-26 21:23:17.078778+00	19	f	138	3	22
5354	2017-02-26 21:23:17.097521+00	22	f	127	2	23
5355	2017-02-26 21:23:17.110533+00	24	f	125	5	24
5356	2017-02-26 21:23:18.586315+00	150	f	20	12	26
5357	2017-02-26 21:23:18.672187+00	19	f	132	1	27
5358	2017-02-26 21:23:18.689539+00	20	f	128	0	28
5359	2017-02-26 21:23:18.704862+00	2626	f	6	97	29
5360	2017-02-26 21:23:18.721736+00	50	f	89	15	30
5361	2017-02-26 21:23:18.73478+00	2477	f	92	157	31
5362	2017-02-26 21:23:18.749212+00	639	f	8	27	32
5363	2017-02-26 21:23:20.097945+00	2990	f	7	229	34
5364	2017-02-26 21:23:20.166093+00	1276	f	9	45	35
5365	2017-02-26 21:23:21.621198+00	183	f	11	7	37
5366	2017-02-26 21:23:21.689296+00	6	f	139	1	38
5367	2017-02-26 21:23:21.702548+00	10	f	114	0	39
5368	2017-02-26 21:23:23.370184+00	5	f	141	3	41
5369	2017-02-26 21:23:23.42398+00	10	f	101	0	42
5370	2017-02-26 21:23:23.437169+00	9	f	99	0	43
5371	2017-02-26 21:23:23.453545+00	533	f	12	20	44
5372	2017-02-26 21:23:23.467025+00	409	f	14	23	45
5373	2017-02-26 21:23:23.483562+00	8	f	106	0	46
5374	2017-02-26 21:23:23.496925+00	283	f	16	13	47
5375	2017-02-26 21:23:24.94087+00	64	f	26	5	49
5376	2017-02-26 21:23:26.578747+00	7	f	100	2	51
5377	2017-02-26 21:23:28.19263+00	9587	f	15	1045	53
5378	2017-02-26 21:23:28.56604+00	5112	f	18	94	54
5379	2017-02-26 21:23:28.621405+00	44	f	34	2	55
5380	2017-02-26 21:23:28.641097+00	1342	f	21	12	56
5381	2017-02-26 21:23:28.656881+00	2784	f	22	149	57
5382	2017-02-26 21:23:31.825503+00	154	f	24	7	60
5383	2017-02-26 21:23:31.899481+00	5	f	102	1	61
5384	2017-02-26 21:23:31.915041+00	234	f	23	5	62
5385	2017-02-26 21:23:31.929004+00	26	f	46	1	63
5386	2017-02-26 21:23:31.945002+00	49	f	35	2	64
5387	2017-02-26 21:23:31.958936+00	4482	f	25	289	65
5388	2017-02-26 21:23:33.30035+00	50	f	30	6	67
5389	2017-02-26 21:23:36.031141+00	1	f	146	0	68
5390	2017-02-26 21:23:37.898399+00	0	f	147	1	69
5391	2017-02-26 21:23:39.607326+00	1	f	148	0	70
5392	2017-02-26 21:23:39.622982+00	6820	f	27	715	71
5393	2017-02-26 21:23:39.639619+00	79	f	29	9	72
5394	2017-02-26 21:23:39.655099+00	87	f	33	11	73
5395	2017-02-26 21:23:39.66932+00	2	f	144	1	74
5396	2017-02-26 21:23:39.684824+00	21845	f	28	1783	75
5397	2017-02-26 21:23:39.69941+00	0	f	143	0	76
5398	2017-02-26 21:23:39.714839+00	128	f	32	4	77
5399	2017-02-26 21:23:41.118241+00	5	f	71	1	79
5400	2017-02-26 21:23:41.284956+00	0	f	133	0	80
5401	2017-02-26 21:23:41.299705+00	0	f	131	0	81
5402	2017-02-26 21:23:41.31424+00	13	f	57	3	82
5403	2017-02-26 21:23:41.329551+00	20	f	56	38	83
5404	2017-02-26 21:23:41.344104+00	5205	f	36	192	84
5405	2017-02-26 21:23:41.359553+00	16	f	49	2	85
5406	2017-02-26 21:23:41.374102+00	10	f	91	1	86
5407	2017-02-26 21:23:41.389576+00	120	f	38	2	87
5408	2017-02-26 21:23:41.404166+00	652	f	37	27	88
5409	2017-02-26 21:23:41.41961+00	1	f	126	1	89
5410	2017-02-26 21:23:41.434324+00	47	f	43	11	90
5411	2017-02-26 21:23:41.449715+00	1464	f	39	39	91
5412	2017-02-26 21:23:41.464351+00	98	f	41	11	92
5413	2017-02-26 21:23:41.479742+00	6407	f	40	105	93
5414	2017-02-26 21:23:43.026346+00	3	f	76	4	95
5415	2017-02-26 21:23:43.094498+00	46	f	44	3	96
5416	2017-02-26 21:23:43.109567+00	0	f	118	0	97
5417	2017-02-26 21:23:43.124275+00	2797	f	42	13	98
5418	2017-02-26 21:23:43.138976+00	20	f	61	2	99
5419	2017-02-26 21:33:13.368216+00	15688	f	88	676	1
5420	2017-02-26 21:33:13.445216+00	749	f	112	23	2
5421	2017-02-26 21:33:13.462643+00	344	f	109	3	4
5422	2017-02-26 21:33:13.47933+00	267	f	110	15	5
5423	2017-02-26 21:33:13.494952+00	136	f	120	11	6
5424	2017-02-26 21:33:13.509329+00	148	f	115	7	7
5425	2017-02-26 21:33:13.524866+00	128	f	105	3	8
5426	2017-02-26 21:33:13.539227+00	2280	f	4	62	9
5427	2017-02-26 21:33:13.55482+00	104	f	108	10	10
5428	2017-02-26 21:33:13.569189+00	104	f	104	3	11
5429	2017-02-26 21:33:13.584758+00	29588	t	2	872	12
5430	2017-02-26 21:33:14.912593+00	242	f	31	4	14
5431	2017-02-26 21:33:14.993753+00	38	f	123	4	15
5432	2017-02-26 21:33:15.008913+00	478	f	10	30	16
5433	2017-02-26 21:33:15.023489+00	375	f	13	30	17
5434	2017-02-26 21:33:15.038935+00	24	f	138	3	18
5435	2017-02-26 21:33:15.053343+00	55	f	107	1	19
5436	2017-02-26 21:33:15.069397+00	26	f	127	3	20
5437	2017-02-26 21:33:15.083793+00	25	f	125	5	21
5438	2017-02-26 21:33:15.099142+00	56	f	98	0	22
5439	2017-02-26 21:33:15.114355+00	22	f	132	1	23
5440	2017-02-26 21:33:16.905057+00	14318	f	5	832	25
5441	2017-02-26 21:33:16.933768+00	25	f	128	0	26
5442	2017-02-26 21:33:16.948334+00	148	f	20	13	27
5443	2017-02-26 21:33:18.521355+00	2628	f	6	97	29
5444	2017-02-26 21:33:18.583184+00	50	f	89	15	30
5445	2017-02-26 21:33:18.598139+00	2488	f	92	157	31
5446	2017-02-26 21:33:18.612842+00	636	f	8	27	32
5447	2017-02-26 21:33:20.014005+00	9	f	139	1	34
5448	2017-02-26 21:33:20.092227+00	2995	f	7	229	35
5449	2017-02-26 21:33:20.106835+00	1278	f	9	45	36
5450	2017-02-26 21:33:20.122126+00	8	f	141	2	37
5451	2017-02-26 21:33:20.136697+00	182	f	11	7	38
5452	2017-02-26 21:33:21.648776+00	10	f	114	0	40
5453	2017-02-26 21:33:23.455984+00	13	f	99	0	42
5454	2017-02-26 21:33:23.626684+00	9	f	101	0	43
5455	2017-02-26 21:33:23.681176+00	540	f	12	20	44
5456	2017-02-26 21:33:23.696356+00	416	f	14	23	45
5457	2017-02-26 21:33:23.736342+00	6	f	106	0	46
5458	2017-02-26 21:33:23.750614+00	281	f	16	13	47
5459	2017-02-26 21:33:25.047791+00	63	f	26	5	49
5460	2017-02-26 21:33:26.822786+00	9	f	100	2	51
5461	2017-02-26 21:33:30.809567+00	9585	f	15	1045	54
5462	2017-02-26 21:33:30.889562+00	44	f	34	2	55
5463	2017-02-26 21:33:30.905046+00	5119	f	18	94	56
5464	2017-02-26 21:33:30.919243+00	1347	f	21	12	57
5465	2017-02-26 21:33:30.934916+00	2784	f	22	149	58
5466	2017-02-26 21:33:30.94922+00	1	f	131	0	59
5467	2017-02-26 21:33:33.925341+00	153	f	24	7	62
5468	2017-02-26 21:33:33.977285+00	5	f	102	1	63
5469	2017-02-26 21:33:33.993028+00	229	f	23	5	64
5470	2017-02-26 21:33:34.007053+00	23	f	46	1	65
5471	2017-02-26 21:33:34.0229+00	52	f	35	2	66
5472	2017-02-26 21:33:34.036991+00	4477	f	25	289	67
5473	2017-02-26 21:33:35.236318+00	48	f	30	6	69
5474	2017-02-26 21:33:35.307253+00	0	f	146	1	70
5475	2017-02-26 21:33:35.324335+00	2	f	148	0	71
5476	2017-02-26 21:33:35.340553+00	6824	f	27	715	72
5477	2017-02-26 21:33:35.356385+00	81	f	29	9	73
5478	2017-02-26 21:33:35.370449+00	91	f	33	11	74
5479	2017-02-26 21:33:35.386566+00	8	f	71	1	75
5480	2017-02-26 21:33:35.400459+00	2	f	144	1	76
5481	2017-02-26 21:33:35.416375+00	21848	f	28	1783	77
5482	2017-02-26 21:33:35.430463+00	0	f	143	1	78
5483	2017-02-26 21:33:35.446431+00	131	f	32	4	79
5484	2017-02-26 21:33:35.460515+00	0	f	133	0	80
5485	2017-02-26 21:33:35.476383+00	21	f	56	38	81
5486	2017-02-26 21:33:35.490529+00	10	f	57	3	82
5487	2017-02-26 21:33:35.50655+00	5203	f	36	192	83
5488	2017-02-26 21:33:35.520595+00	15	f	49	2	84
5489	2017-02-26 21:33:35.536962+00	11	f	91	1	85
5490	2017-02-26 21:33:35.550756+00	117	f	38	2	86
5491	2017-02-26 21:33:35.566723+00	649	f	37	27	87
5492	2017-02-26 21:33:35.580749+00	1	f	126	1	88
5493	2017-02-26 21:33:35.59446+00	45	f	43	11	89
5494	2017-02-26 21:33:35.606808+00	1461	f	39	39	90
5495	2017-02-26 21:33:35.620812+00	100	f	41	11	91
5496	2017-02-26 21:33:35.63461+00	6405	f	40	105	92
5497	2017-02-26 21:33:37.205584+00	5	f	76	4	94
5498	2017-02-26 21:33:37.27619+00	44	f	44	3	95
5499	2017-02-26 21:33:39.238862+00	0	f	149	2	96
5500	2017-02-26 21:33:39.25822+00	1	f	118	0	97
5501	2017-02-26 21:33:39.274358+00	2796	f	42	13	98
5502	2017-02-26 21:33:39.290704+00	19	f	61	2	99
5503	2017-02-26 21:43:14.31493+00	15925	f	88	685	1
5504	2017-02-26 21:43:14.401587+00	852	f	112	26	2
5505	2017-02-26 21:43:14.41642+00	366	f	109	5	3
5506	2017-02-26 21:43:14.473454+00	298	f	110	16	5
5507	2017-02-26 21:43:14.490139+00	151	f	120	11	6
5508	2017-02-26 21:43:14.500139+00	172	f	115	7	7
5509	2017-02-26 21:43:14.510174+00	128	f	105	3	8
5510	2017-02-26 21:43:14.519999+00	114	f	108	10	9
5511	2017-02-26 21:43:14.529918+00	2285	f	4	62	10
5512	2017-02-26 21:43:14.539977+00	110	f	104	3	11
5513	2017-02-26 21:43:14.55002+00	29578	t	2	872	12
5514	2017-02-26 21:43:15.935203+00	244	f	31	4	14
5515	2017-02-26 21:43:16.004681+00	43	f	123	5	15
5516	2017-02-26 21:43:16.014511+00	478	f	10	32	16
5517	2017-02-26 21:43:16.024393+00	374	f	13	30	17
5518	2017-02-26 21:43:16.034196+00	26	f	138	4	18
5519	2017-02-26 21:43:16.044204+00	55	f	107	3	19
5520	2017-02-26 21:43:16.054785+00	57	f	98	0	20
5521	2017-02-26 21:43:16.06472+00	23	f	132	1	21
5522	2017-02-26 21:43:16.074805+00	25	f	127	3	22
5523	2017-02-26 21:43:17.766637+00	14309	f	5	832	24
5524	2017-02-26 21:43:17.837348+00	26	f	125	5	25
5525	2017-02-26 21:43:17.856609+00	22	f	128	0	26
5526	2017-02-26 21:43:17.89718+00	154	f	20	13	27
5527	2017-02-26 21:43:19.39154+00	2631	f	6	97	29
5528	2017-02-26 21:43:19.432075+00	52	f	89	15	30
5529	2017-02-26 21:43:19.453275+00	2490	f	92	157	31
5530	2017-02-26 21:43:19.463295+00	637	f	8	27	32
5531	2017-02-26 21:43:20.801752+00	10	f	141	2	34
5532	2017-02-26 21:43:20.874922+00	2996	f	7	229	35
5533	2017-02-26 21:43:20.88724+00	1284	f	9	45	36
5534	2017-02-26 21:43:20.897072+00	7	f	139	1	37
5535	2017-02-26 21:43:20.906976+00	184	f	11	7	38
5536	2017-02-26 21:43:22.939435+00	10	f	114	0	40
5537	2017-02-26 21:43:23.010119+00	12	f	101	0	41
5538	2017-02-26 21:43:23.03279+00	11	f	99	0	42
5539	2017-02-26 21:43:24.749997+00	536	f	12	20	44
5540	2017-02-26 21:43:24.85833+00	413	f	14	23	45
5541	2017-02-26 21:43:24.875055+00	280	f	16	13	46
5542	2017-02-26 21:43:26.209699+00	61	f	26	5	48
5543	2017-02-26 21:43:27.840344+00	9	f	100	2	50
5544	2017-02-26 21:43:31.012768+00	9591	f	15	1045	53
5545	2017-02-26 21:43:31.070798+00	6	f	106	0	54
5546	2017-02-26 21:43:31.084042+00	47	f	34	2	55
5547	2017-02-26 21:43:31.100543+00	5118	f	18	94	56
5548	2017-02-26 21:43:31.114029+00	6	f	102	1	57
5549	2017-02-26 21:43:31.130555+00	1341	f	21	12	58
5550	2017-02-26 21:43:31.143835+00	2784	f	22	149	59
5551	2017-02-26 21:43:31.153958+00	1	f	131	0	60
5552	2017-02-26 21:43:34.314561+00	152	f	24	7	63
5553	2017-02-26 21:43:34.338823+00	235	f	23	5	64
5554	2017-02-26 21:43:34.3523+00	26	f	46	1	65
5555	2017-02-26 21:43:34.368581+00	53	f	35	2	66
5556	2017-02-26 21:43:34.382314+00	4473	f	25	289	67
5557	2017-02-26 21:43:35.674325+00	48	f	30	6	69
5558	2017-02-26 21:43:35.756697+00	0	f	146	2	70
5559	2017-02-26 21:43:35.772688+00	2	f	148	0	71
5560	2017-02-26 21:43:35.786317+00	6826	f	27	715	72
5561	2017-02-26 21:43:35.802686+00	81	f	29	9	73
5562	2017-02-26 21:43:35.816309+00	87	f	33	11	74
5563	2017-02-26 21:43:35.832408+00	8	f	71	1	75
5564	2017-02-26 21:43:35.8463+00	2	f	144	1	76
5565	2017-02-26 21:43:35.862406+00	21854	f	28	1785	77
5566	2017-02-26 21:43:35.876239+00	0	f	143	1	78
5567	2017-02-26 21:43:35.886259+00	130	f	32	4	79
5568	2017-02-26 21:43:35.896208+00	0	f	133	0	80
5569	2017-02-26 21:43:35.906298+00	18	f	56	38	81
5570	2017-02-26 21:43:35.916368+00	13	f	57	3	82
5571	2017-02-26 21:43:35.926399+00	5205	f	36	192	83
5572	2017-02-26 21:43:35.936425+00	16	f	49	2	84
5573	2017-02-26 21:43:35.946434+00	13	f	91	1	85
5574	2017-02-26 21:43:35.956368+00	118	f	38	2	86
5575	2017-02-26 21:43:35.966362+00	654	f	37	28	87
5576	2017-02-26 21:43:35.976346+00	1	f	126	1	88
5577	2017-02-26 21:43:35.986406+00	46	f	43	11	89
5578	2017-02-26 21:43:35.996477+00	1466	f	39	39	90
5579	2017-02-26 21:43:36.006709+00	99	f	41	11	91
5580	2017-02-26 21:43:36.053303+00	6418	f	40	105	92
5581	2017-02-26 21:43:37.579804+00	3	f	76	4	94
5582	2017-02-26 21:43:37.657715+00	44	f	44	3	95
5583	2017-02-26 21:43:37.671628+00	0	f	118	0	96
5584	2017-02-26 21:43:37.687625+00	2800	f	42	13	97
5585	2017-02-26 21:43:37.701568+00	19	f	61	2	98
5586	2017-02-26 21:43:37.717458+00	58	f	45	4	99
5587	2017-02-26 21:53:14.578699+00	16133	f	88	696	1
5588	2017-02-26 21:53:14.648776+00	981	f	112	30	2
5589	2017-02-26 21:53:14.664611+00	403	f	109	6	3
5590	2017-02-26 21:53:14.683815+00	322	f	110	18	5
5591	2017-02-26 21:53:14.698181+00	171	f	120	17	6
5592	2017-02-26 21:53:14.714632+00	178	f	115	7	7
5593	2017-02-26 21:53:14.731096+00	148	f	105	4	8
5594	2017-02-26 21:53:14.744604+00	130	f	108	10	9
5595	2017-02-26 21:53:14.758155+00	2303	f	4	62	10
5596	2017-02-26 21:53:14.78563+00	124	f	104	3	11
5597	2017-02-26 21:53:16.186887+00	52	f	123	5	13
5598	2017-02-26 21:53:16.255804+00	29582	t	2	873	14
5599	2017-02-26 21:53:16.269733+00	253	f	31	4	15
5600	2017-02-26 21:53:16.28551+00	30	f	138	4	16
5601	2017-02-26 21:53:16.299631+00	485	f	10	32	17
5602	2017-02-26 21:53:16.315462+00	31	f	132	1	18
5603	2017-02-26 21:53:16.329696+00	385	f	13	30	19
5604	2017-02-26 21:53:16.345392+00	62	f	107	3	20
5605	2017-02-26 21:53:16.376449+00	31	f	127	3	21
5606	2017-02-26 21:53:16.400518+00	30	f	128	0	22
5607	2017-02-26 21:53:16.416062+00	30	f	125	5	23
5608	2017-02-26 21:53:16.430396+00	57	f	98	0	24
5609	2017-02-26 21:53:18.231138+00	14307	f	5	832	26
5610	2017-02-26 21:53:19.671905+00	153	f	20	13	28
5611	2017-02-26 21:53:19.72916+00	2632	f	6	97	29
5612	2017-02-26 21:53:19.744651+00	52	f	89	16	30
5613	2017-02-26 21:53:19.758863+00	2486	f	92	158	31
5614	2017-02-26 21:53:19.774537+00	640	f	8	27	32
5615	2017-02-26 21:53:21.140581+00	10	f	141	2	34
5616	2017-02-26 21:53:21.208539+00	2994	f	7	229	35
5617	2017-02-26 21:53:21.228357+00	1281	f	9	45	36
5618	2017-02-26 21:53:21.242441+00	8	f	139	2	37
5619	2017-02-26 21:53:21.258123+00	183	f	11	7	38
5620	2017-02-26 21:53:22.709006+00	12	f	114	0	40
5621	2017-02-26 21:53:22.782741+00	10	f	101	0	41
5622	2017-02-26 21:53:24.415682+00	11	f	99	0	43
5623	2017-02-26 21:53:26.263408+00	535	f	12	20	45
5624	2017-02-26 21:53:26.416335+00	412	f	14	23	46
5625	2017-02-26 21:53:26.431837+00	283	f	16	13	47
5626	2017-02-26 21:53:26.445762+00	66	f	26	5	48
5627	2017-02-26 21:53:29.491917+00	6	f	106	0	51
5628	2017-02-26 21:53:31.145504+00	9591	f	15	1045	53
5629	2017-02-26 21:53:31.294792+00	5	f	100	2	54
5630	2017-02-26 21:53:31.34857+00	45	f	34	2	55
5631	2017-02-26 21:53:31.363896+00	5122	f	18	94	56
5632	2017-02-26 21:53:31.381081+00	5	f	102	1	57
5633	2017-02-26 21:53:31.393769+00	1343	f	21	12	58
5634	2017-02-26 21:53:31.408091+00	2782	f	22	149	59
5635	2017-02-26 21:53:31.423691+00	1	f	131	0	60
5636	2017-02-26 21:53:34.415959+00	150	f	24	7	63
5637	2017-02-26 21:53:34.471763+00	231	f	23	5	64
5638	2017-02-26 21:53:34.48602+00	27	f	46	1	65
5639	2017-02-26 21:53:34.501561+00	55	f	35	2	66
5640	2017-02-26 21:53:34.519608+00	4478	f	25	289	67
5641	2017-02-26 21:53:35.84179+00	53	f	30	6	69
5642	2017-02-26 21:53:35.915887+00	0	f	146	2	70
5643	2017-02-26 21:53:35.92984+00	2	f	148	0	71
5644	2017-02-26 21:53:35.945318+00	6826	f	27	715	72
5645	2017-02-26 21:53:35.959684+00	83	f	29	9	73
5646	2017-02-26 21:53:35.975222+00	86	f	33	11	74
5647	2017-02-26 21:53:35.98968+00	6	f	71	1	75
5648	2017-02-26 21:53:36.00534+00	2	f	144	1	76
5649	2017-02-26 21:53:36.019693+00	21857	f	28	1785	77
5650	2017-02-26 21:53:36.035329+00	125	f	32	4	78
5651	2017-02-26 21:53:36.049729+00	0	f	133	0	79
5652	2017-02-26 21:53:36.065468+00	19	f	56	38	80
5653	2017-02-26 21:53:36.07996+00	10	f	57	3	81
5654	2017-02-26 21:53:36.095521+00	5199	f	36	192	82
5655	2017-02-26 21:53:36.109922+00	18	f	49	2	83
5656	2017-02-26 21:53:36.125508+00	11	f	91	1	84
5657	2017-02-26 21:53:36.14001+00	116	f	38	2	85
5658	2017-02-26 21:53:36.155568+00	653	f	37	28	86
5659	2017-02-26 21:53:36.170112+00	1	f	126	1	87
5660	2017-02-26 21:53:36.185642+00	47	f	43	11	88
5661	2017-02-26 21:53:36.200201+00	1466	f	39	39	89
5662	2017-02-26 21:53:36.215615+00	96	f	41	11	90
5663	2017-02-26 21:53:36.230197+00	6412	f	40	105	91
5664	2017-02-26 21:53:37.772249+00	4	f	76	4	93
5665	2017-02-26 21:53:37.830887+00	45	f	44	3	94
5666	2017-02-26 21:53:37.845067+00	22	f	61	2	95
5667	2017-02-26 21:53:37.860526+00	0	f	118	0	96
5668	2017-02-26 21:53:37.874914+00	16	f	60	5	97
5669	2017-02-26 21:53:37.89041+00	2796	f	42	13	98
5670	2017-02-26 21:53:37.904861+00	56	f	45	4	99
5671	2017-02-26 22:03:14.247284+00	16349	f	88	708	1
5672	2017-02-26 22:03:14.318233+00	1116	f	112	31	2
5673	2017-02-26 22:03:14.3306+00	450	f	109	6	3
5674	2017-02-26 22:03:14.34724+00	359	f	110	19	4
5675	2017-02-26 22:03:14.363628+00	195	f	120	19	6
5676	2017-02-26 22:03:14.380469+00	200	f	115	8	7
5677	2017-02-26 22:03:14.390534+00	160	f	105	4	8
5678	2017-02-26 22:03:14.400445+00	126	f	108	10	9
5679	2017-02-26 22:03:14.410461+00	128	f	104	3	10
5680	2017-02-26 22:03:14.420444+00	2315	f	4	62	11
5681	2017-02-26 22:03:14.430503+00	62	f	123	5	12
5682	2017-02-26 22:03:15.794803+00	29591	t	2	873	14
5683	2017-02-26 22:03:15.864835+00	38	f	132	1	15
5684	2017-02-26 22:03:15.881511+00	262	f	31	4	16
5685	2017-02-26 22:03:15.894962+00	33	f	138	4	17
5686	2017-02-26 22:03:15.929196+00	35	f	127	3	18
5687	2017-02-26 22:03:15.952045+00	64	f	107	3	19
5688	2017-02-26 22:03:15.965006+00	488	f	10	32	20
5689	2017-02-26 22:03:15.974897+00	392	f	13	30	21
5690	2017-02-26 22:03:15.984877+00	32	f	128	0	22
5691	2017-02-26 22:03:15.994972+00	31	f	125	5	23
5692	2017-02-26 22:03:16.004833+00	60	f	98	0	24
5693	2017-02-26 22:03:17.725013+00	14318	f	5	832	26
5694	2017-02-26 22:03:19.501293+00	156	f	20	13	28
5695	2017-02-26 22:03:19.584774+00	15	f	141	2	29
5696	2017-02-26 22:03:19.60196+00	55	f	89	16	30
5697	2017-02-26 22:03:19.61455+00	2625	f	6	97	31
5698	2017-02-26 22:03:19.624571+00	2487	f	92	158	32
5699	2017-02-26 22:03:19.634369+00	636	f	8	27	33
5700	2017-02-26 22:03:20.925938+00	10	f	139	2	35
5701	2017-02-26 22:03:20.998016+00	2998	f	7	229	36
5702	2017-02-26 22:03:21.007497+00	1279	f	9	45	37
5703	2017-02-26 22:03:21.017468+00	184	f	11	7	38
5704	2017-02-26 22:03:22.439029+00	14	f	114	0	40
5705	2017-02-26 22:03:22.501931+00	12	f	101	0	41
5706	2017-02-26 22:03:24.16653+00	10	f	99	0	43
5707	2017-02-26 22:03:25.76715+00	536	f	12	20	45
5708	2017-02-26 22:03:25.820172+00	420	f	14	23	46
5709	2017-02-26 22:03:25.830131+00	281	f	16	13	47
5710	2017-02-26 22:03:25.840005+00	70	f	26	5	48
5711	2017-02-26 22:03:28.951375+00	8	f	100	2	51
5712	2017-02-26 22:03:29.018484+00	9587	f	15	1045	52
5713	2017-02-26 22:03:30.755565+00	6	f	106	0	54
5714	2017-02-26 22:03:30.874643+00	6	f	102	1	55
5715	2017-02-26 22:03:30.903086+00	45	f	34	3	56
5716	2017-02-26 22:03:30.91282+00	5122	f	18	94	57
5717	2017-02-26 22:03:30.922812+00	1342	f	21	12	58
5718	2017-02-26 22:03:30.933111+00	2782	f	22	149	59
5719	2017-02-26 22:03:30.942868+00	1	f	131	0	60
5720	2017-02-26 22:03:34.057613+00	152	f	24	7	63
5721	2017-02-26 22:03:34.121364+00	233	f	23	5	64
5722	2017-02-26 22:03:34.131192+00	25	f	46	1	65
5723	2017-02-26 22:03:34.141096+00	57	f	35	2	66
5724	2017-02-26 22:03:36.38519+00	0	f	150	0	67
5725	2017-02-26 22:03:36.396932+00	4481	f	25	289	68
5726	2017-02-26 22:03:37.682004+00	53	f	30	6	70
5727	2017-02-26 22:03:37.751229+00	0	f	146	2	71
5728	2017-02-26 22:03:37.760987+00	2	f	148	0	72
5729	2017-02-26 22:03:37.770726+00	6828	f	27	715	73
5730	2017-02-26 22:03:37.780649+00	80	f	29	9	74
5731	2017-02-26 22:03:37.790585+00	88	f	33	11	75
5732	2017-02-26 22:03:37.800554+00	7	f	71	1	76
5733	2017-02-26 22:03:37.810592+00	2	f	144	1	77
5734	2017-02-26 22:03:37.820605+00	21851	f	28	1785	78
5735	2017-02-26 22:03:37.830678+00	127	f	32	4	79
5736	2017-02-26 22:03:37.840591+00	0	f	133	0	80
5737	2017-02-26 22:03:37.850633+00	20	f	56	38	81
5738	2017-02-26 22:03:37.860611+00	13	f	57	3	82
5739	2017-02-26 22:03:37.870675+00	5205	f	36	192	83
5740	2017-02-26 22:03:37.880708+00	16	f	49	2	84
5741	2017-02-26 22:03:37.890797+00	11	f	91	1	85
5742	2017-02-26 22:03:37.900773+00	119	f	38	2	86
5743	2017-02-26 22:03:37.910847+00	653	f	37	28	87
5744	2017-02-26 22:03:37.920817+00	1	f	126	1	88
5745	2017-02-26 22:03:37.930915+00	45	f	43	11	89
5746	2017-02-26 22:03:37.940916+00	1466	f	39	39	90
5747	2017-02-26 22:03:37.950968+00	95	f	41	11	91
5748	2017-02-26 22:03:37.961094+00	6417	f	40	105	92
5749	2017-02-26 22:03:39.398995+00	3	f	76	4	94
5750	2017-02-26 22:03:39.425423+00	48	f	44	3	95
5751	2017-02-26 22:03:39.435237+00	20	f	61	2	96
5752	2017-02-26 22:03:39.445155+00	0	f	149	5	97
5753	2017-02-26 22:03:39.455099+00	0	f	118	0	98
5754	2017-02-26 22:03:39.465097+00	17	f	60	5	99
5755	2017-02-26 22:13:14.616232+00	16542	f	88	724	1
5756	2017-02-26 22:13:14.69646+00	1249	f	112	34	2
5757	2017-02-26 22:13:14.711032+00	485	f	109	7	3
5758	2017-02-26 22:13:14.726044+00	393	f	110	19	4
5759	2017-02-26 22:13:14.743416+00	234	f	120	21	6
5760	2017-02-26 22:13:14.756153+00	222	f	115	8	7
5761	2017-02-26 22:13:14.77104+00	175	f	105	4	8
5762	2017-02-26 22:13:14.787342+00	138	f	108	10	9
5763	2017-02-26 22:13:14.803073+00	133	f	104	3	10
5764	2017-02-26 22:13:14.817433+00	2335	f	4	63	11
5765	2017-02-26 22:13:14.83309+00	71	f	123	5	12
5766	2017-02-26 22:13:16.184381+00	46	f	132	1	14
5767	2017-02-26 22:13:16.251836+00	29584	t	2	873	15
5768	2017-02-26 22:13:16.277973+00	267	f	31	4	16
5769	2017-02-26 22:13:16.29728+00	40	f	127	4	17
5770	2017-02-26 22:13:16.31165+00	37	f	128	0	18
5771	2017-02-26 22:13:16.327185+00	68	f	107	4	19
5772	2017-02-26 22:13:16.341541+00	506	f	10	32	20
5773	2017-02-26 22:13:16.357217+00	395	f	13	30	21
5774	2017-02-26 22:13:16.371758+00	32	f	125	5	22
5775	2017-02-26 22:13:16.387237+00	60	f	98	0	23
5776	2017-02-26 22:13:19.887521+00	14307	f	5	832	26
5777	2017-02-26 22:13:19.946518+00	18	f	141	2	27
5778	2017-02-26 22:13:19.961114+00	158	f	20	13	28
5779	2017-02-26 22:13:20.12667+00	54	f	89	16	29
5780	2017-02-26 22:13:20.141643+00	2633	f	6	97	30
5781	2017-02-26 22:13:20.156918+00	10	f	139	2	31
5782	2017-02-26 22:13:20.171679+00	2489	f	92	158	32
5783	2017-02-26 22:13:20.187014+00	648	f	8	27	33
5784	2017-02-26 22:13:21.643491+00	2997	f	7	229	35
5785	2017-02-26 22:13:21.761645+00	1286	f	9	45	36
5786	2017-02-26 22:13:21.928562+00	189	f	11	7	37
5787	2017-02-26 22:13:23.475811+00	13	f	114	0	39
5788	2017-02-26 22:13:23.546137+00	11	f	101	0	40
5789	2017-02-26 22:13:25.232688+00	10	f	99	0	42
5790	2017-02-26 22:13:26.892098+00	530	f	12	20	44
5791	2017-02-26 22:13:27.224186+00	415	f	14	23	45
5792	2017-02-26 22:13:27.245313+00	279	f	16	13	46
5793	2017-02-26 22:13:27.260314+00	64	f	26	5	47
5794	2017-02-26 22:13:30.485759+00	7	f	102	1	50
5795	2017-02-26 22:13:30.579717+00	8	f	100	2	51
5796	2017-02-26 22:13:30.593734+00	9584	f	15	1046	52
5797	2017-02-26 22:13:32.177361+00	5	f	106	0	54
5798	2017-02-26 22:13:32.25806+00	46	f	34	3	55
5799	2017-02-26 22:13:32.293979+00	5117	f	18	94	56
5800	2017-02-26 22:13:32.30777+00	1349	f	21	12	57
5801	2017-02-26 22:13:32.323124+00	2790	f	22	149	58
5802	2017-02-26 22:13:33.892025+00	152	f	24	7	60
5803	2017-02-26 22:13:35.389812+00	233	f	23	5	62
5804	2017-02-26 22:13:35.603493+00	25	f	46	1	63
5805	2017-02-26 22:13:37.705457+00	1	f	151	0	64
5806	2017-02-26 22:13:37.722291+00	54	f	35	2	65
5807	2017-02-26 22:13:37.738125+00	4485	f	25	289	66
5808	2017-02-26 22:13:39.055016+00	49	f	30	6	68
5809	2017-02-26 22:13:39.125577+00	0	f	146	3	69
5810	2017-02-26 22:13:39.141332+00	2	f	148	0	70
5811	2017-02-26 22:13:39.155493+00	6831	f	27	715	71
5812	2017-02-26 22:13:39.171387+00	80	f	29	9	72
5813	2017-02-26 22:13:39.185504+00	91	f	33	11	73
5814	2017-02-26 22:13:39.201364+00	5	f	71	1	74
5815	2017-02-26 22:13:39.216168+00	2	f	144	1	75
5816	2017-02-26 22:13:39.231725+00	21848	f	28	1786	76
5817	2017-02-26 22:13:39.245908+00	129	f	32	4	77
5818	2017-02-26 22:13:39.261798+00	0	f	133	0	78
5819	2017-02-26 22:13:39.275984+00	17	f	56	39	79
5820	2017-02-26 22:13:39.291947+00	0	f	131	0	80
5821	2017-02-26 22:13:39.306049+00	11	f	57	3	81
5822	2017-02-26 22:13:39.322012+00	5201	f	36	192	82
5823	2017-02-26 22:13:39.336195+00	15	f	49	2	83
5824	2017-02-26 22:13:39.352148+00	12	f	91	1	84
5825	2017-02-26 22:13:39.366359+00	121	f	38	2	85
5826	2017-02-26 22:13:39.38221+00	654	f	37	28	86
5827	2017-02-26 22:13:39.528712+00	1	f	126	1	87
5828	2017-02-26 22:13:39.546051+00	48	f	43	11	88
5829	2017-02-26 22:13:39.5572+00	1467	f	39	39	89
5830	2017-02-26 22:13:39.572913+00	101	f	41	11	90
5831	2017-02-26 22:13:39.591688+00	6412	f	40	105	91
5832	2017-02-26 22:13:41.172081+00	6	f	76	4	93
5833	2017-02-26 22:13:41.28236+00	42	f	44	3	94
5834	2017-02-26 22:13:41.297742+00	20	f	61	2	95
5835	2017-02-26 22:13:41.311722+00	2	f	118	0	96
5836	2017-02-26 22:13:41.327613+00	16	f	60	5	97
5837	2017-02-26 22:13:41.341637+00	2804	f	42	13	98
5838	2017-02-26 22:13:41.357597+00	58	f	45	4	99
5839	2017-02-26 22:23:14.943632+00	16736	f	88	731	1
5840	2017-02-26 22:23:15.011001+00	1392	f	112	37	2
5841	2017-02-26 22:23:15.026772+00	536	f	109	9	3
5842	2017-02-26 22:23:15.040774+00	276	f	120	24	4
5843	2017-02-26 22:23:15.059466+00	252	f	115	7	6
5844	2017-02-26 22:23:15.070797+00	180	f	105	4	7
5845	2017-02-26 22:23:15.086781+00	146	f	108	11	8
5846	2017-02-26 22:23:15.100825+00	84	f	123	6	9
5847	2017-02-26 22:23:15.116811+00	147	f	104	3	10
5848	2017-02-26 22:23:15.130837+00	2343	f	4	63	11
5849	2017-02-26 22:23:15.146123+00	53	f	132	1	12
5850	2017-02-26 22:23:16.540323+00	29591	t	2	873	14
5851	2017-02-26 22:23:16.616176+00	276	f	31	4	15
5852	2017-02-26 22:23:16.631574+00	42	f	128	0	16
5853	2017-02-26 22:23:16.645843+00	43	f	127	6	17
5854	2017-02-26 22:23:16.661246+00	67	f	107	4	18
5855	2017-02-26 22:23:16.675672+00	509	f	10	33	19
5856	2017-02-26 22:23:16.691185+00	35	f	125	5	20
5857	2017-02-26 22:23:16.705689+00	391	f	13	30	21
5858	2017-02-26 22:23:18.210924+00	58	f	98	1	23
5859	2017-02-26 22:23:18.265663+00	20	f	141	2	24
5860	2017-02-26 22:23:19.987534+00	14319	f	5	832	26
5861	2017-02-26 22:23:20.12094+00	159	f	20	13	27
5862	2017-02-26 22:23:20.134677+00	13	f	139	2	28
5863	2017-02-26 22:23:20.150247+00	55	f	89	18	29
5864	2017-02-26 22:23:20.164614+00	2627	f	6	97	30
5865	2017-02-26 22:23:20.18047+00	2490	f	92	158	31
5866	2017-02-26 22:23:20.244086+00	643	f	8	27	32
5867	2017-02-26 22:23:21.606606+00	3006	f	7	229	34
5868	2017-02-26 22:23:21.674762+00	1278	f	9	45	35
5869	2017-02-26 22:23:23.362484+00	191	f	11	7	37
5870	2017-02-26 22:23:23.429198+00	13	f	114	0	38
5871	2017-02-26 22:23:23.452981+00	10	f	101	0	39
5872	2017-02-26 22:23:26.147049+00	3	f	152	0	40
5873	2017-02-26 22:23:27.742456+00	9	f	99	0	42
5874	2017-02-26 22:23:29.402443+00	537	f	12	20	44
5875	2017-02-26 22:23:29.455337+00	7	f	102	1	45
5876	2017-02-26 22:23:29.468659+00	413	f	14	23	46
5877	2017-02-26 22:23:29.484795+00	66	f	26	5	47
5878	2017-02-26 22:23:29.498535+00	284	f	16	13	48
5879	2017-02-26 22:23:32.539233+00	9	f	100	2	51
5880	2017-02-26 22:23:32.606894+00	3	f	151	0	52
5881	2017-02-26 22:23:32.623281+00	9598	f	15	1046	53
5882	2017-02-26 22:23:34.255181+00	7	f	106	0	55
5883	2017-02-26 22:23:34.327925+00	45	f	34	3	56
5884	2017-02-26 22:23:34.340975+00	5123	f	18	94	57
5885	2017-02-26 22:23:34.357585+00	1347	f	21	12	58
5886	2017-02-26 22:23:34.370939+00	2789	f	22	149	59
5887	2017-02-26 22:23:34.38521+00	1	f	131	0	60
5888	2017-02-26 22:23:37.516712+00	156	f	24	7	63
5889	2017-02-26 22:23:37.546267+00	233	f	23	5	64
5890	2017-02-26 22:23:37.559348+00	25	f	46	1	65
5891	2017-02-26 22:23:39.311303+00	0	f	153	0	66
5892	2017-02-26 22:23:39.325852+00	57	f	35	2	67
5893	2017-02-26 22:23:39.340596+00	4477	f	25	289	68
5894	2017-02-26 22:23:40.552195+00	50	f	30	7	70
5895	2017-02-26 22:23:40.624397+00	1	f	148	0	71
5896	2017-02-26 22:23:40.63921+00	6831	f	27	715	72
5897	2017-02-26 22:23:40.653964+00	82	f	29	9	73
5898	2017-02-26 22:23:40.668993+00	91	f	33	11	74
5899	2017-02-26 22:23:40.684153+00	8	f	71	1	75
5900	2017-02-26 22:23:40.699195+00	1	f	144	1	76
5901	2017-02-26 22:23:40.713935+00	21850	f	28	1787	77
5902	2017-02-26 22:23:40.729178+00	132	f	32	4	78
5903	2017-02-26 22:23:40.744023+00	20	f	56	39	79
5904	2017-02-26 22:23:40.759259+00	15	f	57	3	80
5905	2017-02-26 22:23:40.774168+00	0	f	133	0	81
5906	2017-02-26 22:23:40.789386+00	5212	f	36	192	82
5907	2017-02-26 22:23:40.804542+00	16	f	49	2	83
5908	2017-02-26 22:23:40.819472+00	11	f	91	1	84
5909	2017-02-26 22:23:40.834297+00	116	f	38	2	85
5910	2017-02-26 22:23:40.849429+00	653	f	37	28	86
5911	2017-02-26 22:23:40.864282+00	0	f	126	1	87
5912	2017-02-26 22:23:40.879539+00	48	f	43	11	88
5913	2017-02-26 22:23:40.894396+00	1469	f	39	40	89
5914	2017-02-26 22:23:40.909554+00	100	f	41	11	90
5915	2017-02-26 22:23:40.924428+00	6416	f	40	105	91
5916	2017-02-26 22:23:42.320455+00	7	f	76	4	93
5917	2017-02-26 22:23:42.378983+00	45	f	44	3	94
5918	2017-02-26 22:23:42.393978+00	23	f	61	2	95
5919	2017-02-26 22:23:42.408803+00	0	f	146	3	96
5920	2017-02-26 22:23:42.423763+00	2	f	118	0	97
5921	2017-02-26 22:23:43.758746+00	17	f	60	5	99
5922	2017-02-26 22:33:15.051627+00	16958	f	88	740	1
5923	2017-02-26 22:33:15.268337+00	1538	f	112	42	2
5924	2017-02-26 22:33:15.297165+00	578	f	109	9	3
5925	2017-02-26 22:33:15.30911+00	305	f	120	29	4
5926	2017-02-26 22:33:15.328242+00	276	f	115	8	6
5927	2017-02-26 22:33:15.33922+00	203	f	105	4	7
5928	2017-02-26 22:33:15.355646+00	159	f	108	14	8
5929	2017-02-26 22:33:15.369209+00	99	f	123	6	9
5930	2017-02-26 22:33:15.379264+00	159	f	104	3	10
5931	2017-02-26 22:33:15.389265+00	68	f	132	2	11
5932	2017-02-26 22:33:15.39936+00	2364	f	4	63	12
5933	2017-02-26 22:33:16.723396+00	48	f	128	0	14
5934	2017-02-26 22:33:16.793781+00	49	f	127	6	15
5935	2017-02-26 22:33:16.809933+00	282	f	31	4	16
5936	2017-02-26 22:33:16.824221+00	29595	t	2	873	17
5937	2017-02-26 22:33:16.840555+00	75	f	107	4	18
5938	2017-02-26 22:33:18.207435+00	38	f	125	5	20
5939	2017-02-26 22:33:18.379354+00	525	f	10	34	21
5940	2017-02-26 22:33:18.395976+00	399	f	13	30	22
5941	2017-02-26 22:33:18.408422+00	61	f	98	1	23
5942	2017-02-26 22:33:18.424538+00	23	f	141	2	24
5943	2017-02-26 22:33:20.140756+00	14317	f	5	832	26
5944	2017-02-26 22:33:20.283083+00	158	f	20	13	27
5945	2017-02-26 22:33:20.327117+00	59	f	89	19	28
5946	2017-02-26 22:33:20.343571+00	14	f	139	2	29
5947	2017-02-26 22:33:20.359415+00	10	f	152	0	30
5948	2017-02-26 22:33:20.373268+00	2631	f	6	97	31
5949	2017-02-26 22:33:20.389309+00	2491	f	92	158	32
5950	2017-02-26 22:33:20.403263+00	645	f	8	27	33
5951	2017-02-26 22:33:21.735274+00	8	f	151	0	35
5952	2017-02-26 22:33:21.807732+00	2997	f	7	229	36
5953	2017-02-26 22:33:21.824795+00	1285	f	9	45	37
5954	2017-02-26 22:33:23.299538+00	189	f	11	7	39
5955	2017-02-26 22:33:23.371791+00	11	f	114	0	40
5956	2017-02-26 22:33:25.067394+00	13	f	101	0	42
5957	2017-02-26 22:33:25.13668+00	10	f	99	0	43
5958	2017-02-26 22:33:26.763951+00	533	f	12	20	45
5959	2017-02-26 22:33:26.859355+00	9	f	102	1	46
5960	2017-02-26 22:33:26.880665+00	417	f	14	23	47
5961	2017-02-26 22:33:26.897351+00	68	f	26	5	48
5962	2017-02-26 22:33:26.910572+00	283	f	16	13	49
5963	2017-02-26 22:33:29.889243+00	8	f	100	2	52
5964	2017-02-26 22:33:29.918612+00	9592	f	15	1046	53
5965	2017-02-26 22:33:31.476688+00	4	f	106	0	55
5966	2017-02-26 22:33:31.498998+00	4	f	148	0	56
5967	2017-02-26 22:33:31.512446+00	45	f	34	3	57
5968	2017-02-26 22:33:31.527984+00	5118	f	18	94	58
5969	2017-02-26 22:33:31.542384+00	1348	f	21	12	59
5970	2017-02-26 22:33:31.558118+00	2787	f	22	149	60
5971	2017-02-26 22:33:31.572433+00	0	f	131	0	61
5972	2017-02-26 22:33:34.809154+00	156	f	24	7	64
5973	2017-02-26 22:33:34.882018+00	233	f	23	5	65
5974	2017-02-26 22:33:34.897852+00	24	f	46	1	66
5975	2017-02-26 22:33:34.91175+00	55	f	35	2	67
5976	2017-02-26 22:33:34.931818+00	4480	f	25	289	68
5977	2017-02-26 22:33:36.346834+00	47	f	30	7	70
5978	2017-02-26 22:33:36.532215+00	6835	f	27	716	71
5979	2017-02-26 22:33:36.586373+00	78	f	29	9	72
5980	2017-02-26 22:33:36.601913+00	88	f	33	11	73
5981	2017-02-26 22:33:36.616099+00	9	f	71	1	74
5982	2017-02-26 22:33:36.632073+00	1	f	144	1	75
5983	2017-02-26 22:33:36.646167+00	21857	f	28	1787	76
5984	2017-02-26 22:33:36.661966+00	14	f	57	4	77
5985	2017-02-26 22:33:36.676151+00	22	f	56	39	78
5986	2017-02-26 22:33:36.69198+00	131	f	32	4	79
5987	2017-02-26 22:33:36.706129+00	0	f	134	1	80
5988	2017-02-26 22:33:36.721992+00	0	f	133	0	81
5989	2017-02-26 22:33:36.736328+00	11	f	91	1	82
5990	2017-02-26 22:33:36.75198+00	5207	f	36	192	83
5991	2017-02-26 22:33:36.766136+00	18	f	49	2	84
5992	2017-02-26 22:33:36.782103+00	116	f	38	2	85
5993	2017-02-26 22:33:36.79615+00	657	f	37	28	86
5994	2017-02-26 22:33:36.811426+00	0	f	126	1	87
5995	2017-02-26 22:33:36.826221+00	52	f	43	12	88
5996	2017-02-26 22:33:36.841612+00	1468	f	39	40	89
5997	2017-02-26 22:33:36.856447+00	101	f	41	11	90
5998	2017-02-26 22:33:36.872244+00	24	f	61	2	91
5999	2017-02-26 22:33:36.88645+00	6417	f	40	105	92
6000	2017-02-26 22:33:36.901776+00	45	f	44	3	93
6001	2017-02-26 22:33:38.339324+00	5	f	76	4	95
6002	2017-02-26 22:33:38.411556+00	0	f	118	0	96
6003	2017-02-26 22:33:38.427054+00	57	f	45	4	97
6004	2017-02-26 22:33:39.848585+00	19	f	60	5	99
6005	2017-02-26 22:43:16.122274+00	17176	f	88	752	1
6006	2017-02-26 22:43:16.224552+00	1714	f	112	45	2
6007	2017-02-26 22:43:16.277966+00	624	f	109	9	3
6008	2017-02-26 22:43:16.306855+00	346	f	120	29	4
6009	2017-02-26 22:43:16.322748+00	307	f	115	8	5
6010	2017-02-26 22:43:16.339561+00	221	f	105	5	7
6011	2017-02-26 22:43:16.354193+00	118	f	123	6	8
6012	2017-02-26 22:43:16.366968+00	89	f	132	2	9
6013	2017-02-26 22:43:16.38279+00	163	f	108	14	10
6014	2017-02-26 22:43:16.396928+00	176	f	104	3	11
6015	2017-02-26 22:43:16.412823+00	2370	f	4	63	12
6016	2017-02-26 22:43:17.939113+00	55	f	127	7	14
6017	2017-02-26 22:43:18.011611+00	53	f	128	0	15
6018	2017-02-26 22:43:18.027308+00	283	f	31	4	16
6019	2017-02-26 22:43:18.041214+00	29594	t	2	874	17
6020	2017-02-26 22:43:18.057+00	80	f	107	4	18
6021	2017-02-26 22:43:19.534927+00	43	f	125	5	20
6022	2017-02-26 22:43:19.592822+00	524	f	10	35	21
6023	2017-02-26 22:43:19.605318+00	409	f	13	31	22
6024	2017-02-26 22:43:19.621356+00	66	f	98	1	23
6025	2017-02-26 22:43:19.635262+00	24	f	141	2	24
6026	2017-02-26 22:43:19.651465+00	16	f	152	2	25
6027	2017-02-26 22:43:21.312081+00	14315	f	5	832	27
6028	2017-02-26 22:43:21.410801+00	166	f	20	13	28
6029	2017-02-26 22:43:21.440065+00	56	f	89	19	29
6030	2017-02-26 22:43:21.456351+00	13	f	139	2	30
6031	2017-02-26 22:43:21.469974+00	2634	f	6	97	31
6032	2017-02-26 22:43:21.486408+00	2488	f	92	158	32
6033	2017-02-26 22:43:21.500137+00	645	f	8	27	33
6034	2017-02-26 22:43:22.910984+00	8	f	151	0	35
6035	2017-02-26 22:43:22.984567+00	3004	f	7	229	36
6036	2017-02-26 22:43:23.001538+00	1286	f	9	45	37
6037	2017-02-26 22:43:23.014262+00	188	f	11	7	38
6038	2017-02-26 22:43:24.488662+00	12	f	114	0	40
6039	2017-02-26 22:43:26.400766+00	13	f	101	0	42
6040	2017-02-26 22:43:26.531221+00	6	f	148	0	43
6041	2017-02-26 22:43:26.550336+00	11	f	99	0	44
6042	2017-02-26 22:43:28.140772+00	541	f	12	20	46
6043	2017-02-26 22:43:28.207479+00	8	f	102	1	47
6044	2017-02-26 22:43:28.217428+00	413	f	14	23	48
6045	2017-02-26 22:43:28.23425+00	67	f	26	5	49
6046	2017-02-26 22:43:28.24738+00	284	f	16	13	50
6047	2017-02-26 22:43:31.221081+00	10	f	100	2	53
6048	2017-02-26 22:43:31.272822+00	9592	f	15	1046	54
6049	2017-02-26 22:43:32.825976+00	8	f	106	0	56
6050	2017-02-26 22:43:32.879687+00	48	f	34	3	57
6051	2017-02-26 22:43:32.89658+00	5120	f	18	94	58
6052	2017-02-26 22:43:32.909225+00	1349	f	21	12	59
6053	2017-02-26 22:43:32.919188+00	2787	f	22	149	60
6054	2017-02-26 22:43:32.929102+00	3	f	131	0	61
6055	2017-02-26 22:43:36.228655+00	155	f	24	7	64
6056	2017-02-26 22:43:38.88288+00	1	f	154	0	65
6057	2017-02-26 22:43:40.655265+00	1	f	155	0	66
6058	2017-02-26 22:43:40.669739+00	228	f	23	5	67
6059	2017-02-26 22:43:40.686427+00	25	f	46	1	68
6060	2017-02-26 22:43:40.69941+00	54	f	35	2	69
6061	2017-02-26 22:43:40.709396+00	4484	f	25	289	70
6062	2017-02-26 22:43:42.03172+00	50	f	30	7	72
6063	2017-02-26 22:43:42.113441+00	6833	f	27	716	73
6064	2017-02-26 22:43:42.129895+00	80	f	29	9	74
6065	2017-02-26 22:43:42.142876+00	88	f	33	11	75
6066	2017-02-26 22:43:42.15285+00	7	f	71	1	76
6067	2017-02-26 22:43:42.162868+00	1	f	144	1	77
6068	2017-02-26 22:43:42.17285+00	21855	f	28	1787	78
6069	2017-02-26 22:43:42.182818+00	16	f	57	4	79
6070	2017-02-26 22:43:42.192889+00	22	f	56	39	80
6071	2017-02-26 22:43:42.202923+00	130	f	32	4	81
6072	2017-02-26 22:43:42.21292+00	2	f	134	1	82
6073	2017-02-26 22:43:42.223013+00	1	f	133	0	83
6074	2017-02-26 22:43:42.233038+00	11	f	91	1	84
6075	2017-02-26 22:43:42.242938+00	5209	f	36	192	85
6076	2017-02-26 22:43:42.253011+00	17	f	49	2	86
6077	2017-02-26 22:43:42.263085+00	116	f	38	2	87
6078	2017-02-26 22:43:42.27306+00	49	f	43	11	88
6079	2017-02-26 22:43:42.283157+00	655	f	37	28	89
6080	2017-02-26 22:43:42.29315+00	0	f	126	1	90
6081	2017-02-26 22:43:42.303244+00	1467	f	39	40	91
6082	2017-02-26 22:43:42.313262+00	101	f	41	11	92
6083	2017-02-26 22:43:42.323308+00	23	f	61	2	93
6084	2017-02-26 22:43:42.333298+00	6413	f	40	105	94
6085	2017-02-26 22:43:42.34341+00	46	f	44	3	95
6086	2017-02-26 22:43:43.887228+00	7	f	76	4	97
6087	2017-02-26 22:43:43.997439+00	0	f	118	0	98
6088	2017-02-26 22:43:44.008296+00	60	f	45	4	99
6089	2017-02-26 22:53:15.365553+00	17367	f	88	763	1
6090	2017-02-26 22:53:15.46102+00	1911	f	112	51	2
6091	2017-02-26 22:53:15.481675+00	670	f	109	10	3
6092	2017-02-26 22:53:15.494994+00	376	f	120	32	4
6093	2017-02-26 22:53:15.511674+00	327	f	115	9	5
6094	2017-02-26 22:53:15.52759+00	237	f	105	5	7
6095	2017-02-26 22:53:15.541749+00	137	f	123	6	8
6096	2017-02-26 22:53:15.5551+00	104	f	132	2	9
6097	2017-02-26 22:53:15.570254+00	176	f	108	15	10
6098	2017-02-26 22:53:15.58536+00	187	f	104	3	11
6099	2017-02-26 22:53:15.600653+00	2388	f	4	63	12
6100	2017-02-26 22:53:16.983422+00	62	f	127	7	14
6101	2017-02-26 22:53:17.04966+00	60	f	128	0	15
6102	2017-02-26 22:53:18.602044+00	26	f	152	3	17
6103	2017-02-26 22:53:18.684049+00	84	f	107	4	18
6104	2017-02-26 22:53:18.700617+00	285	f	31	4	19
6105	2017-02-26 22:53:18.72671+00	29601	t	2	874	20
6106	2017-02-26 22:53:18.750661+00	48	f	125	6	21
6107	2017-02-26 22:53:18.76369+00	532	f	10	35	22
6108	2017-02-26 22:53:18.779401+00	413	f	13	32	23
6109	2017-02-26 22:53:18.793666+00	29	f	141	2	24
6110	2017-02-26 22:53:18.809314+00	70	f	98	1	25
6111	2017-02-26 22:53:20.701511+00	18	f	139	2	27
6112	2017-02-26 22:53:20.759398+00	14321	f	5	832	28
6113	2017-02-26 22:53:20.775828+00	168	f	20	13	29
6114	2017-02-26 22:53:20.789184+00	59	f	89	19	30
6115	2017-02-26 22:53:20.805783+00	2631	f	6	97	31
6116	2017-02-26 22:53:20.818902+00	2486	f	92	158	32
6117	2017-02-26 22:53:20.834708+00	648	f	8	27	33
6118	2017-02-26 22:53:22.31268+00	3008	f	7	229	35
6119	2017-02-26 22:53:22.383413+00	1284	f	9	45	36
6120	2017-02-26 22:53:23.852083+00	6	f	151	0	38
6121	2017-02-26 22:53:23.940091+00	190	f	11	7	39
6122	2017-02-26 22:53:23.963986+00	15	f	114	0	40
6123	2017-02-26 22:53:24.117508+00	6	f	148	1	41
6124	2017-02-26 22:53:25.836831+00	13	f	101	0	43
6125	2017-02-26 22:53:25.922634+00	11	f	99	0	44
6126	2017-02-26 22:53:27.635074+00	535	f	12	20	46
6127	2017-02-26 22:53:27.70696+00	411	f	14	23	47
6128	2017-02-26 22:53:27.723608+00	10	f	100	2	48
6129	2017-02-26 22:53:27.736715+00	70	f	26	5	49
6130	2017-02-26 22:53:27.753492+00	284	f	16	13	50
6131	2017-02-26 22:53:30.692768+00	7	f	102	1	53
6132	2017-02-26 22:53:30.764683+00	9593	f	15	1046	54
6133	2017-02-26 22:53:32.363628+00	7	f	106	0	56
6134	2017-02-26 22:53:32.388398+00	48	f	34	3	57
6135	2017-02-26 22:53:32.408261+00	5114	f	18	94	58
6136	2017-02-26 22:53:32.42246+00	1342	f	21	12	59
6137	2017-02-26 22:53:32.43823+00	2788	f	22	149	60
6138	2017-02-26 22:53:32.452397+00	0	f	131	0	61
6139	2017-02-26 22:53:36.853246+00	156	f	24	7	64
6140	2017-02-26 22:53:36.909962+00	0	f	154	0	65
6141	2017-02-26 22:53:36.926562+00	0	f	155	0	66
6142	2017-02-26 22:53:36.939592+00	228	f	23	5	67
6143	2017-02-26 22:53:36.954095+00	24	f	46	1	68
6144	2017-02-26 22:53:36.969437+00	58	f	35	2	69
6145	2017-02-26 22:53:36.984168+00	4478	f	25	289	70
6146	2017-02-26 22:53:38.317503+00	50	f	30	7	72
6147	2017-02-26 22:53:38.353421+00	6832	f	27	716	73
6148	2017-02-26 22:53:38.368321+00	83	f	29	9	74
6149	2017-02-26 22:53:38.383351+00	90	f	33	11	75
6150	2017-02-26 22:53:38.397994+00	8	f	71	1	76
6151	2017-02-26 22:53:38.413204+00	0	f	144	1	77
6152	2017-02-26 22:53:38.42801+00	21857	f	28	1787	78
6153	2017-02-26 22:53:38.443252+00	13	f	57	4	79
6154	2017-02-26 22:53:38.458062+00	20	f	56	39	80
6155	2017-02-26 22:53:38.473328+00	130	f	32	4	81
6156	2017-02-26 22:53:38.488157+00	1	f	134	1	82
6157	2017-02-26 22:53:38.503392+00	0	f	133	0	83
6158	2017-02-26 22:53:38.518816+00	12	f	91	1	84
6159	2017-02-26 22:53:38.533776+00	5204	f	36	192	85
6160	2017-02-26 22:53:38.54858+00	16	f	49	2	86
6161	2017-02-26 22:53:38.56373+00	117	f	38	2	87
6162	2017-02-26 22:53:38.578568+00	50	f	43	11	88
6163	2017-02-26 22:53:38.593834+00	653	f	37	28	89
6164	2017-02-26 22:53:38.608704+00	0	f	126	1	90
6165	2017-02-26 22:53:38.623978+00	1469	f	39	40	91
6166	2017-02-26 22:53:38.638786+00	99	f	41	11	92
6167	2017-02-26 22:53:38.653983+00	24	f	61	2	93
6168	2017-02-26 22:53:38.669233+00	6415	f	40	105	94
6169	2017-02-26 22:53:38.699328+00	46	f	44	3	95
6170	2017-02-26 22:53:38.714436+00	5	f	76	4	96
6171	2017-02-26 22:53:38.729328+00	18	f	60	5	97
6172	2017-02-26 22:53:38.744498+00	1	f	118	0	98
6173	2017-02-26 22:53:38.759409+00	57	f	45	4	99
6174	2017-02-26 23:03:16.205115+00	17548	f	88	772	1
6175	2017-02-26 23:03:16.281487+00	2083	f	112	53	2
6176	2017-02-26 23:03:16.298296+00	728	f	109	11	3
6177	2017-02-26 23:03:16.311139+00	412	f	120	34	4
6178	2017-02-26 23:03:16.321108+00	354	f	115	11	5
6179	2017-02-26 23:03:16.333782+00	119	f	132	2	7
6180	2017-02-26 23:03:16.350435+00	249	f	105	6	8
6181	2017-02-26 23:03:16.360962+00	149	f	123	8	9
6182	2017-02-26 23:03:16.370909+00	184	f	108	16	10
6183	2017-02-26 23:03:16.380833+00	200	f	104	3	11
6184	2017-02-26 23:03:17.756508+00	2406	f	4	63	13
6185	2017-02-26 23:03:17.825893+00	38	f	152	6	14
6186	2017-02-26 23:03:17.842505+00	65	f	128	0	15
6187	2017-02-26 23:03:17.855673+00	64	f	127	7	16
6188	2017-02-26 23:03:19.405013+00	48	f	125	6	18
6189	2017-02-26 23:03:19.459442+00	84	f	107	4	19
6190	2017-02-26 23:03:19.476259+00	284	f	31	4	20
6191	2017-02-26 23:03:19.489122+00	29596	t	2	874	21
6192	2017-02-26 23:03:19.499206+00	33	f	141	2	22
6193	2017-02-26 23:03:19.50949+00	533	f	10	35	23
6194	2017-02-26 23:03:19.519214+00	417	f	13	33	24
6195	2017-02-26 23:03:19.529121+00	72	f	98	1	25
6196	2017-02-26 23:03:19.539204+00	23	f	139	2	26
6197	2017-02-26 23:03:21.287814+00	14319	f	5	832	28
6198	2017-02-26 23:03:21.324069+00	169	f	20	13	29
6199	2017-02-26 23:03:21.334037+00	61	f	89	19	30
6200	2017-02-26 23:03:21.343996+00	2628	f	6	97	31
6201	2017-02-26 23:03:21.353917+00	2493	f	92	158	32
6202	2017-02-26 23:03:21.363834+00	654	f	8	27	33
6203	2017-02-26 23:03:22.69785+00	7	f	151	0	35
6204	2017-02-26 23:03:22.767816+00	3008	f	7	229	36
6205	2017-02-26 23:03:22.777693+00	1285	f	9	45	37
6206	2017-02-26 23:03:24.255124+00	190	f	11	7	39
6207	2017-02-26 23:03:24.382163+00	14	f	114	0	40
6208	2017-02-26 23:03:24.399069+00	6	f	148	1	41
6209	2017-02-26 23:03:26.016839+00	11	f	101	0	43
6210	2017-02-26 23:03:26.086752+00	12	f	99	0	44
6211	2017-02-26 23:03:27.666798+00	538	f	12	20	46
6212	2017-02-26 23:03:27.727445+00	416	f	14	23	47
6213	2017-02-26 23:03:27.740434+00	8	f	100	2	48
6214	2017-02-26 23:03:27.750455+00	72	f	26	5	49
6215	2017-02-26 23:03:27.760592+00	285	f	16	13	50
6216	2017-02-26 23:03:30.63546+00	8	f	102	1	53
6217	2017-02-26 23:03:30.715202+00	1	f	131	0	54
6218	2017-02-26 23:03:30.728453+00	9584	f	15	1046	55
6219	2017-02-26 23:03:33.499441+00	6	f	106	0	57
6220	2017-02-26 23:03:33.576262+00	45	f	34	3	58
6221	2017-02-26 23:03:33.592318+00	5119	f	18	94	59
6222	2017-02-26 23:03:33.605858+00	1343	f	21	12	60
6223	2017-02-26 23:03:33.622097+00	2789	f	22	149	61
6224	2017-02-26 23:03:36.833196+00	155	f	24	7	64
6225	2017-02-26 23:03:36.915009+00	0	f	154	0	65
6226	2017-02-26 23:03:36.930798+00	26	f	46	1	66
6227	2017-02-26 23:03:36.944745+00	231	f	23	5	67
6228	2017-02-26 23:03:36.960539+00	55	f	35	2	68
6229	2017-02-26 23:03:36.982974+00	4484	f	25	289	69
6230	2017-02-26 23:03:38.27367+00	52	f	30	7	71
6231	2017-02-26 23:03:38.347184+00	6837	f	27	716	72
6232	2017-02-26 23:03:38.376844+00	82	f	29	9	73
6233	2017-02-26 23:03:38.406707+00	90	f	33	11	74
6234	2017-02-26 23:03:38.560807+00	6	f	71	1	75
6235	2017-02-26 23:03:38.617518+00	0	f	144	1	76
6236	2017-02-26 23:03:38.633293+00	21854	f	28	1786	77
6237	2017-02-26 23:03:38.647748+00	15	f	57	4	78
6238	2017-02-26 23:03:38.663221+00	23	f	56	39	79
6239	2017-02-26 23:03:38.677404+00	126	f	32	4	80
6240	2017-02-26 23:03:38.693074+00	0	f	134	1	81
6241	2017-02-26 23:03:38.707269+00	1	f	133	0	82
6242	2017-02-26 23:03:38.723058+00	13	f	91	1	83
6243	2017-02-26 23:03:38.737299+00	5204	f	36	192	84
6244	2017-02-26 23:03:38.753074+00	17	f	49	2	85
6245	2017-02-26 23:03:38.918843+00	121	f	38	2	86
6246	2017-02-26 23:03:38.934176+00	656	f	37	28	87
6247	2017-02-26 23:03:38.948269+00	47	f	43	9	88
6248	2017-02-26 23:03:38.964082+00	3	f	126	1	89
6249	2017-02-26 23:03:38.978356+00	1464	f	39	40	90
6250	2017-02-26 23:03:38.994062+00	101	f	41	11	91
6251	2017-02-26 23:03:39.008264+00	23	f	61	2	92
6252	2017-02-26 23:03:39.024021+00	18	f	60	5	93
6253	2017-02-26 23:03:39.038334+00	6415	f	40	105	94
6254	2017-02-26 23:03:39.054159+00	48	f	44	3	95
6255	2017-02-26 23:03:40.596567+00	5	f	76	4	97
6256	2017-02-26 23:03:40.663235+00	0	f	118	0	98
6257	2017-02-26 23:03:40.678698+00	57	f	45	4	99
6258	2017-02-26 23:13:15.816639+00	17731	f	88	775	1
6259	2017-02-26 23:13:15.908907+00	2305	f	112	61	2
6260	2017-02-26 23:13:16.037546+00	786	f	109	12	3
6261	2017-02-26 23:13:16.048863+00	466	f	120	35	4
6262	2017-02-26 23:13:16.058698+00	397	f	115	15	5
6263	2017-02-26 23:13:16.071329+00	148	f	132	2	7
6264	2017-02-26 23:13:16.087475+00	176	f	123	8	8
6265	2017-02-26 23:13:16.098526+00	269	f	105	6	9
6266	2017-02-26 23:13:16.108624+00	185	f	108	16	10
6267	2017-02-26 23:13:16.11863+00	210	f	104	3	11
6268	2017-02-26 23:13:16.128935+00	56	f	152	9	12
6269	2017-02-26 23:13:16.139085+00	70	f	128	0	13
6270	2017-02-26 23:13:17.584483+00	2409	f	4	63	15
6271	2017-02-26 23:13:17.653286+00	68	f	127	7	16
6272	2017-02-26 23:13:19.177697+00	55	f	125	7	18
6273	2017-02-26 23:13:19.196704+00	41	f	141	2	19
6274	2017-02-26 23:13:19.206602+00	287	f	31	4	20
6275	2017-02-26 23:13:19.227046+00	83	f	107	4	21
6276	2017-02-26 23:13:19.237029+00	29604	t	2	874	22
6277	2017-02-26 23:13:19.247107+00	544	f	10	36	23
6278	2017-02-26 23:13:19.257265+00	412	f	13	33	24
6279	2017-02-26 23:13:19.267114+00	71	f	98	1	25
6280	2017-02-26 23:13:19.277166+00	25	f	139	2	26
6281	2017-02-26 23:13:21.003099+00	14317	f	5	832	28
6282	2017-02-26 23:13:21.130703+00	170	f	20	13	29
6283	2017-02-26 23:13:21.142367+00	57	f	89	19	30
6284	2017-02-26 23:13:21.152506+00	2631	f	6	97	31
6285	2017-02-26 23:13:21.162359+00	10	f	151	1	32
6286	2017-02-26 23:13:21.172124+00	2489	f	92	158	33
6287	2017-02-26 23:13:21.252654+00	653	f	8	27	34
6288	2017-02-26 23:13:22.616347+00	3006	f	7	229	36
6289	2017-02-26 23:13:22.686453+00	1285	f	9	45	37
6290	2017-02-26 23:13:22.696018+00	16	f	114	0	38
6291	2017-02-26 23:13:22.705909+00	194	f	11	7	39
6292	2017-02-26 23:13:25.380953+00	4	f	156	1	40
6293	2017-02-26 23:13:26.952902+00	5	f	148	1	42
6294	2017-02-26 23:13:27.007539+00	12	f	101	0	43
6295	2017-02-26 23:13:28.688435+00	11	f	99	0	45
6296	2017-02-26 23:13:30.189081+00	538	f	12	20	47
6297	2017-02-26 23:13:30.255548+00	411	f	14	23	48
6298	2017-02-26 23:13:30.26543+00	7	f	100	2	49
6299	2017-02-26 23:13:30.275439+00	66	f	26	5	50
6300	2017-02-26 23:13:30.285487+00	285	f	16	13	51
6301	2017-02-26 23:13:33.398239+00	8	f	102	1	54
6302	2017-02-26 23:13:33.464444+00	1	f	131	0	55
6303	2017-02-26 23:13:35.016358+00	9596	f	15	1046	57
6304	2017-02-26 23:13:35.219513+00	7	f	106	0	58
6305	2017-02-26 23:13:35.228747+00	46	f	34	3	59
6306	2017-02-26 23:13:35.238668+00	5124	f	18	94	60
6307	2017-02-26 23:13:35.248821+00	1345	f	21	12	61
6308	2017-02-26 23:13:35.258519+00	2	f	133	0	62
6309	2017-02-26 23:13:35.268517+00	2786	f	22	149	63
6310	2017-02-26 23:13:38.44377+00	158	f	24	7	66
6311	2017-02-26 23:13:38.547621+00	0	f	154	0	67
6312	2017-02-26 23:13:38.55694+00	24	f	46	1	68
6313	2017-02-26 23:13:38.566995+00	231	f	23	5	69
6314	2017-02-26 23:13:38.576976+00	53	f	35	2	70
6315	2017-02-26 23:13:38.5871+00	4481	f	25	289	71
6316	2017-02-26 23:13:39.933305+00	48	f	30	7	73
6317	2017-02-26 23:13:39.951104+00	6839	f	27	716	74
6318	2017-02-26 23:13:39.960952+00	82	f	29	9	75
6319	2017-02-26 23:13:39.971158+00	87	f	33	11	76
6320	2017-02-26 23:13:39.980982+00	7	f	71	1	77
6321	2017-02-26 23:13:39.991021+00	0	f	144	1	78
6322	2017-02-26 23:13:40.000998+00	21851	f	28	1786	79
6323	2017-02-26 23:13:40.011111+00	15	f	57	4	80
6324	2017-02-26 23:13:40.021074+00	24	f	56	40	81
6325	2017-02-26 23:13:40.03106+00	130	f	32	4	82
6326	2017-02-26 23:13:40.040995+00	0	f	134	1	83
6327	2017-02-26 23:13:40.051133+00	12	f	91	1	84
6328	2017-02-26 23:13:40.06115+00	5199	f	36	192	85
6329	2017-02-26 23:13:40.071165+00	17	f	49	2	86
6330	2017-02-26 23:13:40.081175+00	120	f	38	2	87
6331	2017-02-26 23:13:40.091198+00	659	f	37	28	88
6332	2017-02-26 23:13:40.101233+00	48	f	43	9	89
6333	2017-02-26 23:13:40.113473+00	1	f	126	1	90
6334	2017-02-26 23:13:40.129682+00	1466	f	39	40	91
6335	2017-02-26 23:13:40.141388+00	98	f	41	11	92
6336	2017-02-26 23:13:40.15157+00	24	f	61	2	93
6337	2017-02-26 23:13:40.161423+00	21	f	60	6	94
6338	2017-02-26 23:13:40.1715+00	6416	f	40	105	95
6339	2017-02-26 23:13:40.181529+00	48	f	44	3	96
6340	2017-02-26 23:13:41.82943+00	5	f	76	4	98
6341	2017-02-26 23:13:41.896656+00	0	f	118	0	99
6342	2017-02-26 23:23:16.368837+00	17918	f	88	788	1
6343	2017-02-26 23:23:16.444174+00	2519	f	112	64	2
6344	2017-02-26 23:23:16.458605+00	826	f	109	12	3
6345	2017-02-26 23:23:16.472877+00	495	f	120	38	4
6346	2017-02-26 23:23:16.488524+00	433	f	115	16	5
6347	2017-02-26 23:23:16.502854+00	186	f	132	3	6
6348	2017-02-26 23:23:16.522475+00	205	f	123	10	8
6349	2017-02-26 23:23:16.535776+00	297	f	105	6	9
6350	2017-02-26 23:23:16.549708+00	76	f	152	12	10
6351	2017-02-26 23:23:16.565874+00	195	f	108	16	11
6352	2017-02-26 23:23:16.579812+00	224	f	104	3	12
6353	2017-02-26 23:23:16.595883+00	71	f	128	0	13
6354	2017-02-26 23:23:18.12677+00	69	f	127	10	15
6355	2017-02-26 23:23:18.25385+00	2421	f	4	63	16
6356	2017-02-26 23:23:19.583712+00	42	f	141	2	18
6357	2017-02-26 23:23:19.654388+00	57	f	125	7	19
6358	2017-02-26 23:23:19.668228+00	82	f	107	4	20
6359	2017-02-26 23:23:19.684204+00	289	f	31	4	21
6360	2017-02-26 23:23:19.698385+00	29600	t	2	874	22
6361	2017-02-26 23:23:19.714267+00	549	f	10	36	23
6362	2017-02-26 23:23:19.728422+00	30	f	139	2	24
6363	2017-02-26 23:23:19.744494+00	419	f	13	34	25
6364	2017-02-26 23:23:19.758545+00	74	f	98	2	26
6365	2017-02-26 23:23:21.472441+00	14321	f	5	832	28
6366	2017-02-26 23:23:21.597874+00	173	f	20	13	29
6367	2017-02-26 23:23:21.613522+00	13	f	151	1	30
6368	2017-02-26 23:23:21.62947+00	61	f	89	19	31
6369	2017-02-26 23:23:21.64304+00	2633	f	6	97	32
6370	2017-02-26 23:23:21.658704+00	2495	f	92	158	33
6371	2017-02-26 23:23:21.673089+00	649	f	8	27	34
6372	2017-02-26 23:23:23.060424+00	8	f	156	1	36
6373	2017-02-26 23:23:23.127643+00	15	f	114	0	37
6374	2017-02-26 23:23:23.143732+00	3009	f	7	229	38
6375	2017-02-26 23:23:23.158511+00	1280	f	9	45	39
6376	2017-02-26 23:23:23.174456+00	195	f	11	7	40
6377	2017-02-26 23:23:24.661812+00	5	f	148	1	42
6378	2017-02-26 23:23:24.731927+00	11	f	101	0	43
6379	2017-02-26 23:23:26.440768+00	9	f	99	0	45
6380	2017-02-26 23:23:28.092187+00	10	f	100	2	47
6381	2017-02-26 23:23:28.160576+00	540	f	12	20	48
6382	2017-02-26 23:23:28.176901+00	10	f	102	1	49
6383	2017-02-26 23:23:28.190062+00	413	f	14	23	50
6384	2017-02-26 23:23:28.206281+00	66	f	26	5	51
6385	2017-02-26 23:23:28.21996+00	287	f	16	13	52
6386	2017-02-26 23:23:31.010517+00	4	f	131	1	55
6387	2017-02-26 23:23:32.625122+00	9590	f	15	1046	57
6388	2017-02-26 23:23:32.681635+00	6	f	106	0	58
6389	2017-02-26 23:23:32.698196+00	49	f	34	3	59
6390	2017-02-26 23:23:32.711475+00	5125	f	18	94	60
6391	2017-02-26 23:23:32.721375+00	1343	f	21	12	61
6392	2017-02-26 23:23:32.731307+00	3	f	133	0	62
6393	2017-02-26 23:23:32.741264+00	2788	f	22	149	63
6394	2017-02-26 23:23:34.624548+00	1	f	157	0	64
6395	2017-02-26 23:23:37.962964+00	0	f	158	0	66
6396	2017-02-26 23:23:39.520755+00	159	f	24	7	68
6397	2017-02-26 23:23:39.579721+00	0	f	154	0	69
6398	2017-02-26 23:23:39.630367+00	26	f	46	1	70
6399	2017-02-26 23:23:39.647717+00	232	f	23	5	71
6400	2017-02-26 23:23:39.659531+00	56	f	35	2	72
6401	2017-02-26 23:23:39.673363+00	4481	f	25	289	73
6402	2017-02-26 23:23:40.857774+00	48	f	30	7	75
6403	2017-02-26 23:23:40.92313+00	6832	f	27	717	76
6404	2017-02-26 23:23:40.932973+00	83	f	29	9	77
6405	2017-02-26 23:23:40.942861+00	89	f	33	11	78
6406	2017-02-26 23:23:40.952797+00	8	f	71	1	79
6407	2017-02-26 23:23:40.962938+00	0	f	144	1	80
6408	2017-02-26 23:23:40.972942+00	21856	f	28	1786	81
6409	2017-02-26 23:23:40.982912+00	14	f	57	4	82
6410	2017-02-26 23:23:40.992993+00	23	f	56	40	83
6411	2017-02-26 23:23:41.002991+00	130	f	32	4	84
6412	2017-02-26 23:23:41.013283+00	1	f	134	2	85
6413	2017-02-26 23:23:41.023601+00	14	f	91	1	86
6414	2017-02-26 23:23:41.032922+00	5209	f	36	192	87
6415	2017-02-26 23:23:41.042985+00	17	f	49	2	88
6416	2017-02-26 23:23:41.053003+00	119	f	38	2	89
6417	2017-02-26 23:23:41.063066+00	655	f	37	28	90
6418	2017-02-26 23:23:41.073052+00	48	f	43	9	91
6419	2017-02-26 23:23:41.083054+00	2	f	126	2	92
6420	2017-02-26 23:23:41.093049+00	1467	f	39	40	93
6421	2017-02-26 23:23:41.10319+00	99	f	41	11	94
6422	2017-02-26 23:23:41.113135+00	22	f	61	2	95
6423	2017-02-26 23:23:41.12316+00	21	f	60	6	96
6424	2017-02-26 23:23:41.133176+00	6412	f	40	105	97
6425	2017-02-26 23:23:41.143276+00	49	f	44	3	98
6426	2017-02-26 23:33:17.013249+00	18069	f	88	788	1
6427	2017-02-26 23:33:17.111104+00	2763	f	112	75	2
6428	2017-02-26 23:33:17.13012+00	885	f	109	15	3
6429	2017-02-26 23:33:17.145047+00	564	f	120	42	4
6430	2017-02-26 23:33:17.160135+00	448	f	115	17	5
6431	2017-02-26 23:33:17.17508+00	231	f	132	3	6
6432	2017-02-26 23:33:17.19279+00	228	f	123	12	8
6433	2017-02-26 23:33:17.207537+00	101	f	152	12	9
6434	2017-02-26 23:33:17.219992+00	305	f	105	7	10
6435	2017-02-26 23:33:17.234982+00	231	f	104	3	11
6436	2017-02-26 23:33:17.249982+00	200	f	108	16	12
6437	2017-02-26 23:33:17.264866+00	88	f	128	0	13
6438	2017-02-26 23:33:17.27977+00	83	f	127	10	14
6439	2017-02-26 23:33:20.484944+00	2437	f	4	63	17
6440	2017-02-26 23:33:20.557255+00	50	f	141	2	18
6441	2017-02-26 23:33:20.574285+00	57	f	125	9	19
6442	2017-02-26 23:33:20.589293+00	95	f	107	4	20
6443	2017-02-26 23:33:20.603844+00	299	f	31	4	21
6444	2017-02-26 23:33:20.619624+00	29604	t	2	874	22
6445	2017-02-26 23:33:20.634258+00	33	f	139	3	23
6446	2017-02-26 23:33:20.649552+00	554	f	10	37	24
6447	2017-02-26 23:33:20.66413+00	433	f	13	34	25
6448	2017-02-26 23:33:20.679498+00	76	f	98	2	26
6449	2017-02-26 23:33:20.694319+00	17	f	151	2	27
6450	2017-02-26 23:33:22.452441+00	14321	f	5	832	29
6451	2017-02-26 23:33:22.480109+00	172	f	20	13	30
6452	2017-02-26 23:33:22.494987+00	60	f	89	20	31
6453	2017-02-26 23:33:22.509267+00	2629	f	6	97	32
6454	2017-02-26 23:33:22.524751+00	2495	f	92	158	33
6455	2017-02-26 23:33:22.539238+00	654	f	8	27	34
6456	2017-02-26 23:33:23.873692+00	8	f	156	1	36
6457	2017-02-26 23:33:23.94337+00	17	f	114	0	37
6458	2017-02-26 23:33:23.958602+00	3011	f	7	230	38
6459	2017-02-26 23:33:23.973029+00	1289	f	9	45	39
6460	2017-02-26 23:33:23.988517+00	194	f	11	7	40
6461	2017-02-26 23:33:27.248946+00	5	f	148	1	43
6462	2017-02-26 23:33:27.338983+00	5	f	133	0	44
6463	2017-02-26 23:33:27.365353+00	13	f	99	0	45
6464	2017-02-26 23:33:27.381982+00	13	f	101	0	46
6465	2017-02-26 23:33:29.106944+00	10	f	100	2	48
6466	2017-02-26 23:33:29.323338+00	12	f	102	1	49
6467	2017-02-26 23:33:29.34037+00	539	f	12	20	50
6468	2017-02-26 23:33:29.356519+00	416	f	14	23	51
6469	2017-02-26 23:33:31.146266+00	3	f	159	0	52
6470	2017-02-26 23:33:32.874129+00	70	f	26	5	54
6471	2017-02-26 23:33:32.965673+00	283	f	16	13	55
6472	2017-02-26 23:33:34.291333+00	6	f	106	0	57
6473	2017-02-26 23:33:35.850927+00	2	f	131	1	59
6474	2017-02-26 23:33:35.921051+00	9593	f	15	1046	60
6475	2017-02-26 23:33:35.935381+00	44	f	34	3	61
6476	2017-02-26 23:33:35.95043+00	5125	f	18	94	62
6477	2017-02-26 23:33:35.965186+00	1348	f	21	12	63
6478	2017-02-26 23:33:37.523648+00	2789	f	22	149	65
6479	2017-02-26 23:33:37.589777+00	1	f	157	0	66
6480	2017-02-26 23:33:37.606529+00	0	f	158	0	67
6481	2017-02-26 23:33:39.022433+00	153	f	24	7	69
6482	2017-02-26 23:33:39.080657+00	27	f	46	1	70
6483	2017-02-26 23:33:39.093594+00	232	f	23	5	71
6484	2017-02-26 23:33:39.108955+00	58	f	35	2	72
6485	2017-02-26 23:33:39.1235+00	4495	f	25	289	73
6486	2017-02-26 23:33:40.436933+00	51	f	30	7	75
6487	2017-02-26 23:33:40.467609+00	6834	f	27	717	76
6488	2017-02-26 23:33:40.484497+00	89	f	33	11	77
6489	2017-02-26 23:33:40.497394+00	81	f	29	9	78
6490	2017-02-26 23:33:40.512615+00	8	f	71	1	79
6491	2017-02-26 23:33:40.527321+00	0	f	144	1	80
6492	2017-02-26 23:33:40.542593+00	21848	f	28	1786	81
6493	2017-02-26 23:33:40.557123+00	17	f	57	4	82
6494	2017-02-26 23:33:40.572547+00	127	f	32	4	83
6495	2017-02-26 23:33:40.587255+00	19	f	56	40	84
6496	2017-02-26 23:33:40.602627+00	0	f	134	2	85
6497	2017-02-26 23:33:40.617499+00	14	f	91	1	86
6498	2017-02-26 23:33:40.632635+00	5211	f	36	192	87
6499	2017-02-26 23:33:40.647354+00	18	f	49	2	88
6500	2017-02-26 23:33:40.662834+00	119	f	38	2	89
6501	2017-02-26 23:33:40.677455+00	0	f	154	0	90
6502	2017-02-26 23:33:40.692769+00	655	f	37	28	91
6503	2017-02-26 23:33:40.70746+00	53	f	43	9	92
6504	2017-02-26 23:33:40.722839+00	2	f	126	2	93
6505	2017-02-26 23:33:40.737469+00	1470	f	39	40	94
6506	2017-02-26 23:33:40.752875+00	103	f	41	11	95
6507	2017-02-26 23:33:40.767625+00	23	f	61	2	96
6508	2017-02-26 23:33:40.783+00	19	f	60	6	97
6509	2017-02-26 23:33:40.797687+00	6409	f	40	105	98
6510	2017-02-26 23:33:40.813069+00	42	f	44	3	99
6511	2017-02-26 23:43:16.708494+00	3140	f	112	87	1
6512	2017-02-26 23:43:16.915372+00	18186	f	88	791	2
6513	2017-02-26 23:43:16.931038+00	962	f	109	16	3
6514	2017-02-26 23:43:16.945381+00	623	f	120	50	4
6515	2017-02-26 23:43:16.960896+00	479	f	115	17	5
6516	2017-02-26 23:43:16.975389+00	280	f	132	3	6
6517	2017-02-26 23:43:16.990686+00	135	f	152	16	7
6518	2017-02-26 23:43:17.005217+00	257	f	123	12	8
6519	2017-02-26 23:43:17.026332+00	330	f	105	7	10
6520	2017-02-26 23:43:17.040871+00	247	f	104	3	11
6521	2017-02-26 23:43:17.055105+00	209	f	108	17	12
6522	2017-02-26 23:43:17.070518+00	101	f	128	0	13
6523	2017-02-26 23:43:17.08505+00	92	f	127	12	14
6524	2017-02-26 23:43:19.93835+00	59	f	141	2	17
6525	2017-02-26 23:43:20.049773+00	2441	f	4	63	18
6526	2017-02-26 23:43:20.063643+00	102	f	107	5	19
6527	2017-02-26 23:43:20.079288+00	56	f	125	10	20
6528	2017-02-26 23:43:20.093496+00	41	f	139	3	21
6529	2017-02-26 23:43:20.111322+00	304	f	31	4	22
6530	2017-02-26 23:43:20.12332+00	29598	t	2	874	23
6531	2017-02-26 23:43:20.143436+00	553	f	10	41	24
6532	2017-02-26 23:43:20.15937+00	433	f	13	35	25
6533	2017-02-26 23:43:20.173212+00	72	f	98	2	26
6534	2017-02-26 23:43:20.1889+00	20	f	151	2	27
6535	2017-02-26 23:43:21.883178+00	14326	f	5	832	29
6536	2017-02-26 23:43:21.968641+00	173	f	20	13	30
6537	2017-02-26 23:43:21.984314+00	63	f	89	20	31
6538	2017-02-26 23:43:21.998301+00	11	f	156	2	32
6539	2017-02-26 23:43:22.01421+00	2630	f	6	97	33
6540	2017-02-26 23:43:22.028395+00	2497	f	92	158	34
6541	2017-02-26 23:43:22.04422+00	655	f	8	27	35
6542	2017-02-26 23:43:23.451487+00	18	f	114	0	37
6543	2017-02-26 23:43:23.522561+00	3009	f	7	230	38
6544	2017-02-26 23:43:23.53845+00	1289	f	9	45	39
6545	2017-02-26 23:43:25.073254+00	192	f	11	7	41
6546	2017-02-26 23:43:26.600365+00	12	f	99	0	43
6547	2017-02-26 23:43:26.670842+00	3	f	148	1	44
6548	2017-02-26 23:43:26.697814+00	11	f	100	2	45
6549	2017-02-26 23:43:26.710499+00	12	f	102	1	46
6550	2017-02-26 23:43:28.334266+00	10	f	101	0	48
6551	2017-02-26 23:43:28.405302+00	5	f	133	0	49
6552	2017-02-26 23:43:28.421207+00	536	f	12	20	50
6553	2017-02-26 23:43:28.434961+00	414	f	14	23	51
6554	2017-02-26 23:43:28.451094+00	69	f	26	5	52
6555	2017-02-26 23:43:30.007087+00	286	f	16	13	54
6556	2017-02-26 23:43:31.326229+00	7	f	106	0	56
6557	2017-02-26 23:43:32.995292+00	9587	f	15	1046	58
6558	2017-02-26 23:43:33.067819+00	48	f	34	3	59
6559	2017-02-26 23:43:33.083537+00	5128	f	18	94	60
6560	2017-02-26 23:43:33.097382+00	1347	f	21	12	61
6561	2017-02-26 23:43:34.677665+00	2793	f	22	149	63
6562	2017-02-26 23:43:34.732227+00	2	f	159	0	64
6563	2017-02-26 23:43:34.758539+00	1	f	131	1	65
6564	2017-02-26 23:43:34.772126+00	1	f	157	0	66
6565	2017-02-26 23:43:34.788157+00	0	f	158	0	67
6566	2017-02-26 23:43:36.557335+00	160	f	24	7	69
6567	2017-02-26 23:43:36.622869+00	26	f	46	1	70
6568	2017-02-26 23:43:36.642579+00	0	f	126	2	71
6569	2017-02-26 23:43:36.656538+00	55	f	35	3	72
6570	2017-02-26 23:43:36.67246+00	230	f	23	5	73
6571	2017-02-26 23:43:36.686567+00	4491	f	25	289	74
6572	2017-02-26 23:43:38.314748+00	50	f	30	7	76
6573	2017-02-26 23:43:38.387301+00	92	f	33	11	77
6574	2017-02-26 23:43:38.401224+00	6837	f	27	717	78
6575	2017-02-26 23:43:38.41711+00	85	f	29	9	79
6576	2017-02-26 23:43:38.431285+00	7	f	71	1	80
6577	2017-02-26 23:43:38.457764+00	0	f	144	1	81
6578	2017-02-26 23:43:38.471766+00	21856	f	28	1787	82
6579	2017-02-26 23:43:38.487555+00	14	f	57	4	83
6580	2017-02-26 23:43:38.501674+00	134	f	32	4	84
6581	2017-02-26 23:43:38.517423+00	23	f	56	40	85
6582	2017-02-26 23:43:38.531545+00	0	f	134	2	86
6583	2017-02-26 23:43:38.547497+00	13	f	91	1	87
6584	2017-02-26 23:43:38.561591+00	5205	f	36	192	88
6585	2017-02-26 23:43:38.577525+00	120	f	38	2	89
6586	2017-02-26 23:43:38.591667+00	17	f	49	2	90
6587	2017-02-26 23:43:38.60766+00	51	f	43	9	91
6588	2017-02-26 23:43:38.621806+00	657	f	37	28	92
6589	2017-02-26 23:43:38.637885+00	24	f	61	2	93
6590	2017-02-26 23:43:38.651944+00	1472	f	39	40	94
6591	2017-02-26 23:43:38.667996+00	102	f	41	11	95
6592	2017-02-26 23:43:38.682141+00	19	f	60	6	96
6593	2017-02-26 23:43:38.698333+00	46	f	44	3	97
6594	2017-02-26 23:43:38.712248+00	6411	f	40	105	98
6595	2017-02-26 23:53:16.907985+00	3620	f	112	102	1
6596	2017-02-26 23:53:16.979891+00	18266	f	88	792	2
6597	2017-02-26 23:53:16.994092+00	1034	f	109	18	3
6598	2017-02-26 23:53:17.009116+00	664	f	120	52	4
6599	2017-02-26 23:53:17.023932+00	344	f	132	4	5
6600	2017-02-26 23:53:17.039193+00	523	f	115	18	6
6601	2017-02-26 23:53:17.054113+00	185	f	152	19	7
6602	2017-02-26 23:53:17.069157+00	276	f	123	14	8
6603	2017-02-26 23:53:17.086655+00	351	f	105	7	10
6604	2017-02-26 23:53:17.099292+00	265	f	104	3	11
6605	2017-02-26 23:53:17.11409+00	222	f	108	17	12
6606	2017-02-26 23:53:17.129256+00	119	f	128	0	13
6607	2017-02-26 23:53:17.144018+00	99	f	127	14	14
6608	2017-02-26 23:53:20.637703+00	57	f	141	2	17
6609	2017-02-26 23:53:20.783997+00	2449	f	4	63	18
6610	2017-02-26 23:53:20.804114+00	66	f	125	10	19
6611	2017-02-26 23:53:20.819148+00	104	f	107	5	20
6612	2017-02-26 23:53:20.833983+00	39	f	139	3	21
6613	2017-02-26 23:53:20.849118+00	29	f	151	2	22
6614	2017-02-26 23:53:20.863984+00	311	f	31	4	23
6615	2017-02-26 23:53:20.879188+00	29607	t	2	874	24
6616	2017-02-26 23:53:20.893953+00	565	f	10	41	25
6617	2017-02-26 23:53:20.909155+00	432	f	13	35	26
6618	2017-02-26 23:53:20.924061+00	76	f	98	2	27
6619	2017-02-26 23:53:22.642308+00	14318	f	5	832	29
6620	2017-02-26 23:53:22.695236+00	180	f	20	13	30
6621	2017-02-26 23:53:22.709201+00	13	f	156	2	31
6622	2017-02-26 23:53:22.724266+00	58	f	89	22	32
6623	2017-02-26 23:53:22.739188+00	2639	f	6	97	33
6624	2017-02-26 23:53:22.754114+00	2490	f	92	158	34
6625	2017-02-26 23:53:22.769155+00	660	f	8	27	35
6626	2017-02-26 23:53:24.192358+00	19	f	114	2	37
6627	2017-02-26 23:53:24.259388+00	3006	f	7	230	38
6628	2017-02-26 23:53:24.273676+00	1289	f	9	46	39
6629	2017-02-26 23:53:25.828326+00	195	f	11	7	41
6630	2017-02-26 23:53:27.680125+00	12	f	99	1	43
6631	2017-02-26 23:53:27.772876+00	12	f	100	2	44
6632	2017-02-26 23:53:27.787653+00	5	f	148	1	45
6633	2017-02-26 23:53:27.802666+00	5	f	133	0	46
6634	2017-02-26 23:53:27.817515+00	13	f	102	1	47
6635	2017-02-26 23:53:29.63583+00	9	f	101	0	49
6636	2017-02-26 23:53:31.786167+00	2	f	160	0	50
6637	2017-02-26 23:53:31.798552+00	77	f	26	5	51
6638	2017-02-26 23:53:31.813527+00	543	f	12	20	52
6639	2017-02-26 23:53:31.828268+00	416	f	14	23	53
6640	2017-02-26 23:53:33.478716+00	284	f	16	13	55
6641	2017-02-26 23:53:33.553562+00	8	f	106	0	56
6642	2017-02-26 23:53:34.916667+00	3	f	134	2	58
6643	2017-02-26 23:53:36.517752+00	9590	f	15	1047	60
6644	2017-02-26 23:53:36.591754+00	47	f	34	3	61
6645	2017-02-26 23:53:36.608642+00	5	f	126	2	62
6646	2017-02-26 23:53:36.621204+00	5127	f	18	94	63
6647	2017-02-26 23:53:36.636316+00	1348	f	21	12	64
6648	2017-02-26 23:53:38.238532+00	2787	f	22	150	66
6649	2017-02-26 23:53:38.272736+00	2	f	159	0	67
6650	2017-02-26 23:53:38.28536+00	2	f	131	1	68
6651	2017-02-26 23:53:38.300654+00	1	f	157	0	69
6652	2017-02-26 23:53:38.315363+00	0	f	158	1	70
6653	2017-02-26 23:53:39.737007+00	159	f	24	7	72
6654	2017-02-26 23:53:39.789766+00	28	f	46	1	73
6655	2017-02-26 23:53:39.806775+00	58	f	35	3	74
6656	2017-02-26 23:53:39.819564+00	229	f	23	5	75
6657	2017-02-26 23:53:39.834877+00	4497	f	25	290	76
6658	2017-02-26 23:53:41.071456+00	9	f	71	1	78
6659	2017-02-26 23:53:41.143578+00	51	f	30	7	79
6660	2017-02-26 23:53:41.160382+00	94	f	33	11	80
6661	2017-02-26 23:53:41.173292+00	6835	f	27	717	81
6662	2017-02-26 23:53:41.188536+00	79	f	29	9	82
6663	2017-02-26 23:53:41.203745+00	1	f	144	1	83
6664	2017-02-26 23:53:41.220265+00	21856	f	28	1788	84
6665	2017-02-26 23:53:41.233192+00	15	f	57	4	85
6666	2017-02-26 23:53:41.248504+00	132	f	32	4	86
6667	2017-02-26 23:53:41.263207+00	19	f	56	40	87
6668	2017-02-26 23:53:41.278513+00	15	f	91	1	88
6669	2017-02-26 23:53:41.293332+00	5202	f	36	192	89
6670	2017-02-26 23:53:41.353622+00	117	f	38	2	90
6671	2017-02-26 23:53:41.380639+00	16	f	49	2	91
6672	2017-02-26 23:53:41.419101+00	49	f	43	9	92
6673	2017-02-26 23:53:41.433779+00	655	f	37	28	93
6674	2017-02-26 23:53:41.449043+00	24	f	61	2	94
6675	2017-02-26 23:53:41.463721+00	1469	f	39	40	95
6676	2017-02-26 23:53:41.479239+00	99	f	41	11	96
6677	2017-02-26 23:53:41.493845+00	19	f	60	6	97
6678	2017-02-26 23:53:41.509161+00	51	f	44	3	98
6679	2017-02-26 23:53:41.523872+00	6419	f	40	105	99
6680	2017-02-27 00:03:17.182133+00	4172	f	112	116	1
6681	2017-02-27 00:03:17.252238+00	18350	f	88	800	2
6682	2017-02-27 00:03:17.268735+00	1111	f	109	18	3
6683	2017-02-27 00:03:17.284633+00	706	f	120	56	4
6684	2017-02-27 00:03:17.299597+00	403	f	132	6	5
6685	2017-02-27 00:03:17.315358+00	236	f	152	22	6
6686	2017-02-27 00:03:17.33247+00	564	f	115	19	7
6687	2017-02-27 00:03:17.348369+00	302	f	123	14	8
6688	2017-02-27 00:03:17.364073+00	364	f	105	8	10
6689	2017-02-27 00:03:17.378553+00	280	f	104	3	11
6690	2017-02-27 00:03:17.391758+00	226	f	108	17	12
6691	2017-02-27 00:03:17.405864+00	127	f	128	0	13
6692	2017-02-27 00:03:17.421805+00	107	f	127	14	14
6693	2017-02-27 00:03:17.434748+00	69	f	141	2	15
6694	2017-02-27 00:03:20.870836+00	71	f	125	10	18
6695	2017-02-27 00:03:20.975555+00	2466	f	4	64	19
6696	2017-02-27 00:03:21.004753+00	48	f	139	3	20
6697	2017-02-27 00:03:21.021467+00	110	f	107	5	21
6698	2017-02-27 00:03:21.034889+00	33	f	151	4	22
6699	2017-02-27 00:03:21.048453+00	320	f	31	4	23
6700	2017-02-27 00:03:21.064541+00	29604	t	2	874	24
6701	2017-02-27 00:03:21.078675+00	568	f	10	41	25
6702	2017-02-27 00:03:21.09456+00	448	f	13	37	26
6703	2017-02-27 00:03:21.108421+00	75	f	98	2	27
6704	2017-02-27 00:03:22.790461+00	14	f	156	2	29
6705	2017-02-27 00:03:22.846538+00	14322	f	5	832	30
6706	2017-02-27 00:03:22.859636+00	181	f	20	13	31
6707	2017-02-27 00:03:22.876306+00	59	f	89	23	32
6708	2017-02-27 00:03:22.889634+00	2641	f	6	97	33
6709	2017-02-27 00:03:22.903487+00	2500	f	92	158	34
6710	2017-02-27 00:03:22.919584+00	652	f	8	28	35
6711	2017-02-27 00:03:24.271942+00	19	f	114	2	37
6712	2017-02-27 00:03:24.340353+00	3006	f	7	230	38
6713	2017-02-27 00:03:24.353519+00	1287	f	9	46	39
6714	2017-02-27 00:03:26.029987+00	196	f	11	7	41
6715	2017-02-27 00:03:27.625872+00	2	f	160	0	43
6716	2017-02-27 00:03:27.699081+00	12	f	99	1	44
6717	2017-02-27 00:03:27.712737+00	3	f	148	1	45
6718	2017-02-27 00:03:27.728688+00	4	f	133	0	46
6719	2017-02-27 00:03:27.742501+00	11	f	100	2	47
6720	2017-02-27 00:03:27.898644+00	11	f	101	0	48
6721	2017-02-27 00:03:27.953163+00	8	f	102	1	49
6722	2017-02-27 00:03:29.701631+00	537	f	12	20	51
6723	2017-02-27 00:03:29.773982+00	68	f	26	5	52
6724	2017-02-27 00:03:29.787979+00	413	f	14	24	53
6725	2017-02-27 00:03:31.517251+00	282	f	16	13	55
6726	2017-02-27 00:03:31.598966+00	8	f	106	0	56
6727	2017-02-27 00:03:33.250828+00	2	f	134	2	58
6728	2017-02-27 00:03:34.928591+00	9588	f	15	1047	60
6729	2017-02-27 00:03:34.997228+00	52	f	34	3	61
6730	2017-02-27 00:03:35.011498+00	3	f	126	2	62
6731	2017-02-27 00:03:35.026935+00	5127	f	18	94	63
6732	2017-02-27 00:03:35.041402+00	1347	f	21	12	64
6733	2017-02-27 00:03:36.681824+00	2790	f	22	150	66
6734	2017-02-27 00:03:36.761826+00	2	f	159	0	67
6735	2017-02-27 00:03:36.786324+00	0	f	157	0	68
6736	2017-02-27 00:03:38.533502+00	160	f	24	7	70
6737	2017-02-27 00:03:38.646838+00	27	f	46	1	71
6738	2017-02-27 00:03:38.668099+00	57	f	35	3	72
6739	2017-02-27 00:03:38.684942+00	234	f	23	5	73
6740	2017-02-27 00:03:38.701217+00	4490	f	25	290	74
6741	2017-02-27 00:03:40.37295+00	8	f	71	1	76
6742	2017-02-27 00:03:40.44125+00	54	f	30	7	77
6743	2017-02-27 00:03:40.456076+00	94	f	33	11	78
6744	2017-02-27 00:03:40.470946+00	6836	f	27	717	79
6745	2017-02-27 00:03:40.485881+00	85	f	29	9	80
6746	2017-02-27 00:03:40.500774+00	15	f	57	4	81
6747	2017-02-27 00:03:40.515925+00	0	f	144	1	82
6748	2017-02-27 00:03:40.530847+00	21855	f	28	1788	83
6749	2017-02-27 00:03:40.545922+00	131	f	32	4	84
6750	2017-02-27 00:03:40.560841+00	24	f	56	41	85
6751	2017-02-27 00:03:40.575992+00	14	f	91	1	86
6752	2017-02-27 00:03:40.590973+00	2	f	131	1	87
6753	2017-02-27 00:03:40.606066+00	0	f	158	1	88
6754	2017-02-27 00:03:40.620942+00	5205	f	36	192	89
6755	2017-02-27 00:03:40.636092+00	123	f	38	2	90
6756	2017-02-27 00:03:40.651138+00	18	f	49	2	91
6757	2017-02-27 00:03:40.666134+00	51	f	43	9	92
6758	2017-02-27 00:03:40.681093+00	662	f	37	28	93
6759	2017-02-27 00:03:40.696207+00	24	f	61	2	94
6760	2017-02-27 00:03:40.711237+00	1467	f	39	40	95
6761	2017-02-27 00:03:40.726838+00	49	f	44	3	96
6762	2017-02-27 00:03:40.74129+00	99	f	41	11	97
6763	2017-02-27 00:03:40.762806+00	20	f	60	6	98
6764	2017-02-27 00:03:40.776589+00	6418	f	40	105	99
6765	2017-02-27 00:13:17.184658+00	4685	f	112	128	1
6766	2017-02-27 00:13:17.254991+00	18404	f	88	807	2
6767	2017-02-27 00:13:17.267167+00	1173	f	109	19	3
6768	2017-02-27 00:13:17.284237+00	755	f	120	56	4
6769	2017-02-27 00:13:17.297042+00	467	f	132	9	5
6770	2017-02-27 00:13:17.306965+00	293	f	152	22	6
6771	2017-02-27 00:13:17.316975+00	614	f	115	19	7
6772	2017-02-27 00:13:17.326907+00	327	f	123	15	8
6773	2017-02-27 00:13:17.339227+00	379	f	105	8	10
6774	2017-02-27 00:13:17.35448+00	292	f	104	6	11
6775	2017-02-27 00:13:17.366872+00	136	f	128	0	12
6776	2017-02-27 00:13:17.37689+00	234	f	108	18	13
6777	2017-02-27 00:13:17.386865+00	103	f	127	14	14
6778	2017-02-27 00:13:17.396762+00	73	f	141	2	15
6779	2017-02-27 00:13:20.28739+00	80	f	125	10	18
6780	2017-02-27 00:13:20.443983+00	45	f	151	4	19
6781	2017-02-27 00:13:20.455614+00	2470	f	4	65	20
6782	2017-02-27 00:13:20.465549+00	53	f	139	3	21
6783	2017-02-27 00:13:20.475657+00	111	f	107	5	22
6784	2017-02-27 00:13:20.485355+00	319	f	31	4	23
6785	2017-02-27 00:13:20.495304+00	29611	t	2	874	24
6786	2017-02-27 00:13:20.505216+00	566	f	10	41	25
6787	2017-02-27 00:13:20.515288+00	446	f	13	37	26
6788	2017-02-27 00:13:20.525246+00	76	f	98	2	27
6789	2017-02-27 00:13:20.535763+00	17	f	156	2	28
6790	2017-02-27 00:13:22.254694+00	14320	f	5	832	30
6791	2017-02-27 00:13:22.317937+00	179	f	20	13	31
6792	2017-02-27 00:13:22.330635+00	62	f	89	23	32
6793	2017-02-27 00:13:22.340544+00	2636	f	6	97	33
6794	2017-02-27 00:13:22.35046+00	2496	f	92	158	34
6795	2017-02-27 00:13:22.360364+00	657	f	8	28	35
6796	2017-02-27 00:13:23.67483+00	17	f	114	2	37
6797	2017-02-27 00:13:23.74172+00	3010	f	7	230	38
6798	2017-02-27 00:13:23.754281+00	1292	f	9	47	39
6799	2017-02-27 00:13:25.452603+00	196	f	11	7	41
6800	2017-02-27 00:13:28.892277+00	3	f	161	0	43
6801	2017-02-27 00:13:28.908025+00	12	f	99	1	44
6802	2017-02-27 00:13:28.924511+00	13	f	100	2	45
6803	2017-02-27 00:13:28.937688+00	4	f	148	1	46
6804	2017-02-27 00:13:28.954409+00	5	f	133	0	47
6805	2017-02-27 00:13:30.58107+00	12	f	102	1	49
6806	2017-02-27 00:13:30.660375+00	9	f	101	0	50
6807	2017-02-27 00:13:30.672547+00	539	f	12	20	51
6808	2017-02-27 00:13:30.688758+00	68	f	26	5	52
6809	2017-02-27 00:13:30.702304+00	413	f	14	24	53
6810	2017-02-27 00:13:32.404867+00	285	f	16	13	55
6811	2017-02-27 00:13:32.474975+00	9	f	106	0	56
6812	2017-02-27 00:13:33.773827+00	3	f	134	2	58
6813	2017-02-27 00:13:35.415534+00	9587	f	15	1047	60
6814	2017-02-27 00:13:35.50355+00	50	f	34	3	61
6815	2017-02-27 00:13:35.515318+00	3	f	126	2	62
6816	2017-02-27 00:13:35.531349+00	5123	f	18	95	63
6817	2017-02-27 00:13:35.544967+00	1343	f	21	12	64
6818	2017-02-27 00:13:36.978867+00	2793	f	22	150	66
6819	2017-02-27 00:13:37.047011+00	2	f	159	0	67
6820	2017-02-27 00:13:37.059257+00	0	f	157	0	68
6821	2017-02-27 00:13:38.650378+00	156	f	24	7	70
6822	2017-02-27 00:13:38.721281+00	26	f	46	1	71
6823	2017-02-27 00:13:38.743989+00	58	f	35	3	72
6824	2017-02-27 00:13:38.75861+00	229	f	23	5	73
6825	2017-02-27 00:13:38.773943+00	4495	f	25	290	74
6826	2017-02-27 00:13:40.090781+00	52	f	30	7	76
6827	2017-02-27 00:13:40.117622+00	94	f	33	11	77
6828	2017-02-27 00:13:40.132148+00	6842	f	27	717	78
6829	2017-02-27 00:13:40.147349+00	16	f	57	4	79
6830	2017-02-27 00:13:40.162164+00	85	f	29	9	80
6831	2017-02-27 00:13:40.177438+00	6	f	71	1	81
6832	2017-02-27 00:13:40.242816+00	21853	f	28	1788	82
6833	2017-02-27 00:13:40.275367+00	131	f	32	4	83
6834	2017-02-27 00:13:40.32327+00	23	f	56	41	84
6835	2017-02-27 00:13:40.338243+00	15	f	91	1	85
6836	2017-02-27 00:13:40.352925+00	0	f	131	1	86
6837	2017-02-27 00:13:40.368064+00	0	f	158	2	87
6838	2017-02-27 00:13:40.382754+00	5216	f	36	192	88
6839	2017-02-27 00:13:40.397969+00	119	f	38	2	89
6840	2017-02-27 00:13:40.441969+00	18	f	49	2	90
6841	2017-02-27 00:13:40.46317+00	49	f	43	9	91
6842	2017-02-27 00:13:40.478311+00	657	f	37	28	92
6843	2017-02-27 00:13:40.493006+00	25	f	61	2	93
6844	2017-02-27 00:13:40.508337+00	1470	f	39	40	94
6845	2017-02-27 00:13:40.523126+00	48	f	44	3	95
6846	2017-02-27 00:13:40.538365+00	101	f	41	11	96
6847	2017-02-27 00:13:40.553207+00	19	f	60	6	97
6848	2017-02-27 00:13:40.568426+00	6413	f	40	105	98
6849	2017-02-27 00:23:17.738943+00	5210	f	112	149	1
6850	2017-02-27 00:23:17.798329+00	18468	f	88	813	2
6851	2017-02-27 00:23:17.815076+00	1246	f	109	20	3
6852	2017-02-27 00:23:17.827851+00	807	f	120	61	4
6853	2017-02-27 00:23:17.843176+00	349	f	152	26	5
6854	2017-02-27 00:23:17.85757+00	523	f	132	10	6
6855	2017-02-27 00:23:17.873273+00	657	f	115	19	7
6856	2017-02-27 00:23:17.887592+00	369	f	123	15	8
6857	2017-02-27 00:23:17.903177+00	408	f	105	10	9
6858	2017-02-27 00:23:17.920098+00	306	f	104	7	11
6859	2017-02-27 00:23:17.935079+00	147	f	128	0	12
6860	2017-02-27 00:23:17.947694+00	245	f	108	18	13
6861	2017-02-27 00:23:17.963366+00	83	f	141	2	14
6862	2017-02-27 00:23:17.977761+00	112	f	127	14	15
6863	2017-02-27 00:23:20.859178+00	83	f	125	10	18
6864	2017-02-27 00:23:20.967162+00	43	f	151	4	19
6865	2017-02-27 00:23:20.983447+00	55	f	139	3	20
6866	2017-02-27 00:23:20.995825+00	2470	f	4	66	21
6867	2017-02-27 00:23:21.011836+00	119	f	107	5	22
6868	2017-02-27 00:23:21.025734+00	329	f	31	4	23
6869	2017-02-27 00:23:21.041695+00	29610	t	2	874	24
6870	2017-02-27 00:23:21.055845+00	574	f	10	41	25
6871	2017-02-27 00:23:21.071782+00	449	f	13	37	26
6872	2017-02-27 00:23:21.085924+00	83	f	98	2	27
6873	2017-02-27 00:23:21.101876+00	20	f	156	2	28
6874	2017-02-27 00:23:22.845161+00	14332	f	5	832	30
6875	2017-02-27 00:23:22.968781+00	176	f	20	13	31
6876	2017-02-27 00:23:22.99744+00	66	f	89	24	32
6877	2017-02-27 00:23:23.011248+00	2637	f	6	97	33
6878	2017-02-27 00:23:23.02724+00	2504	f	92	158	34
6879	2017-02-27 00:23:23.041133+00	659	f	8	28	35
6880	2017-02-27 00:23:24.369831+00	17	f	114	2	37
6881	2017-02-27 00:23:24.442848+00	3011	f	7	230	38
6882	2017-02-27 00:23:24.454954+00	1286	f	9	47	39
6883	2017-02-27 00:23:26.102389+00	195	f	11	7	41
6884	2017-02-27 00:23:27.895232+00	8	f	133	1	43
6885	2017-02-27 00:23:28.042128+00	14	f	99	1	44
6886	2017-02-27 00:23:28.071064+00	13	f	100	2	45
6887	2017-02-27 00:23:28.084268+00	5	f	148	1	46
6888	2017-02-27 00:23:30.126456+00	11	f	106	0	48
6889	2017-02-27 00:23:30.199943+00	9	f	101	0	49
6890	2017-02-27 00:23:30.216098+00	543	f	12	20	50
6891	2017-02-27 00:23:30.229393+00	71	f	26	5	51
6892	2017-02-27 00:23:30.239443+00	9	f	102	1	52
6893	2017-02-27 00:23:30.249382+00	422	f	14	24	53
6894	2017-02-27 00:23:30.259744+00	3	f	159	1	54
6895	2017-02-27 00:23:30.269499+00	288	f	16	13	55
6896	2017-02-27 00:23:33.123455+00	3	f	134	3	58
6897	2017-02-27 00:23:34.787409+00	9585	f	15	1047	60
6898	2017-02-27 00:23:34.86015+00	53	f	34	3	61
6899	2017-02-27 00:23:34.871493+00	5	f	126	2	62
6900	2017-02-27 00:23:34.881361+00	5131	f	18	95	63
6901	2017-02-27 00:23:34.891295+00	1	f	161	0	64
6902	2017-02-27 00:23:34.901175+00	1344	f	21	12	65
6903	2017-02-27 00:23:36.469038+00	2792	f	22	150	67
6904	2017-02-27 00:23:36.525888+00	0	f	158	3	68
6905	2017-02-27 00:23:38.52471+00	162	f	24	7	70
6906	2017-02-27 00:23:38.549354+00	26	f	46	1	71
6907	2017-02-27 00:23:38.560834+00	62	f	35	3	72
6908	2017-02-27 00:23:38.570865+00	235	f	23	5	73
6909	2017-02-27 00:23:38.580778+00	4494	f	25	290	74
6910	2017-02-27 00:23:39.854365+00	52	f	30	7	76
6911	2017-02-27 00:23:39.924807+00	92	f	33	11	77
6912	2017-02-27 00:23:39.934631+00	6837	f	27	717	78
6913	2017-02-27 00:23:39.944479+00	82	f	29	9	79
6914	2017-02-27 00:23:39.954533+00	21848	f	28	1789	80
6915	2017-02-27 00:23:39.96451+00	17	f	57	4	81
6916	2017-02-27 00:23:39.974622+00	130	f	32	4	82
6917	2017-02-27 00:23:39.984527+00	6	f	71	1	83
6918	2017-02-27 00:23:39.994618+00	13	f	91	1	84
6919	2017-02-27 00:23:40.004556+00	17	f	56	41	85
6920	2017-02-27 00:23:40.014643+00	0	f	131	1	86
6921	2017-02-27 00:23:40.024648+00	0	f	157	0	87
6922	2017-02-27 00:23:40.034594+00	5204	f	36	192	88
6923	2017-02-27 00:23:40.044604+00	117	f	38	2	89
6924	2017-02-27 00:23:40.054566+00	16	f	49	2	90
6925	2017-02-27 00:23:40.064712+00	50	f	43	9	91
6926	2017-02-27 00:23:40.074797+00	656	f	37	28	92
6927	2017-02-27 00:23:40.084793+00	25	f	61	2	93
6928	2017-02-27 00:23:40.094896+00	1462	f	39	40	94
6929	2017-02-27 00:23:40.11382+00	46	f	44	3	95
6930	2017-02-27 00:23:40.124993+00	98	f	41	11	96
6931	2017-02-27 00:23:40.135009+00	19	f	60	6	97
6932	2017-02-27 00:23:40.145003+00	6409	f	40	105	98
6933	2017-02-27 00:33:17.901842+00	5690	f	112	166	1
6934	2017-02-27 00:33:17.965543+00	18525	f	88	815	2
6935	2017-02-27 00:33:17.975162+00	422	f	152	27	3
6936	2017-02-27 00:33:17.985082+00	1299	f	109	21	4
6937	2017-02-27 00:33:17.995111+00	864	f	120	64	5
6938	2017-02-27 00:33:18.005021+00	583	f	132	11	6
6939	2017-02-27 00:33:18.015094+00	691	f	115	20	7
6940	2017-02-27 00:33:18.025036+00	411	f	123	17	8
6941	2017-02-27 00:33:18.04473+00	427	f	105	10	9
6942	2017-02-27 00:33:18.064662+00	179	f	128	0	11
6943	2017-02-27 00:33:18.081399+00	330	f	104	7	12
6944	2017-02-27 00:33:18.095303+00	253	f	108	18	13
6945	2017-02-27 00:33:18.111861+00	99	f	141	2	14
6946	2017-02-27 00:33:18.125043+00	116	f	127	15	15
6947	2017-02-27 00:33:19.635744+00	94	f	125	10	17
6948	2017-02-27 00:33:19.823102+00	65	f	139	3	18
6949	2017-02-27 00:33:21.202374+00	45	f	151	5	20
6950	2017-02-27 00:33:21.273588+00	125	f	107	5	21
6951	2017-02-27 00:33:21.290251+00	2474	f	4	66	22
6952	2017-02-27 00:33:21.303313+00	336	f	31	4	23
6953	2017-02-27 00:33:21.319583+00	29610	t	2	874	24
6954	2017-02-27 00:33:21.333231+00	580	f	10	41	25
6955	2017-02-27 00:33:21.349587+00	462	f	13	37	26
6956	2017-02-27 00:33:21.363287+00	85	f	98	2	27
6957	2017-02-27 00:33:21.373289+00	18	f	156	3	28
6958	2017-02-27 00:33:23.18344+00	181	f	20	13	30
6959	2017-02-27 00:33:23.465112+00	14322	f	5	832	31
6960	2017-02-27 00:33:23.489066+00	68	f	89	24	32
6961	2017-02-27 00:33:23.505544+00	2642	f	6	97	33
6962	2017-02-27 00:33:23.51901+00	2500	f	92	158	34
6963	2017-02-27 00:33:23.535649+00	659	f	8	28	35
6964	2017-02-27 00:33:24.982154+00	20	f	114	2	37
6965	2017-02-27 00:33:25.053376+00	10	f	133	1	38
6966	2017-02-27 00:33:25.070506+00	3	f	158	3	39
6967	2017-02-27 00:33:25.08301+00	3008	f	7	230	40
6968	2017-02-27 00:33:25.093027+00	1289	f	9	47	41
6969	2017-02-27 00:33:25.102941+00	200	f	11	7	42
6970	2017-02-27 00:33:28.255258+00	14	f	99	1	45
6971	2017-02-27 00:33:30.051027+00	11	f	100	2	47
6972	2017-02-27 00:33:30.123912+00	9	f	106	0	48
6973	2017-02-27 00:33:30.135694+00	10	f	101	0	49
6974	2017-02-27 00:33:30.145535+00	3	f	134	2	50
6975	2017-02-27 00:33:30.1555+00	542	f	12	20	51
6976	2017-02-27 00:33:30.165397+00	70	f	26	5	52
6977	2017-02-27 00:33:30.175415+00	8	f	102	1	53
6978	2017-02-27 00:33:30.185558+00	413	f	14	24	54
6979	2017-02-27 00:33:30.195628+00	3	f	148	1	55
6980	2017-02-27 00:33:30.205528+00	289	f	16	13	56
6981	2017-02-27 00:33:34.742916+00	9592	f	15	1048	60
6982	2017-02-27 00:33:34.797669+00	49	f	34	3	61
6983	2017-02-27 00:33:34.807615+00	3	f	126	1	62
6984	2017-02-27 00:33:36.70045+00	2	f	162	0	63
6985	2017-02-27 00:33:39.026303+00	0	f	163	0	64
6986	2017-02-27 00:33:39.038766+00	5123	f	18	95	65
6987	2017-02-27 00:33:39.048591+00	1	f	161	1	66
6988	2017-02-27 00:33:40.644842+00	1343	f	21	12	68
6989	2017-02-27 00:33:40.691448+00	2790	f	22	150	69
6990	2017-02-27 00:33:40.702821+00	2	f	159	1	70
6991	2017-02-27 00:33:42.441553+00	157	f	24	7	72
6992	2017-02-27 00:33:42.515962+00	27	f	46	1	73
6993	2017-02-27 00:33:42.527401+00	60	f	35	3	74
6994	2017-02-27 00:33:42.537311+00	233	f	23	5	75
6995	2017-02-27 00:33:42.547293+00	4484	f	25	290	76
6996	2017-02-27 00:33:43.917479+00	50	f	30	7	78
6997	2017-02-27 00:33:43.98018+00	94	f	33	11	79
6998	2017-02-27 00:33:43.991145+00	6836	f	27	717	80
6999	2017-02-27 00:33:44.001051+00	81	f	29	9	81
7000	2017-02-27 00:33:44.010993+00	21854	f	28	1789	82
7001	2017-02-27 00:33:44.020856+00	14	f	57	4	83
7002	2017-02-27 00:33:44.030908+00	129	f	32	4	84
7003	2017-02-27 00:33:44.040776+00	7	f	71	1	85
7004	2017-02-27 00:33:44.050875+00	13	f	91	1	86
7005	2017-02-27 00:33:44.060762+00	16	f	56	41	87
7006	2017-02-27 00:33:44.070818+00	0	f	131	1	88
7007	2017-02-27 00:33:44.080786+00	5211	f	36	192	89
7008	2017-02-27 00:33:44.090867+00	116	f	38	2	90
7009	2017-02-27 00:33:44.100725+00	50	f	43	9	91
7010	2017-02-27 00:33:44.110877+00	15	f	49	2	92
7011	2017-02-27 00:33:44.120901+00	656	f	37	28	93
7012	2017-02-27 00:33:44.13094+00	1472	f	39	40	94
7013	2017-02-27 00:33:44.140932+00	51	f	44	3	95
7014	2017-02-27 00:33:44.151163+00	100	f	41	11	96
7015	2017-02-27 00:33:44.160871+00	22	f	61	2	97
7016	2017-02-27 00:33:44.171023+00	6419	f	40	105	98
7017	2017-02-27 00:43:18.432976+00	6186	f	112	183	1
7018	2017-02-27 00:43:18.502616+00	18585	f	88	821	2
7019	2017-02-27 00:43:18.519752+00	493	f	152	29	3
7020	2017-02-27 00:43:18.532147+00	1363	f	109	22	4
7021	2017-02-27 00:43:18.542139+00	649	f	132	12	5
7022	2017-02-27 00:43:18.552251+00	913	f	120	65	6
7023	2017-02-27 00:43:18.566388+00	730	f	115	20	7
7024	2017-02-27 00:43:18.582152+00	438	f	123	18	8
7025	2017-02-27 00:43:18.591824+00	451	f	105	10	9
7026	2017-02-27 00:43:18.605785+00	188	f	128	1	11
7027	2017-02-27 00:43:18.621304+00	344	f	104	8	12
7028	2017-02-27 00:43:18.631784+00	118	f	141	3	13
7029	2017-02-27 00:43:18.642011+00	266	f	108	18	14
7030	2017-02-27 00:43:18.65178+00	124	f	127	16	15
7031	2017-02-27 00:43:20.115404+00	76	f	139	3	17
7032	2017-02-27 00:43:20.187263+00	100	f	125	10	18
7033	2017-02-27 00:43:20.206114+00	57	f	151	5	19
7034	2017-02-27 00:43:21.752146+00	128	f	107	5	21
7035	2017-02-27 00:43:21.820919+00	2478	f	4	66	22
7036	2017-02-27 00:43:21.83121+00	342	f	31	4	23
7037	2017-02-27 00:43:21.84108+00	29614	t	2	874	24
7038	2017-02-27 00:43:21.851102+00	21	f	156	4	25
7039	2017-02-27 00:43:21.861017+00	579	f	10	41	26
7040	2017-02-27 00:43:21.871174+00	458	f	13	37	27
7041	2017-02-27 00:43:21.881071+00	83	f	98	2	28
7042	2017-02-27 00:43:23.559917+00	180	f	20	13	30
7043	2017-02-27 00:43:23.616173+00	14326	f	5	832	31
7044	2017-02-27 00:43:23.625991+00	69	f	89	24	32
7045	2017-02-27 00:43:23.635972+00	2636	f	6	97	33
7046	2017-02-27 00:43:23.645866+00	6	f	158	3	34
7047	2017-02-27 00:43:23.655881+00	2499	f	92	158	35
7048	2017-02-27 00:43:23.66591+00	657	f	8	28	36
7049	2017-02-27 00:43:25.096274+00	22	f	114	2	38
7050	2017-02-27 00:43:25.179681+00	10	f	133	1	39
7051	2017-02-27 00:43:25.200614+00	3015	f	7	230	40
7052	2017-02-27 00:43:25.217333+00	1291	f	9	47	41
7053	2017-02-27 00:43:25.230383+00	199	f	11	7	42
7054	2017-02-27 00:43:28.857113+00	12	f	99	1	45
7055	2017-02-27 00:43:30.663327+00	12	f	100	2	47
7056	2017-02-27 00:43:32.694173+00	2	f	164	0	48
7057	2017-02-27 00:43:32.710633+00	10	f	106	0	49
7058	2017-02-27 00:43:32.726218+00	2	f	161	1	50
7059	2017-02-27 00:43:32.740113+00	9	f	101	0	51
7060	2017-02-27 00:43:32.756179+00	3	f	134	2	52
7061	2017-02-27 00:43:32.770132+00	540	f	12	20	53
7062	2017-02-27 00:43:32.786166+00	74	f	26	5	54
7063	2017-02-27 00:43:32.800144+00	9	f	102	1	55
7064	2017-02-27 00:43:32.816273+00	416	f	14	24	56
7065	2017-02-27 00:43:32.830254+00	1	f	148	1	57
7066	2017-02-27 00:43:32.84635+00	283	f	16	13	58
7067	2017-02-27 00:43:37.466789+00	9597	f	15	1048	62
7068	2017-02-27 00:43:37.522804+00	47	f	34	3	63
7069	2017-02-27 00:43:37.538327+00	3	f	126	1	64
7070	2017-02-27 00:43:37.552588+00	2	f	162	1	65
7071	2017-02-27 00:43:37.568147+00	0	f	163	0	66
7072	2017-02-27 00:43:37.582537+00	5122	f	18	95	67
7073	2017-02-27 00:43:39.068194+00	1342	f	21	12	69
7074	2017-02-27 00:43:39.137098+00	2786	f	22	150	70
7075	2017-02-27 00:43:39.152538+00	2	f	159	1	71
7076	2017-02-27 00:43:40.724952+00	163	f	24	7	73
7077	2017-02-27 00:43:40.781586+00	28	f	46	1	74
7078	2017-02-27 00:43:40.796675+00	55	f	35	3	75
7079	2017-02-27 00:43:40.811453+00	230	f	23	5	76
7080	2017-02-27 00:43:40.826626+00	4492	f	25	290	77
7081	2017-02-27 00:43:42.237297+00	51	f	30	7	79
7082	2017-02-27 00:43:42.295848+00	94	f	33	11	80
7083	2017-02-27 00:43:42.311089+00	6837	f	27	717	81
7084	2017-02-27 00:43:42.325449+00	79	f	29	9	82
7085	2017-02-27 00:43:42.340543+00	21849	f	28	1791	83
7086	2017-02-27 00:43:42.355294+00	14	f	57	4	84
7087	2017-02-27 00:43:42.370508+00	129	f	32	4	85
7088	2017-02-27 00:43:42.385294+00	6	f	71	1	86
7089	2017-02-27 00:43:42.405353+00	11	f	91	1	87
7090	2017-02-27 00:43:42.415369+00	17	f	56	41	88
7091	2017-02-27 00:43:42.425392+00	1	f	131	1	89
7092	2017-02-27 00:43:42.435348+00	5207	f	36	192	90
7093	2017-02-27 00:43:42.445346+00	120	f	38	2	91
7094	2017-02-27 00:43:42.455371+00	52	f	43	9	92
7095	2017-02-27 00:43:42.46543+00	16	f	49	2	93
7096	2017-02-27 00:43:42.475459+00	654	f	37	28	94
7097	2017-02-27 00:43:42.495797+00	1467	f	39	40	95
7098	2017-02-27 00:43:42.515679+00	51	f	44	3	96
7099	2017-02-27 00:43:42.52563+00	101	f	41	11	97
7100	2017-02-27 00:43:42.535839+00	24	f	61	2	98
7101	2017-02-27 00:43:42.551911+00	6411	f	40	105	99
7102	2017-02-27 00:53:18.375293+00	6713	f	112	201	1
7103	2017-02-27 00:53:18.440926+00	18651	f	88	822	2
7104	2017-02-27 00:53:18.457916+00	591	f	152	34	3
7105	2017-02-27 00:53:18.470637+00	740	f	132	12	4
7106	2017-02-27 00:53:18.48091+00	1433	f	109	22	5
7107	2017-02-27 00:53:18.490656+00	964	f	120	68	6
7108	2017-02-27 00:53:18.500637+00	765	f	115	20	7
7109	2017-02-27 00:53:18.510723+00	466	f	123	18	8
7110	2017-02-27 00:53:18.520775+00	472	f	105	11	9
7111	2017-02-27 00:53:18.531502+00	213	f	128	1	10
7112	2017-02-27 00:53:18.551331+00	359	f	104	8	12
7113	2017-02-27 00:53:18.561262+00	137	f	141	3	13
7114	2017-02-27 00:53:18.571215+00	277	f	108	19	14
7115	2017-02-27 00:53:18.58117+00	131	f	127	16	15
7116	2017-02-27 00:53:20.028561+00	64	f	151	5	17
7117	2017-02-27 00:53:20.1661+00	110	f	125	10	18
7118	2017-02-27 00:53:20.182698+00	80	f	139	3	19
7119	2017-02-27 00:53:21.717458+00	130	f	107	5	21
7120	2017-02-27 00:53:21.808967+00	2478	f	4	66	22
7121	2017-02-27 00:53:21.830147+00	350	f	31	4	23
7122	2017-02-27 00:53:21.846999+00	29615	t	2	874	24
7123	2017-02-27 00:53:21.859954+00	20	f	156	5	25
7124	2017-02-27 00:53:21.86991+00	460	f	13	37	26
7125	2017-02-27 00:53:21.879937+00	569	f	10	41	27
7126	2017-02-27 00:53:21.88988+00	80	f	98	2	28
7127	2017-02-27 00:53:23.601263+00	179	f	20	13	30
7128	2017-02-27 00:53:23.654885+00	14333	f	5	832	31
7129	2017-02-27 00:53:23.664642+00	70	f	89	24	32
7130	2017-02-27 00:53:23.674599+00	8	f	158	4	33
7131	2017-02-27 00:53:23.684706+00	2636	f	6	97	34
7132	2017-02-27 00:53:23.694454+00	2498	f	92	158	35
7133	2017-02-27 00:53:23.70447+00	661	f	8	28	36
7134	2017-02-27 00:53:25.061837+00	19	f	114	2	38
7135	2017-02-27 00:53:25.229563+00	11	f	133	1	39
7136	2017-02-27 00:53:25.246009+00	3008	f	7	230	40
7137	2017-02-27 00:53:25.259036+00	1295	f	9	47	41
7138	2017-02-27 00:53:25.268916+00	199	f	11	7	42
7139	2017-02-27 00:53:28.352359+00	13	f	100	2	45
7140	2017-02-27 00:53:28.436379+00	14	f	99	1	46
7141	2017-02-27 00:53:30.149995+00	2	f	164	0	48
7142	2017-02-27 00:53:30.252378+00	9	f	106	0	49
7143	2017-02-27 00:53:30.268995+00	12	f	101	0	50
7144	2017-02-27 00:53:30.281889+00	538	f	12	20	51
7145	2017-02-27 00:53:30.291855+00	72	f	26	5	52
7146	2017-02-27 00:53:30.301818+00	8	f	102	1	53
7147	2017-02-27 00:53:30.31179+00	419	f	14	24	54
7148	2017-02-27 00:53:30.32178+00	1	f	159	1	55
7149	2017-02-27 00:53:30.331804+00	286	f	16	13	56
7150	2017-02-27 00:53:33.339587+00	3	f	134	2	59
7151	2017-02-27 00:53:34.864003+00	9587	f	15	1048	61
7152	2017-02-27 00:53:35.035502+00	46	f	34	4	62
7153	2017-02-27 00:53:35.052093+00	2	f	148	1	63
7154	2017-02-27 00:53:35.064601+00	4	f	126	1	64
7155	2017-02-27 00:53:35.074458+00	0	f	162	1	65
7156	2017-02-27 00:53:35.084406+00	0	f	163	0	66
7157	2017-02-27 00:53:35.094431+00	5126	f	18	95	67
7158	2017-02-27 00:53:35.104309+00	0	f	161	1	68
7159	2017-02-27 00:53:36.776076+00	1348	f	21	12	70
7160	2017-02-27 00:53:36.849565+00	2787	f	22	150	71
7161	2017-02-27 00:53:38.425716+00	158	f	24	7	73
7162	2017-02-27 00:53:38.483647+00	24	f	46	1	74
7163	2017-02-27 00:53:38.500449+00	56	f	35	3	75
7164	2017-02-27 00:53:38.51348+00	231	f	23	5	76
7165	2017-02-27 00:53:38.524114+00	4489	f	25	290	77
7166	2017-02-27 00:53:39.825459+00	50	f	30	7	79
7167	2017-02-27 00:53:39.877349+00	1	f	118	0	80
7168	2017-02-27 00:53:40.04744+00	94	f	33	11	81
7169	2017-02-27 00:53:40.057688+00	6839	f	27	717	82
7170	2017-02-27 00:53:40.067649+00	79	f	29	9	83
7171	2017-02-27 00:53:40.07756+00	21859	f	28	1792	84
7172	2017-02-27 00:53:40.087448+00	16	f	57	4	85
7173	2017-02-27 00:53:40.097429+00	127	f	32	4	86
7174	2017-02-27 00:53:40.107462+00	4	f	71	1	87
7175	2017-02-27 00:53:40.1248+00	15	f	91	1	88
7176	2017-02-27 00:53:40.137636+00	21	f	56	41	89
7177	2017-02-27 00:53:40.147635+00	0	f	131	1	90
7178	2017-02-27 00:53:40.15754+00	5208	f	36	192	91
7179	2017-02-27 00:53:40.167789+00	118	f	38	2	92
7180	2017-02-27 00:53:40.17765+00	54	f	43	9	93
7181	2017-02-27 00:53:40.187739+00	16	f	49	2	94
7182	2017-02-27 00:53:40.197747+00	659	f	37	28	95
7183	2017-02-27 00:53:40.207813+00	1472	f	39	40	96
7184	2017-02-27 00:53:40.217731+00	48	f	44	3	97
7185	2017-02-27 00:53:40.227727+00	100	f	41	11	98
7186	2017-02-27 00:53:40.237724+00	23	f	61	2	99
7187	2017-02-27 01:03:18.839545+00	7237	f	112	215	1
7188	2017-02-27 01:03:18.910652+00	18709	f	88	824	2
7189	2017-02-27 01:03:18.927472+00	676	f	152	35	3
7190	2017-02-27 01:03:18.940003+00	819	f	132	14	4
7191	2017-02-27 01:03:18.950035+00	1482	f	109	22	5
7192	2017-02-27 01:03:18.960177+00	1011	f	120	72	6
7193	2017-02-27 01:03:18.969905+00	796	f	115	20	7
7194	2017-02-27 01:03:18.97985+00	493	f	123	20	8
7195	2017-02-27 01:03:18.990014+00	483	f	105	12	9
7196	2017-02-27 01:03:18.999956+00	231	f	128	1	10
7197	2017-02-27 01:03:19.012462+00	153	f	141	4	12
7198	2017-02-27 01:03:19.027353+00	371	f	104	8	13
7199	2017-02-27 01:03:19.040027+00	273	f	108	19	14
7200	2017-02-27 01:03:19.05006+00	130	f	127	17	15
7201	2017-02-27 01:03:19.060012+00	75	f	151	5	16
7202	2017-02-27 01:03:20.513469+00	82	f	139	3	18
7203	2017-02-27 01:03:20.584961+00	117	f	125	10	19
7204	2017-02-27 01:03:22.100159+00	137	f	107	5	21
7205	2017-02-27 01:03:22.264844+00	2481	f	4	66	22
7206	2017-02-27 01:03:22.286985+00	353	f	31	4	23
7207	2017-02-27 01:03:22.299334+00	23	f	156	5	24
7208	2017-02-27 01:03:22.309179+00	29614	t	2	874	25
7209	2017-02-27 01:03:22.319192+00	575	f	10	41	26
7210	2017-02-27 01:03:22.329098+00	468	f	13	37	27
7211	2017-02-27 01:03:22.339085+00	89	f	98	2	28
7212	2017-02-27 01:03:24.026332+00	185	f	20	13	30
7213	2017-02-27 01:03:24.071652+00	14324	f	5	832	31
7214	2017-02-27 01:03:24.084266+00	68	f	89	24	32
7215	2017-02-27 01:03:24.094227+00	2640	f	6	97	33
7216	2017-02-27 01:03:24.104195+00	2501	f	92	158	34
7217	2017-02-27 01:03:24.114021+00	660	f	8	28	35
7218	2017-02-27 01:03:25.432313+00	20	f	114	2	37
7219	2017-02-27 01:03:25.498151+00	4	f	158	4	38
7220	2017-02-27 01:03:25.515149+00	11	f	133	1	39
7221	2017-02-27 01:03:25.527776+00	3010	f	7	230	40
7222	2017-02-27 01:03:25.537741+00	1292	f	9	47	41
7223	2017-02-27 01:03:25.547651+00	200	f	11	7	42
7224	2017-02-27 01:03:28.996375+00	14	f	100	2	45
7225	2017-02-27 01:03:29.281497+00	13	f	99	1	46
7226	2017-02-27 01:03:32.867287+00	2	f	165	0	48
7227	2017-02-27 01:03:32.914982+00	2	f	164	0	49
7228	2017-02-27 01:03:32.954602+00	8	f	106	0	50
7229	2017-02-27 01:03:32.96746+00	10	f	101	0	51
7230	2017-02-27 01:03:32.977415+00	538	f	12	20	52
7231	2017-02-27 01:03:32.992183+00	72	f	26	5	53
7232	2017-02-27 01:03:33.007393+00	10	f	102	1	54
7233	2017-02-27 01:03:33.017097+00	420	f	14	24	55
7234	2017-02-27 01:03:33.027252+00	3	f	148	1	56
7235	2017-02-27 01:03:33.037156+00	285	f	16	13	57
7236	2017-02-27 01:03:37.245575+00	3	f	134	2	60
7237	2017-02-27 01:03:38.839455+00	9592	f	15	1048	62
7238	2017-02-27 01:03:38.910416+00	51	f	34	4	63
7239	2017-02-27 01:03:38.923299+00	1	f	126	1	64
7240	2017-02-27 01:03:38.940186+00	5131	f	18	95	65
7241	2017-02-27 01:03:38.953037+00	0	f	161	2	66
7242	2017-02-27 01:03:38.963074+00	1350	f	21	12	67
7243	2017-02-27 01:03:40.651492+00	2789	f	22	150	69
7244	2017-02-27 01:03:40.677419+00	1	f	159	1	70
7245	2017-02-27 01:03:42.259427+00	162	f	24	7	72
7246	2017-02-27 01:03:42.347071+00	26	f	46	1	73
7247	2017-02-27 01:03:42.369308+00	57	f	35	3	74
7248	2017-02-27 01:03:42.382424+00	231	f	23	5	75
7249	2017-02-27 01:03:42.399255+00	4496	f	25	290	76
7250	2017-02-27 01:03:44.243502+00	49	f	30	7	78
7251	2017-02-27 01:03:44.314429+00	4	f	118	0	79
7252	2017-02-27 01:03:44.327337+00	94	f	33	11	80
7253	2017-02-27 01:03:44.337328+00	6838	f	27	717	81
7254	2017-02-27 01:03:44.347283+00	82	f	29	9	82
7255	2017-02-27 01:03:44.357298+00	21859	f	28	1792	83
7256	2017-02-27 01:03:44.367271+00	130	f	32	4	84
7257	2017-02-27 01:03:44.377243+00	15	f	57	4	85
7258	2017-02-27 01:03:44.394631+00	6	f	71	1	86
7259	2017-02-27 01:03:44.404667+00	11	f	91	1	87
7260	2017-02-27 01:03:44.414717+00	20	f	56	41	88
7261	2017-02-27 01:03:44.424958+00	0	f	131	1	89
7262	2017-02-27 01:03:44.434843+00	5204	f	36	192	90
7263	2017-02-27 01:03:44.444815+00	124	f	38	2	91
7264	2017-02-27 01:03:44.454863+00	51	f	43	9	92
7265	2017-02-27 01:03:44.464946+00	15	f	49	2	93
7266	2017-02-27 01:03:44.474941+00	655	f	37	28	94
7267	2017-02-27 01:03:44.484993+00	22	f	61	2	95
7268	2017-02-27 01:03:44.500043+00	1472	f	39	40	96
7269	2017-02-27 01:03:44.515189+00	50	f	44	3	97
7270	2017-02-27 01:03:44.524873+00	99	f	41	11	98
7271	2017-02-27 01:03:44.534886+00	6414	f	40	105	99
7272	2017-02-27 01:13:18.90061+00	7685	f	112	226	1
7273	2017-02-27 01:13:18.970681+00	18759	f	88	826	2
7274	2017-02-27 01:13:18.987214+00	769	f	152	41	3
7275	2017-02-27 01:13:19.003439+00	890	f	132	16	4
7276	2017-02-27 01:13:19.017196+00	1533	f	109	22	5
7277	2017-02-27 01:13:19.033413+00	1046	f	120	76	6
7278	2017-02-27 01:13:19.047218+00	819	f	115	21	7
7279	2017-02-27 01:13:19.063565+00	522	f	123	23	8
7280	2017-02-27 01:13:19.07719+00	497	f	105	13	9
7281	2017-02-27 01:13:19.090265+00	242	f	128	1	10
7282	2017-02-27 01:13:19.103501+00	159	f	141	4	11
7283	2017-02-27 01:13:19.119551+00	378	f	104	8	13
7284	2017-02-27 01:13:19.133592+00	277	f	108	19	14
7285	2017-02-27 01:13:19.14733+00	142	f	127	19	15
7286	2017-02-27 01:13:19.160365+00	83	f	151	5	16
7287	2017-02-27 01:13:20.628601+00	88	f	139	4	18
7288	2017-02-27 01:13:20.698439+00	122	f	125	10	19
7289	2017-02-27 01:13:22.083614+00	142	f	107	5	21
7290	2017-02-27 01:13:22.132005+00	2484	f	4	66	22
7291	2017-02-27 01:13:22.14874+00	354	f	31	4	23
7292	2017-02-27 01:13:22.161973+00	24	f	156	5	24
7293	2017-02-27 01:13:22.175757+00	29616	t	2	874	25
7294	2017-02-27 01:13:22.192015+00	464	f	13	38	26
7295	2017-02-27 01:13:22.205678+00	581	f	10	41	27
7296	2017-02-27 01:13:22.218684+00	87	f	98	2	28
7297	2017-02-27 01:13:23.958301+00	180	f	20	13	30
7298	2017-02-27 01:13:24.064709+00	14328	f	5	835	31
7299	2017-02-27 01:13:24.08107+00	67	f	89	24	32
7300	2017-02-27 01:13:24.097222+00	2638	f	6	97	33
7301	2017-02-27 01:13:24.11101+00	2503	f	92	158	34
7302	2017-02-27 01:13:24.127178+00	657	f	8	28	35
7303	2017-02-27 01:13:25.562482+00	21	f	114	2	37
7304	2017-02-27 01:13:25.638949+00	6	f	158	4	38
7305	2017-02-27 01:13:25.655324+00	11	f	133	1	39
7306	2017-02-27 01:13:25.671375+00	3014	f	7	230	40
7307	2017-02-27 01:13:27.331579+00	1293	f	9	47	42
7308	2017-02-27 01:13:27.403273+00	202	f	11	7	43
7309	2017-02-27 01:13:28.878439+00	15	f	100	2	45
7310	2017-02-27 01:13:28.950282+00	11	f	99	1	46
7311	2017-02-27 01:13:30.598448+00	1	f	165	0	48
7312	2017-02-27 01:13:30.654559+00	11	f	101	0	49
7313	2017-02-27 01:13:30.671424+00	9	f	106	0	50
7314	2017-02-27 01:13:30.684529+00	9	f	102	1	51
7315	2017-02-27 01:13:30.698233+00	545	f	12	20	52
7316	2017-02-27 01:13:30.714304+00	74	f	26	5	53
7317	2017-02-27 01:13:30.728118+00	420	f	14	24	54
7318	2017-02-27 01:13:30.744257+00	289	f	16	13	55
7319	2017-02-27 01:13:35.282026+00	9592	f	15	1048	59
7320	2017-02-27 01:13:37.694651+00	1	f	166	0	60
7321	2017-02-27 01:13:37.710241+00	50	f	34	4	61
7322	2017-02-27 01:13:37.726953+00	0	f	148	1	62
7323	2017-02-27 01:13:37.742786+00	2	f	126	1	63
7324	2017-02-27 01:13:37.756838+00	0	f	164	1	64
7325	2017-02-27 01:13:37.772989+00	5131	f	18	95	65
7326	2017-02-27 01:13:37.786782+00	0	f	161	2	66
7327	2017-02-27 01:13:37.802787+00	1	f	134	2	67
7328	2017-02-27 01:13:37.817114+00	1349	f	21	12	68
7329	2017-02-27 01:13:39.268215+00	2788	f	22	150	70
7330	2017-02-27 01:13:39.341689+00	0	f	159	1	71
7331	2017-02-27 01:13:40.91313+00	159	f	24	7	73
7332	2017-02-27 01:13:40.99892+00	27	f	46	1	74
7333	2017-02-27 01:13:41.025766+00	55	f	35	3	75
7334	2017-02-27 01:13:41.190373+00	233	f	23	5	76
7335	2017-02-27 01:13:41.216357+00	4489	f	25	290	77
7336	2017-02-27 01:13:42.403328+00	47	f	30	7	79
7337	2017-02-27 01:13:42.475795+00	2	f	118	0	80
7338	2017-02-27 01:13:42.489752+00	95	f	33	11	81
7339	2017-02-27 01:13:42.505713+00	6835	f	27	717	82
7340	2017-02-27 01:13:42.519637+00	80	f	29	9	83
7341	2017-02-27 01:13:42.535599+00	21863	f	28	1793	84
7342	2017-02-27 01:13:42.549569+00	128	f	32	4	85
7343	2017-02-27 01:13:42.56534+00	12	f	57	4	86
7344	2017-02-27 01:13:42.579451+00	4	f	71	1	87
7345	2017-02-27 01:13:42.595367+00	14	f	91	1	88
7346	2017-02-27 01:13:42.609486+00	17	f	56	42	89
7347	2017-02-27 01:13:42.625538+00	0	f	131	1	90
7348	2017-02-27 01:13:42.683574+00	5213	f	36	192	91
7349	2017-02-27 01:13:42.700368+00	118	f	38	2	92
7350	2017-02-27 01:13:42.716007+00	52	f	43	9	93
7351	2017-02-27 01:13:42.730102+00	16	f	49	2	94
7352	2017-02-27 01:13:42.745977+00	658	f	37	28	95
7353	2017-02-27 01:13:42.760127+00	20	f	61	2	96
7354	2017-02-27 01:13:42.775986+00	1472	f	39	40	97
7355	2017-02-27 01:13:42.790188+00	51	f	44	3	98
7356	2017-02-27 01:13:42.805889+00	95	f	41	11	99
7357	2017-02-27 01:23:19.146519+00	8197	f	112	243	1
7358	2017-02-27 01:23:19.214032+00	878	f	152	47	2
7359	2017-02-27 01:23:19.227684+00	18807	f	88	830	3
7360	2017-02-27 01:23:19.243618+00	977	f	132	16	4
7361	2017-02-27 01:23:19.25768+00	1581	f	109	22	5
7362	2017-02-27 01:23:19.273609+00	1098	f	120	77	6
7363	2017-02-27 01:23:19.287618+00	867	f	115	21	7
7364	2017-02-27 01:23:19.303386+00	554	f	123	24	8
7365	2017-02-27 01:23:19.317369+00	522	f	105	13	9
7366	2017-02-27 01:23:19.33254+00	257	f	128	1	10
7367	2017-02-27 01:23:19.347428+00	176	f	141	5	11
7368	2017-02-27 01:23:19.364797+00	391	f	104	8	13
7369	2017-02-27 01:23:19.3775+00	295	f	108	20	14
7370	2017-02-27 01:23:19.392711+00	93	f	151	6	15
7371	2017-02-27 01:23:19.407609+00	152	f	127	19	16
7372	2017-02-27 01:23:19.422899+00	102	f	139	5	17
7373	2017-02-27 01:23:20.901046+00	126	f	125	10	19
7374	2017-02-27 01:23:22.408401+00	144	f	107	5	21
7375	2017-02-27 01:23:22.487289+00	2483	f	4	66	22
7376	2017-02-27 01:23:22.502938+00	27	f	156	5	23
7377	2017-02-27 01:23:22.516821+00	356	f	31	4	24
7378	2017-02-27 01:23:22.532819+00	29616	t	2	874	25
7379	2017-02-27 01:23:22.546605+00	87	f	98	2	26
7380	2017-02-27 01:23:22.563023+00	475	f	13	38	27
7381	2017-02-27 01:23:22.576873+00	585	f	10	41	28
7382	2017-02-27 01:23:24.302695+00	184	f	20	13	30
7383	2017-02-27 01:23:24.331377+00	14336	f	5	838	31
7384	2017-02-27 01:23:24.347594+00	73	f	89	24	32
7385	2017-02-27 01:23:24.361351+00	5	f	165	0	33
7386	2017-02-27 01:23:24.377343+00	15	f	133	1	34
7387	2017-02-27 01:23:24.391234+00	5	f	158	4	35
7388	2017-02-27 01:23:24.407292+00	2636	f	6	97	36
7389	2017-02-27 01:23:24.421355+00	24	f	114	2	37
7390	2017-02-27 01:23:24.437324+00	5	f	166	0	38
7391	2017-02-27 01:23:24.451353+00	2505	f	92	158	39
7392	2017-02-27 01:23:26.48225+00	664	f	8	28	41
7393	2017-02-27 01:23:27.996172+00	3014	f	7	230	43
7394	2017-02-27 01:23:28.021296+00	1290	f	9	47	44
7395	2017-02-27 01:23:28.037332+00	200	f	11	7	45
7396	2017-02-27 01:23:29.566739+00	4	f	148	1	47
7397	2017-02-27 01:23:29.826882+00	16	f	100	2	48
7398	2017-02-27 01:23:29.841914+00	15	f	99	1	49
7399	2017-02-27 01:23:31.516444+00	14	f	106	0	51
7400	2017-02-27 01:23:33.488314+00	2	f	167	0	52
7401	2017-02-27 01:23:33.51941+00	13	f	101	0	53
7402	2017-02-27 01:23:33.545524+00	13	f	102	1	54
7403	2017-02-27 01:23:33.561708+00	1	f	161	2	55
7404	2017-02-27 01:23:33.575629+00	72	f	26	5	56
7405	2017-02-27 01:23:33.591616+00	4	f	126	1	57
7406	2017-02-27 01:23:33.605514+00	543	f	12	20	58
7407	2017-02-27 01:23:35.290761+00	423	f	14	24	60
7408	2017-02-27 01:23:35.33054+00	288	f	16	13	61
7409	2017-02-27 01:23:38.160789+00	9591	f	15	1048	64
7410	2017-02-27 01:23:38.243162+00	52	f	34	4	65
7411	2017-02-27 01:23:38.258338+00	0	f	164	1	66
7412	2017-02-27 01:23:38.274042+00	5131	f	18	95	67
7413	2017-02-27 01:23:38.287994+00	2	f	134	2	68
7414	2017-02-27 01:23:38.304011+00	1345	f	21	12	69
7415	2017-02-27 01:23:39.894303+00	2791	f	22	150	71
7416	2017-02-27 01:23:40.003669+00	0	f	159	1	72
7417	2017-02-27 01:23:41.463018+00	156	f	24	7	74
7418	2017-02-27 01:23:41.491381+00	27	f	46	1	75
7419	2017-02-27 01:23:41.506578+00	55	f	35	3	76
7420	2017-02-27 01:23:41.522674+00	232	f	23	5	77
7421	2017-02-27 01:23:41.536458+00	4493	f	25	290	78
7422	2017-02-27 01:23:42.698396+00	50	f	30	7	80
7423	2017-02-27 01:23:42.752215+00	0	f	118	0	81
7424	2017-02-27 01:23:42.78639+00	93	f	33	11	82
7425	2017-02-27 01:23:42.826581+00	6838	f	27	717	83
7426	2017-02-27 01:23:42.840279+00	79	f	29	9	84
7427	2017-02-27 01:23:42.85629+00	21863	f	28	1794	85
7428	2017-02-27 01:23:42.870105+00	130	f	32	4	86
7429	2017-02-27 01:23:42.886188+00	14	f	57	4	87
7430	2017-02-27 01:23:42.900176+00	5	f	71	1	88
7431	2017-02-27 01:23:42.91684+00	14	f	91	1	89
7432	2017-02-27 01:23:42.930639+00	19	f	56	42	90
7433	2017-02-27 01:23:42.946825+00	0	f	131	1	91
7434	2017-02-27 01:23:42.960665+00	5214	f	36	192	92
7435	2017-02-27 01:23:42.976901+00	122	f	38	2	93
7436	2017-02-27 01:23:42.990831+00	47	f	43	9	94
7437	2017-02-27 01:23:43.007075+00	15	f	49	2	95
7438	2017-02-27 01:23:43.020966+00	656	f	37	28	96
7439	2017-02-27 01:23:43.037137+00	20	f	61	2	97
7440	2017-02-27 01:23:43.051181+00	1469	f	39	41	98
7441	2017-02-27 01:23:43.067312+00	49	f	44	3	99
7442	2017-02-27 01:33:19.190439+00	8673	f	112	258	1
7443	2017-02-27 01:33:19.261741+00	1024	f	152	50	2
7444	2017-02-27 01:33:19.32168+00	18864	f	88	832	3
7445	2017-02-27 01:33:19.337629+00	1057	f	132	17	4
7446	2017-02-27 01:33:19.352144+00	1633	f	109	22	5
7447	2017-02-27 01:33:19.36766+00	1153	f	120	85	6
7448	2017-02-27 01:33:19.382365+00	896	f	115	21	7
7449	2017-02-27 01:33:19.397691+00	588	f	123	25	8
7450	2017-02-27 01:33:19.412232+00	530	f	105	13	9
7451	2017-02-27 01:33:19.427965+00	273	f	128	2	10
7452	2017-02-27 01:33:19.442285+00	186	f	141	5	11
7453	2017-02-27 01:33:19.457761+00	405	f	104	9	12
7454	2017-02-27 01:33:19.474568+00	303	f	108	20	14
7455	2017-02-27 01:33:19.487815+00	99	f	151	8	15
7456	2017-02-27 01:33:19.50231+00	161	f	127	19	16
7457	2017-02-27 01:33:19.517802+00	121	f	139	5	17
7458	2017-02-27 01:33:20.966856+00	125	f	125	10	19
7459	2017-02-27 01:33:22.452909+00	146	f	107	5	21
7460	2017-02-27 01:33:22.540066+00	2491	f	4	66	22
7461	2017-02-27 01:33:22.55645+00	35	f	156	5	23
7462	2017-02-27 01:33:22.570861+00	362	f	31	4	24
7463	2017-02-27 01:33:22.586422+00	29616	t	2	875	25
7464	2017-02-27 01:33:22.600838+00	88	f	98	2	26
7465	2017-02-27 01:33:22.616309+00	482	f	13	38	27
7466	2017-02-27 01:33:22.630724+00	590	f	10	41	28
7467	2017-02-27 01:33:22.646349+00	11	f	166	2	29
7468	2017-02-27 01:33:24.309682+00	192	f	20	13	31
7469	2017-02-27 01:33:24.388411+00	6	f	165	0	32
7470	2017-02-27 01:33:24.4314+00	80	f	89	24	33
7471	2017-02-27 01:33:24.445853+00	14330	f	5	841	34
7472	2017-02-27 01:33:24.461324+00	7	f	158	4	35
7473	2017-02-27 01:33:24.475691+00	17	f	133	1	36
7474	2017-02-27 01:33:24.49115+00	27	f	114	2	37
7475	2017-02-27 01:33:24.505744+00	2635	f	6	97	38
7476	2017-02-27 01:33:26.256041+00	2502	f	92	160	40
7477	2017-02-27 01:33:26.326904+00	664	f	8	28	41
7478	2017-02-27 01:33:27.776572+00	3020	f	7	230	43
7479	2017-02-27 01:33:27.835154+00	1298	f	9	47	44
7480	2017-02-27 01:33:27.850465+00	204	f	11	7	45
7481	2017-02-27 01:33:27.864814+00	6	f	148	1	46
7482	2017-02-27 01:33:27.880366+00	3	f	164	1	47
7483	2017-02-27 01:33:29.33854+00	15	f	100	2	49
7484	2017-02-27 01:33:31.031798+00	12	f	106	0	51
7485	2017-02-27 01:33:31.103789+00	13	f	99	1	52
7486	2017-02-27 01:33:31.119426+00	11	f	101	0	53
7487	2017-02-27 01:33:31.1335+00	11	f	102	1	54
7488	2017-02-27 01:33:31.14898+00	5	f	134	3	55
7489	2017-02-27 01:33:31.163389+00	75	f	26	5	56
7490	2017-02-27 01:33:31.179089+00	546	f	12	20	57
7491	2017-02-27 01:33:32.810452+00	416	f	14	24	59
7492	2017-02-27 01:33:32.838053+00	292	f	16	13	60
7493	2017-02-27 01:33:35.787403+00	4	f	126	1	63
7494	2017-02-27 01:33:37.614299+00	1	f	168	0	64
7495	2017-02-27 01:33:39.228483+00	1	f	169	0	65
7496	2017-02-27 01:33:39.244999+00	9591	f	15	1048	66
7497	2017-02-27 01:33:39.260687+00	51	f	34	4	67
7498	2017-02-27 01:33:39.274837+00	1	f	167	0	68
7499	2017-02-27 01:33:39.290749+00	5132	f	18	95	69
7500	2017-02-27 01:33:39.304771+00	0	f	161	2	70
7501	2017-02-27 01:33:39.320573+00	1351	f	21	12	71
7502	2017-02-27 01:33:40.750637+00	2793	f	22	150	73
7503	2017-02-27 01:33:40.835619+00	0	f	159	1	74
7504	2017-02-27 01:33:42.501277+00	159	f	24	7	76
7505	2017-02-27 01:33:42.734727+00	27	f	46	1	77
7506	2017-02-27 01:33:42.749933+00	57	f	35	3	78
7507	2017-02-27 01:33:42.76414+00	230	f	23	5	79
7508	2017-02-27 01:33:42.780587+00	4488	f	25	290	80
7509	2017-02-27 01:33:43.957572+00	51	f	30	7	82
7510	2017-02-27 01:33:44.027675+00	3	f	118	0	83
7511	2017-02-27 01:33:44.044343+00	92	f	33	11	84
7512	2017-02-27 01:33:44.05744+00	6838	f	27	717	85
7513	2017-02-27 01:33:44.073831+00	81	f	29	9	86
7514	2017-02-27 01:33:44.087395+00	21871	f	28	1796	87
7515	2017-02-27 01:33:44.102978+00	16	f	57	4	88
7516	2017-02-27 01:33:44.117266+00	128	f	32	4	89
7517	2017-02-27 01:33:44.133335+00	17	f	56	42	90
7518	2017-02-27 01:33:44.147428+00	8	f	71	1	91
7519	2017-02-27 01:33:44.164051+00	13	f	91	1	92
7520	2017-02-27 01:33:44.177556+00	0	f	131	1	93
7521	2017-02-27 01:33:44.19329+00	5215	f	36	192	94
7522	2017-02-27 01:33:44.207657+00	120	f	38	2	95
7523	2017-02-27 01:33:44.223605+00	49	f	43	9	96
7524	2017-02-27 01:33:44.237805+00	17	f	49	2	97
7525	2017-02-27 01:33:44.253527+00	653	f	37	28	98
7526	2017-02-27 01:33:44.274403+00	26	f	61	2	99
7527	2017-02-27 01:43:19.526671+00	9100	f	112	281	1
7528	2017-02-27 01:43:19.607659+00	1188	f	152	56	2
7529	2017-02-27 01:43:19.631023+00	18897	f	88	832	3
7530	2017-02-27 01:43:19.641817+00	1134	f	132	17	4
7531	2017-02-27 01:43:19.651836+00	1671	f	109	23	5
7532	2017-02-27 01:43:19.66177+00	1177	f	120	89	6
7533	2017-02-27 01:43:19.671728+00	922	f	115	21	7
7534	2017-02-27 01:43:19.681817+00	621	f	123	26	8
7535	2017-02-27 01:43:19.691731+00	284	f	128	3	9
7536	2017-02-27 01:43:19.70173+00	542	f	105	14	10
7537	2017-02-27 01:43:19.711543+00	206	f	141	6	11
7538	2017-02-27 01:43:19.721576+00	425	f	104	9	12
7539	2017-02-27 01:43:19.734459+00	105	f	151	8	14
7540	2017-02-27 01:43:19.749156+00	303	f	108	20	15
7541	2017-02-27 01:43:19.883363+00	127	f	139	5	16
7542	2017-02-27 01:43:19.932985+00	165	f	127	19	17
7543	2017-02-27 01:43:21.418377+00	125	f	125	11	19
7544	2017-02-27 01:43:22.981115+00	149	f	107	6	21
7545	2017-02-27 01:43:23.083035+00	38	f	156	5	22
7546	2017-02-27 01:43:23.098109+00	2491	f	4	66	23
7547	2017-02-27 01:43:23.110744+00	370	f	31	4	24
7548	2017-02-27 01:43:23.120723+00	29623	t	2	875	25
7549	2017-02-27 01:43:23.130673+00	89	f	98	2	26
7550	2017-02-27 01:43:23.140642+00	601	f	10	41	27
7551	2017-02-27 01:43:23.150725+00	482	f	13	38	28
7552	2017-02-27 01:43:23.160864+00	14	f	166	5	29
7553	2017-02-27 01:43:23.170903+00	9	f	165	1	30
7554	2017-02-27 01:43:24.780492+00	190	f	20	13	32
7555	2017-02-27 01:43:24.88631+00	77	f	89	24	33
7556	2017-02-27 01:43:24.903282+00	14333	f	5	843	34
7557	2017-02-27 01:43:24.915806+00	15	f	133	1	35
7558	2017-02-27 01:43:24.925842+00	28	f	114	2	36
7559	2017-02-27 01:43:26.627808+00	5	f	169	0	38
7560	2017-02-27 01:43:26.698183+00	2636	f	6	97	39
7561	2017-02-27 01:43:26.710526+00	5	f	158	4	40
7562	2017-02-27 01:43:26.720481+00	2503	f	92	160	41
7563	2017-02-27 01:43:26.730408+00	658	f	8	28	42
7564	2017-02-27 01:43:28.054706+00	3013	f	7	230	44
7565	2017-02-27 01:43:28.074206+00	1295	f	9	47	45
7566	2017-02-27 01:43:28.08399+00	208	f	11	7	46
7567	2017-02-27 01:43:29.527757+00	16	f	100	2	48
7568	2017-02-27 01:43:29.658652+00	4	f	148	1	49
7569	2017-02-27 01:43:31.177202+00	15	f	106	0	51
7570	2017-02-27 01:43:31.242538+00	13	f	99	1	52
7571	2017-02-27 01:43:31.262339+00	13	f	101	0	53
7572	2017-02-27 01:43:31.272286+00	11	f	102	1	54
7573	2017-02-27 01:43:31.282213+00	2	f	134	3	55
7574	2017-02-27 01:43:31.292183+00	78	f	26	5	56
7575	2017-02-27 01:43:31.302268+00	540	f	12	20	57
7576	2017-02-27 01:43:32.734257+00	418	f	14	24	59
7577	2017-02-27 01:43:32.819918+00	289	f	16	13	60
7578	2017-02-27 01:43:36.184572+00	3	f	126	1	63
7579	2017-02-27 01:43:36.631283+00	0	f	168	0	64
7580	2017-02-27 01:43:36.695737+00	9593	f	15	1048	65
7581	2017-02-27 01:43:36.836898+00	54	f	34	4	66
7582	2017-02-27 01:43:36.950673+00	0	f	167	0	67
7583	2017-02-27 01:43:36.966594+00	1	f	164	1	68
7584	2017-02-27 01:43:36.976907+00	5134	f	18	95	69
7585	2017-02-27 01:43:36.987012+00	2	f	161	2	70
7586	2017-02-27 01:43:36.99705+00	1349	f	21	12	71
7587	2017-02-27 01:43:38.519882+00	2788	f	22	150	73
7588	2017-02-27 01:43:39.957645+00	163	f	24	7	75
7589	2017-02-27 01:43:40.199761+00	27	f	46	1	76
7590	2017-02-27 01:43:40.223813+00	60	f	35	3	77
7591	2017-02-27 01:43:40.288462+00	232	f	23	5	78
7592	2017-02-27 01:43:40.328101+00	4489	f	25	290	79
7593	2017-02-27 01:43:40.373469+00	51	f	30	7	80
7594	2017-02-27 01:43:41.668056+00	96	f	33	11	82
7595	2017-02-27 01:43:41.756093+00	6837	f	27	717	83
7596	2017-02-27 01:43:41.770545+00	82	f	29	9	84
7597	2017-02-27 01:43:41.78533+00	21865	f	28	1796	85
7598	2017-02-27 01:43:41.795673+00	14	f	57	4	86
7599	2017-02-27 01:43:41.805629+00	130	f	32	4	87
7600	2017-02-27 01:43:41.830775+00	23	f	56	42	88
7601	2017-02-27 01:43:41.845492+00	5	f	71	1	89
7602	2017-02-27 01:43:41.855828+00	12	f	91	1	90
7603	2017-02-27 01:43:41.865835+00	0	f	159	1	91
7604	2017-02-27 01:43:41.875846+00	0	f	131	1	92
7605	2017-02-27 01:43:41.885868+00	5215	f	36	192	93
7606	2017-02-27 01:43:41.906146+00	120	f	38	2	94
7607	2017-02-27 01:43:41.916043+00	49	f	43	9	95
7608	2017-02-27 01:43:41.926316+00	18	f	49	2	96
7609	2017-02-27 01:43:41.946257+00	656	f	37	28	97
7610	2017-02-27 01:43:41.956449+00	23	f	61	2	98
7611	2017-02-27 01:43:41.971245+00	48	f	44	3	99
7612	2017-02-27 01:53:20.011411+00	9544	f	112	288	1
7613	2017-02-27 01:53:20.16268+00	1360	f	152	58	2
7614	2017-02-27 01:53:20.179673+00	18937	f	88	833	3
7615	2017-02-27 01:53:20.192392+00	1199	f	132	19	4
7616	2017-02-27 01:53:20.209121+00	1705	f	109	23	5
7617	2017-02-27 01:53:20.222278+00	1224	f	120	92	6
7618	2017-02-27 01:53:20.232231+00	938	f	115	21	7
7619	2017-02-27 01:53:20.242375+00	651	f	123	26	8
7620	2017-02-27 01:53:20.252385+00	297	f	128	3	9
7621	2017-02-27 01:53:20.262344+00	232	f	141	6	10
7622	2017-02-27 01:53:20.272372+00	558	f	105	14	11
7623	2017-02-27 01:53:20.282543+00	430	f	104	9	12
7624	2017-02-27 01:53:20.294631+00	107	f	151	8	14
7625	2017-02-27 01:53:20.309516+00	141	f	139	5	15
7626	2017-02-27 01:53:20.322422+00	310	f	108	20	16
7627	2017-02-27 01:53:20.332451+00	172	f	127	19	17
7628	2017-02-27 01:53:21.797829+00	132	f	125	12	19
7629	2017-02-27 01:53:23.270571+00	158	f	107	7	21
7630	2017-02-27 01:53:23.381863+00	37	f	156	5	22
7631	2017-02-27 01:53:23.40133+00	2501	f	4	69	23
7632	2017-02-27 01:53:23.418012+00	367	f	31	4	24
7633	2017-02-27 01:53:23.431227+00	29621	t	2	875	25
7634	2017-02-27 01:53:23.447935+00	15	f	166	5	26
7635	2017-02-27 01:53:23.461182+00	89	f	98	2	27
7636	2017-02-27 01:53:23.478183+00	600	f	10	41	28
7637	2017-02-27 01:53:23.491173+00	477	f	13	38	29
7638	2017-02-27 01:53:23.501129+00	11	f	165	2	30
7639	2017-02-27 01:53:25.088405+00	187	f	20	13	32
7640	2017-02-27 01:53:25.313872+00	80	f	89	24	33
7641	2017-02-27 01:53:25.326558+00	14335	f	5	844	34
7642	2017-02-27 01:53:25.342873+00	18	f	133	1	35
7643	2017-02-27 01:53:25.35631+00	5	f	169	0	36
7644	2017-02-27 01:53:25.372693+00	30	f	114	2	37
7645	2017-02-27 01:53:27.104701+00	2640	f	6	97	39
7646	2017-02-27 01:53:27.161362+00	6	f	158	5	40
7647	2017-02-27 01:53:27.17767+00	2508	f	92	160	41
7648	2017-02-27 01:53:27.191154+00	661	f	8	28	42
7649	2017-02-27 01:53:28.824419+00	3018	f	7	230	44
7650	2017-02-27 01:53:28.896815+00	1298	f	9	47	45
7651	2017-02-27 01:53:28.912283+00	204	f	11	7	46
7652	2017-02-27 01:53:30.362348+00	4	f	148	1	48
7653	2017-02-27 01:53:30.385832+00	19	f	100	2	49
7654	2017-02-27 01:53:30.399472+00	18	f	99	1	50
7655	2017-02-27 01:53:32.004553+00	14	f	106	0	52
7656	2017-02-27 01:53:32.074286+00	12	f	101	0	53
7657	2017-02-27 01:53:32.090365+00	2	f	164	1	54
7658	2017-02-27 01:53:32.103824+00	11	f	102	1	55
7659	2017-02-27 01:53:32.119672+00	5	f	134	3	56
7660	2017-02-27 01:53:32.140148+00	77	f	26	5	57
7661	2017-02-27 01:53:32.180453+00	540	f	12	20	58
7662	2017-02-27 01:53:33.83579+00	426	f	14	24	60
7663	2017-02-27 01:53:33.909672+00	292	f	16	13	61
7664	2017-02-27 01:53:36.620247+00	3	f	126	1	64
7665	2017-02-27 01:53:36.681979+00	0	f	168	0	65
7666	2017-02-27 01:53:36.696247+00	9591	f	15	1048	66
7667	2017-02-27 01:53:36.712449+00	52	f	34	4	67
7668	2017-02-27 01:53:36.72624+00	1	f	167	0	68
7669	2017-02-27 01:53:36.742355+00	5126	f	18	95	69
7670	2017-02-27 01:53:36.756095+00	0	f	161	2	70
7671	2017-02-27 01:53:36.772191+00	1349	f	21	12	71
7672	2017-02-27 01:53:38.397775+00	2788	f	22	150	73
7673	2017-02-27 01:53:38.456682+00	161	f	24	7	74
7674	2017-02-27 01:53:40.023836+00	25	f	46	1	76
7675	2017-02-27 01:53:40.096275+00	61	f	35	3	77
7676	2017-02-27 01:53:40.11439+00	231	f	23	5	78
7677	2017-02-27 01:53:40.130516+00	4497	f	25	290	79
7678	2017-02-27 01:53:41.425468+00	51	f	30	7	81
7679	2017-02-27 01:53:41.505542+00	98	f	33	11	82
7680	2017-02-27 01:53:41.525405+00	6840	f	27	717	83
7681	2017-02-27 01:53:41.538956+00	81	f	29	9	84
7682	2017-02-27 01:53:41.555094+00	7	f	71	1	85
7683	2017-02-27 01:53:41.568972+00	21867	f	28	1796	86
7684	2017-02-27 01:53:41.585211+00	15	f	57	4	87
7685	2017-02-27 01:53:41.599135+00	132	f	32	4	88
7686	2017-02-27 01:53:41.616017+00	19	f	56	42	89
7687	2017-02-27 01:53:41.664862+00	14	f	91	1	90
7688	2017-02-27 01:53:41.679627+00	0	f	159	1	91
7689	2017-02-27 01:53:41.695677+00	2	f	131	1	92
7690	2017-02-27 01:53:41.709492+00	5205	f	36	192	93
7691	2017-02-27 01:53:41.725844+00	124	f	38	2	94
7692	2017-02-27 01:53:41.739759+00	50	f	43	9	95
7693	2017-02-27 01:53:41.755835+00	16	f	49	2	96
7694	2017-02-27 01:53:41.76958+00	654	f	37	28	97
7695	2017-02-27 01:53:41.785696+00	23	f	61	2	98
7696	2017-02-27 01:53:41.800314+00	52	f	44	3	99
7697	2017-02-27 02:03:19.933715+00	10044	f	112	301	1
7698	2017-02-27 02:03:20.004922+00	1559	f	152	63	2
7699	2017-02-27 02:03:20.021942+00	18977	f	88	837	3
7700	2017-02-27 02:03:20.037042+00	1294	f	132	19	4
7701	2017-02-27 02:03:20.051716+00	1269	f	120	98	5
7702	2017-02-27 02:03:20.067048+00	1753	f	109	23	6
7703	2017-02-27 02:03:20.081902+00	969	f	115	22	7
7704	2017-02-27 02:03:20.096994+00	677	f	123	27	8
7705	2017-02-27 02:03:20.114017+00	312	f	128	3	9
7706	2017-02-27 02:03:20.127085+00	240	f	141	6	10
7707	2017-02-27 02:03:20.141864+00	566	f	105	14	11
7708	2017-02-27 02:03:20.157111+00	448	f	104	9	12
7709	2017-02-27 02:03:20.174379+00	116	f	151	7	14
7710	2017-02-27 02:03:20.187159+00	152	f	139	5	15
7711	2017-02-27 02:03:20.20191+00	312	f	108	20	16
7712	2017-02-27 02:03:20.217243+00	177	f	127	19	17
7713	2017-02-27 02:03:21.89394+00	131	f	125	12	19
7714	2017-02-27 02:03:23.411609+00	40	f	156	6	21
7715	2017-02-27 02:03:23.484101+00	158	f	107	7	22
7716	2017-02-27 02:03:23.501038+00	2504	f	4	69	23
7717	2017-02-27 02:03:23.516432+00	374	f	31	4	24
7718	2017-02-27 02:03:23.530906+00	18	f	166	8	25
7719	2017-02-27 02:03:23.546347+00	29632	t	2	875	26
7720	2017-02-27 02:03:23.560788+00	91	f	98	2	27
7721	2017-02-27 02:03:23.576273+00	483	f	13	38	28
7722	2017-02-27 02:03:23.590976+00	600	f	10	41	29
7723	2017-02-27 02:03:23.652943+00	11	f	165	2	30
7724	2017-02-27 02:03:23.717244+00	10	f	169	0	31
7725	2017-02-27 02:03:25.620168+00	192	f	20	13	33
7726	2017-02-27 02:03:25.840776+00	73	f	89	24	34
7727	2017-02-27 02:03:25.856925+00	14333	f	5	845	35
7728	2017-02-27 02:03:25.872493+00	17	f	133	1	36
7729	2017-02-27 02:03:27.544325+00	27	f	114	2	38
7730	2017-02-27 02:03:27.617813+00	6	f	158	5	39
7731	2017-02-27 02:03:27.64159+00	2640	f	6	97	40
7732	2017-02-27 02:03:27.665046+00	2503	f	92	160	41
7733	2017-02-27 02:03:30.482673+00	4	f	170	0	42
7734	2017-02-27 02:03:30.499242+00	659	f	8	28	43
7735	2017-02-27 02:03:31.88855+00	10	f	148	1	45
7736	2017-02-27 02:03:32.11364+00	3017	f	7	230	46
7737	2017-02-27 02:03:32.129117+00	1298	f	9	47	47
7738	2017-02-27 02:03:33.633862+00	206	f	11	7	49
7739	2017-02-27 02:03:33.80406+00	19	f	100	2	50
7740	2017-02-27 02:03:33.817465+00	15	f	106	0	51
7741	2017-02-27 02:03:33.833535+00	15	f	99	1	52
7742	2017-02-27 02:03:35.241547+00	11	f	101	0	54
7743	2017-02-27 02:03:35.311394+00	3	f	134	3	55
7744	2017-02-27 02:03:35.327391+00	9	f	102	1	56
7745	2017-02-27 02:03:35.341071+00	76	f	26	5	57
7746	2017-02-27 02:03:35.357283+00	545	f	12	20	58
7747	2017-02-27 02:03:36.991226+00	420	f	14	24	60
7748	2017-02-27 02:03:37.076033+00	293	f	16	13	61
7749	2017-02-27 02:03:40.075436+00	4	f	126	1	64
7750	2017-02-27 02:03:40.128034+00	0	f	168	0	65
7751	2017-02-27 02:03:40.143226+00	9591	f	15	1048	66
7752	2017-02-27 02:03:40.157739+00	53	f	34	4	67
7753	2017-02-27 02:03:40.173081+00	1	f	167	0	68
7754	2017-02-27 02:03:40.187721+00	1	f	164	1	69
7755	2017-02-27 02:03:40.203027+00	5128	f	18	95	70
7756	2017-02-27 02:03:40.217677+00	0	f	161	2	71
7757	2017-02-27 02:03:40.232979+00	1348	f	21	12	72
7758	2017-02-27 02:03:41.83736+00	2792	f	22	150	74
7759	2017-02-27 02:03:41.918827+00	164	f	24	7	75
7760	2017-02-27 02:03:43.528319+00	26	f	46	1	77
7761	2017-02-27 02:03:43.676393+00	60	f	35	3	78
7762	2017-02-27 02:03:43.688385+00	235	f	23	5	79
7763	2017-02-27 02:03:43.704071+00	4497	f	25	290	80
7764	2017-02-27 02:03:45.02939+00	53	f	30	7	82
7765	2017-02-27 02:03:45.102204+00	94	f	33	11	83
7766	2017-02-27 02:03:45.1302+00	6843	f	27	717	84
7767	2017-02-27 02:03:45.162997+00	80	f	29	9	85
7768	2017-02-27 02:03:45.182052+00	5	f	71	1	86
7769	2017-02-27 02:03:45.202317+00	21867	f	28	1796	87
7770	2017-02-27 02:03:45.217902+00	22	f	56	42	88
7771	2017-02-27 02:03:45.242239+00	13	f	57	4	89
7772	2017-02-27 02:03:45.258144+00	128	f	32	4	90
7773	2017-02-27 02:03:45.272211+00	12	f	91	1	91
7774	2017-02-27 02:03:45.288096+00	0	f	159	1	92
7775	2017-02-27 02:03:45.30243+00	0	f	131	1	93
7776	2017-02-27 02:03:45.318244+00	5213	f	36	192	94
7777	2017-02-27 02:03:45.332421+00	123	f	38	2	95
7778	2017-02-27 02:03:45.348328+00	52	f	43	9	96
7779	2017-02-27 02:03:45.380455+00	15	f	49	2	97
7780	2017-02-27 02:03:45.392602+00	657	f	37	28	98
7781	2017-02-27 02:03:45.408716+00	27	f	61	2	99
7782	2017-02-27 02:13:19.876829+00	10548	f	112	311	1
7783	2017-02-27 02:13:19.924578+00	1757	f	152	67	2
7784	2017-02-27 02:13:19.93428+00	19027	f	88	839	3
7785	2017-02-27 02:13:19.944283+00	1393	f	132	20	4
7786	2017-02-27 02:13:19.954247+00	1341	f	120	100	5
7787	2017-02-27 02:13:19.964145+00	1808	f	109	23	6
7788	2017-02-27 02:13:19.974178+00	991	f	115	22	7
7789	2017-02-27 02:13:19.98409+00	716	f	123	27	8
7790	2017-02-27 02:13:19.994055+00	263	f	141	6	9
7791	2017-02-27 02:13:20.004136+00	334	f	128	3	10
7792	2017-02-27 02:13:20.014153+00	576	f	105	14	11
7793	2017-02-27 02:13:20.024376+00	458	f	104	9	12
7794	2017-02-27 02:13:20.034236+00	124	f	151	7	13
7795	2017-02-27 02:13:20.04639+00	157	f	139	5	15
7796	2017-02-27 02:13:20.05417+00	191	f	127	19	16
7797	2017-02-27 02:13:20.064309+00	321	f	108	21	17
7798	2017-02-27 02:13:21.546977+00	139	f	125	14	19
7799	2017-02-27 02:13:23.001971+00	45	f	156	6	21
7800	2017-02-27 02:13:23.083233+00	157	f	107	7	22
7801	2017-02-27 02:13:23.092666+00	2504	f	4	69	23
7802	2017-02-27 02:13:23.103112+00	381	f	31	4	24
7803	2017-02-27 02:13:23.112732+00	23	f	166	9	25
7804	2017-02-27 02:13:23.122661+00	16	f	169	0	26
7805	2017-02-27 02:13:23.132665+00	29624	t	2	875	27
7806	2017-02-27 02:13:23.142688+00	92	f	98	2	28
7807	2017-02-27 02:13:23.152866+00	493	f	13	38	29
7808	2017-02-27 02:13:23.162709+00	604	f	10	41	30
7809	2017-02-27 02:13:23.172764+00	11	f	165	2	31
7810	2017-02-27 02:13:25.068437+00	195	f	20	13	33
7811	2017-02-27 02:13:25.189231+00	79	f	89	24	34
7812	2017-02-27 02:13:25.208721+00	14337	f	5	849	35
7813	2017-02-27 02:13:28.414617+00	5	f	170	0	37
7814	2017-02-27 02:13:28.49551+00	18	f	133	1	38
7815	2017-02-27 02:13:28.507125+00	8	f	158	5	39
7816	2017-02-27 02:13:28.516968+00	24	f	114	2	40
7817	2017-02-27 02:13:28.526927+00	12	f	148	1	41
7818	2017-02-27 02:13:28.536877+00	2643	f	6	97	42
7819	2017-02-27 02:13:28.546964+00	2512	f	92	162	43
7820	2017-02-27 02:13:28.55698+00	666	f	8	28	44
7821	2017-02-27 02:13:31.357349+00	3016	f	7	230	47
7822	2017-02-27 02:13:31.425094+00	20	f	100	2	48
7823	2017-02-27 02:13:31.434976+00	1293	f	9	47	49
7824	2017-02-27 02:13:31.444816+00	209	f	11	7	50
7825	2017-02-27 02:13:31.454764+00	18	f	106	0	51
7826	2017-02-27 02:13:31.464758+00	17	f	99	1	52
7827	2017-02-27 02:13:34.992196+00	2	f	171	1	54
7828	2017-02-27 02:13:35.005222+00	13	f	101	0	55
7829	2017-02-27 02:13:35.014368+00	13	f	102	1	56
7830	2017-02-27 02:13:35.02426+00	4	f	134	4	57
7831	2017-02-27 02:13:35.03426+00	77	f	26	5	58
7832	2017-02-27 02:13:36.632063+00	541	f	12	20	60
7833	2017-02-27 02:13:36.727689+00	422	f	14	24	61
7834	2017-02-27 02:13:36.738899+00	292	f	16	13	62
7835	2017-02-27 02:13:39.573051+00	5	f	126	1	65
7836	2017-02-27 02:13:39.748406+00	0	f	168	0	66
7837	2017-02-27 02:13:39.777295+00	9596	f	15	1048	67
7838	2017-02-27 02:13:39.787282+00	54	f	34	4	68
7839	2017-02-27 02:13:39.79725+00	1	f	167	0	69
7840	2017-02-27 02:13:39.807101+00	5125	f	18	95	70
7841	2017-02-27 02:13:39.816992+00	0	f	161	2	71
7842	2017-02-27 02:13:39.826938+00	1349	f	21	12	72
7843	2017-02-27 02:13:41.281788+00	2792	f	22	150	74
7844	2017-02-27 02:13:41.351497+00	161	f	24	7	75
7845	2017-02-27 02:13:43.223089+00	26	f	46	1	77
7846	2017-02-27 02:13:43.294617+00	61	f	35	3	78
7847	2017-02-27 02:13:43.306492+00	234	f	23	5	79
7848	2017-02-27 02:13:43.316369+00	4485	f	25	290	80
7849	2017-02-27 02:13:44.528683+00	54	f	30	7	82
7850	2017-02-27 02:13:44.600218+00	94	f	33	11	83
7851	2017-02-27 02:13:44.609884+00	6839	f	27	717	84
7852	2017-02-27 02:13:44.61983+00	17	f	57	4	85
7853	2017-02-27 02:13:44.629791+00	81	f	29	9	86
7854	2017-02-27 02:13:44.639761+00	5	f	71	1	87
7855	2017-02-27 02:13:44.649773+00	0	f	164	1	88
7856	2017-02-27 02:13:44.659677+00	21870	f	28	1796	89
7857	2017-02-27 02:13:44.669695+00	23	f	56	42	90
7858	2017-02-27 02:13:44.679693+00	134	f	32	4	91
7859	2017-02-27 02:13:44.689617+00	11	f	91	1	92
7860	2017-02-27 02:13:44.699835+00	0	f	159	1	93
7861	2017-02-27 02:13:44.709656+00	0	f	131	1	94
7862	2017-02-27 02:13:44.719697+00	5214	f	36	192	95
7863	2017-02-27 02:13:44.729633+00	117	f	38	2	96
7864	2017-02-27 02:13:44.740132+00	47	f	43	9	97
7865	2017-02-27 02:13:44.749836+00	17	f	49	2	98
7866	2017-02-27 02:13:44.759887+00	651	f	37	28	99
7867	2017-02-27 02:23:20.464778+00	11031	f	112	323	1
7868	2017-02-27 02:23:20.53311+00	1984	f	152	72	2
7869	2017-02-27 02:23:20.548324+00	1499	f	132	24	3
7870	2017-02-27 02:23:20.56269+00	19063	f	88	841	4
7871	2017-02-27 02:23:20.578776+00	1401	f	120	106	5
7872	2017-02-27 02:23:20.592683+00	1848	f	109	24	6
7873	2017-02-27 02:23:20.608447+00	1026	f	115	24	7
7874	2017-02-27 02:23:20.622683+00	745	f	123	29	8
7875	2017-02-27 02:23:20.657172+00	286	f	141	7	9
7876	2017-02-27 02:23:20.679217+00	342	f	128	3	10
7877	2017-02-27 02:23:20.693346+00	589	f	105	14	11
7878	2017-02-27 02:23:20.709017+00	474	f	104	9	12
7879	2017-02-27 02:23:20.723253+00	134	f	151	7	13
7880	2017-02-27 02:23:20.738902+00	175	f	139	5	14
7881	2017-02-27 02:23:20.755619+00	198	f	127	22	16
7882	2017-02-27 02:23:20.768722+00	317	f	108	21	17
7883	2017-02-27 02:23:22.238554+00	143	f	125	15	19
7884	2017-02-27 02:23:23.72244+00	51	f	156	6	21
7885	2017-02-27 02:23:23.791685+00	162	f	107	7	22
7886	2017-02-27 02:23:23.80741+00	29	f	166	9	23
7887	2017-02-27 02:23:23.821452+00	2506	f	4	69	24
7888	2017-02-27 02:23:23.83719+00	384	f	31	4	25
7889	2017-02-27 02:23:23.851428+00	17	f	169	0	26
7890	2017-02-27 02:23:23.867169+00	29625	t	2	875	27
7891	2017-02-27 02:23:23.881305+00	95	f	98	2	28
7892	2017-02-27 02:23:23.903662+00	492	f	13	38	29
7893	2017-02-27 02:23:23.917363+00	12	f	165	2	30
7894	2017-02-27 02:23:23.931409+00	605	f	10	41	31
7895	2017-02-27 02:23:25.575042+00	191	f	20	13	33
7896	2017-02-27 02:23:27.402046+00	79	f	89	25	35
7897	2017-02-27 02:23:27.471547+00	19	f	133	1	36
7898	2017-02-27 02:23:27.487278+00	14338	f	5	849	37
7899	2017-02-27 02:23:27.501215+00	9	f	158	5	38
7900	2017-02-27 02:23:27.517063+00	32	f	114	2	39
7901	2017-02-27 02:23:27.531129+00	4	f	170	1	40
7902	2017-02-27 02:23:27.547033+00	13	f	148	1	41
7903	2017-02-27 02:23:27.561176+00	2638	f	6	97	42
7904	2017-02-27 02:23:27.577005+00	2511	f	92	162	43
7905	2017-02-27 02:23:27.592948+00	3	f	171	3	44
7906	2017-02-27 02:23:27.60699+00	666	f	8	28	45
7907	2017-02-27 02:23:30.458924+00	3017	f	7	230	48
7908	2017-02-27 02:23:30.531506+00	18	f	100	2	49
7909	2017-02-27 02:23:30.550653+00	1301	f	9	47	50
7910	2017-02-27 02:23:30.565251+00	209	f	11	7	51
7911	2017-02-27 02:23:30.621281+00	17	f	106	0	52
7912	2017-02-27 02:23:30.640962+00	18	f	99	1	53
7913	2017-02-27 02:23:32.215678+00	4	f	161	2	55
7914	2017-02-27 02:23:32.285588+00	15	f	101	0	56
7915	2017-02-27 02:23:32.305141+00	11	f	102	1	57
7916	2017-02-27 02:23:32.319545+00	81	f	26	5	58
7917	2017-02-27 02:23:32.334892+00	5	f	134	4	59
7918	2017-02-27 02:23:33.945215+00	545	f	12	20	61
7919	2017-02-27 02:23:33.969701+00	421	f	14	24	62
7920	2017-02-27 02:23:33.984128+00	290	f	16	13	63
7921	2017-02-27 02:23:36.825284+00	6	f	126	1	66
7922	2017-02-27 02:23:36.886223+00	1	f	168	0	67
7923	2017-02-27 02:23:36.902154+00	54	f	34	4	68
7924	2017-02-27 02:23:36.917039+00	9591	f	15	1048	69
7925	2017-02-27 02:23:36.932102+00	1	f	167	0	70
7926	2017-02-27 02:23:36.946975+00	5135	f	18	95	71
7927	2017-02-27 02:23:38.507669+00	1358	f	21	12	73
7928	2017-02-27 02:23:38.580469+00	2790	f	22	150	74
7929	2017-02-27 02:23:38.596019+00	166	f	24	7	75
7930	2017-02-27 02:23:40.18985+00	26	f	46	1	77
7931	2017-02-27 02:23:40.280333+00	60	f	35	3	78
7932	2017-02-27 02:23:42.018558+00	0	f	172	1	79
7933	2017-02-27 02:23:42.032835+00	230	f	23	5	80
7934	2017-02-27 02:23:42.046454+00	4497	f	25	290	81
7935	2017-02-27 02:23:43.541022+00	50	f	30	7	83
7936	2017-02-27 02:23:43.610735+00	98	f	33	11	84
7937	2017-02-27 02:23:43.626692+00	6846	f	27	717	85
7938	2017-02-27 02:23:43.640308+00	16	f	57	4	86
7939	2017-02-27 02:23:43.656381+00	82	f	29	9	87
7940	2017-02-27 02:23:43.67033+00	8	f	71	1	88
7941	2017-02-27 02:23:43.696599+00	0	f	164	1	89
7942	2017-02-27 02:23:43.710369+00	21863	f	28	1798	90
7943	2017-02-27 02:23:43.726648+00	22	f	56	42	91
7944	2017-02-27 02:23:43.740378+00	132	f	32	4	92
7945	2017-02-27 02:23:43.754743+00	13	f	91	1	93
7946	2017-02-27 02:23:43.770362+00	0	f	159	1	94
7947	2017-02-27 02:23:43.784639+00	0	f	131	1	95
7948	2017-02-27 02:23:43.800217+00	5218	f	36	192	96
7949	2017-02-27 02:23:43.814595+00	121	f	38	2	97
7950	2017-02-27 02:23:43.826526+00	53	f	43	9	98
7951	2017-02-27 02:23:43.840418+00	17	f	49	2	99
7952	2017-02-27 02:33:20.803708+00	2484	f	152	82	1
7953	2017-02-27 02:33:20.880284+00	11314	f	112	332	2
7954	2017-02-27 02:33:20.889993+00	1608	f	132	25	3
7955	2017-02-27 02:33:20.899965+00	19107	f	88	841	4
7956	2017-02-27 02:33:20.909953+00	1452	f	120	111	5
7957	2017-02-27 02:33:20.919891+00	1888	f	109	24	6
7958	2017-02-27 02:33:20.92995+00	1054	f	115	25	7
7959	2017-02-27 02:33:20.93996+00	778	f	123	30	8
7960	2017-02-27 02:33:20.949855+00	303	f	141	7	9
7961	2017-02-27 02:33:20.959867+00	357	f	128	3	10
7962	2017-02-27 02:33:20.969856+00	592	f	105	14	11
7963	2017-02-27 02:33:20.979896+00	146	f	151	7	12
7964	2017-02-27 02:33:20.98989+00	196	f	139	5	13
7965	2017-02-27 02:33:20.999806+00	483	f	104	9	14
7966	2017-02-27 02:33:21.012191+00	205	f	127	23	16
7967	2017-02-27 02:33:21.01985+00	328	f	108	22	17
7968	2017-02-27 02:33:22.532198+00	142	f	125	15	19
7969	2017-02-27 02:33:24.204088+00	51	f	156	6	21
7970	2017-02-27 02:33:24.269116+00	162	f	107	7	22
7971	2017-02-27 02:33:24.278873+00	28	f	166	9	23
7972	2017-02-27 02:33:24.288848+00	2513	f	4	69	24
7973	2017-02-27 02:33:24.298855+00	383	f	31	4	25
7974	2017-02-27 02:33:24.308598+00	18	f	169	0	26
7975	2017-02-27 02:33:24.318654+00	14	f	165	2	27
7976	2017-02-27 02:33:24.328596+00	29625	t	2	875	28
7977	2017-02-27 02:33:24.338617+00	95	f	98	2	29
7978	2017-02-27 02:33:24.348499+00	490	f	13	38	30
7979	2017-02-27 02:33:24.358536+00	604	f	10	41	31
7980	2017-02-27 02:33:26.078453+00	191	f	20	13	33
7981	2017-02-27 02:33:27.794411+00	79	f	89	25	35
7982	2017-02-27 02:33:27.858545+00	19	f	133	1	36
7983	2017-02-27 02:33:27.868305+00	14336	f	5	849	37
7984	2017-02-27 02:33:27.878268+00	9	f	158	5	38
7985	2017-02-27 02:33:27.888145+00	6	f	170	2	39
7986	2017-02-27 02:33:27.898199+00	28	f	114	2	40
7987	2017-02-27 02:33:27.914405+00	12	f	148	1	41
7988	2017-02-27 02:33:27.92812+00	2638	f	6	97	42
7989	2017-02-27 02:33:27.937902+00	2510	f	92	162	43
7990	2017-02-27 02:33:27.94793+00	669	f	8	28	44
7991	2017-02-27 02:33:30.701448+00	2	f	171	3	47
7992	2017-02-27 02:33:30.936701+00	3023	f	7	230	48
7993	2017-02-27 02:33:30.946303+00	20	f	100	2	49
7994	2017-02-27 02:33:30.956226+00	1294	f	9	47	50
7995	2017-02-27 02:33:30.966184+00	212	f	11	7	51
7996	2017-02-27 02:33:30.976051+00	16	f	106	0	52
7997	2017-02-27 02:33:30.986146+00	22	f	99	1	53
7998	2017-02-27 02:33:32.776402+00	2	f	161	2	55
7999	2017-02-27 02:33:32.84145+00	16	f	101	0	56
8000	2017-02-27 02:33:32.851302+00	13	f	102	1	57
8001	2017-02-27 02:33:32.86115+00	4	f	126	1	58
8002	2017-02-27 02:33:32.871083+00	78	f	26	5	59
8003	2017-02-27 02:33:34.559215+00	545	f	12	20	61
8004	2017-02-27 02:33:34.626106+00	430	f	14	24	62
8005	2017-02-27 02:33:34.645038+00	292	f	16	13	63
8006	2017-02-27 02:33:37.722059+00	1	f	173	0	65
8007	2017-02-27 02:33:40.797569+00	0	f	172	2	68
8008	2017-02-27 02:33:40.852676+00	2	f	134	4	69
8009	2017-02-27 02:33:40.862509+00	1	f	168	0	70
8010	2017-02-27 02:33:40.87239+00	54	f	34	4	71
8011	2017-02-27 02:33:40.882254+00	9602	f	15	1048	72
8012	2017-02-27 02:33:40.8923+00	2	f	167	0	73
8013	2017-02-27 02:33:40.902315+00	5131	f	18	96	74
8014	2017-02-27 02:33:42.562607+00	1352	f	21	12	76
8015	2017-02-27 02:33:42.647871+00	2789	f	22	150	77
8016	2017-02-27 02:33:42.670345+00	166	f	24	7	78
8017	2017-02-27 02:33:44.427469+00	28	f	46	1	80
8018	2017-02-27 02:33:44.452215+00	61	f	35	3	81
8019	2017-02-27 02:33:44.462185+00	233	f	23	5	82
8020	2017-02-27 02:33:44.472485+00	4492	f	25	290	83
8021	2017-02-27 02:33:46.035965+00	51	f	30	7	85
8022	2017-02-27 02:33:46.086563+00	16	f	57	4	86
8023	2017-02-27 02:33:46.096424+00	2	f	118	0	87
8024	2017-02-27 02:33:46.106318+00	96	f	33	11	88
8025	2017-02-27 02:33:46.116211+00	6835	f	27	717	89
8026	2017-02-27 02:33:46.126155+00	79	f	29	9	90
8027	2017-02-27 02:33:46.136246+00	6	f	71	1	91
8028	2017-02-27 02:33:46.14631+00	0	f	164	2	92
8029	2017-02-27 02:33:46.15636+00	21866	f	28	1798	93
8030	2017-02-27 02:33:46.166255+00	18	f	56	42	94
8031	2017-02-27 02:33:46.176146+00	126	f	32	4	95
8032	2017-02-27 02:33:46.186203+00	12	f	91	1	96
8033	2017-02-27 02:33:46.196152+00	0	f	131	1	97
8034	2017-02-27 02:33:46.206203+00	5212	f	36	192	98
8035	2017-02-27 02:33:46.216257+00	121	f	38	2	99
8036	2017-02-27 02:43:20.734046+00	3070	f	152	109	1
8037	2017-02-27 02:43:20.803412+00	11477	f	112	338	2
8038	2017-02-27 02:43:20.817965+00	1696	f	132	28	3
8039	2017-02-27 02:43:20.833+00	19137	f	88	841	4
8040	2017-02-27 02:43:20.847846+00	1488	f	120	124	5
8041	2017-02-27 02:43:20.863051+00	1919	f	109	24	6
8042	2017-02-27 02:43:20.877904+00	1098	f	115	25	7
8043	2017-02-27 02:43:20.892909+00	802	f	123	33	8
8044	2017-02-27 02:43:20.907997+00	319	f	141	7	9
8045	2017-02-27 02:43:20.923047+00	372	f	128	3	10
8046	2017-02-27 02:43:20.937948+00	613	f	105	14	11
8047	2017-02-27 02:43:20.953087+00	156	f	151	7	12
8048	2017-02-27 02:43:20.968021+00	209	f	139	5	13
8049	2017-02-27 02:43:20.983193+00	496	f	104	9	14
8050	2017-02-27 02:43:20.998168+00	211	f	127	23	15
8051	2017-02-27 02:43:21.015563+00	332	f	108	22	17
8052	2017-02-27 02:43:24.18504+00	150	f	125	15	19
8053	2017-02-27 02:43:25.725656+00	50	f	156	6	21
8054	2017-02-27 02:43:25.745471+00	34	f	166	10	22
8055	2017-02-27 02:43:25.760722+00	169	f	107	7	23
8056	2017-02-27 02:43:25.775414+00	22	f	169	0	24
8057	2017-02-27 02:43:25.790697+00	2505	f	4	69	25
8058	2017-02-27 02:43:25.805515+00	386	f	31	4	26
8059	2017-02-27 02:43:25.820659+00	101	f	98	2	27
8060	2017-02-27 02:43:25.835837+00	15	f	165	2	28
8061	2017-02-27 02:43:25.850638+00	29621	t	2	875	29
8062	2017-02-27 02:43:25.866008+00	484	f	13	38	30
8063	2017-02-27 02:43:25.880756+00	605	f	10	41	31
8064	2017-02-27 02:43:27.609607+00	21	f	133	1	33
8065	2017-02-27 02:43:27.721708+00	194	f	20	13	34
8066	2017-02-27 02:43:27.73647+00	14345	f	5	849	35
8067	2017-02-27 02:43:27.751468+00	71	f	89	25	36
8068	2017-02-27 02:43:29.736189+00	7	f	170	2	38
8069	2017-02-27 02:43:29.845578+00	29	f	114	2	39
8070	2017-02-27 02:43:29.892151+00	2644	f	6	97	40
8071	2017-02-27 02:43:29.926933+00	5	f	158	5	41
8072	2017-02-27 02:43:29.941948+00	10	f	148	1	42
8073	2017-02-27 02:43:29.956801+00	2512	f	92	162	43
8074	2017-02-27 02:43:29.971969+00	665	f	8	28	44
8075	2017-02-27 02:43:34.265903+00	3	f	171	3	48
8076	2017-02-27 02:43:34.338465+00	3016	f	7	230	49
8077	2017-02-27 02:43:34.353361+00	21	f	100	2	50
8078	2017-02-27 02:43:34.368075+00	1303	f	9	47	51
8079	2017-02-27 02:43:34.383912+00	211	f	11	7	52
8080	2017-02-27 02:43:34.39838+00	18	f	106	0	53
8081	2017-02-27 02:43:34.413482+00	22	f	99	1	54
8082	2017-02-27 02:43:36.036753+00	3	f	173	1	56
8083	2017-02-27 02:43:36.113206+00	3	f	161	2	57
8084	2017-02-27 02:43:36.128425+00	14	f	101	0	58
8085	2017-02-27 02:43:36.142721+00	12	f	102	1	59
8086	2017-02-27 02:43:36.158137+00	6	f	126	1	60
8087	2017-02-27 02:43:36.172621+00	82	f	26	5	61
8088	2017-02-27 02:43:37.812581+00	550	f	12	20	63
8089	2017-02-27 02:43:37.86751+00	425	f	14	24	64
8090	2017-02-27 02:43:37.882954+00	292	f	16	13	65
8091	2017-02-27 02:43:40.744809+00	3	f	134	4	68
8092	2017-02-27 02:43:40.825181+00	0	f	168	0	69
8093	2017-02-27 02:43:40.840586+00	50	f	34	4	70
8094	2017-02-27 02:43:40.854957+00	9597	f	15	1048	71
8095	2017-02-27 02:43:40.87067+00	3	f	167	0	72
8096	2017-02-27 02:43:40.884908+00	5132	f	18	96	73
8097	2017-02-27 02:43:42.638204+00	1353	f	21	12	75
8098	2017-02-27 02:43:42.72068+00	2793	f	22	150	76
8099	2017-02-27 02:43:42.739822+00	164	f	24	7	77
8100	2017-02-27 02:43:44.305453+00	29	f	46	1	79
8101	2017-02-27 02:43:44.374685+00	63	f	35	3	80
8102	2017-02-27 02:43:44.389777+00	237	f	23	5	81
8103	2017-02-27 02:43:44.404179+00	4495	f	25	290	82
8104	2017-02-27 02:43:45.708909+00	54	f	30	7	84
8105	2017-02-27 02:43:45.778407+00	18	f	57	4	85
8106	2017-02-27 02:43:45.793617+00	2	f	118	0	86
8107	2017-02-27 02:43:45.808118+00	97	f	33	11	87
8108	2017-02-27 02:43:45.823428+00	6843	f	27	717	88
8109	2017-02-27 02:43:45.837941+00	82	f	29	9	89
8110	2017-02-27 02:43:45.853355+00	26	f	56	42	90
8111	2017-02-27 02:43:45.867911+00	6	f	71	1	91
8112	2017-02-27 02:43:45.906629+00	0	f	164	2	92
8113	2017-02-27 02:43:45.920467+00	21856	f	28	1799	93
8114	2017-02-27 02:43:45.936482+00	130	f	32	4	94
8115	2017-02-27 02:43:45.950427+00	12	f	91	1	95
8116	2017-02-27 02:43:45.964833+00	2	f	131	1	96
8117	2017-02-27 02:43:45.9804+00	5215	f	36	192	97
8118	2017-02-27 02:43:45.994818+00	121	f	38	2	98
8119	2017-02-27 02:43:46.010513+00	52	f	43	9	99
8120	2017-02-27 02:53:20.934677+00	3759	f	152	140	1
8121	2017-02-27 02:53:21.046966+00	11638	f	112	342	2
8122	2017-02-27 02:53:21.07374+00	1793	f	132	29	3
8123	2017-02-27 02:53:21.089264+00	19172	f	88	843	4
8124	2017-02-27 02:53:21.10384+00	1541	f	120	130	5
8125	2017-02-27 02:53:21.11926+00	1950	f	109	26	6
8126	2017-02-27 02:53:21.133782+00	1109	f	115	25	7
8127	2017-02-27 02:53:21.149182+00	822	f	123	34	8
8128	2017-02-27 02:53:21.163916+00	329	f	141	7	9
8129	2017-02-27 02:53:21.179331+00	379	f	128	3	10
8130	2017-02-27 02:53:21.193965+00	619	f	105	14	11
8131	2017-02-27 02:53:21.209309+00	169	f	151	7	12
8132	2017-02-27 02:53:21.223858+00	222	f	139	5	13
8133	2017-02-27 02:53:21.239463+00	500	f	104	9	14
8134	2017-02-27 02:53:21.253858+00	219	f	127	24	15
8135	2017-02-27 02:53:21.271654+00	333	f	108	22	17
8136	2017-02-27 02:53:22.929615+00	144	f	125	15	19
8137	2017-02-27 02:53:24.495758+00	41	f	166	10	21
8138	2017-02-27 02:53:24.632033+00	48	f	156	6	22
8139	2017-02-27 02:53:24.648793+00	174	f	107	7	23
8140	2017-02-27 02:53:24.663393+00	26	f	169	0	24
8141	2017-02-27 02:53:24.678723+00	2512	f	4	70	25
8142	2017-02-27 02:53:24.693831+00	383	f	31	4	26
8143	2017-02-27 02:53:24.708967+00	97	f	98	2	27
8144	2017-02-27 02:53:24.723965+00	15	f	165	2	28
8145	2017-02-27 02:53:24.738927+00	29633	t	2	875	29
8146	2017-02-27 02:53:24.753864+00	489	f	13	38	30
8147	2017-02-27 02:53:24.768773+00	601	f	10	41	31
8148	2017-02-27 02:53:26.537009+00	198	f	20	13	33
8149	2017-02-27 02:53:26.597664+00	20	f	133	1	34
8150	2017-02-27 02:53:28.294519+00	14339	f	5	849	36
8151	2017-02-27 02:53:28.439239+00	75	f	89	25	37
8152	2017-02-27 02:53:28.453997+00	7	f	170	2	38
8153	2017-02-27 02:53:28.46876+00	29	f	114	2	39
8154	2017-02-27 02:53:28.48381+00	2642	f	6	97	40
8155	2017-02-27 02:53:28.49869+00	5	f	158	5	41
8156	2017-02-27 02:53:28.531421+00	12	f	148	1	42
8157	2017-02-27 02:53:28.554596+00	2515	f	92	162	43
8158	2017-02-27 02:53:28.569339+00	5	f	171	3	44
8159	2017-02-27 02:53:28.58434+00	663	f	8	28	45
8160	2017-02-27 02:53:31.565274+00	3024	f	7	230	48
8161	2017-02-27 02:53:31.590233+00	18	f	100	2	49
8162	2017-02-27 02:53:31.601963+00	1299	f	9	47	50
8163	2017-02-27 02:53:31.617036+00	209	f	11	7	51
8164	2017-02-27 02:53:31.631976+00	18	f	106	0	52
8165	2017-02-27 02:53:31.646881+00	18	f	99	1	53
8166	2017-02-27 02:53:33.306243+00	2	f	173	1	55
8167	2017-02-27 02:53:34.799641+00	15	f	101	0	57
8168	2017-02-27 02:53:34.869474+00	13	f	102	1	58
8169	2017-02-27 02:53:34.889338+00	3	f	161	2	59
8170	2017-02-27 02:53:34.90559+00	83	f	26	5	60
8171	2017-02-27 02:53:34.920715+00	4	f	126	1	61
8172	2017-02-27 02:53:36.648113+00	545	f	12	20	63
8173	2017-02-27 02:53:36.791059+00	424	f	14	24	64
8174	2017-02-27 02:53:36.821044+00	291	f	16	13	65
8175	2017-02-27 02:53:38.436523+00	0	f	174	1	66
8176	2017-02-27 02:53:41.421575+00	1	f	175	0	68
8177	2017-02-27 02:53:43.020883+00	5	f	134	4	70
8178	2017-02-27 02:53:43.081007+00	0	f	168	0	71
8179	2017-02-27 02:53:43.097174+00	52	f	34	4	72
8180	2017-02-27 02:53:43.112247+00	9589	f	15	1048	73
8181	2017-02-27 02:53:43.127168+00	0	f	167	1	74
8182	2017-02-27 02:53:43.142425+00	5129	f	18	96	75
8183	2017-02-27 02:53:44.716222+00	1352	f	21	12	77
8184	2017-02-27 02:53:44.797095+00	2788	f	22	150	78
8185	2017-02-27 02:53:44.811588+00	166	f	24	7	79
8186	2017-02-27 02:53:46.392675+00	31	f	46	1	81
8187	2017-02-27 02:53:46.461312+00	59	f	35	3	82
8188	2017-02-27 02:53:46.47613+00	234	f	23	5	83
8189	2017-02-27 02:53:46.491132+00	4502	f	25	290	84
8190	2017-02-27 02:53:47.807762+00	52	f	30	7	86
8191	2017-02-27 02:53:47.833754+00	16	f	57	4	87
8192	2017-02-27 02:53:47.849488+00	2	f	118	0	88
8193	2017-02-27 02:53:47.864526+00	96	f	33	11	89
8194	2017-02-27 02:53:47.879379+00	6843	f	27	717	90
8195	2017-02-27 02:53:47.894429+00	85	f	29	9	91
8196	2017-02-27 02:53:47.909458+00	22	f	56	42	92
8197	2017-02-27 02:53:47.924524+00	7	f	71	1	93
8198	2017-02-27 02:53:47.939607+00	0	f	164	2	94
8199	2017-02-27 02:53:47.954698+00	21864	f	28	1799	95
8200	2017-02-27 02:53:47.969613+00	126	f	32	4	96
8201	2017-02-27 02:53:47.984783+00	14	f	91	1	97
8202	2017-02-27 02:53:47.999746+00	1	f	131	1	98
8203	2017-02-27 02:53:48.014967+00	121	f	38	2	99
8204	2017-02-27 03:03:21.263431+00	4546	f	152	171	1
8205	2017-02-27 03:03:21.378553+00	11792	f	112	346	2
8206	2017-02-27 03:03:21.393682+00	1886	f	132	33	3
8207	2017-02-27 03:03:21.408011+00	19191	f	88	844	4
8208	2017-02-27 03:03:21.423552+00	1583	f	120	134	5
8209	2017-02-27 03:03:21.437945+00	1983	f	109	26	6
8210	2017-02-27 03:03:21.453762+00	1139	f	115	25	7
8211	2017-02-27 03:03:21.4681+00	856	f	123	34	8
8212	2017-02-27 03:03:21.483822+00	353	f	141	7	9
8213	2017-02-27 03:03:21.49818+00	395	f	128	3	10
8214	2017-02-27 03:03:21.513891+00	632	f	105	15	11
8215	2017-02-27 03:03:21.528308+00	176	f	151	7	12
8216	2017-02-27 03:03:21.543876+00	234	f	139	5	13
8217	2017-02-27 03:03:21.558205+00	505	f	104	9	14
8218	2017-02-27 03:03:21.573929+00	217	f	127	25	15
8219	2017-02-27 03:03:21.590576+00	333	f	108	22	17
8220	2017-02-27 03:03:23.048531+00	151	f	125	16	19
8221	2017-02-27 03:03:23.256342+00	46	f	166	10	20
8222	2017-02-27 03:03:24.784573+00	56	f	156	6	22
8223	2017-02-27 03:03:24.867714+00	172	f	107	7	23
8224	2017-02-27 03:03:24.883658+00	23	f	169	0	24
8225	2017-02-27 03:03:24.897587+00	2520	f	4	70	25
8226	2017-02-27 03:03:24.913066+00	390	f	31	4	26
8227	2017-02-27 03:03:24.927452+00	17	f	165	2	27
8228	2017-02-27 03:03:24.94322+00	95	f	98	2	28
8229	2017-02-27 03:03:24.957509+00	29631	t	2	875	29
8230	2017-02-27 03:03:24.973091+00	613	f	10	41	30
8231	2017-02-27 03:03:24.987612+00	488	f	13	38	31
8232	2017-02-27 03:03:25.003245+00	8	f	170	4	32
8233	2017-02-27 03:03:26.67243+00	22	f	133	1	34
8234	2017-02-27 03:03:26.762758+00	196	f	20	13	35
8235	2017-02-27 03:03:28.4776+00	76	f	89	25	37
8236	2017-02-27 03:03:28.547616+00	14342	f	5	849	38
8237	2017-02-27 03:03:28.562752+00	34	f	114	2	39
8238	2017-02-27 03:03:28.576966+00	13	f	148	1	40
8239	2017-02-27 03:03:28.592888+00	6	f	158	5	41
8240	2017-02-27 03:03:28.606837+00	2645	f	6	97	42
8241	2017-02-27 03:03:28.622675+00	2515	f	92	162	43
8242	2017-02-27 03:03:28.636912+00	5	f	171	3	44
8243	2017-02-27 03:03:28.652618+00	663	f	8	28	45
8244	2017-02-27 03:03:31.582866+00	25	f	100	2	48
8245	2017-02-27 03:03:31.849987+00	3021	f	7	230	49
8246	2017-02-27 03:03:31.88114+00	1299	f	9	47	50
8247	2017-02-27 03:03:31.946246+00	19	f	106	0	51
8248	2017-02-27 03:03:31.961633+00	211	f	11	7	52
8249	2017-02-27 03:03:31.975959+00	22	f	99	1	53
8250	2017-02-27 03:03:33.653251+00	14	f	101	0	55
8251	2017-02-27 03:03:33.726537+00	13	f	102	1	56
8252	2017-02-27 03:03:33.740577+00	7	f	126	1	57
8253	2017-02-27 03:03:33.7564+00	2	f	161	2	58
8254	2017-02-27 03:03:33.770496+00	80	f	26	5	59
8255	2017-02-27 03:03:33.786218+00	546	f	12	20	60
8256	2017-02-27 03:03:33.800426+00	425	f	14	24	61
8257	2017-02-27 03:03:35.538834+00	290	f	16	13	63
8258	2017-02-27 03:03:36.908979+00	1	f	175	0	65
8259	2017-02-27 03:03:37.005136+00	0	f	173	1	66
8260	2017-02-27 03:03:39.855198+00	5	f	134	4	69
8261	2017-02-27 03:03:39.927048+00	0	f	168	0	70
8262	2017-02-27 03:03:39.942487+00	9596	f	15	1048	71
8263	2017-02-27 03:03:39.956716+00	54	f	34	4	72
8264	2017-02-27 03:03:39.972722+00	0	f	167	1	73
8265	2017-02-27 03:03:39.986902+00	5132	f	18	96	74
8266	2017-02-27 03:03:41.571432+00	1353	f	21	12	76
8267	2017-02-27 03:03:41.651461+00	2793	f	22	150	77
8268	2017-02-27 03:03:41.666904+00	169	f	24	7	78
8269	2017-02-27 03:03:43.249023+00	0	f	174	2	80
8270	2017-02-27 03:03:43.34619+00	26	f	46	1	81
8271	2017-02-27 03:03:43.361336+00	60	f	35	3	82
8272	2017-02-27 03:03:43.375584+00	231	f	23	5	83
8273	2017-02-27 03:03:43.391278+00	4499	f	25	290	84
8274	2017-02-27 03:03:43.405604+00	17	f	57	4	85
8275	2017-02-27 03:03:44.571325+00	50	f	30	7	87
8276	2017-02-27 03:03:44.594682+00	0	f	118	0	88
8277	2017-02-27 03:03:44.608905+00	90	f	33	11	89
8278	2017-02-27 03:03:44.624512+00	25	f	56	42	90
8279	2017-02-27 03:03:44.638902+00	6849	f	27	717	91
8280	2017-02-27 03:03:44.654602+00	84	f	29	9	92
8281	2017-02-27 03:03:44.668974+00	8	f	71	1	93
8282	2017-02-27 03:03:44.684712+00	21863	f	28	1799	94
8283	2017-02-27 03:03:44.699079+00	130	f	32	4	95
8284	2017-02-27 03:03:44.714749+00	11	f	91	1	96
8285	2017-02-27 03:03:44.729082+00	2	f	131	1	97
8286	2017-02-27 03:03:44.744811+00	124	f	38	2	98
8287	2017-02-27 03:03:44.759333+00	5212	f	36	192	99
8288	2017-02-27 03:13:21.507121+00	5267	f	152	202	1
8289	2017-02-27 03:13:21.60935+00	11897	f	112	349	2
8290	2017-02-27 03:13:21.632698+00	1940	f	132	33	3
8291	2017-02-27 03:13:21.659131+00	19225	f	88	844	4
8292	2017-02-27 03:13:21.682798+00	1617	f	120	140	5
8293	2017-02-27 03:13:21.698977+00	2014	f	109	26	6
8294	2017-02-27 03:13:21.712733+00	1153	f	115	25	7
8295	2017-02-27 03:13:21.729052+00	873	f	123	34	8
8296	2017-02-27 03:13:21.752919+00	365	f	141	7	9
8297	2017-02-27 03:13:21.766678+00	411	f	128	3	10
8298	2017-02-27 03:13:21.782961+00	637	f	105	15	11
8299	2017-02-27 03:13:21.852188+00	186	f	151	7	12
8300	2017-02-27 03:13:21.873541+00	238	f	139	6	13
8301	2017-02-27 03:13:21.88965+00	515	f	104	9	14
8302	2017-02-27 03:13:21.903433+00	225	f	127	25	15
8303	2017-02-27 03:13:21.922456+00	341	f	108	22	17
8304	2017-02-27 03:13:23.387085+00	145	f	125	16	19
8305	2017-02-27 03:13:23.629105+00	45	f	166	10	20
8306	2017-02-27 03:13:25.027651+00	55	f	156	6	22
8307	2017-02-27 03:13:25.098715+00	30	f	169	1	23
8308	2017-02-27 03:13:25.116064+00	176	f	107	7	24
8309	2017-02-27 03:13:25.132037+00	2513	f	4	70	25
8310	2017-02-27 03:13:25.162535+00	391	f	31	4	26
8311	2017-02-27 03:13:25.178817+00	20	f	165	2	27
8312	2017-02-27 03:13:25.192392+00	97	f	98	2	28
8313	2017-02-27 03:13:25.208728+00	29627	t	2	875	29
8314	2017-02-27 03:13:25.222415+00	617	f	10	42	30
8315	2017-02-27 03:13:25.238923+00	495	f	13	38	31
8316	2017-02-27 03:13:25.252441+00	11	f	170	4	32
8317	2017-02-27 03:13:25.266255+00	24	f	133	1	33
8318	2017-02-27 03:13:28.810595+00	195	f	20	13	36
8319	2017-02-27 03:13:28.883061+00	76	f	89	25	37
8320	2017-02-27 03:13:28.898977+00	14342	f	5	849	38
8321	2017-02-27 03:13:28.916392+00	34	f	114	2	39
8322	2017-02-27 03:13:28.932247+00	7	f	158	5	40
8323	2017-02-27 03:13:28.946011+00	15	f	148	1	41
8324	2017-02-27 03:13:28.962247+00	4	f	171	3	42
8325	2017-02-27 03:13:28.975917+00	2643	f	6	97	43
8326	2017-02-27 03:13:28.992141+00	2513	f	92	162	44
8327	2017-02-27 03:13:29.005949+00	668	f	8	28	45
8328	2017-02-27 03:13:32.02559+00	26	f	100	2	48
8329	2017-02-27 03:13:32.270165+00	16	f	106	0	49
8330	2017-02-27 03:13:32.291336+00	3028	f	7	230	50
8331	2017-02-27 03:13:32.308027+00	1302	f	9	47	51
8332	2017-02-27 03:13:32.321477+00	218	f	11	7	52
8333	2017-02-27 03:13:32.337659+00	23	f	99	1	53
8334	2017-02-27 03:13:33.987193+00	3	f	175	0	55
8335	2017-02-27 03:13:34.060068+00	18	f	101	0	56
8336	2017-02-27 03:13:34.076511+00	0	f	173	1	57
8337	2017-02-27 03:13:34.092678+00	2	f	161	2	58
8338	2017-02-27 03:13:34.105868+00	7	f	126	1	59
8339	2017-02-27 03:13:34.122363+00	4	f	134	4	60
8340	2017-02-27 03:13:34.135823+00	15	f	102	1	61
8341	2017-02-27 03:13:34.149533+00	3	f	168	0	62
8342	2017-02-27 03:13:34.165748+00	82	f	26	5	63
8343	2017-02-27 03:13:35.72382+00	544	f	12	20	65
8344	2017-02-27 03:13:35.885427+00	429	f	14	24	66
8345	2017-02-27 03:13:35.900819+00	295	f	16	13	67
8346	2017-02-27 03:13:40.200818+00	54	f	34	4	71
8347	2017-02-27 03:13:40.306263+00	9602	f	15	1048	72
8348	2017-02-27 03:13:40.322301+00	1	f	167	1	73
8349	2017-02-27 03:13:40.338892+00	5137	f	18	96	74
8350	2017-02-27 03:13:41.898744+00	1356	f	21	12	76
8351	2017-02-27 03:13:41.970654+00	2798	f	22	150	77
8352	2017-02-27 03:13:41.991712+00	4	f	131	1	78
8353	2017-02-27 03:13:42.006679+00	169	f	24	7	79
8354	2017-02-27 03:13:43.856295+00	28	f	46	1	81
8355	2017-02-27 03:13:43.935959+00	60	f	35	3	82
8356	2017-02-27 03:13:43.958797+00	234	f	23	5	83
8357	2017-02-27 03:13:43.975633+00	18	f	57	4	84
8358	2017-02-27 03:13:43.99866+00	4499	f	25	290	85
8359	2017-02-27 03:13:45.311762+00	6	f	71	1	87
8360	2017-02-27 03:13:45.360164+00	47	f	30	7	88
8361	2017-02-27 03:13:45.382582+00	97	f	33	11	89
8362	2017-02-27 03:13:45.395557+00	21	f	56	42	90
8363	2017-02-27 03:13:45.409719+00	6846	f	27	717	91
8364	2017-02-27 03:13:45.425447+00	79	f	29	9	92
8365	2017-02-27 03:13:45.439781+00	0	f	174	2	93
8366	2017-02-27 03:13:45.455394+00	21869	f	28	1800	94
8367	2017-02-27 03:13:45.469706+00	131	f	32	4	95
8368	2017-02-27 03:13:45.485486+00	13	f	91	1	96
8369	2017-02-27 03:13:45.499761+00	120	f	38	2	97
8370	2017-02-27 03:13:45.522477+00	5223	f	36	192	98
8371	2017-02-27 03:13:45.535576+00	17	f	49	2	99
8372	2017-02-27 03:23:21.923867+00	5990	f	152	235	1
8373	2017-02-27 03:23:22.107302+00	12000	f	112	355	2
8374	2017-02-27 03:23:22.123264+00	2010	f	132	33	3
8375	2017-02-27 03:23:22.136683+00	19247	f	88	844	4
8376	2017-02-27 03:23:22.153217+00	1650	f	120	148	5
8377	2017-02-27 03:23:22.166596+00	2041	f	109	26	6
8378	2017-02-27 03:23:22.182875+00	1170	f	115	25	7
8379	2017-02-27 03:23:22.196495+00	901	f	123	34	8
8380	2017-02-27 03:23:22.213163+00	370	f	141	7	9
8381	2017-02-27 03:23:22.22654+00	414	f	128	3	10
8382	2017-02-27 03:23:22.23656+00	196	f	151	9	11
8383	2017-02-27 03:23:22.2465+00	646	f	105	15	12
8384	2017-02-27 03:23:22.256438+00	252	f	139	6	13
8385	2017-02-27 03:23:22.266445+00	525	f	104	9	14
8386	2017-02-27 03:23:22.276483+00	223	f	127	25	15
8387	2017-02-27 03:23:23.77952+00	53	f	166	10	18
8388	2017-02-27 03:23:24.009344+00	148	f	125	16	19
8389	2017-02-27 03:23:24.037581+00	58	f	156	6	20
8390	2017-02-27 03:23:25.465823+00	33	f	169	1	22
8391	2017-02-27 03:23:25.767151+00	180	f	107	7	23
8392	2017-02-27 03:23:25.783085+00	2515	f	4	70	24
8393	2017-02-27 03:23:25.796237+00	21	f	165	2	25
8394	2017-02-27 03:23:25.812436+00	393	f	31	4	26
8395	2017-02-27 03:23:25.826241+00	104	f	98	2	27
8396	2017-02-27 03:23:25.843107+00	13	f	170	4	28
8397	2017-02-27 03:23:25.856287+00	29632	t	2	875	29
8398	2017-02-27 03:23:25.872473+00	621	f	10	42	30
8399	2017-02-27 03:23:25.886365+00	498	f	13	38	31
8400	2017-02-27 03:23:27.509739+00	23	f	133	1	33
8401	2017-02-27 03:23:29.245467+00	12	f	158	5	35
8402	2017-02-27 03:23:29.326155+00	198	f	20	13	36
8403	2017-02-27 03:23:29.342738+00	76	f	89	25	37
8404	2017-02-27 03:23:29.355997+00	34	f	114	2	38
8405	2017-02-27 03:23:29.372554+00	14334	f	5	849	39
8406	2017-02-27 03:23:29.385575+00	19	f	148	1	40
8407	2017-02-27 03:23:29.401813+00	6	f	171	3	41
8408	2017-02-27 03:23:29.415527+00	2647	f	6	97	42
8409	2017-02-27 03:23:29.432091+00	2518	f	92	162	43
8410	2017-02-27 03:23:29.445666+00	671	f	8	28	44
8411	2017-02-27 03:23:32.173067+00	24	f	100	2	47
8412	2017-02-27 03:23:32.243571+00	18	f	106	0	48
8413	2017-02-27 03:23:32.260344+00	3023	f	7	230	49
8414	2017-02-27 03:23:32.273314+00	1306	f	9	47	50
8415	2017-02-27 03:23:32.289704+00	3	f	168	0	51
8416	2017-02-27 03:23:32.340492+00	211	f	11	7	52
8417	2017-02-27 03:23:32.352892+00	21	f	99	1	53
8418	2017-02-27 03:23:33.931558+00	3	f	175	0	55
8419	2017-02-27 03:23:34.004515+00	16	f	101	0	56
8420	2017-02-27 03:23:34.018091+00	0	f	173	1	57
8421	2017-02-27 03:23:34.035313+00	2	f	161	2	58
8422	2017-02-27 03:23:34.047877+00	8	f	126	1	59
8423	2017-02-27 03:23:34.064116+00	5	f	134	4	60
8424	2017-02-27 03:23:34.07768+00	13	f	102	1	61
8425	2017-02-27 03:23:34.087686+00	1	f	167	1	62
8426	2017-02-27 03:23:34.098003+00	81	f	26	5	63
8427	2017-02-27 03:23:35.738137+00	545	f	12	20	65
8428	2017-02-27 03:23:35.799695+00	427	f	14	24	66
8429	2017-02-27 03:23:35.812369+00	294	f	16	13	67
8430	2017-02-27 03:23:40.031546+00	54	f	34	4	71
8431	2017-02-27 03:23:40.115014+00	9601	f	15	1048	72
8432	2017-02-27 03:23:40.131083+00	5138	f	18	96	73
8433	2017-02-27 03:23:41.751396+00	1354	f	21	12	75
8434	2017-02-27 03:23:41.818033+00	2791	f	22	150	76
8435	2017-02-27 03:23:41.834376+00	1	f	131	1	77
8436	2017-02-27 03:23:41.848446+00	171	f	24	7	78
8437	2017-02-27 03:23:43.44372+00	30	f	46	1	80
8438	2017-02-27 03:23:43.469782+00	62	f	35	3	81
8439	2017-02-27 03:23:43.482492+00	233	f	23	5	82
8440	2017-02-27 03:23:43.498696+00	20	f	57	4	83
8441	2017-02-27 03:23:43.512492+00	4508	f	25	290	84
8442	2017-02-27 03:23:44.794299+00	6	f	71	1	86
8443	2017-02-27 03:23:44.866225+00	50	f	30	7	87
8444	2017-02-27 03:23:44.881968+00	95	f	33	11	88
8445	2017-02-27 03:23:44.895814+00	3	f	118	0	89
8446	2017-02-27 03:23:44.905972+00	28	f	56	42	90
8447	2017-02-27 03:23:44.915779+00	6847	f	27	717	91
8448	2017-02-27 03:23:44.925852+00	81	f	29	9	92
8449	2017-02-27 03:23:44.945928+00	0	f	164	2	93
8450	2017-02-27 03:23:44.955834+00	0	f	174	4	94
8451	2017-02-27 03:23:44.96629+00	21861	f	28	1800	95
8452	2017-02-27 03:23:44.976026+00	129	f	32	4	96
8453	2017-02-27 03:23:44.985958+00	14	f	91	1	97
8454	2017-02-27 03:23:44.99603+00	121	f	38	2	98
8455	2017-02-27 03:23:45.017163+00	5220	f	36	192	99
8456	2017-02-27 03:33:21.545442+00	6734	f	152	261	1
8457	2017-02-27 03:33:21.646988+00	12127	f	112	358	2
8458	2017-02-27 03:33:21.6691+00	2077	f	132	33	3
8459	2017-02-27 03:33:21.703084+00	19263	f	88	845	4
8460	2017-02-27 03:33:21.72075+00	1687	f	120	158	5
8461	2017-02-27 03:33:21.737136+00	2064	f	109	27	6
8462	2017-02-27 03:33:21.752756+00	1191	f	115	26	7
8463	2017-02-27 03:33:21.767444+00	908	f	123	35	8
8464	2017-02-27 03:33:21.823774+00	390	f	141	7	9
8465	2017-02-27 03:33:21.8376+00	434	f	128	3	10
8466	2017-02-27 03:33:21.852969+00	203	f	151	11	11
8467	2017-02-27 03:33:21.867418+00	650	f	105	15	12
8468	2017-02-27 03:33:21.883547+00	254	f	139	6	13
8469	2017-02-27 03:33:21.91022+00	523	f	104	9	14
8470	2017-02-27 03:33:21.927444+00	235	f	127	26	15
8471	2017-02-27 03:33:23.416693+00	58	f	166	10	18
8472	2017-02-27 03:33:23.519868+00	152	f	125	16	19
8473	2017-02-27 03:33:23.53747+00	58	f	156	6	20
8474	2017-02-27 03:33:25.004199+00	36	f	169	3	22
8475	2017-02-27 03:33:25.141799+00	179	f	107	7	23
8476	2017-02-27 03:33:25.156162+00	2522	f	4	70	24
8477	2017-02-27 03:33:25.171645+00	25	f	165	2	25
8478	2017-02-27 03:33:25.211877+00	399	f	31	4	26
8479	2017-02-27 03:33:25.249933+00	99	f	98	2	27
8480	2017-02-27 03:33:25.290499+00	14	f	170	5	28
8481	2017-02-27 03:33:25.330275+00	29628	t	2	876	29
8482	2017-02-27 03:33:25.346814+00	620	f	10	42	30
8483	2017-02-27 03:33:25.36683+00	496	f	13	38	31
8484	2017-02-27 03:33:28.758465+00	25	f	133	1	34
8485	2017-02-27 03:33:28.849919+00	202	f	20	13	35
8486	2017-02-27 03:33:28.881469+00	7	f	171	3	36
8487	2017-02-27 03:33:28.895834+00	80	f	89	25	37
8488	2017-02-27 03:33:28.911405+00	40	f	114	2	38
8489	2017-02-27 03:33:28.925867+00	17	f	148	1	39
8490	2017-02-27 03:33:28.941534+00	14335	f	5	849	40
8491	2017-02-27 03:33:28.955826+00	8	f	158	5	41
8492	2017-02-27 03:33:28.971439+00	6	f	168	0	42
8493	2017-02-27 03:33:28.985956+00	2650	f	6	97	43
8494	2017-02-27 03:33:29.001595+00	2517	f	92	162	44
8495	2017-02-27 03:33:29.016405+00	675	f	8	28	45
8496	2017-02-27 03:33:31.820606+00	21	f	100	2	48
8497	2017-02-27 03:33:31.895106+00	23	f	106	0	49
8498	2017-02-27 03:33:31.9651+00	3024	f	7	230	50
8499	2017-02-27 03:33:33.574769+00	1300	f	9	47	52
8500	2017-02-27 03:33:33.669129+00	216	f	11	7	53
8501	2017-02-27 03:33:33.68467+00	21	f	99	1	54
8502	2017-02-27 03:33:33.699015+00	8	f	134	4	55
8503	2017-02-27 03:33:33.714386+00	3	f	175	0	56
8504	2017-02-27 03:33:33.728793+00	17	f	101	0	57
8505	2017-02-27 03:33:33.744421+00	0	f	173	1	58
8506	2017-02-27 03:33:33.758831+00	3	f	161	2	59
8507	2017-02-27 03:33:33.774482+00	9	f	126	1	60
8508	2017-02-27 03:33:33.788855+00	15	f	102	1	61
8509	2017-02-27 03:33:33.804605+00	83	f	26	5	62
8510	2017-02-27 03:33:36.008713+00	1	f	176	0	63
8511	2017-02-27 03:33:39.636151+00	0	f	177	0	65
8512	2017-02-27 03:33:39.650284+00	552	f	12	20	66
8513	2017-02-27 03:33:39.664564+00	422	f	14	24	67
8514	2017-02-27 03:33:39.680167+00	301	f	16	13	68
8515	2017-02-27 03:33:43.987517+00	9592	f	15	1048	72
8516	2017-02-27 03:33:44.061907+00	53	f	34	4	73
8517	2017-02-27 03:33:44.076135+00	1	f	167	1	74
8518	2017-02-27 03:33:44.091722+00	5136	f	18	96	75
8519	2017-02-27 03:33:45.838428+00	1353	f	21	12	77
8520	2017-02-27 03:33:45.896928+00	2792	f	22	150	78
8521	2017-02-27 03:33:45.91113+00	2	f	131	1	79
8522	2017-02-27 03:33:45.927028+00	163	f	24	7	80
8523	2017-02-27 03:33:45.941003+00	32	f	46	1	81
8524	2017-02-27 03:33:47.477075+00	64	f	35	3	83
8525	2017-02-27 03:33:47.561511+00	234	f	23	5	84
8526	2017-02-27 03:33:47.575689+00	19	f	57	4	85
8527	2017-02-27 03:33:47.591296+00	4503	f	25	290	86
8528	2017-02-27 03:33:47.605559+00	49	f	30	7	87
8529	2017-02-27 03:33:48.902612+00	6	f	71	1	89
8530	2017-02-27 03:33:49.003855+00	93	f	33	11	90
8531	2017-02-27 03:33:49.030148+00	3	f	118	0	91
8532	2017-02-27 03:33:49.048471+00	22	f	56	42	92
8533	2017-02-27 03:33:49.059924+00	6838	f	27	717	93
8534	2017-02-27 03:33:49.070288+00	84	f	29	9	94
8535	2017-02-27 03:33:49.079959+00	0	f	164	2	95
8536	2017-02-27 03:33:49.090259+00	0	f	174	6	96
8537	2017-02-27 03:33:49.09993+00	21866	f	28	1801	97
8538	2017-02-27 03:33:49.109823+00	16	f	91	1	98
8539	2017-02-27 03:33:49.119873+00	131	f	32	4	99
8540	2017-02-27 03:43:22.114312+00	7384	f	152	285	1
8541	2017-02-27 03:43:22.19266+00	12246	f	112	361	2
8542	2017-02-27 03:43:22.207193+00	2163	f	132	35	3
8543	2017-02-27 03:43:22.222289+00	19275	f	88	848	4
8544	2017-02-27 03:43:22.2584+00	1712	f	120	162	5
8545	2017-02-27 03:43:22.273518+00	2085	f	109	27	6
8546	2017-02-27 03:43:22.288072+00	1211	f	115	28	7
8547	2017-02-27 03:43:22.30345+00	933	f	123	36	8
8548	2017-02-27 03:43:22.318056+00	395	f	141	7	9
8549	2017-02-27 03:43:22.333569+00	439	f	128	3	10
8550	2017-02-27 03:43:22.348105+00	207	f	151	11	11
8551	2017-02-27 03:43:22.363639+00	654	f	105	15	12
8552	2017-02-27 03:43:22.378103+00	259	f	139	6	13
8553	2017-02-27 03:43:22.393875+00	525	f	104	9	14
8554	2017-02-27 03:43:22.408088+00	227	f	127	27	15
8555	2017-02-27 03:43:23.949143+00	65	f	166	10	18
8556	2017-02-27 03:43:24.058454+00	149	f	125	16	19
8557	2017-02-27 03:43:24.072962+00	67	f	156	6	20
8558	2017-02-27 03:43:24.088262+00	43	f	169	3	21
8559	2017-02-27 03:43:25.520452+00	179	f	107	7	23
8560	2017-02-27 03:43:25.545302+00	23	f	165	2	24
8561	2017-02-27 03:43:25.707951+00	2520	f	4	70	25
8562	2017-02-27 03:43:25.722607+00	406	f	31	4	26
8563	2017-02-27 03:43:25.737603+00	17	f	170	5	27
8564	2017-02-27 03:43:25.752474+00	105	f	98	2	28
8565	2017-02-27 03:43:25.767265+00	29628	t	2	876	29
8566	2017-02-27 03:43:25.782483+00	501	f	13	38	30
8567	2017-02-27 03:43:25.797175+00	627	f	10	43	31
8568	2017-02-27 03:43:28.952751+00	27	f	133	2	33
8569	2017-02-27 03:43:29.046613+00	7	f	171	3	34
8570	2017-02-27 03:43:30.770455+00	19	f	148	1	36
8571	2017-02-27 03:43:30.892596+00	201	f	20	13	37
8572	2017-02-27 03:43:30.915844+00	82	f	89	25	38
8573	2017-02-27 03:43:30.930903+00	34	f	114	2	39
8574	2017-02-27 03:43:30.945776+00	7	f	168	0	40
8575	2017-02-27 03:43:30.960947+00	14345	f	5	849	41
8576	2017-02-27 03:43:30.975727+00	4	f	158	5	42
8577	2017-02-27 03:43:30.990969+00	5	f	175	1	43
8578	2017-02-27 03:43:31.005912+00	2654	f	6	97	44
8579	2017-02-27 03:43:31.021053+00	2525	f	92	163	45
8580	2017-02-27 03:43:31.035889+00	677	f	8	28	46
8581	2017-02-27 03:43:33.652964+00	25	f	100	2	49
8582	2017-02-27 03:43:33.723448+00	24	f	106	0	50
8583	2017-02-27 03:43:33.738615+00	3023	f	7	231	51
8584	2017-02-27 03:43:35.357982+00	1305	f	9	47	53
8585	2017-02-27 03:43:35.437551+00	2	f	161	2	54
8586	2017-02-27 03:43:35.452881+00	212	f	11	7	55
8587	2017-02-27 03:43:35.467381+00	19	f	99	1	56
8588	2017-02-27 03:43:37.463707+00	1	f	178	0	57
8589	2017-02-27 03:43:37.478544+00	2	f	176	1	58
8590	2017-02-27 03:43:37.492758+00	3	f	167	1	59
8591	2017-02-27 03:43:37.508259+00	9	f	134	4	60
8592	2017-02-27 03:43:37.522589+00	16	f	101	0	61
8593	2017-02-27 03:43:37.542901+00	9	f	126	1	62
8594	2017-02-27 03:43:37.558039+00	14	f	102	1	63
8595	2017-02-27 03:43:37.572509+00	77	f	26	5	64
8596	2017-02-27 03:43:39.255812+00	0	f	177	0	66
8597	2017-02-27 03:43:39.418465+00	543	f	12	20	67
8598	2017-02-27 03:43:39.433641+00	421	f	14	24	68
8599	2017-02-27 03:43:39.447705+00	297	f	16	13	69
8600	2017-02-27 03:43:42.493074+00	0	f	173	1	72
8601	2017-02-27 03:43:42.584873+00	56	f	34	4	73
8602	2017-02-27 03:43:42.615761+00	9590	f	15	1049	74
8603	2017-02-27 03:43:42.631675+00	0	f	164	2	75
8604	2017-02-27 03:43:42.645606+00	5132	f	18	96	76
8605	2017-02-27 03:43:44.222199+00	1348	f	21	12	78
8606	2017-02-27 03:43:44.300424+00	2793	f	22	150	79
8607	2017-02-27 03:43:44.34816+00	2	f	131	1	80
8608	2017-02-27 03:43:44.375936+00	169	f	24	7	81
8609	2017-02-27 03:43:44.389767+00	32	f	46	1	82
8610	2017-02-27 03:43:45.801059+00	62	f	35	3	84
8611	2017-02-27 03:43:47.302525+00	23	f	57	4	86
8612	2017-02-27 03:43:47.374819+00	234	f	23	5	87
8613	2017-02-27 03:43:47.391307+00	4500	f	25	290	88
8614	2017-02-27 03:43:48.856446+00	54	f	30	7	90
8615	2017-02-27 03:43:48.963184+00	98	f	33	11	91
8616	2017-02-27 03:43:48.982098+00	3	f	118	0	92
8617	2017-02-27 03:43:48.998474+00	6846	f	27	717	93
8618	2017-02-27 03:43:49.011827+00	84	f	29	9	94
8619	2017-02-27 03:43:49.025125+00	25	f	56	42	95
8620	2017-02-27 03:43:49.03829+00	8	f	71	1	96
8621	2017-02-27 03:43:49.076377+00	21872	f	28	1801	97
8622	2017-02-27 03:43:49.093114+00	17	f	91	1	98
8623	2017-02-27 03:43:49.109537+00	135	f	32	4	99
8624	2017-02-27 03:53:22.387486+00	8016	f	152	309	1
8625	2017-02-27 03:53:22.48579+00	12344	f	112	361	2
8626	2017-02-27 03:53:22.507416+00	2234	f	132	36	3
8627	2017-02-27 03:53:22.524862+00	19297	f	88	848	4
8628	2017-02-27 03:53:22.538577+00	1745	f	120	168	5
8629	2017-02-27 03:53:22.554813+00	2100	f	109	27	6
8630	2017-02-27 03:53:22.569337+00	1236	f	115	28	7
8631	2017-02-27 03:53:22.5855+00	965	f	123	36	8
8632	2017-02-27 03:53:22.598473+00	429	f	141	8	9
8633	2017-02-27 03:53:22.60814+00	452	f	128	3	10
8634	2017-02-27 03:53:22.636038+00	216	f	151	11	11
8635	2017-02-27 03:53:22.648176+00	671	f	105	15	12
8636	2017-02-27 03:53:22.658276+00	265	f	139	6	13
8637	2017-02-27 03:53:22.668275+00	536	f	104	9	14
8638	2017-02-27 03:53:22.678211+00	233	f	127	27	15
8639	2017-02-27 03:53:22.688223+00	74	f	166	10	16
8640	2017-02-27 03:53:24.170347+00	46	f	169	3	19
8641	2017-02-27 03:53:24.27849+00	149	f	125	16	20
8642	2017-02-27 03:53:24.292901+00	65	f	156	6	21
8643	2017-02-27 03:53:25.748778+00	179	f	107	7	23
8644	2017-02-27 03:53:25.817337+00	25	f	165	2	24
8645	2017-02-27 03:53:25.833568+00	2528	f	4	70	25
8646	2017-02-27 03:53:25.846921+00	401	f	31	4	26
8647	2017-02-27 03:53:25.863786+00	18	f	170	7	27
8648	2017-02-27 03:53:25.876784+00	104	f	98	2	28
8649	2017-02-27 03:53:25.893362+00	29631	t	2	876	29
8650	2017-02-27 03:53:25.907077+00	627	f	10	43	30
8651	2017-02-27 03:53:25.940861+00	496	f	13	38	31
8652	2017-02-27 03:53:25.957486+00	8	f	171	3	32
8653	2017-02-27 03:53:25.974012+00	21	f	148	1	33
8654	2017-02-27 03:53:27.732115+00	27	f	133	2	35
8655	2017-02-27 03:53:29.653264+00	202	f	20	13	37
8656	2017-02-27 03:53:29.693626+00	78	f	89	25	38
8657	2017-02-27 03:53:29.710052+00	34	f	114	2	39
8658	2017-02-27 03:53:29.726697+00	6	f	168	0	40
8659	2017-02-27 03:53:29.739904+00	14342	f	5	849	41
8660	2017-02-27 03:53:29.753111+00	7	f	175	1	42
8661	2017-02-27 03:53:29.766563+00	3	f	178	1	43
8662	2017-02-27 03:53:29.779816+00	3	f	176	1	44
8663	2017-02-27 03:53:29.793089+00	4	f	158	5	45
8664	2017-02-27 03:53:29.806559+00	2654	f	6	97	46
8665	2017-02-27 03:53:29.819907+00	4	f	167	2	47
8666	2017-02-27 03:53:29.833239+00	2527	f	92	163	48
8667	2017-02-27 03:53:29.846683+00	674	f	8	28	49
8668	2017-02-27 03:53:32.810305+00	25	f	100	2	52
8669	2017-02-27 03:53:33.154374+00	23	f	106	0	53
8670	2017-02-27 03:53:33.179199+00	3027	f	7	231	54
8671	2017-02-27 03:53:34.764226+00	1302	f	9	47	56
8672	2017-02-27 03:53:34.823699+00	4	f	161	2	57
8673	2017-02-27 03:53:34.839994+00	218	f	11	7	58
8674	2017-02-27 03:53:34.856779+00	20	f	99	1	59
8675	2017-02-27 03:53:34.87307+00	18	f	101	0	60
8676	2017-02-27 03:53:34.886266+00	8	f	134	4	61
8677	2017-02-27 03:53:34.899704+00	7	f	126	1	62
8678	2017-02-27 03:53:34.913329+00	15	f	102	1	63
8679	2017-02-27 03:53:37.284074+00	1	f	179	0	64
8680	2017-02-27 03:53:37.299815+00	77	f	26	5	65
8681	2017-02-27 03:53:37.316239+00	550	f	12	20	66
8682	2017-02-27 03:53:37.329492+00	426	f	14	24	67
8683	2017-02-27 03:53:39.114257+00	300	f	16	14	69
8684	2017-02-27 03:53:42.168915+00	0	f	173	1	72
8685	2017-02-27 03:53:42.236904+00	56	f	34	4	73
8686	2017-02-27 03:53:42.253047+00	9597	f	15	1049	74
8687	2017-02-27 03:53:42.269611+00	0	f	164	2	75
8688	2017-02-27 03:53:42.282969+00	5141	f	18	96	76
8689	2017-02-27 03:53:43.992232+00	1350	f	21	12	78
8690	2017-02-27 03:53:44.017314+00	2795	f	22	151	79
8691	2017-02-27 03:53:44.03383+00	168	f	24	7	80
8692	2017-02-27 03:53:44.047259+00	31	f	46	1	81
8693	2017-02-27 03:53:45.64268+00	62	f	35	3	83
8694	2017-02-27 03:53:47.118366+00	233	f	23	5	85
8695	2017-02-27 03:53:47.189721+00	21	f	57	4	86
8696	2017-02-27 03:53:47.205841+00	4498	f	25	290	87
8697	2017-02-27 03:53:47.222232+00	56	f	30	7	88
8698	2017-02-27 03:53:48.55696+00	95	f	33	11	90
8699	2017-02-27 03:53:48.613324+00	2	f	118	0	91
8700	2017-02-27 03:53:48.640703+00	6851	f	27	717	92
8701	2017-02-27 03:53:48.655787+00	85	f	29	9	93
8702	2017-02-27 03:53:48.669203+00	26	f	56	42	94
8703	2017-02-27 03:53:48.683337+00	7	f	71	1	95
8704	2017-02-27 03:53:48.699197+00	21871	f	28	1801	96
8705	2017-02-27 03:53:48.729841+00	15	f	91	1	97
8706	2017-02-27 03:53:48.745977+00	132	f	32	4	98
8707	2017-02-27 03:53:48.759574+00	0	f	131	1	99
8708	2017-02-27 04:03:22.577652+00	8574	f	152	336	1
8709	2017-02-27 04:03:22.679652+00	12439	f	112	363	2
8710	2017-02-27 04:03:22.696054+00	2292	f	132	36	3
8711	2017-02-27 04:03:22.709315+00	19320	f	88	849	4
8712	2017-02-27 04:03:22.770785+00	1783	f	120	174	5
8713	2017-02-27 04:03:22.861447+00	2129	f	109	27	6
8714	2017-02-27 04:03:22.872825+00	1244	f	115	28	7
8715	2017-02-27 04:03:22.882707+00	980	f	123	36	8
8716	2017-02-27 04:03:22.902662+00	441	f	141	8	9
8717	2017-02-27 04:03:22.912585+00	460	f	128	3	10
8718	2017-02-27 04:03:22.922525+00	218	f	151	11	11
8719	2017-02-27 04:03:22.932422+00	674	f	105	15	12
8720	2017-02-27 04:03:22.942537+00	275	f	139	6	13
8721	2017-02-27 04:03:22.959722+00	540	f	104	9	14
8722	2017-02-27 04:03:22.972562+00	237	f	127	28	15
8723	2017-02-27 04:03:22.982282+00	78	f	166	10	16
8724	2017-02-27 04:03:24.43692+00	49	f	169	3	19
8725	2017-02-27 04:03:24.507289+00	151	f	125	16	20
8726	2017-02-27 04:03:24.516976+00	68	f	156	6	21
8727	2017-02-27 04:03:25.950741+00	182	f	107	7	23
8728	2017-02-27 04:03:26.020591+00	24	f	165	2	24
8729	2017-02-27 04:03:26.061007+00	20	f	170	7	25
8730	2017-02-27 04:03:26.07098+00	2526	f	4	70	26
8731	2017-02-27 04:03:26.086433+00	405	f	31	4	27
8732	2017-02-27 04:03:26.100897+00	108	f	98	2	28
8733	2017-02-27 04:03:26.120891+00	29633	t	2	876	29
8734	2017-02-27 04:03:26.130853+00	625	f	10	43	30
8735	2017-02-27 04:03:26.171727+00	505	f	13	38	31
8736	2017-02-27 04:03:26.181728+00	10	f	171	3	32
8737	2017-02-27 04:03:26.191732+00	26	f	148	1	33
8738	2017-02-27 04:03:27.869374+00	26	f	133	2	35
8739	2017-02-27 04:03:29.701874+00	5	f	178	3	37
8740	2017-02-27 04:03:29.809544+00	199	f	20	13	38
8741	2017-02-27 04:03:29.862435+00	35	f	114	2	39
8742	2017-02-27 04:03:29.93257+00	82	f	89	25	40
8743	2017-02-27 04:03:29.959775+00	4	f	176	2	41
8744	2017-02-27 04:03:29.971786+00	14343	f	5	849	42
8745	2017-02-27 04:03:29.981716+00	7	f	175	1	43
8746	2017-02-27 04:03:29.991711+00	6	f	168	0	44
8747	2017-02-27 04:03:30.001616+00	5	f	167	2	45
8748	2017-02-27 04:03:30.01169+00	2649	f	6	97	46
8749	2017-02-27 04:03:30.021595+00	3	f	179	1	47
8750	2017-02-27 04:03:30.03198+00	2525	f	92	163	48
8751	2017-02-27 04:03:30.041648+00	674	f	8	28	49
8752	2017-02-27 04:03:31.431251+00	5	f	158	5	51
8753	2017-02-27 04:03:32.918126+00	23	f	100	2	53
8754	2017-02-27 04:03:33.048207+00	25	f	106	0	54
8755	2017-02-27 04:03:33.059693+00	3027	f	7	231	55
8756	2017-02-27 04:03:34.803183+00	1301	f	9	47	57
8757	2017-02-27 04:03:34.874538+00	5	f	161	2	58
8758	2017-02-27 04:03:34.884411+00	215	f	11	7	59
8759	2017-02-27 04:03:34.89421+00	21	f	99	1	60
8760	2017-02-27 04:03:34.904148+00	18	f	101	0	61
8761	2017-02-27 04:03:34.913985+00	9	f	126	1	62
8762	2017-02-27 04:03:34.92407+00	16	f	102	1	63
8763	2017-02-27 04:03:34.933972+00	5	f	134	6	64
8764	2017-02-27 04:03:36.765237+00	0	f	180	0	65
8765	2017-02-27 04:03:39.082793+00	0	f	181	0	66
8766	2017-02-27 04:03:39.095227+00	80	f	26	5	67
8767	2017-02-27 04:03:39.106269+00	547	f	12	20	68
8768	2017-02-27 04:03:39.115764+00	423	f	14	24	69
8769	2017-02-27 04:03:40.762788+00	295	f	16	14	71
8770	2017-02-27 04:03:43.870162+00	54	f	34	4	74
8771	2017-02-27 04:03:43.978756+00	9593	f	15	1049	75
8772	2017-02-27 04:03:43.997791+00	1	f	164	2	76
8773	2017-02-27 04:03:44.008238+00	5140	f	18	96	77
8774	2017-02-27 04:03:45.605056+00	1351	f	21	12	79
8775	2017-02-27 04:03:45.672774+00	2798	f	22	151	80
8776	2017-02-27 04:03:45.692602+00	173	f	24	7	81
8777	2017-02-27 04:03:45.702549+00	3	f	131	1	82
8778	2017-02-27 04:03:45.72259+00	30	f	46	1	83
8779	2017-02-27 04:03:47.33603+00	64	f	35	3	85
8780	2017-02-27 04:03:47.426948+00	0	f	173	1	86
8781	2017-02-27 04:03:47.456387+00	236	f	23	5	87
8782	2017-02-27 04:03:47.467369+00	21	f	57	4	88
8783	2017-02-27 04:03:47.48734+00	4501	f	25	290	89
8784	2017-02-27 04:03:48.857784+00	51	f	30	7	91
8785	2017-02-27 04:03:48.970794+00	8	f	71	1	92
8786	2017-02-27 04:03:49.034924+00	94	f	33	11	93
8787	2017-02-27 04:03:49.053975+00	0	f	118	0	94
8788	2017-02-27 04:03:49.067603+00	24	f	56	42	95
8789	2017-02-27 04:03:49.087667+00	6842	f	27	718	96
8790	2017-02-27 04:03:49.097891+00	82	f	29	9	97
8791	2017-02-27 04:03:49.113823+00	21876	f	28	1801	98
8792	2017-02-27 04:03:49.127359+00	13	f	91	1	99
8793	2017-02-27 04:13:23.251519+00	9168	f	152	359	1
8794	2017-02-27 04:13:23.419143+00	12523	f	112	365	2
8795	2017-02-27 04:13:23.436105+00	2357	f	132	39	3
8796	2017-02-27 04:13:23.448424+00	19337	f	88	849	4
8797	2017-02-27 04:13:23.465639+00	1807	f	120	180	5
8798	2017-02-27 04:13:23.478496+00	2156	f	109	27	6
8799	2017-02-27 04:13:23.488466+00	1267	f	115	29	7
8800	2017-02-27 04:13:23.498374+00	1002	f	123	37	8
8801	2017-02-27 04:13:23.518592+00	458	f	141	8	9
8802	2017-02-27 04:13:23.528432+00	460	f	128	3	10
8803	2017-02-27 04:13:23.538475+00	229	f	151	12	11
8804	2017-02-27 04:13:23.548433+00	284	f	139	6	12
8805	2017-02-27 04:13:23.55847+00	687	f	105	15	13
8806	2017-02-27 04:13:23.578563+00	549	f	104	9	14
8807	2017-02-27 04:13:23.588632+00	83	f	166	10	15
8808	2017-02-27 04:13:23.598683+00	237	f	127	30	16
8809	2017-02-27 04:13:25.042841+00	59	f	169	3	19
8810	2017-02-27 04:13:25.131484+00	152	f	125	16	20
8811	2017-02-27 04:13:25.143269+00	67	f	156	6	21
8812	2017-02-27 04:13:26.810099+00	185	f	107	7	23
8813	2017-02-27 04:13:26.884831+00	24	f	170	8	24
8814	2017-02-27 04:13:26.898312+00	27	f	165	2	25
8815	2017-02-27 04:13:26.914488+00	2531	f	4	70	26
8816	2017-02-27 04:13:26.927801+00	404	f	31	4	27
8817	2017-02-27 04:13:26.937713+00	108	f	98	2	28
8818	2017-02-27 04:13:26.947711+00	12	f	171	3	29
8819	2017-02-27 04:13:26.957508+00	29634	t	2	876	30
8820	2017-02-27 04:13:26.96778+00	630	f	10	43	31
8821	2017-02-27 04:13:26.999359+00	502	f	13	38	32
8822	2017-02-27 04:13:27.009314+00	7	f	178	4	33
8823	2017-02-27 04:13:29.674866+00	27	f	148	1	35
8824	2017-02-27 04:13:29.776697+00	29	f	133	2	36
8825	2017-02-27 04:13:31.679475+00	203	f	20	13	38
8826	2017-02-27 04:13:31.772742+00	79	f	89	25	39
8827	2017-02-27 04:13:31.792352+00	36	f	114	2	40
8828	2017-02-27 04:13:31.808636+00	14342	f	5	849	41
8829	2017-02-27 04:13:31.822299+00	6	f	168	0	42
8830	2017-02-27 04:13:31.832291+00	3	f	176	2	43
8831	2017-02-27 04:13:31.842295+00	10	f	158	5	44
8832	2017-02-27 04:13:31.852369+00	6	f	175	1	45
8833	2017-02-27 04:13:31.868828+00	2646	f	6	97	46
8834	2017-02-27 04:13:31.882413+00	6	f	167	2	47
8835	2017-02-27 04:13:31.892375+00	2530	f	92	163	48
8836	2017-02-27 04:13:31.902569+00	681	f	8	28	49
8837	2017-02-27 04:13:33.397183+00	23	f	100	2	51
8838	2017-02-27 04:13:34.91799+00	20	f	106	0	53
8839	2017-02-27 04:13:36.813883+00	2	f	182	0	54
8840	2017-02-27 04:13:36.83593+00	3030	f	7	231	55
8841	2017-02-27 04:13:38.45657+00	1304	f	9	47	57
8842	2017-02-27 04:13:38.530662+00	212	f	11	7	58
8843	2017-02-27 04:13:38.546326+00	20	f	99	1	59
8844	2017-02-27 04:13:38.560173+00	16	f	101	0	60
8845	2017-02-27 04:13:38.576075+00	2	f	161	2	61
8846	2017-02-27 04:13:38.590034+00	9	f	126	1	62
8847	2017-02-27 04:13:38.605953+00	7	f	134	6	63
8848	2017-02-27 04:13:38.620044+00	16	f	102	1	64
8849	2017-02-27 04:13:40.478804+00	1	f	183	0	65
8850	2017-02-27 04:13:40.495114+00	1	f	179	1	66
8851	2017-02-27 04:13:40.510872+00	80	f	26	5	67
8852	2017-02-27 04:13:40.544125+00	554	f	12	20	68
8853	2017-02-27 04:13:40.558604+00	427	f	14	24	69
8854	2017-02-27 04:13:42.099477+00	297	f	16	15	71
8855	2017-02-27 04:13:45.129116+00	57	f	34	4	74
8856	2017-02-27 04:13:45.196732+00	9598	f	15	1049	75
8857	2017-02-27 04:13:45.213498+00	1	f	164	2	76
8858	2017-02-27 04:13:45.226272+00	5137	f	18	96	77
8859	2017-02-27 04:13:45.241015+00	0	f	181	0	78
8860	2017-02-27 04:13:46.869539+00	1352	f	21	12	80
8861	2017-02-27 04:13:46.925189+00	169	f	24	7	81
8862	2017-02-27 04:13:46.940776+00	2792	f	22	151	82
8863	2017-02-27 04:13:46.955156+00	2	f	131	1	83
8864	2017-02-27 04:13:46.970696+00	32	f	46	1	84
8865	2017-02-27 04:13:48.390471+00	66	f	35	3	86
8866	2017-02-27 04:13:48.585846+00	0	f	173	1	87
8867	2017-02-27 04:13:48.602813+00	21	f	57	3	88
8868	2017-02-27 04:13:48.619659+00	232	f	23	5	89
8869	2017-02-27 04:13:48.635338+00	4497	f	25	290	90
8870	2017-02-27 04:13:49.815237+00	53	f	30	7	92
8871	2017-02-27 04:13:49.899266+00	7	f	71	1	93
8872	2017-02-27 04:13:49.936798+00	26	f	56	42	94
8873	2017-02-27 04:13:49.953046+00	91	f	33	11	95
8874	2017-02-27 04:13:49.971241+00	3	f	118	0	96
8875	2017-02-27 04:13:49.986245+00	6838	f	27	718	97
8876	2017-02-27 04:13:49.99913+00	81	f	29	9	98
8877	2017-02-27 04:13:50.013138+00	21871	f	28	1801	99
8878	2017-02-27 04:23:23.430858+00	9756	f	152	394	1
8879	2017-02-27 04:23:23.500097+00	12615	f	112	365	2
8880	2017-02-27 04:23:23.509127+00	2436	f	132	41	3
8881	2017-02-27 04:23:23.52897+00	19349	f	88	849	4
8882	2017-02-27 04:23:23.564771+00	1841	f	120	181	5
8883	2017-02-27 04:23:23.579262+00	2178	f	109	27	6
8884	2017-02-27 04:23:23.594269+00	1285	f	115	29	7
8885	2017-02-27 04:23:23.6093+00	1019	f	123	37	8
8886	2017-02-27 04:23:23.624397+00	468	f	141	8	9
8887	2017-02-27 04:23:23.639934+00	474	f	128	3	10
8888	2017-02-27 04:23:23.654514+00	238	f	151	12	11
8889	2017-02-27 04:23:23.669466+00	290	f	139	6	12
8890	2017-02-27 04:23:23.684604+00	693	f	105	16	13
8891	2017-02-27 04:23:23.699497+00	551	f	104	9	14
8892	2017-02-27 04:23:23.715037+00	94	f	166	10	15
8893	2017-02-27 04:23:23.729621+00	240	f	127	31	16
8894	2017-02-27 04:23:25.168616+00	59	f	169	3	19
8895	2017-02-27 04:23:25.319616+00	147	f	125	16	20
8896	2017-02-27 04:23:25.348074+00	69	f	156	6	21
8897	2017-02-27 04:23:27.211566+00	186	f	107	7	23
8898	2017-02-27 04:23:27.283137+00	23	f	170	9	24
8899	2017-02-27 04:23:27.299527+00	22	f	165	2	25
8900	2017-02-27 04:23:27.314456+00	2531	f	4	70	26
8901	2017-02-27 04:23:27.329447+00	412	f	31	4	27
8902	2017-02-27 04:23:27.344315+00	107	f	98	2	28
8903	2017-02-27 04:23:27.359465+00	9	f	178	4	29
8904	2017-02-27 04:23:27.374322+00	13	f	171	3	30
8905	2017-02-27 04:23:27.389396+00	29634	t	2	876	31
8906	2017-02-27 04:23:27.404274+00	626	f	10	43	32
8907	2017-02-27 04:23:27.424436+00	507	f	13	38	33
8908	2017-02-27 04:23:29.05495+00	27	f	148	1	35
8909	2017-02-27 04:23:29.12548+00	29	f	133	2	36
8910	2017-02-27 04:23:30.958835+00	201	f	20	13	38
8911	2017-02-27 04:23:31.074808+00	36	f	114	2	39
8912	2017-02-27 04:23:31.092985+00	82	f	89	25	40
8913	2017-02-27 04:23:31.109446+00	8	f	168	1	41
8914	2017-02-27 04:23:31.124486+00	14340	f	5	850	42
8915	2017-02-27 04:23:31.139385+00	7	f	175	1	43
8916	2017-02-27 04:23:31.154239+00	2648	f	6	97	44
8917	2017-02-27 04:23:31.174217+00	5	f	167	2	45
8918	2017-02-27 04:23:31.189196+00	5	f	158	5	46
8919	2017-02-27 04:23:31.204419+00	2528	f	92	163	47
8920	2017-02-27 04:23:31.219177+00	678	f	8	28	48
8921	2017-02-27 04:23:31.23432+00	2	f	176	2	49
8922	2017-02-27 04:23:32.559178+00	25	f	100	2	51
8923	2017-02-27 04:23:34.230978+00	24	f	106	0	53
8924	2017-02-27 04:23:34.342033+00	2	f	182	0	54
8925	2017-02-27 04:23:34.363125+00	3030	f	7	231	55
8926	2017-02-27 04:23:36.050924+00	1305	f	9	47	57
8927	2017-02-27 04:23:36.123198+00	2	f	179	1	58
8928	2017-02-27 04:23:36.137684+00	213	f	11	7	59
8929	2017-02-27 04:23:36.153079+00	21	f	99	1	60
8930	2017-02-27 04:23:36.167561+00	18	f	101	0	61
8931	2017-02-27 04:23:36.182796+00	4	f	161	2	62
8932	2017-02-27 04:23:36.197457+00	7	f	126	1	63
8933	2017-02-27 04:23:36.212642+00	8	f	134	7	64
8934	2017-02-27 04:23:36.227377+00	15	f	102	1	65
8935	2017-02-27 04:23:38.21634+00	0	f	184	0	66
8936	2017-02-27 04:23:38.232719+00	1	f	183	0	67
8937	2017-02-27 04:23:38.2487+00	79	f	26	5	68
8938	2017-02-27 04:23:38.273586+00	545	f	12	20	69
8939	2017-02-27 04:23:38.288816+00	426	f	14	24	70
8940	2017-02-27 04:23:39.905042+00	299	f	16	15	72
8941	2017-02-27 04:23:43.128256+00	51	f	34	4	75
8942	2017-02-27 04:23:43.352076+00	9602	f	15	1049	76
8943	2017-02-27 04:23:43.375891+00	1	f	164	2	77
8944	2017-02-27 04:23:43.392136+00	5139	f	18	96	78
8945	2017-02-27 04:23:43.416939+00	0	f	181	0	79
8946	2017-02-27 04:23:45.672483+00	1350	f	21	12	81
8947	2017-02-27 04:23:45.72892+00	173	f	24	7	82
8948	2017-02-27 04:23:45.743202+00	2792	f	22	151	83
8949	2017-02-27 04:23:45.763267+00	3	f	131	1	84
8950	2017-02-27 04:23:45.778551+00	29	f	46	1	85
8951	2017-02-27 04:23:47.344662+00	63	f	35	3	87
8952	2017-02-27 04:23:47.413459+00	0	f	173	1	88
8953	2017-02-27 04:23:47.427758+00	20	f	57	3	89
8954	2017-02-27 04:23:47.44761+00	235	f	23	5	90
8955	2017-02-27 04:23:47.462932+00	4505	f	25	290	91
8956	2017-02-27 04:23:48.809627+00	55	f	30	7	93
8957	2017-02-27 04:23:48.841843+00	7	f	71	1	94
8958	2017-02-27 04:23:48.872626+00	28	f	56	42	95
8959	2017-02-27 04:23:48.887513+00	98	f	33	11	96
8960	2017-02-27 04:23:48.902406+00	0	f	118	0	97
8961	2017-02-27 04:23:48.917402+00	6839	f	27	718	98
8962	2017-02-27 04:23:48.932258+00	82	f	29	9	99
8963	2017-02-27 04:33:23.960142+00	10298	f	152	408	1
8964	2017-02-27 04:33:24.04589+00	12699	f	112	365	2
8965	2017-02-27 04:33:24.063491+00	2493	f	132	42	3
8966	2017-02-27 04:33:24.075364+00	19368	f	88	849	4
8967	2017-02-27 04:33:24.091007+00	1869	f	120	187	5
8968	2017-02-27 04:33:24.105402+00	2190	f	109	27	6
8969	2017-02-27 04:33:24.120939+00	1049	f	123	37	7
8970	2017-02-27 04:33:24.135315+00	1295	f	115	29	8
8971	2017-02-27 04:33:24.151153+00	483	f	141	8	9
8972	2017-02-27 04:33:24.165263+00	480	f	128	3	10
8973	2017-02-27 04:33:24.180986+00	249	f	151	12	11
8974	2017-02-27 04:33:24.195265+00	299	f	139	6	12
8975	2017-02-27 04:33:24.211014+00	695	f	105	16	13
8976	2017-02-27 04:33:24.225336+00	97	f	166	10	14
8977	2017-02-27 04:33:24.235329+00	560	f	104	9	15
8978	2017-02-27 04:33:24.24539+00	251	f	127	31	16
8979	2017-02-27 04:33:25.711469+00	62	f	169	3	18
8980	2017-02-27 04:33:25.772846+00	66	f	156	6	20
8981	2017-02-27 04:33:25.787863+00	149	f	125	16	21
8982	2017-02-27 04:33:27.329475+00	189	f	107	7	23
8983	2017-02-27 04:33:27.390238+00	29	f	170	9	24
8984	2017-02-27 04:33:27.404349+00	26	f	165	2	25
8985	2017-02-27 04:33:27.419917+00	2540	f	4	70	26
8986	2017-02-27 04:33:27.434343+00	12	f	178	5	27
8987	2017-02-27 04:33:27.450222+00	407	f	31	4	28
8988	2017-02-27 04:33:27.464349+00	109	f	98	2	29
8989	2017-02-27 04:33:27.480176+00	12	f	171	3	30
8990	2017-02-27 04:33:27.494517+00	29640	t	2	876	31
8991	2017-02-27 04:33:27.510233+00	630	f	10	43	32
8992	2017-02-27 04:33:27.524634+00	504	f	13	38	33
8993	2017-02-27 04:33:29.680244+00	25	f	148	1	35
8994	2017-02-27 04:33:29.751019+00	33	f	133	2	36
8995	2017-02-27 04:33:31.457014+00	204	f	20	13	38
8996	2017-02-27 04:33:31.552818+00	40	f	114	2	39
8997	2017-02-27 04:33:31.573422+00	87	f	89	25	40
8998	2017-02-27 04:33:31.585325+00	9	f	175	1	41
8999	2017-02-27 04:33:31.601454+00	6	f	168	1	42
9000	2017-02-27 04:33:31.615191+00	14345	f	5	850	43
9001	2017-02-27 04:33:31.631077+00	2649	f	6	97	44
9002	2017-02-27 04:33:31.645367+00	5	f	167	2	45
9003	2017-02-27 04:33:31.661193+00	5	f	158	5	46
9004	2017-02-27 04:33:31.675382+00	2528	f	92	163	47
9005	2017-02-27 04:33:31.691262+00	679	f	8	28	48
9006	2017-02-27 04:33:31.705514+00	3	f	176	2	49
9007	2017-02-27 04:33:33.226821+00	25	f	100	2	51
9008	2017-02-27 04:33:34.60035+00	21	f	106	0	53
9009	2017-02-27 04:33:34.673937+00	1	f	184	0	54
9010	2017-02-27 04:33:34.740052+00	1	f	182	0	55
9011	2017-02-27 04:33:34.753722+00	3030	f	7	231	56
9012	2017-02-27 04:33:36.783946+00	1308	f	9	47	58
9013	2017-02-27 04:33:36.869512+00	3	f	179	2	59
9014	2017-02-27 04:33:36.885186+00	213	f	11	7	60
9015	2017-02-27 04:33:36.89931+00	20	f	99	1	61
9016	2017-02-27 04:33:36.915089+00	16	f	101	0	62
9017	2017-02-27 04:33:36.929163+00	7	f	134	7	63
9018	2017-02-27 04:33:36.945049+00	3	f	161	2	64
9019	2017-02-27 04:33:36.959213+00	9	f	126	1	65
9020	2017-02-27 04:33:36.975137+00	12	f	102	1	66
9021	2017-02-27 04:33:38.785635+00	0	f	185	0	67
9022	2017-02-27 04:33:38.801059+00	0	f	183	1	68
9023	2017-02-27 04:33:38.810962+00	83	f	26	5	69
9024	2017-02-27 04:33:38.820999+00	550	f	12	20	70
9025	2017-02-27 04:33:38.830991+00	425	f	14	24	71
9026	2017-02-27 04:33:41.995994+00	295	f	16	15	74
9027	2017-02-27 04:33:43.529847+00	57	f	34	4	76
9028	2017-02-27 04:33:43.60466+00	9595	f	15	1049	77
9029	2017-02-27 04:33:43.620563+00	0	f	164	2	78
9030	2017-02-27 04:33:43.634171+00	5135	f	18	96	79
9031	2017-02-27 04:33:43.650632+00	0	f	181	0	80
9032	2017-02-27 04:33:45.210423+00	1348	f	21	12	82
9033	2017-02-27 04:33:45.268791+00	171	f	24	7	83
9034	2017-02-27 04:33:45.285142+00	2799	f	22	151	84
9035	2017-02-27 04:33:45.298511+00	2	f	131	1	85
9036	2017-02-27 04:33:45.314989+00	32	f	46	1	86
9037	2017-02-27 04:33:46.773568+00	62	f	35	3	88
9038	2017-02-27 04:33:46.799436+00	21	f	57	3	89
9039	2017-02-27 04:33:46.813851+00	237	f	23	5	90
9040	2017-02-27 04:33:46.829492+00	4504	f	25	290	91
9041	2017-02-27 04:33:48.168017+00	50	f	30	7	93
9042	2017-02-27 04:33:48.237106+00	8	f	71	1	94
9043	2017-02-27 04:33:48.253421+00	25	f	56	42	95
9044	2017-02-27 04:33:48.266873+00	98	f	33	11	96
9045	2017-02-27 04:33:48.283343+00	3	f	118	0	97
9046	2017-02-27 04:33:48.296592+00	6842	f	27	718	98
9047	2017-02-27 04:33:48.306606+00	79	f	29	9	99
9048	2017-02-27 04:43:24.178672+00	10818	f	152	426	1
9049	2017-02-27 04:43:24.263124+00	12807	f	112	366	2
9050	2017-02-27 04:43:24.289446+00	2554	f	132	42	3
9051	2017-02-27 04:43:24.312349+00	19373	f	88	849	4
9052	2017-02-27 04:43:24.336166+00	1897	f	120	189	5
9053	2017-02-27 04:43:24.362287+00	2214	f	109	27	6
9054	2017-02-27 04:43:24.376057+00	1070	f	123	38	7
9055	2017-02-27 04:43:24.402787+00	1310	f	115	30	8
9056	2017-02-27 04:43:24.416153+00	489	f	141	8	9
9057	2017-02-27 04:43:24.432476+00	485	f	128	3	10
9058	2017-02-27 04:43:24.446241+00	258	f	151	12	11
9059	2017-02-27 04:43:24.462473+00	307	f	139	6	12
9060	2017-02-27 04:43:24.476182+00	699	f	105	16	13
9061	2017-02-27 04:43:24.503262+00	98	f	166	10	14
9062	2017-02-27 04:43:24.516421+00	563	f	104	9	15
9063	2017-02-27 04:43:24.529961+00	246	f	127	31	16
9064	2017-02-27 04:43:24.543282+00	67	f	169	3	17
9065	2017-02-27 04:43:26.0186+00	152	f	125	16	20
9066	2017-02-27 04:43:26.216708+00	65	f	156	6	21
9067	2017-02-27 04:43:27.736952+00	30	f	170	9	23
9068	2017-02-27 04:43:27.808964+00	185	f	107	7	24
9069	2017-02-27 04:43:27.835394+00	17	f	178	9	25
9070	2017-02-27 04:43:27.848809+00	28	f	165	2	26
9071	2017-02-27 04:43:27.865276+00	2542	f	4	70	27
9072	2017-02-27 04:43:27.885609+00	408	f	31	4	28
9073	2017-02-27 04:43:27.899264+00	13	f	171	3	29
9074	2017-02-27 04:43:27.918376+00	108	f	98	2	30
9075	2017-02-27 04:43:27.932547+00	29637	t	2	876	31
9076	2017-02-27 04:43:27.945734+00	628	f	10	43	32
9077	2017-02-27 04:43:27.959443+00	511	f	13	38	33
9078	2017-02-27 04:43:27.972321+00	29	f	148	1	34
9079	2017-02-27 04:43:29.662686+00	28	f	133	2	36
9080	2017-02-27 04:43:31.857688+00	9	f	175	1	38
9081	2017-02-27 04:43:31.962388+00	8	f	168	1	39
9082	2017-02-27 04:43:31.98371+00	207	f	20	13	40
9083	2017-02-27 04:43:32.000271+00	36	f	114	2	41
9084	2017-02-27 04:43:32.013327+00	81	f	89	25	42
9085	2017-02-27 04:43:32.026938+00	14350	f	5	850	43
9086	2017-02-27 04:43:32.043528+00	3	f	184	0	44
9087	2017-02-27 04:43:32.056853+00	4	f	176	2	45
9088	2017-02-27 04:43:32.073559+00	6	f	167	2	46
9089	2017-02-27 04:43:32.091387+00	2655	f	6	97	47
9090	2017-02-27 04:43:32.106991+00	4	f	158	6	48
9091	2017-02-27 04:43:32.120153+00	4	f	179	2	49
9092	2017-02-27 04:43:32.13348+00	2531	f	92	163	50
9093	2017-02-27 04:43:32.146646+00	673	f	8	28	51
9094	2017-02-27 04:43:33.491666+00	30	f	100	2	53
9095	2017-02-27 04:43:34.979886+00	22	f	106	0	55
9096	2017-02-27 04:43:36.630141+00	2	f	182	0	57
9097	2017-02-27 04:43:36.703156+00	3027	f	7	231	58
9098	2017-02-27 04:43:36.71953+00	1309	f	9	47	59
9099	2017-02-27 04:43:36.736181+00	5	f	161	2	60
9100	2017-02-27 04:43:36.752861+00	214	f	11	7	61
9101	2017-02-27 04:43:36.769387+00	20	f	99	1	62
9102	2017-02-27 04:43:36.78589+00	10	f	134	7	63
9103	2017-02-27 04:43:36.799341+00	17	f	101	0	64
9104	2017-02-27 04:43:36.812716+00	8	f	126	1	65
9105	2017-02-27 04:43:36.825944+00	14	f	102	1	66
9106	2017-02-27 04:43:38.247389+00	0	f	185	1	68
9107	2017-02-27 04:43:38.320341+00	0	f	183	1	69
9108	2017-02-27 04:43:38.337094+00	82	f	26	5	70
9109	2017-02-27 04:43:38.353719+00	552	f	12	20	71
9110	2017-02-27 04:43:38.369924+00	429	f	14	24	72
9111	2017-02-27 04:43:41.449751+00	301	f	16	15	75
9112	2017-02-27 04:43:42.827217+00	54	f	34	4	77
9113	2017-02-27 04:43:42.899608+00	9595	f	15	1049	78
9114	2017-02-27 04:43:42.916239+00	0	f	164	2	79
9115	2017-02-27 04:43:42.932275+00	5144	f	18	96	80
9116	2017-02-27 04:43:42.945875+00	0	f	181	0	81
9117	2017-02-27 04:43:44.718179+00	1353	f	21	12	83
9118	2017-02-27 04:43:44.801459+00	169	f	24	7	84
9119	2017-02-27 04:43:44.817513+00	2801	f	22	151	85
9120	2017-02-27 04:43:44.831259+00	3	f	131	1	86
9121	2017-02-27 04:43:44.84731+00	30	f	46	1	87
9122	2017-02-27 04:43:46.860378+00	64	f	35	3	89
9123	2017-02-27 04:43:46.927439+00	24	f	57	3	90
9124	2017-02-27 04:43:46.94303+00	235	f	23	5	91
9125	2017-02-27 04:43:46.956965+00	4503	f	25	290	92
9126	2017-02-27 04:43:48.301217+00	49	f	30	7	94
9127	2017-02-27 04:43:48.340999+00	6	f	71	1	95
9128	2017-02-27 04:43:48.38103+00	25	f	56	42	96
9129	2017-02-27 04:43:48.397043+00	98	f	33	11	97
9130	2017-02-27 04:43:48.410964+00	2	f	118	0	98
9131	2017-02-27 04:43:48.426937+00	6848	f	27	718	99
9132	2017-02-27 04:53:24.225355+00	11288	f	152	443	1
9133	2017-02-27 04:53:24.329811+00	12895	f	112	367	2
9134	2017-02-27 04:53:24.341735+00	2618	f	132	42	3
9135	2017-02-27 04:53:24.359278+00	19399	f	88	848	4
9136	2017-02-27 04:53:24.397103+00	1917	f	120	191	5
9137	2017-02-27 04:53:24.41703+00	2224	f	109	27	6
9138	2017-02-27 04:53:24.42688+00	1083	f	123	38	7
9139	2017-02-27 04:53:24.446971+00	1318	f	115	30	8
9140	2017-02-27 04:53:24.457129+00	502	f	141	8	9
9141	2017-02-27 04:53:24.466854+00	495	f	128	3	10
9142	2017-02-27 04:53:24.476723+00	270	f	151	12	11
9143	2017-02-27 04:53:24.486648+00	312	f	139	6	12
9144	2017-02-27 04:53:24.496669+00	706	f	105	16	13
9145	2017-02-27 04:53:24.516708+00	105	f	166	10	14
9146	2017-02-27 04:53:24.527025+00	569	f	104	9	15
9147	2017-02-27 04:53:24.536893+00	247	f	127	31	16
9148	2017-02-27 04:53:24.546711+00	70	f	169	3	17
9149	2017-02-27 04:53:26.023776+00	69	f	156	6	20
9150	2017-02-27 04:53:26.252391+00	153	f	125	16	21
9151	2017-02-27 04:53:27.734622+00	31	f	170	10	23
9152	2017-02-27 04:53:27.838518+00	19	f	178	9	24
9153	2017-02-27 04:53:27.855721+00	186	f	107	7	25
9154	2017-02-27 04:53:27.87574+00	28	f	165	2	26
9155	2017-02-27 04:53:27.885676+00	2539	f	4	70	27
9156	2017-02-27 04:53:27.905938+00	414	f	31	4	28
9157	2017-02-27 04:53:27.915568+00	14	f	171	4	29
9158	2017-02-27 04:53:27.925636+00	110	f	98	2	30
9159	2017-02-27 04:53:27.945706+00	29640	t	2	876	31
9160	2017-02-27 04:53:27.955733+00	632	f	10	43	32
9161	2017-02-27 04:53:27.980194+00	511	f	13	38	33
9162	2017-02-27 04:53:27.99628+00	29	f	148	1	34
9163	2017-02-27 04:53:29.720492+00	5	f	184	0	36
9164	2017-02-27 04:53:29.775498+00	28	f	133	2	37
9165	2017-02-27 04:53:31.522793+00	9	f	168	1	39
9166	2017-02-27 04:53:31.606288+00	9	f	175	1	40
9167	2017-02-27 04:53:31.620089+00	205	f	20	13	41
9168	2017-02-27 04:53:31.640034+00	37	f	114	2	42
9169	2017-02-27 04:53:31.656084+00	87	f	89	25	43
9170	2017-02-27 04:53:31.66987+00	14350	f	5	850	44
9171	2017-02-27 04:53:31.685746+00	4	f	176	2	45
9172	2017-02-27 04:53:31.699764+00	7	f	167	2	46
9173	2017-02-27 04:53:31.715671+00	2655	f	6	97	47
9174	2017-02-27 04:53:31.729746+00	7	f	158	6	48
9175	2017-02-27 04:53:31.739812+00	4	f	179	2	49
9176	2017-02-27 04:53:31.749869+00	2527	f	92	163	50
9177	2017-02-27 04:53:31.765754+00	680	f	8	28	51
9178	2017-02-27 04:53:33.145935+00	28	f	100	3	53
9179	2017-02-27 04:53:33.234721+00	5	f	161	2	54
9180	2017-02-27 04:53:34.746811+00	22	f	106	0	56
9181	2017-02-27 04:53:36.450031+00	0	f	183	3	58
9182	2017-02-27 04:53:36.522462+00	2	f	182	0	59
9183	2017-02-27 04:53:36.53834+00	3034	f	7	231	60
9184	2017-02-27 04:53:36.5528+00	1309	f	9	47	61
9185	2017-02-27 04:53:36.568167+00	215	f	11	7	62
9186	2017-02-27 04:53:36.582798+00	20	f	99	1	63
9187	2017-02-27 04:53:36.598214+00	16	f	101	0	64
9188	2017-02-27 04:53:36.612772+00	9	f	126	1	65
9189	2017-02-27 04:53:36.628186+00	7	f	134	7	66
9190	2017-02-27 04:53:36.64315+00	14	f	102	1	67
9191	2017-02-27 04:53:38.415107+00	0	f	186	0	68
9192	2017-02-27 04:53:41.059116+00	1	f	187	0	69
9193	2017-02-27 04:53:42.92527+00	1	f	188	0	70
9194	2017-02-27 04:53:44.279497+00	0	f	181	0	72
9195	2017-02-27 04:53:44.339738+00	84	f	26	5	73
9196	2017-02-27 04:53:45.849238+00	544	f	12	20	75
9197	2017-02-27 04:53:45.923907+00	430	f	14	24	76
9198	2017-02-27 04:53:47.503055+00	300	f	16	15	78
9199	2017-02-27 04:53:48.95437+00	54	f	34	4	80
9200	2017-02-27 04:53:49.033725+00	9600	f	15	1049	81
9201	2017-02-27 04:53:49.04775+00	0	f	185	3	82
9202	2017-02-27 04:53:49.063411+00	0	f	164	2	83
9203	2017-02-27 04:53:49.077565+00	5142	f	18	96	84
9204	2017-02-27 04:53:50.715007+00	1356	f	21	12	86
9205	2017-02-27 04:53:50.772253+00	170	f	24	7	87
9206	2017-02-27 04:53:50.787989+00	2796	f	22	151	88
9207	2017-02-27 04:53:50.812146+00	1	f	131	1	89
9208	2017-02-27 04:53:50.827674+00	28	f	46	1	90
9209	2017-02-27 04:53:52.358875+00	64	f	35	3	92
9210	2017-02-27 04:53:52.432425+00	25	f	57	3	93
9211	2017-02-27 04:53:52.456567+00	232	f	23	5	94
9212	2017-02-27 04:53:52.47229+00	4506	f	25	290	95
9213	2017-02-27 04:53:52.486169+00	49	f	30	7	96
9214	2017-02-27 04:53:53.695753+00	23	f	56	42	98
9215	2017-02-27 04:53:53.765958+00	7	f	71	1	99
9216	2017-02-27 05:03:24.210974+00	11780	f	152	455	1
9217	2017-02-27 05:03:24.321975+00	12972	f	112	367	2
9218	2017-02-27 05:03:24.337164+00	2677	f	132	42	3
9219	2017-02-27 05:03:24.35838+00	19409	f	88	848	4
9220	2017-02-27 05:03:24.372565+00	1935	f	120	193	5
9221	2017-02-27 05:03:24.388284+00	2247	f	109	27	6
9222	2017-02-27 05:03:24.406861+00	1097	f	123	38	7
9223	2017-02-27 05:03:24.422838+00	1332	f	115	30	8
9224	2017-02-27 05:03:24.438252+00	520	f	141	8	9
9225	2017-02-27 05:03:24.452631+00	496	f	128	3	10
9226	2017-02-27 05:03:24.468009+00	277	f	151	13	11
9227	2017-02-27 05:03:24.482611+00	317	f	139	6	12
9228	2017-02-27 05:03:24.498155+00	713	f	105	16	13
9229	2017-02-27 05:03:24.512658+00	110	f	166	10	14
9230	2017-02-27 05:03:24.528296+00	570	f	104	10	15
9231	2017-02-27 05:03:24.542745+00	250	f	127	32	16
9232	2017-02-27 05:03:24.558315+00	74	f	169	3	17
9233	2017-02-27 05:03:26.000156+00	74	f	156	6	20
9234	2017-02-27 05:03:26.067686+00	155	f	125	16	21
9235	2017-02-27 05:03:27.463176+00	30	f	170	10	23
9236	2017-02-27 05:03:27.693107+00	20	f	178	9	24
9237	2017-02-27 05:03:27.721764+00	189	f	107	7	25
9238	2017-02-27 05:03:27.737573+00	29	f	165	2	26
9239	2017-02-27 05:03:27.751735+00	2540	f	4	70	27
9240	2017-02-27 05:03:27.767798+00	412	f	31	4	28
9241	2017-02-27 05:03:27.782008+00	10	f	184	0	29
9242	2017-02-27 05:03:27.797674+00	15	f	171	4	30
9243	2017-02-27 05:03:27.811958+00	107	f	98	2	31
9244	2017-02-27 05:03:27.827877+00	29638	t	2	876	32
9245	2017-02-27 05:03:27.841932+00	513	f	13	38	33
9246	2017-02-27 05:03:27.857743+00	636	f	10	44	34
9247	2017-02-27 05:03:27.872101+00	32	f	148	1	35
9248	2017-02-27 05:03:29.564343+00	25	f	133	2	37
9249	2017-02-27 05:03:31.245521+00	4	f	187	1	39
9250	2017-02-27 05:03:31.317664+00	10	f	168	1	40
9251	2017-02-27 05:03:31.331397+00	9	f	175	1	41
9252	2017-02-27 05:03:31.347284+00	207	f	20	13	42
9253	2017-02-27 05:03:31.361223+00	38	f	114	2	43
9254	2017-02-27 05:03:31.377153+00	86	f	89	25	44
9255	2017-02-27 05:03:31.391182+00	4	f	176	2	45
9256	2017-02-27 05:03:31.407172+00	14349	f	5	850	46
9257	2017-02-27 05:03:31.421218+00	4	f	167	2	47
9258	2017-02-27 05:03:31.43724+00	2653	f	6	97	48
9259	2017-02-27 05:03:31.451417+00	4	f	161	2	49
9260	2017-02-27 05:03:31.467273+00	2530	f	92	163	50
9261	2017-02-27 05:03:31.481377+00	683	f	8	28	51
9262	2017-02-27 05:03:32.858585+00	23	f	100	3	53
9263	2017-02-27 05:03:32.9427+00	5	f	158	6	54
9264	2017-02-27 05:03:34.435058+00	26	f	106	0	56
9265	2017-02-27 05:03:34.516174+00	3	f	188	0	57
9266	2017-02-27 05:03:37.701312+00	2	f	182	0	60
9267	2017-02-27 05:03:37.774424+00	3026	f	7	231	61
9268	2017-02-27 05:03:37.78836+00	1304	f	9	47	62
9269	2017-02-27 05:03:37.804178+00	2	f	179	2	63
9270	2017-02-27 05:03:37.817773+00	211	f	11	7	64
9271	2017-02-27 05:03:37.83411+00	22	f	99	1	65
9272	2017-02-27 05:03:37.847683+00	18	f	101	0	66
9273	2017-02-27 05:03:37.864119+00	9	f	134	8	67
9274	2017-02-27 05:03:37.888153+00	9	f	126	1	68
9275	2017-02-27 05:03:37.90764+00	13	f	102	1	69
9276	2017-02-27 05:03:39.645425+00	0	f	186	0	71
9277	2017-02-27 05:03:39.712986+00	0	f	185	4	72
9278	2017-02-27 05:03:39.729284+00	82	f	26	5	73
9279	2017-02-27 05:03:39.742725+00	0	f	181	0	74
9280	2017-02-27 05:03:41.452434+00	556	f	12	20	76
9281	2017-02-27 05:03:41.477381+00	427	f	14	24	77
9282	2017-02-27 05:03:42.912453+00	299	f	16	15	79
9283	2017-02-27 05:03:44.296384+00	55	f	34	4	81
9284	2017-02-27 05:03:44.365109+00	2	f	131	1	82
9285	2017-02-27 05:03:44.381299+00	9602	f	15	1049	83
9286	2017-02-27 05:03:44.394263+00	0	f	164	2	84
9287	2017-02-27 05:03:44.404217+00	0	f	183	6	85
9288	2017-02-27 05:03:44.414528+00	5140	f	18	96	86
9289	2017-02-27 05:03:46.222614+00	1356	f	21	12	88
9290	2017-02-27 05:03:46.279346+00	33	f	46	1	89
9291	2017-02-27 05:03:46.296301+00	171	f	24	7	90
9292	2017-02-27 05:03:46.309238+00	2799	f	22	152	91
9293	2017-02-27 05:03:47.93052+00	68	f	35	3	93
9294	2017-02-27 05:03:47.994891+00	23	f	57	3	94
9295	2017-02-27 05:03:48.01398+00	235	f	23	5	95
9296	2017-02-27 05:03:48.023769+00	54	f	30	7	96
9297	2017-02-27 05:03:48.03367+00	4502	f	25	290	97
9298	2017-02-27 05:03:49.315936+00	28	f	56	42	99
9299	2017-02-27 05:13:24.456398+00	12174	f	152	464	1
9300	2017-02-27 05:13:24.517269+00	13042	f	112	368	2
9301	2017-02-27 05:13:24.534475+00	2744	f	132	43	3
9302	2017-02-27 05:13:24.546966+00	19431	f	88	848	4
9303	2017-02-27 05:13:24.556881+00	1960	f	120	194	5
9304	2017-02-27 05:13:24.566891+00	2271	f	109	27	6
9305	2017-02-27 05:13:24.576882+00	1118	f	123	38	7
9306	2017-02-27 05:13:24.597555+00	1341	f	115	30	8
9307	2017-02-27 05:13:24.607521+00	526	f	141	8	9
9308	2017-02-27 05:13:24.627388+00	503	f	128	3	10
9309	2017-02-27 05:13:24.637267+00	288	f	151	13	11
9310	2017-02-27 05:13:24.647308+00	323	f	139	6	12
9311	2017-02-27 05:13:24.65728+00	723	f	105	16	13
9312	2017-02-27 05:13:24.677347+00	112	f	166	10	14
9313	2017-02-27 05:13:24.687413+00	573	f	104	10	15
9314	2017-02-27 05:13:24.697308+00	260	f	127	32	16
9315	2017-02-27 05:13:24.707214+00	77	f	169	3	17
9316	2017-02-27 05:13:26.156281+00	75	f	156	6	20
9317	2017-02-27 05:13:26.23568+00	157	f	125	16	21
9318	2017-02-27 05:13:26.251683+00	24	f	178	9	22
9319	2017-02-27 05:13:27.636414+00	33	f	170	10	24
9320	2017-02-27 05:13:27.705924+00	195	f	107	8	25
9321	2017-02-27 05:13:27.735516+00	30	f	165	2	26
9322	2017-02-27 05:13:27.74543+00	12	f	184	0	27
9323	2017-02-27 05:13:27.755432+00	2546	f	4	70	28
9324	2017-02-27 05:13:27.775512+00	416	f	31	4	29
9325	2017-02-27 05:13:27.785513+00	16	f	171	4	30
9326	2017-02-27 05:13:27.805743+00	108	f	98	2	31
9327	2017-02-27 05:13:27.815729+00	7	f	187	1	32
9328	2017-02-27 05:13:27.835949+00	35	f	148	1	33
9329	2017-02-27 05:13:29.553288+00	29634	t	2	876	35
9330	2017-02-27 05:13:29.650851+00	515	f	13	38	36
9331	2017-02-27 05:13:29.663858+00	640	f	10	44	37
9332	2017-02-27 05:13:29.690737+00	8	f	176	2	38
9333	2017-02-27 05:13:29.700631+00	32	f	133	2	39
9334	2017-02-27 05:13:29.710466+00	10	f	168	1	40
9335	2017-02-27 05:13:29.720399+00	9	f	175	1	41
9336	2017-02-27 05:13:32.093398+00	9	f	167	2	43
9337	2017-02-27 05:13:32.164646+00	204	f	20	13	44
9338	2017-02-27 05:13:32.200142+00	42	f	114	2	45
9339	2017-02-27 05:13:32.216738+00	86	f	89	25	46
9340	2017-02-27 05:13:32.229943+00	14347	f	5	850	47
9341	2017-02-27 05:13:33.55599+00	2	f	186	0	49
9342	2017-02-27 05:13:33.639113+00	4	f	188	0	50
9343	2017-02-27 05:13:33.661955+00	2655	f	6	97	51
9344	2017-02-27 05:13:33.673829+00	2532	f	92	163	52
9345	2017-02-27 05:13:33.683551+00	683	f	8	28	53
9346	2017-02-27 05:13:35.177524+00	30	f	100	3	55
9347	2017-02-27 05:13:35.275195+00	24	f	106	0	56
9348	2017-02-27 05:13:35.288486+00	5	f	161	2	57
9349	2017-02-27 05:13:36.716052+00	7	f	134	8	59
9350	2017-02-27 05:13:39.683393+00	6	f	158	6	62
9351	2017-02-27 05:13:39.750043+00	2	f	182	0	63
9352	2017-02-27 05:13:39.765914+00	3029	f	7	231	64
9353	2017-02-27 05:13:39.779641+00	1311	f	9	47	65
9354	2017-02-27 05:13:39.795749+00	3	f	179	3	66
9355	2017-02-27 05:13:39.809521+00	215	f	11	7	67
9356	2017-02-27 05:13:39.819497+00	20	f	99	1	68
9357	2017-02-27 05:13:39.829329+00	17	f	101	0	69
9358	2017-02-27 05:13:39.839299+00	9	f	126	1	70
9359	2017-02-27 05:13:39.849265+00	15	f	102	1	71
9360	2017-02-27 05:13:41.498928+00	0	f	185	4	73
9361	2017-02-27 05:13:41.564657+00	0	f	183	9	74
9362	2017-02-27 05:13:41.580849+00	82	f	26	5	75
9363	2017-02-27 05:13:41.594422+00	0	f	181	0	76
9364	2017-02-27 05:13:43.143207+00	550	f	12	20	78
9365	2017-02-27 05:13:43.213795+00	426	f	14	24	79
9366	2017-02-27 05:13:45.918043+00	302	f	16	15	81
9367	2017-02-27 05:13:47.29358+00	56	f	34	4	83
9368	2017-02-27 05:13:47.345423+00	1	f	131	1	84
9369	2017-02-27 05:13:47.359619+00	9602	f	15	1051	85
9370	2017-02-27 05:13:47.375144+00	1	f	164	2	86
9371	2017-02-27 05:13:48.954887+00	5139	f	18	96	88
9372	2017-02-27 05:13:49.013896+00	1349	f	21	12	89
9373	2017-02-27 05:13:49.029386+00	4	f	118	0	90
9374	2017-02-27 05:13:49.044183+00	29	f	46	1	91
9375	2017-02-27 05:13:49.059461+00	170	f	24	7	92
9376	2017-02-27 05:13:49.073923+00	2796	f	22	152	93
9377	2017-02-27 05:13:50.648956+00	64	f	35	3	95
9378	2017-02-27 05:13:50.739595+00	20	f	57	3	96
9379	2017-02-27 05:13:50.754631+00	237	f	23	5	97
9380	2017-02-27 05:13:50.768967+00	54	f	30	7	98
9381	2017-02-27 05:13:50.784562+00	4509	f	25	290	99
9382	2017-02-27 05:23:24.979407+00	12655	f	152	483	1
9383	2017-02-27 05:23:25.049912+00	13130	f	112	370	2
9384	2017-02-27 05:23:25.06228+00	2797	f	132	43	3
9385	2017-02-27 05:23:25.072423+00	19448	f	88	849	4
9386	2017-02-27 05:23:25.092239+00	1980	f	120	195	5
9387	2017-02-27 05:23:25.102296+00	2288	f	109	27	6
9388	2017-02-27 05:23:25.113264+00	1134	f	123	38	7
9389	2017-02-27 05:23:25.142619+00	1359	f	115	30	8
9390	2017-02-27 05:23:25.152886+00	538	f	141	8	9
9391	2017-02-27 05:23:25.162821+00	517	f	128	3	10
9392	2017-02-27 05:23:25.172722+00	290	f	151	13	11
9393	2017-02-27 05:23:25.182831+00	324	f	139	6	12
9394	2017-02-27 05:23:25.192808+00	721	f	105	16	13
9395	2017-02-27 05:23:25.202842+00	121	f	166	10	14
9396	2017-02-27 05:23:25.21296+00	576	f	104	10	15
9397	2017-02-27 05:23:25.222891+00	86	f	169	4	16
9398	2017-02-27 05:23:25.232893+00	261	f	127	32	17
9399	2017-02-27 05:23:26.73318+00	77	f	156	7	20
9400	2017-02-27 05:23:26.787779+00	155	f	125	16	21
9401	2017-02-27 05:23:28.149926+00	24	f	178	9	23
9402	2017-02-27 05:23:28.241435+00	36	f	170	11	24
9403	2017-02-27 05:23:28.250892+00	190	f	107	8	25
9404	2017-02-27 05:23:28.260842+00	34	f	165	2	26
9405	2017-02-27 05:23:29.566029+00	14	f	184	1	28
9406	2017-02-27 05:23:29.655289+00	2539	f	4	70	29
9407	2017-02-27 05:23:29.672286+00	422	f	31	4	30
9408	2017-02-27 05:23:29.684918+00	17	f	171	4	31
9409	2017-02-27 05:23:29.694887+00	109	f	98	2	32
9410	2017-02-27 05:23:29.704837+00	7	f	187	1	33
9411	2017-02-27 05:23:29.714839+00	31	f	148	1	34
9412	2017-02-27 05:23:31.382787+00	29634	t	2	876	36
9413	2017-02-27 05:23:31.45739+00	517	f	13	38	37
9414	2017-02-27 05:23:31.469683+00	638	f	10	44	38
9415	2017-02-27 05:23:31.487876+00	7	f	176	2	39
9416	2017-02-27 05:23:31.500096+00	31	f	133	2	40
9417	2017-02-27 05:23:33.872332+00	5	f	189	0	41
9418	2017-02-27 05:23:33.887113+00	9	f	168	1	42
9419	2017-02-27 05:23:33.896836+00	9	f	167	3	43
9420	2017-02-27 05:23:35.610316+00	9	f	175	1	45
9421	2017-02-27 05:23:35.711877+00	3	f	183	12	46
9422	2017-02-27 05:23:35.721623+00	40	f	114	2	47
9423	2017-02-27 05:23:35.731534+00	204	f	20	13	48
9424	2017-02-27 05:23:35.741472+00	88	f	89	25	49
9425	2017-02-27 05:23:37.362518+00	14345	f	5	850	51
9426	2017-02-27 05:23:37.43639+00	2648	f	6	97	52
9427	2017-02-27 05:23:37.446136+00	2527	f	92	163	53
9428	2017-02-27 05:23:37.456425+00	677	f	8	28	54
9429	2017-02-27 05:23:38.789027+00	29	f	100	3	56
9430	2017-02-27 05:23:38.8983+00	7	f	161	2	57
9431	2017-02-27 05:23:40.342442+00	21	f	106	0	59
9432	2017-02-27 05:23:40.414365+00	1	f	186	1	60
9433	2017-02-27 05:23:40.424142+00	3	f	188	0	61
9434	2017-02-27 05:23:42.092803+00	12	f	134	7	63
9435	2017-02-27 05:23:42.148783+00	3033	f	7	231	64
9436	2017-02-27 05:23:42.158723+00	1304	f	9	47	65
9437	2017-02-27 05:23:42.16862+00	2	f	179	3	66
9438	2017-02-27 05:23:42.178587+00	214	f	11	7	67
9439	2017-02-27 05:23:42.188461+00	22	f	99	1	68
9440	2017-02-27 05:23:42.198374+00	20	f	101	0	69
9441	2017-02-27 05:23:42.208325+00	4	f	158	6	70
9442	2017-02-27 05:23:42.218351+00	8	f	126	1	71
9443	2017-02-27 05:23:42.228385+00	16	f	102	1	72
9444	2017-02-27 05:23:44.141611+00	1	f	190	0	73
9445	2017-02-27 05:23:45.715702+00	1	f	191	0	74
9446	2017-02-27 05:23:47.710955+00	1	f	192	0	75
9447	2017-02-27 05:23:50.694115+00	0	f	185	4	78
9448	2017-02-27 05:23:50.761523+00	0	f	182	0	79
9449	2017-02-27 05:23:50.778612+00	85	f	26	5	80
9450	2017-02-27 05:23:52.338848+00	544	f	12	20	82
9451	2017-02-27 05:23:52.40553+00	427	f	14	24	83
9452	2017-02-27 05:23:53.997616+00	296	f	16	15	85
9453	2017-02-27 05:23:55.371076+00	56	f	34	4	87
9454	2017-02-27 05:23:55.453845+00	2	f	131	1	88
9455	2017-02-27 05:23:55.47077+00	9597	f	15	1051	89
9456	2017-02-27 05:23:55.483478+00	1	f	164	2	90
9457	2017-02-27 05:23:57.029823+00	5135	f	18	96	92
9458	2017-02-27 05:23:57.055069+00	0	f	181	0	93
9459	2017-02-27 05:23:57.067867+00	1356	f	21	12	94
9460	2017-02-27 05:23:57.077764+00	174	f	24	7	95
9461	2017-02-27 05:23:57.087781+00	5	f	118	0	96
9462	2017-02-27 05:23:57.097598+00	32	f	46	1	97
9463	2017-02-27 05:23:57.107701+00	2795	f	22	152	98
9464	2017-02-27 05:33:25.34182+00	13064	f	152	500	1
9465	2017-02-27 05:33:25.427915+00	13200	f	112	371	2
9466	2017-02-27 05:33:25.440115+00	2841	f	132	45	3
9467	2017-02-27 05:33:25.456724+00	19458	f	88	849	4
9468	2017-02-27 05:33:25.4701+00	2007	f	120	197	5
9469	2017-02-27 05:33:25.480101+00	2303	f	109	27	6
9470	2017-02-27 05:33:25.490157+00	1143	f	123	38	7
9471	2017-02-27 05:33:25.500406+00	1366	f	115	30	8
9472	2017-02-27 05:33:25.516983+00	546	f	141	9	9
9473	2017-02-27 05:33:25.530276+00	525	f	128	3	10
9474	2017-02-27 05:33:25.540231+00	295	f	151	13	11
9475	2017-02-27 05:33:25.550294+00	334	f	139	6	12
9476	2017-02-27 05:33:25.560314+00	727	f	105	16	13
9477	2017-02-27 05:33:25.589325+00	122	f	166	10	14
9478	2017-02-27 05:33:25.609303+00	573	f	104	10	15
9479	2017-02-27 05:33:25.6193+00	86	f	169	4	16
9480	2017-02-27 05:33:25.629204+00	256	f	127	33	17
9481	2017-02-27 05:33:27.168458+00	78	f	156	10	20
9482	2017-02-27 05:33:27.242618+00	153	f	125	16	21
9483	2017-02-27 05:33:27.253819+00	38	f	170	11	22
9484	2017-02-27 05:33:28.908497+00	25	f	178	9	24
9485	2017-02-27 05:33:28.977044+00	196	f	107	8	25
9486	2017-02-27 05:33:28.997973+00	34	f	165	2	26
9487	2017-02-27 05:33:29.00799+00	15	f	184	1	27
9488	2017-02-27 05:33:30.386029+00	2546	f	4	71	29
9489	2017-02-27 05:33:30.432485+00	417	f	31	4	30
9490	2017-02-27 05:33:30.462946+00	16	f	171	5	31
9491	2017-02-27 05:33:30.478873+00	8	f	183	13	32
9492	2017-02-27 05:33:30.49258+00	110	f	98	2	33
9493	2017-02-27 05:33:30.522473+00	32	f	148	1	34
9494	2017-02-27 05:33:32.308961+00	7	f	189	0	36
9495	2017-02-27 05:33:32.386237+00	29633	t	2	876	37
9496	2017-02-27 05:33:32.397578+00	512	f	13	38	38
9497	2017-02-27 05:33:32.413569+00	635	f	10	44	39
9498	2017-02-27 05:33:32.437428+00	7	f	176	2	40
9499	2017-02-27 05:33:34.450794+00	6	f	193	1	41
9500	2017-02-27 05:33:36.435908+00	6	f	194	1	42
9501	2017-02-27 05:33:36.447636+00	34	f	133	2	43
9502	2017-02-27 05:33:36.457536+00	5	f	187	1	44
9503	2017-02-27 05:33:36.467579+00	9	f	168	1	45
9504	2017-02-27 05:33:36.483609+00	10	f	167	3	46
9505	2017-02-27 05:33:38.270474+00	5	f	188	0	48
9506	2017-02-27 05:33:38.3926+00	9	f	175	1	49
9507	2017-02-27 05:33:38.409314+00	39	f	114	2	50
9508	2017-02-27 05:33:38.423613+00	4	f	192	0	51
9509	2017-02-27 05:33:38.439021+00	204	f	20	13	52
9510	2017-02-27 05:33:38.46332+00	88	f	89	25	53
9511	2017-02-27 05:33:39.895178+00	14343	f	5	850	55
9512	2017-02-27 05:33:41.273061+00	2656	f	6	97	57
9513	2017-02-27 05:33:41.346649+00	7	f	161	2	58
9514	2017-02-27 05:33:41.360851+00	3	f	179	3	59
9515	2017-02-27 05:33:41.376392+00	2532	f	92	163	60
9516	2017-02-27 05:33:41.398343+00	678	f	8	28	61
9517	2017-02-27 05:33:42.723602+00	30	f	100	3	63
9518	2017-02-27 05:33:44.707555+00	2	f	195	0	64
9519	2017-02-27 05:33:44.720039+00	2	f	190	0	65
9520	2017-02-27 05:33:46.008447+00	23	f	106	0	67
9521	2017-02-27 05:33:48.105584+00	7	f	158	6	69
9522	2017-02-27 05:33:48.199118+00	11	f	134	7	70
9523	2017-02-27 05:33:48.213894+00	3035	f	7	231	71
9524	2017-02-27 05:33:48.228765+00	20	f	99	1	72
9525	2017-02-27 05:33:48.243751+00	1305	f	9	47	73
9526	2017-02-27 05:33:48.258602+00	216	f	11	7	74
9527	2017-02-27 05:33:48.274134+00	18	f	101	0	75
9528	2017-02-27 05:33:48.288738+00	9	f	126	1	76
9529	2017-02-27 05:33:48.308816+00	14	f	102	1	77
9530	2017-02-27 05:33:50.221889+00	1	f	196	0	78
9531	2017-02-27 05:33:50.234152+00	1	f	191	0	79
9532	2017-02-27 05:33:50.248851+00	0	f	186	2	80
9533	2017-02-27 05:33:50.2638+00	0	f	182	0	81
9534	2017-02-27 05:33:50.278716+00	82	f	26	5	82
9535	2017-02-27 05:33:51.869094+00	552	f	12	20	84
9536	2017-02-27 05:33:51.903229+00	431	f	14	24	85
9537	2017-02-27 05:33:53.44066+00	298	f	16	15	87
9538	2017-02-27 05:33:54.773702+00	58	f	34	4	89
9539	2017-02-27 05:33:54.846574+00	1	f	131	1	90
9540	2017-02-27 05:33:54.861193+00	9597	f	15	1051	91
9541	2017-02-27 05:33:56.444361+00	0	f	164	2	93
9542	2017-02-27 05:33:56.524928+00	1	f	162	8	94
9543	2017-02-27 05:33:58.069438+00	5143	f	18	96	96
9544	2017-02-27 05:33:58.254759+00	0	f	181	0	97
9545	2017-02-27 05:33:58.283515+00	1353	f	21	12	98
9546	2017-02-27 05:33:58.314962+00	173	f	24	7	99
9547	2017-02-27 05:43:25.569773+00	13483	f	152	512	1
9548	2017-02-27 05:43:25.658411+00	13274	f	112	373	2
9549	2017-02-27 05:43:25.675859+00	2907	f	132	46	3
9550	2017-02-27 05:43:25.707941+00	19472	f	88	849	4
9551	2017-02-27 05:43:25.720371+00	2033	f	120	197	5
9552	2017-02-27 05:43:25.737084+00	2322	f	109	27	6
9553	2017-02-27 05:43:25.750359+00	1162	f	123	38	7
9554	2017-02-27 05:43:25.767153+00	1377	f	115	30	8
9555	2017-02-27 05:43:25.780375+00	565	f	141	9	9
9556	2017-02-27 05:43:25.79039+00	535	f	128	3	10
9557	2017-02-27 05:43:25.800369+00	308	f	151	13	11
9558	2017-02-27 05:43:25.810394+00	338	f	139	6	12
9559	2017-02-27 05:43:25.820323+00	127	f	166	10	13
9560	2017-02-27 05:43:25.830425+00	738	f	105	16	14
9561	2017-02-27 05:43:25.84041+00	93	f	169	4	15
9562	2017-02-27 05:43:25.859005+00	590	f	104	10	16
9563	2017-02-27 05:43:25.870543+00	265	f	127	33	17
9564	2017-02-27 05:43:27.34448+00	80	f	156	10	20
9565	2017-02-27 05:43:27.415216+00	156	f	125	16	21
9566	2017-02-27 05:43:27.432043+00	23	f	178	9	22
9567	2017-02-27 05:43:27.444883+00	39	f	170	11	23
9568	2017-02-27 05:43:28.789047+00	195	f	107	8	25
9569	2017-02-27 05:43:28.81595+00	18	f	184	1	26
9570	2017-02-27 05:43:30.243603+00	30	f	165	2	28
9571	2017-02-27 05:43:30.312974+00	15	f	183	14	29
9572	2017-02-27 05:43:30.329532+00	20	f	171	5	30
9573	2017-02-27 05:43:30.342515+00	2544	f	4	71	31
9574	2017-02-27 05:43:30.398488+00	423	f	31	4	32
9575	2017-02-27 05:43:30.412557+00	8	f	193	1	33
9576	2017-02-27 05:43:30.42261+00	38	f	148	1	34
9577	2017-02-27 05:43:30.432561+00	114	f	98	2	35
9578	2017-02-27 05:43:32.414312+00	10	f	176	2	37
9579	2017-02-27 05:43:32.488387+00	7	f	189	0	38
9580	2017-02-27 05:43:32.505417+00	29636	t	2	876	39
9581	2017-02-27 05:43:32.518008+00	513	f	13	38	40
9582	2017-02-27 05:43:32.528031+00	636	f	10	46	41
9583	2017-02-27 05:43:32.537991+00	6	f	194	1	42
9584	2017-02-27 05:43:32.547987+00	37	f	133	2	43
9585	2017-02-27 05:43:32.557981+00	12	f	167	3	44
9586	2017-02-27 05:43:32.567952+00	5	f	187	1	45
9587	2017-02-27 05:43:32.578055+00	10	f	168	1	46
9588	2017-02-27 05:43:35.575885+00	9	f	175	1	49
9589	2017-02-27 05:43:35.703028+00	41	f	114	2	50
9590	2017-02-27 05:43:35.716169+00	204	f	20	13	51
9591	2017-02-27 05:43:35.726177+00	86	f	89	25	52
9592	2017-02-27 05:43:35.736146+00	5	f	188	0	53
9593	2017-02-27 05:43:35.746114+00	14351	f	5	850	54
9594	2017-02-27 05:43:35.756274+00	3	f	195	0	55
9595	2017-02-27 05:43:35.766064+00	2	f	192	0	56
9596	2017-02-27 05:43:37.059943+00	2650	f	6	97	58
9597	2017-02-27 05:43:37.21041+00	8	f	161	2	59
9598	2017-02-27 05:43:37.220127+00	2	f	179	3	60
9599	2017-02-27 05:43:37.229983+00	2528	f	92	163	61
9600	2017-02-27 05:43:37.239943+00	678	f	8	28	62
9601	2017-02-27 05:43:38.528343+00	27	f	100	3	64
9602	2017-02-27 05:43:38.603736+00	2	f	190	0	65
9603	2017-02-27 05:43:40.022463+00	24	f	106	0	67
9604	2017-02-27 05:43:41.664063+00	11	f	134	7	69
9605	2017-02-27 05:43:41.721739+00	3029	f	7	231	70
9606	2017-02-27 05:43:41.731595+00	24	f	99	1	71
9607	2017-02-27 05:43:41.741434+00	1313	f	9	47	72
9608	2017-02-27 05:43:41.751443+00	212	f	11	7	73
9609	2017-02-27 05:43:41.761345+00	19	f	101	0	74
9610	2017-02-27 05:43:41.771348+00	2	f	158	6	75
9611	2017-02-27 05:43:41.781226+00	9	f	126	1	76
9612	2017-02-27 05:43:41.791249+00	14	f	102	1	77
9613	2017-02-27 05:43:43.684373+00	1	f	197	0	78
9614	2017-02-27 05:43:46.150738+00	1	f	198	0	79
9615	2017-02-27 05:43:47.925345+00	1	f	199	0	80
9616	2017-02-27 05:43:47.937477+00	0	f	196	0	81
9617	2017-02-27 05:43:47.947321+00	1	f	191	0	82
9618	2017-02-27 05:43:47.957193+00	0	f	186	2	83
9619	2017-02-27 05:43:47.967171+00	0	f	182	0	84
9620	2017-02-27 05:43:47.977179+00	79	f	26	5	85
9621	2017-02-27 05:43:54.385743+00	552	f	12	20	87
9622	2017-02-27 05:43:54.453837+00	430	f	14	24	88
9623	2017-02-27 05:43:56.233188+00	299	f	16	15	90
9624	2017-02-27 05:43:57.623831+00	56	f	34	4	92
9625	2017-02-27 05:43:59.541571+00	0	f	200	0	93
9626	2017-02-27 05:43:59.606053+00	3	f	131	1	94
9627	2017-02-27 05:43:59.629915+00	9596	f	15	1051	95
9628	2017-02-27 05:44:01.183783+00	0	f	164	2	97
9629	2017-02-27 05:44:01.257953+00	0	f	162	8	98
9630	2017-02-27 05:53:25.643835+00	13875	f	152	528	1
9631	2017-02-27 05:53:25.712594+00	13341	f	112	373	2
9632	2017-02-27 05:53:25.72977+00	2966	f	132	47	3
9633	2017-02-27 05:53:25.742276+00	19478	f	88	849	4
9634	2017-02-27 05:53:25.752438+00	2059	f	120	198	5
9635	2017-02-27 05:53:25.773332+00	2331	f	109	27	6
9636	2017-02-27 05:53:25.783374+00	1163	f	123	38	7
9637	2017-02-27 05:53:25.803485+00	1387	f	115	30	8
9638	2017-02-27 05:53:25.840943+00	572	f	141	9	9
9639	2017-02-27 05:53:25.884383+00	540	f	128	3	10
9640	2017-02-27 05:53:25.924286+00	306	f	151	13	11
9641	2017-02-27 05:53:25.934189+00	340	f	139	6	12
9642	2017-02-27 05:53:25.944141+00	137	f	166	10	13
9643	2017-02-27 05:53:25.954027+00	743	f	105	16	14
9644	2017-02-27 05:53:25.964272+00	100	f	169	4	15
9645	2017-02-27 05:53:25.974161+00	585	f	104	10	16
9646	2017-02-27 05:53:25.9842+00	264	f	127	33	17
9647	2017-02-27 05:53:27.519804+00	81	f	156	10	20
9648	2017-02-27 05:53:27.588819+00	31	f	178	9	21
9649	2017-02-27 05:53:27.605667+00	154	f	125	16	22
9650	2017-02-27 05:53:27.618473+00	40	f	170	11	23
9651	2017-02-27 05:53:28.94239+00	22	f	184	1	25
9652	2017-02-27 05:53:29.042866+00	192	f	107	9	26
9653	2017-02-27 05:53:30.405562+00	35	f	165	2	28
9654	2017-02-27 05:53:30.433853+00	13	f	183	16	29
9655	2017-02-27 05:53:30.446603+00	20	f	171	5	30
9656	2017-02-27 05:53:30.467348+00	2552	f	4	71	31
9657	2017-02-27 05:53:30.494702+00	9	f	193	3	32
9658	2017-02-27 05:53:30.506033+00	426	f	31	4	33
9659	2017-02-27 05:53:30.526599+00	42	f	148	1	34
9660	2017-02-27 05:53:30.53646+00	11	f	176	2	35
9661	2017-02-27 05:53:30.546537+00	113	f	98	2	36
9662	2017-02-27 05:53:32.815131+00	7	f	194	2	38
9663	2017-02-27 05:53:32.883521+00	515	f	13	38	39
9664	2017-02-27 05:53:32.89322+00	29640	t	2	876	40
9665	2017-02-27 05:53:32.903153+00	640	f	10	48	41
9666	2017-02-27 05:53:32.913284+00	12	f	168	1	42
9667	2017-02-27 05:53:32.923065+00	36	f	133	2	43
9668	2017-02-27 05:53:32.933036+00	14	f	167	3	44
9669	2017-02-27 05:53:32.943137+00	6	f	189	1	45
9670	2017-02-27 05:53:32.95302+00	4	f	187	1	46
9671	2017-02-27 05:53:36.048343+00	10	f	175	1	49
9672	2017-02-27 05:53:36.191654+00	42	f	114	2	50
9673	2017-02-27 05:53:36.219423+00	203	f	20	13	51
9674	2017-02-27 05:53:36.231883+00	88	f	89	25	52
9675	2017-02-27 05:53:36.241808+00	4	f	188	0	53
9676	2017-02-27 05:53:37.879164+00	14349	f	5	850	55
9677	2017-02-27 05:53:37.936887+00	3	f	197	0	56
9678	2017-02-27 05:53:37.946353+00	4	f	190	0	57
9679	2017-02-27 05:53:37.956292+00	2	f	192	1	58
9680	2017-02-27 05:53:37.966229+00	2659	f	6	97	59
9681	2017-02-27 05:53:37.976175+00	4	f	161	2	60
9682	2017-02-27 05:53:37.98618+00	4	f	179	3	61
9683	2017-02-27 05:53:37.996167+00	2535	f	92	163	62
9684	2017-02-27 05:53:39.859414+00	2	f	201	0	63
9685	2017-02-27 05:53:39.880023+00	678	f	8	28	64
9686	2017-02-27 05:53:41.398163+00	28	f	100	3	66
9687	2017-02-27 05:53:41.423646+00	2	f	199	0	67
9688	2017-02-27 05:53:41.433546+00	2	f	195	1	68
9689	2017-02-27 05:53:41.443553+00	3	f	191	0	69
9690	2017-02-27 05:53:42.856225+00	24	f	106	0	71
9691	2017-02-27 05:53:44.645806+00	8	f	134	7	73
9692	2017-02-27 05:53:44.719549+00	3036	f	7	231	74
9693	2017-02-27 05:53:44.732317+00	22	f	99	1	75
9694	2017-02-27 05:53:44.742216+00	1306	f	9	47	76
9695	2017-02-27 05:53:44.75207+00	217	f	11	7	77
9696	2017-02-27 05:53:44.761973+00	19	f	101	0	78
9697	2017-02-27 05:53:44.771981+00	1	f	158	6	79
9698	2017-02-27 05:53:44.781903+00	9	f	126	1	80
9699	2017-02-27 05:53:44.791927+00	14	f	102	1	81
9700	2017-02-27 05:53:48.536782+00	1	f	202	0	83
9701	2017-02-27 05:53:51.214012+00	0	f	203	0	84
9702	2017-02-27 05:53:52.95778+00	0	f	204	0	85
9703	2017-02-27 05:53:54.712313+00	0	f	205	0	86
9704	2017-02-27 05:53:54.727396+00	0	f	198	0	87
9705	2017-02-27 05:53:54.737162+00	0	f	200	1	88
9706	2017-02-27 05:53:54.747214+00	0	f	186	3	89
9707	2017-02-27 05:53:54.757108+00	0	f	182	0	90
9708	2017-02-27 05:53:54.767069+00	80	f	26	5	91
9709	2017-02-27 05:53:56.307106+00	546	f	12	20	93
9710	2017-02-27 05:53:56.37895+00	432	f	14	24	94
9711	2017-02-27 05:53:57.986006+00	297	f	16	15	96
9712	2017-02-27 05:54:01.542881+00	0	f	206	1	98
9713	2017-02-27 05:54:01.555559+00	58	f	34	4	99
9714	2017-02-27 06:03:26.126756+00	14224	f	152	539	1
9715	2017-02-27 06:03:26.216401+00	13403	f	112	375	2
9716	2017-02-27 06:03:26.231562+00	3012	f	132	47	3
9717	2017-02-27 06:03:26.248096+00	19480	f	88	849	4
9718	2017-02-27 06:03:26.261543+00	2072	f	120	200	5
9719	2017-02-27 06:03:26.278279+00	2350	f	109	28	6
9720	2017-02-27 06:03:26.291921+00	1178	f	123	38	7
9721	2017-02-27 06:03:26.308383+00	1394	f	115	30	8
9722	2017-02-27 06:03:26.321725+00	582	f	141	10	9
9723	2017-02-27 06:03:26.3384+00	551	f	128	3	10
9724	2017-02-27 06:03:26.351853+00	319	f	151	14	11
9725	2017-02-27 06:03:26.366139+00	352	f	139	6	12
9726	2017-02-27 06:03:26.381869+00	141	f	166	10	13
9727	2017-02-27 06:03:26.398479+00	743	f	105	16	14
9728	2017-02-27 06:03:26.412096+00	102	f	169	4	15
9729	2017-02-27 06:03:26.426298+00	594	f	104	10	16
9730	2017-02-27 06:03:26.442+00	268	f	127	33	17
9731	2017-02-27 06:03:27.93679+00	76	f	156	10	20
9732	2017-02-27 06:03:28.166713+00	31	f	178	9	21
9733	2017-02-27 06:03:28.193614+00	157	f	125	16	22
9734	2017-02-27 06:03:28.207035+00	40	f	170	11	23
9735	2017-02-27 06:03:29.662344+00	23	f	184	1	25
9736	2017-02-27 06:03:29.731411+00	197	f	107	9	26
9737	2017-02-27 06:03:31.269226+00	30	f	165	2	28
9738	2017-02-27 06:03:31.362211+00	15	f	183	16	29
9739	2017-02-27 06:03:31.375592+00	13	f	193	3	30
9740	2017-02-27 06:03:31.391772+00	21	f	171	5	31
9741	2017-02-27 06:03:31.40541+00	2553	f	4	71	32
9742	2017-02-27 06:03:31.456195+00	425	f	31	4	33
9743	2017-02-27 06:03:31.467951+00	39	f	148	1	34
9744	2017-02-27 06:03:31.483465+00	11	f	176	2	35
9745	2017-02-27 06:03:31.497752+00	108	f	98	2	36
9746	2017-02-27 06:03:33.186372+00	7	f	194	2	38
9747	2017-02-27 06:03:33.250637+00	520	f	13	38	39
9748	2017-02-27 06:03:33.26261+00	29641	t	2	876	40
9749	2017-02-27 06:03:33.283694+00	631	f	10	48	41
9750	2017-02-27 06:03:33.300414+00	12	f	168	1	42
9751	2017-02-27 06:03:33.312234+00	36	f	133	2	43
9752	2017-02-27 06:03:33.328272+00	13	f	167	4	44
9753	2017-02-27 06:03:33.342071+00	4	f	187	1	45
9754	2017-02-27 06:03:33.352024+00	5	f	189	1	46
9755	2017-02-27 06:03:35.116022+00	6	f	188	0	48
9756	2017-02-27 06:03:37.241519+00	3	f	207	0	49
9757	2017-02-27 06:03:37.271327+00	4	f	201	0	50
9758	2017-02-27 06:03:37.282653+00	11	f	175	1	51
9759	2017-02-27 06:03:37.298747+00	4	f	197	0	52
9760	2017-02-27 06:03:37.313017+00	43	f	114	2	53
9761	2017-02-27 06:03:37.328931+00	206	f	20	13	54
9762	2017-02-27 06:03:37.342799+00	90	f	89	25	55
9763	2017-02-27 06:03:39.936402+00	14354	f	5	850	58
9764	2017-02-27 06:03:40.007893+00	4	f	190	0	59
9765	2017-02-27 06:03:40.019779+00	2651	f	6	97	60
9766	2017-02-27 06:03:40.036305+00	5	f	161	2	61
9767	2017-02-27 06:03:40.049677+00	4	f	179	3	62
9768	2017-02-27 06:03:40.065961+00	2533	f	92	163	63
9769	2017-02-27 06:03:42.2213+00	1	f	208	1	64
9770	2017-02-27 06:03:42.266892+00	687	f	8	28	65
9771	2017-02-27 06:03:43.652284+00	30	f	100	3	67
9772	2017-02-27 06:03:43.717254+00	2	f	199	0	68
9773	2017-02-27 06:03:43.737179+00	2	f	195	1	69
9774	2017-02-27 06:03:45.14161+00	1	f	192	1	71
9775	2017-02-27 06:03:45.211677+00	24	f	106	0	72
9776	2017-02-27 06:03:46.814114+00	3033	f	7	231	74
9777	2017-02-27 06:03:46.885657+00	21	f	99	1	75
9778	2017-02-27 06:03:46.897005+00	1309	f	9	47	76
9779	2017-02-27 06:03:46.906992+00	220	f	11	7	77
9780	2017-02-27 06:03:46.916909+00	8	f	134	7	78
9781	2017-02-27 06:03:46.926922+00	20	f	101	0	79
9782	2017-02-27 06:03:46.936829+00	0	f	158	6	80
9783	2017-02-27 06:03:46.946843+00	9	f	126	1	81
9784	2017-02-27 06:03:48.838053+00	0	f	209	0	82
9785	2017-02-27 06:03:48.852302+00	17	f	102	1	83
9786	2017-02-27 06:03:50.33826+00	0	f	202	0	85
9787	2017-02-27 06:03:50.410761+00	0	f	203	0	86
9788	2017-02-27 06:03:50.426424+00	1	f	204	0	87
9789	2017-02-27 06:03:50.436023+00	0	f	205	1	88
9790	2017-02-27 06:03:50.445992+00	0	f	198	0	89
9791	2017-02-27 06:03:50.455973+00	1	f	191	0	90
9792	2017-02-27 06:03:50.465986+00	0	f	182	0	91
9793	2017-02-27 06:03:50.475914+00	79	f	26	5	92
9794	2017-02-27 06:03:51.869531+00	547	f	12	21	94
9795	2017-02-27 06:03:51.940198+00	429	f	14	24	95
9796	2017-02-27 06:03:53.373915+00	300	f	16	15	97
9797	2017-02-27 06:03:54.743948+00	52	f	34	4	99
9798	2017-02-27 06:13:26.062492+00	14559	f	152	550	1
9799	2017-02-27 06:13:26.148503+00	13476	f	112	375	2
9800	2017-02-27 06:13:26.159153+00	3064	f	132	51	3
9801	2017-02-27 06:13:26.168968+00	19495	f	88	849	4
9802	2017-02-27 06:13:26.179102+00	2092	f	120	201	5
9803	2017-02-27 06:13:26.226236+00	2354	f	109	28	6
9804	2017-02-27 06:13:26.24972+00	1191	f	123	39	7
9805	2017-02-27 06:13:26.288106+00	1402	f	115	30	8
9806	2017-02-27 06:13:26.30219+00	592	f	141	10	9
9807	2017-02-27 06:13:26.318145+00	323	f	151	15	10
9808	2017-02-27 06:13:26.332025+00	566	f	128	3	11
9809	2017-02-27 06:13:26.34794+00	356	f	139	6	12
9810	2017-02-27 06:13:26.361991+00	146	f	166	10	13
9811	2017-02-27 06:13:26.377931+00	748	f	105	16	14
9812	2017-02-27 06:13:26.392134+00	108	f	169	4	15
9813	2017-02-27 06:13:26.408099+00	597	f	104	10	16
9814	2017-02-27 06:13:26.422255+00	268	f	127	33	17
9815	2017-02-27 06:13:28.137714+00	79	f	156	10	20
9816	2017-02-27 06:13:28.203408+00	32	f	178	10	21
9817	2017-02-27 06:13:28.217374+00	158	f	125	16	22
9818	2017-02-27 06:13:28.232967+00	39	f	170	11	23
9819	2017-02-27 06:13:29.67974+00	23	f	184	1	25
9820	2017-02-27 06:13:31.099332+00	17	f	193	3	27
9821	2017-02-27 06:13:31.195975+00	197	f	107	9	28
9822	2017-02-27 06:13:31.210588+00	17	f	183	19	29
9823	2017-02-27 06:13:31.224981+00	34	f	165	2	30
9824	2017-02-27 06:13:31.240405+00	24	f	171	5	31
9825	2017-02-27 06:13:31.255012+00	2548	f	4	71	32
9826	2017-02-27 06:13:31.270552+00	425	f	31	4	33
9827	2017-02-27 06:13:31.29069+00	39	f	148	1	34
9828	2017-02-27 06:13:31.305164+00	11	f	176	2	35
9829	2017-02-27 06:13:31.320526+00	116	f	98	2	36
9830	2017-02-27 06:13:31.340569+00	7	f	201	0	37
9831	2017-02-27 06:13:32.934479+00	7	f	194	2	39
9832	2017-02-27 06:13:33.021666+00	514	f	13	38	40
9833	2017-02-27 06:13:33.04031+00	29643	t	2	876	41
9834	2017-02-27 06:13:33.055467+00	635	f	10	48	42
9835	2017-02-27 06:13:33.075533+00	12	f	168	1	43
9836	2017-02-27 06:13:33.090127+00	6	f	197	0	44
9837	2017-02-27 06:13:33.105333+00	36	f	133	2	45
9838	2017-02-27 06:13:33.120076+00	15	f	167	4	46
9839	2017-02-27 06:13:33.135322+00	6	f	187	1	47
9840	2017-02-27 06:13:34.676669+00	6	f	188	0	49
9841	2017-02-27 06:13:34.750283+00	3	f	207	0	50
9842	2017-02-27 06:13:34.841099+00	10	f	175	1	51
9843	2017-02-27 06:13:34.86024+00	40	f	114	2	52
9844	2017-02-27 06:13:34.874891+00	4	f	189	1	53
9845	2017-02-27 06:13:34.890361+00	208	f	20	13	54
9846	2017-02-27 06:13:34.910008+00	86	f	89	25	55
9847	2017-02-27 06:13:36.201447+00	14349	f	5	850	57
9848	2017-02-27 06:13:36.299519+00	2	f	208	3	58
9849	2017-02-27 06:13:36.313952+00	2	f	205	1	59
9850	2017-02-27 06:13:36.328797+00	4	f	190	0	60
9851	2017-02-27 06:13:37.789145+00	2657	f	6	97	62
9852	2017-02-27 06:13:39.620133+00	0	f	210	0	63
9853	2017-02-27 06:13:39.63556+00	6	f	161	2	64
9854	2017-02-27 06:13:39.648727+00	4	f	179	3	65
9855	2017-02-27 06:13:39.665268+00	2533	f	92	163	66
9856	2017-02-27 06:13:39.678571+00	1	f	202	0	67
9857	2017-02-27 06:13:39.698526+00	685	f	8	28	68
9858	2017-02-27 06:13:41.00116+00	30	f	100	3	70
9859	2017-02-27 06:13:42.354469+00	26	f	106	0	72
9860	2017-02-27 06:13:44.122325+00	3029	f	7	231	74
9861	2017-02-27 06:13:44.190884+00	21	f	99	1	75
9862	2017-02-27 06:13:44.207264+00	1308	f	9	47	76
9863	2017-02-27 06:13:44.220574+00	215	f	11	7	77
9864	2017-02-27 06:13:44.237338+00	8	f	134	7	78
9865	2017-02-27 06:13:44.250572+00	16	f	101	0	79
9866	2017-02-27 06:13:44.260503+00	2	f	158	6	80
9867	2017-02-27 06:13:44.28056+00	9	f	126	1	81
9868	2017-02-27 06:13:46.203781+00	1	f	211	0	82
9869	2017-02-27 06:13:49.06129+00	0	f	212	0	83
9870	2017-02-27 06:13:49.073711+00	0	f	209	0	84
9871	2017-02-27 06:13:49.08984+00	16	f	102	1	85
9872	2017-02-27 06:13:50.652593+00	1	f	203	0	87
9873	2017-02-27 06:13:50.724384+00	0	f	204	0	88
9874	2017-02-27 06:13:50.737314+00	0	f	198	0	89
9875	2017-02-27 06:13:50.747315+00	0	f	195	1	90
9876	2017-02-27 06:13:50.757547+00	0	f	191	0	91
9877	2017-02-27 06:13:50.767374+00	0	f	192	1	92
9878	2017-02-27 06:13:50.777566+00	0	f	182	0	93
9879	2017-02-27 06:13:50.787425+00	80	f	26	5	94
9880	2017-02-27 06:13:52.186858+00	547	f	12	21	96
9881	2017-02-27 06:13:52.24704+00	434	f	14	24	97
9882	2017-02-27 06:13:53.852214+00	298	f	16	15	99
9883	2017-02-27 06:23:25.932187+00	14877	f	152	567	1
9884	2017-02-27 06:23:26.145851+00	13535	f	112	376	2
9885	2017-02-27 06:23:26.254141+00	3126	f	132	52	3
9886	2017-02-27 06:23:26.266512+00	19505	f	88	851	4
9887	2017-02-27 06:23:26.282289+00	2108	f	120	201	5
9888	2017-02-27 06:23:26.296676+00	2364	f	109	28	6
9889	2017-02-27 06:23:26.31221+00	1197	f	123	39	7
9890	2017-02-27 06:23:26.326463+00	1413	f	115	30	8
9891	2017-02-27 06:23:26.342173+00	596	f	141	10	9
9892	2017-02-27 06:23:26.356523+00	331	f	151	15	10
9893	2017-02-27 06:23:26.372239+00	565	f	128	3	11
9894	2017-02-27 06:23:26.386575+00	157	f	166	10	12
9895	2017-02-27 06:23:26.396343+00	361	f	139	6	13
9896	2017-02-27 06:23:26.406485+00	748	f	105	16	14
9897	2017-02-27 06:23:26.438961+00	104	f	169	4	15
9898	2017-02-27 06:23:26.453916+00	597	f	104	10	16
9899	2017-02-27 06:23:26.468687+00	271	f	127	33	17
9900	2017-02-27 06:23:27.961112+00	78	f	156	10	20
9901	2017-02-27 06:23:28.030649+00	33	f	178	10	21
9902	2017-02-27 06:23:28.04395+00	43	f	170	11	22
9903	2017-02-27 06:23:28.060493+00	156	f	125	16	23
9904	2017-02-27 06:23:29.444707+00	24	f	184	1	25
9905	2017-02-27 06:23:29.585533+00	18	f	193	3	26
9906	2017-02-27 06:23:30.943017+00	16	f	183	21	28
9907	2017-02-27 06:23:30.970992+00	197	f	107	9	29
9908	2017-02-27 06:23:30.986058+00	34	f	165	2	30
9909	2017-02-27 06:23:31.000648+00	22	f	171	5	31
9910	2017-02-27 06:23:31.01606+00	2548	f	4	71	32
9911	2017-02-27 06:23:31.030724+00	428	f	31	4	33
9912	2017-02-27 06:23:31.046115+00	8	f	201	0	34
9913	2017-02-27 06:23:31.060759+00	8	f	197	0	35
9914	2017-02-27 06:23:31.076146+00	38	f	148	1	36
9915	2017-02-27 06:23:31.090817+00	11	f	176	2	37
9916	2017-02-27 06:23:31.106184+00	6	f	207	0	38
9917	2017-02-27 06:23:31.120855+00	114	f	98	2	39
9918	2017-02-27 06:23:32.754157+00	7	f	194	2	41
9919	2017-02-27 06:23:32.823399+00	523	f	13	38	42
9920	2017-02-27 06:23:32.835858+00	29642	t	2	876	43
9921	2017-02-27 06:23:32.851365+00	638	f	10	48	44
9922	2017-02-27 06:23:32.911269+00	11	f	168	1	45
9923	2017-02-27 06:23:32.930094+00	38	f	133	2	46
9924	2017-02-27 06:23:32.940353+00	13	f	167	4	47
9925	2017-02-27 06:23:32.950397+00	4	f	187	1	48
9926	2017-02-27 06:23:32.96035+00	6	f	188	0	49
9927	2017-02-27 06:23:34.584239+00	7	f	175	1	51
9928	2017-02-27 06:23:34.665442+00	3	f	205	2	52
9929	2017-02-27 06:23:34.675205+00	41	f	114	2	53
9930	2017-02-27 06:23:34.68513+00	5	f	190	0	54
9931	2017-02-27 06:23:34.695019+00	204	f	20	13	55
9932	2017-02-27 06:23:34.720274+00	84	f	89	25	56
9933	2017-02-27 06:23:36.093558+00	14353	f	5	850	58
9934	2017-02-27 06:23:36.207134+00	2	f	208	3	59
9935	2017-02-27 06:23:36.238587+00	3	f	189	1	60
9936	2017-02-27 06:23:37.649179+00	2658	f	6	97	62
9937	2017-02-27 06:23:37.713405+00	6	f	161	2	63
9938	2017-02-27 06:23:37.72333+00	4	f	179	3	64
9939	2017-02-27 06:23:37.733245+00	2532	f	92	163	65
9940	2017-02-27 06:23:37.743204+00	1	f	202	0	66
9941	2017-02-27 06:23:37.805068+00	685	f	8	28	67
9942	2017-02-27 06:23:39.195514+00	28	f	100	3	69
9943	2017-02-27 06:23:40.545438+00	26	f	106	0	71
9944	2017-02-27 06:23:42.297365+00	9	f	134	7	73
9945	2017-02-27 06:23:42.374715+00	3039	f	7	231	74
9946	2017-02-27 06:23:42.507178+00	1312	f	9	47	75
9947	2017-02-27 06:23:42.534547+00	218	f	11	7	76
9948	2017-02-27 06:23:42.545663+00	21	f	99	1	77
9949	2017-02-27 06:23:42.556006+00	16	f	101	0	78
9950	2017-02-27 06:23:42.565701+00	5	f	158	6	79
9951	2017-02-27 06:23:42.57553+00	11	f	126	1	80
9952	2017-02-27 06:23:44.438751+00	0	f	213	0	81
9953	2017-02-27 06:23:46.305184+00	1	f	214	0	82
9954	2017-02-27 06:23:46.325854+00	0	f	210	0	83
9955	2017-02-27 06:23:46.335499+00	1	f	211	0	84
9956	2017-02-27 06:23:46.345547+00	1	f	212	0	85
9957	2017-02-27 06:23:46.355568+00	0	f	209	0	86
9958	2017-02-27 06:23:46.365596+00	14	f	102	1	87
9959	2017-02-27 06:23:46.375617+00	0	f	203	0	88
9960	2017-02-27 06:23:46.385493+00	0	f	204	0	89
9961	2017-02-27 06:23:46.395546+00	0	f	198	0	90
9962	2017-02-27 06:23:46.405588+00	0	f	195	1	91
9963	2017-02-27 06:23:46.415604+00	0	f	182	0	92
9964	2017-02-27 06:23:46.425621+00	84	f	26	5	93
9965	2017-02-27 06:23:47.828026+00	549	f	12	21	95
9966	2017-02-27 06:23:47.900099+00	432	f	14	24	96
9967	2017-02-27 06:23:49.493255+00	297	f	16	15	98
9968	2017-02-27 06:33:26.058404+00	15142	f	152	584	1
9969	2017-02-27 06:33:26.125389+00	13603	f	112	377	2
9970	2017-02-27 06:33:26.14529+00	3177	f	132	53	3
9971	2017-02-27 06:33:26.160102+00	19514	f	88	851	4
9972	2017-02-27 06:33:26.175155+00	2132	f	120	201	5
9973	2017-02-27 06:33:26.264761+00	2383	f	109	28	6
9974	2017-02-27 06:33:26.301168+00	1208	f	123	40	7
9975	2017-02-27 06:33:26.325909+00	1422	f	115	30	8
9976	2017-02-27 06:33:26.340938+00	609	f	141	11	9
9977	2017-02-27 06:33:26.366328+00	336	f	151	15	10
9978	2017-02-27 06:33:26.381232+00	576	f	128	3	11
9979	2017-02-27 06:33:26.396053+00	163	f	166	10	12
9980	2017-02-27 06:33:26.421147+00	363	f	139	6	13
9981	2017-02-27 06:33:26.435879+00	754	f	105	16	14
9982	2017-02-27 06:33:26.461147+00	114	f	169	5	15
9983	2017-02-27 06:33:26.490172+00	609	f	104	10	16
9984	2017-02-27 06:33:26.52123+00	275	f	127	33	17
9985	2017-02-27 06:33:28.045861+00	79	f	156	10	20
9986	2017-02-27 06:33:28.135193+00	31	f	178	10	21
9987	2017-02-27 06:33:28.150739+00	158	f	125	16	22
9988	2017-02-27 06:33:28.165787+00	41	f	170	11	23
9989	2017-02-27 06:33:28.180499+00	25	f	184	1	24
9990	2017-02-27 06:33:30.959025+00	21	f	183	23	27
9991	2017-02-27 06:33:31.052666+00	18	f	193	3	28
9992	2017-02-27 06:33:31.118503+00	200	f	107	9	29
9993	2017-02-27 06:33:31.143787+00	32	f	165	2	30
9994	2017-02-27 06:33:31.158213+00	20	f	171	5	31
9995	2017-02-27 06:33:31.17356+00	11	f	201	1	32
9996	2017-02-27 06:33:31.188135+00	9	f	207	0	33
9997	2017-02-27 06:33:31.203547+00	10	f	197	0	34
9998	2017-02-27 06:33:31.218202+00	2549	f	4	71	35
9999	2017-02-27 06:33:31.233774+00	431	f	31	4	36
10000	2017-02-27 06:33:31.24827+00	41	f	148	1	37
10001	2017-02-27 06:33:31.263779+00	12	f	176	2	38
10002	2017-02-27 06:33:31.278316+00	114	f	98	2	39
10003	2017-02-27 06:33:31.293903+00	7	f	187	1	40
10004	2017-02-27 06:33:31.30839+00	7	f	188	0	41
10005	2017-02-27 06:33:32.948327+00	518	f	13	38	43
10006	2017-02-27 06:33:33.01758+00	29651	t	2	876	44
10007	2017-02-27 06:33:33.033302+00	642	f	10	48	45
10008	2017-02-27 06:33:33.048766+00	6	f	205	2	46
10009	2017-02-27 06:33:33.063196+00	12	f	168	1	47
10010	2017-02-27 06:33:33.078778+00	38	f	133	2	48
10011	2017-02-27 06:33:33.093165+00	12	f	167	4	49
10012	2017-02-27 06:33:33.108721+00	6	f	194	2	50
10013	2017-02-27 06:33:33.123207+00	4	f	208	4	51
10014	2017-02-27 06:33:33.138847+00	6	f	190	0	52
10015	2017-02-27 06:33:34.762999+00	8	f	175	1	54
10016	2017-02-27 06:33:34.848487+00	41	f	114	2	55
10017	2017-02-27 06:33:34.863734+00	4	f	189	1	56
10018	2017-02-27 06:33:34.877912+00	206	f	20	13	57
10019	2017-02-27 06:33:34.903591+00	87	f	89	25	58
10020	2017-02-27 06:33:37.833882+00	3	f	211	0	61
10021	2017-02-27 06:33:37.85535+00	14351	f	5	850	62
10022	2017-02-27 06:33:37.871316+00	2652	f	6	97	63
10023	2017-02-27 06:33:37.885343+00	2	f	213	1	64
10024	2017-02-27 06:33:37.901351+00	2	f	212	0	65
10025	2017-02-27 06:33:37.915461+00	4	f	161	2	66
10026	2017-02-27 06:33:37.941629+00	2	f	179	3	67
10027	2017-02-27 06:33:37.955902+00	2530	f	92	163	68
10028	2017-02-27 06:33:37.971713+00	1	f	202	0	69
10029	2017-02-27 06:33:37.985708+00	676	f	8	28	70
10030	2017-02-27 06:33:39.264645+00	26	f	100	3	72
10031	2017-02-27 06:33:40.842191+00	24	f	106	0	74
10032	2017-02-27 06:33:42.476421+00	3029	f	7	231	76
10033	2017-02-27 06:33:42.501397+00	1307	f	9	47	77
10034	2017-02-27 06:33:42.517204+00	216	f	11	7	78
10035	2017-02-27 06:33:42.533827+00	20	f	99	1	79
10036	2017-02-27 06:33:42.553407+00	11	f	134	7	80
10037	2017-02-27 06:33:42.567049+00	19	f	101	0	81
10038	2017-02-27 06:33:42.581124+00	6	f	158	6	82
10039	2017-02-27 06:33:42.597194+00	10	f	126	1	83
10040	2017-02-27 06:33:44.921433+00	1	f	215	0	84
10041	2017-02-27 06:33:47.432027+00	1	f	216	0	85
10042	2017-02-27 06:33:47.572337+00	0	f	214	0	86
10043	2017-02-27 06:33:47.634762+00	15	f	102	1	87
10044	2017-02-27 06:33:48.931787+00	1	f	203	0	89
10045	2017-02-27 06:33:49.004325+00	0	f	204	0	90
10046	2017-02-27 06:33:49.020908+00	0	f	198	0	91
10047	2017-02-27 06:33:49.033983+00	1	f	195	1	92
10048	2017-02-27 06:33:49.194357+00	0	f	191	0	93
10049	2017-02-27 06:33:49.208227+00	0	f	182	0	94
10050	2017-02-27 06:33:49.224021+00	82	f	26	5	95
10051	2017-02-27 06:33:50.725677+00	551	f	12	21	97
10052	2017-02-27 06:33:50.748155+00	423	f	14	24	98
10053	2017-02-27 06:43:26.927294+00	15410	f	152	591	1
10054	2017-02-27 06:43:27.000726+00	13645	f	112	378	2
10055	2017-02-27 06:43:27.020531+00	3217	f	132	54	3
10056	2017-02-27 06:43:27.040471+00	19523	f	88	851	4
10057	2017-02-27 06:43:27.109019+00	2159	f	120	201	5
10058	2017-02-27 06:43:27.132434+00	2389	f	109	28	6
10059	2017-02-27 06:43:27.148843+00	1224	f	123	40	7
10060	2017-02-27 06:43:27.162457+00	1424	f	115	30	8
10061	2017-02-27 06:43:27.178617+00	611	f	141	11	9
10062	2017-02-27 06:43:27.192247+00	343	f	151	15	10
10063	2017-02-27 06:43:27.208654+00	573	f	128	3	11
10064	2017-02-27 06:43:27.22239+00	169	f	166	10	12
10065	2017-02-27 06:43:27.238827+00	369	f	139	6	13
10066	2017-02-27 06:43:27.252465+00	756	f	105	16	14
10067	2017-02-27 06:43:27.287058+00	117	f	169	5	15
10068	2017-02-27 06:43:27.302491+00	608	f	104	10	16
10069	2017-02-27 06:43:27.316949+00	280	f	127	33	17
10070	2017-02-27 06:43:28.796117+00	82	f	156	10	20
10071	2017-02-27 06:43:28.8717+00	31	f	178	11	21
10072	2017-02-27 06:43:28.893727+00	40	f	170	11	22
10073	2017-02-27 06:43:28.913597+00	156	f	125	16	23
10074	2017-02-27 06:43:28.926785+00	26	f	184	1	24
10075	2017-02-27 06:43:32.781482+00	19	f	193	3	27
10076	2017-02-27 06:43:32.853962+00	22	f	183	24	28
10077	2017-02-27 06:43:32.866799+00	204	f	107	9	29
10078	2017-02-27 06:43:32.88389+00	14	f	197	0	30
10079	2017-02-27 06:43:32.896717+00	34	f	165	2	31
10080	2017-02-27 06:43:32.911303+00	13	f	201	2	32
10081	2017-02-27 06:43:32.926846+00	13	f	207	0	33
10082	2017-02-27 06:43:32.941324+00	22	f	171	5	34
10083	2017-02-27 06:43:32.956831+00	10	f	205	2	35
10084	2017-02-27 06:43:32.971469+00	2553	f	4	71	36
10085	2017-02-27 06:43:33.035251+00	430	f	31	4	37
10086	2017-02-27 06:43:33.045126+00	7	f	208	4	38
10087	2017-02-27 06:43:33.055104+00	39	f	148	1	39
10088	2017-02-27 06:43:33.064986+00	12	f	176	2	40
10089	2017-02-27 06:43:33.075048+00	113	f	98	2	41
10090	2017-02-27 06:43:33.085079+00	7	f	187	1	42
10091	2017-02-27 06:43:33.095144+00	9	f	188	0	43
10092	2017-02-27 06:43:33.105132+00	7	f	194	2	44
10093	2017-02-27 06:43:34.811224+00	519	f	13	38	46
10094	2017-02-27 06:43:34.880587+00	29653	t	2	876	47
10095	2017-02-27 06:43:34.890283+00	636	f	10	48	48
10096	2017-02-27 06:43:34.89996+00	14	f	168	1	49
10097	2017-02-27 06:43:34.909867+00	35	f	133	2	50
10098	2017-02-27 06:43:34.919818+00	11	f	167	4	51
10099	2017-02-27 06:43:34.929717+00	6	f	190	0	52
10100	2017-02-27 06:43:34.945583+00	4	f	213	2	53
10101	2017-02-27 06:43:34.960004+00	4	f	211	0	54
10102	2017-02-27 06:43:36.502996+00	9	f	175	1	56
10103	2017-02-27 06:43:36.707587+00	39	f	114	2	57
10104	2017-02-27 06:43:36.733768+00	4	f	189	1	58
10105	2017-02-27 06:43:36.74457+00	210	f	20	13	59
10106	2017-02-27 06:43:36.754671+00	86	f	89	25	60
10107	2017-02-27 06:43:38.078459+00	14353	f	5	850	62
10108	2017-02-27 06:43:38.148704+00	3	f	179	3	63
10109	2017-02-27 06:43:39.871791+00	2	f	215	0	65
10110	2017-02-27 06:43:39.943209+00	2651	f	6	97	66
10111	2017-02-27 06:43:39.95342+00	6	f	161	2	67
10112	2017-02-27 06:43:39.973392+00	2538	f	92	163	68
10113	2017-02-27 06:43:39.982969+00	683	f	8	28	69
10114	2017-02-27 06:43:41.378596+00	30	f	100	3	71
10115	2017-02-27 06:43:42.983316+00	25	f	106	0	73
10116	2017-02-27 06:43:44.600213+00	3030	f	7	231	75
10117	2017-02-27 06:43:44.673574+00	1310	f	9	47	76
10118	2017-02-27 06:43:44.684906+00	218	f	11	7	77
10119	2017-02-27 06:43:44.695144+00	23	f	99	1	78
10120	2017-02-27 06:43:44.704888+00	17	f	101	0	79
10121	2017-02-27 06:43:44.714796+00	5	f	158	6	80
10122	2017-02-27 06:43:44.745484+00	8	f	126	1	81
10123	2017-02-27 06:43:44.761427+00	5	f	134	7	82
10124	2017-02-27 06:43:46.775003+00	0	f	217	0	83
10125	2017-02-27 06:43:46.791237+00	2	f	164	2	84
10126	2017-02-27 06:43:46.806838+00	0	f	216	0	85
10127	2017-02-27 06:43:46.820789+00	0	f	214	0	86
10128	2017-02-27 06:43:46.836798+00	0	f	212	0	87
10129	2017-02-27 06:43:46.850803+00	17	f	102	1	88
10130	2017-02-27 06:43:46.860455+00	0	f	202	0	89
10131	2017-02-27 06:43:46.870545+00	1	f	203	0	90
10132	2017-02-27 06:43:46.880502+00	1	f	204	0	91
10133	2017-02-27 06:43:46.890509+00	0	f	198	0	92
10134	2017-02-27 06:43:46.900475+00	1	f	195	1	93
10135	2017-02-27 06:43:46.9105+00	0	f	191	0	94
10136	2017-02-27 06:43:46.920433+00	0	f	182	0	95
10137	2017-02-27 06:43:46.940635+00	79	f	26	5	96
10138	2017-02-27 06:43:48.494647+00	554	f	12	21	98
10139	2017-02-27 06:43:48.580103+00	428	f	14	24	99
10140	2017-02-27 06:53:26.850216+00	15669	f	152	599	1
10141	2017-02-27 06:53:26.961107+00	13695	f	112	378	2
10142	2017-02-27 06:53:26.973385+00	3251	f	132	55	3
10143	2017-02-27 06:53:26.988909+00	19540	f	88	854	4
10144	2017-02-27 06:53:27.003299+00	2168	f	120	201	5
10145	2017-02-27 06:53:27.044154+00	2414	f	109	28	6
10146	2017-02-27 06:53:27.055301+00	1231	f	123	40	7
10147	2017-02-27 06:53:27.065167+00	1427	f	115	30	8
10148	2017-02-27 06:53:27.075135+00	621	f	141	11	9
10149	2017-02-27 06:53:27.084999+00	348	f	151	15	10
10150	2017-02-27 06:53:27.094985+00	577	f	128	3	11
10151	2017-02-27 06:53:27.105037+00	171	f	166	10	12
10152	2017-02-27 06:53:27.125119+00	373	f	139	6	13
10153	2017-02-27 06:53:27.134998+00	762	f	105	17	14
10154	2017-02-27 06:53:27.153653+00	123	f	169	6	15
10155	2017-02-27 06:53:27.205065+00	605	f	104	10	16
10156	2017-02-27 06:53:27.215764+00	280	f	127	33	17
10157	2017-02-27 06:53:28.710501+00	37	f	178	11	20
10158	2017-02-27 06:53:28.788655+00	79	f	156	11	21
10159	2017-02-27 06:53:28.809837+00	43	f	170	12	22
10160	2017-02-27 06:53:28.81954+00	163	f	125	16	23
10161	2017-02-27 06:53:28.829513+00	25	f	184	1	24
10162	2017-02-27 06:53:31.487121+00	19	f	193	3	27
10163	2017-02-27 06:53:31.706495+00	15	f	197	0	28
10164	2017-02-27 06:53:31.71739+00	21	f	183	24	29
10165	2017-02-27 06:53:31.727391+00	201	f	107	9	30
10166	2017-02-27 06:53:31.737345+00	33	f	165	2	31
10167	2017-02-27 06:53:31.747619+00	12	f	207	0	32
10168	2017-02-27 06:53:31.757167+00	12	f	201	2	33
10169	2017-02-27 06:53:31.767367+00	12	f	205	2	34
10170	2017-02-27 06:53:31.777132+00	22	f	171	5	35
10171	2017-02-27 06:53:31.787216+00	2548	f	4	71	36
10172	2017-02-27 06:53:31.817185+00	8	f	208	4	37
10173	2017-02-27 06:53:31.832725+00	430	f	31	4	38
10174	2017-02-27 06:53:31.847242+00	40	f	148	1	39
10175	2017-02-27 06:53:31.862549+00	12	f	176	2	40
10176	2017-02-27 06:53:31.88707+00	9	f	188	0	41
10177	2017-02-27 06:53:31.902753+00	112	f	98	2	42
10178	2017-02-27 06:53:31.916806+00	7	f	187	1	43
10179	2017-02-27 06:53:31.932613+00	6	f	194	2	44
10180	2017-02-27 06:53:33.712725+00	6	f	211	0	46
10181	2017-02-27 06:53:33.7926+00	522	f	13	38	47
10182	2017-02-27 06:53:33.807905+00	29643	t	2	876	48
10183	2017-02-27 06:53:33.82195+00	639	f	10	48	49
10184	2017-02-27 06:53:33.841884+00	11	f	168	1	50
10185	2017-02-27 06:53:33.857597+00	34	f	133	2	51
10186	2017-02-27 06:53:33.871962+00	11	f	167	4	52
10187	2017-02-27 06:53:33.887863+00	6	f	190	0	53
10188	2017-02-27 06:53:35.429597+00	9	f	175	1	55
10189	2017-02-27 06:53:35.496715+00	43	f	114	2	56
10190	2017-02-27 06:53:35.512528+00	5	f	189	1	57
10191	2017-02-27 06:53:35.526588+00	203	f	20	13	58
10192	2017-02-27 06:53:35.546594+00	88	f	89	25	59
10193	2017-02-27 06:53:35.562317+00	3	f	215	0	60
10194	2017-02-27 06:53:35.576484+00	3	f	213	2	61
10195	2017-02-27 06:53:36.917605+00	14354	f	5	850	63
10196	2017-02-27 06:53:37.00036+00	6	f	179	3	64
10197	2017-02-27 06:53:38.837348+00	1	f	217	0	66
10198	2017-02-27 06:53:38.955281+00	2	f	216	0	67
10199	2017-02-27 06:53:38.971814+00	2655	f	6	97	68
10200	2017-02-27 06:53:38.985626+00	5	f	161	2	69
10201	2017-02-27 06:53:39.001527+00	2528	f	92	163	70
10202	2017-02-27 06:53:39.015714+00	679	f	8	28	71
10203	2017-02-27 06:53:39.035724+00	2	f	204	1	72
10204	2017-02-27 06:53:40.368024+00	28	f	100	3	74
10205	2017-02-27 06:53:41.865907+00	27	f	106	0	76
10206	2017-02-27 06:53:43.587829+00	3027	f	7	231	78
10207	2017-02-27 06:53:43.648271+00	1310	f	9	47	79
10208	2017-02-27 06:53:43.663974+00	216	f	11	7	80
10209	2017-02-27 06:53:43.678047+00	23	f	99	1	81
10210	2017-02-27 06:53:43.693868+00	18	f	101	0	82
10211	2017-02-27 06:53:45.51138+00	1	f	218	0	83
10212	2017-02-27 06:53:47.353266+00	1	f	219	0	84
10213	2017-02-27 06:53:47.369713+00	6	f	158	6	85
10214	2017-02-27 06:53:47.385554+00	11	f	126	1	86
10215	2017-02-27 06:53:47.3994+00	3	f	164	2	87
10216	2017-02-27 06:53:47.415433+00	0	f	214	0	88
10217	2017-02-27 06:53:47.429358+00	0	f	210	1	89
10218	2017-02-27 06:53:47.445238+00	1	f	212	0	90
10219	2017-02-27 06:53:47.459161+00	15	f	102	1	91
10220	2017-02-27 06:53:47.469125+00	0	f	202	0	92
10221	2017-02-27 06:53:47.479298+00	1	f	203	0	93
10222	2017-02-27 06:53:47.495246+00	10	f	134	7	94
10223	2017-02-27 06:53:47.509224+00	1	f	198	0	95
10224	2017-02-27 06:53:47.519273+00	1	f	195	1	96
10225	2017-02-27 06:53:47.529245+00	0	f	191	0	97
10226	2017-02-27 06:53:47.539306+00	0	f	182	0	98
10227	2017-02-27 06:53:47.549639+00	82	f	26	5	99
10228	2017-02-27 07:03:27.610151+00	15901	f	152	615	1
10229	2017-02-27 07:03:27.686875+00	13741	f	112	378	2
10230	2017-02-27 07:03:27.717115+00	3307	f	132	56	3
10231	2017-02-27 07:03:27.7272+00	19545	f	88	854	4
10232	2017-02-27 07:03:27.747093+00	2178	f	120	204	5
10233	2017-02-27 07:03:27.757132+00	2430	f	109	28	6
10234	2017-02-27 07:03:27.777038+00	1253	f	123	39	7
10235	2017-02-27 07:03:27.786959+00	1432	f	115	30	8
10236	2017-02-27 07:03:27.796857+00	638	f	141	11	9
10237	2017-02-27 07:03:27.807326+00	356	f	151	15	10
10238	2017-02-27 07:03:27.816821+00	590	f	128	3	11
10239	2017-02-27 07:03:27.826869+00	175	f	166	10	12
10240	2017-02-27 07:03:27.83689+00	383	f	139	6	13
10241	2017-02-27 07:03:27.846971+00	126	f	169	6	14
10242	2017-02-27 07:03:27.856912+00	771	f	105	17	15
10243	2017-02-27 07:03:27.913254+00	606	f	104	10	16
10244	2017-02-27 07:03:27.932125+00	282	f	127	33	17
10245	2017-02-27 07:03:30.459198+00	36	f	178	11	20
10246	2017-02-27 07:03:30.805377+00	79	f	156	11	21
10247	2017-02-27 07:03:30.911255+00	44	f	170	12	22
10248	2017-02-27 07:03:30.955962+00	160	f	125	16	23
10249	2017-02-27 07:03:31.110764+00	28	f	184	1	24
10250	2017-02-27 07:03:33.881742+00	19	f	183	24	27
10251	2017-02-27 07:03:33.938755+00	19	f	193	3	28
10252	2017-02-27 07:03:33.953008+00	14	f	201	3	29
10253	2017-02-27 07:03:33.968362+00	15	f	197	0	30
10254	2017-02-27 07:03:33.982836+00	204	f	107	9	31
10255	2017-02-27 07:03:33.998329+00	15	f	205	2	32
10256	2017-02-27 07:03:34.013077+00	37	f	165	2	33
10257	2017-02-27 07:03:34.028279+00	12	f	207	0	34
10258	2017-02-27 07:03:34.042697+00	23	f	171	5	35
10259	2017-02-27 07:03:34.058216+00	9	f	208	4	36
10260	2017-02-27 07:03:34.072782+00	2550	f	4	71	37
10261	2017-02-27 07:03:34.088296+00	431	f	31	4	38
10262	2017-02-27 07:03:34.102901+00	9	f	188	0	39
10263	2017-02-27 07:03:34.118272+00	40	f	148	1	40
10264	2017-02-27 07:03:34.132855+00	13	f	176	2	41
10265	2017-02-27 07:03:34.148388+00	113	f	98	2	42
10266	2017-02-27 07:03:34.163085+00	8	f	187	1	43
10267	2017-02-27 07:03:35.961877+00	6	f	211	0	45
10268	2017-02-27 07:03:36.039101+00	12	f	167	4	46
10269	2017-02-27 07:03:36.054105+00	521	f	13	37	47
10270	2017-02-27 07:03:36.273481+00	29648	t	2	876	48
10271	2017-02-27 07:03:36.284692+00	634	f	10	48	49
10272	2017-02-27 07:03:36.294647+00	14	f	168	1	50
10273	2017-02-27 07:03:36.304583+00	6	f	194	2	51
10274	2017-02-27 07:03:36.314528+00	35	f	133	2	52
10275	2017-02-27 07:03:36.324429+00	4	f	215	0	53
10276	2017-02-27 07:03:37.905737+00	8	f	175	1	55
10277	2017-02-27 07:03:38.079234+00	43	f	114	2	56
10278	2017-02-27 07:03:38.099551+00	5	f	190	0	57
10279	2017-02-27 07:03:38.109818+00	209	f	20	13	58
10280	2017-02-27 07:03:38.119785+00	85	f	89	25	59
10281	2017-02-27 07:03:38.129756+00	3	f	213	2	60
10282	2017-02-27 07:03:39.276369+00	14354	f	5	850	62
10283	2017-02-27 07:03:39.343497+00	3	f	204	2	63
10284	2017-02-27 07:03:39.353423+00	5	f	179	3	64
10285	2017-02-27 07:03:39.363281+00	4	f	189	1	65
10286	2017-02-27 07:03:42.46908+00	2	f	220	0	67
10287	2017-02-27 07:03:42.481507+00	1	f	218	1	68
10288	2017-02-27 07:03:42.491293+00	2	f	216	0	69
10289	2017-02-27 07:03:42.501127+00	2652	f	6	97	70
10290	2017-02-27 07:03:42.511123+00	5	f	161	2	71
10291	2017-02-27 07:03:42.521108+00	2538	f	92	163	72
10292	2017-02-27 07:03:42.531832+00	685	f	8	28	73
10293	2017-02-27 07:03:44.077608+00	29	f	100	3	75
10294	2017-02-27 07:03:45.694301+00	25	f	106	0	77
10295	2017-02-27 07:03:47.48193+00	4	f	164	2	79
10296	2017-02-27 07:03:47.566696+00	5	f	158	6	80
10297	2017-02-27 07:03:47.583034+00	3027	f	7	231	81
10298	2017-02-27 07:03:47.595045+00	1312	f	9	47	82
10299	2017-02-27 07:03:47.604957+00	214	f	11	7	83
10300	2017-02-27 07:03:47.614906+00	22	f	99	1	84
10301	2017-02-27 07:03:47.624799+00	19	f	101	0	85
10302	2017-02-27 07:03:49.327638+00	0	f	221	0	86
10303	2017-02-27 07:03:49.349101+00	1	f	219	0	87
10304	2017-02-27 07:03:49.359039+00	9	f	126	1	88
10305	2017-02-27 07:03:49.369112+00	0	f	217	0	89
10306	2017-02-27 07:03:49.378874+00	0	f	214	0	90
10307	2017-02-27 07:03:49.38891+00	0	f	212	0	91
10308	2017-02-27 07:03:49.399005+00	14	f	102	1	92
10309	2017-02-27 07:03:49.408983+00	0	f	202	0	93
10310	2017-02-27 07:03:49.419034+00	1	f	203	0	94
10311	2017-02-27 07:03:49.429079+00	4	f	134	7	95
10312	2017-02-27 07:03:49.439077+00	1	f	198	0	96
10313	2017-02-27 07:03:49.459128+00	1	f	195	1	97
10314	2017-02-27 07:03:49.469125+00	0	f	191	0	98
10315	2017-02-27 07:03:49.479184+00	0	f	182	0	99
10316	2017-02-27 07:13:27.146679+00	16084	f	152	623	1
10317	2017-02-27 07:13:27.256998+00	13779	f	112	379	2
10318	2017-02-27 07:13:27.2773+00	3344	f	132	57	3
10319	2017-02-27 07:13:27.320171+00	19554	f	88	854	4
10320	2017-02-27 07:13:27.335963+00	2201	f	120	206	5
10321	2017-02-27 07:13:27.351638+00	2446	f	109	28	6
10322	2017-02-27 07:13:27.365894+00	1267	f	123	40	7
10323	2017-02-27 07:13:27.381579+00	1445	f	115	30	8
10324	2017-02-27 07:13:27.39583+00	644	f	141	11	9
10325	2017-02-27 07:13:27.412175+00	368	f	151	15	10
10326	2017-02-27 07:13:27.425788+00	597	f	128	3	11
10327	2017-02-27 07:13:27.441618+00	179	f	166	10	12
10328	2017-02-27 07:13:27.456149+00	380	f	139	6	13
10329	2017-02-27 07:13:27.471684+00	133	f	169	6	14
10330	2017-02-27 07:13:27.485898+00	764	f	105	17	15
10331	2017-02-27 07:13:27.50174+00	609	f	104	10	16
10332	2017-02-27 07:13:27.516035+00	279	f	127	33	17
10333	2017-02-27 07:13:28.992416+00	38	f	178	11	20
10334	2017-02-27 07:13:29.061142+00	47	f	170	12	21
10335	2017-02-27 07:13:29.076483+00	78	f	156	11	22
10336	2017-02-27 07:13:29.090476+00	29	f	184	1	23
10337	2017-02-27 07:13:29.116264+00	163	f	125	16	24
10338	2017-02-27 07:13:32.099547+00	19	f	193	3	27
10339	2017-02-27 07:13:32.249494+00	17	f	201	3	28
10340	2017-02-27 07:13:32.264661+00	21	f	183	24	29
10341	2017-02-27 07:13:32.281282+00	16	f	205	2	30
10342	2017-02-27 07:13:32.294632+00	16	f	197	0	31
10343	2017-02-27 07:13:32.308787+00	207	f	107	9	32
10344	2017-02-27 07:13:32.328837+00	32	f	165	2	33
10345	2017-02-27 07:13:32.348091+00	12	f	207	0	34
10346	2017-02-27 07:13:32.361233+00	10	f	208	4	35
10347	2017-02-27 07:13:32.374571+00	21	f	171	5	36
10348	2017-02-27 07:13:32.388773+00	2558	f	4	71	37
10349	2017-02-27 07:13:32.414223+00	432	f	31	4	38
10350	2017-02-27 07:13:32.445564+00	11	f	188	0	39
10351	2017-02-27 07:13:32.462058+00	40	f	148	1	40
10352	2017-02-27 07:13:32.47525+00	12	f	176	2	41
10353	2017-02-27 07:13:32.489873+00	8	f	187	1	42
10354	2017-02-27 07:13:32.50514+00	111	f	98	2	43
10355	2017-02-27 07:13:34.238895+00	6	f	211	0	45
10356	2017-02-27 07:13:34.310308+00	12	f	167	4	46
10357	2017-02-27 07:13:34.326825+00	525	f	13	37	47
10358	2017-02-27 07:13:34.346733+00	29645	t	2	876	48
10359	2017-02-27 07:13:34.360125+00	636	f	10	48	49
10360	2017-02-27 07:13:34.374697+00	12	f	168	1	50
10361	2017-02-27 07:13:34.389958+00	5	f	215	0	51
10362	2017-02-27 07:13:34.420502+00	6	f	194	2	52
10363	2017-02-27 07:13:34.439382+00	30	f	133	2	53
10364	2017-02-27 07:13:37.271619+00	40	f	114	2	56
10365	2017-02-27 07:13:37.338439+00	3	f	220	0	57
10366	2017-02-27 07:13:37.35477+00	6	f	190	0	58
10367	2017-02-27 07:13:37.368162+00	208	f	20	13	59
10368	2017-02-27 07:13:37.393751+00	89	f	89	25	60
10369	2017-02-27 07:13:37.408843+00	8	f	175	1	61
10370	2017-02-27 07:13:37.423997+00	3	f	213	3	62
10371	2017-02-27 07:13:37.438974+00	14358	f	5	850	63
10372	2017-02-27 07:13:37.489626+00	4	f	204	2	64
10373	2017-02-27 07:13:37.524478+00	3	f	179	3	65
10374	2017-02-27 07:13:37.56489+00	2	f	189	1	66
10375	2017-02-27 07:13:39.03309+00	2	f	216	0	68
10376	2017-02-27 07:13:39.093783+00	2656	f	6	97	69
10377	2017-02-27 07:13:39.108183+00	1	f	212	0	70
10378	2017-02-27 07:13:39.123371+00	8	f	161	2	71
10379	2017-02-27 07:13:39.138207+00	2534	f	92	163	72
10380	2017-02-27 07:13:39.153185+00	680	f	8	28	73
10381	2017-02-27 07:13:40.513766+00	30	f	100	3	75
10382	2017-02-27 07:13:40.572627+00	4	f	164	2	76
10383	2017-02-27 07:13:42.032634+00	23	f	106	0	78
10384	2017-02-27 07:13:43.841459+00	5	f	158	6	80
10385	2017-02-27 07:13:43.911134+00	3026	f	7	231	81
10386	2017-02-27 07:13:43.925878+00	1306	f	9	47	82
10387	2017-02-27 07:13:43.940553+00	217	f	11	7	83
10388	2017-02-27 07:13:43.955807+00	19	f	99	1	84
10389	2017-02-27 07:13:46.235145+00	1	f	222	0	85
10390	2017-02-27 07:13:46.250957+00	20	f	101	0	86
10391	2017-02-27 07:13:46.267232+00	0	f	221	0	87
10392	2017-02-27 07:13:46.282435+00	1	f	219	0	88
10393	2017-02-27 07:13:46.297038+00	8	f	126	1	89
10394	2017-02-27 07:13:46.312417+00	6	f	134	7	90
10395	2017-02-27 07:13:46.327086+00	0	f	217	0	91
10396	2017-02-27 07:13:46.342805+00	0	f	214	0	92
10397	2017-02-27 07:13:46.357152+00	17	f	102	1	93
10398	2017-02-27 07:13:46.372516+00	1	f	202	0	94
10399	2017-02-27 07:13:46.387102+00	0	f	203	1	95
10400	2017-02-27 07:13:46.402493+00	1	f	198	0	96
10401	2017-02-27 07:13:46.417189+00	1	f	195	1	97
10402	2017-02-27 07:13:46.432445+00	0	f	191	0	98
10403	2017-02-27 07:13:46.447451+00	0	f	182	0	99
10404	2017-02-27 07:23:27.712934+00	16345	f	152	634	1
10405	2017-02-27 07:23:27.789195+00	13823	f	112	379	2
10406	2017-02-27 07:23:27.824092+00	3384	f	132	57	3
10407	2017-02-27 07:23:27.84016+00	19570	f	88	855	4
10408	2017-02-27 07:23:27.853945+00	2223	f	120	208	5
10409	2017-02-27 07:23:27.870015+00	2449	f	109	28	6
10410	2017-02-27 07:23:27.88404+00	1285	f	123	40	7
10411	2017-02-27 07:23:27.89994+00	1454	f	115	31	8
10412	2017-02-27 07:23:27.913739+00	654	f	141	11	9
10413	2017-02-27 07:23:27.930006+00	372	f	151	15	10
10414	2017-02-27 07:23:27.943938+00	599	f	128	3	11
10415	2017-02-27 07:23:27.966368+00	188	f	166	10	12
10416	2017-02-27 07:23:28.000592+00	385	f	139	7	13
10417	2017-02-27 07:23:28.016258+00	140	f	169	6	14
10418	2017-02-27 07:23:28.031547+00	769	f	105	17	15
10419	2017-02-27 07:23:28.046405+00	611	f	104	11	16
10420	2017-02-27 07:23:28.061578+00	283	f	127	33	17
10421	2017-02-27 07:23:29.549786+00	40	f	178	11	20
10422	2017-02-27 07:23:29.661667+00	46	f	170	12	21
10423	2017-02-27 07:23:29.676512+00	83	f	156	11	22
10424	2017-02-27 07:23:29.69116+00	32	f	184	2	23
10425	2017-02-27 07:23:29.716515+00	165	f	125	16	24
10426	2017-02-27 07:23:31.05704+00	18	f	201	3	26
10427	2017-02-27 07:23:32.467639+00	17	f	193	3	28
10428	2017-02-27 07:23:32.754862+00	23	f	183	24	29
10429	2017-02-27 07:23:32.769656+00	17	f	205	2	30
10430	2017-02-27 07:23:32.784267+00	17	f	197	0	31
10431	2017-02-27 07:23:32.799183+00	206	f	107	9	32
10432	2017-02-27 07:23:32.824209+00	34	f	165	2	33
10433	2017-02-27 07:23:32.839012+00	12	f	208	4	34
10434	2017-02-27 07:23:32.854109+00	11	f	207	0	35
10435	2017-02-27 07:23:32.869087+00	8	f	220	5	36
10436	2017-02-27 07:23:32.88411+00	23	f	171	5	37
10437	2017-02-27 07:23:32.898991+00	2558	f	4	71	38
10438	2017-02-27 07:23:32.924294+00	431	f	31	4	39
10439	2017-02-27 07:23:32.954453+00	11	f	188	0	40
10440	2017-02-27 07:23:32.969388+00	38	f	148	1	41
10441	2017-02-27 07:23:32.984552+00	13	f	176	2	42
10442	2017-02-27 07:23:32.999488+00	8	f	187	1	43
10443	2017-02-27 07:23:33.014737+00	111	f	98	2	44
10444	2017-02-27 07:23:34.71962+00	6	f	211	0	46
10445	2017-02-27 07:23:34.800412+00	16	f	167	4	47
10446	2017-02-27 07:23:34.834938+00	516	f	13	37	48
10447	2017-02-27 07:23:34.85033+00	29648	t	2	876	49
10448	2017-02-27 07:23:34.864793+00	637	f	10	48	50
10449	2017-02-27 07:23:34.879991+00	12	f	168	1	51
10450	2017-02-27 07:23:34.895048+00	5	f	215	0	52
10451	2017-02-27 07:23:34.910021+00	6	f	194	2	53
10452	2017-02-27 07:23:34.924888+00	34	f	133	2	54
10453	2017-02-27 07:23:38.064465+00	40	f	114	2	57
10454	2017-02-27 07:23:38.24945+00	3	f	190	0	58
10455	2017-02-27 07:23:38.263818+00	210	f	20	13	59
10456	2017-02-27 07:23:38.278813+00	89	f	89	25	60
10457	2017-02-27 07:23:38.293722+00	6	f	175	1	61
10458	2017-02-27 07:23:38.309085+00	3	f	213	3	62
10459	2017-02-27 07:23:38.323688+00	14355	f	5	850	63
10460	2017-02-27 07:23:38.33873+00	3	f	204	2	64
10461	2017-02-27 07:23:38.353635+00	4	f	179	3	65
10462	2017-02-27 07:23:38.368717+00	4	f	189	1	66
10463	2017-02-27 07:23:39.927151+00	2	f	221	1	68
10464	2017-02-27 07:23:40.008691+00	2	f	216	0	69
10465	2017-02-27 07:23:40.038369+00	2655	f	6	97	70
10466	2017-02-27 07:23:40.195523+00	1	f	212	0	71
10467	2017-02-27 07:23:40.21377+00	7	f	161	2	72
10468	2017-02-27 07:23:40.228625+00	2536	f	92	163	73
10469	2017-02-27 07:23:40.243472+00	2	f	202	0	74
10470	2017-02-27 07:23:40.261027+00	678	f	8	28	75
10471	2017-02-27 07:23:40.273765+00	2	f	198	0	76
10472	2017-02-27 07:23:41.579424+00	29	f	100	3	78
10473	2017-02-27 07:23:41.637224+00	7	f	164	2	79
10474	2017-02-27 07:23:42.929611+00	25	f	106	0	81
10475	2017-02-27 07:23:44.662484+00	8	f	158	6	83
10476	2017-02-27 07:23:44.730192+00	3035	f	7	231	84
10477	2017-02-27 07:23:44.744996+00	1315	f	9	47	85
10478	2017-02-27 07:23:44.759729+00	217	f	11	7	86
10479	2017-02-27 07:23:44.775076+00	21	f	99	1	87
10480	2017-02-27 07:23:47.064051+00	1	f	223	0	88
10481	2017-02-27 07:23:48.518805+00	16	f	101	0	90
10482	2017-02-27 07:23:48.542523+00	1	f	219	0	91
10483	2017-02-27 07:23:48.55746+00	8	f	126	1	92
10484	2017-02-27 07:23:48.572504+00	8	f	134	7	93
10485	2017-02-27 07:23:48.587487+00	0	f	217	0	94
10486	2017-02-27 07:23:48.602543+00	0	f	214	0	95
10487	2017-02-27 07:23:48.61747+00	15	f	102	1	96
10488	2017-02-27 07:23:48.632617+00	0	f	203	1	97
10489	2017-02-27 07:23:48.647513+00	0	f	195	1	98
10490	2017-02-27 07:23:48.662685+00	0	f	182	0	99
10491	2017-02-27 07:33:28.087954+00	16549	f	152	641	1
10492	2017-02-27 07:33:28.137364+00	13851	f	112	381	2
10493	2017-02-27 07:33:28.153946+00	3428	f	132	57	3
10494	2017-02-27 07:33:28.198189+00	19577	f	88	856	4
10495	2017-02-27 07:33:28.215008+00	2238	f	120	208	5
10496	2017-02-27 07:33:28.228057+00	2463	f	109	29	6
10497	2017-02-27 07:33:28.243018+00	1295	f	123	41	7
10498	2017-02-27 07:33:28.259371+00	1454	f	115	31	8
10499	2017-02-27 07:33:28.274773+00	655	f	141	11	9
10500	2017-02-27 07:33:28.28796+00	386	f	151	15	10
10501	2017-02-27 07:33:28.303073+00	605	f	128	3	11
10502	2017-02-27 07:33:28.317934+00	190	f	166	10	12
10503	2017-02-27 07:33:28.333065+00	394	f	139	7	13
10504	2017-02-27 07:33:28.348111+00	149	f	169	6	14
10505	2017-02-27 07:33:28.363165+00	769	f	105	17	15
10506	2017-02-27 07:33:28.378167+00	610	f	104	11	16
10507	2017-02-27 07:33:28.393171+00	277	f	127	33	17
10508	2017-02-27 07:33:29.877999+00	42	f	178	11	20
10509	2017-02-27 07:33:29.983298+00	52	f	170	12	21
10510	2017-02-27 07:33:30.021419+00	81	f	156	11	22
10511	2017-02-27 07:33:30.037615+00	33	f	184	2	23
10512	2017-02-27 07:33:30.05173+00	161	f	125	16	24
10513	2017-02-27 07:33:32.957097+00	20	f	193	3	27
10514	2017-02-27 07:33:33.156232+00	23	f	183	24	28
10515	2017-02-27 07:33:33.170202+00	12	f	220	7	29
10516	2017-02-27 07:33:33.232014+00	17	f	201	3	30
10517	2017-02-27 07:33:33.280548+00	17	f	205	2	31
10518	2017-02-27 07:33:33.320853+00	15	f	197	0	32
10519	2017-02-27 07:33:33.336264+00	15	f	208	4	33
10520	2017-02-27 07:33:33.350626+00	204	f	107	9	34
10521	2017-02-27 07:33:33.366003+00	33	f	165	2	35
10522	2017-02-27 07:33:33.38045+00	13	f	207	0	36
10523	2017-02-27 07:33:33.396076+00	22	f	171	5	37
10524	2017-02-27 07:33:33.410492+00	2556	f	4	71	38
10525	2017-02-27 07:33:33.426094+00	433	f	31	4	39
10526	2017-02-27 07:33:33.440638+00	9	f	188	0	40
10527	2017-02-27 07:33:33.456135+00	43	f	148	1	41
10528	2017-02-27 07:33:33.470784+00	12	f	176	2	42
10529	2017-02-27 07:33:33.486262+00	7	f	187	1	43
10530	2017-02-27 07:33:33.500777+00	7	f	211	0	44
10531	2017-02-27 07:33:33.516309+00	114	f	98	2	45
10532	2017-02-27 07:33:35.168286+00	14	f	167	4	47
10533	2017-02-27 07:33:35.415996+00	525	f	13	37	48
10534	2017-02-27 07:33:35.435357+00	29650	t	2	878	49
10535	2017-02-27 07:33:35.451759+00	633	f	10	48	50
10536	2017-02-27 07:33:35.466085+00	13	f	168	1	51
10537	2017-02-27 07:33:35.491624+00	5	f	215	0	52
10538	2017-02-27 07:33:35.507218+00	38	f	133	2	53
10539	2017-02-27 07:33:35.522694+00	7	f	194	2	54
10540	2017-02-27 07:33:38.375806+00	5	f	204	2	57
10541	2017-02-27 07:33:38.40374+00	40	f	114	2	58
10542	2017-02-27 07:33:38.414923+00	3	f	221	2	59
10543	2017-02-27 07:33:38.430371+00	5	f	190	0	60
10544	2017-02-27 07:33:38.444985+00	205	f	20	13	61
10545	2017-02-27 07:33:38.460437+00	88	f	89	25	62
10546	2017-02-27 07:33:38.475003+00	7	f	175	1	63
10547	2017-02-27 07:33:38.490468+00	14357	f	5	850	64
10548	2017-02-27 07:33:38.505027+00	2	f	202	0	65
10549	2017-02-27 07:33:38.520487+00	3	f	179	3	66
10550	2017-02-27 07:33:38.535057+00	3	f	189	1	67
10551	2017-02-27 07:33:39.988385+00	2	f	216	0	69
10552	2017-02-27 07:33:40.05991+00	2655	f	6	97	70
10553	2017-02-27 07:33:40.074957+00	2	f	213	3	71
10554	2017-02-27 07:33:40.089449+00	5	f	161	2	72
10555	2017-02-27 07:33:40.1048+00	2537	f	92	163	73
10556	2017-02-27 07:33:40.119466+00	683	f	8	28	74
10557	2017-02-27 07:33:40.134922+00	2	f	198	0	75
10558	2017-02-27 07:33:41.440856+00	31	f	100	3	77
10559	2017-02-27 07:33:41.499813+00	6	f	164	2	78
10560	2017-02-27 07:33:43.187994+00	4	f	158	6	80
10561	2017-02-27 07:33:43.258336+00	23	f	106	0	81
10562	2017-02-27 07:33:44.872278+00	3032	f	7	231	83
10563	2017-02-27 07:33:44.96843+00	1310	f	9	47	84
10564	2017-02-27 07:33:44.982492+00	217	f	11	7	85
10565	2017-02-27 07:33:44.997732+00	23	f	99	1	86
10566	2017-02-27 07:33:45.012403+00	1	f	223	0	87
10567	2017-02-27 07:33:46.717685+00	19	f	101	0	89
10568	2017-02-27 07:33:46.772657+00	1	f	219	0	90
10569	2017-02-27 07:33:46.78715+00	9	f	126	1	91
10570	2017-02-27 07:33:46.802303+00	5	f	134	7	92
10571	2017-02-27 07:33:46.817086+00	0	f	217	0	93
10572	2017-02-27 07:33:46.832332+00	0	f	214	0	94
10573	2017-02-27 07:33:46.846992+00	1	f	212	0	95
10574	2017-02-27 07:33:46.862239+00	15	f	102	1	96
10575	2017-02-27 07:33:46.877039+00	0	f	203	1	97
10576	2017-02-27 07:33:46.89233+00	0	f	195	1	98
10577	2017-02-27 07:33:46.90744+00	0	f	182	0	99
10578	2017-02-27 07:43:28.045587+00	16719	f	152	649	1
10579	2017-02-27 07:43:28.101005+00	13882	f	112	381	2
10580	2017-02-27 07:43:28.132048+00	3457	f	132	57	3
10581	2017-02-27 07:43:28.143243+00	19579	f	88	855	4
10582	2017-02-27 07:43:28.153242+00	2260	f	120	210	5
10583	2017-02-27 07:43:28.163107+00	2486	f	109	30	6
10584	2017-02-27 07:43:28.173102+00	1313	f	123	44	7
10585	2017-02-27 07:43:28.183142+00	1462	f	115	31	8
10586	2017-02-27 07:43:28.233068+00	669	f	141	13	9
10587	2017-02-27 07:43:28.263539+00	393	f	151	15	10
10588	2017-02-27 07:43:28.273453+00	614	f	128	3	11
10589	2017-02-27 07:43:28.283496+00	199	f	166	10	12
10590	2017-02-27 07:43:28.353798+00	392	f	139	8	13
10591	2017-02-27 07:43:28.402617+00	152	f	169	6	14
10592	2017-02-27 07:43:28.412593+00	782	f	105	17	15
10593	2017-02-27 07:43:28.422706+00	616	f	104	11	16
10594	2017-02-27 07:43:28.433276+00	288	f	127	33	17
10595	2017-02-27 07:43:29.913336+00	44	f	178	12	19
10596	2017-02-27 07:43:29.989257+00	52	f	170	12	21
10597	2017-02-27 07:43:30.005905+00	35	f	184	2	22
10598	2017-02-27 07:43:30.01694+00	85	f	156	11	23
10599	2017-02-27 07:43:30.02694+00	165	f	125	16	24
10600	2017-02-27 07:43:30.036946+00	12	f	220	9	25
10601	2017-02-27 07:43:30.046977+00	22	f	193	3	26
10602	2017-02-27 07:43:30.05695+00	23	f	183	25	27
10603	2017-02-27 07:43:31.379672+00	18	f	208	4	29
10604	2017-02-27 07:43:32.733602+00	18	f	205	2	31
10605	2017-02-27 07:43:32.80464+00	18	f	201	3	32
10606	2017-02-27 07:43:32.814493+00	16	f	197	0	33
10607	2017-02-27 07:43:32.824475+00	208	f	107	9	34
10608	2017-02-27 07:43:32.834527+00	35	f	165	2	35
10609	2017-02-27 07:43:32.844352+00	13	f	207	0	36
10610	2017-02-27 07:43:32.854388+00	22	f	171	5	37
10611	2017-02-27 07:43:32.874449+00	2554	f	4	71	38
10612	2017-02-27 07:43:32.884638+00	435	f	31	4	39
10613	2017-02-27 07:43:32.894498+00	11	f	176	2	40
10614	2017-02-27 07:43:32.904536+00	8	f	188	0	41
10615	2017-02-27 07:43:32.914566+00	42	f	148	2	42
10616	2017-02-27 07:43:32.924595+00	9	f	187	1	43
10617	2017-02-27 07:43:32.934609+00	7	f	211	1	44
10618	2017-02-27 07:43:32.944605+00	114	f	98	2	45
10619	2017-02-27 07:43:34.578456+00	526	f	13	37	47
10620	2017-02-27 07:43:34.637745+00	14	f	167	4	48
10621	2017-02-27 07:43:34.65399+00	29648	t	2	878	49
10622	2017-02-27 07:43:34.667165+00	639	f	10	48	50
10623	2017-02-27 07:43:34.677145+00	13	f	168	1	51
10624	2017-02-27 07:43:34.687223+00	5	f	215	0	52
10625	2017-02-27 07:43:34.697137+00	36	f	133	2	53
10626	2017-02-27 07:43:34.707153+00	6	f	194	2	54
10627	2017-02-27 07:43:37.554433+00	3	f	204	2	57
10628	2017-02-27 07:43:37.655928+00	41	f	114	2	58
10629	2017-02-27 07:43:37.672503+00	3	f	221	2	59
10630	2017-02-27 07:43:37.685619+00	6	f	190	0	60
10631	2017-02-27 07:43:37.702259+00	206	f	20	13	61
10632	2017-02-27 07:43:37.715518+00	91	f	89	25	62
10633	2017-02-27 07:43:37.725477+00	8	f	175	1	63
10634	2017-02-27 07:43:37.735457+00	2	f	213	3	64
10635	2017-02-27 07:43:37.751725+00	14352	f	5	850	65
10636	2017-02-27 07:43:37.765544+00	2	f	202	0	66
10637	2017-02-27 07:43:37.77527+00	5	f	179	3	67
10638	2017-02-27 07:43:37.78532+00	3	f	189	1	68
10639	2017-02-27 07:43:39.225457+00	7	f	161	2	70
10640	2017-02-27 07:43:39.373403+00	1	f	217	0	71
10641	2017-02-27 07:43:39.390169+00	2	f	216	0	72
10642	2017-02-27 07:43:39.540498+00	2657	f	6	97	73
10643	2017-02-27 07:43:39.688125+00	2531	f	92	163	74
10644	2017-02-27 07:43:39.761417+00	684	f	8	28	75
10645	2017-02-27 07:43:39.777908+00	2	f	198	0	76
10646	2017-02-27 07:43:41.104462+00	25	f	100	3	78
10647	2017-02-27 07:43:41.17496+00	6	f	164	2	79
10648	2017-02-27 07:43:42.626924+00	6	f	158	6	81
10649	2017-02-27 07:43:42.718481+00	23	f	106	0	82
10650	2017-02-27 07:43:44.134774+00	3031	f	7	231	84
10651	2017-02-27 07:43:44.202703+00	1306	f	9	47	85
10652	2017-02-27 07:43:44.212476+00	221	f	11	7	86
10653	2017-02-27 07:43:44.22246+00	23	f	99	1	87
10654	2017-02-27 07:43:44.232381+00	9	f	134	7	88
10655	2017-02-27 07:43:44.242452+00	1	f	223	0	89
10656	2017-02-27 07:43:45.666133+00	17	f	101	0	91
10657	2017-02-27 07:43:45.716539+00	1	f	219	0	92
10658	2017-02-27 07:43:45.726437+00	9	f	126	1	93
10659	2017-02-27 07:43:45.736324+00	0	f	214	0	94
10660	2017-02-27 07:43:45.746305+00	0	f	210	1	95
10661	2017-02-27 07:43:45.756439+00	2	f	212	0	96
10662	2017-02-27 07:43:45.766248+00	15	f	102	1	97
10663	2017-02-27 07:43:45.776139+00	0	f	203	1	98
10664	2017-02-27 07:43:45.786247+00	0	f	195	1	99
10665	2017-02-27 07:53:28.766558+00	16928	f	152	652	1
10666	2017-02-27 07:53:28.845656+00	13920	f	112	383	2
10667	2017-02-27 07:53:28.861101+00	3484	f	132	57	3
10668	2017-02-27 07:53:28.875345+00	19587	f	88	855	4
10669	2017-02-27 07:53:28.890933+00	2265	f	120	212	5
10670	2017-02-27 07:53:28.90537+00	2493	f	109	30	6
10671	2017-02-27 07:53:28.920977+00	1325	f	123	44	7
10672	2017-02-27 07:53:28.935407+00	1475	f	115	31	8
10673	2017-02-27 07:53:28.951061+00	677	f	141	13	9
10674	2017-02-27 07:53:28.965881+00	397	f	151	15	10
10675	2017-02-27 07:53:28.981407+00	621	f	128	3	11
10676	2017-02-27 07:53:28.99598+00	206	f	166	10	12
10677	2017-02-27 07:53:29.011508+00	403	f	139	8	13
10678	2017-02-27 07:53:29.025905+00	159	f	169	6	14
10679	2017-02-27 07:53:29.041438+00	786	f	105	17	15
10680	2017-02-27 07:53:29.062936+00	618	f	104	11	16
10681	2017-02-27 07:53:29.076041+00	291	f	127	33	17
10682	2017-02-27 07:53:30.559197+00	46	f	178	12	19
10683	2017-02-27 07:53:30.649423+00	40	f	184	2	20
10684	2017-02-27 07:53:30.669782+00	58	f	170	12	22
10685	2017-02-27 07:53:30.686451+00	81	f	156	11	23
10686	2017-02-27 07:53:30.701127+00	26	f	193	3	24
10687	2017-02-27 07:53:30.716438+00	14	f	220	17	25
10688	2017-02-27 07:53:30.730594+00	171	f	125	16	26
10689	2017-02-27 07:53:32.093151+00	25	f	183	25	28
10690	2017-02-27 07:53:32.148689+00	19	f	208	4	29
10691	2017-02-27 07:53:32.16454+00	18	f	205	2	30
10692	2017-02-27 07:53:33.60256+00	17	f	201	3	32
10693	2017-02-27 07:53:33.663197+00	15	f	197	0	33
10694	2017-02-27 07:53:33.678349+00	209	f	107	9	34
10695	2017-02-27 07:53:33.694253+00	36	f	165	2	35
10696	2017-02-27 07:53:33.708266+00	13	f	207	0	36
10697	2017-02-27 07:53:33.724169+00	22	f	171	5	37
10698	2017-02-27 07:53:33.738226+00	2552	f	4	71	38
10699	2017-02-27 07:53:33.764815+00	435	f	31	4	39
10700	2017-02-27 07:53:33.778961+00	14	f	176	2	40
10701	2017-02-27 07:53:33.794685+00	11	f	188	0	41
10702	2017-02-27 07:53:33.808614+00	40	f	148	2	42
10703	2017-02-27 07:53:33.824573+00	8	f	187	1	43
10704	2017-02-27 07:53:33.838622+00	7	f	211	1	44
10705	2017-02-27 07:53:33.854453+00	114	f	98	2	45
10706	2017-02-27 07:53:35.962995+00	529	f	13	37	47
10707	2017-02-27 07:53:36.105107+00	13	f	167	4	48
10708	2017-02-27 07:53:36.120815+00	29654	t	2	879	49
10709	2017-02-27 07:53:36.134862+00	639	f	10	48	50
10710	2017-02-27 07:53:36.150979+00	14	f	168	1	51
10711	2017-02-27 07:53:36.164889+00	5	f	215	0	52
10712	2017-02-27 07:53:36.180738+00	39	f	133	2	53
10713	2017-02-27 07:53:36.1947+00	7	f	194	2	54
10714	2017-02-27 07:53:37.540292+00	4	f	190	0	56
10715	2017-02-27 07:53:39.25181+00	4	f	204	2	58
10716	2017-02-27 07:53:39.323052+00	43	f	114	2	59
10717	2017-02-27 07:53:39.339164+00	3	f	221	2	60
10718	2017-02-27 07:53:39.352736+00	210	f	20	13	61
10719	2017-02-27 07:53:39.369091+00	90	f	89	25	62
10720	2017-02-27 07:53:39.38275+00	2	f	217	0	63
10721	2017-02-27 07:53:39.399098+00	9	f	175	1	64
10722	2017-02-27 07:53:39.412643+00	3	f	213	3	65
10723	2017-02-27 07:53:39.427284+00	14354	f	5	850	66
10724	2017-02-27 07:53:39.442637+00	1	f	202	0	67
10725	2017-02-27 07:53:39.457292+00	4	f	179	3	68
10726	2017-02-27 07:53:39.47282+00	3	f	189	1	69
10727	2017-02-27 07:53:42.391285+00	8	f	161	2	72
10728	2017-02-27 07:53:42.506136+00	1	f	216	0	73
10729	2017-02-27 07:53:42.521013+00	2649	f	6	97	74
10730	2017-02-27 07:53:42.537509+00	2529	f	92	163	75
10731	2017-02-27 07:53:42.550773+00	684	f	8	28	76
10732	2017-02-27 07:53:42.567483+00	2	f	198	0	77
10733	2017-02-27 07:53:43.857111+00	28	f	100	3	79
10734	2017-02-27 07:53:43.929935+00	7	f	164	2	80
10735	2017-02-27 07:53:45.391157+00	7	f	158	6	82
10736	2017-02-27 07:53:45.463433+00	23	f	106	0	83
10737	2017-02-27 07:53:47.036444+00	3037	f	7	231	85
10738	2017-02-27 07:53:49.140627+00	1	f	224	0	86
10739	2017-02-27 07:53:51.076186+00	0	f	225	1	87
10740	2017-02-27 07:53:51.098527+00	1310	f	9	47	88
10741	2017-02-27 07:53:51.110959+00	220	f	11	7	89
10742	2017-02-27 07:53:51.120804+00	20	f	99	1	90
10743	2017-02-27 07:53:51.13094+00	7	f	134	7	91
10744	2017-02-27 07:53:51.140684+00	1	f	223	0	92
10745	2017-02-27 07:53:51.150708+00	18	f	101	0	93
10746	2017-02-27 07:53:51.16081+00	1	f	219	0	94
10747	2017-02-27 07:53:51.170809+00	9	f	126	1	95
10748	2017-02-27 07:53:51.180766+00	0	f	214	0	96
10749	2017-02-27 07:53:51.190874+00	0	f	210	1	97
10750	2017-02-27 07:53:51.200949+00	1	f	212	0	98
10751	2017-02-27 07:53:51.21096+00	16	f	102	1	99
10752	2017-02-27 08:03:30.031716+00	17106	f	152	664	1
10753	2017-02-27 08:03:30.157933+00	13952	f	112	383	2
10754	2017-02-27 08:03:30.196561+00	3515	f	132	58	3
10755	2017-02-27 08:03:30.212122+00	19608	f	88	855	4
10756	2017-02-27 08:03:30.222199+00	2280	f	120	213	5
10757	2017-02-27 08:03:30.242236+00	2495	f	109	30	6
10758	2017-02-27 08:03:30.252308+00	1331	f	123	44	7
10759	2017-02-27 08:03:30.272286+00	1489	f	115	31	8
10760	2017-02-27 08:03:30.282343+00	674	f	141	13	9
10761	2017-02-27 08:03:30.3072+00	401	f	151	15	10
10762	2017-02-27 08:03:30.322498+00	213	f	166	10	11
10763	2017-02-27 08:03:30.337685+00	627	f	128	3	12
10764	2017-02-27 08:03:30.350933+00	407	f	139	8	13
10765	2017-02-27 08:03:30.360963+00	163	f	169	6	14
10766	2017-02-27 08:03:30.371013+00	781	f	105	17	15
10767	2017-02-27 08:03:30.38105+00	616	f	104	11	16
10768	2017-02-27 08:03:30.391081+00	293	f	127	33	17
10769	2017-02-27 08:03:32.097239+00	50	f	178	13	19
10770	2017-02-27 08:03:32.298213+00	38	f	184	2	20
10771	2017-02-27 08:03:32.329684+00	19	f	220	22	22
10772	2017-02-27 08:03:32.346326+00	59	f	170	12	23
10773	2017-02-27 08:03:32.356585+00	29	f	193	3	24
10774	2017-02-27 08:03:32.366564+00	89	f	156	11	25
10775	2017-02-27 08:03:32.376562+00	167	f	125	16	26
10776	2017-02-27 08:03:32.386512+00	21	f	208	4	27
10777	2017-02-27 08:03:33.787325+00	27	f	183	25	29
10778	2017-02-27 08:03:34.002012+00	19	f	201	3	30
10779	2017-02-27 08:03:35.455561+00	18	f	205	2	32
10780	2017-02-27 08:03:35.481691+00	16	f	197	0	33
10781	2017-02-27 08:03:35.495094+00	204	f	107	9	34
10782	2017-02-27 08:03:35.511576+00	37	f	165	2	35
10783	2017-02-27 08:03:35.524912+00	13	f	207	0	36
10784	2017-02-27 08:03:35.53482+00	25	f	171	5	37
10785	2017-02-27 08:03:35.551387+00	2552	f	4	71	38
10786	2017-02-27 08:03:35.564866+00	431	f	31	4	39
10787	2017-02-27 08:03:35.632153+00	11	f	188	0	40
10788	2017-02-27 08:03:35.650427+00	11	f	176	2	41
10789	2017-02-27 08:03:35.662345+00	42	f	148	2	42
10790	2017-02-27 08:03:35.672284+00	9	f	187	1	43
10791	2017-02-27 08:03:35.68225+00	7	f	211	1	44
10792	2017-02-27 08:03:35.692228+00	115	f	98	2	45
10793	2017-02-27 08:03:35.712339+00	7	f	194	2	46
10794	2017-02-27 08:03:37.353643+00	13	f	168	1	48
10795	2017-02-27 08:03:37.377226+00	519	f	13	37	49
10796	2017-02-27 08:03:37.393729+00	15	f	167	4	50
10797	2017-02-27 08:03:37.407127+00	29652	t	2	880	51
10798	2017-02-27 08:03:37.423757+00	636	f	10	48	52
10799	2017-02-27 08:03:37.437024+00	5	f	215	0	53
10800	2017-02-27 08:03:37.453531+00	35	f	133	2	54
10801	2017-02-27 08:03:37.46694+00	4	f	221	2	55
10802	2017-02-27 08:03:38.787033+00	4	f	217	0	57
10803	2017-02-27 08:03:38.879195+00	6	f	190	0	58
10804	2017-02-27 08:03:40.544645+00	4	f	204	2	60
10805	2017-02-27 08:03:40.662301+00	40	f	114	2	61
10806	2017-02-27 08:03:40.685738+00	90	f	89	25	62
10807	2017-02-27 08:03:40.701819+00	3	f	189	1	63
10808	2017-02-27 08:03:40.715468+00	205	f	20	13	64
10809	2017-02-27 08:03:40.731827+00	7	f	175	1	65
10810	2017-02-27 08:03:40.745547+00	3	f	216	0	66
10811	2017-02-27 08:03:40.762384+00	4	f	213	3	67
10812	2017-02-27 08:03:40.775607+00	14352	f	5	850	68
10813	2017-02-27 08:03:40.785548+00	3	f	202	0	69
10814	2017-02-27 08:03:40.795521+00	2	f	198	0	70
10815	2017-02-27 08:03:40.805539+00	3	f	179	3	71
10816	2017-02-27 08:03:43.862119+00	5	f	161	2	74
10817	2017-02-27 08:03:44.061039+00	2656	f	6	97	75
10818	2017-02-27 08:03:44.081713+00	2536	f	92	163	76
10819	2017-02-27 08:03:44.094485+00	685	f	8	28	77
10820	2017-02-27 08:03:45.384701+00	31	f	100	3	79
10821	2017-02-27 08:03:45.45961+00	3	f	164	2	80
10822	2017-02-27 08:03:46.908261+00	10	f	158	6	82
10823	2017-02-27 08:03:46.982446+00	21	f	106	0	83
10824	2017-02-27 08:03:48.409806+00	9	f	134	7	85
10825	2017-02-27 08:03:48.476255+00	3031	f	7	231	86
10826	2017-02-27 08:03:48.493346+00	1	f	224	0	87
10827	2017-02-27 08:03:48.506088+00	1309	f	9	47	88
10828	2017-02-27 08:03:48.523052+00	217	f	11	7	89
10829	2017-02-27 08:03:48.536059+00	21	f	99	1	90
10830	2017-02-27 08:03:48.552143+00	1	f	223	0	91
10831	2017-02-27 08:03:48.56611+00	18	f	101	0	92
10832	2017-02-27 08:03:48.582249+00	1	f	219	0	93
10833	2017-02-27 08:03:48.596237+00	11	f	126	1	94
10834	2017-02-27 08:03:48.612278+00	0	f	214	0	95
10835	2017-02-27 08:03:48.626268+00	0	f	210	1	96
10836	2017-02-27 08:03:48.642392+00	0	f	212	0	97
10837	2017-02-27 08:03:48.656333+00	14	f	102	1	98
10838	2017-02-27 08:03:48.672423+00	0	f	203	1	99
10839	2017-02-27 08:13:28.537786+00	17281	f	152	673	1
10840	2017-02-27 08:13:28.614365+00	13977	f	112	383	2
10841	2017-02-27 08:13:28.628157+00	3549	f	132	58	3
10842	2017-02-27 08:13:28.643949+00	19602	f	88	855	4
10843	2017-02-27 08:13:28.658518+00	2297	f	120	213	5
10844	2017-02-27 08:13:28.825354+00	2517	f	109	30	6
10845	2017-02-27 08:13:28.934662+00	1346	f	123	45	7
10846	2017-02-27 08:13:28.985555+00	1492	f	115	31	8
10847	2017-02-27 08:13:29.005391+00	686	f	141	13	9
10848	2017-02-27 08:13:29.019766+00	406	f	151	15	10
10849	2017-02-27 08:13:29.035629+00	213	f	166	10	11
10850	2017-02-27 08:13:29.049831+00	633	f	128	3	12
10851	2017-02-27 08:13:29.065355+00	168	f	169	6	13
10852	2017-02-27 08:13:29.079886+00	412	f	139	8	14
10853	2017-02-27 08:13:29.096539+00	786	f	105	17	15
10854	2017-02-27 08:13:29.116069+00	624	f	104	11	16
10855	2017-02-27 08:13:29.130194+00	296	f	127	33	17
10856	2017-02-27 08:13:29.145254+00	57	f	178	13	18
10857	2017-02-27 08:13:30.674434+00	43	f	184	2	20
10858	2017-02-27 08:13:30.765006+00	57	f	170	12	21
10859	2017-02-27 08:13:30.783051+00	29	f	193	3	23
10860	2017-02-27 08:13:30.814467+00	89	f	156	11	24
10861	2017-02-27 08:13:30.829983+00	24	f	208	4	25
10862	2017-02-27 08:13:30.844304+00	23	f	201	3	26
10863	2017-02-27 08:13:30.859991+00	30	f	183	25	27
10864	2017-02-27 08:13:32.271536+00	171	f	125	16	29
10865	2017-02-27 08:13:32.35452+00	20	f	205	2	30
10866	2017-02-27 08:13:33.776512+00	18	f	197	0	32
10867	2017-02-27 08:13:34.019352+00	207	f	107	9	33
10868	2017-02-27 08:13:34.038591+00	34	f	165	2	34
10869	2017-02-27 08:13:34.052839+00	15	f	207	0	35
10870	2017-02-27 08:13:34.068258+00	24	f	171	5	36
10871	2017-02-27 08:13:34.082775+00	2553	f	4	71	37
10872	2017-02-27 08:13:34.118684+00	433	f	31	4	38
10873	2017-02-27 08:13:34.138912+00	10	f	188	0	39
10874	2017-02-27 08:13:34.153266+00	11	f	176	2	40
10875	2017-02-27 08:13:34.168657+00	9	f	211	2	41
10876	2017-02-27 08:13:34.183134+00	42	f	148	2	42
10877	2017-02-27 08:13:34.198675+00	9	f	187	1	43
10878	2017-02-27 08:13:34.213103+00	114	f	98	2	44
10879	2017-02-27 08:13:34.228639+00	8	f	194	2	45
10880	2017-02-27 08:13:35.913344+00	12	f	168	1	47
10881	2017-02-27 08:13:35.97413+00	525	f	13	37	48
10882	2017-02-27 08:13:35.993623+00	14	f	167	4	49
10883	2017-02-27 08:13:36.00794+00	29656	t	2	880	50
10884	2017-02-27 08:13:36.023375+00	641	f	10	48	51
10885	2017-02-27 08:13:36.043363+00	5	f	204	2	52
10886	2017-02-27 08:13:36.057787+00	5	f	215	0	53
10887	2017-02-27 08:13:36.073168+00	37	f	133	2	54
10888	2017-02-27 08:13:36.088028+00	4	f	221	2	55
10889	2017-02-27 08:13:37.436243+00	3	f	217	0	57
10890	2017-02-27 08:13:37.518089+00	4	f	190	0	58
10891	2017-02-27 08:13:39.420273+00	3	f	226	0	59
10892	2017-02-27 08:13:41.041708+00	40	f	114	2	61
10893	2017-02-27 08:13:41.122019+00	87	f	89	25	62
10894	2017-02-27 08:13:41.136394+00	3	f	189	1	63
10895	2017-02-27 08:13:41.151095+00	207	f	20	13	64
10896	2017-02-27 08:13:41.16645+00	6	f	179	3	65
10897	2017-02-27 08:13:41.18108+00	7	f	175	1	66
10898	2017-02-27 08:13:41.196492+00	2	f	216	0	67
10899	2017-02-27 08:13:41.210969+00	3	f	213	3	68
10900	2017-02-27 08:13:41.226681+00	14353	f	5	850	69
10901	2017-02-27 08:13:41.241145+00	3	f	202	0	70
10902	2017-02-27 08:13:41.256662+00	2	f	198	0	71
10903	2017-02-27 08:13:41.271259+00	2	f	223	0	72
10904	2017-02-27 08:13:44.031735+00	7	f	161	2	75
10905	2017-02-27 08:13:44.114885+00	2649	f	6	97	76
10906	2017-02-27 08:13:44.128927+00	2536	f	92	163	77
10907	2017-02-27 08:13:44.144424+00	681	f	8	29	78
10908	2017-02-27 08:13:45.526546+00	31	f	100	3	80
10909	2017-02-27 08:13:47.121883+00	2	f	158	6	82
10910	2017-02-27 08:13:47.193692+00	22	f	106	0	83
10911	2017-02-27 08:13:50.729028+00	1	f	227	0	85
10912	2017-02-27 08:13:50.745862+00	3	f	164	2	86
10913	2017-02-27 08:13:50.761845+00	3036	f	7	231	87
10914	2017-02-27 08:13:50.775556+00	1	f	224	1	88
10915	2017-02-27 08:13:50.791693+00	1313	f	9	47	89
10916	2017-02-27 08:13:50.805537+00	215	f	11	7	90
10917	2017-02-27 08:13:50.821674+00	22	f	99	1	91
10918	2017-02-27 08:13:50.835546+00	5	f	134	7	92
10919	2017-02-27 08:13:50.8517+00	19	f	101	0	93
10920	2017-02-27 08:13:50.86622+00	1	f	219	0	94
10921	2017-02-27 08:13:50.882248+00	11	f	126	1	95
10922	2017-02-27 08:13:50.896027+00	0	f	214	0	96
10923	2017-02-27 08:13:50.912217+00	0	f	210	1	97
10924	2017-02-27 08:13:50.942275+00	0	f	212	0	98
10925	2017-02-27 08:13:50.956196+00	15	f	102	1	99
10926	2017-02-27 08:23:29.477968+00	17446	f	152	688	1
10927	2017-02-27 08:23:29.648347+00	14001	f	112	384	2
10928	2017-02-27 08:23:29.672524+00	3579	f	132	60	3
10929	2017-02-27 08:23:29.698647+00	19611	f	88	855	4
10930	2017-02-27 08:23:29.723168+00	2305	f	120	213	5
10931	2017-02-27 08:23:29.748897+00	2517	f	109	31	6
10932	2017-02-27 08:23:29.762838+00	1357	f	123	46	7
10933	2017-02-27 08:23:29.788882+00	1500	f	115	31	8
10934	2017-02-27 08:23:29.802694+00	685	f	141	13	9
10935	2017-02-27 08:23:29.828872+00	411	f	151	15	10
10936	2017-02-27 08:23:29.842814+00	217	f	166	10	11
10937	2017-02-27 08:23:29.868901+00	632	f	128	3	12
10938	2017-02-27 08:23:29.882984+00	165	f	169	7	13
10939	2017-02-27 08:23:29.896497+00	408	f	139	8	14
10940	2017-02-27 08:23:29.908972+00	792	f	105	17	15
10941	2017-02-27 08:23:29.933033+00	622	f	104	11	16
10942	2017-02-27 08:23:29.946836+00	298	f	127	34	17
10943	2017-02-27 08:23:29.959191+00	56	f	178	14	18
10944	2017-02-27 08:23:31.456306+00	45	f	184	3	20
10945	2017-02-27 08:23:31.57403+00	59	f	170	12	21
10946	2017-02-27 08:23:31.5973+00	32	f	193	3	23
10947	2017-02-27 08:23:31.618251+00	88	f	156	11	24
10948	2017-02-27 08:23:31.63417+00	26	f	208	4	25
10949	2017-02-27 08:23:31.647921+00	24	f	201	3	26
10950	2017-02-27 08:23:31.663788+00	32	f	183	25	27
10951	2017-02-27 08:23:33.024359+00	168	f	125	16	29
10952	2017-02-27 08:23:33.142647+00	20	f	205	2	30
10953	2017-02-27 08:23:34.502885+00	18	f	197	0	32
10954	2017-02-27 08:23:34.529076+00	206	f	107	9	33
10955	2017-02-27 08:23:34.561308+00	32	f	165	2	34
10956	2017-02-27 08:23:34.575726+00	13	f	207	0	35
10957	2017-02-27 08:23:34.591336+00	24	f	171	5	36
10958	2017-02-27 08:23:34.770562+00	6	f	226	1	37
10959	2017-02-27 08:23:34.81258+00	2557	f	4	71	38
10960	2017-02-27 08:23:34.83687+00	438	f	31	4	39
10961	2017-02-27 08:23:34.852158+00	11	f	188	0	40
10962	2017-02-27 08:23:34.866618+00	14	f	176	2	41
10963	2017-02-27 08:23:34.885043+00	7	f	211	2	42
10964	2017-02-27 08:23:34.906654+00	40	f	148	2	43
10965	2017-02-27 08:23:34.922158+00	10	f	187	1	44
10966	2017-02-27 08:23:34.936507+00	7	f	194	2	45
10967	2017-02-27 08:23:34.952231+00	114	f	98	2	46
10968	2017-02-27 08:23:36.60449+00	13	f	168	1	48
10969	2017-02-27 08:23:36.677114+00	5	f	221	2	49
10970	2017-02-27 08:23:36.691395+00	525	f	13	37	50
10971	2017-02-27 08:23:36.716748+00	14	f	167	5	51
10972	2017-02-27 08:23:36.73142+00	29657	t	2	880	52
10973	2017-02-27 08:23:36.746635+00	636	f	10	48	53
10974	2017-02-27 08:23:36.778008+00	6	f	204	2	54
10975	2017-02-27 08:23:36.795356+00	39	f	133	2	55
10976	2017-02-27 08:23:36.812057+00	5	f	217	0	56
10977	2017-02-27 08:23:36.827384+00	4	f	224	1	57
10978	2017-02-27 08:23:36.841979+00	6	f	215	0	58
10979	2017-02-27 08:23:36.857373+00	6	f	213	3	59
10980	2017-02-27 08:23:36.871921+00	4	f	202	0	60
10981	2017-02-27 08:23:38.224651+00	7	f	190	0	62
10982	2017-02-27 08:23:39.914415+00	3	f	223	0	64
10983	2017-02-27 08:23:41.370402+00	43	f	114	2	66
10984	2017-02-27 08:23:41.474449+00	88	f	89	25	67
10985	2017-02-27 08:23:41.489149+00	4	f	189	1	68
10986	2017-02-27 08:23:41.504029+00	209	f	20	13	69
10987	2017-02-27 08:23:41.529089+00	6	f	179	3	70
10988	2017-02-27 08:23:41.543996+00	8	f	175	1	71
10989	2017-02-27 08:23:41.559107+00	2	f	216	0	72
10990	2017-02-27 08:23:41.574129+00	14355	f	5	850	73
10991	2017-02-27 08:23:41.589035+00	2	f	227	0	74
10992	2017-02-27 08:23:41.604153+00	3	f	198	0	75
10993	2017-02-27 08:23:41.619196+00	8	f	161	2	76
10994	2017-02-27 08:23:43.045943+00	2655	f	6	97	78
10995	2017-02-27 08:23:43.141803+00	2528	f	92	163	79
10996	2017-02-27 08:23:43.161366+00	678	f	8	29	80
10997	2017-02-27 08:23:44.769408+00	27	f	100	3	82
10998	2017-02-27 08:23:46.268941+00	4	f	158	6	84
10999	2017-02-27 08:23:46.382526+00	21	f	106	0	85
11000	2017-02-27 08:23:47.953585+00	6	f	164	2	87
11001	2017-02-27 08:23:48.026693+00	8	f	134	7	88
11002	2017-02-27 08:23:48.043669+00	3038	f	7	231	89
11003	2017-02-27 08:23:48.056394+00	1308	f	9	47	90
11004	2017-02-27 08:23:48.071565+00	216	f	11	7	91
11005	2017-02-27 08:23:48.086221+00	22	f	99	1	92
11006	2017-02-27 08:23:48.106379+00	18	f	101	0	93
11007	2017-02-27 08:23:48.121472+00	1	f	219	0	94
11008	2017-02-27 08:23:48.136212+00	7	f	126	1	95
11009	2017-02-27 08:23:48.151438+00	0	f	214	0	96
11010	2017-02-27 08:23:48.166124+00	1	f	212	0	97
11011	2017-02-27 08:23:48.181181+00	15	f	102	1	98
11012	2017-02-27 08:23:48.196078+00	0	f	203	1	99
11013	2017-02-27 08:33:29.201007+00	17573	f	152	693	1
11014	2017-02-27 08:33:29.282055+00	14038	f	112	385	2
11015	2017-02-27 08:33:29.299094+00	3612	f	132	62	3
11016	2017-02-27 08:33:29.311647+00	2318	f	120	214	4
11017	2017-02-27 08:33:29.328959+00	19618	f	88	855	5
11018	2017-02-27 08:33:29.34159+00	2534	f	109	31	6
11019	2017-02-27 08:33:29.35164+00	1362	f	123	46	7
11020	2017-02-27 08:33:29.361472+00	1502	f	115	31	8
11021	2017-02-27 08:33:29.371446+00	693	f	141	13	9
11022	2017-02-27 08:33:29.381532+00	414	f	151	15	10
11023	2017-02-27 08:33:29.391587+00	218	f	166	10	11
11024	2017-02-27 08:33:29.401579+00	633	f	128	3	12
11025	2017-02-27 08:33:29.411591+00	168	f	169	7	13
11026	2017-02-27 08:33:29.421522+00	413	f	139	8	14
11027	2017-02-27 08:33:29.431618+00	794	f	105	17	15
11028	2017-02-27 08:33:29.451665+00	628	f	104	11	16
11029	2017-02-27 08:33:29.461673+00	296	f	127	35	17
11030	2017-02-27 08:33:29.471566+00	59	f	178	14	18
11031	2017-02-27 08:33:30.952922+00	45	f	184	3	20
11032	2017-02-27 08:33:31.02688+00	60	f	170	12	21
11033	2017-02-27 08:33:31.046611+00	27	f	208	4	22
11034	2017-02-27 08:33:31.070391+00	29	f	193	3	24
11035	2017-02-27 08:33:31.086449+00	89	f	156	11	25
11036	2017-02-27 08:33:31.096106+00	25	f	201	3	26
11037	2017-02-27 08:33:31.106028+00	31	f	183	27	27
11038	2017-02-27 08:33:32.513396+00	167	f	125	16	29
11039	2017-02-27 08:33:32.660745+00	22	f	205	2	30
11040	2017-02-27 08:33:32.678037+00	20	f	197	0	31
11041	2017-02-27 08:33:34.060188+00	17	f	207	0	33
11042	2017-02-27 08:33:34.154706+00	205	f	107	9	34
11043	2017-02-27 08:33:34.176563+00	35	f	165	2	35
11044	2017-02-27 08:33:34.191674+00	30	f	171	5	36
11045	2017-02-27 08:33:34.20421+00	7	f	226	3	37
11046	2017-02-27 08:33:34.214147+00	14	f	188	0	38
11047	2017-02-27 08:33:34.224164+00	11	f	211	2	39
11048	2017-02-27 08:33:34.234062+00	2560	f	4	71	40
11049	2017-02-27 08:33:34.244145+00	436	f	31	4	41
11050	2017-02-27 08:33:34.254047+00	15	f	176	2	42
11051	2017-02-27 08:33:34.264063+00	8	f	194	2	43
11052	2017-02-27 08:33:34.274026+00	10	f	187	1	44
11053	2017-02-27 08:33:34.284106+00	42	f	148	2	45
11054	2017-02-27 08:33:34.294142+00	5	f	221	2	46
11055	2017-02-27 08:33:34.304063+00	113	f	98	2	47
11056	2017-02-27 08:33:34.314172+00	7	f	204	2	48
11057	2017-02-27 08:33:35.934549+00	15	f	168	1	50
11058	2017-02-27 08:33:35.999776+00	523	f	13	37	51
11059	2017-02-27 08:33:36.019443+00	13	f	167	5	52
11060	2017-02-27 08:33:36.029305+00	29648	t	2	880	53
11061	2017-02-27 08:33:36.039222+00	640	f	10	48	54
11062	2017-02-27 08:33:36.049171+00	40	f	133	2	55
11063	2017-02-27 08:33:36.059211+00	4	f	217	0	56
11064	2017-02-27 08:33:36.069313+00	4	f	224	2	57
11065	2017-02-27 08:33:36.079245+00	5	f	215	0	58
11066	2017-02-27 08:33:36.089126+00	5	f	213	3	59
11067	2017-02-27 08:33:36.099106+00	4	f	223	0	60
11068	2017-02-27 08:33:36.109112+00	6	f	202	0	61
11069	2017-02-27 08:33:37.442279+00	4	f	190	0	63
11070	2017-02-27 08:33:40.603143+00	42	f	114	2	66
11071	2017-02-27 08:33:40.671981+00	94	f	89	25	67
11072	2017-02-27 08:33:40.688363+00	5	f	189	1	68
11073	2017-02-27 08:33:40.701558+00	206	f	20	13	69
11074	2017-02-27 08:33:40.718301+00	6	f	179	3	70
11075	2017-02-27 08:33:40.731501+00	6	f	175	1	71
11076	2017-02-27 08:33:40.741411+00	3	f	216	0	72
11077	2017-02-27 08:33:40.751461+00	14351	f	5	850	73
11078	2017-02-27 08:33:40.761715+00	2	f	227	0	74
11079	2017-02-27 08:33:40.77158+00	3	f	198	0	75
11080	2017-02-27 08:33:40.781585+00	9	f	161	2	76
11081	2017-02-27 08:33:42.26326+00	2655	f	6	97	78
11082	2017-02-27 08:33:42.368855+00	2533	f	92	163	79
11083	2017-02-27 08:33:42.392676+00	682	f	8	29	80
11084	2017-02-27 08:33:43.84978+00	33	f	100	3	82
11085	2017-02-27 08:33:45.329509+00	3	f	158	6	84
11086	2017-02-27 08:33:45.404598+00	24	f	106	0	85
11087	2017-02-27 08:33:48.270527+00	3	f	164	2	88
11088	2017-02-27 08:33:48.342031+00	7	f	134	7	89
11089	2017-02-27 08:33:48.357871+00	3033	f	7	231	90
11090	2017-02-27 08:33:48.371944+00	1307	f	9	47	91
11091	2017-02-27 08:33:48.387641+00	220	f	11	7	92
11092	2017-02-27 08:33:48.401799+00	22	f	99	1	93
11093	2017-02-27 08:33:48.417779+00	20	f	101	0	94
11094	2017-02-27 08:33:48.431815+00	1	f	219	0	95
11095	2017-02-27 08:33:48.447812+00	9	f	126	1	96
11096	2017-02-27 08:33:48.461803+00	0	f	214	0	97
11097	2017-02-27 08:33:48.477716+00	0	f	210	1	98
11098	2017-02-27 08:33:48.491736+00	0	f	212	0	99
11099	2017-02-27 08:43:29.148023+00	17713	f	152	703	1
11100	2017-02-27 08:43:29.195014+00	14075	f	112	386	2
11101	2017-02-27 08:43:29.211572+00	3636	f	132	62	3
11102	2017-02-27 08:43:29.224505+00	2342	f	120	214	4
11103	2017-02-27 08:43:29.241406+00	19626	f	88	855	5
11104	2017-02-27 08:43:29.254437+00	2540	f	109	31	6
11105	2017-02-27 08:43:29.27045+00	1385	f	123	47	7
11106	2017-02-27 08:43:29.2845+00	1510	f	115	31	8
11107	2017-02-27 08:43:29.300446+00	700	f	141	13	9
11108	2017-02-27 08:43:29.314565+00	420	f	151	15	10
11109	2017-02-27 08:43:29.330715+00	222	f	166	10	11
11110	2017-02-27 08:43:29.345055+00	635	f	128	3	12
11111	2017-02-27 08:43:29.378689+00	172	f	169	7	13
11112	2017-02-27 08:43:29.38887+00	423	f	139	8	14
11113	2017-02-27 08:43:29.398804+00	796	f	105	17	15
11114	2017-02-27 08:43:29.408705+00	624	f	104	11	16
11115	2017-02-27 08:43:29.418627+00	294	f	127	35	17
11116	2017-02-27 08:43:29.42853+00	61	f	178	14	18
11117	2017-02-27 08:43:29.438563+00	49	f	184	3	19
11118	2017-02-27 08:43:30.922681+00	31	f	208	4	21
11119	2017-02-27 08:43:31.053236+00	34	f	193	3	22
11120	2017-02-27 08:43:31.063138+00	58	f	170	12	23
11121	2017-02-27 08:43:31.075789+00	29	f	201	3	25
11122	2017-02-27 08:43:31.082951+00	34	f	183	27	26
11123	2017-02-27 08:43:31.092844+00	95	f	156	11	27
11124	2017-02-27 08:43:32.548183+00	171	f	125	16	29
11125	2017-02-27 08:43:32.667444+00	23	f	205	2	30
11126	2017-02-27 08:43:32.677239+00	23	f	197	0	31
11127	2017-02-27 08:43:34.098013+00	16	f	207	0	33
11128	2017-02-27 08:43:34.181483+00	206	f	107	9	34
11129	2017-02-27 08:43:34.191303+00	37	f	165	2	35
11130	2017-02-27 08:43:34.201231+00	23	f	171	5	36
11131	2017-02-27 08:43:34.211172+00	8	f	226	3	37
11132	2017-02-27 08:43:34.221116+00	12	f	188	0	38
11133	2017-02-27 08:43:34.231138+00	8	f	211	2	39
11134	2017-02-27 08:43:34.24104+00	2558	f	4	71	40
11135	2017-02-27 08:43:34.251132+00	432	f	31	4	41
11136	2017-02-27 08:43:34.271256+00	14	f	176	2	42
11137	2017-02-27 08:43:34.281232+00	9	f	194	2	43
11138	2017-02-27 08:43:34.291172+00	10	f	187	1	44
11139	2017-02-27 08:43:34.301208+00	43	f	148	2	45
11140	2017-02-27 08:43:34.311258+00	7	f	221	2	46
11141	2017-02-27 08:43:34.321217+00	113	f	98	2	47
11142	2017-02-27 08:43:34.331293+00	6	f	204	2	48
11143	2017-02-27 08:43:36.298687+00	14	f	168	1	50
11144	2017-02-27 08:43:36.337132+00	524	f	13	38	51
11145	2017-02-27 08:43:36.346927+00	12	f	167	5	52
11146	2017-02-27 08:43:36.3568+00	29655	t	2	880	53
11147	2017-02-27 08:43:36.366768+00	637	f	10	48	54
11148	2017-02-27 08:43:36.38687+00	36	f	133	2	55
11149	2017-02-27 08:43:36.396918+00	3	f	217	0	56
11150	2017-02-27 08:43:36.406881+00	4	f	224	2	57
11151	2017-02-27 08:43:36.416805+00	5	f	215	0	58
11152	2017-02-27 08:43:36.426765+00	5	f	213	3	59
11153	2017-02-27 08:43:36.436833+00	5	f	223	0	60
11154	2017-02-27 08:43:39.228382+00	3	f	228	0	61
11155	2017-02-27 08:43:39.25537+00	5	f	202	0	62
11156	2017-02-27 08:43:40.547989+00	3	f	227	0	64
11157	2017-02-27 08:43:40.618768+00	5	f	190	0	65
11158	2017-02-27 08:43:40.628722+00	5	f	189	1	66
11159	2017-02-27 08:43:42.200301+00	7	f	179	3	68
11160	2017-02-27 08:43:43.756671+00	38	f	114	2	70
11161	2017-02-27 08:43:43.825934+00	90	f	89	25	71
11162	2017-02-27 08:43:43.836815+00	208	f	20	13	72
11163	2017-02-27 08:43:43.846856+00	9	f	175	1	73
11164	2017-02-27 08:43:43.856668+00	3	f	216	0	74
11165	2017-02-27 08:43:45.940309+00	2	f	229	0	75
11166	2017-02-27 08:43:45.952746+00	14353	f	5	850	76
11167	2017-02-27 08:43:45.962596+00	3	f	198	0	77
11168	2017-02-27 08:43:45.972416+00	9	f	161	2	78
11169	2017-02-27 08:43:45.982404+00	2656	f	6	97	79
11170	2017-02-27 08:43:45.992357+00	8	f	158	6	80
11171	2017-02-27 08:43:46.002359+00	2533	f	92	163	81
11172	2017-02-27 08:43:46.01228+00	33	f	100	3	82
11173	2017-02-27 08:43:46.022307+00	682	f	8	29	83
11174	2017-02-27 08:43:48.775994+00	21	f	106	0	86
11175	2017-02-27 08:43:53.032309+00	4	f	164	2	90
11176	2017-02-27 08:43:53.101587+00	3028	f	7	231	91
11177	2017-02-27 08:43:53.111434+00	1306	f	9	47	92
11178	2017-02-27 08:43:53.124468+00	216	f	11	7	93
11179	2017-02-27 08:43:53.141202+00	19	f	99	1	94
11180	2017-02-27 08:43:53.151264+00	7	f	134	7	95
11181	2017-02-27 08:43:53.161128+00	17	f	101	0	96
11182	2017-02-27 08:43:53.17126+00	1	f	219	0	97
11183	2017-02-27 08:43:53.181156+00	10	f	126	1	98
11184	2017-02-27 08:43:53.191099+00	0	f	214	0	99
11185	2017-02-27 08:53:30.504198+00	17857	f	152	712	1
11186	2017-02-27 08:53:30.621573+00	14080	f	112	386	2
11187	2017-02-27 08:53:30.675012+00	3652	f	132	62	3
11188	2017-02-27 08:53:30.70491+00	2362	f	120	215	4
11189	2017-02-27 08:53:30.735051+00	19637	f	88	855	5
11190	2017-02-27 08:53:30.796582+00	2551	f	109	31	6
11191	2017-02-27 08:53:30.826249+00	1386	f	123	47	7
11192	2017-02-27 08:53:30.871217+00	1516	f	115	31	8
11193	2017-02-27 08:53:30.896901+00	701	f	141	13	9
11194	2017-02-27 08:53:30.912289+00	423	f	151	15	10
11195	2017-02-27 08:53:30.925837+00	223	f	166	10	11
11196	2017-02-27 08:53:30.962139+00	645	f	128	3	12
11197	2017-02-27 08:53:30.976066+00	173	f	169	7	13
11198	2017-02-27 08:53:30.992023+00	419	f	139	8	14
11199	2017-02-27 08:53:31.006303+00	795	f	105	17	15
11200	2017-02-27 08:53:31.042614+00	636	f	104	11	16
11201	2017-02-27 08:53:31.05669+00	64	f	178	14	17
11202	2017-02-27 08:53:31.082932+00	292	f	127	35	18
11203	2017-02-27 08:53:31.096516+00	54	f	184	3	19
11204	2017-02-27 08:53:32.870464+00	36	f	208	4	21
11205	2017-02-27 08:53:33.091908+00	33	f	193	3	22
11206	2017-02-27 08:53:33.118026+00	60	f	170	12	23
11207	2017-02-27 08:53:33.134274+00	30	f	201	3	25
11208	2017-02-27 08:53:33.147871+00	97	f	156	11	26
11209	2017-02-27 08:53:33.161628+00	38	f	183	27	27
11210	2017-02-27 08:53:34.553458+00	172	f	125	16	29
11211	2017-02-27 08:53:34.60072+00	20	f	205	2	30
11212	2017-02-27 08:53:34.615835+00	22	f	197	0	31
11213	2017-02-27 08:53:35.976781+00	17	f	207	0	33
11214	2017-02-27 08:53:36.049527+00	205	f	107	9	34
11215	2017-02-27 08:53:36.075745+00	35	f	165	2	35
11216	2017-02-27 08:53:36.089212+00	27	f	171	5	36
11217	2017-02-27 08:53:36.103957+00	9	f	226	3	37
11218	2017-02-27 08:53:36.125796+00	12	f	211	2	38
11219	2017-02-27 08:53:36.139374+00	11	f	188	0	39
11220	2017-02-27 08:53:36.155803+00	15	f	176	2	40
11221	2017-02-27 08:53:36.169268+00	2564	f	4	71	41
11222	2017-02-27 08:53:36.199905+00	437	f	31	4	42
11223	2017-02-27 08:53:36.216584+00	10	f	194	2	43
11224	2017-02-27 08:53:36.229845+00	10	f	187	1	44
11225	2017-02-27 08:53:36.246432+00	41	f	148	2	45
11226	2017-02-27 08:53:36.259753+00	6	f	221	2	46
11227	2017-02-27 08:53:36.2897+00	113	f	98	2	47
11228	2017-02-27 08:53:36.304571+00	5	f	224	2	48
11229	2017-02-27 08:53:36.319742+00	7	f	204	2	49
11230	2017-02-27 08:53:37.995805+00	6	f	213	3	51
11231	2017-02-27 08:53:38.065024+00	14	f	168	1	52
11232	2017-02-27 08:53:38.091208+00	4	f	227	0	53
11233	2017-02-27 08:53:38.104559+00	525	f	13	38	54
11234	2017-02-27 08:53:38.119458+00	12	f	167	5	55
11235	2017-02-27 08:53:38.134355+00	29657	t	2	880	56
11236	2017-02-27 08:53:38.164447+00	640	f	10	48	57
11237	2017-02-27 08:53:38.179511+00	34	f	133	2	58
11238	2017-02-27 08:53:38.194468+00	5	f	217	0	59
11239	2017-02-27 08:53:38.209493+00	5	f	215	0	60
11240	2017-02-27 08:53:38.224514+00	3	f	223	0	61
11241	2017-02-27 08:53:38.23959+00	3	f	228	0	62
11242	2017-02-27 08:53:38.254646+00	6	f	202	0	63
11243	2017-02-27 08:53:39.552966+00	6	f	190	0	65
11244	2017-02-27 08:53:39.913575+00	4	f	189	1	66
11245	2017-02-27 08:53:41.535363+00	5	f	179	3	68
11246	2017-02-27 08:53:43.109788+00	42	f	114	2	70
11247	2017-02-27 08:53:43.233577+00	94	f	89	25	71
11248	2017-02-27 08:53:43.247822+00	209	f	20	13	72
11249	2017-02-27 08:53:43.278179+00	7	f	175	1	73
11250	2017-02-27 08:53:43.295344+00	3	f	216	0	74
11251	2017-02-27 08:53:43.308023+00	14353	f	5	850	75
11252	2017-02-27 08:53:43.323389+00	4	f	203	1	76
11253	2017-02-27 08:53:43.337816+00	2	f	198	0	77
11254	2017-02-27 08:53:43.353167+00	7	f	161	2	78
11255	2017-02-27 08:53:43.367739+00	2	f	219	0	79
11256	2017-02-27 08:53:43.383205+00	2655	f	6	97	80
11257	2017-02-27 08:53:43.404874+00	9	f	158	6	81
11258	2017-02-27 08:53:43.417759+00	2531	f	92	163	82
11259	2017-02-27 08:53:43.447879+00	32	f	100	3	83
11260	2017-02-27 08:53:43.463302+00	686	f	8	29	84
11261	2017-02-27 08:53:46.341954+00	23	f	106	0	87
11262	2017-02-27 08:53:47.860735+00	1	f	229	1	89
11263	2017-02-27 08:53:50.94557+00	6	f	164	2	92
11264	2017-02-27 08:53:51.003849+00	11	f	134	7	93
11265	2017-02-27 08:53:51.017563+00	3033	f	7	231	94
11266	2017-02-27 08:53:51.033448+00	1306	f	9	47	95
11267	2017-02-27 08:53:51.047443+00	23	f	99	1	96
11268	2017-02-27 08:53:51.063367+00	217	f	11	7	97
11269	2017-02-27 08:53:51.077331+00	19	f	101	0	98
11270	2017-02-27 08:53:51.095463+00	9	f	126	1	99
11271	2017-02-27 09:03:29.955268+00	17960	f	152	718	1
11272	2017-02-27 09:03:30.070051+00	14100	f	112	387	2
11273	2017-02-27 09:03:30.086822+00	3676	f	132	62	3
11274	2017-02-27 09:03:30.099287+00	2375	f	120	215	4
11275	2017-02-27 09:03:30.116755+00	19644	f	88	856	5
11276	2017-02-27 09:03:30.136249+00	2551	f	109	31	6
11277	2017-02-27 09:03:30.149197+00	1402	f	123	47	7
11278	2017-02-27 09:03:30.158973+00	1524	f	115	31	8
11279	2017-02-27 09:03:30.169557+00	703	f	141	13	9
11280	2017-02-27 09:03:30.179111+00	429	f	151	15	10
11281	2017-02-27 09:03:30.239886+00	228	f	166	10	11
11282	2017-02-27 09:03:30.267287+00	646	f	128	3	12
11283	2017-02-27 09:03:30.333017+00	178	f	169	7	13
11284	2017-02-27 09:03:30.370209+00	422	f	139	8	14
11285	2017-02-27 09:03:30.407612+00	803	f	105	17	15
11286	2017-02-27 09:03:30.42762+00	629	f	104	11	16
11287	2017-02-27 09:03:30.440172+00	64	f	178	15	17
11288	2017-02-27 09:03:30.450194+00	296	f	127	35	18
11289	2017-02-27 09:03:30.460828+00	50	f	184	3	19
11290	2017-02-27 09:03:31.956224+00	36	f	208	4	21
11291	2017-02-27 09:03:32.032707+00	37	f	193	3	22
11292	2017-02-27 09:03:32.048673+00	62	f	170	12	23
11293	2017-02-27 09:03:32.064271+00	39	f	183	28	24
11294	2017-02-27 09:03:32.081291+00	96	f	156	12	26
11295	2017-02-27 09:03:32.09403+00	27	f	201	3	27
11296	2017-02-27 09:03:33.440319+00	175	f	125	16	29
11297	2017-02-27 09:03:33.516181+00	23	f	197	0	30
11298	2017-02-27 09:03:33.532256+00	20	f	205	2	31
11299	2017-02-27 09:03:34.912643+00	17	f	207	0	33
11300	2017-02-27 09:03:34.972036+00	207	f	107	9	34
11301	2017-02-27 09:03:34.985831+00	39	f	165	2	35
11302	2017-02-27 09:03:35.001836+00	8	f	226	3	36
11303	2017-02-27 09:03:35.01588+00	27	f	171	5	37
11304	2017-02-27 09:03:35.031741+00	11	f	211	2	38
11305	2017-02-27 09:03:35.045888+00	13	f	188	0	39
11306	2017-02-27 09:03:35.061946+00	16	f	176	1	40
11307	2017-02-27 09:03:35.075947+00	2564	f	4	71	41
11308	2017-02-27 09:03:35.092084+00	437	f	31	4	42
11309	2017-02-27 09:03:35.106037+00	9	f	194	2	43
11310	2017-02-27 09:03:35.12232+00	10	f	187	1	44
11311	2017-02-27 09:03:35.136089+00	44	f	148	2	45
11312	2017-02-27 09:03:35.152316+00	6	f	221	2	46
11313	2017-02-27 09:03:35.166187+00	111	f	98	2	47
11314	2017-02-27 09:03:35.182345+00	5	f	224	2	48
11315	2017-02-27 09:03:35.196275+00	7	f	204	2	49
11316	2017-02-27 09:03:36.888098+00	7	f	213	3	51
11317	2017-02-27 09:03:37.005631+00	16	f	168	1	52
11318	2017-02-27 09:03:37.037833+00	4	f	227	0	53
11319	2017-02-27 09:03:37.067972+00	529	f	13	38	54
11320	2017-02-27 09:03:37.081647+00	15	f	167	5	55
11321	2017-02-27 09:03:37.097665+00	29660	t	2	880	56
11322	2017-02-27 09:03:37.111423+00	642	f	10	48	57
11323	2017-02-27 09:03:37.127599+00	34	f	133	2	58
11324	2017-02-27 09:03:37.141232+00	5	f	217	0	59
11325	2017-02-27 09:03:37.157423+00	5	f	215	0	60
11326	2017-02-27 09:03:37.171248+00	5	f	223	0	61
11327	2017-02-27 09:03:38.659919+00	3	f	202	0	63
11328	2017-02-27 09:03:40.058144+00	4	f	190	0	65
11329	2017-02-27 09:03:40.156484+00	5	f	189	1	66
11330	2017-02-27 09:03:41.8196+00	7	f	179	3	68
11331	2017-02-27 09:03:41.89027+00	4	f	203	1	69
11332	2017-02-27 09:03:41.911804+00	43	f	114	2	70
11333	2017-02-27 09:03:41.937951+00	94	f	89	25	71
11334	2017-02-27 09:03:41.953538+00	205	f	20	13	72
11335	2017-02-27 09:03:41.970354+00	7	f	175	1	73
11336	2017-02-27 09:03:41.983537+00	4	f	216	0	74
11337	2017-02-27 09:03:41.998021+00	14352	f	5	851	75
11338	2017-02-27 09:03:42.013681+00	3	f	198	0	76
11339	2017-02-27 09:03:42.030446+00	7	f	161	2	77
11340	2017-02-27 09:03:42.043743+00	2	f	219	0	78
11341	2017-02-27 09:03:42.058324+00	6	f	158	6	79
11342	2017-02-27 09:03:42.073745+00	2655	f	6	97	80
11343	2017-02-27 09:03:42.088302+00	2529	f	92	163	81
11344	2017-02-27 09:03:42.110592+00	29	f	100	3	82
11345	2017-02-27 09:03:42.130643+00	681	f	8	29	83
11346	2017-02-27 09:03:44.871939+00	28	f	106	0	86
11347	2017-02-27 09:03:46.458027+00	1	f	228	0	88
11348	2017-02-27 09:03:46.530642+00	0	f	229	1	89
11349	2017-02-27 09:03:48.618638+00	12	f	134	7	91
11350	2017-02-27 09:03:50.081814+00	2	f	164	2	93
11351	2017-02-27 09:03:50.164715+00	3030	f	7	231	94
11352	2017-02-27 09:03:50.179716+00	1312	f	9	47	95
11353	2017-02-27 09:03:50.19443+00	20	f	99	1	96
11354	2017-02-27 09:03:50.214566+00	221	f	11	7	97
11355	2017-02-27 09:03:50.229779+00	20	f	101	0	98
11356	2017-02-27 09:03:50.244478+00	9	f	126	1	99
11357	2017-02-27 09:13:30.22877+00	18072	f	152	726	1
11358	2017-02-27 09:13:30.346969+00	14129	f	112	387	2
11359	2017-02-27 09:13:30.402022+00	3701	f	132	62	3
11360	2017-02-27 09:13:30.432657+00	2384	f	120	215	4
11361	2017-02-27 09:13:30.446739+00	19646	f	88	856	5
11362	2017-02-27 09:13:30.461838+00	2553	f	109	31	6
11363	2017-02-27 09:13:30.476655+00	1414	f	123	47	7
11364	2017-02-27 09:13:30.491955+00	1538	f	115	31	8
11365	2017-02-27 09:13:30.506782+00	705	f	141	14	9
11366	2017-02-27 09:13:30.521943+00	434	f	151	15	10
11367	2017-02-27 09:13:30.5368+00	229	f	166	10	11
11368	2017-02-27 09:13:30.55208+00	649	f	128	3	12
11369	2017-02-27 09:13:30.587301+00	178	f	169	7	13
11370	2017-02-27 09:13:30.602842+00	418	f	139	9	14
11371	2017-02-27 09:13:30.617632+00	800	f	105	17	15
11372	2017-02-27 09:13:30.632647+00	66	f	178	16	16
11373	2017-02-27 09:13:30.647441+00	629	f	104	11	17
11374	2017-02-27 09:13:30.662623+00	296	f	127	35	18
11375	2017-02-27 09:13:30.677361+00	53	f	184	3	19
11376	2017-02-27 09:13:30.6926+00	37	f	208	4	20
11377	2017-02-27 09:13:32.44249+00	34	f	193	3	22
11378	2017-02-27 09:13:32.569958+00	62	f	170	12	23
11379	2017-02-27 09:13:32.583397+00	39	f	183	28	24
11380	2017-02-27 09:13:32.601099+00	28	f	201	3	26
11381	2017-02-27 09:13:32.61308+00	95	f	156	12	27
11382	2017-02-27 09:13:33.969422+00	23	f	205	2	29
11383	2017-02-27 09:13:34.042021+00	170	f	125	16	30
11384	2017-02-27 09:13:34.056819+00	23	f	197	0	31
11385	2017-02-27 09:13:35.447799+00	17	f	207	0	33
11386	2017-02-27 09:13:35.47584+00	9	f	226	3	34
11387	2017-02-27 09:13:35.505616+00	211	f	107	9	35
11388	2017-02-27 09:13:35.520478+00	36	f	165	2	36
11389	2017-02-27 09:13:35.535579+00	29	f	171	5	37
11390	2017-02-27 09:13:35.550422+00	10	f	211	2	38
11391	2017-02-27 09:13:35.565556+00	13	f	188	0	39
11392	2017-02-27 09:13:35.580409+00	16	f	176	1	40
11393	2017-02-27 09:13:35.595635+00	2559	f	4	71	41
11394	2017-02-27 09:13:35.662043+00	439	f	31	4	42
11395	2017-02-27 09:13:35.672088+00	12	f	187	1	43
11396	2017-02-27 09:13:35.681963+00	10	f	194	2	44
11397	2017-02-27 09:13:35.691775+00	45	f	148	2	45
11398	2017-02-27 09:13:35.701677+00	6	f	221	2	46
11399	2017-02-27 09:13:35.711767+00	115	f	98	2	47
11400	2017-02-27 09:13:35.722994+00	6	f	224	2	48
11401	2017-02-27 09:13:35.731544+00	6	f	204	2	49
11402	2017-02-27 09:13:37.363768+00	5	f	213	3	51
11403	2017-02-27 09:13:37.426723+00	13	f	168	1	52
11404	2017-02-27 09:13:37.436516+00	4	f	227	0	53
11405	2017-02-27 09:13:37.44646+00	520	f	13	38	54
11406	2017-02-27 09:13:37.456312+00	14	f	167	5	55
11407	2017-02-27 09:13:37.466311+00	29649	t	2	880	56
11408	2017-02-27 09:13:37.476303+00	643	f	10	48	57
11409	2017-02-27 09:13:37.496299+00	41	f	133	2	58
11410	2017-02-27 09:13:37.506346+00	4	f	217	0	59
11411	2017-02-27 09:13:37.516407+00	5	f	215	0	60
11412	2017-02-27 09:13:37.52644+00	3	f	223	0	61
11413	2017-02-27 09:13:38.982503+00	4	f	202	0	63
11414	2017-02-27 09:13:39.050964+00	6	f	179	3	64
11415	2017-02-27 09:13:40.403742+00	6	f	190	0	66
11416	2017-02-27 09:13:40.485102+00	5	f	189	1	67
11417	2017-02-27 09:13:42.183394+00	3	f	203	1	69
11418	2017-02-27 09:13:42.249197+00	39	f	114	2	70
11419	2017-02-27 09:13:42.259066+00	89	f	89	25	71
11420	2017-02-27 09:13:42.268949+00	205	f	20	13	72
11421	2017-02-27 09:13:42.278986+00	6	f	175	1	73
11422	2017-02-27 09:13:42.288946+00	2	f	216	0	74
11423	2017-02-27 09:13:42.298859+00	14354	f	5	851	75
11424	2017-02-27 09:13:42.30882+00	3	f	198	0	76
11425	2017-02-27 09:13:42.318824+00	9	f	161	2	77
11426	2017-02-27 09:13:42.328912+00	2	f	219	0	78
11427	2017-02-27 09:13:42.338827+00	7	f	158	6	79
11428	2017-02-27 09:13:42.348715+00	2662	f	6	97	80
11429	2017-02-27 09:13:42.358802+00	2533	f	92	163	81
11430	2017-02-27 09:13:42.368863+00	30	f	100	3	82
11431	2017-02-27 09:13:42.388956+00	683	f	8	29	83
11432	2017-02-27 09:13:45.101154+00	28	f	106	0	86
11433	2017-02-27 09:13:46.650554+00	1	f	228	0	88
11434	2017-02-27 09:13:46.701151+00	0	f	229	1	89
11435	2017-02-27 09:13:48.273249+00	14	f	134	7	91
11436	2017-02-27 09:13:49.659624+00	3	f	164	2	93
11437	2017-02-27 09:13:49.729315+00	3029	f	7	231	94
11438	2017-02-27 09:13:49.73918+00	1310	f	9	47	95
11439	2017-02-27 09:13:49.75216+00	25	f	99	1	96
11440	2017-02-27 09:13:49.767911+00	217	f	11	7	97
11441	2017-02-27 09:13:49.779004+00	17	f	101	0	98
11442	2017-02-27 09:13:49.789003+00	10	f	126	1	99
11443	2017-02-27 09:23:30.414287+00	18196	f	152	730	1
11444	2017-02-27 09:23:30.48528+00	14145	f	112	387	2
11445	2017-02-27 09:23:30.500266+00	3716	f	132	62	3
11446	2017-02-27 09:23:30.51497+00	2402	f	120	217	4
11447	2017-02-27 09:23:30.530028+00	19656	f	88	856	5
11448	2017-02-27 09:23:30.545063+00	2568	f	109	31	6
11449	2017-02-27 09:23:30.559991+00	1420	f	123	47	7
11450	2017-02-27 09:23:30.574642+00	1534	f	115	31	8
11451	2017-02-27 09:23:30.590018+00	719	f	141	14	9
11452	2017-02-27 09:23:30.604686+00	444	f	151	15	10
11453	2017-02-27 09:23:30.62007+00	235	f	166	10	11
11454	2017-02-27 09:23:30.640175+00	648	f	128	3	12
11455	2017-02-27 09:23:30.654884+00	186	f	169	7	13
11456	2017-02-27 09:23:30.68539+00	424	f	139	9	14
11457	2017-02-27 09:23:30.700425+00	810	f	105	17	15
11458	2017-02-27 09:23:30.734223+00	70	f	178	16	16
11459	2017-02-27 09:23:30.756244+00	632	f	104	11	17
11460	2017-02-27 09:23:30.771319+00	56	f	184	3	18
11461	2017-02-27 09:23:30.79582+00	41	f	208	4	19
11462	2017-02-27 09:23:30.825238+00	303	f	127	35	20
11463	2017-02-27 09:23:32.362671+00	38	f	193	3	22
11464	2017-02-27 09:23:32.660804+00	44	f	183	28	23
11465	2017-02-27 09:23:32.681232+00	65	f	170	12	24
11466	2017-02-27 09:23:32.699177+00	28	f	201	3	26
11467	2017-02-27 09:23:32.710861+00	99	f	156	12	27
11468	2017-02-27 09:23:34.070424+00	22	f	205	2	29
11469	2017-02-27 09:23:34.14059+00	171	f	125	16	30
11470	2017-02-27 09:23:34.154852+00	24	f	197	0	31
11471	2017-02-27 09:23:35.612051+00	11	f	226	3	33
11472	2017-02-27 09:23:35.687469+00	18	f	207	0	34
11473	2017-02-27 09:23:35.698779+00	28	f	171	5	35
11474	2017-02-27 09:23:35.714259+00	209	f	107	9	36
11475	2017-02-27 09:23:35.743666+00	39	f	165	2	37
11476	2017-02-27 09:23:35.758863+00	12	f	211	2	38
11477	2017-02-27 09:23:35.774173+00	17	f	176	1	39
11478	2017-02-27 09:23:35.788766+00	15	f	188	0	40
11479	2017-02-27 09:23:35.804148+00	442	f	31	4	41
11480	2017-02-27 09:23:35.89571+00	2565	f	4	71	42
11481	2017-02-27 09:23:35.920027+00	11	f	187	1	43
11482	2017-02-27 09:23:35.935053+00	8	f	221	2	44
11483	2017-02-27 09:23:35.94986+00	9	f	194	2	45
11484	2017-02-27 09:23:35.964826+00	37	f	148	2	46
11485	2017-02-27 09:23:37.466124+00	114	f	98	2	48
11486	2017-02-27 09:23:37.584898+00	5	f	224	2	49
11487	2017-02-27 09:23:37.604692+00	6	f	204	2	50
11488	2017-02-27 09:23:39.350209+00	7	f	213	3	52
11489	2017-02-27 09:23:39.419628+00	5	f	190	0	53
11490	2017-02-27 09:23:39.43433+00	13	f	168	1	54
11491	2017-02-27 09:23:39.449219+00	522	f	13	38	55
11492	2017-02-27 09:23:39.469207+00	12	f	167	5	56
11493	2017-02-27 09:23:39.484258+00	29653	t	2	880	57
11494	2017-02-27 09:23:39.499241+00	635	f	10	48	58
11495	2017-02-27 09:23:39.514246+00	37	f	133	2	59
11496	2017-02-27 09:23:39.539288+00	7	f	217	0	60
11497	2017-02-27 09:23:39.554306+00	5	f	215	0	61
11498	2017-02-27 09:23:39.569173+00	4	f	223	0	62
11499	2017-02-27 09:23:39.58448+00	5	f	202	0	63
11500	2017-02-27 09:23:39.599311+00	7	f	179	3	64
11501	2017-02-27 09:23:40.896789+00	3	f	227	0	66
11502	2017-02-27 09:23:40.991448+00	5	f	189	1	67
11503	2017-02-27 09:23:42.708327+00	4	f	203	1	69
11504	2017-02-27 09:23:42.836063+00	41	f	114	2	70
11505	2017-02-27 09:23:42.858155+00	92	f	89	25	71
11506	2017-02-27 09:23:42.87319+00	209	f	20	13	72
11507	2017-02-27 09:23:42.904926+00	6	f	175	1	73
11508	2017-02-27 09:23:42.920145+00	2	f	216	0	74
11509	2017-02-27 09:23:42.935006+00	14351	f	5	851	75
11510	2017-02-27 09:23:42.950253+00	3	f	198	0	76
11511	2017-02-27 09:23:42.96485+00	6	f	161	2	77
11512	2017-02-27 09:23:42.980191+00	2	f	219	0	78
11513	2017-02-27 09:23:42.994836+00	6	f	158	6	79
11514	2017-02-27 09:23:43.010164+00	2653	f	6	97	80
11515	2017-02-27 09:23:43.024809+00	2535	f	92	163	81
11516	2017-02-27 09:23:43.040222+00	33	f	100	3	82
11517	2017-02-27 09:23:43.059903+00	683	f	8	29	83
11518	2017-02-27 09:23:44.369597+00	6	f	164	2	85
11519	2017-02-27 09:23:45.839249+00	26	f	106	0	87
11520	2017-02-27 09:23:47.853561+00	1	f	230	0	88
11521	2017-02-27 09:23:49.278796+00	0	f	228	0	90
11522	2017-02-27 09:23:52.262116+00	10	f	134	7	93
11523	2017-02-27 09:23:52.330483+00	25	f	99	1	94
11524	2017-02-27 09:23:52.347165+00	3031	f	7	231	95
11525	2017-02-27 09:23:52.360125+00	1310	f	9	47	96
11526	2017-02-27 09:23:52.375569+00	220	f	11	7	97
11527	2017-02-27 09:23:52.38996+00	16	f	101	0	98
11528	2017-02-27 09:23:52.405521+00	7	f	126	1	99
11529	2017-02-27 09:33:30.493901+00	18301	f	152	738	1
11530	2017-02-27 09:33:30.591166+00	14176	f	112	389	2
11531	2017-02-27 09:33:30.65551+00	3740	f	132	62	3
11532	2017-02-27 09:33:30.670804+00	2407	f	120	220	4
11533	2017-02-27 09:33:30.684864+00	19660	f	88	856	5
11534	2017-02-27 09:33:30.700862+00	2566	f	109	31	6
11535	2017-02-27 09:33:30.714728+00	1425	f	123	47	7
11536	2017-02-27 09:33:30.730626+00	1542	f	115	31	8
11537	2017-02-27 09:33:30.744665+00	723	f	141	14	9
11538	2017-02-27 09:33:30.760714+00	444	f	151	15	10
11539	2017-02-27 09:33:30.774775+00	241	f	166	10	11
11540	2017-02-27 09:33:30.790876+00	653	f	128	3	12
11541	2017-02-27 09:33:30.80488+00	188	f	169	7	13
11542	2017-02-27 09:33:30.820947+00	430	f	139	9	14
11543	2017-02-27 09:33:30.834937+00	814	f	105	17	15
11544	2017-02-27 09:33:30.851052+00	73	f	178	17	16
11545	2017-02-27 09:33:30.864971+00	45	f	208	4	17
11546	2017-02-27 09:33:30.880998+00	64	f	184	3	18
11547	2017-02-27 09:33:30.895002+00	635	f	104	11	19
11548	2017-02-27 09:33:30.905059+00	300	f	127	35	20
11549	2017-02-27 09:33:30.9212+00	39	f	193	3	21
11550	2017-02-27 09:33:32.398418+00	44	f	183	28	23
11551	2017-02-27 09:33:32.49827+00	66	f	170	12	24
11552	2017-02-27 09:33:32.51593+00	32	f	201	3	25
11553	2017-02-27 09:33:32.532172+00	93	f	156	12	27
11554	2017-02-27 09:33:33.938821+00	22	f	205	2	29
11555	2017-02-27 09:33:33.959684+00	15	f	226	3	30
11556	2017-02-27 09:33:33.973332+00	177	f	125	16	31
11557	2017-02-27 09:33:33.989558+00	24	f	197	0	32
11558	2017-02-27 09:33:35.283148+00	35	f	171	5	34
11559	2017-02-27 09:33:35.35734+00	42	f	165	2	35
11560	2017-02-27 09:33:35.373581+00	212	f	107	9	36
11561	2017-02-27 09:33:35.387185+00	12	f	211	2	37
11562	2017-02-27 09:33:35.403402+00	18	f	176	1	38
11563	2017-02-27 09:33:35.423705+00	13	f	188	0	39
11564	2017-02-27 09:33:35.436929+00	8	f	221	2	40
11565	2017-02-27 09:33:35.446736+00	445	f	31	4	41
11566	2017-02-27 09:33:35.456717+00	2562	f	4	71	42
11567	2017-02-27 09:33:35.466885+00	9	f	187	1	43
11568	2017-02-27 09:33:36.886815+00	6	f	224	2	45
11569	2017-02-27 09:33:36.941214+00	41	f	148	2	46
11570	2017-02-27 09:33:36.957649+00	10	f	194	2	47
11571	2017-02-27 09:33:36.970995+00	114	f	98	2	48
11572	2017-02-27 09:33:36.987683+00	6	f	217	0	49
11573	2017-02-27 09:33:37.000983+00	7	f	204	2	50
11574	2017-02-27 09:33:37.010966+00	6	f	215	0	51
11575	2017-02-27 09:33:38.60447+00	5	f	213	3	53
11576	2017-02-27 09:33:38.676337+00	15	f	167	5	54
11577	2017-02-27 09:33:38.692521+00	4	f	223	0	55
11578	2017-02-27 09:33:38.705568+00	8	f	190	0	56
11579	2017-02-27 09:33:38.722185+00	14	f	168	1	57
11580	2017-02-27 09:33:38.735514+00	36	f	133	2	58
11581	2017-02-27 09:33:38.745457+00	526	f	13	38	59
11582	2017-02-27 09:33:38.762062+00	29654	t	2	880	60
11583	2017-02-27 09:33:38.775395+00	639	f	10	48	61
11584	2017-02-27 09:33:38.785484+00	4	f	202	0	62
11585	2017-02-27 09:33:38.795596+00	6	f	203	1	63
11586	2017-02-27 09:33:40.132352+00	6	f	189	1	65
11587	2017-02-27 09:33:40.156173+00	7	f	179	3	66
11588	2017-02-27 09:33:40.169132+00	3	f	227	0	67
11589	2017-02-27 09:33:41.738442+00	44	f	114	2	69
11590	2017-02-27 09:33:41.864284+00	91	f	89	25	70
11591	2017-02-27 09:33:41.880919+00	207	f	20	13	71
11592	2017-02-27 09:33:41.933827+00	8	f	175	1	72
11593	2017-02-27 09:33:41.94375+00	3	f	216	0	73
11594	2017-02-27 09:33:41.953563+00	14350	f	5	851	74
11595	2017-02-27 09:33:41.963585+00	4	f	198	0	75
11596	2017-02-27 09:33:41.973487+00	8	f	161	2	76
11597	2017-02-27 09:33:41.983607+00	2	f	219	0	77
11598	2017-02-27 09:33:41.99356+00	12	f	158	6	78
11599	2017-02-27 09:33:42.003634+00	2653	f	6	97	79
11600	2017-02-27 09:33:42.013626+00	2533	f	92	163	80
11601	2017-02-27 09:33:42.023655+00	33	f	100	3	81
11602	2017-02-27 09:33:42.040917+00	684	f	8	29	82
11603	2017-02-27 09:33:43.424465+00	3	f	164	2	84
11604	2017-02-27 09:33:43.478032+00	25	f	106	0	85
11605	2017-02-27 09:33:43.495021+00	1	f	230	0	86
11606	2017-02-27 09:33:46.633053+00	0	f	228	0	89
11607	2017-02-27 09:33:48.291172+00	8	f	134	7	91
11608	2017-02-27 09:33:49.675604+00	23	f	99	1	93
11609	2017-02-27 09:33:49.824154+00	3030	f	7	231	94
11610	2017-02-27 09:33:49.833941+00	1306	f	9	47	95
11611	2017-02-27 09:33:49.843909+00	218	f	11	7	96
11612	2017-02-27 09:33:49.853822+00	19	f	101	0	97
11613	2017-02-27 09:33:49.863682+00	11	f	126	1	98
11614	2017-02-27 09:33:49.873742+00	17	f	102	1	99
11615	2017-02-27 09:43:31.354033+00	18404	f	152	738	1
11616	2017-02-27 09:43:31.586347+00	14189	f	112	389	2
11617	2017-02-27 09:43:31.600962+00	3770	f	132	63	3
11618	2017-02-27 09:43:31.615803+00	2428	f	120	220	4
11619	2017-02-27 09:43:31.640984+00	19652	f	88	856	5
11620	2017-02-27 09:43:31.660945+00	2573	f	109	31	6
11621	2017-02-27 09:43:31.675872+00	1433	f	123	47	7
11622	2017-02-27 09:43:31.701003+00	1549	f	115	31	8
11623	2017-02-27 09:43:31.715976+00	724	f	141	14	9
11624	2017-02-27 09:43:31.751259+00	456	f	151	15	10
11625	2017-02-27 09:43:31.766507+00	242	f	166	10	11
11626	2017-02-27 09:43:31.78153+00	653	f	128	3	12
11627	2017-02-27 09:43:31.801536+00	187	f	169	7	13
11628	2017-02-27 09:43:31.821595+00	429	f	139	9	14
11629	2017-02-27 09:43:31.836515+00	810	f	105	17	15
11630	2017-02-27 09:43:31.861867+00	71	f	178	17	16
11631	2017-02-27 09:43:31.876599+00	61	f	184	3	17
11632	2017-02-27 09:43:31.901785+00	637	f	104	11	18
11633	2017-02-27 09:43:31.91669+00	44	f	208	4	19
11634	2017-02-27 09:43:31.941857+00	303	f	127	35	20
11635	2017-02-27 09:43:31.956834+00	46	f	193	3	21
11636	2017-02-27 09:43:33.380437+00	44	f	183	28	23
11637	2017-02-27 09:43:33.498908+00	63	f	170	12	24
11638	2017-02-27 09:43:33.526428+00	29	f	201	3	25
11639	2017-02-27 09:43:33.549896+00	95	f	156	12	27
11640	2017-02-27 09:43:34.926642+00	25	f	205	2	29
11641	2017-02-27 09:43:34.999505+00	15	f	226	3	30
11642	2017-02-27 09:43:35.020854+00	177	f	125	16	31
11643	2017-02-27 09:43:35.035296+00	24	f	197	0	32
11644	2017-02-27 09:43:36.377582+00	33	f	171	5	34
11645	2017-02-27 09:43:36.515053+00	39	f	165	2	35
11646	2017-02-27 09:43:36.529235+00	211	f	107	9	36
11647	2017-02-27 09:43:36.782684+00	15	f	211	2	37
11648	2017-02-27 09:43:36.795451+00	18	f	176	1	38
11649	2017-02-27 09:43:36.809987+00	16	f	188	0	39
11650	2017-02-27 09:43:36.82527+00	9	f	221	2	40
11651	2017-02-27 09:43:36.839739+00	443	f	31	4	41
11652	2017-02-27 09:43:36.855146+00	2563	f	4	71	42
11653	2017-02-27 09:43:36.869832+00	12	f	187	1	43
11654	2017-02-27 09:43:38.294458+00	7	f	224	2	45
11655	2017-02-27 09:43:38.364343+00	43	f	148	2	46
11656	2017-02-27 09:43:38.379072+00	9	f	194	2	47
11657	2017-02-27 09:43:38.393644+00	8	f	190	0	48
11658	2017-02-27 09:43:38.409012+00	117	f	98	2	49
11659	2017-02-27 09:43:38.423836+00	7	f	217	0	50
11660	2017-02-27 09:43:38.439175+00	7	f	204	2	51
11661	2017-02-27 09:43:38.453732+00	6	f	215	0	52
11662	2017-02-27 09:43:40.140866+00	6	f	213	3	54
11663	2017-02-27 09:43:40.199489+00	13	f	167	5	55
11664	2017-02-27 09:43:40.214372+00	5	f	223	0	56
11665	2017-02-27 09:43:40.22898+00	13	f	168	1	57
11666	2017-02-27 09:43:40.244199+00	38	f	133	2	58
11667	2017-02-27 09:43:40.25888+00	526	f	13	38	59
11668	2017-02-27 09:43:40.274209+00	29663	t	2	880	60
11669	2017-02-27 09:43:40.288764+00	642	f	10	48	61
11670	2017-02-27 09:43:40.30412+00	7	f	202	0	62
11671	2017-02-27 09:43:40.318816+00	7	f	203	1	63
11672	2017-02-27 09:43:41.520088+00	7	f	189	1	65
11673	2017-02-27 09:43:41.628505+00	8	f	179	3	66
11674	2017-02-27 09:43:41.643199+00	3	f	227	0	67
11675	2017-02-27 09:43:44.390378+00	41	f	114	2	69
11676	2017-02-27 09:43:44.460671+00	92	f	89	25	70
11677	2017-02-27 09:43:44.51354+00	210	f	20	13	71
11678	2017-02-27 09:43:44.530531+00	6	f	175	1	72
11679	2017-02-27 09:43:44.545699+00	4	f	216	0	73
11680	2017-02-27 09:43:44.56029+00	14360	f	5	851	74
11681	2017-02-27 09:43:44.580688+00	2	f	198	0	75
11682	2017-02-27 09:43:44.595528+00	7	f	161	2	76
11683	2017-02-27 09:43:44.610286+00	2	f	219	0	77
11684	2017-02-27 09:43:44.625463+00	8	f	158	6	78
11685	2017-02-27 09:43:44.640301+00	2656	f	6	97	79
11686	2017-02-27 09:43:44.655488+00	2529	f	92	163	80
11687	2017-02-27 09:43:44.670427+00	34	f	100	3	81
11688	2017-02-27 09:43:44.695779+00	690	f	8	29	82
11689	2017-02-27 09:43:45.970419+00	7	f	164	2	84
11690	2017-02-27 09:43:46.040087+00	25	f	106	0	85
11691	2017-02-27 09:43:46.054745+00	1	f	230	0	86
11692	2017-02-27 09:43:48.919615+00	0	f	228	0	89
11693	2017-02-27 09:43:48.992672+00	0	f	229	1	90
11694	2017-02-27 09:43:50.718856+00	12	f	134	7	92
11695	2017-02-27 09:43:52.126947+00	24	f	99	1	94
11696	2017-02-27 09:43:52.233702+00	3036	f	7	231	95
11697	2017-02-27 09:43:52.255345+00	1317	f	9	47	96
11698	2017-02-27 09:43:52.275998+00	218	f	11	7	97
11699	2017-02-27 09:43:52.290939+00	16	f	101	0	98
11700	2017-02-27 09:43:52.305963+00	9	f	126	1	99
\.


--
-- Name: reddit_redditpostsnapshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reddit_redditpostsnapshot_id_seq', 11700, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blogpost blog_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost blog_blogpost_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: easy_thumbnails_source easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source easy_thumbnails_source_storage_hash_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thumbnail_storage_hash_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: filer_clipboard filer_clipboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT filer_clipboard_pkey PRIMARY KEY (id);


--
-- Name: filer_clipboarditem filer_clipboarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_pkey PRIMARY KEY (id);


--
-- Name: filer_file filer_file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_pkey PRIMARY KEY (id);


--
-- Name: filer_folder filer_folder_parent_id_bc773258_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_parent_id_bc773258_uniq UNIQUE (parent_id, name);


--
-- Name: filer_folder filer_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_pkey PRIMARY KEY (id);


--
-- Name: filer_folderpermission filer_folderpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_pkey PRIMARY KEY (id);


--
-- Name: filer_image filer_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT filer_image_pkey PRIMARY KEY (file_ptr_id);


--
-- Name: filer_thumbnailoption filer_thumbnailoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_thumbnailoption
    ADD CONSTRAINT filer_thumbnailoption_pkey PRIMARY KEY (id);


--
-- Name: memes_meme memes_meme_name_f4151fa4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY memes_meme
    ADD CONSTRAINT memes_meme_name_f4151fa4_uniq UNIQUE (name);


--
-- Name: memes_meme memes_meme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY memes_meme
    ADD CONSTRAINT memes_meme_pkey PRIMARY KEY (id);


--
-- Name: memes_memefile memes_memefile_filename_eddb0c89_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY memes_memefile
    ADD CONSTRAINT memes_memefile_filename_eddb0c89_uniq UNIQUE (filename);


--
-- Name: memes_memefile memes_memefile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY memes_memefile
    ADD CONSTRAINT memes_memefile_pkey PRIMARY KEY (id);


--
-- Name: reddit_redditpost reddit_redditpost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reddit_redditpost
    ADD CONSTRAINT reddit_redditpost_pkey PRIMARY KEY (id);


--
-- Name: reddit_redditpost reddit_redditpost_submission_id_40ec6a32_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reddit_redditpost
    ADD CONSTRAINT reddit_redditpost_submission_id_40ec6a32_uniq UNIQUE (submission_id);


--
-- Name: reddit_redditpostsnapshot reddit_redditpostsnapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reddit_redditpostsnapshot
    ADD CONSTRAINT reddit_redditpostsnapshot_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blogpost_9ae73c65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_blogpost_9ae73c65 ON blog_blogpost USING btree (modified);


--
-- Name: blog_blogpost_c16de916; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_blogpost_c16de916 ON blog_blogpost USING btree (header_image_id);


--
-- Name: blog_blogpost_d5d3db17; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_blogpost_d5d3db17 ON blog_blogpost USING btree (title);


--
-- Name: blog_blogpost_e2fa5388; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_blogpost_e2fa5388 ON blog_blogpost USING btree (created);


--
-- Name: blog_blogpost_slug_9e84ade1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_blogpost_slug_9e84ade1_like ON blog_blogpost USING btree (slug varchar_pattern_ops);


--
-- Name: blog_blogpost_title_a4261c9a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_blogpost_title_a4261c9a_like ON blog_blogpost USING btree (title varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX easy_thumbnails_source_b068931c ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX easy_thumbnails_source_b454e115 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: filer_clipboard_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_clipboard_e8701ad4 ON filer_clipboard USING btree (user_id);


--
-- Name: filer_clipboarditem_2655b062; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_clipboarditem_2655b062 ON filer_clipboarditem USING btree (clipboard_id);


--
-- Name: filer_clipboarditem_814552b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_clipboarditem_814552b9 ON filer_clipboarditem USING btree (file_id);


--
-- Name: filer_file_5e7b1936; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_file_5e7b1936 ON filer_file USING btree (owner_id);


--
-- Name: filer_file_a8a44dbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_file_a8a44dbb ON filer_file USING btree (folder_id);


--
-- Name: filer_file_d3e32c49; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_file_d3e32c49 ON filer_file USING btree (polymorphic_ctype_id);


--
-- Name: filer_folder_3cfbd988; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_folder_3cfbd988 ON filer_folder USING btree (rght);


--
-- Name: filer_folder_5e7b1936; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_folder_5e7b1936 ON filer_folder USING btree (owner_id);


--
-- Name: filer_folder_656442a0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_folder_656442a0 ON filer_folder USING btree (tree_id);


--
-- Name: filer_folder_6be37982; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_folder_6be37982 ON filer_folder USING btree (parent_id);


--
-- Name: filer_folder_c9e9a848; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_folder_c9e9a848 ON filer_folder USING btree (level);


--
-- Name: filer_folder_caf7cc51; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_folder_caf7cc51 ON filer_folder USING btree (lft);


--
-- Name: filer_folderpermission_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_folderpermission_0e939a4f ON filer_folderpermission USING btree (group_id);


--
-- Name: filer_folderpermission_a8a44dbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_folderpermission_a8a44dbb ON filer_folderpermission USING btree (folder_id);


--
-- Name: filer_folderpermission_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX filer_folderpermission_e8701ad4 ON filer_folderpermission USING btree (user_id);


--
-- Name: memes_meme_name_f4151fa4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX memes_meme_name_f4151fa4_like ON memes_meme USING btree (name varchar_pattern_ops);


--
-- Name: memes_memefile_9d2e2dba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX memes_memefile_9d2e2dba ON memes_memefile USING btree (meme_id);


--
-- Name: memes_memefile_filename_eddb0c89_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX memes_memefile_filename_eddb0c89_like ON memes_memefile USING btree (filename varchar_pattern_ops);


--
-- Name: reddit_redditpost_1c24719c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reddit_redditpost_1c24719c ON reddit_redditpost USING btree (closest_image_id);


--
-- Name: reddit_redditpost_likely_meme_id_5a946fef_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reddit_redditpost_likely_meme_id_5a946fef_uniq ON reddit_redditpost USING btree (likely_meme_id);


--
-- Name: reddit_redditpost_submission_id_40ec6a32_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reddit_redditpost_submission_id_40ec6a32_like ON reddit_redditpost USING btree (submission_id varchar_pattern_ops);


--
-- Name: reddit_redditpostsnapshot_16af6c81; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reddit_redditpostsnapshot_16af6c81 ON reddit_redditpostsnapshot USING btree (reddit_post_id);


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost blog_blogpo_header_image_id_f289ac01_fk_filer_image_file_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpo_header_image_id_f289ac01_fk_filer_image_file_ptr_id FOREIGN KEY (header_image_id) REFERENCES filer_image(file_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboard filer_clipboard_user_id_b52ff0bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT filer_clipboard_user_id_b52ff0bc_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboarditem filer_clipboarditem_clipboard_id_7a76518b_fk_filer_clipboard_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_clipboard_id_7a76518b_fk_filer_clipboard_id FOREIGN KEY (clipboard_id) REFERENCES filer_clipboard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboarditem filer_clipboarditem_file_id_06196f80_fk_filer_file_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_file_id_06196f80_fk_filer_file_id FOREIGN KEY (file_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file filer_f_polymorphic_ctype_id_f44903c1_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_f_polymorphic_ctype_id_f44903c1_fk_django_content_type_id FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file filer_file_folder_id_af803bbb_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_folder_id_af803bbb_fk_filer_folder_id FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file filer_file_owner_id_b9e32671_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_owner_id_b9e32671_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folder filer_folder_owner_id_be530fb4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_owner_id_be530fb4_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folder filer_folder_parent_id_308aecda_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_parent_id_308aecda_fk_filer_folder_id FOREIGN KEY (parent_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission filer_folderpermission_folder_id_5d02f1da_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_folder_id_5d02f1da_fk_filer_folder_id FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission filer_folderpermission_group_id_8901bafa_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_group_id_8901bafa_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission filer_folderpermission_user_id_7673d4b6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_user_id_7673d4b6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_image filer_image_file_ptr_id_3e21d4f0_fk_filer_file_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT filer_image_file_ptr_id_3e21d4f0_fk_filer_file_id FOREIGN KEY (file_ptr_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: memes_memefile memes_memefile_meme_id_d30e5acf_fk_memes_meme_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY memes_memefile
    ADD CONSTRAINT memes_memefile_meme_id_d30e5acf_fk_memes_meme_id FOREIGN KEY (meme_id) REFERENCES memes_meme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reddit_redditpostsnapshot reddit_redditpo_reddit_post_id_6efbf697_fk_reddit_redditpost_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reddit_redditpostsnapshot
    ADD CONSTRAINT reddit_redditpo_reddit_post_id_6efbf697_fk_reddit_redditpost_id FOREIGN KEY (reddit_post_id) REFERENCES reddit_redditpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reddit_redditpost reddit_redditpos_closest_image_id_11a12ed4_fk_memes_memefile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reddit_redditpost
    ADD CONSTRAINT reddit_redditpos_closest_image_id_11a12ed4_fk_memes_memefile_id FOREIGN KEY (closest_image_id) REFERENCES memes_memefile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reddit_redditpost reddit_redditpost_likely_meme_id_5a946fef_fk_memes_meme_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reddit_redditpost
    ADD CONSTRAINT reddit_redditpost_likely_meme_id_5a946fef_fk_memes_meme_id FOREIGN KEY (likely_meme_id) REFERENCES memes_meme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

