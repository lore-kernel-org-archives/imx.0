Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227047;
	b=F80+vyaTFkR6XJ4EnIqnYkPM5QAlHaWF43awyX4pSxst9sk7LD0sGeCiTgPi/qdC9MUc
	 DajG2pmf/4uhhKSy+xcjuTlSGnXxqasdgagB+raw4RjLZvaqMWTlQgDNFIc0FeQW3EdaN
	 PHu2xODcQijW+M5EjdTF74OzfbqU2bbLSp3CfSWZASKo+FEKin7zlw7DaHciJKLKZxXUb
	 72SIA6hH/i2z61E9GpI2453CVaEAiYqifznNzW6eLLskldToNH8pohsbJQWz0TwmpvYk8
	 AmnaZiMe+MGgsLlYggTtF4magg3eA+EZZhX4/1LKyrVGoFaoxMu3qiD+Eh5il37MhWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
	b=lDp/0VtJ90c0TdpuHlwZ1lc+oQ9Qzet/QaOkF4MsLBB8rjXpqIGuBTWAeKcYc6iTKyes
	 +PCdwlaxjjvDSV5ISjQeQKdKNpN43OCPGfErVpzLGJj7lCTm0R1pPnjtLYlOsoJkgcgXB
	 Bb8FmaMVSgP/mplLHabqvfnd2NhAt/mBoXVB7qIGl7K32DF6MF+NU9WddrWBHtREJ0SKj
	 ZEhsdyqiogmmwFudsYRE2PJ7wH1oQCjWCaQcdp3gtOqv2XxHsPSMkXWkHdUtVU9k+8W8l
	 pUbkiJWvsvR/8No/IvZpePhBfCzCPHmpIghd58pnN0USykqmIfDv96k7z6J0znqmQiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Nw8SkfEU;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C146083615
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 12:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C146083615
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Nw8SkfEU
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e4831c028so875461f8f.0
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 04:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227045; x=1794831845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
        b=Nw8SkfEUsy/P45ai9/soSYeNz3G7h6l6rIy05vGtcWRdDD+2mViEBCM80gDDgb10IM
         Q5pwUVLL8kBXFIZUC35TuJEuMwVKnhtxy/Hw/MpWk0v7XFNmnXZ3t7TrmWD+tITC3iHc
         db0u9tQoXSQlwAYUzILSBz0Gdj+/h14EGdjZqqfau0DH18N/A93idOrF1t1hZfeIRM6U
         hQhgBzr37nHPdPX2f6FkjPL+Ms0iWGFGMskFzeLTfgS94siolLXEYjY4OQyq6Ip1JNUp
         qK89UpEJ123wQPsnuv+2LDSyxoTb9mKQ3kPG6U/lvtDo54TPntnzSD5KFVNfb5n1RDmX
         wahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227045; x=1794831845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
        b=j3b1O/Co1E8m05ValwC5P0g8NMRO2moqIa8vLi6cX69g6u1POtfAwnxc+x3yoM8nZN
         oZtuETJhQR5iXvr8F2u46SHdXBbfqS6kCYOcuPByXe+ZGg7qX8AVHyOQWfdAXRTRfQBq
         /yNAKmaj68C4Nv9jcTkEYrmdDpbqwdeAuIZ01ebh2HUpFkPBIKhjgdg0pqx9sv+NZOEP
         oMCmAyqhB/AONb/JM5+4eHDZcBNZMsOE/HM2PeN/GAifHiXnrUdDiE2ydBPXSrUZHWry
         yEveNLFtgalFTylr4lV+zgYQVJAa3wLEomvA60+w60zMSnurysYej2Wv6Wp38tdmqqA6
         ESJQ==
X-Forwarded-Encrypted: i=1; AL+hErEtkHQe5Pun0ChP4FapXLzlzfhRVfiUTpQTl73uJ9crc0yszSiDcIxAolhWv+PAZGcSNEY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9z9sxJIrKGQMZIkzFeytbAP14EyUMRNAgaoh7RmWLh7081s0vN
	TjxnaawpoaQ+Mgk1MdEzMzyzLErj+6VG267tIdCr1mhXGEZ+fH7uSwQ1cRWpY8xs4oI=
X-Gm-Gg: AYBFou01a0WH/QVZ3U/hVs+6SqV61kzP7S0mVSjuZx0BkMxgy0W9HdE+I4u7lpBobV/
	QKPc8Wp6SwEfXQokBJT9KonMgEqluLBrIjm5mMXnVm4I1KcaopzggRydG+S21fXdZt0V/8lXljU
	RJ/OhHlfnFHYebIXN7DWav7tOtn0fq5HKQFhzvYTxgwuhSj0XbgrjANhZTg5RDvIHCI5ClH2xgT
	QVnwB2N8S5W6mYgDExip3N3XPcSBbz8Jp5qwoDH4x8ysw6kjmX4UPlWNA2hl+Av5mTeCUvHqkG7
	Co51lv4Ain6UQo4KOBYvuYWh/IRjYfphrcSqCVI7uNEMT347pVnSU1vEUoIPbJF8KOhnP2hFT9n
	MpiQVwzKg5sjD0uhYYgmMV4NYnqRlCWP5qudyAKjTxMzCduQBBjCRoXJjQwBm0q+XaJSuUokfll
	P6HKu3DG6ZydHpnPb7zv/pKcl0i2qMylAV8y5zaS9yT9rZBpfM/1gAlhhDwePVgxJ2VdO5zxbS/
	PLQgZsotJzy6lnHkvlYAdw2TvdbJWgCh/L6GFLVCMecuWb/aU8K87DhVti5Y7KzYbkMnl8OQ3m+
	yfBJ4IDzbV0RBj63yeTAY+uQA36UPofWiG55Tl8JvSDXNeRm/NTZwp06Skza0nYSwODCqHGRWDD
	mNff984EStSk=
X-Received: by 2002:a05:6000:2488:b0:48f:db47:6ebf with SMTP id ffacd0b85a97d-495852178b9mr6692780f8f.38.1794227044813;
        Mon, 09 Nov 2026 04:24:04 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:04 -0800 (PST)
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
Subject: [PATCH 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Mon,  9 Nov 2026 13:22:49 +0100
Message-ID: <20261109122250.720757-5-frank.obergfell@bytesatwork.ch>
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

Document the compatible strings for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the byteENGINE carrier board.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml       | 12 ++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml         |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..d342930981d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,18 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and bytedevkit
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
+      - description: i.MX93 boards with bytesatwork byteENGINE OSM Modules
+        items:
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3

