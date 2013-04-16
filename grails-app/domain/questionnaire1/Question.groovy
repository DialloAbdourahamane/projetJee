package questionnaire1

class Question {
    
    String enonce
    boolean etat
    User proprietaire
    static hasMany = [propositions:Proposition]
  
    static constraints = {
        enonce(blank:false)
        etat(blank:false)
        proprietaire(nullable : true)
    }
}


