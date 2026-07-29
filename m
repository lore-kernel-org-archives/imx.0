Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013002.outbound.protection.outlook.com [52.101.83.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67843A545F
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 06:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306922; cv=fail; b=harv9vXUYFBUGPab3G0zj1PfUtSqHHHgRNIUn2D1KRJgjik7cypgzp7xDekpSwIuCzO17iUA2vwv3dAHO+CsEtP4v53tC615SPsjFyPIT53eCDZ+JNBCCDrfZ0qgQ+Bk4+2o0UkQ2yhjLk8U7N07EoF5mHBGtkhUR5v60tfSfko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306922; c=relaxed/simple;
	bh=IkeP/y0rwG2b55P/rlIQ83PA9XUS6S2DkG091K1CGYs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JK+INOBcHXWb3htFbO+Z0ebdxfsvNGHJGZqRbTgXrT2yYw56kCbUmQRPHbBDFuocn4PHezpI7Mj8LpRgZeKrWI88kpVX80YCI3v2ytrQPtlik3ZIHEGF+DOy2CmYYD68z8av1972ROoPj2YttfEny8TDW7ePykAiYmZBhUB8hAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Em9e811l; arc=fail smtp.client-ip=52.101.83.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Em9e811l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqjaW1sTkUSqsfturRFDFXznQNAqYkjSgLqWrA3dRtRXyrpABbU0kwGjWJmf5orL9o2x6NvW/Dol4OuYCKTP1XpCB9do5Dc2JHew8ToO/6yLBhKKs0XrF+6WnqKX9EmxoMnU901vhZ4GU2s000WgsxvTEDsz8yTy7Y7/1yIsU2D8Eprid7hbFLM9QUr7wx2WtqemBE1CRIIsowPYNRcFzTRErE1wQ060cYx1TiSGI2VvWiv5IUaARF7+Rc3xN14W6uEJD3T9vNBtECuugF/Nqcuh/YS0SGXkCF/oeHcZs1WoNsCurLq3lAPpejZ+NKqQ2QmWUPXrObktELOSJLcfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAhLTwed3jvMDDQlJFC0C7PEKVHokTx8DvE9NiC27Lo=;
 b=l0CmP5nEiUKcZUisEVgrXpzEzmJx7idJKNfySMwieBRzWk3MpU501i+XhVCSBnN8CLYy5Oqxf04o5tYnh1SzsEBnFZfzuLG0CEVXuOWh4W1m7MdCNcDihFeW5Pde09B8O5fMsYjIfOe4i0rkkpjYiBRjJgt5xSJYGav2muNpUA21xVnUAL7Ri9k37WFQd2HDQeNaaLEWHXAtLZonl6TJsGEhQxePEu5VYdlKxIbB+mvQBvTymO61aawAr9o4Ma4+jMJ8mXdu2umAMXBZ/wGNY89jBBwig1nAIrvsyiHiN5Jc9v/bcYo5iP6aldUdjDQpIYoUBUZH04/l1NdJsEviAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAhLTwed3jvMDDQlJFC0C7PEKVHokTx8DvE9NiC27Lo=;
 b=Em9e811lqtVVIMu/SPdbJammi53Wv3r6xRZrgHg65hLPoadgfd08QO5u35bUvakxZlkP8jZZDK+w/XRu3xSYiKpLaZyydjGwzAZkAd0RGJd2v53gM2affbUQZE2R9Mn1PF3BTpGCrb+HykekhNU7+zQcef5sieh5/lk4CEZf/7h8p0bum2WMSV8C/M0dOHWfeJ4Ah7Zs8D/2EEAczeqUJGUqn77O+pmo+0/o7T8aq3ewjeMwf2UR7RCU7cR515Ekj75C94O+csWz+IhVaKrwYlC+fEnwXRHAghakicqOqUyngvAMMxFXGJ7Tf1Jm85AQhj+0qis7lfMd/VHReOOsrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by MI9PR04MB826873.eurprd04.prod.outlook.com (2603:10a6:290:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:35:17 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 06:35:17 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 29 Jul 2026 14:38:32 +0800
Subject: [PATCH v7 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx8mp-usb-phy-improvement-v7-3-c385ee40ade6@nxp.com>
References: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
In-Reply-To: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785307123; l=7705;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=kkD5DNSLgW3uouyK2GclkFCmRoxH4vwZHF2L6887Zuc=;
 b=JK2d54prdel4kiew/gs9h1DHlMWdqLxyzfv7ldmz3fan1byex/i2rNzsX97So8/9PL/RxLwfv
 wRLrrg8t3jlCYNSXmOhRqlnVktFJrxNC/kSdmbwKDE2RgQeJWC8mESf
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To DU0PR04MB9418.eurprd04.prod.outlook.com
 (2603:10a6:10:359::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_|MI9PR04MB826873:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3ce341-8cdb-40e0-50d3-08deed3b8dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|3023799007|56012099006|10067099003|11063799006|5023799004|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	POScX4REnIJIugUm8LEDV5RoDfy+HQYur2p2Ow8YEK2JmVx1+YBrj02nUMMkK34DGf2GXlnHhk1Ka8PX/C36GwZeCC+EUYd43xEjdkgAcK+D4OxAxUGAx8AanIwvPoIr0FcC+GebEJs9N0QYo/yHZoHhIRLn/uPJU+SDHjW2k2FWj2nRdilE2hzshP5MyUPVx51dM7O3S9bN9zWkv0aA0Qb2rL2MwOXO/49R4w0T308xr1rbIqk39kY+YBim1M3hpTbCt1HKi6oYaxobrh3QaDB/odKkSPHjY/mvTbBVP9O0gL86bhRwzlFjaA9mODPN40DT5OnhDk7yWacw2uKeioWFDs9ZuNfqDkK1sV7SH5Bsi/GuCKx5XpXDqKEG+a/Z9XIhiOQJHK4Qd1v26dRH1L+V5PK0N3H03WxaqEIjZ9IhE8GEYnFSYmAIL9nIv7zzdnImnIb1Gn/YL+uN23nE8Bxu8attxHyuxt6eUMQ++C6qpognrAbW8/sYjECfLqMvdlmDVkj1KiGxfB6ZX5ky/zyoKftp4rkQCv/6LHmuQWmtCcXwT3GYb//73RYG4Tg3u9h1z75iZYBlUST6RsulUO/IeJRyTrmc5Dm8Qr9h3IRO1Yj6DXwsZKlU2nQNh0KUcOxzzeP1vHHDDlPGY6CaSYaO4Xd/q43N0OJYGjwyGl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(3023799007)(56012099006)(10067099003)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amY1Q0xvL2FPOFY1bVZwcTF5QTFPbWkxaVBJZXhkQmpiTDAvVjFhSCtIRW10?=
 =?utf-8?B?ZW1YdHlGT0RZbC9XZWFJNW1Rc3R5N2lJQVh4Wkx4Y3ZuanZnSjZ2cGJ2TVVT?=
 =?utf-8?B?MGZOL1hOT1RUTUN4K1I4eTk2RXhvRDhidXcrRjNuK0k5SzhSR1U0N0IwbkdM?=
 =?utf-8?B?VmdSNUFOVDdnQm5IMThWbE8yVm0rM25Mc1RZNXlOVzc3K0lLUE0wQzE3c3Vj?=
 =?utf-8?B?RnlHVG40eFdCMmRrRERrRVhveDloMHpJQlVNdXRRU3VaWXpuVWpCM1l1dzJI?=
 =?utf-8?B?S1hZendZdVkwc040MzhHTXllNjI1TE9QMjR2OW8wM3hCWENFSWFzcTRJUnFR?=
 =?utf-8?B?eDZ0NEdmdkFLdldaaldRazNoQ1AyYmdROTFoTWR2Qld2UTMwVHU1UzB3NlFD?=
 =?utf-8?B?N1AwaGVoYU15cEJFMjFQRTVxSWgvcFBkL0N1VWFIOVhOZFQvUmNZM3VYUGFt?=
 =?utf-8?B?YXRpSDZ1ZStiQWNTQklSa1lCM0U1ejh4S09yTDZOOWY4aysrbUI0UnBOSTdw?=
 =?utf-8?B?eHdSWUloMkxCOFJyU2M3R05nc1FZTmowVS8yWWpTQWpKd01Rd0NhdkFLb3hK?=
 =?utf-8?B?aFY4Yi83a0dnUCtNa204N1pJMzA5WWdBVEF6VmlzQ05NUFVWaGtiTm5QbUlI?=
 =?utf-8?B?cWZWN2ZEeXFNVlQvUTkwVTd5dU5uYWsweWpXK1p0eVIrbjliM2FYQnJPUHZ6?=
 =?utf-8?B?UEJFbm13SVFlOEx0VjZHNFdXMnFiaXhuMmRDcWhPdGZvNjJCR2s2V1A5UDhI?=
 =?utf-8?B?R3VycnBFN3lKelNLSEx5ZHZvQjdnMUoxSWFhQ2t3TmpKTUtLSkNId2tlMCtI?=
 =?utf-8?B?OGp3MU81dlV1T2ozdUNiSFBzWmpZMUp2ZkE5QzNGV3c5WVJ1alo4OWw2T3Bp?=
 =?utf-8?B?cmxmb0I0bXVUYWhFTExwWjVPTmRhd0kra2dtWUo5dXYwVlBFamx1N09ndFlu?=
 =?utf-8?B?ZTVwbnN4N3JiWjQzUUVPTklRL2ZFUW5Va0taTkdjMGVyaEN4Y3EvajFDanRF?=
 =?utf-8?B?RXhmSFFOOFVzbGl0alJZQUdlVFdvUGJjVWUvMEEzdkNSVlp1OXY3WUFaSFht?=
 =?utf-8?B?NldGZWRpNU9PcUdxNGkxdTlWWmZJV0NXQlJ1Wm42U2hlSzRPN3F2a01SRnhC?=
 =?utf-8?B?MUZpT0NwZGd0N09ORWpzbTZkSXI2ODlRR3RROG1mMnVIVFJTV01QeDZsUExj?=
 =?utf-8?B?OHZrclRGM21UYTJ5VkVkVXR2QnVKRFZvTk1aS1lJbWpQVXUyaU85L2JTQUVi?=
 =?utf-8?B?czc4cFhBVjBhYXlYK3hxYXFBam0ra0xVVWdRRGlaYkZZOG9XY0FzSjROMDgy?=
 =?utf-8?B?ME9SZU1ZRjJMUldzSTdiSGdVK3dFdEJ3L24zTC9CcU13NTBWSGt4Z1Q5Q1pW?=
 =?utf-8?B?MFk3UEkxNzFvZ3NpeDdrSUlCWnBqNWpEZGhwUGJPNCs0K25UbTlXT1dmLzRo?=
 =?utf-8?B?Sy9ycC91Tzc4by83cHBhRm14Vi8vMklVcUt0MXVvbFprVGIzSXhQc1V6WFhP?=
 =?utf-8?B?VlF4Y0E2MmlCQU82M1luU21UVjRBK1JFWk9kKzZIUVhBbTVUQTVKSkxHRHpl?=
 =?utf-8?B?R1lKSGJTc1UyZXA1aGs2SGZYWXFCbksrQjEwNkNnY1kvZmRabVdPODkyVW1u?=
 =?utf-8?B?TXR2clJ2WGg2bDJ1OUF4WmlsV1dsazg5Y0xqcUhSU3ZzQnU0VWFPWlIwaVJH?=
 =?utf-8?B?ZGpUdnhjWnYweEFwTFpYNVdDTnVZL05CV2xOcXZlVU0zN3N3NVZkMms0ZWo2?=
 =?utf-8?B?K3pZb1ZKcEFIaHUwWVFMRlhweG8vekRlNGMxa2NWVit1K3RBNFhRVzdoYytv?=
 =?utf-8?B?L3hHWnZNbEsrWlNnZGMwL3FzZExIYWRwSVQ5Zm9UdlgxTndwTzVMSFVSZGd6?=
 =?utf-8?B?NW0wM2d1dE53dXc0K3N4ZTNSRFdFc0NKYWp3QTg3TXovUmRUQlJtOGlNY3dR?=
 =?utf-8?B?akFZbzE2dlQ1U0pqbVU0S0krK2s2TzIwWDBRbHlrcUk1emlBcHltV280YjVn?=
 =?utf-8?B?eUE1UkIxTW52a2VLRTc2Sm5IMGtrNlFkcklCWXUzYlFUMzJKd0ZUQ202WUQ5?=
 =?utf-8?B?d3k5TlJCalNBYmJCbW9YUG93dEVuNEtEVExnWlYwQkQwTHNVQU1WdWYyeWF1?=
 =?utf-8?B?cmpYdit3SjVlUCtWZ2tWUkpOeW5XMDg1N3VnZEJNRUFRNUVScG04Vlp0eXd5?=
 =?utf-8?B?TmkrSEJYSUMyNmNYcjJqdlJrTTN3dTlacXQ1Yy8yL1I5NTRFTWs3VDlhTk9l?=
 =?utf-8?B?VHcyYUhObVNHTGNxNHlWZ3RhMWEySDVNeVRpVVFnZ3dmbGF6dE5GMWZWWldX?=
 =?utf-8?B?VkpUYVNaNXpzS01TQTEwbkN3cCtuOFp3ZDVJbkVybkQwL0dSbE5HODlFSCts?=
 =?utf-8?Q?7DHMhAk4v3nE2q8TlzoM11I6h9iWIZjPZ3je1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3ce341-8cdb-40e0-50d3-08deed3b8dc5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 06:35:17.1693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I01VwHOB0xvPaBPkGft7q8atXpVMOx8KaRw56mRFcGXvwq7vk7whweJsnmYrzixz56FuKDck/943bfpDfZam6HhaLGx7CY+6DMWmsvEsJ7FVBajSBfxe8jlYD2Au/xvR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB826873

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
index 3a5788c609e1..74e665525ec4 100644
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
+	if (ret)
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

