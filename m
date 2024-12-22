Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31081B394B
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887173; cv=none; b=fIU4iMphAbMusBnXTd82f7qC2JWSdmdQrBDe0xdy6rfcaVzBA8UweTQ167iw3Q77dkV2obUZO/V15tjq/zPE9CUzvwldZZS3AhS/iqTRPEmyuTabDbMyBs/82HDTvE1bkh0jfaEJSP1s+A/CQHwdsreVzu+ijQjw6KpwfXMZr4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887173; c=relaxed/simple;
	bh=DWiZHSvnzSZNOtyCyrajAvstVI8O776ZjxDLbPBQiJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3ddZj6gYtQGUtPN+IgYsCadnbJtdmOlDEMrPYBnU9OwW0l9tbgF/+FunjEDVv3+GqEOWnjoD2mm40NSet2IfNd6M903vcGAM1x9CPWMOd1OpL3eDPWcp03xDhdFz/rT9Up9vY1GfKgi3OtgSb1ut/TGhQ4XOdJw8lJqcyAxhd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=T0QWGrMY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="T0QWGrMY"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa67333f7d2so544725666b.0
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887170; x=1735491970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqIvltahhRDuJ7U9kepGituOp6saQuOpjRV8BXhF69I=;
        b=T0QWGrMYi0YptOBmRo7ZfobzBilJAHNWnes7ZYqDQSenGr1a97e5IWB+kBF3Dal+Np
         tYcknHXuiEVO8bz9aiwINTUAr0fp4BDxgVS3ui1PF1etzEYalKxCS2VUy+w0ld8UqKaH
         DT88YiX4dbf9zKiPB7SyZmBu0OOfmefkJuumE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887170; x=1735491970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqIvltahhRDuJ7U9kepGituOp6saQuOpjRV8BXhF69I=;
        b=KG98xpGhTsL0eL0VPtsq09dQPB08n4IdqFNoTfac50mxcIbZz078zQXbtxUcMwo6IT
         HpiAZEQjq4D7d2BjObsZ6iJpmBEmSqC/ngmEW5pRlEf0W1OV/V5f6+VrnpHtetsJtM9U
         XQiCbDn753mJDmIp/OKr0w+aDIias696Tol8oaWbx38/V1lCYUQzbX+CX71d5/ef0VxD
         TpO9iQmwVbyuQxZPWJwGPjtshHqhxeVWUVqZoTEH9dtZbJSrAs3AKehz7yZ9pvStMlSj
         gnbNB+WlfQKuKMsdPU75hx48BV9K+f4ewGWtAoLz9rmL8Q202ONVHyNQw9LV/9Wi9+oR
         sOsA==
X-Forwarded-Encrypted: i=1; AJvYcCUDcaxCRBL/HD0FZBXfswDMo3ODZfbYjsY/gk7MHt+UUgpvhq7WoKYr2x6D9H80497Be80=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfoF+4b0p2LhV1p5xRvQp3X/EgRjDMfBtqEiJoeKbH62qP1I6w
	MniQ8NW3Bjk6YfX4CGfVCiH3ue7SP/1Ap0GdDoLvweP5KzRDorSgPZ9daqGhIFY=
X-Gm-Gg: ASbGncsxM2M67qMI2GQJgWxQE2Qk/kfa1Uu4IkpAIaKPNOw6ZVQ9OprcMZc5sNz4LA6
	xz10hT4jE48rA0U35FAGQBxXPMwEDaA7O4t+2fpRgYRshq+Nyw21OeN2XYWzCgwnC+oYf71xQVL
	NucoDCakDPwe8la8QsMTMh8tjWZ0097Mmkn6Zrpbyespd1sWPO0iKEwU53LU+bGR5+kScIwFZ/t
	XoyeCFLw5+UT/mlf5V/NDrXkERi+pPkfBDmowupoejRcWVyvytjjrU/b/Xgz7f5Uw4xB8uzqvOx
	WG06RJQN+d4/7rTSJXcD3A3CcFxV+ZPsHGOzn70LlEmBxw==
X-Google-Smtp-Source: AGHT+IFV9R9EEgiujO0xcRDOYTPVnpJtPFpgGTe+WQcfGBiloBzD431Y5500IoH8/mRCSSWY5qYl+g==
X-Received: by 2002:a17:907:7e8c:b0:aac:2128:c89e with SMTP id a640c23a62f3a-aac334f31fbmr1056581066b.43.1734887170206;
        Sun, 22 Dec 2024 09:06:10 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v6 17/18] clk: imx: pll14xx: support spread spectrum clock generation
Date: Sun, 22 Dec 2024 18:04:32 +0100
Message-ID: <20241222170534.3621453-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
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

---

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
index 52055fda3058..edd28b78b115 100644
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
@@ -494,4 +506,8 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 struct clk_hw *imx8m_anatop_get_clk_hw(int id);
 #endif
 
+void imx_clk_pll14xx_enable_ssc(struct clk_hw *hw, struct imx_pll14xx_ssc *conf);
+int imx_clk_pll14xx_ssc_parse_dt(struct device_node *np, const char *pll_name,
+				 struct imx_pll14xx_ssc *conf);
+
 #endif
-- 
2.43.0

