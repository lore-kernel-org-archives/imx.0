Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709F484E14
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563017; cv=none; b=hTHGY2lckHtgYmesWqMDmHw/7R37uCXXEOdhRgIDPITk9/y4b7IJrPJeprb7FyCLtfkGu0zkpkz/0V7jfB6ua9KDJJ1AR7BL1xBsGSYXTj1DQyMZzlpwAjBe+7LBDwYuxjHyTtKn3va4FmX8rAYnRcR+0xhAoMEzHNxMf/t/RJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563017; c=relaxed/simple;
	bh=8u/RKtoqbxN7uxSrDW1oudpA5Vw4YPRdgvHxBWSbWZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSx9wkJKh9NwhMqn1Oi/ipj4k+6m04dfuAmcxN/sKvOIPsKSWYb4RsJvEVIlbpRoRZU+sL6NBOkgNnE9/PkKGnq118coirU6kn8ay9DXx1IA5JPwUQDRkiCkFLvngrGQbpwdbQWlryORKsf2q6/0m8tM6fA1njB8v+GA06Llii8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMGM2/7J; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMGM2/7J"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-714186ce2f2so2558537b3a.0
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563016; x=1725167816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqe1CPNPyPwWJltZY/tNpoPncj2b2bW7ofGMYanWSqo=;
        b=gMGM2/7JILTjV0+cBhgA9snNKDY3ufsmNPkeQN3Iiaq3xd+H01tmPADmi09aIzBzKH
         ekQpKgU5gRMFw2Ri8gAuCM1LMPg/z25dAV/3WyVHTXG9g89d/bxGQf0IcQXL8qyOTZEx
         qZLs3dTgBb+HjD0VDy4Uz2ZLIidodrtXolGZKlkXaBOOMBWDNTKfWyIOgoN8XQ72W/6V
         lE39L4NsiSISbIIiemb0g8o1BOXfh6H1ryw+1uhJroreAt8PwvrAoNSBbTgV1Q3BMasa
         kOrZKnm1Z6PQFxrvF3nb3q7gzH5KvrStiQsahCXQMCiZs2pR2i0mDtsUqwQ/oO9A4YPz
         zD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563016; x=1725167816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqe1CPNPyPwWJltZY/tNpoPncj2b2bW7ofGMYanWSqo=;
        b=jYhoSzfTmw96Ub90mrwoM/8WdfvE9uX1YsyG/kQWCgi1QfaryexQT8eN0/qOGEwBFi
         rBq0Kta3bQr8JIq6MDnkLRyCkBbeqbEuMvNpuRi9K80Em1bRSLQfxRxywLDRcw46SuKW
         xNVwhlu2Abdivcw4b/pAdGwc4P9xWZZg9T2afW//XiMzhV8IJ5O8QONQFZJD+MdGX1rM
         8KcUzXOkKR1DXxEZfEqud1qRTM7Ib8bKNpDqkgNMe/sLS9NYQNisLdEKTXUWVo8Hs/pD
         F/8/mIJ0bD/yzkx7wvufnZVi2EhZSniJYVwIB1Ebil1vKeAvnwjzXPhzemu6aN2pCAoK
         KPqw==
X-Forwarded-Encrypted: i=1; AJvYcCVIqbSOh7A7pgaqVbrpmFju535UwLPjQX9LjUCrax1ayAly8McaukHuJXYmoQgeZbF8jpE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUuL+DWdkCSQMtkAHGmyniU3YZNbvb79uXFsF/sDY/qb0p1E1B
	QFohHzIsqlkk2utxy1RJx3T2mLucYgy7+GDdwcWJwkE6Q9800W9ZZ6yIZg==
X-Google-Smtp-Source: AGHT+IE9hfgPOc8K99rlo2yxdGDK0Km4IWYmEWtHARTyEvzXLFTX1fk3uYEqzkP6IiseW8pPeV5XNQ==
X-Received: by 2002:a05:6a00:228e:b0:714:2cea:1473 with SMTP id d2e1a72fcca58-71445883e36mr6910331b3a.23.1724563015700;
        Sat, 24 Aug 2024 22:16:55 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:55 -0700 (PDT)
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
Subject: [PATCH 13/17] Input: pmic8xxx-keypad - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:17 -0700
Message-ID: <20240825051627.2848495-14-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/pmic8xxx-keypad.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/pmic8xxx-keypad.c b/drivers/input/keyboard/pmic8xxx-keypad.c
index 26a005f9ace3..35d1aa2a22a5 100644
--- a/drivers/input/keyboard/pmic8xxx-keypad.c
+++ b/drivers/input/keyboard/pmic8xxx-keypad.c
@@ -630,12 +630,10 @@ static int pmic8xxx_kp_suspend(struct device *dev)
 	if (device_may_wakeup(dev)) {
 		enable_irq_wake(kp->key_sense_irq);
 	} else {
-		mutex_lock(&input_dev->mutex);
+		guard(mutex)(&input_dev->mutex);
 
 		if (input_device_enabled(input_dev))
 			pmic8xxx_kp_disable(kp);
-
-		mutex_unlock(&input_dev->mutex);
 	}
 
 	return 0;
@@ -650,12 +648,10 @@ static int pmic8xxx_kp_resume(struct device *dev)
 	if (device_may_wakeup(dev)) {
 		disable_irq_wake(kp->key_sense_irq);
 	} else {
-		mutex_lock(&input_dev->mutex);
+		guard(mutex)(&input_dev->mutex);
 
 		if (input_device_enabled(input_dev))
 			pmic8xxx_kp_enable(kp);
-
-		mutex_unlock(&input_dev->mutex);
 	}
 
 	return 0;
-- 
2.46.0.295.g3b9ea8a38a-goog

