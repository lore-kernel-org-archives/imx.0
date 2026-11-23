Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795422442;
	b=3MY8QMbshXzoLx+FuNPeNaQOK7DrkQYpzjRQkSV2RFDxgssKvPfHCjmUhJJej8SsS/aE
	 eWKaQGlrmyuTjAwXAF4fTvlJoKFYoYDCQ4vTJJcAHHj7kOwkxdCwu6VY6/DzEODHZ0Nqa
	 rbh/AciTxT1HNfRDkoZXYMQrxIuSEqPyOOcE6f1qSUZLsdK6c+mZbCzRYFqNZ4VZJnQ1b
	 hbmwDyz/4mFMl3b8cFK/b4sfOs7Vl89t2dAWhjkB7c1rGQaWDJx3Zly0Y9PAMh39JBLrH
	 EkEQv+0KqeZH7oEieEWIZz/nBQ/fOA831RvlNUBsbdpif3fTHMRmGn/XGBIIydbqAQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422442;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FEE61YHD/cFyk2i+i5YuWEYx3pC1yDMwnSnZc4B5KIg=;
	b=26nN/agc2ovOWdnka3Go4sPe+mO2xc801+mHM2d4tvaRJMdP7YYXmyyDz5hygzSXYxje
	 1dHwpO8D2Uz7gG9f7Z/qqmR2Y7Gv4CYVs4iHFCQNForyYgKq/qsUrI8uI/fUgiMujrJC0
	 pUUB5zaDrzRYhhoEWv7vOZtq98EeZIkl7xsHkB67PAJJ24wvoejYx81wYSyy7/Sm2nbNY
	 SQ5dLXHJhtXi2d1RPPVASAh2JI2hTh6LeDBP2iG8xDW23PDGOtKIeLKqtp3F+t8lHHs5G
	 y/B5TGkjG+s8Au9CA8XvDB4bPZ9lyyOfTCe/mlYrmV1O7Jx6Hkc8wDJnLOQBExWBE4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ReIJCCkc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.51
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C671606A31A
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 08:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C671606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ReIJCCkc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdseApgm/ScPfkiOBH/xsfjqCj3dUJ3NQMvIdv4y55N3IffztDGsuKYDKk/quBEEv8e9Xux8eB12YEmHkKX5CTzCZ7KbE94UIJqAS9kihdRflKhHFQ5zndpwgj0mIWHzMFZQ9hlAxWJR/4f0y0wN1yz25hL8aIqqu0+2erKXcT9P30qCmn90+ccVvyb+tHlahYmdMNJfbnaYbX+5pqEebU59aT1D7hereg+Qmg6O3HwPxzPL2kdJBPAqsMpuZ7rszSIO7BB8JNm8fVQIJSsfEqAhlKetlc5oFVziMAKRzzfPLDw+IWfxSzs8s17phn3Y8uHciL9dM6SZZmfk4wHImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEE61YHD/cFyk2i+i5YuWEYx3pC1yDMwnSnZc4B5KIg=;
 b=O3ZyRGz2gxUgNQisCyc1lWq3PiyRkVkxPma9Fhr0H8xJrJiXO+uHeNrgLCKbjcSlf9VW/RTOUqlXL5GBKXg+ONjJ21lRRaFVIMdHOm02wALjq1NYg+GSCdLu4JioEZ0m3UCvNXNo6mKqbl9IM85AupQ71rZVncXcIwM3iYW9iHbDT4ue39Vyug11mp25gTkTleTA4RQGM0KjPVPWk37UQMkWfKwVQUXv3Oh8z1386KXK+sKKI4x8/bYloBuHeezaH8O3eW0ircB4eZrZJibirfab8t+awMelcLWyJ71U0/dKNwAP9GTVxpxS8OXV3HK/4ZAxC8G/3kvGpfpH+cdrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEE61YHD/cFyk2i+i5YuWEYx3pC1yDMwnSnZc4B5KIg=;
 b=ReIJCCkcqNM2PWLjIfYNQzZcgkFMvQGwi+s5f9KxQuNrGHqfKRB5FZsrzFgT/JJkDci0HF2x35tSVbj6YhZOYfm4eCHI4pQVR3nuwClQYTOM3iWVpyvXgDqcLFfDGcYIMOdUY/nl2nGwlYTWyraPIGG1Px7pYX5SF3pyiZ3y2yD99gFxVBcgb9ah9bM5SVT0XHmtxbZZeoNXVKn2GCIKRKxJRwyTGzOIyeVhEnugDF12CXXXMb8BxHtHEOXf6mu2dsL73aYSDnmkmEKVuIcoQYZ545BhtWQBj/rvfnRRJ+Xj8GhIH4F0q5dp1NJ2lePBveRd2yPHhhb0haanWd4wCA==
Received: from ZR6PR04MB587880.eurprd04.prod.outlook.com
 (2603:10a6:910:e5::15) by PA1PR04MB10553.eurprd04.prod.outlook.com
 (2603:10a6:102:485::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 08:27:18 +0000
Received: from ZR6PR04MB587880.eurprd04.prod.outlook.com
 ([fe80::2452:9c28:cc23:daeb]) by ZR6PR04MB587880.eurprd04.prod.outlook.com
 ([fe80::2452:9c28:cc23:daeb%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 08:27:18 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>,
	Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frieder Schrempf <frieder@fris.de>, Eric Dumazet <edumazet@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>
Subject: RE: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
Thread-Topic: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
Thread-Index: AQHdd0jl8HLbTNjMdEeL30hzzKyHorczpBEggAACg4CAB7LUgIAAACmw
Date: Mon, 23 Nov 2026 08:27:17 +0000
Message-ID:
 <ZR6PR04MB587880C621FA515D4A0F0A7E94F3452@ZR6PR04MB587880.eurprd04.prod.outlook.com>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
 <ZR6PR04MB5878801865D14143CC9622B73CF37A2@ZR6PR04MB587880.eurprd04.prod.outlook.com>
 <f0538c2e-873a-4522-9883-c28113efb0bb@kontron.de>
 <c0d303e2-cbb2-40aa-97b2-c0ec6d493cde@kontron.de>
In-Reply-To: <c0d303e2-cbb2-40aa-97b2-c0ec6d493cde@kontron.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR6PR04MB587880:EE_|PA1PR04MB10553:EE_
x-ms-office365-filtering-correlation-id: 8e125569-5925-4383-d971-08df493b961a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|261028144727099003|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261021133027099003|261021135927099003|261021130227099003|261021121427099003|261022115727099003|261022113327099003|261021123027099003|261022075727099003|261022105027099003|261102123227099003|38070700021|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003|261009223027099003|4133799003;
x-microsoft-antispam-message-info:
 k5A3hEYruSTd2IOfGUO43qKkybSiz3nL61p59L4AYPC1iNzuJAzEYyFO35v2/K+A/W006TLGCUeQMgG569TXvIRaSocE8OG12iAfkurQ6ZzJ3DGTVRFV1/958JEppnTUwUdu2HYWFIrzGly76niS1Khnavzp6eT4aAqWeXrH2cDXucAeRT2EhHo+dzQC8Fq1s5txa7sVpLyKxFLhv6xT6MHBCwTTHl7nyTlLfgBszCqSuCltYf80F+cLiUArLYBbrot50xrRXvDwVgVVtn2Y9tKq8BMN6GO3MM6dafIKoHfWrcfJEArsvzq5VfSQacwoKMH1dglbQ69fBbYQOGH9saaPzt+LyITcbsCV0M5yz6odXWi3b1SWwLISdPWhDSpYXL8/rMD6zQi1VnYNvcdk3azArhhdNYBHdMIfR3jXX5ByqvzQEsoml4tpVSyQN7jFWjoUlYFMgcok1S5eywHfwnQBPd3gFKKTzwRnWOjfgs0BFc+n3Ea61p87wVUmoBLKfWqKSJgg8kMY0GMVH6SKfYXAEWZpECX6su4Eb9hlDHqdWBJMrZ/0BOVLWivNNRIOMc4JJywzr6nTQLmtmQCSmnUygfEvmqoq4ThmiJnnHEvWwd/U3Lxnuy3pUbEJICZfLmLMzC5ZEPy0tQq0bcAN/zSD05vhXtPvU6y+Fdmz4e6ZeVJhC5Ayd7/O9UGcbGDvxbu0bkjAevtkDGJ3Glq8rczpP0tckiH4X79qCF6dJhQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR04MB587880.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(261028144727099003)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261021133027099003)(261021135927099003)(261021130227099003)(261021121427099003)(261022115727099003)(261022113327099003)(261021123027099003)(261022075727099003)(261022105027099003)(261102123227099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CTRlR0G77YvzM4y5qzYtLCWnaBmagHnoSu0NfLyOyW22n6t0qBYblYXG6yrW?=
 =?us-ascii?Q?V0HHxF6WY1k2Xfz/YVTX1ts4fqw7L8nzo2dbTlHu6Lg8zuZTXDtBwlkxn7xb?=
 =?us-ascii?Q?29K/78d9OsFEMZecZKNPmfdgQ8ynTho9ISyoDImgoaYoiKAZ+1jEkkifYiHH?=
 =?us-ascii?Q?VPup3h5078tjEc2DHzDpOfMr+9Si9wbkgGz9yvxKEH46vNLJRhy0vIKTlq6F?=
 =?us-ascii?Q?lcRDONwzzxlRw57p5ZSMFM0iMdbrOgW7qSBLuQklEH+sVfVTjVc4EqoDivM/?=
 =?us-ascii?Q?tQ0o2Q31JTbpsw5/E9vcuM7PgJ07PLtORjeiW/ozHDdw35VxGJku5VUvHKoS?=
 =?us-ascii?Q?p1p96Oru3A2pzcKGig81eQXeWJkVxQPMTYol7mXq9IcbNZZhKKvc4EqW2jHI?=
 =?us-ascii?Q?eQXTecWfCZHtqZyyKzO+oRvS9rMTEcUvni5GhKKjHVOzdIBOUaEfeHPNfH3I?=
 =?us-ascii?Q?C5vPBeb5QiYMYJLeMqT+6E/WhlWe2YsG1GrQ+JFhd5TYXI/EhKaEV6BE3ql7?=
 =?us-ascii?Q?cF8bG7KIsugU4g+yajJikbBayUfqh9ffXVmOFxn2BfV6xa+A5HxIKRVFb2cQ?=
 =?us-ascii?Q?nCOhTd0FlwmXlkt2h8k688DqwGVBMp4NcvDdEP0RRQCOLpWeY06MjVoc1iMp?=
 =?us-ascii?Q?xuLUGViLxd+Kxl79h+3du7qyAsIEypSuYhKoIXCjU9Cg0cBAeBh74gwEwWn7?=
 =?us-ascii?Q?U2mm3F9MrVCpieZ3prP4GV7ukIKqjmevLr+ftL5GJkm0Xt31KIE97NVc3+AJ?=
 =?us-ascii?Q?VHzJdep5Pv2P8rG0C4Fn7pz8R3rKqf7CbWcCwIv9drnj4WAWHhd5y96a9jrl?=
 =?us-ascii?Q?2B67eKG04iGkIcS5E7ZUKqYM3mxSpQZe2cgNyhvnV56X7oxY1NcYhCfCTicm?=
 =?us-ascii?Q?LHRbkpNFjeJj0pxW664SjNhesmEq+77MRRSlRtUfL3et3pCoCuN2hg6xgX09?=
 =?us-ascii?Q?AXydSvWnE8iuV/OJ6oi3z698iPEUmxkCjBfp7/bUP4dRqEnuK9v3SHg6KBDI?=
 =?us-ascii?Q?nt0MFymmI37utjtz74a+7BMcdE+ywOcsloXxhcQEseaDALknLaEkY8UxpGQG?=
 =?us-ascii?Q?Vvs1zmuUZ/RSZZfMFKGi1LkSEUUL0MraYfjkqgmIuudJhrQpGGja4aPSb8mr?=
 =?us-ascii?Q?LTJQqvxsweWvk+jQCOCUuGAByt6t31p7xuqpDu0iyoeWRqYFi1exMEn/9hgB?=
 =?us-ascii?Q?zdILuzkhpVGG6iUsbUczMRq38kABBVkNx7vodLGlUttHJJr2JhybcWlBcEjt?=
 =?us-ascii?Q?goF6t+h3Ji3nu5f93G94Y5YvZO35O/uqaDQ97+h8WsXsaXcWYW9PlEEhnpOG?=
 =?us-ascii?Q?pU9xTtscp9QJ2/fBcHKjzKDgvbLxnwZrp1w8fEXGvcZF8oLsnYYvxeFWdcSu?=
 =?us-ascii?Q?5YYfbxMA0jAVlbsDU/503fHscJLGnawuRGTr4iQC88V6mYcv55f6ky+PSTt4?=
 =?us-ascii?Q?wbkxApfjhwkTijsSiUvDvsRVZ7FtdPOujn4LJ09Jpj6p04QZdg1tX/2QiC80?=
 =?us-ascii?Q?/3P3sudxMkeadPi8JCZEUJk4RycgoIhfx6bXKfDesIExB4L/Pcl9Z7tIDd9e?=
 =?us-ascii?Q?VwkMb3I134XfloL4XJnHf9MOcyP6vc8/RhMMfHsi2QCyZWVuNQl8aqFgV0Mu?=
 =?us-ascii?Q?EieWEgJkbgozTSHRh2MI/qP3u8uhpg70sFsedRyNDp9N6MasZ4CoF6EW2o77?=
 =?us-ascii?Q?LGoE7VCpGqLb6rV27wnLXO0A5PYhVUukjniqdvePlh2jVVG8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR04MB587880.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e125569-5925-4383-d971-08df493b961a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 08:27:17.9531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gLKLhP8yGKvLPCLswtSgbMbKX9eqwqTI9s/pt42ThZeN89paoslvnqHAL86SCyK1zgWMoWHNjnL8PwYwrRpd0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10553

=20
> On 18.11.26 11:50, Frieder Schrempf wrote:
> > On 18.11.26 11:43, Clark Wang wrote:
> >> [Sie erhalten nicht h?ufig E-Mails von xiaoning.wang@nxp.com. Weitere
> >> Informationen, warum dies wichtig ist, finden Sie unter
> >> https://aka.ms/LearnAboutSenderIdentification ]
> >>
> >>> Subject: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
> >>>
> >>> This adds support for the NETC Ethernet controller on the i.MX952 SoC=
.
> >>>
> >>> i.MX952 has two ENETC instances (IP revision 4.6), each on its own PC=
Ie bus.
> >>> ENETC0 shares bus 0 with the NETC timer and the central EMDIO,
> >>> ENETC1 sits alone on bus 1. The NETC system clock runs at 133 MHz,
> >>> compared to
> >>> 333 MHz on i.MX95.
> >>>
> >>> The patches are ported from NXP's lf-6.18.y vendor kernel. The
> >>> device tree changes for imx952.dtsi and the i.MX952 EVK will be sent
> >>> separately to the i.MX tree.
> >>>
> >>> Tested on the i.MX952 EVK with ENETC0 (RGMII): the link works,
> >>> hardware timestamping is available and the PHC runs at the correct
> >>> rate. ENETC1 is untested as it needs an add-on board.
> >>>
> >>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>> ---
> >>> Clark Wang (2):
> >>>       net: enetc: netc_blk_ctrl: add i.MX952 support
> >>>       ptp: netc: use 133 MHz system clock on i.MX952
> >>>
> >>> Frieder Schrempf (1):
> >>>       dt-bindings: net: nxp,netc-blk-ctrl: add i.MX952 compatible
> >>>
> >>> Wei Fang (1):
> >>>       net: enetc: add i.MX952 ENETC support
> >>>
> >>>  .../devicetree/bindings/net/nxp,netc-blk-ctrl.yaml |  1 +
> >>>  drivers/net/ethernet/freescale/enetc/enetc.c       | 23 +++++++
> >>>  .../net/ethernet/freescale/enetc/enetc_ethtool.c   |  1 +
> >>>  drivers/net/ethernet/freescale/enetc/enetc_hw.h    |  2 +
> >>>  .../net/ethernet/freescale/enetc/netc_blk_ctrl.c   | 73
> >>> ++++++++++++++++++++++
> >>>  drivers/ptp/ptp_netc.c                             |  7 ++-
> >>>  6 files changed, 106 insertions(+), 1 deletion(-)
> >>> ---
> >>> base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
> >>> change-id: 20261118-imx952-enetc-bd2bc331e1b5
> >>>
> >>> Best regards,
> >>> --
> >>> Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> Hi Frieder,
> >>
> >> I have sent the V1 patchset for imx952, will sent V2 this week.
> >> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flo=
r
> >> e.kernel.org%2Fall%2F20261104092217.1730351-1-
> xiaoning.wang%40oss.nxp
> >> .com%2F&data=3D05%7C02%7Cxiaoning.wang%40nxp.com%7C85a220fadf4b48
> 423ef9
> >>
> 08df493b2552%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639310
> 19050
> >>
> 8190342%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
> LjAuM
> >>
> DAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%
> 7C&
> >>
> sdata=3DSCTc0WUethsGway%2F9XKO0wp7JYVi%2F%2FoGhrXJAJzABUo%3D&reser
> ved=3D0
> >
> > Thanks! I totally missed your series when I was searching for it.
> >
> > Please ignore this series and sorry for the additional noise.
>=20
> Did you already send the v2? If not, please put me on Cc once you do as I=
'm
> currently not subscribed to the netdev list.
>=20
> Thanks!

Sorry, I haven't sent it yet. I saw the new comment Andrew left on your pat=
chset. I'm making edits on V2.
V2 will be sent after the revisions, and I will CC you then.

Thanks!

Best Regards,
Clark Wang

