# DevOps Toolbox

![GitHub last commit](https://img.shields.io/github/last-commit/galvarado/devops-toolbox) ![GitHub contributors](https://img.shields.io/github/contributors/galvarado/devops-toolbox?style=plastic) ![GitHub issues](https://img.shields.io/github/issues/galvarado/devops-toolbox) ![GitHub pull requests](https://img.shields.io/github/issues-pr-raw/galvarado/devops-toolbox) ![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed-raw/galvarado/devops-toolbox) ![GitHub repo size](https://img.shields.io/github/repo-size/galvarado/devops-toolbox)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Welcome to My DevOps Toolbox repository, my personal collection of useful scripts and tools to streamline DevOps and cloud management tasks.
Whether I'm working with Terraform, CI/CD systems, K8s, AWS or other cloud platforms, this repository have me covered.

![Alt text](assets/devopstoolbox.png 'DevOps Toolbox')

## Why This Repository?

In my journey with DevOps activities, I've often come across situations where a well-crafted script made a significant difference in efficiency and productivity. This repository serves as a repository of my personal toolkit, a place where I collect and maintain these scripts for easy access and future use. By sharing them with the community, I hope to help others facing similar challenges.

## Directory Structure

- `scripts/`: Contains various scripts for common DevOps tasks organized by platform, OS or cloud provider.
- `k8s/`: Contains various yaml templates for useful resources when debugging.
- `resources/`: Platforms and online resources

## Resources

Don't forget to check out the [Resources](resources/README.md) directory with a valuable list of tools, platforms and online resources like an online IDE or the best AI Search Engine for Developers and coders.

## How to use it

Before running scripts, ensure that you have the following:

- A Unix-based operating system (e.g., Linux or macOS).
- Permission to execute shell scripts.

### Instructions

1. Clone this repository to your local machine using the following command:

   ```
   git clone https://github.com/your-username/your-repo.git
   ```

2. Execute the init script:
   ```
   cd devops-scripts
   chmod +x init.sh
   ./init.sh
   ```
3. Other tools may come with distinct prerequisites, and for each directory where necessary, there is an individualized README detailing those requirements on each directory.

4. You can execute the scripts directly without copy/paste o the file by executing:
   ```
   bash -c "$(curl -fsSL URL_OF_SCRIPT)"
   ```

Replace `URL_OF_SCRIPT` with the raw URL of the script file you want to execute.

For example to execute the script [add_swap_space.sh](scripts/ubuntu/add_swap_space.sh) directly execute:

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/galvarado/devops-toolbox/main/scripts/ubuntu/add_swap_space.sh)"
```

This command will download the script file from the specified URL using curl, and then execute it using the bash interpreter.

By using this improved command, you can directly execute scripts from GitHub without the need for manual file handling or copying and pasting the script contents.

#### Alias

Consider using an alias for the scripts, useful to use them in any directory.

Here's an example of how to add an alias in the .bashrc file:

1. Open the .bashrc file

   ```
   vi ~/.bashrc
   ```

2. Add the alias definition:

   ```
   alias somealias='bash /path/to/script.sh'
   ```

Replace `somealias` with the actual alia. Replace `/path/to/script.sh` with the actual path to your script file.

3. Save the file and exit the text editor. Source the updated `.bashrc` file to apply the changes:
   ```
   source ~/.bashrc
   ```

Now you can use the alias by typing its name in the terminal. For example, if you named the alias `updatefork`, you can run in your terminal `updatefork` to execute the script without the absolute path.

#### Troubleshooting

If you encounter any issues while running the script or have questions, please open an issue in this repository for assistance.

## Copy, Distribute, and Contribute

Feel free to copy and distribute the contents of this repository. These scripts are meant to be shared and used by the community. If you find them useful, please share them with others. Additionally, you're encouraged to use these scripts as inspiration to create your own tools and solutions.

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

### Contributing

I welcome contributions from the community! If you have comments, suggestions, or improvements to any of the scripts, please open a pull request (PR) to contribute to this repository. Check out our [contribution guidelines](Contributing,md) for more information on how to get involved.

Together, we can build a valuable resource for DevOps professionals everywhere.
