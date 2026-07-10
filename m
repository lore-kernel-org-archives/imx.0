Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B280534E762
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678142; cv=fail; b=blSb3lrje9/eUSPkib76dWZZFIJIhkj+O0aGZmMc3sBkFmIk5/5hRVBD0E0H0G2HVdyAACIJNCd1t74XHeWjiI8bEDX76hsgdSZlojR0I9XbBq5U2ATGJ/7+44V/+sfgk1SSUviPFr/EeSfXPlQVW+LDe4hhFsoTGO4DZeR8piM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678142; c=relaxed/simple;
	bh=jI7LKP4SiuaovJsJTO0beFGv2Jk9lJuY+wFUhKe3DTI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=eceH7z4ZRnzcIbTwxjXe4BieL5+a4MkYJm6zAw/WhGVAtspOH6e2Hzc7kwXOITwykW4tkLCTAu4Rgv8Nai4/Wkmod1XG58jPCMgAvPNyEL5gDA6ulRvuHQiFYk2uiLoQ9hSkDzBKZy9YWVMXLrzZrOP8aAEDD/E56tBNIGzs0p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QbTsKMwf; arc=fail smtp.client-ip=40.107.162.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QbTsKMwf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWhkjwDbiAVYr12bBtlJCDcdVW/bkzANIixkZSxrYmMVPKZIK6ULqb7Ht3KHFVvoFoCuXOV0RkbZ/xmuWTgJkGc+cbHva7byl7jX2kyeu9HStYQi3eLuBRJxtiIm8crRcPwoceb1w/0BuVVoTT1XGVQdk8dcAVcJHhyAHfJOfp4i0Gm37t3gdKyn/UBWcVWf8p5JTjORTNDQkImW9ythjP8v6UguUD4bndDTJ1LpGliS+Ke49szIfEu9gd6PAbi4FhsjP1ikg8qanJCh3BnASABLxX1pe3PInfg/Kt4lbKtUCwz0eSFNkYOmoGSWYU7MovGc+TiNU9AaWVnzsuhyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4KWrzr+YWD0/ZwxErTj48n5Bz6Sdq2e6ah0W6DJcDQ=;
 b=lmwb0yZ/IZWqCMcvR09iyQQg44ZeSlu/2wY6lxNjeUW5XqhNh4JxyqZ1w6tIkZJuzugJIXy3r7Xbg2DR0kpRAIzBxluphK0KPKHylAImLco9Pa9BlOS3ZCEF2fMe8P86ooru9akXYgZHp5uaPthS8sWES/BuT9N33U1RV+WG/G/VqMFUurXzjJ9JqkQAXZrZVV7UcDvhMy9ydTquFSAbkMse2xvhb30HyJFfvSc+6DVlX8fbG605H/opgqSWKuEyz8ZjqZdlqqaPBOt7Vpq6UyvqakPf5nP/3F8Zyf0mN5rCs6rFoyaXlwQOvErnHofUlSE4b21P2MpWlppvNfCeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4KWrzr+YWD0/ZwxErTj48n5Bz6Sdq2e6ah0W6DJcDQ=;
 b=QbTsKMwf+smf+IDDSoTT2E4NLBnJImyXLGz5dRGNQeFtcBubxjjw0uBsjQN2ss2SutzwC1Tnj81ZGaYHbNgF66CsGkFlEF3TlnyGPQyJw7cx1kFEAo3UTdYmSPKVyiERBedAEbYGBfAnNumqJTgM2bCvoKf0JAL4QvwBMiegkcKG0os6nrXQBX4AAFstXYdyB/IK7nDZ9q7uOg2VVtkTduHvLmwePzaSuN1vU0e+uzt7bAN9645E4jPX1g6DIm2vrx2zI+7Z6bqFBAjy18Ploy3bzztEp5f862i0T2ORtVQU8j74G9kZ1CkEBmSuQ0ZlAnpkVo0D0YQygXQZJdI7Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by AM0PR04MB6913.eurprd04.prod.outlook.com
 (2603:10a6:208:184::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 10:08:57 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 10:08:57 +0000
From: haibo.chen@oss.nxp.com
Date: Fri, 10 Jul 2026 18:12:20 +0800
Subject: [PATCH] arm64: dts: imx91-9x9-qsb: add CAN support overlay file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-dts-imx91-can1-v1-1-c78c9c378e8d@nxp.com>
X-B4-Tracking: v=1; b=H4sIAIPFUGoC/x3MQQqAIBBA0avErBtwBJO6SrQonWoWWWhEIN49a
 fkW/2dIHIUTDE2GyI8kOUMFtQ24fQ4bo/hq0Ep3ypJCfyeU4+0J3RwIF2vM6h2RZ4IaXZFXef/
 hOJXyAZ1Twj9gAAAA
X-Change-ID: 20260710-dts-imx91-can1-b755fdc11de1
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783678347; l=3012;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=r4IWS/ej2uTzP7UmQATCdKNsUV3K63QpDrRvgdypHkE=;
 b=0kFOhTLrdmZ1fz8CfAR3kFS1ZIscCvgwRlepWJuLempnuNclB6xvORdpP68A5tcQ+fQao1Y/l
 OIiQgHvwGQpCr5/nvAwpczhiTo9PV9ejB8e3HCbSZUp8qPLju/y8DU9
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: MA5PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::18) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|AM0PR04MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c438d0-876d-4e8e-c718-08dede6b4125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	I5n3K+nKDOfnwxHuY7uU1mRNRaadJJo1/HP138+YnWXeJLyVzWE6SjexCpu3mmSmvM9M3TAUYvtxor96P3KGGqDBpv+MzLhZQzWeOdf/b3Y/n6QviB5sh9yE2Xudp7EYwys5l6zQhrTvJkO13IqwDgNuKOpl7Q5s+48H85okTjjpV0+qIE0XHueE6HPzLKlVEX7DmK3AQ17ySitmI1pnj69dt14C0A2p1gtKCCclWaXjFriY2vFzl4RQOvvkVjcVZcl8KD2S7qjBsX6OtIYrPCjaV7Skw+uWryKiKIhlsT2BoFIUdY0OypcZ8EsJrLyNEttnjFNJF6/KDlnuUupkWcFsMPTllNw5l9kIW8BFdNZYszOyqSTN8e7VtLOAHsJP2aiCif2dlzsK934jI+CoRWF8Y51bBFGuoR1+FXR3kQ+sQisnmwJPydc+P0M37ZD5gCdrTfYYSQMKkhgVo7V7TahJx9jeca6EjPbckmUNX1ZPCNeiX9dJIoXZoJWxiYFiw269RXyUrWLyvGZip/dbpoYN9a7xnUCUsujH3YBwR30JK9hhakZUARjL+T8aprNt3H/JZ62KyXewG4pEyBFga2qEtXjP2ShifNAafCqPpBpJmZ4D/xP0pDy0/Hd9U8p/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekJxM3ZpbXlkWFp3SlluMUNNdCt5ZnRzWFhVV1JSaThSd0plR0JXZkFwdTlp?=
 =?utf-8?B?OWZqTWE1cTMrR2M0UDZad1o3V3M2Y0E4azBnVFZHNTlKcGZWS2ozM0hENlB3?=
 =?utf-8?B?TUdnOWhCMjlaN1ZNTmVrQTdXR3hBa1owV2Q4QVV0dEJPakFhWGlJeWxlRFdo?=
 =?utf-8?B?QUhjUjdkdVBLYzJrMU9hcUhMbFdTVXh3Y3JNN0dzd3gzS1E0WkZneDV0MHNE?=
 =?utf-8?B?bUhnd2g3aDYxaUp1WW9CbjBLY1hRSEpuVXZWZllmNld2Z2MrQVhrSG1mcTdm?=
 =?utf-8?B?a3ZLMlZxNVVHNlY1MGUzYUMxNVVMTUdFRU8vMzNqQzFEU2NYZGtPMWJLMk91?=
 =?utf-8?B?aUhTYUw3bHh3Y1dYSk1pN1YxTUpWbXhDYk1NOWwwSkJnQ05WdzRDTXRDKytU?=
 =?utf-8?B?aUlLMDVwQkpCekRmakNzd0FmQWlHWitnS1VmNkhSeFRDeEhHbFRmWXdyTEFM?=
 =?utf-8?B?WDc0eTU0d01WL2lCTU5lMlFIZGM3azRKVTRPMm9rSFNGbnlHRlp5R2xHd21U?=
 =?utf-8?B?R09SYXdVcUVwOGNhaEh1NTNKNmNXTWJXS2NFRUdlSFBQNElrU1NXTDgzV3lS?=
 =?utf-8?B?c1FvVGR5TDNaeGpua0JZMVZNeHpHdjBQMUpZenkxTS8wZTgvUzFjSTIrZ1dQ?=
 =?utf-8?B?RE4wcWxWenUxeXlERW8wSmJ5TlpCMHdxUUdVOHdsQ09QbTZ1THlxZlp1M2do?=
 =?utf-8?B?TDFlUmRCUUVvUjZwV013dmt2S1ZQVFo5d1llK2JiQmYvc2UzL2RsMmNFRWlx?=
 =?utf-8?B?WG15b2w1VXBtU016bSt4ckRDQ01xRW9DY2F0VnUrSzgxZjZBN2pmNWMyOUdH?=
 =?utf-8?B?TUp0SWdnR2hETVVIMzBidHI2Z0FzQ2h5eU12Q3NnRFlOWVhaeDRoS3d5QUFP?=
 =?utf-8?B?ZnB5d1poY3AvSWd4VlZtMjlGNjl0a3Z3TFBlSHNUK0dGTnFyQnhOb3NDVWxD?=
 =?utf-8?B?Z0s0MGd1Nk5aUVJXbzhmbWgwRVlOYmdkVEtTWnBSMW0zWHdFOWkreXlYVHJM?=
 =?utf-8?B?WmhjS1pnZXlZSHV4QzJ5MDFlWUZMSnU1TFhxZlA5SmovdG1od0w0UVJmd2tC?=
 =?utf-8?B?ZlhNZXRoMStWdGhNY1BzeFlFRE90QTJMNFJVcFZQZWhDb1VkZ0VZZEJPOGxy?=
 =?utf-8?B?RTBjYThQOVRkdXFBYi9PNzVFY2srSjc5UkhKYjlxOStUTTVyNjkxUGxZTXpi?=
 =?utf-8?B?TXJnVUNPMCtKUUhVTGZKWkRhcFVHSzdReWtuNWhaeHVHQ29kQStFMzJyZXJX?=
 =?utf-8?B?ZFpwbzRKWW1EMnlVa0ZQL0dpa1VNOTFRbG85dE1Va3JkeSs2OElCbC9JN2Nr?=
 =?utf-8?B?OFltb1dnSDBsUk9RM2ZjeXppZDlxVDdmTkFvN1BhVWV5ZEZ6dzRIZXF4M1JF?=
 =?utf-8?B?b0Rsa1dYYnJRNHhrNkNGK3hjS3NWRWRFWHhja2UwaHE1ZTFpa2RsZWZicDNU?=
 =?utf-8?B?UGxKMk4wUUNWQUlBU3RpWG8vdTJqK3J0NjEvMFQraDIwNjcyZHd1NjRtZGdY?=
 =?utf-8?B?bEJxSU14QTRBbFp1U2ZIdDFpc2c1MTE5MEIvalN6SWVEUUdWRGpNY04ybW9T?=
 =?utf-8?B?UmxIbCtnYWlNajl5Z0ZDYW1FOHd3bjJZd0NZTUwvbGcvRC8xV3cyUGlGZzMw?=
 =?utf-8?B?RkVLVUJVRmFrVUJ6bFJpcXVsNHdNNTJhZE0zUEZwUlIvZklsOUg0a3ZOREtK?=
 =?utf-8?B?aElmVUJOdmxacCtXODEwcjR5Y2oreXI1cUx2VGR5QzV1cXFEREFXYVJUTSt1?=
 =?utf-8?B?SVQ0Vy95Z09ETnNBWHpVbElkc1JwNEJ2dXB1Q1BVRmdMR1NReVFhb1QrZFJY?=
 =?utf-8?B?aWZXazNZcnNYWGh4eFcvdldhYVlzR1Y3ZTJ0T2hnaDc5VDJvRmtpZzU2dVVM?=
 =?utf-8?B?RG5RQ0hrMTNGK3lMT3FldXNQbHBpVkxIaUZPZzJiNHNjejJnYi80Rm5zaHhG?=
 =?utf-8?B?THpDbDdRNUo3VnRZQjdoTW91TmZWMWMvWjlBTXpUODJIaXJCTDJDVzBUbmQx?=
 =?utf-8?B?SWEwUVV2bDVmVWNad3NNUy9ueDZRY1BJVmx5WnhQZjRFNXhKYlZEdDF1UFN5?=
 =?utf-8?B?TS81SWlVenNTbUxiTDNNWUFla2pJakJ2RDJ0NTVEenVCWHBLTnEvelVWc3dp?=
 =?utf-8?B?aUhJeHg1UUdwTEJTckJZVUg0bld6VWxDTU1lZTBhYnhvNnRIcHFKNkt1dXhP?=
 =?utf-8?B?eDZ0NVV5VGxZYS95c1p1ajlvM0hVOTc2WjV3VE81ZlBENnkyK0ZEc2pGZzFm?=
 =?utf-8?B?cndxWUZUL3JiNEgrTGx6MHJ4end0aDNmTkNYMmtVRzZaZmg3YmpLUEpLRUdG?=
 =?utf-8?B?TWhVcGJIOUF5QnEyNDU2cFYvSXduYnpSMXcyamJia3A1ZmR5aUNieDFSQjZL?=
 =?utf-8?Q?f5kEExHFxuQUpo0gskmtQiduZzTazFim2w3bC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c438d0-876d-4e8e-c718-08dede6b4125
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 10:08:57.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53e6WWC2KwT2z2ouqf9ExojEVYDULzDTo7xfZ0YMySrndBx3tjawLpD75xa6ir5RRIk9gcMZFsq+2yNXBC5hX2f1dlFsFGgiSSHmeZgdXb8Oycn/DRJUr7rW7yZFGb9C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6913

From: Haibo Chen <haibo.chen@nxp.com>

On the i.MX91 9x9 QSB, CAN1 and MICFIL share pins. A TMUX1574RSVR
analog mux controls the routing: when SEL is driven high, CAN1 is
selected; when SEL is driven low, MICFIL is selected. By default,
SEL is kept low.

To enable CAN1, SEL must be driven high. This is done via the can_fun
function defined in the pinctrl-gpiomux node. CAN1 uses the
TJA1057GT/3 PHY.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
This patch is based on the following patch set:
https://lore.kernel.org/imx/20260710024204.3462444-1-chancel.liu@oss.nxp.com/T/#t
---
 arch/arm64/boot/dts/freescale/Makefile             |  2 +
 .../boot/dts/freescale/imx91-9x9-qsb-can1.dtso     | 48 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 01d4ddfde0989a2f1ae0ac33d236fe1e2b1c970d..37d158c2de88572e2753ccf9ec518d27cbe8d492 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -577,7 +577,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 
+imx91-9x9-qsb-can1-dtbs += imx91-9x9-qsb.dtb imx91-9x9-qsb-can1.dtbo
 imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-segin-peb-av-18.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb-can1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtso b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..b8343d653e511244c838a2a7add8a8d74398f8a2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtso
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx91-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	flexcan_phy: can-phy {
+		compatible = "nxp,tja1057";
+		#phy-cells = <0>;
+		max-bitrate = <5000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_flexcan_phy>;
+		silent-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&flexcan1 {
+	phys = <&flexcan_phy>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>, <&can_fun>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_flexcan_phy: flexcanphygrp {
+		fsl,pins = <
+			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10	0x31e
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX91_PAD_PDM_CLK__CAN1_TX		0x139e
+			MX91_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
+		>;
+	};
+};
+
+/* micfil uses PDM port A pins, conflicts with can1 */
+&micfil {
+	status = "disabled";
+};

---
base-commit: b9fff21cbd480f47f04debbce6c14f48dd715f0a
change-id: 20260710-dts-imx91-can1-b755fdc11de1

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

