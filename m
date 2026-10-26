Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975272;
	b=mxUBI9CLNoRI3PvRD/9H19xUefGGG2q2lXm/PIaITKgWl1yVmx4J77NsHXy6CP8li+Iz
	 0XKY4qT+kEm81nKIlqHjG7utNKfWbWrsNbTtlWS1zQMlrZuUM1LZWAdS3bppENoVmcLwt
	 EcFqx8T9baba7uiYkTMGk4YEbO2tZsSBtxjVJ7+vrM4hdWwQ0L84xirAA8qr8zPe5Ro4n
	 /j5Y7lFQJ0DCmjwZynU8WtijyJl5UO59iRtVtYfZS2uODMVmm3Z96w4Y7lEckUDIue3RS
	 cdaTlfcGlSPfRAOGJMcIeR+AglqbGCcZKd1nWNPp19u37Y1gbLHxyVxzdfZ7cbUY5Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
	b=3SBMfIU19HNo/Lx+i0lCW4d89FSWU7i1GPwX+2VnmY3FtgPvwOFpfUIPHaBGyVSl9NcW
	 B75PVGufgPY2rZGjY2gJzn71ch0IqOuURPIUNQLNM3mN0mUYRfpIgzEXr36wRy07tGv+Y
	 2IYvjDamo/KuBJI/UzklzW4t8KlQh9LKXVy+zA7k0IEbbpQi4RvnhUR3vfWLjEzeXkCcW
	 FpEQo94zI4r0j/KXVwZwOFV5iOk9Apo/peGm2XkvWDeRebDurpqXmEEas7JHgIfQREhB6
	 Xu7p8zg3Ob+XTUdpCYIJKmHsp38UY26LiwteZkGVnjRSPfcT3YiotDW/31wKpRFCx9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=egzVC3pM;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57927606A31B
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 00:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57927606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=egzVC3pM
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so28078065e9.3
        for <imx@lists.linux.dev>; Sun, 25 Oct 2026 17:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975270; x=1793580070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=egzVC3pMMbFx6L+PEcoVrWM/wO/0loR73eL1egF61Nnp6AMZwWmpLgsnqP88H3iKn2
         1YdmvLHj9fmbDEuwI5vKU9gYNYOYIG8IymxCXTG/XzJiDWJ8qxcb+34ItYCgYn5dDK0w
         uqdVkvQK/v8FxHlYQ9uQH7kVlKcaj7T4PE9fpDovTaRz9ZBjULz5hcpRmuB1rM1Sbi3v
         G7+qTUQxJ5YER637wKGEA1nOzFOqTZ5I8bCvxHJral3nX6IscIkJg3tICEQB6hT/l8gK
         TgRqgbRuROr30O60XnQxVK0WBj3yFXt58JCFx1NdNnYENKbgs7bSyxVHeFmRSgSQx4eA
         vPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975270; x=1793580070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=STAG4Ra/WGFkYt3clO1lWDN4UHCCw+xPL+HgorCNrhgSUbS6WkzntsuIeUSJThFKoj
         F5Y1iid6dHGBqeyY2GsVHdMCzvqKhgxqHHWVpMjS4eNa4k7MVAd8PJpFfNDOhJAdNFRw
         xF+1SnZsy10745wUH0fgzm7vMIhpjTlETNcq1BPUSYUrGJ+BDfcq0vc9ngmto2uw/ySi
         LRVRS7JruxeVEhicekmsc+cVmzy89krWdvTLcLzfazRATBoemrX0LZvrK1nuMi7RYivs
         PbK3a7oyA8LRJS7d2aTY+Ed/EEaVqkZ2HB5WlaqwnuVjzOfbbWsbJIqiReijalAo8XHa
         JS1g==
X-Forwarded-Encrypted: i=1; AKwUvBw/a2qvAtvzn/wrbLc3X7E5j+wCzBXqLY1NN3cTNrx5TmzaU6X8oK//+Jyw/sidSYCAcjs=@lists.linux.dev
X-Gm-Message-State: AFq9FYKqGSa87GSQQt9TM4q/m9K6i2mEWtnwxbSfVSKRAQvkF+fpRmx1
	XB6P+37cTNwIzG2g6rqS5+5kCt8jmVfTmr72j8rVnFVsVWn6jDe7IeHa
X-Gm-Gg: AYBFou3bBxL5/tGCOQz129DLX5oR28LVh8oAQwFMBI54vo1J+dHjq8HCM4uHNlxOjqY
	LkN/htemvUeYggZZRrWookHRR1UH7AV6NbkPGnOy9w0u2fGParEnyhkRj0KfpfKGL13OSIUr/Se
	EbfriVyMeZlBH6LDXopoAYL1LMR24ApsmKoNsi81G/s6lYqC5oyALfNamTMFZ5E8ZhSBhejmfkt
	EZmQIAgHNLHaOkzo/X17oM7gsJesw2BgT7uCLFtbqB1gQW8bFG3BqLJJDS+EYPK7iXOWTZP6lel
	nHW1ElBumiO+RvE7ZjEMaw+xv64N1KZ6GCR+Z7rwh4FHVR4Kjq4nRKTyX4j0e2iQ191mibJbFxq
	72/MjZ3g4wskl6WY6WCPq0N/tjhu8xS1dslfgtGsPR45mQ0es/Vi+VE5ISKsVv6m/rpiJg+koEL
	Qo/l4BQYBf/KPU8HKKedwz/ewnT45v/asgu0FSlZxFm4MNN6WxX7Vrx4yTbrrDbhe4tE/AbaDwM
	r1UYdimL25GblcSpxG+0/lBPgiarcEo8Ms6QiOxzIhjqU0vz7dPNh9OlVQsSQEbg9Od6nVm7RZM
	3P8YW08YGZfpsg==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr101973045e9.0.1792975270272;
        Sun, 25 Oct 2026 17:41:10 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:41:09 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] sy7636a: power the panel only during updates
Date: Mon, 26 Oct 2026 00:39:11 +0000
Message-ID: <20261026003918.155321-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature in the regulator driver instead, as the TPS65185
and FP9931 drivers do, and remove the hwmon driver. Boards that relied
on VCOM staying on mark it always-on. The regulator also switches VCOM
with VCOM_EN, gains VCOM voltage control and binds to the I2C device
directly.

Tested on a PocketBook Verse (B288).

Pablo Mazzini (7):
  ARM: dts: imx: keep the SY7636A VCOM on
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good, then switch VCOM_EN
  regulator: sy7636a: report the temperature
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD and hwmon options

 Documentation/hwmon/index.rst                 |   1 -
 Documentation/hwmon/sy7636a-hwmon.rst         |  26 --
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi         |   1 +
 .../boot/dts/nxp/imx/imx7d-remarkable2.dts    |   1 +
 arch/arm/configs/imx_v6_v7_defconfig          |   2 -
 drivers/hwmon/Kconfig                         |  10 -
 drivers/hwmon/Makefile                        |   1 -
 drivers/hwmon/sy7636a-hwmon.c                 | 102 --------
 drivers/mfd/Kconfig                           |  10 -
 drivers/mfd/simple-mfd-i2c.c                  |  11 -
 drivers/regulator/Kconfig                     |   6 +-
 drivers/regulator/sy7636a-regulator.c         | 240 +++++++++++++++---
 include/linux/mfd/sy7636a.h                   |  34 ---
 13 files changed, 205 insertions(+), 240 deletions(-)
 delete mode 100644 Documentation/hwmon/sy7636a-hwmon.rst
 delete mode 100644 drivers/hwmon/sy7636a-hwmon.c
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.52.0

