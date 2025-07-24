Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD859285417
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349095; cv=none; b=DMYPHMUoztJfhbaNKDn7rV8yD6wcPp8+V2UYht3nR1VyqkOj3T8qqOmpXibqLNHTrAMl0fcbO+/T3Kgo9aDLYgZKS00v/Hx9tTbqH8JlIaR70fYYpr1Js+y2ABdIci1xv0oPW06LtF3sE2cbrYtIEFVnRFOYcY4iDdTMQ+nevqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349095; c=relaxed/simple;
	bh=ZO1T9QN1h+Wgwad+qSu78n1uErb90oMrPBIjzdSmsuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQf0rItxK42yM1V3Rs+bL6abp234zhhS3wKGa3qSTiVlYUgobZPCciLSJc9pbr34pk5P5F3pEvYxPbPG735kH6xMPTfn4MuT9lCBRusQ2Ricjrln9vS7ocKO1kYagiJvtNprucYeoXB7S93A4/HwVObI0tcaKObgyLAAAqQqiIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b+f4R6ok; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b+f4R6ok"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so8597285e9.1
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 02:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349091; x=1753953891; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MsMdfp1xLANBZ9zZyNzSawqjnpLS694AVKVdRY29N0=;
        b=b+f4R6ok7Dy4PKeG5+FL0fCGAqpX4C3/orp4AsFd7KCZwX8g0i7nz2cxRieI7CR1jC
         t27PyXxHfjt7YO6dfgvKwFYL0QWM/q0hKpY9wUK1/cOzP/N25yu1F9naPiOds0AiHSOJ
         JogUIvPYSbrLEVqyGLDMG1Sl1KHRVtKK/JsByBZKvVLsvjRfJjLNmDw3McysXafwydvz
         FXLY4tb7UGjLbvLFpm3bEsVViPaPQTce0DP02vkXvsSvf6pX53BNWm4rQNCsNRs+wuqe
         aY2wXL4OJAEIH7LG03c8Ja9ntIIkYsUq+UJ7heKe9tWeLqGQ+52hKJe1rxtVOhCtO04f
         Q3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349091; x=1753953891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MsMdfp1xLANBZ9zZyNzSawqjnpLS694AVKVdRY29N0=;
        b=Vh8sTDUTmJ3e4nji2sSzHlg06rCaXT8Sp4eOYIioi3JDmju/CVQKbaCrerBzpMc1EN
         iGl1x56u3ZhLqHEpkcafBEliAy1w6VntOfEcJO8W/IZMCAAhvgEvD9uJtdill6ldVPTx
         Gc28NqDjoClHBhyavNOARISzlHek0gwMXp3BeXxT676PKB6yEV4RhuliEb/Lg2PAsDoH
         nvegIrD7JgYgcNw7jVolfI6srrliBpnGlobe2sHM5QkI9F0bKj+KkRFzld1ubNALbdeF
         MioE97voLP8QhXXY4OOzxjW6sMNJ9OBfWSKst+T3vcdAGY6p0E2O7x7iEq1y27DUzeyV
         Yq+A==
X-Forwarded-Encrypted: i=1; AJvYcCUnc7Kq5P6wTn091Np5KiEVii00mf95ZnWBdUZUEMEeP3FRfQEyUqCSHHxWV0lCpXCVoHc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKIvT4iphF6eLRMTUjZOqaG7XUm5TZ2nRVKlnnbBp8YhgPsxcJ
	NHvvA9RyVU6FHTWo00ej//ikXquYzO6aGifVYuFw+zTAgyqG+UrfXX72tTTi6tNkIb8=
X-Gm-Gg: ASbGncsm3UYlnb88ylpGIBGXWjx5bOJUhieE9LT9IX++Vk1OuOqnnU8swb5KWNzU2A0
	iLCb1vYcMgdbrMU8SPqi55jsZwWEDcQ3ScoGZ8MJtCiRMJXFx1ygxJCFsDiNSG4IGlK6keSX3c/
	GjOi9pKMDX9dkS+t97BcaOVJtUt0OOWIm4AhaT1rJZHbUk4gXxBmU8UOa41scxO9EcuFG551o6P
	o0KdsLxaPXo2fxKPeY6GU9dQHhkkaIA2vhvJi6SzluaZ71dsU/HV5zKehxBa7kRtURahzu9ikpD
	ckyubZvMM1dzJnnJv6PfvVMyALmf8P9meXQYiDhsekGRMmZRSZ+HC4jIqDs4PncAgJjZEMwaS1g
	sHj+Xa/D9eDzs45jW
X-Google-Smtp-Source: AGHT+IHqZ4KWF33bsWYC2NW13yLlFkOEfEwZMRqVsz0fuagNkHT/q0mO1E6+Gg7Jfa3lxSFmodfKew==
X-Received: by 2002:a05:600c:35ca:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-45868d4f48bmr61519195e9.30.1753349090293;
        Thu, 24 Jul 2025 02:24:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:35 +0200
Subject: [PATCH v3 07/15] pinctrl: keembay: release allocated memory in
 detach path
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-7-af4db9302de4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1780;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LKTpseRfAo7ye04iddOGWjUFjvvauRYDbdYlMpOMyLY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvSbjubxQ38F8ud5iCpNZ72Jm7IAoCj4lWgs
 6LniCl93ieJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70gAKCRARpy6gFHHX
 ch2CEADZjtdeLp35/fl14l9PQNJfmIbBfcUfYvyfA8t1LHfkmxLnRbErjq5eCVle+l5pe5R1BIn
 +X7gAAsSmm4v45lpL1ifrTXzAR7JcqsNbP0LtwqYSS4T7QPIPf7CtoZVhbHNjtKwLxhGF3P2JUT
 AdjounHFm3XKuKN29lK8QJ+FG0/OLUKPNc9HitRMm3XzO2nU8ilJ70+JnwJQZflutclz3OSvBxw
 WqkTLsIrsAiQB2n5Qpl5NDbIKMakIsw2cCfwyDfVPgUM9DTEbj8g9OjCakwq20up2vaVR2NwSvC
 ZUtq3k8Y6wWhqFR27KGwVPwfv8HIaqFEGGne/Tgpdz9o2yYU43x2jurLX0I7211S+r4oMERgXum
 fFMpJLG5QrteGGsb5MWK59iQtPyEgVfHlIaQ3KQbLi/DdqbqrMSorxafyVr+zb0dThp5gxoicfu
 h117nhV3u3ekRyFApUHBpQfA+qfmNBltfqn+M40vyVVFXVOa2tESEAtfwLmSloO/dbveOYt8RLI
 Bj1dwxB84ZzCL2A3uU8R8UZwWHLaGeHi7RG+LKGo5qu/P+loVUEwBcx+DPiWi1wI2VU1bscLdUr
 2Q5DBSjVjYTXTfG4AJcen4wRUeC4rTi2BsDO70f2fHyhfmt1IEfYz/A322grH6bledRd46/o8vI
 JGEI+5r6wD3CF8Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unlike all the other allocations in this driver, the memory for storing
the pin function descriptions allocated with kcalloc() and later resized
with krealloc() is never freed. Use devres like elsewhere to handle
that.

Note: the logic in this module is pretty convoluted and could probably
use some revisiting, we should probably be able to calculate the exact
amount of memory needed in advance or even skip the allocation
alltogether and just add each function to the radix tree separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 30e641571cfe5396075cb28febd2d0776326365d..b4c7b3ef79e0a34111f46f23adfee4c269e5be6e 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1603,7 +1603,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	 * being part of 8 (hw maximum) globally unique muxes.
 	 */
 	kpc->nfuncs = 0;
-	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
+	keembay_funcs = devm_kcalloc(kpc->dev, kpc->npins * 8,
+				     sizeof(*keembay_funcs), GFP_KERNEL);
 	if (!keembay_funcs)
 		return -ENOMEM;
 
@@ -1634,7 +1635,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	}
 
 	/* Reallocate memory based on actual number of functions */
-	new_funcs = krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
+	new_funcs = devm_krealloc(kpc->dev, keembay_funcs,
+				  kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
 	if (!new_funcs) {
 		kfree(keembay_funcs);
 		return -ENOMEM;

-- 
2.48.1

