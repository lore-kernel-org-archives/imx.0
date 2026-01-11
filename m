Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFCE33BBDF
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135263; cv=fail; b=D8G/3o3qmeyevzwmH3kxuQKYTflN1swGEIVBNETCzIW1EfRvyu8UCnY2cHsszYA9CUAbh5ainmxA3OTekNbxQVksEHT7VCjRSX3g+PAdLY8RCLrkFLRsI1Xh7eqNM9eDdW9F4EeBbTmUfYfpzAPBNml7vMdC/ro/aaTsHTNj0aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135263; c=relaxed/simple;
	bh=r88tmJrWvpCf+M09frrcMThB86FbPODkFMcHdkWvf7I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mopFB21FhSdIk9UOekzgD0/Eo5zmwGSPszQd04urYyZOTGBbOQTZoaB12mgEBC3aTK4x+RYz7y8D/kQyloT2+GKbXQMScN2IdTe/230/MFORim2vv6CCFE6aB8FCmHMzx4mFCj+2niUZImC/q27M5rGugkrPqMDqiy4QnugG44k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gtDo2lDV; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gtDo2lDV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzGtRlqE/8KWxVGJVAkN+bgdnFAa21TTV/mmwTFxKqWAKgvbctJbUSs3GJ28xShlof80tZMTwRtVs8dtaeFt2EAR9mBvpQ8h91l2uDptHWtq74ooqCz0mnzoZBDv6VEhPx52T7FSLYEHa+1KmZE50qooEVvyu2Tdsz6qYDPFL7r0KZ1B4T0qgN9bCpOo9whc6Q1yakmx86OpmGxQlUyKXIaFn2kQrKQhVpS1IMp17csFfYqjnmS22UaWQa/0O2mRUuRd68tyhrK/YaUSpsyT/CRRqTmIrBnZIisra/Gyr/0z0WFsV+D62iQQFWbTLeyRTgbJqG/i2Xga+kdZlpsF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxNgIQkT8iLFlehLSXkox6YRPf91Og1CdzZ9/nwasxM=;
 b=Vy3wfH6+ITmXfA7FDOUpnG6tXtFCAd97eGio5Ja3avFbwkCy9s4rzs1bhKNx1KeBCDjGL2d0DDw1QnAClqSG0y5HYT0Q83+SHEREt1mwOz3duRaTYH7IXCSafXuiRoOBKr0pEShEaIqxNZ+6SUHnP+oBp7Xv3bnJPs3HYvMlIWN3b+PCXd7d5QhDe5wu6Ww/cqwwTpWXCY4Jid0r/bE4qra2FPFn/t8ztCsxfcysdWK5PuuDBJyyCMzOMD+PRgk1HmjPi6rzuzl+GdZWqk06qaJQsNDYTwTfRj3ILFm3EBL1oyAiBmqP8dDamsX4vnRMxYevaNUojsjJ6LYOfIXucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxNgIQkT8iLFlehLSXkox6YRPf91Og1CdzZ9/nwasxM=;
 b=gtDo2lDVLclWFmBATC75CNsb84SZX7B0UIOays4Zp4wynMpQk2w2Y0zXCfAio8NhFZr/V5cF+IgK9zMDXIsQbzbbcCNCaG1wQhGJiee8zbrB3tfvm2n3m14XSq5xGS2vxAUuaAQTqhP8Vg7kjyKeTEoJKlEI9swkXe3UTBo6t77VYyGjIqA1YFSqZvlmhVFwv91chhJEC37AqnM3nJlTR2F6aoTEB18QV7BhARWh8fjLxjorbyvJ0xy2t8A3beZefF0+Hfi4wosLgguQEs/1DRUsZ3G1YK0Pv3ZfQZqy7aN+IvvGH1of5b/n2A6luc3pbSei/HO97+Vq5hkN6+RR7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:40:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:40:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Jan 2026 20:40:09 +0800
Subject: [PATCH v2 03/10] arm64: dts: imx952-evk: Enable I2C[2,3,4,6,7] bus
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-imx952-dts-v2-v2-3-5773fa57e89e@nxp.com>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e75261-f02f-4228-2b62-08de510ea824
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1FEbXE2UzRjRzc5N21WRkZzN1M0UlV5R1A4bVdaTTlUTkQ4NXkyM3RlNmc3?=
 =?utf-8?B?U1VnRGtMelZzMW1RSXlNZUVKaEJOWStIbEh3dkZhblhzd1pIWWtmd0lJSmZL?=
 =?utf-8?B?OHV4UXpnSUF5cWdiUFFlZVFtRmNFUFROVHBUOCs4UDlQNllnMGhUU1doVTY5?=
 =?utf-8?B?bXczZXpjZWY2b0tVclJFNW1iNGtwN0hCQ0h1eGhlbXQ1YkNVelNMb3dBYlFt?=
 =?utf-8?B?cm9RVk1oZ0VGNG00OVpvOThTZWlVU0NFekRGTnZvNnNqNHR5UWZOYVA2MWRY?=
 =?utf-8?B?YzBPMnhTS21aNy9iQlMvU3A2TmJ0MUY1YzYzb2xWdG9XblBSMTI5alREaWJs?=
 =?utf-8?B?MHZsMHVUSnl4TmRLQUhwMDNCR0lJb0dSQ3dYNmpmaXd4ZWkxZ1ppd1FNNnJ3?=
 =?utf-8?B?c1h1cnhZZjRCQVduRkIvR002bUZWWUl3V01venBvcFFZWXRQQTNHMnJPVlI0?=
 =?utf-8?B?blMvOVhFbDVtS1Z6bkVMcUdVTGhqMEE1alMyWWtpTko0Vlh6OGtwMGtINy8w?=
 =?utf-8?B?Y0xYWDZrZ2pmaC9hMEtEOVlRUzJ1S1Zwc3ZGUHNiZlEyT1RvWEdJaTZHYUE5?=
 =?utf-8?B?QkhFZkZmK2dLbzJQVjZnbmJkb3N2TmhNYlY4OFZIMnRCeTBSdFdETy9mOUxT?=
 =?utf-8?B?SitUV3pYNVpLV1BjSkFhNVNma0xPWHRoWGtUQVFqMHJDZHBvZWR2MklSOUFH?=
 =?utf-8?B?K0pTMDkyWHhYbE1FK2dYQi94U2hxWk8zRHZoSGxPWXJzMU1FZTR3NmJiN3Qw?=
 =?utf-8?B?NWZCRVRhZnVwMUdTNzhNMEFXckZ3WlZ2MWg1UUh2WW1uUUJKcHU5eGpKT0Zh?=
 =?utf-8?B?aVlPZk1YbDNhZkFJZzl3Nk52YS9ZdmY5YklVaitjSXozZnZjMnRCNElVd2NH?=
 =?utf-8?B?V2YvRWI3RTZPWVRtWU1QaXQ3UkdHVDRhSUtWTUhZZi9EREVXM0R5SWswM0hN?=
 =?utf-8?B?M1VISWVlaHFrWHdXaDBKR2xvYTRXNnBxRlZjMEx5STFiV3lsZ0NsanJzd0cw?=
 =?utf-8?B?R0drYVVPU2RsV0E0cVVRMThVc2FWdlkybGNPUWlXNTd1Mm12STZSSEg2dzRt?=
 =?utf-8?B?WGlpZjBYZ2ZOWDgvc0dPWmRWM0FlRzVzdWp6dmRrOVZiWDZ5Y2ZSanBxTjAx?=
 =?utf-8?B?SC9MUDRjTUpZSlVXdUpYbC9vQnpRT0svbUtYZGp3QTdQNnVwdjRONzY3WmJI?=
 =?utf-8?B?TU41b09Nd3doYVJYN0hmejRRd0hkb0s2OGZLU2xWY0VuWHNWWFJ4YU5qYWxo?=
 =?utf-8?B?ams4UTVZeEJjTXBDZ1VHazBOM09QRHhLVG9VY241R09WMGdBdGh4UG9NR2Y1?=
 =?utf-8?B?aVhnMi9WckhFWU9kUDhjcW9zZ2x1OERnTjBiWTJIWFZ5Q3BUc1hpazFsOXdP?=
 =?utf-8?B?TnZQdU1NSDdwT1ZqSUhxOUZ1bHFrSFhDWmcvVkZBRkhpN1k4ZkpZVGdyNFpX?=
 =?utf-8?B?WHJnZlFQU0F6KzF3bmMrRTllNU5xT2tYT0lIbnNFVHhyNzcxa2c5UUlCaXFB?=
 =?utf-8?B?Y3VVUk85YlVaMGpRUGhOd2tkblBZSVB4YXFKb0JpM1k5TGJHc2xpWkx4Y0xC?=
 =?utf-8?B?aE1MeWdmRG9ZanY0ZStTa2pOQ2M5YXl4eGx4N01lZ1dGYVBrc09oa0hkTDk1?=
 =?utf-8?B?bTRyU2tWRmZ1VTJ6UlhJbTZjNHBkeGFsWHJEOXN4dE9JWkxNWXVuRUhmb3or?=
 =?utf-8?B?Q0wvOGhJZnVBTjJzRUlqSGthcWtwMzcxRVE0aW9KN0FRREtrUlgyZWxtRmRF?=
 =?utf-8?B?cE0zSk1JRnRqSDNWbURHYklrWFd4eitVeWNGZnNUVW4yY3ZOek9WVlBmR01i?=
 =?utf-8?B?MTZnRXBabGh2NS9Td0ZwS0xuSDZoNTdIeHNWTmtWVTM3Z0ZaWWVSMHFFeFhI?=
 =?utf-8?B?cWtJU0NJS2RJYmlZQU1SdWkxcGs4aUo4K285Sk1yL1ZzV0kwS0M5N2FLMWt3?=
 =?utf-8?B?OWp6QVJoc0ErYS9pZDIrRUFPRy9GRU0wMURkOWJ3eStzRnZxbUlxOVVqK0do?=
 =?utf-8?B?YUMyK1dBUzVNQnlGbG4rUlVRekl0dTBTZm1PcjA1SnZlU3B2T281aUxNeUN3?=
 =?utf-8?Q?hOPP+B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDduak5icnIrMFBLZ21heHpNWWlaaWtzZ1lCYzVodFU5dG5CTStlZURFMGVQ?=
 =?utf-8?B?cU0xUzBsYzc5ckI5Y1J1SUsxeFB5MlFyc05MSTV1SURTTEwrYzBBcS9PWjc1?=
 =?utf-8?B?RUtMOXVJdWZrcHpIcXNFaUljYTVQOGFVejhRMldSc0dkOVdGSzFJTDJWaENu?=
 =?utf-8?B?SVhnYnZ3ZGp3Vm5yQTRFaWJoZnN0b3k3am1MOHpSVU9uQlZQRzB3NG5NWWFO?=
 =?utf-8?B?bDJSczg1bStrVmIxRVBZaEg4bXd0eE9MQ2ltR0licWZadWt0M3FkdFo5dWQ3?=
 =?utf-8?B?blJUUUgweVQ2S1ZHOUZ5QlNPdkZjYkt4R0M0d0lMajVEajZJanhqQWZFTlZB?=
 =?utf-8?B?a2FMQ0ZLcjdqYk9QSkt2RWN3V0Q2bXZVZCtIbXpBUElpOUs3NHF1bUNtb0hV?=
 =?utf-8?B?eE13TVJvcjNYdkx3VWd0ODNITU8wUEVLQnZlQjl6T0RWNHQ1MDZJMFg1dTJm?=
 =?utf-8?B?K2JZdGlpb2JzZzFDSDBDRm4vQmhxWFdCK1Qwd29ZWlYxaE9WdU13RlZmTWF5?=
 =?utf-8?B?UjVhd1g1MVZnVTNYSmUwYlE0NHVWME10NWd0bTlnU1BwbUhFM1NHU3hNN0U3?=
 =?utf-8?B?ek1SNFVlSGJGRFlvbDVqb3FBaVZ4dGtkK0pTaWkyOHZSc3EvbXIzL3B6bjdv?=
 =?utf-8?B?QS83RUx0Yy9ySGRiZ3VBYVdCaExjTTd0Tzg2MW5leUZ5NVhhUlR2MkRwUnVt?=
 =?utf-8?B?d1hxemNFUWZXNjhFNEh5RkIxTzNTSTlsTVRNUG9LMEVqRDk0bTZUczBVVG5Y?=
 =?utf-8?B?UmlDQk1uclAwY3RraXEwZ2kxSWowLzdxNEFvSnRaM25KNDdxVjZQbEVDM2Y4?=
 =?utf-8?B?RXdwU3J3TWJiM2pVUVFldWVYb09kYlFNRGMwV0Q4UlU5SEVMZ2szSzVZckIw?=
 =?utf-8?B?K0pWSUNVNjRMOXFiSWxDTmRycTFBQ2hzV0p6YS9sdUpRODFxcHJHMXV6emxy?=
 =?utf-8?B?T1U2SzdVQlJLVG1kQndhQk13RVQzZzJZZ2lnY1dyRE9rcU96azhWdm56Z1ox?=
 =?utf-8?B?WHJxdzJzYitTeGg0bUtER09HZ0t0eEY1SS82ZHY4eFdwSkhIZEJTRFZmc0FE?=
 =?utf-8?B?TGtZRzVuR25ZVFJKUXpYUGp5YWsxTG9MY1cybGREd3FMdVUxekE1c1ZNanFQ?=
 =?utf-8?B?Y0FVc1loMWFiTEU5UFllVXJxeUd4UmNxcmRORXROWC9TSWRlQ2s1ZWNDTEht?=
 =?utf-8?B?WXBFbUc4REQwOElZbkF6Qm5Ra28zWjI5R1I1YUNIMEUzUDVIcmMvNlY0bHN2?=
 =?utf-8?B?dVVXVnNqdmN3RExzcnp3WU84RVdwZzJXenFGS2lDK1dLZmFqZmgwdnZJcnJj?=
 =?utf-8?B?NEZOSjZNN2Q5Kzl1REdGbngwUEQyZkFRV2M4UnRuWUljbHpDYkw5RUYwa0dp?=
 =?utf-8?B?NEZSMTlPVjFtaUFTNGxXRmdzR1l6WDZsWkdyeHVqM2NCdW9zQ0hHbUU1QVlY?=
 =?utf-8?B?em9UK1RiYXZsSTY0Vmo4cHdUaGNRRHV6bWVsQUZWRG5xRDJ2NzJtRDdjdWRF?=
 =?utf-8?B?WUZUYXBXSUxnc0x5NCtZYnRSVE9HRnV5RW9reDhQNWpvRE5UVkVkbnJnRlVp?=
 =?utf-8?B?ck1XSXQzejYwVWFXKzlkSnZjcGMwN1JCalF0U3RCL01iTGpPUWdPSlVxTHFN?=
 =?utf-8?B?elFtL3BMeExjbG1NTkJ3MUVTeExMNFFGUlhXdWhMVFFxbExwUjZvb1d1akc0?=
 =?utf-8?B?S1Vwdjc3c3ovWmNWM0R6WmNHSmlIc2FyOEZ3U1VZV2RvZ1ZuMWVOeVJYbWYr?=
 =?utf-8?B?bkxBRWNKOXNjeHh3M1FDQ05TdW5qSXV4ck1wQTN4TTdvUUljVFRRR3ZRdXVU?=
 =?utf-8?B?SnlSQUZCREMrTUw0NnFXQzdtVEtncTFlOXl5VjRqbzd4V3RuTXhXc3pPZzl3?=
 =?utf-8?B?a2dmS1JVay90RWgrb09XL3Ixak02eEpFUXEwSEwvUS9xVzVkSkRmMDE1YmR1?=
 =?utf-8?B?ekxWNkpHQUM4Z0kzTklaRmdQMDlZMUdCWFJNcEhjVFJhTWpYanlreENaYlQv?=
 =?utf-8?B?TXE4bFQ0am10MWk2RXh4NXc1YzUzZHo2blVSSkx1cTZGSjI4aGJlWFdSUFVS?=
 =?utf-8?B?ZjRjL2R5MHhVNit1dE4yeVRuMUlseEJBOFVzcjd1SFkrOStGbjZGWGRVc0Uz?=
 =?utf-8?B?dmlwcnJ3TUtPbVA5V2ZDZzQ0MEJUKzlrUS95QWJUR2ZPS0dKdFVENFdkZ213?=
 =?utf-8?B?MzF5UnZzdGM1Y3Nla2c0R1RhcFBscTRuaWxXOU9xblVJa3hsWXpSOEFrdGgz?=
 =?utf-8?B?cFJrRjhQckNRd3NWelRISk5EVm5tVnozckgxT1ZkZVgrdVRaWWVnaytlY0t5?=
 =?utf-8?B?UXNNWk5PM01NMlFXaG43YklWRkhFWU1wUFZKV0UyTjlBNE85aFI4dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e75261-f02f-4228-2b62-08de510ea824
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:40:52.6617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B33d3c1XzsipnCy35dgLQ44ETwkFUmqF7rxakOlMoN2f1+wrLN2iojPGZ8yGyZxNuBX4FOiEy0hc72P1SEgYfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

From: Peng Fan <peng.fan@nxp.com>

Enable I2C bus[2,3,4,6,7] and the io-expanders connected to each I2C bus.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 166 +++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index e5d989bd7c7b7f8b7c0b0afd0ae8f108110e4a49..98f2f96a91cc37acff64615e85cb718cb666a00b 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -17,6 +17,14 @@ aliases {
 		gpio2 = &gpio3;
 		gpio3 = &gpio4;
 		gpio4 = &gpio5;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		i2c3 = &lpi2c4;
+		i2c4 = &lpi2c5;
+		i2c5 = &lpi2c6;
+		i2c6 = &lpi2c7;
+		i2c7 = &lpi2c8;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		serial0 = &lpuart1;
@@ -79,6 +87,111 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 	};
 };
 
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	status = "okay";
+
+	adp5585: io-expander@34 {
+		compatible = "adi,adp5585-00", "adi,adp5585";
+		reg = <0x34>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-reserved-ranges = <5 1>;
+		#pwm-cells = <3>;
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	status = "okay";
+
+	i2c3_pcal6408: gpio@20 {
+		compatible = "nxp,pcal6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		vcc-supply = <&reg_3p3v>;
+	};
+};
+
+&lpi2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c4>;
+	status = "okay";
+
+	i2c4_pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c4_pcal6408>;
+		vcc-supply = <&reg_3p3v>;
+	};
+};
+
+&lpi2c6 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c6>;
+	status = "okay";
+
+	pcal6416: gpio@21 {
+		compatible = "nxp,pcal6416";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x21>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6416>;
+		vcc-supply = <&reg_3p3v>;
+
+		pdm-can-sel-hog {
+			gpio-hog;
+			gpios = <10 GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+
+		mqs-en-hog {
+			gpio-hog;
+			gpios = <15 GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+	};
+};
+
+&lpi2c7 {
+	clock-frequency = <1000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c7>;
+	status = "okay";
+
+	pcal6524: gpio@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6524>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &lpuart1 {
 	/* console */
 	pinctrl-names = "default";
@@ -112,6 +225,59 @@ &usdhc2 {
 };
 
 &scmi_iomuxc {
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			IMX952_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e
+			IMX952_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO00__WAKEUPMIX_TOP_LPI2C3_SDA		0x40000b9e
+			IMX952_PAD_GPIO_IO01__WAKEUPMIX_TOP_LPI2C3_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c4: lpi2c4grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO30__WAKEUPMIX_TOP_LPI2C4_SDA		0x40000b9e
+			IMX952_PAD_GPIO_IO31__WAKEUPMIX_TOP_LPI2C4_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_i2c4_pcal6408: i2c4pcal6408grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO18__WAKEUPMIX_TOP_GPIO2_IO_18		0x31e
+		>;
+	};
+
+	pinctrl_lpi2c6: lpi2c6grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO02__WAKEUPMIX_TOP_LPI2C6_SDA		0x40000b9e
+			IMX952_PAD_GPIO_IO03__WAKEUPMIX_TOP_LPI2C6_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c7: lpi2c7grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO08__WAKEUPMIX_TOP_LPI2C7_SDA		0x40000b9e
+			IMX952_PAD_GPIO_IO09__WAKEUPMIX_TOP_LPI2C7_SCL		0x40000b9e
+		>;
+	};
+
+	pinctrl_pcal6416: pcal6416grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO10__WAKEUPMIX_TOP_GPIO2_IO_10		0x31e
+		>;
+	};
+
+	pinctrl_pcal6524: pcal6524grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO36__WAKEUPMIX_TOP_GPIO5_IO_16		0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x31e

-- 
2.37.1

