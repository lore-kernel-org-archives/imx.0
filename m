Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9D736E495
	for <imx@lists.linux.dev>; Wed, 20 May 2026 03:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779249288; cv=fail; b=Wvw8gG6Q9LmfexJLYOu2sGBIPRgY64wxOCJlJu/qf5USGhWDu4XNdJbsGp9s1hSRckVlJRhBTBwVYAci9Y0l50K4UifXf8lcJZrTfDKhyX2Mzks/vWfj588I2v6DL5GGxwop3AsUneklGJWAXbsxXyxaVg4/plwjUDSxtwdjU0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779249288; c=relaxed/simple;
	bh=p4zIQOy74fzgEk1GtyrKaAEcWP0JS02ITVDyFebXbFI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=C37/8/FsAf7FrEmPTM3VOJ5dinilalGs5/3TomM+B6gkckNEYND/6tbqXSPlWbrHxMSTRUPRrFRxMMIiBErbZei+m5PWwd4ap54p3M0jTWiX6/ILMcYbq2MR1J3axlduogFWanaK3q3MOGooOsnQS6JtfesHCpIKGSPasuj3UQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c1tJSI/y; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c1tJSI/y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxg0FtsgyjRb2iYarZqXCuZZOmYLUONPbsK8B7MOcl5fmVK/qmJi2/oVui65KCxaBBoPjZ+yKoU+zgetB+WYB/XiSxlTOxZ2bBFCxIY16i7sU60xwC9E4+Xe9gNcR8LxLbRyLl1lIIqVT6OQBClZvWFiIEWaPFSY9hip+Bc21J4eKDjbr+x5ZZebJhu6Abcpvd0WnZRGnRVyJsrG2yqNxH9lXqTp95K/blJTXc/m6H/BMisASz/vSQ+1c2avgDeFmH0ACbxEci6E1job8I7FsTOZEuCcrS1UOoZqvnALuTUivDL5WsURgq7fuQiPOhx10g8D0eRcGNyP/WgoaDHfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apV6riWvm/LU/wsRb1202dezb87cxPgojdnNu8Ia684=;
 b=iXQ84K8hbaxSBVh/Qla3Sui9KPC76lhx3BoRr7ZMWtN4OuIwLHmQTY/FGbBm1CxPAa4rOp327wL7KDQMvrjHNPHTMBG/2ICYEzStRllNXfqllNQwygcBFefMN1OoQP/OtgRb7m1WY390GB3dmwY5wNd276ZoDevytcfxtnTSpmX+RdaJoiTNbkgYba5wEhXa1iLiZDn/Q0XHZEKZwFTWp9o2QHuPiMsO2riCGvtnVjnMgHzYhyI6hRUu+NNRB6ie55kdIRueouPtgXGyPhZO+PE/KyOJnloNTaQp8q2ZBa7eZ3O/mxKcek6+NUBQm2wExptqrIF7FsHiXHxSShYhPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apV6riWvm/LU/wsRb1202dezb87cxPgojdnNu8Ia684=;
 b=c1tJSI/y7qRoKN10ndJz8cEmZLnXk1fKJH1ga6QSdIFJ+b7Jhbt0tnOIfd/bZ3Kb2WCEirVq7fMmCEmCcHIFAPiuAEZlB8tpY3vpew9sJ9dgKDwsPNKIpWMM2a3C2L3oG4Hw1GhZBhu63M/Axs/9922QCRVh1jPc+8d/7sYB7C9WGXLZiurPT2XL9e2yvC8P9GecBLzxXn8COZAtk9guzKogRerKhHc0ySVKfuK35Ibz92e6v1CunoTeluLLa6rVI4nUWsNNZm5KwIn0X8xLwZ5n1Vu+e6JN2xdq7Eex0d2tPAhtDB9pBqt+5q75uZ8jnT852wyv/K4aZ5V5TDG+xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by PA4PR04MB7998.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 03:54:40 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 03:54:40 +0000
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
Subject: [PATCH v7] arm64: dts: imx95: Correct PCIe outbound address space configuration
Date: Wed, 20 May 2026 11:56:42 +0800
Message-Id: <20260520035642.2207511-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::12) To GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|PA4PR04MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b16c0d-01ac-4153-0a43-08deb62384df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|52116014|7416014|1800799024|38350700014|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	VW3hwOmWG5TkUA6JMJn27Eg72SESw4NEn4/eiEh+wVod4pkBSNflCUoaBlnPoyVcNAl8Wq3L8wuUguPNbiUsy1e9GcHQIpPAmzfj83wUY/8PH1b5H2Qo4TELX/iQVvQtnTStumKABX5rarBimVZqwKiWTYaw4vaj/+X0XvO/09ybmOgrRJih/yUD0sAEJzvqHVYQTPQcWuCdlxNvj93YtUKDlmGBPjkh+ZzOcwt1PPLcXNP1xpzYpCzGhekN3K8L+cKBy5+GL7/4C0dq+1eYtSKdWomEq8nx6V2ElMGLohheNUKQqWdJsP+04OI52b+X313qVbCw0POr5LlGdoYqA2oCqcBpf4wRsh/KHYRLnb4kSX/v+tIBalW22p39whNAi75XHPNnX+AuwqIBylgo0mM1rEu58s8625PtLVh5bkXsO6IvLw3+0aJrdrZspnJyhDzhriehUh6e3y3McCVnOFTHYQOXRHrEmH+e/nbs27dkVo89b46Uvas7B6fnXxXTTpLLNpRYOrcGFLTrfzUj4/AKyJp3rqrFxiOn+7JakI36kYGZlY6U6ydk2kdUKBoRvzaxNksog1c53qTcOKvx+PhO5Xbska0zCKvHsVJZVH4lz8JimAAnZGFOylYPIUS0e2PVP9NVVsjyHeerK5/ibcfL6gx2Amfdo+ECN9bqVAcOvHnxlL9bLxhd2xEX5Bm4Ns3Lhsubwnx+DKUtEc86WA+UllpUS5fBudl8MxMu4AHi9dxTmFAZPz7Qr2qtJ214
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(7416014)(1800799024)(38350700014)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/KbDLDfMnDdvT7fqXEgtyrHlVAlKaEohgS57n8NOMHJW/wnU15G5wDLEEo+?=
 =?us-ascii?Q?uDKDNg2XLOH/UY26BBzcNB3r5OttYdnvW4Dh1jDAFniLQdvuO/A+DEk/h7XT?=
 =?us-ascii?Q?aRIjcSV/QM8lz/YsA9D7b/JtQ92Sbkr+TzXoA+EwPqfukl9ppz6quUFciIVf?=
 =?us-ascii?Q?1Nmk4lsHOgUxSJbEqngnsikIUUyi1PZcQYdgpObScW6SUybgi3xel7F9EQ6C?=
 =?us-ascii?Q?iALz5lvZ3AsILiEbY8CDkh5olovmlTHNze46XNkFx1x92hpNq828+BfBsYrZ?=
 =?us-ascii?Q?4GNsIVV5SOjf8bXE7hdAy5fAs2lICnRSBgwPBmNCAQFPoEMeA3woPqEfIuWL?=
 =?us-ascii?Q?X47QEPKOyFJxtvvVCQ3XUtPpaaGTS/Dyh6MxkAALhXmG2GMS4CusFGTkGRDJ?=
 =?us-ascii?Q?9VwyXCycl/vFg8m1DxShhVv1lVb3VtI+71SVHpovm3oEEFIFkzZk/9nNTDb1?=
 =?us-ascii?Q?n6CucuH1ZYMlWa3MhMw2o0QFVn492kGRmTublhzGx0VMUIH4LxpLiurTZJOV?=
 =?us-ascii?Q?vdzUDR4/D8g4U5zOtdv67D9aHBO5pCKEoPuJ2jChJ3pLFdyx7NYRvlBnzE9r?=
 =?us-ascii?Q?+NXlcyEtKehgKjf6BCW7E54KuU7rqV6HOFTVG+0b49ADXa4YZb1P8uwB3zL/?=
 =?us-ascii?Q?3pX6AnVDXN2LkpfbbgfWNqSI4mscTYuHHJLO7EB0oXMUoGnX6YstEwqf2p1L?=
 =?us-ascii?Q?+uM0nwPa2VsgKStUrW0pElbWNCjqeqReXBvd5PP0zQI1rM2IdSaTdm7IGbyb?=
 =?us-ascii?Q?nm5Dq5RHXQeZiPhvJXYIZn2dNs/5dkzKNDF04muTrsA23MnRUknvkHKLROaw?=
 =?us-ascii?Q?95g/orOikBe18R5xJdER1ptrhA5QsRZcS/5r/Wv/yZlWE7+zciAEJlUefHWI?=
 =?us-ascii?Q?LES2Ti1QMtvN2lqSys3wWj+gb1oH1I/iZUwPQO+SVqsrS1dYKUJc/Pxu0j4m?=
 =?us-ascii?Q?n7YAQVaepY/hvlVBSMtdOjH4QZkHF83O05gB5d/Q6WCcBwDTxFtTHQiXTLB5?=
 =?us-ascii?Q?RoNX2CYajIAUNwq2/IPH4d5IGTaIXeyipZtD/xM/X55BYNbtyfORze3xcbWP?=
 =?us-ascii?Q?BPEBm6jIhvNlxoj9tTmhnGQ3S3rO/5XHl+nVPg6CGNRwGLj5rA0jfF/DbjAU?=
 =?us-ascii?Q?gpoP9GXEIVFFd9FLUfMZ3ml5B3w2+w10QpqhiuSv9xcBtTf3QBtHAel1jUvt?=
 =?us-ascii?Q?C+2yqIXX+wWkcLk/S7/Su7UZkqqswNmc7AYQ2A7IwWz51xbMH7L69i+cbEfo?=
 =?us-ascii?Q?W/I3utzv2VwFBLACg7fPUvDvEU6wrECTEo3uLmAMR3SpnoasXtUKMj2gW5tZ?=
 =?us-ascii?Q?lPdZ83h9Hn4qQu0Vhf3fF+gBJIp5i1o1ZudQ+sO6ya+PN7JoiPXXWKYD3+I+?=
 =?us-ascii?Q?DKEPvcyKikqOmiGdhnXG4/edKgIk0+I6QWZqLGakY0RwQ8w4NTdYCylJ99Wl?=
 =?us-ascii?Q?l175+JT+RqYrqyBYSn02w0YKnvuRiJbXYv7TlTt3IfqjiOR89sNZ12OeDQGT?=
 =?us-ascii?Q?U75GiGaw59sewYRjLehYiaek6Yctsi0oxMJTwDxU7MBzjr1AJvobX27NQ05d?=
 =?us-ascii?Q?k3mAoFuh2+MzRndWEwS1n9Mmcewl/B6f0euOndxHXxYWfoOpOLH2fUg3s6e6?=
 =?us-ascii?Q?DpmtrzGk012JY1oxHFltxoTalE/EAoZlu+x7nLvjbC1xwniGfkEpEg59CSGc?=
 =?us-ascii?Q?TczdSHFeSAmxn1xUwPJsoQZyhmAgohuCzNuiQiRacxQBFgunR+VqgGiMl4K6?=
 =?us-ascii?Q?wLrZIEIPOQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b16c0d-01ac-4153-0a43-08deb62384df
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:54:40.5151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCbtTiG1hPKMP0eBxe1MUUNaZDG8ian2ovxA6MKCsQVdgmWjI/6bzV7zP8doqKLYbBUio9RxtjexkrozYo8Xdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7998

Fix the PCIe outbound memory ranges for both pcie0 and pcie1
controllers on i.MX95.

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

Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
---
Changes in v6:
- Map the large outbound window into 64-bit PCI address, to eliminate both
the inbound DMA routing conflict and the IOVA exhaustion problem.

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
index adcc0e1d3696..d776cd350c4b 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1939,8 +1939,9 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c360000 0 0x10000>,
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
-			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
-				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
+			ranges = <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
+				 <0x82000000 0x0 0x00000000 0x9 0xe0000000 0x0 0x10000000>,
+				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -2014,8 +2015,9 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3e0000 0 0x10000>,
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
-			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
-				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
+			ranges = <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
+				 <0x82000000 0x0 0x00000000 0xa 0xe0000000 0x0 0x10000000>,
+				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
-- 
2.37.1

