# ImFUEL

[ImHex](https://imhex.werwolv.net/) patterns for FUEL data structures.

<sup>This repository is a relative of the main [FMTK repository](https://github.com/widberg/fmtk).</sup>

## Table of Contents

### Hex Patterns

| Name | MIME | Path | Description |
|------|------|------|-------------|
| Animation_Z | application/x-animation-z | [`patterns/Animation_Z.hexpat`](patterns/Animation_Z.hexpat) | Animation_Z |
| Binary_Z | application/x-binary-z | [`patterns/Binary_Z.hexpat`](patterns/Binary_Z.hexpat) | Binary_Z |
| Bitmap_Z | application/x-bitmap-z | [`patterns/Bitmap_Z.hexpat`](patterns/Bitmap_Z.hexpat) | Bitmap_Z |
| Camera_Z | application/x-camera-z | [`patterns/Camera_Z.hexpat`](patterns/Camera_Z.hexpat) | Camera_Z |
| CollisionVol_Z | application/x-collision-vol-z | [`patterns/CollisionVol_Z.hexpat`](patterns/CollisionVol_Z.hexpat) | CollisionVol_Z |
| DPC | application/x-dpc | [`patterns/DPC.hexpat`](patterns/DPC.hexpat) | DPC |
| Fonts_Z | application/x-fonts-z | [`patterns/Fonts_Z.hexpat`](patterns/Fonts_Z.hexpat) | Fonts_Z |
| GameObj_Z | application/x-game-obj-z | [`patterns/GameObj_Z.hexpat`](patterns/GameObj_Z.hexpat) | GameObj_Z |
| GenWorld_Z | application/x-gen-world-z | [`patterns/GenWorld_Z.hexpat`](patterns/GenWorld_Z.hexpat) | GenWorld_Z |
| GwRoad_Z | application/x-gw-road-z | [`patterns/GwRoad_Z.hexpat`](patterns/GwRoad_Z.hexpat) | GwRoad_Z |
| LightData_Z | application/x-light-data-z | [`patterns/LightData_Z.hexpat`](patterns/LightData_Z.hexpat) | LightData_Z |
| Lod_Z | application/x-lod-z | [`patterns/Lod_Z.hexpat`](patterns/Lod_Z.hexpat) | Lod_Z |
| LodData_Z | application/x-lod-data-z | [`patterns/LodData_Z.hexpat`](patterns/LodData_Z.hexpat) | LodData_Z |
| Material_Z | application/x-material-z | [`patterns/Material_Z.hexpat`](patterns/Material_Z.hexpat) | Material_Z |
| MaterialAnim_Z | application/x-material-anim-z | [`patterns/MaterialAnim_Z.hexpat`](patterns/MaterialAnim_Z.hexpat) | MaterialAnim_Z |
| MaterialObj_Z | application/x-material-obj-z | [`patterns/MaterialObj_Z.hexpat`](patterns/MaterialObj_Z.hexpat) | MaterialObj_Z |
| Mesh_Z | application/x-mesh-z | [`patterns/Mesh_Z.hexpat`](patterns/Mesh_Z.hexpat) | Mesh_Z |
| MeshData_Z | application/x-mesh-data-z | [`patterns/MeshData_Z.hexpat`](patterns/MeshData_Z.hexpat) | MeshData_Z |
| Node_Z | application/x-node-z | [`patterns/Node_Z.hexpat`](patterns/Node_Z.hexpat) | Node_Z |
| Omni_Z | application/x-omni-z | [`patterns/Omni_Z.hexpat`](patterns/Omni_Z.hexpat) | Omni_Z |
| Particles_Z | application/x-particles-z | [`patterns/Particles_Z.hexpat`](patterns/Particles_Z.hexpat) | Particles_Z |
| ParticlesData_Z | application/x-particles-data-z | [`patterns/ParticlesData_Z.hexpat`](patterns/ParticlesData_Z.hexpat) | ParticlesData_Z |
| RotShape_Z | application/x-rot-shape-z | [`patterns/RotShape_Z.hexpat`](patterns/RotShape_Z.hexpat) | RotShape_Z |
| RotShapeData_Z | application/x-rot-shape-data-z | [`patterns/RotShapeData_Z.hexpat`](patterns/RotShapeData_Z.hexpat) | RotShapeData_Z |
| Rtc_Z | application/x-rtc-z | [`patterns/Rtc_Z.hexpat`](patterns/Rtc_Z.hexpat) | Rtc_Z |
| Skel_Z | application/x-skel-z | [`patterns/Skel_Z.hexpat`](patterns/Skel_Z.hexpat) | Skel_Z |
| Skin_Z | application/x-skin-z | [`patterns/Skin_Z.hexpat`](patterns/Skin_Z.hexpat) | Skin_Z |
| Sound_Z | application/x-sound-z | [`patterns/Sound_Z.hexpat`](patterns/Sound_Z.hexpat) | Sound_Z |
| Spline_Z | application/x-spline-z | [`patterns/Spline_Z.hexpat`](patterns/Spline_Z.hexpat) | Spline_Z |
| SplineGraph_Z | application/x-spline-graph-z | [`patterns/SplineGraph_Z.hexpat`](patterns/SplineGraph_Z.hexpat) | SplineGraph_Z |
| Surface_Z | application/x-surface-z | [`patterns/Surface_Z.hexpat`](patterns/Surface_Z.hexpat) | Surface_Z |
| SurfaceDatas_Z | application/x-surface-datas-z | [`patterns/SurfaceDatas_Z.hexpat`](patterns/SurfaceDatas_Z.hexpat) | SurfaceDatas_Z |
| UserDefine_Z | application/x-user-define-z | [`patterns/UserDefine_Z.hexpat`](patterns/UserDefine_Z.hexpat) | UserDefine_Z |
| Warp_Z | application/x-warp-z | [`patterns/Warp_Z.hexpat`](patterns/Warp_Z.hexpat) | Warp_Z |
| World_Z | application/x-world-z | [`patterns/World_Z.hexpat`](patterns/World_Z.hexpat) | World_Z |
| WorldRef_Z | application/x-world-ref-z | [`patterns/WorldRef_Z.hexpat`](patterns/WorldRef_Z.hexpat) | WorldRef_Z |

### Scripts

| Name | Path | Description |
|------|------|-------------|
| validate | [`scripts/validate.py`](scripts/validate.py) | Runs the patterns against all files in a directory recursively |

### Pattern Libraries

| Name | Path | Description |
|------|------|-------------|
| fuel | [`includes/fuel.hexpat`](includes/fuel.hexpat) | FUEL Library |

### Magic files

| Name | Path | Description |
|------|------|-------------|
| FUEL | [`magic/fuel_magic`](magic/fuel_magic) | Identifies common file types used in FUEL |

## Getting Started

### Checkout

```sh
git clone https://github.com/widberg/ImFUEL.git --recurse-submodules --shallow-submodules
```

### Usage

Add the `ImFUEL` directory to ImHex `Help -> Settings -> Folders -> +`. Install the "Std" and "Type" ImHex libraries from `Help -> Content Store -> Libraries`.

### Validate

To run the validate script you will need to build the PatternLanguage project's `plcli` tool by following the instructions for your system [here](https://github.com/WerWolv/ImHex/tree/master/dist/compiling). Note that those instructions are for compiling ImHex but they work on the PatternLanguage project too. The script expects to find the tool at `ImFUEL/build/cli/plcli`.
