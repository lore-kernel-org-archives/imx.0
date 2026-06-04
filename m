Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A6F35BDDB
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 02:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780540526; cv=fail; b=IGWicgAPk4i/VsJvBzqeE1gg7ksemRZyjFGsEd/zkcr36hfJxIbes2JbA3dQdS/IKUK9u7+zY4wAj0BMcOx5ugghAZX58RnXfzQB6rLN3ffMCtr1JDU87cNnjznHRPJ+6lMptU4pmqGwn2ITI5L/kKedj5y378xEG4mewrc9Sqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780540526; c=relaxed/simple;
	bh=qrY/kmMH8nQEd+NtvRIa91QZ2cAeINZqRSBpHEbFuAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HIlRxfwz38v6+gURP54qy4NeeH/OjZWLXB+3/lQqYO3ltosE0Fgm4EjUv/DEcazjJ3KtAtPLk29j0gu0P9qNP4ndl2D64lz2Hwy9INsleia0WB5J7KnkHzCzVwK7rUWvWYA5hrDhh1gE8ql/bgYUMm8kbvxtl2XUbonT8ObrX5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MIVnrg4B; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MIVnrg4B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5zrXdKr35l2u/UsUOmT/KW1zSjHPZVh93gvk6ZnhB241+Me//8zMWYGgcb/hiWfNg6h9obC+SgOZa7P6CNFgISCY2u0kJQ7HssYT+wEREysD1YLOeaKd7XFPJAEtsdHOgEAJXbAQg+2vWFVIlh99agd29jXjpnIuJR3bHe4e1GMX94rS6D2BbSkVFL6GMKjn5/iSO6mjUXPio39ztojTjQ2BFZYRfGFldTQv+7Oh7aWr0XT6DnHANtZ6ebZejXbQt6IXtbIRiwm35PXl55bMphB71Jh8tnKiwpRQKDUi9VlcZoxJEWlbwTNCjVtTUDBcRXYFGPhtlUNE/3bvH88Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxId21fvPsFC4uVLlgjsDoGghzwNkOcVWuZeBUv6i+o=;
 b=b6DpMUHpihgUA/SrG06wVJTMtMAXWQDTORlepNIEpMbF/4sSVTM5fSv/uybPoz9Ml0WZ3kv0X3gcDPd5Om5zK/yBE7S8D7Lgavv4+cgyDhPTwaQ5eoB9cToi1J6TYQsE8/9liYvQzWPSSo8Z50X+OsgAT50Gy0OOSJUlM3ufgWJE04IGyIv7ImTsqxzEQLTYaQiXmxb2dw6p0Ol3NpjOCaofFOMZhaeHihU5Efl5WI9C7YD+FJUw1nULJl8seD6rIqCplQG3uNEMhrnG3xFll7i81SDIaJOmqKVWDtF6F/cAZY/fkHmSXIx+euSBv0sTC5pWQHFSubB8vdv0QUhqdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxId21fvPsFC4uVLlgjsDoGghzwNkOcVWuZeBUv6i+o=;
 b=MIVnrg4BDNExEXlTR52WUtKaFKs2dgMNDGUsi/36OHN6ksBreQvyKj4WMdSUho81L4c4Hwcv4A7rkjSuIqEcVz8mz/OJknWlJhYIbwmAz/MtpQ4yRgtt7ToCQR3SQ+3d9AACXC0QJF38Eoi6XfZ9Fc1CPBV7pKMSR45ES+aVG8INJvz4VhWsRWxAEjA+Q7Nd9pif7J00W/FM10VTqQd0F+4RUTiyDTyh9UopPSAYfjl1wSBw2O5jHE0VsLTXflgFOmDQzQKjFWloCEEMVKWZm6BK7Z/qHhyVImRQjgwB8wVSKjf0tssEtTfqxLOjfkvjrj3H9UFJdrSCz5NNkmP43Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by DB8PR04MB7052.eurprd04.prod.outlook.com (2603:10a6:10:12d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 02:35:22 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:35:22 +0000
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
Subject: [PATCH v1 2/2] arm64: dts: imx943: Correct PCIe outbound address space configuration
Date: Thu,  4 Jun 2026 10:38:21 +0800
Message-Id: <20260604023821.134372-2-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604023821.134372-1-hongxing.zhu@oss.nxp.com>
References: <20260604023821.134372-1-hongxing.zhu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|DB8PR04MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: a09fb9b6-953f-4c03-cd4c-08dec1e1ed02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dg5atr8Dr5Guh2IqbUxC5K99UFPgXfgufyOrIOO/F5m/mwsUMA1bGVWlGrCcTCK0AKK7htqFbE/XmCCRWiyWPpsUKPZ9gZ1N5aQFTRR0MP2tcJNWxHy5IWc7MchJx0IzDQ8nd0zMxovt03LJPm45BDXfRx+fpRgQjkXpzrimy/nsFHXwwsuvypcWPC8iuN+RpyQh2F4vxc5B5Ab1ARjxCaLdzCYTk2dh8JZdM2wK9iEvf92KWZ1YEX42+ByY7ubbsTucSZiXSehzxmwOjAClsL2ssTHESQrBkdPJPCqbyg+ySWSysWyA3YQoN0M7Pw8hnE60KccJcOsVuLqkwYrtYru4ZMxbflB7pVjZrbTyvHUu6v8sZr2dY2V3zlESoE1KNIPhD4/OoxdfdjPYLK4fwsWI7pEwgHl2HZquniVsG2DTNc4Xf2WNi755FGC8EpEUxrgSKCEGVKyAN2bQs3nAXhyZ6EE+LysRj1cFtvfADgnBheoyLmoExVyx6j0g7q/s2Z8F7+P1Tyx6mSCbsM78YWQuM+KCwZuSNZJCXLZ7Zxm+XPqFySQBaaLrs2hw/RlhyLbUT0puXq/6JM7+eZkKKSm83vGMK71YIHqZbN+8Y1F5llVmCNVnGfBep7KWB12t8UUeZn+D6mGUREKC8Vl6r6aIdj44Uf6j5Hf0fMQlJtRhfhOjfJG3gRL9P89MWLy/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PJT48vpNYDvsTeVJPfFbpNeQwOwMpbrq/GzcwV4fXaJ4CqzWSsk04KxRFFy8?=
 =?us-ascii?Q?IlHf1WHLRsuYbjxGe+zaAD4w3yzxJm8OYME3199DJUOX20oLmsL26+upycRs?=
 =?us-ascii?Q?iv6yqOO22QbFT1GSU5gHasDm+HlnRu2wuWYlU/OsQxsnU7fOrWd3TZAl62AU?=
 =?us-ascii?Q?JifLGX182hmO4jz49O5UDP3sdCwJymKnoqqtYaA3WOl6yRgheXAo5Aqql7Yz?=
 =?us-ascii?Q?kNALtoEftvCxbYqA4eXdx8NhECF5AK6L/ChyFKEfx1KE3dzSahQLOJAwbLDw?=
 =?us-ascii?Q?WoUNc/PB55lIm7V+GmLhH3mSudJyHyqwYZQh3QT0X10XthsI/1MUiNV6A791?=
 =?us-ascii?Q?nXLmr/rhrVBgaIr0TcWLWRXeZhdIkKI74DMcMtl4V8GXE2cqbw0i5l3KRtVv?=
 =?us-ascii?Q?0e/dZiyn79SEwnVCi9eyp+ea1byAPLumxKdetREyl3BLiMpGhxATieoMQIOr?=
 =?us-ascii?Q?9t/nzCRXbsAixV4tUhu/T9ExISuSmG6iQ597eHC23p30k68AyzeYGgAAFgzn?=
 =?us-ascii?Q?C6v9NkcodAoK2TIRihDKl1Ql4L6QZgi70aI+3pl31Dp02UPYiJ2DfqKeEmkI?=
 =?us-ascii?Q?akOjjpDGhdizSIs8o6ZIlQlTQFFLs4R9OxqUxh3NrPO4UUvTbzLsLrqRdUVH?=
 =?us-ascii?Q?wGZdA2R0IiWD5LJdvQln/S4Thklb0HXtNroFFC6QrXl3EevgRXHdK249184g?=
 =?us-ascii?Q?M1lam9grhjtZ6Z2z5FPuLBBsJyEXWzvyVHZQ8sF1JihOihw5y4M8MT+JF6Ez?=
 =?us-ascii?Q?jg0C70Q60zqKixMpVRBHKVNx7oAj5HgSRydMv6rdG8u6sridq3Vtkbhv7uTH?=
 =?us-ascii?Q?U0fbYuscxU+RIFbNo3hAwJdhtOc2JmQ1r3wDKQjGvb1Abj5U4OmFnUVj6MyY?=
 =?us-ascii?Q?RW1QZ9H2GwifEq/NQnh0FEsYKezlV/X6jbg5kOEKWNUh7FejpUhFF2iwc1QN?=
 =?us-ascii?Q?KxqTK1HE4wBbqY9aK2fohNGCRoaGkF3LyX4vpb3rQYcWeTqsTlNFGasNaJWm?=
 =?us-ascii?Q?HwYXAzm3/szCpvBTM9v9dm8EIZDaRjK36tu7EnGJGew2ura3UY+WvFYLu3W3?=
 =?us-ascii?Q?mnhb38Dn/iKHqxOABAaDbQjwWMYOzPfejHf0e5ZIGv06squInQjXjK+eJ/Mo?=
 =?us-ascii?Q?cxVcjztCNJQ6/n49WqJKeKmjLRY++s7KaVF8EeeZs7kHc3e81c2GwNXTf3uP?=
 =?us-ascii?Q?UTdyLr3cAH1sy+F7EMl6zFWNozKtZx5r2Pw3dV/URsW3ZkSi9Nim0eLr7mmo?=
 =?us-ascii?Q?7R+mAPDKDNkaTcQK8oJZYKQNaKZ2GNGBKdOlR15f+ipr3Fp/tufzPQd8KoLx?=
 =?us-ascii?Q?/SL874mL0sh7J47BRtQMZW+uH/tm9kbcGbwimsrfiTLOGBWkGjl8i83BMcmu?=
 =?us-ascii?Q?+heHRkTubPsvn3aO8CyR+6m6lwXnVzqYxysIYIcUTxOhAUFWXOut/ssl+IvD?=
 =?us-ascii?Q?5PvOo7S/soD+KELKrdVyczdzBXWXEx2h1WKpqj5J81Evtz0OztDlKAux+9Zj?=
 =?us-ascii?Q?7t28e4z6oZAns0pTefh9vb5tQCmxgDahnb+1AggE5jUt/KB48h/mWavvffUF?=
 =?us-ascii?Q?wurs2SXnFdB23gHkc0pV2Mdfc4XGdZoGoTVpsBx460AgSchf9eKz79pMTX7H?=
 =?us-ascii?Q?iRgiKCiX9RHi2zUmId4oiwh5WsuvKDoH30DmA89tbNw/LcCiUZlBq4PzqnaP?=
 =?us-ascii?Q?YZuQykOR6RaQwupHBKpfzLNBb68jzQuXg84aUlK9+p/jEdzkpM6QE9oGhjG6?=
 =?us-ascii?Q?sRKqKSWIvTvIbZB5Ikb43DLlQBTdR2JTe4rghK/v5AHBE8MLEwZp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09fb9b6-953f-4c03-cd4c-08dec1e1ed02
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:35:22.3756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDM6/+lNvUEh9e1c1hkNqEnHKga+g/ZeHHUnLtBEbCCBc32XKyYZ0zJblyBJkjv32Ly3xU2DMlqGuZ0lHxUnzLUF2do9SvvINNs9ejm0Vudb9djDKPUlLucJMRkK2oKM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7052

From: Richard Zhu <hongxing.zhu@nxp.com>

Fix the PCIe outbound memory ranges for both pcie1 controllers on i.MX943.

The memory window size was incorrectly set to 256MB during initial
bring-up, but the hardware supports up to 4GB of outbound address space
per controller.

Additionally, the ECAM region cannot be mapped as I/O space. Use a
memory-mapped region for I/O space instead, and relocate the 1MB I/O
region to immediately follow the memory region at offset 0xf0000000
within each window.

Update the outbound address space layout per controller as follows:

  - 3.5GB  64-bit prefetchable memory
  - 256MB  32-bit non-prefetchable memory
  - 1MB    I/O

Fixes: fa6067fd8ea7 ("arm64: dts: imx943: Add pcie1 and pcie1-ep supports")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
Since the correction of i.MX95 PCIe had been landed. Add same changes
for i.MX943 PCIe1.
[1] https://lkml.org/lkml/2026/5/20/427

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index ed030d4bc7bd9..cf5b3dbb47ff7 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -218,8 +218,9 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3e0000 0 0x10000>,
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
-			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
-				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x80000000>;
+			ranges = <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
+				 <0x82000000 0x0 0xe0000000 0xa 0xe0000000 0x0 0x10000000>,
+				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
-- 
2.34.1

