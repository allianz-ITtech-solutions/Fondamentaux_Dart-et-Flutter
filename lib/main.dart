import 'package:flutter/material.dart'; // C'est ce package qui offre les composants graphiques en flutter

// NB : On a une seule page qui est main.dart
// Main.dart représente notre index

// La méthode main
void main() {
  runApp(const MyApp());
}

// Stateful change l'état d'un widget, et peut modifier ses données.
// Par exple, au clic sur le widget, la couleur peut changer, l'affichage peut changer, etc...
// StatelessWidget est une classe qui ne garde pas d'état, ni ne modifie les données lorsqu'elles sont passées.
// Par exemple, une appbar ne garde pas ni ne change d'état.
// NB : MyApp hérite de 'StatelessWidget'. Il faut toujours avoir la classe MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // La méthode build est utilisé pour construire le widget.
  // C'est l'équivalent du ngOnInit en Angular.
  // On redéfinit la méthode build
  @override
  Widget build(BuildContext context) {
    // build va créer la classe MaterialApp qui est le plugin de flutter qui contient les widgets pour la réalisation d'interfaces graphique sur flutter
    // MaterialApp va aussi communiquer avec les éléments internes de la machine.
    // MaterialApp a plusieurs attributs.
    // NB : 'MaterialApp' est l'équivalent de la fenetre et 'MyHomePage' c'est la page.
    return MaterialApp( // La classe qui contient toutes les ressources pour créer nos interfaces graphiques
      debugShowCheckedModeBanner: false, // Pour enlever la barre debug à droite de notre application.
      // Le titre de l'appli
      title: 'Flutter Demo',
      // Le thème de l'appli
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // home est un attribut qui crée un autre widget appelé 'MyHomePage' qui représente notre page.
      // Du coup au démarrage on aura une seule page
      // NB : Par défaut la page (MyHomePage) est StateFul, elle peut donc etre rechargé et etre modifiée
      // NB : home représente la zone de la page ou on peut poser des composants
      home: const MyHomePage(),
    );
  }
}

// Cette classe représente la page.
//C'est elle qu'on va afficher car c'est elle qu'on mettra dans le 'home'
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // On crée une liste de Maps
    // Chaque éléments sera une Map. Chaque map contiendra une icone et la couleur à donner à l'icone
    List<Map<String, dynamic>> myIcons = [
      {
        "color" : Colors.black12,
        "icon" : Icons.add_alert
      },
      {
        "color" : Colors.green,
        "icon" : Icons.shop,
      },
      {
        "color" : Colors.amber,
        "icon" : Icons.cancel,
      }

    ];

    // Au lieu de créer la liste, on peut créer une map
    // Une Map prend en paramètre, le type de la clé et le type de la valeur
    // NB : Comme le type des données peut changer (les valeurs), on met en Dynamic
    // Map<String, dynamic> myIconsMap = {
    //   "color" : Colors.black12,
    //   "icon" : Icons.add_alert
    // };

    // Dans une appli flutter, de base il n'ya pas d'organisation. Pas de layout.
    // C'est comme si on créait une page html sans head ni body
    // Il faut donc qu'on crée un layout et c'est scaffold qui nous le donne. 
    /*
     Le Scaffold a des zones. Il a 3 parties. Le appbar, le drawer (qu'on appelle le menu-tiroir)
     et le body qui représente le corps de la page.
     
     En utilisant Scaffold on a un layout qui est une structure de base d'une page
    */
    return Scaffold(

       // La barre d'entete
      appBar: AppBar(
        // Le titre de la page
        title: const Text("Home Page"),
        // Ici les couleurs sont représentés sous forme d'énumération.
        backgroundColor: Colors.grey,

        // Un appbar peut avoir plusieurs actions
        actions: [
          // On parcourt la liste des icones. Comme les données sont diverses dans une map, on met 'dynamic'
          for (dynamic val in myIcons)
          // Dès qu'on parcourt la liste, il affichera les icones
          Padding(
            // On donne un padding à droite sur l'icone
            padding: const EdgeInsets.only(right: 10),
          // Un bouton icone
            child: IconButton(
              // On spécifie l'icone qu'on veut
              // icon: const Icon(Icons.abc_outlined, color: Colors.amber),

              // On affiche les icones de la liste
              icon: Icon(val['icon'], color: val['color']),
              tooltip: 'Show Snackbar',
              // On spécifie la méthode qui sera exécutée sur l'event onPressed, quand on clic sur l'icone
              onPressed: () {
                print("Bonjour");
              } ,
              ),
          )
        ],
      ),
      
      // Les 3 traits en haut de la page
      drawer: Drawer(
      // Ajouter une ListView au drawer. Cela permet à l'utilisateur de faire défiler
      // les options dans le tiroir s'il n'y a pas assez d'espace vertical pour tout afficher.
      child: ListView(
        // Important : Supprimer tout le padding de la ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    ),

      /*
        ListView est organisé suivant l'élément qu'il contient.
        Quand des éléments débordent sur une colonne ou une ligne, on peut ajouter un scroll
        pour pouvoir défiler grace à ListView. Ainsi si c'est un Column le scroll sera vertical et
        si c'est un Row, le scroll sera horizontal.
      */
      body: ListView(
        // NB : On peut changer la direction du scroll d'un Column ou d'un Row suivant le besoin
        // scrollDirection: Axis.horizontal,
        children: [
          // Comme on veut que chaque ligne soit répété 3 fois, on met les carré dans un column
          Column(
            children: [
              // NB : Un body peut etre du type qu'on le souhaite selon le besoin dans un scaffold.
              // Un Row est une classe de type flex permettant de ranger des éléments sur une ligne.
              for(int j=1; j<=10; j++)
              Row(
                      /*
                        Un Row a des orientations. Un axe principal (mainAxisAlignement) et axe secondaire
                        (crossAxisAlignment).
              
                        Par défaut il oriente les éléments sur l'axe horizontal qui est l'axe principal
                        (un peu comme display flex en css) tandis que l'axe vertical est utilisé sur l'axe secondaire.
                      */
                      // On peut donner au mainAxisAlignment un center pour orienter l'élément de manière centrée
                      // Pour bien voir la différence, il faut mettre la boucle à <=2
                      // NB : On peut donner 'start', 'end', etc...
                      mainAxisAlignment: MainAxisAlignment.center,
              
                      // 'crossAxisAlignment' est l'axe verticale. C'est l'axe secondaire dans le row
                      // NB : Dans un Column, l'axe principal est l'axe vertical et l'axe secondaire est l'axe horizontal
                      
                      // NB : Si on met start ou end, rien ne va bouger car les éléments ne sont pas organisés
                      // sur cet axe mais plutot sur mainAxisAlignment car on est sur un Row.
                      // crossAxisAlignment: CrossAxisAlignment.end,
              
                      /*
                        NB : En Flutter, un Row a un children (tableau de child). Un Row peut donc contenir
                        une liste de Widgets. Row a plusieurs enfants qui ne sont rien d'autres que les 
                        éléments que peuvent avoir une ligne.
                      */
                      children: [
              
                        // On crée une boucle qui va répéter notre composant 4 fois.
                        for(int i=1; i<=2; i++)
                          Padding(
                            padding: const EdgeInsets.all(4.0), // Marge intérieur de 4
                          /*
                            NB : Le child est l'équivalent d'un contenu à l'intérieur d'une div ouvrante 
                            et d'une div fermante (<div></div>).
                          */ 
                          child: Container( // On crée une div de hauteur 100 et largeur 100
                                  height: 100,
                                  width: 100,
                        // Enumération qui permet de donner les marges. On lui donne sur les 4 cotés une marge de 10
                        margin: const EdgeInsets.all(10), // On doit mettre const car ca ne change pas
              
                        // On met un padding avec EdgeInsets. On doit mettre sur le padding un symmetric.
                        // Vertical signie "top et bottom", Horizontal signifie "left et right"
                        // Si on veut mettre des valeurs précises sur chaque marges et ou on veut, on met '.only(left, top, right, bottom)'
                        /*
                          NB : Il ya certains widgets qui n'ont pas de padding. Et pour pouvoir utiliser 
                          un padding sur un widget qui n'en a pas, on utilise le widget Padding().
              
                            Padding est surtout utilisé pour donner des marges. Car quand on englobe un container
                            d'un Padding, c'est comme si on lui avait donné une marge.
                        */
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        
                        // Decoration permet d'ajouter plus de décoration à un élément. On peut donc placer
                        // la couleur à l'intérieur.
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20), // Un border 
                          border: const Border(top: BorderSide(
                            color: Colors.black,
                            width: 1
                          ))
                          // border: Border(top: Border())
                        ),
              
                        // Pour donner un padding sur chaque coté on fait comme ca:
                        // Ici on peut mettre des valeurs là ou on veut
                        // padding: EdgeInsets.only(top:10, left:9),
              
                        // On donne un texte au Container. Comme si on mettait du texte dans la div
                        child: Center(child: Text("Hello World ${i}", style: const TextStyle(color: Colors.white, 
                        fontFamily: "Arial", 
                        fontWeight: FontWeight.bold,
                        fontSize:20
                        ))),
                      ))] // Equivalent d'un div ou on aura le corps
                  ),
            ],
          ),
        ],
      ),


      // Dernier élément que l'on peut avoir dans un Scaffold, c'est le bottomNavigationBar qui est la barre de navaigation du bas
      // Il prend des items qui sont les boutons de navigations (bottomNavigationBarItem) en bas d'une page. 
      bottomNavigationBar: BottomNavigationBar(
        items: const [
             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home")
        ],
      ),

      );// Container peut etre vu comme un div,
  }
}
