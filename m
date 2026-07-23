Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0C8383C85
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784831948; cv=fail; b=d6s+EDKBf/ZInyZ9aLhQv4C617abVJrE1IuYxolPa4smHUHOcOwFp8D0ve4Tc0wVdM9PdWQ+dK9K7FswSemJCB7ctzLEOexvnrdlDgibn7axItZNG/GtHza2Q0mlMq27S86Al9NSVVGkRU6usFZdM3VLeBp1vIgZVR+6eO6PGYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784831948; c=relaxed/simple;
	bh=QD53CRavRRRuQKvnWXKzyyrquoDIrNHHT3r2Dadeo0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XOQBprCbZP2QKiPunJ3hWjHKZr5YMCIyhzDxHiYx2AU+si5Q7ebwWmkIoLc+CB92yLCvpMC/z8hEQYN1caGIvVlqs/bpgjeLbwQx6rk0sLVzhivyIJkqMskOAVqhKKPu3yRzC7uALGt8BBk5LKwxAAm7eH/i09ePo31TNfvW8Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IFpzneoQ; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IFpzneoQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6P8Zl1frNZZI3PacLy/zucqsxyftBe6t8alxFeVkqmSN3E5rwBzgbIdtIRoqNRkN8hjr8yUlPj6lyJL0kY2v/gXWRhO3VtPAqWvtP1z9MBaZ+N5UC+/udTVqY+mwdfjfO5f3Tm+4AxNOS26YrHppMeMupwXTQ3nt3xZWh436uSHFxO6JZsLnaLeLaGKWOaKN7E5AjNXt+DL4z5NA9wba7OZYNnsIbRiNgeEgy0uBY7/mrvD94Lbox9pe6lIQRYlUOrydy3ea4qU84tYjSF0pYPKvHzL9tt0AZ2NNrWreOo433VrgtpplDFaBbje5qlpXXkAOdbm4aY7BPG/pya7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SL/I02jEEJLEbfO48Z0ZnKZB06PzoYlOP/F8sZ/0J4c=;
 b=bBuqB2mdsGwNFZ8aies9kBxEdUI4utKzLPiJ/LEjUBa14BiGEQFEs0AgXpLMwlPEKwDLibPRwGPbtotSidFgl5lNsuQ86j8+QuHt84BcKOp2WeQqFKoFE/OsURnpESOd2ceVMRqR+mDOIjs4rND+wo1lm+hgL7NrzKBTTvOBS6mAWJ4/kV7Yey5pGc9biWJgZznIkhuIODAcyVrGbl7iKVcxOKnsEdHRUCZUcNOW8E1Y2aiqZ07m6I3+wE0U6Tu4cNSLoadGXr2pzVwWwlnlYH8NpRccgfnStH2odGfBs/Rotud2WpH8FZYVHd6YLYMmqWaAbJ5cknn8pa5S8pxinA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL/I02jEEJLEbfO48Z0ZnKZB06PzoYlOP/F8sZ/0J4c=;
 b=IFpzneoQ9JBN5+IrCNxLONn3i29NPbPRjB4/oK/jeb7oMS0iW9h0ltKQI9hpSSUcE+Bf3TseXb3T8PIILLXVdFXe/0blOZTZRNcsC4vCceazKYgeKvJbc49rS7nJ0UlwxvZwIIJIJ/8Kyv2KbcwTpdG6oTnwXc6CV2A3uoH+kELDthELddnS/obL/h24dK9nFiGVZbjB9mbI+ph3abSUjxzcJDw+oCJgzX+Y/QhUhUSr6a4Y8zX3zqRY/T0iT/fNTXIivbadjESUvZvNKnnNJ+ADrBCGRvM59DWEUN9Wut/rWFl/gjgpZaIDy4SOGHPDz2oHk25zaUD2UKrLI9el+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10510.eurprd04.prod.outlook.com (2603:10a6:800:233::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 18:39:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 18:39:02 +0000
Date: Thu, 23 Jul 2026 13:38:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3 05/11] nvmem: imx-ocotp-ele: Remove device-specific
 reg_read()
Message-ID: <amJfuz2eJugcQ1f7@SMW015318>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
 <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-5-e26930345b4c@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-5-e26930345b4c@kontron.de>
X-ClientProxiedBy: SA1P222CA0152.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9e6da9-99f7-4b51-8f10-08dee8e9aaa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|23010399003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bc1YKUkFRedeWAO5VC0ZklYhpjnj/BNa8ai8v/QLrhfCQWaTGFiioJ+afjtMCvk7ZcNOnux0QbG3u0/E2dyXQ9AHNigxMoRwLwm5XJy/WNJ86ob97LIkJYwKuIpCvz35NNd4sMmXwine4YosqEL1lLV30a/xj13oDXayehDNdLNMi1r2B2CFBkjK4oaXbaG+yYl013vYkqM6kVqLk0fmoUx1gQsJdkcw0hpudrxzKbne5oZIekXOE5QjqJYwLBBrKgxoQkAQQZd3B6Hb0b9+Wxl//uDXch5ezrXF61dBgzXfcYwgBToQSyrGdVgFJjL0cIz4EQM6XcLRUJC764KUqWD0H5/I1RwYVLK3RUPC3BKnF4AjwemtW74jInAqIX2qyHm8AYXwNgHUkFKFGEkuM3rFg7ddDXNQmyfGwvFH05rMShiEhxB8pN5QxzMOtDK6k6q1xnXbE3Zt4Npf5gERG7MMg8N89Mb7odjTmb79RDPL5FLIWIHUlK0v78wbINyJXIp8lAxnwamsYw4OlCghab7lKJQAAh8MtJPt3L7eHtyzmGULlpdOyWrkX34yu5abmHcckBUsh8AGATG/jjulzAktjeRyQFTvxACrNn5oPISNWu7PjyPpXLNRzjhxXDm+HyvYNv0o+Hbq4VEagPeBYKAHDsD2/42brkW6hvBfpCI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s85ilHzlWuqrB0oSgL4g7Gei/m5YcPvHN6PIX0bjeFeGOwowsDVYzxPgaDQJ?=
 =?us-ascii?Q?V8sARXPdXg5q5Z96RrHA35yITcuW6tVH8iX9T5UmQEigWAGvl1soVLfcTXet?=
 =?us-ascii?Q?yQoyNi1IG+UQysSbkX41svQ1EjaevhCeFDs7bEJXLJ/VD54biki4Wtdx7ect?=
 =?us-ascii?Q?uGDXdsHHWPZtOQDViAPpiq3lfhyp46e7j1Mir5PHbXHzl68MPAWAXqrRaIfx?=
 =?us-ascii?Q?6TdMN4X/H5SZ44Elm9Iwh0kawazaYWx/fttBw4+s3bUyS2e6pC4tZq8Ntxxq?=
 =?us-ascii?Q?IzDDe5oQE0v3BD4hRtlwVPWPH0bEB3kHeiJKPdcoGS7bT3ptvTZaLDr7xQ2f?=
 =?us-ascii?Q?WSHVhkijlm89iSzmTjm866i2M/207a4CdNBczsfxkvPdCv8NP4Wo8FKXtp04?=
 =?us-ascii?Q?cqvJBq2UG9/dGZUkVB/GG51bYXHcpsUw4E4DNpF8dPEVRbmt9bC0AzrhkgSD?=
 =?us-ascii?Q?a8Je+F5oNFT7Adi45HFg4xWoJNQdIwgH53VeyLjUbK2fq1cw1k9AJfWaKCou?=
 =?us-ascii?Q?uEqPF03twJADcyZHgdIFsLx20hqv2WwYpkaAHVhhUdr/e2RUP5wwBAsLuHf8?=
 =?us-ascii?Q?Hw5aZETRVzyOz+gPAgg3GSnL5nN+JCO6rsDeUleXYaoMgHl2IeeZrmw6D9i+?=
 =?us-ascii?Q?ihsykHXTOGUMWVaJMntGcYSSo9rtP+xG1SQwF5UauMwDCTllVzxNHdaKjgf/?=
 =?us-ascii?Q?GK+sDi6PBy07FtRst32jW0W6XlWIG+I4Pue7Rd73ExphgIPjsqZJ2P3Bgo+i?=
 =?us-ascii?Q?GD+y461NYN9tCDmV8swYnAQxer3SupD841sedGZ7JrvDj1dHtBsChYfmGsBa?=
 =?us-ascii?Q?cTp85ptYm4Bk08FZK0Aua7nTqMbY76t1WoMVQUrSDZTP2V1uKRG0xDoL4Y2X?=
 =?us-ascii?Q?YfMT+2rqJVCEvq8lYCz2yE9962EgtlP6yY84t6ZIRXxStDl6IwwdwX4GLnOo?=
 =?us-ascii?Q?KYnstbCSbPHwe3hdt+DId7JCfe3ZAKlV0uNqTnN2aB4CogwZeST62Vr7d264?=
 =?us-ascii?Q?u//7thtxPEt+jmE8fnqL51Qdl5bb0ycW8EnAI1T0jxr9n52ayeDSsFxWyziU?=
 =?us-ascii?Q?NAi2OmnrOPfHAAN59WVd6qRu9nOtZUHCnS6rNh5+7CAW7+03BbKJpGYbslk+?=
 =?us-ascii?Q?0j8YQ6B6LOAadU4S2GQYD2tIZSgU5LGjVD6sR2FX4sLyIAu5s+sQzWUfkKmo?=
 =?us-ascii?Q?bVVvlYSzil0vyKhzfAmrHmhk+Rl3pXdzn/qBKshA6F4GRT/Nexe1mzPgKi+3?=
 =?us-ascii?Q?A4HoVX02f7Zd5bBC6jDxlaEqQga4JcCniIsbUvyLxOnKqRbPiR7/qOHFXB0o?=
 =?us-ascii?Q?z9FB9IV4svw8bsmTF5DYNPWfeKaJgJRpQVGlil84Y3wig5atvaguLAowtoEp?=
 =?us-ascii?Q?K4g/Mj8HRAmGMayRZHbN2V5jvxixKc/KhYfnvR60Ux9/1/U1DJMMtpBrIdTo?=
 =?us-ascii?Q?BVEQQJjjA7lNvCPEnOIk6rOk4NCmGXt0sj32j8q7Z+nC5THXKN31ZiBsNnhs?=
 =?us-ascii?Q?RMddeVePBHdWth+1hw3YidzybNjrY0rvx7pRxNO3SUGmIJ1wE7bMdGXDMhPf?=
 =?us-ascii?Q?D9l3YaKxHjICAf706WxYjfrqloz+YwahXeKrOpb9nmHN/0L3hpWuhmau8+81?=
 =?us-ascii?Q?Q7rQvJtXM0asUCbUFhRVVRT3X2ZWNDj9a50qQeFqRP3qX+Sd7hXYbY6rRipw?=
 =?us-ascii?Q?7her0Sb6yDsL2T7K387QMWQdkIArbRnrr0tSI8dqGTjVbcRcZi7hAVWmnMo1?=
 =?us-ascii?Q?gqYo5e1FAAC1W7mb6BPan+HQxGX+68IShrPdfHrp1HVbMexCh6oW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9e6da9-99f7-4b51-8f10-08dee8e9aaa2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:39:02.4549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otXJQwtrj1O1eu3NA4ipq01uR9ONwuawTcJS4nUnPhjQqsPv3T6ZnTgrkUK85c9pTyrpM9xauGvGDzUGHItT6a3QBVj06hxec16k9JxHigHTuWfzFWdd3KjqiO1Gn/2P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10510

On Thu, Jul 23, 2026 at 09:27:27AM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> We only have a single implementation of the read hook. There is no
> need to store it in the device data.

Remove .reg_read() callback in the device data because all is the same
implementation.

Frank

>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/nvmem/imx-ocotp-ele.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index dadec19ca252..9d3f94e35508 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -33,7 +33,6 @@ struct ocotp_devtype_data {
>  	u32 size;
>  	u32 num_entry;
>  	u32 flag;
> -	nvmem_reg_read_t reg_read;
>  	const struct nvmem_keepout *keepout;
>  	unsigned int nkeepout;
>  	struct ocotp_map_entry entry[];
> @@ -158,7 +157,7 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
>  	priv->config.id = NVMEM_DEVID_AUTO;
>  	priv->config.owner = THIS_MODULE;
>  	priv->config.size = priv->data->size;
> -	priv->config.reg_read = priv->data->reg_read;
> +	priv->config.reg_read = imx_ocotp_reg_read;
>  	priv->config.word_size = 1;
>  	priv->config.stride = 1;
>  	priv->config.priv = priv;
> @@ -190,7 +189,6 @@ static const struct nvmem_keepout imx93_ocotp_keepout[] = {
>
>  static const struct ocotp_devtype_data imx93_ocotp_data = {
>  	.reg_off = 0x8000,
> -	.reg_read = imx_ocotp_reg_read,
>  	.size = 2048,
>  	.num_entry = 6,
>  	.entry = {
> @@ -207,7 +205,6 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
>
>  static const struct ocotp_devtype_data imx94_ocotp_data = {
>  	.reg_off = 0x8000,
> -	.reg_read = imx_ocotp_reg_read,
>  	.size = 3296, /* 103 Banks */
>  	.num_entry = 10,
>  	.entry = {
> @@ -226,7 +223,6 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
>
>  static const struct ocotp_devtype_data imx95_ocotp_data = {
>  	.reg_off = 0x8000,
> -	.reg_read = imx_ocotp_reg_read,
>  	.size = 2048,
>  	.num_entry = 12,
>  	.entry = {
>
> --
> 2.55.0
>
>
