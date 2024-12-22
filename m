Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE171A8F67
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887158; cv=none; b=Z1ikjqB4j35HqQassFG08JYg+TQa4WPQxxrexJYmNLH+3nINrXjQstWv1GwPUIWIOMKFCLCGn2viEZBXKvpVRosi1iKSTNW9eQr6MGLFrysfob279RqHUfWAvd1wCAQPEf6/1qTeBT0/mXAJRLmlC+FI9ZWQTYsD/mDmZQj+SuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887158; c=relaxed/simple;
	bh=EojtDfwQiE/l6/+nsYWjeFSB8lLsWtD4gRRg/kiP+q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VcPcQDO+qWr4kcppRyVRsAGB+tMiNMaseJovGNROUumlWA8me9b8kwxkGWPP5V6et7v3eRo13IC4wHh7kroh5P3icWrFvJcBXz0mkLWXOahXzLBJDwgrhnIMwCQI2Etsd6W5B+6Y+Iwvf47j1noLMtkySYuVp+Vf/PaI/7xl8lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=n1O8gqUT; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="n1O8gqUT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so5484622a12.1
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887155; x=1735491955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVXt77MmyayWVTjhC1zQYGhplrs4R1xCNUj96ytDRNM=;
        b=n1O8gqUTKS6KSCJf1NDdf3PlYizEKrdh6Q8dN/jlcXpK9VlJLMGQI//chp8uYlXIjF
         oqU6Hw8JRaAWnNyCelzmCdcaMeO4y0dvCfFuQBVjfjWyemF95wcMvkZYdZtG7gmv431E
         vRUJ5zT+rqV5lT0Wx7OluEBmEB7L1MkMDEJcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887155; x=1735491955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVXt77MmyayWVTjhC1zQYGhplrs4R1xCNUj96ytDRNM=;
        b=B6HkKAv1gXK8160AfiW0V31YknnEiqXaQOCTnrtsnzYU2CaHIT8c9kIpf70Ti6QNEe
         NsUhCPdFxER6Elom21J1eaDQS2HAO7tS0Og/LWrwoX+yXbOzMYvy5Zs4+LnS+w6vrVss
         P7hkS9KTrNn2JFveszojjwUhyvDiYgQ2LKA/lCG1s8nQtdJ4EsQO+G6Rw/vPLbYQZPYv
         1oMBeBhbDJ+Cqg767/W89e/gb4Huj7xo3vaH57C9hi9VhwMi16PvF5AxfVbyptAQZd/z
         oXVqLjorJO7lEaBaQAuq5SI438eXa6JdlZwxNIM8ptNojmcQWGGXNdoVqTjZ3lxhesuB
         AXAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWscxcACaEC4WwTfKiWqJRBEa5HjZjr9C7mjGU6aYeSJUr/2mJTnW6isyhr2ZxsBoMHhH4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPbCxgXnTIs+yVhXQ6/tj2PMTMB1P1s9entemXE3sO8FtoflV6
	8WL9kjDPvscNlkshRbtbzwgqfiV7iZNaMzLnekro7JngRyi2dQTqB1hXFL4X51A=
X-Gm-Gg: ASbGncvYjky3LQX3NwppOudSRi1+h16/zvEl2OIo71SlsjDWlk48sYfPppPelr+JVLY
	3lvs4q2cVUkXnd1GW6UEeSKHfeRFaINrgcRtxIEzbUDQivVRzNROrSIH7b1JesJnMctzbqhWWb2
	qo7MtMVtjvs32nYr8kA4t84gMY/A2FuuHwFvAZLBGlKYdosb/oDShXaSCookUC7fP6xECc4F780
	A4yzUHybvoP5dj55Lmpt/iiIgkSDZV1R9dxHILUoEMU7GZEBZd/QE6miugvYHl28lD8+kb1NrJg
	cGKdeBEnmtbtQrmHfCWScfCoTiXZv2hcYYnOJqcwd4dcwg==
X-Google-Smtp-Source: AGHT+IEtRv29UB2/vpHu5Pos5vtKqjoO8x1Oysl5897305hTSToDe3em3zRHQXaKniZ6rSfoLi31Mw==
X-Received: by 2002:a05:6402:51c8:b0:5d3:cd5b:64a9 with SMTP id 4fb4d7f45d1cf-5d81de39872mr7776824a12.34.1734887155565;
        Sun, 22 Dec 2024 09:05:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:55 -0800 (PST)
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
Subject: [PATCH v6 10/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
Date: Sun, 22 Dec 2024 18:04:25 +0100
Message-ID: <20241222170534.3621453-11-dario.binacchi@amarulasolutions.com>
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

Get the hw of a clock registered by the anatop module. This function is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors

Changes in v4:
- New

 drivers/clk/imx/clk.c | 28 ++++++++++++++++++++++++++++
 drivers/clk/imx/clk.h |  7 +++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..9a21f233e105 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,34 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MM_MODULE) || \
+	defined(CONFIG_CLK_IMX8MN) || defined(CONFIG_CLK_IMX8MN_MODULE) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MP_MODULE) || \
+	defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id)
+{
+#if defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
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
index aa5202f284f3..52055fda3058 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,11 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MM_MODULE) || \
+	defined(CONFIG_CLK_IMX8MN) || defined(CONFIG_CLK_IMX8MN_MODULE) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MP_MODULE) || \
+	defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id);
+#endif
+
 #endif
-- 
2.43.0

