/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.Mensaje;


/**
 *
 * @author alumno
 */
public interface MensajeDao {
    public ArrayList<Mensaje> getMensajes();
    public ArrayList<Mensaje> getMensajeByCuentaOrigen(Integer cuentaorigen);
    public ArrayList<Mensaje> getMensajeByCuentaDestino(Integer cuentadestino);
    public void insertMensaje(Mensaje mensaje);
    public void editMensaje(Mensaje mensaje);
}
