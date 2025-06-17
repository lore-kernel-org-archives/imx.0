Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0120145FE0
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180099; cv=none; b=VuSoK5UVomGkGUdf20/LNoLJ48TI1YyIJ7MkLxDuOURznVvpxincBLBLHz3/xhJnxFGV9wJ9gw9H4mORtjV7Ex5btVQufYkENzph0mdO9Qv8kzcXmqKb7dhYL34QfBwu0UL6Ihk6KV63IWzd8EIffRfnmCsICHI3xNbgBrFK4uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180099; c=relaxed/simple;
	bh=MC5yXiem/XiAOYUpnP0gGjuW0GwRYpDD+n69a4aKMJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLf7QvIWJjXroJ+DVfCWxbOY/a2baCxAMlW+OhZNhnDD0araIMbWo/40MOAZYYawTEPK8mYoNlRw+FfJ2pf8j8zHyI600aOzSw5QSw65RxhnmmEde8uhClmtDGHArRyIwDsWSycz6Mf2uOb+Cprgvs5Dk5hdJZ5YC/tdLzjXTBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=cyJeSIYK; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="cyJeSIYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750180095;
	bh=MC5yXiem/XiAOYUpnP0gGjuW0GwRYpDD+n69a4aKMJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cyJeSIYKTkiOrYuqpZKDsNZ6dqqRK/AbUA6Dwz77IgJ4xLP53jwNmt4GzOBZevCwf
	 ZBZ8wV8viSftEVK9yJgR523I219n53heonys9/4FJlTs1v5FnYTzfuFqa2xo69OAm3
	 OJKCnt2tVv28aiPtar9iQ5Hb2j8oHpJQb0eJ+N9Q=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 17 Jun 2025 19:08:12 +0200
Subject: [PATCH v7 1/3] spi: spi-nxp-fspi: check return value of
 devm_mutex_init()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250617-must_check-devm_mutex_init-v7-1-d9e449f4d224@weissschuh.net>
References: <20250617-must_check-devm_mutex_init-v7-0-d9e449f4d224@weissschuh.net>
In-Reply-To: <20250617-must_check-devm_mutex_init-v7-0-d9e449f4d224@weissschuh.net>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>, 
 Will Deacon <will@kernel.org>, Han Xu <han.xu@nxp.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Andrew Davis <afd@ti.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-leds@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750180094; l=1010;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=MC5yXiem/XiAOYUpnP0gGjuW0GwRYpDD+n69a4aKMJQ=;
 b=f4c7YwjcV/UL1ks9Ly8Byx44jZAWULoi9GjwjUjYlbG84xBpsbwHzyUiQd8EhePjN72ThBmAV
 NC9+IUFuTaWApURrOV2QgGSlId0B5bMlzbfUWSEVw3efoRIQsBZcPKZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

devm_mutex_init() can fail. With CONFIG_DEBUG_MUTEXES=y the mutex will be
marked as unusable and trigger errors on usage.

Add the missed check.

Fixes: 48900813abd2 ("spi: spi-nxp-fspi: remove the goto in probe")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/spi/spi-nxp-fspi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index e63c77e418231cd0698ffb73eeeebfbe63cc3065..f3d5765054132cd18b7257439ece971f58e9ceb2 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -1273,7 +1273,9 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request irq\n");
 
-	devm_mutex_init(dev, &f->lock);
+	ret = devm_mutex_init(dev, &f->lock);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize lock\n");
 
 	ctlr->bus_num = -1;
 	ctlr->num_chipselect = NXP_FSPI_MAX_CHIPSELECT;

-- 
2.50.0

