package com.example;

import org.hibernate.Session;
import org.hibernate.Transaction;


import com.opensymphony.xwork2.ActionSupport;

import java.io.Serial;


public class addProductAction extends ActionSupport {
	@Serial
    private static final long serialVersionUID = 1L;
	Product product = new Product();

    public String post() {

        Transaction tx = null;
        try (Session session = FactoryProvider.getFactory().openSession()) {
            tx = session.beginTransaction();
            session.persist(product);
            tx.commit();
            addActionMessage("product added successfully!");
            return SUCCESS;
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            addActionError("Error adding product: " + e.getMessage());
            return ERROR;
        }
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}