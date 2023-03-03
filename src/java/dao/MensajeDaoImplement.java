/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.Objects;
import model.Cuenta;
import model.Mensaje;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import persistence.NewHibernateUtil;

/**
 *
 * @author alumno
 */
public class MensajeDaoImplement implements MensajeDao {

    @Override
    public ArrayList<Mensaje> getMensajes() {
        Session session = null;
        ArrayList<Mensaje> mensajes = null;
        try {
            session = NewHibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("from Mensaje");
            mensajes = (ArrayList<Mensaje>) query.list();
        } catch (HibernateException HE) {
            System.err.println(HE.getCause());
            System.err.println("Error doing a mensaje select.");
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return mensajes;
    }

    @Override
    public ArrayList<Mensaje> getMensajeByCuentaOrigen(Integer cuentaorigen) {
        ArrayList<Mensaje> mensajes = new ArrayList<>();
        ArrayList<Mensaje> filteredList = new ArrayList<>();
        mensajes = getMensajes();
        for (Mensaje c : mensajes) {
            if (Objects.equals(c.getCuecodigoorigen(), cuentaorigen)) {
                filteredList.add(c);
            }
        }
        return filteredList;
    }

    @Override
    public void insertMensaje(Mensaje mensaje) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void editMensaje(Mensaje mensaje) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Mensaje> getMensajeByCuentaDestino(Integer cuentadestino) {
        ArrayList<Mensaje> mensajes = new ArrayList<>();
        ArrayList<Mensaje> filteredList = new ArrayList<>();
        mensajes = getMensajes();
        for (Mensaje c : mensajes) {
            if (Objects.equals(c.getCuecodigodestino(), cuentadestino)) {
                filteredList.add(c);
            }
        }
        return filteredList;
    }

}
