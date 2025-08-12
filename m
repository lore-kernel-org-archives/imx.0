Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2157B2E4265
	for <imx@lists.linux.dev>; Tue, 12 Aug 2025 08:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987240; cv=none; b=u/EhIE/aEgVn4OKugMCxU7MuSQiMv7glwBQJW3Q0cAqTBDK30vB95aeAF/Ra+jRIlzbK/mDcZVs+vYIWOok/ngM/DvXrI74v24ztuDiFoOTB6HDyrTnM3/EXX+ZVO5c7NEreWofQ3AJm0t+u54fqZaeUgpVzgx80aj6YZepUicU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987240; c=relaxed/simple;
	bh=XLM+AKGhm/JPaIWRpDkOq+A/wAVorXQ6mpQytd/t0+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKVEg8SxjER/jchIczooXOkVnmtIA3Plyn0c489n3uuBDU0frPHFYaQapGcQrucYhwAUkjFqNYxGSU+yDBywJ784/APXCqBLfVbI/BsFGbmZ1e67HwNLE1sMelYC5TSy9xVXe16Hwq3LpmFFYyHJIAgXlzOdVdNoQgI1lDFcrh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dSXTIGYp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dSXTIGYp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so26170505e9.2
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 01:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987235; x=1755592035; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=;
        b=dSXTIGYpF+IDV5AtXMXEiHUR1pLrX/SvBemRS6Si0ojS5x7V7nGck+ZTJI8Emg45Vx
         TyWAYpqjjO09XtJUDvK96qzdc4VPWTh/1/GAwJkrU6IJFsu9aBfTvvnlaJyX/VihYm2t
         GKbGJQ4ZTMbh9VhBOsJEOSAl94qUiiwe5SRJ4gFX9FYC7XyG920YU1Il6m6x8X1Heci1
         SWsTEDchFRV+kwsbtIn3vdT+qVX+DF5bdz80/SAqw01xR2JxoKB4UOb0JEXdHFrGkBeN
         PU28YzZIGc0okVI5mDpA01VPLFUc7gbS5UzA/nIzVfUrgv3YbC1szgbMrzWeePxKO3Zh
         IExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987235; x=1755592035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=;
        b=O7ccOona3jXVYOitTdyuDPwRyzBFkaIcp9tKJmIYaDC2G+PoCnUJfmYXrB1JFQ1Qzl
         YZR0S/GF7sKiM+5LAWYAl4NsZrr7AlGFFFggwo3TD4L5iYRnxIlCoyn90mgFAnCAyD0G
         w/SRX975tQG1ov2TAQHX+DnW6S55jDKODy3DqrY4n5GtHgJ+AX3m+TQleOHiQLXg/DmJ
         0blN4hf8ZRxh2++STRn1nEioE50trkmsZN2eD5TVdYI5BV2CCmpcxVQUA5HdjxQr2w20
         6SXdJX2nbeMYxb3OSWjb4pLGOHwQr+2dAMDQ7JxFIwIrbgBSU5H3Gt6ztnb0WXhHZiyr
         aJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCVLm+9KfSrfmcnr0OW06791q2Ie7BBvkBGEj4qGsNcjPofdskCwae0jIL8LTkAJL1h9YXM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVQ5DE9sQkgxZNXbchnCHWE2daD8JkypYMrF4byqXBuD1FN7xC
	l3tvW+Iy4EH0PlA9NJab6TPzK+03/jGu00KwsP2IxpLPwyE/kEfcJsqUkwy0ASATiB0=
X-Gm-Gg: ASbGnctP1cFPlbY/3d4oFcQP/4DBE9GE2AtPInnehTQgnKaWAos9RozbqKe8/l04F6D
	ejhTDd4iBGPU+PmUuASyAxJVswaSUOQQjAYrqqp3aO0uwxG/b5Nvpfl90LaEqFKtv4ef2LxPobn
	boFWR/5SgendBeG8zP37iVdYOt2u+WTA+lTNJv5kdi+Oq5C3Rcqu0KQ6iB+lpiMjmnaK5U5ndzi
	jd3OAHDCrm/sEuiKCaAjAeJZAzTMAOCvS32iihBj52dNqrHUmoFO451Uz6goTTag1YwOcwn8Z/A
	2PCijurB+luzdyhS5/Ibqcqu8PuNgEd3qtqQGYwaX2qnCebN6Iif8KyFnl4VUwLYLuEcVBqR+j9
	zBsJoEytDRZf8BNI=
X-Google-Smtp-Source: AGHT+IFdKvznDMFZVInYZwwYDHVNkoHUkpPZeGPe2WfSJ5pngAh+BKH1PEfINHP8AliGuYpxgpRk9w==
X-Received: by 2002:a05:600c:3d92:b0:459:db80:c29f with SMTP id 5b1f17b1804b1-45a10b9f437mr17532975e9.1.1754987235079;
        Tue, 12 Aug 2025 01:27:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:03 +0200
Subject: [PATCH v4 04/15] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2873;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nunH5KiVSLA9eNaj6eipx8y2OBwu+tjBhQLeBJL1rQM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrXGC6Gq0nJRiXqaR76dk7/R12B6PvbWm35x
 aNzc3XzxtKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61wAKCRARpy6gFHHX
 cvhtEADdNx7DArN5koidQnVfF+xi0aUHcfFGOuW8vpax22Hyr2Scf/VG3fJlaP4c5NFyv03lfv2
 m5QXrrhpqBJRNJre3AS3sTt+5DFtU2x3XQe4g0YTzwVUXtZaMXzozSdl7dUdVAaS3d5bkfVQSoN
 bZqJ8Xn6GewglMBvisZh/eR7hVh7fsiDLRSGwzB0txJXy915USWDYvKaZAzaJrUNqH2DJPDkIdt
 hJvpe1DRASLLubOKWqhS6RZYdoLI1vMKaOeXRLJ+uJHwgaGX7acED/nxlYxNTFvJh1rEv+cvg96
 D09YaOGaUsK3oJcDeWsShWamJbDXg76mz6PFaFOU9pXnO0gGch+wg+Ni4hrDfSOyPHmUTYxSJ5o
 rozzU6iNpaTtSsIbtXjcLDebrclN7xi088hZzvuiBccesTXa1rV37gq6lyqvvTWtHmk3qroaTio
 GTxkp49IaL5d++Z5Cid2pYg6PSQqidLMXqc3eMw/M/lw0tU6769CLGAOIPfmZw8pIQ1aVBEjPiW
 Wh30mUS3iHzRTUZ95x6mwyTgZDpBUKbP3wvI7XwSj2P28ThwZkNHX3iwas386F1Be10JolQ3pZw
 LWKA8cisHe32kL2K0hNad7VOpO51ebJNo5q6uC+jebFgDQrWSmRdS1nalBHRZbyorG+GSy2cb8G
 M4bBijT2vNehGvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a dedicated initializer macro for defining pin functions for
mediatek drivers so use it here.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c | 42 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 68b4097792b88356babe4368db7d0f60194e7309..55c8674d8d66f12d2f2246c215056d4e51296a9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1465,32 +1465,22 @@ static const char * const mt7988_usb_groups[] = {
 };
 
 static const struct function_desc mt7988_functions[] = {
-	{ { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
-	  NULL },
-	{ { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
-	  NULL },
-	{ { "int_usxgmii", mt7988_int_usxgmii_groups,
-	    ARRAY_SIZE(mt7988_int_usxgmii_groups) },
-	  NULL },
-	{ { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) }, NULL },
-	{ { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) }, NULL },
-	{ { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) }, NULL },
-	{ { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
-	  NULL },
-	{ { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
-	  NULL },
-	{ { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
-	  NULL },
-	{ { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
-	  NULL },
-	{ { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) }, NULL },
-	{ { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
-	  NULL },
-	{ { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
-	  NULL },
-	{ { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) }, NULL },
-	{ { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) }, NULL },
-	{ { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) }, NULL },
+	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
+	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
+	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
+	PINCTRL_PIN_FUNCTION("pwm", mt7988_pwm),
+	PINCTRL_PIN_FUNCTION("dfd", mt7988_dfd),
+	PINCTRL_PIN_FUNCTION("i2c", mt7988_i2c),
+	PINCTRL_PIN_FUNCTION("eth", mt7988_ethernet),
+	PINCTRL_PIN_FUNCTION("pcie", mt7988_pcie),
+	PINCTRL_PIN_FUNCTION("pmic", mt7988_pmic),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7988_wdt),
+	PINCTRL_PIN_FUNCTION("spi", mt7988_spi),
+	PINCTRL_PIN_FUNCTION("flash", mt7988_flash),
+	PINCTRL_PIN_FUNCTION("uart", mt7988_uart),
+	PINCTRL_PIN_FUNCTION("udi", mt7988_udi),
+	PINCTRL_PIN_FUNCTION("usb", mt7988_usb),
+	PINCTRL_PIN_FUNCTION("led", mt7988_led),
 };
 
 static const struct mtk_eint_hw mt7988_eint_hw = {

-- 
2.48.1

