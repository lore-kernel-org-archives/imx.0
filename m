Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B863132F749
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427464; cv=fail; b=iqKDBbHr/v/lNxZzRRASAII4T3NTV9NYcaMLgYpF71E9/KGKTK7ByNGLYIcMawVjo68g5hFTZvk9uGM4dXUE5PBVkDs41wKxn9FHNkM7BMTMYAi6OcJB8yjQt5lnqdG3Nx8akjoyzKtPyR1CE46Rus/DTqwjk5N2/nouQWpfpMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427464; c=relaxed/simple;
	bh=+sPfkVQyfd3Ny0GvbGoeWgm0GJJqhXxM+M+J/BTjSTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i35CR/qkjJ34i2kP5LkFZq/0vjYOynbGoMRGrfB5kyqzlf44O99/2eW27h8+UCGV8NwFyOJSfZIrDTs2Q0hnp19KXp2TuWB5XQzrWz4SNJNeDaRXtYxxIxiEM9dUyI2+zA89Pc5yrwootNVLSjYczKedKskX+Ilee53HrPdtLaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JcGmZ66i; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JcGmZ66i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCINa4A4i7hGlqBvhlJfuv6dxPaHHP4mZ9VdNtHbZeqTrvbe1uqY+9EiODkikm7YcBxbVScxSTj+AmtgHQ3/WRnykmJpuAtJf8EVr0xOPzLxf5tEY3525/5C16XzcGcXN8DqR3eeDi+KkIAM9n/wPgyD1oVbCAtxOBHK1olsV5kAV2SsV/5JJh9aTyYbraB59jrdsk/PF82AcOFGEW7fg9g5xTziOWRH1RO/PR8wm6bs73MtG10zupRT27FjDhVWXR6hQBNNA+u8Ra81WmB8UkuhwE2r7OJElRVOQRt0jQ+h/xguMSrLgGzwpnKaKtMdU9E6iluLsiRvk8CqkZ0W2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tpIuNL49vxVkGRVjROpUtwmDpr5SiEHLYPh6UFjMRU=;
 b=j9Xck0XlJSMWRKr3oxesFmdiuen/JhixYPWLAREnx5Cdg3/FyKciYx9Dp+ndU3VLL6BFm/NZcl4h7dkkc7smgUXJIKYYa+aCgEUVZwqUuLwuGExfSqvi9yph2CoQbZB3ImR09tX25Ev6godm75GgclvZGnOhWrsvoCUVhOPGuZd+agEcJjYx4x/eeqOd6ahzA8FbGGP5XwWIsuXQZAl+RQAtFcfWULLg2Zrk4ekJ01fW340BexNXRKCccMoueJp4jRJtCw2K8Jj3QWad1xVS9N5yj5cYcRSl0RzbzS7gfUCYyzBhVKhvd1Vr3h/d3RLO7JeL0Qy/l6o+EqXnQbrtrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tpIuNL49vxVkGRVjROpUtwmDpr5SiEHLYPh6UFjMRU=;
 b=JcGmZ66ile12GLpNUvp5bqOM1FhD9XZBxFqpTI9rfR3ovLMWLVb6T09YAz0A2HlCSHvOiXJNGTC/fPDkka/ZYGBzjTspw34HOro7lm1Pi3M6+H/1zScyoK4Q7xdJjT0gAhu543MOUqi7MxbY3IoDj6ALFKHQqD0t/UFFF6W2HpLD0i1We2cmSuxyhGiIJ/aysjYoExhqS5YSSrONLmVav809C4NqjhSDSyCPAzlXBxuU3uJnbkkcr2xRB3/urZ9XJSLl47qtGy39eDcGZPyJCg0BgH+8cxHiRKc9QmyT5Ey7ewVVC+Mpt6AuO5R7AhwxwOmh9lK8vTKJGeSzrPq0WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA1PR04MB10723.eurprd04.prod.outlook.com
 (2603:10a6:102:491::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 08:30:54 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 08:30:54 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 3/3] arm64: dts: imx: Add common imx-m2-pcie.dtso to enable PCIe on M.2 connector
Date: Wed, 25 Mar 2026 16:32:01 +0800
Message-Id: <20260325083201.2637520-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260325083201.2637520-1-sherry.sun@nxp.com>
References: <20260325083201.2637520-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA1PR04MB10723:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b31b8a-b52e-45fe-a9a8-08de8a48d4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|7416014|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ambRL7d9c6gL/mBh9MDyf7kqpNS11r/ktoMcdJ47MNB3akSHzokA14Lz3h74STarRI/NgciYr/9k7K5SFUK/hiD6OElHK1Iz9d7Onvlvk+Rh8vyVIxKCSKP8o9WyqR46+bRWd2xuQyontP/+Sqf0PJWUVhq73FydXEyj1TiRtvnqvPWZVxnCZIVEejvqHAczdDWVv4xf+6hmFnQAAeipVnL0d4OEuEY0kfqeaTHlMGwVrPI/QKQzW3QTxtEncRSrTe2S1XhuF3lYlmOz+kDDwphGdar1kSf4Y1+FJgacWgTmumhFeHl1coo9RAjqVSHbik3qTpO6F3Wn5TmOpLjbpU/6P3G8ibR9ut0h+fKfzOX5ZIN2YYC+qhrB4V1BRDIJqo5dpo0OnhWaA7THJoJDUO+XNeGSkhJfrZKeDRU+kj6PymV279H2vLhJF8Xj7UE7gNfx18mAbOq7nc7Lhj/duA6//zDc3aek66F91FyMYIssIoRVgd80P5MddXcYVWVq84Uk1759zNPRIc6gNECFSn2Sa0FZFQqOy4E0s7Zz8wniEVIxy2k6Uhh/lzIOaQCLmtR5l2HFLCRziz6iA5sLUqZ+1pw6YQ+Av1gJQ6l/DdTR2gCPdvVTcrT+EeL4S9FRV/BWkbX7Vjk85Mpr5Y2CLqKIHWDNQaGTYupcCWgjJF6YJgfwhv/3itXHS1B/JZlglEtA0gvE3MLemF+tiOT+k1e7s4KwP0L7C0QaJksk6dcN1FFLmEgWLnUulKE6TFksUD8xvuOI/umzozKtAaYTrVOYTb9wzRdO5/LAM+ILiho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(7416014)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AQRFP5myzg/9QQJ8/ARVcAZuTZ+MXBGztDFhcrTvbWbDGPNdgzusIKLNnhmf?=
 =?us-ascii?Q?QWqVqAScjSnpL9KVzsKWEuit2J6Mo/cwqul1EL82s6WbfOhZ80FhgJee8XLg?=
 =?us-ascii?Q?L3DH2seD8N/TWaY7K5XDnlINrtd3yzAkYVA3+yQJBZUb9EvvvmXEviRJpHS6?=
 =?us-ascii?Q?MCgTYhz77cMpUdcB7/B4TeuJ6EJ6CZSkiblgsIr+ev+SMIX2UetU196DPD0X?=
 =?us-ascii?Q?Ia1aw9/xkzYXqCODFmXk0E74riQuPtAg3Srp0yBY2OTQ/15WPtu47/FiMoJm?=
 =?us-ascii?Q?PBSrFk3yi+B4IBOpoYbfoSsmX2MCH6YCksnVMWlD8t2otpgSDCxOK+CtLcNS?=
 =?us-ascii?Q?a0DwI1gYUNeBbj5qKBN1eezct/EUS4Yhw3URjU8g02CqRgxCMOie0/b8MHOQ?=
 =?us-ascii?Q?PZWs9wRHiRR6KrYwEUOJBJNoiwT1PoNA1ENDQ5wJ4UAjingr/21Gygr3yo5Y?=
 =?us-ascii?Q?1QsjfaxN949dZWPuVVUGpzDtGQ/IavS7TgCasJSwO7vBVXnEG71dBI16UVgA?=
 =?us-ascii?Q?O5chQ7x4NeFmlXkx/h5c3zoPRE9+DEmyUkKWjXGcbOJLg9MAZOHeN3zuEvov?=
 =?us-ascii?Q?UTsS6uinA9vc28iUS5mKNr5wVluoJqFGT1B/Imgc4kbagnnNcnpodtWbcl1h?=
 =?us-ascii?Q?uvNO+e3sBi0+F6i4Fc6Prgi6koX9DJk3LXllqkbC1JGoiqGzbtsStuPoPjxE?=
 =?us-ascii?Q?V30xxhjOcd2wiVMGHbXwsjxiROMkInecK2cSiXOvtEM3v+3siVQ2nruV1r3W?=
 =?us-ascii?Q?FHFR5jdrrVHMhknKfIaEvLLp83zwn7LvEL7JFNIjt4nv6NojcnekyuauON7k?=
 =?us-ascii?Q?Oo/yzN7HiVEX+3JcuXG9A2/eXajuidK9BUpXvi7TBBdK70+IhiV0lWOBjs8f?=
 =?us-ascii?Q?OtukQLSrel4j2vXX15f8qvPJucRjEa+/AGDmyzI8WZSitC/eh3XFkOhKWiP7?=
 =?us-ascii?Q?2o1mB3Yp6SMqYFwViZ7gA8O8482fRv9kfiYg8idcPCc0+ugrlrQSEsRH8imB?=
 =?us-ascii?Q?VuAlA4kxrdIFiApebSLXdzVGoKapVbAZ/FKzqXySYVRKxKGQlHN1dS6thWlo?=
 =?us-ascii?Q?uTTZyc2jx6jjWX+9DbRGOf237PdLvc9DEVPCxCI3BeTzygv4ql9ANPyi/3t6?=
 =?us-ascii?Q?0mET2b1OK3LZzT5CIzA5gkr+sxPcyanpcOMjeXG81S+Ntcd1cfdbR5QBDmPg?=
 =?us-ascii?Q?9Y7g31v2pIEGgZWY7u/FkyDPMQmF/RGVOgq1OfvjCPGTfzHqrZrEnk+p6FAh?=
 =?us-ascii?Q?OlP3jkOEGcoMo+NbCJk4fc0v5O0SQ5lbLpf2WLPoV9pEFbhNf4sO+GgJeXNb?=
 =?us-ascii?Q?A0amYSYkJD3wPdwu+kV21aYkSo/J++ieAI57JD1sEFAm45z9vBhS9xBIZVfn?=
 =?us-ascii?Q?nIx+7mC2e73xwnhacN0HvTbduqS93UFjRjuszekLvMQFpU+p1x6JYfdaRcIu?=
 =?us-ascii?Q?5t+6gKJsFJCYDccKWq/bglo073hcgXpZYk/5ZcifTBavk229WtMzyDcVMh5y?=
 =?us-ascii?Q?kWXZ/4YMrhmr6rvYZr26V4tnlXjHlcEY8zXsU4q8lXAA6eDAPlYSl1PcF6M2?=
 =?us-ascii?Q?tgUJRhrBNCEKj2U1c+t4xchy3+Bjx1LrYajsT4dZMc1+yfG8ZU91eEz1EQr+?=
 =?us-ascii?Q?Knc0iO49fQSi7HYyCOHDbrdl8zp/edpK0tb5UVIJH/vt3oHv9FrxRZJM/4LR?=
 =?us-ascii?Q?etqnjFk7kpscJX072K5+VwQ3VTakImpCY8hl2yLN9Yu+LQnPRagaatu0y0P8?=
 =?us-ascii?Q?bmy6ix5UsA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b31b8a-b52e-45fe-a9a8-08de8a48d4e3
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 08:30:54.8416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPDZs/vTcjvOVkUs5E3+flcHmSlQ4NOVki14e167fH9yQ7hFRSQJg9JWwAEMpjudxC667TcF0rV/cGASVDjC1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10723

Some i.MX boards (i.MX8MP EVK and i.MX95-15x15 EVK) have M.2 connectors
that are physically wired to both USDHC and PCIe controllers. The
default device tree enables USDHC for SDIO WiFi modules and disables
PCIe to avoid regulator conflicts.

Add a common imx-m2-pcie.dtso that can be applied to enable PCIe and
disable USDHC when a PCIe module is installed in the M.2 connector.

This creates the following DTB files:
- imx8mp-evk-pcie.dtb: i.MX8MP EVK with PCIe enabled
- imx95-15x15-evk-pcie.dtb: i.MX95-15x15 EVK with PCIe enabled

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile         |  9 +++++++--
 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso | 15 +++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 155213c45319..1f542324b4fc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -333,12 +333,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
-imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx-pcie0-ep.dtbo
+imx8mp-evk-pcie-dtbs += imx8mp-evk.dtb imx-m2-pcie.dtbo
+imx8mp-evk-pcie-ep-dtbs += imx8mp-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
@@ -481,7 +483,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 
-imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
+imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
+
+imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso b/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
new file mode 100644
index 000000000000..1930de058a08
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie0 {
+	status = "okay";
+};
+
+&m2_usdhc {
+	status = "disabled";
+};
-- 
2.37.1

