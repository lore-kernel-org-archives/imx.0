Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DFF384CC6
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485276; cv=fail; b=ulXCYExKgyP60WyTWAyzyclqCIlgXxOnJQJ3372B+3LWYWk6CHb5+pmfT9LNZDagjwB0sFBlP6NifeetOiHjwdJhCOutusLr28RllzQ5EPMzKswTNA/M82k0mavlfwQmeLUxRYbX7tsYAJOOG6jhT/bu4Cq1wmSnjncXd3iKavs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485276; c=relaxed/simple;
	bh=qdyVIz2hsi5lBpaNg+LgXs+rgGgS1ZaRuqs9smYoJL0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AfYLQU7O9MTU4YayjBGWpKPb1e+12L+/aZ+ASdZ77SEVx65jyPx5rj2J4uhSbuBGFTc7BlOeQYS83616YOWB6HFYaRGLBGMWXZBLa6tzzF69n4k8yCH6r/t8DKO8PszbVykLF+P7k88HFadsiYIfwQja1Fi4nispbQ8rRy36y6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WrrkF4Lu; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WrrkF4Lu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXSIP7/BgXbH2iw/CYBG/tJEujJwT7MnkI8QkiYBsAMAvqeUcGLihaMTGb/6QphCL+N+kx9LP+4yGZigJUjdscoLq1oCozv/olzIviTV4Exvk/o7vNPDhwR1OMcwC/Lfgg/4+t8GIkrmKxcV/A0ToGCvPf+qjaLPY7jJf4WnaQlv3hcY3HuLi2zkh3CTYALsC035VGeFxpMH3RtaucGCEaH56/xgAhvo3YuRUlWhmrKllk/bT8sj+K6Irp8eJ/qZYmw373TLgmrU0JXg3aQyuHtuXwaKVQULQ3H1uvD/r2nZ7Sg4RncxPclyg5IUVO6pgTkK/Dbopib4PS1QLhIuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7LjN30fm8V2UipSfLjTXp88y+wMcWww2+oqsSYOqOM=;
 b=CDwgWpz7Btkq1itL8pmbctAy0tGBuqoPSQIUHnp9eYx4jhsl1+1sMZwZGEzXrzfHj9whP4CgGNc5S73pWmGaiYK2qSdEpOzWOgvpnvjG/R8JtlfqIgeV3reliIqGrti4nR65CgkToFdG2EwmeyG4OG5tpLjQlAPrK9byFJxTzBoJCtKwXX/qik4YJK6geDkaLc14OIUgf+Wh8QKay4NvVDDCWKF15AbGHGbblQQh7+2ujxSFX/E+p7SzbEv+x57audquHJ71WIBxl84hyBFt+DO6MJjYq7RipzrYDHsfANu9vC/Jqn22eUqAxWWLTEZ8nLCsYPhycWi8t9Qiz0aqKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7LjN30fm8V2UipSfLjTXp88y+wMcWww2+oqsSYOqOM=;
 b=WrrkF4LulhHzfqd1tJkoTOjhKQD2nst6IwTyVovOMsAIJleywlQS3pCr7EMKLOdqDoK80EzNjrW1ILHv9N7IFUvPla9el3ednYtDu6ZI1BR0jin+xEPi0UypOIKoKUj1F4PHioQfIIj5P8V/Jh5CvXWrm22jXAsnUce0T+bp5UgcIsuTHM5vwjT01gh7yAB6EnHwAy7y5TFbY7fyVJwoIJRaVsVGgwunysbFZucWWQd8pb1+HTE3y+Ei2i5wX5n3fYvDpmwdwbRgeUcWhyIqtjddeHY/bK1VjGWXLgPZUCmHEiZ32NqVT235MEilfQa2QTGnBYEQxorgvNglEcVcQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8657.eurprd04.prod.outlook.com (2603:10a6:20b:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:07:52 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:07:52 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 31 Jul 2026 16:11:20 +0800
Subject: [PATCH v8 2/6] phy: fsl-imx8mq-usb: set usb phy to be wakeup
 capable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-imx8mp-usb-phy-improvement-v8-2-2ec8d6b3854d@nxp.com>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
In-Reply-To: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785485487; l=1013;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=J+ffE596YmIQps6F8WW5VxDMRj/ceOZZKfbWJppciI0=;
 b=yQzrgonP0UhbTqzldQGkaxSEf4e9yLhHou9eNVC4LVsesnPAIUdAwjfQzo4Uc2SfD7Im5csOz
 QMJUGEo4puWBPunESWoh4s72Db7LBYdUBf89/4JBKLahoc6jzmSM+iQ
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2PR04CA0206.apcprd04.prod.outlook.com
 (2603:1096:4:187::21) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 6257e1f0-6ec9-46b7-229b-08deeedad13b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	klJExhbi4TCVAfKnF0I4c6yAtLYDYhW/ZQeCPIwr42n2nb4qTP0OVKouSxC55xtzk9THZTFIFwERNHlTuEguxhejZdG1peUO8VIkeRK84Nh2VORr3RK+qqhkvZlPICgc3duPoULz6QAIcGQj4SvgMzv79yrSfA5IoUiDoXK6nnA8ICqqXPIlVTWCAFR1AWMlb4Jv8dpgy3k+tOuwRqhROoTD/sfYlqEiiAP79vaVLo3XFyPro6hS17PLvIWCw68FCDsxkhyb8qyOHtwR/WJ1AYWmx51VPFTdtPjXV8v4V0HWy6opGeGTzk6QkfrMoWRGxrsiUCWbPTj2nv+gSjh+xVQ7fS+QdM/TrUHTD3dud1DH6sR2zH7doQzny1j1pkBEaOncAvb0MOJOXi1BPcgwLQqEFE4qCyddPax5wckvz8FQOCGqVPRNEh5UDEQf9jBcJkudcX1JPzBJCv3kG48j4PT+6xW322AkMuzfyICLfJDrnHpN98RQKyfxYbAGTL4nMvVQ8QAdueMyuz1CjkHAO6wPm0H9vf3xb42HkPQ88pnUgkwj9rYht48SUWPNyyuUxACd3NNqt32phJ8xXgY1TRI4HtRCwqa/bNcwUuuCYkRqImCFl9PoqPd2RzNRNBZmNn+8d3U0IPJf6svv7UL/3tfYLL/nFpgNDOjXzRpVTqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eENvZDN5VjlvWVprbFNPMEpieXlNZWNHRTcxcDFnM3g0dC9aRC92SmVqd2t1?=
 =?utf-8?B?bGhHSTRIeC8yV1VvWkR4U1BsZ2w0cnZSN0hpRUNxUmVDNEl3OTZVY3JIS3o5?=
 =?utf-8?B?QkNqMGNVaC9rQVE3QkxSUys4UG96QktNVTBLYjl3REdmWVIwams3NXgzYUk1?=
 =?utf-8?B?UzgzWm9uT3NFcFdpNkovVHBmRU9xeWUyL1FNU1ZNaWpxQURzeHRLWERnZkxm?=
 =?utf-8?B?MEFmbkg4OGVqMjllTTlGMmJqZUNNeUtpeXhQblNjMTZHNDNlbnpxOVF4Z21m?=
 =?utf-8?B?OG0yNm1hNDZSQm80MnVPMWRtL05KcXJwaE1UNkR3Y2tidUNETHgyeS9tMEEv?=
 =?utf-8?B?eXlZcS8zbnNvOGlXNlFTN29FNXgyOXZIeHhwNVg5dGFhdnNEMVBwb1NaMzJD?=
 =?utf-8?B?WWhuanhhMEpKUVlpaU5RR3B0aHMxZEFpME4wYkE1ZkVhd2xJNlNlRVRXTVdJ?=
 =?utf-8?B?NE1ZcUF6VHA1RGdLanpEVjZIcTUvZFlDeEpHMVN4c1l1K0l3Yk5Ra1A5dE82?=
 =?utf-8?B?SXlmZ1hIbERBclVnM1AzcGh3eFY4MDNKb0RPdXBVc0dBb1JLdDNYMnB0NVM4?=
 =?utf-8?B?Qlg2TCtlem1Pd2F6RXUwUmtaU0VSOUJ1cERvVXN1UkIvK3pydTlNMCtESTBq?=
 =?utf-8?B?dVVmbFdsSTFicThFL1ZuQ2lmdDRUbWxHOTFuWEZKamNaK3BqNXJkRVRrbW14?=
 =?utf-8?B?NzRkUWFKOWxXaTltMGxLeDVucWV5bWRyMVp6L3FleWVxWnNpSExRNUNLcldE?=
 =?utf-8?B?ampmZGo4ZFBBQUx3QmxyUUU3dWxUR1pLQUxtQWxSRUpURTN0bGhRNndTMVU0?=
 =?utf-8?B?Y1Q1M210RHgvSVhjOURiQkpnRFl5OEQ2cWgwT0VQSzNGNnZpbW56bGFNeVZx?=
 =?utf-8?B?MXI4dmh5Zmk5ckZwRllLMk5XWjBiend0eEsxSGphcUZXTEZsd29TZlNCYy8r?=
 =?utf-8?B?dzBSUnU2WVR5Ky8xSzdBNVZQa0dCeGZxVEM4azMvUFRzekVVY0NVYkNYdE56?=
 =?utf-8?B?emExUzdad08xS3dIaWRYdUdKM09NK3pjS2JWc3RFaEJDUjFLcjNXRFZManFF?=
 =?utf-8?B?SlF3aFhpb2V2TTRDcEhHa3JRaCt4Q3EwZ05QbkRMVDlyOWNES2k4L2VxRTZr?=
 =?utf-8?B?a0NzYTZMdnBRZG9Kdm5qYjY0VUErK3RWTnNMU1A4ZHhpeCthdlhJanIxYVBs?=
 =?utf-8?B?dUpzb2RidmhRK1E4amRrblgwVW5jdGJVRUp3M0NLYmJoSnBIQXg4c1BvUEps?=
 =?utf-8?B?dUlSckdldHZyR2FkZFhJRC82OEFKblFPRkgyVFYzZFQzY0M2S3ZnVFRnTXcv?=
 =?utf-8?B?YXJtNEhyaGl0ZUFYNW52WHhYYjRnSlpRZlJpeFpEL21yZ1ppMmFZZGxjSktk?=
 =?utf-8?B?WnA1MnVDNngrd2ZDMGhyMGZldG9SSVpSUVZ3dHI1MGJMZjc0Y3cramhXMXg3?=
 =?utf-8?B?ZlhydjBuTy9VdTRHZlNXN3grVlZ0ajdNZVFzQkpHb084WFZMYW4rTDVZRFla?=
 =?utf-8?B?SmgxOTBKdjRXSFhPOTBvY2ZWbHFaSndLWWZlemo1YVRqSlR4LzRPcXRPZm1C?=
 =?utf-8?B?LzRTT1FXOTltc3RaYU55NWI5aGxXMWNnczVVK3Q1ZTU2WFlyc01Sa2xCVFFk?=
 =?utf-8?B?QXJBeE1YMnZXU2M1ZXlPR1YxeUEyTWJ3TTVqNitXY0F2OWxGR0t1ZTZSUVB6?=
 =?utf-8?B?OHhJMDlEUjd6SjBDaHBwaTBYZ2gycllVQzRaVTRTOGtEdVRvaG94OEw5YXl2?=
 =?utf-8?B?MjVHWWo5eEdjZzZmTE9BQ28yS0pyOTh3LzBSQUUxK0Q1UVJyOERDUWZib0Y5?=
 =?utf-8?B?TzVWMDZJNE40Tk93a0N4T21GeUt5MzU0eWxFM0hJU0NMR1FoSkVOTjNCTnpF?=
 =?utf-8?B?bHNGRHBmVEpaQnhZakI4bmZsUFl3VFlxTlI4QkN0a3lpTTFBMys5QkxrUEZp?=
 =?utf-8?B?Nk45dlpoWUxvRWMzbTVwM1N5UHA3ajcyaThTMDJXYmwybEdMWW1Ic3NlV1A3?=
 =?utf-8?B?R0thLzJ4bWd2bVAvN1ZpcU5CYlI2V0w1RTYvM2haN1RtTFdwM3pycEUrRXJI?=
 =?utf-8?B?NWluY1NRRFc0ZjV6OUw3RnhqRHh5NTZLM20xNTd4MCtkbTUyclV5VGY1YjFP?=
 =?utf-8?B?aWhyLzZxaWFDRThVbnZTeEN3cENZekFiWURWRFlsUWVYTXNLa01yYlBGaXdt?=
 =?utf-8?B?d1J1eWFzZm1QRHNnQkZDcFo2ZmpCUEVKYWJBZU1PQnhzZXdwdU1YQWJLLzNw?=
 =?utf-8?B?bGZjNUtaTFluam02OE1LMnJuV1BIcWtXZk9YZG1YVzRaRTBWNTJzMlV6QmNv?=
 =?utf-8?B?SVRSS28xSnpPWjJCQXhnNjBjTk1yRkF3WGpPMHZ6YjNrMy9tdjRqazA3K25Y?=
 =?utf-8?Q?UsNhNr0SRJXjqgkYY4vTUh1B+UeYJ3KO9FTkg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6257e1f0-6ec9-46b7-229b-08deeedad13b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:07:51.8963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+twkjsI5OZWKQ3UDxAoQV86xzuA5vgggCHfjmTGwl3MlKRnMbHojlMY9SH4hueX4/lBw85YuZHm06k0uIcVYaVtOwGmiF5DGb0Cum7T8PNfrY43HyXVArx7iF6qGtf1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8657

From: Xu Yang <xu.yang_2@nxp.com>

Set PHY wakeup capable because this PHY supports remote wakeup function.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v8:
 - no changes
Changes in v7:
 - no changes
Changes in v6:
 - no changes
Changes in v5:
 - no changes
Changes in v4:
 - add Rb tag
Changes in v3:
 - no changes
Changes in v2:
 - no changes
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 9a33c06d6fc3..3a5788c609e1 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -728,6 +728,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	device_set_wakeup_capable(dev, true);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 

-- 
2.34.1

