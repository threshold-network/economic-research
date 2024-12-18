WITH
    staked_events as (
        SELECT
            to_unixtime(evt_block_time) as timestamp,
            stakingProvider as staking_provider,
            'staked' as event,
            amount/1e18 as amount
        FROM
            threshold_network_ethereum.TokenStaking_evt_Staked
    ),
    topped_up_events as (
        SELECT
            to_unixtime(evt_block_time) as timestamp,
            stakingProvider as staking_provider,
            'toppedUp' as event,
            amount/1e18 as amount
        FROM
            threshold_network_ethereum.TokenStaking_evt_ToppedUp
    ),
    unstaked_events as (
        SELECT
            to_unixtime(evt_block_time),
            stakingProvider as staking_provider,
            'unstaked' as event,
            amount/1e18 as amount
        FROM
            threshold_network_ethereum.TokenStaking_evt_Unstaked
    )
SELECT
    *
FROM
    staked_events
UNION ALL
SELECT
    *
FROM
    topped_up_events
UNION ALL
SELECT
    *
FROM
    unstaked_events
ORDER BY
    timestamp ASC
