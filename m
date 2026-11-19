Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057244;
	b=x+ZFxMVczZV+wivcHp/tYq3H7eMwlDYby04XrvBXHB1GhqJQ9Tcw66QCpveVazkGkgh+
	 pYUfv64N0qKgFBoMWU5D378gAvbUNDjRdgfsfwkOaOuQdc0tYi/4qJjPkamIrKf8D3UNU
	 YRzXnVcm7jZT6/HzQ29Bviq+BHPZCG/L1o7XBhlqtPN8vrUh3fw+9ho/ka7bBpW/2JEVX
	 g+n0ohv/hGcHub4bn9RKubScDN7DKM4ArBeEig/uapT90PktSvR/FjmN4JCtqL0jKiEEc
	 TCgy6ePsl3pdBtULb6dqP2YJgVafsqbDQLWXSoroMcjDrzYjHt1wEo5nTf707rqOdlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057244;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8nmjXJD5/za3LN8wxhZ0o2lnHlvy8a7k/R/h45WNJbs=;
	b=TWtajY12dexdG2KGtKZdndPL8YYhEjhoGgB7Kn5nKKgXPtlfmM+QS7HiESrAZ3bZWHLu
	 82SG7UeFqfeQHulcsyCx88DasIQbAKqtUeitAvZN3z9zCpfVTjzeeUt5brvmkgHGne7wM
	 g0oS6AoLRAqoABIEDNT9NZy8L+acpKFrRCrPpaq/Vdu8OEBGokKfyzzyp/sD7JbmbujZt
	 g6EYKuT0TfNkwJwLqWVQqyWH84bSHxU3crBqeuWfcbZ+yqA3gIVFjbHdrsfIt1NCDN513
	 cS8MEbeM8Gj0FykbmJuDdG+sSQGLlOLIY8y1nGmaKgCw8nnFhYH8Ls3gxCV4vH7Ex2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RtIIU4IW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.70
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25370606A320
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 03:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25370606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RtIIU4IW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vp7SSySIQbBqbWwIwhfqg9FUarLxY+0OnTyLfHMgB0TTA4FlUb3LdLJU6v8I3DLO1qoYAIpVQqYu4ABnAvIVNdWx8MF7s+NPc35t5Dyr8ylEv0BPb7YfmvW/sAgGDaxGuSj7r33+7kQq9wKE8/n7lwfzFXZ9CL/y0nClECGBj7sse+4ElAS8FX8r3FfoAnULW96K3nR33q2oSUr6kFcpGn5MQ0CR/nsgis/xn1wCKZzytdJg7TbABjDfevr8f6ZxA7mnSJef25hrN7zoatlPrzvG6S71QnFLMohsPFdRMQmpCn373McgSiWtpCkNKmUzBLHlfEYfb7v7QtrI+vnlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nmjXJD5/za3LN8wxhZ0o2lnHlvy8a7k/R/h45WNJbs=;
 b=mcPFJzpFadnWvfCncv7iBNsB7TBDaLRwey+mIFyD+lb3u43YrYk6c4qvz3srNT0ApwPmuoEsUJepKBjFeiOpG8IxpTLHb78YUPLyR0ZV70lhoWSX5wZzbiTfimueFIpS8lV+j/T6DjjQL+wFks4O0y6nQZN6ObifsvO19akxR3h3wue6juQ0d+OIwYKoSyGTshKz8pEW3UIIlRs+aDJtVj16SuTnVHldlSAYz1sigDXJsP1UgxkpQ9p3+niAjDuQ4zDzFoCfFFrWutyVpfPfXFgmEMmK7lyFOYEzN6QGvnDajI2U+zdmPtXpDCYJacs7XLJ/B6pnfTRAp52urLW/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nmjXJD5/za3LN8wxhZ0o2lnHlvy8a7k/R/h45WNJbs=;
 b=RtIIU4IWuW76J1fWlmTKrHmNMeA7+OINZdlfDocitAq1Lbuq2avDcYt6gKAMlgToQeNY9CS3qz8gTWwW4GGKUMYJfqAvMpZ/80bHGqHt3bVvTHpo5k8Y2RSbglNT6+rLwrLI7hQQHBNPdF02qBjCiowOJ4ovDsaxj5YtMGV1Jkpsg23pZGlk0VmY6TVM3KVBCNXTAdy7tCDsfaZTAnesY4Wpx7+IVAmr1MY6xF4oJmf6Sz1Dm6ZUfVxRezPr4XGMREEP4Vt8WdFElrqqUo1nMoaXxmOtQg53aXPXIi+P9U98r3Y/cM7USVUe51JXUGKN7+V/6eb7Uu7npieqp1KuQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by AM0PR04MB11880.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 03:00:41 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 03:00:40 +0000
From: wei.fang@oss.nxp.com
To: xiaoning.wang@nxp.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	richardcochran@gmail.com,
	linusw@kernel.org,
	linux@armlinux.org.uk
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 net-next 0/9] net: dsa: netc: add PTP support for NETC switch
Date: Thu, 19 Nov 2026 11:05:25 +0800
Message-Id: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|AM0PR04MB11880:EE_
X-MS-Office365-Filtering-Correlation-Id: f6163275-1743-4b12-9f00-08df45e94b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|18002099003|6133799003|261009223027099003|921020|11063799006|56012099006|261102130727099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	VPjpZt8u9+2LBFhxPa0xmGlILugOKT/nJc0o+XoM9degIBCve+391Z/NxF/4XTmCbnKObrw+CQ0myWqneyiGu2pJ9P0VJBQ7Gs2gE9bhq+65ta6PgQC9ODtXYIN65op4W/Adbw9BuIe6LHxCzirACY8k9NQBqQLWV5rPw8ohos9Y5KgZBPFfaKUmi9HLjKf3SoiCKRBVTrr9Udj8GlP8ou0+n1kl9dYQuE71TczkLgZ3yYCXWg99JOUz2rdiMTBcvvPuct4MZunH2Z+N2pHKc4AhTXBhfI1M1kqIWnxVcyyYAzYK0LWiafYwFcOcvrvMuB5UiPoQNnslc7QDXq97Ia9FcErSybErJJk940l7oEGPuIVucqN0zngf7Wciq7EGJx1jOBW7jHHx77zMgSuXIJkMrfnHcOYdaGe0J4cF0EnacLB8Pm8GSdnvtmbNd+jwjVJQN+xeX2QF8o78RC+cY+q8/B8sn5tHb3lfWkfHHwT4g2gSSEqaVoqvqdg+UAVLdMMhyH03RybGIA1jsrX5ZhPTEpGqSEKUgiEuwmKSorDThAmCsJHgbiZ0QmEKBRt/WfB/Yd4tTikcawlTRuj+zYYXd+xYGkhpSu/H3IDyk1z40YyaZt1trWWO6PZyRXLfjdSc7xcqvGu0ViImuICjyAGJDGSavP9IKkOmoBe9bDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(18002099003)(6133799003)(261009223027099003)(921020)(11063799006)(56012099006)(261102130727099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xzvAUOzntyjc6HlBrYPOjgLn+5LQGI9wT9zzHsaKwi7ljDWGJyntq5DdcHYl?=
 =?us-ascii?Q?jhGZ+vXwKVhsoWqM2QAgRKZJLc7Af1/6jm5lzyUrVjQiocXbWYqpINoS9u2g?=
 =?us-ascii?Q?RrTllIfgfRQw16JIz3LSglAAU4E5hgU8X0yybkljfb3Zdqut3pf2E7GRWePS?=
 =?us-ascii?Q?p1vQ5k9owdHyarYQCiXS5Z7BLTWlGClfk9xYxwsvv3R+oGg5y9MTmURSxMXw?=
 =?us-ascii?Q?jNf6G+uFfuNLu0MC7h6axSHijBjJJjdb9h2ADSs8y13CTZMRZlp0CzwqMLtb?=
 =?us-ascii?Q?HxJS8QoWBuMBSB81qMndosc++XRJ+Fr7N/Qs4PRkWo9dfKCPwOHJE52Z+XJo?=
 =?us-ascii?Q?DmWm7TzTYn5PfUuqJfTJl2NmL3Sun4b10E4wcYJ9kjqXY/lF6SJ0zMPBhCfk?=
 =?us-ascii?Q?8enofWnsgjvnQHqCoycSbQBmG8q677IaB8A68LgIsQCBZCgLsk8pjjkZpBQn?=
 =?us-ascii?Q?vld0y1mChJoW+yBLwSsweRtLXda2G+n0Xt69y/ChrWFOkoBsh47z9Nh8nVGk?=
 =?us-ascii?Q?yOZF4La0TwCcbsX5qpNvFoOfxjFi5seZzaunXPQ2kYHBk5yGv957dUxGPdha?=
 =?us-ascii?Q?NhLZIVuJXk0nb0lz1BsCPagggfOj5uWJP69e6h83MFTup2+VSdcixrdtRaXd?=
 =?us-ascii?Q?EQh+wZDhuRbK9l52HpVxxJif9E6/oDiwxZK6WdGAwc2Smfd0yVPrQOJMStfb?=
 =?us-ascii?Q?aZDI/5+/Tr746gY1RX2F4OLETsIEoQn8Hk8NJFYxvZix6fWxxNyc6WhZRqes?=
 =?us-ascii?Q?2MDpUhB42zpeI2JhtzQxBvZqlSodSnbBZO++sbopuYBILBsH8hmy2bpYAhOn?=
 =?us-ascii?Q?GRIcWBfqVJJfHUOOumfK9c8SFL6h4ZBtk7e8gfxFFWGWPs+3LYc7twzQQ8g5?=
 =?us-ascii?Q?QAUuXHCcjXzXUN3c1tSf17U47M/Z5ZrgajVLvlECY3nfb8NzK1j09X5qrAdn?=
 =?us-ascii?Q?C53X2CpEiG6A0TmHYQH7GgFExTxVqJ/Gq15Uing6hYuanYjeE0kHyL+i/n2B?=
 =?us-ascii?Q?lrslSOLcePqCHUcSwakay+Z9oScLNb4Usb7VhZOrKCw6ibjomds91DoGSCp1?=
 =?us-ascii?Q?u3K2t6qMto4fOcwQw56GIgFi4uYhoNm0jjcTso6UYsjWT/08O+P6yzqOYz1U?=
 =?us-ascii?Q?0Byiq2dYpmq1+wStzBayQgsouQDqXV6kO5NOcMn0bT8XncpSkA7it9Sb53tt?=
 =?us-ascii?Q?eK0nONSJopjisdAPfr6mvgpyZGs2dctWZwMojzKNUxLEH1pAltETP2pQwzVY?=
 =?us-ascii?Q?hymENV9KcySwyKj4EoM8TgWFmFznmQ0pkIVolGF9dfgTMyLf+MB47pOzgx3B?=
 =?us-ascii?Q?BKf8yTjU9KQL6q5UrMWqYTIyG4lGHZd8fyWTdATzsl4OdKUgbbAm5fXHWdJN?=
 =?us-ascii?Q?JoyXsSL5XWz86qUg8mJ8HQB+cLujTTcXsEEVCEHZkCUkROe0Xppo/aOz6GFD?=
 =?us-ascii?Q?ns6Xs0Ic16OnD5F57MRkQmwObQlq6gGZB8W4MYJiPfFrOU8976F0yfN+S5Xc?=
 =?us-ascii?Q?WknEPHVflIRENreNmDingD0WLFkHJAJXA5oDvEa16viHvrHp8OIwhRVXbbG5?=
 =?us-ascii?Q?/lTooeV0XIUGRRPSUnCLy4kz7GfHM7+Ty7rsNv6/6JlYe5DJBuCntVK/zzxU?=
 =?us-ascii?Q?bE9ZYfSO5cprIhENbekZo4Rp7b2Fz9XWwvSHQ9yQVVPBL/Sm+2PuLJ/7VhT+?=
 =?us-ascii?Q?SxZ3qM91psWDKYfMXQg6WZKN6g2eje+p0WEqq95CgwL0FAFlOBitrh7Ppso8?=
 =?us-ascii?Q?o38uMQdkiiM21t6v5Gpxyfu8OXCg6+jQWuWyJJkBukaLfyqWW+p9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6163275-1743-4b12-9f00-08df45e94b1e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 03:00:40.5378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1tLN+wPu8w24OIn/YTE7Q/WvC8j5Kz07yugQeQ6o8aTkhQMZQXN9vR5rsw7+0UNeI9Cdcx/h4QoIQslVh6WfwGBntaO5X92ELBkYXuthl7NT6yJx2omUMiEmhrteRcB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11880

From: Wei Fang <wei.fang@nxp.com>

This patch set adds PTP timestamping support to the NETC switch, so that
the switch ports can be used for IEEE 1588 PTP synchronization.

The NETC switch has no time registers of its own and instead shares the
PTP time of the NETC Timer, which is a separate PCIe function driven by
its own driver. The first 3 patches prepare the Timer driver for this
role: tidy up its 64-bit register access, drop an ineffective reset, and
export netc_timer_get_current_time() so the switch driver can read the
current PTP time across the driver boundary in a race-free way.

The switch redirects PTP frames to the CPU through the ingress port
filter table (IPFT). A few patches harden and simplify the existing IPFT
and host flood handling first, then enable the ingress port filtering
lookup by default so PTP filter rules take effect without extra software
tracking.

On top of that groundwork, the switch driver gains RX timestamping and
both flavours of TX timestamping. Timestamps are carried between the
hardware and the driver through dedicated switch tags: the ingress and
transmit timestamps ride in To_Host tags, and per-frame requests ride in
To_Port tags. Two-step TX matches a queued skb clone against the
timestamp response echoed back by the hardware. One-step TX defers the
Sync frame to a per-port work, where the driver reads a fresh PTP time
and writes it into the Sync frame's timestamp field, then programs the
single-step register and transmits the frame so the hardware can add the
residence time to the correction field on the wire.

Together these changes let standard user-space PTP stacks drive hardware
timestamping on the NETC switch ports.

---
v8 changes:
1. Rebase patch 4 due to the code base has been changed
2. Check the return value of pcie_flr() in netc_switch_pci_init()
3. Remove retry in netc_port_set_host_flood()
4. Add IPFT_FAF_L4_CODE mask to frm_attr_flags_mask
v7 link: https://lore.kernel.org/imx/20261111062753.1397582-1-wei.fang@oss.nxp.com/
v6 link: https://lore.kernel.org/imx/20261103021024.3121936-1-wei.fang@oss.nxp.com/
v5 link: https://lore.kernel.org/imx/20261012095924.1129312-1-wei.fang@oss.nxp.com/
v4 link: https://lore.kernel.org/imx/20260918072852.501420-1-wei.fang@oss.nxp.com/
v3 link: https://lore.kernel.org/imx/20260831082335.1184605-1-wei.fang@oss.nxp.com/
v2 link: https://lore.kernel.org/imx/20260808032146.2335723-1-wei.fang@oss.nxp.com/
v1 link: https://lore.kernel.org/imx/20260728104548.3301214-1-wei.fang@oss.nxp.com/
---

Wei Fang (9):
  ptp: netc: use ioread64_lo_hi/iowrite64_lo_hi for 64-bit register
    access
  ptp: netc: remove unnecessary pcie_flr() call in probe
  ptp: netc: export netc_timer_get_current_time() for cross-driver use
  net: dsa: netc: tie setup resources and reset to DSA setup/teardown
  net: dsa: netc: use entry ID instead of pointer to track host flood
    rule
  net: dsa: netc: check return value of ntmp_ipft_delete_entry()
  net: dsa: netc: enable ingress port filtering lookup by default
  net: dsa: netc: add PTP two-step timestamping support
  net: dsa: netc: add PTP one-step timestamping support

 drivers/net/dsa/netc/Kconfig          |   2 +
 drivers/net/dsa/netc/Makefile         |   3 +-
 drivers/net/dsa/netc/netc_main.c      | 398 +++++++++---
 drivers/net/dsa/netc/netc_platform.c  |   1 +
 drivers/net/dsa/netc/netc_ptp.c       | 890 ++++++++++++++++++++++++++
 drivers/net/dsa/netc/netc_switch.h    |  67 +-
 drivers/net/dsa/netc/netc_switch_hw.h |   5 +
 drivers/ptp/ptp_netc.c                | 136 ++--
 include/linux/dsa/tag_netc.h          |  38 ++
 include/linux/fsl/netc_global.h       |  10 +
 net/dsa/tag_netc.c                    | 228 ++++++-
 11 files changed, 1610 insertions(+), 168 deletions(-)
 create mode 100644 drivers/net/dsa/netc/netc_ptp.c

-- 
2.34.1

