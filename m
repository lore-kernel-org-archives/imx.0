Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4594136351
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 01:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553286; cv=fail; b=s4BhAGBRI5fzEHEpwpgQz7maBZGNdP138MBaiBNerxXBxE3SOeB2dWWrxOa4ETK5R72qghsTb0vrrHvSo9kp8EyPtAzKLMzT85zQBxnZhdRRzgE79RAMSTV50ZTiA1rbUPlpv640vN5+SXPXyAoxno/j9womgfbJrz0hYQKtDKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553286; c=relaxed/simple;
	bh=Bj41YY8BF01tLL4PglJYqEcF699fagCwfDYS0PIL3wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lgbVYwbvuf8kJ3olcLnCh40dUjjQH+xUyaLeuDmga5BwkGGiesMSWvhZPZ8mjHkMgwY8LY4MUSU6pleH0dAyNcyyNR++FDT6Ejq7Wvio2cho1ibmQCVCZNyfmvWKHdy+n24UVEbaWZhwps/1EehghMWQkIICqHVXb1/zLMkiwUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hZxa/ZLg; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hZxa/ZLg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcD0/7dtV/bNrJ14tKQwA8dZYUVit0N9JKnYdLfZg9cCaHlB/dFWscOgrt4h/ZP1wSMRjDEvu/BHy0pwa0OnyU0FbtLVG8aZ97MY1vHJc5jAK9m6Nh0hZYo2MbUyUJyIUsp+kb64lGoJAOR1F75GH9JP94R89tp95WHnRJLOEOWOEAYkIcfysE5CbLIcaMRvQQDUWu8ppHiG0bJ7c0rPAlv744egbCuzJkxxRGEjl80hljBlhh/6gEwhS+0XazzBL0wvYGS2RIWh46GJUsSg8g5Kewxg2srVn5N3ajlJFSXfawqR0XcdEUgoz2NwBB2MBcEtZnyML/Jxx2oXflHcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUdAmtpRR3kbPVEVus74V6zj1Ua49rfJno8Zd0GGCbA=;
 b=moE73XJW1O0ZTIRQiMhMlIqmAhWgWl9yzXLdcg12ABTG5xw818esY60qrjTV8YueijX45NLReYscHUqlr1j+fTtMxqJ8xFtummJcKhEuWNDkD9Q1JeOi/m7cyheAgI7nEVp5MCuOJui22b1+9TYXZrVXBOo+2sOJVbIvh/7VtdAAvZvbNadlwklyQagtBu1vn2vU+/3elXtJJOrnwJB5ka0dNEzyMh5AoeKvwKO4uPPf/G5Z5SQ4idEnXIKrTYq8Qrpe5w6fxl9lUIfkKDEsuk0odrd2wqFHb9wwxZq6ynMoVLKhsR+6+o2Cp0sKxhKY6i+avrVNOIOKtLKAKsZtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUdAmtpRR3kbPVEVus74V6zj1Ua49rfJno8Zd0GGCbA=;
 b=hZxa/ZLgSzepcI+hSM16XsvjIBbcEqNwDpRXCVzaVxbC4Sp02NvOsx0/FIlNF1d5s4aWK9NizlXK+s4hJz8gfamyh664r0AyCVoTaR+SBAWMwS+FHKsiHpBzya3g4ILlIPRs9uS8reLvTvzNpNyw2oCOw5/hSRE7rGFgmxQQ8rCcZ+dBObdj2uevboirdwmvm0ANXr02hCIejndOwRxN4m7hu/T/mnd1qoiADm7Y8bSqX/VhvES5zFbxJCbRriE4+iOrW/3RO5yMfioOf1scpF9SlvZR+Nu/QetJwbBwUtK2OcbeJANUPj/bLAkdwZzDVXT0X7dpbhy56/d2m/blgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Thu, 11 Sep
 2025 01:14:41 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 01:14:41 +0000
Date: Wed, 10 Sep 2025 21:14:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
Message-ID: <aMIies4V8iTNEcWI@lizhi-Precision-Tower-5810>
References: <20250910233402.567245-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910233402.567245-1-festevam@gmail.com>
X-ClientProxiedBy: BYAPR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::15) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PA4PR04MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: a81040ca-dc22-4070-4041-08ddf0d09599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o4BOh2uapJ9AzJe+lvTN8VKsOe4UoPKn3IP+RcgDwa96ZTZyTJZYJJghAcVJ?=
 =?us-ascii?Q?lcmNtarrdNo4I5iHfQH4n1fWq3bSThtn+f6UWQAcDq2/t5Gr1amantK9SsmZ?=
 =?us-ascii?Q?zPimq9KUuNkZNkuXNHh3/28v/edD1JVLA4VezQHRzg+xR7BqmCk+cJpCffAU?=
 =?us-ascii?Q?BvtAWu39wQ1m1IPdCsBtq8vMrfInsZnrohOgiPfZX9vE7Q/9a4HJmY6uxHyS?=
 =?us-ascii?Q?5TeJMGWO+B/XKtWX1PDRV6snQ3hQns1DywVgeB/H3uSx1ffJYph4ilO7GYeY?=
 =?us-ascii?Q?JkButQ+d8GxSwyT0mAxUPgtxW7+1LvaOIFc+AW2SM6JHYTJiOnuGnSjwXX+L?=
 =?us-ascii?Q?VixLXVXx+p1SYovq3gFki3uy3rMYcwo69DwVrgYmupCfmSIJRArQpxco18Dw?=
 =?us-ascii?Q?bXmpEvEoUMUa2Y4h/DahvTMEjJBH+Av3OOGx1l6O9ydeQQFv98DohxoPjp8i?=
 =?us-ascii?Q?u1Oo7hRM4TEPeOUV7fjKK+JaHiqjccMuo0ePDtvoTA7wxaNQhY7D8x91gsMj?=
 =?us-ascii?Q?Tq23qd9YrJ0OlL3ISMjgURCz6rsoYKXsYwmpNxm/5o5iV93XIpk5RdohxKr2?=
 =?us-ascii?Q?H6gfnKYAbHhdEeaSOBTOAwzXdLkeZPCMAztrT6AdzlqG/APtr5GJBiKtRh9S?=
 =?us-ascii?Q?b9lkxO0RywZ/O3HEB4T5feT8h1uNejVzx44UPdXo8fG4KP1OErVowF+bUdVo?=
 =?us-ascii?Q?m92gAiM+0KbvGoiiNbOkvGj9J7PgoxD8ePINhG68p9YUEkz/Up/9PeVAi7V3?=
 =?us-ascii?Q?TmQoT3idjoqm4tLKhj4lK4g3VG0AGqCtIBje5cLurgEZtfqW3v9yut3GiUEs?=
 =?us-ascii?Q?JtP/y5oha9lW4ubeScTVYVDqyLem0+HSnCr6bYv7ScPLpLUscZevpiCozo46?=
 =?us-ascii?Q?xDWQFwqkagixN+hV+23BJoOwZ7LmnG23P1hbTK6oxpVBgs8Q3PobQKCjB2qk?=
 =?us-ascii?Q?2XeQp+2Q+/eARHKgS4+LZCadIQljU9fVQo7seduhfYravxTlMuCWZC8svEUc?=
 =?us-ascii?Q?wdk4JM+QIGJFoYOmz3q19Bx5G1+Yh6GX8QkmmUocTCLVYgjXKsbLeXTQFQ9v?=
 =?us-ascii?Q?0uwqb7s1HaDLDT7ubjcQnPErv7A76X+VznLXeowHxZMuCOhIA+AC+Glwh5h3?=
 =?us-ascii?Q?UdZ3WG0afG7R+PpVjkubbw4y9UQPcQ26vSJDCpUKL0O1fYj5C1b2Z8z3jY2P?=
 =?us-ascii?Q?wckvnM1UWfxwtJqogFdxyQPKirFj2Ep+ajXZ4S3mAm/vqotlaNhaqXUCoWB0?=
 =?us-ascii?Q?H8OkLH8vBgQ3jl7HhXScg4hq9A2hWc7jVPfEszI/Y9R7XJ61YJWJReETffZ2?=
 =?us-ascii?Q?0CzYTpLCWIVpNqjZcg+e7iDnDI0onjnY0bA3KX9zNfsj3PlLL8hiDhHvo9qn?=
 =?us-ascii?Q?PuZiTS47onLKrTFjPH0UlYitjQRV1aQYSrsMeB57hmP2zocpc9Nruv7oxNEP?=
 =?us-ascii?Q?cuExmREGgYxVKqahHMq/QXOBNSU76kB6vdCCBogRPKnHrUbTSoYT+ZOlfyHj?=
 =?us-ascii?Q?zhrPZokaJlkXv1g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mOzOlkNU57o5DZHijqhIL+t/WJInati9XwmphrckT6B0e3/Sima/c3S4gm77?=
 =?us-ascii?Q?dSvKrvVtCTQNiYe2Rt9KkT5uYlrYMlhlGMY6/laRuRh9cbEPnfTGPjwZNapE?=
 =?us-ascii?Q?Ca7VXHsvzGESzFjqn5QVME2p70eIykSW9DDcggTrCrqpefhgY/CztLqvxyh3?=
 =?us-ascii?Q?dfeSrsvY6Tue+ZIZGrV9inICPV73tYwjW5EL/HMjmR81NUitcAOAsAEne35b?=
 =?us-ascii?Q?+IjRx/GCr0Ne73w8Ab0mEtJldo6Co1HgTcRTnWGpXCneDev0gocLVSgVEUqJ?=
 =?us-ascii?Q?jfVdrsMMp3d11+JZgCdDt97xwwuJSN5Jm2F9Az1VIrPIhVw62wNWXR3FP4z6?=
 =?us-ascii?Q?aKmR9MVjQvYoAFch7fJOHM+YsktjlZQ7rUF399JKZp8dV4tOyeZMienQZkdq?=
 =?us-ascii?Q?9h2WV6iCueR2HvuRsOqTnJFE1fWdvQcFxIHH6XDzWCWiHGXHbCSEmUK9tS5l?=
 =?us-ascii?Q?9LiNXB5w+PtrztFBULHPfoJn1heCGyKfPlfplPYMuDU+SExvsygmfuySPL37?=
 =?us-ascii?Q?2Y6BeupOQPcT365G8OvBj2RsIzxlGCENGBfCbslFEAZilxIYLVDAa53Byjxf?=
 =?us-ascii?Q?YsHSMCnZ1gkSH4bmiDwPw2AIZ8zdsw6WUZPHw6A9BjyEuhJY3nk5QN+ODwBq?=
 =?us-ascii?Q?gWff/qEacUb5KSRZp56Viltj3MCI7dcgc/OJvuFp1rVezjj3ggCSjAo27ba2?=
 =?us-ascii?Q?kJ/qTwQm3iJQoxsohj9dPOFNKZC4mwVAuF/0D3BfnsAMmspQzkhOMs2cLA3D?=
 =?us-ascii?Q?WMXrIB/i/1bp7J7F54tqk6BfxBKOcUlpiZwLPFKu9PNikbWhNV1ZZbg5qUDH?=
 =?us-ascii?Q?4jWshAxqWBKgPLbjql6Punfs0tfmvS6/WjTWe05odJQnyMOCafjMpIToYfpI?=
 =?us-ascii?Q?ZOziQmGOCde2ceTIIGwYzOoDHpbi7UOK1BQgPEJv3Uu1mkFz52KqpDAxnlOp?=
 =?us-ascii?Q?aBlhDYhRnhjj8sFl1NTEXXz6oavF9WCLwYF5VRzfEyhSmlSItRVwWG27rQW4?=
 =?us-ascii?Q?5J4VC8ZNP/p35qakLa/4YePyC3gOdztp5zi1BqZuhBI582y3+zS4vbapDvE2?=
 =?us-ascii?Q?nEUlIM7Af7PIT0kQhutwoicyy6VeuE/PUjg+PqM+6Inj/Me04bzD9ul0G54N?=
 =?us-ascii?Q?Qgke2VG2yJO64KT3bReW5pg6o4zy9zaxL5Dw0H0WGnPgNymcWyJ4BNEUr5O6?=
 =?us-ascii?Q?lfzcXA/k/8wFnXXVkvoedolf4m3LTXXIGxjbVqKsEOIJGvOu8EEZ3qUKsMcx?=
 =?us-ascii?Q?Z4EL8+R1dBNIWGMtWmAv1RTz+Sv8gsn3h4JAocbIF8Gx6iUZmS2rjKZnOH6T?=
 =?us-ascii?Q?UqExG/qhFt85vYFtm5SgFZOY7XT2Aij7IPweKwWdIDoATLzhC6lc6fsekkB3?=
 =?us-ascii?Q?UVXZ4AhoaLmbSkoPBBtjvUVjrKx8TKyHpWAoItu3S6lmu2kIkWSlGjVg/iSc?=
 =?us-ascii?Q?YXpPumtDTrBatBnW13bLtgTLK8gEToLtljsSpm3bFNQjiPopVdtP0wuBgZC6?=
 =?us-ascii?Q?2I+gucJ0PUBpXMl2mBabO/TffQmcerkgWS/XCaPKpLwxpSb7yQeB6t+v7+9W?=
 =?us-ascii?Q?9F0GMGZa4DZ+PB+TDMUhIipahQL0ZZdPaJLlynpE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81040ca-dc22-4070-4041-08ddf0d09599
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 01:14:41.3391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWT5xht7s4+53u7Ik3Q9k1fNAjascmfVsbppd6bBg33QM7ENzxptKvdQy5j0of7xzYmmLZQILvnw1fm3aTaakA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7982

On Wed, Sep 10, 2025 at 08:34:02PM -0300, Fabio Estevam wrote:
> On i.MX6Q/6DL the following subnodes exist to describe the CSI port muxing:
>
> - ipu1_csi0_mux
> - ipu1_csi1_mux
> - ipu2_csi0_mux
> - ipu2_csi1_mux
>
> As they were not documented, dt-schema emits warnings like:
>
>   'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes:
>   '^pinctrl-[0-9]+$'
>
> Add a top-level patternProperties entry for these CSI mux subnodes
> and restrict it to i.MX6Q.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes since v1:
> - Restrict it to i.MX6Q (Frank).
>
>  .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> index 8451cb4dd87c..719de0489002 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> @@ -50,6 +50,22 @@ properties:
>      type: object
>      $ref: /schemas/mux/reg-mux.yaml
>
> +patternProperties:
> +  "^ipu[12]_csi[01]_mux$":
> +    type: object
> +    $ref: /schemas/media/video-mux.yaml
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: fsl,imx6q-iomuxc-gpr
> +    then:
> +      patternProperties:
> +        '^ipu[12]_csi[01]_mux$': false
> +
>  additionalProperties: false
>
>  required:
> --
> 2.34.1
>
