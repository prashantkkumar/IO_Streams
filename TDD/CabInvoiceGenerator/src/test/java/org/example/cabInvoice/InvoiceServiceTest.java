package org.example.cabInvoice;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class InvoiceServiceTest {

        @Test
        public void givenDistanceAndTime_WhenCalculated_ShouldReturnTotalFare() {
            InvoiceService invoiceService = new InvoiceService();
            double fare = invoiceService.calculateFare(2.0, 5, RideType.NORMAL);
            Assertions.assertEquals(25.0, fare);
        }

        @Test
        public void givenLessDistanceAndTime_WhenCalculated_ShouldReturnMinimumFare() {
            InvoiceService invoiceService = new InvoiceService();
            double fare = invoiceService.calculateFare(0.1, 1, RideType.NORMAL);
            Assertions.assertEquals(5.0, fare);
        }

        @Test
        public void givenMultipleRides_ShouldReturnInvoiceSummary() {
            InvoiceService invoiceService = new InvoiceService();
            Ride[] rides = {
                    new Ride(2.0, 5, RideType.NORMAL),
                    new Ride(0.1, 1, RideType.NORMAL)
            };
            InvoiceSummary summary = invoiceService.calculateFare(rides);
            InvoiceSummary expectedSummary = new InvoiceSummary(2, 30.0);
            Assertions.assertEquals(expectedSummary, summary);
        }

        @Test
        public void givenUserId_ShouldReturnInvoiceSummary() {
            InvoiceService invoiceService = new InvoiceService();
            String userId = "user1";
            Ride[] rides = {
                    new Ride(2.0, 5, RideType.NORMAL),
                    new Ride(0.1, 1, RideType.NORMAL)
            };
            invoiceService.addRides(userId, rides);
            InvoiceSummary summary = invoiceService.getInvoiceSummary(userId);
            InvoiceSummary expectedSummary = new InvoiceSummary(2, 30.0);
            Assertions.assertEquals(expectedSummary, summary);
        }

        @Test
        public void givenPremiumRides_ShouldCalculatePremiumFare() {
            InvoiceService invoiceService = new InvoiceService();
            double fare = invoiceService.calculateFare(2.0, 5, RideType.PREMIUM);
            Assertions.assertEquals(40.0, fare);
        }
    }

