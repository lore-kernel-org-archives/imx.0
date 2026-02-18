Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013049.outbound.protection.outlook.com [52.101.72.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F6C344D85
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771433975; cv=fail; b=E5Cs0V3xjf6vYjpXnygEPPq5nBEU7nDnSqd6FKb+GaRAq+ZRRWore3An54ltfbhV3iz5IC4AnPKyjFwF2lu7xJxra5K2nQBYBHc03ZlW32d7/mDYP79RDJARoEkYO6BmVMdSFqYjPmgpEjkHRNooHoqYdoGZ/cCbCHZTbpd85yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771433975; c=relaxed/simple;
	bh=v7Wq9uo0shoqAsHCHFRo8vceQdWFHgRJqkQ8oB0IGSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pX9JywfFsVz+/vYgxGNAtIauwC0KQtX6DciDu1qbkwnTGXL4EP27cbSvcWoKq4SD8ljTuwFJdKizvJW205yYSKrKqJ4EX2QbsXohHZn9MqRIub/OlLbXLam++fyMqbY7MixfgKhn8o6T/Kait4hDdL8SbaKDFq9ryOUX8p9AhAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WsTtJBXP; arc=fail smtp.client-ip=52.101.72.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WsTtJBXP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9zk6yeXp+Mf8FxXlySdRLhWDBcSeujhATNSrUX5lTmXTobukCtErdsjstn6DePAXEGp5UWMt2kkELKZbrhU4D/XlgNko/UuFGOiWZJL8PnCLzFr4dv+QWwCfhEw4owcpbBVV2T51S843sVq64u6q+fBuHUbZo6/H4uzsyMpRGyoyLTz+Fgy7Leh95S9k02jn+ni0Txy3sqYgdhBv7HFttrkMdfAOEnOXeb6ELTbuC/eiNTUUwnkM6CdwzYFLG9oAhdL8fzpP4Y1TxzvoQ7UK5E4/QEoDktuqFXxsHti2lfqj2Zv2ne6/xdB2sg3Fjm5mxtAyI+rHSE9eUQLRq0S+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqPYwI3ECyf7uVwG2DPFeVwVrrKHOG1yjGXnPtbIOv4=;
 b=Ju8Tm6w3Rpug7wWOJukOBxrFPJ/Ux7eG5EdoQM7MHBQvawyj9FmB+PPcEMGHbGUF47nST44N/qxWYgZqbnzATol1lrGmv+myBznziY1bAh4nUUFGPc/3En1ycf3HawOLUAH0PnZZYqNAkYYrB36SyTPWEwRpWbkwA+IfLlP69OuphvScAKwQybHI7bQHa6iZwTMZMicZFOMdIYTkkgb/TDBe6Jf6wNhhjnW2D4hgMfcm7OjOu6pxDStIHk2dUB5Zs/1qEx8PyV32+FZqzfBAfDXDA9vuufJW6vSnQT3+eQUIBA2esMWHn4UiOiR6X9/HHMqB0Us4m/WAUi+oUfq9mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqPYwI3ECyf7uVwG2DPFeVwVrrKHOG1yjGXnPtbIOv4=;
 b=WsTtJBXPQ8aZXx/Y5/InZYBGzw7E7Ph5i82bTsv0zhDSGwSg155mPRlXH7iAA3YkcAHHYkXHm1r7nwhdRVZpUnWudxp12KyyxhveHSi+dWBWdAYj/SM+MpA1CCI5nvp5YlV62YmzBuE12Owf48pOxzrdW5q8Bs5K1/gBhaSi1luDPMXxInrKuQjOCOYHzRfdQJwTixvINApzKyjK5f0/X3V8khImnNkUuhkkPtL9pxeKcikSXEBS4K/xHpCZk7MUN5JIXNXxp1AQuGd2S2ohRTAQ1OqeR6Fka8qOAJytaYQ2V+mqTuE134IaalZXU2gyb7PPmqE7JG1crlT5gWs+vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7969.eurprd04.prod.outlook.com (2603:10a6:20b:24c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 16:59:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 16:59:30 +0000
Date: Wed, 18 Feb 2026 11:59:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/4] arm64: dts: imx8mp-kontron: Fix SD card supply on
 SMARC eval carrier
Message-ID: <aZXv6QSq-ydOX5Wt@lizhi-Precision-Tower-5810>
References: <20260218132519.74570-1-frieder@fris.de>
 <20260218132519.74570-3-frieder@fris.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218132519.74570-3-frieder@fris.de>
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: c5fff5a2-d07b-491a-8352-08de6f0f14d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v1lRw6rRKZ3BV3UMgQh/YOl7YVdX14bnfZXengLU4VFHBtyqApBQpApYV255?=
 =?us-ascii?Q?adKzmZPCKgLgOmQgHyPcjW4zhbtUGWYeMji7/ZheAiZUfHBm3WDL4wfi+19y?=
 =?us-ascii?Q?7wZxWetpx0Qph+/IRPw+fQDUn5JMcHYvZRP2ISFYNEMIsngtt7SNYG8Ma86N?=
 =?us-ascii?Q?PcjScntYATgx3yyKWa40+va3cBnbmnKkmp/9UiZVt9Jo4PvG3NhGuEjbV5Uk?=
 =?us-ascii?Q?otyUfLW8oUpRxV1Bee1eKYxks+yqUIY7WwyT34Fi80O55dyFyv2+9Ewbdt2T?=
 =?us-ascii?Q?Ubn3O0EHubILY7z0K2H5nzbxJnOHhfSW6jt2JJNby0t0s6MEtdhQbpMhfE08?=
 =?us-ascii?Q?P8k/OLpHsjZrfnjtxgrwUF72AKivzxl3iobjgpJro0uDj5R0GJQDwi6t64aL?=
 =?us-ascii?Q?sYbcJ3UqDbha7uujSPTP8l+xmugNBp1Dex01qh/ydraj2xNbYCnWSx4KrFFy?=
 =?us-ascii?Q?S9KNYpJyNeaxU0W7M0s6jg06bFRAPqykkZ0sw8mFsGYep3hDG9DOVsCclXLA?=
 =?us-ascii?Q?tUObZ3Gn6qwApxPHpcLdgAN2RC9EN9Xn/LxPH6LcyOZ1ilSpdBZv3rPoFwRT?=
 =?us-ascii?Q?ceenClPbgbQzJBljJWxRHMhC+cer80P+x01OKdO04jiFLvf+vANolnnXam5C?=
 =?us-ascii?Q?gClGjgnXd7D77ztTo2T9vK159LGa5VzbHKV50SW8WO8p+cXZSvyjEqQixYuO?=
 =?us-ascii?Q?lWpe3Hms9qwENE5euVyNJHAWOksdtyX9G5y1dnjrj1XkPT+g2SZSu4/ODj5/?=
 =?us-ascii?Q?m3ZvchHAkSqc+uOCdZrTS4apa+NWOx+k5m+SL/RIwRhGHkguMMVXDd162ib4?=
 =?us-ascii?Q?wWFbPeayhKY8BqhNjg++beNL8RBFwD6S4p1Y6P+bo+26Nk5av7L/FU1NEfJz?=
 =?us-ascii?Q?SJT70UPnR5pusBK7CLHLBx5ezccGEEX9YryFS8wbjJ2E6sJY1cRTu1gIeyz9?=
 =?us-ascii?Q?XAE4uIiIUS6lvmzt+1cNbMGtMQfy6/3rEajkFowY3f24VgL2TPwsElBaihM1?=
 =?us-ascii?Q?bzNnGLoh73144QMMHKbNTP5WtvF+YsfpGewdx3fe8wQgCGiVx/sxHTgtOKfI?=
 =?us-ascii?Q?+uOACg/C/7FkHpNH5+C5W0VHZwwlNEdMK0qVIyLXw3FrqoALobxyncR2NZeJ?=
 =?us-ascii?Q?mZu6CnJl57wCFjHf0L68VtuVQNemlBMytkF74BgAjfQaCfHuh4zzP/xf7geT?=
 =?us-ascii?Q?IWEfSIngSz3AHXvJj0nO8sZk/rYz4ckqBcCvMoTyi5BQLdWNu52dsLmjk/Cc?=
 =?us-ascii?Q?1B6Qa/iCJNc58eS/B/R+4R2pMEciJqNPERlCR+Pm/PXRyBqdGNBteSkNaYJu?=
 =?us-ascii?Q?hJzw2QWgv/hUMKmIcp5N//zIxIkPLLBjYWSkGrJdk7OoCENH4WkxObCqX5fv?=
 =?us-ascii?Q?pzXebKv37ond2nJ0B9+zQLFYRO3E7I86KyL7sEHhwqM+xYt0WoO0v2/aQnD8?=
 =?us-ascii?Q?FVyXq5pzBbBdasWtGrL+Py4LX58l95ABRkCoXS8aGdckO7qxN6K+PlvIHbCM?=
 =?us-ascii?Q?tkYPEF7ulju6v4O+noBwiZKbOHHARc44dBSuX8lGINJMekGD5RfZZVoIBpEB?=
 =?us-ascii?Q?I262MNFvx5KSB+ZDrLVUXTwASMW0JKVa9wg/gipm8+KkuKqwKMc6NPBPjiGT?=
 =?us-ascii?Q?3zB0uQ+U+ZXQvhPn5QewQlA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mdZA7XfKdy7ErAWAK7zFZzLt1gKjSiZ4o5GrsXnasGtOPv6W5bYuYJtEHq0T?=
 =?us-ascii?Q?ra4Dd30OqhazaLlWGHyLLc2BDzPBo0IgFq9e+BHdyJPp0BBiHNDZTohNS37J?=
 =?us-ascii?Q?PqE3eYZCH55qJ/ZQQ2MusGlwDK4UHpBgLhi+0vZ0oDxb5PQ2dtEfxIxqCw2p?=
 =?us-ascii?Q?RcnYz3HDHI/E7EmSpXkMfBtjfbr5gwat4PeiwDAuXsQVz/Ik8O5Omc/y1SIy?=
 =?us-ascii?Q?UyyDVaEMaSrcPJLaPpHs1BloVfiU8vwYvPrSMw0KlFlN0US4Su9LprEAHBaQ?=
 =?us-ascii?Q?IPXmOv/RPHvLqEzSdHw2qULVNEq2YtbTwoA767sdpbUUXHusndqZMHJQ9BAo?=
 =?us-ascii?Q?uqL8QyTJOLPXfUdyeEtJKJjdENE0RLXCm6+K/VcdISPcgNcSRL9sXjV2Klpf?=
 =?us-ascii?Q?MVm30x7HE8ECgx+4dIpaDlooxBEuHY3mJnyhUIa1uhNJveUpk7aVIq6hFu01?=
 =?us-ascii?Q?c0ygQ+Gg9AqAHRBj0y6BFazbDNLMdhQTO3ty0NuNeWPF2bmaJ1MsXzsMXjtz?=
 =?us-ascii?Q?lKmtBxC9JR3hljbL+gKC1obVtpFy1LKzP38bHtfxy0c1O5LVx6jSQm4AgKTK?=
 =?us-ascii?Q?+Fx+ayKuBvOekUXsDpDm6IVLyv0m07Jw48yQLu1zLrCAr4MCj2ZVwV0D9M+Q?=
 =?us-ascii?Q?lm7Jf7CMIbQlrPmMPA1fIRI29sNrIySGMQCvhK7/nvH2VASiLkg5AX6m4aAu?=
 =?us-ascii?Q?3+mtahH153SE57fb9hPZOotAeGWtmXZ35p8seHWYATmz8aFfGaN/cfNcjB3q?=
 =?us-ascii?Q?/4lFReCniblNCySGBBsC6QSaZGm14Ku+TCgpfiEZUXgrbJGz8LY4DVXOzm8u?=
 =?us-ascii?Q?03C5AJ6d8wzwKkJKiz+ZKosP3JH8VZymMXZ2BPsK7LF2WDqjyVTPiPtfl4ac?=
 =?us-ascii?Q?HK9jdUl7pqipAHO+E23KfzHYx35jvNKwz5DojxL6mW9OrZn6w4j626Zb6X6N?=
 =?us-ascii?Q?tJXJIMsEA3SEuk6mFeMoD7P+PX5nYGeJhtkZcc4BvOe6eBthbKbzOy9J/fQ2?=
 =?us-ascii?Q?utlk5fXb4Fl9XzbT23VZWVeuio/JBvxGxYcwA2lxjgF/77rZl3UhOzM4AUoY?=
 =?us-ascii?Q?0TY4N15lnUureg4ihjr01ZV4I7QBKIQEBU9oeyfRH2PMMKRwiC0m9LtkmPH0?=
 =?us-ascii?Q?qUpLkDyFRQxmjIZXH5nA63KEO8Rm7qRVBBr4/tB6I6NBCUWMBM8aXaYhjnqs?=
 =?us-ascii?Q?Zjh61fVIg32wXDJumAjB3nAJJnh2eHGHrtLDRTxZjUK1dHiWs5jQIiCTbXcE?=
 =?us-ascii?Q?DuO5vu5bPNyKun1ySYmEzASornQZZv0XDTLqhKjfOS8JYeO6tiljQWVsst8t?=
 =?us-ascii?Q?oD/CcNV34qYZSNIsvIK7BfaHcLhcdo9QJaM4IPVgFf6P1FBZHWwsykYHJfMV?=
 =?us-ascii?Q?qgQx2ZqWgMVLJxzdqf234yinq04n6dREnZ3n/18UzkvRzlRVWSKujXOU4Vwc?=
 =?us-ascii?Q?8LSYDANrbp9abJgTzE4BzOPkTgcRLyHP/cltXSmWFzuXLO33Pl3m3+j8mscj?=
 =?us-ascii?Q?ib/K30GFbM7vDio3YuhbtvqSCimsE5SDRmszeyOmgGaMZs0oF7Cieo+WRG6x?=
 =?us-ascii?Q?GtEZipov6FZlkKZsL0grOvsEQe/2jrcc1ZH7qgdBfm4agRZVUPjgcBESJW49?=
 =?us-ascii?Q?TkIUKmlV50usIJBux/Zh2076BCdIcP65IFr9+YqhQ7siNLkDcTiyPAGYJtR4?=
 =?us-ascii?Q?aNa1D613jn72USqSaz5gEowgWJy1rLw0MEIQrQhn8vXzHjkf+OlHk7yxFRD3?=
 =?us-ascii?Q?v+uu3Zz1+A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fff5a2-d07b-491a-8352-08de6f0f14d5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 16:59:30.1006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv1WjwOgcx62CjqoErhosK6Q2if3anQ52dguPadpp2YTGjudHw03WDE7UhPjBucqIM/ianmCtFRFl+B4IlYUqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7969

On Wed, Feb 18, 2026 at 02:25:06PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> The SMARC eval carrier has a power switch for the SD card compliant
> to the OSM standard definition. To use this as already specified in
> the OSM base devicetree, stop overriding it in the board tree.
>
> This fixes the power-supply for the SC card.

Is below commit better?

ARM: dts: imx8mp-sm2s-imx8mp: Drop SD power-supply override

The SMARC evaluation carrier provides an SD card power switch that complies
with the OSM standard definition. The OSM base device tree already
describes this correctly.

Stop overriding the SD power-supply in the board device tree and rely on
the definition from the OSM base DTS instead to fix the power-supply
configuration for the SD card.

>
> Fixes: 6fe1ced5ccab7 ("arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval carrier")
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  .../boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts     | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> index 2173a36ff6917..74d620dd06b7b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> @@ -249,6 +249,5 @@ &usb3_phy1 {
>  };
>
>  &usdhc2 {
> -	vmmc-supply = <&reg_vdd_3v3>;
>  	status = "okay";
>  };
> --
> 2.52.0
>
