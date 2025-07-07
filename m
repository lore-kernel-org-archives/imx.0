Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F03192580
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 23:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751932002; cv=none; b=QaC7hsozCP9S+vupnmi9l6f3qCt2/4gsHjOSE/cLwCqJ90VUXSmArHznNHrSbrSbf6Pk30SLrUtI2LbBrhDcngnYgVJv6GShxOPKzss85VWkH1ah9QcJV6Y7UyV52yyeDUkNCY9CMhfSz1KWVeVQy6Fn1vgpWBJPBb5PbPoX4h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751932002; c=relaxed/simple;
	bh=l8PSFBASLdJut+GU1aFbNRoDFl03raPJNhniXdjfRfo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uPoukofPIjPnO5qtXa7F4lwM1N0d5xJiEwfV7iP+zUT93zbkWtoHdhY7ib/ULmfnuloKnB161ijDtdI7Ww4vDWXVym0tV9aoeyZk+pBvyYzfCfkuFuvPJzXPpnWppvn3n7dhKXHMT6SQeu1ojU51IHjuWeUO0/9eajB/ikrAiFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DohQA/mz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DohQA/mz"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0de1c378fso572004866b.3
        for <imx@lists.linux.dev>; Mon, 07 Jul 2025 16:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751931999; x=1752536799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fi5w0DR+FyqjgkZcHHsVS9qWZcL5DthmO8OzA77qp0=;
        b=DohQA/mzA2uxw31NamsGh+t2YR8Dw/yPCyCF3SMck8uow0z9uDSZeMf7YV4zC2Yrjz
         N5AiyyyzfAce6Y1ANfiZrK2GhCR0RwajAM4v19Ghouf6kcEyv5JYKhFeRRFkvopnqRz9
         WXR2f2flNz8jwVRJHyX7BCGzqtjvkc38KEgIF2Hhu2OWF969+0Ymkb/rUvjauuM01eOp
         ZdejfPpkx6SWxhLwtX2Vj7PGoVi6hMjWcgNI+bwrSXSwlzcIxKcMU6nnsdDdcmLfujux
         OCavGP9UraXlMfWt36Gj5WhdKn3OCCTfEerUvq2QCVGxoMRhXXX95FrGbinfrJXlOgfo
         OekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751931999; x=1752536799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fi5w0DR+FyqjgkZcHHsVS9qWZcL5DthmO8OzA77qp0=;
        b=Gb3M2vwH3Pc6h1XwH0kLvzRrqubHtl4e5lrXfy+0OtufewKXq7FmpVcaHvA3oLdzEb
         615WqIFxX9CBp5WuJcFjzvnMT8/kf13DoXwnB0ogHQG2swh4+bsl0Kc5fK+l/C8vUkgb
         uJTQ69dRyira6Satx6Dfg9Z36hYvUN/CoaYk5/+ooeAoN8I5vSjS5KQXVnGuj0FmUOHM
         bmACUMCeimi4NWtbpBY1IWgHs1VMfLdNx5isy+K2XDPBkLJ64b0Vl8eC+pzilumDYvGM
         Sy8uNQbj3npllTDTNKSENXtoD2GsR17roojO0cA9U7R5otfsrL47AOZx/h6rPehB8Urz
         4j4g==
X-Forwarded-Encrypted: i=1; AJvYcCWq03PnPYxd9Aq6BONfazQMw0jNZF7oUdTEvtgHyKiGfnaVHOEEhpw538bfM6Wu7tnyguQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnOnyEfl6Du8y3OhU085YmtsipLxrD8+84BnPvHgzmtg1xlZoX
	gmvyKGQQKFeqO2PEd7vxz5ywzYtWT3XyTJ9C2dR20mDO1WomUonkiXiF
X-Gm-Gg: ASbGncu0/O4oLfgoqw8XF4EA5Lmb6R3hYpwFO0fmEIkK4hbFJJX8i7bLzUHJResOWDC
	p6TUJ7oe3oY5s2rkCZuheO84GYVnkc4Y/wKrDM5lawey7VsTFAbndAGcUb96pf+jJI0Vrt4H9Vk
	d6Ozu0tTXVR4DzCFspBgiU3gjyVPDZoCS1kfyxWydmofJoQgqSSjPmEEyxNPXgvRjNphBqk+NUb
	t0uXtA9ls19avqgeTswCKZSEZD5DH8yyAm3V4AR0XTqFgUlFqA/vaKxqP/FCxkZ5V56UE4HirJe
	j713tffxvofMXK3gAZlVLX7XbXVKCILJK0SeEOHyRCbVjRdBdQCEN4rSda1GDgueJonXd0g5upN
	8o2ZDTo0+cRfC2ZsnS9Cm9JU=
X-Google-Smtp-Source: AGHT+IG8IzAN5Gc72bWerrOtzcRkbpj2JL0dKhrGlpVZA2c4kmwm79VJMsV+AFaKrJkxF9i66kiHGw==
X-Received: by 2002:a17:907:3f0d:b0:ae0:db23:e3e3 with SMTP id a640c23a62f3a-ae3fbc56f54mr1529856766b.16.1751931999299;
        Mon, 07 Jul 2025 16:46:39 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm781539266b.7.2025.07.07.16.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 16:46:38 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 0/2] bus: imx-aipstz: fix probe-related issues
Date: Mon,  7 Jul 2025 19:46:26 -0400
Message-Id: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Since the introduction of the i.MX AIPSTZ bridge driver via commit
796cba2dd4d9 ("bus: add driver for IMX AIPSTZ bridge"), a couple of
problems have been reported by Mark Brown and Alexander Stein. Namely:

	1) The driver doesn't get compiled when using the ARM64
	defconfig [1].
	2) The children of the SPBA bus do not get probed [2].

These issues are addressed here by:

	1) Enabling the driver config option in the ARM64 defconfig.
	2) Replacing devm_of_platform_populate() with
	of_platform_populate() and passing a reference to the bus OF
	match table to it.

[1]: https://lore.kernel.org/lkml/ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk/
[2]: https://lore.kernel.org/lkml/5029548.31r3eYUQgx@steina-w/#t

Laurentiu Mihalcea (2):
  bus: imx-aipstz: allow creating pdevs for child buses
  arm64: defconfig: enable i.MX AIPSTZ driver

 arch/arm64/configs/defconfig |  1 +
 drivers/bus/imx-aipstz.c     | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.34.1

