Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC9480948
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 21:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374760; cv=fail; b=X6Hh6Zb7qlmCU5Iqr1dTLW1O4xblqfnngkLtjTZGFKYjAngHYesGbSz8qunVCow1JCpFmr2Czo0/2x9xDiJ7xJ9AG9pD02h5BMbNJSa0+JJeEcsIK8uoF/GIYd4CCAf79uZJFuQFX3W9sLwxTsUPsavx8Jv12i/NudhREnDUuco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374760; c=relaxed/simple;
	bh=KBpzRiEPenp71f7UthLDGzKMX8PhiU64D0aKvJkfzg0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ELViCgNBdMjGB4sTGQCsaHtyZ+kG45qUvRRbUj9roZ4i5/nd/qbrChFnaBdK4W7sIsk9/uSpAWrlssLhQh6jDUPHa1Ar3oTPXEHf/I6CVG4OivFAFC/wHiW3x0ilgEyCdVi/OJ3LJVJq39pV1oaNCJM3i0U7QnjaSmZ1S6eimmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rwID/uxS; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rwID/uxS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0e2VhTtDndaa0vv35bsLSciM6Rhy/wdEHWTIbqkXX1qIDbMOuF7U2zR0F6f4/SwOE01PbNubiFkgol/Rvkrbs5l/cms0kH4SrzbmdVerIusmJNpzqcGXvE4RhW7aT9PT3+8XtcrtVdDkZ6nkl43FE+qhr+mWeAsRjDngP0DDTFJ35LujKHT0QXSajLsiZHIoz+Jzb6EnSrw0v2aKW5OjlJ0sxC1nnCNNykRjsdnMfdHe4JIjFuGy4BG3we4P2pExICqAX6wrg5puG89r4VTHRsDA08Ay0JtTlBqDDeSgcOV9K2ikt7QBhSE0XxgcOpHfot6zVCuv+hzyUJYTlgVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgR8oTmMV8yNm23q7EMAgz0xHFdNdFBi/bQiTBIuagY=;
 b=vVlAgumLXNDh6C497gTgEn/nMzhUuerpULpI2xEP49DAbzTKUUene/uD7StVfqET8EuZp8Fh1V1+hgBppgSdka9A22GsRxbGXM0yJtBRJrEao2IfEWPw/o5KRNCyTWHrmLgmX/qhLlN3QM7B1t6utnTfbOHf0AdVkhTcmNoJLwe7LSVrgmSCt//bDouhY0Eq/7jgizQHo1IaQbbayR4UDpaRJyiez4/R19AjOQZNXQj2oyDt25C4VfLBkaPaCG6zRB+5J1gYQfnVCAUr47qLTjbnxm/dtbSU2Y6CBrFTPRnQEiYyCSfZoSi4/zL4jLRqZNSLEL8RdhwU/C5SH2i1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgR8oTmMV8yNm23q7EMAgz0xHFdNdFBi/bQiTBIuagY=;
 b=rwID/uxS2Krwfalmr9u4/nuSZPYUpvRKAxJ4z9ZLDoqznXDvU2iNBpoIVFS4jema1sm3NBsEo5n+/iyltEWJPzwgzmvLUbPBVQhFJG3/KnLFiTVkT6iV98bsjf0dbFVXS8ZDAM13i0ejY/el88j2UV1/SjtXZEuViw+cn/lMje4JtoMeo7alUbxhuUItYc72gs0TvtfSEckHMSn+1TVPFr5QYVoxqDZ86RdgyqRLkjYkOGyUICJgznT3YEjhDJfChOSL5q8GTyUjzYzjv2XLY3WyToo6fOwrdPzgUbY5LYWgBlBH0ZLpfjw4RjKunDZYX/bsCZ4wlgJ/e1VPR/T7lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU6PR04MB11230.eurprd04.prod.outlook.com (2603:10a6:10:5c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 21:52:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 21:52:34 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 06 Jul 2026 17:52:10 -0400
Subject: [PATCH 3/4] arm64: dts: imx8qm-ss-lsio: add lsio mu6,8,8b
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qm_dts-v1-3-14117a48fbdb@nxp.com>
References: <20260706-qm_dts-v1-0-14117a48fbdb@nxp.com>
In-Reply-To: <20260706-qm_dts-v1-0-14117a48fbdb@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374735; l=1467;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=zUJ3qi5qFKzQEOviaElXp7inwi6B85VQGg6bvzMxxQM=;
 b=E1QYKdJB5S1ZDtMMK211bLBn1pnBqMU5QRRGcDUGInf8hF31GaG2A8EIEBtgDYOo7O1cfw//G
 HXzxNaCTOf0Al7A4KZE0tolCFYCc2lttiq0S5n6LpJZmSXDFcwa8jo0
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:806:6e::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU6PR04MB11230:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c41eca3-1574-4e0d-a567-08dedba8e322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WCgf1KVP1E9cEzL5zU7LOM0jp0le8DN68kWltBURPwvTbmyGDYvOj4N4j3kLerRbxN2fTwh5B9AD2IZVTbokDRH8L+Ss+HEmQQT0LWGcNq5eKvbTBl5+yrDLXUrRJq9rSz6oCJpyCVNn3jwBo2gd1gMSU20fxkD1Ggg+IDsn1BW8u8QU9WfOAeXMrysNFJlpZLh66F1ClQiAndgW/zsM/UGMcKwkUbecdjsRzwP5XMnBiBO4GiBReYmM69r0XliGj1JFmbgdrLI5nJtWCUwEodEGMULRap0DSl5EQSKeIlX+r3jazh3/neRS+AdRwvIU4l3eYlGg8VhzS+94sh8uJbsuvIWeD0tTmS+Opxkjm6WSFB6igMdyq/42AdY9rxV6rowA9Yp1akb4KesoGfcujjjTPMiTiMZlIN3mE3BjxoKpnRdygEjLoqDmhsQ8RUYkAw+/2q9d2TUFG4+0p9AxqvpSdMLmCT4EyYmwbjY2Qaqabg+X5ahGjgoNhfv+MvtH0sAgGchIbOw64HQAcO8try6PY2ora1ticRdzD/42ZnlgZ/Q8NfoElbM6ujKsUqxE45HPex1lVdwlYDpKkAU7ufoSiXWwV/xYIT9kVVLN0qQJPhQUWnrmgPTJNCMPpBoiIsfCv7HxBeqTO6BtvwnAVNhc2Ir8v5Xfe5scW+D9Xjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WC9zVktUckZDWTJMaURYa3dhNWkzNkM0a3dZa3RoZHdENUhnS3ZFZUh3ZzN2?=
 =?utf-8?B?WDJTUVBkL01obG94NVFTdC8yRkNDRUYrMytuc21aQk0xS2tpYzV6NkhWUldD?=
 =?utf-8?B?YytCQnUxRjV2SE9LZ0xrREc2WCtsZ3puaXdabG9Hb2N4Rlp4UG1DQ3NOaGtj?=
 =?utf-8?B?Y1MzMVlua1U5SEs5cVhUcDdLc2hsRjc2T2wrUGJTR2h5cDMrQVFxZ3crR0Vz?=
 =?utf-8?B?a3VFbHBNTVBCeWNNVWZrT1ZDYjZ6LzlEWGRQSmFuZ1FzVFpRNmdvckNvTVlE?=
 =?utf-8?B?ZjY3cTM3bDhKVlhKTHIrTFdNL1FHSTRyVjhucEROWFpoTURLc08vWWlONDRE?=
 =?utf-8?B?YTFxOEtKZ05WK2czRC9UZDExZmVGenQ3WjJnbVRZcUlIZi9tN3ZuTFVLckxt?=
 =?utf-8?B?aE5IQ1ljZnFMVTdyOWFHdGp0eHNvQ3lvYUYzOXJTZmFHcnI3WEg5L1ZpUHVQ?=
 =?utf-8?B?ZVpNdy9oYlRzV2ZQb0xMQXFzYTNBZEt2NnpYS1lYdHVrMDF5ajBPeHZ4SW5X?=
 =?utf-8?B?OFFzUXRxZlBtZWduOXo3TG9WczRmdFQzcENTbnhsQlBMTm8rUk9LUHdHNzE1?=
 =?utf-8?B?Y000R0cxdndFOGhnVmord0NuTzRLZnpZOFdGU1B1NUNpUWpxSTlwVFdZM2Ez?=
 =?utf-8?B?YVdib2dwVWV1aDRCOW1yQUdtR09xNUtuOVB3eDh5NzdOckRnVnV0eHhNU2dv?=
 =?utf-8?B?dG9rVmMzUEg3R0tDWXorNmkvUXFxL3dkdnkyUTEyZ1pyVGtkRnRLeEk4emsy?=
 =?utf-8?B?YnNhdnNLSHNWWVJRWDBYaU91REpVTDRFRCtiK044RUNaNHRibWlqV1kwVGFv?=
 =?utf-8?B?MXZVU1d1ZTRpOWtUcktIUEluZkRJTjRidGpKcStQOXBlMlFJc0RYTTZRdEhX?=
 =?utf-8?B?UzZmT2tNQk40WVB2Q3cwZ3hia0xHY3VSYVNOeVk4OUZ5djNGWitoVElMQ0Nq?=
 =?utf-8?B?dWNZMDNrMjRIUm9oSGFzVERZQ3h3OFZ1ajJRQ3ZaYzNFc3YzZVFYZnFHcWRP?=
 =?utf-8?B?MW4xWmxNYWRiTW9QVU5Rbzkwb21KK3U5dnMyNnk4ZUxRdVdKOUdCSWgwYzZn?=
 =?utf-8?B?NWZuTHY3K2NQT3FaaUdZVUtOU2xYbHZOSi9pV3JqU1dBZGM3WHg0aEZxeDhV?=
 =?utf-8?B?K1QwYTF5ZzF1cExBR3NsQkduTkMzZTJycks4bzN2bnhaTVZHT3JhT2lxYnhn?=
 =?utf-8?B?dER3MEpwTzFvN3BBRHJJSXNNL20xY3FtS0kxenZ5aDRXWk5haDA1UmdHZDdi?=
 =?utf-8?B?dDZIRVl5bFAvQlVPQkFxQUlLcEc4R204cHlYMTNNNjl6bTU1NldaRDZ4cFA5?=
 =?utf-8?B?dHdJaXE4SFVzblR3Mjc0WXdDaWM4eEhUclRPbE91dVd5K0dVUXhYTVlqNHJF?=
 =?utf-8?B?YlJZREV1UHZSK3Y4YnBuQ2p2WXJxTm9TeUNNUUM4TjM1MEM4VU8zZUtySVlm?=
 =?utf-8?B?KzJTa09XRVY4QlNmK0tNdmR6eFEzWnh5eEo0aEF3U1VrOGxTaUYvWnMyZkRh?=
 =?utf-8?B?N0E2YjVhV1grMVc1Sjg4Mm82L3ZjZHllUkxEalpmbytoSFg2OEVuS2s4MWd6?=
 =?utf-8?B?aHBycEZZR1VTM3BzWU5OOVlvNXQ3M3l3TTgwUUI4aytsOENlM3dCQzdNNy8y?=
 =?utf-8?B?czB2UDMxK3dGeEpoMkZBT1ZSY0NtMXgvTk1lekFIVHJUVFcyTEhiTGQ4Q3pU?=
 =?utf-8?B?ZFpqSDFIU244K2NQWXVYSGdFbE04dkpvNGgxUTU4QWI2V2hNNFdUZG9ndXR0?=
 =?utf-8?B?cGFDR25WT0FlVE4yNjFROVhUZkFqSmVJeUNTSE5CeFc1d0ZQNGorWjBSTEgw?=
 =?utf-8?B?bFdNRHpzbFB5WWd1dDRYNndHS0VEU3FNL1FZY2hlMlZjcWRDVzNXV3ZNZVpj?=
 =?utf-8?B?OUJYUXN2QVZ0c1ZZK0MvMGdWSHJiYWNYYzFDMFRZQjdKd1BaRWcvM1IyVTc0?=
 =?utf-8?B?OWF0YTN4TXdKenl6YmRkNFhIVFJDTFAzVkRkNEIwb25VbjdIWU83eDl0NjhF?=
 =?utf-8?B?NzBVVDJwZmw2R1NiNGhMd3U2Tnk4akMwUkR1VWQxRzNWVEp0UnpBMjREbU5C?=
 =?utf-8?B?REs0a3FwSjIzcENDc0FrZ2x1ZEFvc0VFM3VsQzRiTXRxTmpPS0dtNzV5bFBR?=
 =?utf-8?B?YWNMTytMaHExN29qSXN1aWxaS3BGRE1jMG9ueHpkci95eVFKRE9YWU9QUHl2?=
 =?utf-8?B?aVFYQnJRL0NOYXVBdWx6TFN4cURPY3RJckg3cHdXZDFWaGd0c1FmVTZMUGNW?=
 =?utf-8?B?OUxtbHJ4V01HOUJGRmd4STVaS2VRZ2RXZmZtNk9JS3owS29xNEFka1Y1ZjVs?=
 =?utf-8?B?NjV6YURJcHZyNHBYVHhxRUViVTJLUWFlM3FkV0NWSkdSbE5yMEhET1JsaVNS?=
 =?utf-8?Q?sEUP6XN+l9a0BbJ4S3uMUYr8qk/0A32bpFMQI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c41eca3-1574-4e0d-a567-08dedba8e322
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 21:52:34.6576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQxlnLkoIwWb79SUDMNPdl9uL40TMdsFN/LhkxT+75IhKfq7RPlFzPS2pe1S31uSe7ukRQ63hnTH2rD2m3wQ59g5FuJE7z/Ps2MwDirrIOKrHGOmKA4LKnld2blV/CYD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11230

From: Frank Li <Frank.Li@nxp.com>

Add mu6,8,8b mailbox nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
index b483134f84d18..fb503c93447d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
@@ -3,6 +3,35 @@
  * Copyright 2019-2020 NXP
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
+&lsio_subsys {
+	lsio_mu6: mailbox@5d210000 {
+		compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+		reg = <0x5d210000 0x10000>;
+		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		power-domains = <&pd IMX_SC_R_MU_6A>;
+	};
+
+	lsio_mu8: mailbox@5d230000 {
+		compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+		reg = <0x5d230000 0x10000>;
+		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		power-domains = <&pd IMX_SC_R_MU_8A>;
+		status = "disabled";
+	};
+
+	lsio_mu8b: mailbox@5d2c0000 {
+		compatible = "fsl,imx8qm-mu", "fsl,imx6sx-mu";
+		reg = <0x5d2c0000 0x10000>;
+		interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <2>;
+		fsl,mu-side-b;
+		power-domains = <&pd IMX_SC_R_MU_8B>;
+		status = "disabled";
+	};
+
+};
 
 &lsio_gpio0 {
 	compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";

-- 
2.43.0

