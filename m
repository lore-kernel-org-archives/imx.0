Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF50F3A3E68
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786176154; cv=none; b=IQnuhZBmR7Xw946TIN1K6UmVbzlgacnJAQCrhc157CvgORBrzbjCIVUIHMhloO8w3GpiRGXEaI8UAfzpZDygD7LKAg4+dSFXtt7kREVEiCIzvwy57+DcQiLkQ5UGH/QZpyAQlQlYJrZoZLgrciZVNsTzf/V7348LnULxgQT/unQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786176154; c=relaxed/simple;
	bh=Qtiy299hgXH9miMRATmDtFVX36AP62Lyow4p85Fjtoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPuFsIPh+uzIXubsVTMpvmjd805qAO3fxLYQxnDBlgxybEwaH+cHJckKlPfR/UorgU0xz0bRxpH1PTEqKhd8BDH8i9WIwXmtg98evC8FUw/ZH2qZSYN68nr5yTjWZke89Rq07Y7hRj92HzLdv5K1ViQf9JTb9bKDO18GdYgcI24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9OD+GT7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9OD+GT7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf27856f9cso3884705ad.2
        for <imx@lists.linux.dev>; Sat, 08 Aug 2026 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786176152; x=1786780952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLmbCLzuywYLsOVyyYkrBNI0Jw0ZVFv5psG5aDAHyEg=;
        b=i9OD+GT7yrpRc29faVdnMO0XlFLmmWnpEnW4e7EQQk+UM/0wJZqChSsKrdNL/FWO8r
         iUkapTllIr5aWiclQhnMxxa/YADVEVau5j9XxaJXFLFJ45NYyb8tBFBXBZ6EMrWwts7M
         kaNjm85A8NLazbjhi5c3ueGi6hvn8Ju1WpCtSgWLpji9F4N8U2RSl0RSytqCBKfrQaLs
         3kfv1InN6Ig4UVucNvlcMEtyO28FfiPvDmk6q0vdFckmb9iTTnlL6/17pp6+fOcc2H34
         bTwp9lChKPMg2KY09RhkXVcbIf2oNgvzuJE7Zmzqh75AaL7poqBfPWMpc4FqfzvZKue5
         WQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786176152; x=1786780952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLmbCLzuywYLsOVyyYkrBNI0Jw0ZVFv5psG5aDAHyEg=;
        b=MhMHcefK771D7hnZPBN8qvb5tN/moyOjzM854TRIgnhYhWwK5ERLmA4sNbeaN7IKXh
         wdTlCJ7IgMoCrQ53/vBRTTAZjHo1AbVfOUzxnk9GZD3cohYLvC9b2KAMnp1DggMZYg8b
         5N05MxaBHfge8M5lbRUik5xpsmFplr2Y5YpBLI1SD3DIx6bMqaJEXw52c5mz7F8uEw65
         im1liQ6PhErjfTRskcjjaN2+ZQK+qhxRMtw2+tMTWo/xu8uHGkzfrGIVac6pITDfvSVn
         Oe0kn8+52ubycUl+e/TZFDNgNWHe3QhXvec/eCJtrR94Rzz3OX6jcI0q4k1cJoQepXVn
         LEJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHYtU0NNIBhdus5s0gnEwa14lVykIIE5l4GZ4woqMP8xQIeumuOETsxEXUh7tVMzBhJrs=@lists.linux.dev
X-Gm-Message-State: AOJu0YydtUTDK+5qLQh8oL5jWiTXV97f0xyEamjS+NXUR4jnrUQfJ2j8
	ydw5UgH9BirEamk4TTS1qWu2m8kRos3bApqJQ7fGi8Lfl5QcNOlhVh5H
X-Gm-Gg: AR+sD12gn4JhZQtin37TUoLx2yF0hdRukGryCD3FbbALY98n1W0KDPZbAgIdeOfcPH8
	cTWKLKlCCjhsdiODoo85Z4pYCS2NCN9REuck1VQDeyd3njna/gsjOh3pB+BGncn/kavKoYDMFBH
	QN3ROJ5h5T6wIgxAQ4MPmBvsHslM/g83huYWNy4sbNgRABOsgYlmhGOXbndOX3gPAJ0TfaGrvio
	hKp7KEjvxLGC8vITADduWZCxAlE1YohprwhwDsMZaq/SzEOTGQ2zeMQ62L4RJ1Y0nHkh22xkw/C
	JHehBuZkjmNS8Tge3kmiDEdAQYtHV0VZqz0CKgBn8L7BhK8N+TqJzWDM2JlDAuI42V2qXmeSP7h
	1xDbNeaWsjqUsiJjkah06OkgTaGSgxbRYMMUGowKMRZ2GvJ0S7JNwjQrn0eySSN2inzUT/T1yMb
	+1JENsFM4ZtHXKp/0XyQ24j2GvNTpoS+Xlj9UQaumj9Jk757au0V2hT8KpCQXJh6aADYBuHynX6
	g9j3P7V
X-Received: by 2002:a17:90b:1d02:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3903c599356mr29221904a91.2.1786176151990;
        Sat, 08 Aug 2026 01:02:31 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm7774143a91.6.2026.08.08.01.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:02:31 -0700 (PDT)
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
Subject: [PATCH] clk: imx: imx8qxp-lpcg: fix runtime PM cleanup on error path
Date: Sat,  8 Aug 2026 16:02:15 +0800
Message-ID: <20260808080215.2669452-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_lpcg_parse_clks_from_dt() takes a runtime PM usage reference with
pm_runtime_get_noresume() and enables autosuspend with
pm_runtime_use_autosuspend(). The success path drops the usage
reference with pm_runtime_put_autosuspend(), but the error path only
disables runtime PM.

As a result, the reference taken by pm_runtime_get_noresume() remains
unbalanced on registration failure. The autosuspend setting is also
left enabled instead of being undone with
pm_runtime_dont_use_autosuspend().

Add pm_runtime_dont_use_autosuspend() to undo the autosuspend setting
and pm_runtime_put_noidle() to drop the usage reference on the error
path.

This issue was found by manual code inspection.

Fixes: 18cdbad40c6c ("clk: imx: clk-imx8qxp-lpcg: add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index 1dae3410ee99..262645bef62d 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -277,8 +277,9 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		if (clk_hws[idx])
 			imx_clk_lpcg_scu_unregister(clk_hws[idx]);
 	}
-
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 
 	return ret;
 }
-- 
2.43.0

