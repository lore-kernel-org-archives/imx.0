Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE521CC74
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739804278; cv=none; b=XyqqyiLg80SHSUYs5jeCdNIP1PUter9NNk2kstCDyegMAGhxb/CcfzQkqN96PdwuLM/VSEPfjGqLhXYfrCzW5v4Xwdd7FzbVzcxQsWsDO2jNCX7WPqDc7AyakxqjWKnzzUjyglFKf28L3r61eq1tyU9EwF2A3uj6ZOQq8rb3tTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739804278; c=relaxed/simple;
	bh=I1hO+jrBobkK6tDTAx37eg/nls81LVdsjmCxcnp9w90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sa7z4qz/atQ8MLUFUj92Nu2hkceHtIhLnxXJoP5jrQqYmCn9+3ETWJCej+3R0KZ1e3FgZZfLJG660NPUTLXIR4vRccsr4JgiB2JH+nOCJK5yUyd9M3WqP3Pj72VujF0Y3p6jt5s7WDkofB/tFflS3kYccl3ehxboAVkE+xhOkxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eColLu4+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eColLu4+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f378498c9so1741372f8f.1
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 06:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739804275; x=1740409075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih/+2A3WZbQ5wsR+LDXs5XUfJzJaHQlaqkNsPAr1kV4=;
        b=eColLu4+5tQTivN7GJZZbArcn6cu07rNzlZKHkIKInu9dc2xzFeNIyZJ7I3vFBMC60
         mSycFlRFDUqaha2zxMGfl8R6USi+hk+cvXWwQkUkEzSWMoHyuLbyNN5G0bnKZOVV3csr
         0ClM3MmgLhNswGU6QKzj8BHI90OjEo1CLyqu/Ir2XHIwVSkgoVkwy0/Uh8OxEPi06/sA
         b46sTEaeLdjVdVduza/rW9nmwteitDBFpcUx7TCejL9NJKaW394KU4izDdtyQUkcZJMU
         MaGvy7uQYG7qEU7IQbUvzFJiFvGTkpTfutpq+mKr8HRhWrVVYkMaz+WFb0287w/6Jkzd
         djOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804275; x=1740409075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ih/+2A3WZbQ5wsR+LDXs5XUfJzJaHQlaqkNsPAr1kV4=;
        b=uGOILUBHazd7d3QDzByzibTdypRtFCch5RlRXMGiq1IIV3/CEd+YLZ+Ojk2SLs5v5W
         +ji/dqpOdLtvbMXfs4WOv98/dpq8cHVpn+ARWEadUxtUA/DrmmifI/lNZ8CZv+mRRlxJ
         D6jF9dYpQCDmtRccOc7XSI67QzAdpt/lSRF89seofYry2EhIL9kV57tCpDJr+DaUsmAW
         CcHI/3ZiePA9Q7pzzIcKYoAgjo6Lat/vniKWkd1LcGT/Z33rMZK58eKzp9phxeBTYQJ9
         QnMnT25har/X3bBvUijtBfESWOflscJ4bMUtILNyuz8bpYoN2Kl8WQNpVDr6qfSQoVg5
         zBMg==
X-Forwarded-Encrypted: i=1; AJvYcCXGOSGB+nz0H9bYjMYtpqzZQFmLasi92f5M/3pYS0ZZOgdhndPKXTRgs8UjoIDt9saa964=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmKnJ3o+hYpOzHDUKp0gB11a/euZZIvRndJHIYpia42C2CeUM0
	+LkJ77WFjmHR6T+Gfe7/49XmdznabHUqNYNGOP1STIjlUa0wuC0+
X-Gm-Gg: ASbGncsav6LdXvX+0Ishe0Xz79POuY2VNr/5vTGSoMG1BuAu8CPllNgWEh0vvMFML9u
	QUE4ST8zXJxTJLGoYF6CrGdaeQW4hfJtL3WgjxDcUycXeUEhmxCcGjuiR9QYzd8hDcCQHG34x3O
	VOfYL1n3Yj/q+MtFMLQcWMZuohTfY+x3Gsss+d5rAI3PsNGKw4P0QKN+iPXPKqM+y3ukptTwI6C
	HAeKQ6rGbYR1dgn8JmVUKFsARMUywoYh1WnrbVAe8OqySTpeu+hF1oO3a5yHcX3b7BqBuJ71jNi
	ZTTMdP23GbSX+jfZfSKFZ3pex85cEcs=
X-Google-Smtp-Source: AGHT+IHjp5xkbSer+ukVA4n6fLYTh4A8nSLa3ksBu6rUSbaeoJGAAh6W2etq0RvQn+XBG68Y744nOw==
X-Received: by 2002:a5d:64e6:0:b0:38d:c9da:d0d7 with SMTP id ffacd0b85a97d-38f33f125ebmr8481928f8f.2.1739804274990;
        Mon, 17 Feb 2025 06:57:54 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:48e7:ac19:aeba:f677])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm12645020f8f.56.2025.02.17.06.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:57:54 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to sound card
Date: Mon, 17 Feb 2025 15:56:41 +0100
Message-ID: <20250217145744.179213-3-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217145744.179213-1-eichest@gmail.com>
References: <20250217145744.179213-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The simple-audio-card's microphone widget currently connects to the
headphone jack. Routing the microphone input to the microphone jack
allows for independent operation of the microphone and headphones.

This resolves the following boot-time kernel log message, which
indicated a conflict when the microphone and headphone functions were
not separated:
  debugfs: File 'Headphone Jack' in directory 'dapm' already present!

Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
index ce20de2598054..3d0b149681310 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
@@ -16,10 +16,10 @@ sound_card: sound-card {
 			"Headphone Jack", "HPOUTR",
 			"IN2L", "Line In Jack",
 			"IN2R", "Line In Jack",
-			"Headphone Jack", "MICBIAS",
-			"IN1L", "Headphone Jack";
+			"Microphone Jack", "MICBIAS",
+			"IN1L", "Microphone Jack";
 		simple-audio-card,widgets =
-			"Microphone", "Headphone Jack",
+			"Microphone", "Microphone Jack",
 			"Headphone", "Headphone Jack",
 			"Line", "Line In Jack";
 
-- 
2.45.2

