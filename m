Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F33112DB
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530967; cv=fail; b=YCAVjAc6h85aRano8uAEXatMxt/FkymlGq0qIgZIuNk70UJ/rpqLBhFS8iyNFYOIWrJVHf8GSUHgdg6UzDJEUcVfHB9gcmbnzv83dUhdq2NRCDNjs/eH+dxsHF89ZgWm4ByRIqc+knGWlfqmnao8VTsD3gdThdehQXya+l6D0kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530967; c=relaxed/simple;
	bh=ZVXXbwB7MB0mHwGP8/cpxAgD+JZZpFbm6swPlrUoivw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=blM/u1LBma0MD/bHkCQuKZTll5LpQdnvcUIAZu9+7D3hD79f4FyOPL3arTommhEPuc1hX51I31aSQPh1N/6jOoeZJYwrwZDOgG4hQjcoI20Dzp2PNaaQJSd6JCZoHudtqxEbvr3FD4IGr9+4ZkCG5CkP9UKneUyIFHJcBebobxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NgZ6Gt87; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NgZ6Gt87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMtMcDz8/RT7nlDmNFN8GfFdKht5pXsL3gkjGH+kHP/f5tk04qtkGjzNvyiPLtZeWq9mubyYxf6WF5mUbmx9qexw9/lMcQFz43uqJ4D4IdgzQ9r4M5ocATTjfMGWhJQgod3yVj91j+4xMgo6KEmIFRVbVR1uGBP9tptGmoyrHQKoYlyRC/B7E74j0zv492wBHpiFt6j2ndIfJK9aQzx0f4SPigEsVNcXxnEIUlmCTRUphYp/HOVicGYPINjtj/eQ3w+eSNhuq41TOYf9ZB2BvOmMWdhe6wFEr3iRuupUjGoA5vKonmQP2ZGZmGCN/CPz8A+jzM4RrP8PgRxHfDLQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzmFbK/dqDYXLReqzyR0K1asbPTcN1tHrMp0aH1Ha2E=;
 b=FxjdgERnQ38ci2dgqfV/0+k43hONrQ7FQJin3UsbFGXtpYT6lYxoIczCn5B1u5mfeCU5NFeSt6e9CowKQKMSA1Hwq9znpOlH/egY3jNth2xeQjccbw8RwoPs/HiICCEsNMYywTVtYiqduOn2k7f7mKokuEgDlXEhQirVDigA55+80Gg0F7uuyVLYNHE/ZJUovIGBCWJPIZVr+JelwWnKSHuRnivSZ4TDldFdUix5SeAUF2p/jlDQD3orMsNTP0vRpoKBvx01wulEBxs4PmizFJ9gDxOJDcGJrxWKBBAsRN/uWO6f3Ztdt01sArM2lJphocO6QIkn71eJM0vPXOKjqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzmFbK/dqDYXLReqzyR0K1asbPTcN1tHrMp0aH1Ha2E=;
 b=NgZ6Gt87kXffOFVTyEqclVgIrqz3HgRgnlDEIfaL/GK6pmd9vC7D9VFuEzb/u2NOMeFu0JXppY1uOeDb7e25u9IyGmhUwGYofhxC8gt7aeUBq/jtAgSqshweG/PnRwvFGnYNsUsHEGRvtCES4WPZlyqkEsDEHTm3AVJdS+JixPYy9phaHae1jWcv35wCCJq+m00BJm/4o84JBfktxf4ASn3k3ci2S5j5wJCRwaxfZU8a37NMmZMXfOqxdE51dg4N6epfdUj1rZ3Gk2DOuqNDswtbH2BjqdUWB0SEEmjKLxt7d2ptStYowiskq3eb6AMDGYBQyUBR4porJC+ef4I7zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:16:03 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:16:03 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 12 Dec 2025 14:44:15 +0530
Subject: [PATCH v21 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx-se-if-v21-4-ee7d6052d848@nxp.com>
References: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
In-Reply-To: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765530894; l=11092;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZVXXbwB7MB0mHwGP8/cpxAgD+JZZpFbm6swPlrUoivw=;
 b=195YobrM5hOgmSz/UBUX60TQJE5HKmG++AOaUmAhiJkVY/IOH7WBs40/sTRQYCbnUQm3DNMd+
 jzAONrCJuQfBzWc5aJAp4WXNfeG55X+EI2AL0wUVQLe9+lj73Aa53Ha
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PAXPR04MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 03703818-87ca-4ce5-4317-08de395f1291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmxlVjdKbm84akE5RWpWa2pjaXIxZkNDamJ2RHhFZzNHSndNTldiVWtaQlA1?=
 =?utf-8?B?c2xKckhIUjhBU0hzbkY5bjBxSklGNitNYzRLQ01CY256eVhQdWNoMHBoLzQ0?=
 =?utf-8?B?S1JJNmcyQU54UzNrRnkvYXB1T21rOTdnMWw5K1psbGQ2ajJYaE9WVEt2SUJo?=
 =?utf-8?B?My9ZaENMOFRDUDFYcVQ4dE1taGl2R1ZUT20zdWNwVmRaNHdHa1pnMjN4T0Fh?=
 =?utf-8?B?QzZVaU1YOXRQbDc2K21wWUxEYzZvODN4Tm9rUDFDTUYvU0dQcWZhRysrSEta?=
 =?utf-8?B?d1VYQkJ5bmIrTXdYVGNIQjBRS2NXWWp4a3BtczdPMWZSQ0x1U0tHUHlwUDl3?=
 =?utf-8?B?dGVGa2U3d2V5clZVQi82Z1ovYUkwd1RWd2VuMlZFUENyenA5d0UxeVVHejFs?=
 =?utf-8?B?Sk9MUC9ITkV6V0U3UVEvSUdNbVl2MTFwNWdodXQ1YlE5ZHBrU2wrRldMTCs3?=
 =?utf-8?B?aUdZY2lYUWcwaFJJZFNRTEtqaFNrSnJWNlVDNExjeTNXUW1ISG5MNjZIUGRt?=
 =?utf-8?B?OWY4a3R2bWdzYW9PWis4MUFNTzVML0gzcHF4QklMYkdMblhmODdGdElYYyt2?=
 =?utf-8?B?M3NpU2RGMk9vbW1DY3RHZHBMVFY4QmVKMHBud2dScDZCeG1YK1FiSVBZeTdu?=
 =?utf-8?B?UU1iRHVDeTR0cDdlUVYyYXhRR2M2MGhMUUVwYnpjZXo0dkcwQXJTbFdVeDk3?=
 =?utf-8?B?QjlUNVdnK1hoN242RGh6OEhDbGMva1ByZHZ2MFlXQXJMTHpyUER4N0dQR1E5?=
 =?utf-8?B?cGVqVUl1ZWVjM01mbXdtSGhOL3picVpnSzVKdUM4VHVMaHdZUGZLTWcxYzl0?=
 =?utf-8?B?c0ZNbVFtanZSNXRndE1WdERSb2NldE1Bcll6ZEJvaTBTUkdKMjBRUVNTU09s?=
 =?utf-8?B?cmhvc2ZZeGRtY3ArZzMzYUhoWnhYYW5BS1FNcEVWSmJOeTMydFhZclBGVEcz?=
 =?utf-8?B?RzAwcGY2Yms4RDk3MDg3YmdTMjlSYWJhanRzTWN0bHJxZDV0QXovUFZPdStG?=
 =?utf-8?B?VWdncG5rNVlhZG80U0o1c2MySVk4djJOS1Q4ZzZYVi9PcUE1N1VZc01iLzZJ?=
 =?utf-8?B?UUQzbTZyMzZOb1NlczB5bGo1Uyt3dHdDN2FVRkx5ajZSL05rM3NEd2pYYXpV?=
 =?utf-8?B?V1ZiR1psUlhPL1VRMWNaV1ZpU0IvanN5b0VvNm4vQUowcHluWUhmOTdTeHVr?=
 =?utf-8?B?UWphUHpvcDJBZTZydjh3alFVc29nM2NvUVMvNlRXRHBHL3A3VUwvd0p3NGd5?=
 =?utf-8?B?VStkTDhHdUh1NWlUYnFIYWJUazlURkNNU2JRYWJhNE1UNnd5MGtqYVB3V25v?=
 =?utf-8?B?SHdaMFZTNWFrSG5LM0ZaS3ZUbXZzNDFCYjRsdCsyemhKVXFtS3pwK2E5S3pN?=
 =?utf-8?B?V0pNZ05TaGZvcEl1OGJMY0lLdVFaSE9HYll4NnVJWkRRQ0hzSUhxbkxxVDNS?=
 =?utf-8?B?bklrZXB5dkgxdXliSVRkS0FTMDlBdHllMjFtRE02Y05XeE9xSHlIZmhlV1hC?=
 =?utf-8?B?dURmUE8wcVBheVpyd0JQZ1BTaHVlWWhXTlhpU3BUeGU0dWpuaDR3eGxaeW5j?=
 =?utf-8?B?VG5yT0MxZWZtdTU1eDdsUURlWkliRE45b2I5Rmh1VjhvRW9lL1lUY0NTa3Nk?=
 =?utf-8?B?dnQvelEwNFZmdXV4NEk0T0hnWENJQkczSldXTzJsdkhkRjNGeXd4YzBUUGRG?=
 =?utf-8?B?YlV5QmhMU2JNR2wwWExCUmpkV1lweEpHRndZVnoyaGVsWE5KNEQzN3FzWTAw?=
 =?utf-8?B?OTJKdTJlY0kySk1sMEE1dzA2a3dydW5IcVRMZUE0c3BxOHFFbzZRRjV4b1RC?=
 =?utf-8?B?WnpsZFYzQm8zRTlkUTF3TXhpa3AyOWkyNmJ3cHNDVzc2N0RNUmQ4K0gwNGNa?=
 =?utf-8?B?UzJpanJTUjFGcUNwN3cyWWYyK2ROcGlGWjRJREI5QzJzUk00Z29JRDBSM1NC?=
 =?utf-8?B?S2JOV3hnRUZWZmVINU9zOTJBY25uQnh5aktyNXZzaUFTSEJpMlc1ekpLdzdj?=
 =?utf-8?B?bDNBYjhSaGhXc1dTUWdUdytmd09MSDlhYWRUVWNwbWJMZmFDUlVtY0pvNUor?=
 =?utf-8?Q?QKmu3f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2pha0NpbTIwN0ZuZnRLNTBhcW9YQWpBNVg5Z3NzQjZlMjVWa1FZWUJ2TzRs?=
 =?utf-8?B?aWlXejhkYjdPeVBhbUgzU2FKZUVHS3NRUEVFZjFhdno0MEo1dlJ6a2s0L29a?=
 =?utf-8?B?d1hSNmNCOUwvZGxuTkIvdjBVaCtkWEJ2bWxxNnVRbW84anI1d3hXQnFrSFB5?=
 =?utf-8?B?K21GZUswTnh5cmM1cWtsVHJ4eEg1Q09pdHoxd2NNMTE4c2NLNFQyeWUxdVVY?=
 =?utf-8?B?MHFkRTNDL0kvRVc3TkdHSWgvM0Z4ZEN3THgvNFpsTnArL2xyZEZPNWlSZWpH?=
 =?utf-8?B?cTdkdExZa2l1VkQrWDd2Qm9jaUQwaFhjYlRrdnBIcEZlWkZGakhhN3N1KzRO?=
 =?utf-8?B?SHdZUjBtT2VxTWFCKy94ZVEzQTBqaWxTa1liYnFZNUhnWU5rMjdqbE5zZDdC?=
 =?utf-8?B?cHBsVnozV2N1YTNtN2VQakJKNFZKY05hT3ZrRktkUVlGMmFMc1prOFk1WWxP?=
 =?utf-8?B?L2oxalkwZWtKUjI5MngwT2x0Qlk3L2lFU1R0a0VDTE0yV2VNYjExK3k2MGZL?=
 =?utf-8?B?L283cVlraElVQk1nMkRWdHQyTEVTRlZwdUw4eklFelM0ZGJCSGhYdXhpWEYx?=
 =?utf-8?B?QUpXRWwybUd0aFJzS055dXRUaEx6UTJlY3c1YzVjc3ZNSnNiRVg4TXAyLzdG?=
 =?utf-8?B?aU96emo2Y0NJM2ZFTyt3d0l1RkduRU1aMm95dGtGeHFVQ3hSTjcyM1E1WFJm?=
 =?utf-8?B?TFJ2RlJiOGFXaUxmZlBZN0F1VTJPVnY5M1I3bjRhaWE0L3NBK2loV3djK1gr?=
 =?utf-8?B?OHNFVktKcU9iZ0kydHd6ajlPWmVVTWQxbjNadG12STg2SCsrcFZNWFBhZENy?=
 =?utf-8?B?WnlFNEJ1eEE4Wmg5L0tXSHZ0N0tBZENiemM4NjZQK2tiby9xbmsrTnYyeThR?=
 =?utf-8?B?Z01MRUN2SmNFdUFCUkd1V1RkU01EMVU3anNyNitNNThtQS9hTTRISlM2S2Mz?=
 =?utf-8?B?eUxTbEFENXZweU1XQVRIaUl1MVNNd1NoTHoxYXM4Ti9tUFZZaCt4ZWdCbU5l?=
 =?utf-8?B?b1MyUzQyV1lxbE9OaTB1Um5iM3J1ekhTcEYyY08wTDdCS2VGTU5mQVpMaWZj?=
 =?utf-8?B?dzUzYjkyUDJQdmNqK1l4WldCbUt0MmNtRE5pTVc0REx0VFFrVmM0RFZwVzFE?=
 =?utf-8?B?UEllSFhsblNzcHpPa29EY2FhSEJlQTVoaVF6Nm5jbXlZTE9EZm1CTXpZczRp?=
 =?utf-8?B?Z1U3b2ZMdnowVjdYTStBZnRhd3F4Q0JsSmZ2ejNmNmZxZ3RIT0JNWTFIbHQr?=
 =?utf-8?B?OGVTWVJLOWxSS3dmdGYrb01IeUdkdlhvOU1oSEpqakkwNWdjZUM4NmhFeGYw?=
 =?utf-8?B?dlZMNUdLU3JqbWNmUWlLOHJlZndmOUN6UWtUSEs0MzgwZ1BSTzhJRTRnekRj?=
 =?utf-8?B?S1JUc25zazZoSEpJVGlOSklBZ244NTYrWDdIVi9UWVpkbWY3WWFQdERLRHho?=
 =?utf-8?B?R21RY3lzVG8xaGJQdEwzZkppQllrZ0JoUWI4MTBsTW9rZ2kyZmd6cVVGeW4z?=
 =?utf-8?B?ZTJkMThGNmtqK2tnNUFRbDNvd1JOK0hXcFZ6RUgrMW5tRGJ0MFJocFBXZ0dv?=
 =?utf-8?B?TUl1Y2NabDRDVXcrSTZjRlBkMUI0U3JmWU5oQ1BPRTF5UEFyWW9IWnZvNE12?=
 =?utf-8?B?MWMxTzlzc2ZKZzF6WjlTSHFkRkV0dmo0amRkYnM4N3g3RXlXdVY5R0UzRUNB?=
 =?utf-8?B?bW85VytpVFQzdkJ3Y1MrRTdwRHJ2cFZWMDFSWmQzUWJmMzlOREoyeTdXdXpY?=
 =?utf-8?B?MVhrQjIvMUUvWStFODRIYWU5RXNiekdMSlBHK3Y0bUhRQTlaRXhpbW55VlZM?=
 =?utf-8?B?dDVDTHFtWEkwK2tYKzN0RlV0NllYRnBnc01OSkM5aGw3OStLeWNkbDV2Tm5s?=
 =?utf-8?B?WitYZGVVYkhmbmY1aGRnV3l4S01OK0hVMElIYmNpQTdWSlpERmlZTTFOLys5?=
 =?utf-8?B?Q1BOeUtzNVNHQU93SldRY0c2OFA2WDg1NGNVRE5lL0p0ZG14Q2VlTGlVTmRJ?=
 =?utf-8?B?Ujg2c2oxTmc4Tmo5RHpYWFNTRDlsUlpBSlJTRXNwbkZsVWp0aDRCemFqM3cv?=
 =?utf-8?B?eng2NzFVbjVRTDFEZXZmUlZSRU5nWUpXeFJjMXQ1NVhjYndGMms4NThxVXU1?=
 =?utf-8?Q?Ffr8aHkqc5esyuQQP1syxN/4l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03703818-87ca-4ce5-4317-08de395f1291
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:16:03.1427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzCzyLIq//tfqn+EMI+HfaGoE7xK6hF7LNni1icyEH1vrJanLjpMZvOFGNMGHCKkF2JgzRhYJxCO9YfBXqwKBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 14 +++++-----
 drivers/firmware/imx/ele_common.c   | 51 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 29 +++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++++
 5 files changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index b44041bc41e0..4d1f0d43963e 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -62,8 +62,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
 
@@ -116,8 +116,8 @@ int ele_ping(struct se_if_priv *priv)
 		goto exit;
 	}
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		goto exit;
 
@@ -167,7 +167,7 @@ int ele_service_swap(struct se_if_priv *priv,
 		goto exit;
 	}
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
@@ -216,7 +216,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	tx_msg->data[1] = upper_32_bits(contnr_addr);
 	tx_msg->data[2] = img_addr;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
@@ -260,7 +260,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			goto exit;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index a7150ff8e3b9..fcd0f561d72d 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,7 +42,7 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	unsigned long timeout;
 	int ret;
@@ -52,8 +52,8 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
 		if (ret == -ERESTARTSYS) {
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
-				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
+				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				continue;
 			}
 			ret = -EINTR;
@@ -66,7 +66,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -78,15 +78,16 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -94,27 +95,31 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		return err;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 	return err;
 }
@@ -159,8 +164,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	/* Incoming command: wake up the receiver if any. */
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
-		dev_dbg(dev, "Selecting cmd receiver for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -169,8 +174,9 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
 		}
@@ -178,14 +184,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
-		dev_dbg(dev, "Selecting resp waiter for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
 		    check_hdr_exception_for_sz(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 		}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 96e987ef6f88..5bac14439d7d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 1c91b4698465..63562a4d9a3e 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -203,6 +203,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s0_ch%d",
+					  get_se_if_name(priv->if_defs->se_if_type),
+					  ch_id);
+	if (!dev_ctx->devname)
+		return -ENOMEM;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return ret;
+}
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -325,6 +348,12 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index b15c4022a46c..b5e7705e2f26 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -19,6 +19,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -36,6 +37,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -80,6 +87,8 @@ struct se_if_priv {
 
 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

