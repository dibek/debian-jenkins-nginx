--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: agile_colors; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE agile_colors (
    id integer NOT NULL,
    container_id integer,
    container_type character varying,
    color character varying
);


ALTER TABLE agile_colors OWNER TO "redmine/instances/default";

--
-- Name: agile_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE agile_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agile_colors_id_seq OWNER TO "redmine/instances/default";

--
-- Name: agile_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE agile_colors_id_seq OWNED BY agile_colors.id;


--
-- Name: agile_data; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE agile_data (
    id integer NOT NULL,
    issue_id integer,
    "position" integer,
    story_points integer
);


ALTER TABLE agile_data OWNER TO "redmine/instances/default";

--
-- Name: agile_data_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE agile_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agile_data_id_seq OWNER TO "redmine/instances/default";

--
-- Name: agile_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE agile_data_id_seq OWNED BY agile_data.id;


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE attachments (
    id integer NOT NULL,
    container_id integer,
    container_type character varying(30),
    filename character varying DEFAULT ''::character varying NOT NULL,
    disk_filename character varying DEFAULT ''::character varying NOT NULL,
    filesize bigint DEFAULT 0 NOT NULL,
    content_type character varying DEFAULT ''::character varying,
    digest character varying(40) DEFAULT ''::character varying NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    description character varying,
    disk_directory character varying
);


ALTER TABLE attachments OWNER TO "redmine/instances/default";

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attachments_id_seq OWNER TO "redmine/instances/default";

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE auth_sources (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    host character varying(60),
    port integer,
    account character varying,
    account_password character varying DEFAULT ''::character varying,
    base_dn character varying(255),
    attr_login character varying(30),
    attr_firstname character varying(30),
    attr_lastname character varying(30),
    attr_mail character varying(30),
    onthefly_register boolean DEFAULT false NOT NULL,
    tls boolean DEFAULT false NOT NULL,
    filter text,
    timeout integer
);


ALTER TABLE auth_sources OWNER TO "redmine/instances/default";

--
-- Name: auth_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE auth_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_sources_id_seq OWNER TO "redmine/instances/default";

--
-- Name: auth_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE auth_sources_id_seq OWNED BY auth_sources.id;


--
-- Name: boards; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE boards (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying,
    "position" integer,
    topics_count integer DEFAULT 0 NOT NULL,
    messages_count integer DEFAULT 0 NOT NULL,
    last_message_id integer,
    parent_id integer
);


ALTER TABLE boards OWNER TO "redmine/instances/default";

--
-- Name: boards_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE boards_id_seq OWNER TO "redmine/instances/default";

--
-- Name: boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE boards_id_seq OWNED BY boards.id;


--
-- Name: changes; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE changes (
    id integer NOT NULL,
    changeset_id integer NOT NULL,
    action character varying(1) DEFAULT ''::character varying NOT NULL,
    path text NOT NULL,
    from_path text,
    from_revision character varying,
    revision character varying,
    branch character varying
);


ALTER TABLE changes OWNER TO "redmine/instances/default";

--
-- Name: changes_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE changes_id_seq OWNER TO "redmine/instances/default";

--
-- Name: changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE changes_id_seq OWNED BY changes.id;


--
-- Name: changeset_parents; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE changeset_parents (
    changeset_id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE changeset_parents OWNER TO "redmine/instances/default";

--
-- Name: changesets; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE changesets (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    revision character varying NOT NULL,
    committer character varying,
    committed_on timestamp without time zone NOT NULL,
    comments text,
    commit_date date,
    scmid character varying,
    user_id integer
);


ALTER TABLE changesets OWNER TO "redmine/instances/default";

--
-- Name: changesets_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE changesets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE changesets_id_seq OWNER TO "redmine/instances/default";

--
-- Name: changesets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE changesets_id_seq OWNED BY changesets.id;


--
-- Name: changesets_issues; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE changesets_issues (
    changeset_id integer NOT NULL,
    issue_id integer NOT NULL
);


ALTER TABLE changesets_issues OWNER TO "redmine/instances/default";

--
-- Name: comments; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE comments (
    id integer NOT NULL,
    commented_type character varying(30) DEFAULT ''::character varying NOT NULL,
    commented_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    comments text,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE comments OWNER TO "redmine/instances/default";

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO "redmine/instances/default";

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: custom_field_enumerations; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE custom_field_enumerations (
    id integer NOT NULL,
    custom_field_id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "position" integer DEFAULT 1 NOT NULL
);


ALTER TABLE custom_field_enumerations OWNER TO "redmine/instances/default";

--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE custom_field_enumerations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE custom_field_enumerations_id_seq OWNER TO "redmine/instances/default";

--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE custom_field_enumerations_id_seq OWNED BY custom_field_enumerations.id;


--
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE custom_fields (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    field_format character varying(30) DEFAULT ''::character varying NOT NULL,
    possible_values text,
    regexp character varying DEFAULT ''::character varying,
    min_length integer,
    max_length integer,
    is_required boolean DEFAULT false NOT NULL,
    is_for_all boolean DEFAULT false NOT NULL,
    is_filter boolean DEFAULT false NOT NULL,
    "position" integer,
    searchable boolean DEFAULT false,
    default_value text,
    editable boolean DEFAULT true,
    visible boolean DEFAULT true NOT NULL,
    multiple boolean DEFAULT false,
    format_store text,
    description text
);


ALTER TABLE custom_fields OWNER TO "redmine/instances/default";

--
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE custom_fields_id_seq OWNER TO "redmine/instances/default";

--
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE custom_fields_id_seq OWNED BY custom_fields.id;


--
-- Name: custom_fields_projects; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE custom_fields_projects (
    custom_field_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE custom_fields_projects OWNER TO "redmine/instances/default";

--
-- Name: custom_fields_roles; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE custom_fields_roles (
    custom_field_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE custom_fields_roles OWNER TO "redmine/instances/default";

--
-- Name: custom_fields_trackers; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE custom_fields_trackers (
    custom_field_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE custom_fields_trackers OWNER TO "redmine/instances/default";

--
-- Name: custom_values; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE custom_values (
    id integer NOT NULL,
    customized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    customized_id integer DEFAULT 0 NOT NULL,
    custom_field_id integer DEFAULT 0 NOT NULL,
    value text
);


ALTER TABLE custom_values OWNER TO "redmine/instances/default";

--
-- Name: custom_values_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE custom_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE custom_values_id_seq OWNER TO "redmine/instances/default";

--
-- Name: custom_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE custom_values_id_seq OWNED BY custom_values.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE documents (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    description text,
    created_on timestamp without time zone
);


ALTER TABLE documents OWNER TO "redmine/instances/default";

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_id_seq OWNER TO "redmine/instances/default";

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: email_addresses; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE email_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address character varying NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    notify boolean DEFAULT true NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE email_addresses OWNER TO "redmine/instances/default";

--
-- Name: email_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE email_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_addresses_id_seq OWNER TO "redmine/instances/default";

--
-- Name: email_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE email_addresses_id_seq OWNED BY email_addresses.id;


--
-- Name: enabled_modules; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE enabled_modules (
    id integer NOT NULL,
    project_id integer,
    name character varying NOT NULL
);


ALTER TABLE enabled_modules OWNER TO "redmine/instances/default";

--
-- Name: enabled_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE enabled_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enabled_modules_id_seq OWNER TO "redmine/instances/default";

--
-- Name: enabled_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE enabled_modules_id_seq OWNED BY enabled_modules.id;


--
-- Name: enumerations; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE enumerations (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    is_default boolean DEFAULT false NOT NULL,
    type character varying,
    active boolean DEFAULT true NOT NULL,
    project_id integer,
    parent_id integer,
    position_name character varying(30)
);


ALTER TABLE enumerations OWNER TO "redmine/instances/default";

--
-- Name: enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE enumerations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enumerations_id_seq OWNER TO "redmine/instances/default";

--
-- Name: enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE enumerations_id_seq OWNED BY enumerations.id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE groups_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE groups_users OWNER TO "redmine/instances/default";

--
-- Name: import_items; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE import_items (
    id integer NOT NULL,
    import_id integer NOT NULL,
    "position" integer NOT NULL,
    obj_id integer,
    message text
);


ALTER TABLE import_items OWNER TO "redmine/instances/default";

--
-- Name: import_items_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE import_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE import_items_id_seq OWNER TO "redmine/instances/default";

--
-- Name: import_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE import_items_id_seq OWNED BY import_items.id;


--
-- Name: imports; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE imports (
    id integer NOT NULL,
    type character varying,
    user_id integer NOT NULL,
    filename character varying,
    settings text,
    total_items integer,
    finished boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE imports OWNER TO "redmine/instances/default";

--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE imports_id_seq OWNER TO "redmine/instances/default";

--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE imports_id_seq OWNED BY imports.id;


--
-- Name: issue_categories; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE issue_categories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    assigned_to_id integer
);


ALTER TABLE issue_categories OWNER TO "redmine/instances/default";

--
-- Name: issue_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE issue_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_categories_id_seq OWNER TO "redmine/instances/default";

--
-- Name: issue_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE issue_categories_id_seq OWNED BY issue_categories.id;


--
-- Name: issue_relations; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE issue_relations (
    id integer NOT NULL,
    issue_from_id integer NOT NULL,
    issue_to_id integer NOT NULL,
    relation_type character varying DEFAULT ''::character varying NOT NULL,
    delay integer
);


ALTER TABLE issue_relations OWNER TO "redmine/instances/default";

--
-- Name: issue_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE issue_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_relations_id_seq OWNER TO "redmine/instances/default";

--
-- Name: issue_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE issue_relations_id_seq OWNED BY issue_relations.id;


--
-- Name: issue_statuses; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE issue_statuses (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    "position" integer,
    default_done_ratio integer
);


ALTER TABLE issue_statuses OWNER TO "redmine/instances/default";

--
-- Name: issue_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE issue_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_statuses_id_seq OWNER TO "redmine/instances/default";

--
-- Name: issue_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE issue_statuses_id_seq OWNED BY issue_statuses.id;


--
-- Name: issues; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE issues (
    id integer NOT NULL,
    tracker_id integer NOT NULL,
    project_id integer NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    description text,
    due_date date,
    category_id integer,
    status_id integer NOT NULL,
    assigned_to_id integer,
    priority_id integer NOT NULL,
    fixed_version_id integer,
    author_id integer NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    start_date date,
    done_ratio integer DEFAULT 0 NOT NULL,
    estimated_hours double precision,
    parent_id integer,
    root_id integer,
    lft integer,
    rgt integer,
    is_private boolean DEFAULT false NOT NULL,
    closed_on timestamp without time zone,
    answers_on_secondary_projects boolean DEFAULT true NOT NULL
);


ALTER TABLE issues OWNER TO "redmine/instances/default";

--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issues_id_seq OWNER TO "redmine/instances/default";

--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE issues_id_seq OWNED BY issues.id;


--
-- Name: issues_projects; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE issues_projects (
    issue_id integer,
    project_id integer
);


ALTER TABLE issues_projects OWNER TO "redmine/instances/default";

--
-- Name: journal_details; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE journal_details (
    id integer NOT NULL,
    journal_id integer DEFAULT 0 NOT NULL,
    property character varying(30) DEFAULT ''::character varying NOT NULL,
    prop_key character varying(30) DEFAULT ''::character varying NOT NULL,
    old_value text,
    value text
);


ALTER TABLE journal_details OWNER TO "redmine/instances/default";

--
-- Name: journal_details_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE journal_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE journal_details_id_seq OWNER TO "redmine/instances/default";

--
-- Name: journal_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE journal_details_id_seq OWNED BY journal_details.id;


--
-- Name: journals; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE journals (
    id integer NOT NULL,
    journalized_id integer DEFAULT 0 NOT NULL,
    journalized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notes text,
    created_on timestamp without time zone NOT NULL,
    private_notes boolean DEFAULT false NOT NULL
);


ALTER TABLE journals OWNER TO "redmine/instances/default";

--
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE journals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE journals_id_seq OWNER TO "redmine/instances/default";

--
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE journals_id_seq OWNED BY journals.id;


--
-- Name: member_roles; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE member_roles (
    id integer NOT NULL,
    member_id integer NOT NULL,
    role_id integer NOT NULL,
    inherited_from integer
);


ALTER TABLE member_roles OWNER TO "redmine/instances/default";

--
-- Name: member_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE member_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE member_roles_id_seq OWNER TO "redmine/instances/default";

--
-- Name: member_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE member_roles_id_seq OWNED BY member_roles.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE members (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    mail_notification boolean DEFAULT false NOT NULL
);


ALTER TABLE members OWNER TO "redmine/instances/default";

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE members_id_seq OWNER TO "redmine/instances/default";

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE members_id_seq OWNED BY members.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE messages (
    id integer NOT NULL,
    board_id integer NOT NULL,
    parent_id integer,
    subject character varying DEFAULT ''::character varying NOT NULL,
    content text,
    author_id integer,
    replies_count integer DEFAULT 0 NOT NULL,
    last_reply_id integer,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    locked boolean DEFAULT false,
    sticky integer DEFAULT 0
);


ALTER TABLE messages OWNER TO "redmine/instances/default";

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messages_id_seq OWNER TO "redmine/instances/default";

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE news (
    id integer NOT NULL,
    project_id integer,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    summary character varying(255) DEFAULT ''::character varying,
    description text,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    comments_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE news OWNER TO "redmine/instances/default";

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE news_id_seq OWNER TO "redmine/instances/default";

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE news_id_seq OWNED BY news.id;


--
-- Name: open_id_authentication_associations; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE open_id_authentication_associations (
    id integer NOT NULL,
    issued integer,
    lifetime integer,
    handle character varying,
    assoc_type character varying,
    server_url bytea,
    secret bytea
);


ALTER TABLE open_id_authentication_associations OWNER TO "redmine/instances/default";

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE open_id_authentication_associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE open_id_authentication_associations_id_seq OWNER TO "redmine/instances/default";

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE open_id_authentication_associations_id_seq OWNED BY open_id_authentication_associations.id;


--
-- Name: open_id_authentication_nonces; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE open_id_authentication_nonces (
    id integer NOT NULL,
    "timestamp" integer NOT NULL,
    server_url character varying,
    salt character varying NOT NULL
);


ALTER TABLE open_id_authentication_nonces OWNER TO "redmine/instances/default";

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE open_id_authentication_nonces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE open_id_authentication_nonces_id_seq OWNER TO "redmine/instances/default";

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE open_id_authentication_nonces_id_seq OWNED BY open_id_authentication_nonces.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    homepage character varying DEFAULT ''::character varying,
    is_public boolean DEFAULT true NOT NULL,
    parent_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    identifier character varying,
    status integer DEFAULT 1 NOT NULL,
    lft integer,
    rgt integer,
    inherit_members boolean DEFAULT false NOT NULL,
    default_version_id integer
);


ALTER TABLE projects OWNER TO "redmine/instances/default";

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO "redmine/instances/default";

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: projects_trackers; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE projects_trackers (
    project_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE projects_trackers OWNER TO "redmine/instances/default";

--
-- Name: queries; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE queries (
    id integer NOT NULL,
    project_id integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    filters text,
    user_id integer DEFAULT 0 NOT NULL,
    column_names text,
    sort_criteria text,
    group_by character varying,
    type character varying,
    visibility integer DEFAULT 0,
    options text
);


ALTER TABLE queries OWNER TO "redmine/instances/default";

--
-- Name: queries_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE queries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE queries_id_seq OWNER TO "redmine/instances/default";

--
-- Name: queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE queries_id_seq OWNED BY queries.id;


--
-- Name: queries_roles; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE queries_roles (
    query_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE queries_roles OWNER TO "redmine/instances/default";

--
-- Name: repositories; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE repositories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    url character varying DEFAULT ''::character varying NOT NULL,
    login character varying(60) DEFAULT ''::character varying,
    password character varying DEFAULT ''::character varying,
    root_url character varying(255) DEFAULT ''::character varying,
    type character varying,
    path_encoding character varying(64),
    log_encoding character varying(64),
    extra_info text,
    identifier character varying,
    is_default boolean DEFAULT false,
    created_on timestamp without time zone
);


ALTER TABLE repositories OWNER TO "redmine/instances/default";

--
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE repositories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE repositories_id_seq OWNER TO "redmine/instances/default";

--
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE repositories_id_seq OWNED BY repositories.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    assignable boolean DEFAULT true,
    builtin integer DEFAULT 0 NOT NULL,
    permissions text,
    issues_visibility character varying(30) DEFAULT 'default'::character varying NOT NULL,
    users_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    time_entries_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    all_roles_managed boolean DEFAULT true NOT NULL,
    settings text
);


ALTER TABLE roles OWNER TO "redmine/instances/default";

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO "redmine/instances/default";

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: roles_managed_roles; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE roles_managed_roles (
    role_id integer NOT NULL,
    managed_role_id integer NOT NULL
);


ALTER TABLE roles_managed_roles OWNER TO "redmine/instances/default";

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "redmine/instances/default";

--
-- Name: settings; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE settings (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value text,
    updated_on timestamp without time zone
);


ALTER TABLE settings OWNER TO "redmine/instances/default";

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE settings_id_seq OWNER TO "redmine/instances/default";

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: time_entries; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE time_entries (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    issue_id integer,
    hours double precision NOT NULL,
    comments character varying(1024),
    activity_id integer NOT NULL,
    spent_on date NOT NULL,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE time_entries OWNER TO "redmine/instances/default";

--
-- Name: time_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE time_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE time_entries_id_seq OWNER TO "redmine/instances/default";

--
-- Name: time_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE time_entries_id_seq OWNED BY time_entries.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE tokens (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    action character varying(30) DEFAULT ''::character varying NOT NULL,
    value character varying(40) DEFAULT ''::character varying NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone
);


ALTER TABLE tokens OWNER TO "redmine/instances/default";

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tokens_id_seq OWNER TO "redmine/instances/default";

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE tokens_id_seq OWNED BY tokens.id;


--
-- Name: trackers; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE trackers (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_in_chlog boolean DEFAULT false NOT NULL,
    "position" integer,
    is_in_roadmap boolean DEFAULT true NOT NULL,
    fields_bits integer DEFAULT 0,
    default_status_id integer
);


ALTER TABLE trackers OWNER TO "redmine/instances/default";

--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trackers_id_seq OWNER TO "redmine/instances/default";

--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE trackers_id_seq OWNED BY trackers.id;


--
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE user_preferences (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    others text,
    hide_mail boolean DEFAULT true,
    time_zone character varying
);


ALTER TABLE user_preferences OWNER TO "redmine/instances/default";

--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_preferences_id_seq OWNER TO "redmine/instances/default";

--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE user_preferences_id_seq OWNED BY user_preferences.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE users (
    id integer NOT NULL,
    login character varying DEFAULT ''::character varying NOT NULL,
    hashed_password character varying(40) DEFAULT ''::character varying NOT NULL,
    firstname character varying(30) DEFAULT ''::character varying NOT NULL,
    lastname character varying(255) DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    last_login_on timestamp without time zone,
    language character varying(5) DEFAULT ''::character varying,
    auth_source_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    type character varying,
    identity_url character varying,
    mail_notification character varying DEFAULT ''::character varying NOT NULL,
    salt character varying(64),
    must_change_passwd boolean DEFAULT false NOT NULL,
    passwd_changed_on timestamp without time zone
);


ALTER TABLE users OWNER TO "redmine/instances/default";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "redmine/instances/default";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE versions (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying,
    effective_date date,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    wiki_page_title character varying,
    status character varying DEFAULT 'open'::character varying,
    sharing character varying DEFAULT 'none'::character varying NOT NULL
);


ALTER TABLE versions OWNER TO "redmine/instances/default";

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE versions_id_seq OWNER TO "redmine/instances/default";

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: watchers; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE watchers (
    id integer NOT NULL,
    watchable_type character varying DEFAULT ''::character varying NOT NULL,
    watchable_id integer DEFAULT 0 NOT NULL,
    user_id integer
);


ALTER TABLE watchers OWNER TO "redmine/instances/default";

--
-- Name: watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE watchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE watchers_id_seq OWNER TO "redmine/instances/default";

--
-- Name: watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE watchers_id_seq OWNED BY watchers.id;


--
-- Name: wiki_content_versions; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE wiki_content_versions (
    id integer NOT NULL,
    wiki_content_id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    data bytea,
    compression character varying(6) DEFAULT ''::character varying,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE wiki_content_versions OWNER TO "redmine/instances/default";

--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE wiki_content_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wiki_content_versions_id_seq OWNER TO "redmine/instances/default";

--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE wiki_content_versions_id_seq OWNED BY wiki_content_versions.id;


--
-- Name: wiki_contents; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE wiki_contents (
    id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    text text,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE wiki_contents OWNER TO "redmine/instances/default";

--
-- Name: wiki_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE wiki_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wiki_contents_id_seq OWNER TO "redmine/instances/default";

--
-- Name: wiki_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE wiki_contents_id_seq OWNED BY wiki_contents.id;


--
-- Name: wiki_pages; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE wiki_pages (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    parent_id integer
);


ALTER TABLE wiki_pages OWNER TO "redmine/instances/default";

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE wiki_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wiki_pages_id_seq OWNER TO "redmine/instances/default";

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE wiki_pages_id_seq OWNED BY wiki_pages.id;


--
-- Name: wiki_redirects; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE wiki_redirects (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying,
    redirects_to character varying,
    created_on timestamp without time zone NOT NULL,
    redirects_to_wiki_id integer NOT NULL
);


ALTER TABLE wiki_redirects OWNER TO "redmine/instances/default";

--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE wiki_redirects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wiki_redirects_id_seq OWNER TO "redmine/instances/default";

--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE wiki_redirects_id_seq OWNED BY wiki_redirects.id;


--
-- Name: wikis; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE wikis (
    id integer NOT NULL,
    project_id integer NOT NULL,
    start_page character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE wikis OWNER TO "redmine/instances/default";

--
-- Name: wikis_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE wikis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wikis_id_seq OWNER TO "redmine/instances/default";

--
-- Name: wikis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE wikis_id_seq OWNED BY wikis.id;


--
-- Name: workflows; Type: TABLE; Schema: public; Owner: redmine/instances/default
--

CREATE TABLE workflows (
    id integer NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL,
    old_status_id integer DEFAULT 0 NOT NULL,
    new_status_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    assignee boolean DEFAULT false NOT NULL,
    author boolean DEFAULT false NOT NULL,
    type character varying(30),
    field_name character varying(30),
    rule character varying(30)
);


ALTER TABLE workflows OWNER TO "redmine/instances/default";

--
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine/instances/default
--

CREATE SEQUENCE workflows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workflows_id_seq OWNER TO "redmine/instances/default";

--
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine/instances/default
--

ALTER SEQUENCE workflows_id_seq OWNED BY workflows.id;


--
-- Name: agile_colors id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY agile_colors ALTER COLUMN id SET DEFAULT nextval('agile_colors_id_seq'::regclass);


--
-- Name: agile_data id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY agile_data ALTER COLUMN id SET DEFAULT nextval('agile_data_id_seq'::regclass);


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- Name: auth_sources id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY auth_sources ALTER COLUMN id SET DEFAULT nextval('auth_sources_id_seq'::regclass);


--
-- Name: boards id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY boards ALTER COLUMN id SET DEFAULT nextval('boards_id_seq'::regclass);


--
-- Name: changes id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY changes ALTER COLUMN id SET DEFAULT nextval('changes_id_seq'::regclass);


--
-- Name: changesets id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY changesets ALTER COLUMN id SET DEFAULT nextval('changesets_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: custom_field_enumerations id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY custom_field_enumerations ALTER COLUMN id SET DEFAULT nextval('custom_field_enumerations_id_seq'::regclass);


--
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY custom_fields ALTER COLUMN id SET DEFAULT nextval('custom_fields_id_seq'::regclass);


--
-- Name: custom_values id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY custom_values ALTER COLUMN id SET DEFAULT nextval('custom_values_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: email_addresses id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY email_addresses ALTER COLUMN id SET DEFAULT nextval('email_addresses_id_seq'::regclass);


--
-- Name: enabled_modules id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY enabled_modules ALTER COLUMN id SET DEFAULT nextval('enabled_modules_id_seq'::regclass);


--
-- Name: enumerations id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY enumerations ALTER COLUMN id SET DEFAULT nextval('enumerations_id_seq'::regclass);


--
-- Name: import_items id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY import_items ALTER COLUMN id SET DEFAULT nextval('import_items_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY imports ALTER COLUMN id SET DEFAULT nextval('imports_id_seq'::regclass);


--
-- Name: issue_categories id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY issue_categories ALTER COLUMN id SET DEFAULT nextval('issue_categories_id_seq'::regclass);


--
-- Name: issue_relations id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY issue_relations ALTER COLUMN id SET DEFAULT nextval('issue_relations_id_seq'::regclass);


--
-- Name: issue_statuses id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY issue_statuses ALTER COLUMN id SET DEFAULT nextval('issue_statuses_id_seq'::regclass);


--
-- Name: issues id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY issues ALTER COLUMN id SET DEFAULT nextval('issues_id_seq'::regclass);


--
-- Name: journal_details id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY journal_details ALTER COLUMN id SET DEFAULT nextval('journal_details_id_seq'::regclass);


--
-- Name: journals id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY journals ALTER COLUMN id SET DEFAULT nextval('journals_id_seq'::regclass);


--
-- Name: member_roles id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY member_roles ALTER COLUMN id SET DEFAULT nextval('member_roles_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


--
-- Name: open_id_authentication_associations id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY open_id_authentication_associations ALTER COLUMN id SET DEFAULT nextval('open_id_authentication_associations_id_seq'::regclass);


--
-- Name: open_id_authentication_nonces id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY open_id_authentication_nonces ALTER COLUMN id SET DEFAULT nextval('open_id_authentication_nonces_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: queries id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY queries ALTER COLUMN id SET DEFAULT nextval('queries_id_seq'::regclass);


--
-- Name: repositories id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY repositories ALTER COLUMN id SET DEFAULT nextval('repositories_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: time_entries id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY time_entries ALTER COLUMN id SET DEFAULT nextval('time_entries_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY tokens ALTER COLUMN id SET DEFAULT nextval('tokens_id_seq'::regclass);


--
-- Name: trackers id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY trackers ALTER COLUMN id SET DEFAULT nextval('trackers_id_seq'::regclass);


--
-- Name: user_preferences id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY user_preferences ALTER COLUMN id SET DEFAULT nextval('user_preferences_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: watchers id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY watchers ALTER COLUMN id SET DEFAULT nextval('watchers_id_seq'::regclass);


--
-- Name: wiki_content_versions id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY wiki_content_versions ALTER COLUMN id SET DEFAULT nextval('wiki_content_versions_id_seq'::regclass);


--
-- Name: wiki_contents id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY wiki_contents ALTER COLUMN id SET DEFAULT nextval('wiki_contents_id_seq'::regclass);


--
-- Name: wiki_pages id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY wiki_pages ALTER COLUMN id SET DEFAULT nextval('wiki_pages_id_seq'::regclass);


--
-- Name: wiki_redirects id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY wiki_redirects ALTER COLUMN id SET DEFAULT nextval('wiki_redirects_id_seq'::regclass);


--
-- Name: wikis id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY wikis ALTER COLUMN id SET DEFAULT nextval('wikis_id_seq'::regclass);


--
-- Name: workflows id; Type: DEFAULT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY workflows ALTER COLUMN id SET DEFAULT nextval('workflows_id_seq'::regclass);


--
-- Data for Name: agile_colors; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY agile_colors (id, container_id, container_type, color) FROM stdin;
\.


--
-- Name: agile_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('agile_colors_id_seq', 1, false);


--
-- Data for Name: agile_data; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY agile_data (id, issue_id, "position", story_points) FROM stdin;
8	10	0	\N
10	18	0	\N
12	23	1	\N
9	14	5	\N
11	17	0	\N
\.


--
-- Name: agile_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('agile_data_id_seq', 12, true);


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) FROM stdin;
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('attachments_id_seq', 1, false);


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY auth_sources (id, type, name, host, port, account, account_password, base_dn, attr_login, attr_firstname, attr_lastname, attr_mail, onthefly_register, tls, filter, timeout) FROM stdin;
\.


--
-- Name: auth_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('auth_sources_id_seq', 1, false);


--
-- Data for Name: boards; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY boards (id, project_id, name, description, "position", topics_count, messages_count, last_message_id, parent_id) FROM stdin;
\.


--
-- Name: boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('boards_id_seq', 1, false);


--
-- Data for Name: changes; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY changes (id, changeset_id, action, path, from_path, from_revision, revision, branch) FROM stdin;
\.


--
-- Name: changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('changes_id_seq', 1, false);


--
-- Data for Name: changeset_parents; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY changeset_parents (changeset_id, parent_id) FROM stdin;
\.


--
-- Data for Name: changesets; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY changesets (id, repository_id, revision, committer, committed_on, comments, commit_date, scmid, user_id) FROM stdin;
\.


--
-- Name: changesets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('changesets_id_seq', 1, false);


--
-- Data for Name: changesets_issues; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY changesets_issues (changeset_id, issue_id) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY comments (id, commented_type, commented_id, author_id, comments, created_on, updated_on) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Data for Name: custom_field_enumerations; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY custom_field_enumerations (id, custom_field_id, name, active, "position") FROM stdin;
\.


--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('custom_field_enumerations_id_seq', 1, false);


--
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY custom_fields (id, type, name, field_format, possible_values, regexp, min_length, max_length, is_required, is_for_all, is_filter, "position", searchable, default_value, editable, visible, multiple, format_store, description) FROM stdin;
2	IssueCustomField	Points	list	---\n- To be defined\n- '1'\n- '2'\n- '3'\n- '5'\n- '8'\n- '13'\n- '21'\n- '34'\n		\N	\N	t	t	f	3	f	To be defined	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	Estimed points cost for this story
1	IssueCustomField	Risk Assessment	list	---\n- To be defined\n- Low\n- Medium\n- High\n		\N	\N	t	t	f	2	f	To be defined	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	Risk Assessement
9	IssueCustomField	Support Ref	string	\N		\N	\N	f	t	f	5	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
4	IssueCustomField	Developer Comments	text	\N		\N	\N	f	t	f	7	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\n	
5	IssueCustomField	Reviewer Comments	text	\N		\N	\N	f	t	f	8	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\n	
6	IssueCustomField	Testers Comments	text	\N		\N	\N	f	t	f	9	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\n	
3	IssueCustomField	Acceptance Criteria	text	\N		\N	\N	f	t	f	6	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: full\n	
8	IssueCustomField	Spike Notes	text	\N		\N	\N	f	t	f	10	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\n	
10	IssueCustomField	Sprint Number	string	\N		\N	\N	f	t	t	4	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
7	IssueCustomField	Software module	list	---\n- PV-Works (Human)\n- PV-Works (Vet)\n- PV-Admin (Human)\n- PV-Works (Vet)\n- PV-Entry\n- PV-Analyser\n- PV-Express\n- PV-Admin (Web)\n- PV-Reporter (Web)\n		\N	\N	f	t	t	1	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	The software to change
\.


--
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('custom_fields_id_seq', 10, true);


--
-- Data for Name: custom_fields_projects; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY custom_fields_projects (custom_field_id, project_id) FROM stdin;
\.


--
-- Data for Name: custom_fields_roles; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY custom_fields_roles (custom_field_id, role_id) FROM stdin;
\.


--
-- Data for Name: custom_fields_trackers; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY custom_fields_trackers (custom_field_id, tracker_id) FROM stdin;
1	1
1	2
2	1
2	2
2	3
3	1
3	2
4	1
4	2
5	1
5	2
6	1
6	2
7	1
7	2
7	3
8	3
9	1
9	2
9	3
10	1
10	2
10	3
6	4
7	4
2	4
10	4
\.


--
-- Data for Name: custom_values; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY custom_values (id, customized_type, customized_id, custom_field_id, value) FROM stdin;
89	Issue	20	7	
90	Issue	20	1	To be defined
91	Issue	20	2	To be defined
92	Issue	20	10	
93	Issue	20	9	
94	Issue	20	3	
95	Issue	20	4	
96	Issue	20	5	
97	Issue	20	6	
98	Issue	21	7	
99	Issue	21	1	To be defined
100	Issue	21	2	To be defined
101	Issue	21	10	
102	Issue	21	9	
103	Issue	21	3	
104	Issue	21	4	
105	Issue	21	5	
18	Issue	10	3	
19	Issue	10	4	
20	Issue	10	5	
21	Issue	10	6	
106	Issue	21	6	
107	Issue	22	7	
108	Issue	22	2	To be defined
109	Issue	22	10	
110	Issue	22	9	
111	Issue	22	8	
112	Issue	23	6	
114	Issue	23	2	To be defined
113	Issue	23	7	PV-Entry
115	Issue	23	10	36
16	Issue	10	1	Low
17	Issue	10	2	3
45	Issue	14	8	
44	Issue	14	2	2
43	Issue	14	7	PV-Entry
47	Issue	15	1	To be defined
48	Issue	15	2	To be defined
49	Issue	15	3	
50	Issue	15	4	
51	Issue	15	5	
52	Issue	15	6	
54	Issue	16	1	To be defined
55	Issue	16	2	To be defined
56	Issue	16	3	
57	Issue	16	4	
58	Issue	16	5	
59	Issue	16	6	
53	Issue	16	7	PV-Entry
46	Issue	15	7	PV-Admin (Web)
60	Issue	17	7	
61	Issue	17	1	To be defined
62	Issue	17	2	To be defined
63	Issue	17	10	
64	Issue	17	9	
65	Issue	17	3	
66	Issue	17	4	
67	Issue	17	5	
68	Issue	17	6	
69	Issue	10	10	
70	Issue	10	9	
15	Issue	10	7	PV-Works (Human)
74	Issue	18	10	
75	Issue	18	9	
76	Issue	18	3	
77	Issue	18	4	
78	Issue	18	5	
79	Issue	18	6	
71	Issue	18	7	PV-Entry
72	Issue	18	1	Medium
73	Issue	18	2	5
\.


--
-- Name: custom_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('custom_values_id_seq', 115, true);


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY documents (id, project_id, category_id, title, description, created_on) FROM stdin;
\.


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('documents_id_seq', 1, false);


--
-- Data for Name: email_addresses; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY email_addresses (id, user_id, address, is_default, notify, created_on, updated_on) FROM stdin;
1	1	admin@example.net	t	t	2017-10-26 17:23:04.578585	2017-10-26 17:23:04.578585
2	5	gdibella@ennov.com	t	t	2017-11-01 12:47:21.477158	2017-11-01 12:48:42.497708
3	6	pwilliams@ennov.com	t	t	2017-11-01 12:49:18.774063	2017-11-01 12:49:18.774063
4	10	mrawling@ennov.com	t	t	2017-11-02 10:37:37.176549	2017-11-02 10:37:37.176549
5	11	npillinger@ennov.com	t	t	2017-11-02 10:38:16.548693	2017-11-02 10:38:16.548693
6	12	tpickman@ennov.com	t	t	2017-11-02 11:38:29.02874	2017-11-02 11:38:29.02874
7	13	npickering@ennov.com	t	t	2017-11-02 11:40:29.280108	2017-11-02 11:40:29.280108
8	14	aqarshi@ennov.com	t	t	2017-11-02 11:41:43.926113	2017-11-02 11:41:43.926113
9	15	msek@ennov.com	t	t	2017-11-02 11:42:19.733497	2017-11-02 11:42:19.733497
10	16	garthur@ennov.com	t	t	2017-11-02 11:42:58.58786	2017-11-02 11:42:58.58786
11	19	sstankiewicz@ennov.com	t	t	2017-11-02 11:47:43.598323	2017-11-02 11:47:43.598323
12	20	smadej@ennov.com	t	t	2017-11-02 11:48:10.99303	2017-11-02 11:48:10.99303
13	21	pmillington@ennov.com	t	t	2017-11-02 11:48:49.567238	2017-11-02 11:48:49.567238
14	22	lpotts@ennov.com	t	t	2017-11-02 11:49:17.84158	2017-11-02 11:49:17.84158
15	23	cadudodla@ennov.com	t	t	2017-11-02 11:49:39.880489	2017-11-02 11:49:39.880489
16	24	dulava@ennov.com	t	t	2017-11-02 11:50:24.126911	2017-11-02 11:50:24.126911
17	25	agreen@ennov.com	t	t	2017-11-02 11:51:15.292367	2017-11-02 11:51:15.292367
18	26	stajan@ennov.com	t	t	2017-11-03 10:08:55.658527	2017-11-03 10:08:55.658527
\.


--
-- Name: email_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('email_addresses_id_seq', 18, true);


--
-- Data for Name: enabled_modules; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY enabled_modules (id, project_id, name) FROM stdin;
174	21	issue_tracking
175	21	documents
176	21	files
177	21	repository
132	13	issue_tracking
140	15	issue_tracking
141	15	documents
142	15	files
143	15	repository
146	15	agile
147	16	issue_tracking
148	16	documents
149	16	files
150	16	repository
153	17	issue_tracking
154	17	documents
155	17	files
156	17	repository
159	17	agile
160	16	agile
161	18	issue_tracking
162	18	documents
163	18	files
164	18	repository
165	19	issue_tracking
166	19	documents
167	19	files
168	19	repository
169	20	issue_tracking
170	20	documents
171	20	files
172	20	repository
173	20	agile
103	10	issue_tracking
\.


--
-- Name: enabled_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('enabled_modules_id_seq', 177, true);


--
-- Data for Name: enumerations; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) FROM stdin;
1	Low	1	f	IssuePriority	t	\N	\N	lowest
2	Normal	2	t	IssuePriority	t	\N	\N	default
3	High	3	f	IssuePriority	t	\N	\N	high3
4	Urgent	4	f	IssuePriority	t	\N	\N	high2
5	Immediate	5	f	IssuePriority	t	\N	\N	highest
6	User documentation	1	f	DocumentCategory	t	\N	\N	\N
7	Technical documentation	2	f	DocumentCategory	t	\N	\N	\N
8	Design	1	f	TimeEntryActivity	t	\N	\N	\N
9	Development	2	f	TimeEntryActivity	t	\N	\N	\N
\.


--
-- Name: enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('enumerations_id_seq', 9, true);


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY groups_users (group_id, user_id) FROM stdin;
8	6
9	6
7	10
9	11
8	12
8	5
8	13
8	14
8	15
8	16
17	13
17	15
17	16
8	19
8	20
7	21
7	22
7	23
7	24
17	19
17	20
18	5
18	12
18	14
\.


--
-- Data for Name: import_items; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY import_items (id, import_id, "position", obj_id, message) FROM stdin;
\.


--
-- Name: import_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('import_items_id_seq', 1, false);


--
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY imports (id, type, user_id, filename, settings, total_items, finished, created_at, updated_at) FROM stdin;
\.


--
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('imports_id_seq', 1, false);


--
-- Data for Name: issue_categories; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY issue_categories (id, project_id, name, assigned_to_id) FROM stdin;
2	17	cat1	\N
\.


--
-- Name: issue_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('issue_categories_id_seq', 2, true);


--
-- Data for Name: issue_relations; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY issue_relations (id, issue_from_id, issue_to_id, relation_type, delay) FROM stdin;
\.


--
-- Name: issue_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('issue_relations_id_seq', 1, false);


--
-- Data for Name: issue_statuses; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY issue_statuses (id, name, is_closed, "position", default_done_ratio) FROM stdin;
2	Ready	f	2	\N
3	Development	f	3	\N
4	Code Review	f	4	\N
5	Test	f	5	\N
6	Done	t	6	\N
1	Intake	f	1	\N
\.


--
-- Name: issue_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('issue_statuses_id_seq', 7, true);


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on, answers_on_secondary_projects) FROM stdin;
16	1	10	bug 789	bug 789	\N	\N	1	\N	2	\N	6	3	2017-11-02 12:35:38.32478	2017-11-02 12:39:45.960139	\N	0	\N	\N	16	1	2	f	\N	t
15	1	10	Bug 1232	some bug	\N	\N	1	\N	2	\N	6	2	2017-11-02 12:35:17.790946	2017-11-02 12:40:04.682346	\N	0	\N	\N	15	1	2	f	\N	t
14	3	17	Determine mechanism for export	investigate problem A	\N	\N	2	6	2	\N	6	11	2017-11-02 12:08:41.86972	2017-11-02 16:01:23.439365	\N	0	\N	\N	14	1	2	f	\N	t
18	2	17	Add auto narratives	auto narratives	\N	\N	2	15	2	\N	6	1	2017-11-02 16:46:04.193753	2017-11-02 16:46:17.672754	\N	0	\N	\N	18	1	2	f	\N	t
10	1	17	Call history AV	do this, do that, do the other	\N	\N	3	13	2	\N	6	8	2017-11-01 16:23:19.193313	2017-11-06 11:05:40.443746	\N	0	\N	\N	10	1	2	f	\N	t
20	1	13	add new reporter searc		\N	\N	1	\N	2	\N	6	0	2017-11-06 11:07:09.235606	2017-11-06 11:07:09.235606	\N	0	\N	\N	20	1	2	f	\N	t
21	1	19	fix search columns		\N	\N	1	\N	2	\N	6	1	2017-11-06 11:07:22.369622	2017-11-06 11:07:36.620078	\N	0	\N	\N	21	1	2	f	\N	t
22	3	18	investigate search performance		\N	\N	1	\N	2	\N	6	1	2017-11-06 11:09:01.009079	2017-11-06 11:09:57.764263	\N	0	\N	\N	22	1	2	f	\N	t
17	1	17	sdfsdfssf		\N	\N	1	\N	2	\N	6	3	2017-11-02 16:35:10.803364	2017-11-06 17:30:47.978642	\N	0	\N	\N	17	1	2	f	\N	t
23	4	17	auto test for assessment		\N	\N	3	24	2	\N	6	7	2017-11-06 17:26:33.18841	2017-11-06 17:32:56.556316	2017-11-06	0	\N	\N	23	1	2	f	\N	t
\.


--
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('issues_id_seq', 23, true);


--
-- Data for Name: issues_projects; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY issues_projects (issue_id, project_id) FROM stdin;
\.


--
-- Data for Name: journal_details; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY journal_details (id, journal_id, property, prop_key, old_value, value) FROM stdin;
28	26	attr	project_id	10	13
49	47	attr	project_id	13	17
50	48	attr	status_id	1	2
51	49	cf	1	To be defined	Low
52	49	cf	2	To be defined	3
53	50	attr	status_id	1	2
54	51	attr	status_id	2	3
55	52	attr	subject	Error adding blah	Call history AV
56	53	attr	subject	spike A	Determine mechanism for export
57	54	cf	2	To be defined	2
58	55	attr	assigned_to_id	\N	13
59	56	cf	7		PV-Entry
60	57	attr	project_id	10	18
61	58	attr	project_id	10	19
62	58	cf	7	PV-Entry	PV-Admin (Web)
63	59	attr	project_id	18	10
64	60	attr	project_id	19	10
65	61	attr	status_id	3	4
66	62	attr	status_id	4	5
67	63	attr	status_id	5	3
68	64	attr	status_id	3	4
69	65	attr	status_id	4	3
70	66	attr	status_id	3	2
71	67	cf	7	PV-Entry	PV-Works (Human)
72	68	attr	status_id	1	2
73	69	attr	project_id	21	17
74	69	attr	fixed_version_id	1	\N
75	70	attr	status_id	2	3
76	71	attr	project_id	13	19
77	72	attr	project_id	13	18
78	73	attr	assigned_to_id	\N	24
79	74	attr	status_id	1	2
80	75	attr	status_id	2	3
81	76	attr	status_id	3	5
82	77	attr	status_id	5	3
83	78	attr	status_id	1	2
84	79	attr	status_id	2	1
85	80	cf	7		PV-Entry
86	80	cf	10		36
\.


--
-- Name: journal_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('journal_details_id_seq', 86, true);


--
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) FROM stdin;
26	10	Issue	6		2017-11-01 16:24:09.628344	f
47	10	Issue	6		2017-11-01 16:53:20.450714	f
48	10	Issue	6		2017-11-02 11:26:26.366663	f
49	10	Issue	6		2017-11-02 11:26:47.771347	f
50	14	Issue	6		2017-11-02 12:08:56.896876	f
51	14	Issue	6		2017-11-02 12:09:00.3712	f
52	10	Issue	6		2017-11-02 12:09:29.105252	f
53	14	Issue	6		2017-11-02 12:09:54.736159	f
54	14	Issue	6		2017-11-02 12:10:11.450918	f
55	10	Issue	6		2017-11-02 12:10:45.200063	f
56	14	Issue	6		2017-11-02 12:11:42.296275	f
57	16	Issue	6		2017-11-02 12:36:10.136991	f
58	15	Issue	6		2017-11-02 12:37:44.909728	f
59	16	Issue	6		2017-11-02 12:39:04.549145	f
60	15	Issue	6		2017-11-02 12:40:04.695627	f
61	14	Issue	6		2017-11-02 12:50:26.796243	f
62	14	Issue	6		2017-11-02 12:50:28.005051	f
63	14	Issue	6		2017-11-02 12:50:34.312064	f
64	14	Issue	6		2017-11-02 16:01:08.069054	f
65	14	Issue	6		2017-11-02 16:01:10.891442	f
66	14	Issue	6		2017-11-02 16:01:23.445675	f
67	10	Issue	6		2017-11-02 16:36:07.703053	f
68	18	Issue	6		2017-11-02 16:46:17.683629	f
69	17	Issue	6		2017-11-02 16:53:32.520091	f
70	10	Issue	6		2017-11-06 11:05:40.454908	f
71	21	Issue	6		2017-11-06 11:07:36.633294	f
72	22	Issue	6		2017-11-06 11:09:57.774784	f
73	23	Issue	6	\N	2017-11-06 17:27:56.625641	f
74	23	Issue	6		2017-11-06 17:30:31.303522	f
75	23	Issue	6		2017-11-06 17:30:34.877925	f
76	23	Issue	6		2017-11-06 17:30:39.359774	f
77	23	Issue	6		2017-11-06 17:30:41.375227	f
78	17	Issue	6		2017-11-06 17:30:45.066767	f
79	17	Issue	6		2017-11-06 17:30:47.989252	f
80	23	Issue	6		2017-11-06 17:32:56.570617	f
\.


--
-- Name: journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('journals_id_seq', 80, true);


--
-- Data for Name: member_roles; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY member_roles (id, member_id, role_id, inherited_from) FROM stdin;
7	6	4	\N
8	7	4	7
9	8	5	\N
10	9	3	\N
11	7	3	10
12	10	5	9
13	11	3	10
16	14	5	\N
17	15	5	16
18	16	3	\N
19	13	3	18
20	17	3	18
23	20	5	\N
24	21	5	23
25	22	3	\N
26	19	3	25
27	23	3	25
30	26	5	\N
31	27	5	30
32	28	3	\N
33	25	3	32
34	29	3	32
35	30	4	7
39	34	4	7
43	38	4	7
47	42	4	7
51	46	4	7
55	50	4	7
59	54	4	7
63	58	4	7
67	62	5	9
68	63	5	16
69	64	5	23
70	65	5	30
71	66	5	9
72	67	5	16
73	68	5	23
74	69	5	30
75	70	5	9
76	71	5	16
77	72	5	23
78	73	5	30
79	74	5	9
80	75	5	16
81	76	5	23
82	77	5	30
83	78	4	\N
84	79	4	83
85	80	4	83
86	81	4	83
87	82	4	\N
88	83	4	87
89	84	4	87
90	85	4	87
91	86	4	87
92	87	4	87
93	88	4	\N
94	89	4	93
95	90	4	93
96	91	4	93
97	92	4	93
98	93	4	93
112	107	3	26
113	108	5	23
114	109	5	24
115	110	3	25
116	111	3	27
117	112	5	69
118	113	5	73
119	114	5	77
120	115	5	81
121	116	4	83
122	117	4	84
123	118	4	85
124	119	4	86
\.


--
-- Name: member_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('member_roles_id_seq', 124, true);


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY members (id, user_id, project_id, created_on, mail_notification) FROM stdin;
6	8	13	2017-11-01 16:16:41.734314	f
7	6	13	2017-11-01 16:16:41.753611	f
8	7	13	2017-11-01 16:16:47.913591	f
9	9	13	2017-11-01 16:16:57.358927	f
10	10	13	2017-11-02 10:37:46.719222	f
11	11	13	2017-11-02 10:38:25.239635	f
13	6	17	2017-11-02 10:40:04.113239	f
14	7	17	2017-11-02 10:40:13.000353	f
15	10	17	2017-11-02 10:40:13.010189	f
16	9	17	2017-11-02 10:40:22.027961	f
17	11	17	2017-11-02 10:40:22.044836	f
19	6	16	2017-11-02 10:42:55.760925	f
20	7	16	2017-11-02 10:43:01.380105	f
21	10	16	2017-11-02 10:43:01.389404	f
22	9	16	2017-11-02 10:51:06.172181	f
23	11	16	2017-11-02 10:51:06.189856	f
25	6	15	2017-11-02 10:51:20.002977	f
26	7	15	2017-11-02 10:51:25.434746	f
27	10	15	2017-11-02 10:51:25.444451	f
28	9	15	2017-11-02 10:51:36.469355	f
29	11	15	2017-11-02 10:51:36.486305	f
30	12	13	2017-11-02 11:38:39.634035	f
34	5	13	2017-11-02 11:39:05.703401	f
38	13	13	2017-11-02 11:40:33.845366	f
42	14	13	2017-11-02 11:41:46.806108	f
46	15	13	2017-11-02 11:42:29.439442	f
50	16	13	2017-11-02 11:43:02.327329	f
54	19	13	2017-11-02 11:51:33.355994	f
58	20	13	2017-11-02 11:51:33.399258	f
62	21	13	2017-11-02 11:51:53.308893	f
63	21	17	2017-11-02 11:51:53.319284	f
64	21	16	2017-11-02 11:51:53.329376	f
65	21	15	2017-11-02 11:51:53.339587	f
66	22	13	2017-11-02 11:51:53.350354	f
67	22	17	2017-11-02 11:51:53.358235	f
68	22	16	2017-11-02 11:51:53.366148	f
69	22	15	2017-11-02 11:51:53.374177	f
70	23	13	2017-11-02 11:51:53.384858	f
71	23	17	2017-11-02 11:51:53.393099	f
72	23	16	2017-11-02 11:51:53.401212	f
73	23	15	2017-11-02 11:51:53.409279	f
74	24	13	2017-11-02 11:51:53.420026	f
75	24	17	2017-11-02 11:51:53.427918	f
76	24	16	2017-11-02 11:51:53.435918	f
77	24	15	2017-11-02 11:51:53.443986	f
78	18	16	2017-11-02 11:59:33.198423	f
79	5	16	2017-11-02 11:59:33.207764	f
80	12	16	2017-11-02 11:59:33.216078	f
81	14	16	2017-11-02 11:59:33.224038	f
82	17	15	2017-11-02 12:00:02.288664	f
83	13	15	2017-11-02 12:00:02.297852	f
84	15	15	2017-11-02 12:00:02.305977	f
85	16	15	2017-11-02 12:00:02.314105	f
86	19	15	2017-11-02 12:00:02.322168	f
87	20	15	2017-11-02 12:00:02.330067	f
88	17	17	2017-11-02 12:15:24.296084	f
89	13	17	2017-11-02 12:15:24.306091	f
90	15	17	2017-11-02 12:15:24.314561	f
91	16	17	2017-11-02 12:15:24.32274	f
92	19	17	2017-11-02 12:15:24.330897	f
93	20	17	2017-11-02 12:15:24.339019	f
107	6	20	2017-11-02 12:40:48.173488	f
108	7	20	2017-11-02 12:40:48.182078	f
109	10	20	2017-11-02 12:40:48.19035	f
110	9	20	2017-11-02 12:40:48.199683	f
111	11	20	2017-11-02 12:40:48.208142	f
112	21	20	2017-11-02 12:40:48.216613	f
113	22	20	2017-11-02 12:40:48.22511	f
114	23	20	2017-11-02 12:40:48.233449	f
115	24	20	2017-11-02 12:40:48.241979	f
116	18	20	2017-11-02 12:40:48.250652	f
117	5	20	2017-11-02 12:40:48.258979	f
118	12	20	2017-11-02 12:40:48.267261	f
119	14	20	2017-11-02 12:40:48.275554	f
\.


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('members_id_seq', 119, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY messages (id, board_id, parent_id, subject, content, author_id, replies_count, last_reply_id, created_on, updated_on, locked, sticky) FROM stdin;
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('messages_id_seq', 1, false);


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY news (id, project_id, title, summary, description, author_id, created_on, comments_count) FROM stdin;
\.


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('news_id_seq', 1, false);


--
-- Data for Name: open_id_authentication_associations; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY open_id_authentication_associations (id, issued, lifetime, handle, assoc_type, server_url, secret) FROM stdin;
\.


--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('open_id_authentication_associations_id_seq', 1, false);


--
-- Data for Name: open_id_authentication_nonces; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY open_id_authentication_nonces (id, "timestamp", server_url, salt) FROM stdin;
\.


--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('open_id_authentication_nonces_id_seq', 1, false);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members, default_version_id) FROM stdin;
18	PV-Entry Backlog			f	13	2017-11-02 12:34:13.477076	2017-11-02 12:34:13.477076	pv-entry-backlog	1	4	5	f	\N
19	PV-Admin Web Backlog			f	13	2017-11-02 12:36:50.907277	2017-11-02 12:42:04.107192	pv-admin-web	1	2	3	f	\N
13	Backlog	All items on the backlog		f	\N	2017-11-01 16:15:24.180132	2017-11-02 16:06:11.581735	backlog	1	1	6	f	\N
10	Intake	New items to be approved		f	\N	2017-11-01 13:17:03.087593	2017-11-02 16:06:26.774759	intake	1	7	8	f	\N
20	Victor5			f	16	2017-11-02 12:40:47.929987	2017-11-02 12:40:47.929987	victor5	1	12	13	t	\N
16	Sprints Victor	Parent project for Victor sprints		f	\N	2017-11-01 16:49:26.736194	2017-11-02 16:06:34.335866	sprints-victor	1	11	14	f	\N
15	Sprints Vulcan	Parent project for Vulcan sprints		f	\N	2017-11-01 16:48:52.174146	2017-11-02 16:06:43.05523	sprints-vulcan	1	15	18	f	\N
17	Vulcan36			f	15	2017-11-01 16:51:09.934914	2017-11-02 16:06:53.559004	vulcan36	1	16	17	f	\N
21	PV-Admin Web			f	\N	2017-11-02 16:32:00.055488	2017-11-02 16:32:00.055488	pv-admin-web-prj	1	9	10	f	\N
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('projects_id_seq', 21, true);


--
-- Data for Name: projects_trackers; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY projects_trackers (project_id, tracker_id) FROM stdin;
10	1
10	2
10	3
13	1
13	2
13	3
15	1
15	2
15	3
16	1
16	2
16	3
17	1
17	2
17	3
18	1
18	2
18	3
19	1
19	2
19	3
20	1
20	2
20	3
21	1
21	2
21	3
13	4
19	4
18	4
10	4
21	4
16	4
20	4
15	4
17	4
\.


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY queries (id, project_id, name, filters, user_id, column_names, sort_criteria, group_by, type, visibility, options) FROM stdin;
\.


--
-- Name: queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('queries_id_seq', 1, false);


--
-- Data for Name: queries_roles; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY queries_roles (query_id, role_id) FROM stdin;
\.


--
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY repositories (id, project_id, url, login, password, root_url, type, path_encoding, log_encoding, extra_info, identifier, is_default, created_on) FROM stdin;
\.


--
-- Name: repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('repositories_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY roles (id, name, "position", assignable, builtin, permissions, issues_visibility, users_visibility, time_entries_visibility, all_roles_managed, settings) FROM stdin;
3	Manager	1	t	0	---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :view_issues\n- :add_issues\n- :edit_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :manage_public_queries\n- :save_queries\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :manage_news\n- :comment_news\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n- :manage_wiki\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :manage_boards\n- :view_calendar\n- :view_gantt\n	all	all	all	t	\N
4	Developer	2	t	0	---\n- :manage_versions\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :view_private_notes\n- :set_notes_private\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :manage_files\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n	default	all	all	t	\N
5	Tester	3	t	0	---\n- :add_messages\n- :edit_own_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :log_time\n- :view_wiki_pages\n- :view_wiki_edits\n	default	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
1	Non member	0	t	1	\N	default	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '0'\n  add_issues: '0'\n  edit_issues: '1'\n  add_issue_notes: '0'\n  delete_issues: '0'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
2	Anonymous	0	t	2	\N	default	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('roles_id_seq', 5, true);


--
-- Data for Name: roles_managed_roles; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY roles_managed_roles (role_id, managed_role_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY schema_migrations (version) FROM stdin;
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
20090214190337
20090312172426
20090312194159
20090318181151
20090323224724
20090401221305
20090401231134
20090403001910
20090406161854
20090425161243
20090503121501
20090503121505
20090503121510
20090614091200
20090704172350
20090704172355
20090704172358
20091010093521
20091017212227
20091017212457
20091017212644
20091017212938
20091017213027
20091017213113
20091017213151
20091017213228
20091017213257
20091017213332
20091017213444
20091017213536
20091017213642
20091017213716
20091017213757
20091017213835
20091017213910
20091017214015
20091017214107
20091017214136
20091017214236
20091017214308
20091017214336
20091017214406
20091017214440
20091017214519
20091017214611
20091017214644
20091017214720
20091017214750
20091025163651
20091108092559
20091114105931
20091123212029
20091205124427
20091220183509
20091220183727
20091220184736
20091225164732
20091227112908
20100129193402
20100129193813
20100221100219
20100313132032
20100313171051
20100705164950
20100819172912
20101104182107
20101107130441
20101114115114
20101114115359
20110220160626
20110223180944
20110223180953
20110224000000
20110226120112
20110226120132
20110227125750
20110228000000
20110228000100
20110401192910
20110408103312
20110412065600
20110511000000
20110902000000
20111201201315
20120115143024
20120115143100
20120115143126
20120127174243
20120205111326
20120223110929
20120301153455
20120422150750
20120705074331
20120707064544
20120714122000
20120714122100
20120714122200
20120731164049
20120930112914
20121026002032
20121026003537
20121209123234
20121209123358
20121213084931
20130110122628
20130201184705
20130202090625
20130207175206
20130207181455
20130215073721
20130215111127
20130215111141
20130217094251
20130602092539
20130710182539
20130713104233
20130713111657
20130729070143
20130911193200
20131004113137
20131005100610
20131124175346
20131210180802
20131214094309
20131215104612
20131218183023
20140228130325
20140903143914
20140920094058
20141029181752
20141029181824
20141109112308
20141122124142
20150113194759
20150113211532
20150113213922
20150113213955
20150208105930
20150510083747
20150525103953
20150526183158
20150528084820
20150528092912
20150528093249
20150725112753
20150730122707
20150730122735
20150921204850
20150921210243
20151020182334
20151020182731
20151021184614
20151021185456
20151021190616
20151024082034
20151025072118
20151031095005
20160404080304
20160416072926
20160529063352
1-redmine_agile
2-redmine_agile
3-redmine_agile
4-redmine_agile
5-redmine_agile
1-redhopper
2-redhopper
1-redmine_multiprojects_issue
2-redmine_multiprojects_issue
3-redmine_multiprojects_issue
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY settings (id, name, value, updated_on) FROM stdin;
58	password_min_length	8	2017-11-06 11:22:00.421293
3	welcome_text		2017-11-01 12:50:04.888489
4	per_page_options	25,50,100	2017-11-01 12:50:04.8944
5	search_results_per_page	10	2017-11-01 12:50:04.900475
6	activity_days_default	30	2017-11-01 12:50:04.90652
7	host_name	localhost:3000	2017-11-01 12:50:04.912417
8	protocol	http	2017-11-01 12:50:04.918345
9	text_formatting	textile	2017-11-01 12:50:04.925156
10	cache_formatted_text	0	2017-11-01 12:50:04.935464
11	wiki_compression		2017-11-01 12:50:04.94236
12	feeds_limit	15	2017-11-01 12:50:04.948634
2	app_title	Ennov-PV Redmine	2017-11-01 12:50:10.052142
1	plugin_redhopper	--- !ruby/hash-with-ivars:ActionController::Parameters\nelements:\n  features: !ruby/hash-with-ivars:ActionController::Parameters\n    elements:\n      display_description_tooltip: 'true'\n    ivars:\n      :@permitted: false\nivars:\n  :@permitted: false\n	2017-11-01 13:27:10.570736
13	ui_theme	alternate	2017-11-01 14:35:21.487495
14	default_language	en	2017-11-01 14:35:21.496181
15	force_default_language_for_anonymous	0	2017-11-01 14:35:21.50184
16	force_default_language_for_loggedin	0	2017-11-01 14:35:21.507726
17	start_of_week		2017-11-01 14:35:21.513679
18	date_format		2017-11-01 14:35:21.519933
19	time_format		2017-11-01 14:35:21.525604
20	user_format	firstname_lastname	2017-11-01 14:35:21.531792
21	gravatar_enabled	0	2017-11-01 14:35:21.537787
22	gravatar_default		2017-11-01 14:35:21.543898
23	thumbnails_enabled	0	2017-11-01 14:35:21.549625
24	thumbnails_size	100	2017-11-01 14:35:21.555864
25	new_item_menu_tab	2	2017-11-01 14:35:21.561663
26	enabled_scm	---\n- Git\n	2017-11-01 14:37:28.610894
27	autofetch_changesets	1	2017-11-01 14:37:28.624683
28	sys_api_enabled	0	2017-11-01 14:37:28.647411
29	repository_log_display_limit	100	2017-11-01 14:37:28.660143
30	commit_ref_keywords	refs,references,IssueID	2017-11-01 14:37:28.677613
31	commit_cross_project_ref	0	2017-11-01 14:37:28.701251
32	commit_logtime_enabled	0	2017-11-01 14:37:28.719565
33	commit_update_keywords	--- []\n	2017-11-01 14:37:28.731683
36	default_projects_tracker_ids	---\n- '1'\n- '2'\n- '3'\n	2017-11-01 14:38:47.918868
37	sequential_project_identifiers	0	2017-11-01 14:38:47.925925
39	link_copied_issue	ask	2017-11-01 14:55:05.782284
41	issue_group_assignment	0	2017-11-01 14:55:05.794311
42	default_issue_start_date_to_creation_date	1	2017-11-01 14:55:05.800113
43	display_subprojects_issues	1	2017-11-01 14:55:05.806073
44	issue_done_ratio	issue_field	2017-11-01 14:55:05.812106
45	non_working_week_days	---\n- '6'\n- '7'\n	2017-11-01 14:55:05.818697
46	issues_export_limit	500	2017-11-01 14:55:05.829768
47	gantt_items_limit	500	2017-11-01 14:55:05.836243
48	parent_issue_dates	derived	2017-11-01 14:55:05.842134
49	parent_issue_priority	derived	2017-11-01 14:55:05.848074
50	parent_issue_done_ratio	derived	2017-11-01 14:55:05.854276
52	issue_list_default_totals	--- []\n	2017-11-01 14:55:05.871815
59	password_max_age	0	2017-11-06 11:22:00.434107
34	default_projects_public	0	2017-11-02 10:40:56.465858
60	lost_password	0	2017-11-06 11:22:00.442162
53	plugin_redmine_agile	--- !ruby/hash-with-ivars:ActionController::Parameters\nelements:\n  board_items_limit: '500'\n  default_columns: &1\n  - assigned_to\n  - cf_7\n  - cf_2\n  estimate_units: hours\n  trackers_for_sp: ''\n  default_chart: issues_burndown\n  exclude_weekends: '0'\n  time_reports_items_limit: '1000'\n  auto_assign_on_move: '0'\n  allow_inline_comments: '0'\nivars:\n  :@permitted: false\n  :@converted_arrays: !ruby/object:Set\n    hash:\n      *1: true\n	2017-11-02 12:13:13.839537
35	default_projects_modules	---\n- issue_tracking\n- documents\n- files\n- repository\n	2017-11-02 12:28:09.506423
38	cross_project_issue_relations	1	2017-11-02 13:07:29.905647
40	cross_project_subtasks	system	2017-11-02 13:07:29.915176
51	issue_list_default_columns	---\n- project\n- tracker\n- status\n- cf_7\n- priority\n- subject\n- assigned_to\n- updated_on\n	2017-11-06 11:08:28.150153
54	login_required	0	2017-11-06 11:22:00.298541
55	autologin	0	2017-11-06 11:22:00.393355
56	self_registration	0	2017-11-06 11:22:00.403599
57	unsubscribe	0	2017-11-06 11:22:00.41217
61	max_additional_emails	5	2017-11-06 11:22:00.452229
62	openid	0	2017-11-06 11:22:00.459324
63	session_lifetime	0	2017-11-06 11:22:00.470166
64	session_timeout	0	2017-11-06 11:22:00.478413
65	default_users_hide_mail	1	2017-11-06 11:22:00.48781
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('settings_id_seq', 65, true);


--
-- Data for Name: time_entries; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) FROM stdin;
\.


--
-- Name: time_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('time_entries_id_seq', 1, false);


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY tokens (id, user_id, action, value, created_on, updated_on) FROM stdin;
3	1	feeds	c6e4841f6985600304f467bce7483efceaf9f9e4	2017-10-30 10:10:04.070349	2017-10-30 10:10:04.070349
13	6	session	7bf3513fa0e9dd68e10dcd0fe6f7311a28393338	2017-11-02 10:35:34.519991	2017-11-02 13:13:07.211887
17	6	session	bca739abd935d7896e3e3cde8fa9425af48e7a5d	2017-11-02 16:05:11.695279	2017-11-02 16:55:37.317409
15	6	session	d66223b2eaa7353f96cbd9639642e8124f99b1c7	2017-11-02 14:53:09.403705	2017-11-02 14:53:49.20554
2	1	session	fddf4d2a824e0eac2ba63975ee661e97fabffa2b	2017-10-30 10:00:04.430048	2017-10-30 12:52:52.326955
18	6	session	1cca660d9ea606366265774dd3d5a8f79b4b75a9	2017-11-03 16:14:17.470923	2017-11-03 16:14:19.605414
19	6	session	e7b816ed09abfd529d53dc68f3f7680c3695cc10	2017-11-06 11:04:05.212619	2017-11-06 17:38:23.113173
11	1	session	ae0e96304a60ed9cd3dc34590ce297b106d612f8	2017-11-01 15:41:15.760281	2017-11-01 16:24:03.681645
10	6	session	36a2a046ea093cb12078cd9bafbd66f64a1494b5	2017-11-01 14:16:34.131478	2017-11-01 16:56:25.972224
6	1	session	cff99b66d996c04d35f73833e744a2648ec18eee	2017-10-31 12:52:32.396453	2017-10-31 12:52:32.49499
8	6	session	853630aed29678286e861db910d7187f1a65cb31	2017-11-01 12:53:29.084179	2017-11-01 14:03:29.983318
4	1	session	52cef6beb378398a1474e331a1f43d82fb11eccb	2017-10-31 11:42:52.2019	2017-10-31 14:46:51.299331
9	6	feeds	33cb974998485baa512d58f95c3d3643741f778e	2017-11-01 12:53:29.119931	2017-11-01 12:53:29.119931
14	1	session	7b2bc0ca52906daba61726c270a61ef06d35938d	2017-11-02 14:42:57.878291	2017-11-02 15:59:28.598699
20	6	session	da4585b10447ef706da587cabb7a056abf69115e	2017-11-08 10:35:55.613658	2017-11-08 10:36:08.64704
5	1	session	6211aa1388c9911802f75361dd8f63eb5b65e8ad	2017-10-31 12:52:12.808594	2017-10-31 16:13:34.55421
21	6	session	7992fb46bcac614e290a4d619626274a7f4eedbf	2017-11-08 11:11:58.075209	2017-11-08 11:12:06.284127
16	6	session	06f851c22c6ba7baca8d8e336e56f04865541c0d	2017-11-02 15:59:10.8364	2017-11-02 16:01:50.821224
\.


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('tokens_id_seq', 21, true);


--
-- Data for Name: trackers; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY trackers (id, name, is_in_chlog, "position", is_in_roadmap, fields_bits, default_status_id) FROM stdin;
1	Bug	t	1	f	48	1
2	Feature	t	2	t	48	1
3	Spike	f	3	f	176	1
4	Test	f	4	t	0	1
\.


--
-- Name: trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('trackers_id_seq', 4, true);


--
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY user_preferences (id, user_id, others, hide_mail, time_zone) FROM stdin;
1	1	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:gantt_zoom: 2\n:gantt_months: 6\n	t	
2	5	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
3	6	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:gantt_zoom: 2\n:gantt_months: 6\n	t	
4	10	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
5	11	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
6	12	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
7	13	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
8	14	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
9	15	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
10	16	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
11	19	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
12	20	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
13	21	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
14	22	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
15	23	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
16	24	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
17	25	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n	t	
18	26	---\n:no_self_notified: true\n	t	\N
\.


--
-- Name: user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('user_preferences_id_seq', 18, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY users (id, login, hashed_password, firstname, lastname, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd, passwd_changed_on) FROM stdin;
2				Anonymous users	f	1	\N		\N	2017-10-26 17:23:04.232303	2017-10-26 17:23:04.232303	GroupAnonymous	\N		\N	f	\N
3				Non member users	f	1	\N		\N	2017-10-26 17:23:04.261765	2017-10-26 17:23:04.261765	GroupNonMember	\N		\N	f	\N
26	stajan	02747444f96eb37eded019bc93c74251e9a39700	Serge	TAJAN	f	2	\N	en-GB	\N	2017-11-03 10:08:55.620677	2017-11-03 10:08:55.620677	User	\N	only_my_events	010c61ab4143d7ac985ce0e9aeec8776	f	2017-11-03 10:08:55
4				Anonymous	f	0	\N		\N	2017-10-30 09:59:05.467878	2017-10-30 09:59:05.467878	AnonymousUser	\N	only_my_events	\N	f	\N
6	pwilliams@ennov.com	4b3537c0aa85338d10df3bd2d9e3ca76fbfa350a	Paul	Williams	t	1	2017-11-08 11:11:58.058163	en	\N	2017-11-01 12:49:18.769036	2017-11-01 12:49:18.769036	User	\N	only_my_events	787103f36106ef0a2a4ccfdae92ab5bb	f	2017-11-01 12:49:18
5	gdibella@ennov.com	99adc9472b5a5e8e59098237037629c5057b56dc	Giuseppe	DiBella	t	1	\N	en	\N	2017-11-01 12:47:21.471011	2017-11-01 12:48:42.495	User	\N	only_my_events	d7f63e2ebe240d6608a47a09429810d4	f	2017-11-01 12:48:42
7				Test Team	f	1	\N		\N	2017-11-01 15:00:36.930598	2017-11-01 15:00:36.930598	Group	\N		\N	f	\N
8				Dev Team	f	1	\N		\N	2017-11-01 15:12:29.54713	2017-11-01 15:12:29.54713	Group	\N		\N	f	\N
9				Product owners	f	1	\N		\N	2017-11-01 15:12:50.139354	2017-11-01 15:12:50.139354	Group	\N		\N	f	\N
10	mrawling@ennov.com	697fec0d523235e1823110b3b016fa8942134f7f	Matt	Rawling	f	1	\N	en	\N	2017-11-02 10:37:37.169589	2017-11-02 10:37:37.169589	User	\N	only_my_events	3941469c613b74b547b2126846c43593	f	2017-11-02 10:37:37
11	npillinger@ennov.com	85f4293a89336db8ffd2874dfd04d9442f7e1a28	Nic	Pillinger	f	1	\N	en	\N	2017-11-02 10:38:16.543565	2017-11-02 10:38:16.543565	User	\N	only_my_events	8c76f97b1b7a5f309fbd6ad14cf823e3	f	2017-11-02 10:38:16
12	tpickman@ennov.com	fc039043ac8680e4fbdd0e877b41133ceeb1b854	Tim	Pickman	f	1	\N	en	\N	2017-11-02 11:38:29.023372	2017-11-02 11:38:29.023372	User	\N	only_my_events	01d9f70210c053bde5167ea395f7cd93	f	2017-11-02 11:38:29
13	npickering@ennov.com	67fac88eb656e23b4ed6a63f63b22d8e831c5ce8	Nick	Pickering	f	1	\N	en	\N	2017-11-02 11:40:29.274767	2017-11-02 11:40:29.274767	User	\N	only_my_events	1a848ebcb63d3866446f038e7da1dc28	f	2017-11-02 11:40:29
14	aqarshi@ennov.com	7508d2388f0f4ac876535389b065f32f88d58989	Ahmad	Qarshi	f	1	\N	en	\N	2017-11-02 11:41:43.920928	2017-11-02 11:41:43.920928	User	\N	only_my_events	3ad3a61bdadcc204613bd81eb4a59678	f	2017-11-02 11:41:43
15	msek@ennov.com	0165946b7ec323ae956ae4a659a36eb8545e6512	Marcin	Sek	f	1	\N	en	\N	2017-11-02 11:42:19.728576	2017-11-02 11:42:19.728576	User	\N	only_my_events	52ad957ebd4b9bce1e9321ecd51ff22c	f	2017-11-02 11:42:19
16	garthur@ennov.com	57b9a26bc11a0daa6ef53e8fb942f4243ed1280d	Graham	Arthur	f	1	\N	en	\N	2017-11-02 11:42:58.582331	2017-11-02 11:42:58.582331	User	\N	only_my_events	75c8470278c39cb3fc0225a9adfee5c0	f	2017-11-02 11:42:58
17				Vulcan Devs	f	1	\N		\N	2017-11-02 11:46:08.047593	2017-11-02 11:46:08.047593	Group	\N		\N	f	\N
18				Victor Devs	f	1	\N		\N	2017-11-02 11:46:19.441892	2017-11-02 11:46:19.441892	Group	\N		\N	f	\N
19	sstankiewicz@ennov.com	2dfc4c8bf3c4ae5574039c39714f1c2edc4afd58	Szymon	Stankiewicz	f	1	\N	en	\N	2017-11-02 11:47:43.59302	2017-11-02 11:47:43.59302	User	\N	only_my_events	ca7f7aadca862968dde4c0578428e048	f	2017-11-02 11:47:43
20	smadej@ennov.com	54ae6bbf3d8551d54031fbf26c357925a339cab7	Sylwester	Madej	f	1	\N	en	\N	2017-11-02 11:48:10.987643	2017-11-02 11:48:10.987643	User	\N	only_my_events	42165d95ef573d3d0d013799041991af	f	2017-11-02 11:48:10
21	pmillington@ennov.com	c624da8c7ef00034ee2156ddb6a2cbdc165a9e14	Paul	Millington	f	1	\N	en	\N	2017-11-02 11:48:49.561508	2017-11-02 11:48:49.561508	User	\N	only_my_events	375062f480fc2365c2c5b7e230b4f05c	f	2017-11-02 11:48:49
22	lpotts@ennov.com	735557b71e9f1e6304c5b7fe09e3204ad65def0a	Lynn	Potts	f	1	\N	en	\N	2017-11-02 11:49:17.836489	2017-11-02 11:49:17.836489	User	\N	only_my_events	9ae5de5b16ae0e1dc36ad0f460e14095	f	2017-11-02 11:49:17
23	cadudodla@ennov.com	6e1cfec4ab96010fa82df3175d37f1b73a60c134	Chaitanya	Adudodla	f	1	\N	en	\N	2017-11-02 11:49:39.875247	2017-11-02 11:49:39.875247	User	\N	only_my_events	4eedd30f1655b005cc725877865dae8b	f	2017-11-02 11:49:39
24	dulava@ennov.com	5c6a08abba4e21fa8b00e0dad83af4df9fe6ad45	Divya	Ulava	f	1	\N	en	\N	2017-11-02 11:50:24.121767	2017-11-02 11:50:24.121767	User	\N	only_my_events	a03e91df41c7cb3cda6c4295be90f9f2	f	2017-11-02 11:50:24
25	agreen@ennov.com	e8e2fea5f3424c20a438e8575793f8f4feae1533	Andy	Green	f	1	\N	en	\N	2017-11-02 11:51:15.287355	2017-11-02 11:51:15.287355	User	\N	only_my_events	19b938e90e49f3b9fee127a47688b966	f	2017-11-02 11:51:15
1	admin	9982daba63e8788a868edb453481d6a1487e8a63	Redmine	Admin	t	1	2017-11-02 14:42:57.839178		\N	2017-10-26 17:22:49.591265	2017-10-30 10:00:04.41679	User	\N	all	8a3f6f7e90b311e75fc9aae6b4f1e888	f	2017-10-30 10:00:04
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('users_id_seq', 26, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY versions (id, project_id, name, description, effective_date, created_on, updated_on, wiki_page_title, status, sharing) FROM stdin;
1	21	1.0.0	beta	\N	2017-11-02 16:34:27.44539	2017-11-02 16:34:27.44539	\N	open	none
\.


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('versions_id_seq', 1, true);


--
-- Data for Name: watchers; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY watchers (id, watchable_type, watchable_id, user_id) FROM stdin;
\.


--
-- Name: watchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('watchers_id_seq', 1, false);


--
-- Data for Name: wiki_content_versions; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) FROM stdin;
\.


--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('wiki_content_versions_id_seq', 1, false);


--
-- Data for Name: wiki_contents; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY wiki_contents (id, page_id, author_id, text, comments, updated_on, version) FROM stdin;
\.


--
-- Name: wiki_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('wiki_contents_id_seq', 1, false);


--
-- Data for Name: wiki_pages; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY wiki_pages (id, wiki_id, title, created_on, protected, parent_id) FROM stdin;
\.


--
-- Name: wiki_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('wiki_pages_id_seq', 1, false);


--
-- Data for Name: wiki_redirects; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY wiki_redirects (id, wiki_id, title, redirects_to, created_on, redirects_to_wiki_id) FROM stdin;
\.


--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('wiki_redirects_id_seq', 1, false);


--
-- Data for Name: wikis; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY wikis (id, project_id, start_page, status) FROM stdin;
10	10	Wiki	1
\.


--
-- Name: wikis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('wikis_id_seq', 11, true);


--
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: redmine/instances/default
--

COPY workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) FROM stdin;
1	1	1	2	3	f	f	WorkflowTransition	\N	\N
148	1	5	3	5	f	f	WorkflowTransition	\N	\N
149	2	5	3	5	f	f	WorkflowTransition	\N	\N
150	3	5	3	5	f	f	WorkflowTransition	\N	\N
151	1	5	6	5	f	f	WorkflowTransition	\N	\N
6	1	2	1	3	f	f	WorkflowTransition	\N	\N
7	1	2	3	3	f	f	WorkflowTransition	\N	\N
152	2	5	6	5	f	f	WorkflowTransition	\N	\N
153	3	5	6	5	f	f	WorkflowTransition	\N	\N
154	1	6	5	5	f	f	WorkflowTransition	\N	\N
155	2	6	5	5	f	f	WorkflowTransition	\N	\N
156	3	6	5	5	f	f	WorkflowTransition	\N	\N
157	4	0	1	3	f	f	WorkflowTransition	\N	\N
158	4	1	2	3	f	f	WorkflowTransition	\N	\N
159	4	2	1	3	f	f	WorkflowTransition	\N	\N
160	4	2	3	5	f	f	WorkflowTransition	\N	\N
161	4	3	2	5	f	f	WorkflowTransition	\N	\N
162	4	3	5	5	f	f	WorkflowTransition	\N	\N
163	4	5	3	5	f	f	WorkflowTransition	\N	\N
164	4	5	6	5	f	f	WorkflowTransition	\N	\N
31	2	1	2	3	f	f	WorkflowTransition	\N	\N
36	2	2	1	3	f	f	WorkflowTransition	\N	\N
37	2	2	3	3	f	f	WorkflowTransition	\N	\N
61	3	1	2	3	f	f	WorkflowTransition	\N	\N
66	3	2	1	3	f	f	WorkflowTransition	\N	\N
67	3	2	3	3	f	f	WorkflowTransition	\N	\N
95	1	2	3	4	f	f	WorkflowTransition	\N	\N
98	1	3	2	4	f	f	WorkflowTransition	\N	\N
99	1	3	4	4	f	f	WorkflowTransition	\N	\N
102	1	4	3	4	f	f	WorkflowTransition	\N	\N
103	1	4	5	4	f	f	WorkflowTransition	\N	\N
108	2	2	3	4	f	f	WorkflowTransition	\N	\N
111	2	3	2	4	f	f	WorkflowTransition	\N	\N
112	2	3	4	4	f	f	WorkflowTransition	\N	\N
115	2	4	3	4	f	f	WorkflowTransition	\N	\N
116	2	4	5	4	f	f	WorkflowTransition	\N	\N
121	3	2	3	4	f	f	WorkflowTransition	\N	\N
124	3	3	2	4	f	f	WorkflowTransition	\N	\N
125	3	3	4	4	f	f	WorkflowTransition	\N	\N
128	3	4	3	4	f	f	WorkflowTransition	\N	\N
129	3	4	5	4	f	f	WorkflowTransition	\N	\N
145	1	0	1	3	f	f	WorkflowTransition	\N	\N
146	2	0	1	3	f	f	WorkflowTransition	\N	\N
147	3	0	1	3	f	f	WorkflowTransition	\N	\N
\.


--
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine/instances/default
--

SELECT pg_catalog.setval('workflows_id_seq', 164, true);


--
-- Name: agile_colors agile_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY agile_colors
    ADD CONSTRAINT agile_colors_pkey PRIMARY KEY (id);


--
-- Name: agile_data agile_data_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY agile_data
    ADD CONSTRAINT agile_data_pkey PRIMARY KEY (id);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: auth_sources auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (id);


--
-- Name: boards boards_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);


--
-- Name: changes changes_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (id);


--
-- Name: changesets changesets_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY changesets
    ADD CONSTRAINT changesets_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: custom_field_enumerations custom_field_enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY custom_field_enumerations
    ADD CONSTRAINT custom_field_enumerations_pkey PRIMARY KEY (id);


--
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- Name: custom_values custom_values_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY custom_values
    ADD CONSTRAINT custom_values_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: email_addresses email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY email_addresses
    ADD CONSTRAINT email_addresses_pkey PRIMARY KEY (id);


--
-- Name: enabled_modules enabled_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY enabled_modules
    ADD CONSTRAINT enabled_modules_pkey PRIMARY KEY (id);


--
-- Name: enumerations enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY enumerations
    ADD CONSTRAINT enumerations_pkey PRIMARY KEY (id);


--
-- Name: import_items import_items_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY import_items
    ADD CONSTRAINT import_items_pkey PRIMARY KEY (id);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: issue_categories issue_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY issue_categories
    ADD CONSTRAINT issue_categories_pkey PRIMARY KEY (id);


--
-- Name: issue_relations issue_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY issue_relations
    ADD CONSTRAINT issue_relations_pkey PRIMARY KEY (id);


--
-- Name: issue_statuses issue_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY issue_statuses
    ADD CONSTRAINT issue_statuses_pkey PRIMARY KEY (id);


--
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: journal_details journal_details_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY journal_details
    ADD CONSTRAINT journal_details_pkey PRIMARY KEY (id);


--
-- Name: journals journals_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- Name: member_roles member_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY member_roles
    ADD CONSTRAINT member_roles_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_associations open_id_authentication_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY open_id_authentication_associations
    ADD CONSTRAINT open_id_authentication_associations_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_nonces open_id_authentication_nonces_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY open_id_authentication_nonces
    ADD CONSTRAINT open_id_authentication_nonces_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: queries queries_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (id);


--
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: time_entries time_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY time_entries
    ADD CONSTRAINT time_entries_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: trackers trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: watchers watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY watchers
    ADD CONSTRAINT watchers_pkey PRIMARY KEY (id);


--
-- Name: wiki_content_versions wiki_content_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY wiki_content_versions
    ADD CONSTRAINT wiki_content_versions_pkey PRIMARY KEY (id);


--
-- Name: wiki_contents wiki_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY wiki_contents
    ADD CONSTRAINT wiki_contents_pkey PRIMARY KEY (id);


--
-- Name: wiki_pages wiki_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY wiki_pages
    ADD CONSTRAINT wiki_pages_pkey PRIMARY KEY (id);


--
-- Name: wiki_redirects wiki_redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY wiki_redirects
    ADD CONSTRAINT wiki_redirects_pkey PRIMARY KEY (id);


--
-- Name: wikis wikis_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY wikis
    ADD CONSTRAINT wikis_pkey PRIMARY KEY (id);


--
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine/instances/default
--

ALTER TABLE ONLY workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- Name: boards_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX boards_project_id ON boards USING btree (project_id);


--
-- Name: changeset_parents_changeset_ids; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX changeset_parents_changeset_ids ON changeset_parents USING btree (changeset_id);


--
-- Name: changeset_parents_parent_ids; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX changeset_parents_parent_ids ON changeset_parents USING btree (parent_id);


--
-- Name: changesets_changeset_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX changesets_changeset_id ON changes USING btree (changeset_id);


--
-- Name: changesets_issues_ids; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX changesets_issues_ids ON changesets_issues USING btree (changeset_id, issue_id);


--
-- Name: changesets_repos_rev; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX changesets_repos_rev ON changesets USING btree (repository_id, revision);


--
-- Name: changesets_repos_scmid; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX changesets_repos_scmid ON changesets USING btree (repository_id, scmid);


--
-- Name: custom_fields_roles_ids; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX custom_fields_roles_ids ON custom_fields_roles USING btree (custom_field_id, role_id);


--
-- Name: custom_values_customized; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX custom_values_customized ON custom_values USING btree (customized_type, customized_id);


--
-- Name: documents_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX documents_project_id ON documents USING btree (project_id);


--
-- Name: enabled_modules_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX enabled_modules_project_id ON enabled_modules USING btree (project_id);


--
-- Name: groups_users_ids; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX groups_users_ids ON groups_users USING btree (group_id, user_id);


--
-- Name: index_agile_colors_on_container_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_agile_colors_on_container_id ON agile_colors USING btree (container_id);


--
-- Name: index_agile_colors_on_container_type; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_agile_colors_on_container_type ON agile_colors USING btree (container_type);


--
-- Name: index_agile_data_on_issue_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_agile_data_on_issue_id ON agile_data USING btree (issue_id);


--
-- Name: index_agile_data_on_position; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_agile_data_on_position ON agile_data USING btree ("position");


--
-- Name: index_attachments_on_author_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_attachments_on_author_id ON attachments USING btree (author_id);


--
-- Name: index_attachments_on_container_id_and_container_type; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_attachments_on_container_id_and_container_type ON attachments USING btree (container_id, container_type);


--
-- Name: index_attachments_on_created_on; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_attachments_on_created_on ON attachments USING btree (created_on);


--
-- Name: index_auth_sources_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_auth_sources_on_id_and_type ON auth_sources USING btree (id, type);


--
-- Name: index_boards_on_last_message_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_boards_on_last_message_id ON boards USING btree (last_message_id);


--
-- Name: index_changesets_on_committed_on; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_changesets_on_committed_on ON changesets USING btree (committed_on);


--
-- Name: index_changesets_on_repository_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_changesets_on_repository_id ON changesets USING btree (repository_id);


--
-- Name: index_changesets_on_user_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_changesets_on_user_id ON changesets USING btree (user_id);


--
-- Name: index_comments_on_author_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_comments_on_author_id ON comments USING btree (author_id);


--
-- Name: index_comments_on_commented_id_and_commented_type; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_comments_on_commented_id_and_commented_type ON comments USING btree (commented_id, commented_type);


--
-- Name: index_custom_fields_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_custom_fields_on_id_and_type ON custom_fields USING btree (id, type);


--
-- Name: index_custom_fields_projects_on_custom_field_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX index_custom_fields_projects_on_custom_field_id_and_project_id ON custom_fields_projects USING btree (custom_field_id, project_id);


--
-- Name: index_custom_fields_trackers_on_custom_field_id_and_tracker_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX index_custom_fields_trackers_on_custom_field_id_and_tracker_id ON custom_fields_trackers USING btree (custom_field_id, tracker_id);


--
-- Name: index_custom_values_on_custom_field_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_custom_values_on_custom_field_id ON custom_values USING btree (custom_field_id);


--
-- Name: index_documents_on_category_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_documents_on_category_id ON documents USING btree (category_id);


--
-- Name: index_documents_on_created_on; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_documents_on_created_on ON documents USING btree (created_on);


--
-- Name: index_email_addresses_on_user_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_email_addresses_on_user_id ON email_addresses USING btree (user_id);


--
-- Name: index_enumerations_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_enumerations_on_id_and_type ON enumerations USING btree (id, type);


--
-- Name: index_enumerations_on_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_enumerations_on_project_id ON enumerations USING btree (project_id);


--
-- Name: index_issue_categories_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issue_categories_on_assigned_to_id ON issue_categories USING btree (assigned_to_id);


--
-- Name: index_issue_relations_on_issue_from_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issue_relations_on_issue_from_id ON issue_relations USING btree (issue_from_id);


--
-- Name: index_issue_relations_on_issue_from_id_and_issue_to_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX index_issue_relations_on_issue_from_id_and_issue_to_id ON issue_relations USING btree (issue_from_id, issue_to_id);


--
-- Name: index_issue_relations_on_issue_to_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issue_relations_on_issue_to_id ON issue_relations USING btree (issue_to_id);


--
-- Name: index_issue_statuses_on_is_closed; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issue_statuses_on_is_closed ON issue_statuses USING btree (is_closed);


--
-- Name: index_issue_statuses_on_position; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issue_statuses_on_position ON issue_statuses USING btree ("position");


--
-- Name: index_issues_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issues_on_assigned_to_id ON issues USING btree (assigned_to_id);


--
-- Name: index_issues_on_author_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issues_on_author_id ON issues USING btree (author_id);


--
-- Name: index_issues_on_category_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issues_on_category_id ON issues USING btree (category_id);


--
-- Name: index_issues_on_created_on; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issues_on_created_on ON issues USING btree (created_on);


--
-- Name: index_issues_on_fixed_version_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issues_on_fixed_version_id ON issues USING btree (fixed_version_id);


--
-- Name: index_issues_on_priority_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issues_on_priority_id ON issues USING btree (priority_id);


--
-- Name: index_issues_on_root_id_and_lft_and_rgt; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issues_on_root_id_and_lft_and_rgt ON issues USING btree (root_id, lft, rgt);


--
-- Name: index_issues_on_status_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issues_on_status_id ON issues USING btree (status_id);


--
-- Name: index_issues_on_tracker_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_issues_on_tracker_id ON issues USING btree (tracker_id);


--
-- Name: index_issues_projects_on_issue_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX index_issues_projects_on_issue_id_and_project_id ON issues_projects USING btree (issue_id, project_id);


--
-- Name: index_journals_on_created_on; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_journals_on_created_on ON journals USING btree (created_on);


--
-- Name: index_journals_on_journalized_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_journals_on_journalized_id ON journals USING btree (journalized_id);


--
-- Name: index_journals_on_user_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_journals_on_user_id ON journals USING btree (user_id);


--
-- Name: index_member_roles_on_member_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_member_roles_on_member_id ON member_roles USING btree (member_id);


--
-- Name: index_member_roles_on_role_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_member_roles_on_role_id ON member_roles USING btree (role_id);


--
-- Name: index_members_on_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_members_on_project_id ON members USING btree (project_id);


--
-- Name: index_members_on_user_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_members_on_user_id ON members USING btree (user_id);


--
-- Name: index_members_on_user_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX index_members_on_user_id_and_project_id ON members USING btree (user_id, project_id);


--
-- Name: index_messages_on_author_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_messages_on_author_id ON messages USING btree (author_id);


--
-- Name: index_messages_on_created_on; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_messages_on_created_on ON messages USING btree (created_on);


--
-- Name: index_messages_on_last_reply_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_messages_on_last_reply_id ON messages USING btree (last_reply_id);


--
-- Name: index_news_on_author_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_news_on_author_id ON news USING btree (author_id);


--
-- Name: index_news_on_created_on; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_news_on_created_on ON news USING btree (created_on);


--
-- Name: index_projects_on_lft; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_projects_on_lft ON projects USING btree (lft);


--
-- Name: index_projects_on_rgt; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_projects_on_rgt ON projects USING btree (rgt);


--
-- Name: index_queries_on_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_queries_on_project_id ON queries USING btree (project_id);


--
-- Name: index_queries_on_user_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_queries_on_user_id ON queries USING btree (user_id);


--
-- Name: index_repositories_on_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_repositories_on_project_id ON repositories USING btree (project_id);


--
-- Name: index_roles_managed_roles_on_role_id_and_managed_role_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX index_roles_managed_roles_on_role_id_and_managed_role_id ON roles_managed_roles USING btree (role_id, managed_role_id);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_settings_on_name ON settings USING btree (name);


--
-- Name: index_time_entries_on_activity_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_time_entries_on_activity_id ON time_entries USING btree (activity_id);


--
-- Name: index_time_entries_on_created_on; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_time_entries_on_created_on ON time_entries USING btree (created_on);


--
-- Name: index_time_entries_on_user_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_time_entries_on_user_id ON time_entries USING btree (user_id);


--
-- Name: index_tokens_on_user_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_tokens_on_user_id ON tokens USING btree (user_id);


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_user_preferences_on_user_id ON user_preferences USING btree (user_id);


--
-- Name: index_users_on_auth_source_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_users_on_auth_source_id ON users USING btree (auth_source_id);


--
-- Name: index_users_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_users_on_id_and_type ON users USING btree (id, type);


--
-- Name: index_users_on_type; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_users_on_type ON users USING btree (type);


--
-- Name: index_versions_on_sharing; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_versions_on_sharing ON versions USING btree (sharing);


--
-- Name: index_watchers_on_user_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_watchers_on_user_id ON watchers USING btree (user_id);


--
-- Name: index_watchers_on_watchable_id_and_watchable_type; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_watchers_on_watchable_id_and_watchable_type ON watchers USING btree (watchable_id, watchable_type);


--
-- Name: index_wiki_content_versions_on_updated_on; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_wiki_content_versions_on_updated_on ON wiki_content_versions USING btree (updated_on);


--
-- Name: index_wiki_contents_on_author_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_wiki_contents_on_author_id ON wiki_contents USING btree (author_id);


--
-- Name: index_wiki_pages_on_parent_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_wiki_pages_on_parent_id ON wiki_pages USING btree (parent_id);


--
-- Name: index_wiki_pages_on_wiki_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_wiki_pages_on_wiki_id ON wiki_pages USING btree (wiki_id);


--
-- Name: index_wiki_redirects_on_wiki_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_wiki_redirects_on_wiki_id ON wiki_redirects USING btree (wiki_id);


--
-- Name: index_workflows_on_new_status_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_workflows_on_new_status_id ON workflows USING btree (new_status_id);


--
-- Name: index_workflows_on_old_status_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_workflows_on_old_status_id ON workflows USING btree (old_status_id);


--
-- Name: index_workflows_on_role_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX index_workflows_on_role_id ON workflows USING btree (role_id);


--
-- Name: issue_categories_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX issue_categories_project_id ON issue_categories USING btree (project_id);


--
-- Name: issues_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX issues_project_id ON issues USING btree (project_id);


--
-- Name: journal_details_journal_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX journal_details_journal_id ON journal_details USING btree (journal_id);


--
-- Name: journals_journalized_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX journals_journalized_id ON journals USING btree (journalized_id, journalized_type);


--
-- Name: messages_board_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX messages_board_id ON messages USING btree (board_id);


--
-- Name: messages_parent_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX messages_parent_id ON messages USING btree (parent_id);


--
-- Name: news_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX news_project_id ON news USING btree (project_id);


--
-- Name: projects_trackers_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX projects_trackers_project_id ON projects_trackers USING btree (project_id);


--
-- Name: projects_trackers_unique; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX projects_trackers_unique ON projects_trackers USING btree (project_id, tracker_id);


--
-- Name: queries_roles_ids; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX queries_roles_ids ON queries_roles USING btree (query_id, role_id);


--
-- Name: time_entries_issue_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX time_entries_issue_id ON time_entries USING btree (issue_id);


--
-- Name: time_entries_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX time_entries_project_id ON time_entries USING btree (project_id);


--
-- Name: tokens_value; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX tokens_value ON tokens USING btree (value);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: versions_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX versions_project_id ON versions USING btree (project_id);


--
-- Name: watchers_user_id_type; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX watchers_user_id_type ON watchers USING btree (user_id, watchable_type);


--
-- Name: wiki_content_versions_wcid; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX wiki_content_versions_wcid ON wiki_content_versions USING btree (wiki_content_id);


--
-- Name: wiki_contents_page_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX wiki_contents_page_id ON wiki_contents USING btree (page_id);


--
-- Name: wiki_pages_wiki_id_title; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX wiki_pages_wiki_id_title ON wiki_pages USING btree (wiki_id, title);


--
-- Name: wiki_redirects_wiki_id_title; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX wiki_redirects_wiki_id_title ON wiki_redirects USING btree (wiki_id, title);


--
-- Name: wikis_project_id; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX wikis_project_id ON wikis USING btree (project_id);


--
-- Name: wkfs_role_tracker_old_status; Type: INDEX; Schema: public; Owner: redmine/instances/default
--

CREATE INDEX wkfs_role_tracker_old_status ON workflows USING btree (role_id, tracker_id, old_status_id);


--
-- PostgreSQL database dump complete
--

