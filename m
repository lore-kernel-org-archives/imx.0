Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E442C2CCC0
	for <imx@lists.linux.dev>; Thu, 26 Jun 2025 21:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750975174; cv=none; b=i0LkILVYFLSeZDcSL1s1VOM9b3oS96nFzyq8b1J+2qt3/NUgllVAuZ3OsAeEqfKYNmBO4LJi8sXh5dcHdYBCM6fI68RHKdlvr+eoNJyEpAIIqx/sZyGz5t3Xl9ixUGqbMzbeze8OyPc5GvWFhPW1Lo2/kMePAwfCf4OFv+krxlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750975174; c=relaxed/simple;
	bh=slElE66aqfyyXEJlmGbMp+DNYQ2d7Dc7oDiwGqOqChE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t/K/8ITpz6RJ+5+XcT0OcBSHKC0hirXwgmYoNyK8f2FRyXByXI/bvxRXLrQqI1LlM2f0FxaRn2v/nK2BzWmr/WC83BKuG9eIPF/B5Z1JTrxrNewXpYfkvpTt517osDFFTmB0+kI/jVY6vXlOMhG2LkqsSDhb0AeVNPxVP4G9/yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTCi9CoR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTCi9CoR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2363497cc4dso15766315ad.1
        for <imx@lists.linux.dev>; Thu, 26 Jun 2025 14:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750975172; x=1751579972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIo+4tv6e0tJvJwfvRUmdX7OEB2USSJerM3U4tjrK2w=;
        b=XTCi9CoRkJpZQQTk2Oiz6Sr8gt3VaFjqE7ZXrovXMaq4ke8rh8nLREVH+JW23LGciy
         1l/9YgMiwy+d6h1Rp7UQ+9MnqaZKiYWI0HqSEnFpZrpeOy5qBg0OsdKhTCehV0b4/a2b
         +GTUu0iOAxdyh0sHOXHKqdMJfUyAujRhZEs34JpsHTGlDdfpnOpWAqRmu0c4XiO9Sa+9
         buFxwQL3DTDTcKRN0HDvMo4pKL+q7rPQutYubIEnwWjjEmw4Muh2Tku7057veIWtkqq2
         jjo485ZwhD9PHELcjc90Rx4nR8GD7SdHxW03MZWqZ4OfAPwakS25TnywIq7mruRdULAp
         2Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750975172; x=1751579972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIo+4tv6e0tJvJwfvRUmdX7OEB2USSJerM3U4tjrK2w=;
        b=xU7e1M+oMbnRIl2fESpLQvGB9gKgWvya3hiofaKu6U8L6IUds1dscd/thgeSbvFUfA
         VoI3L6P2qenhgoXokRVqwlUD31VZRxJYj+ZIvpddybEisQ8ipd0Ea5zzNq+Vh56Zmeb9
         5cUtIValmxyx/mFbaSfAx/W769zXEAHgrNYzdN0Udcro6ietmvZrPkTztPFQVV1D5q1m
         ZA7G5uRFaByyQeYkNW/0Lf59yon1jI48tpcZfMpsE0wf8RRtpZGwsS9MSvgho21t/Ats
         EbCIpgJO9Z4R1bpwNCdRbSSrUMpmSfoUzabsaSQtKQRPtsJsoZA9c5iyVsrar8MJx/5o
         ompA==
X-Forwarded-Encrypted: i=1; AJvYcCWrILJI1/O/fn/yrcA2HWBH3xtc4PVoxv0UltrbNdwBCrIXotBlWD+MzqPYhjs38LxCfPY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywljha/5qfRAwsjfG14IQ1vFgHNRQQsJLf4O3TYzKszyPkkqb32
	b3rwihT9XIItJz+GReSqhCWMigpL+eiKj7utpv/wf3mGf2hQT3MxnDXi
X-Gm-Gg: ASbGnctDtpdp0oidRNVkHBSyOiXxjEfwz0AqqYBsNDXfU8fgPKqStuC7BLdxBR5zRNI
	JF+Q7dm9tUBu5FdQ75+ycpD2PQ/9Gv1Jenurkfm8mizyc+z+i4l4fIFhbY6UjDZZHSNYiHEhuOm
	hAbtsFJAbWUL+Adb5bifFBDiWUM5NaDx+PLtumIngNLRdy3xYNmpmph66nf/UZBMNHv1j3PZ6zn
	ldcb2pgulsvQHwyH0ClNG4ZnGYgmk+FsNsfqVApsCg9b0DlJf2vcLk4naudfUNadA7LhLhFw1pY
	EYhufCcmm8p60IN/1L3wsDZUmbvUUS4b7IIP3JgmNcJKebKRjZ+lZQEd5Y51qUdS9oLuhKVzhyA
	yzBI=
X-Google-Smtp-Source: AGHT+IEWjshLgh07UmKjVXlymS2HdOEmftHmlKGMeQUGGSx7ixamCKXotE/1Lb9O5SdhP8Ay5EI28A==
X-Received: by 2002:a17:902:ce85:b0:234:1163:ff99 with SMTP id d9443c01a7336-23ac4609a61mr14225035ad.43.1750975172151;
        Thu, 26 Jun 2025 14:59:32 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b8b9sm585275ad.118.2025.06.26.14.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:59:31 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader 
Date: Thu, 26 Jun 2025 18:59:08 -0300
Message-Id: <20250626215911.5992-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

This patch series depends on Ulf's patches that are currently under
review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
Without them, this series is not going to work.

For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
started by the bootloader and the M core and A core are in the same
partition, the driver is not capable to detect the remote core and
report the correct state of it.

This patch series implement a new function, dev_pm_genpd_is_on(), which
returns the power status of a given power domain (M core power domains
IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
already powered on, the driver will attach to it.

Finally, the imx_rproc_clk_enable() function was also changed to make it
return before dev_clk_get() is called, as it currently generates an SCU
fault reset if the remote core is already running and the kernel tries
to enable the clock again. These changes are a follow up from a v1 sent
to imx_rproc [2] and from a reported regression [3].

[1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
[2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
[3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

v6:
- Added "reviewed by" from Ulf and Bjorn.
- Fixed and improved commit descriptions of patches 2 and 3.
- Improved the comment inside imx_rproc.c file.
v5:
- https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
v4:
- https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
v3:
- https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
v2:
- https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
v1:
- https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/

Hiago De Franco (3):
  pmdomain: core: introduce dev_pm_genpd_is_on()
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  remoteproc: imx_rproc: detect and attach to pre-booted remote cores

 drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
 include/linux/pm_domain.h      |  6 +++++
 3 files changed, 73 insertions(+), 7 deletions(-)

-- 
2.39.5

