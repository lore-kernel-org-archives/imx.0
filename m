Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0F83019C7
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401124; cv=none; b=Jp1S4gQXfYxDt9swLP2bXF1RvM4x/q5t3uZeXkmbXExJuAGIBay20aheM9zrLzuRj+oJAqe2FlV2KtS2rp4l8C2HNQgrCvMM6NmxVE2JC3KbJ8F9sNU3X1CGZHRMSA8wAJ6294NBjtI876lKf/e5mTPFJHoxPtG3zjDpINcvs7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401124; c=relaxed/simple;
	bh=rKyYWkvrYU9ysuyv8UfGnXxnuqYNPuL+rwsaQsrH4N4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUlavb6bvNCiYoVHsMEWok7FyuTViAaT7N4yb5fFPOqxyHy/C6WsKN9qpW72ohni00SL4BCY6+B4EEIiDVu8zEZ2Ng8gvefuq7UMIvI873EKtD96a5IuMJYTGpwN2WCUzdPJs2kP++6XwyIo+CiiJ+0cDYr3xeYRb4I6tpE8IH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+5Pnul7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+5Pnul7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so848258f8f.1
        for <imx@lists.linux.dev>; Wed, 10 Dec 2025 13:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765401120; x=1766005920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXkfjEDfxcmN2wsxcxmPY/zV+YfLOJPrMQ34dquGAqo=;
        b=D+5Pnul7rCDWq2XGzHVV9/wCvHQCZFo2sO9zcTWfAemw8D1h0/QROZ4JZ6smRNmQC1
         Jfl4D0J1nIn9+a0HwMac+5cMKuVMjEMnESSXkYbtB/sqN1X7FViIqKPj+g4+RAPrJjnx
         2HrW3ZX/3A0sCl4CgAHf5o/KVO1jrNbNzFCFyWzY0xHJea2pQYI9gNpYojKO1j8HS+Jq
         GZyhE0fWQLq0feq8Grn2Fmk4Muq23LmU/AaQl68xrNox23JyDncn5364oOZ9shSgaghQ
         /4Oje8Or5V9DAATgDq35AY7SYzR1PtW4G8e5OEs3aqHFGCvA0y/6CXqVMJtd/Ppy8yK3
         a37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765401120; x=1766005920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXkfjEDfxcmN2wsxcxmPY/zV+YfLOJPrMQ34dquGAqo=;
        b=Brb6w0pcJT3FmUizWLhHjJ2xdNWn69e5RKsQvdmiqIdvPU+ZPl4G7ZRZq2fko01HdM
         ey+APswmsSh6j4wg/JWWF4V7m8R8WtEYtMeoo+Lm4egpeRV7Phszyzr4qFeOKKbrlP5z
         O/YqaaVPYvHlsmkWIAdbM5Coi6rWBDNGJ9B0aUb+E5kJlO0X6ad/KIeSycpnryqOj9Rx
         7Qsreb+nuh60aVAYlahRFTPiItF2giOcKYau8B9WW3mGWyVRtG3EdbO0S3B73tSTCpbQ
         Oaqn0YT3Sz78XsLjvxoCsYpx7pODHxJRfuJyue9FDfij15nPzD3unmjVIca2MqvTzJJX
         Dx1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtewaMcCBUXyGWJC867esjOdwaddJa74l5G0b2Nc2pM8j9tbqaeDXMTHSh09tOOFKivV4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhJGfWbCwF8Q5uxfxPA80adMAsB65tyB/Zt2dk1UbDxqMFJ1KW
	JkXtgsRpFB5j1d+nWSPQs7kVvMqNMnVsg3KB6L8MF6Z8fwyGiQ3ZpdEZ
X-Gm-Gg: AY/fxX4W2iyW6zEeWv9NvXSrg146Y9/Wc1IkwRtyEUFeN6aSsroPT7m+e9PLUeFCTml
	QG0mCVi9suuFQ2WiLKvSQauIIBT2AyWDep1uK89OocUFx4ZY/tMtSSs2UqLRbWWrVc1ylQdYhsC
	9IGM5E5e5PJLI9E26q6YK/+v4NOv66SzOATwmSk6NOsB77TwiPBughoJ671DVXJu/+62kQ9TGiE
	SsT2U4P4Dc1ujNJHLZEzo0pWNpseulKwQgSYMgpWaEnxUKAKcHrVzku641oOiZyMtVOkQ+AEn82
	Wfohjz08c/IE/KbEScGqQLWx87aOoh49R/x6chpOEO4PxFXtY0lhRGsoDDQy/DkI4U/equgSksr
	bESbUh5KzHVsVgLLsrOGWahUoUAmiCEA35/Qvz/vH+Gd5tTZMaosqRwyCEaWrUrj5HyzyA/UlcK
	kaFKhAhGBf5CbE2xHFdGQdU3Awalqg4KtLDw==
X-Google-Smtp-Source: AGHT+IGU59M2IZuNdD+VbcGD2kdQ2sd7kW6LEthAF1ElUXBAqJvOvr9iCG6HcvR/D2vmIEyFYTJfaA==
X-Received: by 2002:a05:6000:1a8e:b0:429:cc35:7032 with SMTP id ffacd0b85a97d-42fa89f20a7mr839467f8f.23.1765401120272;
        Wed, 10 Dec 2025 13:12:00 -0800 (PST)
Received: from dev-linux.homserver.local ([51.154.249.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b85feasm1115031f8f.27.2025.12.10.13.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 13:11:59 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Samuel Kayode <samkay014@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	imx@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] Input: pf1550 - Remove "defined but unused" warning
Date: Wed, 10 Dec 2025 21:11:41 +0000
Message-ID: <20251210211149.543928-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If 'CONFIG_PM_SLEEP' is not set, compiler throws warning for *suspend() and
*resume() function for this driver. Using new 'DEFINE_SIMPLE_DEV_PM_OPS'
fixes it.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/input/misc/pf1550-onkey.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/pf1550-onkey.c b/drivers/input/misc/pf1550-onkey.c
index 9be6377151cb..0d1b570bbe47 100644
--- a/drivers/input/misc/pf1550-onkey.c
+++ b/drivers/input/misc/pf1550-onkey.c
@@ -173,7 +173,7 @@ static int pf1550_onkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
 			 pf1550_onkey_resume);
 
 static const struct platform_device_id pf1550_onkey_id[] = {
-- 
2.51.0

