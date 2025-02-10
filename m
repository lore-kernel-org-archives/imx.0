Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E1254B0C
	for <imx@lists.linux.dev>; Mon, 10 Feb 2025 21:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223382; cv=fail; b=MP+9mVNZ4boiEJ6LdMeR8ZooE9BVHwS95FwBcsu95TliuNiSS/y4tLgW5R9keL3GfVY7NjPB9WN26SMhB/a+TlGUVodPLugb4ENy6CSdKxFcXt4PvqZZBrOJDOmXiD15nilBHlrrbEAzWcHsoc3q+MP/xJV2HylXmu5aeQF4TCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223382; c=relaxed/simple;
	bh=E8vBfPQ4FkVcDWqUJU6uCrRaNXs8LFrfcXdgtyMjOB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l5ugIMDudmnlLeBqYBOao+mvvjSA2PFyl3vLdTfVk7df4Jyx/wmtmDXntMhUmv42Q3j/QHaelm7jZXsPRDK8ixAoiT5IbcHk/XUGKlrxaED+FXSWCZr1AYUQIXdzCyH9sq72s4qBRCVCFUohTIZI5rjAtfyvrARFN5SSx+3Ex50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q5KMLKB8; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q5KMLKB8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVYHI4odWlFuY8+ZbvIN4zj5Yd1DgP+8JF3IH4i6br0NZ0deOmYGVu1U5GCJrPjVxDUNIRTlBh5v+Y0aNv7IWP+phYFszWVEZmEa6ndcVvbBEt8OPdcX1DzqKo3mjXMsXqdfukMYPK5/7Zn6KM5RJZJRmkFCWsNiCgYA3XJ34NWYSNrF9QKPJzX00cyfkbsSkNgYIFhP7uM/MwJDKFdiChc4cMwFOW7bwWKfLlEeHkdOhjhPH3ks6iJuctcooxpMR0Q4zW3Q3uUN0zm2l9aHoe86EIS6kaF1Hfh6iFrhM4TW6iWY8IOSQqMo78Bs9/SrtNu4Io9W5lKNiFuxRxlxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8vBfPQ4FkVcDWqUJU6uCrRaNXs8LFrfcXdgtyMjOB4=;
 b=auULBX5bSKCTGaFloBfpbpFeJnkkMBDs3TFlX1N99vKcQp4/jl/OHyIJwvsFhUX4ClPFbXaSCd2QUSgXoNtsV/CaCDYyLrHCbTOGMerI4upS1EGvJOYu+O8xHyDOiIdd7j33kD9i/8RjiKKglCPa3jSfsnlFmsfkb5RZVYAjpQpsSv8wucKIlVKO/+Z3bEIx8Wi1oYXNZfmKrYpcwGBg6A66d22zLU5GH/hpge0bZ5+B8oEaqA5jG+JEphb5tbQvzDMscOFyPC6uOpEx0b69UZxhIRJ/VhIk0kJIDLuJIBj1QvkBoqCa5G3v2A9IwjjryEoKXOAOu6MBmfcAm5i/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8vBfPQ4FkVcDWqUJU6uCrRaNXs8LFrfcXdgtyMjOB4=;
 b=Q5KMLKB8Rd6v3ssyYbW0SE+kzPW0tn2E3idq2xj8tJ25l9aekoNr7WGZuOtB5amtsQgCu2tfIWVyUUVOEtrEv9a9U1L3UjPwTX8ZdGJGsndGN6jL9+CGhwGM9VSeGf/VQBHE4lL3FLCYDCFIAuudtiPaIxkMJ1KNPJxr9Do6fGrMxVuMEY6HUMgyYRPkV0JkIUiRKy0l9uiQ5TFi0DQgbWO1WlLK1NUJV/aKDVOvGIjdw20952upkAQZ1lyZ+fzauF6UwkGa7BvGbrRA1vW1C2MSEd/Dm0RAqj/rBJbLH71sTtiKFAEZmBpsYAaIG29611YmMBWwVVpR00JuMCWs6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8783.eurprd04.prod.outlook.com (2603:10a6:102:20e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Mon, 10 Feb
 2025 21:36:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:36:17 +0000
Date: Mon, 10 Feb 2025 16:36:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev
Subject: Re: panel-lvds for imx8mm-verdin boards
Message-ID: <Z6pxSgMmh94fTk1m@lizhi-Precision-Tower-5810>
References: <ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810>
 <CAOMZO5AcyVeq8TN9qK=_54gP6y_rrCLjh22LnA=E6pLnxjbpNw@mail.gmail.com>
 <20241218141101.GA25083@francesco-nb>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218141101.GA25083@francesco-nb>
X-ClientProxiedBy: SJ0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:a03:333::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: 39a75721-d6a7-4837-e6f7-08dd4a1af347
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?N2dpK3FSQWdzM2VyM3JNUFJWN3Q1TlJDcUVlS2lDRkI2ZTcvOVBGY05SV2NN?=
 =?utf-8?B?Mk4rVVg0RUxnQ3BJSXF0ZWk5THlDTDRCTWkreFNZRHRpWGJmZk5UYnRWU05S?=
 =?utf-8?B?TDQ3ejBZVjIyLzB6RHhTclZUWnEvRWlDNlNsODdtN3dtb1hOcWpwenl0MU92?=
 =?utf-8?B?cmdxNUJWdmZZSThwZ1hwSzVXeWpCRkVPM0ZVdmhnUWJPb1Ewa25CN1hDMm9T?=
 =?utf-8?B?MDhhT29tRkF1bE9DNjZSQnJXSk1WakZEZDYyM2NNc25IMXFORkhNbjVtdkJl?=
 =?utf-8?B?a1VsOGo5VnRTUjIwSVZsWmpZcDFUakxYQnZsYTlnK3ptWStRbk1wb2dQdm0y?=
 =?utf-8?B?NGJhcmpCQTNoaHY2RVBDMDkzQzAyMVgvemVsK01ybWNQVGVsNnRhaHYreXhv?=
 =?utf-8?B?ckNaS0l4SHRndU81UVduNWFFdDhVcW9sK01MMkdWTzVVSG5vNExKdVVXWk1u?=
 =?utf-8?B?d3hiRFlQSVF3TVpFUXBQcEh2blZJZG4vZGNxZUQvRmtXR2JKWVVaZUROQTRs?=
 =?utf-8?B?SFl5U1k1QjBaRzRPbE9DWUZhOG5xTTRQUzNyMzVJd0VQNU54NnE0YWl3dkQx?=
 =?utf-8?B?Q1BpWUw3ekdTSlIxWCtXTlFsZXNKYjkxUUtqQXFrbTZ4dXF6MjVELzE2aXpl?=
 =?utf-8?B?alQ1c1VWWTJ2ZmRXYXRzOWY1SkxhR0VBNWdKUmd0bkg3RjBzNHI5Q0drbUFL?=
 =?utf-8?B?dk40T3RDUThZU25aaXZ0YnpwK3U5bWh4Y2NLZDFLSDVhMXMvOE5PK3RJR0o1?=
 =?utf-8?B?L3hueHZOakFBc3JIRzlwdW42b2xyRDJqc3M3VWdabHcrdGFsRG9nVjQ1blJK?=
 =?utf-8?B?L2tLemtJdmc0bVJQVFoybzR2UStML09BTXNESlVDTFloU04vY0NaZUEzMUpT?=
 =?utf-8?B?T0FNUjh6aEdhQ0pYRkU2bWU3MURGSzV3cnNuSjQ4RWRBK29aQTVtOTVYb29k?=
 =?utf-8?B?Szg1enkvK0hrOXBDcEdlS3VReUtid3Y1MWpHRFRoSS9Pcit6Tm5PUXFWUkFF?=
 =?utf-8?B?bStLU1J4c3IycThjREJiZ2lZakJJdkhndzkrMUswL0FIcUdNUXhmbkpuRzBV?=
 =?utf-8?B?aDh0SHo3LzM5dG0xdlVsSVk4QStjcVZ2TDUrZjBxeGdXTzdRUHZSVG42Rk1Z?=
 =?utf-8?B?U2VUSDZpMVF6aVlyK2ZGNUtMcW1kL1JCZlNjQ1JlMXZsSjRCN3NZU2t6Vmo3?=
 =?utf-8?B?WUhUais2cEdRcXJXamRtVExQYWF0RzA3ZysxdDlXVEMxTE11QmhRcnk0VkRR?=
 =?utf-8?B?bEY3VkRiR2RCcHVEcWFWeVRCTlBjZVFGQ0IxYjh4ejZDU1djd1VZZ250RGYv?=
 =?utf-8?B?Njg5V2oxK2dGNjZ4a2pCVXdURWNvVHMvQ1Fod0t3R0dZcVhNV21kaVJmQWVK?=
 =?utf-8?B?dGRqTlFvOW1QRVltY3Zyek5DR3prZHV2enAvUTliaTBkTlMvU0JsbVR2UTRC?=
 =?utf-8?B?aXdoNXdNVk83SXB6ekpPS2xpbmhhTzRwSDlKdEJLVjRUM3B4eUNZb0ZhT1F1?=
 =?utf-8?B?MEpsUXh6MjlTeWZBUmZIQWd6WG03UTJVSEtBdVE1VytleEZvMUtXZHhCR3Rs?=
 =?utf-8?B?YXMvNUh2c0hHOG05ZFdWeHRENTBtTTM5aGxlYVdTb2c4Q3YwWXkvQkVhelk2?=
 =?utf-8?B?cjJvNTIxT3ZGbm83cjZacTFSUysyL0s2TFhHbkk4MDRDWElBTHBmcmlrbzNo?=
 =?utf-8?B?eE1xU2VhODU0YS9SUGdiRU1XckNlcmpkRS9GMmVCOXhLUWd1ZUtJWUVBUnlN?=
 =?utf-8?B?VEE2Q2x5NTVmeENQZTE1UUJRY2JNODdGb1daK0tvK3lFNzM5ZkY1ZTdBcjFz?=
 =?utf-8?B?SCtOdGNCNjA0S1hEQlFsZlFYS1dCcUFTa2pHS3VLWG1pOG9FaE9pZDFLbm5s?=
 =?utf-8?B?Z3RhRUo1cTNvVERYVkNFL3V2dXpSQkk2NUpMRVJEU3d1TU5mUHBIcTRVeHp4?=
 =?utf-8?Q?NvvekMeur0w=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?clpXSXpNZmlqNGZQSzN4MmxjVmpoalBacHJ0VzNtU1VOVGxLTkM3SG50VzJX?=
 =?utf-8?B?VFZoVUovRzhwazhwMi9ISkVSSzk3RFFJWDBQZjZzRXo3RGlDSWJxcEhXVmp3?=
 =?utf-8?B?enF0NlZwVUw1WWpNakVKd2ZJZE5yS0tOaW9rbzlwUWorWjF1cFlpcjR3dlZi?=
 =?utf-8?B?LzNYTFJVWDZML2ZNR25sZE9HeFR1Um1zVWpob0JwQWdHNk5ab0hRQ1VTaSs3?=
 =?utf-8?B?ck1HVW5JOGVvSmRuZHRCRzZsS3dLOW5Mc003MzdIN3ZvQWVxdHdiQlBkVnYy?=
 =?utf-8?B?Wkk2Qy9BRW5WSVR1MUtHR2d3N3o1dDA0aE40VjJ3UkM3cmMrR0phaTJheWNY?=
 =?utf-8?B?ZHpiS0pmV1p0K1E2cS9xTmdGR1JLUU9xaFVMTEZoajUyb1UvS2xGbmdGbVoy?=
 =?utf-8?B?V0hWQUI3OFdPVzl3SlNSZHJrRUp0bWloTUxWRkRzL014RTdDbERyQ25kVzRK?=
 =?utf-8?B?Q1BrYWF4MHJ3bkE4MnVFckNkWUVTQ2xiYVljUVN5ZDFzWkNKYUVhZWd2bmhG?=
 =?utf-8?B?M2FTS081bHl3ZXlVcjNBV0xSOVNxSlhINXZyL3BYSVkxYWZmN0E4SGVWVXpZ?=
 =?utf-8?B?TG81bG1iN1VjM2JmL0szYVkzSUJnL0h6Ry9TNStSSWFLY254anh2REMzSTd5?=
 =?utf-8?B?SXhPR0hOL1Q2T25IVmZsSHpLZDRNREZ3NDZKSG1DMmJPWmZ6bjZUdXM4akJX?=
 =?utf-8?B?RjdCbVY4OW5PUzVrenJLd3RSRXhkaUFBcXVEK1hjcFllTDg0K2RiMjlDUW1q?=
 =?utf-8?B?MEEwYjRvOVZ0WVJvcUkwaW45RTc5ck9CREVQNVJGS01ZU3pmYzVreFZMQmdG?=
 =?utf-8?B?RVRzNUpZRnNpZ21jbmpydkdVZzFqbklSZmxBZ3B6Vm9WdzNQRWpURUQ2QWJt?=
 =?utf-8?B?a3F4UUFZc2RuUnBVTm9jU1IyVng5MnhaNnE0V2JOS285N1NWWEoxbVlkVzNR?=
 =?utf-8?B?a1RwcWNwUVBsRWptdGdkK1JseTZ4Ymp4OFpzNU1BRXVzSFVDT1RtV3BRanMx?=
 =?utf-8?B?dVdRRVlRUzI5WVFQZk9qMVdvRHBzbGNUQm5NZlN2L0tDSHluSUsvZm44V0c2?=
 =?utf-8?B?clIrS0srdDFlT09CbWd2QTMwQ0J2ZW4xYUl2aWZtNzI1ZUFvRVlEdnFENnds?=
 =?utf-8?B?OTA3Z0xDU1Zyc1ZPWlJ1TnZOUFVrT3pXaFU0R2dNWGtyZDd1TEFIQ1NhTzU5?=
 =?utf-8?B?WllscXRYTmY0emZWSXFlSDJKRElIV3hpc0IxSVNqZEo2QWVwOVUvRXM0ZGJS?=
 =?utf-8?B?R2xyQUFYT1RFTTdJbjNOVk50T01nOFBvN09hTnlJSmVYNTdaZ0RaWXRGNjZG?=
 =?utf-8?B?cVdQL1F6elJiWjRjVFpSczI5Z1VBWGpKNnpBMm9ESFBkSXhxVlJZUXF4WHR2?=
 =?utf-8?B?RGdFU2cwK1Q3SmdpTFZTMnVwdEZMVTFtYjgrQXpGbFhYME9zVkdCVTcybnho?=
 =?utf-8?B?SDBlUDU1TVZHTmo0eWJyTEhwQ2Z3bUpGdWNnMVFBcWtBRU5QYloySFN2REZH?=
 =?utf-8?B?cVZ4aHVhL2NMOTRkK3diT3BSNDZlMnBZbGZXaVF5Zk5YNk1QeFpYU2lseElk?=
 =?utf-8?B?dkNqN2pYc0MyMVNGNmdXaUVGL2pNaWZ2Rm41Z0NlZ1BvRllxTHcyelRST3VF?=
 =?utf-8?B?YXFDNUlSR3ZrMkJ3ZkJnNUo3YWZRRjNEYUhRN2hIVjYzZWxaUTRtK2lHbDJU?=
 =?utf-8?B?YnJpdy9QRDFzdTRqVWVwTlJlbjBUeUgzZHVXc2RIRHR0OWMyWVBKZzM4VnRu?=
 =?utf-8?B?TVJjUDdDYXZwdzZpVlJxZGVOanI2b2l0bzVyMi9tWWxIdk9jUS95blN6ZXhT?=
 =?utf-8?B?QkRZUllra1hpV1UyUk0yaTZxOXNKNFQ4ckVDd0E1aTdJd05IQmpXYmc2K2NE?=
 =?utf-8?B?cW1rTjdxeDRjbTlPNjExUUFLTG9xT0FuK3RCQXlqci9HVnFvZHhDT1JJUGY0?=
 =?utf-8?B?eEpsejJUdk1JSllLOFd4R1ZVSVgyWmNFK1dPVDJldExIZVhncURSa3ZyTmpT?=
 =?utf-8?B?eDdESUhCMlFYcCtCcHlqMldmNm5iNlE1TFhYZXZEV29VL2FqZ1ZQQWsyNFZC?=
 =?utf-8?B?c1UvMlduTkEycklDc0NqUTlnQzFHcHR5L2JNT2ZYRGRqMFlSczhWNndWS0tP?=
 =?utf-8?Q?UTzs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a75721-d6a7-4837-e6f7-08dd4a1af347
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:36:16.9484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2rDkByPajd29SWNIIjZYpkD0Ny3yQAJxwCZ0Es3KV/upPgdY/yO6/SGDNiuP0IKCSTu/xmsQNNkQ28Jvxo/PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8783

On Wed, Dec 18, 2024 at 03:11:01PM +0100, Francesco Dolcini wrote:
> Hello Frank,
>
> On Fri, Oct 18, 2024 at 06:13:07PM -0300, Fabio Estevam wrote:
> > On Fri, Oct 18, 2024 at 4:24 PM Frank Li <Frank.li@nxp.com> wrote:
> > >
> > > There are some dtb check warning
> > >
> > > arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
> > >
> > > Can you help add actual pannel-lvds compatible string to clean up these
> > > warning?
>
> I do not think that allowing just panel-lvds in the compatible is going
> to be fine from the DT maintainer point of view.
>
> Adding a specific compatible will not solve the issue, because we can
> connect different kind of display there. Doing this will get rid of the
> warning however.
>
> We could remove the node completely, but this would create some
> regression we need to figure out how to handle, minimizing the impact.
>
> Unfortunate there is not a perfect solution, IMO the best solution is to
> remove the node, but I need to find some time to look into the evil
> details.

Did you have chance to check this? Now v6.14-rc1, only 65 lines waring
under arm64/freescale. About 50 lines belong to this warning.

Frank

>
> Francesco
>
>
