Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586C841F5C7
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208385; cv=none; b=FuFJRwgWJqhtYp4mkvmseallvBlAXPpk0xuNYlzHM8hutNAwCgnJqsijHAQK3wG8zIX3FyATLD5OsZfdE/Lc7X7MtRpV89fgMjruOFDmJdzQQypaLVQbaZGs4crhv1eO3i/P+G3mzdSNF8/KZENmGmNe28IaMz9FVOi+m3X6a6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208385; c=relaxed/simple;
	bh=NHARLWYGn7PxNM5VybiPt8610aUjwy8ufPU3G4O7DKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LS6MxGBuoBohnEaP76TtEVXzjMmzRK9Mo8UV1IMWXGOOw8swUYhhi/6zvc6viW3e6mx/Ev8Vq1BeR1VdFDUXz+jk7ZVHWozfPUScMQyLkWsAh7VdHP1fOukuEhQi7D0L5veTONaW1nydvPT10ZFrLN6sxKAa1JJ6qG9Y3LDQlY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EE5hHNL6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EE5hHNL6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4629051c9d1so2026614f8f.2
        for <imx@lists.linux.dev>; Thu, 16 Jul 2026 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784208379; x=1784813179; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFzMVT/fxpUw3oGY/5v1mJvn+DMLkKwLSq2ofWAuoMc=;
        b=EE5hHNL6mPHUa5xxuIhUOil5JQkyBosKAHJh8oSt/KQNDpo9OX0KAPT+JCJW1RHGye
         nuDRNgIZcrXU7MpvBS3+uWDYUxVckWIulyzlFYJgdrXq5oMuuUMs1GEz98w/86r0DMsc
         8mXeT/B3qTKuWlCVFGihS+CZJT1a7Xa2qkKg9heusaqQrEr8LxmpLmklowIQBYtno42x
         5i3gEXstEb5gHQiwO3H8YHN/lPrTRyYpKaJg06vY9QcJZ63Yo+JQBpMQcX2/Lw7fhhme
         9wpiNQ2B5jZiiJNTs2AnnnvodvrIebljdv4ggGpUzl+lvueYgqiDKk9neLyneZE+6Y0B
         r7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208379; x=1784813179;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZFzMVT/fxpUw3oGY/5v1mJvn+DMLkKwLSq2ofWAuoMc=;
        b=E+2EZ6awx5KgXVJAK8sEmrSjP3L3W9MQLqIItBnjnJSu8UVxi3NscUrRbbR2N/WtDs
         CCuSAWQ7Cev2F6wTcPvy3Bw6ETe5t2styTBn22v/s/xZPCUcd6GNNw1XCHt/fH9l8Urp
         pCzGVBI8+wC/VKAFUprNxISBTUdJ31+FyOrAotSzGkKh1lMF7X9M9xldWH2m2CW/jTlr
         XV3KOag5/Mw2hV3IdBnfgiLEQWMVOF68p1/OAmmRDdhyTR0hT+L/VHSpRy58S0UO6iIv
         BNkHL7poA2PBBVOn5kh+DNXayldfp4pJVN6xTmZozmZU8O6hOCUT+2aeXtFTYLhlSyAk
         q1zQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6YX/QyVlXmX67sGUnVkTC6KzSd/DHk6FiqJtf86xUxZtnYS8k+ioJ3WHiEV0fm9R7cR0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo23vfcRafQJlHtcx5NDVPDi9i0lry45y1+bwGr60Uq0r6Qf9L
	PLyIb3BDqB8OIvTmq9KT6QnShpBri/1HHOHMp8mLqwgVRrKY38Y2b1ELzKdNIMoheKA=
X-Gm-Gg: AfdE7cl2+6ExvAFv19UaWM+gmlluTfGqpeIRrNVnK332L0xX0ffqT3i/4PzrMO93HQ/
	/+q4de19S2h/xaIg4MILDuNvbdLxJUNseqA7VOj9EUd/Gn4aVG3aPv2Za3iaigip5FekD3dSXTo
	ZTH2Gaikd+xpHJ5BLOT/uYU601umW3Lzli7WhqWFCn79/auVj4c4n7gQT7IVoyYxq5tweRmNdDT
	5C54W0lTBvznoqPWJtQjPXxN5Rj1n7xDu0FdTFciFkoYVMm6Kkm7W85sSJm0HWlw2RxKCzqRdvZ
	Zg/VYe53472HE+777aHD6XE0iHO8diDI14b6wIdvuFN65tVM+AMhLTXMUnmQsOuWzwMbntEXRom
	M4BzDEXXXo50IDRpFv6E+cb7VExysu/k5TjDj4LRgLksfcHGWRxCMozvP7w++xzKsmEKoUhNfVt
	IaY1FN7uDQpD+BbJ+PyrJpY6QPqi/C1NUGUfUpylvkwG5KBoE+rj0AAcwQ2qrtwDANuw==
X-Received: by 2002:a05:6000:4020:b0:474:d7a5:4b7a with SMTP id ffacd0b85a97d-47f2dcd7881mr26682749f8f.28.1784208379566;
        Thu, 16 Jul 2026 06:26:19 -0700 (PDT)
Received: from localhost (p200300f65f47db046a548a0537ec1e67.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6a54:8a05:37ec:1e67])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635c86csm24865590f8f.16.2026.07.16.06.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:26:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: imx8m{p,}-blk-ctrl: Add MODULE_DESCRIPTION
Date: Thu, 16 Jul 2026 15:26:03 +0200
Message-ID: <20260716132603.2327847-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=NHARLWYGn7PxNM5VybiPt8610aUjwy8ufPU3G4O7DKc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqWNvr7p362KrSgGq/MwLyX8ePENAWBwuUho0S1 lBUfqJ+5pyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaljb6wAKCRCPgPtYfRL+ ThA4B/9DIt4u0eyuHj/nw4Z16VgiLTd8MFcgifqNi2C8wE6iMPf1Zrnp0omeMA/j5+vNpgbrl1b 4kV0Lnmg20mwZG+5yg7Ql0i/JqOSnv7SsM1fuhOHM19Hj8Gma+5H8Rk9T8aZtgxA05fXFrRJrRY wHgH3WWKLd6+TTw/qQHH+Bur8l+ACjmM4uKMH5t/5HmbwkrIQ8MlVVS6ETk8MwfWSVeq9cOjFHq nxA8HWCFjQBuoQQBICzPidpgeR5Lx+otFs9lV6TzFmz2vYRuOg0x0D7q/Ar8H267Ztm8rJFHFPZ A4FQIv2xwLveDoTdFYFpyClqJUquC1pZUib48KBQZ468YQ9F
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Without a module description modpost emits a build warning:

	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/imx/imx8m-blk-ctrl.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/imx/imx8mp-blk-ctrl.o

So add the required string to these two drivers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 1 +
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 99d100e1d923..479789009c7f 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -953,4 +953,5 @@ static struct platform_driver imx8m_blk_ctrl_driver = {
 	},
 };
 module_platform_driver(imx8m_blk_ctrl_driver);
+MODULE_DESCRIPTION("NXP i.MX8M power domain driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
index 3f5b9499d30a..d255c20f58e2 100644
--- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
@@ -890,4 +890,5 @@ static struct platform_driver imx8mp_blk_ctrl_driver = {
 	},
 };
 module_platform_driver(imx8mp_blk_ctrl_driver);
+MODULE_DESCRIPTION("NXP i.MX8MP power domain driver");
 MODULE_LICENSE("GPL");

base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
-- 
2.55.0.11.g153666a7d9bb

