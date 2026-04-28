Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F113DA7CA
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369994; cv=fail; b=H3qbzoWjDOLPqCnh4j28zKlwTAHcprya2KiIiknXTLWnqbGyfejhOCqEDGjh0Dv9xAeKhJX9XN780JRsRzoIEz5+CGok0wUiebFdjg1eBXXbv9ebCF9Yn8Z6nsxklc3/cZvas1lqKv8q5EfieIHwbDQ/wdpKm6dmrKhBRhhEmJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369994; c=relaxed/simple;
	bh=uLuXvEaxXsxgpgqlT3Wxky8Cl2eUS5nKR4eS+IVYDw0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=itnAQXlm9TJKVQPNIXxrUJFSK9sie6QcldkX/MuAYC6qJ53zsUSVHD8iwJ0wmpd4gYutlEiFGanIGHWnp3/1GuRYiJLUwv4e0gbOlVaWvjwxssMUYNAIZnYVjzYLa495+f3v7xJINrbMTcwQMaBU11SlgldNAYiaaKGm0MpFWuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LjsYIk6C; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LjsYIk6C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiN1SEKnVzsxtXjxm65DEYZw/WQI8V8gPAFR7SA/eKohgO7jgh8dVhxKQ4Y79fenIrBnaV4IRWKGGoKb4RXBdmQhvzoPM3Gm2oZI6/Znwv/81MW8Dsy7ydIZhO3u1tG1qOCv+CfBaQx08UGuWAW1QtO62wtLMGCHsUNZFE7/4/FCj9welAYFapOfgVbwJ1UbMeksUDXVJcAJbJlrAt3JrOkSncm4wpXF00KCkFlxayPXdFie6TCZvd9AilTH+8iO/F75SmQnn8ge7K0XZBmx5jXspyqGjh6d1TLGl6WOLnmE8BHaaxb7365HU2p0YASHQHin/D9zbsXAg7QeCMR/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYyKPL3ipA5UOYMxAK/ZW9fxSeLyiKzvzTNig2vTUao=;
 b=li9ATFlPGP5mex8QAVE0+/4KhkthJBMTA0q6fkoTTAOoGG6raWt/Rq34yta/kTgHV5YeNA7AfQntZhAGWhoSpOLl/QzF5qJKWIMFklHYSE+YDxzG1Edrn0ZoqYQvisJ2TAaZwNEa0q7/aOKR8KdRqyaWca+xNHVCQryz2n8bwm3k4t3RqvcA2ZEWa0VNQjdzPuDAt5QMMOHkdR46f3/Tk3Gdkn+whihsep3FsNEqR2Qn7bu6XnvnGS1YB7A870zjT+OiRjmYaMZUBmtu1pFHTyV4SUMcC7tEpLztg8pgX804SaxagMUtP4m2vkAoI8YV82LBNoo29+wjh6v/I4P6aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYyKPL3ipA5UOYMxAK/ZW9fxSeLyiKzvzTNig2vTUao=;
 b=LjsYIk6CKTbhcvRYoayDu7je0GdKtge7F9XFU3OlD8Ja4prK1eI6e2jlKnycDhTjG8VDqmHxYoIoXRI+TPKKMMSTKmYhknN7o32esWOz/3dGpKJkABN3uBDS41SMiTxqaKNPmz4H/GbMzNCu/pHhSmfUocJ118rkdo0PzT9Z4K9t6QqHbsT4Hb5xQymuNC52MKLrO5uVNuEMHwsNSuNB67T8I21B081YZLhKRiqO9+1ffyMl1Bwb8Uh7ekiJSVya0/ll1ld6mYViZqKxub1360yjS1AKWnESHCQwlk9XYYRTJr9HKXbJqCISbltdkjENYhN9NZmey6KMhGPs+KK4Pg==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DU4PR04MB11962.eurprd04.prod.outlook.com (2603:10a6:10:617::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 09:53:07 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9769.016; Tue, 28 Apr 2026
 09:53:06 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "Xiubo.Lee@gmail.com"
	<Xiubo.Lee@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>,
	"nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shumingf@realtek.com"
	<shumingf@realtek.com>, "rander.wang@linux.intel.com"
	<rander.wang@linux.intel.com>, "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: Re: [PATCH v2 3/3] ASoC: fsl: imx-rpmsg: Switch to core
 ignore-suspend-widgets support
Thread-Topic: Re: [PATCH v2 3/3] ASoC: fsl: imx-rpmsg: Switch to core
 ignore-suspend-widgets support
Thread-Index: AQHc1vTQbypPN0ygcEO6Esgo9lEyKg==
Date: Tue, 28 Apr 2026 09:53:06 +0000
Message-ID:
 <AM9PR04MB8353EC7B5D2D01409B340CF8E3372@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260415081942.4183108-1-chancel.liu@nxp.com>
 <20260415081942.4183108-4-chancel.liu@nxp.com>
 <afB0WHueZ5AGF3Vi@sirena.co.uk>
In-Reply-To: <afB0WHueZ5AGF3Vi@sirena.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|DU4PR04MB11962:EE_
x-ms-office365-filtering-correlation-id: 3e6925d6-6d7d-42bb-67e2-08dea50bf2ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 rBSpzey4+F/ub2SZjXxrJiUQ7pK6+iUFdVI37XzkRBZiSwxMh6hhBFibLdDB0bjsGiESooV2QQtspkBeInOtmNt675fg9PRyZ2IkMlbfVAreWsdHiFF8K+d8g1TX/Uz7WQO+SUpIo9VISfV+UgkHKxg0e3zC5+Met5U3/ZjMn7cB/yqjWNzBH0zk16ChRlj09MSYgV+twmsB6IXlq1p3r1eQranzUv4Ey9hEB7pyHYMRvAzo2OsR0wuLk6vVHKHgcoZz7b9n/76kp02yvIY2KBaomRyfnPD8wtp4ltwphiychwLv0MVEnd0URm/ZbOqDp6Cqhf4TPhACiD2/hhupjGKct7UjNO1TgYsNI7iIqz8aATXLMjr9wCmKPIJYulTNnC3pIZSiJBtrQYzlOggCNKmDhkqWTuCIBsuGdhnq2l9l6e58UWCT+QiGe+xcSq5mw/5UYpGJwwncxu1a2NgoxS/BvzHnMfrMeEoKZVOAx/AZAXjJQ6UW3dZvrX0bIlYHtqQwJRqrks+sCjAgheOKS3viOgw6XL8PM9gkVmJLtaQ5UlypztSWpZ2B7C0eY+/vAt1zSGkcoPgQV6Ge3lw874VE3hZRmeOuajUXZT56Sux1vgmrm218FtUUNv+BGT3LDZ/n6ebr6E5wsa6JsOseSfg/bm/7HQ4nnns3aNO0UrTD+rR8lnnESjMBlXFsELFDQ4usofbxWUOnodWnZvIfxBtIsRj8kWQav7ITno8b9qvbUcmgMEPSKqaloA1x8hyio9FxXgcxPVpNVRjEvXWIWmxF3TXCbeeOkzFYI6LHhas=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Bb7NL4wSuzt3FZh7jecMvRzTyCHdowoLTGrNxFcVLKObnoFLyR0QEXtvuwH8?=
 =?us-ascii?Q?/BYRv0JLofwqpJ8empzrfaAJIfyCT37EBCuyn3p6e0B00YFNT335UO0Ma7xm?=
 =?us-ascii?Q?ZfeZEd7hLJRc7EAaSbdcrZHaVA26wpEHGz/roAQjuL0UQ1D7uZZxr0oSuYjt?=
 =?us-ascii?Q?mVGdnuffMLzL8Nn4+eHE6W/ezt3q0/D+Zlbq5fUJN1gv4zSRB42zj1A7WRKV?=
 =?us-ascii?Q?rSl43lBzE/IZ466/+mRHDCGHybk7qaTecO1zgRDl4f7Yf35tlzM4D3zvMOXH?=
 =?us-ascii?Q?4achuZ3r34Oz/TqFHWrTQL7CBlfStVVfe0ZlyItQFCfkLu8bHjbuKgbFohe5?=
 =?us-ascii?Q?gRMFqdJA2oT9ua4WnOoXyV+s7cIQBr/UAE6cdo6ZUwNdyaMm7d8WIJmLEvDB?=
 =?us-ascii?Q?Z/6J4vSNTdnSB6+RZkLNz61uPkSHAP8Y3rBy8HTVMa3ovvpkSSCLm6DNTnqj?=
 =?us-ascii?Q?nj/8H5kKIaoYx4sfM5sMN2iekdBsVo8PmHT9v4ZBUEfj6ZXZqozOih1wBfY8?=
 =?us-ascii?Q?5Ii/D/TGgTdw34JLPjkeYsXm3MLSS4JwatJo0862w4T255Jp/8cscu0CiEKm?=
 =?us-ascii?Q?sQuUFQLJ3yrkjr47yudpAK+YqkT8EMdHQynDuxix7ZX/oDuRE1nvVKjSuZWR?=
 =?us-ascii?Q?+fbvRlYLQ4ej6SiwSsDnBE8hnRUQzjaGFQe/EOL8KxmiMOLcbmOvrVo+Ymrd?=
 =?us-ascii?Q?1AxEgYsHaJrSeAkroO/bh8oxh02Y7/aP2s27MQju1u4msJo5N/pekUdL0hCQ?=
 =?us-ascii?Q?iz2+1Xou/1XJHWKUV8i+/UFtYewXm2n54x+v3gIekK+uSlA9UaNObd/sFb2u?=
 =?us-ascii?Q?t5kx7dctIgj3kglLjO9wG4oayk/EHLen/AdDIrhOT+xowV2/bAHiNQVj2rn6?=
 =?us-ascii?Q?miTfpIuIk6IEIaBXMosLYz+Xsgz6Y5tyhWDy4FFjhD9OikZWEZIcyMltAymB?=
 =?us-ascii?Q?79j6o1g1PgaeAId+aoI8lb/k2ytadjj669ifJL+dUWQ6rGEXOQYUTGBmP27r?=
 =?us-ascii?Q?O/H9Xk3pXbkk//KhJUZr4JkUlkSUlDIoX+mPs/sLnSPUK8nf0iEQKmZ9HbuH?=
 =?us-ascii?Q?yx21vMMHmvVdlovBTKqBRVJNlBDSxsnR6cfn7wy9A0v9VkYz6o+5IzH05lAE?=
 =?us-ascii?Q?3l7xJEi74xYZzGcAgnixHDKHlj9adQsXI5TpU1VHCEvoWlYaSM/RkLXNhZUJ?=
 =?us-ascii?Q?66Vhh0HPU7T7DgDCkEcOF8QORzGod5Z12kpT0sEhiYavD7SRyfdp2ILWRsWn?=
 =?us-ascii?Q?C8/thTQw4cxk2eJenn24D9J1/FqNN7BFgwj2pduGla14ht9LDUd4nN6XBM0C?=
 =?us-ascii?Q?kgxVp3mjsUNwrbItznfQ2bajiauvGgXcZJaHq1why1j0bhHxhhCcNkRw5O4B?=
 =?us-ascii?Q?s/YWgKfGOOfMsXFIp82hV4R+w7GIbMWmAzMVxX83vAWVKjn+AaAzuMKvsR+5?=
 =?us-ascii?Q?959oNqeujxEiC2jxa1llCWPnpAwGctn8KhC5RA5TEeRevrSD3dDv+TdydJzs?=
 =?us-ascii?Q?9SkBd6WSPOpIFzTvU5o9JDuM/J2DfV4Z8fkQbxqaOIdRTRZcD4eyx641Joie?=
 =?us-ascii?Q?VJn4BWPmRvBXz7LJimOvNy0sSAyHDLRBavoA4cO+4+nL41LshoZR5FqgjeII?=
 =?us-ascii?Q?gM4wLk8sbfz2RiS73UuUK0h5HIbYp+Z1zI+s8NNqONKgkiNWFA6xl/Z2S/VP?=
 =?us-ascii?Q?8lENEp2tcWsO5+8RZhM27nrTSFZQ+v3l9bF6weQVkuYkq1XC?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6925d6-6d7d-42bb-67e2-08dea50bf2ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 09:53:06.7441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RsZXscSbqBZc/VfM64anbRMeTch/q2SJ15jU9mTWYN8MYwuW0w2x3uwasu8NEyZcT1AmUqD6iqSKwwDC3RP2aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11962

> > @@ -274,6 +257,15 @@ static int imx_rpmsg_probe(struct platform_device
> *pdev)
> >  		}
> >  	}
> >
> > +	if (data->lpa && of_property_present(np, "ignore-suspend-widgets"))
> {
> > +		ret =3D snd_soc_of_parse_ignore_suspend_widgets(&data-
> >card,
> > +							      "ignore-suspend-
> widgets");
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "failed to parse ignore-suspend-
> widgets: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
>=20
> The other error handling paths here have a goto fail to do cleanup of the
> of_node in the platform device.

Will fix it in next version.

Regards,=20
Chancel Liu
