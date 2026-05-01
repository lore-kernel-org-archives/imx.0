Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A6347514
	for <imx@lists.linux.dev>; Fri,  1 May 2026 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629473; cv=none; b=Xuk9v6r7RBUutTQWRssElXVQdp7g/baubLK1UNvLvttW6FMXdyAVYtPKPVDS2qp0l7yovFCMp4VkcKX0gMuJrf08uZrtrdIm/VpzJ6HUt4GpNomGVlVOb+SVr/EVizehIE6Kc1JGRdtexRaBfX3hAUR1Ii6O5Fp+QJ4M9sHzpno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629473; c=relaxed/simple;
	bh=u0+cl5+Er6WaymYzamEFJC39ZKeWrnJt8oCo63e9YIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bu0hk78jhTVtb1S5io/pA8utwAhWvx4gHyQcFxjH1ZLnxOf2GKqJbu4oF7gnttLH4yqZr546Mn91Awu92WvJvG3Gso6IugfUryA3tmM61qctaseumI5P00bJaKJ96s5t5IpgTqZiHl8nCuiQpEjO6hZW5st47RCP6nwFYryZnPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDIxPN2U; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDIxPN2U"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-827270d50d4so1732481b3a.3
        for <imx@lists.linux.dev>; Fri, 01 May 2026 02:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629469; x=1778234269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8cBbebvkgmNYiigpFW0uBFgVevOeLSPr7Jmw5f7oUM=;
        b=ZDIxPN2UtVoLW0TzxBovM9NhGUrrR+ivqvvDmrjxGATNfqfChpQdx8IQAjZCGt7H/F
         3TjMI0qA9CPxGBsMpBGaPzNpqW2up1bRYBjp8QZ6a/aociL8Jh6AM39vn/eaV3XFOb9v
         nOm7v1VuCxlLYCFxLqLNIQvu1lHTZJidZ6EXdYQY6puA4slCcRt7N0QT3715xHmbnn2z
         APnoWRAo+mVFF6zEM+zlPkK2bL83LTJpw+NiY4bczPAAkGdW5HwqlKWMX+tLofDxHTwQ
         uelCp7sf6XJ/b5rowwHsS1j5MiCO87jD1NkRSIPg0DtjwZaEFNqWlmlXfO7ZhVY98Odf
         u5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629469; x=1778234269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8cBbebvkgmNYiigpFW0uBFgVevOeLSPr7Jmw5f7oUM=;
        b=Z3euH3dQQhwnkNbwiS8p/d9SYdGN5tSZOCS8DaX+Q9dgot1olO03VpsXDh+JhRE0wf
         tSE3q08+BBOYZiH6mQTjpbPbz7c6ZjuCaqDUP2MS57IspfB4LT6yOuFnjbjDXBiDHmIu
         PBkKeRRbNTRrCs//8CrS0V4t7JYprjjs9ZT6xsCAXh/prlFj2aJ5xcm/5D2YTQF1XfdJ
         CscQS/ZYlJMCd2HVus9nPlMxO+z0QKshOVEasF2Kc5EK1/kni70pcfZ3RguL6L2vPkSA
         jBA2PpxcMKKPXHXAhFqTWEMj5iVSGzpFHoqzYFpgM5x2yhoFEKDNKdV5V6w63HmZxHuk
         IHwg==
X-Forwarded-Encrypted: i=1; AFNElJ8xoaaP9D6VYVPR90NuQLCH2msKlP9cClasNtcoW8vzC6/6xj2Sgm/0gkVI6fXRLnENB98=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgdc5bOMWEpsla/zu5AxMTvgXYxxLOH+ra/mUYQkgIiGNquHT5
	Mw8IINddKfVQrey5h+XwajHh5CTCCQexmAM3M3Ek/ngHg3tEnw0LI5p8
X-Gm-Gg: AeBDiesZv0KK+D2fiWZ0LTNP8pfF3fH81Edpoyows1o0yIk0AjXhsvx7DTMgpbwDw4H
	KaFWdsDtmBNlUEDYjtBC2HlsIP9AZz+Qnj5exH0BehDYXTf/KLhAgmgXFAObmSZbP+LhNSaiYGE
	vO0Xe+FxSPz6480632IrMc/ZpOd12YgsKTU79wk1eBafmt5E/FNjMb0vK0fmIY7B09H1rxHKaYZ
	3DOhA70skZeDbTtV6+jLEBnGLfF1uVjXKXS/7l7J0orm5ps510hmDD3FLSKNQUgpP1jdaN8krKL
	Fq2pnV17OcsLwgdVva6XbQ8NqPSeYDPxo+ki3fK4i0449Wv8EQjGS8AEOa9cuMk09291oWGedoB
	2eXqrxcI82FPowFvnqvGuEkHc74Qk1su3NkjWVYYN8L4gSbfa3JfTUddYTYxhBt77KJegdQRHkX
	T/hGV+zGw8ikg7hg==
X-Received: by 2002:a05:6a20:258e:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3a3cf8d8f18mr8009215637.48.1777629469654;
        Fri, 01 May 2026 02:57:49 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:49 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Fri,  1 May 2026 17:54:33 +0800
Message-ID: <20260501095433.1609309-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501095433.1609309-1-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / post_div1 / post_div2 =
25Mhz / 3 * 90 / 1 / {1,2} = 187.5Mhz, 375Mhz

for the detail, please check PATCH 2/4.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.54.0

