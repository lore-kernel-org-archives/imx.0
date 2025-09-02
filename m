Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8C30FC1A
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814370; cv=none; b=a5vzAiS4HUX2cRj+dTXFYFK/PInar2svcqAsg7foh+PJEC5ENIXm0f0ighXzhtKGvM0+KEmMO5/1O+6aVvSD4dLeUkc2k18ainfhbMW+tQ6jhu7qWkzpJM8o/lX8Z9NXccqaSvEQIWzEw9YF8x0/U4dQefacI69Y4jqZIPXOqIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814370; c=relaxed/simple;
	bh=pmvjkEgGCE/8cGbODfJJcVWmMiP4NpTASf/F/GCdDQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewtAZFZs1XSXwQek970rZDsFno25dthdRdr6Y82jrOLcj3dkL129XwXhuS4cYRUXvFml033NQoMYJepuzqE4XEtbPLib9e9vdm+0XMjRqKxNI9rVh/ae5gv37lVXC5ubBAcR02ydaSeA9pXySs+CA++CMTu0aI7lUJ0xou7vlso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A3E3TRKy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A3E3TRKy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso2766845e9.2
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814364; x=1757419164; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgFR4JYzku3DnxtnEcUmOfGy601E4B4cVXuLJg4blgE=;
        b=A3E3TRKyHMEl9YVF5dL5IrPYG5saBYtpeCQ35Ve3F3d/da1RqgemmUYwZm7A8MZor5
         fZuPtZ0tHbANUD9j2tRxfSwS62vmgEU9PwZx8lZlaEYZXbzr3dLk60xqHnFjGJu7tCqN
         auUfHPtUkRjjpeWyHqAEEpGT6MA3kwOJI9JoOxXXin7exCETvnVrnCOjBz5tPTcDOPXe
         IrS/nEpVFlxWC1RELaLONnKd2nvkRmKqBKSQ3ZVHzrCkhIxWxXcRqAcS1keER6RCjbr9
         nZXjjtCPCX2XS2hmN8YiMAmQjNMtLsVSh8mGdN5jgp6uuRnpcA61TY3HZf5s9tH0BxX7
         i7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814364; x=1757419164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgFR4JYzku3DnxtnEcUmOfGy601E4B4cVXuLJg4blgE=;
        b=jQwCib28ncqIISiS0pNRLp5fXxfE2Vv+nY4SMH1Xrak/oqAVLDxnBPd6csrhvvx9j5
         o4gY11GZOBKR1oZJlXLYEJR5RYiV1nA2DwktqrhGQsLqk+uqCP5Aj58qANqbgNF6T+bo
         90ylZHpyM28eyTvW13YmystBQ795h5SH3GLQWo7OmSCQwvoad+Rqrmkd2vjvQgOykLsY
         SXbNy0X++G05KaBG8JnyzPES89f3HWwngrwEV40lWRwqRH3afGDe/4cZFs+CVksPNal6
         T45YANyk3e9x1hR7WZ3xwZU6AdnFkYZk6I6eVz/cCWOxwYgaaBgarYNB2E9Voq2HDRGl
         mNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+djrVsQN4wjVBj+4yoXoVe8kNmiTKY3QbVWN7eYTAYp5uyEThlv7kAt2nmj47tk26rTc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhQwSl92TWXI5YuW5CZ9XAH3ZmC6W2kkKPAmYyeDTtLkU0fjS9
	Y+ywDA/iH6cRuQuAiQo2wvuR2SPM13GAmAyTehJ67ro74hTXgfOTQNEEGlTbyQE/KzI=
X-Gm-Gg: ASbGncuEaFSpAuhQZrEfEht5SSr8r8x8ZhDFFz+gv+HkWVkNJpko435a+0U2rMvwpoj
	R1+mWYa4CaoSqESGdGxSIfOCeV4dzKFo+n3m8nIV2qEMfm6i15RN2/kKf6O4Dj9GlVh6NADHFyz
	dDNzALhHR6Z9Kyj6gDQubpfJN9YijyOj+ZTSijwRcbgxJtvJbgdOh3wmxzGAnQkxDHaC5agh7DO
	dWqyvqbSPGODO4v7rrr9aXS+44l04hC7IJYja1iuVgugktFWwf+/NT83jslepwuuZFsmS2lGENd
	Sw+iPwrXDst6/uu2r3fzX1McfpOd6ibdqC4xxowI2iVDAlzWORMeDNUH0e1WwfaFrV/i3lrtE7o
	TeVm9yOhfgYE1tyOF
X-Google-Smtp-Source: AGHT+IEKXsHjEUhuH6wRWLK489irD13ITqJD/VynaOuVYt4g+rvkQtR7GAX4bOkX9Wr9zTMFFREQDA==
X-Received: by 2002:a05:600c:524b:b0:45b:84f2:76ff with SMTP id 5b1f17b1804b1-45b8549c809mr92371695e9.0.1756814364206;
        Tue, 02 Sep 2025 04:59:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:12 +0200
Subject: [PATCH v7 03/16] pinctrl: ingenic: use struct pinfunction instead
 of struct function_desc
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-3-bb091daedc52@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9044;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FkLrNkeOzJSHzI/Py7RyDUr6KQps7dFmE2AsFFRpc3M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwS1UKRgkb9ccIEU3IZ3aW5VjhJjzIWrcLvA
 hZ9ye192huJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEgAKCRARpy6gFHHX
 ckpiEADcWoZprO9Xud4RwPgcecXpho5pCPR8wMVVtHaWIF3NsJfE2Kjy2nGdi3EpUqADsyOJnnb
 UJYIoAWcyM1Umxp4vDl5gaQelD8e4X3w3aFvpSYpH29Myl8Vw3K/UWIfrgz0CZv9OEJvWDQwXT6
 K664I284sIKrYEtXGYTUZ8H2Ffj7OEF2Ts221vDtkho1puGzJX7qzs7Fdf1Q27mYeVvhL9892gm
 atbQcnqjY/a/8xKwCyJJmaDmrnLnFoReX/tB9MEWiYLKK6KsQXApTqPgAQJ4hyQFwYGZI/UbNUE
 O4RnB5pZ3IbLMWdn733nIeeUbBywAKt92kxjmv/N0Ovl/8cwQwmNMwqJkvhZKdJ/KCmxhr8Xp38
 zYsfy6+sY8+dbnRYqDcXxOlZcWMegK1eKgyUc6OEEktog+JNGoYYeDGsILee2KqX7N4BYCP4a4u
 VuJfCSLrgH3iNwUTINLmcIYULAebuoq+BdjBKhPLlma8tq2jy9DRoM05S9gxvcr6ShCo1X6yiF2
 v10RD0B9g6NqC4oN7ovyMhSdts67P1P0E5cDbF7q9b5XaHWokUaarYXFUCu4O8aMrDGu84GkkUB
 j7GGq0nJrNfm5dsdUSpwJSnQR7bqwb/F23b/cCfFSEe69ge2KLJiQiEl0/teWhWx7WKIr89iWmT
 JyuUv2S5n9ijytQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 45 +++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 2900513467fa4e2e9374946fc9c7a30d48aef9eb..af9d2f3081859bc4b22f6820f3b3753eba36f959 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -96,11 +96,8 @@
 		.data = (void *)func,							\
 	}
 
-#define INGENIC_PIN_FUNCTION(_name_, id)							\
-	{											\
-		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
-		.data = NULL,									\
-	}
+#define INGENIC_PIN_FUNCTION(_name_, id)						\
+	PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups))
 
 enum jz_version {
 	ID_JZ4730,
@@ -128,7 +125,7 @@ struct ingenic_chip_info {
 	const struct group_desc *groups;
 	unsigned int num_groups;
 
-	const struct function_desc *functions;
+	const struct pinfunction *functions;
 	unsigned int num_functions;
 
 	const u32 *pull_ups, *pull_downs;
@@ -263,7 +260,7 @@ static const char *jz4730_pwm1_groups[] = { "pwm1", };
 static const char *jz4730_mii_groups[] = { "mii", };
 static const char *jz4730_i2s_groups[] = { "i2s-data", "i2s-master", "i2s-slave", };
 
-static const struct function_desc jz4730_functions[] = {
+static const struct pinfunction jz4730_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
 	INGENIC_PIN_FUNCTION("uart0", jz4730_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4730_uart1),
@@ -370,7 +367,7 @@ static const char *jz4740_pwm5_groups[] = { "pwm5", };
 static const char *jz4740_pwm6_groups[] = { "pwm6", };
 static const char *jz4740_pwm7_groups[] = { "pwm7", };
 
-static const struct function_desc jz4740_functions[] = {
+static const struct pinfunction jz4740_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4740_mmc),
 	INGENIC_PIN_FUNCTION("uart0", jz4740_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4740_uart1),
@@ -474,7 +471,7 @@ static const char *jz4725b_pwm3_groups[] = { "pwm3", };
 static const char *jz4725b_pwm4_groups[] = { "pwm4", };
 static const char *jz4725b_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4725b_functions[] = {
+static const struct pinfunction jz4725b_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc0", jz4725b_mmc0),
 	INGENIC_PIN_FUNCTION("mmc1", jz4725b_mmc1),
 	INGENIC_PIN_FUNCTION("uart", jz4725b_uart),
@@ -606,7 +603,7 @@ static const char *jz4750_pwm3_groups[] = { "pwm3", };
 static const char *jz4750_pwm4_groups[] = { "pwm4", };
 static const char *jz4750_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4750_functions[] = {
+static const struct pinfunction jz4750_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4750_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4750_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4750_uart2),
@@ -771,7 +768,7 @@ static const char *jz4755_pwm3_groups[] = { "pwm3", };
 static const char *jz4755_pwm4_groups[] = { "pwm4", };
 static const char *jz4755_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4755_functions[] = {
+static const struct pinfunction jz4755_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4755_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4755_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4755_uart2),
@@ -1106,7 +1103,7 @@ static const char *jz4760_pwm6_groups[] = { "pwm6", };
 static const char *jz4760_pwm7_groups[] = { "pwm7", };
 static const char *jz4760_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc jz4760_functions[] = {
+static const struct pinfunction jz4760_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4760_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4760_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4760_uart2),
@@ -1444,7 +1441,7 @@ static const char *jz4770_pwm6_groups[] = { "pwm6", };
 static const char *jz4770_pwm7_groups[] = { "pwm7", };
 static const char *jz4770_mac_groups[] = { "mac-rmii", "mac-mii", };
 
-static const struct function_desc jz4770_functions[] = {
+static const struct pinfunction jz4770_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4770_uart2),
@@ -1723,7 +1720,7 @@ static const char *jz4775_mac_groups[] = {
 };
 static const char *jz4775_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc jz4775_functions[] = {
+static const struct pinfunction jz4775_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4775_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4775_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4775_uart2),
@@ -1976,7 +1973,7 @@ static const char *jz4780_dmic_groups[] = { "dmic", };
 static const char *jz4780_cim_groups[] = { "cim-data", };
 static const char *jz4780_hdmi_ddc_groups[] = { "hdmi-ddc", };
 
-static const struct function_desc jz4780_functions[] = {
+static const struct pinfunction jz4780_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4780_uart2),
@@ -2211,7 +2208,7 @@ static const char *x1000_pwm3_groups[] = { "pwm3", };
 static const char *x1000_pwm4_groups[] = { "pwm4", };
 static const char *x1000_mac_groups[] = { "mac", };
 
-static const struct function_desc x1000_functions[] = {
+static const struct pinfunction x1000_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1000_uart2),
@@ -2341,7 +2338,7 @@ static const char *x1500_pwm2_groups[] = { "pwm2", };
 static const char *x1500_pwm3_groups[] = { "pwm3", };
 static const char *x1500_pwm4_groups[] = { "pwm4", };
 
-static const struct function_desc x1500_functions[] = {
+static const struct pinfunction x1500_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1500_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1500_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1500_uart2),
@@ -2562,7 +2559,7 @@ static const char * const x1600_pwm7_groups[] = { "pwm7-b10", "pwm7-b21", };
 
 static const char * const x1600_mac_groups[] = { "mac", };
 
-static const struct function_desc x1600_functions[] = {
+static const struct pinfunction x1600_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1600_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1600_uart2),
@@ -2779,7 +2776,7 @@ static const char *x1830_pwm6_groups[] = { "pwm6-c-17", "pwm6-c-27", };
 static const char *x1830_pwm7_groups[] = { "pwm7-c-18", "pwm7-c-28", };
 static const char *x1830_mac_groups[] = { "mac", };
 
-static const struct function_desc x1830_functions[] = {
+static const struct pinfunction x1830_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1830_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1830_uart1),
 	INGENIC_PIN_FUNCTION("sfc", x1830_sfc),
@@ -3225,7 +3222,7 @@ static const char *x2000_mac0_groups[] = { "mac0-rmii", "mac0-rgmii", };
 static const char *x2000_mac1_groups[] = { "mac1-rmii", "mac1-rgmii", };
 static const char *x2000_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc x2000_functions[] = {
+static const struct pinfunction x2000_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
@@ -3449,7 +3446,7 @@ static const struct group_desc x2100_groups[] = {
 
 static const char *x2100_mac_groups[] = { "mac", };
 
-static const struct function_desc x2100_functions[] = {
+static const struct pinfunction x2100_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
@@ -4571,11 +4568,9 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < chip_info->num_functions; i++) {
-		const struct function_desc *function = &chip_info->functions[i];
-		const struct pinfunction *func = &function->func;
+		const struct pinfunction *func = &chip_info->functions[i];
 
-		err = pinmux_generic_add_pinfunction(jzpc->pctl, func,
-						     function->data);
+		err = pinmux_generic_add_pinfunction(jzpc->pctl, func, NULL);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n", func->name);
 			return err;

-- 
2.48.1

