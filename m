Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CDB35A938
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 03:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198874; cv=fail; b=HcCYgma9UC+RL0dnZ8qtjwRxQ0HSrI2qzxDp1rzBqfH+ZQmUG+k0L+ArFJhbTE2UuNpQKtqTaPogeNUaL93W9PzET1P/zQpQ9D8jTzP/cnFZb018g/3kx4eiORh+jxkBeccvm8dQvQ0zYBUYfS4oHn1wUeEa14zcnMov3LDDtr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198874; c=relaxed/simple;
	bh=76d4Nc7iXwwVqdzERk/OphD3Njtqap+LfTikYDbNri4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZlDBP9Hy6RF6xF0hDovaYCLyUqtotM2GlueZ0kcfB8fKs6k4/tGVtk7d+V495hohJPKIc3Syafpv0n4hosVs4HAR/s4rTSVsNs2qxct1W7KKVENODNhD1/wPVTe9ldsmv0ScW416QaELFef6r59dRA78ZPQ4aQmbgcOMKDL3AEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TjZ3fqnm; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TjZ3fqnm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JK94PB/i5Sm7dKScZDKJPvR2QSds9KEKttsUSH/Yp0URH5hoAPtcEq+Kpt9tEezr0p8yRJ31lhsuD89/nvytkNWvO1Q/VOF+FSZZT7MNHhqh8k+YxrCSUCLcm4macGJmoteLT23qBSF9aSs9yrhpCI7bjAO6/fKxOPJEUAAQHQH52lUq/ohwPsJNg+N7Do9n5Txler+Sva/21T1p3Ls4rBiik0CajbI2e0+rt+VSHtI06liSQukWEbSaXuioMwyT+CB/JcZfy5cCIj7lL2/217wO/y179yhBiFQsN9nveA0yd22CavKT9U6HxKVmjmRCDTEGFt3wfUyhX4ex2Em1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmxC0ZUzDlUlzINbIQo63DwYaICwEzuo4EEayFRuaYo=;
 b=low/Nmp4/4JhGTgTMEuclY2xFmCARFgukrYRTuK9rCAp/iEGMR24aT7Pkg0eD39/pqWDEUmf7EkQEAmaJ+dtEV/ehonrPjpRLQ00sFYwTd3UrzgxdQFDunXn+bSiR3DUeZGK4cyXhVsawGBrs+c50hqr6nAZV4RfY6KmwIFpzJ8uxKW/seV90pEQpySFjxbrjk+zzCrTleHqdf0fgZciy44mD6N2Ama0wn7LRoEd3xcHUygM+CgiF364a9qhXeUd/WdDu/RiUkvFs391mk50CvbbVHG1QarLb3sM3ohyjWy90cjJegG3qPIX+q4Sy4c2t1bSwPtyATLUaaujdfonlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmxC0ZUzDlUlzINbIQo63DwYaICwEzuo4EEayFRuaYo=;
 b=TjZ3fqnmhs6Hc+GASv2tFQWH4WArMoRG+qmxZYLW0KX+VB623tkNpvXcr9rL3q6/5oscSaZWTFnm4mtWXE9ZddgHIJBOuomoibdIUMJZzO3S4l1UirkjNuMp8tFFomyOgQcbaxCHE7m/1JdZBf3q7h6pmgWsDloNRXHK48HIUSgocz1Khu68PPB8EVUSdMV4j0j9J0kdw7uUQobpxvRL7cWT/aTIRPLEjyoyrWkwWmkO+a8ZKudGtLTJsJaFyuUwX8UP3BsmVnux0SW1UDdhNteCriZGNCvUKohFnE0ZpOIWNuo73DgRoYfLhUWS8m0uO9Tua9QgePvZYfuMRZdBag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9305.eurprd04.prod.outlook.com (2603:10a6:10:36f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 03:14:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 03:14:29 +0000
Message-ID: <b134ccee-f81c-467c-8fb5-9c47785733fa@nxp.com>
Date: Wed, 11 Mar 2026 11:15:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
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
 Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
 <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
 <33e09cc9-69bd-468b-8361-b92a50686f74@nxp.com>
 <DGZ2XYTVUR28.16ITKRM9S2ACV@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <DGZ2XYTVUR28.16ITKRM9S2ACV@bootlin.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9305:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8904e4-c610-4720-4b59-08de7f1c4ec3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 AL2zYlodtwVaXHrzz4fDkYzG6a3Ea3V25MtT0kabr8ImVnHB9Fs6ce4P4NOBlLcS6+16PT0jVUnK+1TWs6CsQQK1iMAiCeN2cwcf9ooo46ciETn43ETqyujALgIpoJQ0eqW4wPW5N6/H7IfNPw1xwcYvoCP1sVDDlICpLjBraCxCJdqDA6Dr3kxthN1f+hrcZ3WFPiSobFg7w0UEmJRXPKBqbiHMjyxaOZ/FSaT+sKRW+/jOBL03/O2vzSCDIg6yk5OrH5aXbUuQueo0yVy57V4Sn+jur9kpPzbzEZzAaVBitiVfkns/SSKM8cFiEc9JoNGIMp66XeI5KqPmpzc2d2Oj9QyezZ7cHYjhX8USMp9IRsc0t/z3S8Wcx5pNmf/9YLKkeEdQ+wwrwKjAwfnOS5RbOiJgkutIyy9q5IW4Nbj3hY7W8m2PXhgGeQdkYXJA3i8b0bb4cXN9wE4nXeGjg/Qu9CMXK6YohE9KfzZu4oAEyAv/1idaLedsUpnU+1cPrnTDG3EhVtc1u1rWUe5yWVWpoNOjjHEp4PBkXeM3UikF4G+AmvtrSPlyMqlpQvY8yyvnvPEELb2h6ez0FGKh6UiHFe+s29x+X7XuEiD7VF650S3yivwFvzfoagxWhA8PIbGTl9Gjx5vNrWeurmvddQVMZqv4haX/0+6zxqXl0/p+KcUTDVJiYCpCKmSdoBpUGVmzR7V2U3FjqXHSmYGI5kv8adawiDZ+LYqyb1Xof8w=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WnNyOHhhRVJFYjdBcG9XTWNuNjZMTi96dEtWMW9JYVd6aW1KcEFwdkc4bFVX?=
 =?utf-8?B?K29nZk1oR1B6Q2RxaFBYOVR5K3B4azNjbkJPMFo0WGl5bWJYR2NLendJcnBL?=
 =?utf-8?B?R1NMbWFkTCtSK09KZklpbTBxQlcyQlJyZWloeUZGSUhKaG1JcEgvT0tnWDBW?=
 =?utf-8?B?N0Z5eklzSmxwSHVKZXVFRHR1SmMzYTlZc2s3eC91YVFBVVMxR1p6cVlVUGxW?=
 =?utf-8?B?VitDS0x4d2d4amZMdUx2WXJiTzQ2T2JDVzl5azlZSlJnM2hOMEMwRzBOOWl1?=
 =?utf-8?B?VGxKU1FkZmtPWEFrYkdmdG1idHVUOE5NdWdsRkdpSjVpdFB2djhtSDNGcHIw?=
 =?utf-8?B?WndJbExlTVZ2ZVYzS0V6SCttSE9paExHb3JONC9RajFVMlk1M20yUmUyaGFy?=
 =?utf-8?B?aDVHRlVXZzIyQVRnL0hyVHRwZW90MTQ1WWlwSDZQbitvQXl2QzhLazFzMEd3?=
 =?utf-8?B?eGVkdlkyeFV1cVAvQzhSdXVzMXcvTllCbmZOZkFUTnBOMHNieGc0QUdoK2Fi?=
 =?utf-8?B?Q1l0ZTRzazNkd0NEWkJOTVNmYlZuWlZQWCtQUll3dXVtVTJkbFZFM1k0dWxw?=
 =?utf-8?B?STJOTm5QNytGeHdaQWhjYTdzOGNrQ3dHVXJOV0hXY3RhZjRGV3RYdHFIc3Ex?=
 =?utf-8?B?dlcycjdHWlBuVHRsdWNJeVRMZytDdU9LbkMyV3NJZHNrdStCcVkwWGp3Z3Rv?=
 =?utf-8?B?ZzFBZWZqQW9seHo4Qmt0blVvNTJGUXRUUnRWY3ZxT2poaXM1TG50cDcrVXgv?=
 =?utf-8?B?cGxYeFZOUFFRN1BhcTVLbHlrK0hRUHFiaUVuUkRtOG5tZzdVd3FjRTkvaWp1?=
 =?utf-8?B?d1FDL3NyMEZ5N0dRYU15aitXUlBwTXJrc1RvMlh3TTFML0RnRjN1YW1ydHo3?=
 =?utf-8?B?NCtSTWZpMUIrVnJucGtYQkJ5M0E2b0dKanlCUkw1em9nTnFNZlEvbk9FRWR5?=
 =?utf-8?B?ellOOFhpY01qQ0tGdWhpOVpTRE5tRDNIc3FDUUFIbmNnM2p2blFIZnZJOCtt?=
 =?utf-8?B?Y3pCeFM2NG42OVg3cENVckVFL0VVcWVPSlBZRmVLNVE1MlJDcG9KK0QwRGtI?=
 =?utf-8?B?akNyVlJPcTFhMHhod1lLN0R6ODRHUWFzY3NCSkhrSjlnVjBvWUdudUFiN08x?=
 =?utf-8?B?a29MZ3gzNWN1bmJtYU1TRXlSdXpuWkZmOWRRNGEzV25RYzVWUG5CQjFyWmxl?=
 =?utf-8?B?dUlOMCtzaGhzQmZvUWVPcy96VGp4MlBpWnk0U1Z5NFZRbnlpWG53WEpKSnAx?=
 =?utf-8?B?TjZMOEFBZ3lzakNxY0ZxdE9kMVJuQitOZ29NN3RKUXlTL2Iwd1h3TlpHMms5?=
 =?utf-8?B?bXdIT0FqWFBDRDhQR2tSc1NoeDNJV0ZBUDdPN1dQbm1yVURLbm1Rb2pKUiti?=
 =?utf-8?B?T1h4QUxQbWprMDBuTFNhVEE5OVZNdUtDRGNEVWlkVnJ3c2tjaCthVjV1R2tq?=
 =?utf-8?B?RDNkOWlKLzZYTkdUU2ZzWTAxUTJNN21OVGgrVDBWZ3kvdU5rUVZKRE1iZTFE?=
 =?utf-8?B?L0xkNnk3WnBBUXJqcnAraHE2M2tEZ0hEVThpMEhsaDNpUzBVemE0dXVUM0Qx?=
 =?utf-8?B?SlpNWC8ydDdIMkpwOFN6RTFFdkJzK0NsMU1KcjY0S2l6Ykw0SHM0c0Voa3B3?=
 =?utf-8?B?Nk1sbUdlczBjbDhDV0Fzd3ozOXdVMUV1N2dpcVZyTzJtT2lGUVpVMkhpbVJU?=
 =?utf-8?B?dE8vT21LcmxYeXRYamxMb1RkdUlKNlZqOEF1b3NuZ0lIT2ZFTmI3TFh5Szdk?=
 =?utf-8?B?c1FlOW1tVFFXeDdLQThlcFVWUFA0SXhSRUR3clF3ZGxseDE4RHh2eS9DQmNX?=
 =?utf-8?B?RnFhOVhMVnppUEJuUFZUeFdwVnJ6TEs2eHJUQ3Q5TS8zaXlxRFJZMko3Q3p5?=
 =?utf-8?B?eTl5TWpqSEVlOFMzNU0yMlgwamRNenEyVkpXdzk2WWJSWTJpNHIzakVyOWNQ?=
 =?utf-8?B?S1g2TGVKSExtd1ZxMWVsUHlZejlYWWM1RUszOXQwRWxJTmlnVVFTTnp4Uy9x?=
 =?utf-8?B?NkpUQ2VhMXUvUVVTUGdVU1lUVTZmeis0V0JUZ293clZuazdXakx1V0U5d0tO?=
 =?utf-8?B?RE84S1VxU3NsZXJGdUxwQnBmVDhQanZ2TEV1bTF2eThWakpPQ0xiZ29HV3Nj?=
 =?utf-8?B?RWdrMnFVOFRac045SmlxWm9uUWtOZnRKaTdpNEV1Qm9uQ3dySTdSaVFEaDZ6?=
 =?utf-8?B?RmdkVzNnNi9oUVBXdVBpcEE3NkNkd1V0bytTa21ld24yYUM5Vm9iRzh4akc0?=
 =?utf-8?B?cjVaTzhpd2dveHpzNnFtK1lORDg4K3lHb0NIM0FQL1dYM3pZU21PTklZZW9k?=
 =?utf-8?B?eExPVWZyU3JFU2N3SlhMVVJwMTByWEM3Tk9jdlF6R1AyanJnc09KQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8904e4-c610-4720-4b59-08de7f1c4ec3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 03:14:29.2057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcM5KBrTRXpPWUoKM1K2V0WN2kbbiNxkHby7y9qeq6F3Uq109nskwe+RabgZf7gpqsqdimrcR8xbCLsPrnxXCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9305

On Tue, Mar 10, 2026 at 12:53:07PM +0100, Luca Ceresoli wrote:
> Hi Liu, Marco,
> 
> On Tue Mar 10, 2026 at 3:57 AM CET, Liu Ying wrote:
>> Hi Marco, Luca,
>>
>> On Tue, Mar 03, 2026 at 11:34:27AM +0100, Marco Felsch wrote:
>>
>> [...]
>>
>>> +	next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>>> +	if (IS_ERR(next_bridge))
>>> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
>>> +				     "failed to get next bridge\n");
>>> +	pdfc->dev = dev;
>>> +	pdfc->bridge.of_node = dev->of_node;
>>> +	pdfc->bridge.type = DRM_MODE_CONNECTOR_DPI;
>>> +	pdfc->bridge.next_bridge = next_bridge;
>>
>> When I was reviewing another patch[1], I was aware of the necessity of
>> calling drm_bridge_get() for next_bridge to balance the next bridge's
>> refcount put from __drm_bridge_free() for this bridge.  I'd be good if
>> Luca may confirm this is correct.  Sorry for bringing this up late.
> 
> Indeed you have a good point.
> 
> After re-checking devm_drm_of_get_bridge(), as I wrote on the other thread
> you pointed to, you should call drm_bridge_get():

Thanks for the confirmation.

> 
> -	pdfc->bridge.next_bridge = next_bridge;
> +	pdfc->bridge.next_bridge = drm_bridge_get(next_bridge);
> 
> Marco, you can keep my R-by if you resend with just this change.

Marco, care to resend with just this change?

> 
> Sorry about the confusion here.
> 
> As mention on the other thread, devm_drm_of_get_bridge() is unable to
> support bridge hotplug. So it should be deprecated, but as of now there is
> no alternative.
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
