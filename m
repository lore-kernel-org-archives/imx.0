Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557AF2DAFDE
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 10:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558741; cv=fail; b=P/AT2mK9aSrmiCDgNTiS2ZLUpDLXmsrBdog+iUikRGP5D9T/fOY8r2DcuNqJHt+9fOj1yISVQ4buCZUj0zXte6rfg8K9tnnEHwJvyburS1rMDuGycMGOwfwf2Q9E8KzgK/PtfVczklXA+u0VaLrsYD7q7HW7x6lLIDCcQKyZfSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558741; c=relaxed/simple;
	bh=gfKjxaB57+nTPKUKZD69zwHwLZU5WS3N5JaTSv1nq5M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AVGoY86zdVy6CR3eJP1So/Gz24FjSGeHxsxW/Hbl15er6MLgeDXzmHU/l7L3EKSbmhFshBg9ipt5GMMWwf5qhnXtM+m9kk2VbiN8D/dNgVAF6jOQbF/FmqYG76/+PopWzA4oi7S6JEw40ut1Axags/hNQMcObcLUk8jhCnJhJmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SR36u2JX; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SR36u2JX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZnEO5hWpQrpyA0juW7fmb+haEx7yTwEXcIUy/3vMx0SBUgdWnKNV5m8GBqpJy9VC1jzkzEAkufuXg1OeulPzkKUzftBjCDfFZd9UjDUTS5DS8yC8gHUWQXLIwgCdG0PCpT25qtftGzO67sGJguxVPMtXq+7GLlvThAcwKkX24gE1yal5cEM3f4E2Fkmi89bhKQFVY3QiL3Gxj6dePBoOvVr+FG26FNqZmCd52V6bHS26g91PMr0h2EBHTXijlYqn56+GH2YUjs5YS2LwWjXLYRSHlPOrmrdU4l5iMBBOHbxKMKW5jLTAoU6sO/vrGuJwmt7zFzKHRGwpptbn2ETaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPWPKrusARvZo9bcLDmfsx4WNdRcrKUYne/89kQC3K4=;
 b=QHT8Jqx4XzOyMU4J5MGeudWKA9dzwnspnN6+TdpvmcLc6zrZhlHPub+cvfMEE3uadARuO2g2jJS5p3lw4S6RUw5HLQf20fUEjR55jEy80HHIfcEPm8mx7so93ZhQ5R/yjPMStsAk0XsAoXMwK1MQFq5OgjXYDEUx05dURa7dBUzN0HEF55unfrZm4Nh/SWl8Dnm1M5GlkWLA+N4rb16ARSK+4oil/iX7W5olyhd13VOYGTQ/flAFFYo+ILp0jzZJ5ybFmLb8fwbCPgsnWf9u+NLnQiRe9pOCw9hXWUlpee4eoVeojbP4LmjyweJviR6YPdnLV1r5I07g2PQ7iLhiug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPWPKrusARvZo9bcLDmfsx4WNdRcrKUYne/89kQC3K4=;
 b=SR36u2JX4JCvnuF/Kb+/OOn3Wc+L9AqeaBZoPLlSDYRhRB4jtTUogiuAunV677+75AsiWVYRuu3C4GrW+Wz9YMReGfOtbBWaWrPH/jXgLhbG6Z3JrRi5G4YPjcxR4LQESr+Cbf57zLd+0culRLzVKm6wsDGDxmsCIdtC1ECbjhzAcT0eMrKyHRVMlrmmFIPWqCdobkI5hRLahUGGzVuAk6dQSysJh90XTfzCj0VnXAyROL2/6zafWXUpITnQ3LwqsEgY0l1uI2qWmvkG3pdAZ+igksH9e0wS0SE4eX73eTGf8mE6jM0Zo4WvWC7bSxl5FMVt9osTCHNfJpX/PUPLbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9807.eurprd04.prod.outlook.com (2603:10a6:102:384::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 10:18:56 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 10:18:56 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] phy: fsl-imx8mq-usb: enable RX Termination override
Date: Fri, 16 Jan 2026 18:18:35 +0800
Message-Id: <20260116101835.1810675-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9807:EE_
X-MS-Office365-Filtering-Correlation-Id: f8276e45-db03-4353-aa57-08de54e8a830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h9F4Wpa+IodecB+EgtC2PDvem4UJuFKbIlkji06XTuhKixOtWBkrGH/Kqnpu?=
 =?us-ascii?Q?62zW8HQgDgEDZEUJP5DYZRmTXhHfcjI3gyzpM7/VTT5g+dVXIp7Mya3i7mRf?=
 =?us-ascii?Q?GLSPXVgOYuPFqRKFXvcMLphpHsVjOxawdSkpRb1Prkm0xvBr0mab7uorXvq5?=
 =?us-ascii?Q?Ejm7X3UfbGFXSBXfk5L1yyvci1Ydrc8SKDM91BX2pAwt24dEzW6SOFbxu5pi?=
 =?us-ascii?Q?P8lVMK0b7essFJxP+OnaSsEATz0oVT0oPZbrq2ot1oIToV0nv/bOCn3TinPO?=
 =?us-ascii?Q?oNr3TBPZZftBIEtTBKn/URwMMxubM6nQhKCtNZsgTVhIEyC/1QjKTtySbE0F?=
 =?us-ascii?Q?4qsASHXVYNqHAfOtu2lNG8UqztA6FgEZTlSqcYudMVJwPIkuWHJwUNO6k+v7?=
 =?us-ascii?Q?N+4ym0kS8eygfNpdbY7UfQlbJJj6bMxsiJYs01t/f0Ep04btlJeKXvcVBtHt?=
 =?us-ascii?Q?eCw6V1HKsB4+uQXFv4VrSCJB9lQWLAojYARV3fDjMcnPU8Wtw//CqNyam98Z?=
 =?us-ascii?Q?2nAsQZurWIkjQzSOzU9oUB+d1m7hVqsjwVwi8iCcx+AbSr6W1/WTYeMvlRel?=
 =?us-ascii?Q?NW9yvtnvfSJJP1PPflHfpJhftHJaoZVQyTPTHypCarqS4x+SzE2TupnYyqPo?=
 =?us-ascii?Q?W5r3u5RVNhcb3XO3h//cHeUpAORUePyMr+5ZaxRCvK1r41j8VzGNoJvUk6X9?=
 =?us-ascii?Q?HFvX2Vg3pEHPItMiMlXUAp3SL/kHHr48Pv+5VLGU4+XGxJhF20nVRtq1PfRv?=
 =?us-ascii?Q?UBeX7Gxqlk1Q2i98kCTrbmjzIutzlvJdYdnwaBIrspViCDksw7vXl2aL9KJe?=
 =?us-ascii?Q?MQ/jFvsgKHaRXMVcP79vFo5LdSJ+GaBks1JnRG9gvFns2ejlfljg02d8qdD0?=
 =?us-ascii?Q?wtQ/4eQvIn84+3XOIqjftbekY/XZ6T0PvN2kEbRd1r16CorLJWjRjJFv62Qc?=
 =?us-ascii?Q?X2mWxrOXM4hdtF9/AYBmDKi7derCTSeuHAJ9p/JTNFLOUBbkzqlkXQRYAFUf?=
 =?us-ascii?Q?EZtu0rQJ2KxDkEZnTIiFsx3qExwnqSKgjVJEMoc/bb7WFe597mKgoVn9uY9M?=
 =?us-ascii?Q?2lri8lICGmkV9G68xgQ93WTGicuEVflqAxETqy9FrTo7Pt8lOftMKTq7KgzP?=
 =?us-ascii?Q?tWjIAxoZJrah010LsWQkOZrdNo8RBDiXIM4PhMKVXcoG0Dh7aGl59T5y6KY3?=
 =?us-ascii?Q?ap9uKp0g/4UlDeHiwQdRUshqeFcAQUqBb6nnDX5guK248Zung1hdn6dIiGGN?=
 =?us-ascii?Q?zNlnCm8T3lXrChoAVI2UhwS77jPabWUulvr+liHYMXOVEXOeiY3I+13Iiw82?=
 =?us-ascii?Q?8VMqpFh7Z5PnPh1tLIV0pPKTVPsWlabdbzrRoQkyM7UZwDUcz7FNmDHlqWNl?=
 =?us-ascii?Q?Bzoawvk7pdGn0apJi0d9mmAkLxiTpbeefE0t0GCZlRn+DlMreBXAvCrnHuHf?=
 =?us-ascii?Q?I4Qmse1NhogERiJfq4d9LJwTMVcylhhP7ju2X4OCP3yZR7k/jOuhXJrN/crg?=
 =?us-ascii?Q?Xq8hHMii2YJEyK9HahQpGJEzHAxOA+IYIMQgvU6OxsOCkAk0k41qg1RnygbG?=
 =?us-ascii?Q?ww9GK9pDZ68KPh8BifPAwGJ4MLWcrWs6Qn4dG8H56fzA9ydy5xMbnhP8taeV?=
 =?us-ascii?Q?vtCRE1tMbfC2jJuSrS3av3M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eo9c/cl8BheTx0c1+r8LLjqJc0GLD85uUtZrEcXPyBnjliLtEpr49zaYTOdn?=
 =?us-ascii?Q?pfWKp14A8SiAmd0wJ7N7POXtlQ8KpVS0ZjAcQI7BbcWR5qV/huVF5RPzE/ve?=
 =?us-ascii?Q?8ik15MvfVLnVgnWdKATzazCc+oWHJh5dPzLTJhVf/BsZDBju5jms12/QOeRt?=
 =?us-ascii?Q?fYJIhgYUhu9EACJA0J6ZNsnXOL6qocp3KKitN0JGT0IeaBUHmB9ZjCMGs4ex?=
 =?us-ascii?Q?0zJIvHyDpO58R85WP4FG728IRHCLcmSiKE7PXoD35eKO2LlpXcZN/spnXTw+?=
 =?us-ascii?Q?T8sUQhJhZTjSarwCTV/skblJjR8Kim0FrbvO+Gp5FdUMBEfvY13qg9zhfg0H?=
 =?us-ascii?Q?jHKUR3Sm48ejKvPK6IHo/SHPVYt07QB8MGgtpyNUdRDNS+Beba12oQWGB2A3?=
 =?us-ascii?Q?7APoVt0ZK6X+1NqQuMtSFCBzy8d5NwiSLEeEaMq+3CCKSycoDYe0WxzXK+Hv?=
 =?us-ascii?Q?ZH/NgjI+7waAyxpy5o5sDa4ytwV6HoW6213vzvhKJGh6lB5rsO/B+08CV/VR?=
 =?us-ascii?Q?FbtmtrswUpNtCCIjEmmQnXaTKZ0281W51mymnCt/nScXYqx/Z19H0Hmsq6Ju?=
 =?us-ascii?Q?sI6n9FrLvCDVR5+ZKV7qXmmkdQcK+YwpphmyZW6NVI/Yt0B+qITW5f6DsPzQ?=
 =?us-ascii?Q?/eopYdkbwPRNJuo3ieTrJOUOkAoEeun2ElRnjBcrmEKuIDfubRU8j+APxkWT?=
 =?us-ascii?Q?MGZc/pP4VYcmRWu4eo423vyNI0qJOGIg6r1r955TelDWVwZhSNt+qRRFA/cL?=
 =?us-ascii?Q?KMze3s7Hjf+i6jTdXqSaH2BRdW0BYzq0bGNxDZGdtFM7pNK/5wW14poQxlKw?=
 =?us-ascii?Q?+0+03CnlvnFm1zZ00MoQYEW8B396J7ScqeGpPbZSn3LwB+ess8fFhBeETJUI?=
 =?us-ascii?Q?byUpx54/rWqdFalDNY9j41nXTUazsPcgmUnZ1genMucyS7NoqgQ8BFTXglKU?=
 =?us-ascii?Q?WcJetQD112ebkZ8y3UlpWcdhGszh9LHpUzhQdUuYq1zN1KmFJ8+j0l828DWx?=
 =?us-ascii?Q?yTr4kLrdurHfuAHoeKF8oPCNo8KkLr3mq8GzYNreQiQEy4nD0b590Y9dBNG+?=
 =?us-ascii?Q?UVQ4nFOPCf9TdH9WOwZq+Ybbd0tTol91W+81dJsoiCLh9ZV22tI/kw/7NTsL?=
 =?us-ascii?Q?YxkonCgzbt1036ZRdwDTBXl/SwDZlO3TYtRXuxj8jrz3YaY2ODFRhMMMLaRi?=
 =?us-ascii?Q?1/NJWDTMFO8VP4HJ0c1jP172Au2PW/pkZndiu+9Y89mxD9Rd2valSQhPFrob?=
 =?us-ascii?Q?5wKNa3l7Jl2JdByKUoA8Fmd9tRU0CAoo/BdBJwheYQvbvFIKwPFnNFonj1gB?=
 =?us-ascii?Q?BQe0gQuhSYrhmKXL95lfJQcUaLMUrz8l2i4R6gmQla0CEbj3m9r3IX97jqcb?=
 =?us-ascii?Q?5Ecgcn7t96xZqWIiaSeMOfqsFEUqMBeJa40rOETf1mY3WNcvQgBir4ye4cfQ?=
 =?us-ascii?Q?XYATH0RNBvwPIJ1uP40rPizRQcTW3KH/cUkv9mEZxle2875OuK6nwxlMrzp5?=
 =?us-ascii?Q?JgiuUPnVk/2KbTIT56n32+7R+t++U7UKFR6sXEZ0/YIkEvajuNFcUlB2fBh/?=
 =?us-ascii?Q?4QHJz3MLCVLSVPNXqeO3GJpwKfA4aQi/ZzSEtvyn4aGNRq09PUQr3tQgwynn?=
 =?us-ascii?Q?Nd81Hv+ahyf1Jw99mRInO7ZqSYG0ZhSxDBkOW2w1qtiLONLD1d+THzotvGpg?=
 =?us-ascii?Q?WrP8kpFoN7VDp25xQdQ71QvmhUQ1glyPhvf82ieBPDyeh9q5Vy3u1VKlj+BY?=
 =?us-ascii?Q?386fzHV5/A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8276e45-db03-4353-aa57-08de54e8a830
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:18:56.7770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6U3CaR/wQoBBh55x+xgc6IGI0xgYHS2Rq5EyXusJVqnaAP7yHq7aRXXk6T3brOnGTUkxqyGVOZ8BcaNn85SsSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9807

This is to resolve the problem of wakeup system by USB3 device insertion
if HSIOMIX on, in that case, the USB3 device detects RX term on so the
USB3 device doesn't downgrade to high-speed, we can't expect CONN wakeup
(for USB3) happen because the 24MHz OSC is required ON to trigger it.
Because the device works at Super-speed so DP/DM wakeup can't happen
either. Then the entire systen can't be waken up by such device attach
event.

With this override bit we can force the RX term off when enters system
suspend, and disable the override after system resume. Therefore, the
USB3 device will always downgrade to High-speed, then DP/DM wakeup can
always happen. It will correctly switch to Super-speed later when the
host reset it after the system resume back.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - remove CamelCase style in title
Changes in v2:
 - rephase the message
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index f33eef218db1..e9c113edd470 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -54,6 +54,7 @@
 #define PHY_CTRL5_PCS_TX_SWING_FULL_MASK	GENMASK(6, 0)
 
 #define PHY_CTRL6			0x18
+#define PHY_CTRL6_RXTERM_OVERRIDE_SEL	BIT(29)
 #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
 #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
@@ -699,6 +700,7 @@ static int imx8mp_usb_phy_init(struct phy *phy)
 static int imx8mq_phy_power_on(struct phy *phy)
 {
 	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
+	u32 value;
 	int ret;
 
 	ret = regulator_enable(imx_phy->vbus);
@@ -715,12 +717,23 @@ static int imx8mq_phy_power_on(struct phy *phy)
 		return ret;
 	}
 
-	return ret;
+	/* Disable rx term override */
+	value = readl(imx_phy->base + PHY_CTRL6);
+	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
+	writel(value, imx_phy->base + PHY_CTRL6);
+
+	return 0;
 }
 
 static int imx8mq_phy_power_off(struct phy *phy)
 {
 	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
+	u32 value;
+
+	/* Override rx term to be 0 */
+	value = readl(imx_phy->base + PHY_CTRL6);
+	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
+	writel(value, imx_phy->base + PHY_CTRL6);
 
 	clk_disable_unprepare(imx_phy->alt_clk);
 	clk_disable_unprepare(imx_phy->clk);
-- 
2.34.1

