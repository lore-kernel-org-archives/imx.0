Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795773010;
	b=EflbkppiVn07fH41j8W+EttmwG+vuuJ/uwZeN59z7GoGy31ZfkJkhKLpsOawdTOr2Qxg
	 2oPkyKUR3z3BGvwMMe+jV/Hc4wLYndKpaN36ducQET650RwRaiI9RF8NZi414qAs7EF9B
	 lyc7oI1oXtdnND599CJoZ+dZA6QL9HuW2Ed4F9/VKEPLF9BMYdX+2x93EE4lz6pWBG9RE
	 m3rObJv9eZ0p9au5RuteO0qVs4kGyoZTWFDD4a/Ro/UFJXr7u58oCUdoWdw3ez3xHSQzY
	 G4iSIjSAbRafuy0ZpGhu1jkfkZ7XAdF29G2Wrz0v+4YIETKEFgRSuWPx6TdBUm+40uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773010;
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
	bh=MHfbIvvMD8PFDKYi97t4ZMw/0mnAqILGWcDYgQ/U8tU=;
	b=NeF8HNV2GVSwGkmsBNE5sFf6lnIHp17wWNDBm0qrJwjbsWLQ5oZLiO9clIHhueEhUlmj
	 oOnlGGvw++gux/n0FScbFFG3P3vAWS1AlHsspBVif4A0/x11K56zXCIVAE/OQLDqpuaoi
	 XC78SKEougjzv4GvqoxWXYfIzN6YxDL3boKocksvnqtFXs36LYlenpLzawTTIJZen6+U1
	 glJZ9PPJupzO17zFTpC3wGqvT2ftw68bexN08273WX06qMTL0XC5hDenk/nEA1e0wmJlr
	 pVWYy17fMhD7wsPMNMoKzc4Fwgjq6BqbUXRd2lI1vnwWLmtIg911HHjnzEQuNLbXPFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=H22S5WN9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.48
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A7606A686
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E94A7606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=H22S5WN9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9tUZpbKOVyZszMuQABqIq8CatEyPMxQHyo3npDGTbx/L/NooIuhqYkyMYaRETMbt4t6msseVEF3rQXSZV/MOSKtsEbrO/1ydURtHRZZqXj0fsUOcVP/OpL7oj5nluvIxL4AUydTNC6iVviBukxVM1ExnNB3NS3ueRhLI7fjBEaJFjM/6r0FUOYEU+21MpcZ/wnPqGLCLPwzhgc3g/tJALbtlApp/RShQCHO3qKZNjkn1I5udi0dJBI0KpZ88kQ7pB9Hu4wqwfgOXcECdBwUkeFQiV1DC8CBh+xvi3KomOUXVHjdwvG2GEr2+zlSDKYzrx0ZwH+2DBw5WzlwcbKKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHfbIvvMD8PFDKYi97t4ZMw/0mnAqILGWcDYgQ/U8tU=;
 b=O3vnzU6ogXqdv5+0DUiiJwU8NskZ+zhFCrdIVpJu5mPbnbZVENkluHgAwMsRFx3XEmRCVQMV2s36THb6049WDhXtbmbleCaC/O5CVQbVQf/eEbUnTaDAiDaGLjjyRwTEQ1mIUd0p7HiqhI2/0l3O1RdxBrnNwhWbsE3/4NgP9Ffzxmma1NHyiv9aqZjlLQ65CMwp0gPS+dKRYa2u/J5rVqZBKD/3fOMKYmHsXd2JWWCsf/2C6KQhkwEOArXKJfnzup1OuEe1MSQNCEZ0DzKPzJ7EDR4otClOydenSy6QuHk8hz9vYnW9fvvKuuo5WSKfDvmDQHbR4PT9OQoYQwPkLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHfbIvvMD8PFDKYi97t4ZMw/0mnAqILGWcDYgQ/U8tU=;
 b=H22S5WN9cFkZHv6qj+vI08AcRoL4Nq6Fn4hHuCfxI/j1fXAHk8DTWGa7pttsIHnuekdCindzMLNUN/oWs95OK3gWxC0gGmfTeIVllsZvCKp3PiaBkOzu4xyWtAphYZ2qy1oei8dsZPsXu8zAxF2CLOUx5i+vADaBZF+G9/UuThuWtwjt/lbad1RkPYxnbDB7kVv3+5b6QGdJGZJtTVvBBuESkAOoXPEWB6THNrNTLa3Bz029+82iKXbFRsPvM5pTE9NqhrGwNlbDCj6vFl1MTeZksJ79YpyyK6z2LDHDvlRzRWPZ3Lh8vHcY4se43o1Hvy62x/CSt7KUowRV4TFM4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com (2603:10a6:2d0::cd)
 by GV2PR04MB586427.eurprd04.prod.outlook.com (2603:10a6:150:606::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:50:07 +0000
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd]) by BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd%7]) with mapi id 15.21.0639.012; Fri, 27 Nov 2026
 09:50:07 +0000
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
Subject: [PATCH net-next V2 5/7] net: enetc: look up VF ptp-timer from its PF device node
Date: Fri, 27 Nov 2026 17:47:27 +0800
Message-ID: <20261127094729.1061755-6-xiaoning.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
References: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To BR2PPF9D47B45B4.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BR2PPF9D47B45B4:EE_|GV2PR04MB586427:EE_
X-MS-Office365-Filtering-Correlation-Id: 088dcd11-286f-46c2-ce8a-08df4c6bd1a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|376014|23010399003|1800799024|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	m7dnhqdLQgYO9JaVBX03zE6ZxZIhlOzKD6PUsOmpDpGXuuo6IDOdy9zeIX0IPqoSYEXKVpYbsXdr+UDqxUZM3ND0iYjXMVPp1sYfYfMeX99tWag2faoyVQieq2dXvYqRvp79F9EOZ6pFN3swSZdCHz9xqgGI0L8p5UhlyL5jwejRMjS1WIlHkFlqgGfZVVhL6GuWoeDyK5BZ7wYmvz8Lv0pYy235dNSPZAwW9wAXohWp2zcAjc9A1OwTzn22PbS09mSJREYaGVyQlLasNqziofIwz+K653BtyqZtN6ZREX96PSjKiDrb2XS42aqzCzyhSm7EyjqphiuxIZX7jaGHimavniYKg6vB3rtgPVRTfNIEazNJKpBHJ2C3rENQLLAcsOUGz/OrWnzOVqkArpnkhQ3fPaZqezmGu/Av6jbWYValmSAzuSwcBuvdRXWULXAjTcoQRn7JJFExVV3EXDunw/mGNLYP4t1NhImxtrkgkjrNLeyRvTE6vRiDM5nqQMOCCgl8QZ8AsIxE75lgy61C1Be38CEhMKCnwZ3+TLke8KThFRjCg4pQfuR2aksl+25R9MfHMirjNGaCHxEy7hd0xfj/K4RRXhcaL70yVntlVzO7hg1QcrMta1vhvrDpZk+vI80AVjNHeu/IkLFFj9+lEBd7nhzh1UYsTgyOn5TReew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BR2PPF9D47B45B4.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(23010399003)(1800799024)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CtSOs6j0pxfX/wJ3N9RgKFbwsUpegGBeEIpjyxJfh6EnblRMAv2WmlWOPen9?=
 =?us-ascii?Q?rkL+FIPHQjQ9tO1L6/JH7SAONq9LbQ5TodFA/bc8Xnk7xdhzyLljrv45Kpz9?=
 =?us-ascii?Q?I02IBfrWKU1LeH3h6Up8Ovx0xlw7DKbH3wQtuizi+d5jHJ7VEni4Qo37VVlg?=
 =?us-ascii?Q?W7Cph8owo99Yxe2khQCtimvZs5JQU7prqfA9/suTCFoxWDeuyNLr87tmv1xY?=
 =?us-ascii?Q?L5DbCFAFtVShHNH16yROPAvgK7Pu6u8osdWl6zGil47PgFtRx5FzHmlkFC3K?=
 =?us-ascii?Q?1ug2Nb6MxQkw6d4CaMVMB44TkXdsFmfs9xy+r3uun7BUCX8H11I6XgcMaHZ+?=
 =?us-ascii?Q?ETzvf9IB1cvQ38KZprE3/Bj6rN1kYN3fN7815URkpS3otiGi4cqGW6KQMcXb?=
 =?us-ascii?Q?RvRfcE+YTHWtAFms1djgULbPxIWlcFaaaHA922zfUMBr1OkfLrvEyl9U+C9l?=
 =?us-ascii?Q?Yb6p+v6w8fp/eiNHSA2OGsSuMpxDhxutjkD4TnA7ZAQoIpYdZeYqvXHIenCF?=
 =?us-ascii?Q?6Ucqo21hYEUrut7kaRi/sH4XkAh5W63wAnAcpuWdMszJjzQpFMjmpx5uaUEo?=
 =?us-ascii?Q?VNHvPBQzkLBZFtRHOBltMPtURLBkb4fbspu/GBvZ3DyN0PqfgsE7m5IgwCOc?=
 =?us-ascii?Q?tdM+jH8YKITDp78arV2SSTA5an/j54QqZ24HO81yp3Ee9VgLy2CheqwfxmWu?=
 =?us-ascii?Q?HbsvI8t8p0DLxfcQzRP6an5XQiueGC8zZyE5o8bp2un0CyBfQ2a74Liapd4h?=
 =?us-ascii?Q?TPMrG1h1De+dWqT2WjoxsayReaOwCsT2SAT5hxDmqrUnxQCNLs3AmIEQK1nk?=
 =?us-ascii?Q?b1/v3PFJCrNr1j2woga0DACgBdn9Z4S2CPnC+17LPQL//oRlBvpkxhpg3kNT?=
 =?us-ascii?Q?AdIum/LRtNy+fCvtPjgwXM+S9epvtFwlINdXuXhHRcKSi6LYGCHtEvJj+WnJ?=
 =?us-ascii?Q?/RokS0Mvmtd4BQdHLoysknC9h0dR2Q8n1OuLlGao+F6gk2AGjikEBjznxm21?=
 =?us-ascii?Q?DjIEnMRXmh4GXC2VpyGil+tN+b5you60B922AnXg0ZEXeGmVb7Z34DyXNmUG?=
 =?us-ascii?Q?frLXCRYhrX0yE9b7ugFDGHvQRK6HSZ4ruXjcVB8TKHU911CECsz/owyjAay4?=
 =?us-ascii?Q?zlfEbJCvS24E+1PKWpcoQwo6Twvlnk10TPUiBm1gcCsK0psEMZC1druqpv/k?=
 =?us-ascii?Q?kjxqXh2YNHcHpA1mouc5Wm08+HDFL0u1Q/sDJN3x37rVuesRfL9pEQLgFaWV?=
 =?us-ascii?Q?dC/l1jW7jKYIKnL8o+9YPGw8DT+aUVOdnf58Hi1xE5ME6ONuQ07DB2EuSWns?=
 =?us-ascii?Q?AIHsPGyFUewMcQEYoi7rIUhvw+U/QO9sY0lTUe4UF+KKodrLoQBJ3V7A+49F?=
 =?us-ascii?Q?Ft/KvpXpEHsxj3BAJl9Zx+T3Tpsa2j3aWomRqOJOHO5AHAfCdPpmf7bPoFsk?=
 =?us-ascii?Q?UG2yPNcnecXQDYYtEln0ZMVGE2tC95rPYAC8WN3EFgWPkGHRi7N5NdwWFp/O?=
 =?us-ascii?Q?ndC7zDv5Fl5WAUmY/TQb+MiXjNesN9KMpT9NihNpfTkaM6zccjFCBWfdQ9Vo?=
 =?us-ascii?Q?Bs42ybxo8acjaW4guBx1helz2CsenqsKAkFhXTWpemc+p8kaltNNxz1cuDdT?=
 =?us-ascii?Q?ThutheucfZ/CuEJR5i1+kZq+5WMr8Iz4sIvrEP/OsC8FSW7gELndSXnQUUMT?=
 =?us-ascii?Q?Oaio7Wi4Gu0EigB9VPztunCaOJDpeNpSMm3GSRa+7EvekkCoYQofP++erFOl?=
 =?us-ascii?Q?l2IwsNRmB127U43N8KANm06bL5tjq7dPtYESWojpIkwCHk/idv94NF8W5mNf?=
X-MS-Exchange-AntiSpam-MessageData-1: zPYYr8jdUhuWzQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088dcd11-286f-46c2-ce8a-08df4c6bd1a5
X-MS-Exchange-CrossTenant-AuthSource: BR2PPF9D47B45B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:50:07.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/Qfmb7Ygp6HBKvwvIutN4L98ZyykGS+PekTDXXohKpqMynRyGQx/OeUfm8g04aHMdJ+msggqpkyYK2/5bTG4xbAPT/ebjZAikada7UlmUg4wZaqJlNEi/M8/zpktq/W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB586427

From: Clark Wang <xiaoning.wang@nxp.com>

ENETC VFs do not have their own DT nodes, so enetc_get_phc_index()
currently skips the 'ptp-timer' phandle lookup for VFs and always falls
back to enetc_get_phc_index_by_pdev(), which only searches the VF's own
PCI domain and bus.

On platforms where a PF with VFs uses a shared PTP timer on a different
PCI domain/bus via the 'ptp-timer' property (such as ENETC 1 on i.MX952),
this causes the VF to fail to find the PHC and fall back to software TX
timestamping.

Use pci_physfn() to obtain the PF's device_node so VFs inherit the
'ptp-timer' phandle configured on their PF before falling back to the
PCI bus lookup.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc_ethtool.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index 7965dfd06f5f..dd0654683b09 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -1168,7 +1168,8 @@ static int enetc_get_phc_index_by_pdev(struct enetc_si *si)
 
 static int enetc_get_phc_index(struct enetc_si *si)
 {
-	struct device_node *np = si->pdev->dev.of_node;
+	struct pci_dev *pdev = pci_physfn(si->pdev);
+	struct device_node *np = pdev->dev.of_node;
 	struct device_node *timer_np;
 	int phc_index;
 
-- 
2.43.0

