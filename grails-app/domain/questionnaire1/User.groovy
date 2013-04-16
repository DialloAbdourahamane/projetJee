package questionnaire1

class User {
    
    String nom
    String prenom
    String mail
    String login
    String motDePasse
    String role="Etudiant"

    static constraints = {
        nom()
        prenom()
        role(inList:["Prof","Etudiant"],blank:false)
        mail(blank:false, nullable:false, email:true)
        login(blank:false, nullable:false, unique:true)
        motDePasse(blank:false, password:true)
        
        
    }
    
    
    
    String toString(){
        login
    }
    
   // static transients = ['Prof']
    
    boolean isProf(){
        return role == "Prof"
    }

    
    def beforeInsert = {
        motDePasse = motDePasse.encodeAsSHA()
    }

}
