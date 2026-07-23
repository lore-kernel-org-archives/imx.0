Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937B447FB04
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 18:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832532; cv=fail; b=YIGVj34O+EWMSDNlt1jz6LifNCtvq95ab/DHZnAtmHLeb8r9y3nSnF0vmrdh7g/xIUZY+cBjDhTzxyeDyup87L82eQcllTWHZs8czkKP0W1T8imk8ts6wvVqFQm2GrBTcTmHkW1v924rlsXB9PkGb3H/AcF9neldmTmWvfZ6fws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832532; c=relaxed/simple;
	bh=ZiHfAsOierbSpsDd9RdY1RF/vqYPg1gE2rDYacEOfvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DFjSFxWT7pzUtLxySQPGQxqjZJWmCp9fe0SdBgfjg3nT0vVyGMgvBLjNBlpffdvJtGtGZYjkyF1KPmXGf+QnqYbuh+/MmJgF8d0FH8w8AJ+0APtEeeIoPAEicW2nULXSLenIYbWc/Lcmxj5FIiGllX7hmnq1eT7UOIpfGCEiYeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qrNFyQ/x; arc=fail smtp.client-ip=52.101.66.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qrNFyQ/x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T274q/HR5ZrEJm0i6kbf8e0r9Rk0ipjWixM5vHhotaRZGjko0oPXYthwVjwmIjjTBzYholu67GmIDbpULwmu/bnkOhKx+XZi9/cTmg95ju/oZ+8Tj8T2TO6k6T34B8peyRV94L45+jg1lwDCOrSsqPrRB/lzJ0Gr6pwG1wX/SFfhp/GLJ8/RYusVUUEG24ArOq92qdIQytaAxwbutDVywbSw8scqYp1Y+eCwH76yEodNoubosrvIcP25K4zLA/xrfKvgGAcWBgYu/WqBusIgz3ZR69k5sX9X/oU8bP8Nx4grJWTIXSebUMg2BMFf6aILZh2FaM7HNMetDwiDtf02kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCKj6rf9OTDMyvL5Sh71GN1MB7motu7Pkl5jtf/LNzs=;
 b=tD8Qhqjz2h95C7EAlnrFNOs+2kMfIafTheA0Y09UhRI/xmo5xmsFtyeXlNwlngnmPxJ+NlTPlNKG7p5evh6wHOWqwAYJhvVdCTRat3jPH5J8roWIVl/HABCPo6gfI2hNn8sIeWFvgyH0kIUhfkxkRTmwcW2gbGai4WaeC4Pphx4OCcRkQlt+tdQeaqDqqMn2SVBuvskE468BzSLFDyDKqO49e7WNAjKBvNOv/4w2LrtXyuJFbMbsCtBtTHFwuaG3wUzQT5A9mByxBLXcVTfnl4h5PlmUBB9zoLfmjsv+7e0lZLRniUXorgkXafUOKSyWhqBKTSNUvvpDZE90JKZFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCKj6rf9OTDMyvL5Sh71GN1MB7motu7Pkl5jtf/LNzs=;
 b=qrNFyQ/x514IopMjHAjzuXwcqx/+bFl05MigcnXLKVQ7aAvdt9myExWrV4X+8lc3+qaKN5lcWKKS7ChncpDM/bNcpd4d6eYWgjXLiDodUnIDrzPfZpibywKKG+lle+RZRtTpH6tPD6GCiM4JRvZWNvrzI5pBVjSf70xTPLm4Y8PmlMHqIRxn3YNfqhX0FRDIhROgwivVDVpC4FD62Cf0BOpSTvexOYWSeNIjlF4nJpVpem+NvYsyEoeiLiaqW7qiUzoKS4ROtM/CU83qPSJ1P3O1xgqmV9EmBswAc5r/YtooAQhW4aPfS+T1ypWJyvdrhy6l5fKC9JrOCEfRoJGzmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10492.eurprd04.prod.outlook.com (2603:10a6:150:1e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 18:48:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 18:48:38 +0000
Date: Thu, 23 Jul 2026 13:48:26 -0500
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
Subject: Re: [PATCH v3 07/11] nvmem: imx-ocotp-ele: Support the ELE API
Message-ID: <amJh-rtZH--Hu38n@SMW015318>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
 <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-7-e26930345b4c@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-7-e26930345b4c@kontron.de>
X-ClientProxiedBy: PH8PR22CA0010.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10492:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b44d02-51b7-49e6-2cc3-08dee8eb0214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|1800799024|366016|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pdvrpAPGLCRQPKirWg8V8K6Kw3tLVBrHW74ClDiIZD4MZdYlZb7aQmW4n+9Va7s1sixl9MqkS+trpHynLLCwgvOGw9aoXbqAFhQDatQeFmBN5PTC8cOl1aLS9QtyIeBetNevawVwoO1OjnO0MKXvJqnCSCGE5jKi1Zpo/edpaj2A3bubdUSEx85XMHfQcBgqC7XCsQJ0LpGYBw2t57iCbe+XG4U2BaMXndKV6dnanbJQFyq11Ew7ydt4KM78IOapluI+P1KTFKtdh8ipivFO3zouXcvqtKzuW0lmm/SD6pjVrqQscJDIrwYl7joXZ79ugVv1HOfuv6/t9G6Ge3IBSxKu8eOH7Td6Nli4l7UZzo/CdFjFnc4Q3M6qVtN4tExa7qmMNRuuTKSlV9Ii8D/euLn3liuierb4kMINalXkYxcfovmymubGhrzDs1SxpLfeyoq8uHczpHOxO1eIp30i8+0uFcw64P79OlmPuCsZbPQEG5bWQMId4H2ByVAII7oaeFtnoQ793V0TCkaiXk2WABPraQOI+OfENhytJwdoVmGazTAngOZ3D0wZL9xmjksA1wrR8cziNKga9CSmgl1a28YVQMdC7LC0ZziHsgQZdjJJDr/Hh7kECipQA29Am8q4RFB+6jXP0x0lxNh3Iox+JszBTdoO87S9ZOFydsrGdbo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(1800799024)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d07dmEAr2Ni+uNclHUjXov5ifVavh43kiszY9k2dVeNE6CqqQ9wUIkNlYv42?=
 =?us-ascii?Q?ZiugJT5Caj/oa3t0Si5y0TuHyEeP0Kv10qArM4WsBZAlZzNh92fpiUINljVG?=
 =?us-ascii?Q?I4MpmxT2akSPo8M6K4Sl2rmoBpyGxCskQSMXm4LQ+A8WKePIVtYfsrFgWw7y?=
 =?us-ascii?Q?D5197z5cXGJTgkjWyZ+3SNwbaIRJNcIp1TonBs7zh6Klt08M18QjZiMWlUzi?=
 =?us-ascii?Q?5D160nLMzi+u12V4irc2FPafYrDOUEnNJKgwhMxKBA5ZuAEK1LTEyFgVMg53?=
 =?us-ascii?Q?m4H9WzISDIR3HOMlAWiFwfYSKn3zfG3JwyBkV11OOkY1abg+3JDjtZoPE0cg?=
 =?us-ascii?Q?Q6+4ARLQRlrUVKYr4DAlDxHFD+Blmb9s6RA3yLGZuVtLgYvggEUgteW6yQQy?=
 =?us-ascii?Q?PepKT7qL0Wi4gQow2QBoSM78rxXbN/AiEGnQ7u0BGT+5jZpFcskLNGmM4Ewr?=
 =?us-ascii?Q?Km3PHludQPT3G0ZNzbyTEE/Ug5Wqy3xrjDLgtfd/aFMZB/Q5+aPQ91YJFhg2?=
 =?us-ascii?Q?d3pIERy00veFDuyBSkIzoQ/WApWt0SDSZj4igc0J49T+4QtwdJECF7Q9WR5T?=
 =?us-ascii?Q?P8OuWTiVdwW54FTOuGWZGC5DYR0GlQwXhbAg02AWz2DrKc2EnJvMSyiqwfCu?=
 =?us-ascii?Q?f3DEMh7XUIUEBNibpZKSFIhCMLnwgda/jg7KW0qZFFPVk5NqsBdu8lWPOJgc?=
 =?us-ascii?Q?snwF/Zb7zFBEPWEe0xUgSvwFG2AsK3JGeaEBqs6QdY9ghQAO0MqSTyngZwVt?=
 =?us-ascii?Q?7762D9dW/6GLHkIw8BxcVwKJraWjqQSab56p2mNLksKLrf8GfiFXFerUk9+O?=
 =?us-ascii?Q?Wo0prCZ68P7/eG2lKht1zphbsqJuiJBjIg/22Sk8MejgpC0TgKCEah9V5C34?=
 =?us-ascii?Q?o2qAUUE3QZoiEbVvVKieO75BAcWWGBykf2+FsEnB6tjmJekoqmJsZqMtK5yW?=
 =?us-ascii?Q?JacKRNp95Fayccqt/Z8offYWBsfj3ooPtauZPWda+AkqutI7qLNqBAODYL9I?=
 =?us-ascii?Q?6/fBIdx5GF9uWDKhTGqXkSbQcSJGqJQ7kpcejsTclafOxU0C3dUKyk4ECKvh?=
 =?us-ascii?Q?ZgMs89USTA2PH3J9hP6JtWsPgctnGwJ+sNYboPnVfUV44vYfra4Z2g9UP1V0?=
 =?us-ascii?Q?idwqa7gxWIC6FsgRwELSJ00S3wzzBhuJ4uMDspqJfZmpsw3e1Q6xys5QiJRP?=
 =?us-ascii?Q?ANf5Nw8amiaw8vyb638ToZrFZZnBqk2VZierOKxWnlHqGn46/hSim3P+X7L5?=
 =?us-ascii?Q?bBlnNJWDIyu2fGQ+rpzn5I9NMMtjYPxTPvPqV52J5rgI9YRiQnOg2uES1G/c?=
 =?us-ascii?Q?572ev82MOuM9H3zPGnftDBfFpLB76qWJXRdozIR8PI7Xyhpawk/dJ4FZ2ox0?=
 =?us-ascii?Q?VXvN9Ym0o+pIFVFLrD0usHXW7jtLPN+zze76t9NbAp28rEJ3+TpOhLaRjUM/?=
 =?us-ascii?Q?f3PrH6Btb846+ScZBL5q9JIr2FvwVDbUrtxf9Ol7LbVA9sIcX6lYsbn5z1/V?=
 =?us-ascii?Q?zIQGkxcFNT7peA/l2WAEpuizFP5pYryLeenQL57poYSVWbb6Wy6kTa4BAG0O?=
 =?us-ascii?Q?AgLjmNrLKupeDweCg+XyIk6OKW48aMirGOZRT2B4eBmIPcLv0g/NXkm+TDRw?=
 =?us-ascii?Q?YoOQZcBA/31s2NxGY3FtN75IwGprLhKylGBs2yWXDKXgQA3S3vdOFAYPZJQb?=
 =?us-ascii?Q?zSlFrij0GBkXjAnW0QEoIuvUQsARpcT9kPKQpqhpn3i+dtQYyIHXfTysU89f?=
 =?us-ascii?Q?+ELjhZ5lmTFCRh2JtD4EEkR65q6zKZbqlcHOBgzXM4TzvaZPS89K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b44d02-51b7-49e6-2cc3-08dee8eb0214
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:48:38.6361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSkOd0YV9BskBUY+QY3eXdgVjIGHanzfI0PkbKx0h4Oz8gmLJKEAtW9LfkeZDy8zPZiDHacnQabw53LtdejFtp5rZ1GzHjPTIBKEC3wxY9swvfpk3DEss+/4hC8UZXgC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10492

On Thu, Jul 23, 2026 at 09:27:29AM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> The fuses inside the Edgelock Secure Enclave are currently not
> accessed via its API but through the FSB block which provides
> limited access to some fuses.
>
> The ELE API allows us to access all fuses with read/write
> permissions. Therefore use it as primary method and only fall
> back to the limited FSB if the ELE API is not available.
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/nvmem/imx-ocotp-ele.c | 178 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 177 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index 47ee6bd176a3..6ac7d588c4bd 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -7,10 +7,12 @@
>
>  #include <linux/cleanup.h>
>  #include <linux/device.h>
> +#include <linux/firmware/imx/se_api.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/nvmem-provider.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/if_ether.h>	/* ETH_ALEN */
> @@ -45,8 +47,113 @@ struct imx_ocotp_priv {
>  	struct nvmem_config config;
>  	struct mutex lock;
>  	const struct ocotp_devtype_data *data;
> +	struct se_if_priv *se_data;
>  };
>
> +/* ELE commands and message sizes used for OCOTP fuse access. */
> +#define ELE_READ_FUSE_REQ		0x97
> +#define ELE_READ_FUSE_REQ_MSG_SZ	0x08
> +#define ELE_READ_FUSE_RSP_MSG_SZ	0x0c
> +
> +#define ELE_WRITE_FUSE			0xd6
> +#define ELE_WRITE_FUSE_REQ_MSG_SZ	0x0c
> +#define ELE_WRITE_FUSE_RSP_MSG_SZ	0x0c
> +
> +/*
> + * imx_ocotp_se_read_fuse() - Request the secure enclave FW to read a fuse.
> + * @priv: handle to the secure-enclave interface.
> + * @fuse_id: fuse identifier to read.
> + * @value: location to store the read fuse value.
> + *
> + * Secure enclaves like the EdgeLock Enclave manage the fuses. This requests
> + * the FW to read the fuse and returns the value reported by the FW.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +static int imx_ocotp_se_read_fuse(struct se_if_priv *priv, u16 fuse_id, u32 *value)
> +{
> +	struct se_api_msg *tx_msg __free(kfree) = NULL;
> +	struct se_api_msg *rx_msg __free(kfree) = NULL;
> +	int ret;
> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	tx_msg = kzalloc(ELE_READ_FUSE_REQ_MSG_SZ, GFP_KERNEL);

the same here

struct se_api_msg *tx_msg __free(kfree) = kzalloc(..);

> +	if (!tx_msg)
> +		return -ENOMEM;
> +
> +	rx_msg = kzalloc(ELE_READ_FUSE_RSP_MSG_SZ, GFP_KERNEL);
> +	if (!rx_msg)
> +		return -ENOMEM;
> +
> +	ret = imx_se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_READ_FUSE_REQ,
> +				      ELE_READ_FUSE_REQ_MSG_SZ, true);
> +	if (ret)
> +		return ret;
> +
> +	tx_msg->data[0] = fuse_id;
> +
> +	ret = imx_se_msg_send_rcv(priv, tx_msg, ELE_READ_FUSE_REQ_MSG_SZ,
> +				  rx_msg, ELE_READ_FUSE_RSP_MSG_SZ);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_READ_FUSE_REQ,
> +					  ELE_READ_FUSE_RSP_MSG_SZ, true);
> +	if (ret)
> +		return ret;
> +
> +	*value = rx_msg->data[1];
> +
> +	return 0;
> +}
> +
> +/*
> + * imx_ocotp_se_write_fuse() - Request the secure enclave FW to write a fuse.
> + * @priv: handle to the secure-enclave interface.
> + * @fuse_id: fuse identifier to write to.
> + * @value: value to write to the fuse.
> + *
> + * Secure enclaves like the EdgeLock Enclave manage the fuses. This requests
> + * the FW to program the fuse with the given value.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +static int imx_ocotp_se_write_fuse(struct se_if_priv *priv, u16 fuse_id, u32 value)
> +{
> +	struct se_api_msg *tx_msg __free(kfree) = NULL;
> +	struct se_api_msg *rx_msg __free(kfree) = NULL;
> +	int ret;
> +
> +	if (!priv)
> +		return -EINVAL;
> +
> +	tx_msg = kzalloc(ELE_WRITE_FUSE_REQ_MSG_SZ, GFP_KERNEL);
> +	if (!tx_msg)
> +		return -ENOMEM;
> +
> +	rx_msg = kzalloc(ELE_WRITE_FUSE_RSP_MSG_SZ, GFP_KERNEL);
> +	if (!rx_msg)
> +		return -ENOMEM;
> +
> +	ret = imx_se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_WRITE_FUSE,
> +				      ELE_WRITE_FUSE_REQ_MSG_SZ, true);
> +	if (ret)
> +		return ret;
> +
> +	tx_msg->data[0] = (32 << 16) | (fuse_id << 5);
> +	tx_msg->data[1] = value;
> +
> +	ret = imx_se_msg_send_rcv(priv, tx_msg, ELE_WRITE_FUSE_REQ_MSG_SZ,
> +				  rx_msg, ELE_WRITE_FUSE_RSP_MSG_SZ);
> +	if (ret < 0)
> +		return ret;
> +
> +	return imx_se_val_rsp_hdr_n_status(priv, rx_msg, ELE_WRITE_FUSE,
> +					   ELE_WRITE_FUSE_RSP_MSG_SZ, true);
> +}
> +
>  static enum fuse_type imx_ocotp_fuse_type(void *context, u32 index)
>  {
>  	struct imx_ocotp_priv *priv = context;
> @@ -73,6 +180,7 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
>  	u32 count, index, num_bytes;
>  	enum fuse_type type;
>  	u32 *buf;
> +	int ret;
>  	int i;
>  	u8 skipbytes;
>
> @@ -93,6 +201,19 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
>  	buf = p;
>
>  	for (i = index; i < (index + count); i++) {
> +		/*
> +		 * All fuse registers can be read via ELE. If the SE device is
> +		 * available, always prefer it.
> +		 */
> +		if (priv->se_data) {
> +			ret = imx_ocotp_se_read_fuse(priv->se_data, i, buf++);
> +			if (ret) {
> +				mutex_unlock(&priv->lock);

you can change to guard(mutex) firstly

> +				return ret;
> +			}
> +			continue;
> +		}
> +
>  		type = imx_ocotp_fuse_type(context, i);
>  		if (type == FUSE_INVALID || type == FUSE_ELE) {
>  			*buf++ = 0;
> @@ -112,6 +233,32 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
>  	return 0;
>  };
>
> +static int imx_ocotp_reg_write(void *context, unsigned int offset, void *val, size_t bytes)
> +{
> +	struct imx_ocotp_priv *priv = context;
> +	u32 word = offset >> 2;
> +	u32 *buf = val;
> +	int ret;
> +
> +	/* allow only writing one complete OTP word at a time */
> +	if ((bytes != 4) || (offset % 4 != 0))
> +		return -EINVAL;
> +
> +	/*
> +	 * The ELE API returns an error when writing an all-zero value. As
> +	 * OTP fuse bits can not be switched from 1 to 0 anyway, skip these
> +	 * values.
> +	 */
> +	if (!*buf)
> +		return 0;
> +
> +	mutex_lock(&priv->lock);
> +	ret = imx_ocotp_se_write_fuse(priv->se_data, word, *buf);
> +	mutex_unlock(&priv->lock);

guard(mutex)(&priv->lock);

return imx_ocotp_se_write_fuse();

> +
> +	return ret;
> +}
> +
>  static int imx_ocotp_cell_pp(void *context, const char *id, int index,
>  			     unsigned int offset, void *data, size_t bytes)
>  {
> @@ -138,8 +285,10 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
>  static int imx_ele_ocotp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct platform_device *se_pdev;
>  	struct imx_ocotp_priv *priv;
>  	struct nvmem_device *nvmem;
> +	struct device_node *np;
>
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -151,16 +300,40 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>
> +	np = of_parse_phandle(pdev->dev.of_node, "secure-enclave", 0);

struct device_node *np __free(device_node) = of_parse_phandle(...);

Frank
> +	if (!np) {
> +		dev_info(dev, "missing or invalid SE handle, using readonly FSB\n");
> +	} else {
> +		se_pdev = of_find_device_by_node(np);
> +
> +		of_node_put(np);
> +		if (!se_pdev)
> +			return dev_err_probe(dev, -ENODEV, "failed to find SE device\n");
> +
> +		priv->se_data = platform_get_drvdata(se_pdev);
> +		if (!priv->se_data) {
> +			put_device(&se_pdev->dev);
> +			return dev_err_probe(dev, -EPROBE_DEFER, "SE device not ready\n");
> +		}
> +
> +		if (!device_link_add(dev, &se_pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
> +			put_device(&se_pdev->dev);
> +			return dev_err_probe(dev, -EINVAL, "failed to link to SE device\n");
> +		}
> +
> +		put_device(&se_pdev->dev);
> +	}
> +
>  	priv->config.dev = dev;
>  	priv->config.name = "ELE-OCOTP";
>  	priv->config.id = NVMEM_DEVID_AUTO;
>  	priv->config.owner = THIS_MODULE;
>  	priv->config.size = priv->data->size;
>  	priv->config.reg_read = imx_ocotp_reg_read;
> +	priv->config.reg_write = imx_ocotp_reg_write;
>  	priv->config.word_size = 1;
>  	priv->config.stride = 1;
>  	priv->config.priv = priv;
> -	priv->config.read_only = true;
>  	priv->config.add_legacy_fixed_of_cells = true;
>  	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
>
> @@ -169,6 +342,9 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
>  		priv->config.nkeepout = priv->data->nkeepout;
>  	}
>
> +	if (!priv->se_data)
> +		priv->config.read_only = true;
> +
>  	mutex_init(&priv->lock);
>
>  	nvmem = devm_nvmem_register(dev, &priv->config);
>
> --
> 2.55.0
>
>
