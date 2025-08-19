Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F75B241664
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755617871; cv=fail; b=YWFUfNLV02Bc0kieg7h1ot9Jmjwg6avlIJJev5baSUp0voWQpBD99rxGkCFVBkQwDkMl5kgcK8rwfdawbZyu1gq4F8YNbwJJE6p29EsSOJOOY86XLZGZki1zvck439gIUTT2KJh6s4W9A/G0yOK3lYTY8T0CpchsrsMKSpC3is8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755617871; c=relaxed/simple;
	bh=QMFh83JHBmMWwc5etj/yEbUylewr9T95XW650e6FfNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EQxM7y0KjGIf45JgRgrS9JnliheQYZN8ek2PVs/Y2YPwxOHfErnUkrdw7R5ZT8tyseLAH+HKZ9Nbf8KiHQ8J6JIQgseFbw1D0k1acKu6p5nOQ3Nd+8NkvrBGeR1C9RiWB7CIN3EoBZyCN3eZFCZuVGf/J8RIn5EfxZxdJhqPYzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N764qdIC; arc=fail smtp.client-ip=40.107.159.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N764qdIC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzPSWHDg5vroac10i34Y767W57k7t2HNB23EDuSK8aobsWBCy/I7TizGatOWcfboqKIObOoeLdtpdwGPw3wGWepK/TL/VQorj8PYuE9IQYhzMF8i4BUsacX5zW8GQCmnS3BLGWlKgc6VCvOyCNBg0OYvgnIkGnBkrcrXBPjZFOq8+sz5MDhm33l9ovQc8ALe2icQGp4A7HAtM1Z9Vz4ErI4PPO+mw42j/vMiM7+fpCmd+ntboGVN12oQSQrRU6jZz1nIi5dYtNr6DfkvEAzCc6pDVvOOcKkgH5HuH6Dp+4JpNz+CoLLLDK62n4JuHMpM084HkbdHZ98Z7Ti5hUkdSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5+2OlBHTDLkCqHHXf5k5K/V9UncWL+it5fDO8S2MFQ=;
 b=zEwyepJjFhpSWEh63KiqR2egMFf0zBYzpeMQCV0tFWclybKFJaXpOjT/d9lqlDfaGAJhOQz6G5WPj5OnZ1frzKXl8TOi7pRpT86k9LJExrXBRdcFp8adT25hO/nHvHm9wewnKX0gMW6fZOhT/YQkImbkbr67k1KFHi58CGEm/9mgqknqfeDTyyLimhoV77fQeWDh/sGUMloKQNpBTtOkpvBzQMhqQrZNKWuF5uGT0UhBAG7OSboiSYikRzUszItSxkDgh6Ou201f8/OWzRcUNr2wvNJUK92NOBQKQ5x0Vb/dneY0D9RV2C9UD4tuDLQv1FVUkoYE4c8XRucEAUzcEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5+2OlBHTDLkCqHHXf5k5K/V9UncWL+it5fDO8S2MFQ=;
 b=N764qdICr/bE+8m3VlxW9SlysD8m4I2a7PTnhMdyvJeu8vNivSmw7J0sLXiwXRDldPtxLR+FQjt8htXGc9ugSNtoVM2yNI5lWu8eswyK9PsKXmGQfI2n3rzgkGoMy2U+i7PWImLn+JUt9b94zOcs6JPs0PEg41TLqit35qXkaczFsQVjTTSiMc7q6leJdjikjHFHSfuxC+cyszEL8j6Ga0tTKUHTIU5wGjatcFaySaP9hSKWmPE7oQRrtyJtc/jEXjUGW9zQGc3tLat3AHWVjGg3jYYECm3sNUMscZOHhLr9SllxfqU2VYGCx/8Rf28E5aJ762/QLm7YbBH+Y0Yuww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB9069.eurprd04.prod.outlook.com (2603:10a6:150:20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 15:37:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 15:37:43 +0000
Date: Tue, 19 Aug 2025 11:37:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: w1: imx: Add an entry for the interrupts
 property
Message-ID: <aKSaQOx/USdn6FGm@lizhi-Precision-Tower-5810>
References: <20250819121344.2765940-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819121344.2765940-1-festevam@gmail.com>
X-ClientProxiedBy: PH7P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB9069:EE_
X-MS-Office365-Filtering-Correlation-Id: 2373513a-b365-4c27-3747-08dddf365682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5XLyG0MPwJsxmlK6zuJrSVZivA6Pzzv5d2lwvv7+JDaDQkdqYnpEyI8PAYL1?=
 =?us-ascii?Q?XNNzsmUju4/NrZePt+D1rqb+MGvq9cXmy1vb2FwGh7cTvlH94uvfqGmwagtj?=
 =?us-ascii?Q?EqclArfYHNX9d3BgKyCD+nLRfUK8b1FXR5t+oFLAMD0zqo3LcH/+V9q1W/lE?=
 =?us-ascii?Q?59kwRSpIxwn77Ugm/FwZdSwQ3hHEKdjGcMCPnHpBWlyJMFA8WCE1ucb1Qh1y?=
 =?us-ascii?Q?Ea9T1PA9XTNcbbETMWgGmhvmiGmbpOjSX6u9Lv9keOxkYYXuERiWPMqpBl13?=
 =?us-ascii?Q?BpuQmZlh2beHMh9VdEZnr5cNt4Xy3EC6sxMGHHEyA3YTYTD30cBPMMi/ub9q?=
 =?us-ascii?Q?Qfqta2elJbVQba7tduqCFwlTVv/ADzIbBH4Do63cwK35c/VWq/4UBTDkpg5K?=
 =?us-ascii?Q?0udXuKNIsKcUjOPFk1Zn+sPKvxYJvepzZRhSy1UOC8fxjHhdYKY1Fq3SsAlA?=
 =?us-ascii?Q?7oCfeBlbL9R3ZF7NekHxUxXfZJzTpqErXUFBpnzTSU2Hy/anx2BNTC7qas18?=
 =?us-ascii?Q?LMwyJ+h1+UQwUzfOawTWz/ibDZCqNB+9MYkMot+hJ0xGGTdxp2zSBkKjVsM1?=
 =?us-ascii?Q?vYc8uYsjPx3imA1m5z+8nRVn7Ub2hkUJ3iHUWEEbXGhnXapwQ6W9ylO4CHtb?=
 =?us-ascii?Q?nNmbTCT0BoljM9tH6PBNze68pvAIOojMY31ChaxWz4N8AsUnFURLI0OnL6ix?=
 =?us-ascii?Q?bNBogMYHdLroCsUhzVEmSXLBZrQQa6MrQ+2ixGCABt8VKEbbq5jmUs5gx5co?=
 =?us-ascii?Q?oJ+f6cnJkLRIQdEgukMHvBQD90IWAq1+oJdchV0GDf/2CW4SoQsQnNGVdrZ4?=
 =?us-ascii?Q?uPm1YmrNErciW5GQCY1cA5VnyAQMXqDqexWtz/b5HBn2etMwowB7VVePbMDm?=
 =?us-ascii?Q?BsJuqnrl5t3B5Uuq0osS/p5yYumkqVof8L4YZ8yM1Y+Flg+BxiV15bw5a1DV?=
 =?us-ascii?Q?7u1J2vUkHk881OImCA/2elamyQuURvKKLjwFD28aXbFsPaiMjNrazGa4Q5vd?=
 =?us-ascii?Q?JYwjz1HorTY31TG+GObSlitxAnjSsB/uJVvdxiV6l5KlN+9kIEcUcW/tCmpL?=
 =?us-ascii?Q?SeKAL2bCLxXwfUTg1+walNkU8AMi5Hk4FJw7qsKAwf/3AEj1yfbCijMkvQVK?=
 =?us-ascii?Q?30YmAq5jAxI1Hd87hs7LGfnd8NKUVlSAfaYY208DhDHmaxEhgWC6sF3mVByF?=
 =?us-ascii?Q?xvC0UGWxYyLOAOcP+CQbH5Sb3w/Qj54tnc7RBkjuoPl6GSvQDICpGmWu4ljT?=
 =?us-ascii?Q?oe9WVi4v4eBU85VUdWqkhYUhPgSc89HvkhoJPiD/Ts6PGnxPQ+5J46DvWjll?=
 =?us-ascii?Q?2lx1sBG3FwzMiHAEnrYxpxFS5E7Som0uZ6Y8tUtCJ6fVTocMDVqm41Ubvj3S?=
 =?us-ascii?Q?csbnRVzb/RGbe4AmMc9MlnMOZ1zEFzSXVwUkDBIyd/fk8YKw5/yvTg8nU674?=
 =?us-ascii?Q?jVn2c78F2e9Cg+4eiNKJds0WZtqvPTkSfp4w6nyGXHtsLv3iUvJVjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eU8HWd6LcqU4mnJfF6BswOI9JLiw/VPWIeYTfS4iiy4SiBDIU51UdZN3oyFg?=
 =?us-ascii?Q?vtcp9Dyf/kRE2Tp2H6kw6UQqx0b8cprxWmdTlxAEkBq70ixPeDjzIbaoYsRG?=
 =?us-ascii?Q?FtwOb5lEn1YMM4oDyosw6Lt+O9LNzV2jeY+XBBp33QStrrgXT5RBw/yaN5qD?=
 =?us-ascii?Q?SRJS/HRgScDBxmXxtDqm+I1IwIwoAuzXijm/RTonv1Es4SK+kxLeUpcMaz4+?=
 =?us-ascii?Q?XI2vC/NruU1BgJlvflmhDK0Bl3DFJsxtOVsh2DGoJZd1ttecHbvEp7+CPUBk?=
 =?us-ascii?Q?Ar9HQ2l8Toy9MF2jbqN3pI71OKvXq+0uEop84TAUFqW9PdxHRBXa7h/gpNoc?=
 =?us-ascii?Q?QmFt7bUXR2pk2YVvfHDR5nymDW98cwM3G6vCMwL6tMJr+zfj39S+dfN7ALZb?=
 =?us-ascii?Q?EidkZ2YH8dr2UbWRaC9nGiymHwcz7f+lPZwFG0AzWYlhelfpAA1YqDQeqQAC?=
 =?us-ascii?Q?q9DE0gQFCBYIzNQ2/Xhl2kKUYtw1LKuggLLBsV2Th7Wq7AqKEEw3gxKxKtMw?=
 =?us-ascii?Q?j+1RF4guJoK0V+9wv6+mjOdH2wya/vp7M6nbf4Qn9m/zFiSKQZxTT3WmrxcU?=
 =?us-ascii?Q?M15/EGhETRBMtUDLQh7bRymQx61eLJaVtl9qNZPGXOCZmRsGsgfoHNkxO9Gl?=
 =?us-ascii?Q?X1BwDHyYuXzczsw+KWxjFQwpT51La/vbQFgb0Fmu1hMC7S9BwEBtuLDwttpO?=
 =?us-ascii?Q?Uh1CkcTdHDnIQWuoPYkbwTcglC6nQq5HWDQZk9o/oHLoYuiPF2A4NV5WdChJ?=
 =?us-ascii?Q?xCOU+lcp6/p7+XzMh04yZxWTJupM2BwKsvAaTxLMtPYOZ5WFLvFhnfZlDnQQ?=
 =?us-ascii?Q?wz69wrAtTh6Ce49jGKLyRDCeKB5dutVb0SGUNauGaoJuUmrMYPeL6t+C37au?=
 =?us-ascii?Q?pIIjeorduIpNj3v+MGe0nubssKXy2xOo7PAo4tT0Np6RHcm+YD+2LCo5zv4l?=
 =?us-ascii?Q?37nj3MDiEqS4zJs1o/FVFhR6wkS0itksGppANGtMN4I0r6EtK7v/3n/NLPGu?=
 =?us-ascii?Q?4ZwisEjefBkMLzG9CBLyizplgdF38LM6PUTGKaL+TG2ImYf0FU6Dp0Wu4JGh?=
 =?us-ascii?Q?Ky3z/RwZJMJMmpL3Xa+43To7iaN5HknNaTgciPsMGknvkOoUYHjErH11oyA/?=
 =?us-ascii?Q?xycaS15DQaYxUdmFB9o/wx0kG1btvuQ4ShEAZ9CrdxCVq4Gsym1EAmMzKZxj?=
 =?us-ascii?Q?5fTPa/RtlszjQZ6eJ3d3VmaZhmxhRWGRYdPhASCAPI19xkCS27+T06UCLmy/?=
 =?us-ascii?Q?/zlCkXojfYHvzfw/hwmvprDsApItUuv04u4HKS+TkhMXdmaKpw8tPSgj4gWH?=
 =?us-ascii?Q?E7phYandOZ1BaYFGh70dE/qA8Q/Z+ACiNHJkDxrmcCRDGrQ4EHYY/s/qnm6B?=
 =?us-ascii?Q?du6ZQxkPAculDuU63biLYynBBTvBdDeYRF/Bn5t9zKhsVyXNQxg0u51iROPp?=
 =?us-ascii?Q?gaIBaik7EoSmJEyzF+SPwkAQqykzQkqfkYja9BQc8V4g05z+7fIjRsyTlbni?=
 =?us-ascii?Q?qTo8kSOfdCAGbhn69uV2WS/MLKf62JPNtfvPfaUowIZny6yjXA/+rgBdyUVr?=
 =?us-ascii?Q?Sln4jV2LVP2IKgXpARd/2SAywRQxNqvk5wzrghCc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2373513a-b365-4c27-3747-08dddf365682
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 15:37:43.0878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2PSyqzTwHh7wL3EmrZ2VXe8CTegFETRvFzjIZAN90K8CmOt4Ye5pVMaV4PO1Bb4bJlbdJYyIiWslwtU2bpoqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9069

On Tue, Aug 19, 2025 at 09:13:44AM -0300, Fabio Estevam wrote:
> There is an interrupt line connected to the one-wire block on
> the i.MX51 and i.MX53.
>
> Add an entry for the interrupt property to avoid the following dt-schema
> warning:
>
> 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml b/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml
> index 55adea827c34..2c1bbc0eb05a 100644
> --- a/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml
> +++ b/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml
> @@ -24,6 +24,9 @@ properties:
>    reg:
>      maxItems: 1
>
> +  interrupts:
> +    maxItems: 1
> +
>    clocks:
>      maxItems: 1
>
> @@ -40,5 +43,6 @@ examples:
>      owire@63fa4000 {
>          compatible = "fsl,imx53-owire", "fsl,imx21-owire";
>          reg = <0x63fa4000 0x4000>;
> +        interrupts = <88>;
>          clocks = <&clks IMX5_CLK_OWIRE_GATE>;
>      };
> --
> 2.34.1
>
