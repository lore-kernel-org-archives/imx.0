Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE88E303C93
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261788; cv=none; b=KJ//5Ke1BLKSCSnb9y1n+huvAb6tjJA/oqaS9zJjignG5Ql1g0QPuSAQhhaZ59Vviwidqln0JeYu5IN6jB0A1ljcPbj9IsNvUaQpPCH++BnyIY5NMYorg2q8f8BlTdSLGyR5VSUWwURjzbX/5I0ivbuqfJNF9ULIpvLFZhiTszk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261788; c=relaxed/simple;
	bh=BTzIyLnQ2pVcjPzl4+AQTmQgi4C/R6FPWEbJ7GZ3dIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppoB/12e/jGN9Yf85sGkzslK2O08sxbaUYVa3BUZDz2sw02bBBXzDOvi+SnwPwuWxk59ND9dZyXMbHwE13koSAAOqu0jy67OGyUxy5wgyYxDU3pxPQV8arGhrpqNqc/3GrzbJXEx7y8oBWHf0hfCFyvXLF22pzfxM0zWaLRyBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZmHJuT/x; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZmHJuT/x"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429bcddad32so3279685f8f.3
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261783; x=1762866583; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7G2ramQk2hxdGs1tmlSj6o/OfknwFPaFfxdjJIosVo=;
        b=ZmHJuT/xkZai0v+lixRfu+Nc6x88k/HEe1z+CCQz9HwL5CPk5nu2tTKB2xqHDo5OMY
         Hy5qwM0d3xLyugm4vrCR6tnixcFJJLwGLVypdwjXYBf4mJdjv28MDV0puPARut9higM3
         dFiCUNPBIdGtbkmTRlkZNEQmA0+y9HIvFbxYZlZLj1io1XL2hdN45gdloHy9K/yFUgDK
         /c5I6quhuyJlPF/fbqh17aR7lNi8v2si8E3f62cXdDZh4CjcjnCad3RwH6OXONDxH6Yx
         LPla0ftcMf7NDhB8H0ipidTkmHEq/Qmo2Zzm4dH7+hz3xV/EfD6I9nAp/ZSVlCIActOs
         Mmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261783; x=1762866583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7G2ramQk2hxdGs1tmlSj6o/OfknwFPaFfxdjJIosVo=;
        b=CE0iv+ub9HwlGCY3TyH8Tb5SjlRZg2pP1u0HY2vk/XBffrMiRsA6oPLAEnsSbzpy5m
         EhsWWatLUCaCqmm6Ap2PuTRXaQRTO1OJSLsVU7tDuIsBylJ9UvoFW9Jvy2fGaJlaJsSy
         ua7VAyqFVp9lq1hEQnwIMKt0y1tz/5Qgod356hEs15V3Y8ROo9Dv2LSCvg4tNJkq7l0v
         Bjr4YSc/Jslgu/066DM/OEr2XrkVFepe/8JR5cmb45QZ8ENH4KKB4Bh0HvCTX82AbAhB
         BcZDvzoowTSbkvgHZ1xCzERd1gpeAmc00HWkdmDBXwXrX8AvOCLCPqMa7ndv7ToYv+Aq
         l3lw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ6P82LY7sT20rZ6dxRW7kRGT9n+gbT15nCkJyW2j6sG+HKhw2x9OI0htr15G8xXBas9k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi/m965+lZRn+Cny8eNKD4EoyrGT6mL2FCn8loukOs5HccT1YU
	sT5yn0Ly3oYsaADLwAAb+0KRiIN3EeprvbvgUaJEECT7VOJl2a7w5AG0V7aVnO2BC0A=
X-Gm-Gg: ASbGncvYhxb0s3W6tZomkyrFXf48M0n5HPyW6FLpF3kJiTQMzROH78hyA4aZgv6nZp+
	9Qf6xXJMtOATaqS8GQwa59KNt8DBwDqNQF2/vZn77rBPHYaO+/hSn/63AVxYygMVemlCjRok+Ou
	gObe6qkQMwcfZYuCKIsIFHKdBS8NU4KHGMFh0vNILGv4NyLEULlGrc1Wdfb9R6Oj+s9gmjxcybr
	+Bf3FLLhhtPshp58LJJPLoDa+njH2Lw3cmeZeTQM40Drgb5VbJdoT+iEdfN93rRURU6AW5+tsAu
	axdAnDP+H/GxWfMplWnQU8NS2cYJ7bb80eQPa6ots+7iE0lRZwJkVSpN5XIR84F5Qo6kthV6Spp
	f2Nyhys68LULaNqdMclMYoVT6z4AOaTtXNBy8hyttQKKUv5TMQUo4YA1zsIbkYCxp2swTAA==
X-Google-Smtp-Source: AGHT+IGt39/RFIYRQsWApaQS4QlJBSyR/bfENK9HcdGp1Eg6T4YSk8jvmlZ1WO8dgmB5bkvcm4+SQA==
X-Received: by 2002:a05:6000:26cf:b0:429:c6a7:4cdc with SMTP id ffacd0b85a97d-429c6a74ff1mr11008945f8f.50.1762261782582;
        Tue, 04 Nov 2025 05:09:42 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:58 +0100
Subject: [PATCH v4 7/8] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-qcom-sa8255p-emac-v4-7-f76660087cea@linaro.org>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrucVA2CeMFxPGfABXbkXXyqSC5jmN8LI8mD
 yCNOJ0bLhOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67gAKCRARpy6gFHHX
 ciBqD/0XNJFi5uHJB6d9F1X9w/Akoe2fxdrPp29/FzIfuLlu4+eNY+P8ZHWXvGT21CWTBHzyLRu
 e0CXNLnV1f4a1wGZEvwBVVfisgS/M5avHcSEdAfYOIYk0DcbJfKIrYhpJprz/82G+ujPgLdl/kn
 TaYBe32VUyJHFGX0s+6ZMEQZDKgAQ2R73og7Zw/AckjDePp2xiiEb11GU8ckU6wwQtG0GEURGh5
 TFXn2h7JLMGoElSLJlJFYz/1ZBC9CQqcX8WPjpHcIOHDClY5dmoMJ0E/A/nsdOVC+1eS4HwkZtf
 hy9I8tBtPs/FIb4xoVM5zQbLtNu5pfkWYl0IL/lcMyRYfV51YrMG+As1VTo0lemfPcVLtf75muB
 sthcpgvGIFJ8q3uxmA6DmoCAA9zeUYYSOpR8Uv182IqbYfaAnhLGu/XIuLcivlPoi3eFqMWCSq9
 nTgIrvu5OVCSrQ7GXx6POR0ysJ1GJa7axDRNaThJUimC07hyobjKOtejPjjH6MC5zAeIOgAZXA6
 WdPsoVGTqwtOeotmc2KOOZQnWeEPyo//Hd33noVu8pQBWmSLyXgsa3uIpmDbkeJP/bRuUA5BfNp
 0D78mPjyDVvKS3gSyXyjG1KXrnjeuov9V3NvOVzkiMghcYQTB9IMUjf//vqgCNmlotmEnX2mptx
 QZ5kuabKK8e7LFQ==
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

