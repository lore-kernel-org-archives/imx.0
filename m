Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1C5190472
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204069; cv=none; b=o4CQPYMWzkA2lTvjRIZNM0sj3gLr5jRDgMKw9FFSZoNTLqGNNMbqUfcwn/ipsRY23dfppEB1qicXXj6CQHdUOJsI7A8ooLAkUAY0dH/uh5L50DwhEvFF1yFggBhmptNa/DpGWtziu15qjAst1/84z2esaIFx4sel3IiZHAxWW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204069; c=relaxed/simple;
	bh=MWwhsP/1Gq2jtC+XMH/+PSmlpfJmY2R2gm9uwDR4fZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ls0TQdvuSQpd833ue5sdxuj8zAIiIyqF1pcnVW3bGUsHQ26D/PYSlucNVPrQ+SRw+gssN8nmuUf8aibsgcGGlMhyfeDp/Gx0EiMl4Fhd1V+Qlxkf5La+B7zKzZHm3hKHRGnTd+yZYe4pab+amHYGDMu7S3AjUtnf1OdV6jtOTC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Ewj/brP3; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Ewj/brP3"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so4246857a12.1
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204066; x=1737808866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=Ewj/brP3MO3WWRbrNG7X0+QAS/PRBuR5qJB4cbOeCca/rFsQreweVVqWSl1+T8By2d
         cVeYy/ptXvDSBZs7vUG5snyaPHzxAobiikB5A5oTiHM+XVEmhPgdG9n06Z7rYULf6viz
         sxeUXXcfU+hbUxC6jXXHwiABWV3bLTD7rtlcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204066; x=1737808866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=i8mcRH3M92BVoeIA3CypiLTVnBDnttUo9n39dYflcVbwfrdFRPBMx98sU4FAIEymLl
         VXQVfq7p4Pur1hHK3jZpzdbjWlUE1ro0X2gAvp2e6R23ImONxxNsHJEhMa5BMnkw0gEE
         NLu+ithgaq/2ZPax6s8cRdi2bJAfDjm8F3LXXcFPBMFsRZa+FG//GIXyf5QRaW/Vk5Fn
         6ECMT3xQRiAAJAUksh74ktedq89fOmBo6Abk5Bk0LGRj7L1zLKRP88IVS+1in9EatCXZ
         zrApyR5v9ufPBw1OBKEYUSVeQ0zlX/WAU1Z60BiAjM7QqR6KjKvRVIYGMJEtyYldoDwT
         78Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXPjeAen1kI1LDw8SyTasAjpYhh5c+5KbseoUwe1XoFzmRhJTRlRHhpRExunKAzv3246vA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzA2Iq4tswK3nfjays24bluhwbZd3tprCu35tRTGCzbtK5lfbbT
	tB/Bd18cEf65o6Ph36/1yNa/bpjVMlHaS5Z3xxZbyGCWFTeVtJh6QNzvs4c/LPo=
X-Gm-Gg: ASbGncus9cFzwgPKVCfbwvtrS3CVfnl8z81E2yx5rLRibRSIitOB3tk7EJSExRkE29c
	/aQBEULK7c5lc4PBNELfPug/azayKIbOY51EdkK7EvRlmGI65Suw9dwRumi6idRANJE3YvIFlar
	WBIoMvZUUucMpSLeoF8nGXW1N67dTbR5GU2ysni+kEKDQzxh6zxF2NYHapXOkBev1sAPJiz51eX
	D39SkH2vwRIYjkp+48zvd1vwAzab2FE2ws2dQc/BfWneoOCcHxvlD1OvnfAQz0luKvwFQhmHsWH
	M5QCqVMkBR0LNDYJXJkwsqvW2F+wgJ2WiorABVX+uSprF61ys9FISMOM2bp/Yx9Yfpg+73yNjIE
	ov+lGrgBNiArYoaEgxs85TxV3RN4F41FCA5q3
X-Google-Smtp-Source: AGHT+IFd8SJOuPnbNHYayMQ2pJl2dtTRvVnOeDARGIr6v9/DddrHyT5J/QNi2xGLWBTU+gDaqVLJPQ==
X-Received: by 2002:a05:6402:849:b0:5d9:857e:b259 with SMTP id 4fb4d7f45d1cf-5db7db2becemr12516818a12.31.1737204065870;
        Sat, 18 Jan 2025 04:41:05 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 07/23] arm64: dts: imx8mn: add anatop clocks
Date: Sat, 18 Jan 2025 13:39:50 +0100
Message-ID: <20250118124044.157308-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

