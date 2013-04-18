import projetjee.User
import projetjee.Question
import projetjee.Proposition
class BootStrap {

    def init = { servletContext ->
        
         User diallo=new User(
            nom:"Diallo",prenom:"Abdoul",role:"Etudiant",mail:"abdd.diallo@gmail.com",
            login:"abdd.diallo",motDePasse:"etud"
        )
        
        diallo.save()
        if(diallo.hasErrors()){
            println diallo.errors
        }
        
        
           User diallo1=new User(
            nom:"Durant",prenom:"Jean paul",role:"Etudiant",mail:"abdd.diallo1@gmail.com",
            login:"Durant",motDePasse:"etud"
        )
        
        diallo1.save()
        if(diallo.hasErrors()){
            println diallo.errors
        }
        
            User user=new User(
                nom:"Bah",prenom:"Dupond",role:"Prof",mail:"abdd.diallo12@gmail.com",
                login:"Dupont",motDePasse:"du"

            )
            
        user.save()
        if(user.hasErrors()){
            println user.errors
        }
        
        
        Proposition p =new Proposition(nom:"Comment tu tappellle");
        
        p.save()
        if(p.hasErrors()){
            
            println p.errors
        }
        
        
        Question q=new Question(enonce:"Question 1",etat:"ouvert",proprietaire:diallo)
        
        q.save()
        if(q.hasErrors()){
            println q.errors
        }
        
        q.addToPropositions(p)
        
    }
    def destroy = {
    }
}
