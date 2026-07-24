Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5047B3EB0EC
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883715; cv=fail; b=Z6xaLZZ3fdo5DgJzqWiTkbm7A9FqOot+YV8y8zpL7xHNh/QcCdqlB/Vetaqa07HZRoGm24Hj6sXkdTQbQVrEBsAYeY7AwmR3RpmfOec+S/4Y2nhvRNxrM0XnKb6mtO6FAiMQAMIiloVcHI8A81fyrB+AWqpe8boZsPDEtle55PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883715; c=relaxed/simple;
	bh=IT5HStG/woZvqaV2fyfZvpYQ7NqJcwaA4ZTHKAQnrEE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QKYun0m9t5ZbI99i+mMkcBGZ4X6ktcqjrz821RfSXnuvINgnm4Axsmt0rw2HfYohDQQpUy4NMY4NHRCbq0uxuTjKBjrmwqz0MfqS57YCkB/r2hJQRly/2ZIVXtelfL605XS3dDagqhbIMAdbm0HQjSMuJ/BE58qJ4dM+i483dIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sqFXeV5h; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sqFXeV5h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FR5QLEnHpXdCWVD2d5ByWso42Gy0xLOWsI/YIxy7diIIT9k549wA+KSi5JnoRMqGoRmFIQMDsu6FkjJF8oeaBVFqqbmyvCpLxNaXTsk9v51V5CsDvgtuVwJgXCqqSi+f37EDuyYq3FxKWTVu+WDM6G0782a5s8naW8/DtejPjVSIRMq761d4fnD8/e2xzBlmNG1hCplm/QmHuTzItrWV1yww6b70TKyYaEtx+Xa4oPeltdYcK0W5mpbddClEIwHatzjjzTo9unrFNoxovxyzuDRTZ7ZxAQ7pgyXJGdTcnzSRM8qL1m1I5iGxloSNv+Zsy2jJ2CgvThlMFBdUkKkATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rifDLYlFhOijl5jvs6BcQ8+YqJqgU79BFT90QZHo078=;
 b=qI5hJeJ54ofpSP8q3vaoC2KC/f0gBBINCSYKnWW+cKDd6XJKLS2DxNUNDFinjQJyjn3hT5GGoc5dv8zarQSxqkonPqsS8JhbUJV+YIFC3IySW9QXh9CznAnrbtJWktLOYHVAtNecmn41EUbPj2AEJTTC2ABfjSFuiyyKESvdROL4RUb0h8ZXaLoy5CcNMXQ78APJQcUOuA9fb7HBZyj4j6yvO3ooS4ikMVR38S/j932K+sZ62UHOVCzKgzsSaVHORaQEV+rEVBE7VdET1ZfxDN3i0a98T20hsIjUJ5wdsv7QgMtV+fSVot7wS56ZwSd9e8fmRV6a9d97QdbfAxiAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rifDLYlFhOijl5jvs6BcQ8+YqJqgU79BFT90QZHo078=;
 b=sqFXeV5h7ZOyoCCWqoh3os8AT8hsz/GlEeQDRdJN8/1MgOFaHHhPeq/wuNhwQs5/fULR16ecp68M9RCWGZPtByH0ixtJBoa+ynO3y2RrXcF4fUM3OoTkr6G0m7okxe0xyhK9BrUjdjtUFnCr8PQ8RjWgs5pH5ZgBdVsXaYUL6/FRiXbXNRcYgE7BdSuDkJsK6Z5DL5VTvPSVEjdns949YjQ2pHSjPTDiRbvbbRNmTjWFkgClCcPVophaOL+ESl2skKrK3pbL97Oatk211/mc1sO2bm/JPVndCVezbc9f+iBPUedTVPY76HEmODkhNbQHt8poSMcWUnvfPqQUzTGcEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 09:01:50 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 09:01:50 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] irqchip/imx-irqsteer: Allow building as module
Date: Fri, 24 Jul 2026 18:01:36 +0900
Message-Id: <20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AS8PR04MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: b49831ef-ca66-496b-9986-08dee962327c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	7pfo+ZPE8ihad2Lv7LLAV0/hwEaK1fkQZ4E4mjqaQJW4qlemuyAjOLPVj5SR+6zV+M5x1YN71eWDz6YJRQfVpwJ+Zc4mPe+w+awGkgXYoyN8vB5CGNBlq1FT8bqGH9+AYovYjajrRTaw3e1/sGDHbZGQ96Ng0nUdsRF93MSo4dMWfacXOPSSaCO3EniTvT63hqgiJeQV1/pBBy/Y5+/rqYc21bKxzhw2nCPgBP3NqoLCkJYyL0qMafY0Y4PMGDdPvQXuSMSN4w3D8jBDQZRSvg9IOEmChGUejdVjmDW5adaKYHMRBBIcpbjbviYKESvhINjMagPRd0Vkpev7P9vOdpu62m3HkaBYa5rdLtAZwROlYKxAHVQCppl4ljXkQMrpLVQlVyzJpN7nGIhM0p3igo7yxFy0KjA/ya5bTtQYR9lZerC+zBdHYD3ghavmJ5dEvA3st/O6XAeezT/DKm0R8NMIWnjGHSbN+mOyLzKJLn23O2v0RZePLpfyiKycV3D8z7KTd74qieeNn29TvRElYVUdBjBsElpZ8R7AVl/q8L1ZOujW5fr27QLhEMZoxgN5muZcqBSkWBoXXlmXJFnKZqyBNa97WUlwaZIJdE5DjXvesTUIQv3KFo2laCCWXuvLdwUdrqK+4J98QztwFiDBiensOPhhOoVIK68m5ZnagwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kseR4zHC7Bf8Y/RSRZt/djcYjF2mN4EcW7RiSvRxPT+qUwYQ9DhmFBw2ushN?=
 =?us-ascii?Q?Vks7Ws0EoLiaCBwjC0nI+H103ftBdpBZL9b4hlY1pkethV73T3/AJVwVypg0?=
 =?us-ascii?Q?zzcqjl+7pGjVhL61STTq/qiK1dDe32TG2uYCB6xC5NhFg+HVamAnOEg16E+d?=
 =?us-ascii?Q?q82NeU6nhB+o+UtmvUjIlboX/P0vLrbiQmsY8nkSGaAJIiySjlB1E+o/RN+z?=
 =?us-ascii?Q?ImXKtcse86Bmg+DOUO7jZmKzo/QmaCjFh5a1uIhF7Wdn9vX5YQkh/qkuqCmA?=
 =?us-ascii?Q?1d6AD5IXPP1gz46XjEFhux6cSRAZC45uzG7CNR4Gk/iDjzHKilkrP6y6KA93?=
 =?us-ascii?Q?0md/K05p9krfg0+gQ0oJdhWvwJ/wzodqcHrL1auFexBC9V6Fo2KrVaXQg0ty?=
 =?us-ascii?Q?odta7+jZkCQCJhTYvh+9sTl44R0ntlveGI9cTW1JwxDNjkYevVkk8IRFIhxZ?=
 =?us-ascii?Q?0Bym3SGMR+RSM0i9Fe87nlP5EzGD/wjVPS1c26o1U5zgzGJPg33XGVakR1gk?=
 =?us-ascii?Q?fQw+lvHhERtpSz8c80prDN2OP3EIsN/mMxABAgo5GnaCPbAPoUps9LPehIqu?=
 =?us-ascii?Q?X6JhVCdFYufZziogeIfXhh3TAMjpyTNq+JHwHbhoHavRh9HHEmNDfP01SJSZ?=
 =?us-ascii?Q?E35qEpm3VVArObQtcTiYko/oHkTTHHavEnYECrl4HpC/6a+wxp3kGwxEFavB?=
 =?us-ascii?Q?VydROZGbz/rdLwY+UKfvAPapji/OJN3JtLff+d32bMRm4qrh+augja4wFc1+?=
 =?us-ascii?Q?we0alvZYCp5zrSxvlSJfHmsKYPQjw7NUveXwpG2yRPmYKZqcvs/B9giHCCUM?=
 =?us-ascii?Q?N/K9S0+cZcWIxlStm208efZ6BYnIfcYYMDaYhcYY5FQis3jtuOJl7iGvP/kZ?=
 =?us-ascii?Q?x9IFAPm1orSB8RXhLKuQQmq5EN0A/gSajWosNEvNC6G2LKrikFkuZ7gCJEkl?=
 =?us-ascii?Q?E/eHPdxQzJ5UBUO4VxD77MKoSy2nb33iLPiUZhpOmotN24dIKCi//OXgv+Zu?=
 =?us-ascii?Q?sHATcbSFDI2ex8pO5x/a53xkF5O/+V6cOZ1qGs5JqLmLhYIRQ9JAmb11zzuI?=
 =?us-ascii?Q?5UFroc+CRgFAzNhtqGrTPcqNWY9mOEEglsDEYgKGohC0smTCrpQhL8j1soZ8?=
 =?us-ascii?Q?nmOVENvxIqrgjUIZcwjE5P6TU8hO/17FsvQou9ujc7BnzZFDNlPNMXuXrVto?=
 =?us-ascii?Q?ChwlN95jjv1e+xxchistO+G2oLcAyJpUkOMp4RjSODX7fA8yvSxrbjBUjnNy?=
 =?us-ascii?Q?Dl+eg0nsGE2iEx1QJ4SUj7oYJROSzIicm9MvS1zIX6qjtFb9PXfZn/VK4/sO?=
 =?us-ascii?Q?OWTUnJrlbSDECE0TKYO/TAdLPi3V43r+Q413a0HkC1WqVUf8adBbEkbU7sQm?=
 =?us-ascii?Q?skB+EniHJKv9LN20Vj+JP5riuFss9oKrH+E87Rhc3ANhidOI1AOuWIOjWbRz?=
 =?us-ascii?Q?M37rPPLxPSDjmV8wraarCXb1aqisanyXpzVK97PuacrLax9UBKz154/6QSMy?=
 =?us-ascii?Q?Z6+J6ONjKBg5TnnRQWUsveJJcz7xhY0SZR1Z11LzSp6HdU/POn7HfhIN0Awa?=
 =?us-ascii?Q?pc5SJ0QxNIQ31+01Vx8mtpn9JTY3aMLHMm4j2aAPDpBjRNRJ3+1mgLKGNvKK?=
 =?us-ascii?Q?H5gFgsTrbnRnPjuMkiOOMks/2+2jO3kuMhZP4AHBR3P4ygMge1hyoKh3GkxO?=
 =?us-ascii?Q?SF67tb36eYfWFRt0+PIxf8werB+7RJG28Ldr153Sd+nuqmO3i+ud0zA8Vb0p?=
 =?us-ascii?Q?4GajFqIF2M7+D9CGC1xn0OB+e1rgpcYZJNXX4IBeTSn52W6HWQ8O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49831ef-ca66-496b-9986-08dee962327c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:01:49.9884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6xZWJVpE/CJvP/2wSnF4GWxtN+ZvuPa60hP7N+XSk5RuYxEhJI4mWfy4MExH2178eHVTUTqNbu/CmSAoYYOjw0i4SsMUJZ0KwveZ3Huq7YhLAGzvNLBnDspJZZZyhuc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278

From: Jindong Yue <jindong.yue@nxp.com>

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver().

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/Kconfig            | 2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 42f2278a702d..07db3b678f94 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -560,7 +560,7 @@ config CSKY_APB_INTC
 	  the controller's register.
 
 config IMX_IRQSTEER
-	bool "i.MX IRQSTEER support"
+	tristate "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
 	default y if ARCH_MXC || ARCH_S32
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..2365fc04596e 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -10,6 +10,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
@@ -349,6 +350,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] = {
 	{ .compatible = "nxp,s32n79-irqsteer",	.data = &s32n79_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
 
 static struct platform_driver imx_irqsteer_driver = {
 	.driver = {
@@ -359,4 +361,7 @@ static struct platform_driver imx_irqsteer_driver = {
 	.probe		= imx_irqsteer_probe,
 	.remove		= imx_irqsteer_remove,
 };
-builtin_platform_driver(imx_irqsteer_driver);
+module_platform_driver(imx_irqsteer_driver);
+
+MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

