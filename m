Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02602309F08
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767693030; cv=fail; b=sP9+JV5bYz+oUsrjcS7uMgAEhgt4fk9QqqOJiZc3nCwXFkb7pHmwtMwxOQtth/+l0hgNIDW4NKGUhNSmhIV7AKN+YyoMyzKX/+n6ro3ORvTYo+Ri2trDVcJy0fV2XmV+9ri/9V1w1pVJxNLBB4K5/EoXwcvDhtQ5GupCC7+0VLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767693030; c=relaxed/simple;
	bh=6ED3wffXGZ7ud32XIVcdPZmh8eDslU0wIhbcyIOJGpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eCTNTkbmRnk10jwUiTKa4IeYtDt9ujUPn9mUxNIYhQ6sVSaxKZrnF0bO5A2sKTP/zvgX3Ie/r9lG+bowJ0v7bbaAEOzYJcmsC7iiK5zgFP6UDjMLRicY5YXp6pyFT+PlNAJV0AhPed7EJscvAm+E0C8689o0w55umiOWJLonels=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YsROj4gF; arc=fail smtp.client-ip=52.101.72.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YsROj4gF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uu0zmqUcfR45+REgHi6SCMEaD12Ml4sK8ZNXk7I4jxqIKAKJR46AgEKjcxU4R5WHxV2nJo/p2fzJZw91KzHzx/kDcn2/lSBYihhyD5htZ0v2TuklBJ4QmYs8oX/nd/glTzbU3OylC8Td8PQljJwEk/NXnYCKoRJazR6xGO5xhrM+RV8fe4pRaMVDFrMa3X3c0AswJC3oZBJG63wkqysUO5SVm9L6PyNphtXR2Dhhudzqemaed5nuhxeW7qKvp4S6EnNYvzc8sTI3w7DMWlFPiKqrAXKvpSsteyQyQfIh9w2xgpF21mH7NuhnN85XuuL5uCAx8YhhUBDZpdwM9z3mNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ED3wffXGZ7ud32XIVcdPZmh8eDslU0wIhbcyIOJGpE=;
 b=NqbKs3l18grP6+uZK6eg3vWNxFLJ3rYE+UezDF4nc8LYbNkmCkchLCe1BvfXJLgLsj4/J0NLnzBpKP4C8ysyRaqXlQOLLPsW4qDE3mm/uUM3kdYShRr0wnv8AQ2PCHVOI9PwdnyMVSakEFV61+WJ6XBEtpi57myd9pvHy62jrTA/mWJA8oUPZcNQ7kDu0tt+WZaNY8sQqoQjs/yefha3aAehNwsWjsxhMPCeMTS87k0pQSmdRVvwrJ0IjvOgw5snakJrg1gjPJBrl8xxzWTxGrKIE1nz2lO5EBdoi3ZrXi/3RjBs6zOa+ubRtB7dWjyZMCM7zKKQfv1Y3yAQ3ne8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ED3wffXGZ7ud32XIVcdPZmh8eDslU0wIhbcyIOJGpE=;
 b=YsROj4gFvbec3qxD5gPc7WmxR73qni6/GJA/eSLTQuw1IYNyZhnrLw4b12aNgBeVp19PUQYo0LQCmner66UyYGDLPbHJSnPbmbvlWKPRXmLA9DE14pRZzxhtc5FPS72OuZ8JjsG0EbcIhrkThs1zAfTetcTunWOboTTaukXd9ATKW2IJJoPNrLSZkOUmXqLgyE+5zT/+Bba+F8iVBvwr49jilEVqNEJHwxhZ8JvZeunS7b3AT3O2rfIu3yCT1tnJy6QVIqg8qp1VpszP3LQJtbWr7qMa+/LEXbBK4N31fBdn9XfEP6GGfHemJHXiwlxU89XeSgqzrVml8CLxzIv/NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by FRWPR04MB11198.eurprd04.prod.outlook.com (2603:10a6:d10:171::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 09:50:25 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 09:50:25 +0000
Date: Tue, 6 Jan 2026 17:51:54 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sebastian.krzyszkowiak@puri.sm
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH 4/6] arm64: dts: imx8mq-librem5: Limit uSDHC2 frequency
 to 50MHz
Message-ID: <aVzbOu7lyK5JBNw3@shlinux89>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
 <20260105-l5-dtb-fixes-v1-4-f491881a7fe7@puri.sm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-l5-dtb-fixes-v1-4-f491881a7fe7@puri.sm>
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|FRWPR04MB11198:EE_
X-MS-Office365-Filtering-Correlation-Id: 31cc94a9-86a1-4d79-da3c-08de4d0903ee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|366016|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p9NoZgBdm034H8EqA6AH0WkCBAu0C9PgNHOfJHRwUFn1LKXJfN8glTyhedJk?=
 =?us-ascii?Q?OtHUkR0nMH539VdOgiSSiZ39pa2m4ZUIhU1t9oAL5rn4gk+06re2N3aFsM16?=
 =?us-ascii?Q?0Sm11yuHN2tpv136sGUubOEbuWMwPjKldko+6oYesZUT1oYd/nl7J+WQV14n?=
 =?us-ascii?Q?Ijg6jIGYXVM2AMxbobLBXv7EQ4/wBhZ3k9Y14G3iGQHRlhSzAVeGWht4EQFn?=
 =?us-ascii?Q?N7agVzlNaMOCyFyZt0jHa886Y30b30NWdAUeAnrYTnj6kOFEnT4BmvMht1H6?=
 =?us-ascii?Q?mN9lIlq7aYO0c1nFYpcDC5jObj79Ps4qP4Fjk28qfXADTdhGl3pyvQYOFeEJ?=
 =?us-ascii?Q?9m4f8HxMfYdwjZBXY5E3mZp+Pjeg7hiyOPxn0aBqEd4hULqVx5s4di2lp6LO?=
 =?us-ascii?Q?P/VoDLNV78HGhR0MzXkI5O0gBMm3ReDCmqQwi7AZZQtuh366qMLuVOUaZgK8?=
 =?us-ascii?Q?Dg36Lue00S7rdX1N0CjnadFpmMof9rncLOQEzxipxN+if8VR3emMHLBN7Ymm?=
 =?us-ascii?Q?VxqFgHWmTE0VjR+QvGpwaHpjlMtIIe+kNaUde4zkHIAljCmX04OGLVWrj7aj?=
 =?us-ascii?Q?nriQe2CNEYEdMKSktGYq6tnEovNIfNT+foTJBn5Ntm80mwei/QIsOiMMXnbU?=
 =?us-ascii?Q?POP8VuENPYTvmwuBThCyz6RvlLhLpXkHSoB7pC1q+RSoXvs0YBLPYbbR2oCs?=
 =?us-ascii?Q?a2g0Cbcw0N8QGrCDcRugOCsVKQo/wVLpaDQMXfCcS7Owmfld/n0zCXCfmDPU?=
 =?us-ascii?Q?nK3Dgs/4Vy95UvOvlhV5o4FkCtUysWIArAh7EwN3B9PgZr38cFYvyYmVYfVk?=
 =?us-ascii?Q?WgfztEvkVDIt9u7SdP3+t/ceyV7FukkZs2R/xcbSRF16wZF7/bDAdhsMZ8Wz?=
 =?us-ascii?Q?U3msbZwqKcGtaEi/VqcLyi9u6q06RtAcZXtAnRJXGWuJterIzsefCtB1Vovp?=
 =?us-ascii?Q?0QdzuxVQqeiHXWUvzRtzf8uJtpEL+HmUBxJYiGYioQc9XZfviF9e3/HZc2sm?=
 =?us-ascii?Q?8Edxm7SgnkeqF1CBSKN1Vg3pcsEuXAWl8F/fouB/hLCq0xd1cLl9GJsYDzeF?=
 =?us-ascii?Q?bHl3ok3anOadwhzkID4KAKIV2JwTio+6MHNhZThU8ndUPo0dWb7G3dZIVg4B?=
 =?us-ascii?Q?W9kGFVe5fz3HjImqGcEI02NEVSiTlO5wT2FLj46pC0+m2DrkfxpcIiVN9Fd9?=
 =?us-ascii?Q?DL2UobM4XTCnrRAaeQYSgBen6Ik8gUa4mI8hWpRHajKeL88JiZVWxQqy8mna?=
 =?us-ascii?Q?sPn9OSCw0rXLZ3VGt7vvB6ZXUF/35JVqft/4i3peql7h0E0uHYP27AmxIlT0?=
 =?us-ascii?Q?0+veAoirOKROF7MSJu2KIfin4fQU2wytwPBpMHSOkvNsXC24GUYXgoJ26S17?=
 =?us-ascii?Q?J1bKk0Pn8Mfn3BnrNMBXNDAKSH/M5Up67F3kjOh7Dyuffx3LjDRaUHNAJtpE?=
 =?us-ascii?Q?BnHN4bdXRTS58wKCbuyPfle8D+rOUBfW5MACTyiJHDOhroOLGTF7mAMYFWRD?=
 =?us-ascii?Q?ht5NTySb3cfe5HK+qioUYmXF6LXgA80B2lNf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(366016)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AFAw9to3oAWhmdQGxYgGzb+WxPejMFd/ZZuj9R7WoUM/vJdQlT/ZeDYwviNw?=
 =?us-ascii?Q?R0g/Vy8H91jtkRLVDzBj8nlOxmXV5/qiLrWnuSP/iL0NwepQsJGmXCrDbb9p?=
 =?us-ascii?Q?OYitp/DE7k8TD1YmXVqV7SE56gC9JJZG72rd4H2a0nUM9mJIBa+3HiYMcMuu?=
 =?us-ascii?Q?O0eLGBvuzNnb9EaqGjOzwoBvid84IREFIx7aDfXrhCOLJfUZQDIeD4/WOLZF?=
 =?us-ascii?Q?p569Ah4GvBfbR/msJmunUZ5IMeANlwM/h2spOcSqdGWwJKsUmHSQn2KyaIjS?=
 =?us-ascii?Q?ktvg42g0PR6hZqvUv+hss54xuBJO61p8+02xj47ooCmQ6+xilNhEc2C+TivO?=
 =?us-ascii?Q?XnAARgOZsDESU25VHFJQ3sxzcbDO2uQWpfVHY69IDLKtofPrLZBF/0PXb1Nk?=
 =?us-ascii?Q?gZ/rxAogAZkDk9JeeIXSlexLKrAclh3gnfrv6eB1VbMvkmS+RTANJgkZtl1g?=
 =?us-ascii?Q?y1Il9euRxD616l+ZC+gdjCe9dkidhl6T0/aQyNdxTTe8QGwwilrDtqRufAem?=
 =?us-ascii?Q?U/nHeHycn0rnWcOwkqi6/8Kh4aXv1NM1a7ho2xzXVrpmTm0KZQn9TyQvESbV?=
 =?us-ascii?Q?RrANL1qjAhrdRU44khAEdfZmTfdPjayF0m4vGOD0Pb1NmkBW5Cje/tg+ChFN?=
 =?us-ascii?Q?tcnMQcWH2DNrESGtL/yYpEf0O7CEALEdEMGe02W77cBaztVvqars7PJQPs8l?=
 =?us-ascii?Q?eY7dtqdtZy/2hQcxguoQu0nxE/z/B5rUIJ7p/4WFB8GLzBxhqyGLvtlbG3nM?=
 =?us-ascii?Q?Rcg+83C1v1KKxZOs3t5Agc3r+aVltOnTUUJkz8lIlzbYSpHZcyCXWOM9fKH5?=
 =?us-ascii?Q?vfMmL52120yIUA7lQXi6dwv1j/RqRZM2HoUj0diCj+8yUfdKDsR7h3STafzP?=
 =?us-ascii?Q?zq7cALSA4cGs8Rf6AR6IB4JYdLV271WZ7vNWuURVm6XIcre6dxGv9xNT60/T?=
 =?us-ascii?Q?StA0vB2yGzAug8i0rbDx3sRDVKEluRf9d+KdF4GQ6jxQ87INRFDHWtztjs6v?=
 =?us-ascii?Q?BSR7CR3DmZwvFpD3aaFzrj1oLuw/J3uQBt9i1dSn8nbWUdhQ04EJBnQqgWPb?=
 =?us-ascii?Q?TS0Tp7ndBxwIIh+g/+bqJmB/u5bW/X7xxQ+Xxvvsw/IctMJEzHm7cb4WVAFe?=
 =?us-ascii?Q?E1sBozVHCKtZF9vOAEE13TcSetHN8evLcPtNl1dXHynlbgB2bJK67f1DI14h?=
 =?us-ascii?Q?QNpqyTqkGjomoUP6rqKZY7a2REOfM5tNKGe7D49VQVdwrtMf/Abs4z0KMXRA?=
 =?us-ascii?Q?+Ei8U7i8U0uerCAyXX6hGxqFbFQXDOd2WGCpYHl7jtJNSY4/a3NvowsDSrcG?=
 =?us-ascii?Q?DyEp4USMzGg90/Ow5BXJ16fWGmA8Euxz5hU1MdguKCpePUgauP7TPPh9MvMF?=
 =?us-ascii?Q?+LQt3b40LJFYHFczY4z53zLcG/+vGaUudONgpO3mYOUnBiMyQ0+o2WYocjvG?=
 =?us-ascii?Q?rXR4SY7a8el9nKYHpMsZK1Vabd49IlbQGNJmek31Bsld5tPO5zxRveDhipxc?=
 =?us-ascii?Q?OSVkhZBVayVot6MKlEBzNGWu5Vbr5nFsg+QnqFAqYZrTNpJAm4Tqd8RZtm1D?=
 =?us-ascii?Q?Uu8+PlrQkQ8PNToX0qIxCcBTp6B48dYcD0HWBlEeuCqmO8J+3kPslklNQ1yB?=
 =?us-ascii?Q?m5nnNMxwNJ2Qm2vrTTgIA8OmTZ1RWPRYvP68geDTCXdch769iM8ukZJCI1yD?=
 =?us-ascii?Q?gaIzVgZ9F7gUSyWCviVUDwqjzd7bZzbLVnlyHzN+yR1Q3OTD1YI+lcVWBEjv?=
 =?us-ascii?Q?pNtiRp1hzg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cc94a9-86a1-4d79-da3c-08de4d0903ee
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:50:25.2914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8X9vEJYnCzij87oN0kMb7XvCO0ONUXU7MKSkCp7UxvlkFNSiyJtgviUfkimOeFshd71upkTRAzEUlrjncQ9tFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11198

On Mon, Jan 05, 2026 at 09:39:41PM +0100, Sebastian Krzyszkowiak via B4 Relay wrote:
>From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
>
>SparkLAN card has stability issues at 100MHz. It still appears to be
>able to max out its throughput this way, so limit the frequency to
>ensure stable operation.
>
>Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
