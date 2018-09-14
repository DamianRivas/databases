/* A guest who exists in the database and has not booked a room */
SELECT guests.first_name, guests.last_name
FROM guests
FULL OUTER JOIN bookings
ON guests.id = bookings.guest_id
WHERE bookings.check_in_date IS NULL;

/* bookings for a guest who has booked two rooms for the same dates */
SELECT guests.first_name, guests.last_name, bookings.check_in_date, bookings.check_out_date, rooms.floor_number, rooms.room_number
FROM bookings
JOIN guests
ON guests.id = bookings.guest_id
JOIN rooms
ON bookings.room_id = rooms.id
WHERE bookings.check_in_date = CURRENT_DATE - INTERVAL '33 DAYS'
  AND bookings.check_out_date = CURRENT_DATE - INTERVAL '26 DAYS';

/* bookings for a guest who has booked one room several times on different dates */
SELECT guests.first_name, guests.last_name, bookings.*
FROM bookings
JOIN guests
ON guests.id = bookings.guest_id
WHERE guests.id = 1 AND bookings.room_id = 3;

/* The number of unique guests who have booked the same room */
SELECT COUNT(DISTINCT guests.id) AS "num_guests", rooms.id AS "room_id"
FROM bookings
JOIN guests
ON guests.id = bookings.guest_id
RIGHT JOIN rooms
ON bookings.room_id = rooms.id
GROUP BY (rooms.id);
