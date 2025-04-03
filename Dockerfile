FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy all files into the container
COPY . /app

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install gui-agents

# Allow terminal output to appear in real-time
ENV PYTHONUNBUFFERED=1

# Default command: run a demo task using OpenAI
CMD ["python", "scripts/run_agent.py", "--env", "osworld", "--agent", "agent_s2", "--task", "tasks/osworld/open_calculator.yaml"]
