Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565633D9DAA
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 21:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787694491; cv=fail; b=fftpZ7Wz4b53ZziTTxQ3RtBWA5M+crgbV2B5ojpoHR+/6tSMRlfH8NQIqhEUHgO+nbpYNS9j1sZn2upCm+7IuqAJ2WnAciY8yZHl6WmPX88Eh5r6Bbp0zDDCtowC+pAAqTy6rOWx4bwcTqncXbDO3wwRi8ZlszSSZD7yjkYG8+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787694491; c=relaxed/simple;
	bh=2Vl0UfW1Tfg0OfoiL6AAFhrPxW6yR9y3ON5O2Q1IV5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jRTJ/0dsV/9kHxBtQms75Lu5FrPpK4sBlnutG6UAyAZdntS/5/+Oa+xzoEP0DrY8L+h5hQ6Kl+X8cQGkl6ZBchYxol//o0VTItJV/NljTocq2nsGfBr4weXMtCUNPhhDRxgXlulL7Kpas/UgxRqO29WRHr5AXDS2yZVczXGrAPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BYAHyJ0J; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BYAHyJ0J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUfxIlXqKFmMVXlQT46d5oiMivEibQG8ZDzp8s7Ey0oO31FbE5iu1DMAFrRm1qBdzMiTmtoGHpUJUGnj49A3yBHHX77gs/CLrkC9dweZbaFE2E7XWPub2bjRdGnZ/9slTZYM0IXLdidb3lEegjhAn6H/8neWjQScoFqdu8DTG054QdZZjqco9Aa1ubxEmFWdm0OMBfMa5wZsbFCjJG/xOEcKP3LbCaAAmdaJzh2p2KEgGXNtXoFdLQXH8UknZA3tvCSNGTIta9qb5XizK4j4T520FkXPktC4tYeyXi+zYPnHM2K+4VAxLS75sfjj13/7q039N0my6TaEWf8ofnFlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+UKXjjkKQ2Qy0tr88vRy+xLcbi+a9Q+HlHthxd1wvw=;
 b=MHZzLlunRBQ86Hkvf1ue8x6DKi8Y7vFJ46IQaed49nZsJFbGQV0Com2RFLMZd56tj6Zm1LXtiVSrVmF2tdsfqIeGpGKzETQ+Qr5/DIgQnVnnadsK8PbvkmzHZZKcS9hUuTwYwRLVdD7AxW5T3wxc2J1rGtTW3rw/lxXD89Ypn0lIF10G9yejFeNJJUIq2fstIH62J/NMkyHrB8X97oa8QpWW9BDNbliTpo+8IHsDENtSoDmu2WkyahJKOaYe6V0NznDPPyKv3Timp4F6JyGuK3nf2JrhXBd3HL3Eg8NCt1n4i2yFZEoqToE0iTGqXuRJHZdJSBPgnfUFisB/Zh0Fbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+UKXjjkKQ2Qy0tr88vRy+xLcbi+a9Q+HlHthxd1wvw=;
 b=BYAHyJ0JYStXQDT44qk1+kzthXg1dacO1JNvANHjCptWjapwo6UfaeK1utWI3YD5sc74jX0lXr2YYFUmklkKMeUtTCWGpSyW4rabrfVUpOWiidwJFBiqYvemQImhaIoqTrVEzp0QfU4n2JrsajjZA/1mjawNdtJfGCixeqMBDLaLAK2Rc0D3ZKgh5tB+0QrPdRC6uMKZCjcdPevikyZLqb3YcnhoLwtKFcG7DO27e/BZUliU7dyKqY0YMSp4llGQpzD2B6uhKBioz6mVyluN3VxCAh24lzIP+tJ2JNrhxvzTG7OVcgTvqPLH3tCI84F7RqNHVsbKkvjwacylJS8Tqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8909.eurprd04.prod.outlook.com (2603:10a6:102:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 21:48:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 21:48:04 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joseph Guo <qijian.guo@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	qijian.guo@oss.nxp.com
Subject: Re: [PATCH] arm64: dts: imx95-15x15-frdm: add boot phase properties
Date: Tue, 25 Aug 2026 17:47:56 -0400
Message-ID: <178769445101.2278425.1121707999885378274.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814-bootph-frdm-imx95-v1-1-c0e3f1b9d2ed@nxp.com>
References: <20260814-bootph-frdm-imx95-v1-1-c0e3f1b9d2ed@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a313d20-7d04-4097-5adc-08df02f28a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	eW5vXfE8n3lUu84TgHdzSUhEc0qejLzLh9kgwc8OTAiLx/dNOY76TJvYyObkIIEhB/UP5R96/iYlDHdyZFrJv9oCfSjYPX8CDVpw8adbSeii2V6Gxu1vB28WNlW2gbHmajGtBEFtS1g1Q5w6uThBtujS4Ft6kou7a3Pm4OuUiSNmtsLj1NjIk5VWGGEkwj2FKSZHBP9YCwASqMV9YfyAfJNXdjJ+kMwaKKC1ltkyoN30bDrVxKDjVC5TA/6jwm9+efCnZzZlo8i0vBTBUPONe4TBpdECAjtygFyiDxhdglhZXa/JK7amFDJWAzdvqQJbdq8jxbSYyP0gwtLTnON0b5L3okzPP+QK1ksp4+ex9oFc15EYKnKO6F5je6NYXxmS1xT2kgGFsYEPgjAVLAARpBabDOuy+u9hec2VNXbhDq/ExNsOggknOiyzk60qblSWEEg6nXBbM1fuJE8xGbC/t+Fio38wA5Bzvwie5Wa4japHynUrU1WXz3QYBPx6c2cDik+56sleSK38EOxkBajariywJJ5uPk9u580WPESL8zI/eVqPKT0IYkB3tutftdWdYO+q/EGqinGU4gWbzQ1gneqyL8JFOZ0DWKub39mjW3zNbWj2XBiOkLkqDRD77TBCE//oFuWKB0urBlYHCHIQ18eGzDNvWt0jt8OfEBiQuVI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVR3YXNpOU9VbUM3TUNhRnQyNi9yUnNZL0tOV0NWUWdUZEd6eGZOT1lqNzRS?=
 =?utf-8?B?UXBpSDd3cW9ZNkI3Y1Zmb2pxQTYzY3BmVGMzcythN3JZK250c2U3VUd3SEY4?=
 =?utf-8?B?Tk1tK0xRNk93b0JkVzJTWmFYVWFQSXhRYjlpd1hpSGM0a2pDT3V3L0tPUjhE?=
 =?utf-8?B?YzNCV2JmNEc3SDJocFBTSEo1REJMWGFsQW1vcmZRY2UyN1cvRUNhZjRUT3Fi?=
 =?utf-8?B?b1Z6cnBlZzA1MGpheXJsSVZKUTZsM25lUlR0NjFqaVpsaUkyNUZWTi9qWjB3?=
 =?utf-8?B?TTBaaHZVbkJGOGllb2J0cDJJUFNUSUxlalFnWDFsRjk5b09QV1VrTjI0b3NB?=
 =?utf-8?B?dDVGVERvd1ZXTytxUHc3TTlMdGZMemE5SUZ5RSswSE83d2pVdXFMazFyUTdW?=
 =?utf-8?B?M242WkRFV1BIajFaNjl4dVBZTWJyQXd4RXp4aEcxVDVYZ2RtY01ZaGRMVDJZ?=
 =?utf-8?B?WFM0ZXRTNThrNVE2Wnh4dVgzOWZPaUE3WEpTYnJNbG1wTXh5NThBRXcxMlZV?=
 =?utf-8?B?ZThTWVdxRHlORWJUOVdPZlJvVjVxT1ZGRTRGRXJyWE42K2JNU3FUSUlUQjZl?=
 =?utf-8?B?MldJd2t1RWZRdmQyZllzazNJT1BNMUFlV2c4aThrM29rQnRrN0lmSjJGbHdt?=
 =?utf-8?B?MHkwRDZxcjhmYWVyb2FpWVZkMm43aURBSktkQWtDOTJUSjZVakUvRGVSaG9Z?=
 =?utf-8?B?ZXdHYVY1eG1rNE9iQUVDcjJIYnZQd0hWQ0Z0MmhLNmI0eHRiUjVDSHhFMitj?=
 =?utf-8?B?cENRTnBKbmloLzBGUUJjdXc5UGphYWdwWXJ0bUtSL2E1aldzdU5UVlc1WkJT?=
 =?utf-8?B?WUZlMFZSbWZhYVBqM2cwZGhuSmhGZGZZUWhQU2RxWHAzWmNSbVlNb3JEaXlz?=
 =?utf-8?B?alZUeFdpaEd1VUh0Q1RjVzUwREU1SG4rN2E2aUlmcFNUTlJvaUdyOEVHd2E3?=
 =?utf-8?B?Z0wvVEN5aE00b3cwbmpLaWdmeTNwNXZhNjBIVng3Qk1tMmdhQjRHNUd5SUY3?=
 =?utf-8?B?U0xzbHdrUER0KzlSbHQ0KzU0djBXdUNja1BTb2ViOHBMcjJXNWpja21GUThU?=
 =?utf-8?B?T0VQeW5DSlRFaWVJd1puRm1QeTViSzc4alliSlFEWjhnWVJaTERtYWtwbzRt?=
 =?utf-8?B?eS9wd0RuM1NrZ2V5TFgvVFBTTmt2WmphSDZEb1lXWnBPaS9xQnNyODBsVlVw?=
 =?utf-8?B?MlQwUFhYVWswRVAzbzU0djJqR240eFBpalhFMGtBVXJmMFZnWEpTejEzZnBH?=
 =?utf-8?B?a1FpamxYYi9JMXZyNEE0bFdWZTg4emtkd3FLaEY0YzNLRGRYTndKcFRSdGdk?=
 =?utf-8?B?cjJPL2FndzFSbHBoOEZ3aU5hUEc3QzBqMmpFb1NRR1ErMzMxNFV6ZzhNVjc2?=
 =?utf-8?B?WnJYVUJxNEtzQ1Y0dGRKcS9IT1FaV0tuN01oOXN3S0s4UmVVNnF0QVRmRzN4?=
 =?utf-8?B?SWRlRVU5RXhleENOcFE1c2lEVHAyVGROckdpMm9uREpScWQ0TnV6RUhTbFQ1?=
 =?utf-8?B?VjIwc0F4SDVTMENWZFRNUUJMN1dub21mbS9lbFdTaHJDRmdUSU03SHBXMTd5?=
 =?utf-8?B?aHFPQnJNSm8rZ1ViSktUUXVVaWRYK0VlNHY4OVkyS1EyaTlGQmhZdEV5b1pw?=
 =?utf-8?B?NlBLY3djVUJtaThXcmFuN2R6NUtBS3dTNnFtMk9DRzJhYk1xMG5Ucnp5emc5?=
 =?utf-8?B?YVlabm1pS0lGSHdLTmptb2xVNVFiZ0tXL29BVnpkdlpadkxrR2xkNlFybmpR?=
 =?utf-8?B?WFI5MlBoY2dVRWRUQlJnUGtGN201NWZuQlNiOXhaLzNmRHRtazVWNHBsRklT?=
 =?utf-8?B?TktVNUJiVFZEZ2V2YkMzbjlWRTNyTlMvQ0xwai91RjZLbzVSVUZsY09WQ1BD?=
 =?utf-8?B?ZVpMd3B3MVBaR2xQRVJFbE4xSE5SUXN3cStNNXBPWDFEVVgzOElVR3N6WFFi?=
 =?utf-8?B?SGRGYURtM04vVHd2a2huS012ZS8zYnh6anFHSnFNMXVSSWdFSmpSVUswQWlL?=
 =?utf-8?B?SzA4OXRXNmtNRWNiSEY2MjM3M0pWcTVYVzN2RmVLNlBOV3orbWN6ZjZPbkJz?=
 =?utf-8?B?bVc1NkVpcjVtRWFuREt6L3NoOXQ4ME1YUmZJYXpMYnRSYktnc2pMVGk1bFJz?=
 =?utf-8?B?aVJ2MFZrSENDcnNZRXVSQlRreUU5R2NsbzZvSms3WEZPcVdXOS9xK3R4anFo?=
 =?utf-8?B?c3NITVUxa09BQ1M2TVhtci9BNyt0ZGRmbkc3a0xFcmZpa09CM2U1VjQ5MjRl?=
 =?utf-8?B?akJxRmMvd1RLS1NPczNVZ3EvaXNXUFBZYndZZFR3QnpaeG9ReHRWYitsR3FJ?=
 =?utf-8?B?K0tiWUFxSy9DVXRxNTh2Q0JvZVdWcWloNWpHL0ErY1BxN1ZpVkQ2TGorT3dE?=
 =?utf-8?Q?8/XWSSZiAWet+cQzPmCnqO5Ntvu4CAIa7PTIa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a313d20-7d04-4097-5adc-08df02f28a89
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:48:04.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rm5DP2Y4YnqE5TGJKsJR64Ms1pUzBTRU6fnzGSST4XOYPBaZkqnLSy2Jv0m+qQayR3EzmBYolABOaDX+SwMExXJ8kNTnKTqOFN8q11OFQi90AfY9r6obTJbVXqBu5oKb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8909

From: Frank Li <Frank.Li@nxp.com>


On Fri, 14 Aug 2026 15:32:38 +0900, Joseph Guo wrote:
> Add boot phase properties to essential resources during boot phase.
>
> FRDM-IMX95 need UART, SD-Card, eMMC access during boot process.

Applied to imx/dt64-intend, thanks!

[1/1] arm64: dts: imx95-15x15-frdm: add boot phase properties
      commit: 50c0d934698f7602d579ba21262fcca3643c5464

Best regards,
--
Frank Li <Frank.Li@nxp.com>
