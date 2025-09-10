import random

# Step 1 & 2: Create a list of at least 400 workers dynamically
# Each worker has a name, gender, and salary
workers = []
genders = ["Male", "Female"]

for i in range(1, 401):
    worker = {
        "id": i,
        "name": f"Worker_{i}",
        "gender": random.choice(genders),
        "salary": random.randint(5000, 35000)  # random salary between 5k and 35k
    
    }
    workers.append(worker)

# Step 3: Generate payment slips for all workers
for worker in workers:
    try:
        salary = worker["salary"]
        gender = worker["gender"]
        emp_level = "Unassigned"

        # Step 4: Apply conditions
        if 10000 < salary < 20000:
            emp_level = "A1"
        if 7500 < salary < 30000 and gender == "Female":
            emp_level = "A5-F"

        # Payment slip
        print(f"Payment Slip - {worker['name']}")
        print(f"ID: {worker['id']}")
        print(f"Gender: {gender}")
        print(f"Salary: ${salary}")
        print(f"Employee Level: {emp_level}")
        print("-" * 40)

    except KeyError as e:
        print(f"Error: Missing key {e} in worker data for worker {worker.get('id', 'Unknown')}")
    except Exception as e:
        print(f"Unexpected error for worker {worker.get('id', 'Unknown')}: {e}")