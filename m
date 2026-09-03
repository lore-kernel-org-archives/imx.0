Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA43932E5
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422386; cv=none; b=iH1yVcQ0JIAwYznScYlbd9g2DU1a1KcGjW4tLyCmikJ6MOnUN/xXGo9LAhcWW7dxunIp6YAgQYz3pN4uSm9tKHMRXibQJLCQI9pzU8IKTtfG9pyUF+al13RK3psQAv+XqtUfa8f/yrXbPHprJ/KKP5rAj0lDiApogZ4PG/dKrSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422386; c=relaxed/simple;
	bh=NeNCtJHz+DsigUgw0FfFsojwamStrqN0Mt328cAbfHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EufQBwqSQgc01F9um5k/ExipJwchAYjJTWjM35GFMuQWE6T3+iINDcLw4VyHa1fbZ9674mYehv2c7BXjlmZki0XXcA/XM1Cguu242vAUJZYvryMPGOsvl2eJ8jpvmQIpUQp0HcB65g/Ut1uPfaKiQCPPsjbanhuOrHKmdI77wAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rusMXY7x; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rusMXY7x"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so20655095e9.3
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422382; x=1789027182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqE1Nf1WUkJjJ59VGvv07xVmOKIQ1xkyIMzuh64BMn8=;
        b=rusMXY7x8Pr3lvWs+MDDHKmAIbXn/RLAlCNTewfT+nDb6ic8ZY1WQHuUWnu/42Rr6J
         /Cxu1vXO+C7AiJEYhw5YCj1Zx1P2ZPioI/2zaAlYu/YtlsvKJiQKveyeooWXgGS5L3RM
         jduIHmwEw5vMP+uRfCz1okjrRIS0fZgzg6yHUFLNyZFGkqI/S0M2DoiQ7SWxOQ+W1is/
         +rd6FS+VEX9Q+w0RW7uJVBpsMPuf8MxTtzaF33xXuq55eIvE03xjghC2Xh7hGr63BGEW
         E0PehPCXZYh6t8QfvjHjTxDIhAtdjdamSr/uyDWsexRa8Oy2DHju7DTzSfw166gC12qb
         30CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422382; x=1789027182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqE1Nf1WUkJjJ59VGvv07xVmOKIQ1xkyIMzuh64BMn8=;
        b=YX1Q03tsGw5Ri9K+VZEVP7MpQmQjkPB0FAOwa3cy3BXBj+Y0+gD4GmbPVZhm3WsCPn
         TTmJEi9woFFL5ncDCVurzhqtiUN6oxoELq7rd1lIGyq92PnyxIT8yMgVtZIw69/ssqmZ
         /X1FFKNEl7fIEJOjPieJ5uv2JGtGeNIHMtP+A5PbY8W0SR2yaPTRaIVnL5MBIzii6ECB
         QchX61NBh34VdBOMdjv7BqhqwR28s+5soava5p+C2IaPTALg75VeJ/mFCG6zYd99cjGV
         u5snQfVavg1c89kUR417qHVdx+6cDOh6Qjt+klWM5xSeQEX7j2zcRN9wY58gKZ/niyWG
         8ljQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeMjHewREpCvu6k13M5CdftxJFpGSQXoqjhJm/ExIEVBfP2iEUv9s2lJwAgd0ySdp+MjQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nSdRblfr3shDq+bW9l4fjSKVU8PWoVq2npqBmTESw4qZujjwZg
	bfG0RC+T3qT+QtDVmL1RcyaH5Ry6hIwg280NOdiVWL4kxBoiu2PYbKHw
X-Gm-Gg: AYBFou1wUFkuPhd2pHF/+20BRSyJp9ZfNKOQtuzxYkMITu4jUKN7mThRvjyCRZAoPqT
	hucH2FRmsmIQ9irbBuZW7rah/1orrrdZzKUPh7YONQR09kdGycNm/1JGX3XDXNdQlga//F9DQ5V
	mT60ixgq9AkUdCjFAAi1VRhgq1JVF6CtPDCjZbQkS9yeBu3OuWqBZtxu/fT7BXDOtyvJylpMkgG
	hRQ48leg+a4bTU/D1743/HeqFviWVQG2OwqFDivdlJNwSzc+bd75nJSvFgT8KySi5W/1yJStrOM
	4NKRmhdb3YA7cONXTcHbvbhydpF3D0WP2cqvdZwiUx/xyy4gtB+87ve7TrVZZkXg2KaL4+t0amA
	kjhAvJ+FeJYKjmxbcDzvizLaJiduIiSWGgadNfcfkU+FuxovZHGD3/gUcAMgkKkbO6sarR9wE+6
	pRLQA9CtfkbAD08xLwN3c41epyBYfFAVerA/VjyAOvgm2s80+2nH5Dz8V1bYBeSW+iFw==
X-Received: by 2002:a05:600c:4f0b:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49ce581316dmr148614405e9.6.1788422382300;
        Thu, 03 Sep 2026 00:59:42 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm52373275e9.0.2026.09.03.00.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:41 -0700 (PDT)
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
Subject: [PATCH v5 0/3] gpio: mmio: report the line direction on chips without direction registers
Date: Thu,  3 Sep 2026 09:59:37 +0200
Message-ID: <20260903075940.2089367-1-mehmet.fide@gmail.com>
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
everything else, the SCU based SoCs included; the debugfs dump, the only
raw-register user, reads the register through its own helper. The set
callback stays raw, as the fsl,pins binding requires. Converting the
driver fully to generic pinconf is a bigger job than this fix needs.

Patch 2 is what Linus asked for on v3: an optional get_config() in
struct gpio_chip and gpiochip_generic_get_config() as its pin control
backed implementation, the mirror of gpiochip_generic_config(). The
packed parameter goes in, its bare argument comes out, as with
pinctrl_gpio_get_config(). No consumer API.

Patch 3 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context, through gc->get_config(), so it is safe for the
gpiochip_lock_as_irq() path that calls get_direction() under the irq
descriptor lock.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled: no backtraces, and
/sys/kernel/debug/gpio shows the right direction for every requested
line (the hogs, the SD card detect input, the USB VBUS regulator
output). Lines the pin controller cannot answer for keep the input
default gpiolib assumed before, so nothing that worked before is
affected. The initial direction scan in gpiochip_add_data_with_key()
runs before the pin ranges exist and still guesses; only requested lines
get the real answer.

Patch 1 was also booted on a Verdin iMX8MP (gprarray, 6.12.107): the
pinconf-pins and pinconf-groups debugfs dumps are byte for byte the same
as before the patch, and nothing else changed.

Patch 3 needs patch 1 to give correct answers; taking all three through
one tree, with an ack from the other side, avoids the window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Changes in v5:
- patch 2: the get_config() documentation said the answer comes back
  packed; it is the bare argument, like pinctrl_gpio_get_config() returns
  (Sashiko review). Text only, no code change.

Changes in v4:
- new patch 2: get_config() in struct gpio_chip and
  gpiochip_generic_get_config() (Linus)
- patch 3: seed the shadow through gc->get_config(), no pinctrl call
  and no CONFIG_PINCTRL check in gpio-mmio (Linus)
- patch 1: drop the npins check, pin_request() already rejects a pin
  the controller does not have

Changes in v3:
- patch 1: return -ENOTSUPP for the SCU based SoCs instead of letting
  the firmware call hand back the raw pad value (Sashiko review)
- patch 1: -EINVAL for a pin the device tree never configured, -ENOTSUPP
  only for unsupported parameters and SoCs
- patch 1, 2: drop two comments that only restated the code

Changes in v2:
- patch 1: decode the requested parameter instead of returning the raw
  register; debugfs group dump reads the register through its own helper
- patch 2: keep the direction in the gpio-mmio shadow, ask pinctrl once
  from request() instead of from get_direction()

Mehmet Fide (3):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpiolib: add get_config() and gpiochip_generic_get_config()
  gpio: mmio: track the direction of chips without direction registers

 Documentation/driver-api/gpio/driver.rst  |  7 +++
 drivers/gpio/gpio-mmio.c                  | 60 +++++++++++++++++++++--
 drivers/gpio/gpiolib.c                    | 23 +++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c   | 54 ++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 include/linux/gpio/driver.h               |  9 ++++
 7 files changed, 151 insertions(+), 8 deletions(-)


base-commit: 1900b5a41493e7050c68c1e62780d6fb9a209457
-- 
2.54.0

