Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8298FC13D
	for <imx@lists.linux.dev>; Mon, 23 Sep 2024 03:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727063422; cv=none; b=p+I5YtSa001P2Mx65esSln9tafpwaDT+z0mQzOgey61tkZ4QCWAATm/IQVOhoCxo2P1BCPwrmCtLP49n1OVs1fDcY9GkCFGwL9SwchMbWptnjrRcKflN66pVrRvi6k2KUaQB59S044YlqfowySHuceFlBjTsi0UwWrQdcayGNG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727063422; c=relaxed/simple;
	bh=GXuh5s4BBb8vXbww23Dp+mqnElfyJUbLpcdsOhX8+Rw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/z+lb4Cq1P533C0zlTU9xWsv45dsVBvzvm2Pmvlayn8QgswbNovTpMxXesfd9tAjToBIV7BoUyh2xQ5PyPwG3N9HOLQ3as3erygzutXRPsUjX8/p7eoqwYMKNWcEEKFkBQSx62WTFkGjPDEUqVh8f0RpywWXmy3NvPPk8GmPDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XBpsC1hbbz2DcHF;
	Mon, 23 Sep 2024 11:49:35 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 9D6B214035F;
	Mon, 23 Sep 2024 11:50:19 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Sep
 2024 11:50:18 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <broonie@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<shubhrajyoti.datta@xilinx.com>, <srinivas.goud@amd.com>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 3/3] spi: spi-cadence: Fix missing spi_controller_is_target() check
Date: Mon, 23 Sep 2024 12:00:15 +0800
Message-ID: <20240923040015.3009329-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923040015.3009329-1-ruanjinjie@huawei.com>
References: <20240923040015.3009329-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)

The spi_controller_is_target() check is missing for pm_runtime_disable()
in cdns_spi_remove(), add it.

Fixes: b1b90514eaa3 ("spi: spi-cadence: Add support for Slave mode")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/spi/spi-cadence.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
index 087e748d9cc9..3c87d2bf786a 100644
--- a/drivers/spi/spi-cadence.c
+++ b/drivers/spi/spi-cadence.c
@@ -701,8 +701,10 @@ static void cdns_spi_remove(struct platform_device *pdev)
 
 	cdns_spi_write(xspi, CDNS_SPI_ER, CDNS_SPI_ER_DISABLE);
 
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
+	if (!spi_controller_is_target(ctlr)) {
+		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+	}
 
 	spi_unregister_controller(ctlr);
 }
-- 
2.34.1

