CREATE DATABASE IF NOT EXISTS db_escola;
USE db_escola;

DELIMITER $$

CREATE PROCEDURE sp_calcular_media(
    IN p_nota1 DECIMAL(4,2),
    IN p_nota2 DECIMAL(4,2),
    IN p_nota3 DECIMAL(4,2),
    IN p_nota4 DECIMAL(4,2)
)
BEGIN
    DECLARE v_media DECIMAL(4,2);

    IF (p_nota1 < 0 OR p_nota1 > 10) OR
       (p_nota2 < 0 OR p_nota2 > 10) OR
       (p_nota3 < 0 OR p_nota3 > 10) OR
       (p_nota4 < 0 OR p_nota4 > 10) THEN
       
        SELECT 'Erro: Todas as notas devem estar entre 0.00 e 10.00' AS Mensagem_Erro;
        
    ELSE
        
        SET v_media = (p_nota1 + p_nota2 + p_nota3 + p_nota4) / 4;
        
       
        SELECT 
            p_nota1 AS Nota_1,
            p_nota2 AS Nota_2,
            p_nota3 AS Nota_3,
            p_nota4 AS Nota_4,
            v_media AS Media_Final;
    END IF;
END $$

DELIMITER ;

CALL sp_calcular_media (8.5, 2.6, 10.0, 1.3);