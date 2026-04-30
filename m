Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D24611E5
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564580; cv=none; b=dfTadK2pqCJOYz7p+RwmBG8TfCiSM+DeBPiU/QQFWeYS57D0esTcLX72xsD0criVIb2N8sPvVMX/WN/fcr4lkQUqKCio5dXHphJ/nt6Hd6vPcEXNuWBaxxlncMxCx96/9Cz03peg1ayhFa/vrH4nPZF+ULbniaKy1IsfMk2FoSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564580; c=relaxed/simple;
	bh=z4br5AZQGknJOMyTgfRANn3Zd0QzsedNA641gLtg+Vo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k2YUrQAsfJ0fw/9pFOP7uT+XNzpfhXpnSR5BN52XeWoZv+tAhoFIGi8PCLeRw6e7J8OkoKER9Uwd3HBN5CeHxpib6CHSGIAZNCo3ZtNNoSX7fTd1X7WHik8UjEbAULHMaasSwMQ77ZED+j6ZMojVhVn9S9FJLPV/UfFezJjm63w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aTp0iwLM; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aTp0iwLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=iC
	fiPQKy7ydNIZx9BuCZLKIgIDMxYJ5OZgWqt3I9gXo=; b=aTp0iwLMbQ8BW0a3fa
	5ijjRQ2+ANinIhkuERPsyFJ7wb9M0GHuDlAm+TqB5gvTASOB1VeTQ01lGdMnTY0u
	8Tclt/2qSSXkucmph7jZ6d+gNrIfJ567rOQBoAffA++zFvjEaGZn2XyIPWqJXaGF
	BbqJS0EklPLKkxIhxgBkqjzck=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S11;
	Thu, 30 Apr 2026 23:55:10 +0800 (CST)
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
Subject: [PATCH 09/10] spi: sunplus-sp7021: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:55 +0800
Message-Id: <20260430155456.36998-10-18255117159@163.com>
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
X-CM-TRANSID:_____wAXyu5Se_NpHedTCg--.49548S11
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4kXF48WrykWFy7Awb_yoWfCrg_Cr
	48Gr42yr4qkrZFyF4rKryfAryq9a95ur109FnFvrWfJrWDCr13Wrs7Ary5ZF15Aw45AF4a
	grZrJ347Zr9xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNa9atUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxB5N8Gnze15lHwAA3i

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/spi/spi-sunplus-sp7021.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sunplus-sp7021.c b/drivers/spi/spi-sunplus-sp7021.c
index 35601212fb78..c1870322d976 100644
--- a/drivers/spi/spi-sunplus-sp7021.c
+++ b/drivers/spi/spi-sunplus-sp7021.c
@@ -290,8 +290,7 @@ static void sp7021_spi_setup_clk(struct spi_controller *ctlr, struct spi_transfe
 	div = max(2U, clk_rate / xfer->speed_hz);
 
 	clk_sel = (div / 2) - 1;
-	pspim->xfer_conf &= ~SP7021_CLK_MASK;
-	pspim->xfer_conf |= FIELD_PREP(SP7021_CLK_MASK, clk_sel);
+	FIELD_MODIFY(SP7021_CLK_MASK, &pspim->xfer_conf, clk_sel);
 	writel(pspim->xfer_conf, pspim->m_base + SP7021_SPI_CONFIG_REG);
 }
 
-- 
2.34.1

