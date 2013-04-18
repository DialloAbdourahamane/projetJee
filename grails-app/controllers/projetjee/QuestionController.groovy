package projetjee

import org.springframework.dao.DataIntegrityViolationException

class QuestionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [questionInstanceList: Question.list(params), questionInstanceTotal: Question.count()]
    }

    def create() {
        [questionInstance: new Question(params)]
    }

    def save() {
        
        User user=User.get(session.user.id)
        
        Question q = new Question(enonce : params.enonce,
            etat : "en attente d'ouverture",
            proprietaire:user)
        
        Proposition p1  = new Proposition( nom : params.proposition1)
        if(!p1.nom.equals(""))
           q.addToPropositions(p1)
          
           
        p1  = new Proposition( nom : params.proposition2)
        if(!p1.nom.equals(""))
          q.addToPropositions(p1)
              
        p1  = new Proposition( nom : params.proposition3)
          if(!p1.nom.equals(""))
            q.addToPropositions(p1)
            
       p1  = new Proposition( nom : params.proposition4)
        if(!p1.nom.equals(""))
          q.addToPropositions(p1)
            
        def questionInstance = q
        
        if (!questionInstance.save(flush: true)) {
            render(view: "create", model: [questionInstance: questionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
        redirect(action: "show", id: questionInstance.id)

        /*
        def questionInstance = new Question(params)
        if (!questionInstance.save(flush: true)) {
            render(view: "create", model: [questionInstance: questionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
        redirect(action: "show", id: questionInstance.id)
        */
    }

    def show(Long id) {
         def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }
        
        def state
        if(questionInstance.etat.equals("ouvert"))
            state = "fermer"
        else if(questionInstance.etat.equals("ferme")){
                state = "afficher resultats"
                [questionInstance: questionInstance, state : state]
                redirect(action: "afficheResultat",id:questionInstance.id)
                
            }
        else if(questionInstance.etat.equals("en attente d'ouverture"))
            state = "ouvrir"
        [questionInstance: questionInstance, state : state]
    }

    def edit(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        [questionInstance: questionInstance]
    }

    def update(Long id, Long version) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (questionInstance.version > version) {
                questionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'question.label', default: 'Question')] as Object[],
                          "Another user has updated this Question while you were editing")
                render(view: "edit", model: [questionInstance: questionInstance])
                return
            }
        }

        questionInstance.properties = params

        if (!questionInstance.save(flush: true)) {
            render(view: "edit", model: [questionInstance: questionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
        redirect(action: "show", id: questionInstance.id)
    }

    def delete(Long id) {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        try {
            questionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "show", id: id)
        }
    }
    
    
    def ouvrir_fermer(Long id)
    {
        
        Question q = Question.get(id)
        if (!q) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }
          
          if(q.etat.equals("en attente d'ouverture")){
              q.etat = "ouvert"
              q.save()
          }
          else if(q.etat.equals("ouvert")){
              q.etat = "ferme"
              q.save()
          }
          if (!q.save(flush: true)) {
              render "echec de l'ouverture de la question"
              return
          }
        
        redirect(action: "list")
    }
    
    def afficheResultat(Long id){
        
        def m = [:]
        Question q=Question.get(id)
       
        //render q.id
        //render q.reponses
        //def ids="" 
        for(reponse in q.reponses){
           // render reponse.propostion.nom
            
            String valPropos=reponse.propostion.nom
            Integer val=m.get(valPropos)
            if(val!=null){
                val+=1
                m.put(valPropos,val)
            }else{
                m.put(valPropos,new Integer(1)) 
            }
            
           
            
            //valPropos=reponse.propostion.nom+"</br>"
        }
        
        //render m.toString()
        //render m;
       // String s="</br>"
       // for (String str:m.entrySet()){
           // render str
            //s+=m.get(str)
        //}
        
      //  render s
        flash.m = m
        //render "Voici le resultat"+ids
        redirect(action: "afficheChart")
        //return 
    }
    
    def afficheChart(){
        
        //def liste  = [['Work', 11], ['Eat', 2], ['Commute', 2], ['Watch TV', 2], ['Sleep', 7]]
        def m = flash.m
        //m["rap 1"]=11
        //m["rap 2"]=12
        def myTab=[]
        m.keySet().each{
        
              myTab << [it,m[it]]
        }
        
        println myTab
        [myTab : myTab]
        //[myid:"4"]
    }
}
