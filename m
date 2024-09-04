Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D51CEE86
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443846; cv=none; b=u1ZXxnTB5ZuAG//QyTV0+IgU38ypWbWaGmWsKjImGsxoHNNVflgWqsYhgmV80Viia/UyQU5Qcf7MMmgcbUkx1lm9fKo+hUGzsbTjtkhfPS/b8j1+nOBd0BeQKFAkM7fkG14dGgxZ7nReHEyL9M7Ftj17ItPvUrld0uYT/cOZUSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443846; c=relaxed/simple;
	bh=FTjiDZN9yInQz1hWZ/h7wkmO4TF9Z15WUfoej4IaTi8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KsLzbB4/2cMBkT8hgeKj7k3JaSpWG17O3OP76Z1rzbtbC0x3T/d8mvPDoq0exVtolQFKAI249O6SnAAkHAX7Ds0k596FcHAHCClj7P0GCb17AfyPHWyZ0dqC+B6NnMXbDsfnOSv3Ha8DWgJJDL/g7RtPPuzG1iB48TICnvzOgi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rfa88k0U; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rfa88k0U"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a86984e035aso782159266b.2
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725443842; x=1726048642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VG3SCtSxXoO9kJ5qHjWCI3Ghtvll31qds48f+pV4lgI=;
        b=rfa88k0Urc+kIxGH5/AKCIu8jxbSInCGw8cNdP6pIkOly88FUQMQ6fZvaIv54pdlXa
         VU2B6AxACbLMP64r9rN1Qs7ISwaZ6PU3sPXo5G9/fu77E62V8YcX2DWaIHeFBgfnYCRw
         UNngshuVdBKmTBAOV7DxNbUgOD1oOMSTljyrTj77pzj49p296cYLED6nOK4egvTbuNC+
         Kvw9gXJmtFrlSUw2GLnZnG80pR8A0LSN/+wRuQQAo2paGJfWUuQ1a04EYYZq40HjeIdE
         RXec0O3BSZAtUdg2Nfxo2n0o/7EbaFXvhhwy742ztw8FpRBDMBuM8m/GG+acYGnTBiid
         ehVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443842; x=1726048642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VG3SCtSxXoO9kJ5qHjWCI3Ghtvll31qds48f+pV4lgI=;
        b=aoOTX61MMrC1qM06P3TzjOUixYlnqlOxN7tOvHDDPmq7vpUnRFuXPMqQzH+vCwkZZ0
         XKPhKyeUaEIxvI4LrG2A4nJPdtI82oXnd1A3XMgQLcOPv9qmqvwhjYhYFIB4Fsoul7AW
         57BTPZz4+/2DVAmcTVbA7RieW64B1ATJtoPGBchWgCGG+FO5R+FUCSfe/VilnswWSkJS
         dHEg+PRM04kE5n6CENrnPNVICNa4vDrFEBv1EGikLEVpZLZ913lVW+udbXxpvFSjNnzO
         TAd/ArZc57LzPWan7bGcXV2LsDTKEP/MR3wC+VvYrVBmdJsRlpTR5Ri8Wi9ix8ie8Bwg
         UfHg==
X-Gm-Message-State: AOJu0YwAGaflCZQJej9FkS+NwXPoP1vbHAZk0eLQ/fhM1DaDpNVVQh0a
	PYlUND35SgPBwzRrM6u86uBBz+eUlR3NwBKcDoay5szZMWBfakQMI8FbgvRhxC8=
X-Google-Smtp-Source: AGHT+IE+2W/EhIoP1awAXccexwE4Hd7T9R6Il9R6pyNmD5WD6nEZ6n3i30rCZtmi+ObSIObIoDmtIQ==
X-Received: by 2002:a17:907:72c7:b0:a86:a30f:4aef with SMTP id a640c23a62f3a-a89a35dee4cmr1210183566b.22.1725443841806;
        Wed, 04 Sep 2024 02:57:21 -0700 (PDT)
Received: from hackbox.lan ([84.232.173.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fefb26sm788422666b.1.2024.09.04.02.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:57:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.12
Date: Wed,  4 Sep 2024 12:57:10 +0300
Message-Id: <20240904095710.2813541-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.12

for you to fetch changes up to 32c055ef563c3a4a73a477839f591b1b170bde8e:

  clk: imx6ul: fix clock parent for IMX6UL_CLK_ENETx_REF_SEL (2024-09-04 12:39:38 +0300)

----------------------------------------------------------------
i.MX clocks changes for 6.12

- Use clk_hw pointer instead of fw_name for acm_aud_clk[0-1]_sel clocks
  on i.MX8Q as parents in ACM provider
- Add i.MX95 NETCMIX support to the block control provider
- Fix parents for ENETx_REF_SEL clocks on i.MX6UL

----------------------------------------------------------------
Michel Alex (1):
      clk: imx6ul: fix clock parent for IMX6UL_CLK_ENETx_REF_SEL

Shengjiu Wang (1):
      clk: imx: imx8: Use clk_hw pointer for self registered clock in clk_parent_data

Wei Fang (3):
      dt-bindings: clock: add i.MX95 NETCMIX block control
      dt-bindings: clock: add RMII clock selection
      clk: imx95: enable the clock of NETCMIX block control

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  1 +
 drivers/clk/imx/clk-imx6ul.c                       |  4 +--
 drivers/clk/imx/clk-imx8-acm.c                     | 38 +++++++++++++++++-----
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 30 +++++++++++++++++
 include/dt-bindings/clock/nxp,imx95-clock.h        |  3 ++
 5 files changed, 65 insertions(+), 11 deletions(-)
