Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9D2D9EEC
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242368; cv=none; b=qiXNAACYV8H+CG8IpZ2sQ1Nwljv//2q5tpSj6ViGlg6299AtnAPEVIBP2HHdWgsBDevKd+batBjdGBGm2DKFHdoZuDr5UClr5YQphfK03Bq7MNiJJqvEwbDSTZoWtv6aAcBmUUQKHjMwg6lH0l2JXfic0AoXsMxy36z7FZM7sSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242368; c=relaxed/simple;
	bh=cmoQL7/EOLRFUL/HDkJZjuFWcItHG3aLGx55fZGpJDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NtmRhIGYOD/9XI1+KM5p6dR+vf7OLhYs7bYvZauXzNaDiziag+Mu4yFcTIfIsw8V8gQxCAXqME8u+1jheo0AKzw/BFnLjkAS+d2EmzOZM2Ld/Z2VOsfUW1AmlgT9t3NObv1snzIVl1VMSJPMEPP5rLSDIPqGMbOvyyyacnAKq+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dfvhCOyl; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dfvhCOyl"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-b679450ecb6so866482a12.2
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 10:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242365; x=1761847165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZKnZFdnM3oZwGqheXR0h641QYDnGOp0D351J3S+oms=;
        b=dfvhCOylM2XrHsS3K5GgJrXzTl50fUuXkHvTPJm/0bqvy8p7CwWK/7cc83I+35IuSe
         qGRaEO/YNbXCukdaBxJTQqSuCqjNuC09eXk1gE5Dr2a5qnuChl/RyeIUn4Tos4W4CC3h
         cmoC+gfLDeEx+I79B+lzG6M/DMZUzxt9IyjJH2QY/mi0QM/pBah48FARG3WS4UIyXRtN
         hB4sYW+hIgTjrMvqMdF9EYuZi6T7MLwmV4Kd4cGPtATxvznD8ulGuK6VGaMxB3CBg1H1
         0+ocGnArjWLeeIYDtOxmdPW7WYhFFoCLo7UUmlnolVbgVvj+BARbxZ06kaKWljVZM+Dm
         Lbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242365; x=1761847165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZKnZFdnM3oZwGqheXR0h641QYDnGOp0D351J3S+oms=;
        b=TWJntXUe67sdlMnM0IBjxsqH2nZsgiM7MRijpnd/t2OLP9Ad3flvAWtZA0qKR+v96f
         SP7GL0Mlxj6WuulcqAqjTkHU27rw6WtLB4Qg3pforCgRFnWBpbcK36O2NTCPzNdHu00b
         TO7vXtoCg0ZtDU/KuW74LEk83cuSEDfc8JAMKpH4I8SflyJaUxHRx0yxGqknMV//pLZK
         0Eljv6uPbZJmYsK1tJoVNvLsS7D5XY+hGQt3q1+dhFmlJc7IBzj6crBss7el6ld8Nha0
         P1d2XZurWrK6gHscPZFgxwQSmIJXCvpaI9vsTzxsayafSvI34fVR+UpHBOpBV8+7Wj5f
         CXWA==
X-Forwarded-Encrypted: i=1; AJvYcCX4ialk3wFPs1Soq607ZwZ0pjFMQx3jpjKNOnbPQU7qJHD+JJJQDbRAQxnz3nHk3hO2ZgA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGGlLrE+Qdgz1pOmy5WeBHYuM3uUUXmJhMK7pzxzdHfumTjv0r
	waWYLx+I9bzjmKZRGANP8RmZK+ontAy726zZJOdOox/fv2b6pEWfbyB3GtefS50g4Y8=
X-Gm-Gg: ASbGncsZMQO/KEvCC9ckhy2friofKadnbXn7tqzipN2F6HGmhVX5rylZCFhLNlgYwDA
	NAbvMLcf6A1B9hd7l5P3mwHs9/Qns+jjHNLbg1m+szxqcxoD0tMaExVQhCkw1xYo8ytuNxgxydc
	D1GaourYZyLol8KOBm+xXLXUXZpPH9jWSD3EdaFS7YYMqwIdwnMEomqYqoCZICEELKmCBtYUD/t
	hfD2rcEKUC9RSrr4ozhDW5dPNoswN9+ldXbHmXWQvJi3ylCkYD4IPAA47Ia4wAo5RHqNEo7TzSv
	EucjpoX3UVBhhQORrEGCOiabPMPOk6dnbkO/q/XR4WL44UUJ0iCnMhimcY7S6CvlIiOPHB9tUmO
	6gc6HqVWeQa9+6VVlPnbU1E8vB/JM4BEoI8JMY8lYfJfGSZwpyoVWijOUgUyLXj+N6qHOHn6yZW
	f7DRFJHMpyin04CuY4GXQBYpaGoRk6BM0Q2Q==
X-Google-Smtp-Source: AGHT+IG8JoJ2ND1pyiQh1ApMIuQ8AB6jOUuqQ1+8XSa1Ou2nNF3k3D9kPXQ1PKRoMYU7/mYJQIadTQ==
X-Received: by 2002:a17:902:cecb:b0:27e:ec72:f6d with SMTP id d9443c01a7336-2946de3d929mr41775405ad.11.1761242365381;
        Thu, 23 Oct 2025 10:59:25 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org,
	dlan@gentoo.org,
	pjw@kernel.org
Cc: Frank.li@nxp.com,
	p.zabel@pengutronix.de,
	guodong@riscstar.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	geert+renesas@glider.be,
	cyy@cyyself.name,
	heylenay@4d2.org,
	conor.dooley@microchip.com,
	fustini@kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] spi: enable the SpacemiT K1 SoC QSPI
Date: Thu, 23 Oct 2025 12:59:12 -0500
Message-ID: <20251023175922.528868-1-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the SpacemiT K1 SoC QSPI.  This IP
is generally compatible with the Freescale QSPI driver, requiring
three minor changes to enable it to be supported.  The changes
are:
  - Adding support for optional resets
  - Having the clock *not* be disabled when changing its rate
  - Allowing the size of storage blocks written to flash chips
    to be set to something different from the AHB buffer size

    					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/qspi-v2
  
Version 2 addresses comments recieved during review of v1:
- The "reset" property now only applies to spacemit,k1-qspi compatible.
- Patch 1 (previously patch 2) now points out that this is the first
  non-Freescale device using the binding.
- Added Frank Li's Reviewed-by on patch 3.
- A quirk flag has been renamed to be QUADSPI_QUIRK_SKIP_CLK_DISABLE.
- The predicate for that quirk now returns bool type.
- All other similar predicates now return bool type; this is done in a new
  patch (patch 4).
- If non-zero, new field fsl_qspi_devtype_data->sfa_size defines the
  size of the serial flash regions, rather than ahb_buf_size.
- A continued line in the Kconfig is now aligned.
- Patch descriptions are wrapped at 75 columns.

Alex Elder (9):
  dt-bindings: spi: fsl-qspi: support SpacemiT K1
  dt-bindings: spi: fsl-qspi: add optional resets
  spi: fsl-qspi: add optional reset support
  spi: fsl-qspi: switch predicates to bool
  spi: fsl-qspi: add a clock disable quirk
  spi: fsl-qspi: allot 1KB per chip
  spi: fsl-qspi: support the SpacemiT K1 SoC
  riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
  riscv: defconfig: enable SPI_FSL_QUADSPI as a module

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        | 16 ++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++
 arch/riscv/configs/defconfig                  |  1 +
 drivers/spi/Kconfig                           |  3 +-
 drivers/spi/spi-fsl-qspi.c                    | 87 +++++++++++++------
 7 files changed, 124 insertions(+), 26 deletions(-)


base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
-- 
2.43.0

