#!/usr/bin/env bash
# Assignment 1 — checker
# Confirms a submitted answers.md is complete and checks the objective parts
# (Q3 correction choice, Q4 ordering, Q5 keyword). Q1, Q2, Q6, and the Part 2
# bridge are graded manually, not auto-checked here.
#
# Q3 and Q4 have one exact correct answer, so this script compares a SHA-256
# hash of the expected answer rather than storing it as plaintext — reading
# this script's source does not reveal the answer key.
#
# Usage: check.sh <path-to-your-submission-folder>
#   (the folder must contain answers.md)
set -uo pipefail

SUBMISSION_DIR="${1:-}"
if [ -z "$SUBMISSION_DIR" ] || [ ! -d "$SUBMISSION_DIR" ]; then
  echo "Usage: $0 <path-to-your-submission-folder>" >&2
  exit 1
fi
FILE="$SUBMISSION_DIR/answers.md"
if [ ! -f "$FILE" ]; then
  echo "FAIL — $FILE not found. Your submission folder must contain answers.md." >&2
  exit 1
fi

if ! command -v shasum >/dev/null 2>&1 && ! command -v sha256sum >/dev/null 2>&1; then
  echo "FAIL — this checker needs shasum or sha256sum, and neither was found." >&2
  exit 1
fi
sha256() {
  if command -v sha256sum >/dev/null 2>&1; then
    printf '%s' "$1" | sha256sum | awk '{print $1}'
  else
    printf '%s' "$1" | shasum -a 256 | awk '{print $1}'
  fi
}

# Strip carriage returns (CRLF to LF) for Windows compatibility
if command -v sed >/dev/null 2>&1; then
  sed -i.bak 's/\r$//' "$FILE" 2>/dev/null || true
  rm -f "${FILE}.bak" 2>/dev/null || true
fi

fail=0
echo "== Assignment 1 — checking $(basename "$FILE") =="
echo

# --- Part A: every required label is present and non-empty -----------------
echo "-- Part A: all answers present --"
declare -a labels=(
  "ANSWER_1"
  "ANSWER_2"
  "ANSWER_3"
  "ANSWER_3_WHY"
  "ANSWER_4_ORDER"
  "ANSWER_5"
  "ANSWER_6"
  "ANSWER_7_BRIDGE"
)
for label in "${labels[@]}"; do
  line="$(grep -E "^${label}:" "$FILE" | head -n1)"
  value="$(echo "$line" | sed -E "s/^${label}:[[:space:]]*//")"
  if [ -z "$value" ] || echo "$value" | grep -qE '^<.*>$'; then
    echo "FAIL — $label is missing or still has the placeholder text."
    fail=1
  else
    echo "PASS — $label answered."
  fi
done

echo
echo "-- Part B: objective answers are correct --"

# Q3 — exactly one of the four options is correct; checked by hash so the
# correct value never appears in this script's source or its output.
EXPECTED_ANSWER3_HASH="3f1bb7c0da3c01e685edd592f3a3ca0b149a399d25b97c0da47118c24a39f59a"
answer3="$(grep -E '^ANSWER_3:' "$FILE" | head -n1 | grep -oE '400|640|755|777' | head -n1)"
if [ -n "$answer3" ] && [ "$(sha256 "$answer3")" = "$EXPECTED_ANSWER3_HASH" ]; then
  echo "PASS — ANSWER_3 is correct."
else
  echo "FAIL — ANSWER_3 is not correct. Re-check the four-option table in the assignment brief."
  fail=1
fi

# Q4 — one exact correct order; checked by hash for the same reason.
EXPECTED_ANSWER4_HASH="b3caffa20004e48acad8af586346220b84dd47a272ec01718ccf1618a5cc4f14"
order_line="$(grep -E '^ANSWER_4_ORDER:' "$FILE" | head -n1)"
order_normalized="$(echo "$order_line" | sed -E 's/^ANSWER_4_ORDER:[[:space:]]*//' | tr -d '[:space:]' | tr '[:lower:]' '[:upper:]')"
if [ -n "$order_normalized" ] && [ "$(sha256 "$order_normalized")" = "$EXPECTED_ANSWER4_HASH" ]; then
  echo "PASS — ANSWER_4_ORDER is correct."
else
  echo "FAIL — ANSWER_4_ORDER is not correct. Re-check the ordering hint in the assignment brief."
  fail=1
fi

# Q5 — many different answers are acceptable, so this stays a keyword check
# rather than one exact answer; it does not name a single correct sentence.
answer5="$(grep -E '^ANSWER_5:' "$FILE" | head -n1 | tr '[:upper:]' '[:lower:]')"
if echo "$answer5" | grep -qE 'world|everyone|anyone|unauthorized|write|execute|attacker|tamper|overwrite'; then
  echo "PASS — ANSWER_5 names a concrete risk of chmod 777."
else
  echo "FAIL — ANSWER_5 doesn't clearly name a concrete risk (e.g. who gains access and what they could do)."
  fail=1
fi

echo
if [ "$fail" -eq 0 ]; then
  echo "=================================="
  echo "PASS — all automated checks passed. Q1, Q2, Q6, and the Part 2 bridge are graded manually."
  echo "=================================="
  exit 0
else
  echo "=================================="
  echo "FAIL — see messages above."
  echo "=================================="
  exit 1
fi
