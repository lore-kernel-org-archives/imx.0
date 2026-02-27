Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387933F0753
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772197222; cv=fail; b=KZoYQk4DPA7f2VlBqLHI0htRh4ZfxSynace6uhsvPr8Ck3Gz1zEjKjTR7HnZ5Bk/VRN5B+NUExsDEbLCs7AzBwtLAczlsZ75q/xLiC98BnmF75EgL+o/kZs2In/CdXTckNYe0ClfAglVfupvN9N0fn07WCVfcrh0gK7wfPoEezM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772197222; c=relaxed/simple;
	bh=e6ykjk9mMaJAeTDS9qejdrjVOMhhPKEZxXGRTJRAS2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RuSODiHFRF1+uTH5kC2rdcxSg54xc5wCGVyV4abKVb2StSE8ohXNDqdZdcqjayymxC1G3o08/Hzqk9Jbr4Q7ApDw0EJxZpG4cz1Xkyae0Lk7Y5lKa1jOfHzsw9AQ1yAKMyMLslHgqBrlp9+5h9HFBBXXFRmOEbAQiebVBuAMMgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D7AyKebe; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D7AyKebe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OR76JvVoq/OgY4czDRz9g18P9pz7P7j5hIYWZrP+9kCwgwsCgp8ak913RygqzVEGsrymuLTGv9HwcMIljgQz2dhsQttRgLDE/7+NNug52riyLx2Q+xD8wJ5PR0WZfBka+N00Y42e0eCM3bpoObgZGIuuBf7yS+vC42b2yicePp+rz3+er4MkWek+V1mNQT84UGHtGs4w/doCBbKd1HyJCzUhlXsniOFrcCsCF7Of9xi74+wLp+eD0/aqqIqmKFfnbvqubBr1IQr4y7RIje5VjLtLWGfltug+vY94+ahoHpwskhEkkQXbleE/0WSX5Wfs2hsLQXC+N0khVSBI0+3pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Honw8SrpL9fqcJReYXyddTpUHAJcEt3XfLuiPo0NLis=;
 b=dsDq085/FNu9mtGkCQfoeASVfmdiaJJ/4NplyyfKF8aprtRjShd2He7Cw4QsE7jDgimJHPrQGISyHiKh25VQ5wmF0tz1Cz/0C4oTG1NfSUNTtTL6M2s5FLkool2p8+IxGQPxSML5k46dIBx551m6lHt6gXc5AuXYZ0nGEDPnUP/uXtFI7ezqswFf0d7YX+aaenpiUa4smWmH57jGYaVvpoQw5uMGrtXdZrT1xPyOcqisEQVNigWoe6ds9Khl23uJH7W9bw817qCL3LtjYoTv6Ivg9Pu50Prz+WOny5TIwPes/pxjHM0nzHzaNo0SGNfd1/iPC2+uG/4MKup3VvC3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Honw8SrpL9fqcJReYXyddTpUHAJcEt3XfLuiPo0NLis=;
 b=D7AyKebeM1i30K0eBzZGEQ0ZnrvcN/1XiVZeavrsi5obVehg3TqvdlruP/bAn1zCIlt28FV8SMzfJ6dw/pEv0xbu1lB1I+uMhPXbPdxbEEgwBlR3ux/PvIDQqoOPGlcxKrBTDPnASRkfHxiSRdbYIwOggyPowNXWGMBGDicm8HhuB0JNYQ2kEswJo/U2zliuIf5I9RKXD2g1JHF022wqjwdqqojHEmu4s+w2RAw2jYqVgFHfl5g9fiChFjew1qxMp+hsTXM8+KhKAHKPyEGQdXkRgTn0RhyoFo+JPpkONI1thtd7QbzKhEGyLpUxrQc2I6GbZK7O7eQdyF7DfxNipA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA4PR04MB7904.eurprd04.prod.outlook.com (2603:10a6:102:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 13:00:17 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 13:00:17 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maudspierings@gocontroll.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [RFC PATCH 2/2] arm64: dts: imx8mp-frdm: Use symbolic macros for IOMUXC_SW_PAD_CTL_PAD
Date: Fri, 27 Feb 2026 15:02:42 +0200
Message-ID: <20260227130242.1702329-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260227130242.1702329-1-daniel.baluta@nxp.com>
References: <20260227130242.1702329-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA4PR04MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae51ed2-4d78-4fc9-08ee-08de7600279b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	0e4v9LIkB/r/C2ihkZEmfj63mi7Z2+ZZfL7ZbhBQl9dDaa8VYVmbrEMJp7mNmIXmd/XGUg8MyzTKCDnYnrh7qwC6yExzFkhiEjMJ5eRJgEQ9k1f4rsn/C49BLGrng+T/SbEIQD1XRnI6PRtfltLlgOVK1uUhjvUcOGLRUn816AL2jlIqrM3o0HmrbcMu3TER55zQKQSYp1vE26JHMfwnpISRnVjuRp10REg5DKocnTmmyuCQTsz+pE6DOtk9cl1gasWlqf14hngTUf9tvBqZNu7aI/Otq+C21f68uUbT/u0360CiQJuOWRTYTDw04TYw7oqKDdppzAAJWwx1Z5o30i5BrflisC/A5yjoryF/Q3I1EXPU04rVEigUzqzGgynECh9Cdh/nphDCMKLGpND/qUnIE637dbxEPDjDaKk0LdqDhIz+PJzvvkVO5ZAQ7j5j2baddxbF88W6LUtQKOjNoCcyHqyBWGJoiqzjpVZ+efssnQgw5+GpPAQla7w+v+F1bbOtMwE5+7HPxAwFGGzfCWeBZ/M4/2cecWZGj752rhoi0TpHwEV8OypkYFasIx/miO6fT095wmJ+ugN8pdgrKQ8RC89l8BzNcQubDsO0osH7uscBg9wHk+s/wOIs49OEU//O8mZZw1cbgSr2+PT5QHKTX6VbXCQp/U0gd7lezm4GabUCHPcM113xjq36E8CsDLmBCdh4Z0tmXR8B5q0AIcWes8CsNu4zSP2eYRwU49m4uOVcDfcPeInWlH6Autn/SkAKMnH8sQJti0U6NY6PmG7Ub1shpPjbAhwMMeBDEQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GVf7GvataaycudG13lYzSvPb4ZlEobcY40+fC4D44JmCXHkfE1IfodxcxuKT?=
 =?us-ascii?Q?bIXEJ2/aSn54Aj9TIf1TZs2NZFuu/p4YuNgkIwr6Ezywdx4/2ZgOe6fO6dV/?=
 =?us-ascii?Q?+ujd4ViM53h08g+Ga7D5lNM3vIaVWfO7cDbU+iXUZLJUdHcsPScf7PIOsbD+?=
 =?us-ascii?Q?TJ3xQeo5u5+GNQzGQOrChh/BJQEowQO0run92oqK3kH7BZCFX3+Zju+2xLH5?=
 =?us-ascii?Q?auA5bqYnd+x3NmJ+mxydwIHinbdPLUKIGQLgTo7ZJ2DayHP7OwNKlJWl1gQB?=
 =?us-ascii?Q?wzCHFQ3dRDfLGu906/rndprLNCsd7TYlNgzNTJRWKglx5B22Tq2+oCmDUrtp?=
 =?us-ascii?Q?LgAklEbtVn5MueauWBtrmE8lAXbO5fuGjIsLkxeLEj4NwRcHz2NidFeW584l?=
 =?us-ascii?Q?YmK8F0/b5FvJdSB6lRO2QrwM4FtTzpqTswLLmzJxnpjg6BP1toHrvWZ9BhuU?=
 =?us-ascii?Q?lWRofcwTLLyiInZ2a9fC6utUoyfwnZMKx/dd5giF2wwa2xOiSS+21VGJGkuT?=
 =?us-ascii?Q?+GERLpFs8+HIniEBszIzqlvXGZedS0P+MybWvb3ltdONCCmHC6Ohy8AhcJuI?=
 =?us-ascii?Q?Wm1KWBW2n8TOESb84LNt3uTM2zzT5CVnIRx8+Y+YznnkQFoJ0HK65OK5Erma?=
 =?us-ascii?Q?Lgr486/qCY3Q2c++b85jGIs4GemRrygzG7TGIx7120hqh8svU+viiEfPudkv?=
 =?us-ascii?Q?WTh3HdqeXhnjA3eDGjrt6zjSQv6DOViibe7LEbk73R5an3hQWUWZbz+O1h/V?=
 =?us-ascii?Q?cjQmep0JTbNwuHkDPFf9r7OivmONIWOF//h7mQDUkB/CylA+DqOHPBtX1tOp?=
 =?us-ascii?Q?ATYz2trmUyKtQGbWSUU4JXQQkqk0zxUUawtXHU/70ficlINdHYb850T6dcAQ?=
 =?us-ascii?Q?Dw1eppOHjuT25USSjGyJJtZGVSaz3cRQTdaooYXCqlAGu1R1/8vSxwd8TrOC?=
 =?us-ascii?Q?9ScYNDRhyIDolW6yaQkBWn5aocQypbBIu5qbEpUzKST1wMI788NX4XHSM4dj?=
 =?us-ascii?Q?uiGtJpZgd8cnHKRDnVE1Ng3bUZiAkd5M34fjZjRa7Gmud7RemoIyXU/Jt/M2?=
 =?us-ascii?Q?cZE787Gvt37R73DQZseo4FYUTEHUnUNYs6deyQidJ5jzj0xhk8dYfFz7R0oz?=
 =?us-ascii?Q?+LRptMaiIFi6futKsFlHTX1iT8gdgaJkdFaBF0NWR3I0O1JnvKqDQjUNp3Fp?=
 =?us-ascii?Q?K2fu4av9vhrVbO7xIK4saF35xla/SWtn4nUzzu9w8OLTfTn2m6fBiKvT9O9m?=
 =?us-ascii?Q?Lrv0i6lXZEOF5XtvXuNb5ZcEYmjMAFbdYef4hJAeHK3mgij18d6uVCl6eDBG?=
 =?us-ascii?Q?SeFRpPSYxxep5t6JCI/pfNAqipeXkEtelQFigOocLtOTxcY4CfKFVV4er4CI?=
 =?us-ascii?Q?DNb1+SB3a/Ekw5ZnEKSPiEptFsrtd4pGEKwDT8cT0wos/cbCltYBinBjB4xH?=
 =?us-ascii?Q?USPR5i3YPHSvhIjJG6B391pn6IcgB9l2ETff9XZscmcP+WrKY5utOAhdZl0q?=
 =?us-ascii?Q?Bojn/qu/0ai1hOXNzRqsMdCj+JervPwOTPKHvGkthWBtPcDt0Oy1e+nayBME?=
 =?us-ascii?Q?wg0WEWdJrzShlWoMMU3fq5Atg4TL7QB0YcRtdxoIODOdlWpIyFUKRICJFtcU?=
 =?us-ascii?Q?+WbPmIa6NDm/DWIUq/iW7qmtS34bQpzJKUYd2b+24utXxS/w5svdwTgqqZHN?=
 =?us-ascii?Q?JGy94cgW7H5AhjWDkB4lx+1lX963wSoBCvSj0Drwy/ZBZwZ67U517UP33nE3?=
 =?us-ascii?Q?haIBkpIx3A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae51ed2-4d78-4fc9-08ee-08de7600279b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:00:17.2010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GX97hRYhuL2T1wOkAf6Y74UIJPuj8iy2UincS5S3eOw/N+pjkXl8BPJVARsGTgGcxP2Ifw+Zc4ld9CksrPb+vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7904

Currently, in order to configure IOMUXC_SW_PAD_CTL_PAD a magic raw value
is written in this register. This makes code not obvious to read and
modify.

So, to help with code readability instead of the magic values use
symbolic macros.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 132 +++++++++++-------
 .../arm64/boot/dts/freescale/imx8mp-pinfunc.h |   2 +
 2 files changed, 86 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
index 55690f5e53d7e..206c8d939796e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -252,104 +252,140 @@ &usdhc3 {
 &iomuxc {
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL	0x400001c2
-			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA	0x400001c2
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL	0x400001c2
-			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA	0x400001c2
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL	0x400001c2
-			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA	0x400001c2
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA	(MX8MP_DSE_X4 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x000001c0
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03
+				(MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
 		>;
 	};
 
 	pinctrl_pcal6416_0_int: pcal6416-0-int-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x146
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16
+				(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
 		>;
 	};
 
 	pinctrl_pcal6416_1_int: pcal6416-1-int-grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
+			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11
+				(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+
 		>;
 	};
 
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
-			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+
 		>;
 	};
 
 	pinctrl_uart3: uart3grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX	0x140
-			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX	0x140
-			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS	0x140
-			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
 		>;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
-			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
-			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
-			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
-			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
-			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
-			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
-			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
-			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
-			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
-			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+				(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+				(MX8MP_FSEL_FAST | MX8MP_PULL_UP |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	MX8MP_NAND_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	MX8MP_NAND_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	MX8MP_NAND_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	MX8MP_NAND_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	MX8MP_NAND_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	MX8MP_NAND_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	MX8MP_NAND_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	MX8MP_NAND_DATA_DEFAULT
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+				(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
 		>;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
-			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
-			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
-			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
-			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
-			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
-			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
-			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
-			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
-			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
-			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+				(MX8MP_DSE_X2 | MX8MP_FSEL_FAST |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+				(MX8MP_DSE_X2 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+				(MX8MP_DSE_X2 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+				(MX8MP_DSE_X2 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+				(MX8MP_DSE_X2 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+				(MX8MP_DSE_X2 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+				(MX8MP_DSE_X2 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+				(MX8MP_DSE_X2 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+				(MX8MP_DSE_X2 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+				(MX8MP_DSE_X2 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+				(MX8MP_DSE_X2 | MX8MP_FSEL_FAST |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
 		>;
 	};
 
 	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
-			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
-			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
-			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
-			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
-			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
-			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
-			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
-			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
-			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
-			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+				(MX8MP_DSE_X6 | MX8MP_FSEL_FAST |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+				(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+				(MX8MP_DSE_X6 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+				(MX8MP_DSE_X6 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+				(MX8MP_DSE_X6 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+				(MX8MP_DSE_X6 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+				(MX8MP_DSE_X6 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+				(MX8MP_DSE_X6 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+				(MX8MP_DSE_X6 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+				(MX8MP_DSE_X6 | MX8MP_NAND_DATA_DEFAULT)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+				(MX8MP_DSE_X6 | MX8MP_FSEL_FAST |
+				MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
 		>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
index 26e7a9428c4c7..c963913e3c626 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
@@ -38,6 +38,8 @@
 				  MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
 #define MX8MP_I2C_DEFAULT (MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | \
 			   MX8MP_PULL_ENABLE | MX8MP_SION)
+#define MX8MP_NAND_DATA_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | \
+				 MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
 
 /*
  * The pin function ID is a tuple of
-- 
2.45.2

