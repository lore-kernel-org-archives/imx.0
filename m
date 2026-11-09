Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227040;
	b=SDDShK0ax57QGHMvWlcJOGsr44D618rR5977p0z9jppDAl13Ah1z2HSXm1UnqUycDIT5
	 PDi0Xy+oJRfyvDa8iLlch8yVlNyyiELlJH0pKCRKRos61RZixVL9J5HNKqdBRiRiwpS5t
	 hPimjbm4BN5rcStRFeBPWpTI/T6fu2PdwxzXKxpYgyg2HMo2vTXDCC2ECS5x0L3gJTFO4
	 u84irjI4eSddgLUggA1hPm/Y0etbY8MVru7BgST2HgHTSmULeNZmyx7AVKDy5yqzdEwFi
	 iVnPlr9OKfI8XLoxmbSAxnAGJNMsFhOtHR+TLEjQcQSju6L3iDiWNU8kk0lErUIrbBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
	b=AnX1r1ua8cqAmxnQjGjfIjc5kL5CnBjamKH5OiQrHec50NXHyoG819ET9xl6EVjoxE4C
	 YoMgEVTBmL/GPSz3DU1WIHoUfaCvM4fJDjYObJz1jshR5x1ruBz+aDz9HKYmkuwWaGLFi
	 hTUjIMoCCkqz+vVwBVryof+2NlcJB114LpTSbtmA/1IRoHLWRy3mIilXF0iRIMFt6N4mO
	 nWggoo8tRH8GGYBKMRytwMXc+nVWfZXMUAkBsgKLJl1r/7n09xGU3ojUA2fZp722tCPBo
	 HWpoiEhfYZr46AbbEbI4cX1Cu0TEqKh9Cm4I+/rCF7AMdJo9aI7rAAvzVFMCsLA0OzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=E2nLVIxM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72A8606EE93
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 12:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72A8606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=E2nLVIxM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso4400675e9.0
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 04:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227037; x=1794831837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
        b=E2nLVIxMWMLPOs831mrh9nHdzPJQiknyHrXvji8skk0Jm4+YrGKb6P4n8uSPRNMr06
         yiK3+wgzelgM2yfsQ7Uy5AO/ZSETzrB7OCy2hFJ45TRenEUFw0VuO59h2thxzFo6xckc
         XLoV0Ko2EVjsHVbf9JQIcJKT99prC6kuogykDbyyRZ/KIURTKYaRSKeD4+yokAw3KTU3
         jjb81cmcNcq8O21wpvZbYjjpYY9pjyQUTzZq3y/N2fiXTWqXQNnkWbCKZFLHKblbinPN
         IIUzmiOIp3kHL84VamZGi7rG2FIWLsT2j36tMJMkuFPxtHjhVsRJje94iYUd3HcPUsMp
         hYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227037; x=1794831837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
        b=wcjTVk0PRDycpJF76kVzeCB6OGAT2M8t1FkmK4M3sM2PXT00E9st08NpXgvlwo14gA
         sBTzJsLRRYjCqgy+ime+UiJl23EqCguDtG+VSOe1drKbI/Jwm9002uak+G727glYYwXX
         e3jieweqjFemL6wEHEPrDduhFY5/FXe4ihzlHrH5LQhI7SZTCXpp2wEdApOIcvoVd0C6
         S94tlK/jQrUY1+UMzyXUmq/XTkcJwv44dxefBp5CbofPVaU9sXkaWRxyHjcOFx8UbazF
         imIaVodUp3nZt96tDvVgxX/19L526sYRVYwMllT+I/Y8eY69vpO9aWpuuTKjIx3KIL74
         8Wsg==
X-Forwarded-Encrypted: i=1; AL+hErEYW7nn+ebJ4fOpWExRbV2d1IhOV+7rRIAob/w40ZvlzjZk2Bg2EHweDx3UXNJcxNzu4Zw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+XBXyXunysq4Rl8vQ30JxSOfyqhqGpszg/FA9SQ8Sj09ObgYgG
	y4QhlsmgYlwXRrL02uGdnrUjBhxBap7Pg6LDcdXFQ9TQRymACSSrkzHvBw2Yv2j2/40=
X-Gm-Gg: AYBFou1AOQf7C69URoumonjwZ5PZh1QV8JBLmgDcs/qo7QHZYce3FhuqQRFI4o3DWKC
	4qTVhOHrhsayX9gZUCoENhW9V0bV/nrRT15oBbXIvuWz8Ivc4J24iN1N2Ef+KP0zaosi4Vd0jE+
	XSqOhFNX+8uBupffLQw5tCQ8M4sb+yUUs7l5zyI7TR6BRLbFNrev4S7j5UT4hsig3ty74Ymvgck
	bUZNpFyx5Ak6Bp+GA997lFvUAWWFvETr+ug49q6QamgYTG/c9BlzRVoCprtzq37DEMpyO7gFhdA
	dtYYt3x+TLW1xj2eDb9BuG7Kl5UEcUXD2h8LMvq7eSawoJEJHxPfeAP5bhltIaETDH6Qx4pH0jY
	mg4f1YLn1ZGpm64Fs4yvRWjeqNtbb8TdzT+S4RS8mKi0XNxXGuLxIKzb1eyTQyVKiIHQ/wZyKcA
	CUEcVeqK0DS1CKuc05m1oapQh90oxMOJBCVJW/a+Pnw4hl9jAwqhRhstT3tqqg/tkGr0vCXw60E
	UNRzEsyWQqnU+KgZTrMY3CYsZB02MeMiYrTiTi49aveJ2mug52iiiixXecQOhoOCkq3OlNHUon/
	yySyj4eT8xRGhvhFJX1TaGIJiE/XkPMW/HjOPc3zFFYSv7SUYd/GC9LcGDbH2gSe2J5b2TL5N8l
	y2ctAq51WwA==
X-Received: by 2002:a05:600c:3e0e:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4b963c75b42mr68468965e9.21.1794227037216;
        Mon, 09 Nov 2026 04:23:57 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:23:56 -0800 (PST)
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
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech ILI9806E
Date: Mon,  9 Nov 2026 13:22:46 +0100
Message-ID: <20261109122250.720757-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
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

Add youritech panel as a compatible

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..6f29ddc1fd09 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,ili9806e
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

