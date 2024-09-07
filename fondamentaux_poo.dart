void main() {

  Compte cpte = Compte(); // Création d'un objet de type Compte. En dart 'new' n'est pas obligatoire
  cpte._id = 1; // hydratation de l'id
  cpte.numC = "CPT001"; // hydratation du numéro du compte
  print(cpte);

  Client client = Client();
  client.id = 1;
  client.nomComplet = "BBW";
  print("ID : ${client.id}, NomComplet : ${client.nomComplet}");

  Client client1 = Client(id: 2, nomComplet: "BBW2");
  print("ID : ${client1.id}, NomComplet : ${client1.nomComplet}");

  Transaction t = Transaction(date: "02/06/2024", montantTrans: 1000);
  print("Date : ${t.date}, Montant : ${t.montantTrans}");

  // En dart, voici comment est créé un objet avec ses attributs navigationnels
  // Les objets issues de relations sont initialisés directement dans l'objet
  // On utilise le constructeur avec paramètre pour hydrater l'objet
  Compte cpte2 = Compte(id: 2, numC: "CPT0002", solde: 100000, 
                        client: Client(id: 2, nomComplet: "BBW2"),
                        transactions: [
                          Transaction(date: "01/06/2024", montantTrans: 1000),
                          Transaction(date: "02/06/2024", montantTrans: 1000),
                          Transaction(date: "03/06/2024", montantTrans: 1000)
                        ]
                        );
  print(cpte2);

}

// En dart, les attributs doivent forcément etre initialisés. Ansi on a deux options.
// Soit on peut dire que c'est nullable en mettant '?' ou alors donner une valeur
class Client {
  int? id;
  String? nomComplet;
  Adresse? adresse;
  // Construteur avec paramètres
  // En dart, un constructeur avec paramètre peut etre fait de manière plus simple comme suit:
  // Dérrière, il fait le paramètrage et l'affectation.
  Client({this.id, this.nomComplet, this.adresse});

}

class Adresse {
  String quartier;
  String ville;

  Adresse({required this.quartier, required this.ville});

}

class Compte {
  // Pour mettre un attribut en privé on met '_' devant l'attribut. Par défaut, un attribut est public
  int? _id;
  String? numC;
  double soldeC=0;
  Client? client;
  List<Transaction>? transactions = [];

  // Par défaut une classe a déja un constructeur sans arguments comme celui ci dessous
  // Compte() {

  // }

  // Si on veut spécifier un constructeur avec paramètre, il est représenté en dart par des paramètres
  // par défaut.
  Compte({int? id, String? numC, double? solde, Client? client, List<Transaction>? transactions}) {
    _id=id;
    this.numC=numC;
    soldeC=soldeC;
    this.transactions=transactions;
  }

  @override
  String toString() {
    return "ID : ${_id}, Numero : ${numC}, Solde : ${soldeC}, Transactions : ${transactions}";
  }
}

class Transaction {
  String date;
  double montantTrans=0;

  // 'required' permet de dire que lorsqu'on fait une transaction on doit forcément avoir la date
  // et le montant de la transaction.
  // Quand on met required, le constructeur par défaut n'existe plus.
  Transaction({required this.date, required this.montantTrans});
}