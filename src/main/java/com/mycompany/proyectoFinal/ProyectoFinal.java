
package com.mycompany.proyectoFinal;

import org.jpl7.Query;

public class ProyectoFinal {
    public static void main(String[] args) {
        String t1 = "consult('conocimiento.pl')";
        
        Query q1 = new Query(t1);
        System.out.println(t1+ " " + (q1.hasMoreSolutions()? "Satisfactorio" : "No se pudo acceder"));
        
        System.out.println("-----Iniciando suma----");
        
        String suma = "main.";
        Query q2 = new Query(suma);
        //String consulta = q2.oneSolution().get("C").toString();
        
        //System.out.println("La suma es: "+ consulta);
        System.out.println("Holaaa mundo");
        System.out.println("hola ddd");
        System.out.print("hola");
    }
}
