pragma solidity ^0.8.0;

/// @title Product Management
/// @notice This contract allows you to manage product data with expiry dates.
/// @custom:dev-run-script This function is used to insert a product into the blockchain.
contract Product {
    struct ProductData {
        string barcode;
        uint256 expiryDate;
    }

    mapping(string => ProductData) public products;

    /// @notice Inserts a new product into the blockchain.
    /// @param _barcode The barcode of the product.
    /// @param _expiryDate The expiry date of the product (must be in the future).

    function insertProduct(string memory _barcode, uint256 _expiryDate) public {
        require(_expiryDate > block.timestamp, "Expiry date must be in the future");
        require(bytes(products[_barcode].barcode).length == 0, "Barcode already exists");

        products[_barcode] = ProductData(_barcode, _expiryDate);
    }

    /// @notice Verifies the product's expiry date.
    /// @param _barcode The barcode of the product.
    /// @return The expiry date of the product.
    function verifyProduct(string memory _barcode) public view returns (uint256) {
        return products[_barcode].expiryDate;
    }
}
