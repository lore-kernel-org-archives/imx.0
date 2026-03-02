Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D126ED35
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470607; cv=fail; b=Gnul2/coRXKB90bb8A5Qqm6J79+O4nW8phjUE7DWZbkXRzWZ2/m9mQtK9Xz/ajp3jqIkX+czCUGr1pLKKVnqg2EEx1gn1D8cyHQX8NWfh3IaCe7DXE94MAsgm9hTrUOjcg1oNtbkF5zmpoZVli448HuwwEwiL/tOY37Q4J1fYhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470607; c=relaxed/simple;
	bh=pzh6r9IrtyZ2fgAljL06bnY59z2JyzKaSNjHE7PyblM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=cVF9m0evJlVYAHRFRXyndC1VnoisWIgVqotaFmzm34MI1sppmVt7K5JWgNKD/UV0lhgKelZmq0X8o5dKiIlRrc2cvvWOMjmA0HV7AXn7QWgtKvBgtMvvfeBw4jes+CfDUDclVCs1E1NkeHEp6hEQfx7ekgLmpxCeJ5gTm7mzv7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jvBmZufW; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jvBmZufW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjHbzGAxP/bBReKPPK3gwBbh9fpSPudj4g0nhqSyrzEbyKPfvITF6qv+lWBhmcQdFxe5V1kvtcBl6gBtF/Yol53bHj6q5uZenLl0rTUKkoOn53nr8xu3fh67iFu9FZ/U4Qwb6H3s4TulaF1LHyDWH7xSUHXZAl1maiQFbFuPwaQcJtgTPEc0sVzAE4TzjQ3jkKwlhLobQx6q83IA6kysra1A9l0M1GBMaLmIRwC4zDT8EGmQq7zTGwvIyHAokaOb8drxRFD6n4+KtLZFiSClpDSWeG5OengJG9810Ty7Qj4vK3mZX8tYFW84HGapJYAfVOKMVL0MTGqtLcQdg0MRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89n6K+28iFvYKD/NXD6f6Ndh6GZfY6e5bnIS6C9OjdA=;
 b=BlL/HV9CO0KeFkaSIKI79NXUwyHlkCVQYSE8ZFILHwi+hSdMDuJ3T6IbvKCcFaV9bw3pqWGzDk0bs5KwoCl7+RpewCjJo/n1BrmZ7mG1vHZ5hTK0MmsBwuKdKaGbCDfyNEG+se8Xfz88y2WrRDzIFwgpCF772jj3OV3u4EAA3mH5uOKblAgy65SzW3nXMeQpjSutyvSlvkNYKJZqT+pbR2X70C2bdoYfBe5GZDrhkuMSaZcM4f+Lv/r1TIdLw5lH83TQRslOtAg97vs4ZjwDn8iGhTZTuVrMS18+bBgWRqqVaH4wexDGAbwquxdtpSH3IURRban6rfvBlORCgPy31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89n6K+28iFvYKD/NXD6f6Ndh6GZfY6e5bnIS6C9OjdA=;
 b=jvBmZufWSqDCFulh4roGN0JD+JlnWR+0nnMAORUOJvmtjiHop89WkUEpVWOasWGmxqyRo3qLCyza7vnsnsF5SJVbqjxl6xCTz9XE8fTx0CTOJk/E+aYfUP1A3l+VvlTzstA7QX39NnckiJrt9+8lAcX20+IO6MeZcl5haBYlduKfUYhXDIwztYObwsOaZ642lCdTnNiHUFIZ7OQza2yxLwTRfF0YrKjRMNnzGfn9kBSEkWbPCAHglWqKB2XIob1B/wwo6lH3+bNe3fMTcPbo1EAJpv4N3ysOerporWLS7QOHy2uf+PzyQJZece1NCboMY+r49ln3jU72TRxKPLRnQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB9954.eurprd04.prod.outlook.com (2603:10a6:800:1d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 16:56:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:56:43 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Maud Spierings <maudspierings@gocontroll.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
References: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
Subject: Re: (subset) [PATCH v8 0/5] arm64: dts: freescale: add support for
 the GOcontroll Moduline IV/Mini
Message-Id: <177247059953.2123846.1132263201216944355.b4-ty@nxp.com>
Date: Mon, 02 Mar 2026 11:56:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH7P220CA0070.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b299cd-96ad-407b-96fd-08de787cae3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	LuU2M6GEA1I4FpapV2ckVIE7ZBhfiEjLDRrfBC0j4qOb/dWhV2urBSbxkArYAD2xIQC/n3ewMPIW08Udt1IPEFq4uFeTXbVT6KKDyjaL3M2kR8P4jS0MM8PGCcvLMtS6s40R/Tj/4ei2nm3DmS0Wv9s3aRPEyS6lqzXrLpW3t1VDTrba0SzbHaBjjB8X/IK3weRq9MMI3j8g1C7d1N+owtS8DITf5KRxFSLzgdM/G+zr8d4KOftiEgDRdNI9l4Um/+qCepfMdYIXch8rFuRjmoJFnXnfj3KU3piiInZCVPMTdUFn68scMGD68ghRxb3xWFkHODoqFgVURZCOez2LfTghy2nmBtbpRMfyA4R9nn2n/frCFOb1IVzdvTFWVtFyrGG6nN/GLGemsxjqtBQ2ugI4s9K2c3HA0aZ2x+26t2uGx0IKcSmh2ILCrqbwDjCJwZCLFcdkSWAPRXz7Xyco+V/vruTjxTMRte0Kl7zpEq44CBruFLllrjRCy/fGpRAnx7zThE5pNeS/1cLzhvB9iNzItJGSTtLJVgM6L0lub4LsFqNdnguJxtI9miGDAZ5bLtWj3/exax9F8ZldzB5QxghbCVWCsgDkW8IQsy5dKyDiQ6b3Vqqj1kfMZVenAX+mV+a1htqyEXsKlqVq0c1vR9iOk22y+3rtkydKIGA3mHwkPG9psZ/7+KCcD4Vt1mC5h0vWGtf/560vboVMnxxifi8WQUQznyYrPyibm4bZrPITA0zthwbtN9yopmbShQbJMKml8PUBvi+p7yJMXCi0KedFrsx5aS9qDE1zfJJxGi+YCQC4mCwi+uihYkSlDx+I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXlqMFVnSTl0MU9KeVQ3M0dYRzZFNk1aMWkzZk5xRllYcytwUkg5NTZEQ0h2?=
 =?utf-8?B?RGhLL2haT3J4dG5acTJvQkhoOXdKNDYveVlTdFFWZUV1OUxnRzRPbzZvTllw?=
 =?utf-8?B?M1lTNWJaV3BCWmpJNldhWHpLcnVSdHpIY05CMjhMck9VUCtBcXI1ODhoZzNP?=
 =?utf-8?B?NzVQNHhZVUsxMEpNRmRLWW41dnBGUlRGZzViMTY4RHpZTFhISkJXWXRaWG1U?=
 =?utf-8?B?K1R0UE16alRKbTZTKzlQUVlkVVg0NDJ0ZTFjM0JkdGlrbzNqdjJQejBPbTN2?=
 =?utf-8?B?a1FMVjVVZkVNVTRWdmIydjlic2hHdDFBVzRRcXAxNFdVWkV4dW1kZ0dqSUVi?=
 =?utf-8?B?SVkwM1R4Yjc0VVMrZ2ovT3JveDNsd3R1UVVaaHU0YTVxNk1yWGtqNWFNVVFD?=
 =?utf-8?B?bzg2S293VytKL0h2TTZjNjlsOVYrNzZ3b0V0dkZFMDdZVzUwckJKdjJqb1M2?=
 =?utf-8?B?eWU0RjZ3VEhKcXBVV1BGbWhVR1ZyL3RLL0I5K1I3NlYya2VZcU5tdVhudStE?=
 =?utf-8?B?TXgyZ0wzaGw2dnRIMFFOanRacU5wY1BGUG02dUVMNTJtMWlGZDduS2JWaWh6?=
 =?utf-8?B?TVNjVG1KWElaZldYRFAvSFdzM0dpZnE3ZzYrTVI0bkVrOS82dWw1bmhRTTVR?=
 =?utf-8?B?QnYzTWFRSkFzWFVHcmJ2eHlhcVAyaWxWZ1psem51Qm84YjFWblF2SkhobUtM?=
 =?utf-8?B?TmVMZ1Q4bTYreHZQTFhHaTU3YTBVeWs3YUI3TEk5ZlErbDhqb3pkcmxmMmFa?=
 =?utf-8?B?YW5NcWQyZFF4OW13NWlxeWFjYlFZcXBpeVJVckJ6dGN2YjBzV28xTEdNRjh0?=
 =?utf-8?B?NGdWSEJmaEJGRDR5Vm8zbHcwYTU5ZVNpUXk0UFBTY3VKNmdud2g1MXZweVBE?=
 =?utf-8?B?T0RFMnovdmVFczI2QnhmWTdUd3lkZWtsa3lhTy9saVNBMER6NVllU3k1WXhk?=
 =?utf-8?B?K2JHZE15Sm80eHZjSlV1akU1bDRLNmdreTRyT0RWKzlPLzJFOTJHZHozaWdQ?=
 =?utf-8?B?NHRLOFRUU253aFFXZFZheTJ6QnFOUE1VOTlhNzhMTkMzRHo0T0g2VWF5V2wv?=
 =?utf-8?B?ZFNiOVRpTHJJeUxaNXRoMDRGaklvdnh5OWkxL3dwcEZVOFBxQjJENXFkL0hn?=
 =?utf-8?B?WWlKMjFOaXlYZis1MVZIK3VkcGxkK3JsQVZaZGMwQ3FHVnhjMHpIMkJQT3E4?=
 =?utf-8?B?Q01QY0xpZWJ2dVh5V1FPQkVYbnNqUXRoTzVlWHo5WlpXZlFBdHUxNFRsZUhN?=
 =?utf-8?B?M29rTGZ0aXZTVm1EZm0vMmtnK213WDUzWWJxZ2NCODRFc1lqcUlsSE5zcTkz?=
 =?utf-8?B?bFMyM0Rxais1UzJNaURYV3pVY1NXRTRQamVMSjF0azZuSXhQK0lHUFVObWZT?=
 =?utf-8?B?RjJVVEZ3eUdzTUIxTkE4d0xkZzVjYUVVME9pUnlzRzQreStMY0VZTGFSelhw?=
 =?utf-8?B?YnJmWmRlUjY0clAwbHdBZVhxcHA5a0JiQ0dhZ2tJR29hL215emVHQVlUMjBM?=
 =?utf-8?B?RVRSZGZvZlpZeHlHYjRMNnpURjgvbTlEUDRqQmxFb1phUjZLRHVQNzl1TGZn?=
 =?utf-8?B?Y1E5QXBKSURXY3pTNmdYWnRSNXZxRW9pcFprNlNGMlZGSTh1TitUZjZsY0sr?=
 =?utf-8?B?MHpVYmVPd2VYVElkQjNMR1dxQjBDOVYxZS9QRnNKVXNiMitpRWh6cCt2cHFi?=
 =?utf-8?B?aVBMR3BaU3FVUTFLT1U2QkJZUDBWamtSRkszbXlqdEc2T1NpNWQwcHVzdXpv?=
 =?utf-8?B?VWlmR0lYUFZwYlhpb0lQeUZaeHNvbGJlaThyVWhLcFhxdGJYSllMVzNzajBp?=
 =?utf-8?B?S0xlbjdsU1JJTVhzMWVSL2lKSkhNdGIrY1BOZDMrMldZazF3VFQ1S2dxcDZz?=
 =?utf-8?B?UHM2cTA4VWs4eVMwSXdzQ3JEelh4cVdId0tIeHpoT1dHcTlCSmE1d3NpdmV2?=
 =?utf-8?B?a1BxaXI5TStjeDhFQUNFRVhuMjNTenFPMytLcCtPZXBuaVRMSjhpZkYycmds?=
 =?utf-8?B?WUJlYXh1OE5EMzR2REFhUkI0Q3owSDlURTJrK2Y1OUhzbHlFRzFXaUlpdzlM?=
 =?utf-8?B?dnZXaWtoZUZkRTV5cHVHTTAyUDVkK0NwbU5leVZwOHJoWUFIVVBzOVFSN2dG?=
 =?utf-8?B?OGJhNTkrdy94SWxvZXJlWjZrSXF6Ly95V1I5WWFJMVRSUUdmNHpxZ1JaU2pL?=
 =?utf-8?B?NlBWSDlnOHlydG9pSmlWdnhHZExwQzBUYWxKRmlpUUNRTndsaisxc0gzb2VN?=
 =?utf-8?B?QlNtbEQxT2pBSWk0YWRaMmVGbTNqWTk3WkNwYVFzSjNsclVacDZ3OU1wY1h0?=
 =?utf-8?Q?R6E+7/jXlMpaIhkpFo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b299cd-96ad-407b-96fd-08de787cae3b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:56:42.9186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Yoj9qPzUOdOtSQ4qmUfIdBIIhH6GTd4/0D4ou3ckpvYlLWoYSNGz7umd6TPgW3fV8gyCE3sN0aH7hMJgTOm6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9954


On Mon, 16 Feb 2026 14:07:07 +0100, Maud Spierings wrote:
> Add initial support for the Moduline IV and Moduline Mini embedded
> controllers.
> 
> These systems are powered by the Ka-Ro Electronics tx8m-1610 COM, which
> features an imx8mm SoC.
> 
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: imx8mm: Add pinctrl config definitions
      (no commit info)
[3/5] arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
      (no commit info)
[4/5] arm64: dts: freescale: Add the GOcontroll Moduline IV
      (no commit info)
[5/5] arm64: dts: freescale: Add the GOcontroll Moduline Mini
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

