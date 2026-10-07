Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010036.outbound.protection.outlook.com [52.101.193.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7037A3546F9
	for <imx@lists.linux.dev>; Wed,  7 Oct 2026 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356606; cv=fail; b=YH4zbwBG+tNC2tPvdiN7Mtbb7Y52drfaTzbbxK3OJ15y1nxmws5qVpnt6MxXFAdwl5Iheq79FZ7EnhNtsFEvLHrIdzFaw9Uale/hVbYEIP0mL4Vga0IkuMXhw9nmECoHcIMnUXfqEv6irlJvL/U4H6SucOXmHxxS1UGYK3N8gBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356606; c=relaxed/simple;
	bh=rgJ4QiBPEUYKKSBxlXOkbdt5q/l76Mke3AB/fMdnyng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TqTa3gs2HfxAIg/VbfVOPk50GSQu2HAYObAowvNyqtAuNKsMq7/pZyfwwOgIhLTze9ZwbK92L9+njAniVxCDU+4WDe6L8lCq/bdFmdLgUSXw9GWIaR0tFRn5MubNQIie3d2gej0gM+2rPxv0COtzahdbttOD7XuX7LdU0LMbYdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=T55Z3AzW; arc=fail smtp.client-ip=52.101.193.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="T55Z3AzW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=al0pF7LrG/qVWZsrqrqKy2gnVaCC1SAdOYAICGAGwNh2mDfSV0pApbQTJSV41WPy35Q8e1zcNstTPxkWjbjfbAN9CuIs16iYz1xT5m5kLX+pYoj6orqMe5DuiP4e6dzXfY8H5UR/EP8RXQHheEB83ex0RM7cVPB0yHw9MoRx8XwztvulgE/anJVkD0eZ76mXXHaAljhj4m+pTYl9zwVMHahJSH0Ncux+mrvM6kOGxDzKjZZQR7q70VgEupyNtakpPvDJUVMLomoBJEFWY5aNYvomIomLtqpZgiZx8b4Xl2yzjd1dYhy1v4fdsungqpqW20AWKvfYrT5eklgwr9Tyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txmoDk/ds2V4BjTKqJdf0tNY0fBbXynWMop4yiCdJ5U=;
 b=kN08znbq+ezSgWV268VgJsowGvhqFQx1PUDIzGBVu8+EPVHaryhTd/p2nrNy61YLAj3h270ICmeZ4/gkeJr4jZphZBweFfK0QOn7nSoPlN0FGlhuOAKFXLefssTBFqmBjy1zdxBT/cj69vsovMYK1e79zTgCYSZpu91es/c24Q4KNOJffX4ljqEjg7RouPM4fXsXUx/7qznBo5uJqRX/GSiDCaiZem+aECxmL8cKUJIMl2i8LIZGLzAueAwuQNMNlpqmxlynxnVOVKU4KknQl8fFsAXpFXJVXzt4tSvFjUoxwGUjZP2VXRHwxSSE1J8Cn8KU836bOB7CfjHR0vtWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txmoDk/ds2V4BjTKqJdf0tNY0fBbXynWMop4yiCdJ5U=;
 b=T55Z3AzW8yOTfiyHR3lUiObU+qaSZfEdEDuoBGylWREqHSV2EZafMAl2u+CHszy2fDI+paUZzWb18P/tutmm5miWEUpjbXhJHL0rVrrQqUMa3oNSaMT1jeM+9dtE9Vcb8dA2vBTqUVwXhsfHHJov+OY4oW3BRAB2GF3dptag1VCh98X7jZHQ2rr/f5QABmZIN0+LBfWxNd0y55U+c4D24z1nzecdzYZOyXVTtkwGZvvAxH6aIr6Kwmn2U4ZZ0t2R1Le/Rt5fghPdPpZ3ZV8I852Iv1ozT6EGG4yCd207ux8m1I3CXvjhdEfqP7MEGAjLYyO5tsYoAF5MESh/xBAybA==
Received: from SJ0PR13CA0059.namprd13.prod.outlook.com (2603:10b6:a03:2c2::34)
 by PH3PPF65FFFE052.namprd22.prod.outlook.com (2603:10b6:518:1::6aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 07:03:20 +0000
Received: from CO1PEPF0001886A.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::71) by SJ0PR13CA0059.outlook.office365.com
 (2603:10b6:a03:2c2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 7
 Oct 2026 07:03:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CO1PEPF0001886A.mail.protection.outlook.com (10.167.249.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 07:03:19 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id EDC311A2D0;
	Wed,  7 Oct 2026 10:03:15 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	stable@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mmc: sdhci-esdhc-imx: map unsupported driver type to Type B
Date: Wed,  7 Oct 2026 10:03:12 +0300
Message-ID: <20261007070313.863-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF0001886A:EE_|PH3PPF65FFFE052:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2de68cee-749b-438e-6b49-08df2441119a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|6133799003|18002099003|10067099003|13003099007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	rRAH6jJ2jRYsrRoMk5UE5mtvYj056VxKnzmmEU/gWu/50/VoHr+UyRiw6tUqd/A0JcyBgTdp4PwqQqBrR3+jKyBMh5YOvkFA5crI/pM/h+WlsteEdudyDGiSAej+9iY/J8QXZ43hkPiaYEsSpR6O71+1svnZjVKzn5EPmoCIa0J7LQr6DIDh1vcSGqs+vwTwymJrjOg+FiQ1iw/Wf0S8KFKGq75Xe8x1ZK/33hmueJZLrVaxPyO09XRI4pGokgISyYTjdGlZjNseDwY1UlBxIv1A/GmjmAXRQtFSHkJKdnyfAxQjCgHxUlruHwHmi8T6PUdAwIO1KDXAE2uSP5rrkgbWNDbqj1sI3fB4X4yD1d6pGTO2hNfIomwEhvnANsHB2PTAQNG7QbLcn178qE/dEsPpNP8zScUO6We6D7dexrw965t9lb3lae3NCbXSJzhIen0YJcluPu9bTiXDNrUjViGkihH7TTZcuMQmyF28v7864Pph7eRXHj8mwQOUFH7jpxM0j6Z8DOb8FxlZ8VV9+QeIjlKa3lD2dHOC8uUSi7V4DVldpOobhwCvPhv5GZuplvHQtwsPOL6JJreQqVLHVYXpowJ1mWsH3NBdICbcxCduopO0JvsNpgrGZwmW4nyX4stRlxD/AowIj8Ltsby9Aw+QH9iYhai/TkZYDYLeFKrMYi2lQ4L41HEQ1O8/Iw45IlkaE2a5utqg/8vCK+fWhQ==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(6133799003)(18002099003)(10067099003)(13003099007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	68FAnrNfZj2tdhxiGZU989QJVXdz/cIWGjPtZ1urRsduPV6E/5FoCypAPhITW+dok4DH5I21kq4eQROoMx4R2BL2ZHnidyOQHGZo//HVpOSSYfAb2v81WJ5pGW8Pfkd9hWLzueT2hyNmdy2TOfc2a46pBx9RVmNR6mZ/G3u5hxuVn5iUYeK1pNjBEuBt00yvKBMSh9oEZuUY/5PKjWSBjvWvp+WpxclDy2m4YYM41hlogdLro8YQBKUm0yIPLxANwLUFEC83e1nTBCwLeGWHlyCH4XelxTIK1KwaRhyYrL+wUyg6M2ehl+zUqnaSNZJLA38DBx3BJQJUD+Ow5r+nPGjZ6EePwXm/jIlssD2HG98xU3jkapVYzwwi1oC3qzacfeIzHPB3CtOzwRJIk/0E174yqRkvpxWj5tJ41wTap945PukCWTeRYLfYyJlQ5s4s
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 07:03:19.4473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de68cee-749b-438e-6b49-08df2441119a
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF0001886A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF65FFFE052

Since commit 5a52c5701a67 ("mmc: core: Fix host controller programming
for fixed driver type"), the eMMC driver strength is passed directly to
mmc_set_driver_type(), which propagates the value through ios.drv_type
all the way to sdhci_set_ios().  For value 4, SDHCI correctly warns:

  mmc2: invalid driver type, default to driver type B

The host driver type has no effect on this controller: esdhc_writew_le()
never programs the driver-type field of SDHCI_HOST_CONTROL2.  Hook
set_ios() and force drv_type to the always-valid Type B, so that SDHCI
never sees an unsupported value.

Tested on i.MX8MP (usdhc3, eMMC in HS400) with
`fixed-emmc-driver-type = <4>`: the warning is gone and the HS_TIMING
register contains 0x43 as expected.

Fixes: 5a52c5701a67 ("mmc: core: Fix host controller programming for fixed driver type")
Link: https://lore.kernel.org/all/20260926122908.866-1-ian.ray@gehealthcare.com/
Cc: stable@vger.kernel.org
Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
v2 -> v3: Force drv_type to Type B unconditionally;
          hook set_ios() for all esdhc variants, not only usdhc (since
          the driver-type field is ignored in all variants);
          reword comments.

v1 -> v2: Move fix from mmc core to sdhci-esdhc-imx driver per review
          (see "Link:" above); always provide a valid host driver type.

 drivers/mmc/host/sdhci-esdhc-imx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 6ab59d3e346f..931e383748a9 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1142,6 +1142,20 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
 	}
 }
 
+static void sdhci_esdhc_imx_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
+{
+	/*
+	 * This controller has no driver-type control: esdhc_writew_le()
+	 * discards the driver-type field when writing SDHCI_HOST_CONTROL2.
+	 * The programmed value is therefore irrelevant, but SDHCI rejects
+	 * non-SD values such as 4 (eMMC 40 ohm, from fixed-emmc-driver-type).
+	 * Force an always-valid Type B.
+	 */
+	ios->drv_type = MMC_SET_DRIVER_TYPE_B;
+
+	sdhci_set_ios(mmc, ios);
+}
+
 static void usdhc_init_card(struct mmc_host *mmc, struct mmc_card *card)
 {
 	struct sdhci_host *host = mmc_priv(mmc);
@@ -1952,6 +1966,9 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
 		host->max_timeout_count = 0xF;
 	}
 
+	/* No SDHCI driver type control */
+	host->mmc_host_ops.set_ios = sdhci_esdhc_imx_set_ios;
+
 	if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING)
 		sdhci_esdhc_ops.platform_execute_tuning =
 					esdhc_executing_tuning;
-- 
2.47.3

