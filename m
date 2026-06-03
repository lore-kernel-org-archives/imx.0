Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3C642188B
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475112; cv=none; b=dz/Jf2l4i+d4S81EtqoOfp3S07FlmLTeKmL1UMS4s07RYa6jSNZhYdG1txR49fosJKbT+1nmOQYoBGioBKfbKeWTBIeiMrifI4L5YUOVetL28l5C5valWDyszdWAYLywVWda5Ju9y+3iOyIcEgakjcaJNgsWUheJccOOPAM+krc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475112; c=relaxed/simple;
	bh=VYwzH4XdiKHvxjnXr7YQady8HCkkBmaZVHex/S+NpyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmNr5rAa1HGbOGZpceCjze1j/6uVNjZUsWsT9HyW3tUogx3N5Au9pakPAwiK4n+rV+dQGPyemyTSQg/5E5QA+QbfkgAPL8/W7v6uFzbQyXieMDqpqC2JUDEX4lANlFOehQTWA5oDRbkE521uG13WDQTMwODuVWLce2tcfzjPXy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBEoh2tD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBEoh2tD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so3892544f8f.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 01:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475110; x=1781079910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxV53FKG4HWP7RwRAnssIRH6mwl9ZfX/I+1CZeHHk4Y=;
        b=GBEoh2tDHXSOyxgUeaqC248m4FHDGS+4wFObqNB9ocBMIcBj2nDweczL9kOIB/CBPC
         wPa0LNgQ1LZc4c8FbqgfRVfjn0EMbZKKXe5GpvBpMm4O2Drx6uRKemi8TalxKbtdfDXU
         0lJVCogVQmmBzj7JLTm/GBtjEq/IAoyfFoV2uvmWsc5GWoAq2DeTJvVEt7UERQrPqn5j
         FTOuvGjXThgy/WWdbI6c7yOJooy7HNeH4l5jeqs4vid1MzrfrrzIEuHkYsKJ79Oaus1k
         DbGpCkfFanCm05I2x7A35T+UOyDfIWCPQN37/h2OOj2dsotCHpKyPAR0KihcHIZ7y/kN
         O/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475110; x=1781079910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OxV53FKG4HWP7RwRAnssIRH6mwl9ZfX/I+1CZeHHk4Y=;
        b=qB1MNafN6PyjKdLNg2TsDeBaSZwQd1xXCGNxBOtqD2Lys5A2hldi6ovrHRJmiE7Yd2
         uytXntddeFryalTwpxf0rzWqBzKzcVLvRF/u6YoaEMHcBvXAsEuR/5NDLymVhY+OWPdN
         t7TIkOy7rKlqKQHX0CpOWD0Fo7H7P8ccx26E3AO9T14v28h/5v3Q8Y9Bj1BUvy5fHRW0
         f+AsQinDtIwU+GrQWWvCEXkpHETnLkn3VXGnWf5J6BNUZhSJTJRCoObzlkl6kPf/F8dH
         45Uy7mfTT6jZZILG5Eml0xlS7aB/ajLDaXkvDulzNU106obYinIBiC6Nk+AK4a3ryG7z
         UTag==
X-Forwarded-Encrypted: i=1; AFNElJ9GdT+fyOc/HK7mWZMe3v8P72OHKm3/KkinCibcfw2Tvhq/w1Z4RL5AoUH4ICIxJwBcTdI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywte7s79plGql7mE3SYlAvfOKCiwwqctMUrldTdil7m03S/LuQ8
	SlUHDErw6duyJWrTSk2DF50avzubstGfwqW7w7R3thAXBdflRah1i5VB
X-Gm-Gg: Acq92OE9PdvavUxVIATuE5NLUIXkA35LvRmeOjqBwlliPgsvWwFoXB3KMFw6zp7LjzG
	05tAlMXkBeXvErvZdRWSfXcNwFhoW+ooDnE3bxIT52EAawmzkGKq5Z85xA/iL5xz80c4J7EVWCe
	tOu8iA9uUlnLkV+yzb0QlRpEZpXvKPSJF96BDpqaSBlO1W+KF3tJ0FkiXbl+05Ft6gNwQXIy6It
	9+9YRqV7WsUyugEEMPW2bLRW5NA5/FnidxQSt94GA+aY/4rpEs7BOGkT/h7QWdcF4h7yyie2VoB
	5Itk9elbqulvpZVdUr+xGDhYDCd3m8R0YzFR4dlUHKKwp1/njHo1K+69cvxeUAb2pN+yizYd+A7
	OjVK1PFUP3gk4sTp81r3jnZntk3y8+IDGw5D6fQnMQG1+Z/HKH7sLmsZ48dwxJMC0Vbl2QXLnUs
	wAWxD5qP0xEtSTnsO2o5VChjJXzyq5e74++r1WELIDGd2RTlKPb7ePx9H7e0udNTTx9RZDKRs0O
	PcFNU4Lfw8ncX26ByfNrgxjZXvAoL18XpUHBwJGK4TJFYrwmEm0lHbKmQs=
X-Received: by 2002:a05:600c:1392:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-490b5e8cb8amr34882915e9.10.1780475109767;
        Wed, 03 Jun 2026 01:25:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:09 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 3/5] arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 10:25:02 +0200
Message-ID: <0a3e17a7497616a1f83159b98a8e5ffa429f0acd.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 77377127c18c..c835394468ef 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -215,6 +215,14 @@ pcal6408: gpio@21 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		status = "okay";
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

