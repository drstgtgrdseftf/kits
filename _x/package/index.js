#!/usr/bin/env node
/* release-gate: runs the workspace release checks and prints a summary. */
"use strict";
const os = require("os");
const path = require("path");

function banner() {
  console.log("[release-gate] node " + process.version + " on " + os.platform() + "/" + os.arch());
}

function main() {
  banner();
  const run = require("./lib/checks.cjs");
  const summary = run(process.cwd());
  console.log("[release-gate] checks passed: " + summary.passed + "/" + summary.total);
  if (summary.report) console.log("[release-gate] report: " + summary.report);
}

main();
