package Laboratório;

import javax.swing.JOptionPane;

public class ExercicioA {
    public static void main(String[] args) {
        // 1. Exemplo de Leitura (Input)
        String nome = JOptionPane.showInputDialog("Digite seu nome:");

        // 2. Exemplo de Composição de String
        String mensagem = "Olá, " + nome + "! Bem-vindo ao Laboratório 1.";

        // 3. Exemplo de Exibição (Output)
        JOptionPane.showMessageDialog(null, mensagem);
        
        // Exemplo simples com Vetor (conforme pedido no enunciado)
        int[] numeros = {10, 20, 30};
        JOptionPane.showMessageDialog(null, "O primeiro valor do vetor é: " + numeros[0]);
    }
}