Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FB937AA95
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676235; cv=fail; b=pSU7ssTmDUjpWRKsY0iR4W8fGVsbGIODUl+6ZzR8MWI3b1Aj60J/pktI6UItJySkBO3KstflHH9AomRgYWDpW6I2CVMACzI4QqTBn2bfDHnhtNcVCIxikee3RRbAAJIcuD5VAUxEU+UwL2KGhvZicsiQnd1HpELIqh3a4ZzGz/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676235; c=relaxed/simple;
	bh=eZnCjCSRwRqsAprDgwbSruTqDkUizEdQa63IP8LC2Pg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AMDpX/Au8FsAiirZtmCtdPVoYB+F/m/sqjfW/X5hEQQEcOnkkylsEGceTjicUnwXamyP6Bdy6JFujoo0jBaA3wyNjLR0NQ9wKP748HiN+KMCmVcG7U/FJsxxQRkYz5KsBNGglx1KKWLJONyfQ38Lo2gVAKtWGkogOQlTloJeNVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O+IDWP6r; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O+IDWP6r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqiMKSoylvBzA5bqwJH8u95jAlbtjn8eYmMUP9iy5640JsMFDGjVqlhWOxLNDnWZVk7ZUkAcZZjWqoWTYsAc237qJug5X/Yk1htG9WXbnNxM/T4Eb53s4hwtR9w8+1wtfmHurY1QEk4ybVDeL63eKFpUIBqBDTSvH3W8dihf0pZk8KOyCzBtt5dcWSwmhu4ob62QK/EKB23w6cv75wjniezS2f+hNHpRqLybq1y1El4tiuVqY8cTsKK7McZW5snESk0R1ILmDy6YeTDjbNoNX9GgbbLXd5dmMq2LsvLFaaBPfNF2A9AxUX/gyUEdfEOiEEL0aWyPCccmJuKqR5ZuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gP7HG1uOCtZGFwaFauord0LwA0bZGvfvVpBIpsa1oPg=;
 b=V+/V5pqoRprJAostVefBEtPbCg6XCKYfqYYQcNUV0q/XYSGzl9tu4ZzNURjmxLmyrAaLA+OomFYsGIT3TgVJiUfSnDCqXty2wmCxmkQb6TDUfkRUCTWl3eJpZh3qrRFkkbagOsxB791lC4ZLJQ9zUuGZmcYykyRFRkSpKkIF5JdaL/mPJySU8t4ArbkNy3ndZewxIGlHEI0QsZmVbyt+aqh3zKeNVHbUzLU1Dg8x+zo2DXA9ln8p2G4aDUP4iesG17vOfMLLg9a3rNZNVnvAPLTzDEm67QRioj6Cut1/MFN9jiadcraLhhxvM9UGDfIbVv/LVE+ybfoXzz5lO0Lq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gP7HG1uOCtZGFwaFauord0LwA0bZGvfvVpBIpsa1oPg=;
 b=O+IDWP6rkWn2UIBba9Yjg0lFkCgBRQBlknrviTcechTAUl7aqZxojhpwsPMBuC82f7dEIrL9MkK2RnCI37tAOSTkwZGqlft7Dpvz9XiKkKygEXknC0QPWdn05XDy73NF07CpCUExuO/HmNFaMg8fMVLWNHmd5VRFGCtapE95wnKs9IZysnUJUp804r51dTiBlrWxIrlidG/4lWbR7QaI/glH9sG2o+d6zKfMIhXGhUqeIO3sG64gELmWFR3DI+GMNDzYuq3lYb773VyDkiwlEQ/IoEXjy7Gh9iYqgtKGUeP1v4FyzDKROAYEElLzowEPBdDxzaVeLPljjKDQdjC9YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI0PR04MB10661.eurprd04.prod.outlook.com
 (2603:10a6:800:265::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 08:43:48 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 08:43:48 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 3/4] arm64: dts: imx93: Add imx93w.dtsi for i.MX93 Wireless SiP
Date: Thu, 29 Jan 2026 16:42:48 +0800
Message-Id: <20260129084249.3079432-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260129084249.3079432-1-sherry.sun@nxp.com>
References: <20260129084249.3079432-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI0PR04MB10661:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce4738b-3d0a-408a-032b-08de5f1284e9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?2mFVzxeZcZbLH9Z7NtBjV5Q5Ji+04FY303yUB3FR83Ps0Vp2FrOLtFPhJAMb?=
 =?us-ascii?Q?R4ni+LydsnBomNLUZhBXAyes+FgmlK1J/4fpuYr1LT1Hkm30j4dqiLPeovxc?=
 =?us-ascii?Q?ml3HtJDrzhsptEcJmI2YuzNJKCjZZia5V/PWLxt0zPaNVU4UsIcgDN+l91ip?=
 =?us-ascii?Q?eUDrFUHdtAImSgG1ONx5Eh0Myo+bQuozW1ncrzFzugE2zUrLr6UOMQdnmIEk?=
 =?us-ascii?Q?mRMfQyByBSLPmXv9OcQyDBkQ4wWc4/kGoUCYI4hdTRCTapEC3F/caI9WJ2c8?=
 =?us-ascii?Q?h3QQBZrp9KxPHH88JEvQeWH2h4xTDFjGNCCAyV0M25/JDj+7YARdT9B5VzM0?=
 =?us-ascii?Q?QbpTjKpZnU8ikHHSBC0GTFiWStVE4N6Toky2TRDTiLORLvo67lGjfE+wbXuy?=
 =?us-ascii?Q?whNE/BaG+3oEgn5nTD4amBCqK3CgmUuGxk8QGLWbgtGBSR7EINOp/m/VAabX?=
 =?us-ascii?Q?OlA6yowVyI56+xE1JEVVwVtjsF9jFc68OgVNB8bCsqGyceJ5WbZKjfBstUBF?=
 =?us-ascii?Q?/RQQAB8q9P87wMG+MO+lukUAvm+qXDQuJZAxZeOWJxcIUeSqQODki/Crk9at?=
 =?us-ascii?Q?bjbSmJsMTUFZpOn4ExCU2FrtNZK9+Tjdn+BxdSyKKG9i3bKXqAwnj8oc1HCO?=
 =?us-ascii?Q?NGYthysyfzqOhZ5j0paoET2Dd1yLUT/V3iGik8oae5/+/UaHKN5/xfJx1ont?=
 =?us-ascii?Q?oPatxENBfI2+3gk2nstiKFFjNfvNNagVjKW2TYeRbMdWSiq2kJ6ZJPRz6Ru9?=
 =?us-ascii?Q?0BwtZr9erZ1QVf3umMoZpodKHJqsv8VbA9tfwCVs6nBUydqsEHQN82TByi0L?=
 =?us-ascii?Q?8iT6X9RolYuu4wk3TZnbpwyKIo0MGU6ViH0nyp38tqFVs17n3gHdIaWeZQGs?=
 =?us-ascii?Q?zaHQ5djUIWJlFDq6/WWKXWgHsN/6eP3ecfDLU2HwwGm6u1cv1MJ3HCbCHTHQ?=
 =?us-ascii?Q?oKxd5/0G2UogAPd1fdmDAlkxFjmaxrIWZX8CxbZivZF6+UXx2SnE9vtQ1mom?=
 =?us-ascii?Q?HBe0wMye8z9sp1oCW+JHjsKzBMUcaFpt6K5ZWhiJge2zUjaK1UjolEaEMWiP?=
 =?us-ascii?Q?I0+KJJ7H3gPaCfWcysJ6FWNPczmRUMhs0kF0dWLu51cVGlnnCre42YdQgLHf?=
 =?us-ascii?Q?8HitSY9lSOI20lzagrTfOtHhER+uqXi9oKLP2xZ1zhUKWPqEq1wOWMgMaEVl?=
 =?us-ascii?Q?PaKLd/j+1ubYpcn03mVvxXXT2oTOi3uWlCBo0oF37YI07PGh7yfL40aD8krT?=
 =?us-ascii?Q?uV78df7GawEBJKuuEAfPioiKXgQE50OGra3CTgEGCaYKWO2gz99Ul2DIpCJL?=
 =?us-ascii?Q?O1wnvH4cEPt2ii++V+zNwkQOpb8bAF/CjfZyY5YIwqpgLyvkv2/udZPh5mlx?=
 =?us-ascii?Q?kYZIoVTaFZpoWyOPjezR44bjofCcFPGrlxEtrpauaTVTv+1ickuGdRc4h9nq?=
 =?us-ascii?Q?EBpBvWj1VFba3qo/AvrYpVQFzZ0h4WfvzQIfEc/5GV56OTnZjXY5WqmaYD8R?=
 =?us-ascii?Q?lTGzRu3JEOZi7CYc33QiFsJywKNDTG3DVFSBn1wmtxgG8O+5q9ECLZmxKGBV?=
 =?us-ascii?Q?7UKxP9l0aO1teHkXxHS7fZK8zssIG0dcsiweUE6Oaj0xILBJImyW/txOHw4v?=
 =?us-ascii?Q?PTCVa8wL7lDhCmV5Af0PQCvGFGd0DLOsz5DWU2kLKuxz?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?IaOo25lAKkWqVnWimdC2nCKf3JtxRXgJRAyGmN5QmRtlukj/oUz6A+aFn0uy?=
 =?us-ascii?Q?vwIDk+KatYTY/dP23cfY7oeiUi9m7Z0jtKS8H4IrNFVafaBNdHUnN2d0kNp8?=
 =?us-ascii?Q?Z7BrvvKGLe1DHfLjaz9NRUMH19t5Q8IiZteNe7Hg7u6+Y9IjyAgw/T7vlJJV?=
 =?us-ascii?Q?PjNKhYV7eLbGzvU1K0DkI2h5RTY/zvk9FY7uiXppjOUlhB+KE3tLFGi19acO?=
 =?us-ascii?Q?VslhBhf5OsGKOzGzVdMjxpuRPvZenOiDbHe0wi3XCruRXOLXjN7q0YafYUS7?=
 =?us-ascii?Q?Hbb4tFMTRQ25AmQQRcINnU0IIhMveczOJ2GEqlLNLg+DQ4tW9lpoQWZEhQuC?=
 =?us-ascii?Q?46W51OLxLThyj4RVRvf08b4N3mWiaTyZEN5ElU3bE61VdoCqNzbzmVv9fGoa?=
 =?us-ascii?Q?zn5B1KkMgRH0dn14cwVi1doLrgjvXqwUHJOzHKn8QzTQ+K9NjQfGYJO9hAsv?=
 =?us-ascii?Q?ZR3V83zrky4gmwfxFFzArrrHq+OMbu9zF2fFhUw6DPEUSbONdQWKj2TAdbmz?=
 =?us-ascii?Q?8dnRqQd+4pcjIqGHLp865jxcqSKrx7I2Ez2noGS2I/gLg3YtxXkJH8ME8rxh?=
 =?us-ascii?Q?ux5436h2WCxES9HaRSFNwkq+GT/EyD9OxpYwcby4kCKEU/hTxNnVBKpfCYWD?=
 =?us-ascii?Q?msSAubTxLdGP4cBKS3p8GHpCZ97uEoQe6W8NOlLuVoGvaspBUpDI+CZNpTcl?=
 =?us-ascii?Q?tnPStlKhlYu6hJ+ou9u4tXvqy3IN1WrV1aDUY+3FZoiYfweyCMTYzZetjIFS?=
 =?us-ascii?Q?2DkfuoXL9XUsdqD++xWY7GdrVh5VLI1M5gxkwapXzMWbFDRdsjjYXjY1PI3B?=
 =?us-ascii?Q?yZT4kZ7783J/abSnoEah0hBzcAn4s+/+uXwfYzLY8Qi3GsYhTkvvoaXkAyxa?=
 =?us-ascii?Q?W8AFMOywROZoW+1/2BT6s3N5l4L/tiVIceQnHLS0dqa9pBxZ2MRrl/uwLpVz?=
 =?us-ascii?Q?oY9A7BjVGaNHDC6rvt8SWk06nWp/SWFFyKsNEbLVSJLzY+jFMzdOyOsnefa/?=
 =?us-ascii?Q?oEhgdjRI1w7EdKycvl1q+lqZAoBNqdsDBFHnEcFdDLGrzr86qPHJC/5wvJVB?=
 =?us-ascii?Q?n5/xBDl+1mGGYWu3Q8tvgf/LYa6wNYoII3BQmkMjyjtJZMZ7O+ty9e8bst53?=
 =?us-ascii?Q?CRufDPegsYEqxt8kQlL/8+pZCLEGTuaB7F7eYfEL23KsKTmRCenDswVDX/xX?=
 =?us-ascii?Q?sXsR8RSvV7jiHv/PVYxgs6VSU2WR/uB3Ig1kzlACQlJMMhWE7C3NiE69D7mP?=
 =?us-ascii?Q?Na5heKdukdxIHbu97+e9qSI6slkmLVxiG2SYxxxZzOtuH8q3CSSV25b/II+X?=
 =?us-ascii?Q?7AL/z+G1oIsowgUZxp7iFwn5zjHSiBtk+vJlsxKC3xwfiKyRxlwfij37TA4T?=
 =?us-ascii?Q?j4aTXMdgp/ufKuuy2hizFuwG0jGTPnULiib7wSBI8ffsItg5sFQayz7Cndta?=
 =?us-ascii?Q?alRQ604ot4jA+85qrhwuP1OwKpF7KWKOk0z8VmfbUVtLScG12tM4mqbdT0yo?=
 =?us-ascii?Q?YcmiUNGinEVAVXW7zXrbvBPMHPDUWYcmV5eBnR63wXdaSLW8iLurx6wBuC6v?=
 =?us-ascii?Q?52paxa+4rIc+oxqf0YeFluI1urc1ljGlh2Gr9pnG1VrtSMkCPMT3KoGnccPI?=
 =?us-ascii?Q?Y9NEQs7sHbpzwp/nCkHc0yGDWPMfp9q++mpZ2xzblEyOGSNqdiqb/oCAlGH/?=
 =?us-ascii?Q?NYOCTj2zq+I7j1CUvuFL7WnkJmrOBkDNGHwTBcvCkISXKqmA4KUB3y2yrw87?=
 =?us-ascii?Q?Gn9GIWaszQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce4738b-3d0a-408a-032b-08de5f1284e9
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:43:48.0034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4xJ7ISb37Z2Mz0vMA16Df6AZX61hQ/KQ9ZHQvT5vsXTirXCcA1rQfouGBb0f3mNvNLC/CFqF03TaUs4LcHoOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10661

Introduce imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP, which
integrates the i.MX93 application processor with the NXP IW610 WLCSP
(Wi-Fi + Bluetooth LE + 802.15.4) connectivity device.

The new imx93w.dtsi is based on imx93.dtsi and adds the pieces required
for the internal connection between i.MX93 and IW610 inside the SiP.
This includes USDHC3 which is used as the host interface to the IW610
and the required GPIO settings(e.g. WL_RST, WL_REG_ON, etc.).

These nodes reflect internal SiP wiring and are not board specific, so
they are placed in a dedicated imx93w.dtsi file that can be reused by
multiple boards adopting the i.MX93 Wireless SiP.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93w.dtsi | 102 ++++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93w.dtsi b/arch/arm64/boot/dts/freescale/imx93w.dtsi
new file mode 100644
index 000000000000..30da79685fec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w.dtsi
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+#include "imx93.dtsi"
+
+/ {
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc3_vmmc>;
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usdhc3_pwrseq>;
+		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_reg_usdhc3_vmmc: regusdhc3vmmcgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO29__GPIO2_IO29			0x31e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_pwrseq: usdhc3pwrseqgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
+		>;
+	};
+};
-- 
2.37.1

