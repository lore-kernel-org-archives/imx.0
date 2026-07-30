Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228CA372050
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 03:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785381988; cv=fail; b=nSygrO4tBTfFX4sH7cZ97Py9zMiJnUfWOJKM98vkC04LHvATjLIAeXrlHnuingoVIUPaNvXKC6ktT2vUp82E2hm6SXM9Qqoilf9h+Qk9eaSqY/FFnMdHVi0d7h6MiWaw1uM6sOkX0WB7zIJWv05EarFciWUuvXHd3IHCaOfdSI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785381988; c=relaxed/simple;
	bh=x52s7kURFe0pb8CsE/Q/2jheBHJHVW6yJn02lgnrWVk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aa556CwyT9uKuRPLjornksFieujk2X06TFcDYFOqomPc9rGzl+Pcy3Y1u9zyg7eam7gfy/xnWpz03uG9APkNnLDUPLfl+GcUXNedlJvOh44Xib70JFFA+wxJCNv4mt7Bw/rz1E7VzGq9jU/nsChH0SnwvoBjFXyYgGXHH+89PDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QFLcMGdf; arc=fail smtp.client-ip=52.101.66.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QFLcMGdf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H02OXbt/tEssIK6MYjq1DWuWMd6+fJdym5D9LyoIlIpuzVTcznC8tcfOsBtPut46X34nw5RT/7a8x+g3+KJzKTvckha5nI6legAwfYRBPsNqhvEHkYh2oqQWr4+SyllJ4oALX5XFh+1WxmmT5/++9q/CqS6XSOGsklF3X2RKKCjasp1HO9ulj7dcjBSL1J7xzPly6KFX5f4gPGO+BOL+tUz1y5ApaMAwkXMKYTjo28Z6kusSwHY5DVGLspWV2SIlFSHjF8uO9jkWf1twy+JrqlnCCLenSu054dFdf6M4o+PzN7g8M+pKWr6GDIiPsmipeT5TEZGymgMnyLwC/vA7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGtVb1gGLRbF/QehR7nTl/UiYMwAn58/O5E/f93B5dQ=;
 b=KxBoZpVvU1LvnzpVhwoPq1Tn91G8Zhi1uE/8XgNofYKoK7ybHds5dP1BmzM6+77Xt9UW2ZfobyH0B5Lbyq9JQymMR/mU+1e5rlWdcost/pmxA2DAPJXF2fyN7QLUbY388Tnczb8tMgUGSV1KY+xk1vcOxBK64fWmuGWFpZOnNtNdrPdfnvTRIpOlb5MNAza9s4DDS4UGpsdlnnYpe1Wo4MYapPKK3pNVFeXROJekAQaCnzNR8aPm3v2QSt3+lKYa1+2qlZ6u3b0EElb+SI+HrJrXAqlapiKizmy8QTy4jKeod5AYaBymUpmRLTcfXiEXlxyw/8JppOz5luZmOGVN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGtVb1gGLRbF/QehR7nTl/UiYMwAn58/O5E/f93B5dQ=;
 b=QFLcMGdfdX7s/57lS7mlXft4oYgGO4thpb8nmD0RPf9NVGLI76J+dx4MrbIK2EQWYpPnFJFt6MGvcO/QaTrumiZ3rYfB9u6m622NxigKqbvURVQT5nAGvSt+3LKQXKIMX1KDPHFE7l/c71Wouwnx/88e+7o/RSfU3kYk90tWqUPH1psgmjVumMjkoS5+ED+bxF/RDbY/uw8xzn5CuH559bHABjYWWipi9vgHZ9rOxUhi7d25MhhI3FKNpXfjedwbQgkvRIM4VktaHZsxYelx+q20LpGrUVLpzVE5yVesB2DVaVcl8ph1fZD4ZlNokugGmsYUjlZqKql1yNP44Uhxlg==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AS8PR04MB9126.eurprd04.prod.outlook.com (2603:10a6:20b:449::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Thu, 30 Jul
 2026 03:26:24 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 03:26:24 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Laurentiu Mihalcea
	<laurentiu.mihalcea@nxp.com>
Subject: RE: [PATCH v2 00/12] arm64: dts: freescale: fix reserved memory node
 names for remoteproc
Thread-Topic: [PATCH v2 00/12] arm64: dts: freescale: fix reserved memory node
 names for remoteproc
Thread-Index: AQHdH1rF6ZBW69aL+EWwrH0R4IQlHLaEuq6AgACstiA=
Date: Thu, 30 Jul 2026 03:26:24 +0000
Message-ID:
 <MRWPR04MB12330D5FC8F5B3FABF23572AF88C92@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
 <amozP57T9CUYWAmk@SMW015318>
In-Reply-To: <amozP57T9CUYWAmk@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|AS8PR04MB9126:EE_
x-ms-office365-filtering-correlation-id: 7afb31f2-7980-4d4a-c5fb-08deedea5542
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|23010399003|38070700021|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 9nSbtbkbY1Yf3uvs/hnGXfeSVBeCPta0ERce4ArTMEcc0IDaVU5rN+eshGNXPLTL4dqe0oSDBy4t3eWev1POGl4tARaR9/3VVq32b1obMAl39arpGTqmoj0wyI/uskI5gzcVJV6VuZQmETAgxafA2fLgRM00arpEyU5ksuWaUOfrlfL9cgDgsFoS1H9nH+nK8Cku4QIn0RsUIlCQFerr0BEe6FO4bQ6fd0oxXTvLreTVYwNVZyAFO+5zcbID399mkO1pFsUj8L+SqYb10r4mhd4WTNvm+tk3P9P2PE/lSvftnuyPtxRf0hCLA//cqtF+k8jgz0BjF4+Oveq/L3yuKGCqi/PVXn/AShA93dBPN/Io9fH/cjolxuIZXRb6jNiOtDB/pP1lPS3J7fR2+CE5Rycgf9y68LPi6FfFruiKc1R8hOqvoKeAXM2//MLqf8RQaC1nWZxzegfAyUYehCmCa0tfkChIkrZWj5BV5nIXbR9+pExQcpr1UErceYmHdLs2hkJuYMnpObAaVCq/2GqQU8GwIOHENmp9GpqFxIUvjNrWgeC5bKkYno/j178LTc2oQpDhpCaEgF123NuPj1fKnLydyYX3exv85GfWP9v0L+fcIIDiUL9pKPXmZujmhNaSC0t2rc+yi9ecX97V5ZvBvaFT9w0gvKtcfIXEOU5LzvSfEzkwI8XfqsA5nRWyHTP7OJODJ6D76Wwk6lQX/C8o64A8pR4QRRRUmWE2NAlvs8k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(23010399003)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5MBHvT3/JgKvL9phhRfnmZgWNeDxS2Y6VxEL5AkGYNOsUy0/5GpVOd9zUV3R?=
 =?us-ascii?Q?wMPdHcO+AVKRzRhcT3jDWh7PoFnvbxR7JE2F4HJXwzl8wHg/4ut7E8OsIdph?=
 =?us-ascii?Q?ExS2T9uBQ7++q5auH2x4CONbK39DkWSJgFqdd/hIb/QgMGj/2k1M9S7kjlJe?=
 =?us-ascii?Q?1bKX9NUodSXZJ9wEJKfSylFcCWlWkBEB/eWjGvFvzgzIsKuVuHdB/PzEOX+s?=
 =?us-ascii?Q?dHFLtWSJ7MRe27wsuSEpzkugm8nPPkzIs5fsLQ0Auaf96U072eBBtu5RmUQZ?=
 =?us-ascii?Q?26ItMWwBtnYJEgEF5YySv0RDi1IcyWC7H58LlX+1CHnG5DirK5u4qA5e0WnQ?=
 =?us-ascii?Q?PAvZp0cB8jrIePxzzsDID63TIKyjGFj/6/0mOlWGcR46n5gHcWzo+8FKBQuH?=
 =?us-ascii?Q?kJ8s2O+jDL9WXROM55WDNUjeT1v6H55vg5MCe2366o/A+FkuMhdlB5DgbTMf?=
 =?us-ascii?Q?IVEElVxIxX4tZzEFRFyCmKYg7+GpD8tUMkZ/jAaDaR6/wFAd+PojRD0QYbXm?=
 =?us-ascii?Q?KkCMPj+Onx+ryv8icV/b5r88VLyHuOU+Z6yWbuSH7yMRcZgjVUWEW1xs5ZLd?=
 =?us-ascii?Q?c8/Sl243wh+NgKEhwCBwy08HHeRhMVJCYIW7LzM7CwAkAcTYFy3Pr7Y1iOSt?=
 =?us-ascii?Q?rY82ebQkxp962tfKGE6I6lhrLbCDoiwtx4JVOo17pulGXNd4SKd9cPRG+EWz?=
 =?us-ascii?Q?jmzKGYkTafMvlnoK4RuAvZW/bv0EMoedoty7uYGeHfLTi2IkOxxUE6jHmwGQ?=
 =?us-ascii?Q?WTbl+Bvj/X+KGQgb8jQc2p+v9x+i90J0nxBQgwHOCUJZp/EdviduVyrmmne+?=
 =?us-ascii?Q?EEh8AZ1Ec/a/XFiZI2tYXkFA5pjtn6YrcIjoUlVZ5q+jb2J0oJbjvELWSyPB?=
 =?us-ascii?Q?19N4yYyDswFnc8PGDT3VDXOcCpsjXgjBPCUMhHHrbpi+oniyYL4bYnSHN4tZ?=
 =?us-ascii?Q?xn0ciXxjb9ABjft5fnjVGm0NWSnq8xG91hl66A5y+l+9NrgPBA2i7FLgkQA8?=
 =?us-ascii?Q?ifooZRr6WFgf0/NYKsXWlqiN2/nh3or81ljmnJ2J9qjMZDi8+sTVsmp/UmoV?=
 =?us-ascii?Q?Hh0zi0UKo6uMY5Lh68ebBSH5CB2nwJp/qtgBz+WmKUmF/h3yOasoEIaW3dE2?=
 =?us-ascii?Q?3iCq2Ffs0fVa6bYBfj9MfcjDVnOZuXlruwiWNEgepcK8R4M/Xlb0SV/c8FOL?=
 =?us-ascii?Q?BoEJyqpcbMPk5KRsVo+yvlWMvsI1LFOXEVhkYYQbcfHTOr/3zujis6siOk3j?=
 =?us-ascii?Q?QWXrEps0NRIbCnvPNcz680OI5xA2owMWg8xq/3iqgi1xhx4FSpw5mmm8SCd9?=
 =?us-ascii?Q?6hwWAWg9cmBC4lm9HNT1dpnzkgyf64ZsiLIFA1yuqdCMI8YrQTQFQ19NNH2R?=
 =?us-ascii?Q?V/TTGtBMnsAnIdD8gcAE5v/4k24eXbK4omC6hKNduQAUR9CFp4mx6JOr7y2J?=
 =?us-ascii?Q?Qyng433qOGrp1w/TiyXnlT2PAk+v1HY4A1BBp/f6XhzpuE/R2uf2Phq3yG4g?=
 =?us-ascii?Q?LuZn+YKJfNMGhBnGUJv3iJ4YMNzxDACmUmOfGAY71Dpj51JO0Kd56figKkQn?=
 =?us-ascii?Q?JqV7ae/JT0sRuQrJuYf9Lfi/ODqo03q2mn8ZSvtQm0Wcq6yMmEAzC8maQuPr?=
 =?us-ascii?Q?TqLHv7s+juHELJeQ0CjVqslK4QXTTBcMRfOuOPac9Wsw5Q2LQMkaEf+5MFyZ?=
 =?us-ascii?Q?AnLDPXo8lErdspDSUQjF8i0VRKZZqhBGuwMSRrvVHqDm9Mci?=
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
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afb31f2-7980-4d4a-c5fb-08deedea5542
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 03:26:24.1190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/i6xBrDxeri4LHJCuRjpbNiFYvelWfxhTql5+Da0BZAsgagXCw3sSR7jbdp0SmN36o8lNhBYIhfmRJsTUBnJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9126

> Subject: Re: [PATCH v2 00/12] arm64: dts: freescale: fix reserved
> memory node names for remoteproc
>=20
> On Wed, Jul 29, 2026 at 09:07:56PM +0800, Peng Fan (OSS) wrote:
> > The imx_rproc driver uses node names to identify reserved memory
> regions.
> > It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
> > resource table, and "vdev" prefix to filter vdev regions. Several i.MX
> > board dts files used incorrect node names (e.g. "vdevbuffer",
> > "memory-rsc-table", "memory@..."), causing the driver to fail these
> > checks.
> >
> > This series renames the reserved memory nodes across all affected
> > boards to use the expected names.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> > Changes in v2:
> > - Also fix vring, rsc-table, and dsp buffer node names in imx8dxl-evk,
> > imx8qm-mek, imx8qxp-mek
> > - Add fixes for imx8dxl-sr-som, imx93-11x11-evk, imx95-15x15-frdm
> > - Update commit messages to reflect expanded scope
> > - Link to v1:
> > https://patch.msgid.link/20260729-rproc-dts-v1-0-
> 368bca0b309f@nxp.com
>=20
> I hope Laurentiu Mihalcea's
> https://lore.kernel.org/imx/20260605113621.1479-1-
> laurentiumihalcea111@gmail.com/
>=20
> move forwards,  by use memory-region-names to fix these problem

I thought DT maintainers rejected the idea to use
memory-region-names.

Regards
Peng.

>=20
> Frank
>=20
> >
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Frank Li <Frank.Li@nxp.com>
> > To: Sascha Hauer <s.hauer@pengutronix.de>
> > To: Pengutronix Kernel Team <kernel@pengutronix.de>
> > To: Fabio Estevam <festevam@gmail.com>
> > To: Peng Fan <peng.fan@nxp.com>
> > Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> >
> > ---
> > Peng Fan (12):
> >       arm64: dts: imx8dxl-evk: fix reserved memory node names for
> remoteproc
> >       arm64: dts: imx8qm-mek: fix reserved memory node names for
> remoteproc
> >       arm64: dts: imx8qm-mek: fix dsp reserved memory node names
> for remoteproc
> >       arm64: dts: imx8qxp-mek: fix reserved memory node names for
> remoteproc
> >       arm64: dts: imx8qxp-mek: fix dsp reserved memory node names
> for remoteproc
> >       arm64: dts: imx8ulp-evk: fix reserved memory node names for
> remoteproc
> >       arm64: dts: imx93-11x11-frdm: fix reserved memory node names
> for remoteproc
> >       arm64: dts: imx93-14x14-evk: fix reserved memory node names
> for remoteproc
> >       arm64: dts: imx93-9x9-qsb: fix reserved memory node names for
> remoteproc
> >       arm64: dts: imx8dxl-sr-som: fix reserved memory node names for
> remoteproc
> >       arm64: dts: imx93-11x11-evk: fix reserved memory node names
> for remoteproc
> >       arm64: dts: imx95-15x15-frdm: fix reserved memory node names
> for
> > remoteproc
> >
> >  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      | 14 +++++-----
> >  arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi  | 14 +++++-----
> >  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 32
> +++++++++++-----------
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 20 +++++++----
> ---
> >  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  4 +--
> >  .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |  4 +--
> > arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  4 +--
> > arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |  4 +--
> >  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  4 +--
> >  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 12 ++++----
> >  10 files changed, 56 insertions(+), 56 deletions(-)
> > ---
> > base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
> > change-id: 20260728-rproc-dts-3f331df7ceaa
> >
> > Best regards,
> > --
> > Peng Fan <peng.fan@nxp.com>
> >
> >
