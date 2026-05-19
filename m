Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A918D30E838
	for <imx@lists.linux.dev>; Tue, 19 May 2026 02:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157219; cv=fail; b=FzLge6LwHdjblQAj2niooBLeDk9UDcoQCkxbDR2NamfRiGWzhvoopiRJInCW9yfev3TTi/qXnW22o2hwoDVqJUudoUhEBx6AHD51WU8EiQyzBB2HZc6jj0+aV0W7XS6LktClpiiUJ6yaFchM3oAXA4Cby+63Jlug3OF90gAxjDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157219; c=relaxed/simple;
	bh=WmfU0Nes2LynEjGkOLMP40tRii+XnaRR1CU4cx9GoAM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fe8wJEuVMpLcA9DIKzb9usHpTgLeWn1LqvN4BBSJ/fGF3dhjg9lK4yrboa8pLtmYe6/raK88cI1DSbmxTdICLbpQ/yGsM3aXzzRrTJu1JKU75AQTKpFQWe/FcWQ/NV/uE9OFZVlyPiP/C2rShgk6zTlLVsJtiYuz6gPF0Rc37OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l5F14lkP; arc=fail smtp.client-ip=52.101.69.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l5F14lkP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmmfkWzsXEi6uR6A7BhptjFBYlNh9et2W05CC56DfNuKLOB6E/r9jScPcvo1cQv6BzCf8eJXatcSuUnY+v3IJo0hW1txpdxwqtQejEEgdl3aIv9LiXp1jpeddKb9LrLNjMEt6XJOY8RjnUWljVVZAx62fQp3vkw465BRWxkA73HuuQa+lSAVw8HTdB/lcJGO4B/QlaFVXFceY9/YbyKrR2qqO3tbl3vmeJo0A6JZ/VlyjJl7teCjb9pDoBdPy2JJ8C5MWEl+HgoZ9Z78g1/5qUirqJp47n1ozOP1gS7TEZBe7+7XlSjfOAv6j3lz+Mh4yj37Tydz4eKeXFJhrvjE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMcFSGdey+AVH2PmztZ7EqIsVRm+rNBNJ0J+9fY3wZ4=;
 b=VWnxHjEXr08FtP07mejW9yWeQsA6l2vcAbSJFTwqzewwdqBVIZLmAGqgY/zTogDtZq5/4YpXlLSZ/wGEdoLz/+vRbwuVdYweosW0R4nyTz4a+jXIgUUab50bI/nyaq6PGUjzP4ziNGSiBK1oVzxsRwIg1YOost4XOomjEbGL2h2wZ3kL675UQGOgzo5qGvdiJ09BfjWFPhO8MJZM4a/n99+tV/BZ9c5qQGtGRALModBTuDwqaqbphTtmAEKgT++LqwsCug2CqlyMwk1Q/fAeHvOphucHO/kNzQ2mWSddej3iI+FjHd5BP7LdfjTcqDJiZ6aZC+nCAj3ZhT3QCtsSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMcFSGdey+AVH2PmztZ7EqIsVRm+rNBNJ0J+9fY3wZ4=;
 b=l5F14lkPtT1s2DSZxdYZWfqJaEjWES4ahLQvxeF9NBxmsZ8huxO9TiB31HlgqDrshJIfpE9Hv7NyvBcNstQodPImdL9HFpOF3jmfZJS9bQ6xgfZShMEtQyr5FiaNMDTQSbviiYhnhxeVTGw9IpOHUTbPhF2yJn+cgqqBF6HXnR6oUeGIGi+vc9PIzJJ+7jX+iMfOaQxgQdVPpC0xDnczStrlWzd/wNXaVj36/u6ImJrcgWQ9dB1XbgJp+tcbPM2uKZDiXFMtBruTqDShcEZB+eAb+94D9kVbE9/S7v3b9OzzsE+U1ouxKUZvIjC2iF6bCmanJO5OUetzLHkJDw0DuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by DB5PR04MB12203.eurprd04.prod.outlook.com
 (2603:10a6:10:64b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 02:20:13 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:20:13 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
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
Subject: [PATCH v5] arm64: dts: imx95: Correct PCIe outbound address space configuration
Date: Tue, 19 May 2026 10:22:20 +0800
Message-Id: <20260519022220.57686-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::33)
 To GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|DB5PR04MB12203:EE_
X-MS-Office365-Filtering-Correlation-Id: fde1485d-3f97-45cb-e5a5-08deb54d28d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|1800799024|366016|38350700014|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	otYJcY2/QfbfFHXQ5a+3ofJeVE8X2IKFLoHVeaqR26StHKibHgMjWIxEA32PBoDdFN7Ef5f3PPfLHMZ1fOASLNcQ9+2d7xAUQPiO5Yll1rJyj6YmfLXyZ1VM20ldNNRXNnBY+qb0zTP5+26GeJ6nG4csZooUH8Xg5YGKNQc3Y+RsFApJnsffOe8FEKzSARWZZlRHT0dLNxRPsva3fp8ECOlDfTYvP3PIOeFHI7wHPOyRLyv8I7zW3Fb4ntxloi9FzWBiLZkj+aD2WjIZGr9lw8JBYGtY1EoLaWYGBSm3j+T9vZUmv9IFD0SMI/XlOzx8NUmog+M49vtFpvQcIJO/W6rfaJNFdDFJas4FrGOSOalSOcXs6ahtZmAy9uaiY3u04hNHdGm2VBk0JV8tIBQh/uKT5m8QPEWCo5GynwHb35S+R60Xqp5Jl9npXP/DedgTHAxY3rKEVM3qryKjqt/1BkMvExX1aLy8zHRuYGNxAcdeUtAKPdfQaHwPJgcBwzMew1lEB6ULLIdipJL67HPOkh/fEe6ZXbSN/m2fXLVmVNRcpmYRegv3H+gc2iywJf9vpz6KK1IzKa45spnPW5nySv3J56peR4ec/ANquoin+zo6qoDsn82LhyBg1FGbiQ6uz0fkklJmxf08Vajn/d1sdAXQRQl5MiHXGGSkN5VYgbiBEcITznJAk90oBJ9CwC8G/nBMi+mrA9yTCF3/AvECIHiIZ2lHqO8V7XpFWLzgI5rKwCC52Twp6Q996I6eAN0F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ckpBsxgo5wrc717EGJl15runOGKLN895KG7t5/ox+MBNHMlV5MhrxtknKjz?=
 =?us-ascii?Q?RbinUxTAz7/3GuWAEhOKDfol++Gu8+NqOrsHUWG4enLncIvcbSoU6lYbI8iz?=
 =?us-ascii?Q?Whnal74W45ST8DMS3Mw3WR8XHK+rlN/H5LUOv4QrvGxYltv41EQH8anxXP/T?=
 =?us-ascii?Q?1wm3oETN1YOnGP9wUNlHNQoW7QzPAiUO9FE4YXt+5xOn1DvKtL4r21fF4BID?=
 =?us-ascii?Q?KbuknO6ItZRBGC4EeFLtTt93pEb3ZMIFKhCklbIVUMc9M9FVXnpgJl2fjkd2?=
 =?us-ascii?Q?6XnWYivWB5Coa1MxRXZSLKIbI2FVQxNvZX1M6liU1t0ZE40nyBGG7PXFNt8B?=
 =?us-ascii?Q?IPudWgsWIIXtpm4hXLLUudGwarInCCCw+VKTsU2zOiKl4IdQWEDPAMXIbvUe?=
 =?us-ascii?Q?YlcyWffu4+aAPN48TdUi5gYRcUwPuEiP/TRLkcvug1v+4CEkX9a3XNsRrICJ?=
 =?us-ascii?Q?D4LRLYDJ4O03iAJt84W9sGV/C038/g8FdEUTsJ1IyWuTaxuw8s9r9SBwPmPK?=
 =?us-ascii?Q?cXSe1nJe2ipKwoPiUrAFoI6KbILleAu5Vws2saDzX5x6m+ecSaenvnOk/pXC?=
 =?us-ascii?Q?/dIogRwFtwQ7K1KEQEzKrzBEYMDUKjHPRVlOqa2DuduYLK4isYKI1IF94Ibu?=
 =?us-ascii?Q?uXGQTkU/Pho0oOHytIRRbMfkdb6Vpc8YpWrXTan3wFxQ3KT7qh3gLd2TPoQZ?=
 =?us-ascii?Q?vJxIE/PJH3FdLaNo5GGrCLKaOpok0AHMEI3IMpw/qQd2bSzJ/eSi8hOogyiY?=
 =?us-ascii?Q?nIJSdUGb/RN5oziQv/zicbX8K3hNpTLV5a0YnMN9vmBJdF8wELI0ItpJAC6r?=
 =?us-ascii?Q?OKN69LSzH7iVbilcFGBRT3ktYFAReSwqd3yLI4PFisx1ZnJteIbNAflducIe?=
 =?us-ascii?Q?foaDRtDi/mKci9wr6A3Oom+kygjPrvltczDQ9fRibhzr7Cue7zmDPU7qLkgq?=
 =?us-ascii?Q?xjatj8LIwve/dbIW18PmL/vTv3CUt6D18dm2ofAdaTJoZ4VhqMb/EChFOKXq?=
 =?us-ascii?Q?sDtHnkUPb5vzH8uwC7Hc4Tm4BXtHSJj2edcQaw5ZjZMbSA16cOeQ18KzaXNk?=
 =?us-ascii?Q?X7HEhLgYtRV3U/ROlIE1+XhC6K+PCbb3lijm0MCpNq5mZf9c2scd6yHFqbWt?=
 =?us-ascii?Q?tUNwE59B3V0cdqzAus8vO5mbDjczh+ukm8BgIchCXDy2Mm47DhlVxzS9r9fP?=
 =?us-ascii?Q?zaA6PRwbc3Kt8LFBnll+6ZlWHkex9HfrVxKxOGYd5Iofa/VayQP0iLhGuKSp?=
 =?us-ascii?Q?wBbB3Q3BeGvbzjDVQrYLnwY1eYatybDAgczYHMsilEwXZzASrLUwu648nIzh?=
 =?us-ascii?Q?7HmwgNy4e3OLH99CrYA6mUmA875v4w79BdLWhfH/xEBJC0XlaB5nsfFtufR1?=
 =?us-ascii?Q?cb7K50cah8iw30QWgg9FXcfoZdOIpuP3VlZKG/tjvEtyMGOvXz4Sq9LSYaLW?=
 =?us-ascii?Q?WlJUP3ts8J48le3unStt/cg1k+d3MHSYfALklRtX1Lu4sc2fU1ntC4Bac+Gj?=
 =?us-ascii?Q?rdm5jL/Nq1QoJY12+Mkzt4FrwzlJfbNRr2BnTyAetp+I3D5iXPiqL4JEzGfq?=
 =?us-ascii?Q?gdQyGcbzO9puCMZHgf+Dv9wm+TfyUlfaH6mjTE5wqlLL7lk6y+xZ38Qjwqmj?=
 =?us-ascii?Q?dBrQjxEYbM47bf2fPp06v49YY4ueRbDInKjzQq5lrjpPwtq7+IKM0oFPaW29?=
 =?us-ascii?Q?akz1fVLQDUMOKnx0v7Lamq/eqJAZp6Dgpj8t+zzlWAnQ8fgTnFyMy+51sTXR?=
 =?us-ascii?Q?mi/eblx2yg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde1485d-3f97-45cb-e5a5-08deb54d28d5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 02:20:13.6920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Xu87UjkCJAzqljWlN1pN6MWgpoD/bYwcHPcrzw1eVg7lFf1oHwoeNNDUNr6V4x0tCNAeAwKne2/bGVWNtCAUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB12203

Fix the PCIe outbound memory ranges for both pcie0 and pcie1
controllers on i.MX95.

The memory window size was incorrectly set to 256MB during initial
bring-up, but the hardware supports up to 4GB of outbound address space
per controller. Expand the memory region from 256MB (0x10000000) to
~3840MB (0xf0000000), starting at the base of each controller's
assigned CPU address range (0x9_00000000 for pcie0, 0xa_00000000 for
pcie1).

Additionally, ECAM cannot be mapped as I/O space. Use a memory region
to map the I/O space instead, and relocate the 1MB I/O region to
immediately follow the memory region at offset 0xf0000000 within each
window.

Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
---
Changes in v5:
- Expand the outbound address space from 256MB to 3840MB, starting at the
base of each controller's assigned CPU address range.
- Use a memory region to map the I/O space.

Changes in v4:
Update the flag from 0x82000000 to 0x83000000 to declare a 64-bit PCI space.

Changes in v3:
Update the commit message, and set the region size to the max hardware-supported memory space 4G.

Changes in v2:
Add the Fixes tag, and rebase to latest imx/dt64 branch.

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index adcc0e1d3696..c43f2bec99d0 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1939,8 +1939,8 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c360000 0 0x10000>,
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
-			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
-				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
+			ranges = <0x82000000 0x0 0x00000000 0x9 0x00000000 0x0 0xf0000000>,
+				 <0x81000000 0x0 0xf0000000 0x9 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -2014,8 +2014,8 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3e0000 0 0x10000>,
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
-			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
-				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
+			ranges = <0x82000000 0x0 0x00000000 0xa 0x00000000 0x0 0xf0000000>,
+				 <0x81000000 0x0 0xf0000000 0xa 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";

base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
-- 
2.37.1

