Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B884D2EE8
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657830; cv=fail; b=I/lchX653PFD1H/F8j/92OAli36Lt5gdm4BfxlWYBKvvkYM1A3NTK/HtDcvGMNaHk/Ev3s/aGOQrJ32xwYIS/HXvqhi+eHhJsMCqnWhvvhG2/a6PCEx9Za4CMIs65npZ4sX1+Tq8YhO3uIpystfxFB46N2nzsYON/iBUhLf/VWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657830; c=relaxed/simple;
	bh=1QM8vymsgCzwQ2PYZkxCfpeqXGh/nBXwmsG5Mlx8Yak=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hhp0m+r+7XGEmwi3cit2Z6uAg/NvglYdVuNgn8LCAe3YLDHKkN4u6aCC9U0aFwfBNbpy/sXgO+vxHc6fbwOk0U/ReuzG1PfNDAAKDs0BZKKtffq+yyUOaxekZSDr166dNZI6SiQzl/DcWO1LATq52jKjkDwbbkq3a3GPeCkjANc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lHb37zF9; arc=fail smtp.client-ip=52.101.65.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lHb37zF9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B45MeJAksKm89o4z2ud6P9kL7CoFx4HEOD9DqXLyB5fb4mOqL4ZjPzHq4ETRbRrR+ZMEFi80j/gVT3HrCgKztBBCZpGvLge6b39vAR6yc0qaVNkFn/9dXzfchkWymfaArLfYZ7fiBoOH9vh7ydO8uFFn6KkwDOiufq2Y48JwXnQi4jgCDLtrrkF8d/vLS65Il5t4Mqk1v2GjEl2PiPydBQuUZ7sJBekwDBgsvsw5k8uUmO5nl2FrK+BgbfO5A34VHIHRB+4273sMaO81vVSd1yuB1BfsKg4cE/ptuuJVJbDqV+YAnVy+8D1jM8lDNHDkB20hdosa3TLsbhbtidYDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4aQ7aaGZk97oMFXaQvHNVpb9htpMHs2ibs1Ob5Bozg=;
 b=abJlF3nRzdr7yiFDdQFNeq/QJW1sZm2GRBgpnbbi+0U8I8GSDuAr0w/kybby4HYw6gUQI0j7np8B1SjfCKkew4fVZ74j4Y2IWtrBG2BJ+4vwc4I4DQf7RQiKjz8Hlp2VHGUl+ehD01SPpqC91W2+SqVqwEtlNiWYzfV22AUNd7bCephfvBByzf8ROB+OZZqnYnVK3kLa2N6PHYTBjt/MyIbwDa7DyI/FzakEUn48qVduKT6P9PQbt1z33+sheQ+NVspoXI9sZOPp9Uhi32uZw9xWQ60DtchD1Hvvpjf19y7E/B0OH6NU0IlynU83OW/43Azx2pyWxPClfMkEuqvz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4aQ7aaGZk97oMFXaQvHNVpb9htpMHs2ibs1Ob5Bozg=;
 b=lHb37zF9G130BEPGJKcX+9Vu90rhnR16PDhoMBJrzQGZTpgPBIExEJyBx5/M4yOXWqzwXR05xFivnPh9uwm1Rts/3PgSvcKxmShFnXubKeFwyBeYzwsTk1WgCPF0eU/9+Lekx1Fb4ook+iWKfgZOWG9xF81cOAPWeFz8c8yKka3Xp0zY8D7b5sYH81Kbr5A50bo1oczZDP+b4lKWaBTocig28ukoiPqqha+p6O2oeO9xLRbJi2yofzVb+Ue391GFceNCumpDMxpbntUVG4vW07iI6Yj45IubU75cwUa5LX6IV3xQkys6GGPbX5E5huyr6/pgT6wrqGqybsb7PhIC4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DUYPR04MB12689.eurprd04.prod.outlook.com (2603:10a6:10:661::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 11:10:26 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 11:10:26 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 05 Jun 2026 19:13:06 +0800
Subject: [PATCH v4 5/5] phy: fsl-imx8mq-usb: keep PHY power domain runtime
 always-on for i.MX8MP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-imx8mp-usb-phy-improvement-v4-5-b2ddf2f3862c@nxp.com>
References: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780657990; l=2586;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=8H1IoID8r2wj2+THghfjzcT+x94lHJQ07AmiUhjvwSY=;
 b=lOaJd/JEbXgCtMvzDAe7sKMNXsssHnGX0nh3x+8tKPjzjCmCQ45EM2rA5LrVn5N2U+JjqKJvb
 5ppGicMu6JvCHMB1wBEzEiFfFe96lnz/AbjH6v2hBUGTV3MFtBMWg/Q
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DUYPR04MB12689:EE_
X-MS-Office365-Filtering-Correlation-Id: d7384562-7354-4be1-398b-08dec2f30b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OPuoBRXteGfkSCcjg++Kt/9q+fgt2Gv1Li0WJcNfD9ujua93Zy2UuPlPy4lvxm/CTpTOat8Pht8xgPO4w+Vtt+VF1apopPayld/PO5ZzxVoXLWl5N5lbx6Rbjr/tZSpps/Nm5evFOyAthHg7GsEWr+bZy07jxx27yRxu5AZNsJVkOwqBpKVMIuwiRJmLEexBtW1r4ihEqsvDaOXalL3wm6F1ZAWmJnezJM5VzUC4dDZXjiNf37uiV42Re98zYYyBo7y+bgT+vehmTcE4FGEP7MSKENiiammiNLP8L2MRTssQ9vQ4qrT8RXW3i2z86IO8Qih/dcvCAHVfwPzaNb4IZD8gOBHvEoeLFBFRqEotqsBpT4n3N5+Df7YNb7LtbKXFTkGc2t7NSBRDd6qrxJt0pNZDDf8i/5nSLAE8eiZvN1+Flvp2JPZKq4F101l/HMzTdwW0a4dVu8wHXdFDatdq9A2B1ug5J7uLdHZlw7TUl5PLppK7RlSGv6ktE0GmebvwtjknB4fBNNg2NI00WMxtql/Bzha47o6kZIQHXbwhXirqU5hUrY7DwVKrni5dcrwVotgrV5cQhPfrbX6Cm9oYvOX1yaOYoKjnnYcX5Tp5tNWjJfYPjAdpQQHBEGln86GETpXnXL8BmDbukcynFFe8oDCwpzqntBCpwiRWz0MiMOtO7h0KTiolOA4Q3R4TDxCl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEc3bTdGdndENjlqWktPUmVvdjZHTTN2MURza0tJcnl1MXJnQ2FwTElIVnNB?=
 =?utf-8?B?MjZ5U084dHJlbUp0K2tyTE51bWZxaGoxei96TGtaenl3RFo1ZDhtcUJJY0x6?=
 =?utf-8?B?M3V4bmR5cTBHYVVoMzV3RW0rZ3poaHEzcStZZnBQczdsSnhTN25jSHY4bW1r?=
 =?utf-8?B?RnB2MWtvOThUWFQ5MHdGbDh6WGUvRWMyVEFOeXJXQzRUT1MwWkJNYVdvS1Ev?=
 =?utf-8?B?QUVGUXJaZ0VuT01Sd2dtWjZDTURGYWJmN2E1bElMaEhIYmpIQW1tSHRXSWV4?=
 =?utf-8?B?WTc3d0IxcmMvbkRyYk5BVUR1MWV3cGl2d0xLWkJCZ2ZFSGtmeFQrbzIwR1Zs?=
 =?utf-8?B?TmdqamxxTTVpOWpkWlk1bHpQb0wwMlc1WmEwbkNmY0VUeG9aalZUMkJ5Q2xO?=
 =?utf-8?B?ckI3S0o5NVJwTTRPVE5tMDZSazlJenp1MXArdDRMR1hsRTBVUnNodVk2ZU45?=
 =?utf-8?B?R0hLZVdXTUwzVEg1ekVNeXZ2Q3k1eGNHQXFvZG5wN21tcjF0My9vaUFoUVBM?=
 =?utf-8?B?VCt1d0hFb1V1WjVEN09UenVPcXNzSXRUNmUwR01ualdXQzlzaGg1TkVvOFM1?=
 =?utf-8?B?Vlc1Y1A1b1B0RTF5ZUt1Smk3SWhIb0FjMDczcEdrY3FQWjFVZk9QWFh2ZjZa?=
 =?utf-8?B?YnZKajl3WWN1UGN4cTJ2TXRxbUF4c01lZ1RES2EraVE3d2xhZlJOdENwVjlv?=
 =?utf-8?B?VTBtT2kxVkZKT0tjbXRxd2ZFd20zbWFUVDAyMVJUTGM2azFXQWpOa2wzZERw?=
 =?utf-8?B?TXZEVDk0Q2xIbDFCcTMyb2NOVnlZdjgyMytuOFA3RzhKMmNkeVFyT0xYeUhE?=
 =?utf-8?B?OU1hN2RJMzh4eEdDR2NTQWdiVzFWZ2cwam8wUHlhb1VERWI2SklQMGpjWVZl?=
 =?utf-8?B?aitTZDJ6WlBGdnYxcDh5VUJOeHh2SFdDYStLVTNRc0pKaGJYazJiTFdnYjcz?=
 =?utf-8?B?NGJacUlUTjBnWnF2eVcxampjbC9rYUhWMjVQOVc4cEFMM0pmeUREcFJvcTBM?=
 =?utf-8?B?b1ZrRFJHdkdJOXRPUGhqMDh5aENGd2pPckprZlRMMmlKNzlJbzNJNDlDSUhY?=
 =?utf-8?B?NmpZcUQ2SStlVzZ5NEhVaEZuNEdEZ2VsUlR5OUZPYytiWkJJL2F4VDE1QTZi?=
 =?utf-8?B?MFZyempNQ3E5dEdOc2IrNzhkUUhZMngvd0RlSVdiTjQrWGxidVBPanNTWHBD?=
 =?utf-8?B?aVo4elJBSjBLM2lBMDI5elVGREt2UWs2WGdGWHl0Z1NXcFZtQlVKQ2ZHQTNX?=
 =?utf-8?B?T2Y5NTRBNjQzWFcvNGJXcUVEZ0daTDFBUFgzL1p3L3RxZkxtejBtRk1iTXR0?=
 =?utf-8?B?bHFwYTk1ZXlOdXI4dnlQN1k1b3NyKytiSnQ5eDVsTFhkU1hBeDBhMDZkSjhw?=
 =?utf-8?B?QUNteHhiMm1zV0pJTkJNTVR5SnVOMTFseXlPSDJPUllyME51cDBhenR1RG9t?=
 =?utf-8?B?djRaakhSOUVzQTAwRDl5ZHlDbjBQaFZ6NzhUODRIZmowamdXeVBqYTdHcU9j?=
 =?utf-8?B?M0UyVGZYTlVyZ0Z0Tnhneis4aTdvQ0xmOGlEZjdKbkZ3Y2tXSDd4OEVRK1RU?=
 =?utf-8?B?T2M3YkVXUFlTT0tjM3oycWJGdEpnSHRkZGRmbmx0d2FQNCs1a1N5SzNzL3pm?=
 =?utf-8?B?S1EwSjlDcytVd1hoaVJKMTNQSjVCQkFWUndQa2xMMUVQWDFSRkJaaXVmZ2NR?=
 =?utf-8?B?TTNnTWNTbFh3SldDUmJVTktYd1FSM1l0VzVxYmUzZlV0S0dqZFVRUmhwa0ND?=
 =?utf-8?B?ZDVHKzZqSlAzNDRIdHVxVmovd0FnTUdHSUxCSnRXNlBMd0JLRHE1RGhJWVNR?=
 =?utf-8?B?WTVmZjU4aUFxTnlmV2VYVE5WQmNHdUpTMkFJdUpNWmFHeGVuamNzeHBEM1Rj?=
 =?utf-8?B?MFBWWkd0OWhVcXMwNG8zM1B5ZFNnRjJFcjhNS3R3Q3hmaHRHaTJ5L0Q2aW8w?=
 =?utf-8?B?T3E1bzU5SVVTU2hJeEZLbXVvM1hnWGNGNEx6OWkwNkdxUmoyTHNnb1RiaEVz?=
 =?utf-8?B?VnhJZnMxbEJ2QlRlUkd1Qm5EL0huUEI5U3Jib2djSkFrTGlXKzQvL2N4dU1C?=
 =?utf-8?B?cktrSGdnMnByS1dCeTBuYkE4MWM5S1RwZlM0QmpOT2wxTWlvVnZzb0hiSE16?=
 =?utf-8?B?dlBKTWNXSkZSMzcvU1hKaGNzNkJ4aWpEeWVaU2xTTzhPQjQwemR4VzluNjVv?=
 =?utf-8?B?RFpBYXg4MHo1cCtVVzVxRXgyaVE2R25FTHU0NUNheW1Rb3VUVE5Xd3dFSWp0?=
 =?utf-8?B?aFliNEVNUTNENFg0NEVaSkFNTHNFczNJUTJWWjFwaWlXa2NIME96SWwrajNp?=
 =?utf-8?B?cU9WWnpoRmhzcEhBY1JwbS9qRnRHWC90VDdIYkF6M3dRRkZCRzFFbnpLU1VZ?=
 =?utf-8?Q?RInhFJ5YixcIWGOIt+D3AW0TjiuGy4VhhiUqF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7384562-7354-4be1-398b-08dec2f30b71
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 11:10:26.0447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOTJ0I1ZWLg8VYsbULYjEDsUOxJHAmkF4TOzH6SOFjNUZ5H87LztJgEfTbOt8zjuEnh0KbhCR8gAzPlbGZ/o8pCHgRmbpYzjM6hk6r7WntNGLPi99CHdNw5EiMYCPP4k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12689

From: Xu Yang <xu.yang_2@nxp.com>

On i.MX8MP, the USB PHY has a dedicated power domain that was previously
never powered off at runtime. With the introduction of runtime PM support,
the power domain will be powered off if the device is runtime suspended,
which breaks USB wakeup functionality.

To preserve wakeup functionality, mark the PHY power domain as runtime
always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
new imx95_usb_phy_ops for i.MX95 and introduce usb_phy_is_imx8mp() helper
to identify i.MX8MP PHY instance.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - no changes
Changes in v3:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index e24f46d7924b..c8b93ae2035f 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
@@ -660,13 +661,20 @@ static const struct phy_ops imx8mp_usb_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops imx95_usb_phy_ops = {
+	.init		= imx8mp_usb_phy_init,
+	.power_on	= imx8mq_phy_power_on,
+	.power_off	= imx8mq_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
 static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	{.compatible = "fsl,imx8mq-usb-phy",
 	 .data = &imx8mq_usb_phy_ops,},
 	{.compatible = "fsl,imx8mp-usb-phy",
 	 .data = &imx8mp_usb_phy_ops,},
 	{.compatible = "fsl,imx95-usb-phy",
-	 .data = &imx8mp_usb_phy_ops,},
+	 .data = &imx95_usb_phy_ops,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -679,6 +687,11 @@ static const struct regmap_config imx_cr_regmap_config = {
 	.max_register = 0x7,
 };
 
+static bool usb_phy_is_imx8mp(const void *data)
+{
+	return data == &imx8mp_usb_phy_ops;
+}
+
 static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -723,6 +736,9 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (!phy_ops)
 		return -EINVAL;
 
+	if (usb_phy_is_imx8mp(phy_ops))
+		dev_pm_genpd_rpm_always_on(dev, true);
+
 	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
 	if (IS_ERR(imx_phy->phy))
 		return PTR_ERR(imx_phy->phy);

-- 
2.34.1

