// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.28 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.28;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.4696691,fgcg:0.7911384,fgcb:0.875,fgca:1,fgde:0.022,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3902,x:33008,y:32539,varname:node_3902,prsc:2|diff-812-OUT,diffpow-812-OUT,spec-2538-OUT,normal-4589-OUT,voffset-5197-OUT;n:type:ShaderForge.SFN_Tex2d,id:1306,x:31603,y:32743,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_1306,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:582590ae50123e94a8060bfcdbcabe6d,ntxv:0,isnm:False|UVIN-6709-UVOUT,MIP-6654-OUT;n:type:ShaderForge.SFN_Tex2d,id:6659,x:31974,y:33036,ptovrint:False,ptlb:Normal Map,ptin:_NormalMap,varname:node_6659,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b9b4e55fd6c9b8e4eb97e9b06ffce992,ntxv:3,isnm:True|UVIN-6709-UVOUT;n:type:ShaderForge.SFN_Slider,id:6654,x:29590,y:33101,ptovrint:False,ptlb:tiling,ptin:_tiling,varname:node_6654,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7457599,max:1;n:type:ShaderForge.SFN_UVTile,id:6709,x:30038,y:33059,varname:node_6709,prsc:2|WDT-6654-OUT,HGT-6654-OUT,TILE-6654-OUT;n:type:ShaderForge.SFN_Color,id:8643,x:32415,y:32693,ptovrint:False,ptlb:spec_color,ptin:_spec_color,varname:node_8643,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6356,x:31603,y:32560,ptovrint:False,ptlb:Diffuse_2,ptin:_Diffuse_2,varname:node_6356,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:152685f2233050b4cacaca3135eccce5,ntxv:0,isnm:False|UVIN-6369-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4045,x:31974,y:33204,ptovrint:False,ptlb:normal_2,ptin:_normal_2,varname:node_4045,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9bd73df010a36e14aa9254a051776e62,ntxv:3,isnm:True|UVIN-6369-UVOUT;n:type:ShaderForge.SFN_Lerp,id:3516,x:32442,y:32914,varname:node_3516,prsc:2|A-4045-RGB,B-6659-RGB,T-6258-OUT;n:type:ShaderForge.SFN_Lerp,id:7932,x:32302,y:32321,varname:node_7932,prsc:2|A-6665-OUT,B-4970-OUT,T-6258-OUT;n:type:ShaderForge.SFN_Lerp,id:8076,x:32142,y:32548,varname:node_8076,prsc:2|A-6356-A,B-1306-A,T-6258-OUT;n:type:ShaderForge.SFN_UVTile,id:6369,x:31249,y:33618,varname:node_6369,prsc:2|WDT-5524-OUT,HGT-5524-OUT,TILE-5524-OUT;n:type:ShaderForge.SFN_Slider,id:5524,x:30835,y:33641,ptovrint:False,ptlb:tiling2,ptin:_tiling2,varname:node_5524,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Vector3,id:403,x:32499,y:33416,varname:node_403,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:570,x:32499,y:33309,varname:node_570,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_VertexColor,id:1662,x:32670,y:33386,varname:node_1662,prsc:2;n:type:ShaderForge.SFN_Lerp,id:5197,x:32794,y:33250,varname:node_5197,prsc:2|A-403-OUT,B-570-OUT,T-1662-B;n:type:ShaderForge.SFN_Multiply,id:6258,x:31830,y:32169,varname:node_6258,prsc:2|A-9830-OUT,B-1450-OUT;n:type:ShaderForge.SFN_Tex2d,id:6011,x:30566,y:32466,ptovrint:False,ptlb:mask,ptin:_mask,varname:node_6011,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-6709-UVOUT;n:type:ShaderForge.SFN_Vector1,id:9830,x:31416,y:31959,varname:node_9830,prsc:2,v1:1;n:type:ShaderForge.SFN_UVTile,id:8244,x:30280,y:32396,varname:node_8244,prsc:2|WDT-5833-OUT,HGT-5833-OUT,TILE-5833-OUT;n:type:ShaderForge.SFN_Vector1,id:5833,x:29931,y:32451,varname:node_5833,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:6237,x:30794,y:32659,varname:node_6237,prsc:2,v1:3;n:type:ShaderForge.SFN_Power,id:832,x:31089,y:32388,varname:node_832,prsc:2|VAL-4110-OUT,EXP-6237-OUT;n:type:ShaderForge.SFN_Multiply,id:9650,x:31239,y:32388,varname:node_9650,prsc:2|A-832-OUT,B-6237-OUT;n:type:ShaderForge.SFN_Clamp01,id:1450,x:31467,y:32248,varname:node_1450,prsc:2|IN-9650-OUT;n:type:ShaderForge.SFN_Multiply,id:5697,x:30738,y:32240,varname:node_5697,prsc:2|A-3275-B,B-6011-RGB;n:type:ShaderForge.SFN_VertexColor,id:3275,x:30519,y:32168,varname:node_3275,prsc:2;n:type:ShaderForge.SFN_VertexColor,id:7021,x:31779,y:31643,varname:node_7021,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4110,x:30933,y:32313,varname:node_4110,prsc:2|A-5697-OUT,B-6237-OUT;n:type:ShaderForge.SFN_Lerp,id:812,x:32679,y:32118,varname:node_812,prsc:2|A-7932-OUT,B-2508-OUT,T-2934-OUT;n:type:ShaderForge.SFN_Multiply,id:4263,x:31996,y:31713,varname:node_4263,prsc:2|A-7021-R,B-3143-RGB;n:type:ShaderForge.SFN_Tex2d,id:3143,x:31727,y:31781,ptovrint:False,ptlb:Mask_2,ptin:_Mask_2,varname:node_3143,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-6709-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7748,x:31593,y:32372,ptovrint:False,ptlb:Diffuse_3,ptin:_Diffuse_3,varname:node_7748,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6709-UVOUT;n:type:ShaderForge.SFN_Lerp,id:4589,x:32752,y:32869,varname:node_4589,prsc:2|A-3516-OUT,B-6012-RGB,T-2934-OUT;n:type:ShaderForge.SFN_Tex2d,id:6012,x:31974,y:33401,ptovrint:False,ptlb:Normal_3,ptin:_Normal_3,varname:node_6012,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True|UVIN-6709-UVOUT;n:type:ShaderForge.SFN_Multiply,id:8163,x:32228,y:31738,varname:node_8163,prsc:2|A-4263-OUT,B-1434-OUT;n:type:ShaderForge.SFN_Vector1,id:1434,x:32106,y:31848,varname:node_1434,prsc:2,v1:3;n:type:ShaderForge.SFN_Clamp01,id:2934,x:32343,y:31962,varname:node_2934,prsc:2|IN-8163-OUT;n:type:ShaderForge.SFN_Lerp,id:8997,x:32415,y:32531,varname:node_8997,prsc:2|A-8076-OUT,B-7748-A,T-2934-OUT;n:type:ShaderForge.SFN_Multiply,id:2538,x:32647,y:32566,varname:node_2538,prsc:2|A-8997-OUT,B-8643-RGB;n:type:ShaderForge.SFN_Color,id:3482,x:31719,y:32308,ptovrint:False,ptlb:Diffuse_Color_3,ptin:_Diffuse_Color_3,varname:node_3482,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:632,x:31741,y:32549,ptovrint:False,ptlb:Diffuse_Color_2,ptin:_Diffuse_Color_2,varname:node_632,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:9437,x:31752,y:32720,ptovrint:False,ptlb:Diffuse_Color_1,ptin:_Diffuse_Color_1,varname:node_9437,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2508,x:31881,y:32332,varname:node_2508,prsc:2|A-3482-RGB,B-7748-RGB;n:type:ShaderForge.SFN_Multiply,id:6665,x:31904,y:32524,varname:node_6665,prsc:2|A-632-RGB,B-6356-RGB;n:type:ShaderForge.SFN_Multiply,id:4970,x:31933,y:32760,varname:node_4970,prsc:2|A-9437-RGB,B-1306-RGB;proporder:6654-5524-1306-6659-9437-6356-4045-632-7748-6012-3482-8643-6011-3143;pass:END;sub:END;*/

Shader "Timoun/Enviro/Tiling - Ground MultiMaterial" {
    Properties {
        _tiling ("tiling", Range(0, 1)) = 0.7457599
        _tiling2 ("tiling2", Range(0, 1)) = 0
        _Diffuse ("Diffuse", 2D) = "white" {}
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _Diffuse_Color_1 ("Diffuse_Color_1", Color) = (0.5,0.5,0.5,1)
        _Diffuse_2 ("Diffuse_2", 2D) = "white" {}
        _normal_2 ("normal_2", 2D) = "bump" {}
        _Diffuse_Color_2 ("Diffuse_Color_2", Color) = (0.5,0.5,0.5,1)
        _Diffuse_3 ("Diffuse_3", 2D) = "white" {}
        _Normal_3 ("Normal_3", 2D) = "bump" {}
        _Diffuse_Color_3 ("Diffuse_Color_3", Color) = (0.5,0.5,0.5,1)
        _spec_color ("spec_color", Color) = (0.5,0.5,0.5,1)
        _mask ("mask", 2D) = "white" {}
        _Mask_2 ("Mask_2", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _tiling;
            uniform float4 _spec_color;
            uniform sampler2D _Diffuse_2; uniform float4 _Diffuse_2_ST;
            uniform sampler2D _normal_2; uniform float4 _normal_2_ST;
            uniform float _tiling2;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform sampler2D _Mask_2; uniform float4 _Mask_2_ST;
            uniform sampler2D _Diffuse_3; uniform float4 _Diffuse_3_ST;
            uniform sampler2D _Normal_3; uniform float4 _Normal_3_ST;
            uniform float4 _Diffuse_Color_3;
            uniform float4 _Diffuse_Color_2;
            uniform float4 _Diffuse_Color_1;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                v.vertex.xyz += lerp(float3(0,0,0),float3(0,0,0),o.vertexColor.b);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 node_6369_tc_rcp = float2(1.0,1.0)/float2( _tiling2, _tiling2 );
                float node_6369_ty = floor(_tiling2 * node_6369_tc_rcp.x);
                float node_6369_tx = _tiling2 - _tiling2 * node_6369_ty;
                float2 node_6369 = (i.uv0 + float2(node_6369_tx, node_6369_ty)) * node_6369_tc_rcp;
                float3 _normal_2_var = UnpackNormal(tex2D(_normal_2,TRANSFORM_TEX(node_6369, _normal_2)));
                float2 node_6709_tc_rcp = float2(1.0,1.0)/float2( _tiling, _tiling );
                float node_6709_ty = floor(_tiling * node_6709_tc_rcp.x);
                float node_6709_tx = _tiling - _tiling * node_6709_ty;
                float2 node_6709 = (i.uv0 + float2(node_6709_tx, node_6709_ty)) * node_6709_tc_rcp;
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(node_6709, _NormalMap)));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(node_6709, _mask));
                float node_6237 = 3.0;
                float3 node_6258 = (1.0*saturate((pow(((i.vertexColor.b*_mask_var.rgb)*node_6237),node_6237)*node_6237)));
                float3 _Normal_3_var = UnpackNormal(tex2D(_Normal_3,TRANSFORM_TEX(node_6709, _Normal_3)));
                float4 _Mask_2_var = tex2D(_Mask_2,TRANSFORM_TEX(node_6709, _Mask_2));
                float3 node_2934 = saturate(((i.vertexColor.r*_Mask_2_var.rgb)*3.0));
                float3 normalLocal = lerp(lerp(_normal_2_var.rgb,_NormalMap_var.rgb,node_6258),_Normal_3_var.rgb,node_2934);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float4 _Diffuse_2_var = tex2D(_Diffuse_2,TRANSFORM_TEX(node_6369, _Diffuse_2));
                float4 _Diffuse_var = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_6709, _Diffuse),0.0,_tiling));
                float4 _Diffuse_3_var = tex2D(_Diffuse_3,TRANSFORM_TEX(node_6709, _Diffuse_3));
                float3 specularColor = (lerp(lerp(float3(_Diffuse_2_var.a,_Diffuse_2_var.a,_Diffuse_2_var.a),float3(_Diffuse_var.a,_Diffuse_var.a,_Diffuse_var.a),node_6258),float3(_Diffuse_3_var.a,_Diffuse_3_var.a,_Diffuse_3_var.a),node_2934)*_spec_color.rgb);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 node_812 = lerp(lerp((_Diffuse_Color_2.rgb*_Diffuse_2_var.rgb),(_Diffuse_Color_1.rgb*_Diffuse_var.rgb),node_6258),(_Diffuse_Color_3.rgb*_Diffuse_3_var.rgb),node_2934);
                float3 directDiffuse = pow(max( 0.0, NdotL), node_812) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = node_812;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _tiling;
            uniform float4 _spec_color;
            uniform sampler2D _Diffuse_2; uniform float4 _Diffuse_2_ST;
            uniform sampler2D _normal_2; uniform float4 _normal_2_ST;
            uniform float _tiling2;
            uniform sampler2D _mask; uniform float4 _mask_ST;
            uniform sampler2D _Mask_2; uniform float4 _Mask_2_ST;
            uniform sampler2D _Diffuse_3; uniform float4 _Diffuse_3_ST;
            uniform sampler2D _Normal_3; uniform float4 _Normal_3_ST;
            uniform float4 _Diffuse_Color_3;
            uniform float4 _Diffuse_Color_2;
            uniform float4 _Diffuse_Color_1;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                v.vertex.xyz += lerp(float3(0,0,0),float3(0,0,0),o.vertexColor.b);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 node_6369_tc_rcp = float2(1.0,1.0)/float2( _tiling2, _tiling2 );
                float node_6369_ty = floor(_tiling2 * node_6369_tc_rcp.x);
                float node_6369_tx = _tiling2 - _tiling2 * node_6369_ty;
                float2 node_6369 = (i.uv0 + float2(node_6369_tx, node_6369_ty)) * node_6369_tc_rcp;
                float3 _normal_2_var = UnpackNormal(tex2D(_normal_2,TRANSFORM_TEX(node_6369, _normal_2)));
                float2 node_6709_tc_rcp = float2(1.0,1.0)/float2( _tiling, _tiling );
                float node_6709_ty = floor(_tiling * node_6709_tc_rcp.x);
                float node_6709_tx = _tiling - _tiling * node_6709_ty;
                float2 node_6709 = (i.uv0 + float2(node_6709_tx, node_6709_ty)) * node_6709_tc_rcp;
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(node_6709, _NormalMap)));
                float4 _mask_var = tex2D(_mask,TRANSFORM_TEX(node_6709, _mask));
                float node_6237 = 3.0;
                float3 node_6258 = (1.0*saturate((pow(((i.vertexColor.b*_mask_var.rgb)*node_6237),node_6237)*node_6237)));
                float3 _Normal_3_var = UnpackNormal(tex2D(_Normal_3,TRANSFORM_TEX(node_6709, _Normal_3)));
                float4 _Mask_2_var = tex2D(_Mask_2,TRANSFORM_TEX(node_6709, _Mask_2));
                float3 node_2934 = saturate(((i.vertexColor.r*_Mask_2_var.rgb)*3.0));
                float3 normalLocal = lerp(lerp(_normal_2_var.rgb,_NormalMap_var.rgb,node_6258),_Normal_3_var.rgb,node_2934);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float4 _Diffuse_2_var = tex2D(_Diffuse_2,TRANSFORM_TEX(node_6369, _Diffuse_2));
                float4 _Diffuse_var = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_6709, _Diffuse),0.0,_tiling));
                float4 _Diffuse_3_var = tex2D(_Diffuse_3,TRANSFORM_TEX(node_6709, _Diffuse_3));
                float3 specularColor = (lerp(lerp(float3(_Diffuse_2_var.a,_Diffuse_2_var.a,_Diffuse_2_var.a),float3(_Diffuse_var.a,_Diffuse_var.a,_Diffuse_var.a),node_6258),float3(_Diffuse_3_var.a,_Diffuse_3_var.a,_Diffuse_3_var.a),node_2934)*_spec_color.rgb);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 node_812 = lerp(lerp((_Diffuse_Color_2.rgb*_Diffuse_2_var.rgb),(_Diffuse_Color_1.rgb*_Diffuse_var.rgb),node_6258),(_Diffuse_Color_3.rgb*_Diffuse_3_var.rgb),node_2934);
                float3 directDiffuse = pow(max( 0.0, NdotL), node_812) * attenColor;
                float3 diffuseColor = node_812;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
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
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            struct VertexInput {
                float4 vertex : POSITION;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                v.vertex.xyz += lerp(float3(0,0,0),float3(0,0,0),o.vertexColor.b);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
