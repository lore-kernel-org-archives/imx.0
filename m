Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A3372B2B
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769673765; cv=fail; b=CjX6BBWr34Dyfo7c7Va+ZAKncRikNWVPNfEZgbOf8wRaoPJowHDr845KNc+8fTW90CGTzPF4MmYY03DK2M8dyea5YA0jbJPhbC81sBse/KudEs5cuh2VybNFJm33f6y6wx9uygQnEwu23byZG080mrs3v5hHJKYdEpFsWg8oXzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769673765; c=relaxed/simple;
	bh=hSAZKlPwErZ7i/Jw6oXMiya04H6OEUGzhCTLvtcGXZs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qAavGTzeW/IHgbN+9m0514MMpgkc09EfLlp8/HPA96KXOHvwQg9m3n7hxaNGCS0XSfmcbDcAEUVU+dJn51BjXaMRyKsWA9boRxXIITaXSJEbWOFx7xA0iJlmdBFxgVKtcciLwlorUB6Ma0cxEtwFurGyidTcrm5N/THXtCop0Hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kxfAOJNE; arc=fail smtp.client-ip=40.107.159.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kxfAOJNE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDgRGbVPG0457E9L8CSETGx7/ayv2DRzszIUiYq1uGIfl+PRQzsUoPrMM+2YSl3m1g193nRU27VwkheXWWzsQml/wkxhpsIL7O2TRw8Sq9yTnqgXIsfkvhzabEDgZC+/9m71SwGnoctzSOYC5hog5pr22utKiHXowxkkLHJfM3bnejPQqlZ0mlyjVGFwIFK2TTWi+dfrJcK28SrVPdf39vgkv9m2esamT00Y2dbeokBirY3CruT0Y2TIBKxG7s5NkJwKM87X6mvr+sTLwJHYzJ0DpoLzupvoWuA187ue+DUMCT7CbxdsiJxJg4amScJVuIu4gmPaRI16czQzlWoUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/DNrz70M5E94ESqIozXod8OWbO2N6z3BWNDSt87Kkg=;
 b=Iu5cbTodJxybkBjoO7mSlp70IN1f8ls0jP+/0CWaG7gATTzBi4azKPIxmh3aIWGwzKJIODT6S9qia1UPVBMSa/V1QiDFymAykhOVdKs8JQ2Tr6Z7JIs42ttFsleCRIhtfV92/ezxvgjOuVBX8/TVH7GbVkIr8iOXKqqeiH9VP6WKfdQVmf6QXcC56fBL09JRr3bEB5GxLRXOLPBwrUhHZCukZepnVDlQoX3DN/gRvyRkw4Frs6ALMo2DsqyJBOW/fn581VfxIzprT8yFUEL9mAG89uh4fwG0TqCOy8jcDcXoWPEAROA4wCZyJON3k15c2CSjSew6OKkKhIH4osSK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/DNrz70M5E94ESqIozXod8OWbO2N6z3BWNDSt87Kkg=;
 b=kxfAOJNEx2Ky+p6dv3dP+UPlmVIeSEAc/GOkk1PP8J5prq4KiF28MP2PVx5FPRbCSGv5jBtESf4lbZEHEyRLMqGflYOsEy/cQPPo2+EvdxJtKnme4znA66rZcmnwPvVxVZsH86erUJ+NYFqgJQzd6YUXTrQhqEzV+VPZzRwmZQSTUI02VXdH1z3RTdBSOj/uVPKoaa6M/Bhy8CKQHWnQOVH7AqWbOuekcj1t2rJV9Nof7GRBWv/R6wclYwJXFkcvVTSGUsLZjOOQDJLfB9r3ryMVh9IhTH2avZZoi47ip2H59e2LPh3xApsaMSk3+A+BKeXyw8kpuRBV+QL+DRIQzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21)
 by VE1PR04MB7230.eurprd04.prod.outlook.com (2603:10a6:800:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 08:02:39 +0000
Received: from DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754]) by DU2PR04MB8567.eurprd04.prod.outlook.com
 ([fe80::32c4:a8a7:1724:b754%2]) with mapi id 15.20.9542.008; Thu, 29 Jan 2026
 08:02:38 +0000
From: ziniu.wang_1@nxp.com
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning step for eMMC and SD
Date: Thu, 29 Jan 2026 16:04:37 +0800
Message-Id: <20260129080439.2910727-1-ziniu.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::11) To DU2PR04MB8567.eurprd04.prod.outlook.com
 (2603:10a6:10:2d6::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8567:EE_|VE1PR04MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d6c470-e306-484d-81c2-08de5f0cc50b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9ZsJ72jpwFZmCnjrNqN4EYL9aGOlIAPiv1DTzBzzZeca7OnuOC69loQQdnkv?=
 =?us-ascii?Q?zOg7uF4wa42luZ/gAPHlZZ841Ef/MHCEniKzAG8J4Dm9ZDfq/ThM3scvHRNY?=
 =?us-ascii?Q?dlYW0PfCXGgVzrQuy/mTXOO/xhRxZcRggrSoeGksFeVpVzm98v8Nqwhs4Lsv?=
 =?us-ascii?Q?6XVuudVu8a8FFPN2YJHv1FV0r5xOMWL6jWnCFlM9FQ6mnzjHe/390r9J66dI?=
 =?us-ascii?Q?+oTeV9/tcDMLAF09+NHPG1pRGrhJPpHPziV+DzNfUraWNruyaqizzKmAjy8i?=
 =?us-ascii?Q?6LR53tja/yQOvB44kYKw5GvF68PVzNW323uugyHoFab9IWwg3NaTXRbmDMwl?=
 =?us-ascii?Q?1RrKrxrDwaINDayQRJok8WsOHpWA21GbS7ETNhpOj1icA0e9PWNHbclBB6Qm?=
 =?us-ascii?Q?9jb2TuvC/EhAK6T+er+HilK1oAIdmZJ6SXP3UmVwD+3g/2a+Jilp8XD9G5rH?=
 =?us-ascii?Q?Ny5GaG+pULIKxcLmpGMtJ3HE4EBL2epMjSdyNghfzHym0Jj3aOU4U4S7Gwnx?=
 =?us-ascii?Q?yfSIN7JNyTZ7/SV60nHW2ltw2meyx8LgfcbKzFfJA+kJ2sKkEbYuA3LRMWU8?=
 =?us-ascii?Q?bxHX3WozbDP78ec8vvcXqrjgnQ5eqPmkKI3O++v9syTaniIBXGIVGueJrMrt?=
 =?us-ascii?Q?3FZGmbkjITULtQcPiMOl9+ExydCKculbO2BJCutm8FYZDwnL5xWRg149D0YZ?=
 =?us-ascii?Q?onbTeIhN4SeSelHnBLcHYXPSF8naweUP6uO7dBV97K+7iUygAgvlwe5+2xYQ?=
 =?us-ascii?Q?Ax364VLuBI2YBPvIo79TfFKzqkjIKfw6C64XHWg1nVXc/uELS8sHEVDnRz6L?=
 =?us-ascii?Q?7o+51Df0thM6TzgUHOaV/H2/OFNLYtY1/Gk/bboUQMtNEMuhmxpMpU/ohtDH?=
 =?us-ascii?Q?YuO1apSrD1jZL7Z90I3WibqDk6WVuvJh0JK0gFX+AGc4kBlOE9H49It01Hqr?=
 =?us-ascii?Q?vSS1JLsb2IJjId7KCyz1Rf59pVDX5wAdE+VR+uGXOD5ri92LRoN5edRXk2Hg?=
 =?us-ascii?Q?oiBUak3gGaxFvlNvz6CLRX7vTDUDPvmkdRVOsXZ/1S33mgLby45Vt1LQhlcm?=
 =?us-ascii?Q?eUw3d+A/MaZtilBnmajx9Kg4LIyagWpG6kuKCW0ElWrt7qh5kkI/pE82P2fY?=
 =?us-ascii?Q?bVVu2IpBB53/eLi5K21yopyumyyfNtFnxIy8lQSyn8S65+9NOi6ewS4rOzeE?=
 =?us-ascii?Q?onWjpxXGAZS6nTHmm5TphWdpaSodEWX4AfHglbq1uw9W4/LRowW7tSueLLC6?=
 =?us-ascii?Q?zZyOFRZltbEE2LeAKGbE9WsgwuucBDw0Dm0HfC+c0EcC35zH/pWB/Fz4Uov/?=
 =?us-ascii?Q?ixml8wFC2KohWAL4XBcXghwBQw7bHeK3+SYa93Ck3YZKtCI9ahIRo/GtUF6i?=
 =?us-ascii?Q?Xi72tauQrlT5FgOwrNEOtNpecj+e46PB66AWc8mQNmGYr8EFRBus0GAaPMsC?=
 =?us-ascii?Q?BBpZcaH3gvftHNdhOvd0TKfqQ7h+YciRXFHdGqiqu30YsXWCoeUYDn9tRnNS?=
 =?us-ascii?Q?y5nBSEMsv8kEqx7qKs3JhTK520pdg0Qjj2VS+B1kJdbuGa28KQ5cRSSal3eh?=
 =?us-ascii?Q?Iqg+zEBSW0W9OtHiKmEP/VSDjpIrMCI86Orjz3La0999Z+M+2B3PKA8WG0ei?=
 =?us-ascii?Q?lsBGpWP6IMROt8+zKd9d36Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8567.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rWNPUwk6oXv/jMk0PyVEFBxdiYUMD8lIKGvKasal9kQOeHBZnjGJT+fg/TBW?=
 =?us-ascii?Q?CGmsEc4CxWp7QLUYAfdVplrfbqGTg/70LMop5xES+RCGHZeqft2yFCSk/U+M?=
 =?us-ascii?Q?9p0SmcfjHxjzIaRpSbnVv9Mvi8j9TQdrtNnHJel+sU4s3Je15tc+y4azei1D?=
 =?us-ascii?Q?mHHSUOMWrt/DJjImTWurlVp9FGSZj35dp967COQYo/8t8XbR7n9elM43/y2N?=
 =?us-ascii?Q?kmF64BLgg/6krDvRjYEvaYKWR3kspaIcauztFCSlkexJNW5SoVaTEogfCgNf?=
 =?us-ascii?Q?ipA5erbNmmpaKzi8ZoSWFQzwyCDWadT9LZTfsx2HiWyy7phfUGJgJfM0+Lvi?=
 =?us-ascii?Q?4gkiUVHL4mIdLWqkYz6tFwhzsvbTVD8A4Ss/Aqf/UcXM26ahoj3oaVgV5L5b?=
 =?us-ascii?Q?gDhSglyJgVHZxwzCo9Oni9qHKITET1ddcXq4ofwzDrJ4me7upWmigs4gUFh2?=
 =?us-ascii?Q?vIJyYC4nqsEuOmebl/VHanKhGVMBdI48LuqmgPuB2Q5s4EWi4s0SwWkr1a8z?=
 =?us-ascii?Q?g3BAnStTbpG3Eo1a92RsYYplN9cPXjFdqO90t0jOF0opvjor8IzJc35BkOKa?=
 =?us-ascii?Q?fKVg6lvvXslRyc2rlxwqOAKlej0aYOVY6WWobky0lJ/UMtve70bCMsfsTWPv?=
 =?us-ascii?Q?uDA1LC0DSMdvt7JnKVkaVxxloxSvDrCsA2PEWqnwoIVsjLJPEtv0K2dmtZ0G?=
 =?us-ascii?Q?A6Os3l5QTXr8O+WYQ4UL2wHsz/AZJTjNYfXsuodC4Ww58CfcNc4aRkgHmMVi?=
 =?us-ascii?Q?Bi7pbWZMJl07Xic1gm3D3pE+4ukLjtdlDJQAbHlH83b/TQ98xRCP66eDd19m?=
 =?us-ascii?Q?cS1a98ZpaLPVuT70B+yJWHmFQHyuvK5fMyzhOT3zG0/BPx8Z8svagRmnCgNi?=
 =?us-ascii?Q?DuaeW+qnDybTQXuV2Z2+HpDrL6et8BfMcnxtO0TwYvMs0afbz9gAhzRu4nXk?=
 =?us-ascii?Q?yXI5ggKUIaQLAZADkZ+IvyqNn9ODbPkrfRK+GcgR+bISpT42HJ5ev/YHuvPU?=
 =?us-ascii?Q?g+iX3JYdSTHBY8nSS/NKfDarZwVRcPTl1QSuYyh1sgSPWQa84aCnal6P8lRb?=
 =?us-ascii?Q?oVKd1tR26zCRnihvyalP0Jduv2NcNtePtmKgIiiREPKI5OBSDyFx+jtfijZ0?=
 =?us-ascii?Q?4UaCOBudHnBjN+A5Y6TIXv9Q5ukHlWkq1KSBKp8m9GituINUD5u0x6F46XO0?=
 =?us-ascii?Q?4WDycYZfYjhFA90msy1uevCqdMxczQD5zBYnStulrQ1xpEcJxO0VmGvXG3kh?=
 =?us-ascii?Q?8mQRqWjBV9Ziq69h+lxTLJMqL2UzHOKAcMNYQ9oT3GYXjCCZqLc+xPnZjDSV?=
 =?us-ascii?Q?Z/C4R9Vd89mpoI6LsJ5khc+9Cj16XxB68yrd6F7XzKrh8DS3jiQU4g6hYMPJ?=
 =?us-ascii?Q?pMOLpvaUqz//+6KMQTH8HLmNNGurfA7nciiNs9sHkZVn3v1wgu5Luah0CcmS?=
 =?us-ascii?Q?15Y+ahMTiPYvkNh7X3ChUbrHwFe/4A5iKKfoXFNNUx9Hqj6e3Zy6BHbyU18a?=
 =?us-ascii?Q?L8ZzCL0Xj9DqcLiemKC95PTxdi+Emcc9/8nCBMDtTB9IO8/zdk8J5R1VA1dP?=
 =?us-ascii?Q?jWcmYW/2+FCX2uNH8e5O0r8WIGcxiFivUI33kwg/S1CvMQEGYOUCqagO33aR?=
 =?us-ascii?Q?4kfllqaYNaDmHqlfzj969U5vv7C8hxKbRD60Xz/yZVhw6f27/cMlA0chQFBz?=
 =?us-ascii?Q?70ATJZcTQI45veeNM7eiNAq9V8cO0Fz3p4SEohyL3xhMoTSohi9Mammgxgnf?=
 =?us-ascii?Q?KyBEKBNKUg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d6c470-e306-484d-81c2-08de5f0cc50b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8567.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:02:38.7837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ii6RO253VTVF73gIR6W9OsUn5ckavF1FyGZTINqMrsKYuhg5FRIFTmWCV8UOjxLN3N0eEYoVPzDwuURRMxqrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7230

From: Luke Wang <ziniu.wang_1@nxp.com>

During system resume, the following errors occurred:

  [  430.638625] mmc1: error -84 writing Cache Enable bit
  [  430.643618] mmc1: error -84 doing runtime resume

For eMMC and SD, there are two tuning pass windows and the gap between
those two windows may only have one cell. If tuning step > 1, the gap may
just be skipped and host assumes those two windows as a continuous
windows. This will cause a wrong delay cell near the gap to be selected.

Set the tuning step to 1 to avoid selecting the wrong delay cell.

For SDIO, the gap is sufficiently large, so the default tuning step does
not cause this issue.

Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 0852067eab2c..197c8f8b7f66 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -507,6 +507,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
@@ -519,6 +520,7 @@ &usdhc2 {
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	bus-width = <4>;
 	no-mmc;
+	fsl,tuning-step = <1>;
 	status = "okay";
 };
 
-- 
2.34.1

