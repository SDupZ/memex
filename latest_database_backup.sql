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
    header_image_id integer,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL
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
-- Name: data_memedatasnapshot24hour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE data_memedatasnapshot24hour (
    id integer NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    crs_l24hrs integer NOT NULL,
    np_l24hrs integer NOT NULL,
    meme_id integer NOT NULL
);


ALTER TABLE data_memedatasnapshot24hour OWNER TO postgres;

--
-- Name: data_memedatasnapshot24hour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE data_memedatasnapshot24hour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_memedatasnapshot24hour_id_seq OWNER TO postgres;

--
-- Name: data_memedatasnapshot24hour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE data_memedatasnapshot24hour_id_seq OWNED BY data_memedatasnapshot24hour.id;


--
-- Name: data_memedatasnapshot30days; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE data_memedatasnapshot30days (
    id integer NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    crs_l30days integer NOT NULL,
    np_l30days integer NOT NULL,
    name character varying(100) NOT NULL,
    meme_id integer NOT NULL
);


ALTER TABLE data_memedatasnapshot30days OWNER TO postgres;

--
-- Name: data_memedatasnapshot30days_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE data_memedatasnapshot30days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_memedatasnapshot30days_id_seq OWNER TO postgres;

--
-- Name: data_memedatasnapshot30days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE data_memedatasnapshot30days_id_seq OWNED BY data_memedatasnapshot30days.id;


--
-- Name: data_memedatasnapshot7days; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE data_memedatasnapshot7days (
    id integer NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    crs_l7days integer NOT NULL,
    np_l7days integer NOT NULL,
    meme_id integer NOT NULL
);


ALTER TABLE data_memedatasnapshot7days OWNER TO postgres;

--
-- Name: data_memedatasnapshot7days_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE data_memedatasnapshot7days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_memedatasnapshot7days_id_seq OWNER TO postgres;

--
-- Name: data_memedatasnapshot7days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE data_memedatasnapshot7days_id_seq OWNED BY data_memedatasnapshot7days.id;


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
    name character varying(100) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL
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
    meme_id integer NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL
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
    over_18 boolean NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL
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
    rank integer NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL
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
-- Name: data_memedatasnapshot24hour id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_memedatasnapshot24hour ALTER COLUMN id SET DEFAULT nextval('data_memedatasnapshot24hour_id_seq'::regclass);


--
-- Name: data_memedatasnapshot30days id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_memedatasnapshot30days ALTER COLUMN id SET DEFAULT nextval('data_memedatasnapshot30days_id_seq'::regclass);


--
-- Name: data_memedatasnapshot7days id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_memedatasnapshot7days ALTER COLUMN id SET DEFAULT nextval('data_memedatasnapshot7days_id_seq'::regclass);


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
19	Can add thumbnail	7	add_thumbnail
20	Can change thumbnail	7	change_thumbnail
21	Can delete thumbnail	7	delete_thumbnail
22	Can add thumbnail dimensions	8	add_thumbnaildimensions
23	Can change thumbnail dimensions	8	change_thumbnaildimensions
24	Can delete thumbnail dimensions	8	delete_thumbnaildimensions
25	Can add source	9	add_source
26	Can change source	9	change_source
27	Can delete source	9	delete_source
28	Can add thumbnail option	10	add_thumbnailoption
29	Can change thumbnail option	10	change_thumbnailoption
30	Can delete thumbnail option	10	delete_thumbnailoption
31	Can add clipboard	11	add_clipboard
32	Can change clipboard	11	change_clipboard
33	Can delete clipboard	11	delete_clipboard
34	Can add Folder	12	add_folder
35	Can change Folder	12	change_folder
36	Can delete Folder	12	delete_folder
37	Can use directory listing	12	can_use_directory_listing
38	Can add folder permission	13	add_folderpermission
39	Can change folder permission	13	change_folderpermission
40	Can delete folder permission	13	delete_folderpermission
41	Can add file	14	add_file
42	Can change file	14	change_file
43	Can delete file	14	delete_file
44	Can add clipboard item	15	add_clipboarditem
45	Can change clipboard item	15	change_clipboarditem
46	Can delete clipboard item	15	delete_clipboarditem
47	Can add image	16	add_image
48	Can change image	16	change_image
49	Can delete image	16	delete_image
50	Can add Blog Post	17	add_blogpost
51	Can change Blog Post	17	change_blogpost
52	Can delete Blog Post	17	delete_blogpost
53	Can add Meme data snapshot 7 days	18	add_memedatasnapshot7days
54	Can change Meme data snapshot 7 days	18	change_memedatasnapshot7days
55	Can delete Meme data snapshot 7 days	18	delete_memedatasnapshot7days
56	Can add Meme data snapshot 30 days	19	add_memedatasnapshot30days
57	Can change Meme data snapshot 30 days	19	change_memedatasnapshot30days
58	Can delete Meme data snapshot 30 days	19	delete_memedatasnapshot30days
59	Can add Meme data snapshot 24 hour	20	add_memedatasnapshot24hour
60	Can change Meme data snapshot 24 hour	20	change_memedatasnapshot24hour
61	Can delete Meme data snapshot 24 hour	20	delete_memedatasnapshot24hour
62	Can add Meme Filename	21	add_memefile
63	Can change Meme Filename	21	change_memefile
64	Can delete Meme Filename	21	delete_memefile
65	Can add Meme	22	add_meme
66	Can change Meme	22	change_meme
67	Can delete Meme	22	delete_meme
68	Can add Reddit Post	23	add_redditpost
69	Can change Reddit Post	23	change_redditpost
70	Can delete Reddit Post	23	delete_redditpost
71	Can add reddit post snapshot	24	add_redditpostsnapshot
72	Can change reddit post snapshot	24	change_redditpostsnapshot
73	Can delete reddit post snapshot	24	delete_redditpostsnapshot
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 73, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$30000$6HR2Of9Cz2Xh$EjKyr9jbIR/pDOViMaMVLIHwSXmQv25kIeMtut70v4s=	2017-03-26 02:30:34.515292+00	t	root				t	t	2017-03-26 02:29:31.21005+00
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

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


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

COPY blog_blogpost (id, created, modified, title, slug, blurb, content, header_image_id, created_date, modified_date) FROM stdin;
\.


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_blogpost_id_seq', 1, false);


--
-- Data for Name: data_memedatasnapshot24hour; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY data_memedatasnapshot24hour (id, created_date, modified_date, crs_l24hrs, np_l24hrs, meme_id) FROM stdin;
1	2017-03-26 04:31:54.945999+00	2017-03-26 04:31:54.946043+00	0	1	11
2	2017-03-26 04:31:55.015366+00	2017-03-26 04:31:55.015408+00	316	4	5
3	2017-03-26 04:31:55.033419+00	2017-03-26 04:31:55.033455+00	0	0	112
4	2017-03-26 04:31:55.045583+00	2017-03-26 04:31:55.045617+00	9	1	107
5	2017-03-26 04:31:55.064068+00	2017-03-26 04:31:55.064103+00	0	0	34
6	2017-03-26 04:31:55.08184+00	2017-03-26 04:31:55.081892+00	0	0	48
7	2017-03-26 04:31:55.093537+00	2017-03-26 04:31:55.093571+00	0	0	109
8	2017-03-26 04:31:55.103417+00	2017-03-26 04:31:55.10345+00	0	0	71
9	2017-03-26 04:31:55.115673+00	2017-03-26 04:31:55.11595+00	21	1	24
10	2017-03-26 04:31:55.181643+00	2017-03-26 04:31:55.181681+00	0	0	92
11	2017-03-26 04:31:55.194241+00	2017-03-26 04:31:55.194276+00	0	0	2
12	2017-03-26 04:31:55.203569+00	2017-03-26 04:31:55.203602+00	0	0	53
13	2017-03-26 04:31:55.213862+00	2017-03-26 04:31:55.213896+00	0	0	16
14	2017-03-26 04:31:55.223399+00	2017-03-26 04:31:55.223429+00	0	0	96
15	2017-03-26 04:31:55.233414+00	2017-03-26 04:31:55.233443+00	0	0	54
16	2017-03-26 04:31:55.243259+00	2017-03-26 04:31:55.243288+00	0	0	39
17	2017-03-26 04:31:55.253719+00	2017-03-26 04:31:55.253749+00	0	0	12
18	2017-03-26 04:31:55.263618+00	2017-03-26 04:31:55.263646+00	0	0	46
19	2017-03-26 04:31:55.273251+00	2017-03-26 04:31:55.273278+00	0	0	101
20	2017-03-26 04:31:55.283205+00	2017-03-26 04:31:55.283232+00	0	0	75
21	2017-03-26 04:31:55.294813+00	2017-03-26 04:31:55.294839+00	9	1	23
22	2017-03-26 04:31:55.311624+00	2017-03-26 04:31:55.31165+00	0	0	30
23	2017-03-26 04:31:55.323212+00	2017-03-26 04:31:55.323237+00	0	0	45
24	2017-03-26 04:31:55.333372+00	2017-03-26 04:31:55.333398+00	0	0	55
25	2017-03-26 04:31:55.343322+00	2017-03-26 04:31:55.343347+00	0	0	113
26	2017-03-26 04:31:55.353723+00	2017-03-26 04:31:55.353749+00	0	0	19
27	2017-03-26 04:31:55.36637+00	2017-03-26 04:31:55.366397+00	17055	2	70
28	2017-03-26 04:31:55.384578+00	2017-03-26 04:31:55.384604+00	4	1	81
29	2017-03-26 04:31:55.397958+00	2017-03-26 04:31:55.397985+00	483	3	25
30	2017-03-26 04:31:55.437191+00	2017-03-26 04:31:55.437234+00	0	0	14
31	2017-03-26 04:31:55.455177+00	2017-03-26 04:31:55.455215+00	0	0	27
32	2017-03-26 04:31:55.475178+00	2017-03-26 04:31:55.475214+00	137	1	74
33	2017-03-26 04:31:55.496809+00	2017-03-26 04:31:55.496863+00	71	2	103
34	2017-03-26 04:31:55.516234+00	2017-03-26 04:31:55.516267+00	1288	1	38
35	2017-03-26 04:31:55.532692+00	2017-03-26 04:31:55.532724+00	0	0	59
36	2017-03-26 04:31:55.546306+00	2017-03-26 04:31:55.546338+00	3438	1	80
37	2017-03-26 04:31:55.567678+00	2017-03-26 04:31:55.567709+00	30	3	82
38	2017-03-26 04:31:55.584087+00	2017-03-26 04:31:55.584116+00	0	0	65
39	2017-03-26 04:31:55.594239+00	2017-03-26 04:31:55.594267+00	0	0	7
40	2017-03-26 04:31:55.607468+00	2017-03-26 04:31:55.607496+00	370	2	9
41	2017-03-26 04:31:55.624229+00	2017-03-26 04:31:55.624256+00	0	0	26
42	2017-03-26 04:31:55.635978+00	2017-03-26 04:31:55.636006+00	64	1	21
43	2017-03-26 04:31:55.654083+00	2017-03-26 04:31:55.654111+00	5669	1	63
44	2017-03-26 04:31:55.664352+00	2017-03-26 04:31:55.664379+00	0	0	1
45	2017-03-26 04:31:55.674253+00	2017-03-26 04:31:55.67428+00	0	0	52
46	2017-03-26 04:31:55.685891+00	2017-03-26 04:31:55.685918+00	166	1	78
47	2017-03-26 04:31:55.705486+00	2017-03-26 04:31:55.705512+00	2973	2	6
48	2017-03-26 04:31:55.714179+00	2017-03-26 04:31:55.714207+00	0	0	100
49	2017-03-26 04:31:55.724174+00	2017-03-26 04:31:55.724199+00	0	0	67
50	2017-03-26 04:31:55.734301+00	2017-03-26 04:31:55.734326+00	0	0	37
51	2017-03-26 04:31:55.744257+00	2017-03-26 04:31:55.744281+00	0	0	51
52	2017-03-26 04:31:55.754286+00	2017-03-26 04:31:55.75431+00	0	0	32
53	2017-03-26 04:31:55.764318+00	2017-03-26 04:31:55.764343+00	0	0	50
54	2017-03-26 04:31:55.77444+00	2017-03-26 04:31:55.774464+00	0	0	87
55	2017-03-26 04:31:55.784326+00	2017-03-26 04:31:55.78435+00	0	0	90
56	2017-03-26 04:31:55.794421+00	2017-03-26 04:31:55.794446+00	0	0	17
57	2017-03-26 04:31:55.846946+00	2017-03-26 04:31:55.846977+00	0	0	20
58	2017-03-26 04:31:55.863289+00	2017-03-26 04:31:55.86332+00	0	0	79
59	2017-03-26 04:31:55.875103+00	2017-03-26 04:31:55.875133+00	0	0	22
60	2017-03-26 04:31:55.885051+00	2017-03-26 04:31:55.885079+00	0	0	66
61	2017-03-26 04:31:55.894969+00	2017-03-26 04:31:55.894998+00	0	0	29
62	2017-03-26 04:31:55.905008+00	2017-03-26 04:31:55.905035+00	0	0	62
63	2017-03-26 04:31:55.918127+00	2017-03-26 04:31:55.918154+00	33	2	88
64	2017-03-26 04:31:55.934657+00	2017-03-26 04:31:55.934684+00	0	0	105
65	2017-03-26 04:31:55.946619+00	2017-03-26 04:31:55.946647+00	2	1	8
66	2017-03-26 04:31:55.963266+00	2017-03-26 04:31:55.963294+00	0	0	84
67	2017-03-26 04:31:55.975058+00	2017-03-26 04:31:55.975085+00	0	0	106
68	2017-03-26 04:31:55.986635+00	2017-03-26 04:31:55.986662+00	144	1	15
69	2017-03-26 04:31:56.00469+00	2017-03-26 04:31:56.004717+00	0	1	13
70	2017-03-26 04:31:56.015096+00	2017-03-26 04:31:56.015122+00	0	0	72
71	2017-03-26 04:31:56.026734+00	2017-03-26 04:31:56.026761+00	105	1	47
72	2017-03-26 04:31:56.043425+00	2017-03-26 04:31:56.043451+00	0	0	35
73	2017-03-26 04:31:56.055177+00	2017-03-26 04:31:56.055204+00	0	0	83
74	2017-03-26 04:31:56.068358+00	2017-03-26 04:31:56.068385+00	366	2	10
75	2017-03-26 04:31:56.12451+00	2017-03-26 04:31:56.124556+00	0	0	77
76	2017-03-26 04:31:56.13612+00	2017-03-26 04:31:56.136154+00	0	0	60
77	2017-03-26 04:31:56.146112+00	2017-03-26 04:31:56.146144+00	0	0	91
78	2017-03-26 04:31:56.168739+00	2017-03-26 04:31:56.16877+00	2479	7	110
79	2017-03-26 04:31:56.192385+00	2017-03-26 04:31:56.192414+00	499	4	108
80	2017-03-26 04:31:56.205837+00	2017-03-26 04:31:56.205876+00	0	0	40
81	2017-03-26 04:31:56.215806+00	2017-03-26 04:31:56.215834+00	0	0	99
82	2017-03-26 04:31:56.225786+00	2017-03-26 04:31:56.225814+00	0	0	97
83	2017-03-26 04:31:56.235715+00	2017-03-26 04:31:56.235742+00	0	0	49
84	2017-03-26 04:31:56.245977+00	2017-03-26 04:31:56.246004+00	0	0	36
85	2017-03-26 04:31:56.255912+00	2017-03-26 04:31:56.255939+00	0	0	42
86	2017-03-26 04:31:56.265905+00	2017-03-26 04:31:56.265932+00	0	0	98
87	2017-03-26 04:31:56.275777+00	2017-03-26 04:31:56.275803+00	0	0	43
88	2017-03-26 04:31:56.285779+00	2017-03-26 04:31:56.285805+00	0	0	57
89	2017-03-26 04:31:56.295762+00	2017-03-26 04:31:56.295788+00	0	0	69
90	2017-03-26 04:31:56.305794+00	2017-03-26 04:31:56.30582+00	0	0	102
91	2017-03-26 04:31:56.31581+00	2017-03-26 04:31:56.315836+00	0	0	33
92	2017-03-26 04:31:56.325869+00	2017-03-26 04:31:56.325896+00	0	0	86
93	2017-03-26 04:31:56.33593+00	2017-03-26 04:31:56.335956+00	0	0	3
94	2017-03-26 04:31:56.348876+00	2017-03-26 04:31:56.348902+00	150	2	89
95	2017-03-26 04:31:56.365694+00	2017-03-26 04:31:56.36572+00	19	1	28
96	2017-03-26 04:31:56.376185+00	2017-03-26 04:31:56.376212+00	0	0	61
97	2017-03-26 04:31:56.386087+00	2017-03-26 04:31:56.386113+00	0	0	73
98	2017-03-26 04:31:56.396001+00	2017-03-26 04:31:56.396051+00	0	0	4
99	2017-03-26 04:31:56.409142+00	2017-03-26 04:31:56.409168+00	1130	2	94
100	2017-03-26 04:31:56.42726+00	2017-03-26 04:31:56.427287+00	3	1	31
101	2017-03-26 04:31:56.436168+00	2017-03-26 04:31:56.436194+00	0	0	41
102	2017-03-26 04:31:56.44623+00	2017-03-26 04:31:56.446256+00	0	0	111
103	2017-03-26 04:31:56.45626+00	2017-03-26 04:31:56.456286+00	0	0	95
104	2017-03-26 04:31:56.469247+00	2017-03-26 04:31:56.469274+00	33	2	56
105	2017-03-26 04:31:56.484563+00	2017-03-26 04:31:56.484589+00	0	0	85
106	2017-03-26 04:31:56.496404+00	2017-03-26 04:31:56.49643+00	0	0	76
107	2017-03-26 04:31:56.507892+00	2017-03-26 04:31:56.507918+00	25	1	93
108	2017-03-26 04:31:56.516404+00	2017-03-26 04:31:56.516429+00	0	0	58
109	2017-03-26 04:31:56.52634+00	2017-03-26 04:31:56.526365+00	0	0	104
110	2017-03-26 04:31:56.536294+00	2017-03-26 04:31:56.536319+00	0	0	18
111	2017-03-26 04:31:56.546319+00	2017-03-26 04:31:56.546343+00	0	0	68
112	2017-03-26 04:31:56.556311+00	2017-03-26 04:31:56.556335+00	0	0	64
113	2017-03-26 04:31:56.566307+00	2017-03-26 04:31:56.566331+00	0	0	44
\.


--
-- Name: data_memedatasnapshot24hour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('data_memedatasnapshot24hour_id_seq', 113, true);


--
-- Data for Name: data_memedatasnapshot30days; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY data_memedatasnapshot30days (id, created_date, modified_date, crs_l30days, np_l30days, name, meme_id) FROM stdin;
\.


--
-- Name: data_memedatasnapshot30days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('data_memedatasnapshot30days_id_seq', 1, false);


--
-- Data for Name: data_memedatasnapshot7days; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY data_memedatasnapshot7days (id, created_date, modified_date, crs_l7days, np_l7days, meme_id) FROM stdin;
\.


--
-- Name: data_memedatasnapshot7days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('data_memedatasnapshot7days_id_seq', 1, false);


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
3	auth	user
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	easy_thumbnails	thumbnail
8	easy_thumbnails	thumbnaildimensions
9	easy_thumbnails	source
10	filer	thumbnailoption
11	filer	clipboard
12	filer	folder
13	filer	folderpermission
14	filer	file
15	filer	clipboarditem
16	filer	image
17	blog	blogpost
18	data	memedatasnapshot7days
19	data	memedatasnapshot30days
20	data	memedatasnapshot24hour
21	memes	memefile
22	memes	meme
23	reddit	redditpost
24	reddit	redditpostsnapshot
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 24, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-03-26 02:27:58.114477+00
2	auth	0001_initial	2017-03-26 02:27:59.437195+00
3	admin	0001_initial	2017-03-26 02:27:59.787742+00
4	admin	0002_logentry_remove_auto_add	2017-03-26 02:27:59.827324+00
5	contenttypes	0002_remove_content_type_name	2017-03-26 02:27:59.887151+00
6	auth	0002_alter_permission_name_max_length	2017-03-26 02:27:59.917214+00
7	auth	0003_alter_user_email_max_length	2017-03-26 02:27:59.947542+00
8	auth	0004_alter_user_username_opts	2017-03-26 02:27:59.970009+00
9	auth	0005_alter_user_last_login_null	2017-03-26 02:28:00.007399+00
10	auth	0006_require_contenttypes_0002	2017-03-26 02:28:00.01775+00
11	auth	0007_alter_validators_add_error_messages	2017-03-26 02:28:00.037572+00
12	auth	0008_alter_user_username_max_length	2017-03-26 02:28:00.128329+00
13	filer	0001_initial	2017-03-26 02:28:02.062726+00
14	filer	0002_auto_20150606_2003	2017-03-26 02:28:02.157581+00
15	filer	0003_thumbnailoption	2017-03-26 02:28:02.240725+00
16	filer	0004_auto_20160328_1434	2017-03-26 02:28:02.320992+00
17	filer	0005_auto_20160623_1425	2017-03-26 02:28:02.451228+00
18	filer	0006_auto_20160623_1627	2017-03-26 02:28:02.501287+00
19	filer	0007_auto_20161016_1055	2017-03-26 02:28:02.527354+00
20	blog	0001_initial	2017-03-26 02:28:03.092677+00
21	blog	0002_auto_20170322_0656	2017-03-26 02:28:04.20869+00
22	memes	0001_initial	2017-03-26 02:28:04.287261+00
23	memes	0002_meme_redditpost	2017-03-26 02:28:04.578636+00
24	memes	0003_auto_20170213_2255	2017-03-26 02:28:04.608171+00
25	memes	0004_auto_20170213_2257	2017-03-26 02:28:04.636216+00
26	memes	0005_auto_20170213_2258	2017-03-26 02:28:04.67814+00
27	memes	0006_auto_20170213_2259	2017-03-26 02:28:04.698248+00
28	memes	0007_auto_20170213_2301	2017-03-26 02:28:04.712313+00
29	memes	0008_delete_job	2017-03-26 02:28:04.738585+00
30	memes	0009_delete_redditpost	2017-03-26 02:28:04.766999+00
31	memes	0010_memefile	2017-03-26 02:28:04.909437+00
32	memes	0011_auto_20170225_0440	2017-03-26 02:28:04.92915+00
33	memes	0012_auto_20170225_2356	2017-03-26 02:28:05.159993+00
34	memes	0013_auto_20170322_0656	2017-03-26 02:28:06.413864+00
35	data	0001_initial	2017-03-26 02:28:07.125559+00
36	easy_thumbnails	0001_initial	2017-03-26 02:28:08.710126+00
37	easy_thumbnails	0002_thumbnaildimensions	2017-03-26 02:28:09.011269+00
38	reddit	0001_initial	2017-03-26 02:28:09.382488+00
39	reddit	0002_auto_20170225_0440	2017-03-26 02:28:10.884421+00
40	reddit	0003_auto_20170225_0508	2017-03-26 02:28:11.778034+00
41	reddit	0004_auto_20170322_0656	2017-03-26 02:28:12.982042+00
42	sessions	0001_initial	2017-03-26 02:28:13.120329+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 42, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
ci71thuqjydsf61cxfqc49l9d1itsx12	ZWY4Zjc0YWQwMTQ0MjJhOWViNTFlZDExOTA4ZTM3YTc2NzUyYjAxNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZDM4NTkyZGE5NzE1MjFmNTMwYmM5N2U0NjQ1NzA4N2RhYWNmYjI1In0=	2017-04-09 02:30:34.539769+00
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

COPY memes_meme (id, name, created_date, modified_date) FROM stdin;
1	Futurama Fry	2017-03-26 02:28:15.167359+00	2017-03-26 02:28:15.167398+00
2	Annoyed Picard	2017-03-26 02:28:15.489989+00	2017-03-26 02:28:15.490034+00
3	Socially Awkward Penguin	2017-03-26 02:28:15.533572+00	2017-03-26 02:28:15.533612+00
4	Successful Black Man	2017-03-26 02:28:15.610023+00	2017-03-26 02:28:15.610066+00
5	Actual Advice Mallard	2017-03-26 02:28:15.735167+00	2017-03-26 02:28:15.735246+00
6	Good Guy Greg	2017-03-26 02:28:15.772704+00	2017-03-26 02:28:15.77274+00
7	First Day on the Internet Kid	2017-03-26 02:28:15.846241+00	2017-03-26 02:28:15.846275+00
8	Most Interesting Man in the World	2017-03-26 02:28:15.884491+00	2017-03-26 02:28:15.884528+00
9	First World Problem	2017-03-26 02:28:15.932487+00	2017-03-26 02:28:15.932534+00
10	Philosoraptor	2017-03-26 02:28:15.976643+00	2017-03-26 02:28:15.976681+00
11	10 Guy	2017-03-26 02:28:16.024712+00	2017-03-26 02:28:16.024771+00
12	Bad Luck Brian	2017-03-26 02:28:16.097027+00	2017-03-26 02:28:16.097067+00
13	Overly Attached Girlfriend	2017-03-26 02:28:16.145061+00	2017-03-26 02:28:16.145097+00
14	Conspiracy Keanu	2017-03-26 02:28:16.175253+00	2017-03-26 02:28:16.175286+00
15	One Does Not Simply	2017-03-26 02:28:16.225461+00	2017-03-26 02:28:16.225528+00
16	Annoying Facebook Girl	2017-03-26 02:28:16.26553+00	2017-03-26 02:28:16.265567+00
17	Insanity Wolf	2017-03-26 02:28:16.291721+00	2017-03-26 02:28:16.291779+00
18	Yao Ming	2017-03-26 02:28:16.342003+00	2017-03-26 02:28:16.342089+00
19	College Freshman	2017-03-26 02:28:16.382012+00	2017-03-26 02:28:16.382049+00
20	Internet Husband	2017-03-26 02:28:16.442184+00	2017-03-26 02:28:16.442224+00
21	Foul Bachelor Frog	2017-03-26 02:28:16.488106+00	2017-03-26 02:28:16.488146+00
22	Joseph Ducreux	2017-03-26 02:28:16.516125+00	2017-03-26 02:28:16.516166+00
23	Brace Yourselves	2017-03-26 02:28:16.542526+00	2017-03-26 02:28:16.542566+00
24	Ancient Aliens	2017-03-26 02:28:16.592837+00	2017-03-26 02:28:16.592881+00
25	Confessions Bear	2017-03-26 02:28:16.618354+00	2017-03-26 02:28:16.61839+00
26	Forever Alone	2017-03-26 02:28:16.698519+00	2017-03-26 02:28:16.698555+00
27	Courage Wolf	2017-03-26 02:28:16.748732+00	2017-03-26 02:28:16.748798+00
28	Sophisticated Cat	2017-03-26 02:28:16.786785+00	2017-03-26 02:28:16.786824+00
29	Lazy College Senior	2017-03-26 02:28:16.813138+00	2017-03-26 02:28:16.813173+00
30	Business Cat	2017-03-26 02:28:16.839146+00	2017-03-26 02:28:16.839189+00
31	Sudden Clarity Clarence	2017-03-26 02:28:16.87757+00	2017-03-26 02:28:16.877623+00
32	Hipster Barista	2017-03-26 02:28:16.903412+00	2017-03-26 02:28:16.90345+00
33	Socially Awesome Awkward Penguin	2017-03-26 02:28:16.953869+00	2017-03-26 02:28:16.953915+00
34	All the Things	2017-03-26 02:28:16.999375+00	2017-03-26 02:28:16.99941+00
35	Pedo Bear	2017-03-26 02:28:17.033858+00	2017-03-26 02:28:17.033946+00
36	Scumbag Steve	2017-03-26 02:28:17.067269+00	2017-03-26 02:28:17.067303+00
37	Grumpy Cat	2017-03-26 02:28:17.134264+00	2017-03-26 02:28:17.13433+00
38	Drunk Baby	2017-03-26 02:28:17.171164+00	2017-03-26 02:28:17.171238+00
39	Bad Joke Eel	2017-03-26 02:28:17.234453+00	2017-03-26 02:28:17.234558+00
40	Schrute Facts	2017-03-26 02:28:17.278005+00	2017-03-26 02:28:17.278043+00
41	Super Cool Ski Instructor	2017-03-26 02:28:17.322508+00	2017-03-26 02:28:17.322622+00
42	Scumbag Teacher	2017-03-26 02:28:17.380385+00	2017-03-26 02:28:17.380425+00
43	Sheltering Suburban Mom	2017-03-26 02:28:17.445279+00	2017-03-26 02:28:17.445326+00
44	Y U No	2017-03-26 02:28:17.490599+00	2017-03-26 02:28:17.490636+00
45	Butthurt Dweller	2017-03-26 02:28:17.524112+00	2017-03-26 02:28:17.524148+00
46	Bear Grylls	2017-03-26 02:28:17.565098+00	2017-03-26 02:28:17.565132+00
47	Paranoid Parrot	2017-03-26 02:28:17.619213+00	2017-03-26 02:28:17.619251+00
48	Almost Politically Correct Redneck	2017-03-26 02:28:17.645408+00	2017-03-26 02:28:17.645444+00
49	Scumbag Steph	2017-03-26 02:28:17.711192+00	2017-03-26 02:28:17.711226+00
50	Hipster Kitten	2017-03-26 02:28:17.755713+00	2017-03-26 02:28:17.755783+00
51	High Expectations Asian Father	2017-03-26 02:28:17.811688+00	2017-03-26 02:28:17.811726+00
52	Good Girl Gina	2017-03-26 02:28:17.866107+00	2017-03-26 02:28:17.866156+00
53	Annoying Childhood Friend	2017-03-26 02:28:17.930183+00	2017-03-26 02:28:17.930222+00
54	Baby Godfather	2017-03-26 02:28:17.971991+00	2017-03-26 02:28:17.972069+00
55	Captain Hindsight	2017-03-26 02:28:18.046465+00	2017-03-26 02:28:18.046502+00
56	Too Damn High	2017-03-26 02:28:18.100519+00	2017-03-26 02:28:18.100558+00
57	Skeptical 3rd World Kid	2017-03-26 02:28:18.262609+00	2017-03-26 02:28:18.262647+00
58	Willy Wonka	2017-03-26 02:28:18.312971+00	2017-03-26 02:28:18.313011+00
59	Ermahgerd	2017-03-26 02:28:18.342971+00	2017-03-26 02:28:18.343007+00
60	Push It Somewhere Else Patrick	2017-03-26 02:28:18.413239+00	2017-03-26 02:28:18.413408+00
61	Spider-Man Masterbating	2017-03-26 02:28:18.471203+00	2017-03-26 02:28:18.471243+00
62	Matrix Morpheus	2017-03-26 02:28:18.523341+00	2017-03-26 02:28:18.52338+00
63	Fuck Me, Right?	2017-03-26 02:28:18.563466+00	2017-03-26 02:28:18.563504+00
64	You Can't Explain That	2017-03-26 02:28:18.593556+00	2017-03-26 02:28:18.593593+00
65	Facepalm	2017-03-26 02:28:18.635787+00	2017-03-26 02:28:18.635824+00
66	Lame Pun Racoon	2017-03-26 02:28:18.688374+00	2017-03-26 02:28:18.688411+00
67	Grinds My Gears	2017-03-26 02:28:18.731928+00	2017-03-26 02:28:18.731963+00
68	Yo Dawg	2017-03-26 02:28:18.794355+00	2017-03-26 02:28:18.794391+00
69	Slowpoke	2017-03-26 02:28:18.842055+00	2017-03-26 02:28:18.842092+00
70	College Liberal	2017-03-26 02:28:18.880909+00	2017-03-26 02:28:18.880945+00
71	Am I The Only One Around Here?	2017-03-26 02:28:18.912535+00	2017-03-26 02:28:18.912572+00
72	Overly Manly Man	2017-03-26 02:28:18.962669+00	2017-03-26 02:28:18.962706+00
73	Stoner Dog	2017-03-26 02:28:19.002775+00	2017-03-26 02:28:19.002951+00
74	Downvoting Roman	2017-03-26 02:28:19.059534+00	2017-03-26 02:28:19.059585+00
75	Bold Move Cotton	2017-03-26 02:28:19.72546+00	2017-03-26 02:28:19.725492+00
76	Upvoting Obama	2017-03-26 02:28:19.936978+00	2017-03-26 02:28:19.93701+00
77	Pickup Line Panda	2017-03-26 02:28:20.02323+00	2017-03-26 02:28:20.023265+00
78	Good Guy Boss	2017-03-26 02:28:20.525132+00	2017-03-26 02:28:20.525184+00
79	It Was a Good Day	2017-03-26 02:28:20.676872+00	2017-03-26 02:28:20.676918+00
80	Everyone Loses Their Mind	2017-03-26 02:28:20.739009+00	2017-03-26 02:28:20.739048+00
81	Confession Kid	2017-03-26 02:28:20.774021+00	2017-03-26 02:28:20.774059+00
82	Evil Plotting Racoon	2017-03-26 02:28:20.919659+00	2017-03-26 02:28:20.919718+00
83	Pepperidge Farm Remembers	2017-03-26 02:28:21.145248+00	2017-03-26 02:28:21.145295+00
84	Neil deGrasse Tyson	2017-03-26 02:28:21.265187+00	2017-03-26 02:28:21.265321+00
85	Unpopular Opinion Puffin	2017-03-26 02:28:21.328303+00	2017-03-26 02:28:21.328341+00
86	Socially Awesome Penguin	2017-03-26 02:28:21.379019+00	2017-03-26 02:28:21.379075+00
87	I Guarantee It	2017-03-26 02:28:21.438811+00	2017-03-26 02:28:21.438851+00
88	Maury Lie Detector	2017-03-26 02:28:21.475574+00	2017-03-26 02:28:21.475611+00
89	So I Got That Goin' For Me, Which is Nice	2017-03-26 02:28:21.528958+00	2017-03-26 02:28:21.528996+00
90	I'll Have You Know	2017-03-26 02:28:21.596131+00	2017-03-26 02:28:21.596171+00
91	Rafiki The Wise	2017-03-26 02:28:21.647371+00	2017-03-26 02:28:21.647408+00
92	And It's Gone	2017-03-26 02:28:21.691963+00	2017-03-26 02:28:21.692+00
93	Weird Stuff I Do Potoo	2017-03-26 02:28:21.736355+00	2017-03-26 02:28:21.736391+00
94	Success Kid	2017-03-26 02:28:21.761643+00	2017-03-26 02:28:21.761681+00
95	Third World Success	2017-03-26 02:28:21.800056+00	2017-03-26 02:28:21.800095+00
96	Awkward Moment Seal	2017-03-26 02:28:21.862281+00	2017-03-26 02:28:21.862322+00
97	Scumbag Parents	2017-03-26 02:28:21.937057+00	2017-03-26 02:28:21.937101+00
98	Sexually Oblivious Female	2017-03-26 02:28:21.988424+00	2017-03-26 02:28:21.988463+00
99	Scumbag Brain	2017-03-26 02:28:22.017071+00	2017-03-26 02:28:22.017108+00
100	Grandma Finds the Internet	2017-03-26 02:28:22.060423+00	2017-03-26 02:28:22.06046+00
101	Blackjack and Hookers	2017-03-26 02:28:22.120581+00	2017-03-26 02:28:22.120619+00
102	Small Fact Frog	2017-03-26 02:28:22.152732+00	2017-03-26 02:28:22.152791+00
103	Do You Want Ants?	2017-03-26 02:28:22.190696+00	2017-03-26 02:28:22.190733+00
104	Y'all Got Anymore of...	2017-03-26 02:28:22.22814+00	2017-03-26 02:28:22.22818+00
105	Minor Mistake Marvin	2017-03-26 02:28:22.270939+00	2017-03-26 02:28:22.270978+00
106	None of My Business	2017-03-26 02:28:22.333286+00	2017-03-26 02:28:22.333356+00
107	Afraid to Ask Andy	2017-03-26 02:28:22.363272+00	2017-03-26 02:28:22.363308+00
108	Satisfied Seal	2017-03-26 02:28:22.388166+00	2017-03-26 02:28:22.388278+00
109	American Pride Eagle	2017-03-26 02:28:22.413548+00	2017-03-26 02:28:22.413584+00
110	Roll Safe	2017-03-26 02:28:22.433487+00	2017-03-26 02:28:22.433522+00
111	That Would Be Great	2017-03-26 02:28:22.521579+00	2017-03-26 02:28:22.521616+00
112	Advice God	2017-03-26 02:28:22.543924+00	2017-03-26 02:28:22.543959+00
113	Cash Me Outside	2017-03-26 02:28:22.575715+00	2017-03-26 02:28:22.57586+00
\.


--
-- Name: memes_meme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('memes_meme_id_seq', 113, true);


--
-- Data for Name: memes_memefile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY memes_memefile (id, filename, meme_id, created_date, modified_date) FROM stdin;
1	futurama-fry.png	1	2017-03-26 02:28:15.433624+00	2017-03-26 02:28:15.433676+00
2	annoyed-picard.jpg	2	2017-03-26 02:28:15.512184+00	2017-03-26 02:28:15.512227+00
3	socially-awkward-penguin.jpg	3	2017-03-26 02:28:15.586006+00	2017-03-26 02:28:15.586054+00
4	successful-black-man.jpg	4	2017-03-26 02:28:15.650102+00	2017-03-26 02:28:15.650141+00
5	actual-advice-mallard.jpg	5	2017-03-26 02:28:15.757784+00	2017-03-26 02:28:15.757821+00
6	good-guy-greg.jpg	6	2017-03-26 02:28:15.816565+00	2017-03-26 02:28:15.816605+00
7	first-day-on-the-internet-kid.jpg	7	2017-03-26 02:28:15.856404+00	2017-03-26 02:28:15.856437+00
8	most-interesting-man-in-the-world.jpg	8	2017-03-26 02:28:15.916473+00	2017-03-26 02:28:15.916513+00
9	first-world-problems.jpg	9	2017-03-26 02:28:15.954703+00	2017-03-26 02:28:15.95474+00
10	philosoraptor.jpg	10	2017-03-26 02:28:15.991286+00	2017-03-26 02:28:15.991327+00
11	10-guy.jpg	11	2017-03-26 02:28:16.055035+00	2017-03-26 02:28:16.055072+00
12	bad-luck-brian.jpg	12	2017-03-26 02:28:16.127079+00	2017-03-26 02:28:16.127156+00
13	overly-attached-girlfriend.jpg	13	2017-03-26 02:28:16.161345+00	2017-03-26 02:28:16.161381+00
14	conspiracy-keanu.jpg	14	2017-03-26 02:28:16.201492+00	2017-03-26 02:28:16.201526+00
15	one-does-not-simply.jpg	15	2017-03-26 02:28:16.251852+00	2017-03-26 02:28:16.251918+00
16	annoying-facebook-girl.jpg	16	2017-03-26 02:28:16.277545+00	2017-03-26 02:28:16.277582+00
17	insanity-wolf.jpg	17	2017-03-26 02:28:16.307471+00	2017-03-26 02:28:16.307508+00
18	yao-ming.png	18	2017-03-26 02:28:16.367869+00	2017-03-26 02:28:16.367907+00
19	college-freshman.jpg	19	2017-03-26 02:28:16.412207+00	2017-03-26 02:28:16.412247+00
20	internet-husband.jpg	20	2017-03-26 02:28:16.466016+00	2017-03-26 02:28:16.466057+00
21	foul-bachelor-frog.jpg	21	2017-03-26 02:28:16.502267+00	2017-03-26 02:28:16.502306+00
22	joseph-ducreux.jpg	22	2017-03-26 02:28:16.528163+00	2017-03-26 02:28:16.528202+00
23	brace-yourselves.jpg	23	2017-03-26 02:28:16.556214+00	2017-03-26 02:28:16.556252+00
24	ancient-aliens.jpg	24	2017-03-26 02:28:16.606319+00	2017-03-26 02:28:16.606354+00
25	confessions-bear.jpg	25	2017-03-26 02:28:16.666587+00	2017-03-26 02:28:16.666622+00
26	forever-alone.jpg	26	2017-03-26 02:28:16.71293+00	2017-03-26 02:28:16.712966+00
27	courage-wolf.jpg	27	2017-03-26 02:28:16.773146+00	2017-03-26 02:28:16.773184+00
28	sophisticated-cat.jpg	28	2017-03-26 02:28:16.798806+00	2017-03-26 02:28:16.798844+00
29	lazy-college-senior.jpg	29	2017-03-26 02:28:16.827061+00	2017-03-26 02:28:16.827097+00
30	business-cat.jpg	30	2017-03-26 02:28:16.861517+00	2017-03-26 02:28:16.861561+00
31	sudden-clairity-clarence.jpg	31	2017-03-26 02:28:16.890165+00	2017-03-26 02:28:16.890205+00
32	hipster-barista.jpg	32	2017-03-26 02:28:16.923505+00	2017-03-26 02:28:16.92355+00
33	socially-awesome-awkward-penguin.jpg	33	2017-03-26 02:28:16.983541+00	2017-03-26 02:28:16.983575+00
34	all-the-things.png	34	2017-03-26 02:28:17.009235+00	2017-03-26 02:28:17.009268+00
35	pedobear.png	35	2017-03-26 02:28:17.047738+00	2017-03-26 02:28:17.047805+00
36	scumbag-steve.jpg	36	2017-03-26 02:28:17.093855+00	2017-03-26 02:28:17.093894+00
37	grumpy-cat.jpg	37	2017-03-26 02:28:17.147906+00	2017-03-26 02:28:17.147953+00
38	drunk-baby.jpg	38	2017-03-26 02:28:17.19804+00	2017-03-26 02:28:17.198079+00
39	bad-joke-eel.jpg	39	2017-03-26 02:28:17.264366+00	2017-03-26 02:28:17.264406+00
40	schrute-facts.jpg	40	2017-03-26 02:28:17.290395+00	2017-03-26 02:28:17.290433+00
41	ski-instructor.jpg	41	2017-03-26 02:28:17.368507+00	2017-03-26 02:28:17.36855+00
42	scumbag-teacher.jpg	42	2017-03-26 02:28:17.394821+00	2017-03-26 02:28:17.395023+00
43	sheltering-suburban-mom.jpg	43	2017-03-26 02:28:17.465148+00	2017-03-26 02:28:17.465185+00
44	y-u-no.png	44	2017-03-26 02:28:17.508606+00	2017-03-26 02:28:17.508641+00
45	butthurt-dweller.jpg	45	2017-03-26 02:28:17.551038+00	2017-03-26 02:28:17.551073+00
46	bear-grylls.jpg	46	2017-03-26 02:28:17.581024+00	2017-03-26 02:28:17.58124+00
47	paranoid-parrot.jpg	47	2017-03-26 02:28:17.63106+00	2017-03-26 02:28:17.631095+00
48	politically-correct-redneck.jpg	48	2017-03-26 02:28:17.68116+00	2017-03-26 02:28:17.681196+00
49	scumbag-stacy.jpg	49	2017-03-26 02:28:17.74134+00	2017-03-26 02:28:17.741379+00
50	hipster-kitty.jpg	50	2017-03-26 02:28:17.781422+00	2017-03-26 02:28:17.781458+00
51	high-expectations-asian-father.jpg	51	2017-03-26 02:28:17.843791+00	2017-03-26 02:28:17.84383+00
52	good-girl-gina.jpg	52	2017-03-26 02:28:17.896249+00	2017-03-26 02:28:17.896284+00
53	annoying-childhood-friend.jpg	53	2017-03-26 02:28:17.960121+00	2017-03-26 02:28:17.960242+00
54	baby-godfather.jpg	54	2017-03-26 02:28:18.016523+00	2017-03-26 02:28:18.016563+00
55	captain-hindsight.jpg	55	2017-03-26 02:28:18.072271+00	2017-03-26 02:28:18.072309+00
56	too-damn-high.jpg	56	2017-03-26 02:28:18.232941+00	2017-03-26 02:28:18.232987+00
57	skeptical-3rd-world-kid.jpg	57	2017-03-26 02:28:18.288243+00	2017-03-26 02:28:18.288281+00
58	willy-wonka.jpg	58	2017-03-26 02:28:18.330719+00	2017-03-26 02:28:18.330775+00
59	ermahgerd.jpg	59	2017-03-26 02:28:18.38315+00	2017-03-26 02:28:18.383195+00
60	put-it-somewhere.jpg	60	2017-03-26 02:28:18.457583+00	2017-03-26 02:28:18.457623+00
61	spiderman.jpg	61	2017-03-26 02:28:18.493659+00	2017-03-26 02:28:18.493711+00
62	matrix-morpheus.jpg	62	2017-03-26 02:28:18.541365+00	2017-03-26 02:28:18.541402+00
63	fuck-me-right.jpg	63	2017-03-26 02:28:18.582721+00	2017-03-26 02:28:18.58278+00
64	you-cant-explain-that.jpg	64	2017-03-26 02:28:18.603608+00	2017-03-26 02:28:18.60365+00
65	picard-facepalm.jpg	65	2017-03-26 02:28:18.658377+00	2017-03-26 02:28:18.658495+00
66	lame-pun-racoon.jpg	66	2017-03-26 02:28:18.701742+00	2017-03-26 02:28:18.701789+00
67	grinds-my-gears.jpg	67	2017-03-26 02:28:18.762023+00	2017-03-26 02:28:18.762057+00
68	yo-dawg.jpg	68	2017-03-26 02:28:18.82857+00	2017-03-26 02:28:18.828604+00
69	slowpoke.jpg	69	2017-03-26 02:28:18.864325+00	2017-03-26 02:28:18.86436+00
70	college-liberal.jpg	70	2017-03-26 02:28:18.8984+00	2017-03-26 02:28:18.898435+00
71	am-i-the-only-one.jpg	71	2017-03-26 02:28:18.92452+00	2017-03-26 02:28:18.924556+00
72	overly-manly-man.jpg	72	2017-03-26 02:28:18.974527+00	2017-03-26 02:28:18.974565+00
73	stoner-dog.jpg	73	2017-03-26 02:28:19.029129+00	2017-03-26 02:28:19.029172+00
74	downvoting-roman.jpg	74	2017-03-26 02:28:19.49708+00	2017-03-26 02:28:19.497115+00
75	bold-move-cotton.jpg	75	2017-03-26 02:28:19.896809+00	2017-03-26 02:28:19.896841+00
76	thumbs-up-obama.jpg	76	2017-03-26 02:28:19.978872+00	2017-03-26 02:28:19.978906+00
77	pickup-line-panda.jpg	77	2017-03-26 02:28:20.302817+00	2017-03-26 02:28:20.302869+00
78	good-guy-boss.jpg	78	2017-03-26 02:28:20.637782+00	2017-03-26 02:28:20.637837+00
79	it-was-a-good-day.jpg	79	2017-03-26 02:28:20.726922+00	2017-03-26 02:28:20.726963+00
80	everyone-loses-their-mind.jpg	80	2017-03-26 02:28:20.749003+00	2017-03-26 02:28:20.749041+00
81	confession-kid.jpg	81	2017-03-26 02:28:20.824108+00	2017-03-26 02:28:20.824156+00
82	evil-plotting-racoon.jpg	82	2017-03-26 02:28:21.034818+00	2017-03-26 02:28:21.034869+00
83	pepperidge-farm-remembers.jpg	83	2017-03-26 02:28:21.244129+00	2017-03-26 02:28:21.244176+00
84	badass.png	84	2017-03-26 02:28:21.29849+00	2017-03-26 02:28:21.298527+00
85	unpopular-opinion-puffin.jpg	85	2017-03-26 02:28:21.340664+00	2017-03-26 02:28:21.340701+00
86	socially-awesome-penguin.jpg	86	2017-03-26 02:28:21.410886+00	2017-03-26 02:28:21.410929+00
87	i-guarantee-it.jpg	87	2017-03-26 02:28:21.450929+00	2017-03-26 02:28:21.450968+00
88	maury-lie-detector.jpg	88	2017-03-26 02:28:21.511156+00	2017-03-26 02:28:21.511193+00
89	caddy-shack.jpg	89	2017-03-26 02:28:21.56938+00	2017-03-26 02:28:21.569535+00
90	ill-have-you-know.jpg	90	2017-03-26 02:28:21.619391+00	2017-03-26 02:28:21.619431+00
91	rafiki-the-wise.jpg	91	2017-03-26 02:28:21.676278+00	2017-03-26 02:28:21.676315+00
92	and-its-gone.jpg	92	2017-03-26 02:28:21.706118+00	2017-03-26 02:28:21.706155+00
93	peculiar-potoo.jpg	93	2017-03-26 02:28:21.749666+00	2017-03-26 02:28:21.749702+00
94	success-kid.jpg	94	2017-03-26 02:28:21.786729+00	2017-03-26 02:28:21.786788+00
95	third-world-success.jpg	95	2017-03-26 02:28:21.826552+00	2017-03-26 02:28:21.826588+00
96	awkward-moment-seal.jpg	96	2017-03-26 02:28:21.906869+00	2017-03-26 02:28:21.906917+00
97	scumbag-parents.jpg	97	2017-03-26 02:28:21.970568+00	2017-03-26 02:28:21.970811+00
98	sexually-oblivious-female.jpg	98	2017-03-26 02:28:22.004588+00	2017-03-26 02:28:22.004625+00
99	scumbag-brain.jpg	99	2017-03-26 02:28:22.042429+00	2017-03-26 02:28:22.042468+00
100	grandma-finds-the-internet.jpg	100	2017-03-26 02:28:22.090477+00	2017-03-26 02:28:22.090516+00
101	blackjack-and-hookers.jpg	101	2017-03-26 02:28:22.142798+00	2017-03-26 02:28:22.142838+00
102	small-fact-frog.jpg	102	2017-03-26 02:28:22.162826+00	2017-03-26 02:28:22.162863+00
103	do-you-want-ants.jpg	103	2017-03-26 02:28:22.207005+00	2017-03-26 02:28:22.207046+00
104	dave-chapelle-crackhead.jpg	104	2017-03-26 02:28:22.242999+00	2017-03-26 02:28:22.243037+00
105	minor-mistake-marvin.jpg	105	2017-03-26 02:28:22.293148+00	2017-03-26 02:28:22.293186+00
106	none-of-my-business.jpg	106	2017-03-26 02:28:22.353266+00	2017-03-26 02:28:22.353301+00
107	afraid-to-ask-andy.jpg	107	2017-03-26 02:28:22.373178+00	2017-03-26 02:28:22.373214+00
108	satisfied-seal.jpg	108	2017-03-26 02:28:22.40121+00	2017-03-26 02:28:22.401245+00
109	american-pride-eagle.jpg	109	2017-03-26 02:28:22.423431+00	2017-03-26 02:28:22.423466+00
110	roll-safe.jpg	110	2017-03-26 02:28:22.444714+00	2017-03-26 02:28:22.444768+00
111	roll-safe-v1.JPG	110	2017-03-26 02:28:22.473642+00	2017-03-26 02:28:22.473678+00
112	roll-safe-v2.jpg	110	2017-03-26 02:28:22.48692+00	2017-03-26 02:28:22.486954+00
113	that-would-be-great.jpg	111	2017-03-26 02:28:22.533776+00	2017-03-26 02:28:22.533813+00
114	advice-god.jpg	112	2017-03-26 02:28:22.562861+00	2017-03-26 02:28:22.562897+00
115	cash-me-outside.jpg	113	2017-03-26 02:28:22.611991+00	2017-03-26 02:28:22.612133+00
\.


--
-- Name: memes_memefile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('memes_memefile_id_seq', 115, true);


--
-- Data for Name: reddit_redditpost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reddit_redditpost (id, submission_id, likely_meme_id, image_similarity, image_url, title, subreddit, subreddit_id, permalink, submission_created, author, closest_image_id, over_18, created_date, modified_date) FROM stdin;
1	61g94u	70	0.5798	http://imgur.com/kd6ghu1	My sister says this all the time.....	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61g94u/my_sister_says_this_all_the_time/	2017-03-25 16:08:13+00	ColoradO_Elvis	70	f	2017-03-26 02:31:26.570824+00	2017-03-26 02:31:26.570872+00
2	61gms4	80	0.4173	https://i.redd.it/tqyjy6528lny.jpg	After turning in my two week notice...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61gms4/after_turning_in_my_two_week_notice/	2017-03-25 17:18:26+00	areskratos	80	f	2017-03-26 02:31:28.713366+00	2017-03-26 02:31:28.713395+00
3	61ffcu	63	0.6968	http://imgur.com/qP4mXGq	To congress wanting to sell internet history to ISPs	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61ffcu/to_congress_wanting_to_sell_internet_history_to/	2017-03-25 13:05:09+00	IpilotAnEVA	63	f	2017-03-26 02:31:30.987634+00	2017-03-26 02:31:30.987674+00
4	61frtv	110	0.4705	https://imgflip.com/i/1m2tle#RhQBgeAQ3J1qhOqV.16	If you don't have a way of improving something, then don't mess with it.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61frtv/if_you_dont_have_a_way_of_improving_something/	2017-03-25 14:29:56+00	Dirt_E_Harry	112	f	2017-03-26 02:31:32.852302+00	2017-03-26 02:31:32.85234+00
5	61hzde	94	0.6675	http://i.imgur.com/AWS0iQX.png	One of the biggest achievements of my life so far.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61hzde/one_of_the_biggest_achievements_of_my_life_so_far/	2017-03-25 21:30:20+00	IroncladPen	94	f	2017-03-26 02:31:34.618207+00	2017-03-26 02:31:34.618242+00
6	61fa69	38	0.5222	http://imgur.com/Rsw33Bn	Life tip for my brother and friends	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61fa69/life_tip_for_my_brother_and_friends/	2017-03-25 12:25:00+00	Lysergik_D	38	f	2017-03-26 02:31:37.966407+00	2017-03-26 02:31:37.966445+00
7	61h67h	9	0.8493	http://imgur.com/OzW2BZP	Been working hard this Saturday morning to get caught up	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61h67h/been_working_hard_this_saturday_morning_to_get/	2017-03-25 18:56:52+00	Midwest_Med_Student	9	f	2017-03-26 02:31:39.865058+00	2017-03-26 02:31:39.865093+00
8	61gt04	10	0.7885	http://imgur.com/xmSK1lq	This just dawned on me	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61gt04/this_just_dawned_on_me/	2017-03-25 17:49:36+00	LetsJerkCircular	10	f	2017-03-26 02:31:42.065445+00	2017-03-26 02:31:42.065476+00
9	61gqfj	108	0.6282	https://i.redd.it/jotj9u8fblny.jpg	If it didn't make you feel the same way you wouldn't have bothered to put it on.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61gqfj/if_it_didnt_make_you_feel_the_same_way_you/	2017-03-25 17:36:45+00	QuiefMop	108	f	2017-03-26 02:31:44.367407+00	2017-03-26 02:31:44.367445+00
10	61dxhk	6	0.7231	https://i.imgur.com/rpFoLL5.jpg	This applies to both sides of the aisle today. Thanks guys	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61dxhk/this_applies_to_both_sides_of_the_aisle_today/	2017-03-25 04:44:23+00	StankKunt42	6	f	2017-03-26 02:31:46.289006+00	2017-03-26 02:31:46.289046+00
11	61c8wf	87	0.6556	https://i.imgflip.com/1m1tkk.jpg	For people telling others they should have nothing to hide, they sure have a lot to hide	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61c8wf/for_people_telling_others_they_should_have/	2017-03-24 22:47:46+00	milleunaire	87	f	2017-03-26 02:31:48.227836+00	2017-03-26 02:31:48.227875+00
12	61hih3	78	0.9501	https://i.redd.it/gvsa0pt21mny.jpg	I think it was a good guy boss for that moment.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61hih3/i_think_it_was_a_good_guy_boss_for_that_moment/	2017-03-25 20:00:42+00	AlphaTheJob	78	f	2017-03-26 02:31:50.17839+00	2017-03-26 02:31:50.178426+00
13	61ibyj	15	0.5351	http://imgur.com/drZ6J62	Every time I hear it...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61ibyj/every_time_i_hear_it/	2017-03-25 22:38:32+00	Alex_Duncs96	15	f	2017-03-26 02:31:52.07053+00	2017-03-26 02:31:52.070566+00
14	61hrbz	47	0.7949	http://imgur.com/Cvd7uYB	Holy cow am I paranoid	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61hrbz/holy_cow_am_i_paranoid/	2017-03-25 20:47:40+00	AWeepingAngelsThesis	47	f	2017-03-26 02:31:53.978465+00	2017-03-26 02:31:53.9785+00
15	61i8jz	6	0.6396	http://imgur.com/1Chau6H	GG CD Projekt Red	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61i8jz/gg_cd_projekt_red/	2017-03-25 22:19:31+00	Jonkinch	6	f	2017-03-26 02:31:55.765655+00	2017-03-26 02:31:55.765702+00
16	61hnx4	74	0.4501	http://imgur.com/AeDnYPg	When I eat the entire bag of chips and only leave a handful for everyone else.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61hnx4/when_i_eat_the_entire_bag_of_chips_and_only_leave/	2017-03-25 20:30:01+00	pimpnocchio	74	f	2017-03-26 02:31:57.493956+00	2017-03-26 02:31:57.493993+00
17	61djpn	6	0.6243	https://i.redd.it/zmq1e06z0hny.jpg	This really made my night.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61djpn/this_really_made_my_night/	2017-03-25 03:11:05+00	RushFox	6	f	2017-03-26 02:31:59.664075+00	2017-03-26 02:31:59.664117+00
18	61gub5	5	0.8540	http://i.imgur.com/fVGbWk8.png	In my experience, if they are capable of one, they can't be trusted in the other.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61gub5/in_my_experience_if_they_are_capable_of_one_they/	2017-03-25 17:56:17+00	Barfuzio	5	f	2017-03-26 02:32:01.63553+00	2017-03-26 02:32:01.635568+00
20	61i400	5	0.8353	http://i.imgur.com/A9jK9hf.png	Seems we're checking our grammar	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61i400/seems_were_checking_our_grammar/	2017-03-25 21:54:58+00	RunsWithLava	5	f	2017-03-26 02:32:03.388592+00	2017-03-26 02:32:03.38863+00
22	61cmfn	110	0.7170	http://imgur.com/GpkwczY	Anti Vaxxers	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61cmfn/anti_vaxxers/	2017-03-24 23:58:18+00	bradinusa	111	f	2017-03-26 02:32:05.150437+00	2017-03-26 02:32:05.150474+00
24	61i6aq	5	0.8827	https://i.redd.it/s6z9m08nnmny.jpg	Caution. Don't make the same mistake I did.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61i6aq/caution_dont_make_the_same_mistake_i_did/	2017-03-25 22:07:03+00	ForgottenPhenom	5	f	2017-03-26 02:32:07.145781+00	2017-03-26 02:32:07.145819+00
26	61dlv3	5	0.7265	http://www.livememe.com/55yraht	Because way too many people still do this.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61dlv3/because_way_too_many_people_still_do_this/	2017-03-25 03:24:51+00	gtrmu223	5	f	2017-03-26 02:32:09.529762+00	2017-03-26 02:32:09.529797+00
28	61d4ki	49	0.5278	http://i.imgur.com/JbPZYik.jpg	My SIL just showed up unexpected, and says she is going home to go to bed.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61d4ki/my_sil_just_showed_up_unexpected_and_says_she_is/	2017-03-25 01:38:11+00	Ralph-Hinkley	49	f	2017-03-26 02:32:11.507664+00	2017-03-26 02:32:11.507712+00
67	61ik0e	82	0.4365	http://imgur.com/8Yc86vZ	Smitten kitten	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61ik0e/smitten_kitten/	2017-03-25 23:23:21+00	SneakyHippo91	82	f	2017-03-26 02:33:10.571033+00	2017-03-26 02:33:10.571069+00
30	61i91m	88	0.5920	https://i.redd.it/j9wtajqaqmny.jpg	He asked me if I have a sister and even gave me a nice comment.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61i91m/he_asked_me_if_i_have_a_sister_and_even_gave_me_a/	2017-03-25 22:22:07+00	RedditEqualsLife	88	f	2017-03-26 02:32:13.286826+00	2017-03-26 02:32:13.286863+00
38	61i61y	9	0.6056	http://imgur.com/8Ygvrp9	Of course, I wanted to over hear your trivial conversation.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61i61y/of_course_i_wanted_to_over_hear_your_trivial/	2017-03-25 22:05:45+00	aeonicgnosis	9	f	2017-03-26 02:32:22.237693+00	2017-03-26 02:32:22.237731+00
40	61fhhd	110	0.5466	http://i.imgur.com/d2nLqjy.jpg	you people sickens me	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61fhhd/you_people_sickens_me/	2017-03-25 13:20:45+00	xHussin	111	f	2017-03-26 02:32:24.020219+00	2017-03-26 02:32:24.020258+00
42	61j48b	24	0.6007	https://imgflip.com/i/1m3tg8#sC1mbZQHHG0hpYrM.16	Introducing Cryin' Ryan, Who Just Blew Up the GOP's Agenda	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61j48b/introducing_cryin_ryan_who_just_blew_up_the_gops/	2017-03-26 01:21:50+00	throw667	24	f	2017-03-26 02:32:25.841323+00	2017-03-26 02:32:25.84136+00
44	61aesp	110	0.5865	http://imgur.com/Exl4Ilp	People seem to keep forgetting this option	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61aesp/people_seem_to_keep_forgetting_this_option/	2017-03-24 17:42:22+00	DontFearTruth	112	f	2017-03-26 02:32:27.847555+00	2017-03-26 02:32:27.847588+00
46	61ij8u	70	0.5871	http://imgur.com/Uq9WUof	My fairly progressive mom	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61ij8u/my_fairly_progressive_mom/	2017-03-25 23:18:49+00	Scotsch	70	f	2017-03-26 02:32:29.719266+00	2017-03-26 02:32:29.719299+00
32	61ehfd	25	0.8106	http://www.livememe.com/owgkn35	I love my family, but...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61ehfd/i_love_my_family_but/	2017-03-25 07:34:49+00	Wrestlingculture	25	f	2017-03-26 02:32:16.581562+00	2017-03-26 02:32:16.581598+00
34	619f4r	92	0.6376	http://i.imgur.com/SoQrjoX.png	Once your internet history is up for sale, insurance companies be like...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/619f4r/once_your_internet_history_is_up_for_sale/	2017-03-24 15:01:48+00	Barfuzio	92	f	2017-03-26 02:32:18.539613+00	2017-03-26 02:32:18.53965+00
36	61jazm	89	0.6564	http://imgur.com/j13GXAl	It's been rough.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61jazm/its_been_rough/	2017-03-26 02:05:02+00	shaky_handed_surgeon	89	f	2017-03-26 02:32:20.314508+00	2017-03-26 02:32:20.314543+00
48	61bw6c	87	0.6225	https://i.redd.it/06atbbyqefny.jpg	Now that internet searches can be purchased	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61bw6c/now_that_internet_searches_can_be_purchased/	2017-03-24 21:44:43+00	Scubazz	87	f	2017-03-26 02:32:31.606834+00	2017-03-26 02:32:31.606871+00
49	61j5a9	110	0.4081	http://i.imgur.com/pNyHCBR.png	My experience with Tinder and OkCupid so far.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61j5a9/my_experience_with_tinder_and_okcupid_so_far/	2017-03-26 01:28:32+00	kibblznbitz	112	f	2017-03-26 02:32:34.728456+00	2017-03-26 02:32:34.728494+00
50	61fw4u	103	0.8408	http://imgur.com/ATq8Ycf	When I deliver pizza to a drunk guy who complains for 5 minutes why the person on the phone 'had the the ability' to give him the online discount before not tipping anyway.....	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61fw4u/when_i_deliver_pizza_to_a_drunk_guy_who_complains/	2017-03-25 14:55:51+00	aeonicgnosis	103	f	2017-03-26 02:32:36.648368+00	2017-03-26 02:32:36.648406+00
51	61fk80	110	0.5380	https://i.redd.it/67nxp3mq4kny.jpg	It's even worse than the inability to write "M*A*S*H" in a reddit comment	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61fk80/its_even_worse_than_the_inability_to_write_mash/	2017-03-25 13:40:18+00	SailorVanIndium	112	f	2017-03-26 02:32:38.665173+00	2017-03-26 02:32:38.66521+00
52	61i2kn	108	0.8638	https://i.redd.it/tpguvou2kmny.jpg	Gotta love 'em	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61i2kn/gotta_love_em/	2017-03-25 21:47:21+00	SailorVanIndium	108	f	2017-03-26 02:32:40.675965+00	2017-03-26 02:32:40.676002+00
53	61hi1q	56	0.7385	https://imgflip.com/i/1m3cd9#5Tmd25gwGvp3opc5.16	How many $20 pans do I even need?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61hi1q/how_many_20_pans_do_i_even_need/	2017-03-25 19:58:24+00	SeriousBlak	56	f	2017-03-26 02:32:42.595895+00	2017-03-26 02:32:42.595931+00
54	61aygq	90	0.3995	http://imgur.com/raMmmGR	Other subreddits hate it. Click here to find out why.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61aygq/other_subreddits_hate_it_click_here_to_find_out/	2017-03-24 19:10:19+00	Cliff_Brisco	90	f	2017-03-26 02:32:44.271025+00	2017-03-26 02:32:44.271063+00
55	618x4d	25	0.9443	https://i.redd.it/jpzszufhycny.jpg	It's usually the only time I get to myself.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/618x4d/its_usually_the_only_time_i_get_to_myself/	2017-03-24 13:29:59+00	Phoenix_Pyre	25	f	2017-03-26 02:32:46.03802+00	2017-03-26 02:32:46.038056+00
56	61hveo	110	0.3370	http://i.imgur.com/DcmL4Ab.png	My neck still hurts, but at least I got to hear all about her parents recent extra-marital affairs	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61hveo/my_neck_still_hurts_but_at_least_i_got_to_hear/	2017-03-25 21:09:17+00	Doc-in-a-box	112	f	2017-03-26 02:32:47.786543+00	2017-03-26 02:32:47.786581+00
57	61a1kl	111	0.7006	http://imgur.com/uGdRo6s	Regarding Dave Chappelle's "anti-LGBTQ" jokes	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61a1kl/regarding_dave_chappelles_antilgbtq_jokes/	2017-03-24 16:45:29+00	Xeo7	113	f	2017-03-26 02:32:50.99347+00	2017-03-26 02:32:50.9935+00
58	61chev	25	0.9186	https://i.imgur.com/2PuioD4.jpg	I'll have you know that I haven't jacked off for only five hours	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61chev/ill_have_you_know_that_i_havent_jacked_off_for/	2017-03-24 23:31:35+00	GoldJomell	25	f	2017-03-26 02:32:52.847455+00	2017-03-26 02:32:52.84749+00
59	61fey0	108	0.6917	https://imgflip.com/i/1m2pyo#rb3LRPJ0Mk7U1IsT.16	Me, running a bit late for work today.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61fey0/me_running_a_bit_late_for_work_today/	2017-03-25 13:02:17+00	Dirt_E_Harry	108	f	2017-03-26 02:32:55.125495+00	2017-03-26 02:32:55.125533+00
60	61dozg	110	0.5199	https://i.redd.it/z306jxqo6hny.jpg	What 'pulled the health care vote' really means - don't celebrate quite yet	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61dozg/what_pulled_the_health_care_vote_really_means/	2017-03-25 03:45:02+00	MrBeverage	111	f	2017-03-26 02:32:57.156771+00	2017-03-26 02:32:57.156809+00
61	61853r	101	0.7652	http://i.imgur.com/BDlO7lD.png	Internet privacy law	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61853r/internet_privacy_law/	2017-03-24 10:26:36+00	frenzy3	101	f	2017-03-26 02:32:59.066093+00	2017-03-26 02:32:59.066131+00
62	61fgze	108	0.6901	http://imgur.com/pjy15Vi	Oh what a feeling!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61fgze/oh_what_a_feeling/	2017-03-25 13:17:07+00	Wrxpk	108	f	2017-03-26 02:33:01.063122+00	2017-03-26 02:33:01.063159+00
63	61i28l	23	0.7690	http://imgur.com/vvVNvyP	It's right around the corner.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61i28l/its_right_around_the_corner/	2017-03-25 21:45:40+00	TheGrunt	23	f	2017-03-26 02:33:02.969931+00	2017-03-26 02:33:02.969968+00
64	61idx5	56	0.7326	https://i.redd.it/z7kock8xumny.jpg	Maybe I'm just too old-school, but it's mighty hard to keep up with things these days.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61idx5/maybe_im_just_too_oldschool_but_its_mighty_hard/	2017-03-25 22:49:13+00	RidleyXJ	56	f	2017-03-26 02:33:04.654545+00	2017-03-26 02:33:04.654581+00
65	61gmas	28	0.7025	https://i.redd.it/acvu9pzc7lny.jpg	What all the internet histories will tell us	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61gmas/what_all_the_internet_histories_will_tell_us/	2017-03-25 17:16:06+00	Hotspur000	28	f	2017-03-26 02:33:07.137015+00	2017-03-26 02:33:07.137053+00
66	618cl1	25	0.8809	https://i.redd.it/wepcqwt1ccny.jpg	Even now, confinement seems much more punishing than solitude.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/618cl1/even_now_confinement_seems_much_more_punishing/	2017-03-24 11:25:15+00	SailorVanIndium	25	f	2017-03-26 02:33:08.84077+00	2017-03-26 02:33:08.840806+00
68	6187wv	25	0.8413	http://i.imgur.com/mUeqPJe.png	He was mortified, I couldn't stop laughing	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/6187wv/he_was_mortified_i_couldnt_stop_laughing/	2017-03-24 10:48:48+00	Asesela422	25	f	2017-03-26 02:33:12.954669+00	2017-03-26 02:33:12.954718+00
69	619twb	82	0.3806	http://imgur.com/H93VWC5	Enjoy that, dear	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/619twb/enjoy_that_dear/	2017-03-24 16:11:15+00	TraderMing	82	f	2017-03-26 02:33:14.577824+00	2017-03-26 02:33:14.577862+00
70	61idkh	110	0.6987	https://i.redd.it/tjazjv1uumny.jpg	Smart	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61idkh/smart/	2017-03-25 22:47:30+00	Wolfy0	112	f	2017-03-26 02:33:16.588082+00	2017-03-26 02:33:16.58812+00
71	6196ie	43	0.8329	https://i.redd.it/e08kwx887dny.jpg	This Always Flummoxed Me	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/6196ie/this_always_flummoxed_me/	2017-03-24 14:19:09+00	LuckLovesVirtue	43	f	2017-03-26 02:33:18.484647+00	2017-03-26 02:33:18.484695+00
72	61ej42	25	0.8998	https://i.redd.it/zndsuk3meiny.jpg	Apparently you can be passive aggressive to Amazon	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61ej42/apparently_you_can_be_passive_aggressive_to_amazon/	2017-03-25 07:52:03+00	absolut_ian	25	f	2017-03-26 02:33:20.155641+00	2017-03-26 02:33:20.155688+00
73	61i6zk	82	0.3649	http://imgur.com/ybfUsZF	My husband's grandmother is constantly flooding my Facebook newsfeed with Trump propaganda...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61i6zk/my_husbands_grandmother_is_constantly_flooding_my/	2017-03-25 22:11:03+00	Jeevan31	82	f	2017-03-26 02:33:23.112999+00	2017-03-26 02:33:23.113038+00
74	61egjt	94	0.7999	http://i.imgur.com/3GdC3Z9.jpg	Turns out ending one bad habit helps another	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61egjt/turns_out_ending_one_bad_habit_helps_another/	2017-03-25 07:26:24+00	LUBED_WII_MOTE	94	f	2017-03-26 02:33:26.139925+00	2017-03-26 02:33:26.139961+00
75	61e5jq	21	0.7302	http://i.imgur.com/6bHMPhe.png	It's probably sufficient.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61e5jq/its_probably_sufficient/	2017-03-25 05:48:44+00	HarrumphingDuck	21	f	2017-03-26 02:33:29.264172+00	2017-03-26 02:33:29.264209+00
76	61dumv	94	0.7014	https://i.redd.it/72v8thtvdhny.jpg	And I'm a Pretty Unfunny Guy	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61dumv/and_im_a_pretty_unfunny_guy/	2017-03-25 04:23:49+00	Lantern_cs	94	f	2017-03-26 02:33:30.994222+00	2017-03-26 02:33:30.994258+00
77	61ejvr	25	0.8774	http://i.imgur.com/6WK0Ygc.png	May be its wrong..	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61ejvr/may_be_its_wrong/	2017-03-25 08:00:02+00	Hughesvaik	25	f	2017-03-26 02:33:32.714481+00	2017-03-26 02:33:32.714519+00
78	61cgsp	25	0.9206	http://imgur.com/Ffosw3J	It truly is shameful	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61cgsp/it_truly_is_shameful/	2017-03-24 23:28:15+00	AWeepingAngelsThesis	25	f	2017-03-26 02:33:34.434605+00	2017-03-26 02:33:34.434641+00
79	61dbwv	17	0.7601	http://imgur.com/12wJwP1	Rocktagenarian! And there was a perfectly restored Model A outside the restaurant, too	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61dbwv/rocktagenarian_and_there_was_a_perfectly_restored/	2017-03-25 02:22:12+00	pottzie	17	f	2017-03-26 02:33:37.537916+00	2017-03-26 02:33:37.537954+00
80	61j9qs	81	0.7252	http://imgur.com/IXNgrK7	I don't remember when I first heard the term, but I believed this for an embarrassingly long time	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61j9qs/i_dont_remember_when_i_first_heard_the_term_but_i/	2017-03-26 01:57:32+00	thewriter_anonymous	81	f	2017-03-26 02:33:39.441349+00	2017-03-26 02:33:39.441388+00
81	61ej36	93	0.4250	https://i.redd.it/1u1m6fq0finy.jpg	Soooo, do you?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61ej36/soooo_do_you/	2017-03-25 07:51:36+00	psykotic24	93	f	2017-03-26 02:33:41.56025+00	2017-03-26 02:33:41.560288+00
82	61gruq	8	0.8939	http://memedad.com/memes/1139700.jpg	Basically you are full of shit and to tell people they don't need to eject media is irresponsible	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61gruq/basically_you_are_full_of_shit_and_to_tell_people/	2017-03-25 17:43:54+00	MoneyIsTiming	8	f	2017-03-26 02:33:44.587755+00	2017-03-26 02:33:44.587793+00
83	61czfa	36	0.7780	http://i.imgur.com/OdUPolX.png	My cousins is a real piece of work.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61czfa/my_cousins_is_a_real_piece_of_work/	2017-03-25 01:08:15+00	OverPot	36	f	2017-03-26 02:33:46.582865+00	2017-03-26 02:33:46.582901+00
84	61bolw	110	0.4006	https://i.redd.it/cyrjchj98fny.jpg	You couldn't possibly understand...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61bolw/you_couldnt_possibly_understand/	2017-03-24 21:08:24+00	pleasantliving	112	f	2017-03-26 02:33:48.284719+00	2017-03-26 02:33:48.284757+00
85	618rky	31	0.7596	http://i.imgur.com/kJRGYS8.png	We picked a pretty common name for our kid, meeting other parents with babies the same age, all of them have "unique" names	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/618rky/we_picked_a_pretty_common_name_for_our_kid/	2017-03-24 12:58:31+00	Dave_Hulud	31	f	2017-03-26 02:33:51.268418+00	2017-03-26 02:33:51.268456+00
86	61c6b0	24	0.8939	https://i.imgflip.com/1m1exd.jpg	Trump's campaign	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61c6b0/trumps_campaign/	2017-03-24 22:34:23+00	Cycloptic_Floppycock	24	f	2017-03-26 02:33:53.050007+00	2017-03-26 02:33:53.050045+00
87	614wzp	68	0.7067	http://imgur.com/fY2Ki8K	I bartend and my wife takes call at a hospital. Every time our schedules conflict and I get to have this conversation with the babysitter.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/614wzp/i_bartend_and_my_wife_takes_call_at_a_hospital/	2017-03-23 21:48:51+00	Mlnkoly111	68	f	2017-03-26 02:33:56.181099+00	2017-03-26 02:33:56.181137+00
88	615ofr	94	0.6902	http://imgur.com/6ZE7imD	Most people would be offended. Unless you are an introvert.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/615ofr/most_people_would_be_offended_unless_you_are_an/	2017-03-24 00:02:29+00	Zutta	94	f	2017-03-26 02:33:58.005401+00	2017-03-26 02:33:58.005439+00
89	61ewfd	107	0.6753	https://imgflip.com/i/1m2kgr#E6OuyoODzaxU61bi.16	I know i could google it, but I'm too afraid to do that too.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61ewfd/i_know_i_could_google_it_but_im_too_afraid_to_do/	2017-03-25 10:11:14+00	JohnDeereWife	107	f	2017-03-26 02:34:01.316923+00	2017-03-26 02:34:01.316961+00
90	61cyv7	25	0.8121	http://www.livememe.com/jo3ycld	One of my actual co-workers in video stand up today	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61cyv7/one_of_my_actual_coworkers_in_video_stand_up_today/	2017-03-25 01:05:09+00	jaylittle	25	f	2017-03-26 02:34:13.613519+00	2017-03-26 02:34:13.613557+00
91	61df0d	81	0.7817	http://imgur.com/zAXntGb	I was not the smartest child	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61df0d/i_was_not_the_smartest_child/	2017-03-25 02:41:28+00	Downvoterofall	81	f	2017-03-26 02:34:15.957864+00	2017-03-26 02:34:15.957902+00
92	61dwwb	82	0.3929	https://i.redd.it/brpgbclrghny.jpg	My first time driving a uhaul was today	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61dwwb/my_first_time_driving_a_uhaul_was_today/	2017-03-25 04:39:37+00	drjojoro	82	f	2017-03-26 02:34:17.871195+00	2017-03-26 02:34:17.871232+00
93	61aeuq	96	0.6749	https://i.redd.it/hmkdsxyj7eny.jpg	It wasn't a discrete conversation.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61aeuq/it_wasnt_a_discrete_conversation/	2017-03-24 17:42:36+00	cygnisprime	96	f	2017-03-26 02:34:19.76234+00	2017-03-26 02:34:19.762378+00
94	61clqy	110	0.4560	http://www.livememe.com/5vkemjl	A classic case of doing the right thing for the wrong reasons...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61clqy/a_classic_case_of_doing_the_right_thing_for_the/	2017-03-24 23:54:45+00	id0ru	111	f	2017-03-26 02:34:21.935925+00	2017-03-26 02:34:21.935961+00
95	61dtbp	110	0.5082	http://i.imgur.com/yR4NVcE.png	I am awaited in Valhalla!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61dtbp/i_am_awaited_in_valhalla/	2017-03-25 04:14:14+00	richf2001	112	f	2017-03-26 02:34:23.829318+00	2017-03-26 02:34:23.829353+00
96	61c1vx	3	0.8223	http://i.imgur.com/q4yvMQy.jpg	Every time	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61c1vx/every_time/	2017-03-24 22:11:57+00	Madux37	3	f	2017-03-26 02:34:25.503571+00	2017-03-26 02:34:25.503609+00
97	61cfqu	25	0.8747	http://i.imgur.com/bQhZ7Lg.jpg	Hi Reddit...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61cfqu/hi_reddit/	2017-03-24 23:22:30+00	Murler	25	f	2017-03-26 02:34:27.173865+00	2017-03-26 02:34:27.173902+00
98	61bje0	110	0.5234	http://i.imgur.com/8er0la9.png	Whenever I drink too much coffee	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61bje0/whenever_i_drink_too_much_coffee/	2017-03-24 20:44:22+00	Dave_Hulud	112	f	2017-03-26 02:34:29.057612+00	2017-03-26 02:34:29.05765+00
99	619awl	33	0.7867	https://i.redd.it/o3uqlux2bdny.jpg	The rise and the fall	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/619awl/the_rise_and_the_fall/	2017-03-24 14:40:50+00	Folamh3	33	f	2017-03-26 02:34:30.969305+00	2017-03-26 02:34:30.969341+00
100	61h5la	88	0.5693	http://i.imgur.com/HL4tKK0.png	After Rogue One, I never thought Leia's half assed excuse in IV made much sense for her character, so I put it with someone who does.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61h5la/after_rogue_one_i_never_thought_leias_half_assed/	2017-03-25 18:53:31+00	SilentSamurai	88	f	2017-03-26 02:34:32.852326+00	2017-03-26 02:34:32.852364+00
101	61dy7n	10	0.7918	https://imgflip.com/i/1m2chc#hoXeAb0DoDEx8Sd2.16	Maybe he really is a genius! (probably not though)	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61dy7n/maybe_he_really_is_a_genius_probably_not_though/	2017-03-25 04:49:40+00	hoopdreams710	10	f	2017-03-26 02:34:34.755167+00	2017-03-26 02:34:34.755203+00
102	61522m	5	0.7025	https://i.imgur.com/Evnbthe.png	A modern update to an age-old classic.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61522m/a_modern_update_to_an_ageold_classic/	2017-03-23 22:12:28+00	C-Ron	5	f	2017-03-26 02:34:37.114651+00	2017-03-26 02:34:37.1147+00
103	618f18	21	0.8257	https://i.redd.it/vqiyvxu3fcny.jpg	How'd that get there?	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/618f18/howd_that_get_there/	2017-03-24 11:41:29+00	riddleness	21	f	2017-03-26 02:34:38.824224+00	2017-03-26 02:34:38.824262+00
104	61bnav	90	0.3941	https://i.redd.it/zs5kbmu47fny.jpg	In other news...	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61bnav/in_other_news/	2017-03-24 21:02:27+00	gingerroute	90	f	2017-03-26 02:34:40.697938+00	2017-03-26 02:34:40.697977+00
105	61jfsy	11	0.5727	http://imgur.com/oXn9ufU	Christianity	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61jfsy/christianity/	2017-03-26 02:36:40+00	aeonicgnosis	11	f	2017-03-26 02:52:04.770716+00	2017-03-26 02:52:04.770765+00
106	61jnw9	5	0.3931	http://imgur.com/S12zQnD	Delivery fees don't always go to the driver	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61jnw9/delivery_fees_dont_always_go_to_the_driver/	2017-03-26 03:31:35+00	InsertScreenNameHere	5	f	2017-03-26 03:32:08.959594+00	2017-03-26 03:32:08.959633+00
107	61jn8x	31	0.7063	https://i.imgur.com/3iYvvk4.png	We Owe the Witches A big Thank you for Defeating Trumpcare!	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61jn8x/we_owe_the_witches_a_big_thank_you_for_defeating/	2017-03-26 03:27:16+00	RealHonestJohn	31	f	2017-03-26 03:32:10.858783+00	2017-03-26 03:32:10.858822+00
108	61jogd	103	0.7326	http://imgur.com/1G4t4RV	Get Out: 24th Feb US release. May 11th Australian release.	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61jogd/get_out_24th_feb_us_release_may_11th_australian/	2017-03-26 03:35:10+00	UltimateHaze	103	f	2017-03-26 03:52:05.222013+00	2017-03-26 03:52:05.22205+00
109	61jqfd	110	0.4490	https://i.imgur.com/YzGy4yw.jpg	When i finish watching a snapchat feed and they decide to start showing an ad(who told them that was a good idea?)	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61jqfd/when_i_finish_watching_a_snapchat_feed_and_they/	2017-03-26 03:49:09+00	black_brotha	111	f	2017-03-26 03:52:10.407898+00	2017-03-26 03:52:10.407936+00
110	61jpup	89	0.5682	http://imgur.com/uKNxF1B	It's All In The Eyes	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61jpup/its_all_in_the_eyes/	2017-03-26 03:45:09+00	Noideawhatjusthappen	89	f	2017-03-26 03:52:14.173918+00	2017-03-26 03:52:14.173954+00
111	61jr3b	13	0.5302	http://imgur.com/W67ySv3	Political Rights	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61jr3b/political_rights/	2017-03-26 03:53:59+00	aeonicgnosis	13	f	2017-03-26 04:12:08.999328+00	2017-03-26 04:12:08.999366+00
112	61ju8m	65	0.8053	http://imgur.com/PHCKPDF	Tobacco Truth commercial.....	AdviceAnimals	t5_2s7tt	/r/AdviceAnimals/comments/61ju8m/tobacco_truth_commercial/	2017-03-26 04:16:02+00	aeonicgnosis	65	f	2017-03-26 04:32:09.810613+00	2017-03-26 04:32:09.810651+00
\.


--
-- Name: reddit_redditpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reddit_redditpost_id_seq', 112, true);


--
-- Data for Name: reddit_redditpostsnapshot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reddit_redditpostsnapshot (id, date_crawled, score, gilded, reddit_post_id, num_comments, rank, created_date, modified_date) FROM stdin;
1	2017-03-26 02:31:26.680409+00	14769	f	1	605	1	2017-03-26 02:31:26.681163+00	2017-03-26 02:31:26.681211+00
2	2017-03-26 02:31:28.839515+00	2453	f	2	77	2	2017-03-26 02:31:28.839855+00	2017-03-26 02:31:28.839884+00
3	2017-03-26 02:31:31.047501+00	5149	f	3	172	3	2017-03-26 02:31:31.0479+00	2017-03-26 02:31:31.047941+00
4	2017-03-26 02:31:32.922251+00	1861	f	4	128	4	2017-03-26 02:31:32.922667+00	2017-03-26 02:31:32.922733+00
5	2017-03-26 02:31:34.752164+00	440	f	5	17	5	2017-03-26 02:31:34.752611+00	2017-03-26 02:31:34.752656+00
6	2017-03-26 02:31:38.059326+00	1127	f	6	14	7	2017-03-26 02:31:38.059957+00	2017-03-26 02:31:38.060052+00
7	2017-03-26 02:31:40.062586+00	241	f	7	2	8	2017-03-26 02:31:40.063097+00	2017-03-26 02:31:40.063145+00
8	2017-03-26 02:31:42.346061+00	289	f	8	3	9	2017-03-26 02:31:42.346623+00	2017-03-26 02:31:42.346669+00
9	2017-03-26 02:31:44.441298+00	272	f	9	7	10	2017-03-26 02:31:44.441736+00	2017-03-26 02:31:44.441781+00
10	2017-03-26 02:31:46.359894+00	2748	f	10	51	11	2017-03-26 02:31:46.360339+00	2017-03-26 02:31:46.360383+00
11	2017-03-26 02:31:48.348369+00	19324	f	11	443	12	2017-03-26 02:31:48.348926+00	2017-03-26 02:31:48.34897+00
12	2017-03-26 02:31:50.269816+00	128	f	12	16	13	2017-03-26 02:31:50.270182+00	2017-03-26 02:31:50.270221+00
13	2017-03-26 02:31:52.14081+00	71	f	13	2	14	2017-03-26 02:31:52.141181+00	2017-03-26 02:31:52.141222+00
14	2017-03-26 02:31:54.085112+00	92	f	14	3	15	2017-03-26 02:31:54.085408+00	2017-03-26 02:31:54.085436+00
15	2017-03-26 02:31:55.856203+00	69	f	15	1	16	2017-03-26 02:31:55.856744+00	2017-03-26 02:31:55.856797+00
16	2017-03-26 02:31:57.854351+00	93	f	16	3	17	2017-03-26 02:31:57.854896+00	2017-03-26 02:31:57.854945+00
17	2017-03-26 02:31:58.024223+00	14778	f	1	605	1	2017-03-26 02:31:58.030311+00	2017-03-26 02:31:58.0307+00
18	2017-03-26 02:31:58.198458+00	2460	f	2	77	2	2017-03-26 02:31:58.198852+00	2017-03-26 02:31:58.198898+00
19	2017-03-26 02:31:58.263551+00	5146	f	3	172	3	2017-03-26 02:31:58.263923+00	2017-03-26 02:31:58.263966+00
20	2017-03-26 02:31:58.315404+00	1862	f	4	129	4	2017-03-26 02:31:58.315763+00	2017-03-26 02:31:58.315804+00
21	2017-03-26 02:31:58.352779+00	442	f	5	17	5	2017-03-26 02:31:58.353163+00	2017-03-26 02:31:58.353206+00
22	2017-03-26 02:31:59.762858+00	1128	f	6	14	7	2017-03-26 02:31:59.763206+00	2017-03-26 02:31:59.763246+00
23	2017-03-26 02:31:59.894905+00	1916	f	17	40	18	2017-03-26 02:31:59.89539+00	2017-03-26 02:31:59.895439+00
24	2017-03-26 02:31:59.917271+00	245	f	7	2	8	2017-03-26 02:31:59.917677+00	2017-03-26 02:31:59.91774+00
25	2017-03-26 02:31:59.940932+00	287	f	8	3	9	2017-03-26 02:31:59.941296+00	2017-03-26 02:31:59.941341+00
26	2017-03-26 02:31:59.962641+00	274	f	9	7	10	2017-03-26 02:31:59.962971+00	2017-03-26 02:31:59.963009+00
27	2017-03-26 02:31:59.97639+00	2747	f	10	51	11	2017-03-26 02:31:59.976694+00	2017-03-26 02:31:59.976731+00
28	2017-03-26 02:31:59.992544+00	19324	f	11	443	12	2017-03-26 02:31:59.992832+00	2017-03-26 02:31:59.992866+00
29	2017-03-26 02:32:00.006061+00	130	f	12	16	13	2017-03-26 02:32:00.006317+00	2017-03-26 02:32:00.006347+00
30	2017-03-26 02:32:00.019858+00	74	f	13	2	14	2017-03-26 02:32:00.020133+00	2017-03-26 02:32:00.020163+00
31	2017-03-26 02:32:00.032197+00	89	f	14	3	15	2017-03-26 02:32:00.032425+00	2017-03-26 02:32:00.032452+00
32	2017-03-26 02:32:00.045938+00	65	f	15	1	16	2017-03-26 02:32:00.046164+00	2017-03-26 02:32:00.046191+00
33	2017-03-26 02:32:00.059689+00	94	f	16	3	17	2017-03-26 02:32:00.059906+00	2017-03-26 02:32:00.059932+00
34	2017-03-26 02:32:00.072493+00	1917	f	17	40	18	2017-03-26 02:32:00.072717+00	2017-03-26 02:32:00.072743+00
35	2017-03-26 02:32:01.779613+00	117	f	18	14	19	2017-03-26 02:32:01.779978+00	2017-03-26 02:32:01.780147+00
36	2017-03-26 02:32:03.510096+00	43	f	20	2	20	2017-03-26 02:32:03.510597+00	2017-03-26 02:32:03.510645+00
37	2017-03-26 02:32:05.223831+00	2495	f	22	33	21	2017-03-26 02:32:05.224226+00	2017-03-26 02:32:05.22426+00
38	2017-03-26 02:32:07.184727+00	36	f	24	3	22	2017-03-26 02:32:07.185075+00	2017-03-26 02:32:07.185108+00
39	2017-03-26 02:32:09.62914+00	1102	f	26	65	23	2017-03-26 02:32:09.629537+00	2017-03-26 02:32:09.629577+00
40	2017-03-26 02:32:11.580198+00	1354	f	28	92	24	2017-03-26 02:32:11.580542+00	2017-03-26 02:32:11.580575+00
41	2017-03-26 02:32:13.344627+00	29	f	30	2	25	2017-03-26 02:32:13.344967+00	2017-03-26 02:32:13.345+00
42	2017-03-26 02:32:16.652745+00	361	f	32	15	27	2017-03-26 02:32:16.653148+00	2017-03-26 02:32:16.653189+00
43	2017-03-26 02:32:18.637639+00	46056	f	34	2088	28	2017-03-26 02:32:18.638103+00	2017-03-26 02:32:18.638148+00
44	2017-03-26 02:32:20.399952+00	12	f	36	2	29	2017-03-26 02:32:20.400317+00	2017-03-26 02:32:20.400349+00
45	2017-03-26 02:32:22.36913+00	24	f	38	1	30	2017-03-26 02:32:22.369574+00	2017-03-26 02:32:22.369618+00
46	2017-03-26 02:32:24.04527+00	124	f	40	8	31	2017-03-26 02:32:24.045667+00	2017-03-26 02:32:24.045734+00
47	2017-03-26 02:32:25.899973+00	13	f	42	3	32	2017-03-26 02:32:25.900403+00	2017-03-26 02:32:25.900447+00
48	2017-03-26 02:32:27.935776+00	6959	f	44	115	33	2017-03-26 02:32:27.936324+00	2017-03-26 02:32:27.936376+00
49	2017-03-26 02:32:29.746141+00	20	f	46	5	34	2017-03-26 02:32:29.74647+00	2017-03-26 02:32:29.746502+00
50	2017-03-26 02:32:31.630978+00	2038	f	48	41	35	2017-03-26 02:32:31.631248+00	2017-03-26 02:32:31.631278+00
51	2017-03-26 02:32:34.829522+00	10	f	49	2	37	2017-03-26 02:32:34.829994+00	2017-03-26 02:32:34.830039+00
52	2017-03-26 02:32:36.793604+00	62	f	50	2	38	2017-03-26 02:32:36.794106+00	2017-03-26 02:32:36.794154+00
53	2017-03-26 02:32:38.842774+00	72	f	51	22	39	2017-03-26 02:32:38.8433+00	2017-03-26 02:32:38.843352+00
54	2017-03-26 02:32:40.893668+00	14	f	52	0	40	2017-03-26 02:32:40.893989+00	2017-03-26 02:32:40.89402+00
55	2017-03-26 02:32:42.668357+00	23	f	53	0	41	2017-03-26 02:32:42.668784+00	2017-03-26 02:32:42.668827+00
56	2017-03-26 02:32:44.349177+00	1961	f	54	19	42	2017-03-26 02:32:44.349607+00	2017-03-26 02:32:44.349651+00
57	2017-03-26 02:32:46.104072+00	6135	f	55	165	43	2017-03-26 02:32:46.104468+00	2017-03-26 02:32:46.104509+00
58	2017-03-26 02:32:47.994228+00	10	f	56	0	44	2017-03-26 02:32:47.994823+00	2017-03-26 02:32:47.994878+00
59	2017-03-26 02:32:51.128107+00	2538	f	57	287	45	2017-03-26 02:32:51.128566+00	2017-03-26 02:32:51.12861+00
60	2017-03-26 02:32:53.002173+00	628	f	58	56	46	2017-03-26 02:32:53.002665+00	2017-03-26 02:32:53.002754+00
61	2017-03-26 02:32:55.323577+00	48	f	59	3	47	2017-03-26 02:32:55.324073+00	2017-03-26 02:32:55.32412+00
62	2017-03-26 02:32:57.245487+00	257	f	60	11	48	2017-03-26 02:32:57.245974+00	2017-03-26 02:32:57.24602+00
63	2017-03-26 02:32:59.110048+00	21294	f	61	495	49	2017-03-26 02:32:59.110409+00	2017-03-26 02:32:59.110444+00
64	2017-03-26 02:33:01.161116+00	44	f	62	0	50	2017-03-26 02:33:01.161533+00	2017-03-26 02:33:01.161579+00
65	2017-03-26 02:33:03.018118+00	9	f	63	0	51	2017-03-26 02:33:03.018528+00	2017-03-26 02:33:03.01857+00
66	2017-03-26 02:33:05.116845+00	7	f	64	2	52	2017-03-26 02:33:05.117404+00	2017-03-26 02:33:05.117457+00
67	2017-03-26 02:33:07.2149+00	21	f	65	0	53	2017-03-26 02:33:07.215484+00	2017-03-26 02:33:07.215577+00
68	2017-03-26 02:33:08.964344+00	8034	f	66	231	54	2017-03-26 02:33:08.964835+00	2017-03-26 02:33:08.964882+00
69	2017-03-26 02:33:10.768095+00	5	f	67	0	55	2017-03-26 02:33:10.768565+00	2017-03-26 02:33:10.768613+00
70	2017-03-26 02:33:12.979481+00	5326	f	68	139	56	2017-03-26 02:33:12.979807+00	2017-03-26 02:33:12.97984+00
71	2017-03-26 02:33:14.753122+00	1209	f	69	17	57	2017-03-26 02:33:14.753631+00	2017-03-26 02:33:14.753708+00
72	2017-03-26 02:33:16.780897+00	3	f	70	1	58	2017-03-26 02:33:16.781374+00	2017-03-26 02:33:16.781424+00
73	2017-03-26 02:33:18.536892+00	1603	f	71	53	59	2017-03-26 02:33:18.53733+00	2017-03-26 02:33:18.537375+00
74	2017-03-26 02:33:20.178306+00	58	f	72	10	60	2017-03-26 02:33:20.178612+00	2017-03-26 02:33:20.178644+00
75	2017-03-26 02:33:23.170796+00	3	f	73	4	62	2017-03-26 02:33:23.171218+00	2017-03-26 02:33:23.171262+00
76	2017-03-26 02:33:26.22362+00	59	f	74	6	63	2017-03-26 02:33:26.224097+00	2017-03-26 02:33:26.224143+00
77	2017-03-26 02:33:29.346395+00	62	f	75	2	65	2017-03-26 02:33:29.3468+00	2017-03-26 02:33:29.346842+00
78	2017-03-26 02:33:31.055157+00	71	f	76	12	66	2017-03-26 02:33:31.055566+00	2017-03-26 02:33:31.05561+00
79	2017-03-26 02:33:32.809559+00	37	f	77	2	67	2017-03-26 02:33:32.810041+00	2017-03-26 02:33:32.810088+00
80	2017-03-26 02:33:34.559488+00	142	f	78	14	68	2017-03-26 02:33:34.559931+00	2017-03-26 02:33:34.559975+00
81	2017-03-26 02:33:37.611752+00	78	f	79	3	70	2017-03-26 02:33:37.612216+00	2017-03-26 02:33:37.612261+00
82	2017-03-26 02:33:39.692311+00	1	f	80	0	71	2017-03-26 02:33:39.692836+00	2017-03-26 02:33:39.692882+00
83	2017-03-26 02:33:41.642013+00	27	f	81	3	72	2017-03-26 02:33:41.64248+00	2017-03-26 02:33:41.642524+00
84	2017-03-26 02:33:44.69509+00	6	f	82	5	74	2017-03-26 02:33:44.695523+00	2017-03-26 02:33:44.695569+00
85	2017-03-26 02:33:46.654615+00	85	f	83	24	75	2017-03-26 02:33:46.655021+00	2017-03-26 02:33:46.655062+00
86	2017-03-26 02:33:48.354367+00	137	f	84	7	76	2017-03-26 02:33:48.354771+00	2017-03-26 02:33:48.354812+00
87	2017-03-26 02:33:51.341899+00	413	f	85	81	78	2017-03-26 02:33:51.34232+00	2017-03-26 02:33:51.342364+00
88	2017-03-26 02:33:53.106488+00	74	f	86	14	79	2017-03-26 02:33:53.106925+00	2017-03-26 02:33:53.106969+00
89	2017-03-26 02:33:56.363369+00	21703	f	87	357	81	2017-03-26 02:33:56.363975+00	2017-03-26 02:33:56.364118+00
90	2017-03-26 02:33:58.089059+00	5614	f	88	177	82	2017-03-26 02:33:58.089512+00	2017-03-26 02:33:58.089568+00
91	2017-03-26 02:34:01.422168+00	7	f	89	18	84	2017-03-26 02:34:01.422625+00	2017-03-26 02:34:01.422671+00
92	2017-03-26 02:34:13.708859+00	34	f	90	7	85	2017-03-26 02:34:13.709364+00	2017-03-26 02:34:13.709413+00
93	2017-03-26 02:34:16.020994+00	27	f	91	3	86	2017-03-26 02:34:16.021382+00	2017-03-26 02:34:16.021422+00
94	2017-03-26 02:34:17.893722+00	17	f	92	2	87	2017-03-26 02:34:17.894118+00	2017-03-26 02:34:17.894161+00
95	2017-03-26 02:34:19.95189+00	139	f	93	18	88	2017-03-26 02:34:19.952416+00	2017-03-26 02:34:19.952464+00
96	2017-03-26 02:34:22.010445+00	44	f	94	1	89	2017-03-26 02:34:22.010905+00	2017-03-26 02:34:22.01096+00
97	2017-03-26 02:34:23.889168+00	19	f	95	2	90	2017-03-26 02:34:23.889572+00	2017-03-26 02:34:23.889616+00
98	2017-03-26 02:34:25.528184+00	58	f	96	4	91	2017-03-26 02:34:25.528491+00	2017-03-26 02:34:25.528523+00
99	2017-03-26 02:34:27.244113+00	41	f	97	2	92	2017-03-26 02:34:27.244499+00	2017-03-26 02:34:27.24454+00
100	2017-03-26 02:34:29.157346+00	61	f	98	5	93	2017-03-26 02:34:29.157783+00	2017-03-26 02:34:29.157823+00
101	2017-03-26 02:34:30.993843+00	182	f	99	8	94	2017-03-26 02:34:30.99424+00	2017-03-26 02:34:30.994283+00
102	2017-03-26 02:34:32.926949+00	0	f	100	0	95	2017-03-26 02:34:32.927524+00	2017-03-26 02:34:32.927571+00
103	2017-03-26 02:34:34.776395+00	13	f	101	0	96	2017-03-26 02:34:34.776724+00	2017-03-26 02:34:34.776757+00
104	2017-03-26 02:34:37.207695+00	5646	f	102	359	97	2017-03-26 02:34:37.208124+00	2017-03-26 02:34:37.208167+00
105	2017-03-26 02:34:38.891896+00	278	f	103	12	98	2017-03-26 02:34:38.892269+00	2017-03-26 02:34:38.892307+00
106	2017-03-26 02:34:40.756665+00	51	f	104	7	99	2017-03-26 02:34:40.757074+00	2017-03-26 02:34:40.757114+00
107	2017-03-26 02:51:57.805308+00	15261	f	1	626	1	2017-03-26 02:51:57.805675+00	2017-03-26 02:51:57.805717+00
108	2017-03-26 02:51:57.864146+00	2667	f	2	85	2	2017-03-26 02:51:57.864515+00	2017-03-26 02:51:57.86456+00
109	2017-03-26 02:51:57.873369+00	5262	f	3	172	3	2017-03-26 02:51:57.873689+00	2017-03-26 02:51:57.873741+00
110	2017-03-26 02:51:57.883304+00	524	f	5	17	4	2017-03-26 02:51:57.883622+00	2017-03-26 02:51:57.883661+00
111	2017-03-26 02:51:57.893259+00	1924	f	4	146	5	2017-03-26 02:51:57.893563+00	2017-03-26 02:51:57.893599+00
112	2017-03-26 02:51:59.311419+00	1164	f	6	14	7	2017-03-26 02:51:59.311825+00	2017-03-26 02:51:59.311869+00
113	2017-03-26 02:51:59.448114+00	255	f	7	2	8	2017-03-26 02:51:59.448505+00	2017-03-26 02:51:59.448552+00
114	2017-03-26 02:51:59.45747+00	301	f	8	3	9	2017-03-26 02:51:59.45781+00	2017-03-26 02:51:59.457849+00
115	2017-03-26 02:51:59.467335+00	288	f	9	8	10	2017-03-26 02:51:59.467655+00	2017-03-26 02:51:59.467694+00
116	2017-03-26 02:51:59.477238+00	2756	f	10	51	11	2017-03-26 02:51:59.477543+00	2017-03-26 02:51:59.477579+00
117	2017-03-26 02:51:59.487121+00	83	f	13	3	12	2017-03-26 02:51:59.487409+00	2017-03-26 02:51:59.487444+00
118	2017-03-26 02:51:59.497166+00	19331	f	11	443	13	2017-03-26 02:51:59.497458+00	2017-03-26 02:51:59.497492+00
119	2017-03-26 02:51:59.507219+00	126	f	12	17	14	2017-03-26 02:51:59.507511+00	2017-03-26 02:51:59.507546+00
120	2017-03-26 02:51:59.517228+00	72	f	15	1	15	2017-03-26 02:51:59.517506+00	2017-03-26 02:51:59.517539+00
121	2017-03-26 02:51:59.52712+00	98	f	14	3	16	2017-03-26 02:51:59.527396+00	2017-03-26 02:51:59.527429+00
122	2017-03-26 02:51:59.537157+00	99	f	16	3	17	2017-03-26 02:51:59.537433+00	2017-03-26 02:51:59.537466+00
123	2017-03-26 02:51:59.547055+00	132	f	18	14	18	2017-03-26 02:51:59.547317+00	2017-03-26 02:51:59.547348+00
124	2017-03-26 02:51:59.557141+00	28	f	36	4	19	2017-03-26 02:51:59.557403+00	2017-03-26 02:51:59.557434+00
125	2017-03-26 02:51:59.567243+00	1921	f	17	40	20	2017-03-26 02:51:59.567498+00	2017-03-26 02:51:59.567529+00
126	2017-03-26 02:51:59.577254+00	55	f	20	2	21	2017-03-26 02:51:59.577508+00	2017-03-26 02:51:59.577537+00
127	2017-03-26 02:51:59.587264+00	45	f	24	3	22	2017-03-26 02:51:59.587519+00	2017-03-26 02:51:59.587549+00
128	2017-03-26 02:51:59.597205+00	2506	f	22	34	23	2017-03-26 02:51:59.59745+00	2017-03-26 02:51:59.597478+00
129	2017-03-26 02:51:59.607248+00	1104	f	26	65	24	2017-03-26 02:51:59.60749+00	2017-03-26 02:51:59.607518+00
130	2017-03-26 02:52:00.957249+00	1360	f	28	92	26	2017-03-26 02:52:00.957657+00	2017-03-26 02:52:00.957704+00
131	2017-03-26 02:52:01.061057+00	32	f	30	2	27	2017-03-26 02:52:01.061433+00	2017-03-26 02:52:01.061479+00
132	2017-03-26 02:52:01.080185+00	29	f	38	1	28	2017-03-26 02:52:01.08051+00	2017-03-26 02:52:01.080548+00
133	2017-03-26 02:52:01.091492+00	14	f	49	2	29	2017-03-26 02:52:01.09181+00	2017-03-26 02:52:01.091846+00
134	2017-03-26 02:52:01.101486+00	379	f	32	15	30	2017-03-26 02:52:01.101818+00	2017-03-26 02:52:01.101852+00
135	2017-03-26 02:52:01.111342+00	46052	f	34	2091	31	2017-03-26 02:52:01.11163+00	2017-03-26 02:52:01.111665+00
136	2017-03-26 02:52:01.121313+00	22	f	46	5	32	2017-03-26 02:52:01.121588+00	2017-03-26 02:52:01.12162+00
137	2017-03-26 02:52:01.131296+00	127	f	40	8	33	2017-03-26 02:52:01.131558+00	2017-03-26 02:52:01.131589+00
138	2017-03-26 02:52:01.141246+00	6951	f	44	115	34	2017-03-26 02:52:01.14151+00	2017-03-26 02:52:01.141542+00
139	2017-03-26 02:52:02.491839+00	13	f	42	4	36	2017-03-26 02:52:02.49227+00	2017-03-26 02:52:02.492315+00
140	2017-03-26 02:52:02.554167+00	2045	f	48	41	37	2017-03-26 02:52:02.554516+00	2017-03-26 02:52:02.554556+00
141	2017-03-26 02:52:02.565425+00	20	f	52	0	38	2017-03-26 02:52:02.565764+00	2017-03-26 02:52:02.565803+00
142	2017-03-26 02:52:02.575317+00	59	f	50	2	39	2017-03-26 02:52:02.57562+00	2017-03-26 02:52:02.575657+00
143	2017-03-26 02:52:02.585272+00	77	f	51	22	40	2017-03-26 02:52:02.585578+00	2017-03-26 02:52:02.585614+00
144	2017-03-26 02:52:02.595157+00	24	f	53	0	41	2017-03-26 02:52:02.595465+00	2017-03-26 02:52:02.5955+00
145	2017-03-26 02:52:02.605116+00	17	f	56	0	42	2017-03-26 02:52:02.605406+00	2017-03-26 02:52:02.605439+00
146	2017-03-26 02:52:02.615053+00	1967	f	54	19	43	2017-03-26 02:52:02.615344+00	2017-03-26 02:52:02.615379+00
147	2017-03-26 02:52:02.625104+00	6143	f	55	165	44	2017-03-26 02:52:02.625383+00	2017-03-26 02:52:02.625426+00
148	2017-03-26 02:52:02.635302+00	2543	f	57	287	45	2017-03-26 02:52:02.635582+00	2017-03-26 02:52:02.635614+00
149	2017-03-26 02:52:02.645123+00	54	f	59	3	46	2017-03-26 02:52:02.645386+00	2017-03-26 02:52:02.645417+00
150	2017-03-26 02:52:02.655086+00	631	f	58	56	47	2017-03-26 02:52:02.655338+00	2017-03-26 02:52:02.655369+00
151	2017-03-26 02:52:02.665082+00	43	f	62	0	48	2017-03-26 02:52:02.665326+00	2017-03-26 02:52:02.665356+00
152	2017-03-26 02:52:02.675071+00	260	f	60	11	49	2017-03-26 02:52:02.675314+00	2017-03-26 02:52:02.675343+00
153	2017-03-26 02:52:02.685064+00	21292	f	61	495	50	2017-03-26 02:52:02.685308+00	2017-03-26 02:52:02.685336+00
154	2017-03-26 02:52:02.695075+00	9	f	63	0	51	2017-03-26 02:52:02.695318+00	2017-03-26 02:52:02.695346+00
155	2017-03-26 02:52:02.705118+00	8	f	64	2	52	2017-03-26 02:52:02.70536+00	2017-03-26 02:52:02.705389+00
156	2017-03-26 02:52:02.715055+00	18	f	65	0	53	2017-03-26 02:52:02.715295+00	2017-03-26 02:52:02.715324+00
157	2017-03-26 02:52:02.887047+00	8032	f	66	231	54	2017-03-26 02:52:02.887441+00	2017-03-26 02:52:02.887488+00
158	2017-03-26 02:52:02.896427+00	5327	f	68	139	55	2017-03-26 02:52:02.896783+00	2017-03-26 02:52:02.896823+00
159	2017-03-26 02:52:02.906403+00	4	f	67	0	56	2017-03-26 02:52:02.906774+00	2017-03-26 02:52:02.906814+00
160	2017-03-26 02:52:02.916331+00	1214	f	69	17	57	2017-03-26 02:52:02.916655+00	2017-03-26 02:52:02.916693+00
161	2017-03-26 02:52:04.839202+00	2	f	105	1	58	2017-03-26 02:52:04.839655+00	2017-03-26 02:52:04.839701+00
162	2017-03-26 02:52:04.851804+00	1604	f	71	53	59	2017-03-26 02:52:04.852177+00	2017-03-26 02:52:04.852218+00
163	2017-03-26 02:52:04.861521+00	61	f	72	10	60	2017-03-26 02:52:04.861856+00	2017-03-26 02:52:04.861894+00
164	2017-03-26 02:52:06.174793+00	3	f	80	0	62	2017-03-26 02:52:06.175192+00	2017-03-26 02:52:06.175237+00
165	2017-03-26 02:52:06.345903+00	58	f	74	6	63	2017-03-26 02:52:06.346262+00	2017-03-26 02:52:06.346306+00
166	2017-03-26 02:52:06.355303+00	3	f	70	1	64	2017-03-26 02:52:06.355625+00	2017-03-26 02:52:06.355663+00
167	2017-03-26 02:52:07.691335+00	3	f	73	4	66	2017-03-26 02:52:07.691713+00	2017-03-26 02:52:07.691772+00
168	2017-03-26 02:52:07.76901+00	59	f	75	2	67	2017-03-26 02:52:07.76934+00	2017-03-26 02:52:07.769379+00
169	2017-03-26 02:52:07.779267+00	71	f	76	12	68	2017-03-26 02:52:07.77961+00	2017-03-26 02:52:07.779651+00
170	2017-03-26 02:52:07.789184+00	39	f	77	2	69	2017-03-26 02:52:07.789503+00	2017-03-26 02:52:07.789541+00
171	2017-03-26 02:52:10.530715+00	141	f	78	14	72	2017-03-26 02:52:10.531119+00	2017-03-26 02:52:10.531163+00
172	2017-03-26 02:52:11.897347+00	79	f	79	3	74	2017-03-26 02:52:11.897762+00	2017-03-26 02:52:11.897808+00
173	2017-03-26 02:52:11.957854+00	25	f	81	3	75	2017-03-26 02:52:11.958163+00	2017-03-26 02:52:11.958199+00
174	2017-03-26 02:52:13.332985+00	84	f	83	24	77	2017-03-26 02:52:13.333373+00	2017-03-26 02:52:13.333417+00
175	2017-03-26 02:52:13.39148+00	131	f	84	7	78	2017-03-26 02:52:13.391819+00	2017-03-26 02:52:13.391859+00
176	2017-03-26 02:52:13.403775+00	4	f	82	5	79	2017-03-26 02:52:13.404106+00	2017-03-26 02:52:13.404142+00
177	2017-03-26 02:52:19.83061+00	413	f	85	81	81	2017-03-26 02:52:19.830987+00	2017-03-26 02:52:19.83103+00
178	2017-03-26 02:52:19.901224+00	69	f	86	14	82	2017-03-26 02:52:19.901587+00	2017-03-26 02:52:19.90163+00
179	2017-03-26 02:52:19.918023+00	21708	f	87	357	83	2017-03-26 02:52:19.918361+00	2017-03-26 02:52:19.918401+00
180	2017-03-26 02:52:19.930989+00	5614	f	88	177	84	2017-03-26 02:52:19.931309+00	2017-03-26 02:52:19.931347+00
181	2017-03-26 02:52:22.016825+00	6	f	89	18	86	2017-03-26 02:52:22.017232+00	2017-03-26 02:52:22.017279+00
182	2017-03-26 02:52:22.093769+00	35	f	90	7	87	2017-03-26 02:52:22.094134+00	2017-03-26 02:52:22.094177+00
183	2017-03-26 02:52:22.106685+00	27	f	91	3	88	2017-03-26 02:52:22.107021+00	2017-03-26 02:52:22.10706+00
184	2017-03-26 02:52:22.123279+00	18	f	92	2	89	2017-03-26 02:52:22.123582+00	2017-03-26 02:52:22.123616+00
185	2017-03-26 02:52:22.136476+00	136	f	93	18	90	2017-03-26 02:52:22.136794+00	2017-03-26 02:52:22.136828+00
186	2017-03-26 02:52:22.146405+00	44	f	94	1	91	2017-03-26 02:52:22.146711+00	2017-03-26 02:52:22.146771+00
187	2017-03-26 02:52:22.156336+00	18	f	95	2	92	2017-03-26 02:52:22.156608+00	2017-03-26 02:52:22.156641+00
188	2017-03-26 02:52:22.166371+00	57	f	96	4	93	2017-03-26 02:52:22.166645+00	2017-03-26 02:52:22.166678+00
189	2017-03-26 02:52:22.176317+00	41	f	97	2	94	2017-03-26 02:52:22.176578+00	2017-03-26 02:52:22.176609+00
190	2017-03-26 02:52:22.186314+00	14	f	101	0	95	2017-03-26 02:52:22.186574+00	2017-03-26 02:52:22.186605+00
191	2017-03-26 02:52:22.196324+00	64	f	98	5	96	2017-03-26 02:52:22.196577+00	2017-03-26 02:52:22.196607+00
192	2017-03-26 02:52:22.206263+00	183	f	99	8	97	2017-03-26 02:52:22.206515+00	2017-03-26 02:52:22.206545+00
193	2017-03-26 02:52:22.216288+00	0	f	100	0	98	2017-03-26 02:52:22.216541+00	2017-03-26 02:52:22.216571+00
194	2017-03-26 02:52:22.226282+00	5642	f	102	359	99	2017-03-26 02:52:22.226523+00	2017-03-26 02:52:22.226551+00
195	2017-03-26 03:11:57.679935+00	15752	f	1	653	1	2017-03-26 03:11:57.680336+00	2017-03-26 03:11:57.680377+00
196	2017-03-26 03:11:57.735921+00	2876	f	2	89	2	2017-03-26 03:11:57.736286+00	2017-03-26 03:11:57.736327+00
197	2017-03-26 03:11:57.750069+00	5356	f	3	173	3	2017-03-26 03:11:57.750375+00	2017-03-26 03:11:57.750413+00
198	2017-03-26 03:11:57.765507+00	640	f	5	18	4	2017-03-26 03:11:57.76581+00	2017-03-26 03:11:57.765846+00
199	2017-03-26 03:11:57.780033+00	1982	f	4	158	5	2017-03-26 03:11:57.780324+00	2017-03-26 03:11:57.780359+00
200	2017-03-26 03:11:59.336079+00	1177	f	6	14	7	2017-03-26 03:11:59.336448+00	2017-03-26 03:11:59.33649+00
201	2017-03-26 03:11:59.636972+00	261	f	7	2	8	2017-03-26 03:11:59.637377+00	2017-03-26 03:11:59.637425+00
202	2017-03-26 03:11:59.660698+00	309	f	8	3	9	2017-03-26 03:11:59.661056+00	2017-03-26 03:11:59.661097+00
203	2017-03-26 03:11:59.675135+00	306	f	9	9	10	2017-03-26 03:11:59.675454+00	2017-03-26 03:11:59.675493+00
204	2017-03-26 03:11:59.690505+00	2784	f	10	51	11	2017-03-26 03:11:59.690811+00	2017-03-26 03:11:59.690847+00
205	2017-03-26 03:11:59.705148+00	83	f	13	3	12	2017-03-26 03:11:59.705437+00	2017-03-26 03:11:59.705472+00
206	2017-03-26 03:11:59.720319+00	19336	f	11	444	13	2017-03-26 03:11:59.720606+00	2017-03-26 03:11:59.72064+00
207	2017-03-26 03:11:59.735032+00	130	f	12	17	14	2017-03-26 03:11:59.735319+00	2017-03-26 03:11:59.735354+00
208	2017-03-26 03:11:59.750619+00	84	f	15	1	15	2017-03-26 03:11:59.750937+00	2017-03-26 03:11:59.750974+00
209	2017-03-26 03:11:59.76511+00	43	f	36	5	16	2017-03-26 03:11:59.765398+00	2017-03-26 03:11:59.765433+00
210	2017-03-26 03:11:59.780424+00	98	f	14	3	17	2017-03-26 03:11:59.7807+00	2017-03-26 03:11:59.780733+00
211	2017-03-26 03:11:59.795135+00	103	f	16	3	18	2017-03-26 03:11:59.795409+00	2017-03-26 03:11:59.795442+00
212	2017-03-26 03:11:59.810447+00	137	f	18	14	19	2017-03-26 03:11:59.810724+00	2017-03-26 03:11:59.810757+00
213	2017-03-26 03:11:59.825214+00	62	f	20	2	20	2017-03-26 03:11:59.825491+00	2017-03-26 03:11:59.825524+00
214	2017-03-26 03:11:59.840489+00	1932	f	17	40	21	2017-03-26 03:11:59.840752+00	2017-03-26 03:11:59.840783+00
215	2017-03-26 03:11:59.855137+00	43	f	24	4	22	2017-03-26 03:11:59.855404+00	2017-03-26 03:11:59.855436+00
216	2017-03-26 03:11:59.870485+00	23	f	49	2	23	2017-03-26 03:11:59.870747+00	2017-03-26 03:11:59.870779+00
217	2017-03-26 03:11:59.885282+00	2511	f	22	36	24	2017-03-26 03:11:59.885544+00	2017-03-26 03:11:59.885575+00
218	2017-03-26 03:11:59.900624+00	1114	f	26	65	25	2017-03-26 03:11:59.900874+00	2017-03-26 03:11:59.900916+00
219	2017-03-26 03:12:01.449168+00	34	f	38	1	27	2017-03-26 03:12:01.449557+00	2017-03-26 03:12:01.4496+00
220	2017-03-26 03:12:01.581693+00	1364	f	28	92	28	2017-03-26 03:12:01.582119+00	2017-03-26 03:12:01.582169+00
221	2017-03-26 03:12:01.6056+00	29	f	30	2	29	2017-03-26 03:12:01.605955+00	2017-03-26 03:12:01.605995+00
222	2017-03-26 03:12:01.620369+00	20	f	46	6	30	2017-03-26 03:12:01.62069+00	2017-03-26 03:12:01.620729+00
223	2017-03-26 03:12:01.635406+00	376	f	32	15	31	2017-03-26 03:12:01.635719+00	2017-03-26 03:12:01.635756+00
224	2017-03-26 03:12:01.650151+00	46061	f	34	2095	32	2017-03-26 03:12:01.650442+00	2017-03-26 03:12:01.650476+00
225	2017-03-26 03:12:01.665384+00	124	f	40	8	33	2017-03-26 03:12:01.665888+00	2017-03-26 03:12:01.665927+00
226	2017-03-26 03:12:01.680171+00	14	f	42	4	34	2017-03-26 03:12:01.680448+00	2017-03-26 03:12:01.68048+00
227	2017-03-26 03:12:01.695185+00	6954	f	44	115	35	2017-03-26 03:12:01.695458+00	2017-03-26 03:12:01.695491+00
228	2017-03-26 03:12:03.256902+00	2037	f	48	41	37	2017-03-26 03:12:03.257285+00	2017-03-26 03:12:03.257329+00
229	2017-03-26 03:12:03.379295+00	22	f	52	0	38	2017-03-26 03:12:03.379641+00	2017-03-26 03:12:03.379683+00
230	2017-03-26 03:12:03.394994+00	62	f	50	3	39	2017-03-26 03:12:03.395314+00	2017-03-26 03:12:03.395352+00
231	2017-03-26 03:12:03.409757+00	74	f	51	22	40	2017-03-26 03:12:03.410077+00	2017-03-26 03:12:03.410113+00
232	2017-03-26 03:12:03.424922+00	22	f	53	0	41	2017-03-26 03:12:03.425228+00	2017-03-26 03:12:03.425264+00
233	2017-03-26 03:12:03.439855+00	16	f	56	0	42	2017-03-26 03:12:03.440186+00	2017-03-26 03:12:03.44022+00
234	2017-03-26 03:12:03.454762+00	1965	f	54	19	43	2017-03-26 03:12:03.455072+00	2017-03-26 03:12:03.455105+00
235	2017-03-26 03:12:03.46971+00	6149	f	55	165	44	2017-03-26 03:12:03.469986+00	2017-03-26 03:12:03.470016+00
236	2017-03-26 03:12:03.484771+00	2546	f	57	287	45	2017-03-26 03:12:03.485048+00	2017-03-26 03:12:03.48508+00
237	2017-03-26 03:12:03.499748+00	53	f	59	4	46	2017-03-26 03:12:03.500039+00	2017-03-26 03:12:03.500072+00
238	2017-03-26 03:12:03.514771+00	621	f	58	56	47	2017-03-26 03:12:03.515024+00	2017-03-26 03:12:03.515053+00
239	2017-03-26 03:12:03.529778+00	48	f	62	1	48	2017-03-26 03:12:03.530037+00	2017-03-26 03:12:03.530066+00
240	2017-03-26 03:12:03.544781+00	260	f	60	11	49	2017-03-26 03:12:03.545035+00	2017-03-26 03:12:03.545063+00
241	2017-03-26 03:12:03.559732+00	21284	f	61	495	50	2017-03-26 03:12:03.559985+00	2017-03-26 03:12:03.560032+00
242	2017-03-26 03:12:03.57477+00	10	f	63	0	51	2017-03-26 03:12:03.575026+00	2017-03-26 03:12:03.575055+00
243	2017-03-26 03:12:03.589758+00	20	f	65	0	52	2017-03-26 03:12:03.59001+00	2017-03-26 03:12:03.590038+00
244	2017-03-26 03:12:03.604851+00	7	f	64	2	53	2017-03-26 03:12:03.605106+00	2017-03-26 03:12:03.605136+00
245	2017-03-26 03:12:03.61992+00	8032	f	66	231	54	2017-03-26 03:12:03.620192+00	2017-03-26 03:12:03.620221+00
246	2017-03-26 03:12:03.635009+00	4	f	67	0	55	2017-03-26 03:12:03.635248+00	2017-03-26 03:12:03.635277+00
247	2017-03-26 03:12:03.649964+00	5334	f	68	139	56	2017-03-26 03:12:03.650205+00	2017-03-26 03:12:03.650233+00
248	2017-03-26 03:12:03.665197+00	1215	f	69	17	57	2017-03-26 03:12:03.665439+00	2017-03-26 03:12:03.665468+00
249	2017-03-26 03:12:03.68014+00	64	f	72	10	58	2017-03-26 03:12:03.680382+00	2017-03-26 03:12:03.680411+00
250	2017-03-26 03:12:03.695269+00	1601	f	71	53	59	2017-03-26 03:12:03.69552+00	2017-03-26 03:12:03.695549+00
251	2017-03-26 03:12:05.103499+00	3	f	80	0	61	2017-03-26 03:12:05.103921+00	2017-03-26 03:12:05.103969+00
252	2017-03-26 03:12:05.174749+00	61	f	74	6	62	2017-03-26 03:12:05.1751+00	2017-03-26 03:12:05.175141+00
253	2017-03-26 03:12:05.219594+00	2	f	70	1	63	2017-03-26 03:12:05.219914+00	2017-03-26 03:12:05.219952+00
254	2017-03-26 03:12:06.699314+00	1	f	73	4	65	2017-03-26 03:12:06.699677+00	2017-03-26 03:12:06.699718+00
255	2017-03-26 03:12:06.768821+00	61	f	75	2	66	2017-03-26 03:12:06.769172+00	2017-03-26 03:12:06.769212+00
256	2017-03-26 03:12:06.783902+00	75	f	76	12	67	2017-03-26 03:12:06.784255+00	2017-03-26 03:12:06.784294+00
257	2017-03-26 03:12:06.798433+00	32	f	77	2	68	2017-03-26 03:12:06.798734+00	2017-03-26 03:12:06.798769+00
258	2017-03-26 03:12:09.829055+00	0	f	105	5	71	2017-03-26 03:12:09.829457+00	2017-03-26 03:12:09.829503+00
259	2017-03-26 03:12:09.906856+00	142	f	78	14	72	2017-03-26 03:12:09.907243+00	2017-03-26 03:12:09.907288+00
260	2017-03-26 03:12:11.396709+00	79	f	79	3	74	2017-03-26 03:12:11.397112+00	2017-03-26 03:12:11.397156+00
261	2017-03-26 03:12:11.46058+00	27	f	81	3	75	2017-03-26 03:12:11.460927+00	2017-03-26 03:12:11.460967+00
262	2017-03-26 03:12:12.936798+00	84	f	83	24	77	2017-03-26 03:12:12.937224+00	2017-03-26 03:12:12.937271+00
263	2017-03-26 03:12:13.025496+00	137	f	84	7	78	2017-03-26 03:12:13.025918+00	2017-03-26 03:12:13.025967+00
264	2017-03-26 03:12:13.040482+00	1	f	82	5	79	2017-03-26 03:12:13.040825+00	2017-03-26 03:12:13.040866+00
265	2017-03-26 03:12:14.521677+00	416	f	85	81	81	2017-03-26 03:12:14.522076+00	2017-03-26 03:12:14.522119+00
266	2017-03-26 03:12:14.57864+00	71	f	86	14	82	2017-03-26 03:12:14.579023+00	2017-03-26 03:12:14.579066+00
267	2017-03-26 03:12:14.594579+00	7	f	89	18	83	2017-03-26 03:12:14.594936+00	2017-03-26 03:12:14.594978+00
268	2017-03-26 03:12:14.60829+00	21704	f	87	357	84	2017-03-26 03:12:14.608612+00	2017-03-26 03:12:14.60865+00
269	2017-03-26 03:12:16.123721+00	5622	f	88	177	86	2017-03-26 03:12:16.124187+00	2017-03-26 03:12:16.124235+00
270	2017-03-26 03:12:16.202642+00	39	f	90	7	87	2017-03-26 03:12:16.203029+00	2017-03-26 03:12:16.203073+00
271	2017-03-26 03:12:16.218799+00	19	f	92	2	88	2017-03-26 03:12:16.219159+00	2017-03-26 03:12:16.2192+00
272	2017-03-26 03:12:16.232445+00	27	f	91	3	89	2017-03-26 03:12:16.232766+00	2017-03-26 03:12:16.232805+00
273	2017-03-26 03:12:16.248579+00	135	f	93	18	90	2017-03-26 03:12:16.248899+00	2017-03-26 03:12:16.248937+00
274	2017-03-26 03:12:16.26224+00	45	f	94	1	91	2017-03-26 03:12:16.26253+00	2017-03-26 03:12:16.262565+00
275	2017-03-26 03:12:16.278373+00	17	f	95	2	92	2017-03-26 03:12:16.278651+00	2017-03-26 03:12:16.278684+00
276	2017-03-26 03:12:16.292233+00	57	f	96	4	93	2017-03-26 03:12:16.292496+00	2017-03-26 03:12:16.292528+00
277	2017-03-26 03:12:16.302172+00	40	f	97	2	94	2017-03-26 03:12:16.302425+00	2017-03-26 03:12:16.302455+00
278	2017-03-26 03:12:16.312138+00	15	f	101	0	95	2017-03-26 03:12:16.312388+00	2017-03-26 03:12:16.312419+00
279	2017-03-26 03:12:16.3221+00	66	f	98	5	96	2017-03-26 03:12:16.322352+00	2017-03-26 03:12:16.322382+00
280	2017-03-26 03:12:16.332191+00	186	f	99	8	97	2017-03-26 03:12:16.332431+00	2017-03-26 03:12:16.33246+00
281	2017-03-26 03:12:16.34215+00	0	f	100	0	98	2017-03-26 03:12:16.342392+00	2017-03-26 03:12:16.342421+00
282	2017-03-26 03:12:16.352095+00	5647	f	102	359	99	2017-03-26 03:12:16.352332+00	2017-03-26 03:12:16.352359+00
283	2017-03-26 03:31:57.645459+00	16203	f	1	672	1	2017-03-26 03:31:57.645822+00	2017-03-26 03:31:57.645863+00
284	2017-03-26 03:31:57.699769+00	3067	f	2	100	2	2017-03-26 03:31:57.700164+00	2017-03-26 03:31:57.700205+00
285	2017-03-26 03:31:57.716551+00	5460	f	3	177	3	2017-03-26 03:31:57.716854+00	2017-03-26 03:31:57.71689+00
286	2017-03-26 03:31:57.726451+00	758	f	5	18	4	2017-03-26 03:31:57.72674+00	2017-03-26 03:31:57.726775+00
287	2017-03-26 03:31:57.736492+00	2058	f	4	162	5	2017-03-26 03:31:57.736782+00	2017-03-26 03:31:57.736816+00
288	2017-03-26 03:31:59.41094+00	1214	f	6	14	7	2017-03-26 03:31:59.41135+00	2017-03-26 03:31:59.411395+00
289	2017-03-26 03:31:59.481478+00	277	f	7	2	8	2017-03-26 03:31:59.481831+00	2017-03-26 03:31:59.481873+00
290	2017-03-26 03:31:59.491237+00	328	f	8	3	9	2017-03-26 03:31:59.491558+00	2017-03-26 03:31:59.491596+00
291	2017-03-26 03:31:59.501105+00	322	f	9	10	10	2017-03-26 03:31:59.501408+00	2017-03-26 03:31:59.501444+00
292	2017-03-26 03:31:59.511043+00	109	f	13	4	11	2017-03-26 03:31:59.511332+00	2017-03-26 03:31:59.511367+00
293	2017-03-26 03:31:59.521016+00	52	f	36	6	12	2017-03-26 03:31:59.521308+00	2017-03-26 03:31:59.521343+00
294	2017-03-26 03:31:59.531001+00	2805	f	10	51	13	2017-03-26 03:31:59.531276+00	2017-03-26 03:31:59.531309+00
295	2017-03-26 03:31:59.540996+00	97	f	15	3	14	2017-03-26 03:31:59.541276+00	2017-03-26 03:31:59.541309+00
296	2017-03-26 03:31:59.55123+00	137	f	12	18	15	2017-03-26 03:31:59.551492+00	2017-03-26 03:31:59.551523+00
297	2017-03-26 03:31:59.56089+00	19340	f	11	444	16	2017-03-26 03:31:59.561165+00	2017-03-26 03:31:59.561196+00
298	2017-03-26 03:31:59.570794+00	106	f	16	3	17	2017-03-26 03:31:59.571058+00	2017-03-26 03:31:59.571087+00
299	2017-03-26 03:31:59.580925+00	98	f	14	3	18	2017-03-26 03:31:59.581179+00	2017-03-26 03:31:59.581208+00
300	2017-03-26 03:31:59.590949+00	72	f	20	2	19	2017-03-26 03:31:59.591201+00	2017-03-26 03:31:59.59123+00
301	2017-03-26 03:31:59.600926+00	143	f	18	14	20	2017-03-26 03:31:59.601179+00	2017-03-26 03:31:59.601208+00
302	2017-03-26 03:31:59.610974+00	1936	f	17	40	21	2017-03-26 03:31:59.611228+00	2017-03-26 03:31:59.611258+00
303	2017-03-26 03:31:59.620981+00	50	f	24	5	22	2017-03-26 03:31:59.621232+00	2017-03-26 03:31:59.621262+00
304	2017-03-26 03:31:59.631115+00	26	f	49	2	23	2017-03-26 03:31:59.631383+00	2017-03-26 03:31:59.631415+00
305	2017-03-26 03:32:01.160522+00	2509	f	22	36	25	2017-03-26 03:32:01.160917+00	2017-03-26 03:32:01.160963+00
306	2017-03-26 03:32:01.266095+00	37	f	38	1	26	2017-03-26 03:32:01.266435+00	2017-03-26 03:32:01.266474+00
307	2017-03-26 03:32:01.283738+00	1108	f	26	63	27	2017-03-26 03:32:01.2841+00	2017-03-26 03:32:01.284139+00
308	2017-03-26 03:32:01.32053+00	1367	f	28	92	28	2017-03-26 03:32:01.320916+00	2017-03-26 03:32:01.320962+00
309	2017-03-26 03:32:01.376608+00	26	f	30	3	29	2017-03-26 03:32:01.376975+00	2017-03-26 03:32:01.377017+00
310	2017-03-26 03:32:01.404491+00	382	f	32	15	30	2017-03-26 03:32:01.404854+00	2017-03-26 03:32:01.404912+00
311	2017-03-26 03:32:01.416439+00	46067	f	34	2099	31	2017-03-26 03:32:01.416782+00	2017-03-26 03:32:01.416823+00
312	2017-03-26 03:32:01.426247+00	21	f	46	6	32	2017-03-26 03:32:01.426567+00	2017-03-26 03:32:01.426605+00
313	2017-03-26 03:32:01.436075+00	124	f	40	9	33	2017-03-26 03:32:01.436399+00	2017-03-26 03:32:01.436437+00
314	2017-03-26 03:32:01.446028+00	13	f	42	5	34	2017-03-26 03:32:01.446332+00	2017-03-26 03:32:01.446367+00
315	2017-03-26 03:32:01.456037+00	6967	f	44	115	35	2017-03-26 03:32:01.456331+00	2017-03-26 03:32:01.456366+00
316	2017-03-26 03:32:03.01838+00	23	f	52	0	37	2017-03-26 03:32:03.018762+00	2017-03-26 03:32:03.018807+00
317	2017-03-26 03:32:03.04883+00	2048	f	48	41	38	2017-03-26 03:32:03.049209+00	2017-03-26 03:32:03.049252+00
318	2017-03-26 03:32:03.060422+00	68	f	50	3	39	2017-03-26 03:32:03.06076+00	2017-03-26 03:32:03.060799+00
319	2017-03-26 03:32:03.070247+00	80	f	51	22	40	2017-03-26 03:32:03.070566+00	2017-03-26 03:32:03.070604+00
320	2017-03-26 03:32:03.080137+00	24	f	53	0	41	2017-03-26 03:32:03.080441+00	2017-03-26 03:32:03.080477+00
321	2017-03-26 03:32:03.090034+00	14	f	56	0	42	2017-03-26 03:32:03.090322+00	2017-03-26 03:32:03.090356+00
322	2017-03-26 03:32:03.10006+00	1969	f	54	19	43	2017-03-26 03:32:03.100338+00	2017-03-26 03:32:03.100371+00
323	2017-03-26 03:32:03.110063+00	6146	f	55	165	44	2017-03-26 03:32:03.110338+00	2017-03-26 03:32:03.110371+00
324	2017-03-26 03:32:03.120147+00	2537	f	57	287	45	2017-03-26 03:32:03.120425+00	2017-03-26 03:32:03.120457+00
325	2017-03-26 03:32:03.130023+00	56	f	59	4	46	2017-03-26 03:32:03.130286+00	2017-03-26 03:32:03.130317+00
326	2017-03-26 03:32:03.14004+00	625	f	58	56	47	2017-03-26 03:32:03.140297+00	2017-03-26 03:32:03.140327+00
327	2017-03-26 03:32:03.149964+00	50	f	62	1	48	2017-03-26 03:32:03.150215+00	2017-03-26 03:32:03.150244+00
328	2017-03-26 03:32:03.159984+00	8	f	64	2	49	2017-03-26 03:32:03.160257+00	2017-03-26 03:32:03.160288+00
329	2017-03-26 03:32:03.170034+00	261	f	60	11	50	2017-03-26 03:32:03.170285+00	2017-03-26 03:32:03.170315+00
330	2017-03-26 03:32:03.180062+00	21285	f	61	495	51	2017-03-26 03:32:03.180315+00	2017-03-26 03:32:03.180344+00
331	2017-03-26 03:32:03.19011+00	21	f	65	0	52	2017-03-26 03:32:03.190364+00	2017-03-26 03:32:03.190394+00
332	2017-03-26 03:32:03.200093+00	7	f	63	0	53	2017-03-26 03:32:03.200344+00	2017-03-26 03:32:03.200374+00
333	2017-03-26 03:32:03.210049+00	6	f	67	0	54	2017-03-26 03:32:03.210301+00	2017-03-26 03:32:03.210331+00
334	2017-03-26 03:32:03.220152+00	8032	f	66	231	55	2017-03-26 03:32:03.220481+00	2017-03-26 03:32:03.220511+00
335	2017-03-26 03:32:03.230138+00	3	f	80	0	56	2017-03-26 03:32:03.230391+00	2017-03-26 03:32:03.230421+00
336	2017-03-26 03:32:03.240238+00	5334	f	68	139	57	2017-03-26 03:32:03.24049+00	2017-03-26 03:32:03.24052+00
337	2017-03-26 03:32:03.250442+00	1209	f	69	17	58	2017-03-26 03:32:03.250704+00	2017-03-26 03:32:03.250734+00
338	2017-03-26 03:32:03.321644+00	61	f	72	10	59	2017-03-26 03:32:03.322034+00	2017-03-26 03:32:03.322078+00
339	2017-03-26 03:32:03.361306+00	1611	f	71	53	60	2017-03-26 03:32:03.361649+00	2017-03-26 03:32:03.36169+00
340	2017-03-26 03:32:04.965863+00	54	f	74	6	62	2017-03-26 03:32:04.966266+00	2017-03-26 03:32:04.966309+00
341	2017-03-26 03:32:05.035721+00	3	f	70	1	63	2017-03-26 03:32:05.036134+00	2017-03-26 03:32:05.036178+00
342	2017-03-26 03:32:06.771083+00	1	f	73	4	65	2017-03-26 03:32:06.771471+00	2017-03-26 03:32:06.771515+00
343	2017-03-26 03:32:06.84036+00	60	f	75	2	66	2017-03-26 03:32:06.84072+00	2017-03-26 03:32:06.840763+00
344	2017-03-26 03:32:06.857481+00	69	f	76	12	67	2017-03-26 03:32:06.857803+00	2017-03-26 03:32:06.857842+00
345	2017-03-26 03:32:08.983177+00	1	f	106	0	68	2017-03-26 03:32:08.983466+00	2017-03-26 03:32:08.983497+00
346	2017-03-26 03:32:10.968821+00	0	f	107	0	69	2017-03-26 03:32:10.969351+00	2017-03-26 03:32:10.969398+00
347	2017-03-26 03:32:10.991011+00	34	f	77	2	70	2017-03-26 03:32:10.99134+00	2017-03-26 03:32:10.99138+00
348	2017-03-26 03:32:12.531331+00	0	f	105	6	72	2017-03-26 03:32:12.531714+00	2017-03-26 03:32:12.531757+00
349	2017-03-26 03:32:12.604878+00	138	f	78	14	73	2017-03-26 03:32:12.605261+00	2017-03-26 03:32:12.605304+00
350	2017-03-26 03:32:14.089106+00	83	f	79	3	75	2017-03-26 03:32:14.089491+00	2017-03-26 03:32:14.089536+00
351	2017-03-26 03:32:14.412885+00	25	f	81	3	76	2017-03-26 03:32:14.413308+00	2017-03-26 03:32:14.413358+00
352	2017-03-26 03:32:15.904644+00	83	f	83	24	78	2017-03-26 03:32:15.905043+00	2017-03-26 03:32:15.905086+00
353	2017-03-26 03:32:15.963153+00	136	f	84	7	79	2017-03-26 03:32:15.963474+00	2017-03-26 03:32:15.963512+00
354	2017-03-26 03:32:15.972862+00	5	f	82	5	80	2017-03-26 03:32:15.973193+00	2017-03-26 03:32:15.973228+00
355	2017-03-26 03:32:17.419696+00	411	f	85	82	82	2017-03-26 03:32:17.42016+00	2017-03-26 03:32:17.420207+00
356	2017-03-26 03:32:17.487145+00	67	f	86	14	83	2017-03-26 03:32:17.487478+00	2017-03-26 03:32:17.487518+00
357	2017-03-26 03:32:18.932626+00	9	f	89	18	85	2017-03-26 03:32:18.933052+00	2017-03-26 03:32:18.9331+00
358	2017-03-26 03:32:19.000964+00	21700	f	87	357	86	2017-03-26 03:32:19.00131+00	2017-03-26 03:32:19.001351+00
359	2017-03-26 03:32:20.560308+00	5619	f	88	177	88	2017-03-26 03:32:20.560684+00	2017-03-26 03:32:20.560728+00
360	2017-03-26 03:32:22.080191+00	37	f	90	7	90	2017-03-26 03:32:22.080597+00	2017-03-26 03:32:22.080644+00
361	2017-03-26 03:32:22.169264+00	18	f	92	2	91	2017-03-26 03:32:22.169627+00	2017-03-26 03:32:22.16967+00
362	2017-03-26 03:32:22.186489+00	25	f	91	3	92	2017-03-26 03:32:22.186828+00	2017-03-26 03:32:22.186869+00
363	2017-03-26 03:32:22.198859+00	136	f	93	18	93	2017-03-26 03:32:22.199202+00	2017-03-26 03:32:22.19924+00
364	2017-03-26 03:32:22.208831+00	43	f	94	1	94	2017-03-26 03:32:22.20915+00	2017-03-26 03:32:22.209186+00
365	2017-03-26 03:32:22.218799+00	19	f	95	2	95	2017-03-26 03:32:22.219104+00	2017-03-26 03:32:22.219139+00
366	2017-03-26 03:32:22.228691+00	55	f	96	4	96	2017-03-26 03:32:22.229005+00	2017-03-26 03:32:22.229037+00
367	2017-03-26 03:32:22.238652+00	39	f	97	2	97	2017-03-26 03:32:22.238944+00	2017-03-26 03:32:22.238977+00
368	2017-03-26 03:32:22.248673+00	13	f	101	0	98	2017-03-26 03:32:22.248961+00	2017-03-26 03:32:22.248994+00
369	2017-03-26 03:32:22.258613+00	61	f	98	5	99	2017-03-26 03:32:22.258875+00	2017-03-26 03:32:22.258918+00
370	2017-03-26 03:51:57.703+00	16616	f	1	682	1	2017-03-26 03:51:57.703368+00	2017-03-26 03:51:57.703408+00
371	2017-03-26 03:51:57.792975+00	3250	f	2	111	2	2017-03-26 03:51:57.793322+00	2017-03-26 03:51:57.793364+00
372	2017-03-26 03:51:57.810904+00	917	f	5	20	3	2017-03-26 03:51:57.81121+00	2017-03-26 03:51:57.811246+00
373	2017-03-26 03:51:57.822241+00	5571	f	3	177	4	2017-03-26 03:51:57.82253+00	2017-03-26 03:51:57.822565+00
374	2017-03-26 03:51:57.832204+00	2137	f	4	168	5	2017-03-26 03:51:57.832494+00	2017-03-26 03:51:57.832529+00
375	2017-03-26 03:51:59.314798+00	1264	f	6	14	7	2017-03-26 03:51:59.315215+00	2017-03-26 03:51:59.315262+00
376	2017-03-26 03:51:59.417703+00	89	f	36	6	8	2017-03-26 03:51:59.418082+00	2017-03-26 03:51:59.418125+00
377	2017-03-26 03:51:59.436687+00	295	f	7	2	9	2017-03-26 03:51:59.437027+00	2017-03-26 03:51:59.437067+00
378	2017-03-26 03:51:59.453319+00	340	f	8	3	10	2017-03-26 03:51:59.453626+00	2017-03-26 03:51:59.453663+00
379	2017-03-26 03:51:59.466494+00	350	f	9	12	11	2017-03-26 03:51:59.466795+00	2017-03-26 03:51:59.46683+00
380	2017-03-26 03:51:59.476462+00	124	f	13	4	12	2017-03-26 03:51:59.476739+00	2017-03-26 03:51:59.476783+00
381	2017-03-26 03:51:59.486424+00	114	f	15	3	13	2017-03-26 03:51:59.4867+00	2017-03-26 03:51:59.486733+00
382	2017-03-26 03:51:59.496472+00	151	f	12	18	14	2017-03-26 03:51:59.496751+00	2017-03-26 03:51:59.496796+00
383	2017-03-26 03:51:59.506498+00	2814	f	10	51	15	2017-03-26 03:51:59.506905+00	2017-03-26 03:51:59.506938+00
384	2017-03-26 03:51:59.5165+00	19342	f	11	444	16	2017-03-26 03:51:59.516788+00	2017-03-26 03:51:59.516822+00
385	2017-03-26 03:51:59.526451+00	115	f	16	3	17	2017-03-26 03:51:59.526717+00	2017-03-26 03:51:59.526748+00
386	2017-03-26 03:51:59.536608+00	100	f	14	3	18	2017-03-26 03:51:59.536892+00	2017-03-26 03:51:59.536925+00
387	2017-03-26 03:51:59.546959+00	81	f	20	2	19	2017-03-26 03:51:59.547224+00	2017-03-26 03:51:59.547255+00
388	2017-03-26 03:51:59.55658+00	144	f	18	14	20	2017-03-26 03:51:59.556856+00	2017-03-26 03:51:59.556887+00
389	2017-03-26 03:51:59.567124+00	55	f	24	5	21	2017-03-26 03:51:59.56745+00	2017-03-26 03:51:59.567488+00
390	2017-03-26 03:51:59.58374+00	1939	f	17	40	22	2017-03-26 03:51:59.584099+00	2017-03-26 03:51:59.584137+00
391	2017-03-26 03:51:59.597002+00	32	f	49	2	23	2017-03-26 03:51:59.597305+00	2017-03-26 03:51:59.597342+00
392	2017-03-26 03:52:01.125099+00	41	f	38	2	25	2017-03-26 03:52:01.125507+00	2017-03-26 03:52:01.125554+00
393	2017-03-26 03:52:01.210069+00	2516	f	22	36	26	2017-03-26 03:52:01.210426+00	2017-03-26 03:52:01.210469+00
394	2017-03-26 03:52:01.221391+00	1115	f	26	63	27	2017-03-26 03:52:01.221716+00	2017-03-26 03:52:01.221754+00
395	2017-03-26 03:52:01.238215+00	33	f	30	3	28	2017-03-26 03:52:01.238537+00	2017-03-26 03:52:01.238575+00
396	2017-03-26 03:52:01.251382+00	1364	f	28	92	29	2017-03-26 03:52:01.251702+00	2017-03-26 03:52:01.25174+00
397	2017-03-26 03:52:01.268308+00	24	f	46	6	30	2017-03-26 03:52:01.26865+00	2017-03-26 03:52:01.26869+00
398	2017-03-26 03:52:01.281531+00	14	f	42	5	31	2017-03-26 03:52:01.28187+00	2017-03-26 03:52:01.281909+00
399	2017-03-26 03:52:01.298106+00	384	f	32	15	32	2017-03-26 03:52:01.29842+00	2017-03-26 03:52:01.298457+00
400	2017-03-26 03:52:01.311623+00	128	f	40	9	33	2017-03-26 03:52:01.311949+00	2017-03-26 03:52:01.311985+00
401	2017-03-26 03:52:01.328229+00	46078	f	34	2099	34	2017-03-26 03:52:01.328541+00	2017-03-26 03:52:01.328577+00
402	2017-03-26 03:52:03.017433+00	6960	f	44	115	36	2017-03-26 03:52:03.017834+00	2017-03-26 03:52:03.017878+00
403	2017-03-26 03:52:03.044135+00	25	f	52	0	37	2017-03-26 03:52:03.044442+00	2017-03-26 03:52:03.044478+00
404	2017-03-26 03:52:03.055925+00	2041	f	48	41	38	2017-03-26 03:52:03.056239+00	2017-03-26 03:52:03.056273+00
405	2017-03-26 03:52:03.072496+00	63	f	50	3	39	2017-03-26 03:52:03.072788+00	2017-03-26 03:52:03.072822+00
406	2017-03-26 03:52:03.085858+00	78	f	51	22	40	2017-03-26 03:52:03.086119+00	2017-03-26 03:52:03.08615+00
407	2017-03-26 03:52:03.095782+00	22	f	53	1	41	2017-03-26 03:52:03.096069+00	2017-03-26 03:52:03.096102+00
408	2017-03-26 03:52:03.10587+00	17	f	56	0	42	2017-03-26 03:52:03.106121+00	2017-03-26 03:52:03.106151+00
409	2017-03-26 03:52:03.122257+00	1972	f	54	19	43	2017-03-26 03:52:03.12251+00	2017-03-26 03:52:03.12254+00
410	2017-03-26 03:52:03.135853+00	6151	f	55	165	44	2017-03-26 03:52:03.136124+00	2017-03-26 03:52:03.136154+00
411	2017-03-26 03:52:03.145928+00	2546	f	57	287	45	2017-03-26 03:52:03.146174+00	2017-03-26 03:52:03.146203+00
412	2017-03-26 03:52:03.155811+00	54	f	62	1	46	2017-03-26 03:52:03.156071+00	2017-03-26 03:52:03.1561+00
413	2017-03-26 03:52:03.165817+00	52	f	59	4	47	2017-03-26 03:52:03.166058+00	2017-03-26 03:52:03.166086+00
414	2017-03-26 03:52:03.1757+00	627	f	58	56	48	2017-03-26 03:52:03.175942+00	2017-03-26 03:52:03.175969+00
415	2017-03-26 03:52:03.185836+00	9	f	64	2	49	2017-03-26 03:52:03.186072+00	2017-03-26 03:52:03.186099+00
416	2017-03-26 03:52:03.195905+00	258	f	60	11	50	2017-03-26 03:52:03.196156+00	2017-03-26 03:52:03.196185+00
417	2017-03-26 03:52:03.205934+00	21293	f	61	495	51	2017-03-26 03:52:03.206165+00	2017-03-26 03:52:03.206192+00
418	2017-03-26 03:52:03.215963+00	20	f	65	0	52	2017-03-26 03:52:03.216214+00	2017-03-26 03:52:03.216242+00
419	2017-03-26 03:52:03.225968+00	9	f	63	0	53	2017-03-26 03:52:03.226197+00	2017-03-26 03:52:03.226225+00
420	2017-03-26 03:52:03.235989+00	7	f	67	0	54	2017-03-26 03:52:03.236239+00	2017-03-26 03:52:03.236267+00
421	2017-03-26 03:52:03.24595+00	8033	f	66	231	55	2017-03-26 03:52:03.246182+00	2017-03-26 03:52:03.246209+00
422	2017-03-26 03:52:03.256117+00	4	f	80	0	56	2017-03-26 03:52:03.256347+00	2017-03-26 03:52:03.256374+00
423	2017-03-26 03:52:05.298006+00	2	f	108	0	57	2017-03-26 03:52:05.29844+00	2017-03-26 03:52:05.298485+00
424	2017-03-26 03:52:05.312736+00	1	f	107	0	58	2017-03-26 03:52:05.313094+00	2017-03-26 03:52:05.313135+00
425	2017-03-26 03:52:05.3287+00	5336	f	68	139	59	2017-03-26 03:52:05.329041+00	2017-03-26 03:52:05.32908+00
426	2017-03-26 03:52:05.342441+00	1213	f	69	17	60	2017-03-26 03:52:05.342745+00	2017-03-26 03:52:05.342796+00
427	2017-03-26 03:52:05.358508+00	61	f	72	10	61	2017-03-26 03:52:05.358809+00	2017-03-26 03:52:05.358845+00
428	2017-03-26 03:52:05.372191+00	1603	f	71	53	62	2017-03-26 03:52:05.372467+00	2017-03-26 03:52:05.372499+00
429	2017-03-26 03:52:06.842403+00	2	f	73	4	64	2017-03-26 03:52:06.842823+00	2017-03-26 03:52:06.84287+00
430	2017-03-26 03:52:06.86647+00	56	f	74	6	65	2017-03-26 03:52:06.866807+00	2017-03-26 03:52:06.866846+00
431	2017-03-26 03:52:06.882548+00	3	f	70	1	66	2017-03-26 03:52:06.882864+00	2017-03-26 03:52:06.8829+00
432	2017-03-26 03:52:08.325132+00	64	f	75	2	68	2017-03-26 03:52:08.325539+00	2017-03-26 03:52:08.325585+00
433	2017-03-26 03:52:10.481022+00	0	f	109	1	69	2017-03-26 03:52:10.481425+00	2017-03-26 03:52:10.481469+00
434	2017-03-26 03:52:14.240513+00	0	f	110	0	71	2017-03-26 03:52:14.240936+00	2017-03-26 03:52:14.24098+00
435	2017-03-26 03:52:16.209512+00	72	f	76	12	73	2017-03-26 03:52:16.209918+00	2017-03-26 03:52:16.209963+00
436	2017-03-26 03:52:16.286695+00	1	f	106	1	74	2017-03-26 03:52:16.287058+00	2017-03-26 03:52:16.287098+00
437	2017-03-26 03:52:16.301216+00	32	f	77	2	75	2017-03-26 03:52:16.301539+00	2017-03-26 03:52:16.301577+00
438	2017-03-26 03:52:19.317533+00	141	f	78	14	78	2017-03-26 03:52:19.31793+00	2017-03-26 03:52:19.317974+00
439	2017-03-26 03:52:21.143116+00	83	f	79	3	80	2017-03-26 03:52:21.143502+00	2017-03-26 03:52:21.143545+00
440	2017-03-26 03:52:21.21055+00	25	f	81	3	81	2017-03-26 03:52:21.211153+00	2017-03-26 03:52:21.211195+00
441	2017-03-26 03:52:22.677494+00	84	f	83	24	83	2017-03-26 03:52:22.677917+00	2017-03-26 03:52:22.677964+00
442	2017-03-26 03:52:22.753084+00	135	f	84	7	84	2017-03-26 03:52:22.753449+00	2017-03-26 03:52:22.753493+00
443	2017-03-26 03:52:22.768188+00	2	f	82	5	85	2017-03-26 03:52:22.768528+00	2017-03-26 03:52:22.768568+00
444	2017-03-26 03:52:24.41256+00	413	f	85	82	87	2017-03-26 03:52:24.412957+00	2017-03-26 03:52:24.413001+00
445	2017-03-26 03:52:24.513197+00	71	f	86	14	88	2017-03-26 03:52:24.51355+00	2017-03-26 03:52:24.513593+00
446	2017-03-26 03:52:24.528719+00	6	f	89	18	89	2017-03-26 03:52:24.529063+00	2017-03-26 03:52:24.529102+00
447	2017-03-26 03:52:24.542556+00	21703	f	87	357	90	2017-03-26 03:52:24.542875+00	2017-03-26 03:52:24.542911+00
448	2017-03-26 03:52:26.095956+00	5616	f	88	177	92	2017-03-26 03:52:26.096431+00	2017-03-26 03:52:26.096478+00
449	2017-03-26 03:52:26.194505+00	39	f	90	7	93	2017-03-26 03:52:26.195004+00	2017-03-26 03:52:26.195054+00
450	2017-03-26 03:52:26.211657+00	21	f	92	2	94	2017-03-26 03:52:26.21204+00	2017-03-26 03:52:26.212084+00
451	2017-03-26 03:52:26.227169+00	27	f	91	3	95	2017-03-26 03:52:26.227526+00	2017-03-26 03:52:26.227564+00
452	2017-03-26 03:52:26.242745+00	132	f	93	18	96	2017-03-26 03:52:26.243066+00	2017-03-26 03:52:26.243102+00
453	2017-03-26 03:52:26.257084+00	43	f	94	1	97	2017-03-26 03:52:26.257386+00	2017-03-26 03:52:26.257422+00
454	2017-03-26 03:52:26.272711+00	19	f	95	2	98	2017-03-26 03:52:26.273015+00	2017-03-26 03:52:26.273049+00
455	2017-03-26 03:52:26.286917+00	58	f	96	4	99	2017-03-26 03:52:26.287206+00	2017-03-26 03:52:26.28724+00
456	2017-03-26 04:11:57.877975+00	17031	f	1	700	1	2017-03-26 04:11:57.878325+00	2017-03-26 04:11:57.878364+00
457	2017-03-26 04:11:57.94055+00	3438	f	2	114	2	2017-03-26 04:11:57.940893+00	2017-03-26 04:11:57.940933+00
458	2017-03-26 04:11:57.954963+00	1071	f	5	21	3	2017-03-26 04:11:57.955252+00	2017-03-26 04:11:57.955286+00
459	2017-03-26 04:11:57.97011+00	5669	f	3	180	4	2017-03-26 04:11:57.9704+00	2017-03-26 04:11:57.970435+00
460	2017-03-26 04:11:57.985026+00	2200	f	4	173	5	2017-03-26 04:11:57.985316+00	2017-03-26 04:11:57.98535+00
461	2017-03-26 04:11:59.617289+00	150	f	36	10	7	2017-03-26 04:11:59.617637+00	2017-03-26 04:11:59.617688+00
462	2017-03-26 04:11:59.720118+00	1288	f	6	14	8	2017-03-26 04:11:59.720486+00	2017-03-26 04:11:59.72053+00
463	2017-03-26 04:11:59.747751+00	320	f	7	3	9	2017-03-26 04:11:59.74813+00	2017-03-26 04:11:59.748171+00
464	2017-03-26 04:11:59.759606+00	371	f	9	12	10	2017-03-26 04:11:59.759926+00	2017-03-26 04:11:59.759962+00
465	2017-03-26 04:11:59.77508+00	353	f	8	3	11	2017-03-26 04:11:59.775382+00	2017-03-26 04:11:59.775419+00
466	2017-03-26 04:11:59.789642+00	144	f	13	4	12	2017-03-26 04:11:59.789944+00	2017-03-26 04:11:59.789979+00
467	2017-03-26 04:11:59.804946+00	128	f	15	3	13	2017-03-26 04:11:59.80524+00	2017-03-26 04:11:59.805275+00
468	2017-03-26 04:11:59.819634+00	166	f	12	18	14	2017-03-26 04:11:59.819944+00	2017-03-26 04:11:59.819978+00
469	2017-03-26 04:11:59.834835+00	2845	f	10	52	15	2017-03-26 04:11:59.83511+00	2017-03-26 04:11:59.835142+00
470	2017-03-26 04:11:59.849573+00	137	f	16	5	16	2017-03-26 04:11:59.849864+00	2017-03-26 04:11:59.849897+00
471	2017-03-26 04:11:59.864855+00	95	f	20	2	17	2017-03-26 04:11:59.865118+00	2017-03-26 04:11:59.865149+00
472	2017-03-26 04:11:59.879533+00	19340	f	11	444	18	2017-03-26 04:11:59.879808+00	2017-03-26 04:11:59.879838+00
473	2017-03-26 04:11:59.894863+00	48	f	49	3	19	2017-03-26 04:11:59.895127+00	2017-03-26 04:11:59.895159+00
474	2017-03-26 04:11:59.909658+00	105	f	14	3	20	2017-03-26 04:11:59.909934+00	2017-03-26 04:11:59.909966+00
475	2017-03-26 04:11:59.924996+00	153	f	18	14	21	2017-03-26 04:11:59.925257+00	2017-03-26 04:11:59.925288+00
476	2017-03-26 04:11:59.939759+00	66	f	24	8	22	2017-03-26 04:11:59.940051+00	2017-03-26 04:11:59.940085+00
477	2017-03-26 04:11:59.955025+00	1939	f	17	40	23	2017-03-26 04:11:59.955286+00	2017-03-26 04:11:59.955317+00
478	2017-03-26 04:12:01.457297+00	50	f	38	2	25	2017-03-26 04:12:01.457689+00	2017-03-26 04:12:01.457735+00
479	2017-03-26 04:12:01.554201+00	2510	f	22	36	26	2017-03-26 04:12:01.554568+00	2017-03-26 04:12:01.554612+00
480	2017-03-26 04:12:01.590177+00	21	f	42	5	27	2017-03-26 04:12:01.590544+00	2017-03-26 04:12:01.590588+00
481	2017-03-26 04:12:01.604712+00	33	f	30	3	28	2017-03-26 04:12:01.605066+00	2017-03-26 04:12:01.605107+00
482	2017-03-26 04:12:01.619973+00	1121	f	26	63	29	2017-03-26 04:12:01.620333+00	2017-03-26 04:12:01.620373+00
483	2017-03-26 04:12:01.634522+00	1362	f	28	92	30	2017-03-26 04:12:01.634847+00	2017-03-26 04:12:01.634884+00
484	2017-03-26 04:12:01.691034+00	24	f	46	6	31	2017-03-26 04:12:01.691341+00	2017-03-26 04:12:01.691378+00
485	2017-03-26 04:12:03.268812+00	388	f	32	15	33	2017-03-26 04:12:03.269198+00	2017-03-26 04:12:03.269241+00
486	2017-03-26 04:12:03.329042+00	132	f	40	9	34	2017-03-26 04:12:03.329381+00	2017-03-26 04:12:03.32942+00
487	2017-03-26 04:12:03.344332+00	46085	f	34	2099	35	2017-03-26 04:12:03.34464+00	2017-03-26 04:12:03.34469+00
488	2017-03-26 04:12:03.358705+00	6962	f	44	115	36	2017-03-26 04:12:03.358998+00	2017-03-26 04:12:03.359032+00
489	2017-03-26 04:12:03.374309+00	26	f	52	0	37	2017-03-26 04:12:03.374599+00	2017-03-26 04:12:03.374633+00
490	2017-03-26 04:12:03.388609+00	2047	f	48	41	38	2017-03-26 04:12:03.388904+00	2017-03-26 04:12:03.388937+00
491	2017-03-26 04:12:03.40427+00	68	f	50	3	39	2017-03-26 04:12:03.404547+00	2017-03-26 04:12:03.404581+00
492	2017-03-26 04:12:03.418688+00	25	f	53	1	40	2017-03-26 04:12:03.418968+00	2017-03-26 04:12:03.419+00
493	2017-03-26 04:12:03.434265+00	81	f	51	22	41	2017-03-26 04:12:03.434529+00	2017-03-26 04:12:03.434561+00
494	2017-03-26 04:12:03.448753+00	15	f	56	0	42	2017-03-26 04:12:03.449017+00	2017-03-26 04:12:03.449048+00
495	2017-03-26 04:12:03.464309+00	1976	f	54	19	43	2017-03-26 04:12:03.464574+00	2017-03-26 04:12:03.464606+00
496	2017-03-26 04:12:03.478803+00	6146	f	55	165	44	2017-03-26 04:12:03.479068+00	2017-03-26 04:12:03.4791+00
497	2017-03-26 04:12:03.494496+00	49	f	62	1	45	2017-03-26 04:12:03.494781+00	2017-03-26 04:12:03.494812+00
498	2017-03-26 04:12:03.508958+00	2545	f	57	287	46	2017-03-26 04:12:03.509223+00	2017-03-26 04:12:03.509254+00
499	2017-03-26 04:12:03.524513+00	53	f	59	5	47	2017-03-26 04:12:03.524792+00	2017-03-26 04:12:03.524824+00
500	2017-03-26 04:12:03.539006+00	627	f	58	56	48	2017-03-26 04:12:03.539272+00	2017-03-26 04:12:03.539303+00
501	2017-03-26 04:12:03.554563+00	9	f	63	0	49	2017-03-26 04:12:03.55484+00	2017-03-26 04:12:03.554872+00
502	2017-03-26 04:12:03.568953+00	8	f	64	2	50	2017-03-26 04:12:03.569218+00	2017-03-26 04:12:03.56925+00
503	2017-03-26 04:12:03.584718+00	264	f	60	11	51	2017-03-26 04:12:03.584983+00	2017-03-26 04:12:03.585014+00
504	2017-03-26 04:12:03.599112+00	21298	f	61	496	52	2017-03-26 04:12:03.599377+00	2017-03-26 04:12:03.599408+00
505	2017-03-26 04:12:03.614837+00	19	f	65	0	53	2017-03-26 04:12:03.615104+00	2017-03-26 04:12:03.615135+00
506	2017-03-26 04:12:03.629091+00	7	f	67	0	54	2017-03-26 04:12:03.629344+00	2017-03-26 04:12:03.629374+00
507	2017-03-26 04:12:03.644789+00	8035	f	66	231	55	2017-03-26 04:12:03.645041+00	2017-03-26 04:12:03.645071+00
508	2017-03-26 04:12:03.65915+00	4	f	80	0	56	2017-03-26 04:12:03.659404+00	2017-03-26 04:12:03.659434+00
509	2017-03-26 04:12:03.674893+00	3	f	108	0	57	2017-03-26 04:12:03.675147+00	2017-03-26 04:12:03.675177+00
510	2017-03-26 04:12:03.689311+00	3	f	107	2	58	2017-03-26 04:12:03.689563+00	2017-03-26 04:12:03.689593+00
511	2017-03-26 04:12:03.705035+00	5329	f	68	139	59	2017-03-26 04:12:03.705287+00	2017-03-26 04:12:03.705317+00
512	2017-03-26 04:12:03.719331+00	1210	f	69	17	60	2017-03-26 04:12:03.719585+00	2017-03-26 04:12:03.719614+00
513	2017-03-26 04:12:03.73509+00	62	f	72	10	61	2017-03-26 04:12:03.735341+00	2017-03-26 04:12:03.735371+00
514	2017-03-26 04:12:03.749442+00	1604	f	71	53	62	2017-03-26 04:12:03.749722+00	2017-03-26 04:12:03.749752+00
515	2017-03-26 04:12:05.244341+00	5	f	73	4	64	2017-03-26 04:12:05.244763+00	2017-03-26 04:12:05.24481+00
516	2017-03-26 04:12:05.324909+00	59	f	74	6	65	2017-03-26 04:12:05.325303+00	2017-03-26 04:12:05.325349+00
517	2017-03-26 04:12:05.360187+00	3	f	70	1	66	2017-03-26 04:12:05.360543+00	2017-03-26 04:12:05.360585+00
518	2017-03-26 04:12:06.860592+00	64	f	75	2	68	2017-03-26 04:12:06.861011+00	2017-03-26 04:12:06.861055+00
519	2017-03-26 04:12:09.070804+00	0	f	111	1	69	2017-03-26 04:12:09.0712+00	2017-03-26 04:12:09.071242+00
520	2017-03-26 04:12:09.083704+00	0	f	109	1	70	2017-03-26 04:12:09.084056+00	2017-03-26 04:12:09.084097+00
521	2017-03-26 04:12:10.938654+00	0	f	110	0	72	2017-03-26 04:12:10.939072+00	2017-03-26 04:12:10.939116+00
522	2017-03-26 04:12:11.00881+00	74	f	76	12	73	2017-03-26 04:12:11.009182+00	2017-03-26 04:12:11.009226+00
523	2017-03-26 04:12:12.818417+00	33	f	77	2	75	2017-03-26 04:12:12.818826+00	2017-03-26 04:12:12.818871+00
524	2017-03-26 04:12:12.873377+00	2	f	106	1	76	2017-03-26 04:12:12.873728+00	2017-03-26 04:12:12.873768+00
525	2017-03-26 04:12:14.40275+00	145	f	78	14	78	2017-03-26 04:12:14.403117+00	2017-03-26 04:12:14.403158+00
526	2017-03-26 04:12:15.949966+00	78	f	79	3	80	2017-03-26 04:12:15.950355+00	2017-03-26 04:12:15.9504+00
527	2017-03-26 04:12:16.021615+00	25	f	81	3	81	2017-03-26 04:12:16.022012+00	2017-03-26 04:12:16.022056+00
528	2017-03-26 04:12:17.492921+00	85	f	83	24	83	2017-03-26 04:12:17.49331+00	2017-03-26 04:12:17.493353+00
529	2017-03-26 04:12:17.565294+00	132	f	84	7	84	2017-03-26 04:12:17.565663+00	2017-03-26 04:12:17.565725+00
530	2017-03-26 04:12:17.582272+00	2	f	82	5	85	2017-03-26 04:12:17.582617+00	2017-03-26 04:12:17.582657+00
531	2017-03-26 04:12:20.602194+00	419	f	85	82	88	2017-03-26 04:12:20.602575+00	2017-03-26 04:12:20.602617+00
532	2017-03-26 04:12:20.663285+00	70	f	86	14	89	2017-03-26 04:12:20.663699+00	2017-03-26 04:12:20.663747+00
533	2017-03-26 04:12:20.680251+00	9	f	89	18	90	2017-03-26 04:12:20.680598+00	2017-03-26 04:12:20.680638+00
534	2017-03-26 04:12:20.692841+00	21700	f	87	357	91	2017-03-26 04:12:20.693165+00	2017-03-26 04:12:20.693203+00
535	2017-03-26 04:12:22.315496+00	5611	f	88	177	93	2017-03-26 04:12:22.315916+00	2017-03-26 04:12:22.315963+00
536	2017-03-26 04:12:22.387655+00	39	f	90	7	94	2017-03-26 04:12:22.388091+00	2017-03-26 04:12:22.388138+00
537	2017-03-26 04:12:22.405197+00	18	f	92	2	95	2017-03-26 04:12:22.405561+00	2017-03-26 04:12:22.405605+00
538	2017-03-26 04:12:22.417251+00	27	f	91	3	96	2017-03-26 04:12:22.417575+00	2017-03-26 04:12:22.417613+00
539	2017-03-26 04:12:22.427171+00	133	f	93	18	97	2017-03-26 04:12:22.427475+00	2017-03-26 04:12:22.427511+00
540	2017-03-26 04:12:22.437157+00	45	f	94	1	98	2017-03-26 04:12:22.437461+00	2017-03-26 04:12:22.437498+00
541	2017-03-26 04:12:22.447039+00	18	f	95	2	99	2017-03-26 04:12:22.44733+00	2017-03-26 04:12:22.447364+00
542	2017-03-26 04:31:59.158198+00	17493	f	1	712	1	2017-03-26 04:31:59.158583+00	2017-03-26 04:31:59.158626+00
543	2017-03-26 04:31:59.241194+00	3669	f	2	119	2	2017-03-26 04:31:59.241574+00	2017-03-26 04:31:59.241619+00
544	2017-03-26 04:31:59.250477+00	1274	f	5	24	3	2017-03-26 04:31:59.25082+00	2017-03-26 04:31:59.250876+00
545	2017-03-26 04:31:59.260642+00	5758	f	3	183	4	2017-03-26 04:31:59.26098+00	2017-03-26 04:31:59.261019+00
546	2017-03-26 04:31:59.278718+00	2280	f	4	179	5	2017-03-26 04:31:59.27904+00	2017-03-26 04:31:59.279076+00
547	2017-03-26 04:31:59.290275+00	212	f	36	11	6	2017-03-26 04:31:59.290564+00	2017-03-26 04:31:59.290598+00
548	2017-03-26 04:32:00.861654+00	1341	f	6	14	8	2017-03-26 04:32:00.862052+00	2017-03-26 04:32:00.862095+00
549	2017-03-26 04:32:00.933613+00	358	f	7	5	9	2017-03-26 04:32:00.934002+00	2017-03-26 04:32:00.934046+00
550	2017-03-26 04:32:00.944956+00	170	f	13	4	10	2017-03-26 04:32:00.945302+00	2017-03-26 04:32:00.945342+00
551	2017-03-26 04:32:00.954815+00	394	f	9	12	11	2017-03-26 04:32:00.955154+00	2017-03-26 04:32:00.955193+00
552	2017-03-26 04:32:00.964816+00	377	f	8	3	12	2017-03-26 04:32:00.965137+00	2017-03-26 04:32:00.965174+00
553	2017-03-26 04:32:00.974718+00	160	f	15	3	13	2017-03-26 04:32:00.97504+00	2017-03-26 04:32:00.975075+00
554	2017-03-26 04:32:00.984795+00	78	f	49	3	14	2017-03-26 04:32:00.985116+00	2017-03-26 04:32:00.985151+00
555	2017-03-26 04:32:00.994593+00	173	f	12	18	15	2017-03-26 04:32:00.994898+00	2017-03-26 04:32:00.994932+00
556	2017-03-26 04:32:01.004736+00	122	f	20	2	16	2017-03-26 04:32:01.005043+00	2017-03-26 04:32:01.005077+00
557	2017-03-26 04:32:01.014721+00	148	f	16	6	17	2017-03-26 04:32:01.015013+00	2017-03-26 04:32:01.015046+00
558	2017-03-26 04:32:01.024646+00	2861	f	10	52	18	2017-03-26 04:32:01.024947+00	2017-03-26 04:32:01.024978+00
559	2017-03-26 04:32:01.034612+00	126	f	14	3	19	2017-03-26 04:32:01.03489+00	2017-03-26 04:32:01.034922+00
560	2017-03-26 04:32:01.044577+00	19345	f	11	445	20	2017-03-26 04:32:01.044841+00	2017-03-26 04:32:01.044884+00
561	2017-03-26 04:32:01.054642+00	177	f	18	14	21	2017-03-26 04:32:01.054922+00	2017-03-26 04:32:01.054954+00
562	2017-03-26 04:32:01.064765+00	80	f	24	9	22	2017-03-26 04:32:01.065043+00	2017-03-26 04:32:01.065074+00
563	2017-03-26 04:32:02.695005+00	60	f	38	2	24	2017-03-26 04:32:02.695394+00	2017-03-26 04:32:02.695438+00
564	2017-03-26 04:32:02.770112+00	1948	f	17	40	25	2017-03-26 04:32:02.770487+00	2017-03-26 04:32:02.770531+00
565	2017-03-26 04:32:02.779968+00	27	f	42	6	26	2017-03-26 04:32:02.780367+00	2017-03-26 04:32:02.780411+00
566	2017-03-26 04:32:02.789892+00	47	f	30	3	27	2017-03-26 04:32:02.790236+00	2017-03-26 04:32:02.790276+00
567	2017-03-26 04:32:02.799765+00	2516	f	22	36	28	2017-03-26 04:32:02.800157+00	2017-03-26 04:32:02.800196+00
568	2017-03-26 04:32:02.809737+00	32	f	46	6	29	2017-03-26 04:32:02.81008+00	2017-03-26 04:32:02.81012+00
569	2017-03-26 04:32:02.819519+00	1118	f	26	63	30	2017-03-26 04:32:02.819828+00	2017-03-26 04:32:02.819879+00
570	2017-03-26 04:32:02.829582+00	1367	f	28	92	31	2017-03-26 04:32:02.829902+00	2017-03-26 04:32:02.829939+00
571	2017-03-26 04:32:04.291798+00	389	f	32	15	33	2017-03-26 04:32:04.29224+00	2017-03-26 04:32:04.292284+00
572	2017-03-26 04:32:04.353217+00	132	f	40	9	34	2017-03-26 04:32:04.353546+00	2017-03-26 04:32:04.353585+00
573	2017-03-26 04:32:04.363705+00	46095	f	34	2101	35	2017-03-26 04:32:04.364053+00	2017-03-26 04:32:04.364092+00
574	2017-03-26 04:32:04.373653+00	28	f	52	0	36	2017-03-26 04:32:04.373987+00	2017-03-26 04:32:04.374022+00
575	2017-03-26 04:32:04.386242+00	6972	f	44	115	37	2017-03-26 04:32:04.386538+00	2017-03-26 04:32:04.386573+00
576	2017-03-26 04:32:04.402063+00	2049	f	48	41	38	2017-03-26 04:32:04.402344+00	2017-03-26 04:32:04.402376+00
577	2017-03-26 04:32:04.413554+00	8	f	107	2	39	2017-03-26 04:32:04.413834+00	2017-03-26 04:32:04.41388+00
578	2017-03-26 04:32:04.423562+00	64	f	50	3	40	2017-03-26 04:32:04.423841+00	2017-03-26 04:32:04.423887+00
579	2017-03-26 04:32:04.433599+00	84	f	51	22	41	2017-03-26 04:32:04.43389+00	2017-03-26 04:32:04.433923+00
580	2017-03-26 04:32:04.4437+00	25	f	53	1	42	2017-03-26 04:32:04.443995+00	2017-03-26 04:32:04.444051+00
581	2017-03-26 04:32:04.453701+00	21	f	56	0	43	2017-03-26 04:32:04.453994+00	2017-03-26 04:32:04.454027+00
582	2017-03-26 04:32:04.463736+00	1982	f	54	19	44	2017-03-26 04:32:04.464052+00	2017-03-26 04:32:04.464086+00
583	2017-03-26 04:32:04.473813+00	5	f	108	0	45	2017-03-26 04:32:04.474108+00	2017-03-26 04:32:04.474141+00
584	2017-03-26 04:32:04.483807+00	53	f	62	1	46	2017-03-26 04:32:04.484189+00	2017-03-26 04:32:04.484223+00
585	2017-03-26 04:32:04.493721+00	6	f	80	0	47	2017-03-26 04:32:04.494002+00	2017-03-26 04:32:04.494032+00
586	2017-03-26 04:32:04.5038+00	6144	f	55	165	48	2017-03-26 04:32:04.504103+00	2017-03-26 04:32:04.504135+00
587	2017-03-26 04:32:04.513858+00	53	f	59	5	49	2017-03-26 04:32:04.514128+00	2017-03-26 04:32:04.514159+00
588	2017-03-26 04:32:04.523804+00	2547	f	57	287	50	2017-03-26 04:32:04.524093+00	2017-03-26 04:32:04.524123+00
589	2017-03-26 04:32:04.533823+00	625	f	58	56	51	2017-03-26 04:32:04.534092+00	2017-03-26 04:32:04.534122+00
590	2017-03-26 04:32:04.543829+00	9	f	63	0	52	2017-03-26 04:32:04.544122+00	2017-03-26 04:32:04.544151+00
591	2017-03-26 04:32:04.553836+00	8	f	64	2	53	2017-03-26 04:32:04.554094+00	2017-03-26 04:32:04.554123+00
592	2017-03-26 04:32:04.563713+00	23	f	65	0	54	2017-03-26 04:32:04.563968+00	2017-03-26 04:32:04.563997+00
593	2017-03-26 04:32:04.573821+00	265	f	60	11	55	2017-03-26 04:32:04.574078+00	2017-03-26 04:32:04.574106+00
594	2017-03-26 04:32:04.583892+00	21294	f	61	496	56	2017-03-26 04:32:04.584158+00	2017-03-26 04:32:04.584186+00
595	2017-03-26 04:32:04.593901+00	6	f	67	0	57	2017-03-26 04:32:04.594144+00	2017-03-26 04:32:04.594173+00
596	2017-03-26 04:32:04.603922+00	8035	f	66	231	58	2017-03-26 04:32:04.604191+00	2017-03-26 04:32:04.604221+00
597	2017-03-26 04:32:04.613882+00	1	f	111	1	59	2017-03-26 04:32:04.614117+00	2017-03-26 04:32:04.614144+00
598	2017-03-26 04:32:04.623905+00	2	f	109	1	60	2017-03-26 04:32:04.62416+00	2017-03-26 04:32:04.624189+00
599	2017-03-26 04:32:04.633929+00	5332	f	68	139	61	2017-03-26 04:32:04.634154+00	2017-03-26 04:32:04.63418+00
600	2017-03-26 04:32:04.643826+00	1209	f	69	17	62	2017-03-26 04:32:04.644083+00	2017-03-26 04:32:04.644109+00
601	2017-03-26 04:32:04.653903+00	61	f	72	10	63	2017-03-26 04:32:04.654129+00	2017-03-26 04:32:04.654155+00
602	2017-03-26 04:32:04.663987+00	1607	f	71	53	64	2017-03-26 04:32:04.664231+00	2017-03-26 04:32:04.664258+00
603	2017-03-26 04:32:06.067022+00	65	f	74	6	66	2017-03-26 04:32:06.067431+00	2017-03-26 04:32:06.067477+00
604	2017-03-26 04:32:06.139908+00	5	f	73	4	67	2017-03-26 04:32:06.140265+00	2017-03-26 04:32:06.140304+00
605	2017-03-26 04:32:06.150093+00	2	f	70	1	68	2017-03-26 04:32:06.150401+00	2017-03-26 04:32:06.150436+00
606	2017-03-26 04:32:09.92509+00	0	f	112	1	70	2017-03-26 04:32:09.925536+00	2017-03-26 04:32:09.925583+00
607	2017-03-26 04:32:09.938839+00	64	f	75	2	71	2017-03-26 04:32:09.939191+00	2017-03-26 04:32:09.93923+00
608	2017-03-26 04:32:12.005548+00	72	f	76	12	73	2017-03-26 04:32:12.00593+00	2017-03-26 04:32:12.005972+00
609	2017-03-26 04:32:13.809983+00	37	f	77	2	75	2017-03-26 04:32:13.81037+00	2017-03-26 04:32:13.810414+00
610	2017-03-26 04:32:13.879173+00	2	f	106	1	76	2017-03-26 04:32:13.879548+00	2017-03-26 04:32:13.879592+00
611	2017-03-26 04:32:15.442438+00	142	f	78	14	78	2017-03-26 04:32:15.442804+00	2017-03-26 04:32:15.442859+00
612	2017-03-26 04:32:17.006286+00	80	f	79	3	80	2017-03-26 04:32:17.006672+00	2017-03-26 04:32:17.006716+00
613	2017-03-26 04:32:17.102258+00	24	f	81	3	81	2017-03-26 04:32:17.102618+00	2017-03-26 04:32:17.102661+00
614	2017-03-26 04:32:18.580969+00	87	f	83	24	83	2017-03-26 04:32:18.581382+00	2017-03-26 04:32:18.581429+00
615	2017-03-26 04:32:18.651886+00	136	f	84	7	84	2017-03-26 04:32:18.652314+00	2017-03-26 04:32:18.65236+00
616	2017-03-26 04:32:21.547542+00	3	f	100	0	87	2017-03-26 04:32:21.547971+00	2017-03-26 04:32:21.548056+00
617	2017-03-26 04:32:21.609324+00	413	f	85	82	88	2017-03-26 04:32:21.609683+00	2017-03-26 04:32:21.609726+00
618	2017-03-26 04:32:21.618986+00	66	f	86	14	89	2017-03-26 04:32:21.619312+00	2017-03-26 04:32:21.619351+00
619	2017-03-26 04:32:21.629077+00	4	f	82	5	90	2017-03-26 04:32:21.629403+00	2017-03-26 04:32:21.629442+00
620	2017-03-26 04:32:21.638766+00	10	f	89	18	91	2017-03-26 04:32:21.639094+00	2017-03-26 04:32:21.63913+00
621	2017-03-26 04:32:21.64882+00	21708	f	87	357	92	2017-03-26 04:32:21.649146+00	2017-03-26 04:32:21.649183+00
622	2017-03-26 04:32:23.195826+00	5617	f	88	177	94	2017-03-26 04:32:23.196296+00	2017-03-26 04:32:23.196343+00
623	2017-03-26 04:32:23.413939+00	34	f	90	7	95	2017-03-26 04:32:23.414301+00	2017-03-26 04:32:23.414344+00
624	2017-03-26 04:32:23.423749+00	19	f	92	2	96	2017-03-26 04:32:23.424121+00	2017-03-26 04:32:23.424161+00
625	2017-03-26 04:32:23.433542+00	27	f	91	3	97	2017-03-26 04:32:23.433864+00	2017-03-26 04:32:23.433902+00
626	2017-03-26 04:32:23.443436+00	136	f	93	18	98	2017-03-26 04:32:23.443761+00	2017-03-26 04:32:23.443829+00
627	2017-03-26 04:32:23.453352+00	43	f	94	1	99	2017-03-26 04:32:23.453647+00	2017-03-26 04:32:23.453681+00
\.


--
-- Name: reddit_redditpostsnapshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reddit_redditpostsnapshot_id_seq', 627, true);


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
-- Name: data_memedatasnapshot24hour data_memedatasnapshot24hour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_memedatasnapshot24hour
    ADD CONSTRAINT data_memedatasnapshot24hour_pkey PRIMARY KEY (id);


--
-- Name: data_memedatasnapshot30days data_memedatasnapshot30days_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_memedatasnapshot30days
    ADD CONSTRAINT data_memedatasnapshot30days_name_key UNIQUE (name);


--
-- Name: data_memedatasnapshot30days data_memedatasnapshot30days_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_memedatasnapshot30days
    ADD CONSTRAINT data_memedatasnapshot30days_pkey PRIMARY KEY (id);


--
-- Name: data_memedatasnapshot7days data_memedatasnapshot7days_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_memedatasnapshot7days
    ADD CONSTRAINT data_memedatasnapshot7days_pkey PRIMARY KEY (id);


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
-- Name: data_memedatasnapshot24hour_9d2e2dba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX data_memedatasnapshot24hour_9d2e2dba ON data_memedatasnapshot24hour USING btree (meme_id);


--
-- Name: data_memedatasnapshot30days_9d2e2dba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX data_memedatasnapshot30days_9d2e2dba ON data_memedatasnapshot30days USING btree (meme_id);


--
-- Name: data_memedatasnapshot30days_name_f53b2c69_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX data_memedatasnapshot30days_name_f53b2c69_like ON data_memedatasnapshot30days USING btree (name varchar_pattern_ops);


--
-- Name: data_memedatasnapshot7days_9d2e2dba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX data_memedatasnapshot7days_9d2e2dba ON data_memedatasnapshot7days USING btree (meme_id);


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
-- Name: data_memedatasnapshot24hour data_memedatasnapshot24hour_meme_id_1c23dd56_fk_memes_meme_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_memedatasnapshot24hour
    ADD CONSTRAINT data_memedatasnapshot24hour_meme_id_1c23dd56_fk_memes_meme_id FOREIGN KEY (meme_id) REFERENCES memes_meme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: data_memedatasnapshot30days data_memedatasnapshot30days_meme_id_8358781d_fk_memes_meme_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_memedatasnapshot30days
    ADD CONSTRAINT data_memedatasnapshot30days_meme_id_8358781d_fk_memes_meme_id FOREIGN KEY (meme_id) REFERENCES memes_meme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: data_memedatasnapshot7days data_memedatasnapshot7days_meme_id_5059676a_fk_memes_meme_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data_memedatasnapshot7days
    ADD CONSTRAINT data_memedatasnapshot7days_meme_id_5059676a_fk_memes_meme_id FOREIGN KEY (meme_id) REFERENCES memes_meme(id) DEFERRABLE INITIALLY DEFERRED;


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

