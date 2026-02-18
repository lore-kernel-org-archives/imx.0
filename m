Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567A3019BE
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771432969; cv=fail; b=lLF7n8z7qxGSq6p+Dq9TWuZu/hmxQ3a+FXu6GnUX2e1oIJlE+Thf8Hx7FJmoagYztJzpprNvML6+hQNcCgO3sFStm0vWyKSKk0OHYCQoC1cEwuQwl9NTTYsl5If3h7qL/44gO991SFrgbbvB3coWB0+weDVSLGcXQIgCnD6fLf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771432969; c=relaxed/simple;
	bh=mx0qGrgkL8TksteVZ8Ph8Dfna6II7KcSZ0b/uVJo9/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dkdOn3CssvNz/i6dcHuwyW3BlFVYIQgg4MB5INnotvI1DdvOKlMcNtiuYHy6WrTDrEFRQ+iioC3P9OQMRd8t5Lgdyf8OHVXmxMr1w9eg39x71UTxt8NKRU3FCKg3tB0RgNPq7mbS011HefviOkYpWwxenLs6j46bk9m7xuUfJUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cw3v2/Bb; arc=fail smtp.client-ip=52.101.72.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cw3v2/Bb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqYt3dCCs1TCbodbXYe9uoSzJmE9l48vPJ65rddP31Sgwa1OPIZdlB2hgnOc7TiX93X+H+78izbL3vYKqhlVO0ecdAgK3cZrnluPFvT7/Nk1OnEUr6bydaOplmTAwDfXtf32Tu1YyqR0tnZVpaz4FV/LfpmnMvljL/U1EAsVjvyYBvfyUUmXY0w0UfxGlNhnmrz500fREDRIB8EyZusMzfDV7q9AAudFfarutH5AB2S7QbacAzydSH2rlVEawQfJhZP8eJS4O2AjQsxiMpNcpnM7CFUuiaFuXPpYjDBUBBdztoIyQMLVU13WrrukqVfST0hv3D9LednvjpfnjY7zCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BY3kZChyKKqhHu7RaS+5ggEOJh1rKnsuUXVXGFed4M=;
 b=UhD3k/kGxj9oxZKt7Ox1itjjZ39VqEaf1x66FPXc8dT5AqVQvPUr9lU72lmtgZNJWNg/GLPOPNqn6+SxJcJaiguV8t0RHKTNyLDKZ7t25rEgftnmGV3pUKg3H5b5scftFzLBkKidNjRfReOcadNJjzsNY6d6GAnc4xsvWTIpQNOZDIGGBzEwBQaVxvpCYvdv+J47yMU3Be3p7+YbMW0Yb4XJVzQAdsh8/0i7cBfAcH9MtyrXq0dPXJBwJw/Iuz6cbDPT2WVXRaJnvSsJXECGqU2NQMv8HERNKRbyCOiX7jHIE5FzkufqRR1nRR0qtWJYGMrwcKKCqLCCVDo0ZRUqTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BY3kZChyKKqhHu7RaS+5ggEOJh1rKnsuUXVXGFed4M=;
 b=cw3v2/BbHvs87q9wOQ2DETL2G6jGIgcgtec82ZL1CTd0M4nN3hD/yQA00E8UMn81sA4uGoI3W++jLe3ltNycbmO0dPsBmRDiX8/jBBpDvdJnnRdiyoX7WaxYm/QicXDZf8rs3p5yE+mcBgI/qNzIk8BdRb3dpHeIN3KH5Q1OT3IY93B6f+ZGkVzeY0ErsAhCc+5WBMN9nIlaRNERrRpsz//Ou47eAaBWPuFGRcPZPlw4dz2+sENbMqWm+fWr2KYZah8MWNNjaM52zA7Nl5YbO2ZLzPQcvFOyg++euTqUlLyUpf14z71hfCw59ppDxh6MKgKnin6JYfiIzjuIY6fzyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8962.eurprd04.prod.outlook.com (2603:10a6:20b:42d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 16:42:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 16:42:45 +0000
Date: Wed, 18 Feb 2026 11:42:38 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: imx7-mba7: disable boot_cfg pins after boot
Message-ID: <aZXr_r1VEx5kcl7g@lizhi-Precision-Tower-5810>
References: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
 <20260218135415.204974-4-Alexander.Feilke@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218135415.204974-4-Alexander.Feilke@ew.tq-group.com>
X-ClientProxiedBy: PH8P220CA0032.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: f29b27c4-bbd3-4e2c-a3ec-08de6f0cbe4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jq8Zyig7LoYgZCnGi5juohBys9uaN+GVh7h8TStC6pmQSpaiEduc3xOW/ntu?=
 =?us-ascii?Q?BnsUqTg3r/cMy+rmVvRf+VyyGdnRdGCiTuec2EIL8n7lmcDSo45bAlLtR55a?=
 =?us-ascii?Q?zRKX2TEdQCrhyrCOZ2BjWynJTJkEopQj+7G4IbPpt7LjVBOV1eV6w0IEHjKn?=
 =?us-ascii?Q?vVdPBsAKXFWWqE1zZXcthigTidFEzlmlbxm1lfdSBpeB9Cj9GH4wnBXr9w4a?=
 =?us-ascii?Q?2q9vRCzwJFIoD03ctNuoT+pHpc03T3Aq8PJuQfDMtotMaiXco4ll0/NJqItP?=
 =?us-ascii?Q?ZRKatFkzCMpNlz1rwRKb47eKuGejUawYlzkWroOxRJrJBizSNWr3WnS9XS+Y?=
 =?us-ascii?Q?rCQI/4hGiYPmi1+ArO8iGRmt9pA9+tcpheShPAUwTYdUEZOjSKqGjzY8KnxN?=
 =?us-ascii?Q?2Ljlegrc8nmbk7843Ut9ooLis64nFQJkWU/c8aNRovedmDGKwXvYdsFn/Wiu?=
 =?us-ascii?Q?sadshD9UBx5ae0AIn1s7LMpvJMxxfPriPQLIls8f/rugaJ4fuLY8fhE8Zd0W?=
 =?us-ascii?Q?awkFO1r/kv+Q6aX1Ac4ctTECy0I9c/gGte+JEk7lFSfqsZJ1QxW9beS2P2MQ?=
 =?us-ascii?Q?ljiM8ZUAms6NkD4mmzGECc1WMg+k4z3Xb0Uz3bZuc0zAPrl1GNueQk1CIMCC?=
 =?us-ascii?Q?DKKqRi1ILhNWhZpp0Fw554MSv7utsi2RSDRm4/3f7annoCODttcqGWyFAjAa?=
 =?us-ascii?Q?HGo/VjFsN4D3zuBdG+0Dagcp7sffwX4Y5bqc4+Ns8H4Ih5+0fNkOaXr5NSGG?=
 =?us-ascii?Q?fOrMc52+ftD4lJWnDZlafau7Ux8sAAUYmkEXa3rT5hdLEwdw957k9E0gI6Kp?=
 =?us-ascii?Q?TWS9+LEaDB7EGRF64HeFBqDSwHF88uSSltFGhI159vm/B9r7wMmChYh+JUsr?=
 =?us-ascii?Q?jY4ALz1H0JXjfuNrRo7d2p+uAqaSdduf2ReI3ec8zIC5AIjFa+EUDum6abn7?=
 =?us-ascii?Q?S877NiRjSjD/60sTB1Gjb9UQna7/f/IwPOG79Ddg5KCW6kolX/4KrpbBBn2+?=
 =?us-ascii?Q?MNdijX6BbDLRcv0HfctsthdDEuvurxQmGPG8OfSZm5D6zPex0a97xyADKPG9?=
 =?us-ascii?Q?ZssVfCAgVzNrzgKJXMqu16qZDg4aDAPrY7RpvSlhCuOqtRECfPh4CKze7g6o?=
 =?us-ascii?Q?OvG/leLfpJcA5S/+F5HtjX8uUUdCBZ2+69tsE+j5o81VVIcK4BpzHsit9mUS?=
 =?us-ascii?Q?3v9ojZbRafhJM2fETh47XuQOAupL1qDOnQknrRtnPKpeFZ3UD4NhBMS2LUP0?=
 =?us-ascii?Q?Y95mpQzy8WUzq6GXfkvvG42cKB3I7z9C8YOw3PkueaTblXUylJ1E4B9d5axC?=
 =?us-ascii?Q?uQMmcaaz5EjwnXgn9o0kr4THVuVDywwHNX7M94Exbghkc8PtW2XxsHQm9mtt?=
 =?us-ascii?Q?rnZ7eCj9BdFGKp4qRWLM+25m4vniUed7fXGOlzigeq4X773+UPOVKM2T7iRY?=
 =?us-ascii?Q?cz6LMj1DpqVuXopnS9jg77qOVFU4RPq+u0A5ailJ0XdwFkD0RpcRccE1P/7a?=
 =?us-ascii?Q?DaNPPoqAUUPnDQTxnccc6FhdvvEQHpzJhqYhmizgF4104/e5Dv86hhHhjjXe?=
 =?us-ascii?Q?yPdlOnkuHFei77VJDPPyS9cZZyoXeuARGVkVe5yfDOT7mtIiqVys9v07UBJs?=
 =?us-ascii?Q?CGigxqPPZWwnv3Ms4XHhLnY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wul8PQtbr+zKWozv1UHYRHqhwqV6n6OIdjFss4srT/er255dY2n7r0anYDuX?=
 =?us-ascii?Q?G5YVZFjZU1bECoFuCUZUIi79YfFaDNUytRh8ShauAkaGWoQvrXXHGEIIzhML?=
 =?us-ascii?Q?PTBfY9oARUil6ZjlJ8mn7O9Oki135KA2Qw80u0+Mdoj5KdHAGj6n05BA4HJ1?=
 =?us-ascii?Q?679RZmDJpb3MfJRnnEceRLPZ89lp6XRnPSCa1IYwEE1QmQ8kElt30JmBLlW0?=
 =?us-ascii?Q?1+dx8gPBepEky9cr2+V+dbLCZfdFmBtojZNu34eYUSIYmY2Kir4I0H3mV+8g?=
 =?us-ascii?Q?WAsOcoGsDnKDlP9pqCJcsjAYiEOPyeTjOGGggfB/Lv7TaAC1JZDcAcyCQs/8?=
 =?us-ascii?Q?zyK4eNudwb04KJ4gbfMWWcVnZjHOXD0qF4yOpxCF5mGnSrWlbd9rS7imEdaG?=
 =?us-ascii?Q?DRbPsRlZYlwOT9MNrssLroS0uZa9N2Giv5Vu6BFiPUhRB1UAdHZzgNaClsYW?=
 =?us-ascii?Q?fcVe4DcfBGBXqEM4pIGfOaeE6YbiR6Jb7dvNismLBfwN+0euMw0810h+9aWT?=
 =?us-ascii?Q?sgM5Mxh8ELK+OLey7zlrqr7ATBS4tiSlURI6LcMFnu3LSuU5xhuh/4z1YLBR?=
 =?us-ascii?Q?RWLGf3bRBqPw7eqgUTgPE3JtBI7am6I6Fz3T4udUggH7a0SboGKb98NWL6SM?=
 =?us-ascii?Q?2NEITQFJcqpua2/vlu02d0QXsQiRrGxfMUlxVOqodAFQofHW9uR13fHIcdCz?=
 =?us-ascii?Q?Q8colOSZrQL5UDQouBsVz9Ojicz10496F0LjhxForjTpS0QtanaJ7HBC7e/O?=
 =?us-ascii?Q?syqnb/Y+LeaW+lMpRx0lAdYbcqnGFYmn1pT6uimbLyEBAo6oz/8iQVvw/MQy?=
 =?us-ascii?Q?ys2igjjrjcoZoPLWe6H1hhGS5H5j2BqQ2T0aRihATt56R9pOWTspc1lw7o5N?=
 =?us-ascii?Q?qX6ObIxOIWi7gHd/3OM26IXhQgH5qtt6iV45d4jeHspe37SoqtUy+KYeD7qZ?=
 =?us-ascii?Q?ZlvER3kSgK3I7hpvnZtQ3xQVoPENvAzsHF9sYEtOeOizUmISUI9cPv/kugeF?=
 =?us-ascii?Q?wVMaPRNXrM/w9ZiobGTfIzg8R0Qi4iEqn63xRCukviGNN0XQ9Hd+lTTD4jba?=
 =?us-ascii?Q?abdEQbOEH+QhT3aoCpZxuEcoQXgpIEbnGm+qLKDXmPysZgrJFPIZm21NcdYu?=
 =?us-ascii?Q?ss0dKX+rd3sTWTB269a113DM/pzCrzLJKCu+zZCzp5zmeAz1knE6oQxaJXwI?=
 =?us-ascii?Q?SqaEcjI0ayRInyJJ/fBhNRC4z7PtvrUtNaEViZFa/Uul/lBW+/B5fq0Ajnn4?=
 =?us-ascii?Q?66sNPoYsnAkwy5xOClwjn+yk82qKF2Iw/ISIKc7sCypXHQqkzmdFPUchvIC9?=
 =?us-ascii?Q?SYbZ2hvenVpbdTkIBCV48mXTgXDmJd0OYE25Hv6NF0XnxUSGsljUshEZRwub?=
 =?us-ascii?Q?8gc+VFm+7EIR3bsb8Gz8jHaPPqR/O1GrMtxb9ePPbhzew+c71nvAPDXgyZJO?=
 =?us-ascii?Q?vP1cRNxHIPPmZmZvU6Rw3DofTnKWC9g5bTdUQSCo6/Q+nahbuWQ7kATfsb69?=
 =?us-ascii?Q?CrsFokbew5LJpkOsOw7RrbTlmB4jrq6upgr0zdoKHvlY0xKhQD1OefgMXYKu?=
 =?us-ascii?Q?x/xUTqDS8HG1NQ5G31cawUdx1qkYNmKj+QElgmKFeP8Z7DTQtJ/hteJYhABr?=
 =?us-ascii?Q?jzNyfUkUuqGlBTQiIioKYfIGYxvhSt5Mk+YpwdKJWq93DDdpmAS0Dz5ZBMVf?=
 =?us-ascii?Q?8RW8HVIfYZzeiMBny5CSzkK59ZbVR9/3G/FfDWyOknkat+ykylaH/5KbJ9dj?=
 =?us-ascii?Q?tWPWo+KqhA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29b27c4-bbd3-4e2c-a3ec-08de6f0cbe4c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 16:42:45.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9knLOI/JR3TsJhmXyTD56T+TWK6Bx9NU0tWRBD5rIHL9UXgq+QmfKNTavaU1Ax2vHt1CgYkspwVnufUluapkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8962

On Wed, Feb 18, 2026 at 02:54:14PM +0100, Alexander Feilke wrote:
> The BOOT_CFG pins are located on the LCD bus on our starterkit.
> Disable them after boot to separate those signals.

Your comments is more clear.  Is below commit massage better?

ARM: dts: imx7-mba7: Deassert BOOT_EN to separate BOOT_CFG circuits after boot

Deassert BOOT_EN after boot to separate BOOT_CFG circuits from LCD signals.

Frank
>
> Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
> index 03f2f2cbdfbc..4192adb27223 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
> @@ -287,6 +287,15 @@ &flexcan2 {
>  	status = "okay";
>  };
>
> +&gpio4 {
> +	/* Deassert BOOT_EN after boot to separate BOOT_CFG circuits from LCD signals */
> +	boot-en-hog {
> +		gpio-hog;
> +		gpios = <3 GPIO_ACTIVE_LOW>;
> +		output-low;
> +	};
> +};
> +
>  &i2c1 {
>  	lm75: temperature-sensor@49 {
>  		compatible = "national,lm75a";
> --
> 2.43.0
>
