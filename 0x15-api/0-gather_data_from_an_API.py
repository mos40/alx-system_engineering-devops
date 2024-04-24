#!/usr/bin/python3

import requests
import sys

def fetch_employee_data(employee_id):
    url = f"https://jsonplaceholder.typicode.com/users/{employee_id}/todos"
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        print("Failed to fetch data from the API.")
        sys.exit(1)

def display_todo_progress(employee_id, todo_data):
    total_tasks = len(todo_data)
    completed_tasks = [task for task in todo_data if task['completed']]
    num_completed_tasks = len(completed_tasks)
    employee_name = todo_data[0]['name']
    
    print(f"Employee {employee_name} is done with tasks({num_completed_tasks}/{total_tasks}):")
    for task in completed_tasks:
        print(f"\t{task['title']}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 gather_data_from_an_API.py <employee_id>")
        sys.exit(1)
    
    employee_id = int(sys.argv[1])
    todo_data = fetch_employee_data(employee_id)
    display_todo_progress(employee_id, todo_data)
