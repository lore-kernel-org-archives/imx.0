Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DB3472F8C
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 15:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191298; cv=none; b=K3h5uc864urujG5T8xcYw4EUCZedCP/gIaEhu8ejzbSbOb/nuaqgOBGzRx6n3Jzh2W+BttuYZ5mcPrxscSMl3Dgyx7VHPgvosNGjKN5xZvzY7u7xMIXZPt+i9nEWzMij6lJLg5z4UJt+d80bFghbJ8L2OsYLE9dAkvZFpDEr1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191298; c=relaxed/simple;
	bh=nlCxMmVRBCR3ngQYUpa889Txd4ozU/oUdzTV9qa2+co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eF2yX6Z+dVZU0ZMqoRCjOJhdwvDU9siiCYY5MyJ9Yn6gnaIprC+q4HbNzAXp0rNtcRgklOZEyPX31JlQxUgtlQrrv4kLnCW5hAcHL6F7m+dI1tpFBHUAml+cBiXRwdZ8bKC4T0kIfxHhgiXpKlqLw2f5v52FbmYCSXMYlSsVG+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GIZpgPL/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GIZpgPL/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so35592415e9.2
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788191293; x=1788796093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/h+0+I7fXQ52AgonO29/UsUwGiBzhMLYBL0Aiheh2c=;
        b=GIZpgPL/57spBl+BAB9sWvtrN1T2k9QHFkl8s82YlzdsSZm4OznLHkfd3YJHK7iNJS
         Rnb9E15Ry9LhrGSDns4WJG5Cz3GlrIEWYBupMp5pIRY6ue+1k6ocjx+seAM4TVn6nzyj
         xq8jqxiuUF64IK3+H8Gr6XXiaRhXdvXmxvFpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191293; x=1788796093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/h+0+I7fXQ52AgonO29/UsUwGiBzhMLYBL0Aiheh2c=;
        b=O6DSCfbdKLaoEsHURLECVzqmfNU7V8mo0cSjUbWyKd8olLXRDfuanryNnfWmO4IMjJ
         2FYoLhOwZmx+f31kRr2AkI//JM7R1LhPWL3phqtfokiMV7cw3j7pq/CZMqOqNnlMHaZt
         K16+20ssrcrWqEpNrSp7BPV5im7JuzDciy9NmBw+x0dPn0YeEYp2KfeOLXx0k1S0dKc+
         tItvSumlGOwC3RAVFAln7iNkAJSb9MS9foHOJ1ZTbDipdX3u1rDx89z3h/zRRUIHrQP+
         g5B0JtTgzYMO1Y6AvwmiAjMmwamxRDUWN8XxDvP5I16C6yWC0AeqEx27V6gKQzgefJjd
         UA0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq4T2cw49CNky+ZFbm8tWKzX72jE9eQPDATALrjky3OxeAi82Yjn4ZNXtcjihFjgdzIk3o=@lists.linux.dev
X-Gm-Message-State: AFuF++lS11oOTb3pxUwzYwcU2YSTP4stDfE1N+R2Eq6nrfxROlKtDlMc
	guVANuE+zab/QwhVBVg2hp+6bUT4q1qlsRu2JvvBau9i+KYaiXSmYJ7SxPURsLiS/J4=
X-Gm-Gg: AR+sD12Ynq0G+oWEJvwTcDUaifdhw6vk9UX5lovPSnSztp0+KwgkfT6Pv/Na/uWEkhZ
	zFntWUUezJZMrgLdpUawYxRyjHS6cvILQZLGJscZpJ36BOww2sO1sCZ+qFm1bIEfAV365UN1Ugv
	dCSYK0HfcD3ObjFRboYc8u+IEFe/8ZUtG1gxCsgqGEk2QPLPOf3UlOrNYbrZKRsIt+clSkhCq3a
	yEHVfWMKjbqIBfPuJUEWAuMsfaT2dL1GEK4o4UznMcTMQpHEwk4Nl2KOrl+AcVJ+lzNvglQKQxh
	KQWpENkEtMWtc9bNhvT5NOuIYEpdlhmoKwd1lwZthHoBDpRBYicO5SuvYcMf52a8oOgNKFgNvuT
	nvNTXpwxXix0sMsgvFKflCHz500pblTCspYqgQQ0QmHRczABDDt2rbn1jTxlWJlvjjAqYyMolTj
	5+U2vV8oMEYg+msWkHfibfUIn4x+CABjunrX/E1rEzXc0KVhPC5K52fW8cDUcIcdzZ0l+ojYP8X
	hjUhDZReQLF5xB69OuS2zI9QJP5rsdltrtjUlZXKLVSeXeL9dUXV4Zo//f0fk4IPzhDTgKjCojx
	zDu7sRM0qWro9g97m7zngi29bJ/xwamj1+Zex0ytvjVqxNcYqgjswWZYf2Sd
X-Received: by 2002:a05:600c:4e01:b0:49c:cedc:768a with SMTP id 5b1f17b1804b1-49ccedc76a1mr324658675e9.16.1788191293295;
        Mon, 31 Aug 2026 08:48:13 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9269f1b6sm220191845e9.4.2026.08.31.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:48:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 1/1] clk: imx: pll14xx: support spread spectrum clock generation
Date: Mon, 31 Aug 2026 17:27:01 +0200
Message-ID: <20260831154752.15401-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
References: <20260831154752.15401-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for spread spectrum clock (SSC) generation to the pll14xx
driver.

Tested on the video PLL of i.MX8MN and i.MX8MP based boards.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v10:
- Drop 'Reviewed-by' tag of Peng Fan.
- Adapt the driver to the new infrastructure. Implement the
  set_spread_spectrum() and get the modulation parameters from
  struct clk_spread_spectrum.

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan.

 drivers/clk/imx/clk-pll14xx.c | 58 +++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b6f1cc9f5700..27a637847f57 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt) "pll14xx: " fmt
 
+#include <dt-bindings/clock/clock.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
@@ -22,6 +23,8 @@
 #define GNRL_CTL	0x0
 #define DIV_CTL0	0x4
 #define DIV_CTL1	0x8
+#define SSCG_CTRL	0xc
+
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -33,6 +36,13 @@
 #define KDIV_MASK	GENMASK(15, 0)
 #define KDIV_MIN	SHRT_MIN
 #define KDIV_MAX	SHRT_MAX
+#define SSCG_ENABLE	BIT(31)
+#define MFREQ_CTL_MASK	GENMASK(19, 12)
+#define MRAT_CTL_MASK	GENMASK(9, 4)
+#define SEL_PF_DOWN_SPREAD	0
+#define SEL_PF_UP_SPREAD	1
+#define SEL_PF_CENTER_SPREAD	2
+#define SEL_PF_MASK	GENMASK(1, 0)
 
 #define LOCK_TIMEOUT_US		10000
 
@@ -44,6 +54,7 @@ struct clk_pll14xx {
 	int rate_count;
 	s16 delta_k;
 	spinlock_t lock;
+	struct clk_spread_spectrum ss_conf;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -366,6 +377,37 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void __clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					       unsigned long parent_rate,
+					       unsigned int pdiv,
+					       unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct clk_spread_spectrum *conf = &pll->ss_conf;
+	u32 sscg_ctrl, mfr, mrr, sel_pf;
+
+	if (conf->method == CLK_SSC_CENTER_SPREAD)
+		sel_pf = SEL_PF_CENTER_SPREAD;
+	else if (conf->method == CLK_SSC_UP_SPREAD)
+		sel_pf = SEL_PF_UP_SPREAD;
+	else if (conf->method == CLK_SSC_DOWN_SPREAD)
+		sel_pf = SEL_PF_DOWN_SPREAD;
+	else
+		return;
+
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &= ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	mfr = parent_rate / (conf->modfreq_hz * pdiv * BIT(5));
+	mrr = (conf->spread_bp * mdiv * BIT(6)) / (10000 * mfr);
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, sel_pf);
+
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -390,6 +432,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv,
+						   rate.mdiv);
+
 		spin_unlock_irqrestore(&pll->lock, flags);
 
 		return 0;
@@ -411,6 +456,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
+	__clk_pll1443x_set_spread_spectrum(hw, prate, rate.pdiv, rate.mdiv);
+
 	spin_unlock_irqrestore(&pll->lock, flags);
 
 	/*
@@ -437,6 +484,16 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
+					    const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+
+	memcpy(&pll->ss_conf, ss_conf, sizeof(pll->ss_conf));
+
+	return 0;
+}
+
 static int clk_pll14xx_prepare(struct clk_hw *hw)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
@@ -509,6 +566,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
+	.set_spread_spectrum = clk_pll1443x_set_spread_spectrum,
 };
 
 struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
-- 
2.43.0

