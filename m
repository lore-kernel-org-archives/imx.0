Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A4936E497
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 20:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629021; cv=fail; b=YLWWRp7vae4t4uKa1iP3rPXSuVKKqvwF1CrQD6DoBGELM36FRi+4O4GkP/IPmCu3MX+L4Nwonak1L0c9n9xlglEWsU0Fi3gbsgWlwUnJ7bw15HkR9tIA0nfx8Y2yWDR15YIwnLSYy2C4dvV/8RFap+t8VL+/NyOIkNSJMOuV/dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629021; c=relaxed/simple;
	bh=bKwZthJGa2H1kWSnMghKtjLeTJixBO3+nBO8I4ULh0Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XKBXa+pCAr3FVZdAYHH03tcK83YoBs0O49faddpWFkGUFDuzHC4yPnPjuujhJZZ/9olKaf2qjSMt48//XETHwjJHg08U4QfJr9l7tPsyq70IS9NIqtXNn3Rv26uEebomTBbeBJ2WLA8Mi/zf85wKlUxSiIEKmBTPCMo9vpciZu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nb8fAKXg; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nb8fAKXg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtoPVLuCIMlAd7Ky4C/ohkUjzrqPnE+bomoOWJY0HPQ5OtzSr3y6e6eESRsSvO1ks8iJsbGK89pC2a9wseGLlk/+giolwxeKXhFUgzh8K4ZXJeg8CWaKa/rLQk711/UJ8S0RsPGh3u6OwmcqQ6CasBGM3DSA1qyIR6/1zzYZvfbhz+07WyWMnXQipuGrAllOntOFLAyhnbPFFmyitJlao154EiklUOXJ/6Ddfie7fAOtKmh5HZdmtnvItFbVJNthR+XyHOFVR10xlgFte/lBaVBUAgKBEJlgdOPhtcUh0KLasCCpgDifgdAjnayLg/kOfs8NLEHTiSjChVuwjE4QxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnWEdsuXZ7mY6j431q4ge5NHXTA7MBb9jnDrUBTHIws=;
 b=cA2a0HdnMN+xDkfuH0iqMxU3ZcvLv7r856P0dZWhsZrVVJ5Vazisojk2i5jMyN9z6N8GfkEQsJXKx8Gt7YZzMWsojcVJBnYYxHZtz6zwok5JhQdHbfYrUlubgsE6W0s+v41QfWNf9AEsbdtR17orFDF2Qr/Vq3BDNS60zzYRsWYzhHy/vegyLqLrOhD6izyLMP9QeAqDA2kO9Ax7jzie4qgTgWnRzjMIYDUQsAx8DI433EhUb6q73xzopbf7YF1gnrC7xmXtekzpVNUDxXh/8OK4Z5P0q77nxhXHNWkiH0fATWgfuc7ILQfP9LTHcbFz9JQJVIJnstQvETSy1IYjKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnWEdsuXZ7mY6j431q4ge5NHXTA7MBb9jnDrUBTHIws=;
 b=nb8fAKXgVGGjg4f7JA9PNJnc3+d7ue9u4Vlk1z4+apim6kuFrrntwxbjMTUww2cUsKmxWL1L/B1HIzQA6H20FQL+EtQcStzqERKSGyceOZz82Hk1ISxb8RYR2F5/DFePcCmqZjV9y7jC6OHhGtEKu6YbEDcj+GN0mKfJO7cvQNwvvkDDhn/uuLXG2KEAsCR57YiAv6sPfa06vbECPX7fDwoinNB5dTeu/159e29op77Vn6wcxaUI1a39JEq9VqxUu9wPgEdfKyzdMrdP+XxK4T4JXII9Vy+X3YQ5IQ64E0SguImjq4Ai7v4kuTBkyEyYWVxayKI0R3OFTRT/oHJRoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11264.eurprd04.prod.outlook.com (2603:10a6:102:4eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 20:30:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 20:30:09 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 09 Jul 2026 16:29:46 -0400
Subject: [PATCH v2 4/4] arm64: dts: imx8-ss-audio: Fix LPCG clock indices
 for ASRC0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-qm_dts-v2-4-3ebcce82bb79@nxp.com>
References: <20260709-qm_dts-v2-0-3ebcce82bb79@nxp.com>
In-Reply-To: <20260709-qm_dts-v2-0-3ebcce82bb79@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783628984; l=1510;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gRD+nXnhUSRHD+uwc0bCPri2tRrm1Qm9MlhSFFQ/mRY=;
 b=KVTxILLU53EWKwypu9XbzJFVgoVxRH9A6e/Amyix4LjKfh2SDA+W6SxDRLRFoiZoc1hX03iKT
 zySd7EAtzUrCxI57Dn5f6BJJpFWMWRCq0eTuBfb3Ba8TtYm+Rj4nbBs
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0105.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11264:EE_
X-MS-Office365-Filtering-Correlation-Id: cc474ccc-8e9a-4d52-9472-08deddf8deca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/2/C7HDmSxMMzzdFHd6bj3J/N6x/RC7/BGY6uIJBqPuQw8aQYvWznPHe2+o8AjE0n2VqWbD5iHsvS7mUIwUZoUoH9QdUdGxbJ3A5XiLe1JVg7lsPfRCsFkHns9N9TckpC9yFcfHIq2alOKv0G0UH0Q90ex9MkZV1wZv5+O1v9g28Mokwsa1xwAdb+bxTA8P+0hyBmprGHgQIBTJrSA5TOC7+0kk7zc2A6MngjN9nBbt4sgbMrEBZC669NnZu3y5DeeFPLyA1rdt/7q6BQ614qr4PrPsvO0WE71x688RGhS6C0vcq40A3jeGFsj4Si0FYRY0OH/YV736kl3rAojzSkh90S8xUWyGtHrujz6zWbRzeGjOn9e8Nz0BF7QcBokz0byh94qZ+VepXc7ArBDaYeF8/Yu7SR3GRtHY8bHgJAMgslaPlT8Uh6C/HPdQ/gQddI7ieg3T103B6bPHybMzWEkXLL0EOT6W7A7Ccwemexnc75a42F/ErPGM/jLJbQoAN4rbskdMLsE0jSho2KZkRbIj3ThPve9rWSY+eDVOGHdtpBiNtF869M30ecBcg7Bbhg9XJFDl2g8pzy3y6ogM1nSiSfP93Emssa3+qDWhY1BQX7EMHNAw4qi3xVCpfXVRvsq9rdP2sVkpyJAP4WXp5AcTclVK+uHDB+yQlZjlNNhE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmZJbDJTMlVSTVM4UTZHOUh6aVpaTkV4ZnlldVJvb3JuS1lMOVNsQ3RsT0JE?=
 =?utf-8?B?emRnSXJaZnA5MnM1UWRqTHF2VDBuTDRCSDNxczc2dkFqT0RlcU9pOUtnUlFs?=
 =?utf-8?B?NE5tcU9mejFudXloV2VzQ0tjeFUyYngwTmFaRGZGM0FjTEtXc0hCSWUwSWZ6?=
 =?utf-8?B?d1U4OTVuNFpXNTA4cGgzWTI5NmhzRG5HQlBvOUpJbnBtWE1kb0tJTXBEUFhx?=
 =?utf-8?B?TUdVYmRndm9uMXQ3M0pKOHZvcTdIMHlHNXRHT1ZmdXpPbjFuL2JUMVcrNHZi?=
 =?utf-8?B?NFhuZ2ptbWxJQ0JoOXh1eHVnTGorcG82dGU1MXpqYjRiREs0M0dmdGVZWElW?=
 =?utf-8?B?NGN6QzZjN1MzZnNzV2VlNVlDNk1pZ2dKYUd6WW5yVlpsQ3lidUVtcTc4T0Fa?=
 =?utf-8?B?VmpwdG1sMGVZSG95N0hNZ3RJL1gzTDIzWklRM0NNWjIrWEJ5dXkyeldseFdY?=
 =?utf-8?B?NFNzK0ZuVERnMlBDemVBSERTclFOdmREVFZZL0FQcDRNd0I5RmhaVjRpZFRO?=
 =?utf-8?B?elpyQTl3UWZiQUZCSzIzM1A2Sit3U2IwU256Yk1BUGtNR2Fnb045bmQrT2ZL?=
 =?utf-8?B?K0ZOaUpFSUtsK3VVTFFoMDVyYjdKK0Nhb2FZS2VhSlpWcGNyeEZpb3NsNlBI?=
 =?utf-8?B?RTBZVXJpeG5qRG5MSnNibWgydmhpM3lnWWVCREIzOUJINlF4QTZOZVdUVTZk?=
 =?utf-8?B?WWxlS0VPTzdhbXN2UTh5czlmeGJUVHRabGxIUTBmdmNORnRPTVhYdS9jSHlh?=
 =?utf-8?B?anh2dDAwVWxIc2lWZ1JveE0xQTVpSUJKTEZqRmhjZkl2SFNXOUpaVXBNWWFN?=
 =?utf-8?B?VCt3VWV3MzBjeVJlTWE2QysyU2hsTGpOa0xPNC9SNGJXVUhtWDh4K0YrRlYw?=
 =?utf-8?B?YnMrQzI0UDdwVFBGSGFack02dGRiOW1UMDZMbjVXM0IxejlrN3NsVkpXNjZj?=
 =?utf-8?B?T3R4dS9JZDlJMTE4aVZqVnIwdW1NL2pvZEUvZXFpU0NBYlhqM2wzdHZPWTdn?=
 =?utf-8?B?OXRhemd1cFdJdWFGeGVOWmcwMzBRYzN3VlBpSXdHdG9vYzUwYjhmTkp3eFR6?=
 =?utf-8?B?Y2Z0TjlhUnc5L0tEU04ybEF1Rm8wZjFHdkhPV0sybkFnODRVL3lQUUFOVDJv?=
 =?utf-8?B?a2tTSEZ3WDNyN0UzVUM1YUZOZFZxN1o5L1lHZzJNeEN0d0NTaWUxaXp3dWxi?=
 =?utf-8?B?aWh5OE5CZUdNS0lreW5VRjlZNVk1QzhZT294RExhdkFkMnN3SUQ4eFhDTDA2?=
 =?utf-8?B?azNaRzdNMDh5ZTJsMjBJQkVmV0NCS2x6N1VEeWNmNFZJVXI3WnhTdjdEeFFU?=
 =?utf-8?B?MEpNakRsMlhwT1hYemNoVVFQcUorYnRFMkNSUVlMRkNlOEFJNVhYSkR6RmlR?=
 =?utf-8?B?MmNmZllRaDZUZ29wa0k0L2JjR2s5RENmcXpkTzdGeWlPUUxsNWw3VlVkS0ov?=
 =?utf-8?B?SHBZdnRycDA3UXFQZmkwQTRtd0dWZnd0Y2VQZDVQUnZZaU5aUm85MERvUity?=
 =?utf-8?B?U0VCU2JpaThscFdGTHVHamxvcUk1a2NabktOb3dlVW9hUHU3ME1FUzVqNHk4?=
 =?utf-8?B?RzhjRmhEMU8rV0l3dDVUUmY0WFMxU2FEQjVNUTFBLzZoMUtHL3ZUbGVSK1Zn?=
 =?utf-8?B?dS9OVFp1c0xIOHhYVzVmRjE1VGhGdXorT25tZkFTWmZHZGkyVWpOUTBnZ0ZG?=
 =?utf-8?B?Q1dkcDROeEFibnFkQ1p6OU1vYzJVb1QrWFREekhpVE5YRHpBdFpPdGNYVHhw?=
 =?utf-8?B?eG9ZWFkrS3dValplUlF4Y2lQcmlwODRqR05HL0swNzZOUGJub3ZhOHM5eGNO?=
 =?utf-8?B?UjNoTXphdjk5MGdLMHhtWTBjNWlIYVVqVE5HVkpqTENBM0lZYmpxR25kVm5F?=
 =?utf-8?B?ZkFJUjZVVy9PMHlrRGpZSk9Xb241L0YrV1hkVUd4Sy9aa05BT3hDTWZPMmhj?=
 =?utf-8?B?T3l4a1pWV05QSEdpOXdHQzNkSlYxYXcza1JibE1KNWM2c1hFVE1TYkwycHhR?=
 =?utf-8?B?aVQvanpkS3VCQzgxUEJKRXh3LzNIZllWMzRuZUNVdlZPZmhTaTdqbmI4ekZ4?=
 =?utf-8?B?L3k4M1lPVG0zREQwMmZmZHNMWDV0cER1NG9YOWw0Zkl2VmxudUpndkI3SWNT?=
 =?utf-8?B?bXVuTnhoRkthNUFNQUgxdWZxNWJ3dUlSenJIdTIvRGh3YitST1FXd2lLOEpl?=
 =?utf-8?B?cVF3YnFzSW1UNFNMN1pBNEdLdmZLMk83ZjRqSW1LSDljT1lZeXFpYjFSSDJW?=
 =?utf-8?B?RlpmVjZNZ3FXRThFRTlSeVBWMytGWmdOZTl6Yzc0eTgrZVhVN1YrQnZGaDBt?=
 =?utf-8?B?N3RURzRQdHVCNm9LdHQ2SmdjUSs0NmdpQzFqQkdDRHBLeUVxSXBpVS9LRzFa?=
 =?utf-8?Q?lK7W3kUMcM78B8ZDHrprFXHKrMhAwjrET2u9g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc474ccc-8e9a-4d52-9472-08deddf8deca
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:30:09.4295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvwsHbn2yq/1ct/Pv7FkKKfDxO0s43b9O01W315SkmJjpAOZWwGAChukstvy2cbTAwTXy8FP0apNKJ2ad4S2VPzZfigcai4PsO2Lw/pmnAxGjR9pdneQ62v7YbppeRS7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11264

From: Frank Li <Frank.Li@nxp.com>

The LPCG clock indices for ASRC0 and AUD_PLL_DIV0 are swapped. The ASRC0
LPCG provides only IMX_LPCG_CLK_4, so update the ASRC0 clock consumer to
use IMX_LPCG_CLK_4 instead of the non-existent IMX_LPCG_CLK_0.

Likewise, the AUD_PLL_DIV0 LPCG provides only IMX_LPCG_CLK_0, so update its
clock consumer to use IMX_LPCG_CLK_0 instead of the non-existent
IMX_LPCG_CLK_4.

Fixes: 5125617c7a4d3 ("arm64: dts: imx8qxp: add asrc[0,1], esai0, spdif0 and sai[4,5]")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
index 5e4233ccfde46..f473d81f67ffa 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
@@ -124,10 +124,10 @@ asrc0: asrc@59000000 {
 		compatible = "fsl,imx8qm-asrc";
 		reg = <0x59000000 0x10000>;
 		interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&asrc0_lpcg IMX_LPCG_CLK_0>,
-			 <&asrc0_lpcg IMX_LPCG_CLK_0>,
-			 <&aud_pll_div0_lpcg IMX_LPCG_CLK_4>,
-			 <&aud_pll_div1_lpcg IMX_LPCG_CLK_4>,
+		clocks = <&asrc0_lpcg IMX_LPCG_CLK_4>,
+			 <&asrc0_lpcg IMX_LPCG_CLK_4>,
+			 <&aud_pll_div0_lpcg IMX_LPCG_CLK_0>,
+			 <&aud_pll_div1_lpcg IMX_LPCG_CLK_0>,
 			 <&acm IMX_ADMA_ACM_AUD_CLK0_SEL>,
 			 <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
 			 <&clk_dummy>,

-- 
2.43.0

