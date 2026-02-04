Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A428980E
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 01:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770170375; cv=fail; b=Na2RJ95DPlBFlOvQciJSfx3SPJiuDSKA+bd0H8HHqOH9RjFX/fkX6JA2k0ZBhideY4LdZyd9lE1sHLPH1bdCmhO+QvbypbDTL238JuyxNVQFc/4E8PyyNRzNw1QIb42W75aNmb4R9Z7US8meSCXZPX8S1PXEZj8Z50EUVhfE38k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770170375; c=relaxed/simple;
	bh=iQnfsuT1t9nocqviv39v9b5B56g1GrFBThW7cL5SbWk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RM7aTzrbEunAe01DctVsX+RGg8D3JZbgwuiIEj9Unn4mR6BzyCbjQ4vO0sPAShRXEzqRen1sjHQ6jUTyl06LOPYzDlpnWlVIILnTotG+ImHtDMNZtn34GoZ7Dm4hD0Ff1PI9Q4yWznW3XgUbZ7CslKEUXQHkQnt0x6hKXOJrD70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TlfeYqdQ; arc=fail smtp.client-ip=40.107.159.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TlfeYqdQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Soj/ZNLnrD7BmPUPYcGLoMtkKkdpXmZI6RuOl3khX7HlIbrnww/oJFQGppAHRAsbrEl2kDs7VO/Z4BDSvXRch1zua3dx5qYF49A5za7O71EcJr7YdjFiwHWIup2NjMfv9PGR9uTrZrDTxAIz6htqcW3TRVrFGf7s5uwLEwtiK+ycYESlnICZwWL4mgrOB3O6nC0I90ynno86V9vEI2oC/C+85qdJCivrvCRw2Wr34mc3PRg6dRwM9dRgeLI5dEe890TYUMZiS5E23Ok0+sxdCS35pPjjOHvcrtwlGvcR/mrwA0o+ETIfaNa/BiDUEZCrKuj/aF/I1tFMP5Cpa61tDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xR4JULxiYDqeP+1qHpbiGuE1pP4P9g1ITcEf5z32lHo=;
 b=M2yy9LPixtV3SklwI4C1YlNxiV319FBFpz+pJwyZbzaJsp4w0kiw/gQtys6m8rz+Pb8zUM5gDVatskdE+F6adwJQOz2Z+e4crAf5YK/35TubkYi6ln+yFOaPqn07QHVcA6pTdbGOposkuKLabniD82PIno2LLLjXisLEuX/eWjtV3k8ja8CIhPACe9hpT2Hi585QCWlE/Yutmp6XdHiEoLQFVMOhewWn0EZ6XDSqJ/0O953HMp7WCKyaPLOz90tF/xTWpsf4QGrslsXQuZcHoE/lFnpPetwOvRn65ZoSHoveRTjbyZFDmnqSYjMkX87/QRqJmfeRwiHAyHIyHiYwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR4JULxiYDqeP+1qHpbiGuE1pP4P9g1ITcEf5z32lHo=;
 b=TlfeYqdQTbO9NwTRXUSMIqxgxols0qEklWpTmEocmnkYPSsaZhsIt4K19vYI7nXrQlisqqiFX7Xtiwa6WoM2v+/Qx1X4I61mk2MlIRiRVrOPZcpRuN+ROwTBplEKwic9+UIC2OlexVfpbwseWzdt04ef8coOGjhxteNEcRY0+l4A4jVbNN2GFPZ1JM4kUDKS3CDBm8UbfeyJcpG2AibzglTudwgsCA7s7Sbe/dHSp3xp1mVMs5cBRLewOTcMBVpZqR2yq8nLt+3BDRqqcYjutBy6Yguv6SZo4NQLchdqMGXrkELMNvQnDliJ3keYKiOL9Sd7y5HrU4hxtiV2K7bPBA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB8101.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 01:59:29 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 01:59:28 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel
 Baluta <daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V5 2/5] arm64: dts: imx93: Rename imx93-11x11-evk.dts to
 imx93-evk-common.dtsi
Thread-Topic: [PATCH V5 2/5] arm64: dts: imx93: Rename imx93-11x11-evk.dts to
 imx93-evk-common.dtsi
Thread-Index: AQHclOM1X7WpiAgJ6Em9vzM8JIJ377VxNBqAgACVitA=
Date: Wed, 4 Feb 2026 01:59:28 +0000
Message-ID:
 <VI0PR04MB12114D57096CFCA45CE5A56669298A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260203080137.1492376-1-sherry.sun@nxp.com>
 <20260203080137.1492376-3-sherry.sun@nxp.com>
 <aYIqPyC4Tya8CgzM@lizhi-Precision-Tower-5810>
In-Reply-To: <aYIqPyC4Tya8CgzM@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AS8PR04MB8101:EE_
x-ms-office365-filtering-correlation-id: a091e046-06f2-4b63-01d3-08de639107fa
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?U6nYw/WWT14xclTst11EJu8xAhLLu63DVbQhkTvOLCGjjT5oW59ST1urc3jB?=
 =?us-ascii?Q?a59xTAkgN0VmVt+sVzLCAoYo70OjxWks8rds65MIPmKkvyz13aJ/xP3+/xe7?=
 =?us-ascii?Q?vr7edUSOxf5dJR10yAVNUn8ybNOJqioz7Ark0+qdjieX2G3Rharl9QQWIOAB?=
 =?us-ascii?Q?j3kzzCunnCqzwXN96i7LCIag8iosGZaI9ZqusLKolH9YD/H9UaBxr+tVcbCv?=
 =?us-ascii?Q?ymbC+tHQTH6a82oEYID+omtRWyU3SKfD//Wz2ueidg6i8eQU1JPhqE/QFiI/?=
 =?us-ascii?Q?+vXyH8hwfxLqmvq/KvCRdnRFZyJeXI+wge53fn1OMd7k+vneyehSAaUaZkeI?=
 =?us-ascii?Q?ljj34khrg9kdVYSXEMDZJn7pTTr9rZNW8tHRSz0eZXvIEAk+ObGWNZx5AFbS?=
 =?us-ascii?Q?ABWvxLTenFZ8pNBhcxnGUwldgtx8hTbBo8Uac6Bcvxr5kMnckh7Gggr6isQF?=
 =?us-ascii?Q?L0V81xs4Z6kXRj7im4RmZdHtONHshZeFMsxcyKFHTzQh23nm5u4ocjMgVxs5?=
 =?us-ascii?Q?CxYRzEALil0OjEuryTZ5Xm92rf6aPJUtezh0alku48b0j0+sVkpzqqneUgoP?=
 =?us-ascii?Q?uiPHjQ7cIs+h8WGVjzzaUQbRBItyRWRfSHPG0ISisExqJO7RbxGWQ6ZWv4j2?=
 =?us-ascii?Q?MlQMyC5Ki4oHRXaI11r48iYQ0L8TmdtM+9CrbwCrlnQBAy/Yk94ledUTvO3a?=
 =?us-ascii?Q?VDIEtD0MWyZ09JCEWUak9JCt89ioVR/1AeAfG/zFoClmx9fvXPT0/dEuiBWn?=
 =?us-ascii?Q?HerWvA/mt1XygALT0ELp+QKpqtOhEeeB4k3XnF7uu4Sma/Ec1vBjyXl/58lc?=
 =?us-ascii?Q?sPkzAnbQtHIJv+mziO60XGBzYP+PP//xWmDh4j57347owiCIREfK954aWDU3?=
 =?us-ascii?Q?ryRcrdj/0ELVHlkggcRqmHvOsY4HcP21mNZwjewPuN9aU45k7A8XTgbxL+a5?=
 =?us-ascii?Q?WxlctUyFj0D04eSfUildzQFuaE4UX+pKV2fcDbhJqfMrCn3FS+22g0RHwomX?=
 =?us-ascii?Q?uZknyeGIGCeQtmD09m8A4BQY1HnZ9VMdaYU4Rf6kmqgQZZy2TGVt5sIbam0i?=
 =?us-ascii?Q?pBFqxa0dnz88jLK7CzzQHp46J0s8ly+FARen/3Zjv8Zbi/hTBCI7O+/Gh0cy?=
 =?us-ascii?Q?CSC3wDVmhpTqH2thEXyj1/Sam8XFPfC4M2LAiSp+/0XSvCtJUXJ3VomervNq?=
 =?us-ascii?Q?e2rbV6NUdsvBbq7pD9iRJQF9qoba+qMRZoLionfKu8Ji8MUKNAaXnpaJ0sk3?=
 =?us-ascii?Q?HXOrYvr0462zCR2Fwa1hQXcGiKkp9wWDQYkAYDnZV5pK6LYhL3zNHGl3ifxm?=
 =?us-ascii?Q?NI3rTomShFgnXyVfZGW4KNOPPePaTDC16LbfFC9OPYrOTF6FWKQc43jBafVp?=
 =?us-ascii?Q?K2fhg5Ud1PzbPBQ7KcHaEW543LWR3Ap3+GSj0CChsbGUMqZBp72mIq179izb?=
 =?us-ascii?Q?WlPk9sIF0IAjl6iWoHmYEwYl5r5adplomSmOuDBc933y434jgZu6fTE2KgL7?=
 =?us-ascii?Q?1DnpQg3dDOHAUZjfGIJeDGMxs8pmNBKSuVJX4hq+fwyYNJ4LCvmZtExOc9LT?=
 =?us-ascii?Q?E8r0I7e6Ik5uXOspM+CglPeNz3ACjbUOJBFlq68MSUAtfUiAkPkiaHaxM4SL?=
 =?us-ascii?Q?MZRmRfgvjT4wAhaF4Scha1I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Hlq24cxYcviLH5MpE4cMUuFMaOsRjnaazUIQcI0FWAbAgI9eox6h7jdWM3Ox?=
 =?us-ascii?Q?65nfxKx1yBL1rUpOcEWVTA81k5PwQeJ5U9vwZ1cMc+CTZL5wNSlsmrhfUvEr?=
 =?us-ascii?Q?bL5LPfahI6VCTKajMFZ7hG53IgcMq56zhDlQ2ic/qSNDy9nWHLTMQQbs3L7C?=
 =?us-ascii?Q?BUzBds9gNuAM78H9who5bB9zLUVhpijNBn2jJs26S8Op1OeszGU1ukkN+f4f?=
 =?us-ascii?Q?rKDf6smL2z48g00xwryaYlxXeC2aYJQ3v/5atngmxAXDNEWbUDeS+eBzQKWb?=
 =?us-ascii?Q?rYZOLPZ6isruukMF6QAfSLv1Rtw2O0BV9N+AZutvgU+BhBFHj35VP2rymaAa?=
 =?us-ascii?Q?GTwL+w3sC94nHkMRAqnOlosO05DbGEUqZJkcmTWF6j/q3z7Ref82Hz5I5fWE?=
 =?us-ascii?Q?YnK0I3rZXf1wS1m/Twovk6AmkoDSH3hVDrWNr3CnOn6/AIulo9fJQILJn01l?=
 =?us-ascii?Q?Myknoyt9HEjxCy9KytIk2wWCVfZ8P+gUBg4D0x+jUPIob0HxZjCqELTmUnr1?=
 =?us-ascii?Q?lkuFqK8DzZjMzICdgkGoTOkCny4DVcc7QsB1RYRiMsHt1a/quP92paQCED4l?=
 =?us-ascii?Q?Co47f1GClg0i42L3+eMuE2n17mOe2ctqCEorKHcpreMHS216qfU49gbPo47p?=
 =?us-ascii?Q?+qutwPd7xUsBwL9OOcRyvtHqjE+zNUUEP6KYgA7Kg9P+5PDdyyuR6WO6XKif?=
 =?us-ascii?Q?HDWom+zZ8wmuBMjD6ZWSWeMZ3tdzq/skMttn8SSbhsKshg56Xv28xwueKJUf?=
 =?us-ascii?Q?ciNnn/a+81+yltc6tM5YJ1kh8qeaefKismvRzGEzIQPFLwjeSLki2BkMwtlT?=
 =?us-ascii?Q?oeBGYZ2kZkRh6QMnhSzqTUbDlWwCMg2uxJqDnEyji9YZrD0howP2Tun/wQ3u?=
 =?us-ascii?Q?zrR6ZJMllNOx4VemUFI6gZAPNaXcWp8VIH0LrqYw/6HBXT6axGTtS+H6Ly9m?=
 =?us-ascii?Q?v0u9bYhgEpjL031M4uXxAJm8LIOL9yg4x2zBy3f65HbjH83yvHHWPLu8c0nT?=
 =?us-ascii?Q?1a8tgeNhquBJZvwppQbdrWCcsGrBKlaBrCPG3fFX8W1yPaUnl6SGZiHcXafL?=
 =?us-ascii?Q?N3s8FfRuNvUarh0OBgr2c045+Qeor4f00GvuPNLL6kcIoLGXTEsVcxGFilcl?=
 =?us-ascii?Q?X+jcirYl2PNhdWlvpv73HO1UcXYKjhynshh/8DLdMQQjKpuVepBrMkJRM2TZ?=
 =?us-ascii?Q?vytZUEisGeCSI25v+ELZikZUPi/3ohd6xmrGw/6+MO0QnVJeDC/juUq7RSUi?=
 =?us-ascii?Q?oaWhwVcY8ipIuoMY4K6igNylCC7eFLSnCUbig8sjC2BxdIMV6OK9i5NHeMtq?=
 =?us-ascii?Q?mCcXicwvZ5SK1hPpMpgnDdbIak02w5AgZfz7MkfoXi9t6D5mHnxIbo9rDluD?=
 =?us-ascii?Q?olmaO6NX6PpiX9EwRLQ/GTUyfj3fmLJpxOzkKpkh07JV9WFeBp9lDG1ioB/7?=
 =?us-ascii?Q?VSGvv0YO8PHmAeyB3GqN9lKM0R0kZNjElEI+uyAOymtkdXwAlss/UPSLO/by?=
 =?us-ascii?Q?YOI6k36s3uKVMuMUjHjfH0XHZAT7Bj4Z3bEup507zfYVZuVfYH3GuinuttSr?=
 =?us-ascii?Q?8mym5Wt+bKM8M/t4qyM6tTnfn0J2itvFFnvxbTmg3KDuSkR54lVMBMNPIWoo?=
 =?us-ascii?Q?B1Yie7QocV0gCykpdgLqNxbThyzf/L51gqcCfF8N4foWqnmY1OxmkLdq+R8u?=
 =?us-ascii?Q?vGWJnxeJ2QkTXAyBoSBo1U/9rZM4OX5hsEuw7/WwVBV9UVmZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a091e046-06f2-4b63-01d3-08de639107fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 01:59:28.8091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jbfw/chxxEX/s8+rN/h/cEW+ubeinHeys/nsIbEHaSgRDoHjYqC1eAYmzIwaHlw8pmwWqbVoPkCMKqToUi7/lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8101

> Subject: Re: [PATCH V5 2/5] arm64: dts: imx93: Rename imx93-11x11-evk.dts
> to imx93-evk-common.dtsi
>=20
> On Tue, Feb 03, 2026 at 04:01:34PM +0800, Sherry Sun wrote:
> > The i.MX93 Wireless EVK board reuses most of the design of the 11x11
> > EVK. To avoid duplication and DTS-to-DTS include, need to extract the
> > common parts into a new imx93-evk-common.dtsi, which will be included
> > by both the 11x11 EVK and the Wireless EVK DTS files.
> >
> > Prepare for extracting common parts of the 11x11 EVK into
> > imx93-evk-common.dtsi. This patch contains only structural changes,
> > with no functional impact intended.
>=20
> Avoid use words "this patch".
>=20
> ARM: dts: imx93: extract common EVK description into shared dtsi
>=20
> The i.MX93 Wireless EVK reuses most of the 11x11 EVK design. To avoid
> duplication and DTS-to-DTS includes, extract the common parts into a new
> imx93-evk-common.dtsi shared by both boards.
>=20
> Rename imx93-11x11-evk.dts to imx93-evk-common.dtsi and include it from
> imx93-11x11-evk.dts.
>=20
> Only structural changes are introduced, with no intended functional impac=
t.

Thanks, will improve the commit message.

>=20
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  .../boot/dts/freescale/imx93-11x11-evk.dts    | 1053 +----------------
> >  ...93-11x11-evk.dts =3D> imx93-evk-common.dtsi} |    8 +-
>=20
> imx93-11x11-evk-common.dtsi incase 9x9 need common file later.
>=20

Ok, will change the file name to imx93-11x11-evk-common.dtsi.

Best Regards
Sherry

> Frank
>=20
>=20
> >  2 files changed, 3 insertions(+), 1058 deletions(-)  copy
> > arch/arm64/boot/dts/freescale/{imx93-11x11-evk.dts =3D>
> > imx93-evk-common.dtsi} (99%)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > index acb160d3186c..cca923f4ac7a 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > @@ -1,1063 +1,14 @@
> >  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >  /*
> > - * Copyright 2022 NXP
> > + * Copyright 2022,2026 NXP
> >   */
> >
> >  /dts-v1/;
> >
> > -#include <dt-bindings/usb/pd.h>
> >  #include "imx93.dtsi"
> > +#include "imx93-evk-common.dtsi"
> >
> >  / {
> >  	model =3D "NXP i.MX93 11X11 EVK board";
> >  	compatible =3D "fsl,imx93-11x11-evk", "fsl,imx93";
> > -
> > -	aliases {
> > -		ethernet0 =3D &fec;
> > -		ethernet1 =3D &eqos;
> > -		gpio0 =3D &gpio1;
> > -		gpio1 =3D &gpio2;
> > -		gpio2 =3D &gpio3;
> > -		i2c0 =3D &lpi2c1;
> > -		i2c1 =3D &lpi2c2;
> > -		i2c2 =3D &lpi2c3;
> > -		mmc0 =3D &usdhc1;
> > -		mmc1 =3D &usdhc2;
> > -		rtc0 =3D &bbnsm_rtc;
> > -		serial0 =3D &lpuart1;
> > -		serial1 =3D &lpuart2;
> > -		serial2 =3D &lpuart3;
> > -		serial3 =3D &lpuart4;
> > -		serial4 =3D &lpuart5;
> > -	};
> > -
> > -	chosen {
> > -		stdout-path =3D &lpuart1;
> > -	};
> > -
> > -	reserved-memory {
> > -		#address-cells =3D <2>;
> > -		#size-cells =3D <2>;
> > -		ranges;
> > -
> > -		linux,cma {
> > -			compatible =3D "shared-dma-pool";
> > -			reusable;
> > -			alloc-ranges =3D <0 0x80000000 0 0x40000000>;
> > -			size =3D <0 0x10000000>;
> > -			linux,cma-default;
> > -		};
> > -
> > -		vdev0vring0: vdev0vring0@a4000000 {
> > -			reg =3D <0 0xa4000000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		vdev0vring1: vdev0vring1@a4008000 {
> > -			reg =3D <0 0xa4008000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		vdev1vring0: vdev1vring0@a4010000 {
> > -			reg =3D <0 0xa4010000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		vdev1vring1: vdev1vring1@a4018000 {
> > -			reg =3D <0 0xa4018000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		rsc_table: rsc-table@2021e000 {
> > -			reg =3D <0 0x2021e000 0 0x1000>;
> > -			no-map;
> > -		};
> > -
> > -		vdevbuffer: vdevbuffer@a4020000 {
> > -			compatible =3D "shared-dma-pool";
> > -			reg =3D <0 0xa4020000 0 0x100000>;
> > -			no-map;
> > -		};
> > -
> > -	};
> > -
> > -	flexcan_phy: can-phy {
> > -		compatible =3D "nxp,tja1057";
> > -		#phy-cells =3D <0>;
> > -		max-bitrate =3D <5000000>;
> > -		silent-gpios =3D <&adp5585 6 GPIO_ACTIVE_HIGH>;
> > -	};
> > -
> > -	reg_vdd_12v: regulator-vdd-12v {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "VDD_12V";
> > -		regulator-min-microvolt =3D <12000000>;
> > -		regulator-max-microvolt =3D <12000000>;
> > -		gpio =3D <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -	};
> > -
> > -	reg_vref_1v8: regulator-adc-vref {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "vref_1v8";
> > -		regulator-min-microvolt =3D <1800000>;
> > -		regulator-max-microvolt =3D <1800000>;
> > -	};
> > -
> > -	reg_audio_pwr: regulator-audio-pwr {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "audio-pwr";
> > -		regulator-min-microvolt =3D <3300000>;
> > -		regulator-max-microvolt =3D <3300000>;
> > -		gpio =3D <&adp5585 1 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -	};
> > -
> > -	reg_m2_pwr: regulator-m2-pwr {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "M.2-power";
> > -		regulator-min-microvolt =3D <3300000>;
> > -		regulator-max-microvolt =3D <3300000>;
> > -		gpio =3D <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -	};
> > -
> > -	reg_usdhc2_vmmc: regulator-usdhc2 {
> > -		compatible =3D "regulator-fixed";
> > -		pinctrl-names =3D "default";
> > -		pinctrl-0 =3D <&pinctrl_reg_usdhc2_vmmc>;
> > -		regulator-name =3D "VSD_3V3";
> > -		regulator-min-microvolt =3D <3300000>;
> > -		regulator-max-microvolt =3D <3300000>;
> > -		gpio =3D <&gpio3 7 GPIO_ACTIVE_HIGH>;
> > -		off-on-delay-us =3D <12000>;
> > -		enable-active-high;
> > -	};
> > -
> > -	reg_usdhc3_vmmc: regulator-usdhc3 {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "WLAN_EN";
> > -		regulator-min-microvolt =3D <3300000>;
> > -		regulator-max-microvolt =3D <3300000>;
> > -		vin-supply =3D <&reg_m2_pwr>;
> > -		gpio =3D <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> > -		/*
> > -		 * IW612 wifi chip needs more delay than other wifi chips to
> complete
> > -		 * the host interface initialization after power up, otherwise
> the
> > -		 * internal state of IW612 may be unstable, resulting in the
> failure of
> > -		 * the SDIO3.0 switch voltage.
> > -		 */
> > -		startup-delay-us =3D <20000>;
> > -		enable-active-high;
> > -	};
> > -
> > -	usdhc3_pwrseq: usdhc3_pwrseq {
> > -		compatible =3D "mmc-pwrseq-simple";
> > -		reset-gpios =3D <&pcal6524 12 GPIO_ACTIVE_LOW>;
> > -	};
> > -
> > -	backlight_lvds: backlight-lvds {
> > -		compatible =3D "pwm-backlight";
> > -		pwms =3D <&adp5585 0 100000 0>;
> > -		brightness-levels =3D <0 100>;
> > -		num-interpolated-steps =3D <100>;
> > -		default-brightness-level =3D <100>;
> > -		power-supply =3D <&reg_vdd_12v>;
> > -		enable-gpios =3D <&adp5585 9 GPIO_ACTIVE_HIGH>;
> > -		status =3D "disabled";
> > -	};
> > -
> > -	bt_sco_codec: bt-sco-codec {
> > -		compatible =3D "linux,bt-sco";
> > -		#sound-dai-cells =3D <1>;
> > -	};
> > -
> > -	sound-bt-sco {
> > -		compatible =3D "simple-audio-card";
> > -		simple-audio-card,name =3D "bt-sco-audio";
> > -		simple-audio-card,format =3D "dsp_a";
> > -		simple-audio-card,bitclock-inversion;
> > -		simple-audio-card,frame-master =3D <&btcpu>;
> > -		simple-audio-card,bitclock-master =3D <&btcpu>;
> > -
> > -		btcpu: simple-audio-card,cpu {
> > -			sound-dai =3D <&sai1>;
> > -			dai-tdm-slot-num =3D <2>;
> > -			dai-tdm-slot-width =3D <16>;
> > -		};
> > -
> > -		simple-audio-card,codec {
> > -			sound-dai =3D <&bt_sco_codec 1>;
> > -		};
> > -	};
> > -
> > -	sound-micfil {
> > -		compatible =3D "fsl,imx-audio-card";
> > -		model =3D "micfil-audio";
> > -
> > -		pri-dai-link {
> > -			link-name =3D "micfil hifi";
> > -			format =3D "i2s";
> > -
> > -			cpu {
> > -				sound-dai =3D <&micfil>;
> > -			};
> > -		};
> > -	};
> > -
> > -	sound-wm8962 {
> > -		compatible =3D "fsl,imx-audio-wm8962";
> > -		model =3D "wm8962-audio";
> > -		audio-cpu =3D <&sai3>;
> > -		audio-codec =3D <&wm8962>;
> > -		hp-det-gpio =3D <&pcal6524 4 GPIO_ACTIVE_HIGH>;
> > -		audio-routing =3D
> > -			"Headphone Jack", "HPOUTL",
> > -			"Headphone Jack", "HPOUTR",
> > -			"Ext Spk", "SPKOUTL",
> > -			"Ext Spk", "SPKOUTR",
> > -			"AMIC", "MICBIAS",
> > -			"IN3R", "AMIC",
> > -			"IN1R", "AMIC";
> > -	};
> > -
> > -	sound-xcvr {
> > -		compatible =3D "fsl,imx-audio-card";
> > -		model =3D "imx-audio-xcvr";
> > -
> > -		pri-dai-link {
> > -			link-name =3D "XCVR PCM";
> > -
> > -			cpu {
> > -				sound-dai =3D <&xcvr>;
> > -			};
> > -		};
> > -	};
> > -};
> > -
> > -&adc1 {
> > -	vref-supply =3D <&reg_vref_1v8>;
> > -	status =3D "okay";
> > -};
> > -
> > -&cm33 {
> > -	mbox-names =3D "tx", "rx", "rxdb";
> > -	mboxes =3D <&mu1 0 1>,
> > -		 <&mu1 1 1>,
> > -		 <&mu1 3 1>;
> > -	memory-region =3D <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> > -			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> > -	status =3D "okay";
> > -};
> > -
> > -&eqos {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_eqos>;
> > -	pinctrl-1 =3D <&pinctrl_eqos_sleep>;
> > -	phy-mode =3D "rgmii-id";
> > -	phy-handle =3D <&ethphy1>;
> > -	status =3D "okay";
> > -
> > -	mdio {
> > -		compatible =3D "snps,dwmac-mdio";
> > -		#address-cells =3D <1>;
> > -		#size-cells =3D <0>;
> > -		clock-frequency =3D <5000000>;
> > -
> > -		ethphy1: ethernet-phy@1 {
> > -			reg =3D <1>;
> > -			reset-gpios =3D <&pcal6524 15 GPIO_ACTIVE_LOW>;
> > -			reset-assert-us =3D <10000>;
> > -			reset-deassert-us =3D <80000>;
> > -			realtek,clkout-disable;
> > -		};
> > -	};
> > -};
> > -
> > -&fec {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_fec>;
> > -	pinctrl-1 =3D <&pinctrl_fec_sleep>;
> > -	phy-mode =3D "rgmii-id";
> > -	phy-handle =3D <&ethphy2>;
> > -	fsl,magic-packet;
> > -	status =3D "okay";
> > -
> > -	mdio {
> > -		#address-cells =3D <1>;
> > -		#size-cells =3D <0>;
> > -		clock-frequency =3D <5000000>;
> > -
> > -		ethphy2: ethernet-phy@2 {
> > -			reg =3D <2>;
> > -			reset-gpios =3D <&pcal6524 16 GPIO_ACTIVE_LOW>;
> > -			reset-assert-us =3D <10000>;
> > -			reset-deassert-us =3D <80000>;
> > -			realtek,clkout-disable;
> > -		};
> > -	};
> > -};
> > -
> > -&flexcan2 {
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_flexcan2>;
> > -	phys =3D <&flexcan_phy>;
> > -	status =3D "okay";
> > -};
> > -
> > -&lpi2c1 {
> > -	clock-frequency =3D <400000>;
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_lpi2c1>;
> > -	status =3D "okay";
> > -
> > -	wm8962: codec@1a {
> > -		compatible =3D "wlf,wm8962";
> > -		reg =3D <0x1a>;
> > -		clocks =3D <&clk IMX93_CLK_SAI3_GATE>;
> > -		DCVDD-supply =3D <&reg_audio_pwr>;
> > -		DBVDD-supply =3D <&reg_audio_pwr>;
> > -		AVDD-supply =3D <&reg_audio_pwr>;
> > -		CPVDD-supply =3D <&reg_audio_pwr>;
> > -		MICVDD-supply =3D <&reg_audio_pwr>;
> > -		PLLVDD-supply =3D <&reg_audio_pwr>;
> > -		SPKVDD1-supply =3D <&reg_audio_pwr>;
> > -		SPKVDD2-supply =3D <&reg_audio_pwr>;
> > -		gpio-cfg =3D <
> > -			0x0000 /* 0:Default */
> > -			0x0000 /* 1:Default */
> > -			0x0000 /* 2:FN_DMICCLK */
> > -			0x0000 /* 3:Default */
> > -			0x0000 /* 4:FN_DMICCDAT */
> > -			0x0000 /* 5:Default */
> > -		>;
> > -	};
> > -
> > -	inertial-meter@6a {
> > -		compatible =3D "st,lsm6dso";
> > -		reg =3D <0x6a>;
> > -	};
> > -};
> > -
> > -&lpi2c2 {
> > -	clock-frequency =3D <400000>;
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_lpi2c2>;
> > -	status =3D "okay";
> > -
> > -	pcal6524: gpio@22 {
> > -		compatible =3D "nxp,pcal6524";
> > -		reg =3D <0x22>;
> > -		pinctrl-names =3D "default";
> > -		pinctrl-0 =3D <&pinctrl_pcal6524>;
> > -		gpio-controller;
> > -		#gpio-cells =3D <2>;
> > -		interrupt-controller;
> > -		#interrupt-cells =3D <2>;
> > -		interrupt-parent =3D <&gpio3>;
> > -		interrupts =3D <27 IRQ_TYPE_LEVEL_LOW>;
> > -
> > -		m2-pcm-level-shifter-hog {
> > -			gpio-hog;
> > -			gpios =3D <19 GPIO_ACTIVE_HIGH>;
> > -			output-high;
> > -		};
> > -	};
> > -
> > -	pmic@25 {
> > -		compatible =3D "nxp,pca9451a";
> > -		reg =3D <0x25>;
> > -		interrupt-parent =3D <&pcal6524>;
> > -		interrupts =3D <11 IRQ_TYPE_EDGE_FALLING>;
> > -
> > -		regulators {
> > -			buck1: BUCK1 {
> > -				regulator-name =3D "BUCK1";
> > -				regulator-min-microvolt =3D <610000>;
> > -				regulator-max-microvolt =3D <950000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -				regulator-ramp-delay =3D <3125>;
> > -			};
> > -
> > -			buck2: BUCK2 {
> > -				regulator-name =3D "BUCK2";
> > -				regulator-min-microvolt =3D <600000>;
> > -				regulator-max-microvolt =3D <670000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -				regulator-ramp-delay =3D <3125>;
> > -			};
> > -
> > -			buck4: BUCK4 {
> > -				regulator-name =3D "BUCK4";
> > -				regulator-min-microvolt =3D <1620000>;
> > -				regulator-max-microvolt =3D <3400000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -
> > -			buck5: BUCK5 {
> > -				regulator-name =3D "BUCK5";
> > -				regulator-min-microvolt =3D <1620000>;
> > -				regulator-max-microvolt =3D <3400000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -
> > -			buck6: BUCK6 {
> > -				regulator-name =3D "BUCK6";
> > -				regulator-min-microvolt =3D <1060000>;
> > -				regulator-max-microvolt =3D <1140000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -
> > -			ldo1: LDO1 {
> > -				regulator-name =3D "LDO1";
> > -				regulator-min-microvolt =3D <1620000>;
> > -				regulator-max-microvolt =3D <1980000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -
> > -			ldo4: LDO4 {
> > -				regulator-name =3D "LDO4";
> > -				regulator-min-microvolt =3D <800000>;
> > -				regulator-max-microvolt =3D <840000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -
> > -			ldo5: LDO5 {
> > -				regulator-name =3D "LDO5";
> > -				regulator-min-microvolt =3D <1800000>;
> > -				regulator-max-microvolt =3D <3300000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -		};
> > -	};
> > -
> > -	adp5585: io-expander@34 {
> > -		compatible =3D "adi,adp5585-00", "adi,adp5585";
> > -		reg =3D <0x34>;
> > -		vdd-supply =3D <&buck4>;
> > -		gpio-controller;
> > -		#gpio-cells =3D <2>;
> > -		gpio-reserved-ranges =3D <5 1>;
> > -		#pwm-cells =3D <3>;
> > -	};
> > -};
> > -
> > -&lpi2c3 {
> > -	clock-frequency =3D <400000>;
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_lpi2c3>;
> > -	status =3D "okay";
> > -
> > -	adp5585_isp: io-expander@34 {
> > -		compatible =3D "adi,adp5585-01", "adi,adp5585";
> > -		reg =3D <0x34>;
> > -		gpio-controller;
> > -		#gpio-cells =3D <2>;
> > -		#pwm-cells =3D <3>;
> > -	};
> > -
> > -	ptn5110: tcpc@50 {
> > -		compatible =3D "nxp,ptn5110", "tcpci";
> > -		reg =3D <0x50>;
> > -		interrupt-parent =3D <&gpio3>;
> > -		interrupts =3D <27 IRQ_TYPE_LEVEL_LOW>;
> > -
> > -		typec1_con: connector {
> > -			compatible =3D "usb-c-connector";
> > -			label =3D "USB-C";
> > -			power-role =3D "dual";
> > -			data-role =3D "dual";
> > -			try-power-role =3D "sink";
> > -			source-pdos =3D <PDO_FIXED(5000, 3000,
> PDO_FIXED_USB_COMM)>;
> > -			sink-pdos =3D <PDO_FIXED(5000, 3000,
> PDO_FIXED_USB_COMM)
> > -				     PDO_VAR(5000, 20000, 3000)>;
> > -			op-sink-microwatt =3D <15000000>;
> > -			self-powered;
> > -
> > -			ports {
> > -				#address-cells =3D <1>;
> > -				#size-cells =3D <0>;
> > -
> > -				port@0 {
> > -					reg =3D <0>;
> > -
> > -					typec1_dr_sw: endpoint {
> > -						remote-endpoint =3D
> <&usb1_drd_sw>;
> > -					};
> > -				};
> > -			};
> > -		};
> > -	};
> > -
> > -	ptn5110_2: tcpc@51 {
> > -		compatible =3D "nxp,ptn5110", "tcpci";
> > -		reg =3D <0x51>;
> > -		interrupt-parent =3D <&gpio3>;
> > -		interrupts =3D <27 IRQ_TYPE_LEVEL_LOW>;
> > -
> > -		typec2_con: connector {
> > -			compatible =3D "usb-c-connector";
> > -			label =3D "USB-C";
> > -			power-role =3D "dual";
> > -			data-role =3D "dual";
> > -			try-power-role =3D "sink";
> > -			source-pdos =3D <PDO_FIXED(5000, 3000,
> PDO_FIXED_USB_COMM)>;
> > -			sink-pdos =3D <PDO_FIXED(5000, 3000,
> PDO_FIXED_USB_COMM)
> > -				     PDO_VAR(5000, 20000, 3000)>;
> > -			op-sink-microwatt =3D <15000000>;
> > -			self-powered;
> > -
> > -			ports {
> > -				#address-cells =3D <1>;
> > -				#size-cells =3D <0>;
> > -
> > -				port@0 {
> > -					reg =3D <0>;
> > -
> > -					typec2_dr_sw: endpoint {
> > -						remote-endpoint =3D
> <&usb2_drd_sw>;
> > -					};
> > -				};
> > -			};
> > -		};
> > -	};
> > -
> > -	pcf2131: rtc@53 {
> > -		compatible =3D "nxp,pcf2131";
> > -		reg =3D <0x53>;
> > -		interrupt-parent =3D <&pcal6524>;
> > -		interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
> > -	};
> > -};
> > -
> > -&lpuart1 { /* console */
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_uart1>;
> > -	status =3D "okay";
> > -};
> > -
> > -&lpuart5 {
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_uart5>;
> > -	status =3D "okay";
> > -
> > -	bluetooth {
> > -		compatible =3D "nxp,88w8987-bt";
> > -	};
> > -};
> > -
> > -&micfil {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_pdm>;
> > -	pinctrl-1 =3D <&pinctrl_pdm_sleep>;
> > -	assigned-clocks =3D <&clk IMX93_CLK_PDM>;
> > -	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > -	assigned-clock-rates =3D <49152000>;
> > -	status =3D "okay";
> > -};
> > -
> > -&mu1 {
> > -	status =3D "okay";
> > -};
> > -
> > -&mu2 {
> > -	status =3D "okay";
> > -};
> > -
> > -&sai1 {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_sai1>;
> > -	pinctrl-1 =3D <&pinctrl_sai1_sleep>;
> > -	assigned-clocks =3D <&clk IMX93_CLK_SAI1>;
> > -	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > -	assigned-clock-rates =3D <12288000>;
> > -	fsl,sai-mclk-direction-output;
> > -	status =3D "okay";
> > -};
> > -
> > -&sai3 {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_sai3>;
> > -	pinctrl-1 =3D <&pinctrl_sai3_sleep>;
> > -	assigned-clocks =3D <&clk IMX93_CLK_SAI3>;
> > -	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > -	assigned-clock-rates =3D <12288000>;
> > -	fsl,sai-mclk-direction-output;
> > -	status =3D "okay";
> > -};
> > -
> > -&usbotg1 {
> > -	dr_mode =3D "otg";
> > -	hnp-disable;
> > -	srp-disable;
> > -	adp-disable;
> > -	usb-role-switch;
> > -	disable-over-current;
> > -	samsung,picophy-pre-emp-curr-control =3D <3>;
> > -	samsung,picophy-dc-vol-level-adjust =3D <7>;
> > -	status =3D "okay";
> > -
> > -	port {
> > -		usb1_drd_sw: endpoint {
> > -			remote-endpoint =3D <&typec1_dr_sw>;
> > -		};
> > -	};
> > -};
> > -
> > -&usbotg2 {
> > -	dr_mode =3D "otg";
> > -	hnp-disable;
> > -	srp-disable;
> > -	adp-disable;
> > -	usb-role-switch;
> > -	disable-over-current;
> > -	samsung,picophy-pre-emp-curr-control =3D <3>;
> > -	samsung,picophy-dc-vol-level-adjust =3D <7>;
> > -	status =3D "okay";
> > -
> > -	port {
> > -		usb2_drd_sw: endpoint {
> > -			remote-endpoint =3D <&typec2_dr_sw>;
> > -		};
> > -	};
> > -};
> > -
> > -&usdhc1 {
> > -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > -	pinctrl-0 =3D <&pinctrl_usdhc1>;
> > -	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>;
> > -	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>;
> > -	bus-width =3D <8>;
> > -	non-removable;
> > -	status =3D "okay";
> > -};
> > -
> > -&usdhc2 {
> > -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > -	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> > -	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> > -	pinctrl-3 =3D <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> > -	cd-gpios =3D <&gpio3 00 GPIO_ACTIVE_LOW>;
> > -	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> > -	bus-width =3D <4>;
> > -	status =3D "okay";
> > -	no-mmc;
> > -};
> > -
> > -&usdhc3 {
> > -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> > -	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> > -	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> > -	pinctrl-3 =3D <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> > -	mmc-pwrseq =3D <&usdhc3_pwrseq>;
> > -	vmmc-supply =3D <&reg_usdhc3_vmmc>;
> > -	bus-width =3D <4>;
> > -	keep-power-in-suspend;
> > -	non-removable;
> > -	wakeup-source;
> > -	status =3D "okay";
> > -};
> > -
> > -&wdog3 {
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_wdog>;
> > -	fsl,ext-reset-output;
> > -	status =3D "okay";
> > -};
> > -
> > -&xcvr {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_spdif>;
> > -	pinctrl-1 =3D <&pinctrl_spdif_sleep>;
> > -	assigned-clocks =3D <&clk IMX93_CLK_SPDIF>,
> > -			 <&clk IMX93_CLK_AUDIO_XCVR>;
> > -	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>,
> > -			 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> > -	assigned-clock-rates =3D <12288000>, <200000000>;
> > -	status =3D "okay";
> > -};
> > -
> > -&iomuxc {
> > -	pinctrl_eqos: eqosgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_ENET1_MDC__ENET_QOS_MDC
> 		0x57e
> > -			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO
> 		0x57e
> > -			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0
> 			0x57e
> > -			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1
> 			0x57e
> > -			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2
> 			0x57e
> > -			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3
> 			0x57e
> > -
> 	MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CL
> K	0x58e
> > -
> 	MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL
> 	0x57e
> > -			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0
> 			0x57e
> > -			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1
> 			0x57e
> > -			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2
> 			0x57e
> > -			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3
> 			0x57e
> > -
> 	MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CL
> K	0x58e
> > -
> 	MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL
> 	0x57e
> > -		>;
> > -	};
> > -
> > -	pinctrl_eqos_sleep: eqossleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_ENET1_MDC__GPIO4_IO00
> 		0x31e
> > -			MX93_PAD_ENET1_MDIO__GPIO4_IO01
> 			0x31e
> > -			MX93_PAD_ENET1_RD0__GPIO4_IO10
> 0x31e
> > -			MX93_PAD_ENET1_RD1__GPIO4_IO11
> 		0x31e
> > -			MX93_PAD_ENET1_RD2__GPIO4_IO12
> 		0x31e
> > -			MX93_PAD_ENET1_RD3__GPIO4_IO13
> 		0x31e
> > -			MX93_PAD_ENET1_RXC__GPIO4_IO09
> 0x31e
> > -			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08
> 		0x31e
> > -			MX93_PAD_ENET1_TD0__GPIO4_IO05
> 0x31e
> > -			MX93_PAD_ENET1_TD1__GPIO4_IO04
> 0x31e
> > -			MX93_PAD_ENET1_TD2__GPIO4_IO03
> 		0x31e
> > -			MX93_PAD_ENET1_TD3__GPIO4_IO02
> 		0x31e
> > -			MX93_PAD_ENET1_TXC__GPIO4_IO07
> 0x31e
> > -			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06
> 0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_fec: fecgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_ENET2_MDC__ENET1_MDC
> 		0x57e
> > -			MX93_PAD_ENET2_MDIO__ENET1_MDIO
> 		0x57e
> > -			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0
> 	0x57e
> > -			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1
> 	0x57e
> > -			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2
> 	0x57e
> > -			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3
> 	0x57e
> > -			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC
> 	0x58e
> > -			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL
> 	0x57e
> > -			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0
> 	0x57e
> > -			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1
> 	0x57e
> > -			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2
> 	0x57e
> > -			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3
> 	0x57e
> > -			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC
> 	0x58e
> > -			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL
> 	0x57e
> > -		>;
> > -	};
> > -
> > -	pinctrl_fec_sleep: fecsleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_ENET2_MDC__GPIO4_IO14
> 	0x51e
> > -			MX93_PAD_ENET2_MDIO__GPIO4_IO15
> 		0x51e
> > -			MX93_PAD_ENET2_RD0__GPIO4_IO24
> 	0x51e
> > -			MX93_PAD_ENET2_RD1__GPIO4_IO25
> 	0x51e
> > -			MX93_PAD_ENET2_RD2__GPIO4_IO26
> 	0x51e
> > -			MX93_PAD_ENET2_RD3__GPIO4_IO27
> 	0x51e
> > -			MX93_PAD_ENET2_RXC__GPIO4_IO23
> 0x51e
> > -			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22
> 	0x51e
> > -			MX93_PAD_ENET2_TD0__GPIO4_IO19
> 	0x51e
> > -			MX93_PAD_ENET2_TD1__GPIO4_IO18
> 	0x51e
> > -			MX93_PAD_ENET2_TD2__GPIO4_IO17
> 	0x51e
> > -			MX93_PAD_ENET2_TD3__GPIO4_IO16
> 	0x51e
> > -			MX93_PAD_ENET2_TXC__GPIO4_IO21
> 0x51e
> > -			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20
> 0x51e
> > -		>;
> > -	};
> > -
> > -	pinctrl_flexcan2: flexcan2grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO25__CAN2_TX	0x139e
> > -			MX93_PAD_GPIO_IO27__CAN2_RX	0x139e
> > -		>;
> > -	};
> > -
> > -	pinctrl_uart1: uart1grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_UART1_RXD__LPUART1_RX
> 	0x31e
> > -			MX93_PAD_UART1_TXD__LPUART1_TX
> 	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_uart5: uart5grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX
> 		0x31e
> > -			MX93_PAD_DAP_TDI__LPUART5_RX
> 	0x31e
> > -			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B
> 		0x31e
> > -			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B
> 		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_lpi2c1: lpi2c1grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_I2C1_SCL__LPI2C1_SCL
> 	0x40000b9e
> > -			MX93_PAD_I2C1_SDA__LPI2C1_SDA
> 	0x40000b9e
> > -		>;
> > -	};
> > -
> > -	pinctrl_lpi2c2: lpi2c2grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_I2C2_SCL__LPI2C2_SCL
> 	0x40000b9e
> > -			MX93_PAD_I2C2_SDA__LPI2C2_SDA
> 	0x40000b9e
> > -		>;
> > -	};
> > -
> > -	pinctrl_lpi2c3: lpi2c3grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO28__LPI2C3_SDA
> 	0x40000b9e
> > -			MX93_PAD_GPIO_IO29__LPI2C3_SCL
> 	0x40000b9e
> > -		>;
> > -	};
> > -
> > -	pinctrl_pcal6524: pcal6524grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_CCM_CLKO2__GPIO3_IO27
> 	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_pdm: pdmgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_PDM_CLK__PDM_CLK
> 	0x31e
> > -
> 	MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> > -
> 	MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_pdm_sleep: pdmsleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_PDM_CLK__GPIO1_IO08
> 	0x31e
> > -			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09
> 	0x31e
> > -			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10
> 	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_sai1: sai1grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK
> 	0x31e
> > -			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> > -			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00
> 	0x31e
> > -			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00
> 	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_sai1_sleep: sai1sleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> > -			MX93_PAD_SAI1_TXFS__GPIO1_IO11
> 	0x51e
> > -			MX93_PAD_SAI1_TXD0__GPIO1_IO13
> 	0x51e
> > -			MX93_PAD_SAI1_RXD0__GPIO1_IO14
> 	0x51e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc1: usdhc1grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD1_CLK__USDHC1_CLK
> 	0x1582
> > -			MX93_PAD_SD1_CMD__USDHC1_CMD
> 	0x40001382
> > -			MX93_PAD_SD1_DATA0__USDHC1_DATA0
> 	0x40001382
> > -			MX93_PAD_SD1_DATA1__USDHC1_DATA1
> 	0x40001382
> > -			MX93_PAD_SD1_DATA2__USDHC1_DATA2
> 	0x40001382
> > -			MX93_PAD_SD1_DATA3__USDHC1_DATA3
> 	0x40001382
> > -			MX93_PAD_SD1_DATA4__USDHC1_DATA4
> 	0x40001382
> > -			MX93_PAD_SD1_DATA5__USDHC1_DATA5
> 	0x40001382
> > -			MX93_PAD_SD1_DATA6__USDHC1_DATA6
> 	0x40001382
> > -			MX93_PAD_SD1_DATA7__USDHC1_DATA7
> 	0x40001382
> > -			MX93_PAD_SD1_STROBE__USDHC1_STROBE
> 	0x1582
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD1_CLK__USDHC1_CLK
> 	0x158e
> > -			MX93_PAD_SD1_CMD__USDHC1_CMD
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA0__USDHC1_DATA0
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA1__USDHC1_DATA1
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA2__USDHC1_DATA2
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA3__USDHC1_DATA3
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA4__USDHC1_DATA4
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA5__USDHC1_DATA5
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA6__USDHC1_DATA6
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA7__USDHC1_DATA7
> 	0x4000138e
> > -			MX93_PAD_SD1_STROBE__USDHC1_STROBE
> 	0x158e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD1_CLK__USDHC1_CLK
> 	0x15fe
> > -			MX93_PAD_SD1_CMD__USDHC1_CMD
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA0__USDHC1_DATA0
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA1__USDHC1_DATA1
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA2__USDHC1_DATA2
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA3__USDHC1_DATA3
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA4__USDHC1_DATA4
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA5__USDHC1_DATA5
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA6__USDHC1_DATA6
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA7__USDHC1_DATA7
> 	0x400013fe
> > -			MX93_PAD_SD1_STROBE__USDHC1_STROBE
> 	0x15fe
> > -		>;
> > -	};
> > -
> > -	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_sai3: sai3grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO26__SAI3_TX_SYNC
> 0x31e
> > -			MX93_PAD_GPIO_IO16__SAI3_TX_BCLK
> 0x31e
> > -			MX93_PAD_GPIO_IO17__SAI3_MCLK           0x31e
> > -			MX93_PAD_GPIO_IO19__SAI3_TX_DATA00
> 0x31e
> > -			MX93_PAD_GPIO_IO20__SAI3_RX_DATA00
> 0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_sai3_sleep: sai3sleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO26__GPIO2_IO26
> 	0x51e
> > -			MX93_PAD_GPIO_IO16__GPIO2_IO16
> 	0x51e
> > -			MX93_PAD_GPIO_IO17__GPIO2_IO17
> 	0x51e
> > -			MX93_PAD_GPIO_IO19__GPIO2_IO19
> 	0x51e
> > -			MX93_PAD_GPIO_IO20__GPIO2_IO20
> 	0x51e
> > -		>;
> > -	};
> > -
> > -	pinctrl_spdif: spdifgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO22__SPDIF_IN		0x31e
> > -			MX93_PAD_GPIO_IO23__SPDIF_OUT		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_spdif_sleep: spdifsleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO22__GPIO2_IO22		0x31e
> > -			MX93_PAD_GPIO_IO23__GPIO2_IO23		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc2: usdhc2grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CLK__USDHC2_CLK
> 	0x1582
> > -			MX93_PAD_SD2_CMD__USDHC2_CMD
> 	0x40001382
> > -			MX93_PAD_SD2_DATA0__USDHC2_DATA0
> 	0x40001382
> > -			MX93_PAD_SD2_DATA1__USDHC2_DATA1
> 	0x40001382
> > -			MX93_PAD_SD2_DATA2__USDHC2_DATA2
> 	0x40001382
> > -			MX93_PAD_SD2_DATA3__USDHC2_DATA3
> 	0x40001382
> > -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CLK__USDHC2_CLK
> 	0x158e
> > -			MX93_PAD_SD2_CMD__USDHC2_CMD
> 	0x4000138e
> > -			MX93_PAD_SD2_DATA0__USDHC2_DATA0
> 	0x4000138e
> > -			MX93_PAD_SD2_DATA1__USDHC2_DATA1
> 	0x4000138e
> > -			MX93_PAD_SD2_DATA2__USDHC2_DATA2
> 	0x4000138e
> > -			MX93_PAD_SD2_DATA3__USDHC2_DATA3
> 	0x4000138e
> > -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CLK__USDHC2_CLK
> 	0x15fe
> > -			MX93_PAD_SD2_CMD__USDHC2_CMD
> 	0x400013fe
> > -			MX93_PAD_SD2_DATA0__USDHC2_DATA0
> 	0x400013fe
> > -			MX93_PAD_SD2_DATA1__USDHC2_DATA1
> 	0x400013fe
> > -			MX93_PAD_SD2_DATA2__USDHC2_DATA2
> 	0x400013fe
> > -			MX93_PAD_SD2_DATA3__USDHC2_DATA3
> 	0x400013fe
> > -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
> > -			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
> > -			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
> > -			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
> > -			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
> > -			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
> > -			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc3: usdhc3grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x1582
> > -			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x40001382
> > -			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x40001382
> > -			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x40001382
> > -			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x40001382
> > -			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x40001382
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x158e
> > -			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x4000138e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x15fe
> > -			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x400013fe
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> > -			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> > -			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> > -			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> > -			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> > -			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_wdog: wdoggrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY
> 	0x31e
> > -		>;
> > -	};
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> > similarity index 99%
> > copy from arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > copy to arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> > index acb160d3186c..6279b8eb4ea7 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> > @@ -1,17 +1,11 @@
> >  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >  /*
> > - * Copyright 2022 NXP
> > + * Copyright 2022,2026 NXP
> >   */
> >
> > -/dts-v1/;
> > -
> >  #include <dt-bindings/usb/pd.h>
> > -#include "imx93.dtsi"
> >
> >  / {
> > -	model =3D "NXP i.MX93 11X11 EVK board";
> > -	compatible =3D "fsl,imx93-11x11-evk", "fsl,imx93";
> > -
> >  	aliases {
> >  		ethernet0 =3D &fec;
> >  		ethernet1 =3D &eqos;
> > --
> > 2.37.1
> >
