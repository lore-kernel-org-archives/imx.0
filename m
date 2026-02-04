Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F626E6F3
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 02:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770171152; cv=fail; b=K3/Lx8Ft3g3AitWmdm3M2iqIcLJFYbkU7D8ijsYjcS2a8S+ngGE/uhn5hlSgUlrWALOv+GjqLgrTODaR7oXM/TQExeriXexoKTM+xXDNnDtHr/lnoMIPKarGCotTzfua3cryi/bQoFWx3+bKQESVLlegTPahTjnRPfP5ih9o1Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770171152; c=relaxed/simple;
	bh=4IdNCJ1Dara4BFD8Bk9HAVj4Qks6DStjYLMG/s9nf0s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rfKQ8yulXtTMQAsySAfoqCQARwWAIFhH7nHHD3nS2SC9aunfEVHwxZPcAnJvgg33032KKvijm7ZMXcZ04uGyaj5k7cDTuIIVNq8za4YTFxTHYILut+fsuT4lS3CRJ6UvE9XMOtW7WWiBIIcYTYzGjRGPdwBbfB3N6c9VtUT1ZI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c0u1yFJJ; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c0u1yFJJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G957J4kJshtgzELrY/utbax3oN4suo2l+Nov3W3M6plorUx9R7XX8lAIs2pt+Y1YiGUzQjAlWmcMwyHrGlFhMcQSYDM1eRKjHsx7wUekECm3aHmPeWcy1hDLFFqHVaAWjyDYhFD4OVD4db9KHqwcKBJ7TYsTpYGjadG1dqPOJYyOIUM6xc2CahvKdAJ4ZxkuApBtJTNIsM3SmqDHvhUG+b0G/Hy8cDP/q94hlLCzlpsjZKqd1FSlCmPHWuft3sUA1e2ABDTj8FkBeztniNhGYhxUnf40v69l3iKeovEmhObcQIfHBkB23NPMPU6nOnsniDGb0wdFb4qKBdsWX0+K8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDbwS33iqIJjqSZvVloTctJnFBMDmNyeOSdTAoZc4NA=;
 b=hPXJ6XjHt02+r0R08+Gq0weOGTbT9lm9IQ5aVA7Qu50ZxdPR8HC0i3xlCTWf4FlmRXZm3IvommXTmMtm6ejtq6SIed4WI9J94vUAwzCwEMaSGNR39iyI4j1jf+neg6CANpjzDSIw9wP8VdazGLMyryb0oU6fc7rFgV/tqjA4aGCzNXjPMcPTunHNt463CEribsFfBzxnCxEPGvDQAoMnS5h1554oXharjgo9PWHbDLnsRnc31KUl4hyT+96NpnW+99i9rwkL4fPGfFmlGtvXDIP5CFI1FABG+/mc0xqrjIwzGLZCoTnbdbhv/z644uXJfBYyVvWc2R/RQahwd3PdPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDbwS33iqIJjqSZvVloTctJnFBMDmNyeOSdTAoZc4NA=;
 b=c0u1yFJJxRGaFSQGx4fVswR/x1Y4ftToJGOmklrgFQ8MlBpRTmO+IYme66WaXWOzYOUQrfjVCiMK3kJwQ+uG8INtUR1wmynBMClHRG9RdPFtHDkxEYGsnNZR8XKOFFyXY/zpPFggRUnDnFEyBk6vTlQWlJzcnd+R1gLYTArnOTTp8or2vy0qoB6LZoEWq9oBOa3fepKWjiwW6ZLFZbQzb5lr9SIze+EXKgDIkC96OoUIXadr+W7mXQkv+3CsLa83q3y+bXa9Z4T3KUglKFftMT2qS0SOdwzbwJ3GBD754qnpRdBZ5PLfzUwAJBAaJEBl6J6bSLC+e+3qltmZ8qkCzg==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI0PR04MB10568.eurprd04.prod.outlook.com
 (2603:10a6:800:26c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 02:12:27 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 02:12:27 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
Thread-Topic: [PATCH] arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
Thread-Index: AQHclO11+PjpD7WRP0yaQqphpBjptbVxQSQAgACMTuA=
Date: Wed, 4 Feb 2026 02:12:26 +0000
Message-ID:
 <VI0PR04MB121149BC7728CBDCA55B1F6599298A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260203091459.1595474-1-sherry.sun@nxp.com>
 <aYI1QN6g/DbtfIz+@lizhi-Precision-Tower-5810>
In-Reply-To: <aYI1QN6g/DbtfIz+@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|VI0PR04MB10568:EE_
x-ms-office365-filtering-correlation-id: c547451d-bb5c-41c8-a994-08de6392d7cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|19092799006|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4hvjCYybV911JCpGYY+ghjP7SsDHJqinzGbAxm7w/xKTSXmciWPTnv4qTd8i?=
 =?us-ascii?Q?b+OfbSmwyTuZR/Lme9nb0BWilVXsXIkBOkddaVlxJdD8CMzELOAkvSnUZzZA?=
 =?us-ascii?Q?CBCALbaHxaufnuFlMrYoMsDQEHj3xhaa2COn/CtC5xs7B9TRBCMyrEUT48un?=
 =?us-ascii?Q?8L9WfcONvJE9qXoqjiiZTuCAti8zJHmp4FuawOZ7Q+aoKGpvg6fpaYiUtsaU?=
 =?us-ascii?Q?PnOdn5ngZOvsKv2chd0HGnIJ07cPsO8CVo/+phYxLbxC4a92/4fIUiyiYnRO?=
 =?us-ascii?Q?ZCobV/kuzhbrfJVL+EYYaz7KNbcwfdYkmGVGm4Md510MQ3JB8oaNqVx9N0mI?=
 =?us-ascii?Q?X1cxj6/kMFmxWiCfH0jwjEbhU5wQtYcmL58B2HUJSxIYQlLmQQBpEtTiFIr8?=
 =?us-ascii?Q?OcakXcTM4sLJL8X3IhQQLknNnsRu4aje+0YYAdsPzW4dBC7IZso9Hi1v6rhf?=
 =?us-ascii?Q?hFAcWEsT7DRKkGHqlC45KdmeZ4NVLtnhvy0wbtAsiO/ua4MKQleCW+dOwXsp?=
 =?us-ascii?Q?MTvzXToA30O7NNU6UjaXRx+zDqVVYw1FBpTrXFSijsn0jBL9BhQ1meaebLBN?=
 =?us-ascii?Q?Q28H/bBs47bNMp0Yck6mlHvUX3gjhyE9xFKQVnvnPUtuSFzrQmhArOwBsSdx?=
 =?us-ascii?Q?SySvhghifVlgXOvi9iHpAdhQTOmSZrxlLGTDZWh07wa57+vzqyfvhS5dmUYf?=
 =?us-ascii?Q?qD9nG1hb/lNadBFJ3KHzamY9zLY4+uGQPRz03oWe8fWqdBxs4CtmBi3cky8Z?=
 =?us-ascii?Q?chIQY5HBTo2eyWKcMLFaXXmyRXATQhx3QfJoo1d1BepN8izkUiC0VJJiPuNV?=
 =?us-ascii?Q?b3+HuRMoACpx4cv8LhgsP0caJKG6qMrWW9dmMPm5aK01vLrK11r3lX9yQX+L?=
 =?us-ascii?Q?XNMszTG5/dQKVoN4TxF9VZdnAlZEO3x1FEezpHIMRYMW223t0mpUNHOYPEQJ?=
 =?us-ascii?Q?Oq4a/zTdnQqZe0dNvnL0WjpvgYv+OyHf1uhTLMEPApie9gBowo7nwsF5qM3d?=
 =?us-ascii?Q?TxtFZaYYEe/7s725f7VjPCDI2lSElePb6MvyHjcQHAjoEI951sCL8H5DV4qT?=
 =?us-ascii?Q?gUdAaxV2/EQkjAoJtk9jKjCMGRe4W91mbjXQibB1I5Ew/CdHX7Y1hESJsM2R?=
 =?us-ascii?Q?CC62ST3ffTZEF1A6lIsV1G2/fI9vF4bMWw7wFmASmKfYG7bo8gLRtx6M3P8I?=
 =?us-ascii?Q?rwrY2j+8X/Gzb1IDg33Rq/T27YIGOpoucmp2jd8GWkLL+WKE3HIkeX6NClQ8?=
 =?us-ascii?Q?7xDk27hX+B9sQJUxBbEKxe8xVW7MHl1upzQHfg9eJfxujDUN6Zz6bkYvME6b?=
 =?us-ascii?Q?dUfHpA08pWJA+9LgOHIgZ5Y2DmsWv2RN2qpVRTMYPqUKku+mZ0QO+TggvLOq?=
 =?us-ascii?Q?X46q9ExwP0RTDkdO6I5/tt/BhlE9SokWNla5duh/J79v4yMpCX3IAcixfrId?=
 =?us-ascii?Q?KTRgu5k1+hf1w79LDoc+nRE/r8h9tMpiZkOU6KsMsA3ERl0JNWIjqqCCgE2K?=
 =?us-ascii?Q?nK2bvPlEFeQ7N9V+1r6Tck8ZfWltHDQFX53bRaZk20eSFP7gC6iwUWQ7WuW3?=
 =?us-ascii?Q?8vbtiA3INzE6piMLgBBJ2AH+fl5z75nItzhpYXA+LSDpPwOrGufEfZpWR9yq?=
 =?us-ascii?Q?d18boybzJ5KPhZTx6mmY0b8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cFb4u+8t81gVJ5nkWCdsp0NC3YMbTPRhOJ0Cqy+nlQSW7a0Hrta2TaiIXzT3?=
 =?us-ascii?Q?B4eojPbr1OQ4bzwOeTMWFv3/74RyiwA2o2YOYcCupZpaGebVv7T7h/uxj3hE?=
 =?us-ascii?Q?ptlJc4PUyr/D6mAtTwWfsaWsR574qcluV9eoXjPaRPtMGfLceUEGeCZnTjPw?=
 =?us-ascii?Q?6bO+oWyKRUC6OzF7iSMqgJKv6e8XeTx1hlOh7ggpqxqJjYolxJe+/eAwkXNv?=
 =?us-ascii?Q?Bhz2SNwhw1DP4dK4p0wF8D420z8V295a9cRyR4+99Sto9ovlQWkZ90VccWxI?=
 =?us-ascii?Q?w/c/S6SuRhkkP1d0kePLt1GDrbcIa+MeS35PwdgVTIHEQuqTLw3X6dNXUA3Y?=
 =?us-ascii?Q?xzjR3jFOkD3rrMh/k+BTaHB0HtrfdGyqTi8SD8/kbMxs2/qacL6Xhtx4dkIM?=
 =?us-ascii?Q?X9sRK/P4FFzRKE5PrMbqbQN1MG/w8t/6o8KFNYUs6EY23b01FbC88wIrlJg5?=
 =?us-ascii?Q?fdv3lwRNA8vPiiLfF5omoKa5yycbSCKxeBE53pDCmie958BvA5VqsRdTvqCC?=
 =?us-ascii?Q?mPD8XIqtEr2xEfTDwQ/81OFm3gOIt+HQdpd322Baz7DIYknw1Y/gfUmahIoQ?=
 =?us-ascii?Q?l7GwxofeSORlw9JzCttvZyeIxn0HcXqxiXp7kYOW0v762Pz9tWZR6YHlTPJb?=
 =?us-ascii?Q?g3+bIKGMglrnN0ldaj8yS6AcDdB972J9pFr3RM8ruNBBbCiPh9FUoROliGtn?=
 =?us-ascii?Q?fd2NBVeM2HXIYM1o10NfeAuD7fmAe7qIG3DV8gwDa0oovpuAwBpgMELezL7K?=
 =?us-ascii?Q?vy0nHGzoDIzPew9nEqmURmGXXXIayRle+GPzO9rmZxsa+1yh/2J9O388/YbY?=
 =?us-ascii?Q?D0/PpS9Uzu3//VtTUbI92uUiHZn/sPzqChT1nNzyvttKCijgGjAPEyffssCU?=
 =?us-ascii?Q?9rEVdhXkAmCd1NpfIiPQgAXhPyHP4ZBhczohfjIDQZd3HdBm6+95hZKs67ML?=
 =?us-ascii?Q?1Pr86QF0x5AEt2a+Z57t10xtptGOdpFeO+f+xxyKp2F3D0nac0EGNGpMNfl+?=
 =?us-ascii?Q?tLpj8I/MaEixvhIwo5jwCdxKlvrwWpyYGgQihAYaOGm/+UBAUAl28GIuEj8M?=
 =?us-ascii?Q?LTF7gYQEjTqpM2MxjKX+/y3r3oH3EDVT4z1/hckcj/tBtvuv8rK/vvTlxvKu?=
 =?us-ascii?Q?EycRBATMgr9ON8vw3ESDnhzafe6EHwo5UGqKnzkjXuHWaQ/h9g+KzlnZByz3?=
 =?us-ascii?Q?wXvAJKgtVZkOCwSbish9MisoLLtR3ycUfbJrsJ2WCHjXfeCAvys0oCXm/PmZ?=
 =?us-ascii?Q?w+SOWZUWgL7kvrJ+7Yk9kJXyoJiV94/Vs6TdHopR5dEcTLwJCH4Fgk78/pbp?=
 =?us-ascii?Q?R7ULMDaLZo1knHnI5GGmsvIKOcYWax5tA8zYYAqnWTEZQTDEL/+iXZLe6KWz?=
 =?us-ascii?Q?h+ajFaYXvNbVDYnWXgEmo71Qe4geWQSl+ov2RRh4o+u3uUIWitsoR42t3FGt?=
 =?us-ascii?Q?akeFSGeXhg/sAb5tpkGHZBTNQJfhwGiqT+BlbHOzOJypiFR6F7iz4IHbjkxQ?=
 =?us-ascii?Q?s/KtKzVq4S2q7gRVbxZT5VYMNVHMP99tZebjV3VQwkJORnEnxKUVaeInoTm3?=
 =?us-ascii?Q?DWwUXZvFbEy1It+9mGNpJCIQXR2D1vRLVrhI0lMG2MiPGE4P0lXbf2kDOa6i?=
 =?us-ascii?Q?tKgzt0Eu0vyjXOxwpVVk8tAjmWj0AuBKJY5i2hUuS+foTiyMvVVG2RAg6+dS?=
 =?us-ascii?Q?RtrJMGCz6EDI+LdhMDRnJ1CnH4BonaaGgwPTQoFGzvba5s2R?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c547451d-bb5c-41c8-a994-08de6392d7cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 02:12:26.9698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+pSvmYA0+inz1328g3zGVv3y3LHrivWBVf/5gLnUcP7T9s2Jy8tiiutfRt75RoT8ulzXJOr8loB/RaZucOi8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10568

> On Tue, Feb 03, 2026 at 05:14:59PM +0800, Sherry Sun wrote:
> > Add usdhc3 to support M.2 SDIO WiFi on i.MX943 EVK board.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx943-evk.dts | 63
> ++++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > index f54404c9bfc9..8f4f6875d036 100644
> > --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > @@ -20,6 +20,7 @@ aliases {
> >  		i2c5 =3D &lpi2c6;
> >  		mmc0 =3D &usdhc1;
> >  		mmc1 =3D &usdhc2;
> > +		mmc2 =3D &usdhc3;
> >  		serial0 =3D &lpuart1;
> >  		serial5 =3D &lpuart6;
> >  	};
> > @@ -54,6 +55,33 @@ dmic: dmic {
> >  		#sound-dai-cells =3D <0>;
> >  	};
> >
> > +	reg_m2_pwr: regulator-m2-pwr {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "M.2-power";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		gpio =3D <&pcal6416_i2c3_u46 2 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		/*
> > +		 * M.2 device only can be enabled(W_DISABLE1#) after all
> Power
> > +		 * Rails reach their minimum operating voltage (PCI Express
> M.2
> > +		 * Specification r5.1 3.1.4 Power-up Timing).
> > +		 * Set a delay equal to the max value of Tsettle here.
> > +		 */
> > +		startup-delay-us =3D <5000>;
> > +	};
> > +
> > +	reg_m2_wlan: regulator-wlan {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "WLAN_EN";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		vin-supply =3D <&reg_m2_pwr>;
> > +		gpio =3D <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> > +
> >  	reg_usdhc2_vmmc: regulator-usdhc2 {
> >  		compatible =3D "regulator-fixed";
> >  		off-on-delay-us =3D <12000>;
> > @@ -145,6 +173,12 @@ memory@80000000 {
> >  		reg =3D <0x0 0x80000000 0x0 0x80000000>;
> >  		device_type =3D "memory";
> >  	};
> > +
> > +	usdhc3_pwrseq: usdhc3_pwrseq {
> > +		compatible =3D "mmc-pwrseq-simple";
> > +		reset-gpios =3D <&pcal6416_i2c3_u46 4 GPIO_ACTIVE_LOW>;
> > +	};
> > +
>=20
> put usdhc3_pwrseq before @hexvalue nodes.

Thanks, will fix in V2.

Best Regards
Sherry

>=20
> Frank
> >  };
> >
> >  &enetc1 {
> > @@ -760,6 +794,18 @@ IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
> >  		>;
> >  	};
> >
> > +	pinctrl_usdhc3: usdhc3grp {
> > +		fsl,pins =3D <
> > +			IMX94_PAD_GPIO_IO48__USDHC3_CLK
> 	0x158e
> > +			/* Need to config the SION for CMD pad, refer to
> ERR053138 */
> > +			IMX94_PAD_GPIO_IO49__USDHC3_CMD
> 	0x4000138e
> > +			IMX94_PAD_GPIO_IO50__USDHC3_DATA0
> 	0x138e
> > +			IMX94_PAD_GPIO_IO51__USDHC3_DATA1
> 	0x138e
> > +			IMX94_PAD_GPIO_IO52__USDHC3_DATA2
> 	0x138e
> > +			IMX94_PAD_GPIO_IO53__USDHC3_DATA3
> 	0x138e
> > +		>;
> > +	};
> > +
> >  	pinctrl_xspi1: xspi1grp {
> >  		fsl,pins =3D <
> >  			IMX94_PAD_XSPI1_SCLK__XSPI1_A_SCLK	0x3fe
> > @@ -802,6 +848,23 @@ &usdhc2 {
> >  	status =3D "okay";
> >  };
> >
> > +&usdhc3 {
> > +	/*
> > +	 * Only enable SDIO2.0 mode as the corresponding GPIO pads are
> 3.3V, the
> > +	 * max frequency is 50MHz.
> > +	 */
> > +	pinctrl-0 =3D <&pinctrl_usdhc3>;
> > +	pinctrl-1 =3D <&pinctrl_usdhc3>;
> > +	pinctrl-names =3D "default", "sleep";
> > +	bus-width =3D <4>;
> > +	vmmc-supply =3D <&reg_m2_wlan>;
> > +	mmc-pwrseq =3D <&usdhc3_pwrseq>;
> > +	keep-power-in-suspend;
> > +	non-removable;
> > +	wakeup-source;
> > +	status =3D "okay";
> > +};
> > +
> >  &wdog3 {
> >  	fsl,ext-reset-output;
> >  	status =3D "okay";
> > --
> > 2.37.1
> >
