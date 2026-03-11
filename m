Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CFA374193
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216744; cv=fail; b=QddClg9Sh0p7qpFnUYKmmJeu4+b3nyWpKw5WGV3ZPMhSncFzG5QLwbSVRepVviX8esBdLnK4N094Uqo/eLz1fEitsDobrCtefnOMXfByRReEzIIQBiNn8oQXDATS5gaxS7pLnmhNXi7wTnB2R/wiq2ant90YisZbfBdWLkhiDxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216744; c=relaxed/simple;
	bh=SjeOyhYJRF7dTqFLf2i9JV+7QPEX1irw95f6E7tOoJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vFzkfkKyyHgx49yP+6rKb7t88JQA+Jsqb3B8CcS4SIgm7cN4jKUAWjZTwyfnubKVC0seqmnZCKu3Z9IR5UzQXta4FarnqGfPY+5P4+T/g/DVP86HKCwWBcjvO/qn0XYo0laeF3+1jvrS3hEnJsc3RHbkfx8k3DT0MyJgRGXdrMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SEYH5JZv; arc=fail smtp.client-ip=52.101.72.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SEYH5JZv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLWegPhNF0WLWMB5UgiD7/xIUeox3NWxh3TTA/WVNfm/zPJA3OQ4O15A63bSntc/ZKSArPMQBM7jDPU3FL0+zVkWpBJLrHuR7hDtJ5I3oV7fwGNiJRx0/YkiZfvcrBGSzE5OXfkYmHLkkSDJuqlYa9LGFaNHjGEzTl/6g2orD/9AB/fiXtPxBXGF2EnF4yCvjL2eaQpLslV/RDyA/AUrmBkVL1Jhs39uVLVolfhR/BPZBtz62G3DikvS6hmoztlwdtZhph8LjL8TwqkDYVY9DWeZfgkGtVXY/2E4WGD5XHR5D/0Zw0D3Mc0gkJbWND/XBVoa3tr7cL20m1i1LMYV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjScJoQzvn5UoPKtIERDTO1WwgRenQRJmpfed5Rrq98=;
 b=dGeXAHPWh8/Xd0GWeFm9luh0w/XlZI7ViEb+cllDZvaQuGb+NsDdRAYjGLL8P3z8FleYRPpozaRbyqvxVkE8NsvQTSK5SBA+Jh4M8rWmBfkYGFVrtkhxt7LbpHdI6OXvsIWogG0Ukb0c57Pd0B0PfQMACQK5qrigTti/RPe2OzDR9Jv/nI511Obly9AZ2ZKh+ZiRfGAaeJldGrbDWrESxZLQQL7Yu2wcGCet8rKa12rCAMcLJrPPZKRHrS0HOjXOFGoIZOMabTbCGdCx/S43sUiuXhTyHwopOWH1d2l79WTYVMATn04GAmdCgBQqO8MsRVvcXmZf3+aJujDzL7FCPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjScJoQzvn5UoPKtIERDTO1WwgRenQRJmpfed5Rrq98=;
 b=SEYH5JZvtyEzjDGA9jvV8wLgZbttLAP9Rvv69KWgQTBHeY6cb+xnNfyNzzHla8OJxBTrxGXe9nv8GigxlYOU9SzbIIYG7zIDt/w0cx0dNcuP35JceklBb46TAkecu/mWr2IcJYBg4/Rx2DLOm/0D4U9lQGpCd+5VqNCwsdTUJmi7q/40Udvq08i0mWkcW/B1CvJRYTTg6uPyUcOl+tkuy0spitOOzF/OauEy3c4n17Av6H3+GiigaRePdGCmit0Q2yElwV0cTcFCWR8r4gU3kL0+2Dosr5xCE041QQar123vJUVr+/XUJ/DRKIhVNOL5X5cO8yTMv8tItDZR2rotZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS8PR04MB7559.eurprd04.prod.outlook.com (2603:10a6:20b:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 08:12:02 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:12:02 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: [PATCH v6 3/5] irqchip/imx-irqsteer: add NXP S32N79 support
Date: Wed, 11 Mar 2026 09:11:52 +0100
Message-ID: <20260311081154.381881-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS8PR04MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa06b98-6b40-411b-fd44-08de7f45e005
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Sc9Z6LsJQTW0IYw5GoARfbyRL2vPDsi13hg16+8CqsBI2tabag2EaKlRqpCgmfs0nZdjr4fmKV3FU208O1qxcw/BnsZVyh0REEhyVGTBcANCKtAx0IGp+31WywfeB3fl3Eu5lBMtpxjwo6zYW33qac0HhY93quALEY1Xg8HSlixqZ5PMBkn1vlgNYPGBLXJGCNbbtZ205ieVwd3oy77IVxy83h7Pm5LgfAeFIm51wkBwCPAu1hPPz6SNsoH1gzkpqlbMCqfhXaZopN/70N0AGnwf/pLvTz1iwlC4t2RRA5RJ0hAz0S65zj8r6LfVODkI32/0q0iAYCEXYwPDcVs0k6MSs/l8kuDcS3zGq0PNXFTl99qjeoYU/2Y+Wf5whTE/+bKt4oIe86Z9/FFUfT5W3vHg3G6yVklK+b24YRoDLz6c4j23C8kLqbsaQ3umq6o+n5CYl0A9fkteHvKONWJROOB6C4tPfbWJal0n3iqptyWrhstzb+VTs6gr6dQza0Q7m1BgiuzoXAYw4sdY/DSVJSRrg36XpCIhg8q4HYWtClxtG0qYLBj6J9ow5FgdxgxYFiMgn/RtEDjezSXLaAQitVcTb9Xzr/zPgq03xWRsPSHgToAgSPmTUtybnkUMfOG49DvXFp1my1Ue+9F9mvUfxNepdVp9hCv3URzro25VaozVR/m5o61MHAxH6GJg2Y0OHS8OdySzE+gBUEXur/+N24fyOabkmoMgZ84Wq+LYL+s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWlqbUhBNk11Smw3SGU0MGFGRWxad2JQYm40ZGMwR2ZITHVoaGwwUUhIRGts?=
 =?utf-8?B?VTRnVnY1RFhFV1gzNXFqSzFYdXNZZW1ZUE0zZk5jZEJzSnVpT05qYi9SUExP?=
 =?utf-8?B?RnpiUlpHUGdBUWZlbW1tR29ORlVXazhtQ2ZpOWNucHdqWllqd1Rrb3VXZG9l?=
 =?utf-8?B?QXYyRzJaRlRTQjJodFhiWmEweWZjajJiMURYUzdkSk5mSWhHZktSVklIa3Nk?=
 =?utf-8?B?K002UFAwbFdycUFGOFI4ZkhnOHY2RVNQV0IwTWZENi8zcElwY0swc0J6TFh3?=
 =?utf-8?B?cm5uYk9KRUdKUU9TQW1CT2dna3NQTnZqbCtXN21CZE1CQVlnVnIyc3dVbnd2?=
 =?utf-8?B?bVR4UU9RYXpiNXZLaThlMk5xYzBqTzRNaW1QUTkyM29xZmpORkdZWFUwZFVx?=
 =?utf-8?B?ZVIxN2loQkZ1MGQ0bCtzQlpoM2hoSGlhMFpkQWRZQmJ2cVhzVU5jRC9VWm9O?=
 =?utf-8?B?U3VwRTVPUVBsazVrcDNHZGRUcExLdmpIYVAyRVBrZHFvN0FwUG1hZHJmMmNt?=
 =?utf-8?B?MVdUVjN4cWZjbWlCNHUwWWVja1J5dXRUb0NxQXlVTGwrL1diWktNOWFMMmhD?=
 =?utf-8?B?ZHJITlN1QXVHaC9sZGFDZGhCWXZUaHlVQWF3eUhydXY2RldLWEFnREd1SnlQ?=
 =?utf-8?B?SGlyaHZxS3gwRURaVjNDdTlrOWVYU0w0cmdmbWxCb3ROMitGaHFJY1R4T2cv?=
 =?utf-8?B?WWl6OWx2TzRlSitsT3VESTg2RWd4WEhxOUtSWEhZM3VSZm93Y3c1b1FEZnJN?=
 =?utf-8?B?ays1ZHFBTHViYkxwcnFmNTUrSnh0N1pmUzRtWEwxOFJoV2I1OEhKV0JlVkFP?=
 =?utf-8?B?Mk1rNkEzdnMvTGRDTGU0ZlgzcmRyTjZjWm9qcVlUOGJIc0liZmFQMzZkKzdn?=
 =?utf-8?B?VkNnNGdjQkJQbjE4T05Ra3pKMDY3eFQyUTNTQ0NmaTRmY2ZJNFNNSEtKaUdZ?=
 =?utf-8?B?S2oxbS83QXQ0SVh6S2hUeGsrZHpUWUFWVWN2MHp2NFlyY2wwSFEzMnkyV3Zv?=
 =?utf-8?B?QkExeFRVTHBQZEZTb0krWnpIVkVycDdNTVFzQlIxN2dNZk5EN0NtdmgrUzJu?=
 =?utf-8?B?ek9RS0VGclRBcFRxYXRjekRNMzh4WGt0eGtIUUpYWVhsN2tIcmQ0Z1hZVnll?=
 =?utf-8?B?ckdDNEpNbnNNZVM2UUtNNUZtN0lObEJXckkvM2lxeFMwd1Zwb056WE53T01U?=
 =?utf-8?B?R0ZvMmxkNzB6aUtqNTVMWVFKMDQwTDlZMmFXOUlWR3p3alhyWmZWOG4wNFcz?=
 =?utf-8?B?eWF6WmdIK2pNWFRiRDhzMmNxdTVDY1kya3BNVjNFWjZ3OUE3L0xiNnVXcEVt?=
 =?utf-8?B?TlcvR2NQU2FhbGN2SGJZaEhKNkVxMm5maUtodzBDbFhiTHYwQmlxVmNUVDI4?=
 =?utf-8?B?bnd1NCtBbmNlTWhwNkR3K1JEY1lhMlBJQi9aZFNvUGZaZEk5eXlhU1B0RlJC?=
 =?utf-8?B?K0l6em9KeWp3WEkzbmVVbjc4R2hmK3RUWDBuVTRkbWl2NEtaYnQ2eW1aSlhC?=
 =?utf-8?B?bFhlRW8rZXMzTUZWR1pkZUtDbzlJNG5tTEovbGR1ZUtrcnZEQ0dBTHZpNVNJ?=
 =?utf-8?B?UmYrdzBWVVRYWHcyZ0o2UXBTVWdVWEJUcGU4bytCWjB0YlEzUEJqa0RObkFs?=
 =?utf-8?B?T0ZvZFpRL3BvcElLcHAwZDJXdjVWdStTVkV5TXpHcm8yWGgwWGtDQ0swdnBC?=
 =?utf-8?B?U28rRjhsNVJqdHkreUJhVmd6THMveUJXQURhZjRlY01FRnNiakwweHcxc0Rq?=
 =?utf-8?B?ZEZtNEl5RE1QSTFWL2krWXk2c2xBOGREbzhuL0drU01Bc2JnZDR3WnVRVkpD?=
 =?utf-8?B?WGFNZlhaWVRvWU5XOTR4UlNlMXFIaldOMHFBWE0zTFY1V0FxTWtvdnBVOElt?=
 =?utf-8?B?OXFNcDlBNUMwdERRaXg3N0J5emk0TjZ1SXhTMXN3djh1cU9yNndJdEFwK1ls?=
 =?utf-8?B?OThYVm5HSWVxTUhtenhVemxaOHVyZFlXUGdvVEp6VWNvNUtNM0dsNGxSYTBM?=
 =?utf-8?B?eEsrVlpiRVBZYVRyOGxRZFRUS0VxYml0ODhLYkJ1SlBGdWxZVkpkbzZwZlVS?=
 =?utf-8?B?eU52OXkwYm82TkRUb3cvQXB0YWxiYld4UkxWYzBaVUd4b1ZxckNycEtYd25j?=
 =?utf-8?B?dU1PenUzZ0g0cC8veEY2c295aS82cWZVQnZiODFoQWVyT29jaGZGU0JUZWU1?=
 =?utf-8?B?TXF2TXJqaTB1Rjd3S2N6VndZak12S3psR1BxYmNKMGJzMHA0SmduTlkrVUlz?=
 =?utf-8?B?OWc3Qzc1Sjh2cExENEFLcDUvZ3FOQ1JYV1hCTnRKYk5Wei9YN0dtTzg4ckdW?=
 =?utf-8?B?K2FVci80dDFqVlhoT3RmckYvQStIRmJnQlFEL09XNWxoV0I3Mk5HVTB2OElT?=
 =?utf-8?Q?ApVvyQqx+INaRYi4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa06b98-6b40-411b-fd44-08de7f45e005
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:12:02.3376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1FJqqjzOJfryaCQs8b/QEk7KdP47gfSN0PclzkGAQkPfVwjhd9jr/LPsf2XdhQ1sHyQPc1PfWC81D3Uzan++7zd+xdx54Gv7WpOf+Uu0t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7559

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add support for the interrupt steering controller found in NXP S32N79
series automotive SoCs.

The S32N79 IRQ_STEER variant differs from the i.MX version by not
implementing the CHANCTRL register. To handle this hardware difference,
introduce a device type data structure with quirks field. The
IRQSTEER_QUIRK_NO_CHANCTRL quirk skips CHANCTRL register access for S32N79
variants.

The interrupt routing functionality and register layout are otherwise
identical between the two variants.

Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/irqchip/Kconfig            |  6 ++--
 drivers/irqchip/irq-imx-irqsteer.c | 53 ++++++++++++++++++++++--------
 2 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index f07b00d7fef9..ad32a084afba 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -541,11 +541,11 @@ config CSKY_APB_INTC
 
 config IMX_IRQSTEER
 	bool "i.MX IRQSTEER support"
-	depends on ARCH_MXC || COMPILE_TEST
-	default ARCH_MXC
+	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
+	default y if ARCH_MXC || ARCH_S32
 	select IRQ_DOMAIN
 	help
-	  Support for the i.MX IRQSTEER interrupt multiplexer/remapper.
+	  Support for the i.MX and S32 IRQSTEER interrupt multiplexer/remapper.
 
 config IMX_INTMUX
 	bool "i.MX INTMUX support" if COMPILE_TEST
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 4682ce5bf8d3..fb3594b9a244 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -26,19 +26,38 @@
 
 #define CHAN_MAX_OUTPUT_INT	0xF
 
+/* SoC does not implement the CHANCTRL register */
+#define IRQSTEER_QUIRK_NO_CHANCTRL	BIT(0)
+
+struct irqsteer_devtype_data {
+	u32 quirks;
+};
+
 struct irqsteer_data {
-	void __iomem		*regs;
-	struct clk		*ipg_clk;
-	int			irq[CHAN_MAX_OUTPUT_INT];
-	int			irq_count;
-	raw_spinlock_t		lock;
-	int			reg_num;
-	int			channel;
-	struct irq_domain	*domain;
-	u32			*saved_reg;
-	struct device		*dev;
+	void __iomem				*regs;
+	struct clk				*ipg_clk;
+	int					irq[CHAN_MAX_OUTPUT_INT];
+	int					irq_count;
+	raw_spinlock_t				lock;
+	int					reg_num;
+	int					channel;
+	struct irq_domain			*domain;
+	u32					*saved_reg;
+	struct device				*dev;
+	const struct irqsteer_devtype_data	*devtype_data;
+};
+
+static const struct irqsteer_devtype_data imx_data = { };
+
+static const struct irqsteer_devtype_data s32n79_data = {
+	.quirks = IRQSTEER_QUIRK_NO_CHANCTRL,
 };
 
+static bool irqsteer_has_chanctrl(const struct irqsteer_devtype_data *data)
+{
+	return !(data->quirks & IRQSTEER_QUIRK_NO_CHANCTRL);
+}
+
 static int imx_irqsteer_get_reg_index(struct irqsteer_data *data,
 				      unsigned long irqnum)
 {
@@ -188,6 +207,10 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	data->devtype_data = device_get_match_data(&pdev->dev);
+	if (!data->devtype_data)
+		return dev_err_probe(&pdev->dev, -ENODEV, "failed to match device data\n");
+
 	/*
 	 * There is one output irq for each group of 64 inputs.
 	 * One register bit map can represent 32 input interrupts.
@@ -210,7 +233,8 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	}
 
 	/* steer all IRQs into configured channel */
-	writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
+	if (irqsteer_has_chanctrl(data->devtype_data))
+		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
 	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
 						&imx_irqsteer_domain_ops, data);
@@ -279,7 +303,9 @@ static void imx_irqsteer_restore_regs(struct irqsteer_data *data)
 {
 	int i;
 
-	writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
+	if (irqsteer_has_chanctrl(data->devtype_data))
+		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
+
 	for (i = 0; i < data->reg_num; i++)
 		writel_relaxed(data->saved_reg[i],
 			       data->regs + CHANMASK(i, data->reg_num));
@@ -319,7 +345,8 @@ static const struct dev_pm_ops imx_irqsteer_pm_ops = {
 };
 
 static const struct of_device_id imx_irqsteer_dt_ids[] = {
-	{ .compatible = "fsl,imx-irqsteer", },
+	{ .compatible = "fsl,imx-irqsteer",	.data = &imx_data },
+	{ .compatible = "nxp,s32n79-irqsteer",	.data = &s32n79_data },
 	{},
 };
 
-- 
2.43.0

