package com.productos.modelo;

public class Usuario {
	private String nombre;
	private int edad;
	private String email;
	private String password;
	private String rol;
	
	public Usuario(String nombre, int edad, String email, String password, String rol) {
		super();
		this.nombre = nombre;
		this.edad = edad;
		this.email = email;
		this.password = password;
		this.rol = rol;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}
	
}
