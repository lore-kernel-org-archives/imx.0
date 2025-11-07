Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90A631B110
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511424; cv=none; b=DyZGAB0dtciwjBH6GUkXRyszhKd8tVrURHeG7SlGobgH0/STQWZCx1pKqZBrfWNjnpcuMNKNqPgiOzP37EB1T5mzhafxCGWRZNyyRgjCbCYkvWqPheVkaYeg415+ZqxkEFag4XzZhLiI7rk15evIoKXOPLO23p/n2EY7Bd9pqnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511424; c=relaxed/simple;
	bh=C6E2nfuOJyT6zEzejZLhVEYSKPR67hQomXuzQ9//N0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AGlVCH0mbA66tlWszS1WHZeG8/YchlAlOsJ2rr8J4Vszvi5nBMTxwkCqZEhHqZoAgmQENVUlFbLxsVBIxpdn8BY2zpqekCpRl9qbZuKrx7wZw8CECmrYzi65IALEJQyu0h8eNAXpNNirucsRQ3rILbpNbgCF9MNuoddQLmcYXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bfqB3pOf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bfqB3pOf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47118259fd8so3660685e9.3
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 02:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511420; x=1763116220; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
        b=bfqB3pOfe9HqRXva9EsQWa5cHAXAnNmA5UmoDYGGbzvZj6En4KYouLe/K1FCFMsbHn
         BeWlykEra5uvEjcbBoY24HiDFWdOPtMDVDqbD0yisKRajXxoWXwHpP1kcr0VmyQfsYHW
         qbfokFXTnSQk0NmxHmqqYr8B1qMGqnhxDPwn9lnNsdJ+YBGvrMTt8GlzMw+pLszzoo6l
         VPeefwr1xfV0CS3tbJEgrNWyHkGtd94JrVvvB285BGlWkTji+RFXhdnxUH4+eraUkIko
         /pQpkaWoOtmJmUklbWtOJe0zYQcUYVAGigb+pv5w0yinSQoGAyvtK2LMaA8DbmoQcEOm
         VFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511420; x=1763116220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
        b=BbfMFyGkl/+CenLGxdajKOst4/BGB9HYNQKHoILr+Te+pf749LBak5/Qzcq+dPnW7l
         ikcIl5lTd8NCiPc7TasxwNrxm1G9croKM6LgHLZt1kisyeOsaY2NBygjTi7gmcj6SV/k
         HI36Iywvd2KEZYp+3eofut/iTXwlNh1cWhSANk1xEvUvwIHikgXzswysSWXATwBP6AQ/
         1ScsypiSv+K7CPx95eyQvmfnfyBc9DFmlSAaqAm4N9Buw4i2e7Ouk/36xH3Q2x4MAhpn
         TYgbwSnKCUTlFE/PMMLekbzxXCs2fI/Ps1kR0mxZRi1tU9BLW0ouEZ8SMmG+ytJ8TP5l
         mftQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQQalgePCO3XA6MPBhgEocKkIfuKUSm4wKL5pi7jzUu8WnZV87DHlSpKDXENdmZJ7CSPo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxktx/Z491FLa04BeU6OcUgpJ73MrAfVgZsVRNBiKhVbkcjbYpF
	8u+pMy83/wIGCRnyAMwwIFICoMPSvIbQuqrwJsr3QNJuFwwIVHGLhQ9PW3OjpWZ8GSA=
X-Gm-Gg: ASbGncv73264Ivv4JjnZjyL+ufSoiYaGLa0/ZQwdRRcBz4oGyPJJA4yIe9PjP82lCxS
	Pkc6Cun6IEeNjjrJxbTGIBQZttG66USEOUVYLj00zQIbOvw9Xe0fkI3/V+qYymd87k9udS9yuj0
	LpibJVV/MSmTsx/4IQ88hDZ7snJ5rCaJ4PLWmSIcGi0amHn8OF5nlEpTREx+fr1e40/Pz/0QE9k
	AcrlvBD4KJ92GXcUKbWWqH49Do/gbW3iTG4Ikv/5eHZSnH2Uy9wn716UzUyTvTwcQi2KFaSfCj8
	9H8yJaaWWcsmIIGVAEMdawaGyS4RXLfKVjScSFj8Efzl5WlMyKDx65HpHnKu3Dj4DJWdp/X7Qsn
	LlvDtxaoxF8v1Kdv/cHFAXRvDOJZQ6c67amcyANDVxFvF/ePdkj8XOB0mZGJFfAN6Ekmm
X-Google-Smtp-Source: AGHT+IFKea4oH8KFgwyHaSc2l6blpKP8GuUwPAJgJx/KeJrPkBTKpHrnLvxgE6v/f0QnXtYHee9P1g==
X-Received: by 2002:a05:600c:4fd0:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-4776bc8654cmr24454425e9.4.1762511419489;
        Fri, 07 Nov 2025 02:30:19 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:55 +0100
Subject: [PATCH v5 5/8] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcom-sa8255p-emac-v5-5-01d3e3aaf388@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3440;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GhJny0rrOhbWO9GcfNfulcQ1HGUq/SGEEOh5ESB4E5E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcooKW8Y7IR9mSClISDLeDYYhK8iNiIaH/TPy
 fxuwujaev6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KKAAKCRARpy6gFHHX
 coQrD/4qTn+RVPw7hjcmgGU3/snDkcs3NDhDHvv/5Gw30fWDbq4JYVy7783sYOwPB85RJqY4S7e
 orJaF0tbCcwFjqBa5r8puEfO+0tE9C798uYzqB4byWlr6wBm4ZV6MDxHdHiFUueijk1GVKKDf6p
 g0vBL/7/QSHIP3uvzWFS0McUu8nUHMLyHlC4mDTBLNRh/CvqCrRhcCskFXvUwnq+mVRXz1wUxWz
 eDuRl3e2s3lfYQsM69iL9yBi0tU6BCfztIGXqBZZwjMcofQem0B48N8RmtBPROWrheeySK+WqZk
 OBM8gt2jphPBxF7VBTtiIk6NShAwzwpC4LOeJNfR7Iz4oMzbMZ1+sr+95ubeQz3fiF83h920czl
 MJwT3u6C5W6fr5f4J/BTXhnb2QIiyRdoOk2UI8S3GwfBO2JW8PjAMexz4jvF1bo1Y08k6rUB30B
 WQe+j+4ipBuswROPqGlXNHuAuYh0Ctt53cyQNyXmx2rv1Wz5rFkVXEI2ponYkRGvYXmUGdjCRCo
 EvX51dwNUgROqZCbihmyIjeymPgPQWSJnm27ZMUAE/b9wYySNcBPLTPheqUICJIZ4O+Gr8QFVWK
 TVRxJAFi0n4SyszGjUpLKWarMWT+htsRLk6A8LGgEbPjOumLm7HeK2SO6eVB8sCZ8rWG4snO4ZZ
 6c8vSYyDBZkk7jg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9cafe101049d5412d649b3beaca350c497ffc981..1f00556bbad997e2ec76b521cffe2eb14fabb79e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -292,7 +296,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -313,8 +316,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -771,11 +779,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -823,6 +833,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -830,7 +843,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.51.0

