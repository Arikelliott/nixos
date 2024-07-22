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
            open-webui = { # Run WebUI for Ollama.
                hostname = "open-webui";
                image = "ghcr.io/open-webui/open-webui:main";
                volumes = [
                    "open-webui:/app/backend/data"
                ];
                ports = [
                    "3000:8080"
                ];
                extraOptions = [
                    "--add-host=host.docker.internal:host-gateway"
                ];
            };
        };
    };

}


# docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main

# docker run -d --device /dev/kfd --device /dev/dri -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:rocm
