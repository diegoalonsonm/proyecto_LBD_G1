package Modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;

public class UsuarioDao {
    PreparedStatement ps;
    ResultSet rs;
    Conexion c = new Conexion();
    Connection con;

    public List listar() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "select * from usuario";
        try {
            con = c.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId_usuario(rs.getInt(1));
                u.setId_rol(rs.getInt(2));
                u.setId_estado(rs.getInt(3));
                u.setId_nacionalidad(rs.getInt(4));
                u.setId_direccion(rs.getInt(5));
                u.setNombre(rs.getString(6));
                u.setApellidos(rs.getString(7));
                u.setCedula(rs.getString(8));
                u.setTelefono(rs.getString(9));
                u.setCorreo(rs.getString(10));
                u.setContraseña(rs.getString(11));
                u.setFecha_nacimiento(rs.getDate(12));
                lista.add(u);
            }
        } catch (Exception e) {
        }
        
        return lista;
    }
    
    public int agregar(Usuario u) {
        int r = 0;
        String sql = "insert into usuario (id, nombre, apellidos, cedula, correo, telefono, contraseña) values (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            con = c.conectar();
            ps = con.prepareCall(sql);
            
            ps.setString(1, String.valueOf(u.getId_usuario()));
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getApellidos());
            ps.setString(4, u.getCedula());
            ps.setString(5, u.getCorreo());
            ps.setString(6, u.getTelefono());
            ps.setString(7, u.getContraseña());           
            
            r = ps.executeUpdate();
            
            if (r == 1) {
                r = 1;
            } else {
                r = 0;
            }
            
        } catch (Exception e) {
            
        }
        return r;
    }
    
    public Usuario listarId(String id) {
        String sql = "select id, nombre, apellidos, cedula, correo, telefono, contraseña from usuarios where id="+id;
        Usuario usuario = new Usuario();
        
        try {
            con = c.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                usuario.setId_usuario(rs.getString(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellidos(rs.getString(3));
                usuario.setCedula(rs.getString(1));
                usuario.setCorreo(rs.getString(5));
                usuario.setTelefono(rs.getString(6));
                usuario.setContraseña(rs.getString(7));
            }
        } catch (Exception e) {
            
        }
        return usuario;
    }
    
    public int actualizar(Usuario u) {
        String sql = "update persona set nombre = ?, apellidos = ?, cedula = ?, correo = ?, telefono = ?, contraseña = ? where id= ?";
        int r = 0;
        
        try {
            con = c.conectar();
            ps = con.prepareStatement(sql);
                       
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellidos());
            ps.setString(3, u.getCedula());
            ps.setString(4, u.getCorreo());
            ps.setString(5, u.getTelefono());
            ps.setString(6, u.getContraseña());   
            ps.setString(7, String.valueOf(u.getId_usuario()));
            
            r = ps.executeUpdate();
            
            if (r == 1) {
                r = 1;
            } else {
                r = 0;
            }
            
        } catch(Exception e) {
            
        }
        return r;
    }

}