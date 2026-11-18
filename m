Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045878;
	b=C/9YzKgvzKuUfXpdaokdEBLD2WnY12IraGkVw2d98tiExd43CkhHVYsjQMm87FAW0WaU
	 +gybKBXhIh6muQNN1Yc9yBKIDEBtP0pTTWJVYUDFXfqIfBMiKfXy9H5jGBWnH8WpqyBjw
	 wP74kkmS8FNpqealPkEKKB2auxFgvJx9J8dWPzLO3PhtKjhh92KdmNQ9qktxSG78InN3A
	 aUGBrLLNXB+ap55CBWaDh+ZhJp6cbZynXrUVzoKX8tXHUE/e1wW5OCJh+/zMF8BGcsq/2
	 iQhYdpMCkeQ3hT+WiwyvWUWEAXJRbac8psNPvWrVq3/ku3vqrvXfgoxdmi5KPgMvgJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045878;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ve6mHWj9nrIku7ZrTFY3RbiAcDabcloYmrDmP/dJXMU=;
	b=RWzKbWcrTMWUJC1xMyFRLw9LZOr97cSudZsHovp1U4hLVD2wuu+d6gjtD5j00I2jdjc7
	 xEVQIDUFqlMoRG1DcbmCj3cEWuOQbQ68mzdPM0urCJ7Oi6urcSIh7Rh6cfH4jexk0T21i
	 vdM/dxI5Wrr6T5U9p1SCNYfsftkaPwUGV0hOyMgAJHUO2aDzWeVoAfzGh8SSt5nGTaA8n
	 Jum4fgneDPOSK0gl/OvkjS8vMYFWttVPsym21RV6DfbYj/xvnEbovuQGi9hao2Vwt7O6M
	 wec6tU1GZYwlIIwwoSpB3fKCZv8x2OsS3m+VqP/iedtA+1XicS2vPQjaTIRS6ZdfBJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b="Y/VicunZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.54
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCA9606A32C
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 23:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FCA9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Y/VicunZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRR0DNpC7gsv8UNsS8AFShWv2tk5KV/V/W7RY5NIuW+FoDV2q44Tl3UFHqQhu+jYY+HLy8xoRkRjNdjgDum1HZuaM3rVh+oIPk4UoMKWNTnq7/t35Op2wzMAS8UZVnEUeWpLrVtaC1junFl05/cw4reEd/ZVGbiKFDbMCRwyOrIOT79pEyK52DjeEKn4NyV8hdHvC3/LQ+fUeWgRUUea7GAYVwCg6K38hJYP3YotVSnVIvsL0b/gvd8Id9iaWthcNSRdXJSn2X/G3R/iTfTCjGq0cHyGJOtSUaWtteTZMrKd5gVeumQzm8SCE2MWccgs8X5k8P5ga4nTLJXcpybg+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ve6mHWj9nrIku7ZrTFY3RbiAcDabcloYmrDmP/dJXMU=;
 b=aCp5LuLNBjZI4fRPynUd1t9pMxSCEOWrjrBPwXoGcvahFW1zK+UOxauHTXeDoaP27o9dA4iWJV8cwM2obCLO2YdL7Ig15BClwcbrcQ3Wu80jR8+haC9RbLebW767F1SlvbcJa5KDZ8qz2Ffrs+vP+8PS6WbQViFlAtwklSzPWqInZC7u2nEO9YYRCAZpyKFQ5O8Sg/HmD1f5y4Vzk6Zf7hf6s6wxg7yoH5M+NnUzG3ovv1EQHZFz+yldwq8IpQUXv00BPMT/FJlEg25Tv0hgpw4U0T6GqHLN0kJ4o8yGqP/OyH180h+cDPt1syT8SWJnIRGGCtahjj2CV66+/yG8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ve6mHWj9nrIku7ZrTFY3RbiAcDabcloYmrDmP/dJXMU=;
 b=Y/VicunZqgKkJ/fQddZdZESghravHKEad73tjajU3X97ykGSjGbqNu+eh6YF+kdIvswGRCOoYVxMu80Zp5ezjEvTISE9nakNL5esKjR4Qq97OTiuWxmNSFy6NuwuFEgsLZTDlApb2kj1FPGxVqQ7o+GBIaQdhKmcrnhECOwG1P4V32/YT5jwMeTNwm7BUMsMFVMC3EftWieRwz0SJP9pf+R7mpghMNMOIH7tMHBANaNP0tl1KMjRqTHPBIYvggJvsqfGkH/qsmGi74ODaYZl3lvr4UqD5YYsWPjSLEaJWCjCnyOJp9cYKGGMXVZp19coJ5ptWxLsv73zPc+0HC9hMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by ZR6PR04MB456611.eurprd04.prod.outlook.com (2603:10a6:910:d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:51:15 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 23:51:15 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 net 2/4] net: enetc: reserve VLAN extension BDs for software TSO
Date: Thu, 19 Nov 2026 01:50:53 +0200
Message-ID: <20261118235055.1225115-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
References: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0129.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::26) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|ZR6PR04MB456611:EE_
X-MS-Office365-Filtering-Correlation-Id: 5073dcb7-b3a9-4770-ee37-08df45ced50a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|10070799003|261102123227099003|10067099003|261021121427099003|56012099006|11063799006|261021123027099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+5kOguzuceocasFnSpCPPE+pamaunXhXWAGHR4JnUaoOirRpuqM86+2uzeVAKgcbJkOMP4HiPJxW8WGJm2CN5kkyor801RvJL13SgxGFZr1yFbXQt46Ua69lLp3fdz0hJklALlzfWVK6CHrxy1sIokPsOckZBjGWYaB0fWG9ZI7l0odnSG5MMlsaYal42xbXIat3y1Y67ZIzWww3bMhiHVCrLZo65aj543jARwuEqpdp33AtNdIUWNG6IFNCuo7YLLgG4KkS/4fngQpqzCQKT5m2W/nJXJdxJXtzrpVByzUB6tCjF2fp03rTOMbDBkAq5xxtQL7ABsnHqifpRSZ4exIM8GtgKF0hCbeymGnxrVSVTPubJ32YdUEdHNdEiacSdZppjSa3fW2n9xXhGxy9O00ODevNwIFLDGuPmEdLpvpySBmwhd7eo0DEEasrsfQLhXrvIMYpCeyLyFuurCsuC/0TY2yHu4sROEb5mi3Ag6hi/JWihfAsMXfEk6FfDJuyb1Tge2qFMLKJ79vWByfzziKz19+WWQvDeYjLx9HeMRZ+GqlNgryvEDiLNJ9y3VvpXzLU3QhrRfK7VqBqRoaEgWN/j3K23KtWnEFlAihT1YmPzXZC/BLTJg/KgkkyLdsr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(10070799003)(261102123227099003)(10067099003)(261021121427099003)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uaxazht7S2qQOc4d/J3dQwzK+KNx6B958mIKkaLlcQhlqZm3e1F1ySyMN2zw?=
 =?us-ascii?Q?aMCgLGQ7o8epkzpAdau1wVMGxftBTrE2XZ5aGB0yz9y5qULzmDh3IwdkNUAj?=
 =?us-ascii?Q?YHTdNOsgh6qoxB/zkIZwhyMou7SeBRhgMw1CaD4AJEo6WYwXHlHQC5eyUguU?=
 =?us-ascii?Q?htyukL6kW5BFBu9zu16FrtObLQO4x6o+ounmTT0unDzrag2PNz2DeCF9mvJB?=
 =?us-ascii?Q?o0XnEoes4ToWzT/6b9TJUPUAR5BVjBCXn/br8j4UZ9GPu6msbZ3k1biKAOt+?=
 =?us-ascii?Q?giJib2L2KtWAJrjPwzmbfdnkk3uytq5fPCC9Q4m6gIG0GhuoD7IX3fXrjsCx?=
 =?us-ascii?Q?TyRlY87Rca8s7egqrCOqbHFlhGPr7u1izjroqGDmQk0l/zaGRO71DCUeUk1x?=
 =?us-ascii?Q?VSyrGIZ4dNoAh24b9fIsY00r6gp3fsCTNMItmhhcDpplYCbDrDqKeRMtNPjw?=
 =?us-ascii?Q?mQ3ifRcDL4iZEnOqAuwpByOzSM1nqcyCnT2Wjz95lTgtCEMVCZMJkkCQr17H?=
 =?us-ascii?Q?clB73/vPnYF7DxUIcM4oIZH2WG11CNw5Nk5gkG+G4PO3uiGXpGtIBbmQWQMy?=
 =?us-ascii?Q?ppM0bNwa7UMy+d2I2DhETsGm60JKoDGsr7l8xG6SrAy5/336n0Pg9U2EE89Z?=
 =?us-ascii?Q?RXkZvh7kpaqn77R2GR7grqBDPrpcfcd7JrgsfvwxIF7cB1tOhPLQviWoiGp5?=
 =?us-ascii?Q?9tZ+4rmZ8oRMWUKkEZPwunFKJeKUkIXGP0b7lFtGCdniAG5gZKSRrhVBkwLs?=
 =?us-ascii?Q?ZoPv8urgfVob+0zZRFIxzbIQweIlGq/XBhy+AnyE8ti24AGvpc+ZdLe2Ue1I?=
 =?us-ascii?Q?GK07RjjYB/YCq40m+SyBkI+Xj+ha505NDSSIwUlRwH+0zktthzrHrAVlAI24?=
 =?us-ascii?Q?ilNlNUhGq5n3gh2wZRAZ5AFL4cycuy4DtvIf2AoVq6r9wlYhOFwqGl/M79bb?=
 =?us-ascii?Q?EnWymOaeaZmOfbvqEYY9priSmigDpd1JO3bFhFiMLbKwhAX2V15aB+HPKeQe?=
 =?us-ascii?Q?kZUwh+eTcfJbvm7BYrwfav8l4VrXWXMOAcGFL0UvaOeIKtQDxy+I0qvweJ34?=
 =?us-ascii?Q?ZqK+F92GWtBq95AqTIhrw/KFQh4MhnX2E0qumZxzlJdUrxRf1YtVHFGOS6WS?=
 =?us-ascii?Q?VHFzjc4t5FbHp7GofEwSF9cfAIGVF1DzhT+36t838gzW+MpZaNC0TKol/zKM?=
 =?us-ascii?Q?bv4XepVZ/y5Q9pGamliOFYIpPTK2PFgrx3Ur+n1I9no8y7rUfFScaeulCC1Q?=
 =?us-ascii?Q?fcUQliAUqCrY6OskEtqbclWkSZ+v/N16tmiqkc0Sr4MscfCzYXpsetgLhjgK?=
 =?us-ascii?Q?mpm9w88qTKTHClLzrv/O+XRYOrj+6xbQNBBNxHmpdBGIx3kgYohjPXwwv5GD?=
 =?us-ascii?Q?yp5T7gTa/RfNEBfhseszSY7ntUGr/WRllso2cU4is586fKND6EwS6LTq1yZX?=
 =?us-ascii?Q?quZyWkI8QSM9GR4JENd2LhvP9D7MEzDN9xQHG6nnJo/a1STWgeSERapD2JkH?=
 =?us-ascii?Q?iTFRIoJUtZWM/S0b7mAlfs/9ym8w56aUb7gbwreXe6d18C49hJ8zTa9j4GvE?=
 =?us-ascii?Q?SGP5/53WmK42Iw2oq5Nk/7i+5uzgBoTWBox8FLMOtHQ6kF8DPw7n19mx2HDw?=
 =?us-ascii?Q?me/Qcr8OlnA2RFh6s8bl5FPmID4ia6FghVOsMDtOKJKjdZmUYmk99TEa0xgp?=
 =?us-ascii?Q?zA0zVhtvOZKp9N2soYDqC9wICXh4/qOFJNp2qXWKsfX2Hx2fouyunWqKyg+P?=
 =?us-ascii?Q?ZX5CnklWwxGgLy7ItbiGNgcV3oNWQOsH1DcFHrFMF/4SmkTfWJHgT2cGfaly?=
X-MS-Exchange-AntiSpam-MessageData-1: divuu7qEtE2H2g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5073dcb7-b3a9-4770-ee37-08df45ced50a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:51:15.0949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1d564mCiMnT+NUsi9e4soGv3mNIQo2cUNXdW91z4AgBp4yfV08b3t0rKhGNlCXWZZ9MRHdl0eHlMhVVsVzdPhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB456611

enetc_start_xmit() uses tso_count_descs() to check whether the TX ring
has enough free BDs for a software TSO frame. That estimates one header
BD and one data BD per segment, plus one BD per frag. However, when the
skb carries a VLAN tag, enetc_map_tx_tso_hdr() also adds an extension
BD to every segment, which is not accounted for.

With a highly segmented VLAN TSO skb and a nearly full ring, the driver
can then write past next_to_clean and overwrite BDs still owned by the
hardware.

Add enetc_tso_count_descs() which accounts for the extension BD of each
segment when VLAN insertion is needed.

Fixes: fb8629e2cbfc ("net: enetc: add support for software TSO")
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
This comes from the previous patch set:
https://lore.kernel.org/netdev/20261021145314.1435049-2-vladimir.oltean@nxp.com/

v1->v2: none
old v5->v1: also patch enetc_features_check()
old v4->old v5: patch is new
---
 drivers/net/ethernet/freescale/enetc/enetc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 1606ac57016f..7f089a84d9a6 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -674,6 +674,17 @@ static void enetc_tso_complete_csum(struct enetc_bdr *tx_ring, struct tso_t *tso
 	}
 }
 
+static int enetc_tso_count_descs(const struct sk_buff *skb)
+{
+	int count = tso_count_descs(skb);
+
+	/* Each segment also needs an extension BD for VLAN insertion */
+	if (skb_vlan_tag_present(skb))
+		count += skb_shinfo(skb)->gso_segs;
+
+	return count;
+}
+
 static int enetc_lso_count_descs(const struct sk_buff *skb)
 {
 	/* 4 BDs: 1 BD for LSO header + 1 BD for extended BD + 1 BD
@@ -1034,7 +1045,7 @@ static netdev_tx_t enetc_start_xmit(struct sk_buff *skb,
 
 			count = enetc_lso_hw_offload(tx_ring, skb);
 		} else {
-			if (enetc_bd_unused(tx_ring) < tso_count_descs(skb)) {
+			if (enetc_bd_unused(tx_ring) < enetc_tso_count_descs(skb)) {
 				netif_stop_subqueue(ndev, tx_ring->index);
 				return NETDEV_TX_BUSY;
 			}
@@ -1114,7 +1125,7 @@ netdev_features_t enetc_features_check(struct sk_buff *skb,
 	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
 		return features;
 
-	if (tso_count_descs(skb) >= priv->tx_bd_count)
+	if (enetc_tso_count_descs(skb) >= priv->tx_bd_count)
 		features &= ~NETIF_F_GSO_MASK;
 
 	return features;
-- 
2.53.0

