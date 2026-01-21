/* LIMPIEZA TOTAL*/
TRUNCATE TABLE evento, alineacion, participacion_equipo, partido_final, 
record_historico_jugador, ranking_historico_club, jugador, arbitro, club, estadio, pais 
RESTART IDENTITY CASCADE;

/* Independiente PAÍSES  */
INSERT INTO pais (cod_pais, nombre_pais) VALUES
-- Europa (Sedes y Clubes)
('ESP', 'España'), ('GER', 'Alemania'), ('ENG', 'Inglaterra'), ('ITA', 'Italia'),
('FRA', 'Francia'), ('POR', 'Portugal'), ('NED', 'Países Bajos'), ('AUT', 'Austria'),
('BEL', 'Bélgica'), ('SCO', 'Escocia'), ('UKR', 'Ucrania'), ('GRE', 'Grecia'),
('TUR', 'Turquía'), ('SUI', 'Suiza'), ('HUN', 'Hungría'), ('ROU', 'Rumania'),
('RUS', 'Rusia'), ('SRB', 'Serbia'), ('MNE', 'Montenegro'), ('CRO', 'Croacia'),
('POL', 'Polonia'), ('FIN', 'Finlandia'), ('SWE', 'Suecia'), ('WAL', 'Gales'),
('NOR', 'Noruega'), ('CZE', 'República Checa'),
-- América y África (Nacionalidades Jugadores)
('BRA', 'Brasil'), ('ARG', 'Argentina'), ('GHA', 'Ghana'), ('LBR', 'Liberia'),
('NGA', 'Nigeria'), ('CIV', 'Costa de Marfil'), ('CMR', 'Camerún'), ('EGY', 'Egipto'),
('CHI', 'Chile');
INSERT INTO pais (cod_pais, nombre_pais) values
('BUL', 'Bulgaria');
/* Depende de Pais
   2. CATÁLOGO: ESTADIOS 
*/
INSERT INTO estadio (nombre_oficial, ciudad, cod_pais) VALUES
('Olympiastadion', 'Munich', 'GER'),          -- ID 1
('Olympic Stadium', 'Athens', 'GRE'),           -- ID 2
('Ernst-Happel-Stadion', 'Vienna', 'AUT'),      -- ID 3
('Stadio Olimpico', 'Rome', 'ITA'),             -- ID 4
('Olympiastadion', 'Berlin', 'GER'),            -- ID 5
('Wembley Stadium', 'London', 'ENG'),           -- ID 6
('Camp Nou', 'Barcelona', 'ESP'),               -- ID 7
('Stade de France', 'Saint-Denis', 'FRA'),      -- ID 8
('San Siro', 'Milan', 'ITA'),                   -- ID 9
('Hampden Park', 'Glasgow', 'SCO'),             -- ID 10
('Old Trafford', 'Manchester', 'ENG'),          -- ID 11
('Estádio da Luz', 'Lisbon', 'POR'),            -- ID 12
('Atatürk Olympic Stadium', 'Istanbul', 'TUR'), -- ID 13
('Stade de Suisse', 'Berne', 'SUI'),            -- ID 14
('Luzhniki Stadium', 'Moscow', 'RUS');          -- ID 15

/* ÁRBITROS  */
INSERT INTO arbitro (nombre_completo, cod_pais) VALUES
('Kurt Röthlisberger', 'SUI'),  -- ID 1 (Final 1993)
('Manuel Diaz Vega', 'ESP'),    -- ID 2 (Final 1996)
('Philip Don', 'ENG'),          -- ID 3 (Final 1994)
('Sandor Puhl', 'HUN'),         -- ID 4 (Final 1997)
('Ion Craciunescu', 'ROU'),     -- ID 5 (Final 1995)
('Hellmut Krug', 'GER'),        -- ID 6
('Pierluigi Collina', 'ITA');   -- ID 7

/* CLUBES */
INSERT INTO club (nombre_oficial, cod_pais) VALUES
('Real Madrid CF', 'ESP'),           -- ID 1
('FC Bayern München', 'GER'),        -- ID 2
('FC Barcelona', 'ESP'),             -- ID 3
('Manchester United FC', 'ENG'),     -- ID 4
('Juventus', 'ITA'),                 -- ID 5
('Liverpool FC', 'ENG'),             -- ID 6
('AC Milan', 'ITA'),                 -- ID 7
('SL Benfica', 'POR'),               -- ID 8
('FC Porto', 'POR'),                 -- ID 9
('AFC Ajax', 'NED'),                 -- ID 10
('Chelsea FC', 'ENG'),               -- ID 11
('FC Internazionale Milano', 'ITA'), -- ID 12
('Arsenal FC', 'ENG'),               -- ID 13
('Borussia Dortmund', 'GER'),        -- ID 14
('Manchester City FC', 'ENG'),       -- ID 15
('Olympique de Marseille', 'FRA');   -- ID 16

/* JUGADORES */
INSERT INTO jugador (nombre_completo, cod_pais_nacionalidad) VALUES
('Cristiano Ronaldo', 'POR'), ('Lionel Messi', 'ARG'), ('Robert Lewandowski', 'POL'),
('Karim Benzema', 'FRA'), ('Raúl González', 'ESP'), ('Paolo Maldini', 'ITA'),
('Clarence Seedorf', 'NED'), ('Edwin van der Sar', 'NED'), ('Iker Casillas', 'ESP'),
('Ryan Giggs', 'WAL'),
('Fabien Barthez', 'FRA'), ('Basile Boli', 'FRA'), ('Didier Deschamps', 'FRA'),
('Abedi Pelé', 'GHA'), ('Rudi Völler', 'GER'),
('Franco Baresi', 'ITA'), ('Alessandro Costacurta', 'ITA'), ('Frank Rijkaard', 'NED'),
('Marco van Basten', 'NED'), ('Daniele Massaro', 'ITA'), ('Marcel Desailly', 'FRA'),
('Dejan Savićević', 'SRB'), ('Zvonimir Boban', 'CRO'), ('George Weah', 'LBR'),
('Christian Panucci', 'ITA'),
('Andoni Zubizarreta', 'ESP'), ('Ronald Koeman', 'NED'), ('Pep Guardiola', 'ESP'),
('Hristo Stoichkov', 'BUL'), ('Romário', 'BRA'), ('Miguel Ángel Nadal', 'ESP'),
('Guillermo Amor', 'ESP'),
('Jari Litmanen', 'FIN'), ('Patrick Kluivert', 'NED'), ('Edgar Davids', 'NED'),
('Frank de Boer', 'NED'), ('Marc Overmars', 'NED'),
('Alessandro Del Piero', 'ITA'), ('Fabrizio Ravanelli', 'ITA'), ('Gianluca Vialli', 'ITA'),
('Antonio Conte', 'ITA'), ('Angelo Peruzzi', 'ITA');
INSERT INTO jugador (nombre_completo, cod_pais_nacionalidad) VALUES
-- Marsella 1993
('Jocelyn Angloma', 'FRA'), ('Eric Di Meco', 'FRA'), ('Franck Sauzée', 'FRA'), 
('Jean-Jacques Eydelie', 'FRA'), ('Alen Bokšić', 'CRO'),
-- Milan 1993/94/95 (Complementos)
('Mauro Tassotti', 'ITA'), ('Demetrio Albertini', 'ITA'), ('Gianluigi Lentini', 'ITA'), 
('Roberto Donadoni', 'ITA'), ('Sebastiano Rossi', 'ITA'), 
-- Ajax 1995/96
('Michael Reiziger', 'NED'), ('Danny Blind', 'NED'), ('Finidi George', 'NGA'), 
('Nwankwo Kanu', 'NGA'), ('Ronald de Boer', 'NED'), ('Sonny Silooy', 'NED'),
-- Juventus 1996
('Ciro Ferrara', 'ITA'), ('Moreno Torricelli', 'ITA'), ('Pietro Vierchowod', 'ITA'), 
('Paulo Sousa', 'POR'), ('Vladimir Jugović', 'SRB'), ('Gianluca Pessotto', 'ITA'),
-- Man Utd / Liverpool / Otros para completar Ranking y Records
('Ryan Giggs', 'WAL'), ('Paul Scholes', 'ENG'), ('Xavi Hernández', 'ESP'), 
('Andrés Iniesta', 'ESP'), ('Thomas Müller', 'GER'), ('Sergio Ramos', 'ESP'), 
('Zlatan Ibrahimović', 'SWE'), ('Thierry Henry', 'FRA');

/*  PARTIDO FINAL */
INSERT INTO partido_final (temporada, fecha, id_estadio, id_arbitro, asistencia, resultado_local, resultado_visita, tipo_definicion) VALUES
('1992/93', '1993-05-26', 1, 1, 64400, 1, 0, 'Regular'), -- Munich
('1993/94', '1994-05-18', 2, 3, 70000, 4, 0, 'Regular'), -- Atenas
('1994/95', '1995-05-24', 3, 5, 49730, 1, 0, 'Regular'), -- Viena
('1995/96', '1996-05-23', 4, 2, 70000, 1, 1, 'Penales'); -- Roma

/* PARTICIPACIÓN EQUIPO */
INSERT INTO participacion_equipo (id_partido, id_club, rol, nombre_entrenador, es_campeon) VALUES
-- 1993: Marsella (16) vs Milan (7)
(1, 16, 'Local', 'Raymond Goethals', TRUE),
(1, 7, 'Visita', 'Fabio Capello', FALSE),
-- 1994: Milan (7) vs Barcelona (3)
(2, 7, 'Local', 'Fabio Capello', TRUE),
(2, 3, 'Visita', 'Johan Cruyff', FALSE),
-- 1995: Ajax (10) vs Milan (7)
(3, 10, 'Local', 'Louis van Gaal', TRUE),
(3, 7, 'Visita', 'Fabio Capello', FALSE),
-- 1996: Ajax (10) vs Juventus (5) - Nota: En la final real Juve fue local admin, ajusta según necesidad
(4, 5, 'Local', 'Marcello Lippi', TRUE),
(4, 10, 'Visita', 'Louis van Gaal', FALSE);

/*  EVENTOS / GOLES  */
INSERT INTO evento (id_partido, id_club, id_jugador, minuto, tipo_evento) VALUES
(1, 16, 12, 43, 'Gol'),
(2, 7, 20, 22, 'Gol'),
(2, 7, 20, 45, 'Gol'),
(2, 7, 22, 47, 'Gol'),
(2, 7, 21, 58, 'Gol'),
(3, 10, 34, 85, 'Gol'),
(4, 5, 39, 13, 'Gol'),
(4, 10, 33, 41, 'Gol');

/* ==========================================================================
   9. TRANSACCIONAL: ALINEACIÓN TITULAR - Ejemplo Final 1994 (Nivel 5)
   ========================================================================== */
-- MILAN (Campeón 1994)
INSERT INTO alineacion (id_partido, id_club, id_jugador, es_titular, posicion) VALUES
(2, 7, 6, TRUE, 'DEF'),   -- Maldini
(2, 7, 21, TRUE, 'MID'),  -- Desailly
(2, 7, 23, TRUE, 'MID'),  -- Boban
(2, 7, 22, TRUE, 'FWD'),  -- Savicevic
(2, 7, 20, TRUE, 'FWD'),  -- Massaro
(2, 7, 25, TRUE, 'DEF');  -- Panucci

-- BARCELONA (Subcampeón 1994)
INSERT INTO alineacion (id_partido, id_club, id_jugador, es_titular, posicion) VALUES
(2, 3, 26, TRUE, 'GK'),   -- Zubizarreta
(2, 3, 27, TRUE, 'DEF'),  -- Koeman
(2, 3, 28, TRUE, 'MID'),  -- Guardiola
(2, 3, 29, TRUE, 'FWD'),  -- Stoichkov
(2, 3, 30, TRUE, 'FWD'),  -- Romario
(2, 3, 31, TRUE, 'DEF');  -- Nadal

-- --- FINAL 1993: MARSELLA (ID Partido 1, Club ID 16) ---
INSERT INTO alineacion (id_partido, id_club, id_jugador, es_titular, posicion) VALUES
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Fabien Barthez'), TRUE, 'GK'),
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Jocelyn Angloma'), TRUE, 'DEF'),
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Basile Boli'), TRUE, 'DEF'),
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Marcel Desailly'), TRUE, 'DEF'),
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Eric Di Meco'), TRUE, 'DEF'),
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Franck Sauzée'), TRUE, 'MID'),
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Jean-Jacques Eydelie'), TRUE, 'MID'),
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Didier Deschamps'), TRUE, 'MID'),
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Abedi Pelé'), TRUE, 'FWD'),
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Rudi Völler'), TRUE, 'FWD'),
(1, 16, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Alen Bokšić'), TRUE, 'FWD');

-- --- FINAL 1993: MILAN (ID Partido 1, Club ID 7) ---
INSERT INTO alineacion (id_partido, id_club, id_jugador, es_titular, posicion) VALUES
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Sebastiano Rossi'), TRUE, 'GK'),
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Mauro Tassotti'), TRUE, 'DEF'),
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Paolo Maldini'), TRUE, 'DEF'),
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Franco Baresi'), TRUE, 'DEF'),
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Alessandro Costacurta'), TRUE, 'DEF'),
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Frank Rijkaard'), TRUE, 'MID'),
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Demetrio Albertini'), TRUE, 'MID'),
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Gianluigi Lentini'), TRUE, 'MID'),
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Roberto Donadoni'), TRUE, 'MID'),
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Marco van Basten'), TRUE, 'FWD'),
(1, 7, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Daniele Massaro'), TRUE, 'FWD');

-- --- FINAL 1995: AJAX (ID Partido 3, Club ID 10) ---
INSERT INTO alineacion (id_partido, id_club, id_jugador, es_titular, posicion) VALUES
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Edwin van der Sar'), TRUE, 'GK'),
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Michael Reiziger'), TRUE, 'DEF'),
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Danny Blind'), TRUE, 'DEF'),
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Frank de Boer'), TRUE, 'DEF'),
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Frank Rijkaard'), TRUE, 'MID'),
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Clarence Seedorf'), TRUE, 'MID'),
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Edgar Davids'), TRUE, 'MID'),
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Jari Litmanen'), TRUE, 'FWD'),
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Finidi George'), TRUE, 'FWD'),
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Marc Overmars'), TRUE, 'FWD'),
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Ronald de Boer'), TRUE, 'FWD');
-- Nota: Kluivert entró de cambio y metió gol, lo agregamos como suplente
INSERT INTO alineacion (id_partido, id_club, id_jugador, es_titular, posicion, minuto_entrada) VALUES
(3, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Patrick Kluivert'), FALSE, 'FWD', 70);

-- --- FINAL 1996: JUVENTUS (ID Partido 4, Club ID 5) ---
INSERT INTO alineacion (id_partido, id_club, id_jugador, es_titular, posicion) VALUES
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Angelo Peruzzi'), TRUE, 'GK'),
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Ciro Ferrara'), TRUE, 'DEF'),
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Moreno Torricelli'), TRUE, 'DEF'),
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Pietro Vierchowod'), TRUE, 'DEF'),
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Gianluca Pessotto'), TRUE, 'DEF'),
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Antonio Conte'), TRUE, 'MID'),
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Paulo Sousa'), TRUE, 'MID'),
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Didier Deschamps'), TRUE, 'MID'), -- Jugó en Juve en el 96
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Alessandro Del Piero'), TRUE, 'FWD'),
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Gianluca Vialli'), TRUE, 'FWD'),
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Fabrizio Ravanelli'), TRUE, 'FWD');

/* RECORD HISTÓRICO Y RANKING  */
-- Ranking Clubes (Datos PDF Records)
INSERT INTO ranking_historico_club (id_club, posicion_ranking, titulos, participaciones, partidos_jugados, ganados, empatados, perdidos, goles_favor, goles_contra, puntos, diferencia_goles) VALUES
(1, 1, 14, 53, 476, 285, 81, 110, 1047, 521, 651, 526), -- Real Madrid
(2, 2, 6, 39, 382, 229, 76, 77, 804, 373, 534, 431),    -- Bayern
(3, 3, 5, 33, 339, 197, 76, 66, 667, 343, 470, 324);    -- Barcelona

-- Récord Jugadores (Datos PDF Records)
INSERT INTO record_historico_jugador (id_jugador, total_apariciones, total_goles) VALUES
(1, 183, 140), -- Cristiano Ronaldo
(2, 163, 129), -- Messi
(3, 111, 91),  -- Lewandowski
(4, 150, 86),  -- Benzema
(5, 142, 71);  -- Raúl

/* RECORD JUGADORES (Más apariciones all-time) */
INSERT INTO record_historico_jugador (id_jugador, total_apariciones, total_goles) VALUES
(10, 177, 0),
((SELECT id_jugador FROM jugador WHERE nombre_completo = 'Xavi Hernández'), 151, 11),
((SELECT id_jugador FROM jugador WHERE nombre_completo = 'Ryan Giggs'), 145, 28),
((SELECT id_jugador FROM jugador WHERE nombre_completo = 'Thomas Müller'), 142, 53),
((SELECT id_jugador FROM jugador WHERE nombre_completo = 'Raúl González'), 142, 71),
((SELECT id_jugador FROM jugador WHERE nombre_completo = 'Sergio Ramos'), 137, 15),
((SELECT id_jugador FROM jugador WHERE nombre_completo = 'Paolo Maldini'), 135, 3);
select * from record_historico_jugador;

/* RANKING HISTÓRICO (Top 4 al 10) */
INSERT INTO ranking_historico_club (id_club, posicion_ranking, titulos, participaciones, partidos_jugados, ganados, empatados, perdidos, goles_favor, goles_contra, puntos, diferencia_goles) VALUES
(4, 4, 3, 30, 293, 160, 69, 64, 533, 284, 389, 249),  -- Manchester United
(5, 5, 2, 37, 301, 153, 70, 78, 479, 301, 376, 178),  -- Juventus
(7, 6, 7, 31, 273, 133, 69, 71, 442, 258, 335, 184),  -- AC Milan
(6, 7, 6, 27, 248, 143, 50, 55, 472, 228, 336, 244),  -- Liverpool (Puntos ajustados por victorias de 2pts en antiguedad)
(8, 8, 2, 42, 287, 130, 67, 90, 475, 332, 327, 143),  -- Benfica
(9, 9, 2, 37, 277, 126, 61, 90, 408, 306, 313, 102),  -- Porto
(10, 10, 4, 39, 247, 112, 64, 71, 396, 282, 288, 114); -- Ajax


select * from ranking_historico_club;

/* TANDA DE PENALES 1996 (Ajax vs Juve) */
-- Ferrara anota (Juve)
INSERT INTO evento (id_partido, id_club, id_jugador, tipo_evento, orden_penal) VALUES
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Ciro Ferrara'), 'Penal_Anotado', 1);
-- Litmanen anota (Ajax)
INSERT INTO evento (id_partido, id_club, id_jugador, tipo_evento, orden_penal) VALUES
(4, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Jari Litmanen'), 'Penal_Anotado', 2);
-- Pessotto anota (Juve)
INSERT INTO evento (id_partido, id_club, id_jugador, tipo_evento, orden_penal) VALUES
(4, 5, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Gianluca Pessotto'), 'Penal_Anotado', 3);
-- Davids falla (Ajax - Atajado o Fuera)
INSERT INTO evento (id_partido, id_club, id_jugador, tipo_evento, orden_penal) VALUES
(4, 10, (SELECT id_jugador FROM jugador WHERE nombre_completo = 'Edgar Davids'), 'Penal_Fallado', 4);
