return{
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    local config = {
      cmd = { "jdtls" },
      root_dir = vim.fs.dirname(
        vim.fs.find({ "gradlew", ".git", "mvnw", "mvn", "pom.xml" }, { upward = true })[1]
      ),
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-17",
                path = "/lib/jvm/java-17-openjdk/",
              },
            },
          },
        },
      },
    }
    require("jdtls").start_or_attach(config)
  end,
}
