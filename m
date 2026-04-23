Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011053.outbound.protection.outlook.com [40.107.130.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2213ED5A0
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776950284; cv=fail; b=jyEMO65VIkh/H/Nqe5O6tJcG4xuBkiJYVpvuaCJdXsMBMGB3RtD4fIqquMn03gz2ytlqkOZKCuYwodt3Fp/PG18YFNpNY6P8GbNL6FMLIHBMRXgt0W93LoavWrGlFY1cPQmj8cJZMzSbcORrzyO84mepVFTpS02b2Hr5eNiAHW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776950284; c=relaxed/simple;
	bh=HHOQ4I+Tr6PRmdkPRAlFArKZjJUQkkhnGpRtICvEWno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LgoUMWvrs43/BkEsm+1OWQYywv279NWogn7UACqnzbdGNHrslAbhpXC6w1yPJZ3j9WMdwBL6x+TjqmQDawVaGwDlSKLDzpQt0+fDpRZ5jBtN02yEhURkzSdCCIYV6poAXGv5cuD/nD77B1ZYWueyTIBPHzx87HshuE/ROhOqvTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YoiXQSLB; arc=fail smtp.client-ip=40.107.130.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YoiXQSLB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzUdemp/boLaPAc6vyYY0Y6eY6d+L1O9/93K355Gw5AURtoQenwPoMEQsKEqEMXDVUIs4OtorEVgxgyitihjy+Ac6+7JTE+IgVwZA4C0T0/xHHxQbbz5nBqtw5IiPnxG66kH6r8FHM2tyU+cl2mdcxdK0tIP1i7Ko496HvHdtie8ySt7bD0HrIVqnYp0tmULCuBH9XI7dR9ZQp0qP6+aiiqoVkmVvYP/VlDW0bdcvSLU+z01zE48HfgCUVu/aJ2BUm/scGbMQ3TlgdkUnu0MuAWNffzD7M9x1yevYkwmqrKk1/AE0C3wlgh8soOyzeegiH4vjb6dHXnCN4EnR4Yccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VyXU45pOzjUcHAaO1D/2fWjQFVnlofQkdJKmS+AU8U=;
 b=Pl7KJ1x12gSPSx4duDwstUJMPadzYCIvQKED9JX0afSCqHPhjb2hiYLRie9wJN7Oboqa5gwslHWSGuKA29phYoRepLJgD637pjJ76rh1YsUo4OmX6qiCzdLRKFxcp7/i6LbilaUke3asC6sjNHYEY2henrg/bAnRKOC6zTmtG5/tFWC5eMdhxi1QSk4H9lbw/gm0Jcm7zlVDQon4/YgjE8InC0EnrWagBsATAsxQw8xowiFrkj5Qxtvh0SBFF/VrHskhmuITCFkEMMVm8mgrpYkRryvxnc2RWZA+gci1QfZ+J8OQTnfR/j3Zaw10AGzBFmZ/mHL8IiO2FlkfyLvvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VyXU45pOzjUcHAaO1D/2fWjQFVnlofQkdJKmS+AU8U=;
 b=YoiXQSLBCvRQweJw8pPwqLRMd10X4EuDr2A2Eyz8bPm1swEESw+hLLhTHpxGrz4bugTDXxf0GC6oMhGcL1P/vImBe6EvVoDFbLIngj7cHa9gJbKcshXP0YFMxA2jW2Ys9iILBKfNdd1OIUXkQPyLWBf/bOtjCw/vOmseTZa5H7qkzJvFUvDu8EIHNeBbHsnEvZmOv8QmcOzcWwRADK/6m04q1U168+1ZSQtQGBM6g0PbqZ0rfzt7J3ZBTG7vqbMa9qMqNW7CEngaQHIJi+ZP+DKgpQd8b+R8di4TNsmOJ9QwNKPrOYRfS25lfLur3HWsIfZho3BOQyljwiBre9WBAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB11586.eurprd04.prod.outlook.com (2603:10a6:150:2c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 13:17:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 13:17:57 +0000
Date: Thu, 23 Apr 2026 21:17:12 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx95: switch usb3 controller to
 flattened model
Message-ID: <xw4shqsgxjns527ya7diagwlhohnan3wbfxauyxzxqjavdca4o@y62gcvxkwj6w>
References: <20260421105503.1416566-1-xu.yang_2@nxp.com>
 <20260421105503.1416566-2-xu.yang_2@nxp.com>
 <aehGKE8qLXiBKvvB@lizhi-Precision-Tower-5810>
 <cfyvip6atz6hh57iga5gvkzrdxeorv4tuxontvzixflqn36h7h@2awtzkxkn45c>
 <PAXPR04MB845957613BCD5E86D96FA4E3882A2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845957613BCD5E86D96FA4E3882A2@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-ClientProxiedBy: FR4P281CA0293.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB11586:EE_
X-MS-Office365-Filtering-Correlation-Id: 49eb53a2-cb5c-48af-4879-08dea13abc8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|7416014|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	tb/THEGLfxF+FeSCUsNuM+LQT8S+sEODnLSySQRu1BtIKO6GbnEdzcOwYwjanqe+GZFbcVRqFZBzpo7Vc5MioFAQowvE8Vsko/bLor+6fle4vI5hCTCQbo3egbm38hNGudJV3MCHrgn9Qh31LaRTwAsPkEZ0tvIzjsZk/T1nfmI1T7Od7PaEhAEDuiHIZRZ+7/WU48clUt2Bg4McFHytDCof0od8kn0Pgt/Kx/HpK4Y/C2n4pyRDiow0VJbcu6RvDP5Df5Qm9TWCphNNjMoDLVAtRbG+UKrJEteusBqnpeFxT5umKWcJeLVc1ohcmp1qGzYjX4iP/wfBcA49HVJTcZdujFvW3U93BMJXDfxFw5paisBJpxxqZmBeWP0QsdaTL1Ajw+prGuSb8MDy6UNXCzWjbEdQBzmIYjKzsHNfMT8lZ+SSAzLs4fo6Opy6MBILAgvbESLQY4S+pl5lucBfl69XZiVcjTChX+LsZYy4jqO32XDJoWHWdWILOf07lG8pKn4hdpeQQwkOEznrx6VFYoYEJqvzqghEoZswck4xDqtuFAIbOzzTjdMS8FtYNSOlqffJdoR3xudF869RHLQTlW7mF0+z9r/FcwkaSczraybEy/KLsSr0pPBz/eF5e70H8jG5KKvMErIyMfEGvmjl8JC15bpFFLl9aLLixtwq1QeCHTNWW3hvamk7vnemPN1H0hDwMzjwMEoy73hxUvwFJ/+XB+Iu2rVxKDQUIKHPkuMVHG4QxKAm2RfdPD418rBgyW62z71AQRhUjsCAJfMHSMVFCP7/IggxawgZHkVg90k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(7416014)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G2eMDB4WlTxf5pBOe5Gi6FqU19B/bVN81c/uNzYVBShXnKBvE3t8Hr5Q/L/K?=
 =?us-ascii?Q?kO68ge7dwxdInj1BzTKY7/S4SKYptNpCHEL/vn+iNkpRFeKn20z3Z8t9SWg2?=
 =?us-ascii?Q?BOeEYeGHOq3jGmrsMMPLZ5g5cSoHtKvsAbtSq5WAM2+RqCEGQmkNltxlb072?=
 =?us-ascii?Q?+3KcqHlYr93Jt/m0ioE76Hk/wjI1nBgfsFTLo9TsFEo3/K6Xqv9ie40qhZia?=
 =?us-ascii?Q?Z3Sq3ZsS2GsGBdv2/PN8RxLKPw/I1H9Sp9SxBcq8/SkQwY/IEUvPphY8tDJ+?=
 =?us-ascii?Q?zIAWPANQ+V5drTjI19Uj4OTLoZz6OyaDUV7FQDSQ2fNKbK0KX8BobXriJ3ym?=
 =?us-ascii?Q?O6boydnm8OroR0/m9JIFcZtSWebr6v2Udsu7DEumjS88K2UG0BDWZkth9ZHI?=
 =?us-ascii?Q?337kltUkrPoJu876/af1RJ2rSYdhY343gSUa/yC84LuwoW1Dv5gJfcZw7jgN?=
 =?us-ascii?Q?AT1z3TsuLsSFGdZh9kv955aVRMLPKMlfKPXWgdyFg83jtO4XlBRqFKSMJDvL?=
 =?us-ascii?Q?Ri7VviPs83EaseTsmi3bvqS8Qi3d+BzReZojswQxE6QP7fJC+tvnfDxf2Gb5?=
 =?us-ascii?Q?WktoYQJGPGy8Of+yJQUA9eH+eJG8K2xZvwdbWvp98aLdV0E8kMR5Qr1epoRz?=
 =?us-ascii?Q?1dPSfBr3KafAPQ7PmqPleWeFBWUk3ZIlBXTJIHJXIUvsg2nef+GWweGF1xne?=
 =?us-ascii?Q?tVLUmJtIfGP3qBaKt3yNroDKGCIUXCrDxS/MxOBpXfshGvFBer1j7IZ8BBcs?=
 =?us-ascii?Q?qKEpfbAIHtW1SjRnpu857Ug8c6NWBl0buBVU2c+xe8JySzGSjiP1YSG7dGag?=
 =?us-ascii?Q?8uau7BeXcgdQ9jC/DU5lU79v+0X3C00CnX0JpK7zVD83n69w9Hliw08Q6kxK?=
 =?us-ascii?Q?LuDDiCHy2ewY/w9hy6uEyw3fvShlYZBgwnvLL0/a7YtcRWajGx/ewBo6OxXb?=
 =?us-ascii?Q?Ae9HhupM9a/WqoUZGn2r6K6swGMtcxlYpYhzs5fTOf7bfq5QX3ovnjQd/GYZ?=
 =?us-ascii?Q?WMjKXwz/zZiQa8pWLgYqa3+uA0GtmpYRKWS5miToXX0geiXBFguGUPO/uOAh?=
 =?us-ascii?Q?37HcN/VxvTO11ljYUoM1xmwB6kLyq8kU5oGcOllItYvi4FRsQzBE1+Is39H6?=
 =?us-ascii?Q?zCKcYMlgFjHO2ROTbOtqxud2qgirPnhYakcT9PL9lpQGCwTxh+vLXltagzyW?=
 =?us-ascii?Q?xC3pAJpERdiIg7S2Gs+BUVWDcC7mAAtmFy+//qUXbDIbjWyYRJxz415EJ8HF?=
 =?us-ascii?Q?pGZVFq0sU03XvIIGt6lJLcXVq3w3jOfdwGEo6cgi+A9G4janelMna1AEQJz8?=
 =?us-ascii?Q?Ke4WOJkttnwJyZu9Gqx7sgZZIuNYzaHKCKINT+u680S5nB/8PxLl+HAPpKU0?=
 =?us-ascii?Q?45+pthgKZNzfCWW+5gGHhkI19Y5S5qyB3F6VjCmc5dSoIIwl4EvaM4vS99kC?=
 =?us-ascii?Q?SL7dT/+oT2DsuhCA6MU9dFECW0vMSDJZXYBfWo0bU8ASFzxs7mvLy/UXSgpZ?=
 =?us-ascii?Q?l8+boKXBxcmHHu/EZ7kweZznpqTKudARfQpxCh2U60RbeXcxomyOIeT8My5i?=
 =?us-ascii?Q?y4El5yjWsmLSfwAN+0adoB4XZahxFndrI68/lQbEF+2MeVGamKxjw8gG7O4o?=
 =?us-ascii?Q?2HkHxknV7gESWkD0xnI5g4IYUoXnMYXD0jMA0BFXQepEjdmkuwyi8y70HoA1?=
 =?us-ascii?Q?1XKBWJ7O6/iCEqV6iZ1qi/aL6IeViofaz4ZW7GJ+TeD4whw0IkgFxIKXoZja?=
 =?us-ascii?Q?CQYD+2yZNg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49eb53a2-cb5c-48af-4879-08dea13abc8a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 13:17:57.7982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSj3hPrD02rWw2aykG1G8Snl4NNJEqtGIHqEjMCLerbza1cMxJMwOGKGPzGX4ZOh9PTzoffhyJpS1X3JXZm7kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11586

On Thu, Apr 23, 2026 at 12:07:42PM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH 2/4] arm64: dts: imx95: switch usb3 controller to
> > flattened model
> > 
> > On Tue, Apr 21, 2026 at 11:53:12PM -0400, Frank Li wrote:
> > > On Tue, Apr 21, 2026 at 06:55:01PM +0800, Xu Yang wrote:
> > > > Switch to use flattened model for USB3 controller. To enable USB
> > > > controller with restricted DMA access range to work correctly, add
> > a
> > > > pseudo simple-bus to constrain the dma address.
> > >
> > > i.mx95 should fix >4G dma space's problem. Does it impact other no-
> > nxp
> > > boards?
> > 
> > Yes, i.MX95 has fixed >3G address DMA access problem.
> > 
> > It's another issue. HSIO domain only support 36 bit bus access. If not
> > use smmu, no any issue. If use smmu, it will allocate memory space of
> > 36 bit < iova < 48bit.
> > HSIO can't handle this case.
> 
> If using smmu, iova will be in range {36bit, 48bit}? How?

Yes, if use smmu and not set dma-range:

[    3.139529] dwc3 4c100000.usb: dwc3_alloc_one_event_buffer evt->dma:0x0000fffffffff000 len:4096

if use smmu and set dma-range:

[    3.136849] dwc3 4c100000.usb: dwc3_alloc_one_event_buffer evt->dma:0x0000000ffffff000 len:4096

Thanks,
Xu Yang
