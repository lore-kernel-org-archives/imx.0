Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABC7358399
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 10:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529687; cv=none; b=Uc+UB6u1DHXRi3qZCRjZvv3qtTGHRnNpAt/2th8pTDSDdfTF70Lcr+4iO74EMhQ4SMa/lB/Oq+OIHEz+LMFitjcWeMAIFyvfi9tCB8+81Hz7NgENYbg3a1QYETp0hbvsW8BGI8aFzWFlSpc/3Wr2apFQZu7ed/7JuGaIWDiSdgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529687; c=relaxed/simple;
	bh=oEXbhprboarVKGeFczIsGRUibvpUIcZwpj9JQYo+kYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fm+mkhxCB55lwsiTFCKII14aoDBROS2ZgWQUCQnTp6625wXCDslekQD56MitemrsHbsbPIf9MlrJONfCPlVz8VIfSTShRM9iLT/gQAeQlv77X8G0wqi0ZkXhbUks04npq/jLr5FA7AxbYlVglMTsoK2zBqiiIUy74/Zx6NluUE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UycYKmTW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UycYKmTW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccf2360620so7794115ad.3
        for <imx@lists.linux.dev>; Wed, 12 Aug 2026 03:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529684; x=1787134484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPGGnxaxxccJgS63KzDljJ/qLjaATjo4V3Bm6nOUhog=;
        b=UycYKmTWgHjA3GFB3ygu/l0icqfPHQHwWJM8igtUJhN9EA1eGA47g9x1qw8OcTPIT7
         +v8NkCo4Ada/mUj0o+kOaXtGrFN6i3Tj4o2E6E61NN/Ms9j/WWDmqyB6hqEIwQVEmSFe
         KWHa+1PuHC2UyF2C2nxFb5vmz3aR4dvGkfSKhQOklL+KDxknb3Uo0c2atp33+PhvlZfg
         oHmveekhJUE90fhFHzr75OZPkWHoUvi4b2Q/HsKV8hdnmGV/7HoXjMuEAbWC04cuNWEM
         GhWxubFtysb4Q9SDl4C1dJU/UmCym1/k5PKMkHGZFZ+Wf136jRbggKtweEtQbNMBzkDN
         orGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529684; x=1787134484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPGGnxaxxccJgS63KzDljJ/qLjaATjo4V3Bm6nOUhog=;
        b=XBnvcxtO/na/LoG+tVHsS0TsCS/Y6JBfHm02SEDbuvHS+eqBoywrO9/NkF9/dn4ePl
         aTNTIuG8PYkIxVZwWHb9hLessBlcHbR+FsNL2/u+26pxCZLCQbFMUeHkWOECJ4os8GfU
         Z5BRz62tSy6ecDXacLKSBLiZA3yjIOKdKh2erUY701qLVnFQQJGZPj5OtVFo/IaKRZo9
         e/gkmJHeN9MlF7u0d7n85DSqL0CHEHvFJo6+OJ3eA5CF7Gw0ipu0HwNQpY4b+EVbtFhl
         8Lf/MdFhfF+bkcgMq9Lerk7BiO8JHQhF5E9eB7SU/wN0ccXiD5LmvMRYxfs2zHuuHJLu
         fvqw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+Nd8MNW9l35uKNjBIVtNf3bLaf52PhddwByeBSSf177SKUY7fo5kDfduweknksMOxmQE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOlJJa9yWvWZRMrt+pqSMpNDG3Dy5kSZqrTigPk8Wwp+3y5U0v
	1IDyV2MxgIAle0HsQkNtUnbDysqnQvXp+bzgyO6Y7I/nLmHg0ToCf/Ds
X-Gm-Gg: AR+sD12hgQI4k+ttO3UhKS74Z7015lABWe8l5LxjjZTk0AP4IJjvZ4ws7YXB+3KoEAs
	xjQHhvA+U7pqHODDFLESc+Gji11lQbRKT4WQmY9Wg0C6fA1Qo+OnEhOaCgQuIiuoyjBntP6iho+
	MXXGORWBBbfU0Q55ME+gqF9SG3lBE9r2Ujj3QW5lusRoILhoR70e5mO4cLO/q3aL0d7AAZQqUl1
	lAjVFT7TSIlMWuX8s6oPKx+zrL3M6leID/ETukrUP4S3DAiwk/StQW0ubmXhuijGJOVvmDdle2J
	N/Xvt3XPdBhZMQ3THikRvKv/XxEuVR6nqIgzj5JJSyfL7Ywe19kRI2dyoCMNkj8er8i2mAXOhn3
	wepJCInf5YRlSAK/YXMahQXnpxUgJnXSU+hnk11XjgGcAX1uxQwHKgbfHGKDOdiUY8uUJYkq8F0
	1mO0XHUPv+c+Wlzf0l5MTA1DQ8yfRinlrJerVQlKHQt0QO9n5gNGP4GtSF7c/AQlUqqs1eGqHkd
	hk25IRYU3ivHslo6sFcKXCciRiNeE1p/4g+YEy395yMW/jeB9q7gvIP+MD0jrqDJN88qrqBW+57
	h//C
X-Received: by 2002:a17:903:11c6:b0:2d2:da8e:9017 with SMTP id d9443c01a7336-2d3452f5c1cmr45156165ad.8.1786529684542;
        Wed, 12 Aug 2026 03:14:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:14:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Frank Li <Frank.Li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: mxs: Improve probe error handling
Date: Wed, 12 Aug 2026 17:14:15 +0700
Message-ID: <20260812101418.37966-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves probe error handling in the MXS ASoC drivers.
Use dev_err_probe() where appropriate and remove redundant dev_err() calls
when the corresponding errors are already reported by the called functions
or further down the call chain.

Compile-tested only.

Best regards, 
Phuc

bui duc phuc (3):
  ASoC: mxs-saif: Use dev_err_probe() for error handling
  ASoC: mxs-saif: Drop redundant probe error messages
  ASoC: mxs-sgtl5000: Drop redundant probe error messages

 sound/soc/mxs/mxs-saif.c     | 21 ++++++---------------
 sound/soc/mxs/mxs-sgtl5000.c |  2 --
 2 files changed, 6 insertions(+), 17 deletions(-)

-- 
2.43.0

