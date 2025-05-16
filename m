Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2C14B1E73
	for <imx@lists.linux.dev>; Fri, 16 May 2025 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403394; cv=none; b=CACkZX1XIEffY4ZS8Q5mLVBJYEMDKphAFJgmqJaWFfwedYmvUNpH/2DMbvnL0XytH5b2U515hPuLVKxQix6ifpsnL0M2c6lcXXhsZYWaQxfT3s+5CetCLYADiXGl8wBBYtpdeXE1yf8+HD3jM46qtiBP0aTMr3N6z0kwSuauAOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403394; c=relaxed/simple;
	bh=Nie+wA2lEKwH2I614ELhqO2d8Vq+8E2sjK5/V77zdAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rqqOXQND24nQjQXflY6Sc3Uif8jQ6RPimgkmNmVP7htyI/fmPj4gRq/jCViTDIfmE1s4lwzQ9rPXKKCbFaOTD3Z2JM49rCw5QBO/9VWzEvXC3csG31aEJiJ9eRmOIRxjIZ4Z1DV0Z/kbfzGLRTSrLUhKFnDJpWZW3xy5ebOn6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EjCtY9Cj; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EjCtY9Cj"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so3984408a12.2
        for <imx@lists.linux.dev>; Fri, 16 May 2025 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747403391; x=1748008191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+uWwuTYRifAYGUlGh3WRUvzHiTmLTWvHkuePmubcIY=;
        b=EjCtY9CjcgJSPlWv4zdf1qqbe1C2542KT9frOvsaer7SGeDB9y62TvdcOK0Rm2XCex
         9r94qTJWnvwwobVGNzzwG177/VnhnyzDblC/jm8OAw8FndFIBF5Apr3xSreTPQq40ivR
         eUitgWuSaKL7G9VPvcDJU1IlTvWEgHsmK+Drk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403391; x=1748008191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+uWwuTYRifAYGUlGh3WRUvzHiTmLTWvHkuePmubcIY=;
        b=TgJ3F76gRBThH4WQFi5YD//95hmyiw3WktzqJi4iwDqD9C+NyJnM7C+aOSx93pr/mA
         unFr+KNtUtWgAZU8S2vm0XA5ORk4oKGyMD4tp+sLlwMLK+TSXvrsDmTrPyKtVTZJOSw2
         ufQu0aFqhm3ZHl/olH8JcNYXQ/L4HG3cW64bJogjjGQo1OnOmKShXrPmdICAzG7R41Rj
         4WEylVCoA8+bVjCfnjG6huzYuYx4y4MAMIpvIPYWICaR1RcNxbHPM2qqr0u6lUxxKsKl
         zX5E3PxHRN1HuU57AcgRvfH2G1SKDqAS6kOatvt7Gby/rxNtYmpvNunYD1iJbbHCGI1e
         /CaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkjzJON9K2hW8Bp3SgXizrip6+8wx8e8v1jdpBVVjQu2PhuGUU7E27mJ0obWrfIeKowr4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAgkgw7BSkFBP84e4etcgB5p+heCUCrWFh9I9//upSJT8f4Vab
	zr/q6gGfADm7ifZhLE1Z9z/TJjImRyobfSt1nptIZzX1aU+CPueZxMih9kIQEhUnm+c=
X-Gm-Gg: ASbGncubjnyxPSH21nf384TtTJxDXnrrhIwSjQ9Gt52qad0GtnrTUv7VbR3ViSutTIE
	xiRinQbHRMMfQ6DhCylhsA9bJ6rOMfBeTzy8H0HTVnGaACP3RqaY3CFD17O4pXXvzE/mIuKhzTX
	AQQ4QYLc0AxkRhEmDUHzo+y0aGhXBSi2WTo76zMDamPSNl6AUxeu52HHEaXxcVAJF7C/ybsPVB4
	le7M1xKYI1qF8UfUljUhNhNTj24aAESz8ouFYIVdNEHECwQC3Ktc+6QCtBB+11PCjOkoDtfKB4X
	v5r3ImNvmZldC7MqTvCnE7oyLPy5dMFYQU4kJXVfr4PlPTAULWMKceJ4ZcqFkl3whtm99jqfith
	ddvyuqgnQJVB4ArbbADmZkiZZuDM=
X-Google-Smtp-Source: AGHT+IFoN5V5sXxRw1p11CkmgQLqoxiXH8inT8H8fElyYIKPtuQteQwDowZG6nwQRuFNGWvPp8sSnA==
X-Received: by 2002:a05:6402:27d1:b0:5fc:966b:23fa with SMTP id 4fb4d7f45d1cf-6008a39c9b8mr2906162a12.4.1747403391082;
        Fri, 16 May 2025 06:49:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([62.19.60.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e6389sm1562951a12.45.2025.05.16.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 06:49:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Mark Brown <broonie@kernel.org>,
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
Subject: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM platforms
Date: Fri, 16 May 2025 15:49:27 +0200
Message-ID: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock
driver") breaks boot on i.MX8M{P,N} platforms.

Here's the log for a board based on the i.MX8MP platform:

[    1.439320] i.MX clk 1: register failed with -2
[    1.441014] i.MX clk 2: register failed with -2
[    1.445610] imx8mm-anatop 30360000.clock-controller: NXP i.MX8MM anatop clock driver probed
[    1.455068] Unable to handle kernel paging request at virtual address fffffffffffffffe

...

[    1.634650] Call trace:
[    1.637102]  __clk_get_hw+0x4/0x18 (P)
[    1.640862]  imx8mp_clocks_probe+0xdc/0x2f50
[    1.645152]  platform_probe+0x68/0xc4
[    1.648827]  really_probe+0xbc/0x298
[    1.652413]  __driver_probe_device+0x78/0x12c

In the imx8mp.dtsi device tree, the anatop compatible string is:

compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";

So, in configurations like arm64 defconfig, where CONFIG_CLK_IMX8MP and
CONFIG_CLK_IMX8MM as well as CONFIG_CLK_IMX8MN are enabled, the driver
for the i.MX8MM anatop is incorrectly loaded.

The patch fixes the regression by ensuring that the i.MX8MM anatop
driver only probes on i.MX8MM platforms.

Fixes: 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock driver")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/imx/clk-imx8mm-anatop.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm-anatop.c b/drivers/clk/imx/clk-imx8mm-anatop.c
index 4ac870df6370..90ff11a93fe5 100644
--- a/drivers/clk/imx/clk-imx8mm-anatop.c
+++ b/drivers/clk/imx/clk-imx8mm-anatop.c
@@ -37,6 +37,19 @@ static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
 
+static int is_really_imx8mm(struct device_node *np)
+{
+	const char *compat;
+	struct property *p;
+
+	of_property_for_each_string(np, "compatible", p, compat) {
+		if (strcmp(compat, "fsl,imx8mm-anatop"))
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
 static int imx8mm_anatop_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -44,6 +57,10 @@ static int imx8mm_anatop_clocks_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret;
 
+	ret = is_really_imx8mm(np);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(dev, "failed to get base address\n");
-- 
2.43.0

base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
branch: fix-imx8mm-probing
