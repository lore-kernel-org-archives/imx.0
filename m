Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67778268682
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388196; cv=none; b=sU+2c28BEex8JQEPrO3qCR/d/YpIdm2sw0zjQ2AKO3zmJFwMvoj6hKFpteZmA5TgM3MqHTycz+iwSEmvEo1+mEPKVujwEGiOYvTrMGtIOle6S+hzpsxlTiKGGsZvjraLkkOx1AS6sBSDUqbwi7S9yGlDXDai1UGv189gzm8KrpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388196; c=relaxed/simple;
	bh=2cbL/UoMZsHKenEkqVA3bsu+mxjHyTBuUjF0+bypM38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asGIrCpda1jHcfbjD/5BrP22PYFhS64liGaRU72n2XoYrDKmaMQ8WJ+05TQol4cq2n6By0uBo/vhEa3gE5vu1qg/QW2LlAHpZ7qX3TCSCmAbbtDDN3A24nOnyYYj55BMY3uhWrCqNMRg7dOsvfJJJZPZxhZFRG6izTRSBnG8Peo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LN3KkOk4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LN3KkOk4"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso9901648a12.3
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388192; x=1745992992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=LN3KkOk40qIl7sXzSeIa+byGwoK0Ftx93vl1GkPkm6fyU6mAeabmjHNoO1ahaEME+k
         ACwBk3xwSfJhOOyypRrfwCoAT1D1ugBP4FlZOnlE0fu5ouodT/gA60rykr8hOimF09FZ
         VYUZU9r59HmllvhY17VfaHr+PBBZ27zYHQIt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388192; x=1745992992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=BsQc2m9dKnV50Hk1P4Flt1rXOReKk5sxMp+VINJcOYXZ55xi+Lgz0/S+16U9k5Mr6I
         YL2HRB3x+xm2KPQcVN9OfMsjVNiDchUSzMmeg0bKezFP5wlgUD2JGi5FU4te6oo1e4Aw
         r8liWO08TvXuzhcMnEfpLOu6fBHwzfNQseAxKIx5uhavwRqH8hUf0U442ss5bEOz8vjz
         9eXQXyyK2BiWoxITDLFp8paE0B6pMYT50FV307V9mio9UZOMgkzmZ+5tDG86NpYhJw3i
         s1KK1ebIBgXPK72ywqptgcqnmBMQ0KN5Q74h7r66x5FUHTUIfsbJ0cB6g7Vm/FJMgDF7
         I4ug==
X-Forwarded-Encrypted: i=1; AJvYcCXSM00IVbfhUoUZYtVxZXP/DTv3B0hLXcCQRX3fr7kU8iYvRZgH75bqjKrfEwNpASNSsBI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Vy89S+ykfFjX8047UsvWpDAP8Ot6onXJZLa4Y6iwnNAPmKmC
	av5UJ0qxE0Dxiat/Hie/rVgce3tQHybqR37JDRf1sYl4Kacx854JI+Dj9fOM/sY=
X-Gm-Gg: ASbGncsTijlHZK+4KPQDhYJQ+7bIYa8OOUHNbAc55MOFx/7tZhh5IPnWUGW5QDD1gWq
	9rtaYtsm2iffjPMhr1S+Z2tjlFoPsYGruLZROsK1g5u38X1/WCHMnMyVR+9of21j7FBXnEbL+aj
	6Z1or4Si1qsQQ3fotRa6HLw5hj17he+YDRsZz4XmrqTqQzipPDbLACQ4W3+IQdtrooA517eUNbg
	ySYo9I2HewP2xZrDGM9ozmMarkmsxMWxlxQmNjsaWClMNJCHqVnkKRaLG2dN5XNWI80s75N6zRc
	Dz/01ipDJ/5TXgFJCaQuVcC/p0Z/bYQ+uCWXXUNwzZeobz7sbiPetRsk+Yr0cGujCLXTIA0HDrF
	72e56
X-Google-Smtp-Source: AGHT+IG9ZwINf1p8AnuBCmxXiuG1HeY2MVi7uyIvKg/QnRhdOn3/Wu5aQjRTNdLl1xCE330o96Hy9w==
X-Received: by 2002:a17:907:6e8c:b0:ac6:b639:5a1c with SMTP id a640c23a62f3a-acb74b5089emr1383851866b.22.1745388191664;
        Tue, 22 Apr 2025 23:03:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 10/18] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Wed, 23 Apr 2025 08:02:27 +0200
Message-ID: <20250423060241.95521-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v9)

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

