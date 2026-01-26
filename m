Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F7927A47F
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769414901; cv=fail; b=ow/ayVmzcn9LP4zaQz8Q8xh/+ILSaZ+tah9gKcAybfD8TwSaxI0kvzMCIb8dBBiMQc5lB5szq74oGEoxJvjPy6yUgaMg/kt9wzkFB6E55/TA9XJDkyy0tOCItiKVXJua5WG237b5VUO7xbMS/qr64xRPHbE7+lzif/ZQsSFRt6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769414901; c=relaxed/simple;
	bh=1pOunC7qUjRfHaitpdwpSoMTdF2zsPxDVHs8xSZg06c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jWx26RLgQ5v4QcgD6o8EkGyGZE2C2vBeunE6vEGzpFSZMd04mvgydRIXj9G+WY3ctOi3vzqPGem0N/v2ShVMGkZXbsOU/YqUZgtGM65nDBEeZvTFRr7z9uB/7OK3M8eeuYRuvgeLlwI31JSyQZcKGIBlyzwAi9824SNrGkHy8L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZTtbZ5Fe; arc=fail smtp.client-ip=52.101.84.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZTtbZ5Fe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkMxHWQespjQgWTsfuCdFcUKh7VSmbAXc0nR29P3HhOiDPgcbDwrlDgB66sHB3IvyjpD6ki2tiVFKSrPg4Cm3F31XZWA4lpqYoajtT0fEXbHPddeQNLuptJYvYZ1ccPr0IY+ylQxIRv6nS56aIzettFprBYzMVwGcTTY8kiRkDqs1+4uZaaRxNMI6FW2Ea1UgQ2uo5gxek5iaUCbVD1aI3egnsKWmkSoct8HH9iRuMM1f+kVU/JqfvbJJWA7HDwKydznVDZA0V0sSrhq8/fCgr9WzYE3+q4H+dgKeq6EPdBhjkZWCtwtY2VVV1ThD+SwuoEXkx93lMMGsJkpR7dueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mT5Xd4rFR5tH316OqmpTJp0zjfVrrNra2wHqwM5fJc=;
 b=GOF5ymNIRGirPub4SHIlb0ZF3iIdfk1fNV1+T270i1QKbEHoWHDRX/NinClrbPR2pzFNuDsrfuoi+g/u+ZDLMocwOnQ13d32ifYQJiyLTW5RJUBHnaj0SYtcOAc3FR0nVF5AVdo/ydzPy3i9IJc3QwPB3Tr+7QeT9ggw9nSCkS5BS1D1nHZKagQ1ydqyiTfaTO3mUcwYssXA/ez//cU/geg78P4acPvZtD9YNkTOd0MSq7JNnk+kPHotsXFSUlmiIG0ydRzrPckn5rp1zwH37m9yawlRGKBEyXGH5ofMLWfT+Y33QG1ozt9DPoWNFmU30Pp2IGWqVG8pa/3I2Gqm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mT5Xd4rFR5tH316OqmpTJp0zjfVrrNra2wHqwM5fJc=;
 b=ZTtbZ5FegNTjN7ANjTjYFprx5Jm+4R7BiYeyLbXW9/x5KxDXVMmhW6iZLbpJloMCLszGUuzPFxLITdYtB0PQmH7c4dUvbjmXwl9KxyvjPNKUNgoO42xAhY814WrEzuXw2wkYvXsh5MLTQUXmj4oxzkYeT+mEs/a+04my3CTcAhzAizB/YhjNTLTZPBt+Kf/Ly2GveSHIjKKg2K4DmlA5ugItynhZMpbhs15Rt/c5qMLDQrHsaCvEwJY+HcJgXsZaBvwdR0yLljjOg38NL2h++n/qOs6vya3W7Z8G2dlnXasa1rJA2540rRL0Ukp0fMQRuS9bM6+EHWTH1fztRSTZiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8178.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 08:08:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:08:18 +0000
Message-ID: <715a0b37-fc0c-4469-9eae-c4ded03d92bc@nxp.com>
Date: Mon, 26 Jan 2026 16:09:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/bridge: imx8qxp-pixel-link: simplify freeing
 of the remote device_node
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-2-a62b4399a6bf@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-2-a62b4399a6bf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: c3be4c61-1144-4633-5f18-08de5cb210b6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cXhrV0NnazJMQlI2TWVicWlvWWRVWmY4ZEo5SlV2TW1PUTc2NVU3cTBlcHhS?=
 =?utf-8?B?N1NBelFnZ1hBbXBBYzlFcDR6cVJCWlJHWUs0bFZWOHdnWXFhTTBhNjB5LzJk?=
 =?utf-8?B?RFlwS2w0ME9FYlJjNWphLzgxdlZWSTFoZE8vSlRTWWVCY0p0UmxlazNJbU11?=
 =?utf-8?B?amgvYWVrYSt5UWMyRGxYb3lEcWk5U2RsMEh6MHhSK0RqczdFVzd3VDIzNmV0?=
 =?utf-8?B?NnBXS1lQVktKeG5yRzFGamV4N2lxVExHbFNUMW1aUGNSRVFaT1YxRDdpTWVR?=
 =?utf-8?B?dUpLdzFSOGhjVFVEdk5qK1VoTktYRjVGU1ZKUlYxUndVTFBHMm14cE45USt3?=
 =?utf-8?B?c0FBaXRpRDY0b3FHL3JQbWxkQTVOenlSUHJzdVNDRXpUUFN1UEhYallleGlt?=
 =?utf-8?B?VWJmSE5JUUpwc2N0dnJyYjhuSDV4d24wZVZoRGRTTnhmbWdSYkppSU9LWEE5?=
 =?utf-8?B?Qy8rNHE4SVpLOVNuR0tXSmwrdmVqS0pYd09HRXRzbnpMbDY2SnpnVlc4bVdu?=
 =?utf-8?B?eGV5Z2hlM3QzNFdrKytPalJBMHQ1Mm1QR0crcW5MOXBaajNKQmFvTjVPelNR?=
 =?utf-8?B?K0ZlQmQ2Ly9IYXh4em1oU05TcDhveVI1T1F2MjF1ZjcxR2dPYVRUeFZCa3FN?=
 =?utf-8?B?dVJldy9oQXdaZnZZeXA1UDdhK2xydEtFN3JPOVl6WFYwbDBvNkdtNHdFVVcz?=
 =?utf-8?B?eFlhN0dtM3p6QWo1UFgyQ0FyYjNxUHJRbzRTU0xQYUowZ0VXU1paRU53ZlRy?=
 =?utf-8?B?SU1ZRm9qbXlPOGhqNDY3SkpSbGcxSXNNZlQ1eVExUlVGSlFRLzZpbWNXdWNS?=
 =?utf-8?B?cDdiUEV5Zk1LOVc2UVowRUdtSWxja0t5c1lYdC9iNndBTjFnM3g1emxSUDZU?=
 =?utf-8?B?Rjh3b3lsSWsrMmVlbHZlVEhYd1hpc0s2TEZ2L3hEUXZvaExUTkJWSThiclRR?=
 =?utf-8?B?RlY0WC95ODBydlBxWkdNMHNjYmNkRGswU3NuTllSem03bC8zMTF1NlNUVTB0?=
 =?utf-8?B?YWF0QU84aTRmR1kvcjdYT2ZaZ3lsTDVTVXdZNXhTRlFGVGlRdzZBMkdncXp0?=
 =?utf-8?B?cVZHKzNORGQveWgxVUs5UEhvaGNHZUlEcE1GRjhmNXpjNVVVb3Vwb1IvQU1D?=
 =?utf-8?B?cGdpVm5ka0YzRWdveGNYZzlseHQzZzBTV3hoZmY4RnY2QlhqYVBRT1FEQXVM?=
 =?utf-8?B?amlnTkdQNUI1azFtcVJlVlMxdzBKQXcwcjFKcTFXTnF1MDhFZVlMa1VOTlBW?=
 =?utf-8?B?NldvUzJLMzBVSkZzNjRuUHd0cjdSQ2VmUEFQNTY1YlJtK0hKbE85RzlVb0dJ?=
 =?utf-8?B?aS8rTlNiV0VGTHZFcFVjd3dISzVydG1TV084RnVyNVNYS2toMGFDOVovM0RU?=
 =?utf-8?B?Ym4vT3ZiWGxFdTc5Z2w3Wk1MaTQrZWJNMGhZc3Mrb0FGWGlZNitNckprbmdl?=
 =?utf-8?B?TUVXY0trUVFRVHFkcTh6cDdiTmRyR2twQUlRVy80NFgrY1NlVzdienlkSldm?=
 =?utf-8?B?OHhZeDR0ODlnSU9YQVJJQ0IyNGJPOWVXSW5nYVBKNklBaktubkdxTVVieDg0?=
 =?utf-8?B?b2JKUFpqVXdPZkRNb202U3pzMHFkcUhsZUJyV2dEYytRWlVRNS9Sa0pEZjJr?=
 =?utf-8?B?K29VME0xbHoyWENZWG5KQVlMd3pIYmR5eTg0S2twS1A1OW5xT1BPRmozR3o5?=
 =?utf-8?B?eFZndHd6aTFvdVNad1ViaTNnVW5XK2t4dENITlpqUVAyeE42dE9DeGpZWitr?=
 =?utf-8?B?bHVSUXRENkhnZU9oWFBDdVlHMW96ZzBzYng0MlV0cnZ6ZXgwTmQ2bXdORGND?=
 =?utf-8?B?RURWdUhyeS8xZkFYTmxsTXJ3bS9MUWlJNDBRb1pVQ1dXR2pqRTFDUVh4cHg3?=
 =?utf-8?B?QXd2SXJQdXlhU04rNTVJVWxLaFlOVDVkWnBmN1ovYW16OGxVNlU3K3RncXRX?=
 =?utf-8?B?YWFGb2pNV3lLeFFvUGRyQlAyWDdPcEdVdVFIVFRRdytJMFptWlltVFRyUGUv?=
 =?utf-8?B?b3QxcC9WaERtQTRPdVpqNkwrYTM3bkdOZkxSdVNtZE00MUZWSFJxMkhkSXI4?=
 =?utf-8?B?MXA1U1ZBVEFtYmwxUkEvQzZTTkxxa0ZwMjVSZ3ZnZFJuZjJCYzBVNUNVSVdR?=
 =?utf-8?B?YWlSaENIUCtKeXBOTW1pbjJZZjZIRllLc21Gbk1aZHQ1UjI1V0R0Z1VVbXJS?=
 =?utf-8?B?NEE9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TmJmRkk0M2pCK1NiNmVvcnpnWVhkbmV3cnJHR2kwZ2FydktTb3BoV0ZUcUJV?=
 =?utf-8?B?ZWdPY3VnS0RoLzM4WTRQYnNRcEl2a3F1M05nM2lLaVVMYnhXSkordlc0RHFp?=
 =?utf-8?B?OFdWMDA1L1pxb3Q4Ny9WV1BGZjNyamVCVmtxZzhUcm1qSDUya3d4a3BRNkNU?=
 =?utf-8?B?TGhqRWw5SEkxWXE4ZWpueW56NmFyRlFCL2lpWDZ4NGN0RCtqZllRSi8xSVo4?=
 =?utf-8?B?cUVHUlRUYmh3VEZKY3AzK1gxeVpwcWc3Z1RPV2JSSEpPQktQc05HQmE5OHg0?=
 =?utf-8?B?RnBPdHkwODQ4ZHJuNE9iMjY5bUhMb3p3aTg0Y092ZVg3K0Radk9JYk41Q2c0?=
 =?utf-8?B?TTl0RG1YS2w4MGU1cjFJd0M4dVhhQ2lKOEpLYmFCWXZleCt1REliamtRaERD?=
 =?utf-8?B?QlB2dlVnL25za3ZSRndoTnFldnhGQkg0dzRYcnNKSFhJZEdzMUFaSTY4WDV0?=
 =?utf-8?B?eEs5TVNCWjNJMXdwKzBCbDNZd2pha1RYL1kxY1g1UGwxQnM2MzY3Z1FKQXA4?=
 =?utf-8?B?Q2hianlqdkpNdlFIT1NSQmY1TWZCWHozNVJ0VFRpMndpYkdxb291WXVvVm9J?=
 =?utf-8?B?alc3RUdaTDFXUjFuTEx6TEtMMlJNR2JXUE9XTzQ1NFZGTjFQVk1LOGI4aFEy?=
 =?utf-8?B?L2Q2NzBua3ZqNkY3dWxCSGQ0K3VubmUrYzRiYThKNlV3dW81OFNLb3JBNnpL?=
 =?utf-8?B?aEQ1eHV0ZUtvUEF4K1VjM3FiUXBIcVlUOWgrWFVnZEZRZXJFNk9EeWpPaXZH?=
 =?utf-8?B?UVlHWXRHN3FuYXFBd0NTWi9JbFQ1am42THk0ZzB0WERSanpQTnlEOWRSN1Nh?=
 =?utf-8?B?dkN5RDlDNmNndDRreGdkeUxWOFRieFlQS0tsWmVYSW5iODFaM3VyaGpIdlRt?=
 =?utf-8?B?SlpRYVFuS0dNZGs5RjRvSFFYclFSMTNBWS9VZXNuOWJRRWVNNnR0azhIMGJ6?=
 =?utf-8?B?S0VOUU8rOFZVbVlWSTQySW1RQytLMUpERC9ucVdoOHdSRm8wMC9Fc0t1NHg0?=
 =?utf-8?B?MStCUis3N3c4bnU4NnJ5STgxT3J4c0E5czZweUNxTWk2TmZFTGxldUU2ZXgw?=
 =?utf-8?B?dFZnZnVLY1k2TndvbVB2aDRNV01XUllYelpmdkFSZGJPbkd4NkJPdWdLTEdL?=
 =?utf-8?B?V0tHTUIzRW9QeTRFZHRBc2Y1alpqdVZhWEowSXdZYStQM3FJZFg2K2p5Zksy?=
 =?utf-8?B?WHFUbWh5TGJ2U3p0QmxUb1RsM3RQL0NXNGp4TDkxaDYyWDZBOU44TmNwVDJC?=
 =?utf-8?B?MzdVMmhQUXM0K1JyTjVrZmhDWTBBTmlBWEpWcWpsNGVpZ3g0bVZTUkpXUFJk?=
 =?utf-8?B?YzAvblRzSTFyZlJMRTUyR2VPZmJwNUorUUFyWjFERzhITk9lckRDcE9hY2c1?=
 =?utf-8?B?Y1RtMTBMcUQ3aWEzQ3FvNlc2eGwxZXBsdWhJSE1aOEdkQlp6Z1VkcnQ1SUdC?=
 =?utf-8?B?dS9GNTd5SVJqQ2dBaWZOc0VqMTVYanlBRjRrSXpHbDAwYm1LcEgvZFVzcDM1?=
 =?utf-8?B?Q0xDc0F1bGtLOXdmaEhSYVZaRnVWamRVeTM4Nys1b1FreE9iVytyeHJDMTRt?=
 =?utf-8?B?aDRTayt4RHJSVENlQUhBdUI5N292T0poY2Vva05SeDVhcVpSUXVOSUdwbm5v?=
 =?utf-8?B?ckhuYkppT1I0QmxTb3pKSDFMMzlNd3V5Y2k5N1JxREYwalpMNytudWtkWVVX?=
 =?utf-8?B?MVFmdU90S0dEeHJTLys4NDRYd1ZhN3NBRStza1d3VnNMQ2R2Z2dtVmpaYzdR?=
 =?utf-8?B?RThOZGM1MjlLNW1Gd2pkTzZtMXd6OVlTZENsRlBpbCtJRXg0OFJQczMwWGwy?=
 =?utf-8?B?OElCSGE1V2tkT0NoZDFJYUpPUitFV29QaDNyNVdMTE9jVEF2Yy9JM1hqaUFt?=
 =?utf-8?B?VlRjTDdWUTdCMGQ0MFRFSzBBZFhQOUdhbFc4ZzdiTmdBMkhuWm54Vnc4aCs0?=
 =?utf-8?B?bXBmT2lKYzlXYTFLZExlRE12dUdrNSswZlNmODg0VFpKUEpWOFR5THIvTmQ2?=
 =?utf-8?B?K0FMSENtVmxQZ3h2V1pHeTV3NGJBYXlTQWNYT0ZMVTZ6alAySlJ5S1M0L0lk?=
 =?utf-8?B?VGZIbk1lWnpOYUdpenNpeWFvSzNtRGVuRDNGaE1KaVlqWnBGb1NCejJ0di9N?=
 =?utf-8?B?Q0N3bEExVVh4VnJSNmM2NzdOdEwza21tSWRkMWtxUzZPazNCdjl3UnlyQ1Rj?=
 =?utf-8?B?VGxudVVzdEFacWF3Zk9ZTlE2TGNsOVMxNW15WmpxYUZnR2doWW9vYzRNamJE?=
 =?utf-8?B?NWdpdVJ4SzIzZWRhL2lVVDEyTjZncFluYWRVeXMrcHBMYVVkSHpEaVF6SjVO?=
 =?utf-8?B?YTZGZjhJQjhZZlhtekZSTS9TMzZuckJYUzdOc3dBak5wYTFTcllzUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3be4c61-1144-4633-5f18-08de5cb210b6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:08:18.8571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRp/CDY6zrjsIHQesIUBXUloHzj8eLqqZ4IcfPxY4KWFQGk9IuF8GIDET3XhlvFuEKwkAJNP38z+ct8GN+qZWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8178



On Wed, Jan 07, 2026 at 10:56:27AM +0100, Luca Ceresoli wrote:
> The main loop in imx8qxp_pixel_link_find_next_bridge() requires calling
> of_node_put() in multiple places, complicating code flow. Simplify it by
> using a cleanup action and making the 'remote' variable scope local to the
> loop.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
