Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC45386541
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209668; cv=fail; b=uzBrUZeGqvA7ILmwJDLkWufRZHRG3WNGpruzCeFzxa+Lwk+3Rz7fROZfJzUdZO5wCjcuv0nA6G9L5uYy79CP4YdwEp4YJT2nlUCH9V25WNsrOKCw7wQEfwiPCKwY636fEAJqZbZ9Kx3LVqbKOdESPNVQjXahDPJivDbAqu/EF0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209668; c=relaxed/simple;
	bh=l9qcfk5+/yUVe7iSlg32gzf1qYZGWzjerQyJ243PmZY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CB00vI+iIu8ncuKfzYveJKTNRkyvzj/iq1a11eW/lYi0lB4N9v2cGSYT0j317hvH91HsXIgKK2NZRh6WKNMvVTWmNaf0i8uUdM00HEaoFrkMsqkv7wByJO8bjikJvSowdVYAxLRnWjqucmOO0ZGcmd5ARRy9CioQosQojDA4s8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XxnhptcC; arc=fail smtp.client-ip=52.101.69.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XxnhptcC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCYTWXRZ6FqI/VSqGz3YYLG9oeBlqsS5k7iJFi04PM5QcMsUO4N6X7OffZnNVjvGdrhfwjTrS+opZAXEJnsjNJRfE8Wq6OrDwx00SsPjMLut8zx3ZMmiOnK7BLpw+XOK3d0NS0Kkb13wLw1gyPACdsRmvpBW3peIMp5uwd4mF8TgUvLiOnkh6T0fJMNj5exb23gIEdCyUcPD4gu14aNf/RfqZYB1s/0i3XPyWWmR9inLWNhKc/BLU5w0pUMS/A7MJmWTd/RIMV7+eQdPkIZkdx7rC9+uV2+YK0jt+InGyXAB6IrNYcnZmRuVEuar346cAcdeam/7SiH37YreBoG3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S2Q/r3WUlfTPWrrWW15dFIajcamxizrS1WUsOMi1oM=;
 b=OConr5d+g1FtUANlYu9Mji+1WOqJFUW6WMatOV7toLosp+twetgCdYm4dN+H7doIKe2sSwFP/SLu/zUhUR3/8m0u4hd1MdpkFPo9h5udCop3C88b22WNvF4yX9e3zjAcSI2oxQrzhS9ZkW2/25bOgxGs7CqYOVAkMj/lBjbM1VgWD107mA7SzOv7jZxUbKuzCJRJx7m11KWCS6nh5Ulh1jtt5rgsST3JFtc3a7sDdgGW6QUxZez99V49kdka98fzE71MmJYMOJEI2N2kg1Doj3FvLndt1Opw9ecOQ5OafHXPFTsfgY2sVxbeuRFX+4BVo6Jz7vcQamaoWj20XhKTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S2Q/r3WUlfTPWrrWW15dFIajcamxizrS1WUsOMi1oM=;
 b=XxnhptcC/s1ZccYfOYytsaE8mY2ZYbHvpDvQwFmBUfNg0FGnKD8dSOpV3m446IZ5f7JRNZIJ21NbY0N0/4BqPD+/OJuvPTVRnnUiJL1rZsF3nbF5fXJVAe7wj8qkMdGiGr3TJQ3o2D1EKAXJBBV0YBQdw0tG/i7w+5iz7BTZj2Burai9rfKSaCv/13nwNK+oCD64iEXkiE7W7EBk81nUc/j5QBd1Selx+z3TRiRIr7cax+qXuYbaYxqjzTq/wbcpd7GzxwWGSIDh68Tb/jCUTv6qxSQv3oCPCMdnSisx74l8fghFARV3wleJrFrQzU4K647Wc2hvvsBWg+HWpEgO1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB12108.eurprd04.prod.outlook.com (2603:10a6:150:2bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 09:47:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 09:47:42 +0000
Message-ID: <5737ab1f-a61b-41be-908d-c24679aa2bf7@nxp.com>
Date: Fri, 3 Apr 2026 17:48:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] drm/mxsfb/lcdif: use
 DRM_BRIDGE_ATTACH_NO_CONNECTOR and the bridge-connector
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
Cc: Damon Ding <damon.ding@rock-chips.com>,
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Fabio Estevam <festevam@denx.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Gilles Talis <gilles.talis@gmail.com>,
 =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
 Heiko Schocher <hs@denx.de>, Josua Mayer <josua@solid-run.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Martyn Welch <martyn.welch@collabora.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Richard Hu <richard.hu@technexion.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Vitor Soares <vitor.soares@toradex.com>
References: <20260330-drm-lcdif-dbanc-v2-0-c7f2af536a24@bootlin.com>
 <20260330-drm-lcdif-dbanc-v2-10-c7f2af536a24@bootlin.com>
 <1a8b1a34-89bd-436e-8b5c-64ea71e8f333@nxp.com>
 <DHIJ00VZ2O0H.1550LBTEFNT83@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <DHIJ00VZ2O0H.1550LBTEFNT83@bootlin.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB12108:EE_
X-MS-Office365-Filtering-Correlation-Id: f30e0f16-ffce-4fde-f5de-08de91660d16
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 pODivuyQD/RxlPDFIHKEY+HzXtYFTHasWabcvc6GfiSVdqXMSWpXsf+q4YjTVZr09z5lof3GLT/ypl5jghSexROfdOJYofy50ikDmNxO4PKHLsmIZG1GoxW7YQCMFeWIJAY7ankcYOAldnYQwvioA9wJVHlynFyo5/hd3fGA2+5LYBnNslwICeHLH/yJbWYtc8sgsnVN3zYnj0jakV9Na56+fQuWoYaYLmoKuRuMFJkljFRwxdW1Kr8BqE0ECKBgh2TZITtQaICIqUvinzYU9cLWntga1CgTEQgCnVVhP0pJ2zS0Wj23q8u0UnWXGN6JaM5pXBkL7io/GZW/pYjlPjepR0BJxoTjwUKxs8+AL3kTz71TU8iEPiaLyA9hls2t94rFzdW8YWItxCgBk9QKSd2/h7urpu9r8/cyrp4veS5MZr//HdRcaMzbExyJ+lzEVb0Hjg7uZHyr+3tImk0Lr53evFMv3UjNZ565YPpbL6lhqY8L0jPOA4C2OYC7eRTooVWFP7IFtp+hQpFpzJoxZOzkR94yXs2l58/x2ioWLLDf5BD22DBHQxo6c1y+d0A37ejUNi/+5RMCI1HBjarneQt4HFqq2zMkBSO2L6fQcjRueXGfvK3Vrels1hepmzwE4c51ShG1K9k8rJny3o859AxCidBjOjrQfpjzW4O6iZ0+MrWqo3aa9Uo+um5w0BjuS4rmC4aWT5TZH6q1+oqotZWgSKPi/iMKvqeYfOS13bs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?S2VHNy82QVR0SmpKdC9vNklQZUQxcndBYlVnUWxvM3lOY3Z0aWF3d0N6RTZz?=
 =?utf-8?B?SkV2Ujl0eVo0RnZrQ1BtdVVUMWlkWXBJaFZITG9uWWN1Zzg5bEl2S0h1Y2dv?=
 =?utf-8?B?cFpvMFk0ei8vRk85RXYwY2ZSRlFGL0pkK083UEhRN2IrSTBBYVdlZlJna281?=
 =?utf-8?B?cWpIMG9kcWU4Ujg5WC96UHZ0NmZZSHEyWitSbU12ODdjditOZVNLdG9RVUY4?=
 =?utf-8?B?NVByQmd5M0xWcEhtSnlmcDhRN0dYanY2WE9KTGRUTHdURkw5YUR6TmUwcEwv?=
 =?utf-8?B?c0FaSGRXK2w5cVB4MWRtQkNtWEs4OXp1MStqLzh5MkNhUXNJRkNlbXZYQnV6?=
 =?utf-8?B?a2NsM2tWR1dHelZ3K0VIMG9QWkN2cjU1TVQxeU5NNGtKUk5GZXJab052UXZU?=
 =?utf-8?B?ejlQNkJFdkltTjlkNDhNYTdCaEliV2VYcVMvQ0ZQUjVCdWN4MHB5YS9hWWxx?=
 =?utf-8?B?R1JpVkgzbHlzTlVwcTY2RmF5SEFzWXpRNlFHMDJTQ0l0bjJLQm9hUjNzL3Z6?=
 =?utf-8?B?QlNaK0p2eFhkQ1JuMkx5amt4bGFjazhad1RkRkFYOW1XQ2VnNEx1ZFU3bzBT?=
 =?utf-8?B?TmkwSEhUSU1uYUZzTGg0OUFJaFlvcjlGNWtFcGk3S1dTRkdtVEJRdzNiRE1l?=
 =?utf-8?B?OFJDZUhMRHFycXVvRmpENm5vQ21DSXNKODBJajFwUFp6V28zdEpuVVJ0eFdv?=
 =?utf-8?B?Zk16YlBTM1NodGx3SnNvV2trUEpPNzBzZE51TURIWE9KVi82cnI3V3ZqbUtV?=
 =?utf-8?B?dk1DaTdjUHhQWXZJU3VSWHk3Tm5hTTNiQW1kTk9tYWVFR1lWNkVzUHE0M2xL?=
 =?utf-8?B?clBpZEV1MUJKMVJqRmlsR1RUREhXNWwrZ3ZFaG5sZ2wyRS90ZFYrb1Z5VElv?=
 =?utf-8?B?ejRWRUx1d0hGMmdLSTNaN3E1eTRPKytIakIyYndCKzhLQ1FIMSs1dWhvb1JG?=
 =?utf-8?B?VjlId3FVQW5HaEVQZm5nVDJOOUNrMmg2ZmxtSVBYVzdtSXEyUjloMTA1eXdr?=
 =?utf-8?B?a2JQNTlWWGw1WFNSdmFhb2FMSkpEMDV5anRkL2QwbHJ1TERpTTdnYU1vVmVz?=
 =?utf-8?B?d3ArVnlTSWlwVzdDWmNmZFVRa0FqZTAzcjRCdXlrMXE2TytWZ0pvV3BicGM5?=
 =?utf-8?B?Qm9nVHR0dElBem0zK2JRL21Rcm04em9DODY3WjNuSXJ6aHB6eTFrbmhiSjFZ?=
 =?utf-8?B?NHBaeHhEaGhZZnlzSThsSFN2RVB0OFdLVVkzUW5zMW40M0J2Nm5yN01WTzdo?=
 =?utf-8?B?ZGMxK0FBT3IxVzFPVWcvVVdPZENsaVNZcnRpdDVJOUZFQmpNY2VSejd4eHg4?=
 =?utf-8?B?Z09rbHVyV3oyVkdHcHIvUm1odm9TWXVyb3hUK3RuQkpjODA3cG44alN0djh6?=
 =?utf-8?B?bzRmNXUyNy9MK3h2cy9mamhGM2dUREFsaTdJOGtzK0dsTnBNVGJnRjd6cWpx?=
 =?utf-8?B?ejdqdHBMUFhodmpGLzhFd0sxazk1clhUWVliZGR4anc1QTB3eG94bVgyK1Z5?=
 =?utf-8?B?V1NhQVQvOGZoU2NlV2tjamw1aDJNN3IxY01jZWd5TkY5NDNuWEU5bzdzdlc5?=
 =?utf-8?B?VHlmRC9FaXVSUS9WQ2NRMktzY3lGWHRtWTgxYUlRSUdEYUxNVG5pSk5oUy9X?=
 =?utf-8?B?SzlGSVdXd0ttc1lPTlFsZnE0bkhkNjdvZFFpeW9TNE1tcjlqZSszdXBUc2xy?=
 =?utf-8?B?WlB2ZjhveHBncGEyMnNYYUJmalBERjliOWlGRjBEeW03L0o3cWppTjh0YmRX?=
 =?utf-8?B?NUxYVEY4aVJzODJOeUJqWlovZlcxUlVEZUYvYnBQSmV3SnZGaHg5UjlsTlB5?=
 =?utf-8?B?RmJ0dXl5bGNFSW1HZXFDNDlFY3Q2V2cwU09vTWRmamNUVWwzQ0J6bVBmUkUy?=
 =?utf-8?B?U0VQNERoejJTNzdEWEZhbkZRaGFra1V4NUxtbGEvSk9PcjNqdmFFS1podk1j?=
 =?utf-8?B?Nm9Cc3VhQ1JRbW92WUEraUdJWnVzYlNUS2VhSmJObkZZS0FsQXFCVzQ0dU9j?=
 =?utf-8?B?WGVzUW1PblZJSlJRMUlnRUxONjh6R0xJQ1lBTWxhRVhKbkZZS0h2TUVETnhT?=
 =?utf-8?B?QldOeTN1aXdLRWZjeVdwMWlPU2R4SUwwRm5GRittUzhNclNMNWUvTkIxWms3?=
 =?utf-8?B?Tml2NWZJMmx1c1E5WDRuWnN6dzNmTm9iWVdDdUpUdkEvZ3lpNDdmUEpXUDgy?=
 =?utf-8?B?U2ViZlAvbFpTeHlOanRtamxDd3hTR1NOeGRXNk5WUWZBbm5BVGVxbGJDc1BD?=
 =?utf-8?B?Sk5IM3BxZFZvQ1cvRFMwcWZEWm9uMDZGdDVoMDFqdTFjUzhPc3dvL3RGaGFT?=
 =?utf-8?B?NllPRXE2Y2kxNlRxN2FlSlJwcDlEZWJKTzJ3QXNzcmJhd0ZOTkdCdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30e0f16-ffce-4fde-f5de-08de91660d16
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 09:47:42.9089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLAlQhAmcqbFYLqQPdQVed/MWiKBjDHZmiLzQtDkSzlfPPh8BEmu/1SbqPy+EBAJTu7T+r++ozvs2KiWrNJFTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12108

Hi Luca,

On Thu, Apr 02, 2026 at 10:28:45AM +0200, Luca Ceresoli wrote:
> Hello Liu,
> 
> On Thu Apr 2, 2026 at 6:55 AM CEST, Liu Ying wrote:
>> Hi Luca,
>>
>> On Mon, Mar 30, 2026 at 09:25:51PM +0200, Luca Ceresoli wrote:
>>> Convert this driver to DRM_BRIDGE_ATTACH_NO_CONNECTOR and to the
>>> drm_bridge_connector framework which is the current DRM bridge best
>>> practice.
>>>
>>> Tested-by: Martyn Welch <martyn.welch@collabora.com>
>>> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8MPxL/MBa8MPxL
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
>>> @@ -86,11 +88,23 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>>>  					     "Failed to initialize encoder for endpoint%u\n",
>>>  					     of_ep.id);
>>>
>>> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>>> +		ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>
>> It seems that only analogix-anx6345.c, analogix-anx78xx.c and analogix_dp_core.c
>> don't allow DRM_BRIDGE_ATTACH_NO_CONNECTOR, since they error out when attaching
>> the bridge with the flag:
>>
>> if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>>          DRM_ERROR("Fix bridge driver to make connector optional!");
>>          return -EINVAL;
>> }
>>
>> Looks like i.MX8MP platforms don't use these drivers.
> 
> Exactly. I have checked all the drivers involved with the i.MX8MP and all
> of the support DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Great...

> 
> While converting all drivers is surely a good goal, converting all of them
> at once is not realistically doable. So the approach I took was to convert
> one specifically (lcdif_drv.c) plus all those which would break because
> they are used with the LCDIF.
> 
>> But, are we completely safe here by adding the flag?  You also mentioned
>> "pitfalls" in commit mesg, which makes me a bit more worried.
> 
> I mentioned potential pitfalls in the cover letter mainly because of the DT
> overlay insertion patch, which is somewhat tricky as it impacts many
> boards.
> 
> Additionally it's not easy to spot all usages of this component by parsing
> dozens of dts files, so I might have missed some.
> 
> So overall every patch sent has a potential for pitfalls, but for the
> reasons above I think this series has a bit more.
> 
> Does this reassure you? :)

... your check makes me a bit relaxed.

> 
>>>  		if (ret)
>>>  			return dev_err_probe(dev, ret,
>>>  					     "Failed to attach bridge for endpoint%u\n",
>>>  					     of_ep.id);
>>> +
>>> +		connector = drm_bridge_connector_init(lcdif->drm, encoder);
>>
>> Also, kernel doc of drm_bridge_connector.c says:
>>
>>  * To make use of this helper, all bridges in the chain shall report bridge
>>  * operation flags (&drm_bridge->ops) and bridge output type
>>  * (&drm_bridge->type), as well as the DRM_BRIDGE_ATTACH_NO_CONNECTOR attach
>>  * flag (none of the bridges shall create a DRM connector directly).
>>
>> Are you sure that we are safe to use this helper?
> 
> Yes. I have checked all in-tree dts[i] files for all the 3 LCDIFs.
> 
> For the LCDIF3, the pipeline is:
> 
>   LCDIF3 -> fsl,imx8mp-hdmi-pvi -> fsl,imx8mp-hdmi-tx -> HDMI connector
> 
> And the involved bridges are:
> 
>  * fsl,imx8mp-hdmi-pvi has ops = 0 (it doesn't set it) because it
>    implements none the optional features mentioned by those flags, and it
>    honors the DRM_BRIDGE_ATTACH_NO_CONNECTOR by propagating it
> 
>  * fsl,imx8mp-hdmi-tx is implemented based on dw-hdmi, which sets ops as
>    appropriate and also propagates the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
> 
>  * display-connector (enabled via the DT overlay if needed) sets ops and
>    makes DRM_BRIDGE_ATTACH_NO_CONNECTOR mandatory
> 
> The LCDIF2 involves the panel-bridge, display-connector and lvds-decoder
> which also set ops as needed and propagate DRM_BRIDGE_ATTACH_NO_CONNECTOR
> or make it mandatory.

For now, LCDIF2 with LDB only supports LVDS panel, so display-connector and
lvds-decoder are not enabled yet, though they can be in DT.

> 
> The same applies to the drivers used with the LCDIF1: adv7511, tc358767 and
> the panel bridge.
> 
> I assume this answers your doubts. Let me know if it doesn't.

Your description here for each LCDIF is helpful for reviewer to understand
there will be no regression introduced by this commit, so I think it'd be
good to put it in commit message - it reflects your thought about avoiding
any regression and that it's not that easy to switch to the bridge connector
helper(as an example for other DRM drivers to do the switch).
With that done, I'll provide my R-b.  Thanks.

> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/

-- 
Regards,
Liu Ying
