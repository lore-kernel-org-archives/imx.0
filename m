Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4BB2D978B
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 17:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796022; cv=none; b=oisgvLZj6Rwccg2YTnYhH38ib4Vperd+ao3KU94pYKf30v9JUNxwELKoy0HC2y55me6l42Vy97M/ggTjD6lhhF8kNcSF0wD3DgSD3AHWZPGKuzqBKg//s6KB+icIOAE0ZXQetvmLovXUfz5dquREhbXIR7r1VYC761yV2eUIECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796022; c=relaxed/simple;
	bh=YDmC2z63xnyncBVrO7Ltif8kw4rumvv6Ka6aN/+Z8sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vj0gVnXsDWaCRR6v5a2Vfe39E7y1sjTY8kFkvmeF9atKI3gQq879sNeZrGjsrrBq65jhJw7p5PSCWgSmmi8lImYI3VXHxuPdZCLUtgkiYgihov5zfTCGz1BYiBKgj37E0d+f9kxUANp97aJLLic4Nj/XuDpPm1kz/gN87qXvmew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2r3O0FX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2r3O0FX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso25514135e9.0
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 09:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762796019; x=1763400819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=K2r3O0FXtySUxOrjB6iuarT4yjiMlG2akkFp2XFYlkb3rfLvrzZZbhGN/E8axltfr/
         ay7Kwb4U07h8u0HO0K2EVR9Kbz3BO4/oI553Fss6Rb6WmaSda6XNfgiwjYyFAuZjZw90
         DgR+E4nrZ6jUAG9Y6UcghXBdgR6ooyQqkaWj6ZrQCFM/byT0uyNm9bhcNBn+QYh/AejZ
         RGDT6YSMp8oqDS144WdiW18IW130zX4xDuHaX/uREdV7Bl6SiBuFbMcvRchXUBCweDLU
         RMAe2LYGQ6AkxevXO3jsL0NU2O8R1sJfUTjJUkHmynlE68xnIwghSChtpAgGGaHSAPHc
         dMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796019; x=1763400819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=HlzaXHnPnVMKloI0uGyvAI1Wu66j3IJ7ORxoNWb9ilrT4NyZbgyZeLpYqZ5lKH9hcT
         7ZXM8SVzm/x1JgXOepW9utn3007o/AWPJjeJoA8cyTbJcdm9QXdgHs6jKPY+WQcuIBDW
         vN0YiOWtgpf7d54l0ScYnjBP2VHViOMJdY2As0M8JZgmdGDlzs9dQ9XFiTd/cy/JReeO
         pm6UCC3aamLvkQstGS7lPAwrMf85kxqyfMyFV1yC10s18ux3qNpW4wTNd5BU+SsASWs7
         9T+IwkSSwDXHFz1pDdlY/JqxjSP1VOkIhvMTcdGeyzO3ZYyIyjEm93vuJCMdYeUxaMD5
         8f/w==
X-Forwarded-Encrypted: i=1; AJvYcCUQx2f2IKJ7bCp4Dfp9DtpzsSprpjK/adUGd5JwseJY7oTKwYeURLehUKa3KYyjEH2T2PQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhWDzPZ5VHkt0pQJf/ZgY4byGTU8ZRjGxzz6teWbOmoeJK8Jvx
	yFls4yALkH7agQUYL9Kj3wltPdHiz3NnuV7g/1uSNHCM7fkHMKG744gcSA3KOIQxI90=
X-Gm-Gg: ASbGncsxdScUNpc2nYRUKBHCgVfZdbDec92/6pCWX9+bdDblz/TvCApqsk97hrNvxfs
	2MywVcpGQZ3whd06eOzYXq1t0uqEeCNK2Hb5uqU3gzsYONDR1tDpXbkovDdEGY+QZ2Wrs2CqW3Y
	1c3vIXi6+ihMCs5Jj9h1X3Lk3FRa7dPrA+L+vqAvKkVrBYaUZkKoTy9Fc1GuV4hWdTzl4ZAxafF
	VxP2phdhodV8Re10UEwBNjrgcLr8WyiY8xLVK3hc+JSZBeszFEXYzjyR0zpJGfulvhdVpc9vLhU
	KS6+sNTIuqg1y1Lh0FRga7MF8uaDpitajCcTYMXayzIvHM9KLngUf0fQcZfe9phgUhFur5nJ/DD
	w5m+E2FaywUxFsT9MZ+zXYESv4WOmhoIGIbcOwy/OjpywdD64JT79rPjQDmWd7eH7yEwbbvYbJO
	A3SUOpcFJozL5pnHZu2js=
X-Google-Smtp-Source: AGHT+IF4B3dSxsq/6aCmBGqen4lFZOQM6R9kmpQqCIpNgVB5XME58ogi9bfcWf65NAevay4coklcXg==
X-Received: by 2002:a05:600c:840f:b0:471:c72:c7f8 with SMTP id 5b1f17b1804b1-47773271943mr83366585e9.21.1762796018775;
        Mon, 10 Nov 2025 09:33:38 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:d5ec:666a:8d59:87fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47774df2d80sm140111375e9.14.2025.11.10.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:33:37 -0800 (PST)
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
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 2/4 v4] PCI: dw: Add more registers and bitfield definition
Date: Mon, 10 Nov 2025 18:33:32 +0100
Message-ID: <20251110173334.234303-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110173334.234303-1-vincent.guittot@linaro.org>
References: <20251110173334.234303-1-vincent.guittot@linaro.org>
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

