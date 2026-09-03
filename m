Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5E93803DB
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422384; cv=none; b=JwDiFKoMJYiYvq7pyX6oT2VySkLN5M/jzyGbLBSBoeh/WbBjfQ2LCZygODL6/cQu+VTVX+UCvAwHaZKmjEnXUzFOLr3S2ufTlsRiz1qTR6L2bXjTClzf8dFGBJaQVWtg0pLd6OtECY4XT8mevY0pQzU2yox76M2SoNr4JhKeNfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422384; c=relaxed/simple;
	bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apbVpsaYoFNyx7JxfecKX5pBhZX2/xQ/1V14QvsaTxp2ZI48PWzsya5lPvF3NfpA2mR5ambdkviqQWi1wXu/ZIJyQPv359sLzs6haNcImadQ4H5L4DtdNN0jEmfrDxYM3Q6tuOcz8q0OplfVncr7JCf3m2VHcbXHmzoVUO1rTVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFl8XjxD; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFl8XjxD"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441a2ba14so1859720f8f.1
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422380; x=1789027180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
        b=sFl8XjxD6VKA/w5yCWguDII5PbdP/VD6IQiTGNP6yEZ5Epvvw/Aot2BlhiaSgPkzsC
         VRlzgCTsHozKV3gk+7ykGsBpxXxKPcNmGI0MzSfie26FoFAHlyLk6KHKgv7ibOcYfpwK
         l9CwvgcbCIwvm7q4pS5vR123uK1JyQaLt8TK8O9uZNsru9+YZKdzH8ANSzwcd57gFAOo
         osPCTIWSIw63Ll/kbUXarNClwkKc1oDSKsaX9emKl8bCL5pjQexCPea2eIjNyEMZ4L6q
         zLJ3I/CyGorlmZoZTQ1zxnOKU3hO/X6bEvS96MeIA5GTeIcg+8C23ekzFm6V4Aa6WaoX
         nQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422380; x=1789027180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
        b=jidUP4+Cur+XYKHXYBPHtjl1Z2MDDxCESX8eLgtJiaGu4X4fa/ekaom8TSULiW/kZw
         GUrXOZ/Yl0yrfZRjkhehscFseN6gtZy3XKw/LSfYwYgAx92Lg24J1a96j1EcGFRMcbsq
         Kd40K/WAbCo2u67ejFZQE7+hV9onTWXohHrjLJxmpFaz5ya1DuBuKdIx2iJXqNXOJNqp
         vyjxWLIki3MGwXtNhQNNKzJQFP4nc1b+YblvqU6VpWO/YG/HCqEAQW7m2CqiLwSULeYM
         Sb6g0FiwjrJjxzrTiqr/xsOPEChORPSJmV8pBuU8LZQd9JiexY4wI+KaK6276oHVRggr
         3mPA==
X-Forwarded-Encrypted: i=1; AKwUvBxJLCje3B/sQSRTsfWTxEAfymqTQ37xikB1oG+BLKYy7I+Cb+SwFMS9xz4PBFQomyxNhrA=@lists.linux.dev
X-Gm-Message-State: AFuF++nAAm1nBCr9IDsDFnZrcMCnrz2VMAmuW+sMB+ltfNpf/3pOXFBX
	JCt9HtlHHGl7R8csl9lxe7t61Wvdee15MqPh7QjjKCrFKLa7nJ3GbE/V
X-Gm-Gg: AYBFou1egCZcsLixGUe4R/t5YjPf6Q0jrC/U/L8v52214TD1BgXCTw5xmu5ZH2WNP+k
	Kcb6dbnZHVYrxDxQT88Y5DSWo8wblQMXTWzUVV1fQltEAKyD/8VSw21ne1kMHJPrwDq3wSk5rtM
	blDIrBzHdfNoTzFZF6Wcw2BtdwlMqqKGP+xBKW5RDY9yLAmWKGwAqEjEk2JPS6HV8elS6WBbwDI
	AFYoM5FpwR7XyvXG4Du/5VggggoKMBj04Utq3sL4UixigwqrMScAiuyKx1NLiiXXr36DBlTWmOJ
	XOXX3rlxGn/IteIjnUVOlYzhBdz4G7GiZ68Yv4N9HqJF1HQ9WstMqberKa1yWmXxQ6wD4eT1Ylj
	qsdz6pJ1OW1q9IDLi+AECyFRv6Q8dya9H/+mjPY31Ax8KUiGt5QwRNopmUBpKwXSSznI2RyPxVu
	u/pEZwT10nok51z9ySJsnlhyPgItMyjCgr1QGuB8HeXULpy18zLv3D/v/X1K5VWsv+IQ==
X-Received: by 2002:adf:e196:0:b0:484:3311:3703 with SMTP id ffacd0b85a97d-48488f222d6mr21633674f8f.26.1788422379658;
        Thu, 03 Sep 2026 00:59:39 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:39 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Thu,  3 Sep 2026 09:59:35 +0200
Message-ID: <20260903075936.2089280-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903074509.F36471F000E9@smtp.kernel.org>
References: <20260903073143.2068494-3-mehmet.fide@gmail.com> <20260903074509.F36471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Does pinctrl_gpio_get_config() actually return a packed answer?
>
> Looking at drivers/pinctrl/core.c, pinctrl_gpio_get_config() intentionally
> strips the parameter and returns only the unpacked argument:

It does not, you are right, and the documentation I wrote is wrong: the
packed parameter goes in and the bare argument comes out, exactly what
pinctrl_gpio_get_config() does, and what gpio-mmio relies on in patch 3.
The code is fine, the kernel-doc in driver.h and gpiolib.c and the
driver.rst paragraph are not. v5 fixes the three texts; no code change.

Mehmet
