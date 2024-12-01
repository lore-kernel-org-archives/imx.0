Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7731DD9AD
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075260; cv=none; b=g0mTNUV0HtIARpm/RKfFgkazvhBHrRjQGkgBEezsPWrLRGgXaVQhCneajBi+oPjVcc8kTYYHcF96YQU8BOKdEf0PsmAbcv5M/Nyfk7V8i9G1IR+FSTbWPAi/sCEQioUzfXVSk0MF1XszZxSvl6XuECRqvsv3SQsG6z0ZDErYAiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075260; c=relaxed/simple;
	bh=yCf6o4aEUfslJcLLJEqow/qgmD3/3fEPCIzJe9arT9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UehYoYxtPqdfW2RjNsBYVuyEc3ny6EHvU/crFTID4xngaoAhTr7UGGT60ZpzcEYRa4cnXk8LR1t47kJMoJRAqTF8Spcm3KJINnFKzAMSD/kC7yfmDPWFysWqapz+Gt8wh+OYEnNBQo6bscJpnZnn51jl9NGHTwKdvzOsX+CWItk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=e+DRFN0+; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="e+DRFN0+"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa1e6ecd353so253286866b.1
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075258; x=1733680058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ3YHSAuF6GRZeer7tzybOaIp6SswmD+4eSpj3aybE0=;
        b=e+DRFN0+b+qb1+R5b9CnYuBq9HCB0z3tew8qItqkmwIE/jsf4JRy6zqNn5jlNtuMIY
         zXT2Q7KA2Eu8bS2jFcfN8EE1ckUIXqXoycFaoTWyGprIi6KW+U7PXucVkYMnZ77bF1eJ
         ev7RfmgctdgEmuolKa2CZhhwemZrDogIsF5mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075258; x=1733680058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ3YHSAuF6GRZeer7tzybOaIp6SswmD+4eSpj3aybE0=;
        b=oiJaxsWjE7P6UmegN+/AgzcrBZDVrdKCb4iXwQu7cEtC1EGIq/TJ62UfFaWf+BA0YL
         bZGyGg10nqoe0vRHtDgAGOoVtStMrGH5NTUlOQYD4DS/CsBJGSJR9uBQ63vKdZdNFGO1
         y30m+oGi1HGDgebJt2yi0UBRhNCuoGJ+8Zv1ZV3OIF9C7U4KmnED+SfPVeXmZTpdZTEy
         CGJr7HecO8sFi8GsN6QLp2URRt6RRfHzZZabOlZKQ4YXcGY6IYJuOnyY32Z9sjbvJKVE
         0dt/P7u7l0xcg1vgTJhJKkHq68ZAIn4762jrvaei29WL3+R/DmHvfN7OkX7twPR8Q7jz
         EFmA==
X-Forwarded-Encrypted: i=1; AJvYcCVlf/XpeB2QCvMsxNVWfUo63l3RaC6aqsmY+VCKx0EiERi2UJxXIFFE17EIUvbHOJ/rLf8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzmxo7WMEg06GozcWkLnf2QzQxUfXJTibL/HSsnZGZ3eTy+73dY
	56UBxiTXxuL1Cgqr4Pig8py3mXaTb9HSAhryBLW3o2E4AXQOxTkD4aL4Z8THF9g=
X-Gm-Gg: ASbGnctiDCzsMC/BaMEnZGHa4KYAEAA4IUrEfRfOAZh/XhAXbmXSH38Hkxwz7+h2c1b
	ctMAsj4uDjjpSMUZ2J/rZmbIg64s90ia1lwUxb7PwFN46ZGQdcHZb2E7QsyMC62V8O21FrebLU3
	dCfFdp9bTEzK9Uhc/YfKBgESS57upsjvSpfUiM8LPJ15Z706Hmq+qYrZYpbleYBY/Yinltsk3tO
	ZjQoEK25w0WvZB5qplzoPdX7bV9syqVL0Mm3vesCRJuJYo22pR4NYn2QY+CKRdavfq/WzIlyK3l
	XKB5kNFTO2JmcSQ9+CY/SNyY5v69/5XCrLZzY9buQxa8M0f+9pklXLlpw8icj6nmpyEUNyH9pw9
	tgDcIGurWbY6100xz
X-Google-Smtp-Source: AGHT+IGzjP2fqXTt6+l7OVN5JKc8cizq18lY5oJ6KQTBWwgFH+n4/LFwzMSUmqzkFa0IBPwW9Wme7g==
X-Received: by 2002:a05:6402:270d:b0:5d0:d2ed:ebb with SMTP id 4fb4d7f45d1cf-5d0d2ed103fmr8950481a12.3.1733075257612;
        Sun, 01 Dec 2024 09:47:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:36 -0800 (PST)
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
Subject: [PATCH v4 11/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
Date: Sun,  1 Dec 2024 18:46:11 +0100
Message-ID: <20241201174639.742000-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
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

 - Added in v4

---

(no changes since v1)

 drivers/clk/imx/clk.c | 26 ++++++++++++++++++++++++++
 drivers/clk/imx/clk.h |  6 ++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..8a8473a77b7c 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,32 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MN) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MQ)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id)
+{
+#if defined(CONFIG_CLK_IMX8MQ)
+	const char *compatible = "fsl,imx8mq-anatop";
+#else
+	const char *compatible = "fsl,imx8mm-anatop";
+#endif
+	struct device_node *np;
+	struct of_phandle_args args;
+	struct clk_hw *hw;
+
+	np = of_find_compatible_node(NULL, NULL, compatible);
+	args.np = np;
+	args.args_count = 1;
+	args.args[0] = id;
+	of_node_put(np);
+
+	hw = __clk_get_hw(of_clk_get_from_provider(&args));
+	pr_debug("%s: got clk: %s\n", __func__, clk_hw_get_name(hw));
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx8m_anatop_get_clk_hw);
+#endif
+
 /*
  * This fixups the register CCM_CSCMR1 write value.
  * The write/read/divider values of the aclk_podf field
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..6b6af26f4f1e 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,10 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MN) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MQ)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id);
+#endif
+
 #endif
-- 
2.43.0

