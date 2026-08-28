Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB51A42050
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 02:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787885713; cv=none; b=a3u//KhCHX18grwgh6bigfutkyjN1/kTlgcu5qPRA5MUS5gXzP0MTV5eOhoBs81eNbIbUFS6/QMbH5BEbDG3EyZb1yWwcXjVJPdEwRGtaN5zX3I4yEI1+qLyiTpwhJJ8Q8efCMqSjkvs7AaEPLJaa7qNazJLZjlvuETci/JjhIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787885713; c=relaxed/simple;
	bh=yP8fs+d2MnEOXDgrgJgVZJyVsV83F6VWqeAkVZ4eUHA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ntXLj/ljeayjA+XG4/iaJ687iBRkEDug/WAVeHT7g0g4buhku9KULPL+mR18D2zw3Wbdn3BH/IzuMzKLUoMkxC85S2Iox2xYE7mV6qjfqgbUQQDcVv08dsZZfXck6StaFLw9nVYw/xtbStYtYueUU+VfTjCPzFfqfcWKXrTIu48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ros+lfRE; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ros+lfRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rh
	61Qh6ZFrVsBCgYLs3Gem4JS4emlqpTjZlYOOjv1jw=; b=Ros+lfRE/F0bPT3RMX
	Fc6tA7hEFmh6KZU4+QxrEDVeHj/1L/T71PG870dWCS6qUWgsA1HnaVwrP+SAZnUS
	Wdi6rTr4cFqrInGRjdEqJfNMsxJfV1fm33R6uOHzlJcirzvCb2a5lzUaU9KdTg4/
	F8HBAiceKGx31dG9PoXqth2T0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHxgVh+JBqfuz3PQ--.44763S2;
	Fri, 28 Aug 2026 10:54:26 +0800 (CST)
From: "Li Youhong" <dayou5941@163.com>
To: olivia@selenic.com,
	herbert@gondor.apana.org.au
Cc: linux-crypto@vger.kernel.org,
	imx@lists.linux.dev,
	Li Youhong <liyouhong@kylinos.cn>
Subject: [PATCH] hwrng: imx-rngc: check clk_prepare_enable() return value
Date: Fri, 28 Aug 2026 10:54:23 +0800
Message-Id: <20260828025423.2149304-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDHxgVh+JBqfuz3PQ--.44763S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWxGw4fZw15ArWxtFWUurg_yoW8JFWfpF
	WxJayF9rWUWr48GrWUJFZ7JFnYkw47Cayxt39xK3srZFnYvF9rtrWftry0vws0vFyFyF13
	Kw4FqFykC3WYvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmhF3UUUUU=
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC3gIVw2qQ+GJ1KQAA32

From: Li Youhong <liyouhong@kylinos.cn>

The driver ignored clk_prepare_enable() failures during probe and
resume.  If enabling the RNG clock fails, subsequent register accesses
or resume after system sleep may not work while the driver still reports
success.

Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
---
 drivers/char/hw_random/imx-rngc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
index 7693328f1056..0545a1870146 100644
--- a/drivers/char/hw_random/imx-rngc.c
+++ b/drivers/char/hw_random/imx-rngc.c
@@ -266,7 +266,9 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	clk_prepare_enable(rngc->clk);
+	ret = clk_prepare_enable(rngc->clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Cannot enable rng_clk\n");
 
 	ver_id = readl(rngc->base + RNGC_VER_ID);
 	rng_type = FIELD_GET(RNG_TYPE, ver_id);
@@ -338,9 +340,7 @@ static int imx_rngc_resume(struct device *dev)
 {
 	struct imx_rngc *rngc = dev_get_drvdata(dev);
 
-	clk_prepare_enable(rngc->clk);
-
-	return 0;
+	return clk_prepare_enable(rngc->clk);
 }
 
 static const struct dev_pm_ops imx_rngc_pm_ops = {
-- 
2.25.1

