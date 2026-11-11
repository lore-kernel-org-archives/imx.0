Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403902;
	b=5McU9eknA02R2n4QCrqKeetrxRYO/Pv3qEmT4GHnFPetdswdgIZvQqgB9mlzJHOz0jjk
	 AUTNA7hnP3ljmUPyhlHONzqjLTKZwE3BtC87gxrtERFFS2i7FtfCtzqHvfAnAzswZ2SQ/
	 eaC7w1EcWG1m7UYcLagLYA9F6sLjA/fYlbhGXhJPkkY0RDYBBxO2aUAaG+jsfzySmOBez
	 a2yeuYF18dgX7l5qE/5yc/x1uRdcFUOoGS7ZerpN2JQgKuKZACzLaT0J+DSfgIUXQpsQ/
	 l3paWc1U7FjWZIlc9aM8Is4RL9c/iqx4nSJnIjvDljuuI7Sxye3vm7H7XFqVvVCd5Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
	b=eaUNadl1gSAMNNZNplKKGC4eQnJ9oOJbpGeEdrm7QgqvVabluXK3ZnHXjOBiC36HHtfo
	 XVj/RA/RBGr7QWKzCHdtx+s8+aMmhOj+zx11BC+KjRiAwoATkZukdANQx0u0sK2qF3AbD
	 4GDU4P3XsjNJVCFmyyVOOi7YgCrXQ6MUknTuCdUz5npVRHqwqFpfu59Ot24MoxtZP9DeF
	 xM57REPMLXMQ70cwTg/13EIrmPmVRDn8f/eAjVwol4HqbJddRfSXEkYaEbGdXwKzf7OPk
	 Al182cL3C9z4qTo7Fz2G0KXNmKWmQjFsj5PVhlpaWAFV8IhNTaeHfeEnyaMORXvX9uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="l/V3uwkk";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B88606A338
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 13:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B88606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l/V3uwkk
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so2088038f8f.3
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403900; x=1795008700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
        b=l/V3uwkkRSjEDOGxPbAnI4l7VsbXAyk/3ntAi4Ji/9CfDPFaNe7S7PwBOViXaRZgP3
         9B3PcnOeLjCXid45oEOILAMN7z/uV+fU7Yqfyh0e88pKVmQju/mnunOQscZMjYCxk+xk
         aA+WUfPtdCdy933RlsVyJ/8AXy5uVVg37b48F6Nfkwk3OHld/8LwrAR8dtNwVpd4/0XI
         FmF66Hq6O3V2doNAjsGDASzU0r1kk9pXPYSiT39u2w7Fqh7pbbNdlq293qcarm8Mlb48
         JUSlWB7K68jDu/ewKPw3M6/wNxEKknyj6Oaj2XYC5fQ4JAvXj+MUhNPSpyDLfZ356skS
         Nsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403900; x=1795008700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
        b=Pyv/5rS6t52zq5qpActgZHKvmNphnSMg5WquEtZcy/q1IapKncQob0ipWkn/sOQU/K
         MWxDx8zjtEX1G3bk1PqVznvvtL9YkYrczJ1Azrk1RkEAItXw+b1RzHUoEoF+QJpWpkwL
         K3RRyLODkXmUpTpOguydu9dyopTAwrq1Yo9SddE6MT2vySNKNS18aBRVnleLCfRKobbe
         QmepxuMIFbPBwjJtnwQg37qOgLuxhkuyC18828R77jnz0f80rTwM30Oi7hRo9+BxxAW/
         uj8ItIPQBfuLnWWJ3u8R4FPGhe7yJYxFC69jCVxLW/gQNInp898XZUA+1wAeB7AwZZOQ
         GFMA==
X-Forwarded-Encrypted: i=1; AL+hErHrKBajRMCftPxl81VBs44fXvBgK2YRMylYukXGqB906klrw+K6UBNn4fxwsn4NsrkWxn4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/cvJsoGzLnR9Y/AIX/psXJGx9kKKxo7vVyVQq5FpkK/Le4svk3
	/nNkNwsucOlLYVasxjR4OfjygEUH6rpnIl4Yvvq+py5UT5vkCqiXyHhLnmTSqZAyrsg=
X-Gm-Gg: AYBFou2UP33mAwBxdVQLJxblDqHV7nwO4GV7myW3u47/z6hfbMmAHI5CTgMdWigwzxl
	zqZjRfgti2eqr0vRPZdXM6J2cxfSCPsBLGczhWuw0mklJwpkB1iuHUx3lpydtYczkvrJsgh2Z/y
	XYiJXxrFvG5ZDRd3hL2q5T4tBZJzkdzGi0iMGf6i41Q+6WVHUlZLyiTzoqRFoJZjOf+qN7dQO97
	zV04RUvJH48qxqGuNAe0rtDdZ9nPDr+2Bgy4uTUvUovFJiNW6ZF6N9ftQHwA1WT+W6ia2HgKfzc
	fJDH8DdUxJc+UkvUDsoTl4t48+QvAgjBkuWhRsitULw539OKTM+q9B6Vm+nCdyxtH5E/+6HgHWK
	Nu+WHy+O9XWERbCgzUZASVvDD9n2h4dghmVwSebUinTSpltRFG9p+UOmDdn4FGia1LHq5Piczpm
	f57myGxnzXGkHBkYCvfnejNGUcpUzToN+5fzG3Y5eWkykM3MyiPzh9v64FCKyVCta6iKumUfEBy
	zX29X859ycQFMfwsdKkUnpeVcZNnB1xLr5lrtcviIvk4ggfDI0mp2VbjzbxHBGaXWx9uYe7kcZB
	1JQ1jZ38JtPuD65BGs9d5qI4gncXTHJlyLvaAT1IAHFHBA9j9crzNLAVO+Kut4m9f+trOTTOC2x
	QlypJ/De+ig==
X-Received: by 2002:a5d:5f47:0:b0:493:690c:8364 with SMTP id ffacd0b85a97d-499c3ba0637mr4190729f8f.3.1794403900138;
        Wed, 11 Nov 2026 05:31:40 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:39 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
Date: Wed, 11 Nov 2026 14:31:15 +0100
Message-ID: <20261111133119.1063210-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
compatible string for the Youritech et050fw01-kt panel.

The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
display controller.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..c2e442c20c0c 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,et050fw01-kt
       - const: ilitek,ili9806e
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ac2f54adde73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youritech,.*":
+    description: Shenzhen Youritech Co., Ltd.
   "^youyeetoo,.*":
     description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
-- 
2.47.3

