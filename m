Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA7C15E8B
	for <imx@lists.linux.dev>; Wed,  5 Mar 2025 00:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741134864; cv=fail; b=WlApXiuaZMiXPpuKsKLTQ2FOUrVDS/U/7brlXa6EqpyeNKlmmqTJshIV5cU8maELYHa1i/DPbAPDsD7PpLKafS64kuGLcU+/lZKPBwKud0Rx5YO6m5tPCjc4XQMYpjNATwVLgxxu8nmbVU+yOa7qvoxSHmXvqwqVxndwxLnJ7Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741134864; c=relaxed/simple;
	bh=MUpw4l5TIguyG7lqyiNdYXcMmV455+Q9ymuy5n0vfIg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EuS4yWcm4kQDDTMMIX31GX//iJCw3MDqm9TWkdkIHA9d3vIpinCT2KqadSsO3jWGvSG5UKoWq6MzNscccjIk3boVxfuPAQSFOCNFXJ0LxEfZVDxIfQkTqimX5M+sjCmlQHHWaRB0HTlGk7fLkD/qJyJRf0JICT4d62T0pqY4aI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aK+wbIpb; arc=fail smtp.client-ip=40.107.20.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aK+wbIpb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/1FL8KKVD1o8JOXErI6iaZqbJ8ySaON9ASgMvGiFOHZmRRZXHmH6C3WudC2LIry2Smo9NXMfxr+rlhsH3S4WhANcgXYfjW61DkoDJ1ksph28C2slp9/H191iiWSdUiEBolWFujyWupcnIJIJTU/iSx7lu/n3VPSH2hlVDKGBDhnTD5yllgmQozgNjKwACbIL5IOUNithicBL8uUodR3oJ94dr3uijafNq1Qn0vOnY4LUYHGQDz2maU5GsJEbap00xsgXBIYNCrFs1+q/ylsS0ZMHFJac3WWgmxKOgcgSaLaU6YrcFPawpCmA1oP6UxCencn/QPCR2ElfPm4k1jgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGn0Aky4Y6wm3TjQGbhRfLJRkerSyClec+zUZyh/AUY=;
 b=IHFck1ykm/+9u0PMrZ54QU1q58yw6nWYQoMfxSSS+KFIFd7DfGdHdcWzjhh4Re39CBhwURLYpy0v4GyaZ9872CvumaZ6Kg/khGb+kCwnF+UNyKcjiccmNgVS8k/WvhbMwjpBLyDVj3q5/UWwotsm6GmcXjSXvJfSOCazNqx1vaRI4KetCBrIGqwz52ZnecMMX9QV7KFNNcOUM9cZfR7HxKRSsD1XQjQrFTRMCxUGx1j6oLhbFPonRgIzhvovE6N7dbyKBnRO6kD56hCw0o4plFLxZdfdexmhJ9qmCH1jb3l8ckF2n6k3db0kLPiCKYJ9lKYrIA+0hXUabRiWwjV9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGn0Aky4Y6wm3TjQGbhRfLJRkerSyClec+zUZyh/AUY=;
 b=aK+wbIpbs9S/ljOR2u3dHltuThjjjeyI+z0VTYO4rvJhlBp96//XCFyzzTV2JfZ844yD4HDSeKRsqjdzbgJlB5i4JWknfkcHZGB8GrnegmAXtbgCZT7bIWq+Sn+vhKZovz7OeQPfQaZXRiKToRAyFEynEaPAMFFm5NSJAyfwhhxxQM+vpWgeKA32OskgBlyPdgtKT6iYJoqBTuuJZvOy5o3BxYy4xUEMONI6nmsfhXTOvtpC+herdKfq8DAXGchDyF3jpsKNgm1CTtNqVzWfWv1K0mp9pfasjhhOvie8jFOeGa1lWS+LlGbZSbKTlZhQcVpq2UiZzrl5i/8xMg1lYQ==
Received: from PAXPR04MB8655.eurprd04.prod.outlook.com (2603:10a6:102:21e::21)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 00:34:17 +0000
Received: from PAXPR04MB8655.eurprd04.prod.outlook.com
 ([fe80::ee25:3737:7ef0:68f7]) by PAXPR04MB8655.eurprd04.prod.outlook.com
 ([fe80::ee25:3737:7ef0:68f7%5]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 00:34:17 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v2 3/4] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Topic: [PATCH v2 3/4] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Index: AQHbjOg69YhLe5tDw0KrTwzmNv+1a7NjHHCAgACWORA=
Date: Wed, 5 Mar 2025 00:34:16 +0000
Message-ID:
 <PAXPR04MB865500783C2518B63456B97687CB2@PAXPR04MB8655.eurprd04.prod.outlook.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-4-ping.bai@nxp.com>
 <Z8cd33Aw3tpPBism@lizhi-Precision-Tower-5810>
In-Reply-To: <Z8cd33Aw3tpPBism@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8655:EE_|PA4PR04MB7664:EE_
x-ms-office365-filtering-correlation-id: a304f7e1-708b-48d2-2d28-08dd5b7d7641
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/24HkVihJDSER/fxBkMhR6tqCb4d2X1Xk0a6vfKP4h1AZCliNybLKh0qJdqk?=
 =?us-ascii?Q?/0cEi2k6GktHbCLP+N2qFXljjBvJqiefR2crn8saL2veTpcXjERhKmlwoLCX?=
 =?us-ascii?Q?Gk2FrDq9lkBYYi6Okpr9UOQMSVvBWY79QQ2lMnWgQHPmUpeQ+JkI0DkuD8DS?=
 =?us-ascii?Q?lejKwZxzSUNdc4VuV2uUDpmoeVg+20M7e81VUbwRf8KlP0aXxf10NpgLTOcS?=
 =?us-ascii?Q?uzBbAFBPzm3DE4P7wEkIRA07uuzPZ6/2u5/MaZPHvq1csnkLORgOMLJtImkP?=
 =?us-ascii?Q?LACU3pwadUXclBGYBuxkiIO/VN7oHV9zc44zKISs9leR8MGSY6T9dr1kld8d?=
 =?us-ascii?Q?/cYAMV5teALJQjbuyoOP1BUKBbJGYOABPDCYAFTRE6C/6XbocExyf4A2fmWe?=
 =?us-ascii?Q?iu6Ls/9qfOFkc6lQDD4v0JQG013jRzdmct2V5ROMO69yWSHJdtWMpGj827K9?=
 =?us-ascii?Q?A55tM7us5hKlidoB7nA0Ajn6JBNj9+zkfiGu6NeFwHr0FCB8ovz0lBEbd75L?=
 =?us-ascii?Q?4GtNLlfUMV7ghBAj5g0gvjwwEoqLSi7Nvrc7FPVh6VOJCaAY3/IbCIgaLyNX?=
 =?us-ascii?Q?WGTnkV82uJ5PE2d/8Y9/7+m1CytbMjg46iu5EWDppHc/WMiPLdM2xJSNijfz?=
 =?us-ascii?Q?8vt9YjmNJWxKNGKzXeaNboP7ol59QBWi7Zh3vay3CjtJ3qBSrJcE2KTxPg8M?=
 =?us-ascii?Q?7s0xEOLK2TGOvqrEzfvca6M9x5lccrRqUXE5ac4hzN5SrtL5m0cpACS6QgBX?=
 =?us-ascii?Q?E8fguVdoRya8wEvMnsxYF00vsLYZ36ear9Nhmd2EtkZtGmle9eDT6FsRP0/L?=
 =?us-ascii?Q?/4r8OaNmpQscXba2fACoMMh+c6K/5TjyVXrlWmLRyt/GwgsVtz6hCBy4KVQa?=
 =?us-ascii?Q?gXP16GKXQGOsxXp36R+z8/mXDKla+SZE9jmUGXqXFbz97wUBNtxo1nbZOzif?=
 =?us-ascii?Q?BCfGeZLMz/w29I1+Hkev/YSQQK60346ZXO0zSnAY0LThdh++iRCk4E0oZC2P?=
 =?us-ascii?Q?+BWKN5ZLws6BNFwuWvs1BBEAmYF3b8/JqPunX8y1x09N/nTc51G3ksSplRk4?=
 =?us-ascii?Q?52HLaXj9rxsvg2TPxYvOzWxMXNiielwPFNbE0F0DE3fDcIhIHbfIJHz3KdhP?=
 =?us-ascii?Q?msXECkTc2jy929Yxmxe5UZ3aAhoT7oL4hfRG4cdFV3BPLInRPe38ryCFy4XA?=
 =?us-ascii?Q?27oc94SY1lwMdrKPDas/gPkGoSkRaeUDJslfkQIUwJBfjShkaD+RvMmwp5mR?=
 =?us-ascii?Q?AaaJ2agyHsPwBSGzqB2xMSN6nG6BrN9Goq6X+L8ASi8ksHRma7PC0ILjfEFi?=
 =?us-ascii?Q?IU9q0J3L2T9n+hx5+hv1zEv+NbDXitA9wV8okDozkuE7BmZUPOPhGT0WXE7u?=
 =?us-ascii?Q?22VWhCBk0duOwGcwDbrWzSk6FV0pj0KnJnYXM70jyCrIOBSfzk9k6JdNpZKc?=
 =?us-ascii?Q?kuLtiDLJRyoJq+NoiQGlv1OLcjghOn8S?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8655.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OdPbRQioz+E4LEEoTCQ1WqM/3W1Lw5NrcPVf1NhZHbdgmCrnkxhEz9gmz/f7?=
 =?us-ascii?Q?c+i3f9lSVnZV+g8wpD8nlhjsvPE9svND1NhCsrr7n/WWnM2qAWsw8lSdgMVq?=
 =?us-ascii?Q?SslnlHkBRnHUNlxZzqO14Nl/2I9lGrAAsYLR8xejD1qdPfJ9wbcfxF3NTUeF?=
 =?us-ascii?Q?Z2j0/k6w4upQTQ8ORUkAAlf9QXWFVhI/2iBvzeG0UtIjJj1DujFLiGG2WsuH?=
 =?us-ascii?Q?UhG3UJ8WDrYAE+19UZDpf6MxxMPihyqYoYbtA9Oyi/jke1MBq2+AG6wdwa4p?=
 =?us-ascii?Q?qUe/eu3mpIbUgmMqunFS0frgjJ8Nwj78JCWBT7CrypprSGsk/VyAfsQ+ytXp?=
 =?us-ascii?Q?lfBSRpMb3t+1bQV9hGaq+3Fuss0X7IGRkg6587pv/ysXDblgaekJChNjCLSF?=
 =?us-ascii?Q?zSbwYjbvX5OHWwVrC92hZZmONwGOa9ngSmaliJPHi+XcEvwXs+dRyfdMHk/7?=
 =?us-ascii?Q?ojaawoIgxKEB4OGW5W/nL04V+Uy3Qm1A6QWC8KwkdYugoBsC0UmHyYDLEyAx?=
 =?us-ascii?Q?MSGP+a659gLH5vknd8np/JdGsVPxiWUfdCXOCnH9Lqxb4u4NAJMxX6xjtSxd?=
 =?us-ascii?Q?T9tVDixF+ma4cxDAEvBPmVuRtkJQ0CzS0xRpqS5R6pG0QY2eb+jq5mwKAGQp?=
 =?us-ascii?Q?lMADxyCF0YPK6aVOatBPHhffIN854w7ydjq/IBDdD2oDoK5LPhzWMHq0bjyZ?=
 =?us-ascii?Q?p5Xlrvq4Ehbi5j4fchi451khj718P/NaaZgA9KgwE1R1HV6kJQ6tqdIRgYNo?=
 =?us-ascii?Q?sDXJv575k7TFysMg7tIa5FIwugajixfaSo+eUyhAeb5LggXikq+HHEZH7meq?=
 =?us-ascii?Q?6qEc+YeTGBjUkxWcC5BzGWRZqk2HCXzlN4evTcXDxS/ymyDzcR7k4KEiJafX?=
 =?us-ascii?Q?CfGHZB+22IM5U2FyMttBF20fvoTfj5s5qPogEMc1XTKJUJPrK3Xl4i1tr0eH?=
 =?us-ascii?Q?1yYXzSZZMxZ8YTyHJDGrDz4zQ+mahpCDvTsBvv28INmNWE/UqdvshmzmADZ3?=
 =?us-ascii?Q?7imihr7DxJzlqkMBa3OVj6cckCDX7xVuPY96qzlpVgRjlLgqLZGVuQspZ1aP?=
 =?us-ascii?Q?4W8cIidRzn78yx4lTSyES0j63EifufHx7sf/OyGlTFKKonrphHYXN5RbFu6c?=
 =?us-ascii?Q?ePUgksxr0yju3L0NUWpYr1/ZAskLv8s6sYogjNyDmNKuh7W7YJnXUFw+GePZ?=
 =?us-ascii?Q?bT1+MTduN1nMwU3UG3XeDqHpgDqBnnOfdwHlmF+t4sdVAQ3jBWezjKOOrm8o?=
 =?us-ascii?Q?TDR3BeGILtYJ2P0dDy2DEldSjytZO9mS7FRuU3hSj70wufM/VyHYyN3yltMB?=
 =?us-ascii?Q?FDf2SydhAZLdGiK2tbuzvF2aTxBBh9YMmZjcjRyXJs4Lwko5Ne57Cqpz8lr9?=
 =?us-ascii?Q?1LewmObChaWGwQ/saFRAPoix1Lv9xRrDoYN5ljGccj2AC7d3UDaeoopRWvJ9?=
 =?us-ascii?Q?RpOB25gVXvHLqrdAmMS355ofGgcrim0P3RRGXiujFjCViLjnH+uc3HU27UYV?=
 =?us-ascii?Q?GrrEh6bjSjWLMorpsd/uMoLLSFeNEXwitBe00hKrNxVuIZiGeOocyoVc+GcU?=
 =?us-ascii?Q?ZDaCSY2ZfgNUMtw9bQ0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8655.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a304f7e1-708b-48d2-2d28-08dd5b7d7641
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 00:34:16.9249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hOTbKEmqn7BV28/fapPom6hOipZtB4vVy0w34EBWwTbXKo1RR9W29raMz9qtgL/kaqeJi6J3zMNLeghCEDYqZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664

> Subject: Re: [PATCH v2 3/4] arm64: dts: freescale: Add basic dtsi for imx=
943
>=20
> On Tue, Mar 04, 2025 at 05:31:26PM +0800, Jacky Bai wrote:
> > Add the minimal dtsi support for i.MX943. i.MX943 is the first SoC of
> > i.MX94 Family, create a common dtsi for the whole i.MX94 family, and
> > the specific dtsi part for i.MX943.
> >
> > The clock, power domain and perf index need to be used by the device
> > nodes for resource reference, add them along with the dtsi support.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  - v2 changes:
> >   - remove the unnecessary macro define in clock header as suggested by
> Krzysztof
> >   - split the dtsi into imx94.dtsi and imx943.dtsi
> >   - use low case in the pinfunc header as Frank suggested
> >   - reorder the device nodes and properties
> >   - resolve Krzysztof's other comments
> > ---
> ...
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <24000000>;
> > +		clock-output-names =3D "osc_24m";
> > +	};
> > +
> > +	dummy: clock-dummy {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <0>;
> > +		clock-output-names =3D "dummy";
> > +	};
> > +
> > +	clk_ext1: clock-ext1 {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <133000000>;
> > +		clock-output-names =3D "clk_ext1";
> > +	};
> > +
> > +	sai1_mclk: clock-sai1-mclk1 {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <0>;
> > +		clock-output-names =3D "sai1_mclk";
> > +	};
> > +
> > +	sai2_mclk: clock-sai2-mclk1 {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <0>;
> > +		clock-output-names =3D "sai2_mclk";
> > +	};
> > +
> > +	sai3_mclk: clock-sai3-mclk1 {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <0>;
> > +		clock-output-names =3D "sai3_mclk";
> > +	};
> > +
> > +	sai4_mclk: clock-sai4-mclk1 {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <0>;
> > +		clock-output-names =3D "sai4_mclk";
> > +	};
> > +
> > +	firmware {
> > +
>=20
> Remove empty line here.
>=20

Thx, will fix it in v3.=20

BR
> Frank
> > +		scmi {
> > +			compatible =3D "arm,scmi";
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			mboxes =3D <&mu2 5 0>, <&mu2 3 0>, <&mu2 3 1>, <&mu2 5 1>;
> > +			shmem =3D <&scmi_buf0>, <&scmi_buf1>;
> > +			arm,max-rx-timeout-ms =3D <5000>;
> > +
> > +			scmi_devpd: protocol@11 {
> > +				reg =3D <0x11>;
> > +				#power-domain-cells =3D <1>;
> > +			};
> > +
> > +			scmi_sys_power: protocol@12 {
> > +				reg =3D <0x12>;
> > +			};
> > +
> > +			scmi_perf: protocol@13 {
> > +				reg =3D <0x13>;
> > +				#power-domain-cells =3D <1>;
> > +			};
> > +
> > +			scmi_clk: protocol@14 {
> > +				reg =3D <0x14>;
> > +				#clock-cells =3D <1>;
> > +			};
> > +
> > +			scmi_iomuxc: protocol@19 {
> > +				reg =3D <0x19>;
> > +			};
> > +
> > +			scmi_bbm: protocol@81 {
> > +				reg =3D <0x81>;
> > +			};
> > +
> > +			scmi_misc: protocol@84 {
> > +				reg =3D <0x84>;
> > +			};
> > +		};
> > +	};
> > +
> > +	pmu {
> > +		compatible =3D "arm,cortex-a55-pmu";
> > +		interrupts =3D <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) |
> IRQ_TYPE_LEVEL_HIGH)>;
> > +	};
> > +
> > +	psci {
> > +		compatible =3D "arm,psci-1.0";
> > +		method =3D "smc";
> > +	};
> > +
> > +	timer {
> > +		compatible =3D "arm,armv8-timer";
> > +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) |
> IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) |
> IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) |
> IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) |
> IRQ_TYPE_LEVEL_LOW)>;
> > +		clock-frequency =3D <24000000>;
> > +		interrupt-parent =3D <&gic>;
> > +		arm,no-tick-in-suspend;
> > +	};
> > +
> > +	gic: interrupt-controller@48000000 {
> > +		compatible =3D "arm,gic-v3";
> > +		reg =3D <0 0x48000000 0 0x10000>,
> > +		      <0 0x48060000 0 0xc0000>;
> > +		ranges;
> > +		#interrupt-cells =3D <3>;
> > +		interrupt-controller;
> > +		interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +		dma-noncoherent;
> > +		interrupt-parent =3D <&gic>;
> > +
> > +		its: msi-controller@48040000 {
> > +			compatible =3D "arm,gic-v3-its";
> > +			reg =3D <0 0x48040000 0 0x20000>;
> > +			#msi-cells =3D <1>;
> > +			dma-noncoherent;
> > +			msi-controller;
> > +		};
> > +	};
> > +
> > +	soc {
> > +		compatible =3D "simple-bus";
> > +		ranges;
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +
> > +		aips2: bus@42000000 {
> > +			compatible =3D "fsl,aips-bus", "simple-bus";
> > +			reg =3D <0x0 0x42000000 0x0 0x800000>;
> > +			ranges =3D <0x42000000 0x0 0x42000000 0x8000000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			edma2: dma-controller@42000000 {
> > +				compatible =3D "fsl,imx94-edma5", "fsl,imx95-edma5";
> > +				reg =3D <0x42000000 0x210000>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "dma";
> > +				#dma-cells =3D <3>;
> > +				dma-channels =3D <64>;
> > +				interrupts-extended =3D <&a55_irqsteer 0>, <&a55_irqsteer
> 1>, <&a55_irqsteer 2>,
> > +					<&a55_irqsteer 3>, <&a55_irqsteer 4>,
> <&a55_irqsteer 5>,
> > +					<&a55_irqsteer 6>, <&a55_irqsteer 7>,
> <&a55_irqsteer 8>,
> > +					<&a55_irqsteer 9>, <&a55_irqsteer 10>,
> <&a55_irqsteer 11>,
> > +					<&a55_irqsteer 12>, <&a55_irqsteer 13>,
> <&a55_irqsteer 14>,
> > +					<&a55_irqsteer 15>, <&a55_irqsteer 16>,
> <&a55_irqsteer 17>,
> > +					<&a55_irqsteer 18>, <&a55_irqsteer 19>,
> <&a55_irqsteer 20>,
> > +					<&a55_irqsteer 21>, <&a55_irqsteer 22>,
> <&a55_irqsteer 23>,
> > +					<&a55_irqsteer 24>, <&a55_irqsteer 25>,
> <&a55_irqsteer 26>,
> > +					<&a55_irqsteer 27>, <&a55_irqsteer 28>,
> <&a55_irqsteer 29>,
> > +					<&a55_irqsteer 30>, <&a55_irqsteer 31>,
> <&a55_irqsteer 64>,
> > +					<&a55_irqsteer 65>, <&a55_irqsteer 66>,
> <&a55_irqsteer 67>,
> > +					<&a55_irqsteer 68>, <&a55_irqsteer 69>,
> <&a55_irqsteer 70>,
> > +					<&a55_irqsteer 71>, <&a55_irqsteer 72>,
> <&a55_irqsteer 73>,
> > +					<&a55_irqsteer 74>, <&a55_irqsteer 75>,
> <&a55_irqsteer 76>,
> > +					<&a55_irqsteer 77>, <&a55_irqsteer 78>,
> <&a55_irqsteer 79>,
> > +					<&a55_irqsteer 80>, <&a55_irqsteer 81>,
> <&a55_irqsteer 82>,
> > +					<&a55_irqsteer 83>, <&a55_irqsteer 84>,
> <&a55_irqsteer 85>,
> > +					<&a55_irqsteer 86>, <&a55_irqsteer 87>,
> <&a55_irqsteer 88>,
> > +					<&a55_irqsteer 89>, <&a55_irqsteer 90>,
> <&a55_irqsteer 91>,
> > +					<&a55_irqsteer 92>, <&a55_irqsteer 93>,
> <&a55_irqsteer 94>,
> > +					<&a55_irqsteer 95>, <&gic GIC_SPI 98
> IRQ_TYPE_LEVEL_HIGH>;
> > +			};
> > +
> > +			mu10: mailbox@42430000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x42430000 0x10000>;
> > +				interrupts =3D <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			i3c2: i3c@42520000 {
> > +				compatible =3D "silvaco,i3c-master-v1";
> > +				reg =3D <0x42520000 0x10000>;
> > +				interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <3>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_I3C2SLOW>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&dummy>;
> > +				clock-names =3D "pclk", "fast_clk", "slow_clk";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c3: i2c@42530000 {
> > +				compatible =3D "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x42530000 0x10000>;
> > +				interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C3>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 5 0 0>, <&edma2 6 0 FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c4: i2c@42540000 {
> > +				compatible =3D "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x42540000 0x10000>;
> > +				interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C4>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 4 0 0>, <&edma4 5 0 FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi3: spi@42550000 {
> > +				compatible =3D "fsl,imx95-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x42550000 0x10000>;
> > +				interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI3>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 7 0 0>, <&edma2 8 0 FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi4: spi@42560000 {
> > +				compatible =3D "fsl,imx95-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x42560000 0x10000>;
> > +				interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI4>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 6 0 0>, <&edma4 7 0 FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart3: serial@42570000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42570000 0x1000>;
> > +				interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART3>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma2 10 0 FSL_EDMA_RX>, <&edma2 9 0 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart4: serial@42580000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42580000 0x1000>;
> > +				interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART4>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma4 10 0 FSL_EDMA_RX>, <&edma4 9 0 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart5: serial@42590000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42590000 0x1000>;
> > +				interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART5>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma2 12 0 FSL_EDMA_RX>, <&edma2 11 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart6: serial@425a0000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x425a0000 0x1000>;
> > +				interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART6>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma4 12 0 FSL_EDMA_RX>, <&edma4 11 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			flexcan2: can@425b0000 {
> > +				compatible =3D "fsl,imx95-flexcan";
> > +				reg =3D <0x425b0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_CAN2>;
> > +				clock-names =3D "ipg", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_CAN2>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > +				assigned-clock-rates =3D <80000000>;
> > +				fsl,clk-source =3D /bits/ 8 <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			flexcan3: can@425e0000 {
> > +				compatible =3D "fsl,imx95-flexcan";
> > +				reg =3D <0x425e0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_CAN3>;
> > +				clock-names =3D "ipg", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_CAN3>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > +				assigned-clock-rates =3D <80000000>;
> > +				fsl,clk-source =3D /bits/ 8 <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			flexcan4: can@425f0000 {
> > +				compatible =3D "fsl,imx95-flexcan";
> > +				reg =3D <0x425f0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_CAN4>;
> > +				clock-names =3D "ipg", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_CAN4>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > +				assigned-clock-rates =3D <80000000>;
> > +				fsl,clk-source =3D /bits/ 8 <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			flexcan5: can@42600000 {
> > +				compatible =3D "fsl,imx95-flexcan";
> > +				reg =3D <0x42600000 0x10000>;
> > +				interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_CAN5>;
> > +				clock-names =3D "ipg", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_CAN5>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > +				assigned-clock-rates =3D <80000000>;
> > +				fsl,clk-source =3D /bits/ 8 <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			sai2: sai@42650000 {
> > +				compatible =3D "fsl,imx95-sai";
> > +				reg =3D <0x42650000 0x10000>;
> > +				interrupts =3D <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> <&dummy>,
> > +					<&scmi_clk IMX94_CLK_SAI2>, <&dummy>,
> <&dummy>;
> > +				clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > +				dmas =3D <&edma2 30 0 FSL_EDMA_RX>, <&edma2 29 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				#sound-dai-cells =3D <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			sai3: sai@42660000 {
> > +				compatible =3D "fsl,imx95-sai";
> > +				reg =3D <0x42660000 0x10000>;
> > +				interrupts =3D <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> <&dummy>,
> > +					<&scmi_clk IMX94_CLK_SAI3>, <&dummy>,
> <&dummy>;
> > +				clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > +				dmas =3D <&edma2 32 0 FSL_EDMA_RX>, <&edma2 31 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				#sound-dai-cells =3D <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			sai4: sai@42670000 {
> > +				compatible =3D "fsl,imx95-sai";
> > +				reg =3D <0x42670000 0x10000>;
> > +				interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> <&dummy>,
> > +					<&scmi_clk IMX94_CLK_SAI4>, <&dummy>,
> <&dummy>;
> > +				clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > +				dmas =3D <&edma2 36 0 FSL_EDMA_RX>, <&edma2 35 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				#sound-dai-cells =3D <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart7: serial@42690000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42690000 0x1000>;
> > +				interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART7>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma2 46 0 FSL_EDMA_RX>, <&edma2 45 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart8: serial@426a0000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x426a0000 0x1000>;
> > +				interrupts =3D <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART8>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma4 39 0 FSL_EDMA_RX>, <&edma4 38 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c5: i2c@426b0000 {
> > +				compatible =3D "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x426b0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C5>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 37 0 0>, <&edma2 38 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c6: i2c@426c0000 {
> > +				compatible =3D "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x426c0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C6>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 30 0 0>, <&edma4 31 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c7: i2c@426d0000 {
> > +				compatible =3D "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x426d0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C7>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 39 0 0>, <&edma2 40 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c8: i2c@426e0000 {
> > +				compatible =3D "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x426e0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C8>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 32 0 0>, <&edma4 33 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi5: spi@426f0000 {
> > +				compatible =3D "fsl,imx95-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x426f0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI5>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 41 0 0>, <&edma2 42 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi6: spi@42700000 {
> > +				compatible =3D "fsl,imx95-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x42700000 0x10000>;
> > +				interrupts =3D <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI6>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 34 0 0>, <&edma4 35 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi7: spi@42710000 {
> > +				compatible =3D "fsl,imx95-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x42710000 0x10000>;
> > +				interrupts =3D <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI7>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 43 0 0>, <&edma2 44 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi8: spi@42720000 {
> > +				compatible =3D "fsl,imx95-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x42720000 0x10000>;
> > +				interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI8>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 36 0 0>, <&edma4 37 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu11: mailbox@42730000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x42730000 0x10000>;
> > +				interrupts =3D <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			edma4: dma-controller@42df0000 {
> > +				compatible =3D "fsl,imx94-edma5", "fsl,imx95-edma5";
> > +				reg =3D <0x42df0000 0x210000>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "dma";
> > +				#dma-cells =3D <3>;
> > +				dma-channels =3D <64>;
> > +				interrupts-extended =3D <&a55_irqsteer 128>,
> <&a55_irqsteer 129>,
> > +					<&a55_irqsteer 130>, <&a55_irqsteer 131>,
> > +					<&a55_irqsteer 132>, <&a55_irqsteer 133>,
> > +					<&a55_irqsteer 134>, <&a55_irqsteer 135>,
> > +					<&a55_irqsteer 136>, <&a55_irqsteer 137>,
> > +					<&a55_irqsteer 138>, <&a55_irqsteer 139>,
> > +					<&a55_irqsteer 140>, <&a55_irqsteer 141>,
> > +					<&a55_irqsteer 142>, <&a55_irqsteer 143>,
> > +					<&a55_irqsteer 144>, <&a55_irqsteer 145>,
> > +					<&a55_irqsteer 146>, <&a55_irqsteer 147>,
> > +					<&a55_irqsteer 148>, <&a55_irqsteer 149>,
> > +					<&a55_irqsteer 150>, <&a55_irqsteer 151>,
> > +					<&a55_irqsteer 152>, <&a55_irqsteer 153>,
> > +					<&a55_irqsteer 154>, <&a55_irqsteer 155>,
> > +					<&a55_irqsteer 156>, <&a55_irqsteer 157>,
> > +					<&a55_irqsteer 158>, <&a55_irqsteer 159>,
> > +					<&a55_irqsteer 192>, <&a55_irqsteer 193>,
> > +					<&a55_irqsteer 194>, <&a55_irqsteer 195>,
> > +					<&a55_irqsteer 196>, <&a55_irqsteer 197>,
> > +					<&a55_irqsteer 198>, <&a55_irqsteer 199>,
> > +					<&a55_irqsteer 200>, <&a55_irqsteer 201>,
> > +					<&a55_irqsteer 202>, <&a55_irqsteer 203>,
> > +					<&a55_irqsteer 204>, <&a55_irqsteer 205>,
> > +					<&a55_irqsteer 206>, <&a55_irqsteer 207>,
> > +					<&a55_irqsteer 208>, <&a55_irqsteer 209>,
> > +					<&a55_irqsteer 210>, <&a55_irqsteer 211>,
> > +					<&a55_irqsteer 212>, <&a55_irqsteer 213>,
> > +					<&a55_irqsteer 214>, <&a55_irqsteer 215>,
> > +					<&a55_irqsteer 216>, <&a55_irqsteer 217>,
> > +					<&a55_irqsteer 218>, <&a55_irqsteer 219>,
> > +					<&a55_irqsteer 220>, <&a55_irqsteer 221>,
> > +					<&a55_irqsteer 222>, <&a55_irqsteer 223>,
> > +					<&gic GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
> > +			};
> > +		};
> > +
> > +		aips3: bus@42800000 {
> > +			compatible =3D "fsl,aips-bus", "simple-bus";
> > +			reg =3D <0 0x42800000 0 0x800000>;
> > +			ranges =3D <0x42800000 0x0 0x42800000 0x800000>,
> > +				 <0x28000000 0x0 0x28000000 0x1000000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			usdhc1: mmc@42850000 {
> > +				compatible =3D "fsl,imx95-usdhc", "fsl,imx8mm-usdhc";
> > +				reg =3D <0x42850000 0x10000>;
> > +				interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> > +					 <&scmi_clk IMX94_CLK_USDHC1>;
> > +				clock-names =3D "ipg", "ahb", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_USDHC1>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1>;
> > +				assigned-clock-rates =3D <400000000>;
> > +				bus-width =3D <8>;
> > +				fsl,tuning-start-tap =3D <1>;
> > +				fsl,tuning-step =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			usdhc2: mmc@42860000 {
> > +				compatible =3D "fsl,imx95-usdhc", "fsl,imx8mm-usdhc";
> > +				reg =3D <0x42860000 0x10000>;
> > +				interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> > +					 <&scmi_clk IMX94_CLK_USDHC2>;
> > +				clock-names =3D "ipg", "ahb", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_USDHC2>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1>;
> > +				assigned-clock-rates =3D <200000000>;
> > +				bus-width =3D <4>;
> > +				fsl,tuning-start-tap =3D <1>;
> > +				fsl,tuning-step =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			usdhc3: mmc@42880000 {
> > +				compatible =3D "fsl,imx95-usdhc", "fsl,imx8mm-usdhc";
> > +				reg =3D <0x42880000 0x10000>;
> > +				interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> > +					 <&scmi_clk IMX94_CLK_USDHC3>;
> > +				clock-names =3D "ipg", "ahb", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_USDHC3>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1>;
> > +				assigned-clock-rates =3D <200000000>;
> > +				bus-width =3D <4>;
> > +				fsl,tuning-start-tap =3D <1>;
> > +				fsl,tuning-step =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart9: serial@42a50000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42a50000 0x1000>;
> > +				interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART10>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma2 51 0 FSL_EDMA_RX>, <&edma2 50 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart10: serial@42a60000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42a60000 0x1000>;
> > +				interrupts =3D <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART10>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma4 47 0 FSL_EDMA_RX>, <&edma4 46 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart11: serial@42a70000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42a70000 0x1000>;
> > +				interrupts =3D <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART11>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma2 53 0 FSL_EDMA_RX>, <&edma2 52 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart12: serial@42a80000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42a80000 0x1000>;
> > +				interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART12>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma4 49 0 FSL_EDMA_RX>, <&edma4 48 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu12: mailbox@42ac0000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x42ac0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu13: mailbox@42ae0000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x42ae0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu14: mailbox@42b00000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x42b00000 0x10000>;
> > +				interrupts =3D <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu15: mailbox@42b20000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x42b20000 0x10000>;
> > +				interrupts =3D <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu16: mailbox@42b40000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x42b40000 0x10000>;
> > +				interrupts =3D <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu17: mailbox@42b60000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x42b60000 0x10000>;
> > +				interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +		};
> > +
> > +		gpio2: gpio@43810000 {
> > +			compatible =3D "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43810000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 4 32>;
> > +		};
> > +
> > +		gpio3: gpio@43820000 {
> > +			compatible =3D "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43820000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 36 26>;
> > +		};
> > +
> > +		gpio4: gpio@43840000 {
> > +			compatible =3D "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43840000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
> > +				      <&scmi_iomuxc 8 140 12>, <&scmi_iomuxc 20 164
> 12>;
> > +		};
> > +
> > +		gpio5: gpio@43850000 {
> > +			compatible =3D "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43850000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 108 32>;
> > +		};
> > +
> > +		gpio6: gpio@43860000 {
> > +			compatible =3D "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43860000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 66 32>;
> > +		};
> > +
> > +		gpio7: gpio@43870000 {
> > +			compatible =3D "fsl,imx95-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43870000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152
> 12>;
> > +		};
> > +
> > +		aips1: bus@44000000 {
> > +			compatible =3D "fsl,aips-bus", "simple-bus";
> > +			reg =3D <0x0 0x44000000 0x0 0x800000>;
> > +			ranges =3D <0x44000000 0x0 0x44000000 0x800000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			edma1: dma-controller@44000000 {
> > +				compatible =3D "fsl,imx94-edma3", "fsl,imx93-edma3";
> > +				reg =3D <0x44000000 0x210000>;
> > +				interrupts =3D <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "dma";
> > +				#dma-cells =3D <3>;
> > +				dma-channels =3D <32>;
> > +				status =3D "okay";
> > +			};
> > +
> > +			mu1: mailbox@44220000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x44220000 0x10000>;
> > +				interrupts =3D <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			system_counter: timer@44290000 {
> > +				compatible =3D "nxp,imx95-sysctr-timer";
> > +				reg =3D <0x44290000 0x30000>;
> > +				interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&osc_24m>;
> > +				clock-names =3D "per";
> > +				nxp,no-divider;
> > +			};
> > +
> > +			tpm1: pwm@44310000 {
> > +				compatible =3D "fsl,imx7ulp-pwm";
> > +				reg =3D <0x44310000 0x1000>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>;
> > +				#pwm-cells =3D <3>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			tpm2: pwm@44320000 {
> > +				compatible =3D "fsl,imx7ulp-pwm";
> > +				reg =3D <0x44320000 0x1000>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_TPM2>;
> > +				#pwm-cells =3D <3>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			i3c1: i3c@44330000 {
> > +				compatible =3D "silvaco,i3c-master-v1";
> > +				reg =3D <0x44330000 0x10000>;
> > +				interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <3>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_I3C1SLOW>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>,
> > +					 <&dummy>;
> > +				clock-names =3D "pclk", "fast_clk", "slow_clk";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c1: i2c@44340000 {
> > +				compatible =3D "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x44340000 0x10000>;
> > +				interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C1>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma1 12 0 0>, <&edma1 13 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c2: i2c@44350000 {
> > +				compatible =3D "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x44350000 0x10000>;
> > +				interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C2>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma1 14 0 0>, <&edma1 15 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi1: spi@44360000 {
> > +				compatible =3D "fsl,imx95-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x44360000 0x10000>;
> > +				interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI2>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma1 16 0 0>, <&edma1 17 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi2: spi@44370000 {
> > +				compatible =3D "fsl,imx95-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x44370000 0x10000>;
> > +				interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI2>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma1 18 0 0>, <&edma1 19 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart1: serial@44380000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x44380000 0x1000>;
> > +				interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART1>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma1 21 0 FSL_EDMA_RX>, <&edma1 20 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart2: serial@44390000 {
> > +				compatible =3D "fsl,imx95-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x44390000 0x1000>;
> > +				interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART2>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma1 23 0 FSL_EDMA_RX>, <&edma1 22 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			flexcan1: can@443a0000 {
> > +				compatible =3D "fsl,imx95-flexcan";
> > +				reg =3D <0x443a0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			sai1: sai@443b0000 {
> > +				compatible =3D "fsl,imx95-sai";
> > +				reg =3D <0x443b0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>, <&dummy>,
> > +					<&scmi_clk IMX94_CLK_SAI1>, <&dummy>,
> > +					<&dummy>, <&dummy>;
> > +				clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > +				dmas =3D <&edma1 25 0 FSL_EDMA_RX>, <&edma1 24 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				#sound-dai-cells =3D <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			adc1: adc@44530000 {
> > +				compatible =3D "nxp,imx93-adc";
> > +				reg =3D <0x44530000 0x10000>;
> > +				interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_ADC>;
> > +				clock-names =3D "ipg";
> > +				#io-channel-cells =3D <1>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu2: mailbox@445b0000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x445b0000 0x1000>;
> > +				ranges;
> > +				interrupts =3D <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <1>;
> > +				#mbox-cells =3D <2>;
> > +
> > +				sram0: sram@445b1000 {
> > +					compatible =3D "mmio-sram";
> > +					reg =3D <0x445b1000 0x400>;
> > +					ranges =3D <0x0 0x445b1000 0x400>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <1>;
> > +
> > +					scmi_buf0: scmi-sram-section@0 {
> > +						compatible =3D "arm,scmi-shmem";
> > +						reg =3D <0x0 0x80>;
> > +					};
> > +
> > +					scmi_buf1: scmi-sram-section@80 {
> > +						compatible =3D "arm,scmi-shmem";
> > +						reg =3D <0x80 0x80>;
> > +					};
> > +				};
> > +			};
> > +
> > +			mu3: mailbox@445d0000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x445d0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu4: mailbox@445f0000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x445f0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu6: mailbox@44630000 {
> > +				compatible =3D "fsl,imx95-mu";
> > +				reg =3D <0x44630000 0x10000>;
> > +				interrupts =3D <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			a55_irqsteer: interrupt-controller@446a0000 {
> > +				compatible =3D "fsl,imx-irqsteer";
> > +				reg =3D <0x446a0000 0x1000>;
> > +				#interrupt-cells =3D <1>;
> > +				interrupt-controller;
> > +				interrupts =3D <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "ipg";
> > +				fsl,channel =3D <0>;
> > +				fsl,num-irqs =3D <960>;
> > +			};
> > +		};
> > +
> > +		aips4: bus@49000000 {
> > +			compatible =3D "fsl,aips-bus", "simple-bus";
> > +			reg =3D <0x0 0x49000000 0x0 0x800000>;
> > +			ranges =3D <0x49000000 0x0 0x49000000 0x800000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			wdog3: watchdog@49220000 {
> > +				compatible =3D "fsl,imx93-wdt";
> > +				reg =3D <0x49220000 0x10000>;
> > +				interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				timeout-sec =3D <40>;
> > +				fsl,ext-reset-output;
> > +				status =3D "disabled";
> > +			};
> > +		};
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi
> > b/arch/arm64/boot/dts/freescale/imx943.dtsi
> > new file mode 100644
> > index 000000000000..a9877fcfd896
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> > @@ -0,0 +1,148 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#include "imx94.dtsi"
> > +
> > +/ {
> > +	cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		idle-states {
> > +			entry-method =3D "psci";
> > +
> > +			cpu_pd_wait: cpu-pd-wait {
> > +				compatible =3D "arm,idle-state";
> > +				arm,psci-suspend-param =3D <0x0010033>;
> > +				local-timer-stop;
> > +				entry-latency-us =3D <1000>;
> > +				exit-latency-us =3D <700>;
> > +				min-residency-us =3D <2700>;
> > +				wakeup-latency-us =3D <1500>;
> > +			};
> > +		};
> > +
> > +		cpu0: cpu@0 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a55";
> > +			reg =3D <0x0>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l0>;
> > +		};
> > +
> > +		cpu1: cpu@100 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a55";
> > +			reg =3D <0x100>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l1>;
> > +		};
> > +
> > +		cpu2: cpu@200 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a55";
> > +			reg =3D <0x200>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l2>;
> > +		};
> > +
> > +		cpu3: cpu@300 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a55";
> > +			reg =3D <0x300>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l3>;
> > +		};
> > +
> > +		l2_cache_l0: l2-cache-l0 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2_cache_l1: l2-cache-l1 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2_cache_l2: l2-cache-l2 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2_cache_l3: l2-cache-l3 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l3_cache: l3-cache {
> > +			compatible =3D "cache";
> > +			cache-size =3D <1048576>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <1024>;
> > +			cache-level =3D <3>;
> > +			cache-unified;
> > +		};
> > +	};
> > +};
> > --
> > 2.34.1
> >
