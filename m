Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352F41DE2CC
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204084; cv=none; b=i9YLHDryZm3sqR6y/6kmBI6A0Z7QZ18zxeZ3t1TPKeJ4/TkJOOLZdPrX5LuIJYvc7+r1zJ0mZI9jEy1yFM541zoWt/qHdhCZdyTGPqdjzGog3f7LHEuoee2Om+Igvn0aHzKEKI8qgMXn41Dch6F72H4k7Za4+VLJiJhlrsmNmpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204084; c=relaxed/simple;
	bh=QwSYYok++37LYEdsDoQCkwcsiEGqDK+06Bz9bDqOiPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8leZnd9XKztlOtNR1Y3zs8OP+wuQh/5fn3KH0SDDriqE7hnOV7jmnZcGSRrnzcGlf6JXCEWQhiQXYjaUtjFLqno1LADsO1irEr+dTyMjVfNBmwKr1R0SyINc28xqdoheVOM0dbT+1AfZziYh8jS/VwQZvsL75pzzdxqbsPDT8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HWI7YVa7; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HWI7YVa7"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso4861157a12.0
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204080; x=1737808880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzsVBhjhlmiF36sGbiHfZNPUdaBOg5gbMlUQSL+IAZc=;
        b=HWI7YVa7RbfUkOsznEI09gRTX/h7q6j28ENyfuqt6AvGF4sqH5Y/Fz3AvxmptECvOx
         OmKfIKGsnawWehHjzhIEub7Fy/NNhLhuUzN2LQFR7MqXQ+Yrkx72Tyj+hxcERcRlm0Qi
         WDmh+z4af7ZgknIIJIsZUNElsi2RGmUPiDDIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204080; x=1737808880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzsVBhjhlmiF36sGbiHfZNPUdaBOg5gbMlUQSL+IAZc=;
        b=T0OR54yJBFTOKjUaoQNR3ObTz40oKNeMInmiE+VjrBrvqlk0xywN2mBocX2RGDulr5
         FlV33zahEe4OfUkItqjS2ztXdKIKMfCUXDtLMz2EkOhbYqEtJP14T1I9Q8CAQ9I2euPN
         g6jV5nwEkK63hnJuWrm3pOxbEzBI9VCE9sAM4Bkf0bc/m96DeVIfm9DFJ/gZ4HIZG+6M
         nKrTWRKTP4Q0FW+fxsyTf0/75/GjgX2aYVrwoGfTqDL0oi02ccoJLe+aRJJJiicbiYtJ
         sTqzyxR80yeD3HhctOYAWQGOURZBK/8G7ERlYs/iDMXuxDNT8Jj1ocJ1Max8e9bSRkUS
         kgGA==
X-Forwarded-Encrypted: i=1; AJvYcCWLQVsAwG+7Kysdp55ILNQ+udj6JHzbNasZlSEHc+pwO25uxT3i+NaJhmP/lzvqS3vRAvY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq9Txmp6XybKfxClHwdLwG9MJGWkHaBeZLLkdw6e7tSTd58JrA
	gVax+Js2c06jIfKpR7J9c1I8OTbsjKx8iTDzUaMLSnzBC5BGC01aJDTo6sx+FV0=
X-Gm-Gg: ASbGnctIZkogJJHg4PJ5ZGoMdlK8LdoUXEdYz+uAoEu8msaFKoJFXYtsBTV25QtmfZv
	i0lIDmykFO5Myr/zaNShXaY/P976jU5J6pLJlfEfwFv/WAiZodvxsXmCsopNNFkIcyA7yOdJLWp
	fDYjIqGEvC0N8WcTHP0H5uCHT+WKz9IicCMRkPp9qBfBZd6has6UnMjC2zLbV/flLIIY3X8XzKX
	qpX1prZSs1TX4Ud3Z6L9tqOFZh/+Yt0UzMMTauWo3a7aWJHF7G3T/Coe8l0sluCaw2Yx7kBDs7W
	Ghpyr3lCMS/oDHG+7kpIbxbqC6FufGW9tcnhbqE3aY4P7gB+Pc3Tvrel3YO1N3xT7LCRua7IFhn
	05HwveinF/ynJjGuAD3xwh02agkaESLSgzSjw
X-Google-Smtp-Source: AGHT+IFwTZefCLnEAHREfI0q+AkHHvGjarLJxDYed6RIqE1d7qcS4+W6XRpeIEBJk5byH7zPe4b9dA==
X-Received: by 2002:a17:907:2d88:b0:ab2:c2f1:4578 with SMTP id a640c23a62f3a-ab38b190e7fmr567543966b.4.1737204080321;
        Sat, 18 Jan 2025 04:41:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 17/23] clk: imx: pll14xx: support spread spectrum clock generation
Date: Sat, 18 Jan 2025 13:40:00 +0100
Message-ID: <20250118124044.157308-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for spread spectrum clock (SSC) generation to the pll14xxx
driver.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

(no changes since v7)

Changes in v7:
- Add 'Reviewed-by' tag of Peng Fan

Changes in v6:
- Update the code based on the changes made to the DT bindings

 drivers/clk/imx/clk-pll14xx.c | 134 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk.h         |  16 ++++
 2 files changed, 150 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index d63564dbb12c..c20f1ade9dff 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -20,6 +20,8 @@
 #define GNRL_CTL	0x0
 #define DIV_CTL0	0x4
 #define DIV_CTL1	0x8
+#define SSCG_CTRL	0xc
+
 #define LOCK_STATUS	BIT(31)
 #define LOCK_SEL_MASK	BIT(29)
 #define CLKE_MASK	BIT(11)
@@ -31,6 +33,10 @@
 #define KDIV_MASK	GENMASK(15, 0)
 #define KDIV_MIN	SHRT_MIN
 #define KDIV_MAX	SHRT_MAX
+#define SSCG_ENABLE	BIT(31)
+#define MFREQ_CTL_MASK	GENMASK(19, 12)
+#define MRAT_CTL_MASK	GENMASK(9, 4)
+#define SEL_PF_MASK	GENMASK(1, 0)
 
 #define LOCK_TIMEOUT_US		10000
 
@@ -40,6 +46,8 @@ struct clk_pll14xx {
 	enum imx_pll14xx_type		type;
 	const struct imx_pll14xx_rate_table *rate_table;
 	int rate_count;
+	bool                            ssc_enable;
+	struct imx_pll14xx_ssc		ssc_conf;
 };
 
 #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
@@ -347,6 +355,27 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	return 0;
 }
 
+static void clk_pll1443x_enable_ssc(struct clk_hw *hw, unsigned long parent_rate,
+				    unsigned int pdiv, unsigned int mdiv)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct imx_pll14xx_ssc *conf = &pll->ssc_conf;
+	u32 sscg_ctrl, mfr, mrr;
+
+	sscg_ctrl = readl_relaxed(pll->base + SSCG_CTRL);
+	sscg_ctrl &=
+		~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_MASK);
+
+	mfr = parent_rate / (conf->mod_freq * pdiv * (1 << 5));
+	mrr = (conf->mod_rate * mdiv * (1 << 6)) / (100 * mfr);
+
+	sscg_ctrl |= SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
+		FIELD_PREP(MRAT_CTL_MASK, mrr) |
+		FIELD_PREP(SEL_PF_MASK, conf->mod_type);
+
+	writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
+}
+
 static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
@@ -368,6 +397,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
+		if (pll->ssc_enable)
+			clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rate.mdiv);
+
 		return 0;
 	}
 
@@ -408,6 +440,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	gnrl_ctl &= ~BYPASS_MASK;
 	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
 
+	if (pll->ssc_enable)
+		clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rate.mdiv);
+
 	return 0;
 }
 
@@ -542,3 +577,102 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 	return hw;
 }
 EXPORT_SYMBOL_GPL(imx_dev_clk_hw_pll14xx);
+
+void imx_clk_pll14xx_enable_ssc(struct clk_hw *hw, struct imx_pll14xx_ssc *conf)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+
+	pll->ssc_enable = true;
+	memcpy(&pll->ssc_conf, conf, sizeof(pll->ssc_conf));
+}
+EXPORT_SYMBOL_GPL(imx_clk_pll14xx_enable_ssc);
+
+static int clk_pll14xx_ssc_mod_type(const char *name,
+				    enum imx_pll14xx_ssc_mod_type *mod_type)
+{
+	int i;
+	struct {
+		const char *name;
+		enum imx_pll14xx_ssc_mod_type id;
+	} mod_types[] = {
+		{ .name = "down-spread", .id = IMX_PLL14XX_SSC_DOWN_SPREAD },
+		{ .name = "up-spread", .id = IMX_PLL14XX_SSC_UP_SPREAD },
+		{ .name = "center-spread", .id = IMX_PLL14XX_SSC_CENTER_SPREAD }
+	};
+
+	for (i = 0; i < ARRAY_SIZE(mod_types); i++) {
+		if (!strcmp(name, mod_types[i].name)) {
+			*mod_type = mod_types[i].id;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int clk_pll14xx_ssc_index(const char *pll_name)
+{
+	static const char *const pll_names[] = {
+		"audio_pll1",
+		"audio_pll2",
+		"dram_pll",
+		"video_pll"
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pll_names); i++) {
+		if (!strcmp(pll_names[i], pll_name))
+			return i;
+	}
+
+	return -ENODEV;
+}
+
+int imx_clk_pll14xx_ssc_parse_dt(struct device_node *np, const char *pll_name,
+				 struct imx_pll14xx_ssc *conf)
+{
+	int index, ret;
+	const char *s;
+
+	if (!conf)
+		return -EINVAL;
+
+	index = clk_pll14xx_ssc_index(pll_name);
+	if (index < 0)
+		return index;
+
+	ret = of_property_read_u32_index(np, "fsl,ssc-modfreq-hz", index,
+					 &conf->mod_freq);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32_index(np, "fsl,ssc-modrate-percent", index,
+					 &conf->mod_rate);
+	if (ret) {
+		pr_err("missing fsl,ssc-modrate-percent property for %pOFn\n",
+		       np);
+		return ret;
+	}
+
+	ret = of_property_read_string_index(np, "fsl,ssc-modmethod", index, &s);
+	if (ret) {
+		pr_err("failed to get fsl,ssc-modmethod property for %pOFn\n",
+		       np);
+		return ret;
+	}
+
+	if (strlen(s) == 0)
+		return -ENODEV;
+
+	ret = clk_pll14xx_ssc_mod_type(s, &conf->mod_type);
+	if (ret) {
+		pr_err("wrong fsl,ssc-modmethod property for %pOFn\n", np);
+		return ret;
+	}
+
+	pr_debug("%s: SSC %s settings: mod_freq: %d, mod_rate: %d: mod_method: %s [%d]\n",
+		__func__, pll_name, conf->mod_freq, conf->mod_rate, s, conf->mod_type);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(imx_clk_pll14xx_ssc_parse_dt);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 50e407cf48d9..38e4a4cf253d 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -69,6 +69,18 @@ struct imx_pll14xx_clk {
 	int flags;
 };
 
+enum imx_pll14xx_ssc_mod_type {
+	IMX_PLL14XX_SSC_DOWN_SPREAD,
+	IMX_PLL14XX_SSC_UP_SPREAD,
+	IMX_PLL14XX_SSC_CENTER_SPREAD,
+};
+
+struct imx_pll14xx_ssc {
+	unsigned int mod_freq;
+	unsigned int mod_rate;
+	enum imx_pll14xx_ssc_mod_type mod_type;
+};
+
 extern struct imx_pll14xx_clk imx_1416x_pll;
 extern struct imx_pll14xx_clk imx_1443x_pll;
 extern struct imx_pll14xx_clk imx_1443x_dram_pll;
@@ -489,4 +501,8 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 
 struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id);
 
+void imx_clk_pll14xx_enable_ssc(struct clk_hw *hw, struct imx_pll14xx_ssc *conf);
+int imx_clk_pll14xx_ssc_parse_dt(struct device_node *np, const char *pll_name,
+				 struct imx_pll14xx_ssc *conf);
+
 #endif
-- 
2.43.0

