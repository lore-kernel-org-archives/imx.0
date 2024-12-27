Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D491F9EDB
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318672; cv=none; b=YbmzmNiwaME1cSM9jXfskq8SkfQqTVjw3fvLQNsT7VWz3hb89aXHGH/0mS//w3RzboEm3oNCjrYodR9IY22gtqmstyLP3scybfYxFMsSOjc7wlpqm+X5mEVmfvlNhKrQNkyK5Ej54VAZysCHbd8A2RafB6LKwkQReKCJeESkIM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318672; c=relaxed/simple;
	bh=eGGs5xBoZ9eIk/QkKyhkODa3AXPAFwKHvMXYA4up2l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bb3/KmM5/T0dCcUbZlyBboPof6bCtpGxVNoHWAUxMEaa+h/Vlo1+K7HFZuzQ79iaydXhE1SrqLsDRV7OlJA3+ZV2oj9U1+DJXb4/VDZCNl79J9RkQovfAHRUGcaAE5Y3RXA0eKny3hsufC+dd7sKQdxyW4yGP3AzlbtMxs2rST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MWhkCsRD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MWhkCsRD"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaec111762bso914502566b.2
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318668; x=1735923468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2b1DvWsKR3kWK9JNfXRovoEHigCoxQCmQlYrGVfIyUo=;
        b=MWhkCsRDnB+y7xHxIlMVpRTwQGTKmViWgbsvaLOca2qEI4Ie+6l3lndU1vXN90FNmE
         /rttWpWbee/6uXgFLf1J6lXgzsTZATbLwr/MeR4RWRCgSOX8khTv0HS7WTnUaDCU2BO5
         IhwoBzFJYY8ad5T7OYKOU5kRk4Z7gZxZQWsCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318668; x=1735923468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2b1DvWsKR3kWK9JNfXRovoEHigCoxQCmQlYrGVfIyUo=;
        b=FdRjVsjXj4zuHdejxU8PRmMqUqDHO2kImcZ9kB11Ry9CJm7hHNHH6nKbwNh/Bt8U07
         PJXqESc9j+vdLQgMdFVeMQnjmQBHfYgAW13UiSlGxM8gv/r5lRWPRFTx+5u6hdRqAxJa
         1S4QxYt8LTCRr2Gg1NKaEyNKiaA+UR7bOm7OMGgYf4bN0sEXx9/CK8t7WUU3+KlopkPZ
         tUvLR2BzFBpN2MEwyy2CkmFezAnBmLLejXn35hYwcp5Ptf2v0RAbmvaYUBeI4snUEyTF
         pQlNjJ5G1N72uq3Zj8WSkLPJMR1PBzLLvQq/GlPa8JXBmZaiAEUjFPobLiNDGdt7W2Lk
         WXiw==
X-Forwarded-Encrypted: i=1; AJvYcCWIK0NoudbwtVt9V4YmVyXwlAvS7sL1BtipwYJOSpKWNk3hlSnj2Tw6jEyEUmBw6S4f4vo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxS09jW2lcbNydsFGkcDFHnlbl7h6NNfrWwRTp9vInwvw63Pzm
	bDBVUE5ySwaofCmSOXQug0zBWoepk0Xj+xx3HG9uKfr7CNqepgx/WI6QGLLUAeY=
X-Gm-Gg: ASbGnctG6hCfSW5LEIAErpKgNPeZK+3pdZBAIK6xxHWbt5ZxpWj9dUD2Vq8LewX5pVO
	fAxCnChmoPdEY1CKjjKxNgCGkL099IWt5fjK7N5vhciF0mGvCYGvoY/TfYo75mZt7SMSG15OvUr
	828MCYd99yAblELf0FxHYjk43WG2uE0Xn7zmomwSxXcS3tdYaA2XO2BjB0ztEAqj4yiTKxzignl
	LHsC579G4DxBR2SB6wcvEQedMedr8EbzgxVTnnfS0zqXZ5gHpNXSvoN+CL9peZQStwW4br/3kFT
	dSvHa105uusno0Cm3qfsUQ==
X-Google-Smtp-Source: AGHT+IFdtsrBznelwwJuBM0+oIFuAtsVZztgwfPwBkxRjqySUJIDbs8HNHC7GQMygSlEz9WnVs+UvA==
X-Received: by 2002:a17:907:704:b0:aac:23db:af61 with SMTP id a640c23a62f3a-aac2874937fmr2719500066b.3.1735318668380;
        Fri, 27 Dec 2024 08:57:48 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:48 -0800 (PST)
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
Subject: [PATCH v7 15/23] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Fri, 27 Dec 2024 17:56:18 +0100
Message-ID: <20241227165719.3902388-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
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

