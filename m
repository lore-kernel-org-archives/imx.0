Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F191648CFC
	for <imx@lists.linux.dev>; Sun, 23 Nov 2025 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763929485; cv=none; b=NwKL+acIJ1gHoEj4So8mPbBv4iIBBudtmpTrw9d6YWxbzUyUiNydYJw1I+GTkoVwW2F9tQ09OFv4E2UKLiXsFTJsazuolefxivp7NwSjF6Z0PlVIzL1Vag9HCj+fT9WNEsSuCs8ubq9yIlxodxibpLJ10fVp4n8fjJLsAcTABEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763929485; c=relaxed/simple;
	bh=C4VolNS8osgWBF5JqiGi/ig8fzkkzBWyNcybWwlZlh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SX4UlF6g5dXxOnsMcPJchHUJ9fY58evszoskQ+6k8Lyv5OMqk8MER6nvnW33C43pZBmq+OVvGpx8yTKp/rUXeBfp5uQiWmgc5uITks3xixDPZ7YGAQTWU4UWr4XiMCdZ2W/IY4xhPrG7To3FMMCQO0kRsXvg2/wCTUs34UUjC/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McAnZ0A7; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McAnZ0A7"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37b999d0c81so26114571fa.2
        for <imx@lists.linux.dev>; Sun, 23 Nov 2025 12:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763929482; x=1764534282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AF5ogFOESgOt7rvRfEwnyUu5pZ0Em2kftQ5XUCG+Du0=;
        b=McAnZ0A7MPyqR06rBotqqlK5frq91xZiHUKJR9+MGpMFQf+L0wLiHSOA5Qeqg+vznM
         brILuBOdb4HsqXCZTUmHyoIDzFAhGiul17dNAQN3WPII1g8zA1kMmHGflN65yGAgNpk2
         AZN2dlHqubk6aHOCYfZogPjMKxVR93daCGE2DGZAudl3SkTHxDUXo79Q/66Yja0XGMno
         AD7J/yzXsTjbt5H1O1RXybQPnh2zuIa7euQ17oFB67A2wtwlNq5BND8uK1MD4DDN/Q25
         ZXGK9jdoEDzDDJlcjW/YIn0+bV3t7D9KPD5k2DFl8mUNhddioSsgg3Y6z+IHWI75t7Rj
         9PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763929482; x=1764534282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AF5ogFOESgOt7rvRfEwnyUu5pZ0Em2kftQ5XUCG+Du0=;
        b=o3/fb0fBYGPCZQ7k793NRmUoKmMzu6DbnVWaX5t+3LepN41w0fUXIb87g33TcDnW2K
         2dNSxQLDy/v1CbOdpA6AzALXMwgtlry+iSt6r93TMJbc7HNiGKsqOf+1k7cpCnWnjrA5
         4LTzCtoRhasfeQ27jtPtdhf9WgsC+M8VAituloMazyuTVXsFbdCigfyA4ZEQQDHmzY6D
         qRNiKUvD7Cxhhg5jZszeHN1aXRhN3QzVQNTwIgTk6A+hbFZYEFRsdbrU8r3YfmkGRXuR
         cjSg1zjWvuPF7nfY3WPoCknEjYRVpRiBThMs1o/cqVsb0+jzYUD1BLMa3v9AHA0x+HJt
         cUuw==
X-Forwarded-Encrypted: i=1; AJvYcCV8YO6ZcY8S3+5RGQ+BqoGTDZ8W1sgQUABCH3lcOXavjlvGMPfZlmbe0Hm7OtI8Wezf4TY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2cohig+wnGLjVWShfyVfYdSrABEr6cBjI33tqj8Cm2J07WdWh
	nsW+6K/fLDzj+YrTnTtHCqJxCxo6xb6B1Vaxdu19md/embcInT4zwiT3
X-Gm-Gg: ASbGncsunAOZUA5OshaZlA8CZ1PwLmjDn50UXIqTpmnaP/bFwgSpzBEuraOm+hGlVN1
	LedCnSjidxP/nNxhNimme4xLjo29Z4LAAdcsT3XFXv9UjVsfb6AIZu9tZdCAmEVjUcYg1iDH51G
	gmjBv8pXCDkgdu4Yuy5i319nZSr5TeaOaitD9oNzjJop+PkSqa3D66fM5AVpEjEB922IwTDre6x
	l/na8eYgP3dKHp5GR09IG5bjK2yM6ve1B2EcPOcqQmLhuEl1EdN1aagPa4r27HOq92jP3+vlDPZ
	oC+aq3cFDkr5TH9DQtABVuY4DPpPzoNzdOT9qUR8zDYJSnuHknbfz5U8Itd3gOO0rbrGgMOPvUX
	RHDofQbt0S5K+sI+pKjEgLautF63B1vjnZH3a2mQFaSLqAU4CTpMisOuJRsuloUkyjBQDwI3d5V
	F1nnkN8u8+ywVC8FIZbpj1f54jjw9g7y5ZQzhjkcatgzHy/pdfAlI=
X-Google-Smtp-Source: AGHT+IElMmJIMHZiMdJFwuffpKzKXBYS7kUrz2YRBC6mjXJcPZe+Z3suYg7bX4lYoavOAlzsAyWpjA==
X-Received: by 2002:a2e:3509:0:b0:378:e540:2f69 with SMTP id 38308e7fff4ca-37cd92e0edbmr18198111fa.45.1763929482031;
        Sun, 23 Nov 2025 12:24:42 -0800 (PST)
Received: from CryoVivoBook.. (176-67-24-127.dynamic-pool.mclaut.cc. [176.67.24.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59d3esm23275771fa.14.2025.11.23.12.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 12:24:41 -0800 (PST)
From: Oleksandr Suvorov <cryosay@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Oleksandr Suvorov <cryosay@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: imx7ulp_wdt: handle the nowayout option
Date: Sun, 23 Nov 2025 22:24:33 +0200
Message-ID: <20251123202437.2340955-1-cryosay@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The module parameter `nowayout` indicates whether the watchdog should ever
be allowed to stop, but the driver currently ignores this option.

Pass the `nowayout` parameter to the watchdog core by setting the
WDOG_NO_WAY_OUT flag accordingly.

Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>

---

 drivers/watchdog/imx7ulp_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 0f13a30533574..03479110453ce 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -346,6 +346,7 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_reboot(wdog);
 	watchdog_stop_on_unregister(wdog);
 	watchdog_set_drvdata(wdog, imx7ulp_wdt);
+	watchdog_set_nowayout(wdog, nowayout);
 
 	imx7ulp_wdt->hw = of_device_get_match_data(dev);
 	ret = imx7ulp_wdt_init(imx7ulp_wdt, wdog->timeout * imx7ulp_wdt->hw->wdog_clock_rate);
-- 
2.43.0

base-commit: 1af5c1d3a90246a15225fc7de0ed7e5f9b2f3f98
branch: master-imc7ulp_wdt-nowayout
