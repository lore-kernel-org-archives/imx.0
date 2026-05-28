Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E2C3AB498
	for <imx@lists.linux.dev>; Thu, 28 May 2026 09:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959821; cv=fail; b=k/pBjdWE+zZCtNpXknoSVXll7Z0bV64vzvt66123Zk1OJgxexPzpt797OFbajzFT3ghQdCzJrtJwEU71Z/hzjz1XLWMUyUhsdny72mvjP3M9SkyZSuSFNp0oOJ+wJOeZFWmK5/iWbPpvESJ4+upW+FSb3j4Pun4nxlDtqwMNAWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959821; c=relaxed/simple;
	bh=NoKdWyNFpf9nn4J6qs/+sf0OhQAnUwJ1tUpq3nJBVe8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KfRdgtpX/Grp+lKejmypG9IRNlHL4WUCfVU+Ie6fmidMF+W4ANpX1d3j8I0qpmrftTsqJLtlctTvR4tA6dKzR449ozXO/9iJRlp8IiLmEVh9W+XXtG2yccYGbqIBWt/3tAaXXoMLLNbrHgl60ILx7hACur18UEB4U3IlJ5sGcRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bZqlMC1E; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bZqlMC1E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8rJrmECmQGx9KEvaf0soQzzj7sXEPbNLtLWJHTnx9eHz9OsZA4MguhkTAQIwwJhTaR8UUJ5x0FhGQbG3U8MImZRDwtbS8jIVpL8FCkz1SCApJ+84G6fKmxSeztyilang1PA4W1d7fp45hbVlwYsYU9kkKhqpN8OIU4isrj9sIZLUM80ChRt22gIKwMmRVFtPyxaWDFhDomzIvoDdwjeR8nSyeTHj+P15rS3HJ8KyfjUfUtO2HDzKFtFon8+sSY6TG/EV9bXwXsvAtSSEoyOdjzaaG+zCZ8ICCmsIhMiNJeyXlYqjM96/L50kZ7M3fRHRkP3Z6u8x+WbRFxQvJ/CQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhV1vw4Puy1cl0SMaVa1RPTr5YXaTwNz4glwrv2qV64=;
 b=bm3ke6LZhFS7Sv8kKN7BQud3tfhQEoPZDQW6XlF8qv/ZTheOje26QSlBaZTHUEP/wETv96/9RypsMArPz9NcTJdRFCikURms8kstN4DTmr30t/z03ORGIV/JIPDleO/D7ZgKJSq14y84f5GIeK5LoGVIgTqOOHVfijboOlkpTWKIcXVqM9endtoPV0InWUkW/NsZnPTRCa4UQApX3ITSiG+DX00tn7HAdLTrUhUoBCq+oJjQRYKhJK67hBVU/P0rrLM37VMMAaElc+XYpHhui1JJrO+4GZ9BX+5RPZ6oqH4hwiyiXz0ecgt2mqW84V2PCph+/TWg4/murmogQ0khRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhV1vw4Puy1cl0SMaVa1RPTr5YXaTwNz4glwrv2qV64=;
 b=bZqlMC1Eb4fpGdK1JIJsTgrRRo7J/drBIri9oOwJe9T4zGWGpu393pzUCafTZVr8yqrNLdn1Sdgq7uFtxysHYvtqrwLld09upubaMAH5zN5jRfU7rw5EHyWKHWznAcXRUNZ4GgESQOBDwATGvcLtLEnWnKS/QeVnIE+REfMKsND0idSCqFkz2VUmb328DLLeCyi6oy/lnWsiPW50WLpVTL5eLxu8uyBzQcVAiEFMZo1LwfJtgO7GPSC+CHeEoYkJdB9kaPXRjrEte0sr2ewwD4Kivf/YLe9IKLAk9ca1L2bZLokr6xgAkeyJKwu0ZubG9AQ1NobpZwgzRtEdXapb9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by VI2PR04MB10860.eurprd04.prod.outlook.com (2603:10a6:800:27f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 09:16:55 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 09:16:55 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev,
	frank.li@nxp.com,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH -next] firmware: imx: secure-enclave: prevent overflow in round_up() of iobuf length
Date: Thu, 28 May 2026 14:45:32 +0530
Message-ID: <20260528091532.3331051-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::8) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|VI2PR04MB10860:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cfd25ab-7798-4100-b262-08debc99dcce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|19092799006|366016|38350700014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	gppWmLLoNtpB4zvWcKUO8YA/XChI80FpFzTL8gPtaKqBuDR/MJQmpSICPYiZxZRzlWWDt31IYBckYBgRD5o3a+90fJ2NMq1BBhbGfbmHRrPzzNvHdi1buoIVt7ja+ln0UxGpi69O14mbtVctoKo3QWGimps1ZESyiT9+cPhzlnDCCIv9D/BeM54qJdPY0Nv2Nmu/AuQKsqZylNjg6QATs7uK85K28ww0KgbhgqCv6tr65CednUnsfu0fkST64HCcQPlKC/2Qx1LOlkrPv0Nb+YMjNQ0ZKbBl0ujHVYhvtpi3HmuSzg68VeLrK7McEIF0rekP9QVhRwsqCjHCiOY08ciI5ZVl4Y198E85o/Zv5X8PA/ku6b62sFgc5du3avV8I1AvpEF8GhrXWp9ADZPVQlSRtJLLgQ8+hjI+BDF9HX3VNL2HS2f+3MQFf9K1GW3O/AupYrXLOsvRZ0D9rezgG1W5RhH4DTI3uhTlKtXkk6jb/AtozVLSS7/mY12Xi24q9wVanrHQGgohnrkJx6wJAWyvaYW0ezZVeGmfcK9UUyt+57LMj2qpM6u0c76XU/yg1EzOfR424ZDh3VWkjWuEGaPJ4omhdWXGDU/1Uh2j0ac9yHhGlJ/kZpD2DFIlTOLmNIMxuuDP+v4eaGaFVqZoME4j6KuL/8l1EqnIb+aGi0GjBIKWdFpfLI42x36QuEga
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(19092799006)(366016)(38350700014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RK0dL1LDoKzAo+MU+F9o54jMbTTr1JbuWqoyt/CrcCOtlpJYC/vjnX6RCMs+?=
 =?us-ascii?Q?LETIaLUc5/FP/nNtPbGXTsU+TC2zIED5yufUzUVLzQXTCvm/UBCRW/fFGYq3?=
 =?us-ascii?Q?1ZEQGZMKZ1ddgS8aibZ0x5kr2xAGQPbq8oqQQeR9yrnI3VYtP/TQtBps5IVS?=
 =?us-ascii?Q?JkUhXSVjH8oMi//6NSJU/GFYNHTTulUSevmAtio1q37afA5Qsym3lKWI0a8i?=
 =?us-ascii?Q?II2E1+Ll7PO2GGgH17APPpbhVCAFAvHl8rozMh40L7mUUbJBEP0zmKhHQDQp?=
 =?us-ascii?Q?PTcUlEHsSWXwt73GASmC2Qc1DuUsX8Rw9dpN83s2G2FOfKia9bE3kTgrTu6T?=
 =?us-ascii?Q?p7SXWrM8B9c4rTV1hppRnTFuLVoJz5rl8e8pGZlPsOXNdAk3BlucapXhMlQ3?=
 =?us-ascii?Q?Ja3RJl530/rD42S1sOx+ToaEhEKNX+P2DWDrd7Htpos0nKn1Jw540+YScCPI?=
 =?us-ascii?Q?d7qDaoghFvBswx6a1O++dWzrEWFE1GI8cdL1vy5O6zYxYvHv7GQUMjy2Sh3x?=
 =?us-ascii?Q?ZwV0VBPusUOaOlbMZXsGU2QqwHxXr96cEb1Tvzj6iHdPFnNM1Av/gzQrR2Fa?=
 =?us-ascii?Q?Yv3oclEFpqPX7XklUYhAuzKElHbaRNJGGmGn4Rz5D8n0GqiNwfGauJ8adnGJ?=
 =?us-ascii?Q?qqE2qOqwj4eiJwY/+MjsA8rTA58T2O2VCLg0cUA1+HLaPY8efnyRFKe1IN+5?=
 =?us-ascii?Q?A9+l1Snb0V/PDYOBbYRCrdFPdcZyvgO8x+Y5zJrobg+a+uATJ8CWmI+xXCMG?=
 =?us-ascii?Q?oxs6GZQl9TInDvIgWpbxVsvzoN2DZHOkh1hBnH3xubjqysRjlGSjjx8GIj64?=
 =?us-ascii?Q?xGmclVJyGr1hPM0V6KtZgVn5V8hre5tFyoUQUBi8cNqF/e+Tucy7snY05m/k?=
 =?us-ascii?Q?JhNI2DEk6N7Y30n0kP+SmEQVhFnpjRDINJayv2ESUylOvp6psXk0AsaCCjhr?=
 =?us-ascii?Q?PB+XCTBP/jtgGoWzFOfOaJ9j/prSIaEKe637+JSEQmyDeN14h0nCOGxWuWEk?=
 =?us-ascii?Q?YBgp4Zq9IGHTpuVAau7uiQ/iI+Gbkiv08qDXcZRmczrXELvUznfIo+4x6o+W?=
 =?us-ascii?Q?/u7lyAq8LN2JLSfuFqCe//dGdxk0GwJIplSOptxOpG90AI5vJKvvb5qmk4Vt?=
 =?us-ascii?Q?kw6ldvz/ahuIuBFFcD1fxdKEn+UjriMsL4yFkqDjVO6dtObxtVhoi0K3y8Yh?=
 =?us-ascii?Q?DD01sNYLGv7tkx/xFjwHdDRtRC9lJe3wBXcNmPzKMeJw96FeYx5BlhOWdRkl?=
 =?us-ascii?Q?MX/Pnm8b6NSjycDFlMQSTfQUHybcP14xbwGt9PP4fh+/8d1WDW5m/KyYG0Cn?=
 =?us-ascii?Q?pM4M+jJ4wQJHZtSGo+HkSE9fueFSCpHY/Lr8Qe6h8T5hkhF9UKaaiDtUxOMd?=
 =?us-ascii?Q?Fa4rcud9Y6GKAi4fH7VWlRzihDrGqyctTgYg6i4klRgngywLpqplCwDryP3i?=
 =?us-ascii?Q?hCXlKslBY08/QlNyIlcx4gCZjHAhHn+RLvqWt1o148Mpy6xea0J5XhAx1TcL?=
 =?us-ascii?Q?YeImdNM7SZoAZ1cdk6pKkdDEKm6X5W8gEFpdg1T+ltTkK9oK+4o/pkNkjIGh?=
 =?us-ascii?Q?GZZcEqv2yc+N6CKWd96TZHNwZdaCcRoemM+btNlZinayd7PRrgQa4IIbl7gp?=
 =?us-ascii?Q?IN3AQJ8cEz5KDRhoFfiFd8NWNLbZ9c5yK+y1zKpiOsNs+zrmiXpvNLIK1gpA?=
 =?us-ascii?Q?cgHIJNiCVH6hpxx9Wy024Wn6xYR4LKR1t9F/OQ1jPNtdetIoERPsQzkfM663?=
 =?us-ascii?Q?iIxTXNlpsQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfd25ab-7798-4100-b262-08debc99dcce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:16:55.6815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFe11DlbLX+ax/x6cMlwwzQqMej9N8MkI5tsJ/tv0ZVhOXn17mBUaVz+m9qX4+2S3wDQCqoEZQ8u0WdRDz5dvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10860

On 32-bit architectures, calling round_up(io.length, 8) can overflow
when io.length is close to SIZE_MAX, as the internal addition
(io.length + 7) wraps around. This may result in aligned_len becoming
smaller than io.length (even zero), bypassing subsequent bounds checks.

This can lead to an out-of-bounds write when the original io.length is
used in memory operations.

Add an explicit check to ensure io.length + 7 does not overflow before
calling round_up().

Fixes: 3ae9dcce8400 ("firmware: drivers: imx: adds miscdev")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260514090321.2186877-1-pankaj.gupta@nxp.com?part=
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 4914d3b6bf0b..05ea7efc016d 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -672,7 +672,7 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 		goto copy;
 	}
 
-	if (io.length > SIZE_MAX - 7) {
+	if ((size_t)io.length > SIZE_MAX - 7) {
 		dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
 			dev_ctx->devname);
 		return -EINVAL;
-- 
2.43.0

