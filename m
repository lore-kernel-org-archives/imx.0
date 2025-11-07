Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF123081B5
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511415; cv=none; b=KnHJT21BzYycRyh6CFeTDKVsgUhbUAibaN0no/4LCz7X0vQ76ghOIn/+q+zFzLcX8wW7STd2WZ5tKVxhqmZro0L5KW26z/IXasPbsipPY/esn3lV5yu4XkgI1Aeki3D1hl6l8wnhDOK3H44/SqFNt4FASr1p5J2ql4rqIRCBRhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511415; c=relaxed/simple;
	bh=NBuMo3fA0T+jYUYuxAjSnoU2gctigcAN7afLM+xxwVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkH0HqAfSJCzwb67/zZVQw9mw6iaXyg6Ib9uzYbFxH8Kn6eU3cgPJWijs++Kx21dxm7QohXYZo2rgSV92pJMzhgPrTV16K1rNkM9o9quhCGUXO1pzSqo5I2jfDFs8FbUW1+YnkdBR37PulD0qBU19Oy8BDnYPOYTg271nH7P6DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wJ0RF1AU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wJ0RF1AU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429bccca1e8so311762f8f.0
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 02:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511409; x=1763116209; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeInQQFLiIKx9a2aZ0cucvmhXeQc/nRxrd1ryoO5rZk=;
        b=wJ0RF1AUSyrmavLihIp+FF90DH4hhQqXQqjIk6byHkEYLFJCUEKAtwssOd9TE3NVTc
         7/7r004djtWdaa8oOQ71LuXn1M7Hu7c3jarmrZsZnFGSP6AKBRUe3oNlj6oI+PgdG83n
         FrL4kXf8aWq6hARZosJ8dXInhCAJC66Nhs+M1Ln+3KRLuw28jJP8DE6uwvLWMXYFJR5g
         aveNscc5THN+ENl6nShcZkF+27dAozI3Oeevb92mUfHSJe3QxETPWyfNiiachlkQhCj3
         YluVHeeCW7ZcC/ZPtKPjp8V/XouR6ThAJJOz3EK5Qfa9ysQ3Wvz9MzHUMKECnaAyOVfb
         Avzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511409; x=1763116209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EeInQQFLiIKx9a2aZ0cucvmhXeQc/nRxrd1ryoO5rZk=;
        b=kr4AsQmsL+z19ptu2SAxDeIv3IRlvmDePYnCO25EFwWnzm6XO00Or0OngcUL79rCmz
         4k8qaBCVEaUVnkV5h9XmaPiew23Om36OKu0Lev9cgNkVuBvbr/Gx2uzU4fZZi9llGSI0
         6iBk1gIXfQVJJwbZ6HfZGep7cIU4D74/dC0wA9hxbR0KKgkX4Txm9S1uxKAh9N9d15TF
         y4p8GoHMoqcb1hQJW2CsDlwivyhsISjTL4hGq8t1D1kROmBnJFdxQMbhpLdGNf2CP/GI
         JqolZtx1flsu9zZ+KD8Wkel6G3gpCTY3fdkleeHnficPW+lB909bK52n+6UF8WqLbAWO
         mMaw==
X-Forwarded-Encrypted: i=1; AJvYcCWOTiQjzJx7MkuuWl5XV8+CVmpqtne5GDmKkaswoBWC4+A6/CHuUbsJRFcXK2eP2bTTirQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWK6IWA6puXFM9jltXlqGz9YNhv/9j4yMdSTENv0qXZ/Cdf5fV
	pdXSn0S7GKBY72MzhcExCnKpHZmhgAvBnbzeEFwxS2OZNJt7fJISpIi4EQCfisRdrsA=
X-Gm-Gg: ASbGncuuxdh+TbKYUH5FKrZ/QpaNENnrGVdyfPdRg1eXTQpas+Zv0fgOeSbfkk9hdqE
	dEesDlMVp6Fz1svcVFX5DbdxMKD4+3/p83vFDxTAzuK6zV+q/ECywI3RH8VivXFNacsP0xIr/MU
	NAuPbupYs33cjRpBCYBBC6UBNklirZS0lyuSwCiiZiWZ6KJrYf7r1hscz3s9yg++Pyu9e5G6Zil
	OLbHfZu9axKf26LKsZIxQrwgezAvC+sVSPEThSTFx2Ev1J9F995ZfowTmx8GD0MhrFDlLLTt4xT
	cpid3naQw4zqmlMk/ZWKfQ7cd4/wdzK3Lvtp2w2FdkS9CSvUdaPKtFzTcCzblzUi1LsjAsoSUM9
	Jh7dm/ZFmtlYskrxKIUv4ALkkn1FQ44AULCDOfIOSSXLBm/7uaTB8nIzTEQxCEckvw9WlUkAZfj
	Lkprg=
X-Google-Smtp-Source: AGHT+IFWpZ4poiZ9SDXbV8ON2MHdizseFiZAt8VOLHhvPsXxDGeYll4+fwCN9jkQCS4Zle5ZwgVqIg==
X-Received: by 2002:a05:6000:4285:b0:429:c774:dc08 with SMTP id ffacd0b85a97d-42ae5aebaf5mr2437383f8f.53.1762511409391;
        Fri, 07 Nov 2025 02:30:09 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:52 +0100
Subject: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=POv+vDF2xSPchjLMqtdcREByAr5wVSRC/4xfmqCj4bM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcon0J86/ZOn2V7ZnaixLSQbUE+OOX0GyGHbN
 J0IncBZa6SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KJwAKCRARpy6gFHHX
 ciIrEADVzOpNMnNgNcWPwGlAIVMHEpqCfHtBeXPJvQn07MHtxYl3U9LGnzv620nVLy60nQXmdAj
 pl3ZH62GP+XUvTaa+j/Z2gCKkYsYElWtU+zFXoq3HYslfFES+CnYlKKCUmQophJ5kf0OtQCt7fO
 5abxCLdbNTLSvsEW8oVYqioJeULR4+HfOiPNUiahqO/7PrqApBkNAhtmqdbVH+Y/EeNbiYnOCf2
 ZE6sCBDEzpxLPiYAwB0GUT6G6dzFKvCnBMKGLQ8w7g0Y2Ir6rZD+Un4BWa0CNrGKvNHwo5xO8bo
 nGfuSWFYUqibed/x5q6cbRcrqIv4AmIJq3gc7On4l7G7nPtxCppRhvhSChUmt0Gwl3nU7ag+EdT
 9+tJ2dVjWe5HNxZ6uYIO5iCQkTDt3zHGuEI7sIwGGyMuQUb7feOaRdvBOk3Uzk12VujF7tf0KFh
 b+OPkxYIl6dR2V2vM6Iltg5uvz1odCEojGxY4X1ssONLOPT4Io72HgrU4Ic0feuQA8hwoch6sR/
 FRi9jKn6EJVxMvcjNsmigzOuuZ657/JCBDLfzmcsTY+k/jtVm8lTErQTHQN+xZDKdPke/55kcro
 7TpPf1P6vZKDWhTuWJQrIlPA/9Y2Tcn9d3fifuHIRnt/DqPTlrMScJeQkcUIZjtMw0xYQmGCR4I
 ViImRD8T6UC/KGg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 87c5bea6c2a243f3be998b2c3935bc1dc23bfe22..22d0eaab35eaffac0bca58f8625ecc5c955b6631 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1a616a71c36ace29a74a0aa23fc8173443aa49a5..8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -748,7 +748,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -799,7 +798,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -836,9 +835,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.51.0

