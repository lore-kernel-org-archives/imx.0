Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85C3E51E2
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543397; cv=fail; b=hW7qKzoGiHtKVy8vX07bP47bAw9ETHKEa7FXuB0ch1aHCBjws85WNrBg1Ui2RWr6UAKEFDa55+H0FmfvnOOKhY6qgHVE1srAkxAMrX1ncR49Q4blXYKo3j/G/00r1RaelTzwtHCUL/8sKBUsHD4GxdITsLsoQGu/iVW6s/qXmns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543397; c=relaxed/simple;
	bh=gczjEbgP1VoU7M0dW3AXuuBQaEw/GHGnp7cBOMc2nXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IoWDTyzUksJr8svaqFhUwe5hf77aABPwMo5rNZMe2Z1qcALgRMormuowpbdpSviP8pKIbnPsT8ZOG8+1WNCxUj7EFj4Xn+W0+H7FP42tbGddkkzFsI3qSb1mfhRqnrR9L6zOWdfJMQEzcyQI+tz5yoejnR2xa6iQPWMYZsr9H9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kifEW6Va; arc=fail smtp.client-ip=52.101.83.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kifEW6Va"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MW0xXG9oPTjxeLwt0QA63h8OSgSuxlRhrRrGUo3j9mnKffWHZzYacXnAPSZcvRY6IZiWEMuInDu0FZFmv0EYFmmlDKxU6/TZUPvexZvWbIe3Hf9iyVxlac9oI78zd7UmAHokMowRfvoJNZseVMxmn0t0IryIivMHcYPFCmWrXAXNs7UFg18Fh335N7RrxrB/V9wkF3//OM81aNSGAsy74mMZ1ky219dHaWw6q8Il3HJya9Of5PQYr2ocjAVWxSB/eywDFlOmLBdWyM/uKKfbNib735vd/Nmb7tDT1kfLGOo/bmAjbEs7jxtodDzuN2YJohuea2exjeJEf1kBLQIQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWaQ79IJFSunAVsbn0YfYYdf+xhiPJOi6GgHf3M2XYQ=;
 b=yMDGdD6dSCZWEwWByNA1JwKqFKyEDdlugxteqyu49PbxRiI/vrSiymn1x/xd9oY6iacDmEVeenFjHjR09Jt5IEFf3FRt455Ou0AMixs25hJKHatINRZuH191j/3UE07KAzFk3VvSiedfLd3IIZxtv1nrYRaeSmYNczf3d0DXJoY5D5j0e1udbZbzDoIZKf9HWeJqPlP8AHbDqCYcclsS+YP1hRx6g7rpyL2iMbSI7ZWZC+we796XpvVQHKEgLABE6W3z599SSNIxx+kXfq6oEm9LTwxjFApSZNlw0xcdObmLLz5gssQq/Ccn1Ynn7e9HKtflpP2K40Jl0VGyaj/0Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWaQ79IJFSunAVsbn0YfYYdf+xhiPJOi6GgHf3M2XYQ=;
 b=kifEW6Val8J3BIknK9nMGIThZue6d+y2A6s1pWnDntO8D02vu2gRBDxwaP8JonPPWtud4eI7z69l410GEMVf4iJXsGG37vQA+6LQEGiH2UKekA6innXNEJQtE8RJd/Ut1Ff6q9CdAZIJT9pd7vfMQ6mtmJqRlhNmNjXRNZIHBiLFMV/CNDD19t2pvbxKzfiZiLPz2a2ZsbEydWXi5Iq0P/CHTnC/nTvRIyC0wptcXuJZDs9CIXmorE890FUdsCuFseJ3lS70Qh8t3oJii9hd+V3BXonl/19zfWju8ANYJTnOMNE69SdD+xQ+aRGlpX68an92q1NxgO2yTRkzFYtgDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR01MB10416.eurprd04.prod.outlook.com (2603:10a6:102:23f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 20:43:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:43:12 +0000
Date: Wed, 8 Jul 2026 15:43:01 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: chancel.liu@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] ASoC: dt-bindings: wlf,wm8524: Add audio-graph port
 support
Message-ID: <ak62VQXmKMfZ7moQ@SMW015318>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
 <20260707065725.312450-2-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707065725.312450-2-chancel.liu@oss.nxp.com>
X-ClientProxiedBy: PH1PEPF000132FB.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2c) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR01MB10416:EE_
X-MS-Office365-Filtering-Correlation-Id: ae63cb9d-81ae-4af9-c482-08dedd3186c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|19092799006|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	eEDwcFB8CdxIcE7C3Ky+1ejRZZ5P9UYF42xNQ5U/jRPgZHZ3yxDoyK43ZZ7BIrXgcbhAQLpq4Vjuwa0rjL4/+S57vrgXkEhPVYMgcROeuBtK/fbarMxNvdzYeRSYHP3wFCkL9gqxrB1AXxb34KHBXdEIFrG9nX0Ylzc0HGUtAQvxJmPiSazRMoKSHfEUfiZLo5l0z0R7Jpj9EqKD5Bt0YHNh+d9Ez8Ckjh6aXy5NhY/GDSlO6GJT5R2MWdWKmiZa9qDvUMn0VxQ81ovMlfdTi3OxoSPmJE92SrSi6LB2LRlZ4PN5fjQXe6dsjwDJaJAMvieZbzqlEGk8tCira2tcN81gQtz887B9MQFo2vun6/ANgjm7Og4+GByu8jhmLdtU+wg13zxrtUORn9WwvW8X9CDSnrvSx2H9qtQW9CrpyCAqWK5cp57UudwAct3z1gfCQC7E3VVXJOikp9N19g/tO23Xdh1OOJLv/obUi6IEYmK2/isY/G7BGtUNYRn2jfXe8NbI3L0VDAZOJ+jqp5HSXbWYJ+sHgq4MvZff99f7tpzjMJ4y+90S183EL54dOm3sSPTdCfh9IPLNpJyV6rw2l7Qs+NmI2BKYJ1Hqkye2F1b7KcYqeJcfLG/PKwX3jgxbv0h1g5LcnBmWk12+a2vOc5bpxkwLAc7rWyquUuWahVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(19092799006)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AJN7YPfWHUvLZkszKb/4UMGC46YFiG95gEkTzI6W7vcymiYPZrGaIkIm/DVa?=
 =?us-ascii?Q?aJAqrvJ9QLi85lBJjFR3G3uXDZm04jFJIkkRHFrRLNVzwSBrDBDXeslFnayo?=
 =?us-ascii?Q?5wYAIYI4cGBqjYECZL9OjsagbXwD2Gz6LlQ2OLBmQOWWzLb6rJPi42MTQ+CR?=
 =?us-ascii?Q?h/fX7YtOHaZs6hrZtk97+Q3XByy4DYw0o7Bmasyczy8Zbz2Uoc1R+i8tu61O?=
 =?us-ascii?Q?2w994N4lINQOsokdtIowlw50dbNybiTwKjr7FG480wbKVn1IUPFXY3ltAU03?=
 =?us-ascii?Q?N31FL4iJpf8PVGmxOS+s28wFiTEi3DGrQPtwlrxk3SawI2lJSviPQzjKEEyl?=
 =?us-ascii?Q?122dCdvH2RPm2E/GXIF2WmfXinKZ5CLvtsa4hRI+xM5Yc6sW3VtJfGoWW7sR?=
 =?us-ascii?Q?91TEYXjicEDxa/5hobEkFBIbWTj9EfgCrQEGV4Tq3hZgtsAYA+sgvi3v0OiQ?=
 =?us-ascii?Q?HLhzWylCt0viF135Ntp/icM9OsqM4fnpE9bqwfFrgMJ1pNpXRKcdKG1vkXEH?=
 =?us-ascii?Q?jwheCvHAu6wIsmgk8aYsscKlN6I7o/gITe2WsBIKvhks0UORWU16RuJAWaP5?=
 =?us-ascii?Q?tp1jVmfN8bfQI7RrlpXz01eMoOQuIZphysZkuB2FMsTvtUmE6ypHt+0O3mIs?=
 =?us-ascii?Q?rv/DVpZoLt0zERpuZg8bpDOLHCBwHDpMBzfcKD3+qBNbSm4UdAP4F1DRbNha?=
 =?us-ascii?Q?N2cDeacMoVc1hqIxXoCUnAwbMfpQjbRt+0wUZHmFEeBwA0XZd706V6i4PoSA?=
 =?us-ascii?Q?kz//GjGVZVCo/5bowvMmQ1loNf13JRK1zTdqUHiJQ42Xjl5duk5lxaavYfd0?=
 =?us-ascii?Q?90ULArzze0I8e6QjOkLiB7r7Mc1Vc/aNoI5v0lERwyP93txhzSFmAUb8zzbd?=
 =?us-ascii?Q?9KxMFYBBbb+XlPpV+xMjmFicS9TGi/JcUw5K37fG7TafLUVLPdvwIbaNas4U?=
 =?us-ascii?Q?l3yH9G6Z/Le8wSvvp8xWgFmd4pHe0WDr6fdx4Tzjv1hbu+pWwz7vu0KOAyPz?=
 =?us-ascii?Q?9MdFrdFldzKvYMD7FKOctUApRP6xVUuRPzKHad++lF456/rRYeIYM7lBPn4Z?=
 =?us-ascii?Q?rQZJEpxrsj5A2h8KB8GK4pOyh8zNxHIrCkmymrDOPBkCd/K1xAN2Ajmg6+mz?=
 =?us-ascii?Q?Dn7uYlfoLzbFxxqcgC4xw0kF5l5gbt+Xec20LsWxJjMMVAAcJe9pKpxCQUjf?=
 =?us-ascii?Q?dOSZUtqmT44KYZW5EUboBBK7CIgT/z3p2ODFxCEQjnND4YW7VLSSzcCKwt/G?=
 =?us-ascii?Q?IZQNsktGAlfmncfqdiBMU/6685jChfz4q1WdIhW/saOpDLu4dY+uQeG/cP+b?=
 =?us-ascii?Q?e7P0c5N5hs4bQccJcpHexM71G1sFoxRaPHXF7ocY1vLCgNF91JoHJzHSFCVb?=
 =?us-ascii?Q?uxZLOhpjhvk8R2z0TuYxElzk3hLTC+gkksZxOu5K2asy/P8vlLPE5BgdZseH?=
 =?us-ascii?Q?jH5nbPqbyt2C13g41Cfh63Cg0YLXoNk8Wo162tWh5jN9sieWOrn3+8/oTkYg?=
 =?us-ascii?Q?AMqeaWRJmoMi4/3sJ42eHwDhtSvAejH6mfJOdjmuz6jJ0AU1oFCg3PNiTScJ?=
 =?us-ascii?Q?8u2MHIb7t4ur2z22DWu12PzZwUssS1De6OUnK8VQYuPN/N1666PuuwqmQCl3?=
 =?us-ascii?Q?550TSeI0KF4hlRsInhP65ThlDXL4i/E6TCNM4Zb7VzUY0Qlcs6WnX4b0QSm7?=
 =?us-ascii?Q?I7r/8JQKGsRjgw4dIF22R+hUGq50GKvWT8qNFs8uhu8Ar0k7qZRnhHmNq+DW?=
 =?us-ascii?Q?rzTT7KvamHDRtQkoRcXzSrrzSWkBqG5541DOebXq2nX92IgNiEix?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae63cb9d-81ae-4af9-c482-08dedd3186c2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:43:12.0450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjilHxvQhEevrQf729jHqpWc1WcmipYsfjB2Rn6vqg3wPZcUp2XAIarHEaHPm1wz02+RnSSDul1n0CmJElkJ3/2te1CvdyS9bGzqkPFmn8s5EIhgdjmHDpstYJ+Wu8he
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10416

On Tue, Jul 07, 2026 at 03:57:20PM +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>
> Add port property referencing audio-graph-port.yaml to allow WM8524 to
> be used with audio-graph-card and audio-graph-card2.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/devicetree/bindings/sound/wlf,wm8524.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
> index 4d951ece394e..dffc41d5f7de 100644
> --- a/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
> @@ -24,6 +24,10 @@ properties:
>      description:
>        a GPIO spec for the MUTE pin.
>
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - wlf,mute-gpios
> --
> 2.50.1
>
>
