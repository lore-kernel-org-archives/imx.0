Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0973BBA05
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081946; cv=none; b=drU+/V462Vcx5B1+tafsCDoEyDJtV8r2S0Ky52IoZzkYJ96RITKP1Xs7wLcFCeMYiNYPeq9UQZ5wvZ5g53cuI6xz/Ifix3kEDyNE8UvfS45WBEKpyWsQrw703u4g11d29tQTSFF5PvVMHInk09pTJHGXgr0pZ7zyKnvMDo7Dmf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081946; c=relaxed/simple;
	bh=AeeAt8dBMzBxVI1NDMXxG38fbRWwtzredoQ8jRuC/iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFLVU8G074K1VFaQBVV9Q6T4sZC3t9vGck4STPgEJLlOf3PocDlOxbrWEQ3hh6y3LO8prYEwkQLCoUe6fjMHuIY89T8PebYZ/JiJQwth3IPfN3qP8iDEOyt2oV9Dkai8XB/sMarMcj88mLggW4TYTw7QA55s599m0IYoKIC3bvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDVjh++Z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDVjh++Z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ac10e337so54713155e9.3
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781081941; x=1781686741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQZhKoWaHBuz2lW2inQzfo2S49FUVl78W6tJ1Wh3VB8=;
        b=gDVjh++ZClRlgim/ZSebCZ6tcOFteRCt15XV6xZ2U6Tqjy9zCXVxmZVI+vXpqLvrA6
         +zTD5GDm7K90EZs7RCe0Nms74YZdEY0GbAMt5QCxwBzES7Bycy2n0tpX1QYRF9seBi7w
         TJ8hGzhRuOYa55COZst11onUCKrh8+pKaIStiPrs1mvAaosCI5qZQq9I/rwYyeaqdgwU
         sLoJOqf2EquyLcsp9nuvdAgsjBuMsjdKjw4z2XUVaY8txU4dQnFFw9PES3ujZfqDWX9g
         y02Dr2RNj8c+fYsdYsjBaE712aqy3iMWkbbVMwTapJE0oGHxa49ynQFPO6sQNS0iZ0kj
         LlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081941; x=1781686741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQZhKoWaHBuz2lW2inQzfo2S49FUVl78W6tJ1Wh3VB8=;
        b=Aa2p6uJqYoZUWRJlEOxfqh302MW8F7pJrhQIw6QT87DImHcU62S7lavaOfFDVIB5vu
         g4UQtle2K9UY7pPpnttYx+1pqq32RI50IJiP448yeiSYNhQZFJ9cw/eA86SlMu9CrGi3
         P6DcjF4Pg3jU2GWV/scSMFzzXELU5yOxrY0VxHgeUst30D2gxgzkVE2ucoWpKN6llt1q
         g/hswMgoANvSp+soLEe+FMzird8yK0tt7Wdbk5juua7ytGVjihk0Qw+7OPgYGMUUNBci
         vhaWVl6EnvFZODTgsq22oee4zMqFNh/Gk2XrNaFN+jot762Gj9j5PhECTU+00bo3iFRU
         jG7A==
X-Forwarded-Encrypted: i=1; AFNElJ+TannsZoLGrAgrCI2KcfWT7LvNR0WmFpgJeqbsLDmqeNqVIgHeXv0CderBGWgHvKE8gu8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAwfGSjH/oyAAhSzf5VKA1baWzkY79hwqiMPi7K4/Nlx+5hXg6
	d1I+DE4a4R3WjIVRwNMj25gDFOS0b8QWsE4y7gIjOJMOlbGqVhuXPwmE
X-Gm-Gg: Acq92OGEvxaplEpBszsxJ2aR4PyH/uljTgtfBX33ixJT8qblB7HmdMOia0o8zMyqpCv
	6UvNcdwuL0Wi+eUazEn2+5YHZF2pFjME1AP04aHTnf6HJ2K0HwdFnKd7DOHUW3J+bb7DaLkfjWS
	UNmAUs/Z4oqkHoKTmKIevPwf+bFOAFMpERP12kBz1KvQtUUo+fplM5qRB4dtPuIMlnFmcVqnwa3
	ydqjp/S1VWCQm3h/9ug2UaDpB9WOu0OGKcmfaHGoTx1pNm5kk2A0JP3k1fmmWge7HqpSb1nlnY/
	J/X1GdTEc67xgv4z0cn1kBCMAP4KnTExYomKXxRBxlcat93G9R58BaD7AvOOxWoTIpIWMNRF5tV
	t+W5yo2ticRrSHdHrfHdW7SAP8h+ziBhBlomM5XM0+Mdyrj2M0TEVfUggvE5Stb+M8m4OX2+gS1
	Kjyf/UFGV1eQRAo2GkX8RId2lMgSMaJE2TwSbAdUq9uPo8GI6PSb8Ddh8efSWnW6VrViFCmDP/n
	7IBMJAbuM6vKxNU5JstmcZBA6mBJ6hyeLuXEO7AlYkW5xsbAduTLJ3uJ6A=
X-Received: by 2002:a05:600c:8b6a:b0:490:688b:ece5 with SMTP id 5b1f17b1804b1-490c261b08fmr361705165e9.30.1781081940688;
        Wed, 10 Jun 2026 01:59:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm564088465e9.7.2026.06.10.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:59:00 -0700 (PDT)
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
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
Date: Wed, 10 Jun 2026 10:58:53 +0200
Message-ID: <a3355082aec3454f671b44e1f9a78000d2733470.1781024557.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781024557.git.stefano.r@variscite.com>
References: <cover.1781024557.git.stefano.r@variscite.com>
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

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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

