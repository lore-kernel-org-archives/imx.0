Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0211A19067C
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566876; cv=fail; b=jHIFXJDW+kDElE3SQnEdxWtt3ibTX4SLjQiRtw0kvTRWuwd2vhE7BvuPFpnCGcRovaruFbHLbrgVmOD3ayneAJGELIqUunBDO19n9sCdEaoKcCV7t15EVswcPXyErDDrZ3Ywi/mXfNjNKCwygYQ1phbckriLmvcP/ueOiHU40sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566876; c=relaxed/simple;
	bh=Xhi7YiN5K3XHJDcy2J65FB86031yofQmVj8PxVzwZ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lL2l1al0VMIopJTccpni2MghyW5yuSZZcGPwNxljzWjSsxcApKWhnK72L1SdigDWoMRbE6dlC1xx7zkWObkeNIDDpRjy9WchPk2cY0cg3rFD2T+0+EmGOQQKSzOVp7fuKD1x4SU1PcMNm3vwaA+YHUNoa2YwJq1ktSQtZtrgu6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aX+VEgp9; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aX+VEgp9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEkjptUMlXRk2UTYr3XZ9OQVZEUWsMxHG1h6gTQR2ON8eLboLJIClk0zQulemiSjXCLKYaCU33rjI1BMa6QnXgWVyOZ4RHmic1EjrhwBbX/vpYvEDHFKmuw2gW+A4LQfs/3geEN3lRGFfGsVxzEOWaoKbOsKd9I5O4K4nhsTgaMn/QLilluc7mAi66zHDYkKdlvHqGUNh9Pkh0rxV5yR90Vg+bl7ig1WrcQCC0KXiN0LasYGSKbD1ekaX+2fqeL1u02fET6mlNlQoTr+7s3fp5BaOWGZPWir/Ko6WBYmQ588TVr/OX4dsvw6WQFjhXRDW7iuiSOivaYc3oXl27RMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM9lm/YwTNqDZ0N7heDDoe0JCGJGO1CnHBalRcdJ5Mk=;
 b=E/76c5Pgf+9CNn7ZNbG4b3T1c6omwz3gR+BHzq9Iw3ULKo8S2wq71nWyAUyRLH6UteqFLb1qp8N2QvIGauQxnMDSVqwBr+QVIiC1QEJocVCHNZLTsxbCzBQ9+psQPxzuBapewqJfDx+R3rPzxiTlzFH/QbPLp7zBuBHLc8CFaZ4tzQI/AL5bV193k8KUeExbTH8JtrLn4BqgrgkHOuXYB7Ww55bftgptNjd73DytBWqYSO2QsSHTaBAfE7OupJXORPEZx5e3STbeg5MPWsejNm4qvZ4Weh32FhSOKXnBu70K99+Gt2J4ztFIRoyHQ0xvDdvmWz3R0A+hkVXWI8y7FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM9lm/YwTNqDZ0N7heDDoe0JCGJGO1CnHBalRcdJ5Mk=;
 b=aX+VEgp9Qoh9GaApI5Yi+sXNHExbwhFqm4BaFpBg69V+mdJgrmNP7AOUZn2mUdlNG1JoRR4mOqcsD6AYA7mX3OSxy6qkSioVbMNwuDKN/ZRr5XMJ3cMlJHVk1kN6DF0mJxYSUvAKiShYg4bPd2pH3tAAjzsT7iofdS4jLVvrO/VpKuPY1tYCVvW+5D+xtngBv0qqwt7+R6/bB0xdDlhk1HujVUOPSYFwQcn/4PN51DfVkoY34e7lf920ljz1aZ0iqMbZspv5t/uW2gJnYpLGATDcdvQoDDNFYBi1Q2Mw/BP29p52Lekg4rXU3UgrEcrCLXqt9p2U8v3p28vIPm9DSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by AM7PR04MB7189.eurprd04.prod.outlook.com
 (2603:10a6:20b:116::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:01:12 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:01:11 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v2 0/2] Support for TQMa91xx on MBa93xxCA
Date: Mon, 20 Jul 2026 13:00:20 -0400
Message-ID: <178456681264.3791549.6261476129516016148.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713091924.2319674-1-alexander.stein@ew.tq-group.com>
References: <20260713091924.2319674-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0111.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|AM7PR04MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: a3bb2a4d-e58c-4e5d-589e-08dee6806b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	raJIaZoeV0mzIRv36Iq58WWmRE5g93znCXRnDa2RwUMn4vIyMrHTbk83kq0y935CUYIDzvCt7d6stnqLn9mGixt7Atei5AqIlOuAyZulYsTCUXu31gx+uHFTwBzbF6FUzdbz2OjYZ7pqJ4uu2M7pnunFNMeLPOSLh65NDra43sGfxNZVyp87r2Yo16Aq80EqdZKPE3HG9rF4RF9/ThJfpE5yggMb5/Ph2nFF7hoVKR3/zeBtFOthadmGcfeJPzjWMpC/ozAPL6XNq5/k1imF7y1w4XDzodHGv1ZcGJ+nRnhjfdDxlGSTL5xPmYoG3pRdFbaLYUJ+b/KEDFKdu8CsGotIrI0ygxUpHaZT+lc3g7ZPUNwbwErAUEUsnoFhjbfW8TEgqbO7z6ftuVj1q/LDvWZxeYIfKs5J7fdIuW7qrvHIiioDWC0XjU3JOKGayv0g3CmSu/rITajF2vDp4sKI8d+uvmGaJ/IjJSWjwPUqOd193v76Y1T/0KgiprfXPTXMMoCClUcfM6mDnjKn3epKMv1Fd5USeY/CsTRiJj5Q1gg0XjfonJH9xXaq6TTz637oMlc41WgFJIShTAluUqxAWBjcsR83/r0TVCmrsZ5oC0FKck9f3NN4y8TO6xk0TwIxpNcEkoC5D2Ln6cESG2oRH9dx1VQ1kRjZLyRh7QbDlmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OStiWmtaa0xZUTFPWGtGM28yVmJjeVVobEJmcE84NVFPcnZOU0poOUpraXkr?=
 =?utf-8?B?WW50MXZZWlF1VUtQTDlEcHppV3VZS0k5VEd5SUtNUU9LSXZYVENHMy95akl0?=
 =?utf-8?B?OElsdGxkb3VKN1EyMUQvMGkzOVdKVnJVMWRRdmZjWGhOdHZ2UXhhRkRXcDhz?=
 =?utf-8?B?cWs2RDFFdndEbVZvcE1KaFgyNWZuVzFuQnI0USsyRktPNzlXZ1JiWTNna0xT?=
 =?utf-8?B?ZFpuUkszdE1DTU51clVmNXp5cXhRSmtSaGhuWE90YWQrQ0YyS0VqbU80Zjgw?=
 =?utf-8?B?ZWVKRmtWVnhrY0RVMktZVmlJSlV2RklTdFBRMG1VNDA4S2hUUVN3Z1J0eDNi?=
 =?utf-8?B?bjFGakRHa3owSCtjV0RGZWlYMC9IVFNHbkFoa0N6L2lOSjBtV1YrdU1RejVw?=
 =?utf-8?B?VVJpYnE5amtRS2FnbGlxdDV0bUp2RGJWY2xjdG9IdnllcWxqN0x1MS9EZzZS?=
 =?utf-8?B?WTd4bmVQQkhuVCs2Mk1VN2krd2ozVFdORGpFdno1U2IvQnQxTVBjZ1drQ2dt?=
 =?utf-8?B?aC9YemVYQ0dvV2ZCNHA2TkNQY2c1Zmd2eHRpUmg2ZTZjRldJektjcmlWUHNR?=
 =?utf-8?B?bjc3dzd0M1l6bG81OTBQNmJHdXNQWEdqd3BaYjAxRHNzWGVFVkI0bm5qK29N?=
 =?utf-8?B?eUNMODlvUE5xakpYRzJKbVNIbmtXOEl6NnU5d3ZTZHVKL3g1R0NsdGRxVElY?=
 =?utf-8?B?Q3d0bzE3Z1JHZCtuNE9UVm8xblc4SzVDZDhCcU9zWWhnWFJITkZvWHZIdkhT?=
 =?utf-8?B?Smo5K2F6UE1vR1ZFdjhKcUIwTlZRWmhtbEQzV2k1UExWMndPMFpJQTFDRmYy?=
 =?utf-8?B?eHQ0cHFleVNwdDRLcEdZdElqbXJDSGUwUHQ1TENwdDJ4SWo3T1dZTi8vNFND?=
 =?utf-8?B?SFpXOTZSMjRzWENGTXg4MFFhYUQ5eWZYM3VYZkRKdXJrcUlySUR6c3Z6dVJF?=
 =?utf-8?B?eTBvZVlzQTFzcGh3Y01PcXdqYmYrUnZSWGlpK2N0bWRGYi9JbnQ0TEJYcGRa?=
 =?utf-8?B?OXNiSVVYWEV5cUxGQ08ramhPRTZCSE1qVHBCakhhQ2ZBNjBzZ3pSNHRKSElp?=
 =?utf-8?B?aUlwZmtDemtaYjZoOExtMFoyRlk4cHc5WlpZdmxiWGJ4cUR2Q21jL0plWXB4?=
 =?utf-8?B?YSt0ZmJVRlNld0d5cjBvTlFsM0JydjdPR0xGYmY4OUZNdjM5Z1FnMzJBY0xt?=
 =?utf-8?B?UlZBNk9YQ2F2SDE3WWlNOHgzb2pmQmdTSnhWU2lIM0tWNStQeWlPTDdOaUh2?=
 =?utf-8?B?ZlEwdlBLR2o3d3hXa2JJNVdHRGdabk15WDRNNzFqdkJ5dDFUYXU4RnV1VEdo?=
 =?utf-8?B?MjFvQzB5MkYwVnFoY2U4MTRsRkowTVNWRDZSSUdoOXFHdmFzcGFHRnRPaXU2?=
 =?utf-8?B?Z3VETHlyUzExb08xMkYyMW02VEN6eWM4VW9ZcTg1d1lNWnFvbXQrR3ZTaCs5?=
 =?utf-8?B?T3pHTEhXUVFqcDhNdUlqM0Z4akVMNERoQVordFZzZ1llYlJhTVlUYlI4L2hh?=
 =?utf-8?B?b20rb1VzOUcvSGRrN2hnNDRYWGNVYnBaUFl6RzVmYUNVcU9KNDA5VW5wN3U4?=
 =?utf-8?B?K1RrRURCdWFQRy9Mb3J6UTV2QmxBb0NpU0xBR2czUkgzV2EzZnlUYnZuU3RN?=
 =?utf-8?B?RjdRMmUwVEdWOHA0WHowK1ZzRFQ3V0tnM3d0Q2FHNXZBTnJjWGg2aFRQaGpu?=
 =?utf-8?B?czhZSlJUWmsyUTViUTlpSCtFeHFPbm9VUDJUejA3UGNTUlZwR0pQSGdXQU9M?=
 =?utf-8?B?S1lNMERQMVlIeUVGazlqYW9pMTBSdUFQWjYvQ1RUV2JNcXdFbWVwbE5yWHlW?=
 =?utf-8?B?TTMrN0tRZXdXN1JqMlFVek9nL1RLL0lTL3ZZdHFWM2k4K2IxSkV4WDFKcU5E?=
 =?utf-8?B?OTZob0lMU2VxckNNOGZtSGlhZCsyZGM1N3Ntak5acFhqOW9QV0VySGFBVmhn?=
 =?utf-8?B?Q1NSUlpqaVdxaDhrcGN4RnhBQjJQQjQxaDJFTTdXaXk2LytVeUpyaS9KNW1Y?=
 =?utf-8?B?YTNxZllJRW1HbDNSNExxVlRReVZFTlZVOHd4Zld0RXVHVElWWjRvT1I0Tk1l?=
 =?utf-8?B?U3FzOHo1MnQxV01NYkxsMkJUcmkySXVuMi9BYWVtdjgzczZCS3VoQ0xWM1kw?=
 =?utf-8?B?UHVVZy8wQTVyV2ZFbWZqbWFPUVJlWUMzY09ISzhIc0FVcW83UkVnN3BYUzVC?=
 =?utf-8?B?d0N0anlxQlB6R1BkaHdzRmJua3VueE9IM1hDejJyN1I3RmMzVmlqOEtBRnlm?=
 =?utf-8?B?OFY0a09FUlQxU0pTS1JmbkxnblgydVQ3dTJZM3o4UEJHSnRRVG5lWmxQbTFD?=
 =?utf-8?B?OVFwYU1QOWVrRjVQbVNlSnVRRHpUTmJYaGRIdVVHenlpU3hOQXJlTGNQMi9o?=
 =?utf-8?Q?7kAHbnuO6EzHBsZ4H98lzdQd9Fx2OZIOd8kwH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bb2a4d-e58c-4e5d-589e-08dee6806b39
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 17:01:11.7805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUH1vC39h5y3vcXKbAdipM9grfOGYqM573wkqVhqx0ZXEfCrcmXrI09V5NLBeV45dWY6yGmA7D5gev+wJdRHlV45Cjv+HY96/9odl1oswAJTqtvxtFaT2nfRYjhNbTtp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7189

From: Frank Li <Frank.Li@nxp.com>


On Mon, 13 Jul 2026 11:19:20 +0200, Alexander Stein wrote:
> this small series adds support for TQMa91xx, i.MX91 based module, on
> MBa93xxCA. It supports most interfaces similar to TQMa93xx, but LVDS is not
> supported at all. Wake-on-LAN works on both interfaces.
> 
> Best regards,
> Alexander
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and TQMa91xxLA SOM
      commit: 174b7dfb7dce9017e482c1fb2aa04ed28a141936
[2/2] arm64: dts: add devicetree for TQMa91xx on MBa93xxCA
      commit: 4d0d3a3d1993a41b2bf8d28aa6c6071fa1a3bff7

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
