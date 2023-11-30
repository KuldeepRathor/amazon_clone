const express = require("express");
const userRouter = express.Router();
const auth = require('../middleware/auth');
const { Product } = require("../models/product");
const User = require('../models/user');

userRouter.post('/api/add-to-cart', auth, async (req, res) => {
    try {
        const { id } = req.body;
        const product = await Product.findById(id);

        let user = await User.findById(req.user);

        if (user.cart.length == 0) {
            user.cart.push({
                product, quantity: 1
            });
        } else {
            let isProductFound = false;
            for (let i = 0; i < user.cart.length; i++) {
                if (user.cart[i].product._id.equals(id)) {
                    isProductFound = true;
                }

            }

            if (isProductFound) {
                let existingProduct = user.cart.find((productt) =>
                    productt.product && productt.product._id.equals(id)
                );
            
                if (existingProduct) {
                    existingProduct.quantity += 1;
                } else {
                    console.error("Existing product not found:", user.cart);
                }
            } else {
                user.cart.push({
                    product, quantity: 1
                });
            }
            

        }
        user = await user.save();
        res.json(user);

    } catch (e) {
        console.error(e);
        res.status(500).json({ error: e.message });
    }
})

module.exports = userRouter;