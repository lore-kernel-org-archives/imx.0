Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2423451B3
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564570; cv=none; b=Yp0Cv1pcTtbiIhLDk7B7ln48N7nOhJ6gKxJGD4HPeX2ZRsWfzCtyTMo9zaCzo7M2sW8E//KSoJQGno34qgzQUfIXleHL09jcUzW1S5eRTm58UFhhOhcTZ+lvV2rvoM41IrmjMbAL38eAojozyExY4XJ5l0JBPMKRMuu4exdmRXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564570; c=relaxed/simple;
	bh=uWqvU3qbHx1xhUAk3pvJVkTKF5z9katWCR4kaAtFAs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tv7BjUV4qfwDSuisnu4686ONE0rEmRMWxVvyIpsRM6KRjj60EXMI6bb9PObJN3eKjIhWcvwbxa2nZW5p/a3nucdzZFiSIvF6qVo+1oV0E+ECu8sQe+MA7YFlUhLXxdCcLsaRoBxU+A4StF+zC/XQ1HSBj9d2pM9VkXVbSn8vgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Eeena73N; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Eeena73N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=HQ
	xspS4wxPZq+kXv3CrA/ZYdLYAgARtNleYvId2CL8I=; b=Eeena73NkuNk4UmjwI
	fXWJ8s/F7TmtJiTyAeJRiS7Hu1cvE/qAiLt+oLjCu4PP0Of0X9AGDalm3UUKqoqU
	SBMzo3CopvwST1ucWvHRqVzXJPk9NuPlKe7mX9gi3k4QVXA58gbIjMruGQFY+ton
	PoeU6sTJCLRPPgJIgnR8n51yM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S5;
	Thu, 30 Apr 2026 23:55:03 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: broonie@kernel.org,
	sunny.luo@amlogic.com,
	xianwei.zhao@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	han.xu@nxp.com,
	haibo.chen@nxp.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	lhjeff911@gmail.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 03/10] spi: cadence-xspi: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:49 +0800
Message-Id: <20260430155456.36998-4-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXyu5Se_NpHedTCg--.49548S5
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17Kr1UAw15ur1DtF43Wrg_yoWfZFb_C3
	Z5ZrWUKF4DKr1Ika13trs7Ja4qqw4Yvr4DuayvqF43tw4DJ3WYkryqvr9xCrW8ZF18CFWF
	9wn7Xa4vkr13AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNmhF7UUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xdL7mnze1dOhAAA3l

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/spi/spi-cadence-xspi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 895b4b3276a5..32fa19ebf7a9 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -453,8 +453,7 @@ static bool cdns_mrvl_xspi_setup_clock(struct cdns_xspi_dev *cdns_xspi,
 		writel(clk_reg,
 		       cdns_xspi->auxbase + MRVL_XSPI_CLK_CTRL_AUX_REG);
 		clk_reg = FIELD_PREP(MRVL_XSPI_CLK_DIV, i);
-		clk_reg &= ~MRVL_XSPI_CLK_DIV;
-		clk_reg |= FIELD_PREP(MRVL_XSPI_CLK_DIV, i);
+		FIELD_MODIFY(MRVL_XSPI_CLK_DIV, &clk_reg, i);
 		clk_reg |= MRVL_XSPI_CLK_ENABLE;
 		clk_reg |= MRVL_XSPI_IRQ_ENABLE;
 		update_clk = true;
-- 
2.34.1

