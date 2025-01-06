Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62821DC9BC
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 19:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736192021; cv=fail; b=VgAcFhXk8cy4MrvEps8iplAjnuCXefKqQbvs40iMKLWda1Lk9Ozq3VyHzDUwE4YqtFgoDEKmMWAq0gF2elbV2PzfRJPLqfbHMZdfIAzaCK9MDGKjxL+4nxgPY6oBLaHRzSO2KV950HVLUHpqD946SMK0nPVK1VfOlM1WRipEF98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736192021; c=relaxed/simple;
	bh=gpppDhBnb4ck4ayOGlMFXeK7l87F7OnrsF8nmCbVdT8=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UBKk0Tp/45rfrxtNs27oCo0J2n9TnaidCOGXQZ04iSnpL9sexWcK6/ZIOLlnPeOfnUTlsIZ112qiVXDjTcHPMUkbMn3nhPS980nC3OxqyZAqv8T1UFYCmQuM7fNqc8CnBcWQDxvM8/VGpReih6L+2zk/rbs2kUKSq6bsS2R87mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jNoqxuXm; arc=fail smtp.client-ip=40.107.22.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jNoqxuXm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oowlmbpvPKf8lWxKcLS0PWffKtTRZbYNW3TtgrsaAs7rDQAUudE1lzxSiuCHQ0Ngh6PScbRObeV+feMXsT1B0FUTf7CC5qFmuL+7Pt6zS+7rz+h2XgiY13KWykktQPvrVPm+9RTdVAueO+ZeftDSfyRZkaIqC+IzxD5JeVLdhRcoIoaHyjRke3KNtUw5j4bRg/18MsH/YZC2r9UayA9t2vATF760oUxxsdU+Q0tzl5/3ZCIaCXBAOeFR9AF1c2lRyEDlSiJRz2/XXdkZon0HKFK25VSE8SiAG4qNBSoJZLw+aSvtkAmyrYqsiWBILSRnmSlCRNUG3/92OEnRtmEnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLJpe+SPfPHVFBZ7fXAHxuA+0HpNDqRP5v0uTbq+c9Q=;
 b=vFqwGoMCLP6f3Xhh2bf66XyFhWrZ4DRzuvyQ1q2xbeXVw+8qerBx/3GBHdqXZYDj+z8q0a5wjHKTJrPl8Mao1VkoK/pEfJNvJIj978fnchoogUkYGep2FaQYIXKB2cger5mIiXTKXIV220ihW22W7sKMSdLSNXkUeM8CP3RGTpxl+J5NVWTbxaDjCxnNw5onyEMBq5LtLC0GX8bhsu7ZqjLB4Ln27jWRMjP5l8IvAr0QyieqjkqCPI3RYC6YNKh7OawMH/2vczRelomcftNyInbrML82JgfidaxFKYMZQAbzVYL+modFt6WzS9dLFnREAo0jTs2MzPnHIAXdznSXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLJpe+SPfPHVFBZ7fXAHxuA+0HpNDqRP5v0uTbq+c9Q=;
 b=jNoqxuXmdYN34C7VoLONqdVsOda+p5tfUi+fLiC5LguahXpDr+6r3L6STqyD0xfvUgKBnDNZP4jl2nj3YIWXtyViv5+w4NsFymXH4mkTVK+kCB1fqfIJkUwbxMcLB2W06MP77ec2tkrpG2DDNdEEZ2Hs/h5yVYhzuJY1n/1Q1Viej/qnUKIu0y3gR6yB7u3qVQuIrurbN/ADwJRZ/Pq8q/IF/9ln8716Iu8ndSDlUEdOmteU7v2ARFl7R366ElgCgbCjWn2Rhq+jpJaCSlaKn4AJiGZBmWuFVtJnKaO4y/9s1AFEFY2/x2mp/ZhPfmISgjWtKh1U25bGiXRKPUA1qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Mon, 6 Jan
 2025 19:33:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 19:33:37 +0000
Date: Mon, 6 Jan 2025 14:33:30 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8qm-mek: add audio-codec cs42888 and
 related nodes
Message-ID: <Z3wwChng4CcJi8On@lizhi-Precision-Tower-5810>
References: <20241028220318.2047870-1-Frank.Li@nxp.com>
 <Z3wvWXVnuPQPTw7u@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3wvWXVnuPQPTw7u@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BY5PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::40) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb1e81b-16fb-47ea-4701-08dd2e890426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Om+ABE1RHQh2NLXXioCse1oIv+VeZS8W9CuKEYC2kukLbAA9r/kSO/IzlXxT?=
 =?us-ascii?Q?POvnimdtdVLAcMnOi2qyw3IQEAvz6d3Hm6BK79NNJkcDgcT6iqM6N+ko4s85?=
 =?us-ascii?Q?tJCtjRi0L1fWA78Smh7CkaWb4kRtYfkLMefkMFQAiM18IKzhK50kEJuT/Bv3?=
 =?us-ascii?Q?SVoETiWpOetyDV2EfLpRaZ7gzNU4Nj9NTa8tTmhbrY6zLgK5nSpTQff5Xxa5?=
 =?us-ascii?Q?cAUBpTMhupf5bYEFKYd7oZ79AvJ3Z2gtuPipP0fFuxw5M1kaVDyq5gZx44Q/?=
 =?us-ascii?Q?QAZK0iPSy8/FvrpXApqMJC2+w1l0TxDzR91pmIlrnEhCnVYWx3Irv3S38Vyd?=
 =?us-ascii?Q?B9OeUg0O1ehamA/4NVPMV5eVS1BVoOVMcO3LFAEUAxV9PZOf1IuUggMClWkA?=
 =?us-ascii?Q?eiLHGr814BUpb5f81hHbHz91P1/sf+4B6SR1Y7D93DqZjSQh3h27Et8bd5qV?=
 =?us-ascii?Q?EnqIV042w/dyvIMUHnpSlJvQvfJ1i4yNbkiilOAtjBpKPz8u4Rm/cV2sxn8G?=
 =?us-ascii?Q?VwLcB5t0uVHwj9B/ZcfZgHBADNPl3Yo3Hp6BwTvmyfTF1USp5jEoJ80Kr41N?=
 =?us-ascii?Q?WpKwsueLAlzWd7ZoU/e3JA8KREo981pV9QmqOICx2JXYH52J5ArPX2tuGQ5A?=
 =?us-ascii?Q?GrQ/NiYQfwRHaJHBpm9h19vZMuj8mx+EAaybCy+00XkhsvnIpIpc6WIVStO0?=
 =?us-ascii?Q?kcQcThOnXjPEbA6pQSPiUJ90qR80KhtFOUXC6dGInXp8Oy10573Tn2gSS92J?=
 =?us-ascii?Q?KZHGPo2YNM1iiLf115dtYUgGDGLHX/K96AAu6ceCp0JvKRq9qP34LfivTsLk?=
 =?us-ascii?Q?KRfQAbX7plXArisvp0RzhsvncnGNKvI2/sybOX494MZ+0HNFKC0jRll3dAnL?=
 =?us-ascii?Q?p+l4QW8iVvFha4BfeNhoQOoIuNPwDaqUoFbUiUBehbdOAUUSYkD7aLBvmuRG?=
 =?us-ascii?Q?dLp4KZQNKXZKXKM84kS97y8jIzd+CskAI6cUDy3E3ICNuTxmUluKeguk2uMc?=
 =?us-ascii?Q?pHMAmtP5Rv9aaxQhI5gif+6/5l5UAo9kxyVkH3734gSox/EREDJXRnnrfo9Y?=
 =?us-ascii?Q?v7syyLik907aXFHHBoyyT14GytjQzD3Qmhcl9OYt/GcjtyER9NRKmmjkvRXW?=
 =?us-ascii?Q?XGosj4A8nSKtzEqfGeNGITyRAtz0nv0/O/j8b7y4/pYebfSg9/HtSFQx4Vj5?=
 =?us-ascii?Q?3E6wfRvIiECUnx8/WN/hLFRHD6htnEwwE+sRjQyhLV1klK6gXlgyfYiihicV?=
 =?us-ascii?Q?SaZPIEAxA+H80gR1PzQkH11ZPWfdyIrn6++pIMhOO7uG0b0ekiPxxiZQLYSA?=
 =?us-ascii?Q?mHjUejOPTHzNOyvRw3cORPW/UCf6/FvwGN01AfKghml8ECTkZJQ4LxSR86OE?=
 =?us-ascii?Q?6gyqd+dD4hpf3EJCouxN+MVcKWzCgFsILNN1RmEFd1hwsAR1tZHLpN0WZiBU?=
 =?us-ascii?Q?8v/K6Pn3J4UU+rc8j47ve/BPkSnnyRmzlTvuLD/FHeZBftdrdo7TwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ONB2ttxM9AT2oPI3Zemys3ALzEUssnP4Zxxf6ah5a/krcBKnPxRJ5BjCV/cA?=
 =?us-ascii?Q?f9vB36rp5hG+C6RcJiC6d8AWhTx0T2BPBlNj/EQ4P4JC1Pd9dSFwnXNzEiHB?=
 =?us-ascii?Q?f3qYdswe3QjAfWQwx6egn+uKL80G6raqk7R3AJNckzeI1zUStUDMs16Hz7jZ?=
 =?us-ascii?Q?lv+u4WcJOYnwL7yqZJSZ7VovrisQmyvE8wGSKqz6GYgMZzdfaKRX6+UL+dWZ?=
 =?us-ascii?Q?gzkK9g5myT0Nb3ukFBX3v5fh0Cr5jzyoK0UHkscnrfPWPyr+Z1Oq9el8MMP6?=
 =?us-ascii?Q?egKFdqnJhzvCrBxh+ZMS0kWJAd9WhiHs38oS73orcmmdaRWOqPSF3FfjWBqR?=
 =?us-ascii?Q?XfmLIysTKPwMB5F+5xgjRix0d4MRK0FxMWDdvZyokMvfAbfZnKCtahqYdpH0?=
 =?us-ascii?Q?QeDa6aUPBEekq/qk3kPDz8XAv/8iIdlhgo2zo8wqo08tbSIGVVKMm/jMf0R+?=
 =?us-ascii?Q?9lRROu6WBLZpluC3Od9ZJZWnQDmDujvuUPIcS2TFNNDenPoCNgS8ifmhGYcS?=
 =?us-ascii?Q?B4w8GPltp+KpO/78beSHlAgv3WtmrTyQ3uQ86WNhAA/NY3jFWzolBtc10OEQ?=
 =?us-ascii?Q?lARKrm3lvTC740smgfL/ggtcaoTvaXUTZlhAGdpghzpSB6ir/ZDWgE8IKY9G?=
 =?us-ascii?Q?HlmEzgTxsrVkFnX0HPaUExIrZA1Sy/xUDMElKcaoWASD6Td49Xk2VVhnSiFD?=
 =?us-ascii?Q?zUlcHZUphtqcYkFOPz/TiAD+TYp1FWGN1ihAwnTaNEHEOXDUi0uvYRchr+ZB?=
 =?us-ascii?Q?67jr//p6bu5sR7BiQN1ed5EUi+qpMqhPvfpwBY5MFZSleN+KQnHxtcsD1V0U?=
 =?us-ascii?Q?IZkwNlr81xg6UQZS8KHJYXd24GUPz6syl51U7l1ZAJdrarT3ZX+FNaPmKVkY?=
 =?us-ascii?Q?EcQKVFQthpcpr48CPcj8Ay/t81weGQjUeNxHWgT3czWOJSN/DHpHfbF/6pOm?=
 =?us-ascii?Q?oPV3bU8Kb1tv9Ypq1I25d52vucQ6VY8mhLSBVixxd+jK6XHqFR3EFjZmCU1e?=
 =?us-ascii?Q?mjqTfiSLldov6iLpuUox7IrljP4LoZlPwq2nmcC9sC2WxPglAXzZM0sCgNgf?=
 =?us-ascii?Q?YRzmtracwv2UtMlN9eADQREsfeOrKTDSAYjZgT+ffR2EOEFgrpMDnY5eEkhu?=
 =?us-ascii?Q?DEZ7kB4wHOhxI5YWWE/6XKT6dmd2qCSSORuS16HJxbNQpOszmQmmw/L8WEem?=
 =?us-ascii?Q?fVvzmeGnrC2X3Xki+/I9mvDP/cTu4tyodkFTaEwUUfy3/4nTBH0yaqLlsGnd?=
 =?us-ascii?Q?ZGlE/tK98A6ImBSF4GNm5gdjtIQk7VNHSmKTzNsUyV9iE7Ns+4L0jKLZOE/D?=
 =?us-ascii?Q?SDqXLMNVGSEBW3X1ctSbWWvgFk2cUFN765EqG7eiG8FK52l8BBeM8Ior8FCG?=
 =?us-ascii?Q?XFudvYx3UeY436+Kp1eD5c0fpTKBptpvhlTjCdkl7m3mz39DGDhy9etlYnUZ?=
 =?us-ascii?Q?kQlmMz0gsh/JCky0RfTyHIWTmudr+QKRi2iIsa4Li3wcHv/j+tWprZOCnvGB?=
 =?us-ascii?Q?ccOmYa8Q3heRGV7YZpbW4CGnnQai8V3ohLrMdVZXtEsZYP4AUWJEe0HY42vV?=
 =?us-ascii?Q?+gOTE8TAtllaPuX38K+KZD46LB9HhQ4oEm7Urom0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb1e81b-16fb-47ea-4701-08dd2e890426
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 19:33:37.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2CAhIYztFGyk5/VcQud8sL9gkoF8zwTHWqGo8cdNazgueLImyzXeusLkhILBjD8CXNaT8yOBGV2w7z/6URnuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651

On Mon, Jan 06, 2025 at 02:30:33PM -0500, Frank Li wrote:
> On Mon, Oct 28, 2024 at 06:03:18PM -0400, Frank Li wrote:
> > Add audio-codec cs42888, enable esai0 and asrc0.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
>
> Shawn:
>
> 	Any comments for this patches?

Sorry, I ping at old thread, v2 should be

https://lore.kernel.org/imx/Z3wvqEupL6TxCqct@lizhi-Precision-Tower-5810/T/#t

Frank

>
> Frank
>
> >  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 82 ++++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > index e983633a4bb31..31cf02275ca9e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> > @@ -134,6 +134,13 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
> >  		enable-active-high;
> >  	};
> >
> > +	reg_audio: regulator-audio {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "cs42888_supply";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +	};
> > +
> >  	reg_fec2_supply: regulator-fec2-nvcc {
> >  		compatible = "regulator-fixed";
> >  		regulator-name = "fec2_nvcc";
> > @@ -223,6 +230,27 @@ simple-audio-card,codec {
> >  		};
> >  	};
> >
> > +	sound-cs42888 {
> > +		compatible = "fsl,imx-audio-cs42888";
> > +		model = "imx-cs42888";
> > +		audio-cpu = <&esai0>;
> > +		audio-codec = <&cs42888>;
> > +		audio-asrc = <&asrc0>;
> > +		audio-routing = "Line Out Jack", "AOUT1L",
> > +				"Line Out Jack", "AOUT1R",
> > +				"Line Out Jack", "AOUT2L",
> > +				"Line Out Jack", "AOUT2R",
> > +				"Line Out Jack", "AOUT3L",
> > +				"Line Out Jack", "AOUT3R",
> > +				"Line Out Jack", "AOUT4L",
> > +				"Line Out Jack", "AOUT4R",
> > +				"AIN1L", "Line In Jack",
> > +				"AIN1R", "Line In Jack",
> > +				"AIN2L", "Line In Jack",
> > +				"AIN2R", "Line In Jack";
> > +		status = "okay";
> > +	};
> > +
> >  	sound-wm8960 {
> >  		compatible = "fsl,imx-audio-wm8960";
> >  		model = "wm8960-audio";
> > @@ -301,12 +329,45 @@ pca6416: gpio@20 {
> >  		gpio-controller;
> >  		#gpio-cells = <2>;
> >  	};
> > +
> > +	cs42888: audio-codec@48 {
> > +		compatible = "cirrus,cs42888";
> > +		reg = <0x48>;
> > +		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> > +		clock-names = "mclk";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_cs42888_reset>;
> > +		VA-supply = <&reg_audio>;
> > +		VD-supply = <&reg_audio>;
> > +		VLS-supply = <&reg_audio>;
> > +		VLC-supply = <&reg_audio>;
> > +		reset-gpios = <&lsio_gpio4 25 GPIO_ACTIVE_LOW>;
> > +		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > +				  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > +				  <&mclkout0_lpcg IMX_LPCG_CLK_0>;
> > +		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
> > +		status = "okay";
> > +	};
> >  };
> >
> >  &cm41_intmux {
> >  	status = "okay";
> >  };
> >
> > +&esai0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_esai0>;
> > +	assigned-clocks = <&acm IMX_ADMA_ACM_ESAI0_MCLK_SEL>,
> > +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > +			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > +			  <&esai0_lpcg IMX_LPCG_CLK_4>;
> > +	assigned-clock-parents = <&aud_pll_div0_lpcg IMX_LPCG_CLK_0>;
> > +	assigned-clock-rates = <0>, <786432000>, <49152000>, <12288000>, <49152000>;
> > +	status = "okay";
> > +};
> > +
> >  &hsio_phy {
> >  	fsl,hsio-cfg = "pciea-pcieb-sata";
> >  	fsl,refclk-pad-mode = "input";
> > @@ -691,6 +752,12 @@ IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x0600004c
> >  		>;
> >  	};
> >
> > +	pinctrl_cs42888_reset: cs42888_resetgrp {
> > +		fsl,pins = <
> > +			IMX8QM_QSPI1A_DATA1_LSIO_GPIO4_IO25			0x0600004c
> > +		>;
> > +	};
> > +
> >  	pinctrl_i2c0: i2c0grp {
> >  		fsl,pins = <
> >  			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0x06000021
> > @@ -725,6 +792,21 @@ IMX8QM_M41_I2C0_SCL_M41_I2C0_SCL			0x0600004c
> >  		>;
> >  	};
> >
> > +	pinctrl_esai0: esai0grp {
> > +		fsl,pins = <
> > +			IMX8QM_ESAI0_FSR_AUD_ESAI0_FSR				0xc6000040
> > +			IMX8QM_ESAI0_FST_AUD_ESAI0_FST				0xc6000040
> > +			IMX8QM_ESAI0_SCKR_AUD_ESAI0_SCKR			0xc6000040
> > +			IMX8QM_ESAI0_SCKT_AUD_ESAI0_SCKT			0xc6000040
> > +			IMX8QM_ESAI0_TX0_AUD_ESAI0_TX0				0xc6000040
> > +			IMX8QM_ESAI0_TX1_AUD_ESAI0_TX1				0xc6000040
> > +			IMX8QM_ESAI0_TX2_RX3_AUD_ESAI0_TX2_RX3			0xc6000040
> > +			IMX8QM_ESAI0_TX3_RX2_AUD_ESAI0_TX3_RX2			0xc6000040
> > +			IMX8QM_ESAI0_TX4_RX1_AUD_ESAI0_TX4_RX1			0xc6000040
> > +			IMX8QM_ESAI0_TX5_RX0_AUD_ESAI0_TX5_RX0			0xc6000040
> > +		>;
> > +	};
> > +
> >  	pinctrl_fec1: fec1grp {
> >  		fsl,pins = <
> >  			IMX8QM_ENET0_MDC_CONN_ENET0_MDC				0x06000020
> > --
> > 2.34.1
> >
