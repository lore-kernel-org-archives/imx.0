Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774575;
	b=tfFltAbMrKW/bjcd8NcsOC8A0m+CWrDjgp6iD5H1GpL50OtLHGeYAjd8DojUkaZ6to/a
	 Qwhn5PgwZQG1pU60K9tZuwFRn0DmpSLmNeCDZIlbQt5kcFZkbnG9Kac8Q8Kj/AkgwAQ3/
	 0llukZy5vvIGTrz6piOF5fsE6F3Xn4V0OeDvpF7l4IAFjeSmm20ozcsfXUCsXvwJQPpZa
	 T+yeZhFhBo7b0CK39dy59WsaRM2ClfmLuUDDA3woWfOFSpWUpC3SYmpQra7jm7Odj2nVT
	 0jeX3mMXRk/LxIfllbK25snY3VQdMhtfJX9ol8mWW8G6FSvZ1iQTTTdrnIgPW/Uy3qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774575;
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
	bh=RtZ0i5zLy7utxeWYDldraHCZfz/GMktLQsNcQFRLD3c=;
	b=xfQDU4KvyBEy0Ty3IJ93jWMELZWfln15Hacvx5r9wAiPnZ7+4vBybxk4KhTDftgESTY/
	 EKIL6AoyaEM1MFzhcGjczN3qU/7ptK5WcOJieycJaCaBY+OMQqkFu2t43a4l3rdAvAal/
	 oJr552MOLozJ6DcejbOrxKpCKPtehMIh+1wv2XCFXdG98qz3H8dULlwTlK3XBHZ3NQF20
	 opnOMeMPVufzAbHpBxxI6m9g2Bv9c1LjZwc39tP7kPcEnlcYNdGFT1uQ+gAzG4c3Izu5s
	 t+Y5/Mig0Bpw8+8E4AmzrtqEt3od0zAWcApZzoSAaeLt9atZj8StjBkaMRwwaF7IjVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Al49PLRz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.54
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FF3606A331
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 10:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FF3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Al49PLRz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ty6myeAen9EzQQEtV/BUer85Hgtb0JLiMV8eK52vP2KHI1Zoih+lNIJDEopUQA4f5HwOSveYwLiwy72hNFiu8mq7R3NtnlVNIkSBeR1dPr3TntmihYq1PvSVAuPeobX414blzo5IoiEDoKkdldvLbw/UUveRyFuVOdhpmaTbiD7qWRdVzbchihi3Vs0iiSgJm1EDJ2BFKbqqw42Hrr6X0+FFddqLchebrRmeH4KViEEJgVLg1J13yy4FQDyOKLpASv1tE/93wtb1cTLeEynPr7+i+4tWjpRYvBg3WwAuA57svAa12G70G4dgR0qE1Y1CAP4V0e0p+4uua6QBRZXnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtZ0i5zLy7utxeWYDldraHCZfz/GMktLQsNcQFRLD3c=;
 b=RExVtx0PGq8/wfyiOvNg094yjGk3oWx/oRix3NKw4Sxs6REVP0VN9FyJLSro/dB76l3g7Xv8hWf1kV3Vy1amMI+KZ3T7CNTQG6+yblRQ8VlC2lmwtMq583pEzEFjBeHoDMptKQYHqsFKGO0m7s6ZhQHdjH1gtRlpz+T14zXa+Weah/m7WvoG0/mipbyLQjjA/83d31Td69gqejr7dXxrbIuqHiFJHYXzeFF+a3iu49SzlwBnaN+8ZKpL9nAHkBCoUNrfUdo9lSGSxB3eXlhViQ7F9JZZIP2NdJn00SgSGMF5KBYEgaAm031uG5oKR1cOMxi13LEhiXIEfYN2D3U6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtZ0i5zLy7utxeWYDldraHCZfz/GMktLQsNcQFRLD3c=;
 b=Al49PLRz8rlHVpAlbPK5WIZl4V/vWLeOcRE1NEU9QloWqZd1BD/PwaO3eeWC4/qk0A1BauULN4fhjhSV7ygB5VzCBfAeKljIbVW5eA09/00NEBtB5EIhhCPtgklzBKlO+ihu0MTqGiS2CO8ESo+0Rv9TlZao0S6ObOTHwO8q6zURLEwftTsGFHMMOYVBv9o8RBBTdawec0ndXwPw3g8Qem/ItUQMUYk3k3igC9tgPpWHsvXSQL5MPLCspH+SiqTpD5UhxFM2CjaanFAuacjuoIOWbSP1e1alexTZF/tRbi3OWvRcJzkLIrdRfOYSZSIWFPYQBaYJwKnQK1wqokt6tA==
Received: from AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 by BESPR04MB12586.eurprd04.prod.outlook.com (2603:10a6:b10:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 10:16:11 +0000
Received: from AS4PR04MB9338.eurprd04.prod.outlook.com
 ([fe80::7c4c:9c56:8552:f680]) by AS4PR04MB9338.eurprd04.prod.outlook.com
 ([fe80::7c4c:9c56:8552:f680%7]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 10:16:11 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "Clark Wang (OSS)" <xiaoning.wang@oss.nxp.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Clark Wang
	<xiaoning.wang@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "Daniel Baluta (OSS)"
	<daniel.baluta@oss.nxp.com>, "frieder.schrempf@kontron.de"
	<frieder.schrempf@kontron.de>
Subject: RE: [PATCH net-next V2 2/7] net: enetc: netc-blk-ctrl: factor out
 common link MII protocol helpers
Thread-Topic: [PATCH net-next V2 2/7] net: enetc: netc-blk-ctrl: factor out
 common link MII protocol helpers
Thread-Index: AQHdflSlfR8FVt8LQEOqhxDdfsnN0rdBsXiA
Date: Fri, 27 Nov 2026 10:16:11 +0000
Message-ID:
 <AS4PR04MB9338537AFBCF3777CCE72B6D88412@AS4PR04MB9338.eurprd04.prod.outlook.com>
References: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
 <20261127094729.1061755-3-xiaoning.wang@oss.nxp.com>
In-Reply-To: <20261127094729.1061755-3-xiaoning.wang@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9338:EE_|BESPR04MB12586:EE_
x-ms-office365-filtering-correlation-id: 412b3dd5-fb68-4f9a-7b7a-08df4c6f761a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|19092799006|366016|376014|38070700021|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003;
x-microsoft-antispam-message-info:
 NKexWjJM4DMSyHh/VEHxnqWuvCBsDnLKtxzgfvMJbh9Ky4DbJuSfF6vZ85NQByVhhN/Kcp4rrZxtRWxLS/URAG2jmwjXb/NZkCGA2vUQKmXCnKQOobuCx1S0r0AWx0mxQ0G4314tMItgGJZM+qhB21TejFMdVvHkUtyl8hqRgkRz/Exaxe0Bje6Iah0WExqQtyzaBVdGKzaYHcTlGKPkadpJrT7hJIBVFjrVo0NLSBD7/eh8EwTipSGO7AE9+/aiUY27/Kde3a9JCRDOPK1qwXkdEPqXQmMv720j5vQhbYjBJaFs5NGI/FYjXuL4tfah/fNMC1oVIP+rfF1opHsgp2rypNS8jI1esMMihh/apRZR+sfm/GTaqFk6Jqm/ibvwSvm6e70tl/XdW6pS//xG1i8qF3mlhxU7k6nT2J95mTIngt8cXqvpMEzmKjxk532dEcF8xBXwL8W8N3JqszymPczQTL+VhCwUjIRBWU498gTzrXVTHk8j7bmUzlfPIBiKC8omPhgz1uV7vBlUi4v+sV2csKQOjZwKw8AxWT5LFxtTfmDCsmroLnBccR4F5sv0xjPpvojdJoAPgf3gykiAHwRFH6KAnE4JZc9dsZ4lvt/VVA0964K9MLaC/rzw8CqMAAdnVSHXTTCc3mzL+4In002lW/UHkfZJWkh5fGEvOHltiGBkHjOo2amxiLgc0kESiU79MxK7vzAGXG0Vvi9E8WZrv1fjms3Z22neiVc5a0Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9338.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(19092799006)(366016)(376014)(38070700021)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WuYxnp9DJ9G3l/pyWGKUMBtNKyqrkaDvDBB3itv7/IZYIpb4vK2ZZPXhD+ey?=
 =?us-ascii?Q?hhtytoiX4YUd/VUyfCUmO4NqWYq3pr9POJUKj//VfpFEejDzchvYMVpPOTDx?=
 =?us-ascii?Q?dMrmCGkYC9UmFpSeVtvBy6/KqxpDaZ9Noph2twwWXU6Deoi0YpCGkB7LpgdR?=
 =?us-ascii?Q?k67XmHCqQZNgZN+xl8HltWKeGCJqUJv/1nAarvQmnCeK60A2m7pey9XVQUFO?=
 =?us-ascii?Q?egFPFS034Xfu8xLnVnoX5MhEetZmNhaDtkZErd+c4Votlo/AqBfGHY5kZisA?=
 =?us-ascii?Q?Kl2txStcjdMtwv3JRNeltbb2jBwNlF+/YqRshFrOzWk75CmjoSbgSop8/Ppd?=
 =?us-ascii?Q?x5ZdXGuBwNCD2T7N7SQAXEP9CaCStbLLzDge4df7IKYxch7gMT+leJYOuPPC?=
 =?us-ascii?Q?LQLuATr2Tz084XncbTjyxMP59knlpmhbxJOUJNP5Td5Gu1XcRuva9Lt76kOy?=
 =?us-ascii?Q?CqknzCGlhYKbKmlXyp1NfuMTESNc5Dq0WyBW+N95fngmMmAf2hnJxDYkblmS?=
 =?us-ascii?Q?2aqaQMMAOd+8BBZLuweR48rQYbvFA2EVNabWplEsVU6LZ7Fkta1lHfP/2wvP?=
 =?us-ascii?Q?URtj3AJJKUJ5KzwKVIDj+Wqrx004VqXx0qAWDkQZBABIHlFopw/7k2qfKV0W?=
 =?us-ascii?Q?uoWN2EK4eZvArPWZVqmJu8AsDjj8gUDG9+2dMocM6LPJcCFIygD7OP4GYKOW?=
 =?us-ascii?Q?YSmdgLXrP3KBsJdYsQRXBh/mVImLQ+KVp4sJTkbGkCintkHsOcojcop1PRuA?=
 =?us-ascii?Q?nUwH6Ot1JMBruw9qChnYQ4r3fI22mYSNGslh7qp5vlK1TvVbJT6m6BOHDe6t?=
 =?us-ascii?Q?4ddCTU2zFJH2Tz40mxwzKybeEhv7EZou/IB1BGdquoKHbafUyTjAlPpk5gz3?=
 =?us-ascii?Q?7au6nJr6rpMIV3MbGO7PTMnHK5pl25KcqTLNfRPJkGKdfz/a2QNB/Wcmeij3?=
 =?us-ascii?Q?A6AJxQ1Q1NUP7Y2hPmZd/x0UmtnOoH4IvqyAdsXggZGwXkLWS9NGZW3Ptrcm?=
 =?us-ascii?Q?Jt1ISk+U8UIDmf5/oFjiPRt2f64itFnf5X2xBVmoru2eMm2eQZHEbV382PYJ?=
 =?us-ascii?Q?mnWzuuDg4VQdnrKcF+vLCD/VgJ+hPowEiJRxXeMGz/c51pF7oNnrqrG9qc41?=
 =?us-ascii?Q?lOP9ELBtGlc2U2V3BICE4qErkRJ1OS4Ti6TS6Qvn2wc97IAvy4TL8WYZRHzD?=
 =?us-ascii?Q?KG9AHneSnybSaBIY36aH6sV5ATjvNwNkPnRLGqkSCjYI1U5v6XBFXcEJbboq?=
 =?us-ascii?Q?AECjvMKHlRxkuPhUFiLY9R17u7zrNavS7vQpT07+ZDnfSGef2ssd2iuYTlYm?=
 =?us-ascii?Q?L+SbHpzxjETzGViL2AJteok6C9ESpg5Xc1AEKTz4m1cbZhvu6Irt72KQ3kdC?=
 =?us-ascii?Q?M9pkJwEssRDbKirw5FcTF653em9Dycph2f5dEg7AC0b0TdRr2/cUb+1WlaS7?=
 =?us-ascii?Q?+f+uWOLUQ4ERipMs7A/zyP0LzC2MlxY75qVUtnHh8YYls1KxjiRAAN7Y2aOp?=
 =?us-ascii?Q?bmF7CBdPtkfFaKf6rg/jgR9iFrw4jHYmYYNSvvw1ZMbdXuY0v8YKiVz9rXJ0?=
 =?us-ascii?Q?u2+70qF5khPMPcaXNqMLrlEbyihfMiK0svG7/3mCYLjcXkHH1h1v3R6VCur+?=
 =?us-ascii?Q?C9k00zb/MPkcMRwRm76R7mfzzwgVHQLtR3HjKoJDs38WWzs4kt+HD/uaTeaQ?=
 =?us-ascii?Q?muJ2vLUGUQ+UWDNA2QiSGsawmDQbDfbSOm8nejQAmxUNxhhR?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9338.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412b3dd5-fb68-4f9a-7b7a-08df4c6f761a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 10:16:11.5839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PFFOrcEak6Hl68nBnNZWixeRUsGVh3ZOd6SD+4Hc/iyndCGce/bpEoAXRRHFRpTmBlhrpu84cWJblyBHJbmdzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB12586

>  #define IMX95_CFG_LINK_PCS_PROT(a)	(0x8 + (a) * 4)
> @@ -78,6 +77,9 @@
>  #define IMX95_ENETC0_BUS_DEVFN		0x0
>  #define IMX95_ENETC1_BUS_DEVFN		0x40
>  #define IMX95_ENETC2_BUS_DEVFN		0x80
> +#define IMX95_ENETC0_LINK		0
> +#define IMX95_ENETC1_LINK		1
> +#define IMX95_ENETC2_LINK		2

It can be simplified as follows:
#define IMX95_ENETC_LINK(a)			(a)

Also, IMX94_ENETC0/1/2_LINK can be refined as follows:
#define IMX94_ENETC_LINK(a)			(3 + (a))

>=20
>  #define IMX94_ENETC0_BUS_DEVFN		0x100
>  #define IMX94_ENETC1_BUS_DEVFN		0x140
> @@ -95,8 +97,15 @@
>  /* Flags for different platforms */
>  #define NETC_HAS_NETCMIX		BIT(0)
>=20
> +struct netc_link {
> +	u32 bus_devfn;
> +	u8 link_id;
> +};

This only applies to ENETC links. Would it be more appropriate to
name it netc_enetc_link?

