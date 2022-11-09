//--------------------------------------------------------------------------------------
// File: Tutorial04.fx
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
// Constant Buffer Variables
//--------------------------------------------------------------------------------------
cbuffer ConstantBuffer : register( b0 )
{
	matrix World;
	matrix View;
	matrix Projection;
    float4 lightPos;
}

//--------------------------------------------------------------------------------------
struct VS_OUTPUT
{
    float4 Pos : SV_POSITION;
    float4 Color : COLOR0;
};

//--------------------------------------------------------------------------------------
// Vertex Shader
//--------------------------------------------------------------------------------------
VS_OUTPUT VS( float4 Pos : POSITION, float4 Color : COLOR, float3 N : NORMAL)
{
    VS_OUTPUT output = (VS_OUTPUT)0;
    output.Pos = mul( Pos, World );
    output.Pos = mul( output.Pos, View );
    output.Pos = mul( output.Pos, Projection );
    output.Color = Color;
    return output;
}

VS_OUTPUT VS_main(float4 Pos : POSITION, float4 Color : COLOR, float3 N : NORMAL)
{    
    matrix Scaling =
    {
        1.3, 0, 0, 0,
        0, 1, 0, 0,
        0, 0, -5, 0,
        0, 0, 0, 1
    };
    
    matrix Translation =
    {
        1, 0, 0, 0,
        0, 1, 0, 1,
        0, 0, 1, 1,
        0, 0, 0, 1
    };

    VS_OUTPUT output = (VS_OUTPUT)0;
    output.Pos = mul(Pos, World);
    output.Pos = mul(Translation, output.Pos);
    output.Pos = mul(Scaling, output.Pos);
    output.Pos = mul(output.Pos, View);
    output.Pos = mul(output.Pos, Projection);
    output.Color = Color;

    float4 materialAmb = float4(0.1, 0.2, 0.2, 1.0);
    float4 materialDiff = float4(0.9, 0.7, 1.0, 1.0);
    float4 lightCol = float4(1.0, 0.6, 0.8, 1.0);
    float3 lightDir = normalize(lightPos.xyz - Pos.xyz);
    float3 normal = normalize(N);
    float diff = max(0.0, dot(lightDir, normal));
    output.Color = (materialAmb + diff * materialDiff) * lightCol;


    return output;
}

VS_OUTPUT VS1_main(float4 Pos : POSITION, float4 Color : COLOR, float3 N : NORMAL)
{
    matrix Scaling =
    {
        0.8, 0, 0, 0,
        0, 1.5, 0, 0,
        0, 0, 0.8, 0,
        0, 0, 0, 1
    };
    
    matrix Translation =
    {
        1, 0, 0, 1,
        0, 1, 0, 0.3,
        0, 0, 1, 1,
        0, 0, 0, 1
    };

    VS_OUTPUT output = (VS_OUTPUT) 0;
    output.Pos = mul(Pos, World);
    output.Pos = mul(Scaling, output.Pos);
    output.Pos = mul(output.Pos, View);
    output.Pos = mul(output.Pos, Projection);
    output.Color = Color;
    return output;
}

VS_OUTPUT VS2_main(float4 Pos : POSITION, float4 Color : COLOR, float3 N : NORMAL)
{
    matrix Scaling =
    {
        0.8, 0, 0, 0,
        0, 0.8, 0, 0,
        0, 0, 0.8, 0,
        0, 0, 0, 1
    };
    
    matrix Translation =
    {
        1, 0, 0, 1,
        0, 1, 0, 0.3,
        0, 0, 1, 1,
        0, 0, 0, 1
    };

    VS_OUTPUT output = (VS_OUTPUT) 0;
    output.Pos = mul(Pos, World);
    output.Pos = mul(Scaling, output.Pos);
    output.Pos = mul(output.Pos, View);
    output.Pos = mul(output.Pos, Projection);
    output.Color = Color;
    return output;
}





//--------------------------------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------------------------------
float4 PS(VS_OUTPUT input) : SV_Target
{
    //input.Color.r = 128.0f / 255.0f;
    //input.Color.g = 0.0f / 255.f;
    //input.Color.b = 255.f/ 255.f;
    //input.Color.a = 1.f;
    return input.Color;
}

float4 PS2(VS_OUTPUT input) : SV_Target
{
    //input.Color.r = 255.0f / 255.0f;
    //input.Color.g = 0.0f / 255.f;
    //input.Color.b = 0.f / 255.f;
    //input.Color.a = 1.f;
    return input.Color;
}

float4 PS3(VS_OUTPUT input) : SV_Target
{
    //input.Color.r = 255.0f / 255.0f;
    //input.Color.g = 178.0f / 255.f;
    //input.Color.b = 76.0f / 255.f;
    //input.Color.a = 1.f;
    return input.Color;
}
