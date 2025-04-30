Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692382185B1
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001713; cv=none; b=YL8YBuCWM6H8cs18z0BbyogzOziCUOdx+xzRIqoL5DdjZZAgQarbdCg0yzoaS86k4z7Y2WzYTGHmmUJ2aIKkyhPD1AKjGCBEUUz8ZVu1Ll5diPbKG6EGPkSo4ERjM2GPu85BPixu/KnPKCGU33bsS0hhEkr595QWgUZRgX3BkIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001713; c=relaxed/simple;
	bh=Tgj0b8wEyAscpECMyq6oZdPbM5PjpTjZ9DzPNxVUtdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idQADvCLurazqvXNeb0oGLxxFgvBJFYCfjSyjbY3lMCC8qMCHamD+j076jvk+H4Lz5aPrqK0x0Z3i0Sot8ZNoPgqxnB83koN98qMchS8WrcbB9gXyR6fBiJAxmbjqbDjE4bks6k5fjS42t2VfOVvE2imtO4vxGhMYF4+kIO1o1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zybp69kz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zybp69kz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so41099905e9.2
        for <imx@lists.linux.dev>; Wed, 30 Apr 2025 01:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746001710; x=1746606510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQU+bng+xkR7HviR9k3Fod5rLUwRR2Wp2EYNWSD72hA=;
        b=zybp69kzrPRsdhqTFvsFm9qiN/4d78IPlO//kt+NR0qsu/pjshBS4JIqgBMJHbawC/
         pbpkqUGO9vywUjyvtWnmYXIWVpZ7c81/eBv5sMoDbxVKfL4sIbETPo6KIqIwHI20MN+g
         Le9BfP+rst5IHXap2m/0ovniR3m3EPlDTrcDk0Pf5P1PvFmjk8/QF1jUP+Be+eMAaoc8
         ikCMqxTViA2PP41gJjZ67pqPQjEsaXnyCU/uVVrW1i4LBJsfRBiBN9vQ5mWgGbxWeNLu
         cINM5PQSyuWIdYGSoEfFa9yidApA6gB5M/CuOmBmJP2m3fjzDc91FU/ldXDfxMpV9JzU
         xBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001710; x=1746606510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQU+bng+xkR7HviR9k3Fod5rLUwRR2Wp2EYNWSD72hA=;
        b=xMrp4qr1iuxywB1QlNB/iu6H+AqkXWOuPHAuJ3G8p70k5yoKwEpNwIbeAYI57quDzE
         z+YwMvu7ia4Smjv479oVEgepgvPLMa2YzpXNXTxQrJ6gDFVv04sP9oEXP6KdomLOz3o8
         jLCnyM4igZFr34Da7nJVx3U+b0s7qiFk6uD1l/j577z9aVPgHZZ7YBn0mxuMhgJd+mXG
         +vnLj+6NgrD8Mk5/tYDavYyn9RCgkooseKORQNCC8PRJ7ywxL9EayqOhofpAXPcUolBg
         aeo/3lVtUa53NAccJxIOVoNEGTcIoNXs3LcuCmlsR8v47pGWq+htBGYh31aJLu/g6EzJ
         O/vA==
X-Forwarded-Encrypted: i=1; AJvYcCWb/ddrHXt1xhDPSOggz71PWOJUD2dyySiWcgwRjFEXkJsC0AZRr0wAFlSm3j8MaxV/gow=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxIqtOkPf4jVV/kkyo3qRpaAdE10cCFxUFNNQBjCSDq2hs/Zel
	BXdbLbQ3JczBqZHEePy/AxxwvArpuv4JAWyOq7N+4G9aikojccOuQ1KKnU8a9pM=
X-Gm-Gg: ASbGncsroBKHRh0+8t/Ph7LSbmHUNVl6O1jvJpvC7naCdYm+WrXm8JdZny4A5FRTcO3
	WDZi98Q7XTvQNVZx00K3g2d9RqOGJs25CXfHFw2KqHyz2uA9d1AFR74PGNPqN3rJU+IHoY43K/b
	CxbUu/iAQSswq9MilcuAB7eUoJJS5yj80m9UbG8uheCxMAg3rxn6AIypZTxqTvLXHrKYMdMHR7W
	4jEofJwE0SYIWNS4K8DrZBM/hnFvU1aItNX/ki2WLj1JBG9CGm35iaIs2R2XsQeCx+PH/IRBAJN
	2n+9+NrNA2K/T4h/NgYP73ztqs7vVQvLU9MQmFiqBVGZKCDxMr79
X-Google-Smtp-Source: AGHT+IHgMvuDAt895ICDc0XLDGqBuslTtH+D05AWu6mlFg6UPu208Udg0K1dATfjFDOpPEGc7f862A==
X-Received: by 2002:a05:600c:3516:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-441b1f61398mr18443775e9.27.1746001709493;
        Wed, 30 Apr 2025 01:28:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6298:7254:d3df:f23e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecedcsm16496835e9.15.2025.04.30.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:28:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value setters - part 2 for v6.16
Date: Wed, 30 Apr 2025 10:28:27 +0200
Message-ID: <174600170555.13323.4628945373721333783.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 23 Apr 2025 09:15:02 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> another round of GPIO controllers.
> 
> 

Applied, thanks!

[01/12] gpio: imx-scu: don't check the GPIO range
        https://git.kernel.org/brgl/linux/c/57bbc60be45b750073acc7d94aaccc4e652319a1
[02/12] gpio: imx-scu: use lock guards
        https://git.kernel.org/brgl/linux/c/dd6d13abb4c363f49ddca2697a781945cf80ad89
[03/12] gpio: imx-scu: destroy the mutex in detach path
        https://git.kernel.org/brgl/linux/c/68ef71400d0e7a9049c36cd0954ecc67521b0bc8
[04/12] gpio: imx-scu: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/40150dda92cd8718a367a32ac345dce05f788a16
[05/12] gpio: it87: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ef877a159072ca31ed183b086c41fb9951521886
[06/12] gpio: janz-ttl: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/3444049044ce24c2a2bc98c6e30d189451147b63
[07/12] gpio: kempld: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/0c5fa4ee5a2256cd2d37bd0d0dda5d4fbbb30281
[08/12] gpio: ljca: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/722332f58aa82b92c857b053426dd46e09988e38
[09/12] gpio: logicvc: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ba2ce44332142a86bb0e9246d40b97d6cc191c5d
[10/12] gpio: loongson-64bit: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/145c4d7052fd15d20e5165305b3296a026a40747
[11/12] gpio: loongson: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/7d34d9fbab771779a2b365934fdafff32bddd029
[12/12] gpio: lp3943: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/127da457c4e01bd6e4b8a126aaf1be1a6c03fc0b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
