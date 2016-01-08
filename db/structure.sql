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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: champion_base_stat_costs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE champion_base_stat_costs (
    id integer NOT NULL,
    champion_id integer,
    total numeric,
    attackrange numeric,
    mpperlevel numeric,
    mp numeric,
    attackdamage numeric,
    hp numeric,
    hpperlevel numeric,
    attackdamageperlevel numeric,
    armor numeric,
    mpregenperlevel numeric,
    hpregen numeric,
    critperlevel numeric,
    spellblockperlevel numeric,
    mpregen numeric,
    attackspeedperlevel numeric,
    spellblock numeric,
    movespeed numeric,
    attackspeedoffset numeric,
    crit numeric,
    hpregenperlevel numeric,
    armorperlevel numeric,
    total_before_scaling numeric DEFAULT 0 NOT NULL
);


--
-- Name: champion_base_stat_costs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE champion_base_stat_costs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: champion_base_stat_costs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE champion_base_stat_costs_id_seq OWNED BY champion_base_stat_costs.id;


--
-- Name: champion_base_stats; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE champion_base_stats (
    id integer NOT NULL,
    champion_id integer,
    attackrange numeric,
    mpperlevel numeric,
    mp numeric,
    attackdamage numeric,
    hp numeric,
    hpperlevel numeric,
    attackdamageperlevel numeric,
    armor numeric,
    mpregenperlevel numeric,
    hpregen numeric,
    critperlevel numeric,
    spellblockperlevel numeric,
    mpregen numeric,
    attackspeedperlevel numeric,
    spellblock numeric,
    movespeed numeric,
    attackspeedoffset numeric,
    crit numeric,
    hpregenperlevel numeric,
    armorperlevel numeric
);


--
-- Name: champion_base_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE champion_base_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: champion_base_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE champion_base_stats_id_seq OWNED BY champion_base_stats.id;


--
-- Name: champions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE champions (
    id integer NOT NULL,
    name character varying NOT NULL,
    title character varying NOT NULL,
    riot_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: champions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE champions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: champions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE champions_id_seq OWNED BY champions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY champion_base_stat_costs ALTER COLUMN id SET DEFAULT nextval('champion_base_stat_costs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY champion_base_stats ALTER COLUMN id SET DEFAULT nextval('champion_base_stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY champions ALTER COLUMN id SET DEFAULT nextval('champions_id_seq'::regclass);


--
-- Name: champion_base_stat_costs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY champion_base_stat_costs
    ADD CONSTRAINT champion_base_stat_costs_pkey PRIMARY KEY (id);


--
-- Name: champion_base_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY champion_base_stats
    ADD CONSTRAINT champion_base_stats_pkey PRIMARY KEY (id);


--
-- Name: champions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY champions
    ADD CONSTRAINT champions_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20141025220320');

INSERT INTO schema_migrations (version) VALUES ('20141114045852');

INSERT INTO schema_migrations (version) VALUES ('20160107235801');

