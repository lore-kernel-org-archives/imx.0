Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE73313E34
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214770; cv=fail; b=o3E80deH/EpWFqkwCaK1JnFPCp1TtCdTbWxrm/9316OCpIHeu01x81TbDFUd73ToYdQRBs94qKx38D97zclnlx3yt1f/FIEXekjJ+D0Ma3+hd2U+TpdrWOunKP3gUmbJrBULpXwFLH8sZOAFtMeypRIntCx4LtvK0hKQDv065fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214770; c=relaxed/simple;
	bh=TTY8ATc6bfy46gB7IDZ/32F+1ntyO+o3mjU7BrmJ/Pw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pHf5IVIfI/FF2hlV5BH7Jl2MPBPksH3CtOj35hbZbXfYeaRmkZpKHfU170oUQuVf7qbxTY9n0rGp5MAKdv0dtp29TNImwUIY6KEi30vxdf5BU/87cY94HuuFTK0GRJ1bYaqElxIzg7Alk3Pj0H7EGBIMBMg5VN3V/nZ8f1zgE+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=arF4ZOR8; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="arF4ZOR8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRw0QqT+vfWFw0dLpEExgSYWhwecp+1Vj4t5MLAiokXMmfOIsVyDklQyh2mqM/PpP0XAKe8NENJ7KoCsG8bzSjm9EkOWC/qVnpMGUrunun2udov/pfGc9f68ppRiqFXB7z3Qre/1qW2TkvXQifYYjfwuhukKU8fxA7e48ttU51fpKWtkPnwqdMMSpXfjWS6VGabAo6pMKxDToQcRi0yINalmCZJUEmriagzF0p0qG6RQx3KlP7hgZAN78jAducrjnZ+8uOi3Zo++mXYLAnB1mnNOkvNgdGQfUymHAF1IRAtnMxMKfV8do8FOF/9Opm1fjyQ6r1b5f70da3quXnEADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqBZyFKoXY7JMBqfL1ych8iuPqQAmJT5z0ubFZySmt0=;
 b=npHixXxS1v39MUDKX/kboEqvaAsDWq2QqZcEsrgkA3zx95gGSjl6d4cqypeNL3KOYUCtcOkeY/8AFyRUzADAPPYQqcOKCfWv/FWDsifY9jVAEwVKFNxOj/UQ7vsfsF+cMhiSvrWPErj4+0d/i3cKwrFI1Lik3cxVY8Ag04mJaSs8EybXDrHoudHdjTbDBWCjjKhb/OnG6BeDPyVkkrREgiH0c2f0ZldCXh9qVuLZVNHr8O8lmPujvSi5h6VvKPM7hJnSOiV+sNto17VtZjLPpi9GESjBZMnzZEdKS+ZssHm69v3+Dg3mFtqE5+LZ7F/Wb/iDxZXFZGT9UGrMl3rCQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqBZyFKoXY7JMBqfL1ych8iuPqQAmJT5z0ubFZySmt0=;
 b=arF4ZOR8gDJRU53XDLxVAUbGueLa+JfMjmcNpbSyS9LgCQtTbVeMGP7RbURVhMj3qda0xh11xtX34ALTaMyg4PscDJGCEjeiqMJYqZHEHle9NEKevlX8rcUt4EiwfsLQjE3zxD2Bfvu0q6uM2CbrG3I5nIRbLjjF1wVihIn8WkzkzqMoJaQdcT6e7QAGToobwxS6ZXka0FaX+fBKgZI2yxImDTlWA3LmMlVmXyOAo2FGDXIBsRb7x+AU2jULRNNV920eU/TH1rJeivj15KdHwZAodpc0A9S6q7q2ryv2RY3HcRDpeNKrTomdbSDroO+mwSSwZkbprp4ELlr1bvbO6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by PAWPR04MB10056.eurprd04.prod.outlook.com (2603:10a6:102:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 08:32:41 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 08:32:41 +0000
From: hongxing.zhu@oss.nxp.com
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
	linux@ew.tq-group.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 2/3] arm64: dts: imx94: Avoid 32-bit pcie window system ram overlap
Date: Thu, 20 Aug 2026 16:36:19 +0800
Message-Id: <20260820083620.877251-3-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
References: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|PAWPR04MB10056:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cde7a5d-14a2-4a1e-5f20-08defe9599af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	NHdtg6Zyz38wLshXcZw6gHio3FJYKEbibZVnQgKkrn9yp0auu/NR5ZJfBcwPBb+6cyc7rxUS2Qc2yM+fzMCgye8OxHOYaw9AGlrzCR310+AyOq+Jb+r+fyLSfoLEIfymIsgibcI32JNqjETgSTzIjKeIBHciabY+zF10JLxttF0P22FJ6bPRx3iOUm3JHvAQ7WBuhN/4XMiR6BUtPe8tuPUWS0ch41Wa02Wp9zgkZYR+gtBUId+Qm+dFI3pf69C79Mdqi87OyvrmZH7E4hehux4N11FqMnRorfB8B5XClMDdtK0jyI3X5dkgUe1beH99YJe+9DK6rZHe89MXQNTiuWg8U/GOIvNNfyRup+OGuic/ir6V/x02A7CT4b2cRbnMKfqwTlv7HJ0wNOJNgRojqZzfmq53wiL3BPh8fr7q3v7dA6tNaNN8CvyJdO4/uKcyfI9YQMBa8LNMECDJFF+sTch0CPTG5l+9Hs69G8HdyWqVvzzWpHmKCEXm6TeGmbPHezGelS4lP9sLCQmBtlGbHlhV4heOYKSJlIJQIse4oHz6GGwr4uhKdkIGO1XhfO7urfh14mZspO6m5KWK+JGitm1bY1tgLxrpjxZHVYbaFZe+DvVm9mzbDJ4V2WRmlN+EYzl+xeL9IvKQ4MYDF16tpCWzwvB04ly/fxP67Sv/fx4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W/kZsmmYRYHodmeZWIwVrtjCb+HJxvdi0NEowd05414lwzmzIBbqN5JRfhTl?=
 =?us-ascii?Q?bDtBBVWRZoPphCUcQmHVLJyEPFSTqGCcydI0465EB3fLEy7ssvztyIPlyNuw?=
 =?us-ascii?Q?AdLEqJN2JU4CGILFGIqwkJReVIU388tjKsk7rhvzrHwWX9ilRARu614XcELp?=
 =?us-ascii?Q?nV2BlDq9FOVO3JZyy7urKWoaN5KVsPehutUf4HY0pK6oo+QYShjZppN9H2Ju?=
 =?us-ascii?Q?4LvdGcNZj/ga5bIsfKpSsEdXCq9RpRjsqtPJrK9bSjLFo4XrwXR2TC2g5pOi?=
 =?us-ascii?Q?HzOQJClfXkbK0iyF9dJpTHZ/ra4ifEUyi/v9oFBZwFAI4WhdqrqwqlzcWxPq?=
 =?us-ascii?Q?HZKwawWpDyaKJnzBUrb3nMGi8/FCxR9s8LSJh4OmfnZMHpoIWAO+OzA7kWYh?=
 =?us-ascii?Q?+seRbdKv5druF9K5HOPqvQR71g3UvOL3LE/qMe1fxJtL+v9T2y/MG5GM3q25?=
 =?us-ascii?Q?Hp3bkWnmIYiu/H3vOHUVujhK4oUsOUOq5JfS/E3qyquu2g4urWsDra4Og7gx?=
 =?us-ascii?Q?+FjKu34DA57mII+7DM5MknY7n58Kv0FYPbT2XgjJjC0HlaRbHqO4e1CLDgz1?=
 =?us-ascii?Q?OaUqC6EBd8alolkPrt6ysChMrSqSF5Zs43SXzMvtLu+nSmAD0j0y2ksBhfFq?=
 =?us-ascii?Q?GRmjXmufNgAzHXU/hZ6e5DVZi2Ud9rEAZs+UvnxJK8JjSXwUc2g8zre4kr9K?=
 =?us-ascii?Q?XiKkCDD9TQ+xoG8h8klbBVbyX52jC5PjXNqse/K3SZOyWXfCmauFrgljv1aa?=
 =?us-ascii?Q?zB9l6x6vMMP7is/Xviqxq8o4Z0FhVhd4dee6bTSV0LsqjEikJprzg4BJkhsD?=
 =?us-ascii?Q?maDaXf92dTkLrz/z/3e/M9lA0tZY102a93OVo+b725tTtptxnJ3xImU40hfq?=
 =?us-ascii?Q?UPVpbsTZHYg3uMV37rSh0mBHlHFAlsRaJli/u36gCGXB7SvPfRTEGOZHrVj6?=
 =?us-ascii?Q?iYU1/1kicypNQN2e2LJfXRm7KQfhzza+lyi+B5caacpe4OwkjaP1o06Z3tZU?=
 =?us-ascii?Q?agK+thXVddhv35J7N9t4/F9Ow+jKcVvxdHTtH57f6z5a0Q3BfGMmO4qXWNcG?=
 =?us-ascii?Q?sB9euAJS8itXcGol8iLjrvh697Bef58uwFAAwRo8jCGZiY7n5kJeOPDWtG2h?=
 =?us-ascii?Q?H4X8V+Y6E/sUCLanTNtqHnCT6FMqrsaVr6SlqFzYffmHRGC8haUiaHpKaWG/?=
 =?us-ascii?Q?GiIqLa3kzElh4cQbirk/EXInwHPBDHp1JlCLwJIJVVIC0Kktxkn++aadVG7L?=
 =?us-ascii?Q?m0OORWredPRoZZXQ8SHSdT6qc3YlrLEsL57jBbVe46X5jFO9hLxkjDcbJDwD?=
 =?us-ascii?Q?0QUcfOxIG8PjmtIB+owOtLUwrGvclwnems50YhQROnuPfvA0YD1zAKwgysot?=
 =?us-ascii?Q?KhXx4x5Ff+Xd071dsTcxC7Y8Qy5f4+cm6br1l871cTGxevHKf+TfIfYszKo/?=
 =?us-ascii?Q?4rPzo8i5WGRBBE0yUFh9nfPb1i/po7XmIc1EIb+Rtw29W2w1IRGIjByHX1i7?=
 =?us-ascii?Q?Q5Bxl31eFV9JCYeiLzXmWhAEUFZdlWOSZlGLww468LqiyaFEvTqIjgu22H/k?=
 =?us-ascii?Q?WLYAi1jO23V1ACcd8FRkOREA/pniAerFviy6Ad9mlJHwlcV5JCw4oqjVc+DB?=
 =?us-ascii?Q?2HhrmuyzoD0GL+/4MVWtgsTuKkrOm2L9BGjgdubhe8HtU3kWQx1Raa4ct0I+?=
 =?us-ascii?Q?nWSBx7nMT8uRx+tnX9NFd0ZujDHpajpwUNuUP5S/iGT2MmhfOJ4cgw1n7ZQx?=
 =?us-ascii?Q?9Aewwi9dFRSN6lEeqO522QEuKyw4lvvGwhN3saEw0ravRNmZ1laI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cde7a5d-14a2-4a1e-5f20-08defe9599af
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:32:41.6417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4isU5zr29Cr9iUcDIujEJfB1HYRvjAl0KoFRr9pIUYBjb1DilR6XHJUxWQEUtXyEq48fn8rOfScfvG3jgBCoItil1S/ET3UqUvixOjsUAsGsy6YMcIetZbByxZ2nnC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10056

From: Richard Zhu <hongxing.zhu@nxp.com>

Move the PCIe non-prefetchable memory CPU address from 0xe0000000
to 0x10000000 to avoid overlap with DRAM. The 0x10000000 range is
reserved and safe to use.

Fixes: ffccbd6804e88 ("arm64: dts: imx94: Correct PCIe outbound address space configuration")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 34833e62bd796..afaaf70417d23 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1379,7 +1379,7 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
-				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
+				 <0x82000000 0x0 0x10000000 0x9 0xe0000000 0x0 0x10000000>,
 				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
-- 
2.34.1

