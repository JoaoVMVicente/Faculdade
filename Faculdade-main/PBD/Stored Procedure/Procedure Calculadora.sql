CREATE DATABASE db_calculadora;
USE db_calculadora;

DELIMITER $$

CREATE PROCEDURE sp_calculadora(
	IN p_operacao VARCHAR (1),
    IN p_numero1 DECIMAL (10,2),
    IN p_numero2 DECIMAL (10,2)
)
BEGIN
	DECLARE v_resultado DECIMAL (10,2);
    
    CASE p_operacao
		WHEN '+' then
			SET v_resultado = p_numero1 + p_numero2;
            SELECT v_resultado AS Resultado;
            
		WHEN '-' then
			SET v_resultado = p_numero1 - p_numero2;
            SELECT v_resultado AS Resultado;
            
		WHEN '*' then
			SET v_resultado = p_numero1 * p_numero2;
            SELECT v_resultado AS Resultado;
            
		WHEN '/' then
			IF p_numero2 = 0 THEN
				SELECT 'Erro: Divisão por zero não é permitido!' AS Mensagem_Erro;
			ELSE
				SET v_resultado = p_numero1 / p_numero2;
				SELECT v_resultado AS Resultado;
			END IF;
		ELSE
			SELECT 'Erro: Operação Inválida! Use apenas +,-,* e /.' AS Mensagem_Erro;
	END CASE;
END $$

DELIMITER ; 

CALL sp_calculadora ('+', 10, 25);
            