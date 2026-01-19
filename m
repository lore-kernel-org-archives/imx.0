Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B602264C7
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 09:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816572; cv=fail; b=RFo4M1HYqZGdanAyRxOBJzd5Vwhz5oPf0IcjBUfv9B12G3InV23Ws4kS+nCwsGP7fluxSWLIEJYwEhXx7xkQDNABJP8WXX7ce9rid+D7wMjO6VMgfE9usAk0GZMsGew/aSVgcwNtQ9TtwDN4H2LMezm9hKxDJb0cvTeFe+E6+Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816572; c=relaxed/simple;
	bh=pp5EMhI+dquLsKN0R1Fpup2hpzWfSsFmd8FzUyIAhs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U8K4Ul+TIyyl4u9JzEtWVVZ+Kmyv1WjFEco9kBqLhw+iSPKGXtv0tqCdqq3B8snLoLZHueXmfX6UOWF4PvjcxDHpFarLzoSX4giMnaFkxlrxh/ecNrQMtss/Cr4WvVsThKPrvqgz1ibIQo6XJJwS6bYIfxiIxyXnXseh7w1KNas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oNindopk; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oNindopk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+JczITwbd6/0+8m6GJrJC1rF5d5/MaR6uAD3FSlVGbuYnVlY3Ij/UqcePpmDzidACiubz6+KUuDzpRXD5aN0Ok+5CUbW+jXpXHCCYKil7wx2aESIUV5V3h/S3OSVjJ1zwI5dZyhWZU/MlitqRedYewc1zcNAJQSCD7ULvJjQofP6ht57iKVww0Xx3sh1cI1/GfOqIS+6F8L7jEA+TrkJFVMQ4ky3tQUW5k3wRFSN6s4S1fCn7sHWn+9V8exsFhPegXT28KFgUYsIJpUDpXQ4YwXy/hIbtsC+2HKFFPDbOAlmAqDSTs9Fb3ypdxZ6rkWp4csekhY271YCwL0UQFW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=;
 b=Z3d5Mknqzx1q9GY+23/mnY4Z5tdfCTHgvDs94t4RHJZoJybPPMRshiAsNXJ2Z7udLHr2Zq7/wgNybv6yisI07KLZ95p12FeZ2zjnnuevpKdhjsSXJlKw4ibPheLn05sPAGDruFjhWgKiLDvurdP4aCilOqdYj6etkrab9NPP1rpwnSdvg4Ebzbe0EqUBObm1lBJhrc5zVylf5kBmbCKE6HRehGurVHD3C21x1h6lAlVP+UhUPa4uleHe1NY/AhWS5RuEGUfIjo+WPoUoZJl+eMidLG87wBojX4L+ar08MuDaMJZrz/GGkXm4MBhLWPcygbqjgLgYhhDt/WF+nn2xdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=;
 b=oNindopkdWUWWAjx+7U05Xmfa1zrUIjDmgEo+elsdrAStlSOVNX5vgNIKcWkVRZeTM5dBsaLZ34jBbu8ydgCH+9nFuTKwKawciJ4KvLlw/cKdRgucqD6yezT5KNdbBj46OxJDCPBJeLtOuL0swPPyqRCi5+nCqzjuKxJkZsPfHESWMjH0/t5HbSfSpqJqZKobRoCcBOa16w/mxdfuz29zeE1G2TgZiPrnd9u5txFUMfwnj4N/2Zx7tSlICdVZ6pPEV/6fHgSkp3DWUJHJTlXeybcJMyP7mSx/N0owZZA07Ij0BaI+W8Xy9r0e7Sm0udvklj2Fq2wFXwPVf+f9IeIng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GVXPR04MB10899.eurprd04.prod.outlook.com (2603:10a6:150:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 09:56:07 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 09:56:07 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v2 2/4] clocksource/drivers/timer-of: Remove __init markings
Date: Mon, 19 Jan 2026 18:55:09 +0900
Message-Id: <20260119095511.3030739-3-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0241.apcprd06.prod.outlook.com
 (2603:1096:4:ac::25) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|GVXPR04MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: 39bdff20-80b2-4343-ece7-08de5740f78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NlvYxPao9bv+Kvr7WDjYJHvGAbJchDROvUTsd8hRFeUiSrXgkKULZl8T7Ekt?=
 =?us-ascii?Q?AY13whb6E8fFJ58hSsb8egiToWZGfH5vjxaZxFl2iczA6VNaka3lNSdYQuX6?=
 =?us-ascii?Q?UGnFfEq4N1+ovDqKblXIgP932SBny4xV9kQPmcjpyGVGAy3rhCHcHHD2lc+F?=
 =?us-ascii?Q?WpDY/FazH1ua51ONev1mTOKLh52HlfYiyDxWGeB31jAVvi0tQMyTuQuQloJk?=
 =?us-ascii?Q?FF535Io5NSdEid6N98m6PWn8AGnlzysb2uSp37kL9hIeuu06BMqKm3nv+3y+?=
 =?us-ascii?Q?njR+ch7Dc09rYsqsCoTbfSX/oDCc+E45dT8eSOfUD3gb5upgPsEjk53ANbdU?=
 =?us-ascii?Q?op15irPDLM5/Od8+NRKoG/ziRpHGFPm1EXXFWXxhVk3ysTXESV7A3GgQ8jvh?=
 =?us-ascii?Q?NZYkJX41J/NB1ef25Jpkmj85r5GFI4qv2++iXU5AjdtImXwJ5dDYbVdI9PgW?=
 =?us-ascii?Q?mgnbGT6yEBa9PrJV9/nE4BCA0der/cgQDmQvrFid1Zno1vHYwsFNcWlB9sXO?=
 =?us-ascii?Q?l6dUok2qEwTtro7atqx+bK9jvTbZMuN5z7wBCLkr1WFAw4oSgruQEouaXPKe?=
 =?us-ascii?Q?sZGewoFQRWTQJQ2LSjYk6Mm46GEWbRSH3WfI5tW+nfqE7sLdba3e6BLVM6HT?=
 =?us-ascii?Q?FjD2O/HvqQjKkKEzes7XmfKbIotzWj0/d9NucyGEqMO4d3gdGC/pljRylVPh?=
 =?us-ascii?Q?lqiQsB3hgbeHKZjjHkFVMSrShmEn+p97+RM3zaNKYWgWRXLidIuoLlJq5JHr?=
 =?us-ascii?Q?fNIg0BuXM995h9wilKCkcVnm+3zGD5q/nOzDU0zVKRn4mrF5qKN/T579iYp5?=
 =?us-ascii?Q?bbyG4ZQeUj+oAZDp1PleC0XGYyKeGxrkGKBxeZ6vgEy3qvGhapK+U8Kf+Ja5?=
 =?us-ascii?Q?Ggyxbq260qerQ/iqkTepdUwbBuv2hTURY3OrGpt/b5lFISAqj+s3C8FyDFUj?=
 =?us-ascii?Q?AIATlsighcri7tza4U1Dts0WrpUgCjYEX0TRRV9NX3aMGyOwU9deBAmFy98w?=
 =?us-ascii?Q?8oRtH/aM9CH6GivbJQoBc1ch7pBz0Aj+ItSGcXnUqRmRncoYpZUkOiVnC60I?=
 =?us-ascii?Q?cCckrRvVVmrqBYXlRr3GVW09WXLepzjHhcTcKL78f+4SlGzhz/a8mjsa4HFE?=
 =?us-ascii?Q?+sWSQG774Czck9KjLrqNx7fpIG3A9e0HdkE4ge3Gr+4Wc4bFng74ZAOoX32m?=
 =?us-ascii?Q?U2WssQ8hbpoWYra/UGjFXT4zbXNMvnF+IPBrjs93NFt5FKU6ccTxbeybMYdp?=
 =?us-ascii?Q?JxlJjk0veQ1SmW7HSqdKTBpw74Gr1wN4x4lJcwt6azanA6cEs/ji81KDMRrC?=
 =?us-ascii?Q?kXtJjIF3LF/rKD0HVZ7gwFzLgh+zq2NOIkU2AQ3NzCYs6Zj/K0hLqkQw6DG+?=
 =?us-ascii?Q?t7X0yGw6g2YV616yFH1rm07SdoV6/5NMga3sJqevUiYu62zrNPFfueA0r4ry?=
 =?us-ascii?Q?BQUPkBd91Kud82uKgCt7wP3sm0pCRezX9ARAFyRt32E1rKdh3mJWHHh5KWrw?=
 =?us-ascii?Q?QZIyJxb5oHp4jZWRp9PLgIOozMCNRzozGWuNU1ixnibCzmG+E0e8rCATsVmy?=
 =?us-ascii?Q?k5xN+e0hFy22IZOK39Y7UfJ75R3QVy5cpdfA8K2JvuFOi1x+nEbxLjCg1YbT?=
 =?us-ascii?Q?xlIn7ZcV68TRI1263Z2x5Lc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1QgJ4Vn/xpgTqCcFoLO5YFfLseUgj46WoPT8FJC4UIxAKivyNkunXFMV9pb?=
 =?us-ascii?Q?Ru1EZaIPQP0IQiZA2gIGl9Ke9VoQOxlpF9LeyEYkLaGeJsY35QQu3s5tamwc?=
 =?us-ascii?Q?ucA2UlAUV0kwR+Z6fpvUbxdqv0lil4DQDAbMT8ll3LYXMBvkJg8vd1fwBOSO?=
 =?us-ascii?Q?ezO/iqgNbaH9dlBM6gy2/whfiNlTu8APolt7s7GbwFRUBwy/8Joist2K540e?=
 =?us-ascii?Q?gjbx2U3zsgjrPFTTmbXsCAfz5GnU2DFCocfa6DBkoQH7asDSg/beAJ3TbjTV?=
 =?us-ascii?Q?Uyvp6H2zL+4tWVgzbX/lGEc4nDMUug2V6Em2P0IJ3o7BWlCDJxca2petthtM?=
 =?us-ascii?Q?b4eyPrCE5Z76NdBMyE0U9fV1E5z3dkngqlV0YifILKojXfdGumGZDXEGK8ig?=
 =?us-ascii?Q?BTab+AHRIFW9roJSAkUcX//n0KQNblmq/pzdeWArqrcER0SWQCK9S7+vbO6E?=
 =?us-ascii?Q?hwWdlBvb4TIp+kLIyNW5bUVp+6hsHofklsM3xlGgxfW2zGOkU+b3x1ORbjS8?=
 =?us-ascii?Q?Uh4tya++usQaE9BmbUCdUzfWt/BGncQrSSK9H+bWwIBXeNOktDdH3dy8LsIN?=
 =?us-ascii?Q?wqpUFIEG2lKuYWB1X3eKqaaD1Xd43qNmanj92oTKkNjWWxkYtEyPFtWJT49E?=
 =?us-ascii?Q?BB8ATvz/Ea/k+IIV+AJ6Pn+34fRmKkpL+n9hmB+Ee/r86rbEe3IcME023f1F?=
 =?us-ascii?Q?O6qRQReZm2ZJeYcSW42AynGsF3MsyVEzsdGKRvv4Xg7jcwugUZTWoxaKdaXk?=
 =?us-ascii?Q?TbwE5n5O4sOjwbt1MzDy3mPfcyLmwZ60TGq1vO4npNOimzZGhiX1e5uUU9E4?=
 =?us-ascii?Q?2bfwMkIyR5B241loZkHzvjEeOq1N8MCHTh4JeltsaXjGYb/JihPJmX7U5uub?=
 =?us-ascii?Q?KSGVk9jweKDhiV/4++raryG809iz8pWSZuNOrKNpwZyGD/NPHiafLrX0xRyC?=
 =?us-ascii?Q?ZY2hbZ+5HIIfQZobwMZtG0lVqGKBH5i5nCAayK6OcJ2gz/piZolB7Le5wTXc?=
 =?us-ascii?Q?zetMtu9+mEDgq5UUtOO30H+72npR+QH1Ow1OZq7rRM27xoK2upMNldqMnW7e?=
 =?us-ascii?Q?FQ311+dp4i+ACzkUEAJaTZzWFuq3iyLBSiUaP2H6qkFNd3HkS9GBzB0EWuCP?=
 =?us-ascii?Q?2cSkQctoqX2G13I2KqkMHs+4jm8GWgrEMzpaWF8AH9cKTWDyAvppat1MvU2t?=
 =?us-ascii?Q?mu3mInaJ14TRnAzeD/XLroCrE32WEThGpdG4DCUopdEIuH5pxRWhPhL2OzaY?=
 =?us-ascii?Q?0qA3MmQGolhXaGKpKsmk5ksP44hC/qReRuQpJQWQJZYUkUG2NT6/TqP+ppIa?=
 =?us-ascii?Q?YdEjNKKVPXQoNgyuZq1jxjveVN0u5zcRXd1xhjAQBpWvGg+MloPewYTG2CAW?=
 =?us-ascii?Q?FejnnOvTwn1kkfumv4rR6lpOS2vI4O4kpLzBhRhXtCRalESU2aKtjUSJd3sU?=
 =?us-ascii?Q?4aXgQvupzOdWSXLel9xIlLxI50hwMrHu0JTpOsDOlsbwjpYaw2PDs5R0UvVv?=
 =?us-ascii?Q?XnAShshfIMjtXbi8CmNZjjslblayFfPUvDe6iIIcA/cgRp0b+U+r0YQgGPw3?=
 =?us-ascii?Q?20/GKxEsoam/DPumugcr+KXCG5jIoXychbvSk4k6NR8iCeRDAn83SDmaq7gp?=
 =?us-ascii?Q?3oF+EWIqQZcAJaX+Og9fQfwRfr4rylnH9AUeaaj7OLfG3IaNRto9Aule/d6c?=
 =?us-ascii?Q?7jr4RLJwDMj6zEY9ZwVi5FlWmmd/PXLCvjnfbkjXwvp4hbvWBZAOktqPGyNV?=
 =?us-ascii?Q?7nz2+Vu+jQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bdff20-80b2-4343-ece7-08de5740f78c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:56:07.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9BbwaZX9m3YCZWCMGQZgBl7fd4g1ioYnB9xLTN1myTIX/imzl+p39gl/Sd7Dwq2zuDSi4mlrfIvm/4omg//UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10899

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Remove __init markings to allow timer drivers
can be compiled as modules.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/timer-of.c | 23 ++++++++++++-----------
 drivers/clocksource/timer-of.h |  6 +++---
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index 420202bf76e4..b7c186dc83da 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -19,7 +19,7 @@
  *
  * Free the irq resource
  */
-static __init void timer_of_irq_exit(struct of_timer_irq *of_irq)
+static void timer_of_irq_exit(struct of_timer_irq *of_irq)
 {
 	struct timer_of *to = container_of(of_irq, struct timer_of, of_irq);
 
@@ -41,8 +41,8 @@ static __init void timer_of_irq_exit(struct of_timer_irq *of_irq)
  *
  * Returns 0 on success, < 0 otherwise
  */
-static __init int timer_of_irq_init(struct device_node *np,
-				    struct of_timer_irq *of_irq)
+static int timer_of_irq_init(struct device_node *np,
+			     struct of_timer_irq *of_irq)
 {
 	int ret;
 	struct timer_of *to = container_of(of_irq, struct timer_of, of_irq);
@@ -82,7 +82,7 @@ static __init int timer_of_irq_init(struct device_node *np,
  *
  * Disables and releases the refcount on the clk
  */
-static __init void timer_of_clk_exit(struct of_timer_clk *of_clk)
+static void timer_of_clk_exit(struct of_timer_clk *of_clk)
 {
 	of_clk->rate = 0;
 	clk_disable_unprepare(of_clk->clk);
@@ -98,8 +98,8 @@ static __init void timer_of_clk_exit(struct of_timer_clk *of_clk)
  *
  * Returns 0 on success, < 0 otherwise
  */
-static __init int timer_of_clk_init(struct device_node *np,
-				    struct of_timer_clk *of_clk)
+static int timer_of_clk_init(struct device_node *np,
+			     struct of_timer_clk *of_clk)
 {
 	int ret;
 
@@ -137,13 +137,13 @@ static __init int timer_of_clk_init(struct device_node *np,
 	goto out;
 }
 
-static __init void timer_of_base_exit(struct of_timer_base *of_base)
+static void timer_of_base_exit(struct of_timer_base *of_base)
 {
 	iounmap(of_base->base);
 }
 
-static __init int timer_of_base_init(struct device_node *np,
-				     struct of_timer_base *of_base)
+static int timer_of_base_init(struct device_node *np,
+			      struct of_timer_base *of_base)
 {
 	of_base->base = of_base->name ?
 		of_io_request_and_map(np, of_base->index, of_base->name) :
@@ -156,7 +156,7 @@ static __init int timer_of_base_init(struct device_node *np,
 	return 0;
 }
 
-int __init timer_of_init(struct device_node *np, struct timer_of *to)
+int timer_of_init(struct device_node *np, struct timer_of *to)
 {
 	int ret = -EINVAL;
 	int flags = 0;
@@ -200,6 +200,7 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
 		timer_of_base_exit(&to->of_base);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(timer_of_init);
 
 /**
  * timer_of_cleanup - release timer_of resources
@@ -208,7 +209,7 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
  * Release the resources that has been used in timer_of_init().
  * This function should be called in init error cases
  */
-void __init timer_of_cleanup(struct timer_of *to)
+void timer_of_cleanup(struct timer_of *to)
 {
 	if (to->flags & TIMER_OF_IRQ)
 		timer_of_irq_exit(&to->of_irq);
diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index 01a2c6b7db06..367d7023c623 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -65,9 +65,9 @@ static inline unsigned long timer_of_period(struct timer_of *to)
 	return to->of_clk.period;
 }
 
-extern int __init timer_of_init(struct device_node *np,
-				struct timer_of *to);
+extern int timer_of_init(struct device_node *np,
+			 struct timer_of *to);
 
-extern void __init timer_of_cleanup(struct timer_of *to);
+extern void timer_of_cleanup(struct timer_of *to);
 
 #endif
-- 
2.34.1

