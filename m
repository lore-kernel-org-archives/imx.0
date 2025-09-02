Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79907313E23
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814381; cv=none; b=SueFDvAcumiIs78IcybrJjNlE51WZEPsiq/aOKUoPGa8uLgmixJJrRiyuNB37HCeXjM78BECfVGyhTJaBM7Zjwfez4dHs26sF+y3kMfwSXSLv6JOr6TiiFnM3NpTTbCjaUyKNnqxmyPV5Hw204SZPgIdYf16o38aNTrC8Nw8WTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814381; c=relaxed/simple;
	bh=/WoBx7YcDnY5wm6zfflRNeXj5FexRbP7TbXPY2dLB8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKLfqHOjPstALtkha8vdMC4ANjZPyJdFc6buLmD0CRcFe/973+zV793C0aDId03ODH8EfJ5T9s06BVEtx4gN8aVdT/mJSTOioX1jjMAA9+w9OT1zi6S2AMHkXSz92e91CmpiRNF7+/90v0xU5aYuoTSB4J9VXZSz2KmzsRcYy9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OVqXFtBg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OVqXFtBg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b869d3560so25871655e9.1
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 04:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814374; x=1757419174; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2G59MubZTeiU7liQ7BG00dmfAPEuJzh2uMSB42Di6Tc=;
        b=OVqXFtBgu0LdGCUkEQ1bDXpx8VmpQaSNZP0I+b7xjenx85eR/7aF5tDu/TYTjDZe+1
         LIiAHGJAWglxKs27cjSmHRYlHEw6klLLzLaXPx9iMC0sxOm8WH7VAV6aMEq/WKkfMrwM
         13H1icZpUlqozrb9CYSLs5dqvJFbaU9Bxrunb/ASgDb9xkJ2MYovs+LXIJxsJKqCV8ax
         DrgLaIR3WeoXABdrAqvspIDaTVg/ok+bKoL5XNjXc0L7czVkM5PBFbZbIlqhRoeXNmYQ
         z8VsJ13NFZzAeTf/sevVyYdNfT6CgP8UJlvis9+/2TY8UvA4v8OTduvTflCtDMHgwuB8
         kKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814374; x=1757419174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G59MubZTeiU7liQ7BG00dmfAPEuJzh2uMSB42Di6Tc=;
        b=vZ3DsF0nds8YjPPtFcg+dwKo5UWu3zUMSvFPQu5rcEyyKH8QBeD2OQY+u3WAc1x4NA
         arW2ewn+HbXE8FVNqr/Dmq/KmOVJxrsWd/qupniTpmXpKBCY/9xsdjw34b+V+b1SDcdF
         uxoIvVXF6VuFEDZkH9n6tvTcw0ty5JQFItRAlNXsGYWYonoootQ+BA4fffM1rQVrUThq
         31uWjvRYXroMxCiJtKiF8epnfRYf8Ew0htB0jjG9TUoyPw3ES2qfvwy6o20qReDnQGCz
         ZnTzjOePqjtkysyNrtBOdNX9LApSrXoLAVhM0YpZExwVq5Upy1zdCLdHOeH5jd7C68mh
         gMdg==
X-Forwarded-Encrypted: i=1; AJvYcCWe9Oi9oKg/BZjOsWP2T7Ji/0JDUwvuBB6XSV1+V9gNxUjd9feurIWxJV6dSGE78shwWQU=@lists.linux.dev
X-Gm-Message-State: AOJu0YypsO7T9fiqoaO4cznawzU93uoawkkauzUbpLqZhmfn6gVq7Hw6
	HPXa6Rfnd9UD8rtM2lKJNqp6yvsNVq9+sF60CVMXjjam7vgtVwO5JBNuhgojjIuiKeI=
X-Gm-Gg: ASbGncs8ZAI/gDMCbiXwJLStkWvHF4hbyjQQ+Vi7gmF/zPO2YyNL5oNxF8hr34y21Dr
	gecVTIGtThkG1aJi7omQdPozBhYdZ9xCG3m6NPmew3DzDsvuyQvgJGmzHDjAvDloudo9fbqPpGY
	PhN3HktTARpYXzJNrUQE3rqHxvKMvzqkovl+jmrJyzeYwMY9+dkTssoEmct6Dk+gA6L4N+heVw7
	WY6Eg5BZXKo3pfU1XkSn+0WuKgsNxVDt1k3Ze7r2yXMDETVmBikrEnGESH+DtwxLL67/TjN2GZB
	WhgNFtyxKJ6FyKUSOURe2OF2ZMGcvRDQf2yCj2RiQHbk3CBEcXfgHinfFloU0K+2XcrcpaWlmxT
	2HDltnehNIT9p+QQD
X-Google-Smtp-Source: AGHT+IFLYpm7MHCoBbrYA9yPFwTU4Oi261s/PzucYOvn9j2GG1ZzAR8wL2RYvG0trkoc4GH+jx5MDg==
X-Received: by 2002:a05:600c:1d07:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45b8553417fmr112095205e9.16.1756814374299;
        Tue, 02 Sep 2025 04:59:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:18 +0200
Subject: [PATCH v7 09/16] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-9-bb091daedc52@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ow80ySNnxG4YPhFZmsqjHWDVkfwZ7d2knu+v5a2fm7Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwTalJ9xEimLer/4deaUbuj2xh0hSCbfKp6h
 mSFLsj8wZaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEwAKCRARpy6gFHHX
 chHMD/9qieRrB7kLN2tVVNwNzCXwCyEqCxacgLrSqioX/qG8i5nUPX7EHz277hj9w0PidEZ1ntG
 zmHYDlqsFEPXAuTkXZgG9SopO1HVkY71LVr0hPzCGA3VBpWobmAQSKm/9IMrJPw7ZA2XtQhX32p
 kda1warDySg74DriEQwkfYimyMZ3TQ7pHNBxj/YXFrUqHE2bOWZH7roy8l5AF5dB9oc6S8PQ+Zx
 iS/JncN6wC6U5Ah+lX+mMsuTa6M5HJoJ+Rn00ffY3hUzSpJvZncDxwqdY5oYbRIUnhm31mZ3u+b
 rK9QwspUrOmf2xLBv8KmvqFUo1tNgbKyH8bEe2ODS40J1m4xfAyT81CicpoTkW4hTRN/LoWDmRH
 RUnueU/QhNGG0LtvDy3EesY1kCD0PHgPfvs0eknqOYCNnbgVchgt+WJFs8yWWN/Uh9jHUfgspnL
 GXaBzcEcN+KMnMuO1WjghdXpJcpBfPZK53ftw/blY6FQc3I9OrH6wBgTL7SWFN6WKIrNt6xs3u9
 a62AdwWvXg2t1O7dAJlzT2n25b2Gw+nGqFBM6MI0xKBrxIiV0fCxwFjWnVp0y7jsPy+6f43Jma3
 oTrvmRfRyonsRPxFZ6I3JXqC+NUq2IfQ7hgKvO6WZzeEHpqX0fiqO1ASQcW9zStc6L0O7YQzAEi
 yx6zfFbIqCxZOpQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. We're working towards reducing the usage
of struct function_desc in pinctrl drivers - they should only be created
by pinmux core and accessed by drivers using
pinmux_generic_get_function(). This driver uses the data pointer so in
order to stop using struct function_desc, we need to provide an
alternative that also wraps the mux mode which is passed to pinctrl core
as user data.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 6aefcbc31309995ec1e235416b40aab3e4a073a9..e78c8b3ec245aad56e3e74a26d27c41ba4a98281 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -135,6 +135,11 @@ struct keembay_pin_soc {
 	const struct pinctrl_pin_desc *pins;
 };
 
+struct keembay_pinfunction {
+	struct pinfunction func;
+	u8 mux_mode;
+};
+
 static const struct pinctrl_pin_desc keembay_pins[] = {
 	KEEMBAY_PIN_DESC(0, "GPIO0",
 			 KEEMBAY_MUX(0x0, "I2S0_M0"),
@@ -1556,13 +1561,13 @@ static int keembay_pinctrl_reg(struct keembay_pinctrl *kpc,  struct device *dev)
 }
 
 static int keembay_add_functions(struct keembay_pinctrl *kpc,
-				 struct function_desc *functions)
+				 struct keembay_pinfunction *functions)
 {
 	unsigned int i;
 
 	/* Assign the groups for each function */
 	for (i = 0; i < kpc->nfuncs; i++) {
-		struct function_desc *func = &functions[i];
+		struct keembay_pinfunction *func = &functions[i];
 		const char **group_names;
 		unsigned int grp_idx = 0;
 		int j;
@@ -1588,14 +1593,14 @@ static int keembay_add_functions(struct keembay_pinctrl *kpc,
 	/* Add all functions */
 	for (i = 0; i < kpc->nfuncs; i++)
 		pinmux_generic_add_pinfunction(kpc->pctrl, &functions[i].func,
-					       functions[i].data);
+					       &functions[i].mux_mode);
 
 	return 0;
 }
 
 static int keembay_build_functions(struct keembay_pinctrl *kpc)
 {
-	struct function_desc *keembay_funcs, *new_funcs;
+	struct keembay_pinfunction *keembay_funcs, *new_funcs;
 	int i;
 
 	/*
@@ -1614,7 +1619,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 		struct keembay_mux_desc *mux;
 
 		for (mux = pdesc->drv_data; mux->name; mux++) {
-			struct function_desc *fdesc;
+			struct keembay_pinfunction *fdesc;
 
 			/* Check if we already have function for this mux */
 			for (fdesc = keembay_funcs; fdesc->func.name; fdesc++) {
@@ -1628,7 +1633,7 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 			if (!fdesc->func.name) {
 				fdesc->func.name = mux->name;
 				fdesc->func.ngroups = 1;
-				fdesc->data = &mux->mode;
+				fdesc->mux_mode = mux->mode;
 				kpc->nfuncs++;
 			}
 		}

-- 
2.48.1

