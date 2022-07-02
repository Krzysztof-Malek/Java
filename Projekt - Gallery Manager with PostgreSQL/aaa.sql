
--(NOT Installed) AND (NOT OLDPRODUCTS)

DROP TABLE IF EXISTS public.categories;

CREATE TABLE IF NOT EXISTS public.categories (
    category_id integer NOT NULL,
    parent_category_id integer,
    category_name character varying(25),
    user_id integer
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16400)
-- Name: photo_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.photo_category (
    photo_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.photo_category OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16409)
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.photos (
    photo_id integer NOT NULL,
    photo_size bigint,
    photo_resolution_x integer,
    photo_resolution_y integer,
    photo_date date,
    photo_extension_format character varying(5),
    photo_name text,
    photo_description character varying(350),
    category_id integer,
    user_id integer,
    photo text
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16414)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.users (
    user_id integer NOT NULL,
    user_nickname character varying(25) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2862 (class 2606 OID 16399)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

--ALTER TABLE ONLY public.categories
  --  DROP CONSTRAINT IF EXISTS categories_pkey;

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
	
	-- ALTER TABLE foo DROP CONSTRAINT IF EXISTS bar;


--
-- TOC entry 2864 (class 2606 OID 16404)
-- Name: photo_category photo_category_category_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_category
    ADD CONSTRAINT photo_category_category_id_key UNIQUE (category_id);


--
-- TOC entry 2866 (class 2606 OID 16406)
-- Name: photo_category photo_category_photo_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_category
    ADD CONSTRAINT photo_category_photo_id_key UNIQUE (photo_id);


--
-- TOC entry 2870 (class 2606 OID 16490)
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (photo_id);


--
-- TOC entry 2868 (class 2606 OID 16408)
-- Name: photo_category unique_names; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_category
    ADD CONSTRAINT unique_names UNIQUE (photo_id, category_id);


--
-- TOC entry 2872 (class 2606 OID 16418)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2873 (class 2606 OID 16419)
-- Name: categories categories_parent_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_category_id_fkey FOREIGN KEY (parent_category_id) REFERENCES public.categories(category_id);


--
-- TOC entry 2874 (class 2606 OID 16424)
-- Name: categories categories_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 2875 (class 2606 OID 16429)
-- Name: photo_category category_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_category
    ADD CONSTRAINT category_category FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- TOC entry 2876 (class 2606 OID 16491)
-- Name: photo_category photo_photo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo_category
    ADD CONSTRAINT photo_photo FOREIGN KEY (photo_id) REFERENCES public.photos(photo_id);
