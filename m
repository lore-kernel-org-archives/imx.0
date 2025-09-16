Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C49272803
	for <imx@lists.linux.dev>; Tue, 16 Sep 2025 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758008932; cv=none; b=gnF2LEBJ2QaXORHpVHUFDR5+gdTds6gKZNtAVscgJgBbbwrL36Wn00P5RYlvqTza5VhMRK6NQjodd2DwY6HIeJDI1iezNcuwzRZ4FK/27GEY+nCeZBvI/aziSQYlaj1HQB/K7TEzGFg3SHMKjgKILFE+TUqjg2e90WfEVyT++iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758008932; c=relaxed/simple;
	bh=EbxSoUUHARJ/26oz5qvy0rct4HOaMS6x3qf3UE5sAGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FNRH31nBN5o+mWWQqJ3ynHxCFV3A4MczNTCZmwkB0cPUdSK7tfDHQ7qQiYsRgDMFk1OoEudHz/W0y/gPtl2lcxY9HWB2BY377enNsZhKTyxu79ci+QTycn6+ohtqrlhI6b3XhXQp1pP0G6TfB8o6RnOaXIyBGPO82ZpkPQrpkTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVLyk/ng; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVLyk/ng"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso44999485e9.2
        for <imx@lists.linux.dev>; Tue, 16 Sep 2025 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758008929; x=1758613729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=72mKaLpH8ZVeWabfEKgenc3kq6CKIlNYl8ZR1LugQjA=;
        b=eVLyk/ngNm69PbB4SBXtG/UC6ctJfUX8gYVm2UOMmkUJ25d1za2Ocdy4vLURz3ylI2
         n1t8E8PmAUFkoVtVIgMDCiQ1KGY7Qq+3AQju0I4TL43VbHg5uemnd0H5zKrvInBY7/he
         3te7JhRtxgNoWeTF7AniMzxS5PYZlKDaFEYzyDMJ2ZuvfBbTWNctACex5l4alk4SaDgY
         F1xn+JPdI+ei8vbwYZ+DFLFcTP7Jq6ghg22Czu5H1j4CrhRlYn1uVuBCiGOBoXtqf4b0
         E7QhWZiB4I592ONTYudvfhmLaXOgcCW9cyyB5BSUH/hClbAQudsExt6K/x4L/elN9hB2
         DtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758008929; x=1758613729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72mKaLpH8ZVeWabfEKgenc3kq6CKIlNYl8ZR1LugQjA=;
        b=lmnWRidmzwqAd7jVAicnEP5NZIrwaX6O9S9PBIw95PRqQL3HaFsmKBoF3+lo7dsnuW
         HOOUdjHOQa5ix1RgYVjAmhQUNLTvW+Xenzw/EnjinBk0Hs/XEX3n9D2WLCBdpdYKe7cR
         X6xr/2fdNPQpl02DtLdrwroyeFOGclNAGUlgcgzAYClwQHeZ+JZzGl7LhMGrkH6xadhR
         HaA80Os1Z/qJNgrhbj7dW4cV+byruo20J9xFhRa0KMArx9gA7dRBp/YGuKzirEEQKAZX
         X4/kptQzGgD9GwQxMh1eFsXF8uQ89eNs4KatOK/ILRTx+Zp6Axbexmtl8PPw5DAvl2BW
         j0Dg==
X-Gm-Message-State: AOJu0YwRC81XbwNGJt2iAfMuOB2wgV9lWmxFIy09QFGt81fWgUfNSZkm
	J2Srw/0TGMx01yo2Fx6TzgKZL6Plu4eYjAlDN155q7cor04mJ2t0yYgLCWdvIEpQdXY=
X-Gm-Gg: ASbGnctVpFedWNdSVW4bSJOIajJVhgMO1lCFycw1bo/vFTjrHUsSW2+shzEf436S/nR
	M/DRK3EoKc+23ihla3GFcb26cnPuWVlhx/Uoy1ErY3VjeokYNcriFTUN78ApI3S74oHH1cYKr2m
	tq/wjAWm1jNlPlH+q11KpRBBagDqVSCIKnA7bMviMwHrqM1axeFl0l4IX2JKlnbOh7CHlO5Zxl+
	jrNi3+nDcxojcochGR31Hbn1DQdhobKXvBTJOo8nsltkA7XCsMF2KaTzWclF8Db6Ln8B3n7kyMx
	bZkD4KPEehYJB1o7qQhvamcVJDFTRzLsHE4LG7EnohGraTsIKpXakTg6YdFn7CT5e9wNVOkTuBB
	E2zJ+JbnFwbTRsmsZ+9hROiY=
X-Google-Smtp-Source: AGHT+IEL8i5Yw2VUOhkEwwUUdverukoVgo0AoLaHUFR9LPgOcR+nlygVIx1c77T1ysbBtnjWFKJgpw==
X-Received: by 2002:a05:600c:604b:b0:45b:73be:c707 with SMTP id 5b1f17b1804b1-45f211fad57mr85880805e9.22.1758008928887;
        Tue, 16 Sep 2025 00:48:48 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm103220935e9.0.2025.09.16.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:48:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.18
Date: Tue, 16 Sep 2025 10:48:28 +0300
Message-ID: <20250916074828.9677-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.18

for you to fetch changes up to 14be8b7b6cbc0a072c749e46e28d66e0ea6d0857:

  clk: imx95-blk-ctl: Save/restore registers when RPM routines are called (2025-09-12 17:28:29 +0300)

----------------------------------------------------------------
i.MX clock changes for 6.18

- Rework the i.MX95 BLK CTL driver to add the platform data to the
  state container.
- Retain the state of the i.MS95 BLK CTL registers through both
runtime and system suspend.

----------------------------------------------------------------
Laurentiu Palcu (2):
      clk: imx95-blk-ctl: Save platform data in imx95_blk_ctl structure
      clk: imx95-blk-ctl: Save/restore registers when RPM routines are called

 drivers/clk/imx/clk-imx95-blk-ctl.c | 57 ++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 29 deletions(-)
