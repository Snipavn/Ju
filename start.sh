websockify --web=/novnc 6080 localhost:5900 &
    python3 -m http.server 6080 && qemu-system-x86_64 \
    -m 16500 \
    -drive file=/data/vm.raw,format=raw,if=virtio \
    -drive file=/opt/qemu/seed.iso,format=raw,if=virtio \
    -netdev user,id=net0,hostfwd=tcp::2222-:22 \
    -device virtio-net,netdev=net0 \
    -vga virtio \
    -display vnc=:0
