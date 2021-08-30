package main.java.others;

public class Categories {
    String categoryName;
    Integer totalItems; //Total items of this type




    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(Integer totalItems) {
        this.totalItems = totalItems;
    }

    public Categories(String categoryName, Integer totalItems) {
        this.categoryName = categoryName;
        this.totalItems = totalItems;
    }
}
