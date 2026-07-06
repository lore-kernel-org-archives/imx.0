Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1974E3764
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330510; cv=none; b=uiZmYqQGEumLTH9Ton9lS4zw3zi94eC7FCpz3+4lZfoBI2TU+rZ8FO0So5yim1QW4EEjRWe/1Gy0BYWm+oyc189rRoalNE/Ha+Z/5dh3d6fekEmEGXgLfAvt0Cg3qUJeEToSbpAXbYXQlUbPIiEuGpng+AbbdDE9zpjfMvWyoxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330510; c=relaxed/simple;
	bh=BSoZzBqEeloYctNTcEnE5HNwheDgAkV8kpFCbDHhNn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIcsma4yoXH7y7nntxQoELUYITiE9rFcuHLiXDk+bJq3FfHLE9PoBHlp9mFo4dTmtSBaVqs3thx3ZsYQvaaUGOVM+YN9cDTAiOGS9nt+t48r0erAj4L4+uwuYcFPBEXCsihyVqlEuo0lhWUObl4N/zd1OQODzbo4boR2QQZEEFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7OhoDJm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7OhoDJm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so13890785e9.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330500; x=1783935300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5OUaRVSK9v3Or+26Jr9fP4R8ZWbrsc7QBpjXQ57SjM=;
        b=M7OhoDJmP0DLmKxAacMEvuhR3bWIisByXdkbmJ0v0saXeH7Vh5BvI175aOaUQzMYiC
         9ZGhenk0ph9NpIC0vFEvXOP4ZDpH/ilhAFSrYQF7Y8iGkL8t67rK56v4CmN4BAAjRtTW
         cUiSHUKRWEGPmciFlW9iY3MGjpZ2kgq3o5UjYe5rGyvX2HnLmjGFzfgoYOi02d7l46gd
         lHtca5+nvx8k39uc2U1Uy3yjl7ZVev0Cpp8ZVExKeSR9yK3Of6f6rxyFMQ8QgFZsQ38U
         OLaqc/TNOGVjhH+BPa1R/57Suf0CoIsG4/nqUcgChwEtzCxBIq7W+PWMh1aNNIg5NDmW
         V1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330500; x=1783935300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5OUaRVSK9v3Or+26Jr9fP4R8ZWbrsc7QBpjXQ57SjM=;
        b=olC82Jpww1TfDlYU1tgAg19/evGp/VbIHTcw9f3L47SeLFhLlx1e5u2YopwVLhbmWw
         f311K4Rybzo8opantIK16cpkxAfQ3G44EhlTf2noOHfHDkC05XBcG2x/REzVsexHs5T+
         Wa1lxprSHsLknCqPhXTNh56K1G3hYtXnsooI/GtWj09LdAXO97NFbpT0pes+IEEEZZO8
         I8HX4H9XrfGzVKF9vD4Q0e+DjN4yPHGfbPa/UL6ciH1ueAt/vfDIn9EAMEhNF/5/EuQK
         p4QIYJjsp2DRtbhPjNWiKrAQj+vb567cvk0VIaPUbyGBX6ucG9MNDgkfgsZFHHxOdkEL
         Exow==
X-Forwarded-Encrypted: i=1; AHgh+RqY7WCa8VqBDoszxobZC961KQ2MevgfPjSXHZ8doTdM2cfQqxo5PtiwsoCq8rAR4O5xvd4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0/QTXPfTzWaKIdf6K2n8HN71MY0FCrNOdVVGnDtdpo30YDmvK
	74uHS/DFr6qknvO9EJtZJ8XH44Jwo09+DYYR1GSjEp4fo9ivZ1Mtjd9U90vEsw==
X-Gm-Gg: AfdE7cmsGFLB39O4jfUn8zwDmBiror085u6qGjW1qbeyRHmjWH0+E8DhVxtYdPoL8gR
	/bYBV3FwzI7WkQNWfX4jPD57fxO5iYOGSFlPTZJNcFtxYWWF3tqhWgCthyGLiIctaLfr7ADMEH3
	wv4L524EikX1I7dRTTroYGH+mIbWjIzbcKFFMZxlUxUVXXyS9Q16AaUUYt0lgVPjiDgXXUDDCUO
	qRViTPQk/iyMDG/jL46uF8+zg9MjpKlLEsvqsp/M6LzTbHxBHZAZq2lO3ZVdwAs8mtmpBK2WiQM
	gM0qyLznIZugd8HzMAISSQaRkiudy8Gq62PardZFA1jZDXsclJnO62wtbY4jBJ3fJCH5QlPiC7H
	oBlJ/eE+pZsiVAMbvdTi3kMyEtKwKvkqXy7nTgxkQCokXDgy9yTVTyXj+55wHqSUAB8gTeVYVIw
	QRi37qXNhyhouoUx7QBKmFHpmHgOImQ07fVOZAzxkSgA/R8y3e2z8ggt2GnoUI541IkqnukKz6s
	FoT1s91GLr/WEGUBKZJAug1KQ==
X-Received: by 2002:a05:600c:4ece:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-493d11f030emr111490185e9.18.1783330500022;
        Mon, 06 Jul 2026 02:35:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 08/15] arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
Date: Mon,  6 Jul 2026 11:34:38 +0200
Message-ID: <c9696914817c7e9290de7c1d9f588632e700f478.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard USB connector.

The complete USB OTG description, including the Type-C role switch
configuration, is already provided by the Symphony carrier board device
tree. Remove the duplicate USB OTG node from the SOM dtsi to avoid
describing the same hardware in two places.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 5d8cd8c13633..7a4c7455a162 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -365,12 +365,6 @@ &uart2 {
 	status = "okay";
 };
 
-&usbotg1 {
-	dr_mode = "otg";
-	usb-role-switch;
-	status = "okay";
-};
-
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
-- 
2.47.3

