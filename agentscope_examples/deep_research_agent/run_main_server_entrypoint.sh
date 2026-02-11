# -*- coding: utf-8 -*-
"""The main entry point of the Deep Research agent example."""

## Starting the server
npx -y tavily-mcp@latest
export DASHSCOPE_API_KEY="your_dashscope_api_key_here"
export TAVILY_API_KEY="your_tavily_api_key_here"
export AGENT_OPERATION_DIR="your_own_direction_here"

uvicorn main_server:app --host 0.0.0.0 --port 8000 --reload

### endpoint: http://localhost:8000/chat

curl -X POST "http://localhost:8000/chat" \
  -H "Content-Type: application/json" \
  -d '{"messages":[{"role":"user","content":"What is difference between MCPs and skills?"}]}'

## Expected Result

{"type": "assistant", "format": "text", "content": "{\n  \"type\": \"text\",\n  \"text\": \"Create and write ./agentscope/examples/agent/deep_research_agent/deepresearch_agent_demo_env/Friday260209165138_detailed_report.md successfully.\"\n}", "section": "answer", "message_id": "5d878be8-82df-4c23-8fa6-564bf745775b", "content_type": "text/markdown", "template": "streaming_content_type", "task_ids": "", "tab_message_ids": "", "tab_id": ""}










