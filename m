Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8146532D443
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766160565; cv=none; b=TiDwLMovxRb240U/TFXSxChQ/jNIbM10jVQ2H6PZEXUZXxTX0ToSnExKugGudQr+xoZBiDK6RgiK0Lg/RJQSIw9WqovmN3hITBXlJyAAeZ1OmCgwh5JbR5VBgAY9ivBptPoI5S87MysykkIVX6011S4TaqW6zou3mCM3VFbOV4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766160565; c=relaxed/simple;
	bh=xCLPTytmwpg8U/KsII8GA6Xom6y/pOk3rStbgO9OET0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B4PXpRJjV+cpse6mV+SwV9EZFGJflOosREnlRMAOxe9G0vgl/YwPtiKB8pTP2gmGGUREMAhmrmNFGm/mg/TxIs7a6bnmRzCyjuWPw8MmrPKEXtuepV6JCI6+QmjNLYYann8eeW8Hr3Y6f+NREuIfDFXWPXk8TLrTBa9fzGhrjLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KW3CsD1C; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KW3CsD1C"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477b91680f8so17054595e9.0
        for <imx@lists.linux.dev>; Fri, 19 Dec 2025 08:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766160560; x=1766765360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ehay3M186LcXUFYG3p9/ITKJQ7Me9IhwqSblYo6+TlQ=;
        b=KW3CsD1CxCZhRzqw1mmRA9ogsoxI0s/QRQSrVjjrVoDfT3Ovn6uAu+l1LxWRVQ98at
         xsBHKkjCqzOOAxibNUiQxO6CN/c8Ux5CCV1b48aNWrsapPlb2YBfvUPCwkZW1/m5o7m+
         NhF8d/yQxC80T+yRiyOJuBld0rO3wD0VXSborzBXXREohAQYorkdI7H3i6WbnbzvXE6A
         LpAkHkV1IqP+UKio1vWJ5MI++nrH6MYweEXmcmZNoMUZNm6k6M+fFmUHD5/mMBkCi7f2
         JqvxU2XxfqO4sbqaxSr+INAVDIWTFuTFbMbFJaVE9okWNzGn43a5CdPSkZVyal8XAlor
         itsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766160560; x=1766765360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehay3M186LcXUFYG3p9/ITKJQ7Me9IhwqSblYo6+TlQ=;
        b=Dn7V7IKjJ/oCI1uSq33DDETWox//YfRdYkDxgCShmmyHiR9uWY+qbOYonD7mssQoqR
         seFQvR/FR5s8PDjH1eKSh9J/e74PP6ZwPaWVuzZUYAk4xocbOAOzgfReQNUw9xnJpLLh
         H21x+ezsPmG7d1CFrV9vZjMJbVnyzRFBI1XfVtcvadE3hKJb4shq6GT0RKMSAQOypIMl
         o8JNmJZPeGzExJUukVqBeYzQoq9JazHWqYh80MFst/zRANkQh30YywK2upSaTlmO9lrL
         l4hiuB399sRX6C/DzBo6kZuJ6A6wU36vNtQ5HiqxgRWC47oCVQ+sFCFC+3Jdz9ORmPyc
         uvOw==
X-Forwarded-Encrypted: i=1; AJvYcCU93gX92uOPvAyTAXmNnNoOFAswePBF5a4zT1cg33Btp93AxJS3Shekm2+LTJaYd339rg8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoBJS4CsRyYYsiRlzwYYeEInkJFGoULutHv/9ZmT4L51szn1Dx
	Werij0/QPfmGW5CvWdZ73RgNs+itRb2+J//c8JTZANOZiQa+k2isaIzB
X-Gm-Gg: AY/fxX6gRRPHksa21jWMuZR9R3p7x8EmSXMJxCn1nG9geatWkzRpECgEJ1XCba7MV8R
	YGt1URRyhGXHS1woRBZ3ir2IPsFIa4DWRDvSfn/7IaISi2sYDsv40+dpAE/iwvrJtvjm46KuTrT
	R0bJiYaDvhhJHwqi+fSNaofxudcWoEi+ji/TnodLsFpNGTsMLXk0RNPfbe2MgCxbM+d+qE56kGz
	7EB1OyYgST2xP11zmBmijBj300cRhMsEH5pD5s+zr2kwso4ehR9kZHlXkTC7tWmR/RSHWHe32xd
	2iqzya1eyBepSZHbJm8Mf8xsFMO/1QjxWM9FTGXu0yvKOPKHEatPafYuMB+ZSk4ZvOHeeszjx3Q
	eDECWFeJHictj+3wNTOA8T3o+Q4zCSbPnYi76Bld82guV+ksNcnpRcWTf6FKwPS8Wi1W2WGaf6w
	sqdITsWW8QCu+oIhkO2TEeRh9Sfdy2sQ/LaxdKfoKpMmM+qpavXMcDKTPtK0Cp8KVuX48dYw+cr
	0luKfhcvSL8qcc=
X-Google-Smtp-Source: AGHT+IFZw56LBO5z3Wi45JPES3t//vnNXh9tW3SPvp6EG4Jj1i7soALK54FoiiJGWBVoLxuqYK7Ueg==
X-Received: by 2002:a05:600c:c08a:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47d197f67edmr23573275e9.27.1766160559997;
        Fri, 19 Dec 2025 08:09:19 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193cbe58sm49840975e9.9.2025.12.19.08.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:09:19 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	j.zink@pengutronix.de,
	linux-kernel@vger.kernel.org
Cc: xu.yang_2@nxp.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com,
	haibo.chen@nxp.com,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	Stefano Radaelli <stefano.r@variscite.com>,
	Leonid Segal <leonids@variscite.com>,
	Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: [PATCH v3] phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field before using it
Date: Fri, 19 Dec 2025 17:09:12 +0100
Message-ID: <20251219160912.561431-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clear the PCS_TX_SWING_FULL field mask before setting the new value
in PHY_CTRL5 register. Without clearing the mask first, the OR operation
could leave previously set bits, resulting in incorrect register
configuration.

Fixes: 63c85ad0cd81 ("phy: fsl-imx8mp-usb: add support for phy tuning")
Suggested-by: Leonid Segal <leonids@variscite.com>
Acked-by: Pierluigi Passaro <pierluigi.p@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
Reviewed-by: Xu Yang <xu.yang_2@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v3:
- Fixed commit message line wrapping (75 chars)
v2:
- Improved commit subject as suggested by Fabio Estevam

 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index ad8a55012e42..9458b6e5fcf4 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -504,6 +504,7 @@ static void imx8m_phy_tune(struct imx8mq_usb_phy *imx_phy)
 
 	if (imx_phy->pcs_tx_swing_full != PHY_TUNE_DEFAULT) {
 		value = readl(imx_phy->base + PHY_CTRL5);
+		value &= ~PHY_CTRL5_PCS_TX_SWING_FULL_MASK;
 		value |= FIELD_PREP(PHY_CTRL5_PCS_TX_SWING_FULL_MASK,
 				   imx_phy->pcs_tx_swing_full);
 		writel(value, imx_phy->base + PHY_CTRL5);

base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
-- 
2.47.3

