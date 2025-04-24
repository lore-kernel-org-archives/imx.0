Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7BD1F4CB5
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475740; cv=none; b=Y61c9GAUH2dSwWEFOtI65tHfwTSev77UVa5xdpefcaji2G93mLCO5tz+1KzLFnVXJ0Z4kz1O7wLNHHnXX96YScbowsTyNjGXRN8XKFasEETeFjmThSPsdAYz9nRi4nc2PX6H7osrnJPIQ8v9GO+cXUtyVtrxNQvPyElDL43Ocnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475740; c=relaxed/simple;
	bh=2cbL/UoMZsHKenEkqVA3bsu+mxjHyTBuUjF0+bypM38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngTALnwSnEjhdCwguvRSX8hDIe3rm9wQBulNtyIe4btY3w4fmmwg6MrHDhmIxJBQPvQlj/EMh2H/232P22Q7PchiaoMt9LMl98ZAN3MAc7gRO1CwrdD8zedbXr/BVjEQkPHXKcm+FgZAoeHDhYPRqGLldFz/c4UC+4H1zKb/m6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Rj+SnUlc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Rj+SnUlc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso6339055e9.3
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475737; x=1746080537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=Rj+SnUlc4KbTssW6bLCkD9HpVMghKOov8aIK90aFBaLScJO9GIEr76t1DKrB+TOeCf
         udUUz6Tn1aOmn+7KRk77JqZ1vwKZuAdqXjD/IsCWvMlmMTpAcd3PHQCjOyY389YMgxx/
         88Akz4rc0BAE6lyEzX6tqZi3ALLuV6qLWffiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475737; x=1746080537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=aNTOp5hmuRCTuIKWOllXH8CmxkDsC1DZ72gCnUtCyT6wiLG3irNfj56gikeLNU3vro
         C9wi1vNRXPPxhZD5EjWw6TG+KayeBViyl37So5vlu9fzkUq3XTB3/lUwHRRwIom3uolI
         sbKzSCWlRz3+9dpOxuQbb+Ok2Dv/5ZyEVylr0/WKSntYUBVVxHxlwSwxQsQOFefbbHK5
         hBDHA89GT9Ci9HgfAuE+8CrEwgRGMkimkwfrQthCY0PiquY/6k/Qdp0ovJF7OIYYMwdo
         vSMmJ3OiF+u65xTKTznqHE1MiJr75nE6tM12k0VDmHm74Wcg1g9WmvEAz2egp9WY1DcG
         FBfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQHY8ZwllQsuL9aqyhrEmynSNZA/p2+ukUaDe3deypi6H8lA6uBnrKSDS+DkGdmevmPWg=@lists.linux.dev
X-Gm-Message-State: AOJu0YymMmzQGJCsyr8fW09tTb+cMnx3zKG6JP1gw6Me0MEJCgrpET7z
	rA/3YeMHVzUMSxRW9IIlJjFLCu+CbXxJaZ348Z3kJ8KnCUrgcV++Q18Wjeo9M1w=
X-Gm-Gg: ASbGncsmKV9shHcm60UTVqZ+ePwKQd8F9Jdpy7lPqiPQqyD8Jq9I8/56YRRUk800QOY
	n6Cc3T41Ru6xMqCnW2tci6qBLcZcy6rervRzIJGQ9dCQhpxnyTpWJtD8rdkovQAuACqUkxita+G
	RBqlGiSim+wwprI0vDjkBCeorWodop0jbs4Wwq2L8igjMTnauf53QFu4OA757/fHE8C33xPevEx
	c/3UEymlbS/H9UqV+tN8Xc+gcoHbshvoRelfhc79GqAvC7aFl116wY3YHpss8gPGikdW+Synf+5
	I4l3krWH+tdJOMSeYLZbSJ277p6EEqBIAhwoCh/pMAwwT2iQFCXFZEST4cohRysUhiMDvtvfbxc
	BdGDw
X-Google-Smtp-Source: AGHT+IGyI/+7MJ4IDLyNiZ7HG0se9/Du4KUg/pG6scYz/TegXiOuG86VE+RGX6eH8s+Yzc+aY9yVDg==
X-Received: by 2002:a05:600c:4693:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-4409bcfc14cmr9455825e9.5.1745475736712;
        Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 10/19] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Thu, 24 Apr 2025 08:21:40 +0200
Message-ID: <20250424062154.2999219-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
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

