Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1975443A8B
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786398295; cv=fail; b=qxd1OdeYtHMXJBdJxsE6a8jkwDOvege+OR5mOmkQmrRm4/ATShVi3b24hRVdbyU5nFmCcuhLritF6fhlWiSp7pL/jYAkhfdru8BXRtj9MfmF993/8t9XXDFtzZND2kLXzDlVSZ3yk8GZoJ5OX4OqbaZAI7kNkDZ5GXb75HCH124=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786398295; c=relaxed/simple;
	bh=2wgKsdBGzEj6eC9lqIM8Ajf0q1E39R2ALPCaB371/nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t11moRpPSheZelTLWNQpjP2xYkBjcO6T/7IJ0upYFXTVc5cmw1ywrf5We4EIoLtdBFy/ZF+UHY/YY85QyDIL+HYGW93TH4BxBvRfl7QwP/E9DoX/llYVMcZFve2OSMt/Bne1Izum7rdWxErVzW1CzN5mRlOQu55jrZUydW8kpCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xCGxZOYh; arc=fail smtp.client-ip=40.107.159.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xCGxZOYh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrnTyOcQYn9mIJAxxnoSd508uMdsNWWZbKtzLE4OwuGzaa4snxzytXDB1bDIoRYcoIf3wYIQr5lHUqzB8HygZZAYkvNQgz+3iwbTPjqJN0EyYYdnbRI42BKVsOd30kh1GNtVbLV/VcQnv2oIFzFWCcwfRwwKVZUTg11XtYj3MJXNIavBTS7Kg4qJcbSQHJAZ+Cv+hLBhG6q0xg7nbnjohvFRq/6dAVUxlw2YQpL01T7VZ+4qatzBkLFmhoSQaa8aocH1A+w252LMNGPjPcyqeM6JUdKgZpn1lzc7BJy7xiiz2i7NB3xtI0LxUw0xENUBWtLXiCLU3n4VMV5bj1DYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSLX2IDqe7yl3XepKZ+XHIBeLbcqJK72m7NSKChRaMs=;
 b=Rhk4mZ6Xst52LRLDKjAhf5OP+rRItD3lL9isYw/CotP4xkZrt8ueMx/0fjcdjIIDLMk+jSWMh6vBNFwjSwzH4Hw3GMqVAO8kLWhVW1LtXcHjWAWlg6KIy6Vq4W4OdjgaufcpK4dx9OBDJmPmle+BXzt7L7fiiAh6LFsZUAImasVj0GluQEMxBRHJSJELVCuv59LrZXHbm9+W4h2qUNQoh4C6tpUPa4YRZ+Gy0ERRolYtTyCJpPlj9NPadGwJfU+UTYQUqXlENLwCpAcsigXmhDWYMOZvhE+PNXMJPdFF6ON3KwgaOzS7vJWeAU7nV0XL/lB2v+lrKLyY4u8Quw/Ovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSLX2IDqe7yl3XepKZ+XHIBeLbcqJK72m7NSKChRaMs=;
 b=xCGxZOYhFwg17B7zFttQ+c7UgGeptkgh8AIPf5fZ/rDAQUKA5Kgm33bcTEql3n1XG569w1nahaXTMzO4NB17eDcByaxJNlWlNr1esjLtBZL/xgpLQoImuD6VgjIaaB23pb2c8dTIiyicNCC2lQr7VA14vb+I6ryDtf4RYP8ovGHgJEFHRal3jGs3UdpqAHlCGieW0NMor6Ekw0XdjQvTvSpfc+vOBP8KnYEBdaip3HDQYShWETBPNtMSlmG7ro9b1TaN3FdQJg2Uz2Dk84hMWx6RmT6Wwjk3yvXhSl6B3/4Dq/8KqzVFTpyeLzNV3lDiClFwY00+a0gnZjXWH50Rxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB11485.eurprd04.prod.outlook.com (2603:10a6:150:283::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 21:44:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 21:44:48 +0000
Date: Mon, 10 Aug 2026 16:44:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Fedor Ross <fedor.ross@ifm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: Select HAVE_SHARED_GPIOS for ARCH_MXC
Message-ID: <anpGRPJwQbt6UMZx@SMW015318>
References: <20260810213456.1268831-1-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810213456.1268831-1-marex@nabladev.com>
X-ClientProxiedBy: PH5P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB11485:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a247cd-39f5-40a3-5acd-08def72899d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	QUEnCWHCbxnBW7zckEi+hSWuD4ULRdXe1Uzt/rd+KhqqvGXu9PFhBTq9d7aMtlWqqRQ0AFYBcgmY+Gio81FJf1l4BzIrVM1UNPUaWGPO+U09aQQwmsecT4+J/mF9eOHncJBMQ5fiFu3mNsF6DnEgt1pSQHRcsIvm0sJsuHq75+YJscy9RxBoXk//GuE9vspPDSOP8w9MYGc0G8QZKjozLpuE7cqlzKa3xA17F0CpBqepnWuTQ+SsGLTeiATOZQEIsazvfnUGl1XzF4mclAd2eb0VGeQLlPB92cKwxNNFOW5yrpC9402AjRIFELiatBnGp8J2kiaNn9GjGhLI7qlaoEhYIglqAwN3YtcjvHXXFH8oZia+BlXzNoBOSrlI91rA8xF89mLJdCXVB+fd4+oAUYo2eFvzwZOe0B7eULZcPj18OGipnhv6/oCkHAKNWJm2RvEIRBa1mCM/Cdz45Su9pKdvThQdMOb2BeoSsii0Ki7z2cnVe3Zz8EVopQTg+/LyN0CzqnDYrE/7EueqZWZpSfcd5PwVLYywkRc5KXsO26z225xWn5QocJ37w+hhYdyRTYrTQlHcZu7NNrIzZfNTnOOzxzzgmjLOFCofVoi4Q4F3tmYRXRBOS/h44++ITvHOpN/oCpdVe9+G+REI8RA8w3870mXt/25nCNkMJKrHDWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AEd2/rHS4rmOLJ+HOZik50NJSI2t01xCiMUi+X07A+Zsw26OD5qUPqvWv8Bn?=
 =?us-ascii?Q?G3okSpg6B6qeMGzt4hrW7rhNT9F4KHbb210OXTp2khUQIdwuQJdaKT6eRyOV?=
 =?us-ascii?Q?Zc5d0V7quZC7FGlPVoRYY6QknVvznhrNecHyv6fj688WLuDpy5/SazS3B6GH?=
 =?us-ascii?Q?QNwMNKqR6hqf+kU8iJskGkxAsSpFuaTlHFPiAX+kJ+ES9wsVe5VrMAg2DhPv?=
 =?us-ascii?Q?7Nue3r3RsL2KMHuYtUYP/xlDGigJRMxLoT41lfQc0lZI+TO5vexk87zvAx37?=
 =?us-ascii?Q?VvnOjbRnKBMx0BNF71b0GgO10bANBKNZ/sMOe+azLbILW7TS9xteiaj2ky3l?=
 =?us-ascii?Q?4yYrI7g9UJJ9x0LVBI2tABSUtaPhnm7W9DhEBpZKFhSi7w6ZmsigDj27D9Sp?=
 =?us-ascii?Q?Lm+0h8cXu4HW/Q1oDeBfipBNMHqKrsJmSi3//rPUwX1OAP3IgjESSQaQZobC?=
 =?us-ascii?Q?6Gwt96gjnvZdXEgKBpK6plhLEJtG+t6ksbThGf+SXqB+jOoBi6UpVG4m4cWm?=
 =?us-ascii?Q?eK9cwkUpLU5/4LOHtbkZbXSEkc0A3181PC/P8TUTvT03sNLwPBqbLOmoioc/?=
 =?us-ascii?Q?Cd/uOPzTpDWbMRvYWLXMkgh6sS1/h0hulmdI0IVVGiGWc9TOa5kWP8CVdplc?=
 =?us-ascii?Q?b3Ms8wIe5OOJYa1b8F33fw5hO/xdjPtbV7o2mjra6ZKB3ONbB5ZgaT+IKVEv?=
 =?us-ascii?Q?6QnpsXXWwMOzSUrmfL8CxUqMI3LWDkSYXdqUQH/5bovz+hT8JIlCPHQsmVP7?=
 =?us-ascii?Q?1I7MLIe5sMznnsrePzN6FzsuiezMWjK3FsY4CZ/pPk3YaNTUgUkkIG+PTViM?=
 =?us-ascii?Q?RLp2rfO/AWLnd4z84OWo1Y9ozzIIlZxSMhJijMnRAR69QPWKb48wR3GpLwxb?=
 =?us-ascii?Q?/TkXxIWNfegHqJBxalaXtbFRejK2Tf3MGZgGUjZ6C+87Y1IacMXQk6sZiwD4?=
 =?us-ascii?Q?hjg+yAmNNuS7qRJHVUxynzs6iQKXzEBOnKD86qwn1aYH35h91ZeWBdpSQkF0?=
 =?us-ascii?Q?3d31YgJGya0pdZszUiWDjKXADjYmEc71cEQ9pPbSPask//lVl7l6y916X4Xd?=
 =?us-ascii?Q?rdWV7XUeSbcpa5PRVwrfo0ivKVQmEcuXK11F1vrOV3ssYFdFJ31bSUQVscqO?=
 =?us-ascii?Q?qg91FIiLsY9sRnB1aaui2qczW/FzK5Vm+J4LyACo+uAi9FiNNuemb1KOtrud?=
 =?us-ascii?Q?Oc06lOeXQXgbwyv4ICRetaO+wPI1bLDqZ3h6WWSnfp6ft6CGeyGIaJi7SNCW?=
 =?us-ascii?Q?iYKHQJKbyQLK6qac897ClU8k4QUOv1d+MWwBkZUvwvdnYODJiF90riBZ/6wx?=
 =?us-ascii?Q?LavCG0TwJpHSml6i1TXE4cpKxrpIYpP5spHWY0Z2RS6iFjSwlm2M+43+0ynt?=
 =?us-ascii?Q?vQ2IX9K4rB99BXtluktvZpvF4x94GaMjFp01fKuwem1Tzm12LrbDyzqlN3kW?=
 =?us-ascii?Q?s6zsTPT+v0c+z+QNSt7stlbVEzqieTIfs+Lqj5nd01lqbG6eZsQ3bLwhxuK+?=
 =?us-ascii?Q?87cxD1YwFcOxBrt05QI7BIjWuvo++2IzHkhGD3XtDjGV1EkKueeBnCN+TFG9?=
 =?us-ascii?Q?gKfqBKjsfWNW6N8l/Ly09e7IZkI2GikqxYkzrdcsTzb7b4tjFhLdoVQvFf9t?=
 =?us-ascii?Q?m/x0TLjXM0Px57m8WCJeBCW3/U/9mQ5lHZdhUFfn5YNhodnndqHk+E/4AKaU?=
 =?us-ascii?Q?bPiMrVlMRLsSxfLInoVL6ozzcF6xw+XFv98IS7vAyzHzR9WvgAAqrunQyzy1?=
 =?us-ascii?Q?yEs7rKhihNQZ2oKdrnI7nY8+U/RsoHGZaI35Er/6/+5PKcvVrHem?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a247cd-39f5-40a3-5acd-08def72899d4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 21:44:48.7840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8RBjaxRic4Wdu4fb901eg1rjg8vis+KK+9RipwIbf95Vl+rXrUVJ0W8QpnlFLlHtbNEuZx/UbHsP6nw7pf14TlvFZbD7r2UrPSNwImrxEZrXT4XK9uvTIQWpK0H7c9p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11485

On Mon, Aug 10, 2026 at 11:34:38PM +0200, Marek Vasut wrote:
> Some NXP i.MX platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

Haibo have similar patch
https://lore.kernel.org/imx/20260730-can-share-silent-v1-2-63fd603f943d@nxp.com/

But I hope the SoC maintainer provide review/ack-by tags

Frank

> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Fedor Ross <fedor.ross@ifm.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index d2acfac730037..bc279b864d3cb 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -275,6 +275,7 @@ config ARCH_MXC
>  	bool "NXP i.MX SoC family"
>  	select ARM64_ERRATUM_843419
>  	select ARM64_ERRATUM_845719 if COMPAT
> +	select HAVE_SHARED_GPIOS
>  	select IMX_GPCV2
>  	select IMX_GPCV2_PM_DOMAINS
>  	select PM
> --
> 2.53.0
>
>
