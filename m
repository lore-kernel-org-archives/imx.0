Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18DB2D3229
	for <imx@lists.linux.dev>; Fri, 15 Aug 2025 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248976; cv=none; b=nCWWiy6USk+eYeiB3BOGVty61dk2U2jjGhGlXYRPV35uDKWUPxb84/02T+zr+ilhfAPxbt5ar/RfOGVlbQyMvtnGjstkObCaFZV/G0WUjyX/mJsEc74JHzuhmkKMWdGPTRDMiSDVawtJLaxOY4heUgfK1mupwO98qNGCwjozvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248976; c=relaxed/simple;
	bh=HSTxkhC3WyBFM1G4jv4j8GQuTAWxbn2e8t0aXkOzg+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VDo1DN/M8c+5wW29LehTxrpDXrwRaWE66tpAaOCWlmHdYz41CMZpAz+6ZTfVSaXPWVF/TAtB9AKQYujo5V6EAj/ZttGZuR0jtED7qaLIMYVhGHr6Hp1DPxQqAwbuh3QaLQ4jE3anCcmXunZ5G7Aa8tOTEKWcC1Gwj/cU3uw/zEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NNxIyvEh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NNxIyvEh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b004954so12125955e9.0
        for <imx@lists.linux.dev>; Fri, 15 Aug 2025 02:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248970; x=1755853770; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=NNxIyvEh+VoPpo1rjv/9572BKYy7YMI9O7F2xzWjq3AAj8BiUNMLwkzQ/1s7pDWgop
         fTEiJVm14IOY31F8juwM8ib/HSg8zqts+nFTrJPjAwvtthASPErUD5u5NLlgGTAPewNi
         XfR9dNQ7Wd4KIjNW5uw2HCEo1+hJtut90HUFO7vSjCpuaBNQDdaXFL7LCNVuf9wzxyTS
         BosxRHBFTK/YMipm9Nd9DPJTrstV9PwbvUXgjdJ3Qw2xxwt92mr2EAhW4VRINeVOSxNx
         7GCKgLSL1iGfuyB31m86UVOM2bdXNYEgN68gVDj+045uyQ6nkFQGCukwtyN9lKitU5bo
         EElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248970; x=1755853770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg6yGo5rWgbm4nmbYQkhIExx2oT2rNxy+gO58coC/aU=;
        b=gGG9dmS0NR+4DHVwkEFPquHc7gKwYAxJuB9fFG+nedX7AeJT6izyYWs83CQeRx/6OG
         tfpgQXDB04RbDtWqAKSrb8yKnpyvbPlMwRjlKkVDajEiLIMVk5IO6ZfmnTdjpp6I11xh
         3sGH0L9lrEUt/lk+nXFH5oG4s+MfGWgvK9JgOPxTVbA2YaLefbTUsTt8WmUkgHxl183O
         nTFBwFpRnprnWL0Dzj9Hv/fFXWdfySxgPKeixdOUeqFtPFI76zCadF8sreUrkbyvQ2XL
         nIYbAOQmgj93glWvb4sitfPbTQvwsMQ+nf9vNyRWwmAvgmVFpVQ9nFaiNtkrJSYeAZ07
         eCog==
X-Forwarded-Encrypted: i=1; AJvYcCUG6DHcKkFTXolrhDHhogbUJsV14BX+wjUmFcmtGxjteMCO815D6Nzl0fLZdoDdRgo9dyA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJjJeTxiszxgPmWvpFkVAZbrsxNujDIHUXRws9AEJZLld/XDJa
	bQOswZ9ZqdS5r5o6pIRi77c3tJth2WRJHi6OZGqq1xK0NtVR4XK6NSNN9DwULB9wClM=
X-Gm-Gg: ASbGnctMB9Vin/Q4RkqrWuMv3U/XQPyr0UTRZBks5Pi/7VsRG8YLhDTRI5ke1poxZpN
	4wPuLDE3Y+iVzxTqgSJUMgNlppGucnNMbqOdWFM5PbRTAeD9SVS8+oBgc56iuTZRQA7EYpNOyK6
	pLpCMFBwbqmlsiT/PmOEdlRdHdNeG8RleiwzRNwiBPwUfEnjIQghRJmZCKHM9IJPPOHlKSete79
	75xfIYDBFVL7sbfDCYXaSR/Ai9SAHdcXSltfXapRRfOxwOwlxw/qsz0fEX/4SD2d8FGJqgRV8Di
	xHoW2AdR6XbQdnzhMbkIHstSBlQjvPi4f8l2UF6eA52jBjsHaT4iYtw5+JfhXiAEt43hSeI2m3B
	wI9QmXqgOsAywMRca8w==
X-Google-Smtp-Source: AGHT+IEuSRLd3B0h4SE3RR2S2yHycoqFTSLj7jDNuZgFZPq4txV7qE0+ov1t4k8bQpePbvf3meSvDg==
X-Received: by 2002:a05:600c:5286:b0:459:db80:c2ce with SMTP id 5b1f17b1804b1-45a21e7f2e8mr9560235e9.7.1755248969664;
        Fri, 15 Aug 2025 02:09:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:10 +0200
Subject: [PATCH v5 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-8-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HD9TOJpRmpG6enieox3SLEnzfmanpdaE65mOB6T5MYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk4AelBkHWJWZSjBIznNV8JlLBDYLHWXKinX
 +GiHJ5uogmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OAAKCRARpy6gFHHX
 codHEACM4UcW4XmQxoTdvJG0sbAVF+QyQHCaGbqkMyiyny6aH7RK2tq8Xl6yZSAoDRX9DIkdLsV
 cjvfs0JZcnSCGBsxTN0eEICrrspOHQJRa0Wz7f9MKd9Mfp7PkVGQBphWEZafv185lvBfoQYn10/
 KMtkOfMe5hOMHj/bH0r2Pc+DV6X5sEMdx/LSX4oRC8+cpTqF3s+mMLqSOrQN1alY6PnM/461gt2
 eI0f1lIQyiWLUH6ciwIJP9DWMIWGmXQP+TPp+em65RkBCAYoqFmoeyXOlz2RCO8St5K6+fuqAFp
 5nFyEPiGfSr/wntSpNNNoZNz0fVOdELEgqJ0275bDqBW5cek9dhFtaO6MFMvPn1FGP7wpac46ie
 ZX0acGHA+eBIISkExKYmPTBWlX4UNY3tLCaHgedPbnTVe/8blQMS+jtcmlT8N0vTDcLPocFUqVm
 m98XIN8qONHj6xwZHnc05CyexQgealE1ZYeYBYHkpC/2FWyUzIpZ0dnN2HiEpj8H2J0+PoZ1l8A
 ZguDBgwMeJJF1j0ZYFn4ZZKDu8zgJoZeGsNcp1BnOb0+ALnGFfMwsfTeOg4e6NiqXThqwizkUXp
 0ln7J9lak+xaWe5YElclyG7HeWIY7RLTvgOSJd+mhwsTItLmpI417ypQDquLMvaUrdEKVlQwWyM
 1H1INlqKY1Feo3g==
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

