// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.4696691,fgcg:0.7911384,fgcb:0.875,fgca:1,fgde:0.002,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:7895,x:32996,y:32543,varname:node_7895,prsc:2|emission-524-OUT;n:type:ShaderForge.SFN_VertexColor,id:2754,x:31286,y:32385,varname:node_2754,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:8297,x:31612,y:32932,ptovrint:False,ptlb:node_8297,ptin:_node_8297,varname:node_8297,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-6433-UVOUT;n:type:ShaderForge.SFN_Fresnel,id:6593,x:31932,y:32666,varname:node_6593,prsc:2|EXP-9636-OUT;n:type:ShaderForge.SFN_Multiply,id:866,x:32182,y:32888,varname:node_866,prsc:2|A-6593-OUT,B-6644-OUT;n:type:ShaderForge.SFN_Posterize,id:9959,x:32393,y:32932,varname:node_9959,prsc:2|IN-866-OUT,STPS-8192-OUT;n:type:ShaderForge.SFN_Vector1,id:8192,x:32230,y:33059,varname:node_8192,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:524,x:32806,y:32707,varname:node_524,prsc:2|A-2754-RGB,B-9947-OUT;n:type:ShaderForge.SFN_Multiply,id:6644,x:31885,y:32852,varname:node_6644,prsc:2|A-9326-OUT,B-8297-RGB;n:type:ShaderForge.SFN_Multiply,id:9326,x:31453,y:32661,varname:node_9326,prsc:2|A-2754-A,B-725-OUT;n:type:ShaderForge.SFN_Vector1,id:725,x:31236,y:32695,varname:node_725,prsc:2,v1:3;n:type:ShaderForge.SFN_Reciprocal,id:9636,x:31708,y:32644,varname:node_9636,prsc:2|IN-9326-OUT;n:type:ShaderForge.SFN_Panner,id:6433,x:31307,y:32901,varname:node_6433,prsc:2,spu:0.05,spv:0.05|UVIN-1989-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1989,x:31081,y:32884,varname:node_1989,prsc:2,uv:0;n:type:ShaderForge.SFN_Fresnel,id:1777,x:31654,y:32463,varname:node_1777,prsc:2|EXP-1481-OUT;n:type:ShaderForge.SFN_Multiply,id:9494,x:31911,y:32406,varname:node_9494,prsc:2|A-7914-OUT,B-1777-OUT;n:type:ShaderForge.SFN_Vector1,id:7914,x:31716,y:32364,varname:node_7914,prsc:2,v1:0.7;n:type:ShaderForge.SFN_Add,id:9947,x:32592,y:32565,varname:node_9947,prsc:2|A-9494-OUT,B-9959-OUT;n:type:ShaderForge.SFN_Reciprocal,id:1481,x:31478,y:32487,varname:node_1481,prsc:2|IN-2754-A;proporder:8297;pass:END;sub:END;*/

Shader "Timoun/FX/bouclier" {
    Properties {
        _node_8297 ("node_8297", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles n3ds wiiu 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_8297; uniform float4 _node_8297_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float node_9326 = (i.vertexColor.a*3.0);
                float node_6593 = pow(1.0-max(0,dot(normalDirection, viewDirection)),(1.0 / node_9326));
                float4 node_2671 = _Time + _TimeEditor;
                float2 node_6433 = (i.uv0+node_2671.g*float2(0.05,0.05));
                float4 _node_8297_var = tex2D(_node_8297,TRANSFORM_TEX(node_6433, _node_8297));
                float node_8192 = 2.0;
                float3 emissive = (i.vertexColor.rgb*((0.7*pow(1.0-max(0,dot(normalDirection, viewDirection)),(1.0 / i.vertexColor.a)))+floor((node_6593*(node_9326*_node_8297_var.rgb)) * node_8192) / (node_8192 - 1)));
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
