Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B6137648D
	for <imx@lists.linux.dev>; Fri,  1 May 2026 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629440; cv=none; b=b/UWvVpXKnjapfesTZm2Q5a8qx+WCO4FovdV0KznD3VSXkqGHqZRKkoo9UZUEQQJ4gGanZR4538/8m9IfR6rRTAiG0M3xAWDAyZPB9MKXHcRTsyHgHytBp23/wIUhdjXbV+8Bu6C9gMvpj2gQK5viAvf6cJTpSEtQo7uRixQwfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629440; c=relaxed/simple;
	bh=XL4uV6GkgD4RcOl+wpvrwdX7d246PTROEpd1HxkSjpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d1ByluZEFiGxg7wY4vtyrCWvQOWennim/8wU4zSQL4gRF4dVmIxj9sNt18am65HGwKpG3M4tPVNweiKltMpRKFZHCYkfTDReUocpX+fyNt8G+Jd9P34gI/uWG1sbdj1uFawPlnLYxjWPhairaLEoeO5ileFjnelwNNd4lvqmrkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqIAn+uS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqIAn+uS"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8296d553142so1217249b3a.3
        for <imx@lists.linux.dev>; Fri, 01 May 2026 02:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629437; x=1778234237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJvh/XpegIBYrHOJk7E96WpmL8EapMHXqu052w960x0=;
        b=cqIAn+uSG/R6l9aUGPgkXz2DucTCHw8UM1ZTDkTEvT7Wb/vRhM8JVzi9X/qCnDIud+
         REGLf8UtuHodTxPyzbTchSscIWwoWxuxIyfXYVNXyCZJ1kY0KA3UylxujfXzqHcaJXXI
         KrX9813/RPdnsaUw04wjP/4pA3R9zPKWoJ+DKLUcwQ39ambSpUV6CAIrxboruK8dV+kK
         or0FqY0nkWVncamtc8/86K2t7i2NCbL0+U8nRLyRA2aZpYWO9+4VSiErBaUZz46oUsgw
         pkF9XpZUVLhP75nv8yl6imf7pcXoJzIk2cQOJDENdAr2VMOC/BX+Q/flO7y7R06bIi6g
         5khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629437; x=1778234237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJvh/XpegIBYrHOJk7E96WpmL8EapMHXqu052w960x0=;
        b=ioQIh9/hyItd+eA41I+xcFGmO34Ik2IOtH/j0sAWYW4WaMquwCikoVfTaP3SDUzVy/
         hBFLhtHY0e1wMeQJmVpvQjuKNRTI6eWxQqVrNn2DZSYsKnQwTX9DuxlIzD+IH1eba8EX
         8JgOuntfJMJKg7DKBkHwGlaWiab/QqFMo3HBpjhm8t4EYQ0ewVWO6d4yUuooJtcNjMXr
         LDGYWSDu2PQOoARZU6E9nUpOW12uGEuxnWrFoD5rBO3ai7pSdS8dZag5BwvXDzUyNnuD
         eR/kTPKkIewVG9vKfsxiti9a0AqLAwky69Eoniuh3nnjfkZ1whumNxhmm9IB6V7eBS9C
         7vOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+g9WDl2dJY009eignCssCCKv/2G6wLXnWkTmlokvNagNkv/8i339uktEfM7MjNv8uYz/E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8qzBBEa7L2lDS1yjWLmW67hOGtQ+7g7ST0kOJzRphiKy8sIAE
	0/AUx1AOlC+9QQrDa6GxPpvw9ML/bQlYD8ZsCMa2q27yLY4mMmB3BkP8
X-Gm-Gg: AeBDiev5qQgOhlqIyFeWeq2ezCnySOrlnaxUHjNUJnT7NFHDZgjCnGxLkr1QXzBt1Iy
	e32kkSw/bhzqKFMamCcMlYANfjKVvrgrZje7hnRpiEwupN5EyS8GshAM9XRsII2h1XjgPeNEYBd
	Eu6HS9dseTYvRS8xQfuhVG4eEpHAfU4GIVP2aNjmF4xZSWZBc238s4UCHOu4eSY1lRn6bT+gDOJ
	oftbBpbmt25Fp5rQQLtfAIaU8jFm4W9Lz2aReAFB3V9V1lKaktdJ/BYUzY9uWCwHCYhHpnhRn3B
	QBsVUTEjlo8Pln4WALpjRF8BrF3ysaV1R8fMRW+NMbPctVP1XSR64Ki+X3hW+1rXDFtT3foFtEv
	qnY0NGm//5d0aDrQBGhIzmyQ3SxkRG5VVNZCt2FPnSdCWCHyM+71ZC0rtbQ8INucGhJ4lXQnIqz
	VwCUMw0qlPBhW2JQ==
X-Received: by 2002:a05:6a20:6a0b:b0:3a2:c683:fa84 with SMTP id adf61e73a8af0-3a3cf77ba41mr7322916637.27.1777629436989;
        Fri, 01 May 2026 02:57:16 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:16 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/4] fix and improve for Hi846
Date: Fri,  1 May 2026 17:54:29 +0800
Message-ID: <20260501095433.1609309-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a error blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- remove uncessary `else` (Sakari)
- fix link frequency (Sakari)
- correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (4):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: fix link frequency handling
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 226 +++++++++++++++---
 2 files changed, 190 insertions(+), 38 deletions(-)

-- 
2.54.0

