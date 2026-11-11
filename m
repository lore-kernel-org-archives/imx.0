Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794439920;
	b=Wf5zIqCPr3tEDN9/X92C35bvALIzK4CimKn8wK2irmKKfAEHu+76EF5dxSCXwxydA4Mw
	 bDIhYuc+qOXc1bKlZGfclVWZZMvFZNfhjyHQkZ4zfxvB0ibU+0IdMzf3+0tFdgCC13sQE
	 z65uqhSO7ANWoidlcKOVn5ZuB6NbpqdbS8rH3tiB5LZI4vxrOVxvc98L6SVaXJLlud012
	 2q+OfrWlzUugo3FqnVzn3Ey0ppm275+iUU4euy90YkvjbDyQs6cIzd8LKxrPdusKm/TBd
	 6FEt9EuMrzLNep5B1vbVFxBPlKpBxyuPyxNj6dYWQG1JcbWScPVs+hiGVCYQ1d/ElJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439920;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	bh=Nh1zI7rRh52IicPrj50+rOk/rKyn9nbhOK1mmGJURwU=;
	b=suwby0ffaaIyGHqKM0AGttHPiGu8jhmQ0k0FsSLmZ+aTxG+fNKq2MkMovEjbQbeL7qlF
	 XZB/T/5M2SJMnqIjdElxG6/QzBy+eTKQv3fs5MSSchqnlgI8/Nl2s4wAMOGy9Ngur4OA6
	 e2J0iW482JUlLThKkr306ePWiE4eaj53heLhCH1leGFAfEOE4tNhn1KXPV9FqaNBi9Yb9
	 R6D3mz8ETzupcL4UTd2HeQD0QM7qTajU6GAfRdc31GmxDVZ90AW8df26DbfQYOFQXVE1G
	 rWTlt4IRMDGtT/Ikk1k03T+TkoPsy3oNoWL23rXKFG8Ru7VAa71rmIDN4grTht8mVGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Y7lSH7OY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.4
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FCD606A31C
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 23:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FCD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Y7lSH7OY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1mRK2D1PjID6a0Ox983z28+WfUS3oM2ZhpamUzGzxVR2tp7XDU0yLrK559sDQuRG9CDYxqDBtt8KupMHHvRTJ71iG/YRxwsEOvbKmQdVWjTuy3AjG7Z5JOzn/kzSnHnesKc0iId5GPHZueROG1jCf7v+DH7rgdE/dLRJnl1/1XNLB6YC3+5kJGjdcG+Xv5CzbXs23zwCmWvms1sMVPo95nHd2H8QAUmhM++tnJabzweWsJ5Uww83shtU3PWGkWa69idKCSAfEN0nKYh3qI5Hx3MQa9NW2a4LOr6tgaV8qKMGKJpmf5upUJ3m6cXshJLlY1OfZr3n7OE0qKJmBkECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nh1zI7rRh52IicPrj50+rOk/rKyn9nbhOK1mmGJURwU=;
 b=eGUeLq7etuYzXGo3E92+xVUXi2kEJlmGJ5efYoWbINE9iQaYx5Kg9043ojJ/MsXYLK6zOMJsS2PjR3qpVKP4MCSTl6MytYsjjNXE0S0MZYQiZnbf3j/DVOY02RjGe1lDsE0dGR2BB6hTD2KaBDMBhSMXlFZRXubpw2IE2GF15HIw3qSHKLFqzJzLdSNOGEFOlALTg4od19CdJNkkb7SxGstoojGHAbz6FqYOGIUTRmug3QXGXHAV/+lmgummx1aPUAp7S80rbEowLR2O0YABmRQbY0Sv4f4PvWh0mujvrCj28tbw6z0WqcGpFuPvfOJmNiji/GbcKVjcjzBWd/IkeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh1zI7rRh52IicPrj50+rOk/rKyn9nbhOK1mmGJURwU=;
 b=Y7lSH7OYEKmw/FKXBq5AU4bOEbKSjVFuDHtikFw0m30NE1G1OwvqjD5EmcXQAimd71zWCgUu0o29UUVFWfLV3cJX0Jo72/Jva7TjZOeefXZa/ygkE/nt1L/dUOg2xyN51l5s6e5Ab0F/7TDfFwYMW94GnQr0gjD5MpdwHAjYUUA/RHO3YpxM/BgkNOEPQTYc6+dn0JcUJGXU4v3kmYmSQOiXWC9WfJZWhjn2QC8zYg68iuuHHuowVYAY6u3jUeCGTRKxqyWIuc4BJOH3PrCKcXOyVrW4dy8qV6p7338ZBi39LU30lm2ERsrnxmKNHOeQLQWL3G9VkReiF1NRl9HGcA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 23:31:56 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 23:31:55 +0000
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
Subject: [PATCH net 0/3] ENETC GSO fixes
Date: Thu, 12 Nov 2026 01:31:46 +0200
Message-ID: <20261111233149.479596-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To AM0PR04MB6900.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c8d15b-039b-4c69-3034-08df404bf8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|366016|1800799024|19092799006|11063799006|261028144727099003|10067099003|56012099006|261021123027099003|261026121527099003|261021121427099003|261022075727099003|261026140227099003|261022105027099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JtwI6dgxWbhvhkiYfq8xwoJrukokQoqIFadcEqqtTJA2RRKTuXLNJYjCgNxmKipMEDCqNRwInI7uSNOMwOYESMJCrO0pgiSZKI/D/RUrbE4iWG6tIUdaJVHYLlZszDavWtCZtC5b9H0Hn4mAHAXSUgjP4CKFPlN5YOsBWeU6KOVua0q7rplx4MBu+dZrBoXKRS7NaIwqB1ytqWU/Su8KR6Q0j7lqIRDoypH60zjrYGwLcF9HCeAhlbha6nn5B1mBYP2AOKYJ9N86OVwkZf1tl78z2lnKYp9QHmXxLry9zuTmQSgotYC0uIO2XZzG5K1pgA5UJAjOZm6Eak0gnjrXKNohp4KVO4fSXKeXc5/TjKK2ChByzdAcJgE/j3bhevMbkhUkBk3fzfJxDUOH48i3PZMfSStH5PS/chE7XdgTtTPiEwOItUe9OsKu7q8/Zd2rTYMMsvg+iU/Df9RHF+AauoPgIYA50ZK/DwmTrrBwhVBsP8gVIdV0WkevKUYF1UlOd9v8MWkFMHE1uvW5WBPsOW4Y6xj7CyqFzIdbfPmotCMg61bhLvh8i8WCV9F7YYcc8bYNOczkOOGnKlfXRMZbJ2exnGWiEG9rJV9zf9I32uRjGLOCPgdQ8V4vIlVjIpY5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(366016)(1800799024)(19092799006)(11063799006)(261028144727099003)(10067099003)(56012099006)(261021123027099003)(261026121527099003)(261021121427099003)(261022075727099003)(261026140227099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YYlhEfcLNRs0FTuD02o4/0lBqHkchR9vFGHDv/qaR/C7aAn02DU0R5cq6E4F?=
 =?us-ascii?Q?9xMuSzniJ7xQNJH2F8AOXkLVYvKNBg1fQiFyXSXY4jI1s5+l/bm5Oko9SROG?=
 =?us-ascii?Q?xziBUkOSJa6fCtKlgtUwiwfN9Tw4RgtT7oxG7yX/4163Jb0Ufaxsz69T3mb2?=
 =?us-ascii?Q?+/EqKvPyFjW7mEGpVGJ9flk89MtD1sMvrVW9URFeItV4FyWJ4zQsS/FWyFiR?=
 =?us-ascii?Q?4LHGZMmPfgNVxi4s3LHIS/edKM7C7ASzptaeCIjoKOVH3yESEA+8rt5nvTcx?=
 =?us-ascii?Q?u9FfK0uFE58DXftQ603vWDifosBP44g9NHDbz936gxIfuRdWXEesAHxGYQhe?=
 =?us-ascii?Q?ZR1YgogPpZAKEyRrSOn6JbtS+VW/fnICGAs2908thd3D23KfSABT/yayLli9?=
 =?us-ascii?Q?KfW1bAX4+WMg3+I/inpE6uFBztRFhYCtxL5aAJ2NIuYCp6V2EUShSlMDsPzC?=
 =?us-ascii?Q?xSsmX05qwjeE003oNwkhNeKpuKunw+WDEcbyMtLoJX8Y5/lOaQBWUtKAzwbf?=
 =?us-ascii?Q?S5v5B44HQLrwxpIQzt1dX1ERQ4UCc8kEIZJWfqkoJ8TBP7esb9ApBfJWxzwX?=
 =?us-ascii?Q?ZKqTwOaMnwUnoMj/nD+Q6GgZRASnpvqwsFJjFWR2jIF/PVOeXkbagDxqENdf?=
 =?us-ascii?Q?JS5PQZGe8qKjGqIwGvo8eJ2uUgegmHI/VrQQh721Wk6KYAGpIPzF0z54ghaQ?=
 =?us-ascii?Q?cZearN51syVQMYNLZKpzvKqBHugDs16+Kd5xYPSQEGGgage150BxI1wQz6sK?=
 =?us-ascii?Q?rMdP2Shvr1gYWNgZvJ+97kMcdB5D801T9pUkzgoQ1qVF8eC9mBdlcnaap071?=
 =?us-ascii?Q?THAlFm13Ya7zdGglaUTYbfZbGgtzDG/BY85z+kMnTDQy8f80xQjpiDNj+IDN?=
 =?us-ascii?Q?ajvcm4G993/4lceXTcs7sYWlOYQOCtOL4YWCa25I2LjWsU3ComXINO+Zxpq6?=
 =?us-ascii?Q?KMa6V791+efnprV4erAkf1bZYMY/biae9WkBtdK45pcmwhkRTEsyEHx4axVX?=
 =?us-ascii?Q?57n/exGG8YOM6q9fwzbLHbhSqm6QudzEu1EMNV0BeUzWhOgCD4nAXBW2I7YG?=
 =?us-ascii?Q?QeHIg4jx/kvGuUUElB7v2vaCEwpDDQ6Vbb4VLQ9gB8i8OvCDR9Sh5RP9zbvY?=
 =?us-ascii?Q?O0ZB1GFNLZpS5h+AIHp9CHY1EGvB5laYp5Twgsi4st0D3340K5IjjQr0UfRe?=
 =?us-ascii?Q?vT/L+Gfic3kGuXmg1SfrFHKgC7DlCem1wPR4OSM3C2Ty0H+SWwHY3iVFMPFi?=
 =?us-ascii?Q?NFxEdxWTg7UooX5WIb16r5EpuGH14UICz3+s1S6gdElEfz4f7VWbSKILES10?=
 =?us-ascii?Q?Jljfq0UtXQ81b6mJH0FFFijsr/8xEXBS/SBHBKcByb2wPNdQWD9jH+j7Zuj7?=
 =?us-ascii?Q?+0DO4KGwwSbofryn0EQVSbUid5GZYQyOVa9iI0D5xLD+P8RC3kMwnQ3qYubS?=
 =?us-ascii?Q?ySMIA3vPxMx9KG1neyzsIXfllehDOTeWa8hm3zNeeXrelh7pswCKFPLzgkKy?=
 =?us-ascii?Q?gJVFYH3KJ8CE5pnkiQPKwH+3OjRzAuftM7ZLP1y/InPqu0LflriHR8e87BJI?=
 =?us-ascii?Q?XuhXOIwLQ0cvS9OTizWUb9LaM31mjkEcawTJlbLQjaVeA3HhueMCTsOcRZZ5?=
 =?us-ascii?Q?0/J2M11k5HT+tl1SRGq4axOdtpADChtDqs/7osQBuw0rVdDpjbouiZTIZYdu?=
 =?us-ascii?Q?LHbDkYLBaSgQbv3SOgn4HPxow22EBqr+iehu6R40r1aTfw2m9O4Grsa9SWdq?=
 =?us-ascii?Q?jLuMthRhK9ZXIdDMyJb8YL7fvLL7Y8KB/aH30L+K/hhlM3XRw3ja9EFD0QqG?=
X-MS-Exchange-AntiSpam-MessageData-1: 4Q1mbNcMvYojvA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c8d15b-039b-4c69-3034-08df404bf8d9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 23:31:55.5876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87d423/rNu+iLfJOlAJ8I48uGF2Isi5rDVb85PR8ElmcDgTpbpD+7VButCLGtG7ywUseb/XnGKnlYS4bLKlGbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249

Sashiko derailed me from "[PATCH v5 net 0/4] Fix short frame
transmission in enetc":
https://lore.kernel.org/netdev/20261021145314.1435049-1-vladimir.oltean@nxp.com/

which also touches the driver GSO code path, so I'm making a detour
to fix 3 unrelated issues there (which I could all reproduce using
LLM-produced programs).

The main highlight of this series is the introduction of
.ndo_features_check() for enetc, which runs for every transmitted skb.
Each patch makes its implementation more and more complex.

These patches all assume that at .ndo_features_check() time,
skb_shinfo(skb)->gso_segs is set properly. There might be issues there,
see commit 67b0cca9ba88 ("net: validate xmit skbs in generic_xdp_tx()")
which fixes one case which led to gso_segs reaching the driver while
being zero. For some reason it was merged to net-next though.

Running a bidirectional eno0 <-> swp0 forwarding of raw IPv4 64B packets
(no GRO or GSO) on LS1028A-QDS rather than some micro-benchmark,
I am not seeing a noticeable performance degradation. It is in the
noise margin.
Before: 7440 Kpps ingress, 586 Kpps egress
After: 7440 Kpps ingress, 588 Kpps egress

Vladimir Oltean (3):
  net: enetc: let core segment GSO super-skb when TSO would not fit the
    TX ring
  net: enetc: reserve VLAN extension BDs for software TSO
  net: enetc: let core segment GSO super-skb when headers exceed
    TSO_HEADER_SIZE

 drivers/net/ethernet/freescale/enetc/enetc.c  | 52 +++++++++++++++++--
 drivers/net/ethernet/freescale/enetc/enetc.h  |  3 ++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  |  1 +
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  1 +
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  2 +
 5 files changed, 54 insertions(+), 5 deletions(-)

-- 
2.53.0

