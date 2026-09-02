Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5D0477981
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347287; cv=none; b=fb56lpdR7je8t9JTu/u+UruiO4i4CyZcKo0/lDgRFK23vnRCuyCiA3W4X/tZQByWw6B8rHDc2StmRVrCoUGHrYew7w23OeBEH6B9c+330qGbgqMY+bp+4YlHqAY3CDTlsCn+YjNMsTpsY/TJQsIHZeBe8JhDBAtweIqMXJKC2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347287; c=relaxed/simple;
	bh=G0sJs0ujHiGOhjGyLliQnfeBam1mT1YiVW8eQVl48a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxNGZ+xiazrn+GSpnfwm2bHhXYP5Mfb7cxbVxA5koXdahqxLIPyaB5WWuHAeDenHtgFTD9rHpSni3s3R731P2VF8xZ6aFcZ+sOSR+fjsVd/o2jvAjJet6F5uFzNTmWzj5JUn7XSPAugVlgfH9vwDu2gkSMDxBQeNzqePHWxkIDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jvg/wOwj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jvg/wOwj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49954b88fffso6693135e9.0
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788347283; x=1788952083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AfNAVBz0XtGYE2d+HbSOZwCHDoc1V70sAc8HmdvpJ0=;
        b=Jvg/wOwjYUQMPJFuRDKPaNmire6OIekiU7fHVzlkUGvHGCdtcF/frc8fMGxEpH+wQ9
         ydLmJeanNij8jfHuHSncqYJWEYen4yYbeIvdMiCL3zhWb+xg44vo7jdFzkWPNUXFTRBP
         aX3SzKd9zR5tNhs+bFrwMWf0UtZbIbdIaUMA736N8MAyXjpBrqP7UgaSBYOgX9LWiGuq
         JBHr0OqPobRCZ67VvjwwXFAM1btyEq6S99tVurtewKOPZTBw8GQ/kVYoOu/wAPBMWNVi
         iMx7eRvSAZtTxnmeHX+kn0MFHLvvVgkvxXTwK0t0GD3zq58fCgQAfqkqotVNO/bw5cMv
         Zb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788347283; x=1788952083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AfNAVBz0XtGYE2d+HbSOZwCHDoc1V70sAc8HmdvpJ0=;
        b=MzO8bBS/W92C6tFBo/aJZR3ODtNNXIOT0/tK3DKcooKLpcN5wLKl4Gs5hv+hFFEilZ
         HHmW2rAKS1nNfYJPz1WtfwcGYsBa1MGAACYhy6MClid5N5Hic3X8fg1BTDLRpriLqivZ
         GEdEz34Q/MNVSs7dtTo7hSoV3jT9WJAxnRMKLaw6p/3xL3WkX2ACMQzarZu5u4ETCykM
         QY4HRWTs4BGJ9CuueD3FIsOsqDOQM12PCfq5p2TmjHVf2Qs+ivDyiZpHd99cJKVWxsIs
         NP/bSaF5zC4B5xyQMmd/1W1pllQTUhGLr1vBehVY3URsZGbblQGNpQ9bMfRsPs/9Zz3O
         nIpA==
X-Forwarded-Encrypted: i=1; AHgh+RoDthlZsEkmO7WVVhE0ImpRfxVXs9bgQoIkefPyZTTU4QE0xMzlabDITR7XhuOJ3RDl5cY=@lists.linux.dev
X-Gm-Message-State: AFuF++nzpuxdKcKc5Q5TCxE3CLGw3DqFDinejCGcCYiYZPCb9/4r2wMA
	dtE71MeXfGwr4/ytxvRXdOANB5nJOqB/HndnyNtYFbDqym73hnzUwI6W
X-Gm-Gg: AR+sD11qem046s8wugWcjZnQvyBnxF1HVmxNa6gdheC7KtyCIAn83tlYw756Cm3paG4
	uWqkEunRNITQ8feWAvV8HPmZhdfCJO58F5V9QpOEm1pxOKt/S35OFcAWNXPdBS9iTCxHMJn8yAv
	zEiucFOmBliBN2kzVBhTll9QXmvCk9pU+INKx/DbEi1y5EneJW7qC00oQ0obaeu/WZFsLZc0RV8
	Ho7a1Ka4ob7j5utUgRLU9Y+zgZ0MncbTQRVBVS10YTPurSceGsx6wr9LKGOxYcbwtLQ7yhrM5GG
	tJmhZ0IjTPBW3y1wrnlWElDCR9t0mfz16Zqq8OvlAnWDuTrMacgSy+naX6OM4FjCFEmJaKBHfo4
	mik9wk1XpVD1tYzuXx/w98c0d8v0Ztr+XdOhxg8HHkfJRgpgtM8Zf8O7SmrZUVBjlru5d9Sx6Ej
	ZiKVp3GUfHB2CgcPYQ401mMVLG2I/bpIsErSylS7SmkGSroFtddDeZEk23Rqs+bAxcHlSGY/9wZ
	dTm
X-Received: by 2002:a05:600c:4f42:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49ce558e89amr70479425e9.0.1788347283266;
        Wed, 02 Sep 2026 04:08:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm96387015e9.0.2026.09.02.04.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:08:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
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
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 13:08:01 +0200
Message-ID: <20260902110801.3893392-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902075629.D0B1C1F000E9@smtp.kernel.org>
References: <20260902073946.3709080-2-mehmet.fide@gmail.com> <20260902075629.D0B1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> New issues:
> - [High] Dangerous asymmetry between `pin_config_get` (generic) and `pin_config_set` (raw) causes hardware register corruption.
> - [Medium] Incomplete transition to generic pinconf API breaks SCU-based platforms.
>
> Pre-existing issues:
> - [Critical] Out-of-bounds write during Device Tree parsing in imx_pinctrl_parse_pin_mmio

[...]
> [Severity: Medium]
> Does this bypass the generic decoding logic for SCU platforms?
>
> If a generic caller like pinctrl_gpio_get_config() queries an SCU-based
> platform, it appears the SCU path (info->imx_pinconf_get) will overwrite
> the generic parameter in *config with a raw hardware register value instead
> of unpacking it.

Yes, that slipped through: the SCU callback returns the raw pad value
like the mmio one did. v3 makes imx_pinconf_get() return -ENOTSUPP for
IMX_USE_SCU SoCs, so a generic query gets "not supported" there instead
of register bits; the debugfs dump keeps reading the raw value through
the SCU path as before.

[...]
> [Severity: High]
> Does this introduce an asymmetry between the get and set callbacks causing
> hardware corruption?
>
> While the get callback now unpacks generic parameters, imx_pinconf_set_mmio()
> remains completely raw. If a generic caller like pinctrl_gpio_set_config()
> passes a packed config (e.g., PIN_CONFIG_LEVEL), will it be blindly written
> into the hardware pad configuration register here?

It would, and it would have before this patch too; the set side is not
changed here. The fsl,pins binding hands pin_config_set the raw pad
register value and that is the only thing it accepts. The one in-tree
route for a packed config into it is gpiochip_generic_config(), and the
GPIO drivers on these pin controllers do not install it as set_config
(gpio-mmio, gpio-vf610, gpio-mxc); gpio-mxc calls it directly only on
the SCU based SoCs, with the SCU wakeup code the SCU set callback
expects, not a generic parameter. Without a set_config the gpiolib bias
and persist helpers stop at -ENOTSUPP before reaching pinctrl. A raw
value and a packed one cannot be told apart in the callback either, so
decoding on the set side means a real conversion of the driver, not a
fix that belongs in this series. v3 states that boundary in the commit
message.

[...]
> [Severity: Critical]
> This is a pre-existing issue, but can the Device Tree parsing cause an
> out-of-bounds write here?
>
> Looking at imx_pinctrl_parse_pin_mmio() in drivers/pinctrl/freescale/pinctrl-imx.c:
>
>     *pin_id = (mux_reg != -1) ? mux_reg / 4 : conf_reg / 4;
>     pin_reg = &ipctl->pin_regs[*pin_id];
>     pin->pin = *pin_id;
>     pin_reg->mux_reg = mux_reg;
>     pin_reg->conf_reg = conf_reg;
>
> If a maliciously crafted Device Tree overlay provides an excessively large
> mux_reg or conf_reg value, the unvalidated pin_id is used to index into
> ipctl->pin_regs, potentially overwriting arbitrary memory.

Agreed that the index is not checked against info->npins; it has been
like that since the parser was written and this patch does not touch it.
A bounds check with -EINVAL is a one-liner, I will send it as a separate
patch after this series.

Mehmet
