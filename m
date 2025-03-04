Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012060.outbound.protection.outlook.com [52.101.71.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8161A1FC7F8
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080714; cv=fail; b=l1oUrbgoVZgyHy+vy/vaHbUI9gvE6ghC54CVPLhu43leUOGhBhANRsj7ukfFE9LznpYmusuItk0Y6BMnJZOvVaLx1J7BRJmXYP37neg+mq9j4QG2/SlCyx7vfsIt1RFqX8nFeAd9v2JyDl1PLtl2ClzNaDaYbJosrxkPCikt2fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080714; c=relaxed/simple;
	bh=oXiwJtcEIk/duIFjfNldhuZNTcuzJs5iN+6F0JOBZTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FbZJLD6WAMEYqFwks3cSv5eYyJMz4Ce/T4q9QMPduf3zeaOxUwYp0H7p9EWfbrV29Fw7YmrI2LfalYiMS6kUPU2LdFgb71cUkJPLpWmt37oH+gkhcsqiiT2SaDsY5MYTGzsTl7XvxrwuKv07TlhubyX40DwZp5FITyoxC+kTEZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ODkh2Uy4; arc=fail smtp.client-ip=52.101.71.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ODkh2Uy4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2wOeCUab8GKNcOzjacY15rP25oJj74V0erPs1M95wjOdzGTMPgkMOGFhaBj39tFJVYAoMaylUg7HHXsYFhVHkKKU7di3QXWTOzPUQBBWwt4id/OdgfknTBZoAYqbSbAJsDWRISwfJldeFZUYfRkEi6HqDaz6fgaBwxAQRjpza/EFzlmwqpdwo8e89MJeeSshbv44SDxVDj/2L0j+hH4yBMovANupO5zagf2YQDsVIYgUk3AjT8i7pFqj3y0ut8FUqEFuvejlyLcqiwNStMcOunS+/0lOdC+YdaGmDbzrIHEJGRlIA6zI2wPh45O9VXHNjhdy3cK7QtqY9UCuJJ0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aVGcPq1zYwlpvNA6D78/GGSQILdRj984TJnVuLUBVc=;
 b=YoV9osmgQob6bSX4b6qv6m6uukbeju1wYBY2fHQgVBuz2bQztWsCyhdYJTRtEnXrRDFqe/yW2qlpUONZD805M3HFjJfYAfyX06gyXgI8BE2sDGNI7t9aoQU+jthBBd1QMoyi38vetq2MBfXEmLdtGRxc//4UujvkqR8VPTWYizfo6FPkRY5AEtekfmxG6SIFpIXUfs6bLPVLullwQKHSA/ijcNHNv9Qk6yTZkgVd6OT90lrBqgx6DKlN/SHdNRhVDJj02xpOYjC1b3W4sLv2Kh6bDZ1xbFg0j2R3h3DK+S4Ye4DervtV0xdpvBZlx4rTN/y5a47QP8+/YcP1m8eV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aVGcPq1zYwlpvNA6D78/GGSQILdRj984TJnVuLUBVc=;
 b=ODkh2Uy4Z/8g7S1sMs1aOux8H7/x0KloEGzMxTzu7sYSPnj/RvO79KIMq/Ss4gGamQLlai9PxfoJvPINmEWF7jizFroVAnlhljvQTIPugN9Ltu7BBM+p2Os5k//B4dX/92C80ULel1XvY1tdESBWryNNhlVnPYk1fBJG0cSacsensFfAuYwW0YUTAHGGpvdDzNuSdXY4V9btT54l2y+5wea2bbSjf8XWo/8t1hv97CkYLJOgwOZMcHNp+3Dsfyw9rseSC6BdeFRJpkoA5aUMogOkU47aB4cKoqsqMdUhBHy24QE8DYY0Z+wIQTyVpNNNFVLDd/WEESZqVj4/9XFU9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GVXPR04MB10381.eurprd04.prod.outlook.com (2603:10a6:150:1e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 09:31:49 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 09:31:49 +0000
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
Subject: [PATCH v2 4/4] arm64: dts: freescale: Add minimal dts support for imx943 evk
Date: Tue,  4 Mar 2025 17:31:27 +0800
Message-Id: <20250304093127.1954549-5-ping.bai@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d73fbb34-4f22-43be-f5ac-08dd5aff63ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Igkuy75uXYwyCPtWswTzHFn9Gh3TqEX7ILALeA6wo9O2+OyPKdjPoNVWHaCA?=
 =?us-ascii?Q?jL06He5SfxggkII4gXvTrf2TwnT6jc11vf+W5iSgfRav/sMyvwEhBp855lVw?=
 =?us-ascii?Q?WjqV1bSaqMxbP5Omh2ytVY0vk4Od2NGP/BCcCeNfGqMxXISYY1UqN2cq807K?=
 =?us-ascii?Q?tzzMNjOY2hKPc0GqOqc1QV6y+069SPK74MMmktRt9rq3SMCAdixOVnYmFpLj?=
 =?us-ascii?Q?uvDRjBQManpNrHqO1WvRTF4sIEs1epNisHUHgy7IfyqLSjitpP4cAfXqiDfo?=
 =?us-ascii?Q?FuiBE3ZS322S1Yho+Akv91pbc0IRFBnHQDnpGvuFY2XJkj367iUOZVqqCTod?=
 =?us-ascii?Q?+ewlcgJ1gRtrumh/9gRz8aX+SKQaD3UAPPEkUNU86/llLASxh924NfhMAZCn?=
 =?us-ascii?Q?OXB4J6nXQ6vOtUXk/Nj/5a8cB7jODTDNeB/QVPirldEgEBIyDu8iV3j4dsj4?=
 =?us-ascii?Q?vXZ8LYVIdXJBQamifJRNFp8z9srmAOqQUrzfTlYLPtzXRGtY2bPbdRZr1Bz7?=
 =?us-ascii?Q?yjn17R1Uhubfn2z7wnBB7sK3u0Nv1LGszED6HwOUgz/KtQpH6U73XVj4kvm4?=
 =?us-ascii?Q?iUJf852KgXGeV6v9Zt4adUlofSPPtKZuDc0FbSnizDW0VupxRqZPUAsgpXzG?=
 =?us-ascii?Q?tEXPe17vfAgRF/9O7wisOgLn/T8frrPkbSl5sSHfU4CL9tQSPuWhp04JujVA?=
 =?us-ascii?Q?BukVRL20jeHCbLzTiOgWxJ3Ml77FkOdrWFQYopHdb3GTArC4xgPCKxkPNQd0?=
 =?us-ascii?Q?JKk5fuOrTdtm1/jRxkRdIs7PnpxA6TuLzorG5R1WIBX4bfbfPwIL07Zad8/q?=
 =?us-ascii?Q?OsP3Ml7pUNAm/I12ewg7jAruL4funs8zMSUOhjfWzk4Wd/et4tOQutbOHWn2?=
 =?us-ascii?Q?F3aVkgrdpQuMwJvKpeU0qeMbDHhiaUVVKcrNJffXAWM0izDI/N1JLMic8niT?=
 =?us-ascii?Q?m7IEUBVQQnAjcZsitayrO67YzVevxqXD2q2lixWiQpk34RA/pJDpZZRTKhBo?=
 =?us-ascii?Q?vkuzWAX/8lUYTNDaxTN//EOhq45NPJ1B1Lnxl7VKWAXhzFeNuDfbIzJdlwkI?=
 =?us-ascii?Q?yu4voXCl0UXMreP6isXgv0TVeVrt0uDYwFD70zJFjNNztVABow4QL75qvhZ/?=
 =?us-ascii?Q?heFEBEy5wcJ3jRPsnaGQ3RPuqkPA494+u5NC16jP783UcVUi987UbeRKB/yy?=
 =?us-ascii?Q?Hn0cREHDOLDCEVyBZp0JTfHJFcQNbijb6BRBUztKiTFLkVs6oNL0++wPB0Ns?=
 =?us-ascii?Q?fXjjtGLRnHj7zNFgJ2Q0f8yTsn5zzZaymI5bJM7Nc9s3+Woa3M36RXdcTzUr?=
 =?us-ascii?Q?vQyT/7seR23qoVcgT62jYP0xAyvBrDcNu9WXkBGTP21pugcFVF8IMJlknFWh?=
 =?us-ascii?Q?gU2f7C49NrgvSNqyyNpfW6OoBPIyOJQj+mc+9zgWpbJC8e/rgYR4+sExiJB7?=
 =?us-ascii?Q?3RJMj/oeIrBE4pnZW9q9aorG9WeP16FD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ka9Y7uFd+THo3zDYjfHKuudHwmqPME9YyOE3BTIzDvUfROQ8/On/ihTJP1X0?=
 =?us-ascii?Q?HcmYUzBn09rn10/NkEBV2KeEWeI0+g8FrPIOYNBF+YEKXRfRsZbRE6vfh1Aw?=
 =?us-ascii?Q?GH6g/Bf/3Zeqm1NgCnJSJ4hFtvs75YHzXfgf5Z8NOz1gxzdpJp5kmU0e1imM?=
 =?us-ascii?Q?HG8tOk5ZP2Cc5osdxRjO+wEy/hGCN0m6EOrp2+AP5fJxokXgRGvbzHnNnwhN?=
 =?us-ascii?Q?VxooU9lnPXN8C23AnFd/2094EjIkTJDbikY0aLbYtY7/AYJDK/OFYlDZbtWT?=
 =?us-ascii?Q?Uvcfo1Q/OCshKFPVFHneLFqfD3ejLzhjuSgj3iTsyljYP1OdJJuNu6/L+cn9?=
 =?us-ascii?Q?6goPwGBFBPPYrjmDQMkm6Jb3l7CBR78j+GDFXu4VFMTAIHfVUbN51ibiFJ/G?=
 =?us-ascii?Q?A3cs+KnJ1idPju+FMflBKDNMGn9Nw4CpOdLrQqW4sQ/v1JSrkfOcVQ648QrR?=
 =?us-ascii?Q?G26iQX0XDxZFRZFWYC2ooOcUuNXlozBbzxi0coQvcTlTtjNJyB1cJZrWuyRo?=
 =?us-ascii?Q?Std1TTr82sz/W9KAi1iPg0GBAZ/lHRiB9MiywJUP835Ul7JDP1xsjEOCAzGF?=
 =?us-ascii?Q?LNkdGSi9eUb3/Bbze1sTNL1C/nTumBNixoo3ReykcNfp+SAYBuCQPsoGw0mm?=
 =?us-ascii?Q?bM10hftFg0W71upK0GhlNKp/Nvlz5hwkckkyxSPiWeEAjR2F7JrwN6OAKgRv?=
 =?us-ascii?Q?YvtmQowYdWA80+IqfBgolelgHhNYg/QQA41v9XagMuL24vvxFDXIJQ+N53cN?=
 =?us-ascii?Q?jROrWE20WD7OgfY+fadgfb5Z+ppvEtVa8HJtEPE/r2vDxrURHZBN6NfgPkTE?=
 =?us-ascii?Q?H7a0x3RDKNobTfc1Y0uAAgg8p1TfR158HcuKqNRboZ9/H9NHCq7nPRIHTmAZ?=
 =?us-ascii?Q?lcfOEdSxiXliIMg5Wtsv4zikh5CV9KyVGp3kQ8Oba8lyziV1UZa/KaGgURJf?=
 =?us-ascii?Q?iRm4hL1FgZhHatge5LG2TcfqX1CM4c/NpvKGMAIqVyg/PCFVJclrkHC7Syc6?=
 =?us-ascii?Q?332n+qUd+yLkGNXCCs747Z12nCshs1RxktE7kuurKYmUlF6+RIiNsksaOaiY?=
 =?us-ascii?Q?KbtqzCXzHp9OxwpfkPcF/vMod8HzQiryvUuRv2HUl9352hSaOwUW+qTms8Zv?=
 =?us-ascii?Q?Fn3eOLscGfI43sH78iVSfPgtrcfVf6MTeSqHT/BLc1V1D27Jyr4p6OFPxdlK?=
 =?us-ascii?Q?Xf6yud5d6knnTQuycgeSBrx7QkLxReN/vxRqQJe6NabDqFquoPNId8PNZE0M?=
 =?us-ascii?Q?xKUA+4tZ4YUOVofTd0iW1Fae+J2VEq9KMnX0jGkEsWEKA7RwOVuVfDilycmg?=
 =?us-ascii?Q?geVT4w5NL4gjp5e+4kO5FPuFnojvFOWTgi4EUXDipjPhqhNPCh65gPg8RF0K?=
 =?us-ascii?Q?7bhII2JndxgatMur+tfqlaioa507AGKMkDDFKdM3JsSX6NJOa/3QghH6LuGB?=
 =?us-ascii?Q?9FoIghFxLyvEsDJ/fSzPS3dKlRNvThzjT0PYS6boXeGzpvEp3uyy6UH730P3?=
 =?us-ascii?Q?PGlx0uh82hUzAcGCr8DNji+p37wSTUjX4SMMBdgdLN5RVsRaWu/PXNM6AL8A?=
 =?us-ascii?Q?iHKdg/zYLWjMB8NkngInoMedo3hCKJ211XMAvBZ4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73fbb34-4f22-43be-f5ac-08dd5aff63ef
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 09:31:49.8242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sd57wxF6xMBU4O2PmJZB1u1ptJTtKjHpYFAdI3n5cl66RaKUJ3/hOK+cSS1kyLWCr7ieHH7/MIMNi68YklMiPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10381

Add the minimal board dts support for i.MX943 EVK. Only the
console uart, SD & eMMC are enabled for linux basic boot.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 - v2 changes:
  - newly added for board dts
---
 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 196 +++++++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 839432153cc7..02863c09bb8b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -282,6 +282,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
new file mode 100644
index 000000000000..d4a204eaf5e5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx943.dtsi"
+
+/ {
+	compatible = "fsl,imx943-evk", "fsl,imx94";
+	model = "NXP i.MX943 EVK board";
+
+	aliases {
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDD_SD2_3V3";
+		gpio = <&gpio4 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
+			reusable;
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+	};
+
+	memory@80000000 {
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+		device_type = "memory";
+	};
+};
+
+&lpuart1 {
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
+			IMX94_PAD_UART1_RXD__LPUART1_RX		0x31e
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x15fe
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x13fe
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x13fe
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x13fe
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x13fe
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x13fe
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x13fe
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x13fe
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x13fe
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
+			IMX94_PAD_SD1_CMD__USDHC1_CMD		0x138e
+			IMX94_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
+			IMX94_PAD_SD1_DATA1__USDHC1_DATA1	0x138e
+			IMX94_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
+			IMX94_PAD_SD1_DATA3__USDHC1_DATA3	0x138e
+			IMX94_PAD_SD1_DATA4__USDHC1_DATA4	0x138e
+			IMX94_PAD_SD1_DATA5__USDHC1_DATA5	0x138e
+			IMX94_PAD_SD1_DATA6__USDHC1_DATA6	0x138e
+			IMX94_PAD_SD1_DATA7__USDHC1_DATA7	0x138e
+			IMX94_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x15fe
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x13fe
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x13fe
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x13fe
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x13fe
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x13fe
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CD_B__GPIO4_IO20		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX94_PAD_SD2_CLK__USDHC2_CLK		0x158e
+			IMX94_PAD_SD2_CMD__USDHC2_CMD		0x138e
+			IMX94_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
+			IMX94_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
+			IMX94_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
+			IMX94_PAD_SD2_DATA3__USDHC2_DATA3	0x138e
+			IMX94_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: usdhc2regvmmcgrp {
+		fsl,pins = <
+			IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
+		>;
+	};
+};
+
+&usdhc1 {
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	bus-width = <4>;
+	cd-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	fsl,cd-gpio-wakeup-disable;
+	status = "okay";
+};
+
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
-- 
2.34.1

