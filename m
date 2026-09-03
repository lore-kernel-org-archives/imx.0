Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAAB3F6C5F
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422388; cv=none; b=NrgyVOxjhBm3MSmeuddKaX4jfhIT7JdsiiRBHgIHllxV8MbDxT1XbDWI5DI2NksX4clbjZQq833neMiewVQhixAkkxE4q9xOIacgogVRtFaL6V93doPicWk3+gIVGzOyXuZ7HiF+PN11pDtmL+7fcz1qfuRIS0vJkMbqUC5eFgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422388; c=relaxed/simple;
	bh=vpxMREyKPKzJjjlqFAlHvba6Vo7YZEhqwIUksEjNrnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGGvqXsugXuAnek8swgQLolT1mY1Lv8n5xSOebLBhH2ualXoTERFgetdJ/LqGGVhV2A74t75r+DV96uzQZ1wSlzYC4JRbuOiFFd8nbACbOhiPMstXOvC+x2CbBOx1KpTc1kBUyugVogh2BGkxenQ2IjDYj6jF5ncOBEm794b9LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MI7c2qYi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI7c2qYi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso16206225e9.3
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 00:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422384; x=1789027184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRfXYK5ceQGJKTl6ugaWhRpE3JruSeXGhAudETkOsVY=;
        b=MI7c2qYiPNqZpz+RrRRp8QNxa2c85XkgoCp7KQ5ll8MaTOisK6DC66/wLUeMRnZnoY
         KS67IvyhTrL7DDvQJ0MCDWaqGBxxKKSEVR/bEYhc6VB4veUYvSa6nRsHrmb3TVSIF649
         sshmgyxEa6MJw6+dZt65l0ru4a3jsHhGYnNaO6nhqFPeBDnJGqoYdz7gyQ9eh7SU89Ip
         r3UZLTe9W6tIj02Tri7gIT3CNtO/w3VHTv6WBRNJRANJdqbyPqSKsfNxL4vyblkPNEkR
         uUy/DgtEKgu5WkDR2bC1Vbxpe9LgAvs4SxQWm+/vK877o6Q+40Y+7h9rad3unSDm2mQo
         /lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422384; x=1789027184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRfXYK5ceQGJKTl6ugaWhRpE3JruSeXGhAudETkOsVY=;
        b=hFAdJRsBWjeI7RRsupzLjlaM5uImjf62bnQXb+LbH4apg/qhV38Iu9zvy0KwnHHT9f
         fMvgFxek9ph5ES6faVf4aW6CwAwjtD2SDwR/ZixyFC/fxRvKAahV70uh02w8BjgG+IhP
         CkXZh9NCE+2fGE0PbQoBvjERnLYwIy4uv6pmphpT+/PaR/rDOYd3EFqz/FCWTxsZl/Xu
         2AZHs+VLsELIBS8UKfoqxoiuw8KXhGc9xzN1V3Q+9Ng1ArPZ/qp0fao8NAb+22tpGn21
         xXxGImq4V/K76g5lx++oxbXwzIz+Bkvc1552/eJuqozDvKX38eIDTGOkNOw/OZtjsqBo
         fsqQ==
X-Forwarded-Encrypted: i=1; AKwUvBypMqIi6RHYqLBEIWq9llfPgxDTBQRN1mNPjjZNwn14ck5xSygOJKtUhq547qzYMouWahU=@lists.linux.dev
X-Gm-Message-State: AFuF++kA6U2F2sg8KuaLGOwTkvB4RMf85BmbCzIjhBczYV6Fp2W2JV2n
	xZNIOm0z99gFBLHZ0ZvnXcMVxAEBrw8Awk/soL+J7LK77Jr69rs+dqLp
X-Gm-Gg: AYBFou29Sodks0Hhl68jxh43uwQpBCWK6SZplGCDVMNULjcAEVuKS+NydAx9HiiRCg+
	lytUqRlVMVnhwAi5tZiG3pnpoI1ba5dDcgwwd0q7V/e28usZIl2rk2iOM6I7C9epa7v1uE17a73
	2aXseRERoOH0cI250+yWLG191RiPmzlu1HP1ktY+5Rj87rB+qpKy700P8X1fDzc8lxz2JDRvfwI
	Z5fx+llf7lWkiXEJ3fKbkLCf0QYHnpT3G4X1fTq5Zq9ygKZCSAZVmpH44Aa+Q5OZgPCv2CVdsHO
	1zaOiKkZgKj1h9f13hIOE1iThnjHhB1pkufSLP7iT9alGNFgttyhdSSvWlUkr8f13LPg05S266c
	dx3mL2KqUZsvRBStsVqeESi8+8buLS4iE0eVHkB3jzJwIr99MYaQzHzWIYbYB+9cUX9lnolkJ7Q
	KjrYHOLe+jPDKxMyWiqtcgcEIhSScNTi0sxUDtAW6CBDXv5ULGMoZ4YomzgrxesoNZJQ==
X-Received: by 2002:a05:600c:1c27:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49ce57fd7bamr166027785e9.8.1788422384199;
        Thu, 03 Sep 2026 00:59:44 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm52373275e9.0.2026.09.03.00.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:43 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
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
Subject: [PATCH v5 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Thu,  3 Sep 2026 09:59:39 +0200
Message-ID: <20260903075940.2089367-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903075940.2089367-1-mehmet.fide@gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
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
implementation, the mirror of gpiochip_generic_config(). Without
CONFIG_PINCTRL the pinctrl stub returns 0 and leaves the config alone,
so the helper answers -ENOTSUPP there instead.

Nothing in gpiolib calls get_config() and there is no consumer API; it
is for the chip's own use.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/driver-api/gpio/driver.rst |  7 +++++++
 drivers/gpio/gpiolib.c                   | 23 +++++++++++++++++++++++
 include/linux/gpio/driver.h              |  9 +++++++++
 3 files changed, 39 insertions(+)

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
index ef8ccaf17c9c..fb3ef6754a9e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2440,6 +2440,29 @@ int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
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
+
+	return pinctrl_gpio_get_config(gc, offset, config);
+#else
+	return -ENOTSUPP;
+#endif
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
2.54.0

