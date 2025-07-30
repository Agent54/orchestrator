
# --ignore-last-opened --github-auth=token --socket=/socket
#d tach -n /workspace/dtach/code-server 
# --user-data-dir=/workspace/code-server/data --extensions-dir=/workspace/code-server/extensions
code-server --disable-telemetry --auth=none --bind-addr=0.0.0.0:8080 --enable-proposed-api=true --disable-workspace-trust --app-name=darc --disable-getting-started-override /workspace/.vscode/orchestrator.code-workspace &

# dtach -c /workspace/dtach/main 
pnpm dev
