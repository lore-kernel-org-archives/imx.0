Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3566F31B80B
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 10:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511433; cv=none; b=oOdX95ok8/X6t0kFJBMuOQDf3JZ7K1VnH78M5acgSoRxItfSE+FnscevVT5lZDK0p5OWoZvD0AOkpnUtcWTDyozPkNlyiyjzxmx1mesamGQq6SQ2LUK6NkPtL3eeb/eI8tWn1r7rTU1Xprp9M7A/5TSDPBG4gYsULGm36JTPL1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511433; c=relaxed/simple;
	bh=BTzIyLnQ2pVcjPzl4+AQTmQgi4C/R6FPWEbJ7GZ3dIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dk3G9TeT/3+AFpG4exbbarmPd0VIPDp1i0SNzMf4PxPTq3I3fUaNraFbbNGQUQHZnFskEzlhzjI06/HR1GBfzxtWcmdbck7lAZsBi+RzT55SKApJBQ4Rw8TztY5ucBeCfoHjj+V1demp3goFyfXP09q7lUb5jT6yzn5x1uIuc9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pEf8Enk2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pEf8Enk2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4711810948aso3915975e9.2
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511426; x=1763116226; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7G2ramQk2hxdGs1tmlSj6o/OfknwFPaFfxdjJIosVo=;
        b=pEf8Enk2uA1XGhdlNJ6ciVN/8QOZM0rTpZhLuN/YILYvwZQ2Irh2pH8F0IdmqII18g
         5QYK26Z9nkBF8cXgi6lfh+TW4ed+0tsl0qSTAekIPJdwaAUVi257mlrtabYw5WdY8TtT
         Mjke7bUNbO2tshVKRU5JFT5VzKTdaUZcNIbU3KSUKsDxTVsD05nco1Z75U+zThJ3p1eZ
         unuOPqgBw9IYhQSoEL1YgRbNkiLX1BhvMdjd2HVgcdrphTWOnDxnkK3AYtKc27GB1nsb
         05o7WTtofEVV1VOQJjJw2gSGisJ7Y+KN8LB/U59GKHNRT8HsgEXsJhaVbkyAieQn7iQO
         89MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511426; x=1763116226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A7G2ramQk2hxdGs1tmlSj6o/OfknwFPaFfxdjJIosVo=;
        b=KQI7Vf9yaJfGhPycpcKuzXvv1yyV8Pxc+nc+SV0KE9mIH75AIJPBU9fylWHIbUkW16
         K34/1l+AW+9Vel4/Rulre3xObhPWrck6W0NUeOsYyMNH+ulJdHlubLCzT6UtUcCRK+/0
         MGDu/J9dcEizBE/LDLQd6W/QjDDei/zqAXoWyyx03c51YjrAYq8e4CclULx//O7oQSXz
         5bq4JLlVC+85P+GDPYIscnJJUUt59qAZZxY5YJhy+m5CD6bt70iNQG7GxZ4sfczzAle3
         lX38R+EacxNkqDuZrc0bduN66W8mQEkxUO3PWr/7yWU99UVtCBLmlMc8Hn5uok6s2CTm
         B04A==
X-Forwarded-Encrypted: i=1; AJvYcCWyLoMSaXbF7rM0LodHeV28wjfcXqSKIGx7Szox8uZPLgfeKThwlM8PC+/kavDEu8lVSqc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzFJt1Vj77d90qZA/Rg0ZowbBTm9MUEXRFHEUezPrKkGX9Q+AU
	kG7MtET0wAAF3VeZsnlGpEQ2csMFrS4rs2FHs15DzK8s3EPIJMgrRPi2r97YEtzj7YM=
X-Gm-Gg: ASbGncsPUtKdd7ClqAA0ZXal2FYmWFM5NiiSHRCv+G509h6mqxe6CxobHkK9P66Mddo
	yiXA240Lo2sy9rQwsbnOtwACuiAokDhOUHVfz1a0KdIi5XC4dY24CDRKd5hq9o1EEVJnz1Yi2ef
	7TIEevVom2z+VXdEdKDvH14x5kxQHQ5Te2utRPIRbp+OZISNFdjMav5ZqXIHfOoyEKEiQ/3rGby
	WOwZJE5jaCJXqG3Z5/ernICRpqtVJBcllvFFNbq9YAKQhImJyVx4V1xUQwMLsGryGqi21IeIpH5
	VMgGb/QltdE5E7wefPytBZLBettamXNexUCz3U+o5WotbgPP40/4MdswVpJZv5TxWPjVB24YT9l
	11XyGryFyfz9aR7a/XYAmRB2WRa1bZo6byXM1tEXc3619EZPlDNeYkgSPkkid000lNTpewumg1b
	hhKKU=
X-Google-Smtp-Source: AGHT+IHIBx2tJqRLVHmEw90vFp0rp7ojXL3UXgjP5mQ5luFxcEaSq2ZhQysTlSzW77Ym94NwaGSiSA==
X-Received: by 2002:a05:600c:4695:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-4776bd04cc9mr22964605e9.29.1762511425524;
        Fri, 07 Nov 2025 02:30:25 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:57 +0100
Subject: [PATCH v5 7/8] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcom-sa8255p-emac-v5-7-01d3e3aaf388@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Yczz6nmRkpIoGqMAKNVvyF3zmCEkrzboH4PyVFVc9jM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcopMMZ8M5zQYmizMBW3totvKz7P+ctBnkiJX
 04NgM1FS42JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KKQAKCRARpy6gFHHX
 ckX/EAC9NUTeuFc1Qq8u9nvzBzxll6MRRMehTj3Mt9pnQD7hqBrWvtqc1jkjY1i2hL6D8DqCTNM
 ADwHBwy0x5IGuvWAJgJBtkLFqjNVBn4RkdBeT+fgNbc065JK/E5gq7+k/5CFt5J/F+vtYIMdUn2
 ACgjrXNcC1mGlubZtKqKfS7JYyF+ghRRLlL+Z6JFM77knoDS0e68XGH9wa9xSSur4rV1Z0dP0tL
 fugNnQ1QTejMfr7s8TEqIJUz4LUt9vj/mQK18PmZ/rCG5KRMU5elHEmQpzMMS5Hm4pJr/qghOW5
 hLfCpdzX8hXSeBe4J1Tqbmaepw1sZH76HsiPITTMz4FMAfz1fMDewaqq7RTgZCv2owuCs19v5SO
 ekn0rEpj7GFrQARyyOJ4+BFtm1IM6NXNFoEOec6ol+AoYS3CgMjxn8f2bvBVp7/yoY+kT8yFc/b
 QPgf/DeZGqa+fiZNjmUE5h7gv50ss4MqfK4zDAjPeaMF24qClKLWvvrH45j7PiNQFpa4BTG6D69
 r39IcYnucrELGDsODIPAKsBCAxWjQvw4XF7hlU7iYYvhCdUyyJPGAA5B+oKdpKV/zsULdmpSTQY
 gCuDCRrYfZkwiknvEqG20ltxDvZ66jVSUECOq7C2J0RA5MQwN1aNdvRTV4zOUcQkj0BojlaFihE
 yL6mFKj/t21Xc+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 09f122062dec87aa11804af2769ddff4964e6596..446f06b591a0b70992c7a431b56cf88c1b6718fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -120,6 +120,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -640,11 +641,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -865,6 +871,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.51.0

