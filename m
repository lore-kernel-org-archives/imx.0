Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0492B40D57F
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 03:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752087; cv=fail; b=l50YB0auRzzcmyj45n/4uu3VsowrvTTUUzeNU5IpTC0P9P/KwaWwwVRX1GdDw1hHPXXdz2XMGNxp7do7VgH9R9i7dTA0OK6nLHBSdSbH6vnvQh0h9JefTyBpgubYKnbcaSzmS/fjFTmBkc06CWGZ6m7hnX0AMUuQM6D46G5WLlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752087; c=relaxed/simple;
	bh=uYVCJ9l4x2bW8XyVyxBaFKLHeUqmHrLOi8Nktq6tg4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zowc9Ts4R4M5jmMKeaWRyqyATQbcIwW9qDSk9uHeEZvghkhdmDl96cTPYNKIiz+TE/cwKlpQR7ujW/UtIKdlaX/+WHu5d9MxMThSERlnm+wYdHuLZw3daJ79kLWy8PaHAbZjOPRWiUcAHI7YxfSeexdC2xoEuHVJ3pCvBe55JL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DbnJlEYv; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DbnJlEYv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5x1pNz/Qs7haZOh2HKhh6+cUo8HHWZ6z8PzjgDw5j89P4LF5zHz3evjzNzY806I7UxT1A7jsuNWew0utd9sbFj82qQOTUmh6u0moNuhkM0vGhKCX17iuRK+KzJcHLQyAT+lv7Yrv2GpIckUDZ+inGk/XmTFWuAu6pSLSMiikOHl0AystRj39iomwqLsyChkYW0a2BkkBwGzBANfT6poH4HiB5d2Ul5qNJec6kaZrhtypUSTdzo9dN+rskY4x1pZwchofzKhlaNGwcCv2Dqj8u1mqpauw1UC2hXNOggRZL1eAuEHBvrPwqGV5MldBHaOnwK20n6Qp7WlnB0sq9yZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEeWDWHnxzvCYSWQRj89hp35pwqNsoqypDGZriIY7AA=;
 b=vbcDhT0mV2/DnLVSwmu1RL8CFhApZmCG5EDZUIg16TCJI3MIytyLqvAd7owePPi/6M4pqQL23nZm3Ha82CwztC5+AiLmnXBoHaS89DAsKGXU4id5ogRWk3eInuw3oHOKP1Wx6SeUlzCe0Yncs0EjukvLKsu/kPDq2XhK+zOx4+61aXixPW+++oyKfqIr9047U0FBwVhTNp5Usik+tCgdR/rlcr5/arpnpBmWW6HwP88/NiiwRCifpk9u0t01btakUuYIF2BV8oKUAMsU6ypp3+guluLt9ouXWVJCzCoTQ4ReQfCL+Wv/lbN/i/r4clGHZhc4q1KVVgNDTnu1fArBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEeWDWHnxzvCYSWQRj89hp35pwqNsoqypDGZriIY7AA=;
 b=DbnJlEYvYM3Ut4TgnuQPe58R+0VBqEtrfTCFt+qv6/MmaWumAR0sILSQ9CgOmmsf0DtS3QHQka6WYyYBUhJoewL6b4BAnmoItQRLcMSELFotn6XE4KPj2MoMjZUN8Pe1MrwkqxolCeVoaQCW+/f5IIWHDrl7B0XerxhpTsvghxyPZ4W6wZeTiS/+f0p58JtdLaB09ZRtlfFxaCYxmHk2NUDnXJhK4mE1lgEbohLDfynFAL+sn06zunYQfu29WF1oqm0cgADiFnm8AneO9MhiLn6UEJIm/0vlQ7FkgCzcwyiv9eF1KRF/b2OwEDISTSAgJ65B6040weFedV30LRiCvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10379.eurprd04.prod.outlook.com (2603:10a6:150:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 03:08:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 03:08:00 +0000
Date: Wed, 17 Jun 2026 22:07:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: joy.zou@oss.nxp.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Joy Zou <joy.zou@nxp.com>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: pca9450: Correct default t_off_deb for
 PCA9451A/PCA9452
Message-ID: <ajNhBw_fH2SHHU2U@SMW015318>
References: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
 <20260618-b4-regulator-opt-v1-1-c43b1f62aaf6@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-b4-regulator-opt-v1-1-c43b1f62aaf6@oss.nxp.com>
X-ClientProxiedBy: SA9PR11CA0030.namprd11.prod.outlook.com
 (2603:10b6:806:6e::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10379:EE_
X-MS-Office365-Filtering-Correlation-Id: 389ecef5-8df0-4fac-9405-08decce6cde5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|11063799006|56012099006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	H4P2R1DaFQzj9IysK8nVMr9Ovk8xhBvO0Rygb7HLVcK4iOMvKmnbNLJHHLEGlHn6X8UIUUNY64fSyIQRc7kUywfM8KqC6BXDKKfdmDrYRmLV+333G/MMA2ogWf4LcdhoFElBCVzDFAehccihNsrT+46Ygy3u5jHj4Remv6ob+RFqpA1WmpDhIpcFDGGFzvW876yXLYsu1CUOOtYcFKcDEcKI3jwe743QjwWY9BJoPxMDEPZSExG9/vd5RWLtaFNE0Ekxw2grq5RMzkfGUplx5nUGGaWXUl8Sdvo7gKm1AbDHcLGH6+b3JPuIDH93JsOOHKqsgLWhoLEd+wFaV8pV6ZSZTAZgDFPnH3jgsNqHPJwz6ZcJ0S9H9APhnkipHQ4VOP6ViejJyKLvcX6S9pO5iQSiNwZoTtcbdcl0XhwiaITrx4JjrzapvSZjdwpz/3PJ+pD4AZ9HkvMcLRLWgKZhydcYtP/VWH/lEU+nwtgdRvnENkab1DK/j7VefZhypTF0M6X6qwafRy+DlyEvOo6vuiCFSCBcKxqA8VsWLxbhwxw72Wslq4PVojxyV9dJr5PhHPOGcBiZG3pSF+dau0bJeVEO5nishpVoI+MfREtRNhiBVYddLa4lvJey0iR7EyHKw2LRG2ES7Sdno4YL7ErU+4i63IUfwiteggmRLDv5SN2QnNdVQ7lARQvPkp400tV8L+iACeOsQxLQkjvcWMomLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4fLYaLRJEg0jyxB1VJn1vviwXQYWwRBtW0rygWPZBQoQaoR2k0WEVyOQrON/?=
 =?us-ascii?Q?g+OKhpT6to+Xdkm10U/SbIechOC2tI1jqi2FPc0wr0cJqBZIM3m3BiBf/ZWw?=
 =?us-ascii?Q?P+Nr/ghNmdfwzokDDZspsO8QJEbYGqyQ8h1ofV0O7jv/lN499k8jYokw4yO5?=
 =?us-ascii?Q?PfbDNCEtc7d4/0he+ue80U947NBsIHAflxfQnQjhcJB0m449Q3ZNVUbExXzy?=
 =?us-ascii?Q?muBwktlhCctSK/jRNRkUhDmPPocWiglHh6vW/6PR2H3OgSdY0FFo06S8SF+S?=
 =?us-ascii?Q?1Zwho7PRI/gFvHGCC5OQaYO6Y+Jj5jlAt242yhNO6jRvKlTatT8tCi7fuwOA?=
 =?us-ascii?Q?sg9HNn2LbH8i1L74x4hx9onSCugJ3co8CBUAcUn1GOa1pz+urP4Fyk67Snqs?=
 =?us-ascii?Q?79cUffRhS/vweAKNLsirRMS9H8sUFdvZkITd9nSO/R6h5LfuiyoQZUudq1gh?=
 =?us-ascii?Q?27OwispZEP2yAk2jZA3wKHcVp/oHS7iHNYgzMGNKYq5721h2g6FD9fNsw7Ls?=
 =?us-ascii?Q?RHvkKBn6UcuCrc1HpM7LbobcBjf93zqaiDHN1FBB5xz9HogX3vTOA1DTXLET?=
 =?us-ascii?Q?Jtk49rEBWVvG4hKz+UEkz8b07goWt0caGwBccWdRb8ml00mcZVexQRbZOygm?=
 =?us-ascii?Q?xSZA0/nYpMdsI0I9bzYrQWOdf3KTrgha3lmhWTyeE3VWa1UGtHYj/Jpd6LWK?=
 =?us-ascii?Q?AXWHYeN+euMF+A9j+vZvxkd9c/zJ16W3Ktxwafk+9v55GU/joCou/bqD02GO?=
 =?us-ascii?Q?Vcj34IwhokW3P3gSoqMTwK7rfGpHwK7qvo+Sr6EWJxz8/Ps008anl1lWmJZN?=
 =?us-ascii?Q?SebrfpdJIP+SCzdrLMIKje8MN7Jq4elEtiQ67qMnrTa1mOXfXILalXSLAK5C?=
 =?us-ascii?Q?fwBGPuXQfRxCQIx4hBmnJW1kIr/NS7A8NPvRpqlPVRBb4zhgTjxwQTtJE58K?=
 =?us-ascii?Q?k+PWGtqjoTTQLWT81kqiPB9mF97Wmfd0rCofhsDsKhUhtuNScWTccPoQfdm4?=
 =?us-ascii?Q?LHeTuheKK3EBx3OCKFWfhpd0fKxnwrA7M42Omgfkle0vlPeu0ZzlI021nj7M?=
 =?us-ascii?Q?591IVBjFOodU/+oicTEVcERUopI+JNAiBrXyQGFcyjaofEUaK1/gyxfeaCzv?=
 =?us-ascii?Q?pBplJAocabm1KIXXCPCoWbJBa3KPazuc3eA8gFAXMZB+5Chos3CukWFyl0tp?=
 =?us-ascii?Q?IEu2jYSeKp/rqJO6nYEe9ZdcJAhlLKA9U2Mce6E5JCCecygFa+LtvjdnOR5h?=
 =?us-ascii?Q?rURQDZXBTe9ri1Ov48Qa4/VQgN4Ve/cto9s44OgQZDQEYN47x0ESUiUxjN1R?=
 =?us-ascii?Q?0810VKTMeaRGrItagv1DmPla4fkobzymTxIz2AN5ip3aud+PD2XmGm8yPWpE?=
 =?us-ascii?Q?Gc3IsTnxoR6xqQT+lYdwzwwndRk0/RxXTv5qksAJsLzya57wV1HK1e2oVLDE?=
 =?us-ascii?Q?iSNi5tuwI4DwrNY/lCMMujRMu1AXZoAWBAgCbpi7BvIfnWEmrd6Xwo7klaMI?=
 =?us-ascii?Q?IZyOmvtc8ERIbmIUInhE0YGnxf3AUQELbGBtjqLstQiEgvFP3TajaIBM37US?=
 =?us-ascii?Q?A/8s6yWNve2Y9sn/PVEbU0K1S0TzSen1l9j2lNNFzL/2XOPy/uelT8g7/+Ob?=
 =?us-ascii?Q?lXGQJ+haTHTHe5oCKA8O/0kfqNz35kBnm1d6BKLsfC9HVLB/UGWwbXySUYSJ?=
 =?us-ascii?Q?Igcrs/C5tOBBmnldTwzsS76fpPC9PhYY8ZXo6PohRQ4ckpyLgO2oFc/MQSco?=
 =?us-ascii?Q?gP4T8IH0ByZg1w5bkx0rRvYRLBOHQ8RKH8mTXMSv/NQfFSP5ox52?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 389ecef5-8df0-4fac-9405-08decce6cde5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 03:08:00.4944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42z8AK+70SG9TUnMLneGSL4pkkiqpb3DdQWU93FGC2LJNsN9pUdPSWMxnHEHtEqsE7VzVzuWo7VS9xOBdiAWnvlkqdvqbiq0pnm25DVP/vqJQlXN3v0UIUPPcje6gmIc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10379

On Thu, Jun 18, 2026 at 10:03:05AM +0800, joy.zou@oss.nxp.com wrote:
> From: Joy Zou <joy.zou@nxp.com>
>
> The PMIC PCA9451A and PCA9452 have a default power-off debounce time of
> 2ms according to their datasheet, while PCA9450A and PCA9450BC use 120us.
>
> Add default_t_off_deb field to struct pca9450 to support per-variant
> default configuration when the device tree property is not specified.
>
> Datasheet reference links:
> - PCA9451A Rev.2.1: https://www.nxp.com/docs/en/data-sheet/PCA9451A.pdf
> - PCA9452 Rev.1.0: https://www.nxp.com/docs/en/data-sheet/PCA9452.pdf
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---

If you have time, suggest change to use drvdata replace switch case.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> 1. remove original switch case changes, and add default_t_off_deb field to
> struct pca9450 to support per-variant default configuration.
> 2. modify commit message.
> ---
>  drivers/regulator/pca9450-regulator.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
> index 45d7dc44c2cd..c41db70fa052 100644
> --- a/drivers/regulator/pca9450-regulator.c
> +++ b/drivers/regulator/pca9450-regulator.c
> @@ -44,6 +44,7 @@ struct pca9450 {
>  	unsigned int rcnt;
>  	int irq;
>  	bool sd_vsel_fixed_low;
> +	int default_t_off_deb;
>  };
>
>  static const struct regmap_range pca9450_status_range = {
> @@ -1209,7 +1210,7 @@ static int pca9450_of_init(struct pca9450 *pca9450)
>
>  	ret = of_property_read_u32(i2c->dev.of_node, "nxp,pmic-on-req-off-debounce-us", &val);
>  	if (ret == -EINVAL)
> -		t_off_deb = T_OFF_DEB_120US;
> +		t_off_deb = pca9450->default_t_off_deb;
>  	else if (ret)
>  		return ret;
>  	else {
> @@ -1304,21 +1305,25 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
>  	case PCA9450_TYPE_PCA9450A:
>  		regulator_desc = pca9450a_regulators;
>  		pca9450->rcnt = ARRAY_SIZE(pca9450a_regulators);
> +		pca9450->default_t_off_deb = T_OFF_DEB_120US;
>  		type_name = "pca9450a";
>  		break;
>  	case PCA9450_TYPE_PCA9450BC:
>  		regulator_desc = pca9450bc_regulators;
>  		pca9450->rcnt = ARRAY_SIZE(pca9450bc_regulators);
> +		pca9450->default_t_off_deb = T_OFF_DEB_120US;
>  		type_name = "pca9450bc";
>  		break;
>  	case PCA9450_TYPE_PCA9451A:
>  		regulator_desc = pca9451a_regulators;
>  		pca9450->rcnt = ARRAY_SIZE(pca9451a_regulators);
> +		pca9450->default_t_off_deb = T_OFF_DEB_2MS;
>  		type_name = "pca9451a";
>  		break;
>  	case PCA9450_TYPE_PCA9452:
>  		regulator_desc = pca9451a_regulators;
>  		pca9450->rcnt = ARRAY_SIZE(pca9451a_regulators);
> +		pca9450->default_t_off_deb = T_OFF_DEB_2MS;
>  		type_name = "pca9452";
>  		break;
>  	default:
>
> --
> 2.34.1
>
>
