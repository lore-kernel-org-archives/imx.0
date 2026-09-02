Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD854A8FF2
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 22:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387928; cv=none; b=cmShzR2vB7+DUsX/bMmD6yoWtgyuoMsP69itFnVgpcv+0sncvzkRNm8sHG5lgnoDJIL/9SHMBqVSpzoOi2ya0m2JagvEORPI5+ogyKoQC6Wh46Vj9bf3Kn5hfqLNbIpc9T5FI5JUXYwC+OIJw81Jy9GVyaYqVhADRkqw1OKhgaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387928; c=relaxed/simple;
	bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oe7adxmb0tJDdjUi0UiBJafiE8qVerEu2dffBJpljOq1JJPqFLoiUjJIIiR4IeM1lP8eJA19jyTb9kNMkS2c5ihe+E8j3VOw2nYbCY/2yITgFC0QZISPzQgRM1S+eSf+zTC81vxLf7QCLLmyC7n9NFibGHIovLfm0J2xY+Tggqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSQP6Xp0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSQP6Xp0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso13331555e9.3
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 15:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788387923; x=1788992723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
        b=oSQP6Xp0V99uQT4vgdU4S5lpBSSQ23SX1L6gfkYDkNo68uzcW+B7oDZ4e2cyHUH5+m
         wXNeZp7YgNvWgbv4HFy36wZpk4mWozf+PaQ5qemKG3XKk6xVpoJn1bx1b+FeS9RkpW+P
         xUQoixwN/6ENb+MOptMAjAgf+ChgRQdDvijnnPPWkcInpXLmin9giu7lxLvv59bwu4Z5
         GRAZQ0QQF4zekRx5NSrZFoO7CoBTnJPhfjqzymy6ZdPWtPUb61vBwMZXR/Jh4wstsirA
         h/isXYxczqcqNaiJzgNW+u0bQfTO6gprzi2ajlghMWUD8FNOuDM+DOM4h2+tfgde2hL+
         fmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387923; x=1788992723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
        b=VAsc+pJCOni1WwNFzrQbPtcsJr5eeryea0tehjKxlo4Ia+XJBMSMeCVwDNiz3c1bg2
         BcPbO0tflL0uhBugCwHHX3SX+9KtlsgAXYvIQRD2ZD4RARJ2X++ZYMQsmVnANZ6qISKy
         BSAUKQFjw5vBanBwwG1lkTgdPd3JgsMNSjDndJ6vczk3dzFIPiTZexshElEZ5jSrVGtK
         SsmT/Lj2tm5gN6Bf63s37CvxuoCJugk1kYQLgt3nANH9qnwPekn89kEqhkPi+pWdoqrr
         zivytrq8ezL43NmHSYI5+whj1BevwBfSF5IXNyKorbgKz2FeIGEsZKeJ9jhLl4chU8VQ
         8Opw==
X-Forwarded-Encrypted: i=1; AKwUvBwxBS4YWJWA/eHE1Y7FDcosvZTpIjx+5NGot3hcytmZcefj0U2sity9SflLDW1av5hutcM=@lists.linux.dev
X-Gm-Message-State: AFuF++ndAR0uxaqD2L0mC6h6F2xpUFEbJQaQGIKk+RpYBqHF4XFnLr8h
	fAYDPiOhbLHSsw/9AX8wGTtEyeyOoRjpZE1/+tbzuefeOf8YXt59/Fdq
X-Gm-Gg: AYBFou0MgzHeU14Tm8VY+3PFPXRpfLROkrXJpu3TwZCHsl3CwBzPCA6yjIQlYOc8WM3
	tkfewl5QaZsc61BtFDOkTNDXwAEckTYlcdoOf/zyw1LYIDWkCu3bIGTHo8cMb0niYqESQj5Cgcg
	NEebZ/qI4Huca9/TAbORegRp1LLIRLmf3ztq0+Wc3TTf53eGJDoHLL4Y7gFTJxizm4psq2bJuHt
	xiIHkcEojiATJgjgB44ZSS93n+a9tUqVjts1Sq+OQNWR3eMxlWK+TYDaLTAbp8U15faAFJu6TBO
	tTEr3ezMJabHHW7R9i0pNdDwKR5OgqN45Tlmomo0W6CAebmkUMIO+o99Zume3Vc1qs3zyatgf17
	mTomcEpUPnpGZUzXynhdzZmvwSBpj+LHyZhsTFeVG7e0seQBgbr9lywNCKliFCVLPk7oTZpkL7P
	Btg9Z9yK7pNSCQebJtCUsFiLvJ3XmZqHrQPYTSaDaC2qAWAbMZpDeAAq6MofBl2qgsMNudbrKYi
	fEt
X-Received: by 2002:a05:600c:530f:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49ce55ecdf2mr157349195e9.3.1788387922631;
        Wed, 02 Sep 2026 15:25:22 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm20916915e9.8.2026.09.02.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:25:22 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
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
Subject: Re: [PATCH v3 2/2] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 00:25:21 +0200
Message-ID: <20260902222521.1752085-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAD++jLmJ1+ZT=j_L79SuOzZS3PjOBgrCwhO8egaHfOU1ScLPkg@mail.gmail.com>
References: <20260902154525.4090276-3-mehmet.fide@gmail.com> <CAD++jLmJ1+ZT=j_L79SuOzZS3PjOBgrCwhO8egaHfOU1ScLPkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> What about just implementing generic optional get_config()
> in struct gpio_chip, implement a likewise generic
> gpiochip_generic_get_config() in gpiolib and use that as
> the fallback?

Yes, that is cleaner: gpio-mmio then knows nothing about pinctrl, the
same way it does not for set_config today. v4 will add the callback and
gpiochip_generic_get_config() as a mirror of gpiochip_generic_config(),
with gpio-mmio installing it for the pinctrl backend and seeding the
shadow through gc->get_config.

One detail for the generic helper: with CONFIG_PINCTRL off the
pinctrl_gpio_get_config() stub returns 0 and leaves *config alone, so
the helper returns -ENOTSUPP there instead of pretending it answered,
like gpiochip_generic_config() does for a chip without pin ranges.

> I don't think it is necessary to provide any consumer API for this
> such as gpiod_get_config(gpiod); as no-one really needs it, we can
> keep it as a private thing in struct gpio_chip for now.

Agreed, nothing outside the chip needs it.

Patch 1 stays as it is, minus the npins check I already told the
Sashiko bot was redundant.

Thanks,
Mehmet
