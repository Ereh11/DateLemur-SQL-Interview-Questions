WITH CT AS
(
 SELECT datacenter_id, SUM(monthly_demand) AS sum_cap
 FROM forecasted_demand
 GROUP BY datacenter_id
)

SELECT CT.datacenter_id, dc.monthly_capacity - CT.sum_cap
FROM CT, datacenters dc
WHERE CT.datacenter_id = dc.datacenter_id
ORDER BY CT.datacenter_id