Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A12034C140
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774508551; cv=fail; b=Om672Pcc3C6y2BFammy4SDcdYLdhaYgeGh+aprV8h4Rmigt3mH7urxvmYith8Kyt/WJ5OpOy6k9tykP1siXcHOtAYS0URwhmJxU1iLiwcN8Qb7+SeSpHxmP7DzzWd1jDuQDe8PVLID+kuo6QyMxlfH7y+EKnSbFMCNUHrn0+Tsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774508551; c=relaxed/simple;
	bh=TGPEC4jTpqVBMIOZI0LCOR/ycipgE+4WNBllduxf4vI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eg3LlSC3TORhVb93+ogUwTDjrjkquE6mT8SXzIG7prhWlZbwmTyGIkDYs/cEynzSuQbYU23nfOiDESWKyG+3didqLXyHNaYYkS1yak9xZXlwM+8tk7yr7rzwqvroPkbSziNvv5qjviXamh+IAcQJokE0mnMxS+sXpzLhudTN8vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T3OlFAVZ; arc=fail smtp.client-ip=52.101.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T3OlFAVZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7aXhxnCIx/naFC5EQt34LVBcWoOWsMXLkIeNlSb+ptf4cRwd0+3MahUashffw88YStoS5/zxpK49aj8GzvjMd89sNOy7tfVGaUd06BJFvMKLs0prAUhBoV8jMbNmPsHPxs8pf25l/Z7p2ozzAKIES3+MPhz5ImvN5oOs+X1fkGLp2Xbpi3tyAPnQrxxDYTZ4auMRFi2j906GN1hlG3MM6hiaVGkDil68lU9FKJiRa+Q9EViNVNEq60bAXdpDcGppMab3bn62GfZzZiBNgifUupYMABKB4niUfK4nL1Ek7xynen9Ki+HhyBuNx0Ru3fEdQ+ItIZqYlRgjeq+w8jwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/64A4xn3ExPGIyIfhRhxzfNCprrFXFnSR5dbT60Mptw=;
 b=hFqGgu2VUbd6zo2eZuBhfUSdTJP5KrwzcZ7wUCWpC9+TxaUU3WBbtdl4ibx8ItW7YQcvasIXfvZsycHo8MOVAU3QBQt2gUfyeucHKmSjdOzrLRTLlQlzAPawC+Hah96U9twb+RFK0xHcn8hHnRHHIEvmDNy8Zl44NYKpwlKT2ST4apUGEh9mfcg18CKzFclWkZsoS+cT2zLZVqsZtqvminYkOZqeDSx0vmrZ9XfrbT/N01jVsAx/9P08eEEsxh1KEqF553SLEGfDn+xD7Rbr+hKHOHD2sHwLspbklq5aaQecsV0GlU4OXYJu5/qvgupzj3G5xksOP0B+sthIbu4SYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/64A4xn3ExPGIyIfhRhxzfNCprrFXFnSR5dbT60Mptw=;
 b=T3OlFAVZAvWoL3AvIxR+mvz8uKkq4aLJu2x7juOHs1G3ik/bjNSZPwpCSCBR2JgvtZ+DRJj/44TDMXWp7aRYxRGQV4sVrJaOt13nZkVxxM+i61QOwU1+zaVKj8ncjDNF9BwxcuqQ3S4UCl6kCbmlT8yAOac/Xv/PDYvrsJZVQaPtMsLvybUyKhRgnCR8yPqCpjcVL7wMpbM/tbljEZxDZ4ZZ8MDNDA2prSgeOptgJ5eZadK/F/efMHwUZ4tl7ed/YeYzaPRyagj9fijjzjMz6SfyVLn1eLcJvW+mu6jN8ykuo89/v+sqCwk8sGEudqlgRI9cKa3Mu+kQA06bKjzKZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10647.eurprd04.prod.outlook.com (2603:10a6:10:589::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 07:02:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 07:02:23 +0000
Message-ID: <5306f0dd-b273-4f46-9650-e24ae289abf5@nxp.com>
Date: Thu, 26 Mar 2026 15:03:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/mxsfb/lcdif: use dev_err_probe() consistently in
 lcdif_attach_bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Fabio Estevam <festevam@denx.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Gilles Talis <gilles.talis@gmail.com>,
 =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
 Heiko Schocher <hs@denx.de>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Josua Mayer <josua@solid-run.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Martyn Welch <martyn.welch@collabora.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Richard Hu <richard.hu@technexion.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Vitor Soares <vitor.soares@toradex.com>
References: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
 <20260320-drm-lcdif-dbanc-v1-3-479a04133e70@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260320-drm-lcdif-dbanc-v1-3-479a04133e70@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To DB8PR04MB7051.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10647:EE_
X-MS-Office365-Filtering-Correlation-Id: 41786472-7afa-4e16-3229-08de8b05a107
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 qA4a5CMtLN9E0mGBG5zQlT1UavuKa0zNig71lTYT47ftWHWiHR3CZP8vc8GHGcNBWMTX0EpXtrlWMizBfilX0GmiJg1QJL5onFxcfRl7dhIREsrVhWDjqjolrRA3eXp0xLEKh0JOa7DfiTqK0yqanOh1oEb69j4iw5jRdhQlnypaMnIC+b3bXOGI3VhGQ0suvcpqVm3aijjJtFAALlI1sKjZAPSNz4Cmg1/Bg7ZsIpppdbqXBpIKqdlEVdkKRRFS/AltJY8dQJJ51UXwKgrYw44kOJJtgoVUw2F/IaRre/3C3nVFSpOeCO5+SQWyMX8SF4OKN8n4O6Oil5vps2KRLiz5SPNi+dohadAajnbyNs/XoKSN7vgKTFXuaX6In/uWYfl30l4CN4So3jCUHNuT2vHQuLMKoLL2EVj7abv+Ena+JuIG3gwDThw1YLZQXyuD5L7gHfN7CvxbNeXy+kvJxVHNHIEVzrdIXWqUYPSKQaXvbaRpF9Iw0j9dv6jnfBRsq/heT6U4aZQvAqPc5hYRTKdyz6TyNUV5Cx1na6BMgte8zIrTg4IFOetfBbN+9Hrvr/YigbhtFJwcFwWcqiXkvxykgKXpBiUaQctByn+jwvyBuw9uNr1jlZEsOcdSYS3FvwJXR17Ij2Te1lo0kivsrPvRftO8Qzu3n4Iw5Z8oAF/lfPx0q4qKOQP7nMyYme+Jzm5xozZSswRvxTJODMYqeVyUfHuExXn7EG9dZDFYuwKXiwPy/oIWZM+JqASJL8J2vCm6KkA+1J4zuc+4E/4OMA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZFpYeE9RN3p5MzVZRVdFVzVpQSsvazdlR3hPS0JjelkvbUR4TFh1Q3NscU1q?=
 =?utf-8?B?d1R6azhXb1JVY2xXRHpmYzg4Z1NkaURKQmtaZ1RKYVJsZ2FsZ2tnbURaVFFx?=
 =?utf-8?B?bitNWlprQmdSdEpxVEZBM0plNEUzTDJNdGlCdE56QTFqOUpvY1FwQVI1R0Rw?=
 =?utf-8?B?S3o5SG5uN3RiSVNDdVdubjJoM1FESHBQQ0dZbXk3T0FiZUJVYlh2T09QVk9z?=
 =?utf-8?B?MVlYazNaZk03MlJveUVrYkxBZVlUNUpkK0lIWkNHUWRuRHd6ZEU3MFZHSVZK?=
 =?utf-8?B?TEMrSElPenRNSG5vdGQra3ZwT0lzMStNMjJEbUhwZVNheFFaaDdGWlRhc0ly?=
 =?utf-8?B?dEIrSnRRbUdLblpEQzhMd0gvZzAwbGZFSnBQdXpGTEdvVklZQ2xDTjJacWdQ?=
 =?utf-8?B?Wk1MNFhId2hRa0ZFWklURndCN3F4UWZ2TldqejByUEJpUHVUaHhlRG9BL1dL?=
 =?utf-8?B?REdEVEszeHBocXJHamxJN0tTWFVTM1RwRDNJS1pTa1BXMGlBN3NhQy9MV2k5?=
 =?utf-8?B?SzlOMGxDZVhvZmF0N0sydHVldjhmTUpJTVdtSnhQUzJhMkc5aVlVVjVWbTFM?=
 =?utf-8?B?S1hkeklqa0ZPS2IxeU9hN0pUTVpYVWtFR2lPWjBWbkNtM0s5QkpFNzlabGhC?=
 =?utf-8?B?bVpCWWIwY2Y5M1FldlNmcUlvYTJCSkRwUDdsZ2Frdys0bkZ6dW1lUGJxNFJz?=
 =?utf-8?B?MEFhbW1yUHNWU2FMZXBja0IvZU9KMFlOZEpCUUFKcDZrUEdXOFpZMjdUSmZK?=
 =?utf-8?B?bTRNZ3lROHFrSHZiQVVqSDg3RU5lUll5cSt0NTkyTWZrcUgwa2N4TURxSnpi?=
 =?utf-8?B?WEtMekdjelNyUDZJZDhZelNMNEs1elR6WW10VmROdnIvOWFFaHlPaGJ5M2pQ?=
 =?utf-8?B?bW90TEdzRE1zWkJvMDR2bVBveXlpb0JwU0JhR1owMllnUFYzTER2T0p5d2ZQ?=
 =?utf-8?B?bEhkQms5bjlVZ2l1bE43SXBzbmpibzFGYXpaRGlDZC8wanYxNTM2NG51bFpt?=
 =?utf-8?B?bXZWKzRGQ29ESVBtblBCOWpjQUpXeElpU3pJdUk3R2VNc1VGNis5Y3RMVWJC?=
 =?utf-8?B?Mm5wUWZ6aDVTS1NBRXdGY2lmZ2hFRy9sYWNObTloeE0zb0h2dnlybFNxQkh2?=
 =?utf-8?B?VG1vZXZHcmtYVWhTWUR3cTZvSDU5c3hVWFh6eXNBZ0NVSXE3T0tOY2NxeVAx?=
 =?utf-8?B?NnJLSFQ4WW1qclgwdE8zUVFaeUVoNC8wTG0rbEtWOFZHdTkvVzE0N2RtN1lB?=
 =?utf-8?B?Tm5wUEY0TUExQUFJNlJ0QzlQeTFSSXpBN3dYY0I3b2RwR0FMZlRNTkhRRU5y?=
 =?utf-8?B?UzlvNGk5QmVROEhjSkx3RnorNXMzYmpjcEUwdUxYemFCeXM4UXZjYjNzU3pN?=
 =?utf-8?B?ekRuR1YzRGxpTXhOdHhpL3hiaU1XdVMxUnd0bzBNRWc2MTdIbk53NGZXdTFo?=
 =?utf-8?B?TFBQRkJPeXg2RWM5Sk44bDNkMlFXQ0pwRWI5cTJ5dXdvYXFwRDU2SG51S1V3?=
 =?utf-8?B?WFJNY21NK3c3MXR0NkxZRVJOY1hoaERhclBVL2hYa3VOU01yc2JFZXBqZUlr?=
 =?utf-8?B?NEpSWVcwZ2lZM0JUbGFsTkdpMytES3NmMzU0dFhEOHhEWmFnaUlXejgvSUlp?=
 =?utf-8?B?d083Um1CbHhUcUkwRjFlSmdGcDRqbElBdjhseTNnOEk2MHFXNVhnbTg5OXJL?=
 =?utf-8?B?WTVBQ0JRZ3J4UC9jazJRL09CSDFwcHk0a2lmUHVwRGxCZ2lvbm93dkhScTVm?=
 =?utf-8?B?ZkVoaWR6TXhxR3EzcmVCekFSMHpXOFN2RWpSMTkwKy9JSWhSYVI2bTVHMTM5?=
 =?utf-8?B?YkVFWkEyTTJlVjJ1Y2pGblpkWHFpa3FUdm9hV3hMb1NEeEROLzU3STFhRGFk?=
 =?utf-8?B?Ty84NDI5ZElvcG9LalZwbWxUdTRUN3U0RkJUV0VWTGR3Y3pINGFrT05MaWIv?=
 =?utf-8?B?aDlIZS9mNjFCdW1mb2FKTGIvYXg3c2ZyVDM0dEVRSnYzSnQzVjR5QldmWDNT?=
 =?utf-8?B?VmkwS0Z3ZkZ6VUExemNZL3pCcnhTUzlQY0xpQXJRNkxFcTB6VkZCSHo0Z3Q0?=
 =?utf-8?B?K2Mxb2Fza0pEbHZtQ3U1ZFRXemIvWHFNeGtNTlQ3T1RvL3BtcmtmN1JLU2Yz?=
 =?utf-8?B?ZDFTV0QrRUIxekc5Y0xoMk1paWExZ2ErSDJtVVJESUY0S1BDYmZzWXpsQUVq?=
 =?utf-8?B?QnZVQ3o0ZXB0ZW1uQnZjTlRUUzJRcnBuV0ZzbDJ5a2dFOUJuS2pHTXMzK0VB?=
 =?utf-8?B?Zml4K1UvMlBvMVJrclFleGdyb2pKSUJnU2puN3FpN2o3b1NUMTh1bnBQaDNx?=
 =?utf-8?B?RllPTkhRUTVDN201bjVvUTRvb3Nod2N1NWpid25CazIyQzFjT1ZIUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41786472-7afa-4e16-3229-08de8b05a107
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:02:23.1558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxYKkFPYJRsasYAxZ6qaSnlnknYmKO2HKXs4YAKF+gwe6hs10RNzPL//rBfiXa1sUgBKC77tS9bNoDBolim1ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10647

On Fri, Mar 20, 2026 at 11:46:14AM +0100, Luca Ceresoli wrote:
> lcdif_attach_bridge() uses dev_err_probe() in some error paths, dev_err() +
> return in others. Use dev_err_probe() for all of them to make code
> consistent and simpler.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

-- 
Regards,
Liu Ying
