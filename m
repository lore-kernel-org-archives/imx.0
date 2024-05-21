Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A40770E4
	for <imx@lists.linux.dev>; Tue, 21 May 2024 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716296311; cv=fail; b=YHn4B4OL7X+RQ5cqoIPXInuy95n9GNK7uptQYUonyOW9xh2+CX0hl48bdcYKXcOtY9IrNIdLnZ1uwSWXZ2jsZYN/OdlwxBgZKxxXPHKXMR7r9+BdRfQ2Uhcr3X8G5ZbLx+LtHM0B5hNaG2sDyNO+v0/zltqvYDhqa0vTMExvO40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716296311; c=relaxed/simple;
	bh=LHpU+HsPlCFty8TDnYSnUWbt7A0L8Pvm3CdkYdsGLvM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X18u000oYjTuxryjFg/pg+Q6FDAOcaO8jCZ+9kAejWKwfW5//DLRTLC9S9DMYESp3Qotl6s0dbt80zMboeHuKNdGjyYauCgRYI6eEjrafy/kKoWS85v+9/5WL02WyBUH3NH9WgCNqMhPahHK0mJOvxfkWanflxJrfaMd08oAjsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=OJ5u2Yp0; arc=fail smtp.client-ip=40.107.22.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OJ5u2Yp0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKrgstW3Pv8UDMw/kWN3kqOxLvw1268djVLSdsLpQUQLTUxuIqMDrXOC0j+tZkbZhZbivvDICbF2KWfsMqk/1J46HI90oRlZWgroaHnORY7OO3GbnlsuvAYeZeWJDFv2O9gOl4z/iWVD970kA5QCUEcvQi6YYQIyqVrhUU9Vuq/UwW3nNS7zpmF8T5g7C1WW3MYukqSzZy/i3RKb4dJlKnL5LloPSOghGzyC5KqXCU1cC/gWbYLKckkOiQ5kuZ/IFqRHoj28TTe6sGhRKshSNISVnp8b0qA192Wqowpq22a7cY9yG0t75dxP2xj6HmWjumiKYafVm8qHAF+6NxvoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOfUmzTY/tcz2dPHS+DUBvuDLwmWeaV8CH2jzbd/4P4=;
 b=fPQFJDzzeQfhydzeTTaTk4Zi9UTKI0CkPE5R/vUbd2lgytlLSXpnMsNT/KcEmoTNUeAdasqb5dql+WExrMunYBC/L1GVwb62C2G74BRAm4WiN/Oos3kNUnHJHavYtbbqoWtnw+Wy0DxwL79LtkPB7NiCU4dhGgxw9jKB9ExybjahcVTzte4tGyECz+zc6S+OvPydXsghHbPs12SOuY35VKzjekzNoFcnqumM+H7Wtsk+1W6SBfTipKj4eVid2dBdbg7PKWrorKwC+WWanRateNL4EvsEEUQ5ayfy3ReIrsXs/xqXKWovUbz/XPEVfTh07n6ld4wR87AVCyi4wIabbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOfUmzTY/tcz2dPHS+DUBvuDLwmWeaV8CH2jzbd/4P4=;
 b=OJ5u2Yp0rZ3D0KxvjZBYQekefBf+gRLSwseOvsFlt+AnqCCWIlRz2LBx+GX7RN60LrTotTGbTJNXCxzKW+qKPZs3hXkgzWb/+sjMOSfcwk1aoF79n3EkRuuMfum/e/Cx22sLR7MmnaeixmpOB0yxFY7Arlt5Hz0Xv8VQTXwnL7Y=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PA1PR04MB10169.eurprd04.prod.outlook.com (2603:10a6:102:465::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 12:58:25 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 12:58:25 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 1/3] arm64: dts: imx8mm: Describe carrier board 20 MHz
 Xtal on i.MX8MM Menlo board
Thread-Topic: [PATCH 1/3] arm64: dts: imx8mm: Describe carrier board 20 MHz
 Xtal on i.MX8MM Menlo board
Thread-Index: AQHaq2lngLR1cq3w5k6UnOlxtALYZrGhpiWA
Date: Tue, 21 May 2024 12:58:25 +0000
Message-ID:
 <DU0PR04MB94174395174DCDED12E2586588EA2@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240521102435.10019-1-marex@denx.de>
In-Reply-To: <20240521102435.10019-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PA1PR04MB10169:EE_
x-ms-office365-filtering-correlation-id: 26747097-d0d6-41fd-90db-08dc7995b3e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|376005|1800799015|7416005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?aokUbCjfMpVnCOEg8MPnzsxnDbJ/U/HZIpp0pLNITH6e40Mrf0RcjH/eL7mU?=
 =?us-ascii?Q?io2woHh+cuZ/fB4JrwfaNv7QMETf8pxWjqm9gWQ/njU+sW0MzEnBiEMN6BS+?=
 =?us-ascii?Q?JsryPkHnmwgqKdwa3DognFqR5VCi0qvkrQdPsi/pcMJHpMPzrxpPo2Pba0lV?=
 =?us-ascii?Q?whweXXMjV6YtENky96MsbGVnz/5WYv2jWGqY9OKriNFAbm7QyQsX+QWS3Goj?=
 =?us-ascii?Q?o034ieHZyrfL7bYmZhfaF4CNxOiSBbUYXn9D98bYLpjlnVbhGTorPTZ86pnI?=
 =?us-ascii?Q?eGfYZPyewrWIQPIZxpgdAimY/SRBF/+4XugAxQ3n0ndS1PjuMkyMLi27tPW2?=
 =?us-ascii?Q?nzXr3u0PY+PcHkLH+N2+3qUUw55h1BIZP1bFc97GYkUpymaD2JEbl65Igcx9?=
 =?us-ascii?Q?bbT7no/jZdnS1nQBg73U7lH8f+PpwThHaepmQo3OXSgovf4wsLi31irrhS6n?=
 =?us-ascii?Q?fjpELD5ohkQxLIhkG2sCn9RrE7aN89JPFC5+iOJxKUPDNC4PTDmu9Lwr9ili?=
 =?us-ascii?Q?ZOB3Wsw8eemdweeINcmT5o7mtcrH7ZVI7/Cksnm6smlqg67B46+m7aM1skk8?=
 =?us-ascii?Q?rg8b9NdkSiw7DGSrcYNziuMFPS8j2uAaICfDWIG3pYcPT4e/+U2zSnzB0kI9?=
 =?us-ascii?Q?uinAu3tDZTOM6dQpsZC5GxNag5SzZ+1CgpOhDOVqCiOKGxOhoG2Y2lPkjvl5?=
 =?us-ascii?Q?c7V8h/QHUW93aWuTujP2SEgqDrsoD/TyM5V4EzdVs4f/xntvFqwRDU4lYq5C?=
 =?us-ascii?Q?LpEtT/6o1WktxI6FbFNJSrb75nMK5lzMEJvIpMi8Vk/L110Tzq1tHcfmOFgF?=
 =?us-ascii?Q?xOfbektJHkr5YFJOmBkfKqDtT7wSqR1r0oEvBvPxtsiQNL8sQeLC91/xlDsU?=
 =?us-ascii?Q?/hLprVIRq77ZVhiHVKYG613AjU6+6887eQZX2SkWTsMHeYuoiDbjWoAKIzIK?=
 =?us-ascii?Q?1F04xeJD9JeLfnZs0cXT1VGlsSap/fVWLEx+MqywRc09lCoZ81s3snweq9ZY?=
 =?us-ascii?Q?JwylCQXAe2w/yf9CP6cpAdGDdOMn8pCT/DMHxUPnK6oOl0vJBVizs9J6YRwv?=
 =?us-ascii?Q?dOH7mTlu8V9Yfm6+t5Kt/VQQe7kkMtv5woUY3pdcknxNyoyMKdAS92trVw9V?=
 =?us-ascii?Q?2szdZuKqmMZOrqSKkWwFrVkGqDekmv19iGglA1ZIouDMLj+srYZLTFqXNDMl?=
 =?us-ascii?Q?GGFUf7Oy0njg+x7HbyPDdio9t+VgCeOocOGFcBM7j0GyfxTed/pvgLT12BKk?=
 =?us-ascii?Q?mBY4+C96OHNUV6P8a5UhukVIIzg2y/55y3LwKYWe0+eXXSP9lEBz9rSoetde?=
 =?us-ascii?Q?a4muZds4o4xxXsKxYJnUaZa/7ZJi+mzCHjd0EbQXxFZp+g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4rXAsLu8HhPM4TmwJYj4XBDprP1lZR3pFI0hi0a14j3vhPLeGtPHSWLD5C1M?=
 =?us-ascii?Q?afTjKeYq5CRRVn0M/T18Y0bptav+vojpEt8ceGFngnQTCM4tmMBPphDMLY9C?=
 =?us-ascii?Q?uYjldI4kzgeBZ3LboBOyItMDsS9pBLA9dRq0hxmNXRk/3D13ebypk9Xx9r5x?=
 =?us-ascii?Q?p4qFzN/1DaeV6976648c0WtXEgssH7xJ6+3fbFU1OxoortqgeIMck4tjGx/L?=
 =?us-ascii?Q?7u3VDjz0hlhjq1aQJqNs18gx+fsgkmQStlztLl2Rq++3feQi8i5/k/FYXjTn?=
 =?us-ascii?Q?o8paMGvGU+rN5Zt80IcfzIGgxBBVbgpXdazv9IeK7EifSi01S2ApKk15AaXy?=
 =?us-ascii?Q?RQRqHfVv+gDCjeLuxVfcLwoEW/bKM8KoVCF+qJYdogPUZgc6h8LaGB00GB03?=
 =?us-ascii?Q?2QiIEJFHgk01n5XEnGD+xpbx12ZA4NF/7th4x6FlvBln/vfx+LMNh3VRLVPK?=
 =?us-ascii?Q?pjg1KZ6+elNSIXcUrGgrM5rq9WjkCc+f1HtB8SwxBC5mfsuVqN058YTHUS69?=
 =?us-ascii?Q?CLEC5+/ePvqKNh0ora4qVXCCz96TwVURUhK3Y2AMBU/h8jnatr6nq7QsfIcL?=
 =?us-ascii?Q?OlIokhjN+O5CszTmS/M3amdDKDnlYlgGLev2716fSwf7OdjcQu1ZSlw2AoH3?=
 =?us-ascii?Q?A+tOPI4EjgIAaBiuY877i6IOC4M5eOIwyT3FAnY10CfZBWR04AkXoV/GRpB6?=
 =?us-ascii?Q?E20Rmeq2X9grwX7j1A9plWQfJD2IQy6SXYO1AzL71AWu73oMqdPKEz+AfA3W?=
 =?us-ascii?Q?kY9d6U4KjCa0T+gpexmMObGFhCK0DaSiO4/uAHuIT1I4dK4jl8a1Z0YP5IeE?=
 =?us-ascii?Q?JSK2kLW6WopJO3deG3QFZAaIJ8DmMCNQiTOvCtdo6ZrlBelcQmv6e/vvodf+?=
 =?us-ascii?Q?+hNytOH+R/cBSd6lVSC7aTqPLps6xK5NcWbCkZhO24xX6S91w44fpRy00APz?=
 =?us-ascii?Q?8ThZQnMiagd+Q3+4F/3jjw0VjG67fQiRM36832nsq6wB1UngqynluGSodHHV?=
 =?us-ascii?Q?7K6ATvFNPFBxq6rTspvJuqd32x0LOZZfNpFIOYbDHzrwDiU26I8Y/gKAPaHr?=
 =?us-ascii?Q?Idsz1L3YMVRM/VOEOk/6qx0FElyzyooboS2KI1fkLujzI3SuHGELiqMzRYA8?=
 =?us-ascii?Q?JGiZRPrm9HM+55umkQjyn5h2KycvSCODbTwI3xAp4jhjNxKLY8HM3GTXRB5v?=
 =?us-ascii?Q?3aO3v7mWt2NlAPshAKKIhcmEr52seGluXXhAONpZSOGUQTFGhvKd/gMMthzb?=
 =?us-ascii?Q?UI4/A00D4xQVquzWmXPeCzscXgCF0lel+kYYenupRyFeeMZMCOy5kDwHQjp1?=
 =?us-ascii?Q?XW/wKtrJWufj2PuaiYu86aoGJ6Zu4rZTNjGZXm9ozZYH85CMHZWkb4kPqILa?=
 =?us-ascii?Q?5PMu0pZr4gGNEoF0mbhSQnijHrSuhruJXqvg2vTW0+xiPHIMCFG+LBj3k+tG?=
 =?us-ascii?Q?DY097uhwoBv8Ne0Wor0QktH8T8xNxatosenp54keQVYEzDJKSCEaF1HeoATP?=
 =?us-ascii?Q?aG1fPg0CDW3VHZfqSsWjUFI2LqqHcvDg2bQIWSzANt2daYdnb7elaymeMkoS?=
 =?us-ascii?Q?6/coj7EozF01kSs+Vxw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 26747097-d0d6-41fd-90db-08dc7995b3e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 12:58:25.4440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yOrUY/e/+r82YbAhwgJbHWjfJLJx+vQZX7AIPotbrSJ2rVqfTJAkczH4yNi7EB/OXJp3KoPOqQ65POvW5jPW6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10169

> Subject: [PATCH 1/3] arm64: dts: imx8mm: Describe carrier board 20 MHz
> Xtal on i.MX8MM Menlo board
>=20
> The i.MX8MM Menlo carrier board uses dedicated 20 MHz Xtal to supply
> clock to second SPI CAN controller on the carrier board as well as CPLD o=
n the
> same board. Fix incorrect reuse of SoM 20 MHz Xtal for that purpose,
> describe the separate Xtal and use it.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
> b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
> index 0b123a84018b2..4c38979f7333f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
> @@ -14,6 +14,13 @@ / {
>  		     "toradex,verdin-imx8mm",
>  		     "fsl,imx8mm";
>=20
> +	/* Carrier board Xtal for SPI CAN controller and CPLD */
> +	clk20mcb: clk-20m-cb {

Per fixed-clock.yaml, nodename should be clock-xx.

Regards,
Peng.

> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <20000000>;
> +	};
> +
>  	/delete-node/ gpio-keys;
>=20
>  	leds {
> @@ -60,7 +67,7 @@ &ecspi1 {
>  	/* CAN controller on the baseboard */
>  	canfd: can@0 {
>  		compatible =3D "microchip,mcp2518fd";
> -		clocks =3D <&clk_xtal20>;
> +		clocks =3D <&clk20mcb>;
>  		interrupt-parent =3D <&gpio1>;
>  		interrupts =3D <8 IRQ_TYPE_EDGE_FALLING>;
>  		reg =3D <0>;
> --
> 2.43.0
>=20

