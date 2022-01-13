// Vertex shader
// - store the output of our vertex shader
struct VertexOutput {
    [[builtin(position)]] clip_position: vec4<f32>;
};


[[stage(vertex)]] // mark this func as an entry point for a vertex shader
fn vs_main(
    [[builtin(vertex_index)]] in_vertex_index: u32,
) -> VertexOutput {
    // var -> mutable but must specify their type
    // let -> type inferred but immutable
    var out: VertexOutput;
    let x = f32(1 - i32(in_vertex_index)) * 0.5;
    let y = f32(i32(in_vertex_index & 1u) * 2 - 1) * 0.5;
    out.clip_position = vec4<f32>(x, y, 0.0, 1.0);
    return out;
}

// Fragment shader
[[stage(fragment)]]
fn fs_main(in: VertexOutput) -> [[location(0)]] vec4<f32> {
    return vec4<f32>(0.9, 0.2, 0.1, 1.0);
}
