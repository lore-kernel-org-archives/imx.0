Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DE020B21F
	for <imx@lists.linux.dev>; Thu, 23 Jan 2025 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737619599; cv=none; b=qAsH0UIWRtSLKG+CYYlyIozlc0w5JbFdSQ9ne5zFABfZ79PitOtHc9MVvRhEo9cf3/vA4c13aIQbkfo53eFJDcbCcKBpU0nA51bbpIviZZIPB1lpF4CWThl+lJSChudkA0T+UNTOPFCV/oCFN3+alxDQWzUS1P9DYzuPAFRUGfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737619599; c=relaxed/simple;
	bh=gxTHY5tNFQ26TyUclI0HVgzv6uKE7BrzAyF8O0x2uWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5TkWLVAFODO0E3VmLBZGqwg+qkIccC1yQVuTe8SwX9PVEw+dkxsg2v3tD38yfPAhT/4iklDdzGfxr9GhIcOOOGJL30MooNGDX7gAP87c+THhnNsitj+fafgyZ5JYPfvDvZeiPnnJqZ0+YvFlDHsoy3U1DZbJyhXxvZuwYIQzCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=K3a2sNNw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="K3a2sNNw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso500916f8f.0
        for <imx@lists.linux.dev>; Thu, 23 Jan 2025 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737619596; x=1738224396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7vfNOMJ4n++kfz6xlTIcGOIzfhrBCGByHH6Dh+jmoo=;
        b=K3a2sNNw1gHuOVgaBXbAy0NLYpKQTzMDFDR1eTNqd68T7kn4aH2LqgvPj7jPr2B6b8
         Y1SdDbjM0oKm0CjLkOLCq5Ky519eCHqYCZuG2+0aOYMrQs3ARkz5hEkWE2DR6EGDO4hU
         Dq+Tm8499PVMht1bbrYTzDjgfmgoTDGHC/6eEdY7zgcjL0CV4XH6wTMq9+Lp8kcFJcIt
         ASlJOvH38jNo6zSOLEFYDfdDS6UUvU7l0p8tGmJXAcfp2UNOox349ucJ8oVZOK6N8OEG
         bENyleDmG8Efoai+zp7PzO3jjwNCLqKDgwi06zJBRWWKXn7FmUQBZ+SdZhew5UluirpJ
         JuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737619596; x=1738224396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7vfNOMJ4n++kfz6xlTIcGOIzfhrBCGByHH6Dh+jmoo=;
        b=V8CKJFQXdhoqRmI6TbqmF0dTbr8jOWUjEE5WcjafR2uiXhbKnSXJmzT1ORnXmk8Fus
         lWStKU7QqLtVgUvSDu106UZknpQZk8hqmfdDOfwkUpMPTom/fHsOPFlw4lz4kqH+ob21
         jH9nxQzEYZFb4alnUJ1z3NNogre3O+MoPlTLaxDSDOIqdiQc3PSYX9kE9ozpVQyFflew
         fwOKFP4qs4CXU8THcd6gLa4erqusLj2QJ0htLIETNmbB8b5W0fvwXWKnq8iBahL5l+7R
         MeSffEPpVsfXcRnJXOVhCTYCuaAuhsdgyawzFpEgtMroT0tPo/tGuYxmXtxQBeKI7S6d
         IqoA==
X-Forwarded-Encrypted: i=1; AJvYcCVlS2Zr1lB3KlV96mfjvbOAweXnYflXmOYVzlKTd8BU5yMhDdc4kWPwGg4sIZTmoL1biNk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCGzlXYzStkkVQ1mRxj0Zu3KGdr1I1OjfvQyq9ehPudujDNq3i
	vg02dVVlc/Cx4E/vcX3ZOi1tZNTcszyDJ1Vy/3MwKylOLC3pu7U5UzbPjsIA62Y=
X-Gm-Gg: ASbGncu9GYJ2GKQnO64Aa92EeDFdPlVhhi3vE8r36z4KwTJntMMREhUANopmayXNMGD
	qb0M6/HhNZ8M48jB4z2wApd6dvN6hzFQZ3eEmT1lt435mqb6aL8TvAe4C4DGr+aUtdj5uLkJzuB
	7tJ89JCHmM7bIFm/MYtMcssn/5jHC/rQR0LCJAbZ4vzLn7bg8BoQlQ4gX+JU/tqeGEwLlxWtMoy
	EI/92mRuq+hS0kRuBIEbOnaOXO63PvO5O/wXD8K0puqPu/hTvNSxYRVR1diP7Sz5xgZrKPzPOFM
	ebyDuAfuky0WuEY=
X-Google-Smtp-Source: AGHT+IFoSVv7AjtPcj5hMzm0WESMq53vzX3x7yD7jufTSV68NHpQ8JrlP4BZsZhmIRQzeL0cGJ5DoQ==
X-Received: by 2002:adf:cd81:0:b0:386:3a8e:64bd with SMTP id ffacd0b85a97d-38bf566464dmr15670016f8f.22.1737619595796;
        Thu, 23 Jan 2025 00:06:35 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad40:de3b:e658:a016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e06asm18802231f8f.95.2025.01.23.00.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:06:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] gpio: mxc: silence warning about GPIO base being statically allocated
Date: Thu, 23 Jan 2025 09:06:33 +0100
Message-ID: <173761959063.8981.4421815655644713601.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 13 Jan 2025 23:19:08 +0100, Ahmad Fatoum wrote:
> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> for more than 12 years.
> 
> Reverting this to dynamically numbered will break existing setups in the
> worst manner possible: The build will succeed, the kernel will not print
> warnings, but users will find their devices essentially toggling GPIOs
> at random with the potential of permanent damage. We thus want to keep
> the numbering as-is until the SysFS API is removed and script fail
> instead of toggling GPIOs dependent on probe order.
> 
> [...]

Applied, thanks!

[3/4] gpio: mxc: remove dead code after switch to DT-only
      commit: b049e7abe9001a780d58e78e3833dcceee22f396

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
