Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE2F324B2D
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 18:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769537436; cv=fail; b=nvfd/NlzdXjSJ/LQlPoqHscm0HgGSzbV0yqsT4QfsVQolZnHo6qiV6utHoPiIr7qAuYmPyDs4IdVlT6T4UiSX7q5BM6e1lI4VDmqQK6Tu5x2/5RiZf0P5n4mAQ1BLs34TzIbFefOLSSO4mqukL9TRYBeJiXe4AKE+K0Ej4ZSpPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769537436; c=relaxed/simple;
	bh=b6wZJKy0jQFwslRkvp9vupk9/Pgpko1vAzYVeFa89vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bnkhCIewDvhgGx7wFsdXi8uKU8cfN9lC8+zb7phEVS8iIt5Xa5rW+zf9Qk1IvZCQA9FY74JJdh2Wn+IzHcBFu1cWHf3BMILXP5UIUCifWMmDnLR9+J5IxRsvTZsQeizq1UBOyp0r6eJyAN4UpnzZUN7t7PrEtyT/CPehkA/18tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jZU5g7Jb; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jZU5g7Jb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRTBp8d5hQPmkdv1Ex2wiavnDOMvFQcc5QmN59++miPQD5s+RIcWDcr4WugDTRnjS2JuHDrjk6Yej1zM6IbrcQ613rmB3/JA4x7hjk8Vp9sW0IerKONAS+EZ+jIuvMry000wfRi+lNYGOaZQ+a6sOyygdTYQhEYd26mHrFI1UJ5SKtHsxcRotQbZFEccqjkygzw6S3xmNk+3i8RcLxyAaK2mW6AO3Gn93xCStRjYiGgTcLsItraoAGdYbpd15d8FQgfqoRHX9szzOSDGQo0qVPW4x1nMxvkt30s7TG5XvvOSsUNFdEm8N/DOgOUjiSvYGKT+/jDV3XDKF8/m0bG19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dr8E+M8sAjmyTfdG4+hSzR/i83JbkJYXQPespjPZ3JQ=;
 b=glk3PgGPNJ5EyLqE+HJW5QrXTLkFX6kqDvWlGxGEqys8Rsp3P6vjJu5dXo/Q1zv9ydVEdK/EFhuhDs2jDIN3GR3mj70OcVDokqmxU3wV82wld0JLVdrT3/6p49RmG/q1R35NIZP2KRv0vZf0xj5zFaHyVf8AJrKXMNKV4xt2xMpmNLkBvSf5IqqZOynstrdv3/NswhAGOTbGVfHCwzlVnlrbSlxKyMLrVIykZlREDDXoAenCFgIk719MPSITsr3qyVAeCpX5MN4hsyaUywS3SZ+9GbtoZUnPPoMZCFizybUjWsstQkswBKCweYwql4YdysSsDQdetQOFMxV+uu68Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr8E+M8sAjmyTfdG4+hSzR/i83JbkJYXQPespjPZ3JQ=;
 b=jZU5g7JbI57qfQO36f7XsY80DGqcglit2oodXT4lIHEInI0XRXOitp2CNE1uHdu+1xPH+TakfenIsmr2T6ZY4QO+3jPmYNgSgi21jkD7sFxr2/ROYVFyXcHtpdDF0ZnXrcFvP/YXQPGGC52on+sXOGteSqzvQEs2xhIKQNjHHEgOUhEN+p1LwTdVJdTmcFhz1pMWM5HPp3X9G++2fxt/n6vFkO8LoGNZdEAqo7jjNB0KXgeL6w2qjI5PZseYvxl9fTZbZ85JRLnVDdQz3yAg7MbQAJ1Moyx42xNcC0Q7xYFEt4ct/G6EaIC3FUkbi1/HKKYp/deuOhV8I4Wsa6hbZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10402.eurprd04.prod.outlook.com (2603:10a6:10:55b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 18:10:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Tue, 27 Jan 2026
 18:10:31 +0000
Date: Tue, 27 Jan 2026 13:10:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2] dt-bindings: firmware: fsl,scu: Mark multi-channel MU
 layouts as deprecated
Message-ID: <aXj/j2OQ3DcRCOu1@lizhi-Precision-Tower-5810>
References: <20260127-scu-v2-1-03f3aaa56e1b@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-scu-v2-1-03f3aaa56e1b@nxp.com>
X-ClientProxiedBy: PH8PR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:510:2da::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10402:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c09cc8d-f2f3-4595-2212-08de5dcf5bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|19092799006|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3pd/hsWMIqY6UGyeKufXW/JKDhtu9sCSMgkRShtQGBtLxqLEv8cUifaBdQs3?=
 =?us-ascii?Q?G4BosCqtDfT7ujjQw5Ie+5BSWkS0FW3ojwyZ7efVp9C3tgSGtDRPjuLAVXVC?=
 =?us-ascii?Q?8iaE7FgofTvZ5HGNiF47cY3LZL+59mNnKh2k5uuDrUFuQl6adeTVC9fCaVfn?=
 =?us-ascii?Q?/GwGODrwwoF7WDtQUJC0Aw0DWH3nLBo4AeGfURj7YTQ+cz9lV0GqC0wcHQ7c?=
 =?us-ascii?Q?mxx+EefzrWTGMHVH3AxG+G6O5o86/ydj/jucbAoLSAj4DQAlR/+w/+zSrPLz?=
 =?us-ascii?Q?/hQM9kd9mrV3FQwXch9/0HMsUjDdUbCRecL5CJjjgzXGokf4cQzlxGK0rYfH?=
 =?us-ascii?Q?7sfmBj1UtQGVxNzoJdZe2JAjCq5n4NXJiJqjXBTlYDb94Y1c9vYHLxiaD53T?=
 =?us-ascii?Q?xHlkrnieG9HhO1LDXOzX2PC8ZnZ9TgT5Qy212mZBLhN3aGxxWYaR0e0wZnhx?=
 =?us-ascii?Q?WNEhiok32KlMEl/pt7mQFAJrFbHvR+C7j4KnN1r25p4crzzqoZh1XGEMmaiA?=
 =?us-ascii?Q?10ozmPd4MzUWMXlogkHgk741YS9TZ58mHJ6dJmWIIUFD0vU964UnxnuAIa9t?=
 =?us-ascii?Q?KwKfGbsC7KE2TNRHgCczuJ5J3+Gfw/INRgzD6rLmIFrSffKGNdlbjFdOmAmo?=
 =?us-ascii?Q?2gd2oWvC5prsB78ChsiwjNRsrXhUm2iDRdyAqtEZi+EQ988EEIlXJjLsbs2+?=
 =?us-ascii?Q?D+6YW5k7axmLcuA6xE8DIZfU7lSHbP/ofpws3YSXx564FtnrUxrJxI9N39vU?=
 =?us-ascii?Q?L3uZp+/d7FWe2pqprVSP/nWNbU6caBG0ktzMb6rStuTSTGHXl1t7pNevNlFy?=
 =?us-ascii?Q?RCnou/oAsH8u3xFpw72Pyjow7pP+ZlhldwRUEyuGVoFNlLgs46GGS2Ksnrx2?=
 =?us-ascii?Q?6AhZGJCZB9qyeDgw+CFsAhl+kBK5SJrRInbtQXeAatB83I/+lel4PpcgsZbK?=
 =?us-ascii?Q?XTKHxOxP9yGCmIPjPBOP/86w9rOwxl5530btRKNEIKEl0sAVivT2uTSmihDV?=
 =?us-ascii?Q?aNEvBPN4B4bxI2RcCxU9GF05pI0wvPquSWXCIgGtHkHPfA1nsrIUcxyesh30?=
 =?us-ascii?Q?LKZ0SE2Pc3urHSTZJIENANGPQP9da83yi5dRPdbCeMvuUp7McxIGSmWskxf3?=
 =?us-ascii?Q?1RC3xBEibnLcqgdjZFAhkoOrEl9HiWg6GMJ/VOze2AhhW8feMPNzu/+H4T4R?=
 =?us-ascii?Q?MR+Idu+ZoQx3ozuBSXMPqMdxseQOJWfnODB88BSOEqZw6bkH2mg2nnb3zBMm?=
 =?us-ascii?Q?IKtfiyb2MwUjQGvFHNQStHmBWrTBoKBTajQojHofO6cvWKpxRIDI/lULtUjg?=
 =?us-ascii?Q?Bv+0cVhIzR6PYs0QEpx3um7xAnwqF4Ci8AoMtqlMPC5BFeZLRPUUs5J+Ma6z?=
 =?us-ascii?Q?80APWrwUNq9SsiPVfXTKNCVDnRz9Cjw024jwi9fC8LFIOCK4e8y4WaxVgIBE?=
 =?us-ascii?Q?FBYScvZ05M0Y2GJULr5jYxYtveIJ+UBVuwkIGd1IiU9FVXQvK5FociYHNReV?=
 =?us-ascii?Q?HM4J/ykLpBCSxUA8lsazQjtbIhIvcZokUtyKPpoEvHvX6McEytTHZyoZpJqF?=
 =?us-ascii?Q?WUv1Pb1qaX+vTECNIQn8zw+YKsFMVj+BFGS1PZFo6pHFU7lrW2B9ObuoyG/f?=
 =?us-ascii?Q?eT8v4uIiPWVpQWDRghB42s8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(19092799006)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e0mQvQtyZxJ+qPsm00jajiFyGHVeqQaAM+j0boDxVZMk0gtwc5/rDTyl1W39?=
 =?us-ascii?Q?b8Js9gjGDfmWDQhbtmR2I5FOtcaGgRbWpH9uri+RTT5oYhQqbAfs+yeWvweX?=
 =?us-ascii?Q?zlInmqtz6TVvPvyLqDMp63C+VdTAnMfHcAEAGrM9Cv1MTaEPOfhfuNAmhU54?=
 =?us-ascii?Q?ehQp3YhsV4JkhKkRRCpNLwFh1UD+6WpI+EWng5T2Z9F28neT8Tnuze9FWoFu?=
 =?us-ascii?Q?ZisjBf6cFvJNYP/W3Z34ggIdihUfPvXnvg82Lb1sHBoTMmbv3KruihKxIENo?=
 =?us-ascii?Q?UKdsTZPjD9V9txmchxfWcwaaWTIVxMq53jZ81GLj9RHMZT74mh4/Itnxklmi?=
 =?us-ascii?Q?qDNJBoI75tRGV5AYE/ZlTjuC9vkdS/K92zhcnu+NcLKq4rZWrxjWc1iS7mlX?=
 =?us-ascii?Q?mF/SVkpUVLA4IiGKxNmYhVdTQSDzck0p1ws5OF2H0uKs+1XpCRRvhyYPtjkk?=
 =?us-ascii?Q?Yre1m1ORNfSOZc7z649gKi9tT4TdT/UBBt2KJ9hopafZwGamfx9YJ/M3NkHO?=
 =?us-ascii?Q?PorGhInqFxz5yRjaXiTuR9UTODFQDCzemfC8vKO5Zs6F25ucQCHevNRW+OaV?=
 =?us-ascii?Q?GK3KaCuRujKbGdi4CIxvCJyuhyjicue33AHZZaAWBxpe5USHXkkenwXKBs3w?=
 =?us-ascii?Q?73L2OLxSF1sfV9xgJz55NDrdv8S3z1PIepzpS2gdCXHkvn+JAmlxdgZc51fM?=
 =?us-ascii?Q?7hFq33IcrrlQcV3trXimPEHVFceu6OorJ4pkcXpAASeDdncdmEoCkssg8HF0?=
 =?us-ascii?Q?QYKpyfLXCxHgi3+4iUHLbKidB38WMuhxXM5Y++IEO81UkAS0rjgW4AzmhgVL?=
 =?us-ascii?Q?+q+l2C+WIjwMEzERund9SOjgBqj6tUixeJFgw1ex6/X6YLnWnMP0GFfPI3Fo?=
 =?us-ascii?Q?jzHYwwp1Z0xQsS1iPs1NgBwKvY8MjhljATbRybBsN4RWw6E0ngaBgcJRzdFi?=
 =?us-ascii?Q?q9UPZkddufv+IV/CMyFL7MxvNTiXcOhdFru2iTWi2TxC7xHyux0pdEKXJxQN?=
 =?us-ascii?Q?o+DLx9w+g7ouj3eN9xeXnT5ou0EmHG14N1mlkbt6H2hdjmTjtnV7cp/8dTpJ?=
 =?us-ascii?Q?lZhWr+MC8YKmCBh1r3kyEPq/5jMizMPh0oc0Zgec3CUXrg6WatwZAQ4X4Nid?=
 =?us-ascii?Q?rbvaL90fyN+ztdwuWhq+VyUskTbUY6IHt/LudoMQq9Xi74twMpvK0+ksHunT?=
 =?us-ascii?Q?yJHVchFOOaEZeA54fnBTeFHO+V02CCqzEfJw4eE+wRxse36yBt8wCfz3iQt7?=
 =?us-ascii?Q?0BkA1CjeREAf1FD21dI8DnojXxMOVEugLUjdZrMhSzRDwlRvWeMOfa9ysQ6l?=
 =?us-ascii?Q?riFfNZBdhphJZ3kFYa+dtEamcBQdbSi5GgoHIojLNNifwL2T/4SXUyqUk3/k?=
 =?us-ascii?Q?sBPvERSjpC8ehQcXGLumrH94t6xOmSJ/+OE2/jBEs1KFbmHvujp4NqxYLhfP?=
 =?us-ascii?Q?6OLhOwyDsP+qmSkncXoSLT3deuaxpsQolJl+jTZPjqSqpX3nuTK14cFUmlz1?=
 =?us-ascii?Q?lJZM8fiA5rA/fMgMuFarGecUgJr6iAP35YLb3hmeNZzp8jeLh7m/C3boNjCO?=
 =?us-ascii?Q?Ox4vDxfxQpGbr0kD0e6PDcw95HmWE1Jh7nQTlKU3Ms3pXGknU/bWFrdiyuqS?=
 =?us-ascii?Q?dO0GGYcjJrZevng0mjGwTLt98HU+vYLXT+hOLoS80stfqKM6OMmf2frgA1Qv?=
 =?us-ascii?Q?4e4Kfdh967FrniPNdNenMOKzD1ADAO9iu4Dkwvk4NOaMNbPF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c09cc8d-f2f3-4595-2212-08de5dcf5bbe
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 18:10:31.3478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0SJAduQO06JyiiQIu6A8gU8/rigja/a2NHTDk96LrDKpldnM72FrbawpiJwrOoYOee9Ta6wXoJIEXi1CqmyIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10402

On Tue, Jan 27, 2026 at 07:06:00AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> The SCU MU driver has already supported the simple and efficient single-TX
> and single-RX channel layout since 2021. The older multi-channel MU
> configurations (tx0..tx3 and rx0..rx3) are less efficient in practice and
> not needed.
>
> Mark these legacy mbox-names and mboxes tuple layouts as deprecated in the
> binding schema. The driver continues to support them for backward
> compatibility in case firmware publishes the legacy properties.
>
> The example section is updated accordingly to demonstrate the recommended
> layout.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Changes in v2:
> - A minor grammer update in commit log
> - Link to v1: https://lore.kernel.org/r/20260126-scu-v1-1-b9d31da12860@nxp.com
> ---
>  .../devicetree/bindings/firmware/fsl,scu.yaml        | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> index f9ba18f06369215691c69cdc1538b53dfd369f37..307f1c6278532ace94db92e6e8b68312eb4c8a4f 100644
> --- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> +++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> @@ -76,7 +76,8 @@ properties:
>            - description: TX0 MU channel
>            - description: RX0 MU channel
>            - description: optional MU channel for general interrupt
> -      - items:
> +      - deprecated: true
> +        items:
>            - description: TX0 MU channel
>            - description: TX1 MU channel
>            - description: TX2 MU channel
> @@ -85,7 +86,8 @@ properties:
>            - description: RX1 MU channel
>            - description: RX2 MU channel
>            - description: RX3 MU channel
> -      - items:
> +      - deprecated: true
> +        items:
>            - description: TX0 MU channel
>            - description: TX1 MU channel
>            - description: TX2 MU channel
> @@ -105,7 +107,8 @@ properties:
>            - const: tx0
>            - const: rx0
>            - const: gip3
> -      - items:
> +      - deprecated: true
> +        items:
>            - const: tx0
>            - const: tx1
>            - const: tx2
> @@ -114,7 +117,8 @@ properties:
>            - const: rx1
>            - const: rx2
>            - const: rx3
> -      - items:
> +      - deprecated: true
> +        items:
>            - const: tx0
>            - const: tx1
>            - const: tx2
> @@ -167,11 +171,9 @@ examples:
>      firmware {
>          system-controller {
>              compatible = "fsl,imx-scu";
> -            mbox-names = "tx0", "tx1", "tx2", "tx3",
> -                         "rx0", "rx1", "rx2", "rx3",
> -                         "gip3";
> -            mboxes = <&lsio_mu1 0 0 &lsio_mu1 0 1 &lsio_mu1 0 2 &lsio_mu1 0 3
> -                      &lsio_mu1 1 0 &lsio_mu1 1 1 &lsio_mu1 1 2 &lsio_mu1 1 3
> +            mbox-names = "tx0", "rx0", "gip3";
> +            mboxes = <&lsio_mu1 0 0
> +                      &lsio_mu1 1 0
>                        &lsio_mu1 3 3>;
>
>              clock-controller {
>
> ---
> base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
> change-id: 20260126-scu-c93d45e319f2
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
