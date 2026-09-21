# <Project title>

![tests](https://github.com/Sarasadr-26/<repo-name>/actions/workflows/ci.yml/badge.svg)

**Question:** <One sentence: what question does this project answer, and for whom?>

<Insert the one key figure here: `![Key result](docs/key_figure.png)`>

## Data

- **Source:** <name, link>
- **License:** <license, and date accessed>
- **Contents:** <rows, columns, what one row represents>
- Raw data is not committed. Run `bash run.sh data` to download or generate it.

## Method

1. <Step one, for example: validate incoming files>
2. <Step two, for example: define the cohort>
3. <Step three, for example: fit and compare models with cross-validation>

## Results

<Two or three sentences with the main numbers and their uncertainty, for example a 95% bootstrap interval.>

## How to run

Requires [uv](https://docs.astral.sh/uv/), Python 3.11 or newer, and Git Bash on Windows.

```bash
git clone https://github.com/Sarasadr-26/<repo-name>.git
cd <repo-name>
bash run.sh setup   # creates the environment from pyproject.toml and uv.lock
bash run.sh test    # runs the tests
bash run.sh all     # runs the full pipeline
```

## Repository layout

```text
src/         reusable code
tests/       pytest checks
notebooks/   exploration only, outputs cleared
data/        data notes; raw files are never committed
docs/        data dictionary, decisions log, figures
```

## Limitations

- <What the data cannot support, for example synthetic data means results demonstrate the method, not clinical truth.>
- <Known biases, missingness, or leakage risks and how they were handled.>

## Next steps

- <One or two concrete improvements.>

## License

MIT. See [LICENSE](LICENSE).
