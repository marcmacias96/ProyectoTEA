// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/LowPolyProps/Stylized Fire"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_Exposure("Exposure", Float) = 1
		_HighlightColor("Highlight Color", Color) = (0.2647059,0.2647059,0.2647059,1)
		_HighlightFresnel("Highlight Fresnel", Float) = 0
		_TopColor("Top Color", Color) = (0.2647059,0.2647059,0.2647059,1)
		_TopColorPos("Top Color Pos", Float) = 10
		_BottomColor("Bottom Color", Color) = (0.4852941,0.4852941,0.4852941,1)
		_BottomColorPos("Bottom Color Pos", Float) = 0
		_Opacity("Opacity", Range( 0 , 1)) = 0
		_WindSpeed("Wind Speed", Float) = 10
		_WindAmplitude("Wind Amplitude", Float) = 0.2
		_WindCycles("Wind Cycles", Vector) = (0,0,0,0)
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "DisableBatching" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 2.0
		#pragma surface surf Unlit alpha:fade keepalpha noshadow vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
			float4 vertexColor : COLOR;
		};

		uniform float4 _BottomColor;
		uniform float4 _TopColor;
		uniform float _BottomColorPos;
		uniform float _TopColorPos;
		uniform float4 _HighlightColor;
		uniform float _HighlightFresnel;
		uniform float _Exposure;
		uniform float _Opacity;
		uniform float _WindSpeed;
		uniform float3 _WindCycles;
		uniform float _WindAmplitude;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 MOTION98 = mul( unity_ObjectToWorld , float4( ( ( sin( ( ( ase_worldPos.z + ( _Time.x * _WindSpeed ) ) * _WindCycles ) ) * ( _WindAmplitude * 0.1 ) ) * v.color.a ) , 0.0 ) );
			v.vertex.xyz += MOTION98;
		}

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float3 ase_worldPos = i.worldPos;
			float4 lerpResult390 = lerp( _BottomColor , _TopColor , saturate( (0.0 + (ase_worldPos.y - _BottomColorPos) * (1.0 - 0.0) / (_TopColorPos - _BottomColorPos)) ));
			float3 worldViewDir = normalize( UnityWorldSpaceViewDir( i.worldPos ) );
			float fresnelFinalVal401 = (0.0 + 1.0*pow( 1.0 - dot( i.worldNormal, worldViewDir ) , _HighlightFresnel));
			float4 lerpResult438 = lerp( lerpResult390 , _HighlightColor , saturate( fresnelFinalVal401 ));
			float4 COLOR399 = lerpResult438;
			o.Emission = ( COLOR399 * _Exposure ).rgb;
			o.Alpha = ( _Opacity * i.vertexColor.a );
		}

		ENDCG
	}
	Fallback "Standard"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=13106
1927;29;1906;1014;2551.181;5381.544;1;True;False
Node;AmplifyShaderEditor.TimeNode;79;-1920,-3168;Float;False;0;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;80;-1920,-2976;Float;False;Property;_WindSpeed;Wind Speed;8;0;10;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;82;-1664,-3088;Float;False;2;2;0;FLOAT;0,0,0,0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.WorldPosInputsNode;268;-1920,-3328;Float;False;0;4;FLOAT3;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.WorldPosInputsNode;392;-1920,-4352;Float;False;0;4;FLOAT3;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;397;-1920,-4096;Float;False;Property;_BottomColorPos;Bottom Color Pos;6;0;0;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;394;-1920,-4016;Float;False;Property;_TopColorPos;Top Color Pos;4;0;10;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.SimpleAddOpNode;92;-1488,-3328;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0,0,0;False;1;FLOAT
Node;AmplifyShaderEditor.Vector3Node;386;-1472,-3104;Float;False;Property;_WindCycles;Wind Cycles;10;0;0,0,0;0;4;FLOAT3;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;395;-1664,-4096;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;0.0;False;4;FLOAT;1.0;False;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;56;-1152,-3104;Float;False;Property;_WindAmplitude;Wind Amplitude;9;0;0.2;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;84;-1152,-3328;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT3;0;False;1;FLOAT3
Node;AmplifyShaderEditor.WorldNormalVector;402;-1920,-3840;Float;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;437;-1920,-3680;Float;False;Property;_HighlightFresnel;Highlight Fresnel;2;0;0;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.ColorNode;391;-1408,-4352;Float;False;Property;_BottomColor;Bottom Color;5;0;0.4852941,0.4852941,0.4852941,1;0;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.FresnelNode;401;-1664,-3840;Float;False;4;0;FLOAT3;0,0,0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;3.0;False;1;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;220;-912,-3104;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.1;False;1;FLOAT
Node;AmplifyShaderEditor.SaturateNode;396;-1408,-3968;Float;False;1;0;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.SinOpNode;53;-976,-3328;Float;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.ColorNode;379;-1408,-4176;Float;False;Property;_TopColor;Top Color;3;0;0.2647059,0.2647059,0.2647059,1;0;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;57;-816,-3328;Float;False;2;2;0;FLOAT3;0.0;False;1;FLOAT;0.0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.LerpOp;390;-1024,-4352;Float;False;3;0;COLOR;0.0;False;1;COLOR;0.0,0,0,0;False;2;FLOAT;0.0,0,0,0;False;1;COLOR
Node;AmplifyShaderEditor.ColorNode;439;-1408,-3744;Float;False;Property;_HighlightColor;Highlight Color;1;0;0.2647059,0.2647059,0.2647059,1;0;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SaturateNode;435;-1408,-3840;Float;False;1;0;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.VertexColorNode;383;-736,-3104;Float;False;0;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;382;-624,-3328;Float;False;2;2;0;FLOAT3;0.0;False;1;FLOAT;0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.ObjectToWorldMatrixNode;441;-448,-3328;Float;False;0;1;FLOAT4x4
Node;AmplifyShaderEditor.LerpOp;438;-768,-4352;Float;False;3;0;COLOR;0.0;False;1;COLOR;0.0,0,0,0;False;2;FLOAT;0.0,0,0,0;False;1;COLOR
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;440;-192,-3200;Float;False;2;2;0;FLOAT4x4;0.0;False;1;FLOAT3;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.RegisterLocalVarNode;399;-576,-4352;Float;False;COLOR;-1;True;1;0;COLOR;0.0;False;1;COLOR
Node;AmplifyShaderEditor.VertexColorNode;442;-1920,-4864;Float;False;0;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;406;-1920,-5024;Float;False;Property;_Exposure;Exposure;0;0;1;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.GetLocalVarNode;400;-1920,-5120;Float;False;399;0;1;COLOR
Node;AmplifyShaderEditor.RangedFloatNode;380;-1920,-4944;Float;False;Property;_Opacity;Opacity;7;0;0;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;443;-1632,-4944;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.GetLocalVarNode;384;-1920,-4672;Float;False;98;0;1;FLOAT3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;405;-1664,-5120;Float;False;2;2;0;COLOR;0.0;False;1;FLOAT;0,0,0,0;False;1;COLOR
Node;AmplifyShaderEditor.RegisterLocalVarNode;98;0,-3328;Float;False;MOTION;-1;True;1;0;FLOAT3;0.0;False;1;FLOAT3
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-1408,-5120;Float;False;True;0;Float;ASEMaterialInspector;0;0;Unlit;BOXOPHOBIC/LowPolyProps/Stylized Fire;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;False;False;Back;0;0;False;0;0;Transparent;0.5;True;False;0;False;Transparent;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;False;0;SrcAlpha;OneMinusSrcAlpha;0;SrcAlpha;OneMinusSrcAlpha;OFF;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;False;Relative;0;Standard;-1;-1;-1;-1;0;0;0;14;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;398;-2176,-4352;Float;False;100;100;;0;// COLOR;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;280;-2176,-5120;Float;False;100;100;;0;// FINAL;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;279;-2176,-3328;Float;False;100;100;;0;// MOTION;1,1,1,1;0;0
WireConnection;82;0;79;1
WireConnection;82;1;80;0
WireConnection;92;0;268;3
WireConnection;92;1;82;0
WireConnection;395;0;392;2
WireConnection;395;1;397;0
WireConnection;395;2;394;0
WireConnection;84;0;92;0
WireConnection;84;1;386;0
WireConnection;401;0;402;0
WireConnection;401;3;437;0
WireConnection;220;0;56;0
WireConnection;396;0;395;0
WireConnection;53;0;84;0
WireConnection;57;0;53;0
WireConnection;57;1;220;0
WireConnection;390;0;391;0
WireConnection;390;1;379;0
WireConnection;390;2;396;0
WireConnection;435;0;401;0
WireConnection;382;0;57;0
WireConnection;382;1;383;4
WireConnection;438;0;390;0
WireConnection;438;1;439;0
WireConnection;438;2;435;0
WireConnection;440;0;441;0
WireConnection;440;1;382;0
WireConnection;399;0;438;0
WireConnection;443;0;380;0
WireConnection;443;1;442;4
WireConnection;405;0;400;0
WireConnection;405;1;406;0
WireConnection;98;0;440;0
WireConnection;0;2;405;0
WireConnection;0;9;443;0
WireConnection;0;11;384;0
ASEEND*/
//CHKSM=18D42CFCF572C674F88735233A477A570D81CB30