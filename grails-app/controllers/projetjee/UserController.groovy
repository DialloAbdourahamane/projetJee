package projetjee

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
    
    
    def login(){
        
    }
    
    def logout(){
        
        flash.message = "Aurevoir ${session.user.login}"
        session.user = null
        redirect(action:"login")

    }
    
    def authentification(){
        def user = User.findByLoginAndMotDePasse(params.login,params.motDePasse.encodeAsSHA())
        if(user){
            session.user = user
            flash.message = "Bonjour ${user.login}!"
            
            if(user.role=="Prof"){
                redirect(controller:"question", action:"list")
            }else{
              redirect(action:"afficheQuestion")
            }
        }else{
            flash.message ="Mr. ${params.login} votre login ou mot de passe incorrect ressayer."
            redirect(action:"login")
        }

       
    }
    
        
    def afficheQuestion(){
        def instanceQuestion=Question.findByEtat("ouvert")
        
        if(!instanceQuestion){
            flash.message ="Pas de question ouverte pour le moment"
            return 
        }
         
   
        [instanceQestion:instanceQuestion]
    }
    
    def reponseEtudiant(){
        Proposition propos=new Proposition(nom:params.repEtudiant)
        /*
         if(!propos){
            flash.message ="Probleme avec votre proposition"
            return 
        }
        */
        propos.save()
        
        Commentaire com=new Commentaire(nom:"Bien")
        /*
        if(!com){
            flash.message ="Probleme lors de sauvegarde du commentaire"
            return 
        }
        */
        def instanceQuestion=Question.findByEtat("ouvert")
        /*
         if(!instanceQuestion){
            flash.message ="Pas de question ouverte pour le moment"
            return 
        }
        */
        com.save()
        Reponse reponseInstance=new Reponse(user:session.user,note:0,
            commentaire:com,propostion:propos,question:instanceQuestion)
        
       // render instanceQuestion.toString()
        
        reponseInstance.save()
        instanceQuestion.addToReponses(reponseInstance)
        //reponseInstance.addToQuestion(instanceQuestion)
          
        //hasErrors()
        
        if (!reponseInstance) {
            //println reponseInstance.errors
            flash.message ="Reponse non enregistrer"
            return
        }else{
            
            redirect(action:"show",controller:"reponse",id:reponseInstance.id)
             
            
        }
        
        
       // render "Votre reponse est pris encompte"+params.repEtudiant
        
    }
}
