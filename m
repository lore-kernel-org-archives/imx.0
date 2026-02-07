Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5404A3314C5
	for <imx@lists.linux.dev>; Sat,  7 Feb 2026 03:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770434969; cv=fail; b=oVpGrcDjmzrqZ5szpz64q0u1CZQAeAvrkiMIrrZCW7UHPHyYtzof0E0jn8yRlqrnZIzBxDyWoDEARYSyjcuPv5I2Bywmf+cWes+14evHEjV16gCb1lOl1WFmRhz7QzoV9MtiXXKi6urTFPfta4U8+4dPvWfQgjn7fupdhy0YyI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770434969; c=relaxed/simple;
	bh=I/EtdG4+KyPneCjd0DkgUPi07G8l87okGEIWvCS704w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V8P+02r/i7xf+82LIWuOPegx5ypImL1MDEvpmffL7cAq/ukRtLluKHyFOl3cvuflAcZZ+cGWZsMZ9y9IvfaUIy2CqJQWO5OpQgsWrQV+XJIMbVftlacSVXZT4lDXNxw9DkiGGmtB/fhvXAKFoX0GLApHh2T9QD7r12zYqbm+tqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QnjlUxNU; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QnjlUxNU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVutyYwMHBVFiXpsrkem3r6BoaXhljA1h0nt7FaTCHdVIf2EYoSHYb4r5V9tVfk3HXBd+/xYSupu1gX41z+inl/0UoOjjptcgq4FgIMl7dVF9X+4arR3PLoiboQNZWKPOdsO4rb8x6SLZdsadvXFVDhuOQngr0YmCotUzc4j5QwWMScttFtfp1AQN6d/H19PBhPkfkkdsIB8swlzINPcroSX0qLwBgpYWugh0aTbvZraYhKdT7yaNKI7T8PBmXakhZRnLlIAzzfCbdKCMH/DatPmqLrRkoB6eEppz0e7t4g8t5H6lhT5M057bu92pL3IaoHwda9Rt6qZ5PSt7mmSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vi8oR8neAoM1mEAoJnNzIC2oK9R599CraxZul03xdoE=;
 b=Z9MnuyUjmAgM3lS4Rnej6ChIU1DlvJOxfP78Lr8fqofyPbBcI2ETTaw4dpLdBsanP7kzgz1J5snx4/R78VebErQQuji5kTIlsJxx0+Jk9seJjId6yBaOKXmii0w6A/92ptXNP0qhL/+/GJPhiOJF+HULfHxxr+dBLT/bo/2uoOcNONmV3sS5rUm8tI3Ll8ZbBY0Pdb1hfpDGxeqJVh5h3IRzbykSALYr1ZBgX1kgILKgBZA/u5Ic1wlOaehpXYwWVvWBMhM6m6d5YoXSL7Oy0cmLP4VW9Mj8TM8lJkmvooHsDDlWBViANZ5TWS/OCQrMNHrSW2073yRKUU7MkoHjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vi8oR8neAoM1mEAoJnNzIC2oK9R599CraxZul03xdoE=;
 b=QnjlUxNUFJwh5O8ilni0cqS/yWH04DORXC/sYn7n9GQEg3Or+p6jq0cGloQF4ccVe/jCaFkUY5Wwq8uywYrI4o1FVHNOU+3J7+4zRrs+fizrMwkcPhRDIqfd4odffn4p1aTAE9pP1vnGq1qynRJEX1P5E2n+pxEoGrxjNWVs/hA1+nQQDnMllGlo2twyMq/HLTsqRdQIxx2ltj1fGWB1yyEBu7fLgtDlZTdmeQqaGATqfDA7lhpaBIAk/ZjDU/AI+aJCpzNlBcQ1ioqSD6aV8RCOsBBwr9D3EqG++a6xg5HD9uYNDgMWlULvgxQJLLXFYVsEb5PSCNpcXzekg8cS8A==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DBBPR04MB7945.eurprd04.prod.outlook.com
 (2603:10a6:10:1f3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Sat, 7 Feb
 2026 03:29:26 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Sat, 7 Feb 2026
 03:29:25 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>
Subject: RE: [PATCH v1 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and
 pcie-ep[0,1] support
Thread-Topic: [PATCH v1 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and
 pcie-ep[0,1] support
Thread-Index: AQHclyxZ++Xlur7e+0+Ejy8NYVEnkrV2lMBw
Date: Sat, 7 Feb 2026 03:29:25 +0000
Message-ID:
 <VI0PR04MB121144CB5409498A2B52B2D669267A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260206055007.3995679-1-hongxing.zhu@nxp.com>
 <20260206055007.3995679-4-hongxing.zhu@nxp.com>
In-Reply-To: <20260206055007.3995679-4-hongxing.zhu@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DBBPR04MB7945:EE_
x-ms-office365-filtering-correlation-id: bd4bf47c-2782-4a94-ca98-08de65f91817
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WZsVXzptD+zzenEPRGCjnYuZQyHleLrxAuEhR25ti4ihbWENNmHHtMme0a8f?=
 =?us-ascii?Q?YcriemQRLOKblekZ/X1Df4Uq/au6kUcW9elBs2u4/kO/kvbd3xxfnQ6ihJl7?=
 =?us-ascii?Q?JeTsXz/LQgJeYtL0Thx75pM3X3MTodytyJXKqvQv6Pcyb//3+08CYKANKal7?=
 =?us-ascii?Q?BHNYb6QKeUGtjy1foIdh8VYUUXuYNjv6YyT1/BFWFbFsAJe8x98F69IzlgC9?=
 =?us-ascii?Q?T8rcBZ4Gf8RF9mWWS0XoEnPYotPN0mTCq4DVJb9HomVZ3pWC0oVul7YAjL6X?=
 =?us-ascii?Q?9by7tMHPlBrwWzHRNYqNmdEVBUxxvhchza/unZQtvwYHfhMlYeaH8QSwYhTH?=
 =?us-ascii?Q?CXjnETY9hK4bPOZCSvy+jNSmT/C5VTrnwFa9Sp4WAvZLUWVekcf09mJnnaNY?=
 =?us-ascii?Q?0RyVB2lRDSNygVv1kY9TYMLiGxTW5r6RlWsX12DAnlZIiaShq63Jq3EoUxb/?=
 =?us-ascii?Q?fUL7/CX45YO8a9ePlni1NEBIWOchepokHs4bOvor4kt0dy98fEX+AkAEzEma?=
 =?us-ascii?Q?LoVGq+vC3FXqNfSLayx8Xdielc+fWxwGetqvqywWbfta4dG/fs3xft2rarC3?=
 =?us-ascii?Q?E/cUTUp/H8PNEjVJDA29gqIJ9fZZOeQpm8qPKaURXk6ilfuKfMU3aHma2eAC?=
 =?us-ascii?Q?O+7opv/BPmoLv+Jzz/KH7EMEOUNYLvj1p+uabQOk8Lm+wgVMqKVuZgqtUisu?=
 =?us-ascii?Q?x4vb0kr2dlsUc8GeG0OwyOaBVyhO2LfppwNCJWfao8MyFIHNiscEtkk+NOjj?=
 =?us-ascii?Q?F7HFzCZfOY+7XS7JyXWxppilhU/rrbe+KgnVLK4+nTzbNM6tStPY1vIKWYv1?=
 =?us-ascii?Q?649AyaSoi2rbGRsGwuPZk777ZlFrlHB6WEymMseVhLGkNR1dfhVvRVukEeWD?=
 =?us-ascii?Q?AUsOM05x55/IaQmGdkIU0i1LGDrGmPIGttgUK1LYuQ6OShmOnfqXX1IDNeUo?=
 =?us-ascii?Q?yh8loWMTQ3c+pFPj/EWMjqh47xSYQ+4jonLzpB/7lg+Z0ceBvfr5iI8gbts5?=
 =?us-ascii?Q?faLFqLm8i7lknd+DmhHXTJwClJ8Hf8NYBbNvnw8Wg9QlhF7Tev0cSN3ZsbEI?=
 =?us-ascii?Q?yodbb36GKb2aMH+HpsX+T7npEtsCDeiq/PLGTBlGxnwVUEnfTvhElYglKzL1?=
 =?us-ascii?Q?+bb3/BM6rNULKwdtxWFhlmrUg2O2BUz6aGiSom9m2xgoQqg8U1umCfh+yVNW?=
 =?us-ascii?Q?73wb397XsEXUQiHtY8CDp9G1+AJ4MaRnbQsZp7a+D6qHkfLvB0MhQdWI8hEr?=
 =?us-ascii?Q?MIci/1KmXk8CYrVy9wpxs8mz5r0ok49W25XlJouyDlMRxrtXPFe5ENrb8UyA?=
 =?us-ascii?Q?tHIjEPipCL1fbTKVehD/pwl4+iMZfRcS5Zoh59vYlq2joBwYRroyU6t25j0z?=
 =?us-ascii?Q?/da9iVk8of/Yw9bcGYX8Y2vtcGvNCNfNvXC836at6D/WOg/u3IJNcg2wV1Vt?=
 =?us-ascii?Q?t85F2UDnrnFFUHpg9nxT1S06+hlDpAmqK087GRuPkh+afOdsxmVYakMSKwON?=
 =?us-ascii?Q?DjDOM+UrMOcYZWul09pjBNz/jEnaNBpyNmpUQ8KcCrwhuM2VSFkB+WMFA2LT?=
 =?us-ascii?Q?NnPCKzWkWN33qmmmNO748NAiuMAfrz6fKqkj7gsLsZtAosW7QbfBeM/SzR9x?=
 =?us-ascii?Q?zaP3WoO43lLhPI2TB/KQH1A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/fxPPmaOmfIIB1JakT7GosvNct86u4t+xfPI1rW3SVnHmFIo7a7wBHKP2S4h?=
 =?us-ascii?Q?qCxSBjKjgUMAVSMP+4ICE5IczQZ/j0ataKe39CKqTf3e+Jxc4fs/hCkqRmOI?=
 =?us-ascii?Q?QIrjcLp+FiUIRHwtyZW5+j0TAGQE+8HITIqjBBbx4U9nMQfNHDMlhp/Fe9vK?=
 =?us-ascii?Q?BcYrGEdZ3NGmSsybEVfeIRHJsG5F6NHkYjnUHS7qD+lyWnmJSNwB7irqOuXN?=
 =?us-ascii?Q?joZ58i2VVmVHR5xTI8NKpDyj8s1aU2l9esdw32TIiHeB9EAKF8/szi/+Byf9?=
 =?us-ascii?Q?JrSMsRMIkotvYJMqHAOEQZGtDigMTcvSUleEzO9VQ9rbmEFcCL1/4vb0e8c0?=
 =?us-ascii?Q?alIAIdAQ9h/DPNDR4bEx7DE6gnSigajS/kktAwCgHGDd5ejGLsvgWIoJw2Xh?=
 =?us-ascii?Q?jDpouVctRYwWihPHKhANXn9m0Y/Hg6dEPKR33m+4MpXb8FGJ2JToQhk84ldF?=
 =?us-ascii?Q?q3BIZNmWNjgYWO4Pr52wmJZ0SlgC5GRxOul9AEyDrkIaElF3hu0M2ylCQM59?=
 =?us-ascii?Q?pmrmHrykPmpMZF87hwyrwiHRYjNgl/zLGa0aty/G7jM9KkrMRihICYJnvlHA?=
 =?us-ascii?Q?hKCCSqfW4sUYsKdFIGQb6EKpKhb5mxZRdRxzgEv+uNAiOgrP5dth0r92xbgW?=
 =?us-ascii?Q?Y4qP8sQSGbznUYAls58LCUutqATxHH232d6SmLlBUx9nI0C6tYYdCKQTPDz6?=
 =?us-ascii?Q?v0/nRU1BAIYDyQL4N7OKw5LFXa20Oopf6SxYWsqz89FKzJpSp+TSEvlToVMi?=
 =?us-ascii?Q?DH0biM8gLHDMPgo5USzTfe69Fjbmty2khnANouRMJhEr3F9fq0ZmUZSPP8Yo?=
 =?us-ascii?Q?vi+xPAtskwNgeXD5WOp0Ncjqb3d1OX7NKBX60ZY1+/LSTzoN3iLtmBdXRSDL?=
 =?us-ascii?Q?Dt6jrGFDdYVeVfh/9syf74gBSQMIBj5sKuk8z9U5DmgkFXnNohyO11fcWsQc?=
 =?us-ascii?Q?1a0qEJLo4VJJm5U0dLSvtg5ZCUw8W7uLdFsBleHYVtU7e92KGTOxf0ec28jZ?=
 =?us-ascii?Q?13M4RLgtNP32gQc1nP5VkmpdoILzbWk+BfDeWVE59YKNjvfdCr8388m+q1HJ?=
 =?us-ascii?Q?UXRsPqi1Aj2LM2cY2IFSrxHUucenXjkRxaJEo/NZiw7Q7qWH/frKbD99G+QK?=
 =?us-ascii?Q?uJqm/GgYMnZ7VJ7Pad+RnlyDuY7kTbEQQvJXrgta/0rliB+lPGaNBmkyyBt+?=
 =?us-ascii?Q?c7+3HODCQ3WSokPPNWxrM0qcXRrVl06tPmQVyXR24+t9F0Q8fUDXaD7g+oWI?=
 =?us-ascii?Q?28EMM7LDrVeRtKmeXgtCxbQfPX8RSVO65h8DvwL/+UpcfoBgoA7f5p3FvT/k?=
 =?us-ascii?Q?t9C9zKFdIQv77/qpZSxKImkB9UsMi6URdjim8UMITncUysJEcFdZH4Hq5k3Q?=
 =?us-ascii?Q?Q552CQiBmLxh3pqKW/dXgPTm4ATpwLqBV5kb9/wQp99lzHIRsbqYJT/eeEU+?=
 =?us-ascii?Q?ro0+ydwyQTNV6ZNifIzah5t/NsFnLlHQ8WGMnjjugDWS3YGwECtiJr+Sp7Ga?=
 =?us-ascii?Q?sYtqDLmY31jm17oVcVcn6+NH8Yr6/ccR7wAixuMk/RIXpzhAYQLnsNO2L4fo?=
 =?us-ascii?Q?kzW43o16MGn7yHNkmqev/m1YmTm+5lkN/rFzXmrausuyiaqF4eJWOSduzijL?=
 =?us-ascii?Q?tpYU/x0X7tgveGp+uJHgOFn6WrDC/zZWBxtLBC42qB5nlYrjbHIiyNtyV2mC?=
 =?us-ascii?Q?pGdjP207uaXgyvncqDg/DH5M+PePjPECOVevCoUvLiRivgCU?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4bf47c-2782-4a94-ca98-08de65f91817
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2026 03:29:25.7797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ouLKAHscBOLh9dBgVVJ8xum9l06N6oEXn3A3ibPqtQ6+cJj0cCDyXRRWgNRwC4grZkhE8RfpREzLxv5v9OUdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7945

> Subject: [PATCH v1 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-
> ep[0,1] support
>=20
> Add pcie[0,1] and pcie-ep[0,1] support.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 108 +++++++++++++++++++
>  1 file changed, 108 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index 31fa9675cee13..37a8349bc7905 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -53,6 +53,13 @@ dmic: dmic {
>  		#sound-dai-cells =3D <0>;
>  	};
>=20
> +	pcie_ref_clk: clock-pcie-ref {
> +		compatible =3D "gpio-gate-clock";
> +		clocks =3D <&xtal25m>;
> +		#clock-cells =3D <0>;
> +		enable-gpios =3D <&pca9670_i2c3 7 GPIO_ACTIVE_LOW>;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible =3D "regulator-fixed";
>  		off-on-delay-us =3D <12000>;
> @@ -74,6 +81,41 @@ reg_audio_pwr: regulator-wm8962-pwr {
>  		enable-active-high;
>  	};
>=20
> +	reg_m2_pwr: regulator-m2-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "M.2-power";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&pcal6416_i2c3_u46 2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		/*
> +		 * M.2 device only can be enabled(W_DISABLE1#) after all
> Power
> +		 * Rails reach their minimum operating voltage (PCI Express
> M.2
> +		 * Specification r5.1 3.1.4 Power-up Timing).
> +		 * Set a delay equal to the max value of Tsettle here.
> +		 */
> +		startup-delay-us =3D <5000>;
> +	};
> +
> +	reg_pcie0: regulator-pcie {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "PCIE_WLAN_EN";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&reg_m2_pwr>;
> +		gpio =3D <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
Hi Richard,
Please check the patch here: https://patchwork.kernel.org/project/imx/patch=
/20260204022306.2372889-1-sherry.sun@nxp.com/
I have added the reg_m2_pwr and reg_pcie0(rename to reg_m2_wlan
to support SDIO wifi), so you can delete these two nodes in your patch.

Best Regards
Sherry

> +	reg_slot_pwr: regulator-slot-pwr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "PCIe slot-power";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&pcal6416_i2c3_u46 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reserved-memory {
>  		ranges;
>  		#address-cells =3D <2>;
> @@ -144,6 +186,13 @@ memory@80000000 {
>  		reg =3D <0x0 0x80000000 0x0 0x80000000>;
>  		device_type =3D "memory";
>  	};
> +
> +	xtal25m: clock-xtal25m {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <25000000>;
> +		clock-output-names =3D "xtal_25MHz";
> +	};
>  };
>=20
>  &enetc1 {
> @@ -609,6 +658,18 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL
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
> @@ -756,6 +817,53 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
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
> +	vpcie3v3aux-supply =3D <&reg_pcie0>;
> +	supports-clkreq;
> +	status =3D "okay";
> +};
> +
> +&pcie0_ep {
> +	pinctrl-0 =3D <&pinctrl_pcie0>;
> +	pinctrl-names =3D "default";
> +	vpcie3v3aux-supply =3D <&reg_pcie0>;
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
>=20

