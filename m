Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4AF49659
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 03:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737516999; cv=fail; b=U5B7pEc6K3GI7L20gfkmyR4OSBfxZA+9aF0HnZmchnutY3qCCL0/jIbS+U1Ty7sYeDoZDxIREnWyOXogMlLZJLsaFn2/VNcqntEMV1gqoK1qpTLeTAuFnPTMlF5DEVRyQ88sGs0lvsWMzYLwx7S3zBWQZmdXasc3j3rTCn1lkZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737516999; c=relaxed/simple;
	bh=gmBLPqBSYgnWy3jfP1vxWMUcwK6Vh3EEv3zQabtXiFA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LVb16IJPszonw+GSuWui5fYUwvrZBknuocVOL3/BZuYr5hmVqOK0WFOY7m2JWTEWnx3D1vchnrRR07kUAcfbYCn0+qM2na9QtiQx7JNL/yMlLe4bTivReT2+VKUrAQdYP9+KDnre4hugwZ7NPwF4v1whijBIR+ABegSay4MEqHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZWhwA2C0; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZWhwA2C0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdHoXh6RZDdMVPHJMzp9j8xp/aSNT9OYgb4I1bA+lAApSUriYss7m9iQKOxWUlYMUSU9d9rCNfA9a8xKn1phZndiIrvgOwuZQqaJJCWWlzoT8RwHI+4cajChI8qicQLP8Q9c97NjsMsH19Uc7NLaJm7eKw3FhBeedRpS1b9e+IKtGXkh2cepb2yoxsZhxJsCabeqZoU+IXOsdMkdN6Qle6qmOsUPZ8/zPbVuE+GXyePyedYf7nS8Eb5PA6UQzlVCcQo5Nsn17S7YfpE0ISvh6wv957Rz+DqBzNhy5+xO/W0zB7lsv6Rup+f25Oa4HwHVLUi8WD2JXO9x6XsfeuK15g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2HyzW93qVd0owj/KwEkY5V3fgXfuDkze39JsB7/rsw=;
 b=oLfa+K+v1XoFvakA163B3bJk4TL6ROIOKCRENXXMrEAWA2zgK+BBxVtBvoX227FAWD6mfrHeNi2VAbV/gi70LfdVsoUGW9Zo8/fzjUW65cpkNgVMfk94XycRv+K0PaTJZ8PFHrn1OliP+jZj3qXxOC0jZtT87e5rNTnfBWeNA4yt/PfU2YOwR4xGAhPd6S5oTSuWLcBP8s4vLeQ5LcnebKeh0LTay5zS1DQca4tJKyULxEtiRqG2xqNd64GC42jck50BiqvWn6OKO3p7cbxRRt1sXMF2kyX1/gs1pXKbaTvMNr2pKC2GJJL1kVfy7GRJPayt7ZZM4RTyYLV4fRSzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2HyzW93qVd0owj/KwEkY5V3fgXfuDkze39JsB7/rsw=;
 b=ZWhwA2C00nm8UK6oDRd352bbRq0g/IUn4OhzKxNYOM5cn3gf49erDVg2F1XjxEQSudQOgroajuQaCa3dwMW4i+0R1TxpdR/IbcrI/C538GjjrsxXVnJpsKvSyq3G6PGJ9xiTiV6VFTPH9VpoQrbDdIKf0/KNOBFaA/ub5cbBfqiFB/UvL+6kCmiNw0tc8s99WWGVpW5L6dIRQCHR8aosv+se1WGQw2DKCBt5SDc47TR6gubdCIdp4QSgUjVaGQDvsTz3iUOUfZCvCWXL3DVq1s6SDji6Ps4TWKCq6p/B0hkRn3hO7WIhxfJMNMMNb+6q7lIntEq6Pkbib3AJGnMCDg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9623.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 03:36:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 03:36:33 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Thread-Topic: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Thread-Index: AQHbbBYMTEhCMwRsZE6F/AUFe4j9YLMhWBiAgADM3nA=
Date: Wed, 22 Jan 2025 03:36:33 +0000
Message-ID:
 <PAXPR04MB8459845E7D949680044E203188E12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com>
 <20250121-imx-ocotp-v6-2-76dab40e13db@nxp.com> <8513553.T7Z3S40VBb@steina-w>
In-Reply-To: <8513553.T7Z3S40VBb@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS4PR04MB9623:EE_
x-ms-office365-filtering-correlation-id: 666509e8-92a5-4655-7454-08dd3a95f791
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NmqSBr2UDLetYQxoVxZEFxbQFDdZgTFiM2hF1+szJ+f4rZIbDMoGivayKM0D?=
 =?us-ascii?Q?uUgYK5R7ikFAnl9a3Po6DTi1i2whyTGpe23lXW/T6WWnWw5hmnjXyB+3q01W?=
 =?us-ascii?Q?Z/0yt9I8WOmd2ORaLJtrGSyiaC8gahfM3lUzikN0yeoK4Vy/CNsmb4EDVnTg?=
 =?us-ascii?Q?4DjLI7plZUWCqBvOheTx50fhZuLOj7/0C24Mf4igt32rj7TYs4ih0Imh5PL6?=
 =?us-ascii?Q?VrbYgz/Cmhjkbi4nIVh8s7HA3WskuPAgX5ImSr94Kf/clzBrBltFT/57Th5o?=
 =?us-ascii?Q?uHb0rdgrKlS5iP7U4xpCJF5KH8/q2ryd05aduIw6LTHOsxlJBr2pD+1xto05?=
 =?us-ascii?Q?HsGRaX75cr2+J6VLMR1scI8WgExaG4pdOx6ZRVxAs/AOLlXa0K8lbEQ0L2nR?=
 =?us-ascii?Q?swwgkSAU2vXarpumwWJMunrTS6XsVjfV7jnrn4A2di/V3uXkLaWz5XJkp8RS?=
 =?us-ascii?Q?AJGQouIv4EyHYibHBRVKYMjiqpqqcWA1RCA/xogmFczLgI4A3oz1U0JG+K7S?=
 =?us-ascii?Q?+IkqPr8r7gGufxshfjy4rPrAjVxAPYPXa80LrJLhjcU9e/R8dJVhj3xvUWfR?=
 =?us-ascii?Q?dHGlcqOah5HmfPaXnVxX6H6YhFkgmZKmjiR8W1KinCYpcTW1rkwEG3JxN03x?=
 =?us-ascii?Q?pM7smH6ixEaYNh9Z8gYNOTIGXFzJoU1hxQWBI+RvP+d9MdxXe9ndR4/lqo/X?=
 =?us-ascii?Q?LcwB82looG+MEr2hwbGJzsR/7zK0prtk2MIQItkz+G2SIa0MonyTBONr/58M?=
 =?us-ascii?Q?Xtx7myJ90366cFrBqlajKEQ2Y+ELbpsWlRcLhDZiwYjjCOOVlcTJWL8/FC2n?=
 =?us-ascii?Q?0hzcBskkLxT76waDXs1cWPysEff/v0tvxAKtoKgvqSF7AwgJZuxzIXnG1zA1?=
 =?us-ascii?Q?6yqnZLkR6BqNqcaikgXQusTctIVUIn1Xf099GWJqze7RkjcTC+fhJURBvVXH?=
 =?us-ascii?Q?Tr0k/V74c0lSs6Sk385V6xSf/6KYV1s4QmCxX3yfYzP1WlweIoAv8CWs3a6+?=
 =?us-ascii?Q?YGzrzsH9nlBfolOy6XNORK6JLKBJdfdQPRM2BANoRiw7ONpScDIAbcPrZsU/?=
 =?us-ascii?Q?lDj7pty/HoNkfzFsVo3X0W74UgKtoNdt1sZeXoP/LTv7c8wEWJFT7Nt2nuCU?=
 =?us-ascii?Q?t+DrhNB4iAa9rCVzOEYPau+wPTuhZr+5E5NG0yEHlXBPxfyLbiCUAmpXExbq?=
 =?us-ascii?Q?aO7mUKdnV19tkcnkJ/8vVD7NzH+i+cLRXnatnBBl+S5JkPC+jGGKADd2c9/Q?=
 =?us-ascii?Q?uNoHH+3Ore/HyT6Dq6OgpelxYb34T9UteoKnmJPwPJ6rnoI+MRO980oWVXOr?=
 =?us-ascii?Q?DzfXoI4IvkfIKZjvgovHPr79zEFZuTsZ8ZZnaaAKAB5zvlt/vV3g00CZgdwp?=
 =?us-ascii?Q?ZUvQ8pQPLhfRjUWgLokWwKAs/ku8OU3yRmr+g0uYdnVwaoFtSfKUAoGPERiy?=
 =?us-ascii?Q?jzjaXGnhqM73D1ebGUEHtfFzbGDOkM/pueirFRf+dU1m125nYX7/4g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ickgvskPlNte94jJR9J8bO5W/0ltUnEZsDJZmHKjTUnbFdhMA+//M6ZLCciX?=
 =?us-ascii?Q?Eb2z73esWzpMRnGgEDdoHYfBtYNe6QSjKMrH2WX0y2XC1x5kVi8ZT1rxguxc?=
 =?us-ascii?Q?zT8ceLjp0LCR8aUhAjfCuY6aK5LZQkD6o8t9HWheMKv6MbdP7hrCCnYz0qvy?=
 =?us-ascii?Q?kYhpT3HpBZdNJv2/HeU4idH465p9083/TRo23pKV5DWYwMIoabKaLFRntnZy?=
 =?us-ascii?Q?ISDpwIxu1ROS+iHi2rAtfNHBHtQMFQBr4ZEur1PdWIPnf4sOv5cFQxC2oFFH?=
 =?us-ascii?Q?MDreJ3uQfQfGVNUaoqQV7kkDWg1kmGF0SF8r4jMzn2g+nt9XdTBl8zqoke7M?=
 =?us-ascii?Q?+BHuMVUy4kQJ5bkGzgFBLF7lw9tz/RXnIqeYyXJeS+ROl4mwnvPFOBTy3SMy?=
 =?us-ascii?Q?ELVkuEgSnpNT1ZFi4n/tvhvGjysFgC+xQkj9R13G+6hqkPIbHSJDHklkyoI1?=
 =?us-ascii?Q?czoamORWQQfnLrHk0B69IUnihpixtAyCzACyv4W7I3W+5jlCP4vAb5bS5l3o?=
 =?us-ascii?Q?c9+eEuY4lOqmCmYP2Xwy6SJQk0Ia3ITfnXxX7AZsZReDuj+JN5IBBSsmIhYK?=
 =?us-ascii?Q?RBU054uW7f17HvYOaUk0q5CAURbDhdv2WUyFlDVXC11lLRI7WrSxONdm6EQA?=
 =?us-ascii?Q?RbZndEEGKQhXqjiUA1A8K8BpZBjnsSbukVnvjenbN2d1s6LQRC/X6I7LNuYf?=
 =?us-ascii?Q?VWdH8BfkEAuoouYpqJ5JoTTU9m0rU0zD7l7uEjx+pbylU7Ozagrxb4YxIiuR?=
 =?us-ascii?Q?PD0D7RO1oll/2kY+n7hxo86yQaESMX8xWB9l7zdNRYFxNvcfbREmoelw0xMK?=
 =?us-ascii?Q?2A199/5Wyr1XtXrpL29+rKd2YyvPGCkRZOe7OvVmDmYrJJSHI3zvqhf+I/Gz?=
 =?us-ascii?Q?v/8Tt+QFew1m0giD0AQENTiC7AxnOY3ighyCW1SA9Urnouvxc+Xnn+IwXSfh?=
 =?us-ascii?Q?Vq5G6wZkdj9znakafetnYFC4MFVVYL1PK3FG1DGCmqylfmjxGujhdtwu6TFW?=
 =?us-ascii?Q?r4uMNrVzC7FyEAJpAYdQck7ngGlihD6jmyTiDl28tbrw0v0pw6ufXdev+EEC?=
 =?us-ascii?Q?skFYEgtkZY+xDjJzryB6iS4mFm2FG/JSjxDzlT83UxdpH8j8sZ0okeJYZduT?=
 =?us-ascii?Q?qKlpLvTmHpnz+yl5bNc0emsth6yzmptR+jfOLuFsdGzcXxchkyyveCqpliKO?=
 =?us-ascii?Q?ROujhdp+oHd0LvNb20sleHZJTSKsZQc+LcP6xBj5KWiF1ZyuRxkYs0TOGerD?=
 =?us-ascii?Q?00NMUf0sCMpJnGwH2iL1j8Vm76pGEnWFfx9pA6M7NARcQx+I1s1UavCvxSkB?=
 =?us-ascii?Q?nGdBoNfhgfBXoYChWEsFRoZfd7sNHyLYehflIDzGeYsfi+zzuaRBcFHOCCDQ?=
 =?us-ascii?Q?plMQ6vCtJQQYUbpgX+XJ3uL+payfnqPy1/YKkxVFj3IV60B3Viv++wn6OAdq?=
 =?us-ascii?Q?qUYx+2/kd5osyfYH9eTVApKYs6CWWGwKznx7WOwSuWbL4h7VLd2+CGtmWeMw?=
 =?us-ascii?Q?FCeHli5e1Ob5SzQ+qv7FEHN86pMgO0EGcUvJ/2tcPJlgBAj9wT4MfBhzNwdF?=
 =?us-ascii?Q?vpVnfOqGo9D7uRHv2vM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666509e8-92a5-4655-7454-08dd3a95f791
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 03:36:33.4359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQpviHzpRSHKN9808Usv/BSxBHg5gaNPi7zCgAHyi+o4XmpmwJ2N7FPzNinSNI6+v3Z4QLeLTctzY6Llv7kWQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9623

> Subject: Re: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support accessing
> controller for i.MX9
>=20
> Hi,
>=20
> Am Dienstag, 21. Januar 2025, 16:05:32 CET schrieb Peng Fan (OSS):
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > i.MX9 OCOTP supports a specific peripheral or function being fused
> > which means disabled, so
> >  - Introduce ocotp_access_gates to be container of efuse gate info
> >  - Iterate all nodes to check accessing permission. If not
> >    allowed to be accessed, detach the node
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/nvmem/Kconfig         |   3 +
> >  drivers/nvmem/imx-ocotp-ele.c | 172
> > +++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 174 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig index
> >
> 8671b7c974b933e147154bb40b5d41b5730518d2..77cc496fd5e0e1af
> d753534b56fe
> > 1f5ef3e3ec55 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -93,6 +93,9 @@ config NVMEM_IMX_OCOTP_ELE
> >  	  This is a driver for the On-Chip OTP Controller (OCOTP)
> >  	  available on i.MX SoCs which has ELE.
> >
> > +	  If built as modules, any other driver relying on this working
> > +	  as access controller also needs to be a module as well.
> > +
> >  config NVMEM_IMX_OCOTP_SCU
> >  	tristate "i.MX8 SCU On-Chip OTP Controller support"
> >  	depends on IMX_SCU
> > diff --git a/drivers/nvmem/imx-ocotp-ele.c
> > b/drivers/nvmem/imx-ocotp-ele.c index
> >
> ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..5ea6d959ce38760ee
> ed44a989992
> > fb35c462c0b4 100644
> > --- a/drivers/nvmem/imx-ocotp-ele.c
> > +++ b/drivers/nvmem/imx-ocotp-ele.c
> > @@ -5,6 +5,8 @@
> >   * Copyright 2023 NXP
> >   */
> >
> > +#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
> > +#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
> >  #include <linux/device.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > @@ -27,6 +29,7 @@ struct ocotp_map_entry {  };
> >
> >  struct ocotp_devtype_data {
> > +	const struct ocotp_access_gates *access_gates;
> >  	u32 reg_off;
> >  	char *name;
> >  	u32 size;
> > @@ -36,6 +39,20 @@ struct ocotp_devtype_data {
> >  	struct ocotp_map_entry entry[];
> >  };
> >
> > +#define OCOTP_MAX_NUM_GATE_WORDS 4
> > +
> > +struct access_gate {
> > +	u32 word;
> > +	u32 mask;
> > +};
> > +
> > +struct ocotp_access_gates {
> > +	u32 num_words;
> > +	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
> > +	u32 num_gates;
> > +	struct access_gate *gates;
> > +};
> > +
> >  struct imx_ocotp_priv {
> >  	struct device *dev;
> >  	void __iomem *base;
> > @@ -131,6 +148,82 @@ static void
> imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
> >  	cell->read_post_process =3D imx_ocotp_cell_pp;  }
> >
> > +static int imx_ele_ocotp_check_access(struct imx_ocotp_priv *priv,
> > +u32 id) {
> > +	const struct ocotp_access_gates *access_gates =3D priv->data-
> >access_gates;
> > +	void __iomem *reg =3D priv->base + priv->data->reg_off;
> > +	u32 word, mask, val;
> > +
> > +	if (id >=3D access_gates->num_gates) {
> > +		dev_err(priv->config.dev, "Index %d too large\n", id);
> > +		return -EACCES;
> > +	}
> > +
> > +	word =3D access_gates->gates[id].word;
> > +	mask =3D access_gates->gates[id].mask;
> > +
> > +	reg =3D priv->base + priv->data->reg_off + (word << 2);
> > +	val =3D readl(reg);
> > +
> > +	dev_dbg(priv->config.dev, "id:%d word:%d mask:0x%08x\n",
> id, word, mask);
> > +	/* true means not allow access */
> > +	if (val & mask)
> > +		return -EACCES;
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx_ele_ocotp_grant_access(struct imx_ocotp_priv *priv,
> > +struct device_node *parent) {
> > +	struct device *dev =3D priv->config.dev;
> > +
> > +	for_each_available_child_of_node_scoped(parent, child) {
> > +		struct of_phandle_args args;
> > +		u32 id, idx =3D 0;
> > +
> > +		while (!of_parse_phandle_with_args(child, "access-
> controllers",
> > +						   "#access-
> controller-cells",
> > +						   idx++, &args)) {
> > +			of_node_put(args.np);
> > +			if (args.np !=3D dev->of_node)
> > +				continue;
> > +
> > +			/* Only support one cell */
> > +			if (args.args_count !=3D 1) {
> > +				dev_err(dev, "wrong args count\n");
> > +				continue;
> > +			}
> > +
> > +			id =3D args.args[0];
> > +
> > +			dev_dbg(dev, "Checking node: %pOF
> gate: %d\n", child, id);
> > +
> > +			if (imx_ele_ocotp_check_access(priv, id)) {
> > +				of_detach_node(child);
> > +				dev_info(dev, "%pOF: Not granted,
> device driver will not be probed\n",
> > +					 child);
> > +			}
> > +		}
> > +
> > +		imx_ele_ocotp_grant_access(priv, child);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx_ele_ocotp_access_control(struct imx_ocotp_priv *priv)
> > +{
> > +	struct device_node *root __free(device_node) =3D
> > +of_find_node_by_path("/");
> > +
> > +	if (!priv->data->access_gates)
> > +		return 0;
> > +
> > +	/* This should never happen */
> > +	WARN_ON(!root);
>=20
> Even if you warning something is wrong, aka root =3D=3D NULL, you are sti=
ll
> using it on imx_ele_ocotp_grant_access(). Just return early.
>=20
> if (WARN_ON(!))
> 	return -EINVAL;

Hmm, If this really happens, return early or not does not make much sense.
Does it really matter here?

Regards,
Peng.
>=20
> Best regards
> Alexander
>=20
> > +
> > +	return imx_ele_ocotp_grant_access(priv, root); }
> > +
> >  static int imx_ele_ocotp_probe(struct platform_device *pdev)  {
> >  	struct device *dev =3D &pdev->dev;
> > @@ -161,14 +254,45 @@ static int imx_ele_ocotp_probe(struct
> platform_device *pdev)
> >  	priv->config.fixup_dt_cell_info =3D imx_ocotp_fixup_dt_cell_info;
> >  	mutex_init(&priv->lock);
> >
> > +	platform_set_drvdata(pdev, priv);
> > +
> >  	nvmem =3D devm_nvmem_register(dev, &priv->config);
> >  	if (IS_ERR(nvmem))
> >  		return PTR_ERR(nvmem);
> >
> > -	return 0;
> > +
> > +	return imx_ele_ocotp_access_control(priv);
> >  }
>=20
>=20
>=20
> --
>=20

