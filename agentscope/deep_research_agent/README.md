# Deep Research Agent Example





### Deployment
[add_user_info.sql](../../../../../mysql/add_user_info.sql)

## Starting the server
```
npm install -g tavily-mcp@latest
uvicorn agentscope/deep_research_agent/main_server:app
```

The python script will run the nodejs "npx -y tavily-mcp@latest"

Set the environment variable in the input form or as env variables
``` 
export DASHSCOPE_API_KEY="your_dashscope_api_key_here"
export TAVILY_API_KEY="you[add_user_info.sql](../../../../../mysql/add_user_info.sql)r_tavily_api_key_here"
export AGENT_OPERATION_DIR="your_own_direction_here"
```

### The main server is a FastAPI server which expose the app in default 8000 port.

endpoint: http://localhost:8000/chat

curl -X POST "http://localhost:8000/chat" \
  -H "Content-Type: application/json" \
  -d '{"messages":[{"role":"user","content":"What is difference between MCPs and skills?"}]}'

## Expected Result

{"type": "assistant", "format": "text", "content": "{\n  \"type\": \"text\",\n  \"text\": \"Create and write ./agentscope/examples/agent/deep_research_agent/deepresearch_agent_demo_env/Friday260209165138_detailed_report.md successfully.\"\n}", "section": "answer", "message_id": "5d878be8-82df-4c23-8fa6-564bf745775b", "content_type": "text/markdown", "template": "streaming_content_type", "task_ids": "", "tab_message_ids": "", "tab_id": ""}


### Deploy Live Agent URL









## What This Example Demonstrates

This example shows a **DeepResearch Agent** implementation using the AgentScope framework. The DeepResearch Agent specializes in performing multi-step research to collect and integrate information from multiple sources, and generates comprehensive reports to solve complex tasks.
## Prerequisites

- Python 3.10 or higher
- Node.js and npm (for the MCP server)
- DashScope API key from [Alibaba Cloud](https://dashscope.console.aliyun.com/)
- Tavily search API key from [Tavily](https://www.tavily.com/)

## How to Run This Example
1. **Set Environment Variable**:
   ```bash
   export DASHSCOPE_API_KEY="your_dashscope_api_key_here"
   export TAVILY_API_KEY="your_tavily_api_key_here"
   export AGENT_OPERATION_DIR="your_own_direction_here"
   ```
2. **Test Tavily MCP Server**:
    ```bash
    npx -y tavily-mcp@latest
    ```

2. **Run the script**:
    ```bash
   python main.py
   ```

## Connect to Web Search MCP client
The DeepResearch Agent only supports web search through the Tavily MCP client currently. To use this feature, you need to start the MCP server locally and establish a connection to it.
```
from agentscope.mcp import StdIOStatefulClient

tavily_search_client= StdIOStatefulClient(
    name="tavily_mcp",
    command="npx",
    args=["-y", "tavily-mcp@latest"],
    env={"TAVILY_API_KEY": os.getenv("TAVILY_API_KEY", "")},
)
await tavily_search_client.connect()
```

> Note: The example is built with DashScope chat model. If you want to change the model in this example, don't forget
> to change the formatter at the same time! The corresponding relationship between built-in models and formatters are
> list in [our tutorial](https://doc.agentscope.io/tutorial/task_prompt.html#id1)
