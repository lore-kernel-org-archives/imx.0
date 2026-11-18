Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045881;
	b=mLKtvSnhe2rWrNwY3lS2x+2wAfhsadkm+kxQdOqIvCikrKdLTmAQifHEz0aDQw5nV1gx
	 sfOqbOQzWYAXU7lYmKvVv1V+A+SsDY2bQKg3wpF+xecqlBZuwXb0GY6hqb51ck1NDxlIt
	 CtWqA21j9LsYlMAkeptxgOkFfYgfoLT5IGjosyD/Z430pYKhBckidPM7yt/tKwR9H10Gf
	 0UMa+bgLZTCAhcD4dFX9p4lmLWmmB9GtVQyp/ow2XhCLaw53al/v10EV/6zEahMwikXH+
	 lRCRh+VEIpbZ5gZOnNKbpxWteoCHgDm13RXl4raJAUMXf73s+y2uY8ESRFhTeL53+ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045881;
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
	bh=hKVNNJHTJrIRg1RanHtDQ6OAtF1Ig/V1PV5U49nuhl0=;
	b=zEGR8HtAUXJVLVkBSC8PK+SghGWi1kgvn7pEgW0luLjAUSbImXXjS5aZeyZ3FaIPKbYx
	 ioUoc7Vl3tfarcIer8NlLEkNzfk/6Ghf2jNeE7APf1waTH8NL0h6Tj1jZ8oZfDBrwjZ0M
	 AnWUopCBm58ekcm11m9EAiidRyEjyKVXIGDqT1l1xMohIfuUh02n2v3ORvdRYJ+MoFGTw
	 zgHngDIo/zyGXETspawPpIOUuXWsyCY7UElA5f3T24iLhihDgGRNA0QJVobznmwf6tVJu
	 Z4sM2WJo+XsLS3xxA/I7WZltyM893x2CyeN3Lz7KrR64LcoOOPS9wiRaAOxHI/Xsx7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AaiebnFl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.60
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE5D60A2603
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 23:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EE5D60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=AaiebnFl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0CQhDaTG8+9twh7suIs6QP4hiWKWmcOGQ2ubciqnJh9Ob+GPy1A7LzKMbZ0/PMxryvsgWVmozqMor00xRN31tjnfj5OMIVM4f+8hDS62Ni702oj5cyJdkcHgrODAAg64ER7OBZy4GdM65pWVLRRCm3PKnmi8mLj5hFFAZPJ8uidklAy07RMiRZATAxgET0gc/gSh7KOuuaevB44jPpzj8cvRJTrunoq4SuV3uGer3kOQUnfl17uS86l9+yNYxn0RFtA4pSgdQBoVjDs18qqmP/rcSvalYwdU1Lgbrmw4RtVqI+4U2BoL/A5TB/t5yeQxtFpQ6Vvo/sM0cqmn/bXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKVNNJHTJrIRg1RanHtDQ6OAtF1Ig/V1PV5U49nuhl0=;
 b=cYT6YQSalgLIX2ZaReXfLTzCXW6l759xJML+vpxYHdDUBDcJLbWW1pXe93C2O7q7A+nEPId5NUc+8oXRNp81et8n4yf/19yoAlrQLaMpkvG8xs9Vqy7Na9uwmYxiRFo0vfc96H3F7SWO7KMwbRAV9GxnPwk4ZloiR8T252jWobYPdPjC2Z/vPP7IIaSRDVxjCyZeiAkG7eROR90sShx0MFrHt6AY44rhGqNwjzzdh+ZS57dqp08WESrnUjZyjOpvh2SCcnPf2pB1ZjbXQavqR8IcPioWytPKRmFDrX10iCAxfPA/CAKKNz1xboIdVAA1n+q8CYTNsMNja9zNVXJQrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKVNNJHTJrIRg1RanHtDQ6OAtF1Ig/V1PV5U49nuhl0=;
 b=AaiebnFlNXrktqPa9Rn1VzOFqk64FRqoNxcTQSZ/69UsAlVEwL40cyUTlyUy/bw0wFGw7SBIR72Z/5jzZgYsyBF2aZaQ5eOt0uz1mtiTCRVgZYzgrgeOieSR6TX6+0kht2m+usUnvq4hdjcCqnQarlFkinVcu655ImqVx5sCR09A6PrLnekevMARC0gWzqrJqCpZdo35lubICdTdoLXtv/WRcGPVE+dmWAQAjZsdkrnXH+1fQgZg3Y47PSnqYybwzGaKFBj6o6FNffY5OmlmoKKIpoknwRluG/HcDwKx1NQEfyQADuYZv4kUdFvxLzxdWOaXykstnIWsXeCmDqdosw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by ZR6PR04MB456611.eurprd04.prod.outlook.com (2603:10a6:910:d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:51:18 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 23:51:18 +0000
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
Subject: [PATCH v2 net 4/4] net: enetc: let core segment GSO skb when headers exceed TSO_HEADER_SIZE
Date: Thu, 19 Nov 2026 01:50:55 +0200
Message-ID: <20261118235055.1225115-5-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
References: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0066.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::9) To AM0PR04MB6900.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 0d8c6600-fa14-4a44-71cf-08df45ced70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|10070799003|261102123227099003|10067099003|261021121427099003|261021135927099003|56012099006|11063799006|5023799004|261021123027099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261022075727099003|261009223027099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5MiyXNG8a8Zcs9FSzLrHoecKrgtu6NZGv9fS8vJZ2V2KEsg3gjMdHXEYPEDZIt9nR0TdEr53ylATPiPRWYqGIFCqVE0minGfSD5UQTHA9ShVKW+WvL2VfH/wBn6FeyAJh4BmzTde/ZSy+qdlJ3g8GAaiApV9wOgQjTzElmQsxhUtrWXjv8bcb/dRpE+gsOtue47//3UqPKkcw8fvCFGt4uxyIdjZ+MNqTggUYKrqQ+kdsGpkXUOO91z3EZW5B/ztaWRJiQhj99CAeGP4jR5f+PDVXXL9bPVEMJPAUQ/nXISoY1NQcmhxkuKQH6fyuIHaaggzzHoc2cXp8w/n0Q4DIM0OujMx/j7CQUQ94js5NEvRbfY6FmcYpcm0VhAXK6XJUnMaTzIEIPRmkE0hItL3oVRCHvxV2LkBIgUlHGpdrrn+Ek8q7tz3U4zVD4eWoOpVQgWK/IAKSVghpm/b2/0LaCnBN8DoDjP/ooQZOjfLZ2I3tgMhh98qvHh6gyF4Vk5prYohvSG9AzAq7UrGK2txomsZjU+HWjZ2qp1Lnts7nroY893QQ6W9A+gs095E2b6adQn8Pey9JMiwSrzvx2jf3yiGntR27eezec0abgO5FtUrT3Xfva7Fou0Lraxny7S3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(10070799003)(261102123227099003)(10067099003)(261021121427099003)(261021135927099003)(56012099006)(11063799006)(5023799004)(261021123027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261022075727099003)(261009223027099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xecfMj5v/k1QC/H0HJaXBedSvBCQqNVYAu7fQZbwq/KjBXmFLsXd706veWfP?=
 =?us-ascii?Q?7ogma+AANX9iRqpmaWrj0exvrc3Z+M3wzTHwtkUefO3R/j6RRF5DBHRJZnVB?=
 =?us-ascii?Q?/nNp+446R61Su8agsnCcs2egjJ3NCcElmWgBNFRm9axe1h5sEk3HRgWEoI7g?=
 =?us-ascii?Q?6KXiadKouMQFYZKaby6lHii5GsxIP69DwBB4zqWitgq+Ran8KTy5A8hP1OC/?=
 =?us-ascii?Q?gTEyysoakUiox0JOtripfJmhCCeukI0KdCp7Fj1p8jadWURDN1HQztXlB/ID?=
 =?us-ascii?Q?fdttUYA0uf+7NB7ciesvUD2Sm5d4pLdGD2vPWqgoC/c+DfsDzQbLgLKJQEXg?=
 =?us-ascii?Q?NNQFERBlK6wfBWLFK+0iYfnkGDA3bOiIOGNNYl8EARM9bkrZdhr1EzxBybdk?=
 =?us-ascii?Q?MBoiobAgIDJujNw/kPhn3i8lC2rCvsNwWn1TLroLMP5H8AUI+cr0d+8W7gle?=
 =?us-ascii?Q?r2Dwr/ym7RaA8gdDoaJblo9rjJIH3W1TG3rVQTpYbrroyB2LxrewrNnrb/Tx?=
 =?us-ascii?Q?wVpgLfhq2CIQdwgwogU6UsFyRRLk0baSBAgATzgQd7WpdNaiP0hj0TlD3H+D?=
 =?us-ascii?Q?XjtxlM8HhpnRUbwGpokLPBBOivdVPVw3lwVEN5LrXs44sZ4s7robP+8opCn9?=
 =?us-ascii?Q?Lu7NvJF8BYMNo1ZsUasCYibrBwysXiHHpBFtQkt+EDY0w9fSappqKRBrSCGn?=
 =?us-ascii?Q?UK28Ri4T0CFE9DmMbeSpeRKg8JTyXL4ORvJP1W3uOD4rXTd8ukPgP/aA6SET?=
 =?us-ascii?Q?eyBsc0tzHHrGCc9C3vfemgnKYI1/2p7CGubYzvb8UVSxlEevrF3122oFbvhO?=
 =?us-ascii?Q?BAPpONI+iduysmqt9J1jeqiRmchcjKWz7YnnRYg0y/D1AePLqRAtJ/qYO9NN?=
 =?us-ascii?Q?bfZnRv7S3k6WnNKaawIw1EVqx1pdkcb2+NjxMpztxAUSb0jhHT47ivVQRtWY?=
 =?us-ascii?Q?qYDE5RmJWb+1ZMkc6uegwhz5K5vAWtTGpJucir0Tn76v3DBpSEaRozW2Ea6c?=
 =?us-ascii?Q?K33+4BaWrndCeW42a8yTq6xkVTg0QQ7N+tpAWvLPgP2mgeKWGjJxddaaj9Ci?=
 =?us-ascii?Q?SekvuPUMf/E8ggF1j1bdwmnBMSe+gbnDV7qq5KykJQzi6Tr889EaMuabSFwh?=
 =?us-ascii?Q?LYqIW9rXgjyPqMlH9rbnWGPT6UDjZd8PNhFq22gpvY81gj4ZFaCE4AZ/RTve?=
 =?us-ascii?Q?RdIKyR/oQceny9cks+CHSSFnu2JkdI2PTandAZrtjAAogoV9xajBdDVbfSVl?=
 =?us-ascii?Q?y8S07Q5jsfN+oDm6fO0Q6nHhC/ZXv1gwbNcRn/BYX0c07Es4RancYv/dGyLc?=
 =?us-ascii?Q?gRtwu80GyTKqwZHjo7BzzNVyyZ/cBRN30cj2g5zzM3BD9XTobGxhwl9BeoPh?=
 =?us-ascii?Q?L9nqwnUtBwJBkGxhxXpaE8wAM1k0YQd204WryJOM2jEC4fXm2J2x6CVG8nQo?=
 =?us-ascii?Q?c4zMcUQHcXoEnjCGpAVipvw6CXD8AExCmzVEpK+SXx1EwZtsXx9eIjgj/f8+?=
 =?us-ascii?Q?2JZB8nB+vEuey0SAT45KND6bZcVlQCzgLhK/MfTMdSkVCYZtpUrI78bJ453h?=
 =?us-ascii?Q?rg9mg+84/qS5wdEIEyg1Gj2ititlocV6j3CoSDEmSQLofX29+YlFuQlPasw+?=
 =?us-ascii?Q?b3Y1O+58HL6LaW9nIjTLNzuChFgeXXB2CtSaRnXZRB9WODGnPsOmNA+VJrro?=
 =?us-ascii?Q?IVYa+jsv8EstgYzBRyHe40QghfmDe7HTb8YPk9TrV733Fn6vWzUuVQ9CueEi?=
 =?us-ascii?Q?+SAMq6cve+Wu/Jfh5uFgOoxOvsr1HnRjOsdMLZyzIYF9Xy6cEZ/gUK17ngpf?=
X-MS-Exchange-AntiSpam-MessageData-1: UWRqX5ndERZKcA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8c6600-fa14-4a44-71cf-08df45ced70c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:51:18.4530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z300bhS8Z9UqWGcFRDzGS7sfqa4/XPy84EYnQW6Gh7OGQxRJ68UXNXxcZgWp1mntUe7ztbJp7VYgLLivNoZ6/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB456611

Like many other drivers, the software TSO path (enetc_map_tx_tso_buffs())
copies the L2+L3+L4 headers of the skb into a fixed-size TSO_HEADER_SIZE
(256 byte) slot of the per-ring dma_alloc_coherent() header area,
without checking that they fit.

Sashiko casually points out during review of an unrelated patch:
https://lore.kernel.org/netdev/179294166520.3134.18097439321876673016@kernel.org/
that TSO_HEADER_SIZE does not constitute the maximum size that packet
headers can have for GSO skbs, but rather, an essentially arbitrary
number.

An example where headers can exceed TSO_HEADER_SIZE is with an IPv6
extension named Segment Routing Header, set through setsockopt(IPV6_RTHDR),
with a type 4 routing header. With 11 or more segments, the headers of a
TCP/IPv6 packet exceed 256 bytes:

  Ethernet                14
  IPv6                    40
  SRH, 12 segments        8 + 12 * 16 = 200
  TCP (with timestamps)   32
                          ---
                          286  (30 bytes too many)

No privileges are required to request this socket option (but it will
cause driver writes outside allocated memory). A reproducer sketch can
be found at:
https://gist.github.com/vladimiroltean/7cecf636b788b29f361a2fbdae646010

Bizarrely, enetc is the only affected driver, because the core
accidentally protects most other drivers against this bug in
gso_features_check(). There, we have this logic that saves the day:

	/* NETIF_F_IPV6_CSUM does not support IPv6 extension headers,
	 * so neither does TSO that depends on it.
	 */
	if (features & NETIF_F_IPV6_CSUM &&
	    skb_has_ipv6_extension_hdr(skb))
		features &= ~(NETIF_F_IPV6_CSUM | NETIF_F_TSO6 | NETIF_F_GSO_UDP_L4);

enetc is the outlier because it only advertises the more complete
NETIF_F_HW_CSUM, so for it, this fixup does not clear the NETIF_F_TSO6
and NETIF_F_GSO_UDP_L4 bits.

[ astute reviewers may ask: what if we disable NETIF_F_IPV6_CSUM at
  runtime, via ethtool -k, so as to bypass this fixup, don't we make
  all drivers vulnerable?
  No, because netdev_fix_features() will trigger the code path which
  also prints "Dropping TSO6 features since no CSUM feature.\n".
  So TSO skbs will now be segmented in the stack. ]

Surveying every driver that uses TSO_HEADER_SIZE:

 Driver  | TSO6 | Checksum feature    | Core guard fires? | Verdict
 ---------------|---------------------|-------------------|---------
 enetc   | yes  | NETIF_F_HW_CSUM     | no                | vulnerable
 bnxt    | yes  | NETIF_F_IPV6_CSUM   | yes               | safe
 nicvf   | yes  | NETIF_F_IPV6_CSUM   | yes               | safe
 otx2    | yes  | NETIF_F_IPV6_CSUM   | yes               | safe
 fec     | no   | NETIF_F_IPV6_CSUM   | n/a               | safe
 mvneta  | no   | NETIF_F_IPV6_CSUM   | n/a               | safe
 mvpp2   | no   | NETIF_F_IPV6_CSUM   | n/a               | safe
 mv643xx | no   | NETIF_F_IP_CSUM     | n/a               | safe
 dpaa2   | no   | NETIF_F_IPV6_CSUM   | n/a               | safe (*)

(*) dpaa2 also uses a fixed-size kmalloc(TSO_HEADER_SIZE) per segment,
so the identical overflow would apply if it ever gained NETIF_F_TSO6.

The above survey is what influenced the decision to make a localized
patch in enetc_features_check() rather than create a huge disturbance in
the core, even though, IMO, TSO_HEADER_SIZE is a huge foot gun.

Note that the LSO path (enetc_lso_map_hdr()) also copies the header into
the tso_headers buffers for a reason I don't quite understand. However,
I've excluded it from the discussion because when the GSO header size
grows to weird sizes, it never gets anywhere near TSO_HEADER_SIZE before
hardware stops being able to support this offload. There's an earlier
limit at ENETC_TX_CSUM_MAX_L4_OFFSET at which it stops being able to
perform HW TX checksumming (a dependency feature).

Fixes: fb8629e2cbfc ("net: enetc: add support for software TSO")
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2:
- drop word "super" from "GSO super-skb"
- subtract VLAN_HLEN from maximum permissible GSO header size
- stop blaming LSO
---
 drivers/net/ethernet/freescale/enetc/enetc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 6cc519eea5bd..2bc65cf6f508 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -1138,7 +1138,19 @@ netdev_features_t enetc_features_check(struct sk_buff *skb,
 		return features;
 	}
 
-	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
+	if (!skb_is_gso(skb))
+		return features;
+
+	/* In case NETIF_F_HW_VLAN_CTAG_TX is disabled, validate_xmit_vlan()
+	 * has not yet run and a VLAN may still be in the hwaccel area, so we
+	 * need to be one step ahead
+	 */
+	if (enetc_lso_get_hdr_len(skb) > TSO_HEADER_SIZE - VLAN_HLEN) {
+		features &= ~NETIF_F_GSO_MASK;
+		return features;
+	}
+
+	if (enetc_skb_uses_lso(priv, skb))
 		return features;
 
 	if (enetc_tso_count_descs(skb) >= priv->tx_bd_count)
-- 
2.53.0

