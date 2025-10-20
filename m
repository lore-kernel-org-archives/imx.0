Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672212D29D6
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 06:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760940636; cv=none; b=Usxat90GSqN3HhN5SqQRa53AG8wMnCJLxsumlT/uWHC3cMVJhZGGhlC/rg6di/qGQxzrB5ehix92uhr8ZNMmYTplOORpnyfHx+LQQG1OfSoKaKGNt5JqDrR9VPvtOe7VPDVY+JZs8HtgqiJRGFnwED1JPATjXTVHgofA6IyM/Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760940636; c=relaxed/simple;
	bh=o78Ibu1P6ea86yM9/Huy2EaLNxH/D8CyhjZekqZH4qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2pmUk6cgALu47nPvYq4Kld+75FKv+NrKAceMe53tb1K8q2tvcFPY5nZp4QiZNTrOX6fT4kt0wCjetS72MqF1UPk5yHagpaXfqqG/fZHtt2gjWOrLINhC3/Ove5E1OFckI/S4xtNhYJW9Z7BvK84J0Q0+TTtaAkNGI+PNTcvzpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CHSmqVIp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CHSmqVIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=668tN/r2sYEV2dclmY+UlmPJ9GaHeFfzvPli8gfAk68=; b=CHSmqV
	IpmdTBm4jaalCqch73ilElfVg1Qz17FauQ5L0jpIJa75U8alYSkbt5wIIlyTrACj
	RmEnP7SdJNGJpLtVxOHVNJGIyt3ArcdaPYDR7or9Nt8AtXYTWQ4cLuEtTaeeYF6a
	eayDSN69vVG/s1mOi0PhUdoS/xbiE0r4148b/+/jjU1R3IoFlbE3qsMJZpMREBu5
	s/6+f3HE/SkKysFECGiQKRCgCNq4qlIeNS10j85hxObdzsLuUH/T740IF00pmv8S
	/my68GZYEqkI+/5KKbltSExMzw5T/aDzBDsLK5X/Vi3vtHMwj3iBxZtQ3Q4kVZzT
	Rl0s9cVsl7wTgQeg==
Received: (qmail 941026 invoked from network); 20 Oct 2025 08:10:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Oct 2025 08:10:26 +0200
X-UD-Smtp-Session: l3s3148p1@zSeC8JBBJIggAwDNf0fPAEuMhp6AgTGK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: devicetree@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>,
	Liu Ying <victor.liu@nxp.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/4] dt-bindings: bus: don't check node names
Date: Mon, 20 Oct 2025 08:09:50 +0200
Message-ID: <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Node names are already and properly checked by the core schema. No need
to do it again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
I'd suggest to give subsystems some time to pick this patch before
Rob applies it?

 .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-
 .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
index 24c939f59091..cd5c2a532a92 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
@@ -43,7 +43,7 @@ properties:
     maximum: 20000000
 
 patternProperties:
-  "^.*@[0-9a-fA-F]+$":
+  "@[0-9a-f]+$":
     type: object
     additionalProperties: true
     properties:
diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
index 4adbb7afa889..6645352c7f6b 100644
--- a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
@@ -70,7 +70,7 @@ properties:
       - const: ahb
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     description: Devices attached to the bus
     type: object
 
diff --git a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
index d12b62a3a5a8..bf0af3424c9a 100644
--- a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
+++ b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
@@ -44,7 +44,7 @@ properties:
       Contains the firewall ID associated to the peripheral.
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     description: Peripherals
     type: object
 
diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
index 20acd1a6b173..9eb0b48b4f51 100644
--- a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
@@ -60,7 +60,7 @@ properties:
       Contains the firewall ID associated to the peripheral.
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     description: Peripherals
     type: object
 
-- 
2.47.2

