#! /usr/bin/env node
import { Command } from "commander";
import chalk from "chalk";
import inquirer from "inquirer";
import spawn from "cross-spawn";
import path, { dirname, resolve } from "path";
import fs from "fs";
import { fileURLToPath } from "url";
import { runner, Logger } from "hygen";
import { createRequire } from "module";
const require = createRequire(import.meta.url);
const program = new Command();
// 获取当前文件的绝对路径
const __filename = fileURLToPath(import.meta.url);
// 获取当前文件的目录路径
const __dirname = dirname(__filename);

const hygen = (argv) => {
  return runner(argv, {
    templates: "../_templates",
    cwd: __dirname,
    logger: new Logger(console.log.bind(console)),
    debug: !!process.env.DEBUG,
    exec: (action, body) => {
      const opts = body && body.length > 0 ? { input: body } : {};
      return require("execa").command(action, { ...opts, shell: true });
    },
    createPrompter: () => require("enquirer"),
  });
};

program.name("quick-template").description("Use community cli to create").version("0.0.1");

program.on("--help", () => {
  console.log(`\r\nRun ${chalk.cyan(`qt <command> --help`)} for detailed usage of given command\r\n`);
});

program
  .command("create")
  .argument("<name>")
  .option("-p, --project", "create a new project")
  .option("-s, --screen", "create a new screen")
  .option("-z, --store", "create a new store for zustand")
  .action(async (name, options) => {
    const path = process.cwd();
    if (options["project"]) {
      return createProject(name);
    }
    if (options["screen"]) {
      const argv = ["page", "new", "--path", path, "--name", name];
      return hygen(argv);
    }
    if (options["store"]) {
      const argv = ["store", "new", "--path", path, "--name", name];
      return hygen(argv);
    }
  });

program.parse();

// 创建项目
async function createProject(name) {
  const targetDir = path.join(process.cwd(), name);

  if (fs.existsSync(targetDir)) {
    // 询问用户是否确定要覆盖
    let { action } = await inquirer.prompt([
      {
        name: "action",
        type: "list",
        message: "存在命名一样的文件夹",
        choices: [
          { name: "覆盖", value: true },
          { name: "取消", value: false },
        ],
      },
    ]);

    if (!action) {
      return;
    } else if (action) {
      fs.rmSync(targetDir, { recursive: true, force: true });
    }
  }

  await runCommand("npx", ["@react-native-community/cli@latest", "init", name]);
  await mkpjdir(name);
  await addI18n(name);
  await addPackages(name);
  await deleteFile(targetDir + "/App.tsx");
  await deleteFile(targetDir + "/index.js");
  await generatorFile(targetDir);
  return;
}

// 多语言
async function addI18n(name) {
  await runCommand("yarn", ["add", "-D", "@lingui/macro", "@lingui/metro-transformer"], { cwd: `./${name}` });
}

// 路由
async function addPackages(name) {
  await runCommand(
    "yarn",
    [
      "add",
      "@react-navigation/bottom-tabs",
      "@react-navigation/native",
      "@react-navigation/native-stack",
      "react-native-screens",
      "react-native-safe-area-context",
      "@lingui/cli",
      "@lingui/core",
      "@lingui/react",
      "react-native-mmkv",
      "react-native-reanimated",
      "react-native-root-siblings",
      "axios",
      "zustand",
    ],
    { cwd: `./${name}` }
  );
}

// 生成文件
async function generatorFile(name) {
  const argv = ["pj", "new", "--name", name];
  return hygen(argv);
}

// 删除文件
async function deleteFile(path) {
  if (fs.existsSync(path)) {
    fs.rmSync(path, { recursive: true, force: true });
  }
}

// 创建文件夹（项目结构）
async function mkpjdir(name) {
  await fs.mkdir(name + "/src/stores", { recursive: true }, () => {});
  await fs.mkdir(name + "/src/pages", { recursive: true }, () => {});
  await fs.mkdir(name + "/src/components", { recursive: true }, () => {});
  await fs.mkdir(name + "/src/assets", { recursive: true }, () => {});
  await fs.mkdir(name + "/src/libs/utils", { recursive: true }, () => {});
  await fs.mkdir(name + "/src/libs/http", { recursive: true }, () => {});
}

// 创建一个函数来启动子进程
function runCommand(command, args, options = {}) {
  return new Promise((resolve, reject) => {
    const child = spawn(command, args, { stdio: "inherit", ...options });

    child.on("close", (code) => {
      if (code === 0) {
        resolve(`Process finished with code ${code}`);
      } else {
        reject(new Error(`Process exited with code ${code}`));
      }
    });

    child.on("error", (err) => {
      reject(err);
    });
  });
}
