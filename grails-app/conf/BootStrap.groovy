import questionnaire1.User
class BootStrap {

    def init = { servletContext ->
        
        
         User diallo=new User(
            nom:"Diallo",prenom:"Abdoul",role:"Etudiant",mail:"abdd.diallo@gmail.com",
            login:"abdd.diallo",motDePasse:"etud"
        )
        
        diallo.save()
        if(diallo.hasErrors()){
            println admin.errors
        }
        
            User user=new User(
                nom:"Bah",prenom:"Dupond",role:"Prof",mail:"abdd.diallo12@gmail.com",
                login:"Dupont",motDePasse:"du"

            )
            
        user.save()
        if(user.hasErrors()){
            println admin.errors
        }
    }
    def destroy = {
    }
}
