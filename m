Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F836F906
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784922348; cv=fail; b=svXc7ttDBeNOjjtdUwGvlpSfOUQQHShcgu+IMhd9axrgl0RFYGNEoq64HApjM/hKdhoA0X7Rs6Skqx6CVkYp8ZTviuA7h7qH9eYCz6BqL3zigWtEshx449nS6yEAGOgNtxPyFSWq1ibVNyt8q1yDRnsRRQ5vwOfrjO0KVn7sJTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784922348; c=relaxed/simple;
	bh=T7scPUik0N7aviWuCe5wdTvLDTavJr5ligzb97KwHrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tVXX80E0wQjeO+NTN4oHh63Jqbrrvzze684Vw1Hh66ZK+3cR7DTZgDSJlKu3Bd+mUTklPe7/M9DBkVPUaPxSMvf6phADUziqlyBqojAf7F57BiZkN2IR6yxoVuHIkfXXCF7PrEp+hEyo3VFXwLhIubc+PGt7lpVYgZfBFl+/s5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FrW4xmNK; arc=fail smtp.client-ip=52.101.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FrW4xmNK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+in6fMr0tA1I2qFBGA0uecdqUaTzHl9rj0teoaTTGE86bCsCdj3CR1JIcyx4cJDn+sVfpOaC4Dr86IMiSWyA+Iq7WsK9yABC7AeFJzNMOfulWvGdaBrYI8gqW1EVTB/ucoeYuT3o3r5XSYnMWSdUJURCDMnLZt6A3E+ZVHmPunc3sjPe0RrZEhKF4jTkk/Z474ndWaxHLrlnmTsdQyVJYCCFhmvaMMiks3TxASEO4BGijj8co3dIpelNZb8GOKKtOC8J/7I2FikDXgBMmZ4pFvJepr1GYqgjxqYQmR2pFR03UO8Ub0iBnHCcWP267+5M8JWRVT4qlnfX5tqi/ikJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bU1n2dWhStFwjtlowyX9rnIR85/o2yN2xnnyYtSUXCo=;
 b=hEJL3s4JQUkCz9eqpuOApZSsWOsvSHRxpMR9WtjhJ2vcAeukAlbc2w0A7pZrK/lrXt4uKcDalbwenOha9OWbLobmGGYGxXAHXJmpPXaGrFulaFOPOhVn17UHjf4MOXyqOxQy3iHI3l/DC6yIBfp+rlfK6oEpdC6CzJDxgaklPlD+CGGI/Ee95PCgFU9uAP1grRs7K/l8rNwx3EftVPnXEEqabZIi5UMovGA8JMaLpp0toA6H15x/55/aAybsf77uiczx7zuHJ6iIvnEQj4zmtMB+C8u/E/PzO7lEb6p5WBiShKmNq7AuCSEegOAbuYZrOTos3OAZAU2zATozBodTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU1n2dWhStFwjtlowyX9rnIR85/o2yN2xnnyYtSUXCo=;
 b=FrW4xmNKcaIPUcMmtfuPy16KQR2HU6TP1W1c0YzNK8IS7Qy//0ZTpXOBj9ChPd9wffJcp/Sn1HaUu6QUKRfBjYhj1V5TizmOdsG5VdNF22E6v7a7o1ReOM4ZJGZfX2VkQBGE6TCSpQSA52CbvHUB5II4dae/2zCHiROkrPFwb2gztly+KeOV5nyhB0dijD9MC9rxMzA8HaEKeQ1wpbllbz2hfbS+OwH1nJLARrNI4xQWwGKns76YYt8wJk1BnVWqSi83OCSkjMrbckm029M3Y5PI9NgAWG/uEgi2YjU+6zagVeAChcmneC0WyunIe3NK/rVNZYhcVYoeSaj7cn7g5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7851.eurprd04.prod.outlook.com (2603:10a6:10:1e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 19:45:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 19:45:41 +0000
Date: Fri, 24 Jul 2026 15:45:34 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH v4 1/1] ASoC: dt-bindings: Convert eukrea-tlv320.txt to
 yaml
Message-ID: <amPA3hHmTQm42PP9@lizhi-Precision-Tower-5810>
References: <20260515145205.1696584-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515145205.1696584-1-Frank.Li@oss.nxp.com>
X-ClientProxiedBy: SA1P222CA0188.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: be6f2e58-e224-42c0-f98c-08dee9bc24f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|56012099006|11063799006|10067099003|4133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qs+DM7DUHSog1EXeU65ngPGbkg/9CqrS/yI2IMKDy8ctXR4YdPcYcoYOiZsvWKYY/FZDWBajXOclR9l5L1IpSqzSB9sJOi7sR9mgKv09zsjUl5G9fkJM7ErQPj6GvOyk5MZy0ZS84VCP5a8jzOJbV8gw2W5Hx8HklOZZU82HaL7iBtqE7xdx2YeZE8RPtbLHEyvkIca4o3yuAMYKv2tMfuUQ8ENLz8a+Gqi0DJm8HWZh4niZ5wgRACldvtGKobBiXeeZUoV1/X3TJ0s+L4jX1xiKxqwlvDf0dtRldiJaTH6/tXQ/bVrXQda6CdFET0dUXjIcL8AYOl3B4FUkbyBRUN/52ngwbjPLfoQyVC5soewEhE4JWFO0ZLKox83Au7oZnpFUuCvgHu4pQqCw9QVu3DLEfnZslUSGASy1spRgVLzdWf62mywAfMAdIQpjBhorZ9XhhtwFgL2enGa8sjJLTI4T+O7byc2NB+wE9vHXo/hKvPuCT3ksCEPW0B8jQ63Y22ptADWPSirgiBFSsJjMm5asxTP8Ki6B0SXrTFdE+S0xr/p6N2bdHTE7+hSKUpBJ41tTWZmAixeYAEbYxxgH1haagMwiFD6OfWW6cpj8WTBJitxMUhcrSsEf58PBL5vU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(4133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aChao8pAf59+EAXjxMoHoK7ToMbpF18U5hV/45ts+uN8I2CaDhqbXRZtxwJ+?=
 =?us-ascii?Q?yxEtNSWsPXZRzWJnMXE5Lh5915nAKwt192hyamkYnl4CF3vCg8staPndWJHo?=
 =?us-ascii?Q?GyWyjSLCXb/uXleZp2c9nZfqrIcZg6O5uaxmoXFC0PLMMLF0cwbD0ZE8PTMg?=
 =?us-ascii?Q?u/47ihSW+ZaRtRmj8iQBx+eo0liU5/lymcfWp65GiAIiFQfL0MBwyWQCVAIQ?=
 =?us-ascii?Q?6KEZyVb/A0IZbQRWmMmzzqznXOFdKotqHLKg5LZQaZYTRn4xiDSfDsIBfyNe?=
 =?us-ascii?Q?Sx4rg9bd9VPZUgJHe8ysTvJ/j3YWgyv9dWYjMQaQ8DJ7K5dSqB0fV9T8i9mx?=
 =?us-ascii?Q?foRXFWLHHgl6bu6W6SamYU3X3BhbGXVySZjxAPiAYVdWCxtP3+pWFWpklnpC?=
 =?us-ascii?Q?mT2CymbFn/w6sk9O2RJkkHvweow/B9Y5TOQ70B0tBO5i2XED+W9b/bC5Y/rb?=
 =?us-ascii?Q?U1rh94oQkdwZOBErKtH7dkWFyrVGquf6GmgwbIPLNwi82FoMlYGcjumJ9gp7?=
 =?us-ascii?Q?6jYsK13osMCUefWoGLgKa9cd/xUyTW+HJuxWtGZTr4EzuOn7NUHZi/tA2XGF?=
 =?us-ascii?Q?euyUNPav8lH2Se2XzDCaxNelOHzzq+Q36AYnNEXGOQBzOwdpBO5aQ1rbX61S?=
 =?us-ascii?Q?BN0iR+ntakiiNkLNEl1TWqwpgC1vWS9/CLPwxihNARnnR1GczqoOil3e5yqV?=
 =?us-ascii?Q?tO/5OvSaAi0pmB4M4t2VHmIJ0GBD1f1XWaxYrrZ6nFyS44xxEXHDrGeLaKjn?=
 =?us-ascii?Q?RdDl2E0cA7cj6QBpsvAttm/bOhtU0mVOAbrXenSFRs6mLGs8fLlI9KUi2pCq?=
 =?us-ascii?Q?dOsQffjUuC4XLYWQJI7ksfgr/Fo2p48h2m/TFNyWtdqGQVOs9XxLpz3iaX4a?=
 =?us-ascii?Q?VY6puVnr4BJEi6UInWe13VznAW5P8kdkkNrYuRFSfR4Z1x9jD6cvqOjtjrTh?=
 =?us-ascii?Q?WNbOA4+p1Rm/1zLiz5R1/F3RUyPjEq2SA2ma3cUHq6Us2peF0zRNrHUQTo+T?=
 =?us-ascii?Q?+kx+7D2HNLhScVwU52nBaixBrImX+sDsjFgPtC0RkkTPsz6rk9aFj8Xp81uE?=
 =?us-ascii?Q?evNdZAOMrEDhh9tNjEVyS9I2Xa+NqVTVFbrrG0rpxcjfZhPdKKCxC6jjOCmm?=
 =?us-ascii?Q?dsExKHWo8W6Qcuom8SwKhwE+HffJDlaWCGHVbAlSTBDLNGjJuq9IiVBYIK3n?=
 =?us-ascii?Q?KpoDVz8qlUuMThUn4n+shqm73yOWCihlR8rg8aAtOzHMKVRkJCpvyJbnlvHP?=
 =?us-ascii?Q?uaj1HvF23O6KYaVSF6h5jK4iQz82Akt7IEBJbu18nY4c3DS3kPoysQbhRTAY?=
 =?us-ascii?Q?HCdNFJ6u0fZnygB8sIdfxS06Py7TgeBotE1QS3ex8Qam6ZKKDwvlX2lg62vs?=
 =?us-ascii?Q?QBTE5R4FNcgLf8Pa37p9vc/f6QKVNxEb5reQrxJlEHkyD0BdE2hVW4XIgykP?=
 =?us-ascii?Q?D1DIuaqVA0BrrZc3NdGzT5Wp6XS7pjEy/3dA40KC+RPjbaJ7kwNM/vOLcvVa?=
 =?us-ascii?Q?PEiEnky6/nwZHvpaD1z3/saHy66HRyt8rhgGadoK62fJhxGpoJGCgg+lOrw4?=
 =?us-ascii?Q?c/kdfA5lK4K8jsEhNAgf8sQcCjFxgxav8mcCKtIN6KVwJfGE2PaUtEX4BCXB?=
 =?us-ascii?Q?L5j7BhTCa2GmdpMqtB1UKpXET+jIH6DuwklIjUrnBMaL1u55LzgFAGQLOqwz?=
 =?us-ascii?Q?PqxOJHJowzi84nIEDwpjhaAGFMWHe1QVfpR3VZQP8J8N8PvWR3cEI2XooCKQ?=
 =?us-ascii?Q?CY38aTUCVdoE2kU6SUWhnkOIqTTEKo21YLQD917xNyHbmotyA22r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6f2e58-e224-42c0-f98c-08dee9bc24f7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 19:45:41.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0i/UfluUY1aECZIdC4xjr93GwNaErqYVKs0OK24wRuaeOzEJ554mhzRpbHjZHa1O+moFvmcM9My5k0nnYf3Ys/zDiivAqUM65PsVPZhDPM041Ty+GxK05LJ+meoK4IS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7851

On Fri, May 15, 2026 at 10:52:03AM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Convert eukrea-tlv320.txt to yaml format.

Mark brown:

	Can you help to pick up this one?, Rob already acked.

Frank

>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v4
> - add minimum and maximum for fsl,mux-int-port and fsl,mux-out-port.
> change in v3
> - add fsl,mux-int-port and fsl,mux-out-port to required
> change in v2
> - Add comments about "The AUDMUX port numbering should start at 1"
>   v1: https://lore.kernel.org/linux-devicetree/CAEnQRZACes8EptdEgg0i0vzdcxgUJwZAfQHU0DEhMnXtA-g01Q@mail.gmail.com/
> ---
>  .../bindings/sound/eukrea,asoc-tlv320.yaml    | 61 +++++++++++++++++++
>  .../bindings/sound/eukrea-tlv320.txt          | 26 --------
>  2 files changed, 61 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/eukrea-tlv320.txt
>
> diff --git a/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
> new file mode 100644
> index 0000000000000..24b793feb02df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/eukrea,asoc-tlv320.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio complex for Eukrea boards with tlv320aic23 codec.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: eukrea,asoc-tlv320
> +
> +  eukrea,model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The user-visible name of this sound complex.
> +
> +  ssi-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the SSI controller.
> +
> +  fsl,mux-int-port:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The internal port of the i.MX audio muxer (AUDMUX).
> +      Note: The AUDMUX port numbering should start at 1, which is consistent with
> +      hardware manual.
> +    minimum: 1
> +    maximum: 8
> +
> +  fsl,mux-ext-port:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The external port of the i.MX audio muxer.
> +      Note: The AUDMUX port numbering should start at 1, which is consistent with
> +      hardware manual.
> +    minimum: 1
> +    maximum: 8
> +
> +required:
> +  - compatible
> +  - eukrea,model
> +  - ssi-controller
> +  - fsl,mux-int-port
> +  - fsl,mux-ext-port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "eukrea,asoc-tlv320";
> +        eukrea,model = "imx51-eukrea-tlv320aic23";
> +        ssi-controller = <&ssi2>;
> +        fsl,mux-int-port = <2>;
> +        fsl,mux-ext-port = <3>;
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/eukrea-tlv320.txt b/Documentation/devicetree/bindings/sound/eukrea-tlv320.txt
> deleted file mode 100644
> index 6dfa88c4dc1e8..0000000000000
> --- a/Documentation/devicetree/bindings/sound/eukrea-tlv320.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Audio complex for Eukrea boards with tlv320aic23 codec.
> -
> -Required properties:
> -
> -  - compatible		: "eukrea,asoc-tlv320"
> -
> -  - eukrea,model	: The user-visible name of this sound complex.
> -
> -  - ssi-controller	: The phandle of the SSI controller.
> -
> -  - fsl,mux-int-port	: The internal port of the i.MX audio muxer (AUDMUX).
> -
> -  - fsl,mux-ext-port	: The external port of the i.MX audio muxer.
> -
> -Note: The AUDMUX port numbering should start at 1, which is consistent with
> -hardware manual.
> -
> -Example:
> -
> -	sound {
> -		compatible = "eukrea,asoc-tlv320";
> -		eukrea,model = "imx51-eukrea-tlv320aic23";
> -		ssi-controller = <&ssi2>;
> -		fsl,mux-int-port = <2>;
> -		fsl,mux-ext-port = <3>;
> -	};
> --
> 2.43.0
>
