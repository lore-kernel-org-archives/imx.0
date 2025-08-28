Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C4D274B46
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396841; cv=none; b=iOyaxfrWDRhRf7xoRN4VPeurFn1ZYiSWqdMqUE3p16J7iMtfxsuR2opKeLG5sGwQwIrZclvBZBgjMmkEnEhxc8GJUPKLJQvWTVWimvILRMlcv7MLTn/uGEtYyIG7whUfGrrnfINww43PyIra5h/Z5z3Wf1jNmb23jm49mISXZLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396841; c=relaxed/simple;
	bh=j1C32DmuGSrX82XablstDJcCxUm5RkKJeA9XS/CQyM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dt90/Wrz8Aooje91nx6wRLvVtq9IwniGiPlIMi8610mrksgV1wgw35hCb//Pla18drxeGLUsbAMQSTE2wA1Sn4AE+T4OvVcuk76rpyLpkOtexmGD4dVhjSuLYihV4FrFLK/SRXdUQlBrZuKIB/VO5n2fwr9dNK/TXlEVXBa4dqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ixaUied7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ixaUied7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso6447045e9.1
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396836; x=1757001636; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4V6wSNUy+49WdVnDeUhgFQb5Ab581+KZPYX/SdZG0hY=;
        b=ixaUied7EWPsk96CnkxMazoj1EmCzStKT9ZFjbvghxnUKkimchVIYWfmk/ayaoSUo9
         Fy1ZNlMTwqId2f0X03FWgwrhO4KA7FG4sj4uCi7NDwgSf0TypMRePJUr5Q450BrkyGLL
         nm4RVQE3hfy8O28jNbJH6msTDcEmCCKaw6Kt3CQpdHjO585/UJYiud5molMiOIKwl/nK
         uOdE6TsPc95H5G7jhuk3h+gmVxkgKh11b94HQ2NgPG+BnWSUPphGCGTcYA8sZjpBF72U
         qnQho9cQ0qA3P2MVn26dRSMeUFOemw1cqUWD/tucE8U+5XqzkCfWOXdihc/fJVa1AxhE
         rIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396836; x=1757001636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V6wSNUy+49WdVnDeUhgFQb5Ab581+KZPYX/SdZG0hY=;
        b=WLxxf8aNRn+/8sMSs0HvEJMtcv90Ly9vW4Y4wa4mVmnDze81cEIh8cX8NaRju/jXgG
         wL+RJnlzhoOWnqYPhZx8rU8eYqADruTVQHAQQPFlREfawdjiGWswm0Cwk4lQ0WG7IMRW
         O+GupHqh77HIglIaIrqP1tajtEqoJl49xKKEsJw2h3hXyOZu50WFHEDf2kECTIki9Zxp
         f+zhDIPhx6QpD3VYy3hpcouE270qZVbgWgKN0QaYRWuPaVLqmg63AnWNh9X2cBQvspU8
         A8IZ8rp3ntmTAJMOmumNcJfS70J3XXQ3wx1V4YBQBwgyiwJBoHTWNdmUcatVIx0NW0px
         yRbw==
X-Forwarded-Encrypted: i=1; AJvYcCWqNYfkN73Z1DsAkND4zuctV8t+46XWMabbtbXa3HEWZ0No9+9Chc46p0adjRaifFU1fnQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqXqeB5f2jtGhXOW63ozZlLmJajBLHryeChUsBt7qU+ycMAW8k
	UAv7Y+oDMMmFaL/Q2PXw7tc1zFvn7+ecdlQVAoDYo3SOUlQMFQJrFYuhUCLIQite3tA=
X-Gm-Gg: ASbGncvfEl9bbt7i6qLrebRarySw1QeNG2H0wtgGlnF6Ojt4kMIQSh1NgXHmxQ0qFUq
	VKNXxk930ibYOz4o3ze/8cICpe4Rawg2gfSDUcavfsCsbOBz7kYbinEQf0S0ZIMy0LPlsk+Dpac
	2buj5j8DpWlv787IMW9oLXbg7i2y+j/c8s70rn3M4O/bcJmIkwoVsOcO+GNFBiyUx2sRhGZDHb3
	6lLLWM+VKvnoauwHscRzBE1uO7bxq0R4WWcSGkZamt+xnYFrCJID4itr++zAYsR/wW/iniGMyo3
	5OcEKplTCM3+QsZW1RBcz0XwlGzSCPj+fJeTZ7Zg2oOCJiSh1qlXtgcnwcGcHjZl8o/G+RAk1uc
	7A134frBfUP3nLiGB9EoCBmxVh+6l
X-Google-Smtp-Source: AGHT+IHZut1Ju+wLWOCu27g3oxlfbHJTRITLE2zpN7kI0OEVcWhxgfQH7OJfj9RiKp9cCo2WNd5OvQ==
X-Received: by 2002:a05:600c:4451:b0:45b:43cc:e558 with SMTP id 5b1f17b1804b1-45b517cba3bmr203142095e9.35.1756396835751;
        Thu, 28 Aug 2025 09:00:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:18 +0200
Subject: [PATCH v6 10/15] pinctrl: make struct pinfunction a pointer in
 struct function_desc
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-10-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5244;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=igWDVQ1i3GNsSU9QCM7MdJ/ZXZhmiW6JQ7gs50oMzMA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0OShRzzi/YdGvFptLEfy7s0tzHayMhd9IJr
 CgF9D6e71aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DgAKCRARpy6gFHHX
 cmVED/9Q9pYZVO4h155fVXACsckZla46oeZ3SlqT+JLQkCr+sa3X74JqYGKATTim7Rw/256QGDE
 UsdtaqVKnvRWtNWRyAJOeDAiiQPlbb41DBHtaTf0thIPguu1czlk5YkMZsmyVrIfJoNl8sNKGum
 ptdDmj/ALJIL4u0sfh+jBCnArShidwSMfTM/CPNJVYDWNaIA0Dlbs6HCiBiFRH5KnR3JEDkPJji
 AwABByFBhrCDmOzAtgqm6bEM6pv+huWJR4v6dtuJCu+mALZYiXGzSBy2evcJooioUE1gjc469ab
 pj6GkhP1syujJ9WallzCnoFeasP30aEFKqpZLTv9saXaiecZ/IZd2DAzONow948O8he4tnFdBvx
 ze/phxq3+CZC9IusFa/Cj3dY/GwwVIa8UCraq5poM+av8PzrrdG/Tib4Akj8LEmYo07FtAzbi93
 uCxAfgccQ3wGTH6uedp1QjlKh/01q2kDQ6OrMt5aUKhEnSZKHfXjPJpm+ugFW3JA6HuRGt1QEVn
 o6s7TXD23ucx79L5J9DaEA+RhegqRSr242wmdbQPPZLxiMDbbur2keLH9zjrKxt/hS9k+6x888d
 9nCqr6XPvnaEOssyKEX+Fk5PXIjFLtWcYfD8hEPiozd2D25jPIdZh/mybWD9lAuNZtITpXYeZ5S
 DdHAOotTsdOPNzg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently duplicate the entire struct pinfunction object in
pinmux_generic_add_pinfunction(). While this is inevitable when the
arguments come in split through pinmux_generic_add_function(), users of
pinmux_generic_add_pinfunction() will typically pass addresses of
structures in .rodata, meaning we can try to avoid the duplication with
the help from kmemdup_const(). To that end: don't wrap the entire struct
pinfunction in struct function_desc but rather just store the address.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c |  2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c         |  2 +-
 drivers/pinctrl/pinmux.c                  | 18 ++++++++++++++----
 drivers/pinctrl/pinmux.h                  |  2 +-
 6 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 56bfbf4c3575355bdda59cf7471bbf5b9babff4a..ad3bb8475c0c29e15dfc7a8e4afdeadf5ec8aaed 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -266,7 +266,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	npins = grp->grp.npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < npins; i++) {
 		/*
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 2eed83f9f209cad79580082c274d4056231bd421..8fb3b65a1b775cf078d3c926af59480e9e09ab30 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2456,7 +2456,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 
 	dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
-		desc->func.name, grp->grp.name);
+		desc->func->name, grp->grp.name);
 
 	func = desc->data;
 	for (i = 0; i < func->group_size; i++) {
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 17a08c73423fd089066e4894d2307c852bbbb661..11dc525eb3a2dc8ceabf2278ee1a2abaa425eec1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -56,7 +56,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < grp->grp.npins; i++) {
 		const struct mtk_pin_desc *desc;
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index e13ef07850386e70cffc83011589ceaf70a70a41..e5b24fab12e11e443df25ffeb7b70d7c1a03c6bc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4015,7 +4015,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 62bd4aa53b2b22cb09eacfb05398205f2fe391b9..6f5e3ede972bbfa78e279790df359632e2d63485 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -810,7 +810,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 	if (!function)
 		return NULL;
 
-	return function->func.name;
+	return function->func->name;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 
@@ -835,8 +835,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 			__func__, selector);
 		return -EINVAL;
 	}
-	*groups = function->func.groups;
-	*ngroups = function->func.ngroups;
+	*groups = function->func->groups;
+	*ngroups = function->func->ngroups;
 
 	return 0;
 }
@@ -903,7 +903,17 @@ int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->func = *func;
+	/*
+	 * FIXME: It's generally a bad idea to use devres in subsystem core
+	 * code - managed interfaces are aimed at drivers - but pinctrl already
+	 * uses it all over the place so it's a larger piece of technical debt
+	 * to fix.
+	 */
+	function->func = devm_kmemdup_const(pctldev->dev, func,
+					    sizeof(*func), GFP_KERNEL);
+	if (!function->func)
+		return -ENOMEM;
+
 	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 549ab10f7afbda32fadf4ad151401180bed2064f..653684290666d78fd725febb5f8bc987b66a1afb 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -137,7 +137,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
  * @data: pin controller driver specific data
  */
 struct function_desc {
-	struct pinfunction func;
+	const struct pinfunction *func;
 	void *data;
 };
 

-- 
2.48.1

