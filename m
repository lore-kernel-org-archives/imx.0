Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A623235C01
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736761629; cv=none; b=qD7y3oY7J09+DsNsCf1cxjjBOo9ucNFHGDMgWEzoGP+GivB+BzqRoJeH1g9HyZ7HneNTZAFFsPfk1MePW4+bR5RhOoMnXGusUfROuZwI02wbKwhk1rhiFQ+EuFgwb5ozTdb7au+Yidrm4v8H8J8ajAjlUS2uLm4/WkKoaQdbJqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736761629; c=relaxed/simple;
	bh=9e3wcjDiQuT6RY4XnOjEYM/O28Bk5iZRTgZoKR14NAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QqrA6C40i6OjHZ4sFg+IieABpqQN4OAsA2KC1kTHgB0+aJeB4GWGjH18/IlBthohsQqtRafg8mfKDuuPSrcJOQ5h0T+GEmFiXXKRTGLgOR3t1G/ixCwLRYSlpTpvggSw3Mku55JctmjLA+r/uH/h/5jUrb9VRpqjLwi7BH4IUoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8xDrGRE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8xDrGRE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385d7f19f20so2033448f8f.1
        for <imx@lists.linux.dev>; Mon, 13 Jan 2025 01:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736761626; x=1737366426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P/Vpk+fuONkvTQ0KzQxSovHrQHyHGceSyePSaTNOG1w=;
        b=K8xDrGREhbnEsHlVBd88LMzn1Qo1dUWDqg3I2OwfsMlHCYQvzUrbi6EaJlZiAG9o51
         95mNb3SjcBXByuNYAcE6TNB9ymSTYl7wOeJrJeotoVDl8TKsa8R44IkkPDl92w+eHX2u
         iJ7RC2/Fsa746qlzHCjEQkuvC0/eHGtGY/hyTd70oG/OMi21/dF08V+IYQ3Gy9LWw0tr
         zX/gXIBlro4hH5g38k5kaDAyGggYBTP/EabR/hoZ///Zf6PHILWgLNnFJlhNltcNU8So
         oaoknwUCLetcI9/jJpgwouwvAvPVHE8B8u5AIoenUSv+FIouPUSJM10peYO6QqZihbZc
         6u0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736761626; x=1737366426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/Vpk+fuONkvTQ0KzQxSovHrQHyHGceSyePSaTNOG1w=;
        b=AYlEKt3tAccJHPUXdHzINA2k8oxd5hUZ2lO1QpNV1W4sOW/h6N3lrmpgn0d5wWoD5T
         kKTI1mAJI8hrr12h3yaIEhIWcppKgCGP60nsflSI+jUH2M/Zf3xnGZLTsvXSopqC9HfW
         slLQgj+EDuLsLmXxbWZzGW40zl9GOn+/312i82llVzDHFWzlovkxpmB4q4e8mCvUOJ+T
         UizpLvAODfreNu4wFvxRBJhRwB1zxUyULlKg8p/5he3uDVLfC72rJc/Imkws40mfeBxO
         03O+otSZWPmkeHwu/79a+ob3iSFHJFwHNp9cU0SlOdvCYhEBHpblthUEBpsLCsjNbOgi
         Knqw==
X-Forwarded-Encrypted: i=1; AJvYcCXFEQa0bPYnxKRFSdCLEF6FY0H8cWPzhj4r/eIlXmnkQCgKiRW5BTz+p314Kj2nDfeJPEA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoYACrdDzY5AcVm0FBlIBovtpMfUaK5f0dSz/ImveCpDBGZPLI
	OjTfEsB5vWkbFXKaG8/BblG2AkQfFjp8Rejr5E0dYnHVu62z46JO
X-Gm-Gg: ASbGncvsEy1BPT7Mbzgk2B382DH/G87G3sKhaXgP6zUWLLMgG8G6XiEkmbV0UDr/oYx
	aVB9RZMIiXTVbznJGvm/K0teCcghy9lT8SOQwflHHH3/WjF+NJSaq/aNxkTsvVib0VwQVqPvZ/2
	6s1gQBCDngrrVrWkvg3+qyZ90IKInitqVOhg+PvPNVP3naF3yPIHVbQ7xnJL2cigALnZkwELC+p
	ByiCi8uLXBYp9wxw8APZvJcvAc/Y7cvL55sIxR9v2MUvcd9epHZrFxi5SKRSM8gHXPQh4x8
X-Google-Smtp-Source: AGHT+IHP5Bm+4RrlbE63eSMQZv1afGLq2XBlbRHRzKAffDpxJbpr/cFucD7iCpIjpeVScKlPbLduCA==
X-Received: by 2002:a05:6000:18ab:b0:385:f349:ffe7 with SMTP id ffacd0b85a97d-38a872f6d5fmr17550961f8f.2.1736761625584;
        Mon, 13 Jan 2025 01:47:05 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a5a1:302a:fcf7:c337])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80besm11472257f8f.83.2025.01.13.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:47:05 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shengjiu.wang@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] clk: imx: imx8-acm: fix flags for acm clocks
Date: Mon, 13 Jan 2025 10:46:08 +0100
Message-ID: <20250113094654.12998-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Currently, the flags for the ACM clocks are set to 0. This configuration
causes the fsl-sai audio driver to fail when attempting to set the
sysclk, returning an EINVAL error. The following error messages
highlight the issue:
fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
imx-hdmi sound-hdmi: failed to set cpu sysclk: -22

By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
driver does not support reparenting and instead relies on the clock tree
as defined in the device tree. This change resolves the issue with the
fsl-sai audio driver.

CC: stable@vger.kernel.org
Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/clk/imx/clk-imx8-acm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index c169fe53a35f..f20832a17ea3 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -371,7 +371,8 @@ static int imx8_acm_clk_probe(struct platform_device *pdev)
 	for (i = 0; i < priv->soc_data->num_sels; i++) {
 		hws[sels[i].clkid] = devm_clk_hw_register_mux_parent_data_table(dev,
 										sels[i].name, sels[i].parents,
-										sels[i].num_parents, 0,
+										sels[i].num_parents,
+										CLK_SET_RATE_NO_REPARENT,
 										base + sels[i].reg,
 										sels[i].shift, sels[i].width,
 										0, NULL, NULL);
-- 
2.45.2

