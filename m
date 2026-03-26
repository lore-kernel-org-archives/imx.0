Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C873402431
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540109; cv=none; b=RiByMBPWywP9V7d4/zyrSNWdPB3fOLzZhbmiXnrMmC61CkY2ZWXYiedcXMsfbnMufWtz/TW9X5n7nMgZPXVEbjVQtFwT4aQ+mlzvA+vBGCTBnQdx+KtDEhpCqOkiHQ0fIOMmg6doWyL2JJP15h5Ce5p+2VGodCkReXG0sdspWrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540109; c=relaxed/simple;
	bh=oBV5iKDKpEOL1t/HXBw1Hg18aSXy7dOvz7mlaIaJkss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETRMfZefwj8j5LxiIU2AylQ10APZcHpZLKkiVngboIX6lX5km+nqsMhQnFQNOQ2CTN2aobA9BXQu+0P9GOGvjaA6rL8nKKOAZtg3tFKMmgfUgeEpauXQ8Z11DcsIVZhWoNLOkxMC4xStzJsX0brZc0hePUpATTDZD6sqZlqnOdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eab1q8fV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eab1q8fV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b7c2788dso701321f8f.1
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774540106; x=1775144906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dI0wt5Oy0ocRxFiQlKWRud+Cipg15jZsGIOFf8LRYNk=;
        b=Eab1q8fVBWHrvUqvUX2i1W6qF7HWhIfpLCnYrL6Y1X0hO5vaYS/5wu8QJNMt9dIUxX
         IOn7zCwoFOeUV4d770wzNf/wgET6iAs+DHZJ1QD+60zQCCcr8ZMaty14Egi5TbNZ1Osn
         /PwxIIS8wmh+kB+OHfbURWhlfYSxwwsU6IVm+IV9bcpZhWb4loayjRrHipS9hZG8rf5Z
         qvu+dDTP7tZCD+aRdH5O8IDJ6R+zaEI+WcR60bSVZLtfnJwWGTkPBvx2KABre9beXpwI
         I+GPv4jNol2GxRsh1N2nnTIynCL5Bg9UiF+C8S2QxPWlT+v2mi7EfVDwRz9S0etsvVDX
         8DYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540106; x=1775144906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dI0wt5Oy0ocRxFiQlKWRud+Cipg15jZsGIOFf8LRYNk=;
        b=hr1NhiPzyMPmuGNYYmGseZgb+Ult6tq0jQtEeyQM9GsscYb3FhoeqHnCYs4/AVXNk9
         6KnLEGpiVz4YIe+PJBTEYLV06w3OXTDMtgcCuzfq1cKgHGsSpOYKw2QY2zbmu+jnU+EX
         J4fqMmqNH19P8KM216p6XojAD6wxBJklcWWarSklawZv2oGTBAsw1Gu0n6uhLBwpxlYB
         qxYlFhuUQFzX228ii4Z9JOjuJzMX5UAoNCMc/0pF5R0T5qDfjuHNDuGXsjMccGcY+6v2
         Hm58Y1y2JkXULeF+FjVwNK+4zeO7ySKiMhFwl5McZOx7eFmUR8ktb8ryA8s0Z/wGT3ay
         k7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWhUCe7808wgSjhf6c6epN+ODWHo7eO57HWIWTG1wRsYs0XTKRwx6EFZHfiWoBJBCW1sqU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWWAl18PhO0o7tzNFfsnx353c5t9uv0chgbQzob6CQ4g/59e5r
	/xMiUezZfeqVm9ZNr90Fpmch9F+9ECG7ZUK3zi6gClkliMKCWzezJ+gl
X-Gm-Gg: ATEYQzywReYrDyStcLyjfGnPVkro0NGyfBa7xsMyI3gbmYEGitHtVReXAuXsi+k/va/
	0ljSVyVTvmBjJN2/vlmT79Lt5OfcJ531oiB363+SsVmOGVfPRkZlBd5fcjyYyhTkyh58qy/0xuo
	7ObodavoamI8HIdsTTtS90R8ww755wmw53QhVTst8lLDzK5j4MKR0jz8fw3Pugw5ySbqm6N5TqR
	y2F9tft2hRSjSt7RBlVdz7gpp/H4KH4tPqkwb3Ppv4EZYsMFPP70DNLAH3e35eWGAzCF7mX+yqV
	vD+I2mM0QeF6YLzLphpvMoPYejM6VgFxZUhtRUL3Mspqt/hOVGllwp1v+KB03GZ9ECRrCKxDCbg
	w/8VJ0AQeycSZWuTFqQgkAh2oODHyZSoiWk16/+ctqEyzRU5pm4hWZ8zBFTFy1uAwSiARKNGyEA
	1YEiSbzlGxaXUCaYKP7rnJ8mDVLXvMhN3vl9/iu6yYjS1RzfJPs6msum1qzToE4P1f1xh+o7Uan
	TBu1/MVFY85S/t4jTiZ8GlKqxsWLmiXvFL31g==
X-Received: by 2002:a05:600c:c0cd:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-48716031822mr86372605e9.21.1774540106277;
        Thu, 26 Mar 2026 08:48:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942e52sm8831016f8f.9.2026.03.26.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:48:25 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
Date: Thu, 26 Mar 2026 16:47:17 +0100
Message-ID: <b7b243c9c3931e8d7ddd984b654e7ef493e84690.1774539301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774539301.git.stefano.r@variscite.com>
References: <cover.1774539301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX93 SoM and Variscite
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f64..77497a261fd5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1587,6 +1587,12 @@ properties:
           - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
           - const: fsl,imx91
 
+      - description: Variscite DART-MX93 based boards
+        items:
+          - const: variscite,var-dart-mx93-sonata # Variscite DART-MX93 on Sonata Development Board
+          - const: variscite,var-dart-mx93 # Variscite DART-MX93 SOM
+          - const: fsl,imx93
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3

