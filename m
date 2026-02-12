Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9F61E5714
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770909650; cv=fail; b=p/QiDZCu8dpNr8EfwMupTCji4/VdXrHnsTkE57lYWLgHj4Fs2xIZ4DvYSDP208M26prGXYPfmrbpQgof5OpzBx0ygYu4yp/dceVEwswDqbkbCrkEUtjxUKqhzxDH12fOkrb+XQvsotvftrLmLoY0JRwfrXOraNaL0zgL4JvcIQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770909650; c=relaxed/simple;
	bh=qK6J/kXiP/FXLz9N56pYk+qApKZdOkYvpJnhYlglHEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z0eMIpyvPYu8TQc1EzPdqh9xzrH4+4qancAkHuQxrY6ZwLJL9iaUquRncKsD6XUN7NXKPRGmFucsNY6O9FjfJ43oQElQMNWCu5FaPmoPJ42bG1LtL7yL3deAPSLxcXQZJh4mk/URq5CUZBgYZ2/cm+1Bca3+CRsaDKABT3ip2rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RVfT8uCL; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RVfT8uCL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGEkk8YQ+A7phLUM6hAtt0+29Fr+WFp44+2BxIwGf/ts8XHzRq/ChxNelpUirMQ1agDtZp4zA6/Fzj8Fkftc0GRP/WMtmBRS0rOL5H7TbFmxEalHb2Z1/A8BUGHAhBFw5FwQWLUwQG7HaagI8xqR1hm27aMU5ujFLdBdjlXi+iK623sF06SIYyWEclYLA0t/JNkI2BXbFMecAU55hitZ+02aRuQ+NtEVYP2uclzxm9APZmJhU9UqkI1fRZXoS17cYBUhIYrin+jEYEG5Mv2d1x1/3XhjE3HFJNJY6PwAgOo6vxUOBQiOZDOGjS6tPte/sj8KOuTun9Dr7emqHl8WSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB6eU53g//86J2wUTSSYKSMyp7hY4YMlzrlBoagVufM=;
 b=JA0CBgPvMoOsl+R7KSc57SvRbSG/hHppvJI9PqBku+vzIJBz188K2EEVDbU8f0oNnvhV1Q/1l8s/0HPbd481TwJ6LjV8MEa4R1a0jrw9IsoR1WHgKOAjks/E4pOtvc+DzEkI07KoOiZMmZqXwLGGyhzLoqE6dke5TN8vD2FTcGzbmJs4DZLpglwfSNC/h3jRXDH8XTvEuMZZlmfbQj3L9VtRUX4f6qbL9vEApen035HlB1f/slXaiSuof+630ctewAh5mmoW5J2Jx2GBM7U0nasvcJxXuQTY6Rjgn1NNYvYdyQl1ztqlGdzYox1kr8tVOzCX/WfmnzPzpGTVHG2LNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SB6eU53g//86J2wUTSSYKSMyp7hY4YMlzrlBoagVufM=;
 b=RVfT8uCLvjUtHGXvfnPgqozYgki24vNAHyQBiOqsp6BEBCzfbtDol21GZRQFQNdP0AhfY4L71pOZQcT2CK+p+TavteTJ6yl1WqS4rARci2AV0wNQxm5T4LT0x+M2ZvjH9iWNNDEiRFX6E5GzWhEIe2ClMx/Tb/ORYHynW+x98HI1hDZ7FzadjWd+9wdxexRl5PKR4Tvx1WdOV/z+uJBNyz7l5mk+SJIjz9QES1pzNiI+SBFHzGVlSq2gwQQUECzToFwpvA96On3wT/yHqLEOi7ULypkRZYv3L9lLUz79cPI0GJWjz798Phvnt6BeuvG1M0UfwSuf0tBFti8GrhXbPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU7PR04MB11233.eurprd04.prod.outlook.com (2603:10a6:10:5b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 15:20:45 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 15:20:45 +0000
Date: Thu, 12 Feb 2026 10:20:34 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: imx: add fsl,aipi-bus and
 fsl,emi-bus
Message-ID: <aY3vwqvB5S4M-Vdq@lizhi-Precision-Tower-5810>
References: <20260211221937.3752048-1-Frank.Li@nxp.com>
 <20260212-divergent-gazelle-of-patience-0dd85c@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-divergent-gazelle-of-patience-0dd85c@quoll>
X-ClientProxiedBy: BY3PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU7PR04MB11233:EE_
X-MS-Office365-Filtering-Correlation-Id: 437b5a5c-52f6-4ad0-557a-08de6a4a4acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hyKAKInEPGMqccj6L5UyDz/FEDvlUAEOE59+t1UpmyC00IniDW8fNqA3GsQx?=
 =?us-ascii?Q?h8oFT43AqudKl9S3fpTlSnge2aTnZ1zoHjdJjFKQWYTHVRcqQW/VR9OHOvbE?=
 =?us-ascii?Q?yEQjVe80w+j+Z2w1S/zSnUPEZ9UJio/RKpE5tKJnOqT/oTgCgjWRbuwg71ZX?=
 =?us-ascii?Q?F7CKnj+oisMteEMM0f4PscZt5/gEjBiUExWmUBn4e2q2sqz4FUnULA+zIBxr?=
 =?us-ascii?Q?EbfI4Xf+92XMqmIbdOp7laa0ZgzwdowWGrcBu2li9jOO6XtrkW1Yr+D0zLDk?=
 =?us-ascii?Q?0lUR+COYcn/dTiUz+ak8qxPBEoaZ9pn8bwsfZM1/ZR7kH25KH1xrygl6Fwpc?=
 =?us-ascii?Q?+wFLr4c1XAF/8jtupihSUl0SnkE0izZ9Kvze5pz/hirBQQ0cnm5lf61Z2U8l?=
 =?us-ascii?Q?54N6UHCKASJJ97PA7Lk+dGWDl4vfiF7bDtf1FSw8sZPaojzGLn6YhRflua6G?=
 =?us-ascii?Q?yCw9vh93OF5GHc1iWQxqfo4ZRkFrZZ+uI22lksDapppGXXy58VdSh2KTtbkJ?=
 =?us-ascii?Q?tVHNZ5sRCi31dO8T/K3GyCtyvedk/nfQqysFjSF7HQztiaa6rPpW8e1ceiLn?=
 =?us-ascii?Q?x9mA/2DaTgRq+2qIXNwmobfOyXdEYu7gfoWZW/7GGwtpJ4ukp5oOqKUWreqJ?=
 =?us-ascii?Q?ycC54Twd5MhBJaY3wY5+TqttT/2RRx+EDrW7WCRam+RKTnB+0kzcphf4zG5d?=
 =?us-ascii?Q?jaPfwO/MU0zni90BisMCiIL1hTeSuk+p2qkbJiOiXyoWvL583DQRpJzQceZu?=
 =?us-ascii?Q?/CsHiIGnTtCHakWj3a4UlYbDONaBrXpqLhYvAZA6uGDpUb695sMmaSj26fpN?=
 =?us-ascii?Q?l+V/VLips+FvY/bIG6mKPr65skgJbs7NlLi6jt4RMHWqGA2lZQRvDosqqAoP?=
 =?us-ascii?Q?mdw3worQa8Pl9NT8Yps+sCEHB0WzThCP7MRvIj9CdBF5yimnzTwssqJhtocV?=
 =?us-ascii?Q?Zfg2t0+qKxfcGu56WUdsGtrGEBS6HgVWdLXSdTPFqVbSUf5bHLnbSs2w9392?=
 =?us-ascii?Q?uwijY1G/KQXYsiD5QA3YOPDeCMrn/zN/vuUhonrNnQeg8H85FU3ssQxmodBl?=
 =?us-ascii?Q?BVP6LR9h6BhGBuuoPZEWcwMqMpYi0I1722WFcrd8NONL4iKS7lJJazNPIunH?=
 =?us-ascii?Q?8yGPUN0JisTThqqz8WMcqKNooxlvSMC4WUwZF+mIA2mVMEx7qDpCQYsTOvb0?=
 =?us-ascii?Q?f1WZzJMXpdFv8HfSdYEK8jxNFL/Ji3tCoh1pZx8BZup5+sZWliy9sxSQb2U0?=
 =?us-ascii?Q?dDRZlDUYLAjApn++J+ipNopHu2d8CytusZz+Om7kdFi1JtI1QhNfjM9nhWz3?=
 =?us-ascii?Q?ZbZ0xHMi+NYNvCpDDv7Hx1HFUkZn7B+lUe28aLpJypN4x8cylCSQnVBbmbC3?=
 =?us-ascii?Q?1rPGuKUJMmhTKDKvdsnA6bYiUId3Up88gM8qvmPIcoT4jKepUans+K10+ln/?=
 =?us-ascii?Q?UFQd/xeA5kewNRNlRy4fIRxXiUrKhmR025mO+ebLT33+WGN3CjMxNJsuKZRP?=
 =?us-ascii?Q?v7Z68FUcgE/lV6Oryrj0byD7NKVb004eCo2M6gce+Ei6LonVUhfklaWh+5hN?=
 =?us-ascii?Q?tc7j/zKD0YlhXeVznm2XQN65LNG5id31wYuuzhZLiJPztBjYNcDA07nV1dnN?=
 =?us-ascii?Q?Lc0LgfMG7SSyRf5j/O60YXY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DrDafepX8yh3zNPfc/G2z8FTs9VSfD9JlLsiRZFZY8rYxUb8CUDF3N1L2Zeu?=
 =?us-ascii?Q?Pix4zCYED36zTcuIZolCG7XA2eA2URuyLtS3ewCOtk7Td504IbBJW9RAcnZq?=
 =?us-ascii?Q?JJLZ3T+fGjeffK9r7Px8wU7rT8Ce1IYg410hLTYrmGzINTtvWbziiBMfj4m/?=
 =?us-ascii?Q?UHqHTXJ9keKrEbY5h5dhquEA4Gxkf5q6wlRiGJVMe2eyOR9i/9wiBsDj01d8?=
 =?us-ascii?Q?vVeeIYGHutEB/g5dn23Ef+34I8tVqkYuMhWlPLzJcMT1u+ApTwyEdreWVVTf?=
 =?us-ascii?Q?wvGIVT4pKIEN6PkIOE+siufCQ22wow/jBnatpDvLb9plevyprgJAm0fcTS1D?=
 =?us-ascii?Q?7Vl2cUYfGg5U8a9cYaxn+4UN03aITyt1JPkZvuv+/Z0dpBBva1mPDv/ZZXli?=
 =?us-ascii?Q?kbYAp3J+J1aIv6hSdKH3vFLpS35XeIt2P1xwKnvmDNgXVLZ1qp/GKkpUWZIc?=
 =?us-ascii?Q?MCb6Z06aLtu4C4CHjBplsnomMF9HKKgwxBzy0tZDmoHAE8BAIEazKerCMddU?=
 =?us-ascii?Q?9VvIcdZYTlPpJ/3CGpqw58G2XN4LKdJwJ8X/uQ3vaUrBVDeLrg/zTE+OqoAw?=
 =?us-ascii?Q?dnXVWjhCtOsNVu9u2WZpKISDkuFhJMBJGFNIohY3b+oskWEFqT6kMGVTVWr0?=
 =?us-ascii?Q?V7n8gh53P1ulOOdn/yfrEfU9uZt5IfIGXbvVUP4Ag0FBpVDp8fPo9aPZpK/m?=
 =?us-ascii?Q?98jj8p2yL5W0PGOG7VlLDlzFVOIu39xoHK8hYZi6M/ltWRWwIny+pgTy3UMC?=
 =?us-ascii?Q?H61Y0G6sKSmJi9c+Nu4QSAofjukTJ2NvNLCLqu3q8MoEXpe+8h6CiDCfICLc?=
 =?us-ascii?Q?6uyhDIb455HMyNX4ChMGA1cArTsNvO/h3/K8BQ0gTtDO9ptfwIGKkE/+Wphc?=
 =?us-ascii?Q?jV3SKEsqgRcnXEI8NJqpqO4ZkOK1m5W4NVXQ4NwuYLYJBq1VwymsOWOf0OGI?=
 =?us-ascii?Q?COLMBS3uVtVB1TwTOCvSDRVjv5JLFGK/iZAoXl+624d2F4fu2VIHT9NJLVbm?=
 =?us-ascii?Q?q2prgCLPQE7oovq4ebOgM/EpQLZKkcXyUto6fy2hLvYii6zZYL+g4uH1lvhO?=
 =?us-ascii?Q?Kfi/LgsZ0qUlAjl+F23J+Qa9XvxhXU8yxdOA1k7toejSCH462anvjMjWf5I4?=
 =?us-ascii?Q?/hAp86KoRja95iE1tHaff5Npm/zk8dq5IIMhFyeJmZt/pVOdxJMLUp4l+W6+?=
 =?us-ascii?Q?COhofYjPJ36pp0deTlOblBT9P7K2sVkypVcV+Nbzw8AUF3nvO3G9CVVqoNMk?=
 =?us-ascii?Q?CXxnddzBJ1cBGPwC6UQVQsiiZ9A8OBR5YEKalRE97H6bim5jkHqKQFSTgdSh?=
 =?us-ascii?Q?KQuS9s5vJ1Jw897dl80lh7KBOMbUr8zIkSBgzih6S16+ABMOuuTjZsUFTH50?=
 =?us-ascii?Q?A59RkxXzaWuGaaAUUu5goEWY9f9Phd0zV4SG2xHd9SEc4StJovdjHHcsqhB5?=
 =?us-ascii?Q?vbjeHReY2W7l1hiF9QVxDnYCi6mqID+bOr+gHE/wQ4dnoqDN4zmxsx0XFxe6?=
 =?us-ascii?Q?9+rcRtaET80QiC3MSoo90Ip4UNBK4Y9dFWnbBWFYVrPBIGGIFjikR5vAueIe?=
 =?us-ascii?Q?iP9mpYrBBF8GPgWgItx0L25LgH7VTiBbtkR3okFZEfsUnKcKJDW5z32gMwbq?=
 =?us-ascii?Q?cHeG6WldzR1mKAaGMoOkw7CghZlPYemIDJdfTSqGE5JiVqSk6qLlWoM0bH4V?=
 =?us-ascii?Q?+BF97ZgWKmY8eMeM2SMFirPiV5sm1WztMjd+o8FXxJnvQm8p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437b5a5c-52f6-4ad0-557a-08de6a4a4acb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:20:45.0531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/dKzjBx7awl3SoUCkLmKUOtSV9OS0H8VLrr2BM6YyG08ZqrN69XJjiT0wlP6gZbaxrKKeKqJUqMNzR7e8AJ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11233

On Thu, Feb 12, 2026 at 12:59:45PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 11, 2026 at 05:19:35PM -0500, Frank Li wrote:
> > Add fsl,aipi-bus and fsl,emi-bus for i.MX1, i.MX2*.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
> > index 00bbde203f598..4808065fc9115 100644
> > --- a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
> > +++ b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
> > @@ -26,8 +26,10 @@ select:
> >      compatible:
> >        contains:
> >          enum:
> > +          - fsl,aipi-bus
> >            - fsl,aips
> >            - fsl,emi
> > +          - fsl,emi-bus
> >            - fsl,spba-bus
> >    required:
> >      - compatible
> > @@ -39,8 +41,10 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - fsl,aipi-bus
> >            - fsl,aips
> >            - fsl,emi
> > +          - fsl,emi-bus
>
> Why exactly? There is already emi, although not in my next, so don't do
> it per one compatible.
>
> https://lore.kernel.org/all/20260201011913.2419626-1-Frank.Li@nxp.com/

It is really old chips. some mx3/5 use fsl,emi. but imx2 use fsl,emi-bus.
it is not used in current kernel source. Consider it is really old, over
20 years, Just allow it to avoid CHECK_DTBS warning.

Frank

>
> >            - fsl,spba-bus
> >        - const: simple-bus
> >
> > --
> > 2.43.0
> >
