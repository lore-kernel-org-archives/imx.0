Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22333A9FE
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925939; cv=fail; b=FFoxe7lK7PBJ1I+vG7aQ+v7sijwu89DryQNvfXlFtBk9fBAqwxzmm7WmmYL8s9uuF4DqpGrbYkbJ57A+Ee0ZVY9wrz3dybroYiar4JcRdO9zOIb/P2D1TJAQF53wGbTpruxd8/eZ4Mgj7OzGRRpljcSThYhpQAkebS0u6Z55F6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925939; c=relaxed/simple;
	bh=0leSppciFHAkH00Ylq/7ytYuNq42ZmRo8ETCZDyCmo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qzkbyPs6qhnGJidx9h8C25PcYRbDyPmmGNggC7QkbXswpspSTDZUOcVpiFdHK/HAGLsxIPYf6FA2lf1+qqipALg4RN4L/XBbQ/BKC8KcCVl1ocpDalSWKWIU6seRXAmI+prV/ZKi6ENppe0JW7boWYDY59r/YWwzphKA+FqRMgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h3eAq17z; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h3eAq17z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESXKJzXJoadrAPjOpjRmkcnvxxh4PEojn7gtNFe5oo7X//rivcsHewsmv5DAiG5G3Kh6rQybdOlY0lPIaNxE3RT7yfzsgSe9fEJG3xaT0Vo6Cltp3fKuE93aTjkj4TpAQrqoPQ1t36By/52GyTqh4DMiwYSptVb/7EyyjMuF3pLR41F3xhKEPpfGRB1cEzUGzl3uCNFXoDMXBeqFbAYN0XP1liTRQOEhc7DdoE2OJaQwUk0B1FSBgRtpOrXWH4zp8zRVm2O60to8PGPZnw8IUq/BaEaxFftrRNaZlYY+lBWAfKrmJnbsRvhB0eg8isDTOyeRcxNl+UOFlJJHZGk7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEijWoEcz8qk4vc5lKA3KEBifk+rAUpH5c1UQE6t/hM=;
 b=SpWc8WnGL6IuQ5FD72u95jCaQdWzeNUQnSPNPWqmfaDg8W4snDE1cCO2WyVrW4lZchphKP5h2bxlrk5nsAysICZ8Wo/GZQp/GCwB6B2h/TDX/wmC39ubk1QFYVciwKqGDg6JuIYhyRkGsiqvw5agfBqVNp0wrlJyZmMG5Nwp2WZ7/tZBTWqPSGFiDrJUU0+qHKF4ZpYrTcI6TnR1ioqn/gUnlCeshEPn9NXNl5s0f+NGg4k1hgVyCdWySqyDFpVDvjSaxc2vz67yNwkI8VgdXEvO0laciTIpMlU2XMKhp6IQcbFb/vBhnNRyvqeGeYs/a8JghSx0XuSEL1LLKIkA5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEijWoEcz8qk4vc5lKA3KEBifk+rAUpH5c1UQE6t/hM=;
 b=h3eAq17zO9A8WGR/TeP0ZIg9Nm8+Aa3JZkIItym4NzIBIB+6kYV2W6tRJkzyyQX2gHlulrjw99IB/JGLIwkP7MjFyQZgp9ZOre75FbHUly+mQP1r95L/2zFBq5N63/1F6C9SR/pepbfK25e1a0cvoC4NFdri5ANeRcM4hi9EOyloExVwNb1o0EqdIYDvLAKOreY2jb0pHF0GLtG81eriKk8Cot4DgHJCafcOzqZQNd0U4qkqP9VNTck8h0v9Qq2O2uXGX0XxIWtX+uDbgJiJWvGcjXYn0oKYSAAikpQblfpUw7y10+FEhX9rY2k3U9IMdZkoSw6fvlbf7YCr2SKhZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8727.eurprd04.prod.outlook.com (2603:10a6:10:2de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:18:53 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:18:53 +0000
Date: Tue, 20 Jan 2026 11:18:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for
 SM-based SoCs
Message-ID: <aW+q4lrdYJEciNS/@lizhi-Precision-Tower-5810>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
 <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:a03:100::41) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 530cf115-f716-4627-ba05-08de583f9ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w6YnROS9oCoLMz/37oyJZ7NSpSMcaubm7kBpiX3DEES+JLlspleW0fOFpnCK?=
 =?us-ascii?Q?jB/aeNvpOcuGNfd7xuZC7tIo1lTN/4VZKcolAN+zEZ7nzdVt/4mkYOI+6f71?=
 =?us-ascii?Q?EWCv/dSsvCjUrjxFTbwN3lA/G/ZTwe06AzcJ3Q0y/eqCIILrDo4VujCsu/ci?=
 =?us-ascii?Q?9SdmIdYISIsn8d3mAqQ0ZJrcigXX4KfeqJBf2GJ7l4DnuxHGn5rCja4eg3uU?=
 =?us-ascii?Q?A1u6pr+W6nwljhdGQPdK2ZyCGo4LbQAQi/JbNjuz/PV1zFEh+jvcrPhYqvMz?=
 =?us-ascii?Q?Q5/ZK9zg8AhEyjll3wvJkQMimoxlUbWjigHv4u7M6xf53AGQ2dmmfgRlA6cj?=
 =?us-ascii?Q?/mYdE3q7L5p3hPMZVJ597aJEu8uyprMQyoBKzSfL9ycb8bHeRbXm2dnR3IHH?=
 =?us-ascii?Q?WQ6j+bu/uUBAKF6G2B5TBf/m7bBfwjKsR+ICAZxLCTyEbIloxXbC5qUNAOw9?=
 =?us-ascii?Q?6zerbOgYoGAQtGB9TbXu1WgxJ9jno/HEnNgGLE9zLhcC5Ja51rFwIPBh2dYa?=
 =?us-ascii?Q?d2ThGqBsryhS5gwuicgcNfnSSmJqoEV5CPfDyKBObmhitKX4H1fUPJg/QjbF?=
 =?us-ascii?Q?Qf73bAnx/rUkAQRUsJ/msA+3Ac+YUES2zFBWU9wpG99Zmi1UjNPKc2rCr7PD?=
 =?us-ascii?Q?oma9KOrfDpJo+axnNbznfZ9OBAxZfnYIJFwm0sO/r2pO+Ulwh0FKnDPo2okb?=
 =?us-ascii?Q?my5vRNJRhBhZby5bPPe0/q3SVafPtcmR3SnaUH7sSzowOVP8E8Pucsbf1psk?=
 =?us-ascii?Q?o+eU1zN0jqGB/uI8wt8YfG+ZINBQh9iEp4N78SKc1pPfnPBvUpZLwtH0rMgB?=
 =?us-ascii?Q?v//DJYMMwmmnV/dsZVkGSJEToU5UI59jetGAPgFHqzq+fwzyKgo2HGsTlJ3P?=
 =?us-ascii?Q?m2PktfC+wzRHznGeYrBTSTM7SHZ8Y7sBp30HngQIF8MJYIC1mXdpb1Sj4lfB?=
 =?us-ascii?Q?iYbs7+/Wx1oLJIe/7hxsiSpK0gZzpr/HYNL9jDKklH55rQJHkuDz7Wxf4mD/?=
 =?us-ascii?Q?MJXtAo4jCdAS4AGFvr0tMWecpx3pWUDdfoibExYBpiuC2IUDiGRMI0jrCgvJ?=
 =?us-ascii?Q?5vuKFeXmxpJYDeO+qVv0nEYyxab2BeZT8djUSyffUlfSVbqnBSpvC1IXxbHc?=
 =?us-ascii?Q?RfWeDq/IP476XAfKZOM+YNQhSWk320dd3hC2ROwS43vHVI77X5LQnOnnTCJc?=
 =?us-ascii?Q?9JUwdKF6yQHKDzlwVg11ttQ66HYcY5ZTdYw5lw63LKBzn4zPHo/0RgVBWYF3?=
 =?us-ascii?Q?OX7yBNqnhLVdP0rcJk5YSf5rM1HiAQSQA0/cx/2iSMA8MItzxD17SQD5orA9?=
 =?us-ascii?Q?4HaDpfRNhvyqQByrXT/+HF9vWogb1f027TBbCX7Fc4J6MSdTEkQP6L7AToAB?=
 =?us-ascii?Q?dH7SULL6CR8ncyqU6UG87oKXYXUION3SKecz+4eDsLf2I48Qu5u1BH07T2ki?=
 =?us-ascii?Q?ujPNdyaL8HvZg4epYqlY39o4J5ouhS6Y9vIUnyfJ902EEQ5tszusOFp1+tlB?=
 =?us-ascii?Q?AQNFKwwYtxPBPsTjnqbA8Hxyuy1yt8SjrxlKsGZdukEaMxVd8udtFM391bKc?=
 =?us-ascii?Q?HVyn2GzdqDzn9hLD2X+GBipoifIgRj3ZOBGu3x247/hIua79WRUdmynRLkyT?=
 =?us-ascii?Q?iS4Idu4aeu0PDTS3ucVm57M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dai3O1bwEIRudSauvYxAmnZk9Vu3oZ8R7xwpcHLLHxcfOhPw51s7+esTO2uC?=
 =?us-ascii?Q?ZYzBU7GVQGwTL30tXhdQ3/2NKsy9fLfMJ1pCHL1r6xp95Q/7W1W63E4Z1JuL?=
 =?us-ascii?Q?xKV4LtANTOyWMo8liTLV5q2egb2yvkD9hAaOYCuCMFhV3R155Ey9+NPq6jJB?=
 =?us-ascii?Q?vxBWhLYuTNWwLwnpuoytwxat6fotLYPA9ZMQqH0ZKjQpl26gEXF+hEYlsz64?=
 =?us-ascii?Q?CvBW2yBx7pUxZZ4w/yUQSDg99+3wATKzFZX6B7RWNyx/zb1MMB/rLiDT2b09?=
 =?us-ascii?Q?4NE9ol0O9j8517obV2uub+LCJEaM9sPeISmJBtSZd5NNzGij/+lDKbQ5Oes0?=
 =?us-ascii?Q?OeJbD8sRNnp+QOCqitLnQB8p9m2UjkI4pS85ZFD5xdGpfMqWEgu6asHanZ1S?=
 =?us-ascii?Q?OSIZ/45lwjp3EqrMw6x3LgO0k2JU0v19YiEzaO8dJPOJ7/toyzBEfeOxaWUV?=
 =?us-ascii?Q?BU0dNCycPXhBNdFh0/DUwnMeC7jfeEJZx86W9TryHSXexBLfPjAShaSuKav9?=
 =?us-ascii?Q?RfK3l6tu1lHua5tG21qUmG3zKPR7zSTV/Gqu8N7DDgRkz5je5mXwhktbgjoE?=
 =?us-ascii?Q?IKclDJRAEuaSH/dB3+WNPLAHxiv3HQHNkM/16SEvNeLBaaqNzZ5SZWgjQAqp?=
 =?us-ascii?Q?/eSI9hxyOuZXS2gAdFMJpJhOkcEAHuiw907oWm4UVqZ7jhQ5gMW3fc0cIHrI?=
 =?us-ascii?Q?gn4sZMV3TONCT3Eabmh7qE9OUUKdSMG8LmjGati1crXiOX79QCJXwEVCA7Rx?=
 =?us-ascii?Q?v+aqwWLK+qduJfMYyWnU8j/IOx434euTjVR+hBt8vszDGBQ8QAAM7egaSF7H?=
 =?us-ascii?Q?9SmGze3wwYTArppUIWZEQ3B2s8mvNeO3a1DVn0GfOpcnotW8guycq8SP5ITf?=
 =?us-ascii?Q?jC7p/VSqduHAvKI0v+Ny9+ODBe70Ra/GBbLVDp9BSnJjyouO2XDgKiC9Dh05?=
 =?us-ascii?Q?Ocv82hLmSOnl2UFHt9YgFsbvib4VBcqQQ3dCDadxhpci1Bhq8s5P7zohhb0a?=
 =?us-ascii?Q?QWZiSqTYizcHlTTEyMyNg9+z9nQEE49AgBG4EaulQotvEDAvfRGEjrY3KfBa?=
 =?us-ascii?Q?pugkVpD4RxZH7noccaJx5ORVyqZbVkTPxd8kj6pQBHrKSIk5BAqRl7CvPg3w?=
 =?us-ascii?Q?1NBCBZjuuShutA8oa0hvwVWXQKmum1mn5WUcwtjopB7HTBJk0bbalc7Yr9Kw?=
 =?us-ascii?Q?DCIjtZeJC/f0i5sm7+d1A9k6DD1kfjHhDEWTBm0efhJcYqoZd7dJscpDBdwA?=
 =?us-ascii?Q?8kCRPcraR/Z9TkuoWmCnSNnGQawdTQm/zd/bQXBLfjYCqPsxroIjLZBBxz3Q?=
 =?us-ascii?Q?XSw1ZIcjrRzmlAkK3EtaD6QHBQ6lyaD5pNASdyCk2mMp7F8b/FYr9MT185W4?=
 =?us-ascii?Q?1MJhkrRqo+MaiwijY14qSkY3O2kH10SKnOSLmWIY1sPsgHkSSungDX9zbd/J?=
 =?us-ascii?Q?jPUoZ4tRg9TODwAzPCPrfuvGni5Fd0FPP378VGKx/BqZ61IfO8/a95204tCf?=
 =?us-ascii?Q?UY7bJh89SdEngb3VNsRrx+lNOb0WlJV7ymlmRKKcBNKUfRmIH3PzC1jpWuAg?=
 =?us-ascii?Q?Cp3GiIxfm2v+LmAkf9PzONjFLcgqy7UbZ6mLKX6qs5SUBDZWT0RFP+Miwon8?=
 =?us-ascii?Q?q2Ih9mfetM0xTWHhhMXtocmbCuiOwYFBlt4SCjVIK9Mvn9dzfpvrYj1TwH/U?=
 =?us-ascii?Q?fDxGl1Usg1IXh9zDtFKU0S8dzT+qLGtJGg9yHPt7WSHnoCG9rboqfOfpSSln?=
 =?us-ascii?Q?Pce+uvB0Rg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530cf115-f716-4627-ba05-08de583f9ac8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:18:53.8585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFp8KJ/Fpx6+1VGy6rXrHkZwR92OQJZ8oSrydHfIfIweDVC6ra9Y+Vd4TzrQlj2GT1+5frRyZ3jMABXiw6a4/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8727

On Tue, Jan 20, 2026 at 07:03:28AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
> the SM coprocessor. Thus, the programming model needs no handle to the
> GPR node. Make it optional.

"programming model" look like software configuration.

Thus, GPR is transparent to software and does not need to be described in the
device tree. Make it optional.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
> index 1415247c92c8..bcc265a742c7 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
> @@ -63,6 +63,16 @@ required:
>
>  allOf:
>    - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx6sx-mqs
> +              - fsl,imx93-mqs
> +    then:
> +      required:
> +        - gpr
>    - if:
>        properties:
>          compatible:
> @@ -91,8 +101,6 @@ allOf:
>          clock-names:
>            items:
>              - const: mclk
> -      required:
> -        - gpr
>
>  unevaluatedProperties: false
>
> --
> 2.43.0
>
