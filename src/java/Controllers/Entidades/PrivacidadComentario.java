/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Alvaro
 */
@Entity
@Table(name = "privacidad_comentario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PrivacidadComentario.findAll", query = "SELECT p FROM PrivacidadComentario p"),
    @NamedQuery(name = "PrivacidadComentario.findByIdPrivacidad", query = "SELECT p FROM PrivacidadComentario p WHERE p.idPrivacidad = :idPrivacidad"),
    @NamedQuery(name = "PrivacidadComentario.findByTipoPrivacidad", query = "SELECT p FROM PrivacidadComentario p WHERE p.tipoPrivacidad = :tipoPrivacidad")})
public class PrivacidadComentario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_privacidad")
    private Integer idPrivacidad;
    @Size(max = 45)
    @Column(name = "tipo_privacidad")
    private String tipoPrivacidad;

    public PrivacidadComentario() {
    }

    public PrivacidadComentario(Integer idPrivacidad) {
        this.idPrivacidad = idPrivacidad;
    }

    public Integer getIdPrivacidad() {
        return idPrivacidad;
    }

    public void setIdPrivacidad(Integer idPrivacidad) {
        this.idPrivacidad = idPrivacidad;
    }

    public String getTipoPrivacidad() {
        return tipoPrivacidad;
    }

    public void setTipoPrivacidad(String tipoPrivacidad) {
        this.tipoPrivacidad = tipoPrivacidad;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPrivacidad != null ? idPrivacidad.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PrivacidadComentario)) {
            return false;
        }
        PrivacidadComentario other = (PrivacidadComentario) object;
        if ((this.idPrivacidad == null && other.idPrivacidad != null) || (this.idPrivacidad != null && !this.idPrivacidad.equals(other.idPrivacidad))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Controllers.Entidades.PrivacidadComentario[ idPrivacidad=" + idPrivacidad + " ]";
    }
    
}
