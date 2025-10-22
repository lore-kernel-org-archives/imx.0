Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E312DAFDF
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155002; cv=none; b=nCBl2DMTS9SI83GeSOCHoApchU3FQGl1Ysv6ynvmhO2EKQj/eRKgZyGa2uVG1N43IdgmzZ9W+aZkE3sg/FjE1XPvhF89LiNivc4AvJ2nuD9pbF9hOs8e8cc6irgnaM15PzntgnlvUZUH+H3xOSP5j8mZwVC3kV78D63ekGKogBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155002; c=relaxed/simple;
	bh=pebkCgjq2t7R/8JhhzKY0KYiQYww5PdgMrly8jY12Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SuCx37W/eTV7426cWTvqWuHzQRn5TxEJtIRE3Thqo5bG/8+Yyn9ZpTTnokoxTUhsKjuB0JWjrOEy+Er6/+xGEXkwtEfKUHRLRpusy5S0xLS3e5433Ndr3Efl9hyRvg52vbBuXRtS8g9zw0Y2xxhDtkfoxWEB+F97CbK8HvEAlDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DcmGZe+U; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DcmGZe+U"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-426ed6f4db5so749980f8f.0
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 10:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761154998; x=1761759798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBgZ5OtYg07NCXp61kXr/BSbIWhE2fs8T+/yOfxFjCU=;
        b=DcmGZe+UMwkfgAd7YcMsyLk+ZyfdH/TlR91t5muUGxM5xwkKgAWut8NKjwREL/OgSg
         28EBUNDHVo4YRd62TFLPptHNrrhB+pawLVwZtEF4UCgv/rEEzfPAh2PMbKaV1kZ7leuj
         bX6O95h3u2Re2ebp940TGK8grTVu/rcNGwklsneHmdjRiECz5uM+afbcNDJy7lHfSIdK
         KUg0HjAkJ+GM8QqCoVrF+z99BU5SerLA836g8njhQ3ZWwN5COL4GqsoLv/1D4/fK1YG9
         xkC+rhghVvGgQ0iT4yHX+sOO4DTHtkMIhjTg/eITyy4QlWDZaCaBI9suM2DcylHLNwdm
         fkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154998; x=1761759798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBgZ5OtYg07NCXp61kXr/BSbIWhE2fs8T+/yOfxFjCU=;
        b=m6iBRNPpyBIzoarSvalEe4I/Ahs6rntgFW9SxI4pqAZscif/vAVf4qyRpCfZEKG2Gg
         3Gjsfc7mqk0sW/u2bWgZfH1PEIIL95zgKfnHlOBXsq16puOcmlNCmP/60V/T0/3Xek8g
         VXn2gWRfi1kMht4dRsGh+q2iCdbEd+IxpF3fRP4bw5782xgLz5t0VcMyYrrjMtpdJacn
         AlVsa/WVCgLxT2iomfbFCJ0HucO4D4ny4Df6xoP1GjewZ9ySUIqtz6QnSrphlcag20OZ
         tk52OuGPqLiO62uo5QrUzpNLpuWs1z9c/sahLm/WOsmSryYn6TtVaRvgn4rbrGdU+5n0
         nUMA==
X-Forwarded-Encrypted: i=1; AJvYcCWMgqmpLXFfW+WrC4ta2UDJSwuIAKFdqAHqk4rYIXpqg6zZ1gS4pOHNa62UuxDJQIfVtvg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZZ4xr9M4CrRzrN0ejMmkSP9ym4S70lVBerzxV5CEibld7Fqir
	u9eM+Wf542sPJNu+9SpKQk6EYLyokCNFBjVHkXFKgnsf636u1uHRa7xpcqRgVmvnLl0=
X-Gm-Gg: ASbGncuEndEp3S0ENFziHWcM8AkmXNFQ6ixuGMpatTKU5bj6JPorOjgSVNAF7fh85Kl
	MboufhuEppUubuch0c3Bptc/lfn9BfliPWaX9+Ct9bG8Lk7sLF3OEXpZJLB7UW//yVBZlIEplmB
	UKMT9EOcmw1wVTFPdUr6OR+14RMz49aQPcyknzaDY8UP9iutWd+DyjoDedl5QinpjJmPIiUQ7T5
	Dw1CvGaIaFGwj4kmpqE1TQQikiOofDOzjI/CB2X0VMNVmeDH4dk69bLQZTNV9X//L93RaVfkJW2
	7Fl5k3498QHyxdHtvmG2KO0DKHDvkQKRpNK69QYTvRKnkLbcbH4A42jXcBpSRp7myIAUvdfhjyg
	3kU0+9Gj8IUGUVU/56tokf0reoy2Iz3x/js8wTj7fmbOCxSUYXK3hPvVGVpm6Hq9kMoEAfg9Fc5
	gKnrVfdPbP
X-Google-Smtp-Source: AGHT+IFjziwUg1Dl3LOqBcFgSgns22D4G3uLdqScO3DNYkyYm03zLF/NNOMCJcEGGUm1q7BfvTYL1w==
X-Received: by 2002:a05:6000:2289:b0:427:84a:6db1 with SMTP id ffacd0b85a97d-42856a8c525mr2170414f8f.31.1761154998227;
        Wed, 22 Oct 2025 10:43:18 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:edfc:89e3:4805:d8de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494aad668sm43434755e9.2.2025.10.22.10.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:43:16 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 4/4 v3] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Wed, 22 Oct 2025 19:43:09 +0200
Message-ID: <20251022174309.1180931-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022174309.1180931-1-vincent.guittot@linaro.org>
References: <20251022174309.1180931-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new entry for S32G PCIe driver.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 545a4776795e..e542aae55556 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3132,6 +3132,15 @@ F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
 F:	drivers/rtc/rtc-s32g.c
 
+ARM/NXP S32G PCIE CONTROLLER DRIVER
+M:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+R:	NXP S32 Linux Team <s32@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
+F:	drivers/pci/controller/dwc/pcie-nxp-s32g*
+
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
 R:	s32@nxp.com
-- 
2.43.0

