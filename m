Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B815B971
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 04:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769488027; cv=fail; b=FC7Ck9cRqdlj/gQsba3vCQCFbEZUd9mb35pr15d+Hg7k/uEXeBAk7mFhELk/rhEtK7juv40jvl0a5pUiKz9KpCQ+8f8pHXMQVSzG/6ZkVML/GrcgbC5cCkUMrrfmk+MbmC0PbKuTYk4O5uTtUoI9gV9bZt7h3/20ogXA2dzQyfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769488027; c=relaxed/simple;
	bh=uZTxMtEAOEjr/Vx7wH8fPRM9yjTwTXUjuFTR76VZ3nU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oLaFhIQ7D81lPpbScnWVgs91JxHeRTpWCQkwKFqQLDqmYh4ltP8m7kPpkFKFKQZr+zmvXjY+bgVXw574zGt0EU6+clQ3e1GiGSqI7dMHcXFj+6Tl5USUQq0/YolJueHy9VrgcEANC4IDVCewdK0tLWJN9+zKwAc9QKuVOgIdOY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mKLpB04g; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mKLpB04g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCwN5L3lQyQw1G/ywxKIPsqP4lqn0HUvctGlsW6md4QEM+pyiu28wAw460pGYvjK/n7NrcMKz1hlwWKqLp0hHvzU8c7ekDLoHZ92ekbT6jAnxLRy+DRebtQ0D6LnXfHWxC0UBNivheg5W6g+W57lb5nbAMsMpLaen5QKmXrZyVNKBQSzFntilmT+Rb/IenOnXx5DdPsqx3TR8k0zatFIa8hoYfvKOHKO25D6Emj+zjUHP2vgoFjGmWfF8+C/GRMB2mZsI83Y6A53LX/mkJiKkgy+7fXNOXpDTTjQbOklEuZT883wXqD5gYeMrNMnUxeXaL2lxIVnixeeDIK5WnlDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0CxIJTUPo8jKPA3sCOKbPYUY7lHD4znRUet/tjK2wQ=;
 b=B4xoahi92OlIPsik5zl/M+X7DZGRJOk1tp3B/DnPisYKDOE+9O4gbkvOeouHCNJCnENzR8ju/WtLE+g0zfhu18oH10IhdaJ8BCspP08RzE03fG6k/VSwThCsOeJ09kzBDqUbNQ5dUgAESJBB5t4owh6d7I+ZgGXHCkcJpau9SlgSPI9f1DQx2afdpvUlD/hbyIIbegS7fsDu2pUK3yyJHY/6mJs5SPo5/yuRD4oZR1sXJ7IG8vDTTFYXpegSHsVr9xuND0VY3WfEOo8EJjkiX3lFeTUDMFWUBDvYz88iTQkaCI0gDNC2bHWMBSjaSLQEKM18udk39WH2cSG1cZD5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0CxIJTUPo8jKPA3sCOKbPYUY7lHD4znRUet/tjK2wQ=;
 b=mKLpB04gNUI/SXulbRyfruHQbHwn1qWrtvXkBT3m/JAsXocQxStxIXze8XVXjdXVvZu+W/ALVgmCdfCcMp89qTK4pngrpf0avWb9/IeIcpYNsE6nPar+S9+Gt9CIzX1cDnNcEfJuHam+1k33NQzTYDkTyZ3D2m2+Eg+UC8yigWG0f7D/rXOqci91W1OKs/facLoVzoVDdzwDhfOkc+Uxs8L7hzQkN5RvW7mPH6vONilUcziQz0xcrlYwEcwsq0MpvoUhYK8vmJwGyBhucejmK6hfOdYld3HF2FHPIWdmLdXaeaFJlX5UEEsPmoPNCNAthhHuP+uvxM0JrNVPWRVB/w==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DU7PR04MB11236.eurprd04.prod.outlook.com (2603:10a6:10:5b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 04:27:03 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9542.008; Tue, 27 Jan 2026
 04:27:03 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "S.J. Wang"
	<shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>
Subject: RE: [EXT] [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX
 MQS
Thread-Topic: [EXT] [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support
 AONMIX MQS
Thread-Index: AQHcjtP4SIMgsw4nW0S9gfqMf+Q4arVlbIQQ
Date: Tue, 27 Jan 2026 04:27:03 +0000
Message-ID:
 <AM9PR04MB8353216F2312DA5097106B8CE390A@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
 <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|DU7PR04MB11236:EE_
x-ms-office365-filtering-correlation-id: 2fe0d228-b08c-4258-ad42-08de5d5c52a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|376014|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Vl2uvoBFQawD6I+c6dWu4BAH5hMKDp4LzjxZD0xbCHfrQSxbr3//Gn9RXxhH?=
 =?us-ascii?Q?XWi+g29iU+DggvbJWgJRzq8KLVd/6U8nh1Sy+kd79ylyXcncOcNd08/MbeIc?=
 =?us-ascii?Q?8qBsDlamAjKiKJ4qmLRTHu0wE1L2zTnrtFT60HTa1Mj6uuiBISsOYxCIwFzU?=
 =?us-ascii?Q?voLR12vyQWyVZVvsK+T5s6/nXou+PQyTWAZPJoRKftVujwRgVQobXEZI4ROU?=
 =?us-ascii?Q?6lyDGJactTxVffKxm3ovasrIsZiBduTmbOBGBqIMAbUqOECNjPbTU4Z3nHy5?=
 =?us-ascii?Q?T2GdnKCFneGiOiYX0PcwGNwZmdBxUzbs8MFX/bNUeG1yl1TL+qN82Krdfnze?=
 =?us-ascii?Q?zRu6qS77Yvvb4ar0+T0EshBA9SplV/b1HLn8Ei+LC5S1BL22X4Fr45h15Nb1?=
 =?us-ascii?Q?heDL1Og26FOrYXw5R2hzH7XPWuIy13jO0jJrZNSWyPpeSjPiOvOQ1lS17+vS?=
 =?us-ascii?Q?lbB1Q4b1k0tDNCiu7GveuLH20xb09gYKnWvGXH8ddYLe60KdkoOrDmBckdBW?=
 =?us-ascii?Q?gGhi/eQFGbbsxOOxDXFJGHqZMREqcIBUvaj7b8k/t4/bP674YQYVa0BZUpJo?=
 =?us-ascii?Q?pttR6DDdXp0BiS9GZSHWKFK7Fq0nW1EBhe3YC6JLBeTLnxN2eFMZ5rIpoq8K?=
 =?us-ascii?Q?zycCy7u2+naqNjxrT9WzpdoFAPQ1RDMmtao5bg/px54se95HdXanL8yhL6f/?=
 =?us-ascii?Q?lcebwf43A/0Xk4CD9ysmvrAldTT3G9AEFlFYdGa7vFzUYPIh+YWBEVlOn4TZ?=
 =?us-ascii?Q?W7ManadAYOeKoDry2eaAz9KU1/Gd/ixsP6D2/sDJDchHJR08nY2VjPyHE6qO?=
 =?us-ascii?Q?0mCTu/Me6JPcdeIZX2P306WTZYTTXuYoTpfZyAReGiga4LofIkSXC0oPhyk9?=
 =?us-ascii?Q?KWN1PAqPaqT1XokdXGVjN5bYDHW+WdVoxGI5kgRSxBbyvKsbI7hb9HvaLFq0?=
 =?us-ascii?Q?1qosw5PqZYO0BFB/k8GQWS6VPVCUwhElRCMjPeK2L0/1/0ExJ3exQKd6F4t3?=
 =?us-ascii?Q?BwOC3YIEbUCMRz+o8aK5vaGDuQwY116RbBjNvyBTWfsi8vpUaGf33ihiOZR8?=
 =?us-ascii?Q?fhTbV+tlZINY5zYl9+yjILhfZTi8Nje4afDy5zJ9z7dWsK001BK1GiehzdnR?=
 =?us-ascii?Q?xSicbrV6XXImdjlmJ1VVWPfQNOWhAvYmL0/fbu8ZLi71SnUFfdBVguqdxguT?=
 =?us-ascii?Q?304ZQ3gqee8XbxHDC7yCbSUWlKQc6Xe9+mUjY2feBGbkMoE8C8LHBAGn6aPt?=
 =?us-ascii?Q?m67T7qQpBkdZOa8T1kXLJzkcw1r8BAyc213VIzKMzRAiutAMtDL3s19nUVu8?=
 =?us-ascii?Q?VYsPBXrAFGjPPDnNuR1EnoJmji5O1ag1UX5SL+2Itb+Gsp86HZm1ep/M+YFk?=
 =?us-ascii?Q?PRMGzOdlfq9EgUOQGpwuzQj/tHCazpAI7jdSNzrnupkCALdEeo5c2n85+xXs?=
 =?us-ascii?Q?012Gk5yXWXZgcQRdFGCkMfMvJHbM/GJu5778zGzb0ndLblBXyCFmp4hTVaY6?=
 =?us-ascii?Q?3rxioZd6wOz3EsTQQ0Lu0+c0kKgl4qnsEHu15QRSfz/kyzT6wPgDlMGt39+W?=
 =?us-ascii?Q?coYgzc+dfJ8t6V0W5dlGsUuKDf4K1Tsxpy2UxXWpBCVf9YBvBmxNmgmx6FUK?=
 =?us-ascii?Q?GQy9V0ray73L+N8ZSMRJw+I+hJIe98eUdUzxdokVx2+4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(376014)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zlHgVwQneerxxuexsBoBh+Eln3G2xFJoIWGnwSDjGkftfcEWx6bKuDMUFEE7?=
 =?us-ascii?Q?AT5hazMPRx1+UfK9jJ68gjVO8vjedevPh7+Qd1JApDTQinHSl1SqkIFCEdg+?=
 =?us-ascii?Q?K/rPlz/le8C65bC92eCN6fTkFkz2mwAY51J++Fzu+2UMU2TsPHxrUoZl3aDy?=
 =?us-ascii?Q?2VZ8oMQ6MJleoqdvkeRN9kAZQuYjxU2O2XbQ7AA/wiLP2/wc+0pLlUFObNmJ?=
 =?us-ascii?Q?glgv+auCIPqeptIZpDZo3FleiARG5SDoGqIRlDy1vVRLnOOdcfOrPuFU/Cyy?=
 =?us-ascii?Q?6oQSgDp5tmY1iUaOuv/Fp5l5TvhM0URAlXIDnWiN7dtkG8nXsaO8AyKB85kz?=
 =?us-ascii?Q?/T6+MyYnAobhwpUoHamjToAR1H0P82aYpFx7GjOoIIch+VD3bDxzDpddXZ1y?=
 =?us-ascii?Q?4XodbLPebhw/Gp7GZhivyAOqPUgpgi7x24b1K213RHwl+Oqv4+z9+m4FBkKh?=
 =?us-ascii?Q?uaQ9+VUoXspjy3GUNh/SUt2llSFSs4FyuNg1RR8A+HXHkZN1gQGOKWW3+i3P?=
 =?us-ascii?Q?BnkuhOB/Nk/wQEynXpY1ragd5U852Zmpu3xd0hTUYPreBgw8Ovjx/VEHWXfT?=
 =?us-ascii?Q?9VEFl6/L8gSblOsypnJ0YKJco1RlQG/gkHOmp5W/z7r2oljgzXpDBHrceMdx?=
 =?us-ascii?Q?+eyX2OdcfDonHpIKyNvPKo/6pJkjDLTbnkVdtlD7CmEeyIYWBtrnechaH/oX?=
 =?us-ascii?Q?qMo2jwqBwAFoJ2ZqsMrKj51sVjItpXAnH6fdWD3oVnfPrt9TLtL9R2ct9E47?=
 =?us-ascii?Q?l/XVTlNbdzJMXac2mfrZH+XLuSIEfKdFKjfq5As7yBjNbdtw8x0wcQ1cslIA?=
 =?us-ascii?Q?BWuCPHctCs066JaZ1Jy7Gr6lnU+UI9Bk8Hj4gmaR0yh4z2T3ZXaRulvZz1+K?=
 =?us-ascii?Q?cNKndBEWZQHq6ckEs68jH1rqxEqewmSSwDHgX1GMqK0Z6d3/JwJSdqDumqjS?=
 =?us-ascii?Q?4eqeVRv5RVZ8F3DmaYgsCqqZRYNMIcJ/7SBUDbzj37ZREud3YpTtx3ysbL5j?=
 =?us-ascii?Q?T2rXBW1AWkjvS/ifLfZBJKf2APUYwfJbXcV8PxJ532+0DdtbjWagC18FYOw6?=
 =?us-ascii?Q?C7hmnSrmZB1qemSX7F8xhv+v2tihQYcz4a04GDFIigAox5J+x1pCdjmChrHt?=
 =?us-ascii?Q?8CPgubFlG6YETspjEalg1cSH52dlruDFasJn4iLUSLpj484A8hD7fFWF9dgt?=
 =?us-ascii?Q?WkwTTZNUGBpfCIGyRYaOGUDZ9i2lgbZTbEZEB0Wg2KGn6seuvqwVZRzbDk6Q?=
 =?us-ascii?Q?J019buPcqSjU59Y9J21WBLOoCW4tCLKtJRaZ2ApDYlk2a6P55ec9jn4Cs7yJ?=
 =?us-ascii?Q?xXSs+bdsKEA6Ctdj5BaefeJCQu0RIttVOr+E/Bfel/uDeNOvjG4fvx/mibVo?=
 =?us-ascii?Q?tExmENCu48deEmSFoKs5eP13uR16hj23x5IMEpv9eubzJB/e/V+w5zEqBnpq?=
 =?us-ascii?Q?eMJug3TTmsSyGxayDKiGPW/HRqqBREdUvDwGbP50fvildjVXvYObqyeqEl0+?=
 =?us-ascii?Q?qs/UAKkhR19XI5AzLoHbcTHxDbZ3L+68B1zm6Y2FNMLsrbmt6+n0M2iGEf4X?=
 =?us-ascii?Q?M+4QGpAHxXX/0NJXrHMuJyOk+gQM8L6hP2rMXMvmgh2HEKins0n0g/LS7DBW?=
 =?us-ascii?Q?zgGQL0wamuj8mXc+PmcIXpwkuTwZniDZrspf491r33GQpgJCrJaZb4zdMLRY?=
 =?us-ascii?Q?nlC1og034ygLK8Tisb7MQoCirN+7PK2QGuuUraqxUZbfu6xr?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe0d228-b08c-4258-ad42-08de5d5c52a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 04:27:03.8030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DhxSQPNhwn4+8zcoytEyi9yqqxcMbYmkwiP5gMPlgiOxgRu/U1tMvIJz2BvNIkLq1eZrN2Y1faqUp4xwBGuEQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11236

> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> Add support for AONMIX MQS (i.e. MQS1).
>=20
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@nxp.com>

Regards,=20
Chancel Liu

> ---
>  .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
>  2 files changed, 78 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> index ca1c4966c867..0f43e3be7058 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -243,6 +243,12 @@ codec {
>                 };
>         };
>=20
> +       sound-mqs {
> +               compatible =3D "audio-graph-card2";
> +               links =3D <&sai1_port1>;
> +               label =3D "mqs-audio";
> +       };
> +
>         usdhc3_pwrseq: usdhc3-pwrseq {
>                 compatible =3D "mmc-pwrseq-simple";
>                 reset-gpios =3D <&pcal6524 8 GPIO_ACTIVE_LOW>; @@ -473,6 =
+479,21
> @@ &mu7 {
>         status =3D "okay";
>  };
>=20
> +&mqs1 {
> +       clocks =3D <&scmi_clk IMX95_CLK_SAI1>;
> +       clock-names =3D "mclk";
> +       pinctrl-0 =3D <&pinctrl_mqs1>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +
> +       mqs1_port: port {
> +               mqs1_ep: endpoint {
> +                       dai-format =3D "left_j";
> +                       remote-endpoint =3D <&sai1_port1_ep>;
> +               };
> +       };
> +};
> +
>  &netc_blk_ctrl {
>         status =3D "okay";
>  };
> @@ -534,6 +555,51 @@ &pcie0 {
>         status =3D "okay";
>  };
>=20
> +&sai1 {
> +       clocks =3D <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
> +                <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
> +                <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +                <&scmi_clk IMX95_CLK_AUDIOPLL2>;
> +       clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k=
", "pll11k";
> +       assigned-clocks =3D <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +                         <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +                         <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +                         <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +                         <&scmi_clk IMX95_CLK_SAI1>;
> +       assigned-clock-parents =3D <0>, <0>, <0>, <0>, <&scmi_clk
> IMX95_CLK_AUDIOPLL1>;
> +       assigned-clock-rates =3D <3932160000>, <3612672000>,
> +                              <393216000>, <361267200>,
> +                              <24576000>;
> +       fsl,sai-mclk-direction-output;
> +       status =3D "okay";
> +
> +       ports {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               /* leave unconnected - no RX in the context of MQS */
> +               port@0 {
> +                       reg =3D <0>;
> +
> +                       endpoint {
> +                       };
> +               };
> +
> +               sai1_port1: port@1 {
> +                       reg =3D <1>;
> +                       mclk-fs =3D <512>;
> +
> +                       sai1_port1_ep: endpoint {
> +                               dai-format =3D "left_j";
> +                               system-clock-direction-out;
> +                               bitclock-master;
> +                               frame-master;
> +                               remote-endpoint =3D <&mqs1_ep>;
> +                       };
> +               };
> +       };
> +};
> +
>  &scmi_iomuxc {
>         pinctrl_emdio: emdiogrp {
>                 fsl,pins =3D <
> @@ -618,6 +684,13 @@ IMX95_PAD_GPIO_IO31__LPI2C4_SCL
> 0x40000b9e
>                 >;
>         };
>=20
> +       pinctrl_mqs1: mqs1grp {
> +               fsl,pins =3D <
> +                       IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT
> 0x31e
> +                       IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT
> 0x31e
> +               >;
> +       };
> +
>         pinctrl_pcal6524: pcal6524grp {
>                 fsl,pins =3D <
>                         IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14              =
       0x31e
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi
> b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 55e2da094c88..0c55861d673c 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -391,6 +391,11 @@ scmi_misc: protocol@84 {
>                 };
>         };
>=20
> +       mqs1: mqs-1 {
> +               compatible =3D "fsl,imx95-aonmix-mqs";
> +               status =3D "disabled";
> +       };
> +
>         pmu {
>                 compatible =3D "arm,cortex-a55-pmu";
>                 interrupts =3D <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) |
> IRQ_TYPE_LEVEL_HIGH)>;
> --
> 2.43.0

