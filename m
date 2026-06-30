Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013052.outbound.protection.outlook.com [52.101.83.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1C6350D7F
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 20:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782850604; cv=fail; b=hcibufRwAy8x5R1aZugYsFEsMChQTtEy429GBFmQlUvVy8Kgq13ns7FOefqDu1OdoT3C0udvfc0WpR4Fcoa6LQQ2cFI12p3ub8q2yLsuO+qLv+lRYhh09Lw584OMiVSoPXPDGk98Bg3in5nbyrn0rDqV9lEr/GJ+moCqD9Fkw5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782850604; c=relaxed/simple;
	bh=Ea2PRmsz8hc75aGrS6R+xBOdTPQdAW8ngev+8WKZndE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZO0Kj30JCAVR/jFUK+TsEMuJ27rxjCN3BupCtUOfts8nZMbAaE18BQGUbc8CYxZfiF7GTopvFTE4BBar3RHV+uEB3+oHgHuw99YspR7t3q0o+fen1wIilNErXU87eQ4knBKlDNegXHyypfm8hxiqi6IqrrwupygetgXFYwhWthI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OKM6CD+y; arc=fail smtp.client-ip=52.101.83.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OKM6CD+y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpY52Wef9OcX9TKeNPQZTCH3JCop2Xt8Ka9Bl+VcJkNylXp4T/VltawPVHnTzom/agHa8PQj93KhYC4x3E+a/Sdsz/DNrILUgxJKmYazaQdhaueyIDEbEgON7b2rUqjHT31zlU/Vi0R+t8VoVQkGdUac2WrP/osZMusH6jo0yHGTSnBWt6vDmHrUdP6up3OxbF63xwVHYCjE/fFGMXMhsfM9gl4bQEBrkYAfikFzTScJPrJKmZxlkJ01brgcht92R8q1iW6QdmBuIHwIlhO9CHTI1d+OOZaZbcgLRVwkl0EsC2/iuQkP1FS/Gnc3uXmQTs2A5MPsW7GL9BYZbA1ALg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjSFqEAroBvxlHWr11qHA4RdnQCh+ifUIyD6xzJrM64=;
 b=jj74IJ8DBk7ZE5+xTInF3WHOLuop708w9Iq9qNIZGGIqanFzRVs1HjWqHbumNyscjuRak7Yn8F/KgHJTvRiwH3+4GgpEzunJZc8hj4849o2dhl9kND9rHx/KxXiWWZaF+CgL6b5Sx3h1xERKKkhNcfd409THTT7wTU++e+uZ03mtaZzgYzPL8r0KjrJBMSwAeFsMXErwEcuP+l0I6HTDFjNSXZFn0NwQhH04T2Kwdr2vFRKAo/Zos1eMZLVjztuY/14tWFKbZETzQizGhj6zwXNq8IRhuYRx6zTD+2qbGPCGSJI3A1JRomoi5XI9fJbtmvorstNaoau5Lsvf6GC48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjSFqEAroBvxlHWr11qHA4RdnQCh+ifUIyD6xzJrM64=;
 b=OKM6CD+yHNfBOMs4ZtsmfQqtaonXc7q/no1W2zGSOOB5TgorE5zXiqukTtZm8JJWt2kpW2rXH3ancPJ3Xsq4dmE2UkT46Serr9BDPbTRcpw4gQ/rLuEVARYpQKcs+PSp+rsI91t1vGVP50UHEZTlqQ8hRCCKp41ykjyhG/W8G4OmA9x8ZkXKZSH8X4QON97kmVWakcTubdtC4e3EJKQdMSCl+w+QHpc0XWWihIPvZX34bbGccaW0vLGRFdqZ8vcDzLparRJJSK/KTW6QFUYAL5zC0IC3QZa+/5dyPkgQU/D83db1o9uu3AvLN+l4y/YbSyhyk+rPGN7KcwkE9Z6jxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9712.eurprd04.prod.outlook.com (2603:10a6:102:26d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 20:16:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 20:16:37 +0000
From: Frank.Li@oss.nxp.com
To: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] MAINTAINERS: ARM/FREESCALE: merge Layerscape entry into i.MX entry
Date: Tue, 30 Jun 2026 16:16:18 -0400
Message-ID: <20260630201618.3497941-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0201.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e11611a-0d25-4efb-fcbb-08ded6e47d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|7416014|1800799024|366016|18002099003|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	qmal1LVBrjXxmPE469xlX08jLg6RljpnbDq7fyreAM6rJOvrwtTR/uoJEDEN6Eu9Kshf+ATH/Rzgp8Cc370giHpQlb51IlZVm0yZWpL72sCPlAnp0fayaX5bIaCdeSfeC3ELdCwbYo58ontxT+GFvuLs8rfvBgiNDvo7/xdNjc5CdAoFia2silgsXqASHiIbQmgrCs+UHm6P8XJGoSzjLV/XP88YPpeRZbLwaFh5H0ZOIe6Z+YLz8FGYeXQE/bYNVUlBs9zO5fhpHFCz/Wh4IbHGOOz/ymzOAxs6KS88OSXtrhnMWqTlpyfmctWZKM9aJfd+8b+0RspZJFFhrc6tYpWl6OWSGz0JXKXXUJ+eohjvJfoMk4bQ4Yi2OQ5EBFXGmvXgrUoVGfkIs9HHRFzHWWJoxjeuglHv8uKweqWvAJ0cJOW7mr72P4NH+HY5BVluy+cIPen3Bzz/4lO9RmrvW+RHBjchmLvHHVNDnv7EBEzxOw0wde1w43zOJORyBlFco0A3flplL5SytqhInmugg+fZJF5719+mCgRhOVAh4XKcBYREwAiiP6eXpyeHcGEt+Ad2dsHGGnuNE1LV6Ur/suVmji2gEdUFXEM1AXCNpCnSnPA/3hoxN9gYvN/BUyw2j7LOXRH1x3F2mgGxuUPRvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(7416014)(1800799024)(366016)(18002099003)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ad8kzcMI0WO2xfDTiY1LujKJauSljsdKLlUTudGzu70T9YNy/XQHLSQkYgF?=
 =?us-ascii?Q?3haPudVLQWu6eW32D0r04qI0yRGuTyF01HLImk3+UzgvQkluG2x3HTnSq7y8?=
 =?us-ascii?Q?JMlSiM7OuXMbqPSuZnHPaR+dStcqaYwKlr+C3hjq0gavkKzLkKI2GD15B2G9?=
 =?us-ascii?Q?PFBKtmBgkxLRlNyw6A2uQ9Uvq7VzYDc2+a4AGU/eapmre9vl56AVOysBPY5X?=
 =?us-ascii?Q?fTaeUocCdH0yqe6P0f1Ny3p9cEw43Qbq0nm9I9MSAXscHGhlNM64G7BAoGqk?=
 =?us-ascii?Q?S3U8+vtA3ewsa+vh+GOx5hKaK3TaEv7BC9yQiWR1tyGMKfouhZs3YTkblDIq?=
 =?us-ascii?Q?Vn0YT4bwsVYkDmrvpgrlA8Y3WGiFPjrnkiNAKWpsNO+sFpUB4jKzyOTjhEvu?=
 =?us-ascii?Q?96G+1BVSRdzFIUslnlM39xX0alqSlBrPvoPFLstNHQw40tvgAER192bDpa8n?=
 =?us-ascii?Q?neHtAnr4z9dB1xK075su4PN7tSRJQ1dfj1M3f2r1uSsKJok7QGnN5peZa49l?=
 =?us-ascii?Q?YDopP+f3rP2lUZvmwFqBVVZiQwslGixItyUXvdGpGjo4P4vZ4J2uf29bp7Ez?=
 =?us-ascii?Q?dRRF/GGLyEpZ/j+Jjcm2ndLvv0mHpPrfY7GzkKaM5Y9rNwIh58VpV8a1+wGz?=
 =?us-ascii?Q?ipohDti9t5DxEnHLEJy5czT0m6aRZy+Otj9OhCKBf6JhCTFkallUPObAJmsV?=
 =?us-ascii?Q?UXhPCvjk8Wtp2luQnHG61Phj5kc2xMazuJ/zrwiY/6B03Nfn4PzCzuuzp4WH?=
 =?us-ascii?Q?T/nNMGhmwkVaMrfb7+PTnjXG1KW7TEN30KVhygoWYVPaKGYgIjtKGFzuJwUv?=
 =?us-ascii?Q?F9QVom9lhPYPB/MMTEd0SNS5CU79d53x1o4CZn6XNP9iYH2RP1uRBem0zR16?=
 =?us-ascii?Q?vGqu1MPCV6h54yGiXPEgmiYvRfl8YPZltcykqOJO1i6te/EbDSKYisayTBGv?=
 =?us-ascii?Q?PiozE/XAEiN4ODubEBIIgsSDwvx66JS+rlEwWWEdjvFtO4DRMXKNqz6T2QWM?=
 =?us-ascii?Q?z3C3lJZjb6SY2kTGUDcB8eUuAcaxCBPZloqskhMlGAlw1xyRFu0+NVv+dFP7?=
 =?us-ascii?Q?xr+MVw2SgHsmc/KQPanu02tsdEoLEjP0KmgS0OBwraUB0EbUQCd98ripexvY?=
 =?us-ascii?Q?vUtp/UEH2UqXgbNjWxKwtqBvAA9430wED+t2W7IHaGKJdWD01GuFB1oqMBQS?=
 =?us-ascii?Q?NEeBwO1d6GyF/c84lVa3mQUhbQVpWolEdBkFZ11gkACuiSpnLbKbh95p37sx?=
 =?us-ascii?Q?zEmAr64bGu1tZTJSZdfi/y0QBFY4v7ZmuKRItuS6k3/YzycbMOmTPNYurhcC?=
 =?us-ascii?Q?Xz+frc/n0pdW/ZChBL5Vp7whXqLm87BuVtoIbEtH4aHUY5Zfd0Y5wJvRnWB7?=
 =?us-ascii?Q?T91IanldWTVEpq4sCtrK57RWIsWfAJTajddBfAHS30ofqo78gCNKhTPey3od?=
 =?us-ascii?Q?B/BWhK1ALjs8U7MPJNYA7PFLufrkiLRFgzEpVj79VLJeKPq/KAXI6PrCvbgc?=
 =?us-ascii?Q?DH8kdYZCFxwua0XDszhxg+II98q0WpG1b3wE2O8jTyG40ryy3fjdlYKM14UA?=
 =?us-ascii?Q?pEscx1kXxhFya8SKxNwH1wY1iP7uYrEdeD5inbEoPPXFvkNl7uIzsuDyA3Lz?=
 =?us-ascii?Q?WL+YOz8xHoz7GcUQVKkn9qZpP5ID/jwO5aWp2eoCN+NhkFWLxWZn6r/M9Isd?=
 =?us-ascii?Q?+boiitkFSkXB/HytVXDADFj/C+LkRs/O4hipQRNmRwGEeb13YP8T3TSifiHc?=
 =?us-ascii?Q?8qdFYAv3H+EHQTN4UcoT58Nrzgf+U4w364Z+8sTfjOzSzbJQhpwN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e11611a-0d25-4efb-fcbb-08ded6e47d65
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 20:16:37.9436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEA4Bk9lVdndtCUbT2oRzG918n5i7q9HhFiDhF/gqv8J5VcQhd8OZWjQTQ+kwKGlB/arCmgAdKYGFxiARt58JsPFnNbGz6bGoCXo7sGVXwh+sEf0f5RW4J3HGzIx7K7M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9712

From: Frank Li <Frank.Li@nxp.com>

Both platforms are maintained by the same people, and the two entries
contain largely identical information. Maintaining separate entries adds
unnecessary duplication.

Additionally, the standalone Layerscape entry does not include the
imx@lists.linux.dev mailing list, causing Layerscape patches to miss
NXP's Patchwork instance. Consolidating the entries ensures patches for
both platforms are routed consistently and reduces future maintenance
overhead.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a99..31188163a8592 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2881,7 +2881,7 @@ W:	http://www.armlinux.org.uk/
 F:	arch/arm/include/asm/hardware/dec21285.h
 F:	arch/arm/mach-footbridge/
 
-ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
+ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHITECTURE
 M:	Frank Li <Frank.Li@nxp.com>
 M:	Sascha Hauer <s.hauer@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
@@ -2895,22 +2895,11 @@ F:	Documentation/devicetree/bindings/firmware/nxp*
 F:	arch/arm/boot/dts/nxp/
 F:	arch/arm64/boot/dts/freescale/
 X:	Documentation/devicetree/bindings/media/i2c/
-X:	arch/arm64/boot/dts/freescale/fsl-*
-X:	arch/arm64/boot/dts/freescale/qoriq-*
 X:	drivers/media/i2c/
 N:	imx
 N:	mxs
 N:	\bmxc[^\d]
 
-ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
-M:	Frank Li <Frank.Li@nxp.com>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
-F:	arch/arm/boot/dts/nxp/ls/
-F:	arch/arm64/boot/dts/freescale/fsl-*
-F:	arch/arm64/boot/dts/freescale/qoriq-*
-
 ARM/FREESCALE VYBRID ARM ARCHITECTURE
 M:	Frank Li <Frank.Li@nxp.com>
 M:	Sascha Hauer <s.hauer@pengutronix.de>
-- 
2.43.0

