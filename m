Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC96219EED3
	for <imx@lists.linux.dev>; Sat, 27 Jun 2026 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782571591; cv=none; b=tws6i8C85nCnmagmpkSkPyA/BYOBsa9a9h88qvO+rpUuAIWUfoGM/m14r6JwJdvg+b5w7/+q9Ou4v47p7sQIvqbqkDMpl87GliyGdGoI2TloUAu/+L7uT56eXc9+CGhUYWtBBs8Is0DEAudksRU0r3c475tCT9XyeNDHIBZsviY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782571591; c=relaxed/simple;
	bh=FeQgJg88JBYiOwtiHClsRnpZGVVpN6ZmFHOoEc/i9Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezhsdCbECl0aHjRa8Vkp3hrRjSix4CfzIySyyHgYU1JhuV/FRyTa8MnyzA5EkLLBKMPVuE9gLquc8adXVRyNmcd+qEcWBihsBKC8LjExJEikgNqY1LRDk/BPFeX9sfI67DtwTj0C9fpVYPTpptQSXAk+Kvhd7MF21mmrZmYrM2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyaeS+PY; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyaeS+PY"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-472055b0efaso238210f8f.2
        for <imx@lists.linux.dev>; Sat, 27 Jun 2026 07:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782571587; x=1783176387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KHwLOSYIWKX1n6DMHTpAW7jB9Ph7crlREi0FQ8yYCo=;
        b=HyaeS+PYHZOiRpV1ROrqCUQqWUrKDhU+1Pogfp02f6wERvCvxVJv8fq47Rug+qBGNl
         tbYFJ8Mr6+QUXXfQ1s+Bbr5u3/WqlLxmUSIgjp5+FuoHO9/zL1c2siHULlkN9B3TqKVY
         DmHdcRu+cq3zCNEOnRhSj6UZRcK7gN/seBF42UU2srxsff+uWOxpH9RRPkQHri9mdzC9
         mkqPivCPDkVQUelBHtJgcWODS4ZsB9k5Mm0wq9kuWlAy4S4YC8Dc9jgbENwAHRBFH1L1
         n3R8AJhH4ZevyXxIprGXCqrztoowm/fBZ3UhYrhNI0T7z0IOYb9xBcAgcKW0xo2yUSfM
         wXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782571587; x=1783176387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9KHwLOSYIWKX1n6DMHTpAW7jB9Ph7crlREi0FQ8yYCo=;
        b=ZgtRjB9BvjHJon7msznQ6nqgZfKVDrzclhgOHEKTePyAm495c4FWSgZfJDcKUUmcUR
         NLtnjvsY3Xb6lmmQBbYIZO6kSNeuTt17SUeempAdbbZs3hCpdeTI9Ms3tdxNBTjvrFlZ
         1iqQtv/+NwIOIeLuhUScyJOwaD3aLhKZHFbJ30u4yY6pyVVnJWOA5mQThKU/LM537ITx
         ro2bk4jklMpfefQ9ZL4vbc/GN/Ijt3Y0pQH2YqUqtkD6W1Cf+zXK4cVpGQz27K8tZNY/
         ZQKUQbVJ6NDkqz0kQ0o4L+fs5P6K1TOHTRSKczqLSZ44oH1zXSbZ7DkrosSA1QkZ6613
         wOKA==
X-Forwarded-Encrypted: i=1; AFNElJ9trdZxn1EeohVbooKcWblAI8QR18QMt83mPLfu6FlYOISSJ1yxRrOa7+UP8oGyXBFWy6M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yztc8PLv2U45XTSIubFszP0psTdCa/bVSflBCmQ+ov9c8GC3bGd
	e0ZKTEUNpBJ5ayyYjwjVQtI8+IifsQe86I/0w0X1rmefsBN9U00n8rjc
X-Gm-Gg: AfdE7cl7G4vjbJ8mUKBphxLymkG+HNuVTZHcAyD/E4RjhFgGdmqhpRcph0upcbz+L0r
	sQY7Uh7YOFR9RvI43OjfuSHzZsBTFhNcTbjgU1ETH4t63yCJf6id3nJs5zHxxSKETcD8tLyK14t
	z1zCMpqYlaLhljSaBbWddPzLFjSUuqXr/WcIQI2LfGt7ENHmZ9uTqwozgaICE0cBYcA83AkphaR
	1dYxtvJ/y9QCLirxZa0jtkicEbOEoNxiz1UG7yo1EyLGZwJSDAIrGVQQJBpqkaNkcSzGsFoFBy6
	API7ZiwmLXZfQKITOON7oaL6VEcYCFvSaHw+Ud/1nfJkQuL9pOGfYHSTjceLLLbZGMcXNSUvPjB
	G63OVH2qCZEvRGTryKwimU4YIYRZ3ktMInmuUn+Zjlq6VlrkzP6d1cPchrmoVBJtrbQa8+5f/dh
	eHpeIwPu9CGdnqRvSpVOWoANd/VsOyRqkivGEB4+MJiUqaKdteySSGA7kPIW3Nqs+jGlv9vWVEo
	hCfEnruwgr9B3jYIWFqxY8Db2jO7FHRlHFFjQ==
X-Received: by 2002:a05:600c:e54a:20b0:492:6093:8837 with SMTP id 5b1f17b1804b1-4926689a4d1mr117391445e9.34.1782571586901;
        Sat, 27 Jun 2026 07:46:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm98709035e9.4.2026.06.27.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 07:46:26 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
Date: Sat, 27 Jun 2026 16:46:11 +0200
Message-ID: <a3355082aec3454f671b44e1f9a78000d2733470.1782571383.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782571383.git.stefano.r@variscite.com>
References: <cover.1782571383.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MM SoM and Variscite
development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..c942d3d06469 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1064,6 +1064,12 @@ properties:
           - const: solidrun,imx8mm-sr-som
           - const: fsl,imx8mm
 
+      - description: Variscite DART-MX8MM based boards
+        items:
+          - const: variscite,var-dart-mx8mm-sonata # Variscite DART-MX8MM on Sonata Development Board
+          - const: variscite,var-dart-mx8mm # Variscite DART-MX8M-MINI SOM
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
-- 
2.47.3

