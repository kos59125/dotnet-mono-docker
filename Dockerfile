ARG  DOTNET_SDK_VERSION
FROM  microsoft/dotnet:$DOTNET_SDK_VERSION

RUN  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
   && echo "deb http://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
   && apt-get update -y \
   && apt-get install -y mono-devel fsharp \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/*

ENTRYPOINT  ["dotnet"]
