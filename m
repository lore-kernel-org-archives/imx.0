Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532CE3A6B8E
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331937; cv=none; b=km3DjB1DKnBrMSuUwi07TWW5/IkIXs9JPQFqb/7QlBa5aYu1IUaSop5ya8ajVGidmICuYw6PWR0h0LCVcleJAhJPs+RScvFyGIq8x1ioRNuo5mm08yADrGUUYdQJnCyMTNR+qHNEvwua5+C2RPCGwgFeU/CrAdtqMkqKVVj7SrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331937; c=relaxed/simple;
	bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPp//f7iTX65ZVARF+VqN4YVfP3PszRbzBCaXi1RE/Ym6LDKY63rATORG7GjSLSzMllDuR2dzgYFrQpMdLxqwMMmItYm+pjk+qRB09II/lF22YojzEwJnb4vnEhMPXr7nk5z0tZcxCRYo7gll0zNFBBqKbGy6UzIeKQB42gXXhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3ZT3TL6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3ZT3TL6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so4763165e9.2
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 23:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331922; x=1788936722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
        b=N3ZT3TL6W35DKYxdG9LnyaV6pIxgiB41wc1N6Tr3Bk3wej1Lkg6PHicOGwL+a4C8jK
         /Q6DOeGFqZ9r/P4ovxrVbkxgpJIUNEb6WFyPNxM1JYUkBoz1+o70BywgwcuKu4lKmHWu
         axMaOD5Cy1g4HUxllUWnq8JopbJjxmZ6GOpiRf2tM66z5Z9+pF1hLJYs3ojL+GvaweNM
         YeteNi8/9nv7z2YZTbAznX+2JTORWK59hPrcRUkDRAWWSCLeqwcpI93jCU3bURV3D4Co
         kS2o8H1HOmcPRFRIwoyVt6Q6Pw8+XJFIlPii3QqpGI3Sp98bwFMprzRNsAj2KntFD1yj
         jsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331922; x=1788936722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUBe4V9KHl8iNUfcbhC82PdW9xkiw2ga+WjG1tOSQz0=;
        b=Sp3Dk6wJMJerbm/LYSHklOZz+s0wqDoUeO2q5La9FNONxu8+e4iXz0xm3lKhwQYhFh
         GI/5htHx0vq+nmFt5bBTuKZWdZV6hI0EJ45cayfKgkK5KSnLNqycTE+nQVCoTvOFj4k0
         XPe9Ta2eUZ43tRHvr0yd7nkDYZBP0V+Is0yXza0aVC8EfmuEQVbomCxhfiT1ILjuJFK5
         c6fr9tcLfKWBTpSJCrlytvkuPDalYuU7G/9QbW8PODmZEVW6+On+e5yGc3yAKjKvn/E5
         bj097ixw+3Lo4AZ8P7BzSQAfvhvpZEFOLLl4PvoBBay5W82/h2j5yTxJ0iUsmRizKxO5
         bQIA==
X-Forwarded-Encrypted: i=1; AHgh+RoNZrEntlnLZBdUjfd8RqTEkIhXIDkv6yxui3B/fdFiUzWMYVrKeidHYg/qbGHq3DixKwQ=@lists.linux.dev
X-Gm-Message-State: AFuF++mFL1KUBZKPab0QqeomgtiRLFjLPRyisQh8GzHl3bQlU/j+K0oO
	ZKHP7I3mQsSR78DWiSe6HTLxATsC4b3eELT3RnHHWa00kbKivxI0fNfP
X-Gm-Gg: AR+sD121lWZ8bMwt8VW1CQoiN8SON6h8+5TqQSQ8VTTjw3jq4XRED/qESaRIxA+T9xR
	leKu4nRJ8jY0V4H4C232j3p6pzquu4w2w/8hvaFSBV4mqZSjTsoYsklbadu5sygFNvAfjRh4P6a
	wZ30ML39KZZHUEql9HYFV+muc1yzf8Yh8TholpIyscDEX+i/q+mARamtnaFR6htCnIiFR2vykVb
	N+PoJES+HKpWHAMYCnHvBZgnoe9SO2sxqy5kZu3rCMRgV+Lr2sDDZhaZKFmn6z6GP7yKAYmO/00
	MiSkIq63iCSdoRodCu8Rek6BDOfonLFF55mTD0F4/IYI/7WIbb9Wc33jP/YzsVWx/DsQH3SQor8
	dH/8aBOdFxNbUm4K8P4WaxRON5i81MYsYnqwmOHl3jgt8jbrxxMaXHjFLrOF2pjfA5aFgi3Rb1a
	NzuSZrk5bRxHDuxi9GtInqPGdTXCdk/7N54Hhiar3Z1U+ffIs0YOEdUW+2Pqmd3J088Q==
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr39966725e9.16.1788331921667;
        Tue, 01 Sep 2026 23:52:01 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm124677705e9.12.2026.09.01.23.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:52:00 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: sashiko-bot@kernel.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH 2/2] gpio: mmio: get the direction from pinctrl when there are no direction registers
Date: Wed,  2 Sep 2026 08:51:58 +0200
Message-ID: <20260902065158.3617522-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902064045.60F621F000E9@smtp.kernel.org>
References: <20260902064045.60F621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: High]
> Can assigning this callback cause a scheduling-while-atomic bug?
>
> Generic MMIO GPIO chips are initialized with gc->can_sleep set to false.
>
> When an interrupt is activated, gpiochip_lock_as_irq() executes with the
> IRQ descriptor's raw spinlock held. Since it sees the chip is non-sleeping,
> it invokes this new get_direction callback directly in atomic context:

This one is real and the most important of the three: irq_activate()
runs inside the desc->lock region of __setup_irq(), reaches
gpiochip_lock_as_irq() through gpiochip_irq_domain_activate(), and for a
!can_sleep chip that calls get_direction(), so the pinctrl mutex would be
taken with interrupts off. My test kernel had DEBUG_ATOMIC_SLEEP off, the
uncontended mutex fastpath hid it.

So the callback cannot ask pinctrl. v2 changes the approach: the chip
keeps the direction in its existing shadow (sdir, under the chip's raw
spinlock), the direction setters update it, and get_direction() only
reads the shadow. The pad is asked once, in process context, from the
request() callback: gpiolib calls request() right before it calls
get_direction() for a newly requested line, so the shadow is seeded from
PIN_CONFIG_OUTPUT_ENABLE there and the line reports what the pad says.

> [Severity: High]
> Does returning these pinctrl errors break interrupt setup for valid GPIOs?

With the shadow, get_direction() never fails: a line pinctrl cannot
answer for keeps the input default, which is exactly what gpiolib
assumed before this patch, so gpiochip_lock_as_irq() behaves as it did.

> [Severity: Medium]
> Will this early exit prevent the patch from determining the initial line state?

Yes, the initial scan in gpiochip_add_data_with_key() runs before the
pin ranges exist, so nothing can be read from pinctrl at that point.
The v2 commit message will drop that claim; what the series fixes is the
WARN and the direction reported for requested lines.

Thanks,
Mehmet
