Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119F4BCAA5
	for <imx@lists.linux.dev>; Tue,  5 May 2026 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008499; cv=fail; b=rT4INr4zcmnC6soqrv5jCBIyByUjYZ95aYZUJGohPoN4pzZfaf6vZ4iTTp+Ro5PxalgwAc6+sPkQL3/+igocZdpHHT8xhNFieNEsi/2DjT/+AlIKrx1yjO4AzUKysde78YaFWbgTaeSySYPnJNE7n0/LdxH9cZtbMo6ArSLom7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008499; c=relaxed/simple;
	bh=z17rLUY5/tKLve3o1a39Yjr+iYnta1FF/+OY7OIGWMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=OI8+ZQjAfO6pb9QqbXc9GtguQWat17+R7mlpO3FwXXsYJvGcclSzfGcpkD6mfVV1HGIcOmPxEqWb5t26iCsH9lju5EW7UfeGFUHPAlxZncaHIOCQ6gP6mB0MwVYg4Tc8esrHFzerfGbie7paH/kl6qG3OJRzWUnL8TpLBs1MSWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f3zJjHFG; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f3zJjHFG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfMvL2I9kSN9BSiIT2F9XlLdfzyrBkIgnIQnqzL0Bd6fNxxeS9rfIL7TtGwme3UnajrZcJxR2OKWxF23mJVrO3g/EnYQdH2S2c9l8/NFiHt107FrzyfSuloDZQrUt/1ABuqz9wbefUFjSZz+IU44wcyx7qKLXZx5hexggMuQqLb5abOYlZjxjC3lmEin+cmtqU/wwU15kTsHjtONvyE2h/SNcGhZynPkMOs4DlTS+HCSSt0XEGea9Y/JkTueUm7Vr3DTWXyvRXdPjjtGLuPaVjzUK37yhUL/k37RqnorukSEvE3BivD2H7+oeMwbCwrGv0n1fmf3wejDUMqTlg+nbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UD+AmgyIAiIugKqVgqbODVIlTaiN9J4VMf7RWdiEoqQ=;
 b=d50UbYtkz1OKtW2cKJ3taiKEGVnj/J0oB8x2eicuogAYYWS5LLH5MlXTqo8pue/RXy1j2CYm/JzZNDVL8VX17F3hQkSX0IEcxIAuiyHeWvLoSIeSpU6O7/NG5UB9B0kAGYxSjyEEmXsbgxBbgSg3JoOLPlECTdvTYRjp+2jYtmklqaDHTve9CVbKz1BmF0nmgSV87hKDSGJEJookPugH7JPRGjK9wI8nQCgj5E4gropqK3GPkMoz7GiQUiJm+dqcNP75uKzNJVGuxhlhB65WFB0c2KdsbzKjiRxjmE3aMrlhvYzAORa4OEmuljx3DITDuGCX41Pf78IPagP1TAwWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UD+AmgyIAiIugKqVgqbODVIlTaiN9J4VMf7RWdiEoqQ=;
 b=f3zJjHFGRc5WB/KxdrZTdcKFz88z2TalUTGnZBFndeGRastBcbYP0WipjWwEv1z7Nrh5gsfNq1pQXRSHiZF5HcBQqVseSQoKBh0UsL3GDLW/JpSEdi2hPTcF6MqAMksuJpYfg74IFJbNSHGZ6Crg5OaHzuFj1eAQx0n8xZ+Z9OlO6BH2vJfzymQ3x3dW1xT6P4vrIYvaCdrXX+aWA9JRqWaMSOH2WEHF93FbjjBJlziM/Q5V66ILNXRUBX4A7J0tqLKyz+LEHfdQqa9x9fFW5wfrvtIfpjXot28Q1O/eQ4LQ0djJ9l4i+n+WWMdKxYkl7F5chDrAhcg/TC408Y4QWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7663.eurprd04.prod.outlook.com (2603:10a6:102:e9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 19:14:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:14:55 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Franz Schnyder <fra.schnyder@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>
In-Reply-To: <20260326143711.143462-1-fra.schnyder@gmail.com>
References: <20260326143711.143462-1-fra.schnyder@gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: freescale: imx95-toradex-smarc: Add
 Bluetooth and SER2
Message-Id: <177800849297.1916431.6565461948973179066.b4-ty@nxp.com>
Date: Tue, 05 May 2026 15:14:52 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA0PR11CA0183.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 22823bde-c62b-4576-5009-08deaada9765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BHz5/EhFEKCkbzxzQ3OGVT5DlH6/lI7hps6pFoZH/tUt7fD0B2LeOen/1r/KHIVqU86OOexrFvhK8zP4JvepNO3RmPAfxKHQzI6fTvGuaT2q/NRhWDIknGKbBC5JpL8gKOPB+Hs7paskUmD9u8rGByI9qAtkg7fhnVpApbNMfQp8nrl7TA3nrp7CCHdZnFtiFMMIvdPJvg8PSvhZViO/EjJi7DMKbeMPAFpA/v2UWwUTBlpcEeIRVlOEfKHVnuOcthaFFz0OQZb6w1ZnIqOzLuXiE0Dg1DIO8ZGGzNDMvkqQ/TbLyfHLvUDA4at+g3pSxohFjALfZQNZ7G3+wcNP+kW8jSx7Taz5mzLd2mINx8wlj6uecsx5UO3D6uZ1Bdnlb772Cj+/21JU6nxAoUJSbtCJsrzYN392r9/eiqZ9KxWbBGwsmCRF2pkcDTQkPs9pDnn+GYLaGvv6JG8VE2RBhpQ6cJcwP/YPpW6yULo+ZaEg0Vw86AiWdGG6aFkeI9vOTZVZT4tLrhg87TObmIUCwD9QBW1V2mMCIgcORplAjkPRSnbc/K7Jozzxcm1FrIK5bVNIWu1suYk0XVp/c1hhGG4VbWp0XjSzGwrxydm2iiPQ6SBisYLtQ0CoCQ9i4nTLO08eWr6mVelQZiXchEOcqPkpZ5Vb5nZhpM63ekk/LlEaJv2+ZVymV0XjmpLWXDQ9XpHorFrPoW6Pdh28bXnu1o5WN/bcvAAxLxvknWeRryObptGrn7QkLJpeQ4o9jPE3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDdiclBGd0J3cjNnNFJiR1hxdmRMUFhhbEdHZzVibVRKeUN4dXB4L0xROUFm?=
 =?utf-8?B?TGFtU3JJNDJ1aTBGSVBPdUszOVc4ZEhMcG9YclZ3aE5YSHpVdWpxSi9kenJ1?=
 =?utf-8?B?N096ZU52RlZ0QzBDeWZuZmZIVDJRNWlLQWdlZ2kwcGMrVFMwWjJ4dVZSYTRp?=
 =?utf-8?B?d1NsNnBaNEhQM25sU25VRGh0STlZL3M2U2NiWjlNelVzUTdmMk1EVkVCcFV4?=
 =?utf-8?B?dlM5RnEzcnRHdkdEK3U5T2FhY2MyUE5hTU4vQ001SmxYQitlRjgvN2ZicWZO?=
 =?utf-8?B?Z2N2aVNQeDdhS1hpY3k3MHNuNjdTVzAzMkRMU0tsZjZzazJQcFI4bFZORGhP?=
 =?utf-8?B?SENFVDJrYkZaQXdBdHlRM01LdDhGa3Fmd1lnRDB6UE4xQjdRUFBTTWdTYlln?=
 =?utf-8?B?S0l5R3FWMVUwLzlERVh1cTl3SUdIa3ppVWt0b0w5RVpHQlBkVTduSmxDUzRJ?=
 =?utf-8?B?WmZDdUpPRGp4MTkwWFkwMVByMmoxUGhDVW1oZUdaaXo3ZE85Sy9yaVZ2Rm5h?=
 =?utf-8?B?NnpOT0VtTnFJNmZVNnhlSngzejNrRnJhZTM1eUx2bDRGM0U4UTBmYWFmNWZn?=
 =?utf-8?B?b3BNdnY0VUdEeTY3dWd6UUMyc1E4OVBEcnhpZklFekt3YWRqSlRVUXVsYnFo?=
 =?utf-8?B?VmE1UjZOR2c3UkQ1dW05Y0FacjZSYjIvN01zKzlzSExPajhwZDBxUEZCRnUx?=
 =?utf-8?B?eFdjODExMFRRM3QrLzkxcndtKzM1RUExS1JQL2hWOUdoeG5FV3JOVTFyZ2Rx?=
 =?utf-8?B?WTgxY24weklIYmVWSm5VZzZwajVnelVxdzRYNGV1bmE3R1B2MkVxcGN3eitE?=
 =?utf-8?B?SDJ5U003dE5vZjZSNnNaZy9ma1BwTFJ3Q1BFYmFwU3dFeTB1TDFsWThNd3l6?=
 =?utf-8?B?ZHdsWUF3ajhsQ0pKeUlLcjhOblZ2RXNteHpjelZETUltbUxvaDlsckpScUM0?=
 =?utf-8?B?VzdibUhBUW1vMnY1UkRJSGhialJsTHBVSVR6d1ArQkptbG5tdGEwVFZUdjVU?=
 =?utf-8?B?OUkvQzJhQTN0Vm5MTjh5UC9mM09TQ0JGQkxvY2tPZERTY0d4bWFITExOcXpO?=
 =?utf-8?B?aXp2d0poWUlndTk3UnQvYTdJNHJ1ZWF3UitzY0FDTWJRZE85Rm1LZW9zM01F?=
 =?utf-8?B?VjNQNk1CNDMydmZINUpjZUk0ZXhDZXdRTmhOdTl4TUw4YWM5aEhEY3BUYzN6?=
 =?utf-8?B?TmZXRS9SWHIySXBhY0FHNCtMTERlN0FsQXJhSGNRdlJncmd4SnV0VFdPa3Bm?=
 =?utf-8?B?bFgwWE9QaHB2OS9FODFCdHFyQ1psbkxRaEFQTGVWd3RPUXBGSUFMS3M2WUZ6?=
 =?utf-8?B?ZFgyYjZHd1Y3My8zMG5VMEo2eXVPaEl5K01leGJTZGNBMXNOUjZ6NC9HZUVW?=
 =?utf-8?B?b0IwZEgwUWVWV0J5eWh5Y0RBckQwL0ZWM1BndVgrVDV2MkJFcytpQk50MlJu?=
 =?utf-8?B?MDFZbmowM3QyWjVNVktsMmo3aEZiTnMwdlZsblN5TEF5dkptMUdabjZuOWY2?=
 =?utf-8?B?a3V4NGhhczVxL3Bsc0p6ei9mQ2ZIY1NwdmdNa096QUZzaU53d3JOM3R3Nmw4?=
 =?utf-8?B?c2FzRmJtd3pFaENNZzYrTjdoY0ZsQWVvb21JL0Z3TTBuSmdYNjJyaC9TWTNW?=
 =?utf-8?B?eVByMEU0MjRYUDlnSERCS0J4WnNkVDdsdzB2cndqZnh0STZUbFRJQ3JWY1h0?=
 =?utf-8?B?amgyV0FDczhOL1p3a2RXMmhCSE44NkN3RzQvZERsb21ZVVB6eUZIek1mWEFm?=
 =?utf-8?B?QXZJYnArb2NZbjdzNkxQWXB0R2pscGsyQm92bEQ1M0d4VFJlUXVqeE80RWQz?=
 =?utf-8?B?ZjcxYmlmTTBrcERQNHVQWGd4a1J4WmdCUWxmSTJlU05tQ1QyV1pUNVRzaUtC?=
 =?utf-8?B?Q0xqS0dUQ2l0WlcrUXB2b0l4Y3RrQ0RBRURsU2pwR2l3R1kzL2FSbTVDQk5P?=
 =?utf-8?B?UVBjZnh0a0VGYURaYWRheXRZRDliQ2k5czlwZFVGeFdPVDRmZzdoS0JUT1VB?=
 =?utf-8?B?cmpDb2g3cnUzN05XbzBjU0pSTkRDeDN6QldXeXEveUlTcG5IUDNuM1AwR0tq?=
 =?utf-8?B?aVRMdkRhQVhYNndvTVFZYTZGS0NTTTJ4RFZwT3BYUVFlZk5MOFVUMEhIOUZC?=
 =?utf-8?B?eEVmOTVUb1JBcGozRUdjN2tWWWhLV2RaYzRDU1YzQUJvWE1tRXYrNm1JcnBF?=
 =?utf-8?B?UEhZazdQU1U3bXI5b1VBamM2WUdGN240Qzh1UlA5NmdzblpKSWo4V2U2NENG?=
 =?utf-8?B?UU1rcFptVzQwNXVPSzFxT1JLZ2VIeVhMWWFRdTRQZDFUVm9xWjRjYmZ2ejBE?=
 =?utf-8?Q?9EzxZsd6lvjI3K3CpU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22823bde-c62b-4576-5009-08deaada9765
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:14:55.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J98YV18kg96dKGBeC1MXDZSG7RFCsRI0XLsQFlF2Xjm/UnlxrWfoRO9f8NB6jzfWAg8JnP0XtW2lE9hn5KXVhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7663


On Thu, 26 Mar 2026 15:37:03 +0100, Franz Schnyder wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
> 
> This patch series adds support for missing interfaces on the Toradex
> SMARC i.MX95 SoM.
> 
> It adds:
> - SER2 interface
> - UART interface for Bluetooth
> - WIFI_UART_EN as a gpio-hog to select the UART function by default,
>   as the MAYA-W260 UART signals are shared with the JTAG.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
      commit: e11598cbbb4ad9fbc7d355d0ecc4c44e05ac3a77
[2/3] arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5
      commit: 104a391bb6ff4cbb2bc0fafd34bc1bc06150f355
[3/3] arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN
      commit: a05af625aa2c8e3f837c393df8abe11a6b84078d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

