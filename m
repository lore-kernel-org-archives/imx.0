Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013012.outbound.protection.outlook.com [52.101.72.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788433A7F54
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306937; cv=fail; b=YVFwJNdQdM+JgT8Iae/nOFvGvvjklDz6UbO52mD6k9EEsS7Fj6Lvg7K1XzKQvjQ9AjoWK437fVqzyjhUv/QG7j5heCgGD/Hbo9aHicHOrIoIJvU8OsWHvjgzujr6qeK9YawQoeyI7xa5Y2relub50ktBAa/1wwjhNhh6aHXSGMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306937; c=relaxed/simple;
	bh=qTA0jKaJbQQ1XV9YOyP8tKzuIrJ99BsGbgDPO8NBigA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bw16I6q0UVlOa9PxVKjlHK/y5NgmZuBUdOMIW5LPA74TdKTu9yUJRjlx/8Woq2qEQcAZumCsJ1lTLu6Hy2C3EzR+OoDW+l+G2PqNM+sqUwRfTeMdR7ol1jALJP/4m3zfPeO86FHvnRUGAnABeurKGxPnsnA9X1hsNP0ULNXut/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cMtQ5RQJ; arc=fail smtp.client-ip=52.101.72.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cMtQ5RQJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjalCpaMFD+hnyksJ4rMUY+uE8ZsFN3UruhNTvm0r8V/E6ho5DnboTKIQtYEuc8LGmdmmpF/zKkFP+nRrqx4ZredCqW51wzyIRdQd8a4kOTM8PyohnEWNp7i6z4udeaGlL/vO1wAftGvIzSkyL+NQBW3uCyNSDPiaoJTDR7E47dYIgnwEyKpoA48tuEnd8i0JgP49587YHQO/L7q/pq9xpdX7olvwRc6jxJGHNClrsvApPspQtXT+9xxDNsmi80NWRtfwdClgRMvfEDkzU9u+OBP+lPDl8EYTSHWzB9KZIh38ICCL6UEAuScngMUMDoukG8iAhibl4hJOB4QIY3ywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+w/s3e7i3AxDsY4wnsHIaXw52a+LSHbhJRx9ncntV4=;
 b=koWQoPhtHOcMOjTc/bRD6mD3edp3J0ilYuxe2v/80u6JGAQPEdtckRPz/rH8Uvnq2tHwOjQPOOquUYSog3ovJF5qfoRbw97767RXOY3fpxCsze/QLW27gntrtGwI4EnNJFKDHRI7+cWiFYTIPpAiQUgmaiTB1CrTpDDsga1bIHLi2lq0QJOlKIseBjGha+oV9XMZOOyv+OBbQ+Nx+2ChAEnfEo21zGTvOYxHJPBEFpE3uZtt0K/T79lM0O0OSUaJl8xR5V/XfgzHtoK9WNdK7LiuyEU9o5pcP5s8CNX0MYvYBwauUB1PXbpku6N5HhD7DepScR/ZXtZV/J/qiVDx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+w/s3e7i3AxDsY4wnsHIaXw52a+LSHbhJRx9ncntV4=;
 b=cMtQ5RQJGAsTIid/vQ2e0KV24o2Zsc85axj+LqhwcKvTT0uqmbK4CtHbJS1qL8g+eZPiL8qUH2CJ3CeQwD4ORhDlovLNRoW/upwOIModZO6vWtOORr4rGsdhTRGLjUcuOyvuDLCTH1hz/AWaSanZBh2oJVtzMF6QMdu8Tu+sB8ESLUeHZ6OeGWrqnTHu0FkwEHR6IAXm8Py2+LSMOgxiyIbZnLLQqFhI93k9xcViuOXPHV8r+ganHU6KYiDYXI2WQ6km3+y8TxBRu+rKdU8PlrGQ9o3e/L5q92r+gYCJI8eZekLoPsr3VG4+Xo9EDlJWZCo5AkCK7MyB/s/9a9lAdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by MI9PR04MB826873.eurprd04.prod.outlook.com (2603:10a6:290:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:35:34 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 06:35:34 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 29 Jul 2026 14:38:35 +0800
Subject: [PATCH v7 6/6] phy: fsl-imx8mq-usb: keep PHY power domain runtime
 always-on for i.MX8MP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx8mp-usb-phy-improvement-v7-6-c385ee40ade6@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785307123; l=2288;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=8FsKpq6cQ0gmMFRs+Wte2UbQBOCdb55CEYNEcg+D4Og=;
 b=8T9iKgix+qb5QQKOSnBi+G6KcavvJ0XOLgxAMb8Zo4TIChjL/tShJKBnbsRQj7gyzMHU6LY68
 vdUbXjlzOSGAlP94GawK5tn8YukeqA8IqRskD3P/yBp83RiChlcl4qI
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2P153CA0020.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::7)
 To DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_|MI9PR04MB826873:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c5f2ac-0731-4aa1-159f-08deed3b97c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	waHqq+NWrhmHa1wKrtWpLx9zotobhMEtWZmpvOLabie29KbmckbeJ9BXpQro3dKC5SWoadbelaVwQKm0Jxxfh4IE0P6YZ0147BaVYmTjP48Qau3CuidRVkZZx78aAH3LAhgpL/FkiZoIntkItOX5p/8KR40dFCBSa8hCo7zQ2dByKBnBajONmMRrSHH9/oit9j3Zw2YEWLftJn9w8+NGQ6Wzh0Cm7fAsxgptyEgWF4fhHZTVrQvqtu+SkYLb7nOFdar53iN3lZZ3h4bGByCSg8WjId1cUGPhfRjSZ15w+dC6aML3fCy8nGlD1rFqJAC4jvTjB50sP6eQA/pz4dL6fnPKRDp5nYRO8C74P+uv6ExY6J7KeiFvP2UVe+quebCJZuNNdUDwCHkXMPG/xPKCvO48+MODoQyAaG6VoryyTMghfRd8Iabv4a3CmRkISnDFnw20D/Tgmm6Nsi0+ZJEw7n0PhwRk63VfVxYP/c0RPfHJOU+aD/anu0WeMUTIHOTf74+MBXE/jqVwL+PdvXJ0kN7vI/rxh+X79i15+/yWKDRt5+32n4iFH9OKew8tJFFCr9bMB/F4/LD8Qk0MLwFaYlZsrx7J327mlqDjXkrcLYrlXHEKvzJMiUxDQX3nzC38tp5fP4w2aX72EJwCJ/M8+0hhcQIYkeHc5WrVeZDzLGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWViQVcwNjAxUUxEcy9BR2Z2WDE1OFF1MFl0YmlsUDY0VDNSWWxWOXIvS2Rj?=
 =?utf-8?B?V3ZhYzZLWFhNNUt6WDZNL3U0TExPWU40bGlldFJqQlk1REtLdzd2eXNqZjIw?=
 =?utf-8?B?U2JrOW00cTdpdEo3SUdweWUvdmdZTkJXemJvUGIvaE8yRS8rTlg0VU9RYWlV?=
 =?utf-8?B?dVJkeEZyUzA5WTMxb2lERVBZdkFiSlZZOUpiMkk3MUpQNjYwQ0V3NDJmYW9K?=
 =?utf-8?B?ckVnanJQcU55TkV2aGl6dFovdEo2S01CTi9WOGg2TDIxOFdTSGQ0NXNFUlpB?=
 =?utf-8?B?M1BhNjMrL3JwMllCNk8rZFNEbzVLZ0FoOWlpb3cyenQyRk1xc1J4QUVXSTZw?=
 =?utf-8?B?UHh2U25peGVTREQzTnVtbWlBeDJPTFI3bW9hMjdIWjRzbzBoVTZPMy9CcVNk?=
 =?utf-8?B?S1kvNHZkR292UFh6ZGtXNSt1TXJTaFNpYVFPSGRHQTF5angzTTJWMzFTQTM3?=
 =?utf-8?B?Y2hianM0UkIwRjlPK1pyMGVwSE96SmdBSWZSTnRpQVp6M1RGekxPbWNSaGhm?=
 =?utf-8?B?UmxOcU5kME9MMjU2SHg5MVhUL2wzdEJib1BhUzNiWXBtK3U3MlRYRHp0N3Q3?=
 =?utf-8?B?M1J0VFJGRGtrOS8yZXhadVF3ZG80SFZXRGN0dnQydUF5SWcvcUVxRGN4SnBS?=
 =?utf-8?B?OGlBbzV2V1FNMVFVZno1amhCKzN1a2taS3NZeHRJckVkUGVnWTBZZmxhdnY4?=
 =?utf-8?B?M1BXT1VCdEFqNHhseHhVMUFCZWlkMTVoWnBZdWw4eDdQNzk4T0pWM2Vya1Vi?=
 =?utf-8?B?Tm1GOGlUVlJNWVhZb0hHYkhhRmtyL1Q3QTJHWWE2bVZKcFRFcldIN0hqc1Ar?=
 =?utf-8?B?VG5YVUZEeDB3U2hqWWlWNkJnUldHdHJHQ2ZWQkszSnZsZzZRSkw4R20zeHFB?=
 =?utf-8?B?K2RoQ0gxM05qdURaSnE0bUt4S1E2dVZ1eDdVY0ZBZ3NGaDRXMlF4aEVKdEx5?=
 =?utf-8?B?YW5BM2VYTWdvVjVsbjcrcGRKQTNYVzU2NXdKVVozT0JUei9SNHk2dGZPWWM0?=
 =?utf-8?B?ZGkyZEkxM1lrbWZEZXZQWEtOeWRRK3ZUM3R2VTdXazc2bjBlOGg0TXhjOGli?=
 =?utf-8?B?QmZBRDdaRDBoT2YvVEhXRGg1VlFBaHVHTE5LQ0UxNFVpNExaV0hCSHZTU0Vm?=
 =?utf-8?B?OElhWGRxaERhWFVVZzc4R2R5Uzc5QVJUQllWRC9OdERYd2JaRVdhL3ArYVZQ?=
 =?utf-8?B?L3BqVUE2Mmhha1puT3JNVjRkRWRSUHU1TFByamRrdCtuVW12dFVYWmJremgr?=
 =?utf-8?B?VWYvMkwzT1FzQUxFeVpyc0xQQjFHbVQrbklNZ3dQS1M2TWcxQTJ3NDB5MkxW?=
 =?utf-8?B?SHNqZHUrZng2aDkvTUhYelFIbDd0eGV5L3dwc0Jkc2dmYXp6T0hqaFNmUkc1?=
 =?utf-8?B?NWNJd2F4K3JkamNMejJhbkM4cGFpVFZvS3R2aTM2a3RLYjlJSlYvd0xRTmpP?=
 =?utf-8?B?RDB5T3RQRUVkLzdwZlFHYTRrd2M0OEE1OVNEVWk3ZTZzUWxOZ3VuL2xBWUNG?=
 =?utf-8?B?M05GckxGTUpMdVkzQjU0Yk9hZkZaQnQzMll1OTZRWGozd0VFTFRES2gyNjFl?=
 =?utf-8?B?SjhSNkw5YVFkTTUyMDdpRmJFRkFNcHU2aUU0SGY2WmxUUkhGdFg3NTk5S29D?=
 =?utf-8?B?aXZtYkNEeWpTYUJzS240eC93V2NEV1lHaG0zc1JTc002QjFXanJVZ25rMTZm?=
 =?utf-8?B?SDQrdFd6ZzJmdlpzNktna1NYOVNDWmZkMkY4cHd2UHVTMFVQMmRXNkkySDRa?=
 =?utf-8?B?S05VeTl1QWNOaURkaEptZkFwV0l2YzgvbUhpTE0zcno5UEYrQ1YvZ2c1TTFU?=
 =?utf-8?B?eDRNRmo5NHB5bUtBbkt0N3dLaWFLY3FEamRYSHZDcVpWbHBnTUVkMG5qemJm?=
 =?utf-8?B?ZVNYM1g3VE5zdGtWcTVjS1lGemYzaW9OYnlvQWt3Nzc5RXpGUkJmbUs1UWNT?=
 =?utf-8?B?N0wvYUpWalZFWS8rRTlXNmZ3NDFwMWExSERlRjdFbzE0QnJZcGJIb0F0MS9t?=
 =?utf-8?B?L1FoSnpnL1puUkNBT1ZGVDAwTXF6Smd2OG45TEw4NnQ2bGJQWG9qVkxvWVhJ?=
 =?utf-8?B?Q212ZStRVmhlWlJGc0V4OCt4bXFsaktjZW5RVnpJVjg3L1o3bWlnQk9Ea2Q5?=
 =?utf-8?B?TWNsRStkR1FlKzJ6TVFWd2l5M3ZvQ21BUktlVGttU2NUQXFScnJWdSt5V3dY?=
 =?utf-8?B?VzVJQ1NDRzNmM2ZZNVJDRFZZcm1ldVFteGluR2FXanYya1BrVit3bGd4KzhO?=
 =?utf-8?B?QlRCUGZXZGovMWU4ait6Z3pVc2xMOHR4UDNtYkY5ZTBnWkpwdkMrbXpKUWZV?=
 =?utf-8?B?dktXL0hJVEgreUpCaGtCTDV3cFdka3N2cGJwb1lSK0pMVlVtNW9FbmN5d1B1?=
 =?utf-8?Q?wm0U16QmKxKBO59F1PuFWTJ3Yrz6qygTPkmYi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c5f2ac-0731-4aa1-159f-08deed3b97c3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 06:35:33.9145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyyzkjtJRLh3dQKMkR1advHViacmFrL501i36AKT+20xgNu0PUE8F1RVHLS8/qd6U1QnKe/yJTSZ42Mn//xuVIEyfjmFERJtu2RiHx+xQJG4FMR7csjhqYBM7yTgamJm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB826873

From: Xu Yang <xu.yang_2@nxp.com>

On i.MX8MP, the USB PHY has a dedicated power domain that was previously
never powered off at runtime. With the introduction of runtime PM support,
the power domain will be powered off if the device is runtime suspended,
which breaks USB wakeup functionality.

To preserve wakeup functionality, mark the PHY power domain as runtime
always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
need_genpd_rpm_on to imx8mq_usb_phy_drvdata and set it as true for i.MX8MP.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v7:
 - replace dev_err_probe() with dev_warn()
Changes in v6:
 - set need_genpd_rpm_on flag for i.MX8MP and call dev_pm_genpd_rpm_always_on()
   if the flag is true
Changes in v5:
 - no changes
Changes in v4:
 - no changes
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index eda6064de005..f4260d6b85fe 100644
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
@@ -134,6 +135,7 @@ struct imx8mq_usb_phy {
 
 struct imx8mq_usb_phy_drvdata {
 	const struct phy_ops *ops;
+	bool need_genpd_rpm_on;
 };
 
 static void tca_blk_orientation_set(struct tca_blk *tca,
@@ -669,6 +671,7 @@ static const struct imx8mq_usb_phy_drvdata imx8mq_usb_phy_data = {
 
 static const struct imx8mq_usb_phy_drvdata imx8mp_usb_phy_data = {
 	.ops = &imx8mp_usb_phy_ops,
+	.need_genpd_rpm_on = true,
 };
 
 static const struct imx8mq_usb_phy_drvdata imx95_usb_phy_data = {
@@ -738,6 +741,12 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (!phy_data)
 		return -EINVAL;
 
+	if (phy_data->need_genpd_rpm_on) {
+		ret = dev_pm_genpd_rpm_always_on(dev, true);
+		if (ret && ret != -EOPNOTSUPP)
+			dev_warn(dev, "failed to set genpd rpm always on\n");
+	}
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 

-- 
2.34.1

