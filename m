Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F4537F312
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334792; cv=none; b=l6uX+H4tZijwd6y9gwpqBbHfjk1FK5ESRDRsAsmPvqEUuQVBQ/kpwRVEfEgaRxsDCAvJQQuJ/psgLsqQl053Ofq+80QLwaOV824nOqjfLqERqcWdmgl5/CwDSdxze3Wn/pMivDYT/fDCEWDcjfsXtSstKz231OlhYJYGQebcwpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334792; c=relaxed/simple;
	bh=yxUZn8+Na/bQwdI6zK/LR8kM8XD7fOqbN4Q0y/yhwUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hR16U578AFdpZ71EQ3hi7tQptU2DEw4mYX901xWaYG54ge1lzL+UpEFdVGVpKCxPCxyfX4m/iAuFwdHuyb9BjQdHG0zofPuWUFf3WYYnqDGfr6IZ8VraTH7CO22QoP79zFXkWYGD9AZ65gXyL1OS3rXtk+eSPJAZ3h84db704qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKQzAaPB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKQzAaPB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so4964685e9.1
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334789; x=1788939589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVYtRrcYxbTiVniZzEVlvJjB3QGXOoZDXbBYRjI7Swg=;
        b=TKQzAaPBuGy4NAFVbbYWW47FF9Rvmj8GpzLQZ9G+JN71oESV0PAznlpD9sFSMncqiG
         VVG7IxaH41vRZr9p5woxNJIT6eJZAPfUWw8YbmwExZtaT6vQkY9ugubm4K3ibD2nrF+6
         WAIVR1VE/w56JCR6O/Fkt+iLEa0UZHTPxM85U+cDN6uJcT47Q0rS1NozkQXUd6fcbOv4
         NLO/SlE1P+LYSuvMw+U8ZA1xJb8cf26ek7rwMLEjDcec20Oj4e+XDrT1KUDF9kNHdW5z
         i514e2kwD3zXIe41ZLF1XnDG1I4ysn0FUCFF8DReMunLOJDNEeOL0GslMl6yS1mOQMj6
         xuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334789; x=1788939589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVYtRrcYxbTiVniZzEVlvJjB3QGXOoZDXbBYRjI7Swg=;
        b=TyqSyVTvtaT5OTUli4lk4IdRTFDdhjXDVBkkaZ7THb2zny7VQdGwR0iwqMlkznaVNe
         MIyq/nu772i/B9Rvyb2Y2jSAb7HPBIglXX8YvQyKYbT+bqLFS7/UAmT3H82/lyTS734r
         EgE0KkdMZn1PJugs+JUBmkQQUMF955HiAN7Ewap4U6CQ+5LN66wYhdVivqdupFTOLT05
         5coOxl/hEWyalAas7QHowza7xQkQbFZh0gx7RHQvnxyNVIPstVGZfLCLqyJnOBCvmzLm
         Onc5AtLfRpPg7nr8Zm8uIR0ngnFpqyAWjBThclruHxCULTGCqnSJvecYY2Fnk1DXIwQ3
         0CIg==
X-Forwarded-Encrypted: i=1; AHgh+RqAjFoyG6oqpDEeZUMfTgeQsZhb5bL6jvTwBUIDMF/+VCxJ/VTBQ5rrmqgC/vKBdjvMtaQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lqAICDdF0OBtHqJiKiytFnjvPz7jYppPlnCxz1DysIplZvBPFI
	PaL8vzScc/2Z0ITVwMAGgTrW1Ek5DUCXbxJcbmRWD4P+L3Q/GTVPZxCq
X-Gm-Gg: AR+sD13xgOkg+RcQHK6vSpJbtHjC2bHudSacsAoufbub8p28BPGFgtfBExajFnIDjd6
	A6ExUF9VwoMvqk48QeGqPkuZgkISw2/Qhn05ZnkAS5Z6B7QWhxXXqI3gewERvomZSbXPU0xzf+5
	xnwZYWRbwF+zxPPyGUf1bnrzzQx8vSaq/+HGCTot4zFdKw9eyT4xE5nn/Y9CqajZt21B//6gH9U
	OSRA/MdbenvILEuH9I/Y6PQRPCEUslMCF47aTZ41GfGTNe95rm3NIWgikkqMdp7M2qNrU+Nbv35
	Jfjk9q/bSJfOfMsSRM+JwtC5CetqKDQ/RgSgwwqsukDoS/aS33363g3BrrdnFARDUm6TSJwe+7w
	CttiHxhfs6Ttzm36NwPrRogNQniTbssk9yNnjDvpsk/j+CYH2mx28/Hh8hi42ForNTvOpbl/G1h
	NqvAFxZtli3RFX+7mwvcsFvkAQW2NGDzxGv03K6FLu3eFgdRl4UjplO/CLCjyJm+6iJQ==
X-Received: by 2002:a05:600c:4ed1:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49ce582984dmr35814255e9.16.1788334788344;
        Wed, 02 Sep 2026 00:39:48 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4209375f8f.36.2026.09.02.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:39:47 -0700 (PDT)
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
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v2 0/2] gpio: mmio: report the line direction on chips without direction registers
Date: Wed,  2 Sep 2026 09:39:44 +0200
Message-ID: <20260902073946.3709080-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Bartosz, Linus,

this replaces the gpiolib guard patch [1], along the lines Bartosz
suggested there: instead of teaching gpiod_get_direction() to stay quiet
when a chip has no get_direction(), give gpio-mmio one and let the pin
controller tell it what the pad does.

The user is the Vybrid GPIO block (gpio-vf610, a generic mmio chip with
GPIO_GENERIC_PINCTRL_BACKEND and no direction registers, the direction
lives in the iomuxc pad as the OBE bit). Today every
gpiod_get_direction() there trips the WARN in gpiolib, 21 backtraces per
boot on a Colibri VF61/VF50.

Patch 1 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. It now answers
PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE on SoCs that say
where those bits live (Vybrid: OBE bit 1, IBE bit 0) and -ENOTSUPP for
everything else; the debugfs dump, the only raw-register user, reads the
register through its own helper. Converting the driver fully to generic
pinconf is a bigger job than this fix needs.

Patch 2 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context. v1 asked pinctrl from get_direction() itself; the
Sashiko review pointed out that gpiochip_lock_as_irq() calls
get_direction() for !can_sleep chips under the irq descriptor lock, so
the pinctrl mutex is not an option there.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled this time: no backtraces,
and /sys/kernel/debug/gpio shows the right direction for every requested
line (the hogs, the SD card detect input, the USB VBUS regulator
output). Lines the pin controller cannot answer for keep
the input default gpiolib assumed before, so nothing that worked before
is affected. The initial direction scan in gpiochip_add_data_with_key()
runs before the pin ranges exist and still guesses; only requested lines
get the real answer.

Patch 2 needs patch 1 to give correct answers; taking both through one
tree, with an ack from the other side, avoids the window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Mehmet Fide (2):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpio: mmio: track the direction of chips without direction registers

 drivers/gpio/gpio-mmio.c                  | 63 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.c   | 51 ++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 4 files changed, 113 insertions(+), 7 deletions(-)

-- 
2.54.0

