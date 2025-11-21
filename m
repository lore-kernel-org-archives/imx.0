Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DAE3321A0
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763743768; cv=none; b=C8o5OmHKjmugVXQYewePgHX/VpyX613rcXWIPQutUwKJ7TTunA5r/s5I9N3erVV8Yei+UDkpuPb4verBtRxtLmAE2HaFBPRiBFKLhHr4nJNT3fPtDtjsKgbmVu+a+oIsI6OX+1nmuFas8NLmwEkw1bKbU1p41Bc9ujWSpMyXhfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763743768; c=relaxed/simple;
	bh=VCW8CcHFML0MXmdga8MAbRkdEeTTdT135VPBj1W+VvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ad7rAHEocB9OtuwbrQN4NOE8rDTuv1+1aJCBA7CiHJKF1q2OUSR1iuncesxYg3pCL/ZWhRW6gtl6fyW4/inJtwV2tjGYVgPWVVwsTLyYp86C5lqe4wWsewBO9ZpLzvwdgVt+78SVko1eN3uccdNz2FuWLrstu3L01Hq+tJ0hJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxALL+F8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxALL+F8"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b38de7940so1145081f8f.3
        for <imx@lists.linux.dev>; Fri, 21 Nov 2025 08:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763743765; x=1764348565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97IM0y9keENG43ISIlS/0C0BXR0E7thIuAT6dZAC+oc=;
        b=vxALL+F85cPA/IFNvRZOoGRSgPbYPR3YDsFXRXOz3UU8CdzB59JILK9n3XORQ+4TzR
         HZ/LEwnJyBbLvg8WzRtPBOlC6FNysfxwL51IA7qRKM0eaV7wG8kE8ckiqCU4PML+Z7m1
         uPYpfamR9Upu/OTd9hFf/gOrPWTOibtMifssAutZGmwWra4s2Tj9tK+8y8WKSBGyfkWQ
         DWs+Y8LFTgtBYQfF++8dS1xpBjcMHbnWhdpPrC0MPCHLNZMrADZLHyo1LWVtXfCQipHE
         WCAVX0PxlGnQWSRmiWkjmUjoZT0OYJZ77nQoA1mMaqWWFUBnoZA44bIu7lNZX8eRTRbI
         8zlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743765; x=1764348565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97IM0y9keENG43ISIlS/0C0BXR0E7thIuAT6dZAC+oc=;
        b=nrOehQ0xSQs3bQsSA9oB5Kf04XBeQxepImIsVYcuw5T4XTKHRGnConzrfW1b/9MYuV
         QH9iJgGOGktsFWhFG95NBZpoJl9sNzbOSbLCk93AJjlhxiI8cLFfxUtimncYn7BIGBM2
         p8qKz/mFSPPgGviPrYmv2yoLOncCjA22UAPjMTmvfqMLR0yDMSZ6FtCzOgilIgQUjDYi
         AKkpZAyn0CBcwqMxsCnERIGq6SM+6Pm64EjtydQhH8teJb+p+uX+bavD27K73EriLCBl
         0taae7TFmPju1KN5Q7zJecqi417j2LZ5FnTGBXzLzZNIEaS6pY1JdjuKT1JAyoI2z2UK
         AOvg==
X-Forwarded-Encrypted: i=1; AJvYcCX6dMTMCK1INi5YKMLXtLIFaBSz6mmQN4M+wJpLem+v3YKJ1sgPz+TzqyTHDJPL+739lsc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDsmdIX8+X4IPcZ2Ux2M25kByri2ri2uzbittUmVsp8A7pXJbn
	YJOSqTXIeTLQgnxIUstyK1G3kQ4xpEXmQMHj0ycnIj6ahpshVT/j2l5W4ZuusUJWPi4=
X-Gm-Gg: ASbGncvpK02cZTiFipccs6dEYU4LWeyZ+9wq/vnua1NokrHoJd3VTI9yyuNe1HhhDFK
	8EMz6Tw+OhSL0ajqDshygsegETM3ppna8Vn8HcIQ4zVkEZNYX5KfaACWq45Zj3o0aKYKYjjc4KQ
	W/kYVlBDzFOvo8VssQ8vvjrXV0nRl8VuzsnKL7+1bSC6MAECI9YNoUg2gsKClrns3EOwTBsEzYb
	TkKFJCirl6Jbmvo80fcQYYbuPXIsyVYQRjIsEAEShFcEgKhKYokF70xQ+4bmSufmEpxs6aC7OxS
	Ku/0an62hIrbz3OnqxA5aF36sqBW1OXkCDc1eYHWmGw+mQtFtyKWoCQxMIgqh+jwTA5p0vCyxCk
	gEY/8Gygj41kQKSKOGzOfTIeNTCrm4isLLs/tg+k29tJ8s5P5XFYT+O3dQaMh9iAm/HW4x6JBmC
	epv3UobOJhca8CoGZGioE=
X-Google-Smtp-Source: AGHT+IGP1z5eL7MkRZMuT+/A4f802SQOHcacTCZ+7w4s9B7xrEEQz3dSr55JMvgGIquLZen+ZtXkxg==
X-Received: by 2002:a05:6000:2909:b0:42b:40df:2337 with SMTP id ffacd0b85a97d-42cc1d0ce73mr3080145f8f.50.1763743764670;
        Fri, 21 Nov 2025 08:49:24 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:803a:ae25:6381:a6fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm12938478f8f.29.2025.11.21.08.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:49:23 -0800 (PST)
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
Subject: [PATCH 2/4 v6] PCI: dw: Add more registers and bitfield definition
Date: Fri, 21 Nov 2025 17:49:18 +0100
Message-ID: <20251121164920.2008569-3-vincent.guittot@linaro.org>
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

Add new registers and bitfield definition:
- GEN3_RELATED_OFF_EQ_PHASE_2_3 field of GEN3_RELATED_OFF
- 3 Coherency control registers

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

