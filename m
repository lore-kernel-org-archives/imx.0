Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013001.outbound.protection.outlook.com [40.107.162.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD4C34D4DC
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510052; cv=fail; b=HimsZqHbg4o8uC476Mt6g6uguIZ908/RZy4DlPIEDlY9lg241P/tJJO+1PVyHy2+D2QsR4JNIFlYGNbhBiaaTRaCgfW780nEzgyScL5orj21ff7rluGkxdb9A/+laC88UjCvmLDp33l31mHJOmWHHp0PjoE88B17DN9MoSqIYTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510052; c=relaxed/simple;
	bh=wLMFgGiKf986OhuB/P/oW374rZ4nYXQnF6hJiRcq40w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ezhx3MzQYRN20TyVhaMlnOzE91L/Rl71o24gwIAUZge4UniraPftjjlRwiMpRSpkB6cQpSS1xmxrMN7TYW3Nk0Qq38o1x7jZ+HAv5ykjQqjtDV/h2RfUHfsVD5W9gLCRdfOS6U8SsRcbPo+26zgbTdake2ZAt5o+LOKJ6WxJ9T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NGPrXV4O; arc=fail smtp.client-ip=40.107.162.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NGPrXV4O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1Ay0tQFoiYGVHMri+wxEQ0e9l3PEaxO1IPguhSqlvjrfTh3YubGHkhZS7tjuytZTj2y/JSgfrImbZ9orq1gbwjEjbF26g9xlDHPljI1ZYKyI8LTQuLvObQib5ne+1nJbTF9wcS4NdKyW68h7eMOGRgAFQNQxBz6yeBN6Sk43mM7oaN6qMSJ07gArI3tJmXEIm2Yb1AWfhio19EuSqF2y/rbgnjaW7e4Rs4gf2iPFzlYq3Lm0i4dkw6gkRo74wuftxZOhmffu63lkMj01NuaX9fuLihi61DWKENFuNoDPOHHkZGeCsBx9hmzVX+5/vxrEWQEn6LcixvZo5S9ZHwDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b68ViBx80oTY4oWfvttXAaE6UNFjfURUYSITE9C1RtY=;
 b=M/pneLhd2ojentih7TuuHKWG68x42mZMMRcVN3fZL1mknl9YuRsGMAnsVMC0jpOqmn6nZH/KQqlSzoQHfofBgzltW7SQDNW382pPdtvaz4vFAUpPOUZBn2dUiGhwGG3t6mXtLk8VXBheyref8qV9QuXaRS0fVUHWWDUDB5gRS10tFkXpuAKbwZQ3TEl04BAdaOZSfNe8rohOjr99opBcYOIZR9EwM/Ders5xv0dr5Qu3+otxJ7BPsqJ+V5lBf+V3bokO2z9H0RQKDCdfvcB0Qrvg1g8zPA2FUYmBfJvVWuhtdvFAMYNXPGVUjobxHuWoRMUB6mlewrEtU2is4Gl94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b68ViBx80oTY4oWfvttXAaE6UNFjfURUYSITE9C1RtY=;
 b=NGPrXV4OOj37CFjNYjtyRquxZ+zsqlAYMV8I+OYZ/Z3w+HzhPnEoJ3Ol70F4LN5rCITazTtr9yvvBEzhVUSc1nRowGRbzRXQKMmG2O17QI5wB+DXgAmrbs1mPvs2OXpBbIE05RmlQn92cj11qYxvBoyrEwGKI4IA85e6e7G+RtYnZlcvOq5dBSnum1YiQjGwLm4JmXvHwqiYyHt8mpGs0jtXNWc1We/TekGL6OreZfb5ZZP028hzG+VCGZtR01qMpn/Hxlh81Q0WTw5qdL84l+SRzW5H2o9WFinKyknQLPEVN8hT884H7VaIkIGkrRPSUQCHFBjVEVsJKNk8avU4zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:27:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:27:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:09 +0800
Subject: [PATCH v2 05/12] arm64: dts: imx8mp-icore-mx8mp: Correct PAD
 settings for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-5-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9a2f36-3ae7-43aa-db10-08de8b0913b7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 wdbpNo4b8HvlhakWC7ewwpeQ/HGAOcze+dD2bsMAFs+w+UVnSKUQUAuWgN/KTvkDDXgpOdFsCCxgFUih2RXfqweoMrNOS6K4RqSnDyo37t+jtRAON3zoKXIMC1Ja2aFs5rzA1HcxrAMIGYvGbIQiGreiRHsH9heHcWvy7Ta2ufhsI3cwQ/fko8VDBMddGwSUFKLRhs5WrZ4/GzHGPi4lg494NRNaJxBXxPqgE7QFDv8zLRx608agV+Xd/pPFYJuiTwtf3M+7LzZQak+rL0ylmm/RnjLn0qhdPh1vmw0A23Te9hK1TEPdgRJznFZhVg3mwZyMzdVC1FyKU4iXlFp0YQZ3j4XzrtnoJQ5nsKnP91Fm8+qGjNv88eKBC6OwinhhfwyYTqqxgSNZKn3bpDqlhzi6w8h+HMm4iFd8wDQfhf3Mp3xxpd87+3vC28GBYkCpl0DVxdxG/qZXE4UroijUsLqORJRfLwpDKv3HLll2NjuF8Aa7Siq7Ohz5YnTuqjuCk/bwaHYhLmAhylet9G/ifMqp1Hh89qxmy8SNGUJbmU26yHI7dtkXnNfy9RB8zn7EJJLosNDHMfED/75TO0jCrWnKCWgG7DT3QAxafs96l2yrqepT9PSwTdenrH0LnOd5zfFzCW526uRhmrr21YlSnJI1fZSaQOm6AMt8+AI+Tu5j8FcL2xtYTEQ2GeJ17VZM0uEUl6n+hNb9oa6GMJHd0LqP3NyD78VD3XVP+w9M1mUKua8GBIo5Fp5bZXgtuzv6t0HXHYt4Wf9Ad0Heg08AerRqtlx9n3OGcC6ey66Qs4V2OjV7j/UuxI4xe2ZywRFy
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZWQ1dGp5Z1o0U2FrenZWd0xjYmxCaFVXV0I2L1RUdTQ4Zi8xMzBnTHFZYmNK?=
 =?utf-8?B?M0c0VzFHb1VJcVg3SnVFZU82NGx6WFlyWmI1TjZsYnAyVVlDVi9IWGNvc1dI?=
 =?utf-8?B?ZTJDQ01YNUJ5RGNkTUJIMStrc2x0ZGV2QnNEblhKODZKUE1FblFLRnJhdkV1?=
 =?utf-8?B?UGR0WDArckdwM21idUxzVkVlYjU4ejdMQXdBMnFZNVQzeXpXODNsY1hTanFr?=
 =?utf-8?B?eGF3ajlZZXFMVEVBNFFxRnJ5MlM1R2xyelRvQUtZVVU2STJML2xpNWo5b3Jm?=
 =?utf-8?B?cjFBVXQvKzg4cWVlaFpWZmh3YVVvbXRxSkdvbTU4d1E0anpSTXFJbDM4MEFF?=
 =?utf-8?B?OGc0cVE3TGlCeEJ0ZlBoOTdnOU9aZVRCeVIyU2dJREZuTjZac2N4NDAxaU81?=
 =?utf-8?B?S3hwQ2xCdTZNVTZjeHArNWxuNGphZXFxMGw0Vmt0MVNlUkIvMkwzWGNQSVFV?=
 =?utf-8?B?a2MxaEJvR2lnbUNETUQ5c2tyVWtZQXpuY0hQRlZiakpGTWVEU0pBTzJTOTJF?=
 =?utf-8?B?M29ibHQ3NlA5cEM5Qnk1OTNFb2JWL3dYMWMybTJ3MGUrMGlhTWJCeStTbng5?=
 =?utf-8?B?YlBBZE9uMGJncEFUcmJOS3d1OCt1RWFYNDFtS0thNEpZdTJCQWV4WFA1U0x1?=
 =?utf-8?B?SW9ncytyNVRISnQ4eTFHMDBDYXhaWW1kUG9OdmZPS0ViM1lKckNpY041Y3JD?=
 =?utf-8?B?eFhkK1Z3cVRHRlh1WXZZdEQ5Zk1oUlYvTmhURU0ydktSVVRVYzdJR2dIWk9l?=
 =?utf-8?B?Z2Jyd20xTHlyYTRQRHpYMUw1U3g5QmpLZUJiMGpIeHhZd0tGTHZ0aUV3cHNq?=
 =?utf-8?B?aTJreThVSHFqQTREc0NCMWxmaGJ5a2NlVE51ZWMraWdzN3NHL281MHZ4aC9U?=
 =?utf-8?B?em1yTzdGTUJUZzNLYzhuK2FiSzJrRHBlYTBZL0JZMzVSWnpqd3RwakRxbjlj?=
 =?utf-8?B?eG0xWVlBWkp5RDJWWEp6aEd2VkxsTmE3dnk3WHRKNTNBdmJyaW8yeHFOTnRE?=
 =?utf-8?B?bXoyaXFRUEMzY0FEaWZUenFPNjFvTFAySmd0Vzc0dkNLY0JKYVhxaDI1UFBw?=
 =?utf-8?B?UG5FTDVxa2FNb2tNWlBUckVCTnlTK2hWSjFjN3VyRkdpcWJOMEpGUlNQWGJn?=
 =?utf-8?B?bHdxaXZZakNuUVVXZjdiM3owOWhBK2ErWUVMdktQSEc2VWk5a0lKd2IyN1Mr?=
 =?utf-8?B?dkZaYmxYYlJRdFhLbmRIUk9aU0l5VlJxdWsyQWJkRDhyQmY3L0pXL0NSZ01C?=
 =?utf-8?B?eVJnek1nWW80cGxoT0VvbWRyVkU4blhiTzVTY3dMQXRVMm0yY2JGQnJuS1dx?=
 =?utf-8?B?Z1ZTQkNVNlF5S0tOOXhFWTFvbkJzT2Z4YlM3S0pwREZWbWd5TEFCbXd0Uy80?=
 =?utf-8?B?ODJURGtWM0UxTXZQVE9ITlR2Sm9mQmNJL3VydWJtd2FGNllJWHdTWDJOVExu?=
 =?utf-8?B?bHZQMzk4YngyZ2d1eklHWkN1SGx6ekdNb2R1OWJJRHZOODdISFl4L2hpbFI1?=
 =?utf-8?B?OEZ6Mm9qL2tIY0h6VVFIMXVKS2hWQzBad0RocFNJRzV3Vzl6U0RjaVhyTVN2?=
 =?utf-8?B?QU1aUFNidGh1UktOcFBGdmRuQ0I0RmdNM2x1MjBmeFNnZGVUdHhJRmY3TzBa?=
 =?utf-8?B?MytIUHU1UTRNWjJuTGRLU01mKzlWYWRkUTNiRWdtQmtGSlFJNmxDYTNkU1RX?=
 =?utf-8?B?VnExc2J5a2FVcEVHT3piWmlBcFNhY0ZCMXk5aXpvQ1NtZjhJNnRaRUd1U0V3?=
 =?utf-8?B?V3k2cVlCK05LSE4wa1JLU1hONjd4bElNTmRpVW0zVFZXc1ovSG5URUQ5MFZO?=
 =?utf-8?B?UzMzRDdwQk1DLzdNWkJabHpRaGFUbi9zWFkzTld2ZHlLTmY4RHRIRUpCQk8r?=
 =?utf-8?B?Z1M0ZUtrTWZqWkU4WWRxM1UrbGx3dnhocWNkdWpuVk9aaWx5eUM3M2Ywdko0?=
 =?utf-8?B?ZlhRdkZFSWRIUlYyd21CL044RmltcEhIR05zaG5XQXBMQkx4RXhCMGR3SllV?=
 =?utf-8?B?UTBwbURVMlRJaDN1eHBIUTNsVk9ueHJBbHFHZ1RzYXVEc0dvU1BaK0N6RzZX?=
 =?utf-8?B?L0R2bEd4TG9qYys1WlNFOFRJcHY2Z2FSay93YlFtSUhNME44S1FHeENGUXFU?=
 =?utf-8?B?UjkwRFB1dnpFVFZQTlliTVUxMk03VTZKMWtWTU5pR3IrNTQ1Q01kcktpK0kw?=
 =?utf-8?B?d2FVbmVyeDBLWVRGYkxoZ01nUGRaNFh6Z0FLV0oyTFkyVjkrZzdOQTRwbml5?=
 =?utf-8?B?eU9YV3RkNitpTGQ0Tk9DVVREamxKSk04YXVaMU1nckVMNzVERysyMm1YYjFu?=
 =?utf-8?B?aHcveCtTczg3SnRKU0VDMlNyMnZJM2VkOHovMFY2YWNmUTA0N2JoQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9a2f36-3ae7-43aa-db10-08de8b0913b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:27:03.6584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60iVKZC8e0R4k3pGuf2zKX4jUWi3fFOSesJNveKgyp7m8NWFs2FsBa5+v6lJNxCVBDHRk9b6XhUSGaXi54tnzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there might be interrupt storm for this board. Need to set PAD PUE and PU
together to make pull up work properly.

Fixes: eefe06b295087 ("arm64: dts: imx8mp: Add Engicam i.Core MX8M Plus SoM")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
index a6319824ea2eb140843402fcbcd7d2c8a38a1667..69558ffefa9a675ba9177fc579cbd7339994472a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
@@ -132,7 +132,7 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c3
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01	  0x41
+			MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01	0x1c0
 		>;
 	};
 

-- 
2.37.1

