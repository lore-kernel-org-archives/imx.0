Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3501FC0FC
	for <imx@lists.linux.dev>; Thu, 15 May 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321302; cv=none; b=iL5U523SmFFJ0VeQCVShAupxQbwPaWFL0XkzX/3LxER5XD0Y1QxSH+RrLlGIlIW20bL0c77CaMmLtpTY5gPUyf6RmMGsNcvH8dmSWU70eQiAmyCGajtiAP8nc+/hWfB+Pgsjcd0DILx/KrRUnOHb/8R5aJ05gnjaDI7Uy4PZRXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321302; c=relaxed/simple;
	bh=gwvgls2VA7YH6b1HH+79Y0OYUFtcsjeEGBTt2xXU8y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AqwDJfWmsGVlUy2TjXo44rxoj7hJTiUWCxxu0Mx/ihoHxJyYmyKVfk8jQVaTs+zrEO18PUbVXc37od2XSFSza5oZ+boIK7O9HBikNvBeojoMkvHIU156TWYYn+5WANOVk9i/3LhqNAy+vI0yOKTuc+EszPP3N8z9grqZplFp8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cNN66ek4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cNN66ek4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442ea95f738so7949175e9.3
        for <imx@lists.linux.dev>; Thu, 15 May 2025 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747321297; x=1747926097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLqMkFSPNEN1hS2qnrOzMpkhN6pHh1aoC/AzKLBLV/4=;
        b=cNN66ek4UAuDk9BYUEQOBsOktjajLwQaV2PLLC58PI9JdmE9IAQhYRQAlxI1Fb6cMm
         wRwNtUgTPKPbiexCVDPHrmvUBzVc5wcPZrlgqg4duLFz6c+7WRI2uNRglO917zXgQ+3q
         ouzlcuSfGQXBQa9QOsZmhDfxFlHe1JwSsbai/SsIOBF6X5icPF9rXXnhteHlvFaouPsR
         LPTLNfnOdUkOwVaWwdqKYw2TV1FKb/A8aBVrH4wfEoMLlQP87dlp4fh9mMAqQhw121Fq
         92o6z2LnZxHI6sFP6CiN0I2nkltXENnUx6YquApP/1te2ZsK0yNQdulO0WLA84vHvgw5
         LGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321297; x=1747926097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLqMkFSPNEN1hS2qnrOzMpkhN6pHh1aoC/AzKLBLV/4=;
        b=CrwwBlnXcYipbjFCJUWktyL81Yghq169lIG4N1mJ+0t3p5C5XLwzpLW1+bGWO1qvU1
         Ck3twfCjCzd5GCDJiABC8M/9REixcr3U88mt2C0uzoOQ7kO2yPcXGoSH4byLiYvuLj+y
         A3vJRqB2V5KdkZSyady9hNtyoK48Deefm1BAlWviMx8R0CStv6FMk2F3rfpUSNrUCYG2
         Z7XnFY5Fm4IefO5Pygmm2siI7wU/T8TB0VIs8T/9TRLgms2kgyuFBIN5gIn9IFE6kBcG
         1PGwXoSYsf3HkXxKlxaZeOwNXvxtGshlly+jgLZKzy+COpHkMAaI/5EOXnudSu4wmBft
         1Tsg==
X-Forwarded-Encrypted: i=1; AJvYcCVYYym3Bm0gCHGDdHy4V3eNK3gq5e/GqzpNaX3+BeIbmaM8E4Wj8YYrTto6grtwNC+ddoE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAiyNYFNznIhyq1HaXdQdySWZ69g5m+CopD4Y5vCGaMGyCxHbT
	j4QBvPC4hxu69c6wgkqOXDPl/gHa79Xmx9cxYJGgt+2fSeexgBrQ+93cQmgv+qVDAx8=
X-Gm-Gg: ASbGncs4a1E/lH4y+onClcSG5KJtaNVLHE8Q4Ip7cDDTHBZPuDJy7ofNsAWS0S5xWMt
	LF2uE9DmjoQEhTq/1MhrKi/l9spI0LMV/IG3sLWVWKbroBlYURoNORYdJM2ZCtUG0EC+M5UxXtC
	XjJVBL1556sSy5q1wJgQZVisYNAEepH5ZV2pg1eVBRT2A1TYoTkjdOhyRa1FPne0P2GWR9VABcg
	61/cBMoFW5aOu7NnLY5WLk63JyNHXJUxqnezV1kTab1lzScjLPuHRQBL2lxOsjjpl/udZwEYBNR
	cxhV82iNA/4hSbN+7YCdA28Fw4mFWPqzKA6wRSYsBHdhh3nORGNun4qtWHgbEkMiNbmi3Lf9eb6
	YqDxQYdDEjqs7a0L0kxTDAABA
X-Google-Smtp-Source: AGHT+IGsAKFgjs66CEclWGo2OAGE7x2yF/O4CZXrBnVvBqkKBdDXu1lvcu3um1VWUo4w6Oo4wz8SIA==
X-Received: by 2002:a05:6000:4313:b0:3a1:f67e:37bc with SMTP id ffacd0b85a97d-3a35c7dca79mr128071f8f.0.1747321295486;
        Thu, 15 May 2025 08:01:35 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm23388046f8f.15.2025.05.15.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:01:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
Date: Thu, 15 May 2025 17:01:29 +0200
Message-ID: <174732127889.17102.8532614606603162153.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
References: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 07 May 2025 15:07:25 +0200, Ahmad Fatoum wrote:
> i.MX GPIO numbering has been deterministic since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), a year after
> device tree support was first added back in 2011.
> 
> Reverting to dynamically allocated GPIO base now would break most
> systems making use of the sysfs API. These systems will be eventually
> broken by the removal of the sysfs API, but that would result in GPIO
> scripts not working instead of essentially toggling at random according
> to probe order, which would happen if we unconditionally set base to -1.
> 
> [...]

Applied, thanks!

[1/1] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
      https://git.kernel.org/brgl/linux/c/0a45c1a002705c8622738fbd2a2913acf886ea27

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
