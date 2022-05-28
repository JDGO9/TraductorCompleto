/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Complementos;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author Kathya Ortiz
 */
public class AnalizadorLexicoS {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        
        String ruta1 = "C:/Users/Kathya Ortiz/Documents/NetBeansProjects/AnalizadorLexicoS/src/Complementos/Lexer.flex";
        String ruta2 = "C:/Users/Kathya Ortiz/Documents/NetBeansProjects/AnalizadorLexicoS/src/Complementos/LexerCup.flex";
        String[] rutaS = {"-parser", "Sintax", "C:/Users/Kathya Ortiz/Documents/NetBeansProjects/AnalizadorLexicoS/src/Complementos/Sintax.cup"};
        generar(ruta1,ruta2,rutaS);
        //generar(rutaS);
    }
    
     public static void generar(String ruta1,String ruta2,String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo = new File(ruta2);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("C:/Users/Kathya Ortiz/Documents/NetBeansProjects/AnalizadorLexicoS/src/Complementos/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:/Users/Kathya Ortiz/Documents/NetBeansProjects/AnalizadorLexicoS/sym.java"), 
                Paths.get("C:/Users/Kathya Ortiz/Documents/NetBeansProjects/AnalizadorLexicoS/src/Complementos/sym.java")
        );
        Path rutaSin = Paths.get("C:/Users/Kathya Ortiz/Documents/NetBeansProjects/AnalizadorLexicoS/src/Complementos/Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("C:/Users/Kathya Ortiz/Documents/NetBeansProjects/AnalizadorLexicoS/Sintax.java"), 
                Paths.get("C:/Users/Kathya Ortiz/Documents/NetBeansProjects/AnalizadorLexicoS/src/Complementos/Sintax.java")
        );
    }
    
}

