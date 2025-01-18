Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3CB1A3A8F
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204073; cv=none; b=OLNg+XJ20BOJehc9qqiL45k5CDy0r791Qm1oAp3kyyJeR7emn1/r2epQzArtI1DpTfDf9RV45eLGumztJw/6FrKHNmToMGCovkfToaIjJA/e53HL4G5FeMvxBfeURawtNY+D2itwfBmS+cZlbzqniVHkXW3MeLAjXolpjb3S4P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204073; c=relaxed/simple;
	bh=9GxDbQvN0FsobifitL/iQ8hAJbEhDXi2QaB7Iaq7RJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDdgzeoUlUQPPdC0iiqThhebeWfHBo2SZbMblkjPmoyNgy2X87Uf26YcX+GZhLWNO90gpWc7gcyuLd9uxR17n6dhsgfcCnwSTbwJbvllJQxvle2lAmLg2Ck/oNZfAqF2To9zkjf1wQALeLoPiWF1boY7P/zo/f018+wIMrl9ZG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=c0lpnUb5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="c0lpnUb5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so5047497a12.2
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204070; x=1737808870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjKk3n/EWVmeikEmbqzIG+MPD0szAgZhKNxV6SUP6YY=;
        b=c0lpnUb5dnXNah0ToXrOnpcnwBx7566SBFYJztaNLc2TVtJdT1PFjYbYz5t6ozRwac
         uoWLN3gtfEaPQoqszw6RU7y/LCAb02MWM/Ur8MtrbdeGgm8AmyLS8RVvNYbGPfM1ZVCQ
         HDBnHvx9gbPCQgg3/fLSebzrFbsh6Hp3V4A28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204070; x=1737808870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjKk3n/EWVmeikEmbqzIG+MPD0szAgZhKNxV6SUP6YY=;
        b=lKxREF/Af0Vglor4+yiERNpF4C7y8NSHLs+mI29spJ7hwK6/jGPbVDwWcuAht4sVEq
         No/V5mahmsuWTKCwZnk0CkY+tFpTXwHTDng3Mq2X4huv08XoB2XK5GqN7UjIqLO0FkXp
         TpaCTjPk9mvaMBZXQhl2WW4S2ZrscWvgY5pB/ocnHf6h2VkOATVdThEjsMKiDyKfkhcv
         AhSOZylIcar9WVGECF9Da33sNL2BvUfj2KMcqkKwI2lb/9+DXvSPWsGB4ugjxaV6z/PB
         3pyJZ+p7KdJmb4GlE3yl6KkzPAhJVcPw8/Qd89R5OfMLIOfFwLXuHPmyTV3cEIFid2Rn
         BnVw==
X-Forwarded-Encrypted: i=1; AJvYcCWcjq+8bqvAOt367UGK7L1D9gMaL7SEVNPdBSQYQRqR4xPvXQLlbGmYK9KBRwCzEpO2Bps=@lists.linux.dev
X-Gm-Message-State: AOJu0Yze8K1iWbpmcuZ8IJDjlI6r0Q22PqPtdtHf0tVfxtFXxZI3c1gh
	RI7QH/QkO7CIalWoi6h68gqRjMLxDEitQiQBeSl3AzdVHGEe6i5d4jtj2DvfVOY=
X-Gm-Gg: ASbGnctQuEwiXBMGVX+Pj9PU2ovGxvdW2+j0nRtm/hMQrIww2ZW8BKuZywtrgdsv50F
	K2pMJy5oq1UeN4ffA5seb2uWQreGzxn8G7/015VQvOMp3kAsf4957h4xxWvCQAmKMCmuKUPE1Qc
	Wqy+FOomFFhSbIAZTjj71gYLIOZuyWdWS5ZvtK3m7tINs7wcPd76LwpaVfROJkaJ3MihNNA/vPJ
	a+E8rbGAl47+iIMUejsmKxdp2qoqXUCS7PtFHgvywchKsJ3GGJDHRGnt/9tNLiheBuK5edn4vs9
	bNRx4mZJaLkmWZ3Z93ofXHavA0SR1pV+0fXYVu3YsqZRaA4SCnhcKuRALKUQzgUNuhP3i6xiGGD
	WmW1AOE3ixED+ayMVTEUpnJ9BuZMiRaIC9LW8
X-Google-Smtp-Source: AGHT+IG+E9QI4nYzoY+YN1QOMcP80jWKF/DOpc0bYiVCZW9BPZzE9/t7StCYdIbpqJGBKvVbQm3HcQ==
X-Received: by 2002:a17:906:c108:b0:aa6:79fa:b47d with SMTP id a640c23a62f3a-ab38b0b8138mr568616566b.1.1737204069853;
        Sat, 18 Jan 2025 04:41:09 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:09 -0800 (PST)
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
Subject: [PATCH v9 10/23] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Sat, 18 Jan 2025 13:39:53 +0100
Message-ID: <20250118124044.157308-11-dario.binacchi@amarulasolutions.com>
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

Get the hw of a clock registered by the anatop module. This function is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan

Changes in v7:
- Add device_node type parameter to imx8m_anatop_get_clk_hw()
- Rename imx8m_anatop_get_clk_hw() to imx_anatop_get_clk_hw()
- Drop the gaurding macros so the code can be used also by i.MX9

Changes in v5:
- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors

Changes in v4:
- New

 drivers/clk/imx/clk.c | 15 +++++++++++++++
 drivers/clk/imx/clk.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..a906d3cd960b 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,21 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id)
+{
+	struct of_phandle_args args;
+	struct clk_hw *hw;
+
+	args.np = np;
+	args.args_count = 1;
+	args.args[0] = id;
+
+	hw = __clk_get_hw(of_clk_get_from_provider(&args));
+	pr_debug("%s: got clk: %s\n", __func__, clk_hw_get_name(hw));
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx_anatop_get_clk_hw);
+
 /*
  * This fixups the register CCM_CSCMR1 write value.
  * The write/read/divider values of the aclk_podf field
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..50e407cf48d9 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,6 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id);
+
 #endif
-- 
2.43.0

