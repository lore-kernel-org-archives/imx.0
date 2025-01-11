Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34C519D898
	for <imx@lists.linux.dev>; Sat, 11 Jan 2025 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736599324; cv=fail; b=JMvpy49BrMiMmGXPyJ9LR5Y7iATkus2ZndevH6AiPmX8zQ66FLGSS457HBSR59tmjjW1KzV9nr3lBvE72yMbmPezw0XwWzdxNF0U+Ef+HblNAXd2OAMLgyzXrRyFxipgIBRvp4wrwi9aMH2TNXN6d4YtTNvaVWPYJTwyIlnGYv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736599324; c=relaxed/simple;
	bh=qneCGt4pIxTE7LhxwP/vxm6VvwAWr52aYEwu8wPlHpE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F+ekh3uhG/T8ZHYlBxfFGawfY7gIlWr1/wr6kT2VZTGERQsc+IcPSVRVyD64WNHMEZqPJyc9ipyioAEypxthH7guSvM78SSIKbOWMAWoJNGj7S4NQgzFv2G3gwfBTaklJo3G2vFQxtVppaPlI36/xxqtmle0KCdWXNoBZLJTQIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QKFxI6l2; arc=fail smtp.client-ip=40.107.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QKFxI6l2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7Kd08JpzEIPNu4FVc0Io3lr32QuS6HKqvLUiWr4R1WBfOIu47c/WRgp5SFzF4kMtxdM0IrV0SyP5zyNrQ+r2m5NBUDz2hrNj1yR3LhokQA8Cy6velDBnB93mcXh1sNz6t8xj1opke6viqzRXRRNupmD2u4N+UR5paUGAPAcgtnjyaSPYT1ZOtQF8JpIM01rF5rSdquyrxikPWViiNg6gTkHDhwqwTMrxNvkL0bV/hY09fA5n9bxzObY4ykByZGhkcrqPCxptb2YltjPX5seVMmhAEt54FyYs30P+tkpwDVTzeL7OL90Fp60UyUZbl70zrz2GS+Yuh3kcmPcBzDjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tSGGHLff86laS6+RJSNG+EMbtSjbLrBh9f1769IQso=;
 b=r1d/nRHjA9FV6SJFch5pRy+aIUCaWgMhQ6+KXu0nE7wvits42GJhjI98Krg2nKUct+7Ue8yMAVVfk++WnrxsQUqNeNDzHeVSMXG9nkdJgGhTwWjppJBPp7TkSp08Po+87JKIYG9FNSilyHZO0hek7cEmkQ7hjCSjqDEUA6j4Qpqs2P8Lp2Q17lzWNwG1X3CGvegeeBelGt+X4G15FdJFp3HdtY35Mzy8dTfXamAW0W8H/6yKYAjbowYfeOCFn9EGFF6b9nsQUGrLjYpzXgzV5eh4Ecq08CkMibAN10VqJAfw3gxiWK6t8OUDv66sGF9hkuaN0DB7oYBTU+Xr7WWpNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tSGGHLff86laS6+RJSNG+EMbtSjbLrBh9f1769IQso=;
 b=QKFxI6l2vkzbByTgiiCnpdvOZc8+HwjbkQ2HzMZNZKGkq6iGV7IcKeoVxWwUJU/0xL24nFzl7b04iA4h/PfJXAgMTyD34+fMj52Mj0zO2rDtr89bgG303ycA6Z63E4qEVyz8gME2VBdQYNxmtxe9QTZMx4aBFaIws6xI7/E0olljCRDxBGTxs8/dmikyqbnftgZ24ucUUWxhcRr7Pc61eaKoJsILonJ1RKCLVRh/xWHpz3prsDqt6tVE+86OijyJ0cp5MP/5DxBE3l3pe6LkfoRal4Y/3KS7NpBX18ajI0cfDzgDGc9BTYQZTXDgi1FWCJ6qZOGf5xBx47QsIO6U5w==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM7PR04MB6933.eurprd04.prod.outlook.com (2603:10a6:20b:10d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.15; Sat, 11 Jan
 2025 12:41:58 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8335.015; Sat, 11 Jan 2025
 12:41:58 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Thread-Topic: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Thread-Index: AQHbYZsaAtqq5Jn1xUGKkk8ZemwvxLMMqVIAgAEiMQCAAHVZAIADR+kA
Date: Sat, 11 Jan 2025 12:41:58 +0000
Message-ID:
 <DB9PR04MB84615C152538FD411F462B19881D2@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com>
 <3823142.MHq7AAxBmi@steina-w> <20250109033418.GB31833@localhost.localdomain>
 <868241455.0ifERbkFSE@steina-w>
In-Reply-To: <868241455.0ifERbkFSE@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|AM7PR04MB6933:EE_
x-ms-office365-filtering-correlation-id: ec150b7f-a7f6-4ea1-d224-08dd323d567c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AtFeFwiBNvs611QcKhs5gXrwhdyj/nUAZbEAUfFCCfSGxRI1ntvM/FV9wR?=
 =?iso-8859-1?Q?HpPaMMKGecYt8lACxMdazF5EKugUBlL7KXXZmItOwk45kk3fQdpUGG6XCx?=
 =?iso-8859-1?Q?kzexbe4d8Z8p0CD/Cg28kOQAfmAuUm+EimasxrK0whElECNeTSz5bgwDh2?=
 =?iso-8859-1?Q?ilZPxJ6kasOh44y4Kdk7TTjQ/tc7lOcYY+QFk4NofMA4gIPQYk2YizXipk?=
 =?iso-8859-1?Q?a4G6iZ07GMfkVmpRv4HLrJGnM5CLVgpy7AbvZhLIRc2tIKcvkyTfXWD8M7?=
 =?iso-8859-1?Q?69PHWIlG8GaoqLF0Ox4N3Jf1e9pf2MQFIquCBpeKMqKaY4HSMi64uLZ08F?=
 =?iso-8859-1?Q?n6MLqSv9gZafRYB4NbpY9I/+vSIfLmsJqSRrAm4p0zoiUT2h7CZrZylPFs?=
 =?iso-8859-1?Q?aH5FY1XhdLHQTDO2Kqj2Op8igMtl7D1SOjSopj0+7pZRaWfIUzXTB2ZOfQ?=
 =?iso-8859-1?Q?TN/tC8zzFJ+XnNH3t2AVJI8o8aci5qTPBagCDgNdqJlwNrXP6qvefUVR2Y?=
 =?iso-8859-1?Q?2a5VQj9RVa22KMkruzuGb3b/g5cWdTI2FtmiDALpqiO6FWMweevleqE4NV?=
 =?iso-8859-1?Q?3vD+HrUFRpMUWGxOHr2B8U5cUHa9mdG0zwgRnwAOhi1dRSLgVVccg76Eqg?=
 =?iso-8859-1?Q?xWYhhQ6NjUkNIx+OvXT9kVOTfAaNviFERrn4cdO2LUoa+VCSfmtY9lYStu?=
 =?iso-8859-1?Q?pQBYMLPj3zqWSTwdFCa3vJrfkFY/BVWA4aVXbvA22tnWC7AR6SleEEj9ZJ?=
 =?iso-8859-1?Q?Bo/Evist+F052x59VileDeN7F0cCL0ejSnb1aNF0MNb7EfB5ZxK9G6cA4x?=
 =?iso-8859-1?Q?p8BI8PDRJ1Kd7rr3MCChHRtp6Ls8GT8DydVkPkWHJXVce4sIFaI8lGtUdv?=
 =?iso-8859-1?Q?dG2DDyqlKIfYpr50G7l85puKEnTiRCgWOicvmqlDrDMQCPySfeH1O/kuHU?=
 =?iso-8859-1?Q?g64L/9SgNPxMRutKLYQV2wyv6ls9jQFut0E8CD90LF0p49pqUUNKjVnhIo?=
 =?iso-8859-1?Q?xHN/JzqBSwdkk9CLuT8SDcVgRuynpgWBr3DVxUcpGzgnNmwnPKauZl2qZL?=
 =?iso-8859-1?Q?V6gAnT/T61KrvtfW/0ykZ/Kg6OysvitVMXMu4sKReSX7SFNM/6kEe3Tp7w?=
 =?iso-8859-1?Q?nKbIZPelkziQcEUWNI4TtZeid4l0DZQI7+m/StwH30PkSCRutfiApxtrdB?=
 =?iso-8859-1?Q?JohId8dv9Dh3DpX52UVOgNMqVAtUSaZmmrZQOR3XOfgt0fwiJ6/bXlnsj9?=
 =?iso-8859-1?Q?uOsklLVAPm9FBqQdWc+gkXmX7yb3aNAbd7XOXv5mMYTFfJcG1VAcHNNVZM?=
 =?iso-8859-1?Q?CgmnPMUzAYmkvC4jfRdlObey7Uqt2eMdOkfNTD62HG0JMayeqqMFA0E3R8?=
 =?iso-8859-1?Q?BbHzkC1RBv8MRRpqNY7wP238XyvqnXhIiidI35AGWRkvOZDG89paxsaLU5?=
 =?iso-8859-1?Q?0WOhTTiPpZAu01CxSBVfa4FLT1+jos2AxpCT/A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JXyO2mFtYNBZ/v1PDLYIumakGr+/R0tDvegECtzXdQw9YhDFvO95OXXeOG?=
 =?iso-8859-1?Q?ZgMBLlFHBAcgOxpzpKqOmAzuzwdeSVRR2JSgkmLulubI80Si/49rHNskt0?=
 =?iso-8859-1?Q?/kfDrzDbThwjbzyADBKKSvseuoq1U1tt0JyX+ScAdZpUAmTL1Yqt3t4094?=
 =?iso-8859-1?Q?n/8Iz/L680H/ovSTyPb4UmntjlQGamF3JqhsIXXLldYJ4QTDsSQUx57/gb?=
 =?iso-8859-1?Q?6rOY0V7AeSEm2a7cZFQq2uhuS5r29FDdsQYM9lxdpSWuHk/mAuZQmqStt/?=
 =?iso-8859-1?Q?2cjRShilaFCC+EsfvKOJU4hRxVL/2Y7i8407sQxmxAvuidwLcEBvwRDlCn?=
 =?iso-8859-1?Q?8VipIraLUE2l9Ljpm64ME3cyGYebxBfXpf2/5lcWdf6BPL7hNxyg6pbwtJ?=
 =?iso-8859-1?Q?juxVtRRk1F0/+aIS77xDSqXv8JqfiuiCdFzdn7ax0nS4P5j2GP3k5agfhS?=
 =?iso-8859-1?Q?urfzNL7VJD7iGYs/tZRQT1HZakkAknnSZevEanvPjkC1QkOUqJoMiIHT2Y?=
 =?iso-8859-1?Q?VqigIglH91GzungUdv4/ESoUb6iR4qzq01mZkSwBqj3e8wrgVpEymbva18?=
 =?iso-8859-1?Q?lbhLIwa9DfUnTnNxLvtZYcztAyOyTj92eg7fa2NWsRmOTkgW4Mzz3Hfk4M?=
 =?iso-8859-1?Q?LF7kMPBicLCtDz5FlCxhoGvE0XjCmV6z1aU6DiTJeD4NiG2pLjaDkbMc0o?=
 =?iso-8859-1?Q?YQDVZ1NWMAf0uTchQmwm/rYZK4l7+9YT8kww6Wm1yCs4bjZaYhmTn2HaNU?=
 =?iso-8859-1?Q?apEZeixfjOVfJxN3oo/4OX2Ex1LsTs/GcmZLPLgz/BmiRQBvil1DhnzDYw?=
 =?iso-8859-1?Q?uUB2Otfr3Z5suNnLn8nNkLHDaABuEfF2kCyGFSoRrPHAKRfX+QOQ/BWWU2?=
 =?iso-8859-1?Q?QtblJ5ExSvY5PviZLo9XAd3SVrY9BmoaKp2/b9E+4vCQLKcgtmUr0JNs7/?=
 =?iso-8859-1?Q?4LdGxINIXE/boFmYOVWRnz9KVrygyBdD1VPdFRG9XNMCu5Kz+e7vLS+NYn?=
 =?iso-8859-1?Q?/zAhu5olSnI17MOGCcAra3+OlWE/NlzO9JF/5iOok7r9LpBqOjwE5KqSmz?=
 =?iso-8859-1?Q?vVXagOdE0q01t4wWWJRQj9Zp0zah8jDuSwTOz9ndU3JA4rSJptvbjD3IcY?=
 =?iso-8859-1?Q?6m5pmO/9TtDZO30RrFD9jyYWGpvFrJvnCRIklsjT3zO3nTFqhIjwUURLY5?=
 =?iso-8859-1?Q?dicRk7CTLrbFZlhqWY1q/9ILF2zlVFlWYaqQdAXBTh6PSJCAA2GxNGa/b1?=
 =?iso-8859-1?Q?LU+z14nOB3FYFjluoh5BSt8cTFN41ZGBBhjcmcMnfLAdZ7FLWNW1cO+kX9?=
 =?iso-8859-1?Q?5q76wkfL+QlQdkPprFit9i6qkkJR2t2UxFVSBaiytB7H3+8hfm/vWEcqSM?=
 =?iso-8859-1?Q?IE27Y4MnmgNF6cOv6PtkunOxkUbeAUq8OOIVeFCRerQwdQ+AAMOIeS6UqP?=
 =?iso-8859-1?Q?LeNQYnRxBbYzXB4YnWVJVJ65hlxdXlnn+W7RkhN1VHtdPTDQvSTmZs51t3?=
 =?iso-8859-1?Q?sF7qkNYxK5mZ4rIRXIfLFdGtcy2ZVINwbG2qFl6gCS0EJB30MFkz8ttTAJ?=
 =?iso-8859-1?Q?8W/iG6oh1Ydtg5uOyyJHVbJ8b3gdQpg18JUCXeycFoj6H03PeOR9F0SVv8?=
 =?iso-8859-1?Q?K2GOKdbj8kxVE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec150b7f-a7f6-4ea1-d224-08dd323d567c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2025 12:41:58.1544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+Uh41qMwYYvmhYa8Vjab2TJ+MwxuyQcTqFo18pYafaXjfRxeKSdefLzpC2OZ3GS2udW0NDZal97+ncoxzX1tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6933

> Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
> controller for i.MX9
>=20
> Hi,
>=20
> Am Donnerstag, 9. Januar 2025, 04:34:18 CET schrieb Peng Fan:
> > On Wed, Jan 08, 2025 at 11:15:40AM +0100, Alexander Stein wrote:
> > >Hi Peng,
> > >
> > >Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng Fan (OSS):
> > >> From: Peng Fan <peng.fan@nxp.com>
> > >>
> > >> i.MX9 OCOTP supports a specific peripheral or function being
> fused
> > >> which means disabled, so
> > >>  - Introduce ocotp_access_gates to be container of efuse gate info
> > >>  - Iterate all nodes to check accessing permission. If not
> > >>    allowed to be accessed, detach the node
> > >>
> > >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > >> ---
> > >>  drivers/nvmem/imx-ocotp-ele.c | 172
> > >> +++++++++++++++++++++++++++++++++++++++++-
> > >>  1 file changed, 171 insertions(+), 1 deletion(-)
> > >>
> > [....]
> > >> +
> > >> +	return imx_ele_ocotp_access_control(priv);
> > >
> > >In [1] you mentioned devlink should solve the probe order. How
> does
> > >this play when the driver is compiled in (e.g. ethernet for NFS boot)
> > >but this OCOTP driver is just a module?
> >
> > OCOTP needs to built in for using devlink. Or the users needs to be
> > built as module.
>=20
> I don't like this kind of assumption. Would it make more sense to make
> CONFIG_NVMEM_IMX_OCOTP_ELE as bool instead of tristate?

No. Users could setup their own system with this driver build in
or built related drivers as modules.

At least for Android GKI, this driver needs to be as module.

Thanks,
Peng.

>=20
> > >I'm not well versed with devlink, but is
> > >> access-controllers =3D <&ocotp IMX93_OCOTP_ENET1_GATE>;
> > >already enough to create that link?
> >
> > Yes, the drivers/of/property.c has this
> > "DEFINE_SIMPLE_PROP(access_controllers, "access-controllers",
> "#access-controller-cells")"
> >
> > The fw_devlink driver will create consumer/supplier to make sure
> > proper order.
>=20
> Okay, thanks for confirming.
>=20
> Best regards,
> Alexander
>=20
> > Regards,
> > Peng
> >
> > >
> > >Best regards,
> > >Alexander
> > >
> > >>  }
> > >>
> > >> +struct access_gate imx93_access_gate[] =3D {
> > >> +		[IMX93_OCOTP_NPU_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(13) },
> > >> +		[IMX93_OCOTP_A550_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(14) },
> > >> +		[IMX93_OCOTP_A551_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(15) },
> > >> +		[IMX93_OCOTP_M33_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(24) },
> > >> +		[IMX93_OCOTP_CAN1_FD_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(28) },
> > >> +		[IMX93_OCOTP_CAN2_FD_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(29) },
> > >> +		[IMX93_OCOTP_CAN1_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(30) },
> > >> +		[IMX93_OCOTP_CAN2_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(31) },
> > >> +		[IMX93_OCOTP_USB1_GATE]		=3D { .word =3D
> 20, .mask =3D BIT(3) },
> > >> +		[IMX93_OCOTP_USB2_GATE]		=3D { .word =3D
> 20, .mask =3D BIT(4) },
> > >> +		[IMX93_OCOTP_ENET1_GATE]	=3D { .word =3D
> 20, .mask =3D BIT(5) },
> > >> +		[IMX93_OCOTP_ENET2_GATE]	=3D { .word =3D
> 20, .mask =3D BIT(6) },
> > >> +		[IMX93_OCOTP_PXP_GATE]		=3D { .word =3D
> 20, .mask =3D BIT(10) },
> > >> +		[IMX93_OCOTP_MIPI_CSI1_GATE]	=3D { .word =3D
> 20, .mask =3D BIT(17) },
> > >> +		[IMX93_OCOTP_MIPI_DSI1_GATE]	=3D { .word =3D
> 20, .mask =3D BIT(19) },
> > >> +		[IMX93_OCOTP_LVDS1_GATE]	=3D { .word =3D
> 20, .mask =3D BIT(24) },
> > >> +		[IMX93_OCOTP_ADC1_GATE]		=3D { .word =3D
> 21, .mask =3D BIT(7) },
> > >> +};
> > >> +
> > >> +static const struct ocotp_access_gates imx93_access_gates_info =3D
> {
> > >> +	.num_words =3D 3,
> > >> +	.words =3D {19, 20, 21},
> > >> +	.num_gates =3D ARRAY_SIZE(imx93_access_gate),
> > >> +	.gates =3D imx93_access_gate,
> > >> +};
> > >> +
> > >>  static const struct ocotp_devtype_data imx93_ocotp_data =3D {
> > >> +	.access_gates =3D &imx93_access_gates_info,
> > >>  	.reg_off =3D 0x8000,
> > >>  	.reg_read =3D imx_ocotp_reg_read,
> > >>  	.size =3D 2048,
> > >> @@ -183,7 +307,53 @@ static const struct ocotp_devtype_data
> imx93_ocotp_data =3D {
> > >>  	},
> > >>  };
> > >>
> > >> +struct access_gate imx95_access_gate[] =3D {
> > >> +		[IMX95_OCOTP_CANFD1_GATE]	=3D { .word =3D
> 17, .mask =3D BIT(20) },
> > >> +		[IMX95_OCOTP_CANFD2_GATE]	=3D { .word =3D
> 17, .mask =3D BIT(21) },
> > >> +		[IMX95_OCOTP_CANFD3_GATE]	=3D { .word =3D
> 17, .mask =3D BIT(22) },
> > >> +		[IMX95_OCOTP_CANFD4_GATE]	=3D { .word =3D
> 17, .mask =3D BIT(23) },
> > >> +		[IMX95_OCOTP_CANFD5_GATE]	=3D { .word =3D
> 17, .mask =3D BIT(24) },
> > >> +		[IMX95_OCOTP_CAN1_GATE]		=3D { .word =3D
> 17, .mask =3D BIT(25) },
> > >> +		[IMX95_OCOTP_CAN2_GATE]		=3D { .word =3D
> 17, .mask =3D BIT(26) },
> > >> +		[IMX95_OCOTP_CAN3_GATE]		=3D { .word =3D
> 17, .mask =3D BIT(27) },
> > >> +		[IMX95_OCOTP_CAN4_GATE]		=3D { .word =3D
> 17, .mask =3D BIT(28) },
> > >> +		[IMX95_OCOTP_CAN5_GATE]		=3D { .word =3D
> 17, .mask =3D BIT(29) },
> > >> +		[IMX95_OCOTP_NPU_GATE]		=3D { .word =3D
> 18, .mask =3D BIT(0) },
> > >> +		[IMX95_OCOTP_A550_GATE]		=3D { .word =3D
> 18, .mask =3D BIT(1) },
> > >> +		[IMX95_OCOTP_A551_GATE]		=3D { .word =3D
> 18, .mask =3D BIT(2) },
> > >> +		[IMX95_OCOTP_A552_GATE]		=3D { .word =3D
> 18, .mask =3D BIT(3) },
> > >> +		[IMX95_OCOTP_A553_GATE]		=3D { .word =3D
> 18, .mask =3D BIT(4) },
> > >> +		[IMX95_OCOTP_A554_GATE]		=3D { .word =3D
> 18, .mask =3D BIT(5) },
> > >> +		[IMX95_OCOTP_A555_GATE]		=3D { .word =3D
> 18, .mask =3D BIT(6) },
> > >> +		[IMX95_OCOTP_M7_GATE]		=3D { .word =3D
> 18, .mask =3D BIT(9) },
> > >> +		[IMX95_OCOTP_DCSS_GATE]		=3D { .word =3D
> 18, .mask =3D BIT(22) },
> > >> +		[IMX95_OCOTP_LVDS1_GATE]	=3D { .word =3D
> 18, .mask =3D BIT(27) },
> > >> +		[IMX95_OCOTP_ISP_GATE]		=3D { .word =3D
> 18, .mask =3D BIT(29) },
> > >> +		[IMX95_OCOTP_USB1_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(2) },
> > >> +		[IMX95_OCOTP_USB2_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(3) },
> > >> +		[IMX95_OCOTP_NETC_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(4) },
> > >> +		[IMX95_OCOTP_PCIE1_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(6) },
> > >> +		[IMX95_OCOTP_PCIE2_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(7) },
> > >> +		[IMX95_OCOTP_ADC1_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(8) },
> > >> +		[IMX95_OCOTP_EARC_RX_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(11) },
> > >> +		[IMX95_OCOTP_GPU3D_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(16) },
> > >> +		[IMX95_OCOTP_VPU_GATE]		=3D { .word =3D
> 19, .mask =3D BIT(17) },
> > >> +		[IMX95_OCOTP_JPEG_ENC_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(18) },
> > >> +		[IMX95_OCOTP_JPEG_DEC_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(19) },
> > >> +		[IMX95_OCOTP_MIPI_CSI1_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(21) },
> > >> +		[IMX95_OCOTP_MIPI_CSI2_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(22) },
> > >> +		[IMX95_OCOTP_MIPI_DSI1_GATE]	=3D { .word =3D
> 19, .mask =3D BIT(23) },
> > >> +};
> > >> +
> > >> +static const struct ocotp_access_gates imx95_access_gates_info =3D
> {
> > >> +	.num_words =3D 3,
> > >> +	.words =3D {17, 18, 19},
> > >> +	.num_gates =3D ARRAY_SIZE(imx95_access_gate),
> > >> +	.gates =3D imx95_access_gate,
> > >> +};
> > >> +
> > >>  static const struct ocotp_devtype_data imx95_ocotp_data =3D {
> > >> +	.access_gates =3D &imx95_access_gates_info,
> > >>  	.reg_off =3D 0x8000,
> > >>  	.reg_read =3D imx_ocotp_reg_read,
> > >>  	.size =3D 2048,
> > >>
> > >>
> > >
> > >
> >
> >
>=20
>=20
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld,
> Germany Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F
> www.tq-
> group.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.com%7C55d61ee
> fd50749808d4a08dd3099320d%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C638720156723988367%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> %2BCsoNoGLNpZiltu%2BMD%2BUCMAwHcmXCL0LKVq9olfSIoU%3D&r
> eserved=3D0
>=20

