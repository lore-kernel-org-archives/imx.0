Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DAB2F3C3F
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 03:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769658497; cv=fail; b=VXpYLkk7vYPcTOf4xnXF4W6c1gACG5vPnAQFd0FZNLWphec6+2mwHmXE31pKhrzViNapTCBb9cyac4M0nFN0lSHcj8MyOZD8KKLtLbbzP0V8Z14IXf0thQKK0PDzauAI3p192yYSaVMrZeYXwOFT35AAUQPi3IF3/8YWnBVZwFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769658497; c=relaxed/simple;
	bh=zSMHNlKkgsL8QbBLmyXHJeyalvk7+QGvv7SbEdaK1so=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=elKJ4//tyrgM4s3cabaxsS9Plk+g2Gv7SLe/boBBaLMHbKaYM37inxjBiatozJeAYG/Zi0Ef4jEb6STgTlhFojtqVgf+uxe7l6wbj749iTL8tO25XjCw5/DGEQXewIho3bJGN8Ga2mrXavlI9UW2dFK+BXEVrR2MpXXwOkvC+Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lQY5An1l; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lQY5An1l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0U98ulCw2umVtpmp8c/C1LMMJb4B4aX5cz07r6nt7gYury8Z2b8K/loNqQ3EQ87ktoj+1/0wk+N2mKRNSbyQ84ExKicCdlMSE9lmLcT3X7o5ZRVnyeeBLmGm34xdUML8Vc31o0URvTHzLwtGfSb3xoVdIXGjl+kmzaPemMcKHt9FB1m9U+YIEKAaSr+Ot/5816PLj8hSSkO4BQYLeCRVvDS/7akrjZNuasENfcwA5mfFvMeR84AzOdHRKC0wn8iBKa1pEj7/eonHqszNfoKvlX55tFaIsucOqxbmNGkELqc2SKRAO/3/osTNlVFXNl67dxslH0HH0hQvgwruaAY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EJpWQKrRwsJ0lwJro2NSsm2qnBSnfkHOML30FSJIMo=;
 b=H95LcjEXpmRe9yrw2hXKV0+H79JwqrqtHiYF/GPyxzVFG//PN1AJzL4rT5swqWNpVX+2dLTvcfKbiyhN/m1DkabBkjbYNLEN+94oPUyG2GfNU2mRgdMWWDnMm53Lyp/RO1YdXYMq0BiCcRIln4fPxG/9JQr0/QzZBIXgbnM17EHhzS2xKO6puF2KqP1qnv4D+YQ3gb1E+0lQx8+7/kcrije/EL5XbsshrERga18LYa0VsAbDayZTYbnLNvhcKoXvLqmNsc2CshkuKMQYRbhlwuozH0zbqh8iB6X/SoJAqZ0kiREH9YXkSwojikLaaIaxR3uGIkUyBWEZLXNIHW+NKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EJpWQKrRwsJ0lwJro2NSsm2qnBSnfkHOML30FSJIMo=;
 b=lQY5An1lFeyh9W5CuNyX1zcY7e14IU6JstlkAcAynyUkrHOAz9iK2tuQLjGJw5OD8yxpaS/gOaHHeJGuz+tNxvFZAf27kLeYd5HbKMWypa+jeGLm15lTXr6c1c4/P1krkmnhYQVMsSeaDopP1ljf1TTOIbNLFWixkI7FMGfTambseXLycTlcRDIfbyZDXWWs/J6umJKxARAL5NGRG3ypkWS+8v/ct1ASqul7TiiS7uDEgQwMc5Z5WTie7N5V9adpbMXUROXCj4FgUJfrk2GehzO1CCvKj+7FWQ3Gx2mDhvI+t5Dq1ejClUwT9h1zFzsTKkQW3/G9TVnAN1MHgliyRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10391.eurprd04.prod.outlook.com (2603:10a6:800:236::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 03:48:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 03:48:12 +0000
Message-ID: <c99dcae4-f5d2-4039-a562-866896d162da@nxp.com>
Date: Thu, 29 Jan 2026 11:49:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for drm-misc-fixes] drm/bridge: imx8qxp-pixel-combiner:
 Fix bailout for imx8qxp_pc_bridge_probe()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-0-2138d0933cf1@bootlin.com>
 <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-1-2138d0933cf1@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-1-2138d0933cf1@bootlin.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10391:EE_
X-MS-Office365-Filtering-Correlation-Id: 96380698-9206-4010-ae14-08de5ee93984
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VC9KajRsSjBTeHpYejEwQmRLWDNxcVF1bCs3U2tGN2VDa0d3NWUrVm5GM2ZF?=
 =?utf-8?B?VDMxbU93cjluc04vb2lDeVN4UUExSXRBcnZwZ1d1MGxQcDVFaHNhb3E0V2JK?=
 =?utf-8?B?Q211OExicEM2MGdzVXI5eTZGUG9rcEYzeVllcm5wUEcrUzQwNXZucFFPYUV2?=
 =?utf-8?B?RjdBUG5LNWIyWmlGanNFK0QvSVQ5VTdwbnNTcEVIalRmeVB5ZTBkcUNlbTVW?=
 =?utf-8?B?alkzcTlYbFg1ek5pQndoUjZZQzZYbUNCZjZyVE9TU1ZrK0dvNWN3MU1GNmw4?=
 =?utf-8?B?KzN0REZ6bExNeTV6MzBXeE5qdHBWa2duSk5kTDBJU2pPdy8xNXVkdzhYQXhr?=
 =?utf-8?B?SlJnK2JDN0U5QmUybmNPSDFidzh6dHQ2cEtCRHpBaUhiS3ZJNXVZMStnd2Ex?=
 =?utf-8?B?bnpnVnRrMWVTYk9Jb1UvY21HRGFCSnVzenY2M3d3eEMwS2pEdjJ3Y1duTUR0?=
 =?utf-8?B?dkMzRVdTcFdXeUlURjdhcXBmV2hBTXdBcUY4ek43bWxCV2l0cTR3NGNRNTl2?=
 =?utf-8?B?ZG9sYlB1VjY5VTY4WVczeG1hN0dLbjU3Zzh0QlcvVFp6Vk1hRHJrdHFZdXd4?=
 =?utf-8?B?eDRNbmYyMnhid0ZlQjBtcTNNdlY2YTdQd2JZeDRhakF0VTl0ektkd1k3UjQ1?=
 =?utf-8?B?ZDBTcEVLUFlkYkRneXVxNXlPVW44ZFVadGIyRGIwVHk5Z1ZBT0xESUFHNkc0?=
 =?utf-8?B?dnNRM0VaUExaVjFJZ3NNWTFRUHhjWGE4V0hHK0k3VmdIb2JQWEl6dEpSUXZO?=
 =?utf-8?B?Wjk0VVJmNlY2cUFSaSt1QTNkQ1I1WDBOREhJMlVDc2I5cEo2UWdBdE93d0Nr?=
 =?utf-8?B?ZUtyQXBDVzNTWnNZdWxpNDNNN1ZlYWQwS1BaNE1QZ0tTTElHNWtaa3ZNMzl5?=
 =?utf-8?B?RlVZQmZOazY0S1k2YVk0d2E5YlpRNHVkQnd4NFFTK3hRUitERUUwRHlib01k?=
 =?utf-8?B?bllibjgyVi81SWZiamdEeEpPVWtTVGl1bWRKZkdJelZOU3RJbjBYbnkzZkwv?=
 =?utf-8?B?SVNaVUd0ejZ0S2FmZzZpMVpnUU15ZmtsUjRhSnNwT3VON3hQT1dVRzNGNFhs?=
 =?utf-8?B?bm9lb3IwOUFYZFlWLzlpWmdSRXpmeDBibkFnVHNpRTYyOFpmOU8yc1UyQm5T?=
 =?utf-8?B?K1hZeVkrcUVXbzUvRDRhUWxpaUFVL052eG1lcXlXenc0WGs5Y3BaY2FFY2Jj?=
 =?utf-8?B?Z3VKMGJicTl5d1JEcngvVkNwcVdxVzZ6WmMzMEpWeTNFT0hBR0dia3BiQm1F?=
 =?utf-8?B?WWJWNmZjN3A1ckFoSnFqT1NNOHhXR05tNjBWdzZidVdkQVk5N05rQ3dUUkRF?=
 =?utf-8?B?K0ZnaS9JUks4VmdUZVEycFlqRjBwSkZpbmsvN2VCQ3J0ZER2RmVpODBpNk9k?=
 =?utf-8?B?VUQ4UXl3WTVsdUtqTkJUY2NFck5XU3NZbDVXbm1RNzRjbHZvUzBwVitVazN0?=
 =?utf-8?B?TDZhOG1HRHpkSi96VkdhOXU4c3NhOTVGejNhQ2VxemdsMThsRndZWDJDeGdN?=
 =?utf-8?B?bXphcFVwcGhvRGcrNERqKzBoc3lIWVRxNzlIQ0UzYXptdGlDSXhKS3MvcHgv?=
 =?utf-8?B?akRrTS9zRWZZbkJzQUFRYVlKOEtOVFNUUnh3b25DV1lMUjJodXRocUdkRGhG?=
 =?utf-8?B?UXVQZGxEdzRNT2hUM3g2aWtBY0tKbEZCcEI4QUlMTUh0bDFXMFI4UlNRR3JG?=
 =?utf-8?B?eWZwRzRFRFlCVHN0cUtCVVNNZWNvaFlVUGc1SUQxaTBLMjB0SmhuUWtFb1Iw?=
 =?utf-8?B?RGQ4bThRbkYwdGxOV04zOFV0NTNzbEdlRVk3V1lTcmNkNGNKNkhCcnAxUlU4?=
 =?utf-8?B?Tkt6dTM5S0kzWVVQdWM0OTRyWEVtQkxlZVZIZnpmWGc4OXppbFUwYU4vVDA3?=
 =?utf-8?B?ZmJHMFNuc2N1c1JJTGJCTDVwbWJ2SUdSRyszbzV4ODVRYWRnOVlhMFRDV3Zl?=
 =?utf-8?B?ZUZJcjlmdUx1NHkzU00zWGZXQ3V1UlBqbm5aRHRvVkp6L2NjZ1ZRMjNSS0Zn?=
 =?utf-8?B?Q01tRndsQmNmbHJleGV2RDZmcXNIaGsvNXdZdG91M0laL0RQeHl2QXV3ZWJz?=
 =?utf-8?B?S1BNSUZ6YVRkbk5UK2p1blh2OHFTUlpkQ2dnNWZGdDdaOGRhQmJJTGJEdDVT?=
 =?utf-8?B?VmgvQ2p6Mk9rNFRrUXpWcWxadDA3V0x2YkpFVE81VldjWnFOdVFRei9xSCt5?=
 =?utf-8?Q?A9N/PttioMtfhC6Sl+z+XC4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UldKb2FnZ2tiRVNYTFEzZGJKUWUzOUpFQlFYUTRDV0tBZDJsZEttRHEvZ0Nh?=
 =?utf-8?B?OWtLSk9UajQwQ0RJeWhKczJlUnVPT01pbUV3aEN4cHBNNGhDaFg4MGw4Rjl6?=
 =?utf-8?B?SWtKZjU2cm5VUWtTeVJreEIrbUYwTWYvVHJ1eUt3cmdvaDRzOWZDeExVQ2Ry?=
 =?utf-8?B?cDR3VE9RdGlDNTBxNkp1Q1FlZTlLSWtVYUVCV1MweVc1emVVYm1jdng0MVNu?=
 =?utf-8?B?Q0hmdVJac210YVFaeW9ob1JPYzZTa092VWFVb0FwTGhIdFlLbld0S0FOR0JE?=
 =?utf-8?B?QWhZdGNHQVF0Z0lWTlF1ZkQ4WldXREtuWFhuRmF2NXY4aVR2aHZiZ1U0R1Uv?=
 =?utf-8?B?d2RyODhBRlVoK2lUZDUxUy9sbm5xVittQ2E2Y1FZR1A4YXlHRDNlR0xtaTEr?=
 =?utf-8?B?aXJQU0RYWmhkZitSWnI1cGZUYU1CYXZGd3ZYRFZDRFY0Rk1RTUx4MEFyWVJI?=
 =?utf-8?B?cGcwSE9qSUhubHh5SVF2MmhpMTdtQkorRVoxbnJrcWdBT2N0bllLL1M0Q2Ew?=
 =?utf-8?B?eGdHTnA2eXdxQmdROEtCVHFsNFc1UnlBb0JnQllIR2poNEd6Z3ZDRGtaL2pK?=
 =?utf-8?B?MXg2TXhUb3BncDlIMXpITkJ2c1FOUy83cHloa3I3dHN5V25wRzc0RjdXcDdW?=
 =?utf-8?B?OFBwL0I2M08vRzdPdTBvTVVsb0k5b2VBclNaVGphdHN6dU12aGt3T1JVQkNt?=
 =?utf-8?B?NjcyN0xkQ054ZU0vRmp2SGQ1SGhlTGo5b2RKVWJsV1FwTjhaVFRjN09WRFow?=
 =?utf-8?B?L1dqcUVoN1JDbDhLdk9ManJsWkRsUTU3MVMzbnBubXNQZEF5dDhuV1d2Y3do?=
 =?utf-8?B?VTBHbmFKMDVrNTFEcUdhWXBhd0MvTzZSa0k1VENySVJkR0xFbzk1Yk1GMU16?=
 =?utf-8?B?QzNxWjRvZjlvWVFSWWIyZWkrbWhNVzF1RWJnKzZiRWJpRjNkWHM2Tkpvdjc3?=
 =?utf-8?B?Rk1aNjMzbmFkeStaeGR1UDl0bS9GL2RuTFpjVTVDOTVnbXR1R0tPSjRxcndJ?=
 =?utf-8?B?TUtuaE8vYm80ZGw3Yk14WXlYR3FpejZ4NWt5QytWZEEvUWpmYW1yQWN0S2FP?=
 =?utf-8?B?MnI3RzlobDNMSXV0TVNQa3VhZUl4WkNNYXpGY3B0WGJqZWVGTndwTWNyOW5N?=
 =?utf-8?B?RFNsR3RVWHNWemVSamFzd2djcm5rMzBLQmptNHd2cG03V0M3UzJPZkJMYWpR?=
 =?utf-8?B?TWtrNEZsaDh4cjdDVGFPdW1SWHpBNnIwRy9QaFcxeFNUN2o2U0FIc2Z0RG1o?=
 =?utf-8?B?dWhhKzBhMXFib3NiRVdzUkZQNXo2NWlMY1BGK0dwa1ZLRTVNVDZuODRtMXli?=
 =?utf-8?B?S3ZTdmZjRkFNVkVUb1Vhd290VExBcjlCZVA0OUZiSzNScjBhVkFVQ1VLZG9Z?=
 =?utf-8?B?a2JHK1BhQ1ZOWDRiZFpwc0RYT3RIbHdJeFZ0MXpyaXZKQnJaYXVsVHk0eFFa?=
 =?utf-8?B?VWFSdUlySlJWS2FpMG5CcU1kd1RJaHhmOXZ3dEJ6UExML1RmZVZRUDZCYUN6?=
 =?utf-8?B?cUsweGNjaDBQUUR2a2I2bDkydDBFVG5Xb2hBeTFOZFhsZWhsTTNVL2F5MjRY?=
 =?utf-8?B?VExMcHFDYm84S001UlJjZjI1SU9tNkJRV3piT2k2NW1Ia29ud2cvUjVHUGNp?=
 =?utf-8?B?b0lqMDg5VUJoTGN2UzRudlhsZHBuL3hIcWtFV3gzb0NSQlhRcXdINEJlUWRy?=
 =?utf-8?B?MVZQOHZ1TzNuN2NOR1NpTXBhMUtuYjFZVFRiWVN6Yi9ORW51ZllUVlpDdjVt?=
 =?utf-8?B?K0dmZ1dCRVRITHcxbFpuUWRDVTRhOEVaQkljcEIwVWhiRm55bzA2Z25aNjBY?=
 =?utf-8?B?eFBvUnBJSDRlR3E0ZDA0VGpXeU1MMkpvNThKUUFNWXlNaWFNNk1yL3VxZDFN?=
 =?utf-8?B?cXZWU1dXbmlYL3FhWGRIb0k3S0xOQ2dkUnFsajJtN09Id1l2SVE1enR6WFU0?=
 =?utf-8?B?N3NvQWIzM3FiV1VUV0EyanUvU3RhWElzaUxMQmtsMDNZclJNSGg3eEpBSG40?=
 =?utf-8?B?Q3ZpYlFEUjRBcGc1RmpzOHF3c1hXRUE3U0RCWDFuRFV0OXRQR3pmZUgxbHB4?=
 =?utf-8?B?Y1ZFaGRaTjVUT1VxbkZSM1Z5NTZQMCsrSzBhRUlPVVR6MXZSMERyUXhEcy9i?=
 =?utf-8?B?eUEyRUZ5M04wUkxnUTYvK0ZTY0MzeE94REVCbVpDajJoZDJkMTZ1SUduZjFm?=
 =?utf-8?B?ZXhTK3hwajJxdWRyVVJadzN0c29EZVJvTUlkbGFOVTFLS3NmbHErd3ZGZnlX?=
 =?utf-8?B?K0w1SUZCOGJuYkxFOFVsaS9BTlhBMitSU1NMUGVtU2ZacEpEQjcyNXRHY0pw?=
 =?utf-8?B?QUhYQUV2ZmtPSk1LR1ZjdW93bDhMc29zWEJLaktEV05JRDZ4dlJLdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96380698-9206-4010-ae14-08de5ee93984
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 03:48:11.9882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNEH+xlteTfo1dA2YCsv64EE6HfHEutleOcCQGX0ZNlmskuuTT6hlyZWlcbnjDi8gxv1BvTXtKfEjk9vJMWMPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10391



On Wed, Jan 28, 2026 at 06:55:09PM +0100, Luca Ceresoli wrote:
> In case the channel0 is unavailable and bailing out from free_child is
> needed when we fail to add a DRM bridge for the available channel1,
> pointer pc->ch[0] in the bailout path would be NULL and it would be
> dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
> pc->ch[0] before dereferencing it.
> 
> Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API")
> Reported-by: Liu Ying <victor.liu@nxp.com>
> Closes: https://lore.kernel.org/lkml/20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com/
> [Luca: backported on drm-misc-fixes where the original commit conflicts]
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> index 8517b1c953d4..dc1cb094afd0 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -349,7 +349,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>  free_child:
>  	of_node_put(child);
>  
> -	if (i == 1 && pc->ch[0]->next_bridge)
> +	if (i == 1 && pc->ch[0] && pc->ch[0]->next_bridge)
>  		drm_bridge_remove(&pc->ch[0]->bridge);
>  
>  	pm_runtime_disable(dev);
> 

Tested-by: Liu Ying <victor.liu@nxp.com>

I'm not sure if there is any proper process to handle conflict between
this patch and commit [1] in drm-misc-next.  If that's clear, I probably
add my R-b tag.

[1] commit ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the next bridge")

-- 
Regards,
Liu Ying
