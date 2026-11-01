Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572302;
	b=Kr2MwvrMndu/E/qdhEmajD3BViNDC7U1+vJlHjAhI2RW+n2bp5c4i5g2sS+OTn0QOVsJ
	 kqv1kihaAq1I3iutOBltxOpfoRTPTl1DU1RaYSFVxB5e+5JsokCDQCEzlyJvIwCx2AiWn
	 oAfiZD0SZfGzqNtQbP5flwiBsrQJVkZQOJwWJ/3Ali7xNZOPgaaUWxEIGOjr/5nUBxN9f
	 83TFZbhLMm7rhBybwQOgGmyJ2nltXSSgCMvO3bNt8OiibZnEaL3YxdQLtVFN8sD7ESNkn
	 pXkvNpgLFmmrEn4GSICPHICWQcOplSoFIDF7565DuqT3RrGzjPlLX6jwuH3O22nt/DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
	b=mjjxSVPwltZ7IWrWlFvv+gvumGLejiec67+ERKdYlYCZt+W8vd1vOPBcfJZbopbr2j+A
	 2azX+G86Br5QGXYFEVc8oVzPNA4+lSA16PX9+RK5LTsEp0I0zRKMJ5R1oe/qlsmLpa8Pm
	 c23XYe6MbiP/KqZKBzZnVE57jeJJOqVHd1yApQxJkJQhQ+73yOCjh5ADPTbHl9JjFRUGd
	 R0Yn2CNYYhSRhWl+fv31uaDFBE/H0ignw3NDEX0CdEbxL6ryKkVPRWh21vviFrVLtcxrq
	 B+HRW69MCEkE2QiBx7SKp6lvf8Lo6gWbeFrLK4KLWunb9SVXkq+Q4SO5A90OXbk8XXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TRp/RIok";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D18606A32C
	for <imx@lists.linux.dev>; Sun,  1 Nov 2026 22:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D18606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TRp/RIok
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1624859f8f.0
        for <imx@lists.linux.dev>; Sun, 01 Nov 2026 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572300; x=1794177100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
        b=TRp/RIokMvoqBJwofCmuJcqtD112d8bwDhkwjZVFhQbv/bz8LW1U1t40wC5QgYl2OX
         a3pBT8pkOB/HurkSkNf+VUEgE55rg5lihvXRk5dpzrtKqY0IRDu3KcYUY0/qoXIezriT
         7ovKeXehuq8fN+8o7olEbnA3JD58excSrAwLnKDI30Gfjn3WMEAy9a7R4BjGCnxP3J+A
         S3wJHn8XmisS0AuFqvOUVQ3DIwqhJPT0GfHffPGelw+rmb8PodJxuAgfDz/pl4+fyom/
         TjiBDAbcYQilBEowEnJ++PiiACum46wERaJleUNXPaGGVSoQtF9fjn7nOMnNCm6hlD//
         1uKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572300; x=1794177100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
        b=aQ7AUMqvKxT6V6Eew9DW9K1g8EiCuRug4MrObSLofym/6EtyBhCPWVOWkbxeOsWsYC
         dF/NCQYcgmur0CTS3nnfe7sxctqmqA5IfXUnN/jKAv7nw3SgMgMAZN1gKXGhaeE9iyo0
         i9TQvfnpcpV134m2+qDcjAZjLuMOeAqPjfokyv26RYBDOBX+tAmgbM8G0+GKDbNJMjgV
         DtL6mOY5qKiYpH3SU01fmmZHHzuPWyNrW62kXK9bzx9/SFeUy+0FiJskYbHSVGWWshxL
         45dRhjKNrDaAZ6nl87LQ/ybT7TiLglUz9AkDZO3BclrcrKHy65/6HOWQLGNgWigfGwx+
         W7+A==
X-Forwarded-Encrypted: i=1; AKwUvBx9h/5vifVPJJokTEA5C76vkJIpFDELLy6jNSo/0g04zcbjO0co8z3MYJzslRVYjghbM+g=@lists.linux.dev
X-Gm-Message-State: APuU4Z91pcxVsWAuYeTI0BR6WwKyuvoBgdUAhPxlNfl5e9wUv3acfXn1
	j1aMvMPvqJnZDNKBx7xGI/rDfcqobOBSf1g2HfFmzNkoVfDmZlt7eKjZ
X-Gm-Gg: AYBFou2ALmRuIODc/I6xV55orwTVe5d1hRD2DjxqE5Gp9SfBa6HwI5Sv68UQL254JGp
	a5FJ7MvX4Vh84ZRAIcQdi1V+wVNfXo/yk4KQpLZaadyH6G20jJp8XgUOM5zOTYXcadeAqpR3nec
	zujcHvEfbdR5EzDf7unBMm0O1ESVzpEewHuk4dgw0u+WnfzA/EOSgZi1q0VV+klMJbqVGftZ/dd
	ADQCVGU3iFgIdc2zFbkPMHa0DU1X821fO29ZdJEBO9W6EPHjsa7ea1YuuWcZeaCo5MH6mN1yMHc
	ogsMXRsCOehPNDh5+yEvtViBPWnWGTI/vFBXRMEKtxrRVRbSwhg8rCeHd3Nx83BGT/7+goScTFn
	f6Z9rdv1Sc9fVIhHxVZWQW1esVooEaiRFjyL+VNa+vFY3GIvIT7VbxGcPYYUJXNwd7epSs+ruAl
	1RTzhnHz0s7+dp0F8D3dy7H+Q89RcL+tpQzwppxcIIneppmTvD7eU8OLfFB5RW42PeCcYjXcMAa
	7qyAVCmhTbkstCjsxESy2kex/rDVWGdIacUAnyRdzjYdDhj72JmHCDdPoTLNNZHe1N316TVvYwt
	a/ocT7HJPcBPNvMhwrjdHs29mg6yN5H00umu3TlsI9366mcSj2uIU2E2eq413ew=
X-Received: by 2002:adf:e001:0:20b0:48e:d88:55f4 with SMTP id ffacd0b85a97d-48e6e2bc855mr15509231f8f.2.1793572300404;
        Sun, 01 Nov 2026 14:31:40 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:31:38 -0800 (PST)
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
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] sy7636a: power the panel only during updates
Date: Sun,  1 Nov 2026 22:31:18 +0000
Message-ID: <20261101223125.302001-1-pmazzini@gmail.com>
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

Read the temperature only while the rails are on instead, and bind the
regulator to the I2C device directly, with the hwmon driver as its
auxiliary driver. The regulator also gains VCOM voltage control and
waits for power good on enable.

Patch 6 depends on patches 1-5 and touches the regulator, hwmon and
MFD drivers.

Tested on a PocketBook Verse (B288).

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- patch 3: only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch 4: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- patch 5: no VCOM enable at probe, which also removes the probe race
- patch 5: read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (7):
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good on enable
  hwmon: sy7636a: fix negative temperatures
  hwmon: sy7636a: read the temperature only while the rails are on
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig  |   1 -
 drivers/hwmon/Kconfig                 |   2 +-
 drivers/hwmon/sy7636a-hwmon.c         |  58 +++++----
 drivers/mfd/Kconfig                   |  10 --
 drivers/mfd/simple-mfd-i2c.c          |  11 --
 drivers/regulator/Kconfig             |   6 +-
 drivers/regulator/sy7636a-regulator.c | 163 ++++++++++++++++++++------
 include/linux/mfd/sy7636a.h           |  34 ------
 8 files changed, 162 insertions(+), 123 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

