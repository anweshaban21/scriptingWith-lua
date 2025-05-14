
local filename = "todo.txt"

function load_tasks()
    local tasks = {}
    local file = io.open(filename, "r")
    if file then
        for line in file:lines() do
            table.insert(tasks, line)
        end
        file:close()
    end
    return tasks
end

function save_tasks(tasks)
    local file = io.open(filename, "w")
    for _, task in ipairs(tasks) do
        file:write(task .. "\n")
    end
    file:close()
end

function show_tasks(tasks)
    if #tasks == 0 then
        print("Your to-do list is empty.")
        return
    end
    print("To-Do List:")
    for i, task in ipairs(tasks) do
        print(i .. ". " .. task)
    end
end

-- Add a task
function add_task(tasks, task)
    table.insert(tasks, task)
    print("Task added: " .. task)
end

-- Remove a task
function remove_task(tasks, index)
    if tasks[index] then
        print("Removed: " .. tasks[index])
        table.remove(tasks, index)
    else
        print("Invalid task number.")
    end
end

-- Main loop
function main()
    local tasks = load_tasks()

    while true do
        print("\n[1] View Tasks\n[2] Add Task\n[3] Remove Task\n[4] Exit")
        io.write("Choose an option: ")
        local choice = io.read()

        if choice == "1" then
            show_tasks(tasks)
        elseif choice == "2" then
            io.write("Enter a new task: ")
            local task = io.read()
            add_task(tasks, task)
            save_tasks(tasks)
        elseif choice == "3" then
            show_tasks(tasks)
            io.write("Enter task number to remove: ")
            local index = tonumber(io.read())
            remove_task(tasks, index)
            save_tasks(tasks)
        elseif choice == "4" then
            print("Goodbye!")
            break
        else
            print("Invalid option.")
        end
    end
end

main()
