Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD5C31E0EF
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814391; cv=none; b=fZcMIImkYbf+ukdi1GzYxLJmBNTTBJiwUT+4ijUfh7ATsEXyfkk/K3ftcg2fmtuV8guc+dRIR+X2ZbV0SUlEgFIRIIy3pnZ9htFNotNILDcx9uo6EePI7QSTCrpXAKITyDaBmGQsDZRnKk9Mfv3Kdvpt2WOjV5upu25+opxArGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814391; c=relaxed/simple;
	bh=TDxN/uH8qTcnKwV5wkk294D5MKsLXAiZ97ovdM0wb3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLd003ZwRCgz80HPTh0F3erWjkVfcq1wTUpzRRENINjNl4yxAJGFTs61R+65HDGbWhHXlNeJ4+b4GZdOJ4i8Py8uyY96u6+nK5otKrfNylwu11IsEi+GSIXgFt3pciHzSX03ih1QeXPa3KK9ydl8hLTVlrNakblePH7Q4eUqrag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yyshwnwO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yyshwnwO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso35722395e9.3
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814381; x=1757419181; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/xhHenXAsMplf3u6s5pmBuHZgaTHex9nceZrFvuNAk=;
        b=yyshwnwORXrOcLEaVHPyAVoogvCNT23N+lCZt2XoXqNZHUg3SrHuTRBh+fi5o16fQh
         7A1G4qpTxZtqFsIqHUXIB5PIz0yPwMLe4rhzH1Aaab+//p0+K1EK13KxvBcqXa0mEGq2
         88fcsn0nJQ82A5TUO1ORE1andEecPNB7paFAP+0uP4+3LFSCWb5aGFzoHcoe0U+5x/I3
         cWz026gNWESprE6YOXOPZRhdNBK0rIwW0/9TMLcmqbRLr0hqt/c4C2ztID0f5TmXmdm0
         JXoEsPf2qgtJOsU07NY/cm8OREgCk4+IYTivozFP7HhCT3Ovv+DFQZlRzOeBeBDtViji
         4rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814381; x=1757419181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/xhHenXAsMplf3u6s5pmBuHZgaTHex9nceZrFvuNAk=;
        b=gQILdtxcrIo/MVvrzVHKNe14SkqPBAqkRxgW7h+4Em3S7f94ZkFLi06zoNzc15JDAD
         H5e57KC92Dv4zusaAdRbARM2O3GJ2Akf9B49woAyZvKiWL7PhCXTxcM0ox+dXsrBxxWM
         HDFSKRRXZflrG2wVlcD5k/8Ai/cx+BFiiJ6kfnZUtvHXIqGA2Cisn0W39YeKGl4OhmUv
         xWe4sDK9pSADQP9P0VDIiURvKx3fqBESV8AhDtdYYxSvpz4R3GrC5JadgMI6072t6f1n
         N/c738IEa9aAlS/31Fz+ryy1nGGZg34jIYvJ7Ylan8HemkuqHxUPLVazcXtk1GIcAccb
         0paQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvUnCcH0S06+qKycI5IyhfLyMG8iwYHVt7LYHRAKi9h+dYoM3qecFbUU3ICsZmqHeFbS8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyF03KG1u7Z7u6Vh3Grgv7Oyo8SAC1/0w9mgXOp7XgSrJQ56p6W
	uLPInvRvkT59NlHMNqhwm8qENqLVRRGbGAUsDbOLaNKvA/KmtJBf8I9iGYe4+YuJshk=
X-Gm-Gg: ASbGnctusGzRFp30/LWplSgDUivhltzjmgsv6VN7b7NNVeR2WIYrld8HVqM4tUAueBR
	XGGo6AR/CDbfrX45JsKtr/GzojRGobSovUlbPJ80eQJ6sk/PjCcRq0Fp2aHNCy46foA1JhjDlnO
	5QrGAe/YuIi00iLnwoDjMD4VnmG5Wi+Om019MTwtpsHMJervmZ4eC7/vx08N9afGK8YqvoNHohw
	6jM8zij2V3128yf7TqUsBou9yJ3u19LWLvOeHwz80da67FCHin6uzSN/ltxc8EPRfwpgt1y3Ups
	QrKD3w3wT9cczWPIEFWosuVfViZ7DIqWA5uRqICNfx1D8YEtza+Q0mCSmuiN1tuADvhUwU5jdiU
	XO7RpVa5Gji5K0KhX
X-Google-Smtp-Source: AGHT+IFFcOpY3Utnvjf65Nu64vvFfevq/JcfMRRsoKc8OiO51qRcKypbCk0ggH7PazTdXylK2/FTOg==
X-Received: by 2002:a05:600c:138c:b0:45b:75f0:2d66 with SMTP id 5b1f17b1804b1-45b8553da82mr85386745e9.4.1756814380994;
        Tue, 02 Sep 2025 04:59:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:22 +0200
Subject: [PATCH v7 13/16] pinctrl: allow to mark pin functions as
 requestable GPIOs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-13-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7303;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ad/7ZtxydbTdpBCeQAT3xe1dzmeABB/N+TQC4QQw00Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwUnI9ibVpJgIM2CXH34HKUqefNgJQqX111f
 6azmjUqEayJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFAAKCRARpy6gFHHX
 crI8EACxskT9dEpW5d6LUzgdawqMjxZwRmZyQMOCyV0IKvpVcaQ2Vv3Wr5Hht023kdnijctKCXS
 Ido3+4GIv8wSJdTZQ56I4KxofnDG2vyYeZPNpDoyiWLkH+yc6UQndbBmcs9JBrl+IY9DsH9KGE/
 I4eJI4ZEh7eJ8j56ofq+2BznQPdh9ksHXna1EzYROBLe+wzox6SnIpbHRCCYjjI4DqrN2w0Lsv4
 4LBel3uvwjLe/5Ye+Ku/OgrfFEs6SAN+1X51mLsUeCYW+41xXi4lXCOEUoxR5tWmdb7AswqeTan
 nZ/IaxxY4w2AiOPIGeq4RWgY0Ge5XCUYgxwKgj5SrSjWQ4cmuxOJtznbOquptEloM+cdwFGPrhl
 +hPVaXlKG7ES6gnoBDPkNzXJkRV5YOKTrNa4YXr623pJEa9WEywx9eeg19elGZ/gMFu0SZhm9ur
 8s6tHh7+0t1aqqLPm1w4pdFaLTigqMH3LYRExCoJs5YdGheFHXQ93HqhY2XswD7fr8MfhKExZ97
 /3cj20QdCk2vkJvJlzaItZ2Dy6RNKHd70azroEtYTGiKkMQZ5RX8H+I8Y8YuHHiVkMKHWEncfSu
 V22BPreBipqjNwOdGxc/fGEFSh+Dt9CpW55mvqzwcer+/Fo2Asl9/9tEusw0oLjMWt9BXfiibGC
 QB1qcz+eP8lWwfQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The name of the pin function has no real meaning to pinctrl core and is
there only for human readability of device properties. Some pins are
muxed as GPIOs but for "strict" pinmuxers it's impossible to request
them as GPIOs if they're bound to a devide - even if their function name
explicitly says "gpio". Add a new field to struct pinfunction that
allows to pass additional flags to pinctrl core. While we could go with
a boolean "is_gpio" field, a flags field is more future-proof.

If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
to it can be requested as GPIO even on strict pin controllers. Add a new
callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
core to inspect a function and see if it's a GPIO one. Provide a generic
implementation of this callback.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c        | 46 ++++++++++++++++++++++++++++++++++++++---
 drivers/pinctrl/pinmux.h        |  3 +++
 include/linux/pinctrl/pinctrl.h | 14 +++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 4 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 07ec93f09334f8ba8f8cbde4c54fd6a894025ae6..3a8dd184ba3d670e01a890427e19af59b65eb813 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,20 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct pin_desc *desc = pin_desc_get(pctldev, pin);
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
+	bool func_is_gpio = false;
 
 	/* Can't inspect pin, assume it can be used */
 	if (!desc || !ops)
 		return true;
 
+	mux_setting = desc->mux_setting;
+
 	guard(mutex)(&desc->mux_lock);
-	if (ops->strict && desc->mux_usecount)
+	if (mux_setting && ops->function_is_gpio)
+		func_is_gpio = ops->function_is_gpio(pctldev, mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +123,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool gpio_ok = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +135,21 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		goto out;
 	}
 
+	mux_setting = desc->mux_setting;
+
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
 	scoped_guard(mutex, &desc->mux_lock) {
-		if ((!gpio_range || ops->strict) &&
+		if (mux_setting) {
+			if (ops->function_is_gpio)
+				gpio_ok = ops->function_is_gpio(pctldev,
+								mux_setting->func);
+		} else {
+			gpio_ok = true;
+		}
+
+		if ((!gpio_range || ops->strict) && !gpio_ok &&
 		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
@@ -138,7 +157,7 @@ static int pin_request(struct pinctrl_dev *pctldev,
 			goto out;
 		}
 
-		if ((gpio_range || ops->strict) && desc->gpio_owner) {
+		if ((gpio_range || ops->strict) && !gpio_ok && desc->gpio_owner) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
 				desc->name, desc->gpio_owner, owner);
@@ -861,6 +880,27 @@ pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
 
+/**
+ * pinmux_generic_function_is_gpio() - returns true if given function is a GPIO
+ * @pctldev: pin controller device
+ * @selector: function number
+ *
+ * Returns:
+ * True if given function is a GPIO, false otherwise.
+ */
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector)
+{
+	struct function_desc *function;
+
+	function = radix_tree_lookup(&pctldev->pin_function_tree, selector);
+	if (!function)
+		return false;
+
+	return function->func->flags & PINFUNCTION_FLAG_GPIO;
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_function_is_gpio);
+
 /**
  * pinmux_generic_add_function() - adds a function group
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 653684290666d78fd725febb5f8bc987b66a1afb..4e826c1a5246cf8b1ac814c8c0df24c4e036edd2 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -169,6 +169,9 @@ int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
 
 void pinmux_generic_free_functions(struct pinctrl_dev *pctldev);
 
+bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
+				     unsigned int selector);
+
 #else
 
 static inline void pinmux_generic_free_functions(struct pinctrl_dev *pctldev)
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index d138e18156452e008f24ca06358fcab45135632f..1a8084e2940537f8f0862761d3e47c56c8783193 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_PINCTRL_PINCTRL_H
 #define __LINUX_PINCTRL_PINCTRL_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device;
@@ -206,16 +207,20 @@ extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 				  const char *pin_group, const unsigned int **pins,
 				  unsigned int *num_pins);
 
+#define PINFUNCTION_FLAG_GPIO	BIT(0)
+
 /**
  * struct pinfunction - Description about a function
  * @name: Name of the function
  * @groups: An array of groups for this function
  * @ngroups: Number of groups in @groups
+ * @flags: Additional pin function flags
  */
 struct pinfunction {
 	const char *name;
 	const char * const *groups;
 	size_t ngroups;
+	unsigned long flags;
 };
 
 /* Convenience macro to define a single named pinfunction */
@@ -226,6 +231,15 @@ struct pinfunction {
 		.ngroups = (_ngroups),			\
 	}
 
+/* Same as PINCTRL_PINFUNCTION() but for the GPIO category of functions */
+#define PINCTRL_GPIO_PINFUNCTION(_name, _groups, _ngroups)	\
+(struct pinfunction) {						\
+		.name = (_name),				\
+		.groups = (_groups),				\
+		.ngroups = (_ngroups),				\
+		.flags = PINFUNCTION_FLAG_GPIO,			\
+	}
+
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL)
 extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
 #else
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index d6f7b58d6ad0cce421aad80463529c9ccc65d68e..6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -66,6 +66,8 @@ struct pinmux_ops {
 				    unsigned int selector,
 				    const char * const **groups,
 				    unsigned int *num_groups);
+	bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
+				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,

-- 
2.48.1

