Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A012839DBDB
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 02:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782442766; cv=none; b=ApEEGm/peSip0fjfiu+k/MkeG5ERolhlPMf3TLIIPpprCEgbMPGL1ohfDjqFU10piXXWv0W1SEyOhtbKBE1AltlWFZCNgz9OOCyzaiPEACmXsrGggtE9JKPT5lXaCFITOfyh0cRNeF7Ka5SDHQAoHAEAGBj43TQF9B1GjoBW8dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782442766; c=relaxed/simple;
	bh=tQZ+TbPP0OfRqvbdFrI+mIBSR8Nopvc3RSiL9bMw4Y0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KM9ebyKZXiF7Km8vk4bUODAcKMypgvLiIGh943x7C4yt34wXmjKRFYPLjKCiTkjwxD1wmMoy+NxPsIk0Os6biFmM6spGgCo7JVFhgOflX5orcYo0YJGr+tRpu2mtmmJNe9NmqTH7LM6Ct92Btfr/d6o+GaCEYNi7eLLkKYntEJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNbnu1Zs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNbnu1Zs"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c7f11150cfso3603925ad.1
        for <imx@lists.linux.dev>; Thu, 25 Jun 2026 19:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782442765; x=1783047565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4muAkhfm5VzCuxMXlVVQ1rf7i8L/csvKiPTRJAXnMMY=;
        b=JNbnu1Zs1Zb8Jo93fJQLDlFfSWHhtdN5bWUKDCsc6cGua3I9J7yqOYsnh44FnDhe3C
         PTnEyqJZe9DAFChNSlm5bsxE8pJU4HTALDXIrWQZXZiBy9wOpbCq8Gg7MwYFC9Zkr2C7
         BzzfNkz6Mg0aVbGPpspEQWDxutK4wvKvi8AsIbDYO0svX7bu+NyuwxjINb1RKxTei/yp
         FVKCEo8jwtr+c0/PgBvgSrgUesBwpi3rjJl+x0b98FyHfObKJ0csr6tHqII7hWTpzmlp
         l5T6JcCacPjlgtQi4Y1F4CzlReldMI4zIp6dcA/jM6B9GkUDWp8jrBgZHMEI937G0uSm
         ycgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782442765; x=1783047565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4muAkhfm5VzCuxMXlVVQ1rf7i8L/csvKiPTRJAXnMMY=;
        b=NhU8LuTPyzYw1LU1rr2FbH6AT0NhoJ5gI+eQVcJTHl+iASYX31WRG0peXwkI21YN2u
         Ce9lAPI4fiy5JCAUWdikR/UX/GFIBHImoeQyqyZcqL82CWZQhzvxinerzGKOMPIpmkVx
         U46DBoUXUUYKFXppJjL5slYv2KoBuDsDzSx92Ry+gaM2bA7DIc200RAxP3nvFzXuuql5
         qwsjd/MFJ+ScS6GyMHUMkaeAYcXVFs7+o8s0IEvUXuwER0pNxTIEpva3AV4OYOmSrX6R
         nev4SlXVVXzpHCMnEf8X+bbXRzWEwDc14HgvuJsOO7I6TtR2Hkk2WX2Sz6bRHEK8GXLf
         wl7A==
X-Forwarded-Encrypted: i=1; AHgh+Rqrk+ZvQU+KB4sMqyP16Q+jeksINlN649DNd6hCN9LUwZYtR7DNaMS8IvLJio7Gj1GcAQY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYT2quUPhldLz+CciVlpJOVs0YXVOG7GudIzRP7QyRS1uBnYxu
	Ns5w4h/ItSd5T5kV5GKW0wf0EXiGhojf5O/uLcq7W8QNcN2oSXnbdMqF
X-Gm-Gg: AfdE7cma8hhl+I8UpuY/TMNrcSTHR7AuPIGuyBRDWAwpfM8gJJC08MQa1UMvkrcjoDn
	NWQrSOu4rtMnHyHx0BOPsNYCYSKyKmF10Irn7KWnxDYxgdu1Z7rgJOeKT7J8QhaGLMNmyxdN+vg
	pzvHLCNK7Y6LrYADFMQR+CRJzrdspgK5+oWtjiwKWtnrDaWWmZ7P+66C8JUpr0fWaMqI9seH1/D
	PnqrDYkSnAlGM1UQ+4WT3/R/c6zIYNUZkxc8wyPZj8gJbeKBr3cWcIUth9C7H40yGduG7tbrdkN
	R62QBn6Pb0MY/1MwnXOTuuloM7yTzFi5YJ1ZnqXykryyP2EComOdsr+A6eUJ9eabrxY8OSEhuCj
	wI3ecuXZQcEqYStHqHvjKS2K5uNSkta520kzcZXiPVR2xLF18I+7zfl8KUYqvKhuW7R0pQ+hYFS
	MvKaX6dgNmeBc=
X-Received: by 2002:a17:902:e545:b0:2c1:ed61:36ab with SMTP id d9443c01a7336-2c7fc73b73dmr47872215ad.19.1782442764905;
        Thu, 25 Jun 2026 19:59:24 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm31252535ad.29.2026.06.25.19.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 19:59:24 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@nxp.com,
	andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org
Subject: [PATCH v3 2/2] i2c: imx: Cancel hrtimer before clearing slave pointer
Date: Fri, 26 Jun 2026 10:58:46 +0800
Message-Id: <20260626025846.106157-3-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626025846.106157-1-liem16213@gmail.com>
References: <aj1UR5ddawsdMbZC@SMW015318>
 <20260626025846.106157-1-liem16213@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In i2c_imx_unreg_slave(), the slave pointer is set to NULL after
disabling interrupts.  However, a pending interrupt might already
have started the hrtimer (i2c_imx_slave_timeout) before the pointer
was cleared.  If the hrtimer fires after i2c_imx->slave is set to
NULL, the timer callback i2c_imx_slave_finish_op() will call
i2c_imx_slave_event() with a NULL slave pointer,which results in a
use-after-free / NULL pointer dereference.

Fix by canceling the hrtimer and waiting for it to complete after
disabling interrupts, before clearing the slave pointer.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liem <liem16213@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 17defb470776..f02c216ba299 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -959,6 +959,7 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
 
 	i2c_imx_reset_regs(i2c_imx);
 
+	hrtimer_cancel(&i2c_imx->slave_timer);
 	i2c_imx->slave = NULL;
 
 	/* Suspend */
-- 
2.34.1

