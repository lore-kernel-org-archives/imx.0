Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C151436C59F
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481779; cv=none; b=H27vxjz4R+AHbftyG6XX09igOisVFg4fy4Mbect+C2D8zP8Gj95Goe3XvxTHpGd7H3DnuuRe+hIGAe8X5K9MTXq4dN6J8KHpM5BYVGIRo2aEHVbTSLlzVXliI+Qjc0gjPXkV0ZjBI0tTXCGmTfVG7OnxP4C4XapaRrDNjSqxxn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481779; c=relaxed/simple;
	bh=YDmC2z63xnyncBVrO7Ltif8kw4rumvv6Ka6aN/+Z8sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEbliGnZQUFaOfpp95eEjGkHzb5n+Qp0yINMXoVOniKDk5N6SC0khPjVzqKCwNbDnipYYm4J087lffjaJie1dgOZx1g2P1heJCa+vcZHmy7xD0/d37zQu/xvNJLgukXOM+iSOkLsNODf6rBOpFndwo3PF4V/DzWz4ktf/Z6TDgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OcmjegsE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcmjegsE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779d47be12so24797605e9.2
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 08:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763481776; x=1764086576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=OcmjegsEiB8S9UFH1l6cwx8S4yKitSSo/EEFHFwqhiSOeFGiCWM8S4IavMSirJZnYr
         gtr9W7A3AMtGsl1jOtkvGEf5hV8yhjwO9zXHFv7VRi+bYXWY4f8lsMJ8PJsspTEHTkvV
         dDNqX+MfKiSqkKsAz54fJkbDfGgStj5J7oF9SotI7eTlcc1OvYdCFcV0Rc365Q/vDFfl
         CJTee/RWWo3lLiOfjlGdKl9qVwvFPWCfk7EysNLwPqBADuXDNhJUzpXL33eS/pjnE1Yr
         1ef3f+iYVbGrpsCf0LgNnYTd+9rQjrP0NMbhpxquVh0dp3f9XdWiC0m3hRZNr7zNj4DP
         pCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481776; x=1764086576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WSJqWy4wfSXZhaQaKW322RhPmT1j8xGKth4T2OfqmIA=;
        b=v8AgBYYDYxz3hTgE9NYK16ImlS8PYiAxDbBlE+OKcd2zhdwvnvJwkBN4RXNuWGO6/G
         3qECKiBiJ85scXMNvrJZVVOTuWuhylwQKGwd4OuH/U7mYvEAs59bD85HFQNIsL1/Ib9u
         yUjZEyL3wXqbiZXbTak6NDPJxxW0uKNCcshYFT9xKtcdOI6E1hxR6w6/HErDeGQuR1CP
         9H7xMgM5MyqgZKjDX+djV8qxhgxWeMjO+3TJL92IhVfKrgJ1T9UgbAiYRd3i6nI0bSbf
         ZvsLQsJxdx9QbXZ2uN/gXGpw4uNKD9snhpc3vEzWLb0NjHahBEFi4/XUiXYGf6d6EmrI
         wyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKDsfZekOSS1N8S99nlhCN2foko3D7WGYuR1U4S6fQd5OlVNZaUuM4UME3z6pDcHzqBeM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwN7LDOwO5M+reLXnnuSzyLij+/ksm/O9CX+c/OvbMnV5iIUik+
	6d5QnCNXIrTh+WcKaQBtGGmvXzpw74KnlnkS43tJGsBFsOl0NTHj++NmRtPw1oBjltc=
X-Gm-Gg: ASbGncu0m+zHzUNmxsQZJNH+M3ffKeyI2yjQkeWDz3zXFWUwInvWT5V4eL7z9G2VOWF
	tJZQmnf9eH4QSl1MzPrShEK6ibXT6B2hddL4w8uW5D0CehoF+Y62xNlr/OOgaRpViNqAwRzVYSY
	qjPcmKY2xFVKyClqpnGIHgI6s8yB6gGLKMWZjRNILWZJz4GURBT2LSrk8sawu4W3XwyGvelIiIY
	avuoItQyo9qTX18ZANH28Njvhfz3Ip3HjI1M342vMuwcAKOvt27Mq+fX4x5oJgFstW+RT4EdpO0
	8ypgIfBqcOueCJnqjSg/8JuXsp7+L0X/Cj+Jr8uzos/QsQqgE1LdtwJDnzRStUCdroKnzqzLCwi
	886SfKdM7A4K6xZBwt/sOWKWFCD60aKLP0Kr4l3oLD7l9vMntvww75cYWYX3usYUsYf4ToqKllj
	txC4f8u1AJrxphpZugQI0=
X-Google-Smtp-Source: AGHT+IG+BDNHdoKr+nmoBcJhjAG/ZnTb/B28SkxQADb4sfx6Pq139Gu1ATJ4y3Mlt9Ib3CscQR65Pg==
X-Received: by 2002:a05:600c:1f12:b0:471:c72:c7f8 with SMTP id 5b1f17b1804b1-4778fe9b44dmr169442525e9.21.1763481776169;
        Tue, 18 Nov 2025 08:02:56 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:76db:cf5c:2806:ec0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm171954575e9.6.2025.11.18.08.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:02:52 -0800 (PST)
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
Subject: [PATCH 2/4 v5] PCI: dw: Add more registers and bitfield definition
Date: Tue, 18 Nov 2025 17:02:36 +0100
Message-ID: <20251118160238.26265-3-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118160238.26265-1-vincent.guittot@linaro.org>
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
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

