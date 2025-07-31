git config user.name "$GH_USERNAME"
git config user.email "$GH_EMAIL"
git config credential.helper store

# --ignore-last-opened --socket=/socket
#d tach -n /workspace/dtach/code-server 
# --user-data-dir=/workspace/code-server/data --extensions-dir=/workspace/code-server/extensions --auth=none
GITHUB_TOKEN=$GH_TOKEN code-server --disable-telemetry --bind-addr=0.0.0.0:8080 --enable-proposed-api=true --disable-workspace-trust --app-name=darc --disable-getting-started-override /workspace/.vscode/orchestrator.code-workspace &

# dtach -c /workspace/dtach/main 
pnpm dev
