Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB347224D6
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811412; cv=fail; b=E2amSfr9mtNge3RM5FblPN2CpWRbch0bqU2vxWGWLGZA7zmBys/YDRUpmCQP3JwTl7fBTGvUZ2kcBe9BT8An1W5ZAwpupvKzuuVS4qE8dalh47wbxp7DOfEkE61q30uNipHdVSrzKBMA5zYrzbQOmd8h4g+M4aWKPIP4Qyuck5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811412; c=relaxed/simple;
	bh=8Lr+GxdaXUXHdhfDCDcug9zcjCQr6V3WZHwEmg1WEZY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UD0LJkfNDGD2BV78Kp7qYhkCnY3EA+lGiAGCyIiVTsXKaUg/rkPFmKlHW0NCGFGNrmoM98Pjd9fDrr9dFFIJbzScTyiwJAfgAzysXmOqzX1uguzFXuiUnyAob76RkHy5TU2GDBg2LLHENS+GwX7t7hZtoX9AgcQcOD9qbN/Du68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=toBRJ5PP; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="toBRJ5PP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3+avkODyMkoAPcFmWFddNwNJW78Bg2nj8Q3GdyeczMK4UNT0mWB6X4IVXDRVOtucX5W3uhD/Xt8HpIeY+SHmAbikDdZGcYwmYR5PwVx0JarW2UcHYGX/L/VLjb36msTQT3S405VjZemd3hjJTauSjTFqcmWLdaDlFGE0cZP+oPUNRNL3BIYbTVyNHi6j/zzTSlvzxDmfKWzvhniPj/h6I8+zoWI7Kf1L3XPV5ES1y84x6xuzxQXQhdzPKJoDCGDi6ij7MsCViIGySBex3jqZofFVVUzqNAX2wc1ADqCofoVdXNMevjXEbuNunZlqN+V/zQTr1VCS/bp122/k7yVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShBa2MRDNLGKpoXNGdFfFzGE2DJpdxRvogUMwsH/mwM=;
 b=bMsCA6uNXZ0nzSuQsscavPpyhirssf/WpNFtbhnPjlax7guVMOH/y47/WWkxpbZOVQuNeYbbltfe0IaLb9vxuFVLM7MQUCobUVGIvO24P6mu5RtNyHtq7HRcIoLXOOTGMu0KS+VrasPzfiq5I88lDQBCrl8wkZ/dGcOC7cLP7xg8gxFGY8tH6UmzOPPljEKOmu7AeoputF4FqnbK9a3yk0yXaPhIqSSRTTPkGe4mKx0eHPwIzdhgHukghHSrhZPGiMoDWIP2P1Aj1yF98SijXH6MM2dz3yW+HWEyB4C1xl640KszSMz/8Bs46ETMsD4tqvtxR1ocTlHdsAEHuaweUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShBa2MRDNLGKpoXNGdFfFzGE2DJpdxRvogUMwsH/mwM=;
 b=toBRJ5PPdIklKfkAu75YjnrUTPnChzAUI8axY43wANxIAt/gFuslf7VgQbhEi7EQ2tCf3erOFXAM04RdxMh8kmT9r8ShxdHzUtk3tzJQ6AN/P0hcY/1RejUn2xldDlA4iFt2nllK/DGR9Lyc0VFygmbz17A1wokAP97w1q3kCyZrq8wEbnYGxtmY059DOGqlbDO3grhnU3IGVoEZ1aUCRJNG38l1HqTZUD/qnF6D//WKEOt71fNIcXRCS18dQ0WuTMTYbF/t4TLtvGGesNth31zYS7sZjZha1BCd1s17+sWPPacJK/u08X5E8brb0S5LdpaPBdtjsTnunUVKmQTFEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11446.eurprd04.prod.outlook.com (2603:10a6:150:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 12:56:47 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 12:56:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 23 Jul 2026 21:00:04 +0800
Subject: [PATCH v2 2/4] arm64: dts: imx952-evk: Add CM7 node and related
 memory nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imx-rproc-dts-v2-2-a5f5cf2eb55a@nxp.com>
References: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
In-Reply-To: <20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11446:EE_
X-MS-Office365-Filtering-Correlation-Id: 41af4b8f-f86d-4b52-8c95-08dee8b9da74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	10bEK95Vex53Bp3oXje5XQiIPDMyfoqOOMOugXW3gwpNyA9RTTylKq51y6GdA1qySfFmA5i5hr9ndyz/TB9iKOGHbTi23DKzNDwnOojSr1ka+ZO67I13yKPaGoMkwhB06WdFgkDZzovuSneeDACxqfmu5XdIArTqwF59/TsVZPGzgeM4ek/0l7LoxucdVr9V7uH6D+4spw+VLGx2QePA29XLBVvctlHW0tuL2EX451co1FukOe2JUfNr9wB9CkMHggUZeAXXFJmb4FA7yT2OERKnSTgFABRRLnYqL9nPwHst0ZM9jKYw3QPddV8o3VXQ9/wHDBB+plGmQiUnY6sS2JF8nQ7WpbFCVi1vt9qfJ+kYTwbIm213IJ5/AqNWUQ/rjli3Wy36W6sL98Jm/XZwjWu2VMl4fd/bdxp+J7wn1Ld8ihOvSWHJLOIEa8ZrEOLbux4KNXeKXH0HxdYhQ6zwV5/EP3uB004oSPFUmcC9NfRcytPFcNZnaGvScvfmBYJjZTsd8QA/mlHaWVqDiM6VyVZM83+E2ZQjnP74wV/+ppuvf+Iyvni8mLMM7qT42Smpx1l/FguHKPAJeeL7vL5uiifR3ETi0hApuzEaWNn9xd+mcIqnPYTDqVmx1/x/uvhbvMAPjAXPIq9732V0lIlJ/mI4WHuZSw2k7Y66QJ1Txl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em9mL2hQYmV6N2lUdHovWTEydUM4VWNTb1pCckQ3cFFMeEVRb3k1TXJlQkl3?=
 =?utf-8?B?aDVRNGNKTW5lbWI3Qi9DbVV3aDJaRWU0bkVJcGNBWmxkWHNRMkJ0dmh6Zmxi?=
 =?utf-8?B?WUZvZW8zU3d3Ky9yUkRGTFFwWlNvbWY1K1BUWEtuTjVZTlRST0NxejYxb0U1?=
 =?utf-8?B?UnEzSzVHV1VWYnRTdXFLUTVIamp4cW1pdmdDa3pqNTlPMUtBV1RtOXNPS3Ba?=
 =?utf-8?B?Q0JRUUxjL25vSkJVQ2JXeWQ3ZUlWUVIvQkdHWDBmbGtIZEM1N0NrQVNPZVUw?=
 =?utf-8?B?bWsrd2ltT0RkUDdoRnRLRmcxWUpvejZvSUZwRWNjWkRqY2xveTdtdjcxYk5n?=
 =?utf-8?B?NGhURXlNdThtSHlkdEQxMU5BWHFLL25XdWE3SWdnbTNOV1ZNZnNQVzNnSXBh?=
 =?utf-8?B?d2p6UlJMdkpsbDAvWkk4c0ZDNnJGRG9ESW9OY0lDanhLWmdvcVduTGtqUjEx?=
 =?utf-8?B?VWVtQXl6VHNsUy9BKzhjTmRNZXZ3UUR0Y2RFSGNoVFFWVVpvdjhoUjhFN1dX?=
 =?utf-8?B?NGxVeGlFZVBjVTJPUm5zR280emJEM25qS1dSSjNBVkZIM01Qc3Y3bzkrRmZu?=
 =?utf-8?B?b1dhNHorbStSYkhCZDB1T082UGxhUTJIKzg4dmNCWjkwQ2oxMTNjVlRqZnNF?=
 =?utf-8?B?N3d3QmpMOVBwSWhqNjNMbENzWWFWSkxhSEo1Z0VZT1JzdkJLWGJGSm1sTEhJ?=
 =?utf-8?B?cmtxZFJhQTF4V1NkdU43bkZ6R3E3N0ZQR3ovcXdYUW9ZV3RiMVJYV3lkR0Ri?=
 =?utf-8?B?NjRNRERUaE1tRWRnMG5mb1MyM2txKzh0aUQxc0o0WmJaYlgycTBrVUxyYXIy?=
 =?utf-8?B?bUlkMmQyNnJXcXo2ZmlqeTJCUnRyZVAzY1ltSkNudVpuWEJhdDRSWHMzQnB5?=
 =?utf-8?B?Q2NXNWcySkFuR1EyMTZ5Mk95UE1QNE1zNTl1ZmZDeG84R3FUYXZYYmFTVnl5?=
 =?utf-8?B?Q1pCZEFIalhsM3NrYXcyVVNpM1VxTG5UdEtuSlpQWVYvd0RQWExmcTR0VDEz?=
 =?utf-8?B?TzdzODI3S0VwRERkRDBRakNEWjFROWtTRkxKY2cwK25ZelY5bUJpZVJMT3B1?=
 =?utf-8?B?d05mZXRVUkxaTk1nc1VMSHVTTmlIMmwvdGZmR1kwVUZLY2lIWTFCRHdwVG9U?=
 =?utf-8?B?YWFlSlJkTjZuNXFya01ZODVDekJxN3Q2dEx6V3pTT05CeVVCcktPY2xyRGRz?=
 =?utf-8?B?ZkpVMHNqU1hGdXdGUngvZ2dEQzV5NjBOdGhkcDlSY0ZtVTMvSUQrODVIUEZp?=
 =?utf-8?B?QkJkTmJIaHc3S25BRndoK1F1SDdDcWlQWW5naXVDOVRrSURSKzh6Z1BhMzVu?=
 =?utf-8?B?c2ZadTY0OWFyL0RPazg3bFpaR1NCc0JmUzVEeFI0ZGtZZmxlVERqV3B2a1Ay?=
 =?utf-8?B?LzYweEpiUXlieU5RVnM5QkxhZGdVK2JzdFNLWEdhYTdreUg1YkdWTUt6eHVH?=
 =?utf-8?B?MUpGWHpLZWFCMHZHSzFmVEVjZE4yQXRWVm5sUGtpbzdEVjl5UThiemJHZTJM?=
 =?utf-8?B?Qk1qSUZOeitPV21uSm1EVkUxWTI0K3YvM2xrU2ZKUlE2TWFleHhWT3l6eTIx?=
 =?utf-8?B?am1MRnhtWEQyZTRwYXQ0R0lMc0VxTFBRVVNXeDNBZDRNWDh2TjhwQmVXcnFa?=
 =?utf-8?B?S0ZrNmkzSTBaK2NnK3FoM1BkYVkzYnozY08welZ6NEEvT29uU0RDeW56aTZR?=
 =?utf-8?B?VmRNSmtvY3ppelJNcllrVEFuY2QzU0NsQW94aEVJSVZPS0V1RERDeGorSFpx?=
 =?utf-8?B?ZkNySWlmQlNmN3oyaVllN2p2VkQ5RnBwOVcrb285M1NKOExYM2ZjMTBIaTV2?=
 =?utf-8?B?T0t6NTYzMFVTTEJZN3h4TnY3aS93ZWsvOGNhSzAyaEJUbnRacG1HLzVjcFhN?=
 =?utf-8?B?bS9KNW1PMERaVmhqeEt1UVppVHBLVGk5OWhaMHFJKzAwQWtzVTRUMUtRL3hz?=
 =?utf-8?B?UlF2N1JLN21SZU9ZdlBtZDAyYXNGemZMQkMzT1dTWkVITEFhR051MnhoU2tx?=
 =?utf-8?B?MFRLelFhUEZweHNvWTRvU3ZzQnF5ZVJQYS9XTlRWUWJrSmpBU1FJL2d4UnhX?=
 =?utf-8?B?L2dTYTBxWmNQam02VUFBSFExU3NVYWpSaTFIVXhnYUpVMjZ1Z2tHTy82Slg1?=
 =?utf-8?B?QnlKRzJUMkQrd2tNRUtSZUFSVkZKaVF6KzdJVGd4aS85RDZlMzl2LzZHQjVF?=
 =?utf-8?B?RG5KZTQ1Q21nYlljUlkxOFNQQ0NrNWd0dTJZSUhPZVJwQXJ1dGQ4STljaTQr?=
 =?utf-8?B?Z2FEMU02a0xnQkV0ZGVVbUhnMmJQc29JOWdjbFNJUjFiTDdTSlFydEM1TGhu?=
 =?utf-8?B?YkE1bGVYNjZKKzFHc0ErRHdjaDhPQUpWdkdGTC9YakJuWjdvZVc5Q0NMUG52?=
 =?utf-8?Q?IReUgcZdazbdnAbstyIGF8jJwIxiPrHP7UJ3d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41af4b8f-f86d-4b52-8c95-08dee8b9da74
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:56:46.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjDn9O4v3LEqZdS36zXKB8q1PUNramDZp5iSolXM7P2oz6cmNGFtN5za2b/O05VPEKuXNAwpNogOr7of7u60qdTAdTfRDGfqIAFnzldETDt5crEUws24sSAv+a7eYMuH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11446

From: Peng Fan <peng.fan@nxp.com>

Add remoteproc CM7 node and reserved memory regions to enable the
Cortex-M7 remote processor. The reserved memory includes firmware
memory, virtio device vring buffers and a resource table for
inter-processor communication via the MU7 mailbox.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 62d1c1c7c5013..fec851544fb11 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -82,6 +82,42 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		m7_reserved: memory@80000000 {
+			no-map;
+			reg = <0 0x80000000 0 0x1000000>;
+		};
+
+		vdev0vring0: vdev0vring0@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -151,6 +187,16 @@ reg_usb_vbus: regulator-vbus {
 		enable-active-high;
 	};
 
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1
+			  &mu7 1 1
+			  &mu7 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	};
+
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-inversion;
@@ -451,6 +497,10 @@ &micfil {
 	status = "okay";
 };
 
+&mu7 {
+	status = "okay";
+};
+
 &sai1 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,

-- 
2.34.1

