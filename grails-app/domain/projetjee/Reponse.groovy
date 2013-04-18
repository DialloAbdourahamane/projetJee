package projetjee
class Reponse {
    Proposition propostion
    int note
    User user
    Commentaire commentaire
    static belongsTo=[question:Question]
    
    static constraints = {
        
        user blank:false,nullable:false
        note nullable:true
        commentaire nullable:true
        propostion nullable:false
        question()
    }
}
