Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2058.outbound.protection.outlook.com [40.107.15.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E8130AF2
	for <imx@lists.linux.dev>; Tue, 16 Apr 2024 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.15.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713279682; cv=fail; b=h1WRTUvlmdBZhe2dvTkscmuX2eMr1NMoQ+cA4QNKQt7xo7jDotVZuv8TdiMQIpEFcLB6G0E4ricJrMEO0NS5RsH+48fua9DW9Suxff0BFXFHm+G6P0rEkt9FP/DRfcxhuwS/Rf4fA4w3usO+bGREfAXNSZPILeMPQCf4MEgQVNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713279682; c=relaxed/simple;
	bh=U77LR2Wsyu7cpS68XdjztdUiAn0bBiIl9DMNAlajT9M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K8KbJSn8KUhLiVdxIeWtE3sY5/QIQWC3KJrOkv8ljyZ+PYWhfBBmU3KuWLRckBn27I61D2Qvf6VSK19JkCLyXBzhp7vQH0k1+o+Mwhm4GjbDuwEl2jIoWvGE6t9zGFVgFc+KqEwVOrN2bopm+dvNt2tR65LbCdge0DIVy2KOEOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=jJMSpz3S; arc=fail smtp.client-ip=40.107.15.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="jJMSpz3S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WO11t6V4DKwBfIYvP+0iMT9oJYR4aZiAJavTkT2RDeYM/IKjyrque9llyHJDJMvTY81J/7/L5rQf27fmj1MVYMLEFCXJpomZxqryWooEM1eRWij9S0NiV2/obrUxilhkyB0I8lChMSTaVZWNyMYSJ0yhuxI8leTX/R9rN1mJwhW8YwriL45YhotGNO/BlSnjRZh3jNXvmQVBloXVdH+p0TkHHFhjDtwrrh6c5+AAUb4OhA0P0ekPH3TvxCys8u+57D54Q8It7D2ENXuE25ii8AaO8SJmrLaSiRoShB3d8oxhk2/5LFjV0ijbtSMetV2Q4UxbFBOfqgjvaEXR6+5i5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+FoYLsobtJx2Ch8O9TBCjQjvp1ONHyWwffKgr2BS7o=;
 b=Qf/ox+DT8/u8w4FU7pdVy3ydRgQQfYS7mnBnWMfGwEQKzQ6NgiCgM1iUZAAFUcMWtLWKcpnUA3909b3IQFXUT1i7V2omx0cYbAb78NFwMKMungAaxPuunwqJrFLqoBOLLrvASJGxVVwsQKXb5Jv2uqGHmLLftAhMdQyfAYWYzVXpo9Qg47n9fotiB6kJRxaDdNKsVMfBV+dDN0tphCTl+mvx/lMy48UKw0hwQpkO4T35FWn5EsBjkgNogecFCS8FgkNcR1rfLzEEkE1kJyvdha8zxN6kfBdI7clG/oR2YRXKm+rxOMEKMQf059oCuMZsATLR+waxRUKLFz7Zn6pWEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+FoYLsobtJx2Ch8O9TBCjQjvp1ONHyWwffKgr2BS7o=;
 b=jJMSpz3SdpWzV0O7LQr1VPRGnfhY3eY32K9VOQZPdufLRp8BG3DxY4tvQzkhsBvSea6ztyiwStCTSBstVJWklFysgOGzWYTgL8+IU+WTtW7wBac4nri+rKbn7eolRNsZen60DRAAUpKxUZY7P1F333lautcynwjDTzDmsUHaXj8=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8431.eurprd04.prod.outlook.com (2603:10a6:10:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 15:01:13 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 15:01:09 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Paul Elder
	<paul.elder@ideasonboard.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "G.N. Zhou"
	<guoniu.zhou@nxp.com>
Subject: RE: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
Thread-Topic: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
Thread-Index: AQHakAmOWMT1O5M1oEi6lA340xpOkLFq/Tow
Date: Tue, 16 Apr 2024 15:01:09 +0000
Message-ID:
 <DU0PR04MB9417681F7C7551DF5BF4C4CC88082@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240416141914.9375-1-marex@denx.de>
In-Reply-To: <20240416141914.9375-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DB9PR04MB8431:EE_
x-ms-office365-filtering-correlation-id: 3268b354-afb0-4ca7-e6e6-08dc5e260c8d
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HmWQHgiyk38IrVqtc7UstFJ1mHuHFz8E3HKssiGDp3Z/dGUeBLffX+Y/5njXv+OMvOVS3Qo7i/HE9DSNlEGdJxskDEos/2aovYn1FGsB77wVAHXTi49ooxPshjVqjxpEgJC8DJgnx5Y29WNWobit2WPJ3zBlcJnUvAsue/6lZDZXjIrX/kLGt4+3eVQ35M9PPx07JPer4Ov60wFlPSFOGq6tFEX0ragOR08i/+W2WdCkxxPXUwo1B92m4QyA2V6/5NQ0JDj+fyTA2rHTfTqltJ/z1dlbubDLaMPJ8ln3pFVBX7cgTcK5WrQ/ljeNRAucKlMIKYkDWIorXpNAgi32fF5k0ekqB8Grz0MfRN8/qg3zeisWlKTqRH9fr54eHQAzHboVwuRHvP9mAVF4Cp3GKCHIw5FTi0bXu6Gqu+8F5Za+SA+9IHYVZHbCzopBM0Ht4WiFrguhkgf3PNyI88V/zoFo0jAlo3XexY4cbDi0ivVTYAZ6fhDs9RVJukULr4gHVJW0HmGheslxe+s8CuJSteqMQAhIJfShTGCfI3T6jSewF8FihV6Wvy2OnNR1Xb6ZdDOv/rep2P9wZYBWvK8JVI+QV0ZX2cz90v5P6QWD607pTlzYQsB5gj6YjurwhebAepqe/ZSqIU8jhWSBlgqztS8JxGM6lKYDiae/e55HfPJKdRGEKTvFR3mBiHJn5qUUGrWoND0RzMS8b+rYpmzO5ouOtAe+DftXswjSW+heMwg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tb8UC9L5tcSMwwvQICIwF9WmGOkJ9Mhw6lArsMsPTibLkZOrHQ6lafhnhsnb?=
 =?us-ascii?Q?yfvvJtKFypP5yrKgLVucv/ZA/qytj3R4wWCwcuqOW5mVx6NhPyB1ygXm52iM?=
 =?us-ascii?Q?oxZTwH7/acvugoUOLNc/vVctJKrbEbfmgUY5ppnpNDwBJL5peNMJi9ay5es0?=
 =?us-ascii?Q?XA2PKfCRyigMjLgul9J4DE9JDMNvpOwzROKzji4eO3BHkcYeH3aY4aLVSBFI?=
 =?us-ascii?Q?Z3W2OcsTKOmo3Lf6Whwbcnj9Aec7fiurjdSzA5nawyB41HUP3lrZYpPnZKYT?=
 =?us-ascii?Q?1aDUjTuLmihtL/6o6rd7KvG9xWWB9eMx2JHbrGNji3guZgtRK7vP6L5P/Dl4?=
 =?us-ascii?Q?bQtfD/rBAo12r61m0oRDl1mmFX0oPnSllE6wzwjX6ZKjOl2fcY07U/ICmdna?=
 =?us-ascii?Q?f/8aD7Pc1hQmCpf6bcqCRfpwf4iJcHZoNd4dGpARJ37248ATlgosqKjmi8+x?=
 =?us-ascii?Q?1yNm3gdPjCpJZRn4sIjeTZsxn32D2gZlXHoIv6oIJmoV7ib6dq5+GoZPJ0Ob?=
 =?us-ascii?Q?zbv0CD0eqB5hiGYzfhalatko9V9HRKMdCPB0++9pMA/mN6wce8yT4zDbObnF?=
 =?us-ascii?Q?vV25EAfMHfbfTIkrX0U54vhKWstSx6UWVopRNI97w1PoSFRZlqANgeqvfQN6?=
 =?us-ascii?Q?WGZRAl1ZzAQRWCWARHXclSBMiZtXc/fZGFuwAuyQ986wtvH5zJLm7jOLKwQc?=
 =?us-ascii?Q?UO7Mu37K/hy3RR8sA4z3coJccv7eYZRoZpCUBkl3MiUeB29qPcBWRSxoEVqL?=
 =?us-ascii?Q?qKbeeWj2xBIToO7a/deTdR3BF8roMONj3gjTuP/Ul8seOSKDkzYaMj67nhZF?=
 =?us-ascii?Q?xnrwPh/AHaY5NumJ+lu9vBzCoejQ5m8q+0Mb7uvFLcY8hd+7txplm19jEFWU?=
 =?us-ascii?Q?EWpHDK2pHBFfXai0L3AViL6vDy4M3bTvO4f8fmS7znScRsNyn2s8jDmGvWaq?=
 =?us-ascii?Q?HDFF4+xwiKm8p7iUX8hAWVfoBGlhmyTyaEgNNo1xHxK4JfQtpGvP4mujq/XJ?=
 =?us-ascii?Q?lYyGn6f9xwTWVGrC5TAWlC6Nar0ZVo1q0s1Z6wYUT5QNQrrWrud7bKLxubqZ?=
 =?us-ascii?Q?ke+FzDlBuHPh/I5hZFvKKaCAEu2oY5OFgSEt/TAm5qWUiY5lbztTo7YEiv6d?=
 =?us-ascii?Q?fWJw3/JOgfNEWrpWlCCgmtzp3aox+031XYBlrqY9rm6fWpAyOl0tWEsjhRqs?=
 =?us-ascii?Q?55UccJqzr/R6B1v6DK5OfpekbZ03PndMA5PI2mlQmO1dBnHzBpC03TTz99/m?=
 =?us-ascii?Q?EYnOWfAi7G282TSh3alMHEFI6K6jhaHnXwEZOdSd5oHDXfGkACXKgSoH7ASO?=
 =?us-ascii?Q?9NRiU3SYpudTZuulSYurGsdHyttpUknYXCITHSIy1R9VfvY6D/5OpqPJnosh?=
 =?us-ascii?Q?zbj9KH5RoF5aoCbYHDFeeb2JM+/hCQBYCVPVETwJSFHnBnIkT1uhP5dnZKeQ?=
 =?us-ascii?Q?yRisrQiNBD8bmXRy5Nowmpk80sWYzJre28F69q48Vd9MXcKS32bVJ2nhLDA8?=
 =?us-ascii?Q?DcFIxDJ90Css6pi2e9679RP8rh77W9w1ZoI/ILWUbbuzjnSaZR/aOkBBD7xF?=
 =?us-ascii?Q?tsQ3HAOWPYTwCDAH2Uc=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3268b354-afb0-4ca7-e6e6-08dc5e260c8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 15:01:09.1940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LT1Clgt4RYWUFOZPHHH+uf2FMdLYN+UWQ1pLYyCNEsoWFwffr8tVWpcm5S7e+3dNg+EuI6nbhKsNP/oAPrgPxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8431

> Subject: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
>=20
> Configure both CSI2 assigned-clock-rates the same way.
> There does not seem to be any reason for keeping the two CSI2 pixel clock=
 set
> to different frequencies.
>=20
> This also reduces first CSI2 clock from overdrive mode frequency which is=
 500
> MHz down below the regular mode frequency of 400 MHz.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Paul Elder <paul.elder@ideasonboard.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org

Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
> V2: Align both clock to 266 MHz and update commit message
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 1bb96e96639f2..7883f5c056f4e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1667,7 +1667,7 @@ mipi_csi_0: csi@32e40000 {
>  						  <&clk
> IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
>  				assigned-clock-parents =3D <&clk
> IMX8MP_SYS_PLL2_1000M>,
>  							 <&clk
> IMX8MP_CLK_24M>;
> -				assigned-clock-rates =3D <500000000>;
> +				assigned-clock-rates =3D <266000000>;
>  				power-domains =3D <&media_blk_ctrl
> IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
>  				status =3D "disabled";
>=20
> --
> 2.43.0
>=20

