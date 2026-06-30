Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399F23EA962
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812825; cv=none; b=eKbzzgXjFv0nMtnC7Rrbcw/W04whuPXwEJw0HCbWbHWtPFXKhB9USPAr3YRyOlkEEKdsP3Zu3tMV43emtwGBMhb+5Hm5pa4SmJN0QwzUKcPbXrf+VyscM9aDgUjLSQPkUJaBPD6cCXO3/+qQEHSJZmorJruC/6IMLdSa0Sh6yDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812825; c=relaxed/simple;
	bh=rudvkcaRSOiNwd4DxblHsmzq1p7R4SyKRG7f/vefWE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVPok0zO3Y/OmypkEyNvfKafvtHckBzuk8cCfuUinPHZfoHqmvYb5ogtONVLUS6IuhPlXMNIVOIafkNJiFAZlJy0cdFDI1WdZtdEIRqGQ7BrecOcKuq7eoYiacDyRzpCBOCkQSHkexWgOow4iBzS10W48n7h05bRhtFvuVpSoUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oi/Tea2t; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oi/Tea2t"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so30533065e9.1
        for <imx@lists.linux.dev>; Tue, 30 Jun 2026 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782812823; x=1783417623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRC9XZU17QyWunvSCcl28uA9vhPOpFwaKc+QPNykpyk=;
        b=Oi/Tea2t+GZphpGaoYwiIuzindidCOYdfu+4yHoe3n9/AS5u2piO9YCEaBdkMQfkr3
         2wGXPd3XBSfKb4h6l4wR1u5re7nY7NIAgsWNYrDrfJ1ZpyEHVkx5W7/K2QHa/FGRHi5J
         W1EMsBObONrxAiLwu4ngN1oO+NzlICLDvqFJwmwgh7bZvIXC3lX92q8PREI6E7CgJ7EO
         Oyr/99tyeViTpp6sZxDl6eVw3zrWb6rbSANOJ1QM+zIgBwL91+Ymy4uay1ejp0nt5t+Q
         8CsgkKsTtv/y5P58l3HnSleqFbr4lEjvKbXwcS5W8BKDTSnkf4KQve8ypR3LO92RUK5+
         gHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812823; x=1783417623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XRC9XZU17QyWunvSCcl28uA9vhPOpFwaKc+QPNykpyk=;
        b=gldoW7WsRWtmG90TI5dCou2Ya65r2f4kXKKy7Sc2/n5isY9D3GScML9MIgp9YLdJte
         OW8EUDWVItIbDxcjQifSJYSo7up5qNmg1DoeLMCL2D2xKQjrGC/MRMOdHyfhsEr7p49X
         G35qoJ0x5SpgdYwg2iItFW/HSGmjJuZrG5agQKeEGJEsSpeA3CE2xmTSpC2CDeIjju12
         uUoZNft00wXkiiiqrnDWEzycX6bwn65vlhr4bCoocOFGx7W1Yh/jfTqcjFz2CEvLcfbC
         2zU9w3McRne2ogP2cK6J/7ot7CYTVBJs5ooZi38h+KsPrGu2OakqZw6njn1Z/8iGw47b
         dUTg==
X-Forwarded-Encrypted: i=1; AFNElJ8O0L0yW/6vmxqBPLVurA1Rxe1KNq/cE3/u+Ay9Au6CIL82FhvEwoJkniL0jCCIims1X6c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLLwi/46gt7Y1qHQLFxpRpTdbuLL8belU8yhiLTHDZZx/yLWsS
	42JmjE1JBIZkyJaB96CeTHLWDz9gn7MCWmbBwXDG1qBXPYEMdPK8DS6D
X-Gm-Gg: AfdE7ckFhXXKYo/lsRBIeGDAod8Sd7SFe0yr5LUxBpHR/ZwoKWeNALh4rQuzOrynyOy
	/cwpwGpaUDf65dew7AMGb0xFOWEjpkpKYkt7EZiTRkjinRkntjLBlU9jum7KZmloCQA90SniXZL
	7v8VLbHKE6mYDM2hcgakJdOkPwdekEoFfvw5M6rfyLlAaN3izqAKPc/BAcSMuKlRhiujCWEYU2M
	+oiGVUjVYARjb+MWsq95F4WjZ1ikYYFIb5fsC8ODM7clc/c7cXhHkV9+Z+GfbTFG3F/4sUyQQ3m
	1pBTgGF6uvV6BYqlz1cYs7a6KXtcJsmqYpskpWallGdNOkCAr+5v0GVujzkW41aJjrwZRyb9AnE
	/C1Q9h9rAViL7+xIxhXv6rYshB0nUrE2iRDTK0bNmoOPGtzZ2ZRXEv7NDAkKxWo7ggGK26Hw+MZ
	2pcG9kPfQkgMvbTpCkFxso++G5ME4xasImkwWzvqCi1DhEAoeR7DXYVfYfwd/T7mdbKeMG/5yVd
	YejqbjLehAZomBSoa2E286Gow==
X-Received: by 2002:a05:600c:4fc1:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-493b827f691mr43818955e9.6.1782812822376;
        Tue, 30 Jun 2026 02:47:02 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778f015sm6552725f8f.31.2026.06.30.02.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:01 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Tue, 30 Jun 2026 11:46:54 +0200
Message-ID: <449840f7b6ffb71b677ccf814a0294c981854033.1782812572.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782812572.git.stefano.r@variscite.com>
References: <cover.1782812572.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..242a58eeb314 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1369,6 +1369,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3

