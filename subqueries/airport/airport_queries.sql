/* Find all airplane models where each flight has had over 250 paying customers
   in the past month */

SELECT airplane_model
FROM flights
WHERE flight_number = ANY
  (SELECT flight_number
  FROM transactions
  WHERE seats_sold > 250
  AND date > CURRENT_DATE - INTERVAL '1 month');

/* Find all destination-origin pairs where 90% or more of the seats have been sold
   in the past month */

SELECT origin, destination
FROM flights
WHERE flight_number = ANY
  (SELECT transactions.flight_number
  FROM transactions
  JOIN flights
  USING (flight_number)
  JOIN airplanes
  ON airplanes.model = flights.airplane_model
  WHERE transactions.seats_sold::FLOAT / airplanes.seat_capacity >= 0.90);

/* Find the total revenue of any flight arriving at or departing from
   Singapore (SIN) */

SELECT total_revenue
FROM transactions

