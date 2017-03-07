// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.6543577,fgcg:0.7637066,fgcb:0.9779412,fgca:1,fgde:0.03,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2308,x:33384,y:32648,varname:node_2308,prsc:2|alpha-9516-OUT,refract-1366-OUT;n:type:ShaderForge.SFN_Fresnel,id:6684,x:32014,y:32781,varname:node_6684,prsc:2|EXP-2634-OUT;n:type:ShaderForge.SFN_Vector1,id:2634,x:31781,y:32834,varname:node_2634,prsc:2,v1:0.05;n:type:ShaderForge.SFN_OneMinus,id:5353,x:32214,y:32781,varname:node_5353,prsc:2|IN-6684-OUT;n:type:ShaderForge.SFN_Multiply,id:5986,x:32401,y:32938,varname:node_5986,prsc:2|A-5353-OUT,B-5063-OUT;n:type:ShaderForge.SFN_Multiply,id:118,x:32844,y:33238,varname:node_118,prsc:2|A-6461-G,B-7584-OUT;n:type:ShaderForge.SFN_NormalVector,id:7584,x:32587,y:33336,prsc:2,pt:False;n:type:ShaderForge.SFN_Tex2d,id:8519,x:31861,y:32986,ptovrint:False,ptlb:node_8519,ptin:_node_8519,varname:node_8519,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ComponentMask,id:6461,x:32611,y:32892,varname:node_6461,prsc:2,cc1:1,cc2:0,cc3:-1,cc4:-1|IN-5986-OUT;n:type:ShaderForge.SFN_RemapRange,id:5286,x:32805,y:32894,varname:node_5286,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.5|IN-6461-OUT;n:type:ShaderForge.SFN_Vector1,id:9516,x:32559,y:32692,varname:node_9516,prsc:2,v1:0;n:type:ShaderForge.SFN_VertexColor,id:4291,x:31620,y:33273,varname:node_4291,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:559,x:31989,y:33339,varname:node_559,prsc:2,frmn:0,frmx:1,tomn:-0.6,tomx:0.6|IN-4291-A;n:type:ShaderForge.SFN_Add,id:5063,x:32197,y:33076,varname:node_5063,prsc:2|A-8519-RGB,B-559-OUT;n:type:ShaderForge.SFN_Multiply,id:1366,x:33171,y:32989,varname:node_1366,prsc:2|A-1636-OUT,B-4291-A;n:type:ShaderForge.SFN_Dot,id:1636,x:32980,y:32952,varname:node_1636,prsc:2,dt:0|A-5286-OUT,B-118-OUT;proporder:8519;pass:END;sub:END;*/

Shader "Custom/Fx_refractionLava" {
    Properties {
        _node_8519 ("node_8519", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform sampler2D _GrabTexture;
            uniform sampler2D _node_8519; uniform float4 _node_8519_ST;
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
                float4 screenPos : TEXCOORD3;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float4 _node_8519_var = tex2D(_node_8519,TRANSFORM_TEX(i.uv0, _node_8519));
                float3 node_5986 = ((1.0 - pow(1.0-max(0,dot(normalDirection, viewDirection)),0.05))*(_node_8519_var.rgb+(i.vertexColor.a*1.2+-0.6)));
                float2 node_6461 = node_5986.gr;
                float node_1366 = (dot((node_6461*0.5+0.0),(node_6461.g*i.normalDir))*i.vertexColor.a);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + float2(node_1366,node_1366);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 finalColor = 0;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,0.0),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
