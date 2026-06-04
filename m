Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9146E274670
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 03:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780543966; cv=fail; b=ggZiGpmLLzIscaHmz1r+IHGtb8QYpc95orkSZi76tf/N9kTHnY+Wyx/3iTwMXlYeaycmHN+lXtDbKfCphBOQSURFsdo1AatXrEat8AOknGcDpfEiNUdOl3HdZK2TYvG4EC7EfsHiEANvgNzFs/kBeXUET5XKTjaQyoXRkVzJt4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780543966; c=relaxed/simple;
	bh=xJzbCseJvQkDVJVjU2nOy7MBbEgXsGPUlKfb4N9yVIw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LQA+JgDvFKC6fuLCs2v+r0uZ6prNBbJxg2VVDS9ehNB7VYSTxd7eRkX35LOjhkpn1yQFU7UV1yO02x6/fxow3oV3fr4WYrrj0xpdfxhTEcKcve6wK2++mqs2iB//ZNEL4wEPGmzuvvhqPeTAzcgHaDV3HkYZf2gy3BcbjF4M4h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U8QlYk2G; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U8QlYk2G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBYxsnhOgcAuIO5bR+jntsaCkGKRJBDlz9XZo0faDg16HvRBYAQCOeU3FtxmuyifkyyxUtBEJzE6L+C6sGu/Ieny6jtOus9cPDBpMrWDuI1rZ/1fFk0MEJdrr00WYQ0fmPlBD0yCH3618K7VKlbfbULf2owgGL9rtNCUpzKhbVWnBpv36ceOuuLR48KBY2fZfRVw9zZGHezvGNyhLMkzxds9hrP4adv/akwUTN0gNZgmvPHweEBHPbAzcldTHuvN4FVhIAVUAYrKoMqWv2qfDU0BwT442WEnUiVbzSc3N7ikHL8NFrdOoxLClHUbVhCFZmAfAr6sU91KvZaN0nNQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6j4OHKyz0FAUQKBFL7q8z3cjlVR/HJOeYWZHhhyHIo=;
 b=uFuKfLqV0ITHxuI+weFwZtcJ2R/X8U8XV9rl8UbG8momNzORlIzzUfYb4NeTLc+2qpn8EILiSot9RIJL4Z3M3Z6riGWPoL3VTUK6wqcZ7s3Vx+X9wOcMWIBymFpIi6V2HJC23eJ+hKUFEU7BGALDIbrYOvYuNsTmOIgvaKSro8aYCDWT4h98/OyGRh12rX2TU9gtkoXA8I6M8z+2qfOrwgsPSjIe04p5yE2pKBjzCEjtxBB+H69WBkd3vwpy1m+fppB6j34/UghQJBDH4ld0b2O7NbhEYIQK1BBLODtn9C35vHegKWdHH3nuUdHPy/ycNBx0Y4fmYncdS7ZLoqO6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6j4OHKyz0FAUQKBFL7q8z3cjlVR/HJOeYWZHhhyHIo=;
 b=U8QlYk2Gc7Pm4hSnyVDS5pBes3BV8xGoQ08eomkUQF9bXFG4ly8wKLwY7V7ZJBI+1R9yPIG5PhfwsEASqU3b4aWzYi0M0lH5gE4oNKCKT4OCEdyPcKsvVcebNAdUNb8cekGwCjG7fym++5GNq5owoiy7s61MonY5kYyfWBaPzZCIV+0Y5iToAtY2ERgJ2IYVY92y/DFG2N4VdMjT3yrNkWReL59oczyFxZdp0KSC/3F9CLm+XhEWm25UbKCou+mfjEXwQhxOVLQToSIcOQw2mdT01J+gMaJqesUhJ/3bGg5Xrhke5OZ28TTbppg2DfVRjZXCqu4LHoAbn9P+t9/Qig==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAXPR04MB9570.eurprd04.prod.outlook.com
 (2603:10a6:102:24d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 03:32:41 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 03:32:41 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>
Subject: RE: [PATCH v1] arm64: dts: imx94: Add Root Port node and PERST
 property
Thread-Topic: [PATCH v1] arm64: dts: imx94: Add Root Port node and PERST
 property
Thread-Index: AQHc88jWArrt60KYqkOGb5wRYLlZPrYtvIGQ
Date: Thu, 4 Jun 2026 03:32:41 +0000
Message-ID:
 <VI0PR04MB121146852552A5C6B551DB15292102@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260604022420.120294-1-hongxing.zhu@oss.nxp.com>
In-Reply-To: <20260604022420.120294-1-hongxing.zhu@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|PAXPR04MB9570:EE_
x-ms-office365-filtering-correlation-id: 510cc435-dd89-4c15-375b-08dec1e9eec5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|38070700021|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 xx0wfVPy3EAWDVrYE6mdQ+sQLlYiyKW8oSfcoQHA1ObVwNQvjNljzV+SFI1h5kJd0HTjMW1wCquy+ozJHThdRIuPKr6jOe4+lN1P+F983kJthM/QMPslCd0fZhi671q0rzslNWeFIwunf1eU0a34DLgQWpLvmVHj1/mlPsvH44lWXLQELm0/t7XbYKFTwyOCXlYZTQ5cWq1R1fisxVXHcUgN7pXzbBPpnpJGodsjFmhHg9bOGHxnq2O2yrzrjYvispJlnW31r0KB1hbvaHir9WRt7o9m2Qt4UNXGLSUZrTBwp6QbkpaXdYmvB7MgXXDUgPsmxAhjCjzu/k2PdqjI4ZZRx5X3E8BsfoGmVrx1yCeo8jsXhe+xnlAgl6/7YCZMGDkflu/aCbaZ8MWm0+pv7cFGX2lXzKD5zo3FgQFmpUwBmn6G6k0N3NFJJ85zj7Oy5wSDqBUO7nHldnCVvP2BqLAEJzm5SFTQ73IlvQlKNT7asm9dXnBInznUwbIYvGabUC9dGKLqjOxENBQsJ8uKr5zDnZw01eJgw2OMCKks/5BTEWmTxOJCEI8fgEpEu/mcU+yZZTSX29rin+g1mRlXedFD2nYbeK7Z3E74aOWvDrm/QwzKlyzvGl6o8V50gHmjwupSE53m9lgjElptzKiexK5PMmSJZ9XBiIPmhF68ZhqI+sdmtyMaLgfKWoJUFkEjNN77lkRghsG2GWRu9a+L060IslzOi9640CtdYeovPq6QNaCVYeabUsp3VXUx8lfi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(38070700021)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UKqlmmQqKXVJRmzTvcvPBKkZDtH1UP2iDhO2EkjwKMBjiWYi7KESU3BcIId7?=
 =?us-ascii?Q?6P7nx5USsFC573oXMeHy/OSIOMoj0Bz/RI23FYVQ8yFH68Nw6tGh4q7hnw4Q?=
 =?us-ascii?Q?SmHk7VSF4Agv1CDy76Aj60+VAlWUdsVV0RpOEgl6BmAIF6j79/OWRVCz0Nxr?=
 =?us-ascii?Q?RrYT5Wv/aFFT9mXTYdG0Y09B0Q1OoPvEkxgUTU51SaZPN7XaQFC3NPDgHDo+?=
 =?us-ascii?Q?Jfp7ptvfKU+HDqj5xA3PY0fhEljklfdeSRKn6UMg1YMyHlv5zYzUAASgjSP4?=
 =?us-ascii?Q?C4W+GpAy3VKD18zmh/FLIgR+Pgs5ID/hV0JdTUIqYzUWMmkltEj8wnF9UEHR?=
 =?us-ascii?Q?BQblwiRtXJNUDeimM3FE7m+4P3vatYTofxYfi7AEeQeKrX6tcYaKefBQkKyP?=
 =?us-ascii?Q?mCIctX3Pf/0fC0HRy9fUdtA/yp6cAunBUEayoQEKW2E3gnJtAab+D2mz4Ewe?=
 =?us-ascii?Q?k4KNj5jWLOTrwulUSfYTP8FqoRDqxCOhNaffPYtBGPNL/hHwK6wf7UuwDmh2?=
 =?us-ascii?Q?93xv69rR4glK00HDc3u28BGsqiTEryxuBxLiATIyM3fwUiUvQruKLs4Q2YHG?=
 =?us-ascii?Q?GlWLnBG8JUMPaH5OGlnNkjCixx/eqHT5nQwmZaWUIL074v2OCmeKYaVJ2F3Y?=
 =?us-ascii?Q?BaFMtNw+aRkZPeoehIlnIAUgXbbjUkLkXy3Fy5wAXdXDM9OEl7+lBXPxeotJ?=
 =?us-ascii?Q?ojUr2zKo8G1xfFTLGTZM9Of8ylSKmu+caRBmaVgPgMhDYMxWz1qJ8Kr3r52C?=
 =?us-ascii?Q?MvueTsnERqMIDCZDNUQaKksQipvuDl3QnsCUwcKCbix3RA/J2nKNuM6b7SVP?=
 =?us-ascii?Q?6OuIK2uWiPAP0+inUgSu1i0riRyoUDoeVPnX01nxU4h/yQb8Ex41pi8K8Auc?=
 =?us-ascii?Q?ZnOyJZR00kTvVu302jvMVtGej6LF5WBx7KC1HlzgJrTk6iizQ+f/Svu6AOIT?=
 =?us-ascii?Q?L38CWutWaseQCk7BqcDn565IgTAfWeCaZf1pUM4s9fmZRx22cpJz7quJeBHD?=
 =?us-ascii?Q?iIAvzrhqc97XH30IpF8Kq19cse0HaW1CoGT2zREBGW/OI0mtImPBM+ROlD+g?=
 =?us-ascii?Q?uy2qE1qRK0T+/lBGKKThuTgxNS1uKQZiQuSuEBVUx8fVbFd23zfm5yWugp4p?=
 =?us-ascii?Q?VcceCb61L4JxEC9jhTgfZ/Z/9kcwh1AGKx72kZNIT+76JCAVymGuvG0ROlxV?=
 =?us-ascii?Q?ANCSCUDzXzAIb92Pc9zoWba4XPuqohBqi2iqAV82oBX7rDmkm/qsfskSpFZ3?=
 =?us-ascii?Q?iHRMtysB7Ch6jYc67J+BtppQ0fEpAuHZihgJjjCKYWu8D32NtP7Hzt1HtJ2z?=
 =?us-ascii?Q?HxiEVKAwmldBndRpx8Ph2JxGlRHdOjCTVZWD8Smz9Bf3+G1ZmHco0PFSoC0V?=
 =?us-ascii?Q?Aon78V6fA7AvcqPP7seI9qYFDgdmkcj0F7QcBxw06PhfXemJWF5UXKN4yH4E?=
 =?us-ascii?Q?R1NvE4g0vsLQH8uavgC4Z5EZVOabz+z6xYK6AIC1EFxdZ7XNxciX8JLTZt9E?=
 =?us-ascii?Q?bNVYwU7w7MLgEcGf4f4CGKmu1MbR6qobrPZ1BUP1iBwxYtvAw1nQdr2UAwfz?=
 =?us-ascii?Q?PR20FXODCoTPJFADTp5S6or4Xg/P4IZSzWm/WbgmzvIUQC7ny2yAeK3k1Fyt?=
 =?us-ascii?Q?W0W2nM8ffizDJd28Au8N1ksLSkqzICsp+wjcePFXTrcFARSmpGWFJqEtX1ko?=
 =?us-ascii?Q?2DsUI/PDD7Ay7W7VCjIPts485lxDo8JKXWKDncKNvac6f+O+?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 510cc435-dd89-4c15-375b-08dec1e9eec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 03:32:41.0296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uEHAKdC5OkMRIiMOqYPBlyGFfoai7Zz/ec2fNzk8otmt4ejSPzHKYlZfSLMwrw+2CieyLkMBoAQc0s6HkxeQfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9570

> Subject: [PATCH v1] arm64: dts: imx94: Add Root Port node and PERST
> property
>=20
> From: Richard Zhu <hongxing.zhu@oss.nxp.com>
>=20
> Since describing the PCIe PERST# property under Host Bridge node is now
> deprecated, it is recommended to add it to the Root Port node, so creatin=
g the
> Root Port node and add the reset-gpios property in Root Port.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi     | 11 +++++++++++
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 10 ++++++++++
>  arch/arm64/boot/dts/freescale/imx943.dtsi    | 11 +++++++++++
>  3 files changed, 32 insertions(+)
> ---
> Since the patch-set [1] issued by Sherry had been landed. Add according
> changes on i.MX943 board too.
> [1] https://lkml.org/lkml/2026/6/1/1461
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi
> b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index 1f9035e6cf159..dfbb73603cb24 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -1411,6 +1411,17 @@ pcie0: pcie@4c300000 {
>  			power-domains =3D <&scmi_devpd
> IMX94_PD_HSIO_TOP>;
>  			fsl,max-link-speed =3D <3>;
>  			status =3D "disabled";
> +
> +			pcie0_port0: pcie@0 {
> +				compatible =3D "pciclass,0604";
> +				device_type =3D "pci";
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range =3D <0x01 0xff>;
> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				ranges;
> +			};
>  		};
>=20
>  		pcie0_ep: pcie-ep@4c300000 {
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index 7cfd424689507..ed3abd3e76e56 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -1034,12 +1034,17 @@ &pcie0 {
>  		 <&pcie_ref_clk>;
>  	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
>  		      "ref", "extref";
> +	/* This property is deprecated, use reset-gpios from the Root Port
> +node. */
>  	reset-gpio =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;

Hi Richard,
This reset-gpio property should be deleted, for new i.MX, we can use the
reset-gpios under Root Port directly.

>  	vpcie3v3aux-supply =3D <&reg_m2_wlan>;
>  	supports-clkreq;
>  	status =3D "okay";
>  };
>=20
> +&pcie0_port0 {
> +	reset-gpio =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>; };
> +
>  &pcie0_ep {
>  	pinctrl-0 =3D <&pinctrl_pcie0>;
>  	pinctrl-names =3D "default";
> @@ -1058,12 +1063,17 @@ &pcie1 {
>  		 <&pcie_ref_clk>;
>  	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
>  		      "ref", "extref";
> +	/* This property is deprecated, use reset-gpios from the Root Port
> +node. */
>  	reset-gpio =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;

Same here.

Best Regards
Sherry

>  	vpcie3v3aux-supply =3D <&reg_slot_pwr>;
>  	supports-clkreq;
>  	status =3D "okay";
>  };
>=20
> +&pcie1_port0 {
> +	reset-gpio =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>; };
> +
>  &pcie1_ep {
>  	pinctrl-0 =3D <&pinctrl_pcie1>;
>  	pinctrl-names =3D "default";
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi
> b/arch/arm64/boot/dts/freescale/imx943.dtsi
> index cf5b3dbb47ff7..01152fd0efa5e 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> @@ -255,6 +255,17 @@ pcie1: pcie@4c380000 {
>  			power-domains =3D <&scmi_devpd
> IMX94_PD_HSIO_TOP>;
>  			fsl,max-link-speed =3D <3>;
>  			status =3D "disabled";
> +
> +			pcie1_port0: pcie@0 {
> +				compatible =3D "pciclass,0604";
> +				device_type =3D "pci";
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range =3D <0x01 0xff>;
> +
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				ranges;
> +			};
>  		};
>=20
>  		pcie1_ep: pcie-ep@4c380000 {
> --
> 2.34.1

