Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A642F12DB
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434171; cv=fail; b=JUdfKiV2Ub4M0A2ksg47dYB76mjSSbny4kWJiC50/ErL+mUaHK9JYz/PoOe8/vCR6q+EALnPzhHqFUARassM5mkg+xjkYOdSul50Bw4kKplmGgU0AeLJJk8ONyznnJhRZZqAwpLZB6ACvugHtUuGQf9szyz7R+d301evLxdRTyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434171; c=relaxed/simple;
	bh=IVnTNUmflmdG9S9l3blzcxijZvQrnR+rvpiV78zs6qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o2jtV9D79os8nudN024fXgSELcqYl2uIVVz+21v+IRi+e0AT2t1HooAv8YMk22DiIXQXljT55HnDTTAmxaELTTTmOogfF02dD2AiYDZJgTKp/IALP7DgJIuwXlLjQOxktlWNnTYb1JM1YnBoPLd/PUtQSGnCWUQ39dSN9ydBq4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RU+0bNfE; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RU+0bNfE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQR2O9DD57EY+c74TkrKRacpnvDZ9iGLqOwhGnhUkM6k/15iuOqgeoVEqpd7GKLHlVxx/qiVz/lCZQU+BLbkBjDmkrmlo440DV8PV9qNRWRkcnMfFAc8qdBe5aila0G6HrsMIwhtBHN368qJVOqiDg6NyWl3mll1EeiXywHDUrWxIlhvXJBfO7YIxGBOa5ZYlgx8gESnQjJYwD92J7XWgFVJN0rlSe8Di+y1ndVSLVOEhI7l2qmsgzWnOZwJ/N+YbA7Ec5U/oV/ubJzdEWopePrW6zj8xUCW9vOCVrFRzZaAicGT7pOhfsWBc9LRgVfYpW52bjRMvgqEgUY6mtlH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hFyLMJzY7Zt4YgKFkKy2w5qx5OfXLweQAQFGEcQkvM=;
 b=sguL3phec5hgJgpVPZK++EaI/Nl4FIN1q9dNbC5zdOSs27/10KwBfr6l6qQkGbI9KIMRam+NqFI8JJbOjxgFcyUtq2waEkTQSiHZvXVQMI0CuK1HcSXGqo32wN3n+slDp/5kb4pHkpf8GmrxeFcDcZMkPiwhLff6s2Zenf2+teUFRBuZZV154LIUjJDj/30hJhueC48S650UAwA2WDT3mqM+ibwaUdOg99Ozi1iwg1buc2s+x7Az5c1f8jvCtOEPw8rivVVo0Mz4CHtTluNsXwFb+S4zn3qTIS6gBA1DpaSxF09avYSWN/OJkNPH1Hbla9ofGQacfQUXSjp9CBEo3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hFyLMJzY7Zt4YgKFkKy2w5qx5OfXLweQAQFGEcQkvM=;
 b=RU+0bNfEjU588RADGsr+GtcVYAsgiOGBRScon+1+PiyLqkz8lSWePNd6w41k2a0Q/olsjX+E1rot8u7E5cpQ9ArcAnd6PIh61Y3iBsAuFsrqO5oNT1CjZpEpAmr8O0uF+QGDdNNJ2S2o4plNm1ZqEJfOUhHGA9ytm8ka1qPXGPpFUlSmWvql1FXhI4wMosvpTCzen+TmfvW3v56gAU4VK7m9vv1c9GYHbmMXiv/rSx0zRg/PHaveZel/iPc8bOxbPHpGT+s9lxK6ICLGh1GSXdwoVkCgfMpzqh2FrMWvEdLPtazZAcvTKRHJt7fISmlElJcgFdGFXdJ6kfTm6f00/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7969.eurprd04.prod.outlook.com (2603:10a6:20b:24c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 17:02:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 17:02:48 +0000
Date: Wed, 18 Feb 2026 12:02:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in
 DL devicetree
Message-ID: <aZXwr3a7E9CnQrAs@lizhi-Precision-Tower-5810>
References: <20260218132519.74570-1-frieder@fris.de>
 <20260218132519.74570-5-frieder@fris.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218132519.74570-5-frieder@fris.de>
X-ClientProxiedBy: BYAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::41) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e53baa2-72a5-4f24-ea45-08de6f0f8ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0qR1FHpgnjA6AMZDBsXUCAFUNm4oVEKnP+fcHxgdxx8JVEJ6v0O9Y8hRsf+f?=
 =?us-ascii?Q?JBfiAbKFXbH379wo+kBkCiR8UvU634vVVP2apS2MmlRgtGiVmLKv9kf51vB0?=
 =?us-ascii?Q?QJ2MM0/TJmqxqILFPiCGgsBPzqaoE9k0r/S/E6bG0GcVCPgivBKjzkJSSipx?=
 =?us-ascii?Q?QjX7effZb/U1yi+N4PFJYPFHAGyL3piOwII2WPwefykAwCFHTlcxH5+JhvJC?=
 =?us-ascii?Q?sDXHEIbxA2vEUTAW11OA6nbcwGn6mpJ0Fb3mBQwfdDrvpjCNRL8krXKjqGiw?=
 =?us-ascii?Q?Y2/eo/BrkjWQiaDzTkjngh7knHJ8EYnVhOtEc/Vvok1LTbf4zUKUuiWa9c1C?=
 =?us-ascii?Q?c0pB9dAJH+MzcupgeryCS20Y6DgIq8LT6/pIwqthNehZ/Y+QYMfV3xp07Eon?=
 =?us-ascii?Q?Xt4XKIj4mliY0u+g6e7sKev2UCqR7noRzRyXQQirPPvdG88Qxr7WsnB1LcOP?=
 =?us-ascii?Q?+5f1hi7qzWf3/huq9MiImsRyZrBeLsdhtxxn/w7q4Zfu9hB6I0PNiMXgNqzD?=
 =?us-ascii?Q?jn13XDVJeH0rHM3HQpQHs6jUI/sjAuxMXqdEDmISVEOWLzkWXW16tX66vw/G?=
 =?us-ascii?Q?VAPt1flsD7DiW/Ztgm+kk4TDnRWV3ujkp+0K2Vv81mBA3hc+1zs6Qwt0feHF?=
 =?us-ascii?Q?zWHxA+En8U6GwNm6wjSu9WuJj3CFULHKpAJ+1uPHGjjHIA68elZcqglcydks?=
 =?us-ascii?Q?JTEVFfsPe00fNlKzSS/qoNhFYpulJs4EONFsgt/HJPb6cZirICDa0190fsC1?=
 =?us-ascii?Q?Vuas90800gG4DVrIHDcKYalfVUQ7gZtaZP2Xo1CUXkZJ7PryeWMU/iAW36gy?=
 =?us-ascii?Q?9TCWehpsOIh01XsCQC0Zwg6BKukFuc0wydbYSEdHOeVMeJyT8nwuQK+vOMrw?=
 =?us-ascii?Q?NsU0PnIgTg5DKlrqONdZvd6DjRfdE3RqKqlkVzpKXcgHBjVivxPVwocCIlbK?=
 =?us-ascii?Q?cdT4cm15nBMyH7mxS17xHdr4mq92P+CQnJesANu6O67S5cml6jckZ50oVnvh?=
 =?us-ascii?Q?67iCMSFeWqmGfqFPK0CTHNZRFRKqrsMyORyeasCSMwvgae7NVqUZtVAMLAxZ?=
 =?us-ascii?Q?l2ALJSfhBCBRhQjIANbNR0qI6OoeAdrtqkgV0GGDxGYx2+xqcxgjz5fRfiEx?=
 =?us-ascii?Q?UhHwOfaBdaLhTIGLKjZ42SpaGD7G49D2KgxIGX5GnRZhhsnoeu0mXn4j5EmL?=
 =?us-ascii?Q?C4IvX3U9C2HSdKiS2TbBOT2dcEjTfdP4ZvGtQuwcJnA3jsF6Vpe9RdCxewpn?=
 =?us-ascii?Q?2Pyu5Xnns2ZF5GK1mrzpVSEUVB1SXTaEpe+xXlMn5L5/WAiTug6Z/y1NhbeF?=
 =?us-ascii?Q?SAlySPWoOFFcN9fEbhibwF22aP26uYwysR1BQEYJWwumXIvUzWfXVxvXvhp1?=
 =?us-ascii?Q?SdiWZ8SXUNBxYsjRW/MW6l27h03aT8bKW1QDZbd1a2HvGMamQ4sMiArbVP5e?=
 =?us-ascii?Q?AP4clvTeqYik0RllBZ+VkhfAdmNsENAzl5M2QNlNJ1YL/I3RiO9TfDFuh/+8?=
 =?us-ascii?Q?4lgX1HQDblnld/GElQuRG8cW+uOJ9KimuWu1iBmuA3ptteCbQi33yOuvBa1C?=
 =?us-ascii?Q?N4l9wNyTMwzgNLKId6Bu57l0CH5P8f8C9G7BZrXdgoRor4O7+tANPM3b614L?=
 =?us-ascii?Q?3L9deHkl7zaDmqAYcNd9k6E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9KtmjP6013Uc1iKVNFyV1OZciEHSRtNM/TmcFi4IgnII1Qg/l3PSh/XV+SC6?=
 =?us-ascii?Q?j4qTsIIxSof19V1fDRU4i69FBbQhkAJ9tU3uvfKgZ8ls2cRH9SnwpqM0phfL?=
 =?us-ascii?Q?dSDQ410hYzbswRvaXxeakoYWAryTdeKTSAM3K10e3vfd2NIrO7ACXyoJZCoA?=
 =?us-ascii?Q?iQ5AV4JcV1zhW+LpTD2U83Bv6l241mvCLoIrsDPik9MGXsKI5ZMkZ90MHdkh?=
 =?us-ascii?Q?FnQyfNA1k6iClVaUi+qXc6+xrc0ziGozxkv2yywi9Fk2v8/z9Ps/czVzpXSl?=
 =?us-ascii?Q?zdCzvfkJ/v10MEQw/q9Su176S50hO2Lre7xq0C8lLlpBtFTO1TJrcHd1PM4W?=
 =?us-ascii?Q?gaeEyT7N2oQIi6sJxrOCfeqvaUdtJvIfXwlaYvRYNB1ncJw8+at0GA6YuLoQ?=
 =?us-ascii?Q?hc3squPb3FawbXZdJQkTwWhDmRQSpERF+XBBYwGUMbRiDrV/yUqGhYZWbqiy?=
 =?us-ascii?Q?Jjlh0pEpdPONXkpQ+/WU94Xj+5muoeqXynddKLPTZE8fFrDejyxA7nsSC6OD?=
 =?us-ascii?Q?7AGWsDTVOMS3iZashcGLAW9lUZX/IqO9vhxMqtzYO0gZYE+WyBgTKxyen77O?=
 =?us-ascii?Q?aqV0bjxNMxrrHIGmHrZ8qAMfUBXOsxt96lOkntzMBhZQNsmOMcpS+qI8PiBW?=
 =?us-ascii?Q?PojZXhiCmsVu3dlztxHsmmI1AVn+eXYvRNSvSor/XeMaHtzQ/ExyKNe4jTyB?=
 =?us-ascii?Q?N4VTTzMiE5v9l9TGDMd2K+olLev6m23CKWC1Bz2T2Ck++iC6oJYh52BTSVel?=
 =?us-ascii?Q?zbm9SqjZR7FKKLgOJ7PMR+zfd5FZxCi8kEFM7h+zb/eBri+NcZp+PiUTxMtu?=
 =?us-ascii?Q?0cCbtC0EEwqIr9+IPq3pJBNS1StBb903FymJNxfi1ypvIeFiMUaUD1rsZbKL?=
 =?us-ascii?Q?FKs/SjO/xminsULE5cVGGgqnA1RhKG5RU2ldJPmdwyZRjGSUIBkBMBD2YgK/?=
 =?us-ascii?Q?pA1831hDL+hKcN47x5bD9UwteHFV0iv0l9SNPE1Ii87nMj/ibH1w549frjdi?=
 =?us-ascii?Q?6M1unO3xlrPvBonQnkGTq8HvVhlOfPASszuIQDWjuHjq9tFfJ1/boRkHVwOl?=
 =?us-ascii?Q?423AN8k5t7xrGGFGWjIS7197f0u4v2sCLc3WWkvVlBoPvkDyJffnsLzETAd5?=
 =?us-ascii?Q?pX/dK99dIQpZpb5Us0q2JPc/hSnmGVJGoWtWXcHzu+efE7k+373M+/XlwR6o?=
 =?us-ascii?Q?HCDLrGZeVwXQntdonIWj5fCjNGjDF8jo1gtnj3Qa01b9xRL7oRZL3++kHjMi?=
 =?us-ascii?Q?8mEJ3xV1aus7k2xvq36XBIa+SQlda800AGV62kWypi9x0hV3yaVL2auYF+o3?=
 =?us-ascii?Q?CcKby6pUi+0RK/eO+bw/p0bLDLajzzMwiJzn3oD+RoiBOZ6GA3VOPsvOm1g/?=
 =?us-ascii?Q?+cB7FlGwi5aWqM/ooBg282nfPL9NmV6MnTPH7uN+I4DEB2TUxLremqYnmTP7?=
 =?us-ascii?Q?1zsbXW4z2X5SI3ybPGntjmeCDwp5Xx8MMLylTdiKs4xrKanvnMPdwpa1twdY?=
 =?us-ascii?Q?fqX8XWRo6jHSNd9Jyy2Rs/BFtv2FxBv4o1ectLjVBt64n6BqGOEpO08c5DyV?=
 =?us-ascii?Q?bt2RwBaB9qrOoteS6e2eQJL3ZVjeJmYKqZFq6C45F6mYheUtRRdpqCdwxEXj?=
 =?us-ascii?Q?bVy+LVlAfviY0iJx+DG0p0dWwSpHtRrKq8a5/98z63LJ8Ynz97iwu2lGDrHw?=
 =?us-ascii?Q?8tLk+b5MlNk75vzB+S9HNhF57XqAD8McIQlpj4KdfzcXDmOBRVjAETEsf6dK?=
 =?us-ascii?Q?rtXzq1tZEg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e53baa2-72a5-4f24-ea45-08de6f0f8ae8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 17:02:48.0516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sB1bkbPUwZtbTI2MgwvW0ZSLqcczZUdef/37e43wxaQvMGWh67TEBC8mi9zrux4P6MwikgeWfWc8QLKGmtdpEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7969

On Wed, Feb 18, 2026 at 02:25:08PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> To make the code more readable, use the macros for the GPIO and IRQ
> settings.
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
> index 7131e9a499ae1..41a2bb74f1565 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
> @@ -7,6 +7,7 @@
>  /plugin/;
>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  #include "imx8mp-pinfunc.h"
>
>  &{/} {
> @@ -80,11 +81,11 @@ touchscreen@5d {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_touch>;
>  		interrupt-parent = <&gpio1>;
> -		interrupts = <6 8>;
> -		irq-gpios = <&gpio1 6 0>;
> +		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
> +		irq-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
>  		AVDD28-supply = <&reg_vcc_panel>;
>  		VDDIO-supply = <&reg_vcc_panel>;
> -		reset-gpios = <&gpio1 7 0>;
> +		reset-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
>  	};
>  };
>
> --
> 2.52.0
>
