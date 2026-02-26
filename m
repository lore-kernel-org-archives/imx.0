Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2848374720
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772118906; cv=fail; b=tdDOuaocG/b2NE85gHB6q/ZF135VEAYSYBjm2Dc8om4w5tSn7+bifzfwRuh/3XilBXFAinicJ5W9f1ts2GchdYoApJuGYbAAai7r3liUpUNYFzTX5sjKJZnUqapld29tnqDzH20gdQ0obR/9WXaECXshfjy6bfuX6pSqJuOH9BM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772118906; c=relaxed/simple;
	bh=nMsq1Moa3irauR3oMLcLQ4SEoMQlPtYJ341IBKd2KzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=prJud1O0pPwhVZoJLtGLPGZImbE+FeiO0RJ2+seoDKKB9rPffgSI+0Ug5vpHBIic27ARN5cUeUL4/oD6CH1Va2UqreG/0QQzS4OSH36lWSy9UAm6FKhASvmod3CZ2bOmqy0jZHyqkph3VELc0XzmNVyb2W8A0Fqaj5QVPPlgPSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EfgpDIl3 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EfgpDIl3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3MyF68D9GT46+xBWm49B/+xfiZEnsLECAdWn+kVjJbeu8u3EDjCxei1S2g5NXhBrweBtVdu7jvdWxJNwIkuD6YLYbPiWtO8xGz+AGbn4ITq8S32pLORTt53BMWZphaQDX3f7cwarQA347MKQ+n+Ry9yVWsG0sYHirrYGu5s4AyrGIvOjL5FSZMvkmJmg+qfkemRZV6HNukjHMfz0ggkgfRdHPkdsI/Cw2WxsfoNvOr5fLlLUNDh5b1FVtrC0YrgR3HFOU11k8/L160sket6HYM+K4VB4wKm1DDtkm7W3ctoyJxqZEe5TDEVyVuiU6lP4I7FVrVZjicEx+RNNBrq3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0tGSHrmRk8oS8ZpVQih+pK9CRNd/w86RK9stucEguU=;
 b=xBdQkhdGniRwZvTHozR+9wHC/MCxqHasG4Rsdp//xYyk/LQcCbzQ/jt/VP0bXdpne5+cltKvrs6sxubLAH35Y6NarCdVLPtZxYsiBD5QoYTluLaPKrWNbcRUKZcng3qO74oeVPe3brKCHZV5g+WrMKr9srxu8K71HWhR2GjLXLlDDtBkB5LzM+nvUg9XbSstEZ1X2fdXqRgy1VhEY5WBA//pTl2cYXENzXxlajnWtt492TUWDXTW1NNvhc2T2MB1m3uzdJylCvTPdxHspa4Xi1M5U6c3ZpCvKN5rRHRysH5y/lw8FQKlOM7vh0GZ59A0iGCKoDASSCpsK9rUT/LcPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0tGSHrmRk8oS8ZpVQih+pK9CRNd/w86RK9stucEguU=;
 b=EfgpDIl3gTZbnkgPAxNO+KjFKYU77qbizMcHVjYFaCMy5TMrXFhvpuh0jggubBgSupbSAaSNbYJVwMZhiaL/Wj9Abhp9HdCEw/RiaLR1DWm243vTndcevwc8/eIJ1XP6ba8l/GIm43ZHxM3z7oqIM6IXaHNURAgYIvgnfYf+eEdroM1o2vAPIZhOYfuuDwUJEBgIlkQhkot0xodR33HORj6k7fJqKBcBRc9LgdMz60wcKms80hxFuQdc+LQL8kvNfEOY/kSL3T173vJSgcs5rvPrLXuhRHnA/Pd5XeqRXG4ekwnlbsnu+KwWgreiuxDvmiUKk5XqGi/1KotAA7rSug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11502.eurprd04.prod.outlook.com (2603:10a6:800:2c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 15:14:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 15:14:58 +0000
Date: Thu, 26 Feb 2026 10:14:49 -0500
From: Frank Li <Frank.li@nxp.com>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314:
 fix UART1 RTS/CTS muxing
Message-ID: <aaBjaYHoZVRNtwEu@lizhi-Precision-Tower-5810>
References: <20260225083419.5639-1-nora.schiffer@ew.tq-group.com>
 <aZ8YFYbRIHlcmWk3@lizhi-Precision-Tower-5810>
 <ccc6e9665ec8d432a5729fb18a757bb76cd95d9e.camel@ew.tq-group.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccc6e9665ec8d432a5729fb18a757bb76cd95d9e.camel@ew.tq-group.com>
X-ClientProxiedBy: PH7P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11502:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df322a3-e822-4d85-70e6-08de7549cde2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	7jY/vJxEK9vz5xXwyadI6a8kwBysmIBjAnHa49+kFNUzccIG/Rn+ZCwvuxxdrPB9Jcgrolez7ojZmt1g9/6V2atVG1rgFZh+pvDgv0yBmSRskzBTGaj/59B8zDBGTyeQb9kHNanBSnw8XL6efUgMbZup023H/9Q+PWJzOfohBBrC1Bgk1ksmqt7PmHaZWvwIAICgRATXmszW/YKGFa8Iq6PnS9uVFhkOoh+jvA34OmycWZwkYx/prXrsvkfDd60cz23qo50Xfopq9Blck7nXVd35HXM7ur02BkHZWn/F6PknvQHy9J7i1wqfiWbHIG0Pve7KdGdaG3dJ/6QOHsMLZ3ZFdhhbqGdU0Z7GEG0OJpTlNNkUotgx5BYeWLDomp/ELe6/xB4SlS2bJRQtjal/HLNy2bR8d4tIOjCE+daC6Ye6WdFZQfSNYtxO4bglHBzkuvEzkqe5QGPPr/5tKv+yyCwLJmmrxNcwVdKN7nG/k/qtyeUeFxsLA5z8xddUbU1wuuzvJW0Do9lttCsw7nmc+aOQMVxZbEZAElTAsFCM8NkrgEjc6nQuK3WRIuagdem6jvKnwNplCNKRGUtN36Ic0nfdxwYI/63O00et75b1w8y/QSysvCiorszzEoFL9cTTbiTrbaJpNn6pOdhqfN8El55uL37KYNeIEKxTTuXJq3s4K19p1xQHz6XkiAdSWU8z8XsdkWkJJGcLF3hs/uY4fZvnLSbx0QhlmJdiJqJlBOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(13003099007)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Yf4VBP/XJjrX+b4ALBQtZPwPFzlfHFWLVsbKBfgHzUuUjklU5Q8aYHExJa?=
 =?iso-8859-1?Q?0tQUeL+CRARz+9DtV+vOPxTy9rgIsviCnsc8mDu02aWjqmfqCRe1V//tgT?=
 =?iso-8859-1?Q?Z//D95hLZYk7txHUoF+ztwOLuZMb8OvMZDECZbUmz0rrgDcZWlXK3g1X9d?=
 =?iso-8859-1?Q?WiTrIMuTcs+FIz0KUaLCfIzjedVKFBFLhSJdI/SBNh+0rX0z26I/4jbJBj?=
 =?iso-8859-1?Q?XwzN5BoP5SrtsLPntR5iVvp1F+wqAwijLIou1xU0mLbCXewuYTNBwcZcU8?=
 =?iso-8859-1?Q?B1Ib3vuFIliLygbWiKirNKApi3OxoXcZNbPt653dgkaIIvM7O2eiXzMee1?=
 =?iso-8859-1?Q?QRiFgSlR5bSui/rAQLmusnSmJOEd/0KXP7wGMsS9qO2DdTLe24ekD+7FRe?=
 =?iso-8859-1?Q?hKaDTBEODuYAOKrahc36BXBwFadjco39RUyvO7WlOx7ikWrg/bWSGFpzfg?=
 =?iso-8859-1?Q?wK9x8VBtDJ7bSpT9ueVOt9kHI9A1kdJT4pPueCFeWUJ3Fxd9x6hamu6A6L?=
 =?iso-8859-1?Q?Q7b4zJ1HAsUOYe5PlWIWZj+7YoAwugkvcww940nIPPjI+kZoUac1AApG7G?=
 =?iso-8859-1?Q?aE5jzOwIECZEvQY5S77CFmqhVsgvGCqIQhJBDxK4E0LSzOiTQyw4WZn6OE?=
 =?iso-8859-1?Q?1H5jHncWvMRhoqdkLiuGLXxBPRpTvtYbF/SK2II/IZzxMKilr75Ijcu3Kb?=
 =?iso-8859-1?Q?s+MyePlupBC1KCPk3Zs0cIeawBtX7qC40ZZr8/Q33PshEdyAA6aC7VquL4?=
 =?iso-8859-1?Q?lZZlsp9tMHgdTmAG4CiErEUHa0wCHeT1ajrAwo1s1C0I+To8JsUpii1BBV?=
 =?iso-8859-1?Q?Ch/IcfKiBnuNnW3BwGksMuuQtXhjVNpepP3dsYF7sy0E8/jFjhHxJhQ300?=
 =?iso-8859-1?Q?i/sg5NwdJ8xwzcWEGRIkQOar3RreJYaZQ9j8Z4fANhbcZfsEl8qoTTl/+N?=
 =?iso-8859-1?Q?8aGl0jLtHrsUOETA7Bt1HMpo32LdSV0lomZrh4tZ2RFuuMnTJFP2P0H2TA?=
 =?iso-8859-1?Q?ctLHhxKsAw/lgAdJtwQp3UuxRcDloTQ6a8dTt3jn/fgYvb2uNm287EeMQt?=
 =?iso-8859-1?Q?OJH1t6b2M8oMbvPcjyI1QZ91NDy+jAn3cddLLoioHcnOH5Hk7PzpROCjpU?=
 =?iso-8859-1?Q?15N9Vt1KP5NkZZUJqxxIpJnlVuS5CFpOWCwp76HZu3iAKHt8nfX4UWO+uC?=
 =?iso-8859-1?Q?QAJgFiwpCltYUR11i3JuU1IRQpAhgMycOpsQ3/Z+ngbgpk3PCBTlszElFc?=
 =?iso-8859-1?Q?T76tyyk8V3KeQTJ17RwBfHc7YHTXkC5hCsEVUi2Rh9svVMrGNcfE+oOxiJ?=
 =?iso-8859-1?Q?/0acggf8sTDdUN8Bipek37d3eybnS0E4Zd/bv3e7HP/m6P6EedcCksfKn/?=
 =?iso-8859-1?Q?AZtw3LLN6Wg+rqkuG/6hjImFVao+Lu1+s978arISUc/VgJyJD/MMKySwZn?=
 =?iso-8859-1?Q?22dEI16GcJBfQyb4RQ1/DimjIMF1Y3XgXJlq4fCU57PSmSEax0YWDX9nXL?=
 =?iso-8859-1?Q?DObsBaVKHCS5y0u95XtTyFBNuxt++f7LGQU1Gtg6kqS+1i/c4s+2nQh21t?=
 =?iso-8859-1?Q?JuK2pkVbudOSXGeTULlAtM3Nz3MxL4Cod9h/a3buBV0Rsz5bDuUVPqc9fq?=
 =?iso-8859-1?Q?XY0EiZylVVBpe9Sr/Idk+yjX5FL9KamZu2FKHCkBVQdPrPm6m5qS7qo764?=
 =?iso-8859-1?Q?1Fbqhikbq+N1YKWAlLQAWGfKzdYt0bC7XvyupmiH967dG724FWprlZKMtD?=
 =?iso-8859-1?Q?YeN9F1/XsmK+YwqpkMoYKC8fwrxiZ5RzdE0XsO5SfMfmDD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df322a3-e822-4d85-70e6-08de7549cde2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 15:14:58.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdJSx8n4/bZ5PYWh48/bKtduG/PvvfM/T4+h8jr7FHMsOGgr3ZQf1j+rqU/O4z3DLxHD+Xfn1yt30KvCox4zaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11502

On Thu, Feb 26, 2026 at 09:52:22AM +0100, Nora Schiffer wrote:
> On Wed, 2026-02-25 at 10:41 -0500, Frank Li wrote:
> > On Wed, Feb 25, 2026 at 09:34:18AM +0100, Nora Schiffer wrote:
> > > The pinmuxing for UART1 was mixing DCE and DTE modes, which cannot work.
> > > Consistently use DCE mode.
> > >
> > > This switches the RTS and CTS pins, which is fine for this board, as
> > > UART1 is routed to a pin header.
> >
> > Is below commit better?
> >
> > UART1 operates in DCE mode, but the RTS/CTS pins were incorrectly
> > configured using the DTE pinmux setting.
> >
> > Correct the pinmux to match DCE mode, which does not affect existing
> > functionality because UART1 signals are routed to a pin header.
>
> Hi Frank,
>
> your commit message sounds better, do you want me to send a v2?

Yes, in case I miss change it when I apply it.

Frank
>
> Best,
> Nora
>
>
>
> >
> > Frank
> > >
> > > Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314")
> > > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > > ---
> > >  .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> > > index b7f69c92b7748..1665a5030b993 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> > > @@ -848,8 +848,8 @@ pinctrl_tlv320aic3x04: tlv320aic3x04grp {
> > >  	pinctrl_uart1: uart1grp {
> > >  		fsl,pins = <MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX	0x14>,
> > >  			   <MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX		0x14>,
> > > -			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DTE_CTS	0x14>,
> > > -			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DTE_RTS	0x14>;
> > > +			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DCE_RTS	0x14>,
> > > +			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DCE_CTS	0x14>;
> > >  	};
> > >
> > >  	pinctrl_uart1_gpio: uart1gpiogrp {
> > > --
> > > TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> > > Amtsgericht München, HRB 105018
> > > Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> > > https://www.tq-group.com/
> > >
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
