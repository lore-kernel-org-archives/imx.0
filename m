Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F3730DEC4
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997326; cv=fail; b=rdIsuyt67N2hJFtbDivQCLDy+MmxqkYJrMBtFjx145FmFCnGe/2mLIrZoo4OSE5pUDwxay5Xtmd7WG6onsbFkAf4sTCHO7sB6FTeq0FtUqLKIHmiC4uiXJuYmm4lHqan5w6h2zxeSJzmgppsYVWoznDYsz5SAHts+Dw5ME0H104=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997326; c=relaxed/simple;
	bh=iyU00nbRp6vDahFMuRThZmleL9GOCW4pR/pyorvdWa8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dehXg8AFdXIjhpG/Sqsa8TBjRcHsocYnDqE2+ICDid1NO6x6RU8GfAA58cHNXSqJhimD0YEV6ituuAuCtkPDWOuPX3OAiIkXe5tqlXIJj0iDyDhGlY4iAlSIsNNNldX/JWgTaMcnKEWHwa0+wAJ2n5WpExmNWvsQioGGkkeJ+AY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PIN7CE8x; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PIN7CE8x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXoevTe1xgGu5xF3cwvhtW41V2ZnnuiLdGv00NmcDB4aCGNdlYrKP6iNYTyb9KTFc9ylBkR7r5KYi19Qmn3saa3gPqARG57ogs6dze81Bc9tt8JjAfleDftzxoGwK3fKoW6LAjr2rrnudgAUvuNiOf8+zBWR1uWDoCFMGSFWnGh0UmB5inyJolKShKgxaM+Om8ngHFk4eX+CW/oKc14rI8ZOIxsnnOYB4phSKMJBJlq5e4nRQhN7C40St8gbeDotLiwTM4fFyiLmkwBAljz7luzsFi0QhIGla6ygexlP1FKoruJ4hkmTy+6D2PJymIjBYpklsUPiZuvv5tRyArAqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnShDXVZow+TBEEXdiuGJZThcRQhq1pkL5yaKeDoP0s=;
 b=AHxobEADUNiaXqKkYUGrMp7ge0i94nxysmiFCmyMHmn4uQbbgSmBLestMEwNyn0SgzPz1rqR6dhSLDOqKY0+v/zUL4E4r4LKcA8uaVAgtDRJQkkmMQVhEXqXO4AvOtWTXlUpAjqLfvRjFhCAfqXivp2bB8N/y5Xq3zUB+BYmVRZodlAINZKmbXBXxYWkk1GcuD6TWzGKvXHm2OUQXdOCLI3Unn4OYcu5QujyCNrUpaD0Mv78biah+1vN561zf+sVdpI+qvbkme7q08szV5G+BMR7j7yTfa7d8gvkDl6eT6CovhvuBOnQbFPKTpA+Gj+OjzaUtloHUH9+ugIZLV/MDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnShDXVZow+TBEEXdiuGJZThcRQhq1pkL5yaKeDoP0s=;
 b=PIN7CE8x5/wW1SyRqOc8A4Tr0JXCaHKhmQqgfw4FsEMQqgI/TAKeG/yqQMsnUDXdinUuDLp/kOoxAdyk1vOmdEmgDZznqnndRVVJM88h2zZI8iI7vmakYVEwOZQpy27UOohaSqPeZUN+hNHCzeZVzDmRtgJAqTIzJU3bLaV9ZOc/FPd10x8yWbyP7Ja34AC6KRRxerI2RFqsKWjzRzoerADr+D2Z364nR+0ngLG32HYDYBjkgylIqrGIMSavKteYw8jxmVZI3LovXUyn72xdZaTzvWc/ji2K2EhsftBEdaNmnkXMeOuI5uhk0bo1spnBS33beSTgFbiBTjn/LvKdzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI0PR04MB10662.eurprd04.prod.outlook.com
 (2603:10a6:800:26c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 09:01:54 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 09:02:00 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the default dts
Date: Fri, 20 Mar 2026 17:03:26 +0800
Message-Id: <20260320090326.1483403-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0242.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::16) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|VI0PR04MB10662:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d63c9e6-bced-4abd-3862-08de865f58c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	rr99byFVY9EgEOnc9kuo4OhuvAiG/E9NeT6lYK7kH4jlN/5jdq1O/did+3KwzDpckaYSKw2T0njqEgQYo87M2/VdJL1xiOh+u0h/Xn0D6byrv60LfjgXkagS8QmAcQoPccZMymm/5wi0xhkwlE+UGz0jxB48CvUHqy8cytomDZWQ0FsKb+UCvqZ0D6gLb4rXrz5aANIILUPSxKbpatPxam+J0fWu82vR/S1g24atJGVZu1lEdft09oV2nNGVOKmZ8rgut+LrygT8VbmPxIgACIGJd2AN3tWM3hrSVwEKqcGkWpXM7qpa4twDhvEKFapzl8Z5M9PI3E+OoR2HSPxDgEBMti2rTC6WuLgd4pxsWPN/4FPL2sTZw5gYfYQ6l0b0o5YQ/3SKE22PreamU5KdQ4X5TBtku7LQDCL123FwZpIH1W4/Ww7GG7+o8erv/ACX4F0Esi2HbBmmeYF0L1np+GOl6VySp1Eff03IckyxnPwOr8zlGy3Qjm1ejtaaLpzhCpwLxbxDK7ILldvgiJe0pMh1WikjdrIL0vv2vHa30tStKFgUZM2lRl+t/UAtEIjY7OJ06j19RZnC4Olt5p41r3Pp2fwuZf6bOZ8CCqh2Nz8589w5ym1fx0fRiPSlp4aw4E1B8RmjhJGX/2KslePUCCWB0cDdjwHuZwS0bT+B2k1Hft2ec3F6jVduBcm6MxYhQQCwYCRKUaVrFQF8qrYZpwEoSWVS9Jd6ul/8PUA+kaTOVBAt1uhyIbt2g3JcmCO3KxdBNOk7kZB29BLGucV0KcviJq85pGyjdgdKpZHN4A4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E1b0lYCedDgQ2fTZHRMkJPAAyo52rqfiFN50so39IJ0g4uIjbG9xHoFLnfBx?=
 =?us-ascii?Q?XHXa//LfDDbm1OEMNt5dcBDIyuD86d40nT5jh/jK/2csaeC3HprgITHQUz4U?=
 =?us-ascii?Q?OVu3rdOkOna+P7zuPQaNk/vO52U5zgd6HZXWzkydef+GjJ9uajdBuZ4+odRD?=
 =?us-ascii?Q?6v470NZPyoynsLl5cS0V/mAhUsn9/kqt7uCJR6MbtKPgZBiqVo5pmFvvcLoB?=
 =?us-ascii?Q?GEosnEqDMpaBDdAm4LPdCoErgBq/rgGAXqumGrF9F1KP1FAErkAkllStRWZ4?=
 =?us-ascii?Q?uKzuYG3Iq7+t4nUshffA5enJcMjvd73ttyh3ha5qNK0WmytNlRFYva2KdnHZ?=
 =?us-ascii?Q?yFn+ikW1yc3T2BeiHTghY86jlHK1wIE0RJ1Txr28h5YBq7FLYWNtWkVljf0F?=
 =?us-ascii?Q?QGmO17wxBWiCor1Fkd/mR+wZzKBzxRKxuz7VNa5DKmMfJjlQq9tVdM4tX4kx?=
 =?us-ascii?Q?ey3R2x6PDzXWbiOV9B4Pltj/ICJHq/7TOwGm84wNEZr0DU3YphXF44Z9NrXc?=
 =?us-ascii?Q?oucYWxhpBS5/WRRCqZqSZk4nM3p2ohkdCwv3mshHfrMX9w1tRkPFKpzjPnI2?=
 =?us-ascii?Q?GTviCU1Up7Yqs0daFXXaZJhHdH2VcM1e3T+pWsV4A0M395JUkCjhOhbMUg4R?=
 =?us-ascii?Q?MNEqVZlufTN35CF8JMbEbPFdCCOfDVef9Dx8atCCwikI0A0F3HTSuc0IeyJp?=
 =?us-ascii?Q?8BQhdpHSWIoozeX2ydpZ7mgCYrDd8nAUMu2jcHY9wAN7ej5XxjDT20fDHg5i?=
 =?us-ascii?Q?OTJXwbxMMFr/265tb9DV4jVkaixlq5A8q+yh3MhlA739obhAx5DiecsnCI3d?=
 =?us-ascii?Q?MSyO7YPaM/dLMneYHogoO96GWBVAsOVSD2PfrdKXz+rsMKepTKXkKddf9+fl?=
 =?us-ascii?Q?vDvwAQIo4Zkme6nfKl61S8CalA53RX/DKYwnCiUI8CW/RIqezhb4MV0/x6ux?=
 =?us-ascii?Q?2wtkS15b+fr+6jHpGzUSl2BydD1hhVTn2aC+sDoVgpocxtI71HZtd+WMSi5l?=
 =?us-ascii?Q?CKIX+mT6LeU9kT5YJJiHKhVbae/VEx1oeeqLJRkVZVJetWZM2euyegnnDojc?=
 =?us-ascii?Q?cJcOrFSp47CUyjcSLok+xvbYFH1N075Ijq16UVQvMuSPjgQxEgSkw8uMPcsj?=
 =?us-ascii?Q?M3GXQYKN7qBAIDommIxX/YvVHgf8wgf2BpU5HtOHL+uAUpbQKC8KoPwj/ITS?=
 =?us-ascii?Q?dtehuZK4uYy+BHokWIdj4a3JfgMC/Gw7vkqVqkJDFUNWEYGN+5Z1UyIc7oKg?=
 =?us-ascii?Q?55T8dkrrCYDsv/T1mB7gItvriKEnbnOEZqQpocQXD4s2MJEcvzuJi5IPB0q/?=
 =?us-ascii?Q?PliZppveJ5iyLoh/zSDQVUsfYcP5HY1uz2vfyANS2rkb6az39oaBj+GC2B/+?=
 =?us-ascii?Q?B9sYDkGdURrZW3cKSdDC2giJR4jRa+b52fzX3WWWbC7L+z18aROiEOQtF2Mx?=
 =?us-ascii?Q?H8KXLYcdomGSjuu0eiv9gCrym5wNLngYW17vg9CPNPBV3RGpyQKMej90dduf?=
 =?us-ascii?Q?MNGJd/ZAQ42N9+pwx9q1xObsSYLNG0psDnm7ulXpsIWu2+rQx2ogYiw8M/Dv?=
 =?us-ascii?Q?V+N0lpiQ0XMfTPZBlgVCWc0rlkzEfwOy7y/bvRbp8iok21ieM2QcwE3rdRLb?=
 =?us-ascii?Q?vCnA1TmBkzstMB2/Xe8gzvVFtbWUb+9rSAI239975Wrpf4jD7JVrmIyDqK26?=
 =?us-ascii?Q?XXRYAYnKRl6hKcPNhTTt970TWtmYbsDAPCM6ai6q7rnvo84u3R4dzgOBvi4A?=
 =?us-ascii?Q?rf30dlXNbQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d63c9e6-bced-4abd-3862-08de865f58c2
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:02:00.4945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFBk20BE/sBFKisxqGoUEgDvC0B1hkLwNlU5d45xJ0a5tn77LslAIubAzSh+fAApAjrMsNMSlsD/6REfi5UwPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10662

Disable the PCIe bus in the default device tree to avoid shared
regulator conflicts between SDIO and PCIe buses. The non-deterministic
probe order between these two buses can break the PCIe initialization
sequence, causing PCIe devices to fail detection intermittently.

On i.MX95-15x15 EVK board, the M.2 connector is physically wired to both
USDHC3 and PCIe0, however the out-of-box module is SDIO IW612 WiFi, so
enable SDIO WiFi in the default imx95-15x15-evk.dts, and provide a
separate device tree overlay (imx95-15x15-evk-pcie.dtso) to enable the
PCIe bus when needed.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
Chanegs in V2:
1. Improve the commit message to clarify SDIO WiFi is the out-of-box module on
   i.MX95-15x15 EVK board.
---
 arch/arm64/boot/dts/freescale/Makefile            |  5 ++++-
 .../boot/dts/freescale/imx95-15x15-evk-pcie.dtso  | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  2 +-
 3 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 107ca270ef32..c04b22203552 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -471,7 +471,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 
-imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
+imx95-15x15-evk-pcie-dtbs = imx95-15x15-evk.dtb imx95-15x15-evk-pcie.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
+
+imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk-pcie.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
new file mode 100644
index 000000000000..42384e6233f3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
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
+&usdhc3 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 7eb12e7d5014..afd89ce3cc5b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -557,7 +557,7 @@ &pcie0 {
 	vpcie-supply = <&reg_m2_pwr>;
 	vpcie3v3aux-supply = <&reg_m2_pwr>;
 	supports-clkreq;
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie0_ep {
-- 
2.37.1

