Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5222C3128A2
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 12:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221971; cv=none; b=aNpHCnyzuczsNq8vSEwCQjYqgEtawnwbRasCuRTPWdMBumbPVz36zew927mYY1j8p7tWQcPHUUqQr6hEIegmAdsoMRD0sA/bAuVCqEyz0Uyun1aia3eaAme81F5aw2iUgDxgFy1VevwO06ZJ7o5/0kAN5Gdw/ZL76jH/jIwLJy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221971; c=relaxed/simple;
	bh=j2RY7WVYLSN+jWxemj2+54D8zSqqYRLj140qaFpBs2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E7D43KG9slgmz+9rC2ZUBcGHeWApYC6At7TlNkM1LpALeHPgZDn0msQLtuvB+9xhawSrHhnQacfNyWJyls8pkcqnQcWDEOE+SEPSvfXIBX/JWDryz48Dk4UbEXNHHeyuu1PJMiLJhdFWOO0c/8I6ifJy7e0lgq0G9yxJYno/jtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCbsV78x; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCbsV78x"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-330b4739538so719644a91.3
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 05:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761221967; x=1761826767; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H2q0viC1oKDoybdxIdGnsDv0XEKPZJRHKvcrkOAaotk=;
        b=eCbsV78xwSbms4GgxaOJYfxcrJwvA6a7KV9MsuT6Y0zj7DeTFRp8GQMDn4qeQUKZRk
         avJEyMunyrIwC8+tvt+TCySpQmD+aqNYoWy4Xa1MotnAxrYdhHXSGEoMqTaPmf5NlU01
         NYjcjrI0rcl3Z2SfMTz6VN81z2FoIemCOVd4odrX2WO6qwho3FWgfPU7GVg6qj3VnJdX
         Lb5nAI+sjyCq+jxW4yMCVeXPJifoA8JtaHTi4UzVYMHzfgUMkByxJSN0dTUOmAhp3bs6
         yfKyuE8rFFKeM5yeqvetcUai1uvrfr1iAU235myYGM+6AgRKEKukXswr/tUzHmHHThaa
         VusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221967; x=1761826767;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2q0viC1oKDoybdxIdGnsDv0XEKPZJRHKvcrkOAaotk=;
        b=GXtjusagqmcCL1VHzprk+Rbp9CPK7NPnmfdCGB9y9kBJxiT4mNQ1JunAWBp0k1/GyZ
         62joYR+4ao19PfnHOz5i9jx+d8z9wCa/jDo+3z6Hge2C0myj4tIttGDIFVj3N2u0QEB8
         11VNy9i4rGGFChUMmiT4MuGXCnTc4nBxsD9g5QRr8mFICTwxLfpmMSeCr0fE32XWPGyM
         z0A/zWMlrpQW8Z1XFCaQ/DIsDktyKMQIrlDQI+ndYddVLwWg0+q4Fnw+CwkNeIFLqy/b
         JN53xbLlvhp4zx+5lt+1O0rwV3HVnpKpCf4Qd6tFDStyy+Tfna8pT89jZ1jJdI5mSmFy
         hLFA==
X-Forwarded-Encrypted: i=1; AJvYcCUvneIZGlZa6pKfJN+0t7xcmQONF/L600W+8NOmvxALghp32sPJTu3ON+b716ov8JY2XFY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwSFkEUbJH3/wzBwc6XzHHrekxoUlOsqLWYb4K5TVjR9wcL1Sa
	uGgEoTXLj00acg2wc+yhTGfNbkyJKLEc9a3V2uNKIC+EkLDKnfalfcl6
X-Gm-Gg: ASbGnctIQLY0G6hu/gW7TqNqiCnFZzKZJ/O3iekCdGGTUw57JZ+ltygTpDxwcU/tqGG
	VT2mCezx6RpaxYeVsENEF1xUvp0sEj7/bmM9dwINNzreS3r6Y9j+QEWsA5NhSXJua6FdEdecSSG
	EvgTSQSBuBBz3OudkWLeopMvSgmmZhA29jP0pv+G4F3LVb/4gntzanHzuCkfwhlkfzwJUuJZbLA
	tJzlBPCukBoc3gJNtmaXdtY96c/5ewnCxyirW5Vn+Egkc0Z14+/cReNoRbwjRzCHUIrNc2oDeDZ
	iG0Q6FLi/75uzCFycULsrI59T4WeeKGbYLDB4A8lfY4Ou1qaHPErB4E0ULH3JCrP3mKohEWn4Jd
	emW5d6hJ+RW5ZkeUZ+tPTvwDLDZYCaOoKb3Y+XqrDzFsShsJ0ONuM+1o7l5MVYOxOcf84ZvGCsG
	q8zZfI+29fsDz983mVuZ5rmDeKmr/nde1oiw==
X-Google-Smtp-Source: AGHT+IGJ23GsrNILCdW/8gbVtgjCsaLah5E0mTNdpSVoeuNI9VqG0QCaBp4Eb7N3Z7ssAPYGjAzlmA==
X-Received: by 2002:a17:90b:2403:b0:33e:2d0f:478e with SMTP id 98e67ed59e1d1-33e2d0f5967mr4230135a91.3.1761221966488;
        Thu, 23 Oct 2025 05:19:26 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff37c14sm2277474a91.2.2025.10.23.05.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:19:25 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Thu, 23 Oct 2025 09:19:15 -0300
Subject: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting and
 Ethernet
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
X-B4-Tracking: v=1; b=H4sIAEId+mgC/x3NQQqDMBBA0avIrDtgIqHGq5Qu0mSis0iUmSqCe
 PeGLt/m/wuUhElh6i4QOlh5rQ3m0UFcQp0JOTWD7a0zvR1w3/QrFApyOb1DLUEiJspxrZlnHP3
 Tpo8bnDcjtMgmlPn8D15wGHjf9w9b8i5+dAAAAA==
X-Change-ID: 20251023-upstream-imx95-smarc-defconfig-8972db535918
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Enable the necessary missing configs for the i.MX95 to boot and also
have Ethernet working:

* CONFIG_NXP_ENETC4 for the network controller driver
* CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
* CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver
* CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..787d3ae3f5afeac486a905e0943e7b0e1dcee3a9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -354,8 +354,10 @@ CONFIG_FSL_FMAN=y
 CONFIG_FSL_DPAA_ETH=y
 CONFIG_FSL_DPAA2_ETH=y
 CONFIG_FSL_ENETC=y
+CONFIG_NXP_ENETC4=m
 CONFIG_FSL_ENETC_VF=y
 CONFIG_FSL_ENETC_QOS=y
+CONFIG_NXP_NETC_BLK_CTRL=m
 CONFIG_HIX5HD2_GMAC=y
 CONFIG_HNS_DSAF=y
 CONFIG_HNS_ENET=y
@@ -615,6 +617,7 @@ CONFIG_PINCTRL_IMX8DXL=y
 CONFIG_PINCTRL_IMX8ULP=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
+CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
@@ -1349,6 +1352,7 @@ CONFIG_CLK_IMX8MQ=y
 CONFIG_CLK_IMX8QXP=y
 CONFIG_CLK_IMX8ULP=y
 CONFIG_CLK_IMX93=y
+CONFIG_CLK_IMX95_BLK_CTL=y
 CONFIG_TI_SCI_CLK=y
 CONFIG_COMMON_CLK_MT8192_AUDSYS=y
 CONFIG_COMMON_CLK_MT8192_CAMSYS=y

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251023-upstream-imx95-smarc-defconfig-8972db535918

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>

