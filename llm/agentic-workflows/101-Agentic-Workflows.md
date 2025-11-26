# 101 Agentic Workflows – 2025 Production Edition  
**LangGraph + CrewAI + Real-World Patterns**

The definitive cheat sheet used by every team building autonomous agents in 2025 — from simple tool-calling bots to multi-agent research systems.

### 1. Core Setup & Environment (10)
| Command | Purpose | Real Usage |
|---------|--------|-----------|
| pip install langgraph langchain-openai langchain-anthropic crewai | Core stack | Every project |
| pip install langchain-community langchain-experimental | Extra tools | |
| export OPENAI_API_KEY=sk-... | Env vars | |
| export ANTHROPIC_API_KEY=... | Claude 3.5 | |
| export SERPER_API_KEY=... | Google search | |
| export TAVILY_API_KEY=... | Better search | |
| export LANGCHAIN_TRACING_V2=true | LangSmith | |
| export LANGCHAIN_PROJECT="agent-prod" | Project name | |
| from langgraph.graph import StateGraph, END | LangGraph base | |
| from crewai import Agent, Task, Crew | CrewAI base | |

### 2. LangGraph – State + Nodes + Edges (The Real Standard) (18)
| Pattern | Command | When Used |
|--------|--------|-----------|
| Define State | class AgentState(TypedDict): messages: Annotated[list, add_messages] | All graphs |
| Simple Node | def chatbot(state): return {"messages": [llm.invoke(state["messages"])]} | |
| Tool Node | tools = [search_tool]; tool_node = ToolNode(tools) | |
| Conditional Edge | def decide_toolk(state): return "tools" if needs tool else END | |
| Full Graph | graph = StateGraph(AgentState); graph.add_node("agent", chatbot); graph.add_node("tools", tool_node) | |
| Set Entry | graph.set_entry_point("agent") | |
| Conditional Routing | graph.add_conditional_edges("agent", should_continue, {"continue": "tools", "end": END}) | |
| Tool → Agent Loop | graph.add_edge("tools", "agent") | |
| Compile | app = graph.compile() | |
| Stream | for s in app.stream({"messages": [("human", "What is the weather in SF?")]}) | Real-time UI |
| Checkpointer | app = graph.compile(checkpointer=MemorySaver()) | Persistence |
| Thread ID | config = {"configurable": {"thread_id": "abc123"}} | Multi-user |
| Human-in-the-loop | graph.add_conditional_edges("agent", lambda x: "human" if needs approval else "tools") | |
| Supervisor Node | def supervisor(state): return route_next_agent(state) | Multi-agent |
| Parallel Fan-out | from langgraph.prebuilt import tools_condition | Built-in |
| State Reduction | def reduce(state): return final_answer | |
| Error Handling | @tool def safe_divide(a: float, b: float) -> float: "Safe division" | |
| Streaming Tokens | for s in app.stream(inputs, stream_mode="values"): print(s["messages"][-1].content) | |

### 3. CrewAI – Multi-Agent Teams (Simpler Syntax) (14)
| Command | Role | Example |
|--------|------|---------|
| researcher = Agent(role="Senior Researcher", goal="...", backstory="...", tools=[search], llm=claude) | Define agent | |
| writer = Agent(role="Writer", goal="Write compelling article", backstory="...", tools=[], llm=gpt4o) | | |
| task1 = Task(description="Research topic X", expected_output="Report", agent=researcher) | | |
| task2 = Task(description="Write article from report", expected_output="Markdown article", agent=writer) | | |
| crew = Crew(agents=[researcher, writer], tasks=[task1, task2], verbose=2) | | |
| result = crew.kickoff(inputs={"topic": "AI in 2025"}) | Run | |
| crew = Crew(..., manager_llm=claude, process=Process.hierarchical) | Supervisor | |
| task3 = Task(..., agent=researcher, human_input=True) | Approval step | |
| crew = Crew(..., memory=True, cache=True) | Persistence | |
| agent = Agent(..., allow_delegation=True) | Auto-delegate | |
| task = Task(..., output_file="report.md") | Save result | |
| crew = Crew(..., max_rpm=30) | Rate limiting | |
| result = crew.kickoff() | Execute | |
| print(crew.usage_metrics) | Cost tracking | |

### 4. Real-World Agent Patterns (Used Daily in 2025) (16)
| Pattern | Tools | Example Use Case |
|--------|------|------------------|
| ReAct Agent | LangGraph + tools | General problem solving |
| Plan-and-Execute | planner → executor loop | Long-horizon tasks |
| Tool-Calling Agent | OpenAI function calling | GPT-4o, Claude 3.5 |
| Multi-Agent Debate | 3 agents argue → judge | Better reasoning |
| Reflection / Self-Critique | generate → critique → revise | Writing, coding |
| Code Interpreter Agent | Python REPL tool | Data analysis |
| Web Browser Agent | playwright or browserbase | Real browsing |
| SQL Agent | sql_db_query tool | Database queries |
| RAG + Agent | retrieve → reason → answer | Knowledge work |
| Human-in-the-Loop | pause + approval node | Finance, legal |
| Memory Agent | vector store + conversation history | Personal assistant |
| Router Agent | classify query → route to specialist | Customer support |
| Evaluator Agent | grade output → retry if low | Quality control |
| Tool-Former Style | train on tool use traces | Future SOTA |
| Streaming Agent | stream intermediate steps | UX |
| Async Agent | async def node + asyncio.run() | High throughput |

### 5. Tools & Toolkits (12)
| Tool | Command | Source |
|------|--------|--------|
| Tavily Search | from langchain_community.tools.tavily_search import TavilySearchResults | Best search |
| Google Serper | serperdev/serper | |
| DuckDuckGo | duckduckgo-search | Free |
| Wikipedia | wikipedia | |
| Python REPL | from langchain_experimental.utilities import PythonREPL | |
| SQL Database | from langchain_community.utilities import SQLDatabase | |
| Requests / API | @tool def fetch_url(url: str) | Custom |
| Browser | from langchain_community.tools.playwright import NavigateTool | |
| File System | read_file, write_file | |
| Shell | bash tool | |
| Calculator | from langchain.tools import StructuredTool | |
| Custom Tool | @tool def multiply(a: int, b: int) -> int: | |

### 6. Evaluation & Testing (10)
| Command | Purpose |
|--------|--------|
| langsmith eval create --dataset agent-testset | |
| from langsmith import Client; client = Client() | |
| client.run_on_dataset(..., app) | |
| RAGAS for agent trajectories | |
| AgentOps tracking | |
| Phoenix tracing | |
| Custom grader: score reasoning chain | |
| Success rate > 85% on internal benchmark | |
| Average cost per task < $0.50 | |
| Latency < 30s for complex tasks | |

### 7. Production Deployment (8)
| Command | Tool |
|--------|------|
| LangGraph → FastAPI + LangServe | |
| CrewAI → Docker + Uvicorn | |
| LangGraph Platform (langgraph.dev) | Hosted |
| Vercel AI SDK + LangChain.js | Frontend agents |
| Streamlit + st.chat_* | Quick UI |
| Gradio interface | Demo |
| Docker + GPU + vLLM backend | |
| Kubernetes + autoscaling | |

### Final Agentic Checklist (Every Production Team)
- [ ] Tools have clear schemas & error handling  
- [ ] Max steps / tokens bounded  
- [ ] Human approval for high-risk actions  
- [ ] Streaming + intermediate steps shown  
- [ ] Cost & latency monitored per task  
- [ ] Evaluation suite runs weekly  
- [ ] Fallback to simple LLM if agent fails  
- [ ] All external calls logged  
- [ ] Prompt injection guardrails  
- [ ] Versioned agent logic (git)  

## Resources (Actually Used in 2025)
- LangGraph Docs → https://langchain-ai.github.io/langgraph/
- CrewAI → https://www.crewai.com
- LangGraph Platform → https://langgraph.dev
- AgentOps → https://www.agentops.dev
- Tavily → https://tavily.com

