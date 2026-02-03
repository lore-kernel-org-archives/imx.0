Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D730EF84
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770127699; cv=none; b=scHdGnC6nIvsCueclm33bYNrfiKHYoInVpQ30MhU8ZGyf/5rsOPcbuCffon6k6KWo4+xsSCCuoLZ8LgiXWTNHvYJL5b4pYpPk2taUyw06pUBdAnLB5u6zPRgN+x9QPlqV8R2or+k9igSld04TF9sd5uc1BsM/um9O9tGUQlOPrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770127699; c=relaxed/simple;
	bh=WD9h0fFVKsfX86DefFgHgmW9sLJVVxtbAMFvxApruCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WnFbuftDimkG2sHgPCeRSIbhQGRd7NQ8jyaahFsdpOHRmKbx2orv9C3gMA2DeaTxuxjPn6dzuj/oXaOxzm7Usb+McUr1pwhgJWiwpIsZ5lEPtJaNz3q5kvjlRrr0RuMf+hj5ljOjT0uBrwH+FyrA5xONgzApqVRBwfrZw5ZtwQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1iVSpn3; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1iVSpn3"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso3593545b3a.3
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770127696; x=1770732496; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEVDyNGIeHf4pNw+X2bXrhjpf8wdFUs1OWtMdxxb5PU=;
        b=M1iVSpn3iTFgL3Y8vqia+vm+YK5fZxFS6KGj9s5jA4V60/xd7u1owD/Wvv95Yq3Q7F
         eBQ5uqYjdg/FKnNOeMX0FVKcYqp6Vdy5/ULlk9IXUaDTN3fEmk6aMxz3fVrFThmJjfKE
         sqxBAGMPtemDxzYi/Sk7sLHrDs5UCteuqi+d20ODzZGK4VcbMZr3KaTL8F6fv5jQYJ2K
         Q1LN1kqP8saetPMh9tn/jjBqb0qyuCpvgCFaVpj5TfCM21UIg9Z/ebq2V/LwFS19M8y0
         4sbLRPkLiuf1mcaAQtSXj6/Q5xxHhi0Y9NzGCTBS4wLAWMlzkNT5hm4dTnUnCB6+5jgK
         4d+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770127696; x=1770732496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEVDyNGIeHf4pNw+X2bXrhjpf8wdFUs1OWtMdxxb5PU=;
        b=U7l6v3Dl1RxqyENZeEq+wguG6JEM0CZOZ3lsDuk7w2vL3QYCXQ1Jjhup50NT5wriW2
         ADPUNfD2oKk6QTKk6ztT45+myxVQD/GkrwizbhvXXAM0IdbtUpZH8uEm+rTrO9DVli01
         kHti227rkoO6D/NrfO9oQqt28zM8b82A1bnpFus+jTtOeavMlTyLY4peAyeml/vrzida
         F+VSSUzlVSJD2wFaUPzk/TiKdFIiPSbNI+mBFA+WSUxcVurul7wDd7qV6efmG2EnQtZp
         75Rz8m8nmdxBbv7my9qrR0IoAxNHZ6g+7jl8Vob23eF+0gdTg2JoeUO97J2WVTOJhK+o
         zuHA==
X-Forwarded-Encrypted: i=1; AJvYcCXtJxafVXhYiihawJZ+yYfw5LykjQD5DCipvleGL8+g6glPjwjpRE+RK3SlSAXVysqrgQc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt/ltA9NcMtRkwnjZTcQC+Qh8A+M/CwF1bQQ6ipTOtDWqARHPv
	Vq+LCH2ByWNdoH5wgFxiqUpsG/DiEO0g+WyueMEmUYZB7dXHJwhxmX+4
X-Gm-Gg: AZuq6aKVFsNlvcDQaFKQWgrBp8QqBzAMGaQclhBG61z724FSrILXCGm8VUuTqi9DuAR
	UB/99Hvpd0szgRsu8ofRoxRcpjqim/HsHvEzD5ER4oe0SzpfM5rgj4MdWQ7p1dbLMenMMOdWlvU
	Sp+ctWPm3ktoJnoeBiCTYaA7TwEOHxsTYXyRrodt1JJA/Gbuv1VeYyyO+Vml9iQFBk3HDt3iWle
	SDmRD1HTuoBclk91M7UyuqE+YNcbFSexQz/YL7sY+dLgs5EuAbbu2jTNku74VcrV9tJ4+GTqzr/
	KMrrCfDCoVpxEBF6iYW875iFnXjVFIAVQBKu1JaYoAxK73xRh7cVqE/BPnyOME3q44d5dTzneFq
	9+nxjlfazPwHHuV2zgvvP+FgapqUrjfM5OAe2IPaeuZvd3Y9u4qikXHwBiuH+irfFNikiuNjLUf
	a8zVD/GFNPNo3T5CTea6O9/ca+uw==
X-Received: by 2002:a05:6a21:8888:b0:392:e81f:6711 with SMTP id adf61e73a8af0-392e81f696bmr11458034637.8.1770127695989;
        Tue, 03 Feb 2026 06:08:15 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm7694684a91.4.2026.02.03.06.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:08:15 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Feb 2026 22:07:57 +0800
Subject: [PATCH v3 1/2] clk: imx: imx6q: Fix device node reference leak in
 pll6_bypassed()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-clk-imx6q-v3-1-6cd2696bb371@gmail.com>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
In-Reply-To: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770127681; l=1359;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=WD9h0fFVKsfX86DefFgHgmW9sLJVVxtbAMFvxApruCc=;
 b=wXAWXX5AmnINy0EhIfleVbe6g2DbP1E2ngkrqcfESd6zIOLTsamfvNCQ5N2/Z0tXObOxAKayW
 41Nf1MuQstPCrduCmw3LSegnipFmeLm3NxmMflgZk4fI7MuO3mnAE0h
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The function pll6_bypassed() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing
a memory leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
v3 changes:
- Fix Frank's comment, add check before calling of_node_put().
---
 drivers/clk/imx/clk-imx6q.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index bf4c1d9c9928..ba696cf34fe3 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node)
 			return false;
 
 		if (clkspec.np == node &&
-		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS)
+		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS) {
+			of_node_put(clkspec.np);
 			break;
+		}
+		of_node_put(clkspec.np);
 	}
 
 	/* PLL6 bypass is not part of the assigned clock list */
@@ -249,6 +252,9 @@ static bool pll6_bypassed(struct device_node *node)
 	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
 					 "#clock-cells", index, &clkspec);
 
+	if (!ret)
+		of_node_put(clkspec.np);
+
 	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
 		return true;
 

-- 
2.43.0

