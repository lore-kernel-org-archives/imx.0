Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD36A3EF0C3
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907829; cv=fail; b=ndkKevO9JPruAtC8mTs1YA332hI8TjIam6ccgt1U4RsE7urrFdXv0CVI4jEZmhIP8EHNQcOdKztapD+qx7/g0Wf+A4NqYXJ5YneS4Gz9P8AJJWdde2xn4ZQLKBOR4pmNVPcEJk5hsddUd6vCI0mKuB/JDw+M4KibNKVEQuou054=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907829; c=relaxed/simple;
	bh=x/K+kagkJ8dUnpz84q/m3jZU8Iy50wNEiixAD78THr4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bmyZcww2xYOQxK59wdBU3hRmVZzMzlK2ImzUMfW6JCT87lnzC+VjhdrWZu04XSJF1OwuGd+QXEVyEU4S7M5RgeD6QV3nWGKnZuJNGxE6T6+vjmZANIIy6dmS8CpW7YInbX7A8qixQHAnzxU1mnAZI5YCqfwOGUz5AZ9e/vdonzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SC7jZJW5; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SC7jZJW5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHgeKDG4iZqUDwO5qYh8PcjE2QfBpXKxpWeTYbOqnRJWER6Qh7QIp9dnxmvh0nVUOMb6ShVLbfKP2uiQJxfB0EDBy9v1ZlsiDzxEORfdhjq6q04cj/DG6qvjsWrp8u7z3Jq0bMvFwYEaGKsiqPA+LvaJRAd2DE/1t6HCvyX1oK0tiaJMhUoYWAkNVCuFcd8wRAp6WjqAxdn4d5XQh/NapMfVTBJNLY2U4TMlYDEwcsU3Q3prSpPsG849Ji8rx+BjKtzuEK+4npkaomlHOXNEHEA5voYqIFmxvq4pff5qaooi+Hl6tvhvO8Le2vfQh1cJJHO2oDkgbEaVus60B+pBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3d/Fa72YhdOZgN//C02ftTsMu3hfe+72UUHf4vqzoo=;
 b=s/XOQpgmj2uk1GcmrrfR9T/yg1EZy3GjJaZ3yC8l/8sj0iWKT8KKygYWDoQlvSpNg93lr0XKIQ/u+RpgRwMCmiakw/Uoqvr9chK9+TSKz/YTdmdtCFMUT50BSE9WhkyzBBvreccY6HMa6N+cb0ZLmaD4/mskYe1gkQLAayuL7+rLhUzfEYHYHN96NSBLCpORie98vCPic3XftcIQkCzr9o1xT+4jK8Mu0THOuwIq+6XeDkGPV4zjZqieONqrh3Im0/165xQpHo5XVrFuzJVaN541jnF1s/ASLjNkUePcNcI0EWq8QivPPvtF99MM+lS3vOvkbYoP5w6JhFKsBG/qWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3d/Fa72YhdOZgN//C02ftTsMu3hfe+72UUHf4vqzoo=;
 b=SC7jZJW5KnTreWMeC1+WtUbBBkmTr0zw3/y12q7VpzoBvVjdZ+z6nKF/ZSwryDQ3RmjPbzdx0rjKgOclumV0RuyM+zsNeBdZceZu6YWDPla6pX6QPasBl7yxBw2QoPPjLUoVWtj5sm8nBjmGL3CJ1woFxxu2mTt4mz3OIS61uaHMXNYzNsTr88rMnGjHdKXh6MINEA+UUJUquTN6kClYeT0zv6sVYdpdLt0y7sutVP9rEA7ViE3+WakQH6//APX34gW9mkyhqcHI/ZITgW+LLwtctdRrn+yFRCN5FL86uBqfQM8mcPqlhRWSK6ggM172xJ8ftI6JRFbkDgbWdJRK5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10378.eurprd04.prod.outlook.com (2603:10a6:150:1d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:17:04 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Tue, 20 Jan 2026
 11:17:04 +0000
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
Subject: [PATCH] phy: fsl-imx8mq-usb: set platform driver data
Date: Tue, 20 Jan 2026 19:16:46 +0800
Message-Id: <20260120111646.3159766-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::25)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: b70ae604-5d50-4ae8-c0cd-08de5815708a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8tJZgSvFf91BDtewsFmQuqhh98g1ppFAmXDRzl8LHcRkH8IrNi6TDW/vTmYS?=
 =?us-ascii?Q?CRtkAke6NZGNO4qvfDnJcAftG9AkCJ/DJySrEEzKuHnH23y4lQuNHkJvL+GJ?=
 =?us-ascii?Q?Q/SNEDuOfhKxE0lKtBekHmpL6WdYW1A5gw/YZdkxXKYGt7p5XS3WSdZBcLuP?=
 =?us-ascii?Q?t1keKf0yrm619jnrbyLGtVokRM9aTbo9NCT+JGRuI/PwP2Gkqo6Pn4hz0SUR?=
 =?us-ascii?Q?wwQrmpsRcRsfVTPF8Jp+IRpPyiCtbWIIrw4FgyVakhLtuC8noxJIdc3UF4bx?=
 =?us-ascii?Q?12QgvWzXaxiklnRiPjak6VShoX+mLUdq1E/B0dYyo9+gY/iXMAgz5t8uE3Np?=
 =?us-ascii?Q?6QI4BXXGTiEdqMydGBnn9e6JXIftL7avnBEsOUAni0MfUSNHQuF2IUwP1sPO?=
 =?us-ascii?Q?+3jl1v3183xBwbCLyWafSTfG16Ta85BftffZQFhLGwWNdznyZi4f12QDumQ6?=
 =?us-ascii?Q?tOUZSK2KlW5RR882jJqq8jGrjhHX/Fl/U1d+Lcr8NDDNehL45qAe/Jr0YPs4?=
 =?us-ascii?Q?2SVbg5exywg/NQ3oMfh1C9SMrr0Z5J1JkFyKLL21Cnz+jKgGJy2z4608Caxw?=
 =?us-ascii?Q?JCVur8kZIKls/x1npzhMhA8pAFzPZbli2tRGfTRP2y/fZnaF5YJMv+ZXsFi1?=
 =?us-ascii?Q?7/rvXPGuz95Jm+z2MQrXdVkBIrDNjKdNutTETnQJkllEq86kPgi/mCzqbCwy?=
 =?us-ascii?Q?7XTD6UlFg/faDTWOn9TQAyPRSbpSLrC93v2iVP2mzBbIyQwBydaXaJ8dyI4a?=
 =?us-ascii?Q?+5qPTGpXW3Up6H4id7Wji8cLUENJmvdHHWRoIJKkgfx/bkShiMGlsuIhGGrV?=
 =?us-ascii?Q?DQNHb1tIn0/HWWa3qWECgJKiQiK/gyqcbVr0rd5P5Io5JZpU3kG2ffRBL9VS?=
 =?us-ascii?Q?ZzpXrFQ7b8lFcZnDQVLWEOYwcQ+mQ+lnraVp/3UdUdZGhGzbseQilXjuqT+1?=
 =?us-ascii?Q?CHp2p28h8uOg5a7NegMWVj4z6xA882dN2tVMcVtS6uHB71P+nHM0azULtItv?=
 =?us-ascii?Q?77cQSO5AjOSDO7/kFhtWmiXFMHg0/ZoGcXidGYNUnC+ILoxwg55xyTu0FRVQ?=
 =?us-ascii?Q?JJ6WqH1kuX7CfEppXqdjNWh5VNikhYgUabbtbC0Q9kmD6Uv4X3GeW8YSN2Kw?=
 =?us-ascii?Q?+93qboIO0l8P8qs2N1h5el/nxqCAC1nkbvfQEWa/oume6ZwsRagdMooEJho7?=
 =?us-ascii?Q?b6OTbW9y6yWLL1qKKPEYfuTQqsP+TzJco4v7PFlaItldRNBBCCbs+E8jSRkF?=
 =?us-ascii?Q?HjLVvu12wDw7v0Sd5HnNhHx1YlHBRhglk25RPjXhJvs5OIdMLK7e7+ZmRY33?=
 =?us-ascii?Q?mo4E11BADyUJL4ufOdybF95s8URWT4jnJOpHWFhk40yxQ5rp+CdTHxHhnXK6?=
 =?us-ascii?Q?BC3qiRR/r2j2SQG+IasVTqtXdJIQLwrZfSfFG7+H5LjScaTqF46D1WOBSQxE?=
 =?us-ascii?Q?bdl+JuEfcA8nFupqFIv2iVveOVOYyDKlnSZFosqNiOTog9p3DlVrOkJEg60G?=
 =?us-ascii?Q?Zc8fLscuJFI/oGFsRHdY76xK7ujHF5hDfaBuk4cJVuURK+8Br9pY39/UE3OF?=
 =?us-ascii?Q?6eK20nRtoAQJ7DOK7EKj9tSwRxKKZMtKausk8Fx/bjId6Mw14Sr1Ij9bIqYi?=
 =?us-ascii?Q?yBYKOGV3197DfDf8yTLpAVo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kD6s+hzp42gLtI4r+71S9UoOrMZZBUYjMrGdKQ0f1K7tKlbtG1PUMQ3uYpkS?=
 =?us-ascii?Q?j2AEFnRKoxFg6Dm1RUy1FCeuPoouH3PClxtfC+XCwmADXvTFnhezdeklHWwN?=
 =?us-ascii?Q?i74zytQ0nKAjd1q6ixWWWhpDAR6ShlcLYBPEekXmRM8kNFf4iQlhhxUf9Hwr?=
 =?us-ascii?Q?o6ptCCS/f//8JRunqlzEGwzXBMwje0dYU382vQYKjkrV9jzKCr10X2NxnYBY?=
 =?us-ascii?Q?9efC+etJ63jd3cFc3BQbvxa3Co9K9GsYBRfWfeyU6XC4WBf3Od8g/D9qWmba?=
 =?us-ascii?Q?IQfAWltCB8epwXPQYjQtmLNRPONfqcBfxd1Vd12xH6c/LN3lG+rYsl87dowb?=
 =?us-ascii?Q?ONZO0W/7Z6uBPIdblDdckwJsQtoNSaZhICzqx9fYOASrk+DjtiG71StG2z6c?=
 =?us-ascii?Q?CS/8odtnd1EQjkNnblLz3g4dB5I9veQv7kYh1skPRho1WbpDC0YEkC7h60h7?=
 =?us-ascii?Q?N7XIigG91BA5/2ZgyR29rwRWucKDsTfUkTyQrO4gg8BCJrYyzBFAUv4e3y/L?=
 =?us-ascii?Q?ev2c90XmiJtcDplVpKeVzjJMp6sHtcOefJTHAik60M+5WzGpECrZMvb/vByZ?=
 =?us-ascii?Q?eoxrL1kf6BtQkrv1+MSh4WjBmKxBg5zYClMhDUELwydAueD4olYSeeQRAq2v?=
 =?us-ascii?Q?XPhtPe/poZ4LQXkTzC/bUZaG7AQw2X3wtJMSUHuS3rbmNLdrT+xfxeH6TXzh?=
 =?us-ascii?Q?VUSiBd+CMg7YTFF+E51sNT7JdGGj/mv88q6+iQIvsFHe7MgTih8NLd36KOk4?=
 =?us-ascii?Q?kA2uXRXry3oG6Vv82DEmUujqlIHpdZ++2fP+gha3JckdWZ08KueyUKR3iixL?=
 =?us-ascii?Q?7PJGp2ivj2SJU4aJ1co3WtN+SMSZ3uaepInF9BZM3sNfxY2HniLcthtT++IE?=
 =?us-ascii?Q?PizG8giqtv0LJGaMJeAThquG9dv8n2VNA0a1LBI4ab49Pk4tt39Mb5kqzaiI?=
 =?us-ascii?Q?BwQkeXHmS3p7cJfzrjDRhnkfSrrxllHoBXbuhIyd28fKWla4GscbqNOPaxUc?=
 =?us-ascii?Q?srIoMBso6uMLeN1Gu8IZ475eH18NTQKGIuPnGuFGHBMAojZHl7KoxxoZr3+N?=
 =?us-ascii?Q?aSS1Uik6Np9TtvpelBohDDUTmJvrHh+InFGukvsGE1jnRdTNvd78+20PTYzt?=
 =?us-ascii?Q?AWvzJy4+R6IrzLcln2XJ7KNc3B0X2A0tk38BUPsescKqUQg2/CGkPJgbzduq?=
 =?us-ascii?Q?s3gk19WMGJHL/lE48rkikY5JIFbBwMZMucbSbgHs+BUpU+yUIRnlPtEtHaCZ?=
 =?us-ascii?Q?cs8H5VVh4HDbsBXpesmRf6cwqwuGh9eaHm51wLZEQKLP2RvV1wz2PtRhKlpb?=
 =?us-ascii?Q?vnpzuJvAtYBd7Fbl1P1NpHPz3IwXPXG17wrsJHEiLKtNDjm05S1gj3EFjLgG?=
 =?us-ascii?Q?MHyOqlM2jQEX7lyu6vkgrHAoJuhj4Ur/ypw6gAfoTiqbxIbtdGN6qwreSetu?=
 =?us-ascii?Q?ch2ri0LiaijXFD9dciFM7v/rZOpHa0BislWcB6hPlTvgWdEYOZhKPVhP6ijB?=
 =?us-ascii?Q?pLEXpCOUPOIdTC7WJn5NBFy7C1dnWiz6N4o14wbxrR6CaYZtH1pS8If6KTyE?=
 =?us-ascii?Q?+z/2KOSg2Hj5kP5L12C+lyffuxFPMUc7INFkv5yI7/E9rX4bj8IKai58291c?=
 =?us-ascii?Q?TrvE6n7aMJQTCNTR7r5ByB8TZgX8YzamBonL5vgDQxWdr0NlM5cdO7DR0SkC?=
 =?us-ascii?Q?GbtuZ/NJ0Hg+cNg7bIspLAhcXsVHSbF7iSAI1j6FEOwZE5ZG8eDG7+zSSchB?=
 =?us-ascii?Q?4ycRSDA+cA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70ae604-5d50-4ae8-c0cd-08de5815708a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:17:04.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCeN+j/B67rSsQkaAWNObv0XaBdbqMjku1MiBPC2lsJ3+S/d+p6YssLKlpboMw5WUHYjACVnxZxX+55VLFYibw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10378

Add missing platform_set_drvdata() as the data will be used in remove().

Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index e9c113edd470..028c4c9dea40 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -778,6 +778,8 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (!imx_phy)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, imx_phy);
+
 	imx_phy->clk = devm_clk_get(dev, "phy");
 	if (IS_ERR(imx_phy->clk)) {
 		dev_err(dev, "failed to get imx8mq usb phy clock\n");
-- 
2.34.1

