Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013013.outbound.protection.outlook.com [40.107.201.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110C83E40EB
	for <imx@lists.linux.dev>; Tue,  6 Oct 2026 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283997; cv=fail; b=o0bAODQkDcx5dCsrSWdLZyG/LkLvozkyyN+HCAwiDa+najnHvvCMWjbZoOvoMZ5kpPTjDEFw0+OH4+aRVSjpeq57+vBKGc9xjPw8pCu9PFgyYvx/0ZKpw4lyLR8YWWPpdg4tVVHlu337yCQkVP999uS1vqP7Vw3emhe+v6uWoaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283997; c=relaxed/simple;
	bh=uPZYYXf5r/uasy6gx3mXXNCWr4RoEQoYhASJoM3YLOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TFS8kOdMxLuu2YaSQo4YDGqdMxWQYX43vf70cQpaSW9VTJk3CRy5J31YZI6luvT5C8B1f4VeZNPGAIw73GUB5p+YvWe1A6nMdMstU5R7wN9EH53CqKWDqu3wWesB2+xAE1QGVrO/Ze2Jt0sNqkewPBFSxf0nW57L+yicFqQe/FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=gfM8Ggzc; arc=fail smtp.client-ip=40.107.201.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="gfM8Ggzc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGCIg+UAlYDxl/KlFD7DPTc1D9q8bdMleBwNumgJfwltQFNlxZtFokAjejjhNqwAMhfpC0dmQJTXgs8NYZsRitwXPpJkZO61JtpAejD/WfSyySLzf4KXqmLrbExDbAoyAOvpMU6687ijeQGUJmRF7qY8NQjOUP4B+5Qeepxl5f43+AAMDCIhidMMdzyMPuMBmKXowNFwjJBcpSTgjMeReKVDbpyCkJ+1swkfbETaYkYZY+SOyXflVWzwIwJBtPzcXJ02knL3baa9qoJfVrgX03hdGiNpH4icjljYAgwzX/JRs/2RbVSB/lOL2vVWU+Ss76NcxMDD7Mcopw8QsHiiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSgi5zuM2XAqa42vQT6O2w/3Bh2HnoxcNEP2kmrFSoM=;
 b=jKiTUdrKTGbaT3YPgZJiKqSMbH6Pq/hUmIpTqZ4wcodYCqfehp26tCf0cdH0fQtq7F6BIA+mpcN/PBNTYXzMjqwANHFyhAvB7lv3IoXBNdV/gZRc5841o5VDO8Q0MWy7g6lxNtFaVcLGGS9mCfEnILBu7cFREo6L8e59GY3GFnhAUnwK1M9uXJvpq7/9tQqdzMlOJIWIA6kdIUm7yts3l1PhrM8xKxVz4D/78MscMStwRtqtqcovwQLFKTPTQQYx0O2+mefVtUeABzpuEL9JLzT4/+O2/M7ulS0xYPqX0N0DlzfQeShpi0WgH35XwrIjh4OYXM97EArpxwXgV4dxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSgi5zuM2XAqa42vQT6O2w/3Bh2HnoxcNEP2kmrFSoM=;
 b=gfM8GgzcuaaTCjdzI2NTgO+cQE4v2XQYBHGHuB2/CqPfuQVEETyV7ZBDaubsnxvESxSpX8DIpLeqWWMJCjoOfO1IasJ0hmPScyVKQltH51KZTtrwHTC44AV/GCmMjc1y9iBGq8ajNEih29hrXx89HXKaKyb3LAUS9BfnD9S/wWlXLGD6UpVIdQei3rUKuf8ix+s2UE3rzXekp2f6NRUvafvpj+D88I89azyWPNzVr3YyIK2uAn5r2/v6xFzNJYu3Qoy5yTw1EgNDkPxQDc88iNSZMOAMoALZ9Xv0VhXc7OMron65rt67okgTmEFou009w1uWE+ntjLlj05PA9v5eiQ==
Received: from BN0PR04CA0039.namprd04.prod.outlook.com (2603:10b6:408:e8::14)
 by BL4PR22MB6000.namprd22.prod.outlook.com (2603:10b6:208:5aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 10:53:07 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::a3) by BN0PR04CA0039.outlook.office365.com
 (2603:10b6:408:e8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 10:53:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 10:53:06 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 4BEBB1A2D0;
	Tue,  6 Oct 2026 13:53:03 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	stable@vger.kernel.org,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mmc: sdhci-esdhc-imx: map unsupported driver type to Type B
Date: Tue,  6 Oct 2026 13:53:00 +0300
Message-ID: <20261006105301.996-1-ian.ray@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|BL4PR22MB6000:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 47af5cc9-5270-4aa2-0673-08df239800ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mDC1jBwK4bG3pLxYwTwfK83xpmCFXgfBbEcbtt73aXMk2v3cWwi9U3ZJAQ/lojqZAAi2ALMbRpSwffK3zNggX/SLWGB4efxNrJ/ZvA2/OwewMnE9sfgzddN+vitH8hYIMgD/eH8vmk9ca7eNx8+8DFrTbe6McPhnSVcX4TY6+7AGgQEleXS/aNVRvqvBxGP80CLhsqrcKFyIdcXWk6Njjuxiso2Uake+5t3BN+L0hUSsAbWXgG9sjMNZKOG98bK82v3vDOgyKthxory27KJNMxhiCMZtIyOxpr03Rhi8WqK95gO1ufIamqCMwErsXMWvMe0FhPNtlyYmjXBEScorMBZPmdbrr/DfBHU822SMruLKggCr0+EVhh36Hi2Y2j7iYwUJRv+ExKK1SgEfDXbSJWGWAlLIYvDzfvl3QflH480G+NZ/t5aRlY52SlXR+HS8hPUzy1Bh87yPKNOysxqr1p8v8vbgQPcVoG5odNTW+O0qGTS0S2ESOqpbPHyofuleZ90f3bk+7rD7R09mZRV0U8iporlCKsX4SpRvnyvF8Fiez2ZASjn2/kVFJ0CNVcY42FQhQjJgzQhU0zqXoSNmLPDDwuI9o7fEu22pC83/+frHEQgr2ngyFqJyWtczVji/OMJX6EkcO17mJnxrZQpIYl7DZBj4qhtjCA73c0/g7c5rLLuOF3bJxO5DhQ9voue7kX9HKhf2frVskgjlZQQNVA==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZLZNZW8mTTgSbWD9FPoVNkOvz4WewCFfe/hxPoqQOBxi13LWyqo55cx+HavDpPGvPeY3/w6nPxDcPyd0iB621eVNe/YNREw/Zz17CY3dCMfL5vn3Y6uUB5XxJtIvUHS05AC9zm4cSeqGGl7LSri9314ZSrUzgNRnNXX6qw1AX3CtnNzizfSJEpvuAmmLeUw94jr/wYUrL36CQo10fB8u0MdzGRBRDioIDbldQY6v8RYe1s5/cCT2QxHdmfzC2T178QSnfkenzszQZjHNUcleVWodbsMWyn5CS3B/mtbscSUaFTWLgQhN8LqJP56FW6ywusebYAbwu+C+wXZwkyTyEXt+FCIOQEx1WVy03A+N0RkAzK0KtnQyRKiV6koMX1LtBxO9hRuulkML4ef5Chk3PdpUNhKGbz4ax9/kwpG386BlhvygFpbRZYs0Sb7QCS8Q
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 10:53:06.5177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47af5cc9-5270-4aa2-0673-08df239800ec
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR22MB6000

Since commit 5a52c5701a67 ("mmc: core: Fix host controller programming
for fixed driver type"), the eMMC driver strength is passed directly to
mmc_set_driver_type(), which propagates the value through ios.drv_type
all the way to sdhci_set_ios().  For 40 Ohm driver strength [1], SDHCI
correctly warns:

  mmc2: invalid driver type, default to driver type B

Hook ->set_ios() to map any driver type value outside of the SD-defined
range to default Type B, so that SDHCI always receives a valid value.

Tested on i.MX8MP (usdhc3, eMMC in HS400) with
`fixed-emmc-driver-type = <4>`: the warning is gone and the HS_TIMING
register contains 0x43 as expected.

[1] 'fixed-emmc-driver-type', see JESD84-B51 Table 206 and
    Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml

Fixes: 5a52c5701a67 ("mmc: core: Fix host controller programming for fixed driver type")
Link: https://lore.kernel.org/all/20260926122908.866-1-ian.ray@gehealthcare.com/
Cc: stable@vger.kernel.org
Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
v1 -> v2: Move fix from mmc core to sdhci-esdhc-imx driver per
          review (see "Link:" above);
          always provide a valid host driver type.

 drivers/mmc/host/sdhci-esdhc-imx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 6ab59d3e346f..33f63c6dc8ce 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1142,6 +1142,14 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
 	}
 }
 
+static void sdhci_esdhc_imx_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
+{
+	if (ios->drv_type > MMC_SET_DRIVER_TYPE_D)
+		ios->drv_type = MMC_SET_DRIVER_TYPE_B;
+
+	sdhci_set_ios(mmc, ios);
+}
+
 static void usdhc_init_card(struct mmc_host *mmc, struct mmc_card *card)
 {
 	struct sdhci_host *host = mmc_priv(mmc);
@@ -1949,6 +1957,11 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
 		 */
 		host->mmc_host_ops.init_card = usdhc_init_card;
 
+		/*
+		 * Validate host driver type.
+		 */
+		host->mmc_host_ops.set_ios = sdhci_esdhc_imx_set_ios;
+
 		host->max_timeout_count = 0xF;
 	}
 
-- 
2.47.3

