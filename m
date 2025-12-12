Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169712989B5
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765531005; cv=fail; b=I749zLefkWgwmXTphqsDmujabtol/pcXA1EU017A6NsCiOnQZsx4hEGW/QHCIOPTBeM/6PPUxy926kzUgjVvmTf7Niy/a/hiwu1Lf9Q1YQo3/jCEp7ktvjzESeP0nnGjBYNVtvk0Z8eI0BkFOK12z9aH6uLN9l2+B5Hc76tScHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765531005; c=relaxed/simple;
	bh=ti+dsS84OZETPRl2v9h1SyXbSParVH/w9UlYaO1tujY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DCQrSpkphiUpHODkCmTv+IQxQUZYsrHFyaNG8eREyntJIG9NJbc9C0z0c3QTBgswrbxlqSXew2AfDaNBL54nx3EeYsO816HzJIhzCkzt53D7feEVBtRfFiFTrn9NnPdWzHw90HPya4kCybZRB3e33BeflIdC2gyt3+jEOClCBf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xVPrjr87; arc=fail smtp.client-ip=40.107.162.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xVPrjr87"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm1j0ImVw5jT/7kF7b6l8ZXY/ORigKcts8DGuysJSaR/FIUKZLChX7WZ9Zane04Iltrt9xbXDI2JTadhGgGpkGDDqRrpLtP36ng7tIe79HtCGPv6zXiIryvK8obgUuYuRbzyGL2U1RB2/g2Yhm2gcq473QfMKUlt/dEoBfjnnkHMfHgddCx+d5eAxSpib+Hpt9txTnjtKoVWI45wBRbF7B34mY5qsyLWDZuVChuSa7lEBj5VS1AFtcLf4TkA8KbGtfgKI8yOKVGnjAXJf+mNscFc+oR9zPqjQ0N6Sr9T2hvsa8NsFwYZtf9/Urwl1rjySmc6x2sFDvp2zFBvnK53Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pm2xOyYj9vTVPX2DRDJQHiICzLKBxpcDBpxJZDC5M3M=;
 b=Emo3WEZ/IqlBMMIyk/K3yrSm4KI222wVC1UNyzqmHrdT9zoHcUzPY1dt+aS4a3+g1iUFq9egYVe8NLHHCROT/1T9RZVslzS3/L8kxLDdN7dUlOBl+K1RDUhNbPJKOmN6eyDIhDyRO3RqjUqBA6uRwp/ikmMK5LxzxdgYAjf2u+Tc52W132eSSoU+5VrQriwxOZdyNoUqgGa12H7w+Ft827wV846rTWY2cthprrqQdktgNW3CRCm98HVo6qJ9Djik+PYMXG7zLSfHxH/Jt7tA7qFbCJ8pWfPepHnMZ51DCc9DXzJarY1lKZU/ZMXLQgG0Kurh4ohk5Z7xjlSKcGPJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm2xOyYj9vTVPX2DRDJQHiICzLKBxpcDBpxJZDC5M3M=;
 b=xVPrjr87YHrUrgKNa7UIYdfquaU86xfO3+y6GdXlLYQTSmnpHIkTKNyiNYCP++TY6k7RJ3RMql8Exw8mqpDoQZZMarNY3BQSfbDC5/Z689q6c6doPjdnVevgGnJJaYS1DDDQjb4sH2lwsakSE4annlmJDBkwgDUQ6KpPDlZcHH4JaqzlsIZovrzYlaVdENytT63tBa3vUKAASZYzv47tKexo1NgdoaeIePFXtJbmTqyMwNpyu4ygXOGL1q20raVoBbJULwtI3MkDIsNO0s3f0idJ4a3RZCdvyUVisTy6nf82dsX88yBbCkt/6O6eQcRKzl8h7+1OogKypiJ3oejQGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:16:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9388.003; Fri, 12 Dec 2025
 09:16:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Dec 2025 17:16:09 +0800
Subject: [PATCH 3/4] arm64: dts: imx91: Update file name with dash
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx91-dts-v1-3-2bb3c13762dd@nxp.com>
References: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
In-Reply-To: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0113.apcprd02.prod.outlook.com
 (2603:1096:4:92::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8f1337-20f8-4251-0b04-08de395f274c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1NSOU56VmVDaUpUWUFMMjV0OEFjUHMya1RKRStzY3BFVDRFUnJXSUpYUTBN?=
 =?utf-8?B?SzRMOGRiKy9nQzUvdFpFYnQwNFpiYytBeHVEQVFmNGVaOUtDc2lZUkZSQlhx?=
 =?utf-8?B?OXVmRDI2ZWFKUUxnZnZiUWowWnExUFo3RnM5c3FhNnVpRURZN05hYnRldHp2?=
 =?utf-8?B?UkZ0R1A4Q1BwdmJiNVMxL0YzbHFwNThxN1FIRktwQ2h0VVU4Rllrblk0ZHB3?=
 =?utf-8?B?K0FXOHB4dWlZV0h5MklPRVg1TDQ4Q0hPNkF0Sm56cEF4Sk9QRHh1QjZ1dm5w?=
 =?utf-8?B?YVVIdjZXbjZ1eGZpdy9zaW5NUnZkaTdwTjJ3Q0NLTmkxMndPU0JEZ1RHTWJi?=
 =?utf-8?B?Q2FhZTNzeXpOdzlySWVvc2JiZVFtN1JXTVgxVGF4ek11dldkWW5GdDBjR1hU?=
 =?utf-8?B?THVvL0hxcE4vcVRFRkx4VTEzSFRHZU9oWjZ6dm1FYUR6ZFlIb1RxVVRpcjhY?=
 =?utf-8?B?ZEVweU9CUm1Qc1BtNmZqRXNsNnFNT0ZDRWYvZ0kxcFZIV0pPSXZ4ZG50Q1JK?=
 =?utf-8?B?SjJnaWIrK0U0UUd6SXZ1L0ZFRUFxZ3NnQnRWRm5TNjRKZlNxWDJWK1lGWUZO?=
 =?utf-8?B?YTk1M0ZrbnBzZGoxd3E5cEV6RVZvNzlDd2oydmxVNDZVckFybUVISTRDaDAr?=
 =?utf-8?B?MjBqZUZOK2o1dkx5UnhKa0loQTVKY1RkdzM3TE9kb2JyT2xvUGF3QjFySlNN?=
 =?utf-8?B?K21EVzNNcXRsVm10MGlUQ0lZb0VnSUcyT0d4a3U0bGJRTVlDSHR6bEE3eXBr?=
 =?utf-8?B?b2F2NnIzU2xKbkFQczMweWdxTXVkOWdhVy8xYUIwWkJORytoaGRXRjQwaEEx?=
 =?utf-8?B?bnM1dW96VlVRVnJoSHNRMzhQY0FGR2FZdzFGeHFIcWROckw4VnNCU0FsSGIr?=
 =?utf-8?B?T3JYcEM3b2pBWlQwVEtTVzhrK1JwM2JRZkdRSVFpbXZPZTZBcFB0RSt0aHBM?=
 =?utf-8?B?bTY2YUNWQ0w2RTY0QmhISWI1NEtHaklrS3ViSitWUnFQKzZ4ZEQwTUFDR1lV?=
 =?utf-8?B?NXNjRGJmdDRqL1dBcDVmelJFYmxpTlFLR0xhQzh1R0RMTzQvYTgyS2k1NzQ3?=
 =?utf-8?B?Zlhwb0o2bU1CN3NlQ3pFMkp1MHMxRXRyaG5RWjBkNDcwUWViZ0F5SE9VN1k0?=
 =?utf-8?B?dkh3TXpRVjFOV01oeGZEejVORVJmTC9idjRvRndvaUhpSk5PdVBqaUd1NHFv?=
 =?utf-8?B?UzExNStoZmxJQk1SSHQ4MWcrd1RHa0JaNng4Q3lqMndhbUFuSXBTRThpUU0v?=
 =?utf-8?B?c1U5OXVUNVhzNkcrRkpPSnd0T0hjL0ppaFJ4bDFQTnZXRGVyS3c0d05ldnRD?=
 =?utf-8?B?eXBLQ25iekVmOG9PbXZ0RFozNlI0bGY5SzR2U04vZEtkZ0VGT3BhNksvRU9P?=
 =?utf-8?B?REtPUDRtbFFxOWR6R3U5YlVJbzdYdjZVelpzWjNMYVFmNEs2OGhsaytKclVL?=
 =?utf-8?B?YlFtVGlxZUZrVDZxR1R6amc2M0ovSnppNGpPb3Y3OFFqSm1DQkRMZjV6dTc0?=
 =?utf-8?B?Wm43UFpoRklWa0ZKb2lEMWJYV0JBN29PVW5tdEs3Y3ZIZDB1SVRuNnFrMTVJ?=
 =?utf-8?B?NkVkU1NTWmVqZTdBaHpEdWtNei8xY0hGR1lVamkwblFHWXVnYmkzZUt5SmJw?=
 =?utf-8?B?MFBHTThLZ3RObWdndU5lTHFUZzFsQzBnYWNWalYzZE5sc0RiMUxGWGtjWTI1?=
 =?utf-8?B?NTFlTTRyQ3RLSXpZRXhYTHUwbU1tNTJUQ2lzOVgxQWxVbHVuSDZlQmZtUjUz?=
 =?utf-8?B?T0pRc2hGVWJrb1JvWmRWMUoxMjRYekdNM3p4ZHdHd1pkbmZEN3VYTG1KUG5C?=
 =?utf-8?B?K1liUlhwR2FRbk1LeUd6Z3JBTGlPazJxVkZOSXowVU5yQWd6MU1IU01KNG5k?=
 =?utf-8?B?anZvNnNHN0pmWWh2YndGUTIvZDRhV0daV3lZR3VGQnVjbllmVk8wL3VIalQr?=
 =?utf-8?B?MVhRQUplenlvQ2FMb0N6Um9lMGlkaTBMNmRRaHpxUDAvcFBJeVVqN0crV0R2?=
 =?utf-8?B?dk9DUjRJN2lobnZNVFh5M3k0WkpCQnJTSlRCYlc3VVltMFNHL2Q3S1VxZkFp?=
 =?utf-8?Q?FP0Mtb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHc0eC80YXJtVnFmN1NRZ1VQSDRIWXdjbHZMdnhDSHFuZTM5Tmw3M1ByY05B?=
 =?utf-8?B?SHc5SHIrV3NkVG9sdldQejhvR1NqZHc2SGpjVnNCUDlqVUl5OFFaQmZnUkJo?=
 =?utf-8?B?YTlNd3ZZTHNiOVVleDQ2MkpUNlR6bDR1UkFFZTl3Tkg5UDUrM2RGeWZTdFNk?=
 =?utf-8?B?V1VOQ0xxVjFIbElOYm5ONEJtdTFBNVF6d21zZE51cC91NkpsdHdGMUJheXhh?=
 =?utf-8?B?amZkd3dzdVpxOFZWZ0xKaC9jdk5SRTd2Ykh6Q2w0T0xTaDd2RFhrR3FPU2NT?=
 =?utf-8?B?SHBDU1EvdmlJYjgrU3NGaXFSdllpeEc4S1RBVUp2NUFLUE00MXdSdHM1SmJp?=
 =?utf-8?B?UmxySFphQndhVlNDUElQOUYzaDBSNEE1YnJ1OEpKRklOSVJPTHdjdnlBbUNa?=
 =?utf-8?B?RTVLdm9xNXJVMWlwYVkvdHR2VnFSaFJ6TzJEeVhrZ0MvQkllVjFvOERVV01D?=
 =?utf-8?B?RnJnWndzcXNTUkRRVkFQNXVYcWpDTTV2QVQ2N0xSMWFtRGRZenphUGlPVEo4?=
 =?utf-8?B?L20yaU9VVzd5bHNPL2Q5a3hvWFJKZVplYmg4c0d5dXhRNHA4QzlnSDFXK09j?=
 =?utf-8?B?cDBrUGJGQXkvVm9IbVZVRTFWR3BsT2o2dGloeUVtSnA5T29hYzFVWU5yenpV?=
 =?utf-8?B?N0hWNkt5WTduK3huWE1YMFc3ZnhEZkRHaFBHT0dwL0oweTFzUXlQKzduVytW?=
 =?utf-8?B?aUUrbnh5QkpzM001bjlLQ0M1MERTbTI0UkNRcHhTMUVhU0kvTzJlKzdhMWFw?=
 =?utf-8?B?Nks2Qk1mNWUvRmdoOU5YRzNrWEJjaE45bFd5eVJjbGV1dWhPM3Q2YUFvL2Js?=
 =?utf-8?B?MmtTMkorTnF2VnZQWUJRVFlranJTY1RsaHluVVlybUF2ZjlpV0xINkVQNDVz?=
 =?utf-8?B?Z1JzMjNpV2FwMjJuTFZubkFNaFl3Rkd0STdpQnVuZDRCbTQ1MW9sYWpDdHZw?=
 =?utf-8?B?dHhLNVpJVFNuTnc4WEVyU0oyTmtLQUk5S0ZMQklNSlQ1YTVBM0tjT1pTNVlj?=
 =?utf-8?B?M2VKS29OcnNQaDFxbDFxRDVqY1Z3Ni81dG9kV2NWak8vKzhFL0FQRTgycGVV?=
 =?utf-8?B?WjF2cTk3QVBPYzlvditJMlF3Y0Q5VTk3WFdFMm9wd0xUa1laWlhmcU1CNVhE?=
 =?utf-8?B?VzgxcWZ0a1IwZTJQSGw1RGJtNnR5dzZNSjNPcUQ3eDg3S3BOeGppUktmWGND?=
 =?utf-8?B?eVpvVWNoRDFXb0prN2JDYnpwSytETVVsQmlPSGttcnVGamV5Z1hycGxpNW1H?=
 =?utf-8?B?d094ZVg5akp0SGlVZ2lMUS9iSEU3RWpIVHRCM0R2TVZDQXFsM2pNSHdjbkI3?=
 =?utf-8?B?dGducTlmRnV5cDZZNlhTbzhCTHF3bEpLd2dRRHFUQ3hvN1IrSUI2ejJPWkYy?=
 =?utf-8?B?eFhYd1FPRnZtWitEUXVZMkpneFVYcGNyM0o0RlFpV2tvZVpteGcxUlY0bUtp?=
 =?utf-8?B?b2RYR25QNWFYN3lXdU9HMEFvYnVBdUFLaFVMMXhaN2VDbUNFQTdDYkRjVkRh?=
 =?utf-8?B?UWZ1RkN6bmFXWGZCblQ0UCtVcmhudW5jNnVuOGtNMmFpU1NmeUdWeGtESHBJ?=
 =?utf-8?B?TW91K044amRSTEJ5dmRzR3hVU3NKSjFZRGFDK2Z1M2w2cVhTYjExWDRTYkJz?=
 =?utf-8?B?Q2xWOGxKQ1Q4NjdIQjNkTk0zZTJGOG9PdFlXcUx0K2tjdjBiSmw0dnBEVWMz?=
 =?utf-8?B?amNIWG9kaE5TdTU2QmczbnlRUTlnMEFuUTFYbFN6K3dXVE9SbDBKVWRxRWJR?=
 =?utf-8?B?SmpjZGJ3OGQyZTFRMjFTNE9tcEZla0c1Z0NFZ2VaUEx1QlZHcTR0V0d4OWxt?=
 =?utf-8?B?ZStnZ3NvRVR4bFFLSHgvczVtQnN5c1FwZXRMZ1YxQjBCSjlGaHVRZzBBODJS?=
 =?utf-8?B?WE5GeHNzNVlESmlOVjExQnA4aThYb2VYYWJQQlExQUJPbXphNXNsZEZjODNZ?=
 =?utf-8?B?YmFlVVFHa0FmNjZXaXA5NnZxcmY4cGd1ODJsa1FjNXRvWkJkTG1RRVRyZFJu?=
 =?utf-8?B?bVZEbnFoeG85K3JKdXRHR1pGajRGMWZMQ2VMMW91N1FyM0pla1FXNnNhRDBU?=
 =?utf-8?B?bWlXaDAzN2wyTGIwQitoVVcrTmtQa2dXSDlpb1U4anQ0VDl3ZjlqMDNBNUFC?=
 =?utf-8?Q?0A7K8iDdgX6ABVGnE5jtWzwI/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8f1337-20f8-4251-0b04-08de395f274c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:16:38.0602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7t5GybIkDFRwYdxntTMV8Bc5PgxaL/zOXMS15vPJ55k7OVpg1/HIA2NjevjSSFi228Z9GClbQV94W/8DQ46SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261

From: Peng Fan <peng.fan@nxp.com>

Update "imx91_93_common.dtsi" to "imx91-93-common.dtsi" to align with
others.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91.dtsi           |    2 +-
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 1187 --------------------
 arch/arm64/boot/dts/freescale/imx93.dtsi           |    2 +-
 3 files changed, 2 insertions(+), 1189 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
index d8b5e188949f59b7452df54407d2126a5e1a54e7..89d0b394fcba83fe16f3ebf9c5f1ede50c5675ef 100644
--- a/arch/arm64/boot/dts/freescale/imx91.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
@@ -4,7 +4,7 @@
  */
 
 #include "imx91-pinfunc.h"
-#include "imx91_93_common.dtsi"
+#include "imx91-93-common.dtsi"
 
 /{
 	thermal_zones: thermal-zones {
diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
deleted file mode 100644
index 7958cef353766a430df5e626ff2403dc05a974b1..0000000000000000000000000000000000000000
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ /dev/null
@@ -1,1187 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Copyright 2022,2025 NXP
- */
-
-#include <dt-bindings/clock/imx93-clock.h>
-#include <dt-bindings/dma/fsl-edma.h>
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/power/fsl,imx93-power.h>
-#include <dt-bindings/thermal/thermal.h>
-
-#include "imx93-pinfunc.h"
-
-/ {
-	interrupt-parent = <&gic>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	cpus: cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		idle-states {
-			entry-method = "psci";
-
-			cpu_pd_wait: cpu-pd-wait {
-				compatible = "arm,idle-state";
-				arm,psci-suspend-param = <0x0010033>;
-				local-timer-stop;
-				entry-latency-us = <10000>;
-				exit-latency-us = <7000>;
-				min-residency-us = <27000>;
-				wakeup-latency-us = <15000>;
-			};
-		};
-
-		A55_0: cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a55";
-			reg = <0x0>;
-			enable-method = "psci";
-			#cooling-cells = <2>;
-			cpu-idle-states = <&cpu_pd_wait>;
-		};
-	};
-
-	osc_32k: clock-osc-32k {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
-		clock-output-names = "osc_32k";
-	};
-
-	osc_24m: clock-osc-24m {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "osc_24m";
-	};
-
-	clk_ext1: clock-ext1 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <133000000>;
-		clock-output-names = "clk_ext1";
-	};
-
-	pmu {
-		compatible = "arm,cortex-a55-pmu";
-		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
-	};
-
-	psci {
-		compatible = "arm,psci-1.0";
-		method = "smc";
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
-		clock-frequency = <24000000>;
-		arm,no-tick-in-suspend;
-		interrupt-parent = <&gic>;
-	};
-
-	gic: interrupt-controller@48000000 {
-		compatible = "arm,gic-v3";
-		reg = <0 0x48000000 0 0x10000>,
-		      <0 0x48040000 0 0xc0000>;
-		#interrupt-cells = <3>;
-		interrupt-controller;
-		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-parent = <&gic>;
-	};
-
-	mqs1: mqs1 {
-		compatible = "fsl,imx93-mqs";
-		gpr = <&aonmix_ns_gpr>;
-		status = "disabled";
-	};
-
-	mqs2: mqs2 {
-		compatible = "fsl,imx93-mqs";
-		gpr = <&wakeupmix_gpr>;
-		status = "disabled";
-	};
-
-	usbphynop1: usbphynop1 {
-		compatible = "usb-nop-xceiv";
-		#phy-cells = <0>;
-		clocks = <&clk IMX93_CLK_USB_PHY_BURUNIN>;
-		clock-names = "main_clk";
-	};
-
-	usbphynop2: usbphynop2 {
-		compatible = "usb-nop-xceiv";
-		#phy-cells = <0>;
-		clocks = <&clk IMX93_CLK_USB_PHY_BURUNIN>;
-		clock-names = "main_clk";
-	};
-
-	soc@0 {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x0 0x0 0x80000000>,
-			 <0x28000000 0x0 0x28000000 0x10000000>;
-
-		aips1: bus@44000000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x44000000 0x800000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			edma1: dma-controller@44000000 {
-				compatible = "fsl,imx93-edma3";
-				reg = <0x44000000 0x200000>;
-				#dma-cells = <3>;
-				dma-channels = <31>;
-				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,  //  0: Reserved
-					     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,  //  1: CANFD1
-					     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,  //  2: Reserved
-					     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,  //  3: GPIO1 CH0
-					     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,  //  4: GPIO1 CH1
-					     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>, //  5: I3C1 TO Bus
-					     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>, //  6: I3C1 From Bus
-					     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>, //  7: LPI2C1 M TX
-					     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, //  8: LPI2C1 S TX
-					     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>, //  9: LPI2C2 M RX
-					     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>, // 10: LPI2C2 S RX
-					     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>, // 11: LPSPI1 TX
-					     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>, // 12: LPSPI1 RX
-					     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, // 13: LPSPI2 TX
-					     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>, // 14: LPSPI2 RX
-					     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>, // 15: LPTMR1
-					     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>, // 16: LPUART1 TX
-					     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>, // 17: LPUART1 RX
-					     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>, // 18: LPUART2 TX
-					     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>, // 19: LPUART2 RX
-					     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>, // 20: S400
-					     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>, // 21: SAI TX
-					     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>, // 22: SAI RX
-					     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>, // 23: TPM1 CH0/CH2
-					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>, // 24: TPM1 CH1/CH3
-					     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>, // 25: TPM1 Overflow
-					     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>, // 26: TMP2 CH0/CH2
-					     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>, // 27: TMP2 CH1/CH3
-					     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, // 28: TMP2 Overflow
-					     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>, // 29: PDM
-					     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, // 30: ADC1
-					     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;  // err
-				clocks = <&clk IMX93_CLK_EDMA1_GATE>;
-				clock-names = "dma";
-			};
-
-			aonmix_ns_gpr: syscon@44210000 {
-				compatible = "fsl,imx93-aonmix-ns-syscfg", "syscon";
-				reg = <0x44210000 0x1000>;
-			};
-
-			system_counter: timer@44290000 {
-				compatible = "nxp,sysctr-timer";
-				reg = <0x44290000 0x30000>;
-				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&osc_24m>;
-				clock-names = "per";
-				nxp,no-divider;
-			};
-
-			wdog1: watchdog@442d0000 {
-				compatible = "fsl,imx93-wdt";
-				reg = <0x442d0000 0x10000>;
-				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_WDOG1_GATE>;
-				timeout-sec = <40>;
-				status = "disabled";
-			};
-
-			wdog2: watchdog@442e0000 {
-				compatible = "fsl,imx93-wdt";
-				reg = <0x442e0000 0x10000>;
-				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_WDOG2_GATE>;
-				timeout-sec = <40>;
-				status = "disabled";
-			};
-
-			tpm1: pwm@44310000 {
-				compatible = "fsl,imx7ulp-pwm";
-				reg = <0x44310000 0x1000>;
-				clocks = <&clk IMX93_CLK_TPM1_GATE>;
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			tpm2: pwm@44320000 {
-				compatible = "fsl,imx7ulp-pwm";
-				reg = <0x44320000 0x10000>;
-				clocks = <&clk IMX93_CLK_TPM2_GATE>;
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			i3c1: i3c@44330000 {
-				compatible = "silvaco,i3c-master-v1";
-				reg = <0x44330000 0x10000>;
-				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <3>;
-				#size-cells = <0>;
-				clocks = <&clk IMX93_CLK_BUS_AON>,
-					 <&clk IMX93_CLK_I3C1_GATE>,
-					 <&clk IMX93_CLK_I3C1_SLOW>;
-				clock-names = "pclk", "fast_clk", "slow_clk";
-				status = "disabled";
-			};
-
-			lpi2c1: i2c@44340000 {
-				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
-				reg = <0x44340000 0x10000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPI2C1_GATE>,
-					 <&clk IMX93_CLK_BUS_AON>;
-				clock-names = "per", "ipg";
-				dmas = <&edma1 7 0 0>, <&edma1 8 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpi2c2: i2c@44350000 {
-				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
-				reg = <0x44350000 0x10000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPI2C2_GATE>,
-					 <&clk IMX93_CLK_BUS_AON>;
-				clock-names = "per", "ipg";
-				dmas = <&edma1 9 0 0>, <&edma1 10 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpspi1: spi@44360000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,imx93-spi", "fsl,imx7ulp-spi";
-				reg = <0x44360000 0x10000>;
-				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPSPI1_GATE>,
-					 <&clk IMX93_CLK_BUS_AON>;
-				clock-names = "per", "ipg";
-				dmas = <&edma1 11 0 0>, <&edma1 12 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpspi2: spi@44370000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,imx93-spi", "fsl,imx7ulp-spi";
-				reg = <0x44370000 0x10000>;
-				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPSPI2_GATE>,
-					 <&clk IMX93_CLK_BUS_AON>;
-				clock-names = "per", "ipg";
-				dmas = <&edma1 13 0 0>, <&edma1 14 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpuart1: serial@44380000 {
-				compatible = "fsl,imx93-lpuart", "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
-				reg = <0x44380000 0x1000>;
-				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPUART1_GATE>;
-				clock-names = "ipg";
-				dmas = <&edma1 17 0 FSL_EDMA_RX>, <&edma1 16 0 0>;
-				dma-names = "rx", "tx";
-				status = "disabled";
-			};
-
-			lpuart2: serial@44390000 {
-				compatible = "fsl,imx93-lpuart", "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
-				reg = <0x44390000 0x1000>;
-				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPUART2_GATE>;
-				clock-names = "ipg";
-				dmas = <&edma1 19 0 FSL_EDMA_RX>, <&edma1 18 0 0>;
-				dma-names = "rx", "tx";
-				status = "disabled";
-			};
-
-			flexcan1: can@443a0000 {
-				compatible = "fsl,imx93-flexcan";
-				reg = <0x443a0000 0x10000>;
-				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_BUS_AON>,
-					 <&clk IMX93_CLK_CAN1_GATE>;
-				clock-names = "ipg", "per";
-				assigned-clocks = <&clk IMX93_CLK_CAN1>;
-				assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
-				assigned-clock-rates = <40000000>;
-				fsl,clk-source = /bits/ 8 <0>;
-				fsl,stop-mode = <&aonmix_ns_gpr 0x14 0>;
-				status = "disabled";
-			};
-
-			sai1: sai@443b0000 {
-				compatible = "fsl,imx93-sai";
-				reg = <0x443b0000 0x10000>;
-				interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
-					 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
-					 <&clk IMX93_CLK_DUMMY>;
-				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
-				dmas = <&edma1 22 0 FSL_EDMA_RX>, <&edma1 21 0 0>;
-				dma-names = "rx", "tx";
-				#sound-dai-cells = <0>;
-				status = "disabled";
-			};
-
-			iomuxc: pinctrl@443c0000 {
-				compatible = "fsl,imx93-iomuxc";
-				reg = <0x443c0000 0x10000>;
-				status = "okay";
-			};
-
-			bbnsm: bbnsm@44440000 {
-				compatible = "nxp,imx93-bbnsm", "syscon", "simple-mfd";
-				reg = <0x44440000 0x10000>;
-
-				bbnsm_rtc: rtc {
-					compatible = "nxp,imx93-bbnsm-rtc";
-					interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-				};
-
-				bbnsm_pwrkey: pwrkey {
-					compatible = "nxp,imx93-bbnsm-pwrkey";
-					interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-					linux,code = <KEY_POWER>;
-				};
-			};
-
-			clk: clock-controller@44450000 {
-				compatible = "fsl,imx93-ccm";
-				reg = <0x44450000 0x10000>;
-				#clock-cells = <1>;
-				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>;
-				clock-names = "osc_32k", "osc_24m", "clk_ext1";
-				assigned-clocks = <&clk IMX93_CLK_AUDIO_PLL>;
-				assigned-clock-rates = <393216000>;
-				status = "okay";
-			};
-
-			src: system-controller@44460000 {
-				compatible = "fsl,imx93-src", "syscon";
-				reg = <0x44460000 0x10000>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges;
-
-				mediamix: power-domain@44462400 {
-					compatible = "fsl,imx93-src-slice";
-					reg = <0x44462400 0x400>, <0x44465800 0x400>;
-					#power-domain-cells = <0>;
-					clocks = <&clk IMX93_CLK_NIC_MEDIA_GATE>,
-						 <&clk IMX93_CLK_MEDIA_APB>;
-				};
-			};
-
-			clock-controller@44480000 {
-				compatible = "fsl,imx93-anatop";
-				reg = <0x44480000 0x2000>;
-				#clock-cells = <1>;
-			};
-
-			micfil: micfil@44520000 {
-				compatible = "fsl,imx93-micfil";
-				reg = <0x44520000 0x10000>;
-				interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_PDM_IPG>,
-					 <&clk IMX93_CLK_PDM_GATE>,
-					 <&clk IMX93_CLK_AUDIO_PLL>;
-				clock-names = "ipg_clk", "ipg_clk_app", "pll8k";
-				dmas = <&edma1 29 0 5>;
-				dma-names = "rx";
-				#sound-dai-cells = <0>;
-				status = "disabled";
-			};
-
-			adc1: adc@44530000 {
-				compatible = "nxp,imx93-adc";
-				reg = <0x44530000 0x10000>;
-				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_ADC1_GATE>;
-				clock-names = "ipg";
-				#io-channel-cells = <1>;
-				status = "disabled";
-			};
-		};
-
-		aips2: bus@42000000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x42000000 0x800000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			edma2: dma-controller@42000000 {
-				compatible = "fsl,imx93-edma4";
-				reg = <0x42000000 0x210000>;
-				#dma-cells = <3>;
-				dma-channels = <64>;
-				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_EDMA2_GATE>;
-				clock-names = "dma";
-			};
-
-			wakeupmix_gpr: syscon@42420000 {
-				compatible = "fsl,imx93-wakeupmix-syscfg", "syscon";
-				reg = <0x42420000 0x1000>;
-			};
-
-			wdog3: watchdog@42490000 {
-				compatible = "fsl,imx93-wdt";
-				reg = <0x42490000 0x10000>;
-				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_WDOG3_GATE>;
-				timeout-sec = <40>;
-				status = "disabled";
-			};
-
-			wdog4: watchdog@424a0000 {
-				compatible = "fsl,imx93-wdt";
-				reg = <0x424a0000 0x10000>;
-				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_WDOG4_GATE>;
-				timeout-sec = <40>;
-				status = "disabled";
-			};
-
-			wdog5: watchdog@424b0000 {
-				compatible = "fsl,imx93-wdt";
-				reg = <0x424b0000 0x10000>;
-				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_WDOG5_GATE>;
-				timeout-sec = <40>;
-				status = "disabled";
-			};
-
-			tpm3: pwm@424e0000 {
-				compatible = "fsl,imx7ulp-pwm";
-				reg = <0x424e0000 0x1000>;
-				clocks = <&clk IMX93_CLK_TPM3_GATE>;
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			tpm4: pwm@424f0000 {
-				compatible = "fsl,imx7ulp-pwm";
-				reg = <0x424f0000 0x10000>;
-				clocks = <&clk IMX93_CLK_TPM4_GATE>;
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			tpm5: pwm@42500000 {
-				compatible = "fsl,imx7ulp-pwm";
-				reg = <0x42500000 0x10000>;
-				clocks = <&clk IMX93_CLK_TPM5_GATE>;
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			tpm6: pwm@42510000 {
-				compatible = "fsl,imx7ulp-pwm";
-				reg = <0x42510000 0x10000>;
-				clocks = <&clk IMX93_CLK_TPM6_GATE>;
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			i3c2: i3c@42520000 {
-				compatible = "silvaco,i3c-master-v1";
-				reg = <0x42520000 0x10000>;
-				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <3>;
-				#size-cells = <0>;
-				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
-					 <&clk IMX93_CLK_I3C2_GATE>,
-					 <&clk IMX93_CLK_I3C2_SLOW>;
-				clock-names = "pclk", "fast_clk", "slow_clk";
-				status = "disabled";
-			};
-
-			lpi2c3: i2c@42530000 {
-				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
-				reg = <0x42530000 0x10000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPI2C3_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 8 0 0>, <&edma2 9 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpi2c4: i2c@42540000 {
-				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
-				reg = <0x42540000 0x10000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPI2C4_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 10 0 0>, <&edma2 11 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpspi3: spi@42550000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,imx93-spi", "fsl,imx7ulp-spi";
-				reg = <0x42550000 0x10000>;
-				interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPSPI3_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 12 0 0>, <&edma2 13 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpspi4: spi@42560000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,imx93-spi", "fsl,imx7ulp-spi";
-				reg = <0x42560000 0x10000>;
-				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPSPI4_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 14 0 0>, <&edma2 15 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpuart3: serial@42570000 {
-				compatible = "fsl,imx93-lpuart", "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
-				reg = <0x42570000 0x1000>;
-				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPUART3_GATE>;
-				clock-names = "ipg";
-				dmas = <&edma2 18 0 FSL_EDMA_RX>, <&edma2 17 0 0>;
-				dma-names = "rx", "tx";
-				status = "disabled";
-			};
-
-			lpuart4: serial@42580000 {
-				compatible = "fsl,imx93-lpuart", "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
-				reg = <0x42580000 0x1000>;
-				interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPUART4_GATE>;
-				clock-names = "ipg";
-				dmas = <&edma2 20 0 FSL_EDMA_RX>, <&edma2 19 0 0>;
-				dma-names = "rx", "tx";
-				status = "disabled";
-			};
-
-			lpuart5: serial@42590000 {
-				compatible = "fsl,imx93-lpuart", "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
-				reg = <0x42590000 0x1000>;
-				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPUART5_GATE>;
-				clock-names = "ipg";
-				dmas = <&edma2 22 0 FSL_EDMA_RX>, <&edma2 21 0 0>;
-				dma-names = "rx", "tx";
-				status = "disabled";
-			};
-
-			lpuart6: serial@425a0000 {
-				compatible = "fsl,imx93-lpuart", "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
-				reg = <0x425a0000 0x1000>;
-				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPUART6_GATE>;
-				clock-names = "ipg";
-				dmas = <&edma2 24 0 FSL_EDMA_RX>, <&edma2 23 0 0>;
-				dma-names = "rx", "tx";
-				status = "disabled";
-			};
-
-			flexcan2: can@425b0000 {
-				compatible = "fsl,imx93-flexcan";
-				reg = <0x425b0000 0x10000>;
-				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
-					 <&clk IMX93_CLK_CAN2_GATE>;
-				clock-names = "ipg", "per";
-				assigned-clocks = <&clk IMX93_CLK_CAN2>;
-				assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
-				assigned-clock-rates = <40000000>;
-				fsl,clk-source = /bits/ 8 <0>;
-				fsl,stop-mode = <&wakeupmix_gpr 0x0c 2>;
-				status = "disabled";
-			};
-
-			flexspi1: spi@425e0000 {
-				compatible = "nxp,imx93-fspi", "nxp,imx8mm-fspi";
-				reg = <0x425e0000 0x10000>, <0x28000000 0x10000000>;
-				reg-names = "fspi_base", "fspi_mmap";
-				#address-cells = <1>;
-				#size-cells = <0>;
-				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_FLEXSPI1_GATE>,
-					 <&clk IMX93_CLK_FLEXSPI1_GATE>;
-				clock-names = "fspi_en", "fspi";
-				assigned-clocks = <&clk IMX93_CLK_FLEXSPI1>;
-				assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>;
-				status = "disabled";
-			};
-
-			sai2: sai@42650000 {
-				compatible = "fsl,imx93-sai";
-				reg = <0x42650000 0x10000>;
-				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_SAI2_IPG>, <&clk IMX93_CLK_DUMMY>,
-					 <&clk IMX93_CLK_SAI2_GATE>, <&clk IMX93_CLK_DUMMY>,
-					 <&clk IMX93_CLK_DUMMY>;
-				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
-				dmas = <&edma2 59 0 FSL_EDMA_RX>, <&edma2 58 0 0>;
-				dma-names = "rx", "tx";
-				#sound-dai-cells = <0>;
-				status = "disabled";
-			};
-
-			sai3: sai@42660000 {
-				compatible = "fsl,imx93-sai";
-				reg = <0x42660000 0x10000>;
-				interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_SAI3_IPG>, <&clk IMX93_CLK_DUMMY>,
-					 <&clk IMX93_CLK_SAI3_GATE>, <&clk IMX93_CLK_DUMMY>,
-					 <&clk IMX93_CLK_DUMMY>;
-				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
-				dmas = <&edma2 61 0 FSL_EDMA_RX>, <&edma2 60 0 0>;
-				dma-names = "rx", "tx";
-				#sound-dai-cells = <0>;
-				status = "disabled";
-			};
-
-			xcvr: xcvr@42680000 {
-				compatible = "fsl,imx93-xcvr";
-				reg = <0x42680000 0x800>,
-				      <0x42680800 0x400>,
-				      <0x42680c00 0x080>,
-				      <0x42680e00 0x080>;
-				reg-names = "ram", "regs", "rxfifo", "txfifo";
-				interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_SPDIF_IPG>,
-					 <&clk IMX93_CLK_SPDIF_GATE>,
-					 <&clk IMX93_CLK_DUMMY>,
-					 <&clk IMX93_CLK_AUD_XCVR_GATE>;
-				clock-names = "ipg", "phy", "spba", "pll_ipg";
-				dmas = <&edma2 65 0 FSL_EDMA_RX>, <&edma2 66 0 0>;
-				dma-names = "rx", "tx";
-				#sound-dai-cells = <0>;
-				status = "disabled";
-			};
-
-			lpuart7: serial@42690000 {
-				compatible = "fsl,imx93-lpuart", "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
-				reg = <0x42690000 0x1000>;
-				interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPUART7_GATE>;
-				clock-names = "ipg";
-				dmas = <&edma2 88 0 FSL_EDMA_RX>, <&edma2 87 0 0>;
-				dma-names = "rx", "tx";
-				status = "disabled";
-			};
-
-			lpuart8: serial@426a0000 {
-				compatible = "fsl,imx93-lpuart", "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
-				reg = <0x426a0000 0x1000>;
-				interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPUART8_GATE>;
-				clock-names = "ipg";
-				dmas = <&edma2 90 0 FSL_EDMA_RX>, <&edma2 89 0 0>;
-				dma-names = "rx", "tx";
-				status = "disabled";
-			};
-
-			lpi2c5: i2c@426b0000 {
-				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
-				reg = <0x426b0000 0x10000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPI2C5_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 71 0 0>, <&edma2 72 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpi2c6: i2c@426c0000 {
-				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
-				reg = <0x426c0000 0x10000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPI2C6_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 73 0 0>, <&edma2 74 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpi2c7: i2c@426d0000 {
-				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
-				reg = <0x426d0000 0x10000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPI2C7_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 75 0 0>, <&edma2 76 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpi2c8: i2c@426e0000 {
-				compatible = "fsl,imx93-lpi2c", "fsl,imx7ulp-lpi2c";
-				reg = <0x426e0000 0x10000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPI2C8_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 77 0 0>, <&edma2 78 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpspi5: spi@426f0000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,imx93-spi", "fsl,imx7ulp-spi";
-				reg = <0x426f0000 0x10000>;
-				interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPSPI5_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 79 0 0>, <&edma2 80 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpspi6: spi@42700000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,imx93-spi", "fsl,imx7ulp-spi";
-				reg = <0x42700000 0x10000>;
-				interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPSPI6_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 81 0 0>, <&edma2 82 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpspi7: spi@42710000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,imx93-spi", "fsl,imx7ulp-spi";
-				reg = <0x42710000 0x10000>;
-				interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPSPI7_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 83 0 0>, <&edma2 84 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-			lpspi8: spi@42720000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,imx93-spi", "fsl,imx7ulp-spi";
-				reg = <0x42720000 0x10000>;
-				interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_LPSPI8_GATE>,
-					 <&clk IMX93_CLK_BUS_WAKEUP>;
-				clock-names = "per", "ipg";
-				dmas = <&edma2 85 0 0>, <&edma2 86 0 FSL_EDMA_RX>;
-				dma-names = "tx", "rx";
-				status = "disabled";
-			};
-
-		};
-
-		aips3: bus@42800000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x42800000 0x800000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			usdhc1: mmc@42850000 {
-				compatible = "fsl,imx93-usdhc", "fsl,imx8mm-usdhc";
-				reg = <0x42850000 0x10000>;
-				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
-					 <&clk IMX93_CLK_WAKEUP_AXI>,
-					 <&clk IMX93_CLK_USDHC1_GATE>;
-				clock-names = "ipg", "ahb", "per";
-				assigned-clocks = <&clk IMX93_CLK_USDHC1>;
-				assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>;
-				assigned-clock-rates = <400000000>;
-				bus-width = <8>;
-				fsl,tuning-start-tap = <1>;
-				fsl,tuning-step = <2>;
-				status = "disabled";
-			};
-
-			usdhc2: mmc@42860000 {
-				compatible = "fsl,imx93-usdhc", "fsl,imx8mm-usdhc";
-				reg = <0x42860000 0x10000>;
-				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
-					 <&clk IMX93_CLK_WAKEUP_AXI>,
-					 <&clk IMX93_CLK_USDHC2_GATE>;
-				clock-names = "ipg", "ahb", "per";
-				assigned-clocks = <&clk IMX93_CLK_USDHC2>;
-				assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>;
-				assigned-clock-rates = <400000000>;
-				bus-width = <4>;
-				fsl,tuning-start-tap = <1>;
-				fsl,tuning-step = <2>;
-				status = "disabled";
-			};
-
-			fec: ethernet@42890000 {
-				compatible = "fsl,imx93-fec", "fsl,imx8mq-fec", "fsl,imx6sx-fec";
-				reg = <0x42890000 0x10000>;
-				interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_ENET1_GATE>,
-					 <&clk IMX93_CLK_ENET1_GATE>,
-					 <&clk IMX93_CLK_ENET_TIMER1>,
-					 <&clk IMX93_CLK_ENET_REF>,
-					 <&clk IMX93_CLK_ENET_REF_PHY>;
-				clock-names = "ipg", "ahb", "ptp",
-					      "enet_clk_ref", "enet_out";
-				assigned-clocks = <&clk IMX93_CLK_ENET_TIMER1>,
-						  <&clk IMX93_CLK_ENET_REF>,
-						  <&clk IMX93_CLK_ENET_REF_PHY>;
-				assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
-							 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>,
-							 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
-				assigned-clock-rates = <100000000>, <250000000>, <50000000>;
-				fsl,num-tx-queues = <3>;
-				fsl,num-rx-queues = <3>;
-				fsl,stop-mode = <&wakeupmix_gpr 0x0c 1>;
-				nvmem-cells = <&eth_mac1>;
-				nvmem-cell-names = "mac-address";
-				status = "disabled";
-			};
-
-			eqos: ethernet@428a0000 {
-				compatible = "nxp,imx93-dwmac-eqos", "snps,dwmac-5.10a";
-				reg = <0x428a0000 0x10000>;
-				interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "macirq", "eth_wake_irq";
-				clocks = <&clk IMX93_CLK_ENET_QOS_GATE>,
-					 <&clk IMX93_CLK_ENET_QOS_GATE>,
-					 <&clk IMX93_CLK_ENET_TIMER2>,
-					 <&clk IMX93_CLK_ENET>,
-					 <&clk IMX93_CLK_ENET_QOS_GATE>;
-				clock-names = "stmmaceth", "pclk", "ptp_ref", "tx", "mem";
-				assigned-clocks = <&clk IMX93_CLK_ENET_TIMER2>,
-						  <&clk IMX93_CLK_ENET>;
-				assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
-							 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
-				assigned-clock-rates = <100000000>, <250000000>;
-				intf_mode = <&wakeupmix_gpr 0x28>;
-				snps,clk-csr = <6>;
-				nvmem-cells = <&eth_mac2>;
-				nvmem-cell-names = "mac-address";
-				status = "disabled";
-			};
-
-			usdhc3: mmc@428b0000 {
-				compatible = "fsl,imx93-usdhc", "fsl,imx8mm-usdhc";
-				reg = <0x428b0000 0x10000>;
-				interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
-					 <&clk IMX93_CLK_WAKEUP_AXI>,
-					 <&clk IMX93_CLK_USDHC3_GATE>;
-				clock-names = "ipg", "ahb", "per";
-				assigned-clocks = <&clk IMX93_CLK_USDHC3>;
-				assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>;
-				assigned-clock-rates = <400000000>;
-				bus-width = <4>;
-				fsl,tuning-start-tap = <1>;
-				fsl,tuning-step = <2>;
-				status = "disabled";
-			};
-		};
-
-		gpio2: gpio@43810000 {
-			compatible = "fsl,imx93-gpio", "fsl,imx8ulp-gpio";
-			reg = <0x43810000 0x1000>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO2_GATE>,
-				 <&clk IMX93_CLK_GPIO2_GATE>;
-			clock-names = "gpio", "port";
-			gpio-ranges = <&iomuxc 0 4 30>;
-			ngpios = <30>;
-		};
-
-		gpio3: gpio@43820000 {
-			compatible = "fsl,imx93-gpio", "fsl,imx8ulp-gpio";
-			reg = <0x43820000 0x1000>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO3_GATE>,
-				 <&clk IMX93_CLK_GPIO3_GATE>;
-			clock-names = "gpio", "port";
-			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
-				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
-			ngpios = <32>;
-		};
-
-		gpio4: gpio@43830000 {
-			compatible = "fsl,imx93-gpio", "fsl,imx8ulp-gpio";
-			reg = <0x43830000 0x1000>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO4_GATE>,
-				 <&clk IMX93_CLK_GPIO4_GATE>;
-			clock-names = "gpio", "port";
-			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
-			ngpios = <30>;
-		};
-
-		gpio1: gpio@47400000 {
-			compatible = "fsl,imx93-gpio", "fsl,imx8ulp-gpio";
-			reg = <0x47400000 0x1000>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO1_GATE>,
-				 <&clk IMX93_CLK_GPIO1_GATE>;
-			clock-names = "gpio", "port";
-			gpio-ranges = <&iomuxc 0 92 16>;
-			ngpios = <16>;
-		};
-
-		ocotp: efuse@47510000 {
-			compatible = "fsl,imx93-ocotp", "syscon";
-			reg = <0x47510000 0x10000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			eth_mac1: mac-address@4ec {
-				reg = <0x4ec 0x6>;
-			};
-
-			eth_mac2: mac-address@4f2 {
-				reg = <0x4f2 0x6>;
-			};
-
-		};
-
-		s4muap: mailbox@47520000 {
-			compatible = "fsl,imx93-mu-s4";
-			reg = <0x47520000 0x10000>;
-			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "tx", "rx";
-			#mbox-cells = <2>;
-		};
-
-		media_blk_ctrl: system-controller@4ac10000 {
-			compatible = "fsl,imx93-media-blk-ctrl", "syscon";
-			reg = <0x4ac10000 0x10000>;
-			power-domains = <&mediamix>;
-			clocks = <&clk IMX93_CLK_MEDIA_APB>,
-				 <&clk IMX93_CLK_MEDIA_AXI>,
-				 <&clk IMX93_CLK_NIC_MEDIA_GATE>,
-				 <&clk IMX93_CLK_MEDIA_DISP_PIX>,
-				 <&clk IMX93_CLK_CAM_PIX>,
-				 <&clk IMX93_CLK_PXP_GATE>,
-				 <&clk IMX93_CLK_LCDIF_GATE>,
-				 <&clk IMX93_CLK_ISI_GATE>,
-				 <&clk IMX93_CLK_MIPI_CSI_GATE>,
-				 <&clk IMX93_CLK_MIPI_DSI_GATE>;
-			clock-names = "apb", "axi", "nic", "disp", "cam",
-				      "pxp", "lcdif", "isi", "csi", "dsi";
-			#power-domain-cells = <1>;
-			status = "disabled";
-		};
-
-		usbotg1: usb@4c100000 {
-			compatible = "fsl,imx93-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
-			reg = <0x4c100000 0x200>;
-			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk IMX93_CLK_USB_CONTROLLER_GATE>,
-				 <&clk IMX93_CLK_HSIO_32K_GATE>;
-			clock-names = "usb_ctrl_root", "usb_wakeup";
-			assigned-clocks = <&clk IMX93_CLK_HSIO>;
-			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
-			assigned-clock-rates = <133000000>;
-			phys = <&usbphynop1>;
-			fsl,usbmisc = <&usbmisc1 0>;
-			status = "disabled";
-		};
-
-		usbmisc1: usbmisc@4c100200 {
-			compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc",
-				     "fsl,imx6q-usbmisc";
-			reg = <0x4c100200 0x200>;
-			#index-cells = <1>;
-		};
-
-		usbotg2: usb@4c200000 {
-			compatible = "fsl,imx93-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
-			reg = <0x4c200000 0x200>;
-			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk IMX93_CLK_USB_CONTROLLER_GATE>,
-				 <&clk IMX93_CLK_HSIO_32K_GATE>;
-			clock-names = "usb_ctrl_root", "usb_wakeup";
-			assigned-clocks = <&clk IMX93_CLK_HSIO>;
-			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
-			assigned-clock-rates = <133000000>;
-			phys = <&usbphynop2>;
-			fsl,usbmisc = <&usbmisc2 0>;
-			status = "disabled";
-		};
-
-		usbmisc2: usbmisc@4c200200 {
-			compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc",
-				     "fsl,imx6q-usbmisc";
-			reg = <0x4c200200 0x200>;
-			#index-cells = <1>;
-		};
-
-		memory-controller@4e300000 {
-			compatible = "nxp,imx9-memory-controller";
-			reg = <0x4e300000 0x800>, <0x4e301000 0x1000>;
-			reg-names = "ctrl", "inject";
-			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-			little-endian;
-		};
-
-		ddr_pmu: ddr-pmu@4e300dc0 {
-			compatible = "fsl,imx93-ddr-pmu";
-			reg = <0x4e300dc0 0x200>;
-			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 7b27012dfcb564650882dc8c40e836e797b2fda1..14bb3b419c565fbc48e5ef9f069ec7cb9116929e 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -3,7 +3,7 @@
  * Copyright 2022,2025 NXP
  */
 
-#include "imx91_93_common.dtsi"
+#include "imx91-93-common.dtsi"
 
 /{
 	cm33: remoteproc-cm33 {

-- 
2.37.1

