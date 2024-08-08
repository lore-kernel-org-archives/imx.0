Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEF018EFC9
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128171; cv=none; b=D+87nT6ZDhu6n/6IC3gTPuu1E1kS4Za1Hw3G+bBaCJM2cB667ngEF+LX6eeyCyKaPGl6jEy++sbOAboYz3bBWST5AmoU2MrrHxatxvueQck2hrqboL5yDMDu+i5km0mU+Ge5fr4qgTfSHOhgAonsx7fy0B2b5FXq549JgE9gkNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128171; c=relaxed/simple;
	bh=yNHDH9cROFXgCo6+xkemY/PjpYdZ+ompFIQkHrU5f8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nv/K9V5Io3PpC1WdIEis72ZM+xLesMHJhJGZ3uq6+awcQDPXiNxL2Fa/+orDNl7/Yof/MVS/7NTqnLKXtbUK8zdroC5u531fXdj8+JQVMnBKPJAl620WhXG/+Xp/Ks6hb2P1Pnc4sZG9/+Y2/o3uF8yhF/RJskFKXbRukp2lxQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wu3+c+Hb; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wu3+c+Hb"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7abe5aa9d5so138285566b.1
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128168; x=1723732968; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAtcktpsyK1IopCF5kU8mOGUnH018rQKQhDOBPxOSZw=;
        b=Wu3+c+HbrssP5JrH1pUVQbJc8EH4v63QXzO1YSII1F7t3WbU9TG+7bw50i3z3Pgv53
         gllCIshCUa0lnXKSAEC7C5ufnjrH4P73SNVr4lhXbN3o2ywJKpUqse5wNjSxUBohvXaf
         t0ssDlqRKNsB+ainj9MUxP5ZOHYhwh7sqp/1kiHSPdey8xuZLYZANXdVtOpd6SLp2j/D
         KP89BiQx6GBUOiUvwopZmWqB3EHabVWGfe0SttMOvVW37BrTAIlToRD99dsMtXjL6G60
         trUml/sOGGWdxRHoNKHUfs/xaqoa2/2+Vmbv9Sqpw0INfh+by0DiYdLn/21amSaeebZ7
         ftfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128168; x=1723732968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAtcktpsyK1IopCF5kU8mOGUnH018rQKQhDOBPxOSZw=;
        b=EA9lj0gnkJs1d/DEl9U6OP8AEPsvhqiCmxPs+oYZppKiuXgUQAzdUIia5zdtbxoNM3
         T0hI8ItAARM7ys5lA9jJeN9GdfZk75DhINhVr84FPu++WGEsIuAKEO+xJQY8IF0s/ThL
         5QbZVVKpiFLEwfEXyvf1kYHdDQ6taGEHbn1weNnqBlUpSUoMqWdnMrGZNQTU7WW/LHas
         EPweGB0jXoBnXM7Q/LJPzdvjG+DR8z0wPRIrdPXC7WSA6np8g4vj9g/vcmgkelnip4r0
         xTQ8JigzQDtHO34NbkRLU9SpF38W4RE4lFFB6KbBt9iXxUfwYKPqvTPAa1u6IWGr4+K9
         40yw==
X-Forwarded-Encrypted: i=1; AJvYcCVEUVyHxIoP8FNgTsB6HfQNuTvlo0TOCaJ/kICFZlmikKJ/09Nx5NpJ6z/ZOQBP/ZmXQ7Bsqh+3trvO1llnepljNAgQ
X-Gm-Message-State: AOJu0Yy9WnYoNsD9pjSn6xfuHmYxPcgM9rNHAxjghbkivLhnglF92SJs
	eBbEhbPWTZ1D42a9nVsxU0wG+IeqPFmJiE6JcOm69oFhPMjTI+UU0ajRfiTowr8=
X-Google-Smtp-Source: AGHT+IFKqWTwUTF9It4/KiFcH08kll66MLBeAiBxCYt6pGnnfGGyfN4DPvbUWI5sbCigMk5HvKV9ng==
X-Received: by 2002:a17:907:c7d4:b0:a7d:a00a:a9fe with SMTP id a640c23a62f3a-a8090c83b95mr144065666b.17.1723128168207;
        Thu, 08 Aug 2024 07:42:48 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:47 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:42 +0100
Subject: [PATCH v6 01/20] clk: bump stdout clock usage for earlycon
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-1-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

On some platforms, earlycon depends on the bootloader setup stdout
clocks being retained. In some cases stdout UART clocks (or their
parents) can get disabled during loading of other drivers (e.g. i2c)
causing earlycon to stop to work sometime into the boot, halting the
whole system.

Since there are at least two platforms where that is the case, i.MX and
the Exynos-derivative gs101, this patch adds some logic to the clk core
to detect these clocks if earlycon is enabled, to bump their usage
count as part of of_clk_add_hw_provider() and of_clk_add_provider(),
and to release them again at the end of init.

This way code duplication in affected platforms can be avoided.

The general idea is based on similar code in the i.MX clock driver, but
this here is a bit more generic as in general (e.g. on gs101) clocks
can come from various different clock units (driver instances) and
therefore it can be necessary to run this code multiple times until all
required stdout clocks have probed.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v6:
* drop a stray #include from drivers/clk/samsung/clk-gs101.c
---
 drivers/clk/clk.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7264cf6165ce..03c5d80e833c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4923,6 +4923,131 @@ static void clk_core_reparent_orphans(void)
 	clk_prepare_unlock();
 }
 
+/**
+ * struct of_clk_stdout_clks - holds data that is required for handling extra
+ * references to stdout clocks during early boot.
+ *
+ * On some platforms, earlycon depends on the bootloader setup stdout clocks
+ * being retained. In some cases stdout UART clocks (or their parents) can get
+ * disabled during loading of other drivers (e.g. i2c) causing earlycon to stop
+ * to work sometime into the boot, halting the system.
+ *
+ * Having logic to detect these clocks if earlycon is enabled helps with those
+ * cases by bumping their usage count during init. The extra usage count is
+ * later dropped at the end of init.
+ *
+ * @bump_refs: whether or not to add the extra stdout clock references
+ * @lock: mutex protecting access
+ * @have_all: whether or not we have acquired all clocks, to handle cases of
+ *            clocks coming from different drivers / instances
+ * @clks: clocks associated with stdout
+ * @n_clks: number of clocks associated with stdout
+ */
+static struct of_clk_stdout_clks {
+	bool bump_refs;
+
+	struct mutex lock;
+	bool have_all;
+	struct clk **clks;
+	size_t n_clks;
+} of_clk_stdout_clks = {
+	.lock = __MUTEX_INITIALIZER(of_clk_stdout_clks.lock),
+};
+
+static int __init of_clk_bump_stdout_clocks_param(char *str)
+{
+	of_clk_stdout_clks.bump_refs = true;
+	return 0;
+}
+__setup("earlycon", of_clk_bump_stdout_clocks_param);
+__setup_param("earlyprintk", of_clk_keep_stdout_clocks_earlyprintk,
+	      of_clk_bump_stdout_clocks_param, 0);
+
+static void of_clk_bump_stdout_clocks(void)
+{
+	size_t n_clks;
+
+	/*
+	 * We only need to run this code if required to do so and only ever
+	 * before late initcalls have run. Otherwise it'd be impossible to know
+	 * when to drop the extra clock references again.
+	 *
+	 * This generally means that this only works if on affected platforms
+	 * the clock drivers have been built-in (as opposed to being modules).
+	 */
+	if (!of_clk_stdout_clks.bump_refs)
+		return;
+
+	n_clks = of_clk_get_parent_count(of_stdout);
+	if (!n_clks || !of_stdout)
+		return;
+
+	mutex_lock(&of_clk_stdout_clks.lock);
+
+	/*
+	 * We only need to keep trying if we have not succeeded previously,
+	 * i.e. if not all required clocks were ready during previous attempts.
+	 */
+	if (of_clk_stdout_clks.have_all)
+		goto out_unlock;
+
+	if (!of_clk_stdout_clks.clks) {
+		of_clk_stdout_clks.n_clks = n_clks;
+
+		of_clk_stdout_clks.clks = kcalloc(of_clk_stdout_clks.n_clks,
+					      sizeof(*of_clk_stdout_clks.clks),
+					      GFP_KERNEL);
+		if (!of_clk_stdout_clks.clks)
+			goto out_unlock;
+	}
+
+	/* assume that this time we'll be able to grab all required clocks */
+	of_clk_stdout_clks.have_all = true;
+	for (size_t i = 0; i < n_clks; ++i) {
+		struct clk *clk;
+
+		/* we might have grabbed this clock in a previous attempt */
+		if (of_clk_stdout_clks.clks[i])
+			continue;
+
+		clk = of_clk_get(of_stdout, i);
+		if (IS_ERR(clk)) {
+			/* retry next time if clock has not probed yet */
+			of_clk_stdout_clks.have_all = false;
+			continue;
+		}
+
+		if (clk_prepare_enable(clk)) {
+			clk_put(clk);
+			continue;
+		}
+		of_clk_stdout_clks.clks[i] = clk;
+	}
+
+out_unlock:
+	mutex_unlock(&of_clk_stdout_clks.lock);
+}
+
+static int __init of_clk_drop_stdout_clocks(void)
+{
+	for (size_t i = 0; i < of_clk_stdout_clks.n_clks; ++i) {
+		clk_disable_unprepare(of_clk_stdout_clks.clks[i]);
+		clk_put(of_clk_stdout_clks.clks[i]);
+	}
+
+	kfree(of_clk_stdout_clks.clks);
+
+	/*
+	 * Do not try to acquire stdout clocks after late initcalls, e.g.
+	 * during further module loading, as we then wouldn't have a way to
+	 * drop the references (and associated allocations) ever again.
+	 */
+	of_clk_stdout_clks.bump_refs = false;
+
+	return 0;
+}
+late_initcall_sync(of_clk_drop_stdout_clocks);
+
 /**
  * struct of_clk_provider - Clock provider registration structure
  * @link: Entry in global list of clock providers
@@ -5031,6 +5156,8 @@ int of_clk_add_provider(struct device_node *np,
 
 	fwnode_dev_initialized(&np->fwnode, true);
 
+	of_clk_bump_stdout_clocks();
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_clk_add_provider);
@@ -5073,6 +5200,8 @@ int of_clk_add_hw_provider(struct device_node *np,
 
 	fwnode_dev_initialized(&np->fwnode, true);
 
+	of_clk_bump_stdout_clocks();
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_clk_add_hw_provider);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

