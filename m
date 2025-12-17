Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1F229B204
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 18:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765995419; cv=fail; b=Xycol3KMe4feK+ws8deC8F7XJqlyk3xux3QCpy6ZRL/0kvEeo21GZYx2mobiqG1J6LgyDENG2kj8shsSxMg8mSdgqhnHYRnQUVqnbveYA7ZDr7zNnWB3YGeSKpxzNooAqcqhQBL1lVtZskp4vZNfpMstVm1uMuTnk6rfpRLVcUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765995419; c=relaxed/simple;
	bh=CuI7eq5UakDnbldRrWN3r7/0Xk1HQnHH/9nkpEYdfpg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=A/3q4K+JlgNXl9kQn1/oc9WJIn102TiH6PBIHMPArNRr5gviOhuDsrlZLc7U0x4PaU+vRFc+iPmTb79sfupKESWXjc7YYtIAQKCTRtBhSVc7vNNsctP3fo8MtL6portvGhbdhqaXav5W6czGMJXixHw0ef+TV3hK/VJK1Jmm6Cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TC3ApSB3; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TC3ApSB3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbHA5l67ZXcLOfz8ephQ3/nK1a9hSXlY6AGYNhnxEJo9NG6s7GQH7ScBZoq7KfVqnWV64QnutrGLZcrUFnL7V+oZyYQEySID1KcNgCLtEmcdIre5GPUXmUcjrOHmotb670g5RMKXUGFfJ9XvHtTAVCZmFITLAs0CQhwyhsQ/9VCHWi61LD60CtgSj4AQqL2IxZI7QveLiGPyaPjil2RyYN5htyFfgCiG1tFofl9vOM7u8KD1mKJk5hUN+B2lVCN8iN/ovJTaOQdTmOyq0z0Ou65+u6gXYRgwNlQsftAZR/jbMm6k3zo3BX6csxp9JAWKa9KoaTVRixwoJeAyH1kTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Imytc/96kF+HW/KsYdtflMAJxXkMva9BKfcF6zL3Mrg=;
 b=Mkzxt4xH2b6D9Oym85Cn7s7hwcB5WQWa8VFcHsKoQHrWbCC/12LFeC0EWBp2MPt3CPbK7r3rQtzMUJL0w1lMKjlycyxzIBU1sjgp/qwy67RW688muwpnTH9h1cqK6EY+NicnFTqh7EdcgPeEjN1O9G23KGgm3C5pSzfD788oPSqxD9X8ooWdn1e2i3XA2w0udM9JCOCEv2u+rmadWeMSL3UuvaNQRdk3J9N1H9Qk7xfzoaq4d2x7DxBNxYbRLrsts4VhuAi54HuD45r3XEsT6LkNIUx9+yHuLT12FJm9o9w2QupTAvIyiLBXZ65XH/ao+PJpYsIQvDnFa6BAg2bpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imytc/96kF+HW/KsYdtflMAJxXkMva9BKfcF6zL3Mrg=;
 b=TC3ApSB38UKx5/JgTrLrBCAqAG/YS53ddDAmJ2PO8PtcvEcLJSJB0SegyqccxhTZi7aoX5CQv88W7AwzB2t7z3HwmY0OCRqQZEREj1d5D8USncMuVJ76t5PBbj/IXLT14gl9gMG/um3yMGcENbFFJFGwLLVjo9Ib1/hQAvsEawUxwbJJgJ3k/VEaA17ZqurcWQffEUoqNTZiucpzwcmguM4M4pkwUSXbZdig67a/EQS5epB6pkXJvMeS443C6MJppn77ANgxI2PQ0Lmf9YbdCY7QagnvnSA0eVBZSWaZtxmJCWeDQJI3n5+WdwYdlR+GxNgj6hmcKNWpTxjB5VrOiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7508.eurprd04.prod.outlook.com (2603:10a6:20b:283::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 12:42:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 12:42:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] soc: imx: misc clean up and support i.MX9[4,52]
Date: Wed, 17 Dec 2025 20:42:06 +0800
Message-Id: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+lQmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Nz3eL8ZN3M3ApL3bTMCt2UtEQjC1NzIyNjA3MloJaColSgMNi46Nj
 aWgCg5MxAXgAAAA==
X-Change-ID: 20251217-soc-imx9-fix-dfa285722307
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::19)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7e5605-bbfd-4008-df0f-08de3d69c047
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ak9sNit2cUx5cVBIZWFkM1lkTnZZWTdZQjBaNXBpTHZzU3puZVVPZ1F6dnAw?=
 =?utf-8?B?eEVNYy9lRUI4WVl3QWgzdFZiOUZFVTZYQTZmUWtuZXhtUkZkQnNDZU5sQWhV?=
 =?utf-8?B?ajBVcXVYbGFadlZ3UWF5cFVReXMzSFdlbDdQbGFKTHM0c29JczRjUWp2REZa?=
 =?utf-8?B?a1Y0eVE2NFlYdUQvQXNoWXlXNUlWTkVIdkJ5YUVoZWtwc3ByZ29FNDcvUnBD?=
 =?utf-8?B?cE51S1ptazU3elpHT0VrblpXTFAyQzY2SHNSYkJKYk9kd1hmWm9QMXlVWEZS?=
 =?utf-8?B?SUh2emFNOXNBbE9oR0xsYXpucEpzOXpqUXB6ejFoZ2IwUHJXZFdBcitZWlFU?=
 =?utf-8?B?REZXc0lwM3dta3FFVTdpL1h5alpuTE5FR2ZmYWtOdTRDaGhFL3ZFZVBCbTFo?=
 =?utf-8?B?WHZyenZnSmQraUErYkE1emtFOEdNdkJxaUZ6QlBoazhCR0tCQWdCN0hRY3Vm?=
 =?utf-8?B?U3YyRi93N1pNbktTNjZtRHFqcmdUamlscEVmVTQvWkxaTkRxLzBTRk9jeGpx?=
 =?utf-8?B?UVRzbEtSRGNIYUh0U2ZudFR1MU1TREFOQXZpUUZlc2lDamV2ZkRYdnc0ZWI3?=
 =?utf-8?B?Wm5oUmYzWDV5aFhuRmZwTXRpdTY5eUJSaUsxdXFWQS9xL0MvWU5QRnVaRkxI?=
 =?utf-8?B?RzhLaDdlcURVdklOQTVWV1psSmlnaFJzTmNVODdFdHpBMGlvaVdybGxLYjZ6?=
 =?utf-8?B?YzI4dTA5YVg0TEpMdlF5MjJQNGFFejBRWVRTamVoQUtkMmJWNzdTZ2FXWW1u?=
 =?utf-8?B?cWhPSmNKQzQvTU8xUEtLRER0RmxUMVNpRVhKMmNPdVk5ZU16Q0RZb0xzaDFr?=
 =?utf-8?B?NWl1YVBkQXV0L2JGbE4zTG9zWElzZFdpbVhVV1JXcFlLTXlmbGNNa0kzQm1y?=
 =?utf-8?B?eXI3Q005RnNldU5tbkNqWGdHeFYzb0U0NHk1WDl4Z2w2NXA2YmZHOWZkQjJm?=
 =?utf-8?B?ODdGcGRuSXpTQ09BZXh1Umt1THhSL2lVSnlqMGdYOVRsMFR0Qll6TmVUSVBL?=
 =?utf-8?B?SGlnaU9oQjFlaGxyQVZidTA2ZVA5NlhIVVllUkVQOHlrZnVOUWVJeGpucDBq?=
 =?utf-8?B?MDMwbUxhQkg5NG9kRzhYNHNSYXRIVDNBZ0dOclBpWnBlRlRUbnRIbGxkMndO?=
 =?utf-8?B?NmJ5MGZEd3BVdFBKcFRoSlhVT1llNlIzck4xNnBzSjhGSkFkZXlkRkRlVGww?=
 =?utf-8?B?dnhQYWo5YmgwcmRKZ012U0U5RnRUckxRUWxMM1VYaGZ3bnY1cTV5OHFJak5H?=
 =?utf-8?B?RFl1RHpWR3F5NmFIdHBLcjlGVmVNdHB4YmF4aFNWYlp1U1lEM25oeHRSUFRO?=
 =?utf-8?B?S29na3JIeFl4bjhGVFRabkk2ZkNhbnFpTnVPcGdDVWU3R21HbkhTeWNub0Zi?=
 =?utf-8?B?Lzg3eG5qWHVvbk9LclRGMWNCNHdmTEEyOTVHeTVOeVZEM2kxSklYQk4yTjdF?=
 =?utf-8?B?WFdKVGdyMnZmNWFabTR6em5UQXZjUW1KLythYmlrRUJ6ZHhoallkUnBFbFkw?=
 =?utf-8?B?Q0gvR1JqREIyOXZLcVlVd293Um51emdHV09OMExRK2tYSU1aUjlMdTlxV2dy?=
 =?utf-8?B?UzlPc0c3S0p4U1JlMUVVQXRSZkZPY0ZiR2dYODZGb1psV3VhUmFPTnVtQ3V4?=
 =?utf-8?B?TDJWeHAyMVNudEYvem9iRzQycEtQdkJmRHRKVHhzVS9Vc1pXRldsSXZ2b0VS?=
 =?utf-8?B?M2pmWThEbWFKaHcreHZWWmJSQUtnRGNnNTc4TmVOYzRic3JnVUo4bHBaZWlJ?=
 =?utf-8?B?YUFKOCsxcTRMcmpqRU1QYnludWIwMkhwSUlGM3UyYmsxUXRHbVh6ckhEcm41?=
 =?utf-8?B?aE14YTJ5ZWFJdzJDTGgrOExlcWpTMFI4S1ZNL2dTL0NUajNrejA1ZC9jOWJj?=
 =?utf-8?B?YmZTWmY5aTYzN1lSQThUejArdy85L0J4eFJ5Y3BYblRlVFZHVXNka0s0QVdG?=
 =?utf-8?B?N0luQVdIS0VXMjcwZWV0T3NxT3owZ1RUSHEvMWFxZ05jUnFWMlFkZlBxWlh0?=
 =?utf-8?B?SkJmNnZKamd5NWNHanc3bElXVTNYNzZjVnRLY0JZYkdML0FLcU5pdmMwYVVw?=
 =?utf-8?Q?FDSF4X?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?empjZXJJUHV3Y2FRV3BlcGlmSWs4K1pzTWdHcDJISmpoL3NBM0NVU25NY2FF?=
 =?utf-8?B?OFB3RVhvYWlwT2lRK24xVGIwMUlZdkdESVVUYThiSks3MHVJZTlveXVhbXhV?=
 =?utf-8?B?T2hCdU9keFdhbE5Hd3RzMXZybGZRa1BzTGlKQmM1bnlYM1dCd3pLLzl5Mm5J?=
 =?utf-8?B?RlJhSXRhdzV2UEdyQ3pWY0FyeVlJRUFuT0tkODJ3YXJkN0hkNUJWQ1Y4UXVE?=
 =?utf-8?B?enBYbXA4Vk50K00wS1BuZnNKSWJoYkptNE5INWdmN2c5UlpIdWZkK3prZjJL?=
 =?utf-8?B?Ym00WDBkZEtvMUlZTFptQjgzRkF5NHVhVE9wTmhoTXBFQzJDUkdXejNsQlN3?=
 =?utf-8?B?dGVNbE5Ic3p3QlFDTWM5ZDRyNzdReTVkWkJ6bHZobURQZnUxekFNVk1JeE1i?=
 =?utf-8?B?STdHcUpTa2JPRWlVQWZhWVd2MGlVY1k3bkRTQTU3VkJZODBFQXZBbzRVSTF0?=
 =?utf-8?B?MkJ4VVJnNXdXTkN0dGtxMmVJN0UvSGdNZVdXV1VlVHRHSW1LdFFLeGxZNnFi?=
 =?utf-8?B?bytiZGVQalk3TFAyNllDNWI1YWJGK3V5SmRZVERsRHV3TnRDUkZTK1dkbDVY?=
 =?utf-8?B?UnlQamduS28zNjFjU0NqTVlFRUZrOFhHL1dZeTZlTEZwTGtubDV2bzhGV0N6?=
 =?utf-8?B?ejhrNTJpSUcra25wVmJPa3NyOWRpNE5KNExLZ1ZxSjNtWXFQdVJGR1I1R2pa?=
 =?utf-8?B?S1oyZG11dmhYQ0dwS2JrVWhKcU5GZlJJdnNUc0RjakZOSElMcERjYldNNFpX?=
 =?utf-8?B?KzQvRHlWMGd4c2s4cmEwbmc3blM1Wmg0b3RIU01IWUM2ZHZ3VEdCKzZ0WlM5?=
 =?utf-8?B?d1NESEVzSXdJVUYyTzVFOEpFcGx6clFobmpSVXZFeDQ0eTVXTVYwWTNMUjlT?=
 =?utf-8?B?SlMxNkJqQkErK0d2R0lwQjBnVWtraWRjZHJNVWlQOEFUZHJ2Vy9IL0hYREh2?=
 =?utf-8?B?Z0N0OTZ3MjRLdnVlb0hXNVR6cStRZzl4WGxFbzJFc1M5SFc3QThCbFUyVkN4?=
 =?utf-8?B?LzNVd2ZUd291V25BbHF1WFJWUDVQRER5NlVqeHdISE94MFlrRUY0SXl0SWRC?=
 =?utf-8?B?WkhkODBxdnR6SUZrU252SXBVc3J1RHRIWVRGWllyaVJhaTc3NFpPOGY2SmFt?=
 =?utf-8?B?eU5leTNzcXJDcEVzYWplYWhyVjZMWjNPMzlpc29Zcm82TkhQK2czVHRjOHZF?=
 =?utf-8?B?bGxGendPalNNWFBhSjE2QVFJVG1HeUdtYkpMWmd2YWIvNEtzTHlLR1VBVkZE?=
 =?utf-8?B?ZEN0U3ZlbGY3aVVYaUZ2Mno0di9iSFlmcjdaWUEwUE51clAvK0xpellOSis4?=
 =?utf-8?B?RkFhMVZMbzh2MXBzY3Z1WEhFUWhRMm5yU0ZVK29EZ2RGckVwbEN2d1Q1MVNZ?=
 =?utf-8?B?TXdlTlR5TVlzOHZsUXRNQzJGSUFpZGJqd1hJZEFmVkU5aEV3SVhLZVpnWkNI?=
 =?utf-8?B?WWdWR1VBL3hkNTlXN1NZa1BjYTA0MW04M0JkM3NPb2IxMy9pYkEvazRPZDgv?=
 =?utf-8?B?eVFUbWVxTHVMdGZTRzY3YjBUb011TXZwRDhXc0dwdUdERVc4OFhiNEhkV3Bk?=
 =?utf-8?B?MkFHS0s1a1hwQnp5d3NuWE8xVFpuUFRqVTlqSjJ0N2tqamlBdG5IOUFlQW9X?=
 =?utf-8?B?Y0kwb3J1WWZvT3BUK0VOZHZuK1d4RlIwYjFLQmk0ckUvVEMyVkhKV2tOUUFa?=
 =?utf-8?B?TExEL01KWFd0NllvbzV1OWFIYnRUU0xCNzlIeUZKQzV1amFwejdVL1B4bzBG?=
 =?utf-8?B?enJvS3lMTjZ6R2VyaHZKNDJ3eHovKzEzQUFlZVgyOTUxK3JvZHZOZFZRYUdQ?=
 =?utf-8?B?T2JUck01Rkd3UG9CUXRrWkJ0RTN1Q243dDR2UFBrVVMycUtwNG11SlZMNmdP?=
 =?utf-8?B?NUU0TnpwNThaWTEvOEhCUkc5OVUxeG1ydE5ZbXJYK05iNHFrMFZOdzZUaXpK?=
 =?utf-8?B?MDZJbmNnRmNnL21sUFozaHdHaytFUmJIZlRSSzNCZFo4bXNEQ1p6N0RhMzhq?=
 =?utf-8?B?R0ZORlhPVUdEc1BQU2F2N2tUNVBLQnBLbTRHeU03VUJYRzU3bUVISVZJbE0r?=
 =?utf-8?B?L2o1TlZqNUxVVzJ3VmNPRWJQNy9rUXBDSER3aEJsTXdBN0pPZE9ZQktacGtq?=
 =?utf-8?Q?Hi2cUvL44/dVrVvGQpoSvzp8w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7e5605-bbfd-4008-df0f-08de3d69c047
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 12:42:34.2307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzqHFbgN2lgML1xSPW77WP3i9E/YikLDjbnDy1AfVo254mN0L5vMgJEIbLtf05yt45XHtlHRkrI8b+6B0DDz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7508

Patch 1, 2: Use device managed API and dev_err_probe to clean up driver
Patch 3: Support i.MX94/52

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      soc: imx: Use device-managed APIs for i.MX9
      soc: imx: Use dev_err_probe() for i.MX9
      soc: imx: Spport i.MX9[4,52]

 drivers/soc/imx/soc-imx9.c | 46 ++++++++++++++++------------------------------
 1 file changed, 16 insertions(+), 30 deletions(-)
---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251217-soc-imx9-fix-dfa285722307

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

