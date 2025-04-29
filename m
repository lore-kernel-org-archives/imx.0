Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2059.outbound.protection.outlook.com [40.107.104.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48E6279347
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919288; cv=fail; b=jZNl06Dum5AuWsT0tNOtoBAvV1/IbcCVeWNpaCtwAZfKFWz1ws0D5dsguLuNtcYSPOvLoZzXIOorXmGKU880GBizgJbEZgoEqz3kawuLgCzt0ZITCXiDqSBDpmNSxpmR9XIWuiId37UnmSrSfxZHfFdwQN0ngNeZiQrthFYaSbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919288; c=relaxed/simple;
	bh=ht6PpnssdpbqJcGpCAtAbbWNwlwn4bU8X0KeW4KAzr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u3sLCmZj9ClVBfJ3i6Nv83bi8GaYowU5fpyEeDMyRmbB2L3x/2yQP/ZMzAQ2aS0cM/wM19+QTo5u1aRQWi4vJF5RjV7NIsQeLz8Z7c7Q8pLowEkSyTLWiL4XIpNCKfZQcsG9LDcU8y5Hi22Pr9fhETKCnLSxrzQrZJHsBmcoD0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B/UvDBJD; arc=fail smtp.client-ip=40.107.104.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B/UvDBJD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2RZ56GPeT/qYOBGS1aR4nuYjoJfwFml/q+1/kL61rJta7PYGLBdw//HeZuQjeLa/wROCKXvzCd37ENXwjLqZhe04iHEADylql/Lezlq0OYRWDrPyiJhyUwNAG9I6dQ1ykzO/7pFuEDqBPRL8H7X3rD5oev+vcF0L6Ic5JgKSIfuYZpUnYjpVXapN7vWr0D9tcgD1WpfTyDSOryplVIyKJMcxLn9l2RTzSjU+cTqxrxKczfPQ0X840y0a1JpvjywtVd5XH+fxIOmgIrTIsmGhyJ28h9cERJtNkTiOMxUWJ+XPf5gHw/G9U4OgfHY8SxBDXMGQ37gnjiwgZnsxfAgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDl3g1tGEchWdWyh36sAegxBXYtTkY+B9cFWhXl5b2M=;
 b=fA8GM0F55wGkGYgFL3qzdglRpHS3Yv4xYpUb/gIPFPbhsrIcnsJTtr9gazujG+aEXZax5gNG5ZTd0K6Q1w6pWm3DMV5Dnb+BJjJ98jtnZHWDN+F7PMmFvLa3+kphkk87BPLolW3pkzEznrnW799GSXd3YIwKW3C+dKcDvBl0Orn+S0VXSXUiiGFHjzXSg6j4mktsBpRAIWdHys8n78nhuPyGyA/P9cQ0T/a4mPdrfSAwCkknvLB1d6WoTAtGlBVUof0hgsYxgUgFZLhUV8BdGI3yhKrnPq/32JZQsKDIeur8DrSBi5zWEcV+Y8/0EfA7bvMqpEpKb9fDfc1VqxiA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDl3g1tGEchWdWyh36sAegxBXYtTkY+B9cFWhXl5b2M=;
 b=B/UvDBJDuIH21xVB16dl1XbexBk28PPCXxra7STpfW9yIhDfBSmNUhLHXIDVB1IuariKzEXnnLgULj44fw1p0+cKgEyiKaD2QyLR53GEqCUQIPzJSqoXUOquUhCSa5wH+I/646XQCP3u+EnUlNUGGmxtcF0QO3nBDIt7hJIW3IDgQ6oKxfekvgPCrFTTnFfKm6Dlj20sBfP+pGd1AytQjWqQygld/ZiYAvi5SxWGHjSPdP/weL6m7LdIcH0JfV+0x1pYGvOXeVOiLpSUWsimmDRqkAHQ/hggPc2zjVxfqbvq8ACRGPEjMGwml7QHPDUroem/qJEaSTE/Z+rc5RSONQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8180.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 09:34:43 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 09:34:43 +0000
Date: Tue, 29 Apr 2025 17:30:46 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: jun.li@nxp.com, alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: imx8mq-usb: improve some tuning
 properties
Message-ID: <20250429093046.3a7gqyjmqhrzr6r5@hippo>
References: <20250429033009.2388291-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429033009.2388291-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SG2PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:4:7c::33) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a0720f-0503-462a-9db4-08dd870112b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2u6F4fw3TmzU4o3hVgzUiXop27vTQpnqexPoFjgPktGDcNl9a+YFPyUow7Uj?=
 =?us-ascii?Q?kszcVN2/kfL+GAVL9+b6F6dp4pmkaWkktgWmsDmhp4EGTGy0aAz2JxHvD/LU?=
 =?us-ascii?Q?LYkdAr0Dq2i1jBjqjurRYuDCcGLeXTite8UfaP95rEggU9FvlJ/mIIq6YJ+e?=
 =?us-ascii?Q?xOMb+KPqwwZZvuKJ8n4lNe3Tk4t4SHsGqOhsKh3FomRIXDQnE3qiVHJiMXQo?=
 =?us-ascii?Q?5IcKXA8k5EMEbzPbGEPc3LRRemT3eSYYmatYyKuxihT5q9arU8F1TPR7tTT+?=
 =?us-ascii?Q?VN+AEier/LEISTKsS8PjTfcA0PUOwIlTmgF081CjiE2FTcnBSZnxFqiRwcPT?=
 =?us-ascii?Q?qvTTVQgTcitNADG2mwrMLzijkvHjLoVAEibelo8uX+17YSQU3tvUyGJ+g5i3?=
 =?us-ascii?Q?p7Ao4IJqU+YX6e0wfJ27WcmAMCFEjt4VJFERUgle03zWnHFfumdSfJECbYWr?=
 =?us-ascii?Q?QZ6RU/9azVRa+65lpyMdUcZRehxdgAtkbx1l2D9dx2yRa5uSLq5MXdjjWrjn?=
 =?us-ascii?Q?ISzl+4P+h67HmTfJrH/9oLmNp+XJft/Z/sGz2Nr3VXyZxjGGzFgcRYp8dDiy?=
 =?us-ascii?Q?h66tnnvB5Ju1MBBCr1ncJcDR/GANAg26cGfrSRm62feqgU+vRIMjvZPXn+ny?=
 =?us-ascii?Q?BiD50jnkwZiZ76Ac6GiJU5aTvQzpb6T4b16eSJfbxY5B3qweT5e5Xxf/6ONi?=
 =?us-ascii?Q?1qEm73xB+BJi6ZcTfXJ2DL555C3n+G40GC6oSc7Nx1+0gQCdXh8rxlpzpiJW?=
 =?us-ascii?Q?/VI78Gfr4Ewwp6h+htx99ohLtHPSO0ROKhWrWCO6iy5i+O4r++Zpu5m5K8vr?=
 =?us-ascii?Q?AAq/kCiILWnF/H1EETMDoGM71cIZFExtp8NuQIc68wCRTQJatZ8Kd6kKH3Cr?=
 =?us-ascii?Q?3MmIpiv623YNSCk69LBadhEl0EVIySeQ5yM8RoCXYjCsoTTTqJq81h6ZF65H?=
 =?us-ascii?Q?Ed56vDEZHpcdVw+Bkcl9Xlvca+wG9C4YzudD5qEMFOYKDd5p+W7+f5WqjX5y?=
 =?us-ascii?Q?lPJqWOkJjQuRLWhwi1SfgWGntPnIQz66+KG4tv/H5+NL1kCpV7GxTwNql0eQ?=
 =?us-ascii?Q?ykiced5jMsONlvY0my+g3TW8MieqiPIgn3NkBJcBweauB2oDQJCecYLvDHF7?=
 =?us-ascii?Q?WE1Bt3Pd1W0MENz1v7AYoLRWzg640GqV6HgRnSX1vqrQaN/zqlu9nBWBW28S?=
 =?us-ascii?Q?AswYPSpHg12mp3x6hpcW2KZQlt9oaRHu9eTnkmhhKpXRs8QUA5DvgWNHvN5Q?=
 =?us-ascii?Q?iwNKuwR2U6jyqQmopDY6URABrcTs/6S/jygRFnS3drZXsRna1QR50P2V8ewI?=
 =?us-ascii?Q?+21mu+oEoXBVd22Kpb5k4u2o7X3bcDQLKbgNZnugGzEUSu227mFp4eCWumTW?=
 =?us-ascii?Q?lUT9OhvBC8x7jQT9Xbx+VWP+GBjnzw1Q3kjIgzt2v6RAn7jmfYC09ksyyJ6K?=
 =?us-ascii?Q?Nvl3PmlDPCr4MOstXiKerO6q4fPMVzyEDeYSZzuiG1xOICcZP6q5ew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+1JNiUpQDY2Tm4Zqzbu0SIxgY+QWSNLX4GBGHxmIAhUajXsYQiqx/y9HW/Ry?=
 =?us-ascii?Q?LMxSN5PRhu10N5VdXJTZzbpah55EIYOaguCuwNUSf/kUK+BTbQVLXMSq0Vqd?=
 =?us-ascii?Q?oZ+EpSrEp1d8MKWi4AH4VC+US0r+kGfR624+D1s0n/rETi/u1pgoR5kv4SZK?=
 =?us-ascii?Q?7fyJjmesXYJMSvd+ChIjhXd3Wdpekh8twsm/lnlQyTJpoOXa8gE0D8ktsj5L?=
 =?us-ascii?Q?KPe9SE4NhhBz7F679/SqsqT3NrZXi/lcEIPEKEsCvvRd6XnSTD8N8Drq58tP?=
 =?us-ascii?Q?PSMyI7ckZLKMhBY9XeC4gkhknoFCdcR8cNHCVZ51AcV6PocovfpASoJcansG?=
 =?us-ascii?Q?Gy05EuV9QH8sQMjMwORjXQ6CAF4MZqmFhnMMo4efm6vdJ462JoDV0L2Krqhl?=
 =?us-ascii?Q?EJJTFPaQoV1b2MZ+izbUOyezsLfWdv+MNmgpSIKqZy+rWw3ay5DvQiMK+eN8?=
 =?us-ascii?Q?YJT2OgIkuJLbrDMYREQozJ6OaWbHS+DsrTJwQzjO8pW/DzJSFE2ZGCrXsUjr?=
 =?us-ascii?Q?tJoTT6I851SU0lX8yxOBefarg/cgiIG++cGcQ4309rHwEJecLrlJE+grzemp?=
 =?us-ascii?Q?re5qWEHdlXQgvW9xW5fL9PGGiycaxOpQWHd1QyWLbnkO3z2DjYSJY1uHGMQW?=
 =?us-ascii?Q?m4Hhgdpp3QqULVr3wKMw6a8HLBIj506MLOPc8T4JV4vLFFtFxArebV+ubwBb?=
 =?us-ascii?Q?J63vP1Ls4svJs3QkPHmvpmXll49OsvCsnxQCx1+oRlcKvEcMohcIGmWzU2Ry?=
 =?us-ascii?Q?ZGKpwU+RDT6216Y4/FSMSVuPB76FaAO+CP1ZcGx3ILwlxDHtWPbixk5pFxpA?=
 =?us-ascii?Q?cz2CL5gHm0b6NZd2hAyODsVuULNChuodUgEnhd9gr0BkJNrregtNdMtN1qzJ?=
 =?us-ascii?Q?f7k4MLv9dtPuMUHP/aX5ZEtgrQpZaQwvHJ5TCH6lSLXonEs5B3VFYm4znjy/?=
 =?us-ascii?Q?ySNMxbfFGySXiW3dN7jUmcWn2AdY4VQH6OgpcOf7aJ/hJTrdTattHWoyVTq+?=
 =?us-ascii?Q?qmKKmzd1srsCL6FIlqtBGp4yK17HT3t0kTwkoYUnf0Hgq1y+sUL42x3kBj8S?=
 =?us-ascii?Q?nex9QpgxC4ELSbdG9ZY4ScEBQ+EHMVdUgb9no4xWfZi3u62JUoytuBIHQsfX?=
 =?us-ascii?Q?RpOxTwXODyxQtu6p7Dx4mM/05UvP6jTuKlylKt7xrw2sx4y1iEwRxysUh9zg?=
 =?us-ascii?Q?wZFPRZNc1MZHlFcZDx2G80zL8s+VchJCB7K8YSpivPkni37dELXeUqdLviCw?=
 =?us-ascii?Q?ev8lGbSqii7rZIsUpnC2SEVZvGgZpszZWHO/wvfaEvDcXS13VJ9+r34qLzw7?=
 =?us-ascii?Q?UhMxFD8yoRYkqCy65s8XfqPhQ7UwNOFvMFKx419MDB2l8AMfs25ltIG2ORy/?=
 =?us-ascii?Q?PjyRpmrYLdQVzw7BxuaJOzJv01YzCkbx67zryT1znGLuWjT1N4n82Ri5QYU2?=
 =?us-ascii?Q?ZT1T5INOj/Uoigt+xv99OwDz5ojnoOhKZvRXJgN5Tv8nx4KDr8SZPFTztu/8?=
 =?us-ascii?Q?yPUOWmzLtaEZ5pG4QyyeeHm1P8peN6FZ+nT64XGgi9N40CW+AOn40LbwYXHz?=
 =?us-ascii?Q?eloi4gi58zDLb9pskuZih1jOQIcv4BGgpAKU44md?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a0720f-0503-462a-9db4-08dd870112b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 09:34:43.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdHwFeOXycvm/bUIsKJDUEKu5VccNDRgMwnlaZ/NVe138+m6lGmHLCCN/CyfpDiq+/zZT/7g6OTVQZKkVRX26g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8180

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

Please ignore this patchset since possible ABI break may happen. I will
rework it in v3.

Thanks,
Xu Yang

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
