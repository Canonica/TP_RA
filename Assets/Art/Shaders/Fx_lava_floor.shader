// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.6543577,fgcg:0.7637066,fgcb:0.9779412,fgca:1,fgde:0.03,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4445,x:34620,y:32548,varname:node_4445,prsc:2|emission-8691-OUT,clip-4726-OUT;n:type:ShaderForge.SFN_Tex2d,id:1108,x:32142,y:32951,ptovrint:False,ptlb:node_1108,ptin:_node_1108,varname:node_1108,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:2246,x:31651,y:32853,varname:node_2246,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:3383,x:32041,y:32642,varname:node_3383,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-2246-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3883,x:32217,y:32642,varname:node_3883,prsc:2|A-3383-OUT,B-3383-OUT;n:type:ShaderForge.SFN_ComponentMask,id:2204,x:32380,y:32652,varname:node_2204,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-3883-OUT;n:type:ShaderForge.SFN_Add,id:6554,x:32556,y:32652,varname:node_6554,prsc:2|A-2204-R,B-2204-G;n:type:ShaderForge.SFN_OneMinus,id:6489,x:32702,y:32685,varname:node_6489,prsc:2|IN-6554-OUT;n:type:ShaderForge.SFN_Multiply,id:4330,x:32756,y:32853,varname:node_4330,prsc:2|A-6489-OUT,B-1108-R;n:type:ShaderForge.SFN_Multiply,id:2704,x:32990,y:32981,varname:node_2704,prsc:2|A-4330-OUT,B-2413-OUT;n:type:ShaderForge.SFN_Vector1,id:2413,x:32686,y:32984,varname:node_2413,prsc:2,v1:4;n:type:ShaderForge.SFN_VertexColor,id:8713,x:32755,y:32147,varname:node_8713,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4726,x:33106,y:32777,varname:node_4726,prsc:2|A-8713-A,B-2704-OUT;n:type:ShaderForge.SFN_Clamp01,id:6002,x:33284,y:32615,varname:node_6002,prsc:2|IN-4726-OUT;n:type:ShaderForge.SFN_Tex2d,id:5607,x:33720,y:32457,ptovrint:False,ptlb:Ramp,ptin:_Ramp,varname:node_5607,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:271f5ee3273dd7f4fae6e204d4f8c4bf,ntxv:0,isnm:False|UVIN-7904-OUT;n:type:ShaderForge.SFN_Append,id:7904,x:33551,y:32438,varname:node_7904,prsc:2|A-4119-OUT,B-798-OUT;n:type:ShaderForge.SFN_Vector1,id:798,x:33394,y:32501,varname:node_798,prsc:2,v1:0;n:type:ShaderForge.SFN_OneMinus,id:4119,x:33284,y:32398,varname:node_4119,prsc:2|IN-6002-OUT;n:type:ShaderForge.SFN_Add,id:8691,x:34005,y:32416,varname:node_8691,prsc:2|A-8713-RGB,B-5607-RGB;n:type:ShaderForge.SFN_Posterize,id:178,x:34261,y:32543,varname:node_178,prsc:2|IN-8691-OUT,STPS-6448-OUT;n:type:ShaderForge.SFN_Vector1,id:6448,x:34051,y:32577,varname:node_6448,prsc:2,v1:3;proporder:1108-5607;pass:END;sub:END;*/

Shader "Custom/Fx_lava_floor" {
    Properties {
        _node_1108 ("node_1108", 2D) = "white" {}
        _Ramp ("Ramp", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_1108; uniform float4 _node_1108_ST;
            uniform sampler2D _Ramp; uniform float4 _Ramp_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 node_3383 = (i.uv0*2.0+-1.0);
                float2 node_2204 = (node_3383*node_3383).rg;
                float4 _node_1108_var = tex2D(_node_1108,TRANSFORM_TEX(i.uv0, _node_1108));
                float node_4726 = (i.vertexColor.a*(((1.0 - (node_2204.r+node_2204.g))*_node_1108_var.r)*4.0));
                clip(node_4726 - 0.5);
////// Lighting:
////// Emissive:
                float2 node_7904 = float2((1.0 - saturate(node_4726)),0.0);
                float4 _Ramp_var = tex2D(_Ramp,TRANSFORM_TEX(node_7904, _Ramp));
                float3 node_8691 = (i.vertexColor.rgb+_Ramp_var.rgb);
                float3 emissive = node_8691;
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_1108; uniform float4 _node_1108_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 node_3383 = (i.uv0*2.0+-1.0);
                float2 node_2204 = (node_3383*node_3383).rg;
                float4 _node_1108_var = tex2D(_node_1108,TRANSFORM_TEX(i.uv0, _node_1108));
                float node_4726 = (i.vertexColor.a*(((1.0 - (node_2204.r+node_2204.g))*_node_1108_var.r)*4.0));
                clip(node_4726 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
