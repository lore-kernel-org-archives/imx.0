Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E3C34A76F
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763743771; cv=none; b=jA8H5CmSwrD2UBF6ECoETp7R04NnTF9QOMv+eAu+6oDYIVuHFVijsGYlKCC172zV46Dk6+F1mLw9j1qlqMVD7Ba21/gxXSDCnJlxwnZrI480FrlDTWt4dc7tYHZL5xuSj2P82FGzKdKCgZW0oRWkaTBSZR3h8abpI4zvX7k72Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763743771; c=relaxed/simple;
	bh=8CNzFpWGHJiJ/kMik9XkodfqnXW6wo433Z1B1kwxkag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6VexTGelNejzcDP1yF71ak7vGDC2vRxJRYzEOEylJ+0V+OYHd2Fj94aYocjjYFuugavRk+u6I4xVx1ohuV8rV8u+NTZrEGnpB1bWdyMpu6op2QDnm6Ovz740aJ7NJolwjSUeq3BoUPr1kfOcklBgJIZOUr0hADUE/UHMAvGyU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bg4+lxYi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bg4+lxYi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso10816905e9.1
        for <imx@lists.linux.dev>; Fri, 21 Nov 2025 08:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763743768; x=1764348568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tA1YZwkpqBYNCNgFaNMq2uv3rKscqjzMZ5GFDmRce68=;
        b=bg4+lxYi2rMneg5mA9mRcDJwD7fgqfG/zJbO4RAs4Up+V5WqD+inXePxXCq6SkS1ly
         uHy57bi13En3y7IrUpcVwdZfCv3cOE0n/pybpztp9Y6Q//ZMAPRfPCnSchidA9+9HJaS
         jE48LRdly/ijKAeHOZI4pFJdyPInZsHfScBoQduo4eJ7AKmuCgmMp6EyOGYzrV2N7lol
         yIQPYBbdvBbtsIteFS3xejmgQi1ivGQHlZet5EhbrX2z74TD9yF5UbZoWiZMHfxAbVPd
         yd49+8Ru0mnHfJ9LS9bsxY0/b82M8UFF4PMXWf3VBO5qpQfRXMYtanayY8lFOQwBPKNp
         6dkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743768; x=1764348568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tA1YZwkpqBYNCNgFaNMq2uv3rKscqjzMZ5GFDmRce68=;
        b=R4F7B/chOwk7imPYozfXyUQ5mboELUW4m7qql1s+suEIR2YG+e864IEomD2yzPkI5f
         m5Lmt0QW7PUbDhC3WnthRhZlbKEOSIWJomu1M9G6FFhh72G+MEmXOw24oAF+FktFVfAu
         oH6qh5LTtFrhYDtBBad/KUkH/ndrzxDt3kscCIW4eEI3m/9s2I0y1C3rN/B8Q12iABFI
         sZdnl7VgmI6tPjNVnJ9DQsPAAsmtZCeS6Jgpow13abOc/7gSUYQndcxtXf75WT1qqZ46
         x7rGacFEwDjPHtYn4cFNR6wUK4ba/Q52eRSLy7/IENZuY15hFonMhXi1YIW53CCRMZog
         TLoA==
X-Forwarded-Encrypted: i=1; AJvYcCWO9f91c4EhPhucAojTr3iweMNjtVneFaJW1DAvRqqDkIshQsfDEOGKiYafFNZGGY6gDFE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkXjwdlcT9b2gzfTkn/fjdY7MttaFhQUUknFQq7/OhP/3UN/3d
	zV0iezayTTyol3jMQuwlfTDoDYkpEkzBrr98isxFLOdul8JjRo19fAdEDsSEUP4Pnt0=
X-Gm-Gg: ASbGnctPI7jkripyasosJ5sjZYdr80mHsHAKAJBiwHEU7bG7x2PZXebTP/IbsGrqdW0
	pcUKCDijH2TOxA38QqzLdZGiezLod98ChsV11JcuPsEX2HgVRX4klxoQgL17O/9JYOWfmhfKGf6
	xNknbi1B6/dsgnkTHrvo55SWrISFK6WE67iP0C7vjJzEr/HLcrsqvSwAZejCYNBoidBz53f8JrY
	fAAtyjjH5hmLKrd4SUEEO14EtGNqPWqkL1LM4TkFIDMIZ8e4tX+Dc8zV19WD2J+fdogMkaraPM5
	KJrdOF1astplCaisTeNvVnCMHfdR3UDPsrNXZs+v7ehTYOsGJ/33jBNum/iLcj4QHF8zIX9cqqG
	WYK5E6WAUAKytsx3Gutyy3lOkMXzJrZG3ZZi6lVGt3j83NL2ZpulQo/YPb/Q+gUzwkf+oZPCe17
	auA0mHsAMpj7bi4xT9KUw=
X-Google-Smtp-Source: AGHT+IECYLnmyytfY8LzC6PdkZB/9Qv9aOOwBQ8USRlzz0beo5YI3DVNF2FJyRPzQ4ThwhycZbswbg==
X-Received: by 2002:a05:600c:4f06:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-477c114ef3dmr30830045e9.26.1763743768105;
        Fri, 21 Nov 2025 08:49:28 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:803a:ae25:6381:a6fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm12938478f8f.29.2025.11.21.08.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:49:26 -0800 (PST)
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
Subject: [PATCH 4/4 v6] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
Date: Fri, 21 Nov 2025 17:49:20 +0100
Message-ID: <20251121164920.2008569-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121164920.2008569-1-vincent.guittot@linaro.org>
References: <20251121164920.2008569-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new entry for S32G PCIe driver.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64b94e6b5a9..bec5d5792a5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3137,6 +3137,15 @@ F:	arch/arm64/boot/dts/freescale/s32g*.dts*
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

