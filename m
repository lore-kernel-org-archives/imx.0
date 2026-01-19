Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11903227EA8
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804990; cv=fail; b=JKy2n1wPwdmQ0xp1M9J1eWW1ALIA6b/ph1LELj3/sUtxHb1xAeSikUrmGWayfVeNUCrio+vp1CQkU6OHrvVD+BThL52tDHJufuBiPng/BqoiZqHeItZGvM7y8gLuKq7EAAey+PqwAuVhgArNArJxpnW6zrlYlcy3wgHypB+ka28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804990; c=relaxed/simple;
	bh=To4J0l62qq3QwX/5RakpM9+w6u7ELJ1q+ohMkCDN+yc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p3LNVTntG3WfU/M+4WE2c8QualnzpE9ECh8b15tDSfIe1rN/rbgm75/wA6+FslrhWXHbCtY195YEf0Alvc7T5W0OT6fpNZZSCViHDgfUJcBylbxaGlxanTBkVlE6L0BOxNUHfONx00EwOe+l9UyuzQwS11ymftsy7Vd6sQEHZdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=alsGbIWf; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="alsGbIWf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ni9OXpPquJShAQM53os9F1NxUOshcufCsceY2ENWk816bdQ+xiHT4ed1S6/FRLzMYHZ4ghXzlhSzeFKNK4hVWnVEME+Vp6dT0BQU/z4GQI/TxnJWOXtV1L/zReRagcFY7n+BpYUgj3vDc50R1GueXSf3mVjOLEr6R9lnilgxl3r17yGdpWvz5GUqoVloaHCZTyklvOkN28hlMS+TGodxcjmOSF/wAAlu54l1+LjQTVVFdM2NW/gVFTcixKyIKcsEJiloyurp/Ui3bG0V0K85KlWggI8YO0OEeEEZE+V54AFdBL9rYxKfeM1yBYsiDTyCstMvG2DrT/9hEjkMmJMr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjc2tjB65VtqJ88t8MARV3SuYR8bC7fL1jSceNYyj9Y=;
 b=ruBVf4OR21Ha5lD43J4GWyAe06Tb1yQ/EqPfdjWa/eqgwoVkm1rsvDYjlzuxP/LFV+Vci+DWywBDKkFVEGguAVwfltqENd1ruUOrISrpb6+6j+aWJY+fpk12V3F5M9lI6m21/vDrWxtdedJ2Zf5/GFTHqVd1BQZLDetsxPBdMp0gqYHLtS5UR1ifKNBmq6mmBmiDJ4iFPoQVo7yr0MEdcKtZBH49xGPV33Pv84ErEPs4dtmiRMQXDHSlZOmdW6kqEB8549nDL0OALrGNtlOfiYcBN9ozjcTuU6hKTm24q0Coeu+hON20vvw3+Z0lgJWjRAEqNGQqVXiepFe8uHs1xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjc2tjB65VtqJ88t8MARV3SuYR8bC7fL1jSceNYyj9Y=;
 b=alsGbIWfk443JU1RQeRPWC7yon4Kqbj7KpB3jQ31O3j+R1GrqynXjYjYBnB9Z2nx4AvzVnQxBOFElChX9wuADW/4dZyZ6EI+k3U6OhUe1zcGoHsIVo5bZIR/1EvgXpoYCKIG/fvIkiRXsT+dS18NVQ8KK9jvoavYYABvov2jY7JXIUwW3LAqpqMkrXyq+9QxWJJ5eHHmgY9Ah1H23589rjgt93AmIS7fvimrhjbSwppfacpGwMKIgKk2zTaF9tuU2qSm7TSgIewBrCWwe0rrJBYQ0WadvinL8UYX1EaJb6RXJifqPaoiyUxaDrpaykva8NnrOAdo0a17Hk51dFBJsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by PAXPR04MB8492.eurprd04.prod.outlook.com (2603:10a6:102:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Mon, 19 Jan
 2026 06:43:04 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:43:04 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v1 3/4] clocksource/drivers/timer-mediatek: Make timer-mediatek become loadable module
Date: Mon, 19 Jan 2026 15:41:17 +0900
Message-Id: <20260119064118.2493736-4-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com>
References: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|PAXPR04MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b8b0d0-2b31-4438-b9e5-08de5725ff1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J1hLIOVYNuXeUYSA63b5FNnOy8FAgrcqRnp6Uq+7oYCv8AsAJOEmAlJ2XhUg?=
 =?us-ascii?Q?Y2fPGftuTDyjzD2TGbBU3eBQ5d8C1SKTzK7iCQPsbpPu03WDVTCSmsx1pBHW?=
 =?us-ascii?Q?uCcjOL+Lm/UQWLxmdIEaRv8tf8eX2eNUDg+kAB9JEhGinR+ZACYAeYLf5mSS?=
 =?us-ascii?Q?oGh0w+zobznft0opOspEzvQs4b2p9bOsyf3/vG9og6svlhlq+g1tgwY4OTWN?=
 =?us-ascii?Q?ajh7QcL3k3Ttd8reRlgBdAonj9RU8mP/SWdUzLJucOvOmxb8n0km+9Yp84mE?=
 =?us-ascii?Q?ljfmVD4XY7utXmJfd4pIGihY3mpbPDdK0JHfREEywH0DkXPgQPMwcFJVvgBW?=
 =?us-ascii?Q?gjxFEf02+LL+8p4a56peSa5W1K/jt/VVYc46YU3ykGuLlrb3/Y8UJCDeEm3n?=
 =?us-ascii?Q?6cBymvsvVnKpdKF34/eZb3EK1dMGZftv6Cze+ygfGLL6tqgh73CPVmDq1m5+?=
 =?us-ascii?Q?edMJcHA8IPIutcSussCUx0Y2nEYlqXKjSfJYP/7CmhTMzVn7WX4eVZayvqXh?=
 =?us-ascii?Q?ZocMhG+DaKCrkliwY9q4D+Sc49/sWbsJ0lB4gwil3xY7lY9utMcHHyFhJM3g?=
 =?us-ascii?Q?a0a/tHzrzOR/pecAbDARPV9h68UVnxYbyWPwWfZ+nlVbnZh3gPoBoQmmPFIV?=
 =?us-ascii?Q?zhTfQCxs5fYdHf9kJxl8MJR4V8pBv0frIKXyzRDZ92qRPbMDVyHNLLJtnNj4?=
 =?us-ascii?Q?8MTvwL4eBmHUGTDWC/5M+wrt7ePVc7FLZSSur+NSMU0GBYJplfwx2fK6KOrr?=
 =?us-ascii?Q?OSQoj6S0Ln/JP/9ehbRd8Qnw+/Wp5l68i2hOj99vCVL2hc9eIu6wuG3c1ZqT?=
 =?us-ascii?Q?f+/sEzs3eHE+FVjeEyaUz6OiggKlZwf4WO2v6tbKrtS8jPjEody/DvCmxymU?=
 =?us-ascii?Q?ExPoEVqa7+q9dVSZEpdHVBT95xgguIWs/zXuW0Ma72ymxVS1fUl3MsbKOfx6?=
 =?us-ascii?Q?Fp0dk7G5HCATRJP7cvGblVpLqgt9T38CJdQw5s63RANj1zBzguteupLG4vU6?=
 =?us-ascii?Q?ipScOIUlPHBrMJ8bXuHM1VgtGv4FwSwNtEQCmucSlHNAOlTgKRMGqXhEGxct?=
 =?us-ascii?Q?GfPc8C/F/MXNj1NxOQ7IX+uaqG+pW1I7nlvyXdlZTW6MSMHHmOpwkQYuw8U0?=
 =?us-ascii?Q?ThtTkzRIwbP0oebL6Ry/EdziuBoxEk6SWODLVgSuWuiuHJ76dCiqBjLrfLEp?=
 =?us-ascii?Q?i8wYEFF/mghMd3V3daiEvDcQvYuE2KAicUtFXRimJv+sATdbXN9Sk+EwsL6B?=
 =?us-ascii?Q?m3VqSNEYbdTsMw1SQvYCVHaHsaNtan/lvB9hwqvmGudbqcaNuby0CFN70aJo?=
 =?us-ascii?Q?v1nxXyubuFuKiJ9KaER7MApq30ZJ424AZDmGAOXWie0F3ZLdSVXJjJYb/lWR?=
 =?us-ascii?Q?/WTYR8NfCiEpviiTN4GU+24oMskqNmDjEz50yS6UvmYp6evacbLEidKr2Wla?=
 =?us-ascii?Q?xPa3wTeGSfH9wPZgGSfdH1zMOlpsHICHZlTeOe3+Nk2/dYpjvGADVc/xsMeY?=
 =?us-ascii?Q?NrcZhynWSNQ9emUUVqZ96BPj2AW06F1BExmKz+/ixBiY83lnagb7Imi9n+bN?=
 =?us-ascii?Q?RAGNi1p5X0Ss1TTgSA+RZ+Eh6yKDYZGkgBouix7cLVTd5PZpd39kxA+fN0JS?=
 =?us-ascii?Q?E3ivOtvqDrstjL8fr8mCwH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gd5v8+lDYPkKvtFjtFBtHsyNyWiTOSlballYRlIAqrU/rsCgGh4s4mTD0j0W?=
 =?us-ascii?Q?2C0fzsNH+3ZczUYbqoTf+MDuKMkMzpJchUTAoblJ8ud/br1hpux8A2QKafyS?=
 =?us-ascii?Q?fg59S6j2ZIov/I7TpfQ8zeWKhN31vIJAb3tkKoFF7YUcxuU+PVCGmzAr2Wu3?=
 =?us-ascii?Q?YKTLjtWZftg7xkTR60g6uFNKFpx/gtkYPMn2HwCzqvLvNzJ5EWMLFfBXqD2q?=
 =?us-ascii?Q?Xfl6UoZDK4BH1QpgvX0tSJDEiZGe3VNnR1faU2r3IBzVA52rKRMbomAZ3JFU?=
 =?us-ascii?Q?Kc0qWJQaDKfYCavUF7Rta/TlB/yer9tZkmbmIgLAQ/sfedOuUedoZk0Pxkqz?=
 =?us-ascii?Q?aWGFYnkKGw0KbeOj4ztVD1hD9Wx8pa0aKn7NVbP8yRG68UUVxgHaCC2DCdxs?=
 =?us-ascii?Q?THjFH/puWu4Hc4/wiNQ5osaazJgPyN9p4o+J5qwo20qxMmEjUcxt6JGnKCNL?=
 =?us-ascii?Q?DsH1yKNL/QpB4REhelomIqaGrR7CWU1t1HYi1Co7O0WhA5vjgbSK7lfPBED6?=
 =?us-ascii?Q?mIPV9AYlxw/3hMl0NnGwu5BLXQsgjiQ+Hsc6tiy1ThGQDsskE9pdASv+6Zxk?=
 =?us-ascii?Q?DNy6lJOPoe8mH+h6qIJklJ9wL+dSL2vONEsrY82vuI1Djz6mHOIxNI9JQS9d?=
 =?us-ascii?Q?vOgI1SfeTGXP45p8zDVNNtKJlbTZV7B95YBff8QtoQCD7G4usj5eE4XdvmmQ?=
 =?us-ascii?Q?61sLxf9xQ/2uWf7vLS2yEt+dLCnpLxx6BrWia+udtLUUwYx43hpq00XmCa6c?=
 =?us-ascii?Q?px3YVtrPfIQPBWEgAsM6QIoYGeHKD69Zqxec49zXiZGVzS1eutx03b3tMphR?=
 =?us-ascii?Q?3CtEmgEquDATOZ/t95L8yadMNwOUA3ZEhcHnrxbbyoxPjZsLh6MPR9LBCZor?=
 =?us-ascii?Q?mFjgIT59sHQBuw3xvHkqnXUMDTz+jhJ1exlXCHoLYZGUAEez/WzYAXN2pkXr?=
 =?us-ascii?Q?Vb86g0tlmLaNrJhJ7S5AGedanLVzNRMPN4iI7uNWyFEG/7J4IN7oU0u+pc4J?=
 =?us-ascii?Q?U9F+wtKr6Mm0+pclXgjLxqcfcl+Kdqo9+lmZehNF9+9f0PDcUGTCbBNiokdA?=
 =?us-ascii?Q?ToS5hgTrsBAn9R1hxfHpgcLVB3IKw/p3ZIMB7i5oRDFwOmNUxIoFi1T9cqam?=
 =?us-ascii?Q?hoPC2Z++MSfF92Dsg0wxydVuIa7TCGOFKXFIORySDqyr1WAFeWzyaxvghYFv?=
 =?us-ascii?Q?F5HFz+x1fAkMjjlvaNvlw2RlKbSVQ0W7ws0BrAeCFDpElbeAgbPeVaWrDZu/?=
 =?us-ascii?Q?I/n8Jf3e/y+T3PbcKys66PfRyePGEjRaWiTuWLyng8zX89B59g9yEbnAMH+r?=
 =?us-ascii?Q?04flD0+s+AlTlSEqdMsRS39in2ue9XjqYJcF7d7nFSInHZZuOvbHizGqB5Jt?=
 =?us-ascii?Q?m2x4VqGxxe19RSXSK/tTUGP1hqEMI8joyAfGZYW+sXneRG/BoABXbeNz4Ai2?=
 =?us-ascii?Q?MhTOfvH+JjRPfS1gOf4GwdyhdfXgDpBhFu7gTPSqK19llaSMNnRIEiow/BMG?=
 =?us-ascii?Q?JUzKItxPM0OYwj9r4Q1INYDT6PIoacISzOznq+/fIxAmKGyOucS9LW5OMSXa?=
 =?us-ascii?Q?MdreYFHSqNGPbbYxKpMPiMeo+Nuxhed9RqXRFUIiEeeRE5ytOwsYN4482fm+?=
 =?us-ascii?Q?JbzLMLD/z5rj/5tbxfso+u/7aGgFZwudVYMNhIOgPcjsVOmpTOe3L9BzVLmP?=
 =?us-ascii?Q?DImRXeU9FkJMZ7uybVTXE2mLNMCiAGjwWC9O5OWw3rB7izC1FMZBQcFRYiCD?=
 =?us-ascii?Q?f4Jora/gsw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b8b0d0-2b31-4438-b9e5-08de5725ff1c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 06:43:04.2234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SVz+KLq5DsuGybgf+V+1hpEDGN8sYLEThToZU7+0veDQH0yemzt6ea7TG0N3fln9GBuleEUxmtzVi9YMil0Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8492

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Make the timer-mediatek driver which can register
an always-on timer as tick_broadcast_device on
MediaTek SoCs become loadable module in GKI.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Tested-by: Walter Chang <walter.chang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clocksource/Kconfig          |  2 +-
 drivers/clocksource/timer-mediatek.c | 33 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index aa59e5b13351..7d0d55c91c3f 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -487,7 +487,7 @@ config SYS_SUPPORTS_SH_CMT
 	bool
 
 config MTK_TIMER
-	bool "Mediatek timer driver" if COMPILE_TEST
+	tristate "MediaTek timer driver"
 	depends on HAS_IOMEM
 	select TIMER_OF
 	select CLKSRC_MMIO
diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 7bcb4a3f26fb..4ad4bac6f34b 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -13,6 +13,9 @@
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 #include "timer-of.h"
@@ -337,5 +340,35 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 	return 0;
 }
+
+#ifndef MODULE
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
 TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+#else
+static int mtk_timer_probe(struct platform_device *pdev)
+{
+	int (*timer_init)(struct device_node *node);
+	struct device_node *np = pdev->dev.of_node;
+
+	timer_init = of_device_get_match_data(&pdev->dev);
+	return timer_init(np);
+}
+
+static const struct of_device_id mtk_timer_match_table[] = {
+	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
+	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mtk_timer_driver = {
+	.probe = mtk_timer_probe,
+	.driver = {
+		.name = "mediatek-timer",
+		.of_match_table = mtk_timer_match_table,
+	},
+};
+module_platform_driver(mtk_timer_driver);
+
+MODULE_DESCRIPTION("MediaTek Timer driver");
+MODULE_LICENSE("GPL");
+#endif
-- 
2.34.1

