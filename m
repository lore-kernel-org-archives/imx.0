Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9C74457BC
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140060; cv=none; b=H0Y8vHrvxpfAyqC4Qr1htDV5FevUBgHoP/co+brWHs/2N8sdAirnCQ6d+Rf2VGVejozueZ4UtevW9fcZdQh3OITyRSXwU9TijDA5IH04AdrhUGoeRqjwyMfU257hynGnvSXeU+EL0RBGm2Rh1EvjNWxwZFEoXqzRUiLvNTiLOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140060; c=relaxed/simple;
	bh=PjYj5OcW4JfpfG4g+XhgfGTd7DVPkQ8LFPMLoMqOLz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pW73s/qkouQDJiLYRijKaEn0l2YxTX3Y6wcRnRBoyHWua8Zlgb1I7TNRHD/CGErTq2T+STdC1AaXc9GvfdZfVoKHYhf+n0G8pQB0R9EgZDx6bnrlWy9PY084KPyGzfyXtj/37oZWr0bRKRyQPSr7dR3s5yOF2Dv8zh/+5C8/vhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UM2N2yF3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UM2N2yF3"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b0584ad71so3664181f8f.0
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 01:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140057; x=1792744857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m37LH0K2JtdkMATWovRMsFTjhjXw4zu/xnrVqxt3zQA=;
        b=UM2N2yF3zAIb99iGAAkGLmV9cQJRQGajR6p568LQQURhu3YxLW7qDvyb2SDV1RtJuL
         WT1ifJProTSFPNSb1EcAAJ+qZmlQq2TxpzSn94wktMK3XJIv/L8KI9aetmFLxC39HW4/
         609pwbgam10m3tcl8tG4o2z2PPbdkl3gi+6DL+sl8He1GaJWQgDuXJ/fJTUP0fVsOTkW
         CLPHS0EwAkutukrtG0OZN8hghiIHWD99yfMbz+TkYWQ1DQAcFv08NfexGE6q7zOV0WYA
         mvbP1F1fP7TCdNN2yq1kpZhD1FpeG7oHYuuZUhosKoO1qd1fP6hw3NkFu8hrK1CNYNg2
         KbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140057; x=1792744857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m37LH0K2JtdkMATWovRMsFTjhjXw4zu/xnrVqxt3zQA=;
        b=0M4uXC+ojf2cdV4Mstd34AL0CSLc9n3jS4iVj7IjaAOA9oXKGhmVlRNeUowLkJrupV
         A+qvBGpHcGW9UFlttNuyJyMqdltOcu8qQgmOhPdXhHWAAamXE3kmj3TwDBAEnhcsgcft
         9x3bt2Hx+FuXQItyNzvgsUQ0ZDBgpoibjX9aqXIYtwjzYb+qyrexonJBZSzhmfkrUlWd
         BMdhVa4fotQrNMG9UJKiAI1apYs2K4RJr1amv5PAb3LEYm9bdI4cF8NO6DAXZyi+C7vM
         p1LY7Ijqzj815jeWAg7wBl5LZnd47IFtqcy9NILk2WjgEihBG+HULlQ7a2oEGioysB82
         hHnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW5aQwz9Lheofi/UuDktStASJU/NMW6ZwC3ooNLFKk6oE+Yv/+5A8looulWRVvqa88flE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIHNNGS2NeOUC07Vz+Z6tY9t9rEfTovs+ps1gbtbM3Xv1J+b8tH
	lXRey5XDvNFgh+iDCOX+NJL4gtSuDPcuFc88cKWrA/tyr3sYqlYTdcMM
X-Gm-Gg: AYBFou0bX4q0RMj23YuLfWEp/6p+baN1UFIJJPb5r+RjZOA1+ssXX4oWwYHgSbV4V4c
	+IZMVrkuxrSAtqMkSppNAwNydqn+JNUoaajPZuxBoyy1jYV2QwsQxScXXbYEcJJEz8vSL1pJP1l
	JHuQY0ajG9my9zWGI6wAqxlvhKvISeKKKlrrOPS78HTDjoaVRWXbVT4hgWD2wmRCkrfgq1jd+nG
	ISbm84obuT74EB8HFYxqZweRkfF8Os3EVFTkRGEmy3RU+NNgqiHrxQ/Y4lVM1To2SOKXDMCA6Tr
	owRBfZ4cELdjDABwN5uB64tAYCRoquqdCXMISYcP2gE7zvwa+Tvw/fOIchbfCd5kAS7/7yTGQy5
	J2kPB+tnii8YD8a4chnOrkG1EzS0ID+sbuykPQ7696bj33AbxMbjFC2Sl9b50wL5OmwGhbsoyzj
	1bKZ/XE9uK+33U3isbVIUJeA9pwz+RtPRNgqXZXRwFUrx8Lw2ED2XB10GKziDWSjtXhbQoXrwP1
	IQhSXosUIv38VSXiQFe7B8V5HRzfRE/75z916qEnrsApVuuxUPCe9k0AzEkecm/4Y+sDKd+zhZ5
	JCgC0J9wHb69jSC3UbMa3A==
X-Received: by 2002:a05:6000:2912:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48dbace9d5cmr40663215f8f.11.1792140057193;
        Fri, 16 Oct 2026 01:40:57 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:55 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 2/2] arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input
Date: Fri, 16 Oct 2026 10:40:11 +0200
Message-ID: <9c0e289ab226609d99bee1bff4f175ff9796d8c8.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792139809.git.stefano.r@variscite.com>
References: <cover.1792139809.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The digital microphone data line is connected to the WM8904 IN1L pin,
but this connection is not described in the device tree.

Configure IN1L as DMICDAT1 to enable the digital microphone capture
path.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index d05b1ab17fed..514cc568fb71 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -348,6 +348,8 @@ wm8904: codec@1a {
 				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
 		/* GPIO1 = DMIC_CLK, don't touch others */
 		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3

