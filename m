Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010063.outbound.protection.outlook.com [52.101.84.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255EF2DCF6C
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078121; cv=fail; b=lqMvy1SQYTVHKGBVLgjHqqIOhsiZ1L3VsuvOjxhHrW7A8N5mt7rV54kypugQoJJIo26D1/WPcJOGN5mOCT0tGs41E9fwPvdyvbwrqhtBA1i439Li9vdHN9qw/vcbUgRKwQeg9TrMUiDmGRUFnV7T5eUDtkCoNPHeNqVlSWJg/lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078121; c=relaxed/simple;
	bh=GxHs6VaPG1c7d9Mhr6A76mQNMwH1XUIRm5J0rIhN3io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kCHxAqHWiJQilScWhLPc2W1QVCmszyDWgAm5cxkCjKAlop0txToNGmdLDmhRH050pKhJIdm4UBET3eGWtmuygyNscFrRHW/dSEoEkqR9lMb0WQ/U3f5OzKxUaccye/E/8BJGiP+mehku8jVbPfVUvOZNDfjsGlzUSkXaSxapSPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QfM5p9Dd; arc=fail smtp.client-ip=52.101.84.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QfM5p9Dd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVBV2qcAd/QUMAoLAnqVTjihdP3lAGHg5fb8Xs7n9SnxZBqO6h0oHlSTEWqUwsBG3Mv3dER45ATn/oYuWWoeNGZq6q1zlaJuNG7iB2kY/ONYkFyZtzMBH/CA+RQJIT2/fYvC02uOf6kdZXZiv6kN0aeLCxi8fvkqqA1NJ74LkbP2vPMyRUh2bf/N7qXG2DR8UK6VHWEKT8Cj1ti+Vt/Xwwy34ifg3RaS1qghgUfvPxADLYQr71S2bj1WBgCyZGYgbdh5UXhx/UasLpFvNhUEy/TQaUblm+VrDMMwUZwVIrHPX8nr5NOsBo7MJqGlP+9kjg4Z8deV2l7eyFSSfBsXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U87trIBCXO8yxxh0/rTn6JanJPxoOkQOOLq/C3vChSE=;
 b=rZjrxnYjbjfR8CiCAl9wd3caXsAKakjPDrc9WPOj5wLyjlP9nZ6pWsaUzxc/3Ifx5K0/jZQxYVLuuQVj6xCqU4UBYmF1CC7kLwQSB5e7b4IhtDG750ul/PfmRtRlDzR7hnbHUWRM+UfFYYLSTX/hqjp+39+sFK1rubgHaEKbzEMxaZB5NZmBZEPebNDEtdc1tbY9K4FPbwpcKKU/jgeocjXfKZkkZfCjm3ZCdYgzy1DLjm83TnVZS9UGTzv/CyyoebxZ0VpGcrhmS7Db0x5Pg/QnllKElA+KboGxnG0KyakX9Vzu+eltjjthKHUaL9oxXLzpCf77zLYwHFFBGrjgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U87trIBCXO8yxxh0/rTn6JanJPxoOkQOOLq/C3vChSE=;
 b=QfM5p9DdcsHN0XicGgmzdExPUO37yuuTCK5E6boeF9km9qllJYbSBuWhIDmoK2Sbd5BvJF2tAxV2h5oz0hh/QgAScXOC9HTd7thBNcr7Lz8hNdVOY4hOEWjO6m7mCLxjmMM+jJM7WgpkpCncvBcaM2qzwQ+s6vdpFnqeLHEztSXTAJybz2dI1/SZpIsG+Bw1Djp95nw9n1ofyYmXleke+U8glJVz+XPdJSGCLmM4Q4vK8RqUKDrLXocWjzARwnMCcguPd4ZKTsOANkrCmxYkHbKJEr45CHfkUeGDL2NAq8FzQ08BXOwDMKzX5CfR6LyHn6EmTdjiNxUAv2M8HNtTYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by PR3PR04MB7322.eurprd04.prod.outlook.com (2603:10a6:102:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 07:55:15 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 07:55:15 +0000
Date: Wed, 10 Jun 2026 15:56:46 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl:
 Allow LVDS Display Bridge child node
Message-ID: <aikYviBO1d560jdr@raspi>
References: <20260608-imx93-ldb-v2-0-1b1fe621bfda@nxp.com>
 <20260608-imx93-ldb-v2-1-1b1fe621bfda@nxp.com>
 <20260610-large-just-lynx-d8cb7f@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-large-just-lynx-d8cb7f@quoll>
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd7b830-f6c9-4e9f-40a1-08dec6c59b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|19092799006|5023799004|11063799006|4143699003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	PsctZP1Kt8VbKADmPB/KeQ3pnCxmRvC1bI57hviHDlfZ0ra8CIrWrnDWRE0TQ7o/gRRiSLNV7dxaWuw8tZKtgLYsGXBwV+T4Cw/e3cQzA2Jq27tj4XI2f0B7v9d+rdopZ3tPrYhx5ql3PSxQmCgosPtCDAtYnC46M0UMIHaOR+nssgZHpJbuaySkB3U8Ig2j9iIVt7zi8I3CI8GUFGTFWXZNIP1Ik4fHXP4M7DVgzfHFT2auPWg2fqClO/LwuMGQA2HbcAhXaD88/pi8DhmndO91n8YPjoo75lKSKZ2isAhI+7KeMKL8hYI04redwSVF2FFI/C/2OwLSx9YJcus/msQ6D+hvXR8iwgzvIvywajKmEad7jXI+hqUGugXnQ4AT+hcRUGRFvsJRCLUNcevKn317Aq0OYVyTjgkw8fXwV7tC2TONZZCSAix1tgzOtWFxwc67LnVN0JJWRY3bahrh3p+oxso4ldgK0uxYQUozedDqFwgZeg5jWAg8cyJtpjulCpYm6J6pPKP7Iyh3+oNyq55VgHTD0lcR6E7CNwSTKMMa9SFs/RRVMgM3Tw5Bix4T6pfZG2dny+qvkmOJoOucpidEAH+i+T2A/zmAj1mJ6j7rRjmQ70IxoCfhTr/ezl5PAIUAnFznNZyc/yFFeJRHUTy+bYSwlLgaczo8SZQIt7FIyYO+nG7xEhwPWC2fix0XY/3ZBCMCTIrznJbh5IxMdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(19092799006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XABCo4PEExA5IkSSVbPHOVzjyKWzGH2Dsy1J3CbKCr4ba9D+oyv1Jx//u1Ko?=
 =?us-ascii?Q?LM8h4Ep5SGuLhc+8CzlkL0eS2Q2XFVw1Ur5qZ2b+WAxg6hkWXRo7O0f2Z9Wk?=
 =?us-ascii?Q?AduoBnSTx5tqML5dNm7O8hrckdeAmLpFUekwHiy7S21y2wIObuNy3sUFrHWl?=
 =?us-ascii?Q?JwZsS+mo5nYOz2Jo5MRkD6dsGBrmamMrnwSHFSttdZ08WYnsbZ8GRGSmLeX5?=
 =?us-ascii?Q?l5nZkuUOTU3/Jb+c951AOF7LhSB44hRC25A5nNh/tmRvwi5/AHu+AWhJ32PB?=
 =?us-ascii?Q?uD+rzKMkQbimG68T2/qLmWFjjWQ83u2msaPmdLBwbEEfLwdyj5W+Df7EYvDB?=
 =?us-ascii?Q?oeZBEwZr2Z77+kqV8KvKtqmDfSIylt+7UjX6USzW0SOTXDPy0jc68BZp2pdD?=
 =?us-ascii?Q?kqib7LxbiLXTdoHIRc/UeJoMADntgM6DoWkyvW7zvfVXt7gsmGgs0HXkF/dp?=
 =?us-ascii?Q?VUo0jhJ7b3MX1ioruzCnrdfgCMtgZ6Fl8ymrvi86t0sak6SZSprLVWPeE44h?=
 =?us-ascii?Q?zRFCKprYhYIwAbBUgGoIAhvbkMsZcmasIwkkml/V9cWD108TRLIt0XoK0keO?=
 =?us-ascii?Q?YCJEPevg7U8r0S3JDkRWbxjm4/EqrY5uBYUInSUZXvbd04q/o0Idetf2hlok?=
 =?us-ascii?Q?nSa9JOw9MF5yjEl9djqsn4i1r02TIqAIUgeI7bi4gozIjPA/Umx5g1HKx7FW?=
 =?us-ascii?Q?tY76nERv142tYsGv7CtM7lHJYCKY0K78+zzC1NSZvyvkhLxgCyiKOiiF4uLu?=
 =?us-ascii?Q?qJA9Pyvs/DUrA6yDNIctuh4Z3wMJtlY4M51aBzj3mSGBR8RUBZ3agkwXIs7i?=
 =?us-ascii?Q?45IFBh98TmNTPfl31siIIeq2bDhczfLEorbEQFvTTDVm01Z+lXmdPi93vvle?=
 =?us-ascii?Q?kzVF80k2ToLHmEU9c3CnPR6A9YzxFwZ7nUt1dCtsYSEZGdX1e7Ji529Z7ROC?=
 =?us-ascii?Q?P2QheMlgxQtgsMr2BXG2pihl7JOJ7tL0oDYHkMFwFB7O95isQyjQUTz7pLhw?=
 =?us-ascii?Q?PA5eIM98Ppjh4ufwTppMo9E4mx1Aa8FD4jTGXd1sdx++IckqkOtI0n4uk7ND?=
 =?us-ascii?Q?jq1lzZO9yEJHEpKhhaoM99KJn4kVKc6aFPnvWHsSy3EGuRQy9RV+ORTBRyzA?=
 =?us-ascii?Q?x8VMYysn5yOMz2qTFmRsn7tWGI5cYCjTYwnIry4kaTiljkkQjJOvZSscyoeU?=
 =?us-ascii?Q?pMjWiq96djj9/+/2aNhXQBb9+6kkd2P2Dx2RVH+8avR/0yE+b+YJG4aZittW?=
 =?us-ascii?Q?leXgYavT+MhPqubGazz4vz6+PvCQFytUgCP/tY3cY4PHoDWgsfyvXMEoU8/Y?=
 =?us-ascii?Q?CBzDU1WTAU4xpqkrEq5afdOfYTIrroKum4eILOC2YR6QW+a/7zjiZ04CGma0?=
 =?us-ascii?Q?le4NZHL4b9kvG5PLTUxB7ImVpEis+2/ArF9cC93drTezZ91RD3sBxfHMAuEq?=
 =?us-ascii?Q?6mV79Sci0mBXfPWZR+Oi1gk5kpmbUXLqJmnXDw7O8oSqGpVpfyd6JrhQOKd8?=
 =?us-ascii?Q?QK3uPMc9zICiKFYTrlgTRTYROvghkElnVajJ9dedrAepQB470CA9bodwGOBY?=
 =?us-ascii?Q?IdmzIf8q1iWvHgJWcMaSjO8YKIaIvxRXeY+UTFhnQezYdTJCdU+dOVqxy/T7?=
 =?us-ascii?Q?D4OfyHXZqecsJRH4VwSk1sPGQPZbg1R7FUuP3d3Yo0zbDklR5hvOxTE2uBSo?=
 =?us-ascii?Q?lqwL5cskORgel4zwmT2QvKo3MfR/kpDat1754wD+gJc3uprv9VU31h5Clsja?=
 =?us-ascii?Q?+JAPm+2Ctg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd7b830-f6c9-4e9f-40a1-08dec6c59b98
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:55:15.7825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCt9G97ijCXduiaW+07v0P3ps3Nux210JyUC2eA5sxieBtCAII8ImjGQeYCZX7sms8pyaj2ZcGLz5Si5xtTmCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322

On Wed, Jun 10, 2026 at 09:46:39AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 05:04:22PM +0800, Liu Ying wrote:
> > i.MX93 SoC mediamix blk-ctrl contains one LDB_CTRL register and one LVDS
> > register which control video output through a LVDS interface.  Allow the
> > LVDS Display Bridge(LDB) child node and add the child node to example.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 39 ++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > index d828c2e82965..124f5c206ee3 100644
> > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > @@ -26,6 +26,12 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 1
> > +
> >    '#power-domain-cells':
> >      const: 1
> >  
> > @@ -92,6 +98,11 @@ properties:
> >        - compatible
> >        - ports
> >  
> > +  bridge@20:
> 
> You have dpi-bridge, so this should not be different. You should not mix
> addressable and non-addressable nodes and NXP decided recently in
> 3feaa4342637eef673243dd38ccb32e8dc8efd5a that everything will be
> non-addressable.
> 
> Writing bindings ask explicitly to post bindings, so if you decide to do
> half-baked solutions it's on you. Half baked solutions are not allowing
> to bypass standard rules.

Mixing addressable and non-addressable nodes is allowed according to recent
discussion[1].

[1] https://lore.kernel.org/all/n6akxiayi3g6gxcqhreb4iaohmeokoalnqup6h5r2fwdt4zijt@u2wyps55ayqm/

> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Liu Ying
