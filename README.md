# resume

My resume, cover letter, and Japanese work history written with [Typst](https://typst.app/).

## Requirements

- Typst CLI (CI uses version 0.14.2)
- Make
- Open Sans for the English documents; bundled in [fonts/](./fonts)
- A Japanese font listed in [src/職務経歴書.typ](./src/職務経歴書.typ): YuMincho, Hiragino Mincho ProN, or BIZ UDMincho

## Build

Run commands from the repository root. PDFs are written to `~/Desktop`.

```shell
make resume
make cover-letter
make shokumu-keirekisho
make all
```

| Target | Source | Output |
| --- | --- | --- |
| `resume` | [src/resume.typ](./src/resume.typ) | `~/Desktop/resume.pdf` |
| `cover-letter` | [src/cover-letter.typ](./src/cover-letter.typ) | `~/Desktop/cover-letter.pdf` |
| `shokumu-keirekisho` | [src/職務経歴書.typ](./src/職務経歴書.typ) | `~/Desktop/職務経歴書.pdf` |

`make all` (or `make`) builds all three documents. `make clean` removes the three generated PDFs.

To use the bundled Open Sans fonts without installing them:

```shell
typst compile --font-path fonts src/resume.typ ~/Desktop/resume.pdf
```

## Customize the cover letter

Create a local `.env` file with the company and role, then run `make cover-letter`:

```dotenv
COMPANY="Example Company"
ROLE="Platform Engineer"
```

The target passes these values to Typst's `company` and `role` inputs. You can also supply them directly:

```shell
typst compile --font-path fonts \
  --input company="Example Company" \
  --input role="Platform Engineer" \
  src/cover-letter.typ ~/Desktop/cover-letter.pdf
```

## CI

[Build Resume](./.github/workflows/build-resume.yml) compiles the English resume on pushes and pull requests that change its source or the workflow, and supports manual runs. The PDF is uploaded as the `resume` workflow artifact. The cover letter and Japanese work history are not built in CI.
