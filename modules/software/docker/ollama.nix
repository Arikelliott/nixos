{

    # --- Ollama Software Module
    virtualisation = {
        oci-containers.backend = "docker";
        oci-containers.containers = { # List all containers and options to run.
            ollama = { # Run Ollama container.
                # hostname = "ollama";
                image = "ollama/ollama:rocm";
                # image = "ollama/ollama";
                volumes = [
                    "ollama:/root/.ollama"
                ];
                ports = [
                    "11434:11434"
                ];
                extraOptions = [
                    "--device=/dev/kfd"
                    "--device=/dev/dri"
                ];
            };
            # ollama-webui = { # Run WebUI for Ollama.
            #   hostname = "open-webui";
            #   image = "ghcr.io/open-webui/open-webui:main";
            # };
        };
    };

}