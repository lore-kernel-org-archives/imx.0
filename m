Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCFC3A6B9D
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485283; cv=fail; b=RzZ3J4YZtZ8EM8FQimi02C9bkpM+nLrbfArcHrgSebWu0+b6BtETpamIpLR0EJli+m8ogb3K3DeIF/POtKCUeA4EjHXIyYMFcgLCFzJlCZHH7Fk1/hbtmImJpUARCo2YFKRh/CRGURPF6mCPHIfN1Z03fbKHlWI9QcSBN+QCTxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485283; c=relaxed/simple;
	bh=lPXUgQqnXk6i1fY7tiMtm7+qZSbLr9js8+eItYRVDDM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h0kvGCskdqGNiomAFK8TKoh01qV0CXi/62xiB03sajYKPAovrC+wIiuif9sJT72OB3B84Cgt/wJoN/DxpvKbQfYmIbdh2BqYR8GrzgmKxuB98hQFHMIulTzrxToWXThiS+ZDN08lyzV6vs41qgtlCtfFtXM+GRG5XaxWefUDOWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rkFSQoGS; arc=fail smtp.client-ip=40.107.130.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rkFSQoGS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qy1YLQYJqKNbZf9gwJGPOgq9EveuIvfmf21Awi8C9yDqkskFaZ3lWsKkm3hlZjaFAyNQHH2pN0HL6gOFYq/9kLxPb99+JIxKVK8aD5pdFKTGmtdoHfBcdmi6X4RMf6MKnSe1KyN81eaIaBlVdClitCAcUY+prkBTEQUk/dQvKGVtsW3yLoqyLyNiOdqEOyXSlMeFED5taxBPgX2JPYi9jkuZJcPubjAbBPVs8CVvn5rMRmX24NuB8/lnF5wuv5MYGDr8MGAL9JWvZ9PyHogYBw8x/NJGxldv5Y1B6eOA1tyN4BCCjIn06C5Vu2efJ7euYqSMPRCxE/3niNfEo0Nmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwqypP6wmrbyGRySlv/Nff0Gj1OC7jbwlM/HQVAo7Jc=;
 b=QC9OCKkschWpAfEESnwhEyaL1SwplEWT0ibaJ9Bl/Jewy1kHuOV5UVBibcuPjYpZhDiOTRnGFNiv9az+aPfB0ilXUoXVARftF0sCPwnwcr7VsgN3h707Ksiwe/ofRWRSvfQomTCOM6AH+mu5TohwJzDHEg9f/9u/lGtWPWCnvWPQJOKNX26WfTJZvw+6KEa8BEv6QfwqVp+nIpnYJ16sNv81G1GwXA8eu2oQBHd6JlteIIGv9zHpRuZORJ4BezpXARJLSc9oCCjYlTc1gK1ybxfASsU+MSY4sFK4qRPX2UhVB0x+bQMsf/JODb0GDpiH0nvhXUP6d2Zs3UrEUyyWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwqypP6wmrbyGRySlv/Nff0Gj1OC7jbwlM/HQVAo7Jc=;
 b=rkFSQoGS2hxYpPGDHaV7TOBqmWBk8NyYqTVbdvEJx4Oi8g2xsgHIjxlXFm+0EADtALL9ynm5zTL7y5zuJyL6dm7Wwwbqnm+AEl5OPu603BWC2VF4m84wo2VQ0JiygbU5GqGZQW0fQrBYaNTLN1CHlgC9ZSRyDIvoIrR+Xmr9gnyp6ytNPKjDhxO0n/ONz1DhowBVOjF1GrDpgG3jJbexQaWbkqwz5eqobd41NSK/6A4852Rp7+yH3pn92pUYVkM6bptzkJ6vOE11BGp9Ehz7vMASWH8dA/sp0zZ93L4o7XvhSaZ/AB3APMjqrB2WQxAgP2F2ZjvvJibOQdrwt0zg2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8657.eurprd04.prod.outlook.com (2603:10a6:20b:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:07:57 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:07:57 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 31 Jul 2026 16:11:21 +0800
Subject: [PATCH v8 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-imx8mp-usb-phy-improvement-v8-3-2ec8d6b3854d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785485487; l=7773;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=I+zsUG8G6eiv4f8s9Lsxd/bgPh0RrE5KgTtL6Hua/wg=;
 b=NRbStHtfMiLBwD1pL/EFGAup7lTutcqdVX/Sd59ZLnS2yXyjXHkQT1O2fA8hUEQtwSzcSzDjd
 qtGellKfkK7DEqpAY+oYvHUBRL67HNMrhhv87dfCvm8hZffiQZq7AZD
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d939bd-b7b0-4e60-aeb5-08deeedad458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|6133799003|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8K/eRrp5DsfiPwThJLiXhx/jS59XzExqBd3JBXI/IHkogdMpkIgA+V8vK9khHVqB3IDVU/Y40P5fnjC9QsGrxNDIt0grZ6k6MqDfjyfFqcS8b0x4vGkO+XA45MCsep+cbBQycq+OMrPMAsbTAVVOMSxFZ1TUqO0kcM9vRBXNMoqwy3q3pybmLtu1EXYqn7raCrKlfeSIjDjRGmSdhAeX4M2eP2ykmMAbf0HU8+WhX+fipSItHFboq1h1AgujHrZ493btfKgRmumsJiZuRD62W0S0Eidu0ocl2Icpxqs/H2qo+CfGoo5Ka3P+elASzMSSwJ2dpfWs/rxNdvxMwnzap2CEHHwzv5kAbq49+AxfqAzhDtl7n+yTBCkAE/u92BC6NheSYG3ADIwhnLUR3FwKKvM4T49lxSQEEgechcrSZxD2xWVy4VFmDTB5SMYOlXlnXW3sfFU/GdZczfonMmwM9fXIHpdaZtV72hVWGepjSatV6mo1OXvl2+ihuf03p1WDquNSe1wKsMuxZYpIqRobO45yVq/kvF/dcNxiABA4hXvDP77NbEQf/zItvTydpAUbCgXXayWOVx0lCldXJk/LZlIKYDlGbG0uEi79YZD/0v6prVup17b2bB11MZMpVCaMSs1k67XDnDe5kEHahmtgUlF9Y+6sTaZRZwDzWQFDSRE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(6133799003)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmY5RlpDUVZJRGtmL1NNeExRRHREdGF3eEpqQVJhL3A2d0xrTDJlWFcxRE5o?=
 =?utf-8?B?VGNPVGpDVW40RkFyLzJ3cWM3c1pPZm94YVVYQ0hIM3o1V1VrbEpRNGdtYktT?=
 =?utf-8?B?Ui83OHg4U3FTS1RkOVZSY0ZrVm5rdzZTTE5JNFRNbzBjaWdGRVRMWXo0dSsy?=
 =?utf-8?B?aHJKKzNPRWdpYXlrYk5XNXlITnlxekRMcDdjNXoxdDh0M2xlTWN5aStqOXZ3?=
 =?utf-8?B?OHN2cHd1alF1L0R2WG93ZjBhS1dVL3RNamt2bEhQcTRvcUppdERHaEtUMVJo?=
 =?utf-8?B?YVlaWFczd3ArVE1URU5FMFBWWmk5L3MyalFIRUltUU00ZFI4c0ZueElBNzJv?=
 =?utf-8?B?ZWhxMlNIWmJXeThnREZNM1RPSWVyTjlQd0RNME1Ia21KM3NocWR1a2xaMjg2?=
 =?utf-8?B?d1FXejZJSFl5VktUNWVveUJIRzdlRE10OTFQVnpDc1I0elZTSHFMYXlvRjdx?=
 =?utf-8?B?U0pNUGVZQStXUERhWWRydzBURTN2L0JVY2tPcCtXSklSMVRoZEF1YlJsbjc2?=
 =?utf-8?B?c2dwT21DY1AwS3V3RDVNdTVOYURsV1M1bWhkSGRZZ3lWdzhZQklORDA2OEY2?=
 =?utf-8?B?bEk5QlVmUmFOWVorSGpmS2xOdFl6TWlCclZTVENQdHZKNTFXQzYvY05pS1A3?=
 =?utf-8?B?TFFPd2RSb2xaUnlXckk5ckdOdWI0NlFGY0RzNVhjMlZzVzAyanVtWml5cWcx?=
 =?utf-8?B?NFg0TUJSbWRRbG5NVlh0QVpMZStvRENKczNpSC9MVTAyMHhYb1FpbVZDNkRZ?=
 =?utf-8?B?K3VuY0lBVDl2VGRodlo2UFdBVktJajNhZjhyYnNmVTFCdnVSUlZKMkd0VVVI?=
 =?utf-8?B?ZkxLc0owdTB4MUYrdHk2QXB0cTdwanpkS3Y1bVpyM05NMjJMaU1aS0JDN3dX?=
 =?utf-8?B?OEg4TE1wREthYlVwRjgrc3JiSlJ6SWN1VzF2R3htMm4xQ3R0aEZYeVpSbS96?=
 =?utf-8?B?VzQwbVJMUzNFUVpic0RhSWl4OENpSkdZL244RFdMODMvVGZFL01uQUVSNGRJ?=
 =?utf-8?B?bjE5eGQ2a1J3R3gwRndNRXpJdDBtODgvZk96VVdQWGRtWFE3TjBIUEpDMDdH?=
 =?utf-8?B?cEVPNlNxREZyR1hJRlRCMEhZbHp3VkZId2VFKzVTYVlrSTkvdThjcjRVeXR2?=
 =?utf-8?B?Y2FVQUdjTk5aY2MxelFjcWhEb0t3YzdjcTdhVytDVUJqN1dEYzRXY0FBeWQ3?=
 =?utf-8?B?bjhTZjlqaWFYaUhDWURkYnFNbGN2OERBSVVVaVBaRU9JdG51cUtaRlRQZmdy?=
 =?utf-8?B?QkkwNjRSRU9pZVRVOEEyNUplbTlUeTM3MUdrWnE5RC9BdktJeFZNbDA3Q2FZ?=
 =?utf-8?B?RHNkWFBleTdSNk0yT2V3N1RRcVhETXhBbFNtY3ZzK3p4a3E0bGIyWmd4RnlG?=
 =?utf-8?B?SkxCSUU2WGpPVVJzcUlRc0g5UGZIdU94QUFER3ZMTjdLUmo3VHB5OVBPY3pQ?=
 =?utf-8?B?VFdLWjhSYUJYelhKajBWMVdFbDNhbnZsQTRobGowQlhORlFOblNCOEM3UERY?=
 =?utf-8?B?QXJXbFp1RlJIZlhZeFJydDN0Qi9aRExVdlJPREhhYmxMUVpxbXRMTy9TTjRh?=
 =?utf-8?B?TGRXOFhJQ2tLT0hCVmgzejM1SnZUSXFJN0ZYTUpFbnZTZndEbDI1cXJ2NmdC?=
 =?utf-8?B?eWp1dThtMVFGUXArWEVUVHV1azRVb1VqQ3ZiRVljdFQzbVJ2TTllaTZ0SFFC?=
 =?utf-8?B?TDB2aTBFRHU4YnliOWNPcFhsOU9BQ2hnaThuZjdRczBrWER5aFRBS2IwZXAr?=
 =?utf-8?B?eThCVlZ4OUM1TGFXR2NvNkN2TnRxRTBQQml1dnJ2ay9VeGlzZ0FOeFpoaWlM?=
 =?utf-8?B?Z09yVFpVK1B1NzN0a2FLc2c3L3QrOW1SZTlBbXVqeUdrOHgraWx4MzFiOXV2?=
 =?utf-8?B?L04zOTVlcm9FOFBZZnFJdHA2UURFcVZUa2pjS1YrZkg1OFg2MkxqK1Z3cmVi?=
 =?utf-8?B?U3RkOURBQ2JicmdmN0MzS0lyWThpVUZuamhaVDN2SmlOSWxIUFBZZGNtTFFJ?=
 =?utf-8?B?ODYzSEt3VkR1WGk3STdvVXZGbXp0QXk3RWNoV0Q5emVhcnRUNWo4MHVtLzlw?=
 =?utf-8?B?QUlLRUJIc0NzRW5KMlFUQkFaMGh4VFVNWnIxZlVJSUdpR2FVQkhMdnZXVzBZ?=
 =?utf-8?B?WnJOQ2l5MVVQRlhudXVzanVvODg5bDZrWHhRQ2tsbU9MSXluTkhROUVLL0Zn?=
 =?utf-8?B?cU53djRBRkYzL3VxN0xTcnBaM0FxNTRWaGhjK0JyWW9IeXN3U1RObGZvNTRU?=
 =?utf-8?B?aG5xQ29GRHlSb0doeXV5MHE3L2ZSbkgzVjdXM1BGV0JpL3poZThYcGJoL256?=
 =?utf-8?B?b3h5MXNsV09TQXlKbGloUGc2a1pXNURmbzcyY0V0R3llNis2WDgxS1J1NGk3?=
 =?utf-8?Q?iwtFhl6lvA/6jf0W66Vx7Tifl74XWieANSiaO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d939bd-b7b0-4e60-aeb5-08deeedad458
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:07:57.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoNjsZ21TvGK5gUaMdeKqanxCEThikVKhm5qTbxLW3BqhWHbyh5y/4Z5tvGkzFmPVJ+wvqv0tfrh+9dw8l3a+zZp8V8SM0RZSb+5o8cBpBT4BAZwfVwQTSDOw/BGSHA5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8657

From: Xu Yang <xu.yang_2@nxp.com>

Add runtime PM support to ensure the PHY clocks are properly gated
when the PHY is not in use, reducing power consumption.

Clock management is moved from power_on()/power_off() callbacks into
the runtime_resume()/runtime_suspend() callbacks respectively. The PHY
subsystem core already holds a runtime PM reference around init() and
power_on/off() calls, so no explicit clock handling is needed there.

Use devm_clk_get_enabled() and devm_clk_get_optional_enabled() in
probe() to keep clocks enabled initially. This ensures the PHY remains
functional when CONFIG_PM is disabled, where runtime suspend/resume
callbacks are never invoked.

In tca_blk_typec_switch_set(), replace the manual clk_prepare_enable()
/ clk_disable_unprepare() pair with PM_RUNTIME_ACQUIRE_IF_ENABLED() to
guard register access against a concurrently suspended PHY.

Move devm_regulator_get() before pm_runtime_enable() to avoid having
to clean up runtime PM state on regulator acquisition failure.

In remove(), call pm_runtime_get_sync() before pm_runtime_disable() to
ensure the PHY is resumed and clocks are enabled before the devres
teardown disables them.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v8:
 - fix if condition in imx8mq_usb_phy_remove()
Changes in v7:
 - replase PM_RUNTIME_ACQUIRE()  with PM_RUNTIME_ACQUIRE_IF_ENABLED()
 - use non-devm PM runtime callback because it's hard to avoid double clock
   disable issue when probe fails or remove the driver
 - improve commit message
Changes in v6:
 - use devm_pm_runtime_enable() to disable runtime PM when probe fails
 - simply pm_runtime_get_sync/disable/put_noidle() to pm_runtime_resume()
Changes in v5:
 - use non-devm PM runtime callback to correctly enable/disable clocks
   when unbind the device
Changes in v4:
 - replace guard() with PM_RUNTIME_ACQUIRE()
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 103 +++++++++++++++++++++--------
 1 file changed, 74 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 3a5788c609e1..42de2cff4d5f 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/typec_mux.h>
 
@@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
 {
 	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
 	struct tca_blk *tca = imx_phy->tca;
-	int ret;
 
 	if (tca->orientation == orientation)
 		return 0;
 
-	ret = clk_prepare_enable(imx_phy->clk);
-	if (ret)
-		return ret;
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(&imx_phy->phy->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return -ENXIO;
 
 	tca_blk_orientation_set(tca, orientation);
-	clk_disable_unprepare(imx_phy->clk);
 
 	return 0;
 }
@@ -620,16 +619,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(imx_phy->clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(imx_phy->alt_clk);
-	if (ret) {
-		clk_disable_unprepare(imx_phy->clk);
-		return ret;
-	}
-
 	/* Disable rx term override */
 	value = readl(imx_phy->base + PHY_CTRL6);
 	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
@@ -648,8 +637,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
 	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
 	writel(value, imx_phy->base + PHY_CTRL6);
 
-	clk_disable_unprepare(imx_phy->alt_clk);
-	clk_disable_unprepare(imx_phy->clk);
 	regulator_disable(imx_phy->vbus);
 
 	return 0;
@@ -686,6 +673,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct imx8mq_usb_phy *imx_phy;
 	const struct phy_ops *phy_ops;
+	int ret;
 
 	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
 	if (!imx_phy)
@@ -693,13 +681,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imx_phy);
 
-	imx_phy->clk = devm_clk_get(dev, "phy");
+	imx_phy->clk = devm_clk_get_enabled(dev, "phy");
 	if (IS_ERR(imx_phy->clk)) {
 		dev_err(dev, "failed to get imx8mq usb phy clock\n");
 		return PTR_ERR(imx_phy->clk);
 	}
 
-	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
+	imx_phy->alt_clk = devm_clk_get_optional_enabled(dev, "alt");
 	if (IS_ERR(imx_phy->alt_clk))
 		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
 				    "Failed to get alt clk\n");
@@ -708,44 +696,101 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	imx_phy->vbus = devm_regulator_get(dev, "vbus");
+	if (IS_ERR(imx_phy->vbus))
+		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\n");
+
 	phy_ops = of_device_get_match_data(dev);
 	if (!phy_ops)
 		return -EINVAL;
 
-	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
-	if (IS_ERR(imx_phy->phy))
-		return PTR_ERR(imx_phy->phy);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
 
-	imx_phy->vbus = devm_regulator_get(dev, "vbus");
-	if (IS_ERR(imx_phy->vbus))
-		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\n");
+	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
+	if (IS_ERR(imx_phy->phy)) {
+		ret = dev_err_probe(dev, PTR_ERR(imx_phy->phy),
+				    "failed to create PHY\n");
+		goto disable_rpm;
+	}
 
 	phy_set_drvdata(imx_phy->phy, imx_phy);
 
 	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
-	if (IS_ERR(imx_phy->tca))
-		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
-					"failed to get tca\n");
+	if (IS_ERR(imx_phy->tca)) {
+		ret = dev_err_probe(dev, PTR_ERR(imx_phy->tca),
+				    "failed to get tca\n");
+		goto disable_rpm;
+	}
 
 	imx8m_get_phy_tuning_data(imx_phy);
 	device_set_wakeup_capable(dev, true);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider)) {
+		ret = dev_err_probe(dev, PTR_ERR(phy_provider),
+				    "failed to register phy provider\n");
+		goto disable_rpm;
+	}
 
-	return PTR_ERR_OR_ZERO(phy_provider);
+	return 0;
+
+disable_rpm:
+	pm_runtime_disable(dev);
+	return ret;
 }
 
 static void imx8mq_usb_phy_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		dev_warn(dev, "failed to resume on remove: %d\n", ret);
+
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+}
+
+static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
+{
+	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(imx_phy->alt_clk);
+	clk_disable_unprepare(imx_phy->clk);
+
+	return 0;
+}
+
+static int imx8mq_usb_phy_runtime_resume(struct device *dev)
+{
+	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(imx_phy->clk);
+	if (ret)
+		return ret;
 
+	ret = clk_prepare_enable(imx_phy->alt_clk);
+	if (ret) {
+		clk_disable_unprepare(imx_phy->clk);
+		return ret;
+	}
+
+	return 0;
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(imx8mq_usb_phy_pm_ops, imx8mq_usb_phy_runtime_suspend,
+				 imx8mq_usb_phy_runtime_resume, NULL);
+
 static struct platform_driver imx8mq_usb_phy_driver = {
 	.probe	= imx8mq_usb_phy_probe,
 	.remove = imx8mq_usb_phy_remove,
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,
+		.pm = pm_ptr(&imx8mq_usb_phy_pm_ops),
 		.suppress_bind_attrs = true,
 	}
 };

-- 
2.34.1

