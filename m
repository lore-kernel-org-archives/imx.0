Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CBE259C92
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349086; cv=none; b=f6li8htvj5QrsCJJkc2XxgOesC27uIQGz1MHa2p+Az2ZLgmStPSKdsAWOopLJVP6QSArlHD9x3AkbmKytSqt+60CSpXtfccKcg+TmP9x2a78Vfy2oaRJ0WnC+OqLvumFvrvOqn68q8Fqq43elNFt+DkRZ2yf+5xVSjR1edpC/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349086; c=relaxed/simple;
	bh=UVS9SpzWVwmGyJE+4Dquy2g9DqJn4S6AIXELDh0rj9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ws7nUYXfOHDryVN21gYEXSbDamhMJBk/yquyun4V2E7ZxeAyFh15u5Ip7dNHkqGm9emvGOwOoGHo+KOtKQfjgLHeCp6Msz19E5l1Hp1umZpiRgQXRpl2k6ZK0ORkpuR2iuDlJCSry4Bi/vp3yD6B4W6CfRJa5l/pBYM3Lvym3T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z3hiSdjy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z3hiSdjy"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so588787f8f.2
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349080; x=1753953880; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enHFJE6UQ4MedDyqBD+KXxRCiT2/woFdp52jlXH8+kI=;
        b=z3hiSdjyOApY8dVY8gtcNkuYoe1RhgAg91W3MOkoPi6+xXyPIUmSJbucEItRVbneom
         4sGEKC3Tadve8rln8THJmVYGsPGAKeyyY5eq/MONjEzTM89FLKdQNw/3D2/NGEexHpBL
         XTYTe8j0jOOWJqXHvb4tS8bOAC0KLOW9LdvGgTRC+30wE5mT5QS+ARPi2KONXldlXe5i
         rXjcwEVGsYHnDZn70SHU6uKQfF52UkQlaSKqwabYUC0yywvBVweyfPaTtDSy17T5wuIt
         VQraJrwnZnbcHw2ZliqhRxLqOexiCncAu52aT/QqoZOllTI+kRBjcJsMW7BnxebfDiNG
         iiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349080; x=1753953880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enHFJE6UQ4MedDyqBD+KXxRCiT2/woFdp52jlXH8+kI=;
        b=f+Qm2zmhpInARw50mGp4rg0ZZuFP79XXXC5LqWjAS/O5NpkSC29pWAKqnlmNhEgXpC
         tqAfn+Y/A/14Wb7t+fUaa2d7psmLL4Fj7k+RIVD82O2K935v7PUm56eTqmwZAfxXBAZu
         KJqW9LRwniTH139AY3PV6k1ctsw24Yvm/L11wZ4cFTYLD+yLE5CveZw3cL+EO7ufaIM6
         meup34dPuxTNLR7hoC919kO+eI3C0bozIEgOUqD7z4hdlmARhL78QgkYogIE8ICVlHcC
         T3PlyNssqrK5No5SWiSZjCQu4tcyQYUHH8GXLnlQNx0I07Rv0aTiK+CJjNr5+1oq7R8f
         LKSw==
X-Forwarded-Encrypted: i=1; AJvYcCVhqUTYT27lS8VeBMpDwIsoKm7XMmRZjKJQJWyBvF/yVAhNCkMrVswHV4sMO67WkgcceRA=@lists.linux.dev
X-Gm-Message-State: AOJu0YybiN+9FeI0r6NGSzi3F8w1tijD93kxK6SwYdmf5sG/Yy3yhw5a
	dU/YLdj8UyXiMnyahBzLF9RQIfmGV9EKOEqD3HlEPL6FfdkjkyBuLztpQOrQg7ahIQk=
X-Gm-Gg: ASbGnctDBxOspOrUr2wNj65+GJRy7TEYXmPwy1W55pmWe8m5m2KeINKQ0AjCn2fddnP
	L+7T5J49HNMukClnO5jpcUJkqOrFTnNWPUdln8sQI5OhnLkd5YT99CrO4XrvtUnOS/VfQ8r962i
	DAUus1C78TWPfoysqKbd4jiG4bGdLo1Ab1wNNaZs22b/evWg+aCv5GaME0QFFO9aRu1SFVHFqHD
	spizKrsWLPZV7RVEBE4WXC9KZFnRxS7rzdWVwVBuO/h5KSiLEboOGIL0pf27HESaf+hwKW61J/e
	H8aqH9uWthW2gyThMwbLV4WIEVWxb0fHC40Pe2H15TFzAJMUyJ99LW5r1BCBDidH/zqdms2C6dE
	CyPad9vNQ4noIx0/N
X-Google-Smtp-Source: AGHT+IFLTaYRX3oZKktSwmTl5BxHaXO7YP006jDq4+wHGsPABKDqUOqQk5SOHVzh8IhrpobqFVAPGA==
X-Received: by 2002:a05:6000:248a:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3b768ef3913mr4552377f8f.32.1753349080240;
        Thu, 24 Jul 2025 02:24:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:29 +0200
Subject: [PATCH v3 01/15] lib: provide kmemdup_const()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4C1RHZTMKgGSo3gXRAvPeC6y45wc3aHImSFGh2Fz1QE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvRcDL9XPXeHv8dyMY2ypjsvbwhNFFTJNmoy
 2AX+ZslnGaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70QAKCRARpy6gFHHX
 ch0XD/9I+1OijkQL+cye+ZruBlaR1Ib2UfMF0QEOwEw0hfteX9fTl34LlB1334pIq4xxhDMyq4m
 FZH5qMf22U1fVmLVGDs7Py/y1aFeIly97+9z4U2zlOSQ6KH68lmB8I8pmA79F94Ls0nxwl9MXi9
 A2WDTXvSoAA2nloXBT8D/2nv/HDVzSpY55mNCZn0QeI+lQwBhC02oOwDN3xg+aXfkSCzERHNLUX
 6ccd3tZpTYjYcyaEzdS3Pr8xvrq/CKlcGx/7UWQO0XPKWcYr7NDzBhcuZ/Xnciwnmf+4bHDTfsj
 N+QXyPhCYpNecz+o9HYMzcZ49hkbaDDcHRzqJ1QAqMopPXRH2Y+uuN5IlTCvLCP0CxYJrSNK1Ir
 +t/tUQDIsNKH0oe60hktWfTdSPocCQ+A/e6joTSg7q7rwlh3PeajuYoz9tdr1v4bN3ZCgNI5NSy
 vb6WLdiiC8zV317SlA2fotQFgGqmCmNXHZ1MxIG8WdADW1csMF44skaq6TtMIu6B0JzqQVnJSCL
 4ZhGqhYsud6CNJbYGa9BIZ+m3Kq6EysSbLmBPCEpH0cgs5Pui2X2PUIf6BHelaLNyHV0ckYn+Vx
 XUDG95SjgAiMT6Kq5zHT8VPY91QJwnLtOaPEAM/z3cF8qGMdmWR5fJT0BUlU6e7t3nqhfPtV96G
 w8wHIy7JPNlWP+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a function similar to strdup_const() but for copying blocks of
memory that are likely to be placed in .rodata.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/string.h |  1 +
 mm/util.c              | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..1a86d61de91204563e4179938c4dfc77108e03aa 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -304,6 +304,7 @@ extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
 extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
 #define kmemdup(...)	alloc_hooks(kmemdup_noprof(__VA_ARGS__))
 
+extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp);
 extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
 extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
 extern void *kmemdup_array(const void *src, size_t count, size_t element_size, gfp_t gfp)
diff --git a/mm/util.c b/mm/util.c
index f814e6a59ab1d354b8cd04ebf3903626f6b23a6c..f4df9194b0c69c27ff06e6ba1d1137c559035470 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -142,6 +142,27 @@ void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp)
 }
 EXPORT_SYMBOL(kmemdup_noprof);
 
+/**
+ * kmemdup_const - conditionally duplicate a region of memory
+ *
+ * @src: memory region to duplicate
+ * @len: memory region length,
+ * @gfp: GFP mask to use
+ *
+ * Return: source address if it is in .rodata or the return value of kmemdup()
+ * to which the function falls back otherwise.
+ *
+ * Note: the returned address must not be passed to kfree(), the caller must
+ * use kfree_const() instead.
+ */
+const void *kmemdup_const(const void *src, size_t len, gfp_t gfp)
+{
+	if (is_kernel_rodata((unsigned long)src))
+		return src;
+
+	return kmemdup(src, len, gfp);
+}
+
 /**
  * kmemdup_array - duplicate a given array.
  *

-- 
2.48.1

