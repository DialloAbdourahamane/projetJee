import java.security.MessageDigest
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author dialloabd
 */
class SHACodec {
    
    static encode = {target->
        MessageDigest md = MessageDigest.getInstance('SHA')
        md.update(target.getBytes('UTF-8'))
        return new String(md.digest()).encodeAsBase64()
    }

	
}

