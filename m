Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045876;
	b=NjG4J73R2GEABQk9TOHC/XPJxJutLSXH0n48SMGvXvn0VDbBHtEoBow+qfrwGmFXqXb4
	 2PBsG+iWAG3pa/pDB/XKjcEEWpMOAIQrt73hrKLFv4Z4iKtMF1g4Exqn9cZqs4WJF9wUr
	 wH5tlDIiA3f3F53qzZ5z8QcB1KSMcDuVekglGegyC0CxqQEAwIQrjz/eaPAJnxbhJmw26
	 2g3XYBo6C9LIQk7l/zwriEAGC6tCOC+m+39X/2J24jKop3ozBpf/VoJYzC9+pvL+Ov68C
	 53EPrboKls3YjB0jTNxf8mYIS9GnkDLzdRNQrBQnVkzVAFQYP6nGz/RwU4kG7ee0nTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045876;
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
	bh=kmwVEMCJugJNkQTR1URWP0zPkzGlXgoaSKJxNj2d+CE=;
	b=EB/e7moiBOxybW1wQnpLHHFKXz3aRfLxabcmUHF8k+IbDbz3WMAz51dg6NdMLUb2eZPS
	 oviHaugqCRnZ/5uBIhYWtSiwI8PQlC6287TMzqUuR4OiTTiAKMixXYkFnBNO0yFnVS3a3
	 wM0dNe2q+Luz1eijU+ihVq6pMeT3OjRM0hNQ2oYju/XPm5YSBxEtLvGMqs8TQrUpQASLy
	 gPBWsyv/0vsdk00SQfPLNa/zB5Ez22GoU49tqcXsPh7l2/H/M1ybJJ5aUEmEoYYSV8I9O
	 jbFbn9d36BUVgdDISH7QaHvIZ5GwuPfvNaODsYBGbS4bJEbRndBWcomBZxp6dTrBHdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=azzE1smG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.54
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE02606A32F
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 23:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE02606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=azzE1smG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bK1NYIJwvDrlWTptojqT4whvg3t5ksrDwZx/RxervtEBmkKoMwgqcs9UWxGhIcULLspsTllX5GIGAy5k5nCPKxGweMZTgT7nbi9afoifLLljpiaSesn6grqOlVjPvgD6Ww531lC3lNZYGZYt3QnsaCwTgRXcOeGfD0JwtGnLDFp2vklfTKDt/H/88+CJveM49ck4Ag4eQ1GGu/v2BY0HBLq4FscnI/B0JPu8eP41MCE1z+phmqsrJ3ZPz10RKTnJ7S2/5evR14Ch02SKxuxICirwBvovw+mXxpU9sXf8hCN9zhncgyYPL6MHdl7jI2L8ya93xvCdkEZ0bZnMUObpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmwVEMCJugJNkQTR1URWP0zPkzGlXgoaSKJxNj2d+CE=;
 b=kJAiiOxeyy39rr8MfHqlcC5QlH/r7oEQ4NCkW/zf+FyRMpHsmzdbnMp/cRosyR3957qz65rg27ThTtwenPnjhGhs059PnaoDYF3PKFgPD1aHYbDMuP09Sg5dMnZrWADE6UHFKgeU+fOFRvyJPbxgI4ZjwgxfYfqvScvaTECnVRzr0SNIflvwPDYx5Fjdw0mTvDvVZudVjMNgO4pcL98lGBPmmrgaae3ukl3h/X9pRGyeTya7iKao+QZC09kFSmlPh8NB17ijFKls59SjopmNhYJ9/3jQn40YMfJCdjWb4TtcD9+cjaPal6lB74phThcTG2WRnaVa8m+L7YbpB4n8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmwVEMCJugJNkQTR1URWP0zPkzGlXgoaSKJxNj2d+CE=;
 b=azzE1smG3T3WQNTTBm8LkubpBIZOWARycZm0OVNsKKf1ZHLbpGnnz6AjBVLeV3IJOi/SY3X8EzZR9ObAPmdTy/L4YqUUs7VfhqU1/E2s26T93z/Ej590/fAM5I/bZoXlCT5k8FgN3Vgi40lTUAzpHjfDZpRXYZxwZP+0q4mm80i1ut2/m19O7vC0Pllfhf7HfcopulHQufsguDZFCPoNa5zkAMp13+RNgUVsEniF6BrGQa4gbjhELMixiIRodBQs2fJ1M0cihPqX1oE4szEuIG6J2eDnh7690pV8tIIQxcTi+95whKKPBLy5wK6t02miISP+BS1ROeRMuyvvUm71mw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by ZR6PR04MB456611.eurprd04.prod.outlook.com (2603:10a6:910:d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:51:12 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 23:51:11 +0000
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
Subject: [PATCH v2 net 0/4] ENETC GSO fixes
Date: Thu, 19 Nov 2026 01:50:51 +0200
Message-ID: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0114.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::11) To AM0PR04MB6900.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: f3aecc30-e646-4132-3056-08df45ced305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|10070799003|261102123227099003|10067099003|261021121427099003|56012099006|11063799006|261021123027099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261022075727099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YTh34F4KT1RNXRWClBgYB5naEZX4sYMQIMtPsXnoLBQS87gZxyL0QERS2W5eV5sZOUxNeG3cyx2rqcQ36Blb7gQVnIyVidPLWIRhWk/SmXEgQhrQ4GyA1GmxWfXTArCXUVS1ao2V+rHunneposWeJA+kSuQseKMNW2PGZcBxmALCoqnhtIWgHTAhUWYaAKRjW46gQ/sGF8f7tBXEm3mQ0Rm25WuPFUguclmxM9/mFk33ayXelOTZOpgpBpyCysMSgiN+n2V722gAjA8J7BmogBoTA+we2oI0ygbt64r/D8CIENOQgzXlGTfucjNRuoRaI3EaYGL9/TG6rNjTMqEzudPEK6Gci4uWd/rnRYRjuO1TkyC06SZOD9tKfdrrxyxaSiX4pxX602KTc4f379GXN0MRRcR1by9SYHcr9OUfiahd5oXCytRwDp/0CAOVK2YM05NrMQJetCA03uv2G5UWzUnqib3ht4r4JJdNjXcAbm/yrJI/AfkG3mvltWrC9uC2U3uP7zhpC0dlO3cwXFLR3yfYhPOEE0RvxzAyMJw2h0wmDRjOduopvLMowvXKvL7h+TGKlY3R8EA6DxB4AL0SAdo5Q0KWvbCJVO57L0+IoNKc6RTbLelBOlCw5x7hesj+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(10070799003)(261102123227099003)(10067099003)(261021121427099003)(56012099006)(11063799006)(261021123027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261022075727099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F4aMmYgdV0SpWL/cPcPmf57YR/HMqIqCRvVd0kWibY9t36LszmTMVHo5e6GM?=
 =?us-ascii?Q?y+jPGtt+QcfaeJc90BncJDcpiBARcHu5Ks372orPWXnmaQHG1R+3Z3mevhc6?=
 =?us-ascii?Q?mAKq6Bz29IkodR61CACHQMDKf0LMOIZlHQlmTozC8KbsIzLT+bUxV4VVSB2S?=
 =?us-ascii?Q?AXDkEwGhRKjYnW9bBKsrB/aos60sBoI7lAzOSae1+6yxgrm9k2MXEsNlcoA3?=
 =?us-ascii?Q?ynbvBtY0b3oo3RDSpc+xdRBbVPYc0aAd3iT4vVdfCnAQfe0Sm0mvCwu0jk+0?=
 =?us-ascii?Q?1dCActD0ImEu+6JeRcF03CLa1+oQ/gN1ZhgtlvguSe3a9GkuliUseK2V9LpV?=
 =?us-ascii?Q?4c2JZOWUAxsMe8POXqfl1U5OEWTBRBgl5eoUZZsMIePTytXKisJyKATqB1mt?=
 =?us-ascii?Q?xVfrJFWKYqAfDzqQ+w+VJvdxRIj8fXT138QOr2ukeF/iePa/EVdBgDdcl5Oz?=
 =?us-ascii?Q?EukP6btvg/KKduA2w7jTLivtbUN7jH7yeudG4KZpyFDJg57ENJKwX3qjbSP1?=
 =?us-ascii?Q?KjJOPHZy/pxRReg2TLKHYOL6CF8hnoeXPDeGJ2Fe+HLDO5ueqHRE8H+S2tLn?=
 =?us-ascii?Q?rkuUg77a6h062lX1fuq53TLp1CDxkTHaU51TimTl9PIXC1qHOUo9kgRy74xf?=
 =?us-ascii?Q?8NWetBrzw6nZce8c+KrdP5dKlU6+fSIH+Yb1thjUvHVqajcb9YvfabI1kh3t?=
 =?us-ascii?Q?SM15ZTQsPgbcSJUtXRxvMdEY6nBJFbhoM60Xl5YxjzeXSy2r76oYG8m6dYdo?=
 =?us-ascii?Q?lMNPFSPy5UH07YcJRGjjWPGfcf8BP2YhE28o7o0Y0T0ADQprAWq89o7n7mIo?=
 =?us-ascii?Q?azLEe6UPXOWWlZfvVp/i5Z85mI7FyWTgvmGLnq+3erFpsxZWym3bSXiuK86e?=
 =?us-ascii?Q?VN0x6m7POF9naXb80VHI5S/iH+yw0JaQSlYKQTfak1RVKN+XQRNtvozhiRdu?=
 =?us-ascii?Q?p/Q5M7/AYnELGAhjaVu1RrrWWr9VbjAzoova3ET4tnWoX331J9WB4NC3YCES?=
 =?us-ascii?Q?5LapXCYav3Cgw66FCS0ECHJ7QYXX1XTUB2dXWcsejFQxNF5fdFHhj0LEGLg7?=
 =?us-ascii?Q?oXtgN/Da3WtS3QuhGQOjedCr8B3qGR+LBn3yVORfFqI5tRQ8m2pQhgYvIQ/C?=
 =?us-ascii?Q?Z1vDsaZUazLKpCywtinCG2qqLJ8oCIcR/dt6gx27YWS/UsfN/ulVBLa6E67s?=
 =?us-ascii?Q?HW87u9TQB0id+hhPaqrHr4h7Ij65iOKc3JN+k9oO0WkrABZSF6SRXfMwEd4Y?=
 =?us-ascii?Q?orfb4ayyY2zhKsW9j/sUROIDHTwXo7vDjrdWqvsZRG9I8CsVloruqc+c2exW?=
 =?us-ascii?Q?7aNKS+xp0xistE4GQSdef4d+5c/8+1aKRYC8k2mnT/4MyxyyL0xiOcqYnqn3?=
 =?us-ascii?Q?ujyuwQnG/d+wc/dQr3CAjLWyG8bfcqC2xXEE2/trqTZyR77A+jTOfSZwDzsz?=
 =?us-ascii?Q?j80jzgUfsc7oRdNUcFRbcku2aET9Nb2/Nv4GbwGS7ZdtRJZzA0HasDD6dtKe?=
 =?us-ascii?Q?7banmw51+KT406TzLp3lpwIYCcNZQR5qNPtlJMLSedrCYcy+3Yl3zI4J/dH/?=
 =?us-ascii?Q?bVLdvooKD8AWpXvHOrdroD2aiGb/bTiAuD86jxIVxPG3rfvE6dEb7spKxJwD?=
 =?us-ascii?Q?Q6uxjo5DOfX44jWT3kc6ast5pOTDgzFUi6CCbhMBhOrJsAQMH8Peym1tF0GL?=
 =?us-ascii?Q?hVKzeW5xlHaCPw4m0BNtYgD0d2rBO6NwtDODHXG1qGT7EMyELsZbLpKSYsSY?=
 =?us-ascii?Q?m029YbuT7+qTZ30HXIxhpC6z4+Vbtm1YbmDcjIaMhjML6xlE4uN8SysZUhic?=
X-MS-Exchange-AntiSpam-MessageData-1: VSeZRpMuYfISzA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3aecc30-e646-4132-3056-08df45ced305
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:51:11.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fclM5Hdst6catSNCQLEyka62wmyDeTR1WYQhzcNwEAw9KiUSL/hAIw2dShNfD2/sROAUEHlJwwIadgi4TAdyeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB456611

Sashiko derailed me from "[PATCH v5 net 0/4] Fix short frame
transmission in enetc":
https://lore.kernel.org/netdev/20261021145314.1435049-1-vladimir.oltean@nxp.com/

which also touches the driver GSO code path, so I'm making a detour
to fix 3 unrelated issues there (which I could all reproduce using
LLM-produced programs).

The main highlight of this series is the introduction of
.ndo_features_check() for enetc, which runs for every transmitted skb.
Each patch makes its implementation more and more complex (and I'm not
done...).

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

Vladimir Oltean (4):
  net: enetc: let core segment GSO skb when TSO would not fit the TX
    ring
  net: enetc: reserve VLAN extension BDs for software TSO
  net: enetc: fall back to software TX csum for too long L3 headers
  net: enetc: let core segment GSO skb when headers exceed
    TSO_HEADER_SIZE

 drivers/net/ethernet/freescale/enetc/enetc.c  | 72 +++++++++++++++++--
 drivers/net/ethernet/freescale/enetc/enetc.h  |  4 ++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  |  1 +
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  1 +
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  2 +
 5 files changed, 75 insertions(+), 5 deletions(-)

-- 
2.53.0

