Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504F3ACEF0
	for <imx@lists.linux.dev>; Thu, 28 May 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959884; cv=fail; b=QM2HXbFkmJf7r/M8qCwMz0qAMdprZ9x5eO31wp5XP7D+xdYeFWgQdr9uqIRDURgvP40PL1T/rRiX8dprvp4cit72cz3+iUMQna2BeLwNgWPNlXv1zqAQ87TOOKWWHIwKgdNUSbr255W1yFzZvjI9iCZ/bftuu9NHd51piLJxZ3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959884; c=relaxed/simple;
	bh=NXWd4uH9qJntV9Uhst43KN8vkyCPp1ClJzTRWWv6w3A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nqNJTezAh8yG6nmg/cfYyiyrXGI540TCVpy9pIHB4aHW4Too0EF5Xn5y7MYciTemAccGpKzialH2mdtk9ZpuBxGroHgFG8+nL+6L2PAgV84pP75lmuvI8dHbwLqVCB6nai89jghKIF/3/ufrJk7OTI1P8aVkeNXqZ8Z8IvokHq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=etNiyXmf; arc=fail smtp.client-ip=52.101.66.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="etNiyXmf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjvKdQeBAvOwuIvQg+qnOUun7seUR7G7zOtgPya4ixFdp8xQmVy60rxITkyAMiW/R6k8hUzfOkm80pV6ZfXh3ev05mcQqC5hjXWvu2mon6pxmCjd/hQ2FOJfWq/NU2hNb7Xe51aIedpNID5lz2iOLE+4BaehjWHwjMvbebDmnJVbdEmaRQ+rZCgy5rfDbkFCDb4gUfYu/sxzUJVWoEIGYLYNXGHVN0GPrWgJPCSgBWCrXwbZXVtxLb4BFNpWPOvScdnel8YrUywu0LCyFotGMwW8uY+OG3ZAdQlJ1rkLQFkiEcZ1umdjoP5vUB5o84rQsUOtbklOdaRsohRVFzcAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rycC3oKgz6YoalAGDhNKMr8d8Yyc5MS8lA5AEblOPyg=;
 b=jpnZj9pNDv5VjPvXPQx9mQPF6G5ePguVhOwd2dp0VQabNq9akIf4e7waSPH5BSaIC7M9DXhg+HTpcG2zNvZjUkHHKyFB5WtoKODpIxjXdxkxC4ytOcolbphHybDwXAel/IpG5yfJkP5A9zo/MWGYUTMnSxQBu8evi8h5nqL0Kfbkvj0HmUbkKj0mczQJfFQ8Eq7Mb1x/tzI8T2DpGoxQ/wbNU++KLreo79UWQ5kHajUl7vePztRe6PObo+o3+kINVjCrFEqfxQl0c/rfvHLWtdpbN9awnxxXrG0HYtbwxwM9niso3PAZgG2GhKBkGy/RXISvwSkcTUVBeoJrHThujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rycC3oKgz6YoalAGDhNKMr8d8Yyc5MS8lA5AEblOPyg=;
 b=etNiyXmfCs08i3dyTTYO7HqA9vYivmObHraWMtQ4y2gSzpn3lVJ8jzfeCV+yHoGAFKOCACZyBSJ1CqnqlyrFehariRkKYfbnEJ6Ndnhc9aweLkT3scQ7PMJC3lwTVsxJHdNYYJ1ScN+s///GFrMRfP1FMDnbaPkP23c78uelatdDa9DXD5Asw2YLm1zYWvUwaMES7VV2B/ultc4UMTvjn/1wQQwcdSbo8ijBzQBshsX3e69yW1bMQsECCnu1FGPAPCOFhb5NCbdlrFGlCyqZjYvPmznQLLn+O6yq0NaUrW0Cz3Cpv2SzkKBQl5IRtZun87jkbndcH++5hOlpXmUVyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by AS8PR04MB8484.eurprd04.prod.outlook.com (2603:10a6:20b:34c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Thu, 28 May
 2026 09:17:59 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 09:17:59 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev,
	frank.li@nxp.com,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH -next] firmware: imx: se_ctrl: serialize command receiver registration
Date: Thu, 28 May 2026 14:46:34 +0530
Message-ID: <20260528091634.3331090-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::17) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|AS8PR04MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 40adb4b4-7441-4fc3-785f-08debc9a02e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	I90djj0fmfICuuWC6yTCFLtvpfENWrWtOYoAZHdNr1pTkgoSL9BH6ct2asawsVxMy3xmPU+5rUjPI249fYfiPj/NPKPPnkQWftvkRKs89Ina6EDHfe8gyNaS+B/2fTfObiPv347cDldfkxy/LY6OGLq4ZxmhczcP3eLaXBGp1W4lf0/HveBVsu8GkCuPZmGBboaPpe2P79Iyi2JWJmHI4NXV1wiIQ5FF5B/LHKAOw5UrkYvApB0rMYXulhGVjiMOylIQ2dRLB9a+vJEOo09xCkOI3yyrpeosq4QFTuivq4Xa9byZckb5/bH9Xa/IL/V//ABvb99FzL0DDFP+gQMjxY86CDFBmURLcpHZ/hfWjfuikQuDkD+D1V3tsFlLSFlY3iwXP8TR87ImQcr8g6FKRiiT5fLMY+6ipcwRiOTD6IjdrzaFFSRT6aCVk/YoXGhCUtDj5uMsD3+QNnmfoDsnQzThXoaiLVqaTF0RleZPt4TnOLcX7LNLZYexaIvq+5sQU9xdvbHjpOdC2O3w4dguXWMlDAY1e2it2Gdk+922GzcHL5pCL6XnlkmCmOGLlNaVv8F9/8ylllXo8ds+3yr7MJgnhUo89Bw+Gbu1WwJ7nsA5hrRk223BaI4RkJZ2kwHyuxsNZXOdUd7c1aN1xb3kBcH76olmCK9fr/uZlRo4V2IazI3ciuTRSPyfa21Bw4D2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ufC4a/jAUMV3klAyFmkrTGfRkvkhwp/O8g+0kJ6RVpYawaCZ2cixlspnpS+?=
 =?us-ascii?Q?EubQJGfA0pQQC4AlM/bMYSBydED9yhdnbwCgipbmZqQpb+aHa14KJojx1+d+?=
 =?us-ascii?Q?o0ZPDAeTMqKnU2F452b8WgHXGkSDlIK8+Q9gVxNPaG8HbiWImzP2fn55r2ii?=
 =?us-ascii?Q?iO6Bf2yB/F25WcnTIpQ9Q5KXKNRzw9LxGsDLLchzr8ZzPM5Z4IfQuQzodA68?=
 =?us-ascii?Q?wjccsxOzgmcJWDJUbfrdXyTeSE+Kxx2t4VZHSCUj3YKsQAigd2/NBGFGE5iZ?=
 =?us-ascii?Q?0hy3TcZSDjYMMcX3yVSZYk855QJpLcEXLxjOqdM5I5961gwKPKqNrkNq5p1q?=
 =?us-ascii?Q?44sEOtfKE31i5GT0VrGoJ65vOzWYkIVHgQSJpTr6ajx9tAAh0qhSwz1JHk/0?=
 =?us-ascii?Q?39kAAhZwTVfkwRxCLpBI3DVT7Fr3ObvklSvf3uxa7S9ICXj0N2jgH6otKC2d?=
 =?us-ascii?Q?wrUsDYV23byvh6vfMvsr2pHCpyzvJT11n/8T/3Fvu0rFMX8kDf4uUU0KQY/Z?=
 =?us-ascii?Q?3BlYYruC49wOtPy8tgnGlvyhfV3qA+S2+7tXRyOw4jlCpdd4WggNYmrmNOho?=
 =?us-ascii?Q?GooyN8ou0wA9YQhdbfLfiWclSVpUW9bg6ofe3HZYJCZ2SGbScNucRwLAfe7d?=
 =?us-ascii?Q?qMaiGHdG+oOiU+wioAkHA1hp2QrHCqdX6HI8Ygb8b6gztHNXqCuDSJGYC6/x?=
 =?us-ascii?Q?XRhhtEAMYk/xp5iiUrEV4FSLkbNMti0wubKGzqFaImINAGhB8k7rj5YfmX0z?=
 =?us-ascii?Q?aGBr6Z0ZkBhUwnCJenmCNQRS9Lphj2WvyIIPpZoKItO6iFg+A97vgnuzR2fn?=
 =?us-ascii?Q?3sHYTNWqK7BhWmsqtGNXeO2Crf4CBQl9B8rMShxQEtG9lSfPuLbOaB7ZrE/p?=
 =?us-ascii?Q?ziX83nJ7BbAOs6BAG0fY645EYtWNeUaYjYCn4H4VXP4bghSvbP1njFMg6BNL?=
 =?us-ascii?Q?KFkc+gOpRf0y8Y6JwOhuZDe32sRJ39liYcPN6boWy5IjY3Ug6RDTW5w5wmOO?=
 =?us-ascii?Q?P3C8boiQUIgbT4ACEJsQrGFnOgS8YcALxPrF9oAnGJw8czozX9X+NhzFvA7v?=
 =?us-ascii?Q?JowYqqqUYg7xaadHS9MTZDzsLg7J/IR0Dt1vmxWjynmSdHdgLSdjVO83MFKP?=
 =?us-ascii?Q?NA0l07Vjfa0XIM0/9Q2mwrOUsh8k1sc+aQJGtHqFwHrJ8aH8kugL/V2fafHr?=
 =?us-ascii?Q?aZzVkxN5ZdwmkbYcBbNTSp/H5HFx/JMqqwSWIxQyeMSQlZ43BoGrSh/NdSqu?=
 =?us-ascii?Q?pkkrGvjKrWEDZb7C4oQmbLFGDKk4Zxk28WMGYUrPnXxKHoCJjUigPwL1sgge?=
 =?us-ascii?Q?d+1NooPuJoDPQdHjfHlqFTT8FPzp2JS2KT+tqfMbU+0EX/YgEik5bYsIQXne?=
 =?us-ascii?Q?HMen30Sl6cNwHl5U0aIfWBuVKUhrTL7+Lei5lXyTHYAziIjgNJhlQvIzhshP?=
 =?us-ascii?Q?XeK56LeY5ruQnAnKRt+Zs02aps19CIay75KZrgZuGpndznYjfQg8Xqmh8m/o?=
 =?us-ascii?Q?uxD2UmoGPA1Hm7WdTM6zogteIRthW7AzahDasTTs6RK3eHMcaAM7s3Y32B3D?=
 =?us-ascii?Q?NpmV7E3VUsKismIPFB4ELT6glYXb1sr8bf61EiMgpTe60Ijvmj5nbDllMnL2?=
 =?us-ascii?Q?lhbFlu9qg53o5zk0zLN259sejv+S7HpYWcJE38Oucu5szHtqdvDLOscKjsaW?=
 =?us-ascii?Q?QshL/fQ/OEKQ/yAo/+GycbPZjRs9tUFDQDTVkPohMhs+1M5NGVRnK8qJb7bG?=
 =?us-ascii?Q?okG1JgiYaQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40adb4b4-7441-4fc3-785f-08debc9a02e0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:17:59.3978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fus6PM+P6bxrsVRJ7tqoRU7jfgO/6OBH/EhHeyW9v2uCGkE3PZLFEB53UWECvnG+4nczIP0/nuWLyu9m+bZwIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8484

SE_IOCTL_ENABLE_CMD_RCV updates the global command receiver state in
priv->cmd_receiver_clbk_hdl, but it is currently protected only by the
per-file dev_ctx->fops_lock. Concurrent ioctl calls from different file
descriptors can therefore race and register multiple receivers against
the same priv instance.

Protect command receiver registration with priv->priv_dev_ctx->fops_lock,
which serializes access to the shared callback state.

Fixes: 3ae9dcce8400 ("firmware: drivers: imx: adds miscdev")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260514090457.2186933-1-pankaj.gupta@nxp.com?part=1
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 995e2b5c2b05..2efeed180f2a 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -919,21 +919,22 @@ static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
 		switch (cmd) {
 		case SE_IOCTL_ENABLE_CMD_RCV:
-			if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock) {
+				if (priv->cmd_receiver_clbk_hdl.dev_ctx) {
+					err = -EBUSY;
+					goto out_enable_cmd_rcv;
+				}
+				priv->cmd_receiver_clbk_hdl.rx_msg =
+								kzalloc(MAX_NVM_MSG_LEN,
+									GFP_KERNEL);
 				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
-					priv->cmd_receiver_clbk_hdl.rx_msg =
-						kzalloc(MAX_NVM_MSG_LEN,
-							GFP_KERNEL);
-					if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
-						err = -ENOMEM;
-						break;
-					}
+					err = -ENOMEM;
+					goto out_enable_cmd_rcv;
 				}
 				priv->cmd_receiver_clbk_hdl.rx_msg_sz = MAX_NVM_MSG_LEN;
 				priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
 				err = 0;
-			} else {
-				err = -EBUSY;
+out_enable_cmd_rcv:
 			}
 			break;
 		case SE_IOCTL_GET_MU_INFO:
-- 
2.43.0

