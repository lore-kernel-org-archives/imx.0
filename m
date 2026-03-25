Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011053.outbound.protection.outlook.com [40.107.130.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1CF238D52
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 02:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774404496; cv=fail; b=lSzoQuDXSoD5sEn5MhlXyfNnOHvUHd0059QQZVlVBsFdm6w1LpB/buGjIuT40Mr2JwjHzryqIEyPiAu+rVJ9l9F6ikEP3Av/Jkgl4O0kOulci78x0FDT3b6/lbYO63reS68RMb3sGXVDXOQR7HZWCHfss1bRj90rHtxUsXJen4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774404496; c=relaxed/simple;
	bh=J7d8C0I/RRj7wl0ZzzvXlhgFdrGMDDKUmgF5KwiEaXI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I/feajE0rX5Gwcg5qa8bhWBnuIRdge9kkGB3TmMefuai1dkEc61eVLgZ2TPoynzpP4ubz2DwC2UAOymr4tivNoHuyL4EFOLR7vIWOBBoNdEvUhX5i7sv6EL90j0FistSMDrrns/GB3OBRKM3FvK78PQ3awVdRL1ON09IoC0s8gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YCWkcqcz; arc=fail smtp.client-ip=40.107.130.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YCWkcqcz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJv4StmlQZ2g/WyjwvZIz5O5a5oMv6buTlPOVXtZ/KGmP57s1Vi6ip4ufsFbGk79XkLRYqyb8bT7PPx/7JlkpNhjep00KZnDWh9g4xo8BvsaoQ0q8YEklcks6j1SgwO8Zbr0xQBHVd0wqkUBW3MH7VhO5hwaPTqHpoXhjdNYharfGM0Y9uilm9xZ3U4ssLZ5K6XW4Z+oSPIYHx8svLfnEWi2qsMwAaoU1k5vWSkVswHE0BsH6H4SsYdPdrI24cBscq+HJZO2VnCDSXmZ4kqS1B/YMCEPQ5IyplZ4JJX5GuQEVNHWqN4PNDcRF5plGT+PnbpAULFql6fGjSadjd+QrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Y8d7js9i1e4uYX344N6TxKF2eQpWj/L1SwdIfxWJoQ=;
 b=J8N9w23xvT66LgEAIL4bd6kAoNkIzpsPjaP97SfZPyayEK9bhQ2aEDWkWR0mdkcBWP5SGYGg/yEO1LL3KBjvCaEU4LAWhUgfsNIk2Fhqf4NmudODyBzLgGRMxqPJk0XGq0Kta37m8X2tb9qCHvuegoVCP6LNltI695icuqRfA9vykZpmzSuUJtXVnxQdkASBO7E4//iImP7JIvRzHy+HutTNdl9hmzboB9f52oUj8lm4vUJQEHRf6bY7WzucYFffKevRPTEHhLwdWNUV768AyVxOtuydpkha9YGa1vzLGZ6Phg5cC5HHiQ6uYEGg2GJaRhFep46yGEKnqa0SW1uhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Y8d7js9i1e4uYX344N6TxKF2eQpWj/L1SwdIfxWJoQ=;
 b=YCWkcqczUDwa85KhqBE1xYNxrtWw+D2VNtcgNsnSRB8RjpAN8d5mWAcDjnMx0C9Mlvn3iI86Zw2rbAfO8kh6TV5RBXM+ZYuZdXsNsVzVBFrzVmhhzF/NX/XsT8TEvPkjX0xfpQCJGufp6HcrUCcEtaOmivrDI0CyE0OJfbzgqzOHlaCTWkQyjGTWlHpMbLCv+8CH6kQPwFr59Mcpn7aLoD3BQ0hff3Bi55bvLYLrB7yrylhWTJ31Qj7n/H8v2WRCw383EmrKOrKg9vL8ZMCeMoXi7gdRqhF934ZzrwuUSiUp4O8EWWFkDa25bjdp5cHOaWy4CU1INRgXhPCoj4yVcA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GV1PR04MB10919.eurprd04.prod.outlook.com
 (2603:10a6:150:201::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 02:08:08 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 02:08:09 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Hongxing
 Zhu <hongxing.zhu@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus in the
 default dts
Thread-Topic: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus in the
 default dts
Thread-Index: AQHcuEhJWXRYjvNtWUKzhDJQysY4nLW8fkWAgAB8n7CAAAOjIIAAywkAgAC987A=
Date: Wed, 25 Mar 2026 02:08:09 +0000
Message-ID:
 <VI0PR04MB121146C5BF4F4E7054031CD419249A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260320090353.1483418-1-sherry.sun@nxp.com>
 <acGN-QsB65Kbs7Gf@lizhi-Precision-Tower-5810>
 <VI0PR04MB121147DEDEA2B8058666867F19248A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <VI0PR04MB121140F94476DBC9D2F845ADC9248A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <acKj4sWpzyAYExrK@lizhi-Precision-Tower-5810>
In-Reply-To: <acKj4sWpzyAYExrK@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|GV1PR04MB10919:EE_
x-ms-office365-filtering-correlation-id: 6e6f2123-34a8-4206-79c6-08de8a135c66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 xbaxNAX0Fpl2171YWHPsaMt3G9NoGtSGh7Ftk1eQl4Ex9vzaCN+NZP3DlzyHKQDRosevbRPpwW1Ya7sMn6Ch0FRPRkmQXLlrY5Qjuohmm5B9m/o9oNnHZzUR+IE5CU0gzICbB0fGQ9P3FRbatNYaw3BnqUk4vu89XqCg0PLEMumhi95dfRnXgKAGcaynX/jGkQuQx5SY7iLnD4GylxG1zPhLk08X2nesG1gmxD0fuO+wnyT0TXd2X8kaQeB24dcikgI2DVCm/N/0ylXaHWB11bXAolaPTe4uf50rb2IqjtuQ9dPeA/LVUrZPVGPwE8QTtND4KkIZfUSmIHGl/UsL8HcSyBEKXt9gMo2VIlIzukjNXI6Lckx8/Q4KgMSyf8d53UrGrp7d8/P6fmag+4sf2ON47zwD8d1dBn0iNpschrTxmF5ZhRQdnqIWwnQaOneLi6M70Ch6i14iXvbaQN9rl/AConG49b9FYkIPXHFBW+9vxnNONIj6SHfdk3msLgZGDIv4ZyO8YwIJ5oKbkzt/qQSE6JKQAQQMNSCqvUqumbp/Nc/n0jLvVohC2nHGQCOuuGKt0TXaNmNf21ehAZeNWPHjNUA1axwrI0sVvIEvDlDLPuHPdBQrKxEQSJyPMiT4IT6kFcJEFPVEbVNKwliFN5WwsmS8sdVyTvOrE++SnMsZDlPLoaG2ue/asCK2otorJ8BYGGhFtGLhqyV7zbnQ7KaL0NrndzgKsZo0fKZ4Rih7C19PHh/2rxGc1UwsFcBND/1qIQMTa7FOGVCp3+ErvQy/TPB8LXU8VNuxEzipmzo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1BtDYTFPieLOv845PIfH/fw8B6Q3a0Lb3xyCh/cpQKVLn2QHoicToYTl15uG?=
 =?us-ascii?Q?+EX8vBYCvCgrvZs7D3CRjIHoOhPdl8mTetNcFNiRgY/dBjbbgTSggpRBpMCX?=
 =?us-ascii?Q?5YeQbGeJPJeQV5dflzwVaBDAJLktg5WcdfH/ENCRx0rqW10RJc8xIYTOmjmG?=
 =?us-ascii?Q?IgEUGP3K1fLtHtnvDFlkZGL8IG43fEG3IEuuvezU/A9IQkIfpkiPT7ESPfL2?=
 =?us-ascii?Q?gMolk302ouyTJ24etd3IkrM9e7wbyDuFEVY8K9iri+lEpJYmgz/1f2ZvvNob?=
 =?us-ascii?Q?wMDpgZocUpjnW+rPDmkFQQKcV0XE+r/rDyVPAP2yklwLBk3yO6OQvOgHRJNN?=
 =?us-ascii?Q?X6HUSBRjZyj5yiSYuyIp/MegRjxT3dDYWfA3O2HDhrajkVpanRS9cQQtstiV?=
 =?us-ascii?Q?BZzm/KBTKI/U6GKv6gKpXmDMnszDF7GQGGs3JGeDRCvhtTi6e1BEsfKAhbeb?=
 =?us-ascii?Q?1uif5lTBd30qyZJ9n5yecw72TiRGUDSDcY4Dw2FAXSylGgib7x/Fdg5HO+oS?=
 =?us-ascii?Q?g+OXQdmsvMhdVbMZuBs/R1davaVhQ4OJcpJtp9Iigb24rmw75+H75qcLiZuQ?=
 =?us-ascii?Q?iP0vP4G2SmHqd35BqhhJnZs77J0m5cXNtGq67Dm14JKvrWkHcRf/HISBvoUg?=
 =?us-ascii?Q?WSkF8ulzLgWjZV6LaCpMJAZSxBGWMkrxlinJWnPl2hXnFl9DGu9d+w0Xosq9?=
 =?us-ascii?Q?ffWNNgfDq8NbnjR6RrF2Vxb+R44TJzFoE/Okw6dYzCHNh4iIoVEt6Q4w2otg?=
 =?us-ascii?Q?CkiqMm9UNcUPXt92y6XraK0d2YkuIlpCE7bB/cy5OLJLfHlzqEbN7zxhK1vn?=
 =?us-ascii?Q?KtCeXiUJ0RotvAs6DpJwbVQIBJFklv8XLk0aHWmo78hy9KbppU+A1yKFnJo5?=
 =?us-ascii?Q?tJ3vGJVrb47+YXdMoREOaS+fLi7+CxOtL0ebWzJTB1WN6jhGvT/1jl6BAizN?=
 =?us-ascii?Q?ez1mApLffHvKPcDrD67zQBOj1r0gwFOINGyCaP092AQX63Re/YkETjJ1UTq4?=
 =?us-ascii?Q?SrPnoH5z/VtEcAr0+gpFK/JCceOeve4A7L689OmIKG0nt2/ZQfeEkZD24cSX?=
 =?us-ascii?Q?hwNurVVXuVXjN1aCZRFT2FGDmdrMHm2iTQ34HIdpO6PQLESVIhlfRHMC5afI?=
 =?us-ascii?Q?5ucfiyqriB5tLjSV8WD0K93lWr91MYg7jpyETBhzHL6fy9iAvVZQqNETMBaO?=
 =?us-ascii?Q?aqR7YxsjD16HPaD7B/+tGGSwSDTB4PTI3jFtGBz+VL4BtSqpudpqXkIA76zr?=
 =?us-ascii?Q?I36mBAmUE3G/HYx5aHEAIET2SmVlJiJERJAJk1VcofFlIaAWjiNM1kmBWqd4?=
 =?us-ascii?Q?KWFm4XJt5tNDpTAeujvbUC4sW6ugEiNtNpSfQA6Amc0MLggqzf9PenApOgxA?=
 =?us-ascii?Q?ZQeGFtDnr0S8k9sVgu1WgAxCsIkL4X+X2EAiyPZe/eweMVRdiQt+U7c4kKWE?=
 =?us-ascii?Q?XGUDkdYcUKuBUePpcZiSaG5f/ubLHbvZVz3LY0thcZWeMdJF4hJZwl7P9RaK?=
 =?us-ascii?Q?HW3smuNQhAhRvXRwNuolBCJkG6Mnl2q7wr+gvtrHDBueejTYqCet9k8XHdIU?=
 =?us-ascii?Q?tsC2BYBi9c/v51Nb6mzo7c1XDEZnvTI2WvD0jruPYA0fC0s0EkY7SXxCpW8a?=
 =?us-ascii?Q?Lg/K3lRckLnUSEoHpKAkJaPpQB+EdiDSM6kP+1qyUHDoAoAXcuSFj57leCQW?=
 =?us-ascii?Q?vQ+nFon2axV6Of7cbu63zm5JcpZAkJSwymmRuU9nhfuU5wnf?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6f2123-34a8-4206-79c6-08de8a135c66
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 02:08:09.2193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4524Rze4SJFxl01/QSUhj+L8UklFkj0Uq3leHlMOF+qo091Wo/zEyVVQwlxM56R0/iPOWMNjt1t+8ju/aJE8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10919

> On Tue, Mar 24, 2026 at 02:45:39AM +0000, Sherry Sun wrote:
> > > > Subject: Re: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus
> > > > in the default dts
> > > >
> > > > On Fri, Mar 20, 2026 at 05:03:53PM +0800, Sherry Sun wrote:
> > > > > Disable the PCIe bus in the default device tree to avoid shared
> > > > > regulator conflicts between SDIO and PCIe buses. The
> > > > > non-deterministic probe order between these two buses can break
> > > > > the PCIe initialization sequence, causing PCIe devices to fail
> > > > > detection
> > > intermittently.
> > > > >
> > > > > On i.MX8MP EVK board, the M.2 connector is physically wired to
> > > > > both
> > > > > USDHC1 and PCIe0, however the out-of-box module is SDIO IW612
> > > > > WiFi, so enable the SDIO WiFi in the default imx8mp-evk.dts, and
> > > > > provide a separate device tree overlay (imx8mp-evk-pcie.dtso) to
> > > > > enable the PCIe bus when needed.
> > > > >
> > > > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > > > ---
> > > > > Chanegs in V2:
> > > > > 1. Improve the commit message to clarify SDIO WiFi is the
> > > > > out-of-box
> > > > module on
> > > > >    i.MX8MP EVK board.
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/Makefile        |  4 +++-
> > > > >  .../boot/dts/freescale/imx8mp-evk-pcie.dtso   | 19
> > > +++++++++++++++++++
> > > > >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  4 ++--
> > > > >  3 files changed, 24 insertions(+), 3 deletions(-)  create mode
> > > > > 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > > > > b/arch/arm64/boot/dts/freescale/Makefile
> > > > > index 780682258e71..107ca270ef32 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > > > @@ -333,12 +333,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs +=3D
> > > > > imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
> > > > > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs +=3D imx8mp-evk.dtb
> > > > > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
> > > > >  imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs +=3D imx8mp-evk.dtb
> > > > > imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
> > > > >  imx8mp-evk-mx8-dlvds-lcd1-dtbs +=3D imx8mp-evk.dtb
> > > > > imx8mp-evk-mx8-dlvds-lcd1.dtbo -imx8mp-evk-pcie-ep-dtbs +=3D
> > > > > imx8mp-evk.dtb imx-pcie0-ep.dtbo
> > > > > +imx8mp-evk-pcie-dtbs :=3D imx8mp-evk.dtb imx8mp-evk-pcie.dtbo
> > > > > +imx8mp-evk-pcie-ep-dtbs +=3D imx8mp-evk-pcie.dtb
> > > > > +imx-pcie0-ep.dtbo
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D
> > > > > imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D
> > > > > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-mx8-dlvds-lcd1.dtb
> > > > > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-pcie.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-pcie-ep.dtb
> > > > >
> > > > >  imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs +=3D
> > > > > imx8mp-tqma8mpql-mba8mpxl.dtb
> > > > > imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > > > b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > > > new file mode 100644
> > > > > index 000000000000..4f6546d442bf
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > > > @@ -0,0 +1,19 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +/*
> > > > > + * Copyright 2026 NXP
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +/plugin/;
> > > > > +
> > > > > +&pcie_phy {
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&pcie0 {
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&usdhc1 {
> > > > > +	status =3D "disabled";
> > > > > +};
> > > >
> > > > Please use one overlay for both imx95 and imx8mp to enable pcie0
> > > > and disable usdhc1.
> > >
> > > Hi Frank,
> > >
> > > imx8mp has a specific pcie_phy, I disabled it in the default
> > > imx8mp-evk.dts
>=20
> Suppose, you needn't disable phy.
>=20
> > > and enabled it in xxx-pcie.dtso, if we use one overlay for both
> > > imx95 and imx8mp, is it acceptable that we need to keep the 8mp
> > > pcie_phy enabled even in non-PCIe usage scenarios?
> > >
> >
> > In addition, another difference between imx8mp and imx95 is that imx8mp
> connects usdhc1 to the M.2 connector, while imx95 connects usdhc3 to the
> M.2 connector. The usdhc interfaces are different, so we cannot use the s=
ame
> DTSO file.
>=20
> you use addtional label.
>=20
> for example
>=20
> m2_usdhc: &usdhc1 {
> 	...
> };
>=20
> in overlay file
>=20
> &m2_usdhc {
> 	status =3D "disabled";
> }
>=20

Ok, thanks for the suggestion, will try this in next version.

Best Regards
Sherry
