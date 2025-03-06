Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E2D2040BD
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260650; cv=none; b=Efyc+602zTHmTy3gkndbK4djhDQ6KSpDISevQWCS1fFQtneqQkn1Sk0JeKckiatHlOmUvvc42YRLfRg0P8PkseWn3tWDxVpnxTvm7JnwA+u6cht0ERJj5nH1v7TDSlpi3duPvV1IZOy0Zy8k0ZmvQhTTC7j9mp3JvawZHxWhCIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260650; c=relaxed/simple;
	bh=2cbL/UoMZsHKenEkqVA3bsu+mxjHyTBuUjF0+bypM38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DjZIpyLkJ/oBUyVBbGanf8OLemhnsLLHK/AKjwkHXLleEiCMgMiyXbOrxmdB7zlt2XSddA9qye1CAxXPetQhersfMkyZdz6/Byld/cx97t/yp3e9IiCsugzoSXErXrpnEYrYCD0xAhYGWOe0y9OuP6RFyN8Y62lPQb7Ys5jVUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bTd4E2wQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bTd4E2wQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bcad638efso3039225e9.2
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 03:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260646; x=1741865446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=bTd4E2wQUEcAjzQxiciTHfzpJ4MW3jB6KOUAseRRsPkHtDiIm3HMHpxmGFfBjl/nBD
         BLvkTO6gyb7tM4oALPMEUqIH7gr/xHKvo/0E/0B/SU3CWumUOLKImK+WmJyqUgmBtVFK
         SW9K0lXbbX+P0p9oGJy1uXiIxJefCTzYpVWQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260646; x=1741865446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=iFD3cu6I05r26AA7IzfyyT4JJ5d4zlb1zsXy6cRQCNDHyYq3bzcgl8b/54dfRsE2Q2
         LZbulj3CEEh3DZgk2iKaKXgixlFe5jBoUP7w8+wmYp0lj2cjcX+sOgSoKVNe2n3b09yU
         a8jfB25rYTVQwj9yKlnjGhC8CMlUKdv8M4nXAgYS4NHxrq44ImkMl8l1YJxv5aBFVV9c
         t2icc1AO7oqFI533DidSAwjB2LY9jCBnpHfLYKVb2JRhHek5K2V15IUiLCoSD2kg/DZT
         LmT+vvVNYiVJdBd1GSrwjv1g+Dy18o/cqdX9+lB0u2A6tcACmlhjtbrxDVyA4jlkwdY/
         hYHg==
X-Forwarded-Encrypted: i=1; AJvYcCVLVaNd9PtL/KwdD7yCcrjricdhIPRBMVMoxqgMQjr30pFjOClT1UAfP25uVdZo2/l6CV0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsUhE2+K52zjGX6ABXlQLgjNp/KAwpjNmi72ifonwwt3g0g18u
	WIiAnoWDwwf2+OP4/NZRFOfhdlJNMG9tFujT62/3ts4J8V0GfHbMBUB4rYHG+68=
X-Gm-Gg: ASbGncvIkGPkRgI8Z7+NSp/pKKjgp3Q0JAMIJ3gCSwU4D3czd/hcKEo4tAIYc84Wrns
	V5aCPNAkHSfohrIgyNiDVu1zWWeh5HeXx3CYot1PmZfHtudrrZVZuC1LhCnKevSm4JYlIWbw5oh
	47ls+jUgZYpllPT8CN64Qwnk16+h+/YJ9eUbS+Aq2NW0H50xoEJxVStjFVjzD9h2U8p9FDxTKKS
	GAdcIKzCFbrjkEOYg48DPM2K0qXoY8YVwz8NwAv4+b1ovxCoQRziUn9/Poz0qjhvpYJw7y58jzg
	8D58FQeimOCPR1+fhbxEnre7SRj8LCK3tk0YmA87dA8QgG+IG6iXjxhjwtAbu4FWH2nlfYCY27X
	UFQTbDA==
X-Google-Smtp-Source: AGHT+IH78TpklUwBDK3WnRiDd3pPrpHVptMGkVV2plYHJnbyxlkTLYCF4Q+vemKiKROYa/bzJLhC9A==
X-Received: by 2002:a05:600c:5117:b0:439:a6db:1824 with SMTP id 5b1f17b1804b1-43bd29d6c7fmr66278975e9.16.1741260646580;
        Thu, 06 Mar 2025 03:30:46 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 10/18] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Thu,  6 Mar 2025 12:27:59 +0100
Message-ID: <20250306112959.242131-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
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

