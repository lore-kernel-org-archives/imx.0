Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010050.outbound.protection.outlook.com [52.101.84.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB67228A72B
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770620345; cv=fail; b=KyWpOGkt6YE8sGmAJpZ7CTBnPb/0XbPDyDBjZr74E5UmIzYC3d7Ta3tXzaNKd3y3ImRe2pkJq1pjOzlQt1aWswxo5HnIBbqoAB73NNpKW6uJFMls0HCYLrE8kTj3vo3uvNpkaOWiP1XcrwK7z+JSKLStMB5qgxQMGQJDG88RK1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770620345; c=relaxed/simple;
	bh=qc/d/wW7zWZPll+HEcRfmxqWPv+HqSjltpjJ4MdXE04=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aGGBIScsuoH4cchBlDmm6Tx17rTgGAj2Xdr82mirZdoaMfljymP3asSs7nW1mwbtRNU/OcwSDJC0Z7bFmnja3vOkjax/uaVjThYiypRo8XPNclk9X9mJfDh0pN61chZzRX+m1tcQmgx7FgfD3D2PFYBXlcRWwvJAe0q+jarlCiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=POIvqG0M; arc=fail smtp.client-ip=52.101.84.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="POIvqG0M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIVwqr9D8iVdiWl9Puhzyk/h+N9coReu4BgCGZOYugrd+3/KwPuakGfSZna3ttJmeE+bgkm//OY3NWV+uHV70U5vJ+rQ46YaqDkIZBUDRT6POVjxsbiEx9yR4xMah3doWvz7Zuktna9OdwSYGRadSKb+sbwQVZ78lpSgQPROiRJoEGfCbau8v0uf2PIItCtLImRQMao1q9B9gVHBSEkHszfbFaZ86kcWT/2BBgITnkYXVNGp7Xe9yGOlJphCFQqPkhPl1V6g5Uvk4HyVpds8HDDrgtIZ4tte50Mje1b1h6Koafb4ItutH5+5rR6LeuNIl1Z2f+ZEdnxWX0o9OJaV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PH0LF8QS+4dbWEJpEJ0xcFH8P0HVS2cITF4zZmLu8U=;
 b=qBmORjWk/85LSp0fR0QVpwEz4Ytcw6JRS5gxP6qScy0YK0DbhdzAFklu3PGhq24KXjbP8fOfo5ZRUPI/lDnr9oBtRc5XPvqyxMVw36bxiXrTTJJ+aPSo+QHz6cFOUcdCQvWKYr0fLb/DGMQdgeB5koEmLutAKoQro14iSk1f+p35nrWPYdy0oO+QyiNg+qGfyJGP6tzWljBiFrDNFlsLhy0fMZKifG/Y23TQZeAMNQrZzb+YLcEsu91dtUwM1RzvDqexUHX9LUafqC12MtfQgSiRhhSA9Nr1skJ701LttOAaUNtPDBiohn/udtbBxuX+R88xDYQ2ZAa52ULTgpOwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PH0LF8QS+4dbWEJpEJ0xcFH8P0HVS2cITF4zZmLu8U=;
 b=POIvqG0MuoybQBjNLRabmKTBvpPRyrm2dEJUHNrUtcgMXoQhH6ViqV0tORJyIImUr5mej8qiSBzaj1CyCaW9OlsazrkZfrqd20ak7fcnbJjl6CJDBxCVvnHapSM9bJAUtpuBLc+dICCaJ+0fPmTkyURddKC5mX/7uE/L2+5RxIy0OjCoo5W1LHXmvz4Bf8ZcFR5ufgdRRGTEYGuH2M/wnLXlbSIsfd7hwxTDiyvMwSyy5rw65ZPo2KWNHfDG8UN212P6Ny9f9MDAPxx1asAneVLD1FOPgPMIVliEAh4nA/xR4s8RU9Cy+Wk+JPwU35DC9BUyx5I9KN/izzIpCCnFnw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB9580.eurprd04.prod.outlook.com
 (2603:10a6:10:307::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 06:59:01 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 06:59:01 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>, Frank Li <frank.li@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and
 pcie-ep[0,1] support
Thread-Topic: [PATCH v2 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and
 pcie-ep[0,1] support
Thread-Index: AQHcmYj4qsvxhYQh3ke68/5+iSu1ZrV57wTw
Date: Mon, 9 Feb 2026 06:59:01 +0000
Message-ID:
 <VI0PR04MB12114A744F552574963ADF66C9265A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
 <20260209055745.1545129-4-hongxing.zhu@nxp.com>
In-Reply-To: <20260209055745.1545129-4-hongxing.zhu@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DB9PR04MB9580:EE_
x-ms-office365-filtering-correlation-id: 936222ff-31d8-43c3-3bfb-08de67a8b48d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wCfNshXwlFwlNJdlxHg9YTN2icfSBv3Q5+7iZUwJYISdnCU8dkvF0/nRSJii?=
 =?us-ascii?Q?Jp09xHTcSemttejd43YqPgpbuxcGFUBj/+czZ8u9Sd2JAXJXyoYXqHSkN2JB?=
 =?us-ascii?Q?Nw1+3rkXtEXLtPv6r3qnfvxByelrFZURPsuRVpJ0ltWkxE4NAN4W1fP+srGA?=
 =?us-ascii?Q?J3Lw5GH1DuF+VN9KgAD7ewGEjYJ6Ncnfxo2Jd2e5uu438uGh6wQFbU9RYJ1p?=
 =?us-ascii?Q?SYx8XuQDBpsA87FmRd7O1zyRifwRnXRW7oAajqXOOn10IVRXsNCUpW3+MCE+?=
 =?us-ascii?Q?XvWBiw+dxDa6B/o9wgOYmkvV1wdXsNP5K5gmdFfL11mwXyfn5doH+i1aDM/S?=
 =?us-ascii?Q?FExOySJ8KbXGaIkzGsz/ynKitjwt9ahQyRisslKdkwAgbNo3+IAxLo5C0goj?=
 =?us-ascii?Q?gkUdx1ywul57Mt/UMHyDPD+CIbdJ9ZYFnjfRNwNiWf7IREsKz6aAQcjfoBTU?=
 =?us-ascii?Q?4UXDI6O80FIfs5RDVy0rpAq24Xw1jjx1p2nvZe4kaTnPL798cQqE8pXQJQ6J?=
 =?us-ascii?Q?BAQbphJhUGVKsAaLMh/JRsnHYdb59kh3CgkPHrD71rIJ/pR9PM5bU6WniopD?=
 =?us-ascii?Q?48R1roWEl0SjVu0xEulvCuFBEMi4SSzYb6npW8y2aRswVPevRSQdZ2rJq8LE?=
 =?us-ascii?Q?ppnDokPhIjjJBs74Iniwa3oZSXeny4C8rpx+duoGHldUFsWKmkMl0AGj2rPG?=
 =?us-ascii?Q?qQ2JjC9KZjTh/FDjFcNgGsQE/pF0ZvV7qR0+8eb0FJFu8FIKexoJ/JBwuFCl?=
 =?us-ascii?Q?yLbRv93MDWdYXICggauleINbjsvjnQ1CBgtJT4OnVS0ZKNShqUWZ2o2mX7DH?=
 =?us-ascii?Q?5rdZVVvTnM+CVnz3ZbkNmeFWx0EmTA74tjY0Pe6iNxzHTTgmzZRRZtUhHvAO?=
 =?us-ascii?Q?4bOM+nonQfG3q7rBlpRewSPK9YoS6kPzdRz+IyWGBeRREgMhOBznqleYWYuk?=
 =?us-ascii?Q?ORyNunvxTHL5gUWwTkl1D5TUDf4HWqeM/ITKkUjF2yVvQmpAgI/T48Uh6joE?=
 =?us-ascii?Q?e4kenfqr+tZ+vJMQg0w60tgXAaQ50mEKqIrJnWERQYjMGJ7UJUxgHudhXHkM?=
 =?us-ascii?Q?kleQp1rwJAXI5Rb4LnD8Mmf7mozruPy8hSIYyDsh2zIrQUUAWDAOJ95+5B0p?=
 =?us-ascii?Q?Xwv6lnBEVHeIzd7g2McS+HMoF3iw2v7eyQCVBge8xxIh6ioeER+5LfgnY9FD?=
 =?us-ascii?Q?1Q9weaBQn5AwZyG3cRIfc94wox9se8wyjPZjgB7D+9f4VOYdL+BJNob1D0/r?=
 =?us-ascii?Q?mODkpVOwYRoYUtcbwIPva7zl2M9uaxMkvzhM33KNOiZnb55Z6VDHyJNd5LQX?=
 =?us-ascii?Q?dPnu0q9sHEc8ODaIk4DxPP57jjJPSLiRQJRWcTDULNVAGl7tol4+azaugG2F?=
 =?us-ascii?Q?dz6joUUibKeOe6DyPrFGLXIxQI69bKwFqm1vlIRl9Aj1b5Mckz4+9oZ4Otzl?=
 =?us-ascii?Q?Upt4WleD7SVk2bV2uyhDAxobCxOsJb40Ie3jEQfCgJaEOysBv5PgUj+i0sKa?=
 =?us-ascii?Q?9rjlSVVy5vdUexi++ESIJqFdT4Fj55WEvCMZaWKitf91XJ3Qh+yk6e+7Ad5Z?=
 =?us-ascii?Q?J0KWatfJH68I08JrTZ51oAjB/26VCsySNUi2Eqe/uiayeUCIGTBaqxVGrYnH?=
 =?us-ascii?Q?LUD/e3oK6P1KyeLrC/h7Jrc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kDTNDJhMmxKHx+oJVu30+yll1bf+JgDerVhOtoIzcfLUPQjtgHQOYrhN9902?=
 =?us-ascii?Q?UpyALAqWsuorkq7dvJNA4spO/guQr0DXxMuARj8iBpNBIirf12DXIv1ru8B7?=
 =?us-ascii?Q?baVj4MOWoVTr+0M7vCy4orokZJCbTCItwcDphJWdDPvbXLn2xWZMW4nP9bBs?=
 =?us-ascii?Q?Qbg6DAiwljmBlCXH0UPOv0B8cY7tR32qZznKIauWKvRqFwc5DnIquPQyk9p1?=
 =?us-ascii?Q?2WFwlX7iNAAMd9BvHIO8Ka13q/1/iNFEgPEk5dLFeGh/loWM9WwT6wNwlCZG?=
 =?us-ascii?Q?hu0sIDOcPxnd14+EW/05/1icAkZONuFLi2/ZobPKnUHXlRG7U+Fm8eH8OoE7?=
 =?us-ascii?Q?rg5aZ1dD4q0R2SqUVO0OLr553U1HmInJICAiFZpOeLAuPIUYBvXrf8ADJl7x?=
 =?us-ascii?Q?HchFR5f5hEryPuz+N89AOSu2GV0VxfqJY0x3nsB7cfWL9m8l+EkV7lKiIgIb?=
 =?us-ascii?Q?0imjY3U/KKb0qtvk51quYzWG0TQ4SFOfw1vpxTiVLHkJzeJX0ZkEzNlgSKDZ?=
 =?us-ascii?Q?/3UfC31PbkNaFKUO4keQg5TDsNUJ3OTaivhFxpwccF91zRADIJA7t4Gfo0TG?=
 =?us-ascii?Q?jxmv+SojRG+XLqzuLtuLd7BrX+FGJ55x82wQolcr2vMioQWLBTCorDolx2MY?=
 =?us-ascii?Q?RjBCDXSYtdSjdGhfVqPeNt8hDOkKgLQ4vX0IItAydn+vsy+TYoJuMw2zPuIZ?=
 =?us-ascii?Q?dCBloDv+cPQ+XU3p+bNbupQilrYDkw63iNMTIraexKE1R2cmAv+PyHyfluxH?=
 =?us-ascii?Q?qZgKQT+AY8Yn6wJGF4NsUy/Imem13eIUeE2JrZaqOEJJR51EqGEkHvSpnHA6?=
 =?us-ascii?Q?KvlUSH0WIkxN8w8vKu0jJXDc5GIPWdDLsIZ6z5hZvmkPgJVMdEEYytACjyZ4?=
 =?us-ascii?Q?V7HLGGfxiG4hW/ocJwBdjLuEENVUmnajXyLgU0fayX27LlDKp5ub2Hsq00G4?=
 =?us-ascii?Q?mgYkJDjZHPZWnFldKuWpx0a6P4/Fe4OH1t6QWjwD4ks06NNQtcRAXQ0luBf9?=
 =?us-ascii?Q?OB7CuQBrcdjeh23c0yG+h4xfLN0X/Tg4HgkTabONxcSkf6wByVuIg+obbcPu?=
 =?us-ascii?Q?5U4/W8re/ux7sq7BwurGD17Mwqe5ojB/Ez1z+slEzE2VIG41NApdBrm8kAu9?=
 =?us-ascii?Q?oQ2kYnqIOT/GoYu0h+e0R6RNiClisteAlqWaz7XDu+khgrO63Ebd9JcaPlB+?=
 =?us-ascii?Q?sEtazm11jvE1EMC/F/OnYkLSN/w7i7qyR3BMMwu2eE0xPzaN9OaILtcLEG5U?=
 =?us-ascii?Q?AxgCUNYWmoIOsERF5Gc66hN9fTQFCvf1hPo/i5VE0UACfZIdett4didY3UnL?=
 =?us-ascii?Q?Mdv8s1M6PiKBU8g5e9PY1sM0eAa+tbgcTybSk1hRO1Uc06gxwTyIrOP9QfqO?=
 =?us-ascii?Q?NhrJF8DexzeA/0rlC7o/Ld0EE9NAw6Th4zKCqwLJ8qDF23goicSxwiDL2/0W?=
 =?us-ascii?Q?5+6upi2nLpTIAGi0okcSHWJj9fVvPQOGdUT24t5uIseUdg89QmL+FYZBMwOs?=
 =?us-ascii?Q?SD2YqF1GSSRUduD03vJwpqlMQhk8q74TQO8I+7p/oLecxrQnc5De2qOqyIvE?=
 =?us-ascii?Q?FFvdicQckQwaHAeiwE6oYoSqQXNTUu2t35TE2+6z3sN79qmbnuXcePVHqDKF?=
 =?us-ascii?Q?FmOIbpiIIyK5ssezA2r0vQmRol/FPNfaSYFhT2OhBKa3cckH6kTr99Z/7lkL?=
 =?us-ascii?Q?ptm/trkq4r7hjYcVwKshLqUDoiHCEnhEFFt+BYuAkOVkWc5Z?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 936222ff-31d8-43c3-3bfb-08de67a8b48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 06:59:01.4330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnRGjX+6bGbc+4JXn2CuCdLGtDw8g+nUCMNIYj3A4ufL3KfK3udFRZZS9H46QPlHGruW7OR5YOBSYvZbPzSROA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9580

> Subject: [PATCH v2 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-
> ep[0,1] support
>=20
> Add pcie[0,1] and pcie-ep[0,1] support.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 82 ++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index 765d9d05e489d..524bcb5951151 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -49,6 +49,20 @@ chosen {
>  		stdout-path =3D &lpuart1;
>  	};
>=20
> +	pcie_ref_clk: clock-pcie-ref {
> +		compatible =3D "gpio-gate-clock";
> +		clocks =3D <&xtal25m>;
> +		#clock-cells =3D <0>;
> +		enable-gpios =3D <&pca9670_i2c3 7 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	xtal25m: clock-xtal25m {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <25000000>;
> +		clock-output-names =3D "xtal_25MHz";
> +	};
> +
>  	dmic: dmic {
>  		compatible =3D "dmic-codec";
>  		#sound-dai-cells =3D <0>;
> @@ -70,6 +84,15 @@ reg_m2_pwr: regulator-m2-pwr {
>  		startup-delay-us =3D <5000>;
>  	};
>=20
> +	reg_slot_pwr: regulator-slot-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "PCIe slot-power";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&pcal6416_i2c3_u46 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reg_m2_wlan: regulator-wlan {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "WLAN_EN";
> @@ -641,6 +664,18 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL
> 	0x40000b9e
>  		>;
>  	};
>=20
> +	pinctrl_pcie0: pcie0grp {
> +		fsl,pins =3D <
> +			IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B
> 	0x4000031e
> +		>;
> +	};
> +
> +	pinctrl_pcie1: pcie1grp {
> +		fsl,pins =3D <
> +			IMX94_PAD_GPIO_IO23__PCIE2_CLKREQ_B
> 	0x4000031e
> +		>;
> +	};
> +
>  	pinctrl_pdm: pdmgrp {
>  		fsl,pins =3D <
>  			IMX94_PAD_PDM_CLK__PDM_CLK
> 	0x31e
> @@ -800,6 +835,53 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
>  	};
>  };
>=20
> +&pcie0 {
> +	pinctrl-0 =3D <&pinctrl_pcie0>;
> +	pinctrl-names =3D "default";
> +	clocks =3D <&scmi_clk IMX94_CLK_HSIO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
> +		 <&hsio_blk_ctl 0>,
> +		 <&pcie_ref_clk>;
> +	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
> +		      "ref", "extref";
> +	reset-gpio =3D <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply =3D <&reg_m2_wlan>;

Missing vpcie-supply?

> +	supports-clkreq;
> +	status =3D "okay";
> +};
> +
> +&pcie0_ep {
> +	pinctrl-0 =3D <&pinctrl_pcie0>;
> +	pinctrl-names =3D "default";
> +	vpcie3v3aux-supply =3D <&reg_m2_wlan>;
> +	status =3D "disabled";
> +};
> +
> +&pcie1 {
> +	pinctrl-0 =3D <&pinctrl_pcie1>;
> +	pinctrl-names =3D "default";
> +	clocks =3D <&scmi_clk IMX94_CLK_HSIO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
> +		 <&hsio_blk_ctl 0>,
> +		 <&pcie_ref_clk>;
> +	clock-names =3D "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
> +		      "ref", "extref";
> +	reset-gpio =3D <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply =3D <&reg_slot_pwr>;

Same here.

Best Regards
Sherry


> +	status =3D "okay";
> +};
> +
> +&pcie1_ep {
> +	pinctrl-0 =3D <&pinctrl_pcie1>;
> +	pinctrl-names =3D "default";
> +	vpcie3v3aux-supply =3D <&reg_slot_pwr>;
> +	status =3D "disabled";
> +};
> +
>  &usdhc1 {
>  	pinctrl-0 =3D <&pinctrl_usdhc1>;
>  	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>;
> --
> 2.37.1

