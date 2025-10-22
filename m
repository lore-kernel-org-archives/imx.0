Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5532E2D878D
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154998; cv=none; b=he/JZW75CKnp9IIJ8p2SxjYX05UpmOWK6JAFgqom6viC8l22Jb94ZrKNTj17BLNQfW15bITx170cT+/QSkrBRvNaWJ+5dyv/5lKQEY/BchY1jwWBkkQvEh+XSMZnrj4eMBkoLKHfQGwwIjg5EPTiRahp+lf/sX84mbSIHLZoc3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154998; c=relaxed/simple;
	bh=YDmC2z63xnyncBVrO7Ltif8kw4rumvv6Ka6aN/+Z8sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWkzE4fLaBfqwWr61/DNUUT5Nw25La95fCHST9dTakV1GTGgy7TqmgMK0AoulQoBFEHox0SagTz5nCgx1g37PYtb9Rru2s1PiLGVEjNiLuFlAM4RVjaTYFOrc7OvUDz26uUeL8augnZ1QWcKw5aktrURtljDGKyL/BFLVDJwVkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vONtRJz9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vONtRJz9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-471131d6121so54624635e9.1
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 10:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761154995; x=1761759795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=vONtRJz9W6+Jf3RavV/3jFWudOs5gT1qhPngrvB7wxa/HMrgcLrpo3giBa6P0N9MU9
         zuk3GPi32WYSMje0TQJ7B35wYEc/bfWwJutQPWuUPx3dw6QnR4DPUIqFrEFfqT5LTSb2
         vEhnaCaSzDthKAGq3X0EYsiSY7jrahQ8kn6mioaB9caCOVX6HLSaR1ragL3rlP/sQLMA
         6fYQqdvKnvrjng2dWf8V/q79dp3sKDKpW3CBVgC0jqW2ClB2+u0uu6xWZzPdBiW9gIrB
         +VcAUmV/hwMDhCazghfcq+u85p+XozACalDVPdv2/4SRCDD4jvsACzlZpH73rYwH+Fzd
         ij+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154995; x=1761759795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=oDRNtthcUrRmk1Y/JlGYIGKdkQNnU5PJBIoFvy4M6NQL2ruEDmDHzzdhEf7o/3/KPv
         9wSJ1U/duY68RnzmChD47s5k91tN2vSaqg7PAka0pZDSXO7qH6HIzC1iu5CoFFVtKJGu
         eLb1PfSYgXAi+3ETEN92mrROLEam7sqYfPtfo59ej7F4Gx9oyZVHiC4Zy1GK8pBrXs2S
         H60Lp70p1sknbIICUtrq+IIPi//6wm51gtrmbN5aHZvmU12Motrnvkad7oUITJp1pUVJ
         ADuQJ5SXbjDdYbuVieFqGsyup4h4Hw4UOqIVm8jUuhs7ZIKffM/gam8AdpeprcZhdt9n
         GulQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeYlBKp0C9IXQnjAs6r8EFzt5cC17BrEaZhz3UxzJaCVSV6da0LELKg5DDY3ru5yKbfbA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcE/p8dWTQCQISQlAbfnaEBK3GsXPZL597XSxq9TJR7F63l5XG
	iiUVTgMQGxRzsQjCLx4WMGSigeU3TiXgSfSuTvTYPUhB/RPOzmj5TDT4WTMpwRw3Zw0=
X-Gm-Gg: ASbGncsJEIdzKCdI0fiw0tYpg2zayCrlD4AN/0nF4nfM8PGkX+HNJFN4S9qSIsQVxLu
	HSJ5GTQoNXI+XvKQbqINi5HZLtB/kdGlotRy9mFaCsouiabH/5nFUzPHzL5G0yHRydy2aPrCtmK
	TyZPuHkW9i8pWFE0pEdMKJl1AAhe7Amt7kZLmqy7fzveVVs/xl7MoC7spD6mrkmuQmh7K60UyXF
	oLocNqxK8F1vYLQW3w3GYWYgBN2XiwCW9uSUzp5epDDYhxwyPCI5Okm4cWbFM79BO5Rk0W6C9dS
	PjIeonCvx8TWgwctL1V0lojbKW0cp1kFC+KtOJttbx7I3s3oPdHjarfEya3btSGiwtcAFsCN5LS
	1YAB7MoK3cLFBmamWEP4PC5SAHfYr0oN3a97mGMUeuPfbz3cCoOOs2tNAjs+Wutccs0vlZLp4Zn
	Ev612tmJr5
X-Google-Smtp-Source: AGHT+IFA9ek93FErYNmJh5LdN2QDJprClDXAFVaAVFgE+OTKe5HXqKKsARiJ6YdVC5ACPC1UbPa9Gg==
X-Received: by 2002:a05:600c:6095:b0:471:95a:60c9 with SMTP id 5b1f17b1804b1-4711786d054mr173817175e9.8.1761154994747;
        Wed, 22 Oct 2025 10:43:14 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:edfc:89e3:4805:d8de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494aad668sm43434755e9.2.2025.10.22.10.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:43:13 -0700 (PDT)
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
Subject: [PATCH 2/4 v3] PCI: dw: Add more registers and bitfield definition
Date: Wed, 22 Oct 2025 19:43:07 +0200
Message-ID: <20251022174309.1180931-3-vincent.guittot@linaro.org>
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

Add new registers and bitfield definition:
- GEN3_RELATED_OFF_EQ_PHASE_2_3 field of GEN3_RELATED_OFF
- 3 Coherency control registers

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index e995f692a1ec..e60b77f1b5e6 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -121,6 +121,7 @@
 
 #define GEN3_RELATED_OFF			0x890
 #define GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL	BIT(0)
+#define GEN3_RELATED_OFF_EQ_PHASE_2_3		BIT(9)
 #define GEN3_RELATED_OFF_RXEQ_RGRDLESS_RXTS	BIT(13)
 #define GEN3_RELATED_OFF_GEN3_EQ_DISABLE	BIT(16)
 #define GEN3_RELATED_OFF_RATE_SHADOW_SEL_SHIFT	24
@@ -138,6 +139,13 @@
 #define GEN3_EQ_FMDC_MAX_PRE_CURSOR_DELTA	GENMASK(13, 10)
 #define GEN3_EQ_FMDC_MAX_POST_CURSOR_DELTA	GENMASK(17, 14)
 
+#define COHERENCY_CONTROL_1_OFF			0x8E0
+#define CFG_MEMTYPE_BOUNDARY_LOW_ADDR_MASK	GENMASK(31, 2)
+#define CFG_MEMTYPE_VALUE			BIT(0)
+
+#define COHERENCY_CONTROL_2_OFF			0x8E4
+#define COHERENCY_CONTROL_3_OFF			0x8E8
+
 #define PCIE_PORT_MULTI_LANE_CTRL	0x8C0
 #define PORT_MLTI_UPCFG_SUPPORT		BIT(7)
 
-- 
2.43.0

