Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085BB2F12DB
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434113; cv=fail; b=QXKGK6K2mGxAykuOqK8td1owY5E6rY09e2nbb9r1fVWGR3ggMQa69Id1Gduf7DzT35luJdEKv5BCmJeY86ks5q1ThP4s9NOZxmfWfHH8skJXdpgJ4+FnR9lVnkfZXYhLt99+u9DZAN/l5a47ON5M25iq8Ht0vmD7hw8ywAW9L1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434113; c=relaxed/simple;
	bh=nvZS0NwnH/CfTHqYYPOSNmhPO+a91eSYc3IcPZA2aSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UnlU3mZ7ad7zeJ9fCyJ1sYSG6LJ2dj8WZgdJYQBTxBq+qnboBxP0h38JvUlet1FD0TZRjZLthEvq3Au+CptUL+aq2wXHc2AgnyageMmpU2PGLadDfcrhs9UHLFEq24qt/s1KDy4KmZgb9G3pJXKf9XslbWyhlCofpqYn5L64q84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RizAvIoV; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RizAvIoV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Int8Y64xXRwVXKWwYxFq8+P723M01KDqBmwiYTheQYFHbDeARJEBhLI0IeYebfc5qho34ieiXy9jhYBM/+rbfmB9j4/RHPUOREG0WTVq4bx2apfzvM4YPhPIU2v+zwhSTqay1Saq/QHqAVFWo6oZw6StAjQWsG2cGRdhqWm93crRWF+6vwN4/5fOg+m8i8Hw2LY4bn5nQE08KfPo71NukkPpPBmFGet4+wKFLk0goYi1jRaoMv6jmHO/f2ZGDDn58+2CAsmBtwM7tOsgxnxnZlVyiJocP11+/tB0nI/gGP26YUkDSC4Wf9Hw7EukhRz9HE63N/zesW3EyAgu7rmPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puvaf9vuIsoIhNeDaViSaTOz4biqRNqHxNoUf+FZJ8k=;
 b=JShc2ttLrbrHp+Gm84JVYCaeHip7CjxK5so1flcWqEypIKq8ue0Zrwz8+cuZMrUi3eq66Fs22+UlZi5GQ2o/geRsp+oNpTvu/Re2MHuhm4T5fQ4zyJO152mQlR9WjNrUwgVRee/31r/5uL+hH0In35yL6/0mbmIC2B6ZqBOY6bVtISvaNvCMvTbxd9NHpAoyey7b28eatTcs393pmzewnCYz5zcdZUVHu2twHLmecPAso1VJIkzhx4xoI+5JfnBEz0qHq1SLUMK40tbIDIC11UyWH6mXNMACtrzjyzEABwx2EoTQDOrxfwaDOOS1N/Lj6bU9wAatI5SfQ68A3i8x8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puvaf9vuIsoIhNeDaViSaTOz4biqRNqHxNoUf+FZJ8k=;
 b=RizAvIoVmhlX/dSPwYhw3A0HtE8APDHS4xVsdiYBLlUbefSeF2L0HdxP5XsOEjQkuH0CyLeMZCdjWTXeonCIWjWJetUJoG+k7MTXN7o6L2TgGIMe27aEPx+YViGw2B1PQu4CL9jVUPHybRckWBUOafLga2fd/XAnpM8PzdzQl6j8j2n/vQ8XghMVBmVfvEO3Q11BaCOYHfZ9mrwl3VU3VF4bC0AZz8LTsiqlZH2xtLRXRCuwig+OZ9akvH1jfH4tAL9grmvHmdPzVXVemoY8SrIcTMqp52nGa/d/tO1wIUP4q/2DegzAEX7TETVMvlJ0nz14lPCRm8N7xLjO/RV0FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7969.eurprd04.prod.outlook.com (2603:10a6:20b:24c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 17:01:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 17:01:49 +0000
Date: Wed, 18 Feb 2026 12:01:40 -0500
From: Frank Li <Frank.li@nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 3/4] arm64: dts: imx8mp-kontron: Fix boot order for PMIC
 and RTC
Message-ID: <aZXwdC0R1gzwVqeU@lizhi-Precision-Tower-5810>
References: <20260218132519.74570-1-frieder@fris.de>
 <20260218132519.74570-4-frieder@fris.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218132519.74570-4-frieder@fris.de>
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 29cec45b-c269-45d8-ddcf-08de6f0f67e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8JB65Nl+N5gL9wMgih9xfGzHswB5OHdE/XtVH2R6arVJpVg+J52H/0WFxXkW?=
 =?us-ascii?Q?D8ZKnTI4d+ZHhSF8IDIjYSL5CdrAArg4Z1J+HZFKmlQYsKG2gRfBV1/EhEmH?=
 =?us-ascii?Q?TYT83GXuz6daPW1u5oh8VuO7lGPPBg7Fq2F0H6yeL5xfml8vQ4T1y7cUwjcr?=
 =?us-ascii?Q?4TIjR7Z+Y5rUQIaeDq8ilu3bD455y5scsIruSL3wc+EazhmmjmZ4t6WViYQr?=
 =?us-ascii?Q?eF7dROEVvAowkCpwW1ihuvlmFjvV4tcrUib8IFyV0jXOcmeQFbJN8I9lt1uF?=
 =?us-ascii?Q?LigVcoJrBrDNg472QTGzYQmfbNTk8u6jtiF/zcW6qsRb5mbOZ7YzmNTpiwFn?=
 =?us-ascii?Q?bRclI+DA2FgH101GIthVrD+dGZMZtRPuvYomeje9/QAER6K/CJ6Dy6RwJ2gC?=
 =?us-ascii?Q?OaktWmG8TmNLE0gdk0ffgmDPdYelLqvgUp8CIX/KGUE+mTcRJIifDuMdQkEC?=
 =?us-ascii?Q?FAhwLye/8i+Ug9Fd0NNF+q+Cu/3e95osMDKCfLuwu09XjQjkzCYxAHZDiPe2?=
 =?us-ascii?Q?VCpu0ciPOCi+kyj9y2Gzwxr+1oizNS94urk5BhIe100CtwJUVOpdN6ygUNZ+?=
 =?us-ascii?Q?pEXNzukHbGXIIgeUQdXndSeededJRmjrcl4e390J8qlHY18wGIe+yCxDDFr1?=
 =?us-ascii?Q?ToHDv4iqXg7nrLsD0jLeaLAutniIPXMYLe1cJ9De6282WCRdblWs14Q+hI+4?=
 =?us-ascii?Q?AYh/FhCRysOgzM/Ii/mmXf8BI2QsiLzc9FyehnK2KBI1JAu1ZdFbIb+vOjxj?=
 =?us-ascii?Q?w6Ktsn/aHM/YraJRAlK++0BkQFiTFIAVt7DukAg8ryO6PvR0de2CgNAiCxo7?=
 =?us-ascii?Q?DIfy1OD0Yh3gRy+qs0IaOR6tk0jUhrUWWUaxlf89HmBuUfeuuflXKtizvEzV?=
 =?us-ascii?Q?DK5dAt5aTpjuo1PCW+tq9zOmtVdhxiY3JXvV9ftzOBxeh8xZlUCagTlYLMlI?=
 =?us-ascii?Q?9RxLgJwSbzf5YncaabKAXZl9DNswQIyC0VgavQ9r6PSmuw9CTEYcZGObHhwK?=
 =?us-ascii?Q?BE8hrV3nz9oOkwi3zUWQnXEJgPVJSI70XRqD+04BLFOsJ2JnvMCsYGJ0mS4k?=
 =?us-ascii?Q?Xfnp6R4w3FsaIGxZXu0LLYmnghiyLD+1qngjLTeH6QAhXhH+tlACwU6f2N0s?=
 =?us-ascii?Q?xjXWqeVMmjYrow8FNYHxf/Vo46tuaII/9QSklTjhpl3SiqwhFWeFn05phgcS?=
 =?us-ascii?Q?dugap14RjbVuFf0/+SOvyDq/rlYWN6Hyla/OgW+xTvkOmLqJg5vt1XwTbNpR?=
 =?us-ascii?Q?L3UXAMCz4UOlJ93V2rrjssjOppyQq0sSYcWEyFLzcii0vpUGh761+ntzxH+1?=
 =?us-ascii?Q?PIjA+YqwlPPBMynnsG9HJs3P4Lz0JZJ9AG3qt7kNRxgit9qWZgJQ2Da0Jrgt?=
 =?us-ascii?Q?/gtncpIPzG4s8eDWIbTUsut3SbE0bE/cF3MdCWk9Pv6lo9OAO2x9FNHEpvaF?=
 =?us-ascii?Q?vZVWIgFSpKXXqrZv47MhdT/4zFfh739e2WdaQd1vxHNXrRdb7zjVePpiuLxx?=
 =?us-ascii?Q?/fz95Lg7cdwp/fnbnjBBhHig06QGHNemFSL92K0qQjVG3rREd2YHbmHXPzoW?=
 =?us-ascii?Q?yu8lEh6AyKZZXzaqneey+CkOWdgVI86arnPEtO6hhFKRx5PCn+yRC2ERawzG?=
 =?us-ascii?Q?q8r4FH8essWkIB0RcFYZB7o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tn+0U5VpF6Nv1MkPdm2ti3wJObx67+zql8Y3ARXw5OxxjUrKDUSZAWVyhHTl?=
 =?us-ascii?Q?ul7+hKJpyBSCjQuj7rika0+yflx/RmRIPogZ35uqrJQ+ZdSD5rT4Z/8S9IfI?=
 =?us-ascii?Q?FGVkik8cO6zYExXGzcMO7lLF8c4PUkXFEm9F/YDNsyjzY3Vy40TQ0xiEmn9b?=
 =?us-ascii?Q?gYFLf4idd1Fh8BuSQ9gsLNF3Xl7ayrxo+ssmBFG5utjyEAVa3jM5uj2C8eZ7?=
 =?us-ascii?Q?W2ocTM713Ji2fksv/5FclO7lDvSIoj2fWNAeomwCeSfF8iWTSErRNc2n1hZQ?=
 =?us-ascii?Q?Y1MRqtq9/aEglH8iYtIUZZVVsDwz5g9SSw13/VHIgUjSJVXtDypzxV1u6frL?=
 =?us-ascii?Q?ermAaJyZeipoaaSWLvgqzRSjXzzOEtViAonC3XRXkprocrMty5VfUXtX0QcD?=
 =?us-ascii?Q?npyuirr5WPhsxg/OtVi7jpgcA5+HBX7/v5UCH4lxbcWayauKcomcodXWS5Hy?=
 =?us-ascii?Q?L8mYjKFZKuwBL/7uFzp53IT4RuvwxXCTd2AXmjEPoDfblorzjlyDn2ICj+sb?=
 =?us-ascii?Q?RZaTTKCF7mFXiiWS2I1w6qotvSyNFqlE3UW/xvFLrQgO4yft2Z4XHw2OHyZV?=
 =?us-ascii?Q?fqd/o1kEi8THMGU/mq164qnoaFKZLzFZ/Yki6ETn3UkNyyiZrIGnXNbJM7yY?=
 =?us-ascii?Q?wIJqJ8c460fBzG3b/zRuaAwZtxDofTKoMZqQl1+FiNosbZq1ubjMRfTgVYSN?=
 =?us-ascii?Q?KgxcJZjxkRj4MTtCmcVuCMsU2gW1ilTwwZ+MG7SoaZmetbK8zyPhWx8JnHoU?=
 =?us-ascii?Q?UTc4FV9wcVWEWcxW4KopGOnvuMjAp0Kq1eYCpS7jra2IZYk9ehkgk9nHIpHX?=
 =?us-ascii?Q?rKwoIuoFS1yYNY2r7yLIiBgH76btuK4wUmayK/5daM1oUCun8pImmgUWKmeD?=
 =?us-ascii?Q?VmI59BGE6c0JN/7OgbnyOos9oLmkSVXj05/ROSg2BDCj0jQCpA+dkc+tKXxg?=
 =?us-ascii?Q?PMBOshzmCvycj1RfsXS8HbOho5qOG65FfzOQM+3gaEd/gm9/8gAAFbFwvkT5?=
 =?us-ascii?Q?EfIQzGEYRu6P3DJTxTMHBydAHpxVWZI89GIV6gJFwsaH7K+N7caxVdS3y8ml?=
 =?us-ascii?Q?1K8VlENp3mzQvEjHwVjrVt9ekHkA7BNUTABV1nlTsQs7zPXnSti9fr/Cb7fa?=
 =?us-ascii?Q?T1FOQTarZyFZfXNQx33B/0Yb7ANT8jf63p1MbsPqd9Fe2bZPERkLrCdRIlZx?=
 =?us-ascii?Q?sJEBup6zsGM694F9BH48foXCpcv7csOOIio8Tu4bIlDvS+37IHHJ1Xlkkd6j?=
 =?us-ascii?Q?M1JPFfuuMuJ/HBPSBRt8fvD0nsELBzVuNSxvtzzfX+S3FbdeP0mGwNT9gC4E?=
 =?us-ascii?Q?GwE30F16HWK5SUMT7N9h7iF+es8Gbb1Tq/gfK3ybUnNH1wbQuxKWGdpn/FUU?=
 =?us-ascii?Q?2PhW34FOE7RccB6kXbGgVXnBm6ovGwByET85SLIjWzcr251RwJfGWcoTGbob?=
 =?us-ascii?Q?bQs9v/D4r7QPePkJTUzPtHa0b9S2m2e4DtWVnfqFLcs03sa4KNV0e5oKNCC7?=
 =?us-ascii?Q?FXTxNyhDni2PEpLbpRQkJOxmE52pb9os3qdZr0sh1fhOvd6FBQ6F0fq7hLVT?=
 =?us-ascii?Q?PsU/j8zelyBLQyvjqXu1oH3bK5vlGPq1AEgCECCafai08bj4Z/BZyZiQbzxN?=
 =?us-ascii?Q?5+q630Rsme7TXfj9lHDbtOyCF5bn3yslCK/0dil9XfsdY8eqprAasmKewjSR?=
 =?us-ascii?Q?OhMmRjG/siJsaHBVel451LC5Rfn0NOUoLLIwmoL/rWUrZbQdvmXZhp0zOOGI?=
 =?us-ascii?Q?n0ijLetVEw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cec45b-c269-45d8-ddcf-08de6f0f67e4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 17:01:49.3129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bZUahLpMlbI7ePCRtxOxEyJAQ2sSkrr+xESI7i2xGMUiKcAPuaiLaNltHPmSevGUvrq5IUqignrXH7G3SDZcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7969

On Wed, Feb 18, 2026 at 02:25:07PM +0100, Frieder Schrempf wrote:
> From: Annette Kobou <annette.kobou@kontron.de>
>
> The PMIC provides a level-shifter for the I2C lines to the RTC.
> As the level shifter needs to be enabled before the RTC can be
> accessed, we need to make sure that the PMIC driver is probed
> first.
>
> As the PMIC also provides the supply voltage for the RTC through
> the 3.3V regulator, we can simply express this in the DT to
> create the required dependency.
>
> This fixes sporadic boot hangs that occurred when the RTC was
> accessed before the level-shifter was enabled.
>
> Fixes: 946ab10e3f40f ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
> Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> index b97bfeb1c30f8..bc1a261bb000e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> @@ -330,6 +330,12 @@ rv3028: rtc@52 {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_rtc>;
>  		interrupts-extended = <&gpio3 24 IRQ_TYPE_LEVEL_LOW>;
> +		/*
> +		 * While specifying the vdd-supply is normally not strictly necessary,
> +		 * here it also makes sure that the PMIC driver enables the level-
> +		 * shifter for the RTC before the RTC is probed.
> +		 */
> +		vdd-supply = <&reg_vdd_3v3>;

Dose reg_vdd_3v3 controller by gpio, or actually it is level shifter?

Frank
>  	};
>  };
>
> --
> 2.52.0
>
