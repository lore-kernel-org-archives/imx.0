Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A780281368
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 01:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772154688; cv=fail; b=aZZB1VpV+nHnNKM4LAhm5kHwYpvjjknQv1Hl5D9MusN5mzhyjWwxq33bTHviEq+hgWGVQtg+/px8CQwZu8um6K93EgQlA9Nmb0F0eXcnWFPZb44CZRuBY8RI8uOgoRTjPLjSJEBl5ihjJSD9LXLCCfcNftNLaRURBtHPhsaFoTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772154688; c=relaxed/simple;
	bh=q/T1+0UpcT1ECdjNYT3vM/CDoc9Jbl8NeiTw93H6RnQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CKwWVQC5ddIX2aQ/P4VLCc/Px8w6L76if1/04BDUFABxs/CVGhPbncbDUfWX74xLs2RTFK9HRL7diFlttVAF8J41NJF67OuFpxn8Mii9G0zIvqsxsg2DJBxgosc0r1ywhbpQS87nZF+iYIgJg542xOTP/9lDMzaH8YMUdaY8GkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U6Y5i6LQ; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U6Y5i6LQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWFgZHCwYZrODkdPW/sgp32+22NM4JO/HYbmNsXc946xfaCWK5qRuAhXkzZqEfstxuJXEzXmIFPogBuKF4Ee+ViqjngGAceLpAAQye/O7NCwKQ1PbDYvtYfv6hrF+OsR6SNgvG7iNlqhFHw6SxjWB7amIRFEAcU3fQKnI4U9YXHm+EHyqjzGjUoiyh5riUGcl81V0EfpQ8M0WHP24sQu1rpOFBe4iox6kU71VIcwhRzJz9k1/GhYfQyEs6DhXcxUdwfa5m49hY2C0rPPuY0woX8hFBx5GdJ2neW/qC7jc17rTRD5HdkIdBvSbsCNC6D8jIHHs4HgfxLzp1alnwHr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C60YI6O3+0xtqc7Vk18COYPF4UzgV5YLIW+9X6DITZg=;
 b=Eb0/5zpVAfve3dkS+AyOG6sr/tk/t6INt/A0IXJs7ZytzhXDPL72MH1m2o3WB05FmBsJWsB8u5EGqG8am64a1vwRkEQyWYXpqYgUgLIR5aUtPKQbrqIGWmqTMdAHP08VIWwQ81aos5av+IpaB2xv+mCgmYJeWJM4LS2VC8Thgst5wvW1dwF3JtbwYOKEmcYy6Engk68YhqW8qDRaoKeyvgwbarsifCpWDrExqQH/QA6cSBhDOpod9b26wrs9yueyJ2DPWYpW2TmtHBof9QRLHqCjja84uWAxBs8nZscEFhTCcfnbw29tknLpvKrJWjO/G3HiU2AJRi8bGXBsVMlL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C60YI6O3+0xtqc7Vk18COYPF4UzgV5YLIW+9X6DITZg=;
 b=U6Y5i6LQr1Y7+nuTE58+Zb46B8DPgPlXPoPXTLNVJqc1hZdMRfBCeMQLmWEuNB7S30pq6D9oEz37Ymr3J0VA6CvBR/XNky/eFBpKuKmj1FtjSe/XW3ZRDOjMxCO+LqSRnDL7Aggs1di7OaXsgPx7k+mnAJ0T3ou1jfuVLVVgwjx1sAg15bCTkHbnK0yi9qOt4ARMLBvK87QUhHDOnqftybBWsgkvG5HKh3D5AN/+Y/T+BpBnhqdjFufxTPSOhf+w062Pefyfm4IkcEH4R13WoHaaZoR70KsR5BG2iOBiTun04l/msET5PpAZvRgQuSSva4sP+w86mrvCoo7+1Bjt3g==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8310.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 01:11:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 01:11:22 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Conor Dooley <conor@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: fsl: fsl,imx7ulp-smc1: Add #clock-cells
Thread-Topic: [PATCH 1/2] dt-bindings: fsl: fsl,imx7ulp-smc1: Add #clock-cells
Thread-Index: AQHcpw91tMRf+dMmaEW75ETiJOh/rbWVTnWAgABsCsA=
Date: Fri, 27 Feb 2026 01:11:22 +0000
Message-ID:
 <PAXPR04MB845967E6B2891D210B7528948873A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260226-imx7ulp-v1-0-3fd611ceb346@nxp.com>
 <20260226-imx7ulp-v1-1-3fd611ceb346@nxp.com>
 <20260226-writing-deviation-183872d04d50@spud>
In-Reply-To: <20260226-writing-deviation-183872d04d50@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB8310:EE_
x-ms-office365-filtering-correlation-id: b205c361-026d-4712-c670-08de759d1f40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 +UeeC8OVXTL02laPoVb8+G8KiNSt0aCxb1bvsu7GORysrKN+BY5jiOIpcBHtYp0evMT40CHfQyOu3wCj05VqsuI1bskn65XBmP+xeogkkWcYS7wyBXY+jXhhGvUHoav2USy45sB1G4OLKw9cJrW5rmspATM+RMtKTXLvPlPMtOIm305rwD73SbRrJh4Nzng78XfGfcplyMrVPRJHkk4OSweGkbpS6JyeggpwS/TNpoeegLIy3z9ZcGpMUUUWxPzevPT1nFlxdMZ99Xm2Tx86G2qDsizHEGqTK7Rc/ANSliLvd0a1iIRVlB73O199OLKTuVwbLhtbCa+lx8Uc3hjgu+SkddmLwgk/EOyq7oSJZt7DikAqZEbI9INqBS4cFL/dOOwC9Xl5TZ7snZsd20kzqN2BlGqfalCT+ndx2xXX72t2MDHKyPXsedYVmwszZyDawlnfgwiyvZGNWDkPfWUDh75gXESlUcRFcHhH4MkTiw9Iz6/Lg2hUI8HoQS8XbJEcy5AUecdUV1OzWDVIYVF7SQQZV2YYJVu8QplOvqKhSlqwyDMIjAAji2NvlDvPYOYVSbetqlsOto2eTOiiDvld8SK/dfDu72B8pT76nK+ATLf/Hgfwc2QIArjivHhay3GJKVGF1ohOViWKJdD3+MOhto75ma3hq3h4y3x7XVswi+bFVpm1wBQQBWPv/Jmz5hOEWIbB1Yk6c+f+si+Jpw7zXTOrnUiaEW868QZdvGaEMbJIbynAnV+tF2VXtkh7kk3MbOM/AyMhREEUTghTKipU7pzenWrTKGqVvwVFbCJw5nQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NNJhFrrag/xlQOHg6qZwXeKGucYnh8/V370dyNHdqfvFBFUgjICxIXLZviwt?=
 =?us-ascii?Q?Qn2n3PkTolPXt3zHX3tEUea9CJkLvhpyqnZiDMrOSy4eBXPstaXJ0rbLQuno?=
 =?us-ascii?Q?WAu/OaOkNVz37NOAxMAH8XDVo10H0URax4amkAr7EUgVqSlaCDcrA8t6AOu3?=
 =?us-ascii?Q?MtPffd1qyw4Lsi7c2/Ri67uCAbvV4GLEiZU4Av4+9GJVnxHdck+UylwdNcBM?=
 =?us-ascii?Q?Kgt83gE/I2GoQCy4pBTt+hlUQaX8gtDbPkw2HFuhtUkyFwA3CKqLm/B2FXLV?=
 =?us-ascii?Q?5A2MJ0/3fec1vuaGstbqFfbpXKBEgeP6p6WN8qpdGTF0H9VC2q9n0Oszd9ef?=
 =?us-ascii?Q?CSM9pNsxnq+S3noCB3lvz8VuwluopOFqHBvTIf77xv5OEWhB9OyOUxuELVTq?=
 =?us-ascii?Q?corVW2eg38Olr3jtUyA3a/xYMbZPxcziSVUJW208B/Y3vYHom/tUV+/WHAPF?=
 =?us-ascii?Q?bjkhR7tZY+23BgElDVediIXdWKR/7bqGYJulmjGCfMpdt/meojYejimMMxvb?=
 =?us-ascii?Q?lm3vodrcg2WXTtjZ03KICgDr9uSv3ScpPpbB7BZUCwBhH1uvajcTq7JpPLsP?=
 =?us-ascii?Q?TTRl8XoYc0AXtCmYskIu5AgDiZbOgXD0oAqMEr8NW1qxgECZHdkv5w5Ii9gk?=
 =?us-ascii?Q?WpDYy+FnBb8BkJs10X8+UciqqXTcL1v9nFxGezrmynUu/PQIBW+NrCZ+SfQ+?=
 =?us-ascii?Q?0uQdwOH790cLFxDkkZ7tf+O6eJWkzyX0Iz4eHoJICeqf50XVSNkY+vVq6IUd?=
 =?us-ascii?Q?Tpym0GA4DcUTRPuwoC5AXEoPJ+Ev3pFbJfYZJPjKdgLk8vorHMm2qwYn1qXt?=
 =?us-ascii?Q?BZQjbi54C/sqfsq0jFEV+poNeORLGCkg6jA23NxB4TqYMwn1s/5+iEv2b3y+?=
 =?us-ascii?Q?uJnFG2ruxOuC9HBDFak2j/ooWSRfWUgc/4Lt3zvZiH3FQvMtTeMh4cEWeLqV?=
 =?us-ascii?Q?GdQ0B+JJfWCS/d5Xqb/OWBsmB29+h2y+SIqkoU8p/i89qe0cFuCfvy/WwAGD?=
 =?us-ascii?Q?hfbQvUNXoJ89jonynqCBwCsm/zkoONQf/GiZ0vy0WfdlBfishKm0pek++Jql?=
 =?us-ascii?Q?51jBcmETs6uPvraCoA9O8MRek+SjCbTXD5IcCAUR77GWJJlljc7gtgP4CJ9t?=
 =?us-ascii?Q?9BYQpZLxW9oUilH8u+WH5MV2x4Vq3Z8l1zyX8wicMFT/QZmYplDU2LduP9pC?=
 =?us-ascii?Q?+49VWv+a1f7mDongW82ZYilRR50OYqlmIyLAH6+zhzfCULFD7Jn/CPJtCbjw?=
 =?us-ascii?Q?x5OCV/Jh5Z0iq/FtNNUI0MbGmsGJ2SCbJLffZpXCn2mwwpt7TfE7oy7nJS61?=
 =?us-ascii?Q?3JqolZqJKOXYB0nnPjVtKnrlYDXIBBDf0ojyFW6oVA81+si7LjJ1ugiC6dw9?=
 =?us-ascii?Q?WtbEZJ1raJLc8h2Qps0LAfh4yi+t0+4rCmfx0G+B+z5eH7f1QagT7TH/f1We?=
 =?us-ascii?Q?t+D0uuzGsAxsbxzDY2MzdbS2DOj3K7b4R0MCPZ1c6lq8+AWDAmKap95xYPbo?=
 =?us-ascii?Q?bNuSwwKqZRRj3htYXkokyMCOigXUe1QwIOfCOYAn8uzuoKSDGeuY94mHJj/C?=
 =?us-ascii?Q?s/wm28eGlfRsOdCn/XMKshmqCPAP857b4Iqc1cyme+UWDhYxVqGckvr24BpZ?=
 =?us-ascii?Q?rvM1Z2WHgnlPU3Zdxk/ronyixE/n7wc/5pyubLenpFWApFsEHHLh1Q6u8Y4U?=
 =?us-ascii?Q?EphmR35tzYSiOymZsdhBUXCxNvwDFo55M6AMkC7kN+rvAVLH?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b205c361-026d-4712-c670-08de759d1f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 01:11:22.7280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVmjj0hs3/gEqrfs8xIFDR4bYueceO0ApHylbyJ/N/PU8Q7t3p03m/fkGaTEuwjcFPkzToevhqMskE0JOQQB/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8310

Hi Conor,

> Subject: Re: [PATCH 1/2] dt-bindings: fsl: fsl,imx7ulp-smc1: Add #clock-
> cells
>=20
> On Thu, Feb 26, 2026 at 07:04:15PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Add missing #clock-cells to make it work as a clock controller.
>=20
> Yes, that is what adding #clock-cells would do, but why is it correct to
> do? That's what your commit message needs to explain.

Without #clock-cells, there is CHECK_DTBS error, #clock-cells
was added in imx7ulp.dtsi, but missed in dt-bindings.

smc1 supports run mode control
00b - Normal Run mode (RUN)
01b - Reserved
10b - Very-Low-Power Run mode (VLPR)
11b - High Speed Run mode (HSRUN)

This is taken as cpu clock settings. When set this registers,
the cpu will be configured to run as specified frequencies as written
in patch 2(OPP table).

I will update commit msg in V2.

Thanks,
Peng.

>=20
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-
> pm.yaml |
> > 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-
> pm.yaml
> > b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-
> pm.yaml
> > index
> >
> 9d377e193c123c7de0ec4db4d4a649ed966b2d9a..7ad470260c0d08b
> d1e7146ef49e5
> > f60dd6c6d4d7 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-
> pm.yaml
> > +++
> b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.y
> > +++ aml
> > @@ -28,6 +28,9 @@ properties:
> >    reg:
> >      maxItems: 1
> >
> > +  '#clock-cells':
> > +    const: 1
> > +
> >    clocks:
> >      maxItems: 2
> >
> > @@ -39,6 +42,7 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > +  - '#clock-cells'
> >
> >  additionalProperties: false
> >
> > @@ -47,4 +51,5 @@ examples:
> >      smc1@40410000 {
> >          compatible =3D "fsl,imx7ulp-smc1";
> >          reg =3D <0x40410000 0x1000>;
> > +        #clock-cells =3D <1>;
> >      };
> >
> > --
> > 2.37.1
> >
