-- Table: public.ciastko

-- DROP TABLE IF EXISTS public.ciastko;

CREATE TABLE IF NOT EXISTS public.ciastko
(
    id_ciastko integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    id_cukierni integer NOT NULL,
    nazwa character varying(50) COLLATE pg_catalog."default" NOT NULL,
    smak character varying(40) COLLATE pg_catalog."default",
    cena numeric(7,2),
    typ character varying(40) COLLATE pg_catalog."default",
    waga numeric(3,1),
    skladniki character varying(30)[] COLLATE pg_catalog."default",
    alergeny character varying(30)[] COLLATE pg_catalog."default",
    gluten boolean,
    informacja text COLLATE pg_catalog."default",
    CONSTRAINT ciastko_pkey PRIMARY KEY (id_ciastko)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ciastko
    OWNER to mariusz;

GRANT ALL ON TABLE public.ciastko TO mariusz;
