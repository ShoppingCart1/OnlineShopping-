package com.mivim.controller;
import com.mivim.dto.AdminDTO;
public class ShoppingCartItem {
	private AdminDTO admindto;
	private int quantity;
	
	public ShoppingCartItem(AdminDTO p) {
		admindto = p;
		quantity = 1;
	}
	// Method to increase the quantity
		// of the product in the cart
		public void incrementQuantity() {
			quantity++;
		}

		// Method to decrease the quantity
		// of the product in the cart
		public void decrementQuantity() {
			--quantity;
		}
		/**
		 * 
		 * Beginning of Getters and Setters
		 */

		public AdminDTO getAdminDTO() {
			return admindto;
		}

		public void setAdminDTO(AdminDTO admindto) {
			this.admindto = admindto;
		}

		public int getQuantity() {
			return quantity;
		}

		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		/**
		 * 
		 * End of Getters and Setters
		 */

		public double getTotal() {
			double amount = 0;
			double y = Integer.parseInt(admindto.getUnit_price());
			amount = (this.getQuantity() * y);
			return amount;
		}

}
