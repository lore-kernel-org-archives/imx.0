Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE5084A35
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 06:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770273020; cv=fail; b=SBOW0o04JQoo7qtpcj1oBxjkZhGSmD1vdh6e19II5i144JaCj0j7WSKMFTPcHx2xTeRSKJy5hP9tDj3iXvIvzfFN7dCagexY72oP++xBWG1evGw5OzvBjfKLQASiCFoIehQ7YNMlyrEtL0lRwoUID6iSTGy7sdZjjnP9RTpdG9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770273020; c=relaxed/simple;
	bh=X64t9GHjXQOzNFOj/sR3sG7mXgpcptc6soPQfBOuiWg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HpAJr8ZV1LwLslhpiDCuI4ZYXjSfLG9S8bEOHZJxxJnowcGVyqfzSufK13DWWyrFZIu1IHF5FOX/2O55itOH0O3alkSteub2Xn22MtP9viDBRu1v4q+zBAlNLU4dY/TUWbxBJo3zRzC1ilQ5gLu+4CdR3oC0Sd8FeMVbrRs3rgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ecAjw071; arc=fail smtp.client-ip=52.101.72.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ecAjw071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCbrb3UN9k2CZDfpXK+4NwJATdlV9ioq5LMuz/mXGKdqx7d/3sq41h7OIGRYZE3pNtBTGi4Em/ghuu196YEf+ojp0+VkXOTZjDotCbrMM3/N229zNxQPKFIrAx9bavJz8SHO4i+2GpWLE6luN/76F8+JI2NkvOakHsaVCyq2awzDLmRZZed+c6YLayDbCy/ukW4UwJx0tCvqsrG2Rv1zVdKCx1B/haEzRULY1xf0QwaMGDUzqu/M3Zkwc8gRScMOy4DsNa0vIIuQ6bi+pUl/7ttV9RZb0fqXLRLTa/DaFPkmFExpMrb1myfsLIcp1pzSZVjzYohYSG9QLlOvaNfISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnlMDjphfYRN694dreIcPaZ0gGOgyPZIRrhSPAe+kHo=;
 b=Ay7mEC5a1STwXj0rsRgKCpNNR8xwAYv2n9C/zJE/PSkNz6UC6l2bTyvbtpSr3Sl5Y4spORN+l8z823PkNoOOCSIck2njY4xtPmRDa7WpYpBpbnm2dJGa49An591iSuw6FUgfRqNUpHwO6mjdisp/itNoNc6jhDN7DndDRTUWkm3TQSyzTqBJGw3iIxo7MaQyqVlKkN63tztvWgg88XpBgncowIBhn3HIdBa+hkQRuabE5uxNpJyGEwbD60B+S2QabK/J5rQxBT0guyIrdmxi8oHccn+natGMz83tAlSVAwTDk5DiQI+bvsCHgNASkq0YBNo+K7JT3vy7fHdtcltECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnlMDjphfYRN694dreIcPaZ0gGOgyPZIRrhSPAe+kHo=;
 b=ecAjw0719xF3IqLK7ANusWS5EEkqBE59QEsvyYNnORlgRSRdlzCDGHPrgY/7Bo/i8aOpUsKTA4FiuXnvgPAZ1FghX8ol5Dc4xf99IK11BPY8qm0sWSAVKdmKb/ZeiAyKTjt4K3mL3ApEoLzz2rJx4TnXGtQu+CiRHbX99hBvRSOrZsSsJ0l8UcAKBSPuXv7234IDomKYnyGqvmQJdQ2CQ6G8lT4dQB+gq1+ZUQwLLR18bRhqkt4YQ5VGBureOz3GqZYAKiwjTVV41YyssLPV1wb6tRTHViD0fIL3tUt5E5R/jTVs1NK8GBoVYtir360fCyXgST7BBK4ZTMVi/cMxlQ==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA1PR04MB11429.eurprd04.prod.outlook.com
 (2603:10a6:102:4f3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 06:30:17 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 06:30:17 +0000
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
Subject: RE: [PATCH 3/3] arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi
 support
Thread-Topic: [PATCH 3/3] arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi
 support
Thread-Index: AQHclX5aiUCo7rm30Eq4+zUKNNhMcLVyramAgAD4+YA=
Date: Thu, 5 Feb 2026 06:30:17 +0000
Message-ID:
 <VI0PR04MB121142443CE87F6D9119108E19299A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260204023204.2382433-1-sherry.sun@nxp.com>
 <20260204023204.2382433-4-sherry.sun@nxp.com>
 <aYNn4UjvqPy_N-zF@lizhi-Precision-Tower-5810>
In-Reply-To: <aYNn4UjvqPy_N-zF@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|PA1PR04MB11429:EE_
x-ms-office365-filtering-correlation-id: d64aa997-8260-4e81-8f3c-08de64800794
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ltpR8bO4BnKoDbH8hetojWduPz/JcwrO35esZpy1zFwBhlvLfCUXGFht1mmc?=
 =?us-ascii?Q?NVtlac0VYm3OJV952jzdlE8Q8j2Mw29ybkspFjJx9WinLQrIyCDmNU3YZ9YB?=
 =?us-ascii?Q?Ck1TtF3HBqcok+XQ0kabZc5TqLRSCMWIihlRIx6K4qCD9l/ngQZUw/6Cptno?=
 =?us-ascii?Q?fnaFLW9Xfwaf5+bzFbD1zpzXpsCUQSJxE7MDZ9/vhDD+rdRyshQ5qYmA/NAF?=
 =?us-ascii?Q?PIiOZZPdhnBZCKw2PMLS0p/hyXMUpQziooqKGeNGI7+pEn7HPAZ8V7G67tdL?=
 =?us-ascii?Q?I3AAY/eMjqAI5HTsJJfF2MMxdHPfFxM7dKaQ6RI53otk/HA+GJr8QeDVEp3o?=
 =?us-ascii?Q?o75Y/4VW1lk1uXwwXHEdCNxwjlSjepRK2a546hBmzidq52xFOYSTXOfTEKmN?=
 =?us-ascii?Q?OlOxixMFSdKrPCiW8QCsBDoI7VkMS6jBnMUhKQkwKAThEHKJwRMFx+yCbl1V?=
 =?us-ascii?Q?4B7652ydXzJMVOHZzUZs/t5s17sR7Y9GmneHJtOkF6lGkGx1V0MuvWeW58//?=
 =?us-ascii?Q?ML77e3uwKjMeE8SBOASroqF66+FWxY9O+HYVaAR4fpxBGZa7ZCLXO/OFl00t?=
 =?us-ascii?Q?QvXez89FE92gCTWW89zl7PVA1U5zGnWpaf83i94CMNnldcUkrlc8CIOzMGF3?=
 =?us-ascii?Q?lGzUOciJJxwAF+uwq8r3L70C0cM+AB/1ymWzGX8OYns81Wi63elgAyKWYxLT?=
 =?us-ascii?Q?PRl0KHqZKjMQ94c/H9dfT/ypNMBX8EZPMnNjncSn9qqwjgKmcnKqPTGaMg66?=
 =?us-ascii?Q?ov53REL+Z9/C4TY8D3rbFhgYqb1FyxQMUa06WSWvrmrMmrMJbz+yDE84EZLm?=
 =?us-ascii?Q?39jX76/ajgyrHieny5Ax2P4iWY3TufFgE1+jTmZv2pMWdO/hrcPJd3BUn8Rz?=
 =?us-ascii?Q?51pjs5k5S4i/RiDi++85mb2zjmImHXIm7Kbv9W8aijElWX8e1I5NDE3FQrP5?=
 =?us-ascii?Q?lxWExSS+gNz/QdQWCq9dJciveaRmooXu97B831UW6CRBg2JzxMp/7UJosuun?=
 =?us-ascii?Q?08tS/TH10tBt04Tza4VQk8goHf551D+5XNJME2o/TvjvsEgeIw9OEWIh76gi?=
 =?us-ascii?Q?zH/AIYWCk8BL/ehHhIeOoElv9ZUFHJCZMBj/IRiL6lxga1SYw7aicr6Ex9Ap?=
 =?us-ascii?Q?xcW5oih8M3Ptufx7cwtnWXK0d9Bh3M6zLFuzlkPoBy0/mExe/lONLWmAZ0LT?=
 =?us-ascii?Q?mozU1q25z7uHFe2GUK+7QOQrSnyOuGX/qTGw3zJwYzdf6776SpScgMI3NBxu?=
 =?us-ascii?Q?5ZJZqDEikunrOiVmkI5DvxS4USgxt2m5pNdUnt6p45O240nskSYa/owE+djd?=
 =?us-ascii?Q?9Kw/preaD56frWtT9GQ/Jjf+RjvBBNUVNdHK4IRbmijAL0VM6u3nFJ8C8gtO?=
 =?us-ascii?Q?b6dAT1AAabeMs7XbezgTcpxZYdpDcWUQivEi18UUT50BpSQmutkHpTg45Onl?=
 =?us-ascii?Q?dlB7NUvz890VQIfFufpJBP91rn2xaeBqccldwHsKgO5amTmh8K7MFYY94r1k?=
 =?us-ascii?Q?wt4mGWkYShZ+KMwjJApitxYFTOgLcSUKKELm1WeilXP0JxUtkFq7BwpHmLFf?=
 =?us-ascii?Q?oh5Y6WD4xgApCjxwON+P3yFSnI6RzGOj/plJuaqibE+S0inN6vkbxmTVW9h9?=
 =?us-ascii?Q?BSy2xB1cbUo/kEGRvUSravE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?U/D9KGC8StPTAeLwcOy39HHqywPxUi3pYMsb3ZCBrpspoJILeOdGC0EjYcTp?=
 =?us-ascii?Q?2FmtD8+154P19sph4QGA2B4WPQIcOEbjjR9wnjoL1ept/XWXb/DD9wmFG5VP?=
 =?us-ascii?Q?B8419UrKFpFNR+ni1viMc+MIItjc4/l/vhUtmFds39NKFiObZNl1dEvO1pb0?=
 =?us-ascii?Q?09RZmYPUpY8qDsLxCsM0L3M2pl/iGgHJZUe1rCcRjorhbc5O5sum501GvhXZ?=
 =?us-ascii?Q?+MPYTgTYI7bqnUkG7k6dY67FlTZ4t9OKgs7/PDgSsY8cbFwpzESIGOVPwg45?=
 =?us-ascii?Q?Xnovb44iKRpET4nL2h/yjIcK41WLlUSDbh8zrYBTJ1nhCxmxYddrQGDXAqpM?=
 =?us-ascii?Q?DR/yIeZiuGTJ457DB2R4/Z/2uUzoC9CqpPpgnv5p32vQb67+uMCbjT7nT0rX?=
 =?us-ascii?Q?u7DrLM2Pbp+Xb4F0Dy1Ro4E2uqju+XhlgToVWgAwOnKW2vqMo8TR5QK9fnU8?=
 =?us-ascii?Q?IXR7OT2w3VuQ7DgJoP6esnY+9LLYdKWqwg2dyHz3EkIVWo1a5QTe9o+IMrge?=
 =?us-ascii?Q?0viwk/uOxQO6m93aaUeNYrU/RZFT7XSi+2uHI81tOvbCJcLWBEFdIfBcFdDD?=
 =?us-ascii?Q?ZnazbDNFS5/XR5W21/S2pnTZPQS3pQoikltPpA3SYXiz/+0YEglPUgBculC/?=
 =?us-ascii?Q?niR4m8qSopBhPoWf8TpqhP8/5NHvQxaw6qHrKl9AgqNizvpxz6eoyrjXd8cV?=
 =?us-ascii?Q?BqLp8E5RBor/87j4SsdQmbzWGFYRr/6az+OQMy4w94feI6qm2fHHv/8wOsIQ?=
 =?us-ascii?Q?sig6SolGjv7vN+6OJiQNavJDmcznRm6FTQA38brO0wRv3Ux64NAKbums0Wza?=
 =?us-ascii?Q?KQAvhNol0jxfDcQC9U1qtekvxEIAXh/5oIqMzCqgTwieVK34MtoE+buG/0EA?=
 =?us-ascii?Q?8hPRiasULv7kjWRyGZUJaI9ZZomlWb06rvjClxxg56e2FJZpowwLgLVPDLOW?=
 =?us-ascii?Q?9WWPE2Bl8aSAJ9KeAtvUQ56SCwhy9UsRKAxWSMoaeZ8uKqsg5qc9kWXEHFlY?=
 =?us-ascii?Q?cu5i4I6dG+B1jl31xsVjK9BAkOWro7H0bwnV4pfLK985DrK0NRK23003q9eH?=
 =?us-ascii?Q?QEVKHpfssD1sTIg5hl3NGRPKS+1Sw8JGBYrfYOw/aeKao0AewCfQua4ApzR8?=
 =?us-ascii?Q?Amh7J9vAuvH+n+ws7mkPaVQWFpPlQxgsAMT/myCqBqitS8idQo/Y1e1z+O6j?=
 =?us-ascii?Q?VkNx98f2m2o38CUBXc/4xX6n4ZaKRgL0WCDIoLJ2YM9dWLgwyfzVH+ZHxPIp?=
 =?us-ascii?Q?Xay2Ps4IQeyJbtTmE9obbY7/MTtT3407CFiQFI9g7kyIXzKDLsfd2wvdumvI?=
 =?us-ascii?Q?/jIpQUGuZiRI47+d1J6d5h1ktwZlOEBmP9/3d1DNMnmmMg9yQddmLF0a/VQd?=
 =?us-ascii?Q?xD9S3zurqzWZlPhguOHoqE/6IFySSiZYO6/1twZANF8NJefZKqPnmyJyn5rW?=
 =?us-ascii?Q?pE1UCoMTPGnbhwjZwZbvfegQwHDiCci/Xo+uz08j3cc1YX4f9Dli6Tbtlc3K?=
 =?us-ascii?Q?S2M6wEvjrpNTIcxiU4XR5Uq/j8ljh5rVsP4VBsBnq3TufNEoUoW48Gv6r5Kf?=
 =?us-ascii?Q?dZZgSUJicRb3Qle2eBFW16d9SJtiXaLE37scLA1A/bpR6eGmq6mURsC5wap8?=
 =?us-ascii?Q?xUEOKUwUGA16pc7LyojjVjnSmXamZjnH3zhZ5dXiBLycrPZMrdpEy1PHEo1I?=
 =?us-ascii?Q?1AvWCbjV9oTx2ffYeIAo0npfPaAdlensBIw4XZT+wCc5jrH+?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d64aa997-8260-4e81-8f3c-08de64800794
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 06:30:17.8455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xy6WMqGnCUWyQbK74FGMbluEuRjX3BCkwR+4EsfHoVlROu8aKwAJY8YM2unzvI5R/WVXFPaEOafR1d+QwcmIbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11429

> On Wed, Feb 04, 2026 at 10:32:04AM +0800, Sherry Sun wrote:
> > Add usdhc1 to support M.2 SDIO WiFi on i.MX8MP EVK board.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
>=20
> If prevous patch just add label, reg_m2_wlan, you can squash to this one.

Thanks, will try this method.

Best Regards
Sherry

>=20
> Frank
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 59
> ++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > index f86d6b428a47..0b45ff73a5a9 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -250,6 +250,13 @@ cpu {
> >  		};
> >  	};
> >
> > +	usdhc1_pwrseq: usdhc1_pwrseq {
> > +		compatible =3D "mmc-pwrseq-simple";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_usdhc1_pwrseq>;
> > +		reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>;
> > +	};
> > +
> >  	reserved-memory {
> >  		#address-cells =3D <2>;
> >  		#size-cells =3D <2>;
> > @@ -863,6 +870,19 @@ &uart3 {
> >  	status =3D "okay";
> >  };
> >
> > +&usdhc1 {
> > +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 =3D <&pinctrl_usdhc1>;
> > +	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>;
> > +	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>;
> > +	keep-power-in-suspend;
> > +	non-removable;
> > +	wakeup-source;
> > +	mmc-pwrseq =3D <&usdhc1_pwrseq>;
> > +	vmmc-supply =3D <&reg_m2_wlan>;
> > +	status =3D "okay";
> > +};
> > +
> >  &usdhc2 {
> >  	assigned-clocks =3D <&clk IMX8MP_CLK_USDHC2>;
> >  	assigned-clock-rates =3D <400000000>;
> > @@ -1169,6 +1189,45 @@
> MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS		0x140
> >  		>;
> >  	};
> >
> > +	pinctrl_usdhc1: usdhc1grp {
> > +		fsl,pins =3D <
> > +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
> > +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
> > +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0
> 	0x1d0
> > +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1
> 	0x1d0
> > +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2
> 	0x1d0
> > +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3
> 	0x1d0
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > +		fsl,pins =3D <
> > +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
> > +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
> > +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0
> 	0x1d4
> > +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1
> 	0x1d4
> > +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2
> 	0x1d4
> > +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3
> 	0x1d4
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > +		fsl,pins =3D <
> > +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
> > +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
> > +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0
> 	0x1d6
> > +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1
> 	0x1d6
> > +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2
> 	0x1d6
> > +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3
> 	0x1d6
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_pwrseq: usdhc1pwrseq {
> > +		fsl,pins =3D <
> > +			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10	0x140
> > +		>;
> > +	};
> > +
> >  	pinctrl_usdhc2: usdhc2grp {
> >  		fsl,pins =3D <
> >  			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
> > --
> > 2.37.1
> >
