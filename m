Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB54926F288
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459511; cv=none; b=SZ416H9vJBXCo5hsI9RxNi49USu15cyEKuJJg/H3nSQ8XFt2/MUjNkSU5Pq1vsD0fPblWmLTJOHTH4w+lqdVss9vtWN+QqxNA5xPy7Bhq4edz+97KBoXCJO2bD7m8uKay7xEfjh87E9KQp4pcT9rs8UfdUpnL5G9HmK8Ew2GLLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459511; c=relaxed/simple;
	bh=jPCS3jau8LEmDTrYHNirj4CmDgyzg7ELGoC7TYTJC8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTMP6hWrhrpCOJQ5m63S2KYqoQTua8MNopNxLyAsFGoKPyf9jxJXfHzb+FXNKhO9EU6pTQj/ipUCViQ1WyQdMbKsLNIX626z/QS8mqa8E0BRjx0tN0im7FlgztJOBQnTmmY490AogrjNbO+tzqiJv22HftQr9h5nbfi1S4bz7lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hj+4yE87; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hj+4yE87"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso19456935e9.0
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459505; x=1790064305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71D314ftdlfb4St+4Xu8DWbrNAQlQ6pwzo/wolPd+lI=;
        b=hj+4yE87MGHBa9Ycw1TDSCzav1qFfoIxDik4nGfZf10Zvz5CjV5k93WHYpR4uLfmmL
         NoX/WVeonL7tPb8mEJzwhcPkwAnE0GuFsLaAs7T+K16nDU3m/vDLoj30at66KhKJt/dl
         Fdh2NOnas45TkqL9e5pMT/RqSV/CVuuh5R53v3oBAsPCZELjeaTZa21ZNvR6zIX088v2
         IBU1ihSa0OQSj4xBCwjuxphvdLhS8X1mQd1S5d3EVxvoh5u8KRNphqAWF/Xh0EURd9sV
         SsxmRK/2FA5kXsuf4TRs+4F4OxLwdRLMU72ZgwghC3xFz0P719hiBhHcJGUt5P+cLWAy
         3YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459505; x=1790064305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71D314ftdlfb4St+4Xu8DWbrNAQlQ6pwzo/wolPd+lI=;
        b=dOTpbfD+7unfvWCnNUzIxbvZIP0yDhobfAmEZyvdN9/bn51rQ/ILd+irctMEXyXaZg
         h4R/uaHvwo5gCqhB1dYn93VVvzH1Nw+5jG35ozRjBWT7LJ6FSn4LGyPWJzPtN6638dY2
         Xq96Cfp7M6xpqdEN43vuPoslNxm9ZfZD20noyiyJD3wokQaZfgZ7HTMFvsaq/t+HAQrj
         C/hTXv2gLbyRUolFYpe07kSpgTpYP4gCwpUpvibZJMY+LWeWeuDjSvmIv6jDkIIL7XCV
         uwVhsgYW+mOCGXCY9HdZ6D6HLdmZTeeL1ypTlp5sMuJt4mgMcxp4GowkCPY7pkMYrUWi
         qEQw==
X-Forwarded-Encrypted: i=1; AKwUvBzf6aGeFmRTAleMyopO2J0NpWT40t4AsnAOdaUwlTLhxJKg6sNuuKeTo4S2T8n3NrTwInk=@lists.linux.dev
X-Gm-Message-State: AFuF++lFM43UYZkHOjgKjYytUSWYhNSrygP5J1jQjIfeNcKDzo9cLKet
	iB43mcgOrV/4emEVcAzJ326OwzpKpfiGzXEq4nX9ggf1sJNNTOINr/mI
X-Gm-Gg: AYBFou0GrVoHbeRNxptzUzQkflbJdY0DzHBaUGbcgjepQetac5OCuhRBZ18hbFojGtt
	9AeEYgHJ+vipPbD7bnjC8BvC9wghCWdKeh0k9Aq64YjrE00W6XvQtKkxM1TKjxLR4q1NPNbZWs3
	b3HYzjIXNEFa0Z0HlDX8aoiDqC5OBZ/y1Bfq1pVcyxV7pScWORkxl+uRLXK4z816O6PqUXpZeje
	4a5OqxmIRcX3YYC4RpBpN2elXbb8Rr2ft557GR7KgPiA2cKmBzyicEo/uxLrAzcIpc6vrtV980t
	3ZSiVkv+RhnUrxo1k+xGt/VFNSexe1InIvLl38aABxvRYZC/7fsFxzQ8jIUGxuxpVIEK7+l+kQb
	tepn24i2cvIrO6BtU+WYAem37agGccHCaeQDoRRgB1tAhIJ3OunhAhngYRNjrVUNqsoRZGFFXhY
	tDMrPv6xSdWYIoht7A2QS+A80kAG+2xNZAlkEhSek5ufrSKA0f1i+eOz0EnkQ0HMJIFAL+/qU7L
	u5HnoL1vkWC29Q=
X-Received: by 2002:a05:600c:1909:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49e7a677ab1mr118558985e9.12.1789459504354;
        Tue, 15 Sep 2026 01:05:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:03 -0700 (PDT)
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
Subject: [PATCH v6 1/4] pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP
Date: Tue, 15 Sep 2026 10:04:58 +0200
Message-ID: <20260915080501.329424-2-mehmet.fide@gmail.com>
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

With CONFIG_PINCTRL=n, pinctrl_gpio_get_config() and
pinctrl_gpio_set_config() are stubs that return 0. The getter reports
success without touching the config it was asked to fill, so a caller
reads the packed parameter it passed in back as if it were the pin's
state; the setter reports success for a configuration nobody applied.

With CONFIG_PINCTRL=y the same callers already get -ENOTSUPP from
gpiochip_generic_config() and gpiochip_generic_get_config() for a chip
without pin ranges, and gpiolib treats that value as "the backend cannot
do this" and carries on. Return it from the stubs too, so a kernel
without pinctrl behaves like a chip without pin ranges instead of
claiming success.

Suggested-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 include/linux/pinctrl/consumer.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 11b8f0b8da0c..7be49d447426 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -107,14 +107,14 @@ static inline int
 pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
 			unsigned long *config)
 {
-	return 0;
+	return -ENOTSUPP;
 }
 
 static inline int
 pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
-	return 0;
+	return -ENOTSUPP;
 }
 
 static inline struct pinctrl * __must_check pinctrl_get(struct device *dev)

base-commit: 7257c35db0fdb4fb02d857a8197a16afa84d92c0
-- 
2.55.0

