Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F129233F8BE
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786177915; cv=none; b=aviSqsPkeQQE5IHwMOlzNkA/A0Rt5lNusEhpPR7DXW7QXLBsXLV1G8B275nYENYABdAB1/5eyOPMRk33A0pCUsroojQYxlhIjrSUoKkDkjJVgTlhjuQkhPYMkYJoQguuCkF2lDHDVHTae/ccmCNueSf8ysyLyELlCopHHQVo+rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786177915; c=relaxed/simple;
	bh=db+z0vzvh2BQdKuvYbDdNDQvp3bZssbayao5QvGWyjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrNY3Dc7W0Ov9d0LnI7XHPvDzyIWwQ56nivqRrHQwUz0bdUNKNNWeeCQk4NEeAtT8TtDjM5kZLx4C6oICGEihPfFqUYXsv5reTncCrGFeGRSDtiOrFSzSvv7algKlGacGLmwi6B3akzy+5aOFlKMi2IOncheZ2tswKBSTFnyv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nc5vC5L+; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nc5vC5L+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so293820a91.0
        for <imx@lists.linux.dev>; Sat, 08 Aug 2026 01:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786177913; x=1786782713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKPZin59jcLEgsj7vGd6U8AiKKUkanMgykS2/LGEdhs=;
        b=Nc5vC5L+pqCGmW5sIHt6/6DnW9Vt/+c5p/immyAwN4LZrKz5sBC0P459ov0R50CKgS
         KK1KBIsRwM7iPqVlgIDsZqwgt/JcLrtHUca41HSa3lbze/Zy1LIwEtp239zqAqAM0+ZC
         Auo1ECBg9bxuK/Es+icMbc3l6aIS2dgGw2FHB2ZrlcQ+f3hD4mwh9gLE4UG/idUDtvJK
         THEOsrREfVK0QpWA35wf9HEzBeQRePsiPifuc2l5nTHb+w3cGvOXUtPvFVGK5n9r1TBR
         nHi947C/2f/XQsPlwHatlvju/bdg7qh45xgq7IVTSt0tCp90ohdmI8hYyzBIPBo/w2Fe
         xwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786177913; x=1786782713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKPZin59jcLEgsj7vGd6U8AiKKUkanMgykS2/LGEdhs=;
        b=PyEfkDA3zLvp35vgy+gKqKWa5xomS4aJA2NQE/DXK+tr4QlYuHxOL5b7FAEIiDQQL2
         GL6ymJHuvo6KkZz2b4GNFI7jQ9uFekiTZt7ESZFyUq4QCJqqA4AGnEHD0UytCHT7hw+o
         +LeO2OarPN3u8aZyuvFnYngebBg7usrL36dwOiQcENVI48MMeYaNts2ufyyWZ+LF9DC1
         kfsgbH/Bgug6s+8wptDW4Ev/FR8tFPZYSlAcb3awoASJkr9ORiqVMd3HGLStCNcZWqb0
         rYQGW72g+3C29dQImsqCMil7iWjzqIjOgXYQ3Ux9cSI5yqsvoPEN04P3/Q1qg8/9rPOD
         4A8Q==
X-Forwarded-Encrypted: i=1; AHgh+RplTi5bvgxAlxY3LaKl/VtY4MGWIJRfpcD9RV0zoXHEaUN7NrDbGwQeWtX9l/chyu3ZIhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQPUw3AXlsVHVMgETLcLRhBILcke0YH+zCmbI+dY7BL9SMqED7
	DTvpY9/wRwrFTfnuM8Xocb6KvA3oNI8RMf6HAqSbxmsRUfCHuhABw7TB
X-Gm-Gg: AR+sD116FRFr+6lQDrElc7AfeZmTDObVwDek6gjP7Kmw6Ctfqm64/c4NLjK6jF06sKG
	DGtn97oV0pJ8IE/WExDM/MZOtWadeE9DkVpbCLXhwYKR5TvV2YPg98vE2urA9x7335l9nzkk7c9
	2lqCzfrqA5UR8V3jUVJTpiFQ/xEBKoN6wgNi/QyuTxtg2rfdmYHdCo9bpbuEK8sp/uXVmPFG8lC
	1xHy0d00Q9dvpx9Z3ncwCCF31I8YSx0/dcPb8lMMup1HooPL9YI5xgpwMvhmxHfBRd+xrG7zsI+
	Lg+vwlf4Ys/68xK/ljd7QNMmHrhSrzEZzGqkAueJHMIdYu4EdHCSl6C1gFMOAmFha1/Nhrlfgrq
	Ug4WY4jyRamTX5TXjM8UOvNrZjLpMFo9VMSMXsRXcfCUS8Zs1NTS+I5/+j6rjabN1+NRY4XuvWX
	jjCr8KP8PitjmhooI9EsK5OBLHKhWUKwd5QjBYF+IuUkc=
X-Received: by 2002:a17:90b:1d4f:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3903c5381d6mr27967961a91.5.1786177913049;
        Sat, 08 Aug 2026 01:31:53 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de9f6asm7623040a91.7.2026.08.08.01.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:31:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: imx: scu: fix autosuspend cleanup on probe failure
Date: Sat,  8 Aug 2026 16:29:33 +0800
Message-ID: <20260808082933.2692878-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_clk_scu_probe() calls pm_runtime_use_autosuspend() for non-CPU
clocks, but its probe failure paths do not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
failure paths before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 78edeb080330 ("clk: imx: scu: add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/clk/imx/clk-scu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 9b33df9967ec..6d29fcc2306d 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -542,6 +542,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret) {
 			pm_genpd_remove_device(dev);
+			pm_runtime_dont_use_autosuspend(dev);
 			pm_runtime_disable(dev);
 			return ret;
 		}
@@ -550,6 +551,9 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 	hw = __imx_clk_scu(dev, clk->name, clk->parents, clk->num_parents,
 			   clk->rsrc, clk->clk_type);
 	if (IS_ERR(hw)) {
+		if (!(clk->rsrc == IMX_SC_R_A35 || clk->rsrc == IMX_SC_R_A53 ||
+		      clk->rsrc == IMX_SC_R_A72))
+			pm_runtime_dont_use_autosuspend(dev);
 		pm_runtime_disable(dev);
 		return PTR_ERR(hw);
 	}
-- 
2.43.0

