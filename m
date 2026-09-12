Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5973A255F
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 19:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240341; cv=none; b=TEBpYIaHj1NYf4ULeH1zou/wxJ5+PVfty+LawEAVG17oyhfSy9GO8n9wtMQsQxzskGBys4HRSL0Mhe74SnrDN7X0Zet5+blrrGgsO9c4xtFONymt4C+ozFc8nteczqDRFnFygEwgVa6Fv57E5rk69YW2DrWdNR0IKxdcAw22NHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240341; c=relaxed/simple;
	bh=JlupTLV8Cln4XfTiHb4RxwCt6Slbwqs/r3cqkHuWFwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJOUeqEutokzOOFCMNeh7XAMpd0E7Hw8XtHw7lSR2fOQXpz6G0NlyP3KG/5xIEQcjUuz97tjd7AN1r0XSnmEVwOQbjCk4YuNE/q/6c82asOMUljM0aJ44EAtc7ydBQ8oPUBSPv///f1qOh2JneRjvDxD6ihHLFFQyTtleN2U298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgraU/j6; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgraU/j6"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c4so1056399b3a.2
        for <imx@lists.linux.dev>; Sat, 12 Sep 2026 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240339; x=1789845139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghx8XBCWnxG/J6Ds3c+N5I7YNs+hz5/VoWXUJ3eWQPY=;
        b=kgraU/j6mqR+avuK54d5H7nwoycM9F1FCPK/YEFtDrpCRevXBNCsZcvdAmYCm4SzID
         xzpVRBd4FvpGJebitkHcwVRJD85aEb/Hk3GlxWO5/UBROnBbyNRIVIewlL2AHFaO8RUy
         /9YqRg1g5rRFlBVmyzmfl67vHh5J5Mm/M6cvIZ2BG/8Rms+26g8UyUH42brmmCxio2WW
         L6pwbTc8ANSQtDO5FLjbZTq1k2/uBNUj+u/BgyILgVn3HpAFKf6Pzqb/VwLmYda6rs0M
         ChmxMV0kopD/9WQvOkEf2vQ3JLOfz/j1DdJ8vdmPn1zy1QCipeRX8Ax5X22qyZHXVXHM
         qhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240339; x=1789845139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghx8XBCWnxG/J6Ds3c+N5I7YNs+hz5/VoWXUJ3eWQPY=;
        b=RoLQYWSDR8yB/KDidNwwwXAzbJ/jhUqmSwbyNDWZOLVkhrZR6CJcVe9f7vokVVIxVi
         nu39qBA1aGoMOJAaz0QspqgNbUIq0Ds5AHPy7VpLrNp2ZbE/pfMz5mRKxqBLtP5+OcHb
         JxIAorPIC9OWf2urWzpM9lSMgERMNXwkpI9+y5auVUPLwxskgebU7HTigTCKk9VlHm8g
         I+wBCtRL6jXkCaYsk4Ky0ozeP7DONUFux1tHv59+G+lMf0CXGm2YJjGanwckn4vtJmhY
         rMM5rN6D18tC5dU2XP0+5TUw+jdjNSajecpJtrwbfQ4qEcoQVnN9DOECGEncxdBFi/yH
         GRIQ==
X-Forwarded-Encrypted: i=1; AKwUvByYg0DgY9C3Qcu9lVtlgGg+vzaWuouGYeG6ctczF2aDeizZ7S2T3Upi43y9u5tV65tzyZ0=@lists.linux.dev
X-Gm-Message-State: AFuF++k2hbd6b3vo8SoKR91hanz6kVRdmauAMVedLg2NpMPCBq4EN/hV
	wqXm6VPWV0rP0G3VO6M86ZK7UfvdU3qK8J6ezlA7wZvXIWwH4GL6T0jx
X-Gm-Gg: AYBFou3q6u0EWQEBIHOnGGPbvG06tX8sUaqeklvsXoChyLN2tTjQ8hsmFSvNii1aFQb
	15lMzq8yurCRwzfa2ziuaM1n0pZJn7DGnShYqbsz3FnEsTYKzotGQ2cA/8a0M3JfdpMfD0R0yVu
	xViZz4UaIzFHpwsF+4KnQG8GM5h+Yf6KXhqXYuZhKQrrE/vaachuq1n7hw1z9kGk9vH0MbBv8Ex
	KCg7N7P9n9Ym6jvSr4cv2P2JXUeLvA0kTV3OBMH8tzzqPx1ZI7YMsSvF9g4ZDUzuqdexxG0N+80
	kTcnlM6ngznkl9bDB9Bf4Qzi2JehiHNHTiPxr8rlhhUgEY5JgUn8J2fc/p+fS8N38OHhoJHUyDE
	IKP5dDA9ySR4RojkH+ZtZaMYhvAYUDHIsTY+tX3gq4DY85BOFqd+seiasMqlClZoIsZCgHkbIFW
	I6wgAUcD/nFD/uTRep2Nos4fDLmK8ufamLZoh+pkYUsJL+OmvaqfSx/vCHQ2wDhQjsoskJ
X-Received: by 2002:a05:6a20:a128:b0:3cd:67e9:8565 with SMTP id adf61e73a8af0-3daed19f362mr18812158637.9.1789240339105;
        Sat, 12 Sep 2026 12:12:19 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:18 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
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
Subject: [PATCH v2 0/5] PM: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:50 +0530
Message-ID: <20260912191156.185448-1-sumeet4linux@gmail.com>
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
* powercap (intel_rapl_msr)
* thermal (cpufreq_cooling, devfreq_cooling, qcom)
* cpufreq (bmips, cppc, qoriq, s3c64xx)
* devfreq (imx-bus, imx8m-ddrc)
* power/supply (various battery and charger drivers)

---
changes in v2:
 - Krzysztof kozlowski suggested to use dev_err_probe instead of dev_err
   for *_probe() functions during review of v1 series. This will be done
   in different patch series.
 - Here in v2, reverted the changes for dev_err under *_probe() functions. 

 - Link to v1: https://lore.kernel.org/all/20260906061755.5103-1-sumeet4linux@gmail.com/

---

Sumeet Pawnikar (5):
  power: Use %pe to print error pointers symbolically
  devfreq: Use %pe to print error pointers symbolically
  cpufreq: Use %pe to print error pointers symbolically
  thermal: Use %pe to print error pointers symbolically
  powercap: intel_rapl: Use %pe to print error pointers symbolically

 drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
 drivers/devfreq/imx-bus.c                  | 4 ++--
 drivers/devfreq/imx8m-ddrc.c               | 3 +--
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 drivers/powercap/intel_rapl_msr.c          | 4 ++--
 drivers/thermal/cpufreq_cooling.c          | 4 ++--
 drivers/thermal/devfreq_cooling.c          | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
 14 files changed, 25 insertions(+), 27 deletions(-)

-- 
2.43.0

