WITH
  auth_increased as (
    SELECT
      evt_block_time as timestamp,
      stakingProvider as staking_provider,
      'authIncreased' as event,
      CASE application
        WHEN from_hex('0x347CC7ede7e5517bD47D20620B2CF1b406edcF07') THEN 'taco'
        WHEN from_hex('0x46d52e41c2f300bc82217ce22b920c34995204eb') THEN 'tbtc'
        WHEN from_hex('0x5499f54b4A1CB4816eefCf78962040461be3D80b') THEN 'randombeacon'
        ELSE concat('0x', to_hex(application))
      END AS application,
      toAmount - fromAmount as amount_variation,
      toAmount as current_balance
    from
      threshold_network_ethereum.TokenStaking_evt_AuthorizationIncreased
  ),
  auth_involuntary_decreased as (
    SELECT
      evt_block_time as timestamp,
      stakingProvider as staking_provider,
      'authInvoluntaryDecreased' as event,
      CASE application
        WHEN from_hex('0x347CC7ede7e5517bD47D20620B2CF1b406edcF07') THEN 'taco'
        WHEN from_hex('0x46d52e41c2f300bc82217ce22b920c34995204eb') THEN 'tbtc'
        WHEN from_hex('0x5499f54b4A1CB4816eefCf78962040461be3D80b') THEN 'randombeacon'
        ELSE concat('0x', to_hex(application))
      END AS application,
      fromAmount - toAmount as amount_variation,
      toAmount as current_balance
    from
      threshold_network_ethereum.TokenStaking_evt_AuthorizationInvoluntaryDecreased
  ),
  auth_decrease_approved as (
    SELECT
      evt_block_time as timestamp,
      stakingProvider as staking_provider,
      'authDecreaseApproved' as event,
      CASE application
        WHEN from_hex('0x347CC7ede7e5517bD47D20620B2CF1b406edcF07') THEN 'taco'
        WHEN from_hex('0x46d52e41c2f300bc82217ce22b920c34995204eb') THEN 'tbtc'
        WHEN from_hex('0x5499f54b4A1CB4816eefCf78962040461be3D80b') THEN 'randombeacon'
        ELSE concat('0x', to_hex(application))
      END AS application,
      fromAmount - toAmount as amount_variation,
      toAmount as current_balance
    from
      threshold_network_ethereum.TokenStaking_evt_AuthorizationDecreaseApproved
  ),
  auth_decrease_requested as (
    SELECT
      evt_block_time as timestamp,
      stakingProvider as staking_provider,
      'authDecreaseRequested' as event,
      CASE application
        WHEN from_hex('0x347CC7ede7e5517bD47D20620B2CF1b406edcF07') THEN 'taco'
        WHEN from_hex('0x46d52e41c2f300bc82217ce22b920c34995204eb') THEN 'tbtc'
        WHEN from_hex('0x5499f54b4A1CB4816eefCf78962040461be3D80b') THEN 'randombeacon'
        ELSE concat('0x', to_hex(application))
      END AS application,
      fromAmount - toAmount as amount_variation,
      fromAmount as current_balance
    from
      threshold_network_ethereum.TokenStaking_evt_AuthorizationDecreaseRequested
  )
SELECT
  *
from
  auth_increased
UNION ALL
SELECT
  *
FROM
  auth_involuntary_decreased
UNION ALL
SELECT
  *
FROM
  auth_decrease_approved
UNION ALL
SELECT
  *
FROM
  auth_decrease_requested
ORDER BY
  timestamp ASC
