Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3C347FC0
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 17:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224733; cv=none; b=FAty+QnzLZjSAwtJFbc6Wk8FQwYlnN1OxrlQVSIb9jIHvUwxGXWrfd8JzIRw401HAZGVV+GC44p+4bJQQx8lRYZSOiJvgq9g5oJMx2FcIzlV3dy6EWGHtkIv16ysNpvkGvldlA1iJnqkFrxS/vbrE6jROUdVBu9k8eZEBhsBgpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224733; c=relaxed/simple;
	bh=l6fjAaQfH5yQWgbTkxY+6qKphogxw0jn7uPOsSyhKug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxzY+Pybt4lkDSDN3ts67dnopWPNGpOH/SXeMASSwfcpUSxPc8LWX/iciJ3tJlLRI6CBhoBod3bAkqUtTzo56Itgffsa0YUBoQATP+mzofiSi64NLnY7DjHVe9BORzagztEDNHxrgT5tHAkQomAlZghx0gWVZrqaM57QGuzK5vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrNMnm/R; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrNMnm/R"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-481188b7760so296295e9.0
        for <imx@lists.linux.dev>; Wed, 04 Feb 2026 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770224731; x=1770829531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtnPblNidasHdzF3fCc40f6SCufCocsQtBk3FA5AuTQ=;
        b=ZrNMnm/Rm8MMJprZsHYqQaYCDyxEy1NVwUQ6Sulk0/v1avioJt1Zt+cl8VpJpUgt4/
         gN8REeGeKFkk1QGxc7NE9HxcZw1Cv8KrM+SBeiNFNNgGPm/SVGgF8nuoeEZdE91JWHOs
         YuZ0nJBh2NMOxL3pze1mosfFKR7LXJtA7ZlV4kTXW34bHqtNWM8HvyCCzBDZRJBai9/B
         yy6y6nJMAVkkZisSHJg0ViXWJ6Dgc2g2Aak1WxH8/uqoIJYIWOLD+xrLP0DTzC5rQzFv
         nW08WrXoajos2gsma09xGjslaQhgC7BJoHtBxXAJlE2sCSoGn73o0wT/H5IUXLUhWCSq
         pQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224731; x=1770829531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vtnPblNidasHdzF3fCc40f6SCufCocsQtBk3FA5AuTQ=;
        b=gHoUB+CXiQmkkHdONYj8UXG0R46iyofZtXNUTodl/FrLergry/jB3UnLyFeDX1610A
         Zb4SriVf5D4099bQxZlZDpKinS/kQPZb7n/8By7KO2mnKvlKNRz8EVcGZIzgQvAMz7zM
         ilPzcaQwApLVJmDnAzZmu7GeagTFEFKIZnvcen0jiFY1EnxVfwKkj/npkRlLtcnu2VTg
         Zb09rGhr0xDhgGEQ3inj4HIuDmhd/w5fmfuOjJNrS8WwkqJOtU/oTFsRDTUAoZ1JlTuq
         3JY2YS9WSUmjiUShUxgje6QDsCkTMagXWfpiFcXB7OOHJm/A7sfZfO2dQRUEhzxA89E1
         5Qcg==
X-Forwarded-Encrypted: i=1; AJvYcCUrTG5ME49t9KKwXXC1vfUBbNZPkhtI30xGdLOpPaHDM8Ic1ZsPbAVTs1K5VYGdc/7Q56A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRvMqNosfSJzZ3DTUVJcJ+lvfnPPuJNG255DNSoYXG9JvF71rm
	o0Gl0GyCKQidbe77ggltUzxlpai1XH6afDbOjFKohWK04F+QtIHoWXiI
X-Gm-Gg: AZuq6aIsNat7/VLo5S+PAHW3BEsZK8x/pQxzEO+iWWwkCwp5qdWevkXWk9udbtTyceV
	nE+Fl89ocyJgg0He3OlTC6AQAb+M1/htO5y0TxO8sm9+bfHvuwi74TQEHH9dIBWu/aopS+zKgyo
	eunEuFkAgd7YS9B71f/jUdXn8QEGiMmSQsBqtzJiWFyFR7FWi5PJckgAqQLQHZR/lzOaeaLONx4
	MnymXEMzPZ+e4tUQMv5oHFyONg4mtWz90fl3C5nuIOT7tphmhPFCoPkcsuv/9CyiRJkGqP+Dvyi
	hh5rzO7p/1ofc8aZaOn9CX61BAP+otjxNPdVle8Tw09OErimrId38ApnK10VYOpZ5bDfNTRZU2C
	xFRHE6AnuvnPYz3DVIBjpvcTM3kN8TEN4Kqi4BPPbXSSlKc36iWukXZJUa4C5tKLrZLfYbWMIMO
	vMxo6SV6VX+N8DFyjRUzAqi9TmKAeQGlArq3RewuhW0lw4gmokLePplV5St0NVslYvS3SAevyBv
	G9SP9J7ddgYTgQ82xTjRDDJhTqhPyK7EgMoPx8=
X-Received: by 2002:a05:600c:a088:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-4830e98388dmr42262415e9.34.1770224731449;
        Wed, 04 Feb 2026 09:05:31 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec10011sm38044465e9.0.2026.02.04.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:05:31 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	maudspierings@gocontroll.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
Date: Wed,  4 Feb 2026 18:03:54 +0100
Message-ID: <20260204170356.35169-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204170356.35169-1-stefano.r@variscite.com>
References: <20260204170356.35169-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX91 SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 336669e16d7a..4c200a67600e 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1524,6 +1524,12 @@ properties:
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
+      - description: Variscite DART-MX91 based boards
+        items:
+          - const: variscite,var-dart-mx91-sonata # Variscite DART-MX91 on Sonata Development Board
+          - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
+          - const: fsl,imx91
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3

