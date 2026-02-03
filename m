Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FFD2F1FF4
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 02:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770085539; cv=fail; b=LPlvWovcgw/rlqR5RYyBR5ccLiL6/NtggRL55Bb8YzNaVBxdtTZYDh197jjX2M+wMILRhubVpcYGntjkvEiGbd5k6NWGSwO+NNBsqDPAOaw3aMpLBva28Dd3J4bZIybkrcldK127DvoGs0LH6hNxrGsSvUbGG6qFI4WYvUixc7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770085539; c=relaxed/simple;
	bh=HRGxhECyySFs5RKNHi72WEFb8S4Zqb57exdGR8WkTig=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JX/Cw6cxOzWLGG7R2+6CxxJLwHi8m5CGhO2lIaAo4P5YEUuISRPVYw5AXmUoXCyncvn6BqlZseiStnXJ38pCyQ4inWZpqE3sHrl5GpxHLBVQXg+AAe5nWXjnQ0XbdYdiSoYATvN1idJSRGCxG+A3OEd4VQmHPL1uHnNrkBAhzkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AvMKz7b7; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AvMKz7b7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYSnlVMzKALlgZmwGPTMeiiXanz+msFaQFFon6lrVCYE00Ix0rmwQMkfH3wwurk7kob8NcXau7xTEsErEXKueZzOzlf+yVoorkkb0JSNiIzAwlC03IKpTnC7bzwfwXY5PrhlWaOTL3keCJEicMEtq0kLIRmEiYJpWZbkavnpjcXwPs6kYm97W/WZyxGFzuNrFPsldDtNaAkSIxYyE1rjwWg4w1Il6XOQeGGAHQSnLgDC4rpXHUNrPLexlFnrPp1gnuaUuYhL+QQ66PBhYCcjnnDf05XvZvE2URXcb13jnst4gY45w8Pmvm3M00Vp6kTZyFh1VM2fh+ovipNDcjuCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujihwo/GpGgpGb7p0vk4wBUrFfkHdeZHDVVo6YT5TzQ=;
 b=hu/a5Sy0pBncybMoR2pt9h8XBLmV7ZyBlWYHdwFVihh53f4w0+xcE0DddIqiJhp0Y90NBle+ea6/0ybTz+DHCC7ML/9P89/GsKCqdI+qE9oPKno7nbHY+A1pZHzBYaYZvZonNDm1Awu85qgAPiPhdWH0D1AOHOpN6OA4RmuAAbaLGcYwcbeEGdEvpLVN+V+VRYFk7p6ujjf8yxfch/t8ip6jvCxiMCZs+LFlkN4woe5bXD00EeSvedvqjEqXp6UZRla4Vglp+IPLm2U+u1akakPZ1tEAZTRa2x+LMwVzFbO375dL1tOxCBoBjJ3s6CkkLgWZ8D2LYUqfn3AFpEuC2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujihwo/GpGgpGb7p0vk4wBUrFfkHdeZHDVVo6YT5TzQ=;
 b=AvMKz7b7QEsdzt5Yb7NP5RkxxN6zWjYoOxN+lz1MZZQxVC0Ospn9Ke9PAMf9ziJybtW81sw6LD7WlD2VJVD4Ut9yKP56c/9LMQqSPiknNvhcCZJqDJJCfZ2un8u+Te7FvrPODy7SJkw1h+qYT76TC5IkcZB0PoXHMJo05jjCZH9+zjDeZHDU1glOpCWu/AlW6MYsMmtFfuCTpwtJSb4Z6tPiXYTBjjKL2Zhux9zhBHKYEH3lMMPw1NV5qH8igdaCnzBWXuteE2nL2LbelQSdlZKR013hf+R31qhoMmRw0l2Zpnt1v1uI2gdUOv+VTSwkNPHjaEjj5hyd88gBLWlGpA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GV1PR04MB10078.eurprd04.prod.outlook.com
 (2603:10a6:150:1af::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:25:33 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 02:25:33 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Daniel
 Baluta <daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V4 4/4] arm64: dts: imx93: Add i.MX93 Wireless EVK board
 support
Thread-Topic: [PATCH V4 4/4] arm64: dts: imx93: Add i.MX93 Wireless EVK board
 support
Thread-Index: AQHckPtmje2VHamOeEqctikkrSiV1rVpangAgAbY9YA=
Date: Tue, 3 Feb 2026 02:25:33 +0000
Message-ID:
 <VI0PR04MB12114B36C43E9F2A5ADE2151E929BA@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260129084249.3079432-1-sherry.sun@nxp.com>
 <20260129084249.3079432-5-sherry.sun@nxp.com>
 <aXubUB8zwaixNCbB@lizhi-Precision-Tower-5810>
In-Reply-To: <aXubUB8zwaixNCbB@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|GV1PR04MB10078:EE_
x-ms-office365-filtering-correlation-id: 17e58756-bf6b-4ebc-cfa9-08de62cb8207
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RtzSim9aqHK56aPqwGZKj7Hm0CiKQoMlBDYv1CWiO7N/qNBlQfalCi1HwGn5?=
 =?us-ascii?Q?Vc4xD+2yXImU6mFpRBWzauYs2eirwMjUUIfVgyyqT/kEg9z0VB4HYhHF3IAV?=
 =?us-ascii?Q?UsE/M+9AyEo/n9u1FXBzpnJsfkDo3gAAVKriSQcfIypIykxA0vcd0e1QtR8P?=
 =?us-ascii?Q?nHMtIOmEKTOy4JoQWlh0QA7ylM56XSJKOqd4FDGTjYgWzz8k3QMxspaWfrUV?=
 =?us-ascii?Q?evl5FE0Exor+FDQ7M96/FybWhSBlt27Mv+uOKoopeiqbQhUnKgewIPYihTyH?=
 =?us-ascii?Q?MK47ZOm1uQ77rqBLpkQpLqd5Z4z+1FleYfAyd7ip1nqyrotRyuBPffshlAfj?=
 =?us-ascii?Q?aOHtIStiwb0ayN90d5NHgyzodWhYCg2RHUsIJjbSAPASQB9JfGRjeFindtq5?=
 =?us-ascii?Q?cT3LKt8XLGCipcK/NPLTWsA4URYAZFc8USP0j0z+JGuJl4dA/FzS7blVx4ab?=
 =?us-ascii?Q?Y225OQPTRgUmiAqy5C+clnGiyD9Cx/VnveIMjIE3eeT90zITBQnrpPVd3b7z?=
 =?us-ascii?Q?i1i5GePQ26cyFOrMLjGIhVN2T19Ou6v8lWeiwNX9613P/gnxD1jmatCukEw1?=
 =?us-ascii?Q?LGV6TZrXYbx+U1uIGvMv62hin/nJ9maioPt9LkhzMVkks48oA04pUzrxUrDU?=
 =?us-ascii?Q?iwborlto/ABLx29jMklm21/2YahlaofovdDXXeavQ8qrUuoPC2C4JNKVK9wC?=
 =?us-ascii?Q?L+5vfN4/sOePG/WRkjDDQjkl/8D0CgWo02V3v2KeaaXPcy8ngu/ES8knftTT?=
 =?us-ascii?Q?3+y2bKX8jEAxur1N5hMZAauDqFxIm5MySZVvFun2d9pL+VmlC+40rjB/sG+T?=
 =?us-ascii?Q?tpQHGTFaCWGpkoaUoJvWIe/xgH8Ceul9PjofO9QT2oyka/OGa5yxhJb01jPY?=
 =?us-ascii?Q?v7vVpHPO0aC863Jd8SDEBj9aI2X0TM85NeNW2b1keGWO/tHu/k1sUkdv9bxt?=
 =?us-ascii?Q?GKsmks6b6QPr0d2X+yv3FdWMPzlxJd+bHl/qUC67kpagiqvKGWziIUsuIq9b?=
 =?us-ascii?Q?qmNq7EAzYtd/d7OKqGo6PsmHGDHrFdvMwWKhFxuqUOSh7yEHBxLVnt4oD2Ne?=
 =?us-ascii?Q?rC2KIQUTNKMYwBEUqNmtGUaH6EXG1rzouH49veyJs9oANDsiJe5ptP2fD8BB?=
 =?us-ascii?Q?KLWic70BZaQpevzHH1O9tN9+ATTvvCADtR9uHXr+AZGmxrbNTJvlihP8xoXl?=
 =?us-ascii?Q?oEYqyIMXiF8arbaYTpfC+WLxNCClIp8eN40GD+W+b67n7TvxTpSg7XP9JTNK?=
 =?us-ascii?Q?TwhPPhjHVCRNbNwtUekRLWSXl0Xx5OQRC9HgNitHdDOcAPxq07WAch7L2nBQ?=
 =?us-ascii?Q?3brGRaQFgV3J4hi9B8+a/j6vjkNNB2az5NByFBfAH+jOuTZV7qhtf9yIN6MP?=
 =?us-ascii?Q?GPYeedriHiJiGvAjpOEtmfJ0FUyZhx6gOE5er7L7jseBFjZpg/YYnZoXL+Xc?=
 =?us-ascii?Q?UKBuKbjH9yiRnMbm+TbOFpFFAdaLWvFqaEnpDQGmWu6D5w1QGmmIMfs7soe7?=
 =?us-ascii?Q?gBB2x1fIdhjXKMnj8E2go0oPekjtribzdGU4khn7Sdg89gSwXXgiwAhb0xvj?=
 =?us-ascii?Q?8R/ehZzxbcnBUtzA7Rt9T197hMnNPVuNfi6tiIlfwG7jg2kQULrY6hFktwZp?=
 =?us-ascii?Q?y2K+LehilYNcLNGa/Q+GIXw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZSyVf5yesnDbaWG/l9XcCEM77WcTzirshUepTK8gq31Yf3zU4b3n644Dl99c?=
 =?us-ascii?Q?IEeiQo7J8+PRRjnMbLddfARelNVhg0qm6FbdvZTlrJ9qi429udqQxAmHYjn8?=
 =?us-ascii?Q?dqMeCv33AGbDJGy+mxpw870oeIWd7sq6mA2qU66KAwut0KeuvG4Bcs7B+O3I?=
 =?us-ascii?Q?HNZrqy8mRe5ixVNmO0Cq84bvHg1OoS10AfDQhFdI7EqyWxw/BMfVYYrojxTP?=
 =?us-ascii?Q?ryG+BZiuH51BHT5QpeXmyVTZL/yB6lysvMExI9mId/+vhm1ooQDOMiybYUaa?=
 =?us-ascii?Q?B+S/PXxDuBkfPaV81M2AIlqkIB/RKyVuZw1m7cHQgMbpqdaZaDJLoM0DMh72?=
 =?us-ascii?Q?bNoe1M2cbTkuKZxLFmCg7Mw85Spe1BKz4CiGzZf4zCkV3i3dEN0Gjyy+ngnk?=
 =?us-ascii?Q?Xr2d6lXuJCfKaNcXf7HrC86a+r5hRdm6JY4M5eZXsj7vitaZ+WU5QdJ/3tM0?=
 =?us-ascii?Q?bYSzSNVaT6G6+ti0v0mWM1vGX9Jk+0zRRbrXrEmqz/GFvI7MlDS0AMICkjp1?=
 =?us-ascii?Q?NGIVXZ7uZ2oYywpnPu6plhAmz5dMza0SWXVcZA4M1BW7sU61Ak0AkFIrzQI5?=
 =?us-ascii?Q?DhEgVqkKQF0ZuTe4RoTt3H22qjpqgT66BFdqP/g/LJ1Ub8slerOiNqtwyy8Z?=
 =?us-ascii?Q?/2RsmO33H2HXVrpHw7vbTLnp0/o0q6CY1eZfu0yyFOLpH2NiczhUH55FV8Lx?=
 =?us-ascii?Q?rMEBZZhHY1hGcxk8WXRfSeNSbkvMP4Zy1WMTlvZ6XfAYs0RrpVMTSNJn+1QZ?=
 =?us-ascii?Q?2BKf6mZHzkZCtiPpWb6EkP7gsTZWtluN09MrbxJPl5jWxqFsVApdhobQ4qLb?=
 =?us-ascii?Q?ATLw7YCraWS93/XaR5coiQJIIWa1s6ve58SkHBMguF11ZQ6vxPS5kGlsPK7r?=
 =?us-ascii?Q?atU+chyFICdTMN61L1LKgZ1anHjgDB2OaUgOF7EeSuUf5+CSeFKDi/uE6kG4?=
 =?us-ascii?Q?31b/XynWhiw0e1aQk2zkeHTqKDRmla1jh67E8+3ulN/uf2ZGIuPtWZ11ZPRp?=
 =?us-ascii?Q?honIMcOZfdqtdMSol1zgkgRUKHGbSvdo8JzbrsG+cqc9wHV3dnAtTiyhTG/K?=
 =?us-ascii?Q?rghxCsBOxgCf9ziRxN2wN7JYoQIVgH1Vtd5WzKdZHnSPFexlNGE9UJd7T2CZ?=
 =?us-ascii?Q?YfyAwUXSPGfEeAxquUyJeLtKay8Q+T88hWz7RElyxjTLJ4cYUhPlrCWZfI9A?=
 =?us-ascii?Q?M6fU6HsDtrUzHLryZvlShMfRmvna+GV5/hEIp1RRTvh93bhDOID4ZbulXEmq?=
 =?us-ascii?Q?d/BRn16SBbKTTa1NH0Ebtyq3R7zswWqnLg9ZcpMW9WN4vZD20t3e0TaxIGs0?=
 =?us-ascii?Q?waNMq3jwdn/eGcncNxesspyuGZTllHrFgW1/IK5+92Akvz59gPqfc38ozZrb?=
 =?us-ascii?Q?f3mWuFLxNqkgc/CUzvE0OShpOh505QRbeFUGcNNgJaU3goRclQd80ud7xoNR?=
 =?us-ascii?Q?hD1vZZC2r7Ev6KIgIMp3iiMCB6LoCVccOwUniRd4+Osh185T9ywc3U5P2rQN?=
 =?us-ascii?Q?qkqeRsMfZM+LyXRRq31iDXqGM59v6+3bgpsW0PG0S6IcHHRPpkeFZdwP7PaD?=
 =?us-ascii?Q?z7JSllnEl+QyR6IYrE3hvULtLER8hpWp4KumbLqirreIanNurlSDgi+6nTCB?=
 =?us-ascii?Q?x1c8hzAhFZtJYZn4nRXaWxzO5Hd+NsKW1syrX4nEZd1dkjWQ8YeRps6K9LAn?=
 =?us-ascii?Q?9/sgflXl7L0SB68u2Q0PsOMG6ynGQUab1pSHPECdLjWvkSUb?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e58756-bf6b-4ebc-cfa9-08de62cb8207
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 02:25:33.2144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fFnM57bQI/jKdV8ahbCAMLFw9zBr5DpDA75l4cKS9/okrlQQ5p4FmuSuScif2jQg6XYPhEgFX3XtuHX5+yJ/mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10078

> On Thu, Jan 29, 2026 at 04:42:49PM +0800, Sherry Sun wrote:
> > i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> > (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the
> > i.MX93 Wireless SiP basically reuse the i.MX93 11x11 EVK board, with
> > some minor functional and pin connection differences. Reuse the new
> > imx93-evk-common.dtsi and add the board-specific changes here.
> >
> > Here are the detailed differences between i.MX93 Wireless EVK and
> > i.MX93
> > 11x11 EVK board.
> >
> > Function differences:
> > Function	i.MX93W EVK			i.MX93 EVK
> > WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
> > MQS		N				Y
> > PDM MIC		N				Y
> > M.2		N				Y
> > RPi 40-pin HDR	Limited support(pin conflict) 	Y
> >
> > Pin connection differences:
> > Function  Signal name	i.MX93W EVK		i.MX93 EVK
> > WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08
> (spi3.PCS0)
> > 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
> > 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
> > 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
> > 	  SPI_INT	CCM_CLKO1		on-board IO expander
> > 	  NB_WAKE_IN	PDM_CLK			on-module IO
> expander
> > 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO
> expander
> > 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO
> expander
> > 	  IND_RST_NB	GPIO_IO28		on-module IO expander
> > 	  PDn		GPIO_IO29		on-module IO expander
> > 	  NB_WAKE_OUT	GPIO_IO14		on-board IO
> expander
> > 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
> > I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
> > 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile       |  1 +
> >  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 23
> > ++++++++++++++++++++
> >  2 files changed, 24 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile
> > index 700bab4d3e60..d0ea746c59b8 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -418,6 +418,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx93-9x9-qsb-
> i3c.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-frdm.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-14x14-evk.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx93w-evk.dtb
>=20
> keep alphabet order
>=20
Sure, will do in V5.

> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-kontron-bl-osm-s.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-phyboard-nash.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-phyboard-segin.dtb diff --git
> > a/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > new file mode 100644
> > index 000000000000..9832b82b6ce2
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > @@ -0,0 +1,23 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2026 NXP
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx93w.dtsi"
> > +#include "imx93-evk-common.dtsi"
> > +
> > +/ {
> > +	model =3D "NXP i.MX93W EVK board";
> > +	compatible =3D "fsl,imx93-wireless-evk", "fsl,imx93"; };
>=20
> Put &lpi3c node here, which use below pin mux.

It's difficult to move the full lpi2c3 node into imx93w-evk.dts and
imx93-11x11-evk.dts separately because lpi2c3 contains several
child nodes (adp5585_isp, ptn5110, ptn5110_2, pcf2131).

All of these child nodes share exactly the same DTS configuration
on both boards. The only difference between the two EVKs is the
pinctrl_lpi2c3. Given that the whole lpi2c3 hierarchy (including child
nodes) is identical across these boards, keeping the common lpi2c3
configuration in imx93-evk-common.dtsi makes the structure clearer
and avoids duplication.

In this case, i.MX93 Wireless EVK board DTS only needs to override
pinctrl_lpi2c3, which keeps the DTS layout clean.

Best Regards
Sherry

>=20
> Frank
>=20
> > +
> > +&iomuxc {
> > +	pinctrl_lpi2c3: lpi2c3grp {
> > +		fsl,pins =3D <
> > +			MX93_PAD_GPIO_IO00__LPI2C3_SDA
> 	0x40000b9e
> > +			MX93_PAD_GPIO_IO01__LPI2C3_SCL
> 	0x40000b9e
> > +		>;
> > +	};
> > +};
> > --
> > 2.37.1
> >
