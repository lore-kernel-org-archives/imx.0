Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C93AA50B
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773306875; cv=fail; b=inhfcpqODmlKFvu88ztS7O9PQC3njgEdaauktjXVsD9fRZ7VgzQ+fFSLnnQvww2NlvxRsOZ/acMZ+HFhiFUj3fZqqIM68aLGgrchICFLAY9QGrncnW4rx6RvyaAYXBR0TngxjYy2vKk1MxqdrEKuPq/9bTA/R4R1NHxWW7Vei1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773306875; c=relaxed/simple;
	bh=kCe2S3oUiJNmAvI+Fu2h0ZwlTeUPj8CIKrf6MAA0z9o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AjVF/8fSoaPrww620gaKQ5aLbp4Byzputkb/ODLjVMpUGWS4ZJ8f91IMCsDQVB3KZ1QAxo+RGpwO918Y/Dh8Rz5/2FORdu9CpvEYgDEX4JnWRzc9t64KslcMIvL7oQHO1we6YAqp7HmSyRsPJVhYNbcp4xpG0N30L/kajkbEXuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SQDvDBzx; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SQDvDBzx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaCcrotpP+Uc+ONBeYEDe0H/MOmJtao1T60Hq2mrXlUozjwC5pSH3GeReazXkVUavYq6nPxnr8dzQEl/q3ggTf9pxcjW8D+7I865VIxpRgAKB2w9/LZ37Nn/BskFdsganXEkBQRVUpeARBZwCzgu/LqjEz3gisu5WkVXAOouIkj9B1PJa5FFo4PXiN1A6D4iNZUFyTNn/9UlEcPE1lYgIfzHICmoR7V1tZum+MaeeZGBB/n2aqFnVFdY0L4S8MkHd2AElEkODWqJReE2QqxDPnxRWp3g92SZPvzsxrnRdmGRLdbmNiy/OLIrzlmee6Uk1Ss9b0OS/fMnvBh/9LnEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bt9Tls3RHlUNB4JaIXDSpgUoBKsx8XDz/ROBtO/JIL4=;
 b=TmDJHkzqbxRS0sJyJXC27/eC/vxxqtKuAZrSY39YmjyIWnqFqT50Ucn5/J35II132Os3SK8VNgQCM5Dha8SfxqcGcvP3uPsGhPeSqXWsrIra8btaQKmt7qbsnP0Olhnz1N7ZMSHpE1hAXwIdnpxWJQsozJpeVxnguFBogrG8heD7nYEuhJ8z8X1ERYLg8WgIoGHgolQzOkOFQ1wBoi9a8JWjLYFW2096l92Ps7fH/uPRKsXn83lYQwB/ilgCVjU850vB9sJJ1MkiHeVE7aLkrwByxh7Me0QaLaieTs6eMtajv0KNN/3ofHByTY64eCQ/DloBWIgTO3CPnOLAWnMduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bt9Tls3RHlUNB4JaIXDSpgUoBKsx8XDz/ROBtO/JIL4=;
 b=SQDvDBzxpScxIlqhmRQJh3HTw3sVfnx9TEjnS/rZiGA582WCIuRBH6jLkwR5HPP6BE01Gnz91OeiBpMtFd1d9eYqvPa1nj+VNWShvdC/a04GrXtYXU42Ol3rYylS5EIse+BfChoymwXOpl5jGKyWA5QfylPLg4MX/OrZZFlU3D+MsKSWNPT+GNDKk6O37TONcWXIRGWsClXtTINAPcTACi9PdpyKARvRHfxZouG5/EyDYCNLevRBFsH0pLJkIz/q3RUm5FBH713qyH5S2si/0pHb4KautxAD5f/vtt3Kbmh1XTdZAQZB2rNR58lG4RoO7x9fR36Gl+61unkF67lfAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV2PR04MB11836.eurprd04.prod.outlook.com (2603:10a6:150:2fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 09:14:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 09:14:27 +0000
Message-ID: <ccce0f8c-88bf-4cd8-a806-b62049606cfe@nxp.com>
Date: Thu, 12 Mar 2026 17:15:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
To: Marco Felsch <m.felsch@pengutronix.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
 <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
 <33e09cc9-69bd-468b-8361-b92a50686f74@nxp.com>
 <DGZ2XYTVUR28.16ITKRM9S2ACV@bootlin.com>
 <ot5qypkeirkiweicjijholt2hwfpnnfhrcm3d6euqfnupptsab@din4bkq2sh5h>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <ot5qypkeirkiweicjijholt2hwfpnnfhrcm3d6euqfnupptsab@din4bkq2sh5h>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: MA5P287CA0237.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV2PR04MB11836:EE_
X-MS-Office365-Filtering-Correlation-Id: 77624c2a-731e-4c1d-ff51-08de8017c23f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 fzYPTVIEk5s9MTN9AdXpGuYBwNe//sF0pJKZzLI8qz5hwdnRy55Spra9SIznQu1NhLfpeWu0PfWrxOqrs29m694xDNxiXLMkJOdZEfywJcZ4giv3WxOFTdZ/h3Qv0kUJuw0uQc1jLF1/FnohFpvh53Ws6ERdkiQ9AOJXadnkeYC1IC1kbXfuC0BTfJJqEF8qAXcbBOOs6vYRDOsJ4pDRoPBlI0Dwgm+fo4TbLoHUTU4bWx1seIaHjm4oXQY7iks6o/tsLDHGPslmh9P2HYI7cjS+wqIBcwOKufR0zbW4pHMDLdSVUtiJ+DH9p6Li9EoVJNoMT9z8XWEzKGxqPpV4XJYn+4bTVcBt26KTNCjrWW46/J0+P+CshFU02d96Nm+6SiBzjs9NhtlMk9UindOcB5PAbERUXr5PLviZeknf4nsFOzBHymMrPmXSw7+qTrTzyvZxzfATLTN/QoyCOYWl+JF9FF5WlWR1D6EPNHGsLSuI1Zvp+wFXAGfITOfUzImKdz0awcjJxNjRh2eXD6cC3tdPfRfOxYI+4cDzE8anTMYo61W8QYg2p+aI3A3AVmtfNJNY0MEy1p4DVMoB/cWSfuLk98vVDtWs7nILm8o+XUsxEK3lznEKPQWzUeYnRsojQJ9mERdYfEdBIC4w/KPWfxmihYybvc6G0JrYiBMNW3XtS+PQDpUw6ff5/2YzLymf
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RmtMeERsSUJyaE9FV3QwM0dqMXllQittOTBZSU52c3d1NkltSE1KbG5xWnQx?=
 =?utf-8?B?YXZWYTVVSTdZaUx4M1pzWng4SHZjV2RSMnZoUUhESTJaT09XY3JNSXNVU0NK?=
 =?utf-8?B?RCtKVWhXZEora2pIMnJrb01IQTBaRjB0K3puOEVaTEpiM1BLWTVmWVRSeVJC?=
 =?utf-8?B?Q2dLeUpiZVVmemJtaDhrcmVoUDRJTUZ4MSt3UGQ5cVc3WW1GbVEvTlpEcUJx?=
 =?utf-8?B?OTJjc1AvclNRZHhmMVhBT1hXS0Z5MnNrbXlMaGJzNnd3NEYydVFycEtBcUd1?=
 =?utf-8?B?eVZ5WHM2Z2g2ZkFtSGZVNm50eFdoeFA0emJvVldWUGFaVk4rbW5XOHFBWTFI?=
 =?utf-8?B?SzNqWm1IL2c2ZnhvaEtmQXIzakx3ZWRZMjh1Ky96Rks3UFVpUUw3cDJKdXdN?=
 =?utf-8?B?blI0cmI2R2UzeG5zcG1BZWNrYUZydzJHdjA4TC9lWWdTVnRaTmRVaFFheGhw?=
 =?utf-8?B?anhCUFZQT2xkTS9JMVlBSjBPMHdSM1h3SWNVNVVvRUt3OXYveFFOV255SXRl?=
 =?utf-8?B?VStsVU9uS3FsUHJlaFJ1T3VpVHhSR2pianNZcE9nOXlzT3lCQnFrRjJSTTRh?=
 =?utf-8?B?UmNIRHd1U0szaWFwT0NhcThNczRvc2NKZ1M2b0ZjaytpY1FiWjBFZ3NmVzAw?=
 =?utf-8?B?WCtFSmtWSlJnSVFzeldaeFFxbWd0SzBvb1ZPWE9LMWsxeXN6OENQc0dHdEJm?=
 =?utf-8?B?Q3Nrdnh4MUxlZU0xMXRIRnBpK3h2V0tKdUs4cHI0a3VscUFEYmRFQ3hUazc4?=
 =?utf-8?B?VVQrNmtBWVNRU2x3bm9tZkRBa28xb0t5RUUwMTNhTXhuTlQzRXNyY1VsMzh5?=
 =?utf-8?B?eVdnellIMTBhblB1MUg5Z3lyYXc2NEcxMXcrQ2ZIbGQwV0d3OXhHWkVtVkQw?=
 =?utf-8?B?VURDZGVQeWpRcEloMGpvaWU4MFBZZGxrWENkWlpJbG1LTFZ6MjM3WUFPL29s?=
 =?utf-8?B?cHhkVHFPSERsNllReGdOQWd6QzZ5eE9BZTFCcExDNG9CeDBsM01IZHJHZ2xX?=
 =?utf-8?B?d3htRFFRcTN5cWx1WDRhbjZlNVJmTEpINSsvY0NrR3RTQjd0dDUxNFpwNklI?=
 =?utf-8?B?STlMTVhsR0RaSmQwVXRGbG45NzdiZ0RWN1Vac21uY1poZnRyNUZUbzhpS0V2?=
 =?utf-8?B?K3lnUE1kSDJOYjErV2x6NDZWeUdHNGZqKzRmdldQczA1ajB0UW5aTXdXcEha?=
 =?utf-8?B?VE1SeWdLcDJxTlVFSE5sZTFtLzhtUGdYNDh4YjU2QWtKZmw3eE5HWUpldUdw?=
 =?utf-8?B?MG90MzlXRFJPdW9LRUVOUWFVTnRrUzNpVy9Lc045OFZWK1UwMWpkakJ4aUlL?=
 =?utf-8?B?bnQ4ODFXMXNOdVVwakJNNXpnWjFHMDdGWlRjLzRuanV5K0x0WHFTeFl5QUts?=
 =?utf-8?B?YSs2YVdLWXdFSWd2cERLWVF3eThQMFVLbEF1TEN4NGtreFFrZk1JclFtdzZD?=
 =?utf-8?B?bWVZbit6Si95T0R5SEFzZWg2WFZmcjdlaEZrTFlqRndDUGsxYjBkNEM2amxF?=
 =?utf-8?B?QzB1aHVMcEVxWWsyZmdBWFJyTi8wMzNjS25TN09ZWFFld0NLeGw4Rkt0VjJy?=
 =?utf-8?B?THkxVHBWQll1TGVUUEFQMXRyWS9GcUFKMjN2WktOOHJ2R3llY0g4VElLdXRv?=
 =?utf-8?B?NEIrdkpqVHQ1WXRxcDdQZUtYbVA3cVFvdUc4U1JvQndXOFE3VHk4bHhzbng1?=
 =?utf-8?B?dTkvRkFNS0o3aXlTS0ZIeElqeU5rYjlGSzlwMmtZVzFsL1NYazN5NFQ5Rndk?=
 =?utf-8?B?ZGdDZWVZWlNiOHdJaEhlQm5qcTNQcVNJS29paTlFaHE3b0VkU2ZVcm1RN0lC?=
 =?utf-8?B?c250WktJa2hucG40a0VUK2VDVFRaZTU4Z0RxWDR4Vnhjd2libiszZ3R1UzRr?=
 =?utf-8?B?U1NtVGVTdll0M2lZZ2tXMGNDcTcxQXlkSVlXZ01aYUJ2eGpUaWR6eVUxSnNK?=
 =?utf-8?B?TGZkaE9uTjJvcEpMNU5BMGFCdis5QWRtOVpTQ0xRSEhVL3k1TmxmUzgyODdn?=
 =?utf-8?B?ZWtlSUtaekFnK04yVVo1V1NVcmNsU3pkWXIzeWw3ZWpRYlZ6M0FrbHREd2Jw?=
 =?utf-8?B?emVUT1FoQ09pVFhGbXB3RzBwZXJzQ3R2OWxyT3FSWkZRbFdBV2I3eXdaMmkx?=
 =?utf-8?B?bWlMclVTbytCVGY1MCtTZ084L3JWQm1mM2ltMjNhY1FMR0FjQ3U3QnBqKzBR?=
 =?utf-8?B?RlprWmhyMmFQVjB0U1duRkNqVkJMSGNKZGtESXhSazJUeXpCVEVGNVpPdnhp?=
 =?utf-8?B?Y0xFVVJuTWl0L2R4S3IxMXMrcmJMclRmTGU2YURyWnZDVWFiUDFTaTlndldN?=
 =?utf-8?B?dlE3Uy9HcG5VYWRoOWU2dlFOVUtMR2tkTzNSWGRtSDU0NHYxKzhlUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77624c2a-731e-4c1d-ff51-08de8017c23f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 09:14:26.9045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjW5RGExQQHhyX+pf5MevD3Dd8ca9RQ6pfRKsSym+PM6s7A4ByBhqQZXaTkSfrPcmQRQXuX/A7KybiGnhQ0efg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11836

On Wed, Mar 11, 2026 at 08:45:25PM +0100, Marco Felsch wrote:
> Hi Liu, Luca,

Hi,

> 
> sorry for the delayed response, I was at the EW26.

Np at all, it's good to go out to meet people sometimes :)

> 
> On 26-03-10, Luca Ceresoli wrote:
>> Hi Liu, Marco,
>>
>> On Tue Mar 10, 2026 at 3:57 AM CET, Liu Ying wrote:
>>> Hi Marco, Luca,
>>>
>>> On Tue, Mar 03, 2026 at 11:34:27AM +0100, Marco Felsch wrote:
>>>
>>> [...]
>>>
>>>> +	next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>>>> +	if (IS_ERR(next_bridge))
>>>> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
>>>> +				     "failed to get next bridge\n");
>>>> +	pdfc->dev = dev;
>>>> +	pdfc->bridge.of_node = dev->of_node;
>>>> +	pdfc->bridge.type = DRM_MODE_CONNECTOR_DPI;
>>>> +	pdfc->bridge.next_bridge = next_bridge;
>>>
>>> When I was reviewing another patch[1], I was aware of the necessity of
>>> calling drm_bridge_get() for next_bridge to balance the next bridge's
>>> refcount put from __drm_bridge_free() for this bridge.  I'd be good if
>>> Luca may confirm this is correct.  Sorry for bringing this up late.
>>
>> Indeed you have a good point.
> 
> At which stage did you faced this issue? During driver probe, because of
> EPROBE_DEFER?

I just want to balance the get/put for the next bridge's refcount by
calling drm_bridge_get() for next_bridge, as I said above.  There could
be some way to trigger some particular Use-After-Free issues if you don't
do that.  I did take some time today to try to trigger UAF, but no luck,
though I found a potential bug in encoder_bridges_show() and generated a
fix[1](Cc'ed Marco) when I played with debugfs to read the refcounts.

My idea to trigger UAF is to remove imx_lcdif/imx93_pdfc/simple_panel
modules when doing pageflips.  Dunno if EPROBE_DEFER may trigger UAF.

[1] https://lore.kernel.org/all/20260312-drm-misc-next-2026-03-05-fix-encoder-bridges-refcount-v1-1-b9ba3d844732@nxp.com/

> 
> That's the reason for having the local next_bridge variable since I
> faced with the same issue. In other words this driver is correct and
> it's on purpose to not assign it directly. Albeit I could/should have
> added a comment.

What's the issue your faced?  How would using next_bridge variable impact?
Without knowing these info, I presume that you still need to call
drm_bridge_get() for next_bridge, since it's kind of obvious if you take
a look at __drm_bridge_free().

> 
>> After re-checking devm_drm_of_get_bridge(), as I wrote on the other thread
>> you pointed to, you should call drm_bridge_get():
>>
>> -	pdfc->bridge.next_bridge = next_bridge;
>> +	pdfc->bridge.next_bridge = drm_bridge_get(next_bridge);
>>
>> Marco, you can keep my R-by if you resend with just this change.
>>
>> Sorry about the confusion here.
>>
>> As mention on the other thread, devm_drm_of_get_bridge() is unable to
>> support bridge hotplug. So it should be deprecated, but as of now there is
>> no alternative.
> 
> Sorry I need a bit more context. What's the issue? How can I trigger the
> issue? Why is bridge hotplug required at this stage? Why is only this
> bridge affecte by the hotplug issue?

Maybe, Luca can comment here.

> 
> Regards,
>   Marco
> 
> 
> 
>>
>> Luca
>>
>> --
>> Luca Ceresoli, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com/
>>
> 

-- 
Regards,
Liu Ying
