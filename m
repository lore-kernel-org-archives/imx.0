Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F92326ED4A
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 05:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763357920; cv=fail; b=l9Nlb4IXxte489C54Fs2FsUeL+IY3KSflaezY76N9M+Zl6ZT2wvJyFuTGIZ1jSGAOJ7fiZSW+DNh8GsCL6U8jyfBxjDVgTC5lmg9LeUOoHiuZZTicr33QYgXGezwXlRg+ZRiHKDELWZqEQBrY+pB92vaa3bxzLgjs4RZjT+BPSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763357920; c=relaxed/simple;
	bh=8rzlokGS8nbkuz3hGWrDgoc3BfvqInK9FdGJlzj7lNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hNXVfW30Whg5W25GRpbD5J3t5x+J36T4zEjs7NwtrFppl4MeGYh+WcIXRF0A07OiLFOW4lbMByIol4KfzZmm7qix8in5YDHkBEYWtrqvNsRXBnPIc4NnmwlAcypst0AAXIu3CkakGsrMD7IfEI6732MV06FW+bCjGEQUF+6DILY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OGOcmorD; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OGOcmorD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9yXAQkuAygcxMzgGEnh3V/eMYb6FOuGId29MhljpjzflfAF6AMxPMPtsvjg2QXQ6pdhGAuJLOac7CjLgaPyvD8/N+rqrNZBpZfnGYo5ZC2zznQ7zSpFRhN+vVJa9jU/77JMqYqJlcLzEp+Vt7BCp9o9rszPMv5l+F+YFNccYxIpgM6uMg5GnLYN65XFcuPcmNXWCYBZBdQko8jIti/3hEyC6HwSuVyyoKsHhv8sRfe8Bbh0gURELItlv63YhXujzidPugBLQ0iBK7ONb+vNpqX5UEmpnXkRYaw39KTGKq59xgnyiarpkfQOjKZnjNH2c7Q8BO+l4jfs7u7hLubgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9et8WNlfurwtfjeRAZZ80X96xjkfIHgD0oXVKNyG7U=;
 b=E5NtpLrEryzLezhJIgRdffFAl+BMOcQKGdfOVz1LinJGGTC+TrlnW2NQ+jGfBhwO+ZIP7Ps5z6rjgz9FTP/eePjP+FBHJF7CtwE/BLVmAdA2zD9zVa+c9zws+SdQ6w2qRO9LfBj1PvG5RdVA26mi/NwCYLtcdjPWd6X9fwarARIoqraLiBJyD9TmgJpQJhPgpy1weEh1qU8y1C/KS7fi5Em4xTorTeGw392JWYNwhJmOhUHcbAHXSErr0cAlLg19IU+WMqvBYC8M3OqyJVISfPAS+m3JVIxK8LBl8gU9HjvHxwIcutAcCjSzEPLTVqcs1bACl+oK2pZVzHMFfVcvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9et8WNlfurwtfjeRAZZ80X96xjkfIHgD0oXVKNyG7U=;
 b=OGOcmorDeoVmoFWZikSus7RIAS7kNTW9HQvtk/lhHr51dI2O0wOaAdWe1VDcPB6C1huaMVc+64j1i84xm+AqYlrH6ZAw4LIYSVhnW45+GOIO33bxrz6k/yBG+dbsXf178RwoJm1wdUq9UK9nQuDN16HNhAewmWKK4cJeLwlwMigZkCv2bhsEu/tG/BsC0PNHRsxFvED3rfKGQVPpzz7d65PUcHFwlYq7kBFmlOWNvOHabL1em05aVUya/8bn8fCLl75MuJZ2cmbKJNddIusK9ENH6Hv8f3dp+Yq+bnPA4q1GF5QEhXdNv4c2xN7PaEmPpfqvVHZtJ3FqykqskVYqhg==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DU2PR04MB8581.eurprd04.prod.outlook.com (2603:10a6:10:2d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 05:38:33 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 05:38:33 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
CC: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, Frank Li <frank.li@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v19 0/7] firmware: imx: driver for NXP
 secure-enclave
Thread-Topic: [EXT] Re: [PATCH v19 0/7] firmware: imx: driver for NXP
 secure-enclave
Thread-Index:
 AQHcLvztIykpoCx+vU2TOsTcO77HnbTExb+AgBDxjcGAC9UegIAFbnEAgAbBcwCAAR8p0IAAkf6AgAKJhEA=
Date: Mon, 17 Nov 2025 05:38:32 +0000
Message-ID:
 <AM9PR04MB86044BD66836899EB1C64D8A95C9A@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250927-imx-se-if-v19-0-d1e7e960c118@nxp.com>
 <20251016114151.jzmapaecsmmnkpt3@pengutronix.de>
 <AM9PR04MB8604C2AAA70406883320C5C995FCA@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20251103190811.wp4o7hlnus6ynn32@pengutronix.de>
 <AM9PR04MB8604AA80EC97E06AADBF334695C3A@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20251111131442.nddhk3475oapf2zh@pengutronix.de>
 <AM9PR04MB86047231B5320C01759BFCAE95CCA@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20251112150501.qkjclsoq2bg75ed5@pengutronix.de>
In-Reply-To: <20251112150501.qkjclsoq2bg75ed5@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|DU2PR04MB8581:EE_
x-ms-office365-filtering-correlation-id: ab9287e0-afa6-46fc-7121-08de259b8be3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7XkDVLFFIpECAnbG38ugJCZntr4kom4OSE4Tg1k3GgRtEvHQXnY2WfnVR/NN?=
 =?us-ascii?Q?HjalJZudusw1/8tOjjuW5sF4FMRfskcc+pL9jvckBfmysRs0Y7BS92LqZp3d?=
 =?us-ascii?Q?+RvyHB1jkJPCNXxR207wEnOEj+Wc0p01EeG3GFiSarHePz5Q0Xd4mXEBn4+/?=
 =?us-ascii?Q?9JRCsKWjz5LmE+mpuo8+WLsiX74BJBdsBtjTQ/Dg+FoL0V/wWjfJNqIOi6Ta?=
 =?us-ascii?Q?TMX/CYgSOj358bMjUVWpfHXusw8QXUx/ZEi9tgb12zcrBvqIg2DG45yYBe6j?=
 =?us-ascii?Q?ZAZMqSSWwtaj2a8q1U+zA7ksjMX+I6Cemnfcvz4nM3hLY/T2L63+8rlpZNmp?=
 =?us-ascii?Q?Zp5jJOlPuROs6koUStwBaZIIbcazH0hO4MSilU8w2E5Ah03TqXYkfdnp1lf6?=
 =?us-ascii?Q?9zLbTXHAuxHFnj70VlEXBZNU1E1JDrQIcrAIRlLrOV1eecZPNXhP3hXwtFu0?=
 =?us-ascii?Q?aIIM6xMAmIs5FLq9p7F+vUIUdhC1f+XCRm+T0e7KU/bgsUmRUofOGYJ73OcX?=
 =?us-ascii?Q?Smy7E80nzCjTl1s1aMvQ3QNi397i9Qwz0QrjipBgK27HOSiHF9PisN0HS7+D?=
 =?us-ascii?Q?lrutty4fftTDnLALstW8DqZGFbJa6qxrJ98fXHpUuICdoR763zPREKn6uB3c?=
 =?us-ascii?Q?vdFOzHSwU3+UCf9kS1gU8jKZFzE4+iWCJzPVqRX88cjUrgjoBms3CM/8OJyl?=
 =?us-ascii?Q?Hx9m4Phe4NCouX/czxs+f3VzSBZnd4rV5Clo3c4t0HUpHtLNwrK3s3M12j3d?=
 =?us-ascii?Q?kPnk9wl1XcLknUdiKUHqcZXKiADat6MMd+h+ygiUvYvHOWFZeVWV9yfKWOVo?=
 =?us-ascii?Q?IHqPQJBFmulBV5nb4OCAsNas64Oj6kADGCzvEHXGZvNuPzHExFWoqJ7JnN2Q?=
 =?us-ascii?Q?e3ezXgzTbQuE7/9gzQMEZQwOA4m1KG01ZBCUmuBqIdcXlunpA8Q6BH/0M6uq?=
 =?us-ascii?Q?hZs/owNzC7m4iA6eJEMGAo8bvvNDyJ1+OjbuWJ+OwHZUiMs4w9W6F0cgJL2z?=
 =?us-ascii?Q?HjHlZCWILL5taUuv8VjAoPkJhsYavtqM4pVMOtibv9u1sBYq57w1jctauH1F?=
 =?us-ascii?Q?w5EEAkQ545zalSDmxj/8dat6iryv9bnyFjlkG5inu2kb5DuygMF9VNtrB60L?=
 =?us-ascii?Q?YUH17dvit/3OCm40z4k/r3DhDnbXaFsnGs2AY0A4dqu8KFNM32+0alaBwjF2?=
 =?us-ascii?Q?Qrg/TQx8XHTspqgb75AnhOv+Cv84PbNPZqT87YkdV5PoGR7p6mbDrJVFaawj?=
 =?us-ascii?Q?C/Cn0PWlpnJDXxNRPGdQpiOJT30oZ9V4SVhT/UF6GMGBFmFZ/Tlc4/XLKkxA?=
 =?us-ascii?Q?zWinlHK0+EWID7p1XYTr6obDhN2hoQevIcN02eUkDzkcGsGlRPn/ueLmNtqN?=
 =?us-ascii?Q?qEqVuCV/wY4MeiOPgPcUlMjjyGgK7jax06XibXaHvl08P0NCWbPOJLTNwJs2?=
 =?us-ascii?Q?gtb5XhFvTQRS7Kz9zxwJm4hOaJewj5uekfoU2qeEqO/wDO2PvLCjPw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fsMjJ3j926RSPxSTpZSwJRQk/UsvtoN2qfxXZCbE4ujs4xCifra5oh0R46NG?=
 =?us-ascii?Q?/ceq1mP0V/AyeCqtPV/BY3wVofYSvBOGKgQf6c+kqJRb5adQaUGdh0HNV0ej?=
 =?us-ascii?Q?oc0K2sfYi7NEkPJyTx5sN6QcAT5++bRt5bowwDZE3hv8/m3i4lf0Z5z0sM0m?=
 =?us-ascii?Q?1oeZh4CdOUWK6pEvpqh8T7zDJ031s8HabxeeNye3WqafXOXt+TR3oTrvSvda?=
 =?us-ascii?Q?4kjEeduo6XpP8TC2WcfqR7LTBFHOhCmqbtEhchU2CkBkIlJ7o3Wyw/hLyCVQ?=
 =?us-ascii?Q?DB9++TnGIWiuGZhdyHxp8qlOMFHilmVUpckgLdfSEu7qA9m8abOEg9ppcJOs?=
 =?us-ascii?Q?U5t+amqBewnC850dx5CmJBKK9V6pWkLQcus323/tLg06GcSW8GV0MwVOrMi2?=
 =?us-ascii?Q?zJrTe7nWBLVeK3lX6GoXBaFVCFPtsFe2eqJjgqxFZi2DBcgQD7msErEF4MNn?=
 =?us-ascii?Q?cXg69QKJWAqeYjsUepzDQuSwcRZABecYImZoK2PzR+rYApHkfEFiFKGhPgjo?=
 =?us-ascii?Q?M3FHSNbD4mLxDYcArmYBBcW918yZUTg8mhRA9uf4Xo5DtKvJLxydkSfF7UeV?=
 =?us-ascii?Q?+ZEshFqiwgy6T02LrXgd4N5g1H9BH8H+EzPOkFpzX3eERotyDWz4+yARXYW1?=
 =?us-ascii?Q?+trbFlAbL07r45Mts/LGAYEUKGirg19kqApT8NX1uvjdyBhzuZTiVXmNtowb?=
 =?us-ascii?Q?B4xm1QLTTsPBgeEk5zJLaluoWkt9nrR355m+KEpj9ppurKedYNYNLoyJFC/Q?=
 =?us-ascii?Q?d4tZ2OqAlEfhIbLkLsHniclYjCE4C18LoNYgan8t5wz3J19M65ST6J8f1MUG?=
 =?us-ascii?Q?NYuWRjNahVwM5v8xjAyXiwGPgwM/5LKla+ccbfDSiIJVpUuNKFgqk4tL/xp4?=
 =?us-ascii?Q?XcMy257R1ZWGhvyAJGLWt1doPj1wClxOT0FRAKMrf11xfNBckt69oUNXKQPS?=
 =?us-ascii?Q?kR6M9q5nOFm62jpzrPGBEBuTSujZOlel+kBDAJNLoIFX4+ZrBHQii3XawE/T?=
 =?us-ascii?Q?wvPywggbMHM8xmnDCTS6jaVWdEzGpLSATgUrlXMtMaDdr9OL38/MbzbbunSe?=
 =?us-ascii?Q?mmM4psod373nqspKqIEEIJ2CwttL/yKDXQH5JvNUyhGRvhlKCcmFCJO/CdvE?=
 =?us-ascii?Q?FeIgUK4d95Yp8gg2IO/LrrnxVu0kc5E+ypwSHopUDrWPP7OSnyXVw3Vsqx8A?=
 =?us-ascii?Q?UlWV792ZENjiHRstKepyRFyV/TH4ceOXRnMzzqBC9v2PASyFohVu7e0Fjkzr?=
 =?us-ascii?Q?gUDZcxWygzMSdmcumN8RTsCuVX+iEGAW4L2jOyDV3/Xex7E5QqzwEn4CLURc?=
 =?us-ascii?Q?ZTy5t/LbbomzoOz9iuJTyVJ4SQX4ymdAhj8BmWGKwOFC1bG9zl9KRkQMhn1G?=
 =?us-ascii?Q?kAsHct1LHDve0ksQrTRT2uAGqTO8weJSvZlwvA5NIUo65qTV0hBiNj+bDfnN?=
 =?us-ascii?Q?OH6TTRMBO/P0cwbdURkzVTkdyj6dEk955++4yfj2Iwv60eqIlXPWRBmGBjs9?=
 =?us-ascii?Q?OhKWBVtrxYT5V4HuhyuIfi8Qgoc5b4ZEGBN8t2QfWI6sRnuyhCr9Wdknimf3?=
 =?us-ascii?Q?oeNydZIkqkCcVyu9N+RkAc4g0yUhecya29nQK8H+?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9287e0-afa6-46fc-7121-08de259b8be3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 05:38:32.9795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdZ8pypVD4lliZ4QinUUr1XDpEfg13ZuABXoq+HGlnR1oFD7T58OFIz3JIxRM+zvm/2frcNU8TvyWmgxCg+3EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8581

> > > > Voltage regulation for i.MX93 in Linux kernel, is done by ELE.
> > > >
> > > > During Linux suspend-resume, Secure-enclave (V2X on i.MX95) part=20
> > > > of wake-up domain, will be managed by secure-enclaves(ELE) part=20
> > > > of always-on domain.
> > >
> > > So to sum-up, please correct me if I got it wrong:
> > >
> > >  - NXP puts the ELE into the non-secure world, in case only one MU
> > >    exists. The reason for this is that the ELE is also used to handle
> > >    power-management.
> >
> > For NXP SoCs with multi-MU(s) too, NXP proposes to put ELE driver=20
> > into non-secure world.
>=20
> With the ELE-FW and OP-TEE OS fix applied both worlds can communicate.
> Therefore it doesn't matter and I didn't mentioned it explicit above.
>=20
> That beeing said, with both worlds capable to talk to ELE and the ELE=20
> beeing very system critical, both worlds have to agree to the=20
> responsibilities, e.g. OP- TEE OS is not allow to manipulate the power-st=
ate behind the back of Linux.
Yes, your understanding is correct.

>=20
> > >  - NXP exposes an uAPI which can be used to send arbitrary=20
> > > commands from userspace to the ELE. (no filtering done yet)
> >
> > It is not correct to say that no filtering is done.
> > Before sending as well as after receiving the message, the message=20
> > header of the buffers are parsed to check:
> > - TX-buffer with Command-tag is allowed to be sent, RX-buffer with resp=
onse-tag is allowed to be received, without logging errors.

> I really don't want to step to deep into this, but that beeing said.=20
> If you refer to cmd_tag, than this tag is used by your below mentioned=20
> library also for NVM access. NVM is clearly something we do have a=20
> linux-framework and uAPI for.

Will add a command parser in v20, which will prevent sending any arbitrary =
command.

>=20
> > - TX buffer size & Rx-Buffer size should match the size mentioned in=20
> > the
> buffer.
> > - FW version from the header is checked, if required secondary or=20
> > runtime
> FW Is loaded, before forwarding the request to ELE.
> > - In certain cases especially for exceptions, the message IDs are=20
> > also
> compared.
> >
> > >
> > >  --> Sounds to me that the userpace can influence the system behavior
> > >      very badly.
> > >
> >
> > Messages created and sent by User-space
> > library(https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A
> > %2
> > F%2Fgithub.com%2Fnxp-imx%2Fimx-secure-
> enclave&data=3D05%7C02%7Cpankaj.gupta%40nxp.com%7Ce1d7cb78bda54edf
> 36d608de21fce1f6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 38985567165069017%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOn
> RydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ
> %3D%3D%7C0%7C%7C%7C&sdata=3DoE5nFyHRdW9ouWMy3VgiaGcgY7XKF4oZ
> Mbnt95HZ1%2F8%3D&reserved=3D0), are scrutinized as stated above in the=20
> kernel driver.
>=20
> This is uAPI which can be used by everyone and because your library=20
> may not implement access to power-managment calls doesn't mean that other=
 libs do.
> I'm not sure if your proposed driver will block such attempts from usersp=
ace.

Will add a command parser in v20, which will prevent sending any arbitrary =
command & any such attempt from userspace.
>=20
> > Moreover,
> > As part of this library, message creation, send-receive, IOCTLS etc.
> > kernel interface implementation logic, is not exposed to users of=20
> > this library.
>=20
> Your library is not the interface, the interface is the uAPI exposed=20
> by the kernel.
Agreed, that library is not the interface here. I never meant that.
I was trying to put the point that in order to exchange any arbitrary messa=
ge, rootfs needs to be compromised
- either to allow any arbitrary/un-authorized application to send any arbit=
rary message,
- or to allow executing compromised library.
But Yes, you are correct that here we are talking kernel driver, not usersp=
ace.
=20
> This interface/your driver needs to handle valid and invalid access,=20
> e.g. hsm -> valid, nvm -> not valid since it is abstracted via NVMEM.

Kernel driver do ensure to handle only valid, and discard invalid access.
The in-coming command with command_tag are given to the dev_context which i=
s marked receiver.
If the receiver is not assigned/set, it will be discarded.
The in-coming command with resp_tag are given to the dev_context which is t=
he initiator of the initial command request.
If this is not followed, it will deny the message exchanged.

Will add a command parser in v20, which will prevent sending any arbitrary =
command.

>=20
> > With the help of secure-boot and IMA-EVM, rootfs can be restricted=20
> > to not allow any new application or modified userspace library, to=20
> > execute.
> >
> > This way bad impact to the system behavior can be prevented.
>=20
> Sorry but I really have to say that I have to NACK. Your interface is=20
> the kernel uAPI and not some NXP userspace library.

Will add a command parser in v20, which will prevent sending any arbitrary =
command from kernel driver.

>=20
> An attacker could gain runtime system access and poke the ELE with=20
> arbitrary commands till he finds a fw-bug using the kernel uAPI (not=20
> your library of course).

Though the same command parser exists in ELE FW, which discards any arbitra=
ry command.
Will add a command parser in v20, which will discard any arbitrary command =
and power management API(s), from uAPI.
Request you or other, to share any comment apart from this, that can be add=
ressed in v20.=20
Will send v20 by end of this week.

Thanks & regards
Pankaj
>=20
> > > > > > * Linux HWRNG.
> > > > > > * Loading the secondary runtime fw.
> > > > >
> > > > > What is a secondary runtime-fw?
> > > > ELE FW size is larger than the size of ELE internal secure memory.
> > > > Hence FW is split into two.
> > > >
> > > > Primary FW, is the FW, that enables features that helps for SoC boo=
t-up.
> > > > Secondary runtime FW, is the FW, that enables features like HSM.
> > >
> > > Ah okay, thanks for the input.
> > >
> > > > > To conclude this longly discussion:
> > >
> > > ...
> > >
> > > > > I still have mixed feeling about the fusing (including the=20
> > > > > 1-MU case), since it requires a secure-world OS in place once=20
> > > > > the LOCK_DOWN
> > > fuse was burned.
> > > > > It's fine by me if NXP wants to have and wants to maintain a=20
> > > > > multi-path
> > > here.
> > > >
> > > > Write fuse API will be added, to allow writing fuses from secure=20
> > > > world too.
> > >
> > > This is a device life-cycle problem and if NXP decides to maintain=20
> > > multiple write paths, depending on the runtime-SoC state, this is=20
> > > fine by
> me.
> > >
> > > What needs to be ensured is, that the fuse-issue doesn't exist for=20
> > > the 1-MU case (i.MX8ULP) as you said.
> >
> > As said above "Write fuse API will be added, to allow writing fuses=20
> > from secure world too."
> > This will be true for 1 MU or multi-MU.
>=20
> In your previous mail you just said that there is no such issue with=20
> the write path. Now you say that the single-MU case needs the same=20
> workaround.. At least I have read it that way.

>=20
> > > > > Last but least, the uAPI which can be used to send arbitrary=20
> > > > > ELE commands seems unusual. But I don't know how=20
> > > > > secure-enclaves are abstracted within the kernel, so these are ju=
st my two cents.
> > > >
> > > > it's not unusual at all. The pattern of userspace sending=20
> > > > commands directly to the kernel via a queue is quite common like:
> > > >
> > > > GPUs: As you mentioned, userspace drivers (like those in Vulkan=20
> > > > or
> > > > CUDA) often build command buffers and submit them directly to=20
> > > > the kernel or hardware.
> > >
> > > That's right, but these drivers do at least some filtering on the=20
> > > OPs and check if they are allowed. According your patchset, you=20
> > > just write
> > > (se_if_fops_write()) the provided userspace buffer.
> >
> > We are validating the buffer size against the size mentioned in the=20
> > buffer header.
> > Refer above comments for more details.
> >
> > > > Secure Enclaves: In systems like Intel SGX or AMD SEV, userspace=20
> > > > applications interact with enclaves via ioctl or mmap=20
> > > > interfaces, often sending structured commands or messages.
> > >
> > > What I'm aware of is, that most secure-enclaves are switching to=20
> > > the standard TPM API.
> >
> > In case of NXP SoC with ELE HW IP, ELE is considered as on-SoC TPM.=20
> > No additional or external TPM is needed, if ELE is present on SoC.
>=20
> I said "TPM API" not "TPM device", may it be fTPM or dTPM. I think AMD=20
> switched to fTPM, so no special userspace-requirements must be fulfilled.
> However, this is also off-topic.
>=20
> Regards,
>   Marco
>=20
