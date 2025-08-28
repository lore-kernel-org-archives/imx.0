Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9B239E9E
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396840; cv=none; b=FEp2JNN+egbiVIae4kpGPIpEeZpdC/T8pqWpD/KvnU6cdHmWy1kwMVk/xC/x0fpZc0apxczMwFxYHefn4bD1tvT2HKPHNE4QVCnJwl/EMSMu2TN45eM0ZO2CMoxaM3xbltI1E19+1leMDRE9duq8YEnDQBk8KK/qjj4oB6S+tgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396840; c=relaxed/simple;
	bh=E0FlbqWRU3VKEv3J2s5DmOubF4HrmToy416DW0zIwYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HMJztICTv+/u8ABP2q2mRrRU9ZwtRU4wENSN6SFreTS1ma7L4Fqz/nusQU7LklCEQrNaEoF+on5pNUTzcZOApNMwbfJV3A+wJaYlNxbPk/ZUBoqmQUEmMnbZkN+VDEHr0ygUTaEiqDp6IZAHZkyatz+50l+R3yOPg6LnyzkQaEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hYyHb2Fs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hYyHb2Fs"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c7ba0f6983so752385f8f.0
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396834; x=1757001634; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pP5mgQ/KO2A3DwCCCQ4AUd2vgku2CtkVmWarRJcBL5s=;
        b=hYyHb2FsOZf8wPa3XXTiNqA8sJiVQgo+Dguc9Wirz44VvfqWUdUGPlmN4oZwNTHGmI
         hHYxrY65F5L2BDQ224TQhiXoKONpw8vSI/gaH7K8cz8FF6DTuJgfH0RyGEYqtUSjbWQ2
         1gj/Cw8RlI0aQdJzX5rCqW0GxxKDV1uYqIQ9xS01Goo3+Q1U4FdY6Rf4SWxhGhUIGWJo
         tPCXulF8B6kIEBJvx598PEjB1bkWW85rQCDYowGTh33QXORiBrSCWKXGLvtBC6/Bycwn
         UPY659RxQrML0juQPrqvN8r1CxCrPxzuPCLfuulonm7D0ADKF9IlD+DS3xRTBtqn5k4H
         jR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396834; x=1757001634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pP5mgQ/KO2A3DwCCCQ4AUd2vgku2CtkVmWarRJcBL5s=;
        b=O9uV896mAnxg56UV7BZ/HEQab7fH5qM6mitunQ4//m5aTYCqSR0eq+y2+zRa5F/Cym
         xxbayMIaC2GHdSblGMJSJU+Xh7lFQ5gWcsF+0p8orGhysR5t0Gc1Aes9fVWBV1UV36ex
         znvG8Y52FXOSJ8djXZ2fVQVBmmdzIpiiicVvrwrKLEgiOU5sSXiVHblME/7EQ4veShqw
         VRjEQUIXu/paOtGzE0GSxQ5ivGJWFkJSLQxVJDR309F5XhZeQfwlym4CPmyVslWt5+JU
         X/o7p8z21Cd/EEKmkXMigwxYIjcEIW8DzXAJo5KlC4v2S4I6uT2WJwXKvSz7Vmrp8V9O
         7Uxw==
X-Forwarded-Encrypted: i=1; AJvYcCXKXbEVMOK3W8aseqVs87D8eOAMtjJf16dUFZZFxjSrexBs0GMgBQDMl5P4m2Xbhnb0Zt8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP6umaZg4UKeQ2xS3OrKXu8hZiliwDqbUtPP5Gc8v07I1BTNpS
	mT7EbrF2kXOdj4UGWWEID6jZ71Hh4H5HwpZMR7Ej+FR63TXX09mhOJG4vYHKNjEEz1w=
X-Gm-Gg: ASbGncus1pNm+uhaYKRbdFSrJggh46fngZ1vzonglWacJ7XvGeN14WImOFZhvW/XLXx
	c2IqjeS82DwBYLLLWYhZgxXiOwHiNXhCM8r1tK8jDMvMYDhBLwuz71QndG4V+8JXxoHDnfyifcU
	upKp13+V2Geg5KZO0KEwmAEtDo6W6pmTYURJ0EPrIHp4k0Ry8HsFVXHGNy1WqWHP8GThTy1NWcz
	JAxN8MATyASfTWzeDygoWiRik6Xsq8UJzJmU+h5brDRBW5m53uPhY86uhbNS0ZhDr7EL4eNEL3B
	4fNozUJylpS8/m/G/W152y3KB862/9YQuSoYfNeaEOiPHSQ0uebaIYJp7Pn7dlYl9BdTelx6vdS
	lYq4+WyZL93xa0t6p9m0/3IWiFd0/
X-Google-Smtp-Source: AGHT+IF/YEBlIMtlSjoTBlz73MY+KW34NIRH0NQO4wGYXNv8UgmP3L04Jda4NkFEAj5ubMZH+/DoUQ==
X-Received: by 2002:a05:6000:3107:b0:3c9:cd8a:2921 with SMTP id ffacd0b85a97d-3cbb15ca243mr6478341f8f.21.1756396833984;
        Thu, 28 Aug 2025 09:00:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:17 +0200
Subject: [PATCH v6 09/15] pinctrl: constify pinmux_generic_get_function()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-9-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9697;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=heCL06NLwaBebVNCL7XXRfzeEKX3nvjH2Q2KMKw/M54=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0OSJ+6KxK6PbX/PACI4VH4kRB8IHR9ON9MU
 JmGy7C8qQGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DgAKCRARpy6gFHHX
 ctL1D/oDTBN4t36cQ5paiwmObkaewu5MGDgSBBjxlCjWyR0P3OOh9Ww3ut2AjFIxdMRW9AiDRIO
 sKUASOrHKIm32sDGCahVLsvFRME3KPMFCAg4gJsg1ZdkGsazCK0jztIP0PlZh2Vg9qtlp8HA1py
 +NzPyWWt0dmwCtvp+lu0kF/sjJYLgHT7PGr04i0kNPpswjNj7kYZ+hC/AvLg56lYG6GWoI/2t9A
 LQKlz8CDWkYug23hrY5nwYFh7iqvYZ2bcl7vpOj7+1YCp7AJK9g/2Dj+g4mCybIpS2qz5bMmmX+
 E6AS7nwOwPyhrU3RUNRaOd+vf1cL/ta9I77wCKVvFLnI/EDOPYchR58ZKoRFzvND0MXxD8Aa8cH
 ZYPxoAhuXXIPrn1kjhPe2gIezgi9JQsJkkL1zmJ+5DUtKfi8yDnhoGMa89hJYTjB1g5rks0z8c5
 y9xVdgNTng6/yE7Mk0wC4szS3GrQ7E8bVU6qfz78knyJxJDGoLLewKwyJ6iQYESHfWi4u9a53NY
 VFhtWlek4KsFmrtaa2DVo6vY8vpVC6NspEKw5aA5pZRkGyS/IgxAze3MDTdttS49q3VrI1zKnaY
 lrPe8BJjf6W1KkrRc7vpOWFo4nKVmEZVwm4qtsnUTv/EMWkgvz3ARCRmVMd4x54tv+euGZpZizZ
 Js/4hXE4ZFt3NcA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With all users of struct function_desc limited to only accessing it using
the dedicated function and never modifying it, we can now constify the
return value of pinmux_generic_get_function() treewide.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   | 2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c     | 2 +-
 drivers/pinctrl/pinctrl-ingenic.c         | 2 +-
 drivers/pinctrl/pinctrl-keembay.c         | 2 +-
 drivers/pinctrl/pinctrl-single.c          | 4 ++--
 drivers/pinctrl/pinmux.c                  | 4 ++--
 drivers/pinctrl/pinmux.h                  | 4 ++--
 drivers/pinctrl/renesas/pinctrl-rza1.c    | 2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c    | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c   | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c   | 2 +-
 13 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 3d626d8c9ae9ebd5f7eb76216924c46b34233749..56bfbf4c3575355bdda59cf7471bbf5b9babff4a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -245,7 +245,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	struct imx_pin *pin;
 	unsigned int npins;
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index eb6cd27955fbe462f479fbe92c785588caee5ebd..2eed83f9f209cad79580082c274d4056231bd421 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2443,7 +2443,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 	const struct airoha_pinctrl_func *func;
-	struct function_desc *desc;
+	const struct function_desc *desc;
 	struct group_desc *grp;
 	int i;
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 982b9887521d036538f67e9919de444693c458c0..17a08c73423fd089066e4894d2307c852bbbb661 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -43,7 +43,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned int selector, unsigned int group)
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	int i, err;
 
diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index fce804d42e7d7f9233b2da0fb26e482170629424..18f0da58c96d4f0fad6535fd88e69fc8acf96a94 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -319,7 +319,7 @@ static int eqbr_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			       unsigned int selector, unsigned int group)
 {
 	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	unsigned int *pinmux;
 	int i;
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index af9d2f3081859bc4b22f6820f3b3753eba36f959..e13ef07850386e70cffc83011589ceaf70a70a41 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4000,7 +4000,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		unsigned int selector, unsigned int group)
 {
 	struct ingenic_pinctrl *jzpc = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	unsigned int i;
 	uintptr_t mode;
diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index e78c8b3ec245aad56e3e74a26d27c41ba4a98281..30122ca90cbef141ec456ca39ab4eb6f8bc334c5 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -935,7 +935,7 @@ static int keembay_set_mux(struct pinctrl_dev *pctldev, unsigned int fun_sel,
 			   unsigned int grp_sel)
 {
 	struct keembay_pinctrl *kpc = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	unsigned int val;
 	u8 pin_mode;
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 5cda6201b60f53e62f3f50b8641ec894106111e0..c9adf5fcb1c76445d4812de449edf09878771a46 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -336,7 +336,7 @@ static int pcs_get_function(struct pinctrl_dev *pctldev, unsigned pin,
 	struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
 	struct pin_desc *pdesc = pin_desc_get(pctldev, pin);
 	const struct pinctrl_setting_mux *setting;
-	struct function_desc *function;
+	const struct function_desc *function;
 	unsigned fselector;
 
 	/* If pin is not described in DTS & enabled, mux_setting is NULL. */
@@ -360,7 +360,7 @@ static int pcs_set_mux(struct pinctrl_dev *pctldev, unsigned fselector,
 	unsigned group)
 {
 	struct pcs_device *pcs;
-	struct function_desc *function;
+	const struct function_desc *function;
 	struct pcs_function *func;
 	int i;
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 79814758a084570adea0ea1a3151d186f65d1d1f..62bd4aa53b2b22cb09eacfb05398205f2fe391b9 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -847,8 +847,8 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function_groups);
  * @pctldev: pin controller device
  * @selector: function number
  */
-struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
-						  unsigned int selector)
+const struct function_desc *
+pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
 {
 	struct function_desc *function;
 
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index bdb5be1a636ead9695410824b5557937c5baa89a..549ab10f7afbda32fadf4ad151401180bed2064f 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -152,8 +152,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 				       const char * const **groups,
 				       unsigned int * const ngroups);
 
-struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
-						  unsigned int selector);
+const struct function_desc *
+pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector);
 
 int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char *name,
diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 23812116ef42682d8ef667525d4f4486c286b46a..70f22e0ef307a02d5b11d6626d297a619f5b82e9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1120,7 +1120,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 {
 	struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct rza1_mux_conf *mux_confs;
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	int i;
 
diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index b78b5b4ec5afd9879373b406e0b8c391912a200d..29a9db19759906598ac55694439cff8a5ec2c8aa 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -442,7 +442,7 @@ static int rza2_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 			unsigned int group)
 {
 	struct rza2_pinctrl_priv *priv = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *grp;
 
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c52263c2a7b093fccdb38e44ff3fbba0a86d4def..a9bcb3d7c45c269046df0a7d0088a1f48d089fd0 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -549,7 +549,7 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
-	struct function_desc *func;
+	const struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *group;
 	const unsigned int *pins;
diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index daaa986d994dac15860d328c81e28e2c9e678120..dce68f93d2d57f6a6c9b1bf9e1db27393ece8e44 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -162,7 +162,7 @@ static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 				 unsigned int group_selector)
 {
 	struct rzv2m_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *group;
 	const unsigned int *pins;

-- 
2.48.1

