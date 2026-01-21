/* ==========================================================================
   PROYECTO: SUFICIENCIA BASES DE DATOS 2 - UEFA CHAMPIONS LEAGUE
   ESTUDIANTE: Jorge Alejandro De León Batres - 202111277
   
   ========================================================================== */

-- LIMPIEZA
DROP VIEW IF EXISTS v_palmarés_clubes;
DROP VIEW IF EXISTS v_goleadores_finales;
DROP VIEW IF EXISTS v_resumen_finales;
DROP TABLE IF EXISTS evento CASCADE;
DROP TABLE IF EXISTS alineacion CASCADE;
DROP TABLE IF EXISTS participacion_equipo CASCADE;
DROP TABLE IF EXISTS partido_final CASCADE;
DROP TABLE IF EXISTS record_historico_jugador CASCADE;
DROP TABLE IF EXISTS ranking_historico_club CASCADE;
DROP TABLE IF EXISTS arbitro CASCADE;
DROP TABLE IF EXISTS jugador CASCADE;
DROP TABLE IF EXISTS club CASCADE;
DROP TABLE IF EXISTS estadio CASCADE;
DROP TABLE IF EXISTS pais CASCADE;

-- 2. TABLAS CATÁLOGO 

-- PAIS
CREATE TABLE pais (
    cod_pais CHAR(3) NOT NULL,
    nombre_pais VARCHAR(100) NOT NULL,
    PRIMARY KEY (cod_pais)
);

-- ESTADIO
CREATE TABLE estadio (
    id_estadio SERIAL PRIMARY KEY,
    nombre_oficial VARCHAR(200) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    cod_pais CHAR(3),
    CONSTRAINT fk_estadio_pais FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais)
);

-- CLUB
CREATE TABLE club (
    id_club SERIAL PRIMARY KEY,
    nombre_oficial VARCHAR(200) NOT NULL UNIQUE,
    cod_pais CHAR(3),
    CONSTRAINT fk_club_pais FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais)
);

-- JUGADOR
CREATE TABLE jugador (
    id_jugador SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(200) NOT NULL,
    fecha_nacimiento DATE, 
    cod_pais_nacionalidad CHAR(3),
    CONSTRAINT fk_jugador_pais FOREIGN KEY (cod_pais_nacionalidad) REFERENCES pais(cod_pais)
);

-- ARBITRO
CREATE TABLE arbitro (
    id_arbitro SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(200) NOT NULL,
    cod_pais CHAR(3),
    CONSTRAINT fk_arbitro_pais FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais)
);

-- TABLAS TRANSACCIONALES 

-- PARTIDO_FINAL
CREATE TABLE partido_final (
    id_partido SERIAL PRIMARY KEY,
    temporada VARCHAR(9) NOT NULL,
    fecha DATE NOT NULL,
    id_estadio INT NOT NULL,
    id_arbitro INT,
    asistencia INT,
    resultado_local INT DEFAULT 0,
    resultado_visita INT DEFAULT 0,
    tipo_definicion VARCHAR(20) CHECK (tipo_definicion IN ('Regular', 'ExtraTime', 'Penales')) DEFAULT 'Regular',
    CONSTRAINT fk_partido_estadio FOREIGN KEY (id_estadio) REFERENCES estadio(id_estadio),
    CONSTRAINT fk_partido_arbitro FOREIGN KEY (id_arbitro) REFERENCES arbitro(id_arbitro)
);

-- PARTICIPACION_EQUIPO
CREATE TABLE participacion_equipo (
    id_partido INT NOT NULL,
    id_club INT NOT NULL,
    rol VARCHAR(10) CHECK (rol IN ('Local', 'Visita')) NOT NULL,
    nombre_entrenador VARCHAR(150),
    es_campeon BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_partido, id_club),
    CONSTRAINT fk_pe_partido FOREIGN KEY (id_partido) REFERENCES partido_final(id_partido),
    CONSTRAINT fk_pe_club FOREIGN KEY (id_club) REFERENCES club(id_club)
);

-- ALINEACION
CREATE TABLE alineacion (
    id_alineacion SERIAL PRIMARY KEY,
    id_partido INT NOT NULL,
    id_club INT NOT NULL,
    id_jugador INT NOT NULL,
    es_titular BOOLEAN DEFAULT TRUE,
    posicion VARCHAR(20), -- 'GK', 'DEF', 'MID', 'FWD'
    es_capitan BOOLEAN DEFAULT FALSE,
    minuto_entrada INT DEFAULT 0,
    minuto_salida INT,
    CONSTRAINT fk_ali_partido FOREIGN KEY (id_partido) REFERENCES partido_final(id_partido),
    CONSTRAINT fk_ali_club FOREIGN KEY (id_club) REFERENCES club(id_club),
    CONSTRAINT fk_ali_jugador FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador)
);

-- EVENTO
CREATE TABLE evento (
    id_evento SERIAL PRIMARY KEY,
    id_partido INT NOT NULL,
    id_club INT, 
    id_jugador INT NOT NULL,
    minuto INT, 
    tipo_evento VARCHAR(30) NOT NULL, 
    orden_penal INT, 
    nota_adicional VARCHAR(100),
    CONSTRAINT fk_evt_partido FOREIGN KEY (id_partido) REFERENCES partido_final(id_partido),
    CONSTRAINT fk_evt_club FOREIGN KEY (id_club) REFERENCES club(id_club),
    CONSTRAINT fk_evt_jugador FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador)
);

-- TABLAS DE ESTADÍSTICAS

-- RANKING_HISTORICO_CLUB
CREATE TABLE ranking_historico_club (
    id_club INT NOT NULL,
    posicion_ranking INT,
    titulos INT DEFAULT 0,
    participaciones INT DEFAULT 0,
    partidos_jugados INT DEFAULT 0,
    ganados INT DEFAULT 0,
    empatados INT DEFAULT 0,
    perdidos INT DEFAULT 0,
    goles_favor INT DEFAULT 0,
    goles_contra INT DEFAULT 0,
    puntos INT DEFAULT 0,
    diferencia_goles INT,
    PRIMARY KEY (id_club),
    CONSTRAINT fk_rank_club FOREIGN KEY (id_club) REFERENCES club(id_club)
);

-- RECORD_HISTORICO_JUGADOR
CREATE TABLE record_historico_jugador (
    id_jugador INT NOT NULL,
    total_apariciones INT DEFAULT 0,
    total_goles INT DEFAULT 0,
    PRIMARY KEY (id_jugador),
    CONSTRAINT fk_rec_jugador FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador)
);

-- ÍNDICES DE OPTIMIZACIÓN ---------------------------------

CREATE INDEX idx_partido_temporada ON partido_final(temporada);
CREATE INDEX idx_evento_tipo ON evento(tipo_evento);
CREATE INDEX idx_club_nombre ON club(nombre_oficial);

-- VISTAS UTILES -------------------------------------

CREATE VIEW v_resumen_finales AS
SELECT pf.temporada, cl.nombre_oficial AS local, cv.nombre_oficial AS visita, pf.resultado_local, pf.resultado_visita
FROM partido_final pf
JOIN participacion_equipo pel ON pf.id_partido = pel.id_partido AND pel.rol = 'Local'
JOIN participacion_equipo pev ON pf.id_partido = pev.id_partido AND pev.rol = 'Visita'
JOIN club cl ON pel.id_club = cl.id_club
JOIN club cv ON pev.id_club = cv.id_club;
