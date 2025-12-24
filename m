Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDD942049
	for <imx@lists.linux.dev>; Wed, 24 Dec 2025 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766575019; cv=fail; b=EcJvOqUBOc2DTAnmDgvS5bO2SeweULWoyrkGhxX9gxHUVRT/dxKkAdvoxCxNetbY0pxLH8h7XaCmelCw98hzr9EHIvEDxEO0wve8RgF4fWMyeO+TeT3ExR1WP3BvFeKFu4g6E6YYxqnP03s1DuG8mPy39Hw6najcQy9Dh+N0iWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766575019; c=relaxed/simple;
	bh=ujlW+x2m30zsTtFnxz/+f6GyQWXSkIcSlyMKXxKbw+A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WFEI9lIrduyggwcioUJ6xr0kamnMqOCxUNydFf+695RyOAVamCCslOn247bJwxmkNi2T9pjtjD+os1QDZ3+wff5uTNn5fhHZIdMC8tlcs4LqhmB7DCEDzst7Fabo6kPgHzwebZWxlSgZmCBvGs1hCMq2Y++C4hOK/H6eBMfaRgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=APSnJwrK; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="APSnJwrK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l53O65gq8zDltFZ8WTRNy3J/uE5fbX/fgunAicoc96Nu5lR0qbi0ez3phQ6Ftg+5MGniQf0fcGxo0iEsu9DTNJnRn7ZIlR3/5llXssvmds+bWVfyVKYWwfRp/PA36fVvbbW+X+yv2zBckSBcLHJkH7jtrUezU9yEkm5HHbGU5u6KGP8wJ3EHU7QiEi/DLrrMcM9TkPi16N2miNN4CLPU4SbGAfVvQ3dXGbe5yxaL3ifGgRmZHNoFn1p0Lm5WvCWdnCBDSoKoOP0JJEu2SggAcuxBGEqUBifQNzhsPOqJVuZHTo5VjMcgq+LcmZQc+iJdhNOrvOOC7RBvdDzvKTHLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOE4Ss50vMfbrjSCE+mWRMf6pBzWS6ItJG4C3F3Oh38=;
 b=rH2pgbBQQ0KICLsp5OOiyy5FZ/KnAHZzsU7rpo3PzdTxpPYXh+VFo7MYk78xpz3dgI0pW9ioXPKveVskYr3xADXx/WliuX3Bd59rngxX7GhRxjEVNrUdrqh1KS3Rc2aLDn94iRKL4VIosHpgpwQvB//NB7LnV7KQ47p26e0xlvCODT4BdWGF+3vZ95gisBoYAOntx7rkWqZ2q/m5pbGtg/XOEh0p4pWQijd5FLJV22+GpZMPkpa4CtljRjSDZVw2E/8jUhYRJm7PAYK6PmfbvZ9Be8EhpkzItgdbuyxmXH0GLpwGOubYR4uQKFAWu70dPbRO8nldsW5oa7wmGBJRHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOE4Ss50vMfbrjSCE+mWRMf6pBzWS6ItJG4C3F3Oh38=;
 b=APSnJwrKPm/axRWpX6g/ubBMtffjgPRLXocjwXH3phlY+VZpMcFuVv/6FO1U1XNVTIcDRrPUlFPvu45nONkvt5HOmghIDkEO8Ow+QPAnsullLXAbzNSiXzEdhWDspXME9aJxJ+LTmUHzWM6CX/Uo/jAmhLRg6ilPcMGV6a0L9A3qRQyuc05mus0wsoowTePJ7RVhdCedl2hqajS7Y+a+UyTeNYZE5p4So3BeIznvxmble57lqNaAKUKMlmmOaNahCV2Xb9bwep1v5sOyO2t/IOvagFUfwPOwCGSF6caGyCuiUAtYJTO6slV5sZURqyo4kUqtIaB1Dhex6pHdwrSZHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10753.eurprd04.prod.outlook.com (2603:10a6:150:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 11:16:55 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9434.009; Wed, 24 Dec 2025
 11:16:55 +0000
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
Subject: [PATCH v2] phy: fsl-imx8mq-usb: enable RxTermination_override_sel
Date: Wed, 24 Dec 2025 19:18:07 +0800
Message-Id: <20251224111807.2925675-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10753:EE_
X-MS-Office365-Filtering-Correlation-Id: c76b0088-2e1a-456e-4809-08de42ddf1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LglBt4rDvWBsMyRaONaFctMu/2sZO3KRTnqFLwWG/Z8Ob4kfchZFEPBcAXY7?=
 =?us-ascii?Q?hsALWcobsropW8Wr/PC21mQ3JpHy9uPKAgbbFlTHXZHLyaUsFv2qQ6/1TnMD?=
 =?us-ascii?Q?QdvG8Y50YvkX1tc2ZhyDwJ70bm22gNBJDbfiPO9NBNtt4dOuY0KH6v/t69Xv?=
 =?us-ascii?Q?cdB+fwsCcUvHG+TxIdPCir3PlnXT32Qu5SmG9fMvcAvyDBcxufV8Acj0VuXu?=
 =?us-ascii?Q?4nSOsPs1Uc3NaD+FoYql8EGpb0fB6tNWf0UYzYDITH78KAjY+8zKsT33SopB?=
 =?us-ascii?Q?Cznb0IZFRkbUJ44to4EKIy15lZdpKvzii40Qj2H49/ShcgDNPgLj1/f+5d1d?=
 =?us-ascii?Q?bUi0OoA1oPj+gBA7h/snH2/47QqK2btEOn7vAQvwnkntgQPMx5u2/VdMpfIS?=
 =?us-ascii?Q?TaZwJ3cbLY1N0rQ0zlrYDXZG3gI7kV+QxtXTPMlUZ+J1yuNDrNmv63EP9jc7?=
 =?us-ascii?Q?yHolTvzsBVWEpdyD64w6+oIcMKNCr2DWWwmc40KmO4FGEzbNqib9Ww2jMY5p?=
 =?us-ascii?Q?EB9bE5o3MIE8xl24Pzpb1z4g4FqIKv6mFtajSUQmQ7IAC0jZ3f5tId1ue4FR?=
 =?us-ascii?Q?5s+84uLw4fi2RQCwQ7/LYX1LZvd/iG+3RsXAqw6J4d0g8trSmSAkMv6pFRwI?=
 =?us-ascii?Q?TC6V9Zp+8sH09+ZpLwXVp8Uuy2mxc44DS/K14GqKRbZwUe4YlmG9G1pujUDq?=
 =?us-ascii?Q?756WGBpVuxPxigM0cyDjh3J6w6WGecqfY4F1WYL3ZHloJTwkSwZB7eDvKlGN?=
 =?us-ascii?Q?o8z0rwaASJXm/vxk+n8VM5t9MQQiNF1RsVdUXpc7jArGyinF0O2ZJBcKABP8?=
 =?us-ascii?Q?1Cvb1246Qt7oyLnY8CLYfFJpAZQTSXmGjnXZJC9cubZQsxbCNVixm1LiSbPM?=
 =?us-ascii?Q?okFFO0tJdjQOAEIZeIoO2HSDssYSCRt9efLHXDpUIpRa3te2XyAMzVzvCNzU?=
 =?us-ascii?Q?Qrt3CA4UYgsbKMMuQEWOWBmBxrTdKB2DOAtngv9IlRXBGrDl4A/YwSRs7IM0?=
 =?us-ascii?Q?NYjE1RKfBomYvDqMDG4FvKPKspGINqJXqsw23eXZlwEfggEykprva5LAIJxr?=
 =?us-ascii?Q?8u45J632ozZgs3udgRAQy/vMUeDvaHpe2Jer63hXIV8GY7+Hc/lbaleYzFB7?=
 =?us-ascii?Q?x63o59izqwmuidqL56kChyBzdCmrZUsRE6aE0r74WtozCBOK1fQFjzwHbfZf?=
 =?us-ascii?Q?ej0TykIjojBCtZGBdrxZs7nOi7acR+z1XV/Iw41tA+xcHjo5aWsPMEP03BnZ?=
 =?us-ascii?Q?OsP58vwqVzvObnZF7BrM6gD/sc8WhNQurH4jcZ66a/qDZ4bmKYKXtOENYzmW?=
 =?us-ascii?Q?7JV6Q1NOHABGn6OQzr0ZNB1ev5CaJMdlcxlQPgIpa421wxSM42p15cvtdFqv?=
 =?us-ascii?Q?nAhz+qwpx9ulZTMCzLvEo7qXAvIqUxq6JSiVpjsoogPSqrEoa1MxfVN2xKKf?=
 =?us-ascii?Q?uEd7sX3DKfQvcjq9Zul2l5rR5Htql+rY3ppFw4EQDJPfdBf0FC5aslDVavzu?=
 =?us-ascii?Q?SR0iT5qrEfltr+DQwXPGXXcgMUCNAY2OIfNw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TamwQzMCRllG+Lb4YTqJq/lR+i2b3ZhIKDjtQ6h6tmBfCCHMZJD/axz5H3yh?=
 =?us-ascii?Q?z+vm5Vtj7/J/bFCsxwQw48RYg4RZW/b1hSVeBqzVxJlx8xI4Z+bX+5/1YwKA?=
 =?us-ascii?Q?9UhITNraGAdjrIks8QpRxMdNYk5FnvTUwuxTdzFOy4Y7+fSTMJKLfRGNZm2/?=
 =?us-ascii?Q?/0o3jlAa4MF6eCjupe2U5+Q+bjvJ0M5R863Rsc3/2rTSlnRQ2HFXSqO7ljEw?=
 =?us-ascii?Q?O7siflciKDbeS8JnE6vY6Li4H43AVB08z3fjmqTPNokfPAsRjAGPq46NDWIp?=
 =?us-ascii?Q?aJL+Z0lS5hI+FzeJPQ82k/e41bQU7OxS+2IZ88DBLpQdRsDA9IuZLgEhQHn7?=
 =?us-ascii?Q?qeMa339+NN5e0eJLs6DaZm8IH9Op404LCh/G7QJn6dA5DDYyZe/gBl5OKnzj?=
 =?us-ascii?Q?tXnhFmFzdm1mPsxdN4DO3sD6Kslx77PeB3Bn5iPqUn5Gfm2+MUQUAzFJ254J?=
 =?us-ascii?Q?HPBxrGOtpYeLd+aPDIeyeSsp2xBRJcKd+lcoLagpSX4yIPdRpJ82/Ia5aeyC?=
 =?us-ascii?Q?Pw0OWv+1L0L9BP8pYIgRpuJDE3gtyQrsI2ogQfIBMeLK6GnPrDfe6kRdNQF9?=
 =?us-ascii?Q?HluJaqOlJiX7YGSkO2ELCvGZpuFl+pZiqxTi4s1QDFPYwVGxibL8CwjavE9h?=
 =?us-ascii?Q?4+wh0tcueu9ELT3aBfyfFsfi3jCNynz52kxMiRlk+9adNOfZkSWjRYKTejqQ?=
 =?us-ascii?Q?4l825AywEdhNgxPFejTx0peQYEsrq7mQQ3w+XDaWxqciUUgQ6txDvMSje0i8?=
 =?us-ascii?Q?ILbY2Vs85fuIGe+/d3nxXbyPDQkrEGohZz8ufbAitji3kM694A9mAnh7C4xp?=
 =?us-ascii?Q?6NfeQYj99lxPEDDqfB3+/CDAuC72pdPJSoVJbmoGX8ymg6Ts60abbnSoTTt5?=
 =?us-ascii?Q?jr0z62ZflhBVPdFu+GYiXYb7NGbnBnliyZRqbUm6T1kf/SSmj9sG1gD2qmBU?=
 =?us-ascii?Q?EkeVtq8Ls4KT5oRoacBsnlVabVAvBArBSo1kiacBRBTR4Jo+ell5rXaae3/x?=
 =?us-ascii?Q?ptPfT3FSjlMkHPu6Wgfgu4ckBX0Vp9M7r/YTpua3dgdTgB3AXqbEcajGTxRj?=
 =?us-ascii?Q?h17UOURbtjVlo2xQGciRSDEYST5CROPgTpwhkpHF4+URRh3ym2nenArSPWa0?=
 =?us-ascii?Q?XxCAqkxJP2CTQYufXU6/wzBsG02kYcn0DYWBqb8GeXQ2rcTQ69zsHowLQARn?=
 =?us-ascii?Q?E5MQb27UK4QS20ksIx32119NgBLeXw6It/l5WljE4n721sDGGyBb7Rs16Yrx?=
 =?us-ascii?Q?oQ7gwudp7NXC1zj/w+q579kvieym71WuLWOllQFMJshMjAPy5reaxkkYuZPZ?=
 =?us-ascii?Q?mEYIk4Q47UNHAgNhE/9q8JBrUjyONTK7ZXg2rMU56t1DgQiay9zu+q2+fGf4?=
 =?us-ascii?Q?1i5g7A/ucRkF46C+oZ5IBupX31eUoPH5LhvJiqQRbx99yozTUG73gt9FYa9+?=
 =?us-ascii?Q?qP9NnMDNlxmXZNcbApBZEfxCAd/WnZUkrMl2iXK0ETKAk0cVmHQZsOQkI8Rz?=
 =?us-ascii?Q?PUS+Ppbgq5r+w+M+s2OU5tK5s1AT/JZbAhsIbktxWWjM729Cvjo946To41a9?=
 =?us-ascii?Q?WJFFBap8pXVOzCES9ExIpHTLUV0zLbaIlIubfoQ4h32MpfR8Xp1T/UROJld1?=
 =?us-ascii?Q?SX0S3gzMxR7YtJBcADt00RB6A0ldJYwwRQQIy9bhL/gAy+7Noeda2ELUVWBs?=
 =?us-ascii?Q?+PgDasplBmGRAQry0fC605wLiqOIBWkbGhhcwIy4G0JpzCrE8cG/pzh7ek3e?=
 =?us-ascii?Q?g5Z8zLlEtg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76b0088-2e1a-456e-4809-08de42ddf1c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 11:16:55.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBaxVPCH/hN6mXZ3AxLEXudd2Q0xg7wGpAW5ipECzZelD3TRvLPeyfaAqdM4qyaZ5xGrE11e4Ta57km8yD8aPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10753

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
Changes in v2:
 - rephase the message
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 92c5c233bad9..e991a480b882 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -51,6 +51,7 @@
 #define PHY_CTRL5_PCS_TX_SWING_FULL_MASK	GENMASK(6, 0)
 
 #define PHY_CTRL6			0x18
+#define PHY_CTRL6_RXTERM_OVERRIDE_SEL	BIT(29)
 #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
 #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
@@ -630,6 +631,7 @@ static int imx8mp_usb_phy_init(struct phy *phy)
 static int imx8mq_phy_power_on(struct phy *phy)
 {
 	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
+	u32 value;
 	int ret;
 
 	ret = regulator_enable(imx_phy->vbus);
@@ -646,12 +648,23 @@ static int imx8mq_phy_power_on(struct phy *phy)
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

