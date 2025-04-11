Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2058.outbound.protection.outlook.com [40.107.247.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4451D2AD14
	for <imx@lists.linux.dev>; Fri, 11 Apr 2025 01:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744335996; cv=fail; b=VFz1EGEANQYwapG1Ur6C/rHyLtJcF4oNKa9wrlqnosRn3ZgCVNIGz2EKMd7XmWh+CgKzpKLWGyrM4RVpwFxuoQzljhXeLxZjDNBitp1KmSggtORyMyUMk77EkEFjoYwJMRw1VQjAM7SaEG/5Oss/gYxRj59/qkElKIYynr4Enmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744335996; c=relaxed/simple;
	bh=NNz9K88zJoc7TpeHmxq7QDuW+Fpiz95e0UcZTY9VJ4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MehZ3CKfvO45ol7KFqd4lQAmSE7NHLoEfI0MzO28Pmf9RH85yYL0O2Uq6lc9l+YBvXCkuTaSU3pRvUs9rkixlDPOxVRN6ywuZRXryjKsZ8VhdtHjgn6wX918VOCVRfpgDVrSbhmFuTAG3DLf39j4gk4a+3nwvSPZ7WK2/q59feo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c2gD4Wg2; arc=fail smtp.client-ip=40.107.247.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c2gD4Wg2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3C8YLFLwyzil0GlnqgZmzWB7iCFPhCjlpYiSnfw3ZYThU4hUk488bLdD/pK0HLC6Ks87ElZSfDP3SAGaxRaJAfCm3wtWK+ZtJA7DXex0m0EkLt0YStGqkeEP14usRjxV+T7lIDe2xobgvQG0isidB5QlA4g4at+Zd3LabVSOfqg/nA4LDIUDQNm2Rp+dqa9X9arMwPI5+metrgMIiUUbR/nj7lqcIHrUfQiKQa0dg2RG+TG1n0mRvLQAm5Cr9S0gc3h5Swl5tmiHxPofYEXY4oJkUBCo0aPmdvVRHMK7CzrQzrGO6xZcvOFiAhc9HNA77MMb596zIp6SqIumQvvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqtLECblBGVn7TKYKxRTBFX2a3moZ0rKAs2hXcJIBZQ=;
 b=cEncF8UtwV0W9bu6m7v2Qc9qeiYMKokzL4fKHTo0m2ePyX12VEeBwvNhMUnhxQiVZ14U8rDk1KHaNG6vBHzFoIr7RFxN/2c7bHGJYuKRqj/Casy5p14KGdnXSphjqyzHRf8dzISx9+tg40MM/05N8Uczo7+Ipbb6GodaFiPl8B/aNvwzqEpgwfgb8NjpGj20g6cK857FmcQMHqWGz0EbCksQtQuVstBkRQhxvCdO9TNNEdMEXYy7h9/1Cp0lqqYH5Adx1ez9j6JWtMkyz9V/lnJvCrpWPgfoRWUtPEYnV459fOMExLVs3JPGHSr/D4Mucw/HOUgv6Ca9l49EpSKsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqtLECblBGVn7TKYKxRTBFX2a3moZ0rKAs2hXcJIBZQ=;
 b=c2gD4Wg2Y+O+z3TJ94pTD8CJ6O5360pt8lzcue3JIESEEcxEoyR/9wN+orfr2MK4v94zyQGOZnIgAXHj8cU73a4pO8EInj30sk47fLSqNEw/A5wlsYh1S8kwsdFw57obgPL/Uf/IULmBfLjgm+jm2189JM7q5MbOgYK7SLl1BHtw2cyzKOANRqibcEhLbLdNB06AZvUIowJCWrIWfyUL4bvCsqziN4IszrBX1mp6C9pSTV4uR/zUPMmQOYMwgtOkcK8VtYGNLZGdRmDOb7ZJOvhADGLpGyJFgD3ZIQXcB9/AEGIu2jEUuDvAmdSx8TsK5oa/u6rmQwiDviPV2TAbYw==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 01:46:28 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 01:46:28 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v5 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Topic: [PATCH v5 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Index: AQHbqeGctIWZNdBOiEa6Vs9ONxqbO7OdCjoAgACnk4A=
Date: Fri, 11 Apr 2025 01:46:28 +0000
Message-ID:
 <AS8PR04MB8642DF14633F13B88D959B1A87B62@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250410062826.3344545-1-ping.bai@nxp.com>
 <20250410062826.3344545-3-ping.bai@nxp.com>
 <Z/fmnHmYLF/TlTnA@lizhi-Precision-Tower-5810>
In-Reply-To: <Z/fmnHmYLF/TlTnA@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|DB9PR04MB9626:EE_
x-ms-office365-filtering-correlation-id: 20d2ec2b-cf67-4e1b-250d-08dd789aad6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9aY+p0KUJI8EeRBN/oyvickFyI3jjAFrrqXuMXZskvbN5/p7BfdCk3ekGbiM?=
 =?us-ascii?Q?nMUYdVZgWYA4WBQ51xM8Br2aBp82EHb2v7OXYEfS8IAoiLg4P8Xe9fhMsgBp?=
 =?us-ascii?Q?ezetbI3FG67AVB84ojrK7rr0/hbRIy7+Xzg9wy5I7YYKS0ZbOJbavbK14SxD?=
 =?us-ascii?Q?FdXkInQfCwYgC67cI1Z5oZlU/Ummw0NnFqs8zB0QoN1eDQQDNkb51aDq424J?=
 =?us-ascii?Q?k6C1XEh6RWnn9f3yVSpZC1RqxVMvHu+AQwJPyyJIkmQPRKzo/XLS5tR9Jiyt?=
 =?us-ascii?Q?1ZVS2dHsvAL5MNbBbmKMDcCM/jJjf3yDISvvEF4IIZo4buf0v0L8nzPmavkL?=
 =?us-ascii?Q?LJLeWm6cyvUaYc5w34yHTrC7dHXAjD+ngqyArH+TOnJgCABpIJJyt/eQjgjd?=
 =?us-ascii?Q?Ob07yMvLx7wF5NKFCN3K4JKn7PshDkfYAQtCL2alaRNtx1eH7J9ChdiW/tvZ?=
 =?us-ascii?Q?NVSVJnzgIQQVs0cfEQXb8Xh4D8/UeiJzkaF5wqEnN8jFPmoKZQzK6UpbBDTU?=
 =?us-ascii?Q?xbW/70H9bPf7DWt+LbNk302ihtn61F/yuHHyED8b2v6hV8dGi9riu7KZ95yg?=
 =?us-ascii?Q?VsuJMkUiTHgt0exxpZqy2BJoJIkCGqKRV2TWdvIm3Yy/DK6E68KvWxq7wqbC?=
 =?us-ascii?Q?7YkISgKlP/o/Q5/bhVGXz3K1bw6sZEXQf5QmzmTtsABC8TNvALkY09FMgJfT?=
 =?us-ascii?Q?fxx5+PppX+MSNeOfqz3HrmxKqB4XIDK/H8b+/Qw7gHjvP666AfgWUSvc/kQ5?=
 =?us-ascii?Q?9JFTYpL54f+NSsCwb3Cx/c4zdDiYGf63noO/FnpTcLhI6cWM9tpfIENUqIij?=
 =?us-ascii?Q?o4uGHKjzovLn/bmd1h7bZbmegqf3izvncoSJs+CUtul/D4GsKQu9Wxn3MDId?=
 =?us-ascii?Q?dJdrVlbqaSNFG8lHAk9gbB5Bkki2XVPFtOP/OvSbA55FRa/GKg5amRbMmXVp?=
 =?us-ascii?Q?bgQaO0NLxFIMYBrsRwNxg/8WoDqZ5QTIXhl3Vkb/8JNDJdVQCqfmLX9ZblSb?=
 =?us-ascii?Q?k2yM8WOeRQDxJhA9OPbz+5mj53DjlConn8306Xsk2P9JSGZfp1PrgTYLwosb?=
 =?us-ascii?Q?TlCRHp1qKN3nU4MGVDg1QK5272C6Rw7s31Rkejz9CImf9z5GaGmAENwxolGR?=
 =?us-ascii?Q?i7PqfAjiVGBWIgXCGUacrWca4LpBB1aP/fkv/nz4xP3XOruHVxQPVFMhYXeJ?=
 =?us-ascii?Q?dvWDJCjZ8i4ToZ2Yb9rU/KTAtQTlbLUzQitIjzCplu1JMCsyh6RQ6ZrwKX5z?=
 =?us-ascii?Q?hkiBaUXPysaNaTIf2REo1tFp90MYuMoVqGykmMLxeg6YAZEv6ASJkeW+FYYJ?=
 =?us-ascii?Q?9NHUaV7NjjwGbNKP9ZkxVqff0VO4oTCk/2wsklMY2lYPhjlMkUq6rOWCKPni?=
 =?us-ascii?Q?0/OsLXojAkJ1m9dx6TSdmCTIphbctIqcHWXEih+hw2dk8fPjvt16KP82omDe?=
 =?us-ascii?Q?231S2dio+KkvxBvcJtSg3Z4Lu3rZr47u?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6NvAEiwFGpaaam+hg6UtPeIN9DPko7Q9EGIx3vllxld06o7AHueC1nLd26Rn?=
 =?us-ascii?Q?CPtcJPcsEwEtQ4jEhBh56kc1saz/GPo1Ule5LurJDNODa1hZNoF4IZ8pMe0b?=
 =?us-ascii?Q?MVtEtxmd6lj946AZPm/ZN15R/h3v5KGE2otuuB+fUDLrEm9WpvidvUycGbSP?=
 =?us-ascii?Q?Jyzeip3lSZHFEW+s2l63roHuMkrw+VZSLDVCWWq+OdaQ9xa/se/2LU87ci5A?=
 =?us-ascii?Q?cPrwDrYdJ6tYPkMnEcDlkzgLg6gFw+bivZiJn5Z1BsXuwHbh/C4Oq3tqGswk?=
 =?us-ascii?Q?usgmASdWdPUFe39oMLHjAUJyahdVegrSmJQMvB8jhy01pUvuTG+JJjyQdTJU?=
 =?us-ascii?Q?1qnoGvbWf0Yhk5pz7xRNPVylhB0mluV7Ec4dYv7iXg+oUvF3joSjbxEnG4AG?=
 =?us-ascii?Q?u1MsfetyKo9Au1DixbflMseH129pdlIA6TyqEltlPbQF1mRSGweQDMi+LsTt?=
 =?us-ascii?Q?rFURQW1eFnnQokZBCsl+K7YaSTOU6S1O30+VwSbIL3NFSP/6zYfSa4JAEOla?=
 =?us-ascii?Q?OASTS/VQi7hQ5dERPXvX5jXEJ37RxJos2tRhXn+Pi5Ku6vpv8WJf8OyvGZmP?=
 =?us-ascii?Q?lXK4JuZtd9hj9UIFSOedhLaNQM6Dya3EYy6UjkATo5+IMkHmnWqVsPEHwYX6?=
 =?us-ascii?Q?eOWE//Qmu/f/59fUSRUblRclZQByiDjLStg3vaP1a2ghSPB7zo3iJH+GhGG9?=
 =?us-ascii?Q?1UVOZxGyaGmsxrhGqqGVscMRpzSyfVDvL7uVP9VQyYH6ZzKhjXmTEyBeevmL?=
 =?us-ascii?Q?XTDv+5umJbq6LmR31YJykVSnDUoxEpjRe4XvsOKS/I+9LwUlGaLvWwEm8r3f?=
 =?us-ascii?Q?lofBGpAcoaEXnnfUCOuhyutE4vSqvyJTnGOeV3qNw64u4FRwg/jRGXMJBz7s?=
 =?us-ascii?Q?l+wk8cC1+dYQV5QXKuFEh1lWQc3uFE9KmQVIPn03jl0yk+JNQirszlOHpdRo?=
 =?us-ascii?Q?01aybgL9MWlmsiNidBeMkYiY7RrhqR3IVwrCDKUB8E92+FNUNPb0vdt66hfl?=
 =?us-ascii?Q?SEFf2rHpgoZtcNe0i2YevNnPyoSkp+wjs78Lg830HgudCEia9XtImLUoFzL7?=
 =?us-ascii?Q?Blc9yuVJ19hd+Ka9Ua2AQtoVhMpI+WEAgdM+SB32cJpv7PIyNjPFGfn8SNk6?=
 =?us-ascii?Q?W9iYgq40Z+V218cpGrJ9dVAG5cG+lNEDvRzwtd/3tkzRHPqrDZjIJVy7dhg5?=
 =?us-ascii?Q?HArsMLXj2SANLQzG/XVhjAyEE/43EE1DYyCZfX3NXUz9YYiP5Lhx7gtD1Rjf?=
 =?us-ascii?Q?zd367/bihMRM2IZiKvlrEEZOEwzNKQRcoYHYysFOp70yXtAsUEeSZBPv0OI5?=
 =?us-ascii?Q?uUqkSXGIYJ2feKBl+LOciS/ux/rHkS1Dm7tfHrY2i0k+Q4fH7vheIqGfd2js?=
 =?us-ascii?Q?cy0C/wSfVBvnHzlvBtbe6EUfwKK6LoSADM2oCkq4B+qnDXiI2yowsapinoeT?=
 =?us-ascii?Q?ksQcJl1iVm8WZkCUCeCR/Q0A+a7c5XtdWrmxwu6sk/SWOaByV0n3Lzdn+DNI?=
 =?us-ascii?Q?mgiGVLzNVCxXOk0hkcJb9++viv9ZClTgalh6TLGgFQ/KGVLaFMQLxElMsziR?=
 =?us-ascii?Q?y1AxDJGIb313jlGDZcM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d2ec2b-cf67-4e1b-250d-08dd789aad6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 01:46:28.6271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w5wxNIWxHvoxwQJbkB8Z9+BodCoOoPGl6QEAo+5kVeksWFmMMS34sBhGP2moiKNMURd1PsZ4bGSH5p6n9sEh1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9626

> Subject: Re: [PATCH v5 2/3] arm64: dts: freescale: Add basic dtsi for imx=
943
>=20
> On Thu, Apr 10, 2025 at 02:28:25PM +0800, Jacky Bai wrote:
> > Add the minimal dtsi support for i.MX943. i.MX943 is the first SoC of
> > i.MX94 Family, create a common dtsi for the whole i.MX94 family, and
> > the specific dtsi part for i.MX943.
> >
> > The clock, power domain and perf index need to be used by the device
> > nodes for resource reference, add them along with the dtsi support.
>=20
> Please wrap at 75 char to maxium use sceen width.
>=20

Ok.

> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  - v5 changes:
> >   - remove the err irq of edma node as the err irq support in driver is=
 not
> >     ready. We can add it back when the driver is ready. No impact for
> current
> >     edma support.
> >
> >  - v4 changes:
> >   - reorder the cpu node compatible string property as suggested by
> > Frank
> >
> >  - v3 changes:
> >   - remove the blank line
> >   - add PAD config macro define as suggested by Frank Li
> >   - update the device nodes compatible strings for imx94 as suggested
> > by Krzysztof
> >
> >  - v2 changes:
> >   - remove the unnecessary macro define in clock header as suggested by
> Krzysztof
> >   - split the dtsi into imx94.dtsi and imx943.dtsi
> >   - use low case in the pinfunc header as Frank suggested
> >   - reorder the device nodes and properties
> > ---
> >  arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++
> >  arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570
> +++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
> >  arch/arm64/boot/dts/freescale/imx94.dtsi      | 1138 ++++++++++++
> >  arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
> >  5 files changed, 3092 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
> >
> ...
> > +			#size-cells =3D <1>;
> > +
> > +			edma2: dma-controller@42000000 {
> > +				compatible =3D "fsl,imx94-edma5", "fsl,imx95-edma5";
> > +				reg =3D <0x42000000 0x210000>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "dma";
> > +				#dma-cells =3D <3>;
> > +				dma-channels =3D <64>;
> > +				interrupts-extended =3D <&a55_irqsteer 0>, <&a55_irqsteer
> 1>, <&a55_irqsteer 2>,
> > +					<&a55_irqsteer 3>, <&a55_irqsteer 4>,
> <&a55_irqsteer 5>,
>=20
> need align previous line "<"
>=20

Ok

> > +					<&a55_irqsteer 6>, <&a55_irqsteer 7>,
> <&a55_irqsteer 8>,
>=20
> Does it work by use
>=20
> interrupt-parent =3D <&a55_irqsteer>;
> interrupts =3D <0>, <1> ...
>=20
> if it works, it will reduce many &a55_irqsteer.
>=20

But if we add the err irq back later after the driver change is merged, we =
need to change
it back again as the err irq is connected GIC.

BR
Jacky Bai
> Frank
> > +					<&a55_irqsteer 9>, <&a55_irqsteer 10>,
> <&a55_irqsteer 11>,
> > +					<&a55_irqsteer 12>, <&a55_irqsteer 13>,
> <&a55_irqsteer 14>,
> > +					<&a55_irqsteer 15>, <&a55_irqsteer 16>,
> <&a55_irqsteer 17>,
> > +					<&a55_irqsteer 18>, <&a55_irqsteer 19>,
> <&a55_irqsteer 20>,
> > +					<&a55_irqsteer 21>, <&a55_irqsteer 22>,
> <&a55_irqsteer 23>,
> > +					<&a55_irqsteer 24>, <&a55_irqsteer 25>,
> <&a55_irqsteer 26>,
> > +					<&a55_irqsteer 27>, <&a55_irqsteer 28>,
> <&a55_irqsteer 29>,
> > +					<&a55_irqsteer 30>, <&a55_irqsteer 31>,
> <&a55_irqsteer 64>,
> > +					<&a55_irqsteer 65>, <&a55_irqsteer 66>,
> <&a55_irqsteer 67>,
> > +					<&a55_irqsteer 68>, <&a55_irqsteer 69>,
> <&a55_irqsteer 70>,
> > +					<&a55_irqsteer 71>, <&a55_irqsteer 72>,
> <&a55_irqsteer 73>,
> > +					<&a55_irqsteer 74>, <&a55_irqsteer 75>,
> <&a55_irqsteer 76>,
> > +					<&a55_irqsteer 77>, <&a55_irqsteer 78>,
> <&a55_irqsteer 79>,
> > +					<&a55_irqsteer 80>, <&a55_irqsteer 81>,
> <&a55_irqsteer 82>,
> > +					<&a55_irqsteer 83>, <&a55_irqsteer 84>,
> <&a55_irqsteer 85>,
> > +					<&a55_irqsteer 86>, <&a55_irqsteer 87>,
> <&a55_irqsteer 88>,
> > +					<&a55_irqsteer 89>, <&a55_irqsteer 90>,
> <&a55_irqsteer 91>,
> > +					<&a55_irqsteer 92>, <&a55_irqsteer 93>,
> <&a55_irqsteer 94>,
> > +					<&a55_irqsteer 95>;
> > +			};
> > +
> > +			mu10: mailbox@42430000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x42430000 0x10000>;
> > +				interrupts =3D <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			i3c2: i3c@42520000 {
> > +				compatible =3D "silvaco,i3c-master-v1";
> > +				reg =3D <0x42520000 0x10000>;
> > +				interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <3>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_I3C2SLOW>,
> > +					 <&dummy>;
> > +				clock-names =3D "pclk", "fast_clk", "slow_clk";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c3: i2c@42530000 {
> > +				compatible =3D "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x42530000 0x10000>;
> > +				interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C3>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 5 0 0>, <&edma2 6 0 FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c4: i2c@42540000 {
> > +				compatible =3D "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x42540000 0x10000>;
> > +				interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C4>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 4 0 0>, <&edma4 5 0 FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi3: spi@42550000 {
> > +				compatible =3D "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x42550000 0x10000>;
> > +				interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI3>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 7 0 0>, <&edma2 8 0 FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi4: spi@42560000 {
> > +				compatible =3D "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x42560000 0x10000>;
> > +				interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI4>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 6 0 0>, <&edma4 7 0 FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart3: serial@42570000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42570000 0x1000>;
> > +				interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART3>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma2 10 0 FSL_EDMA_RX>, <&edma2 9 0 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart4: serial@42580000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42580000 0x1000>;
> > +				interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART4>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma4 10 0 FSL_EDMA_RX>, <&edma4 9 0 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart5: serial@42590000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42590000 0x1000>;
> > +				interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART5>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma2 12 0 FSL_EDMA_RX>, <&edma2 11 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart6: serial@425a0000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x425a0000 0x1000>;
> > +				interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART6>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma4 12 0 FSL_EDMA_RX>, <&edma4 11 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			flexcan2: can@425b0000 {
> > +				compatible =3D "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> > +				reg =3D <0x425b0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_CAN2>;
> > +				clock-names =3D "ipg", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_CAN2>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > +				assigned-clock-rates =3D <80000000>;
> > +				fsl,clk-source =3D /bits/ 8 <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			flexcan3: can@425e0000 {
> > +				compatible =3D "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> > +				reg =3D <0x425e0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_CAN3>;
> > +				clock-names =3D "ipg", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_CAN3>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > +				assigned-clock-rates =3D <80000000>;
> > +				fsl,clk-source =3D /bits/ 8 <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			flexcan4: can@425f0000 {
> > +				compatible =3D "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> > +				reg =3D <0x425f0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_CAN4>;
> > +				clock-names =3D "ipg", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_CAN4>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > +				assigned-clock-rates =3D <80000000>;
> > +				fsl,clk-source =3D /bits/ 8 <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			flexcan5: can@42600000 {
> > +				compatible =3D "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> > +				reg =3D <0x42600000 0x10000>;
> > +				interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_CAN5>;
> > +				clock-names =3D "ipg", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_CAN5>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > +				assigned-clock-rates =3D <80000000>;
> > +				fsl,clk-source =3D /bits/ 8 <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			sai2: sai@42650000 {
> > +				compatible =3D "fsl,imx94-sai", "fsl,imx95-sai";
> > +				reg =3D <0x42650000 0x10000>;
> > +				interrupts =3D <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> <&dummy>,
> > +					<&scmi_clk IMX94_CLK_SAI2>, <&dummy>,
> <&dummy>;
> > +				clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > +				dmas =3D <&edma2 30 0 FSL_EDMA_RX>, <&edma2 29 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				#sound-dai-cells =3D <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			sai3: sai@42660000 {
> > +				compatible =3D "fsl,imx94-sai", "fsl,imx95-sai";
> > +				reg =3D <0x42660000 0x10000>;
> > +				interrupts =3D <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> <&dummy>,
> > +					<&scmi_clk IMX94_CLK_SAI3>, <&dummy>,
> <&dummy>;
> > +				clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > +				dmas =3D <&edma2 32 0 FSL_EDMA_RX>, <&edma2 31 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				#sound-dai-cells =3D <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			sai4: sai@42670000 {
> > +				compatible =3D "fsl,imx94-sai", "fsl,imx95-sai";
> > +				reg =3D <0x42670000 0x10000>;
> > +				interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> <&dummy>,
> > +					<&scmi_clk IMX94_CLK_SAI4>, <&dummy>,
> <&dummy>;
> > +				clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > +				dmas =3D <&edma2 36 0 FSL_EDMA_RX>, <&edma2 35 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				#sound-dai-cells =3D <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart7: serial@42690000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42690000 0x1000>;
> > +				interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART7>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma2 46 0 FSL_EDMA_RX>, <&edma2 45 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart8: serial@426a0000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x426a0000 0x1000>;
> > +				interrupts =3D <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART8>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma4 39 0 FSL_EDMA_RX>, <&edma4 38 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c5: i2c@426b0000 {
> > +				compatible =3D "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x426b0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C5>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 37 0 0>, <&edma2 38 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c6: i2c@426c0000 {
> > +				compatible =3D "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x426c0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C6>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 30 0 0>, <&edma4 31 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c7: i2c@426d0000 {
> > +				compatible =3D "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x426d0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C7>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 39 0 0>, <&edma2 40 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c8: i2c@426e0000 {
> > +				compatible =3D "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x426e0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C8>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 32 0 0>, <&edma4 33 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi5: spi@426f0000 {
> > +				compatible =3D "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x426f0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI5>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 41 0 0>, <&edma2 42 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi6: spi@42700000 {
> > +				compatible =3D "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x42700000 0x10000>;
> > +				interrupts =3D <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI6>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 34 0 0>, <&edma4 35 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi7: spi@42710000 {
> > +				compatible =3D "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x42710000 0x10000>;
> > +				interrupts =3D <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI7>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma2 43 0 0>, <&edma2 44 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi8: spi@42720000 {
> > +				compatible =3D "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x42720000 0x10000>;
> > +				interrupts =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI8>,
> > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma4 36 0 0>, <&edma4 37 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu11: mailbox@42730000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x42730000 0x10000>;
> > +				interrupts =3D <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			edma4: dma-controller@42df0000 {
> > +				compatible =3D "fsl,imx94-edma5", "fsl,imx95-edma5";
> > +				reg =3D <0x42df0000 0x210000>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "dma";
> > +				#dma-cells =3D <3>;
> > +				dma-channels =3D <64>;
> > +				interrupts-extended =3D <&a55_irqsteer 128>,
> <&a55_irqsteer 129>,
> > +					<&a55_irqsteer 130>, <&a55_irqsteer 131>,
> > +					<&a55_irqsteer 132>, <&a55_irqsteer 133>,
> > +					<&a55_irqsteer 134>, <&a55_irqsteer 135>,
> > +					<&a55_irqsteer 136>, <&a55_irqsteer 137>,
> > +					<&a55_irqsteer 138>, <&a55_irqsteer 139>,
> > +					<&a55_irqsteer 140>, <&a55_irqsteer 141>,
> > +					<&a55_irqsteer 142>, <&a55_irqsteer 143>,
> > +					<&a55_irqsteer 144>, <&a55_irqsteer 145>,
> > +					<&a55_irqsteer 146>, <&a55_irqsteer 147>,
> > +					<&a55_irqsteer 148>, <&a55_irqsteer 149>,
> > +					<&a55_irqsteer 150>, <&a55_irqsteer 151>,
> > +					<&a55_irqsteer 152>, <&a55_irqsteer 153>,
> > +					<&a55_irqsteer 154>, <&a55_irqsteer 155>,
> > +					<&a55_irqsteer 156>, <&a55_irqsteer 157>,
> > +					<&a55_irqsteer 158>, <&a55_irqsteer 159>,
> > +					<&a55_irqsteer 192>, <&a55_irqsteer 193>,
> > +					<&a55_irqsteer 194>, <&a55_irqsteer 195>,
> > +					<&a55_irqsteer 196>, <&a55_irqsteer 197>,
> > +					<&a55_irqsteer 198>, <&a55_irqsteer 199>,
> > +					<&a55_irqsteer 200>, <&a55_irqsteer 201>,
> > +					<&a55_irqsteer 202>, <&a55_irqsteer 203>,
> > +					<&a55_irqsteer 204>, <&a55_irqsteer 205>,
> > +					<&a55_irqsteer 206>, <&a55_irqsteer 207>,
> > +					<&a55_irqsteer 208>, <&a55_irqsteer 209>,
> > +					<&a55_irqsteer 210>, <&a55_irqsteer 211>,
> > +					<&a55_irqsteer 212>, <&a55_irqsteer 213>,
> > +					<&a55_irqsteer 214>, <&a55_irqsteer 215>,
> > +					<&a55_irqsteer 216>, <&a55_irqsteer 217>,
> > +					<&a55_irqsteer 218>, <&a55_irqsteer 219>,
> > +					<&a55_irqsteer 220>, <&a55_irqsteer 221>,
> > +					<&a55_irqsteer 222>, <&a55_irqsteer 223>;
> > +			};
> > +		};
> > +
> > +		aips3: bus@42800000 {
> > +			compatible =3D "fsl,aips-bus", "simple-bus";
> > +			reg =3D <0 0x42800000 0 0x800000>;
> > +			ranges =3D <0x42800000 0x0 0x42800000 0x800000>,
> > +				 <0x28000000 0x0 0x28000000 0x1000000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			usdhc1: mmc@42850000 {
> > +				compatible =3D "fsl,imx94-usdhc", "fsl,imx8mm-usdhc";
> > +				reg =3D <0x42850000 0x10000>;
> > +				interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> > +					 <&scmi_clk IMX94_CLK_USDHC1>;
> > +				clock-names =3D "ipg", "ahb", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_USDHC1>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1>;
> > +				assigned-clock-rates =3D <400000000>;
> > +				bus-width =3D <8>;
> > +				fsl,tuning-start-tap =3D <1>;
> > +				fsl,tuning-step =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			usdhc2: mmc@42860000 {
> > +				compatible =3D "fsl,imx94-usdhc", "fsl,imx8mm-usdhc";
> > +				reg =3D <0x42860000 0x10000>;
> > +				interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> > +					 <&scmi_clk IMX94_CLK_USDHC2>;
> > +				clock-names =3D "ipg", "ahb", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_USDHC2>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1>;
> > +				assigned-clock-rates =3D <200000000>;
> > +				bus-width =3D <4>;
> > +				fsl,tuning-start-tap =3D <1>;
> > +				fsl,tuning-step =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			usdhc3: mmc@42880000 {
> > +				compatible =3D "fsl,imx94-usdhc", "fsl,imx8mm-usdhc";
> > +				reg =3D <0x42880000 0x10000>;
> > +				interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> > +					 <&scmi_clk IMX94_CLK_USDHC3>;
> > +				clock-names =3D "ipg", "ahb", "per";
> > +				assigned-clocks =3D <&scmi_clk IMX94_CLK_USDHC3>;
> > +				assigned-clock-parents =3D <&scmi_clk
> IMX94_CLK_SYSPLL1_PFD1>;
> > +				assigned-clock-rates =3D <200000000>;
> > +				bus-width =3D <4>;
> > +				fsl,tuning-start-tap =3D <1>;
> > +				fsl,tuning-step =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart9: serial@42a50000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42a50000 0x1000>;
> > +				interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART10>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma2 51 0 FSL_EDMA_RX>, <&edma2 50 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart10: serial@42a60000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42a60000 0x1000>;
> > +				interrupts =3D <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART10>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma4 47 0 FSL_EDMA_RX>, <&edma4 46 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart11: serial@42a70000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42a70000 0x1000>;
> > +				interrupts =3D <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART11>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma2 53 0 FSL_EDMA_RX>, <&edma2 52 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart12: serial@42a80000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x42a80000 0x1000>;
> > +				interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART12>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma4 49 0 FSL_EDMA_RX>, <&edma4 48 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu12: mailbox@42ac0000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x42ac0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu13: mailbox@42ae0000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x42ae0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu14: mailbox@42b00000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x42b00000 0x10000>;
> > +				interrupts =3D <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu15: mailbox@42b20000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x42b20000 0x10000>;
> > +				interrupts =3D <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu16: mailbox@42b40000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x42b40000 0x10000>;
> > +				interrupts =3D <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu17: mailbox@42b60000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x42b60000 0x10000>;
> > +				interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +		};
> > +
> > +		gpio2: gpio@43810000 {
> > +			compatible =3D "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43810000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 4 32>;
> > +		};
> > +
> > +		gpio3: gpio@43820000 {
> > +			compatible =3D "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43820000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 36 26>;
> > +		};
> > +
> > +		gpio4: gpio@43840000 {
> > +			compatible =3D "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43840000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
> > +				      <&scmi_iomuxc 8 140 12>, <&scmi_iomuxc 20 164
> 12>;
> > +		};
> > +
> > +		gpio5: gpio@43850000 {
> > +			compatible =3D "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43850000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 108 32>;
> > +		};
> > +
> > +		gpio6: gpio@43860000 {
> > +			compatible =3D "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43860000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 66 32>;
> > +		};
> > +
> > +		gpio7: gpio@43870000 {
> > +			compatible =3D "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > +			reg =3D <0x0 0x43870000 0x0 0x1000>;
> > +			#interrupt-cells =3D <2>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +			gpio-ranges =3D <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152
> 12>;
> > +		};
> > +
> > +		aips1: bus@44000000 {
> > +			compatible =3D "fsl,aips-bus", "simple-bus";
> > +			reg =3D <0x0 0x44000000 0x0 0x800000>;
> > +			ranges =3D <0x44000000 0x0 0x44000000 0x800000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			edma1: dma-controller@44000000 {
> > +				compatible =3D "fsl,imx94-edma3", "fsl,imx93-edma3";
> > +				reg =3D <0x44000000 0x210000>;
> > +				interrupts =3D <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "dma";
> > +				#dma-cells =3D <3>;
> > +				dma-channels =3D <32>;
> > +			};
> > +
> > +			mu1: mailbox@44220000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x44220000 0x10000>;
> > +				interrupts =3D <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			system_counter: timer@44290000 {
> > +				compatible =3D "nxp,imx94-sysctr-timer",
> "nxp,imx95-sysctr-timer";
> > +				reg =3D <0x44290000 0x30000>;
> > +				interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&osc_24m>;
> > +				clock-names =3D "per";
> > +				nxp,no-divider;
> > +			};
> > +
> > +			tpm1: pwm@44310000 {
> > +				compatible =3D "fsl,imx94-pwm", "fsl,imx7ulp-pwm";
> > +				reg =3D <0x44310000 0x1000>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>;
> > +				#pwm-cells =3D <3>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			tpm2: pwm@44320000 {
> > +				compatible =3D "fsl,imx94-pwm", "fsl,imx7ulp-pwm";
> > +				reg =3D <0x44320000 0x1000>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_TPM2>;
> > +				#pwm-cells =3D <3>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			i3c1: i3c@44330000 {
> > +				compatible =3D "silvaco,i3c-master-v1";
> > +				reg =3D <0x44330000 0x10000>;
> > +				interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <3>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>,
> > +					 <&scmi_clk IMX94_CLK_I3C1SLOW>,
> > +					 <&dummy>;
> > +				clock-names =3D "pclk", "fast_clk", "slow_clk";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c1: i2c@44340000 {
> > +				compatible =3D "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x44340000 0x10000>;
> > +				interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C1>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma1 12 0 0>, <&edma1 13 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c2: i2c@44350000 {
> > +				compatible =3D "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x44350000 0x10000>;
> > +				interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPI2C2>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma1 14 0 0>, <&edma1 15 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi1: spi@44360000 {
> > +				compatible =3D "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x44360000 0x10000>;
> > +				interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI2>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma1 16 0 0>, <&edma1 17 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi2: spi@44370000 {
> > +				compatible =3D "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x44370000 0x10000>;
> > +				interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPSPI2>,
> > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "per", "ipg";
> > +				dmas =3D <&edma1 18 0 0>, <&edma1 19 0
> FSL_EDMA_RX>;
> > +				dma-names =3D "tx", "rx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart1: serial@44380000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x44380000 0x1000>;
> > +				interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART1>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma1 21 0 FSL_EDMA_RX>, <&edma1 20 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart2: serial@44390000 {
> > +				compatible =3D "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > +					     "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x44390000 0x1000>;
> > +				interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_LPUART2>;
> > +				clock-names =3D "ipg";
> > +				dmas =3D <&edma1 23 0 FSL_EDMA_RX>, <&edma1 22 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			flexcan1: can@443a0000 {
> > +				compatible =3D "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> > +				reg =3D <0x443a0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			sai1: sai@443b0000 {
> > +				compatible =3D "fsl,imx94-sai", "fsl,imx95-sai";
> > +				reg =3D <0x443b0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>, <&dummy>,
> > +					<&scmi_clk IMX94_CLK_SAI1>, <&dummy>,
> > +					<&dummy>, <&dummy>;
> > +				clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > +				dmas =3D <&edma1 25 0 FSL_EDMA_RX>, <&edma1 24 0
> 0>;
> > +				dma-names =3D "rx", "tx";
> > +				#sound-dai-cells =3D <0>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			adc1: adc@44530000 {
> > +				compatible =3D "nxp,imx94-adc", "nxp,imx93-adc";
> > +				reg =3D <0x44530000 0x10000>;
> > +				interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_ADC>;
> > +				clock-names =3D "ipg";
> > +				#io-channel-cells =3D <1>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu2: mailbox@445b0000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x445b0000 0x1000>;
> > +				ranges;
> > +				interrupts =3D <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <1>;
> > +				#mbox-cells =3D <2>;
> > +
> > +				sram0: sram@445b1000 {
> > +					compatible =3D "mmio-sram";
> > +					reg =3D <0x445b1000 0x400>;
> > +					ranges =3D <0x0 0x445b1000 0x400>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <1>;
> > +
> > +					scmi_buf0: scmi-sram-section@0 {
> > +						compatible =3D "arm,scmi-shmem";
> > +						reg =3D <0x0 0x80>;
> > +					};
> > +
> > +					scmi_buf1: scmi-sram-section@80 {
> > +						compatible =3D "arm,scmi-shmem";
> > +						reg =3D <0x80 0x80>;
> > +					};
> > +				};
> > +			};
> > +
> > +			mu3: mailbox@445d0000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x445d0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu4: mailbox@445f0000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x445f0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			mu6: mailbox@44630000 {
> > +				compatible =3D "fsl,imx94-mu", "fsl,imx95-mu";
> > +				reg =3D <0x44630000 0x10000>;
> > +				interrupts =3D <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> > +				#mbox-cells =3D <2>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			a55_irqsteer: interrupt-controller@446a0000 {
> > +				compatible =3D "fsl,imx94-irqsteer", "fsl,imx-irqsteer";
> > +				reg =3D <0x446a0000 0x1000>;
> > +				#interrupt-cells =3D <1>;
> > +				interrupt-controller;
> > +				interrupts =3D <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSAON>;
> > +				clock-names =3D "ipg";
> > +				fsl,channel =3D <0>;
> > +				fsl,num-irqs =3D <960>;
> > +			};
> > +		};
> > +
> > +		aips4: bus@49000000 {
> > +			compatible =3D "fsl,aips-bus", "simple-bus";
> > +			reg =3D <0x0 0x49000000 0x0 0x800000>;
> > +			ranges =3D <0x49000000 0x0 0x49000000 0x800000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			wdog3: watchdog@49220000 {
> > +				compatible =3D "fsl,imx94-wdt", "fsl,imx93-wdt";
> > +				reg =3D <0x49220000 0x10000>;
> > +				interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				timeout-sec =3D <40>;
> > +				fsl,ext-reset-output;
> > +				status =3D "disabled";
> > +			};
> > +		};
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi
> > b/arch/arm64/boot/dts/freescale/imx943.dtsi
> > new file mode 100644
> > index 000000000000..45b8da758e87
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> > @@ -0,0 +1,148 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#include "imx94.dtsi"
> > +
> > +/ {
> > +	cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		idle-states {
> > +			entry-method =3D "psci";
> > +
> > +			cpu_pd_wait: cpu-pd-wait {
> > +				compatible =3D "arm,idle-state";
> > +				arm,psci-suspend-param =3D <0x0010033>;
> > +				local-timer-stop;
> > +				entry-latency-us =3D <1000>;
> > +				exit-latency-us =3D <700>;
> > +				min-residency-us =3D <2700>;
> > +				wakeup-latency-us =3D <1500>;
> > +			};
> > +		};
> > +
> > +		cpu0: cpu@0 {
> > +			compatible =3D "arm,cortex-a55";
> > +			device_type =3D "cpu";
> > +			reg =3D <0x0>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l0>;
> > +		};
> > +
> > +		cpu1: cpu@100 {
> > +			compatible =3D "arm,cortex-a55";
> > +			device_type =3D "cpu";
> > +			reg =3D <0x100>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l1>;
> > +		};
> > +
> > +		cpu2: cpu@200 {
> > +			compatible =3D "arm,cortex-a55";
> > +			device_type =3D "cpu";
> > +			reg =3D <0x200>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l2>;
> > +		};
> > +
> > +		cpu3: cpu@300 {
> > +			compatible =3D "arm,cortex-a55";
> > +			device_type =3D "cpu";
> > +			reg =3D <0x300>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l3>;
> > +		};
> > +
> > +		l2_cache_l0: l2-cache-l0 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2_cache_l1: l2-cache-l1 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2_cache_l2: l2-cache-l2 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2_cache_l3: l2-cache-l3 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l3_cache: l3-cache {
> > +			compatible =3D "cache";
> > +			cache-size =3D <1048576>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <1024>;
> > +			cache-level =3D <3>;
> > +			cache-unified;
> > +		};
> > +	};
> > +};
> > --
> > 2.34.1
> >
