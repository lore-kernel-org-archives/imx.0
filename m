Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A018283C89
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806802; cv=fail; b=VUv2qGztOd8l6cp9xlA8sWy4x6kRys1x7YhsoJZzHaAScgiYuUDQ6XXscFPjjlb7LquMS3RvMKFuAHmnhi8XnA8Vh7gAX79AkHxdW3o1kK4t+570CuA8Pcuj3KaxzhcNvirofbU4X1e5yGADDNlA1YNVlJRJQFGbBSdOrA57Zuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806802; c=relaxed/simple;
	bh=iWT9LlDsurF5hMtxEkB5/JTRmPviv02B5xYwiga67mo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JJVeUZC7/xj4C9AVUK7rxGIIsCNGjBKm/AntIyUxhI4vU6ixedwD40CKkMUq2iSm935b3bPiEDWD0mF75STrfJMvpN32CeMvrgbF5yxz7hlZ6l5G41RYml2zmAFZAvOFrhCF93tho3QiytUahalo+edbIMFEDGxktGRIKo76EV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V7ErLCCQ; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V7ErLCCQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO434zV3Fso1/m1Fo+R7jjZh4Q3LCEvX9sLxtgsOkXRRpuWvbS78VrqxSRVKDUGElY6nQCodfjrbcLddd+b/ltGZB8FqxTuCP6hDYA02tK6+0w/0XYjVu2qdyl8kkJqiG6Biz7P6jKqgA7yEkzBouHdc2EbmwJd8ePHYN+dLDmzTYsILKPXFvcbDyNx0IHN8TrJDr164LL7vDLFZ1+tka04MvBLxniyhPQehOt52IbRlCftPQCdarjgRaIvCob6IH//sHMP6f8oVJxXWWvr4i2OB2g3ws86sHSbiBsw4c+xWtbHbsUiPCAWJDgAH7IMa7uBaj46qdhO38YAnyBJv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZorUo4cafeR1VKyKQnK5K8oVhGDT9NdMgRqFl48JWOI=;
 b=utUcJeAib1obw9ID2Bg2cYN5KjV9K1aPgGv2hIgT4rP7EmO6mzJIXFKcMgpyDzoU881KLvxE8hHimfcosqO/pDgpvDgaQWXpTmACpQKpjmLPQ1VSMSNAV+zmSaA8aJsfDRITOa/1lvRzUK02quY4Jt0M+4d1pt1lNVNRtrum6cp0ufgLg+YNK+qFGFZw4qMTzW4rYGDTjLLdvxkpzww67/tjV6ZPhsjvARvierKpk9QEzvUHm/gpJ71WTNYvWrgZDDBF1r0nGV+ywOO71pQy+PXnR6Vgs635yViD5Tt2lwmdNzAcDQC8vmKV6qtv6vz1Jem03tyY3CeRfakMV1vVBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZorUo4cafeR1VKyKQnK5K8oVhGDT9NdMgRqFl48JWOI=;
 b=V7ErLCCQ+8FpKmUMGIDdRaZhGyjlZiO02hHqp3tgwqBZnnyJtkLzoG/VEuVX3/MDjp/g65s9LTJDvNK7HxDNgiytrt5C13Mx86gJkDfPathmq5wLw85zebVHSdgTlJWzHVPVFWq48c2V0eJ89K9RekQTtQROyjgGizxbnoNGh+HQcgRoUCrPxjWC1T7MeyqicB6M5et/Iln8CMdwftU5be2LC6cZPzM3o3PJkPmH24loUUFYi3StE9uHM4zSSqIQDGAplSfxByKypiOEk+tPu7o3e89CkukjSWiqOEPL8UkzESc7HKsi7v5FwO1XEQh5TCD+54gyxTH+l3pYmsBqTA==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by MIYPR04MB12550.eurprd04.prod.outlook.com (2603:10a6:290:7c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:06:37 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 08:06:37 +0000
From: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, "Chancel Liu (OSS)"
	<chancel.liu@oss.nxp.com>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Thread-Topic: [PATCH v2 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Thread-Index: AQHdB5uUKIQPeD/sYE6PuzzdCDde6LZViFuAgAExLCA=
Date: Tue, 30 Jun 2026 08:06:37 +0000
Message-ID:
 <AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
 <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
 <20260629133253.GA2593312-robh@kernel.org>
In-Reply-To: <20260629133253.GA2593312-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|MIYPR04MB12550:EE_
x-ms-office365-filtering-correlation-id: c82f2735-01e0-4964-c034-08ded67e8271
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|23010399003|7416014|3023799007|6133799003|22082099003|18002099003|38070700021|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 MEByRVuYHot60A8uqUIhO1In4WxHAwLSByHVju+kEKBq1rcRNzlfYPXpiOdCNb5pr3vseJrfJMNCwWFll85C0uC9jaG7n7mjX2LTjSJ/mhUfwep2KhoobgK856GDtswQGysMhJ7c5WPMxEYR4qwVDfVqrtC/ivpnw8u0iLYEpfDh98/m82JpZUbLwKGTMloo1ZTjOspG0aPYOF9o29HG9Dykv1dCPJqSgohla+n6ktDxKJ1P5RibZolfR3ZdPHDX8pXmSik6rjg60UAU920NRexJ5bOvECX78OALyd5Iur8lv9v9Ww5lZXnZkb0GveOd0/+X8Iuo8kWZdasjkUoiWtY4KFi2bKP3iV0yRZ+BJQv4qFKk6Jn1isva4mbTErm3Y1TDJPXilgSMUlgo973owLZk3w8UmQjbIlwa3MDSNE3DdiYAOOCtZNGSITBrP/+cMdDZoe6wZopIPI4GOAYsSqQz65a9B5/0LPiTsgU3EGPhbHYBx9legXfiSs27RBan+5+7ikEFOsXLy4CamyQlwWiEfTKZvyP1TAYnKdy0vSTDDd1RiMSdZZdVDX/mtfWR+oH0pcAhTwSWpuTOhF3ihQUe3doAlQUJIAtZeuKnJYLd1tylaVw6qxT1blqO2frvW2EdVh+iKoPN23yBtDOpoGO9BXh75iJmVTS+w7yMARo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(23010399003)(7416014)(3023799007)(6133799003)(22082099003)(18002099003)(38070700021)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iuPETG7N5Yu5A/tVt6qDPqBCc5piz0hnMNubRAaASb7YOzLCD/Dd7cJvFs/F?=
 =?us-ascii?Q?x0E/9QRjR8Gcl4Y8hEdR4Ij00Y+1FYli5EPtrVwl/jhHO8sUX79eDQBY7ELq?=
 =?us-ascii?Q?NEUL2ymIop8oOzSsZFY4ZPn+U1MP2Y8EA17N9WXy55MNcTp3/qyCUGrlsLze?=
 =?us-ascii?Q?sb+ACwqCgsxySobSn+S1USyDQYgTyBv9TbPH4KkNFFlsE4PzvUrVimkMCCu5?=
 =?us-ascii?Q?HdwcRqXZrlei8mXzm8+l1xnZZkI9fyFpP1Xta9kXVxf7GgNi1Sf3WjRd34N0?=
 =?us-ascii?Q?Bc4sqNcMhfZVk9BgmxQiXvfFhP9dliXuia4WPPpjlCMeGDRAKudoyhO4TNU7?=
 =?us-ascii?Q?UQpYFY0UW9NFinMP8s9KJqnf9OGjQPRklqdP8yhfZBAVto0C1U4kGDoVowiR?=
 =?us-ascii?Q?lZlmSNPurcG2wJcOo+H1f+3cP/nNAFQPuGm4TO5+RjRwfJyXNzLnpLJ4OxgT?=
 =?us-ascii?Q?RGY2fyXUDiTwez4BluqezkgCS43jRRbvc5EsxaTXAqI2NgSYCoi7ubgVJb+2?=
 =?us-ascii?Q?ktewSiSUOBMnvuRQcL2ZjGyAA7JGAeZj6GpjshvgHKgcG6FN4ZFGpMIzxdqY?=
 =?us-ascii?Q?W1tKLlP5ly/TRm3aw0LJlDiL4K3ugGFihkMjsIqacA1HlzLn99Khz3e6Mlhl?=
 =?us-ascii?Q?w3kZnKeUgGrHLqGntbdH7VEi/P94hhTwuiYwiD8ZJJErz67yFLaO48dTkF56?=
 =?us-ascii?Q?pk9iKrkemMB4ctIhe8hYcQKzdxtmZtr8EOfvccm8qV8cNM+iFF3yk5M8jD3V?=
 =?us-ascii?Q?Z4Staf+9OWDVQ9hQquNRhU1vG+9YFh5Q/6Xmh9uDqrdN2LBbL1CQR/7ZAEJx?=
 =?us-ascii?Q?K1aLtoRuMgQBmtRVNTh+VHXXH3y60C7qVD2V9UM549YBZn1r0+EQT0wy+pAK?=
 =?us-ascii?Q?Hopg/Jk9bHX/Sm0pw6RX881O7IL2eHehNWRNGCswe0AAbpy4XfzQG429/3ZF?=
 =?us-ascii?Q?B4pC0hOcSoApTNtigHlHpDe2qA43FpBRBaWFLcUa1vo7+IVoIHY9GuHw5gE8?=
 =?us-ascii?Q?Za+A485joRE6ezsszfXGN9t8hW67uULhLHDHcs2MjI+l+t3lzyeyVOEUmVzX?=
 =?us-ascii?Q?pPRBDNSaQecRBOHhTYfEuo534CbD8pgdjdOJ6zA8Mt1pLGb+0SDbEdfyomxc?=
 =?us-ascii?Q?tr7Pv7cx2KygeBgrwTcXYFBGX/hBIpOrTm3iNuAGmvNsNh9BrZGYEXOBYmzg?=
 =?us-ascii?Q?GUTkH1x2HR5mpdy23Wun1HzQGR8ppn6VpdG2YTEEI0ob2sOnb+/8TQZZCr8I?=
 =?us-ascii?Q?Kq79S2ST+i8+Z/S4OGP/u+46L8xrx78X7w+0zgGV190vBPDKMhJ90eqX9q0V?=
 =?us-ascii?Q?hSDjF7OP1Vmfu1z51CttwwNvWMw1ziqRNhZCxkUCBK4cVvIv9ZzFg+G5TvOP?=
 =?us-ascii?Q?eEmWnKafjaHt/tPjYQnz5Bs96FEipdfsAeTqpplVp6yiwoHBQuxxMAsM6+L5?=
 =?us-ascii?Q?NrQWRFUFaajJ8Yxzf6N7fb5c8KN84eqhLAEfnZRgBYvo1fA2NtMYu2TGiUIi?=
 =?us-ascii?Q?k0vW5NAtA2r89L4IamcnDdXZjlNUSPUofpkVo6Fbr3IHkjavfXWJlJIobHiU?=
 =?us-ascii?Q?bFkFLyKQsk6OzCOK70EtaID9w735tC3NAvE4uD4A7GX3qvgtoaOuy3Mgpv4L?=
 =?us-ascii?Q?oMGkrqwtQqvKrKU7lMzCLvKw9AVRRz9Q0PuOGuBuIQLlJsCKAVUDa9h6IKLn?=
 =?us-ascii?Q?CsMkptSSNGIssQy8yfpB4CwQ5KC+U0WEMYDgEXgtlWTZoDp6llM7xlnDItbf?=
 =?us-ascii?Q?pZb6Ddgx9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82f2735-01e0-4964-c034-08ded67e8271
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 08:06:37.5384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ye+V7uM+wxuHGJsDfbVfLXMmJRKJ/hcWe8WXWtezIh5kThZds7puHIm9Hn4QeYTzqLyJFjAXzJhhllWkRQnu/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12550

> > From: Chancel Liu <chancel.liu@nxp.com>
> >
> > The NXP AUD-IO slot represents a physically present I/O connector on
> > the base board. It acts as a nexus that exposes a constrained set of
> > I/O resources, such as GPIOs, clocks and interrupts, through fixed
> > electrical wiring. All actual hardware providers reside on the base
> > board. The connector node only defines index-based mappings to those
> > providers.
> >
> > This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
> > where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
> > same add-on board can be reused across different base boards that
> > carry this connector.
> >
> > [1]https://www.nxp.com/part/IMX-AUD-IO
> >
> > Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> > ---
> >  .../bindings/connector/fsl,aud-io-slot.yaml   | 113 ++++++++++++++++++
> >  1 file changed, 113 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> > b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> > new file mode 100644
> > index 000000000000..5085574d221b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP AUD-IO Slot
> > +
> > +maintainers:
> > +  - Frank Li <Frank.li@nxp.com>
> > +  - Chancel Liu <chancel.liu@nxp.com>
> > +
> > +description:
> > +  The NXP AUD-IO slot represents a physically present I/O connector
> > +on
> > +  the base board. It acts as a nexus that exposes a constrained set
> > +of
> > +  I/O resources, such as GPIOs, clocks and interrupts, through fixed
> > +  electrical wiring. All actual hardware providers reside on the base
> > +  board. The connector node only defines index-based mappings to
> > +those
> > +  providers. This connector type is present on i.MX95 19x19 EVK and
> > +  i.MX952 EVK, where it is used to attach the IMX-AUD-IO expansion
> card.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,imx952-evk-aud-io
> > +          - const: fsl,imx95-19x19-evk-aud-io
> > +      - const: fsl,imx95-19x19-evk-aud-io
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  gpio-map:
> > +    minItems: 1
> > +    maxItems: 32
>=20
> You don't know how many GPIOs are on the connector?
>

Understood. I used a loose upper bound here, which is wrong. I will
constrain gpio-map to the exact number of GPIOs on the connector.
=20
> > +
> > +  gpio-map-mask:
> > +    items:
> > +      - const: 0xffff
> > +      - const: 0x0
> > +
> > +  gpio-map-pass-thru:
> > +    items:
> > +      - const: 0x0
> > +      - const: 0x1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  clock-map:
> > +    minItems: 1
> > +    maxItems: 16
>=20
> You don't know how many clocks are on the connector?
>

Same here.

> > +
> > +  clock-map-mask:
> > +    items:
> > +      - const: 0xff
>=20
> > +
> > +  clock-map-pass-thru: true
>=20
> The purpose of this property (for GPIO) was to pass thru flag cells which
> are standardized. That's not the case for clocks.
>

Agreed. I will drop clock-map-pass-thru.

> Anyways, these properties need to be defined in dtschema first.
>=20
> Rob

Yes. As noted in the cover letter, this series depends on Miquel
Raynal's clock nexus binding/core support:
https://lore.kernel.org/all/20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7=
853994@bootlin.com/

This series is intended to be applied only after the clock nexus binding
and core support are available.

Regards,=20
Chancel Liu
