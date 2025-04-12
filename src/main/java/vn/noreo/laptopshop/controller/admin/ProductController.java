package vn.noreo.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.service.ProductService;
import vn.noreo.laptopshop.service.UploadService;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    // // Không dùng Autowired vì không tốt cho test
    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    // View all products
    // Nếu không có Optional thì khi không truyền page sẽ bị lỗi
    @GetMapping("/admin/product")
    public String getAllProductPage(Model model, @RequestParam("page") Optional<String> pageOptional) {

        int page = 1;
        /*
         * Nhập chuỗi vd page = "abc" hoặc không truyền page thì không có lỗi
         * xảy ra mà sẽ trả về mặc định page = 1
         */
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (NumberFormatException e) {
        }

        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Product> allProducts = this.productService.getAllProducts(pageable);
        List<Product> allProductsPaging = allProducts.getContent();
        model.addAttribute("allProducts", allProductsPaging);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", allProducts.getTotalPages());
        return "admin/product/view-all-product";
    }

    // View product detail admin
    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product currentProduct = productService.getProductById(id);
        model.addAttribute("currentProduct", currentProduct);
        return "admin/product/view-product-detail";
    }

    // Create product
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create-product";
    }

    @PostMapping(value = "/admin/product/create")
    public String createProduct(@ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult newProductBindingResult,
            @RequestParam("productFile") MultipartFile file) {

        // Validate
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create-product";
        }

        String productImage = this.uploadService.handleSaveUploadFile(file, "product");

        newProduct.setImage(productImage);

        this.productService.handleSaveProduct(newProduct);
        return "redirect:/admin/product";
    }

    // Update product
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = productService.getProductById(id);
        model.addAttribute("currentProduct", currentProduct);
        return "admin/product/update-product";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(@ModelAttribute("currentProduct") @Valid Product currentProduct,
            BindingResult currentProductBindingResult,
            @RequestParam("updateProductFile") MultipartFile file) {

        if (currentProductBindingResult.hasErrors()) {
            return "admin/product/update-product";
        }

        Product productUpdated = this.productService.getProductById(currentProduct.getId());

        if (productUpdated != null) {
            if (!file.isEmpty()) {
                String productImage = this.uploadService.handleSaveUploadFile(file, "product");
                productUpdated.setImage(productImage);
            }
            productUpdated.setName(currentProduct.getName());
            productUpdated.setPrice(currentProduct.getPrice());
            productUpdated.setDetailDesc(currentProduct.getDetailDesc());
            productUpdated.setShortDesc(currentProduct.getShortDesc());
            productUpdated.setQuantity(currentProduct.getQuantity());
            productUpdated.setSold(currentProduct.getSold());
            productUpdated.setFactory(currentProduct.getFactory());
            productUpdated.setTarget(currentProduct.getTarget());

            this.productService.handleSaveProduct(productUpdated);
        }
        return "redirect:/admin/product";
    }

    // Delete product
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("currentProduct", new Product());
        return "admin/product/delete-product";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProduct(Model model, @ModelAttribute("currentProduct") Product currentProduct) {
        this.productService.deleteProductById(currentProduct.getId());
        return "redirect:/admin/product";
    }
}
