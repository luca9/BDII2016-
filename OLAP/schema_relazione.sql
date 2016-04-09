--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-04-07 23:14:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16580)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 16589)
-- Name: AnnoAccademico; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "AnnoAccademico" (
    "CodiceAnno" integer NOT NULL,
    "NomeAnnoX" integer,
    "NomeAnnoX-1" integer,
    "NomeAnnoX-1/X" "char"[]
);


ALTER TABLE "AnnoAccademico" OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16621)
-- Name: Corso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Corso" (
    "CodiceCorso" integer NOT NULL,
    "Nome" "char"[],
    "NumeroCFU" integer,
    "SSD" "char"[]
);


ALTER TABLE "Corso" OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16597)
-- Name: CorsoDiStudi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "CorsoDiStudi" (
    "DataInizioValidità" date,
    "DataFineValidità" date,
    "NomeCdS" "char"[],
    "TipoCdS" "char"[],
    "NomeDipartimento" "char"[],
    "CodiceDipartimento" integer,
    "CodiceCorsoDiStudi" integer NOT NULL,
    "DurataLegale" integer,
    "CodiceAteneo" integer,
    "NumeroProgrammato" integer,
    "HaNumeroProgrammato" boolean
);


ALTER TABLE "CorsoDiStudi" OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16676)
-- Name: Esame; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Esame" (
    "Voto" integer,
    "CFUAcquisiti" integer,
    "CorsoDiStudi" integer NOT NULL,
    "AnnoAccademico" integer NOT NULL,
    "Studente" "char"[] NOT NULL,
    "Corso" integer NOT NULL,
    "Tempo" integer NOT NULL
);


ALTER TABLE "Esame" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16629)
-- Name: Ingresso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Ingresso" (
    "Studente" "char"[] NOT NULL,
    "CorsoDiStudi" integer NOT NULL,
    "AnnoAccademico" integer NOT NULL,
    "TipoImmatricolazione" "char"[] NOT NULL,
    "Immatricolato" "char"[],
    "PunteggioTest" integer,
    "Tempo" integer NOT NULL
);


ALTER TABLE "Ingresso" OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16704)
-- Name: Laurea; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Laurea" (
    "Studente" "char"[] NOT NULL,
    "AnnoAccademico" integer NOT NULL,
    "CorsoDiStudi" integer NOT NULL,
    "VotoLaurea" integer,
    "Tempo" integer NOT NULL
);


ALTER TABLE "Laurea" OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16581)
-- Name: Studente; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Studente" (
    "DataDiNascita" date,
    "Coorte" integer,
    "TitoloDiStudio" "char"[],
    "Sesso" "char"[],
    "RegioneResidenza" "char"[],
    "ProvinciaResidenza" "char"[],
    "ComuneResidenza" "char"[],
    "StatoResidenza" "char"[],
    "Cittadinanza" "char"[],
    "CF" "char"[] NOT NULL,
    "VotoScuolaMediaSuperiore" integer,
    "NazioneDiploma" "char"[],
    "TipoScuolaMediaSuperiore" "char"[],
    "IstitutoScuolaMediaSuperiore" "char"[],
    "AnnoSolareConseguimentoTitoloScuolaMediaSuperiore" "char"[]
);


ALTER TABLE "Studente" OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16742)
-- Name: Tempo; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Tempo" (
    "IdTempo" integer NOT NULL,
    "Giorno" integer NOT NULL,
    "Mese" integer NOT NULL,
    "Anno" integer NOT NULL
);


ALTER TABLE "Tempo" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16605)
-- Name: TipoImmatricolazione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "TipoImmatricolazione" (
    "TipoImmatricolazione" "char"[] NOT NULL
);


ALTER TABLE "TipoImmatricolazione" OWNER TO postgres;

--
-- TOC entry 2022 (class 2606 OID 16596)
-- Name: AnnoAccademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "AnnoAccademico"
    ADD CONSTRAINT "AnnoAccademico_pkey" PRIMARY KEY ("CodiceAnno");


--
-- TOC entry 2024 (class 2606 OID 16604)
-- Name: CorsoDiStudi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "CorsoDiStudi"
    ADD CONSTRAINT "CorsoDiStudi_pkey" PRIMARY KEY ("CodiceCorsoDiStudi");


--
-- TOC entry 2028 (class 2606 OID 16628)
-- Name: Corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Corso"
    ADD CONSTRAINT "Corso_pkey" PRIMARY KEY ("CodiceCorso");


--
-- TOC entry 2020 (class 2606 OID 16588)
-- Name: Studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Studente"
    ADD CONSTRAINT "Studente_pkey" PRIMARY KEY ("CF");


--
-- TOC entry 2030 (class 2606 OID 16746)
-- Name: Tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Tempo"
    ADD CONSTRAINT "Tempo_pkey" PRIMARY KEY ("IdTempo");


--
-- TOC entry 2026 (class 2606 OID 16612)
-- Name: TipoImmatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "TipoImmatricolazione"
    ADD CONSTRAINT "TipoImmatricolazione_pkey" PRIMARY KEY ("TipoImmatricolazione");


--
-- TOC entry 2040 (class 2606 OID 16752)
-- Name: Esame_Tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esame"
    ADD CONSTRAINT "Esame_Tempo_fkey" FOREIGN KEY ("Tempo") REFERENCES "Tempo"("IdTempo");


--
-- TOC entry 2036 (class 2606 OID 16684)
-- Name: Esami_AnnoAccademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esame"
    ADD CONSTRAINT "Esami_AnnoAccademico_fkey" FOREIGN KEY ("AnnoAccademico") REFERENCES "AnnoAccademico"("CodiceAnno");


--
-- TOC entry 2039 (class 2606 OID 16699)
-- Name: Esami_CorsoDiStudi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esame"
    ADD CONSTRAINT "Esami_CorsoDiStudi_fkey" FOREIGN KEY ("CorsoDiStudi") REFERENCES "CorsoDiStudi"("CodiceCorsoDiStudi");


--
-- TOC entry 2037 (class 2606 OID 16689)
-- Name: Esami_Corso_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esame"
    ADD CONSTRAINT "Esami_Corso_fkey" FOREIGN KEY ("Corso") REFERENCES "Corso"("CodiceCorso");


--
-- TOC entry 2038 (class 2606 OID 16694)
-- Name: Esami_Studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esame"
    ADD CONSTRAINT "Esami_Studente_fkey" FOREIGN KEY ("Studente") REFERENCES "Studente"("CF");


--
-- TOC entry 2031 (class 2606 OID 16637)
-- Name: Ingressi_AnnoAccademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingresso"
    ADD CONSTRAINT "Ingressi_AnnoAccademico_fkey" FOREIGN KEY ("AnnoAccademico") REFERENCES "AnnoAccademico"("CodiceAnno");


--
-- TOC entry 2032 (class 2606 OID 16642)
-- Name: Ingressi_CorsoDiStudi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingresso"
    ADD CONSTRAINT "Ingressi_CorsoDiStudi_fkey" FOREIGN KEY ("CorsoDiStudi") REFERENCES "CorsoDiStudi"("CodiceCorsoDiStudi");


--
-- TOC entry 2033 (class 2606 OID 16647)
-- Name: Ingressi_Studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingresso"
    ADD CONSTRAINT "Ingressi_Studente_fkey" FOREIGN KEY ("Studente") REFERENCES "Studente"("CF");


--
-- TOC entry 2034 (class 2606 OID 16652)
-- Name: Ingressi_TipoImmatricolazione_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingresso"
    ADD CONSTRAINT "Ingressi_TipoImmatricolazione_fkey" FOREIGN KEY ("TipoImmatricolazione") REFERENCES "TipoImmatricolazione"("TipoImmatricolazione");


--
-- TOC entry 2035 (class 2606 OID 16747)
-- Name: Ingresso_Tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingresso"
    ADD CONSTRAINT "Ingresso_Tempo_fkey" FOREIGN KEY ("Tempo") REFERENCES "Tempo"("IdTempo");


--
-- TOC entry 2041 (class 2606 OID 16712)
-- Name: Laurea_AnnoAccademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Laurea"
    ADD CONSTRAINT "Laurea_AnnoAccademico_fkey" FOREIGN KEY ("AnnoAccademico") REFERENCES "AnnoAccademico"("CodiceAnno");


--
-- TOC entry 2042 (class 2606 OID 16717)
-- Name: Laurea_CorsoDiStudi_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Laurea"
    ADD CONSTRAINT "Laurea_CorsoDiStudi_fkey" FOREIGN KEY ("CorsoDiStudi") REFERENCES "CorsoDiStudi"("CodiceCorsoDiStudi");


--
-- TOC entry 2043 (class 2606 OID 16722)
-- Name: Laurea_Studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Laurea"
    ADD CONSTRAINT "Laurea_Studente_fkey" FOREIGN KEY ("Studente") REFERENCES "Studente"("CF");


--
-- TOC entry 2044 (class 2606 OID 16757)
-- Name: Laurea_Tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Laurea"
    ADD CONSTRAINT "Laurea_Tempo_fkey" FOREIGN KEY ("Tempo") REFERENCES "Tempo"("IdTempo");


-- Completed on 2016-04-07 23:14:53

--
-- PostgreSQL database dump complete
--

