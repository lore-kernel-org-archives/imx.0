Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013024.outbound.protection.outlook.com [52.101.67.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D0971750
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 15:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727363384; cv=fail; b=XC5EvTqaGDkFKCHvRI5zrncHPsx+raVddqNjFIt4bTahJ0Kg0KXhmbn3966OLWkdKNjcHehIKbsiYOXKm+Nv4+IBsSmXnMZgaJ5/mThuopGMh/Uglx2j95VeedqHLjzf5z4ysZzyDeqpfNdvhwF3YxekGMqD5RHSaxRE4HA6EiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727363384; c=relaxed/simple;
	bh=WzeoT4KRYi+Bkccpzeex36rf8UjRUkTYYpb3gmusWIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BrT+GV+ZJ1aeJFBBykCZ7dkiuzWf16kB6WXW1KhkTY/3nDQ8yXLxQzt+slRRUu7Zf0MzzCPaKHbMUuSRUa1p9s9GfLr2I44Hv9qybMFUbleVCATD3l8lVve88yLJyHb1kETLOdUd4JaW9Y0sGo2rNM4a/xECjkKYg2gyDagM2HE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GgpFpJ9g; arc=fail smtp.client-ip=52.101.67.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GgpFpJ9g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uU8ZS/MNIWfdFGnpGyceqTyvRCQ7VQP6HjSM2ot4AXXh2bqvfy7lgn6wqzVJATaxVuYbkCFm/kOMl5Pou/RZHKhlWXAL7fBDG3M2ttd7JKtI8wbNjE+/StxQn2yYTREnh66uBgk7qZISt2nBsrbnZ2vP5ndL2Flo5HwI4xWThsbcMQ80PDc098lv8Gvm+EUU+SAZDqK5Ica6X0t3izNOeVigpucIG/brp9/vSyYFk3D0PUriccFgGD+zB42y6sFAAq2q2ls/0CLX+6FZeudL9o+SVc7ltky37ex3+PI5Csjh50KX298NiF1u7cZ2xab/o1gws1ra+f0z11ovtfNwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzeoT4KRYi+Bkccpzeex36rf8UjRUkTYYpb3gmusWIY=;
 b=qh6HatOejHnc8+h7tifT0QXjXTHujZpC0E1cmfwB8OJq6JFaBxNVwawWzFN6vFNOsWVLILdHzxmm4yBzHnyMbiGQMPRsjxcTH1jo7Ss3UVA7A7stM1U1iU687w59OXlCpYRNomJjFrVnmZ/AQVVAwlJeu+oDqmozt5r7pSBvanzUCqjwV5/KAwTT89TJq5Ob/jjX960spEizmOoWdUxxB/JLOVO1ZK+MqmC/Xvd17/FdWCxUlGJYNw0HarQ48098eDnBWVWmWoO1VtGMfzb7vp/OvDiIwNXbt5kNihUMEZ4gGOz0QTetpCa5BTu1AB+ci17J+1i/R+gYJC4MTvfTiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzeoT4KRYi+Bkccpzeex36rf8UjRUkTYYpb3gmusWIY=;
 b=GgpFpJ9gqdqHbxcOmnzes80d5PsI1G9jzlYAtIykfc0+xEH1d6nO0AfGfS7G1DOkvIxLeNFlAqwpDqiewUc41FISKX1GSxysMsarFSKw9ar2N88eyDYIGslFueHMjGr9oLGI92BcOl2l9h4X1h3tdlEuAsm56HE7vA5xcm0KEmTSodPiMBXSbKEiJcOCkumY4qKd+dlvqSGwivFmGxjI5mxa4BFavFsNAhLHocG/hWsgsAEz3KztMaNgmU61CNQ7lPNXciLk91hZXk8wtertwfeGPJkbX5yjUVqObViqUfu0XmSKrQ/XjlWBh6iNoLZTLPqFcRPwP3WOHArOb2iypg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9268.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Thu, 26 Sep
 2024 15:09:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 15:09:27 +0000
Date: Thu, 26 Sep 2024 11:09:20 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, krzk+dt@kernel.org, robh@kernel.org,
	shawnguo@kernel.org, festevam@gmail.com
Subject: Re: Device tree node order sort tool
Message-ID: <ZvV5IJdWeEuG0ZJi@lizhi-Precision-Tower-5810>
References: <ZumjueKy+tvkODnB@lizhi-Precision-Tower-5810>
 <2fdfmn7wjt5tr6lsxee2qubjgiphys5n2fivlracaksilvvgmi@od6t76mpd3co>
 <20240918-igloo-unspoken-45443a52e338@squawk>
 <ZvUjp5uSo0SSyPAZ@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvUjp5uSo0SSyPAZ@dragon>
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f2c6f5-0361-43e4-05fd-08dcde3d36f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c+TnGUp//yzF+QJSV7czZjLSDpRMieEXEtXgn+LuXqMkLg0Wwmv8quB4xUoJ?=
 =?us-ascii?Q?Pt8cQx37uxqh6Kl/jru6Z+ms/anYlrRtDNOYQ9IuG5+vFNX8ekb/WZx3a4w6?=
 =?us-ascii?Q?zkFPhBQ2VjVJa0lQ4lnjdAoIxCvGxOGrJd9HzA8jHpJDqPrYo9UjDgpVEYK2?=
 =?us-ascii?Q?N0llAo4VoWDzAmTq51LK59BhUFPODGIeKHT1P51t19O+h+BfjzWxNfkhNFkn?=
 =?us-ascii?Q?jH2MlXXNpLnIItHopoC0l2btl+HUJPsc++KxZgCGtNhxDKzAsEN5NUEppcMY?=
 =?us-ascii?Q?IQTdjd3jPhd4y0lV93vRv/WJE3upWNE2yW8Bah+vJHSPv1esm2kmOgYNVcBI?=
 =?us-ascii?Q?Sa8stD0SsXXoelOpEKW9gHyxRIOJZUYVQIvx+5G+XXkp0Dw9oZKzy18sByAA?=
 =?us-ascii?Q?QOTUWqqYJoj11jPsExiG+6+xGoOG/dbAyQ1eLNbJ+wgUxgaxLkzZy+BMPVAn?=
 =?us-ascii?Q?B8SstxkX/6p7fijwHdtmI8OgrAfG2yewhbSKxP2/mlxvf6rLSi/hN49BHI3w?=
 =?us-ascii?Q?Og2FPkOHwDVAOr/IYJgVNCsrCZvQEawLyjhSN7b360Gzv3oR+NutCyW6DPp2?=
 =?us-ascii?Q?6LZKsY01FdsEoT1p7YxV70OHnsV+O/yOR0IPLV/ljdzYcJEpY+tAZp2YtFdr?=
 =?us-ascii?Q?04tP/KEuLWuMTW/5dUf4UHykYoV/mC+fuVdpovnyp/THbaAkVfVF0ar3Chx1?=
 =?us-ascii?Q?uqUPF2Yry630SThlOqDg4eemvaxIt1vUlJfLpSAjge6B9aIMea4C/ZXeGv4o?=
 =?us-ascii?Q?SAK5HK+18H8giQxeAWCa+yzXiLrd+mQHLztGevUukkImGWiqm+hEYhdFlB7l?=
 =?us-ascii?Q?vQlsmwZAhOf1Q3jN7aq692Zi3v0kxz2nzTidQ0Ux07wGad0MI/BqrapTGMYy?=
 =?us-ascii?Q?/es2NzqyXLE9Zp4TBCycapB18wP9poXU+CT+2zc538LUsZ3AyelBRid0lEfk?=
 =?us-ascii?Q?vDmAjuKAOd3rX6oT67OpM5KNfRwaBeFLuMywls3azm2PXyZIhItjrHMEb1ND?=
 =?us-ascii?Q?r/lku14jThIAavs2qcMRISMRHx2jpsMQfOYtkbET8uiNIZfN4jwNy/jxLuS7?=
 =?us-ascii?Q?tShLzTI75YBjCwmOWpRNnPSKP4zJ+o3TGm/dbhmHFBzHNo0eSwcrPYb8EeG4?=
 =?us-ascii?Q?CpVXCS5F1WDhGZiqLulqdAyJ/QzrhbAdxo1LBobLMCau48QDcSSwMo3tMKLw?=
 =?us-ascii?Q?l7OKLaiTAipNxvWW7bgSXzSE2Wl6i7RRoHqkAED8si3pODzS3UFngvRruScb?=
 =?us-ascii?Q?/mPz5u3+RE15gnx/CeUgGDO25BZsDf6IpIWM0ZbbubUVONs/V3n1v8ovFTdo?=
 =?us-ascii?Q?FgYOoTmSFOlVUlgmlpfjA1iiJUuh0FLcfV8XBTRI7ZofijvcISGny2wR9ACN?=
 =?us-ascii?Q?I5E1gcQS3u26rI66d1IcPdUpn4KxBQjrIFVpZTYM3O13DSHFEw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tQbQ+9T8EoynL08KeQwee+4hd4sTS0WmpTdAJLzrg5YAqn1nt4uOqw4FpJ1W?=
 =?us-ascii?Q?8Ri5uLUnyGcNialI2clbi4TjA7u2wdxaUJK1p6T5ZEuEsRWw/3dDskvy/abt?=
 =?us-ascii?Q?06DNmhPvrzF3g/C+OWyWK+nxc4pNXujjvMOu6nZJ9ryFoRed3uUxkEsvYAso?=
 =?us-ascii?Q?zgMhRhs+zfkhq57j8v40W5h84A0bwb5L7aSOtTq579gwbOjQnQZt4GRDRj5v?=
 =?us-ascii?Q?dMuqFOuT+4cnfUtnulVW4Ar7g/y00pBKdh8/th+vCkZ98WlH2AKhe84IrUmM?=
 =?us-ascii?Q?GT8QwX069Pt3bYLNkjBXQo1nyNDHfd8+D3pZiD3kiy5sK6vG3aQ9u7DPQy9g?=
 =?us-ascii?Q?KuDjPTzxnXdRo59TB1EbjzBOK2ybhq05xPHVoH3K2aIZYrS+AwiYsn82wZP6?=
 =?us-ascii?Q?eQZEDus0BIWeO1SxRztljq4ImT4R0V1QJ4gIQPpVPZfq4Yknnu5sxqDsOmkv?=
 =?us-ascii?Q?a/AKICWvzUFjxiX99QBQku1wVPaezymhk/jA7lTa6rdoiBbPGbCkJqUiqjML?=
 =?us-ascii?Q?Sx79NcsRNDo7TFvA3jvpA/wM06V3qXefj1AP83zuVQh5g2tQDlZyoQbnP3zK?=
 =?us-ascii?Q?13hRcXWJicAwB+O1dCvi/8+6+3rKghLTpMhaEaSlgmHFWByn6VCPQI1pfIFM?=
 =?us-ascii?Q?igdOCixrBVpMIfHrXRH/shXGN8fr2S960rTMc9uokfEvrYdmnJRhkSYYTfZe?=
 =?us-ascii?Q?oN+O32mZTkwaqTcRqP2ZW/OE3zZWsW3e2VO9ljW89lVXDPkhidKX/1nGBsXE?=
 =?us-ascii?Q?/ZyqneYC9AzVbYkbG7G/EC4wW44xLTN1jDrlNoHy7zfa/GTr6jgSVUU97CJz?=
 =?us-ascii?Q?Mkymnhb04DVB+O8lD/7h3SFRseGLwhYBuQTho5zLJkSU1RkdBDnJWegRu/dm?=
 =?us-ascii?Q?OoC4hjkrCxRt9Mcw6uvEYhjuLcumZPLI1G/1s4UB1zUaDHsdGU0C/R9H55Jh?=
 =?us-ascii?Q?HU/QTs/gYs8qEzikLz+RjxEQ/iPt7Qf0gs+0CV3TphypUovFl7X7Qf6zbdV2?=
 =?us-ascii?Q?oHDuuVWURMK/7hXMcPdiDnU8hLW2O9EHPX7AWPCuUgoUXSvghOxtki2xifkR?=
 =?us-ascii?Q?BfgLIFxGQ171zaqj5B4aZkmAGNrSzln7ZSbZbrkCdb2LSsiDKi6E5mEUnp98?=
 =?us-ascii?Q?cjwygUIeLIMd1ntoxFfnMU9TU4dAQkBiHMOniuxa9xYQTF2QTWLmgjBPXROF?=
 =?us-ascii?Q?PyyEyK5zf104czcPDVCUF0IYs+xeSQP6olUGq+DMY0CxDYAaCaJ3OJHc9sXw?=
 =?us-ascii?Q?o8kh5k5F8sr2u+JtLSpY9Bwq+bSSl7jU+bZ/BztqQhBoBJAgd6X1iuZOKXAH?=
 =?us-ascii?Q?J3GEtyudnPprnpa/DANkgcaroXRTQ63a+westvo2C/U8Qjy1Exjj+7Z3pTaB?=
 =?us-ascii?Q?0pNKr46gYT6Kn9z8eu6N6lAgScYx+pGtpdqrL3Qh2Q2Ascj8/7QeecfydrcT?=
 =?us-ascii?Q?pWWzU3pV17j1AIcYllQz9YOUS+ypq0mPTpR49IW9LCGoLXyZNriZ0aEkWCA1?=
 =?us-ascii?Q?uprJp8bjznmuYayP/NowGG4+YQfP0wG8heOTocchNKkvcD0Gk8cn7WMRbEK8?=
 =?us-ascii?Q?MJcMXaaHib6G82CxBuc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f2c6f5-0361-43e4-05fd-08dcde3d36f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 15:09:27.7359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYfQOr6D4kaedIdP5x1lzyC+ShC/eb1mF0CEYFcBtVQoR8jFGYf6O61ccchD1Y8P2dMkeGsjo6lYtfCz0macSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9268

On Thu, Sep 26, 2024 at 05:04:39PM +0800, Shawn Guo wrote:
> On Wed, Sep 18, 2024 at 09:17:37AM +0100, Conor Dooley wrote:
> > That said, I'd not enjoy getting a bunch of patches for the platforms
> > that I maintain redoing things in this order, so it is worth asking the
> > platform maintainer for their take on whether it should be used for
> > anything other than new code, before sending a rake of patches.
>
> +1
>
> I do not like to receive tons of patches churning the existing files
> with such order changes.

Yes, I agree! Can you focus on checking if order is what you want? Some
rule is quite complex. I don't intent to change existed one.

Frank

>
> Shawn
>
