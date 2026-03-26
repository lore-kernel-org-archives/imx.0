Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDABA3AE6ED
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510063; cv=fail; b=aR+WoAl8ClgYAdyCST2f7BL1q3xr51gw2tJl+MVbWW9JcWoP9ZOBNqGwwd8uIPDioo7HZGzRM0O+zPdEUQ38BxnX3sakFnUxgPtVehu9kg/smM7OkLITRXXP30/hgFyFZKNCyRUUyVJUVW7u5EhMUBbkmwk4kMGCIO7Mq1ParZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510063; c=relaxed/simple;
	bh=m8F2A3Hb2H1Y8Q56Cn3CygKwy8Zj7wkEEsjnuT/FxYw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IZgf1KiguXe8iqW0iLil2ywqta8VzvlC3ye8wJORWSDrBoFca9xm8UItux9tIk4xTKxMUJhFPcp7FTrnjNWpKr8KEqIa5er0MZzXzpZ1NacR+jaUfJaGcWiUt1P8KuHC03uON4AfVQo9IOwYYOQHqvkdLRgYeg5TJ8buvTMTwe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pCwufoS/; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pCwufoS/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAffGVRsAzikkOYjkQ0uyuNFbi6Q00lR24pEDSebceZGPL0986unI18trTufR3qLSoWIcwAhUwfreb0LUAcuEt2ZH+Qel0PZvEGwgAvg9tiOuq9R3g1HORwUhPGe71KDY1vgvrrHGb3vcJpvPeeRw8rb3Pd+CPwIdiLe5UNme7LCKuZahM7BLOtwkAAQTrmAa9wSEDenPWX+J+tR7nltHhR10PxL+OrkVMdzAYl9mS+bAumvd64Ci9u6qKF7ENUti+vwczpC79rVyLLI6DDrv6+PpF1sk9C8RshO2g8qqKQFcSroDCkGALxxXSConZpohW2Av5ClGI40M4PM3IdVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hr25GuwmCcmWiqZI5KoO+03ATabOMzg+GG1QZXaDy6I=;
 b=fZEZzRznIxsZrgO1FUA6V8UeoPf/ZrW8ael9UWck1NYUYxmAIb41wFhfsnJPoNbbvFjAB+fd5TxKjE43UHNLkDRaZCihzwdshpgo0eCfF+Ky0HLHzFPsCGmsYWYJG/7B6s1KlbDT3/31JrsGleSy38TP+ToBosDO20fwq+h6YsS1YpFiDfVBK6SDgUTdNuS2GjKpmeFKT9He0bbgsK9eiFIK6SUTFzHOSTP/sBHo9mAa2EGz5l52HVe0eqJ9Id5s4XhE3gwZJfLYNtYNEKKpqsaJx0vsfQv1V8/Zdl/v0tPN88jIxWtWLyz5sAo9CXTbEi/3ZWENQ72Z5tucFHsO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hr25GuwmCcmWiqZI5KoO+03ATabOMzg+GG1QZXaDy6I=;
 b=pCwufoS/QprFerEwHCeIl8XtlRZPkf1yDQYUmQCWQVkSbyKCu9WNLrOGWXVeDklZhoGn8HisierL/sM730fewfpcWVbydYU00VwFU3CkICiGSnar4rwtSKvBMnRd0gnR0CrAmbtPBt7Qt1bSdLCqcaeANA7NQoHB892sbt4dVTvAWMtPoOZk8X/RHNJZrRfvYeySZopg8xcGbQDJT9j0zkNUZ/mrhPu8rqm6enqtCyoNXcdFfeRpmUWhLMJJspyk1WC9tGs/QB/sExfAjDDuvLuhDqVI7KufnF2eLR1FJBhCzLP6PukcoiwGqVq5ZqOq/xalL0L1sbKNHBT3qAS/1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:27:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:27:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:10 +0800
Subject: [PATCH v2 06/12] arm64: dts: imx8mp-edm-g: Correct PAD settings
 for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-6-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed1ed39-a2d2-4c79-ee5b-08de8b091999
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 u88sdpENq6fWW+/WqQ4rIE9uFGoqZL4zCcfUG6XobSMhmsW7oni4+OR7dxTlcEbfLWsSKBuRuAp1pNAV33gBjrL7+PS4nl3Y4IsKO+SVclYZlh6kr1BNITMwBucOw9S1gYOId65v7A9j6q+CjmE2i5LEDJiejIAgCWGRhMNhInDUfz7FIGk0okYaqY1Gz35C+zuIE4gtZRpt2j+dkAuO+CVxU2/TdL+ev+lDxc4i7VGymcJIEtuWlPDTL5nokHfWYBlmKjuH1gIOqh/GKUAJsqjQe8b5Fhnhkt5iJDFe1GfRkbXaonG2ii/xgz/WBR+lxILYS4bvp/LVFqOVTScF/9zMVvAhNrWyIY7KQRO/InewHpvt+EHAXjp/OxvRKv3zRfunFY7yoaplFrZngi6K8w4BIDZzyj8FDftw4E2OtI9/8hjv646uWU62uei7/8fMGOFk0VO36Qy0aKe62j7AwkXGyLtICP2+kZph0bF9Iu8pTzgH/TdFSuuZZK54fdg0UjK4T/8yLJN/+DQif+fzXYl+Q/kL44QgEcG6XUQUmWGz+EExJ++bsn5hGapbghRfSoXQTbwFmojFmjdxzBP/YzKmhc10pyxRlnIhWmigoL/mvd7gDeAknuqinjREjN0QQLYFTj6yzzv0Nt2dkMtNYZgJVb6VB4ZqUzx3tHpNLmAcukVMcLOUAW8sjy7aTWEbqsodpAPH2pZSA08wV4uVCZ1GZT9u75kGh+3g952A87EVA2pP6tIy4I3USu2b89a2yqHTP6vuNQ3sR6Is++rK4yp4+mQVIPWJDmuPPRdWREO6Nyb4l3cetL7R7A9jP41I
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bHpsUUpmL2VqR0pqa3pDZTE0OUJ2WWtCaU1oMlhCOVk5NHpyMEhPanQ2VDgw?=
 =?utf-8?B?OGdOTXloUFRQNVVDQm00YWdMOXlCaVJzb1VjRTdYeVhzNmtwd285TzBqRkJy?=
 =?utf-8?B?ZVV6b1AwYUV2dmpmUGVpVWZPT3NpVzZuU3dVUUhDRGo0MHFIVUNMSDdxT0xo?=
 =?utf-8?B?VFNaMjhQdEN4TStSY3NESExHQkRKbEhQSGIyTUxXQmNmWEVNR1FneS9iWkhl?=
 =?utf-8?B?b0FTMG5Jb0tUWUlnNFR5TWx2REUrLysySGNKWWJLcGtCYXR3YVd1OFY5Rmow?=
 =?utf-8?B?N1NZc1BKZmg4eTNVdCtmOHowSXQ3ck0yaDFLd0FjRktLWE5xRFlPYktQNjV3?=
 =?utf-8?B?cE41OTloVW92bE94MlRvS09wRUorbXAzb1d5anQreVNDSmhXRnRybmgrL2l3?=
 =?utf-8?B?MEp6RUNHajdZK1VlWkRzYXU0T2RSTzlRNXE0clZhQUJ4SlFjQXhmRzI5eTdp?=
 =?utf-8?B?WEJZKy8yQVVTZzBuNXJDczZxeExaVmxlQnlhQVc5ZHEyL2RRVlFaWXFHelpp?=
 =?utf-8?B?RkZCbHkxWUVLVnJ0QVczYU5HaXM1UEo2dDJSNDFZTHFzM200aEh4cGRiSHhZ?=
 =?utf-8?B?THp3QW03WGo1bGE4UGZndVgzMXdJWExRNUNWWk9JNlNLLzdNWjBwTWRpbEQ0?=
 =?utf-8?B?OUpBemdkL1pVTmlCWXNzMG52L01zaG4xcWh2dm05T2JCMmdHUElyVlR4TGk3?=
 =?utf-8?B?WmtPenJMT3NaazJhaHJIb1Y0MDZIdmJrbWpuc1JnQTNNc211OU91Tm1MMVVi?=
 =?utf-8?B?RGx6OXk3ck5iN3FCT1ltSmF2QzlkK0lVV05jTlQyZjUyaTZjYkZmWVdtcDZM?=
 =?utf-8?B?K3NjZG1GYlhHZVl3L2FRY2xkdGIvTGxheE5Xa3lMVUNOWVF0eXNnK0JGcmE1?=
 =?utf-8?B?TFlFNC90cmp1cThBa3RDT1l6TVJZbXVtMzNqNzc3RlBpMUlFZHhjdjB6QUN0?=
 =?utf-8?B?a3l4aVBYcHdPRTBDdmx3djJSaWVDR1JMang4R3FTQTFOdzRna2RraEdNYStr?=
 =?utf-8?B?RzY4bWlXMGJyclhtaHYwMmVqZ1hna0xOZVVmcytvYzRDK2c1UUk2SjhFa1d3?=
 =?utf-8?B?RnpvUzg1TTJQOWZJejlENnRkY0FaSmVLL1JhU21zSyszV0tlUUJuYkFnYlph?=
 =?utf-8?B?Z1hTZjlRU2Jyb3FQVkNCOFJPeloyZUFTUVZJQjBQRkhBcTZicURSZTNSeXZO?=
 =?utf-8?B?Ync2QUdnNmNmVjFXWTQ5TmVkekVDZ0JPNkR5WHYveEdqVXBLNlA4eHNXYlpx?=
 =?utf-8?B?UzBYL2phbmZaSnpKTmUxY3dPd1JTaVFqY1prTUVXcHIxeE1EWGlxeWpDSjRD?=
 =?utf-8?B?WUh6N0dXT01WT0RCTTk1SS9PVTdLOFpIVDh0WDV1Z1VlOXFFY2dMSXhBV0ZX?=
 =?utf-8?B?RkM2MkhvTHk2eFVIVEFLakFWbE9sNHNWTFpYVlorcDl3QlRtYW9OZnB6MHox?=
 =?utf-8?B?WEpkRmZ6a29vQ25ObHFZWktpY05jUzJTUUErOEhZY0xqTmswSDRpU1NIcytu?=
 =?utf-8?B?WTN3djBsSnFqK1lrdDN1UWRBbjJ4WnJtbFFjMzR1eGtZL2RvSnRscTIrNHlU?=
 =?utf-8?B?Y0dHaGJ2cDI5U0Y3bHRyNElIQTlqSTVpNll6cXJjRlFlQ3hhWUhscDY4dTh2?=
 =?utf-8?B?SytuYUczUnBGOGpESUxmV2V2QW43b3BsMnBLSHM5TUtZbkRYamxwdmk2Tm5L?=
 =?utf-8?B?dHMxNWtnRTFVck9OZ0lMOUo4cTE4Z201VlRRbHRWNDEweU13a2Nab2VvTEov?=
 =?utf-8?B?NnNkMlNFekh3Y3Z6MkhTQTM4L3dOcnlFWFJFZmp1ZUZ2K0xxWDYxWWp0QjBR?=
 =?utf-8?B?b09zTkVxZ0owN3hqclF4VkpJaXJvaWhkZFRLcnZ2UWhlWklaMWVENGloSld1?=
 =?utf-8?B?VE00SXh6d09RVDdnQU5hbExlMkhOR2poQThHaFdJS2FHdFVWM2dCK1dLRmF0?=
 =?utf-8?B?Y05vQW16Z1Q1SVhHVUt6bXg0UzFUeWVVeDhMZTV5OXBPeVNUcExvdFpVUUp1?=
 =?utf-8?B?b0VsRmE4Y3FuOUoyZDBrMFZDb2ZYRWhVWTdsSURqL0VyZDNOTHc0a25vcW5K?=
 =?utf-8?B?cjMrS0tncG52OCtIQVJSaDgyVmQrOGR1UlVJUkJlRHhYU056azFKVEFxdmkv?=
 =?utf-8?B?Nk91aGpmdThZYnYxalJiSEQ0dVFlZUNBQzlVa0pRQUVHa3BxV1RYS1ZBUDdY?=
 =?utf-8?B?TkRsMWtTR21DaGFIS01pUXJuZ0N6VHhVY1lOaFVRci9hM2lNN2tmZGV3Ukdv?=
 =?utf-8?B?WXNsOWlIYU1MV05aMTg3VG80UHFSN29hOUpROHMrdStyTVJTRm96aml4OWlD?=
 =?utf-8?B?anVZNGU3OWFweHRJbWpkM2xGSmxoc0Y2cGt1d0RkemlPL2RNY2R0dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed1ed39-a2d2-4c79-ee5b-08de8b091999
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:27:13.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBzEfSiQ9+/49MkKkIlAe1MHquuQkDgsIec+YyYgY6OjZUqwhoi1baS3n31tWzGupMXjsyY2KblI3BG6SUAM4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there might be interrupt storm for this board. Need to set PAD PUE and PU
together to make pull up work properly.

Fixes: 95e882c021c8b ("arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS SOM on WB-EDM-G carrier board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
index 3f1e0837f349fad22b94d553d8153982a87a4577..91b87a7248dd1ff57ef8b401d50cf18f4d54af6c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
@@ -563,7 +563,7 @@ MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01	0x41 /* PCIE RST */
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x1c0
 		>;
 	};
 

-- 
2.37.1

