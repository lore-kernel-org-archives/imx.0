Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B13A168E
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459512; cv=none; b=DYD0Zt/XLlOgUMag6XuUk8Gf7Cpff5oN3kjJU7sj+jNAA+V23wY1Uxvv4BdoESt03qtiBaR8ywPyyc4RSAF9pFUFw8cmAviNdvpkl7mH0JxKE5LV8Z3A+d2zV9bDOWmMzRDnUODjZ7P5KBJZ7Mmv8JdAk/J5KMiqyDe/1uuOCxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459512; c=relaxed/simple;
	bh=mUeECvre9N/g2AeEciKDvfrTAyCAo+pbekzbwT4/uBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EF+lNL3veQ1cb2d2YhwXtLqDSdKySqTiV3JR1Tu7hl2RbDryDLnlQcgurS9rJqThOdYHhfVPWg7t5YcmkH29wUpWKx6vTK/aXBa+hbajmk3U22kTvwdTK/cdSSRAAGgb0IwVhP4XpxgXiv8NwlGpg38x7NqfL8HoEGT2bMfYbik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzxWOgRx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzxWOgRx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so9222f8f.0
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459506; x=1790064306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rh1GYOmyo/w6ySQPuPwCmll79vIZ+StwKSaTeDc/e6E=;
        b=RzxWOgRx5x+ZbeJ9Z7bCfUFXa3Ea7iJ93v+FxKvHQdHScuoJqMawULni1UQh9hlHb9
         +gQ2le1OhcpHj7KD/Wvbq1OLUIcRv4bT1Ugh/7Y/+o/lxgGCMxtsOletKBDeEbPTM0ep
         go34qUjzT6SvE4yHRUgKtZUqhVwolXZ87ZcRAv3/5Uhynx2ZDz1FBh6HjGd1uqjO/26W
         94ogbxZrI/DH1wXJMb6E1vJbSxS/BVirX5xwgogitEeBTDU6+GTwNgyDQX3cc+RscKsI
         74b3fzBagEkembWJ5l6yOT2mST7epeQmNwXYHWoZvtiIe48VEtqmRRTZkOK8aBhhBMnN
         S5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459506; x=1790064306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rh1GYOmyo/w6ySQPuPwCmll79vIZ+StwKSaTeDc/e6E=;
        b=GcrEsWvTXj0t5ay4l4+umfSS7yjU5Kys8pNudCUn06H0pskk9fbTa1NcHhHl2T+GM7
         eCW7//hgKhHHbiMaF9jBv5reqKfALCoBYoFcNsOyv7UKdXlJp/dwfMKaBENmyDwNGdY/
         Ax81aL/2jdelXG5WoG0g7i4t3wFipcByNA0BCSZ/zszm2tJnlUs29fy8q2K1FK9fvDf8
         d6nHJzkMq6RWLGN9wlDkpCoBmIE2tRL7ZF7kp+Vsgu25Yt5LPVkMCstF+ROPbhLWlpr8
         rr37c130TQNKcDQYxwLUJhGTDzOaz/z6s6L7fAMeKJEbczmcxmH82Z+1CgH9/2KYdoSG
         43Vg==
X-Forwarded-Encrypted: i=1; AKwUvBzqZFtCBH2I2rn6apmM/5bfXZckS+76peQQncIqCoLwQRwwA8RIgFe9XI8RtFWc+8Xtdok=@lists.linux.dev
X-Gm-Message-State: AFuF++maFaGxRzm8bfsPCpfYFu9xcBwJ011i9tT7TT0g7r6sXKQuY5tH
	XNbsDAiY8pN80QSy57ZIuC1pbeXYqQIYXcJ/JN5Lc/fmR7xNS9OJXv4a
X-Gm-Gg: AYBFou3r/JMHPaDjgsgj0G887JNPOtLPWJwQnHAyIpFbg7bXikaGekvCgHqLknvSHAf
	LHSk4atwFbrFkgdWqeblYvE198N35OiSuUxlPHbNDmQ6QaYEC4RCCoMGAL6TR4XzSSD30X3Plmw
	YMQswaJeI5FHU0eDg9c0TdvSF5Y+ASrHzKWNIBIdayUGF1Tl2V+vNJMhi5Bu2pa2lFzRspQ8/2F
	iyAOmS6TccNXKqpRbDPJgDoviPRi99gpC5YrSChnevmMrx0RzgRAqujLEZUdxz4H/eGI7XGRD15
	TIwQXkVb7IrV/KNK5GOv7a51G+i8Ny4ZsyvmmRVm0FUsumOLKBaDD4YY+Zk7NkfuXmoAp+Pf2aD
	fGEV8D+9cSCy5KCnW1McQnjgFlgQ48nj06/rOXsr8sVaOP66sVIp7/TQ4zQL/aaXSPrEneF2stW
	qeoGzVxE4T1v7jZVm4PkgKvYCCgRzbiRYmVs4DZNsEcNypT0uM8szSL1dAsaKs34murJieX9AHK
	XrIdLgVytmm7Z4=
X-Received: by 2002:a05:600c:4f46:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-49e82213d4bmr1619135e9.2.1789459505886;
        Tue, 15 Sep 2026 01:05:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:05 -0700 (PDT)
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
Subject: [PATCH v6 2/4] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Tue, 15 Sep 2026 10:04:59 +0200
Message-ID: <20260915080501.329424-3-mehmet.fide@gmail.com>
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

The mmio pinconf get callback ignores which parameter was requested and
returns the raw conf register, so a generic query through
pinctrl_gpio_get_config() gets register bits back instead of the packed
parameter it asked for.

Decode the requested parameter and answer PIN_CONFIG_OUTPUT_ENABLE and
PIN_CONFIG_INPUT_ENABLE on SoCs that declare where those bits live in
the pad register; Vybrid has OBE at bit 1 and IBE at bit 0. The answer
is 0 with the bit value as the argument, which is what the
pinctrl_gpio_get_config() users (gpio-by-pinctrl, and gpio-mmio in the
next patch) expect. Other parameters and the SCU based SoCs, whose
firmware call returns the raw pad value as well, get -ENOTSUPP; a pin
the device tree never configured gets -EINVAL, as the raw helper already
does, so a caller can tell "no answer for this pin" from "this
controller never answers".

The only in-tree user of the raw register was the debugfs group dump,
which called the callback with an uninitialized config; it now reads
the register through its own helper, like the single pin dump already
did.

The set callback is not touched: the fsl,pins binding hands it the raw
pad register value and that stays the only thing it accepts. Nothing
in-tree sends generic parameters to it on these SoCs; making it
understand them is a separate change.

This gives gpio-mmio a way to read back the line direction on chips
whose direction lives in the pin controller.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   | 54 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 3 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9a45b376d36f..f08ef52bf4f8 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -21,6 +21,7 @@
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
@@ -291,8 +292,8 @@ struct pinmux_ops imx_pmx_ops = {
 	.set_mux = imx_pmx_set,
 };
 
-static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
-				unsigned long *config)
+static int imx_pinconf_get_raw_mmio(struct pinctrl_dev *pctldev,
+				    unsigned int pin_id, unsigned long *config)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
@@ -312,16 +313,61 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev, unsigned pin_id,
 	return 0;
 }
 
+static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev,
+				unsigned int pin_id, unsigned long *config)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	unsigned int mask;
+	u32 raw;
+
+	switch (param) {
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		mask = info->obe_mask;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		mask = info->ibe_mask;
+		break;
+	default:
+		mask = 0;
+		break;
+	}
+
+	if (!mask)
+		return -ENOTSUPP;
+	if (pin_reg->conf_reg == -1)
+		return -EINVAL;
+
+	raw = readl(ipctl->base + pin_reg->conf_reg);
+	*config = pinconf_to_config_packed(param, !!(raw & mask));
+
+	return 0;
+}
+
 static int imx_pinconf_get(struct pinctrl_dev *pctldev,
 			   unsigned pin_id, unsigned long *config)
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 
+	if (info->flags & IMX_USE_SCU)
+		return -ENOTSUPP;
+
+	return imx_pinconf_get_mmio(pctldev, pin_id, config);
+}
+
+static int imx_pinconf_get_raw(struct pinctrl_dev *pctldev,
+			       unsigned int pin_id, unsigned long *config)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pinctrl_soc_info *info = ipctl->info;
+
 	if (info->flags & IMX_USE_SCU)
 		return info->imx_pinconf_get(pctldev, pin_id, config);
 	else
-		return imx_pinconf_get_mmio(pctldev, pin_id, config);
+		return imx_pinconf_get_raw_mmio(pctldev, pin_id, config);
 }
 
 static int imx_pinconf_set_mmio(struct pinctrl_dev *pctldev,
@@ -426,7 +472,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
 
 		name = pin_get_name(pctldev, pin->pin);
-		ret = imx_pinconf_get(pctldev, pin->pin, &config);
+		ret = imx_pinconf_get_raw(pctldev, pin->pin, &config);
 		if (ret)
 			return;
 		seq_printf(s, "  %s: 0x%lx\n", name, config);
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
2.55.0

