package com.productos.modelo;

public class Productos {
	private String nombre;
	private String descripcion;
	private int valor_carbono;
	
	public Productos(String nombre, String descripcion, int valor_carbono) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.valor_carbono = valor_carbono;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getValor_carbono() {
		return valor_carbono;
	}

	public void setValor_carbono(int valor_carbono) {
		this.valor_carbono = valor_carbono;
	}
	
}
