SELECT ROUND(SUM(yearly_seat_cost * num_seats) / COUNT(*)::DECIMAL, 2)
FROM contracts;