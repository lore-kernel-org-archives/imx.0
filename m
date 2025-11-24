Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C5C306D5E
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991583; cv=fail; b=D6n8T8V5x8NPIQftGUOMVFUBA3SaHV6zTmY1VIvahMx/F3SVTnA7FKg8WH6RY2BGO/0Ii/6RdZPAyswFU+49j6sqxjmLA+vqtUv1whjkahYYwkifr+9ZuL2avdzCynyXjx7H6wNSOjO8twjlT0+gbcXwaTgdgTEwrpYPUs+/XIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991583; c=relaxed/simple;
	bh=MdJrHCoBcsF7WDsHAJF6K7EJ/xWJjxFfqEn1Gf3ciIA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XTDcNIjwMGvTnh22dMyaEDMjYtShVqpjHYg+VwwX8DYWmAmazKLg9Wgpyi7sRp8WXyz3CJuj5gmyglgqP7uNJsL55HmErjC07LbmIg7/lhMPdsVb5D7pnOkXaMM4uXYRWIgJP1raqt/Sz4ErFeJXKfei9CWInVRHnqdq58OUPE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ej7HBYoL; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ej7HBYoL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8/9x2DIU47TleBL9G0Jh1Y4DaGIUyHnTJFuWXCU8DKNIjvlTb7GnScDRG53/8yRP3I/3mfLoxjdNYYczY9tzM2egTwtvIkODTyLT/TvAlTyvxZjqq+6yNf8CmzPcCIquSUktFYqq9BgJhvAIYHOGE5nYi6/ejISGmfvfBl/zRpSl996gYjcQ3G26ULDTWeDGiOSSqn005sooMqwrgmV+j9y/m14027CMWkPUfA6uJhJRLiXXCvh32Zde3Kt+Xkwgk4dFq+DiD6aGcDSsJr6P8t4i+SJDDAARYzQloSgDuc1OalKG9WGLG52C1Jbh+IM3BVWhaMUAqr0syayB5NDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdJrHCoBcsF7WDsHAJF6K7EJ/xWJjxFfqEn1Gf3ciIA=;
 b=xKfUfGL7hzYQF2cmNKiIj+hfJii+BUBb4A2Bk2NsfUsE5f5zRY8zDNUB8dS4evFCpXGrgNrO1G6eYO3tfeqYNL/+s1ZS5veuOVr+C9WScf4HWHcmUlZ1i/O+CWPlYc6UVvYpttI1tbJZi4qJMGMVV2Lxxk/Bc3wX+Pyj2/PetCaFG+rkLQ1TKwGv5Rcgp5RIV7UGDlUiPRWROUvz/TdUQehWExihQfc97WWhAurC8sHjjcpG7hMAW0TfaoS+QL8o9hGwrKyxWBHXtNtJEHkckLG9IYjmsse5HnL2Xut0uksbT1yxUvosodMGzaXRWcvzioZUAI7FlbtMM4101tW5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdJrHCoBcsF7WDsHAJF6K7EJ/xWJjxFfqEn1Gf3ciIA=;
 b=Ej7HBYoL9h3p2zWEaiCgbumLW9jjPM73XvVEp/1B1ETxhXESWhD6KabM9d2gRHR8LdMueZ2qkwiGNUh+f5jP8aZ54B6gFaNWbsIg0rdMfaOs+2T76LOWxr8Dd1PAVmgJPkeqhAR6/igC+cZUoczi5rfNe/Eh46fJk/RVqdWL11HneAwR6UqAKsO1qBFtEI0Xr3rFqUa/qdGOswKwsVbPo7IIYH5uY8fBDzZQ+RWP+vkR2d4mMVBgmlukmvkBmNghBRnFrzlLZJObtZJxbRjXscvuVlFlbnhNZ6sNYbCIiPtZqXukFmLVGdNxwO0fPlta90fW2q0onYmY2Mg+e3iOQA==
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7)
 by DU4PR04MB11925.eurprd04.prod.outlook.com (2603:10a6:10:61b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Mon, 24 Nov
 2025 13:39:33 +0000
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a]) by DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::43b2:647b:5320:225a%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 13:39:33 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "dongas86@gmail.com"
	<dongas86@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, Frank Li
	<frank.li@nxp.com>, "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux@ew.tq-group.com"
	<linux@ew.tq-group.com>
Subject: RE: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
Thread-Topic: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
Thread-Index: AQHcXShvkeNcu2VmTUKLRIhokyBnebUBu3KAgAAXeFA=
Date: Mon, 24 Nov 2025 13:39:33 +0000
Message-ID:
 <DU0PR04MB929990AF168DA048D26E993480D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
References: <20251124095449.4027676-1-aisheng.dong@nxp.com>
 <5432a356-7694-46a5-966b-29257f37a8f5@pengutronix.de>
In-Reply-To: <5432a356-7694-46a5-966b-29257f37a8f5@pengutronix.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9299:EE_|DU4PR04MB11925:EE_
x-ms-office365-filtering-correlation-id: 5457b3e2-6258-4dc0-c181-08de2b5ee6bf
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YBZEhIAKd1WKvlaqETQqgex734G/0Lrhs8ByNFcJ8fGCbYB7DBMkBmQTmNE3?=
 =?us-ascii?Q?YWTf79qDytvzA6HsAKAKxjqh/ib4h4GRfRPJZCmAtHbDREkHHJKJdQ7K3Zrf?=
 =?us-ascii?Q?n3cHoejeWGh11QYB4VxRkydkMTXiFUCcWQtDIp0rYkMfFMC5IIJsK94jJLjI?=
 =?us-ascii?Q?RSOUsmLCl4qdePvM7JUN3XFZ/TI26vLfhFHlnRoYOxdQIoGLivBghAmISwNy?=
 =?us-ascii?Q?kBNYHrAx0Y/55Cnfxo6sodT8w+M+QMY5sRdZRda+f9A46LcimKuhe+i/Tr30?=
 =?us-ascii?Q?MTAl2yvmabUBFIU4PhCwygmqp4FDLcyr+HEtp4qOv0JPxCgAyg3hxghqGtkS?=
 =?us-ascii?Q?ZwxboFBVJ7qHRHzyp/ULyfgrbvitnGvpHR9I9+XM1L99HLak3YHsBQ/xlWI9?=
 =?us-ascii?Q?5M0xi57fBB7n7lT1avPk9S9ZZY029uCWNiNJjoRKzgHAP8fNrDRYCb6jANJI?=
 =?us-ascii?Q?w5Kp+kIEzPgV6l+qfE3HZ6r6SNXABHgPJ3sN0L105tTh19wgwGUkCbNoTBIZ?=
 =?us-ascii?Q?tFVeLpr2sHmj+qsYp3VkIDIcY1rLRtzFFPiK3RtGfTFC/OGxA2m5IGa6GCvq?=
 =?us-ascii?Q?H8yakhqxLijoaczwR7RKzC1VjpOJDFc4ReWuHRoNhm/1xrmZIxvurqpJ0arJ?=
 =?us-ascii?Q?EbDvWPlgBppmxJ0aIXJcYTqBah2C9gUOdNOsL7qM6/c5jA8rltwqo/F+NvSY?=
 =?us-ascii?Q?PzQGu2uCj54WyGxhMrUcffRveadX/AJnp+N0EPEOdQhxgUVWhrqmOXiLHMoq?=
 =?us-ascii?Q?V+To1lUJjtM65Xtqs3V6bWa7BfMUsdMP7AqWjpsHU2rw8H3fY1uXa0bPdWyq?=
 =?us-ascii?Q?kJ5k1VqTVQ4ArMFBq4NUv49u70iprlNcpGJFWrV18G9jzwYiptgZq6J4bMqD?=
 =?us-ascii?Q?xhUBY/Wk2mArYqNCsb3zXYCp5RZ94Asad6XoOkvHAUdLyTYpeOTdkz5wRxxG?=
 =?us-ascii?Q?ASlmKZC7tWeBOzurPVztHNUFaOTKHIFfVVT9gbG9ad0qxEQuorwyeV09GG4f?=
 =?us-ascii?Q?C5YX60Zn7Qha8UaYowxSUysnrbJEqIBqFDPW0AHnK4MEROdwOjux0g9UlWiK?=
 =?us-ascii?Q?6H2nDSh3p2JLapeeVQgSuLGdldxiqb768crMyiv6g8YkPQ2VMOKGtNROtCOI?=
 =?us-ascii?Q?1bqIurggB9ThCR82vmqptySaNS/GahCW0Ig2P8LLHY2zA9oiFDP9F8kQfNZ5?=
 =?us-ascii?Q?56jVS6AhUYhx+/Gg0QvNHw2tTW6f9TaXrWFFH6jz0Engmqf86rEPywUtJDYI?=
 =?us-ascii?Q?pVNmbsg9tEi3B/qjFdVg6R6iunIMNB3adCRa/dA85BjplwnlsCQkGk97UoGp?=
 =?us-ascii?Q?T2pywnwCnZBjl3YZ6ZcVKAedRfUmxY1nTIGVUz0+FYwFg61O/WzOLu9jhcQA?=
 =?us-ascii?Q?PSpeWJl3tEH9TyM9/A/B7jspCnm2BhGN6rdGCZjtpqlS+DDt130SImq0ZTnT?=
 =?us-ascii?Q?yGKp578Rp2YrfE3Hu+FX3iO+aH3E8QMQbYPLstjLC8js9B/gqOig41wN7WYC?=
 =?us-ascii?Q?wLWMwniJV1X5UVf1vMomRmClb9ckjnhpBpFh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9299.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lHgTDwamWwjlGBSlXQHyQb40KU+Xi/nupkxQ3XEAa5CAluPsi18qNgJ6XE0Z?=
 =?us-ascii?Q?3nbWZNHfKAIR3+LTzvQypRFtI8jxtfhQrjFcHE3Ocq/0fuLQ0U2RXaBEMt2c?=
 =?us-ascii?Q?YlaZYDR+GKcJRBwd4FmtIGAsu1HILW6xxvhDGPWvkqa2Y9AonsIkHYnYyuOu?=
 =?us-ascii?Q?MnwllEp8x0n/8FPW7ydmz+f3+2audfQ/T+al/zIfvwv8I5FDD5/2Z93xjloO?=
 =?us-ascii?Q?nvf7WVtON7uk1Ak0/LHKSOccyVMrW8rwpGf9lyC1N+i4PX+f0y50sQWI9VUA?=
 =?us-ascii?Q?K4x666zdHPsiyqmySryHrRe4YoGcBehqAVmF4i0Dh7/6rZy7eJK8YSak/zta?=
 =?us-ascii?Q?CYnlKtGKLD0Zyk1aDLBWXr9TugaVPpQ26O2jneX+Xwh0xCzfT9c/kQxR4RqD?=
 =?us-ascii?Q?fsC5tqwbqHKv48GHjuyiKcrTOiMQfPu8nfdnPp5coKnhHiBvXFZ5ts3gSRUx?=
 =?us-ascii?Q?52bij0+U1j2W/47IdMzNRVOWgo1dl7JOpti8x/jFbLy7KfqehtPcw8ubxM6k?=
 =?us-ascii?Q?M7yf6ioVcrUreYxjFMrJWHscYK+8u0Y675GRf0XS8Hhy38bOG2h275EwcgBY?=
 =?us-ascii?Q?ixfvi4YGihY66ofT5JNoj6FRwAZAfDi2How62itEPLbcZyzlmweOx7zaaGJK?=
 =?us-ascii?Q?sVqH+CvLGso/ZPwCcQeyPvpmLqVinWBakIK1l9IpsCG8/Ga0+oUoHf1wRqMR?=
 =?us-ascii?Q?3G+qVZM0b9eHhvC+yMCNeCcCg8Sbdeet2kuZm6hRPuTlryK2pBV8Qq9Br8RA?=
 =?us-ascii?Q?iKdBYwic6ewYqSpjSS8hV76YrWL8m1OmxQx+HdWCCnFhMBQbdgK4Lal6jhVS?=
 =?us-ascii?Q?++WLmOnpHkuzPScd2LIOJrx5KQBrFR3d2FR61z/ldJ2khgbs0+TKEreg2mWN?=
 =?us-ascii?Q?FZUiqvN7gan3l+6/9U22Ac9bxKfVMr09ri3x6gQLlOeh0skdglH5NzsA5h/K?=
 =?us-ascii?Q?fCXwqm1dx6usJ9yvrRbosSMEE4ID+gcANEz10tEueUtovFYlhDOngAP7x0sz?=
 =?us-ascii?Q?n3E6jbW0HFsa7EQPZ1WrJByAIDAkOrHGuqJurEiEhWb/9ETnGJZrLBV9diPo?=
 =?us-ascii?Q?K8H8QnxT+8Pr947BukqPzdOFmHJ2BkryBrZc3ZuMfxyN24zJT8weitcORFue?=
 =?us-ascii?Q?wWTS3r0DZs2Y5YD7pSpcVABsedF+TrTI68B5NgugU1uzku0iSG3C2Z5bwbBf?=
 =?us-ascii?Q?W7c6t8IcBTNYEFhWvf8l2thn+i+H8bYvXv2xwQmz1eEjoeC/Bk5XeC+3jheo?=
 =?us-ascii?Q?ODFl2JDfdY2QO1D9nnkKPIze2hBHnYY4OhmNJiEzNaCUHofl18/Ld4wLFjLq?=
 =?us-ascii?Q?pEw9Spw6Ck3VRoblzBbeLRDQvsTF0zzfZB+gND+p4KH20248oosmxtlIhXYT?=
 =?us-ascii?Q?D+0eVp2r3NCQSV/McLsSwacpP/rZkYA2S+Ol67oCWlx/z1DueLilxdDz3AAx?=
 =?us-ascii?Q?CotPrWSge4dBZsi5/d6juxOGvIA0fKg9hBc4LMc9f3iTnscsOpPUH2XM1DmA?=
 =?us-ascii?Q?FbxuNBdz0ippJmu2vaSDPZXneV0UMbxyQ3AwFWFatmJRth8n5kY4bI5OSOhM?=
 =?us-ascii?Q?A9X5Y3IhZV1Wr91YJ6c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9299.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5457b3e2-6258-4dc0-c181-08de2b5ee6bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 13:39:33.1271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W0hXtkC1xK5x9s/CtDbjgx3DhRhqoo6f6gjeZNi7S9+IBYhTILFS8PXLWPDvQkGYE3DKkrH1mi4WvA88bJHYOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11925

> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Sent: Monday, November 24, 2025 8:07 PM
> Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
> according to Rev.D RM
>=20
> Hi,
>=20
> On 11/24/25 10:54 AM, Dong Aisheng wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > Update i.MX8MP imx8mp-pinfunc.h file according to reference manual
> Rev.D.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
>=20
> At the very least, we should keep around the old defines.
>=20

Could you help elaborate a bit more why need keep the old defines as I saw =
the previous
update patch also didn't keep them?

> I don't think though that aligning with slightly different naming in a ne=
wer
> reference manual is worth the churn.

Besides the renaming, also dropped some invalid defines and added new ones.

Regards
Aisheng
