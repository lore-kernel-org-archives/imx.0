Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C5C3A16AB
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 20:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629000; cv=fail; b=O45BJIeSb2vxKBa4Fc/uVPiJEWfk+RuXQ4CuStqRpHGPr4uTUvbO+QPZRUDWLdYPA6eaGABW/8MI6OmLvj0HknEruW4Si8UNcCMfQL7IPYyc2owq+v8ljJ6NEONYFvdChaJqCqzm/nnGRShLXOp62i8euBUxXurqf04a/1/7iRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629000; c=relaxed/simple;
	bh=CcsZB/esIdV4QlyUE/NMwh8XOOto4+Z5LzACsY4jUDo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=c02wMh5cHdpZ6xan+MFGqjIyAM+IakpvfWY9Mu4TZiDm0Q2uORISGrgkKfy45oVgX7H6Qy9oR9l/FI6g4TLWf03Q0JRsROPaKFrUYYAbmgRqHc+p/0FJshUtPyjzu0XtS/tbthsZmitnbGALR8pRz8IdWpSJOki5BgfGf5lNNZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CGdSuSk9; arc=fail smtp.client-ip=52.101.72.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CGdSuSk9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CO7GZmzeP2nN22/R//rQgAmCLp9kN4W4+km0i2/i6QLbSLsN3GR//bY2f2G8YPwyrOM0K12Ow0m3Zjcyd3cQ51nJaDEJYCQJbTSlDSTnHGllnXdoS3w8YKUuPTinGx8+dzGzgGUuSN8FqPMxzYUFJEFpwg/IzqewRw0kHzq66POZlLriehxqIouRPgrt3B2BxkdqAsKJkdQqB13sDyACJ48Vj29hhQQYvwxSIVV1VMW2MmqR4rQ6390GejOEcHws2LodUPKoX4LMGNXmIXn64IUow+bPjEgZvSnbVgXutK1pmLNO1oRg6aXLwanFiA4ar76XNXa0YNChtyc8iYuFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+/ECIuPhXQX/jL3y2iPJah0HMMrB3G1RyPtmys15mc=;
 b=azY6gtMpQuE2hUY5YoO8RF9yX9Lxb14/JuUhBvj2rAEoQQATCdNuH2YD2gG0WwU1zwWm0bC9ScRRWg+G56fj56dSfeZ4DQpCO/ctZzxqud+j/gT8Jz4s/F65VYmG972aB17IeAtqBE9HoQHTVbuUO0m6nZJAJpLKiHErK3P4h/gQWdq2au8kZGLmNzYcyAduRrvSippdfIzV+zBF7QN+HQoQttubE2z2lUsBs02y46lAfk4xrs0XAs8qhmNbnCLdupnt/fmqFHBscmcn9NOCtPPYerAf3g5NJN5Ofnf2zRldZUOfHLwDdGfPkjaBvz8mbKgZE1zFi0x2neA35uwEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+/ECIuPhXQX/jL3y2iPJah0HMMrB3G1RyPtmys15mc=;
 b=CGdSuSk9ggJrL5hHxlO44rS+UsDoC/m18GWghNqVkCo/4fuYM4Cn7G+y7u7H7wm46P+lx++aYyTfUfjaMQV2M495yIkQ++MfhFvFe13gZLlrKYcGFWlK7LuE9aQ/yXfNcLSlG1L7LZfEk9eFSQBO7110T3uneYiDHw9+hSukEdarUOzJRev7dw/xqVDKJUSdO60YQUt4tfZ2XTZNpBkFt00V4PLw7h+Xtlh6ORlNixxoDC85Gfx7/TtUHbH3Ox+rVWq+I22cBcLqa1TX9Wukw1N1NUTIZxuvynyvz/3vIpbNdCy8eDDswqzRNmeJe+ecoJef/NquEBHwW05qnQssCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11886.eurprd04.prod.outlook.com (2603:10a6:102:517::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 20:29:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 20:29:55 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 09 Jul 2026 16:29:43 -0400
Subject: [PATCH v2 1/4] arm64: dts: imx8qm-ss-dma: add lpuart4 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-qm_dts-v2-1-3ebcce82bb79@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783628984; l=1293;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=L7TbDoNUQeByl8JduHOOxEKd8Pv0cbGxsRx464p9WtE=;
 b=Fo6e8rAYDbFHd0ikfBoP1mWmFc05/YQ6X7SrC5FL2KyPQC1gbD0Ovdt+WGRY6uGZWlX8CdFBH
 KL0gKcpMBYdDsEYG/T/lUdVd63OJn6uPplug85gUc5rB7NV+TEoTOIM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11886:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c5e0a1-6dbe-4189-822c-08deddf8d63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|7416014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KChKx0FiMf6ra+0vt50xoiNaJYqtpwcEawr0LhhDKeqbJSlAuIqGPkljC4s7bcE3iwyF/66akGDCKptTDJX0KK3A8AiOHCRxu+sWj2f8sfqxjIDddPmBZGRDT8G6y+F/TptDKW5axtTZEJDFxeGu1XW/ncuqLzhkeaTC5gcFU43xMK27c6+qMyTzZyRKpuFlaSa91g+bqIlzXTvH6Wrzjn1nxEQLQrGdh5GFWt7H50cOhW438+wgyf2Cfh8MLZCUxzC8v5GvsAhjuMRP3nns/eO4AxPVfHPCmbmLZ7HK2l+9BptOJvlFmildH+gUP1Z/PPwAtqbfathUp4QqhcU5wI8VUV2gXbXjaviartqcdUwjQuAIr4S3ptJouG0zI76bZZyc3Vmlc7ho0+QvHWo+OFbXSEiQD3AwLaDXTuCkJNo+NLSQGHC4o2tNcxujJEwzL6LYjVjen7RXxuVtQ0PBLn/HPFk9LXXrgtqm43SyJnHse1rafzq4QwBZcAgWEjM60ZxEW/DJRTRgBvo/BwQPrBeZkyQESNn8jJqqKa0tXlaOgKLCNz+zo89PiQBtgZyfTvWCbpiZHQeROGfOfcpyt9neYP+NFhlYhoWb3SCr1EmMzekH3XFtFRbzMieGUkq0uO4Q8+aCHJRKd8gQ7/PybJd70lkLQaP08hLwbNY31s4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(7416014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVA0MmcxSE44c29yOElqcWJMVzhUejBoeWRJWUNpcHdlYklTZ3QxSHgrVDcy?=
 =?utf-8?B?SXVtdnhXM3Q1eXdpczlndGgvck0vVE5zaXhsalE2NVE4V3pJTVJOUXgrenNw?=
 =?utf-8?B?dnJKWGRyaHVOYXpYK25MY1RiNXFvRlpsYVprOTVFREV4N0RHK1lZb281N0dC?=
 =?utf-8?B?YkRiYVpPMzJ1WElYQkh1Q3lYS216d2xncXpFK2h1eGhjSkxlTHJTSW9SWStH?=
 =?utf-8?B?ajMwS244K3VGU3VFZ0V6RXR6eUNZT1RlOTNkL0QzaTRtZWZVSnlWM1IwUmJT?=
 =?utf-8?B?S2pPcllET2NXdXNiWlBxMUpidi84Umdnd2wzc0JSOVdvM1lpbzVQaUk0OGNM?=
 =?utf-8?B?ZUVGRExDZHRuUVpvdHQxczd1Y2ZZQkVIY3BpR3VvSEVvSVRVeHFFZFBtajZu?=
 =?utf-8?B?Ykh3UmNZTnRxQU1xRityUWpaNEFYUWo0QTZrSmwxdUJwdFJhQk1ja3ZZNHlK?=
 =?utf-8?B?UXFqeE85cTh3YjFtYmtNM2ZqS1FJUzhzQ0kwcW01TFRremtKa1B3Y1htR2Jr?=
 =?utf-8?B?blA2MU1ERUhvN1lzc2RRSDRIZHFnYXd5RDZmL0doUER1S2k1N2JyaUJlVEVF?=
 =?utf-8?B?MVV5UDlHYzVQVmJ1YUJFY00zRGdnQ0xuNk53NUJkUXhrUDJCU0NrM0lyeTlE?=
 =?utf-8?B?L3ZLa0RoVmQ2a0ozb3NMbWVUOUplNTNLcWtCNmdxWW0vajBKdm80SUhyVUdJ?=
 =?utf-8?B?Q29OYnI2dmdQd3h3eTh2a0MwS0NnS25kK3Z5Q2R3QkxMdEw4ZDVSeWxPOVBj?=
 =?utf-8?B?d1NTNVpZS3Y1UGJiNytkdEpnVDFyWlVMZXRVWkNKSUNQQU40NHRMOW9ZcHBX?=
 =?utf-8?B?WmExdVpTVGFTZjk2RHFjYVBTb1ByS2JOQVBELzZ0dmlvaFlQOEhMTnRLQXNq?=
 =?utf-8?B?a2VZYzBiVWJRMWxPdWNZUE4wNFpyZkwreDFKMitBVVVDbEtnUVVnY0JlbGQ3?=
 =?utf-8?B?YloyamY5bW92T2JpWmZJVjNDbmxtSjNQcUVxdEJ2bmxsSFcwNHc2am0xWktO?=
 =?utf-8?B?RzRxY0tRenBialFoUU94Tm9hSXExVmpTZ1ZSM3Nad0RWQUd5N01HZmcrUU9I?=
 =?utf-8?B?OU54SFFBRFU5dFdWc1NzNVhrSGhtN0FCVVBjNkdLK1ZXVnNxeFRZcTh0clBo?=
 =?utf-8?B?MUk2eGRBZWtzenh1UGhMT2NtSUdpM05UaXVCR2JwSEhCM0x2SkRIek5MNFRN?=
 =?utf-8?B?UVZPVDZNdW9uOWVIbGgrR3p3MmxCMlBZNjhmL1NuWkFZSjRXRkdaTUdCNXJ0?=
 =?utf-8?B?NGhjc0ZnRHBhSzRnTkhHWE5XRGJsSHhUZ3lZOVlyc3c2NURoMGExYVR4RDg0?=
 =?utf-8?B?ZGJpMVB2UGFSWWhnbkpVc1VGUU11YUk3QWsreVFrVW1XU1RpOVhmd0VNVUQw?=
 =?utf-8?B?R0l3bmJHMHQ3bHhKTDlHaVY1dU1NeStuQTU1NGczWDNTR0FqMVJIQmxYTFF2?=
 =?utf-8?B?RHRUR0dOWmVDT3dYcVI5S01nS0V5Wm9EUURJdzBYby9QYm14TDRIUkNPaXI5?=
 =?utf-8?B?bmlMY0lHMUFWajNMZCtnVzUrcStUWkdJYjFpYU51OUxBLy9LTlk5MWRXQXFh?=
 =?utf-8?B?VFcxeEpOMElsZDYza3hGM2hhV2luaDQrL2ZzUDZKL1RyVjZHMWovSDZ5OGRy?=
 =?utf-8?B?QU44ZnFraVhTR0gzY1luTmNCUG9ZSjBwQ1VRcGx3ZG01NjIvSnJ5V0NTUHZW?=
 =?utf-8?B?LzFkWnpOeEcyUGlDeUxQVmphOVovYlFScjZQcjFiS2d2cjdYNTYvdmhIMzlM?=
 =?utf-8?B?OFNRUmhDTVhBK0tYVTZVYTNUSStDbzdZZ29DUlhxY09LZDRpVVVUbXJQQlVh?=
 =?utf-8?B?bVY0NU55NmRSTnFYUGl0S3F2Y2dPREJ0YXE3a3RXekV1anNwYVVFTUZMUWdZ?=
 =?utf-8?B?QWVNa3pXNTV4eDE2VmVVaDhnaEZ4TUpuRXpSSjhRb09BV1J0YkpDeFpaSFZH?=
 =?utf-8?B?Z04wbHlrTFQwdDlTNTc3aXExbjFDUlZpcU9qK0FnSGVyWU83Ty9KQ0QxYi9U?=
 =?utf-8?B?QUU5TjIwMm9uelFHellITGU2N1RabWIxY09BVFdacTAzUUFsR0FuMVBYcEJN?=
 =?utf-8?B?RDVlNE5NNW5oMGl3Y2hTbWs0OUk3VnBXVzJMVG00MlRJcEk3bDMvalkrUlRP?=
 =?utf-8?B?WnhSRGw3Wlk3dStxMnJia3ZzbVRGNTg1SmhFNWRmcXM5VU1CRmc0RFhQdXhG?=
 =?utf-8?B?WW12RnI0SkFzMFZYYytwTTBjbEl3dkIvUUtsc0xnbGVSRmVadUUrQ1c4blpi?=
 =?utf-8?B?SEs0VVJ2OTVlTGowSWhuV2lOVUdJMG1wd2F5MnlVYzdsejNWRWpYYmpRM2JN?=
 =?utf-8?B?WDJRKzBhSWk1Mkg5TjdRTkd2VzIyUzVJOUs2YllFcGJKc2hIQ3hQajZiUEg2?=
 =?utf-8?Q?3QExwaITOG3p57CVGAC6Hjop6nztzdHoaYWAy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c5e0a1-6dbe-4189-822c-08deddf8d63a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:29:55.0907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7Xb0ePNg35FellF9jUqv6rx0r5QTR4MIR31hTQ3amUv8Dt/uWdKavmdG/X0dmXLsTStipKNRIQvlBSwxkOxg/M7dSSLwwJI50S2xv4J6KLvIK6vcZUiMM+i7DHuvUkK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11886

From: Frank Li <Frank.Li@nxp.com>

Add lpuart4 node for imx8qm.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v4
- remove power-domain-names, found by sashiko
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
index 974e193f8dcb9..738c6f05c4ea6 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
@@ -8,6 +8,21 @@
 /delete-node/ &adma_pwm_lpcg;
 
 &dma_subsys {
+	lpuart4: serial@5a0a0000 {
+		compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
+		reg = <0x5a0a0000 0x1000>;
+		interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&uart4_lpcg IMX_LPCG_CLK_4>, <&uart4_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_4 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
+		power-domains = <&pd IMX_SC_R_UART_4>;
+		dmas = <&edma2 20 0 FSL_EDMA_RX>, <&edma2 21 0 0>;
+		dma-names = "rx","tx";
+		status = "disabled";
+	};
+
 	uart4_lpcg: clock-controller@5a4a0000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5a4a0000 0x10000>;

-- 
2.43.0

