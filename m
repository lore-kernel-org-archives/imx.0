Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D33480355
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118609; cv=fail; b=BVmXH2EPPJnqulPnat0s0j19uGuxFVfHn6O0bu2bf5plnj/rxCB6jgc6mxtlJdLAzlOmrCGk+296FIKmbM0vKYmTakXVR84EmTRDAuMHGW6tkGBYNWg6xMsLGBBg0JYx4OvRR2IspaFAStboqHP85FOTsHs4ulzfqC98a1i0lRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118609; c=relaxed/simple;
	bh=nPE0fPta++YxhYJa//usIPC01RVgMza4yZH7sVW8+A4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Jlmh2i177f2+ahxxVgwZhFdC9pXzelhv2V8vH7Ld49FpPngbeoY6o5WI9xwn4N3X9yKkmNQNK1b0gIlY6JG8d6fuJBXC2szxmPcDsI1uHBU99oUXC5tLtFCaYehDHUVU2nFtS5B7j43feXvU5PYS1kpCtaGRtmBbwnrkce3xPQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eSU1zDhv; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eSU1zDhv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y44YffPXuJElEaIVnmCuaV7OPzhfydr5tHuOFb7Me+qt9HYgXaNAkKrbcsm0jXiG4mSSkO/PxHA5/WkjYgXzlI2gnlQXKL2xqNRBhZA5iuDijjJlH8YejY/gI3JVJI8pixZxw1ftHX9z4RtAWON9Gy06C+Dg20RHQwDvg5udsXbjDObnZC08VSXkBiGSWolEScgZOY0Kxtk8bGJHedVBAR76M87O3+7hpNUY0zNS5dv7I52EriEhpSzEjz2ifZPVqdtOXU0ryD0upv5DoYFo/GiOGKjo1pnEIM1k/HVSRGd2TDEWDBiei1I+gXQQcB2t+8YepoYivzQJ2HqmsyUV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6CumBhNGlvfueNBW0/+U4+2+OjFIjy9Vd88RHN0gRA=;
 b=NNuOP3VzVTQC/7secNwaMR0oguMMP4pC5ZpOb6Fiw+9aidUJxwFN4YORE/HDZrM5hFEbcA5Arb0S9gDgymRqdt7FnrJMzp+2iMYnlrG8+7NYdq17by8RoiYSbtuiP9jv3VVCTMMYj1IME3X/4BrCJUASCEAk2pZy/UBqrElfJ/CnPwiwvcvI7GnuvFYrJ8Xsa/p1uBjRxjvr1nTvsdVigEYHQGY3K4fqyehgSJP5XecfpLvi2s3qIQK8tdmZp/BPJ4jH4v46ppG8ONAljOPqJxrLJXFhlBolU1eH7qcNnKB8rLxm7zkjMbGE7qMKhBjb6x6tPLCX7+goYQY30E9ggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6CumBhNGlvfueNBW0/+U4+2+OjFIjy9Vd88RHN0gRA=;
 b=eSU1zDhvzVWNn8YhTqqzQlfFkuzpb+UfuYpVP4h2hLsoeZ6z4iiWqUyhkqAt2rnAz4Z+cwJP1ZKd1NaQLw0kvdmARtAgSl3L0dQE1rM1N+LHYCT9xmV3boN6thplWHnhPQNpNptP/LYZzmqJewZGT+ItCT/VS/DY1/gTS5NjsBZmRRbB486eUXMaL+VaimdErGrltuXxDtnGe5or7y7Xzbn8fvMcOcWr95efjRJvXBKLAy6/a3OVW9ZZAIUUs/cjL09VFuOQQDQbC7ptm71CZhfqd8dIcwpN4xOb0KRlrTSAl4NEQWSrLO482UPZ6tKDGeTI7pCWKzcUEJHLo1XhOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:30:04 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:30:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:03 +0800
Subject: [PATCH 2/9] arm64: dts: imx8ulp: Add I3C2 controller node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-2-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: a70fe56b-30b7-4236-72e0-08dee26ccbd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|19092799006|366016|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MgYPJtOlVEr9ir5LktEDGDotlQQXAehPuV6Mr45k2uTTEO+S3aWzbNB3RmvBU3nWbUJYjW1wq4jQYmZRBMvYaPLZKx5bFuuu6NhLlmIE8eWHjzSLRoVzWqSq/Jfun0QBYt6b0e7RW/QeBv2AIdANcusX6EHYwZnNgCUlXB8DhMrhzji0V+23Ix5cIB/ycAZ7gx6A7OuHI+F22fwk8Lsc3MOBwJ7ay5ieCeZSn+j+IAOIGBXvlWWN3khHI4qp/QWjX8e5vS9oGaRT0EQ7+aLIaof1ya78O/eLnXDD4yLQ/vj2FhqQEEEiv1vDMgDu0vK+38RE7W268MJPR5XsUZhTYaQNfg165CiIkdNWXJ2vpohJWryeKERt/shAvliuvObdpFH7BKNmebbArg78yEqXG9Dvj0jTDvvq2fNqOucL9xjc3XfFqn6DXDS0DvVCyao1xqwYd6YVQc9PCBdFvW0N7SrCqhUiV6OmZ+Qp59PN7VQg8MERpmUhgTwffJbeE/JWhv3DSyZr8Jd/I3zTKvcDvnwcbG2Rf+bftFTNLZZIKPAausgteJlkttdqvEJ8omEzdxpvqyi/oY/+59arHxYktihf1z4z06h2vHfakmEsUacJJ1pfCDB5TDpLAMwdsO35Bqw9cfgX2xH8aWLaKB0vnuFt5xGXeMcMkNoej/MqWuc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2x3NURhWGJvZGxVcittcll6UnNYa3NUdUg0WVU0SjNQRGY2cXNVZU02bGZV?=
 =?utf-8?B?Q05yTEYxWkhZOWNIQmowZXBmQVl0SlhYQWZubVFmY0ZUVlg2eVpTczJkU2U4?=
 =?utf-8?B?R1graXZuUC8wUUFpUFdVcytPazU3RSswc3ZORisrYnlyby9VMU8wa0E0bEJT?=
 =?utf-8?B?QkJIT3ZiRjZJWm5jWTIrdm4rUnU5RUtXTGRWUmVndDdvVFpHQWR1N0hFSWR3?=
 =?utf-8?B?Ui8xY29sNmpjNTl3K2RDTXJLaXdLN3ppeVBicmFWbjI1VHVDb2JCVHdxZVFH?=
 =?utf-8?B?WUVhcE1kV2w0YkpYSHQyT0xjTFFJc1lCd1lNalg0ZmtXSWhPV1pVL1VZNkZN?=
 =?utf-8?B?OFpDU0dzVzlWS3cyL3VTNTI4eE5JWUFmc0F6cFZZNnJwcDZLUEdPYWN4RXZI?=
 =?utf-8?B?Qm0zUVJSdWhJVnVMWW5MbGFXREFHOUI4RG1qMFVIRWZzWGhPWkRTUlI5V3Zp?=
 =?utf-8?B?RU4rZmxEdEVPUlZ6NHkrRjg5YUx5Z3dJaExCdHlUQmgvQXRVSU9qUXp4WENk?=
 =?utf-8?B?akJSZ0tmbzJOR2QvRVh6dlJHZlJWN1VtR1FXOUY5ZVFPMDVCVXMrZnd0UjR6?=
 =?utf-8?B?cVN1SGkvVWtjREN0eFZaRHgvZnluRmdDSXZvZzcraW16WXVoYjZQZGc0aVRj?=
 =?utf-8?B?RGNIWHNMQjEvRnNZbU1tV00raUwwaFVVUXFQSGgwS3FSRERXWlNGK2pwS0pv?=
 =?utf-8?B?S3FydmpTVmNOcnRMOHFySEtsTWZsOU8weHpQaE1ycTFrUDd4RUw4MTVKc3ZZ?=
 =?utf-8?B?MjFzaFd4NFZYSk9STVFPS0R3NGFxUGp4VmYwRGpucEdjUkhWanJHTktuZVk5?=
 =?utf-8?B?YUpzUml1UzB3MVFjcWZ4ajF2TU15TVRzZmRLbnZrbHF4UG5kMkF1SXRTSGsz?=
 =?utf-8?B?UXo1bXp5M0xLdkx5SkFZNlE0ajJzK2NBNGNQd0RDMkNHYklPcnQwcEtmK3Zo?=
 =?utf-8?B?T2ZyTlNGNThCVGZOZ2tEZDBBT1pLcFhVVW1TamhjZTRMTHZNemU5YTRYK1ZH?=
 =?utf-8?B?QmVaMElua3NoaVlDR1VrTU9wV1BaQVlacGxpajFGL0EySGxVc2VuZ1FxcTY5?=
 =?utf-8?B?M09wUkFweitjY2NLQ0tSRjlpa3k5eFZYMU5vdit1eEZxMS9zQlJBR3Z4YjFI?=
 =?utf-8?B?VzBmdU5QMnltMGxhRi9QWXRBYVc3Q084clJFSmtUd2JVQjZlYnA4Rk8xNzk2?=
 =?utf-8?B?T2svbjBDQzN3ZmI5Tk5wZGJDdlN4dEZ4QVBnOGtLOWp6V0c1WmxOZGF4ajhK?=
 =?utf-8?B?aW9NNXhKcDlTOWpVNStrS1dzNG44bm1ZbTY2S05tb2JpTG9GYjhtbnc1MnFz?=
 =?utf-8?B?dWRXQXhIOTFPcDRqV0pHZEI2ZjQ3QjUwWDM4YjNuUlA1eUtDRTFlMllMSEJ3?=
 =?utf-8?B?YUxNUnpjS095QkRDS2tXOElIVGlMRmd4anNIMGtpaDArck5iQVMxd0o3bVh6?=
 =?utf-8?B?YUxJdlBTcW5FVWVIQnJBU0pJa0RCUWtNUDUxS1o5VlJkcVRqMXNaNXpuSGdE?=
 =?utf-8?B?eGpVNnZVaEJWa0hPT2dKUGtPbTMxRjRVNDUzQWJkazBNZTNIVC84M2drTXBL?=
 =?utf-8?B?WW9BV1drMnN6Vk5hZ2V3WDBHV0ZwZytNdUpCeVVmYXE1WmhQc1VpQXVLM1Ux?=
 =?utf-8?B?M3lqWnd6bVZmSGdLVm84MElQQTVWVVFBT3pMNUc1TzdMRGVhSkJ3ajBYekRZ?=
 =?utf-8?B?MWM2ZVNXT3BHeS9MOXc0aDR6SFB2UjFDYmVRQnVwVVFMMy9pRkk2MjY1VUox?=
 =?utf-8?B?OUpMT2RKL3FVcWo2NWEyRFY2NWwveU5KbTloMU1QUzhaejFBdkFrU1BhRmdU?=
 =?utf-8?B?emcyTlowSTdYVlI1ZE9sQ2JwM3Nod1M3YTN0dElqamJYWGFobWhTZ1JGWTdL?=
 =?utf-8?B?TXFKc01lU2c2UE9KZXNCZ21hTmVoS0w3Wit3UkJkSWlMc3VVaHR5Vlh3WGNi?=
 =?utf-8?B?TU1pQ2xBQTNmS1NWeWxVS092d05Gc3pIZElycEMwaWwwS21FbE5CYlBiL2p0?=
 =?utf-8?B?R25paHpuSHN5RGRWMGdHd0puVzVTL3dqSTVMNFdiaDNFVVgzSEFhb2dKeTRO?=
 =?utf-8?B?bGxWbkZwdk9hV29tdldwSHNjSjl3VlVhbVpoaHB2eDF3V2hueW8zQjFMbWpH?=
 =?utf-8?B?NHhhYjFlVXRNZk5OZERONXU1MXpmL1hmRHNIcStQVnBNdnRWd0ZoS1NkVzJS?=
 =?utf-8?B?NDhZYmtRNFhpTmk3RkZVblVBc3U4cTZ3NFZNd1FYaHhjNFRzVU1CdzErYnZu?=
 =?utf-8?B?NkVaeHA0WkhETWtmOWNyU2NERU52VTZSaCtxNGZTM1oycHVpOW10TkRvVkdz?=
 =?utf-8?B?UUtoNDZTbXF5SFZHSm5aaDlQTUg5Sy8yRVkyendHZmJTUVYwaXVTYTFhK2Rh?=
 =?utf-8?Q?tdkmOBMqOpTyfc8AtaAmo5h6r+MQhd4tDnSKc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70fe56b-30b7-4236-72e0-08dee26ccbd9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:30:04.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApgvHFhmLAqH4mGgX3NVx/hHdYHb357HW2jnwH57jkrN1P48zoplaqJjhJuQIdU6dIklSolF1cNMt9fXVohY3wgp22+30Z0Y4AmSujkCJR3L0cm0tmsS2LoRopJcgO27
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684

From: Peng Fan <peng.fan@nxp.com>

Add the I3C2 (i3c-master@29360000) node to the imx8ulp device tree
using the Silvaco I3C master IP. Configure PCC3-gated clock with SOSC
DIV2 as parent at 24 MHz for pclk, fast_clk and slow_clk.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 5438958176985..c82c3388cbe79 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -361,6 +361,22 @@ tpm5: tpm@29340000 {
 				status = "disabled";
 			};
 
+			i3c2: i3c@29360000 {
+				compatible = "silvaco,i3c-master-v1";
+				reg = <0x29360000 0x10000>;
+				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&pcc3 IMX8ULP_CLK_I3C2>,
+					 <&pcc3 IMX8ULP_CLK_I3C2>,
+					 <&cgc1 IMX8ULP_CLK_DUMMY>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				assigned-clocks = <&pcc3 IMX8ULP_CLK_I3C2>;
+				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SOSC_DIV2>;
+				assigned-clock-rates = <24000000>;
+				status = "disabled";
+			};
+
 			lpi2c4: i2c@29370000 {
 				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
 				reg = <0x29370000 0x10000>;

-- 
2.34.1

