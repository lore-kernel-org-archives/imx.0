Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA5D324B10
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 03:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768965535; cv=fail; b=l6kg8MG6EDWhKUgOSpCBDyuULIPVCypac/vViwcWP8T3wcFtDBF6geQEU6ZvO+o6lRzfE3J1qL1QY/0wrJaPzwE/e+3kh3G/BRDwEQDX/JmVkL3LqqFZDvilGE5ErlBTKtjZ4IQpGVA6sl8vJ43RjjEwAasBci8xmo2twCQLdOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768965535; c=relaxed/simple;
	bh=KBtnFCoHVIL0JgEndJOG9zeULqp8jgn+2hv/Mhy4THs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qUoRQ9wvRMoo5u30WThVv2EdWaTAXNTBnF6TqJ0NS+TBVISbAGKuC7CLCOXxClS83i9jzNlmsxeQ2dm+nHbNSdEdzJOUre5mJnb87S+aUwDl6ukalxAOLDuYW+z1lyMBvMslz0K1rCGAt6M9K3ko40kMaX56jPWJGobBU5tSbjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GfByMygT; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GfByMygT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urK+OENQVa9Kz4sIhBZIgEJ3F3+kq/5Z6xtpgVn4a6Y4IcjncySt2EzbK6Rfgue/2yPMoEwp99xmya8hH7RzX+I5GDYGB6GLvNPHVHkYi8m5UwVCKst03A0CrQjxpJY+D+14D6zMd/LyOVbigyVNzoUJus9UNUxtE6VjN/e8JnV4jUuMQYFr5KPiNzi0tEx7OVFmrIBgve7iAzawmOA2RaEN8Gmi6b2sX8kImMb3BsL0p4kBz1YqBKYc0bJU8qQg9h6Y4gjZ+S8iCOtBRzZdicVGcHnO68MumfdWStvmt60F91j3hYixGSdqE9/8cql/PoGsVrwJt1kb4q/kZLQADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igLeyTsdShAwRG+FmbRm7Zf1P7EqZyStLSiLfJPXMtE=;
 b=p6tRPZKy/9RRPoxN90keHVXu/MXANWdlyu85jjOp6S88KnVoC6MqKbV9//C9b7ICy2OGQ4kZbRSqcgLt5Tp8qRatHbD8MaHSySQvrc0D35Q1aXhmikjs6ygYSwz6eHRZ2QNpunJPlC3cH5fyg8UhobchcnwsrCS6Ehn1VpB76RTaAgiF+SepppIfQThcGHA/XRakIKQGQOGFRafOrTJHA9Rqpl1FM4NjmM2hspS0ERUJyIgSk0D66CxasuMYIM1M7ytbJkq2gxcCwtS1C2tKz7BHYbOn1IlGJMtCp04A+f7KwT+y2b8BLRJS3p215/B1airwap6S0uY4dAtw8n5NIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igLeyTsdShAwRG+FmbRm7Zf1P7EqZyStLSiLfJPXMtE=;
 b=GfByMygT8n6ykZMHR/C4+Jx2dSypYX3EFqxvQ/yB2vT5Bil2cPkFI7SBxbWxHl04wqjFp3BiAlF7KJvJhtx7DgJ30o9OPq5VUiTwAfb0l1oag3TRKBPJW0owGIHNx483D/1VMU784JelBrVYIOtDyJFWpQGuBRqubKCxm8juFBAPVn0lFzl2hH+n8RoDP5MJrvVnXlV58liufyFNabiMqqILpuAdHuWTCm0LROQPORb/2gPYstxT3VbW4FYKHVMvi1v4ugVL8ergNSbygOn+cC0Cyc82j05C3kJF7wJHakIe9Bbb0O4kHZo3kyM0idhMbV4uANssbrUFKGAuMQZwsA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAXPR04MB8491.eurprd04.prod.outlook.com
 (2603:10a6:102:1df::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 21 Jan
 2026 03:18:45 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 03:18:45 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel Baluta
	<daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Topic: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Index: AQHcifdNxgpxUKCRjUq4wrVjC4rAhrVbQV4AgACxmRA=
Date: Wed, 21 Jan 2026 03:18:45 +0000
Message-ID:
 <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810>
In-Reply-To: <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|PAXPR04MB8491:EE_
x-ms-office365-filtering-correlation-id: dd097457-4372-49ea-3c2a-08de589bc97b
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JfCVlxiwSEbuF8y7FFESFcJSftDV90Er0VGqNssQZ9yAytqqB4YgfB2H/DWf?=
 =?us-ascii?Q?R5zqFWg9Io8tyHfkig69IFa2NC/HEsh49B7NyKGJbmAPz62Ax6wHeL27QWgt?=
 =?us-ascii?Q?mkwZ0IkLyZjr8xOx4AEbEQTDh3D3LGDYz3ni6gbAKABP31KYZumv6wGSBCqm?=
 =?us-ascii?Q?vErBff22bTwsiEa9eQO1vANNkMu4psljmreehHk+5q1GrcRc9dKfCmvISmLm?=
 =?us-ascii?Q?R/G8zdtvRGLlnAnlE533ShCqBQRAnoqyZLpANqy3aiWkE0dXMmtbCM7j5437?=
 =?us-ascii?Q?1iiDPHGaJJpFU16NG0s793cXtL8UknlxxGCIRVGCsoYEnh6eaRz1csGJ/rUC?=
 =?us-ascii?Q?O3++b390KrU+fBhnLPEjUCXZ4cZo2S+tO9CeozI5jUAMcMOLmXAlumvGBEui?=
 =?us-ascii?Q?BpgpIo0LIbfBfUlldoY/GDqlpBJ6eby9WKFhYsFOWIoS3eB6OejbQhT86lFe?=
 =?us-ascii?Q?l3e7xs8Ijn6l0iLp6uATbn7CKRS2OsnPGbLr3a6BSB4C+D74TIn5aVxSSKUc?=
 =?us-ascii?Q?CTbzXAhw7XlP3wUhlxg3SC5xW9cv73LG+U3E5i8a/TM26TUl9Oy30B/f+FMT?=
 =?us-ascii?Q?kBEdwcOUFp6JdiQyh5LIDjMSd69+rSJZAfCxEtT5PQsjfA84YqK0TcRbLCcP?=
 =?us-ascii?Q?yn4f1k/SU1yzxqHSHLLbTmpUkPsyGxfv9if+2f8+dGW58UlUeaPdxKvCsgFL?=
 =?us-ascii?Q?iZ4NbgE2W5DLHHIx9cBocn++DYmsD8R2w6BHpbgDN6Dn8SEPyySfa0uvNLQb?=
 =?us-ascii?Q?MS0y+Y56aedafVPk6xvCJ70mGI1fFK9eetRcz8jjeN7H/UPJAkVin5GuFWuh?=
 =?us-ascii?Q?5Y4O6wXoDpFnL298tDvHlmA/lqD5kADPOKdZEb+c44DS0qTNQl5mhd/PMqWA?=
 =?us-ascii?Q?t+Z0Jc47T7fs93sANKLv3zdpVT185WJNCZsDQhTe0KloHCI2z7L3E/jFjaHZ?=
 =?us-ascii?Q?Xa80GWTfLjJnzPGWNBThLhMyUJo5MAKWeJcSm38dIT08Gco1lsLPxI/jrYs/?=
 =?us-ascii?Q?vUZI/8Q50SNM4jNQ5M+d847UjJQfhl6MLTAFVsWMpVcHBmPVrIU8WlUEJ6dN?=
 =?us-ascii?Q?JrUJbjvTeopQ3QCqnbOJpoCgO7VE8ZyUavQ1Um0XDuRp/1m7Yu2rWEFC8Skr?=
 =?us-ascii?Q?js4mEvGIycw/DJ3Ilj0rdOG9ksIAWN/qxvnKxRpbRk9j93zSGg5pOc03zDRc?=
 =?us-ascii?Q?F2QODmTrd9FPMIk1UCpLIh4zP1EVL1lvFkZfz26GUaYdcNSrVreK2wu/Ndtv?=
 =?us-ascii?Q?q3G0mhFp+g3tnQpfPkgtUqPM5jf8R8HMp0/SgCu4kW2Y85IJI7cm/c/QvMAq?=
 =?us-ascii?Q?tm3F7mx5cW9VUt9VzVWDFWGCXKvjwhfirYOSMCh9ZeNKRhMzeLCLw6P1qv8F?=
 =?us-ascii?Q?ZaxKSlh4Ym9Zif33m2/RBRVxCpHJhIzNQZjmHVHLdyLMANNbSVv9ETJ7Sgfj?=
 =?us-ascii?Q?MfKlQQ2DJeSfP5EqfvPrz6v8/cjDayFfOzHZjtJ0EXMylwumOThKSwOtQt9o?=
 =?us-ascii?Q?9PD1ga7jiHzFx6mnw3jGfltTeKLV6mkO/7Uj+YtmpBtonZgy1Pcnq2Hv2Uhu?=
 =?us-ascii?Q?AIfCCRy4WzOqf/ZwYGjKqe5kh+uua8smoe4CFLXs3XR+Ni1wjlECUos0GDch?=
 =?us-ascii?Q?vQDGd02HhzeccNuSOsIzD9w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5okU53WwJmlZ76nJREk8M8/AYfZwnoDye66LsZ0KIBKPoT+bZRgRkcICOtMQ?=
 =?us-ascii?Q?nGmT1f0hN6z4CEh2kEyGUS1OOcIhZom+Me3bIH2H4zCy93o+t34sQgiSxltn?=
 =?us-ascii?Q?UGS71N7U5UGfbbkMga2xAW7PaXDN66uuycihqkzq4Qgd2ffCIaKUpvIo+YQH?=
 =?us-ascii?Q?EJTctFPUE/SHNfktgvyog7f7Y2zvOa2XkM7WaEHXZ3gyl37+3Sg2b53KAo0V?=
 =?us-ascii?Q?p44OYW0jqJt6sDkCJ9DVHOdwxDtZjlqNYji4E8M5b0kLQJVISCeWbYViSCU+?=
 =?us-ascii?Q?IYUmqPREH8RGH1cUDD3A/j0xM+rY8Hx5kZtWIPTCDBo42VDj4ZRq+PmG8KBO?=
 =?us-ascii?Q?wfE/Xs9t4OLFPpXiMRYYS5pJup1YlbmODyQZi1wSNC5ZCb6tYZ7Qw7K68Xg0?=
 =?us-ascii?Q?AT85kzNKAPipcGmhKgLgC6h5xoU4WYImpNn1jTRiTSnlMQVG920zkQ0kpC3w?=
 =?us-ascii?Q?3WLXPrTHtSap2ZSEFESbwG8fhq6LOsh0wML4GWb3wJ1+snlvG+rycj2R/dij?=
 =?us-ascii?Q?86Ejr1ZEdXXzpAHQkJUZQX+JUl3ipCbSKyXSpMKyBf4axuHWEjuFFVNfc9Bw?=
 =?us-ascii?Q?zyo3j8uw0xIWF0aYxi41tjLpUs68sWMUoB0KwBJ8LSJ1lJCad6LDGXtqpWFL?=
 =?us-ascii?Q?MtY9ynwfIMPP2iqvYuHlHhbHNgKMhaWvIcCJrvc4XSpzc4S/+MmS3EQ6nKVO?=
 =?us-ascii?Q?w5FXXiRt5nZ5isebf+jD6r81ZYKtvY2gQnWECBN/rb0mU50XOeuyLH7riNJ1?=
 =?us-ascii?Q?9k4zapIDrcVfTJIw8cWHkDyQnV6vX4qf9LpRF2J+PEuPs26fiAc9x+BhTZvG?=
 =?us-ascii?Q?Pi7d7CFEYa3kmiPdGSpzFMl/E0/IjpSggGtt1vjM//Kbdeo/sJcNhPyzj5dE?=
 =?us-ascii?Q?jkvk+lIA29+wcbhS+xhZCQAF4xs8SFeeMu7SxuBXlDI8e+muuHvPt1enb8oh?=
 =?us-ascii?Q?H+Tpv1hbx4m3zIB32S7x+tlu2JJztZLLDGh9JHT374RRgQ4kK+ed0GAl+l5B?=
 =?us-ascii?Q?c8BIM97v/HZwAiYEJYulzpJnZJ4FzT2PJE3ZqhsYb0vL2wAlqFAtJcm9IwU1?=
 =?us-ascii?Q?HKWyIqlqQxsI0A/vU6Cq5wnKuQtVLIDcuoqonaiIVF+sb2EMjxe9rYGDAFDG?=
 =?us-ascii?Q?p3fNfrdLy/g01Iz65j4eKfWni740qSv9dKxSiNvOVIIZyEkAJx+fkz/QQMiy?=
 =?us-ascii?Q?REwxrVf5GVXMQQggGlVwgk1Er9iH+JfInTqHJUcGNCioiPQlsn5C5mFrw5+7?=
 =?us-ascii?Q?Op/iHrO4N4H+Bn2vAJU5RUeT2krwYZ1niaeUadqvmkwrcH7dbryZcazRUBbp?=
 =?us-ascii?Q?0vtnjfMmlz9re1h+jtPjMyu/42j9cpptOKZsA0f9UyXoA13Xq6HmC0d8Bw6K?=
 =?us-ascii?Q?7spz0+qLy8UNEmDbPSbsG6+yoelyittWQjNg/xRSVPq7pVRjWfRMvj+c19Yy?=
 =?us-ascii?Q?vHKuQHXOtUnrPBjS9948eB5Xjm9oJNlsOFJe2JUJb69FuCWcQzQLQ6HE9Y52?=
 =?us-ascii?Q?lb+dxEGkK3h2IXwaGlJI0333Yg7+PuTJ9o7nEA0sypXKZNszoEWKuQopRtyy?=
 =?us-ascii?Q?/OkNB7ENiP9mkmx0yOQ+KrLBMQXNeVQnNV7n69xGqXbx/+/dWoGC6E72w6E5?=
 =?us-ascii?Q?JLBlJ7L/S/TSVDqsdqrJ4F8nLZ0ie7v8xDCrJGWbRU8uKcJmldZOh3KGJJ1f?=
 =?us-ascii?Q?Tsr+PfQhlspr2OmrzK+PD/7tLeQX77bdDwybKyFn0g7D0Csd?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dd097457-4372-49ea-3c2a-08de589bc97b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 03:18:45.6364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DdEYiqpoRqTzxHCt+zwM4cs3AjZX05vtqmjv7VB9s23uff4PHuF1dzdakwdo3e/dc/fpEHTvIpJaV7OxWJW3hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8491



> Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
>=20
> On Tue, Jan 20, 2026 at 06:26:03PM +0800, Sherry Sun wrote:
> > Add DT compatible string for NXP i.MX93W EVK board.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
> b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index 93ad6f0027d0..1769f243d70f 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -1432,6 +1432,7 @@ properties:
> >                - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
> >                - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
> >                - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
> > +              - fsl,imx93w-evk            # i.MX93W EVK Board
>=20
> Is 93w 11x11 or 14x14? can you add suffix to keep align existing one.
>=20

Hi Frank,

IMX93W-EVK is the official board name, it basically reuse the  i.MX93 11x11
EVK board, as described in the cover letter and dts patch. I prefer to stil=
l use
this name (imx93w-evk) to keep align with the board official name.=20

Please let me know if there any other concerns. Thanks!

Best Regards
Sherry


> Frank
>=20
> >            - const: fsl,imx93
> >
> >        - description: i.MX94 based Boards
> > --
> > 2.37.1
> >
