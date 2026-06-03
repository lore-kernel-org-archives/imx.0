Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F073F1ABA
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 18:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780511971; cv=fail; b=jP1AOL6XVcoelTEkdHlA7TtkjjAUG8JubC4KLR08mxO99mzQi/4fJ2751a1n0p66u1Cqt1pD1gKEbYdCSJm8oSSmFrOWyNALqy7GlcCJphTIM1tlqoyLKQDIH4PCeCh4JY0fmSqOuPqK8ihBkUpW7G3Bb47QDYYXnaQnX6+OQkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780511971; c=relaxed/simple;
	bh=K4+km7OZ8Gz+W5o7OvnhrIblQaiIh7R0iuSV+0/eG+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tZr4mLDcus8WwS6vJPUGNzr6pLs+Qvy0ZXk7y7rM2O+YQSLx/mB0n9BR7bjTvEYkSzqM4/vBHBU3uCxACfpKUh0NMRE0RO21lJ5OvrSPBRg6rVei4r/Fh6fut6p/aFxNs46YlqB8vCd7499R+7Ugq5z6arcJwu+h9Fhc72Bmen0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BhCDWOiF; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BhCDWOiF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMs6izKgyfYJ7bQprdqSy2tTMTHcEdjA77LR2NS+reze7yHq/A4IKPfaWbkQLzAGZFwQx0bFegpSqUVnPEjaRJmOj9UPI2Sk+A2F80Xh7QrkP3WZ1ZQeZWsg6GJcDE0SgJ2u1yCQDOGI58rAo/ZZ0aeYj5nD4wCdNZT/ktjWBBfaVnbDAbqiI2bstZ9M2rSrmRLLWQhoTTAw0ZZG/AinponY82ycxsEWd+Tr2flOtxw6oN5BHegbDzimTVuiYWCUxCcLZ+C4Dfrx0e+TvyyKoy7AGeEk4fXdrJlr+QgPtjf+3w3wAdpZ/JoWD4fiEpcLCvkS8sbohHtH+IChMGYU+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaVOexsFE8z+6xYLJAge16fEeSV3YkySqZ7DIaYMb2M=;
 b=tVc/hb4unWqY0CTyMe6MTQXlOAsMy3u9wxK8+Bnm9sP/yT0/xiYqge7iLMsJ5MxqPaE+fC2htWgvYjNFFZcW/b31C0oPh/H6+GqczVYjHjyiqISGhpLfh8T0M8GVlfMVBjUEEF8f2IFn0a9LAjBHhR1LvWNXJZXkBtLInWb6H8KMOGeEVr+joGexEkBfv0nCRS2XPEpCek9klLsju11z3bFsrjRN0FhU56Boj7L5k0M28yE3WzH/NzTJ+Obw1Ou5jV4+CLssrS3DXCHExKMcdNRNLPnqyQmqR7VeA6YV5fZiGS7OX8Qng2ASd0IUO1eRzJJ5i9fIbFUdkZACsQnhoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaVOexsFE8z+6xYLJAge16fEeSV3YkySqZ7DIaYMb2M=;
 b=BhCDWOiFyD8IdaKU9nu08r0N0rKQNAydZuUQxdwhBXFcWcz6Eqp0rjwBQOxHkGkqIU1MTNRnCkTo9EfInwxUsM4bHAAnokLMNX6/Ny1NEzyKjwoCd/ZeZ5S6q6ESvQFvPIcXr/uU2qsh60Lw915hOiw7riSm6fZAV8wXNr1AK8Fyzds7KeRbP7KAsoIwiYQFPE7rSXfStTCZFfkSeYYnmmXNasmMjF2Kmoeb+IC7MROP3sk7VFeZ0kQmQyoLF5Rmg6XBUD5VNoeChMuh/oVy0xrOJEtmfEve4mAczRdz3I2908aL4pZh2ttSHAYCRc+GBso7GzVZZfe7eli4FJuGUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:39:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:39:26 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florijan Plohl <florijan.plohl@norik.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v3] arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18 overlays
Date: Wed,  3 Jun 2026 14:39:18 -0400
Message-ID: <178051195235.2750461.17203968731432746469.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603061726.2908262-1-florijan.plohl@norik.com>
References: <20260603061726.2908262-1-florijan.plohl@norik.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:806:20::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 818a98e2-22a3-4a4a-8e23-08dec19f7094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	eq/nk642/BvOmK6PYzQprSgTtxRIvJnyOqNamr3TjKL47gwetWXqWfNZToLfe6V5ApbSfO2ETynbqYAWsrpD3aHjuvp2346w/oym8uRTCX+A87yEIBbPDVLktkdZm5oRryqs5KwMHP5ioiPVPzQ68v+lJBq0kVobxiMqboMcZb/QMB9QpWNQSTRq6JaOULdYxeDhG6O2ooQSu345DFw8oV+rni/WefSNmiEg8z5OJ2akuV9BItywxxAVJZIjJDWPMfAorSZNb92lNstJNWHb1cgqJMRx/F+C02SQqYtkdbuWakOGVRLyxy1CLcVKOmOiR1O1UoDV5pHw+M7648Oh12ExYNNScoG/KZGuN1bg5FXEO1v7o6I3+cKi7iZEOzPCpMvxxTGRaG4nSrF26pKF5/O/d5nSNqXzYlgFVDqYD3/+MyMs0zcwofypjHp+AqYcTVdkW0XyftTEL0w727rSuWRIr0QpfCRpfHiB4MjLtVi55iIRCjKnTBkDlbp5i6JJEFVNRj5O/uLbUuakF1khn14XH5HdgyEU1bTAwbyzW1s28VweCPKuWD+5eA1KcOAlYji+L7cGxNUMsz4LvCUhOFX2+yQXPC64VkL3HVgsejXGb7ugEL5+gKYD3zNMQUQbZQ93E8xCbY4rQvXB+Rqhvvdw5tnmiEvMqJNHAoEhe18itAhwpuKgbxjkEKYvOQSL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUpIejAxcmVEWWRkQkJxUU1mYkpLSlNFN0pwMUpaVnJwVWdPaVdxZUp0MFBr?=
 =?utf-8?B?N1JjUEFXb1BRUlFDMEEzYjBodWVVQkVkYkFqU3N1aS9DUnM0Ulh6MnZqNkY5?=
 =?utf-8?B?eTczekplZ1hKNnhHRjQrc0c3NXVWQVhYamlvRjFQTkZHcnhSOENpNjZEMVFp?=
 =?utf-8?B?YmtVS2kveW5XL1BRdS81eDVrakh2VnU4aDgwMnVwYzdWQkNtd0s2dm9aRWJF?=
 =?utf-8?B?R1N1ZnU0dXlIbjhJMklyT3M3MWxCRXMySGJOcWNYL09WV09iQ2hld0ZTd2p1?=
 =?utf-8?B?RXdqcUw1b09HK1REeW51YTdPS1lKT0t3YmJyVDAyODdzcE9QUWJyek5xdXda?=
 =?utf-8?B?U2tsT0dDdUFBRkU0Wld5UnVaYk56SzVxZnBlWlRzWnRsdGJ6QUNDbVFjSWV4?=
 =?utf-8?B?amlyTWFnd0RUN012QzZTOG80L3Y2Ymx1UmlUMUREYzdEdHY0eU9UMklEK1ly?=
 =?utf-8?B?b0NEQzNJdEFLa0YyVXBTVVVmR2p1d0R6dWY3VlRyeTFPbzlKamhNSGc4SGFa?=
 =?utf-8?B?S2hEbkpKWmhhV2o3dFpUWHlROWo4S2lRaldFK043U00wcS9Cc1RRVzBrVUJp?=
 =?utf-8?B?eTJDZDJNMjNDSjQremNjYkYxSTN3NUsyUmduS0IyMHVHL3gxTW9zOWk5N0Yr?=
 =?utf-8?B?c1dKUGFJdFhjc01rVEhpejV3Y2RCbEN6K2J2dm1WbFhQcjJJZ2czNUtCbHl1?=
 =?utf-8?B?anEvQ3dSNFpuNWpmRjJKalkzakVQM09rLytVVURwa0swYWdBb3ZQRzA4d1dt?=
 =?utf-8?B?OWduQzNmTkhCKzJZcE9VaFVla2t2MjQ2RFBCOVUreWdtd2JJZlFaNDRkTkhW?=
 =?utf-8?B?WU1YdTd2S2d6VDdHbEduMXlaRDB2cHQrUWVvck5uTXBJRllYMW1DT001OGN4?=
 =?utf-8?B?cnJTNVpmR01WSHl0ZDBUUXkybFBuRVVndHd2L0NoZ3hOTnA4QkJJd1h2N3Vo?=
 =?utf-8?B?aUd2WGtpV0tQa1JxOEhMNmoxaUJNQVFKMGwvd0o4b1FmMEpuYVBQbXBnZmR5?=
 =?utf-8?B?VkRJR3llbXpBUjBJcnFiT2lZczRsSGY3ZzJ5MDNRNnlUb1lvUVFBL1Zjelpq?=
 =?utf-8?B?cGEyT2NTTEFJcmVuaWpuYXR2Q3pkbkRwcDhlTFVMMWlERTliUzBOM0c5Z3Jl?=
 =?utf-8?B?enpEUk9DZjRkaTRJcXhlVW1TaXZKbWVqdHV3QmQ5YWJUWFJ5RnV6RjY4WnNu?=
 =?utf-8?B?UkdHUGVVMC9tSmpkVlVnM09Zb3kzOExZbHIxR1RoVWh4Z29DOWVIMDFuTjVU?=
 =?utf-8?B?RGlkQmpBa3UyS2VYMFR2ajdnWldJcEdUR1pUVTkyaXhYeGpVaGJ4cVdUeHQ5?=
 =?utf-8?B?dmZYd3lKVFV5cTF2N1VnNzkzdXgwZmhaNDdGZldSQVdkb3VjbkVCbUt1NU9w?=
 =?utf-8?B?YnRSaVdldWU1b2t0eTJMQXVXcGZLWU81Q2xsMk9SOStGTTlOK2tqbnBoeEpN?=
 =?utf-8?B?bnFYeXpwazJNTFpuQStmOXB3MjRXL1FjTmJ1Mi9XaW5Sd1lOTXBCWm1ja2dV?=
 =?utf-8?B?YmFwc080OXNzZEJMWFZCNnBMQW1qa1JBa0hXTmU1dGR0RmtiRjc2YnpjdWVM?=
 =?utf-8?B?S1BBL1VQS3o5RkhBOFBDUHF0eUZVekk0akdEam1mNm5mdjYwZHZSVy9Yckla?=
 =?utf-8?B?ZTBRbjhLMFAzLzA3d1k5dFlZTGw2ZEZpQjJVVFE5dHNBU21KT0FhR3VSZGhm?=
 =?utf-8?B?bUdlRmFNVjdrWm9vbjY2eHdaeTVlbkxEOXp1ZFJ4dzY4ZjZWRzE3aW5TQkVl?=
 =?utf-8?B?VHZBMHc4OVI2UjVScEl6R3h6aU1mUStDZkMweFg5cm5DNkJ0cm1MT0N3TmNV?=
 =?utf-8?B?Y3pLaHJsZXQrM29RZjQxN2VlMldpWmZaWWZGNzZWekd6WlhWN092SGFLckpw?=
 =?utf-8?B?UTUzd1RzMjk3Vm1nMjFvZHVmdjFsYjVGbVVleEljeUZqQzNMaGpSdjl5REJj?=
 =?utf-8?B?Vm5OSzRzZGpuN2dsMjBQeTIzRDhNL2J3d1FEZ0JBcTRSYkFRZm9KL2gyY084?=
 =?utf-8?B?anRLSFNkRExwZVc1OE11RUFINnZNdFhaV0F0cTJGMkZpcWhXRnIrTVluMG5B?=
 =?utf-8?B?dDVRY1pidEFZT1RRK0NsWFNEZlpPWFQyaFZNanlNRVJ3a0QrOWNwdGoyc3Ew?=
 =?utf-8?B?ejNtNEVWUnVNZDdvKzc1N290czFpQTJnNkRESWt2TVBLbUN5T0RBQnV5TGxC?=
 =?utf-8?B?VWM0RG9Gb3BxL3J5ODgxOTRpamlJY21mM1Ayczd0U3oyckY5QTRHa2hVd2hx?=
 =?utf-8?B?QUpQS0VhVmFxdDdqM2Z0RFErb2I4OUt1ZUQrV25XR0RlbjVvODhkNERJYjR1?=
 =?utf-8?B?V2RzVUxhdjV5SXA4QS9VdmUrL3NTT0xIWU9LZjBZYTJPV3E0blE4NDRuT2Zx?=
 =?utf-8?Q?LNgS9wR1AH42s5kE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818a98e2-22a3-4a4a-8e23-08dec19f7094
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:39:26.8698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYEpLbqhxiL70257+CKkyWz4k64uWoFfxYbG2PcqnGS3i0MiRF8fzt+YNTUpBE6D1zGIf83EBy5hwpK2Aigte+/MwKsj/GHl1BHzOnXtfP07ZZ/3wOH2abYJU2bPbwtP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898

From: Frank Li <Frank.Li@nxp.com>


On Wed, 03 Jun 2026 08:15:01 +0200, Florijan Plohl wrote:
> Add overlay for the PHYTEC Audio/Video adapter module PEB-AV-18 on
> phyBOARD-Segin-i.MX91/93 boards. The supported AC220 display is
> Powertip PH800480T032-ZHC19 panel with a backlight and Ilitek
> touch-screen controller.

Applied, thanks!

[1/1] arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18 overlays
      commit: c4e7ef2dc9cb05876d86bd6ca73a0ef981fa5b26

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
