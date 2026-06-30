Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391683ED5B8
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814135; cv=fail; b=ZZWbYOgd569qpRjezFbfoD4gQR7JfgYo2vt7L861bnUYMDbDAAtzBnZMPBajoNzNEbvXEJr8/ZU9QgGyR+a/xjOCJ+aKPvyHecWt2ZMDOuj8leAxosV6ctBfkb5zVxeAonu0diZlsGzOTg+6lvho5+EFnWdHSmYw1+SAZaKI2HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814135; c=relaxed/simple;
	bh=62a19HIQ9ogQIIM9fBCekYSuhosSotYA4DgItpNuQfk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Cti3Bo7xknkjFymC8Nr4vKyuEVC+xOW+j9rs6MpnIQXlWHONiBEk7Dj6esMyXMWTOpOAZtFslZS79RX3XWCen5zam58spQS1f7+3mt6cnuiJMagZSbib39iE6REVQNE+P9Jy9TxGx4W4Z39ElIfLuJfY0Pj5z3BKJLUofczacyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UZT2qQs2; arc=fail smtp.client-ip=52.101.84.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UZT2qQs2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTsL/6FDatGUvSpk/0C/KEr0oQNNxgf4exS25pZd/zzXB4up/ZRfm+2tQAF93L6asqs1R3Pr06wpUi9dOtV/L4AeGDG3CX1Z7YdRlLklrmgdPIEXTkWMWlehxEEz++hj9gGs/sBOkuOrvFleBEE1/BIT8NSnSUgSPA2ya2BkCmEZfINiomAlHBvZxIAIQJySD6d81A82YeJmi2xMNZN2j70CzZAJVNPsHrBhyF3meZzCv8rCZVtGhfJwCCq2miiOt6plQZQ773W6R5ioiTaHoL9shhXmD7o5TPuiranOLTpa+swxYGOkEyY+2dtP0YihevUc0kWzS84JBXee4jvz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iASwOkjVCJPflYYww7d1iIHlcjwya6lSvQT+/sPCet8=;
 b=k6CiSuQYeJuBF9f7fpL+dAqCuIAfBEXCgbEjdw+q6fu3tCvD6Dmu+KhD2/dZ5Pf+rg3GRDxoe7/cPjqR2E8ab3HhC+rm13BQ01oePkLJtoGdjxxidd5SwXLkT3IWIoCLXaUeGAL0ihPhiMiYjOAKIGbbt5DtxUXvSxTAchNTakMZlPLJPeun6zwemij6d9S+p5WpxjBwFYKoloXH9tmiJ0gWEHVinfFrqEf7Wg2HiiQs3Gyh9rAdx5A8laCRhIAERmFGxDts/JZPHD/xYVCZz/SvV5hRke3w7Z0s73aqA3aXH40q8GiUULa8AaHZL2GUbLPqH8MH25vmDrqmjOHH8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iASwOkjVCJPflYYww7d1iIHlcjwya6lSvQT+/sPCet8=;
 b=UZT2qQs2dHaud9ovltXK6s6z8hiAAGfPqnImKYtvVTyyz86FKsg8m0CdNZ0WiX5yB7vvEgAjN4IA+FwQ4TvkoZOERuD5XoGK6wGRlz2ITGxTV1cKgMANJG4C9wcHgsN+6vnO8F4oe3hqONMrjdskgnegRczBeOFGXbtugxVX5/69RgcfGGrYftefCaGG0XTi0bqisAl8jm8NS2SYus+XyUNWCP9TWEQBSiOCBQ+23o1yaJ8uKBTqk0LXlhv4bWNhKv/UTy6WQKT4LsNDJJTN6O0smQ7EY9JAjWmQbtpek7TNIwArSYn/psl1zR417l0TtI1gicZ6ji7ll6u1j8YCHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GV1PR04MB10991.eurprd04.prod.outlook.com (2603:10a6:150:206::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:08:49 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:08:49 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Tue, 30 Jun 2026 18:11:32 +0800
Subject: [PATCH v5 5/5] phy: fsl-imx8mq-usb: keep PHY power domain runtime
 always-on for i.MX8MP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-imx8mp-usb-phy-improvement-v5-5-25d616403844@nxp.com>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
In-Reply-To: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782814305; l=2617;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=JKu8DXnOWmkloCSTmr6yfLcHIsED0rv46aK1FmJGTWc=;
 b=iczVn/BEl58Sg7BJSds6wMq/+jHIpw8j1rwiiuhY5X9ltvDZxd7aOYyI6Hh8WCgLswbSiG+Wb
 aHhfTQOjQv1AO0ktnbCAH2tjTgLAKq1VNUqTuz7EEJp9Zcy6NqdtoNn
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5P287CA0033.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::16) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GV1PR04MB10991:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba750de-2597-47ce-f990-08ded68f945a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	rnTzhcgycvAg1PviMHrl2q7KFCBMGZNscRdKwZsGTwcAm3SRjR+0ndPumO4f0K2UAkY754ke4Q5J9oMxMhoGzI9rNWhL3f2duptAuSIegsEhWSZ/Mh7Z4MPLIDZfcKsXp564zkFjta9t+zjhZIigHzqBX5D2gsJ71ETxpyiouf7QRUaCYAcs97Grydh/CwM4zLAkmkGpFjCnfNBARbtJFFRt8eir/v8NoFfIw9Pn3ikS2lv0yyj/HtSn5UUptmpJHPaJ+ZwVzYY2Go5URtVzpmN0U5dR6sAr6KRirZdbf4f5DW4HJoExcKwr98RC4yJyxm8jv6N9UPnX11kNiXzKS85q/6MmeezeWAPmBBiWIlN/VG/j9mNxsQuXhj9DMd347M3AWsnNUy1bQoVRqcSTmFuX6QGZRFk5UnRonHIMUb4ACotKPR2HojiE6fjFQR8bQMQr6bEqpE/kW/RV0yTqcV40d9/ILiPAV7wjgsGmMa8W3TsYpvqNf0kbz/TF33gkkEXx4q5dsrfq1Tl494U6NU/P5yD9EB2NkluUerBPKuF+1wNJpZg/trI/UDlDezCD8CoKlGCbZRK9hmiQCko6+JiptXe710Nvz4vth3DkIXfKYhXKgi7xDKkPaJw3c/GtdxMTs6jXSZCo0KfYXDH8NdOGDZVVYPd4Uo58Wn8+c5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWRydk0ya0luSUNJZlVMVXk4Y01WakpBT285L2lVb1dGc3lOR01hd3pQOXk3?=
 =?utf-8?B?YlRrTFpDaFREN1VPYXJoU2pUVWdhcVJtelFtVExIanFvaXVWSm1Xcmo5U2Ny?=
 =?utf-8?B?Y0MrT1g5Z1lJNzA4ODVnbng2S0ZNVklRcHNXdE9JdWpXQVZtd0RwYmlzS29W?=
 =?utf-8?B?dVMxL2l2WkdlZUZzeXlFYUpweS9KdzFEU25BWURQY2tsVWtDaUNySjRjWDZu?=
 =?utf-8?B?eVJGZDBDdzViQmgwc0lBNVRGdGpCMVpwYTJNalVyQU9KNmN1bU54dWs4RndY?=
 =?utf-8?B?RFRJZ2JuREVWZ21DWEorKzZqMVNSSWxIY2NHazQwSkRNRjlaQmtvaTg3Vldx?=
 =?utf-8?B?dlN4NmwxL0JKaFZYclM3K0MyWllHOVZwcEFHc1JMOFRYTUZkWmFjZEtqSTNU?=
 =?utf-8?B?T1RZQ1hsMTZCaktwU3gwSFNrK1BhdFBoeW14cnRzQjhYb2g3NEFya1ZuVHNn?=
 =?utf-8?B?RkhkMnJCc3Q5MDRUWE1Zdlc3L2dHNzZlUTlORFY0MjBoeEdCRm1zYmFJZ2Np?=
 =?utf-8?B?dExoMCtuVlI4TTY1eG83NUwxdjU1bzVTMEUzZkFnN2EveS9JOUZ4UUZRVFFX?=
 =?utf-8?B?STFwQ3lCcWlVL2syTTFFaDNqSUQzTGkwYVZuR0t0VzdWUnVwaGxtalU1RUoy?=
 =?utf-8?B?azlQTHljN1A1b0FKWUtqSUlORjRLbG9GOFJqRVFIV2Y0TjJMZG9udFNFMks0?=
 =?utf-8?B?SFgxcHA1MkoyS2M2WDcvYlhxb2FBTWVuK3ZoZG11eG40MnlVT0ZhNGw2MnJt?=
 =?utf-8?B?eXNMdTJuRlJOSExGeTljK3o0NUc2NnlNWFJjOGhQYVZlKzJZazlCSFk1OTg0?=
 =?utf-8?B?MWZxQ0RoSHNqcDB5cllFRmJQZmZRb2NxcnF5VTFFZ2s4T1pidjJpcWZxUGg3?=
 =?utf-8?B?SFdiT0NSMVAxZVVFMU9Zc25UODI3c1Brd1IvelVoN0pacUlqTlFJaTZ2MkIx?=
 =?utf-8?B?SDVzTGRub1ZSRTRJZmVvcU50T204dXFxRFJSSWk3TEtpTXUzNVlKLzFvUkl6?=
 =?utf-8?B?ZDdmcytEcXhReHJTTzNFWklmbytLSjdNOXFPL0t0Sm95ZVh2MHJqby9PQVBB?=
 =?utf-8?B?dEtkUDFiMEtEU283THpobllBS3BLUmNxSTBIVlJaMGdqa1N1Yng2VUFOUTJK?=
 =?utf-8?B?RXRGZ2dtTnpiV0piSGpHdy9TTlllYWhkelVpbGlXYlpKRjQ2S0pmZFMwNElt?=
 =?utf-8?B?RzVySUw4Sk9YdXgxRUtnVVFrTUEzdTZRdzZ4TzdrSFFYUlhhWnR1TFZoK1k5?=
 =?utf-8?B?OG5USlJZdTFVMjJOUXZTT1ZIVytONWkzeVB3YWMwWlh0MDNheVM1aHVUVVJa?=
 =?utf-8?B?My92SEFVQS9iODFTVW1jYWk4Vm8zanFCemV2ZEhUZzNoYVJxSUlRN2UwVnJE?=
 =?utf-8?B?NCtjVzQrWk5YVFA3d0hTcGs5TGxtcXhoWENEUit2dzAyQXdxazdvV0NVQ1Fs?=
 =?utf-8?B?RlF3dStISGhFcFQzS0NlWnNadmsrMGdCem9mbFBkTTlwQk5rUW5sdDMwSGMz?=
 =?utf-8?B?QmMwNzczaHM4VWhUeXBscHFvT2RQMURHSm5nRmQ5YlNNWTBBajBDV3U5Ukp6?=
 =?utf-8?B?N3FCV21aMldwcWNaRlhpem9WbDdoaVZiN2kzdjQzN2Y5L3FsaGNxazJUNFlQ?=
 =?utf-8?B?OGRXTjJVRVdaRE1haWhhcDZOL2lXS2xqc3hlZnVrc3JPYTVxRmpwVjluT0RM?=
 =?utf-8?B?WVRYL0M5cUpLN0JsZ0gvaFg5ZmlZUlExdWRKU0prOFpIT1B3OU9vSFZJazNu?=
 =?utf-8?B?RDVYb2IzUTdoUlVueThqZnFPbHFwQXdXNkZYWnVaL3hRQm9UTzNQSVR3V1hm?=
 =?utf-8?B?M1VOTWZBbDJLaFJxd00yeVpSTFpsWDNNL0gvTG9uQ0ViRXJRQnpVVWpESXBr?=
 =?utf-8?B?SGtYZXdIeHp0elNjd0JObEx0emlsa1M5SmhNcjE1cTc3T29nUVdJYnlibXM2?=
 =?utf-8?B?UEVBL3NEM09mSkJ0b0NjNGlGMkE5a3pTL2toSFFtN3FHN0tFRUtqc2tEMnZ2?=
 =?utf-8?B?d2FCWXJGeDVzZnRSai9uMXA4ajVyNXh4MGZ1aUdORUxYVldMMVRmODNVcFQy?=
 =?utf-8?B?N0xuNG9OdXI4cXRWSHd2M05LQWphSGFreWYrdkRxMTUzdk1TVzF2NldCWTlv?=
 =?utf-8?B?TElLYU0vNmQ2bUcyT2JBcmxtZkxML1RqaS9haTZUeW9XZ3lTOGx3c202VDFH?=
 =?utf-8?B?OWZJU25uV0VXU3NlazRuSE51SVFTaEQyaTd3bkVVNWVuaVNlY0t4eTJoYk84?=
 =?utf-8?B?UEU5bktXTHd1QmpxaUZtSUl3dW5ncDQ2WHRBUittRy9ZdFUwR1I3cTJuOTF6?=
 =?utf-8?B?Z3ROcXMxMGRidlVNT2xwM3pVT1RVNFV1UUM5Wnc4bmExREdyWC96NVRPZWhi?=
 =?utf-8?Q?VuE+1STHy27bP5t5aF9r+UIPD9uNdTCcBsGx/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba750de-2597-47ce-f990-08ded68f945a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:08:49.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgIAm7rXYRcQtrItful+8WCimjHamr+P9SmtOA+vwDanum94O5oCEtk/d5X6DbFx9LSLoEPUF6UMplcUwn3ep4MuSFkd7VeCZBsD/cLdjLumaHG2G6GlhQFeM0W5GCw4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10991

From: Xu Yang <xu.yang_2@nxp.com>

On i.MX8MP, the USB PHY has a dedicated power domain that was previously
never powered off at runtime. With the introduction of runtime PM support,
the power domain will be powered off if the device is runtime suspended,
which breaks USB wakeup functionality.

To preserve wakeup functionality, mark the PHY power domain as runtime
always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
new imx95_usb_phy_ops for i.MX95 and introduce usb_phy_is_imx8mp() helper
to identify i.MX8MP PHY instance.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - no changes
Changes in v4:
 - no changes
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 4949ec78d304..c9741b532663 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
@@ -660,13 +661,20 @@ static const struct phy_ops imx8mp_usb_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops imx95_usb_phy_ops = {
+	.init		= imx8mp_usb_phy_init,
+	.power_on	= imx8mq_phy_power_on,
+	.power_off	= imx8mq_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
 static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	{.compatible = "fsl,imx8mq-usb-phy",
 	 .data = &imx8mq_usb_phy_ops,},
 	{.compatible = "fsl,imx8mp-usb-phy",
 	 .data = &imx8mp_usb_phy_ops,},
 	{.compatible = "fsl,imx95-usb-phy",
-	 .data = &imx8mp_usb_phy_ops,},
+	 .data = &imx95_usb_phy_ops,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -679,6 +687,11 @@ static const struct regmap_config imx_cr_regmap_config = {
 	.max_register = 0x7,
 };
 
+static bool usb_phy_is_imx8mp(const void *data)
+{
+	return data == &imx8mp_usb_phy_ops;
+}
+
 static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -721,6 +734,9 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (!phy_ops)
 		return -EINVAL;
 
+	if (usb_phy_is_imx8mp(phy_ops))
+		dev_pm_genpd_rpm_always_on(dev, true);
+
 	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
 	if (IS_ERR(imx_phy->phy))
 		return PTR_ERR(imx_phy->phy);

-- 
2.34.1

