Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849DD224B12
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206550; cv=none; b=KMexv8DMIPJsejtdhfhBgdrWT6XlNomPPdonfh9OVIJNt31OZx4xV0wAQddauU5S+44TNnGMS33G82KltGrRAEtCdNmbVi0AOUF56XGjnltdRk0+h8Vs2UK5MZkhPVwaC5/gZtBqWPzKwYJpUPPKcN/STZt10bdw2oU7vo0IuME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206550; c=relaxed/simple;
	bh=1l7Q7mQCi20PJnWdAgkw5bwW4RtzSVmvw9PlHRaT1qQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cSTFzzcKyD106gPpCcVzbJ9yNhAbPSAs0gTdDSaFdCgQzTCy/3fngOJViGqNHsFVMwz7LyW3WQnIfthPN8D8UHbkFS2lea/HU1s6SuLeHii4NqLKdrecmi7Hrj+FsDmAhA4P4fIy350XZjLM8wKM2YHdcFYpsTNMw+QuEp0n5lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNd0bgkK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNd0bgkK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3264794f8f.1
        for <imx@lists.linux.dev>; Mon, 17 Mar 2025 03:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742206547; x=1742811347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1inr+33gW8u8hP4Pm7UkuMSAgyxld8yZU4o4J1pFB4o=;
        b=QNd0bgkKEulXxlQPTly7vFx0mE/a8DCRFTbAlc50Ke68CHajsZIW4lgM+7mTit/FGx
         8cdxNdZskSWj79GusN62V8PXw9t2DdG+REo026vE0CIjoOMWtW2Gca2ny0PtjDUnbMRQ
         cf4TRy9XEp8Yyltqcs+Eoo/uhfqq6wVXam/9ud2K9wilG2ExeqTISMjgpFj5p6SmfrXh
         xk/3Chmr1gzGv8MqVBlTWVokYLXWjiR83Wb70yP7Z3L2U0NJB2rVi3NAnbzE2Jne5eHk
         AiM6ysH3GCU6ZEvaghZUg1lm3JMwX2l7H6IL05uLyvMfwiQYLX8y3LJdmxV0gsTGrlJO
         srEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206547; x=1742811347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1inr+33gW8u8hP4Pm7UkuMSAgyxld8yZU4o4J1pFB4o=;
        b=bakw+A3TLr4l3FGlIL8IhYYvXoW6ygTRn+8g8aBG8+ggYBz65lgtzGDMLz9X/PKUUa
         Niy2qW7GWnOKFMxl8Y6bmwEEtP0R8pyj+aY9q32LUJZ3D25GcfL8QzZ/EapxZTv1b96X
         Qd8PKmYzLnb4WsfrkihY4Vixhyku/2TJngwi6NhQbVD2+FWOZffAKKJgt8pukZFF0Y9R
         dkIGFXCayv4y7IknPt6PU5XJ8Z7UPm06zRgyTrNIOTvXGtKQpJ3p2mYgfFjkQm0iyKfp
         +AAPJ3vlmg2MhKdbT5ZDAFBfaXH3E55tTRIDTnTAYV4jBtMUyHDiku25wwYicqkpt5AI
         GbGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWVNMhvp5x9CDkb6W9MIk5qVckaQQOsTHZnIlhT5mWm45eMPKLkHl1ynXi19ZOrDJTyIw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNdUbKarXOzAgJ9JWAFWZdSuIZdbaqI6k0Birp/RjHFJVMWEsb
	thw0u8sheCXYR0e0/nDgD0q9WZ0tinjdDeK4yjFWlEV6DZrU4ypEzcjmHw==
X-Gm-Gg: ASbGnctEC2dWEWOw4nU5x3hJJkJIr4C1ViFEBLorE9N17rfec0plaHWEvI/wN2Aw72F
	CWLC2pzfHM+EaddBYgXqG4k14SMcDvCB2XeDYudJx2Fkx5r313RMHpqNiFpSpU8HJyHSL70UjFy
	WLbcbrOYEx6/q9gKl2TwfGj7+nonmcp/itYQx0FqDQ8RXo73x8PyPpq11bFKCPK42ePa5z4aPPp
	2GUWPLzlP3DLS2NhFIAX96sl4Alg0rw7w4BygazZytd0G8E5sgD2llXNnRwSHn7SAql4h1JtPG/
	t4xXDaiH5LE4/dcqiQdL2RDC/jdqakYIUqi+4yh2gQJ4
X-Google-Smtp-Source: AGHT+IFLlVRG9UZxYzimW02KbeiSJnPjwwmBF+OFjbkEFVEbZGHX/pcf48br8RKhpFuzAASnYKk9Ww==
X-Received: by 2002:a5d:6d83:0:b0:38d:d166:d44 with SMTP id ffacd0b85a97d-395b9a1c648mr15775914f8f.23.1742206546408;
        Mon, 17 Mar 2025 03:15:46 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:12f:b743:681a:75c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbf901sm99582255e9.15.2025.03.17.03.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:15:46 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: svc: fix signed/unsigned mismatch in dynamic address assignment
Date: Mon, 17 Mar 2025 10:15:16 +0000
Message-Id: <20250317101516.19157-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

svc_i3c_master_do_daa_locked() declares dyn_addr as an unsigned int
however it initialises it with i3c_master_get_free_addr() which
returns a signed int type and then attempts to check if dyn_addr is
less than 0. Unsigned integers cannot be less than 0, so the check
is essentially redundant. Furthermore i3c_master_get_free_addr()
could return -ENOMEM which an unsigned int cannot store.
 
Fix this by capturing the return value of i3c_master_get_free_addr()
in a signed int ‘dyn_addr_ret’. If that value is negative, return
an error. Otherwise, assign it to the unsigned int ‘dyn_addr’ once
we know it’s valid.
 
Fixes: 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty issue")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/i3c/master/svc-i3c-master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index f22fb9e75142..eea08f00d7ce 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -998,9 +998,10 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 			 * filling within a few hundred nanoseconds, which is significantly
 			 * faster compared to the 64 SCL clock cycles.
 			 */
-			dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
-			if (dyn_addr < 0)
+			int dyn_addr_ret = i3c_master_get_free_addr(&master->base, last_addr + 1);
+			if (dyn_addr_ret < 0)
 				return -ENOSPC;
+			dyn_addr = dyn_addr_ret;
 
 			writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
 
-- 
2.39.5

