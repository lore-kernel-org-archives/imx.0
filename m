Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.83.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794998633;
	b=38ESjIVrZYX3z1fbd60/13xGRH2NgPJ1xTOoIxMkp42xB5ERIo6Zdz1W1sG0HUt5k3IW
	 jwLQFbqDmGX4Su1GMWwU4NjwSCrT/f8NojFDCTKQMP8DjyoICAps0zIVUxxLr+b6MbkaE
	 AbWHrIiJntQ1plEzLksWAfxnyTL4o85zR4NPwdTCRbOTSxWET9QwbyBYm7WeSYnPdj1I+
	 eNYv4tTNrLOavDPW9GXKeP9U1xT0k7AVvsY+HGrFVDa2AEqsldPbJgmOEIIube4HhNijN
	 5iuOSjDAcN+2JGj6s3mIZEIolmTEyGUk674nnCC4p2+T9++CKSKzhmWASvWfCmyUwNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998633;
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
	bh=rcMtvO4h++/0NTSD7vfmLx3W8Ay/xirXMVYYdiO+gGk=;
	b=C45JqVIyMN+q3K3vInBErPhI4ctUJ2dvtx05lLrhO4nKtY5gd/5duPSn1RLXU36O3o78
	 2JcINzp0aNXUkeoRDI9gZ7qfmo9hZWqiPAabOJSWMK2C2qpi0PvsZTblofrzwgBlaq3CA
	 +3JNfFV5us1g35xdDUT/LM27S9BRnURx5uu059xtLtCbUwKp0vBUNaG+KQf44Z4j7cnYA
	 0RzjAW1Dm+s0kP4xZJJu0laDqcpILLzigFJHSCbhv1VUqEpy3cUY2Y1VtW2CW3VAo2vZ7
	 xt6qTFtou3nbDxvNJ6ld1EbhMXdhBKFZ2hwlcCl9hxax/BK1XCqc00dTdw1e7M8YOnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RsqFWiJw;
	arc=fail smtp.remote-ip=52.101.83.0
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA868606A320
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 10:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA868606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RsqFWiJw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+U0v3F6hTDTHX6POrfv7WWcL0h3Vdiqn8UXgM61JteSqo37Dcj+CbcxEIyxOuDom4NKpvLLl5lzO7cIc/FsBSQPwNmP0M7rxRGxHTG0tPQxbY1es9e6bqdEr5oLmu9ldovLMRh1r9vC8XtnjVc6SVLgRIqtJnT6WZAzDD7zSTEBign0cKyKXIUvC8OSqI89JvBciHyH4yJbMMCp/ndxlwsnTMXiMLd2W2ibma/HMRJTlImL8GYR86g2jrr5+Yj2vvRXvVNWdomrj65xGXny+AeYA0r0wp9M37nBNWotkpyKQViu7eKEM/EtILu/wBj8HcaUCS9cVLco37Ogo1aEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcMtvO4h++/0NTSD7vfmLx3W8Ay/xirXMVYYdiO+gGk=;
 b=Z/avKJ4Nw0p2k8HXws/7gngDp8d8soyOEUAouluDk9I5+488MbT8uF4AVLxIVqfuJMD4X1iVn7t4kXMg8EpHPPXMA7O3N9JoWMH5QVPeBMe5lEZaZuCE4Yqb1biuZlzxrd4bLpb5Hp1C7zA2DNTXmdxQFQQTUdcwYAncm8tyPxgQu+EJSXNrdfgCBMqPcORyFKJNtOu/v+IFyCODpMHCACssbdPNkbowkjkWgDCEyEHiZ/a3ds+mSnVSctgM/0dqiHU7HutdlRysjOQTqcbDCAZoElBJ6c/Fr16zQfkm5JSa8of7vOIkyQUzTNLOZ14UEJYrPzPWESFXJBJLxo9Zsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcMtvO4h++/0NTSD7vfmLx3W8Ay/xirXMVYYdiO+gGk=;
 b=RsqFWiJwPbB7ZN8ZOxXFPs7BbdMGZYFJZtruBk9kpYX+ggS7zf6NOnr1SZ+RMD9a3NW/1IRiRWIGhRnElBFFUYUp/NdSy1ldggOvIteLDUEybUEzOgyX3rkLKPY48TzBfu3kzJo26N+Wtt8XlTxxSHFYmLMsbmAJEUjvNFWneIOhE5l5wy2dB3EOxo9Uk3bvCEXwTjs/G9HWZ109nQTsmVoDrzvcEssAIhUlEGga4jjU+BbQgVaOtmkPpTeBXm72x8ZfyzESeRR5KyCuzIEMb57bNYcg8T4JCtGElymPXUTUZepgKHK40J9JU2yHx/3suubruqnDfxhO4zJa0Ek15A==
Received: from ZR6PR04MB587880.eurprd04.prod.outlook.com
 (2603:10a6:910:e5::15) by AMZPR04MB185575.eurprd04.prod.outlook.com
 (2603:10a6:20b:7c2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:43:49 +0000
Received: from ZR6PR04MB587880.eurprd04.prod.outlook.com
 ([fe80::2452:9c28:cc23:daeb]) by ZR6PR04MB587880.eurprd04.prod.outlook.com
 ([fe80::2452:9c28:cc23:daeb%3]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 10:43:49 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: Frieder Schrempf <frieder@fris.de>, Claudiu Manoil
	<claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang
	<wei.fang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Frieder Schrempf
	<frieder.schrempf@kontron.de>
Subject: RE: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
Thread-Topic: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
Thread-Index: AQHdd0jl8HLbTNjMdEeL30hzzKyHorczpBEg
Date: Wed, 18 Nov 2026 10:43:49 +0000
Message-ID:
 <ZR6PR04MB5878801865D14143CC9622B73CF37A2@ZR6PR04MB587880.eurprd04.prod.outlook.com>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
In-Reply-To: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR6PR04MB587880:EE_|AMZPR04MB185575:EE_
x-ms-office365-filtering-correlation-id: 08b7c207-83a5-4549-c41f-08df4560d47a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|19092799006|921020|38070700021|10067099003|261102123227099003|11063799006|56012099006|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 e1kGn5mPVm3/SUZvlwWOXUWiTfutr7LPO46GegmsJAOunZOZMvhd7nJI2DTXu8Bpn5oMFHoaJWPZKQ7yWIvMDsDzTSf7Nu0t8zpZTRvYZZ93GLF3qg5ADPDvnXITIz/wTrbCXOsv+eXKUe56vlS0rUnj/qrzBShWWulyMJp8kcUPsOhVhpbvSiQXRs4XDSDw5n/iQNfskVK88q+PLPWi1jzFoSMacs1JvNmPsFjj8jCrg2AQbDDSUHfqnl0OO8IRBybZu73dLFGKflnS52tA/BJ+4YhSWzr55a0k1I8q5QtrydVIHihAt/hHge18wNLGBBVnDQS2ysvif94dgJGqH85SD6KA4ae9Jl360OBzkZ4CA0UBjTqiV9RHVRz4EJxLefbmKVCjXUjtkTAkuBRiTCTYgbQ/XU8y/gMDQlTxO6TMiW4gYKfNSdDMJ3EiQVme/ht/BJw2b3+dMEOE+DM0TXCOqCNXBj43S9g2XHgJVzBTHz4kMOsXhubgz/xx71tpiPrEYSRw2ZGf4ahBM+JIKSuygpunG7fc97jKa9dhJKyqr78Hmdx8/r12GW4oxo3wSUJOHUUPjtamz7P1vdw/xeU5Kunyz0Y4y+iAvzJN6iPqrrHhVpCH7G55y+LMtcvtCj/h3ehwQwCyeH1FDJca+UKpsKhhoSNXV6bc8QvygrLL7ma8re3EbtznSf+nMv70
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR04MB587880.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(19092799006)(921020)(38070700021)(10067099003)(261102123227099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qQBKECRo7mx+QU2Cn1ahK1fUVow1brufpkcvmq0mPvx1NKzM0vRZ6LR17gVq?=
 =?us-ascii?Q?uGA71BakMIswGaMFThTWjERqMsznE9zLclXXZvQUw4fJv4P1yNN1EP7UTLGO?=
 =?us-ascii?Q?YfgFG50luBNRkFlbMLzOuiV5AhB8tE2xqht2OaAn8a4S76kTDjkSr7Hz8seR?=
 =?us-ascii?Q?NWjr0baK5CwYE4Z4rrRdgHfpDydHOM9bxxgkNEXmTpoz+T7VoO4F4C9D61dW?=
 =?us-ascii?Q?A4axy47AsEaHPbmzmUgM7yiZPPYbK3heVo5Sc23Jj8bLG9QFsekySmEUf9Ws?=
 =?us-ascii?Q?C511xnugWs6WlK9119bZQ6DqIemtthChXjbwUj785gjYDoloHWFUw8bYnNis?=
 =?us-ascii?Q?D4++O1do+YvP7iOIY5T68xOYFhi7PqVBQPwnpWzyNfeesFC66GT9XxxsOLOf?=
 =?us-ascii?Q?9ANb9djouqkmXa7Y9UEM/c1n8rN90nxbOpQZoz4lsOhT0atgaV10sP/vGGaF?=
 =?us-ascii?Q?oY5WgkqHrBoE0Q5UZd27wGnbQjZ/VYmLokMmzaeS6NKugSBKy0YL4w39GCKz?=
 =?us-ascii?Q?9aGgJKJxHfKQhvqaQZiabH62MpYOl5YhBQwBY/GSrt4ZeX8Qgn6qAmpxj1/1?=
 =?us-ascii?Q?YreD90L79jQvJtFLPPssozyhFPH4eAex7FSmDccUEgXisvq5uiet6JpFIxNx?=
 =?us-ascii?Q?YtIUatLGJ916aPzGm9rYPY+0FPUwPxU13A/lMrLQRjlNzGMerysTlqsDsNdd?=
 =?us-ascii?Q?1H0sJzJPXeR+u+un5Jlk1GCbyrjyzssGPXGnRnmrpg6rqnq1AjX4Cdz15sBH?=
 =?us-ascii?Q?OAieRmjRWCytLCpEQkmgrJqf/+wtrt1yxxV822fMpN9f4BlqO6gFJkDhwMf3?=
 =?us-ascii?Q?dkTh5f3O5B/0zJawJ1eD7RKLL8I49R5U7mDoSveZ2lMW415pJDxcmytVF6LT?=
 =?us-ascii?Q?HCstwVNneV8F0FG0NnEiRm5Byv9ehsadGacEmaLDCEtWC+nwZjTANFZtd0Qz?=
 =?us-ascii?Q?k5nBcLhvH/DckErj6UvmxRa3m2VRHYphlo0bwk2Ur86KVBxRJIlyvyn7Dysy?=
 =?us-ascii?Q?bnq/5UBf6I57zxWxpsqX8OQ71yjro37w1g0U9O6OEtMGXsn/KvE3rQmNP2a7?=
 =?us-ascii?Q?my3KUqi/1Qma8Y59g+j3MNuh68oma6YEk9C5JGGN7tEzR+kl6VU+0OJJLPqM?=
 =?us-ascii?Q?RYGoLQtf7pgooozv6SBRLC7Whb5QteckpZaah1PiVpn3Eoe5wuUmJpUDJ+iF?=
 =?us-ascii?Q?B797XIGePNYyWuNGGMEhdduqlvxzMYFcFbMvY80cD1IR0zfn9dB4+JDHeHSo?=
 =?us-ascii?Q?CIEGooLBUWyuUup+uuaEVdDu10SA8cvWq+k5DbW1syP0IzFIfDIin1iXj+GJ?=
 =?us-ascii?Q?uz9NmUDpoeWWYXiub96qwUqyvt7imNVa8TwC5UsUOH2yy4avHld7Tzi7nriI?=
 =?us-ascii?Q?AXf5/Uh0yJ/B2std+5kY5W7yaeOSDiu8ZVa0Oiz09afeQhEcd+ASQISAXAwi?=
 =?us-ascii?Q?wMlm3yLHtUog0egbO+hpFlWtnHb3i8xxUNUNfVhO88RE3ghND2wZACtGDRbb?=
 =?us-ascii?Q?18JdjUJcf9rQeV/CnzOt5g8SO/sBBBX8CprHLSKSw4fAdzv0BCiRMp/4xFe9?=
 =?us-ascii?Q?HY9hh/yMUTGgNlXTlPFQjtSKAP9eE6+t1IN5+e+KLNHIeWLUNzIogTC4P1zF?=
 =?us-ascii?Q?pDoFkJCljyDFBi/lawuPwuMkF4IibhAyh8XqS1fjpBIfaCJCsSTsDofKiWgu?=
 =?us-ascii?Q?kMpDr1l6oJ65bTUMmBGtV82J3ji3aIK11TOJxBLRTh+PHrBuuPbAGxJfh2XW?=
 =?us-ascii?Q?N2QYT94yew=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b7c207-83a5-4549-c41f-08df4560d47a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 10:43:49.3637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S9H5sE+FY23KIOSypfhggjouKW1X0M3kmJYkw5M2HF0hgPgl2oqu7RD237w7KQDmHE+uwgJIGcHtzNHm120BWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB185575

> Subject: [PATCH net-next 0/4] net: enetc: Add i.MX952 support
>=20
> This adds support for the NETC Ethernet controller on the i.MX952 SoC.
>=20
> i.MX952 has two ENETC instances (IP revision 4.6), each on its own PCIe b=
us.
> ENETC0 shares bus 0 with the NETC timer and the central EMDIO,
> ENETC1 sits alone on bus 1. The NETC system clock runs at 133 MHz, compar=
ed to
> 333 MHz on i.MX95.
>=20
> The patches are ported from NXP's lf-6.18.y vendor kernel. The device tre=
e
> changes for imx952.dtsi and the i.MX952 EVK will be sent separately to th=
e i.MX
> tree.
>=20
> Tested on the i.MX952 EVK with ENETC0 (RGMII): the link works, hardware
> timestamping is available and the PHC runs at the correct rate. ENETC1 is
> untested as it needs an add-on board.
>=20
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Clark Wang (2):
>       net: enetc: netc_blk_ctrl: add i.MX952 support
>       ptp: netc: use 133 MHz system clock on i.MX952
>=20
> Frieder Schrempf (1):
>       dt-bindings: net: nxp,netc-blk-ctrl: add i.MX952 compatible
>=20
> Wei Fang (1):
>       net: enetc: add i.MX952 ENETC support
>=20
>  .../devicetree/bindings/net/nxp,netc-blk-ctrl.yaml |  1 +
>  drivers/net/ethernet/freescale/enetc/enetc.c       | 23 +++++++
>  .../net/ethernet/freescale/enetc/enetc_ethtool.c   |  1 +
>  drivers/net/ethernet/freescale/enetc/enetc_hw.h    |  2 +
>  .../net/ethernet/freescale/enetc/netc_blk_ctrl.c   | 73
> ++++++++++++++++++++++
>  drivers/ptp/ptp_netc.c                             |  7 ++-
>  6 files changed, 106 insertions(+), 1 deletion(-)
> ---
> base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
> change-id: 20261118-imx952-enetc-bd2bc331e1b5
>=20
> Best regards,
> --
> Frieder Schrempf <frieder.schrempf@kontron.de>

Hi Frieder,

I have sent the V1 patchset for imx952, will sent V2 this week.
https://lore.kernel.org/all/20261104092217.1730351-1-xiaoning.wang@oss.nxp.=
com/

Thanks!

Best Regards,
Clark Wang


