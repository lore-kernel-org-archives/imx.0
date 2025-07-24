Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E75283FC3
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349094; cv=none; b=PcZWEQVAg1km9domBgHqhREcImVUR9xnOQfj9dWYAAsjkTE2iSQsU4DRhgPO1Iw8b89hYrUH4NJ+xwWeArxP/k3NO2gx0wE4T6vcA53Y9ssUMzYkoqS/dvs9PsL1jtQEZfYz+CK7v1WuoV0+0wFItS0uQi69APqwlwO3YzkZ2Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349094; c=relaxed/simple;
	bh=NN8N64azTZ6Tm9oD0O4UPA4GBXyAY9HuPJ1OulPwzrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=puBXBAoPnqhLSkKV9F/lSKJ7q1Wob8KE4IANrtOxLTRivzttWsCyR8ZJI8qdjhPSmHSmbJ4BWF0y9vQ4j959Q5O2XTrVNrxDTEIDKlxJFpIthw0c1r7050Oe14xJpmBKs0jvMD+P22pFYUGCXqKKPlGeYJHix0YrZ+czkmwYVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ao+5SFai; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ao+5SFai"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso474223f8f.1
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 02:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349089; x=1753953889; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=ao+5SFaizjzhklCRPlhB0xdPEnml+sEn1usb03zToRO0pzA5KAKV7+eOzgUZuUDBkj
         6h6T+5gCICTLOrbC1g21pdRKJm3GcKdFJ3tZMzWcvOnz6tZkIt2miIKagk31BFRqUhgb
         W2FSilybp0V1XDZ+55fkZ7T6g6I3yOwa2qZ9lEwMovAoJ4JHxSLfSOmSgM8qTXY92G4z
         jCtCAbUsu55PWDBYzDzAztYjLkvSGNWZrCot3275uAmHjtPmTHljfyJBsqSvMul1rRdO
         j/8FotDqpe5xDmdjkS67d7I4+YZq0HUZWJ1GXcqWqk6BWMOd0PqDwAnv4TIDLMD+4bnT
         Q9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349089; x=1753953889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=PbJcHxVaHunW+YZpfPWkVAqQgG8BOaoy0qpDjCmb34ayX/gMgP5Ly0j8q+UuNS4ARk
         Qh2FD2Jei6v2DeZQtzEehKZ6GaSfIL9I15D++Ca7s/LPR7HCTtqM1yfuC3heVhGkeAJL
         AnpvLSGpqJlJx4nTEKLivEy1Rx7SWFSis8i3//nsAY1tl0WeYHw07rvXKo+AtSSFKXP+
         qEXSO+x7P+C4oaI+c4hIbULoyf5NDlPbNL5qyXZV/r/DAeoqjaTYChWpJqTWZPeYgdBZ
         svn95wp3DM5WGoLOBReH4L05qTulYYThMrbtFWDAtJuUd0gW2cxawYvl1yWtX3vIOXEH
         /mqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdZpilKwcczITV8TExYPp1/JtoM9PI9PktpVXPnsDeo+ACLnbIQ2EW+1tOcLoO2pkaxpY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yycl8WsY5He/Ixs7CA389b2Pxo/d3Aop2KI1gD46qT5xyeHEX52
	S5IEtXsi+7H4jRV7QRla02S6yDLqHqJCZgpmvmbaBYsV3r4X16J37Wnk0kJhu3sXZXw=
X-Gm-Gg: ASbGncvwI5wkcLwOU4IL5FJqwzRnOf/trIzW+eQZpX2lvsW8GuR/Vkx36U8PEg/Cg8J
	BrSbsT8iugGtWQ/Q9uKkcWfdyeEginljD+Wmlgb+aiTbgrON/Qv7vLMXgbx6SM4/+FijwgCZnyu
	6H4SwHtFK7GivVg++jBZHsPyU2Dzx5BkSNSTvijnV2fVEQOYPezI+dfc7Igw/xSRcxktbkPLrIC
	hTEQhX4g0RZ7fgTxfG7vzGSmq4c7G/fcsqtM0AbKIgF5lP1wWvlhjqWhz5iCuk1eo45zSiwZ6HP
	VweAX80QTugwO72hHv7CcxCQGKP3pPf/7WoOIemZt+/2FKaANATiU9Nu3UebC4jVQJiAPbay9yj
	pyM5NMCNZ1Vuzwpr0
X-Google-Smtp-Source: AGHT+IGnhvfYcdLRXAtdaLRr5gD7VJr0sJOuUbMg0+qJlR1rhLS/+bKPH6E6yrPyHszr9XJ/HYT2Sw==
X-Received: by 2002:a05:6000:4305:b0:3b4:58ff:ed1 with SMTP id ffacd0b85a97d-3b768f1647dmr5410021f8f.52.1753349088691;
        Thu, 24 Jul 2025 02:24:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:34 +0200
Subject: [PATCH v3 06/15] pinctrl: imx: don't access the pin function radix
 tree directly
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-6-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuPiesxsrAA0Rn9DkOactcvX9/BHBoNthgyhyXGEhH0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvSXtvqkFaYJUjTRAJPRVMAk5wNil2YXVMOw
 MxVCTuRo8OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70gAKCRARpy6gFHHX
 cshfD/9SbpCGJDJ/Jk0sGpayxa0FhLlGvR6oERWTvgMhtUeHxUCFxBx6YMGv+BXEHcewihGh1jq
 BgX/VsRjvw6EKMEblPXX7xIezXGlJ1it6QRIJhD67eBZiCBfyPtBPG9wS5We7w//N3dzb7oZt23
 53GJbPsWFtg7q1VUNLX3nRrR9lnlbsEnSqSKbkHNbMJIoV9rji1HhGAgBmaT0ORciNHfcNGGFOM
 KVacjCtlplbn6eJG8vSzpRvU0cb7YHFFsvIt3ywpH+IOMdo3ZSw/Wzmf7YD7iS1WQr7Rsp7zxf1
 Bn6qiN7lKO4IVxgFPuQhiiUXjAt9OCjbJYlb8MVwCbTkLMFXcVVBQYHi/53LnDO9HvjWzsIdJ2z
 YumdZy8EhIhf3NCj7jIrdAyFYnm3sQqVn1h8YAvAXS1T2OS3QRcnjueogYTfGXBNCMutApRK/BB
 8kVNdJGs1FH2+2s1u2ZHJSTAdXTyuEtC0ZtlsPTZK8qnU4tIzC+eHoHw/59LtMzbTqMOdhc7kP6
 2mFiCpXau57p6nMR9D58vlXLXZ7hPCvcyk+otcV+5SypG0Z1wj6aCWzj9cpO8AnBNWF5hDbXS7E
 ygjMSNH5srKmYTV5/cOFe/eEPNtS6qromALeW2LQN/kc2GWO2J3B/x2YuLPBSsaK85Rbu8N5Cl2
 64ZSUQ7l7oryaNQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The radix tree containing pin function descriptors should not be
accessed directly by drivers. There are dedicated functions for it. I
suppose this driver does it so that the memory containing the function
description is not duplicated but we're going to address that shortly so
convert it to using generic pinctrl APIs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 38 +++++++++++----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 18de31328540458b7f7e8e2e539a39d61829deb9..d5d42c9ad5fe9dcf7c25ad393688e714b02db678 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,33 +580,34 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 				       u32 index)
 {
 	struct pinctrl_dev *pctl = ipctl->pctl;
-	struct function_desc *func;
+	struct pinfunction *func;
 	struct group_desc *grp;
 	const char **group_names;
+	int ret;
 	u32 i;
 
 	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
 
-	func = pinmux_generic_get_function(pctl, index);
+	func = devm_kzalloc(ipctl->dev, sizeof(*func), GFP_KERNEL);
 	if (!func)
-		return -EINVAL;
+		return -ENOMEM;
 
 	/* Initialise function */
-	func->func.name = np->name;
-	func->func.ngroups = of_get_child_count(np);
-	if (func->func.ngroups == 0) {
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups == 0) {
 		dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
 		return -EINVAL;
 	}
 
-	group_names = devm_kcalloc(ipctl->dev, func->func.ngroups,
-				   sizeof(*func->func.groups), GFP_KERNEL);
+	group_names = devm_kcalloc(ipctl->dev, func->ngroups,
+				   sizeof(*func->groups), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
 	for_each_child_of_node_scoped(np, child)
 		group_names[i++] = child->name;
-	func->func.groups = group_names;
+	func->groups = group_names;
 
 	i = 0;
 	for_each_child_of_node_scoped(np, child) {
@@ -614,10 +615,9 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		if (!grp)
 			return -ENOMEM;
 
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_group_tree,
-				  ipctl->group_index++, grp);
-		mutex_unlock(&ipctl->mutex);
+		ret = pinmux_generic_add_pinfunction(pctl, func, NULL);
+		if (ret < 0)
+			return ret;
 
 		imx_pinctrl_parse_groups(child, grp, ipctl, i++);
 	}
@@ -669,18 +669,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 		}
 	}
 
-	for (i = 0; i < nfuncs; i++) {
-		struct function_desc *function;
-
-		function = devm_kzalloc(&pdev->dev, sizeof(*function),
-					GFP_KERNEL);
-		if (!function)
-			return -ENOMEM;
-
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_function_tree, i, function);
-		mutex_unlock(&ipctl->mutex);
-	}
 	pctl->num_functions = nfuncs;
 
 	ipctl->group_index = 0;

-- 
2.48.1

