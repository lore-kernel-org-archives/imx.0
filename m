Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151243537CD
	for <imx@lists.linux.dev>; Sun,  6 Sep 2026 06:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675494; cv=none; b=u7cSf1qU414801O4bRvKKUoke7qKXKK3haAq0Zme0hdoSeKsFJbYF21L+pFNRmGFp5jZADGXomlc9zOedKW/BMbIcw6yDJk0KK5nns6fH1EhvMUkbJGnevn1ccYR6PMoBsBZKwEwmmJUBeXr1QQW3oISLbtRIb/dMrZX9lDJWoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675494; c=relaxed/simple;
	bh=xJ/1fdf2VHcAZoRO8dB70h+8smMnxhwjaZxtxBrqS3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFPpOczkZ/fsU9hdRnDqlGAMC3ibnZFWu80pJ7kPtPH7LN5IDzj83ysirIS4RiuuxGMd4U1dpH8LsUcwsnU1yTrpcYhR78MOKijqFe6oCsmBSKl8r+UbPMvRpqSUH+Kgg+zihQKkdCM+4ZgNWNmoIB4fZ0dBFp2zgtI8ELG9WGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSDNY/Jj; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSDNY/Jj"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2227384a12.0
        for <imx@lists.linux.dev>; Sat, 05 Sep 2026 23:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675492; x=1789280292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LOZ87VM/gxx5gotZR4qRLft5D8wWY/6G46t9t21bw8=;
        b=CSDNY/JjskiBKCkn11J1KWzZ92zsOYnC9iEZ7ERteUvA3whcdlJiihrGra7f7O/On1
         MWQnkm2wgmXa0Zl/rUcVYxJgfvtYcTKItchX8y07MT5yOVZ3+UfbLMuLUkTV4OrhYX0f
         emmZvpOZ4Indu0PgYumx8ty3mtOXw25bbWDTye7diG/0cpbqFidQwsUvwwKI1fr4DjKs
         Ah+fqQHZP3xn8qizlld9w2EeixPRoP383nxDY80RP5U2t6kxHM7p5F3MR9npxBLU6afy
         6DY+qIhhIiygMa6jdl6zyM4G2IjRe/ulDLExOflzebTrN3mYy0zEa+zvtR7B52SmP/ge
         CouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675492; x=1789280292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LOZ87VM/gxx5gotZR4qRLft5D8wWY/6G46t9t21bw8=;
        b=lx1TpnE09B2DBcIsi30keupBdGcejKVaeYftRr6Tj5N6oyaAFSO59Hh3Z1pcAI+QaF
         7WpWMq555f4poFM8Bq2nchcsCkZVKvoVWBbMJLHmW4mIbBIWu7wNcvE1QNPzAVRe6CPO
         fzV/49jKLaHkd3W7MNOien2S1NkQ+/SBLsJvqzl6YAUltx2BBD/MJmMYR1tENEvvWwxm
         AZpzdh81ELv6xkP9OWpI3ep61aVNq3dv7Dj1rdK5LlfMoZ1wNIlOiIo2wyhXmsbeIzXb
         fPgzdwtdDwM+N95TMfnXlZJxT5NHGIbINvarfZshkeYZihSMxVpuEoqUM/yRjHqNMdOV
         xQ7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzL6Mu9/XEF2unv3eCkJhnyiMnqxIOKgSj5mNyEdP4QyvUX3C7bgJKcBOUPPK2/our8OII=@lists.linux.dev
X-Gm-Message-State: AFuF++n87dOEJmD/PI+gOQWhbPhsAPP8a0UUmV/P9ZxtLXir7QrO1jH6
	xqp/muWsQAVr1jM6Utr1c9xUkuokHr+ma+fHb27gIEItmHhzWePD+G5g
X-Gm-Gg: AYBFou1u1Rz4J1bAH/9icrUuYxdDkXsUQi2zWKTvdMd1n3UIsiOYj01aAaJi74pTE1i
	6wcUSNo9mxo5UPfpp3V4U8w0wKq1lHoJKbkF1wKB/8EEqj3SZsn2JekvJOJLyclL8Mo/4ot3Eq9
	CbicAaHJHPiRqjh59TuwTAKkB+ay2xsVAjQQ1SNJA4bTirp6ya4QwehPra91M451yQn40SJlYYC
	8071TzfB8c6hO5uqKAVIUrFOyLGiBIZ/k1zcokxO3Mz8qAYG/aDiSzDy+dbzStEpydkjOkMVC1f
	v+bVV7JI2SowNxE0EPWoA7j9VlQccqgSnXO4boFiTMorGxGm3oqMEkzJ3FRtfaA624b5ZOv5cxN
	8ttRZz2/A0IcWbL7t36OXM9D7m8ZTZTnHXbsqnk8qvBd3CQX3nqG/axtlvwKSx86y4SIUx9RgAK
	hdlxt678XezF05Ej5hjtl2LVcrscmrQUtvoC8+l5bmJ0YYjoHgBBhtiToDA5d1
X-Received: by 2002:a05:6a20:9c11:b0:3d2:3e73:29eb with SMTP id adf61e73a8af0-3da39bb596fmr24951780637.1.1788675491987;
        Sat, 05 Sep 2026 23:18:11 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:11 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 0/5] PM: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:49 +0530
Message-ID: <20260906061755.5103-1-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is a cleanup for subsystems under power management
(linux-pm) that converts several instances of error pointer printing
to use the `%pe` format specifier instead of explicitly casting with
`PTR_ERR()`.

Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
print error codes returned as pointers. By switching to `%pe` and passing
the error pointer directly, the logging subsystem will automatically
print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
`CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
numeric value otherwise.

This change significantly improves the readability of kernel logs and
dmesg traces during debugging, without introducing any functional changes
or side effects.

The cleanup has been applied across the following PM subsystems/drivers:
* powercap (intel_rapl_msr, intel_rapl_tpmi)
* thermal (core, cpufreq_cooling, devfreq_cooling, mmio, etc.)
* cpufreq (bmips, cppc, qoriq, s3c64xx)
* devfreq (imx-bus, imx8m-ddrc, mtk-cci)
* power/supply (various battery and charger drivers)


Sumeet Pawnikar (5):
  powercap: intel_rapl: Use %pe to print error pointers symbolically
  thermal: Use %pe to print error pointers symbolically
  cpufreq: Use %pe to print error pointers symbolically
  devfreq: Use %pe to print error pointers symbolically
  power: Use %pe to print error pointers symbolically

 drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
 drivers/devfreq/imx-bus.c                  | 4 ++--
 drivers/devfreq/imx8m-ddrc.c               | 3 +--
 drivers/devfreq/mtk-cci-devfreq.c          | 4 ++--
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/axp20x_battery.c      | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/cw2015_battery.c      | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 drivers/powercap/intel_rapl_msr.c          | 4 ++--
 drivers/powercap/intel_rapl_tpmi.c         | 4 ++--
 drivers/thermal/cpufreq_cooling.c          | 4 ++--
 drivers/thermal/devfreq_cooling.c          | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
 drivers/thermal/thermal_mmio.c             | 3 +--
 drivers/thermal/uniphier_thermal.c         | 3 +--
 20 files changed, 35 insertions(+), 39 deletions(-)

-- 
2.43.0

