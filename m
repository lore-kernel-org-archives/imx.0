Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772995;
	b=GOQ6EKthhZRjTgVmQmgu3wmgmybRwmS/juHCpzxzPoXSiQJhYBFQwHEiNLLgS61aXswy
	 ZqJJj4fwKMxQdV7QJ7InFlXHJ1Zv82RM902sG8oShv6FI95F72V5CllZVT+tGQFSVmctF
	 INVaZaa/HDvSZdwrabpd2NoQFkuDVAQwXc6Uu3oV8XMWFO7YZD9H1XTFaIzgy1NeXUUgD
	 drDFcr8DZxf9KQukK85Gkcnx0/RGFbKbHO41Iyron1QO1djvshFJTSnocoqTRdPdDwffJ
	 xBJTucVntzbalPWZR5T++lfOmQzGqREnNQ08SHD2rY4ghZbqa34Qc4pZn3MudiUNmHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772995;
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
	bh=pwXsbP/jvL3XdWIwS+9ELLZbXBDLGUC6BnoojJqdSrI=;
	b=ZF4V6DnrlRh5XqbcNKWNOdlacWwg0Qjkrr6pjxKp/HSm+rT5RttRvrQ1NZobPP36n5WX
	 2Phs0AceUXiRp8r29qxDP2IUspKvxBXjyMAomSlOjIN2KskGkpneGYzjbgJgOz2h+OVwa
	 Kb5DaPCfIwx8LllEByxpeOJQ+zPhssnwHwEytxYBIV4uJ1xQSU0IvYrBWcAA4cVXtFLIu
	 ZlFpUpeV03H6FYgId3/Ke13qNwti/5utEvig8H5B0S1ZTMIVME8D9YanHEFOyLIPJU3Fp
	 J/ecDch37hDChJYP2R2Xy3sUEGie+SOZZ+uiLPCCj+V/TdsOCA/cxt9qcoxSnczpExA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=n0PFXSpy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.16
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7553D606A332
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7553D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=n0PFXSpy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJuva7BML0AuVwndaUNlTvAkxuOhs+Mr5s3GW/VEKjgGYeRUhRBUP6T3RSfavvwvhpOylAUzOPhO5ydAY4dqvtOANgshlGhUExe6wAvXRcOWSuwO0/9oulp7BfhYOOd7TTllrvKssdrETM9esszUYmx3sNLWrF+aNtqQ4VK9ub7USzVl5CW6mlB+0eNHNy/R/6aZqIDMk3yTdQMWskxUjz3SzQsucvL5zaKX14+qQojrb6DjLjbz8SzcXFOJjMxaXzNEcoC0LOtwXV8dQPhlK27uYVIl6v7t353/Q/To5G3TSw7hiNFiHaxeimaNyeS7oLOVvp7qyNEE8KoctpBiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwXsbP/jvL3XdWIwS+9ELLZbXBDLGUC6BnoojJqdSrI=;
 b=ewC9DBo6xVp46xNtew5omdl+SqfNAmyHCVK8NsI7IfgAdUIc3QPDgDSIphu01hsseF3Cbtvz7YXPb1vPe8F4wdxxSiAR6vnwamiCQ682mobYygVZNpMH+zt8d+5Hg+lLFi9yn4urBYW6xDZverKS8IyGgmicsjk4PWXldRIzhXs/mcXsGayxlSnYv+ixKZL6PnrR7dc8cLs44d/5RYMypkO7gQ9lo7+iyUX07b1YJ2z5ly5B042PQrNfXmesmRdiakmTtmYol4Hg5fQKYx1AwYLS4pu6wUFQXg2NXYSFi6f2fz4Zwv6AmN9x3diKjYfHy8xqkxti0Hu0MvjzOe8A+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwXsbP/jvL3XdWIwS+9ELLZbXBDLGUC6BnoojJqdSrI=;
 b=n0PFXSpy2lO3CptKtlkCqm2R0dU2Bsd9sRiq1CqjNPNfouJI1ALOVtkDhsbX+0b0sOstjNRC+1u2dgaPh27xQrPSlvFJzSxtEfiF5qnTr2p5VOwisU7VDxYWYonKLoBIpkxlVGdeeYvkiqsUB/B0KYLPrb2mXaA41bKAWFgTXes7Maw17eX2+CeBYLUkb39yJeIWNWZgkr5BXXLO7D13edPrUNWooC48Q87czwJZ85xIGFVtJPdVBt+TqyHl/nM6BVXKy2+jtYrsPEeIj65+UST6vcy4Td9ALdC+lur8fk1BuR0yDIGQvNkdJOlCcfcTXuFXYXg4CgULR4S+6jXm8Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com (2603:10a6:2d0::cd)
 by MI3PR04MB088318.eurprd04.prod.outlook.com (2603:10a6:290:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:49:50 +0000
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd]) by BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd%7]) with mapi id 15.21.0639.012; Fri, 27 Nov 2026
 09:49:50 +0000
From: xiaoning.wang@oss.nxp.com
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	daniel.baluta@oss.nxp.com,
	frieder.schrempf@kontron.de
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: [PATCH net-next V2 2/7] net: enetc: netc-blk-ctrl: factor out common link MII protocol helpers
Date: Fri, 27 Nov 2026 17:47:24 +0800
Message-ID: <20261127094729.1061755-3-xiaoning.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
References: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 (2603:10a6:2d0::cd)
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
X-MS-TrafficTypeDiagnostic: BR2PPF9D47B45B4:EE_|MI3PR04MB088318:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ae7dac-2f22-4eb3-50bb-08df4c6bc79a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|7416014|56012099006|10067099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+Dvby42jtOenbX7xdUv8d4zEBiO/ciqW1RIKButnT0rnWnIs/v0Dr4E7NLwsw8kR19n6Mp/u3XKRuhpfhyHp/GZT/RjKTg4cIS3Ajg26Q1/j11m+eSUhgYte2TFsX3bnW20jd3JFFiUFv1oKFLdMHTAe+PW0Rsj7p1fW8IwJTnA1qsk/2CWAq/QfYULdAwgHN3jQiqjtPwpzWVWwiCmdOMjSCyPCJx/vlKClKRQTGviLJvDIoMxzmY6/SeTyf1ZS6v5sPfEMrMLrQnqRDEnf8gc30sv+xmnQFVlMhDVLnIMnbi2SoftxQwLq0voy7lI20a/z0+Xo4npgpaW1oSrB6faNE49YDyhq1B64plT0SkTEvJAIXuMdVFRgdKkXueIbpeLm1hsBCNJJajRJzFAIB/ezn1nse2u5XMe0Zpddo6u/7W+knQ6NORKB1iiCwk2LFCYGa/Vj7lC/PPSyTaEbxMhsRgS+91Rb22MTAnVPkAQJCU7dVOv98VluvTIyBiwiO9/X6yLIXK66tw/ye//x/z2uFmnrsFkcIxvcnYYk57bwoXcRHTw12uQiaUS9BbzccHe8iMPOA1Z5w/GPA/U5ScD2lj3KQB0LiZTotuemndHvgCDWGwbHPC0Ax4aAbSIKYHP+N9iASjHAxY8ZfgmTLA0n2GrMUYINn6/y3ILUfdY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BR2PPF9D47B45B4.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(7416014)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4zB/LeUnpIW1T1OxFaq7ckMvNQVvXHZ2OMExAgrutDzlfFhkgZOecjoZpd+f?=
 =?us-ascii?Q?1hvluk7wnemNOO8S8MUBKxgTt5Mp3Sx9zABCglIgZIPtNhVYyJcm8HMW3WZT?=
 =?us-ascii?Q?6gq2vaa0HlCOLW/ljVjKmHCcti0dMj2yxPs2gCXYoeiUV0NEFIFp/hpH6YVS?=
 =?us-ascii?Q?TIKyRx549mpZO1s6ijWTc410oREzaH6CZKBkawKmdTLP4EOIioeqH0YDF2K9?=
 =?us-ascii?Q?QvNrHUueiDnRV6PPhJH2FfAhnaJSy5X3JJ/9ykb+FAFGj4Uwgk5qxgRHysld?=
 =?us-ascii?Q?/shfqFkEVkeFhf6vRp7hs2Peev9J6Jt2Si2Kwj0seb8+ShNQGCSxRh4BVCSb?=
 =?us-ascii?Q?iGK7l1AFqYCOHWhmFMnTZZw3ZQAhecy80jTgTHlEbSbJygXmX2IF/alZWzN3?=
 =?us-ascii?Q?3+sTilkdFrr7ggIDf2Rvc8BehMdA4PcX0TMx/DRrmVlQdOZCVn+RA0N3T2G/?=
 =?us-ascii?Q?KCM6IbeUeBltKL8FnvDlPX1DwRXMFyMy1udejUZM7u7K2e++Lf12RnrI0VW1?=
 =?us-ascii?Q?+HS543ESnwlFOi60KHz0rRlKuTdRt3Cj17KDRImIqNeMWWjx1T3fNkcfurpn?=
 =?us-ascii?Q?42fCoKkTUdYtJq1T6sYGhqOeMqWoZ37/nn0c644V47AaF3BrPnWolZGd+iug?=
 =?us-ascii?Q?CbUY0Q1fjipVhB3pqUyTub4zIUr1u7U3g3pwXllPXtz+4Z+lTPg2r3t9oSNw?=
 =?us-ascii?Q?tTtjcJgY8iiPadKjqj00a7ZYB2YZmkygDANyS2Ncv9zmhNjk94W4ykJHYih0?=
 =?us-ascii?Q?qEQ0XFkSC3nJWbmSJiYYm8srH8W/0nVlAudUsfMLn/EIuuJJQXyRR2OfRRLK?=
 =?us-ascii?Q?1l2fmYDtzAM0CuYd9uLc5Re8j47zDS1ox6udWpL7nInJnSmVcZDCHjf1tEC8?=
 =?us-ascii?Q?fJUD3inr5LFzb9CPJMGA0V9hSe2SimG6vsYBkTd2csG6r0obJTxtSQyMoF2j?=
 =?us-ascii?Q?k1ORq36Ff/b6QGB/rUodipP4ibQdcdGawIFyxtN7Tz7nFVgEW5e4UkFPF08R?=
 =?us-ascii?Q?18puJz4YI9KtG6exCXset0W1r1zHuj9NxNToPydgMqLXpTp+n/v19VanBUQ+?=
 =?us-ascii?Q?ySLxDKEp90AeLaZE86zgYyabk9h6w8acxgb+UVQ/Rp2ZqfGj9RbjwWNNGEWg?=
 =?us-ascii?Q?PgLZuopWGeLjGhtm5bi895LBK5xL2OysSuJq0idK3aj+z/vo7OIARbTHwkzI?=
 =?us-ascii?Q?Vs+Xba6m9JINDtvNiNLW3Znbzo5AYLyolaiif+u1uFvrNBN1yb18OX5rRVhV?=
 =?us-ascii?Q?ATeXhlkZ5AlQNc5zIMdpPfN5rtwwAJHnFW7XCKUt4qjRAQleGUly/hXmRDiB?=
 =?us-ascii?Q?T0affpjdumDczB8Nr7PVCbN5n0QfrJwdqLYnpEBHnmpqU/8pJfpbUjC1Ij8p?=
 =?us-ascii?Q?ksElij85iXT55phW2pmmkUOcGwBNtDzhNHYFVpJE+teVRnyvTk4lhsSU9RZ+?=
 =?us-ascii?Q?XBQAbcTl1cI2r8lypCk3pcStHuh9JSG6Rs8Nw0e/hI1cr133Aey5e+W6LGXQ?=
 =?us-ascii?Q?IEEFnFGfdQqNEJkN6g9ssFJS1CH8C/YFqMLpMO/EXfap4TiiwYSiQTs6rDpU?=
 =?us-ascii?Q?SKQumdWFKCJ3j91bQb8JOOf5fBvqXn0yT57fb5jGzWMou5wYOatiZgTnE+ce?=
 =?us-ascii?Q?hMpIWRdDv7nx/v+K6ZcqVBcLTZB0BHYLIcffhB36FR6iuKZ34IpzJNyuXSYg?=
 =?us-ascii?Q?EU5SPmLTS5BCY4PnSkpS1Yx0F2xW0G47KCz5aHH2/Sxnb8PEa8pj65Godfk0?=
 =?us-ascii?Q?5+63p/6rmm+XgBLu1bG5boEpmAsuVogduEKTiqpq53JC4ZxsJvIUOTaWTmeW?=
X-MS-Exchange-AntiSpam-MessageData-1: SFcN/CdNkcQf7A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ae7dac-2f22-4eb3-50bb-08df4c6bc79a
X-MS-Exchange-CrossTenant-AuthSource: BR2PPF9D47B45B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:49:50.5498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtIYXdu3lJ4kbvrMOlgvr5K0c7PZZGQUBWdrs0Py+4J8/bgbpVQa9Su27PTs8gESPAIzNniYeO+IVCQFrSh3znMHXYFir5zyG76wUU0Sbyf+Kd38lnzgcnI9Dyctp8Ou
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB088318

From: Clark Wang <xiaoning.wang@nxp.com>

This prepares for adding i.MX952 NETC blocks control support without
duplicating the NETCMIX link configuration loop.

Refactor the NETCMIX link MII protocol configuration so that common logic
can be reused across platforms:
- Introduce struct netc_link and add a per-platform table to struct
  netc_devinfo mapping PCIe bus/devfn to NETC link IDs.
- Add netc_of_get_link_id() to replace platform-specific bus/devfn to
  link ID switches in both i.MX95 and i.MX94.
- Add netc_of_get_link_mii_protocol() to share the 'phy-mode' to MII
  protocol parsing between imx94_link_config() and the IMX95-style
  NETCMIX configuration path.
- Factor out imx95_netcmix_get_mii_prot() from imx95_netcmix_init().

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 .../ethernet/freescale/enetc/netc_blk_ctrl.c  | 150 +++++++++++-------
 1 file changed, 93 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
index 658fab31e9ed..6f6ed66436f3 100644
--- a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
+++ b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
@@ -32,12 +32,11 @@
 #define  IO_VAR(port, var)		(((var) & 0xf) << ((port) << 2))
 
 #define IMX95_CFG_LINK_MII_PROT		0x4
-#define CFG_LINK_MII_PORT_0		GENMASK(3, 0)
-#define CFG_LINK_MII_PORT_1		GENMASK(7, 4)
 #define  MII_PROT_MII			0x0
 #define  MII_PROT_RMII			0x1
 #define  MII_PROT_RGMII			0x2
 #define  MII_PROT_SERIAL		0x3
+#define  MII_PROT_MASK(port)		(GENMASK(3, 0) << ((port) << 2))
 #define  MII_PROT(port, prot)		(((prot) & 0xf) << ((port) << 2))
 
 #define IMX95_CFG_LINK_PCS_PROT(a)	(0x8 + (a) * 4)
@@ -78,6 +77,9 @@
 #define IMX95_ENETC0_BUS_DEVFN		0x0
 #define IMX95_ENETC1_BUS_DEVFN		0x40
 #define IMX95_ENETC2_BUS_DEVFN		0x80
+#define IMX95_ENETC0_LINK		0
+#define IMX95_ENETC1_LINK		1
+#define IMX95_ENETC2_LINK		2
 
 #define IMX94_ENETC0_BUS_DEVFN		0x100
 #define IMX94_ENETC1_BUS_DEVFN		0x140
@@ -95,8 +97,15 @@
 /* Flags for different platforms */
 #define NETC_HAS_NETCMIX		BIT(0)
 
+struct netc_link {
+	u32 bus_devfn;
+	u8 link_id;
+};
+
 struct netc_devinfo {
 	u32 flags;
+	const struct netc_link *links;
+	unsigned int num_links;
 	int (*netcmix_init)(struct platform_device *pdev);
 	int (*ierb_init)(struct platform_device *pdev);
 };
@@ -156,18 +165,44 @@ static int netc_get_link_mii_protocol(phy_interface_t interface)
 	}
 }
 
-static int imx95_netcmix_init(struct platform_device *pdev)
+static int netc_of_get_link_mii_protocol(struct device_node *np)
 {
-	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
-	struct device_node *np = pdev->dev.of_node;
 	phy_interface_t interface;
-	int bus_devfn, mii_proto;
-	u32 val;
-	int err;
 
-	/* Default setting of MII protocol */
-	val = MII_PROT(0, MII_PROT_RGMII) | MII_PROT(1, MII_PROT_RGMII) |
-	      MII_PROT(2, MII_PROT_SERIAL);
+	/* The node may be disabled and does not have a 'phy-mode'
+	 * or 'phy-connection-type' property.
+	 */
+	if (of_get_phy_mode(np, &interface))
+		return -ENODEV;
+
+	return netc_get_link_mii_protocol(interface);
+}
+
+static int netc_of_get_link_id(struct netc_blk_ctrl *priv,
+			       struct device_node *np)
+{
+	const struct netc_devinfo *devinfo = priv->devinfo;
+	unsigned int i;
+	int bus_devfn;
+
+	bus_devfn = netc_of_pci_get_bus_devfn(np);
+	if (bus_devfn < 0)
+		return bus_devfn;
+
+	for (i = 0; i < devinfo->num_links; i++) {
+		if (devinfo->links[i].bus_devfn == bus_devfn)
+			return devinfo->links[i].link_id;
+	}
+
+	return -EINVAL;
+}
+
+static int imx95_netcmix_get_mii_prot(struct netc_blk_ctrl *priv, u32 *val,
+				      u32 fixed_links_mask)
+{
+	struct device_node *np = priv->pdev->dev.of_node;
+	int link_id, mii_proto;
+	u32 reg = *val;
 
 	/* Update the link MII protocol through parsing phy-mode */
 	for_each_available_child_of_node_scoped(np, child) {
@@ -175,36 +210,43 @@ static int imx95_netcmix_init(struct platform_device *pdev)
 			if (!of_device_is_compatible(gchild, "pci1131,e101"))
 				continue;
 
-			bus_devfn = netc_of_pci_get_bus_devfn(gchild);
-			if (bus_devfn < 0)
-				return -EINVAL;
+			link_id = netc_of_get_link_id(priv, gchild);
+			if (link_id < 0)
+				return link_id;
 
-			if (bus_devfn == IMX95_ENETC2_BUS_DEVFN)
+			if (fixed_links_mask & BIT(link_id))
 				continue;
 
-			err = of_get_phy_mode(gchild, &interface);
-			if (err)
+			mii_proto = netc_of_get_link_mii_protocol(gchild);
+			if (mii_proto == -ENODEV)
 				continue;
-
-			mii_proto = netc_get_link_mii_protocol(interface);
 			if (mii_proto < 0)
-				return -EINVAL;
+				return mii_proto;
 
-			switch (bus_devfn) {
-			case IMX95_ENETC0_BUS_DEVFN:
-				val = u32_replace_bits(val, mii_proto,
-						       CFG_LINK_MII_PORT_0);
-				break;
-			case IMX95_ENETC1_BUS_DEVFN:
-				val = u32_replace_bits(val, mii_proto,
-						       CFG_LINK_MII_PORT_1);
-				break;
-			default:
-				return -EINVAL;
-			}
+			reg &= ~MII_PROT_MASK(link_id);
+			reg |= MII_PROT(link_id, mii_proto);
 		}
 	}
 
+	*val = reg;
+
+	return 0;
+}
+
+static int imx95_netcmix_init(struct platform_device *pdev)
+{
+	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
+	u32 val;
+	int err;
+
+	/* Default setting of MII protocol */
+	val = MII_PROT(0, MII_PROT_RGMII) | MII_PROT(1, MII_PROT_RGMII) |
+	      MII_PROT(2, MII_PROT_SERIAL);
+
+	err = imx95_netcmix_get_mii_prot(priv, &val, BIT(IMX95_ENETC2_LINK));
+	if (err)
+		return err;
+
 	/* Configure Link I/O variant */
 	netc_reg_write(priv->netcmix, IMX95_CFG_LINK_IO_VAR,
 		       IO_VAR(2, IO_VAR_16FF_16G_SERDES));
@@ -216,37 +258,15 @@ static int imx95_netcmix_init(struct platform_device *pdev)
 	return 0;
 }
 
-static int imx94_enetc_get_link_id(struct device_node *np)
-{
-	int bus_devfn = netc_of_pci_get_bus_devfn(np);
-
-	/* Parse ENETC link number */
-	switch (bus_devfn) {
-	case IMX94_ENETC0_BUS_DEVFN:
-		return IMX94_ENETC0_LINK;
-	case IMX94_ENETC1_BUS_DEVFN:
-		return IMX94_ENETC1_LINK;
-	case IMX94_ENETC2_BUS_DEVFN:
-		return IMX94_ENETC2_LINK;
-	default:
-		return -EINVAL;
-	}
-}
-
 static int imx94_link_config(struct netc_blk_ctrl *priv,
 			     struct device_node *np, int link_id)
 {
-	phy_interface_t interface;
 	int mii_proto;
 	u32 val;
 
-	/* The node may be disabled and does not have a 'phy-mode'
-	 * or 'phy-connection-type' property.
-	 */
-	if (of_get_phy_mode(np, &interface))
+	mii_proto = netc_of_get_link_mii_protocol(np);
+	if (mii_proto == -ENODEV)
 		return 0;
-
-	mii_proto = netc_get_link_mii_protocol(interface);
 	if (mii_proto < 0)
 		return mii_proto;
 
@@ -264,7 +284,7 @@ static int imx94_enetc_link_config(struct netc_blk_ctrl *priv,
 				   struct device_node *np,
 				   bool *enetc0_en)
 {
-	int link_id = imx94_enetc_get_link_id(np);
+	int link_id = netc_of_get_link_id(priv, np);
 
 	if (link_id < 0)
 		return link_id;
@@ -870,14 +890,30 @@ static int netc_prb_check_error(struct netc_blk_ctrl *priv)
 	return 0;
 }
 
+static const struct netc_link imx95_links[] = {
+	{ IMX95_ENETC0_BUS_DEVFN, IMX95_ENETC0_LINK },
+	{ IMX95_ENETC1_BUS_DEVFN, IMX95_ENETC1_LINK },
+	{ IMX95_ENETC2_BUS_DEVFN, IMX95_ENETC2_LINK },
+};
+
+static const struct netc_link imx94_links[] = {
+	{ IMX94_ENETC0_BUS_DEVFN, IMX94_ENETC0_LINK },
+	{ IMX94_ENETC1_BUS_DEVFN, IMX94_ENETC1_LINK },
+	{ IMX94_ENETC2_BUS_DEVFN, IMX94_ENETC2_LINK },
+};
+
 static const struct netc_devinfo imx95_devinfo = {
 	.flags = NETC_HAS_NETCMIX,
+	.links = imx95_links,
+	.num_links = ARRAY_SIZE(imx95_links),
 	.netcmix_init = imx95_netcmix_init,
 	.ierb_init = imx95_ierb_init,
 };
 
 static const struct netc_devinfo imx94_devinfo = {
 	.flags = NETC_HAS_NETCMIX,
+	.links = imx94_links,
+	.num_links = ARRAY_SIZE(imx94_links),
 	.netcmix_init = imx94_netcmix_init,
 	.ierb_init = imx94_ierb_init,
 };
-- 
2.43.0

