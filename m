Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045877;
	b=jMu8Z9mKGAJ4WktJmA7i1JxtnreMR6st1SCqzO3R6rP1E8H2BPI3Nqh4MBLulLU+IWyh
	 J8w7sGAXSVY9hV4fGDzWHdEbXvcfTv0x2SHV69F6GpgBBEDK+GE9PqiEkIrFyolpDFSwm
	 NGIs1SsAtdDv89Vlzx83DKiKAHR4bslzq/eTnQ8DLcsEtLM7NgVTtcV8L38dgO9cN7rs9
	 WMASx9j5PEtA1Uldx8klaXnbQsJfMoCakGk0Vlvzeej9HAygGtDG0eAIbvjbekpSkbppg
	 CuhccSQGUQQmlKYNy6PfG5nTZwQ2vjSnKmkzjRGBfj2OfPho8JrIewlUSZozjPud5qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045877;
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
	bh=DDXkjjvUh2ptXCUFY4jh3rv6ehy2LuNxud6axumwFoo=;
	b=etLD90TFvvI64QslKYUNZ5UyIOkYaSYI7rkfcG9M7Tab4XdaChSkn4n/zvKY/bzy8Yf4
	 bVcLWnWAVQMA5OafrpBUhRux9pbenXypuZVE08jw81iy2E5cNNrd3bOctCT93wDNg49yN
	 c6Usns99neH9jUnqhuRfEBUvuml4e4WIRxSJW+9BSeKesuVnVnuHl049dfDL19C7g90iq
	 PbmLdpGHuawJfRVGcCaGRiX91wLEf5hJWZKpBdJdAKtLInYpA68pIc8mXe57b16AHENs6
	 Q9eLRYezfdhuNu31WpDA/lgXl6AGNRCBMFI/jWpYuskfQbrSIceVepP96XabpygptgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Wm+4mkLm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.54
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB30606A32C
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 23:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB30606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Wm+4mkLm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFdxPxe0m8NRRdSAorxVbNiWiw9Ulg0BngBpRVFs8dOBrXbjq1/n0NPoR6RUGY1vmXZ4YrpY92552Wjk1H2jInU+LehoLqHhBK22fKUU/WZN7I/RKrO8oKKkFu7Ys5JR7UfXWQapWktEPvlSQkAoft08S5q3hLg1422/CV98vFDtlWB6cSjEhUI0IF6RLrKCV3pd6Fw2ramBHf6/rmo+zMNRSJ+lUOcYdAOlztFcJrDXoRvFJAcGdvWe/Q21AO1U2fJdZOlKf4iCW7Z4HKhwQ07OtdypdjVb0sXctny4UrQSl1iqLdYjebAZYDsOU2ksfKEeo7PgGMFSD55LnJDVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDXkjjvUh2ptXCUFY4jh3rv6ehy2LuNxud6axumwFoo=;
 b=I/qbC53KKPW0xDYLlNkEPYZ/7XjRvn96Szjd8SjSJVUugZdRb6PCpS5HYFI2ITKQl/k35eYZW9j5cGvQxmeOpiIW6GLd0Ln5bEFCucVtkFR61RTSN/bKA8LHkdUafBmqHzpZZg+nLkvdWw8VVBWuIu0TEi5VW9kJpzXtM9lFxko8rKCCHWXXPNgyNkEvVWEZeS/g/bomASU8ybgnqvcKmW7Ubz3UQBJLGI8jZ3BYt0H5DbCR/rWKnxWHIt4R1MsfCwoCf6OqCES8FXwTWqPGEL6K9yjTWsPuaE36BhJbaqZKZRQRCml8SUP0dxVEQLfLeZ1rqpaJnl9dQU3bSESzYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDXkjjvUh2ptXCUFY4jh3rv6ehy2LuNxud6axumwFoo=;
 b=Wm+4mkLmNDFm6p+zZY1+FGxB140Ogmsh/j12u3iU8nAAP0bnZfs8R/Wh8BGAv6JqTBNMzq1ze4Q56xVKMzURYjFWyftMiMYVCXIwtpQprLLzd0k03SYi3neKQK+k3t7CSEVTRv+TU5O3sF42AIi/sbyEkJIw5iYEA7hrYfOn+Zwmem7otmPC6tMOT0r4OvrRQ6w/iBTeZ7U9viWt5Uu2/QZ+Ht1BzCi6QOrYeVw1JYlq3scQTmj8W8TMIVeca6Hhx/EtjyCVOIonamaZnxv1A//f2/6lRIg49XKoLWzc3soTjHFOXpFQsfDas58acmb3w+rDgD/FA3I0/oFz2QHdgQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by ZR6PR04MB456611.eurprd04.prod.outlook.com (2603:10a6:910:d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:51:13 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 23:51:13 +0000
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
Subject: [PATCH v2 net 1/4] net: enetc: let core segment GSO skb when TSO would not fit the TX ring
Date: Thu, 19 Nov 2026 01:50:52 +0200
Message-ID: <20261118235055.1225115-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
References: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0121.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::18) To AM0PR04MB6900.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 0baaadf6-be69-4be2-8107-08df45ced3fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|10070799003|261102123227099003|10067099003|261021121427099003|56012099006|11063799006|5023799004|261021123027099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261102130727099003|261022075727099003|261009223027099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jQZuWH6YMd5hC+hYddC4dc/k8Js2m1C8BLEX4iVVnSNFe4TcDv4JuV0Lc/p9G47IN8JR7Cd/6h0xsyu+4w8QeyGVM2M5iQhaWZPsyvBN2ctyZNYtXgQnTIp3PQXdEpgEG1Elksn59cvaT74o46EGMPQS0y5jYw9DjMuAnpr0vxEKpcZiyWfVr4xtS9SqSiPbDKT+8IcGX4PbRLcYADElDgW60wcxYWtwiErTpmRDQo0wSEZ5ZMkwmNA9tLNPFTFPxEeXeIAU8PPIaLd7vfL5wgdGWJFz36Ej2QDMoor3/FfAV79cW0JQF/2cmK3dG1UGRx8yiCpOYy/V8KogocEEt2Tlg8U0fE/1C9NrBLoOs2B7Wc4Fl41oF0WfzBRXf4C6Pk2CBlAdq8xa7FA6sKVgbZYdY/rYAI8nyF1gUERJCJIohmNXsIf/nRdc3+cPIiRf0Oafc3UzhZX6gsoJBl3SOFe3xfYOIGTWFXdQ1/qpfYsK0WWa8u6w5jhM6UUnaanuzxcl75ezd1aWBE0VWvrVXs7pECJ/DBq6qHj1z/eC/OAOh2I5b4UcCByn2WA3uheZ1wXZW1aQqxSzWhAkRYzEncwSocIX3MlMY5EQMC6BHUs3oPAOFqn1Sxt6GTlCVVZsHQNNz3BKPnYPHXuKeyuBLq94eqCEgc/50ajYoZBVzX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(10070799003)(261102123227099003)(10067099003)(261021121427099003)(56012099006)(11063799006)(5023799004)(261021123027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261102130727099003)(261022075727099003)(261009223027099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xe5J3o/zr+aecby3behkseaDE4EMhUIivg4Xcn5l5RmChj1/4xGfwBtS6v6Q?=
 =?us-ascii?Q?uLVryn1CBriqFHvj/6t5OQlne0MQFcQBabx+bFzgeYYDJlNEFGCB9m4cn0lx?=
 =?us-ascii?Q?/lgNa7VHuQYGwvhWWAy78CxDRvLflooOM++MZszFi4UB6mrC/WkOP5Mz/Et9?=
 =?us-ascii?Q?jFB4zyNwuZ1U/cQUS8UXawaeNMstu7IzfYjDsJ42R5mSBE8avRd90t8ebwym?=
 =?us-ascii?Q?NmM0tKRna1Cz9WUVghnjwXlaPKFsWTgujDbpTqNzFcPHnIDK9XvYNgJaDxaK?=
 =?us-ascii?Q?ILty86O4GUBDXX2np4KE2+m2r9x0VwYKii1lvMcauDCqulyVyPaKAv5M3vFs?=
 =?us-ascii?Q?1CT3/YUJh6NDENpF7ZG1gEWYVu8Y1hoSr95uZ+u5s5fK+GiO/18BlQ9ZuEZV?=
 =?us-ascii?Q?smervBX86QkkbObEXrP26zHVRopL6KRqs0l48Iij7xgjasTAWMjV5YOk3J5g?=
 =?us-ascii?Q?8O6iCxIBGS2FKypj/b6W7ZwiMZKFPUpf98wxEj60PT92J1lVxg59kJ38mGj4?=
 =?us-ascii?Q?Jcp6EgVQ/clV7ZdmZsKBwOGz9TwO4OsAy+oOKYycYmBY+EumZ/GRX8hUj1dO?=
 =?us-ascii?Q?1C1GdR5ksUayH3Zs8PyMtfA9zG/C1H+abceC06AP/dDh/zwpYFQ1HYWitlT2?=
 =?us-ascii?Q?60NV+yADM1QPQg8iZEofVI0ajnQL2fuhiQjogQClFJXjBZfbWt8RBDYcNGoF?=
 =?us-ascii?Q?bxKvn72CVJNrk4hmuZLutRzTLOZjfjl1+4pSNAO2oB/XYeVg7/r+QIAGq6/W?=
 =?us-ascii?Q?c/g12YPx56vmXkcLtVM8bA/OMd/L6hW0KvfYzIyjTbRqzkV8BcJcVchr5fQ8?=
 =?us-ascii?Q?ZW3MalYKqU1lGQa7hnYjNQpIm11dID+tj/BzidFcCPxO+wSDL2nb+VSgfW38?=
 =?us-ascii?Q?yAmosKl6gk+K+aY93i2jYHsAtCfuQGnSz/5qwDqcB+bjfKTPl/T+U5dLwVgv?=
 =?us-ascii?Q?pDKZpeJGAqPRyhIQWTW+g8ztoyQpT+/k7R4NrCrDGfPMQX9vFZlAF40c2pp8?=
 =?us-ascii?Q?lb7EoBtASecRY/ordnrqMjmYy8bL/YUSyuhHGKTqnXvUOkADGAi0UAiPak8/?=
 =?us-ascii?Q?nTbAnagcCUdrdCey9ZZLRQSPWtXkaHa0pX3hGdeICGQVDD2/r5X+OgRHzJgz?=
 =?us-ascii?Q?c7f56JVlKEs0HzPgj/G2ys+45QXQ2tqTLqNrlsb7KR4orv6lyHd1hgf/ZYng?=
 =?us-ascii?Q?DQEWzKKGx/6baqiJamxCQU7zbtHhB6mfEmv3r7xfeOtqrsalaT6G6y5R1N9g?=
 =?us-ascii?Q?V3HT5Mh+1CjEIC66xjiANUnIkBesYFEmtW+Tm3R4loksFql66sLghruk20LZ?=
 =?us-ascii?Q?WNXGxgXW9hrXn3cs+Sw5cb8acVE5j2fG7LHTt1MiluEFihX4DvdzzPMY+daE?=
 =?us-ascii?Q?pjyP5jjCqQyZgtUMFQ4ditx1h4tl29wiPso+JEza6WVgTdLbf7pCCB/s9rjF?=
 =?us-ascii?Q?mG8g0VyCqK+4t188Aw9NuTyuHuz8RJsFt3hnUXd+ow/s9MVuWhFgxkw9iuOd?=
 =?us-ascii?Q?QOu0kN2w8i2OBozLyzSL/RvwbE2UlTRRLmorSrzxIZb2VCjjmn5WIX9r3CGH?=
 =?us-ascii?Q?1+X7LqhJRM3kFlfHEcYZTk5lgZN0GTomXLu58aS9EpwEkiXdBwzM/dgNOqY4?=
 =?us-ascii?Q?pdeUNFKyR7CHsW8jfbaBA8aqLeyONcSNleuLnMEe2paPU5AUOmLExSl/JF0J?=
 =?us-ascii?Q?6in9/jDyL+3gYblmSzgSECCozOLCeDTJp5KMnkkPNkWHdnBchWfmB7EGRSqZ?=
 =?us-ascii?Q?wGVQsD/JRVUc2XsouHQ1ijymvamvQmKghXseMscG1wmD3wGHob2Sd0CpCnph?=
X-MS-Exchange-AntiSpam-MessageData-1: IBqDb2hbR2XI4g==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0baaadf6-be69-4be2-8107-08df45ced3fa
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:51:13.3597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBMVqQ8b2n1MbNanWvDBFzNDv7DLjJ/b/blX/VFeAas1WwgLiiPpCtyD7xUYEQKxYr66un/GE9QpEomtpjIn7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB456611

For simplicity reasons, the enetc software GSO implementation waits for
the TX ring to free up sufficiently that all BDs that would be generated
by driver-level segmentation can be enqueued in one go. To pass the time,
it stops the queue and returns NETDEV_TX_BUSY for the core to requeue.

The problem is that without any limits on gso_segs, some GSO skbs can
never be sent, and the aforementioned behaviour results in the queue
stalling (there is also no ndo_tx_timeout implementation).

This was reported by Sashiko, but is a valid issue which can be easily
triggered from any source that can craft gso_segs in a way that
tso_count_descs() can exceed 2047 (the ring size minus the obligatory
free entry). Valid reproduction methods include TCP peers whose MSS is
close to tcp_min_snd_mss plus large (64KB) TSO skbs; UDP GSO using
setsockopt(UDP_SEGMENT); maybe others.

Add an ndo_features_check() that clears the GSO features for skbs that
take the software TSO path and whose descriptor estimate is larger than
the ring could ever provide. The core then segments these skbs itself
before calling ndo_start_xmit().

Capping the segment count with netif_set_tso_max_segs() would be
simpler, but its drawback is that it's static, so it would have to
assume the worst case for every skb (MAX_SKB_FRAGS, and later the
per-segment VLAN and padding BDs). This would reduce TSO sizes even for
skbs that fit.

Fixes: fb8629e2cbfc ("net: enetc: add support for software TSO")
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: dropped the word "super" from "GSO super-skb"
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 31 ++++++++++++++++---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  3 ++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  |  1 +
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  1 +
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  2 ++
 5 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index c6571b5cc842..1606ac57016f 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -695,6 +695,14 @@ static int enetc_lso_get_hdr_len(const struct sk_buff *skb)
 	return hdr_len;
 }
 
+static bool enetc_skb_uses_lso(const struct enetc_ndev_priv *priv,
+			       const struct sk_buff *skb)
+{
+	/* LSO data unit lengths of up to 256KB are supported */
+	return priv->active_offloads & ENETC_F_LSO &&
+	       (skb->len - enetc_lso_get_hdr_len(skb)) <= ENETC_LSO_MAX_DATA_LEN;
+}
+
 static void enetc_lso_start(struct sk_buff *skb, struct enetc_lso_t *lso)
 {
 	lso->lso_seg_size = skb_shinfo(skb)->gso_size;
@@ -1018,10 +1026,7 @@ static netdev_tx_t enetc_start_xmit(struct sk_buff *skb,
 	tx_ring = priv->tx_ring[skb->queue_mapping];
 
 	if (skb_is_gso(skb)) {
-		/* LSO data unit lengths of up to 256KB are supported */
-		if (priv->active_offloads & ENETC_F_LSO &&
-		    (skb->len - enetc_lso_get_hdr_len(skb)) <=
-		    ENETC_LSO_MAX_DATA_LEN) {
+		if (enetc_skb_uses_lso(priv, skb)) {
 			if (enetc_bd_unused(tx_ring) < enetc_lso_count_descs(skb)) {
 				netif_stop_subqueue(ndev, tx_ring->index);
 				return NETDEV_TX_BUSY;
@@ -1098,6 +1103,24 @@ netdev_tx_t enetc_xmit(struct sk_buff *skb, struct net_device *ndev)
 }
 EXPORT_SYMBOL_GPL(enetc_xmit);
 
+netdev_features_t enetc_features_check(struct sk_buff *skb,
+				       struct net_device *ndev,
+				       netdev_features_t features)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+
+	features = vlan_features_check(skb, features);
+
+	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
+		return features;
+
+	if (tso_count_descs(skb) >= priv->tx_bd_count)
+		features &= ~NETIF_F_GSO_MASK;
+
+	return features;
+}
+EXPORT_SYMBOL_GPL(enetc_features_check);
+
 static irqreturn_t enetc_msix(int irq, void *data)
 {
 	struct enetc_int_vector	*v = data;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index d9e91832a9c1..1e3290d1a388 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -529,6 +529,9 @@ int enetc_close(struct net_device *ndev);
 void enetc_start(struct net_device *ndev);
 void enetc_stop(struct net_device *ndev);
 netdev_tx_t enetc_xmit(struct sk_buff *skb, struct net_device *ndev);
+netdev_features_t enetc_features_check(struct sk_buff *skb,
+				       struct net_device *ndev,
+				       netdev_features_t features);
 struct net_device_stats *enetc_get_stats(struct net_device *ndev);
 void enetc_set_features(struct net_device *ndev, netdev_features_t features);
 int enetc_ioctl(struct net_device *ndev, struct ifreq *rq, int cmd);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 71c971618388..bfe0eaf50975 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -586,6 +586,7 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
 	.ndo_start_xmit		= enetc_xmit,
+	.ndo_features_check	= enetc_features_check,
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode_async	= enetc4_pf_set_rx_mode,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index d77a07cece28..86ca88196a4b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -483,6 +483,7 @@ static const struct net_device_ops enetc_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
 	.ndo_start_xmit		= enetc_xmit,
+	.ndo_features_check	= enetc_features_check,
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc_pf_set_rx_mode,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index f70b6d4290f2..223f974727bc 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -440,6 +440,7 @@ static const struct net_device_ops enetc_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
 	.ndo_start_xmit		= enetc_xmit,
+	.ndo_features_check	= enetc_features_check,
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_vf_set_mac_addr,
 	.ndo_set_features	= enetc_vf_set_features,
@@ -453,6 +454,7 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
 	.ndo_start_xmit		= enetc_xmit,
+	.ndo_features_check	= enetc_features_check,
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_vf_set_mac_addr,
 	.ndo_set_features	= enetc_vf_set_features,
-- 
2.53.0

