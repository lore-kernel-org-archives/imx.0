Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772999;
	b=CqF/mnz47ywTD3vhQp+Ppn5NzvPQVT6mj/u731p3EGvUzZmoVNIUw5EFIvVNCXiyyJ/T
	 ImgJ4ihqIXybVePzGd9PEzk//j71wsS5TaSfFGCRRuZ24KXQ+gRbmQXXmiQuRaHlyaLdf
	 EGOJAI1XZuW0NhGh0RoGzO9EVUznQ8P6YGVFqyEI+oK9j7rH7K59SGPXiJ43XkAcwqAgd
	 JDFVpBDT2deKrCVGoEaWrlLESnlYft1i1B8IKSh252yOIR0WrmOEXMYicKCUko/WPkYVH
	 5rcRPS892DBJrLDilXvJd0ecUlm1RYIi5BX+CYdNZYUrylKLFp8UMuL929xwRoA+oMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772999;
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
	bh=ADjAYMIT7GEIXIT6WkUwz2Yl4z4eykAanqlBO2gEWX8=;
	b=aFWrM9d0Ah5/Q/s3y9WteRlF/10am09vSSXHJdvnC/t/iKBxY6EhWcNJx1zzlU152G3T
	 yKK5Ux6pxNvSxjvJ52Q9ZZF0ZuDRsSufX4lLGsyhDtcTl0VpUKlBpCEZNcDf+WW+2pFd2
	 OkLie60+JUzhSXF4ID7P0QlJsKOgQcO1glLS4u+QkrArzdR7t77OZ7gVdRFLnER0n8fPZ
	 F9I4Kj3bYmOtvyGs+B3Zyz099YV56nnfiClg+44z2rNU8Vtmw4Bb9vRdJM0E2lcDNhks1
	 f1gP0ftKfXzCzOyXavrriMZKZj6iJW2DW7LWVPegKrQ9oBS67mu1OQFX2pxLg3d123A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EfaQn2a2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.62
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3D2606A338
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC3D2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EfaQn2a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzFhr05kr3xtd5fRIea6tHUrH/cXDPkgMolrwl2SRi26Ewdx+pdOWPKzp4pBPkaE/UhG+qUQS6OS1AGkKfDnURI2VacOTSBDze3QQqQK2t1wqRliJbY3MsHghDlfmH2EgUkS6b6Ii+oQ4G5o2eGP+Rjni3nqySq1jRRZzb9Ylqxy+jFIP9t5aJ8W4IoX2Xy5OWBn52qyP36Y5rxN7lSGEEPbVPiY/7mf2d7Qwf0bOfpuEZHWuWbF93cF33A6PW67uhSD1yEujs1lewAT+2g0H6lslzX1+asVwA95JYYeffU8lmAfBfLSYO1PfM4D01+W9kDgQuIu/xdUYCpPvlyM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADjAYMIT7GEIXIT6WkUwz2Yl4z4eykAanqlBO2gEWX8=;
 b=Doc//phYz4mFKlZBpMmdFbbDyQtSXYp93nwmkGcyY8my0gXqg9anLXSgBBQX7n1ipEBt88KItDgUzzsJuxVKvxcyJnNU7BVS2dA5Sa6xVU71mJ86Y5ZJ/bHI6/5wqp2OAJDQv03ugkp24iV8c0dbFnoMujAbe5Q/mpd+MrTehHqm1MW6jYvfsrEkfvr/0v9bYGVq5Ow/VLxVTm8bYo1smFd47sFtc8CVgWC9SY/SNy+2ZjjBh26Fdv+/E/h7HwVHtzKfONmoYls3whAGyVrKJq9p2tOpdU6me2K28cHi6R2FjH6l7IobMdwFc2VgtbNVXKxz6RvQ1/+GvrRHiuhS3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADjAYMIT7GEIXIT6WkUwz2Yl4z4eykAanqlBO2gEWX8=;
 b=EfaQn2a2FBb5rg4MG6+4FRd+7RFbP50P+1+RfAf9vDsn9TOKfStlri4MI9Hd29gDp9ail5X0p54+vL3+oONZNQ66WTVfghIcjVPTKkRel7EGj0ew/fw0JxRGVoMUl8hPr/2FZ1anVP/Z0gNm8MZoiZqrgAgMh56rZvdVo2oOdI9SxYVzmJzvWOCpS707WBVG9Q84B3z3leM9UEwVUWGibqaodKgnpu4/fpYyoEHQhNta7K/Yf+DuCcBXE3xKPx5TYaajmEt3+fewQKa9v5FL9LxVX4RW7CFESqwuC5TQLDoCHoFt8lox011DmFn+ZJMrPMBWFnTlSvRyzmvhUW9bAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com (2603:10a6:2d0::cd)
 by MI3PR04MB088318.eurprd04.prod.outlook.com (2603:10a6:290:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:49:56 +0000
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd]) by BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd%7]) with mapi id 15.21.0639.012; Fri, 27 Nov 2026
 09:49:56 +0000
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
Subject: [PATCH net-next V2 3/7] net: enetc: netc-blk-ctrl: share ENETC port MDIO PHY address config
Date: Fri, 27 Nov 2026 17:47:25 +0800
Message-ID: <20261127094729.1061755-4-xiaoning.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
References: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 BR2PPF9D47B45B4.eurprd04.prod.outlook.com (2603:10a6:2d0::cd)
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
X-MS-Office365-Filtering-Correlation-Id: 287cf763-7f93-4108-9a37-08df4c6bcb19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|7416014|56012099006|10067099003|261026140227099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	K0PU2DzQpPzeH3rOydIGrgjkS8THziEWEZc/FpixH1r3h1j+Qe37I5YIZsOQpE+Qqbs1J8GET4VJmqNVE9e+UBiF53GSXY9dAZQUfpSLoBfj7dQpGBDAbBV+ENHY8hRs/uDDNKvjxzKLlOEk6I4w2owS6EyIeRZL7gBheyWDks+Fh2Xyl/6R4ewLgdZcMZ5VlDmC900Db9nlgqu2VD6Y64fVSReLlFVJAYgwYTJuN4hkqcW40I9F5UlnbbavlWQJ1IZNYgmpz/35VB/2DArt1zEs8lcZp/o2oqsnKOttYlrwN5ZtkmX2djYNvKuAGZGcllcclKPAsilaIT/FopoK34/MMdHQHqLO1TS0M2DLWVeAWZY+IcuWkdGjaepLxE9YQk+9GK0mGfAdCxMAtn1EYNSCR4ki4GKAIW16FMdKkNHOSnsvPu5auOhsou4l0P1d5JdD4zFp2WbaaP2FDm0lUD5w7BSVj/dkPB9/PRaKzahnHrLegh9PvgvAF978UfEOIUNlsxya0OZEgYsflnUvmfRTe+IhotJbMzPDRw0VHQZhhTWtrsUHVg1hzjIPnHqb8kJKRN9uVs7M9z4rTj62QycNFoS1ioXQDO0/90Qv35TusAE8UPCeBsmGbDJ4fADxzoUt5mnHjlhAt8hRkQFdyOp9HuR9wP6LasJd+M+5PzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BR2PPF9D47B45B4.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(7416014)(56012099006)(10067099003)(261026140227099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hfBFcAnMH2FgVeSbaeYfS2aj47wvo6JYewDjE2/HfhrdYlPckmAHuPEnw6mq?=
 =?us-ascii?Q?J2fuALfXN0+7V76I3/GU0q323wlTrbQBnSTbkAYXEwmItEhS8wP1nV4w2i+D?=
 =?us-ascii?Q?hFgHv3gAqicRxYWwbIv5L8Su+ZVaoHe//VtY0Ey5gTKbhUAqoHRWGMuv/NHX?=
 =?us-ascii?Q?zHDMXLkV7p96vZ4JNsxQbEpAzVtW9EdhTV3ItUjkiumFvbb74QrdAJHsjElv?=
 =?us-ascii?Q?gYAceATcedBEyW+KTpKDzy0KBZFQxa8iYaVTn0zcYKnVpGqSurVIWA+AegTE?=
 =?us-ascii?Q?xFBHxn+MNtgHFxpzobguSxhEEXsyRPoHuxAA6FFBhZvNL7p/kQBLNydvpCAa?=
 =?us-ascii?Q?zveaACZmBYBCWu771tslTw3yZcyABAu8OjtBMceW6dXrLO/gbqVXa5VX12MY?=
 =?us-ascii?Q?YeUie+210aShc/Bw06I+C30tCCNGWbctJckNy+GPdNhIgiVNqLgZp95nCVjH?=
 =?us-ascii?Q?n5aVC33Y27SRYtqG6Q2DJymhAykW9L35LuX9e/gWjDMpN4q8hYKPk3XaUjRh?=
 =?us-ascii?Q?Pg3tiBEF8jUXEE33PJKpR111EiOAiSjG05PBCUyotCaN8J0O/ZaYJdUrogwm?=
 =?us-ascii?Q?NXm9yLzhNwm2LO2uIKMIewHPcgICXli/G1i83KZ+oQ0+fTp62m86wY2bvXzL?=
 =?us-ascii?Q?lJacZi3+rW5pfkuebJ20143WDcCrUf8tiyTwDAPY2Uf77u8PL/m3HCBQGK8u?=
 =?us-ascii?Q?WQMYgqQ/bnBQELCHWGgsXHO2SgsOPudxQq886F9dDnF8+KPkH2Lu26e+925r?=
 =?us-ascii?Q?gy4G2D57PVmofkMaLZMbyB2yT4EIoEJPQgyQ2SrJwlaRdSH+N5Bf0GiV2G0H?=
 =?us-ascii?Q?ZiA8vEvwzOwnl/4SagiNwD5Sksg23D/gRWpcWACuflgcuMl6/QkhSl+gzLok?=
 =?us-ascii?Q?DxSXrsR6o1OGRRVjVHzUYQ6iURcktDHhZsJIThDp43pvs0cgcYNLls6M8tFF?=
 =?us-ascii?Q?Hx/FPDPriVm6hxtvk/iGISFPJwqjINaBYbSo6ZTe4mT3snIvDEI8POkjvVGd?=
 =?us-ascii?Q?Z8tW5gX7HOpFmwsrAuw/zKKZJROGiQMSy0daknzn/olcCCRFNTDqAnJjLGdC?=
 =?us-ascii?Q?evXXyG7mYEFwORiWwCNq54DE6M4TqeTxwPpRoABIS2uklWILNrk4QVss1ugS?=
 =?us-ascii?Q?TIMz4AZSefoPnQKtdOo8ksTxoJ9uCSJ9chNIp+YdV24pvK+a+XctpRIKPbR8?=
 =?us-ascii?Q?64oC0SnP+DUfCYqxnVX1MJ25o0rrIOEUeGPS4BCVtYdsibuO7Zy0Puiu8hQS?=
 =?us-ascii?Q?sm3BDu0yothOMqrX0LiDDZw/76CIHoUvVHu5R9D6LyTB4VgRznRvCi6i7OqL?=
 =?us-ascii?Q?xVfr1M7Msk5q/2uSmqhhzt9wdTYjaLQhyY40zwz4FGR/7cWzW8PSpXeddNzi?=
 =?us-ascii?Q?lG8rA6NEpNDv879iJAsv3+zRdpBXPtd0MBPoXq6NA0hBsT38gc+qotShhoFV?=
 =?us-ascii?Q?e67DLox43a6RmNaiC/epaDcRlfSDvi5gJSncLgZs5kdTdRoF3/X9QUUkxYav?=
 =?us-ascii?Q?1JcO0c1fXgQZSw5xkHJE/HMOSoimyCC4zvte1gJ89mG2cWEjZRill6t6KyRK?=
 =?us-ascii?Q?/y5M1bvPMG3hvHE7TBRl1XN0L28nxRz/5vfBz1/Ad/hhcfERcNYYpqmdg6tW?=
 =?us-ascii?Q?4KfUk2PHZETOjzvpabS7gwwZCQhtcT6oOy1KpdAVnKwLWCF1yooPMYyjjt+Y?=
 =?us-ascii?Q?VXPajkQKtUi+YM0N+cHOIxIxIcqWR4hzYoodarlQ8UUuO7yD3jjyN6ZA8KmG?=
 =?us-ascii?Q?H6uPLZ6zvMIb5KuJS0+4ePspWF9ekoQJbaeOR6P+m3yDImCe3JGSYKgw3DDI?=
X-MS-Exchange-AntiSpam-MessageData-1: TsRUolXiW48WKQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287cf763-7f93-4108-9a37-08df4c6bcb19
X-MS-Exchange-CrossTenant-AuthSource: BR2PPF9D47B45B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:49:56.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uISr3jXRMM4xb7NJe9Cs4RLgRFGfg/FPqwymknm2TpTSM1m9XKZ3Hf1ZSGrI49FMm8c8m0FNnHLQmTJcPwENwjVnyTsIvRkJL8TpUuzyne/hFjJ56DnPC2o+Wr5nw3YC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB088318

From: Clark Wang <xiaoning.wang@nxp.com>

Both i.MX95 and i.MX94 duplicate the same logic to parse an ENETC node's
port MDIO PHY address, validate it against the central EMDIO PHY mask, and
program IERB_LBCR[MDIO_PHYAD_PRTAD] using a platform-specific bus/devfn
switch.

Factor out netc_enetc_mdio_phyaddr_config() using netc_of_get_link_id() to
map an ENETC node to its link ID, and add
netc_ierb_enetc_mdio_phyaddr_config() to walk ENETC nodes for platforms
that only need ENETC port MDIO PHY address setup in IERB.

This prepares for i.MX952 support, which also needs port MDIO PHY address
configuration in IERB.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 .../ethernet/freescale/enetc/netc_blk_ctrl.c  | 131 ++++++------------
 1 file changed, 42 insertions(+), 89 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
index 6f6ed66436f3..491340061b19 100644
--- a/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
+++ b/drivers/net/ethernet/freescale/enetc/netc_blk_ctrl.c
@@ -482,13 +482,47 @@ static int netc_get_emdio_phy_mask(struct device_node *np, u32 *phy_mask)
 	return 0;
 }
 
-static int imx95_enetc_mdio_phyaddr_config(struct platform_device *pdev)
+static int netc_enetc_mdio_phyaddr_config(struct netc_blk_ctrl *priv,
+					  struct device_node *np,
+					  u32 phy_mask)
+{
+	struct device *dev = &priv->pdev->dev;
+	int link_id, addr;
+
+	link_id = netc_of_get_link_id(priv, np);
+	if (link_id < 0) {
+		dev_err(dev, "Failed to get link ID\n");
+		return link_id;
+	}
+
+	addr = netc_get_phy_addr(np);
+	if (addr < 0) {
+		if (addr == -ENODEV)
+			return 0;
+
+		dev_err(dev, "Failed to get PHY address\n");
+		return addr;
+	}
+
+	if (phy_mask & BIT(addr)) {
+		dev_err(dev,
+			"Find same PHY address in EMDIO and ENETC node\n");
+		return -EINVAL;
+	}
+
+	netc_reg_write(priv->ierb, IERB_LBCR(link_id),
+		       LBCR_MDIO_PHYAD_PRTAD(addr));
+
+	return 0;
+}
+
+static int netc_ierb_enetc_mdio_phyaddr_config(struct platform_device *pdev)
 {
 	struct netc_blk_ctrl *priv = platform_get_drvdata(pdev);
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
-	int bus_devfn, addr, err;
 	u32 phy_mask = 0;
+	int err;
 
 	err = netc_get_emdio_phy_mask(np, &phy_mask);
 	if (err) {
@@ -505,43 +539,10 @@ static int imx95_enetc_mdio_phyaddr_config(struct platform_device *pdev)
 			if (!of_device_is_compatible(gchild, "pci1131,e101"))
 				continue;
 
-			bus_devfn = netc_of_pci_get_bus_devfn(gchild);
-			if (bus_devfn < 0) {
-				dev_err(dev, "Failed to get BDF number\n");
-				return bus_devfn;
-			}
-
-			addr = netc_get_phy_addr(gchild);
-			if (addr < 0) {
-				if (addr == -ENODEV)
-					continue;
-
-				dev_err(dev, "Failed to get PHY address\n");
-				return addr;
-			}
-
-			if (phy_mask & BIT(addr)) {
-				dev_err(dev,
-					"Find same PHY address in EMDIO and ENETC node\n");
-				return -EINVAL;
-			}
-
-			switch (bus_devfn) {
-			case IMX95_ENETC0_BUS_DEVFN:
-				netc_reg_write(priv->ierb, IERB_LBCR(0),
-					       LBCR_MDIO_PHYAD_PRTAD(addr));
-				break;
-			case IMX95_ENETC1_BUS_DEVFN:
-				netc_reg_write(priv->ierb, IERB_LBCR(1),
-					       LBCR_MDIO_PHYAD_PRTAD(addr));
-				break;
-			case IMX95_ENETC2_BUS_DEVFN:
-				netc_reg_write(priv->ierb, IERB_LBCR(2),
-					       LBCR_MDIO_PHYAD_PRTAD(addr));
-				break;
-			default:
-				break;
-			}
+			err = netc_enetc_mdio_phyaddr_config(priv, gchild,
+							     phy_mask);
+			if (err)
+				return err;
 		}
 	}
 
@@ -575,7 +576,7 @@ static int imx95_ierb_init(struct platform_device *pdev)
 	/* NETC TIMER */
 	netc_reg_write(priv->ierb, IERB_T0FAUXR, 7);
 
-	return imx95_enetc_mdio_phyaddr_config(pdev);
+	return netc_ierb_enetc_mdio_phyaddr_config(pdev);
 }
 
 static int imx94_get_enetc_id(struct device_node *np)
@@ -650,54 +651,6 @@ static int imx94_enetc_update_tid(struct netc_blk_ctrl *priv,
 	return 0;
 }
 
-static int imx94_enetc_mdio_phyaddr_config(struct netc_blk_ctrl *priv,
-					   struct device_node *np,
-					   u32 phy_mask)
-{
-	struct device *dev = &priv->pdev->dev;
-	int bus_devfn, addr;
-
-	bus_devfn = netc_of_pci_get_bus_devfn(np);
-	if (bus_devfn < 0) {
-		dev_err(dev, "Failed to get BDF number\n");
-		return bus_devfn;
-	}
-
-	addr = netc_get_phy_addr(np);
-	if (addr < 0) {
-		if (addr == -ENODEV)
-			return 0;
-
-		dev_err(dev, "Failed to get PHY address\n");
-		return addr;
-	}
-
-	if (phy_mask & BIT(addr)) {
-		dev_err(dev,
-			"Find same PHY address in EMDIO and ENETC node\n");
-		return -EINVAL;
-	}
-
-	switch (bus_devfn) {
-	case IMX94_ENETC0_BUS_DEVFN:
-		netc_reg_write(priv->ierb, IERB_LBCR(IMX94_ENETC0_LINK),
-			       LBCR_MDIO_PHYAD_PRTAD(addr));
-		break;
-	case IMX94_ENETC1_BUS_DEVFN:
-		netc_reg_write(priv->ierb, IERB_LBCR(IMX94_ENETC1_LINK),
-			       LBCR_MDIO_PHYAD_PRTAD(addr));
-		break;
-	case IMX94_ENETC2_BUS_DEVFN:
-		netc_reg_write(priv->ierb, IERB_LBCR(IMX94_ENETC2_LINK),
-			       LBCR_MDIO_PHYAD_PRTAD(addr));
-		break;
-	default:
-		break;
-	}
-
-	return 0;
-}
-
 static int imx94_ierb_enetc_init(struct netc_blk_ctrl *priv,
 				 struct device_node *np,
 				 u32 phy_mask)
@@ -708,7 +661,7 @@ static int imx94_ierb_enetc_init(struct netc_blk_ctrl *priv,
 	if (err)
 		return err;
 
-	return imx94_enetc_mdio_phyaddr_config(priv, np, phy_mask);
+	return netc_enetc_mdio_phyaddr_config(priv, np, phy_mask);
 }
 
 static int imx94_switch_mdio_phyaddr_config(struct netc_blk_ctrl *priv,
-- 
2.43.0

