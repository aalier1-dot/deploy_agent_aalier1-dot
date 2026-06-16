My link for the video
https://drive.google.com/file/d/1n_65yENz_LpMy6bn0TyuE1knZoQiqrB8/view?usp=sharing 
# deploy_agent_aalier1-dot

## Project Overview
A shell script that automates the creation of a Student Attendance Tracker workspace, configures settings via the command line, and handles system signals gracefully.

## How to Run the Script

1. Clone the repository:
git clone https://github.com/aalier1-dot/deploy_agent_aalier1-dot.git

2. Navigate into the project folder:
cd deploy_agent_aalier1-dot

3. Make the script executable:
chmod +x setup_project.sh

4. Run the script:
./setup_project.sh

5. Follow the prompts:
- Enter a project name suffix e.g. aalier1
- Type yes or no to update thresholds
- If yes, enter new Warning % and Failure %

## How to Trigger the Archive Feature
1. Run the script:
./setup_project.sh

2. Enter a project name suffix when prompted

3. Press Ctrl+C at any point during execution

4. The script will:
- Catch the SIGINT signal
- Bundle the incomplete project into a tar.gz archive
- Delete the incomplete directory automatically

## Directory Structure Created
attendance_tracker_aalier1/
- attendance_checker.py
- Helpers/
  - assets.csv
  - config.json
- reports/
  - reports.log

## Requirements
- bash
- python3
