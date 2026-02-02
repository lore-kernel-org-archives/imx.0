Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF9C2C0F84
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770059798; cv=fail; b=I2MQPoeb8vexzLdCg3TZCmDD9ns+VIdx0Uqz3DB3Zwl53ji1pzdv4c/4/y57lqkzscm7vteJKFYTPYDUzcWNmS6hkzKwM1qMxv5wGFXwO9+a9xfbtzyYZ7cSSG19k2GrDuN7JTg+y9FuF/Oa2DrqlBFglqy31LLH1Y/J/8AlDy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770059798; c=relaxed/simple;
	bh=BeIKoCFugSnx0skEOC/J7dvEDAeZNRdY++PyJasyrJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BQcCl2vG1XBO92s6EJlAX/95TG+ZwdA0Nd/HCaPOc/yhmI3VmU5inHOMvKmZEJNrh3gncm12CN5KVTzTwzW5Vt++MvYFGnIpnaR1fENBH9m5Fy0VkMVurjD1gBipND/Ky5jo97l0yR59bN++S2znskkl4yoI5Lijv6eTHCQRuXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eZNRsiEy; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eZNRsiEy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNr7pikfvv+FYYWVUXsE5CJfDReh0i9pVeEJQfazP7yHSjLxSXb6Yjoeu7b5f+YVhruHp88kYEtaSz8ht5PfJEI34BhMzR4JsDPBTFIhPpyy/p79nMDJGYR8Vb9wWq0TOd65dFTSxj36q83SzX3EXFUkrpnc8WRgXMSGeoZY/TZqGYt4ODFKMVIQK0MSQXHN5dkZbN8hNEsn3PNSTSWpBYyZ+zfemme7uGcCM+vYIBLgIKpE/SSLebfGc4PuOXQcVP92drjWkmyuHUJqLdKWNUJIIly1L9V5JCSMsJdVOSUS7d7g9BJzqQJ3eBb4vbkS745hX5uUarqXff8xzt6EXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7gBWxUTZOtG/0KM1zsN2W9D66gzPHnk2+KD0fkxQeQ=;
 b=ul8UD9I+lCAYC2bc7GHgURuN85CpHsyQlXA4NI4XbWt4aQixkumkCfYZURNiXfeOHLCWZZPM3pPGrXFZG4tLAsPlgaR0+BaMOBv1SD+tpJP3cCYx5bnhy6kuW79c9B6exb6V90zay8FvC+Ph0igKuGLs+c1T+FTM2/QmBlybAEo1egDbIL6Kex1NoEZhLf0SyAJRV77YLmVf8ZYkD76zGRvIAqzuTFdNSg+O8JUwSmVHbOMnoy9ygoeSga0XUpWV/Z0opAYuFUoR0rdLxMGFP/wCDqh37bko8EsvxLPzjbvGWiTyJOAVZB+rPCvDWWyLotvS8W80T9raI++hHCyCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7gBWxUTZOtG/0KM1zsN2W9D66gzPHnk2+KD0fkxQeQ=;
 b=eZNRsiEy+M3kybMo3BmTgYF4LvHXkU2hthz5Lt7nocAKUo35tpOoWcqpp7mwH2VNAnQUTsnrBI9KnA2YVBr73FGViMgD6oa9EtxpdKCkiQqoYEgdPdDX3q9U7RsF5nTqcvA3IGrPNlzoVccs9ahqsn57kriF1KoQy4UA9nnHGdwfGYupNnOfiD42NGZoLxZAKUyN0P+qrhh7xh+ZYyoStc9pxoJqU2QpoK4p3qsDAfv1MNDixbP0uQUj3RYkL6SDjpoJmbb8VbVxhxtOs+IlOT6cprx9SfSCVWOTHLDhgmG5ra7ZzbayDPUJjHUuhEiqpL8bTxKKTfQUmOoereurCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7318.eurprd04.prod.outlook.com (2603:10a6:10:1ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 2 Feb
 2026 19:16:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:16:31 +0000
Date: Mon, 2 Feb 2026 14:16:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx: Add i.mx8mm Gateworks GW7906 dts
 support
Message-ID: <aYD4BwB3McK45vCk@lizhi-Precision-Tower-5810>
References: <20260202181029.1832198-1-tharvey@gateworks.com>
 <20260202181029.1832198-2-tharvey@gateworks.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202181029.1832198-2-tharvey@gateworks.com>
X-ClientProxiedBy: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: ccca6c5c-94aa-4725-d2be-08de628f9285
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?7XF1B3ecIAsdiNVofmqgBtkoxRgulZyIk0CqznFFjK529apv5crfKDOW6syK?=
 =?us-ascii?Q?9nq9Y+avu/R/40ibe6OuPPGghzmsNLOU/WaImu73vEfNIOpkXrARZKtnpyg6?=
 =?us-ascii?Q?vbUiyVaeKv3G+WVhrnGrJYoQwx3+gbrJClZiKqlE6xUE31tNRl/3pKYiq+PV?=
 =?us-ascii?Q?ysEFxcVOrybeH1v1ApYZuBc2ozlWi/WMUscu7pDkDCOdg6JX9tpXqSCDAwYi?=
 =?us-ascii?Q?+zzlNCNgMXazRpTl4Zfz4TfTuqYBrYbsRat+aaASYIRXddj3k6l+Tmq5mjNx?=
 =?us-ascii?Q?lTOji5o3EjRMWHrfZH439GYwv52W/bAKF1/IDZyTbP1GJjXKc9UZ7PdNe/GS?=
 =?us-ascii?Q?krUj/mrcJRDhWrId4jWliqyhN3dLdqhjFrUU+7X/xVglM0S3511SnN7LkhG7?=
 =?us-ascii?Q?uka8jhA1yApU/pqTfZ0dGllPvz8AgPIvsDfhVXYx8HsDN12FKnC30phmYZu0?=
 =?us-ascii?Q?OQjomKlotlOvkHoQf1PmTAU+FhNw6Dcbe6PM+rpweqtF51B3Y0YDecr0v3YU?=
 =?us-ascii?Q?uH3YHsWNfh1EfTHGkv7bMeYqExWFw46eJkf7GR700zrC3cSiK8/9wf0A5xbg?=
 =?us-ascii?Q?owZobd6hNWt0N7dd1I4W58BTRF3tQ+i6olrFvNE8zrpjyzMiNTQ99H3Udkbn?=
 =?us-ascii?Q?I4IIu3/eLILkZNaOm7YwFQpFKbFW2RQEIgIcjW6bd/zmZoJ3bISRomfGKtwt?=
 =?us-ascii?Q?25AdauJyL7JQVs9h+WAXA3O/GigBnh7IvXgFG4vVorlMIIJWRhzQqQ5C/o9Y?=
 =?us-ascii?Q?NTwSpamYr6OBBQHM5veT/gb/WQyj4+DwjAU7DONkpuDE7q39XS+zzG/TLiSi?=
 =?us-ascii?Q?g7HlyaEyMWhxi8VRLpsK7ADGnxDyeaEDp1jEtG77GpX6TK1dx7EfAmSUospA?=
 =?us-ascii?Q?TMH8+HTQd0j1x8rWA9rOX4YUT41R2CqGb/0lGhX+3+U5+qV1oXA8gCernc4x?=
 =?us-ascii?Q?9kZUzp3BbgnmbFu4znC0fEYR+HogqidfSD/OWyi7UgvT0pByTPzdDB3hVPev?=
 =?us-ascii?Q?fiX+83TYfhxLESnVCjDrIguFPNin0F/ZfKs/fX76PS+fHYE7KNHuyHLy/+5k?=
 =?us-ascii?Q?KEGADWVQp6DF0sQa47ftQxAdIOqzSXUlacMtvoU4zoHTYBkE+paV9vW/jTh0?=
 =?us-ascii?Q?b1Z7t2sNjO6YwfwWC1wb3QsZ2H3BkExLDRdD0bVykSPBUczbPSW3L86C/c//?=
 =?us-ascii?Q?Bt4VFj3l6Iv9Cww76j6SE0Lgz8/CVfG22UXo3QnJZAUnzGMJKPos74qSN1zB?=
 =?us-ascii?Q?aJAPNNL+3lOJhmnqErj8ICrrRUQhTGngpMde4u/pU0OHNk3aO4JdhryF62j+?=
 =?us-ascii?Q?UKWe/uzz2T7x7Qq31WIC7i28hcgsw7JhPwx0xMVTHedVYP8eqQJD534LU9RV?=
 =?us-ascii?Q?IV7GDn8ZFQItr27zAMt2wayMC1Xr+XBrpHMFWCDKOnBN1Yy216LGtK+qVC0u?=
 =?us-ascii?Q?y6LABAAEwSOWZJsi3EF1dgGQrqmTjIg7JpL1VVXPJaybmJKtxC3fdOcdXW/c?=
 =?us-ascii?Q?+F24AzgBjvukuaa/g2dzQ53klAmU3iAVqOneV/jh8K9EnjlaUl05x8TkESw4?=
 =?us-ascii?Q?Zzrx8c9A3eQ/wbYsXr/PpE7NkHCBGLsZpjYjJFs7tqa/8IdlqqCXZ2ES3YT9?=
 =?us-ascii?Q?z+DeMcbL2C1X1yolxrEo8CA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?n9qWW43aRc+lpPDYTzTo4ssRz5tnchxBa0pMg+xb6Reo1EUWgtpnb60232Sp?=
 =?us-ascii?Q?OTg6/nE14UwuOLR8Wm8bAnM++WSnXbIFEDZO8D0lmEsJubUKytBaOdSkmMnh?=
 =?us-ascii?Q?TlHIZE0hN13uLrbBu7TUWU4vM648f1iDUVfJ0GRczeNjKg7dqiDyluPohKr5?=
 =?us-ascii?Q?9vc1rdngK3UL/GsBMDRv9KcH8Y4Lts32IB6ECTKDDCDDO1MefNRoHOtRIsmF?=
 =?us-ascii?Q?fpzPC9Ei+uGu5MMR9hswS+sSYtbSI2hUp79wGfFfQdp+mGanVWf6MqVZwG7b?=
 =?us-ascii?Q?Jr6KsACo7O0cF7JA3fMKhNsNgwROKd4aQwfm7Xm8eB97zIcQscBUZ5drQnNv?=
 =?us-ascii?Q?f6mPbadxBLvRzNgMuuXnqP52fuySH4o4TRMNwEHHmjpJDOuxnTo/42Ug68Xy?=
 =?us-ascii?Q?gVJKrUYn9oz/sz7PoU93UHtE2qQeL5IuqnmvbeHJN1gQIQ6PAjiaVEiZPb1k?=
 =?us-ascii?Q?4zwi8yx56VtF7cp5VmsnBUFl0XilA6eP+2q0mpwdNyRjHW2u/gLX3TSIkr7Z?=
 =?us-ascii?Q?gq+h+l1JvesRK0Fiq0gRLjeRg1nQbLuuP9KqaSG46w3/5tIJcjW798pUq7V8?=
 =?us-ascii?Q?TQoM1htGRqMb/q27SuBQrcR066alfkv4X5r8uPDN3nSgeEJqtdp9mVvsjFp+?=
 =?us-ascii?Q?anw2zVTsD0RiXyUc2Letsttp6YHXSBLIrkq9UaM76cOpsfrsP61gGnoPIBxo?=
 =?us-ascii?Q?4aOqA/I+E8KVRyrfNUrf9r0Rjo9K8GFdhKZbd7RIMWeph0sOXMuaEOjXPjCb?=
 =?us-ascii?Q?tb/bhvYDkXWcH+c3w1S3fF/diXTFJabn4RX4QvvRSiGlj2Gnzm6vzrJp5kSQ?=
 =?us-ascii?Q?ZNT6/OjaA309qkwMkur3i3dMvUzcjcwyTgvl6AtAONNr9Gp11jlGRv9x34Oc?=
 =?us-ascii?Q?S66+bQvPe/vgPNuoqRxNMibbqcEVU9hNWRPTNzUqaKK0cyBHcTgdnvkR+PkP?=
 =?us-ascii?Q?/Wx1QoZKwU0y5HzJpDsH10UGA8Rio1FNRd7Xn214fKaPzlhk/mBPWJauctIh?=
 =?us-ascii?Q?3ExuMAIKW/YCAsHlJgUcTQRUDQ6UBrnFYFdJO7wRu7rzcIJ2zmR9UlL5h+fj?=
 =?us-ascii?Q?G0WJ4jbEC+ukDfBymrf377C+9+CRa/f4jIpS6JUiIh3mlEw71QiLA8KB73Gg?=
 =?us-ascii?Q?vWD0pr9jk/N+J+ugr0uteQ08blTmY/MgQlrk+rO89CjqhMeE/kXA1H+QaGlZ?=
 =?us-ascii?Q?xVz/8990eEoGHJ10VQ/cXKgrQg73cH/RAd19u0agVGLg94A+A+E5HU153X1/?=
 =?us-ascii?Q?sD7JefTywgJ6PSgevWSdEz7PbX+W2MgCy9fUWhsvyhbiQoNDiDfDm9WP0wFw?=
 =?us-ascii?Q?DBTS5mb4a90NSHBntVLC6FvH45AdK4T8mt6wKXK4aRZme49sVrcokwH1BHl4?=
 =?us-ascii?Q?08oZhWjWo0WazgItqC7S53pUiNgoIk5AY0X0T5XgZeSk75Vh5RPFaPqgjept?=
 =?us-ascii?Q?01t1tuYdCKme7oWmwzdaLdIg8BviqmD4XfDKd8awao8mZnZGlRMr30COODjo?=
 =?us-ascii?Q?LpS6I/ZPfsi+Mkm896ay6o+OIj5NWQueENSoBdsd4/JX0SVxlk0brj1xQ9o8?=
 =?us-ascii?Q?1lQhsC3EOk8x4T7lQxI4NIjewFVnX2T96Gc8lmFkr5eFjLLKbfOrb+lBJEjk?=
 =?us-ascii?Q?Fl0S08iV/+RaugWQyHpbcghQIhRqy0fN2GG2I/8S5MKQ/hHZvakRUDmpGzbj?=
 =?us-ascii?Q?AsBQt0R56NZpbOe9IQSUttCCHylSJVweyinn99iK6jXzoGUq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccca6c5c-94aa-4725-d2be-08de628f9285
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:16:31.5414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqCvQL/gxq413oGg8JKirCHpDS2hvMldy0iY2TBCDyOOKBnWjiA/uDhPqRNeIgfYVpqH9fN2KrsiaYtCAZQfdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7318

On Mon, Feb 02, 2026 at 10:10:29AM -0800, Tim Harvey wrote:
> The GW7906 is based on the i.MX8M Mini SoC featuring:
>  - LPDDR4 DRAM
>  - eMMC FLASH
>  - microSD connector with UHS support
>  - LIS2DE12 3-axis accelerometer
>  - Gateworks System Controller
>  - IMX8M FEC
>  - software selectable RS232/RS485/RS422 serial transceiver
>  - PMIC
>  - 1x isolated RS232 UART
>  - 1x off-board bi-directional opto-isolated digital I/O
>  - 1x M.2 A-E Key Socket and 1x MiniPCIe socket with USB2.0 and PCIe
>    (resistor loading to route PCIe/USB2 between M.2 and MiniPCIe socket)
>
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---

Any difference with gateworks,imx8mm-gw7904? Can reuse existed file?


>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx8mm-venice-gw7906.dts    | 869 ++++++++++++++++++
>  2 files changed, 870 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 700bab4d3e60..83fc7faf81d8 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7906.dtb

Please run https://github.com/lznuaa/dt-format for new dts to keep nice
node order,

If output result is not good enough, let know

Frank

>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> new file mode 100644
> index 000000000000..ec146a2b7549
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> @@ -0,0 +1,869 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 Gateworks Corporation
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include <dt-bindings/phy/phy-imx8-pcie.h>
> +
> +#include "imx8mm.dtsi"
> +
> +/ {
> +	model = "Gateworks Venice GW7906 i.MX8MM board";
> +	compatible = "gateworks,imx8mm-gw7906", "fsl,imx8mm";
> +
> +	aliases {
> +		ethernet0 = &fec1;
> +		rtc0 = &gsc_rtc;
> +		rtc1 = &snvs_rtc;
> +		usb0 = &usbotg1;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x40000000 0 0x80000000>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		key-user-pb {
> +			label = "user_pb";
> +			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
> +			linux,code = <BTN_0>;
> +		};
> +
> +		key-user-pb1x {
> +			label = "user_pb1x";
> +			linux,code = <BTN_1>;
> +			interrupt-parent = <&gsc>;
> +			interrupts = <0>;
> +		};
> +
> +		key-erased {
> +			label = "key_erased";
> +			linux,code = <BTN_2>;
> +			interrupt-parent = <&gsc>;
> +			interrupts = <1>;
> +		};
> +
> +		key-eeprom-wp {
> +			label = "eeprom_wp";
> +			linux,code = <BTN_3>;
> +			interrupt-parent = <&gsc>;
> +			interrupts = <2>;
> +		};
> +
> +		switch-hold {
> +			label = "switch_hold";
> +			linux,code = <BTN_5>;
> +			interrupt-parent = <&gsc>;
> +			interrupts = <7>;
> +		};
> +	};
> +
> +	led-controller {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_leds>;
> +
> +		led-0 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_RED>;
> +			label = "led01_red";
> +			gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-1 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			label = "led01_grn";
> +			gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-2 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_RED>;
> +			label = "led02_red";
> +			gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-3 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			label = "led02_grn";
> +			gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-4 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_RED>;
> +			label = "led03_red";
> +			gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-5 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			label = "led03_grn";
> +			gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-6 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_RED>;
> +			label = "led04_red";
> +			gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-7 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			label = "led04_grn";
> +			gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-8 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_RED>;
> +			label = "led05_red";
> +			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-9 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			label = "led05_grn";
> +			gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-a {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_RED>;
> +			label = "led06_red";
> +			gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-b {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			label = "led06_grn";
> +			gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	pcie0_refclk: pcie0-refclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&A53_0 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_1 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_2 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&A53_3 {
> +	cpu-supply = <&buck2>;
> +};
> +
> +&ddrc {
> +	operating-points-v2 = <&ddrc_opp_table>;
> +
> +	ddrc_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-25000000 {
> +			opp-hz = /bits/ 64 <25000000>;
> +		};
> +
> +		opp-100000000 {
> +			opp-hz = /bits/ 64 <100000000>;
> +		};
> +
> +		opp-750000000 {
> +			opp-hz = /bits/ 64 <750000000>;
> +		};
> +	};
> +};
> +
> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec1>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	local-mac-address = [00 00 00 00 00 00];
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +			tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			rx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +
> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_AMBER>;
> +					function = LED_FUNCTION_LAN;
> +					default-state = "keep";
> +				};
> +
> +				led@2 {
> +					reg = <2>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					function = LED_FUNCTION_LAN;
> +					default-state = "keep";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&gpio1 {
> +	gpio-line-names = "", "", "", "", "", "", "", "",
> +		"", "", "rs422_en#", "rs485_en#", "rs232_en#", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&gpio2 {
> +	gpio-line-names = "", "", "", "", "", "", "dig1_ctl", "",
> +		"dig1_out#", "dig1_in", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&gpio5 {
> +	gpio-line-names = "", "", "", "", "", "", "", "",
> +		"", "", "", "", "pci_wdis#", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&i2c1 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	gsc: gsc@20 {
> +		compatible = "gw,gsc";
> +		reg = <0x20>;
> +		pinctrl-0 = <&pinctrl_gsc>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		adc {
> +			compatible = "gw,gsc-adc";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			channel@6 {
> +				gw,mode = <0>;
> +				reg = <0x06>;
> +				label = "temp";
> +			};
> +
> +			channel@8 {
> +				gw,mode = <3>;
> +				reg = <0x08>;
> +				label = "vdd_bat";
> +			};
> +
> +			channel@82 {
> +				gw,mode = <2>;
> +				reg = <0x82>;
> +				label = "vin";
> +				gw,voltage-divider-ohms = <22100 1000>;
> +				gw,voltage-offset-microvolt = <700000>;
> +			};
> +
> +			channel@84 {
> +				gw,mode = <2>;
> +				reg = <0x84>;
> +				label = "vdd_5p0";
> +				gw,voltage-divider-ohms = <10000 10000>;
> +			};
> +
> +			channel@86 {
> +				gw,mode = <2>;
> +				reg = <0x86>;
> +				label = "vdd_3p3";
> +				gw,voltage-divider-ohms = <10000 10000>;
> +			};
> +
> +			channel@88 {
> +				gw,mode = <2>;
> +				reg = <0x88>;
> +				label = "vdd_0p9";
> +			};
> +
> +			channel@8c {
> +				gw,mode = <2>;
> +				reg = <0x8c>;
> +				label = "vdd_soc";
> +			};
> +
> +			channel@8e {
> +				gw,mode = <2>;
> +				reg = <0x8e>;
> +				label = "vdd_arm";
> +			};
> +
> +			channel@90 {
> +				gw,mode = <2>;
> +				reg = <0x90>;
> +				label = "vdd_1p8";
> +			};
> +
> +			channel@92 {
> +				gw,mode = <2>;
> +				reg = <0x92>;
> +				label = "vdd_dram";
> +			};
> +
> +			channel@a2 {
> +				gw,mode = <2>;
> +				reg = <0xa2>;
> +				label = "vdd_gsc";
> +				gw,voltage-divider-ohms = <10000 10000>;
> +			};
> +		};
> +	};
> +
> +	gpio: gpio@23 {
> +		compatible = "nxp,pca9555";
> +		reg = <0x23>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gsc>;
> +		interrupts = <4>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +
> +	eeprom@51 {
> +		compatible = "atmel,24c02";
> +		reg = <0x51>;
> +		pagesize = <16>;
> +	};
> +
> +	eeprom@52 {
> +		compatible = "atmel,24c02";
> +		reg = <0x52>;
> +		pagesize = <16>;
> +	};
> +
> +	eeprom@53 {
> +		compatible = "atmel,24c02";
> +		reg = <0x53>;
> +		pagesize = <16>;
> +	};
> +
> +	gsc_rtc: rtc@68 {
> +		compatible = "dallas,ds1672";
> +		reg = <0x68>;
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pmic@4b {
> +		compatible = "rohm,bd71847";
> +		reg = <0x4b>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +		rohm,reset-snvs-powered;
> +		#clock-cells = <0>;
> +		clocks = <&osc_32k>;
> +		clock-output-names = "clk-32k-out";
> +
> +		regulators {
> +			/* vdd_soc: 0.805-0.900V (typ=0.8V) */
> +			BUCK1 {
> +				regulator-name = "buck1";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <1250>;
> +			};
> +
> +			/* vdd_arm: 0.805-1.0V (typ=0.9V) */
> +			buck2: BUCK2 {
> +				regulator-name = "buck2";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <1250>;
> +				rohm,dvs-run-voltage = <1000000>;
> +				rohm,dvs-idle-voltage = <900000>;
> +			};
> +
> +			/* vdd_0p9: 0.805-1.0V (typ=0.9V) */
> +			BUCK3 {
> +				regulator-name = "buck3";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* vdd_3p3 */
> +			BUCK4 {
> +				regulator-name = "buck4";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* vdd_1p8 */
> +			BUCK5 {
> +				regulator-name = "buck5";
> +				regulator-min-microvolt = <1605000>;
> +				regulator-max-microvolt = <1995000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* vdd_dram */
> +			BUCK6 {
> +				regulator-name = "buck6";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* nvcc_snvs_1p8 */
> +			LDO1 {
> +				regulator-name = "ldo1";
> +				regulator-min-microvolt = <1600000>;
> +				regulator-max-microvolt = <1900000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* vdd_snvs_0p8 */
> +			LDO2 {
> +				regulator-name = "ldo2";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			/* vdda_1p8 */
> +			LDO3 {
> +				regulator-name = "ldo3";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			LDO4 {
> +				regulator-name = "ldo4";
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			LDO6 {
> +				regulator-name = "ldo6";
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> +	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	accelerometer@19 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_accel>;
> +		compatible = "st,lis2de12";
> +		reg = <0x19>;
> +		st,drdy-int-pin = <1>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&pcie_phy {
> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
> +	fsl,clkreq-unsupported;
> +	clocks = <&pcie0_refclk>;
> +	clock-names = "ref";
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;
> +	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
> +		 <&clk IMX8MM_CLK_PCIE1_AUX>;
> +	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
> +			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
> +	assigned-clock-rates = <10000000>, <250000000>;
> +	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
> +				 <&clk IMX8MM_SYS_PLL2_250M>;
> +	status = "okay";
> +};
> +
> +&disp_blk_ctrl {
> +	status = "disabled";
> +};
> +
> +&pgc_mipi {
> +	status = "disabled";
> +};
> +
> +/* console */
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	dr_mode = "host";
> +	disable-over-current;
> +	status = "okay";
> +};
> +
> +/* microSD */
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	bus-width = <4>;
> +	vmmc-supply = <&reg_3p3v>;
> +	status = "okay";
> +};
> +
> +/* eMMC */
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	assigned-clocks = <&clk IMX8MM_CLK_USDHC3>;
> +	assigned-clock-rates = <400000000>;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&wdog1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10	0x40000041 /* RS422# */
> +			MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x40000041 /* RS485# */
> +			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x40000041 /* RS232# */
> +			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x40000041 /* DIG1_IN */
> +			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x40000041 /* DIG1_OUT */
> +			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x40000041 /* DIG1_CTL */
> +			MX8MM_IOMUXC_ECSPI2_MISO_GPIO5_IO12	0x40000041 /* PCI_WDIS# */
> +		>;
> +	};
> +
> +	pinctrl_accel: accelgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x159
> +		>;
> +	};
> +
> +	pinctrl_fec1: fec1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
> +			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
> +			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
> +			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
> +			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
> +			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
> +			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
> +			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
> +			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
> +			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
> +			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x0
> +			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
> +			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
> +			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
> +			MX8MM_IOMUXC_SAI2_TXFS_GPIO4_IO24		0x19 /* IRQ# */
> +			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x19 /* RST# */
> +		>;
> +	};
> +
> +	pinctrl_gsc: gscgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26	0x159
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c3
> +			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_i2c1_gpio: i2c1gpiogrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14	0x400001c3
> +			MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15	0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c3
> +			MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2gpiogrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C2_SCL_GPIO5_IO16	0x400001c3
> +			MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17	0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
> +			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_i2c3_gpio: i2c3gpiogrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18	0x400001c3
> +			MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19	0x400001c3
> +		>;
> +	};
> +
> +	pinctrl_gpio_leds: gpioledgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5	0x19
> +			MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30	0x19
> +			MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2	0x19
> +			MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14	0x19
> +			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9	0x19
> +			MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3		0x19
> +			MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29	0x19
> +			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28	0x19
> +			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x19
> +			MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31	0x19
> +			MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4		0x19
> +			MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8	0x19
> +		>;
> +	};
> +
> +	pinctrl_pcie0: pciegrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ECSPI2_MOSI_GPIO5_IO11	0x41
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmicgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_DATA02_GPIO3_IO8	0x41
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
> +			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
> +			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
> +			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
> +			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
> +			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
> +			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12	0x1c4
> +			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT  0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x194
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d4
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d4
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d4
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d4
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d4
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d4
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d4
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d4
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d4
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x194
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x196
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d6
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d6
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d6
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d6
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d6
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d6
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d6
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d6
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d6
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x196
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdoggrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0xc6
> +		>;
> +	};
> +};
> --
> 2.25.1
>
