Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4F448CF0
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115050; cv=fail; b=Qq1Ice5+J2rf2dYlwQj5u94yGhnMJd0bunFHhGH+CwSeXC2fhhRx0BMZ78mpxjQmdC/39zk2abrWYOrTqxWvfkTGWoi45dWxTCCQo8OY0BV58OxXz07LpXUQhKFo2A7tD+WaN3KpuFDL3VnacCtHnFNuT1E1dFn4i+jjkuVE21o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115050; c=relaxed/simple;
	bh=IY0/5UchTvmLkBkM+gm/jgtbO7oldhI4pY9VWE+buBw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pOugCk0pom5Fa/pQOqW7BkeRAqyn/262sXgeeTwNi3px7v/ZXhKpks+BGv/lKo6LC8zUkTyCor/kvrmHncDLfEaGstBq4Izyrz2gWELsltw6uFB7pOuvzbBA0aq8aOzL3QUMbNPWDrLOwftiVbbj8cN/IMiWjSVT6WmZkvww21E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Pt+KwgSE; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Pt+KwgSE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFLMfs2s+j+xTv794nMF2z1ZM3AB1pmPqld9o+yhjOsq7PWMR+1/CameeaGobdVa4YG59OTNy2AOSMAMD1ulyHCBk24On+iefeg0ezLKVHskQInjSmaigIe5Y8G86I41aZ2Nm9LiosUEH2pKwiA0U7b3GrMVVvYMqNHZmwS3auOwOBtLi5Q5g3rHATK0gmkYbVeiGf5v2hYdYZlMtNgmfwj0yCNMkV158UHKmJB6BqHm2pf/Km9ET/u/JWTBQ1xqtf/yFp3I+kV+O1s7+TsWtI+rhFEz6h67dF878oz+fnmV5e9n+yQUfn2WjLYQtSJ4Mr4q79nUgW4Q2BSnb4/4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GE4ZdNiPoX/rGDvvqfOVFs9PL0x24mOaRysPuT3h7k=;
 b=Z/hdeWHXnNtAePBGBpdr6wGgY/QF2QI1Q3h92fH4WraQB2N2fGP0E3xJQ/Dxxe9rq8a028CSjXi30E4xzRKQgLWfhfpC44BmwZpk31PAUaIjAGk1WeEujPlU8KgtkXcJvlNzTuOX1jXTPF0qrvq68orOIfLkg2+/5Uda+Nt+/DzAZE/02rxCjRNBdWkFMt7A+VnWWtmv8WUxLCxOenu+QXl4uKscANeWSc+6Z1fcsvmjbrde70hGFn1Ftmp0rO6pv//ODsyv9sk4i3wjMDqvhWiM0Q1XC2ZxeBMOJNesXjrt4AZ/OSvMPs7Sy0OSw8YveaTyWk502/EATo/Y+xWv7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GE4ZdNiPoX/rGDvvqfOVFs9PL0x24mOaRysPuT3h7k=;
 b=Pt+KwgSEBKTLA9amggiEylLUYPhYGS36Fq6iPDyxK8r3IRXQJwDaKr1jx/5GVfhcZzd6DWHzPP5dXUIyPCgOeT7DtIdygVAU7R2KUvLx69LSpOOHFo0U8Dg8sOpwTRNtlyAcSrN36YwWETcvo7VMKkH0K3ZG3rcq4mo/qTPfhKY4WN/Hvc4WFn+7FIw6ak29YJTRFr9uaeByIFjy8PbuLFntCCc8dvLS2Xq0IcUDBtIzMwWXGgIflTV8na2LgAbZxiu6a6CuATU1dGFbrdFOc0jRAezVn8j1PYkhy/LvyfaGj76s/yG61mwd+GntrxCf/rTCf4/RFSTm/nKdHKksaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DU2PR04MB8982.eurprd04.prod.outlook.com (2603:10a6:10:2e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 11:30:42 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 11:30:41 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 15 Jul 2026 19:33:58 +0800
Subject: [PATCH v6 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8mp-usb-phy-improvement-v6-3-00d95e270e4c@nxp.com>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784115243; l=5376;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=2PJGR/vJ3Tfanlg+aOx7QqQuD7zJCpHKv1688XqDnYA=;
 b=J+1hsicKComLPWdnI3PM1mfQ/t13VVfhu7HAdnFZNPi/IQUkqUXhf6WHrnwqk09hYgz2PTdbr
 cfd5qEFLD0hBTvLxUSpKAo/vh3annUv0cNGxi3pEMlFZw7gE+0JjixY
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DU2PR04MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5bb905-0195-40ea-7a82-08dee26480b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|10067099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	tUNUEn3lSQvgLzUfRcraNZnKAIMCwFqiQHQwRwgz31GeTxS7H0uyF7tTyxcRuPsmIcBCVcORky0N6Vm0YfhQvL11MwSKrHNsdiQGpXCFV7XRFXyxWDO6tpQwoHkw5Jd6mBcAXyJsOCb3gIJN23tD90c2ahmyBJbsiCg3iiu4XVLWU2OC6JP3wr9exJWHyTkfaVlNjEJjPtSzMLZ6s6iVhS1N69ISubupzVWYIaX3SLh8CInutdUXlhAPA0tezYhzfIx78yuLjgA/rskNYhh+KtVkDxfsl0qp4HGjroh/Bvs9swvc08k6QJYasWsAl5Pxb18AUfyxWLxDlfQVmJKCesqqE93xYkN4l594ko1OR+IeBrESEqS3vmIH2sN8c+0aFh+2meSbed216+ir31ZZvNx3Ldq37dWSswBRRivwq/uGt0kfKev+qy0+lrednYydWJlIqBBzcqiax18wnp4Zd89wdfVWiHW9QIFLERPS/w7WmqQKJ4y1tESgOXJ7AQ1aHkwvnZZtnYgHZxxz5PcPFofg+rynW3yi20zIYJRt3QAE6lfjC8bTu/4TqDAYef06PKRSSVnj535pQ2Xa9OFhOrVNBqqFhliaB05WWu20RFX+DLrg5Mhj5MDTnI/j6crk0dzW5ph4OlqiuUJCBihP3CtRWo5qKafd3whJx8Cj0Z4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjFMeENRaEU4S3ArcU5oVE1WZW9wQWZpRGxDdUp3c290SUhHWHZJalZyQ3Vs?=
 =?utf-8?B?d28welVWa2o4SlNNelB2d2pqOHEwMUlOdFF6VDAyKzNmYTY3T0FDaDFSVHFa?=
 =?utf-8?B?WEJ0dG1ydlJPVi9USHBBU1psMXJua3JJeGhKTFpIaTNna3B4NVFMblh0ZElW?=
 =?utf-8?B?V0ppbWRXNElyVDkwdEJkZm42MjA1dnpCSTdtT0VDejZvL3RVSVVrSVM5amtx?=
 =?utf-8?B?UWM4QktScG11Qm5uT2JXU3djRWZlQkVhZFd4VG40Qi8rREROc0w0TklaVzFH?=
 =?utf-8?B?S2tlRUtSc3ppaXN2OE1TYnpKTWJEWnpRaEtWYVgrTnpmSXl0WmVLV0hMNjkw?=
 =?utf-8?B?Q20zTUJYVTI2R3ZzbllaSEVZR2ZDaks1TlFLWXdZdmdRWjZtL3NPazhIalBa?=
 =?utf-8?B?UUpTWURiZFB1R0JTZnk3bzNReU9JSUkySW5hWGVNOXY0QS9uT1Q4L0Mxbnlr?=
 =?utf-8?B?WU5ILzdLV2krMjFGbGtRYTBVdXZPd1ZkUXJBNXRlNDdtcVJ0K0R2UHZCNDVz?=
 =?utf-8?B?c2daODRWaGUydlNRdnpkeE41SEtDTEZFaEE2UmxGS3ZabFRGWkdRRmxhNHNX?=
 =?utf-8?B?SUQyMzZQWGNHR1VEZ1VlR095WXVZWTlRbzd5NThiRzQrMnZPQVdpV3U5R05P?=
 =?utf-8?B?Y251Z09yNzlFbzlnSTdOblYxaGhjTjNvNjZlQ0hwYkNKSTNPbTMyWDFaSWhY?=
 =?utf-8?B?ZmtoT0UvV01HNGt0OHZtVjc2c2hHbHpYanQxVUpLeXBFdm13ZEhHLzE2emRG?=
 =?utf-8?B?ZGZaU2JSRlRmZU9CY3JTVkFaNFZlemdCaGh4K043V2QyVGl1RVZIS3BCNzhD?=
 =?utf-8?B?SjE3dGEwdU4yY0FHSGluWmJnNVJhY3dOMmswb1JWWEhSVnZlcGVkc2RNZldC?=
 =?utf-8?B?SzNOdkNOT3JqVFAvQ1dmdnYwTFkvdGlRRjA1bWZDNWE0NjFLaG8vQW1rSmxq?=
 =?utf-8?B?M1lQNkVEK1l5U1A3ZjJNcDRmbGxuYmxpcWFhMUlTTGxGZVA3WUUvekxPQlhq?=
 =?utf-8?B?SFk4TmdPOFlkekM1ZzAyaVpCNWdjOFNNRTFEUFAwdE1DK1pncnhpdS9FMkNt?=
 =?utf-8?B?eGhlU01QRkJVZjR3S1RkRjhVNDRjaCtPLy9aQmRwLytyZWlWNzBVZjVUOXZJ?=
 =?utf-8?B?UzBTelBhaFdXeVVjTDBPTmlqWXlaaHZFa202SWRoWC93dmxWeVN1NDJndjR4?=
 =?utf-8?B?Um1rRTB4djFqbFhIMWNOQXF1OTdWZk5YMUx5dis1NU9PUWI4ckxTbDNqRjgw?=
 =?utf-8?B?RTNsNTUreldoYTV4VWRYeE9yLzRBVmtselNtcWU2UTExY1ZxSTlBQ0p4WElP?=
 =?utf-8?B?QmM2b2RvcytSZnlJNlp5R3hOVWp5TktVMjlsTFFiRkhxUnhsZkRUNTFHbk9W?=
 =?utf-8?B?aVpKOHQweGJVREZyUWxJY3ZxbnF6bi84d1ZZb000L3F2TUdpK3NLeUUwSHBI?=
 =?utf-8?B?aFFDYjF3TmNNS0xPYVlEc0U3K1pXY0F0UVRqbEdCN0hwYkF1Z1ZYV0hHaVRB?=
 =?utf-8?B?WTZyN0RtMTU4WlJZbytaR2ZOb1BrS0FyU0V6ZDZoeWpTb0s3Z1F1Ynhidm0r?=
 =?utf-8?B?WEdhcWxQTHgybjNONExRbVJ2dlQ3NUFoSjFBdnE3TG5JQnF6SkY0RzVGcXNr?=
 =?utf-8?B?OE1JSEh4cjZ2TlpsTFhJZkJGSG5ZVnlWbWVLQjJncDVSWFo3dktodkJ0OCtw?=
 =?utf-8?B?QmNKQzdwRU1ubzlWNVcrd0dobGZNUVhCTVVZVEFEN2tCczd3eGsrdTRjeGMw?=
 =?utf-8?B?aFNxck14cjRtK1QzZXQ1eDEzU1U2NlBlc3kva0ZxZVlDajVhVlRkNXBwNVVS?=
 =?utf-8?B?S3kxL2lZb0JXZEdPb3V0Tk1SMmJYRkxzanNLQWpKWHF0V0Npd3VhM21Tdms3?=
 =?utf-8?B?WGk5bkx6emlqWmMwSFJVcWtYVVJzOFR4VGhUcUNqcXg0d0RzNFVTS1VZNnVE?=
 =?utf-8?B?T2FnNVI4eE8wRnVjWHJXT2dxaDNuSkVQTkpzOUJnSFQrZ1BQTnZiL3RCbGlh?=
 =?utf-8?B?eDJTZmNHalpBdmdjRE5tOWZYK2dldEdaNVhCaXg2bS9zcEZQQ3VQY3J1ZjE0?=
 =?utf-8?B?YjJwUXJaR3VuZFk5MGxhRi9aaExZSEthdlhCcDc1SFJxeldBODAvYVRRWHkw?=
 =?utf-8?B?RWlkQzNsTitSVmswV0RpQWpicTF0V2Q5QkdMTEFWNGhlMjhQYXlZZDhVM3NH?=
 =?utf-8?B?Q2N4MGpoU2RPczNPRkdBTGxHUUMzemVZSkR1WWoyWVZ6amxUTnRwdWV0Qkp0?=
 =?utf-8?B?em53SjQ1MmQ1UGpxWFhRVW9WQm96N0V6YnFTaWFvZ0xTNXQ1aTFaL1pCWHBl?=
 =?utf-8?B?TFZMNnkvTjZBb1l5NkhsR1krRExOVjVZV2ZHbllWbEFFYkxLREgydGx6blZ3?=
 =?utf-8?Q?btfxVbDzIUFjmqsD03B1/wQuan2h4r7gNAJOJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5bb905-0195-40ea-7a82-08dee26480b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 11:30:41.8282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAO3AuuVIgjmS9e6romtG5Cba66XVj+N5arB7wIPPWC9rUHXGyLT9MRHFnMG7o57x5RdaaVWQNrAjMOtsar1moosiL576Rr3Wf0fDw3v1rxMUIiAE63YLaOdO26vDG+R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8982

From: Xu Yang <xu.yang_2@nxp.com>

Add runtime PM to ensure the PHY is properly powered and clocked during
register access, preventing potential system hangs.

It guards register access in the following scenarios:
- PHY operations: init() and power_on/off() callbacks are guarded by
  phy core
- Type-C orientation switching when PHY/Controller are suspended which
  needs explicitly care
- Future PHY control port register regmap debugfs access

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - use devm_pm_runtime_enable() to disable runtime PM when probe fails
 - simply pm_runtime_get_sync/disable/put_noidle() to pm_runtime_resume()
Changes in v5:
 - use non-devm PM runtime callback to correctly enable/disable clocks
   when unbind the device
Changes in v4:
 - replace guard() with PM_RUNTIME_ACQUIRE()
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 67 +++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 3a5788c609e1..bc804d2b5aee 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/typec_mux.h>
 
@@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
 {
 	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
 	struct tca_blk *tca = imx_phy->tca;
-	int ret;
 
 	if (tca->orientation == orientation)
 		return 0;
 
-	ret = clk_prepare_enable(imx_phy->clk);
-	if (ret)
-		return ret;
+	PM_RUNTIME_ACQUIRE(&imx_phy->phy->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return -ENXIO;
 
 	tca_blk_orientation_set(tca, orientation);
-	clk_disable_unprepare(imx_phy->clk);
 
 	return 0;
 }
@@ -620,16 +619,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(imx_phy->clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(imx_phy->alt_clk);
-	if (ret) {
-		clk_disable_unprepare(imx_phy->clk);
-		return ret;
-	}
-
 	/* Disable rx term override */
 	value = readl(imx_phy->base + PHY_CTRL6);
 	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
@@ -648,8 +637,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
 	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
 	writel(value, imx_phy->base + PHY_CTRL6);
 
-	clk_disable_unprepare(imx_phy->alt_clk);
-	clk_disable_unprepare(imx_phy->clk);
 	regulator_disable(imx_phy->vbus);
 
 	return 0;
@@ -686,6 +673,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct imx8mq_usb_phy *imx_phy;
 	const struct phy_ops *phy_ops;
+	int ret;
 
 	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
 	if (!imx_phy)
@@ -693,13 +681,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imx_phy);
 
-	imx_phy->clk = devm_clk_get(dev, "phy");
+	imx_phy->clk = devm_clk_get_enabled(dev, "phy");
 	if (IS_ERR(imx_phy->clk)) {
 		dev_err(dev, "failed to get imx8mq usb phy clock\n");
 		return PTR_ERR(imx_phy->clk);
 	}
 
-	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
+	imx_phy->alt_clk = devm_clk_get_optional_enabled(dev, "alt");
 	if (IS_ERR(imx_phy->alt_clk))
 		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
 				    "Failed to get alt clk\n");
@@ -708,6 +696,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	pm_runtime_set_active(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable runtime PM\n");
+
 	phy_ops = of_device_get_match_data(dev);
 	if (!phy_ops)
 		return -EINVAL;
@@ -737,15 +730,51 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 static void imx8mq_usb_phy_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+
+	/* To allow devm-managed resources to be released cleanly */
+	if (pm_runtime_suspended(dev))
+		pm_runtime_resume(dev);
+}
+
+static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
+{
+	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(imx_phy->alt_clk);
+	clk_disable_unprepare(imx_phy->clk);
 
+	return 0;
 }
 
+static int imx8mq_usb_phy_runtime_resume(struct device *dev)
+{
+	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(imx_phy->clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(imx_phy->alt_clk);
+	if (ret) {
+		clk_disable_unprepare(imx_phy->clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(imx8mq_usb_phy_pm_ops, imx8mq_usb_phy_runtime_suspend,
+				 imx8mq_usb_phy_runtime_resume, NULL);
+
 static struct platform_driver imx8mq_usb_phy_driver = {
 	.probe	= imx8mq_usb_phy_probe,
 	.remove = imx8mq_usb_phy_remove,
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,
+		.pm = pm_ptr(&imx8mq_usb_phy_pm_ops),
 		.suppress_bind_attrs = true,
 	}
 };

-- 
2.34.1

