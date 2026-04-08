Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7B839DBE1
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645444; cv=fail; b=Vm8TTt/w8lMa1CQEBr7t1M9gqitlJzVhXoZyiBsIlV1KCI3PK+SeUkXMa8n2NX9vhyBRT1ecYqRllEzzYYmn8a0LAYXH5LV4ts5idexdS869YfKh8zZt7P38+yfzasXXRBmL57rVCsg2rQR5ECZhfxf1ml5O8OPfgi5sfnk+0YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645444; c=relaxed/simple;
	bh=SMKifo4IlxmpGvXM8Qjpimgfgm3yVPylIujC8k1HxAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mbkNvFTGN8KpX8Fe01Pgoix9LWoHnVaE2i5iRf2Stolt2loMYLbNfTWuAcY8/lPPZRuPtsc33zsWqHtV9e5x0ni7CgRUYY8HyHhpJspBSxYB9W4VbzjA3RkXfFLG2Vpt6W6d0Vq75JMfUnseBLJ5FtbtMoKitiz4pooJgO928g8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NbdzYXSo; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NbdzYXSo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lri9zt3eTmaZGYG9q9+tJGuEernPzWO7H4wN6UX8FCiIUGZPFCt7jNWI3ku3BWuVDAEB1D37gZCrb9NGDCmkm8MZ/96dUE7MtBBrHbmBrzlTBWh5EmP70RV5Z6FYjG1wL+aiSfCeWhWpv7ROlSB3v+RHUAgPdXqUQ5glSmE4Pr5JO25/kS/Mk+Dyx1FN5OhK7cbxpc3XKpgx8PtutcCxvUiBuIvxFvnEZcU/BGevXnhXSHDhoRDhwyTvgSz84A3OiPHQvuV5qVE6vdMYs7Z9FOs/vpxpkCsF2LFxNhOAbCpZtQK+9z8CIrs6mqnpV9iK7UA3NIDJS3Cnj3ysJzplSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LWYBJT6A9zql6fd+QSDsTxkjNUXwQhxfLzwErJ0wPY=;
 b=wQ73vBum4imY9OE6lvvy69amirH0tVyKg5iJCJ1fKs4qLJZhOVr+liOvjjI3hnrxPaB4amPVP53oesDSLxBnaC8XErFh3v0RxI4RDb7JVOVxG6A8I9/x2TWRVauqr/KY1Xpb3F4HIRGBjTXxgd+V1Zi6JWwveuzWHWiwM4PD+jaTkq7ZRJSmI+l1iVv92wAtBMOMw9s1rnarIRJojKXpsps0/lWbNMGCxfcxhVyr/NvwuNUrduTGNR4eNccp7HpXjYSOZ0B9I/x5AGRHa78LjqgJOMD4NjSblMuM/88CHSp1q6SkHzrLUE2IpEsVZHVoL5g7QcnMcBRtIZk44/HJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LWYBJT6A9zql6fd+QSDsTxkjNUXwQhxfLzwErJ0wPY=;
 b=NbdzYXSo1VeoNiQArb6cLxy7IQuKUhdFdyQKCWTF+pwzHJ8BdQw0WBONt8kG4B/ery8Q5iAboL5vlQy5vmqQeVSEPJc7sDO3gdNq8Tczrw2E3GcSxp2z3XhthviK4YWBst5OKVHlTO4Mk8dWia1hyTUGQI/motmTXv3muFOqmLsyVfazp406C+bF8o2Ku1+mxB+yIfiqsXOo0JhF1+l4ngzfo3GCh7LKKT2SIR+/VeoVit0dWAGYuMwKt4BR4Id2ZOn5pLJ5k1OGrw8QPMCJ1ljjUn295HVBdpNCCdFst80M7FFbgkXe4YyTVj7I+h+Gc0FazOZBoIdVEEmxJS2VqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8488.eurprd04.prod.outlook.com (2603:10a6:20b:41b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 8 Apr
 2026 10:50:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 10:50:40 +0000
Date: Wed, 8 Apr 2026 06:50:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel
Message-ID: <adYy9xesCKsYWNBg@lizhi-Precision-Tower-5810>
References: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
 <adTUkWvqVUhLiw_J@lizhi-Precision-Tower-5810>
 <a31e926e-9e7e-4ba4-aafd-0f76f53fa176@nxp.com>
 <adYKtjPvIgoK2oou@lizhi-Precision-Tower-5810>
 <f5cd5da8-566d-4dff-b712-3d48927f97eb@nxp.com>
 <adYRuAU5ueEKHK5l@lizhi-Precision-Tower-5810>
 <5ce48659-2c6c-4c60-a8e8-9031bdbaa2a3@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ce48659-2c6c-4c60-a8e8-9031bdbaa2a3@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7572a6-0e6d-4de4-4984-08de955cacd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rFhnwDrCvKo6q1ccMHNYxCZcJwMKd5eUQ1+T0py9dsrV22qgfOgUQeGf239Pr4M2r8qPlhJwanqRUTe7vpczFxsayJeCfEh/Bil4DugGLQKRRkA3E9eiNbacyK9zegG0rpJdNFYCE+iN8biY7rQiuMTK1VQ+rky/a8+aX4v6QqY4hIwrgy3W22jm7dpYzC1q+0iR3T4jFjg8WGIq6ELIswb0szpmwV/ru753uinZC6lpLKL5BCosOPHAtsCy2vYDdu3YXIsGj3SLBN3UMqoBE7e0SwFzrpN/IYIku7W2DYVlcFcGYnckLz/w14Wh7kjPocyaGBE+23m7Dk7Ibc91uVbxG/OGQLNc0S2wwCyomD9a2cCjWCioa9NJRZnK2sZ08OKwyBUR49ZSwDlxEA4M0htqWc6VkGYxvK1QzYyfcAGvOoiOGhCWmIK8OrvIWcnKgLPOST68p8Awyn19K/nklqkv9GmwQjdxwDDE3+Gk98MS4UclvOrhVe5FACS4askSZJ73bJC9RwSIrxZAxCqYObvIcrN055WUOl7bBmRUTQDD7hPijCNRD/dryWl+MP6tMU/JzBXRoDvP0D1ffrlCmfvIJMgN0iRtmmgY9WlPj+5d53q0Aq3YDermt0zLg4s4LRal5XFOSWXPx1BET+ukvWN8GEllM82M2mBSJ78YvO+/koWD+fJQpJG8ubS74NoJYtz2vf2HhkXLgbaOb5Q6wQzXZ1CuPqODQQLuMuXT9aUmJSOxP6RXjrABduD3JUeLl7HIJcsHEQEwZMEZdASM3wXXTkOHV4tIXCmMY63K4mg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YEwbxv94EczImo0qDTKiRpAqkdN/ctzBEoWo8pXCzqHyid3CW1RLS+CHfAoZ?=
 =?us-ascii?Q?j+nfEYUtieWdYmyBbTjOSd7HYVLzpR8WUeCfr9YGCfttw5eNR8+G5n6BMe1E?=
 =?us-ascii?Q?9O8QxyjHqmtFa9PUG0QHHDgXa+QZLb2yWLwsku5qKOHugD5FelC0Bq+Gnxw5?=
 =?us-ascii?Q?zFYDVbORYflMP/MBLVekNbFv0mAmSZAa41OIE+jn4tB6VeAi+T7izxBtArZZ?=
 =?us-ascii?Q?1f3ArBqRdeo9Wkr0QaxihcCQwPoRVynnKTKqX4X9MzwMFqk9N1+ZaZAnQCne?=
 =?us-ascii?Q?JjdsknhWtA/WppA5NezHwE2wUT52ifaIVmF1v2dWoK32EscfuiRpEHzNFmvx?=
 =?us-ascii?Q?kLyXIS0u6fGmvzoVJZ06obSYI+r3W4CrqHsSs+IL/ito1NTGjxaDAQdhEkGd?=
 =?us-ascii?Q?ecW/AjzSdNLZrH6RQ8fx3hi6Jzgc+DgNzwVJ+5ycyTa/eTNbpxyX6Pk5O55v?=
 =?us-ascii?Q?6nLTxp+qEDRiBy1ExqPMlITGCBE7lev1uNXyHCHBe7nicyv0yhNEt8DH3e3+?=
 =?us-ascii?Q?ftxlwoYWxv/AgwkJ25J/mQ00WrLfSVAE9ymGFSIZ2uuVkpe3a5Cgbw1m+8nx?=
 =?us-ascii?Q?pwIrCFq8+pubMK0uKHPCF8nQkOxLcbGaIYqad9nmCPlPHh33QOtnGYHRZara?=
 =?us-ascii?Q?GgEnlUbk24gIBIvw9hh5os9XgXwNtLXeelO5RX4FhUI+Bu1Mo5THu8cypkbw?=
 =?us-ascii?Q?6kVwPrO0354idbsb4kjRVGJEDqv/42thXxk7y9K1RzIZRwGppfJ7kei+LUl6?=
 =?us-ascii?Q?pmQDniCRTCprlOgNEImcm6lqqopSQioOllBaLoFXEX4crtFtZE4AywqTbCT7?=
 =?us-ascii?Q?KlMQZH46Lgg/9hCv2SVLoB86gvL8uKn5z8o1lFvYpiCBmrnCuo/hRE+kFUGd?=
 =?us-ascii?Q?9IhoqZQd6e7cthpnjZoQzNCpZagZp2zRNXPh/k+3d7FN0yJ0b44QA62s3QJQ?=
 =?us-ascii?Q?ZlvtJFkpOi+qhSf5Fq/a9ZQUbt4ddjiMVsvWOCcPi54JLn3hntVFgqlwyLQ7?=
 =?us-ascii?Q?OtbQ0F2z7KZ/18GM2kA+CUzftyzd8TPhAc3ECR0BHFssE8V39+sWbRz/ZlO1?=
 =?us-ascii?Q?XN6T2NUH8YT5SbGE82simRmvas2OlyokcgSgJ4RoM5bL3gVKDvS/ByiHrpFC?=
 =?us-ascii?Q?w5ItRS1sQiEZKn9PJ91eu42+G3uCjKi0+6h3OlYhDtYWCNwNAe687cmepCq/?=
 =?us-ascii?Q?/Tc8WnUtI69DVPpg6g4UaVXobYSDkJEDcMoycvOH0LtdVVBtVth+tODpeTut?=
 =?us-ascii?Q?iH33hgPeNZMA/aE6nlU98/qEzNvGOrlgWqpFPnd+jntJ9iElfwINoxkKxRoW?=
 =?us-ascii?Q?5v7ZmGQD8Ux3FxIhBFxVY1tClj0XxXYvz0GlQaWd832wIckjtFFEFjXiSf2k?=
 =?us-ascii?Q?49WpvuAGUMI+ThS8ZUY1HfKIm8wnyydnW9vo6DIzsQFR6hDFJgXh8mlMxFms?=
 =?us-ascii?Q?BH1vTYTvYPy76bTspfvg8edR2Fo2ku/b6McQfF1YqpQ7yXu2/IoXfyDrlMda?=
 =?us-ascii?Q?qNgO450vWFK1Yh6Cv6tie6YZK0X72yGmhzwwnY5PP6gB3Slc5xat5QaAQrHY?=
 =?us-ascii?Q?oTBSKboep82vxs4c37HfMyadDtAShHK9qtBbyGWrfuX/VqvIGORu7tEd3eIN?=
 =?us-ascii?Q?kQtx10YJPcdSoCv0Xkc2eorvpe6q3GCgcJlsW2d7cfWbfwnxeT1omW5ylMEC?=
 =?us-ascii?Q?jxZ7Gz35nogYjGO8xd+Q0ZN5YwftDW+jdjZ0/5BHBrLXTT+UTqyQ9gNcjO08?=
 =?us-ascii?Q?63hRBPlrhw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7572a6-0e6d-4de4-4984-08de955cacd6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:50:40.5201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+h1fL+pLYIwls00VZoa98vNWn8KwamKdL8bl58teb5keRpZ2h+DmE0GRJxlNfDbMXyFxQOYUpGTZeG+YBlvfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8488

On Wed, Apr 08, 2026 at 04:40:37PM +0800, Liu Ying wrote:
> On Wed, Apr 08, 2026 at 04:28:40AM -0400, Frank Li wrote:
...
> >>>>>
> >>>>> Is it possible to appply this overlay file and kd50g21-40nt-a1 overlay file
> >>>>>
> >>>>> to imx93-9x9-qsb.dtb, so needn't create dtsi.
> >>>>
> >>>> I'm sorry, I don't get your question here.
> >>>> Anyway, the DT overlays are needed, because the 40-pin EXP/PRI interface on
> >>>> the i.MX93 9x9 QSB board can not only connect to a DPI panel adapter board
> >>>> but also to an audio hat[2], and maybe more.  The newly introduced .dtsi
> >>>> file just aims to avoid duplicated code.
> >>>
> >>> My means apply two overlay files to dtb
> >>>
> >>> imx93-9x9-qsb-tianma-tm050rdh03-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo imx93-9x9-qsb-tianma-tm050rdh03.dtbo
>
> This ...
>
> >>>
> >>> In imx93-9x9-qsb-tianma-tm050rdh03.dtbo, only include
> >>> &{/} {
> >>> 	panel {
> >>> 		compatible = "tianma,tm050rdh03";
> >>> 		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
> >>> 	};
> >>> };
> >>
> >> If an user wants to use imx93-9x9-qsb.dtb and the DT overlay blob
> >> imx93-9x9-qsb-tianma-tm050rdh03.dtbo to enable the tianma,tm050rdh03
> >> DPI panel, then it won't work unless the user also apply
> >> imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo, right?
> >>
> >>>
> >
> > Yes, imx93-9x9-qsb-tianma-tm050rdh03.dtb already created, which already
> > applied both overlay file.
>
> .... indicates that imx93-9x9-qsb-tianma-tm050rdh03.dtb is generated by
> applying both imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo and
> imx93-9x9-qsb-tianma-tm050rdh03.dtbo to imx93-9x9-qsb.dtb.
> While, imx93-9x9-qsb-tianma-tm050rdh03.dtbo(a DT overlay blob) just contains
> the panel node, which means that an user __cannot_ enable the tianma,tm050rdh03
> DPI panel by only applying it to imx93-9x9-qsb.dtb, unless the user also
> applies imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo.  That's why the .dtsi
> file is needed.

what's problem if we require user do that? Makefile already create finial
imx93-9x9-qsb-tianma-tm050rdh03.dtb.

Any user really apply dtso manaully without use kernel's Makefile?

>
> >
> > can the same board be use for imx91 or other evk boards?
>
> Yes, both tianma,tm050rdh03 and ontat,kd50g21-40nt-a1 DPI panels can be
> connected to i.MX91/93 11x11 EVK and 9x9 QSB boards.

Is it possible to use one overlay files for all imx91/imx93 boards?

Frank
>
> >
> > Frank
> >
> >>> Frank
> >>>>
> >>>> [2] https://www.nxp.com/design/design-center/development-boards-and-designs/mx93aud-hat-audio-board:MX93AUD-HAT
> >>>>
> >>>>>
> >>>>> Frank
> >>>>>>
> >>>>>> ---
> >>>>>> base-commit: 816f193dd0d95246f208590924dd962b192def78
> >>>>>> change-id: 20260407-tianma-tm050rdh03-imx93-9x9-qsb-6e4bbbde3d08
> >>>>>>
> >>>>>> Best regards,
> >>>>>> --
> >>>>>> Liu Ying <victor.liu@nxp.com>
> >>>>>>
> >>>>
> >>>> --
> >>>> Regards,
> >>>> Liu Ying
> >>
> >> --
> >> Regards,
> >> Liu Ying
>
> --
> Regards,
> Liu Ying
