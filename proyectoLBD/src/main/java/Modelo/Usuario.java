package Modelo;

import java.sql.Date;

public class Usuario {
    int id_usuario;
    int id_rol;
    int id_estado;
    int id_nacionalidad;
    int id_direccion;
    String nombre;
    String apellidos;
    String cedula;
    String telefono;
    String correo;
    String contraseña;
    Date fecha_nacimiento;

    public Usuario() {
    }

    public Usuario(int id_usuario, int id_rol, int id_estado, int id_nacionalidad, int id_direccion, String nombre, String apellidos, String cedula, String telefono, String correo, String contraseña, Date fecha_nacimiento) {
        this.id_usuario = id_usuario;
        this.id_rol = id_rol;
        this.id_estado = id_estado;
        this.id_nacionalidad = id_nacionalidad;
        this.id_direccion = id_direccion;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.cedula = cedula;
        this.telefono = telefono;
        this.correo = correo;
        this.contraseña = contraseña;
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    public int getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(int id_direccion) {
        this.id_direccion = id_direccion;
    }

    public int getId_nacionalidad() {
        return id_nacionalidad;
    }

    public void setId_nacionalidad(int id_nacionalidad) {
        this.id_nacionalidad = id_nacionalidad;
    }

    public java.lang.String getNombre() {
        return nombre;
    }

    public void setNombre(java.lang.String nombre) {
        this.nombre = nombre;
    }

    public java.lang.String getApellidos() {
        return apellidos;
    }

    public void setApellidos(java.lang.String apellidos) {
        this.apellidos = apellidos;
    }

    public java.lang.String getCedula() {
        return cedula;
    }

    public void setCedula(java.lang.String cedula) {
        this.cedula = cedula;
    }

    public java.lang.String getTelefono() {
        return telefono;
    }

    public void setTelefono(java.lang.String telefono) {
        this.telefono = telefono;
    }

    public java.lang.String getCorreo() {
        return correo;
    }

    public void setCorreo(java.lang.String correo) {
        this.correo = correo;
    }

    public java.lang.String getContraseña() {
        return contraseña;
    }

    public void setContraseña(java.lang.String contraseña) {
        this.contraseña = contraseña;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public void setId_usuario(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}