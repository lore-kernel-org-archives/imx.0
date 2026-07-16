Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010049.outbound.protection.outlook.com [52.101.69.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B1C333439
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 03:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784173690; cv=fail; b=mITGP3xQ1vAccBdIhK38MQCau7NjLosqc80V3uRr3BNwRu9jAFpjzTjSjK0rwrnglYHLCR/w6fwOyFSFLfnnhd9+XPkWmcUSAgYISCYkubNvPtZZBfHOuV+yPx8J4LovgWZU4mztnQzFUf6H1HRdUvlz9RJAVPD1KUN5BUjEFa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784173690; c=relaxed/simple;
	bh=n/gN7rSU61vZob4iQT0MR5dgjxeN+cUHdBCLn82C3MA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dwo4yPWrGb+3x5HT46IzTuIDPDiy1IYXCKzYh41et/D9+w/KOmhU0C0pAHNfN85tPZYcIOOCBGLzNs+4eUHU52ffLOuloRw4GqCeQ2JJHhpoLHcfSkCePRSm5QPfVwdTgPBBGQZep9bBSANYwjvLggUulMB2E0Adgh0XCU8Tk7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F5d4wNY+; arc=fail smtp.client-ip=52.101.69.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F5d4wNY+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZ4ZeWfV7rzdZFLr9yVH8ymrM2ywoNMskTAUx/3swEZqKgvFIbo5A/6QPxWE3KvcCdLn/WmyJBXwBgnGtzHhpSO6eeOjnCt0hLiQIsoHDyrrYiz6oBJU0jnvBzb0FQugbE45QR+KmGrh92qATrjQZFchMfZb77/E9gsahigi0hO5s/b0BKhh3JyBzo3/62D3VBCp2bRjfmPKsdqolxm+YQNftrS9wwOX/iyxsi84Z34OSgna0kdWFmvNOA7X4GpIL3bswmXusnu7fUi/1kJQDiGyWI9gNJBYhxPoGZ21xnoQ5PQihQUkMhgl/xg84T4ytFKSD2ArgoAMyXEALPoD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u03fp0X7kNc320PkRB2DdF+ybpO4bArL10MOX7679pQ=;
 b=OVMMaiJ+Sg0+VBrIfxkxVQA91Z7IBPw2kGIf3qZ4hAYrYaLuA2NmakZlRXpnEW9Hue2FleoO19vsyFqVdLxEvgTI5lbi7VwSauit4bVZyiTAUY6iAra1Yh9Nn33EJADs7zMJ5y8mUVAQpcXwNM4f5VBa8QYZ1/oUwC9YzptCAKS/hJLaKEvfLy4ubxwhA2NrLSBUPF4KburMpQB8fcNbpmnpNaxs/FTKE6uZfkiTs9B1bG0ov1jZ3qxAQi6KOA9VZuENg0YVSWadVEF196OY59ax5IZgRAYRqDYeOO/Yj7zZgJktT9QTOT2xWXm2Ysc3HBjIiZ1Vf72n0AkW0bKvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u03fp0X7kNc320PkRB2DdF+ybpO4bArL10MOX7679pQ=;
 b=F5d4wNY+32JH/PYO9HEK4YjBrkvderKyY6SuxmujuelsCcEFdI+cru3he/2ueLmb64hfvkovTMLZcUg9qhFeJdWz3UVi83/SQuvha6rdg7pLoaLitGdv+iBo2JpqfZffWZYm+WCCYiYVi5JDpYNc0gkKOe1+sDJnN+EfVUMrZTBAvdyjZVVGlLef/mlTxI2z4wQZApJ+1tZ6KoOro6x0Yt/tomJgeM6UGjtpgS1fwwIHaOatesR03LdlBNUqZrUYH5cn0cyGLOw2EItye0tpYqJQ1iB2KBHDAXIlp7dmFaO9XgipNijJSIVtY4PZdxuDpmb2igKBuXTVFcUoo0vrcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 03:48:06 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 03:48:05 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Thu, 16 Jul 2026 11:50:55 +0800
Subject: [PATCH 3/3] arm64: dts: imx8mq-evk: add regulator-off-in-suspend
 for VGEN1/VGEN6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-b4-regulator-pf01-v1-3-8c1519d54bd4@oss.nxp.com>
References: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
In-Reply-To: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0183.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::13) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1cd1d8-2b5a-40d4-d411-08dee2ed0b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|23010399003|1800799024|10067099003|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tg978dgrdys+k+wdaGM64T6ZZM60vkUqRGLZ2KFAGh6dz4u2cBfB5tvuJD6liDVI8f481h/OZNcc/tXKbzyzMUpW5GSdSkhS1ocrUIQRJTeTwIYpo1heq/xj55mXhMoWm7ssooZcZXHK//2PSYWhXG6oVjCPD6MEaSB3N8pf13rgCY/KDGuTxyZgZABrff31OfwRgQMlWEaTCTGui/PrSdKsmhOVZCPJPL4+tX3lG4GWmsFpUF+gDjfprbAicCIIn83QKEKXp9FpgIewqRBNwTSJkQWRzXmdkL+Md8yL0iGHkPm2I0C75fPmKrFjOqV9wRqZFo0ABWBe6yn0R8Os4ZX8pDgjHE35j8GZXiWmAxNT+alcpfZRNo3med8fQKpKt5QoJh/XqkzzITnH7F9r0p6rJ5xRApBjKdD4JiZOf4qOEXRoxcM2d7iPDgmU1OqMZIV6h8/d8o4O5eJ1l21FKZShVx7KaDf+SwSiHOnOaH464VdK9P4Gj5WWDcq/MZMhQ1Ctaf0wgmh6YYcnjudHBU7yxoxS3rK6b7/BC3T++SF76s6/gbfQ8eCrWv0ZpJB2ao38ahEihmgnWt3Xg5b56//1cVNSWaQbh4ImSC2xQiLd6eKRyXtl4YF/pEa2HYVZ+wnGqsYQW7caYGAIdJVQULTE+qPK5ORzc1Qvky5a4k7h3+Wr9vBCwL1pEh9XEqDONlWCB583OLQvee2B8LQX9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmY5RFlsdE1uRS9HbHR5MDUvUDhIRE9mcTVGbGVZblEveWErYkxsOFk3VUVP?=
 =?utf-8?B?MThDRjFHQzdISWprQndQRHdoOTJiWks3ZGJDZHgzRzBqVllWWWhoWkdJN0hu?=
 =?utf-8?B?M2R5cVUwbEN2Z3d3MDZ0NWoxckk0MG4wUHk3MVNlRVN6TkRVcDhyRjhTVUNj?=
 =?utf-8?B?cHZUNG1ZRHAzYWVzNDdaTStHY1htektaUzU3T3VjVXBjKzk2ZG84ODFzL01t?=
 =?utf-8?B?UFJ6aW1XYjJKSkdkaW9yYjNRM3FhZDBHY3J5S2d0eEFCNk13QS9vSlQxYWRH?=
 =?utf-8?B?ekRPd1FMNW5YYVdma0xVM253TzZjV2QzVk90UTdRM3BGWHZ1am42YjY3Y1VG?=
 =?utf-8?B?M0FyeW1OK2xFUW0zam9yV0FjUGtFekFvaU45Yk5SUUFBZHBiQ3l2TThrUDV6?=
 =?utf-8?B?RXowS3NQM1BMc1BIY3R1Yk9IOVpYdVQ0MzJyT1FNdC9aN09Jb3dHQjN1a1B0?=
 =?utf-8?B?bDF5U0d4bERsNXhyRm5YUGlWM0xNeXNUblMzOVVkVktjUThSNi9qeCtEaUlm?=
 =?utf-8?B?aDNOaFJ0OG9HOFBqeGN6cng2QTFlSm5rNHhMSGhMc2xwZW12Z1BRNnhpbUhM?=
 =?utf-8?B?QkJrd24xUHE4V2xxajcxRENzdnc2eXFydVN2RGVBN0hZcHdYMFhQSXFUcTdS?=
 =?utf-8?B?R2t6N0VQWU9BMDJ1N3Z6L0lrcFFrUlJOb1RYZ2llUE5GMjZEZXdXa2lzY21m?=
 =?utf-8?B?RXRGVmcyMXFiZzZmcjBIZjFqc1pZSEwwS0h2SlNyTFNSWk10NUZ6MHY4d2J1?=
 =?utf-8?B?M2tmTjRYUXBHUTR1MnYwekRUMXc1OFIraGM4UHllbjNHdk1DcEJrOXdPZFpK?=
 =?utf-8?B?MWZPdU1yMkJEc2o2SlRJOXRkTktJUHZ4a2dFRUVXSEJoSHlhMUVnaGJWdTUx?=
 =?utf-8?B?ZktlcEJnajRSYjJPNU81S3VzRlNCMkM3WWJKb29DNU8vMW9RYkdEVmpxQ0sv?=
 =?utf-8?B?L1R1SUxFbnVoNGYrSjVxdFUyQno5UWZGbkVZRlRaZkxrd3BCTlFhNE9FM0Q5?=
 =?utf-8?B?dkRzNEF1RFJLblRlNlpOTE1iT3hBbklYcmYxSkc3VStBQ04wZVZhQ2UzR2gy?=
 =?utf-8?B?RGlwb0d0MGpxNkQxU0I2dThMbnp2N0RvUGw0WFNKWFJPM2JBM1lGM2M4TW1y?=
 =?utf-8?B?aWsvdEhoQjhiSnAvNDliQUpBOGJ2bTdLeCtoOEgyZkR5UE8yS3JpNUN3ME5U?=
 =?utf-8?B?R2xHNVIwaWNnRUNMOW8yN3FDWXl0UlROQVNURllPSHozOW1mNy92STYwb01r?=
 =?utf-8?B?RjdSRGVhREJENXRNRjZnVkNvSEozeUhrRUI3dENyb09QOE9JM01LQWpobTJi?=
 =?utf-8?B?bGtEckFqT01ZLzNmS0w0bkZxZVpRbzkxWWdxeWlMdmhxYSsvYzk3elNkMDBk?=
 =?utf-8?B?RHg2NGpjcGVjMGV0VkpnTkxDYlJOUCtvclJPSVhSSkVqS1gxQWhCNjk4bkhi?=
 =?utf-8?B?d2JQR0VYY2xKYlpHTEdSV2ZTZlAzQ0ZJV2t2eUhQUnlkK0JnRVZZcVpxc1hR?=
 =?utf-8?B?dGNhUURmaUVpa0hhZUlZTW9KeHlIRnlmVXgwUzYwNWhLU3E3a25yWnpSQXlm?=
 =?utf-8?B?eGFuVkhFcXpqVkNmTkptOWo3dHZ0em80dUVJMXpjaEJxbDR5T1lUWFhEOS9k?=
 =?utf-8?B?MnZWLzRKamdQY2FpL1h1RFBEVEVzVktPUzFYSUtteFJ6Q0kzOUJJUzVkaXUx?=
 =?utf-8?B?VzNrenR1eEVLQit5cHJnUDRpaU4yYmlPUGJNYnFRdDVSWDZWV3BmTDU3RTJC?=
 =?utf-8?B?SWhldzZ4eUx1OVFOUUplYjF5eFdTVzBCOFJwQStTRDNFYm5xbTBDd1ZyM1Jp?=
 =?utf-8?B?VitINENRM2tQaHZzckFUVUlvZzY3aTVJRTVwTWFSSE9hdXVJVWFsa2h5WUdH?=
 =?utf-8?B?QTFvMXNTdk10ZzlLS2lwdTBwNnJtK2pHYS9GOFJWMDBEbitsK2pxbC81dkQw?=
 =?utf-8?B?N1pmTXg0TTJaK1RCOWRIL1IxMGptNS9weC9FWmg3ckt4TmZHVjZhQ0NEMnQ1?=
 =?utf-8?B?OWFDeDlOc1o1OFd2S1BGYktUdzBpNmJsNkdyOWxacVJJM2lrejZlQXRHanBS?=
 =?utf-8?B?Z0Z4azFwRjRDd3BhajFKeHRPSHlJRnQrSGNpcHJINitOczRrQkNMQXpZN2U0?=
 =?utf-8?B?cG12VVFvbnZwTXZJeTZnUTJudi92Q3JNcHNuQWliendBUHc3VTFkQ0VOOVhq?=
 =?utf-8?B?ZktKQ3dXQVppODR3SEFQNEdkbDBiNmZrT29KeW1TZHNMNno0U2RjSndWRGRl?=
 =?utf-8?B?RlJwczZiUnNLdm9XUmRacGxMeWthZW9TcmgxY29WdkNya1l5aHMrSUZwdHNQ?=
 =?utf-8?B?LzJkWjkvWHkwTlJNL0grNVhsbktmN0RWRU12WUpNNzVjcFdRaUkzeEk0TGZT?=
 =?utf-8?Q?XogjvnD+AzDmSKblqOjX54/HAPS5bI3IBNXOa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1cd1d8-2b5a-40d4-d411-08dee2ed0b36
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 03:48:05.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgoPD3/KerDL3+ka/aFjxU4Rss6P82ZfEpthBdyZBmCOidp6JxnvXLXnX96VZ6i5pmLjuwNPT5U3/K/uLM0prXElARDf9qMzEYYi4I8ntK7AX/EqA8BtV6Bifi+899AY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

VGEN1 and VGEN6 have no consumers and are not always-on, causing the
regulator cleanup work to race with PM suspend. Mark them as
regulator-off-in-suspend to disable them properly during suspend and
reduce power consumption.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index 5ea04703ddd7..fc0303e44433 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -299,6 +299,9 @@ vref_reg: vrefddr {
 			vgen1_reg: vgen1 {
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1550000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			vgen2_reg: vgen2 {
@@ -328,6 +331,9 @@ vgen5_reg: vgen5 {
 			vgen6_reg: vgen6 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 		};
 	};

-- 
2.34.1

