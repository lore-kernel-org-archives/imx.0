Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689142874E3
	for <imx@lists.linux.dev>; Sat, 14 Mar 2026 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773492686; cv=fail; b=Qs0VPUsdZMFBQUsauW1wElCZCUD6BYfcE+EA9tyZVrH3yQ7HZWYvLW0m/ExN5Af82UvvFXBN+UdSKjrVl/Z9EltU3RbSoEPyTdW322W5WI1J53UjtUyjrSPK4MVjm9WBbQ2GDHfVykBXc9pjOwsuhH3gXAcvgsZnAOZYgdTzEQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773492686; c=relaxed/simple;
	bh=K2eCixHQjmBmauAsdHqEvQkJEwxBDNZn3GDIPHOWznk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Au4J38jmzVvkj0/AMCey9luhq5LOxRnVDCsPyu5aECrshdDOwBv1Oux9TzR7+1+RF/sPjNNiY59+pqlQ2pSk4FTtvfbOLYvckH+hAQMjQak7ckixgCciK3VlgnhIxz4Op4lD4z1NOqt6uY1+XAoCrlr4hKT/fNpDMHz5AfaZg4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xyOeBakD; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xyOeBakD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQ6sZeGWs1txLXIP2DJ+xmVFyBULM3hNs14flSyj4XbLRhyAT3eTSYtqsRdweEhaGL8350H76TIdVR+8rayGj13p0tqpOAZQ00CyWawqiBct5tlOCXWXlM4C/0WFbC5Ay0MIVpVLCNra/YMjjehrJROcPplE5yi5jplMgi7wvdjlHbYLxKMK2Pem81XFutc3hVYjdXjVRQ3Eo9VUmAUHAft63u57UGnS/1hgePsY7lQfgRk+JO3GjVCD5FM+i5VaJ4hd8kKAwDWj0675b19TT+5g0oaDq7qmBqiqkXoFX4F2d8wsNTJ/F2Pq//sVpFDq4LHnUo50DgjvDBgzWzL2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiZ2CBadOISq711D9qBhf1UwdWXRHJBkhvXy9fruMG8=;
 b=xNWqdL97tBcLN968XdYgnvijnRVRuniEyeS2naB29JB4SmJiNwFSACBw7ogWCiY+NqUMAExq2x71OSC4gNehNhmKVtlDunWYlWYzgyplKOAIJadJfHe01rEEk0jexb/WcOfJICG+g0KY97n3sPdnu7k5YANL7zw8X0PRS+N0ek1SRayygbLxmPIyaehbcPxe/UIFcjedpUlOtmHcpj7U0fudVuhAYXVXABcT1bXAPN2Or1orZM2RTpv2UcD4/soT0O0a1iQZAgBYOsmIDctBnB4Q0Yte00damtYaK23K8NuvfFi9QehZlXvjdE6LIIcA7Op7VDD6Y8Xbk7So3K+T/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiZ2CBadOISq711D9qBhf1UwdWXRHJBkhvXy9fruMG8=;
 b=xyOeBakDh4+zYSnxS6O6mMzJQD+lPsePZ6euskEruvnwXBUcirKWNREPPM9QkiLK1/o4GUEYW0aQYNsvG/xizXPhtQP9HpfVpnte2wh58cNZjCX/If+Z2cBbLkeUNkhgk3nTeZCiyUGPqnOhj3XACa12mjR6EdGpZ8WmjKbk9w817iQT6rYmrGXarVIHrd1vMyePbYK8at0/drBixTf6jNlUGIOAUw237jSAnan2Zgc98HMvWwPMXzdbV4jvkp1xMim8yr05m2gO3otks8H7WeOW8wgQdfrKmMwaqqxW8WSoNvJobl6SX2AzoQV9FzLtglKzcBbr8RRFTWzpK5McCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:50:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Sat, 14 Mar 2026
 12:51:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 14 Mar 2026 20:52:40 +0800
Subject: [PATCH 3/7] arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-imx943-dts-v1-v1-3-3ba9b426863b@nxp.com>
References: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
In-Reply-To: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 388d3b35-baaf-4959-1086-08de81c8621f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	9iohJhAN2rcT1NFNtPFKyrU7jFOhVYB0pzLC1wyfoWXNi4ZI4JTzzZIC2aE9MdZbgicVjQ4eqHMzHJXd2MUVypQXuFvlCKPvRZRaKa9rVkEjrAJh+y6ATbP65i3ae1YO4Uo0eL/BTEi4LKuwotxD5HFueHwy2Oi0vEYqQo3VQjNpN4tj2stEjgdUqmGY5X21MN/XDT3HX0bo/cnUyYk8SydAmTRkRpArnYXQIdN3jgeOwvQYkMPZSWJmiHcZPxUz2COiyqIy65LK4fGZGmCa7xQmx7ZA8Yu0kejVgCi9kRA+zi5jja5SEtHuHHvqonCA9McextVWxCqca+9p9bgSBlIXcxMaD+g90O6yX5xQNLcgdqUDsNjJ2MEzqYLzxlfdTyS1SaYtjkgkV58Ha3PqvkkokRNNkGXgxXsceweBKvz2wlHVb/Jez4g5J5HOSn7wbPvu4HKR+7bj0u7aYI9zRHmvUzkED4930uoYgr6EYZdagacH+7uclDei3a8f5sUtWk4XYRCovi+ftNlHwOZj2iHEuR4zWf4YbldttLehMlWcBzFlZlMqDW/bA94U8iApozePZ83D+qTSJqGmoOcziYQqt0lo1J+QNGthFroVyAfAUb9lb2BbvafcvFRLrDVomBBPkANWtCK2uZCeUg8GwGPZam1sDYUC0A17tEUN34pamjx+jSX6dgdnICn7i7yRsUzvig1ICWg7xybZG1QoL6mimsSiMOSM3W8FVnV26NFo/cFYTB6+WbBFri0yoBwbnbBgF6oNoctFnTDjdvbCnrPICRWuuSy/mAUPonmF52E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnNVdmdvQm5NU1JhK2Y4STlyZG9Pa242bVhXeVlyOCs1TTFydElnODM0UlJ3?=
 =?utf-8?B?dmpLMmxzL3VQN2MwWC9ieVBvZFpVcHNRT2U4Vm1TalFLOU1Xb2kyNEQyMFlt?=
 =?utf-8?B?aktCeFkvTi9TSXlRNW5FdWRjK001SUgyckhNanRBN3JxTytRRjdlajBCaTNF?=
 =?utf-8?B?NWUvMmtKeG1GSXJZQlk5QXR2c1g5dHVSNHBGWm1ObGJiTkE0Z2YyUm81VFJy?=
 =?utf-8?B?WEJtQ3N3WTI1UjlRRFE0MXFmeXhjOUtMWmFidGVXTWRRb0RoNXJSek85WHFN?=
 =?utf-8?B?K2laRzVVTFZYOXBIVE9LN0RwdHkzLzE2R2E2T3RTNzc1Yi9oUXpqQitSamkv?=
 =?utf-8?B?WC9ZQ3RDNWJ6NVd0VWJQd2p1b243MmJOTjhMZ3ZoYlJKUENOUDZSZmNSRHE0?=
 =?utf-8?B?NVR0R2VwWE5CaXNZdElHa0tVclNacVVGL21pdW9FcUJ2NlZkZWE0RUxVQTJX?=
 =?utf-8?B?NmV1TkZyVERBcUd1QTIyVW5WN3NRK2NJbUh6eUQ1K25CdUhNekZ1bG90M2FH?=
 =?utf-8?B?ckx5cXNVL1hIVitFZkphYXlsd3hoSHhQaUlIbncyQ1phRXFlamp4T2prZERw?=
 =?utf-8?B?QWxxWTgxNUNyaTJUL3F0dnhxQVJPM0ltL2tPOW9RTWVUR0R3Y2grNXVhd3Rp?=
 =?utf-8?B?K3hVSzlXQ01zbXlPK1crUC9jelZlV2xwMHg0TXRjbmNkczBsNzBMUCtLTzVT?=
 =?utf-8?B?N3MydStzTSsxaGdONGY3NldFVmVpcDVQQUk1WmJRWDZzdXpvejN3OTRoUWVq?=
 =?utf-8?B?OEhJOVNNSXp5cDgxUnBYcVgzR0czM2JJZk9URFdHN0hMS2xuZElOOGhoZHR1?=
 =?utf-8?B?MFU4V1FRMlNDTUREb3k5anhhSW8yMHhndFEzUnMxL0k5dVNqOERUaGdZY1U0?=
 =?utf-8?B?dW9wNHRqMjIyR1lPdU5nNHREd0JYdkhiWWlxUmhLd1lRREhwM05Yb2tTMmdM?=
 =?utf-8?B?WHM3UkhDTXJ3eGoyazEzeElOcGhEN3hvRVlZRk93Y2Jpd0gzMTJpM3hIV1pG?=
 =?utf-8?B?NEJJSzh3MmtPNUVwUDRXRFpnR1FYcmd5L3VidUNETmwyOGczVGErck5oTnpN?=
 =?utf-8?B?aVQ3T0xoSWVNbk5OeVlzbjhScXpHZDRwZXZVbHQxb3ZqQW1RWXRxSmJoazQ0?=
 =?utf-8?B?emxKWEtkK2wvSGRnb3hQRmV2Q0w4eS9EaW9xT3dvcm9lV2ZkUWVuRzFqRHJ0?=
 =?utf-8?B?S09JYURzMmh3SWJSdXFZREUweml3WWtkNHZPdXB4eHo5ZFhHak1PZS9nbytI?=
 =?utf-8?B?RVlmbGFDR3JHU0pJd1hHQkdrYWhUdnkxQUFWV1B0WjVQN0JZSm14ZXhIRW9J?=
 =?utf-8?B?bzlKUU5RdWRWc2RwZDBhdHQ3SlB4ZWV0Rm5neDBTZTVuUEtodkdqaTBFR0dX?=
 =?utf-8?B?V3NIcy9ZUy8waXJxOVZGT1gwSzlHZ1FBZHpBRHY3S2FqdGwrdFRkQXgwTTd0?=
 =?utf-8?B?Q2xCVStKQkJJMXVmT2Z3ZWxmdHBsMlF5amszeHdxQzhUUHVQdTZZSjdneEpV?=
 =?utf-8?B?RUt5blBnVGpxWlM5QnhQYkZqbXU4enZ6aDhVeXFqU3RqMEpQaDZ1ZWppNVJv?=
 =?utf-8?B?K2FyT0Q2ZVNkam5vMVQ1R3RoREdZbFprWHhoU0JHdFQ2RXZkR0pSWDZ2UVFY?=
 =?utf-8?B?TXlLTyt1bnk3MU5qR0s0QjRkd3BOTTNZdnJpcm53WjlGMjlnMFYxLzZnSU1K?=
 =?utf-8?B?MmhlWlhkZXJjcTZlOXV3TSs4Q1htbjlMQWxWUDMvTmcrNzgxendsVWZhWUtq?=
 =?utf-8?B?ZHdRYXJPSlVvcUVKeStldWgvb1VCQXdNSElFOGo4djVDNEhhNHpHeXJFSEpV?=
 =?utf-8?B?UFB3ZGpSNk5JK1FUWnFHMnBYT01aU3dzNnlVbVlOMnl5RDRYQ2p1eG1MeHRS?=
 =?utf-8?B?dWVvS0N6ekVjNjk0WVdyRFZjV3RHeFk4NDRPVmJ0VklYdFJ5MEc0ZVVCWFRz?=
 =?utf-8?B?QnJFK2Y0a2VrQnlhTEwzSENJaWpuSUdKUUR3TGk4NjVIeGV4b1R6SjJTdGxy?=
 =?utf-8?B?bHIrQUlnalJlMm4xUlhYdUlsVmdUNDVYSkJVYiswWDNUeEdpS2Y3bEVoZzhJ?=
 =?utf-8?B?OFZmczZ4OCs4bGZFbGtoVnVud3NTUXovWktIZlY4U2xXMC9JQXlUOFJJNFNh?=
 =?utf-8?B?aXcwUnVTOUlYYzMzK2tVZUhyQk1ZUmVWTTBkYXpLL3psM1p4WDk1eHNieHI3?=
 =?utf-8?B?VDE4cmpuMW1pbC8wdWZjVnp0YU53aGVta01JYUptRTZ5RUFzWWp0Q3IxUVZt?=
 =?utf-8?B?eTd6NUJaenROWW1nU1BXL09SNWxIMlFsdVk3QnliTWpXWVpJQndCUVFMTVdD?=
 =?utf-8?B?NStPenNRRU1zcjlTZCtZTk1VYzFjMWRKN2dBS0x3dkh5Nlo5T2VJQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388d3b35-baaf-4959-1086-08de81c8621f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:51:17.3937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qlf08szTMdxvITEE9Lf2yVRgaz1Z2icuk4PrsM0mzH11gLw1zWVAGA4Rwrdz2cC8BNjO+LhdpY6e4U2SfGChWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802

From: Peng Fan <peng.fan@nxp.com>

Add SCMI sensor/lmm/cpu nodes to allow Linux use thermal, i.MX System
Manager Logical Machine API and CPU API

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 3f6d4aa4b9f365b209f82c7bf5d036bb58b1b86f..cffa80e55e17d0ae68347b4aa6f69ace22c1e7c6 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -94,14 +94,27 @@ scmi_clk: protocol@14 {
 				#clock-cells = <1>;
 			};
 
+			scmi_sensor: protocol@15 {
+				reg = <0x15>;
+				#thermal-sensor-cells = <1>;
+			};
+
 			scmi_iomuxc: protocol@19 {
 				reg = <0x19>;
 			};
 
+			smic_lmm: protocol@80 {
+				reg = <0x80>;
+			};
+
 			scmi_bbm: protocol@81 {
 				reg = <0x81>;
 			};
 
+			smic_cpu: protocol@82 {
+				reg = <0x82>;
+			};
+
 			scmi_misc: protocol@84 {
 				reg = <0x84>;
 			};

-- 
2.37.1

