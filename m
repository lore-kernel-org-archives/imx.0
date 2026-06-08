Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF493B4E88
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 09:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910661; cv=none; b=LegaHhhN988TH+hp5SVEz9jRQF77hvnp4I/X8OvVyXq3EVnrmy0HHP6gA5q6y8xLkJtYzjS9oPpZx0SnsqdEr1jYe1nio9RsmS443UXXex2LixbpxjDKCgW5U4w/AbTUs0TvmXnC+cQffTDt10e8AjGWraL/K++ARm/AxC3W96s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910661; c=relaxed/simple;
	bh=Z8Hj+5e3N2+WHS0fb7Cx+3nQ/BevrVz2wjOEvePGYBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSiA3RnuMG31dCnPIwP8yBc0gc+Bp9uOD28/SlR5ZoqF46oC3N3RK5eXRpDzeTNm4i2wyJp7oZLRNam0PhFC9TZLzfTfInIeo5pHPn6Iliv+AOeZ93U67H4qZ/epmG1twUC300+DecAdEFjZXUDZkn4A7r2+NVzHQMMJ0+eN+ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puIq8Atz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puIq8Atz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b613a17bso39414525e9.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780910658; x=1781515458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaWjlNamJmHc6Vj5CnVtmPCxqilnzYjt6Rs02KkOq2k=;
        b=puIq8AtzrfcKjjS3pPAAyrreapXj+TM1/49O8FFNxACnx3umK36AfzrLYE/RPTfo6f
         iLpyeGlCs08Mz8pZrIjmKa/5Q8z+NIMIZdhTOBSdB9k2ajBtIxxdJrTsVDD9jP7MLOl3
         4TNjhrDoeY8BENYx6GtOt5Xc+/UXslzeTFuCSYOrtYBwo0ipni4AIGcxxf0+5Gk+zXWI
         PhTmuWvf9aBOhnXCXOh9Joz7wUBWvDIJCk/VR47DuHO/9rzbcJBQu0gPJ5WAe3D1XGjG
         f0xS4bdNZaxDQAEit3avljaNw9yEzArjRCTeQF0O3SXNh5LHnbCHrbgeZrMGqn7N+EKp
         g/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910658; x=1781515458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PaWjlNamJmHc6Vj5CnVtmPCxqilnzYjt6Rs02KkOq2k=;
        b=bv3L7XOArBZTyL/0a3TIqZT0ig7xH+Hw/32MqbY+a/JsmtSv+nShQntP3wko6N9HCS
         atPoAH129u7WOFWAepGJGs6dFF8eMWjcGVgVYhUHUlftpqr4irmd3KzpmmzExzuaF3ol
         nSA+w4o+Xxh39YVa9H7DVXxWqNN9b/pf3PosiUltrPTj8zdF3rpy6ujyx5KL2KxIFIUS
         4gjmQNl9c5AJnwAMov8lhk+ll3XO7mrnebVWLoU2TEHu/x8CZhNqj+fKoqfFtB96g5kF
         a8J9WjO+EV2x7B8rpjV7ZET3iHmPfL7jEailxTq/21bQMxrry2wHtni/V84S6C1n1b3N
         XuwA==
X-Forwarded-Encrypted: i=1; AFNElJ/jHNaKm0FYqPYMZ4Fd1oZJxAYmczkeailp54KgPrRxNPsmwDPnLS3K7fzbTGZeACHtBEE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaN2p2I3puCUNDtOR26iBOsmFKi2ZbF8ShKcGDfGheF0sf93kt
	Wa55laUyhZOisbAxf0YCpdRlfk+grZXt5R843n23bC586zV5lfu012ni
X-Gm-Gg: Acq92OExr+anZ082Qbk4hSf1rGOQ1x+QOa2ZiHSoToRZbDYZkLhFc01SCgwqe3LFnYc
	BDlPSE5/NcQmmih01RXKlH8i9GfdUI/QmNQIi4YXfxt6aeoqqTqTyEbTmQNgYV2Q67kv+jWvAUt
	LChGyCQhyvMNGxSjIpx+3z4xuFKARCRnOMyk+x13AoGFlIqxMUwqsU1ZI/NyA1W8Kgd5zOtPMs8
	l+M91F+d9Ew1foyuZswT0Qs33mZ1+tQuUB3QHb+7CAHHYNXvY36gvzZmPbNW83AOpLKPWxrXWmD
	K1VTwVJOLOy/4zu9kQpdAaqSyXgJcS1XuG0cEaPsUqgWfjJRBbW71+FiiDxoLMvH58dlEMePv1b
	KTpF7s5NxQ04CAvQAHUTcziz9dS3Gh4x350LkcCE9gvHvJSZ7M6MFDBj7eyaG1wYdhiGUSFUG+w
	IKClCrJ5sN42g4rPDaE36HYnvPlFVJXf1tuYFPwHJFZewfFWyQ9spHbrV94F51Z7R4FVizOhwDN
	6VPGi+tvei86PX8oi/LHiwCk0xzubVrXapM58Z82HonJVFl
X-Received: by 2002:a05:600c:468a:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490c2a2ea2fmr250385445e9.34.1780910658182;
        Mon, 08 Jun 2026 02:24:18 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm364812725e9.13.2026.06.08.02.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:24:17 -0700 (PDT)
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
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Mon,  8 Jun 2026 11:24:09 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780910435.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780910435.git.stefano.r@variscite.com>
References: <cover.1780910435.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

