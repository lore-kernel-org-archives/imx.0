Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F6B433035
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115063; cv=fail; b=BidA8qS3ruODej32PmBO3fObhz2Byw5UNiUyjAkBO/Z7Xm4jJQZDJ76x9WbSwlTa+yE+0NTZOekXHX8wklCtXDieGQbyAHu0DbeqTfpUXo8CF5yhPw05tXzROL+saQSHLMflbpzg2gx4dTCoekjBWVGEry6JKLO8BmBEgCXxZJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115063; c=relaxed/simple;
	bh=/mAh+I5r7JYdKt2cJLbHxCz8Z7rNroYiavYTujDcKQ8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dAX7rJ+wXPaiEEGxTmNWUVf5/I0rIZXNQRxSDBgoRvDMp4uMe08QTkm3ZAt+Duw8KiCJ0wqBC3cFzHkMDeaIvxtV6vpGW+8i4fvmmiZFT1pDprjOSzYFogsTdeci8AAgojvvk97G2Oy8GIAUMrOsyjpkN2NonxaZpSHrw67fDGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WjWKsvX9; arc=fail smtp.client-ip=52.101.84.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WjWKsvX9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUQyWlvBfi1mhmX5L+W/xdKvy/oA15XW6VwiwNqEOJskhUIlmP9T5ppVVgeH9WZVVEZo7LYfJUXVj183fyxODa9fHM+Yz1jYlQfsrQ0D/bg7c/YY2/Fm5NO7eyaD0cemEw/Ztt2d3GHZQA5ole7MRhL21fusq81ro0Ic0Qhlo2GCSNSz5yZCmFcuoIytg7TkU/Ih+n3zZHsZdLicG1W9DbGqyC1D2RYha/jMaBfLNxVdAHaI6gFr5axCMCnl+o8+Yv7N28zJckFXmutE7HFqAceUcPiAXeiDObdsp8om2nySUunvHLqVND5xTDzAkzTPXLm9af5f5EUqadAytd8mMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1N3IeId9e637VdAM8P059qnjTzo91xnnEnsrGAdXvR4=;
 b=o45SN92jUbEcoHZuNV0Guf//QwNHwRa3idYa6WOKZIjX9egq+CFGrET9Caezl3wFhsr1XiEXxQZ2gf2tjNNF82753Fubj2yV3HhCsGMnJP4SHcTzkAYLlckoJYc669tqAC0E0MObMfs7SlHr30Q0Gqe/ryXiz1VJDleMPruHIaCJj+sljHWn6MXcL336IWX92Z7R4mL2yffkCxKFuRuUsOp8UXos+7w8JVhSSbXjO1uCxU9/EYAzXYLUoBkYe4I0XIEFoGCaVfYOBJXLWdy6WW9J6O/wueNJtnsCZv78ZbULJrwLC0s4x9ttF7z+ANYX/xUMZ6csfzkCo5SQdVsfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N3IeId9e637VdAM8P059qnjTzo91xnnEnsrGAdXvR4=;
 b=WjWKsvX9y+NiYl/mDd/BGY5t3zflANY1LuNt43N7zi9qS7KVp3Lomyg6j4dV4iTfXcDmZBQaG6zzKrebgVtzyp9b02ythdZS3WXOJAq+IztBBhCVz4LA3XoyoNfNJCd897i3RfKORH7meSDccfIsI79a5gPXGmQUZi+KXsHEHUaI0BMxkrv5WK2iyoPBv0dMVLn/ERUj1CnqBjwehCkjP1m/SPWIWgJ+6z//zftV3ym1NFMCjYacGHH5hZeK8G/EOgS5bgvOfMCXWCAV0sdjchQ5KQeP5ZqUJ0SR1StGR1l2AomebxUqPbPwQAcOfjoHGLzScx1EH/48RaJAneuISw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DU2PR04MB8982.eurprd04.prod.outlook.com (2603:10a6:10:2e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 11:30:54 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 11:30:54 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 15 Jul 2026 19:34:00 +0800
Subject: [PATCH v6 5/6] phy: fsl-imx8mq-usb: introduce per-variant driver
 data structure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8mp-usb-phy-improvement-v6-5-00d95e270e4c@nxp.com>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784115243; l=2684;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=L4H6ce2Mpvj7MRvm+fQjYKVpL+N4Fb0GeL7xGX6mikc=;
 b=6g1RDeMLWRwVpr7rgCBVpcbe7FcirvDMv3xR0yLGVZEyvi1N3YhBzre+m7HSSRTG6IwajzO9h
 qHaUqSkF9PaBTEf0LNvk8e10O6rsm9TShCNY533qzBfm0wXMGPQKqlI
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5P287CA0306.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DU2PR04MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: fc648a70-7aef-4879-58bd-08dee264881b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	bKOwOGbNqT2xC1GsKfGFSavc0gm2xR5H1/odO8tSYHWTtUZ/IRaugZWmdAMIFDiBw7HHcMghIfiUppMEirLJNhr3aOgD5+kisdc/Y7WrWuW9pIsR+35xhkFFU/rdsN+SkeNcxBNWc/nxBPXP43Mk8ArwWh6UDnVlPJbEEplPZTA3BmM6+PnXXYyRsPCiVhGrfjoTfpDVoP7RuUXtV9tnYh/tRLLI4aaHpwrgyYmkYOwEQHT1qpmR9sFghHVJbUQA5tWMOOxjafx4/fF30K9rTQFYo1xKPst0nwz72AkLkPjxLnG/OR0STnZ2FrjX+yMui8jqSzsGddMuB9pvkkkm0O8y7QsF2Qg9gepKgNUtoaSNgPUl0w4CAtYgVPhLhb2HwnL/FzkE8O2glGByIgcBipYFHRDBM5qVDLse/WR/H7ambUaN73tktJRm4wBKRPhqILYIj7sSQJ9RMEH5eBKiDVcicb2rcBoVd+th4U83M7pFhyEuzzGFD81IPz2vzMu/I/5vJJPUOmKAzdwcqqfjX7Yrw4G7lkxVPWKARtcYfe+2/kejyl/B5Pzrv4x+iyM/MfwAGt82pFeHtJ57Z+uXnVSJAiSQ8iD/u+aYjX6uh9hSEzA+ILkV2u5SigURDj9bkhaRQd8Qc98cZXB2ClOSkjwr9H+DBHEGqiFoZK4wXVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rng1YXFVTTdtWEpqMUtWSTd3c1pBV3lmWVpDYmordDRCbUZ0ZmNQVGhpOFBP?=
 =?utf-8?B?Q09tL281SEk0WmwxS1g2bnlmbkZyVHJkSWNOZkZhQnMyUUl5eDlDT25mWVB4?=
 =?utf-8?B?dVRyR0VxcnUxenhzYlN5SHhmT1o4d1A5WXZYREhHZkphQ2tRWU1jNGhLWm9s?=
 =?utf-8?B?c0hZN3ZoNnhlOXArNWdsOU5LL3Y3YlQ0WnpVSERYdHgvbytTdmhZYkQ0QjMr?=
 =?utf-8?B?Y3J2WnFoeGU1dUhZS0tDUVd0cW5wRmZ3MUVMbTZZQjFhMUJ6Z2R1L3FNajQ0?=
 =?utf-8?B?UGxteWlCdStSeElGK0E0bTRJMGdWeFJZUVNDWmRxVlVKby95QnBKQXZlOVBS?=
 =?utf-8?B?YXVLR0NBWXI3aVpJRlRNWGM4VDNkWmJqOHhFdmcyQzJjT0E1Z3hnNWFxbVVr?=
 =?utf-8?B?d1Y3V2t3MTdKSmZ3dmNMVHRDblZIc3d0enY0QkpTNEJTaEo3RFhRNzA2MzRr?=
 =?utf-8?B?QzVNZTFnMXRqZG10eVJYQlhiaS91QkxvS2tLK2hlQW5vbzFUN2F5d0pRL3Jk?=
 =?utf-8?B?Y1F4WU1ZNkwvUkdFdExZbGU3SnQ1VERTanBOaGEwcWEwYzRiM1FuSTlSYTNQ?=
 =?utf-8?B?SmdTN1hvaHZwN20vTmVOdkdtRitTQk10Mm90c2Nrc3o0a2dYWGpOZmhJTElx?=
 =?utf-8?B?WUVvdE5iOG9BZVg0cHVVY2VwK2xTV2hPR21Ddk01Vm1mb3U4Qm5HSlN2R0hL?=
 =?utf-8?B?bVhjQ2xONDI1S1JjeUJWUFVBc0ZzN3RJcDhFbjlHT25IdkpDQzhwTnY3SFZI?=
 =?utf-8?B?VXFkSCtJbCthTExBOTd2U2tqN3ZNNUJ1dWJDR2Y3RkJrM2lPbzJXUGk5N09x?=
 =?utf-8?B?RFR3dXROL3l4NWliK0NuY1JjS3F6VFU5a2FUbCtkYzVxcHhESTUxTTRhWmpw?=
 =?utf-8?B?V001TlpKNGpCTHMzWDYyV0IwZVVsM2RMQnh2eGR2dUpkMFUxS2NEZGJzSGUw?=
 =?utf-8?B?TXNtQThGbHJCTkVDU3ptdlloRUFUTUVud2RHR2t2a0hQblRFaTZ0cjJjdzZk?=
 =?utf-8?B?NlJvYnJKNGZQbDlKblpoRGkyejhsWEIzc3JUdFpINFBMOE00dEc4Mk84SDRn?=
 =?utf-8?B?c2JDaFEvKzV0NUZmVHk0TDF5aGdLR01wbVY0aTdSOTlNWHk2VStDYlgzbHE5?=
 =?utf-8?B?KzRsdzY1bTRVeGV5VHRYQ2JhS0lnOEl1ODdhNHFEZ1NjdDNoaDc4QXJNNmNk?=
 =?utf-8?B?L1A3RldHQ0o4dGhWQ2hRUnZsV3d1SnpVQldxSFdBd0tNdXEyZVJ0YmRVczdG?=
 =?utf-8?B?M0pBeFlnVVRsY2l0TGdkT0treFp6OTRKd1Y4ZzZlSFNJWHY1amswb1ZpWGdu?=
 =?utf-8?B?OXN6MWxLOGhMVkRSWnlzcEhkLy9reDZvMUJsVmVwRGRBcE5NMlFiMnFUUzNq?=
 =?utf-8?B?MURzdzU3NDFaZ1lPZG9HTW9POHdJb2RBZ3pTeFFYZUtuZHNpMG1kY1pDR2tW?=
 =?utf-8?B?NXIrZ20zWnk4U3p1UEUvVlpyVlBkSXdvS1E1Wlo0SzFqend3dnlmNGVYcTRV?=
 =?utf-8?B?VC9RZDM3d2ZPc3ZLcGVxQzgvYWt4RWlMV2dPNldpODhQZFdzMktYOHk4NjJR?=
 =?utf-8?B?aERmV0tBWUxiNzR3V1hIR0JFM2RRdVlxZUdvbDdEMms4dXl6aEdkQjErY3pJ?=
 =?utf-8?B?blVKTnZSaXc1MGEwcnZlUTlQcDJYUnk3dVc0OUVHQmwrZXZ0YnJtZ0d3ZjdD?=
 =?utf-8?B?bklnbU9iQ2NVeXRCYTRuYmlkNGM5amtJRmxiYXV5M1B1eWR3MjNPYUROVTlH?=
 =?utf-8?B?TzViVk5ZeElGL1hZUVZ4bWgzekxkc1RHN3BMRUU1YmxJMlRIcFEwbkFja1Zw?=
 =?utf-8?B?ZCtXVkFXZXFlQkJQZmRjYmpEVGdYWEZmekFvZTlSQllmeDJ5RnZ2NmhEM0t2?=
 =?utf-8?B?L3crdTBOeWVvSFd4cXUyR2tjWUxvL1Z1OFZZejVhNGIyRm1vc28xVkRFMjk3?=
 =?utf-8?B?YXhTYTFHWENhRy9CT0ZVVzlwQlN6ZTlWZjIreEZ4bCtmOVlwUFVVU09HTUJi?=
 =?utf-8?B?YXdQd2t6U2g1Q0U4SXpsazBGWWI1WmlGZlZoMHVrNVFLZ2VSOWFqUWs1dlpH?=
 =?utf-8?B?S2tVKyt2ellpN2V2NUhmNnlkSis3Rnk2c2Z4M1U3UHEvMTVsQ3FOaWdwb2ZR?=
 =?utf-8?B?SnhnZXpabVN6eGRmcDU5dzd4L1NCUk5xaGpPNWVyZ0Y1MDdHZSthcFhLakcv?=
 =?utf-8?B?aHpQMENaclJQYWJ0ZjNKWHpaZ1JEL3RCMGRwZlRtUGRRNzJ3ZUlQZmNZbHdS?=
 =?utf-8?B?bkxEYnRldGwraUk2R2VXRmhmSERVei9yRHJMM2NUaFlsaDZUUmMycU8yTTc0?=
 =?utf-8?B?WWhhM1ltMkNUQitaYVAvanljMDJZYWJmMDcrTElKVXYxNjZjUlVaNlR2cU8y?=
 =?utf-8?Q?hLvC58HP5JZhnUMgP2iJDIdSAbvM/u80MfYy7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc648a70-7aef-4879-58bd-08dee264881b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 11:30:54.3095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWwSie5U94hm3g8k883F4WFVcNkM8Ad9tCR1EXTDnvVQkioKmYUoQryQoQ0YeWoh8q81jhlTEq04axNaREMbqpwL7Qbbb5hkavZJjHYUGO5m+wKtcYYQaxCQM58lzYbe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8982

From: Xu Yang <xu.yang_2@nxp.com>

Replace direct use of phy_ops pointer in of_device_id .data with a
dedicated imx8mq_usb_phy_drvdata structure. This allows per-variant
driver data to be extended in the future without changing the match
table.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 79b3958ead2f..f0bdfa75d586 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -132,6 +132,9 @@ struct imx8mq_usb_phy {
 	u32 comp_dis_tune;
 };
 
+struct imx8mq_usb_phy_drvdata {
+	const struct phy_ops *ops;
+};
 
 static void tca_blk_orientation_set(struct tca_blk *tca,
 				enum typec_orientation orientation);
@@ -660,13 +663,25 @@ static const struct phy_ops imx8mp_usb_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct imx8mq_usb_phy_drvdata imx8mq_usb_phy_data = {
+	.ops = &imx8mq_usb_phy_ops,
+};
+
+static const struct imx8mq_usb_phy_drvdata imx8mp_usb_phy_data = {
+	.ops = &imx8mp_usb_phy_ops,
+};
+
+static const struct imx8mq_usb_phy_drvdata imx95_usb_phy_data = {
+	.ops = &imx8mp_usb_phy_ops,
+};
+
 static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	{.compatible = "fsl,imx8mq-usb-phy",
-	 .data = &imx8mq_usb_phy_ops,},
+	 .data = &imx8mq_usb_phy_data,},
 	{.compatible = "fsl,imx8mp-usb-phy",
-	 .data = &imx8mp_usb_phy_ops,},
+	 .data = &imx8mp_usb_phy_data,},
 	{.compatible = "fsl,imx95-usb-phy",
-	 .data = &imx8mp_usb_phy_ops,},
+	 .data = &imx95_usb_phy_data,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -684,7 +699,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct imx8mq_usb_phy *imx_phy;
-	const struct phy_ops *phy_ops;
+	const struct imx8mq_usb_phy_drvdata *phy_data;
 	int ret;
 
 	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
@@ -720,11 +735,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to enable runtime PM\n");
 
-	phy_ops = of_device_get_match_data(dev);
-	if (!phy_ops)
+	phy_data = of_device_get_match_data(dev);
+	if (!phy_data)
 		return -EINVAL;
 
-	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
+	imx_phy->phy = devm_phy_create(dev, NULL, phy_data->ops);
 	if (IS_ERR(imx_phy->phy))
 		return PTR_ERR(imx_phy->phy);
 

-- 
2.34.1

