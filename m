Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DFB390616
	for <imx@lists.linux.dev>; Wed, 13 May 2026 03:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778643775; cv=fail; b=MLssX7nsCHax+mwo846jlhBysyyoOKWrtAnifmyr8ZnqV6q2oTT087re6LypFCgXdngF23/yGZkon/b2kiHYvFI0nEFCwYv5e3XCkZkPvTv+NGBej+SDkqg9zd3LJ5zyQA+yQDkfVVtbGeVzuGt2q64S6VfkGAvchadpdUah4ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778643775; c=relaxed/simple;
	bh=L5WLe/8vvNqMuAtiEIEOXC5Ebcug3rJl8flH54/bsbE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ow0VGJ55wN2ybXEu1dVcXUmLnwMWHmUapElcrRdfdQjJLP0G5UOilSjZ3ryF7xYjcMfEMKaV1+G0zciPDnOwK9opmfwPLukFE2XVHJivh7WeJdMs+TowYBPgeQj4824AnPLmdfI2DU7ZpcsCot4zW8eOhe6uUfU+f4TL9KdLJq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Urdz8cMu; arc=fail smtp.client-ip=52.101.72.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Urdz8cMu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wzma5PpMmZ/NAPmX+wmdiycdMJTMuQIlgoungpoOCMZ6JiS1Xxd2vWSPaq2JZXx/x3Hv8xZepp9cITz1/SyGYHglFt/wfXCv6nRTW2GhRj5ypDJjzezAb9FALQfl5n9qAM2X+3bRFpMaR6OQdvaKbFqcLlDmzqzMo8zNXeccD2Ygd0e8batrr9hueGSEOM/rAM0kM8UtJSphyklWyoHQAo1g/AYP7PTDw2FT/pKJPh1xUYS0kek6v1aqe6jLqGoP+oJ2cpVqOPeRsSiqaW4fuz8/3lbSt8t//7T2i7o9WJbfFaBhFP6cVsZYWR/o4Xvyonv2Ey1AVqTRMe5IRW5fdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqvYy20a5Jx86hYqfZOkuBqz2ypooclQXyvZoS2/rnE=;
 b=EbO8fsIkfCZyu/sLLj4cMzYtFz/BI24anRyoJz+fRvL889mCxGXb2nFJQD7rdCIz8JZaA8NL4eKtRSgFyefaAvpCyScaRWmFKYnHTIHmx0K3t8GcCx4jlAXg/tYQD1c64E3vdHqmquUjPaIAVl7oU881OcOrZ2aA0k4H36AaXVm8K6jNQDPyJyaywT5dD6hLqC4ttct9tAf3TG+9gved7ceIfW2ERFRNiNOE2MELLjTTy5tzK59ffTOtpIKQY/InycI9sEpOEOu3c7486oGuPbitJFH3HqkAk91dUJfFVtgx2An6ETHSrp0MLzG46pB+3MfaPjhWyltpr46y51FMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqvYy20a5Jx86hYqfZOkuBqz2ypooclQXyvZoS2/rnE=;
 b=Urdz8cMuHlTuCJJvn0gxFBwOXdJN/kV+G/dc+kWk2cqDdXnbrbrXtSRoeLBSxBRqtOZm9W/JuohdcrALFFtpnYjLPTNXboVFf7Wylz6qsMsIkLR0kK+JK5vasCczpXV7JQNRBGMGG5J+gqd82kBdZig+Rd93Pc8+kKX6/kJVocewQZ0U9iLOQe2D/e7AD0cKZbZ1IMpekYwv/RHTLnPTm2i0AgLgldPjMvEgDhgZgnermz3z7Lkvr7afYtARAF+tNOajao9Qiset55RH/p6Hpn2doHmQFTL9xETcrWd8+rNjdTDEDtzoNctnumDFBZnmg0LMfKQRPBalvIvqv2323w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12008.eurprd04.prod.outlook.com
 (2603:10a6:800:317::15) by DU2PR04MB8920.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 13 May
 2026 03:42:49 +0000
Received: from VI0PR04MB12008.eurprd04.prod.outlook.com
 ([fe80::3e42:1e5:5955:d68a]) by VI0PR04MB12008.eurprd04.prod.outlook.com
 ([fe80::3e42:1e5:5955:d68a%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 03:42:49 +0000
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
Subject: [PATCH v4] arm64: dts: imx95: Increase PCIe outbound address space to 4GB
Date: Wed, 13 May 2026 11:44:56 +0800
Message-Id: <20260513034456.1554188-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::28) To VI0PR04MB12008.eurprd04.prod.outlook.com
 (2603:10a6:800:317::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12008:EE_|DU2PR04MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: ad78bdf7-bacc-4726-77f3-08deb0a1b441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|19092799006|52116014|366016|18002099003|56012099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info:
	MI9L5tib8u7km8XSYZXKqCi0EqFocH5MW4kgSS6VSdPhB5uRIIKEYiteGM1HEgBb4hkAHTs2zyz5dB+lQQ3p4cOfKnohOF1FwcXr1yPEf0b2Iy1SEJBnNDP12Kl2O38jLJW/tUDyzxz1FxyJucLFv1OBdr2nhq/hCsKxF0D+bi+w7Qx44z7nahWTtcdUkBGX24QuB3i01SJdAxA6+xUJHWMl6GF9YjujnJIzM48Lc/VJz4Yrx55Aag8Tv7h+Y2gX52C3bh5/TSBPY5mQIoL2Eh+HjYWTtKPes44ptoeRqN4by6XoP9uIYY+3x5LrBlADMAPnVvVsNZ8inmi+592qLH2S1FzDa5iHtu36o///dBHmZLR1//8VdGTGRHyJb7oNcm9iOkOkqkwdJv0tIZM9S2mqA1Hhgc7vmn82Xsf5qhFfEEDbWaxjqjb79Uf1RPd4WGGE5QB25taVxBv2W5c2zn/6H5JoqaguaTNrmmjqq4+kKoSMRcq4KWiV8pJ0O8j5xiOreYpPJSYfKJVYrzw9+KUSxFZ1kyE/V4l0+qTGPsezU9/C8I/S71fmTudmXVu1qozyXF+/f0cxGj+6b2U15b9ieWpzCF/iXsOjEGEKcyoVW8kFXN09lpuj5+B33GHEtXvDKqGgGC2Q4/3rc4TJswB5XyAQVMORf7ZfhN0eQ4iV8YV6EaZvwem7cOZ4OhnxYfYOufo5qXoRTOD0cxU7g9Z1hc+xFzRMWTE3ekbRhLLypCDpMNxc2T+VMM6IxUI7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12008.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(19092799006)(52116014)(366016)(18002099003)(56012099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q4mFpwr7trhNMm7KiTbhc+ILEysNitrUDfiGuALfxkX7NyoZpAVLCsoVs6XM?=
 =?us-ascii?Q?/6XyzKSKJOmbY1ksDLfH9I3fKDE0rOO4fz8JM3XGruqcPCaDtXvXDoHZmasX?=
 =?us-ascii?Q?HGz7MN5aJ9Vhq/dg4SdcOeloE7vr344jsWZbpoxQg7A4I7zM4tUGygUScGc3?=
 =?us-ascii?Q?2rUPwIrp3FOZ4JDregCBOEGBRDSSzJNyL+/RVg4L8LtXm9dqnpdmyuonhzJz?=
 =?us-ascii?Q?0QY7paqv8OvMBQaxUr/khK31asomKMQ6CVp5g6g7uVOzb/cyYt5J+10XVNue?=
 =?us-ascii?Q?rbo4KMaYuoREVjbEn2Yj/q8YJAH3NLaw+fxKnSMbM2HjF8i6POzQ3fKoi7hE?=
 =?us-ascii?Q?o17hM7EenYCjns/3CDPm/ZX7kIF/vytL56uwbDH/RpMiPzmJnUKTCv/+vJ23?=
 =?us-ascii?Q?KCv0PIEVhuUPjNGC9Jq2Bz9bxGzAiUPSHI3hWg+LGueHlr4yQbpa8devdWIU?=
 =?us-ascii?Q?CQWlmdiLjMomNm64r2Z8sy3M5Mx0o908FMi/tD+SCnScOvl1RJj4ryWE3Mfy?=
 =?us-ascii?Q?XRTlVoEoBC4tpdHyEddD/BO+cSmXLhuwsobEmx83jF+/1Zn0ZSMIG8Gifyur?=
 =?us-ascii?Q?stbH5oUBaNqZCMPx985s22x8iHXeqr+0PP+c96uXogef6FulpM1Qyo6DjUJR?=
 =?us-ascii?Q?RSDEkSZKPmkcDaQ2E+pHaJvFO+pDBdr/47eQGpvvs5XHRH63E1b0N6pwMXfG?=
 =?us-ascii?Q?385a5qbKTHAAPo/+TzfrDaVmPEKUGDkx01E1lWEgml/SkJWavJm/PpSlqHvR?=
 =?us-ascii?Q?Y9i4JqXWNxZ+9FdZLRVXtJqQ4dlwZy7ktZfVVrPOVAAP19KP6RylHey08PYg?=
 =?us-ascii?Q?/KUXgS2q+jnux2+l/zFbToYBYtFdoog61k/4czY0mSVe8cCY5lWLxh+94SnR?=
 =?us-ascii?Q?Zjo35i6kTV3shnn6u/eKn7MmmLLmuYPlwSoc5W3zRdfzU7LInhOWo2jMlx4p?=
 =?us-ascii?Q?wSEzy1maPiqWKtC8JE73LmyMD9GihiTQpAtbp7Zq2Hi2g3iHMC/EDfUXS07O?=
 =?us-ascii?Q?x7+fmY+e6OH6ChnlZG8xxp+eqzC3tPwI44f5k7WfDqSlrAfIVnuGH7k7CZMP?=
 =?us-ascii?Q?y+iXCqC2079DqjdkhLh2tJk+rbozFiRsbfG/41uzRbvXGEcSyJjUrHgHjNna?=
 =?us-ascii?Q?EYJy7vtqwv2jhWXOuYF0HAOAsC9Ow0wkaX6iBW72eoA+hF0oUE9a2YZN4Xbx?=
 =?us-ascii?Q?IVLqZm3ZOQ0OX2gKwsx1Uc+wvQjM7waZOKe2XzxZmO2itKkuhAxmg9JOJF/v?=
 =?us-ascii?Q?PGQ9ZL7aCcd7foK+4Vj3GgAbGQ4ivOAEKjjjhjiV+TAm1FFOUMvXn9h/6fav?=
 =?us-ascii?Q?8l1Uy0QKNr0kHInw7n/Iq8ZJ3Ec5RhGjSNTrkYuEUQ9RjV0Vy1W4m/YwRqul?=
 =?us-ascii?Q?bVS9osoGndE8FKMbeBisBQtOcGpIMOKl8rOZwL8TWnQwsOdNzxvbhYsZm+tH?=
 =?us-ascii?Q?DoXulJG3iznl7oifWp3UHFwLHT5wjEzBT8c9CCQOAiKHGXdmcs3PB92iBNKT?=
 =?us-ascii?Q?iNRWY53fpKVreRjczzjC8A1NgJ/M118JN0+BoYfnfgTiMjlVRzCPrfMQCmSf?=
 =?us-ascii?Q?tqWUZJE1IJVjL+hmcViSJdwJihNgWupWn8UJy527ax1vhc73fOjcP7TvMF3c?=
 =?us-ascii?Q?OlgxKcgvHW3n3vKRMTQi/nx80h4bKOcSVRgjc6Zx7iyRHaVAr7juvxzEX/7G?=
 =?us-ascii?Q?HfCNKT3mywpUD5rZkFpuMp5Ct50fEN7mBo/iL6LCu/UqqARr6fUZfZof5a9i?=
 =?us-ascii?Q?TKTB0ZK2MA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad78bdf7-bacc-4726-77f3-08deb0a1b441
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12008.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 03:42:49.7854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8OR1YHiJXOSQ9zUI3sEbWRQMk0wbYZN9tRSGkmhGA17YcgguwlayW/90Npq95687keCu6CVIphGYHRfyIbTPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8920

Fix the PCIe outbound memory region size to 4GB, which is the actual
hardware-supported memory space. The size was incorrectly set to 256MB
during bring-up.

Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
Changes in v4:
Update the flag from 0x82000000 to 0x83000000 to declare a 64-bit PCI
space.

Changes in v3:
Update the commit message, and set the region size to the max
hardware-supported memory space 4G.

Changes in v2:
Add the Fixes tag, and rebase to latest imx/dt64 branch.

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index adcc0e1d3696..d8a6a18ddfa1 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1940,7 +1940,7 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
-				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
+				 <0x83000000 0x0 0x10000000 0x9 0x00000000 1 0x00000000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -2015,7 +2015,7 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
-				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
+				 <0x83000000 0 0x10000000 0xa 0x00000000 1 0x00000000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";

base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
-- 
2.37.1

