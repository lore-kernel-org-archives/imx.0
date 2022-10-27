Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED9E10EA
	for <imx@lists.linux.dev>; Thu, 27 Oct 2022 02:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsEgxaIRf6IWjMg9nbygWs4xThCep1Dsv7HRNyYoTmBVqi5bYPQV6mCZcfYbzwF7DgN5gO3MbHmivs8U6Qypq7NOUFWaOqbyPRJfLGk8lbg/RByN/RA2uGFUVIj+D9alplrCTpgaV/NN6Ct3WTb0z7ZqGy+UpY5JWBVoQ5eeTtO4sA7ruMKycs5tNWjFqtaERmyc9KobsEVjbDG4Mn6L5jsMDWlOwWl9Y9dR9tKd3LUANny/I9TGXXJ2jmNzjLzbXWuDfoXjIiR7u1TeMnUjkpjM9S5YNFwXtU2A7fFENzraFkFCpU0PizFnnaFmsAHx4fLe7DawZXh4/QUNR94aJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6BYz7Vd3Wfi13rmn5yRQm+7hhMBIuePp7XH+XsmEyY=;
 b=NCppXanCGK/6FMd371upmQfiUC3fv6v/s7kENBJIE/ge5dIE0IZ8WbcyYlqh8Z07ub714W9cDkxk3CZ5/RjjveEy2xTTJqbHOXcvZpNvB8C6uGmRbvJPO2xlrJoEuDaNl5Zj8qzkP0zFFjzlSpswFhLq5ZIf7taR91fD1vYOvPMZ+EfcfHkIPR5D8XGWjEqNP+XbrsNlY/ibKjRua1occl43I6mBRBkZX9fOw0y+HsRmGW3Vdr1Lsjmk2a6mf/W23APqyjooRaNaudKTORvZWKhJWyRwlgWXDEzljLRELACrw3yG6LQKy/Jk8bfP4Peu8SMt81JjI/wggBpnGTMJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6BYz7Vd3Wfi13rmn5yRQm+7hhMBIuePp7XH+XsmEyY=;
 b=VPyf5zJYd8w0aPViSL2FGDKwovpGppD5rFb5fjNco8aE18hzBW+USEad7HFw9y9TlrvVEcul+m5dqffE3ZmVLJOCtUEgaK3m/RhquauZfQzaa63WO/jldZp5AbmTga5ScDMSIwQptj4d78EN88xcMG326B5gXyy7dHFzNY34qIc=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU2PR04MB8693.eurprd04.prod.outlook.com (2603:10a6:10:2dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 02:06:32 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4150:173b:56ec:dc6c]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4150:173b:56ec:dc6c%9]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 02:06:32 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Viorel Suman
	<viorel.suman@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Ming Qian
	<ming.qian@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 1/2] arm64: dts: freescale: imx8dxl: add scu_gpio node
Thread-Topic: [PATCH 1/2] arm64: dts: freescale: imx8dxl: add scu_gpio node
Thread-Index: AQHY3apWplehc/hxJ0CNnptj3fmxpq4hlgNA
Date: Thu, 27 Oct 2022 02:06:32 +0000
Message-ID:
 <PAXPR04MB9185EB1BF429479A16CC986189339@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20221011194715.647439-1-shenwei.wang@nxp.com>
In-Reply-To: <20221011194715.647439-1-shenwei.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DU2PR04MB8693:EE_
x-ms-office365-filtering-correlation-id: 5dc071cb-dfaf-4ef5-3c36-08dab7bfde9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 os3oCphF8dw33SkVE2p3oy+KTAp4jyLPi6O43JtYPNzPycfLis94mQIH7QNSU31lw2e+ZPjNe/z6XgWXBtgr/iS+dJM4QJhLvgFEzG9rK86buI/6X1lUUnAcYLQ7Ttx5YgGriEYTu9lcsJ0QJ/QRCHTcOPCjdxlh8SGW37OKOC5WQSmAhc8jHDBEB5ynxK1S7xX1rOPtGOlM7PFykfx+822raSSYJaJy5CB3xmmKzkQJI43TK4w+LewvQ3x6jFlPo9PSfokOEndaMYPdMsnoOzrnBZkS67tRPXlWHlXum0HMpZIrsflKKogiH2jfBCIC5I9nW6T0cBKxZjPjuplVkO/85mYBg+0KWlZK9I4MD5hHXehQ+IxqsyNow6bBWKPgJAdKcWFVYO4gxgcR4tp7rrTSdCFK2dobcKNWcu1ugenXDuFR+dI6onKK7ar2xirn86LfP92KOasSJe7bYEjOmWt+BaFBF5VL0QK+kw50kKQkNNkGyxHH4kUoNxRV7YVHOBcEfnu8dUE9fwIEiNICRceMF05zgGySUDYzYBdlnc00516idvCWxMa5dI08lsg4XtJbvHRTMrf+4HmkPZ6UdyY1zOcpWTquPpixg0AZSq2WyQDFIMq8pb6xbRlukivjNQ/171TGDkvtqsoGGuwms5nn8YlQtgq1nfybMPp7fCBrZDHXt8+49uNpYlAFRq3ZyjklEVmgBRUYfTLGHZX89gaOz+oHTxa2kIW3NGmmb2T8y6ZaH5RYeLtsZ+gTqGcWgihbBGN66+PHxO4Lwz0hUE4xZ27FL+842NcLV8SBtb4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199015)(55016003)(33656002)(8676002)(38100700002)(4326008)(76116006)(122000001)(110136005)(54906003)(316002)(44832011)(66446008)(64756008)(66556008)(66476007)(66946007)(71200400001)(86362001)(38070700005)(478600001)(83380400001)(55236004)(26005)(9686003)(7696005)(6506007)(53546011)(5660300002)(8936002)(2906002)(41300700001)(186003)(52536014)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JJDpOrKwh84ZMptIdpDxGfrpiLrzmVyOclH0iQRCh/BVIZxiak1UYh3POi7P?=
 =?us-ascii?Q?BdLTuRY3B693R4Tzqi+7iP1lE1tGuG4Bkk/tvP5BiodAG9ozfabuqXoG6q8u?=
 =?us-ascii?Q?ZmWXlGaCNZvdy6iD/y9KxFZr1sBZM6xwYb2lZYgiS8rKqGWY5s3Gb28hA68G?=
 =?us-ascii?Q?YNYtAKqqJZEBwqj24beyQhswsXERAUgZeVPWvv/kvRjdZXbUUbjVJK+YLKHP?=
 =?us-ascii?Q?+D4omi3w/dmzOJLUJtZpsP8bLIFmYkRbC8HESs5HkUesOYhmTRB8laxwl15M?=
 =?us-ascii?Q?EBNqp25Z9qV2yCtN7WJFxrdFyyd8fMyL0aBnET7pfGEcyo6Vy5vo2oRM+6PE?=
 =?us-ascii?Q?29fWJ8k8Q5YoFPAsuKSNcbCJJNBAJhNhb4Khq3lXbOCY++8gZqu7XEIWGxpR?=
 =?us-ascii?Q?bnezcd4hnLMKZKd3fF3NtoPCYpwVTCpeYZhyGrpymqSblIRAwjtM0RfY5Ott?=
 =?us-ascii?Q?CD0pZxbTy/74bMbVwRvPAPmPZARp71JQYe3WHtCEHcLhHvRQBlhffhrZRROn?=
 =?us-ascii?Q?utg5TYgbocmW/gfvonLzrmy4bdKX0q2SKTXJTMN2mbCBDCrNfPatwlu9+Wy/?=
 =?us-ascii?Q?+sNtH+soCp4kd0Pmyj9RrCzumi8A8W/cLzgfeQq4xTLh6vbq8MAGB+RHSawD?=
 =?us-ascii?Q?ijl3Q9THNeKavmB9lJVPn7mIvPDpZJU4zxmML6F1ZiYFxnsXsg6KkhxFkyGw?=
 =?us-ascii?Q?miDDzwrF5fFhLh6xsj3XU5UV39HhbDJm6vVpHuvdUCdcC0/Wpa3AufdNhnOe?=
 =?us-ascii?Q?Qov77e2hq3VHt77k9rWEsI/lEXexInBdnMS16fIYitzsUYx/tebUNOAoSDSc?=
 =?us-ascii?Q?tZWY4M86PVG3qQKyrEK4rQuX8ZA9ZXmGUVvRjyRnkB/NKVvUL9BSgThUCT1Z?=
 =?us-ascii?Q?voCGyMQcFwt7h+ji72c+wtS8JDxBBfG25a0JPTRVJcv9UZF3JEfisqqkbphz?=
 =?us-ascii?Q?0TkEu4ejlWaIIyah4C9SiFCbinM6+odE3+ejxjKuYZ7Jj7c8q+X/060JQwRU?=
 =?us-ascii?Q?Y9qf8UUrMrujlYhPxDKvPmrAMQMrHCAPWSD9OOs6SujUIHilAlZo1MFJENLW?=
 =?us-ascii?Q?D3EztAdavXbp8lK49QEXU2xc15Yl5s+OQRByNT81qxYHB4fPpmagLmS4/DXh?=
 =?us-ascii?Q?GrWX5Vh+KJgohkbUZt10AUYWWUR3d2Hu3jA7MSTyu0RvTwiu8Acs3NbzFYVm?=
 =?us-ascii?Q?th7Rn7DhVGUJOKuJ0h89FTOis5rNPILqq6APyEEhPR3f9PGQWhJr59RX9pCY?=
 =?us-ascii?Q?iXD+OxbgAn/Z3P4rurhEnnLhg5MJeXYNNjuvqSpsI5E18iTqBhA8wWsJHLoh?=
 =?us-ascii?Q?koY5R+WYoq2nLH9RoTGzZHGTviSG0WH2/ic7gjiCb6xf+0dMUf8YYcLBzRqp?=
 =?us-ascii?Q?W3Il8018Wg9AnoOcpe38EEatnREsVPtCFrWuusLBQ5yVgV16vQxHgN3pUK1F?=
 =?us-ascii?Q?OJkg9/Kg9g+3q7Rg/YKsF3WYokmGQj+Fn/UWXPnhJuy5fMoP5G0KPetCGPHQ?=
 =?us-ascii?Q?zg4L2sFu7iTqZCrMpAbNtcXMFZF7/L9P3oSAQo/ftSTmFjMEGsTFJzGQBLQ5?=
 =?us-ascii?Q?lMzTpS62vFDd9myqii60rI0QKVxFcIkM7b2s99mA?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc071cb-dfaf-4ef5-3c36-08dab7bfde9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 02:06:32.7608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZ84ZzhqRuzepG2/HHEOzon+3Jk65/RgEYtjFjK5XkTyoUBW0Sq1XCtg/VkAUWtu+rtiXVA/qtb8d3kV5jwP2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8693

A soft ping to Shawn.

Thanks,
Shenwei

> -----Original Message-----
> From: Shenwei Wang <shenwei.wang@nxp.com>
> Sent: Tuesday, October 11, 2022 2:47 PM
> To: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Shawn Guo <shawnguo@kernel.org>;
> Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; dl-linux-imx <linux-imx@nxp.com>; Shenwei Wang
> <shenwei.wang@nxp.com>; Viorel Suman <viorel.suman@nxp.com>; Abel Vesa
> <abelvesa@kernel.org>; Ming Qian <ming.qian@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; imx@lists.linux.dev
> Subject: [PATCH 1/2] arm64: dts: freescale: imx8dxl: add scu_gpio node
>=20
> add scu_gpio node in system-controller.
>=20
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8dxl.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> index 5ddbda0b4def..9f79504f9d6a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> @@ -133,6 +133,12 @@ clk: clock-controller {
>  			clock-names =3D "xtal_32KHz", "xtal_24Mhz";
>  		};
>=20
> +		scu_gpio: gpio {
> +			compatible =3D "fsl,imx8qxp-sc-gpio";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +		};
> +
>  		iomuxc: pinctrl {
>  			compatible =3D "fsl,imx8dxl-iomuxc";
>  		};
> --
> 2.34.1

