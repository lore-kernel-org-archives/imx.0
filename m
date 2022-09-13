Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331E5185F
	for <imx@lists.linux.dev>; Tue, 13 Sep 2022 12:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTJwNqxZ5q4nseYNsM0l7qEB4mOi3aiV8q4R/XHZxME5a6yWBWeZS0/v43KqE4M4hqb6/5fNl+OxvfjqDz8T8hc5HeZQwh9T/stzPxf3p1EQhUlVISBGQXhp+W0Y06m+yZpwWNLHnBhJ4ur24RFFYG+Te5EBnwiwkL3iUWLm4VP+cBJnusqgzzP0csi3br3qGRK7Gz+mii3fnUlWeCjL/3RrnWEHuLbFKEmq/qZ3ncXcJmerJ95mGt3TrWjV7nGecbZeuIAu+s+MN7pEjY2GEVycbopmKIVRJ+rtYmnyGVzPhlfjMbpc5YU+TT4lq/SLx9IrARwcIjzvd5CuP2QcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmYAI0FUednDeD34KXmO1x+s/M8w4EeFqWyT0GOQpXA=;
 b=Vp6P/m/6YUHzAIJhvOdSSaOAKQiwcUVQW1DDS3nIXwPjtkc2opOpgxokiUT2499a56iUy1JBttySxU1GSMXRkvW5hok54XR09UsjzqisM9zdzge7dFkzSI3cGxdwbNyKOehZkpq6uz2yzIGH+JoP52bjZ2DsOAbHbkst725cKKyKNYGPbBF8gtKIMQqzYUsu15XgDrFQG4bwTH4eGAmxMswkRa3hQy6S8Q+Y8CuOnIRGjaw8a8H9a/WsxlHgKl2ZjIe9O5NxBDCK+EOlSlq5um/1ISsIEglfD+FcJNR/naIV3v3DCISf8N/p9IuNA2FKhhjlmI7Jw6xJz4emCo1S9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmYAI0FUednDeD34KXmO1x+s/M8w4EeFqWyT0GOQpXA=;
 b=fkRZBravI6jh9TJ4GM1SXAl9LeDtfRVqbGX1j8jYAR9bQ8CIRwqG17eUW5ypOgJZ5I7r+HheARhYQ7GLOOwpBGBe7tt3Jru6XXPvHZfnfNYXk8/82Dk2SI3wiUhqg4aallEFoFycAxsqYGYr2YiVai6KoT8Nsf92dD8ZGaChWUg=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB9269.eurprd04.prod.outlook.com (2603:10a6:102:2a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 12:39:37 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b152:60ce:3622:7962]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b152:60ce:3622:7962%5]) with mapi id 15.20.5566.021; Tue, 13 Sep 2022
 12:39:36 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH v6 5/5] arm64: dts: freescale: add support for
 i.MX8DXL EVK board
Thread-Topic: [EXT] Re: [PATCH v6 5/5] arm64: dts: freescale: add support for
 i.MX8DXL EVK board
Thread-Index:
 AQHYtlAgdVQnsa8uOkGgg6uKMosVx63NI2KAgAVTviCACRxCgIAAZ46QgADDfQCAAK6j0A==
Date: Tue, 13 Sep 2022 12:39:36 +0000
Message-ID:
 <PAXPR04MB91850653F39FA2E2098435EA89479@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20220822175245.222691-1-shenwei.wang@nxp.com>
 <20220822175245.222691-6-shenwei.wang@nxp.com>
 <20220903034819.GF1728671@dragon>
 <PAXPR04MB9185D243324279DD80C371DB897E9@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <20220912081649.GR1728671@dragon>
 <PAXPR04MB9185F52BA6FEC47E6412EB3C89449@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <20220913020708.GE1728671@dragon>
In-Reply-To: <20220913020708.GE1728671@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a39e7996-d4f6-4034-4ffc-08da958504b2
x-ms-traffictypediagnostic: PA4PR04MB9269:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kgjL9OcedVL0M7S7UyMuSmyTDipP7xnpgrnvG2A2cnzgz80Up82ZCErloNmpJlzL9rzSHsCUkMmA5VY9e1UW/BQJitC5DJb2me2UipdRAT+gASQYsctFwOvEr6aEz3v87++SlDrUEoit2utkq+Ug+izYB2zzXHTqqBYvDENdryVd/S+YN+ILZjX7ZVuVmJ3Cy66RgnyP5lzWv1D2ML8UJN/zZ1drL17ca0STdBHyJH682mSTQonD5D0Ljt+i4BKEmz14Oo+M9kbXPTIFI5UOKgz2nPhW9zjov/oBq9VxlrxwfBGwBVkEmaW6Sh8yhE6EBLZQFBa0SzucAgZAd6ntYlCR9/B/xyBvyTakhYRPjWw0e7/P6qQYgLngKzYbGwjQIFfOmutEgA8EBPHTd/RUGjjeuPhzGtG3GPOGJ3dXowybcow02agmrhz0I1GE+MZyd8jg0G0sjN4zHLEn4GVO/AyJz12shTYelDYa/BcqaTifwpuz3FxxjkE+6/K6PBkKs8dBcG1CWv6F2vY+au7hevLAmqvuTxAC1OkJAgcfPOFxh1TK7O+H6wMlh8ogAu4jci2E1NxUO/JrZQoTOh87q/ii1eKYA6Bbg04UL8YjOnoEpvEt37FajO8uCkCTe3ONLKyDd0NTd4O/wuqHcjritDBsLhjIDr7kNNdEK2zNCP40qX4TzcFccR3vvuzixQRuSGs2AptESgYmRWiM8SeX5Pz2mVr1mJRP2+Hu/0HYTf+BArtD07S6D2GQBiFFu0c9SkH2ASXwKBojK1j7lZgRsw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199015)(86362001)(38070700005)(41300700001)(316002)(76116006)(38100700002)(122000001)(53546011)(9686003)(55016003)(44832011)(52536014)(186003)(83380400001)(33656002)(4326008)(66946007)(66556008)(8936002)(2906002)(5660300002)(26005)(71200400001)(478600001)(54906003)(8676002)(7696005)(6916009)(6506007)(55236004)(66446008)(64756008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PkFkDHbfiWJZvu9mf4FJpXD+a1KL3zzj7bSTP7C6N4uejGuWhTNmy9HHRrQv?=
 =?us-ascii?Q?9AuykH+2lfZriQFq0bvoCoexZ9WNSyvI4ys0g1cgRJv8tJFL/+6brp+Gtqeu?=
 =?us-ascii?Q?wJdP6ZVVl/lhX2pRRUHXO2WgIL61JIY7+lQ5hALrtjaTYK3kMk7pbbWdutLR?=
 =?us-ascii?Q?jccILmCVAg/xPUGQ7Fe/gvOL7uMhRZbVRspPiPxIjaza4o+2sWodpYQ5vc+Z?=
 =?us-ascii?Q?XVCkFecZNHJYVYGtO7Y3Ta7qe0mZymeyqLw3kdmedfrFkVP5Wa9CvPhbV9Jp?=
 =?us-ascii?Q?mLJiaDodtYKPcdkCiWiOAnnaXgVRo2ZRFl8jPl2/vfMWG6CkAxdeM9kOSZ0U?=
 =?us-ascii?Q?mbBMV/vkxeMWJ25iJWy3hra6Oyk8cTZC8RxRUAoucE26++DOXdB89gFopjRN?=
 =?us-ascii?Q?igjhIJ/DtNMNUVoXsbFi8LkzEpqN3HGasEMFmK3GOt1BmIxEcKDT9SygU/YM?=
 =?us-ascii?Q?/o4R2gj8FlqQnV0eXyzi0b9WlT9ilJmdXpPU3A0o5nDtZKW51jcIWpC7o4W6?=
 =?us-ascii?Q?sNay7J0wuzPusvHbFV1KGaDyKPKG1Agvi24AFYeW4Rsu2K4kpoy06POejt/s?=
 =?us-ascii?Q?mXLGUEFgU4vLkE+f3yZkjmGws5bzeHxpczucYyvRf8+z6plWu5Zv6KAMJgKk?=
 =?us-ascii?Q?AE0iW6O/o05gEOxcmvBzlxqviJDS611i4ZksJtnpxz/b9lFgxhMgo7vrjFUJ?=
 =?us-ascii?Q?FxZjwkPIyuu/kXFTf2QpIbqljkPqYlDprjcPOrH96kFKJ+0E5aL1L8GT5dNt?=
 =?us-ascii?Q?mlyUTD4H0MImU7hxzRTrjfCddJ2WdGav0vSZ5/KxVDYRBaaQtzLiWHp+wZBF?=
 =?us-ascii?Q?wa+55cZtvh/5jYlpuIwmOhruR3O5gCRuxqc7o7YPSQ5+nJ2R1K9YiXpOvHkc?=
 =?us-ascii?Q?n0jj71JK2ADIP2CO2c1Pj3++mktuBgu78kQUHDr6GlSP2Vlhpt5I5Gf4jiWE?=
 =?us-ascii?Q?ZWglectNm6EpzDozg3wp4lp3uhcdBln+3QgQD3xJx7D8SvxGOwQds9RixXq2?=
 =?us-ascii?Q?1bKu/pSnwN5jJyWz8Ap59akHem/nvNjPtRBJvdb5uy6y3dewPha1Rq7VK829?=
 =?us-ascii?Q?9wUYLr+6BkrMTMRkHpAngJZkOn9pHokSq+a3w5jK7iNlCEHQc92B8llUQNmf?=
 =?us-ascii?Q?OFlrSYkCR+C1eUp1dvL1tLWJ1OTqE4kbQnmS19T1VQKTjDpcgEXHjodjLM62?=
 =?us-ascii?Q?vXb+pL4ImAP5u85SuwQp95M/OZM21s0OvNvSW8IcbsfG9RqHByqeORULqJnM?=
 =?us-ascii?Q?D7la2yebyQzzWjNTSyX1fRTm9prjxqPFtF++EUTPRx4+ZV2Pwl9xRLJ6HVXg?=
 =?us-ascii?Q?+ru/xjHNQUabLTUFrNJWcDB2EO7UZdh5eeFe/B/LR100XONG5Jjm4GAfgD9p?=
 =?us-ascii?Q?8s5RrnBR1mzFziFbQLtUQnUMnaDVDxRBgcoA6n6qA4pW/2VWvkNQoDkm+05G?=
 =?us-ascii?Q?pXFn+pp+rjW25rn0CtguKyoJPsaP1dGAN6713SRbV8819DZ5yoW7+1Fy7OSa?=
 =?us-ascii?Q?Vr/F3KEz6fl5ZrDEVQkZdYJ4Pxv66LJFEN63j1Ml71snCALLoo8IoSA+F6sV?=
 =?us-ascii?Q?SD0m1L4cZcPCRBZqM/O5+rMQ4YLawUlhTI3E+iJQ?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39e7996-d4f6-4034-4ffc-08da958504b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 12:39:36.7861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zkzDwhwEfxtPna1+tezwVFID23xfYouGDKyx3ry79uXSkbDNb3KAbjXRLWVcOWy6Vv+sYZllV0F4pDJqPecvtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9269



> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Monday, September 12, 2022 9:07 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Sascha Hauer <s.hauer@pengutronix.de=
>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; imx@lists.linux.dev; dl-linux-imx <linux-
> imx@nxp.com>
> Subject: Re: [EXT] Re: [PATCH v6 5/5] arm64: dts: freescale: add support =
for
> i.MX8DXL EVK board
>=20
> Caution: EXT Email
>=20
> On Mon, Sep 12, 2022 at 02:35:18PM +0000, Shenwei Wang wrote:
> >
> >
> > > -----Original Message-----
> > > From: Shawn Guo <shawnguo@kernel.org>
> > > Sent: Monday, September 12, 2022 3:17 AM
> > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > > <krzysztof.kozlowski+dt@linaro.org>; Sascha Hauer
> > > <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> > > <kernel@pengutronix.de>; Peng Fan <peng.fan@nxp.com>;
> > > devicetree@vger.kernel.org; linux-arm- kernel@lists.infradead.org;
> > > imx@lists.linux.dev; dl-linux-imx <linux- imx@nxp.com>
> > > > > > +
> > > > > > +     reg_fec1_sel: regulator-1 {
> > > > > > +             compatible =3D "regulator-fixed";
> > > > > > +             regulator-name =3D "fec1_supply";
> > > > > > +             regulator-min-microvolt =3D <3300000>;
> > > > > > +             regulator-max-microvolt =3D <3300000>;
> > > > > > +             gpio =3D <&pca6416_1 11 GPIO_ACTIVE_HIGH>;
> > > > >
> > > > > Missing enable-active-high?
> > > >
> > > > No. Enabling this regulator to select the fec1 interface instead of=
 usdhc2.
> > > Pulling this GPIO pin to low is to use FEC1 interface.
> > >
> > > Then the polarity cell should be GPIO_ACTIVE_LOW rather than
> > > GPIO_ACTIVE_HIGH?
> > >
> >
> > That doesn't matter since any GPIO phandle flags are ignored in the nod=
e of
> "regulator-fixed".  The final flag is only determined by the property of =
"enable-
> active-high".  If there is a "enable-active-high", the GPIO line works as=
 active
> high. If no such a property, it works as active low by default. Right?
> >
>=20
> Well, we are talking about the correctness of DT (hardware description), =
not
> how kernel driver works with DT.
>=20

So the correct syntax here is: if enable-active-high is used, the flag of g=
pio phandle should also be configured as "ACTIVE_HIGH". Otherwise, if no en=
able-active-high, the GPIO flag should be "ACTIVE_LOW".  Is my understandin=
g correct?

Regards,
Shenwei

> Shawn
