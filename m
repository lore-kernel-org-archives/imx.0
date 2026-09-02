Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7BA3264F4
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 06:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330239; cv=none; b=F6LuUmyxFG8MNRfscsxv+KYhPYRFIuc8BpDWr9YYdEAvzawwiv3uXHxMGN+WIm4WGFD61OHUArQX/EKPdShkQF1IZbjhBRHgfV1BTPSVmpW94nZTrWeei57nFMcM6UDI+u2bYvuWUhgTmu9lSlIfXvT1st4Gg6dM+ieQYbTvy4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330239; c=relaxed/simple;
	bh=9eaEcb6TvEIduA2i2Qs5j+6mpsX5c1wGth55EfwXySQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiGHI28uyf8jDetn3SHYVisgTw5kC+uy9Gt7zRSr7ZBnxIsQsa499OHzSuFOEWykW3A4tSLi8xpYgfAdnCAMcMfISBTE8TinGBPDd/dVZbSJNzq5AHW+KR0/E+y35w/l/QiWylZ27sXAoEAj5wxoE1qKaIGc1qeQzzYjf9F2x2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+4ADJJw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+4ADJJw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so4349055e9.1
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 23:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330235; x=1788935035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLjWeeRx5GwvUZT6jfZGxkrQuiE7XPs8NxQMb0vudxI=;
        b=f+4ADJJw3SRi0imkWqnU0LeW2qlP+ZpTgmXQdt2YrSnuBJgBZGz2trCZ6TPHosn4fh
         fchnjUnKrTB5hrza1pI8fSJ3XnuP0IFi61lHSnOVIFja1pClE8PFZON2CBiCW093EofJ
         w5sLbYnI9Uk9BlalseGEp6raRixcJd7rMkgAc1g9WxRwM5h+QSRYqGn4IA8zxTHzAj1P
         XfRx3RLg2o+CLbNDJFrd2dwxW+nU0VlK8NBMyOC+RwP/Lgjh8kDqsRmGypwym0EgsrIY
         2Vay9++DJGf2u5f9T8wuGCUow6IE74MVz/OAG7Tc7ghNYbp4Y5/ykbmbDyjop+Trchme
         r6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330235; x=1788935035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLjWeeRx5GwvUZT6jfZGxkrQuiE7XPs8NxQMb0vudxI=;
        b=clPXCUJ0K14R7+bcUfHz/Tpsm+Wnk5vDZxI8RYu3wvPVH0QOdLjukDS/AqtXEq9C3W
         Z0Q06DJm3jB4nMnU3z63wTetIzQC7FNTpxPkZjxnhFID/Z25qMInWHwp+0mLJQT0GX2j
         2DC4XLSbarKfr/4goByvLTIX4SVOw6WmV62S01GBiPngmMn7qBUEbiLW3TApkJA/Gc+S
         0ane05BqrRY5UUPye8wBU8QTQxw7C2Ry4MClMelqF02kDz+wU6Y8TkWIDlzOLA+eluxE
         seFv2ABtGOtazwlEJt6PGtLuC3gqR2jYisxocUaWxWVCk9u6wpO9vmt/4t2huT0oP7mB
         iR9A==
X-Forwarded-Encrypted: i=1; AHgh+RqghM5RFZwn2nxsJSAl2WJmgZ3XWNNHuEmMrYFHyLlCwwGUkO146Yo5M4JDOduVtntwK8o=@lists.linux.dev
X-Gm-Message-State: AFuF++k1bKnev3L1NkOY/gwyycby0QkN1LrNeLAWQlad2BAHRXg+K1u9
	hirsI4w+uvQx3XX25dKWL0gV0H5QSfHgiVsaKSLcmkLbd+Ava0N+J9FY
X-Gm-Gg: AR+sD10rl3/ViEZ2u92l92IcgqoFJPuXh1xEbvIndA/71DWWrHWKUvPKIpSyhxH6djr
	AydOcgU8eG30BNnKZqP6v5ngE+OqnUqvxXEq+qLeMwbislVmUEiI2SrVxOAvGv+ff0l2MO840/n
	ctpZZ/5iI/idVW+1bsAXwCoX7QpICgQk81BqU8jxRdiLbeN7J8DHvYwiFz+01czOI20BhmBu+QT
	ZhDYMte2bcAOUS/eW5zGTp0GRMVQbJ3MrBKJ+xv3XJlTSDQCCy0+HEEIZPadRhEetYFbkC2UHwh
	423QaPBTnadezMcDrmEwQjVZlE/r8FkIyl8zRZpM/y+tcqXqRbDA1aYHjGKKt+klILk/yij2Trh
	2RrPAchm4rsYgp5Pwe9O/srzKX+kaXs6xw4LPTeJdMdJiuOujrxrlV0L70w3Oo7GmROKIO+QXVE
	K+I7o1eU1XHJKghhMXS+tcF8aTYPafkYTZMT7nBtmsp6x7YpRd4AywfifMxDlI3qvQj1I=
X-Received: by 2002:a05:600c:4592:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49ce558ff08mr36761315e9.0.1788330235172;
        Tue, 01 Sep 2026 23:23:55 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4776131sm49735335e9.11.2026.09.01.23.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:23:54 -0700 (PDT)
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
Subject: [PATCH 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 08:23:51 +0200
Message-ID: <20260902062352.3600368-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902062352.3600368-1-mehmet.fide@gmail.com>
References: <20260902062352.3600368-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The mmio pinconf get callback ignores which parameter was requested and
returns the raw conf register, so a generic query through
pinctrl_gpio_get_config() gets register bits back instead of the packed
parameter it asked for.

Decode the requested parameter and answer PIN_CONFIG_OUTPUT_ENABLE and
PIN_CONFIG_INPUT_ENABLE on SoCs that declare where those bits live in
the pad register; Vybrid has OBE at bit 1 and IBE at bit 0. The answer
is 0 with the bit value as the argument, which is what the
pinctrl_gpio_get_config() users (gpio-by-pinctrl, and gpio-mmio in the
next patch) expect. Pins the device tree never configured have no
register offset and get -ENOTSUPP, without the error message meant for
configuration attempts. Other parameters keep the historic raw-register
behaviour, which the debugfs dump still relies on.

This gives gpio-mmio a way to read back the line direction on chips
whose direction lives in the pin controller.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   | 30 +++++++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 +++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 ++
 3 files changed, 36 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..5da1a76b0141 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -21,6 +21,7 @@
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
@@ -297,6 +298,35 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned int mask = 0;
+	u32 raw;
+
+	/*
+	 * Only OUTPUT_ENABLE/INPUT_ENABLE are decoded, and only when the SoC
+	 * declares the bits. Everything else still returns the raw conf
+	 * register, the debugfs dump depends on it.
+	 */
+	switch (param) {
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		mask = info->obe_mask;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		mask = info->ibe_mask;
+		break;
+	default:
+		break;
+	}
+
+	if (mask) {
+		/* pin not configured, nothing to report */
+		if (pin_reg->conf_reg == -1)
+			return -ENOTSUPP;
+
+		raw = readl(ipctl->base + pin_reg->conf_reg);
+		*config = pinconf_to_config_packed(param, !!(raw & mask));
+		return 0;
+	}
 
 	if (pin_reg->conf_reg == -1) {
 		dev_err(ipctl->dev, "Pin(%s) does not support config function\n",
diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h b/drivers/pinctrl/freescale/pinctrl-imx.h
index f65ff45b4003..8fa7e1e2521d 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.h
+++ b/drivers/pinctrl/freescale/pinctrl-imx.h
@@ -91,6 +91,10 @@ struct imx_pinctrl_soc_info {
 	unsigned int mux_mask;
 	u8 mux_shift;
 
+	/* OBE/IBE bits in the conf register, 0 if the pad does not have them */
+	unsigned int obe_mask;
+	unsigned int ibe_mask;
+
 	int (*gpio_set_direction)(struct pinctrl_dev *pctldev,
 				  struct pinctrl_gpio_range *range,
 				  unsigned offset,
diff --git a/drivers/pinctrl/freescale/pinctrl-vf610.c b/drivers/pinctrl/freescale/pinctrl-vf610.c
index 76a4bc0181a0..77d077618782 100644
--- a/drivers/pinctrl/freescale/pinctrl-vf610.c
+++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
@@ -319,6 +319,8 @@ static const struct imx_pinctrl_soc_info vf610_pinctrl_info = {
 	.gpio_set_direction = vf610_pmx_gpio_set_direction,
 	.mux_mask = 0x700000,
 	.mux_shift = 20,
+	.obe_mask = 0x2,
+	.ibe_mask = 0x1,
 };
 
 static const struct of_device_id vf610_pinctrl_of_match[] = {
-- 
2.54.0

