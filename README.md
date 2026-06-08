# Robô Garçom Autônomo em ROS Noetic

Este projeto simula um robô garçom em ambiente ROS Noetic, utilizando Gazebo, RViz, GMapping, AMCL e move_base.

## Tecnologias usadas

- ROS Noetic
- Gazebo
- RViz
- GMapping
- AMCL
- move_base
- Docker

## Estrutura

```text
src/
├── garcom_description/
├── garcom_gazebo/
├── garcom_maps/
├── garcom_navigation/
└── garcom_missions/
```

## Como executar

Clone o repositório:

```bash
git clone https://github.com/SEU_USUARIO/ros-garcom-noetic.git
cd ros-garcom-noetic
```

Crie a imagem Docker:

```bash
docker build -t ros-garcom-noetic .
```

Entre no container:

```bash
./scripts/run_container.sh
```

Dentro do container, compile o workspace:

```bash
./scripts/build_ws.sh
```

## Rodar a simulação

Use três terminais.

Terminal 1 — Gazebo:

```bash
./scripts/run_gazebo.sh
```

Terminal 2 — Navegação:

```bash
./scripts/exec_container.sh
./scripts/run_navigation.sh
```

Terminal 3 — RViz:

```bash
./scripts/exec_container.sh
./scripts/run_rviz.sh
```

No RViz:

1. Configure Fixed Frame como map.
2. Adicione Map, RobotModel, LaserScan, TF e Path.
3. Use 2D Pose Estimate para alinhar o robô no mapa.
4. Use 2D Nav Goal para enviar o robô até um ponto livre próximo a uma mesa.

## Mapeamento

Para gerar o mapa novamente, rode o Gazebo, depois:

```bash
./scripts/run_mapping.sh
```

Use o teleop:

```bash
rosrun teleop_twist_keyboard teleop_twist_keyboard.py
```

Para salvar o mapa:

```bash
cd /root/garcom_ws/src/garcom_maps/maps
rosrun map_server map_saver -f restaurante
```

## Observações

- Durante o mapeamento, use GMapping.
- Durante a navegação com mapa salvo, use AMCL e move_base.
- Não rode GMapping e AMCL ao mesmo tempo.
- Se o robô aparecer em posição errada no RViz, use 2D Pose Estimate.
- Envie metas para pontos livres próximos às mesas, não para o centro delas.

## Arquivos importantes

O mapa salvo deve estar em:

```text
src/garcom_maps/maps/restaurante.pgm
src/garcom_maps/maps/restaurante.yaml
```
