Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCBC23EA94
	for <imx@lists.linux.dev>; Thu, 14 May 2026 09:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749574; cv=fail; b=ABMa6u21cZpj6i/DNwsJmfx/YEh2YED3jna4gvWKITPoADlA+gvSWXFBZE1HOPzxHjIur6IXkjHRYw5tYrQezmsfeYRVQjM87n0qZS602dD9xSQTl+AXNt8nkIK+ghV38n+2bQS7iSQHNdmMPjwTd93DZqomoZyG0L+XeLGdqT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749574; c=relaxed/simple;
	bh=dN1j4PBtPH9P4zVU7kSEqxg1cU/rAZr/y8fKB6WQkxo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nnlfNXJJZf2bxf/vloWdXgWx4HSgYBmUJ5ocEFBly5ai3fHhMfRWJJ87OVEDy1hV81JBHwQsxpet3w0hXFRmcrYEq51oi4/kUHWNRyu6lwCxHDFZkbUIBP8tA7qY15MNKSJ1TvW1i5Kh35mwSr1f7DqZTlJKylMAco8Cf/Pv6h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nPcrCidU; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nPcrCidU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaIXKh52Hb8A2AMyoKx9nfIev7PBWXdaURnyuMc4tSlDMRcu/veRM6+d/RrtwW1CBa0I+r9ykCn161DvI+WhIbR3APO/i0CW09VLoVLQ+oRPLA5Thx69ogfHHvVvDaxYRrtJWlpNfh2+LfVX7WfIEbIn6oTN03E7+fFTHUFqazCvXsuqLNTB2hOst8xw1R4FxKmo+tlyPZugca+AUfM+6PPSjROQimp0CDuzuuCKNtl7BbLWxGayNnZcVU5LjaVYZGwlWe5StUlaGzz4ty8D+peQ24L+8UYKDZipl3TvnzBcjvmLtBqUhWsL5a/6m4KeQsMA8bQVyKPIAoFVHl5DiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvZuYvHpCWmkU52fwP3BLkLKBd5H7m/4RX7PePjHE3U=;
 b=deKHZuH3PYdE7t3QGKVrBYD3WAerX0F/7ap+p9lZC10p/atJRsAGCZmpQLdbSQRH/Ej9X5mdBwg716rCVgTLMo1uJm5/ANQ5Od5xWYbHrjuHmjT8JSYYaqK86aMJvHyoBCb0PM78JfwkBNQgFOFlccJdzpUa+DsDOB1w8k4XvbMIRScAwfPTL15VYBbBoK1FLEgEwxgiblt13EYnLAi/DQJBvVDzfGqaear83RGB6talAQFqujI2k672gbuObZiKtN7/RLqSqz5kR363QA8OWwfpcgKnjxEkVYWo2SrCEJsbDFUmy9X2uTS0/bATqTRI8g4+isz0OUq0mh6dr1oEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvZuYvHpCWmkU52fwP3BLkLKBd5H7m/4RX7PePjHE3U=;
 b=nPcrCidUqzls5J98qTGIWl8Ov160yIQvhoy3hRHEbd4Z3U8Dvs5b4gIW29nHqpRoFostRVKN5UissZsJIWvUbnC78o7TyOR8Pgyhn1YOsja+oVyzBaBAWVsjjxXrUW5FGVRG91vB0JFErFGqPh/8CQJpxtFdxS42oOawV8s555fWKUAgBlG5v4aPdnAEnHPv5hbchGu7SL/SssPG3d3jaXyxL7ywClmbNCcauldof5xwMmsEu2+F2Ge71ZjaAKnRstoC+/as8Tn2WjkAjEJqVyIXzscWCuaqJqVPumKEZdP6eWN5ZIiYXCRbuLlkytJ1wL+xBLcYBO6eAUfyEFIamA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by PA4PR04MB7997.eurprd04.prod.outlook.com (2603:10a6:102:c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 09:06:10 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 09:06:10 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: frank.li@nxp.com,
	imx@lists.linux.dev,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH -next] firmware: imx: se_ctrl: fix init_device_context() error path
Date: Thu, 14 May 2026 14:34:57 +0530
Message-ID: <20260514090457.2186933-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0261.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::17) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|PA4PR04MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc5e6fc-983f-4211-fc53-08deb1980a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	1+ZZVDB0WZEAOiXnoVMu2P/1/kEA9s0RJtnZyYFh30glcBdqj8vXorsBGVDRg7uWxYnd/hdI5aS3zdL+qhzg/Y8UpXiqkKZLey7yeYf/VWKpCwM4pIQPUSbEd3U/FjyszFGlF5TiUp3BrcrR9lBC7R66WsDrF/oxszrtBRHytIhJ6MWUztJNuT4L8+lb5qYLFSzjRJOZtQdzEP3Ly3otxCSHtataiysQ3boPy/jM/qFkYdgW0Oeq9fmnxxndhdNuw8FnRG9Bm5hyHeHp5dOTmH/vMLVHlJO7+/8VTTNDTjuLQJA5GwA60YKJfEiP2C7EJSRMYiSR99aDrM6YPCNAQE80sYCE6txGYzUaDO7EXPRTxRUvHKq89A8L0xdxitYSsv5hAFYtLmQtZOTVSt8UyFRjuhGEAuOtNAY9xUJXu1+OBDhEelMQA31ecRiiAtuEqQrF44eKlZpZKzPxgE/xJLUTHOayzG+TbFBM86vXoT3vvLhsnq5zrp6w9svkRwfvmMFAvQVUnO9zQ/pcW/XY/WQds1c1REVsrxUUOUZTTA2v1pm2ad812kKPzZDMHdcoiZTORX1YJPHeGOz4DNl4pTq5MlUBIbZfKWpxDYK5BU1kOCJeRIsPZei+APdXiASu0X8UB4lcVgEnowgq07NAvpy+tvMkC2AaUH/A0NvjCQGXj6qknYuGyOkjgKntfcauBBMNXXDb4QbRyJ07b/SFwist7sG62X661zKY2B3VzTTUE71YtuSIkDRfWAJ86y7/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O6PLEtAJl3DTHJPWY0OXXhai47yng49UXYHhOcu9ZwXahWKeUgrfwBU+0Jop?=
 =?us-ascii?Q?cTLEvVAUVZgN3u6c/qVj46PDQwaTrhvNUB3t4kf7z8P9WOYdJMU76u2WHVHB?=
 =?us-ascii?Q?JD+upgpwIu6rPEYYvIxFSrAjn1estPZlqZ7p9YFvycd31zvYps+56LnA+U2e?=
 =?us-ascii?Q?vT5mHvLKMHfQPJ5rhI+yxzJoXDhUK9eH2YuOCMA7HhoFRmqqTWFkruQV11IA?=
 =?us-ascii?Q?tqmoVCvX5whYmvcr68zAs+4ZOMywM9CsutpnRr9W99LYD0w2fGkY3eFuDRvR?=
 =?us-ascii?Q?cmnUf7vD/fDKjYJsHGKt7UwXOX/WypyoOtKc0+orZ3Tl0ryjelWX0pMEAV9z?=
 =?us-ascii?Q?2nbCfmzFhVvQML7Fa+5u7TIHUCFtb7e4bPnJL7kLW+TiDDxWpWAv3Ot6epY9?=
 =?us-ascii?Q?982eoA1+I4lI5NznwpYkgRy34fDSPitZhmOyi0HbKn9Dr9eYfFHpauGD6Ird?=
 =?us-ascii?Q?3rm37uSACeKf90X+Tze7dbmT7fkgapsn31KzRG5w33JpW3J/dLs1Hk88Mkfx?=
 =?us-ascii?Q?g1VUis5TPFYW47covezEzUPv8UlzHTsuakywIzqM5yCL9M8CW8KEWln9qcZV?=
 =?us-ascii?Q?9KwjAEc2pyNfyi9ekle610b18+adjvLXZMqu+k3gr6rg2DlyloedX4tEea+R?=
 =?us-ascii?Q?mhQGY/nx3tkDg0gfPxYbXuUKE2URujiWPyvGbL9q87xRmvGdcZINbw1PhIlV?=
 =?us-ascii?Q?52vobNmnL5NUnE7+S/d/4x7+QPilwoLWvMIJe7R/ls9MWs2B6wj8WFDSzbst?=
 =?us-ascii?Q?uzK+tRzXyEs3h6nrbmDoYBhYvNMdVLQedsgKJYbrJpU6XCxmveDnAxMdjHew?=
 =?us-ascii?Q?cm7oOsvZ8HCpq3/XtyQK7JfxYFhGm2gLTyP19BKlxUTshShSjsMBkCsiPehy?=
 =?us-ascii?Q?ut23lxGpAalPh9G1lqx0L0z/LQH7iOGZIpVlkRv0LxQbam/Cv5ZXibxW34jR?=
 =?us-ascii?Q?mrzRXn0ZVDHhfxuVmdVURrhsMKZl/9R5Mdi5iql2iA6HgfIVafVvWTxbY968?=
 =?us-ascii?Q?Vk2QzCj1CAAxGc5y7Vd99uSIpbgr/7H7DIAX+1C0Gq6swRfXzbFGn4Uh7usA?=
 =?us-ascii?Q?ZJBW7XHZ99UmFGr3mdO/LRPdJzmIBnwCzDHbtmdIY0yWUHIv5JK5GYjf936S?=
 =?us-ascii?Q?8sPF68rOFPR9MJMwnXHmBXBEh0/k9mnWPFU7X29zEp+D5wHa3YzICO86FprG?=
 =?us-ascii?Q?itVE1kdwgb4fCYUOhr+fAzq5phTElZvcRDDGwQOR28oLFJleJdn+cUNLqocR?=
 =?us-ascii?Q?t25siCgGVvQqzNIGd8UMY2ndtkv7SeY54xl9p41oktfdlcOOjPLjwy/rnTXw?=
 =?us-ascii?Q?qcDvEGT2xageWdlwSoGoHylQljtUG7mu7f4Ztvg31uGRFEcnDxSIYVr2tR+1?=
 =?us-ascii?Q?jj+WLa13KNTBWStRKc3S9l9iCRBmNNmMM7bQqBr8neq+DRW9xLfoVyi82vpt?=
 =?us-ascii?Q?XuppoUmfpzMtK5ASdsziFaFcGFZ8TRGg6aGGkeaJcRYcTYNafDybxl+VPNHF?=
 =?us-ascii?Q?AM11yiLOCcYaMVJKmcvgKvUsv+M1intDXNOAv8V/F2P20ziwF/qhizD6ng/X?=
 =?us-ascii?Q?OEztYe2ZoHdQCo0d0f/HrKIimKmLA6tfZFzxF7YBLivJ/4N6PRsW6gG9NLx6?=
 =?us-ascii?Q?wW5+kq/BIetxF8j/xIkO2soJpRKpdeLXU0H9FopulIXOoFR8KvJlglpawi0j?=
 =?us-ascii?Q?RzuBG0eiydFmXoaeZo0jiJcn0KPgEhgzoYoI3TtXjv/7NNGhMjOaExmgSizl?=
 =?us-ascii?Q?QdHWnKWqlA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc5e6fc-983f-4211-fc53-08deb1980a5d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 09:06:10.1431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRksmQ1F2MeAwAbyJmjV2Q21bLKvVCxrRIWMX/Xx1LRFhmVsSYAyFf18oLbGKq0h+emyGxmGPEqpUT7i/rWVWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7997

init_device_context() adds dev_ctx to priv->dev_ctx_list before
init_se_shared_mem() succeeds. If init_se_shared_mem() fails, the code
frees dev_ctx but still leaves the list insertion and active count update
in the function flow.

Move the list insertion and active device context count update to the
success path only, and return immediately after cleanup on error.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605090441.GzJS1R6y-lkp@intel.com/
Fixes: 106ffe5d78ad ("firmware: imx: add driver for NXP EdgeLock Enclave")
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 1683b259864f..74786ebaaa89 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -481,16 +481,17 @@ static int init_device_context(struct se_if_priv *priv, int ch_id,
 	dev_ctx->priv = priv;
 	*new_dev_ctx = dev_ctx;
 
-	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
-	priv->active_devctx_count++;
-
 	ret = init_se_shared_mem(dev_ctx);
 	if (ret < 0) {
 		kfree(dev_ctx->devname);
 		kfree(dev_ctx);
 		*new_dev_ctx = NULL;
+		return ret;
 	}
 
+	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
+	priv->active_devctx_count++;
+
 	return ret;
 }
 
-- 
2.43.0

