Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7DA307AEA
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511410; cv=none; b=CBgOza3E82832+FRyS7//6wPFE5mhx6TIU5qfl2qIdDe+OZFsUe9OU5dwmK3oHEzVUfgg1ovnJ3nkrLrGYnRQVYbn64sFNSx6WkDUBEjuVLSkSCPvMzToYLLyEZc5RY/9gJzV+zWvMjU7wVddt3tdpZSN8fmBglY8Zm6pBXSQ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511410; c=relaxed/simple;
	bh=ZivlGpi+T1c5DUoMpOPkmITE34pLl/IzVvSOHSJ88dQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qy2ZilNb59bhsUpZ//qwPntxhHdoToNogz/DvRsU+6hot6E6UvjI96jsucCgE2RmAhNEa6N9EZuJHf3gpXDpqjYhHa/CufwSOG1/45wVC/gLt4RgmbUUMacs9x0z8OSi6Lm61wx+ciweWltRyxJ0vFr6XWcvqIfcX16zxe5POkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QMCMWwWq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QMCMWwWq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4710022571cso5689005e9.3
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 02:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511404; x=1763116204; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lK1bWhoDlOt3D7+OTYGFbwlQlHjc0qM/7Y1vcvdtOY=;
        b=QMCMWwWqwtm5jgo2iqEKgpCc/vjZP7m79jHYhtre/Hp0pAjvj7AwUmKqjLy1G7u90G
         JrJhnAihYvi7wdZOUlw08dQcnIFseU6Wc0U2WCVqc0DGFAiBFzkCPbsUsnkQSMFyPFiW
         FlnQ5b6QfJW9dtGED+5JqiNnHeqfYzhCG+PZEJhr2ao1N8W5HmVuvK3d+vInsTfn0RjS
         SmHS3Vt8yYiaxOu1tiMwhf6CH2slqmkuwlpvB9+RmF8Mqu78YaMQe/vc4JssP5I4b7aX
         HuO+4bYerr0xoMDKKfCckdaQiNYQXCmDw7wn6swoNTNxdwxEvsMuoVokmdh+2Vn265ub
         1obA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511404; x=1763116204;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lK1bWhoDlOt3D7+OTYGFbwlQlHjc0qM/7Y1vcvdtOY=;
        b=xS/4+c0atfcoA4DOX/AF/vqnV5HRgXtTPBmOHbAsxvqtukubm6eds74rWt68WeqSM4
         P3qK05tC+j2W10Xy5QiZ8AlT7NoXeo10ysaCy9Teq3iGt0d9xlcYuLI7YKOOHpeTEV6J
         1Oo75PfWBujgntxiKhsqITBWGG1kaTbQJuutRFDT7YvMaYUue40+W2MjRDlmTRq06CiG
         q/o3Dvqdl+R/K2UMjFhW5MprvHCASzprGDciru04XVpjvj08gYKi6/xjt1CrSO4fU6jS
         /SY+8UPhjrps5+/2wvvc8RDudEupLwZWjcZN3LlSqKqhOr+NbbJXdx6yrj9Bi4lzFYdu
         NBnw==
X-Forwarded-Encrypted: i=1; AJvYcCVSl6B4405BEzYUVlJv/7SGqfYVQsW1pe9jH9EyVJXNzF83LGltoWzY7GNynA0A4YoknQY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmW50+yXEm+qNUsaKE2slSHgIEj0PCmQZEjFsvB7THWGFKt+G7
	HRZp8I3mYKfA3mcjOMrztgVkHAxda8CYBuRgt3a79L/skg1FKOMdMSg9DlulsGYPihw=
X-Gm-Gg: ASbGncvN8AYnRVpIbHmh+nKYqDSuFw00hNdZ+X2DDaawAskNgGYOqoEbB2Q/L91Vxgm
	HXrXIzdU1POQl+EQKtMZgdw7EWMaapRqG+N835wwHD2HmlbYUHb9D2PyX/lrby7iuXwvtJHYKA9
	GTvHB1H4BWypcvyCboQQ6LOo1YsGGw/b9a2xfEHiFIseXThRxbgzfmDl6ABqIg9U/jemOeC4LwP
	Lw+eQnOpLl3wua8jRN7aHDKcV1MlKC3Ws3azOs+8RJRn8+tuhsrH8yQEZADUk/tGMy1ydlMmJGH
	1pJyBynqAPafUCroW7kw1wpR4nrbgEn+BN1xez3ACyPtlBGpuzIQb4aF9i2uyqz354tskyCKag/
	PNuQ2tXF9OJKMpuSfeL0ulhZo7VWA7mzbrgUmW3YMqC2KgfdvXHCIZjfwaTf13iTQhG4x+GrTGu
	hGT37ZueYa0n87uw==
X-Google-Smtp-Source: AGHT+IGLasgznDpysA1VVPTGU5y82R7RrVgkRw3m6DuFOG2T0Xrl7Qi/ZwJh7t3lCXtqhciZW19mKg==
X-Received: by 2002:a05:600c:1384:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-4776bc93e89mr17460965e9.14.1762511404248;
        Fri, 07 Nov 2025 02:30:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v5 0/8] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
Date: Fri, 07 Nov 2025 11:29:50 +0100
Message-Id: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB7KDWkC/23PSwrCMBCA4auUrI1M3q0r7yEu0pi2AdvURIJSe
 nfTCorY5T8w3zATijY4G9GhmFCwyUXnhxxiVyDT6aG12F1yIwpUgAKOb8b3OOqSCjFi22uDSy6
 BMqGNIBTlvTHYxj1W83TO3bl49+G5nkhkmb61isCGlggGzKhWlWmIlbI8Xt2gg9/70KKFS+xDE
 KBqi2CZUEJJVVeUga7/CP4lyOZPiWeiUVJKgFIZq3+IeZ5fGplk2DkBAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4165;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZivlGpi+T1c5DUoMpOPkmITE34pLl/IzVvSOHSJ88dQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcojt3k/2PQCBq6F4SnzHXqKBXG0p9VyMcZAB
 IR/euEb67iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KIwAKCRARpy6gFHHX
 cq4aEADTN+ZUS9OBISS21hcbWDotjjlsSXxfMzNstpmanMhTAjTDqTozFbZykCw0Vf274vKfVTb
 3g3WrNgP5cYiyZLsDLBQrRu6Ymi7HMPV/05dLA/ZwUDNCnI1z7BZ88PIdxY5BkCZVJ3GKChFHtc
 /MO9zH6RfTWIudWrMD7Lfd9ZY6jZIvDoq773GGAi6RNBmUIuMwrmFa6KoiNx9FQ0NswFVmDySZh
 JXxm6zVaFTbIkl9oXrLqI2XJ/gVgWH0/Z84+6CyYJJfsal7i8ARil61hGY321B8LC7SosFR+j7j
 B++DT5/YtpyqEq7RWzvA9k+oYt2zfujGqApAhNHp98SeFy5vw7tmBvrmtAU5n+KbCm9f3NTe1i2
 fknVSt8R40eV+g1TckJWN/2/vn4TyZd0s9D7Xa8ovqOBTJDAbL9f+suLfjhBL3R5AIF1jlWhh64
 mk81XGCxt6IW5TnYAMUXhE+G4unUmH8c2hdj/NqoR1owhNhOADjIgBosXOV3YrxLMKT0gL57ydA
 hvbBFUSxE6/hrs7QM6W8VUkwoGv2QB0OI8zxJo6s2F2ZMuoMMLhGpkgud1m20fPaPHx4HQTSZR5
 +NT8ZRc9bQyTREbDWHw9J0JKcCeAP3mxkCDn1v3X1p7YmUtI4pBF/WjLgOT6OM9riUztf9yMJFV
 h4+xLNJvvsQjMdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (8):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 ++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 342 +++++++++++++++++----
 26 files changed, 448 insertions(+), 63 deletions(-)
---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

