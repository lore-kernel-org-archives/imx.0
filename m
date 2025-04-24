Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AEA1F3D56
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475735; cv=none; b=Wh9JS6Et2VJhuCZqnXxLp3y3h34Y8Vy7i265MBQTw1UZkR6jPxTJt/iss4d6y4n/cRHzHFc6OjElio0h+N4aRlW0xT39IBD/ys9CBYSA2X8vXdnIg7Qq8QW/nHQdUIGrvEl5uSKA3GFZMVY7y9aHKrfi64R814Sywhtz/zIvszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475735; c=relaxed/simple;
	bh=MWwhsP/1Gq2jtC+XMH/+PSmlpfJmY2R2gm9uwDR4fZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2mR4DqnBcuvnArA1XjC+uJaFoCYazltp6MXmFHC/HntonSglwr/oCjtli8uyAGxC1Vs9wHm5s8QvVlu0FxoHb3QbapM/XtuNhBSxVxGOWA7N+IexACraTA4JAmDyCEhA7o2tNy7f0MyK86HZ6HlPas3/CYbQHjztD3c9ts4ZlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=imNB1KYe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="imNB1KYe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf257158fso3199155e9.2
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 23:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475732; x=1746080532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=imNB1KYePqUdosJOHRzdAETwF6O6+x84F1taILCfVywPH7w/A34hXopLqv7rw22FPL
         ktNG2y3XU0QyqhfmjEX+cj5pWMm0btmVpMMVuS/EJRFLESS8BThSdgkGkSbLNMBKOlNJ
         5m2QeStVtYPP5pRuCWRTyUppY4uNEYGDpNcng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475732; x=1746080532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=AQrZ4RvjDC1yBUu6CTFOJ2+0pAmX8L1bXpN60/qeUJwVKOBAhFGzzeKyNy3WNiqemK
         UksY/hFh6Aqf2lOz6MeZ6FilhzEiY9d23vtFJRu39R8IAPVTQrIdn7kc3yr/VaIL1CN0
         e+PaNspEyq6sA/2VWhUffUspuek8RxTaiw7aEFIMRoRGxlrc2KHpOzwim1y326sqp7MS
         loN7XMAcExJ9+9yKObQk9eWXn5TEon+2BA3GpMJFKoyX5Wokpk79yGkqxvaWXy0pnEKU
         8hjFHeQcbwSQ5/luX+3rbOBR2H/cN5UwXG80fsOOgeoHQ9Pnv0sL7EWT/S4mdkSB7yTZ
         kurQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUL/ubPvZALeuLDzYAQnuG+sv2OaV465oXdzZuNDpMzx0V8PE/d7j+HVkpbQjyuPzgz9A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNiOcRZZCuemi63I2DqKUyDJxTvyB8vv24AKCw3GG+feWJ+gZp
	Fy05icGgjIBAGxke9myLBeLh5w15EvtvcwWPDZyAWTLJyz0MAnvYSrNKUcsNUtw=
X-Gm-Gg: ASbGncsNR9zVYibZeCeJAB8/kG4p63mR8BvyytkBoDBrfgRWbhKz6SHkqopfzF2Wb1b
	zW7AYW8zhtYgzMQLu+ipOkK4T++0fx9Be2lLgaFZnZgSON+P9ipBvTQud5IoadvgssHGK+PTkLw
	9yR5LUscBwFoNAj2gYdG0xfGFlTV68MJn6PMJAWuqDcuNywkK1mo9Kcgn0pBZa+k6dsw1X60HIQ
	CQ+xruVPXDPNzIRHNy4eHPY8OkH+9YPU1YFXtX55Wr0LKbwRfEjELdC3ue2juXFpktNst8YOsCF
	JNZ+/b24pqCv1vdpkE86DWwjHIzjjqj9QdiZZwVypEFS8Su6lNmb28FbKgnnR78WGa2dpICCh43
	w6teaY/yq6s03ES4=
X-Google-Smtp-Source: AGHT+IEfP4KDLP0ELF+YdFHzWQR/nKs0MjW8gMXZNg1m5ZDmDJsijDCe2zRl33Nt4gAvs8xI/MK0ZA==
X-Received: by 2002:a05:600c:3554:b0:43d:16a0:d82c with SMTP id 5b1f17b1804b1-4409bd050a7mr8473415e9.2.1745475731840;
        Wed, 23 Apr 2025 23:22:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 07/19] arm64: dts: imx8mn: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:37 +0200
Message-ID: <20250424062154.2999219-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
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

