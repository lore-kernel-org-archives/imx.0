Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99ED1805E
	for <imx@lists.linux.dev>; Sun, 21 Sep 2025 23:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758497751; cv=none; b=TU9GAyB5RVoQ4xaUsAiOXEBOouSNe3n/OCx+lYdMDT0RGYaYKSwtp1PNvPfIocpBPq0div8H2aIrnuB4j/sI6yGFH6AGElngeeyvkBIe4kcoYG1zsoV/7I8SCpgGQWYRd4J2dnrnBrfS2bsd5e+V+DhSIFVFT7caKdV+t3SB+54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758497751; c=relaxed/simple;
	bh=j8OaHWrjT9UQ/r4y3qiFko5WnsxDSsFubeziXVztAQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g9ZDxtg7xvAQCf8Wlo4g2qRGjbWlbNuyZlgAY2+Iq2JYRKnQzH+SzLTUd49fPhOks+kopHOY66BCxWlO8GPJRuSBAmPxqbXcJqLOyPVVcYAD4ciPoii1LW62T50m4RB9VKgQbZE+Tg5YRa0abi9p4Rd8G2VJawMmtllj6cj8NAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct5ppRc1; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct5ppRc1"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4c794491480so12087711cf.3
        for <imx@lists.linux.dev>; Sun, 21 Sep 2025 16:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758497749; x=1759102549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CZN69W5Mtb3V8lrpdaa/KxTeb9Pg1cBMFpA8nrb6jkM=;
        b=ct5ppRc1u01q9uLyjI529huDcisp21G+EVH0uq6rO3W6I7qfa7oJTS75+TgiVWztha
         HqtSFqLqr57o1QGwhoK5KPkuIhP97wQtPbS/HrbiOQ3inwEuAtvHHMIuOjP9yEh8HyIZ
         bf0OeLM9u/WmCMTEhBDoOXbE+RkTb57NoDLooxY2zFP/W8968DV0sp/3litiDnb/xal2
         lTuxkVMuPGaq4xCjcg4VTGxRY8DesvAUx28uZK44U06l5M720h2ervjyeHsOVcV7Wog+
         D4njk8VqrbJhVjjuLHTCTtI9ceamupmKgSoZCfvj/NhCZE1gwVfIevMDIv5JYtM3q4sf
         l/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758497749; x=1759102549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZN69W5Mtb3V8lrpdaa/KxTeb9Pg1cBMFpA8nrb6jkM=;
        b=tfZbmqD1117GtDlGoSQL1mGBp9c8n2H0avOTXkj+w0NrDHumxfQbM0trHnnusdvOKP
         CR1MBQZR0aULkEP4AsYeDdD4c+6N4FfMEnqVLLijAanDzOv9gApvySkVIEQ7d89tD4A3
         v+iNgld/UwyyoiaAhZL1RuhnruJfflTWfX3nr5J1afMYVWwBoWt5U5cX59qSQ0ROG5Ly
         q+nmgKHUJSeUs0K9wj0FMOi0ZYKBGYP+u3arn1RIdQkyEQ+X87iGVVMg99RsDSQfxRk+
         gU+8msYPzRXWHmGWBa9rcLp9dO3qYTQ6rTBjL3hLzQvw3BSUdIRaOsxB/pON1MnmpEXE
         GjPA==
X-Forwarded-Encrypted: i=1; AJvYcCV/B0nSNiGqvGVUyFNlmT5I1wYp2M8zlbRdwH1aw96buECsjh9Nw5CFq8AtFrYylJgCjaY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcdYoKUejitBDwa7KVWj2sCeZpzSSiJJSxmlKa3jzgBaRQXpzI
	tzp3zxZUnop7Yg5jwp7wGbfUfrMBGnFJSfTIoc1gHH9P6DCyjaD34/8D
X-Gm-Gg: ASbGncv78Y0qLj035EbOJhl2HuhTMQcq256mRtF1DtBofQ3ZAdF74vmI2b/RFy4ByrW
	lJldzDB7iu/3pM7xIqSnGYpCSG8iRKFXozvqO1qPlbP8D3ns8MJIlIDaWy7RA38Rp8w4cVWQWFI
	9Y8piM3Mw6RhFTQZmqXjztHe1sxMf5v8zlXKBzNM3Mn3LVxfRRqdfwUByu8HViKVJUsLxghpksM
	r52vQm7PXZkwpjV5ukKv0hjTlnVExWSZuykYTklMhq2J1jjvSHA0Xt2LdOaUDI5mOoxtm9jFhFs
	dcZpmE1QgLcy8rGaTrflLf2su0m+dVQG2gpIE+yuCmnQCChI9AP3SkiA57qwCYYKQjD2NR7Nczo
	cULRCYRN7XxMhGvaWf7v0PAy2QBk8Cb1VAR3jN2Hy
X-Google-Smtp-Source: AGHT+IEuX/rG6D8K1mfoAz2r7noBHe6o05XMZUMyqXmXpDmWRhPab5YZzhU8CSDkzsIHOEEXRhXr9A==
X-Received: by 2002:a05:622a:1103:b0:4b7:929a:2e49 with SMTP id d75a77b69052e-4c06e3fa3f6mr142548381cf.21.1758497748814;
        Sun, 21 Sep 2025 16:35:48 -0700 (PDT)
Received: from rogerio-laptop.home ([184.148.194.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83631a8095esm725949085a.49.2025.09.21.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 16:35:48 -0700 (PDT)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: xiaofeng.wei@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Sun, 21 Sep 2025 19:35:33 -0400
Message-Id: <20250921233534.838680-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree compatible string for the i.MX8MP FRDM board.

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---

No changes in v2

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..8bddf1f8a78d 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1

