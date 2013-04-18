package projetjee

class Question {

   
    String enonce
    String etat
    User proprietaire
   
    static hasMany = [propositions : Proposition,reponses:Reponse]
    
    
    static constraints = {
        etat(inList: ["ouvert","ferme", "en attente d'ouverture"])
        enonce(blank:false)
        proprietaire(blank:false)
    }
}
