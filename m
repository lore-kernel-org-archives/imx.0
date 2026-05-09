Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013031.outbound.protection.outlook.com [40.107.159.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5032D42B
	for <imx@lists.linux.dev>; Sat,  9 May 2026 02:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778294246; cv=fail; b=hA8gr0kdt+CBpQVdMyskfnsHpXwMn9dYiYR+Y6MBS6/FeU+T2A6k32nYseKGcz2YYTkhx9X7/Q90eYAQZBhOMcWFUO9YnXC2mHRlwYm69YTdZYRY7HwMDhmftMJzx8zkPPWIsC80m/FFn2IfpXcbAA+ZG3qY2ZOTI8zb/FUUqQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778294246; c=relaxed/simple;
	bh=dMnS9J97Q0aUe8jwYi2N/2x/UNQWar4B7WSjgoiMi4I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DmjI3seCCOTe86dGDsW43e/iPUxEFS5Tyn14fBtpugCfCCQFOrDVfzljTKMXiCDCOl/Ixd/xET+idexm0pAv/sp5+HoNlQx4u0J695Ep+2Sy7mILdymi7z3wEBuqukHkk+WeIFvTuIXwaA7qtBn/zERWiRgZvyxBWMk8+/BlOXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WcztwMMc; arc=fail smtp.client-ip=40.107.159.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WcztwMMc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExMLgNrF+ycVGCOPoTXt5JKFQ3FA7P/dA1Q7CEw/3JV5FxIr2g0Nggprj2cxTYzonnczvKe28lQbRCCsKQR6kiK1R5hNcy30zIZCcAWvnmTdRQngaVvKPiedCmSmS2CB4JmwrpuRmcMTCdZjbTZwdSgeaXFhk+Dhyql5EvZ2TdTOxZ0ChOrjZlmlNcQsWqCA8rpJnrJsACQ1XY2pHNcY1JMREBEEX6Y8vMbqsSl00nXJmsgT2nPL2v9MPFYU9iA6PbbzDlT53964T3m3W0aeYXytNLHTHGotQch8aeg0AxdG0pcrPV7skKKvIk3YTpZSsHKbSabsWWyDCoCnetxT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+XvVjgWBhxBzO7aEyzesm+8t+Pwe0nheu3mX7VSe5w=;
 b=JjDGaeLUW+hcuDVPaXXQzVY9KdgPZqpQ9+530NeSuQQcLo3rPknwb4suscgnmmzL1q0G1sxyW+iTarybsinGf8SeNwuPm9XqUA3i3x5YBdGeQwWNZ9Hs3fRm5GDiGTxmFQZ6OUsEtlSvY5RbfNrGqHSPXVPjB1jp2QWqEEUGM+eHor8CXyRYsjnIM08jPfz3M/jGh3CFFPUG+9lq25DhgzW+jKSBsLw3D7XTaTTuelfhAikwy7nP8MklJUQZCLXrb2iJuzdKh6gji410WKkIIczD3IkNRpuX+bSJKgh1oQsWcBYJtp57Y8ea5LQnkHtJZA1LMWfAKSkgCVzhjbItXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+XvVjgWBhxBzO7aEyzesm+8t+Pwe0nheu3mX7VSe5w=;
 b=WcztwMMcBwFWUmRQfc7yBAyx21kRu7x+Fmx2/3tmsR0S81MEOMh3SG4SsvGPwaSCPRUGG5ZBNHVKGKOnVf9wdUTGC5fvqaU/feIWpwuT09c1NB2hPJNvI3ks8ZVlFh1ZrLs1iY8tDWDUeMwZqyFQAzG4mA+j7PKStmTrMQ8djMHH3d6iW9mYEbm+DV9DMJ3ff4VvNRfweroMuMT9gHqv8G8jDGcU57uafVSxFjmSGmkAjMV6bSHV1g+xMGAR9RNnaYXKQkOUrs2sCbJVogwgHES+OIxN4wka6ct73QwJbBX+fJ6Wdpy9r+NU6JqMeIEDfJPcEvqdMeZ7pB8Cfe4GKg==
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by AMDPR04MB11556.eurprd04.prod.outlook.com
 (2603:10a6:20b:71f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 02:37:21 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.20.9891.008; Sat, 9 May 2026
 02:37:20 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] arm64: dts: imx: Fix PCIe EP vpcie-supply properties
Thread-Topic: [PATCH 0/3] arm64: dts: imx: Fix PCIe EP vpcie-supply properties
Thread-Index: AQHc31ZyQyQA+vskEEW1QZ+4+j/A6LYE+jbw
Date: Sat, 9 May 2026 02:37:20 +0000
Message-ID:
 <GV2PR04MB120191A83B39573DDC2DDF5A38C3A2@GV2PR04MB12019.eurprd04.prod.outlook.com>
References: <20260509015411.3218700-1-sherry.sun@nxp.com>
In-Reply-To: <20260509015411.3218700-1-sherry.sun@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12019:EE_|AMDPR04MB11556:EE_
x-ms-office365-filtering-correlation-id: 741fbfae-d53e-4093-f516-08dead73e4f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 bIGQTmqzVl0TRSlAAkXV8e2RjP6RyvKrq6v06GwHlvm+LI8LRM+964Ls9Dz+9/7PUXmKbZfR0YTwek/bmlSUfORszVBQkuiMwgY9E95zJOTxtyxLYGE+ik0bCt/wyQ5qatolLi+dY7dvWS5mC6AATcZe06+jdbkhegRWCmUcYS5V2EOdi+IOXQS+1ZzWf5tcAZH9iKvBRv0QY2xhxrCGgqRSR2mri+R9eD3ZsY3cfcZ31invaZAEysZYpyZRgzgITmxGvI/BupTKdoQR8BI0doM/ifTE+e9UxSUab8keraOC70tYbh2dGZxu/obWkkE0gz6gnrNdwba73ZUvubf4yoLpgtHnGwlWUdACoydeCYJ/KP1DpXFSM25FPhs53le87PNvI2MFisPdnVTPOECnvhHISEYPbHCmFUQmfDiZYlPPW7w67SDQ0OxyLC+DPw8rHs0yDuqfu/6LOgmoLQZjr3SHdE77CAw/lgM7MCb7wqcuHLXzty96Knb020s8grd9VOnRQGHe9GvltcvRLN3LhqyPbjeU2JL9+l76pmSZNZXgxzw1SjsRR7gxb3bH3LBMRMAXUPRo1Lw0J7R0fzSKo9DOqGgNBVgH4VzBXsZPoWt+pluCQWdMrd8DNq6VTXHJUIcBbe2kcQFn5Ndc1IisEw0AHFA+XskClEdSUV3R4rwQ3T7mspwEin9elrt1z42lNS50LvSdSTXlnlBIAHvcc9a0xOQ2FFw7ho1L5u6J2LhcqVc8VzlgufIwT9CPh/W8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7CwUlfhqvU2ERWUCJG8CPZb1teidoHoRgWJKQfNDaXjubZQ3t/olJ92XCgp2?=
 =?us-ascii?Q?HGXlntAvUnRPS15gOTJtRS863llmEXVloH6sRMNg5z4U7268Kr2q9ZE3H/sk?=
 =?us-ascii?Q?r7HnISuz5MC16yDFEwSh6m7peZ+1q80lhSe1Hud7RNIejm/oSirfyObjGABu?=
 =?us-ascii?Q?3Jh0/Rkx5xc8mlU2HU6ACqrfizYe9DsImUcl+Lb62V7DUKmnESSMI4uvHkjN?=
 =?us-ascii?Q?v4BdNxjIDRhYmQaGxWlXNS43TFfkQUkRA9tOGGldgDOruhsS6jvDDRMxgNo8?=
 =?us-ascii?Q?IBSbNSBpFrQAw5+VbcnF/YZKcE+8/E5GMmx34xkVq5m13tBSqZGlQeXBWBL6?=
 =?us-ascii?Q?f+hbidkPnMPntp/1v8MWTK389+UWqdnnz5jgYpbe9V2bW71PcqDbGhr/bBGN?=
 =?us-ascii?Q?2+H/KWREp5KXQvmiaFDaNPrath4ritdBMENudYcVJBHkYsuBbzIxO/hPbozj?=
 =?us-ascii?Q?LOWFTddubscyph6BdHmbE1JFm3g1qUfvwHKU9BrGO0aZBtg0izO5z22Ppxt3?=
 =?us-ascii?Q?hB24Wout86DpZJTH+BdgP9sTBW60DpMVa3aFa0gRUm1iDTSS1oVmYX5m4YpF?=
 =?us-ascii?Q?ktt3aILl88KmuWFZcV1qChlTd8hdxGYaZqmkmVYMQ0iM6Zip36H0+7RtAOoZ?=
 =?us-ascii?Q?2muP28MirKSBSjonIHulx6HUuydn+px3UlucKJRbEz/A/cGu1nqAB/CTqKc1?=
 =?us-ascii?Q?WWr/u8euW4LvGDLMsXX3kvqdNm3ub2NwGhvdh38s5lZRGzVwL7IoWDvZ+BZh?=
 =?us-ascii?Q?sEgE1Ucu95GPzPvnOCLuH1kRXMjWeYadKtBRb87KaE0LZk9xWLrnrecRCnRf?=
 =?us-ascii?Q?fOtazDUqzee4BmqdyckehTbViAlCwA6yuVPqtjuAg0+CDee4ZVbX+9SKo+TD?=
 =?us-ascii?Q?+XSwCGVL9hVVWxlT8+YD6w65FBizzsJrAGax75bWb7jIK/2i0dDciFdzmQHY?=
 =?us-ascii?Q?MyH7bAICWtE4eq/cnixsBmaCmBOgPAa5GGepwMqp1FtKPZ2leWVi7+Jl/fsX?=
 =?us-ascii?Q?YSV3XhK1YXBE4HZed5sv5IIatFI5EbtLcZig65LWPzK1npGA9Wwaa8bsBFKc?=
 =?us-ascii?Q?WBnqXhVwCRWP9/1Wst24c5u7NU37BH9XliLQDT6/mcg5f/GJDE9zuYUY7bhc?=
 =?us-ascii?Q?IDNWfzIaZJlo1LRQmO3dp46gwbPfjUtTL8/fQ0QStEGM3F8SV31UbBfshVV7?=
 =?us-ascii?Q?Bc/NV5RsSsIat0g8rXpymzMkKoJFtDX8TqrQ8TVW9UgRo98gkYnQPdRO/+Ya?=
 =?us-ascii?Q?n5epBota/Y1YohVcw6BOkFjY1+LT8LCXu4AJifqiq/sx2mn9iL6zDfQGLG72?=
 =?us-ascii?Q?6jEcwZ+MYxoqe8zMk4fpS46OPKzLdJLDp6fa7dWujrHSicosEpRZULSt4Pu2?=
 =?us-ascii?Q?HpsYWxe3KV0kdGWT7P5xePeVYVp6IuCUg7rxlLkZ+CmrcowJ6uuE5OlOSMjt?=
 =?us-ascii?Q?A/KsNadjuUmC87JE1wcaTzyAyMLRWnGTpl3hNPkxOqK1yJogdkoeQ8srWIMV?=
 =?us-ascii?Q?3R6m1pWZKZf2St3A9RE4tGehaopr5H1FVEq4K3vhIS+jCI99Y/2UrlhcKWiM?=
 =?us-ascii?Q?l68sZluotsXc4tTydwTPzHpAbmx4t7QDhb5Ft5JoKih+5boDRx9M7p/uaUjt?=
 =?us-ascii?Q?MjU4/6vO3qPOxZ1l8IoDwsFJi9eTRa2Ek0zu8i7lvui2swSdL+AZS2DxpNvo?=
 =?us-ascii?Q?dTevbJEvjg6Ji3UfJd3KLQcQ4VWGR9x2t/TX9nxjvwoWCmqm?=
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
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741fbfae-d53e-4093-f516-08dead73e4f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2026 02:37:20.6967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l82qNT87JxY3BJHRHJ/HTlUooF+R2ixr5EVLxZx0UPRtHpWJkiGwqw2PPWoeGIiAHSUZopA52DJV1nl0b7IeIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11556

> -----Original Message-----
> From: Sherry Sun <sherry.sun@nxp.com>
> Sent: Saturday, May 9, 2026 9:54 AM
> To: Frank Li <frank.li@nxp.com>; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; Hongxing Zhu
> <hongxing.zhu@nxp.com>; shawnguo@kernel.org
> Cc: imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH 0/3] arm64: dts: imx: Fix PCIe EP vpcie-supply properties
>=20
> This series fixes PCIe endpoint mode vpcie-supply properties across multi=
ple i.MX
> platforms.
>=20
> For PCIe endpoint mode, the vpcie-supply should either control the actual=
 M.2
> power supply or be omitted if the power is always on and uncontrollable.
>=20
> Current issues:
> - imx8dxl-evk and imx8qxp-mek: vpcie-supply references regulators that
>   only control W_DISABLE1# signal, not actual power (which is always on)
> - imx95-19x19-evk: vpcie-supply references wrong regulator (W_DISABLE1#
>   instead of actual M.2 power)
>=20
> So remove unnecessary properties for imx8dxl-evk and imx8qxp-mek, also fi=
x
> vpcie-supply to use correct regulator on imx95-19x19-evk.
>=20
> Sherry Sun (3):
>   arm64: dts: imx8dxl-evk: Remove unnecessary PCIe EP properties
>   arm64: dts: imx8qxp-mek: Remove unnecessary PCIe EP vpcie-supply
>   arm64: dts: imx95-19x19-evk: Fix PCIe EP vpcie-supply
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>

Best Regards
Richard Zhu

>=20
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts     | 2 --
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts     | 1 -
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
>  3 files changed, 1 insertion(+), 4 deletions(-)
>=20
>=20
> base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
> --
> 2.37.1

