Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1892651122E
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651348; cv=none; b=Tzr4PPN98YTYQncBT58zq2matMXjOrv6RemFyULk1MsgXGDSA5xGxt59tiR3xgR+Jmir7EX9DCoHOaFDNdzWfkTG2y096foEubaXsSHZuYlSG+sU6C2OZqUsn1DpNDlU/Yl3fQQuvFGFdzqzlipQYsTnQtd9JBjJmlB0A5cxE1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651348; c=relaxed/simple;
	bh=Per1jZ1d1Lf3zgdYxdHohCYxufw3TO312eIQjnr6DnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZnzPNu26XzaUtbtd/y95obF/7265wuEz6XMkd0OYoaHY85sOM6/7DJdCQ4N5wUq33Qeet0omsZDlfaEQ1T+Zo9m70Jpm+pCU7GOBvyBXvND79tfWFMXZI3LqVwd7KqHJhSTVrgkuWL/1Qi0i9VxRh2UH9cyJ49WIEHpN8wOWdSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AtcwUn91; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AtcwUn91"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso6303955e9.2
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789651344; x=1790256144; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5MKnFWN9qx9mGZRE5WM7kRDAqIAlnqtk7MFAHNTkMdg=;
        b=AtcwUn91LVy6Vj2vYdXDgaqRblNb/ilfGbnpaTJrBXdNbGpyErOFst31xd04c//IaX
         0O/efbBBwQ4Y0s7w6QWydreioKwekm1/MZ1yUeihuPtAkmBTEeq4/GxxFUl94eGC1Jr8
         e9qV1VUjR/+HULKUKxjywr+LNIiAz4Me/43ouVlueuMpGDS2vyrn9GuUF5Luub2rNyoE
         IjR2mSIXnpbkw+F9ZJ5GwnIqElkvgl6prz9oWrexzs2gRTAyT6LN20SZ2AHq90H7gOjz
         fr6yTifQstJFeOHVZMjQ7A0287GCCw0B0LGVat5gGA7u5Jy3vfRjE9FanHLU3LoKhdN2
         jOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651344; x=1790256144;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5MKnFWN9qx9mGZRE5WM7kRDAqIAlnqtk7MFAHNTkMdg=;
        b=Q0YCsvHOoOe3evly1uyT1H2XQ20p9j8gvPUmfpU57B5oU4SQEravQSFiT7/qAqwX2I
         Ni9EAbTqsnWtk2c8G5l/UWBtJZ0MujgpYcHK8DgtuNOsVjsgbp4TU8AU45pWDfSyi5L6
         m4bcN5QeghDaSz+pA2MKNnsOStEevX6IMVg14P4r3zglUHHzCZM5Z8y1UZDZGHPcnh+E
         VcoSbrqnr6a2A6WuNmRweEksHFS5U9MAmU66Nqtjrft14hTH42e2ppLoMOLx2AY1+Fd2
         XRNbcgC0lP9nte2zacDMTQliINW9x+Lss01KlZupzPggv8f8kSVv8tf7ZHrFzBqqksRO
         oMHg==
X-Forwarded-Encrypted: i=1; AKwUvBxUROnyRYckcVWmzDryVMLyzuvEEm8x7yOCzvDIjZ9iXlf1cZikyXKi/sdZYLTtIAuj7/k=@lists.linux.dev
X-Gm-Message-State: AFuF++khevBBXBd5rWgJSaK8DcR8jEvrGomGbIE1Mb9EmfbUhgK8AL0t
	AFjc3PH06JT2TVhQ6g2pF7iAHUVhS5H3EwXDumXrNMThhpmkIB8iqGnf3ssSWX5zLZo=
X-Gm-Gg: AYBFou3GCyKjVNCExe4toEvWNmkMSnVKI3aJB7CbsMDAGBi2Y6aqnVa/2F/YVjhQltl
	7qfLQtwC/XVLAdABykL3/lz5FqzWNELQCNyKuvnx0swOTX3nL/yQR9qB501+s73u/uPgBhaUiLJ
	ASKpyUKKb6XHLS9hLBqsGnk7OI4YA99xbPgQdRq+DUAq28i3XE9WQG7dyytgUWRH3CwcvUVcZdk
	+IDNovw6VTKhbqXuhf212iNSSatX0Fe6PNWfnuupyaEsKEcF/3tSa2qqso0BRWnM3jpkKt4pKSz
	thqrQ7EIGV7y1Yb5nD1bdgUHZlamrL+NVOh9jBiuGuRYkDeBBEQIqeWwRUt79lTKVU5xaoS8LEz
	7n7KLU5uMpY9S4N8BFCeVAkoVw8PlJNbQJVRtKUPJu7m4UbQLzwU/sNsZnmHnecXSdGR8o1OJcD
	AsIl1ax3+x8tEPpGhsS4gp0LYzgPQTgztDaI72y85W34vPRPdrMtBUN0HsbKdXxv6iH8IAJQ2ZC
	Y2cz5BBfUaIyIcSuJ3qNYdBqZ1lSw5MJ3bcZtZFuiMCnKGMx0Ooj0SCdBIqoQ==
X-Received: by 2002:a05:600c:1f96:b0:49e:69f8:e846 with SMTP id 5b1f17b1804b1-49eb72f24camr77387205e9.9.1789651344230;
        Thu, 17 Sep 2026 06:22:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904f3e33dc315acd8c5.dip0.t-ipconnect.de. [2003:f6:5f19:a904:f3e3:3dc3:15ac:d8c5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4870bf43511sm14694856f8f.33.2026.09.17.06.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:22:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: imx: ele: Fix build regression
Date: Thu, 17 Sep 2026 15:22:14 +0200
Message-ID: <20260917132214.730485-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Per1jZ1d1Lf3zgdYxdHohCYxufw3TO312eIQjnr6DnE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqq+mG46lHd7s4WQMlUWc+6papS+Jbf+ailCMHL 3GW5xO9x1aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaqvphgAKCRCPgPtYfRL+ TqzrCACUxM1NzLVAQkHJXl8Aov7WYS6BVYFamDV+o6sCbfb8nngTfIoLs5W8MwdPRcISJ0ueu5i icIkxSIkjbIsWrSGJhlRX7CmRFtrfZJjIjhuNTx3zYS444vTZuocabhds0Hcp0oV4lQZSDUxRpn P1EZxp1DLTKfuV4MNiAz+d6w1KBF0zSC1M++Io9ckYWGcdda9+5Pk5M4OZPu1gVtL+cRSj8Hfda wo+ausyLYH3sMnmi9ujtJqk5oxYLRyENZGILHyk6RYSfj4cnEeu/Kd6RZasjPdqyt4+3ekfcYp8 4353PLUliT1YjyZLh7V0Bz4OxuCX7nHmRR9T0ljKpI9+1xs1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

At least on alpha, arc, m68k, powerpc, parisc and sh the header defining
kzalloc isn't transitively included in the driver yielding a build
failure on these architectures. Fix it by including <linux/slab.h>
explicitly.

Fixes: 7560ad03bbf4 ("firmware: imx: adds miscdev")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

the referenced commit currently lives in next only via
https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git for-next
. If that tree isn't stable, the Fixes: line might need adaption.

Best regards
Uwe

 drivers/firmware/imx/ele_fw_api.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele_fw_api.c
index 42cda7de66e2..a3a68234bcb1 100644
--- a/drivers/firmware/imx/ele_fw_api.c
+++ b/drivers/firmware/imx/ele_fw_api.c
@@ -3,6 +3,8 @@
  * Copyright 2026 NXP
  */
 
+#include <linux/slab.h>
+
 #include "se_ctrl.h"
 #include "ele_common.h"
 #include "ele_fw_api.h"

base-commit: 7560ad03bbf40f5b89e210bee2dadb4be20efc1f
-- 
2.47.3

