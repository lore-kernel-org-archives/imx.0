Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFED03612D
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563005; cv=none; b=Qcf8gR7O41ZVfiO1LfhJ7QPpJc65oRkum8wISNLRz6f9Iqok9H7uFNq4yRutXE3kP02DH57d8h9QISoygS2p5cYbAN0Ww0kWgJwNCCvXZaxDESpxWlbRiivvm+49ZvCU0o/9nD7W1XuPuUttlYm6kpBi5ifTq2MHVfzPt71ZZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563005; c=relaxed/simple;
	bh=4KWBfDBADpELKklAMQgXyKS3im5Vr3TIuW41bJymLjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXYylF7BF3r51aX7MG2PZGsQEOoq1fKsb1gkt9OQMU23C3ZGDrDt7g5r2NtcmQXZkdte+hBh745Ssfvy9cROdX8C+o7uY8wnPOhxvWJ+OvH3wXzTJ1zGA52wlka5g38AGN2gL/3md2ox6F8cMOTlaPgZUprOnbbD4zc3UZN7e6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+EXNHtS; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+EXNHtS"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-270263932d5so2451112fac.2
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563003; x=1725167803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5PKJ4DF5X1qlJhF7gsux7p32n0IqTVXA5WgHVkgHUQ=;
        b=Q+EXNHtS/MCoFEw4clfvPEq7HFZQJ1wGvmQU9k3nPICg9m4MieG+fSuREeZNYYJ28V
         KfwDghBg9Pn8uR9Z8xwbk/a7+UlL5po8pwy+4MX5d2azQQ3tKPIPBkKbAVVfh+sWpFS6
         vcm1n2esaL+wrBkZtJ6aT8K8Pu7jFrDBioOqI10Z0D83gyleKIUKE06vYYAXwiyKyVFX
         fn9ZjEbt2RV714ppTVFTB7mtto9yskrehkx4+9jW1L4OG0sjIt1QXPU6dPZ5ozm3aO/8
         iZfPuGY692HnGdmCVaoU2rlt9YxTdQRvgFnYOQX43QbPKQlbR0bhLCBew0wPO4kPRGko
         +nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563003; x=1725167803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5PKJ4DF5X1qlJhF7gsux7p32n0IqTVXA5WgHVkgHUQ=;
        b=rpzDKs8/O3NK1EqduuJ4CFMlC5XZ9eeBuaqXuDVkCycXI+PAXPxiMaF+af1a3qXWB+
         krU2tpuCcS7li2t+BZxmbQak32IHGpBW2HI3IkF/w320BOF8v4cgbyqWRz7ao8Q0eA07
         hkj9dSBtD6W4BeK3tXzN3AmvymDhWcSWLpwvMik/czpf8zTEsd3MNJyo/IVvEiPk4VsW
         jPRsxiBO+p76lBbZIzlw9XeVHtolPlCCwce4JkWrVoKvaUoXQ/ETJAWtsthDoob/+jFp
         SSL25DQl6RFMH6dPd3VOr2Of+O+3KvuLtnWG66q1b7wsoxbkYDJVyFI7FXSR/fS5ONVl
         HjMg==
X-Forwarded-Encrypted: i=1; AJvYcCVzwTmvAwZ2NlbV9BGncocnvdVTTwHa5gIXnwExWVG6nv3CUMSjH/VXJGHRS/31YnRdrRM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzMTeyjMW4w4fKu5DZ/lRv+CVCqEi9Q2hNgvoFO7YV/YeKybya
	to9wQVbzV9OFiETOhgHf7IsX2ObL9DdPMaOHT+gKfahzKQLQkzxJ
X-Google-Smtp-Source: AGHT+IG8p40c6YWUkGfP1Ref/yI6506RwxbxXGHkuvgXNPmHrDm0NWWnw5t8czN5o3U7acylmdbbqg==
X-Received: by 2002:a05:6870:e310:b0:261:113c:1507 with SMTP id 586e51a60fabf-273e6472931mr7072687fac.20.1724563002770;
        Sat, 24 Aug 2024 22:16:42 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:42 -0700 (PDT)
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
Subject: [PATCH 03/17] Input: atkbd - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:07 -0700
Message-ID: <20240825051627.2848495-4-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/atkbd.c | 37 ++++++++++++++--------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index f4f2078cf501..5855d4fc6e6a 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -639,7 +639,7 @@ static void atkbd_event_work(struct work_struct *work)
 {
 	struct atkbd *atkbd = container_of(work, struct atkbd, event_work.work);
 
-	mutex_lock(&atkbd->mutex);
+	guard(mutex)(&atkbd->mutex);
 
 	if (!atkbd->enabled) {
 		/*
@@ -657,8 +657,6 @@ static void atkbd_event_work(struct work_struct *work)
 		if (test_and_clear_bit(ATKBD_REP_EVENT_BIT, &atkbd->event_mask))
 			atkbd_set_repeat_rate(atkbd);
 	}
-
-	mutex_unlock(&atkbd->mutex);
 }
 
 /*
@@ -1361,7 +1359,7 @@ static int atkbd_reconnect(struct serio *serio)
 {
 	struct atkbd *atkbd = atkbd_from_serio(serio);
 	struct serio_driver *drv = serio->drv;
-	int retval = -1;
+	int error;
 
 	if (!atkbd || !drv) {
 		dev_dbg(&serio->dev,
@@ -1369,16 +1367,17 @@ static int atkbd_reconnect(struct serio *serio)
 		return -1;
 	}
 
-	mutex_lock(&atkbd->mutex);
+	guard(mutex)(&atkbd->mutex);
 
 	atkbd_disable(atkbd);
 
 	if (atkbd->write) {
-		if (atkbd_probe(atkbd))
-			goto out;
+		error = atkbd_probe(atkbd);
+		if (error)
+			return error;
 
 		if (atkbd->set != atkbd_select_set(atkbd, atkbd->set, atkbd->extra))
-			goto out;
+			return -EIO;
 
 		/*
 		 * Restore LED state and repeat rate. While input core
@@ -1404,11 +1403,7 @@ static int atkbd_reconnect(struct serio *serio)
 	if (atkbd->write)
 		atkbd_activate(atkbd);
 
-	retval = 0;
-
- out:
-	mutex_unlock(&atkbd->mutex);
-	return retval;
+	return 0;
 }
 
 static const struct serio_device_id atkbd_serio_ids[] = {
@@ -1465,17 +1460,15 @@ static ssize_t atkbd_attr_set_helper(struct device *dev, const char *buf, size_t
 	struct atkbd *atkbd = atkbd_from_serio(serio);
 	int retval;
 
-	retval = mutex_lock_interruptible(&atkbd->mutex);
-	if (retval)
-		return retval;
+	scoped_guard(mutex_intr, &atkbd->mutex) {
+		atkbd_disable(atkbd);
+		retval = handler(atkbd, buf, count);
+		atkbd_enable(atkbd);
 
-	atkbd_disable(atkbd);
-	retval = handler(atkbd, buf, count);
-	atkbd_enable(atkbd);
-
-	mutex_unlock(&atkbd->mutex);
+		return retval;
+	}
 
-	return retval;
+	return -EINTR;
 }
 
 static ssize_t atkbd_show_extra(struct atkbd *atkbd, char *buf)
-- 
2.46.0.295.g3b9ea8a38a-goog

