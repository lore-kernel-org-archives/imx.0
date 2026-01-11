Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B72233C511
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135284; cv=fail; b=lLhyEYKyqU04zN8seJ4AaWn7RgcABDMhdBwcQ8jyJ4v1YwSwWw9NORuib4MOF8C7+sid3KUFtVkpTRwluH9H37N0+iO83lTVeb4i8AgbQp7F3pCp0u/zDhqgae9wmOMO8o3IoSix1VgMMVVk2yAYNbam2PqTNMtiZ9c7OgUSdOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135284; c=relaxed/simple;
	bh=gn13LVWyA40QVGfQZso2b5CF0rZKWa2xlRg6vO1JXDU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VRcgcYxMzf1f8ylJciHljYse5+8I0Hk0c8X6osm5VUXrg8P5tCBKIamIGSpc/PKaZkICQfKoNGoa7KPN+6PwIxahOWw4pC+3CgWLRFX9B5VujSu+3WoZ4/uLOogDjfsTwlmhK7Re9GjGnKt5v5yqCqyR0nfTv8mB5PwVrA0fdgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BwHWtNKr; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BwHWtNKr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7be73QCFkkge5VJg34plaBQxojFg1evonDNy6gqOObG++5coy+pE3AkRU22vudPFPyHvcBdEwBIXgV4w4uu6NP++yGcE6Or4fZxgx7SnhpuhLozBc00BthxXmZl9JxpXKS2rlLtMp3N5KfuKOt9tglHOCuaa4blcWTRD65zku3eIAX6ZDu2GaIu8vSYCLdZyYZ155m99l4jZ01lA7WM6Run8GUcCa63aFxoFNpEg1ZIJYXExgiavhv8IcvHTHu9v7V4yz/vXTWgNSQB2tQTItEE44tlEKyCkDO9fp2CcTywt4ktgxjkVVECHd4iZdZP5Q0aeFkXsrEXdvUYSny2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHpMvbgJulS9eaVDGNSJT6wDpObUARqYuEOIlifsjoM=;
 b=omWbKXSQWEI2FjUZwNhjPMF4DXK66PzQycjJtgPJmpt6Ym6QS+perNaAOGldVn2fkB9hGhUH/hWgeokvFC+Yn26vBRQNggXDIlJr3SaFAoEDV8o7E/j5VL67Mb0DhQCWFvkDTk/nhfNFoun3BiSN61rKvqTJB7uTxHFPVSlQ537DY1sWH/cTC0o6zpHr4CmmK794Xw3IWPBbck9BhVEEUMdagevVUjwkZ+08C37WIXyhoSFYUWXYzWy74C3lDiqbXMpjQOYEpEeyGqMVJevxOUaFsFCEVovKVbOyJVf5YxDvCLQYKzIvqZRhNwA3dgVENMNaeLaMMUygqS/jDNXVMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHpMvbgJulS9eaVDGNSJT6wDpObUARqYuEOIlifsjoM=;
 b=BwHWtNKr58CGmxYLgTudSH2Km0s+NgIRsDQsQZ1hporLhlE0Zjd1wpMfB7LSXgln/dT8f+yT+PI0kdK1FWazGjYPAuMpeqijfPx3W0lqL4tnlyPRUqoIGstQ+9YsaHM/xTaeViESTmaSDHHdHNI6cJ2bdv36gQux20f/MpsEB+cBxTzRhxZrW9KfpHWTxqcNrVdk6f9/Ov/TmY6qv96SA922bMNiTG1Mu4Xbwhyw+1CZoiA5nP95tEo7dj7dzyj4ooGguqLfpiWmQ9ZEZ/IVBEPdXi1dFF1JzlmRJfz1m/8XT+YM7W3+5IoKJ7uX36t4NM+SjrSMZAd0IH19giPVkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:41:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:41:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Jan 2026 20:40:14 +0800
Subject: [PATCH v2 08/10] arm64: dts: imx952-evk: Enable TPM[3,6]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-imx952-dts-v2-v2-8-5773fa57e89e@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 54c7ab20-9def-4a74-27aa-08de510eb2bb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3plb1hLZlpGYmd0ekZKclZqWXJHd1piUHhRSmRHSG1COHRDYUxaQVd1Mmpo?=
 =?utf-8?B?TVZDdFVmSU5MSWRLWkJ3Ni9XR0RFTGNzUG8xMHRzeWxvRTZkU0FpemZrejI2?=
 =?utf-8?B?SWxOeGZuZkRlZXFxaFplQUliQzBzMkdtRXRqcDBPSkthTTFiaDBPKytWV1Fw?=
 =?utf-8?B?N2E4ZDZ6Z2FTOThFS3FIdkNEY01JTUhhdm01aTFWUERTa3c5WmpRbi9Caks2?=
 =?utf-8?B?T3dCcnhXeUV6WVNyZlhXU01FTmxzcWlrLzNRMllCVkdBbkxxUkdaZlphc2dy?=
 =?utf-8?B?TkdYVk1Yd2MwUU9CKzhNL3JlRWV0NUN4engwMlNSWm1MWFJEdEpGMHFyckZ5?=
 =?utf-8?B?WWhGcVdVUUNFeDZISDlnNk1Pc1RBSy96TG9uVDlDVnNFbmZqRG1NQW80NHdo?=
 =?utf-8?B?clliTFRxVGJXSENOMjM5cnFSSzV0NnFJSmg0ajI0REZoNTdjSXZaZWFZbE5R?=
 =?utf-8?B?cEVLbUdiSXVJR1pMTkdHY3JVeWZSQ090L0ZIeEpwNkJLaU84Vy9Hd2NRUjNJ?=
 =?utf-8?B?WHBPRnZXTXlSa1BtV3JBeW5sSEc3eWZyNHZYa1BjcEFGbDUzRHJZdlpnbm1h?=
 =?utf-8?B?ZlN5ZHZTNjd6WUlpWGRzb0NFaDlCVHNLMFhxa0lXdFNVV1Y3dzFXUmxiLzd4?=
 =?utf-8?B?aDhla1NVQzQrNHpMWE9qYWpYZnhrSUt3emkyVlA5VFI2V3J1WDVvMWMvQk5G?=
 =?utf-8?B?L25ZZDJ0R1BLRUo3MmE0WC9TaW1sQUc0TGZ0UmdrcDQra3ZXdi84b3NHOXpx?=
 =?utf-8?B?dDYvNHFBM2NMU24wRE1qY2VLb3F4YmVnNzhrRC9XWHpRQkFlSFZuak0yWkRN?=
 =?utf-8?B?cDdESVQ4dTFBRkJnek1PSld6SXE3dUkyQkZBOVVSV0dMejM2Z3FvZ2Z3ZTlJ?=
 =?utf-8?B?aC91TnBFamNBVVhsbWJ2YnNUSzdZZlpaMG9hdmkrdVdqYTdUZHd4RGJLSUh1?=
 =?utf-8?B?WVFoSUFrYXJnWXFjV0RxZlJlSXhBalZha29MQlVtQVlWdHN3L1orV2o1T0FS?=
 =?utf-8?B?amV5QVhCNFB4eXpXNXdVMXQrVUxnZGRjTEN4aWhBS0VnKzNDNXN2S01ZbTc4?=
 =?utf-8?B?YUVvR2VZRnVQVnRxaWtycUFWQW9SVGZubloyQnB0NWx1RkRvc2NWT1hRREkr?=
 =?utf-8?B?VE9pM3BaVVNNbzdvU2pCV0dKQ0JWOHJQdDAxYUZJbHZmMGtMOFNocC9KNWpa?=
 =?utf-8?B?U3Q4NjV3ZnFPT3MvVU00TUFvSVNwUjJhRGpJVDJJVUJxck1TZG5zbzRRYzRD?=
 =?utf-8?B?bzlKTVdsalRMemRkUUJsNEhnbkVNbjFNUEcrV1A3YmR5VTEyQ1pjTVU3WHc3?=
 =?utf-8?B?bG5TdjlncEtvdEpJYmJhUEdROW5NVkNMSndGcXRON3ZtbFJOSmx5U2w4eWJo?=
 =?utf-8?B?VFh0RDR0Tm5PZEdjQXE5R3B1SDFrUlZkbjNYc3lmSldnclpoWUM1QTNWWjhs?=
 =?utf-8?B?NzhRNDRrWTZkdzUxVkRlZnNucDdqYUkyU0xURHc0ZFNEYWt2WWlDMmdoVU13?=
 =?utf-8?B?dGpQczFuazhyL1FkUWVORWpRRDlzMFBkcmNOenNocVR6OW1KNGNYbCttS1RP?=
 =?utf-8?B?SVE3dDAwZ2dvSDBzeWQ1cGJUQTE3ZWUrTVluYjl1aEtibUEraEVlY2RGVWFN?=
 =?utf-8?B?UHlQekhIS3lTa2hJS1B5bFViZUhhUzN2NXpkMW9zVzluVFhsd2svdlZKTzNH?=
 =?utf-8?B?dmJhaDUwQ3BHU2gvUEhUcEFVUDVVSW1kMVBXT205bzQzbVRNNnVGUGdxS09Y?=
 =?utf-8?B?RHQzd21PWVRQbWpMM2FpZENETnhLbjY2YWpac2ZCUFNoeStnVEdtV2pZaXUz?=
 =?utf-8?B?Z0xRRnJrTmZjZWlZL3RhbjZ4dG9HdTd3cEJDQ3pwbGJLanYrUWt3UDYzcmJv?=
 =?utf-8?B?cEhuTTlaUHBiTmV3RUR5OWh1bUlyZFc2N25KbWdIV2N6ZWdiY3FRV2w4WXpC?=
 =?utf-8?B?eU9YZjVpeTNod0h4Y2p1bDFFbUJsL3pieWt4bjBQYlBmeWo5dFBKRXlJQUty?=
 =?utf-8?B?T2VyaWpkVUNVZlBTYjlqZVJVd2MwMlpvRGpXSmdWSEdWdlA3RCtGUFprd0pY?=
 =?utf-8?Q?BCuiN8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?andJZWZFemlGTkxrZUM2ZEtMQlp4ZzNwMjByL0U3UnpaZllLakZjRCs5blho?=
 =?utf-8?B?YjZlSldKNjlTbnd4b2E4NmQ4SEZBeTA1ZzZ5L0pyYjJCVTNPTEU5OTJNTXR5?=
 =?utf-8?B?T2ljSXQzK3I5NUtHVjNJa25MMzVsZWZFbHJoNEViOGVaZ3FmOEM1d004dHhT?=
 =?utf-8?B?OXZtdGJlajNibXlTbURYSzJuc3dINmIrdlliOUdoMUZvODU5MmM1WmV6ZXY2?=
 =?utf-8?B?c3k5aUtjMDVReExJMEdySjJlamp2RzEybWlJREhzTVJEMlhIcnJQRzNSS3lL?=
 =?utf-8?B?RmxRTTBnS1hQeUxZVmlGSFNkSjNjNmdGaUFDNWJCTEZoYXpQQXVZdnJPYjVt?=
 =?utf-8?B?ZEZHaXpleXdTdmc4ZHdnZ2dUcGtKeGl3ZWx2S3NiMTZLQVB1NmZBQ2ZwT0t2?=
 =?utf-8?B?Zk9HZU5SY2ptM0pDQUp5VjlzMHkraGxubk13UTVSWmQ2bVNBTlhTWGZaZEtB?=
 =?utf-8?B?SUVYOHk3TGw2MUZWeFpZbkYxWmphbnRXQ0NNUkszUnJ6eVZQblVSd3lReXQ5?=
 =?utf-8?B?dUZWRnJXRHVVTEE4d2p6c2hjNXBXZ0FmVkEvaFJ0Z3cvdUZvejljY2xTUDdU?=
 =?utf-8?B?V2hqcWxYOFFRSzY5Q20xVjc2ZkhCUzBLZVY2N29zMVZsZ0g5amh4bThrVFc4?=
 =?utf-8?B?MUU2bG40UGVEaDk4K083L21TWE1lbDBaWVVnektZV1pDRGVKNFVzZlJzc2Jy?=
 =?utf-8?B?RmxhZXVUVXYxOUp4UHpxRUNxSDVKaDVEeG1mS2FhRjNYTWw5d2FvRDJVVFlH?=
 =?utf-8?B?TGZjWG1QRjZRKzRYKzZJOXFES1hPWklvQi9BM3owTlBGU25BZTV6UEJhRTVQ?=
 =?utf-8?B?VXBHVmpPb0Q1NEViNjJrUFZleVpHdCttanJwS2ora3E5eEhKTUsweGVGcVM4?=
 =?utf-8?B?RXExbHpyVjBNMHVST0tNTkVmRnJ1RHpqQ2tLWHV1THBHNitTWG5QSWJscjVU?=
 =?utf-8?B?TEVOS3VNSlQydGRZaFBaVEVGZ0dPTTdaMHVEdXhCYUljNERhckR2ODFHb3lJ?=
 =?utf-8?B?QUhHTGd0NnFnTk54ODFaWHplbzdxczNMNlRjTnNaVVJqdE5XRzBpYnQ1YlZO?=
 =?utf-8?B?Tnp5T0FWcGM4cStsZ1pzNHF3STYvSmdycXBnRC9qeW8wSkZDOFk1K1pHVG1h?=
 =?utf-8?B?S2tOYXpzTDZoV3NHTld1QlRkRmlNZHRxY3dQZmlQTldpUEl3YnQ3Z1JWK1dQ?=
 =?utf-8?B?cHJpZEZ3RytwOUtGRlIxRFFwbFg3QU9zRHpKdmsrK0ZaU1EzdVNzb1NoMlJp?=
 =?utf-8?B?S1ZSNzcwTjM0L0IxOTVWN0dXUEJqOHY5NldSRkZsMGpQQmF6Y2xmdTUxcU1m?=
 =?utf-8?B?OGt2RFZ4c3NHdHhqeStjZkhCdEtXRnpVZm1WUUszRThjMWt6MGdwMlBFcmhx?=
 =?utf-8?B?c2p1T2kyYWxQS2pCUEdYUGVSN01rc3F1SHBSTTZEY0t2UkJ6aTJhcThKUVhH?=
 =?utf-8?B?cGE4Y1IzdUpwREYrTS9RYjYveWxuOHJkTU9rQ0NhNFBSbkVsenV3RDdtcGU0?=
 =?utf-8?B?eUx6ZldMRU1DZHVycm5HTmlEYjF5NHRCVXVWa3ArZXp4UWl3ZkxIc1l5MHNX?=
 =?utf-8?B?NlkvMUIvYmNBZUxkVVdhTGJqUDEvVDZrd1ROcGhab1hjZ0NhZTRHVjYvV0or?=
 =?utf-8?B?NWN6ZURRNXcxRVVGVzBQSWp2aHdibUkraDFYZXNiN2l2K05VVVJKaGM2QXpU?=
 =?utf-8?B?b1RDT0JsVmE0WUhzTzhLNWF3NklERjZyZWwvclFNVmEyRVlZbnlTOFUwOGJ3?=
 =?utf-8?B?YmJ2ZUc3akYrSmQ2bDFEODcxVURLTVVycnlZK1Zaa09XT0x6VHFKdDY0Z1Uw?=
 =?utf-8?B?Vy9teWRwbmh2Y2NTQTJUY24rSy9zNHpkZUw2WC91T3MxLzViWlkyV005YUEw?=
 =?utf-8?B?ODROL1ZBOTlmWnJaYmI1NVhWS2RhbEV4akJPMnlLQmdFd2FacDRUUnJmbC9t?=
 =?utf-8?B?NUE2RXBEZ25oTGUvNjJ3aWM2bkF1QjNNSlNZeHF0U20zQmU5ZkNPTVVVRlpT?=
 =?utf-8?B?QjVSaGZvQWFjci9KSHFOSXgrY1A4SlFSMENsM1lIVnNDVUhPTExockhEOEV6?=
 =?utf-8?B?SkxpcTkzN2dBTkQvUXYyUkFEdmpoeUxXRVQyTXBjendNOExBVXFrcWpnL2h6?=
 =?utf-8?B?THQ3RFJUS2hSYTNmalhrbjQ5R0oyczYwSm1PdEdMM2Q4SUNhVXR1SzJNT3Fq?=
 =?utf-8?B?cUlmZU1Ta3pybEpwUENZaFlLbEh0aXJXbHU2L1hCOVRSZGllaXJHV21ETjFX?=
 =?utf-8?B?SmlxVFBNQlFtSEo0SzFPc09qZmsveVc0ZFMybCtIN1Y3UURsaGFlZ3ZIRUs2?=
 =?utf-8?B?K2crV3dZVzliMVpvOGJVVnBzb2FaY2RieWlTSThtRkcxL0I5eEduUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c7ab20-9def-4a74-27aa-08de510eb2bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:41:10.4209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzeYhNQ3d7gbgGpL4WlTHwhbss5AOatMwZQAMAkicmd/KV7BM6dRgGI1xP5khqczY+IHPz0ZDonAV+f24r5U9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

From: Peng Fan <peng.fan@nxp.com>

Enable TPM[3,6] for PWM.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 34 +++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 24a3468b1817a673765a9a9cc378d5830d5afd97..21b951a2156414819dfb589e5e7e736e7b1fe48a 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2025 NXP
+ * Copyright 2025-2026 NXP
  */
 
 /dts-v1/;
 
+#include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx952.dtsi"
 
@@ -42,6 +43,13 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0 0x80000000>;
 	};
 
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		pwms = <&tpm6 2 4000000 PWM_POLARITY_INVERTED>;
+		cooling-levels = <64 128 192 255>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -264,6 +272,18 @@ &lpspi7 {
 	status = "okay";
 };
 
+&tpm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm3>;
+	status = "okay";
+};
+
+&tpm6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm6>;
+	status = "okay";
+};
+
 &usb1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -394,6 +414,18 @@ IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x31e
 		>;
 	};
 
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO12__WAKEUPMIX_TOP_TPM3_CH2		0x51e
+		>;
+	};
+
+	pinctrl_tpm6: tpm6grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO19__WAKEUPMIX_TOP_TPM6_CH2		0x51e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			IMX952_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e

-- 
2.37.1

