Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264C1F666A
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397604; cv=none; b=kTeI5VQIU1n8337P69vNLkIwOxK7ywzwgnnOYA9DGdn0miVei+D3ALnWc3YLlXkJeIMxYpnvTpVXSzpPn+xwe8eju4+iMfjlii91n9h+qkCEhJ9Rzym0MAC7Vs62GimcfkbLuJoJ/TbVYW/iqsTfxjUeZROHy8Sx/Ps5Agix/s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397604; c=relaxed/simple;
	bh=2lVjzE030DeEHPrugPun5apKDh5VjrrAaL+npHrn3mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhtf9pcaOWMcgtGfQfWk/+Tm4YWXsR1m0UK65IT8B/s6Vo3y6UTLLiT3O7FGpZP2gcpBYt31q7Mc5Oy17MJeOnRx3TY8AzemUeeKZp3SrvfnyRwtLplJdk74XvNZrDdHKUb3u1vty8w/wUeOTLLze3VmE9T/iXS+EsetcU6snsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DhU5CnfD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DhU5CnfD"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa549d9dffdso109911866b.2
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397601; x=1734002401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sIT0jqKNMZhKzMLzfgvLUDfd+FJ1ix9dxzYWA8kfsM=;
        b=DhU5CnfDl3rWB8jn1xO7tflpHHfS3wdYqXIgI1QFlE9423QKwBoVEItx1qBEAbjGiJ
         xrkvCiqQFgo5pnw44uzDJZf+qus8cB9yD6cE23mkKNjFcCz/QkIWAZMFwpRlNhu+eCjx
         valYxrD/V73RZLbKSAbJcu4cqihe3G60KQY5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397601; x=1734002401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sIT0jqKNMZhKzMLzfgvLUDfd+FJ1ix9dxzYWA8kfsM=;
        b=tCd6C25dV2Nl64rMON/G3+5jSTH7vg+/ahxEislfG1/wV2/L924Y+Lsl5Vxp5ZIKK6
         XE8IpsDahBLCTPRn47QrwRvl6MZZ64C7M275S8GbMj9JwQFmfFft26xqWH8E9CXd4erB
         6xi3BLJMwadczze3DZ84V9GHu0fhm3oWLRyMpTyT599fxN+RohT7u2Bpe/FJV1qSiOVl
         8KumAAwGzKjJpzGZgLjl0akEZbf9ty8ePw4cKPSapiU1vLgNsVczs4s4jRYZ4hOefhvJ
         8xwArtxVtwgmg+KK3sHcaBSJeiSoI9Jo4IaO/w5DYcD3rip4OMilmRZsZeJOH2Udy5m6
         7DYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD3pz/G+tsvWQHq7bjrGE5tc3L2UdCleux0R+H8c0UIW3VeoIvUQq9s2Q9TdAOPD4PZc4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5fjHVRptuCR3/g3C8t+DGR+YnyR826b8UqI5qgnbyJlzxIcUF
	Tyge4X0mKz098uZiUkJb7y1h8lPPkqYOKhgwcEnwvt59qRKN5C+zoLyPyso3364=
X-Gm-Gg: ASbGnctZebQ7OF00iataKe6eYa//lJs66hhSDxQ7tckWo3JEgix96GKZgEu8sIatL8h
	VncR9JwKg1H0QOUSBcJmeGhyaJF06HWubeO0odHOqes0XadkmfD/IJazhXcrSIjEENkjTJQKHOk
	hwX8OwbPIm+w830y0KPhR+WuEW3Gaj1OG5pQ6/EF4LqLPxNtjhgJthSp7lx9L7viHaJMGUquA3K
	5DPH7wMawjbNT4numvzYNt0pMTuTMZdrrGSzic2REXxv2hXdjQNpqKctB1Sk8LKspqvAaDLZn9k
	T0BmCiV+bMPbnuvaceJRqa0mtFdMYLX0AmhMdO6iT1s/OQ==
X-Google-Smtp-Source: AGHT+IFWmfdNCt85Uk2ZsGUp6FJYDKMTwFmyiWTZIau8bHhRLJjRv3qW139XBm4OciWPi9ZRYi576Q==
X-Received: by 2002:a17:907:7847:b0:aa6:2a5c:fee2 with SMTP id a640c23a62f3a-aa62a5d4b52mr116294366b.31.1733397601340;
        Thu, 05 Dec 2024 03:20:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:00 -0800 (PST)
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
Subject: [PATCH v5 13/20] clk: imx: add hw API imx8m_anatop_get_clk_hw
Date: Thu,  5 Dec 2024 12:17:48 +0100
Message-ID: <20241205111939.1796244-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
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

