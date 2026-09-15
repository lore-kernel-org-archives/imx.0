Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19099396D2C
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459513; cv=none; b=lPnWtu9mZ3nmCzggvi613U0PlvBqtkm8lWLtXk+oMskzbqG/s2+cj1EBljjXghvJtyhS/s9L8h7lE1JJd2kPsKooeyJDvJN9OcGDmki13pakRHkK6QVMLtxIeq7OKprSaHqTXz8as5tEzDhzcqmVQRhRIrfI572ylaQN/oGxsbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459513; c=relaxed/simple;
	bh=j2+zPwCu/tcPTMIRdv2LcEAv8lu7jVFYREhBmWgopj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmoJf9qhmOridS2AkCk0u6tooO9YEf/NOHEvZ15Hx4PnU8X3C9jVg8ImWWD7dA/gx/7shc5zyiqjqAao/e45ajhTF5XazyffwDkMlDwoY0qXW0ENVxbffnqxNk9jr/zxO3HV8/hD4MfvLf7j3fslG53VxBbhT6dddY8nUiAlik8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErFstk1F; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErFstk1F"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso18226545e9.2
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 01:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459507; x=1790064307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhuxraLn+BRCMp0d+GHEVuibFLIukV2Tl86N4IJdTu0=;
        b=ErFstk1F62GcZdGDFpak8EXP3OF5g+/HMsiBpdE3tuluspV9BrmDY2W0ptQnA85i9q
         kmScYTkZdeoL7haKJ7ESpkBn9yJgrYZ3Q8AHm2gzUiCWF1rcPhkX0o7nRiDeHiRPsKpR
         QW5o/8QGLJwX7uDxY2zCeP07m1T1k3ngWkU41EBcqATg/1HkhiwaUSClCniTdSg+4XuX
         ZFSHGSAOB2vAZM3N2TusmnGV60GifvrwFgFKYmi0Q9LB4OKx7iucNJIRyRCepOQYiGSk
         LLHt/UsasCB6VZjOoEupudpsL65+K9Pe7cYr71JgP/r1FzzVbqXED6qA5xKtGkAK4K23
         glWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459507; x=1790064307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhuxraLn+BRCMp0d+GHEVuibFLIukV2Tl86N4IJdTu0=;
        b=qQ2SHMtCQIOcwjXcF4gPZaDmLW27f+45CN4AKjDth/q2HwxT88GvNfo658I1T1zyov
         xPW+CfUw+l9m1XN90gofSXHZGuIjJX88T2AD1HbBigSxAHQKhwqKYEAPhZkkXWHmBTxy
         XcnwgMnMyUNtTt3OYJlEPX1pmKlGZpAFhQbGisva8NFDKVUEwGg/0K1Zk9IoshR8EE6Q
         8eipabTOqfmJttaOFm2Z3phX0RdOAZfRlOAFT3X+fAUyEnGYhMs8NZo35ZJWsWx5rRh/
         /9Uhz6LodU/YqhWdvjljPr9cjreXzXwX0q0YtAufwU+Eq9yq05Ac2FNkrRrPhYze4P4H
         1eIQ==
X-Forwarded-Encrypted: i=1; AKwUvByOUiTtYsc39P4Mtu8BnbIDbZArS2zOzuOOGiEHPObwhX1bQqoBVnWWGBjbfdvZINNflbs=@lists.linux.dev
X-Gm-Message-State: AFuF++neV21sx6e0j6KLH0QJOWEdvRisFdGWiKjOfLx1/aJi2gqXycCY
	rWjJNa7RutA3r3GyE5UNf6IpyPsesxWI9XEzeAFzljvH3FMgXeBMtAt5
X-Gm-Gg: AYBFou3LhOaaNS2GttpY5dvaX1BeDbvcPIvsCX306wuFtQ+VfH+E0A7lP4MWXZbKwOo
	ZKI1oY31c6owLNtiBzui+1LJYmYSljBrqUhQC4EqEl+dbAao6v7PjoNI7D16EqhhJqknsj86xeu
	dIePRDCE5voAR0PHL0RhWl44wdq5kXf2MD3dXK5On72T36020eOIBbr/pgfmrNnzeMXCgT+X6D5
	mt4PGVD9LOu4b7lnt2guhYf2EbD4Lu2+YbJGRAsYivv7WLMEJOTxlRtje7ANrAc7jzj/8Autg/a
	zgMSGbEOOZ88KWS9Pka94OzJNop2feTL4yArP3fWAy4m4jYr4ILgwuZhm06Gi2R/FonDVUugEW4
	RCYdPm7CB0DwyparRsu58E29OsbDZERDt3sVjp+qO0EoWg2NWjhVRc+3bP9SM47rR2kOe4rLb1l
	gMEGG1hUGww3eiCPX9x4CCPS1R4yW90Wh7FHxoKDAFEoZXV2hV6mPB2ESjX4AVSfE1hehqa2JhH
	E6A
X-Received: by 2002:a05:600c:860b:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49e7a6489bemr67096545e9.10.1789459507015;
        Tue, 15 Sep 2026 01:05:07 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:06 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v6 3/4] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Tue, 15 Sep 2026 10:05:00 +0200
Message-ID: <20260915080501.329424-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A chip with a pin control backend sets a line's configuration through
set_config() and gpiochip_generic_config(), but has no way to read one
back. gpio-mmio needs that to learn the direction of a line whose
direction lives in the pin controller.

Add the optional get_config() callback, taking the packed parameter to
query and returning its bare argument the way pinctrl_gpio_get_config()
does, and gpiochip_generic_get_config() as the pin control backed
implementation, the mirror of gpiochip_generic_config(): a chip without
pin ranges, or a kernel without pinctrl, gets -ENOTSUPP.

Nothing in gpiolib calls get_config() and there is no consumer API; it
is for the chip's own use.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/driver-api/gpio/driver.rst |  7 +++++++
 drivers/gpio/gpiolib.c                   | 21 +++++++++++++++++++++
 include/linux/gpio/driver.h              |  9 +++++++++
 3 files changed, 37 insertions(+)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index a4f160b95089..3e53374c7e9f 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -134,6 +134,13 @@ ending up in the pin control back-end "behind" the GPIO controller, usually
 closer to the actual pins. This way the pin controller can manage the below
 listed GPIO configurations.
 
+The optional .get_config() callback reads a configuration back: the packed
+parameter to query goes in, its bare argument comes out, the way
+pinctrl_gpio_get_config() answers. gpiochip_generic_get_config() is its pin
+control backed counterpart. Nothing in gpiolib calls it; it is for the GPIO
+driver's own use, for example to learn the direction of a line when the pin
+controller owns it.
+
 If a pin controller back-end is used, the GPIO controller or hardware
 description needs to provide "GPIO ranges" mapping the GPIO line offsets to pin
 numbers on the pin controller so they can properly cross-reference each other.
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ef8ccaf17c9c..0586fc1f9564 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2440,6 +2440,27 @@ int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
+/**
+ * gpiochip_generic_get_config() - read back the configuration of a pin
+ * @gc: the gpiochip owning the GPIO
+ * @offset: the offset of the GPIO to query
+ * @config: the packed parameter to query, replaced by its bare argument
+ *
+ * Returns:
+ * 0 on success, or negative errno on failure.
+ */
+int gpiochip_generic_get_config(struct gpio_chip *gc, unsigned int offset,
+				unsigned long *config)
+{
+#ifdef CONFIG_PINCTRL
+	if (list_empty(&gc->gpiodev->pin_ranges))
+		return -ENOTSUPP;
+#endif
+
+	return pinctrl_gpio_get_config(gc, offset, config);
+}
+EXPORT_SYMBOL_GPL(gpiochip_generic_get_config);
+
 #ifdef CONFIG_PINCTRL
 
 /**
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 17511434ed07..4077dc678cae 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -359,6 +359,10 @@ struct gpio_irq_chip {
  * @set_config: optional hook for all kinds of settings. Uses the same
  *	packed config format as generic pinconf. Must return 0 on success and
  *	a negative error number on failure.
+ * @get_config: optional hook to read back a setting. Takes the packed
+ *	generic pinconf parameter to query and returns its bare argument in
+ *	the same variable, like pinctrl_gpio_get_config(). Must return 0 on
+ *	success and a negative error number on failure.
  * @to_irq: optional hook supporting non-static gpiod_to_irq() mappings;
  *	implementation may not sleep
  * @dbg_show: optional routine to show contents in debugfs; default code
@@ -434,6 +438,9 @@ struct gpio_chip {
 	int			(*set_config)(struct gpio_chip *gc,
 					      unsigned int offset,
 					      unsigned long config);
+	int			(*get_config)(struct gpio_chip *gc,
+					      unsigned int offset,
+					      unsigned long *config);
 	int			(*to_irq)(struct gpio_chip *gc,
 						unsigned int offset);
 
@@ -708,6 +715,8 @@ int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config);
+int gpiochip_generic_get_config(struct gpio_chip *gc, unsigned int offset,
+				unsigned long *config);
 
 /**
  * struct gpio_pin_range - pin range controlled by a gpio chip
-- 
2.55.0

