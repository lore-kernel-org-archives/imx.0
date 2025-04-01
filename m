Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDCE1E47CA
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494129; cv=fail; b=Cr3EinmaUkdOHLw66gr5/wdgzM0t6DlEditGjxkTE5Ot2r0mqN/zve0+RFqPf+RNzHUYIou/TCt6Ph4PCDL+eqMM0GZvw2QgvOHmvnocMyLeuANDaAks6Kw5POpCJ174mPGSGENjpSdyzVPgvdry4/iDBhMkmsWSib+THK3TPhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494129; c=relaxed/simple;
	bh=GDEiwOnzMHe5mDT80Q/QQGgquJnffyUbpJiqWbyS35o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FntnjWBCisd9d3bQyJdRN2N7UugYu/zrHC5fGV7S5N5K5CsNC/Y14/dkqCS3QzRfx4bsQovksW/f/l1rPZ6C5KJ7Y4jevu+GMNC2DB+6/JLiwdLBd2Oki92zPkgw+IWPuPahamMdpmdn1rLaiHa3zDDeJj9F9/kq8+X2BwiisKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XaBrEFRY; arc=fail smtp.client-ip=40.107.20.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XaBrEFRY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CChZHQyWkTFyUCsutvq379bMqqdWggp6hMLm9esZczdVAN496b+EB4Znqgcx6dfaCZUxLseYsxY4VTf09Lp64DzVWy9JdpOMfRshcu20vOZYCGP9gLuZ9Cp7GKVNXM4HsyM4YVSdpuxD07XAWrcrUmg2dnFjGZkfZkJ0ikg1diNpZBqJXo+Ni2hrPBD1uxcqeLATzC0jP4j0X4SRB3E6VjhJQwWEzwSli6FdwvUA/On5jy0Ho22r0ywEuxzkkuLVZ/8Apse8cJj1HQi0I7MEyty2X1mPXT/VPfNW1HW+ICBNBrBCm6BoTyPyYxFw1zMsowGAL/yopFwD9az6Z00iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odLfUZ5vXBlaTeKMcrQT9xRGpMc09oYq3fpvokuWUW0=;
 b=EFMFB3ZJOT1dUXesxSZNshbCSMQOuWZmS+Mmw4LbH/gda9ejuhhUzHyJaFaVW0BN5QszMjxfqdMrRMUWdqD7g5IkhRe35x9Fs7nLb50Nt10WUYYaV1Wu3SdCeUTxchBtQZl8omlr98uJqRsmZKLVpMy3qYHouNntQnKxa8+UWZ32rBWCCxYPPrPCh8qy3Mx83H0kuqIoXC9fJI45L1Z016FImPfZl3nHsqQktA4aNP0205UF/ffksNkwVINMfV4vkCGMg5a42MSDl5sfpG3nl5nCbpQUweBhF5UF1RCqOakrOfEWjyRriPB0kqhe5FBO/8HfXTnk2ntPrcXPDyZEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odLfUZ5vXBlaTeKMcrQT9xRGpMc09oYq3fpvokuWUW0=;
 b=XaBrEFRYdyvPyzIoE1GjHBlnvGLji61o5huzbhCkNWYCAtLtzSXKMXu369N0YbQUJbpirxFJK7nR70BWJMOAY1FA2dh+F4jT/ibwDiU/5EPadpzvJOQbxTNKWPhI39eoZ8IhG5Bu/7rZwUYfFY0SlxlqX83U+J1ER0ZEQdbjG6ECeDoiR3ggxRK2Vjs6L6tj7Y7SC3YDeMfbdnZnvHrcQWEqcgkRofXyCV8ppu0Sww+YTg7oFWzCKTSQ28RzbXUeoEE+CV2E+LVYGdZcVr63OJn6dtT760OnwYJ5gAgVc+kgoOpki8y0rkRQGhZbFeUUxNY7prJ2xjlDyv4UD85MSQ==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DBAPR04MB7429.eurprd04.prod.outlook.com
 (2603:10a6:10:1a2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 07:55:23 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 07:55:23 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [EXT] [PATCH v4 2/3] arm64: dts: freescale: Add basic dtsi for
 imx943
Thread-Topic: [EXT] [PATCH v4 2/3] arm64: dts: freescale: Add basic dtsi for
 imx943
Thread-Index: AQHbotZDzjNG7BmumUmpsVvtGfyl8LOObvOw
Date: Tue, 1 Apr 2025 07:55:22 +0000
Message-ID:
 <VI2PR04MB11147341873DC39C504EB9910E8AC2@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250401071709.1138872-1-ping.bai@nxp.com>
 <20250401071709.1138872-3-ping.bai@nxp.com>
In-Reply-To: <20250401071709.1138872-3-ping.bai@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|DBAPR04MB7429:EE_
x-ms-office365-filtering-correlation-id: 516d9f36-909c-4be6-faf2-08dd70f28e64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DHx8vCp1Vcb7EI4EsQoiGOAYUbd1WG9rDy3+B2YoyLV58ou0tvTZbYFivryF?=
 =?us-ascii?Q?PRXXXGxG9A6X6UpxHHp3oAiPzhsRPDxscy9Li0PakeiCFzy92hlp405jRVtP?=
 =?us-ascii?Q?h0mKu0gvDE/ZBDuE/v0il3YZnKD+6ybiC5oLgfFrY1IngVwCnvc+peOaYYv3?=
 =?us-ascii?Q?ekoHq55hJrBcqCvYCL2vjhl6La1FK2R6Dw8cDJ1OHncXnYnVLyi5+8OhvUBq?=
 =?us-ascii?Q?rN9feqIVbGVAoZD/JxJdSKCX38/pYtST/qTzAkzOGEcmPpZjaxbql+cugLEV?=
 =?us-ascii?Q?NtPDjkOI16wX+u5uiOBWiGEe5eIDLCSuhTJ7G+d99suwyouE0KGQ9HFS5YYo?=
 =?us-ascii?Q?MlcH/mskNgIc/KmlQfW+L0CCYL0n5ogWdi3fJS3z+WcraYAilYLtvaSKmfM+?=
 =?us-ascii?Q?B/vJRHBT9bKEX5yoJeyc14H601qcoB2rijuDFse3lbLBN8puzdzr4mgrxfEr?=
 =?us-ascii?Q?LAr4xQDJFH2mNZscYCEe7NE2FN2+vDo1QQO+Aftek+ZOYa1YR5Lb7e1i8L3c?=
 =?us-ascii?Q?0Di4Q8Z7Cm+OhE+mJ+4zX0kQ0mSlD/p5c14rmEcWlzXK51O09ZIEL6XeWIb7?=
 =?us-ascii?Q?qmZ7SsYo9oOuMCd63pGeznLINhIpA5Cgzr70OGDTELX91TR8Pr+vsdXO5ude?=
 =?us-ascii?Q?6K7vBb0dA7g1Q6CsLwAeItij2OCthoteXeCe9qhWSn+O2cVpZCum5A5GTm/0?=
 =?us-ascii?Q?Unn/xwIhS5kwEVfKkDwCJ0mPR3xPUn5N5fGRMXK/4p4A4aTm7Zxiy6RqYILG?=
 =?us-ascii?Q?0GMIa6+aKRDFeh8rBv8mRhDXyFREjcrmuM20a75BMPhhxSgVK+1AVzU7jnTt?=
 =?us-ascii?Q?rvwyU7QH+HpGB4z6zo1fywKJ+ULRboJrtYuL4jJgGk6o/DG4xoSu6TN6VgnF?=
 =?us-ascii?Q?DVlUMmnEZuyCNkwCUC1mueKmYVWVaEVWt1kHjxg6H8UNF+U8pi7Qw0OO5cjt?=
 =?us-ascii?Q?GLbXQ3nViLZt9Jnqjbu1lPNcvxdaiiVUggjO3DShVvWruG8V4PMctgstK2DK?=
 =?us-ascii?Q?oD6lqYVe3QoeUCSgDyu3g206U75igT1lCCi+nmVdkQ9bE+ickJtV1ywKA8XN?=
 =?us-ascii?Q?ijr5uQk0HvUiyNf1J5t4K2LpTkh2zBIQr5MAeLaI1lhX5buHlerI+VfeNY2S?=
 =?us-ascii?Q?06gtOKcmICZuYm2cZ/fS1r8oktH7A7YPSDgqdfTI1k9K3xHrXvwQbvcjGpRk?=
 =?us-ascii?Q?Bjw1aSNEr+MdbHffY0BE5+lelu5rv+ZtrHhZr+VTNfJDTm8sRcAzXpmsewQA?=
 =?us-ascii?Q?38zIHiSkRU0p08TZjVTJv3SZpxifycdeFmMaoXAeGCq/yKPeGbMxX3aXpEKg?=
 =?us-ascii?Q?SGk2oDWwgyqd6ZNsba1KHayaspC77oLwGbQNu6ldq0u9Ov9/XRH5dbgMnkHl?=
 =?us-ascii?Q?Zfj8eiwN0s+cdW3uPY8j3/NDT8bbgRK4vR8uCOvfClsTR1s5uDefF7pZq4fM?=
 =?us-ascii?Q?v2qrPMV4CJx7UzZV41z4rYxX4dyQYA8sYNx5PBp3iszHBq4tTnJMeA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?n8I6aZyqTqeKC8mErWHg90wqeBqO2MOzk95/9LKpY3qyhVwsFL4fhqGih2N9?=
 =?us-ascii?Q?4v5TK5pI2rd7YyJLFqdk+ZiLY7ADV9fqIddIbwH7YtilALKBFxIsAmC8IW+X?=
 =?us-ascii?Q?4Sm49ASjmZ5lBtEhCM2QOKhnqBHgyWUftoINYZXRsoYVs0CXA5KlO0Iv3D/d?=
 =?us-ascii?Q?MLX5TTaop5i3C2/srI78DOicUoOZZcBlIJgr4Vj1PR8gBVFTiLCMulD0qDvS?=
 =?us-ascii?Q?YcR7dabyQKCbhWylByUVJ0K5aPbuaLayTzi3dfuU029ybYxMz5HlQLKb34NP?=
 =?us-ascii?Q?z/V/IHUAYkmEH/T9MvL4ujsns9uAshw4mdeOrzUxJtYOW3znzp27XqBrn9QN?=
 =?us-ascii?Q?OB4XoCyetNSX29qWLNjdVKA6PvUp4mBK9IfTWmy35kVFvJEYUyi6w75wHexP?=
 =?us-ascii?Q?IGF8N5Im0eCyeKaYGz0vckgAzuDTVfnGUO71Xc5aejTIJIRR7MQotOd9gUQa?=
 =?us-ascii?Q?KcwABHCmLXLDrWyZCjFsIQdhLEiafatm76jFfEnrJ045uex3hRmpPH2d+aJ+?=
 =?us-ascii?Q?9zLoOAF6mhojPvKHK9R75Ac7StIfd8m5LdPEsvz+bWTr6j4z69z3aDUC5TGp?=
 =?us-ascii?Q?v9v7biAUyGpThlKI6lVbu1IQYTGNMBBoLyb1XKJ7z1adsQpO8/kCJTgoqjd8?=
 =?us-ascii?Q?hk9nD59zE9wwnBlsssZsqua35zY3Q0NmNYMmbXKQEJqmopY42KG/IzfeNhGL?=
 =?us-ascii?Q?4n/VNWdoLsQLi5AmI6Zr35UCCCfUU4dC25E+4mk/sq2UfEpChgPtQJ8QbaVj?=
 =?us-ascii?Q?wycVxDLjQOtbUxUY1iiAee1waCgrGsZPhU+bCAloxOeLLOQ+ZjxLrWJANLrl?=
 =?us-ascii?Q?DE0iDDbMlteHgRmyN3Y+ZT2Mf5gQbp7URMHot72I1Rk4CvFYQD8rH3h4M6cg?=
 =?us-ascii?Q?zvUQpParf5PxNBG4E9YBYZgtaB5I6f4/Dokg6pWnf90B5/HLzRcdqyEBRDoq?=
 =?us-ascii?Q?oV69GQkuuT76+se9KV9HOlIoHyCOOLapetISKVOwhyJzRfbGJxrWyGd/ZkCg?=
 =?us-ascii?Q?2p8P/dmw1TTiOkLurHpQ9m+8bKAcWKm5ZJGZMd+aMiCSKmrpJkQOBycH/XHH?=
 =?us-ascii?Q?FMNnY2z5EGYUZBI3xZCoufuIMKEZI3tPU1hc9EJjiYdJwXM19iuBPR6OUy/O?=
 =?us-ascii?Q?DdDAers+WVadepN836Rx6j7vHu844TY6lfyea4H5wduzPeJT8o8T4b8FVUVG?=
 =?us-ascii?Q?bcuyhDFsS2i2wLxeeG2IF+6rC4YzYSU3ssY9D/OZYlIdlAN+Q0N6saf873Id?=
 =?us-ascii?Q?C81gNidLpW7LISEeNhBm6+R1l9Q2tetYpPFkuwEIQCeKls/T8q//w4VGkiG2?=
 =?us-ascii?Q?qu8PqJ0eElosu4Zn7qh3q2e2JyBj0LpOjX6QzcxWyKbRaEf0Qc9qARat3Cv/?=
 =?us-ascii?Q?C7ODmFxzOPjLLZUmcl9MbN80B5/WDCIckXQl2cKk/GZv1x7m9UMMOD2f1J3i?=
 =?us-ascii?Q?jTys8orv8cPWczh8IOzTQnCnaENNGgmrjYXPz8DNPt3P4H+rlDx8OOzY6N0q?=
 =?us-ascii?Q?a+wxZCBLbw0p7uFZEVOCt5A7B9g+kjfA8HEcyfxxe8O8Ncob/DcAI2+XFLaz?=
 =?us-ascii?Q?+vx4QXnLrbOhCqGWPWkZNrbWV15j9uMGkmmE1X/h?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516d9f36-909c-4be6-faf2-08dd70f28e64
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 07:55:22.9532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j2ZqiYAJSFvDRIABD6id3MH2OYNsGHL2rhHnhmHDztzSma/nSanySZ/3KAWL+HQgdUFsto7UbhYMMW98I/DS9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7429



> -----Original Message-----
> From: Jacky Bai <ping.bai@nxp.com>
> Sent: Tuesday, April 1, 2025 3:17 PM
> To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de
> Cc: kernel@pengutronix.de; festevam@gmail.com; devicetree@vger.kernel.org=
;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; Aisheng Dong
> <aisheng.dong@nxp.com>; Peng Fan <peng.fan@nxp.com>; Frank Li
> <frank.li@nxp.com>
> Subject: [EXT] [PATCH v4 2/3] arm64: dts: freescale: Add basic dtsi for i=
mx943
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Add the minimal dtsi support for i.MX943. i.MX943 is the
> first SoC of i.MX94 Family, create a common dtsi for the
> whole i.MX94 family, and the specific dtsi part for i.MX943.
>=20
> The clock, power domain and perf index need to be used by
> the device nodes for resource reference, add them along
> with the dtsi support.
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v4 changes:
>   - reorder the cpu node compatible string property as suggested by Frank
>=20
>  - v3 changes:
>   - remove the blank line
>   - add PAD config macro define as suggested by Frank Li
>   - update the device nodes compatible strings for imx94 as suggested by
> Krzysztof
>=20
>  - v2 changes:
>   - remove the unnecessary macro define in clock header as suggested by
> Krzysztof
>   - split the dtsi into imx94.dtsi and imx943.dtsi
>   - use low case in the pinfunc header as Frank suggested
>   - reorder the device nodes and properties
> ---
>  arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++
>  arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
>  arch/arm64/boot/dts/freescale/imx94.dtsi      | 1140 ++++++++++++
>  arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
>  5 files changed, 3094 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
>=20

...
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi
> b/arch/arm64/boot/dts/freescale/imx94.dtsi
> new file mode 100644
> index 000000000000..26e08ac51c36
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -0,0 +1,1140 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024-2025 NXP
> + */
> +
> +#include <dt-bindings/dma/fsl-edma.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +#include "imx94-clock.h"
> +#include "imx94-pinfunc.h"
> +#include "imx94-power.h"

> +
> +                       i3c1: i3c@44330000 {
> +                               compatible =3D "silvaco,i3c-master-v1";
> +                               reg =3D <0x44330000 0x10000>;
> +                               interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL=
_HIGH>;
> +                               #address-cells =3D <3>;
> +                               #size-cells =3D <0>;
> +                               clocks =3D <&scmi_clk IMX94_CLK_I3C1SLOW>=
,
> +                                        <&scmi_clk IMX94_CLK_BUSAON>,
> +                                        <&dummy>;
Hi, Jacky

Please change this clock order to this like i3c2. pclk is system clock and =
fclk is bus clock.

                                 clocks =3D <&scmi_clk IMX94_CLK_BUSAON>,
                                          <&scmi_clk IMX94_CLK_I3C1SLOW >,
                                          <&dummy>;

BR
Carlos
> +                               clock-names =3D "pclk", "fast_clk","slow_=
clk";
> +                               status =3D "disabled";
> +                       };
> +



