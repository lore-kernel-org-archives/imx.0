Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066681EE00B
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392522; cv=none; b=lHz09d97pXHNFbsnb6RX+LTVBJF7ikK2ZE0udTO5q5c/OD/eJaJ44pZdEiXjpDU5UdVn1OaMJlyaz5MtfnQ3XiEl33wVpEU89w6TF4AOcA9cN86GL94oYoPfvpjuAgIWeKFH8CWdW+3eDv9L1yqLEOlGPDRW1xRK4KuMCmbjFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392522; c=relaxed/simple;
	bh=ckjIG0VOwxvdz4wVKNJf85yLiENSGMM6XOvGw7SNliE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aXsOeLm8wGQQGMxTRgITgiCCB+D8YwPfTrJPVPE4XERJtX7f5xdZrTlFl8rNevf6D2XhBWagfdkyQteog0D0Xr/ayaAUklCmQnmzRvEzPxnBi4QHwXUSIoT0mtFfixTeOXfdwtoOQ9omBe7SaF9OPYOmVn+G5BJzY/1p0V6E0r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AMVyi7ak; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AMVyi7ak"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so4781667f8f.1
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392519; x=1745997319; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IaaCcWQEpgQqhrIPeRlyBC317ztdMOh1gJCguFqoNso=;
        b=AMVyi7akTfPDRmtrnkaGxQMXq89YfA5E2G+a1VSIwaCExdvqI6IqFgJ8/itzvQSzt6
         hzHEPAdtUVUcuIhHHamzYCCy//jJ1yG/MYKX+Nho5yQ04/4oXywg7ZFXamsHb6n5+5AJ
         QEwvLRzN8B/Uou62QvjybtRTgCnkkUXMuniIMhU/IJ0+otlFh+MNWVX/MQK5fzqFib4F
         lJu2gM+wBU8K19EUDa0rXupIl4UDpamw3P3l9DWeO0n0A6xd3X7SdUFOvKdUTeb74axc
         PgHqAB9npMklY7x9wHndE3bx7RFh3Ge1q2riDkDvdOLSdo3hZFxW87l8Lu1EJYUhV0LV
         QUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392519; x=1745997319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaaCcWQEpgQqhrIPeRlyBC317ztdMOh1gJCguFqoNso=;
        b=kYvvZCusGge2f/WORaJep2z5s+d520QE4DNLzy6LLIdvCDbe2zJxO2ZyXKXLpO7xVL
         SaExyyovKfoYfxxqbIzrKvURri60xvk89qShZaCZ7SH0pczeGaX6ZPdUuymfGCTY1GWC
         fPgkbJkUsn8pV3m/Deo/1toPOmX2B3cTWlsqRySzMz4DPQjj8hcEAEUN1QlZID0nXq3s
         RcS/vDr8nWDEs5q7dMNFwveJQZDowVC/H0iBuu5NODnVsU+ciHS6xPmyDcbmE+mAKHhw
         N+SYNUP5pCQROhduMkXfarPXly7knc7GOlv5v11r0abELe4zVA1LvigYNrV8wr/A1RcN
         eqvg==
X-Forwarded-Encrypted: i=1; AJvYcCXYpZ+TLF5k44xiM1V3EhlB/jdGBgtw8G6AH4v+zo50xqcTMy9Dg0yV+ZAnazaK4cpSzcM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGjir4vn3Xtr0iflxXdgq+fgzKzhllygSI8VUnYqIIs0vw6qCH
	l5NWEbLtjEAUQeYIGDTXLbjb/OidIwZ3TSWEeAAFBHEmke4uzELRGGD3IPBkglk=
X-Gm-Gg: ASbGncuInDX0OaQ0XYZLQVcR2GdE18ctqU4In4/emyyWOJPzCbbN5dUz2r1kvkTuJCR
	x6EtbZdCVlZVhJe3390wRR98KD7V+qahJxxgpYTLMRm3e6U474SabkAUyl3//HXdtTyV4N+L5zX
	++6o3f6hxH8rQ+rNtIRD0CPPu8ws902nHOg5j9kmvrBk3kVYzI5CfQaPhF0KHF+VEJPbeYQZfko
	CNPC5cgsEdLrcMkj9sP3YdaEMy0h5IoMyyhyLbh4WMp0UgCDf+/9RtDB6qTEkmHyRjC7n20hUEg
	CizNdmVNYLtXMWbAiVC6FMiPmeo1HlhXpA==
X-Google-Smtp-Source: AGHT+IHC2rSEasii9FkOaKiL6XIMR2zDQ1U/aLJaI4vDnkPd+Tv6fEi8e3lqW8dmnK/ba6s9rq+Gjg==
X-Received: by 2002:a05:6000:2481:b0:391:2e7:67ff with SMTP id ffacd0b85a97d-39efba385bcmr15370237f8f.10.1745392519435;
        Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:05 +0200
Subject: [PATCH 03/12] gpio: imx-scu: destroy the mutex in detach path
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-3-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=734;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=A6bOamIB72oLQ5hGEzR33QH/Bp1B4UCeWKdndCamkEk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOB+u64B95UsQFPMVESK2lnJJswqucR49QiU
 qM5uRtHVDiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 ctxxD/wLXd/qsQ0BHS9BlhvMEx5EIkB868jx8LxJQeZcjlDMcX648FqIzfKRWxNlFmYkizyBzur
 smmCVpZ2i/RMhIT6Sn2ZGCXayhBTCBqg8uwjgUGkLffr+W9TADoqUxL9rwOJbu52eTuK/2yg0tB
 uJS8VslXfZbqM44s0YzRxrFhegxdG2mxmjFCZ/4r8d4A86zWCv5wqrELafdwu2YU26wMONIYq1n
 DC7RgVHjq7wCEKeJS7K6+nIgyBdR46ZOaxfp5FT+1DJLWKmL/MUeSRH8ghe+oPfBbAkOuDH0RkI
 gZRLAXfIv6xR6goxHaIEzr04Z/i8JgKBWONnrdd/1blua9oeEoTbkdPP7cUk2jx3eq3vSF/HkPE
 Vh35XevREMqCIOuuNNU93pVXQc4DTRIF6A211n2SZEfwivym3fKjaHXrcfeSSNIYB6vizsyU65x
 +rkAcc5mPKOytqWK1/AlFGT9PaC4SrczhjUgM9jxQuwzBAeKQQ41tZziXphgGY0MPASvXFg2Yhf
 A6QeugM7jvnudmzpwy4MwQdH7H0H/TBNb8/NPUwO0NMOYQklfhV377LZU+yl2iiaMZzORqH+Pl0
 jrWYliVY2VW1PNVwfhIw8WKqHMuhr/12d/IhPKZ61qYFUQta3cQfZ40Ea9/Om2rjtPsHSpShQZl
 432q6n6PUaAKbOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use devm_mutex_init() in order to clean up after the mutex debug data in
detach and error path.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 99df95e65820..cf98b948f804 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -88,7 +88,10 @@ static int imx_scu_gpio_probe(struct platform_device *pdev)
 		return ret;
 
 	priv->dev = dev;
-	mutex_init(&priv->lock);
+
+	ret = devm_mutex_init(&pdev->dev, &priv->lock);
+	if (ret)
+		return ret;
 
 	gc = &priv->chip;
 	gc->base = -1;

-- 
2.45.2

