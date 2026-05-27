Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013067.outbound.protection.outlook.com [52.101.72.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A51DED5C
	for <imx@lists.linux.dev>; Wed, 27 May 2026 03:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779851164; cv=fail; b=Awr/8JGDuVtlvgsh5zPN9E5dCeW2TNOzdJjTtYSmq//xAzAIUR+JuuBDgKQM1dx/+joJRf1lAEoZoPvLZZJGlzqqcxw/ivzQwm2C0Yh1XkPtcy+70D6sPlcgRf5A3y2mpP8a20VrNRiWBZdUz9qD2NHtrOqHhNfQ3ggVPacEwg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779851164; c=relaxed/simple;
	bh=twTp8mz48Uxx3goXeyI2OzuaWEeJTzhX3d2fo3PeDrE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q2JOCHelIb2Jcvx2JSlZBOGzk6Lf6/E9Du+rEqZ+Y1hhZDp8tV1txkCyV++1MXLvEPfen94/O/RbBFHBPiKCb7iynxeuNEkcCdd66MVan36r4AkVks9fhPY7FXzKlp6ocXGXddIFCpgMgPA0zoaTCErzHDQQVe2m9Z/QHoy3Mq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YhGgbln5; arc=fail smtp.client-ip=52.101.72.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YhGgbln5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAwqyrfGrWlN+M75CgCs6t7wgbnPrU2FToB+b463P+t1J2vgtzltJW8pJrhDi8B/Bw07JbVd9QwZWAf2c7JNd1GGBQHAGm5edHFoQjCycOnFAmD7ZbHfxjYDNWa92TTx9SJ4IHEQX/f+e+vQAv+fSI0KBB2RwQabBSyBiAtTzFcNkPaa2h58gpGH+210xc23uh6N9O49kA91GhLU+hXYlI74qHa9DmV4pwL6dFGrgsubKdSyTfskI0Lo++BF2Qp9yZhps6iZyNSmzpWS5ZwTPQxLUDMCAEJCWq2UIrwV2QM1Fewu73dufS6kgaQa1WtyBJk5Gb/6UmussdVmPaLTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KAQKfmYirOUkMbgGlTBsUvj8dZOY7DKmL1yCxCP4w4=;
 b=wfyEVkGCip6ZAPwLIaX2vOMNckqlcLhu+nOAc5M6gS5c9CvfpdBHHlALP0x+3+p3b4OoxGcuDkYBLOxsBU4QSy4lsKbH/B+vbD4QW7jPfyAuE2cptb8DVo65oRIXVW2Kf3LJ/Aya0smPrf5nbXrENaUQnRk73iK54OjKonTgX88Oik4aS1ffssvGp7cd0j4xGqTpi1Cj4/xBvyTAhGvEGwRVhBRCmxQEO5Ar74JUMi81fM87HPrd7F3kCpO1zeS3uTv4eyIXIy9LuLDKedXn9yua87k6N6bLn5GemKkwtksyxgdPpVnzxGherljzFnOkFVNJiAtmsXBkQ/+1tKsanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KAQKfmYirOUkMbgGlTBsUvj8dZOY7DKmL1yCxCP4w4=;
 b=YhGgbln5t9eEckGojnTua9QW0LvQKKehL64kpo2JMsfKN38QjlcEjX9LatJ+d0Q0DQuVm4aV9ZR/G18aRXtYGUjJ8coO1AynmL7KXLbPqp2qaYvqlp1g8ynCEk4yVfjTpZyNJtqvXSyOyNjNrz/IxOA+lkdFgOds0qJjZn++twkQ0U1wvbu8YEZKtRs8X+5X5PNnbdbriFkhpLjYo5izNMz+23+CiBjrBSVahaoTzbUlV+t6vAZk3VC2kkxpgJ8ogZkQ1GgFTcqFidtCAdmg0e3MCkO0pC9qV4TR0TgfIezhgSsZQwDbRvR+lOZv4oZCdglYfBVCPS5Bgz3LX/0RUA==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by GV4PR04MB11852.eurprd04.prod.outlook.com (2603:10a6:150:2dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 03:05:55 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Wed, 27 May 2026
 03:05:55 +0000
From: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shengjiu.wang@gmail.com"
	<shengjiu.wang@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "nicoleotsuka@gmail.com"
	<nicoleotsuka@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] ASoC: imx-rpmsg: Support headphone jack detection
Thread-Topic: [PATCH 2/3] ASoC: imx-rpmsg: Support headphone jack detection
Thread-Index: AQHc7YW7vkRZytRz9EmpAo9PYZX0Fg==
Date: Wed, 27 May 2026 03:05:55 +0000
Message-ID:
 <AM9PR04MB8353D5EDBA1BF2AE5931546DE3082@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
 <20260526053815.140008-3-chancel.liu@nxp.com>
 <1f4d888d-7c1d-4ea9-9357-e8424bf9ba40@sirena.org.uk>
In-Reply-To: <1f4d888d-7c1d-4ea9-9357-e8424bf9ba40@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|GV4PR04MB11852:EE_
x-ms-office365-filtering-correlation-id: a41a2700-607b-49cc-5863-08debb9cde5c
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|11063799006|38070700021|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 d8xmLLqgEUsgsLrwRta4oG7FNjNIGsoxwCuIUqgFDLvs+GDLMpJIhDRlxPwlxxy7KQg6Y0hQWhuVPRaKXN3ByqDsPIyXQCP1KOR4LYwa+GX1/fakJXTUvk3MX7JLuaGQjVbEJXTXgHkNLEYGOMCLnx9pDfwMrAgNfMEn8yE0tSwIFaCh/szkTaUMAprDslUlr1OT6O5oyXRtApZPwrjZjpTBRcu89W7QzugpoQC0C/Vvtnb+/PONlfRxaGyidxO22iddz+m9KrIv8ZtlY0V6Ndz3J7pWlrtv8/ORMxuKjbMhePBnxOJRpPDaOeYkKLlNv9RaN2+XMHplurKQVZQ8N/DqJxZQK7PQN/rTyWUIPyF3EhUHmbjSqqI1vOSNcqa1+sySj/qH5KzU1V/2371UlPOKO6mnmIXytuk+ADQ9RXkKoXma1ejhGqDnmynHGdYOT/fAvhx2FosVYAFIIv60B1gyLQtsOp6DW9xo6axGJCYDP2OSB+Zjqmcs9Nd/qO9cXg8psqBtkeA0Im89oc4h+8sWGFZVqlxuy7FyJhZjoywuV7MYdKm/ngr1nKaKdh3xmvsJDCQExc+vKpHCTa49oS6sf1XTzL7Dw09vk+bfn3PHx+X10BbcfIvMctbykRNiZc1FcSxBSDSfYUHt8160RkyAobsnOhxclWkf1lTz0XUzFj/+yXXt7/hX3uYMy7wlsADB4eHD6xtzb9xrYNqVwkhx8WRblymGnqdkrq3cMG4hmmwdwpik7GQ5QMZ34gm5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(11063799006)(38070700021)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MaOLrIr0TXl6ByYrkrr+CjRB2bUEf2gWenoea1yhNTw8uNd6GkuvX9oCXumS?=
 =?us-ascii?Q?7UG9tpO4sboqMLUZNTKf3YRCvnNWvqh0TsCo3yBqGsgouG6a+HaBaeilFx0I?=
 =?us-ascii?Q?PP/99GCUtJKHH57una8DZ3PniuW83H8rOIL+tLinS1kusJHGwIFFEYhrGagR?=
 =?us-ascii?Q?mjuZyN4vDb3NzGD/n6jTgEI6ibVWKFvoSC8HpGkWzxxW6cSG94+5L1/+lNbm?=
 =?us-ascii?Q?q5uUL390tny6YdvsZqxgszO63PDoavE/9y7+Ci8LcSRSAS73fQXgTmNSj9C3?=
 =?us-ascii?Q?3+xP9fcyP9yR72NsZSguGxHPqPsSVYTCC6Es+Y1hOgTplgox3ZldXVfTw6r4?=
 =?us-ascii?Q?aSA+HWnS636qpXn1ZInMPmdrVTn1ikNFZh+rXIS1YJpUSVYLaBWvyGHiw+p6?=
 =?us-ascii?Q?DTfs5AqmpHrsT7/uoBJ0Ys0Q6z0QqgOz/qrVCra8Qiv7b4SVFqtoFdDQGGe1?=
 =?us-ascii?Q?e+hzl1fnOnT9r5Fhfz7QdKjj+929nlCAFzeOJmpa8+uMaH8A9CSuH+OFiQCX?=
 =?us-ascii?Q?xJB+KLBorNNs0z0DbOvINzbdRmQOtw3rOcXMOcwNXi0r2dLjLR8ZpdpC/mrb?=
 =?us-ascii?Q?0SmUTMyFryWSe6AVIPrCRTY02k9IL+W/uObSZhHaf9m/MKGuDGZYIIcbs8vS?=
 =?us-ascii?Q?LwAbKZj6ZO6fB5PjeOSUWKk+gJt6Y3c//xI+EAMTzJkavEwTtcz2ihngFKAm?=
 =?us-ascii?Q?w+pT1uKZ9d45EdQMnZFS+m4l3tDfrasFQ9bL1bs8dIV9fiHzLzwC7z4kRIN4?=
 =?us-ascii?Q?9TYvSGnQHT2KEaiAGxSiNg1VxTHdkv79JXahLqMnyDWM8p8yWBqS2Chnogio?=
 =?us-ascii?Q?Zhu/cqZwpqPSCp9GImKjSoqHkw6oiH6gyJ3M+9+PF1TYy9UT517xvmWwSryF?=
 =?us-ascii?Q?g3IAmvks5jmK2Zbq0F/q1VccPfkM3n/xVBcmtMnIFk7t154l9qXFkzv5tRIl?=
 =?us-ascii?Q?fLVE9+hGn1pr1ZaVQWYmesGFntfSWXH4OdwT39f2+uv/Q0d24GQxC6ddUWkk?=
 =?us-ascii?Q?uAvaiTzh5+TYbIte6dwOak+nw10BdtUquIGL0D0BhimoI7LfbMLAsdpkHdJQ?=
 =?us-ascii?Q?tZflBY38Q04WGImGg2vQ3hx9uT9GqodCQrTs4HodIYUp/GvVUULVOt/WBRJc?=
 =?us-ascii?Q?CXdA39G7O2SLy5Fcbd77ZTPwKq9XfdxV1G1gDwYrk+wzZW3GEbqcdhqRAKOa?=
 =?us-ascii?Q?6314WXjqnzqNg2kerD3fkUttgDfRD/qmFvytkcbs4JdPros0Mmdyiw0SDPmp?=
 =?us-ascii?Q?8HrcuBwwr8BuZlkKJPBK8TqRlR/ORGllP1z/IKJ2J8pOxAjpAzGIHI1E513W?=
 =?us-ascii?Q?8E9fE5CnOpoKaSjnNjz1PG6snroFLWZEsRSRr/QtnEDmG6wFMyOCqj26woVS?=
 =?us-ascii?Q?8RbQ8m2e5RRZysPJnKUvfs5N3FV1K+KWwxEpB6bRr1Xv2yHyat9GR5LE9m31?=
 =?us-ascii?Q?KQ82HhyN4eror14Som4xIgLGCoFgGC5tnLvWu1jXlPJkDP9SyFTsljAyVYVx?=
 =?us-ascii?Q?Su91Qr/HyD1Gn0a1dczd9EgUKhRisGA1+1TKF0ZlfxRXTXDPUlVvyGesyOIG?=
 =?us-ascii?Q?3RBJrguizkxR3GSVZHXLk9VyBxWxMOkddMlZPPB5tHPAXdBFH2K6gW0LPtx3?=
 =?us-ascii?Q?Vwb01kNFNJSnLdFu8LmoebygEzY7J4Q8MOZdL7CQ3wlWqCIH6Ep4WeIvAUwO?=
 =?us-ascii?Q?danuCrroB9IIMI49WZu3kGABmw5IlXdVLS5vJRLZU3DXJ34N1IP2iaYS9EUD?=
 =?us-ascii?Q?QKABfiU9aQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41a2700-607b-49cc-5863-08debb9cde5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 03:05:55.3051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyZNJhDU6B8xYJNwcW3aQLC/fp3NCVwgQ0cIoEkcMfPx5s96SUQvxpbaVz6MYe2eWIhzKmAJ2628IAqkBZ09RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11852

> > Add headphone jack detection support for i.MX RPMSG audio cards.
> > When the "hp-det-gpios" property is present in the device tree node,
> > use simple_util_init_jack() from the ASoC simple card utilities to
> > register a headphone jack with GPIO-based insertion detection.
>=20
> > +#include <sound/simple_card_utils.h>
>=20
> We need to ensure that SND_SIMPLE_CARD_UTILS is selected.
>=20

Yes. I will update the Kconfig to ensure this dependency.

> > +	if (of_property_present(np, "hp-det-gpios")) {
> > +		ret =3D simple_util_init_jack(&data->card, &data->hp_jack,
> > +					    1, NULL, "Headphone Jack");
> > +		if (ret)
> > +			goto fail;
> > +	}
> >  fail:
>=20
> The interaction with deferred probe is a bit fun here, we're doing this
> after registering the card which might defer via unbind_card_list now.
> late_probe() might be safer, everything should be mostly up by then.

Agreed. Deferred probe was not considered here. I will move jack setup to
late_probe().

Regards,=20
Chancel Liu
