// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.4696691,fgcg:0.7911384,fgcb:0.875,fgca:1,fgde:0.002,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9910,x:32896,y:32611,varname:node_9910,prsc:2|emission-7900-OUT;n:type:ShaderForge.SFN_Tex2d,id:4095,x:31883,y:32816,ptovrint:False,ptlb:Dissolve ramp,ptin:_Dissolveramp,varname:node_4095,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f3baef34c9bc262419da70752cd67018,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7801,x:32260,y:32734,varname:node_7801,prsc:2|A-6336-OUT,B-4095-R;n:type:ShaderForge.SFN_VertexColor,id:6630,x:31866,y:32481,varname:node_6630,prsc:2;n:type:ShaderForge.SFN_Posterize,id:9005,x:32457,y:32809,varname:node_9005,prsc:2|IN-7801-OUT,STPS-1887-OUT;n:type:ShaderForge.SFN_Vector1,id:1887,x:32299,y:33026,varname:node_1887,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:6336,x:32037,y:32654,varname:node_6336,prsc:2|A-6630-A,B-4972-OUT;n:type:ShaderForge.SFN_Vector1,id:4972,x:31748,y:32667,varname:node_4972,prsc:2,v1:1.8;n:type:ShaderForge.SFN_Multiply,id:7900,x:32633,y:32713,varname:node_7900,prsc:2|A-6630-RGB,B-9005-OUT;proporder:4095;pass:END;sub:END;*/

Shader "Timoun/Sh_Fx_airblades" {
    Properties {
        _Dissolveramp ("Dissolve ramp", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Dissolveramp; uniform float4 _Dissolveramp_ST;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 _Dissolveramp_var = tex2D(_Dissolveramp,TRANSFORM_TEX(i.uv0, _Dissolveramp));
                float node_1887 = 2.0;
                float3 emissive = (i.vertexColor.rgb*floor(((i.vertexColor.a*1.8)*_Dissolveramp_var.r) * node_1887) / (node_1887 - 1));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
