#!/usr/bin/env bash
# S1 proof: look for secrets in tracked files and in history.
set -u
echo "== Tracked files that look like secrets =="
git ls-files | grep -Ei '\.(key|pem|crt|p12|pfx)$|\.env$|id_rsa|id_ed25519|passwords' || echo "none"
echo
echo "== Content patterns in tracked files =="
git grep -nEi 'password\s*[:=]|passwd\s*[:=]|secret\s*[:=]|api[_-]?key|BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY' -- . ':!scripts/check-secrets.sh' || echo "none"
echo
echo "== Same patterns in full history =="
git log -p --all | grep -Ei 'BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY|password\s*[:=]\s*\S+' || echo "none"
