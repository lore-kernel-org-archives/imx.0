Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440AE255F52
	for <imx@lists.linux.dev>; Mon, 11 May 2026 03:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468749; cv=fail; b=swTKUJLKEv0HxHKsgYh43YhgvRYj+AkSRrcLPUjoOvRlPGWOHp2g/azjbkeK4ud/sKgQ3Tss7o0VpKl4y4yCWX0WJIh36LLbTWZdUvXvyCilYIzlnlQpYggfynHLqe+FUrJGVkL+4nyrg/STtZXP9Ef9V27w5X841L+9upI7sfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468749; c=relaxed/simple;
	bh=/GfT59CWTvtfKPlx2qGv4bIrZQQTwN0w32myeFaro4A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Lusih39Cb8hPzpk3Kx0u4+1yEMIE/GrDIkD2mGkpJGMliOAwTn6pjvPZGBSE+cp0PL3uVqUKnbkOz7BUqZe+vI4KURTiVDKuDXSzjyShn79xugPqh3jUrpGEwfiN/oxUX3pVpD2781Y9NoBmhaw06tWnFE7dJjmr40/nEevIsow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F7ymw4I1; arc=fail smtp.client-ip=40.107.159.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F7ymw4I1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEWcIorsLH98OifYlGOdgh2f8rW/ALwx6uLlBziO0UOyj3UHomiUNvwbKVtxGfjTBCLikF2kSX0y2GrbXLnwtRRFlvxM3rxwgWN31Kb43iHevgOxpZPJsDrWHnELHywcJ31ZDwrJuBLyAISPY7GMYNIOSueQq6aJ7IyDZ2tTlXtAXJqxHbLFoqYq/j4g+kS3tSAIw+pCWVme3Lw4ei8fdFm3wFvFAUjFriMWFJ8jgPVnYhZk5QfCVILCKSUzSeXC2GYe4mitQvY56MGC4eCfGi0cg8CdXX7BbaWfOtm+cSpn+0Tqe4eXt4xkTGslwGMegCRT27vp3fxz4t3gN4Sg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJZ6bcJuCYnwzFburPRzS0zjaab02t8JOX9KxYGNQg0=;
 b=wtpaFYk96QSaEtqeowr9jcmo2IJxP6zu4ik5ffyAYyfZ4c8B9swZJvITA+o/TfgtmgE5RM1zAetyYYG8gX39lg2ZgBm7dBh5JNbEchG1VBlINJrktAdX89VKV1uwfYUjIdNOlV7JB5oCPGgqtV/3CaLmogEr0DLNanFT+U4AKCXkEqC2ffDgbRR5LX7ItOCg/jKWStAQOAYHvxr6p+nrOwir+1TLU9hHqK1EENNs/VB0PJ7JYnjf7PHd9p6AYbeuHv2Emt3CTSQuD9eBsJe0L/xPz21W+9ZA871wOMBal/8zkM//DL7qbBX63/CbQj5fq1UMJWY3R3ogdRPqE/Fvyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJZ6bcJuCYnwzFburPRzS0zjaab02t8JOX9KxYGNQg0=;
 b=F7ymw4I17yrwkTkdugaasA+HDpxKIvldsUz+mLSP4B3xlYM5AvzCGco8XUmRcViZg7Y/jzqC+5ao+weEfgYLxv0Si3CmKhODwJa1jPbWlNkHvd+rZ0V6B3ouz/ASfYU98nhgbKHh65uDqBRuSgTutXElLGkTspck6DaMno8iuczEeH0C3iHb4LRwhgX6deqeFqdw63SueOZhAgK2LkoX8hF3aU9dpkeZ+ZE6TsNRE3Rjah0IpxY4ph/8MMVu3hS5sQPkdEA14cSdMEKJ/f4XPKlHMTwXwDR3/WoGttzX+ynfo1pwpKHH9MMfoku6s+AAEqZdVGRhI3VI2WmxwWWpJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by PA1PR04MB10502.eurprd04.prod.outlook.com
 (2603:10a6:102:44f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 03:05:44 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 03:05:44 +0000
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
Subject: [PATCH v3] arm64: dts: imx95: Increase PCIe outbound address space to 4GB
Date: Mon, 11 May 2026 11:07:51 +0800
Message-Id: <20260511030751.3717935-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|PA1PR04MB10502:EE_
X-MS-Office365-Filtering-Correlation-Id: 63cfa3d6-a15d-4a0a-cf83-08deaf0a30ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|52116014|376014|1800799024|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	BSJvSo9Br+BWUBbnG94SH2ntLDWHVlfnpf6rKlFB6TpljAg0pv0wwkPmE4SODMiMT/x5Gq+plB1Y4VsBfWxaVl2ERA8GzHdMp1VHRxHEor1qpHIAljy4CTuIiycy7esgWeZMDYMIFOZSuiacbhnd427mMQ/Bx6sNHeuoQez94Rg5Kx1yYmwO9UZcARQF7211tL6vrkffxh8JBxrYByyE94K+A3/acxGTkhmpNhxe1s4JSTIK3MEGUy0oqIr5c8bwuHItmk8GRAsBC30DsgAGkYCxt1QJzp+LqAJQAcoW7qVrWNvMpaiZ2A33G7aoDGZBENjW1c+uVyUEgKrFt4Tbt8fUYCJrBr0EtT0IecSlpxFBQfqkvGKrFqo9Zzoy4ZUkyi11+owrHOYPK2hqPYlSBq1Cib76AvdWYuKDmoyA4rHn3/MYYCBHBV1rYE/OrK+P/rmzybtR5sqyU5LUjfRcW9geb9P7+x5bQgZM1AbpKDG0HklsbxCNxIPCxdcH3s5K5KHyvijUd9gOpogNQvaqJOrf+eh7tSIZW96LonxSItSyb/1a+Jx+osie8dvIh/U3Ham60cOxKqgPh/mLc3LIXZD5j+MjDYGTjI+RaNPYB0ECqcCto755GfAboHP6ejgP+Tvspp6BqzX+OZBPZF+82vYySTB26QNbpqa6A4K2o/1Z7gVgwfBrCdmxy+4c+DpyzehDSiS9Qu6Gfg2utlRHGeIPWUknwE+DRFs+22dL0nBWxb0LddX5/9SW5P5jaa12
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(52116014)(376014)(1800799024)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r8KOJIGQsQaBbhaK3Vjg6WP1pnHmrSg2O4W9HV5AA/HULCsMoYa0PoJXEnmH?=
 =?us-ascii?Q?TuXukvilIXIGWlon+yPcJt8EsryAOxpkTYEGtacyOUmIe/BAPhWGO+Za3czJ?=
 =?us-ascii?Q?QEwB4xY9t3AL1dz8VIaE0+b8/r31KoG9BpleRvt8On4DlnESClFoIkbcyPG8?=
 =?us-ascii?Q?W5kccs1AUJ7yGSD6ToE4Mq9Q7SZqg9GzAsJwhsRI1omQ9oU9mf8ka9wyak/m?=
 =?us-ascii?Q?/tBF81H6nV0gKBGmJUBt1Jd/VeKkdYwvQV3rFAVMQ80Rtk1/uigK9UsBInBq?=
 =?us-ascii?Q?nv6yQAfc6Fiy7E4hfnaM/8N9wEqwPVIz7dgY8H+JB9zttafE3iRaQ6lBL41s?=
 =?us-ascii?Q?LVcUnBQn7qT39MHaC93ahL0BQmA+7LJIuYuTcQbKtRU8V5ZVFq5clwhwW+68?=
 =?us-ascii?Q?UsRMjNuXRkSyMHa8h4vYojXrXdFOpntqMdEfu2QtKHxCD2AoBNbVVV9j7o03?=
 =?us-ascii?Q?toV8towdNy1qguyl2GW8lFS7ycFVDDJaks+WTnPMMa8HgaPhN3ULk8U4OLC4?=
 =?us-ascii?Q?ZR9iZB3j1J2a3uTcWghp+wYOQdbUZ2qy6IXcVw7/d6WyRdkXu6lFuXtNnIAR?=
 =?us-ascii?Q?7SUGYLX3QgN23b3+hx1SASEkFuzpFe/YyZFChMAVIMEVYxmi4fV1cRNEeuI8?=
 =?us-ascii?Q?/30jzdB50se2K3bEOuRRfR8ChJtw1VumwtB3+sNujwgon968iGfYDwYc73js?=
 =?us-ascii?Q?y2+DYuwN5vsskAM8Dr6MU+4z7YJrqFpxGUzhZ7CR4LJC/moJK8l2uwZrb66d?=
 =?us-ascii?Q?MaD2voTtnUPO2Mi0T1JEZNqB6GxgOJadbjPzlAQJtiTaF0VvPxpPsgbE8Tza?=
 =?us-ascii?Q?0cBh+ABzIKbcDN8oBeah/vhgfyITOWASPK8C4WlqoAy1lvBb9Hgv0w8sbsb/?=
 =?us-ascii?Q?NAUhtrmp+PioY5+5gYGtt3dKtufpLycO0Xqgu9NJ3olUqXPUhSWQ5buCSqeJ?=
 =?us-ascii?Q?wpdlK33heOm9c9VdrDnTe1fvNCMBfT3zPyT5vh9xGst3mj9cEU1qtuiEyt2q?=
 =?us-ascii?Q?rJGmjZsVV22iQcsCY88tsmRmWY0UgAYR3Yw2TX/+4zIxS60gaL4k30I0ZKn2?=
 =?us-ascii?Q?4AO6nxHu3lQ9g3SCMK+7Efg1xlrk4k0qqTwYdpC8GjO3TKIJ7F4X+wUHq7k9?=
 =?us-ascii?Q?DrHd8Vkdb126eOqn85r+omvDFXqdDmWiX4cukUTD2Mqaf3k3Ua9iAvwpg5N7?=
 =?us-ascii?Q?kxe/XMxfLVuZbk9eDBahw6rfTqUN61qBkGPBqQBEjpMCD/v1zKuueScWmX0r?=
 =?us-ascii?Q?aGlx8GEMlyL1m0QN0S9U1RJxZLTeoN7O6jSrnKmqE6/4xbb667M7Aex16Dmm?=
 =?us-ascii?Q?An+zdsjvrWGHiwVnoz97zg+OwxHcKJPlRj9xJTYighj+pl7YdLZdhmttfnI9?=
 =?us-ascii?Q?hQhSnKbECyemamtlpgS27aLNeWCDPwmefmA1ksOUtolFVoqd0KTUm/vagF3f?=
 =?us-ascii?Q?fUtAI2X6ZgpkDDzBP2blNfxXpMqcRkC0/J7zdW7yy8HCQ2aockryq7XJsld+?=
 =?us-ascii?Q?5QWgRB0XcRbAIRrSCLlsLazV7tjQ73/kKUVndeK8jRrJRj56borLPh8zXa4p?=
 =?us-ascii?Q?GxDyQeg3QffdIZ33nJd5mXI3bImPyNbVTgpy2iN0s0k993NEfpjHsTvzyWf8?=
 =?us-ascii?Q?Orj+5bqilRA4tfMrSe0F27Ih9zGry3MIijdZTRMmEbp1a6coGOeqiic/gSjs?=
 =?us-ascii?Q?y0QNYNZOaIKFcLZi4CVUyy9la4wY0CR4vEZKNftSpwkvQgbv2q9BYBemffY3?=
 =?us-ascii?Q?MqnxhVSuqw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cfa3d6-a15d-4a0a-cf83-08deaf0a30ef
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 03:05:44.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eVUHbee5rAoygVrmDRDeO28f17O4ZanHL6/oQf4Dtei4Z0IRXtW7Ut4XTCmLLh6VEi2L10HG/Pv3EPs5gLZ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10502

Fix the PCIe outbound memory region size to 4GB, which is the actual
hardware-supported memory space. The size was incorrectly set to 256MB
during bring-up.

Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
Changes in v3:
Update the commit message, and set the region size to the max
hardware-supported memory space.

Changes in v2:
Add the Fixes tag, and rebase to latest imx/dt64 branch.

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index adcc0e1d3696b..7af25e880aa34 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1940,7 +1940,7 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
-				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
+				 <0x82000000 0x0 0x10000000 0x9 0x00000000 1 0x00000000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -2015,7 +2015,7 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
-				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
+				 <0x82000000 0 0x10000000 0xa 0x00000000 1 0x00000000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";

base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
-- 
2.37.1

