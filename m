Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8B8130ADF
	for <imx@lists.linux.dev>; Tue, 27 Feb 2024 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709031934; cv=none; b=hZ1g0MKmR33MMpckW1oWESvG4cXDuk+Vwxt0GxaweOm3on3+pULJZLonYGhXAUUKMD/eLk7+UqvwnEJ7zb7tkNp2AyMU4KKI4VekjjfYaJPdB0eAbGv4ESZ4E8QJV9dCDraxRQ5EE+sHxw2FugAtKPyDYi4u05O1ZEaA++xaFUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709031934; c=relaxed/simple;
	bh=0RYBig305OHqvLLkrKNyAb2MuH/1VgLPeQ2Uv68/Eoc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dSzNMeSvoFEOhKcL8HLALnVElb4LoV/vgdyvLqbn4JWvK4bZgpaty1f8jyMi0Y26PfPII9PmqP64YeV9YJgDYa+OjiryP7grpCmN5hcRC07K33HOKm6eRkoOQxNWJANmE8+Q2ToH/mOh1L1j0mm1gFwam+NcW/Pm8ss4L+dCmeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uax6S+ER; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uax6S+ER"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a4396b785b8so124371466b.3
        for <imx@lists.linux.dev>; Tue, 27 Feb 2024 03:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709031929; x=1709636729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JK61QB9o1xWii2ErgvXw3zRrKGKsozSxgEdvjx0laIw=;
        b=uax6S+ERcu8eZPCVkKAZJhmS4HJ9oUgvPiwJ4DnvQ0ysnYcy6zpR97lTPJVI/D0GPU
         kIcsRyTP+WDtFwnFomC5t4U95a9GVVEDmW2vLaiU1HG5his506U8u/UhhoDSBRYbaawF
         hSACSsXzGyGaHX++Ia0kAC7dCPd2fJ4gzyWXZ38bikrBZPyDzRt5elyl+h0iojmugVuh
         WofWwnS1DF0lfSCe68IG+APbi0TO05n1qHYB17yzOXV00idm6VB1mhQm7v9GR0u9EUDk
         ZCjkFvb3FpMRsufcSJnYmSDVyb/NXmytsCclpTyZ120ie6Ull92AXROS71qziLtklbNg
         +mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709031929; x=1709636729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JK61QB9o1xWii2ErgvXw3zRrKGKsozSxgEdvjx0laIw=;
        b=xLO6a5Lnylo2xgIidFrDKr8KNgsU7U8qVu85csCx1ds80++ia1foCGfcexwIRkkpt7
         JxdUpIemvPnqCe2+CSYVpE0RsKyWw/jrEJM0GkrBW6yrnm2G/9FzlrFPywXccz5LIuR0
         a2Ei4ibmX2k9BW73+kJAUYvCCVVPxKP8j1sWxhVQBySeCZ0HFR546Gb044wC/rvBNVw+
         wAJO3Eax0S2l1uxJlNiKEb8m4rYduhXiVJQBaeOdT8iqRt55e4S2ajGA2l6lhLChCcQx
         WoHsd1k7cSVwpYmw6ptfNN43po5FHy2GK6JJeCgaue0/j7CEptG3ylbl7bMHEyi5JPin
         WxuA==
X-Gm-Message-State: AOJu0YzQ9HSzCAzO/dGwFtPiZvvyOODRiUqXlxV76f8NGJSBRcNP+M4j
	vtb7KjVQtkFnJft8XDVCOtLatpdgGxHEVfPT+ryD6cvKk9HjVApH18c4VD1yXoc=
X-Google-Smtp-Source: AGHT+IFkYbx8S7y1b8p7Kwr6a013ebLwdNvpHNqD9tmb0yy8Mo7cYn4LsFkmA1ywlo+7gQwmHMxqqw==
X-Received: by 2002:a17:906:1808:b0:a3f:56da:5a40 with SMTP id v8-20020a170906180800b00a3f56da5a40mr6701159eje.23.1709031929608;
        Tue, 27 Feb 2024 03:05:29 -0800 (PST)
Received: from hackbox.lan ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id rs15-20020a170907036f00b00a3ed811cff9sm643504ejb.154.2024.02.27.03.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 03:05:29 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.9
Date: Tue, 27 Feb 2024 13:04:16 +0200
Message-Id: <20240227110416.259133-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.9

for you to fetch changes up to 13269dc6c70444528f0093585e3559cd2f38850a:

  clk: imx: imx8mp: Fix SAI_MCLK_SEL definition (2024-02-26 11:05:58 +0200)

----------------------------------------------------------------
i.MX clocks changes for 6.9

- Minor clean-ups and error handling improvements in both composite-8m
  and SCU clock drivers
- Fix for SAI_MCLK_SEL definition for i.MX8MP

----------------------------------------------------------------
Markus Elfring (3):
      clk: imx: composite-8m: Less function calls in __imx8m_clk_hw_composite() after error detection
      clk: imx: composite-8m: Delete two unnecessary initialisations in __imx8m_clk_hw_composite()
      clk: imx: scu: Use common error handling code in imx_clk_scu_alloc_dev()

Shengjiu Wang (1):
      clk: imx: imx8mp: Fix SAI_MCLK_SEL definition

 drivers/clk/imx/clk-composite-8m.c    | 16 +++++++++-------
 drivers/clk/imx/clk-imx8mp-audiomix.c | 11 ++++++++---
 drivers/clk/imx/clk-scu.c             | 22 ++++++++++------------
 3 files changed, 27 insertions(+), 22 deletions(-)
