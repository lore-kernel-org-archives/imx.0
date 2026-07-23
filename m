Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1624746C1
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 18:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832170; cv=fail; b=WEA18dQdJ5tf8IRK46y5J004BzaaecRxKhcZyBQcU6ItFJMlbDO0ZVBT6S4ubLjK37rxmizS0FJR0oMtSFHc1TW7DtpBEbNN5USn44nVIuNWVov8DrzTBr7Jciq7+jFXGnquTzvT8spqVM/p2oU4kQTYax0xGAHLWAt+8vNzP9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832170; c=relaxed/simple;
	bh=tK4+Bsn7cKZQF252bSYYIsH+KU4XajQLn6nv0makShk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ov++5/xi7vr3txJAznn99OKZ480KgbJoFQpOSWLjnmd3VcsjvlqIBB3HE3E+9GFjBoncbEgQsDXGDveD43eJKmiA7Nf8RznSbt7A5rZBfDBGid60B+jlRvSkzXcgQtO+F1BePMvJwYi6692/RZbFc162DMo2eNTY4QKMGb+RQkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dBlWVX+O; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dBlWVX+O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGPko6f8VZ2OpUcdZDP/63hWL+eogu/5YGabZr/uPw1s6cq0iunN9e9X9HJ8+VtUnKb62STrxqF3p3B6sjAW1RjtUcJMmdRIB/dm5XrJ6ZKkMRu/R2XSiRssjZjV1q4zNnzQBxErSn9tZJSvLPg2v+igEvjXJuKIIcLMB984H4gOQJGYTZosRP7k7F6FY5zY+BXDGEKycOABQvqVmgJUZCezvQAATHNpYZd7Y1OLz8JFlbtY7Aoh9Od8spZXSSYedh5M/LKSNto4KMdm7BGEeO8TaXZE8EBlam+LiqOaFNzy4M3+IXZINQ9mZ6C/VPj+Uh+e9Q9Ro+zVkI6RekJy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zoQ4NNUPc8MXeB9ymAZb3XzRJsR0T8K+/05wmSo1pY=;
 b=LJuptcwMM5FkgdVMONfaJxyzy82pwbuPdqJevVbWzFkXc2QMIz7vaKKaXMemdwJjMJQ2ZaPkY6gagexCi/QCMo0Z9wBswVka33nX9zwE3Nn5x+w7R8PGoHdzjYi+soHEGaI02ot+EnE2ppzyo1IrDWWQoYLcEz5CYf5dWNeNyeWWsXvH8d2bcTlABPdqYQqnQZfuOzFZufUeOLnSq3KMbcUgDUI5yPMuoEYVdeLmEFqBPZQfARZRYIxSVxecmDeOhpHeXBTjLVTmokajFu0SQ8CGrM+Oo5kecbF9lblTNBv6y2qERefN8MuzW/CdL57XZ9J8Boakqhw3bnjUrInMlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zoQ4NNUPc8MXeB9ymAZb3XzRJsR0T8K+/05wmSo1pY=;
 b=dBlWVX+O7tdbr/jkRcBxjzODiyZRGU/X/+NsM8YQt2BCqhJHAhz71ysG1v9NKeh4uElMzybtu/gcdTRCmCpuz1v88Ab1o3IX/vv0tJH32uh2pjS2/9YZlCm53u8NPwV0Xb6kmBTKNhY3UmFv8CJeku/FZ/q7HQgQkvEkWpsxzckekreLsIidNLK+liXzyNVtleSR0Wz+EHlzHV/9nRUwazCvjuDCyYw86dhNlpPe24AB82RIYxHgdWF6V5uF5eB6uYX5DmW0BU/moPs1MEAyqbvgCdSmqzZuN9Hpepi3oc1yGLEI0nNkPIBcS489fJPA8F6pUYwJnKYRGqJD8Hogfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10510.eurprd04.prod.outlook.com (2603:10a6:800:233::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 18:42:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 18:42:39 +0000
Date: Thu, 23 Jul 2026 13:42:28 -0500
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
Subject: Re: [PATCH v3 06/11] nvmem: imx-ocotp-ele: Use __free(kfree) in
 imx_ocotp_reg_read()
Message-ID: <amJglJGsfw3rjNPL@SMW015318>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
 <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-6-e26930345b4c@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-6-e26930345b4c@kontron.de>
X-ClientProxiedBy: SN7PR18CA0001.namprd18.prod.outlook.com
 (2603:10b6:806:f3::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c758804-12b2-45cb-38b8-08dee8ea2bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|23010399003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sZ727DkSfaxMhhnag1YrOVi8+4mX66IIhg638LCt1PRhMh+UDwdXEqyemBx26/RLELfG+lPKKvjhNVweU6cRs4R3E2mYOOpVF0oENOQ/eKYWChwVG3i6VtweRzrBnRhAJlwelTzNXcHPf6wWObgkamk5qqUhbBOvuGYAD2vYa1jfbqC2cn+LMweheF1tgA7mPNUUGboS2nbfNUjW5ly6pB+IdgJqKaiwIzce0v9ixpEnMY7epLjnS6WAUeBLzESvY9tmwGmjMOXfke2qCyRD9gddb8mAFFn2UYDrxXzYvNU0u09CrSr5Ad3zRSNn+YuqEcLEvYWHXox2XABWGSOQuZTpD3IwYxkGaIggeaiJICgwNNleSLFi5q0zznp3TU/maRnRIqOCAl57ZEASgvhnbNfaj+r2F0xMnLln6yVD8rnq/hM8ufKs8th9ILm7v4fq0qS5hFS9b0sYamMGs0cFHIKxVhBuq00GtTS+MTaKRpBwRgBcHPuNaZIFB3lcFcJVBWMHtVWCgNy5Pt25aa4z2iu4a3yjsXjYbVkuRdSw63JcdzOWUe4aIpfNHnfbsuzgk8TFf1Vqn0Mu8lAe67Q4bxvAV1KD8AAaqvU/m2b1rk+Wdhm49XvaY0+4Whm3oD58HC7s1U2tOv7XHUb5Yv4obi3WXr4zKf9WeCucWMhetFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xB9vyCJ7n5/vgxtL0wToTL3RotTR4qJ7nMjuz9NM4guIg6xAWGaNbjQB3iFI?=
 =?us-ascii?Q?ze1xJ3Zavq8WthjgogOZgL8VG3Oq+Cv1OVKrmgHLz81yp1wZmzdFrqHSNlsO?=
 =?us-ascii?Q?LQA8wQrUXPJOkVKqAg3NsvHBeJZ2pq3voaW93HrX+CGHfK693/RkwnpklE2z?=
 =?us-ascii?Q?Pp1AjYST1AfGYv2EWiwG6hLlirXqaoDxWCbAPGrO/TJZx7apY35AngUt4nXD?=
 =?us-ascii?Q?DXoZMMweXonPKpdyAsMTNxasPTBComdQRTWEgfKLw7kCiyL6WuZZCKaeh5zw?=
 =?us-ascii?Q?FgdWDbTljkozsuNMGBnh3uAmKhINZdDzI0wcwFvZuioReoG5RWq6QfMfelky?=
 =?us-ascii?Q?PMnhnB8YqfIHvsyCTpvZMrdnF1gzKqXuIMpm08/WwRtrV/WJvfprmlAx3fwl?=
 =?us-ascii?Q?cm1sI1Bzfmoy8W7+S9stIzy76hlBM9I0moaIonOXOd4UmtFkfrz3mtfQ65+w?=
 =?us-ascii?Q?+N5dA5Tdzh9SJeQN6O+Rq+Zk4hSGgA7MZX011W9blfQw20rTg+Y3Y15DTYrA?=
 =?us-ascii?Q?XN0Ak9tgl/cdE5uUhAODdZsVWznAEFxLkGLolbEtILcnRsbjxs4HZhaCBI95?=
 =?us-ascii?Q?Lpj0TmTvXP4KLEjvV5HOazmkhavuvjUBmSnMAcuTz8qpvDmiskEzJVKd+Jqu?=
 =?us-ascii?Q?vBc4yw0ccVX4y6XBKuTG1MMaV7bzZE8EwekgpFjH5TsN+7mvuKtDVqsYeidu?=
 =?us-ascii?Q?QFXl9+FQ6Ilb6uuBoaG47vhAkLdfcGwa97Gw2mWSSrf7nqEfrxAOnoXZXHbe?=
 =?us-ascii?Q?/6tGGAtHniGifyC5hcKo+e8hYoSFiK4hMNzy4r/zpEFLsszipxZQf+sQkEps?=
 =?us-ascii?Q?ay3ujbg+2Jd2oNOKjXnHwrLfWGa3LT5PhKB4fcBUU7cZarqscyS63RALIVN9?=
 =?us-ascii?Q?WLuCVpYFYcpXIwQEEhnDPYnC7fTQDpm8dObcDMw+xI9j3SRahL8VM7WLCRV1?=
 =?us-ascii?Q?qt1xacie4onUZ0Dhft8mwzBfxwhhnv11lAFzdjNhzNMn5qq7kMAcce48a6kB?=
 =?us-ascii?Q?BGH4QyKMiNvfIgaEVjE5lPYKSfpsjSno/5SLwRqjrXYbk8KXDJuviCKDv0Yp?=
 =?us-ascii?Q?qCx3q5SURW+EgFQZ1YpNWg5Y88tzSm1ajD/Dm6OOVnGAwZct6G5aRU1bHQ9r?=
 =?us-ascii?Q?PyPUfInC5TJQ8lR5adUchuzAF6h9Kahizztj/MdqrT0lAMIbPiX3vjO5l8TE?=
 =?us-ascii?Q?OZfJaXOl71YPMJg9KoGHxWQI/O7MvWblxw62/k15P1kfUBKCzq9hRsfk9kdR?=
 =?us-ascii?Q?QBQKvVQCaxGiJhFBGI/1jK4kp5ZEU2iHTQ8qU0NqXtQLk2Z1pZMKyVYSxf6S?=
 =?us-ascii?Q?7ChguyQQ4msDnJoc3XboXKUSGl7cWI69trv7UVhggNvKmfFHeXScXJATACaN?=
 =?us-ascii?Q?FWdqgHoxvZnYiiI1yW2jjnK7s39mux3Pe0gC0kZBmGc4tRJH2xHS2O5pEMwh?=
 =?us-ascii?Q?IUmdWGQjZakD+uyEoM0WDHId535hiFJyvHeaju6Y7P0NU4vC8KT2IETe8lyD?=
 =?us-ascii?Q?Z+39WaNML8Xbl1VfCFNibc5WQ/Cr4ei/5IjM48ihp/N5CMjua5Hqnc+HZV1d?=
 =?us-ascii?Q?CFKDQ72px2iu/rlShYliQ1N/KWn24DDltbd5T9btrTil4yOAvvOR4VU93OPZ?=
 =?us-ascii?Q?ZiDzckVbCBv60M/nvAm6RIK449zCTfDf/XL+FzF7uxf3tIg8qxsJG8X0H4WV?=
 =?us-ascii?Q?5eaj2foZFsIO3tIiIonuq4AbxlwhEVpeyv+LuZwx5tBfuGc7NC0gZZ3maUlE?=
 =?us-ascii?Q?QdZEiWbIK/gt1X3ded7pPG7Xe/5rms4cI5IwcC0s00o2VnLsRn0E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c758804-12b2-45cb-38b8-08dee8ea2bed
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:42:39.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCGRo+Z8DNO/vrf2swiI/Wybgz1xfPr01xEA4Fr6PB7+IBJepJ5sL0771EJdhMNaYkb2s5J8QNGKKTVxt7Hw2bMYnTEDbGpHF3L/4+wqVJ/8/lInC/Gd7wLXmP5pZlIQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10510

On Thu, Jul 23, 2026 at 09:27:28AM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> This is useful to make sure the buffer is always freed when
> its scope ends and makes the code slightly easier to read.
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/nvmem/imx-ocotp-ele.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index 9d3f94e35508..47ee6bd176a3 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -5,6 +5,7 @@
>   * Copyright 2023 NXP
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -68,10 +69,10 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
>  {
>  	struct imx_ocotp_priv *priv = context;
>  	void __iomem *reg = priv->base + priv->data->reg_off;
> +	void *p __free(kfree) = NULL;

according to cleanup.h, it should declare at where assign

void *p __free(free) =  kzalloc(num_bytes, GFP_KERNEL);

Frank

>  	u32 count, index, num_bytes;
>  	enum fuse_type type;
>  	u32 *buf;
> -	void *p;
>  	int i;
>  	u8 skipbytes;
>
> @@ -108,8 +109,6 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
>
>  	mutex_unlock(&priv->lock);
>
> -	kfree(p);
> -
>  	return 0;
>  };
>
>
> --
> 2.55.0
>
>
