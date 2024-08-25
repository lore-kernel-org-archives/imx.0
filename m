Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9453C13A259
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563022; cv=none; b=AnGoqCpq4WBvZyW58kqcf6ScQ2cOC9xtq9PGfOdFp0pZwzIBBViuodLyuYHvVdpJsZ6QdfNfS4mTn5LOJngJgBzUod5qlM4N7fEEwXkAjwb2nd0+S1NrUiTFiCUidXWr/JETjYr7WVe/Rqx1uhsCGsVCx08/Peyoa36SvIveO4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563022; c=relaxed/simple;
	bh=IrS48fhMXQ2EQDYHGq/C0cKMwPzDtqfAfI1Zv8GuGP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGMWIgtKIQAxAlE/CFgKmITZYV+3r5NuEcMMOFQTaJsg+adwAVlcloDthK/1/8nF65ZQia6cF16L3kuetqNlDEuXFeBNanr9a/AeKbRDapomw16TRIzuVqxjtzWSGWQ8AC9n8Oxg1nWSeAe7LUD/2yBbqg9EkKD3hXsjDfw55Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlHNhwHf; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlHNhwHf"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2703967b10cso2397341fac.0
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563020; x=1725167820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NGHCiulzh9gyI30mSR8DfFWb1nfUXRaAntbygPzyeI=;
        b=SlHNhwHfSJbKfMelDc1AdllUc18GQ0MJKLzV0pW9YTuLGFmEdHm0LgIUq5dZFFjgrQ
         P7tx50cvUrmlFaTbmH2N+iz5VfzNN0wat8cP46Mhiynv836YQa4nUdzoSZn98l4hSUoD
         3o2/W52fWbJ5cWBCUUtzAdarA6qTxruvv06oZe5zjctRhmHbv78jxDRZSmx1wRS1pU5q
         rkt4KM6QJq3ZqrGYIORFsSxPzJyNFS2oJT6q0L+c5KCdgV6ZMv46PT9m4Es8S/4LSaPA
         +jQUVJeTSHth/roQQZ6AWoYnGiljlECaMLsQP92D2jGA18YJhp7zh9ojoT4mmSUZNM5n
         2c8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563020; x=1725167820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NGHCiulzh9gyI30mSR8DfFWb1nfUXRaAntbygPzyeI=;
        b=goygVHtbPJRfBLGhi4vtYfuDEYYoNxDfmW/smOJPAfWGyX249forJLZGmDAZXfWsC2
         CSvRMCULqeS/T0SV6osXRNZ9GwmPcpI18ELiDwoXupPX1o4KSulo9fL7cUCYIIJ4tgRK
         gNxdTg+YczjecP+AMXZhOHBdPslDXx/PKM4WtmIP3CSgz2iO8nrwOQVvi1zUbneAGeL3
         Xcrd1vnC3yi0wFtqB9O3ERO/cfyAZwUZ9vARC/1R8XNHJ2UCMlJbt8wunD0tNM8J1rwc
         MfTRmBTw4sewmkA91IcjBvPdmJ6DAMPUFuah0F7VuYMspDrsCKl0Y5VORLz3/CEVUtGY
         D/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXarqq8zloQl84frGbOTKC1mD/N5p14WE2jsxFEktjLyg5s2DkmDofLBP7+oN5FApoplbc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0w+toHJimWJInjNVjBeSxqrx2JIKev80acsEyHzdws/8kuObF
	6QIvcNysZRSY9crQ0u65jBoCVbcXGnQyPVqwMGNsZaf9VpxvDusr
X-Google-Smtp-Source: AGHT+IEQYgbglgd8I3qc/P81ZQRecoGdRxN5BkyvLrd2/7rQzAPvHkH9Capk9njsg6VV/xAvADHbUA==
X-Received: by 2002:a05:6871:2284:b0:270:b0a:cc0d with SMTP id 586e51a60fabf-273e64321f9mr7289887fac.10.1724563019693;
        Sat, 24 Aug 2024 22:16:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 16/17] Input: st-keyscan - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:20 -0700
Message-ID: <20240825051627.2848495-17-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/st-keyscan.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/input/keyboard/st-keyscan.c b/drivers/input/keyboard/st-keyscan.c
index 0d27324af809..e53ef4c670e4 100644
--- a/drivers/input/keyboard/st-keyscan.c
+++ b/drivers/input/keyboard/st-keyscan.c
@@ -216,14 +216,13 @@ static int keyscan_suspend(struct device *dev)
 	struct st_keyscan *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input = keypad->input_dev;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
 	if (device_may_wakeup(dev))
 		enable_irq_wake(keypad->irq);
 	else if (input_device_enabled(input))
 		keyscan_stop(keypad);
 
-	mutex_unlock(&input->mutex);
 	return 0;
 }
 
@@ -232,17 +231,19 @@ static int keyscan_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct st_keyscan *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input = keypad->input_dev;
-	int retval = 0;
+	int error;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
-	if (device_may_wakeup(dev))
+	if (device_may_wakeup(dev)) {
 		disable_irq_wake(keypad->irq);
-	else if (input_device_enabled(input))
-		retval = keyscan_start(keypad);
+	} else if (input_device_enabled(input)) {
+		error = keyscan_start(keypad);
+		if (error)
+			return error;
+	}
 
-	mutex_unlock(&input->mutex);
-	return retval;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(keyscan_dev_pm_ops,
-- 
2.46.0.295.g3b9ea8a38a-goog

