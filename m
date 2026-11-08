Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130589;
	b=pg5ltqTCVDGB0FSrC7rJEOnOZyjHxZIzdXhVQwXfmI63VnnF7aGEqILcKeEgIz7V5X5E
	 U1yNFyJW3WihQlcsqX9YxO5GLfJAo2k5ZgFs6rnoGcJ8bt2RuAiUnMOdyvmPyNxxAHh7P
	 W1bnFC7ok+koPXoFDQZlOUwkqWysJLRsYNNb+yuNZrkNc5k5WE7d+ZvJt/2jk2nzc6O8D
	 EnEqk2ADHiCoo0d7ooL4UFkcjWCt7sMVXjFDSPz0+tZlUa6OSTS8E8mgscvMQJqV0L5/T
	 o3g4VOsgTip+EYpWw5KG81nG5TIoJGu/+bZqUqqLJMqSwbBTsaQThaZ4D5FYkN+vO/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
	b=Bhxmfd/TblvKNVFOG6xN9bnpm15vIVHgS5iMz0jhy6f3uNZkbLTSa5QouuFKPaqtVCwr
	 7dl4qH1rhliXVGZsrmqtQYWmA061JOpoHIoRhHm1+5pHluCkXpUN7xNBQp3mzzt5R0Tnr
	 tfflD4ynaDHXMWkoP/447OpMpmfqDExaQcSH6OIu0j6sY+ZeBeIO4xHB0NXS+3+EkjPMO
	 NBmLs4aghRIvd8eLfdng5gT8Cg/0677PLDNjJ7aQiHIGEXruPoZfIskKlvqrHh0m/pUS2
	 lIQrBUuPepUW8Sv6hVaTOFye0Cgeitr/9XBGET63ZmQjkZX4k8fV05xEdRhO+fEELxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7sEaTI6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BA4606A31C
	for <imx@lists.linux.dev>; Sun,  8 Nov 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7sEaTI6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so1793525e9.0
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130587; x=1794735387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
        b=r7sEaTI6nj1WpZw37FyHT2fHiR4Rem2J8RiR3rU8JYx16JNSPgUKuOTvnxMJhAK18E
         8qQYwewcp81rSFD+iMGO7EB0rfXJlqPO/wXQiVeOzOu1O5hqs97EAbn1iZPCLBtFwXip
         mQ/g7EWb6ti8J7cORn0GsbU+Mv6QOqGBo4R/nEaWt8kaf1YnKIZxUjKL88AXiWfRCRpO
         Nz1BOPsR05Va+L/GEtHOTLlucdeiS9KeNCh+RasKydl2bZt0HgUPMd0yyWOBvTqG2WR1
         sQ2utiB3cMQGf5gvkE8qYatCG189uhA6RBvMjypb3HfGN2eL0tu+YUUztVTMFZ2GU6qs
         4jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130587; x=1794735387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
        b=osKGAULRekxiGMUcKiQtBGdrb5r+tlEnuOJ0Y5vIeuxp1DqWwtfPUwmCeA9ChaFJSU
         uRYGjmIxcSsvxurh4+aif1OY2TncgD8P6E40vEKCJctraeyXbAsN5ZcOucRUb7OCTifZ
         fB6Cw18CBOYqxoAESqmSTcThqhR5MLDvxciiNB1zxHdevi7npNPd0nOS17xinJ1jKOYy
         cIeRYg7UoTdmqd/JNSO0WQ5n1kWtaeBMLjMlYfZUhfj6tRZCqubcWThL+HKGhYzPVlCW
         l5cWGD6XKJU5tlEDaedmlb+6yHzAlongkxqeZHbBy+BWWX1GhZ81zY+8FomEtgBpPC8p
         ZXqA==
X-Forwarded-Encrypted: i=1; AL+hErG/kvOgBa/tZ2NXzIiIbtYazRR6e4HoTbxukPpVsm9Sv7SnnzhCuw5/k9Hh2iq2kDju+LY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9pANfhUx0H1bUvN3NaEg1MxWBZWu38fKer72j3b/ZcjhtygsQb
	MyYm5c6DGmk69ho+3S3/BEzHKAFmsp4Oqz5flqboPauBZHivGgHGXv1z
X-Gm-Gg: AYBFou3M11rnRI8mbaJq7MaxZdo8hFi00vRZ8GADFW+Xb6yPBtl8fSySVYje+xUa4RT
	DE+J/UQR4LrshUsh/CSmKxGUZUQ041NARCXKIo4CwxJPlamNneZ6Bc22PV8hXDjpPsXIZHDxLpz
	mzuSakUHxBHEhDC/9xjFY18Wn/yQmB6eV5ueeAPjinQWp6VdW9xvOHwApUCRgEsPdk8tvNMmO89
	kDt4a7mF15ZreU4BM1kin6cm1Xkt1ByRfRnPG0UiwD62G6r5uOapaASObSJt2zyW1Q8sCO+sjDq
	J5eP64YZx4/Hvi6zy5SFijmrOS7Cl7qA5gm2CA+YViC6FzfO8wnDuT+PxwQ7kJvCqZjxpA372rB
	M/ApSsPgSFdkY5O81fnRtj5opxZdT3rwyo1wkIOAWKbn0Yc3rJa+KiJeJh828Bz9949nrSWeH6k
	34YUWFVAU2c8JEXWhO93GfX2VCvL/ncr2WynSs6CwQSWoCRsslupymeQGGVcZaKyhLwuRJifO2d
	u/+JlqkqDBq0cDX2lCM8jNUrMeXuwsEVhLoMRT5De2bPTB4BKK6i6Eftda9RdKyJId8SQkvNL/d
	cdLN2g57fjystT81Rmhvcx2/6UJxYe+NmLpqG14wp+nNIyvAl8JZAUTM1rv+6PI=
X-Received: by 2002:a05:600c:1c0c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4b963c69d23mr19923505e9.19.1794130587155;
        Sun, 08 Nov 2026 01:36:27 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:26 -0800 (PST)
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
Subject: [PATCH v3 0/5] sy7636a: power the panel only during updates
Date: Sun,  8 Nov 2026 09:35:57 +0000
Message-ID: <20261108093602.329554-1-pmazzini@gmail.com>
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
auxiliary driver.

v2 patches 1-3 are in regulator for-7.5, so this is based on it.
Patch 3 touches the regulator, hwmon and MFD drivers and removes the
MFD header, so the series should go through the regulator tree, with
acks from Guenter and Lee.

Tested on a PocketBook Verse (B288).

v3:
- drop the applied patches 1-3
- new patch 1: no wait when power good is already high (Mark)
- move the I2C binding before the hwmon read change, so the hwmon driver
  only probes once vin is on (Andreas)
- patch 4: explain in a comment why power good gates the read, and its
  limitation (Guenter, Andreas)

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- no VCOM enable at probe, which also removes the probe race
- read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (5):

  regulator: sy7636a: don't wait for power good if already on
  hwmon: sy7636a: fix negative temperatures
  regulator: sy7636a: bind to the I2C device directly
  hwmon: sy7636a: read the temperature only while the rails are on
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig  |  1 -
 drivers/hwmon/Kconfig                 |  2 +-
 drivers/hwmon/sy7636a-hwmon.c         | 66 ++++++++++++--------
 drivers/mfd/Kconfig                   | 10 ---
 drivers/mfd/simple-mfd-i2c.c          | 11 ----
 drivers/regulator/Kconfig             |  4 +-
 drivers/regulator/sy7636a-regulator.c | 90 ++++++++++++++++-----------
 include/linux/mfd/sy7636a.h           | 34 ----------
 8 files changed, 99 insertions(+), 119 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: 2a1984b30e9cfcb306a076cb4b9e68d71daeb45c
-- 
2.52.0

