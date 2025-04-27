package org.example.cabInvoice;

import java.util.HashMap;
import java.util.Map;


public class InvoiceService {
        private static final double COST_PER_KM_NORMAL = 10;
        private static final double COST_PER_MINUTE_NORMAL = 1;
        private static final double MINIMUM_FARE_NORMAL = 5;

        private static final double COST_PER_KM_PREMIUM = 15;
        private static final double COST_PER_MINUTE_PREMIUM = 2;
        private static final double MINIMUM_FARE_PREMIUM = 20;

        private Map<String, Ride[]> userRides = new HashMap<>();

        public double calculateFare(double distance, int time, RideType rideType) {
            double totalFare = 0;
            if (rideType == RideType.NORMAL) {
                totalFare = distance * COST_PER_KM_NORMAL + time * COST_PER_MINUTE_NORMAL;
                return Math.max(totalFare, MINIMUM_FARE_NORMAL);
            } else if (rideType == RideType.PREMIUM) {
                totalFare = distance * COST_PER_KM_PREMIUM + time * COST_PER_MINUTE_PREMIUM;
                return Math.max(totalFare, MINIMUM_FARE_PREMIUM);
            }
            return totalFare;
        }

        public InvoiceSummary calculateFare(Ride[] rides) {
            double totalFare = 0;
            for (Ride ride : rides) {
                totalFare += this.calculateFare(ride.distance, ride.time, ride.rideType);
            }
            return new InvoiceSummary(rides.length, totalFare);
        }

        public void addRides(String userId, Ride[] rides) {
            userRides.put(userId, rides);
        }

        public InvoiceSummary getInvoiceSummary(String userId) {
            return this.calculateFare(userRides.get(userId));
        }
    }

