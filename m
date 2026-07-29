Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0188C3ACA59
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 06:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306915; cv=fail; b=CkqBGFH+Lker5oggZNHW5xQ+Mcz8Wr4ajeLQo5eIFhflA6N9UPO4F65VJ0lQ+++S8y+gIT/eCGUW9an8pnUqA9G1PcSZ60U4jgwtSiOAQTVLLC7zUonkwAEqNNVYLypDz/+yTbdNi8VFC0BdBssuvyud1CROyduFJF770BAItGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306915; c=relaxed/simple;
	bh=clPFlvReav6O79pjj1T3T1+YqDFWzPQUtW5470EltDc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rOMDWypYSNrA24/ZDr+yw6AVX218ls46tJRIGw4A4sHW5QEfX5MqRzRkpKYgsx4SqeHUvn5T6PV3e0ZhxyEG42g5PWjjd+WLOM/Hqt3/6ncQHYXh/ylJbn+tZzFt7ho8b6yqBHLnTVXX5TrfLB9ZLlBgrtDpDLUcC9Yh+SF0iSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t64wynjU; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t64wynjU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9jbFRzzCQ518m0JzGyvux4cMNxLLNyTOqfMLcVhH2Q/0N0qbMVQMahR0/2TbHtnzFckvKssA4ddxnjX2bc+91B7QkRH7OHo/x55Gme806LxQak0dlWYFdC68yIN0IEf/2kc2xRiZQvf9uS9pBO2VBEijrH8SDtPwsmS8y9Wyuf2RWeXjBNmY+KZd2unbrI8OGKtXond0RE/slZadpTwaFWUGobVAPVPmTz2U8fp6yltbtYpZrAz/i19cnuMm4A0+gkHe+0TrLiladIhKTky2m+ZRt1mwSg/4qSPQe5BASkscMdnJVfCTM5mkMYsUMPBoSdcTPI4n0Q5ColRwfboJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxXxyS6vSoNelCf7YLei+zYmhlnKvZLyRoIlxUr2f/I=;
 b=fLUgQRtU+CugGBSMnex5mXo3MfzhCAI2mRkGHby4N+/6Ji9oZxEf/gVuz3Cvo9mOUVAuYjJpCuf0JtWoUl9XSAqqcERJVQGWe20ym4CuxhZKf/emrKO6kzr/LM7syoZZ+iTvt1xNCcTRqxZWAJWg60TE0PMW3UEjai+V9SubOQXaOtcT+3jaBoA245VfDYu37SgHQF7lZf4seS4pVvCYrQERQTTDSLE4pXZDRZvnBJWFVNHAjaKEtwYxYKXildJ684/Ct8W5n5w11msrRr4yxfVRe5VJB/+Cz86cnQ1J/5hj8ZtsEeHiCospcPThFcBdbB0TsFv/1ZDlwWFvfJPYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxXxyS6vSoNelCf7YLei+zYmhlnKvZLyRoIlxUr2f/I=;
 b=t64wynjUL4QmZBiYG4jhHPIqW2f0Ob6sGFfXAX67s2dhndT6pAyPkcfOePJFtqdnVvcBZBp2NmuNOaFYvdCgu/HTRB+3eI9y9rYx9bjCjcfKxu6LfHxB90EUNXtmOUR6OsBq2uqEr2Bt4YxUJb4xoszTacWgObFiU7eeS0+yO+5hYoOgWrC4Q+vmsqOg2ENVLovDdmbPmFb/PXdHM5CWObixPIRH6hbbmtCS7xglkLBNXTfs9i5daimlcDS0NstNXQLXcsrnw8Qw9LZTXHs5kjN1MfbOD329TKVLMpJhHrsXTzj9EGKlStm4FKmLIRg5Rw4u+LRiOAdGwJhgCEoe3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by MI9PR04MB826873.eurprd04.prod.outlook.com (2603:10a6:290:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:35:11 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 06:35:11 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 29 Jul 2026 14:38:31 +0800
Subject: [PATCH v7 2/6] phy: fsl-imx8mq-usb: set usb phy to be wakeup
 capable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx8mp-usb-phy-improvement-v7-2-c385ee40ade6@nxp.com>
References: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
In-Reply-To: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785307123; l=982;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=D0wWLgY2HWDKnzeRnHeMQBzDrrao5oRBZHMWkWcmGGY=;
 b=l1OiH1RAbXLU18fSLLvY/NQmdrefjPkaRXX5qjdXoqg5a9qUkGb/cPwjM018YKjF06MPG/M9A
 MJSJ3l/J8mQAUyt5Jr2gfE1FBaMToT3ZMhY6+HaMZYJG44ZzR71Y+aU
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To DU0PR04MB9418.eurprd04.prod.outlook.com
 (2603:10a6:10:359::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_|MI9PR04MB826873:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a890929-1a2a-4775-bb8c-08deed3b8a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9RSbzDUAIi0xvdwyY4Y0J3vw7XV2Lq/9qnh87hgVI3ld9RiWIrhaAPTNG4XiTt1LXZwtROP31T4exNsA0e+xZmg+ErCHZIYqib+BFRqwQFKHhv8dzRxFA37LpyeTkto0D7WnUWikdgv6y+kGCqY8P891fPBSmMSNcYirKLr43WjoqmRGYXq1cdAsNDlnjuvD2DAYmxXR4uUOtszedjlGs44gexu5kY7Z+e7koRarxy5yFJlijPpEOGODnq676TEIw153d/XvSjx4DzwBUIjCYHQdq5JGssV3DXIOQ4xWbRXfwlaErIGu+zB7arQa/1rT/cnEdLQ7xOvQKmy+bVOX4NTk3dcgbTc74+p2WWIJRReCcR3pjrLX0ummVbI57F3XirXqLUa2Zqow4+HzbGDKwhfhrpasckD/7GktE9I/tmHlwPi9AdhUZbdGZ7ZYS+4xEXyEQ4qVxCwF+Q1Py8CjmQA+bGc1McOE4r9uSRjme8Rnv0Weqo44ZuxTe2iurvKKCzGdP6HXPhjHtGM+Z+AbNM7iqsqrg1PidMysOhQ+3KXkT/Vd9VckONLsTxitPkqpl/cU2l4Vc5HkmKBcdwaE8cAN69lSrMcJzPwDp43L80Kij4x9QgTFZKBhodBu968lSJSqFj02dBMhIp6A7j8QKLG3Vd/G1O4rdP+qcqMOhOI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFZTK2JYT1VPdGFrMkl3ZHR4MW9mU3FyNWxWUXhwVjkzQlFGZ0RrNG9zd2Qr?=
 =?utf-8?B?YUpDVkkwQ2F5V2VwUi9kMEJnaG5KZG5BenYvaE5ocEcyQ0NnVUUwakdSdE9v?=
 =?utf-8?B?TGowZFE0RkRhVVFWc2xoaExCTGZPbU1uNDZIYlI0MnFTeG5jUWVNTElHYTUz?=
 =?utf-8?B?MGYzTEV0c2FPc05vZDY4MUFCR3RqNDZ2cW1IVzN4WkpiUUV3cnQyN2ZUSFJx?=
 =?utf-8?B?VUIybjJTdnFhSkczMUJ6Z0ZuN1NZNGdSQ05lUmhWSXJEVi83K2RxMVpmRzlI?=
 =?utf-8?B?eUQ0b2owcGJUVnFIRFZvZFNFaUQzcVFnYzNpOGJpZTN0SWFkK0xtM2RzRzc0?=
 =?utf-8?B?bjhOUWFUMUJrdlR5WG5wQ09haURwOUZ4VHNFOUNoU0tyZjJueGszY2hzbENP?=
 =?utf-8?B?NjFNbTNmNzNqSks1OEt4RkhLSlpTYkd4c1JIZG4zQ2RPOVU3bjd4c2ROb2tv?=
 =?utf-8?B?TzcwdEFCZXZaN2d4allnampoUXZrYlN0RG1qWnhuWW14UHFZS2ZRY0UzelBu?=
 =?utf-8?B?Yld3VmduNkdISUxhZmhsU1AwM3hOUmhrSG9kM1VkVnk1REo5aE1oYTg1VTZE?=
 =?utf-8?B?ZzM2c01zOFk5RHB3Y3UvOFArK3JwVCszTFFEa1IyYWRYaldtaFFmaU40QjRx?=
 =?utf-8?B?N05SbkZGbU55RGVab0loczNNZjFWaUNaME92Zk5MMUF3cGtsQ2F1M2JVSlZx?=
 =?utf-8?B?UVBKUlBUTzdWTy9jTnZtMm9Hbk5nWmJMUEhYT3Z4T1BHSmh1RnhMSC9vRXJs?=
 =?utf-8?B?UThoWlVJTmhXYWQvRlNDTnp3bWhhQzBsNUpFSDExbW1HeW9BQ29TQlhwUytZ?=
 =?utf-8?B?RVRvRkMzVE1mQ2VFVGZ1aTFxZnNpUnpvaG9LODV0NUpvTlZnOG1ibjU1dFd1?=
 =?utf-8?B?NDIwaHNjMlhLdWVzc2tyenB1d0ZCMnVnekNzV1RMQjZKMnE5ZE8xeVVGQzMw?=
 =?utf-8?B?UDRqT1FXSFhVaFFDVDJid2Jyc08rSlhoVVdGUDlHaG51Rk9TZWh3Rk5VS2xO?=
 =?utf-8?B?WlJVeG5aKzBScDd4cityZWRJRnBWZk5hVlZxei9nOGdwUVBYM0VqanpMOWFG?=
 =?utf-8?B?K1RvM2VHY2VFQ2pLd05WaTZWV1hyZTJqNVNING81YzMyNllnazJmcTA5eGIz?=
 =?utf-8?B?aFp6NXdWelVoNjYvU3B2WDhUeGdGSmw2Q1BKQWhYV3RNQndESWtWRlM0T0xT?=
 =?utf-8?B?b1FKbTlKL3FBV2phWGZYN20xUEdURDhINlF6a3lQVkFzcFNJQXdndU9CRUUz?=
 =?utf-8?B?WXpyYnRHNVhkU1AvellnMVF3U3JETE44VmZuaXlwc01DbVh5QnZBR0MyNjRa?=
 =?utf-8?B?ayt5blVsUjdnL0VkZmpHR1doQysyV2wyU3k1djJ6MVdLbnRvL3BaeGNoZzk0?=
 =?utf-8?B?bzdaZkMrbFZoS2krMnhBbmdzNVlKTjNwdTdmWllEWUdoUWZLOFpHVWphK0pw?=
 =?utf-8?B?bHNJQm9wREZUaWJnWHJlazhTYm5FcnFmUXBTVTBFR0hLZ3J5N2ptdFRwZ1ZL?=
 =?utf-8?B?Zmxyak9JczU5bkdZRjhVODA5SjdVa2p5OXdPRFF5MFE1SkdXR2RTaE4wdzVL?=
 =?utf-8?B?cUpLZlZKN2FHZ1hJemJUVHFaYnE0VHhOSm1TcjlEVUkyYXdHTDQzc0JrdEpa?=
 =?utf-8?B?cXE3d3VnZGw1SUk3cDlsaGlzN0tiY004Z2hIZnFWcW1Qb2p6RmlVZmhWWVlN?=
 =?utf-8?B?MDZ1eEtSNitJTnJaU202ck93ZDBqQklrZDNTMHJBWDZITGtGaDBBYlRQcVlN?=
 =?utf-8?B?Y3FjcXBWZnNiUzVWVU9qeWczRUFiUzhZbHVtandCZTJJd2NkdGlhWitWbnNF?=
 =?utf-8?B?dmt4UkJQTk1tSjcxK0pZZldScHl3OVJKaU92bU1UVzZmQU1CM01IQ1BsZjdw?=
 =?utf-8?B?QWM0cEJGdW16TElyY09QcWlWTlFsdEZVMWRDMFFoRTE0V2hsQmd6WC9OVmRm?=
 =?utf-8?B?YTdiSW9jeFdSUXEvMzlNcE14RnQ3YTdxMXJlQWFLNS9lWFVKc3l1Q1ZBYmlB?=
 =?utf-8?B?cWVoSVBKc2hoUGllaFpqcDV2UFlqZmQ3bHVEWDdEeUMyQ1l3em82ZWFzWVdo?=
 =?utf-8?B?MExYeUZubUJkNDF4SFVEbkgvZ3pNZEN0UVlKQTBJczJTM2tWb0RKWXF0WFBa?=
 =?utf-8?B?cGlVUDdKa0hDZUI1Q09UNjdBUUtlM1kzazZyZHVBczZOeSsrMGNzeDQ4dm8r?=
 =?utf-8?B?TElydDhhSlVaekowWEpZN055QzJxb2V2VlljZTZWZ3cvL0hxNUxJcDY5MVVH?=
 =?utf-8?B?Z1MyUEFyRjRLOHRRMVplc2Z6WWkrQjI5TlJ4bVFCZGhRdU1NZC9PaXBTbW0y?=
 =?utf-8?B?NlROSW9uQXFsQmlYR0ZwTjl5eXZZa2RJdlJaTWluL0lFT2RTcW9qdk9VbUZ5?=
 =?utf-8?Q?yftYePKkekvp5KbkASMG8R5+UbgzRpTuDSqqT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a890929-1a2a-4775-bb8c-08deed3b8a40
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 06:35:11.2985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DR4xTCiZ6496ghwo33MYucOM2vO+ZSh2RVJy5M80fNcuF0nZyupqG6CwmPlFVMLrOqApYHa027yyJXCxy4Aa9jSs/6kc4JdVPMWDk7QU7rDL2yxJt8We7SvSb4dCf9rc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB826873

From: Xu Yang <xu.yang_2@nxp.com>

Set PHY wakeup capable because this PHY supports remote wakeup function.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v7:
 - no changes
Changes in v6:
 - no changes
Changes in v5:
 - no changes
Changes in v4:
 - add Rb tag
Changes in v3:
 - no changes
Changes in v2:
 - no changes
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 9a33c06d6fc3..3a5788c609e1 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -728,6 +728,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	device_set_wakeup_capable(dev, true);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 

-- 
2.34.1

