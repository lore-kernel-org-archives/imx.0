Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889F15B98E
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 19:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712086553; cv=none; b=kGwUTwd5CYZC1hC6zO54cq0E2jaxaQOtbWsfd3avkhwMg1zfstdNIKRTZeA2ESpHlTxEm8JrHaM3JBCXZluHsmGmjgZyywZyXafLFLplLZfBLU8M9/CpbA0kxfhlIkSfYOU3LqJ0Am7l0q0QCvn7q8rvu738wliDhIFBM+zQgsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712086553; c=relaxed/simple;
	bh=w6Zk1mErBPhMR/fPvTKIp80OCxzxeQAfQ1sc1ZTrGqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WoUSRRR4zIvwXeQ8jQc8Bt1THdMMbspr83JhgpCPQsD23rmblxfNqAjuvgWdW0A9HaL8vWt+sZd1XEu4CrmyKE/CPuZRC1Vre1y8vxJV1NxU+XX2lzWrvauDpB1Zf+EZhDtB0MxuXmjW5Qw1eFKuEBgkbPNFRKyZe+0CE3EjFRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQHK8CH4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQHK8CH4"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e0025ef1efso38253235ad.1
        for <imx@lists.linux.dev>; Tue, 02 Apr 2024 12:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712086551; x=1712691351; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RngipVMjADW9RKKBJpWn5bUjtga81BHfJMQO2kVCeRo=;
        b=XQHK8CH4k82izU1OsVlJUe6NSo1/ToKHs9BoF3XZa2RyxW9/R5rRPKYXDDLVAluE4u
         uMjBu5S252WNu0zFA25tqZhZv0Ux2FSgCaZlISWn7sf4GZSedKiTgwJ3ZD7jNXGj+O5Y
         iwNnQKIdFWZMFjAOm0JHV7fDmBXtfQXNC6oMfqqwMuRULW1dWXEVJFls6l2nT+cEXet5
         gB+z+fYiHwtjswEJWzpLbDXuL5mFipA/uo00bZWhELuSnIHhYa+9ME7xm8yL1kLoDKG4
         9vd9OJWXdBaVNdJEgkDoTxEl3E2Kf+3eMOQnbqVM0VrPFqlzFhH3nebMrcAlTbSYzzFh
         /BMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712086551; x=1712691351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RngipVMjADW9RKKBJpWn5bUjtga81BHfJMQO2kVCeRo=;
        b=ww+4vXD6y0YHncKVBa518tfxQzrc3zIX/G/fvgkZ0V3bin5Ha+Y++hJ6Af6Q0MCA6q
         u6EsW/pmzMzFCWV0GZreY3q0Sg0XXJXZttJ2hPDSiHOP5pUVcZ70vORK6V7B6uQ/MfCm
         D09jvkRWgy9GbxGY4XfMtz47pUMmcCuA6MGOK5Qc1+4Pi5i6Fw8IrclhTY4SMZE23+6t
         Dnq0diJmEoFTwm+SJzrrehbYMTnN+G/w9hf5z29zyJ2ANvCq2fg4f5l1m4trIDNlVMki
         xaox3OItgxhO1dRtlWzI3gFID/RG/nEMIJRr6BKCV2I+tu70KUdg9FZu900AuIBm2d/T
         PuFg==
X-Forwarded-Encrypted: i=1; AJvYcCU3E/HU1/Yz/KF9cfM3dx7Gu+jxlReX8N/9t9F2QkNetWxoJvnpspJ3Rad8NvfuqFUOyDNRpiA39hYoXtIZXBgq70zD
X-Gm-Message-State: AOJu0Ywu6E9L7KNvIuBBVgA5XzgkG2bmh8YsdQCQ0ZxdquBHMLVl+Dhv
	2yYIFTW37BtiOKy6JPapRRZA/GxHWcT2ETCWuJhjJHZVsZFVSpGt
X-Google-Smtp-Source: AGHT+IHkn8aFme4OXrpn85RNfDGAyTRZqwdG1hTXtcrnOUJFUUK8ztRNaqtmIG4ZzSBOiQNLb8Lvmw==
X-Received: by 2002:a17:902:e80e:b0:1e0:1486:e80c with SMTP id u14-20020a170902e80e00b001e01486e80cmr732619plg.7.1712086551183;
        Tue, 02 Apr 2024 12:35:51 -0700 (PDT)
Received: from frhdebian.. ([2804:14d:8084:b86e:ac17:f518:b547:13a8])
        by smtp.gmail.com with ESMTPSA id g6-20020a1709026b4600b001dd59b54f9fsm7775841plt.136.2024.04.02.12.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 12:35:50 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] arm64: dts: freescale: Add Toradex Colibri iMX8DX 
Date: Tue,  2 Apr 2024 16:35:08 -0300
Message-Id: <20240402193512.240417-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

This patch series introduces support for Colibri iMX8DX SoM and its
carrier boards, where the board can be mated with: Aster, Evaluation Board
v3, Iris v2, and Iris v1. This SoM is a variant of the already supported
Colibri iMX8QXP, utilizing an NXP i.MX8DX SoC instead of i.MX8QXP.
Therefore, this patch series also adds support for the i.MX8DX processor.

Hiago De Franco (4):
  arm64: dts: freescale: Add i.MX8DX dtsi
  dt-bindings: arm: fsl: remove reduntant toradex,colibri-imx8x
  dt-bindings: arm: fsl: Add Colibri iMX8DX
  arm64: dts: freescale: Add Toradex Colibri iMX8DX

 Documentation/devicetree/bindings/arm/fsl.yaml   |  7 ++++---
 arch/arm64/boot/dts/freescale/Makefile           |  4 ++++
 .../boot/dts/freescale/imx8dx-colibri-aster.dts  | 16 ++++++++++++++++
 .../dts/freescale/imx8dx-colibri-eval-v3.dts     | 16 ++++++++++++++++
 .../dts/freescale/imx8dx-colibri-iris-v2.dts     | 16 ++++++++++++++++
 .../boot/dts/freescale/imx8dx-colibri-iris.dts   | 16 ++++++++++++++++
 .../arm64/boot/dts/freescale/imx8dx-colibri.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/freescale/imx8dx.dtsi        | 13 +++++++++++++
 8 files changed, 96 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx-colibri.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx.dtsi

-- 
2.39.2

