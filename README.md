# Heart Disease Data Quality Check

![tests](https://github.com/Sarasadr-26/shell-data-qc/actions/workflows/ci.yml/badge.svg)

**Question:** does the UCI Heart Disease dataset have any structural problems, missing values, or duplicate rows that should be fixed before it is used for analysis?

## Data

- **Source:** [UCI Machine Learning Repository, Heart Disease dataset](https://archive.ics.uci.edu/dataset/45/heart+disease)
- **License:** CC BY 4.0
- **Contents:** 303 patients (Cleveland site) and 294 patients (Hungarian site), 14 columns each: 13 clinical measurements plus a diagnosis
- Raw data is not committed. Run `bash run.sh data` to download it.

## Method

1. Download and unzip the dataset (`src/fetch_data.sh`).
2. Check the file for missing values, wrong column counts, and duplicate rows (`src/qc_checks.sh`).
3. Save the results as a plain-text report (`bash run.sh report`).

## Results

The Cleveland file (303 rows) has 6 missing values, all in the "number of major vessels" and "thalassemia result" columns, and no duplicate rows. The Hungarian file (294 rows) is far less complete: 782 missing values across 9 columns, and 1 duplicate row. This shows that the two data sources should not be treated as equally reliable before analysis.

## How to run

Requires [uv](https://docs.astral.sh/uv/), Python 3.11 or newer, and Git Bash on Windows.

```bash
git clone https://github.com/Sarasadr-26/shell-data-qc.git
cd shell-data-qc
bash run.sh setup    # creates the environment
bash run.sh data     # downloads the dataset
bash run.sh report   # runs the quality check and saves reports/qc_report.txt
```

To check a different file from the same dataset, run the script directly, for example:

```bash
bash src/qc_checks.sh data/raw/processed.switzerland.data
```

## Repository layout

```text
src/fetch_data.sh   downloads and unzips the dataset
src/qc_checks.sh     runs the quality checks on one file
tests/               a smoke test confirming the environment installs correctly
data/                data notes; raw files are never committed
reports/             generated quality reports; not committed
```

## Limitations

- The check looks for missing values, duplicate rows, and malformed rows. It does not check whether individual values are clinically plausible (for example, an impossible age).
- Missing values are only detected when marked with `?`, the convention this dataset uses.

## Next steps

- Add a check for implausible values in specific columns (for example, age or blood pressure out of range).
- Run the check automatically on all four hospital files, not just Cleveland and Hungarian.

## License

MIT. See [LICENSE](LICENSE).