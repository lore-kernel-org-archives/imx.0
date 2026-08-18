Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2516A149C7B
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 02:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787021598; cv=fail; b=comsU/LDapJu/kiKu6qAHaS6g5OQWMy2BTvOhaeJttS5qT2ljUj9Y9T1wO2VJOH2lNMHtf1LihnqyVAo6t+sHx4BLx94MPJuri4BetLz1JwoHI3XmHTCb5Su1G/HSOPApkMi4yUyEhdwCn10ZbN4RG3f9BAip2u1/wweggvDZD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787021598; c=relaxed/simple;
	bh=PjY4BRSlC9J71f6b2HA+NBIyofj8cX92Zyi6LSYNikE=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=J4KM4ei44BVGP3SUj1y4SxxO9QpDuQUXLk2jEkcyWzZMf9nY30giF6ikHfB/uFTURnMSXRWlizXxSahSWko3FOreHkRBDUI7s1kz6IkZvGTImtISYZHFKDPDw3Al7F3Drt3hyN/qAXh4//98PyLE1RdG3UKO5oFkrtvsZ7evvQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eKvTf47p; arc=fail smtp.client-ip=52.101.66.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eKvTf47p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tg1Y1L0LBpIMh5OceTKS2qDd7YbmW87sxt+sNdfg2fSV2R4/ochY1FEMdfx0znQMq2wBDVVufx2tCMVdf29CG69aBhiLiPRhpgMOZOaSm7zlpYFCxfmgjxrkcjaP/wYNfMCWLdwQUwkLMjmKYp45XnIcc9UulJoy7F2O1NJ1ZR1GhdgMyZvY52QKBECgsMJm4tRjYXCgUKgCFtdAHRpOgAFtOP6hYX3XuB2iKC4Njix26YXMQyEvv+xSd3rmImWnNbr7yi47A5epEFTqPFSYyB/fz7MRqb+kw5a2eirIlm7TEpzG/7X5ocA6kY5cKiZ6zfAkIpYmdsBwiGy/NZO66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/k/CcQv+PSt84VdEIxVDsTDEyiPCYiKQz6DZKR4O0wU=;
 b=TMDuen5FEkzZcOVsgtmxWSuZla8cX4MRHtmmbgNlPEmbPIEAFQnshSeV5fz5Vr6n93PO5mMAoew6p7joNwQMDuyHgGiReg1OGgwKrUETsCaZppcyaBnPa7nOCQ23GVJowEgFjircGgC+zjvzNPInZTrjgEREMfwyvMOZweG0xN7N8/rP+CF6Eg/D/q50pYAtXOX91gsN7WyrfBmlTnLvHJEoFsmxXL5QbFkNaVJ/9aP47ny3D28LIzNuDyWDuZ+APLb9Q6lZUjAuC5xxUsppyHfEYAaLyenp4adBo6HboWQuiVO5Ae1n+6r60bGOaZ47rTKC+3me7HJ34vciyIPWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/k/CcQv+PSt84VdEIxVDsTDEyiPCYiKQz6DZKR4O0wU=;
 b=eKvTf47pwJqz7Tjw46Kr2CmK0PNTMN3NTxodMlu4U/FDlzTnLGybqHvyasJsG52OdfPnhQ1V2VnZCtSbSALLSudi20lvV/Wum2SGNP2LinbY7NsiS914bPt30h8wJq1tSGEK9xPVM7W8dKVbgD+Z9hfIEllwFRNBnQi6yH/SrHXqK2lQWH6SQtfskl057aKIRbYeyIBRXXckvMpTWEZbdstgGOH12YdAZ/IBAwVJ5hO0uGvLwwkcBgn0Y2LAY6do3rDG8pqks7YQJqTwsSneEq34ZtDN8zwDsxfK7c/kYOF3svIXSqjXdxMfoDFaA0Yz/j8JneL/e6AwHTduywXY/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by DU0PR04MB9671.eurprd04.prod.outlook.com (2603:10a6:10:317::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 02:53:14 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 02:53:14 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Date: Tue, 18 Aug 2026 10:55:44 +0800
Subject: [PATCH] arm64: dts: imx95-15x15-frdm: Move PCIe PERST# and vpcie
 supply to Root Port node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-imx95_frdm_pcie-v1-1-55ccf1822b1e@nxp.com>
X-B4-Tracking: v=1; b=H4sIAK/Jg2oC/x3MQQqAIBBA0avIrBPUyKyrRETpWLPQQiGE6O5Jy
 7f4/4GMiTDDyB5IeFOmM1bIhoE91rgjJ1cNSigtjDScQhm6xScXlssScq/01gthWq0RanUl9FT
 +4zS/7wcx8XRSYQAAAA==
X-Change-ID: 20260818-imx95_frdm_pcie-f26b7008366e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787021754; l=1429;
 i=sherry.sun@nxp.com; s=20260723; h=from:subject:message-id;
 bh=cu6Aag1GWvlogduyxWqYKIxDmp+A1j5oOmUS4Gfx0tc=;
 b=vaOa/FBC1V/wVF9QOpcmYiDliI6OtHLi3aIdg+WJGeWMSgZ0ELok2Vq0T8kQuox/VLPlYk85m
 biLkw1/4GsOD8AWovqsDGQrPGtLC9frQC2NYEwztlElI03rPWgnuE+u
X-Developer-Key: i=sherry.sun@nxp.com; a=ed25519;
 pk=YnYnIFJ2l+5v951x9shBVfHhminNi+3LTfFa3PxSdnI=
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|DU0PR04MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 3185ad1f-c620-44ba-978c-08defcd3d8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|19092799006|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	GQya12u5AdgB/JogQONPDWV4JUwkYW3OVorGkEuU1MopApvif9CAatZDW11K8r3YZpcIkixpat/1kzTOGMRGcNof/MkaBok9AnzfxM3iS6MImvOoLl9R0tPxvwiCedevVWDj4QeIW4dXDANR2iMzqqlmnkNmvKJPUK+rnKTtZQ2UtaCd/xU2uFUcISQ//uhWLsDF3/WukCVyHGHYHMVunbJNkaokpLD/KN8yJckUQv1sAW9kgwkpB3DkeJC2hyJ/yNlehEwI5gpVkmbOS+irf39Gic9A5WgXnvhwYRKiwJU+JuHpnefL8quV4bJa2J3ljxRJ+jOfPi82zoWJsD0rC8XKAgSsL9Yi4EqrYXFm8GEk/QKTLnLlG6Q5JSWfd93C55OpnHGb05qTiPcXB6GKp3HmdKT+7rHzPTOFFXjDldjCx9MCxgKYm9pygH5eEo+Ki5SQBMi+OcUQ/FhsLM6Yxmxd89bLizOWSmTPghp1EBIuwcfzgE3EC/pi0dOBQGbDP6rSajnRpuhRnzztwDxI7NhX3DmTq0o7jUN91f285exh5xPJwGcHbjsmXKkImyaIjWw9XSxPk9FpV2dFtIhQVM/KEDflbWS5yq961o537Kcfn8Me1E+aaLcBmszWZuCTF8AAaAcS0zCSjL5vPB0OQJgTR+OO3SJa1qTAtcdA3iQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(19092799006)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0lqSE1ib1NiU0tydFBTTU8wUk95QmdtN2xZLzQ2QWFQcktBeG85KzVxK2FB?=
 =?utf-8?B?d1BWOUZsZEZuTFlpSllyaXZZclN4T2E4K0luV2FPOTlwQ1l6SFJUTVpkNGt5?=
 =?utf-8?B?dFdwNkovVExKdktoQklMZk9DRWVuUGMwZGJrbmFOSFEwSTJtNG5QRzc2T0lD?=
 =?utf-8?B?MFAwR29la1JMY05qV0xJUFJ2cm9uaURaME9qQXhIR2lndEdQWlhnVVpqanAv?=
 =?utf-8?B?ZUloTFJRbzY2OGYrYmZOdHgwWG9DZjRtYTFCeXRZYUh3VUtGa0lXd1Uvc1M0?=
 =?utf-8?B?R0VxbVpYRkV6VVZBRWtVaUFOREtCT0dxWVk2dEZWTHJOSnZoWEdiMHlZWGJM?=
 =?utf-8?B?Z2o0a1E5bjUvVTI4N1A3emtHNWtodlR3Z1JEK2lCcEhNVWdWc0VVY0d2dnRQ?=
 =?utf-8?B?T0Ezd0NENW91eGdZSW9SUHdIYVd2TUt2SCt2dmtRaTVOMkQ3a2Q2cC9wMXM3?=
 =?utf-8?B?ay9hZ25HQUd3RGdjajc3UmxET21DRGZMV2JzM2VCL0xWNkdkMkl2bFJIbGhl?=
 =?utf-8?B?MjRrY0VKOG9HaDlsTTAvbmtGeUJGSnJFWDFoYzBMeW5uWGovc2xOTWlRVFZj?=
 =?utf-8?B?cHJ0MDNTS3owT1FHZjB1aGhOSjBWN0RvWlhaL3lHM09rVVBodktpTUZyR3Vo?=
 =?utf-8?B?eVBzV2VLOENzN0ZNTU1pNStSSjVlQ1hpUWR5VVVlc3N5UkV2czlyYytQamIx?=
 =?utf-8?B?K1RrWU5yU2w4R2RqOXUxZkpkNk5TTUZnaTZPK0lXZGtsYUlZUiswejBaWW1E?=
 =?utf-8?B?enpOVGdZTS9oWVpnSVN0Zlo2S0xOM2t0WGM1MEE4Z3lPS1VTS0lqYUQ4K0RY?=
 =?utf-8?B?eXhlZ3h1Z0FhMXNaL1F6aXBwUGFoTS9hdFZlcDhVbW9Cczc0Z0VIQld3d3R0?=
 =?utf-8?B?UUtxdjdqZ3IvTkxRTFYwNS9HK1dsMGJZTU1PMGxYVnRIcHpaNHp6b3hqRW9m?=
 =?utf-8?B?cUF0YkZIbUM2VmR2UnB4RnF6TVJsMmdTMUZpMjdSVmVTYURYSFNRL0dBM3Z2?=
 =?utf-8?B?V3ZFY0hlSDJQVlJjdW1Bc1gwb1J0Nm5NUXUvMGpqMy9SV0RVSmlIcjBWSEJQ?=
 =?utf-8?B?N3JNcmJlUEJwdlE3cjUxbklUcDM4WktTQXpBN2NidDk5OWszdDNJWkhBZkVY?=
 =?utf-8?B?S2kzLzhLZWVKd0g3UmRPazU1dHJGd1B2enhxR0hMNVFzM2NMWlB5bVJMd2Er?=
 =?utf-8?B?KzlobkE0cG5NanJlUW1Ra2hkV0FiSmE0T3V4a1ZkazJyYzhha0g2c3lyVmdx?=
 =?utf-8?B?QlJNUSttbmpRWGg2b2pOSVdEbUFpOWZjQmk4NVM4ZEhtaUpTYVVxSzlLYW9n?=
 =?utf-8?B?MW9KNDk1MGJpdjlaeUt0Y0F5WnJzTTUvOC84NHY1REFRdlZMNlArcVpqUmN0?=
 =?utf-8?B?UmNVdUpyZFZWcFp3Yng2aU5wMWc5RHZMU3kvN3hUMGlZVHBUSHMxMFpET2hq?=
 =?utf-8?B?Y0ZlVWhFajZZeFNKaWRuY2JGRHh1UWNnOEk3TGlOUGRqcXY5ckZncDdobWF6?=
 =?utf-8?B?SjFmd3hzZkhXRHlnNkRrdkNabVM5MXRJUW5PNHlEbFFHTHZTenpvaytJRFpx?=
 =?utf-8?B?eFVMMmxERC9tUnBKalBMcWhEZG5hNS92bkxCcmdFVGRFMDlacHQyZGxTc1BB?=
 =?utf-8?B?ZGdBbkJxSnJqVldyU2NwQWVocjRyKzA5RXJKMUt6MDZrWDZibHkvdWZRVXBt?=
 =?utf-8?B?a2Y4S3MyWlByQ095Mmk0OWtwV3YyWFcvV1E0NTJmYlEyUjM2alpFZjliL0tT?=
 =?utf-8?B?Y2VOVG5weHcxTVk0UDdJWnNoRWdYS1BTdmdwVGNndDZVWVhmaVBVbDNDdDBz?=
 =?utf-8?B?cm9CVVlGbTUrcit6Nm1YRVlSS0tWRmhMRFR2VDNYZjN6S1RyaDlacy9iL0tk?=
 =?utf-8?B?VlEwYjlCd24vNU5uZUZ6bHpoaWhvYkxJMXU3NGpEdmpYa2FtUEZUdVRQVHAv?=
 =?utf-8?B?QUdiVnRXYlFSMHRUaTdHWlRsUXZwSXNGT3pKTURFNHBzZDBMODA3QTFrWjJx?=
 =?utf-8?B?MzNPOUtYK1V6RFN6ZUN4VjNyaU94V1IvTXpBSlh0b013M2VCMlc0MmRMNjZF?=
 =?utf-8?B?ck1BZnJ0K2dyZVlEeWU0aXJVbUZ0eHMxOXVkUzB3WFE4SzkydC94OHhrY1ZU?=
 =?utf-8?B?VjFIUDZtbkd5SG1tMXFpYUVURGhrcTVuVXpncndBQkNpbWRDZjU3a2FTMzJE?=
 =?utf-8?B?aVh6MlFwOVoxbkljMVpaZnlzWkIyMGxKU1A2NGxObUttQmI0Q3hrZFlFY1BJ?=
 =?utf-8?B?R2FjVUR5ZTUzZXNTNmtCNXR2Qml4SjlRQVNZRUZhaHhwbWM1UE9oOU1jcHQ5?=
 =?utf-8?B?VFYxUFAwL2paZmlkU3lPbnNFUnRyaUFWZy9lQjd4SnFLczY1VzFYOXNyMlVJ?=
 =?utf-8?Q?KudS7lKzYP4aUxEa6+UG8QiZx9BCgPv4KfURb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3185ad1f-c620-44ba-978c-08defcd3d8e3
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 02:53:14.2126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8s2ACSGyTOnoIRH5MZ/Ic8eloEAjO4dktVzzRbcbCHTeXXuwaKJiTZopGqTBc7UTDiNQPDANKXa4D7PPAMJpoSjujT9YE28rC9PJc3ogOHINaXdnIaPZCuW/aZs74du6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9671

From: Sherry Sun <sherry.sun@nxp.com>

Describing the PCIe PERST# and vpcie supply properties under the Host
Bridge node is now deprecated. Add the PERST# (reset-gpios) and the
power regulator (vpcie3v3-supply) in the pcie0_port0 Root Port node.

Since i.MX95 is the new platform that under development phase, it should
be fine to simply move the PERST# and power supply properties.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..c989b9841af8 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -549,12 +549,15 @@ &netcmix_blk_ctrl {
 &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio5 13 GPIO_ACTIVE_LOW>;
 	supports-clkreq;
-	vpcie-supply = <&reg_m2_mkey_pwr>;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	vpcie3v3-supply = <&reg_m2_mkey_pwr>;
+};
+
 &sai1 {
 	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
 		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,

---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260818-imx95_frdm_pcie-f26b7008366e

Best regards,
-- 
Sherry Sun <sherry.sun@nxp.com>

