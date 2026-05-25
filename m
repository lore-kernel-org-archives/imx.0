Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF36C1AC44D
	for <imx@lists.linux.dev>; Mon, 25 May 2026 05:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779687448; cv=fail; b=KgzOPQ0neUTV1VRWCy4unhsUYKDqaoscmrl48uFpPutXWr1W2mnMwpuwrpuRvhUFZ1gBeukPsK3k2wfB8DLK+FInwfr8kwYBWxaJU+XSvvR8SEKyKfPDV7jkkGGVkArI6LGWICX47kRrafarvP4SmaxaPv4p5lyKMcCG7uMwCJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779687448; c=relaxed/simple;
	bh=u17uz6x2nnt0zFPB1jXF4wMjgsCbai/AwmkD5rG+7i0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pUCXNJlFKc9ErZy/r3bIQs7jA0MfYhNaj4gaJgjLgiScLtMY1t0edYDSx7pRopP8Yc9SDCnT2/rDUkvBaiOjaxn8vGIXfSEN1oA6UFwVA77FwK41+koq+nfrucWCcOG8+hKEM2cUnuzediGdtfPSOsAZ8KVIOZGDRGY5hfIKaUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wB/CdMd6; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wB/CdMd6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWcLsTmlmMso/lNkvjkPe7uVVkr97IYWIhMqs0fv5p3v9hWswNmgOkXnw7QPzY03vHpMUydqQKPW/h1KtdM5OIP1lli1hfoYToRtk5RHfWPf4nyJeLGWPUfmEPabCohcJ7GCw7g4LEaXVecSFX2UfNdPdljqotne4PVkyszobgCdoi/cAzWWVlHN0+jA99n2uDnitX5EEWhiuIaTuO+v7IXESU27jux3Xp7pn5lnvCQrXH1TNrdb1KMxtKWID4EWCtA4f1tedx2yGvVS0ppkKAQ7IYosY+/YMPclAncdIgxXyoAp6vzRaINsJx9ZW7a2iR5pl+37hHNtLD+3+vW5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CifxEUy0Fb7i45JbOxrXZTRp372WzmUduT3zNMjFBwc=;
 b=mU6d4AUBwQYulwDjXUXoDnJbs5ouGiJEQ1fQZkjjqtwEZMc+r5ezYIhAnnXdnppymTTw78X46NR7usEIrLdnGKA5JVUe5fnr5m39HiQfeug5Wi+fRiUztO5e/2jx8dhKv/ANYXvMYqm6dYTDBPFkklQGJdnvG13WSj6E6n+G7JjUp0ZzTUw5/CrazUPFIWOSuV1GzlfrWT9DYDw9qQWP7LHeIbCI/ENdcxsmlLsx1HBqbY/B85befAvnyQAehDMw4G9x3TPVYIP3c9p2KUeM0LaqbB0QgtgOCe8+qhpBio71GH75QNwRSDdLfFxh1F3AwHPum7PZhO1GdEIkuE1qGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CifxEUy0Fb7i45JbOxrXZTRp372WzmUduT3zNMjFBwc=;
 b=wB/CdMd6EdLIWWqkJu3J6Td/UgN33LuES9nJAKu77OqxURivVoCmlwEZr5llDyeYoX/STuRX1XHcOhYGTBSbj77YNxyWOnewdS/4uU/Gc/M2tNZc7gC323dDp+kXVI/Ma5fkFTrojWmvnZrI+LqXmaqw06espEqs1PzhdK2um/m8pC0fttbsTidMIbO7S0ui4PUdKs0+Unk5PKmJ4NVBudTY+emUUEyejzIK1JdpgniIhAG9+FVkzIPgmXZ8llBIZUKRD1+xVRj3a3Jrz2yfG2fogj3Efhh+hiCUQilFRqk4P0iRAruLf6Dz8oEsHzVlgzFje+nEB21AvDz3WEs/KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AM0PR04MB11996.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 05:37:25 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 05:37:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 25 May 2026 13:39:29 +0800
Subject: [PATCH 6/7] firmware: imx: ele: Use dev_err for error report
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-ele-v1-v1-6-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
In-Reply-To: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AM0PR04MB11996:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3d64fb-21e8-4347-ab88-08deba1fb386
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B7zSYBa3bzgpgO+i05Jd3vZv+fNCe9jZxY/d0w8oqvjTP21HJR5GRyupX2kr09NO8T5ioQa3xBd0m0eEvNRyXxRB4jr/etvq3U7IljrhSxuAC4Pq6rAVxLlG/vFo+Czjb00tRMzA8ENRbyAE4w9Ratcw4cJ+JN+GZzRifdLtIuWNFWwcmtOxxINN2DALYqM9gOBTq0FtXf95KzG6VuWm2oqTb28eSdaLW2HwoV6TamqCzTpubhO2qK9fyYvBbBBuu9OKtNEKdldRo5HLYUQ45SK0+/nVcNCSXoUrNN9wNK29ezMBwmQ0d4DezDWKyvrIG8B4cZJf7sLKf02M3jrf6xmzXMGabGw8c9fKHdZ8Glo8uSwDoOafi0Kd007iGeh0/QfsRTWDOo/fhJvRf0UhqtseXe2z0bECBZL+W2ixnO1Opezp1wqfTFMvgnzKBn/d02kREDb5dAnaRC3xxibAPNukzn7aHzrDztYhKQTwOLmdJafC6tiY1s9lgPIEF/jUiHJ6W4R4YDG4rjnsmgJ+iRUC/lloFrO8MBzu7ZTNa5bK2laZ/nox0NOKtkZ2UbT0TSwQiqFnT6fr6UhPZv6UMZaCDh+vHj7aqYmekGHxYwx03HySoT8sAVytXgAiehlQVqgOF1FOT8epCPwtSPSMVdhHMvz+mSpPPpX/D/Nb0nR0lMAbxyXZWJ0BSLmtOlGoAv/5Oskq3BvuFs5JyH7E0CdSiEyWA0MDoDgJTPnRclvVpqOJ05IOw4rBenHUVIJ1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTNWWjM3RUtKSHJmaVFoSUVYYjFhY3JZRXU1WnhPSXVVYktBVmVsWmlxSHdw?=
 =?utf-8?B?Y2UzckFmSDBsM3pHZTlQUEtCcFg3Z09TRkx1cXZ5S1E1WjZFY1E4NFQ1UHJR?=
 =?utf-8?B?ZHFkaTNraktlYU1uZTIrSHpKMCtyS3VmUE40dFZZYnBXVWZncFJZM1JiNFo1?=
 =?utf-8?B?NGl1SVlKQ1lLWXY2N0IrNy9WTkkxYnB2UmVhR0JZcldDWWJFaDhuV3U5MUtm?=
 =?utf-8?B?UnZYZ2tGL3ZCQ1lPUWU2cEFBeXJsS05DbU5BM0E0SlFJYTQ0c1gxMjJoemsr?=
 =?utf-8?B?L3pXTmc4blFmZGsyUk1kajA2N1ZLdFRJM3F0RU91UDBTeHR2RzZCTVlPcTIy?=
 =?utf-8?B?VFN6Zk1WVWRSRllVOUdBL2w0Z0g0UThudEJBSmVFc1R3ZzhSZVZuYjAwZFd4?=
 =?utf-8?B?WWloVEd1MUc3aDVEbFBDcFdRQ3RzS25lSzNRU2c4VU1XQmx1Y1JkeGRsZ1JP?=
 =?utf-8?B?UGtzQmp2SzMydlNaQnVyTDZ4TEpNcVU4ME01elByeDFTTFBzeFozcHFhQzVF?=
 =?utf-8?B?UGRXNFFTU1VvZ2MxbjFEQUNHUDljUGhCcHY1V0J3YzhLRVgrMkFlUGpRMEtn?=
 =?utf-8?B?TmlLTXFJNm1LNUM1aG9VN0h1eTE4NWlTQUN2YUdtV2RGTlJtUDJHQ3FCWnlS?=
 =?utf-8?B?UlF0MGV0NmZGUDJ5bTZvelBUN0h2WG1QWGtMZkg4MEdYSnpkSUlqcVg1RE15?=
 =?utf-8?B?V0FJdWhBaE4xR3c1dy9XdjNMZVhmNml0Q3E2NHA2ZFN6R0FOeERuVHd6ZTVv?=
 =?utf-8?B?RjdUQTd4eHl5VWxDYU9nd0szQllkM25sMG5kQzNTeVFSZTVVMUVYOXMraU1o?=
 =?utf-8?B?ODZJczdCUUY0am80ZTVkSXVBL2ttR1h1ZnltRmV2YVRHNmFGQWJsS05NVXdp?=
 =?utf-8?B?ZjRBaVhocW5hWUM5eHdmRmhGd29PUFQ1U2gyQVh2b3hoN0VGKy95K0xuemhF?=
 =?utf-8?B?dm04eXVOWWFoMXZCc0tNbmlHR2U1aWJqSm5EdmU1MXNSWnpnMVc2ZVhnYmRw?=
 =?utf-8?B?QjhSbjNUSTllcXJoWlE2K01xaCtrUFpjRjFpV0lxVVkwTmE2Q1MxYnBXb3Zw?=
 =?utf-8?B?R3h0d25ENmwyNmhNcERBc1dxTlpxODl4NFUxcTRvU1FzUVZYT3QrUDBxVlBi?=
 =?utf-8?B?TDhDSWtTSW9rWm45QWVJWjVJT01Ta3dFdllFdVJmYkdQOWMxY2RYT1dRTjFx?=
 =?utf-8?B?WlZqdWdFelVIVmpOWjVEemdFRVhXNmtGMHVmTXQxV2cwYzRTc1RRcWJ2c3dF?=
 =?utf-8?B?Qkt6K1MwTGJreldaWmtMRnNnZllYVXhDdVpuQ1p5YzFlVXJ0R3lQUGFuU0FW?=
 =?utf-8?B?VmJMYXNSSTNpOFJiMXcwaWFxMVZFVHo4MGgwMTc0YlFINU1QSlBHWWlNeUtk?=
 =?utf-8?B?eWZubFViK1NIWEFwQ2ZsM1dsaWhmRE94eVpwWi9uODF1TWZueHZrUnNNVXl4?=
 =?utf-8?B?b2VjRUl3RXRWQkN1d24yYkFOOE9GcU04YkRvc2k3UXdOdER4REcvQUxNdmVy?=
 =?utf-8?B?Q1IxMmNMSXNkNUtMZ3lucU5UM2c3VVNuN1QzRjlacW52OVV1cEp3ODNoTVhp?=
 =?utf-8?B?LzJDZzEyOXhKelB3UlpzczRaSitLeDJiN2tBQnVlcks2UHRoZ0RSY2RTQjUv?=
 =?utf-8?B?ZGU4VVZUaHo0cStKN2hRaGNVQnQ2NzFMcHM0QnRQWlFqZGUwaTdnTWdyMHRI?=
 =?utf-8?B?Q1VHQlNzS2MvSU1zT1VHUDJXTEtiWGhkeGZiTllXUHVLbVFUclNLOGo5R1U5?=
 =?utf-8?B?UUR4NWpVeW1kamU5eW4vbE5kUzlVVzk2TjdiM2pCTlVHbGRYdnJOY2RvbS9H?=
 =?utf-8?B?dyt0ZE1LYmNHK3lBMXlIK3BpMnk0WGplbjhCcUdyZTdZT29ZMGpGUlVMRVpS?=
 =?utf-8?B?MTIyWGNEOGR0MjJtaWJoMkFUOXNTaDNBQ2cyOEkxSUdCNmlzeERSL2RpbC96?=
 =?utf-8?B?T0o0R3JGb0h0YTg2UW9iZEk0ZXY5YmFxcU9zRzkwMXpTc29NM1ZPS0tmN1NQ?=
 =?utf-8?B?NmVMSzd1QWNGMWdCTUhJZ1lUWmsxNWViTVl6S3BwQzhoaDJ4bm9lTTU1SHdE?=
 =?utf-8?B?ajFCMUdiMTYwVjNtSXpQTGRUbFNWQVRvNTk5YXBzSkpkNlJMNzQ5TUx1b0Ni?=
 =?utf-8?B?ZlJCZkh5NlUvUUhKL3ZRZEJVdWs5SGVXNG5QSEx5aFJnY3ZQa1NvaXR3V3lz?=
 =?utf-8?B?MzVnd3ZQWkFqbGQ4K1NZN24yZjdVQ0UwRzA5eUFIdTdETzdkMXdxY05nQjBI?=
 =?utf-8?B?ZDY3eVZUZUNmMXQ5WXpnSTBkQnA0UDdJVnN4Nk1WYW5UcHdmeFJTcC80M1Bz?=
 =?utf-8?B?bzJFUFB4S1JsMTNibWtHSUFwZitrZVI5cHE1Wm1yR2x1TFMxQVRpZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3d64fb-21e8-4347-ab88-08deba1fb386
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 05:37:25.2757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWiapxek/Zm+xa+Pk342PZ/HEp95A0hGX0CfayIm/3ZjIUwurynvOmSD4o0bhmvC7dXEqEIg0K2gAozWUQbTjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11996

From: Peng Fan <peng.fan@nxp.com>

Use dev_err() to replace dev_dbg() for error report.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 05a518df38cd6a068266757969b361249ef0560a..2f0046cd5ad06d28c11ad5bf7b8544d1aa9b9bb6 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -74,7 +74,7 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 						   &get_info_addr,
 						   GFP_KERNEL);
 	if (!get_info_data) {
-		dev_dbg(priv->dev,
+		dev_err(priv->dev,
 			"%s: Failed to allocate get_info_addr.", __func__);
 		return -ENOMEM;
 	}

-- 
2.37.1

