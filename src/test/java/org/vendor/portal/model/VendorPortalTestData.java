package org.vendor.portal.model;


    public record VendorPortalTestData(String userName,
                                       String password,
                                       String monthlyEarning,
                                       String annualEarning,
                                       String profitMargin,
                                       String availableInventory,
                                       String searchKeyword,
                                       int searchResultCount) {
    }
