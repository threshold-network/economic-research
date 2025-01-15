# Stable Yield retrospective

Jupyter notebooks to analyze the performance of the Threshold Network's Stable Yield mechanism.

## Get started

Install necessary Python packages:

```bash
pip install -r requirements.txt
```

It is possible to update the data to be analyzed (staking events and authorization events from
TokenStaking contract) using [Dune](https://dune.com/) queries. To get access to Dune API, it is
necessary to set API keys on `.env` file:

```dotenv
DUNE_API_KEY=<paste your API key here>
DUNE_API_REQUEST_TIMEOUT=120
```
