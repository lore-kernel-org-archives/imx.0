Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB22207A32
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770819766; cv=none; b=sep77IgOQZVoJiyRHDnkl0sO4xqQCy95CW1kzH+cOaa/EnYYddt+DMMHz/kviKG6jA+uYcZC8f1/15LiqVBlJQQOkY7MbMnndiJsw1ecQPaH+hedEvlrYQhs9gZhzOqK4QkbYDAmGYI17i1NPLleb8BwpvwYCG8RDahUT6lsjXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770819766; c=relaxed/simple;
	bh=Y6VzJoPNwC7JA2717m/vF6bR6Kk1n0xBDh7/ZtoqI5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dnLtXjcGJsM6/PXTHenQ6uWzYSgdkptf35cIFgZwsucnrTNGeilOtmpoXUuM6qq+s7Egf4jIrWrjgFYgwAAerbKNFf3UffSSZO6+jtaLONy/wSGqztaSd+Je0HkPdLjr559HivWaFzJ+nkoKKdJ+BMYiXTZtWuWzBIIdxgGGnaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBE91nv/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBE91nv/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a8a7269547so60974025ad.0
        for <imx@lists.linux.dev>; Wed, 11 Feb 2026 06:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770819764; x=1771424564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i2a0yu6RlT+zETdd3iQNLEBogdpR7mh/Nc5hRgZU3iE=;
        b=mBE91nv/Xocn9b/L5TCljJJRq1mgPniuEhPXOTKSb2YQVsqv0CdzVp1KeJLPifUeyO
         R0ySg1BD+ZEc4rH95kcERmP/yMGlu7NY4dVqt6DMzWi2zfzbAXBXQ9uFL7SJtXuqb6hx
         /AVk+7zJnDqVUJHaju94fDzoXuCWRCAQgvrsxeD5/MsPGkNoaXVJ4Wzbv0bkXyYU4evG
         vOQmaKVbEcfsxFCPd0/UEd2w9RDo35c9a+3EsqRz3MnGkgsbElyDmE04kV1A+nd8QBU1
         En1ydjEb/WmIH6ZxeXRN+4lSaVyEUM0m0LQcyBx5r3U4qVXtXNSy7GjHeJIiCGkrrHt1
         D5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770819764; x=1771424564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2a0yu6RlT+zETdd3iQNLEBogdpR7mh/Nc5hRgZU3iE=;
        b=kJHn2rvAmgMVZJPnpnenn6boO6ZO8FNPtv+VYaIUDKoZt5j0pH3coCB5h9SlnMSL9G
         IwZACrh/NuiKGhfen/VqiSTJQG22Jg3JcvXLlXUh2Mf8tqi0cHMi/ymJZwG3H3T0/yiE
         jDzmoSLd30s0XMAPaApconMJQ5dZiws47tgc0ofiDxSsicWs2MmKgKBYVbuqm558Nz3f
         UZ47WGPiZt5YNZxQYeCIqTZ9Xhc6pW9sr2uwpZxAvElWCsr7BQ9Hi8krFh+fbapoztpg
         prWinmW/gxJaKWOE+xf74qu9AXo45QrTdH9E51BSGNI7SeJZk+wBcqMhSa2czzPkqfVL
         50IQ==
X-Gm-Message-State: AOJu0Yy4Xkh1GDae5mBn5RuqnqXmHeYkj1n+hHJeWBmmqTnZrk0F41G9
	sIdkVhTL2m1Nc26WHtraajtzEVVcOAqDeex8QFfLHksSfKhAnqrtcjX0
X-Gm-Gg: AZuq6aLobKoDS/rSo3Zw1yC1bYPNqAlACD/oXCSnp/uJnXPOjkYhZVKBew0HJeHFDE/
	T1Qp7VBrwlBbScMpN9spmjREt9XnS//Tebvv03OZVsNT5piKF8q9yiAgotvOZ5rt4A+MR7HktKL
	bKNbHjheeYrTLKjjDg9Eu1tJKQ8p/fWkjqUIH2qs0VAgnM/i8JCpwnkBAvGL5JeVOdzMfsmXw0y
	Ih90MAD+ORdRXGtMQuLNYvA9O+ITgUfWfiv7h4urpPH90M++ooKtFd1x8n3gsM/Qmr869gTzyiv
	+Hi4wiUcW8TAoP9xdr7LFjtODFU/UcLZkL8/dx19o3mrZLBM1TB8HS7JVDu4iU9JOBwBU5cy+Wn
	85s5md3NIzsKKxZAEXaVrnTLLRMOWtfbVZ2ph2JbLmBT9w7iKa/47fTqWTfkEgqZt7zviJ8WYec
	kKdkrYCweQgYep7y5gB7ykVZVJ3DCoI4veAMb7JQ==
X-Received: by 2002:a17:903:198e:b0:2aa:e238:e219 with SMTP id d9443c01a7336-2ab2ad2b696mr23330115ad.58.1770819764167;
        Wed, 11 Feb 2026 06:22:44 -0800 (PST)
Received: from fedora ([2409:40c1:201e:40f6:5d2e:7e5f:8687:4ec9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29998cd3sm23540505ad.85.2026.02.11.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 06:22:43 -0800 (PST)
From: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	mchehab@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org
Cc: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Subject: [PATCH] staging: media: imx: remove unused header includes
Date: Wed, 11 Feb 2026 19:52:08 +0530
Message-ID: <20260211142208.112033-1-rajveer.chaudhari.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused header includes from
imx-ic-prp.c
imx-ic-prpencvf.c
imx-media-capture.c
imx-media-csc-scaler.c
imx-media-dev.c
to reduce unnecessary dependencies and improve compilation time.

Signed-off-by: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
---
 drivers/staging/media/imx/imx-ic-prp.c           | 1 -
 drivers/staging/media/imx/imx-ic-prpencvf.c      | 3 +--
 drivers/staging/media/imx/imx-media-capture.c    | 1 -
 drivers/staging/media/imx/imx-media-csc-scaler.c | 2 --
 drivers/staging/media/imx/imx-media-dev.c        | 1 -
 5 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 2b80d54006b3..bba125234769 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -11,7 +11,6 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..1b9dc5d86926 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -9,9 +9,8 @@
  * Copyright (c) 2012-2017 Mentor Graphics Inc.
  */
 #include <linux/delay.h>
-#include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/sched.h>
+#include <linux/interrupt.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index e9cef7af000a..860f93272bbf 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -5,7 +5,6 @@
  * Copyright (c) 2012-2016 Mentor Graphics Inc.
  */
 #include <linux/delay.h>
-#include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 0a27330f9790..d42652c51358 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -7,8 +7,6 @@
  */
 #include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/fs.h>
-#include <linux/sched.h>
 #include <linux/slab.h>
 #include <video/imx-ipu-v3.h>
 #include <video/imx-ipu-image-convert.h>
diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index a08389b99d14..a8f39319bd8a 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -4,7 +4,6 @@
  *
  * Copyright (c) 2016-2019 Mentor Graphics Inc.
  */
-#include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <media/v4l2-async.h>
-- 
2.53.0

