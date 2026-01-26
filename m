Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD28230275F
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769418744; cv=fail; b=rGDuqd/pN6bebZv5bvBrQroxcIlLjcpcurkmXXm8Z5kfN05jsAezFSDO8htkmQkNitwMd2CLHilz26ZF4WqfQTHMhnSm58aoANrG+hvTGBPA24lUHSl/4vwf+JUuWUaStDfAi2FWZS6wKstVLH59J35QPd4uYnY6ChOi1cZhm+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769418744; c=relaxed/simple;
	bh=eFzcPIN0MsT+DwsPxD02qTJF/Fox1lwk25RS0jUBCDg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GfxC4cpfSCkKyUjXsZbrbEhsNLdLZi1iodvWGvwpveqVxZE9I+tbQ6Hz8Vupo+ft/NXzKwGPPmVCgQ3ArTzcRZDnzxl1y4KsDqRtfJktnzcwMDt7l6Ez9QHQHpMX5s/gKJo32Ue1gqP5I1JnUy1zeC13jcUBt96wrm0/vmMxOpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GjkNNF/5; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GjkNNF/5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4ufHDVV/ejxFSOskcLjp2D2EK4YCVmQRtWesV2GRtZi7kxxKbVCOnPHdGPp2o6A5fTvNqlTev775ssj+u+P8QVJ6fo1Qz2AfDDbyn8iwl60jfs8FLVmG9A3RYYSzfrdoy8enB89o0W3o08BWgUaLYPBm6oac6y8HGut/lYsX3F1RXKL4UF2ynwQvvhIXOR71hJlF6KEfsgI1cw8Ln/BpLoK7UxV3tkgmccdDf4pimSHSUs4PSgu42CI95ds+r7WXJLnykny74fbXuEA9N5QpW+w4A3rn11HtFw9aczfIxdpUPefwT6/n/9F1dScJc2dqKagtl2h1I6MDVAhZUMuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44h52C+/D1n8YgoqhvGFkQ+8+BXdKDuOlNGl+eh69sg=;
 b=InKzVW1YgNCS+PhLI7n4hfdWAhkjwHM9lMNlHYaW2aB5zGLMu44CxtPlX9V2dYDcsYf5940OOjiQFaKHGayOn5pUvxWWKaFDOu7LLB7D4mzqgHdU+Y+RKu609G9XjQY2I7cMDPaK7ze2JFdCnYZFzehPbanUuLvkPnZk03wg8ILD7pNGbV1Lx6l/WR6jr4tcwyNvTbBGFPQRew/GDJnq0neAzPutHXDJ0JdroYu55fpK012g7agOtrbRzRS6pR44OMecKQ37F4XNqiBsjypbE/WbNi9S17MEtpG4mBYu4KPhRBiEObc6imRfNvl4g22ijGJYRLh84exAYk+AVZMfLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44h52C+/D1n8YgoqhvGFkQ+8+BXdKDuOlNGl+eh69sg=;
 b=GjkNNF/5o958jPzXSpnRaR/y297zmkksIF70VITgJPiTD/XYaac3FOOhV3PHLdMXj90VDAOqlHjiwo4u5YTYtg+uAO9m1XWSEhaJNVZXgqjZho8nw33DH4ZrU82I54OcREZu7TZcfRdfma3vHZhc/akaJ5w8GJBfcoY/1Af6KDZ9pliIqoozt8AwyGyPeSM+Wv1pGo/dePwL0NFjmmvudOhb3CtCzLlnBpYjTnxyFoHq7gUhSSz7bXWJ/D1E5/RtLHl7GHrBFwS9eCMp2DM2xqq68UNv469DG1ZvbVlkyoMgIX2bOUQSthxhs/x1jnkPSVglzCtZJnC4k/fGiGiC7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AMBPR04MB12206.eurprd04.prod.outlook.com (2603:10a6:20b:759::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 09:12:20 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 09:12:20 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	laurentiu.mihalcea@nxp.com,
	daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH v2] bus: imx-aipstz: set default value for opacr registers
Date: Mon, 26 Jan 2026 17:11:56 +0800
Message-Id: <20260126091156.951052-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AMBPR04MB12206:EE_
X-MS-Office365-Filtering-Correlation-Id: a2518aa2-0e3b-4210-ca8e-08de5cbb026c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6PaAXGQb8pWeCkOaxN+Y6YisEg8RcR4rd87DZGFYaLVoYJEHXWgD3uuSqEYD?=
 =?us-ascii?Q?ACOB3nY6+8jmUqZ9G1WQtI7PM/ZI+C3gT8oTWT+CvNYom1pnnimnGzWEuz0d?=
 =?us-ascii?Q?fRw+YGxlKj5a3omOXUgCRHR19nX+8AudoyJaNKexKwRVibCWFuWVsvmKD2Ri?=
 =?us-ascii?Q?ytLI0WzsTn1MSqjTVObh5+pJnH3SDX1Pb+K7W3FJYKNxypcqaEmyBnvLfxO/?=
 =?us-ascii?Q?6Gf4vscJyA6FmAl/6nwJfaP+iVbHhluESQXufDXeM6TEVFl/gWsMdu6zuy9g?=
 =?us-ascii?Q?d+qQwDpE/dAbvvhf9+kS4TxGJS0nE+eUYUw/f0nsImeDQnsv+ydGNk6pLFId?=
 =?us-ascii?Q?aEO5NfJJKWfQaOc2VcWMPfu/YYhoOmk84mk9Ln5s6h5B2FkzKcBAw/z06g40?=
 =?us-ascii?Q?3TYSInoC6pvT3+FcNALoiVICRbMUhmn2ugCJT2yG2TGgmKOlovc0pPd4O2W9?=
 =?us-ascii?Q?vRH8ZmEtHwRAvDs4beQs7xwqg8zntRf7izC+157D/v6du7OoxZXP88QhTnZJ?=
 =?us-ascii?Q?469rczK5gXE2W0xTnuHpmZgTPMuc04hfQxTkNzRaO/tb2OYNysGiYWLC1r/l?=
 =?us-ascii?Q?2WACthNKsDqxIEo5EVBs2lr/krdT2G5WnofnkZnDWrE3/PGYvjxhgg3M/qZB?=
 =?us-ascii?Q?W3SualtoAu6ptbePkfTwakolvmm49u+EWZJr6QZP1FqjzIkc0wytRQjI22qJ?=
 =?us-ascii?Q?6yuI4E25feMJTvbLnZRIZzt/p8FVE3CiVmc3M9y5D7pH6V3xB0NICoxgOXvP?=
 =?us-ascii?Q?e/Y7mlPSc9H7IH9547QuatC5+AcikZrCCe9dlXoliXRyOWDJI5mBGhIayp+n?=
 =?us-ascii?Q?vdVIVYb1hO5MICeyXSwvSEYfWx+ACchmDTjKj1bBuGoqhyky5hXUJSg+NYmg?=
 =?us-ascii?Q?8v18lT9qzwlBwoWMqpDqYAnMG7cuwWqZ1wzVndfwYwwNjv79ECxPW48/awk+?=
 =?us-ascii?Q?SN2NiH1rG8mwQ1cbeKcF0uh//lQObOr1DH0HJKmtNUXOTbSGwjisRinGy2zj?=
 =?us-ascii?Q?vpXFzrhn2b6tGPzscMauFMOE/ooGbuV5w/dLVf+fKGuxLjJjMmnj85M5n+ph?=
 =?us-ascii?Q?/pLpTUqV10/2NePz7wELj44/0k3V/y2eqfcxkAYZ9hwgTt+k3FExKc54rwNd?=
 =?us-ascii?Q?4NU8Mao5gmlk2wDn9LzDjR2xD/SJq1eS+FK8kFcJ1FONFRxwYzG8GAC9BGq9?=
 =?us-ascii?Q?ronGPT36BvBEwkoB5Lhz2TNrRjDDEMg501WcR1rN1iY0WbR7nb4MA1vrVByB?=
 =?us-ascii?Q?g9cMAG201KsvF4sTdpapBIWLuQQS1EnXPGFOw7lMbpqtPn3Jhb1g3+uzU5U9?=
 =?us-ascii?Q?aQt7RhmQpgqigaKeeJIEXfE1xRKFh+QzH4Vgegc/NN+5fJLQxV4wt57MgilU?=
 =?us-ascii?Q?h0+YLVGnaTaId7r4lTRsqVRmESAcuJbQtAMDpZs5aZrQAkKRf35zQdnHefqJ?=
 =?us-ascii?Q?m26rePxYrEpZbMr+f8mjOFEILe2wUSyGRcVv2IR0vvTqICXiF1dvchsMUW4e?=
 =?us-ascii?Q?ZYnTbN/T4UFZXZSf2BdmIniYcxs401bf0CR5iLgRx5t/rhr1OBj/12964YOr?=
 =?us-ascii?Q?9RzxOoL4kuicjv1TnoN5j2e9thGQAOPWk8kSVdfjoGvqSsMVPKrQhO5eYWgP?=
 =?us-ascii?Q?XMSz6+d6haOfB7QR0O18bJunJr2TItssnRFX8+f8j+N4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZGsumM2qfKCUVCLhI5bBj/8sFyS7PjmwwnZ25Y0w38RgXYK2MmNp37IWMROY?=
 =?us-ascii?Q?lETf/UAV/nk2XYy4kzApykNlc7jc+5nVE/nz2Kt+wXIGaCICpS2Td5SrQCUE?=
 =?us-ascii?Q?Sw8lt4rJA7VAcSuwYgxN522WXMlzLQidI5zQdMuIGaCuT+DJYwgd/CndmpQc?=
 =?us-ascii?Q?MHYs0SqFoEugNV547CGuVfnZhdR8TmxV4p1SoLu9u51VbafjqbBtIMiFiXcQ?=
 =?us-ascii?Q?dHu9okIyHys7fdAJgZ8AK1FVrYYJVHBQ/a20LvzszKScNp9eYg0GP5uIeduw?=
 =?us-ascii?Q?RsvDiwhc3b6DKphFGmZFprQYWo0J8TnRE0/AXISeZo7+RYR7oExE/lJo4Ghl?=
 =?us-ascii?Q?vNl8LS1QLsC9phmryYQABtd7zAEztYn9tTjswEU5VBG2GC18wgS+hGJkQBV0?=
 =?us-ascii?Q?XMKU0ylblmCsSLiJkrlX7ZXE7Z9W9pfBiSVk0qgsqfFa8P0x/8uN07mxEEdw?=
 =?us-ascii?Q?OgxI7ADjTaFw13aALXH8bt7pIQLF0WIrvQG8Tq7lxhPZLCBvt6wpFQ5oYgx/?=
 =?us-ascii?Q?DXiH/fOIUj0/ErrTIb7CIIL4MUw7I0FYIFLRvnZg7F5rPxoOUBq5THBxjRp8?=
 =?us-ascii?Q?lRQ2eQeXtAIsZlg+aAlIHaBpV1hxxah+DMJPXyBnHBykzZ7evnQZIXecuuEI?=
 =?us-ascii?Q?SQL2+1TDgozNqIO7gviNYbbOhs5gyVsStQIvc51kyg7UxOI5ktHE+BJmrIDb?=
 =?us-ascii?Q?LWjXw43GB6KdoNqithZLUPapDsvkxpy/DBsItfPmPbZk37wJ7xWqv0DeI5Jt?=
 =?us-ascii?Q?ylG7cQrAslYZH2rSjya2N3H3FKUyECu6e+vVNOKX3tEtHJ2iD0CsuOQSvqGg?=
 =?us-ascii?Q?M9hMPNifOCPLZi31XOGzCGkfdlwmp1e+KhSoyhw/iAP5AOlAIuSmlHU3EESB?=
 =?us-ascii?Q?S6slD036aRob6MbfuExEmObmjUA3lOeDq9JXSEQQ00JXSbFNzHxazBT+y+Er?=
 =?us-ascii?Q?Zzwu4u4POwPOptkw6ZWhi6BZPrEbz/gkuvLKW7s8Kb7ZwvLKn01crnzwFqth?=
 =?us-ascii?Q?skiLPWcFVXJt/SsHzJOX45SepsZtXz0ZYy6Gdb3EyfhI0uO/zIwEPh1LwsCu?=
 =?us-ascii?Q?VjvRb7fa2N3DY8V0elOlv+w4YaN0aOgik8nL4CErBM7bTX9dfxHoQkb4JVyy?=
 =?us-ascii?Q?4WZxfqgFNpVqMJHINKPS8yNAXTWPnUwHzWzRzFdJ1VYc7Ked49xtACQ7a51p?=
 =?us-ascii?Q?OZtoLaD54PzAMIIF5rQVhpbdGnBBMgImGisp+49E0Zvf/YgBGTXgSglWDh8u?=
 =?us-ascii?Q?5o3wsOf8JeaWreRqYkEi8Uz4vFZgH5qnJUeIYMKy56qBFIRgUZB2v60jLkjo?=
 =?us-ascii?Q?nsl1SPqUQreNHf5xeUeM80vMnep6G7HQ7VHlG0oNelRgoRy9b/uO3CgkwblT?=
 =?us-ascii?Q?l/k+JGwszHb4J3903yx7rdPAmHsRWYJDd3z3U7pEKZYQo8R1hNxTCOdzegeu?=
 =?us-ascii?Q?DW9e45QkL3sP9ogpo6oSETbp4vFoQd5sxU7/SVdLEl/ggUKdWdpAKxEKfFYR?=
 =?us-ascii?Q?CY4RxnXm6Fhz4iss0u5KYM7av2duQDTFWP7b3Dzvbt7spICHPpIAAAUvyAqq?=
 =?us-ascii?Q?ExqyZOogl21CtrVpsMBd89t1sDGxbu3tqmLDiuDDpZtEE9NqSIuoc6Eo65Fx?=
 =?us-ascii?Q?rsS+8K+aiSbIZv8qecpQaQvTxK2h48qAJt4FZxSNZsCwezDsjmLzRhZ1dp4u?=
 =?us-ascii?Q?PA379O4VC1b72e4hDlWJj8QJsZtVeNP8E4oFHcTQHLkVeBiTns/V+04t4eVj?=
 =?us-ascii?Q?1qeZSPgh7w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2518aa2-0e3b-4210-ca8e-08de5cbb026c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 09:12:20.7033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJFHshKhdna3QcmmeXirNybn71Qi7Terkb+a5xq9jP9T+/1l9CKTlLJib/jn4gVm4k7LDq57z7fNZvJ5mmepzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12206

The sdma script app_2_mcu needs the permission to access the peripheral
devices:

1) SDMA2 transactions are set to user-mode in this particular case.
2) This type of script doesn't use the peripheral interface (connected
directly to SPBA), but it uses the peripheral DMA interface, then the
SDMA2-issued transactions are subjected to AIPSTZ5's security-related
checks.

So need to clear the Supervisor Protect bit of SPBA2, otherwise the sdma
script can't work. As the imx-aipstz is a common driver for all aips bus,
so set default value (zero) for all opacr registers.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Changes in v2:
- refine the commit message
- remove the unneeded initialize value

 drivers/bus/imx-aipstz.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
index 5fdf377f5d06..83371e5b35a2 100644
--- a/drivers/bus/imx-aipstz.c
+++ b/drivers/bus/imx-aipstz.c
@@ -11,9 +11,19 @@
 #include <linux/regmap.h>
 
 #define IMX_AIPSTZ_MPR0 0x0
+#define IMX_AIPSTZ_OPACR0 0x40
+#define IMX_AIPSTZ_OPACR1 0x44
+#define IMX_AIPSTZ_OPACR2 0x48
+#define IMX_AIPSTZ_OPACR3 0x4c
+#define IMX_AIPSTZ_OPACR4 0x50
 
 struct imx_aipstz_config {
 	u32 mpr0;
+	u32 opacr0;
+	u32 opacr1;
+	u32 opacr2;
+	u32 opacr3;
+	u32 opacr4;
 };
 
 struct imx_aipstz_data {
@@ -24,6 +34,11 @@ struct imx_aipstz_data {
 static void imx_aipstz_apply_default(struct imx_aipstz_data *data)
 {
 	writel(data->default_cfg->mpr0, data->base + IMX_AIPSTZ_MPR0);
+	writel(data->default_cfg->opacr0, data->base + IMX_AIPSTZ_OPACR0);
+	writel(data->default_cfg->opacr1, data->base + IMX_AIPSTZ_OPACR1);
+	writel(data->default_cfg->opacr2, data->base + IMX_AIPSTZ_OPACR2);
+	writel(data->default_cfg->opacr3, data->base + IMX_AIPSTZ_OPACR3);
+	writel(data->default_cfg->opacr4, data->base + IMX_AIPSTZ_OPACR4);
 }
 
 static const struct of_device_id imx_aipstz_match_table[] = {
-- 
2.34.1

