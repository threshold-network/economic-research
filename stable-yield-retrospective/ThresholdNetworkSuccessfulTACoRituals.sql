SELECT
  start_ritual.ritualId,
  end_ritual.evt_block_time as timestamp,
  start_ritual.participants
FROM
  threshold_network_polygon.Coordinator_evt_StartRitual start_ritual
  JOIN threshold_network_polygon.Coordinator_evt_EndRitual end_ritual ON start_ritual.ritualId = end_ritual.ritualId
WHERE
  end_ritual.successful = TRUE
ORDER BY
  1 ASC
