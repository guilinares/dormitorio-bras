-- Inserir dormitórios se não existirem
INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '1', 'Central (Menor)', 30 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '1');

INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '2', 'Central (Maior)', 67 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '2');

INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '3', 'Salão de Jovens', 47 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '3');

INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '4', 'Ipanema I', 22 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '4');

INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '5', 'Ipanema II', 15 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '5');

INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '6', 'Ipanema III', 15 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '6');

INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '7', 'Visconde I', 26 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '7');

INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '8', 'Visconde II', 61 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '8');

INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '9', 'Visconde III', 27 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '9');

INSERT INTO dormitorio (dormitorio_id, nome, capacidade)
SELECT '10', 'Enfermos', 6 WHERE NOT EXISTS (SELECT 1 FROM dormitorio WHERE dormitorio_id = '10');

-- Inserir todos os leitos (1-318) com verificação
-- Central (Menor) - Leitos 1-30
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '1', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '1');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '2', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '2');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '3', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '3');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '4', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '4');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '5', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '5');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '6', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '6');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '7', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '7');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '8', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '8');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '9', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '9');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '10', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '10');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '11', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '11');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '12', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '12');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '13', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '13');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '14', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '14');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '15', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '15');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '16', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '16');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '17', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '17');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '18', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '18');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '19', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '19');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '20', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '20');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '21', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '21');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '22', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '22');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '23', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '23');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '24', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '24');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '25', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '25');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '26', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '26');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '27', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '27');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '28', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '28');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '29', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '29');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '30', '1' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '30');

-- Central (Maior) - Leitos 31-97
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '31', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '31');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '32', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '32');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '33', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '33');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '34', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '34');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '35', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '35');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '36', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '36');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '37', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '37');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '38', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '38');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '39', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '39');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '40', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '40');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '41', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '41');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '42', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '42');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '43', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '43');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '44', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '44');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '45', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '45');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '46', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '46');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '47', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '47');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '48', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '48');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '49', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '49');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '50', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '50');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '51', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '51');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '52', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '52');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '53', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '53');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '54', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '54');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '55', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '55');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '56', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '56');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '57', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '57');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '58', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '58');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '59', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '59');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '60', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '60');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '61', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '61');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '62', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '62');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '63', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '63');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '64', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '64');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '65', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '65');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '66', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '66');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '67', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '67');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '68', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '68');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '69', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '69');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '70', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '70');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '71', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '71');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '72', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '72');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '73', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '73');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '74', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '74');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '75', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '75');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '76', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '76');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '77', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '77');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '78', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '78');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '79', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '79');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '80', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '80');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '81', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '81');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '82', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '82');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '83', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '83');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '84', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '84');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '85', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '85');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '86', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '86');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '87', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '87');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '88', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '88');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '89', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '89');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '90', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '90');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '91', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '91');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '92', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '92');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '93', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '93');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '94', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '94');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '95', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '95');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '96', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '96');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '97', '2' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '97');
-- [Continuação para os leitos 33-97...]

-- Salão de Jovens - Leitos 98-144
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '98', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '98');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '99', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '99');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '100', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '100');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '101', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '101');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '102', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '102');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '103', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '103');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '104', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '104');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '105', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '105');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '106', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '106');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '107', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '107');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '108', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '108');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '109', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '109');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '110', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '110');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '111', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '111');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '112', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '112');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '113', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '113');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '114', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '114');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '115', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '115');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '116', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '116');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '117', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '117');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '118', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '118');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '119', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '119');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '120', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '120');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '121', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '121');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '122', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '122');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '123', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '123');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '124', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '124');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '125', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '125');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '126', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '126');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '127', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '127');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '128', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '128');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '129', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '129');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '130', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '130');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '131', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '131');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '132', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '132');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '133', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '133');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '134', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '134');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '135', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '135');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '136', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '136');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '137', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '137');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '138', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '138');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '139', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '139');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '140', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '140');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '141', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '141');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '142', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '142');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '143', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '143');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '144', '3' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '144');
-- [Continuação para os leitos 99-144...]

-- Ipanema I - Leitos 145-166
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '145', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '146', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '147', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '148', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '149', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '150', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '151', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '152', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '153', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '154', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '155', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '156', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '157', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '158', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '159', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '160', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '161', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '162', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '163', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '164', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '165', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '166', '4' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '145');
-- [Continuação para os leitos 146-166...]

-- Ipanema II - Leitos 167-174 e 295-301
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '167', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '168', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '169', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '170', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '171', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '172', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '173', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '174', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '295', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '296', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '297', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '298', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '299', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '300', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '301', '5' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '167');
-- [Continuação para os demais leitos...]

-- Ipanema III - Leitos 175-189
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '175', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '176', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '177', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '178', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '179', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '180', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '181', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '182', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '183', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '184', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '185', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '186', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '187', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '188', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '189', '6' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '175');
-- [Continuação para os leitos 176-189...]

-- Visconde I - Leitos 190-215
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '190', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '191', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '192', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '193', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '194', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '195', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '196', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '197', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '198', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '199', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '200', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '201', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '202', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '203', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '204', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '205', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '206', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '207', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '208', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '209', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '210', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '211', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '212', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '213', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '214', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '215', '7' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '190');
-- [Continuação para os leitos 191-215...]

-- Visconde II - Leitos 216-278
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '216', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '217', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '218', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '219', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '220', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '221', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '222', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '223', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '224', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '225', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '226', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '227', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '228', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '229', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '230', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '231', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '232', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '233', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '234', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '235', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '236', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '237', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '238', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '239', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '240', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '241', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '242', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '243', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '244', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '245', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '246', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '247', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '248', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '249', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '250', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '251', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '252', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '253', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '254', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '255', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '256', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '257', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '258', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '259', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '260', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '261', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '262', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '263', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '264', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '265', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '266', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '267', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '268', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '269', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '270', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '271', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '272', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '273', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '274', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '275', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '276', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '277', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '278', '8' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '216');
-- [Continuação para os leitos 217-278...]

-- Visconde III - Leitos 279-294 e 308-318
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '279', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '280', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '281', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '282', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '283', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '284', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '285', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '286', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '287', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '288', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '289', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '290', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '291', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '292', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '293', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '294', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '308', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '309', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '310', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '311', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '312', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '313', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '314', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '315', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '316', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '317', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '318', '9' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '279');
-- [Continuação para os leitos 280-294 e 308-318...]

-- Enfermos - Leitos 302-307
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '302', '10' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '302');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '303', '10' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '303');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '304', '10' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '304');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '305', '10' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '305');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '306', '10' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '306');
INSERT INTO leitos (numero_leito, dormitorio_id) SELECT '307', '10' WHERE NOT EXISTS (SELECT 1 FROM leitos WHERE numero_leito = '307');