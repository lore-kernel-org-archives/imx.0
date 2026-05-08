Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3C4363C60
	for <imx@lists.linux.dev>; Fri,  8 May 2026 06:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778220078; cv=fail; b=VnKs6BN97++aDP+uDrZdrIHVAEr/W4MGtmtC4ZdxC239Qm/E8izrBRGtvbm5HKtuTlLJGQMcmCSc42Dxm5dpq/8z3E9qgQdXTeZyGP4hfRs0bUBlRIlbUlggOZsFcxk15h4m+HZ6I4z2yY09gFenRMnOi9Tn3RA7WcX6bXyeeUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778220078; c=relaxed/simple;
	bh=/6z0XO2fQ4LcwSRAQk87fnbU1T+eE6JY+bsvveHttdY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=glpJA+/svVhiWpYZe1eLhQvURDR277128zOuvB7ZEeBx52fImIjoEDmmsqFHIb5pGvoDU57jAUmUp1/7OjLZa52iKQoKjh/V+28EGW8bdw9i/ljhyOMS6kwF8sYi9GGj+Te3qoKNxl+uV/404DgYXttzsFFTs5cIMbBGq24MkmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P2cs0hU7; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P2cs0hU7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecvNg3L3SAqd53Qi/IPhipyKcbxq6YXzfnc5a1lNAQSaxlDk8DM5q1LpWk97EU89zHC1Y/IVa1bzxA08WW3G6ffDk7toEr/Kn6/0krwRF9ylC1p500w2B/pu6SSbarZ5fQlm5qGSYFVI704I3jF8vdBpQjwrHNrcpFmU+HtvfCcrBnVQw+VkE4CTMZ6WtUR1M6PosxxRxhbbl67LPezi6Ao3hXqjywO5Wzo4uqEw+C2lSELaf9DZswkGXOitBh5RD/makKqmfAp//QV8iiQmP8+pOwLYGcdQh3MqNk6w8KR+FBdCudrDtDNOpzN9Q8haFnF8CQrKzhdUeW7ArZAAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0raSM7l2/pYFF5NvSBEj3StfhMHWvPDNkBnAnju9ldA=;
 b=rq4GquiVSVWkqNxZFAdgPojYhpHgig5eSzyY++/H7aFzl3hTjd/Plj9DdcS/+Exphd4Ros6z1BSGVCPZT/t+/e9S/YBrq2un/4X+4AP6HqmeZFthz/a2y20znlaMwXjYB3ncb7iu94CmHPviswTxvpl6qky0Fbtk4cHmB0vlQhVjQch8QS3fC7TaGdSyLmIHHPyOjNsbBBtjcYNxlNesKzCrp3gCHRQWZGNiF215RTaWcei7PGUvSBsscS/6DF5oPC/Ca/r8q6c8Bx2hgLQnK81SpLkhk2n7Sj6Dw88KvAM+WbBtNxfIHJBCa49YXufZso5ZrkJD4/zL+REkUkvTRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0raSM7l2/pYFF5NvSBEj3StfhMHWvPDNkBnAnju9ldA=;
 b=P2cs0hU77B/5OdQVbmUfWqngEF7R575PVxDnLtdmk9EnjDSoch7fxk6DV7QZ3VTdiP7ZJFX3neu6lqKnYXaRnULPan2OsSh6nFlp/T6ZcC8Z5m8CuX6puW+WcHjSgp3o/2qL7nurWoA7aCmQTK/trvQPoK6F2KO3slOZLgK2ST2F974Yy/5lKsBC3KpJhrqCIROQ0Pqox3GfEQVN4r1QMScDE7wVn4j2J7HKneRM+amms/8oLyh/Fr2aVhtPvxtIz7J4hWdRnPkem5+PO0HWYaXrYUVVHOhbrjH1eUKZvBfQSvU/O7a5vRdH9uCQD7tzpuIg8H+98JSXh36r2x1phQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 06:00:57 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 06:00:57 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: frank.li@nxp.com,
	imx@lists.linux.dev,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH -next] firmware: imx: secure-enclave: fix list UAF in init_device_context()
Date: Fri,  8 May 2026 11:29:45 +0530
Message-ID: <20260508055945.1840814-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|DU2PR04MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ee7391-af4e-4c74-2968-08deacc72c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+woO5zpfCgaBcVNPUeNPG8pT6sQN0+Xy/tS+6TnEq21a9R+dwmFrhrl/i9Ja8XbkBpH1M8wq6Rzxis8vCBAHdixtLeZUBUcCDGpqdTMO4ZcavzYXI34ZoLNzyeWL3jHvVk6PTxwBcyW9oURhtXWcoaAoseWQqzUUJzOFVmX+hptGpWw7k1glxkQqn61qOA0oO9Vi8pHfeVcW08xcAizxol3BAJqLQvr+dbqKVbeTAdLEUFdnJoUoODjQt0m2lbN5ZhdT4onJD6Z7/t5kAKz6nyiSN+62uEzr6s2cWs7X2WRLigDO6OvJM10VCdtChGk2QtQdvz3aUqX4w/BVjnGt4noc5EpUC/m4m2BeUmX3R4td2BThdlNOaWDK46r6OgaYt641n/Hty6e6r9uBRo8mCa8v8EqgIz3nMwH1WsLDhj3NTFCyd4b2lH7oQRp4rUCZAxbzjxGNyi9LVp4kJKCzWMPynh2LiTnshBkKEKYiG5oRu7bjnMI4l7y+1R2cvPLr2RkH2bp/5rTIQfPYEd+K+q3OpUMzZH6u6MVQ+BpWg7Zml+4vf/m0bmQz2taUTPlFf6p1ZkkrV4qR0kTUcpQiLGmxXXP8FyRyaRJRLXGTKhu5eoSs9zzMMuqiUoyhSB5HiQnEZrrD+RNHfbxj4ngJkTBNNVZQyZuAEqNAZfPtSHo/gpsXCLsF1jc8KUM6bS1NMHETpitQ6T3GTWgdisEGkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qe+4juSSgqtgb6Kl6DiQolRxgWvUbJHuQ9GjOJgApFL1ySG22QDhOLC6nyW9?=
 =?us-ascii?Q?CRcdibrWp3WXnp7z8P+tKNy3c3+ssxL+0q8n730NbhyIDcU/nZ8pZ7ugDdwL?=
 =?us-ascii?Q?TQj5VdFdxgxoVZ7ox8mIqI3sFyeQs0OnxOdAlvbH0y5VTRrq/rP3sxklx1TR?=
 =?us-ascii?Q?2xKQGrbW5+OvPtlCA1Y3MZY9acr8MY5u6nzUTzyyHG9VjvvS6WVK+Ysm5T/p?=
 =?us-ascii?Q?KMqVD1MORXDhCrawvLlIpHCUF105pLm4JEkknTObwvVReIDSg7bNaiYs1mzF?=
 =?us-ascii?Q?7wZuQvP38lmIZ9gHT5qpuTRzYP5CGzSCfp3WuQKauyH/A+58q+sCz7p/BOqj?=
 =?us-ascii?Q?wwSTEvzaCw1voN8Z8RkjMI+xMnyiRFpVa4HM4hRzqK/lC+BHae+O0E85gvwZ?=
 =?us-ascii?Q?tixBZjqRdbv9essyWHzJevEEBgaMQrFKlCxFvy+0n8d9zocctqAQD1sY06K4?=
 =?us-ascii?Q?eJDfWZdy6zP4pUehfU9cF1sK6tLY7sF4O6eQXZH9E+DGzp0QPNmpzKyryXLb?=
 =?us-ascii?Q?je1aPT7qrh8moYAxDB44JZuXfztkBcAq1MyQaaLLHO5zhE9ItTKZ9jjYR8U+?=
 =?us-ascii?Q?i5Bt14jkxYL+KvXvw2PbXAqIv46EkWF92Cd6Finl3DPR+csG3T965xtJwCEx?=
 =?us-ascii?Q?Sk+Pf5Uy86pqRuLkuwAiTew9ysaMhHnsf2/SwxqXxs41ZR7grBN8aGPv/GcU?=
 =?us-ascii?Q?vf+eQ+9cw6fJFBcviultbI0OMEBOMslA9lzk7AVORglLWDhcsyWymZJ0mQn7?=
 =?us-ascii?Q?xoFu20An5hKxf/6BkC5gqMkTbHiDMRjmweX8JweoSWU6dV3kHXMaCuFeWsK7?=
 =?us-ascii?Q?oCuuBnS7iAXmEnLAfd0JqzRPpwe0rvU7wOn+1mpPNEV3wpCfF3ZJZ+xCZ1z2?=
 =?us-ascii?Q?aURSpZ/czurVo/GpYdpG7r88EAszV8TUJj6yM4kCxthHj8JslnRQFd4dowSi?=
 =?us-ascii?Q?qRXVpukkJJmyxL8rr/GIlsNesKQVFF/G87J9uwVl12XNnrcSncCLYyVnn298?=
 =?us-ascii?Q?AMlmveUNoVncy1xl4sdtJqGCy/Z5POfXFXacVt1w3aU80FIBYxq8DRfVSMnZ?=
 =?us-ascii?Q?hR8SORQmL2iNfM+kWXrOoJ0ygAK1z2mtv8bG1kdkNqLGG7Q94ZL4YH/lO0+8?=
 =?us-ascii?Q?kYVjvqCHr8C1h6SN9i3U7dnNA8eCuA5WAuT+pewObDxB13hUa06RL92AB4nQ?=
 =?us-ascii?Q?YAQJ7W30FUjXBoSuart4C1jfWEK+6y6Ow5/Sa0jQqBMwxbE9swailMNzOLQ2?=
 =?us-ascii?Q?6aDINqXUcS+RALGrqMA9dwX7QFzn7bzfDZwMPl2crfeaRcapwTXKn1PEo1x4?=
 =?us-ascii?Q?INomZLkR4ulLXnsQbBMH8MwpPtiMLZNJb1SqSTjjY2lc822ix+AxWZxms+lT?=
 =?us-ascii?Q?kQJLn7gMY7fY0uaenvQT/TDN5m8o2phJmkDREUE+1Lp3jY5rskXTrpHnqGtw?=
 =?us-ascii?Q?cCfbuL33252qYsvBTt/IOKhPJ7TvVqJ7Gr/z4KRphgkPfOHmOMnGHwzo+6E2?=
 =?us-ascii?Q?Vsing2lbnLyd1PQDRD7tSkKufx60Bf3LFEThiGXP+c2XXjydT2tzP0+hArzr?=
 =?us-ascii?Q?v1aCRE4ykecij4PpRmqkYsLjViw0QYg3Z/ZskQqX47iGJnFSZBKgnJdbasqX?=
 =?us-ascii?Q?97uSembvOKzjRjGgIVMxxtPuvZBbhlCcWbJ/L8cYvlulyu6KLV0OG1nZ7u2g?=
 =?us-ascii?Q?jBAksgeWav6zkirC0qJ0NKEqZmMtdK+UDulX6B7/PSC1eRgycuXWBuFVsaj7?=
 =?us-ascii?Q?3m9GSilWRw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ee7391-af4e-4c74-2968-08deacc72c02
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 06:00:57.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIwK1qwjsHQkESBfZ2H8vcLleuP5BKeLpdU/1o1hKEWGHBmunx+XS6jDVixH8mm9P9d5w9pQEQI2HQ5UQaBsow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8599

init_device_context() added a new device context to priv->dev_ctx_list
before calling init_se_shared_mem(). If initialization failed, the
device context was freed without being removed from the list, leaving
behind a dangling list entry.

Move the list insertion until after all fallible initialization has
completed successfully.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Closes: https://smatch.sourceforge.net/
Fixes: 4de71839142b ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 3a1e0c6a942b..814a1946d1c2 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -481,9 +481,6 @@ static int init_device_context(struct se_if_priv *priv, int ch_id,
 	dev_ctx->priv = priv;
 	*new_dev_ctx = dev_ctx;
 
-	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
-	priv->active_devctx_count++;
-
 	ret = init_se_shared_mem(dev_ctx);
 	if (ret < 0) {
 		kfree(dev_ctx->devname);
@@ -491,6 +488,9 @@ static int init_device_context(struct se_if_priv *priv, int ch_id,
 		*new_dev_ctx = NULL;
 	}
 
+	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
+	priv->active_devctx_count++;
+
 	return ret;
 }
 
-- 
2.43.0

