Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA69F3CA48E
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078970; cv=fail; b=LhkQMC44Z6Mt2Dg7yeKg+DASMSx0Ij5ryqxRIBae6425RMdCawldinJw7lLan8K4IJrSOiCVASOxfkr3N7lXFmodCqyjXx/F67GpG/VeSaVsNn/k+tcA7ZSsvyiNv+nQR5YrIb58s0/fkrn6XSRSrzsApRS2Z0ifuTkz0yBkM0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078970; c=relaxed/simple;
	bh=aTB9/mOlVLWFW9SCSDVPXKXWA93QwQPlkiFJkXtMLIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WHDzIpwJ/U1bnLOFtak7uD7BYhyqc6zJyz6VjoplZ5vSfulVbM6ipNLWv4/rHlK+2N7f6aLq0PkqKk9X+i0exEA8LJgtA0BztT9Ydyb/Wezf+VZaDJEFjl6HKPISByATUNvWhLorPqnCecoW5WHgeizDwxK8NFbQ4SGkdFEetug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X8YayfbD; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X8YayfbD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+//Ga3zPPvaJrZhbCjSeb5NK2RgWl+xlzLb2XuzX+htqu9wCyZ9tDqLLPXSObUrV5FkfmfnUBPZjK44UGCFExwnNQxf6wXQxJgq0lHDW/L4Ib4AOXcB6CJyRjx3waS2u0kR9OFCVeqEVDRAhilaJro9wgEmEnd232GHT5jqOecBAltyh2JFqP8NFF6PWwlCC2nP9FVS5qeVvNJsmqXDsJN7eXrsZyFPwL4DNAr81Aszl+a6KYF54Rshx8Z8vw+6O0yRTF228wwNTbELDvw5rDFQKFZVeNkonC7JoxdNutu5Y6tV3u+QAL8NsBB9QJ0Ep+wNjmN7e6JgQXMPaDTRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t80gl3IUWbK7cUtRimcj9he7fKdt0GDbnCJNahf+y1o=;
 b=ux+r1MMxsfDeVXDOeBDg1M2KoS53DNYu4G90v6Mg/g/O1SD5khNVLFBJYuWWW+tGEakscNXTHMosXgOO91D0pBVNu3gKZFuOQzZWmoIIycPTDNeRselLSR3lwhUqN/UaOAWs3J2mRLx6v5aOHYa/1ie8a3BuT5/iwHKvx1M8QoIKfDIGjVpGLPM/BGuMdG1FUj3vylmL5TFCfYUf/kg5QJ527Zoe/3YObGtqITo2a6tLmC144z8AbC/y/auX9gywGrebgFjZaix7zw/xbmigIqKQbUDkxxQVRmYWpguRBv6HLNOB+87Ft1weuYqzXXN64eX7rhsNLtOL30Fc3K/BIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t80gl3IUWbK7cUtRimcj9he7fKdt0GDbnCJNahf+y1o=;
 b=X8YayfbD4fPnJ7inXz1UCucqWGnKWKUq7QPPJVVpujGL85HhraaOowYvRi9YkcTi+V9DLjceI04OVc+wnZ65s1tyt831eEsM6jddyjZ6nzM7xADMctPezplJ9l8AArkU+8MTUgPr/prGJlewXCddH9wwK7aNBMxN9kwMvamYnN38KStPBGCQZzIfTRc8VHjv3Ck9njEFTFO7ZPP+Az/BfYjUXn3NzT1TyHh9PHcLWBGCy/JkJ7w3Si1c3V0mlPH9kqveWimPIVOpIPYQUoTUV92R3F6XiSVBbmPsmzmx4PWVrWcyXFlpfwP4p+Xxl3hSfChDUd7rJ8cBzEsszLXhSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AS1PR04MB9560.eurprd04.prod.outlook.com
 (2603:10a6:20b:470::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 11:42:43 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 11:42:43 +0000
Date: Fri, 3 Jul 2026 14:42:39 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, vladimir.oltean@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/5] arm64: dts: lx2160a: transition to
 device-specific SerDes compatible strings
Message-ID: <jzpkcoqnyl63w6ugyv6vph3yp7fsoiemutqknqsykd7ebyw3lo@qpkzhpknirk7>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
 <20260701131137.940145-2-ioana.ciornei@nxp.com>
 <akUjt5OPiO5cJ1D9@SMW015318>
 <b5lpw3xu6svsq7xmmgp3jn4cg455zhp3iw4q6lcsxq4bqy7mwh@guuitghg3xal>
 <akZYUNtEmdLp0Kvu@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZYUNtEmdLp0Kvu@SMW015318>
X-ClientProxiedBy: AM0PR02CA0158.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::25) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AS1PR04MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2b5b19-bf72-4592-bec5-08ded8f831cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	adVv94MeSGGaYecl8Z/3qKJ3JXh2T9ENjvEjsuW58sxJawqz7r1CYpmWA1d8UakgS6aUelPLKwecVoZnvWLgpBMpVZd5GIHGL3V6212pMbvdwEGw+0vFkQqg2G0K7SYv//8ANRj/t6B/HI5dg9FN/UmdjgQFLXqWKU/f3vWEgToI9swp3fIpvbmh9+7UpdeMCG17iUzt50r3RrsKO1dVOivB+JFbmV1ZkcjTlhRnxkbnOEmi9vuxbcbUPUSmS/wmLCFnurcxfUwJcoRiJkYB3h+ihuFEEP5lxK/8yvLFjzOgdIqrR5lhofkyynyBIG6FlFbbkFWTJCdwuC6w8Xwk8hqAuObiqBylm5fECKzI28XnVjfASt33p8admhFeG6zgbreDmxcDC9fiOCx5krEOObspRk4LvetMGokKV0OWq8jtoeUyK0Ba13t5tKLS6PipYul9XsHPB6UFQZD5CpVJlPoRoYqyDdkenmYaKaJFROH80ZnSbRZXIRRfGpdWo9JancVlc/UeLC8FPp6Uq4UHamVNRuoXcP1FmabcN5zLSWl6qTPGkQVdXMlRGI5bsPV0ePEWLO1tAAKRfXhssgnC4gnl4aYyEiGyEuOtYssLpc5RJasvGXJYz2uVWk4fYl9I4Js+mOLQ+emFz8A2t7/uCZ4Ypmpe9vRn3OWjBziFCFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tDhqms3J2v4W2ERRcvRPhhHSZ7rAWZy5hCPYLkM6x0do/CcDd8kA6IiT4NJl?=
 =?us-ascii?Q?Tz9qIo4g+LRE1EobuFcvg5/hVtUg/DwvBi4c/x2TrunIGOFxSmEXIJHYCv7y?=
 =?us-ascii?Q?3JsZ5DtgUWVlT+zIebMdFWapyCisnMltt9TuryCAIIJseIS1bbBZMcuK9kcW?=
 =?us-ascii?Q?ab6DgGR63QYVuzaOARHAXK71kqvw6GimwLNs1Z/0Nzts6wp8oQ8yd4jy7Zhp?=
 =?us-ascii?Q?Xc0nkIsXTjWNRDURoE8tztvL5tCGU3jmiuF43xYzmfzAbwDqv1hwBDqOz1OU?=
 =?us-ascii?Q?k2BrkFn2068+KDE9ZiFmqgdx8Lkb27BvRAyfFCCwnuwrAUttGVgLaMpDgUDj?=
 =?us-ascii?Q?qG7j0N14q5jmij3IP9MOD8G+TpasGxvdMKYwbmu9fJP992o/apSqUnAVDIDn?=
 =?us-ascii?Q?pB1Lua/bz8vVrTXittkcy2YMC0BtwE0yaLL1h05uquETFdLh+rTRulApKz8p?=
 =?us-ascii?Q?/s7y55D+Fq78g4HU7lgCQ2ns4uwACWY6WD3zzk7Kfa8f5iUp9z+rzQTOdyoj?=
 =?us-ascii?Q?M9otKV+UoYvLYno4COEJhHQWLY1/dsCh/4LBP0rHHUUVwlRjnu+YWZQCqWII?=
 =?us-ascii?Q?74INY94PDmlLA2EMGw4GYCOjlxQ0VhXwd48TxFvpu+iBwxCQCIsfJxkHE0vY?=
 =?us-ascii?Q?Dq3WBkoxjVmEakx1Tga4IjU7YlQXYx6uyadn65OSY2erSAZiX1z4E15QODco?=
 =?us-ascii?Q?84//T/ATLxnq2K8Y0vG5aNqRqSrjXQygwXl/nG77wTJOooKcpnQqCfJ6MuOn?=
 =?us-ascii?Q?2CkLiqV4IkQTvA0rEVqi5Hrh8tPyYcN73AimkLhUlaOk+5Blf6S2eUBN7HKF?=
 =?us-ascii?Q?5U57sahNCy75uK71CiDGlC1PbsSLDi1GyOmNl4KnU5PfEDVgxD7Z5gS3HNXP?=
 =?us-ascii?Q?u+rEqM6H2odxSbQgRXxjtMTFq9Q9vAmaczvVZ2wOVlYjuuyVgE0Y3F0RqAfa?=
 =?us-ascii?Q?UoIonoqLgDVaIf9gkH++P86H+csIB+1i+S7QzJ/fHf+x+Tme5bS9Q0GIiErC?=
 =?us-ascii?Q?oaus3oWXmGz4rsrtCqzg4emNyn04y5b3J+jD5JyEWiAIitPFguwpmvtWc6qy?=
 =?us-ascii?Q?h8S1iYCnKAjuBBtcx180tsBvSbICeyLz6XgrsT4aT7yjIRfbshQ/frPg/QQH?=
 =?us-ascii?Q?JBCO41brTLfrC4xS/c2wKQ71nqDOaW4OHKczsQRYrWEVFr13IEsUJJc0G4gX?=
 =?us-ascii?Q?xboonOcPw3jagUAk5UeAuZXqAWhQe2TZwhP/3KRfbtoCnYOg933itC235RlQ?=
 =?us-ascii?Q?NC4amXzQltMEgbd9rXvFbhg/10p+yu2OCZqoXVWiQOkLwciyVjsa9ebML3t/?=
 =?us-ascii?Q?tsGMT2SlD5b5oOFz7OuFCgma/+4OUe7N9CWtJG2H5bfljXfc9pIxrEJpMnq2?=
 =?us-ascii?Q?VaeuK+0c5URcl9Rtl+uoeV7fgDJS1PP9mTHpcBHX2XDFy0+qdD8C02hjhsZX?=
 =?us-ascii?Q?lBPJNhrLZpeutG0Klq0YZUh2G9nIFUWN259jXn19raCc0hnADP9AFpSkhFtm?=
 =?us-ascii?Q?tKZo6s2XAKZadgQGLPoLb58HyY4mR9sGafdSAQ2kECft1km0vnl964e/YwAU?=
 =?us-ascii?Q?Z0zutDKmYSVLh6V+eesmlVelY1aKp+vATLsE6GMpB/gbwYBAP8MSpv656yFR?=
 =?us-ascii?Q?vrFmownm742BHIHpc8RZrAryYrlQDiEayPTkOMhXvAwzk9kttl/NSeX+tI7r?=
 =?us-ascii?Q?MRpzagoMZB7F50fqr3dN1hyE/mr2+zuzo+5gim/qg70Voh4J02IyEfUTcWEe?=
 =?us-ascii?Q?icqTzasQZA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2b5b19-bf72-4592-bec5-08ded8f831cd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 11:42:43.3948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rd8Jk1yo+y/QgFQaB1m+P3f0NlcuHiaFu8OVpTvjDBsnRbePVieXxDUVmcIppuWsO/sFaeYaySvDwvmeSfLNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9560

I just realized that I somehow didn't reply-all to this message and only
responded to Frank. My response is copied below now.

> > > > +
> > > > +#include "fsl-lx2160a-rev2.dtsi"
> > > > +
> > > > +&serdes_1 {
> > > > +       compatible = "fsl,lx2162a-serdes1", "fsl,lynx-28g";
> > > > +
> > > > +       /delete-node/ phy@0;
> > > > +       /delete-node/ phy@1;
> > > > +       /delete-node/ phy@2;
> > > > +       /delete-node/ phy@3;
> > >
> > > Now, do not perfer delete-node. if ver2 is not include phy@0, ...
> > >
> > > create ver2 files, let ver2 include it. Now most people like A + B, not
> > > A - B.
> > >
> >
> > I am not sure I follow what you say about the ver2 files - are you
> > referring to -rev2 or LX2162A?
> >
> > The LX2162A is a version of the LX2160A SoC, also known as "LX2-Lite".
> > And the main difference is that the LX2162A does not have the 3rd SerDes
> > block and only 4 SerDes lanes on the first block.
> 
> If it is the same die and it is disable by fuse box. I suggest leave it here
> now because default it is disabled and try to access-control-cell in future.
> 
> https://lore.kernel.org/imx/20241212-imx-ocotp-v1-1-198bb0af86a0@nxp.com/
> 
> That these nodes can be dymatically disabled it.
> 
> If it is difference die, it should lx2160a.dtsi include lx2-lite. you
> can rename old lx2160a.dtsi to lx2-lites.dtsi. You need adjust file name
> and I just said overwhole method.

LX2160A and LX2162A are different dies but the process is not that
simple as just a rename of the fsl-lx2160a.dtsi. First of all, because
the LX2162A has the same PCIe controller as LX2160A Rev2
(fsl-lx2160a-rev2.dtsi) and not LX2160A Rev1 (fsl-lx2160a.dtsi), so if
there would be a rename it should be fsl-lx2160a-rev2.dtsi ->
fsl-lx2162a.dtsi.

But even that rename is problematic. SerDes nodes currently live in the
fsl-lx2160a.dtsi (common for Rev1 and Rev2) which would mean that
fsl-lx2162a.dtsi would still inherit all the SerDes nodes, even the
SerDes block #3 not present on LX2162A. I can combat this by keeping
only the common SerDes nodes in fsl-lx2160a.dtsi and add the necessary
extra SerDes nodes in fsl-lx2160a-rev2.dtsi. But this would leave the
Rev1 dtsi without all the necessary nodes, which is not ok.

In this context, I think that if there is a need to not use delete-node
I need to come up with some kind of a scheme like below:

fsl-lx216x.dtsi			---> fsl-lx2160a.dtsi (PCIe gen4, 3 SerDes blocks)
(no PCIe, no SerDes)		---> fsl-lx2160a-rev2.dtsi (PCIe gen3, 3 SerDes blocks)
				---> fsl-lx2162a.dtsi (PCIe gen3, 2 SerDes blocks)

For the "PCIe gen4", "PCIe gen3", "3 SerDes nodes" and "2 SerDes blocks"
above I would add independent .dtsi files that can be included as
needed, so that there is no dt duplication.

That is why I said that there would be a lot of unnecessary churn.

Ioana
