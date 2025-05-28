package com.l2ecommece.model;

import java.util.Date;
import java.util.List;

public class Pedido {
    private Long id;
    private Date data;
    private List<Produto> produtos;

    public Pedido() {
    }

    public Pedido(Long id, Date data, List<Produto> produtos) {
        this.id = id;
        this.data = data;
        this.produtos = produtos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }
}