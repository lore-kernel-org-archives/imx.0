Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B086C282F32
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 18:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255585; cv=fail; b=E3zS/jy0sgLuZIep2A/zQtHo0oBz7wz06GBwNmOCs+hXGi4MFhmI/3oZWgx2eOg4HPWgCoqSN4O7dXrtmtFp9xMV6WrjwNX3s8Bh9vBVf+vdB9ioAhY902poTtGyz7rHIwdMsyQ3/J7EPFPWfULaWeGkCPw6XYgr0DrE2OIe0E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255585; c=relaxed/simple;
	bh=31wL4Q09fr4cWY5t0jofiT5xDITSqHHr6BgiKVfRsUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hhjWroS+Zt9trYc53JGuc+XyoBSxaVRrRCwaaYnrOX4S/GAA3B9F4bjQ6sw4OBHjg+Fsf73AHj+Ukgg/ZlnJ8hX0sjIyyQ41Ah7t0Jl++1ANl4C9EpucKqp0Qp1+UTArRnSUrj6bbosXJO7JtoWnxb2nLwg/HwZNl9l3cP6NV7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CbUDVApm reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CbUDVApm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUMgXldrOb/xi2JGK44K1vRAwIM2Q5IFwUA+7Vpeex1dgFjGrWfgJIBgRgK5syTuhTjfKUBdg43W0qfKWixFmaR6Tl92x7PIvZehfX1Sli80tKAB+9HUdPwiZDAJNxkP7QCk1TAP861jA657jKtGhijC/uNbPoiJ6NjabN1gvhvIJ/to9qCoy8Evzki4wFM0T6ZnBh2GmdP6DYGoSNTEFImaw1FgZPZZWyH4EiYHRxXTA/wM1dxT/u4xIBgvcon1Hx0Cb/O/1b3JWWJP9REQcKjBZeQecj+bzVpzt5IzFoCuioJNR9SrPg2mLtr5rVQBJDPKj4mKv5AMkq01McTPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJg9yXDswRq4WRwoa86u2Dva3IrahvZuDFcOPsw6dE0=;
 b=XYwHF4lb22VEoZfA+0XAa3MAPpa+GdGDS6ETprsl0Z/3TpXK+RyVMShSlLBHOtdPE0V6vF2dkN8Weg6h5PUH9ncK6P8RKDG5lYwKWEl4sllJOgPyQk2m5mmaqIZ4SvrJLBhOZiwfxpnWKEK+ZahIUf6NP1qZhphAawwJ2k3JhEjeFzKuLXJz8PVetrxKJSeYaLCkDfr/oVbHlZP7uSm9zMuFR0y4wi3YDFqspArPPpRTm1eDSzxg+kDd9mmNtEaDVIMdYaOdQ4neGLLgQsa2r014MUWxkrp6en2NZ9cLpk+2eycVnQyuinRmyj+7AQdkStCd1FxB1qG+bJ8EZ4gy8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJg9yXDswRq4WRwoa86u2Dva3IrahvZuDFcOPsw6dE0=;
 b=CbUDVApmNJx14oWWm3gNmnv4H/tuCUAvz0/mRh0grOpQe3Soh4NxBNtVG45EFnq7F64AHWkQ2n2eUcH0ohHnZdFFyS8Jnl4MQZUHeU8VHxnyaB5RZVDt5YCpKJ8qd39RpZZDdZBXTGDYm3GsWJDdgBbVlRq1LJC+eNNTjteZIqKNMV2e5a57Oc1nn6L1ajtYZvPRez2nOev+e8r/TusYhUXFqbgnaGR34Y9MUA8v0ZRBrtRBKSoZ0MA0j6wtX73o3dFPRGZfemFw41FpQcp2KPQPQ5JHLAm9IwKzbsbsvNg5QQfk8xP1GxZUJzSn085xhPlmnjAj/5KlHDmG7/TTMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12322.eurprd04.prod.outlook.com (2603:10a6:800:30e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 18:59:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Wed, 11 Mar 2026
 18:59:40 +0000
Date: Wed, 11 Mar 2026 14:59:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: imx8mp-tqma8mpql-mba8mpxl-g133han01:
 Remove compatible from overlay
Message-ID: <abG7lPsRZZBIz5m-@lizhi-Precision-Tower-5810>
References: <20260311145222.1749655-1-alexander.stein@ew.tq-group.com>
 <abGWGel76qoy20cI@lizhi-Precision-Tower-5810>
 <6599983.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6599983.31r3eYUQgx@steina-w>
X-ClientProxiedBy: SJ0PR03CA0388.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12322:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac54015-1e7b-438b-3068-08de7fa05971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|19092799006|52116014|376014|366016|22082099003|56012099003|18002099003|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	UDhsx5P2EBWc+uAj9i2KlULJKlm9rzPhLv948Y7Z3UNxj1BYT/AffmOspQ0Q1Qnh9fD/7aY+5mXFICaJ+PNf4O5QzHszeJu0m8yLWl2jWOKzo+HA0WS/sO/v9sNWKO5btE6gEnsfFaYZkpT2+LLilnOyZ4l/g0bSEL+XkfhYFEDCLU/hwx1G9vLGAYXcmVnqMqEoyk4rXTs7TqVNWvvJtzFeVVBU/NQmaWL6vvBed4XAWOBixo5LTBLi+Hjck3F2PmhpjLOr3DIxB2Yrj1hovTHGvJ9CDehbwqQrJswu/wam7Qdoz2pbHUan9rMSa7jGch4DvrY6TVAalJx9d7VCQxbHxBwz5F4kp90GotxB/PhUjZVQX5ZVxwBc/i2sxfPuPLdFgQ53YVHSN4sGhBHcSoRXkHKPWVr9T45302zYgWPqp/J02uhNxBDqMB4mIkBJbVbvZLMmgE5jOL9ACnig5h5oYedDk0JjLZAVV9SOfrvI5UMism3GA+jQe3hrCldFhS7bU/DKMAMCDbMIi+sDAJIz30EV70Z747YAJGbDsQ6cP4/cTLnQYDZBo7fPgvnOyTeMOeJZFJ6J9YszrInD/e2119QQdoWBuLFjGggdU12BYoR+VHN/vwTO/DeeG7dpupuJJSL40H9gGwBZJzOfBzWo+wsbPGz0umtEqy9idvdagwkyM5vTbdp9BYs0KHeS2kBGj+++1BLelvbRoXn0cuDiKUSExH82M3lyqUtT6BI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(52116014)(376014)(366016)(22082099003)(56012099003)(18002099003)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?EmjEXb7t3pFY2bCc3fsHDAwHjsQT9y4Qi/EduBxQ9KGt8GPxTXdKsDfRlB?=
 =?iso-8859-1?Q?WDWC47ntzpZhmoSil4xwzW1g4RhlhJwLjaVO2nj9TaTDMtQ+MaErNPWSq/?=
 =?iso-8859-1?Q?tpfq+jZ9n+/rZgMAEUKBEw70Ml03hxY+9nBHtrN0oKYIF9Ev2gYIxaOKof?=
 =?iso-8859-1?Q?1jiHf+x6j2gHhGO4SxnyfgOkpWqQpNrtyjMZh1ajCgzgjpdef7iNzraOwf?=
 =?iso-8859-1?Q?vuqlhhe++OHJB/rrKPJ2j330gKz4qrw4zT+GSTbE+jcDGT4WDk/q9YKyH1?=
 =?iso-8859-1?Q?/MrzM0Z0Bmm6xbNloPcusmQwW4QeuNAI2cdtgEBXVg/mbVppsE/ob5mdGZ?=
 =?iso-8859-1?Q?R5017Ja+pnRJUXVgzCrNti41vCk5064JGX7Q4xDD6HqJDc9FoEsNP7grQt?=
 =?iso-8859-1?Q?xLBIqWIFLbVQA1Z7bAmM6Nlsz0L0CWkeyX6HmUyEmuTaPmdBzDJ5v6DVmt?=
 =?iso-8859-1?Q?vKlBUKwrqOSK3apgo66XFQcpm9SlYaW7MQ5+1uOa+TtsViGePZCZUOXrSE?=
 =?iso-8859-1?Q?7ClsbruabXYbInWujg65nr4eWDESeCl651VgYeJ7MzAe8cqTCVmbz9eHgB?=
 =?iso-8859-1?Q?o8wg+meCpWc0ov/ob7o2LiznB5Cosa0dxLk3mPcYj35TLSR/uJryWiHZ9z?=
 =?iso-8859-1?Q?UUKrWIS5h4jr8EKMyLardpAkiW2OfxSv7RjRAjhKvo5LMnsUfcuKz9luAm?=
 =?iso-8859-1?Q?q5UN0rYz6E3NlgMG2DMU3IBoyY+IbZNvHRHUjZqLHKjkEsZ5s1WA07UYQk?=
 =?iso-8859-1?Q?DsIv+ik9IDOwYlZEyurxRn7UhoIPuS+PnF8+UHc15cyHY4C22ywxYwolGY?=
 =?iso-8859-1?Q?bvF1Jw5Fg70EdtChYv7e2mLQqkISgqdCK9l6GCjkz/oHHFqcs2JO5LNKrw?=
 =?iso-8859-1?Q?UPe3WYr4tGpMlpa1qn6OdvfHTpIXcua7Edm3kWJQKKCkaKHhTj3XcaqVBM?=
 =?iso-8859-1?Q?qIaBtoX9OZrnEa59sI3iJvajujkDKavX6lsUsBlY4sYwlzSEpcDtAtUc7f?=
 =?iso-8859-1?Q?u06r0xax5DE/Erw99jtPMabnCfOgtt6TN2RSTJOlBh8NldqbFuEAmeuVO0?=
 =?iso-8859-1?Q?ZAESKuwy9Qsgr/9ojCAIAmYgKn4d+VJ2w9XqfTIBdvrHa9EgpBMdwEknug?=
 =?iso-8859-1?Q?1oXTTuDd4MyFNcO30zNJEN1q7pxkke3pAiuGa0ns3a3n3QjBorr6sziJ2q?=
 =?iso-8859-1?Q?oecB3h+ZvpD+OxUyrPNsjwdKRvCbljdR7wspEkkva6mHS7qFCjemEOLOpk?=
 =?iso-8859-1?Q?SAUsINP+TQ6icqVU7LSX12BvcDK79nmracN5drl3VDSNbz/jIvN7e8elbG?=
 =?iso-8859-1?Q?+WTM3MVpMmAWcLV+Qp4HwkiDjjM3/rsz/5yTqwLMSzoYqDJ+ESocQ71Jxf?=
 =?iso-8859-1?Q?N2wZ1kugVNKhs8rOsJlmnWPlQwIf/KlLLuzLDYfEjimEk7s4lMrzDV8WLq?=
 =?iso-8859-1?Q?hQN71A7i+dJQiFLWO7qNDSReR9oaAa5zwGAkNxpDZKeEBCQNzXfEIvJ35h?=
 =?iso-8859-1?Q?2vy0jS2IFVaGzxxZ7di4RydlROl810sRRsOzvkScBGFpJBvM/z9uQ2BEs0?=
 =?iso-8859-1?Q?5Rsq2CfcnLPnYcMy9Fn1dPWS0FvBp5efWY2ExncO5LgVaisASZ3mbNRXtx?=
 =?iso-8859-1?Q?ARqa4Dw2p1nYZJCIvr+R8fb0m1A1uVbOFtG1kvMnYO0/+aleAIFD5hL7SO?=
 =?iso-8859-1?Q?bwiguZxNyf9k884p/QheBRRdAv45bDA0Ae+EiDbb2pQADPpGu3ViwfbSU1?=
 =?iso-8859-1?Q?Xn4WTedquvR6Ud+UGdg8CceUZmzHuUpFqWqO9+QwBICvWGjmP1VupVzRjP?=
 =?iso-8859-1?Q?GokyPsl0uw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac54015-1e7b-438b-3068-08de7fa05971
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:59:40.6869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pI98Msp/jJjA7VDWXBuj6EUH4d4D03xItrVTXVxkMuLOefh0CH5DOBsl7txh6SB3pSfeMN+s57U1kLpZIDoAuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12322

On Wed, Mar 11, 2026 at 05:49:23PM +0100, Alexander Stein wrote:
> Hi,
>
> Am Mittwoch, 11. März 2026, 17:19:37 CET schrieb Frank Li:
> > On Wed, Mar 11, 2026 at 03:52:15PM +0100, Alexander Stein wrote:
> > > There is no reason to override the board compatible in a an overlay,
> > > remove it. While at it, update the copyright year.
> >
> > Any bad things happen if overwrite in overlay file?
>
> You might override the board compatible when it is set (differently) in
> the mainboard.

Is below better

"Override the board compatible is unexpected, especially when the same dtso
override difference mainboard. So remove it and update the copyright year."

Frank

>
> Best regards,
> Alexander
>
> > Frank
> >
> > >
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  .../freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
> > > index 5058cd9409c75..129b02a69ccf0 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtso
> > > @@ -1,6 +1,6 @@
> > >  // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > >  /*
> > > - * Copyright (c) 2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > > + * Copyright (c) 2023-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > >   * D-82229 Seefeld, Germany.
> > >   * Author: Alexander Stein
> > >   */
> > > @@ -10,10 +10,6 @@
> > >
> > >  #include <dt-bindings/clock/imx8mp-clock.h>
> > >
> > > -&{/} {
> > > -	compatible = "tq,imx8mp-tqma8mpql-mba8mpxl", "tq,imx8mp-tqma8mpql", "fsl,imx8mp";
> > > -};
> > > -
> > >  &backlight_lvds {
> > >  	status = "okay";
> > >  };
> > > --
> > > 2.43.0
> > >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
