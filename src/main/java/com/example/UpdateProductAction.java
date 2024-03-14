package com.example;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionSupport;

import java.io.Serial;


public class UpdateProductAction extends ActionSupport {

	@Serial
	private static final long serialVersionUID = 1L;
	private int id;
	private Product product;

	public String post() {
        Transaction tx = null;
        try (Session session = FactoryProvider.getFactory().openSession()) {
            System.out.println("Id " + id);
            tx = session.beginTransaction();

            // Fetch the existing book from the database using book id

            Product existingProduct = session.get(Product.class, id);

            if (existingProduct != null) {
                // Update the book details

                existingProduct.setId(id);
                existingProduct.setName(product.getName());
                existingProduct.setDescription(product.getDescription());
                existingProduct.setPrice(product.getPrice());
                existingProduct.setQuantity(product.getQuantity());

                // Save the changes
                session.merge(existingProduct);

                tx.commit();
                addActionMessage("product updated successfully!");
                return SUCCESS;
            } else {
                addActionError("product with Id " + id + " not found.");
                return ERROR;
            }
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            addActionError("Error updating product: " + e.getMessage());
            return ERROR;
        }
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}