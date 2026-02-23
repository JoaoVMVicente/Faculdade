public class classe1 {
    public static int [] xy = {1000, 5000, 4900, 7000};
    public static String nome [] = {"João", "Pedro", "Sara", "Leia"};
    public static void mostrar(){ int imaior = 0, imenor = 0;
        int tot = xy.length;
        for(int i = 0; i < tot; i++){
            if (i == 0) { imaior = i; imenor = i; }
            if(xy[i] > xy[imaior]) {imaior = i;} 
            if(xy[i] < xy[imenor]) {imenor = i;}
        }
        System.out.println (String.format ("O valor maior %d %s", xy [imaior], nome [imaior]));
        System.out.println(String.format ("O valor menor %d %s", xy [imenor], nome [imenor]));
        
        
    }
    public static void main(String[] args) {
        mostrar();
    }
}