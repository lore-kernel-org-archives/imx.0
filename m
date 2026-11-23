Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795465927;
	b=cByFFbFhq2BHwJiOExvfCDowihWFiaCsAcqjbeBPgo78gjhHLHFuQYUnViCbFLn31ayJ
	 nA8d1xjXSI1doohbM/zF2G3o3gW+pq8VqBXSbYv5WGO6yD3bMAK8UwnhCOZ23cHl5VJkS
	 aGTbD8/QNTqK1/ViuQEy8usLRvVBCfXOmo/fPOVG/72PHfpVEgc9WyISMwzcQbwm/Oete
	 iMIIwIBg/DV6BQ8Wx8/kCM6+5y0mXnxjORrc0mZ3jqAhmBQG2kU7Y0PfYvYsnxeB/HLLN
	 5XJKvj5sa7SNPQid8/TR1arI7ZNFyAsWn3D5rNmSFNrVUtO/RdLTuuk12jWs1ksQFDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465927;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xQZuvY/8myHCTWX9QPQ+aLJ1uq1TP2vMpYgDCp9sY2Y=;
	b=a8F8GWl5TsXR+bSMm26QC0K0PmMIzUGBvjgpH1UmGzmoUSqfo/Zt4ViEL1VnrMttHZNy
	 qQytcND3pM0PHigd+aoNzKodft+N9R/eEaf11XF0qzczTsB5IE53HOEyJgu1hakdKm/5Y
	 PklvWLqVl1EibvS04lPnovugVOSBOhMHy5fNuOFasN63hcb6ARBxXC3KwibTdypyO45lr
	 gYWARYXBsre8SXi5Vin3SSZ92luUGuTmxgfXSsK7yZODgxw5aNzmuyBlnAbyijpT1cwty
	 y6Yykr0GItnV/AwknH7AWqksA3vuEqfn5HkitywQ8FuDHmO8Lil1pXQf4N0ozwZM/4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L6ZOUDIp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.19
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013019.outbound.protection.outlook.com [52.101.72.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAED606A31E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 20:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAAED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L6ZOUDIp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxGGB3bHZ2/xgQxZvMY1x/wmwNER2C7CP8Mg8stVmPYs39LmaPMuMJE++6pYPB/EB1hcH49QPOaiN03iAeGz433dkX7lP/IS4JKSnsafz3fW+StUxyOd4wl/OWzwBGKxFD3TfiquBRd9U6eROfehvHrhMEQPwb1EA/ytBpx3PqszT49hL1oEBjPE5QaBhxkRB+ejtae8NIzvudU7H6OhqIZA04c2lMyDZyKQ9xGZ9J0w4M1nEAa6ACqZ0gU4BJsMgYLc2JkEEy4bjLhEEX1jINapG/9DZhiLccHUNVV+CuR+5mJl9UrjCAmhkKlfO3RNDfJRjjI8mn7mUKRDOF9eSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQZuvY/8myHCTWX9QPQ+aLJ1uq1TP2vMpYgDCp9sY2Y=;
 b=qDKIrEGGoVzqUfPFopu7kwnUI0ThRQWjZ1DFqQXSARYasyyMXsjwZTfk/G7ngXsNVeybaEKXIaA5JK+ZMKxYN8vZUTxuSYfj7RUefo4vC/1u4v9jiUx4I8zLo2YguZoHQ0pJmBDBczIc65GugdFk329ON7T4n0VEkRE5t8N2/7/CDoA5PGAB5wiUU2hWgzbrEV3DJUGjtBpQQBQNEDUTxxlirX+XjT3RBwOM5ruf82jv/HV7FvbM5UYp7CYhZoA67zr1M6psnZnpfdsnDqOwSlbOZIP0+1uaWx5YXPMaXIqUe1uTckRR2Cs55fc24Q7wsD7VmvOwk+TtHupEUWOhPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQZuvY/8myHCTWX9QPQ+aLJ1uq1TP2vMpYgDCp9sY2Y=;
 b=L6ZOUDIp2kBuhKtPfstYs2s8tYRqR8g2cTL/qB0WrEw2WunohotgKuCdOEuD6X4r7Gt6Yz+sF4JchBxZfatlpHLMckjAv4B7mfUTT5ry1NuFSsXmnnIfuXi7bzaZQI6DcZwB/KyWcnD8wer89kXg5lcINKHZ4oAqOwlj/K1SMYA80K0VuPPxOpOSlNLguY19IEL8zwS24niH3UumXXVNZ0xf47oDEWwkjAA3LRDhZePCPpUxg/hY5/38FVjMJ0USDnlZ1Y73FEmvc8OiyIV0je7Jn1knVFGvyDbaypACTsa3Ze50a12SdL08v3Ix4L4toh1LfpMUDCRzfduyzjjIrQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8701.eurprd04.prod.outlook.com (2603:10a6:102:21c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 20:32:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:32:02 +0000
From: Frank.Li@oss.nxp.com
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] ARM: dts: imx: Add SPI aliases to Toradex Apalis and Colibri SoMs
Date: Mon, 23 Nov 2026 15:31:55 -0500
Message-ID: <179546590199.2861425.10922466893082116297.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112150849.177133-1-francesco@dolcini.it>
References: <20261112150849.177133-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0087.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::35) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8701:EE_
X-MS-Office365-Filtering-Correlation-Id: 12518489-4dea-4434-1d19-08df49a0d4fc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|19092799006|1800799024|261028144727099003|10067099003|11063799006|56012099006|261022105027099003|261026140227099003|261026121527099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vMnLrmy4mToMJaY99CsHxe8bfJIhbUDu1KNP0ElP4OFrV8GG7wUBUcQ+eWFzIvOJa6j4050a0qjbaxq9mHX/SyCcw88kn6GzLjDEOVMuSef1XiLG7+N3c/8VCc97v5XbkLQmFMau9TfKz7DqiGPbfDzxIHZMxw4xwfkq1mxsoq0wqWKwcuBOI9/XkA58N0dUJm6X9EO2xHQ8HUMsC3rzjo+3RwXtFXq3OE1e3EmyiTC+enl3mNP0ANCYVnUx5OO8HqAc3EioLZCUVbMk9HpeLqZr9Lu0mG4I42wCCQ01k4BO0EBJS1PatgODsnB/ZdlKiiAo8R2AO38EHr9Y5ATXWg4rNyHyCl0/ZfZLVYLFmm030kzNdU+eheEE1fIPspogYTpbuJqiQtcMJiu3mm5mdCmFbAh3Nu75r7N6cImKF18E81e6hpIS/3KEqchmdGHOkiq+lY/gMzf9hxQG9/SQS6CrFRwwjwUkHbNGLFvqZ6vBMFZUg1kqv7zpFnE3PqnKtH3t1Q0uJ/48Mie9doMfKT+c1g8H13A03yGmTm9naBplA3wLErv2q6e3SjQTGXibMBiOlzHG4xBniz49bqm6XBeJAeUoiCeFQxPQE40XVpEcg65jkeGDzTKxDCI+exMmujQKx3xJOE3L48qOySyKRA9pVBBA+hefp9bDzfc+Chs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(19092799006)(1800799024)(261028144727099003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmZ1V3czbnUwVTRqTXhuNFdUZkFVdXp5NkpkZDF3c2tsalZUc1ZnY2o3c3do?=
 =?utf-8?B?YzZyMFYzeFhROTRVaStsM1ZZK1VyMzRKWDdDRTE1a2RCMHpLRXJ0OEFBQnA1?=
 =?utf-8?B?UUV5RE9Pbm9sYXN3ajlnQm55S1BGYUxZWjJhTUluTVpzV0E4WDlsV2ZsZWNW?=
 =?utf-8?B?c3lQRmJ6NlNQS2hPZHMwSjRVV1ZSMjk1akh6eTJiWGR3ZDQwS2huem03SFZs?=
 =?utf-8?B?bDZhb0tja3FKUkNWMEhCUUhMUU1oQlNvWVlaMWNiRXpiRk01bWlpaEsyVVdL?=
 =?utf-8?B?M0xtSkVNSXdPaXVueGNHMFJSR1JPREYvTWJGNE1mZkRVdjQ4ZHhiMzVBcWEv?=
 =?utf-8?B?Wm1iNmVyb1d0dWxmRlhuS2lLb0ZGUHkvSWJGK1lvazFucUYxS21MdjJPNENj?=
 =?utf-8?B?OWduVzJXa28rUFFYWEJKU0tLNzBUOFJTZnduWTExb3htQ3pmcVVabTlySERY?=
 =?utf-8?B?SDhvTXA2N1Ztck1Za1JjZTNnL0hVNW0wWmQ0T3R4cFdxWDZQZEFacGdvL1Jx?=
 =?utf-8?B?dHdqYjNxaG8wWVlUakhoeEJEb1hzM0NOSE1Td3J5UVBKL0dLN2xuZlZadDNq?=
 =?utf-8?B?M2N2M0Q4RHF5eWdMQnFoNzVaZ0NKdkdqUGcrbEh0blo3cWJab254a25UeWN1?=
 =?utf-8?B?dGNyQ2Fsc1E2a2RoWlVuNEk1QWZDZytTZk1XdS8vakU2azRmQk96WVBMU01x?=
 =?utf-8?B?dFBYRXNGVHJZbkhPTDA2LzcxOFB1RzVua2dRRXM2UUlGbXdtV2ppQW0wbS82?=
 =?utf-8?B?ZHAwMDdybU5JU1hiOUtCMWk4WUVFSXhNRk1Xdmdpbkk3WWpOUGlMVU04MWtk?=
 =?utf-8?B?c3hlZVlSd09RWkZSckZsNkFXVkdLV05TOHV4aDRKL1U2ak16d2x5NG0yeHI2?=
 =?utf-8?B?U3IvK3A1VnIxVDVEZlpSVFhWZ2x4Q0dqakFaSDN0N3ZwMDhwdHR2NytTVVBX?=
 =?utf-8?B?di95ZFk2VUEraVBYQWpnWDVJaGdMNXZkRExpOVVVSWFFZjFOeDBGbkNYYVIv?=
 =?utf-8?B?SzFzRGt6cTlnMEhDRTZvMDJTL00xYnpSVmZxamVwQkQ1YUdkbDVFVnUwcGk3?=
 =?utf-8?B?SHo0Y2ZLaU5VRUt3TzdiRldxRmdMOFh2SHROcUw5RzIyRjFvZUVRSkpwd1dZ?=
 =?utf-8?B?dXpvTFVmekgzejBUb2NEUnlwbmE1eEpleXpRUXVBOFpDWm00VmlPRy93VmV6?=
 =?utf-8?B?VXNPWUMyWEFueUNXenZ6d0dFa0NwT1V5UmZMU0FlWGFEcFZSaUw4d2Y4VndP?=
 =?utf-8?B?UlVsYVQ2aHZMQUt5VEEwbmY3cEY1WEpnYUlxYjIrajd3QmIzNThzRmlaREVq?=
 =?utf-8?B?RVkvc1FkWE1kU0xQNXlBbjcwS1Zla3hpRWRjem1heW9jV1R3RDBBYnpycEJS?=
 =?utf-8?B?VThmeFFJbmFmakJDSTN3OUtpVkNBRXo3VWJ5c3orY2QybzlVZHQ1Rzc3bFlF?=
 =?utf-8?B?UlZuRGtLWEM2akdQRmt6d2g0OTY2MGtodzZWMkMrSHhLYmo0alBxOVBzdE1t?=
 =?utf-8?B?SzgzTkpUeWYrOStoR3l1UEVrbkdtU3dNbEpjS0wzWWhvRDMwcWZDNnVFditz?=
 =?utf-8?B?cEsyQnhobjVzdGNDcjZwc1o5eVpDMElTNllZcXRoVVZhODVIN1hlT1ptcXp1?=
 =?utf-8?B?RjRscjBLUmJzSnlDM0VXNlluVUszSmpRQ0w5a0FlcFVDSUpsZUxnNU9EQW5k?=
 =?utf-8?B?V210eU1RVG1VeEFjWXVlWFVBOVJJRm83ckpPYTBDSU9YSUFUVUNLNVlsQ3RC?=
 =?utf-8?B?cWJSUkFEaU1YaFU4S1VBaVZBM3h2NjVtQkVLcTNsV3JaMHh2Tm43Zi9PbUxv?=
 =?utf-8?B?dkpwbjZidnF4M3NLU1pWaUtVa01WYVJ5ZjYvVXRiZmNjb1I5dE1SL2k4aTI3?=
 =?utf-8?B?TmdxT1d5aVFLMktEdjdRVjkvTmJyR0JIUElwcER1LzZ1L04wMUhzWkJsbXhL?=
 =?utf-8?B?eGkyNEl4NXgrN3hMRVdZdHp3Q3FmMzlyK1JVR1dQcUhTeE5KbGMzcFZ1UVRz?=
 =?utf-8?B?ZE50bU9hR3hQc3hPaElNTE16VEd6YWlZcEF2S0VCa2NYbGJqVkJzR1VVd1JX?=
 =?utf-8?B?TzhNZXNRVmVLbXJQcGFIQ1d3UGRnNzN1MDdqT2thRm1BWDB5NDhCcXQ0VXdO?=
 =?utf-8?B?bEZMSmJRcXRwRmhCNTRPNUhzSkUwQU5HVkd0N3YwR2N6Z3pCMFY0M2l2eDQx?=
 =?utf-8?B?OHp2K3BHMnFnNFBhMVMyaTBhYS9TdUxYQnlhbkpHQnRvQVo4bEltN3dLeWZD?=
 =?utf-8?B?RTBxMENaVGpTTm1TbmJ1bWZwazg4blNLNW9wMmZ1K1luSUdNckxyL2lzajhQ?=
 =?utf-8?B?TGtSZlVzMXlidk12WnR3VXdUanNsSFpyZ3ZHa3ZseVdTZlluM09kQkk1aEFF?=
 =?utf-8?Q?1yVgng0FadIo0XSq8r9e2ocEZ43CWU9aD6d8Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12518489-4dea-4434-1d19-08df49a0d4fc
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 20:32:02.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhAtSQDR2OrjyPXI7U6P/quY7wzZEiHV5L6bWOR2bLtxFPqYTEhjGwkZTXen6FK6SITfElNjfphG0QMp4/h0C5IlTTmWq+uq8brgIfjuwnEXrOun0DG0IcSikNM2IESQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8701

From: Frank Li <Frank.Li@nxp.com>


On Thu, 12 Nov 2026 16:08:44 +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Toradex SoM families (Apalis, Colibri) define the interfaces available
> to the carrier board and their numbering as part of the family pinout.
> The i.MX6, i.MX6ULL and i.MX7 SoC dtsi files number the SPI
> controllers in SoC order instead, so the Linux bus number in sysfs and
> the spidev device name follow the SoC, not the SoM interface.
> 
> [...]

Applied, thanks!

[1/4] ARM: dts: imx6qdl-apalis: Add SPI aliases
      commit: b291172a867458955d7dd09fa5af83f6b836d6cc
[2/4] ARM: dts: imx6qdl-colibri: Add SPI alias
      commit: 70ee629c874733e2f4a907c22822c159ef25c0bf
[3/4] ARM: dts: imx6ull-colibri: Add SPI alias
      commit: f40b465960f31fad03ad344114071500bc25d302
[4/4] ARM: dts: imx7-colibri: Add SPI alias
      commit: db617e3a9d025a486e5328d25dfef483e4dac95d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
