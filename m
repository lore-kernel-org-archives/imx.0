Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012060.outbound.protection.outlook.com [52.101.71.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD69F1FC7F8
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080712; cv=fail; b=KJGybhXQrOJ77v9YR7nXHVlLRU7odiR01TxZhJT+8X7JCPc+tDTxWKMVx1fBwStDlI5NQ53wlUjxLFr2GBSO5JU4NCDRo3ITJ5L/B5lcKOGlKvBYQ1oVQR+ga2SX3FTydD24hcv2ga7i4B7IAAnhFFi4h1lsHllf/80GLmBn+hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080712; c=relaxed/simple;
	bh=YZWdSD/nFL6w9Xl9+bHMtYZ0cNZ6kZzjvpptd+RFKR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DnpCQGSal3oh/r+/UXqgQvGUC63ubh5+coL10QMWz6KHQuO+TTY4Pw3ymqOaZWpnGUfRXvHtD7k/LJZNVouGHzBK1xiZAF2feCxIB29tX/vchw1ihZNAp4vxu7Xr62Vp26J6noWwEwpGjAiOQ26Vml+1vhZcy+eCd59SEhIbYUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eCX4T20n; arc=fail smtp.client-ip=52.101.71.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eCX4T20n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJJMmiGhhbIf/x0Dkp+O3l7aYPvdxf4pR1HsrWrGbogTLyivPZmXelOJu94DHWRN2f4z7u6RN8+N1jNm2c6bLgSeuxfZysGwyr219mAsyv37M8cXJws54Rgs4DKPF0McoNWAIyVRZj6dczjAidWbOAqY8I2vf73cWHoQA5gRiH+iCT5VfJJVvZyFtRU6FfxLBwRiaMOOvHRN6TvaZAs55QaZnU+8ft6sbLyti3GNcLeq4GQAA29QSwiZIdjnms2bTdSzluGTFHnYSmLMF3OgytRgmVnc499D8EBbLoiYXPmkgvIzsJlr8+M2M2XCE2kJDW0LtX87yWghF5a91g4z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YttFdKqUULzl7fngvPieqdr/VM7fTZG7Ug46rGqsvwA=;
 b=a1+Q8eehGWVFHlZf+rWG7JCXw3+8pBW1HujQuAQuXCCuJ8jDEu/QR2IlNfD3/HJpTX4OkNKiNVSaemZ+ccolU6f/LzbJsoLYpAf2VUYd8Csc+8W/g6uqNMKabgsPdCWVmo0CJ7j1KpopTKqyky9Btb5rxrs6aWQOs2xStoJEwDhE5aN7/tC7w1N4i0Dan5xPsf43cFuwuSQdw5uPXVD3i+99MJmOibQ//HGu/iG16hl66HJqfvA+3bNU+PTCQCkjO+m5Ft5Mi1Gfp2pWITKSrhCHnePc9AC39N+iZxQ29msQc0wY7kzJhC26hw1olZlxV1UoESmsw7sSmzxHgZLETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YttFdKqUULzl7fngvPieqdr/VM7fTZG7Ug46rGqsvwA=;
 b=eCX4T20n1T+gBEfMmO7n88f74AVgJBDFXGoa+mlVwZmbmmSbzsJxQpHmyf1Z2IqIpzs8ccE65V5nQ+2hxIygTpk8vgrxj+LOCUOj74yo9A+W0UZnnuJTWCy06QnGCussvIBeZH25dsKL7pfYUmZxhp/CQYUxYbgpWqzpflSHAdaBsniX9CaO0ZWjHDOvnpnHU1xseh2YNUGllxkdJQoMesL7nubW74CPEJf9tOS1p/Tblt0f50FXxuqL/SkjI+1HMJ39OoqFsZuP6wHawvBokO8pTb0uMBjCaGQUmrgXRKDbj4xS5eUEYPLMYehpnC2yDTdP9qJdMrYEBr4Wgex0QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GVXPR04MB10381.eurprd04.prod.outlook.com (2603:10a6:150:1e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 09:31:39 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 09:31:38 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v2 3/4] arm64: dts: freescale: Add basic dtsi for imx943
Date: Tue,  4 Mar 2025 17:31:26 +0800
Message-Id: <20250304093127.1954549-4-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304093127.1954549-1-ping.bai@nxp.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|GVXPR04MB10381:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c9bec8-5ab7-480e-3192-08dd5aff5d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DCDCyvQj6DbXd8DyDopZpt1lqufyqu4dRtgRrREfh74lVObkcpJDm5bXpIKM?=
 =?us-ascii?Q?P2Pp1JegTSa+N8NxOZX5+BcJlY//FhRIx0SX144zJw5rTwnvd+pPOrHJvdW/?=
 =?us-ascii?Q?neYDQPL3CWPToBvN4VCnyb7FfR+KqH0Q7LWDil7VVHHdC0Ti1PKkAKlYEM1L?=
 =?us-ascii?Q?UnUXUnqbS7FmmEYIECVNcKmdNifIlu+Y21eeS0VrJO1bbNmuBtEuGg5pHTt6?=
 =?us-ascii?Q?sVusInoll+Ys/ckfGm5ml7RrMVZwqCLlS2kttWC1S7FuBz6k+IEDjQb9iCh4?=
 =?us-ascii?Q?0qND572GbC0YLpbS8EPsRjxHjSlH47L2K50apI9OOe0yNUbILgrLM6KudgXK?=
 =?us-ascii?Q?1dMT/yBdhurgrO9jhtBMGxeiExsbc/6agCfyVQ3cY9jeO0Z6IqaTMKueFjhS?=
 =?us-ascii?Q?xxz7b3XZNhGIik2we3l9Oo938WXmMQ0lc+ciwgFYmWNAzk6UFr4pIGzSYmdJ?=
 =?us-ascii?Q?eX2ce16DglKLOU423sWbi4ZTynUZ5xuLcOZSZ2SIEjB+feflTZGoWsdR3v0+?=
 =?us-ascii?Q?ZTjEPuEXo+1WPPNfK/ni4taRnT43q2B5lPacYG3n6okgbaVOOSOTid4yqSTn?=
 =?us-ascii?Q?xz1M7rd2BMmqs3Js3Wfh28HHtQ4vL8Xaq/eoI4MUJWYknMhEbkzwQv/VYbwi?=
 =?us-ascii?Q?RmRqF8aYSMPNK3kJfHRsWfqkz+gs0txqBEJjAl6NFr7n2L/32bOrJ15ptvRz?=
 =?us-ascii?Q?dkFyBzyxvUSy18shnuRGdogM6AVmiHqAugXC9Cw091nZs0MZADg8EtCj5Tcn?=
 =?us-ascii?Q?NJQiKkIeuTGv1tkeAf1hOh8fNGJOY8WhhWfeWUtlchUR8g0E59WwberIBp/T?=
 =?us-ascii?Q?o5enrQFI+XYg1L55ff2p/xdtLFC3wBPt3ojuqRapmPKJ/UQJzr66IPGODGXg?=
 =?us-ascii?Q?uMsfmtP7JXZHc4PMTj/Cy7/GfKImmyvfZLb0lu3lXaGAN21aS0SQ8xFLZWbc?=
 =?us-ascii?Q?BDJZAJOhKa+AxkNFamr8YaUr6ZMsgdY+tU6e1YbvHns8Z5XRaFYOFyq5L4ZJ?=
 =?us-ascii?Q?HSr+L7kb7Pon+f5wiABXL+Juxl0ncMqw+CPjmp+CuYvJe+CrHC3DJ9QojbOn?=
 =?us-ascii?Q?3m4k+sSjHZWv+YXQPPbRp8Zb4ON830L/CLeK6itBLjykGmUP4W40JmqGN6EI?=
 =?us-ascii?Q?/gIFZSYXdYDdZtWBJENCn6uWiCrVTsE4l9AxpfpCUWgPNDw6c1TZ166KYvCE?=
 =?us-ascii?Q?LGd5mp18AU9tzv/K+MJXqNZ0Df9SPTAH5DHm3EX38mjF7mOJJoc4pBEk6xdY?=
 =?us-ascii?Q?Wr8DsqxmsJbosw7PWJOU5YC6tf5xZKaoG/+xdJAaPTDk/ybanlKnwJ6F7Gb3?=
 =?us-ascii?Q?NdWKPvo2wQYUICN42CqATcvjJ8exJ66hVlfwTx6yZyDuNBY6RWpB+knfEohM?=
 =?us-ascii?Q?u9QQSmTyzLMYFpZgetRchjkXsXKuK0XDSaEHOfDORVMqt2B9Uc1J3JfNvZFn?=
 =?us-ascii?Q?vCgYUwcOAZ3FHRQAImFXJMZDjYU0tJL+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wMQZdUXDuPhqlBC8qE7SCuzw80TFIprPzkj8PVPxdfSI/J5YwdEfe2QUJ5gx?=
 =?us-ascii?Q?QTeu4hH7LKUQqQno1Q/+H5sARiPmX+csJgrG+2QAvW759vV81BpbElIdqq8y?=
 =?us-ascii?Q?TfaugxNQQbEFK53EwMZgbjtsWLgoxsXjLCG9/iIB5sS5FSFi0bQn9ByJMkuM?=
 =?us-ascii?Q?8Lp7eUzL3sGaedcMlA9NDTq6hbGNh53PjEcssTohn0fWC7W2R+ko5+vB8WLl?=
 =?us-ascii?Q?W/EAcBpQbcnRCppIcH35Leq/qOyxLWNwvihvTm8oI7nWXK501zTXL14XBOd8?=
 =?us-ascii?Q?oump8J1hEQgY2Ur2WW1Tmqyk1V/EUqOOIl0qRuEyJJjJlyM5X2OswwKl/Njt?=
 =?us-ascii?Q?DHYt17r0s0Io3B2IXA2U2YxsZiXpPUaBPS4r8pj06R8v1B31VYsKePeJU9H8?=
 =?us-ascii?Q?EMIN/U5c6gw5ebyNDzdpTXNMfbwkw342/KxY57ePwTU6bv3DI5ikjzotmryU?=
 =?us-ascii?Q?duao1l7y2msbuGWlwF9R1uk3PplPvnoEnADDGw80DmZ6Anjg+V/s2/FvLXTj?=
 =?us-ascii?Q?oZR7v5ebK2TW4QOgimfDuUe44meHGYY8EsoQJEna5Z6r8RJ6AmAIY5x3Vlu2?=
 =?us-ascii?Q?vdywgS21mk/jZbX4w6sfAcu47h0Fic8czrTnwfyyYM6yP6ndDE7ZvfUwKo9u?=
 =?us-ascii?Q?E8Gx3CqDfecD9YHbl3iNFPrgcqeHAtB0ooPJ9XLu6GbCvW82F44/hARCECVT?=
 =?us-ascii?Q?JWF4U4bsaVcixqKr14W2ymW8Q7tgcBvvO4E1EGra2yKN2RenUB+mSw3zz7Pv?=
 =?us-ascii?Q?0IWdn7VhPaHtlZ+oSy/b3iMZOVWYmI9U7JdRmuMThuYkOZnwn2XMKcZBygjw?=
 =?us-ascii?Q?nfSbmy6y3y2SmCCBjxZlbwDDrl8x51XDWsMXzKqEJwYgiGFkWwZNH52/j7iB?=
 =?us-ascii?Q?q32G+9N0aDQL/Qh3DAfVMGF/Aa9OvXoFf+vJnVaGWKQUNplwlaoHT+qx81qj?=
 =?us-ascii?Q?6GUM46fqoG2ueSazAD1ned8BzomJe3tD7SlAJ7cQ1mYdSePfgE9yxHR2SPDJ?=
 =?us-ascii?Q?emrfmscggMOtqqPSgTcMdeztZLRC5tZmJyesW+y/UeGjXCMYuFemalfe8YNs?=
 =?us-ascii?Q?ya1P4lJFBR38zNNhKhKdkmqC5pxBj8JdIPV3FPcrdnF0L8IyAC/mGH63g3yo?=
 =?us-ascii?Q?ceRbYSXJO2KE/rXLdpz6CMiTaBTL5A2qN7PMmrGYbiQk2oeTF9sk6OkxUVsb?=
 =?us-ascii?Q?UvnWziiZLxOCY7XGkGzE+CYtJIGVbUSVcPlJKmskpJYDE2sSEJcq1Vzua7CJ?=
 =?us-ascii?Q?Lhv/s4Uq4yiC+Kerfuslqmud9wNm8qckt26lmbozJk4Jevbb3OZ4BtOcc4Su?=
 =?us-ascii?Q?vDOeuC/nf5JHuEsfzr3qsXKy1qU3RWhzcH75R3y4a+DLJ/NkLJB5Xch3bJlC?=
 =?us-ascii?Q?sJKHJwAuA8TyNETm3r4p3Ka4VAmG7STVzN2hMaV6CbsQVcF6sUBNoVMidNVt?=
 =?us-ascii?Q?vJuJhijlv7p9vCv2sEOKgfncQrZ7qK9wIQHJG0C71ReBmArVprsEw/JIIrQh?=
 =?us-ascii?Q?vrR/YzFB5dG8xbxTEd9VLtgfNZ01H4GxYSosvNatPyh2EZ5D5CnSy2Gw17Fn?=
 =?us-ascii?Q?w0NvXEYG1v6yt5lDiCTIoyzrHbRPR5YvoAAwt4LL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c9bec8-5ab7-480e-3192-08dd5aff5d04
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 09:31:38.9256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKvlm/XvSlj2CuHCX2nYQJ2/D2zibSHpB9is2lYkAP/6rSW4mKs2DuEr0ut14jMDMcWYRywNMF79LI2/ZPjP/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10381

Add the minimal dtsi support for i.MX943. i.MX943 is the
first SoC of i.MX94 Family, create a common dtsi for the
whole i.MX94 family, and the specific dtsi part for i.MX943.

The clock, power domain and perf index need to be used by
the device nodes for resource reference, add them along
with the dtsi support.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 - v2 changes:
  - remove the unnecessary macro define in clock header as suggested by Krzysztof
  - split the dtsi into imx94.dtsi and imx943.dtsi
  - use low case in the pinfunc header as Frank suggested
  - reorder the device nodes and properties
  - resolve Krzysztof's other comments
---
 arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 +++
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1542 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
 arch/arm64/boot/dts/freescale/imx94.dtsi      | 1141 ++++++++++++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
 5 files changed, 3067 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx94-clock.h b/arch/arm64/boot/dts/freescale/imx94-clock.h
new file mode 100644
index 000000000000..84ad3d53c29b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx94-clock.h
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2024-2025 NXP
+ */
+
+#ifndef __CLOCK_IMX94_H
+#define __CLOCK_IMX94_H
+
+#define IMX94_CLK_EXT				0
+#define IMX94_CLK_32K				1
+#define IMX94_CLK_24M				2
+#define IMX94_CLK_FRO				3
+#define IMX94_CLK_SYSPLL1_VCO			4
+#define IMX94_CLK_SYSPLL1_PFD0_UNGATED		5
+#define IMX94_CLK_SYSPLL1_PFD0			6
+#define IMX94_CLK_SYSPLL1_PFD0_DIV2		7
+#define IMX94_CLK_SYSPLL1_PFD1_UNGATED		8
+#define IMX94_CLK_SYSPLL1_PFD1			9
+#define IMX94_CLK_SYSPLL1_PFD1_DIV2		10
+#define IMX94_CLK_SYSPLL1_PFD2_UNGATED		11
+#define IMX94_CLK_SYSPLL1_PFD2			12
+#define IMX94_CLK_SYSPLL1_PFD2_DIV2		13
+#define IMX94_CLK_AUDIOPLL1_VCO			14
+#define IMX94_CLK_AUDIOPLL1			15
+#define IMX94_CLK_AUDIOPLL2_VCO			16
+#define IMX94_CLK_AUDIOPLL2			17
+#define IMX94_CLK_RESERVED18			18
+#define IMX94_CLK_RESERVED19			19
+#define IMX94_CLK_RESERVED20			20
+#define IMX94_CLK_RESERVED21			21
+#define IMX94_CLK_RESERVED22			22
+#define IMX94_CLK_RESERVED23			23
+#define IMX94_CLK_ENCPLL_VCO			24
+#define IMX94_CLK_ENCPLL_PFD0_UNGATED		25
+#define IMX94_CLK_ENCPLL_PFD0			26
+#define IMX94_CLK_ENCPLL_PFD1_UNGATED		27
+#define IMX94_CLK_ENCPLL_PFD1			28
+#define IMX94_CLK_ARMPLL_VCO			29
+#define IMX94_CLK_ARMPLL_PFD0_UNGATED		30
+#define IMX94_CLK_ARMPLL_PFD0			31
+#define IMX94_CLK_ARMPLL_PFD1_UNGATED		32
+#define IMX94_CLK_ARMPLL_PFD1			33
+#define IMX94_CLK_ARMPLL_PFD2_UNGATED		34
+#define IMX94_CLK_ARMPLL_PFD2			35
+#define IMX94_CLK_ARMPLL_PFD3_UNGATED		36
+#define IMX94_CLK_ARMPLL_PFD3			37
+#define IMX94_CLK_DRAMPLL_VCO			38
+#define IMX94_CLK_DRAMPLL			39
+#define IMX94_CLK_HSIOPLL_VCO			40
+#define IMX94_CLK_HSIOPLL			41
+#define IMX94_CLK_LDBPLL_VCO			42
+#define IMX94_CLK_LDBPLL			43
+#define IMX94_CLK_EXT1				44
+#define IMX94_CLK_EXT2				45
+
+#define IMX94_CLK_ADC				46
+#define IMX94_CLK_BUSAON			47
+#define IMX94_CLK_CAN1				48
+#define IMX94_CLK_GLITCHFILTER			49
+#define IMX94_CLK_GPT1				50
+#define IMX94_CLK_I3C1SLOW			51
+#define IMX94_CLK_LPI2C1			52
+#define IMX94_CLK_LPI2C2			53
+#define IMX94_CLK_LPSPI1			54
+#define IMX94_CLK_LPSPI2			55
+#define IMX94_CLK_LPTMR1			56
+#define IMX94_CLK_LPUART1			57
+#define IMX94_CLK_LPUART2			58
+#define IMX94_CLK_M33				59
+#define IMX94_CLK_M33SYSTICK			60
+#define IMX94_CLK_PDM				61
+#define IMX94_CLK_SAI1				62
+#define IMX94_CLK_TPM2				63
+#define IMX94_CLK_A55				64
+#define IMX94_CLK_A55MTRBUS			65
+#define IMX94_CLK_A55PERIPH			66
+#define IMX94_CLK_DRAMALT			67
+#define IMX94_CLK_DRAMAPB			68
+#define IMX94_CLK_DISPAPB			69
+#define IMX94_CLK_DISPAXI			70
+#define IMX94_CLK_DISPPIX			71
+#define IMX94_CLK_HSIOACSCAN480M		72
+#define IMX94_CLK_HSIOACSCAN80M			73
+#define IMX94_CLK_HSIO				74
+#define IMX94_CLK_HSIOPCIEAUX			75
+#define IMX94_CLK_HSIOPCIETEST160M		76
+#define IMX94_CLK_HSIOPCIETEST400M		77
+#define IMX94_CLK_HSIOPCIETEST500M		78
+#define IMX94_CLK_HSIOPCIETEST50M		79
+#define IMX94_CLK_HSIOUSBTEST60M		80
+#define IMX94_CLK_BUSM70			81
+#define IMX94_CLK_M70				82
+#define IMX94_CLK_M70SYSTICK			83
+#define IMX94_CLK_BUSM71			84
+#define IMX94_CLK_M71				85
+#define IMX94_CLK_M71SYSTICK			86
+#define IMX94_CLK_BUSNETCMIX			87
+#define IMX94_CLK_ECAT				88
+#define IMX94_CLK_ENET				89
+#define IMX94_CLK_ENETPHYTEST200M		90
+#define IMX94_CLK_ENETPHYTEST500M		91
+#define IMX94_CLK_ENETPHYTEST667M		92
+#define IMX94_CLK_ENETREF			93
+#define IMX94_CLK_ENETTIMER1			94
+#define IMX94_CLK_ENETTIMER2			95
+#define IMX94_CLK_ENETTIMER3			96
+#define IMX94_CLK_FLEXIO3			97
+#define IMX94_CLK_FLEXIO4			98
+#define IMX94_CLK_M33SYNC			99
+#define IMX94_CLK_M33SYNCSYSTICK		100
+#define IMX94_CLK_MAC0				101
+#define IMX94_CLK_MAC1				102
+#define IMX94_CLK_MAC2				103
+#define IMX94_CLK_MAC3				104
+#define IMX94_CLK_MAC4				105
+#define IMX94_CLK_MAC5				106
+#define IMX94_CLK_NOCAPB			107
+#define IMX94_CLK_NOC				108
+#define IMX94_CLK_NPUAPB			109
+#define IMX94_CLK_NPU				110
+#define IMX94_CLK_CCMCKO1			111
+#define IMX94_CLK_CCMCKO2			112
+#define IMX94_CLK_CCMCKO3			113
+#define IMX94_CLK_CCMCKO4			114
+#define IMX94_CLK_BISS				115
+#define IMX94_CLK_BUSWAKEUP			116
+#define IMX94_CLK_CAN2				117
+#define IMX94_CLK_CAN3				118
+#define IMX94_CLK_CAN4				119
+#define IMX94_CLK_CAN5				120
+#define IMX94_CLK_ENDAT21			121
+#define IMX94_CLK_ENDAT22			122
+#define IMX94_CLK_ENDAT31FAST			123
+#define IMX94_CLK_ENDAT31SLOW			124
+#define IMX94_CLK_FLEXIO1			125
+#define IMX94_CLK_FLEXIO2			126
+#define IMX94_CLK_GPT2				127
+#define IMX94_CLK_GPT3				128
+#define IMX94_CLK_GPT4				129
+#define IMX94_CLK_HIPERFACE1			130
+#define IMX94_CLK_HIPERFACE1SYNC		131
+#define IMX94_CLK_HIPERFACE2			132
+#define IMX94_CLK_HIPERFACE2SYNC		133
+#define IMX94_CLK_I3C2SLOW			134
+#define IMX94_CLK_LPI2C3			135
+#define IMX94_CLK_LPI2C4			136
+#define IMX94_CLK_LPI2C5			137
+#define IMX94_CLK_LPI2C6			138
+#define IMX94_CLK_LPI2C7			139
+#define IMX94_CLK_LPI2C8			140
+#define IMX94_CLK_LPSPI3			141
+#define IMX94_CLK_LPSPI4			142
+#define IMX94_CLK_LPSPI5			143
+#define IMX94_CLK_LPSPI6			144
+#define IMX94_CLK_LPSPI7			145
+#define IMX94_CLK_LPSPI8			146
+#define IMX94_CLK_LPTMR2			147
+#define IMX94_CLK_LPUART10			148
+#define IMX94_CLK_LPUART11			149
+#define IMX94_CLK_LPUART12			150
+#define IMX94_CLK_LPUART3			151
+#define IMX94_CLK_LPUART4			152
+#define IMX94_CLK_LPUART5			153
+#define IMX94_CLK_LPUART6			154
+#define IMX94_CLK_LPUART7			155
+#define IMX94_CLK_LPUART8			156
+#define IMX94_CLK_LPUART9			157
+#define IMX94_CLK_SAI2				158
+#define IMX94_CLK_SAI3				159
+#define IMX94_CLK_SAI4				160
+#define IMX94_CLK_SWOTRACE			161
+#define IMX94_CLK_TPM4				162
+#define IMX94_CLK_TPM5				163
+#define IMX94_CLK_TPM6				164
+#define IMX94_CLK_USBPHYBURUNIN			165
+#define IMX94_CLK_USDHC1			166
+#define IMX94_CLK_USDHC2			167
+#define IMX94_CLK_USDHC3			168
+#define IMX94_CLK_V2XPK				169
+#define IMX94_CLK_WAKEUPAXI			170
+#define IMX94_CLK_XSPISLVROOT			171
+#define IMX94_CLK_XSPI1				172
+#define IMX94_CLK_XSPI2				173
+
+#define IMX94_CLK_SEL_EXT			174
+#define IMX94_CLK_SEL_A55C0			175
+#define IMX94_CLK_SEL_A55C1			176
+#define IMX94_CLK_SEL_A55C2			177
+#define IMX94_CLK_SEL_A55C3			178
+#define IMX94_CLK_SEL_A55P			179
+#define IMX94_CLK_SEL_DRAM			180
+#define IMX94_CLK_SEL_TEMPSENSE			181
+#define IMX94_CLK_NPU_CGC			182
+
+#endif /* __CLOCK_IMX94_H */
diff --git a/arch/arm64/boot/dts/freescale/imx94-pinfunc.h b/arch/arm64/boot/dts/freescale/imx94-pinfunc.h
new file mode 100644
index 000000000000..2089957333e4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx94-pinfunc.h
@@ -0,0 +1,1542 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright 2024-2025 NXP
+ */
+
+#ifndef __DTS_IMX94_PINFUNC_H
+#define __DTS_IMX94_PINFUNC_H
+
+/*
+ * The pin function ID is a tuple of <mux_reg conf_reg input_reg mux_mode input_val>
+ */
+#define IMX94_PAD_DAP_TDI__JTAG_MUX_TDI                     0x0000 0x0304 0x092c 0x00 0x00
+#define IMX94_PAD_DAP_TDI__MQS2_LEFT                        0x0000 0x0304 0x0000 0x01 0x00
+#define IMX94_PAD_DAP_TDI__ECAT_LED_ERR                     0x0000 0x0304 0x0000 0x02 0x00
+#define IMX94_PAD_DAP_TDI__CAN2_TX                          0x0000 0x0304 0x0000 0x03 0x00
+#define IMX94_PAD_DAP_TDI__SINC_FILTER_GLUE3_BREAK          0x0000 0x0304 0x0000 0x04 0x00
+#define IMX94_PAD_DAP_TDI__GPIO4_IO4                        0x0000 0x0304 0x0000 0x05 0x00
+#define IMX94_PAD_DAP_TDI__LPUART5_RX                       0x0000 0x0304 0x07bc 0x06 0x00
+#define IMX94_PAD_DAP_TDI__XBAR1_XBAR_INOUT26               0x0000 0x0304 0x0000 0x07 0x00
+
+#define IMX94_PAD_DAP_TMS_SWDIO__JTAG_MUX_TMS               0x0004 0x0308 0x0930 0x00 0x00
+#define IMX94_PAD_DAP_TMS_SWDIO__CAN5_TX                    0x0004 0x0308 0x0000 0x01 0x00
+#define IMX94_PAD_DAP_TMS_SWDIO__GPT_MUX_INOUT10            0x0004 0x0308 0x0000 0x02 0x00
+#define IMX94_PAD_DAP_TMS_SWDIO__LPUART8_TX                 0x0004 0x0308 0x07dc 0x03 0x00
+#define IMX94_PAD_DAP_TMS_SWDIO__SINC3_MOD_CLK1             0x0004 0x0308 0x0000 0x04 0x00
+#define IMX94_PAD_DAP_TMS_SWDIO__GPIO4_IO5                  0x0004 0x0308 0x0000 0x05 0x00
+#define IMX94_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B              0x0004 0x0308 0x0000 0x06 0x00
+#define IMX94_PAD_DAP_TMS_SWDIO__XBAR1_XBAR_INOUT27         0x0004 0x0308 0x0000 0x07 0x00
+
+#define IMX94_PAD_DAP_TCLK_SWCLK__JTAG_MUX_TCK              0x0008 0x030c 0x0928 0x00 0x00
+#define IMX94_PAD_DAP_TCLK_SWCLK__CAN5_RX                   0x0008 0x030c 0x0688 0x01 0x00
+#define IMX94_PAD_DAP_TCLK_SWCLK__GPT_MUX_INOUT11           0x0008 0x030c 0x0000 0x02 0x00
+#define IMX94_PAD_DAP_TCLK_SWCLK__LPUART8_RX                0x0008 0x030c 0x07d8 0x03 0x00
+#define IMX94_PAD_DAP_TCLK_SWCLK__SINC3_MOD_CLK0            0x0008 0x030c 0x0000 0x04 0x00
+#define IMX94_PAD_DAP_TCLK_SWCLK__GPIO4_IO6                 0x0008 0x030c 0x0000 0x05 0x00
+#define IMX94_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B             0x0008 0x030c 0x07b8 0x06 0x00
+#define IMX94_PAD_DAP_TCLK_SWCLK__XBAR1_XBAR_INOUT28        0x0008 0x030c 0x0000 0x07 0x00
+
+#define IMX94_PAD_DAP_TDO_TRACESWO__JTAG_MUX_TDO            0x000c 0x0310 0x0000 0x00 0x00
+#define IMX94_PAD_DAP_TDO_TRACESWO__MQS2_RIGHT              0x000c 0x0310 0x0000 0x01 0x00
+#define IMX94_PAD_DAP_TDO_TRACESWO__ECAT_RESET_OUT          0x000c 0x0310 0x0000 0x02 0x00
+#define IMX94_PAD_DAP_TDO_TRACESWO__CAN2_RX                 0x000c 0x0310 0x067c 0x03 0x00
+#define IMX94_PAD_DAP_TDO_TRACESWO__SINC3_MOD_CLK2          0x000c 0x0310 0x0000 0x04 0x00
+#define IMX94_PAD_DAP_TDO_TRACESWO__GPIO4_IO7               0x000c 0x0310 0x0000 0x05 0x00
+#define IMX94_PAD_DAP_TDO_TRACESWO__LPUART5_TX              0x000c 0x0310 0x07c0 0x06 0x00
+#define IMX94_PAD_DAP_TDO_TRACESWO__XBAR1_XBAR_INOUT29      0x000c 0x0310 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO00__GPIO2_IO0                      0x0010 0x0314 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO00__I3C2_PUR                       0x0010 0x0314 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO00__XBAR1_XBAR_INOUT39             0x0010 0x0314 0x08d4 0x02 0x00
+#define IMX94_PAD_GPIO_IO00__I3C2_PUR_B                     0x0010 0x0314 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO00__LPSPI6_PCS0                    0x0010 0x0314 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO00__LPUART5_TX                     0x0010 0x0314 0x07c0 0x05 0x01
+#define IMX94_PAD_GPIO_IO00__LPI2C5_SDA                     0x0010 0x0314 0x0740 0x06 0x00
+#define IMX94_PAD_GPIO_IO00__FLEXIO1_FLEXIO0                0x0010 0x0314 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO01__GPIO2_IO1                      0x0014 0x0318 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO01__I3C2_SCL                       0x0014 0x0318 0x0720 0x01 0x00
+#define IMX94_PAD_GPIO_IO01__XBAR1_XBAR_INOUT40             0x0014 0x0318 0x08d8 0x02 0x00
+#define IMX94_PAD_GPIO_IO01__EWM_OUT_B                      0x0014 0x0318 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO01__LPSPI6_SIN                     0x0014 0x0318 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO01__LPUART5_RX                     0x0014 0x0318 0x07bc 0x05 0x01
+#define IMX94_PAD_GPIO_IO01__LPI2C5_SCL                     0x0014 0x0318 0x073c 0x06 0x00
+#define IMX94_PAD_GPIO_IO01__FLEXIO1_FLEXIO1                0x0014 0x0318 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO02__GPIO2_IO2                      0x0018 0x031c 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO02__I3C2_SDA                       0x0018 0x031c 0x0724 0x01 0x00
+#define IMX94_PAD_GPIO_IO02__XBAR1_XBAR_INOUT41             0x0018 0x031c 0x08dc 0x02 0x00
+#define IMX94_PAD_GPIO_IO02__GPT_MUX_INOUT1                 0x0018 0x031c 0x0700 0x03 0x00
+#define IMX94_PAD_GPIO_IO02__LPSPI6_SOUT                    0x0018 0x031c 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO02__LPUART5_CTS_B                  0x0018 0x031c 0x07b8 0x05 0x01
+#define IMX94_PAD_GPIO_IO02__LPI2C6_SDA                     0x0018 0x031c 0x074c 0x06 0x00
+#define IMX94_PAD_GPIO_IO02__FLEXIO1_FLEXIO2                0x0018 0x031c 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO03__GPIO2_IO3                      0x001c 0x0320 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO03__EWM_OUT_B                      0x001c 0x0320 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO03__XBAR1_XBAR_INOUT42             0x001c 0x0320 0x08e0 0x02 0x00
+#define IMX94_PAD_GPIO_IO03__GPT_MUX_INOUT4                 0x001c 0x0320 0x0708 0x03 0x00
+#define IMX94_PAD_GPIO_IO03__LPSPI6_SCK                     0x001c 0x0320 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO03__LPUART5_RTS_B                  0x001c 0x0320 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO03__LPI2C6_SCL                     0x001c 0x0320 0x0748 0x06 0x00
+#define IMX94_PAD_GPIO_IO03__FLEXIO1_FLEXIO3                0x001c 0x0320 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO04__GPIO2_IO4                      0x0020 0x0324 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO04__TPM3_CH0                       0x0020 0x0324 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO04__PDM_CLK                        0x0020 0x0324 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO04__GPT_MUX_INOUT5                 0x0020 0x0324 0x070c 0x03 0x00
+#define IMX94_PAD_GPIO_IO04__LPSPI7_PCS0                    0x0020 0x0324 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO04__LPUART6_TX                     0x0020 0x0324 0x07cc 0x05 0x00
+#define IMX94_PAD_GPIO_IO04__LPI2C6_SDA                     0x0020 0x0324 0x074c 0x06 0x01
+#define IMX94_PAD_GPIO_IO04__FLEXIO1_FLEXIO4                0x0020 0x0324 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO05__GPIO2_IO5                      0x0024 0x0328 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO05__TPM4_CH0                       0x0024 0x0328 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO05__PDM_BIT_STREAM0                0x0024 0x0328 0x0610 0x02 0x00
+#define IMX94_PAD_GPIO_IO05__GPT_MUX_INOUT7                 0x0024 0x0328 0x0714 0x03 0x00
+#define IMX94_PAD_GPIO_IO05__LPSPI7_SIN                     0x0024 0x0328 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO05__LPUART6_RX                     0x0024 0x0328 0x07c8 0x05 0x00
+#define IMX94_PAD_GPIO_IO05__LPI2C6_SCL                     0x0024 0x0328 0x0748 0x06 0x01
+#define IMX94_PAD_GPIO_IO05__FLEXIO1_FLEXIO5                0x0024 0x0328 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO06__GPIO2_IO6                      0x0028 0x032c 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO06__TPM5_CH0                       0x0028 0x032c 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO06__PDM_BIT_STREAM1                0x0028 0x032c 0x0614 0x02 0x00
+#define IMX94_PAD_GPIO_IO06__GPT_MUX_INOUT8                 0x0028 0x032c 0x0718 0x03 0x00
+#define IMX94_PAD_GPIO_IO06__LPSPI7_SOUT                    0x0028 0x032c 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO06__LPUART6_CTS_B                  0x0028 0x032c 0x07c4 0x05 0x00
+#define IMX94_PAD_GPIO_IO06__LPI2C7_SDA                     0x0028 0x032c 0x0754 0x06 0x00
+#define IMX94_PAD_GPIO_IO06__FLEXIO1_FLEXIO6                0x0028 0x032c 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO07__GPIO2_IO7                      0x002c 0x0330 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO07__LPSPI3_PCS1                    0x002c 0x0330 0x0768 0x01 0x00
+#define IMX94_PAD_GPIO_IO07__XBAR1_XBAR_INOUT43             0x002c 0x0330 0x08e4 0x02 0x00
+#define IMX94_PAD_GPIO_IO07__GPT_MUX_INOUT3                 0x002c 0x0330 0x0704 0x03 0x00
+#define IMX94_PAD_GPIO_IO07__LPSPI7_SCK                     0x002c 0x0330 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO07__LPUART6_RTS_B                  0x002c 0x0330 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO07__LPI2C7_SCL                     0x002c 0x0330 0x0750 0x06 0x00
+#define IMX94_PAD_GPIO_IO07__FLEXIO1_FLEXIO7                0x002c 0x0330 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO08__GPIO2_IO8                      0x0030 0x0334 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO08__LPSPI3_PCS0                    0x0030 0x0334 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO08__USDHC2_WP                      0x0030 0x0334 0x0854 0x02 0x00
+#define IMX94_PAD_GPIO_IO08__GPT_MUX_INOUT2                 0x0030 0x0334 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO08__TPM6_CH0                       0x0030 0x0334 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO08__LPUART7_TX                     0x0030 0x0334 0x07d4 0x05 0x00
+#define IMX94_PAD_GPIO_IO08__LPI2C7_SDA                     0x0030 0x0334 0x0754 0x06 0x01
+#define IMX94_PAD_GPIO_IO08__FLEXIO1_FLEXIO8                0x0030 0x0334 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO09__GPIO2_IO9                      0x0034 0x0338 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO09__LPSPI3_SIN                     0x0034 0x0338 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO09__XBAR1_XBAR_INOUT44             0x0034 0x0338 0x08e8 0x02 0x00
+#define IMX94_PAD_GPIO_IO09__GPT_MUX_INOUT0                 0x0034 0x0338 0x06fc 0x03 0x00
+#define IMX94_PAD_GPIO_IO09__TPM3_EXTCLK                    0x0034 0x0338 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO09__LPUART7_RX                     0x0034 0x0338 0x07d0 0x05 0x00
+#define IMX94_PAD_GPIO_IO09__LPI2C7_SCL                     0x0034 0x0338 0x0750 0x06 0x01
+#define IMX94_PAD_GPIO_IO09__FLEXIO1_FLEXIO9                0x0034 0x0338 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO10__GPIO2_IO10                     0x0038 0x033c 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO10__LPSPI3_SOUT                    0x0038 0x033c 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO10__XBAR1_XBAR_INOUT45             0x0038 0x033c 0x08ec 0x02 0x00
+#define IMX94_PAD_GPIO_IO10__GPT_MUX_INOUT6                 0x0038 0x033c 0x0710 0x03 0x00
+#define IMX94_PAD_GPIO_IO10__TPM4_EXTCLK                    0x0038 0x033c 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO10__LPUART7_CTS_B                  0x0038 0x033c 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO10__LPI2C8_SDA                     0x0038 0x033c 0x075c 0x06 0x00
+#define IMX94_PAD_GPIO_IO10__FLEXIO1_FLEXIO10               0x0038 0x033c 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO11__GPIO2_IO11                     0x003c 0x0340 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO11__LPSPI3_SCK                     0x003c 0x0340 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO11__XBAR1_XBAR_INOUT46             0x003c 0x0340 0x08f0 0x02 0x00
+#define IMX94_PAD_GPIO_IO11__GPT_MUX_INOUT9                 0x003c 0x0340 0x071c 0x03 0x00
+#define IMX94_PAD_GPIO_IO11__TPM5_EXTCLK                    0x003c 0x0340 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO11__LPUART7_RTS_B                  0x003c 0x0340 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO11__LPI2C8_SCL                     0x003c 0x0340 0x0758 0x06 0x00
+#define IMX94_PAD_GPIO_IO11__FLEXIO1_FLEXIO11               0x003c 0x0340 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO12__GPIO2_IO12                     0x0040 0x0344 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO12__TPM3_CH2                       0x0040 0x0344 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO12__PDM_BIT_STREAM2                0x0040 0x0344 0x0618 0x02 0x00
+#define IMX94_PAD_GPIO_IO12__FLEXIO1_FLEXIO12               0x0040 0x0344 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO12__LPSPI8_PCS0                    0x0040 0x0344 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO12__LPUART8_TX                     0x0040 0x0344 0x07dc 0x05 0x01
+#define IMX94_PAD_GPIO_IO12__LPI2C8_SDA                     0x0040 0x0344 0x075c 0x06 0x01
+
+#define IMX94_PAD_GPIO_IO13__GPIO2_IO13                     0x0044 0x0348 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO13__TPM4_CH2                       0x0044 0x0348 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO13__PDM_BIT_STREAM3                0x0044 0x0348 0x061c 0x02 0x00
+#define IMX94_PAD_GPIO_IO13__XBAR1_XBAR_INOUT47             0x0044 0x0348 0x08f4 0x03 0x00
+#define IMX94_PAD_GPIO_IO13__LPSPI8_SIN                     0x0044 0x0348 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO13__LPUART8_RX                     0x0044 0x0348 0x07d8 0x05 0x01
+#define IMX94_PAD_GPIO_IO13__LPI2C8_SCL                     0x0044 0x0348 0x0758 0x06 0x01
+#define IMX94_PAD_GPIO_IO13__FLEXIO1_FLEXIO13               0x0044 0x0348 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO14__GPIO2_IO14                     0x0048 0x034c 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO14__LPUART10_CTS_B                 0x0048 0x034c 0x078c 0x01 0x00
+#define IMX94_PAD_GPIO_IO14__ECAT_SDA                       0x0048 0x034c 0x062c 0x02 0x00
+#define IMX94_PAD_GPIO_IO14__XBAR1_XBAR_INOUT48             0x0048 0x034c 0x08f8 0x03 0x00
+#define IMX94_PAD_GPIO_IO14__LPSPI8_SOUT                    0x0048 0x034c 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO14__LPUART8_CTS_B                  0x0048 0x034c 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO14__LPUART4_TX                     0x0048 0x034c 0x07b4 0x06 0x00
+#define IMX94_PAD_GPIO_IO14__FLEXIO1_FLEXIO14               0x0048 0x034c 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO15__GPIO2_IO15                     0x004c 0x0350 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO15__LPUART10_RTS_B                 0x004c 0x0350 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO15__ECAT_SCL                       0x004c 0x0350 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO15__XBAR1_XBAR_INOUT8              0x004c 0x0350 0x087c 0x03 0x00
+#define IMX94_PAD_GPIO_IO15__LPSPI8_SCK                     0x004c 0x0350 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO15__LPUART8_RTS_B                  0x004c 0x0350 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO15__LPUART4_RX                     0x004c 0x0350 0x07b0 0x06 0x00
+#define IMX94_PAD_GPIO_IO15__FLEXIO1_FLEXIO15               0x004c 0x0350 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO16__GPIO2_IO16                     0x0050 0x0354 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO16__LPI2C3_SDA                     0x0050 0x0354 0x0730 0x01 0x00
+#define IMX94_PAD_GPIO_IO16__CAN3_TX                        0x0050 0x0354 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO16__EWM_OUT_B                      0x0050 0x0354 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO16__LPUART11_TX                    0x0050 0x0354 0x079c 0x04 0x00
+#define IMX94_PAD_GPIO_IO16__GPT_MUX_INOUT0                 0x0050 0x0354 0x06fc 0x05 0x01
+#define IMX94_PAD_GPIO_IO16__FLEXPWM4_PWMA0                 0x0050 0x0354 0x06d4 0x06 0x00
+#define IMX94_PAD_GPIO_IO16__XBAR1_XBAR_INOUT30             0x0050 0x0354 0x08b0 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO17__GPIO2_IO17                     0x0054 0x0358 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO17__LPI2C3_SCL                     0x0054 0x0358 0x072c 0x01 0x00
+#define IMX94_PAD_GPIO_IO17__CAN3_RX                        0x0054 0x0358 0x0680 0x02 0x00
+#define IMX94_PAD_GPIO_IO17__LPI2C6_HREQ                    0x0054 0x0358 0x0744 0x03 0x00
+#define IMX94_PAD_GPIO_IO17__LPUART11_RX                    0x0054 0x0358 0x0798 0x04 0x00
+#define IMX94_PAD_GPIO_IO17__GPT_MUX_INOUT3                 0x0054 0x0358 0x0704 0x05 0x01
+#define IMX94_PAD_GPIO_IO17__FLEXPWM4_PWMB0                 0x0054 0x0358 0x06e4 0x06 0x00
+#define IMX94_PAD_GPIO_IO17__XBAR1_XBAR_INOUT31             0x0054 0x0358 0x08b4 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO18__GPIO2_IO18                     0x0058 0x035c 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO18__LPI2C4_SDA                     0x0058 0x035c 0x0738 0x01 0x00
+#define IMX94_PAD_GPIO_IO18__LPUART10_TX                    0x0058 0x035c 0x0794 0x02 0x00
+#define IMX94_PAD_GPIO_IO18__LPI2C7_HREQ                    0x0058 0x035c 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO18__LPUART11_CTS_B                 0x0058 0x035c 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO18__GPT_MUX_INOUT6                 0x0058 0x035c 0x0710 0x05 0x01
+#define IMX94_PAD_GPIO_IO18__FLEXPWM4_PWMA1                 0x0058 0x035c 0x06d8 0x06 0x00
+#define IMX94_PAD_GPIO_IO18__XBAR1_XBAR_INOUT32             0x0058 0x035c 0x08b8 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO19__GPIO2_IO19                     0x005c 0x0360 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO19__LPI2C4_SCL                     0x005c 0x0360 0x0734 0x01 0x00
+#define IMX94_PAD_GPIO_IO19__LPUART10_RX                    0x005c 0x0360 0x0790 0x02 0x00
+#define IMX94_PAD_GPIO_IO19__LPI2C8_HREQ                    0x005c 0x0360 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO19__LPUART11_RTS_B                 0x005c 0x0360 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO19__GPT_MUX_INOUT9                 0x005c 0x0360 0x071c 0x05 0x01
+#define IMX94_PAD_GPIO_IO19__FLEXPWM4_PWMB1                 0x005c 0x0360 0x06e8 0x06 0x00
+#define IMX94_PAD_GPIO_IO19__XBAR1_XBAR_INOUT33             0x005c 0x0360 0x08bc 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO20__GPIO2_IO20                     0x0060 0x0364 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B                 0x0060 0x0364 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO20__LPUART6_TX                     0x0060 0x0364 0x07cc 0x02 0x01
+#define IMX94_PAD_GPIO_IO20__LPI2C8_SDA                     0x0060 0x0364 0x075c 0x03 0x02
+#define IMX94_PAD_GPIO_IO20__LPSPI4_PCS2                    0x0060 0x0364 0x076c 0x04 0x00
+#define IMX94_PAD_GPIO_IO20__LPSPI3_PCS1                    0x0060 0x0364 0x0768 0x05 0x01
+#define IMX94_PAD_GPIO_IO20__FLEXPWM4_PWMA2                 0x0060 0x0364 0x06dc 0x06 0x00
+#define IMX94_PAD_GPIO_IO20__XBAR1_XBAR_INOUT34             0x0060 0x0364 0x08c0 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO21__GPIO2_IO21                     0x0064 0x0368 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO21__SAI2_TX_BCLK                   0x0064 0x0368 0x07f8 0x01 0x00
+#define IMX94_PAD_GPIO_IO21__LPUART6_RX                     0x0064 0x0368 0x07c8 0x02 0x01
+#define IMX94_PAD_GPIO_IO21__LPI2C8_SCL                     0x0064 0x0368 0x0758 0x03 0x02
+#define IMX94_PAD_GPIO_IO21__LPSPI4_PCS1                    0x0064 0x0368 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO21__LPI2C3_HREQ                    0x0064 0x0368 0x0728 0x05 0x00
+#define IMX94_PAD_GPIO_IO21__FLEXPWM4_PWMB2                 0x0064 0x0368 0x06ec 0x06 0x00
+#define IMX94_PAD_GPIO_IO21__XBAR1_XBAR_INOUT35             0x0064 0x0368 0x08c4 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO22__GPIO2_IO22                     0x0068 0x036c 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO22__SAI2_MCLK                      0x0068 0x036c 0x07e8 0x01 0x00
+#define IMX94_PAD_GPIO_IO22__LPUART6_CTS_B                  0x0068 0x036c 0x07c4 0x02 0x01
+#define IMX94_PAD_GPIO_IO22__XBAR1_XBAR_INOUT9              0x0068 0x036c 0x0880 0x03 0x00
+#define IMX94_PAD_GPIO_IO22__LPSPI4_PCS0                    0x0068 0x036c 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO22__FLEXPWM3_PWMA3                 0x0068 0x036c 0x06b4 0x05 0x00
+#define IMX94_PAD_GPIO_IO22__FLEXPWM4_PWMA3                 0x0068 0x036c 0x06e0 0x06 0x00
+#define IMX94_PAD_GPIO_IO22__SINC4_EMCLK0                   0x0068 0x036c 0x082c 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO23__GPIO2_IO23                     0x006c 0x0370 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO23__PCIE2_CLKREQ_B                 0x006c 0x0370 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO23__LPUART6_RTS_B                  0x006c 0x0370 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO23__XBAR1_XBAR_INOUT10             0x006c 0x0370 0x0884 0x03 0x00
+#define IMX94_PAD_GPIO_IO23__LPSPI4_SIN                     0x006c 0x0370 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO23__FLEXPWM3_PWMB3                 0x006c 0x0370 0x06c4 0x05 0x00
+#define IMX94_PAD_GPIO_IO23__FLEXPWM4_PWMB3                 0x006c 0x0370 0x06f0 0x06 0x00
+#define IMX94_PAD_GPIO_IO23__SINC4_EMBIT0                   0x006c 0x0370 0x0820 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO24__GPIO2_IO24                     0x0070 0x0374 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO24__SAI2_RX_BCLK                   0x0070 0x0374 0x07ec 0x01 0x00
+#define IMX94_PAD_GPIO_IO24__LPUART11_TX                    0x0070 0x0374 0x079c 0x02 0x01
+#define IMX94_PAD_GPIO_IO24__LPI2C3_HREQ                    0x0070 0x0374 0x0728 0x03 0x01
+#define IMX94_PAD_GPIO_IO24__LPSPI4_SOUT                    0x0070 0x0374 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO24__SINC_FILTER_GLUE2_BREAK        0x0070 0x0374 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO24__FLEXPWM4_PWMX0                 0x0070 0x0374 0x06f4 0x06 0x00
+#define IMX94_PAD_GPIO_IO24__XBAR1_XBAR_INOUT36             0x0070 0x0374 0x08c8 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO25__GPIO2_IO25                     0x0074 0x0378 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO25__SAI2_RX_SYNC                   0x0074 0x0378 0x07f4 0x01 0x00
+#define IMX94_PAD_GPIO_IO25__LPUART11_RX                    0x0074 0x0378 0x0798 0x02 0x01
+#define IMX94_PAD_GPIO_IO25__LPI2C4_HREQ                    0x0074 0x0378 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO25__LPSPI4_SCK                     0x0074 0x0378 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO25__SINC_FILTER_GLUE1_BREAK        0x0074 0x0378 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO25__FLEXPWM4_PWMX1                 0x0074 0x0378 0x06f8 0x06 0x00
+#define IMX94_PAD_GPIO_IO25__XBAR1_XBAR_INOUT37             0x0074 0x0378 0x08cc 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO26__GPIO2_IO26                     0x0078 0x037c 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO26__LPI2C5_SCL                     0x0078 0x037c 0x073c 0x01 0x01
+#define IMX94_PAD_GPIO_IO26__LPUART12_TX                    0x0078 0x037c 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO26__GPT_MUX_INOUT4                 0x0078 0x037c 0x0708 0x03 0x01
+#define IMX94_PAD_GPIO_IO26__FLEXIO1_3_1_FLEXIO0            0x0078 0x037c 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO26__SAI2_RX_DATA0                  0x0078 0x037c 0x07f0 0x05 0x00
+#define IMX94_PAD_GPIO_IO26__FLEXPWM4_PWMX2                 0x0078 0x037c 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO26__XBAR1_XBAR_INOUT38             0x0078 0x037c 0x08d0 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO27__GPIO2_IO27                     0x007c 0x0380 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO27__LPI2C5_SDA                     0x007c 0x0380 0x0740 0x01 0x01
+#define IMX94_PAD_GPIO_IO27__LPUART12_RX                    0x007c 0x0380 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO27__GPT_MUX_INOUT5                 0x007c 0x0380 0x070c 0x03 0x01
+#define IMX94_PAD_GPIO_IO27__FLEXIO1_3_1_FLEXIO1            0x007c 0x0380 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO27__SAI2_TX_DATA0                  0x007c 0x0380 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO27__FLEXPWM4_PWMX3                 0x007c 0x0380 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO27__SINC4_MOD_CLK0                 0x007c 0x0380 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO28__GPIO2_IO28                     0x0080 0x0384 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO28__LPI2C6_SCL                     0x0080 0x0384 0x0748 0x01 0x02
+#define IMX94_PAD_GPIO_IO28__LPUART12_CTS_B                 0x0080 0x0384 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO28__GPT_MUX_INOUT7                 0x0080 0x0384 0x0714 0x03 0x01
+#define IMX94_PAD_GPIO_IO28__FLEXIO1_3_1_FLEXIO2            0x0080 0x0384 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO28__SAI2_TX_SYNC                   0x0080 0x0384 0x07fc 0x05 0x00
+#define IMX94_PAD_GPIO_IO28__FLEXPWM1_PWMX2                 0x0080 0x0384 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO28__XBAR1_XBAR_INOUT4              0x0080 0x0384 0x086c 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO29__GPIO2_IO29                     0x0084 0x0388 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO29__LPI2C6_SDA                     0x0084 0x0388 0x074c 0x01 0x02
+#define IMX94_PAD_GPIO_IO29__LPUART12_RTS_B                 0x0084 0x0388 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO29__I3C2_SDA                       0x0084 0x0388 0x0724 0x03 0x01
+#define IMX94_PAD_GPIO_IO29__FLEXIO1_3_1_FLEXIO3            0x0084 0x0388 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO29__FLEXPWM3_PWMX0                 0x0084 0x0388 0x06c8 0x05 0x00
+#define IMX94_PAD_GPIO_IO29__FLEXPWM1_PWMX3                 0x0084 0x0388 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO29__XBAR1_XBAR_INOUT5              0x0084 0x0388 0x0870 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO30__GPIO2_IO30                     0x0088 0x038c 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO30__LPIT2_TRIGGER0                 0x0088 0x038c 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO30__LPUART3_TX                     0x0088 0x038c 0x07a8 0x02 0x00
+#define IMX94_PAD_GPIO_IO30__I3C2_PUR                       0x0088 0x038c 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO30__FLEXIO1_3_1_FLEXIO4            0x0088 0x038c 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO30__I3C2_PUR_B                     0x0088 0x038c 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO30__FLEXPWM2_PWMX2                 0x0088 0x038c 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO30__XBAR1_XBAR_INOUT6              0x0088 0x038c 0x0874 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO31__GPIO2_IO31                     0x008c 0x0390 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO31__LPIT2_TRIGGER1                 0x008c 0x0390 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO31__LPUART3_RX                     0x008c 0x0390 0x07a4 0x02 0x00
+#define IMX94_PAD_GPIO_IO31__I3C2_SCL                       0x008c 0x0390 0x0720 0x03 0x01
+#define IMX94_PAD_GPIO_IO31__FLEXIO1_3_1_FLEXIO5            0x008c 0x0390 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO31__FLEXPWM3_PWMX1                 0x008c 0x0390 0x06cc 0x05 0x00
+#define IMX94_PAD_GPIO_IO31__FLEXPWM2_PWMX3                 0x008c 0x0390 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO31__XBAR1_XBAR_INOUT7              0x008c 0x0390 0x0878 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO32__GPIO3_IO0                      0x0090 0x0394 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO32__LPIT3_TRIGGER0                 0x0090 0x0394 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO32__LPUART7_TX                     0x0090 0x0394 0x07d4 0x02 0x01
+#define IMX94_PAD_GPIO_IO32__GPT_MUX_INOUT8                 0x0090 0x0394 0x0718 0x03 0x01
+#define IMX94_PAD_GPIO_IO32__FLEXIO1_3_1_FLEXIO6            0x0090 0x0394 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO32__FLEXPWM3_PWMA0                 0x0090 0x0394 0x06a8 0x05 0x00
+#define IMX94_PAD_GPIO_IO32__SINC_FILTER_GLUE2_BREAK        0x0090 0x0394 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO32__XBAR1_XBAR_INOUT8              0x0090 0x0394 0x087c 0x07 0x01
+
+#define IMX94_PAD_GPIO_IO33__GPIO3_IO1                      0x0094 0x0398 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO33__LPIT3_TRIGGER1                 0x0094 0x0398 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO33__LPUART7_RX                     0x0094 0x0398 0x07d0 0x02 0x01
+#define IMX94_PAD_GPIO_IO33__GPT_MUX_INOUT1                 0x0094 0x0398 0x0700 0x03 0x01
+#define IMX94_PAD_GPIO_IO33__FLEXIO1_3_1_FLEXIO7            0x0094 0x0398 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO33__FLEXPWM3_PWMB0                 0x0094 0x0398 0x06b8 0x05 0x00
+#define IMX94_PAD_GPIO_IO33__SINC_FILTER_GLUE1_BREAK        0x0094 0x0398 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO33__XBAR1_XBAR_INOUT9              0x0094 0x0398 0x0880 0x07 0x01
+
+#define IMX94_PAD_GPIO_IO34__GPIO3_IO2                      0x0098 0x039c 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO34__LPI2C7_SDA                     0x0098 0x039c 0x0754 0x01 0x02
+#define IMX94_PAD_GPIO_IO34__CAN2_TX                        0x0098 0x039c 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO34__ECAT_SDA                       0x0098 0x039c 0x062c 0x03 0x01
+#define IMX94_PAD_GPIO_IO34__FLEXIO1_3_1_FLEXIO8            0x0098 0x039c 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO34__FLEXPWM3_PWMA1                 0x0098 0x039c 0x06ac 0x05 0x00
+#define IMX94_PAD_GPIO_IO34__FLEXPWM1_PWMX0                 0x0098 0x039c 0x0698 0x06 0x00
+#define IMX94_PAD_GPIO_IO34__XBAR1_XBAR_INOUT10             0x0098 0x039c 0x0884 0x07 0x01
+
+#define IMX94_PAD_GPIO_IO35__GPIO3_IO3                      0x009c 0x03a0 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO35__LPI2C7_SCL                     0x009c 0x03a0 0x0750 0x01 0x02
+#define IMX94_PAD_GPIO_IO35__CAN2_RX                        0x009c 0x03a0 0x067c 0x02 0x01
+#define IMX94_PAD_GPIO_IO35__ECAT_SCL                       0x009c 0x03a0 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO35__FLEXIO1_3_1_FLEXIO9            0x009c 0x03a0 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO35__FLEXPWM3_PWMB1                 0x009c 0x03a0 0x06bc 0x05 0x00
+#define IMX94_PAD_GPIO_IO35__FLEXPWM1_PWMX1                 0x009c 0x03a0 0x069c 0x06 0x00
+#define IMX94_PAD_GPIO_IO35__XBAR1_XBAR_INOUT11             0x009c 0x03a0 0x0888 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO36__USDHC2_WP                      0x00a0 0x03a4 0x0854 0x03 0x01
+#define IMX94_PAD_GPIO_IO36__FLEXIO1_3_1_FLEXIO10           0x00a0 0x03a4 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO36__FLEXPWM3_PWMA2                 0x00a0 0x03a4 0x06b0 0x05 0x00
+#define IMX94_PAD_GPIO_IO36__FLEXPWM2_PWMX0                 0x00a0 0x03a4 0x06a0 0x06 0x00
+#define IMX94_PAD_GPIO_IO36__XBAR1_XBAR_INOUT12             0x00a0 0x03a4 0x088c 0x07 0x00
+#define IMX94_PAD_GPIO_IO36__GPIO3_IO4                      0x00a0 0x03a4 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO36__LPI2C8_SDA                     0x00a0 0x03a4 0x075c 0x01 0x03
+#define IMX94_PAD_GPIO_IO36__CAN4_TX                        0x00a0 0x03a4 0x0000 0x02 0x00
+
+#define IMX94_PAD_GPIO_IO37__GPIO3_IO5                      0x00a4 0x03a8 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO37__LPI2C8_SCL                     0x00a4 0x03a8 0x0758 0x01 0x03
+#define IMX94_PAD_GPIO_IO37__CAN4_RX                        0x00a4 0x03a8 0x0684 0x02 0x00
+#define IMX94_PAD_GPIO_IO37__LPI2C5_HREQ                    0x00a4 0x03a8 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO37__FLEXIO1_3_1_FLEXIO11           0x00a4 0x03a8 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO37__FLEXPWM3_PWMB2                 0x00a4 0x03a8 0x06c0 0x05 0x00
+#define IMX94_PAD_GPIO_IO37__FLEXPWM2_PWMX1                 0x00a4 0x03a8 0x06a4 0x06 0x00
+#define IMX94_PAD_GPIO_IO37__XBAR1_XBAR_INOUT13             0x00a4 0x03a8 0x0890 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO38__GPIO3_IO6                      0x00a8 0x03ac 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO38__NETC_1588MUX_INOUT0            0x00a8 0x03ac 0x064c 0x01 0x00
+#define IMX94_PAD_GPIO_IO38__LPI2C3_SDA                     0x00a8 0x03ac 0x0730 0x02 0x01
+#define IMX94_PAD_GPIO_IO38__LPIT3_TRIGGER2                 0x00a8 0x03ac 0x0764 0x03 0x00
+#define IMX94_PAD_GPIO_IO38__FLEXIO1_3_1_FLEXIO12           0x00a8 0x03ac 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO38__LPUART3_CTS_B                  0x00a8 0x03ac 0x07a0 0x05 0x00
+#define IMX94_PAD_GPIO_IO38__FLEXPWM3_PWMX0                 0x00a8 0x03ac 0x06c8 0x06 0x01
+#define IMX94_PAD_GPIO_IO38__XBAR1_XBAR_INOUT14             0x00a8 0x03ac 0x0894 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO39__GPIO3_IO7                      0x00ac 0x03b0 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO39__NETC_1588MUX_INOUT1            0x00ac 0x03b0 0x0650 0x01 0x00
+#define IMX94_PAD_GPIO_IO39__LPI2C3_SCL                     0x00ac 0x03b0 0x072c 0x02 0x01
+#define IMX94_PAD_GPIO_IO39__LPIT2_TRIGGER2                 0x00ac 0x03b0 0x0760 0x03 0x00
+#define IMX94_PAD_GPIO_IO39__FLEXIO1_3_1_FLEXIO13           0x00ac 0x03b0 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO39__LPUART3_RTS_B                  0x00ac 0x03b0 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO39__FLEXPWM3_PWMX1                 0x00ac 0x03b0 0x06cc 0x06 0x01
+#define IMX94_PAD_GPIO_IO39__XBAR1_XBAR_INOUT15             0x00ac 0x03b0 0x0898 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO40__GPIO3_IO8                      0x00b0 0x03b4 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO40__NETC_1588MUX_INOUT2            0x00b0 0x03b4 0x0654 0x01 0x00
+#define IMX94_PAD_GPIO_IO40__LPI2C7_SDA                     0x00b0 0x03b4 0x0754 0x02 0x03
+#define IMX94_PAD_GPIO_IO40__LPUART4_TX                     0x00b0 0x03b4 0x07b4 0x03 0x01
+#define IMX94_PAD_GPIO_IO40__FLEXIO1_3_1_FLEXIO14           0x00b0 0x03b4 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO40__FLEXPWM3_PWMX2                 0x00b0 0x03b4 0x06d0 0x05 0x00
+#define IMX94_PAD_GPIO_IO40__FLEXPWM4_PWMX0                 0x00b0 0x03b4 0x06f4 0x06 0x01
+#define IMX94_PAD_GPIO_IO40__XBAR1_XBAR_INOUT16             0x00b0 0x03b4 0x089c 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO41__GPIO3_IO9                      0x00b4 0x03b8 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO41__NETC_1588MUX_INOUT3            0x00b4 0x03b8 0x0658 0x01 0x00
+#define IMX94_PAD_GPIO_IO41__LPI2C7_SCL                     0x00b4 0x03b8 0x0750 0x02 0x03
+#define IMX94_PAD_GPIO_IO41__LPUART4_RX                     0x00b4 0x03b8 0x07b0 0x03 0x01
+#define IMX94_PAD_GPIO_IO41__FLEXIO1_3_1_FLEXIO15           0x00b4 0x03b8 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO41__LPI2C6_HREQ                    0x00b4 0x03b8 0x0744 0x05 0x01
+#define IMX94_PAD_GPIO_IO41__FLEXPWM4_PWMX1                 0x00b4 0x03b8 0x06f8 0x06 0x01
+#define IMX94_PAD_GPIO_IO41__XBAR1_XBAR_INOUT17             0x00b4 0x03b8 0x08a0 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO42__GPIO3_IO10                     0x00b8 0x03bc 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO42__SAI3_TX_BCLK                   0x00b8 0x03bc 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO42__PDM_BIT_STREAM2                0x00b8 0x03bc 0x0618 0x02 0x01
+#define IMX94_PAD_GPIO_IO42__XBAR1_XBAR_INOUT11             0x00b8 0x03bc 0x0888 0x03 0x01
+#define IMX94_PAD_GPIO_IO42__LPUART3_TX                     0x00b8 0x03bc 0x07a8 0x04 0x01
+#define IMX94_PAD_GPIO_IO42__LPSPI4_PCS2                    0x00b8 0x03bc 0x076c 0x05 0x01
+#define IMX94_PAD_GPIO_IO42__LPUART4_CTS_B                  0x00b8 0x03bc 0x07ac 0x06 0x00
+#define IMX94_PAD_GPIO_IO42__SINC4_EMCLK1                   0x00b8 0x03bc 0x0830 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO43__GPIO3_IO11                     0x00bc 0x03c0 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO43__SAI3_MCLK                      0x00bc 0x03c0 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO43__XBAR1_XBAR_INOUT12             0x00bc 0x03c0 0x088c 0x03 0x01
+#define IMX94_PAD_GPIO_IO43__LPUART3_RX                     0x00bc 0x03c0 0x07a4 0x04 0x01
+#define IMX94_PAD_GPIO_IO43__LPSPI3_PCS1                    0x00bc 0x03c0 0x0768 0x05 0x02
+#define IMX94_PAD_GPIO_IO43__LPUART4_RTS_B                  0x00bc 0x03c0 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO43__SINC4_EMBIT1                   0x00bc 0x03c0 0x0824 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO44__GPIO3_IO12                     0x00c0 0x03c4 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO44__SAI3_RX_BCLK                   0x00c0 0x03c4 0x0800 0x01 0x00
+#define IMX94_PAD_GPIO_IO44__PDM_BIT_STREAM1                0x00c0 0x03c4 0x0614 0x02 0x01
+#define IMX94_PAD_GPIO_IO44__LPUART9_TX                     0x00c0 0x03c4 0x07e4 0x03 0x00
+#define IMX94_PAD_GPIO_IO44__LPSPI5_PCS0                    0x00c0 0x03c4 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO44__LPI2C3_SDA                     0x00c0 0x03c4 0x0730 0x05 0x02
+#define IMX94_PAD_GPIO_IO44__TPM5_CH2                       0x00c0 0x03c4 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO44__SINC_FILTER_GLUE4_BREAK        0x00c0 0x03c4 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO45__GPIO3_IO13                     0x00c4 0x03c8 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO45__SAI3_RX_SYNC                   0x00c4 0x03c8 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO45__PDM_BIT_STREAM3                0x00c4 0x03c8 0x061c 0x02 0x01
+#define IMX94_PAD_GPIO_IO45__LPUART9_RX                     0x00c4 0x03c8 0x07e0 0x03 0x00
+#define IMX94_PAD_GPIO_IO45__LPSPI5_SIN                     0x00c4 0x03c8 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO45__LPI2C3_SCL                     0x00c4 0x03c8 0x072c 0x05 0x02
+#define IMX94_PAD_GPIO_IO45__TPM6_CH2                       0x00c4 0x03c8 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO45__SAI3_TX_DATA0                  0x00c4 0x03c8 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO46__GPIO3_IO14                     0x00c8 0x03cc 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO46__SAI3_RX_DATA0                  0x00c8 0x03cc 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO46__PDM_BIT_STREAM0                0x00c8 0x03cc 0x0610 0x02 0x01
+#define IMX94_PAD_GPIO_IO46__LPUART9_CTS_B                  0x00c8 0x03cc 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO46__LPSPI5_SOUT                    0x00c8 0x03cc 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO46__LPI2C4_SDA                     0x00c8 0x03cc 0x0738 0x05 0x01
+#define IMX94_PAD_GPIO_IO46__TPM3_CH1                       0x00c8 0x03cc 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO46__EWM_OUT_B                      0x00c8 0x03cc 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO47__GPIO3_IO15                     0x00cc 0x03d0 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO47__SAI3_TX_DATA0                  0x00cc 0x03d0 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO47__PDM_CLK                        0x00cc 0x03d0 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO47__LPUART9_RTS_B                  0x00cc 0x03d0 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO47__LPSPI5_SCK                     0x00cc 0x03d0 0x0000 0x04 0x00
+#define IMX94_PAD_GPIO_IO47__LPI2C4_SCL                     0x00cc 0x03d0 0x0734 0x05 0x01
+#define IMX94_PAD_GPIO_IO47__TPM4_CH1                       0x00cc 0x03d0 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO47__SAI3_RX_BCLK                   0x00cc 0x03d0 0x0800 0x07 0x01
+
+#define IMX94_PAD_GPIO_IO48__GPIO3_IO16                     0x00d0 0x03d4 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO48__USDHC3_CLK                     0x00d0 0x03d4 0x0000 0x01 0x00
+#define IMX94_PAD_GPIO_IO48__CAN5_TX                        0x00d0 0x03d4 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO48__LPUART10_TX                    0x00d0 0x03d4 0x0794 0x03 0x01
+#define IMX94_PAD_GPIO_IO48__TPM5_CH1                       0x00d0 0x03d4 0x0840 0x04 0x00
+#define IMX94_PAD_GPIO_IO48__TPM6_EXTCLK                    0x00d0 0x03d4 0x0850 0x05 0x00
+#define IMX94_PAD_GPIO_IO48__LPI2C5_SDA                     0x00d0 0x03d4 0x0740 0x06 0x02
+#define IMX94_PAD_GPIO_IO48__SINC4_EMCLK2                   0x00d0 0x03d4 0x0834 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO49__GPIO3_IO17                     0x00d4 0x03d8 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO49__USDHC3_CMD                     0x00d4 0x03d8 0x0858 0x01 0x00
+#define IMX94_PAD_GPIO_IO49__CAN5_RX                        0x00d4 0x03d8 0x0688 0x02 0x01
+#define IMX94_PAD_GPIO_IO49__LPUART10_RX                    0x00d4 0x03d8 0x0790 0x03 0x01
+#define IMX94_PAD_GPIO_IO49__TPM6_CH1                       0x00d4 0x03d8 0x0848 0x04 0x00
+#define IMX94_PAD_GPIO_IO49__XBAR1_XBAR_INOUT13             0x00d4 0x03d8 0x0890 0x05 0x01
+#define IMX94_PAD_GPIO_IO49__LPI2C5_SCL                     0x00d4 0x03d8 0x073c 0x06 0x02
+#define IMX94_PAD_GPIO_IO49__SINC4_EMBIT2                   0x00d4 0x03d8 0x0828 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO50__GPIO3_IO18                     0x00d8 0x03dc 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO50__USDHC3_DATA0                   0x00d8 0x03dc 0x085c 0x01 0x00
+#define IMX94_PAD_GPIO_IO50__XBAR1_XBAR_INOUT14             0x00d8 0x03dc 0x0894 0x02 0x01
+#define IMX94_PAD_GPIO_IO50__LPUART10_CTS_B                 0x00d8 0x03dc 0x078c 0x03 0x01
+#define IMX94_PAD_GPIO_IO50__TPM3_CH3                       0x00d8 0x03dc 0x0838 0x04 0x00
+#define IMX94_PAD_GPIO_IO50__JTAG_MUX_TDO                   0x00d8 0x03dc 0x0000 0x05 0x00
+#define IMX94_PAD_GPIO_IO50__LPSPI6_PCS1                    0x00d8 0x03dc 0x0774 0x06 0x00
+#define IMX94_PAD_GPIO_IO50__SINC4_EMCLK3                   0x00d8 0x03dc 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO51__GPIO3_IO19                     0x00dc 0x03e0 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO51__USDHC3_DATA1                   0x00dc 0x03e0 0x0860 0x01 0x00
+#define IMX94_PAD_GPIO_IO51__CAN2_TX                        0x00dc 0x03e0 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO51__LPUART10_RTS_B                 0x00dc 0x03e0 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO51__TPM4_CH3                       0x00dc 0x03e0 0x083c 0x04 0x00
+#define IMX94_PAD_GPIO_IO51__JTAG_MUX_TCK                   0x00dc 0x03e0 0x0928 0x05 0x01
+#define IMX94_PAD_GPIO_IO51__LPSPI7_PCS1                    0x00dc 0x03e0 0x0778 0x06 0x00
+#define IMX94_PAD_GPIO_IO51__SINC4_EMBIT3                   0x00dc 0x03e0 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO52__GPIO3_IO20                     0x00e0 0x03e4 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO52__USDHC3_DATA2                   0x00e0 0x03e4 0x0864 0x01 0x00
+#define IMX94_PAD_GPIO_IO52__PDM_BIT_STREAM1                0x00e0 0x03e4 0x0614 0x02 0x02
+#define IMX94_PAD_GPIO_IO52__LPSPI4_PCS2                    0x00e0 0x03e4 0x076c 0x03 0x02
+#define IMX94_PAD_GPIO_IO52__TPM5_CH3                       0x00e0 0x03e4 0x0844 0x04 0x00
+#define IMX94_PAD_GPIO_IO52__JTAG_MUX_TDI                   0x00e0 0x03e4 0x092c 0x05 0x01
+#define IMX94_PAD_GPIO_IO52__LPSPI8_PCS1                    0x00e0 0x03e4 0x077c 0x06 0x00
+#define IMX94_PAD_GPIO_IO52__SAI3_TX_SYNC                   0x00e0 0x03e4 0x0804 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO53__GPIO3_IO21                     0x00e4 0x03e8 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO53__USDHC3_DATA3                   0x00e4 0x03e8 0x0868 0x01 0x00
+#define IMX94_PAD_GPIO_IO53__CAN2_RX                        0x00e4 0x03e8 0x067c 0x02 0x02
+#define IMX94_PAD_GPIO_IO53__LPSPI3_PCS1                    0x00e4 0x03e8 0x0768 0x03 0x03
+#define IMX94_PAD_GPIO_IO53__TPM6_CH3                       0x00e4 0x03e8 0x084c 0x04 0x00
+#define IMX94_PAD_GPIO_IO53__JTAG_MUX_TMS                   0x00e4 0x03e8 0x0930 0x05 0x01
+#define IMX94_PAD_GPIO_IO53__LPSPI5_PCS1                    0x00e4 0x03e8 0x0770 0x06 0x00
+#define IMX94_PAD_GPIO_IO53__SINC4_MOD_CLK1                 0x00e4 0x03e8 0x0000 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO54__GPIO3_IO22                     0x00e8 0x03ec 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO54__NETC_1588MUX_INOUT4            0x00e8 0x03ec 0x065c 0x01 0x00
+#define IMX94_PAD_GPIO_IO54__CAN4_TX                        0x00e8 0x03ec 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO54__LPIT3_TRIGGER2                 0x00e8 0x03ec 0x0764 0x03 0x01
+#define IMX94_PAD_GPIO_IO54__LPSPI6_PCS1                    0x00e8 0x03ec 0x0774 0x04 0x01
+#define IMX94_PAD_GPIO_IO54__TPM3_CH3                       0x00e8 0x03ec 0x0838 0x05 0x01
+#define IMX94_PAD_GPIO_IO54__SINC3_EMCLK0                   0x00e8 0x03ec 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO54__XBAR1_XBAR_INOUT18             0x00e8 0x03ec 0x08a4 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO55__GPIO3_IO23                     0x00ec 0x03f0 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO55__NETC_1588MUX_INOUT5            0x00ec 0x03f0 0x0660 0x01 0x00
+#define IMX94_PAD_GPIO_IO55__CAN4_RX                        0x00ec 0x03f0 0x0684 0x02 0x01
+#define IMX94_PAD_GPIO_IO55__LPIT2_TRIGGER2                 0x00ec 0x03f0 0x0760 0x03 0x01
+#define IMX94_PAD_GPIO_IO55__LPSPI7_PCS1                    0x00ec 0x03f0 0x0778 0x04 0x01
+#define IMX94_PAD_GPIO_IO55__TPM4_CH3                       0x00ec 0x03f0 0x083c 0x05 0x01
+#define IMX94_PAD_GPIO_IO55__SINC3_EMBIT0                   0x00ec 0x03f0 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO55__XBAR1_XBAR_INOUT19             0x00ec 0x03f0 0x08a8 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO56__GPIO3_IO24                     0x00f0 0x03f4 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO56__NETC_1588MUX_INOUT6            0x00f0 0x03f4 0x0664 0x01 0x00
+#define IMX94_PAD_GPIO_IO56__CAN5_TX                        0x00f0 0x03f4 0x0000 0x02 0x00
+#define IMX94_PAD_GPIO_IO56__LPIT3_TRIGGER3                 0x00f0 0x03f4 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO56__LPSPI8_PCS1                    0x00f0 0x03f4 0x077c 0x04 0x01
+#define IMX94_PAD_GPIO_IO56__SAI3_TX_SYNC                   0x00f0 0x03f4 0x0804 0x05 0x01
+#define IMX94_PAD_GPIO_IO56__SINC3_EMCLK1                   0x00f0 0x03f4 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO56__XBAR1_XBAR_INOUT20             0x00f0 0x03f4 0x08ac 0x07 0x00
+
+#define IMX94_PAD_GPIO_IO57__GPIO3_IO25                     0x00f4 0x03f8 0x0000 0x00 0x00
+#define IMX94_PAD_GPIO_IO57__NETC_1588MUX_INOUT7            0x00f4 0x03f8 0x0668 0x01 0x00
+#define IMX94_PAD_GPIO_IO57__CAN5_RX                        0x00f4 0x03f8 0x0688 0x02 0x02
+#define IMX94_PAD_GPIO_IO57__LPIT2_TRIGGER3                 0x00f4 0x03f8 0x0000 0x03 0x00
+#define IMX94_PAD_GPIO_IO57__LPSPI5_PCS1                    0x00f4 0x03f8 0x0770 0x04 0x01
+#define IMX94_PAD_GPIO_IO57__TPM6_CH3                       0x00f4 0x03f8 0x084c 0x05 0x01
+#define IMX94_PAD_GPIO_IO57__SINC3_EMBIT1                   0x00f4 0x03f8 0x0000 0x06 0x00
+#define IMX94_PAD_GPIO_IO57__ENET_REF_CLK_ROOT              0x00f4 0x03f8 0x0000 0x07 0x00
+
+#define IMX94_PAD_CCM_CLKO1__CLKO_1                         0x00f8 0x03fc 0x0000 0x00 0x00
+#define IMX94_PAD_CCM_CLKO1__NETC_1588MUX_INOUT8            0x00f8 0x03fc 0x066c 0x01 0x00
+#define IMX94_PAD_CCM_CLKO1__LPUART9_TX                     0x00f8 0x03fc 0x07e4 0x02 0x01
+#define IMX94_PAD_CCM_CLKO1__ECAT_LED_RUN                   0x00f8 0x03fc 0x0000 0x03 0x00
+#define IMX94_PAD_CCM_CLKO1__TPM6_EXTCLK                    0x00f8 0x03fc 0x0850 0x04 0x01
+#define IMX94_PAD_CCM_CLKO1__GPIO4_IO0                      0x00f8 0x03fc 0x0000 0x05 0x00
+#define IMX94_PAD_CCM_CLKO1__SINC3_EMCLK2                   0x00f8 0x03fc 0x0000 0x06 0x00
+#define IMX94_PAD_CCM_CLKO1__XBAR1_XBAR_INOUT22             0x00f8 0x03fc 0x0000 0x07 0x00
+
+#define IMX94_PAD_CCM_CLKO2__CLKO_2                         0x00fc 0x0400 0x0000 0x00 0x00
+#define IMX94_PAD_CCM_CLKO2__NETC_1588MUX_INOUT9            0x00fc 0x0400 0x0670 0x01 0x00
+#define IMX94_PAD_CCM_CLKO2__LPUART9_RX                     0x00fc 0x0400 0x07e0 0x02 0x01
+#define IMX94_PAD_CCM_CLKO2__ECAT_LED_ERR                   0x00fc 0x0400 0x0000 0x03 0x00
+#define IMX94_PAD_CCM_CLKO2__TPM5_CH1                       0x00fc 0x0400 0x0840 0x04 0x01
+#define IMX94_PAD_CCM_CLKO2__GPIO4_IO1                      0x00fc 0x0400 0x0000 0x05 0x00
+#define IMX94_PAD_CCM_CLKO2__SINC3_EMBIT2                   0x00fc 0x0400 0x0000 0x06 0x00
+#define IMX94_PAD_CCM_CLKO2__XBAR1_XBAR_INOUT23             0x00fc 0x0400 0x0000 0x07 0x00
+
+#define IMX94_PAD_CCM_CLKO3__CLKO_3                         0x0100 0x0404 0x0000 0x00 0x00
+#define IMX94_PAD_CCM_CLKO3__NETC_1588MUX_INOUT10           0x0100 0x0404 0x0674 0x01 0x00
+#define IMX94_PAD_CCM_CLKO3__CAN3_TX                        0x0100 0x0404 0x0000 0x02 0x00
+#define IMX94_PAD_CCM_CLKO3__ECAT_LED_STATE_RUN             0x0100 0x0404 0x0000 0x03 0x00
+#define IMX94_PAD_CCM_CLKO3__TPM6_CH1                       0x0100 0x0404 0x0848 0x04 0x01
+#define IMX94_PAD_CCM_CLKO3__GPIO4_IO2                      0x0100 0x0404 0x0000 0x05 0x00
+#define IMX94_PAD_CCM_CLKO3__SINC3_EMCLK3                   0x0100 0x0404 0x0000 0x06 0x00
+#define IMX94_PAD_CCM_CLKO3__ENET_REF_CLK_ROOT              0x0100 0x0404 0x0000 0x07 0x00
+
+#define IMX94_PAD_CCM_CLKO4__CLKO_4                         0x0104 0x0408 0x0000 0x00 0x00
+#define IMX94_PAD_CCM_CLKO4__NETC_1588MUX_INOUT11           0x0104 0x0408 0x0000 0x01 0x00
+#define IMX94_PAD_CCM_CLKO4__CAN3_RX                        0x0104 0x0408 0x0680 0x02 0x01
+#define IMX94_PAD_CCM_CLKO4__ECAT_RESET_OUT                 0x0104 0x0408 0x0000 0x03 0x00
+#define IMX94_PAD_CCM_CLKO4__TPM5_CH3                       0x0104 0x0408 0x0844 0x04 0x01
+#define IMX94_PAD_CCM_CLKO4__GPIO4_IO3                      0x0104 0x0408 0x0000 0x05 0x00
+#define IMX94_PAD_CCM_CLKO4__SINC3_EMBIT3                   0x0104 0x0408 0x0000 0x06 0x00
+#define IMX94_PAD_CCM_CLKO4__XBAR1_XBAR_INOUT25             0x0104 0x0408 0x0000 0x07 0x00
+
+#define IMX94_PAD_ETH2_MDC_GPIO1__NETC_EMDC                 0x0108 0x040c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_MDC_GPIO1__NETC_ETH2_SLV_MDC         0x0108 0x040c 0x0000 0x01 0x00
+#define IMX94_PAD_ETH2_MDC_GPIO1__I3C2_SCL                  0x0108 0x040c 0x0720 0x02 0x02
+#define IMX94_PAD_ETH2_MDC_GPIO1__USB1_OTG_ID               0x0108 0x040c 0x0000 0x03 0x00
+#define IMX94_PAD_ETH2_MDC_GPIO1__FLEXIO2_FLEXIO0           0x0108 0x040c 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_MDC_GPIO1__GPIO6_IO0                 0x0108 0x040c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_MDC_GPIO1__FLEXPWM2_PWMX0            0x0108 0x040c 0x06a0 0x06 0x01
+#define IMX94_PAD_ETH2_MDC_GPIO1__XBAR1_XBAR_INOUT30        0x0108 0x040c 0x08b0 0x07 0x01
+
+#define IMX94_PAD_ETH2_MDIO_GPIO2__NETC_EMDIO               0x010c 0x0410 0x0678 0x00 0x00
+#define IMX94_PAD_ETH2_MDIO_GPIO2__NETC_ETH2_SLV_MDIO       0x010c 0x0410 0x0000 0x01 0x00
+#define IMX94_PAD_ETH2_MDIO_GPIO2__I3C2_SDA                 0x010c 0x0410 0x0724 0x02 0x02
+#define IMX94_PAD_ETH2_MDIO_GPIO2__USB1_OTG_PWR             0x010c 0x0410 0x0000 0x03 0x00
+#define IMX94_PAD_ETH2_MDIO_GPIO2__FLEXIO2_FLEXIO1          0x010c 0x0410 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_MDIO_GPIO2__GPIO6_IO1                0x010c 0x0410 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_MDIO_GPIO2__FLEXPWM2_PWMX1           0x010c 0x0410 0x06a4 0x06 0x01
+#define IMX94_PAD_ETH2_MDIO_GPIO2__XBAR1_XBAR_INOUT31       0x010c 0x0410 0x08b4 0x07 0x01
+
+#define IMX94_PAD_ETH2_TXD3__NETC_PINMUX_ETH2_TXD3          0x0110 0x0414 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_TXD3__LPUART3_DCD_B                  0x0110 0x0414 0x0000 0x01 0x00
+#define IMX94_PAD_ETH2_TXD3__CAN2_TX                        0x0110 0x0414 0x0000 0x02 0x00
+#define IMX94_PAD_ETH2_TXD3__USB2_OTG_ID                    0x0110 0x0414 0x0000 0x03 0x00
+#define IMX94_PAD_ETH2_TXD3__FLEXIO2_FLEXIO2                0x0110 0x0414 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_TXD3__GPIO6_IO2                      0x0110 0x0414 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_TXD3__FLEXPWM2_PWMA0                 0x0110 0x0414 0x0000 0x06 0x00
+#define IMX94_PAD_ETH2_TXD3__XBAR1_XBAR_INOUT32             0x0110 0x0414 0x08b8 0x07 0x01
+
+#define IMX94_PAD_ETH2_TXD2__NETC_PINMUX_ETH2_TXD2          0x0114 0x0418 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_TXD2__ETH2_RMII_REF50_CLK            0x0114 0x0418 0x0000 0x01 0x00
+#define IMX94_PAD_ETH2_TXD2__CAN2_RX                        0x0114 0x0418 0x067c 0x02 0x03
+#define IMX94_PAD_ETH2_TXD2__USB2_OTG_OC                    0x0114 0x0418 0x0000 0x03 0x00
+#define IMX94_PAD_ETH2_TXD2__FLEXIO2_FLEXIO3                0x0114 0x0418 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_TXD2__GPIO6_IO3                      0x0114 0x0418 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_TXD2__FLEXPWM2_PWMB0                 0x0114 0x0418 0x0000 0x06 0x00
+#define IMX94_PAD_ETH2_TXD2__XBAR1_XBAR_INOUT33             0x0114 0x0418 0x08bc 0x07 0x01
+
+#define IMX94_PAD_ETH2_TXD1__NETC_PINMUX_ETH2_TXD1          0x0118 0x041c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_TXD1__LPUART3_RTS_B                  0x0118 0x041c 0x0000 0x01 0x00
+#define IMX94_PAD_ETH2_TXD1__ECAT_CLK25                     0x0118 0x041c 0x0000 0x02 0x00
+#define IMX94_PAD_ETH2_TXD1__USB1_OTG_OC                    0x0118 0x041c 0x0000 0x03 0x00
+#define IMX94_PAD_ETH2_TXD1__FLEXIO2_FLEXIO4                0x0118 0x041c 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_TXD1__GPIO6_IO4                      0x0118 0x041c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_TXD1__FLEXPWM2_PWMA1                 0x0118 0x041c 0x0000 0x06 0x00
+#define IMX94_PAD_ETH2_TXD1__XBAR1_XBAR_INOUT34             0x0118 0x041c 0x08c0 0x07 0x01
+
+#define IMX94_PAD_ETH2_TXD0__NETC_PINMUX_ETH2_TXD0          0x011c 0x0420 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_TXD0__LPUART3_TX                     0x011c 0x0420 0x07a8 0x01 0x02
+#define IMX94_PAD_ETH2_TXD0__I3C2_PUR                       0x011c 0x0420 0x0000 0x02 0x00
+#define IMX94_PAD_ETH2_TXD0__I3C2_PUR_B                     0x011c 0x0420 0x0000 0x03 0x00
+#define IMX94_PAD_ETH2_TXD0__FLEXIO2_FLEXIO5                0x011c 0x0420 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_TXD0__GPIO6_IO5                      0x011c 0x0420 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_TXD0__FLEXPWM2_PWMB1                 0x011c 0x0420 0x0000 0x06 0x00
+#define IMX94_PAD_ETH2_TXD0__XBAR1_XBAR_INOUT35             0x011c 0x0420 0x08c4 0x07 0x01
+
+#define IMX94_PAD_ETH2_TX_CTL__NETC_PINMUX_ETH2_TX_CTL      0x0120 0x0424 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_TX_CTL__LPUART3_DTR_B                0x0120 0x0424 0x0000 0x01 0x00
+#define IMX94_PAD_ETH2_TX_CTL__ECAT_LED_RUN                 0x0120 0x0424 0x0000 0x02 0x00
+#define IMX94_PAD_ETH2_TX_CTL__FLEXIO2_FLEXIO6              0x0120 0x0424 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_TX_CTL__GPIO6_IO6                    0x0120 0x0424 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_TX_CTL__FLEXPWM2_PWMA2               0x0120 0x0424 0x0000 0x06 0x00
+#define IMX94_PAD_ETH2_TX_CTL__XBAR1_XBAR_INOUT36           0x0120 0x0424 0x08c8 0x07 0x01
+
+#define IMX94_PAD_ETH2_TX_CLK__NETC_PINMUX_ETH2_TX_CLK      0x0124 0x0428 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_TX_CLK__ECAT_LED_ERR                 0x0124 0x0428 0x0000 0x02 0x00
+#define IMX94_PAD_ETH2_TX_CLK__FLEXIO2_FLEXIO7              0x0124 0x0428 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_TX_CLK__GPIO6_IO7                    0x0124 0x0428 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_TX_CLK__FLEXPWM2_PWMB2               0x0124 0x0428 0x0000 0x06 0x00
+#define IMX94_PAD_ETH2_TX_CLK__XBAR1_XBAR_INOUT37           0x0124 0x0428 0x08cc 0x07 0x01
+
+#define IMX94_PAD_ETH2_RX_CTL__NETC_PINMUX_ETH2_RX_CTL      0x0128 0x042c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_RX_CTL__LPUART3_DSR_B                0x0128 0x042c 0x0000 0x01 0x00
+#define IMX94_PAD_ETH2_RX_CTL__ECAT_LED_STATE_RUN           0x0128 0x042c 0x0000 0x02 0x00
+#define IMX94_PAD_ETH2_RX_CTL__USB2_OTG_PWR                 0x0128 0x042c 0x0000 0x03 0x00
+#define IMX94_PAD_ETH2_RX_CTL__FLEXIO2_FLEXIO8              0x0128 0x042c 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_RX_CTL__GPIO6_IO8                    0x0128 0x042c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_RX_CTL__FLEXPWM2_PWMA3               0x0128 0x042c 0x0000 0x06 0x00
+#define IMX94_PAD_ETH2_RX_CTL__SINC4_EMCLK0                 0x0128 0x042c 0x082c 0x07 0x01
+
+#define IMX94_PAD_ETH2_RX_CLK__NETC_PINMUX_ETH2_RX_CLK      0x012c 0x0430 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_RX_CLK__LPUART3_RIN_B                0x012c 0x0430 0x0000 0x01 0x00
+#define IMX94_PAD_ETH2_RX_CLK__ECAT_RESET_OUT               0x012c 0x0430 0x0000 0x02 0x00
+#define IMX94_PAD_ETH2_RX_CLK__XBAR1_XBAR_INOUT38           0x012c 0x0430 0x08d0 0x03 0x01
+#define IMX94_PAD_ETH2_RX_CLK__FLEXIO2_FLEXIO9              0x012c 0x0430 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_RX_CLK__GPIO6_IO9                    0x012c 0x0430 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_RX_CLK__FLEXPWM2_PWMB3               0x012c 0x0430 0x0000 0x06 0x00
+#define IMX94_PAD_ETH2_RX_CLK__SINC4_EMBIT0                 0x012c 0x0430 0x0820 0x07 0x01
+
+#define IMX94_PAD_ETH2_RXD0__NETC_PINMUX_ETH2_RXD0          0x0130 0x0434 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_RXD0__LPUART3_RX                     0x0130 0x0434 0x07a4 0x01 0x02
+#define IMX94_PAD_ETH2_RXD0__FLEXIO2_FLEXIO10               0x0130 0x0434 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_RXD0__GPIO6_IO10                     0x0130 0x0434 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_RXD0__DIG_ENCODER2_DATA_EN           0x0130 0x0434 0x0000 0x06 0x00
+#define IMX94_PAD_ETH2_RXD0__XBAR1_XBAR_INOUT39             0x0130 0x0434 0x08d4 0x07 0x01
+
+#define IMX94_PAD_ETH2_RXD1__NETC_PINMUX_ETH2_RXD1          0x0134 0x0438 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_RXD1__LPUART3_CTS_B                  0x0134 0x0438 0x07a0 0x01 0x01
+#define IMX94_PAD_ETH2_RXD1__LPTMR2_ALT0                    0x0134 0x0438 0x0780 0x03 0x00
+#define IMX94_PAD_ETH2_RXD1__FLEXIO2_FLEXIO11               0x0134 0x0438 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_RXD1__GPIO6_IO11                     0x0134 0x0438 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_RXD1__DIG_ENCODER2_DATA_CLK          0x0134 0x0438 0x068c 0x06 0x00
+#define IMX94_PAD_ETH2_RXD1__XBAR1_XBAR_INOUT40             0x0134 0x0438 0x08d8 0x07 0x01
+
+#define IMX94_PAD_ETH2_RXD2__NETC_PINMUX_ETH2_RXD2          0x0138 0x043c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_RXD2__LPTMR2_ALT1                    0x0138 0x043c 0x0784 0x03 0x00
+#define IMX94_PAD_ETH2_RXD2__FLEXIO2_FLEXIO12               0x0138 0x043c 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_RXD2__GPIO6_IO12                     0x0138 0x043c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_RXD2__DIG_ENCODER2_DATA_OUT          0x0138 0x043c 0x0000 0x06 0x00
+#define IMX94_PAD_ETH2_RXD2__XBAR1_XBAR_INOUT41             0x0138 0x043c 0x08dc 0x07 0x01
+
+#define IMX94_PAD_ETH2_RXD3__NETC_PINMUX_ETH2_RXD3          0x013c 0x0440 0x0000 0x00 0x00
+#define IMX94_PAD_ETH2_RXD3__LPTMR2_ALT2                    0x013c 0x0440 0x0788 0x03 0x00
+#define IMX94_PAD_ETH2_RXD3__FLEXIO2_FLEXIO13               0x013c 0x0440 0x0000 0x04 0x00
+#define IMX94_PAD_ETH2_RXD3__GPIO6_IO13                     0x013c 0x0440 0x0000 0x05 0x00
+#define IMX94_PAD_ETH2_RXD3__DIG_ENCODER2_DATA_IN           0x013c 0x0440 0x0690 0x06 0x00
+#define IMX94_PAD_ETH2_RXD3__XBAR1_XBAR_INOUT42             0x013c 0x0440 0x08e0 0x07 0x01
+
+#define IMX94_PAD_ETH3_MDC_GPIO1__NETC_EMDC                 0x0140 0x0444 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_MDC_GPIO1__LPUART4_DCD_B             0x0140 0x0444 0x0000 0x01 0x00
+#define IMX94_PAD_ETH3_MDC_GPIO1__NETC_ETH3_SLV_MDC         0x0140 0x0444 0x0000 0x02 0x00
+#define IMX94_PAD_ETH3_MDC_GPIO1__SAI4_TX_SYNC              0x0140 0x0444 0x081c 0x03 0x00
+#define IMX94_PAD_ETH3_MDC_GPIO1__FLEXIO2_FLEXIO14          0x0140 0x0444 0x0000 0x04 0x00
+#define IMX94_PAD_ETH3_MDC_GPIO1__GPIO6_IO14                0x0140 0x0444 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_MDC_GPIO1__FLEXPWM1_PWMX0            0x0140 0x0444 0x0698 0x06 0x01
+#define IMX94_PAD_ETH3_MDC_GPIO1__SINC4_MOD_CLK0            0x0140 0x0444 0x0000 0x07 0x00
+
+#define IMX94_PAD_ETH3_MDIO_GPIO2__NETC_EMDIO               0x0144 0x0448 0x0678 0x00 0x01
+#define IMX94_PAD_ETH3_MDIO_GPIO2__LPUART4_RIN_B            0x0144 0x0448 0x0000 0x01 0x00
+#define IMX94_PAD_ETH3_MDIO_GPIO2__NETC_ETH3_SLV_MDIO       0x0144 0x0448 0x0000 0x02 0x00
+#define IMX94_PAD_ETH3_MDIO_GPIO2__SAI4_TX_BCLK             0x0144 0x0448 0x0818 0x03 0x00
+#define IMX94_PAD_ETH3_MDIO_GPIO2__FLEXIO2_FLEXIO15         0x0144 0x0448 0x0000 0x04 0x00
+#define IMX94_PAD_ETH3_MDIO_GPIO2__GPIO6_IO15               0x0144 0x0448 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_MDIO_GPIO2__FLEXPWM1_PWMX1           0x0144 0x0448 0x069c 0x06 0x01
+#define IMX94_PAD_ETH3_MDIO_GPIO2__SINC4_MOD_CLK1           0x0144 0x0448 0x0000 0x07 0x00
+
+#define IMX94_PAD_ETH3_TXD3__NETC_PINMUX_ETH3_TXD3          0x0148 0x044c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_TXD3__XSPI_SLV_DATA7                 0x0148 0x044c 0x0924 0x02 0x00
+#define IMX94_PAD_ETH3_TXD3__SAI4_TX_DATA0                  0x0148 0x044c 0x0000 0x03 0x00
+#define IMX94_PAD_ETH3_TXD3__LPUART3_TX                     0x0148 0x044c 0x07a8 0x04 0x03
+#define IMX94_PAD_ETH3_TXD3__GPIO6_IO16                     0x0148 0x044c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_TXD3__FLEXPWM1_PWMA0                 0x0148 0x044c 0x0000 0x06 0x00
+
+#define IMX94_PAD_ETH3_TXD2__NETC_PINMUX_ETH3_TXD2          0x014c 0x0450 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_TXD2__ETH3_RMII_REF50_CLK            0x014c 0x0450 0x0000 0x01 0x00
+#define IMX94_PAD_ETH3_TXD2__XSPI_SLV_DATA6                 0x014c 0x0450 0x0920 0x02 0x00
+#define IMX94_PAD_ETH3_TXD2__SAI4_RX_SYNC                   0x014c 0x0450 0x0814 0x03 0x00
+#define IMX94_PAD_ETH3_TXD2__GPIO6_IO17                     0x014c 0x0450 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_TXD2__FLEXPWM1_PWMB0                 0x014c 0x0450 0x0000 0x06 0x00
+
+#define IMX94_PAD_ETH3_TXD1__NETC_PINMUX_ETH3_TXD1          0x0150 0x0454 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_TXD1__LPUART4_RTS_B                  0x0150 0x0454 0x0000 0x01 0x00
+#define IMX94_PAD_ETH3_TXD1__XSPI_SLV_DATA5                 0x0150 0x0454 0x091c 0x02 0x00
+#define IMX94_PAD_ETH3_TXD1__SAI4_RX_BCLK                   0x0150 0x0454 0x080c 0x03 0x00
+#define IMX94_PAD_ETH3_TXD1__GPIO6_IO18                     0x0150 0x0454 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_TXD1__FLEXPWM1_PWMA1                 0x0150 0x0454 0x0000 0x06 0x00
+
+#define IMX94_PAD_ETH3_TXD0__NETC_PINMUX_ETH3_TXD0          0x0154 0x0458 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_TXD0__LPUART4_TX                     0x0154 0x0458 0x07b4 0x01 0x02
+#define IMX94_PAD_ETH3_TXD0__XSPI_SLV_DATA4                 0x0154 0x0458 0x0918 0x02 0x00
+#define IMX94_PAD_ETH3_TXD0__SAI4_RX_DATA0                  0x0154 0x0458 0x0810 0x03 0x00
+#define IMX94_PAD_ETH3_TXD0__GPIO6_IO19                     0x0154 0x0458 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_TXD0__FLEXPWM1_PWMB1                 0x0154 0x0458 0x0000 0x06 0x00
+
+#define IMX94_PAD_ETH3_TX_CTL__NETC_PINMUX_ETH3_TX_CTL      0x0158 0x045c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_TX_CTL__LPUART4_DTR_B                0x0158 0x045c 0x0000 0x01 0x00
+#define IMX94_PAD_ETH3_TX_CTL__XSPI_SLV_DQS                 0x0158 0x045c 0x0900 0x02 0x00
+#define IMX94_PAD_ETH3_TX_CTL__SAI4_MCLK                    0x0158 0x045c 0x0808 0x03 0x00
+#define IMX94_PAD_ETH3_TX_CTL__LPUART3_RX                   0x0158 0x045c 0x07a4 0x04 0x03
+#define IMX94_PAD_ETH3_TX_CTL__GPIO6_IO20                   0x0158 0x045c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_TX_CTL__FLEXPWM1_PWMA2               0x0158 0x045c 0x0000 0x06 0x00
+
+#define IMX94_PAD_ETH3_TX_CLK__NETC_PINMUX_ETH3_TX_CLK      0x015c 0x0460 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_TX_CLK__XSPI_SLV_CLK                 0x015c 0x0460 0x0904 0x02 0x00
+#define IMX94_PAD_ETH3_TX_CLK__SAI2_TX_SYNC                 0x015c 0x0460 0x07fc 0x03 0x01
+#define IMX94_PAD_ETH3_TX_CLK__LPUART3_CTS_B                0x015c 0x0460 0x07a0 0x04 0x02
+#define IMX94_PAD_ETH3_TX_CLK__GPIO6_IO21                   0x015c 0x0460 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_TX_CLK__FLEXPWM1_PWMB2               0x015c 0x0460 0x0000 0x06 0x00
+
+#define IMX94_PAD_ETH3_RX_CTL__NETC_PINMUX_ETH3_RX_CTL      0x0160 0x0464 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_RX_CTL__LPUART4_DSR_B                0x0160 0x0464 0x0000 0x01 0x00
+#define IMX94_PAD_ETH3_RX_CTL__XSPI_SLV_CS                  0x0160 0x0464 0x08fc 0x02 0x00
+#define IMX94_PAD_ETH3_RX_CTL__SAI2_TX_BCLK                 0x0160 0x0464 0x07f8 0x03 0x01
+#define IMX94_PAD_ETH3_RX_CTL__XBAR1_XBAR_INOUT43           0x0160 0x0464 0x08e4 0x04 0x01
+#define IMX94_PAD_ETH3_RX_CTL__GPIO6_IO22                   0x0160 0x0464 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_RX_CTL__FLEXPWM1_PWMA3               0x0160 0x0464 0x0000 0x06 0x00
+#define IMX94_PAD_ETH3_RX_CTL__SINC4_EMCLK1                 0x0160 0x0464 0x0830 0x07 0x01
+
+#define IMX94_PAD_ETH3_RX_CLK__NETC_PINMUX_ETH3_RX_CLK      0x0164 0x0468 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_RX_CLK__LPUART4_CTS_B                0x0164 0x0468 0x07ac 0x01 0x01
+#define IMX94_PAD_ETH3_RX_CLK__XSPI_SLV_DATA3               0x0164 0x0468 0x0914 0x02 0x00
+#define IMX94_PAD_ETH3_RX_CLK__SAI2_TX_DATA0                0x0164 0x0468 0x0000 0x03 0x00
+#define IMX94_PAD_ETH3_RX_CLK__XBAR1_XBAR_INOUT44           0x0164 0x0468 0x08e8 0x04 0x01
+#define IMX94_PAD_ETH3_RX_CLK__GPIO6_IO23                   0x0164 0x0468 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_RX_CLK__FLEXPWM1_PWMB3               0x0164 0x0468 0x0000 0x06 0x00
+#define IMX94_PAD_ETH3_RX_CLK__SINC4_EMBIT1                 0x0164 0x0468 0x0824 0x07 0x01
+
+#define IMX94_PAD_ETH3_RXD0__NETC_PINMUX_ETH3_RXD0          0x0168 0x046c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_RXD0__LPUART4_RX                     0x0168 0x046c 0x07b0 0x01 0x02
+#define IMX94_PAD_ETH3_RXD0__XSPI_SLV_DATA2                 0x0168 0x046c 0x0910 0x02 0x00
+#define IMX94_PAD_ETH3_RXD0__SAI2_RX_SYNC                   0x0168 0x046c 0x07f4 0x03 0x01
+#define IMX94_PAD_ETH3_RXD0__GPIO6_IO24                     0x0168 0x046c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_RXD0__DIG_ENCODER1_DATA_EN           0x0168 0x046c 0x0000 0x06 0x00
+#define IMX94_PAD_ETH3_RXD0__XBAR1_XBAR_INOUT45             0x0168 0x046c 0x08ec 0x07 0x01
+
+#define IMX94_PAD_ETH3_RXD1__NETC_PINMUX_ETH3_RXD1          0x016c 0x0470 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_RXD1__XSPI_SLV_DATA1                 0x016c 0x0470 0x090c 0x02 0x00
+#define IMX94_PAD_ETH3_RXD1__SAI2_RX_BCLK                   0x016c 0x0470 0x07ec 0x03 0x01
+#define IMX94_PAD_ETH3_RXD1__LPUART3_RTS_B                  0x016c 0x0470 0x0000 0x04 0x00
+#define IMX94_PAD_ETH3_RXD1__GPIO6_IO25                     0x016c 0x0470 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_RXD1__DIG_ENCODER1_DATA_CLK          0x016c 0x0470 0x0000 0x06 0x00
+#define IMX94_PAD_ETH3_RXD1__XBAR1_XBAR_INOUT46             0x016c 0x0470 0x08f0 0x07 0x01
+
+#define IMX94_PAD_ETH3_RXD2__NETC_PINMUX_ETH3_RXD2          0x0170 0x0474 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_RXD2__MQS2_RIGHT                     0x0170 0x0474 0x0000 0x01 0x00
+#define IMX94_PAD_ETH3_RXD2__XSPI_SLV_DATA0                 0x0170 0x0474 0x0908 0x02 0x00
+#define IMX94_PAD_ETH3_RXD2__SAI2_RX_DATA0                  0x0170 0x0474 0x07f0 0x03 0x01
+#define IMX94_PAD_ETH3_RXD2__GPIO6_IO26                     0x0170 0x0474 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_RXD2__DIG_ENCODER1_DATA_OUT          0x0170 0x0474 0x0000 0x06 0x00
+#define IMX94_PAD_ETH3_RXD2__XBAR1_XBAR_INOUT47             0x0170 0x0474 0x08f4 0x07 0x01
+
+#define IMX94_PAD_ETH3_RXD3__NETC_PINMUX_ETH3_RXD3          0x0174 0x0478 0x0000 0x00 0x00
+#define IMX94_PAD_ETH3_RXD3__MQS2_LEFT                      0x0174 0x0478 0x0000 0x01 0x00
+#define IMX94_PAD_ETH3_RXD3__SAI2_MCLK                      0x0174 0x0478 0x07e8 0x03 0x01
+#define IMX94_PAD_ETH3_RXD3__GPIO6_IO27                     0x0174 0x0478 0x0000 0x05 0x00
+#define IMX94_PAD_ETH3_RXD3__DIG_ENCODER1_DATA_IN           0x0174 0x0478 0x0000 0x06 0x00
+#define IMX94_PAD_ETH3_RXD3__XBAR1_XBAR_INOUT48             0x0174 0x0478 0x08f8 0x07 0x01
+
+#define IMX94_PAD_ETH4_MDC_GPIO1__NETC_EMDC                 0x0178 0x047c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH4_MDC_GPIO1__ECAT_MDC                  0x0178 0x047c 0x0000 0x01 0x00
+#define IMX94_PAD_ETH4_MDC_GPIO1__ECAT_CLK25                0x0178 0x047c 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_MDC_GPIO1__NETC_ETH4_SLV_MDC         0x0178 0x047c 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_MDC_GPIO1__FLEXIO1_3_2_FLEXIO12      0x0178 0x047c 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_MDC_GPIO1__GPIO6_IO28                0x0178 0x047c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_MDC_GPIO1__FLEXPWM4_PWMX0            0x0178 0x047c 0x06f4 0x06 0x02
+#define IMX94_PAD_ETH4_MDC_GPIO1__SINC4_MOD_CLK2            0x0178 0x047c 0x0000 0x07 0x00
+
+#define IMX94_PAD_ETH4_MDIO_GPIO2__NETC_EMDIO               0x017c 0x0480 0x0678 0x00 0x02
+#define IMX94_PAD_ETH4_MDIO_GPIO2__ECAT_MDIO                0x017c 0x0480 0x0628 0x01 0x00
+#define IMX94_PAD_ETH4_MDIO_GPIO2__ENET_REF_CLK_ROOT        0x017c 0x0480 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_MDIO_GPIO2__NETC_ETH4_SLV_MDIO       0x017c 0x0480 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_MDIO_GPIO2__FLEXIO1_3_2_FLEXIO13     0x017c 0x0480 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_MDIO_GPIO2__GPIO6_IO29               0x017c 0x0480 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_MDIO_GPIO2__FLEXPWM4_PWMX1           0x017c 0x0480 0x06f8 0x06 0x02
+#define IMX94_PAD_ETH4_MDIO_GPIO2__SINC_FILTER_GLUE4_BREAK  0x017c 0x0480 0x0000 0x07 0x00
+
+#define IMX94_PAD_ETH4_TX_CLK__NETC_PINMUX_ETH4_TX_CLK      0x0180 0x0484 0x0648 0x00 0x00
+#define IMX94_PAD_ETH4_TX_CLK__USDHC3_CLK                   0x0180 0x0484 0x0000 0x01 0x00
+#define IMX94_PAD_ETH4_TX_CLK__XSPI2_A_SCLK                 0x0180 0x0484 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_TX_CLK__ECAT_LED_ERR                 0x0180 0x0484 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_TX_CLK__FLEXIO1_3_2_FLEXIO0          0x0180 0x0484 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_TX_CLK__GPIO6_IO30                   0x0180 0x0484 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_TX_CLK__FLEXPWM4_PWMA0               0x0180 0x0484 0x06d4 0x06 0x01
+#define IMX94_PAD_ETH4_TX_CLK__XBAR1_XBAR_INOUT30           0x0180 0x0484 0x08b0 0x07 0x02
+
+#define IMX94_PAD_ETH4_TX_CTL__NETC_PINMUX_ETH4_TX_CTL      0x0184 0x0488 0x0000 0x00 0x00
+#define IMX94_PAD_ETH4_TX_CTL__USDHC3_CMD                   0x0184 0x0488 0x0858 0x01 0x01
+#define IMX94_PAD_ETH4_TX_CTL__XSPI2_A_SS0_B                0x0184 0x0488 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_TX_CTL__ECAT_RESET_OUT               0x0184 0x0488 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_TX_CTL__FLEXIO1_3_2_FLEXIO1          0x0184 0x0488 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_TX_CTL__GPIO6_IO31                   0x0184 0x0488 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_TX_CTL__FLEXPWM4_PWMB0               0x0184 0x0488 0x06e4 0x06 0x01
+#define IMX94_PAD_ETH4_TX_CTL__XBAR1_XBAR_INOUT31           0x0184 0x0488 0x08b4 0x07 0x02
+
+#define IMX94_PAD_ETH4_TXD0__NETC_PINMUX_ETH4_TXD0          0x0188 0x048c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH4_TXD0__USDHC3_DATA0                   0x0188 0x048c 0x085c 0x01 0x01
+#define IMX94_PAD_ETH4_TXD0__XSPI2_A_DATA0                  0x0188 0x048c 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_TXD0__ECAT_LED_RUN                   0x0188 0x048c 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_TXD0__FLEXIO1_3_2_FLEXIO2            0x0188 0x048c 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_TXD0__GPIO7_IO0                      0x0188 0x048c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_TXD0__FLEXPWM4_PWMA1                 0x0188 0x048c 0x06d8 0x06 0x01
+#define IMX94_PAD_ETH4_TXD0__XBAR1_XBAR_INOUT32             0x0188 0x048c 0x08b8 0x07 0x02
+
+#define IMX94_PAD_ETH4_TXD1__NETC_PINMUX_ETH4_TXD1          0x018c 0x0490 0x0000 0x00 0x00
+#define IMX94_PAD_ETH4_TXD1__USDHC3_DATA1                   0x018c 0x0490 0x0860 0x01 0x01
+#define IMX94_PAD_ETH4_TXD1__XSPI2_A_DATA1                  0x018c 0x0490 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_TXD1__ECAT_LED_STATE_RUN             0x018c 0x0490 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_TXD1__FLEXIO1_3_2_FLEXIO3            0x018c 0x0490 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_TXD1__GPIO7_IO1                      0x018c 0x0490 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_TXD1__FLEXPWM4_PWMB1                 0x018c 0x0490 0x06e8 0x06 0x01
+#define IMX94_PAD_ETH4_TXD1__XBAR1_XBAR_INOUT33             0x018c 0x0490 0x08bc 0x07 0x02
+
+#define IMX94_PAD_ETH4_TXD2__NETC_PINMUX_ETH4_TXD2          0x0190 0x0494 0x0000 0x00 0x00
+#define IMX94_PAD_ETH4_TXD2__USDHC3_DATA2                   0x0190 0x0494 0x0864 0x01 0x01
+#define IMX94_PAD_ETH4_TXD2__XSPI2_A_DATA2                  0x0190 0x0494 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_TXD2__ECAT_CLK25                     0x0190 0x0494 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_TXD2__FLEXIO1_3_2_FLEXIO4            0x0190 0x0494 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_TXD2__GPIO7_IO2                      0x0190 0x0494 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_TXD2__FLEXPWM4_PWMA2                 0x0190 0x0494 0x06dc 0x06 0x01
+#define IMX94_PAD_ETH4_TXD2__ETH4_RMII_REF50_CLK            0x0190 0x0494 0x0000 0x07 0x00
+
+#define IMX94_PAD_ETH4_TXD3__NETC_PINMUX_ETH4_TXD3          0x0194 0x0498 0x0000 0x00 0x00
+#define IMX94_PAD_ETH4_TXD3__USDHC3_DATA3                   0x0194 0x0498 0x0868 0x01 0x01
+#define IMX94_PAD_ETH4_TXD3__XSPI2_A_DATA3                  0x0194 0x0498 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_TXD3__FLEXIO1_3_2_FLEXIO5            0x0194 0x0498 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_TXD3__GPIO7_IO3                      0x0194 0x0498 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_TXD3__FLEXPWM4_PWMB2                 0x0194 0x0498 0x06ec 0x06 0x01
+#define IMX94_PAD_ETH4_TXD3__XBAR1_XBAR_INOUT35             0x0194 0x0498 0x08c4 0x07 0x02
+
+#define IMX94_PAD_ETH4_RXD0__NETC_PINMUX_ETH4_RXD0          0x0198 0x049c 0x0638 0x00 0x00
+#define IMX94_PAD_ETH4_RXD0__XSPI2_A_DATA4                  0x0198 0x049c 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_RXD0__FLEXIO1_3_2_FLEXIO6            0x0198 0x049c 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_RXD0__GPIO7_IO4                      0x0198 0x049c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_RXD0__FLEXPWM4_PWMA3                 0x0198 0x049c 0x06e0 0x06 0x01
+#define IMX94_PAD_ETH4_RXD0__SINC4_EMCLK2                   0x0198 0x049c 0x0834 0x07 0x01
+
+#define IMX94_PAD_ETH4_RXD1__NETC_PINMUX_ETH4_RXD1          0x019c 0x04a0 0x063c 0x00 0x00
+#define IMX94_PAD_ETH4_RXD1__XSPI2_A_DATA5                  0x019c 0x04a0 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_RXD1__FLEXIO2_4_1_FLEXIO11           0x019c 0x04a0 0x0694 0x03 0x00
+#define IMX94_PAD_ETH4_RXD1__FLEXIO1_3_2_FLEXIO7            0x019c 0x04a0 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_RXD1__GPIO7_IO5                      0x019c 0x04a0 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_RXD1__FLEXPWM4_PWMB3                 0x019c 0x04a0 0x06f0 0x06 0x01
+#define IMX94_PAD_ETH4_RXD1__SINC4_EMBIT2                   0x019c 0x04a0 0x0828 0x07 0x01
+
+#define IMX94_PAD_ETH4_RXD2__NETC_PINMUX_ETH4_RXD2          0x01a0 0x04a4 0x0640 0x00 0x00
+#define IMX94_PAD_ETH4_RXD2__XSPI2_A_DATA6                  0x01a0 0x04a4 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_RXD2__FLEXIO2_4_1_FLEXIO12           0x01a0 0x04a4 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_RXD2__FLEXIO1_3_2_FLEXIO8            0x01a0 0x04a4 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_RXD2__GPIO7_IO6                      0x01a0 0x04a4 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_RXD2__DIG_ENCODER2_DATA_EN           0x01a0 0x04a4 0x0000 0x06 0x00
+#define IMX94_PAD_ETH4_RXD2__XBAR1_XBAR_INOUT4              0x01a0 0x04a4 0x086c 0x07 0x01
+
+#define IMX94_PAD_ETH4_RXD3__NETC_PINMUX_ETH4_RXD3          0x01a4 0x04a8 0x0644 0x00 0x00
+#define IMX94_PAD_ETH4_RXD3__ENET_REF_CLK_ROOT              0x01a4 0x04a8 0x0000 0x01 0x00
+#define IMX94_PAD_ETH4_RXD3__XSPI2_A_DATA7                  0x01a4 0x04a8 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_RXD3__FLEXIO2_4_1_FLEXIO13           0x01a4 0x04a8 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_RXD3__FLEXIO1_3_2_FLEXIO9            0x01a4 0x04a8 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_RXD3__GPIO7_IO7                      0x01a4 0x04a8 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_RXD3__DIG_ENCODER2_DATA_CLK          0x01a4 0x04a8 0x068c 0x06 0x01
+#define IMX94_PAD_ETH4_RXD3__XBAR1_XBAR_INOUT5              0x01a4 0x04a8 0x0870 0x07 0x01
+
+#define IMX94_PAD_ETH4_RX_CTL__NETC_PINMUX_ETH4_RX_CTL      0x01a8 0x04ac 0x0634 0x00 0x00
+#define IMX94_PAD_ETH4_RX_CTL__XSPI2_A_SS1_B                0x01a8 0x04ac 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_RX_CTL__FLEXIO2_4_1_FLEXIO14         0x01a8 0x04ac 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_RX_CTL__FLEXIO1_3_2_FLEXIO10         0x01a8 0x04ac 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_RX_CTL__GPIO7_IO8                    0x01a8 0x04ac 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_RX_CTL__DIG_ENCODER2_DATA_OUT        0x01a8 0x04ac 0x0000 0x06 0x00
+#define IMX94_PAD_ETH4_RX_CTL__XBAR1_XBAR_INOUT6            0x01a8 0x04ac 0x0874 0x07 0x01
+
+#define IMX94_PAD_ETH4_RX_CLK__NETC_PINMUX_ETH4_RX_CLK      0x01ac 0x04b0 0x0630 0x00 0x00
+#define IMX94_PAD_ETH4_RX_CLK__XSPI2_A_DQS                  0x01ac 0x04b0 0x0000 0x02 0x00
+#define IMX94_PAD_ETH4_RX_CLK__FLEXIO2_4_1_FLEXIO15         0x01ac 0x04b0 0x0000 0x03 0x00
+#define IMX94_PAD_ETH4_RX_CLK__FLEXIO1_3_2_FLEXIO11         0x01ac 0x04b0 0x0000 0x04 0x00
+#define IMX94_PAD_ETH4_RX_CLK__GPIO7_IO9                    0x01ac 0x04b0 0x0000 0x05 0x00
+#define IMX94_PAD_ETH4_RX_CLK__DIG_ENCODER2_DATA_IN         0x01ac 0x04b0 0x0690 0x06 0x01
+#define IMX94_PAD_ETH4_RX_CLK__XBAR1_XBAR_INOUT7            0x01ac 0x04b0 0x0878 0x07 0x01
+
+#define IMX94_PAD_ETH0_TXD0__NETC_PINMUX_ETH0_TXD0          0x01b0 0x04b4 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_TXD0__ECAT_PT0_TXD0                  0x01b0 0x04b4 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_TXD0__FLEXIO4_FLEXIO0                0x01b0 0x04b4 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_TXD0__GPIO5_IO0                      0x01b0 0x04b4 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_TXD1__NETC_PINMUX_ETH0_TXD1          0x01b4 0x04b8 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_TXD1__ECAT_PT0_TXD1                  0x01b4 0x04b8 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_TXD1__FLEXIO4_FLEXIO1                0x01b4 0x04b8 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_TXD1__GPIO5_IO1                      0x01b4 0x04b8 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_TX_EN__NETC_PINMUX_ETH0_TX_EN        0x01b8 0x04bc 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_TX_EN__ECAT_PT0_TX_EN                0x01b8 0x04bc 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_TX_EN__FLEXIO4_FLEXIO2               0x01b8 0x04bc 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_TX_EN__GPIO5_IO2                     0x01b8 0x04bc 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_TX_CLK__NETC_PINMUX_ETH0_TX_CLK      0x01bc 0x04c0 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_TX_CLK__ECAT_PT0_TX_CLK              0x01bc 0x04c0 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_TX_CLK__FLEXIO4_FLEXIO3              0x01bc 0x04c0 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_TX_CLK__GPIO5_IO3                    0x01bc 0x04c0 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_RXD0__NETC_PINMUX_ETH0_RXD0          0x01c0 0x04c4 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_RXD0__ECAT_PT0_RXD0                  0x01c0 0x04c4 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_RXD0__FLEXIO4_FLEXIO4                0x01c0 0x04c4 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_RXD0__GPIO5_IO4                      0x01c0 0x04c4 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_RXD1__NETC_PINMUX_ETH0_RXD1          0x01c4 0x04c8 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_RXD1__ECAT_PT0_RXD1                  0x01c4 0x04c8 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_RXD1__FLEXIO4_FLEXIO5                0x01c4 0x04c8 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_RXD1__GPIO5_IO5                      0x01c4 0x04c8 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_RX_DV__NETC_PINMUX_ETH0_RX_DV        0x01c8 0x04cc 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_RX_DV__ECAT_PT0_RX_DV                0x01c8 0x04cc 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_RX_DV__FLEXIO4_FLEXIO6               0x01c8 0x04cc 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_RX_DV__GPIO5_IO6                     0x01c8 0x04cc 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_TXD2__NETC_PINMUX_ETH0_TXD2          0x01cc 0x04d0 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_TXD2__ECAT_PT0_TXD2                  0x01cc 0x04d0 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_TXD2__ETH0_RMII_REF50_CLK            0x01cc 0x04d0 0x0000 0x02 0x00
+#define IMX94_PAD_ETH0_TXD2__FLEXIO4_FLEXIO7                0x01cc 0x04d0 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_TXD2__GPIO5_IO7                      0x01cc 0x04d0 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_TXD3__NETC_PINMUX_ETH0_TXD3          0x01d0 0x04d4 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_TXD3__ECAT_PT0_TXD3                  0x01d0 0x04d4 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_TXD3__FLEXIO4_FLEXIO8                0x01d0 0x04d4 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_TXD3__GPIO5_IO8                      0x01d0 0x04d4 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_RXD2__NETC_PINMUX_ETH0_RXD2          0x01d4 0x04d8 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_RXD2__ECAT_PT0_RXD2                  0x01d4 0x04d8 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_RXD2__FLEXIO4_FLEXIO9                0x01d4 0x04d8 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_RXD2__GPIO5_IO9                      0x01d4 0x04d8 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_RXD3__NETC_PINMUX_ETH0_RXD3          0x01d8 0x04dc 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_RXD3__ECAT_PT0_RXD3                  0x01d8 0x04dc 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_RXD3__FLEXIO4_FLEXIO10               0x01d8 0x04dc 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_RXD3__GPIO5_IO10                     0x01d8 0x04dc 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_RX_CLK__NETC_PINMUX_ETH0_RX_CLK      0x01dc 0x04e0 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_RX_CLK__ECAT_PT0_RX_CLK              0x01dc 0x04e0 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_RX_CLK__FLEXIO4_FLEXIO11             0x01dc 0x04e0 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_RX_CLK__GPIO5_IO11                   0x01dc 0x04e0 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_RX_ER__NETC_PINMUX_ETH0_RX_ER        0x01e0 0x04e4 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_RX_ER__ECAT_PT0_RX_ER                0x01e0 0x04e4 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_RX_ER__FLEXIO4_FLEXIO12              0x01e0 0x04e4 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_RX_ER__GPIO5_IO12                    0x01e0 0x04e4 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_TX_ER__NETC_PINMUX_ETH0_TX_ER        0x01e4 0x04e8 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_TX_ER__ECAT_LINK_ACT0                0x01e4 0x04e8 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_TX_ER__FLEXIO4_FLEXIO13              0x01e4 0x04e8 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_TX_ER__GPIO5_IO13                    0x01e4 0x04e8 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH0_CRS__NETC_PINMUX_ETH0_CRS            0x01e8 0x04ec 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_CRS__ECAT_LINK0                      0x01e8 0x04ec 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_CRS__NETC_EMDC                       0x01e8 0x04ec 0x0000 0x02 0x00
+#define IMX94_PAD_ETH0_CRS__FLEXIO4_FLEXIO14                0x01e8 0x04ec 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_CRS__GPIO5_IO14                      0x01e8 0x04ec 0x0000 0x05 0x00
+#define IMX94_PAD_ETH0_CRS__XBAR1_XBAR_INOUT8               0x01e8 0x04ec 0x087c 0x06 0x02
+#define IMX94_PAD_ETH0_CRS__SINC_FILTER_GLUE2_BREAK         0x01e8 0x04ec 0x0000 0x07 0x00
+
+#define IMX94_PAD_ETH0_COL__NETC_PINMUX_ETH0_COL            0x01ec 0x04f0 0x0000 0x00 0x00
+#define IMX94_PAD_ETH0_COL__ECAT_LINK1                      0x01ec 0x04f0 0x0000 0x01 0x00
+#define IMX94_PAD_ETH0_COL__NETC_EMDIO                      0x01ec 0x04f0 0x0678 0x02 0x03
+#define IMX94_PAD_ETH0_COL__FLEXIO4_FLEXIO15                0x01ec 0x04f0 0x0000 0x04 0x00
+#define IMX94_PAD_ETH0_COL__GPIO5_IO15                      0x01ec 0x04f0 0x0000 0x05 0x00
+#define IMX94_PAD_ETH0_COL__XBAR1_XBAR_INOUT9               0x01ec 0x04f0 0x0880 0x06 0x02
+#define IMX94_PAD_ETH0_COL__SINC_FILTER_GLUE1_BREAK         0x01ec 0x04f0 0x0000 0x07 0x00
+
+#define IMX94_PAD_ETH1_TXD0__NETC_PINMUX_ETH1_TXD0          0x01f0 0x04f4 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_TXD0__ECAT_PT1_TXD0                  0x01f0 0x04f4 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_TXD0__ENCODER_DIAG0                  0x01f0 0x04f4 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_TXD0__FLEXIO3_FLEXIO0                0x01f0 0x04f4 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_TXD0__GPIO5_IO16                     0x01f0 0x04f4 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_TXD1__NETC_PINMUX_ETH1_TXD1          0x01f4 0x04f8 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_TXD1__ECAT_PT1_TXD1                  0x01f4 0x04f8 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_TXD1__ENCODER_DIAG1                  0x01f4 0x04f8 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_TXD1__FLEXIO3_FLEXIO1                0x01f4 0x04f8 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_TXD1__GPIO5_IO17                     0x01f4 0x04f8 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_TX_EN__NETC_PINMUX_ETH1_TX_EN        0x01f8 0x04fc 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_TX_EN__ECAT_PT1_TX_EN                0x01f8 0x04fc 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_TX_EN__ENCODER_DIAG2                 0x01f8 0x04fc 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_TX_EN__FLEXIO3_FLEXIO2               0x01f8 0x04fc 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_TX_EN__GPIO5_IO18                    0x01f8 0x04fc 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_TX_CLK__NETC_PINMUX_ETH1_TX_CLK      0x01fc 0x0500 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_TX_CLK__ECAT_PT1_TX_CLK              0x01fc 0x0500 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_TX_CLK__ENCODER_DIAG3                0x01fc 0x0500 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_TX_CLK__FLEXIO3_FLEXIO3              0x01fc 0x0500 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_TX_CLK__GPIO5_IO19                   0x01fc 0x0500 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_RXD0__NETC_PINMUX_ETH1_RXD0          0x0200 0x0504 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_RXD0__ECAT_PT1_RXD0                  0x0200 0x0504 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_RXD0__ENCODER_DIAG4                  0x0200 0x0504 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_RXD0__FLEXIO3_FLEXIO4                0x0200 0x0504 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_RXD0__GPIO5_IO20                     0x0200 0x0504 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_RXD1__NETC_PINMUX_ETH1_RXD1          0x0204 0x0508 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_RXD1__ECAT_PT1_RXD1                  0x0204 0x0508 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_RXD1__ENCODER_DIAG5                  0x0204 0x0508 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_RXD1__FLEXIO3_FLEXIO5                0x0204 0x0508 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_RXD1__GPIO5_IO21                     0x0204 0x0508 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_RX_DV__NETC_PINMUX_ETH1_RX_DV        0x0208 0x050c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_RX_DV__ECAT_PT1_RX_DV                0x0208 0x050c 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_RX_DV__ENCODER_DIAG6                 0x0208 0x050c 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_RX_DV__FLEXIO3_FLEXIO6               0x0208 0x050c 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_RX_DV__GPIO5_IO22                    0x0208 0x050c 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_TXD2__NETC_PINMUX_ETH1_TXD2          0x020c 0x0510 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_TXD2__ECAT_PT1_TXD2                  0x020c 0x0510 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_TXD2__ETH1_RMII_REF50_CLK            0x020c 0x0510 0x0000 0x02 0x00
+#define IMX94_PAD_ETH1_TXD2__ENCODER_DIAG7                  0x020c 0x0510 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_TXD2__FLEXIO3_FLEXIO7                0x020c 0x0510 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_TXD2__GPIO5_IO23                     0x020c 0x0510 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_TXD3__NETC_PINMUX_ETH1_TXD3          0x0210 0x0514 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_TXD3__ECAT_PT1_TXD3                  0x0210 0x0514 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_TXD3__ENCODER_DIAG8                  0x0210 0x0514 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_TXD3__FLEXIO3_FLEXIO8                0x0210 0x0514 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_TXD3__GPIO5_IO24                     0x0210 0x0514 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_RXD2__NETC_PINMUX_ETH1_RXD2          0x0214 0x0518 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_RXD2__ECAT_PT1_RXD2                  0x0214 0x0518 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_RXD2__ENCODER_DIAG9                  0x0214 0x0518 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_RXD2__FLEXIO3_FLEXIO9                0x0214 0x0518 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_RXD2__GPIO5_IO25                     0x0214 0x0518 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_RXD3__NETC_PINMUX_ETH1_RXD3          0x0218 0x051c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_RXD3__ECAT_PT1_RXD3                  0x0218 0x051c 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_RXD3__ENCODER_DIAG10                 0x0218 0x051c 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_RXD3__FLEXIO3_FLEXIO10               0x0218 0x051c 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_RXD3__GPIO5_IO26                     0x0218 0x051c 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_RX_CLK__NETC_PINMUX_ETH1_RX_CLK      0x021c 0x0520 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_RX_CLK__ECAT_PT1_RX_CLK              0x021c 0x0520 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_RX_CLK__ENCODER_DIAG11               0x021c 0x0520 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_RX_CLK__FLEXIO3_FLEXIO11             0x021c 0x0520 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_RX_CLK__GPIO5_IO27                   0x021c 0x0520 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_RX_ER__NETC_PINMUX_ETH1_RX_ER        0x0220 0x0524 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_RX_ER__ECAT_PT1_RX_ER                0x0220 0x0524 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_RX_ER__ENCODER_DIAG12                0x0220 0x0524 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_RX_ER__FLEXIO3_FLEXIO12              0x0220 0x0524 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_RX_ER__GPIO5_IO28                    0x0220 0x0524 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_TX_ER__NETC_PINMUX_ETH1_TX_ER        0x0224 0x0528 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_TX_ER__ECAT_LINK_ACT1                0x0224 0x0528 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_TX_ER__ENCODER_DIAG13                0x0224 0x0528 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_TX_ER__FLEXIO3_FLEXIO13              0x0224 0x0528 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_TX_ER__GPIO5_IO29                    0x0224 0x0528 0x0000 0x05 0x00
+
+#define IMX94_PAD_ETH1_CRS__NETC_PINMUX_ETH1_CRS            0x0228 0x052c 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_CRS__ECAT_MDC                        0x0228 0x052c 0x0000 0x01 0x00
+#define IMX94_PAD_ETH1_CRS__NETC_EMDC                       0x0228 0x052c 0x0000 0x02 0x00
+#define IMX94_PAD_ETH1_CRS__ENCODER_DIAG14                  0x0228 0x052c 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_CRS__FLEXIO3_FLEXIO14                0x0228 0x052c 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_CRS__GPIO5_IO30                      0x0228 0x052c 0x0000 0x05 0x00
+#define IMX94_PAD_ETH1_CRS__XBAR1_XBAR_INOUT10              0x0228 0x052c 0x0884 0x06 0x02
+#define IMX94_PAD_ETH1_CRS__SINC_FILTER_GLUE1_BREAK         0x0228 0x052c 0x0000 0x07 0x00
+
+#define IMX94_PAD_ETH1_COL__NETC_PINMUX_ETH1_COL            0x022c 0x0530 0x0000 0x00 0x00
+#define IMX94_PAD_ETH1_COL__ECAT_MDIO                       0x022c 0x0530 0x0628 0x01 0x01
+#define IMX94_PAD_ETH1_COL__NETC_EMDIO                      0x022c 0x0530 0x0678 0x02 0x04
+#define IMX94_PAD_ETH1_COL__ENCODER_DIAG15                  0x022c 0x0530 0x0000 0x03 0x00
+#define IMX94_PAD_ETH1_COL__FLEXIO3_FLEXIO15                0x022c 0x0530 0x0000 0x04 0x00
+#define IMX94_PAD_ETH1_COL__GPIO5_IO31                      0x022c 0x0530 0x0000 0x05 0x00
+#define IMX94_PAD_ETH1_COL__XBAR1_XBAR_INOUT11              0x022c 0x0530 0x0888 0x06 0x02
+#define IMX94_PAD_ETH1_COL__SINC_FILTER_GLUE2_BREAK         0x022c 0x0530 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_CLK__USDHC1_CLK                       0x0230 0x0534 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_CLK__SAI4_TX_BCLK                     0x0230 0x0534 0x0818 0x01 0x01
+#define IMX94_PAD_SD1_CLK__CAN4_TX                          0x0230 0x0534 0x0000 0x02 0x00
+#define IMX94_PAD_SD1_CLK__NETC_1588MUX_INOUT0              0x0230 0x0534 0x064c 0x03 0x01
+#define IMX94_PAD_SD1_CLK__FLEXIO2_4_1_FLEXIO0              0x0230 0x0534 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_CLK__GPIO4_IO8                        0x0230 0x0534 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_CLK__FLEXPWM3_PWMX0                   0x0230 0x0534 0x06c8 0x06 0x02
+#define IMX94_PAD_SD1_CLK__SINC1_EMCLK0                     0x0230 0x0534 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_CMD__USDHC1_CMD                       0x0234 0x0538 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_CMD__SAI4_RX_BCLK                     0x0234 0x0538 0x080c 0x01 0x01
+#define IMX94_PAD_SD1_CMD__CAN4_RX                          0x0234 0x0538 0x0684 0x02 0x02
+#define IMX94_PAD_SD1_CMD__NETC_1588MUX_INOUT1              0x0234 0x0538 0x0650 0x03 0x01
+#define IMX94_PAD_SD1_CMD__FLEXIO2_4_1_FLEXIO1              0x0234 0x0538 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_CMD__GPIO4_IO9                        0x0234 0x0538 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_CMD__FLEXPWM3_PWMX1                   0x0234 0x0538 0x06cc 0x06 0x02
+#define IMX94_PAD_SD1_CMD__SINC1_EMBIT0                     0x0234 0x0538 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_DATA0__USDHC1_DATA0                   0x0238 0x053c 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_DATA0__SAI4_RX_SYNC                   0x0238 0x053c 0x0814 0x01 0x01
+#define IMX94_PAD_SD1_DATA0__CAN5_TX                        0x0238 0x053c 0x0000 0x02 0x00
+#define IMX94_PAD_SD1_DATA0__NETC_1588MUX_INOUT2            0x0238 0x053c 0x0654 0x03 0x01
+#define IMX94_PAD_SD1_DATA0__FLEXIO2_4_1_FLEXIO2            0x0238 0x053c 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_DATA0__GPIO4_IO10                     0x0238 0x053c 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_DATA0__FLEXPWM3_PWMX2                 0x0238 0x053c 0x06d0 0x06 0x01
+#define IMX94_PAD_SD1_DATA0__SINC1_EMCLK1                   0x0238 0x053c 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_DATA1__USDHC1_DATA1                   0x023c 0x0540 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_DATA1__SAI4_TX_SYNC                   0x023c 0x0540 0x081c 0x01 0x01
+#define IMX94_PAD_SD1_DATA1__CAN5_RX                        0x023c 0x0540 0x0688 0x02 0x03
+#define IMX94_PAD_SD1_DATA1__NETC_1588MUX_INOUT3            0x023c 0x0540 0x0658 0x03 0x01
+#define IMX94_PAD_SD1_DATA1__FLEXIO2_4_1_FLEXIO3            0x023c 0x0540 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_DATA1__GPIO4_IO11                     0x023c 0x0540 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_DATA1__FLEXPWM3_PWMA3                 0x023c 0x0540 0x06b4 0x06 0x01
+#define IMX94_PAD_SD1_DATA1__SINC1_EMBIT1                   0x023c 0x0540 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_DATA2__USDHC1_DATA2                   0x0240 0x0544 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_DATA2__SAI4_TX_DATA0                  0x0240 0x0544 0x0000 0x01 0x00
+#define IMX94_PAD_SD1_DATA2__PMIC_READY                     0x0240 0x0544 0x0000 0x02 0x00
+#define IMX94_PAD_SD1_DATA2__NETC_1588MUX_INOUT4            0x0240 0x0544 0x065c 0x03 0x01
+#define IMX94_PAD_SD1_DATA2__FLEXIO2_4_1_FLEXIO4            0x0240 0x0544 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_DATA2__GPIO4_IO12                     0x0240 0x0544 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_DATA2__FLEXPWM3_PWMB3                 0x0240 0x0544 0x06c4 0x06 0x01
+#define IMX94_PAD_SD1_DATA2__SINC1_EMCLK2                   0x0240 0x0544 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_DATA3__USDHC1_DATA3                   0x0244 0x0548 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_DATA3__SAI4_RX_DATA0                  0x0244 0x0548 0x0810 0x01 0x01
+#define IMX94_PAD_SD1_DATA3__NETC_1588MUX_INOUT5            0x0244 0x0548 0x0660 0x03 0x01
+#define IMX94_PAD_SD1_DATA3__FLEXIO2_4_1_FLEXIO5            0x0244 0x0548 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_DATA3__GPIO4_IO13                     0x0244 0x0548 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_DATA3__FLEXPWM3_PWMA2                 0x0244 0x0548 0x06b0 0x06 0x01
+#define IMX94_PAD_SD1_DATA3__SINC1_EMBIT2                   0x0244 0x0548 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_DATA4__USDHC1_DATA4                   0x0248 0x054c 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_DATA4__SAI2_RX_DATA0                  0x0248 0x054c 0x07f0 0x01 0x02
+#define IMX94_PAD_SD1_DATA4__NETC_1588MUX_INOUT6            0x0248 0x054c 0x0664 0x03 0x01
+#define IMX94_PAD_SD1_DATA4__FLEXIO2_4_1_FLEXIO6            0x0248 0x054c 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_DATA4__GPIO4_IO14                     0x0248 0x054c 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_DATA4__FLEXPWM3_PWMB2                 0x0248 0x054c 0x06c0 0x06 0x01
+#define IMX94_PAD_SD1_DATA4__SINC1_EMCLK3                   0x0248 0x054c 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_DATA5__USDHC1_DATA5                   0x024c 0x0550 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_DATA5__SAI2_TX_DATA0                  0x024c 0x0550 0x0000 0x01 0x00
+#define IMX94_PAD_SD1_DATA5__USDHC1_RESET_B                 0x024c 0x0550 0x0000 0x02 0x00
+#define IMX94_PAD_SD1_DATA5__NETC_1588MUX_INOUT7            0x024c 0x0550 0x0668 0x03 0x01
+#define IMX94_PAD_SD1_DATA5__FLEXIO2_4_1_FLEXIO7            0x024c 0x0550 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_DATA5__GPIO4_IO15                     0x024c 0x0550 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_DATA5__FLEXPWM3_PWMA1                 0x024c 0x0550 0x06ac 0x06 0x01
+#define IMX94_PAD_SD1_DATA5__SINC1_EMBIT3                   0x024c 0x0550 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_DATA6__USDHC1_DATA6                   0x0250 0x0554 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_DATA6__SAI2_TX_BCLK                   0x0250 0x0554 0x07f8 0x01 0x02
+#define IMX94_PAD_SD1_DATA6__USDHC1_CD_B                    0x0250 0x0554 0x0000 0x02 0x00
+#define IMX94_PAD_SD1_DATA6__NETC_1588MUX_INOUT8            0x0250 0x0554 0x066c 0x03 0x01
+#define IMX94_PAD_SD1_DATA6__FLEXIO2_4_1_FLEXIO8            0x0250 0x0554 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_DATA6__GPIO4_IO16                     0x0250 0x0554 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_DATA6__FLEXPWM3_PWMB1                 0x0250 0x0554 0x06bc 0x06 0x01
+#define IMX94_PAD_SD1_DATA6__SINC1_MOD_CLK0                 0x0250 0x0554 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_DATA7__USDHC1_DATA7                   0x0254 0x0558 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_DATA7__SAI2_RX_SYNC                   0x0254 0x0558 0x07f4 0x01 0x02
+#define IMX94_PAD_SD1_DATA7__USDHC1_WP                      0x0254 0x0558 0x0000 0x02 0x00
+#define IMX94_PAD_SD1_DATA7__NETC_1588MUX_INOUT9            0x0254 0x0558 0x0670 0x03 0x01
+#define IMX94_PAD_SD1_DATA7__FLEXIO2_4_1_FLEXIO9            0x0254 0x0558 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_DATA7__GPIO4_IO17                     0x0254 0x0558 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_DATA7__FLEXPWM3_PWMA0                 0x0254 0x0558 0x06a8 0x06 0x01
+#define IMX94_PAD_SD1_DATA7__SINC1_MOD_CLK1                 0x0254 0x0558 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD1_STROBE__USDHC1_STROBE                 0x0258 0x055c 0x0000 0x00 0x00
+#define IMX94_PAD_SD1_STROBE__SAI2_TX_SYNC                  0x0258 0x055c 0x07fc 0x01 0x02
+#define IMX94_PAD_SD1_STROBE__NETC_1588MUX_INOUT10          0x0258 0x055c 0x0674 0x03 0x01
+#define IMX94_PAD_SD1_STROBE__FLEXIO2_4_1_FLEXIO10          0x0258 0x055c 0x0000 0x04 0x00
+#define IMX94_PAD_SD1_STROBE__GPIO4_IO18                    0x0258 0x055c 0x0000 0x05 0x00
+#define IMX94_PAD_SD1_STROBE__FLEXPWM3_PWMB0                0x0258 0x055c 0x06b8 0x06 0x01
+#define IMX94_PAD_SD1_STROBE__SINC1_MOD_CLK2                0x0258 0x055c 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT               0x025c 0x0560 0x0000 0x00 0x00
+#define IMX94_PAD_SD2_VSELECT__SAI4_MCLK                    0x025c 0x0560 0x0808 0x01 0x01
+#define IMX94_PAD_SD2_VSELECT__USDHC2_WP                    0x025c 0x0560 0x0854 0x02 0x02
+#define IMX94_PAD_SD2_VSELECT__NETC_1588MUX_INOUT10         0x025c 0x0560 0x0674 0x03 0x02
+#define IMX94_PAD_SD2_VSELECT__FLEXIO2_4_1_FLEXIO11         0x025c 0x0560 0x0694 0x04 0x01
+#define IMX94_PAD_SD2_VSELECT__GPIO4_IO19                   0x025c 0x0560 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_VSELECT__EXT_CLK1                     0x025c 0x0560 0x0624 0x06 0x01
+#define IMX94_PAD_SD2_VSELECT__XBAR1_XBAR_INOUT12           0x025c 0x0560 0x088c 0x07 0x02
+
+#define IMX94_PAD_XSPI1_DATA0__XSPI1_A_DATA0                0x0260 0x0564 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_DATA0__SAI2_RX_SYNC                 0x0260 0x0564 0x07f4 0x01 0x03
+#define IMX94_PAD_XSPI1_DATA0__XSPI_SLV_DATA0               0x0260 0x0564 0x0908 0x03 0x01
+#define IMX94_PAD_XSPI1_DATA0__FLEXIO1_3_3_FLEXIO0          0x0260 0x0564 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_DATA0__GPIO7_IO16                   0x0260 0x0564 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_DATA1__XSPI1_A_DATA1                0x0264 0x0568 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_DATA1__SAI2_TX_SYNC                 0x0264 0x0568 0x07fc 0x01 0x03
+#define IMX94_PAD_XSPI1_DATA1__XSPI_SLV_DATA1               0x0264 0x0568 0x090c 0x03 0x01
+#define IMX94_PAD_XSPI1_DATA1__FLEXIO1_3_3_FLEXIO1          0x0264 0x0568 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_DATA1__GPIO7_IO17                   0x0264 0x0568 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_DATA2__XSPI1_A_DATA2                0x0268 0x056c 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_DATA2__SAI2_TX_DATA0                0x0268 0x056c 0x0000 0x01 0x00
+#define IMX94_PAD_XSPI1_DATA2__XSPI_SLV_DATA2               0x0268 0x056c 0x0910 0x03 0x01
+#define IMX94_PAD_XSPI1_DATA2__FLEXIO1_3_3_FLEXIO2          0x0268 0x056c 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_DATA2__GPIO7_IO18                   0x0268 0x056c 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_DATA3__XSPI1_A_DATA3                0x026c 0x0570 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_DATA3__SAI2_RX_DATA0                0x026c 0x0570 0x07f0 0x01 0x03
+#define IMX94_PAD_XSPI1_DATA3__SAI2_MCLK                    0x026c 0x0570 0x07e8 0x02 0x02
+#define IMX94_PAD_XSPI1_DATA3__XSPI_SLV_DATA3               0x026c 0x0570 0x0914 0x03 0x01
+#define IMX94_PAD_XSPI1_DATA3__FLEXIO1_3_3_FLEXIO3          0x026c 0x0570 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_DATA3__GPIO7_IO19                   0x026c 0x0570 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_DATA4__XSPI1_A_DATA4                0x0270 0x0574 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_DATA4__SAI4_RX_SYNC                 0x0270 0x0574 0x0814 0x01 0x02
+#define IMX94_PAD_XSPI1_DATA4__XSPI_SLV_DATA4               0x0270 0x0574 0x0918 0x03 0x01
+#define IMX94_PAD_XSPI1_DATA4__FLEXIO1_3_3_FLEXIO4          0x0270 0x0574 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_DATA4__GPIO7_IO20                   0x0270 0x0574 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_DATA5__XSPI1_A_DATA5                0x0274 0x0578 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_DATA5__SAI4_TX_SYNC                 0x0274 0x0578 0x081c 0x01 0x02
+#define IMX94_PAD_XSPI1_DATA5__XSPI_SLV_DATA5               0x0274 0x0578 0x091c 0x03 0x01
+#define IMX94_PAD_XSPI1_DATA5__FLEXIO1_3_3_FLEXIO5          0x0274 0x0578 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_DATA5__GPIO7_IO21                   0x0274 0x0578 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_DATA6__XSPI1_A_DATA6                0x0278 0x057c 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_DATA6__SAI4_TX_DATA0                0x0278 0x057c 0x0000 0x01 0x00
+#define IMX94_PAD_XSPI1_DATA6__XSPI_SLV_DATA6               0x0278 0x057c 0x0920 0x03 0x01
+#define IMX94_PAD_XSPI1_DATA6__FLEXIO1_3_3_FLEXIO6          0x0278 0x057c 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_DATA6__GPIO7_IO22                   0x0278 0x057c 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_DATA7__XSPI1_A_DATA7                0x027c 0x0580 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_DATA7__SAI4_RX_DATA0                0x027c 0x0580 0x0810 0x01 0x02
+#define IMX94_PAD_XSPI1_DATA7__SAI4_MCLK                    0x027c 0x0580 0x0808 0x02 0x02
+#define IMX94_PAD_XSPI1_DATA7__XSPI_SLV_DATA7               0x027c 0x0580 0x0924 0x03 0x01
+#define IMX94_PAD_XSPI1_DATA7__FLEXIO1_3_3_FLEXIO7          0x027c 0x0580 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_DATA7__GPIO7_IO23                   0x027c 0x0580 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS                    0x0280 0x0584 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_DQS__SAI2_TX_BCLK                   0x0280 0x0584 0x07f8 0x01 0x03
+#define IMX94_PAD_XSPI1_DQS__XSPI_SLV_DQS                   0x0280 0x0584 0x0900 0x03 0x01
+#define IMX94_PAD_XSPI1_DQS__FLEXIO1_3_3_FLEXIO8            0x0280 0x0584 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_DQS__GPIO7_IO24                     0x0280 0x0584 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_SCLK__XSPI1_A_SCLK                  0x0284 0x0588 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_SCLK__SAI4_TX_BCLK                  0x0284 0x0588 0x0818 0x01 0x02
+#define IMX94_PAD_XSPI1_SCLK__XSPI_SLV_CLK                  0x0284 0x0588 0x0904 0x03 0x01
+#define IMX94_PAD_XSPI1_SCLK__FLEXIO1_3_3_FLEXIO9           0x0284 0x0588 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_SCLK__GPIO7_IO25                    0x0284 0x0588 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_SS0_B__XSPI1_A_SS0_B                0x0288 0x058c 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_SS0_B__SAI4_RX_BCLK                 0x0288 0x058c 0x080c 0x01 0x02
+#define IMX94_PAD_XSPI1_SS0_B__XSPI_SLV_CS                  0x0288 0x058c 0x08fc 0x03 0x01
+#define IMX94_PAD_XSPI1_SS0_B__FLEXIO1_3_3_FLEXIO10         0x0288 0x058c 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_SS0_B__GPIO7_IO26                   0x0288 0x058c 0x0000 0x05 0x00
+
+#define IMX94_PAD_XSPI1_SS1_B__XSPI1_A_SS1_B                0x028c 0x0590 0x0000 0x00 0x00
+#define IMX94_PAD_XSPI1_SS1_B__SAI2_RX_BCLK                 0x028c 0x0590 0x07ec 0x01 0x02
+#define IMX94_PAD_XSPI1_SS1_B__FLEXPWM3_PWMX3               0x028c 0x0590 0x0000 0x03 0x00
+#define IMX94_PAD_XSPI1_SS1_B__FLEXIO1_3_3_FLEXIO11         0x028c 0x0590 0x0000 0x04 0x00
+#define IMX94_PAD_XSPI1_SS1_B__GPIO7_IO27                   0x028c 0x0590 0x0000 0x05 0x00
+#define IMX94_PAD_XSPI1_SS1_B__SINC1_MOD_CLK0               0x028c 0x0590 0x0000 0x06 0x00
+#define IMX94_PAD_XSPI1_SS1_B__SINC_FILTER_GLUE1_BREAK      0x028c 0x0590 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_CD_B__USDHC2_CD_B                     0x0290 0x0594 0x0000 0x00 0x00
+#define IMX94_PAD_SD2_CD_B__NETC_PINMUX_ETH4_RX_CTL         0x0290 0x0594 0x0634 0x01 0x01
+#define IMX94_PAD_SD2_CD_B__I3C2_SCL                        0x0290 0x0594 0x0720 0x02 0x03
+#define IMX94_PAD_SD2_CD_B__NETC_1588MUX_INOUT9             0x0290 0x0594 0x0670 0x03 0x02
+#define IMX94_PAD_SD2_CD_B__FLEXIO2_4_2_FLEXIO0             0x0290 0x0594 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_CD_B__GPIO4_IO20                      0x0290 0x0594 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_CD_B__XBAR1_XBAR_INOUT13              0x0290 0x0594 0x0890 0x06 0x02
+#define IMX94_PAD_SD2_CD_B__SINC2_EMCLK0                    0x0290 0x0594 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_CLK__USDHC2_CLK                       0x0294 0x0598 0x0000 0x00 0x00
+#define IMX94_PAD_SD2_CLK__NETC_PINMUX_ETH4_TX_CLK          0x0294 0x0598 0x0648 0x01 0x01
+#define IMX94_PAD_SD2_CLK__I3C2_SDA                         0x0294 0x0598 0x0724 0x02 0x03
+#define IMX94_PAD_SD2_CLK__NETC_1588MUX_INOUT8              0x0294 0x0598 0x066c 0x03 0x02
+#define IMX94_PAD_SD2_CLK__FLEXIO2_4_2_FLEXIO1              0x0294 0x0598 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_CLK__GPIO4_IO21                       0x0294 0x0598 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_CLK__OBSERVE0                         0x0294 0x0598 0x0000 0x06 0x00
+#define IMX94_PAD_SD2_CLK__SINC2_EMBIT0                     0x0294 0x0598 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_CMD__USDHC2_CMD                       0x0298 0x059c 0x0000 0x00 0x00
+#define IMX94_PAD_SD2_CMD__NETC_PINMUX_ETH4_TX_CTL          0x0298 0x059c 0x0000 0x01 0x00
+#define IMX94_PAD_SD2_CMD__I3C2_PUR                         0x0298 0x059c 0x0000 0x02 0x00
+#define IMX94_PAD_SD2_CMD__I3C2_PUR_B                       0x0298 0x059c 0x0000 0x03 0x00
+#define IMX94_PAD_SD2_CMD__FLEXIO2_4_2_FLEXIO2              0x0298 0x059c 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_CMD__GPIO4_IO22                       0x0298 0x059c 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_CMD__OBSERVE1                         0x0298 0x059c 0x0000 0x06 0x00
+#define IMX94_PAD_SD2_CMD__SINC2_EMCLK1                     0x0298 0x059c 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_DATA0__USDHC2_DATA0                   0x029c 0x05a0 0x0000 0x00 0x00
+#define IMX94_PAD_SD2_DATA0__NETC_PINMUX_ETH4_TXD0          0x029c 0x05a0 0x0000 0x01 0x00
+#define IMX94_PAD_SD2_DATA0__CAN2_TX                        0x029c 0x05a0 0x0000 0x02 0x00
+#define IMX94_PAD_SD2_DATA0__NETC_1588MUX_INOUT7            0x029c 0x05a0 0x0668 0x03 0x02
+#define IMX94_PAD_SD2_DATA0__FLEXIO2_4_2_FLEXIO3            0x029c 0x05a0 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_DATA0__GPIO4_IO23                     0x029c 0x05a0 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_DATA0__OBSERVE2                       0x029c 0x05a0 0x0000 0x06 0x00
+#define IMX94_PAD_SD2_DATA0__SINC2_EMBIT1                   0x029c 0x05a0 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_DATA1__USDHC2_DATA1                   0x02a0 0x05a4 0x0000 0x00 0x00
+#define IMX94_PAD_SD2_DATA1__NETC_PINMUX_ETH4_TXD1          0x02a0 0x05a4 0x0000 0x01 0x00
+#define IMX94_PAD_SD2_DATA1__CAN2_RX                        0x02a0 0x05a4 0x067c 0x02 0x04
+#define IMX94_PAD_SD2_DATA1__NETC_1588MUX_INOUT6            0x02a0 0x05a4 0x0664 0x03 0x02
+#define IMX94_PAD_SD2_DATA1__FLEXIO2_4_2_FLEXIO4            0x02a0 0x05a4 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_DATA1__GPIO4_IO24                     0x02a0 0x05a4 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_DATA1__XBAR1_XBAR_INOUT14             0x02a0 0x05a4 0x0894 0x06 0x02
+#define IMX94_PAD_SD2_DATA1__SINC2_EMCLK2                   0x02a0 0x05a4 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_DATA2__USDHC2_DATA2                   0x02a4 0x05a8 0x0000 0x00 0x00
+#define IMX94_PAD_SD2_DATA2__NETC_PINMUX_ETH4_TXD2          0x02a4 0x05a8 0x0000 0x01 0x00
+#define IMX94_PAD_SD2_DATA2__MQS2_RIGHT                     0x02a4 0x05a8 0x0000 0x02 0x00
+#define IMX94_PAD_SD2_DATA2__NETC_1588MUX_INOUT5            0x02a4 0x05a8 0x0660 0x03 0x02
+#define IMX94_PAD_SD2_DATA2__FLEXIO2_4_2_FLEXIO5            0x02a4 0x05a8 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_DATA2__GPIO4_IO25                     0x02a4 0x05a8 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_DATA2__XBAR1_XBAR_INOUT15             0x02a4 0x05a8 0x0898 0x06 0x01
+#define IMX94_PAD_SD2_DATA2__SINC2_EMBIT2                   0x02a4 0x05a8 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_DATA3__USDHC2_DATA3                   0x02a8 0x05ac 0x0000 0x00 0x00
+#define IMX94_PAD_SD2_DATA3__NETC_PINMUX_ETH4_TXD3          0x02a8 0x05ac 0x0000 0x01 0x00
+#define IMX94_PAD_SD2_DATA3__MQS2_LEFT                      0x02a8 0x05ac 0x0000 0x02 0x00
+#define IMX94_PAD_SD2_DATA3__LPTMR2_ALT0                    0x02a8 0x05ac 0x0780 0x03 0x01
+#define IMX94_PAD_SD2_DATA3__FLEXIO2_4_2_FLEXIO6            0x02a8 0x05ac 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_DATA3__GPIO4_IO26                     0x02a8 0x05ac 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_DATA3__XBAR1_XBAR_INOUT16             0x02a8 0x05ac 0x089c 0x06 0x01
+#define IMX94_PAD_SD2_DATA3__SINC2_EMCLK3                   0x02a8 0x05ac 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_RESET_B__USDHC2_RESET_B               0x02ac 0x05b0 0x0000 0x00 0x00
+#define IMX94_PAD_SD2_RESET_B__NETC_PINMUX_ETH4_RXD0        0x02ac 0x05b0 0x0638 0x01 0x01
+#define IMX94_PAD_SD2_RESET_B__NETC_1588MUX_INOUT4          0x02ac 0x05b0 0x065c 0x02 0x02
+#define IMX94_PAD_SD2_RESET_B__LPTMR2_ALT1                  0x02ac 0x05b0 0x0784 0x03 0x01
+#define IMX94_PAD_SD2_RESET_B__FLEXIO2_4_2_FLEXIO7          0x02ac 0x05b0 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_RESET_B__GPIO4_IO27                   0x02ac 0x05b0 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_RESET_B__XBAR1_XBAR_INOUT17           0x02ac 0x05b0 0x08a0 0x06 0x01
+#define IMX94_PAD_SD2_RESET_B__SINC2_EMBIT3                 0x02ac 0x05b0 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_GPIO0__USDHC2_WP                      0x02b0 0x05b4 0x0854 0x00 0x03
+#define IMX94_PAD_SD2_GPIO0__NETC_PINMUX_ETH4_RXD1          0x02b0 0x05b4 0x063c 0x01 0x01
+#define IMX94_PAD_SD2_GPIO0__NETC_1588MUX_INOUT3            0x02b0 0x05b4 0x0658 0x03 0x02
+#define IMX94_PAD_SD2_GPIO0__FLEXIO2_4_2_FLEXIO8            0x02b0 0x05b4 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_GPIO0__GPIO4_IO28                     0x02b0 0x05b4 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_GPIO0__XBAR1_XBAR_INOUT18             0x02b0 0x05b4 0x08a4 0x06 0x01
+#define IMX94_PAD_SD2_GPIO0__SINC2_MOD_CLK1                 0x02b0 0x05b4 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_GPIO1__LPTMR2_ALT2                    0x02b4 0x05b8 0x0788 0x00 0x01
+#define IMX94_PAD_SD2_GPIO1__NETC_PINMUX_ETH4_RXD2          0x02b4 0x05b8 0x0640 0x01 0x01
+#define IMX94_PAD_SD2_GPIO1__ECAT_CLK25                     0x02b4 0x05b8 0x0000 0x02 0x00
+#define IMX94_PAD_SD2_GPIO1__NETC_1588MUX_INOUT2            0x02b4 0x05b8 0x0654 0x03 0x02
+#define IMX94_PAD_SD2_GPIO1__FLEXIO2_4_2_FLEXIO9            0x02b4 0x05b8 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_GPIO1__GPIO4_IO29                     0x02b4 0x05b8 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_GPIO1__XBAR1_XBAR_INOUT19             0x02b4 0x05b8 0x08a8 0x06 0x01
+#define IMX94_PAD_SD2_GPIO1__SINC2_MOD_CLK0                 0x02b4 0x05b8 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_GPIO2__NETC_PINMUX_ETH4_RXD3          0x02b8 0x05bc 0x0644 0x01 0x01
+#define IMX94_PAD_SD2_GPIO2__CAN5_TX                        0x02b8 0x05bc 0x0000 0x02 0x00
+#define IMX94_PAD_SD2_GPIO2__NETC_1588MUX_INOUT1            0x02b8 0x05bc 0x0650 0x03 0x02
+#define IMX94_PAD_SD2_GPIO2__FLEXIO2_4_2_FLEXIO10           0x02b8 0x05bc 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_GPIO2__GPIO4_IO30                     0x02b8 0x05bc 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_GPIO2__XBAR1_XBAR_INOUT20             0x02b8 0x05bc 0x08ac 0x06 0x01
+#define IMX94_PAD_SD2_GPIO2__SINC2_MOD_CLK2                 0x02b8 0x05bc 0x0000 0x07 0x00
+
+#define IMX94_PAD_SD2_GPIO3__NETC_PINMUX_ETH4_RX_CLK        0x02bc 0x05c0 0x0630 0x01 0x01
+#define IMX94_PAD_SD2_GPIO3__CAN5_RX                        0x02bc 0x05c0 0x0688 0x02 0x04
+#define IMX94_PAD_SD2_GPIO3__NETC_1588MUX_INOUT0            0x02bc 0x05c0 0x064c 0x03 0x02
+#define IMX94_PAD_SD2_GPIO3__FLEXIO2_4_2_FLEXIO11           0x02bc 0x05c0 0x0000 0x04 0x00
+#define IMX94_PAD_SD2_GPIO3__GPIO4_IO31                     0x02bc 0x05c0 0x0000 0x05 0x00
+#define IMX94_PAD_SD2_GPIO3__XBAR1_XBAR_INOUT21             0x02bc 0x05c0 0x0000 0x06 0x00
+#define IMX94_PAD_SD2_GPIO3__SINC_FILTER_GLUE2_BREAK        0x02bc 0x05c0 0x0000 0x07 0x00
+
+#define IMX94_PAD_I2C1_SCL__LPI2C1_SCL                      0x02c0 0x05c4 0x0000 0x00 0x00
+#define IMX94_PAD_I2C1_SCL__I3C1_SCL                        0x02c0 0x05c4 0x0000 0x01 0x00
+#define IMX94_PAD_I2C1_SCL__LPUART1_DCD_B                   0x02c0 0x05c4 0x0000 0x02 0x00
+#define IMX94_PAD_I2C1_SCL__TPM2_CH0                        0x02c0 0x05c4 0x0000 0x03 0x00
+#define IMX94_PAD_I2C1_SCL__SAI1_RX_SYNC                    0x02c0 0x05c4 0x0000 0x04 0x00
+#define IMX94_PAD_I2C1_SCL__GPIO1_IO0                       0x02c0 0x05c4 0x0000 0x05 0x00
+
+#define IMX94_PAD_I2C1_SDA__LPI2C1_SDA                      0x02c4 0x05c8 0x0000 0x00 0x00
+#define IMX94_PAD_I2C1_SDA__I3C1_SDA                        0x02c4 0x05c8 0x0000 0x01 0x00
+#define IMX94_PAD_I2C1_SDA__LPUART1_RIN_B                   0x02c4 0x05c8 0x0000 0x02 0x00
+#define IMX94_PAD_I2C1_SDA__TPM2_CH1                        0x02c4 0x05c8 0x0000 0x03 0x00
+#define IMX94_PAD_I2C1_SDA__SAI1_RX_BCLK                    0x02c4 0x05c8 0x0000 0x04 0x00
+#define IMX94_PAD_I2C1_SDA__GPIO1_IO1                       0x02c4 0x05c8 0x0000 0x05 0x00
+
+#define IMX94_PAD_I2C2_SCL__LPI2C2_SCL                      0x02c8 0x05cc 0x0000 0x00 0x00
+#define IMX94_PAD_I2C2_SCL__I3C1_PUR                        0x02c8 0x05cc 0x0000 0x01 0x00
+#define IMX94_PAD_I2C2_SCL__LPUART2_DCD_B                   0x02c8 0x05cc 0x0000 0x02 0x00
+#define IMX94_PAD_I2C2_SCL__TPM2_CH2                        0x02c8 0x05cc 0x0000 0x03 0x00
+#define IMX94_PAD_I2C2_SCL__GPT1_CLK                        0x02c8 0x05cc 0x060c 0x04 0x00
+#define IMX94_PAD_I2C2_SCL__GPIO1_IO2                       0x02c8 0x05cc 0x0000 0x05 0x00
+#define IMX94_PAD_I2C2_SCL__I3C1_PUR_B                      0x02c8 0x05cc 0x0000 0x06 0x00
+#define IMX94_PAD_I2C2_SCL__LPIT1_TRIGGER0                  0x02c8 0x05cc 0x0000 0x07 0x00
+
+#define IMX94_PAD_I2C2_SDA__LPI2C2_SDA                      0x02cc 0x05d0 0x0000 0x00 0x00
+#define IMX94_PAD_I2C2_SDA__LPI2C1_HREQ                     0x02cc 0x05d0 0x0000 0x01 0x00
+#define IMX94_PAD_I2C2_SDA__LPUART2_RIN_B                   0x02cc 0x05d0 0x0000 0x02 0x00
+#define IMX94_PAD_I2C2_SDA__TPM2_CH3                        0x02cc 0x05d0 0x0000 0x03 0x00
+#define IMX94_PAD_I2C2_SDA__SAI1_MCLK                       0x02cc 0x05d0 0x0620 0x04 0x00
+#define IMX94_PAD_I2C2_SDA__GPIO1_IO3                       0x02cc 0x05d0 0x0000 0x05 0x00
+#define IMX94_PAD_I2C2_SDA__EWM_OUT_B                       0x02cc 0x05d0 0x0000 0x06 0x00
+#define IMX94_PAD_I2C2_SDA__LPIT1_TRIGGER1                  0x02cc 0x05d0 0x0000 0x07 0x00
+
+#define IMX94_PAD_UART1_RXD__LPUART1_RX                     0x02d0 0x05d4 0x0000 0x00 0x00
+#define IMX94_PAD_UART1_RXD__S400_UART_RX                   0x02d0 0x05d4 0x0000 0x01 0x00
+#define IMX94_PAD_UART1_RXD__LPSPI2_SIN                     0x02d0 0x05d4 0x0000 0x02 0x00
+#define IMX94_PAD_UART1_RXD__TPM1_CH0                       0x02d0 0x05d4 0x0000 0x03 0x00
+#define IMX94_PAD_UART1_RXD__GPT1_CAPTURE1                  0x02d0 0x05d4 0x0000 0x04 0x00
+#define IMX94_PAD_UART1_RXD__GPIO1_IO4                      0x02d0 0x05d4 0x0000 0x05 0x00
+
+#define IMX94_PAD_UART1_TXD__LPUART1_TX                     0x02d4 0x05d8 0x0000 0x00 0x00
+#define IMX94_PAD_UART1_TXD__S400_UART_TX                   0x02d4 0x05d8 0x0000 0x01 0x00
+#define IMX94_PAD_UART1_TXD__LPSPI2_PCS0                    0x02d4 0x05d8 0x0000 0x02 0x00
+#define IMX94_PAD_UART1_TXD__TPM1_CH1                       0x02d4 0x05d8 0x0000 0x03 0x00
+#define IMX94_PAD_UART1_TXD__GPT1_COMPARE1                  0x02d4 0x05d8 0x0000 0x04 0x00
+#define IMX94_PAD_UART1_TXD__GPIO1_IO5                      0x02d4 0x05d8 0x0000 0x05 0x00
+
+#define IMX94_PAD_UART2_RXD__LPUART2_RX                     0x02d8 0x05dc 0x0000 0x00 0x00
+#define IMX94_PAD_UART2_RXD__LPUART1_CTS_B                  0x02d8 0x05dc 0x0000 0x01 0x00
+#define IMX94_PAD_UART2_RXD__LPSPI2_SOUT                    0x02d8 0x05dc 0x0000 0x02 0x00
+#define IMX94_PAD_UART2_RXD__TPM1_CH2                       0x02d8 0x05dc 0x0000 0x03 0x00
+#define IMX94_PAD_UART2_RXD__SAI1_MCLK                      0x02d8 0x05dc 0x0620 0x04 0x01
+#define IMX94_PAD_UART2_RXD__GPIO1_IO6                      0x02d8 0x05dc 0x0000 0x05 0x00
+#define IMX94_PAD_UART2_RXD__GPT1_CLK                       0x02d8 0x05dc 0x060c 0x06 0x01
+#define IMX94_PAD_UART2_RXD__LPIT1_TRIGGER2                 0x02d8 0x05dc 0x0000 0x07 0x00
+
+#define IMX94_PAD_UART2_TXD__LPUART2_TX                     0x02dc 0x05e0 0x0000 0x00 0x00
+#define IMX94_PAD_UART2_TXD__LPUART1_RTS_B                  0x02dc 0x05e0 0x0000 0x01 0x00
+#define IMX94_PAD_UART2_TXD__LPSPI2_SCK                     0x02dc 0x05e0 0x0000 0x02 0x00
+#define IMX94_PAD_UART2_TXD__TPM1_CH3                       0x02dc 0x05e0 0x0000 0x03 0x00
+#define IMX94_PAD_UART2_TXD__GPIO1_IO7                      0x02dc 0x05e0 0x0000 0x05 0x00
+
+#define IMX94_PAD_PDM_CLK__PDM_CLK                          0x02e0 0x05e4 0x0000 0x00 0x00
+#define IMX94_PAD_PDM_CLK__MQS1_LEFT                        0x02e0 0x05e4 0x0000 0x01 0x00
+#define IMX94_PAD_PDM_CLK__LPTMR1_ALT0                      0x02e0 0x05e4 0x0000 0x04 0x00
+#define IMX94_PAD_PDM_CLK__GPIO1_IO8                        0x02e0 0x05e4 0x0000 0x05 0x00
+#define IMX94_PAD_PDM_CLK__CAN1_TX                          0x02e0 0x05e4 0x0000 0x06 0x00
+#define IMX94_PAD_PDM_CLK__EWM_OUT_B                        0x02e0 0x05e4 0x0000 0x07 0x00
+
+#define IMX94_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0          0x02e4 0x05e8 0x0610 0x00 0x02
+#define IMX94_PAD_PDM_BIT_STREAM0__MQS1_RIGHT               0x02e4 0x05e8 0x0000 0x01 0x00
+#define IMX94_PAD_PDM_BIT_STREAM0__LPSPI1_PCS1              0x02e4 0x05e8 0x0000 0x02 0x00
+#define IMX94_PAD_PDM_BIT_STREAM0__TPM1_EXTCLK              0x02e4 0x05e8 0x0000 0x03 0x00
+#define IMX94_PAD_PDM_BIT_STREAM0__LPTMR1_ALT1              0x02e4 0x05e8 0x0000 0x04 0x00
+#define IMX94_PAD_PDM_BIT_STREAM0__GPIO1_IO9                0x02e4 0x05e8 0x0000 0x05 0x00
+#define IMX94_PAD_PDM_BIT_STREAM0__CAN1_RX                  0x02e4 0x05e8 0x0608 0x06 0x00
+
+#define IMX94_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1          0x02e8 0x05ec 0x0614 0x00 0x03
+#define IMX94_PAD_PDM_BIT_STREAM1__NMI_GLUE_NMI             0x02e8 0x05ec 0x0000 0x01 0x00
+#define IMX94_PAD_PDM_BIT_STREAM1__LPSPI2_PCS1              0x02e8 0x05ec 0x0000 0x02 0x00
+#define IMX94_PAD_PDM_BIT_STREAM1__TPM2_EXTCLK              0x02e8 0x05ec 0x0000 0x03 0x00
+#define IMX94_PAD_PDM_BIT_STREAM1__LPTMR1_ALT2              0x02e8 0x05ec 0x0000 0x04 0x00
+#define IMX94_PAD_PDM_BIT_STREAM1__GPIO1_IO10               0x02e8 0x05ec 0x0000 0x05 0x00
+#define IMX94_PAD_PDM_BIT_STREAM1__EXT_CLK1                 0x02e8 0x05ec 0x0624 0x06 0x00
+
+#define IMX94_PAD_SAI1_TXFS__SAI1_TX_SYNC                   0x02ec 0x05f0 0x0000 0x00 0x00
+#define IMX94_PAD_SAI1_TXFS__SAI1_TX_DATA1                  0x02ec 0x05f0 0x0000 0x01 0x00
+#define IMX94_PAD_SAI1_TXFS__LPSPI1_PCS0                    0x02ec 0x05f0 0x0000 0x02 0x00
+#define IMX94_PAD_SAI1_TXFS__LPUART2_DTR_B                  0x02ec 0x05f0 0x0000 0x03 0x00
+#define IMX94_PAD_SAI1_TXFS__MQS1_LEFT                      0x02ec 0x05f0 0x0000 0x04 0x00
+#define IMX94_PAD_SAI1_TXFS__GPIO1_IO11                     0x02ec 0x05f0 0x0000 0x05 0x00
+#define IMX94_PAD_SAI1_TXFS__EWM_OUT_B                      0x02ec 0x05f0 0x0000 0x06 0x00
+
+#define IMX94_PAD_SAI1_TXC__SAI1_TX_BCLK                    0x02f0 0x05f4 0x0000 0x00 0x00
+#define IMX94_PAD_SAI1_TXC__LPUART2_CTS_B                   0x02f0 0x05f4 0x0000 0x01 0x00
+#define IMX94_PAD_SAI1_TXC__LPSPI1_SIN                      0x02f0 0x05f4 0x0000 0x02 0x00
+#define IMX94_PAD_SAI1_TXC__LPUART1_DSR_B                   0x02f0 0x05f4 0x0000 0x03 0x00
+#define IMX94_PAD_SAI1_TXC__CAN1_RX                         0x02f0 0x05f4 0x0608 0x04 0x01
+#define IMX94_PAD_SAI1_TXC__GPIO1_IO12                      0x02f0 0x05f4 0x0000 0x05 0x00
+
+#define IMX94_PAD_SAI1_TXD0__SAI1_TX_DATA0                  0x02f4 0x05f8 0x0000 0x00 0x00
+#define IMX94_PAD_SAI1_TXD0__LPUART2_RTS_B                  0x02f4 0x05f8 0x0000 0x01 0x00
+#define IMX94_PAD_SAI1_TXD0__LPSPI1_SCK                     0x02f4 0x05f8 0x0000 0x02 0x00
+#define IMX94_PAD_SAI1_TXD0__LPUART1_DTR_B                  0x02f4 0x05f8 0x0000 0x03 0x00
+#define IMX94_PAD_SAI1_TXD0__CAN1_TX                        0x02f4 0x05f8 0x0000 0x04 0x00
+#define IMX94_PAD_SAI1_TXD0__GPIO1_IO13                     0x02f4 0x05f8 0x0000 0x05 0x00
+
+#define IMX94_PAD_SAI1_RXD0__SAI1_RX_DATA0                  0x02f8 0x05fc 0x0000 0x00 0x00
+#define IMX94_PAD_SAI1_RXD0__SAI1_MCLK                      0x02f8 0x05fc 0x0620 0x01 0x02
+#define IMX94_PAD_SAI1_RXD0__LPSPI1_SOUT                    0x02f8 0x05fc 0x0000 0x02 0x00
+#define IMX94_PAD_SAI1_RXD0__LPUART2_DSR_B                  0x02f8 0x05fc 0x0000 0x03 0x00
+#define IMX94_PAD_SAI1_RXD0__MQS1_RIGHT                     0x02f8 0x05fc 0x0000 0x04 0x00
+#define IMX94_PAD_SAI1_RXD0__GPIO1_IO14                     0x02f8 0x05fc 0x0000 0x05 0x00
+#define IMX94_PAD_SAI1_RXD0__LPIT1_TRIGGER3                 0x02f8 0x05fc 0x0000 0x07 0x00
+
+#define IMX94_PAD_WDOG_ANY__WDOG_ANY                        0x02fc 0x0600 0x0000 0x00 0x00
+#define IMX94_PAD_WDOG_ANY__FCCU_EOUT1                      0x02fc 0x0600 0x0000 0x01 0x00
+#define IMX94_PAD_WDOG_ANY__GPIO1_IO15                      0x02fc 0x0600 0x0000 0x05 0x00
+#endif /* __DTS_IMX94_PINFUNC_H */
diff --git a/arch/arm64/boot/dts/freescale/imx94-power.h b/arch/arm64/boot/dts/freescale/imx94-power.h
new file mode 100644
index 000000000000..282167494a1d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx94-power.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ *  Copyright 2024-2025 NXP
+ */
+
+#ifndef __IMX94_POWER_H__
+#define __IMX94_POWER_H__
+
+#define IMX94_PD_ANA		0
+#define IMX94_PD_AON		1
+#define IMX94_PD_BBSM		2
+#define IMX94_PD_M71		3
+#define IMX94_PD_CCMSRCGPC	4
+#define IMX94_PD_A55C0		5
+#define IMX94_PD_A55C1		6
+#define IMX94_PD_A55C2		7
+#define IMX94_PD_A55C3		8
+#define IMX94_PD_A55P		9
+#define IMX94_PD_DDR		10
+#define IMX94_PD_DISPLAY	11
+#define IMX94_PD_M70		12
+#define IMX94_PD_HSIO_TOP	13
+#define IMX94_PD_HSIO_WAON	14
+#define IMX94_PD_NETC		15
+#define IMX94_PD_NOC		16
+#define IMX94_PD_NPU		17
+#define IMX94_PD_WAKEUP		18
+
+#define IMX94_PERF_M33		0
+#define IMX94_PERF_M33S		1
+#define IMX94_PERF_WAKEUP	2
+#define IMX94_PERF_M70		3
+#define IMX94_PERF_M71		4
+#define IMX94_PERF_DRAM		5
+#define IMX94_PERF_HSIO		6
+#define IMX94_PERF_NPU		7
+#define IMX94_PERF_NOC		8
+#define IMX94_PERF_A55		9
+#define IMX94_PERF_DISP		10
+
+#endif
diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
new file mode 100644
index 000000000000..1a5738332b17
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -0,0 +1,1141 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2025 NXP
+ */
+
+#include <dt-bindings/dma/fsl-edma.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#include "imx94-clock.h"
+#include "imx94-pinfunc.h"
+#include "imx94-power.h"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	osc_24m: clock-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc_24m";
+	};
+
+	dummy: clock-dummy {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+		clock-output-names = "dummy";
+	};
+
+	clk_ext1: clock-ext1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <133000000>;
+		clock-output-names = "clk_ext1";
+	};
+
+	sai1_mclk: clock-sai1-mclk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+		clock-output-names = "sai1_mclk";
+	};
+
+	sai2_mclk: clock-sai2-mclk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+		clock-output-names = "sai2_mclk";
+	};
+
+	sai3_mclk: clock-sai3-mclk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+		clock-output-names = "sai3_mclk";
+	};
+
+	sai4_mclk: clock-sai4-mclk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+		clock-output-names = "sai4_mclk";
+	};
+
+	firmware {
+
+		scmi {
+			compatible = "arm,scmi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mboxes = <&mu2 5 0>, <&mu2 3 0>, <&mu2 3 1>, <&mu2 5 1>;
+			shmem = <&scmi_buf0>, <&scmi_buf1>;
+			arm,max-rx-timeout-ms = <5000>;
+
+			scmi_devpd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi_sys_power: protocol@12 {
+				reg = <0x12>;
+			};
+
+			scmi_perf: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+
+			scmi_iomuxc: protocol@19 {
+				reg = <0x19>;
+			};
+
+			scmi_bbm: protocol@81 {
+				reg = <0x81>;
+			};
+
+			scmi_misc: protocol@84 {
+				reg = <0x84>;
+			};
+		};
+	};
+
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <24000000>;
+		interrupt-parent = <&gic>;
+		arm,no-tick-in-suspend;
+	};
+
+	gic: interrupt-controller@48000000 {
+		compatible = "arm,gic-v3";
+		reg = <0 0x48000000 0 0x10000>,
+		      <0 0x48060000 0 0xc0000>;
+		ranges;
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-noncoherent;
+		interrupt-parent = <&gic>;
+
+		its: msi-controller@48040000 {
+			compatible = "arm,gic-v3-its";
+			reg = <0 0x48040000 0 0x20000>;
+			#msi-cells = <1>;
+			dma-noncoherent;
+			msi-controller;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		aips2: bus@42000000 {
+			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0x0 0x42000000 0x0 0x800000>;
+			ranges = <0x42000000 0x0 0x42000000 0x8000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			edma2: dma-controller@42000000 {
+				compatible = "fsl,imx94-edma5", "fsl,imx95-edma5";
+				reg = <0x42000000 0x210000>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "dma";
+				#dma-cells = <3>;
+				dma-channels = <64>;
+				interrupts-extended = <&a55_irqsteer 0>, <&a55_irqsteer 1>, <&a55_irqsteer 2>,
+					<&a55_irqsteer 3>, <&a55_irqsteer 4>, <&a55_irqsteer 5>,
+					<&a55_irqsteer 6>, <&a55_irqsteer 7>, <&a55_irqsteer 8>,
+					<&a55_irqsteer 9>, <&a55_irqsteer 10>, <&a55_irqsteer 11>,
+					<&a55_irqsteer 12>, <&a55_irqsteer 13>, <&a55_irqsteer 14>,
+					<&a55_irqsteer 15>, <&a55_irqsteer 16>, <&a55_irqsteer 17>,
+					<&a55_irqsteer 18>, <&a55_irqsteer 19>, <&a55_irqsteer 20>,
+					<&a55_irqsteer 21>, <&a55_irqsteer 22>, <&a55_irqsteer 23>,
+					<&a55_irqsteer 24>, <&a55_irqsteer 25>, <&a55_irqsteer 26>,
+					<&a55_irqsteer 27>, <&a55_irqsteer 28>, <&a55_irqsteer 29>,
+					<&a55_irqsteer 30>, <&a55_irqsteer 31>, <&a55_irqsteer 64>,
+					<&a55_irqsteer 65>, <&a55_irqsteer 66>, <&a55_irqsteer 67>,
+					<&a55_irqsteer 68>, <&a55_irqsteer 69>, <&a55_irqsteer 70>,
+					<&a55_irqsteer 71>, <&a55_irqsteer 72>, <&a55_irqsteer 73>,
+					<&a55_irqsteer 74>, <&a55_irqsteer 75>, <&a55_irqsteer 76>,
+					<&a55_irqsteer 77>, <&a55_irqsteer 78>, <&a55_irqsteer 79>,
+					<&a55_irqsteer 80>, <&a55_irqsteer 81>, <&a55_irqsteer 82>,
+					<&a55_irqsteer 83>, <&a55_irqsteer 84>, <&a55_irqsteer 85>,
+					<&a55_irqsteer 86>, <&a55_irqsteer 87>, <&a55_irqsteer 88>,
+					<&a55_irqsteer 89>, <&a55_irqsteer 90>, <&a55_irqsteer 91>,
+					<&a55_irqsteer 92>, <&a55_irqsteer 93>, <&a55_irqsteer 94>,
+					<&a55_irqsteer 95>, <&gic GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			mu10: mailbox@42430000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x42430000 0x10000>;
+				interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			i3c2: i3c@42520000 {
+				compatible = "silvaco,i3c-master-v1";
+				reg = <0x42520000 0x10000>;
+				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_I3C2SLOW>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>,
+					 <&dummy>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				status = "disabled";
+			};
+
+			lpi2c3: i2c@42530000 {
+				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
+				reg = <0x42530000 0x10000>;
+				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPI2C3>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma2 5 0 0>, <&edma2 6 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpi2c4: i2c@42540000 {
+				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
+				reg = <0x42540000 0x10000>;
+				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPI2C4>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma4 4 0 0>, <&edma4 5 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpspi3: spi@42550000 {
+				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
+				reg = <0x42550000 0x10000>;
+				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPSPI3>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma2 7 0 0>, <&edma2 8 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpspi4: spi@42560000 {
+				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
+				reg = <0x42560000 0x10000>;
+				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPSPI4>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma4 6 0 0>, <&edma4 7 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpuart3: serial@42570000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x42570000 0x1000>;
+				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART3>;
+				clock-names = "ipg";
+				dmas = <&edma2 10 0 FSL_EDMA_RX>, <&edma2 9 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			lpuart4: serial@42580000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x42580000 0x1000>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART4>;
+				clock-names = "ipg";
+				dmas = <&edma4 10 0 FSL_EDMA_RX>, <&edma4 9 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			lpuart5: serial@42590000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x42590000 0x1000>;
+				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART5>;
+				clock-names = "ipg";
+				dmas = <&edma2 12 0 FSL_EDMA_RX>, <&edma2 11 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			lpuart6: serial@425a0000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x425a0000 0x1000>;
+				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART6>;
+				clock-names = "ipg";
+				dmas = <&edma4 12 0 FSL_EDMA_RX>, <&edma4 11 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			flexcan2: can@425b0000 {
+				compatible = "fsl,imx95-flexcan";
+				reg = <0x425b0000 0x10000>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX94_CLK_CAN2>;
+				clock-names = "ipg", "per";
+				assigned-clocks = <&scmi_clk IMX94_CLK_CAN2>;
+				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+				assigned-clock-rates = <80000000>;
+				fsl,clk-source = /bits/ 8 <0>;
+				status = "disabled";
+			};
+
+			flexcan3: can@425e0000 {
+				compatible = "fsl,imx95-flexcan";
+				reg = <0x425e0000 0x10000>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX94_CLK_CAN3>;
+				clock-names = "ipg", "per";
+				assigned-clocks = <&scmi_clk IMX94_CLK_CAN3>;
+				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+				assigned-clock-rates = <80000000>;
+				fsl,clk-source = /bits/ 8 <0>;
+				status = "disabled";
+			};
+
+			flexcan4: can@425f0000 {
+				compatible = "fsl,imx95-flexcan";
+				reg = <0x425f0000 0x10000>;
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX94_CLK_CAN4>;
+				clock-names = "ipg", "per";
+				assigned-clocks = <&scmi_clk IMX94_CLK_CAN4>;
+				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+				assigned-clock-rates = <80000000>;
+				fsl,clk-source = /bits/ 8 <0>;
+				status = "disabled";
+			};
+
+			flexcan5: can@42600000 {
+				compatible = "fsl,imx95-flexcan";
+				reg = <0x42600000 0x10000>;
+				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX94_CLK_CAN5>;
+				clock-names = "ipg", "per";
+				assigned-clocks = <&scmi_clk IMX94_CLK_CAN5>;
+				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+				assigned-clock-rates = <80000000>;
+				fsl,clk-source = /bits/ 8 <0>;
+				status = "disabled";
+			};
+
+			sai2: sai@42650000 {
+				compatible = "fsl,imx95-sai";
+				reg = <0x42650000 0x10000>;
+				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>, <&dummy>,
+					<&scmi_clk IMX94_CLK_SAI2>, <&dummy>, <&dummy>;
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+				dmas = <&edma2 30 0 FSL_EDMA_RX>, <&edma2 29 0 0>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+
+			sai3: sai@42660000 {
+				compatible = "fsl,imx95-sai";
+				reg = <0x42660000 0x10000>;
+				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>, <&dummy>,
+					<&scmi_clk IMX94_CLK_SAI3>, <&dummy>, <&dummy>;
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+				dmas = <&edma2 32 0 FSL_EDMA_RX>, <&edma2 31 0 0>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+
+			sai4: sai@42670000 {
+				compatible = "fsl,imx95-sai";
+				reg = <0x42670000 0x10000>;
+				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>, <&dummy>,
+					<&scmi_clk IMX94_CLK_SAI4>, <&dummy>, <&dummy>;
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+				dmas = <&edma2 36 0 FSL_EDMA_RX>, <&edma2 35 0 0>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+
+			lpuart7: serial@42690000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x42690000 0x1000>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART7>;
+				clock-names = "ipg";
+				dmas = <&edma2 46 0 FSL_EDMA_RX>, <&edma2 45 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			lpuart8: serial@426a0000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x426a0000 0x1000>;
+				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART8>;
+				clock-names = "ipg";
+				dmas = <&edma4 39 0 FSL_EDMA_RX>, <&edma4 38 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			lpi2c5: i2c@426b0000 {
+				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
+				reg = <0x426b0000 0x10000>;
+				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPI2C5>,
+					 <&scmi_clk IMX94_CLK_BUSAON>;
+				clock-names = "per", "ipg";
+				dmas = <&edma2 37 0 0>, <&edma2 38 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpi2c6: i2c@426c0000 {
+				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
+				reg = <0x426c0000 0x10000>;
+				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPI2C6>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma4 30 0 0>, <&edma4 31 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpi2c7: i2c@426d0000 {
+				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
+				reg = <0x426d0000 0x10000>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPI2C7>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma2 39 0 0>, <&edma2 40 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpi2c8: i2c@426e0000 {
+				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
+				reg = <0x426e0000 0x10000>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPI2C8>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma4 32 0 0>, <&edma4 33 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpspi5: spi@426f0000 {
+				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
+				reg = <0x426f0000 0x10000>;
+				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPSPI5>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma2 41 0 0>, <&edma2 42 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpspi6: spi@42700000 {
+				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
+				reg = <0x42700000 0x10000>;
+				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPSPI6>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma4 34 0 0>, <&edma4 35 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpspi7: spi@42710000 {
+				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
+				reg = <0x42710000 0x10000>;
+				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPSPI7>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma2 43 0 0>, <&edma2 44 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpspi8: spi@42720000 {
+				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
+				reg = <0x42720000 0x10000>;
+				interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPSPI8>,
+					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "per", "ipg";
+				dmas = <&edma4 36 0 0>, <&edma4 37 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			mu11: mailbox@42730000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x42730000 0x10000>;
+				interrupts = <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			edma4: dma-controller@42df0000 {
+				compatible = "fsl,imx94-edma5", "fsl,imx95-edma5";
+				reg = <0x42df0000 0x210000>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				clock-names = "dma";
+				#dma-cells = <3>;
+				dma-channels = <64>;
+				interrupts-extended = <&a55_irqsteer 128>, <&a55_irqsteer 129>,
+					<&a55_irqsteer 130>, <&a55_irqsteer 131>,
+					<&a55_irqsteer 132>, <&a55_irqsteer 133>,
+					<&a55_irqsteer 134>, <&a55_irqsteer 135>,
+					<&a55_irqsteer 136>, <&a55_irqsteer 137>,
+					<&a55_irqsteer 138>, <&a55_irqsteer 139>,
+					<&a55_irqsteer 140>, <&a55_irqsteer 141>,
+					<&a55_irqsteer 142>, <&a55_irqsteer 143>,
+					<&a55_irqsteer 144>, <&a55_irqsteer 145>,
+					<&a55_irqsteer 146>, <&a55_irqsteer 147>,
+					<&a55_irqsteer 148>, <&a55_irqsteer 149>,
+					<&a55_irqsteer 150>, <&a55_irqsteer 151>,
+					<&a55_irqsteer 152>, <&a55_irqsteer 153>,
+					<&a55_irqsteer 154>, <&a55_irqsteer 155>,
+					<&a55_irqsteer 156>, <&a55_irqsteer 157>,
+					<&a55_irqsteer 158>, <&a55_irqsteer 159>,
+					<&a55_irqsteer 192>, <&a55_irqsteer 193>,
+					<&a55_irqsteer 194>, <&a55_irqsteer 195>,
+					<&a55_irqsteer 196>, <&a55_irqsteer 197>,
+					<&a55_irqsteer 198>, <&a55_irqsteer 199>,
+					<&a55_irqsteer 200>, <&a55_irqsteer 201>,
+					<&a55_irqsteer 202>, <&a55_irqsteer 203>,
+					<&a55_irqsteer 204>, <&a55_irqsteer 205>,
+					<&a55_irqsteer 206>, <&a55_irqsteer 207>,
+					<&a55_irqsteer 208>, <&a55_irqsteer 209>,
+					<&a55_irqsteer 210>, <&a55_irqsteer 211>,
+					<&a55_irqsteer 212>, <&a55_irqsteer 213>,
+					<&a55_irqsteer 214>, <&a55_irqsteer 215>,
+					<&a55_irqsteer 216>, <&a55_irqsteer 217>,
+					<&a55_irqsteer 218>, <&a55_irqsteer 219>,
+					<&a55_irqsteer 220>, <&a55_irqsteer 221>,
+					<&a55_irqsteer 222>, <&a55_irqsteer 223>,
+					<&gic GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		aips3: bus@42800000 {
+			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0 0x42800000 0 0x800000>;
+			ranges = <0x42800000 0x0 0x42800000 0x800000>,
+				 <0x28000000 0x0 0x28000000 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usdhc1: mmc@42850000 {
+				compatible = "fsl,imx95-usdhc", "fsl,imx8mm-usdhc";
+				reg = <0x42850000 0x10000>;
+				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
+					 <&scmi_clk IMX94_CLK_USDHC1>;
+				clock-names = "ipg", "ahb", "per";
+				assigned-clocks = <&scmi_clk IMX94_CLK_USDHC1>;
+				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>;
+				assigned-clock-rates = <400000000>;
+				bus-width = <8>;
+				fsl,tuning-start-tap = <1>;
+				fsl,tuning-step = <2>;
+				status = "disabled";
+			};
+
+			usdhc2: mmc@42860000 {
+				compatible = "fsl,imx95-usdhc", "fsl,imx8mm-usdhc";
+				reg = <0x42860000 0x10000>;
+				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
+					 <&scmi_clk IMX94_CLK_USDHC2>;
+				clock-names = "ipg", "ahb", "per";
+				assigned-clocks = <&scmi_clk IMX94_CLK_USDHC2>;
+				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>;
+				assigned-clock-rates = <200000000>;
+				bus-width = <4>;
+				fsl,tuning-start-tap = <1>;
+				fsl,tuning-step = <2>;
+				status = "disabled";
+			};
+
+			usdhc3: mmc@42880000 {
+				compatible = "fsl,imx95-usdhc", "fsl,imx8mm-usdhc";
+				reg = <0x42880000 0x10000>;
+				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
+					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
+					 <&scmi_clk IMX94_CLK_USDHC3>;
+				clock-names = "ipg", "ahb", "per";
+				assigned-clocks = <&scmi_clk IMX94_CLK_USDHC3>;
+				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>;
+				assigned-clock-rates = <200000000>;
+				bus-width = <4>;
+				fsl,tuning-start-tap = <1>;
+				fsl,tuning-step = <2>;
+				status = "disabled";
+			};
+
+			lpuart9: serial@42a50000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x42a50000 0x1000>;
+				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART10>;
+				clock-names = "ipg";
+				dmas = <&edma2 51 0 FSL_EDMA_RX>, <&edma2 50 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			lpuart10: serial@42a60000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x42a60000 0x1000>;
+				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART10>;
+				clock-names = "ipg";
+				dmas = <&edma4 47 0 FSL_EDMA_RX>, <&edma4 46 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			lpuart11: serial@42a70000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x42a70000 0x1000>;
+				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART11>;
+				clock-names = "ipg";
+				dmas = <&edma2 53 0 FSL_EDMA_RX>, <&edma2 52 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			lpuart12: serial@42a80000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x42a80000 0x1000>;
+				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART12>;
+				clock-names = "ipg";
+				dmas = <&edma4 49 0 FSL_EDMA_RX>, <&edma4 48 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			mu12: mailbox@42ac0000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x42ac0000 0x10000>;
+				interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			mu13: mailbox@42ae0000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x42ae0000 0x10000>;
+				interrupts = <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			mu14: mailbox@42b00000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x42b00000 0x10000>;
+				interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			mu15: mailbox@42b20000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x42b20000 0x10000>;
+				interrupts = <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			mu16: mailbox@42b40000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x42b40000 0x10000>;
+				interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			mu17: mailbox@42b60000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x42b60000 0x10000>;
+				interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+		};
+
+		gpio2: gpio@43810000 {
+			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
+			reg = <0x0 0x43810000 0x0 0x1000>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&scmi_iomuxc 0 4 32>;
+		};
+
+		gpio3: gpio@43820000 {
+			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
+			reg = <0x0 0x43820000 0x0 0x1000>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&scmi_iomuxc 0 36 26>;
+		};
+
+		gpio4: gpio@43840000 {
+			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
+			reg = <0x0 0x43840000 0x0 0x1000>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
+				      <&scmi_iomuxc 8 140 12>, <&scmi_iomuxc 20 164 12>;
+		};
+
+		gpio5: gpio@43850000 {
+			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
+			reg = <0x0 0x43850000 0x0 0x1000>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&scmi_iomuxc 0 108 32>;
+		};
+
+		gpio6: gpio@43860000 {
+			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
+			reg = <0x0 0x43860000 0x0 0x1000>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&scmi_iomuxc 0 66 32>;
+		};
+
+		gpio7: gpio@43870000 {
+			compatible = "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
+			reg = <0x0 0x43870000 0x0 0x1000>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152 12>;
+		};
+
+		aips1: bus@44000000 {
+			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0x0 0x44000000 0x0 0x800000>;
+			ranges = <0x44000000 0x0 0x44000000 0x800000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			edma1: dma-controller@44000000 {
+				compatible = "fsl,imx94-edma3", "fsl,imx93-edma3";
+				reg = <0x44000000 0x210000>;
+				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
+				clock-names = "dma";
+				#dma-cells = <3>;
+				dma-channels = <32>;
+				status = "okay";
+			};
+
+			mu1: mailbox@44220000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x44220000 0x10000>;
+				interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			system_counter: timer@44290000 {
+				compatible = "nxp,imx95-sysctr-timer";
+				reg = <0x44290000 0x30000>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&osc_24m>;
+				clock-names = "per";
+				nxp,no-divider;
+			};
+
+			tpm1: pwm@44310000 {
+				compatible = "fsl,imx7ulp-pwm";
+				reg = <0x44310000 0x1000>;
+				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			tpm2: pwm@44320000 {
+				compatible = "fsl,imx7ulp-pwm";
+				reg = <0x44320000 0x1000>;
+				clocks = <&scmi_clk IMX94_CLK_TPM2>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			i3c1: i3c@44330000 {
+				compatible = "silvaco,i3c-master-v1";
+				reg = <0x44330000 0x10000>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_I3C1SLOW>,
+					 <&scmi_clk IMX94_CLK_BUSAON>,
+					 <&dummy>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				status = "disabled";
+			};
+
+			lpi2c1: i2c@44340000 {
+				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
+				reg = <0x44340000 0x10000>;
+				interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPI2C1>,
+					 <&scmi_clk IMX94_CLK_BUSAON>;
+				clock-names = "per", "ipg";
+				dmas = <&edma1 12 0 0>, <&edma1 13 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpi2c2: i2c@44350000 {
+				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
+				reg = <0x44350000 0x10000>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPI2C2>,
+					 <&scmi_clk IMX94_CLK_BUSAON>;
+				clock-names = "per", "ipg";
+				dmas = <&edma1 14 0 0>, <&edma1 15 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpspi1: spi@44360000 {
+				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
+				reg = <0x44360000 0x10000>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPSPI2>,
+					 <&scmi_clk IMX94_CLK_BUSAON>;
+				clock-names = "per", "ipg";
+				dmas = <&edma1 16 0 0>, <&edma1 17 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpspi2: spi@44370000 {
+				compatible = "fsl,imx95-spi", "fsl,imx7ulp-spi";
+				reg = <0x44370000 0x10000>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_LPSPI2>,
+					 <&scmi_clk IMX94_CLK_BUSAON>;
+				clock-names = "per", "ipg";
+				dmas = <&edma1 18 0 0>, <&edma1 19 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
+				status = "disabled";
+			};
+
+			lpuart1: serial@44380000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x44380000 0x1000>;
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART1>;
+				clock-names = "ipg";
+				dmas = <&edma1 21 0 FSL_EDMA_RX>, <&edma1 20 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			lpuart2: serial@44390000 {
+				compatible = "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
+					     "fsl,imx7ulp-lpuart";
+				reg = <0x44390000 0x1000>;
+				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_LPUART2>;
+				clock-names = "ipg";
+				dmas = <&edma1 23 0 FSL_EDMA_RX>, <&edma1 22 0 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			flexcan1: can@443a0000 {
+				compatible = "fsl,imx95-flexcan";
+				reg = <0x443a0000 0x10000>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			sai1: sai@443b0000 {
+				compatible = "fsl,imx95-sai";
+				reg = <0x443b0000 0x10000>;
+				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSAON>, <&dummy>,
+					<&scmi_clk IMX94_CLK_SAI1>, <&dummy>,
+					<&dummy>, <&dummy>;
+				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+				dmas = <&edma1 25 0 FSL_EDMA_RX>, <&edma1 24 0 0>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
+				status = "disabled";
+			};
+
+			adc1: adc@44530000 {
+				compatible = "nxp,imx93-adc";
+				reg = <0x44530000 0x10000>;
+				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_ADC>;
+				clock-names = "ipg";
+				#io-channel-cells = <1>;
+				status = "disabled";
+			};
+
+			mu2: mailbox@445b0000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x445b0000 0x1000>;
+				ranges;
+				interrupts = <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				#mbox-cells = <2>;
+
+				sram0: sram@445b1000 {
+					compatible = "mmio-sram";
+					reg = <0x445b1000 0x400>;
+					ranges = <0x0 0x445b1000 0x400>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					scmi_buf0: scmi-sram-section@0 {
+						compatible = "arm,scmi-shmem";
+						reg = <0x0 0x80>;
+					};
+
+					scmi_buf1: scmi-sram-section@80 {
+						compatible = "arm,scmi-shmem";
+						reg = <0x80 0x80>;
+					};
+				};
+			};
+
+			mu3: mailbox@445d0000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x445d0000 0x10000>;
+				interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			mu4: mailbox@445f0000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x445f0000 0x10000>;
+				interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			mu6: mailbox@44630000 {
+				compatible = "fsl,imx95-mu";
+				reg = <0x44630000 0x10000>;
+				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+				#mbox-cells = <2>;
+				status = "disabled";
+			};
+
+			a55_irqsteer: interrupt-controller@446a0000 {
+				compatible = "fsl,imx-irqsteer";
+				reg = <0x446a0000 0x1000>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
+				clock-names = "ipg";
+				fsl,channel = <0>;
+				fsl,num-irqs = <960>;
+			};
+		};
+
+		aips4: bus@49000000 {
+			compatible = "fsl,aips-bus", "simple-bus";
+			reg = <0x0 0x49000000 0x0 0x800000>;
+			ranges = <0x49000000 0x0 0x49000000 0x800000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			wdog3: watchdog@49220000 {
+				compatible = "fsl,imx93-wdt";
+				reg = <0x49220000 0x10000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				timeout-sec = <40>;
+				fsl,ext-reset-output;
+				status = "disabled";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
new file mode 100644
index 000000000000..a9877fcfd896
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+#include "imx94.dtsi"
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_pd_wait: cpu-pd-wait {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010033>;
+				local-timer-stop;
+				entry-latency-us = <1000>;
+				exit-latency-us = <700>;
+				min-residency-us = <2700>;
+				wakeup-latency-us = <1500>;
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
+			power-domains = <&scmi_perf IMX94_PERF_A55>;
+			power-domain-names = "perf";
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache_l0>;
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
+			power-domains = <&scmi_perf IMX94_PERF_A55>;
+			power-domain-names = "perf";
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache_l1>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
+			power-domains = <&scmi_perf IMX94_PERF_A55>;
+			power-domain-names = "perf";
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache_l2>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
+			power-domains = <&scmi_perf IMX94_PERF_A55>;
+			power-domain-names = "perf";
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache_l3>;
+		};
+
+		l2_cache_l0: l2-cache-l0 {
+			compatible = "cache";
+			cache-size = <65536>;
+			cache-line-size = <64>;
+			cache-sets = <256>;
+			cache-level = <2>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache_l1: l2-cache-l1 {
+			compatible = "cache";
+			cache-size = <65536>;
+			cache-line-size = <64>;
+			cache-sets = <256>;
+			cache-level = <2>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache_l2: l2-cache-l2 {
+			compatible = "cache";
+			cache-size = <65536>;
+			cache-line-size = <64>;
+			cache-sets = <256>;
+			cache-level = <2>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l2_cache_l3: l2-cache-l3 {
+			compatible = "cache";
+			cache-size = <65536>;
+			cache-line-size = <64>;
+			cache-sets = <256>;
+			cache-level = <2>;
+			cache-unified;
+			next-level-cache = <&l3_cache>;
+		};
+
+		l3_cache: l3-cache {
+			compatible = "cache";
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-level = <3>;
+			cache-unified;
+		};
+	};
+};
-- 
2.34.1

