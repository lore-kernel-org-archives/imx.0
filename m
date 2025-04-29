Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF23B26FDAF
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 05:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906139; cv=fail; b=CBQPopnGyikvl3iG6tenuS3g9EHKZ04FQa/glQWmEqPQP+Xee7j1rvKiBd+tefPaEljRWW/eQ3oKM88tpm7+m4XPFmPm31ZuwUIsDbEo5Cr3Mk7YGDBdS4hdgMsYRwXW7LRYCSLatY4WrG+aaYA8eDlllY8L8e0c/+UYMBnHlTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906139; c=relaxed/simple;
	bh=EoA1cpSRsEX7KtiSEUewF/HVMI51fleZbgi6Nk5bZUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dUrs5F3Bbz6wuZIvjUb8B5wW0poDRUnWb7aUE4jWTRBW6et2N/ZXAcsvJwnFd2ryrKsytL35V9MOHCoF6iJl436xt2aL8PdvWDQxJGFWLteVOrLFsqAQWl62uH9LUcxr5J545OiccFvXP00wXUFU7froyfDo+orP3elSiZhxipM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DyCzEsZF; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DyCzEsZF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GX0A/Cgl9ElQlM1roJHvg2tnE+hzuhCefjAWJozmHjN5yXUK0qFtM/0sfn0Gqx1bQXTAgIW6DllsAwDTdRWRDlvXjgm0+TVUZy9CD7snTbzeCnJSI6DB4oPtm36S9Vcoh9vfNc2tNi79p/heRGtr0rQd9kQP3ffYnO8QX/M3FS3cKX/rLPN61kjBImL7ENXz+sVhyYovFddZbvea6HBpe2sVcZhZnC+6uDMaR4l/4kr0xyi7AZ7z7lXhUjBf9PP32HYg5kUVJLWzI1p/vuF1CcIu3yjEJ8kb12lxE74OJmToW9uUebdcYrf1Ln4GsTHiZCcJfxhwhC6rWASO22fY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUpC3HqLRLpSxZnE8t0M+qNSgPwmDPeQ0pic9h30wA0=;
 b=P+xQskpYJ6wes/O6aiJLbGI0v5gZiO37OZ0HXf1aQVCrPZFG4EUIUNBZfTW8S8LqisaVQ2gMT5za+9+OAkChPitx4/3d5kZp2X9ZZgpCRMGMpzH6NPAx47VPn23AWU2hvC12SYypbESemyI6yptpij3p7BZGPhWe3wcQ/HBBgjPbB73sOl53XAjW8Y73nBoZ874fCNo+B9bYVvchFPeICUNoh+a8uULYzF0reoSMooasYHsZvPZiuzkSTnRFF0nEyh7Vk3pZN+qKJdHkXREWhfEfCTYUtLG2NFj4rIBOatZnrJj6D2LF7Y4RKfSZgxqvRvGl1xUZeceXnHuDR9c9Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUpC3HqLRLpSxZnE8t0M+qNSgPwmDPeQ0pic9h30wA0=;
 b=DyCzEsZFEjBi30yaeVWfKJnPdcY7wF0nfYtsTWWYj1cbzpsoLEHOg5L2j3WJtFKu8saKulLGb8V2rNe7hSCqzP9CYYJrFOWCAYUwYaMTNRwo0YTj8wotUSx5hVpqpLpmxnHKpHgwOYt2oUnVhulF1GqLKN6VrhLsYjTgAATFgI3q2UrFDDkdSpxDV3vk8Upf9nM9CoZPmO4VyXDwaaDiyoNTY/HuBHK4JFn/sBnb4yp7NcOsyoXB+B0PHOG8dRQmhfxcl2F09aSiuUQ9WzCq+TLhY7gTVurw1iN/Kr/XNnwMet1Lu9PFkUyC/37ER/4ZzWbkVgJmEwIH3PZlMrBgDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7701.eurprd04.prod.outlook.com (2603:10a6:20b:293::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 05:55:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 05:55:34 +0000
Date: Tue, 29 Apr 2025 01:55:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: imx8mq-usb: improve some tuning
 properties
Message-ID: <aBBpzljSQEnQwlvU@lizhi-Precision-Tower-5810>
References: <20250429033009.2388291-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429033009.2388291-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH0PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:510:5::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f5ca0f-a52b-4788-557b-08dd86e274ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XLacwEC9hb2QE3LlaAcPs1AYIHkfTddF8AY5ql9EeOJs4jVYS9AuD+4SZDC1?=
 =?us-ascii?Q?oDX1EDoCNelOBR892cauT7VxuRhE0aTDHudXgay9sEV1OciGjteAYOdnXefI?=
 =?us-ascii?Q?aa486A6SmBKRYwqhXo9hapJZASvy1Lz8pVYiisdxTeRoUeNYBk867+/ajE64?=
 =?us-ascii?Q?dnzfLANT6+cKxoO2laVjriMXhqqyy2zRQo4F8h9wtirxIeFSVWa90PvB2/XS?=
 =?us-ascii?Q?lo6RCd83fTmYVblku0lCz0N6AAsj7oA2q2NJefAgO+hja72jwE9mQl+DCCkv?=
 =?us-ascii?Q?pL7RJmAKca1/40/nYsNvNb0gapX2rhkUeyzbAYY2qOKAkam2Pmh2pZosHQoD?=
 =?us-ascii?Q?8+UorVACJDzMJsQoJA4duI0JOJr9/YLDs/ECLAyI+oiTZG2fbAUYzgaT1o02?=
 =?us-ascii?Q?tan6YSPDB4lzbNwO3evmCQdJ5YDsjtqT9116lxQovUqjm+ysNfwNbNAtmi77?=
 =?us-ascii?Q?4n+fCrPHenHwHb0sRIgDs31r184brYbHaAjFYwlCO9VCSpoPDIf5MrNfdL7H?=
 =?us-ascii?Q?FxE/G8FfLad7YLblAQBVJTID41D8yBJEmWkErCM2uRNCWPNjaj3Irv2yaP2I?=
 =?us-ascii?Q?Dv6OTTy0XEdhFYcB0+pGp46K0w31AGvMoYXpE1DEwCe00S7gzqMvCyk2YF95?=
 =?us-ascii?Q?alqerXho+sVfadOKcmIxHfxmGRuvjZ94NHKrgadkH1dP/0wnfzpnXx1z7491?=
 =?us-ascii?Q?p9ucOF1fwyXGJWCsNrT2Zkfq9+D4gIeNLITyOcRGi3tQgl9qwkh5XIVR+DzJ?=
 =?us-ascii?Q?oc+s642YKG+AG0BE5p4IPe8uj7zr2EibTsPByN78xLfCtmsJoGJwQ831u7yZ?=
 =?us-ascii?Q?/KeWhPfqXSmWVXJEVEwq5sZwhj2jSHt5vJhYqdgIo3tO+TalHQoxdCCwTrWy?=
 =?us-ascii?Q?dIPKqH5Ymm6q6ZYkvR1cg7ffUqzD7OfPbeg77iaEqb0L57bwn6zej+ii4ixc?=
 =?us-ascii?Q?NTVjHsDLDJNFuT9edeREpks9hlVg2TvXsxsgBJg09CM/cmwokbUxPHuTz3eU?=
 =?us-ascii?Q?CPRZoNx7YyU7ly2mL0DORLCI/tBTobwi/UoK82PG+v80p7UtRXs/r7YRxUje?=
 =?us-ascii?Q?5CHpHhegpu7LBnzyjrgdwerUZIQCYwgu4cy8QfzECYJCUaIV+L1M5eUd0Ix3?=
 =?us-ascii?Q?nZ+lTwUQJqO54v9iahz4+B9uam11rB/GyhO69JwiF8I6Cn5lRekIUyZrJ4js?=
 =?us-ascii?Q?9Wgseijo78wA77PmQkXwXaBitN247wkJ9TOajFKojCI5mmXjIN2WlJ06hH7G?=
 =?us-ascii?Q?GMzZQASzBbv01p+jLlBSVMQGsOTjkuzWcfEcvU7epQFoKGHLUEvcLQdAcTRM?=
 =?us-ascii?Q?qBdGrkfh+tdgJvLNpM6ZEg9zRyxO81eWyHGsV8md8TnDEMJhe/HV6zGx0zRI?=
 =?us-ascii?Q?zdhU+Na+Tx8D1UHoDQZHj7K8zcViwIM3ecQ2wh4cDq2uYw91+eDcjidAu3FD?=
 =?us-ascii?Q?5+rUMFE2uano3aKFz1x3Lzf273hhHZE3j9ci+Yw4MsHCUpIBpeAD7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6GVkT8RN1IqN8aILroz5h404odit1bEprOy32Bws86XFiyh3s5aff97OjE5X?=
 =?us-ascii?Q?bLeQ+AE+hBqKGCdu7qskD380/ozcpnSlP9m01Rb4D3tprYzcumaJyt2ZRHRK?=
 =?us-ascii?Q?p3LRXaxkwOVI/U3sbb05vzGvg6ns4Bs+jhYKuWBUYXJEJbByGwKyxYNHuMiB?=
 =?us-ascii?Q?JWqUE0YIrFRzz6Nns2uqrIWU/WoS7c8YcdmMTZZ1s7VFOjeJN8OpNUY56Hd4?=
 =?us-ascii?Q?z5BCjiFo9rXFfz88gv/DkwCmtcOWXJVyC3emE0Dzcp+RyGptHRLp8oGji0y+?=
 =?us-ascii?Q?Vv7Xe8rZqyGO+rjIQaa+ssQIEaszw7kbsiE9b9xWa7Rm4qcQ0rN/DU1UJl3f?=
 =?us-ascii?Q?fYBEq35ya8+TXuUdIt2zWpWJ1CkWEORqCNM3s/mbiykWq1nZPig5uEeVZUC/?=
 =?us-ascii?Q?qir349eTwRe/eQqAJdXZ2SETE46mQVJyFEF19l4hkw+Lw86Pfs72bkPgahxO?=
 =?us-ascii?Q?4g7p8aWu3bs79FsWnhy05sq0jsI6foZWhrqPQj4W8W/wRZis0JVeOCyH8qED?=
 =?us-ascii?Q?W9JJ+6eyOsSfb62psyNt7gS2gHRvKsHsTQ1DJZ8mCXfXxQN0UdVpgJ3eap1d?=
 =?us-ascii?Q?J3QMagirY01LJWsh3QR2XomNNba1Sjs9IH0KO1sVZqU2db6au85dD+7ecinV?=
 =?us-ascii?Q?ginB/+bJXp4/f0I2b2K6k5l4xaF9qbCRnQnui+qB0rlCo8zFhQsHbM6OEP3C?=
 =?us-ascii?Q?92W8tf4GOCtt6fIBf+mFXyeoctL7pCq4ezYlmthBh2rKRN04eou1TmmvwBXR?=
 =?us-ascii?Q?8dypjOfELjcfAkz2XrhRSyHpWOi5dCtFbgg9gGNCz0KyRA9zNp4HsgITT/Di?=
 =?us-ascii?Q?kqoaj9AC99ez+wbGCb7A7r9baXHGa1OkqWNDGmx8aUruRZwY7xJkzYxI+OPT?=
 =?us-ascii?Q?ZQwu5vS3cr1hp13pIbb0T8doW7eXzSzY3lsHx+NnvnaixXr0TTbNAo8b4FYu?=
 =?us-ascii?Q?6d1/cEPQ5FaheIK5xaMueZWPmcSjyKrON2avEvUigHTze5hJp4ItVkBNn/4C?=
 =?us-ascii?Q?ns4fb0FybcWXqfuI9YwnOzzQIvSO47PrKtoPwWHy/E3+ELQxohdmNy/GKvKZ?=
 =?us-ascii?Q?ya8WXSOHzE9pAv2xlzLdFdIvz6oQAjn0JOp8AcusrBkZ8DDIOkjhXAWuls8V?=
 =?us-ascii?Q?dvmN1LP0wzr0TvWecblbHJDAQDed3pSxt4EuHJ77BlzIwYlDof+xln8pNeQr?=
 =?us-ascii?Q?5YZBBbTjuatW8zTd2IMuAEvl7N8b1HrE99fthVq6OxU20Kw8FpNDy642ufRU?=
 =?us-ascii?Q?pPgIFf+NGLxV5go1ri8K9Rsq7mgYYSmcZOyi14S9C5fbqYDEQ22ncgOjeCBs?=
 =?us-ascii?Q?beD8+yJY2+gzmlI8470LbLJp3fudbkjdOTebjCPCIKrKYJgf3htV4DYCoMGj?=
 =?us-ascii?Q?HIzj95I/uoAJ4uemTkSRJb2zkPUYEEEyWXyC8qvr8BnfKfXc5meUk3MSZ9oj?=
 =?us-ascii?Q?0uRcBA/q91AzytbqOwsgyyhBcT7pIzw7FvlkJz2A2BeKYjv8fnFWFjOxZ4MR?=
 =?us-ascii?Q?nCXFPYDaDjpL2MqAFGtfM/04Lm4qET7tfOahVdGD1RM12JwIuRwBErOzk5sa?=
 =?us-ascii?Q?/cYcfTRGwlRXWvyMBn4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f5ca0f-a52b-4788-557b-08dd86e274ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 05:55:34.1328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccPfsv5k4DJOy7HOF/nvuEGBmzjbERBY3t5kp5JHDUZRI9SAsJc1cmROFsRSN8wDMZMS+66V5+tRlX3EU9ekRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7701

On Tue, Apr 29, 2025 at 11:30:07AM +0800, Xu Yang wrote:
> Commit b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning
> properties") add many tuning properties, but some parameter value doesn't
> match the register description. It made some changes based on the original
> value: add offset to a negative number so turn it to a non-negative number.
> However, it's not easy to find an exact tuning value from register field
> with such conversion.
>
> Because device-tree supports negative parameter number, this will improve
> some propertie's parameter.
>
> Mainly include below properties:
>  - fsl,phy-tx-vref-tune-percent
>  - fsl,phy-tx-rise-tune-percent
>  - fsl,phy-comp-dis-tune-percent

It should be standard unit. for example 0% to 100%. DT don't prefer you
direct use register value.

Frank

>
> The parameter value of above 3 properties are USB PHY specific. i.MX8MP
> and i.MX95 USB PHY has different meanings. So this add restrictions for
> them.
>
>  - fsl,phy-tx-vboost-level-microvolt
>
> For this property, the parameter value is wrong in register description.
> This will correct it according to true value.
>
> For detailed info, please refer to i.MX8MP and i.MX95 latest reference
> manual.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v2:
>  - keep widest constraints
>  - use multipleOf for some properties
> ---
>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 60 +++++++++++++++----
>  1 file changed, 49 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> index daee0c0fc915..71e5940ef4b8 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> @@ -42,16 +42,17 @@ properties:
>
>    fsl,phy-tx-vref-tune-percent:
>      description:
> -      Tunes the HS DC level relative to the nominal level
> -    minimum: 94
> -    maximum: 124
> +      Tunes the HS DC level relative to the nominal level. It varies
> +      between different PHY versions
> +    minimum: -1000
> +    maximum: 875
>
>    fsl,phy-tx-rise-tune-percent:
>      description:
>        Adjusts the rise/fall time duration of the HS waveform relative to
> -      its nominal value
> -    minimum: 97
> -    maximum: 103
> +      its nominal value. It varies between different PHY versions
> +    minimum: -10
> +    maximum: 20
>
>    fsl,phy-tx-preemp-amp-tune-microamp:
>      description:
> @@ -63,15 +64,14 @@ properties:
>    fsl,phy-tx-vboost-level-microvolt:
>      description:
>        Adjust the boosted transmit launch pk-pk differential amplitude
> -    minimum: 880
> -    maximum: 1120
> +    enum: [844, 1008, 1156]
>
>    fsl,phy-comp-dis-tune-percent:
>      description:
>        Adjust the voltage level used to detect a disconnect event at the host
> -      relative to the nominal value
> -    minimum: 91
> -    maximum: 115
> +      relative to the nominal value. It varies between different PHY versions
> +    minimum: -60
> +    maximum: 45
>
>    fsl,phy-pcs-tx-deemph-3p5db-attenuation-db:
>      description:
> @@ -112,6 +112,44 @@ allOf:
>          reg:
>            maxItems: 1
>
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - fsl,imx8mq-usb-phy
> +            - fsl,imx8mp-usb-phy
> +    then:
> +      properties:
> +        fsl,phy-tx-vref-tune-percent:
> +          minimum: -6
> +          maximum: 24
> +          multipleOf: 2
> +        fsl,phy-tx-rise-tune-percent:
> +          enum: [-3, -1, 0, 3]
> +        fsl,phy-comp-dis-tune-percent:
> +          enum: [-9, -6, -3, 0, 4, 7, 11, 15]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-usb-phy
> +    then:
> +      properties:
> +        fsl,phy-tx-vref-tune-percent:
> +          description: 100x the original
> +          minimum: -1000
> +          maximum: 875
> +          multipleOf: 125
> +        fsl,phy-tx-rise-tune-percent:
> +          enum: [-10, 0, 15, 20]
> +        fsl,phy-comp-dis-tune-percent:
> +          description: 10x the original
> +          minimum: -60
> +          maximum: 45
> +          multipleOf: 15
> +
>    - if:
>        required:
>          - orientation-switch
> --
> 2.34.1
>
