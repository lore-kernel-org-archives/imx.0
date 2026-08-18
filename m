Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEFC3CDBAB
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022285; cv=fail; b=FPGr4p1TXcExfpKhMNH/v/M2OOXuUwfdXX8IWHQLRx/wc/HlI9qEBDSfAaibSG/E+PXxrGFC98nmSSk7uW8z+qvNvsLT4sP3bnHt1A719IS/DMGeFBD34xmvmmIBXaO2DZtWXjVZ+8CvpjfHP7+IP5cOzfZcwAiAi6Ukt3IpaJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022285; c=relaxed/simple;
	bh=2NF7dVALFfkdpXYVuPhcvzEPiKmmbFvlEw00g0Z5G1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F5O5nL9nfprfl1ikZ9AN78X/zDVNEE7qlY7gHgjn/CIFSNPM6Wv7fFYEowQuDFVOatmKORwgocfMxUsZ2xFYKGQtxWU5O16c5uZ3nGNtPbkxB/CLsql2IQGW5hbx/6nFx+HlwX04xiFilcCzdw5s6vyk2cOgfcDgUPTvZH86Y5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x1/fVmth; arc=fail smtp.client-ip=52.101.65.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x1/fVmth"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gq7Kde7YHQ++XoMJPiQV1DxjXQwxaoPlMuWbCYgMB7M+sME3fu/JxmlOKQbrn/3bggJy8cBUUBef5aXIhyc/E5xOUYwos3LLRlodjaSd28qKcSM/GBSntQ4+jpWj0Lqtyf1XayjiAZ+kn5OGkzq3/7MWeygslwh9j4ciOrABtzKDsLKAVJ/re74YDkzqY3fWf8m3SzOfFgq728d69ZSbFgqEsTF3dk8Zyj0fkvgFhj4Eq9B9FC8CTQ13PNj/hTnUDXLZ/uTH52M4tlUBX86Eg/CW31IN4YQQG5SoUKwn+t5B5ABH1HY5r76lKnQSTxd/mYXiVz0+QonOB8Kytv7dyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QV1w6JgoT7yhJICwHza5ck3sO8BNWUeJrkeOfXwOHSw=;
 b=KfRO+iG4s1HTL1mmiToDJs7Ffp2Sc/0BVZFMPDhsCcjpbQRYlFlqaZ3g+sfrgsD1wpnmWaXVZKvk3unhtcWeYjGeaCUYKeKxQdlXSOORSnlsEYyPnUIKqoOI8lHlXmWUo7Ve117Roy720kTF4IiuUIUAlQQifwd9RCQ4idOsjoZqC5COrrtpTS9zt+IiMbVThjE0hAoIPRJzf7eFI28AJDoDI94ejaQAeUQv3UMg0rPEmImQsO3XSNV/Uny9uXMScAW0oZNtOVJO0GKQnH6P32rN6raOgxAVxPq7obRUxH774S+Yn8DdxZhD2pORC7gMFllP34oqR3mkmgUksqmWbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QV1w6JgoT7yhJICwHza5ck3sO8BNWUeJrkeOfXwOHSw=;
 b=x1/fVmthMFzWR2Ivxn/JU4Ry3sephnEWR8uNF1Cvv75xnmAmLXXvIftKOdCYVE5CdStT1seURIhU4PbUg9I3qSei11vnncHrdtjyBHVKUe7Y41FMP4YHE9oh3gjOBj9YOLgBxgkGIfxvULH/2tpgJqV23z+POWDfddzzO4SfRiDz1j2cdjmo8iG+tg5wD5dgB+f8gIVyer431nvXZyQswDjB9In3OjbJx2myIYoL2hdPT+qtlA3fw/ohjabODjEhS+zlDzRDEsJJYvP3JKNFCJvuz8+jX1/2ilHX3ltX+y4xEc+qp7ls1i5bvDxMWvveH3twiJIhkR1/I/9Rn5KdUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VI1PR04MB6829.eurprd04.prod.outlook.com
 (2603:10a6:803:13b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 03:04:12 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:04:12 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/17] arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms
Date: Tue, 18 Aug 2026 12:02:11 +0900
Message-ID: <20260818030211.3141710-18-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0042.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VI1PR04MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: e71de3eb-b906-44f4-778e-08defcd560d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|19092799006|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DHJQastbRZVEOTOK8hEH6fa7VfmlXfaKb4VkGxf9SuqN4zWtjsOE+cQpBkA1kWojXfZr5XfP90zfe7oLQbNec2dgtfofzXLnQ+BEfy+rm+Osq4SMNcYqZh/jt2rZ4U5BC96bdzW2JR9WWRp82TipjHZDWZNfjk3hhc58zLF8k0jPWzXr2IuDAMdnRc3zc0MS7D1n5bsC4SrmwlDAd2/BpZH0HIofxiLLnEAF9qDoyTPnaeADlaVvQdurw6ftORvWN6uxqajb2khzKqqUzOym918S7SCjUMCFHYEJbrvE4Zv1UskG5FT8yRQMWORbRYTC6ZeZiyV9TOiyWWOzTc5trNk30kBP6adCGiypiLSHSCaaB7HWp2xTlLcZge0KTE46/T+Yc/m4JksWkUcXBYEEntxeDruVQTi/ujhTz8hbyXDy8oukt7X3yilgaE4ZpKjEwEsb0GnAf2cbSLceqqhSjfkLkezEKCC5Vr3hZOZZ8A8FnI1wi4QNpSzmiZnUwU4yYEaGEkjPDPKyjfgfLqpsOdoByhs5rc5rya+EGeFt27+OBWc5a2yRNP7Ph+noD1kcasUeLlJUZ3emsdG/Uxhv7daLcL6S/nmLKpqGZW2LyueDUvXjV55P3HOB0zqQoQvibjqPnYFC0J1eJAhxZP65EjbfUzOXSBQeWgoKegchzCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(19092799006)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z1YDGLDocCWXoCcnq5mdIh7Frnp7bfhIMeWuwAZMliSYOEDV4HvG7jJPu5Hc?=
 =?us-ascii?Q?pdjvzYGwnCckxy7n1tWze7xGs+Q9JlZH9ZOsWXEQGvrCDCJUgT/0RnMl7NEf?=
 =?us-ascii?Q?KkHGeWs1Oy87YB5xNZ4L5RlB7fopmbfbmed2vpBr6FOdOlFY9ydboxWFBXVM?=
 =?us-ascii?Q?TtYy/dAhnJvcqDLSZ51t4quA4eZwjqMDTcet7lV/C4jKh9UVy5JxG+oRP3/M?=
 =?us-ascii?Q?vaKj2ivaSN0kkd0CWHJGj6GwLfUkvqQdTqJ31ccIOdTtt+pZc29Cx+KGm1kC?=
 =?us-ascii?Q?YWvWrMoB0WOGkNwltJ9fL7YmzqC6vTGar6GUmOqPrpJgVojypGgesuyOYgxp?=
 =?us-ascii?Q?f1p9KlKYNXafK8OoPHYBqy2Cb2cUijc2ZsHv63R1r6vMZzMsOXXZ/6Gxl3q2?=
 =?us-ascii?Q?vjOkNUIZfAxc3URodXKemNnL6ymiDBhDqNQR/kAXH0i82bHsSP/mR4xIBUpi?=
 =?us-ascii?Q?+M0BaZTqU0jSn99t86ts51QlYOwHIegio9m4vxeCRdQranm9SHpTgJ3MIa9d?=
 =?us-ascii?Q?e3uuW6UGjrcu9jFxEFwHDVUp0MkFgXWHbOEGaYvGoSSO4+xd6L0xDfsro1u1?=
 =?us-ascii?Q?1ziXGi6vs4tnZtCvTQiXhdAtH7Q0+HFfvwQTQTFTlOSRZYKtb7dKarHBkKSU?=
 =?us-ascii?Q?xwPvAgDvnIpW8VryyZ7yQJfH4veT9SRDrQaC2Lxl0Aw/rtdWLW9YDQLozokA?=
 =?us-ascii?Q?eOW0LpU7lHtYKfoT9xtoYizJkAXA2z1ajWqF2W3o9dw8FXZN1J5QcmTzCzej?=
 =?us-ascii?Q?XZM2groApBGcHV+gtfljMEO5AklLusePPepLu9dceYIEiB1nJjJtd7PEKMnB?=
 =?us-ascii?Q?np9855XOI9JOSC3ntcuoXfxqwcErwXL+US9iNRxDyRlPxcP+G+iNoFzh+fcV?=
 =?us-ascii?Q?syMq+dZs/NQcE6ycmAOiuixlNxfkdgtJDDyxoHLQMU+zcJZ/ajmtbAwZ20LH?=
 =?us-ascii?Q?v2SyLR5GEPXPZDkJVlx792WwMZ9n6GPPjxdSjOYwO5b4k6eEZ4adXU5p8Pn6?=
 =?us-ascii?Q?J2P4VzBs1/wyNaBQl21am2bYWQgX30FJRSgY5KGFUkRAQYGrIZYFfAR2kPvq?=
 =?us-ascii?Q?HfhJV4iaJMkj5cBb9RhYL9ZH6XM4sBy0jOpTyvtpbACM7kPDb9PgXUcjJ2Yb?=
 =?us-ascii?Q?ORrS/KzsB5Lbg4C/y3AWGEUgIOtm0AW8Aee4Kt2wUkIR0MrB9XSBvNyHpUDS?=
 =?us-ascii?Q?hftBbH7RIld7gDmIfdt8N2NGrzej3NSYJtVXFscdiH1QBK3iCVhKYZz0j8KX?=
 =?us-ascii?Q?t0t15PFlO3XURvWOm8tHCZHjFLhg5pwuunZoBQyBxeOZyBqgf9vsX74006P3?=
 =?us-ascii?Q?7ZkL5upVqD5icP9h/LiOm+lof0ZqH9PrF9TRamsGxxeteyV2subHwaCgY8A1?=
 =?us-ascii?Q?8VKjV7ogjt3wulS7Vy9zi7lGe10JmpysgP0xdf3CzSwAGU8uqerZ06N9egSr?=
 =?us-ascii?Q?tUpDv+P33O6+Qx4S4x8/ns/mCcff2kjM6neOVcB3OMVJfressH2Vqn6/iqgB?=
 =?us-ascii?Q?BXuiekWg7Ts9++rU7sO2pLEubJP95Pfa2StJ0U5q/aLyM+cdtWhpwRkbgafw?=
 =?us-ascii?Q?6b/xD9L30GB64DqWhlliMJsmFK1y16l1EwaVvsJo8s1pORiyQD0u9sPrP6xk?=
 =?us-ascii?Q?2754ckFAcZ4UYMHVkxdVTrlCX43TQh/eib7AJrxW3JEz4O8Dn+P1p1QHiAnX?=
 =?us-ascii?Q?x4zsxpSTYJMlUn96N03ov+0U5OZj/P4wG/bdbSrIt1jW0Nk3YKqWfZdxpnW3?=
 =?us-ascii?Q?cpcuHPxHMHZTQy+f4gW1l4KiVPtnglAZuY+bIBElWRoTuWs9GF62?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e71de3eb-b906-44f4-778e-08defcd560d2
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:04:11.9560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BAbO1ZoRo9CADEoOB3EN0Mzw51kO7rbcBFP6lsaihUFfG77PW6C2xIevuK81JD9m1uk4OYkD8K6oASK56jK4kD/vjYM0tnD7NR19NdfyzN4K0q8vDGANjLg14nZkiOr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6829

From: Chancel Liu <chancel.liu@nxp.com>

Add a common DT overlay to support MQS sound cards on i.MX9 platforms.
MQS output pins are often shared with other devices, so the overlay
routes SAI1 to MQS1 and disables the conflicting device and sound card.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile      | 12 +++++
 arch/arm64/boot/dts/freescale/imx9-mqs.dtso | 54 +++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx9-mqs.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..6e9e3226a693 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -613,6 +613,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
+imx91-11x11-evk-mqs-dtbs += imx91-11x11-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 
 imx91-9x9-qsb-can1-dtbs += imx91-9x9-qsb.dtb imx91-9x9-qsb-can1.dtbo
@@ -645,6 +647,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 
 imx93-11x11-evk-dy1212w-4856-dtbs += imx93-11x11-evk.dtb imx93-11x11-evk-dy1212w-4856.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-dy1212w-4856.dtb
+imx93-11x11-evk-mqs-dtbs += imx93-11x11-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-mqs.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 
@@ -652,6 +656,8 @@ imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
+imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
@@ -703,6 +709,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
 
 imx943-evk-sdwifi-dtbs := imx943-evk.dtb imx943-evk-sdwifi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
+imx943-evk-mqs-dtbs += imx943-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk-mqs.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
@@ -734,6 +742,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
+imx95-15x15-evk-mqs-dtbs += imx95-15x15-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-mqs.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
@@ -742,6 +752,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
+imx952-evk-mqs-dtbs += imx952-evk.dtb imx9-mqs.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx952-evk-mqs.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 imx8mm-kontron-bl-lte-dtbs		:= imx8mm-kontron-bl.dtb imx8mm-kontron-bl-lte.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx9-mqs.dtso b/arch/arm64/boot/dts/freescale/imx9-mqs.dtso
new file mode 100644
index 000000000000..9ac6d58eacbb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx9-mqs.dtso
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	sound-mqs {
+		compatible = "audio-graph-card2";
+		links = <&sai1_port1>;
+		label = "mqs-audio";
+	};
+};
+
+&mqs1_conflict_card {
+	status = "disabled";
+};
+
+&mqs1_conflict_dev {
+	status = "disabled";
+};
+
+&mqs1 {
+	status = "okay";
+
+	port {
+		mqs1_endpoint: endpoint {
+			remote-endpoint = <&sai1_endpoint1>;
+		};
+	};
+};
+
+&sai1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			playback-only;
+
+			sai1_endpoint1: endpoint {
+				dai-format = "left_j";
+				bitclock-master;
+				frame-master;
+				mclk-fs = <512>;
+				system-clock-direction-out;
+				remote-endpoint = <&mqs1_endpoint>;
+			};
+		};
+	};
+};
-- 
2.50.1

