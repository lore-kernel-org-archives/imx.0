Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7987C4611FC
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564566; cv=none; b=Aw7DLiXZUUGn9PdRb2So5XgqtcAGmHx7Z/WA3ef8WqJm5irAXkydGDHhLne4fxJK7/PFRZdSKx1NTmYUHJzv9euL6F802okiUZKlyRx9zPZgaWcBlL2v3E3i7biWLj/ATZJlv/GcRI9fX8oh6jKU0DmCVqMnYQlXC+HM85hxdOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564566; c=relaxed/simple;
	bh=936aGHkMNUuCiorR9txDfg4259Cf7Rkfyo+kqWPQNaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MSIcMkGQjJvHa82t1i8elzDDKQk84qaB9noCRPIXtU3aeweMQq0ul6KXzMBB87MPI+9g1kGauJNxpYSB3/BIiPilANC+w/1oXQrX75Ci+hGsXgKSCsiu1Zl0NXLFSO5kuU0AHDWZgGiILWLz8zol0dF7UvDjBF1ZpM6ndWzbK74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XlMGYU/q; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XlMGYU/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AS
	93n7u+mL1S7OPp/PoO5Pi701E6fS59BvUwhYSShuE=; b=XlMGYU/qi9Z9z5RAyA
	E8DfyMJQU7Opp9AdAjrKlYYcAUb+esPSxKKAB4/6GvcFG1iIY6ADtLCwhG4rpbKt
	gKagWqTZUSAK0R0/FFwXRq0OtcMN+qiJIXCJ/iujOlDnYc016qBSpF2kks+wUIMX
	ll9lkzrcEYlut1ljJU3R0Uu9c=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S3;
	Thu, 30 Apr 2026 23:55:01 +0800 (CST)
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
Subject: [PATCH 01/10] spi: amlogic-spifc-a1: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:47 +0800
Message-Id: <20260430155456.36998-2-18255117159@163.com>
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
X-CM-TRANSID:_____wAXyu5Se_NpHedTCg--.49548S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4kur1DKF47Zry7Jrb_yoWkGwc_CF
	ykuw4kJF1jgrsrGF4fJryxur90gwn0ga10gF1FqFyYy3s8ta15Zw4qvr1DGryUAa1DCwsY
	9rnxZrykZrW3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNMKZJUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xVL7mnze1VOMQAA3Q

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/spi/spi-amlogic-spifc-a1.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
index 7ee4c92e6e09..77a2c11bec5e 100644
--- a/drivers/spi/spi-amlogic-spifc-a1.c
+++ b/drivers/spi/spi-amlogic-spifc-a1.c
@@ -206,10 +206,9 @@ static int amlogic_spifc_a1_read(struct amlogic_spifc_a1 *spifc, void *buf,
 	u32 val = readl(spifc->base + SPIFC_A1_USER_CTRL3_REG);
 	int ret;
 
-	val &= ~(SPIFC_A1_USER_DIN_MODE | SPIFC_A1_USER_DIN_BYTES);
 	val |= SPIFC_A1_USER_DIN_ENABLE;
-	val |= FIELD_PREP(SPIFC_A1_USER_DIN_MODE, mode);
-	val |= FIELD_PREP(SPIFC_A1_USER_DIN_BYTES, size);
+	FIELD_MODIFY(SPIFC_A1_USER_DIN_MODE, &val, mode);
+	FIELD_MODIFY(SPIFC_A1_USER_DIN_BYTES, &val, size);
 	writel(val, spifc->base + SPIFC_A1_USER_CTRL3_REG);
 
 	ret = amlogic_spifc_a1_request(spifc, true);
-- 
2.34.1

