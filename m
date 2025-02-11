Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660DB262D19
	for <imx@lists.linux.dev>; Tue, 11 Feb 2025 17:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294913; cv=none; b=sf/R1DxBO2awhn1Bf7j7DMp/NzM0/JXvcf4FVbNPuqDkp4lvflXK1bb4zjuZ+P+DVvAy6JI9G3jOm8Pr60pucvvfo6q2TlycW9EE9CPpaVxAkKMRURQk6ABsQpSqPSx10FZTgaXLXQVmVA1xd2c8Ih4RsaJ4xbDtwfBdj/weFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294913; c=relaxed/simple;
	bh=L2mc7++2m+KbwXPJfmeanEsMndjpINIhEyR+p/vnM+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nTgqrpvhjTG+L533GbvreifwA5wVVWf0AjU6aHrQaaXFjE14X0CqHEBkOoD+COREarUAv/Ic0xqpyjpyTC61sV1SpLVmSJRJWCjR728++ja/TeIXJZyKNEq5Oya9F6oMT6OzcF36k4QL7XpWH5zesvebdTg37YjQiYAUioxvX8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mAixXsgC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mAixXsgC"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dd9b3419cso1590730f8f.0
        for <imx@lists.linux.dev>; Tue, 11 Feb 2025 09:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294907; x=1739899707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRpmne0VBcJf7jZbKVrpAIB9gKqtJmCGDdvQHW0V2jE=;
        b=mAixXsgChwHJHS3ZAV1at9hTCysFxjOcHfP+xYWb1+WrJQpgwav+dUufitCiDVxsEW
         0LzDSmfJlCxazzQQsPlAAoI6j1vfPl1VDnbN49K0DuMZ3G/6aR0yL835vxtMCHqegNL0
         4rCXsLRY8CTE7ZZmXsFB56CHfladW9CrFwLWvuzwTo319cbCcaXiDTdXjN9jk+S0eQUM
         19R90ExancVF45R7+XwWk18Dxmz6uB/s26rbvPueWWe14eY/JHkxYUu/ks7j0L5bB03u
         +hKQbLxfpFx8KnHrJlIsaNWxlm8jd0nWXgyNQlPNoiGUdql69MC9opiRvM/skKwicGoL
         82jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294907; x=1739899707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRpmne0VBcJf7jZbKVrpAIB9gKqtJmCGDdvQHW0V2jE=;
        b=RdNCHVjKOzPtdKf+JzzPXFuJINzHCc1G+KB1PrOtkd49wK2F4RkI3tqqqAFTb5lROx
         xsvqdvQG+7OLpSXLyDJa4AuTQK951YjZ81ZRf8dvUvbu41LAw5XFSroiUOwbUFSETn37
         J71lQbVk8j3LvrxMSd26M78HpY3R52NhRQXyPQvrLtyPW4E/wd1QWIKeZ011QSpN0+fk
         2Z0DY9Eu3Z4P2MzlprXuUyjtHmaNCg6nG+pc69z4lErPj37Yll7pulgD/91H69IHyBGd
         Eh443btv3I3GQjTgY9JUlum0B9Enn7KcoOIX3F52c18t+/P5IwfRJcWlqxeK1jaxCDgF
         K7ug==
X-Forwarded-Encrypted: i=1; AJvYcCWLzGH3X79s77pGE/w0BOMK12DknqU3chOWoVwd8MvmBOacAB8zN6XddNEXTezurRhmYCE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvagIVxTnB5L7meB/HStFxEZX3IeWN56pWM+sl149YasxEpEN/
	lTmVoDcA5gpHRLFksQY34XCahD0J8HZPJgXA9rBtEs8KhBZ7nrZ89kYFXWDarp8=
X-Gm-Gg: ASbGncurSflFtoLIRWqNuIOGEFu44B5QnS32CpHMXSeKk7O1AgrLTouHy9jaCtpqMcc
	MrH1SGUEemVjUR6gvx9Ts0fF30J4h7S4b61NnWEyGMlzJ64XvV9+BUFowEJOQsS6SkNjqDh4d0K
	tAPYoyeMt1OJKDSmnwhABZxl9VXFyMRE12p2/PvFwD5H4ogf7qqerA91NU1WIierwkfB9EtxEmm
	iF4Eagz+4CN7q9LEtfKDcolgStleEzlmqgqf0nOBHW+8MzV+LJm2imFfF67TIbkHwh+RJ82RKA+
	ZjBTvry1flrYly9l6Q==
X-Google-Smtp-Source: AGHT+IGy2T23PgwDmJGcN14Q/mCFh4UYzD0ptO9o4GXW666CumGfNzzI0RhLancAMnBStTnS1c8Jkg==
X-Received: by 2002:a05:6000:1f82:b0:38d:e1b1:be99 with SMTP id ffacd0b85a97d-38de4193da8mr3997996f8f.23.1739294907528;
        Tue, 11 Feb 2025 09:28:27 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 1/7] driver core: auxiliary bus: add device creation helpers
Date: Tue, 11 Feb 2025 18:27:58 +0100
Message-ID: <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4290; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=L2mc7++2m+KbwXPJfmeanEsMndjpINIhEyR+p/vnM+0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g2Jb64zhGo4nYo4f11I5GNQZEAzlSZ9Yo5d
 ngkcisRo/6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINgAKCRDm/A8cN/La
 hf93D/9ySJRRpTfhwXJWNiKfMhcJCrBwzYVVixaTTNiJUGMkApqchMSmB0zNWhrawPaDlId3Qiv
 auxx3nD/C8QUQGOe3pmyimoKTtJX68sya3tWzYS13H4Sa0H9qFl2RM0zYZ2KeIfFaB5bXjAyZbp
 8AafPJDeusV3rANuFGpxeUk8OJf2I26NERiAMf4JIeYfEk+DdUX/qaaekow/K+zX0friJeeHzfS
 n3nNP0mPksNRZ70HmTScJgvfPOEIO1hH8exi8I+Ge5RadGPr4ZAvrdduyqDrUcI+eC7Vw/vJkNh
 sW2YMStxssdA3V4ydPTzpH9vn+vlpXW1isL2h2lNUHHsZ6qQneIycJfGJCCYP1GDRky2C6AtPib
 l71wFmbfhXQPTnOmW1byyhQNUf2DG0Kse6unCPxWmU2O+bBwnBvUp3XtMEU/LOPI0MGCpZctNwz
 teda+aTYeFlWq/IRpLHb256e0QTj8OwBd64Y8+cWTJlY3OJswpzqv3zklJ0nKa5VDXQDUjv8dE/
 3Z3LHSVu21jO5GhGjKjzeZeJVnbohnbeTurbB9m0HLLQkVNy1b6qdMD98Y9uIm1F0V6fv5ak8Ji
 vqYRsnbb3UUjcLUi7RMxyNaRwF7lp8opYquywNB5WMkoWzbD21tWKnQOr6ID3hMTihGNxCRzIyH O4UjCmzh9bo+k5A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

Add helper functions to create a device on the auxiliary bus.

This is meant for fairly simple usage of the auxiliary bus, to avoid having
the same code repeated in the different drivers.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/base/auxiliary.c      | 88 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/auxiliary_bus.h | 10 +++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..0f697c9c243dc9a50498a52362806db594345faf 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -385,6 +385,94 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
 }
 EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
 
+static void auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	kfree(auxdev);
+}
+
+static struct auxiliary_device *auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
+	if (!auxdev)
+		return ERR_PTR(-ENOMEM);
+
+	auxdev->id = id;
+	auxdev->name = devname;
+	auxdev->dev.parent = dev;
+	auxdev->dev.platform_data = platform_data;
+	auxdev->dev.release = auxiliary_device_release;
+	device_set_of_node_from_dev(&auxdev->dev, dev);
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		kfree(auxdev);
+		return ERR_PTR(ret);
+	}
+
+	ret = __auxiliary_device_add(auxdev, modname);
+	if (ret) {
+		/*
+		 * NOTE: It may look odd but auxdev should not be freed
+		 * here. auxiliary_device_uninit() calls device_put()
+		 * which call the device release function, freeing auxdev.
+		 */
+		auxiliary_device_uninit(auxdev);
+		return ERR_PTR(ret);
+	}
+
+	return auxdev;
+}
+
+static void auxiliary_device_destroy(void *_auxdev)
+{
+	struct auxiliary_device *auxdev = _auxdev;
+
+	auxiliary_device_delete(auxdev);
+	auxiliary_device_uninit(auxdev);
+}
+
+/**
+ * __devm_auxiliary_device_create - create a device on the auxiliary bus
+ * @dev: parent device
+ * @modname: module name used to create the auxiliary driver name.
+ * @devname: auxiliary bus device name
+ * @platform_data: auxiliary bus device platform data
+ * @id: auxiliary bus device id
+ *
+ * Device managed helper to create an auxiliary bus device.
+ * The device create matches driver 'modname.devname' on the auxiliary bus.
+ */
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
+	if (IS_ERR(auxdev))
+		return auxdev;
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
+				       auxdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return auxdev;
+}
+EXPORT_SYMBOL_GPL(__devm_auxiliary_device_create);
+
 void __init auxiliary_bus_init(void)
 {
 	WARN_ON(bus_register(&auxiliary_bus_type));
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 65dd7f15437474468acf0e28f6932a7ff2cfff2c..c098568eeed2a518b055afbf1f1e68623a2c109a 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -254,6 +254,16 @@ int __auxiliary_driver_register(struct auxiliary_driver *auxdrv, struct module *
 
 void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv);
 
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id);
+
+#define devm_auxiliary_device_create(dev, devname, platform_data, id) \
+	__devm_auxiliary_device_create(dev, KBUILD_MODNAME, devname,  \
+				       platform_data, id)
+
 /**
  * module_auxiliary_driver() - Helper macro for registering an auxiliary driver
  * @__auxiliary_driver: auxiliary driver struct

-- 
2.45.2

