Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D111D383C8F
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 07:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594460; cv=fail; b=hCiGfD9jY9AHNjunh9qR3HSo4yu7OMLsYwjM4MGg3Vc7qbQMKT0o3GLbkh6+kgEP68WUucK3ULF1kYbmNutlD/2LYxU3nhxZ9PorDizk+E51hozFJOd8y1hpxiI+8mO0Cv5eVDZilQV1r58jy6H341R5iMebiwZpfVGSdgeZzNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594460; c=relaxed/simple;
	bh=eKjcycFK+y4jbzcUB82toVmGifZDigNZDHSDryKHAc8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M+QoOEJxcDQ4Dol28wMfNPZAC06dxamei8SsBPdO23bB7K1ArvMqouDGYSp8JLJOfY7MxodGHgMzB8oGLG7zaS+ynXzy87lJ425yCcXDU8v7SqrRcMSOtceqXZ1VcxvECS+blkOMfisJVpaJa68sQzp3Y4ILz+zRYyd1HeUWVjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fDssr6Vt; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fDssr6Vt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtqrFLPOdbDLgQ1zYflLl4FuyFc++lhxlWfulkPLCjBCDTPSLopPEOqTpZEG5/O6T6S9qATlv4119jEm8aTJdaqMziwrga0Xs3oJ4EB/uaWRP867OzfEYVLQKO/6mp6loXHrVD6dpt3FhKYY/C+IjeXjJAgyLCnoDx5rhO/IWbmZYdXbLc3T8CqcdobGKoNeisj8HmDnRd4kNLvoX4vlpAOko+t1qnBRo18NjGl/DEXfoqKKERBJkBgL3WWqi1nzaiMGAa3gmxJxsI3BSDEF9krJauCLA2ClejjN27dMmZMgEvbyR5zJAWj0zSbDe4VpZEC3eEUrI36CyH+UrxEBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kcjCXaunUB8v+sIITehr6xjS3Ls7mlyr7Skiivc+b8=;
 b=JdPKwKrCqd7jkNaH8RJkPa/NsmuIFEhjEVg61xU7jZukZI+adzmse8Ca8+v6a3/Nw/HxShtjqIndF+9b53UXwEypyjzrrAmx1fccB3e88lbIxQ2bRnsYJ//A8u0idui3YJ1Df1lrrM9b6ybCJb1YEFM49NKTi6izI4AZOtDH/tGLHRNzr9/77e7bLs8VjrvLsg4jqO6jO/YUqMzc94RYTyHZKtG6fvsB5s5dMv9SkX9gwcDRhvBZKyA3nw4zZnxSrcN33rXL84HQERcH/xn7GxLG9irbKpsr53r6cwPnKJa1ur4UsdnxG+x8yDYQ8SiVuTgxWnCOQE78md3bkdipxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kcjCXaunUB8v+sIITehr6xjS3Ls7mlyr7Skiivc+b8=;
 b=fDssr6Vti2gQksgNQPREKXZd4lKl0ol3ggFLtll/dB4MtbYqEI7PaAWP3KHoedlfjuHDtvoBbLjy/RuLlxdeApc+lX5W2lpK0wRbZuOxotykNrXXd4VvkgX1+MxRjrwEv8Uw3tSNqF9sjKOccKm1b6jsx4b8b3jwnPTGkZtPYkWBYzwfalS0hvSJWwsqRgUkFGSa2gYRjY5as038aLhM0fFrIuw1ZLBPMsRUeykzwC66VWV6aIWZuoHbPb73xLuRJF4aq/CJs7WdT784vJ11T1ryIPcDlNm2V2Ecr5ODlncSva6eYos3V0WXRURSysR73gv/Z9p3hsY9l+v/VTED2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by AS8PR04MB7784.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 07:20:56 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 07:20:55 +0000
From: hongxing.zhu@oss.nxp.com
To: sherry.sun@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v4] arm64: dts: imx94: Add Root Port node and PERST property
Date: Tue, 16 Jun 2026 15:23:34 +0800
Message-Id: <20260616072334.1107262-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:4:297::6) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|AS8PR04MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: bd36d132-0f3d-4844-60fb-08decb77cdea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	lp7aFDcf7+m9XKvkfNSs8Bbcdu/r3AWwDIyUdksxYvl7XQB5ik9ohSbcBRL9JmTm56/CzXe7vbj/kUirahHMjsjVeY05rPCG5F0NQCnnunws1D6PtgBjx6M/8IrFBhDSkBJtQ4k4qADAQhuKYPu4f98ZSoS4gwGEyo1jFc3+exFlJf+ZRq4VE9Xpr8CKOlj3WEcvibIdbv6ZBDWB4q3s9GtSg/lx9frq9cWxBfAeDjJQG2XsZMoogTbvYCdg9i9mfVPv0ePE/MJJBUihTtZyUjZf0M0qftwwCw1K6dOHh/z6CBCGp5UvuZ/1fnFEcZTZL9GJV3RkLIgWCZsVgbUh/zrNL+18crl+j8HaCzEFzs1sJJdxuhOSBKEzOHkmCCNjuszwv/5aQ/YDnil6QjTlIVoVEedrZQZyw+BsmkOCGCPu0G/Vm8+hgaCrN4Cd8agf5TGXz2QeOPn7PJqq7ZN2KT9rgr4q4pFuX6lIMimEDvgj523WyWqLijtFfTd8W+ZH3514M6wH7QZNshn0P9IspwriQDZEWbZQ1nXoBWpiAJKUYXH2EjgrXTSu8s85MgEuSvI19xtz+63F/kypK7XlB6xsRTd+25eNGRaR7K4cMYE5QkpSpbvkoOKAi0h+RGV23KrwyB8tbfO4bqV5cOeyMqidlFliYGO6oEh+zFqqfyYh/Rr1qTwdmtUj0MXoXM+f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(23010399003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gstaLI/Ngk5WJHKv18R9NgXd4V4F3KKdXlI0+C1D7lKBHC/TrD6Mjq2Y4TVS?=
 =?us-ascii?Q?QvgZA7yOwVwDQZI9X8eYhKgQ2WtP3Isw7WWf+1tvdXqgKIt6Xev0T0O0ifBK?=
 =?us-ascii?Q?lzJUmXI3z0t/+CWNGP3CC5o+QeRFRnroEGPfdNhFcjFBoRRTz8EzqztkNNK9?=
 =?us-ascii?Q?yWCGcvTHtly2wwv1QbhhDxU8tNhR+1mU9bY8/bTqYKMH6+1decM5bofCA3F2?=
 =?us-ascii?Q?ioj3zapupAGdcXxjnLiDykBh6nZXIg7yvFFPUudrj+9U4qYxjzckBQNGGreH?=
 =?us-ascii?Q?XnT9Y6PsqUODg7J077Pt/dUd0pab62+Lemlz/c5ji50iUlfjNf5Li66bYDLY?=
 =?us-ascii?Q?pgyYJCTlegfIR6LUwc4kHLK9i+UYZOAoU9IpLMeOR0Cl0iLZIGefKJgHRH0o?=
 =?us-ascii?Q?jJhislx4oxbjW5a9TJvb7n3H7geM9eoxnPQYNi9rAe/8eLcdh70uTmdLHJvk?=
 =?us-ascii?Q?QtJ9S1wHVNtbjy/1iu5ytXjP9Z/lQ4WWewcDkSKsNpYyKh6n0aDUqcIoa19p?=
 =?us-ascii?Q?IDkvTEtYSV6vqGbdv4kaVb7idKFpGYKHlwPMBejM1pn9+L/VXr/MyLY9Bx87?=
 =?us-ascii?Q?0xrve57wYFyXBDsvUej1KTAGnFcTpCn0qkXTtAYSQw8cxqRRVhPoqhjzWKsv?=
 =?us-ascii?Q?JDzk6SPIHwLisRLcavn/PzONXh7+QiqUjCZO655Z8pXerd2DagUwgNRsMSK0?=
 =?us-ascii?Q?+PFdz69/L/hkRGZm0hrQ6LpstL7lud10eRitFlXiUTT5MxZlh7qkWNzOjZjV?=
 =?us-ascii?Q?mt5cN7nQL+s1Vl9gGWJEo4jGSnWIfnTR+fWu8Z+r61zQxMFp10WpK4U8akU2?=
 =?us-ascii?Q?i+Ed3B2PPTYIjYdJcW8vcwa+iicFqJWG2TRC8J5ufS+Ow9wDWu02KZv0xrxh?=
 =?us-ascii?Q?ueL5JgGmtr4DvWQHWyaUwxc5jj15+jJERfAn1i9fhdGxJgCor/BL138x3fo5?=
 =?us-ascii?Q?8bKy91cB9jZd0wcu4hYA88TLnbdVUG5RsZl5g76nIo68ErfrKcQqKIe1J2TG?=
 =?us-ascii?Q?xAt5eIl81CU1tB+5Vuk4YmAd84K/powDxERc0jfMbDT5VxkrAJSf5Ro4ycaJ?=
 =?us-ascii?Q?XDmWuTN3ouKWzNIAnwlhZx8TZmjBBtapguY0u17+zb/LXilOhfFqArHYeZze?=
 =?us-ascii?Q?jzy8EYiLDcaj9qJDiemQAEkXtsO6i74sNTNWfoptok25ycSXGcdz1ugf7jya?=
 =?us-ascii?Q?1o2bIIeOo7VorPRnWrwPCOjsIqFZGlXdsh/UxNiUgJw6NpiFOxjVgxELjHNU?=
 =?us-ascii?Q?/GVPJ9EQRpgZ0E5/ktz0MBaRwRJdqqpl7UVrA77or240vjMzb8CdI5emwwSB?=
 =?us-ascii?Q?BYIfWXI7eORG3t8IM9QdJ9XZm/uoBBhpxippfcwYQ+3MYVvuyCAs/znH0vXv?=
 =?us-ascii?Q?tyynyE3103SiXjV/wntKS8BJjoh7J/48hKavgR/bDg9XoUo4/fuSA8UJdPEG?=
 =?us-ascii?Q?rsrUbtWa8WcEuL4zMeMzUylviRs0zhehJVdMNFvKJ3AtOdgftj8He21c8jbX?=
 =?us-ascii?Q?JduPqC2FDxDNk24YDXpEHZqeRA8k3H5Su+TUj2O9Tr7wD76T0+0nsjcBwZXT?=
 =?us-ascii?Q?aa2ugpYaNKs+lXEc2EU4xZY2YXdPvq0lTBsFenL3DD7pqWXsv90ePRxgcJKr?=
 =?us-ascii?Q?ehy5fK252IdyCL7EiNrHLsheXuYEdCcqbfE0/buNkjbvHnAX/I6NBrQ7nV+8?=
 =?us-ascii?Q?niJwn88XOMr07u9X0wHqQfONhsjBWNQwHE4QYwH/JPQxIDm5V+J5FPhcqdop?=
 =?us-ascii?Q?BFW1M3RiXJm4mtBxiVNDdaqam29vh7pdR0OWT0/mta+n+03mbuAD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd36d132-0f3d-4844-60fb-08decb77cdea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 07:20:55.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBBuKfkhDjZW23CHa96E5z2/d9qpdGms3p7C3cQfkdtx6dZfHUXvLajWrO/UONaUdMjjhXdHzwqKucmSWjUauHXlylcj1gA5qYblockxgwwqJfDJUVfDFAVtv/iPorSN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7784

From: Richard Zhu <hongxing.zhu@nxp.com>

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.
Move the regulator to Root Port nodes as well, because that the PCI
pwrctrl framework had been integrated into pci-imx6 driver.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi     | 11 +++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 14 ++++++++++----
 arch/arm64/boot/dts/freescale/imx943.dtsi    | 11 +++++++++++
 3 files changed, 32 insertions(+), 4 deletions(-)
---
Changes in v4:
Add the description of regualtor changes into commit message too.

Changes in v3:
- Move the regulator to Root Port node as well, since [2] had been
  settled.
- Collect Reviewed-by tag issued by Sherry.

Changes in v2:
- Delete reset-gpio properties in PCIe bridge node.
- Correct the "reset-gpio" property to "reset-gpios".

Since the patch-set [1] issued by Sherry had been landed. Add according
changes on i.MX943 board too.
[1] https://lkml.org/lkml/2026/6/1/1461
[2] https://lore.kernel.org/imx/20260520084904.2424253-1-sherry.sun@oss.nxp.com/

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 1f9035e6cf159..dfbb73603cb24 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1411,6 +1411,17 @@ pcie0: pcie@4c300000 {
 			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie-ep@4c300000 {
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 7cfd424689507..674410e541cba 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -1034,12 +1034,15 @@ &pcie0 {
 		 <&pcie_ref_clk>;
 	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
 		      "ref", "extref";
-	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
-	vpcie3v3aux-supply = <&reg_m2_wlan>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_m2_wlan>;
+};
+
 &pcie0_ep {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
@@ -1058,12 +1061,15 @@ &pcie1 {
 		 <&pcie_ref_clk>;
 	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
 		      "ref", "extref";
-	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
-	vpcie3v3aux-supply = <&reg_slot_pwr>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_slot_pwr>;
+};
+
 &pcie1_ep {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index cf5b3dbb47ff7..01152fd0efa5e 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -255,6 +255,17 @@ pcie1: pcie@4c380000 {
 			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
 			fsl,max-link-speed = <3>;
 			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_ep: pcie-ep@4c380000 {
-- 
2.34.1

