Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB83D2236F6
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739804278; cv=none; b=Z0Os7mBaY5csmylcOkgKlQbvqPd2Ad3BuFuu4ULgCIn2uaYlIKHX5pVelv9SnWJq6HSFHqBJHvXxyikEjZhiBMc7MzJPqlJjHgz2ahJ0+ER/29koobE09OkunnWDWXQFLWtB9y2hXODCyCcXi15NlSJSSTvMJEEKd0/C29Ogfj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739804278; c=relaxed/simple;
	bh=3xUxJBnNR34hA0dS2K5KCNKLuezaW5408mwlrKn6eAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUrDlYcpTgKRlL2PyhCtp5nIFG0FGaSdvtT65XdOCL7fcvSDOXay+gTaoAOwBOmBAamQlZzHXWbJnPQ1F51ejSnD1Gpc/BAl95JwmAH1e8MMmkXWfP1juIM+bnWljEf9bKw3yIu2MixCHOXVnm+Y7RfUbgNi5DRF9mJ0Qg9yZLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQmZSZym; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQmZSZym"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso48631515e9.3
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 06:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739804274; x=1740409074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPzjBHrzzVCbUkGlqURX2pauy/TIgkOkpaFezU8RL+8=;
        b=OQmZSZymzl6QY+mjil8GAG3s/3Mxdl7Pjk7eLhJRFizBHSF+Mlddk0vF+P74jJXkq4
         /ZCw4SioLe8EIQ5EvcwnM7VhpbvhUoMuhsuT5VS2lmF61QtQXK7KwwweivIJckRssQMa
         NfB/yzLu6IMfVsUvhRbauf4LKFJYPrfQ9NQHtH386LUbDx7icGdemLo2/Shc2rfExV9U
         yE0izo2pCQ9/Ss18rzWbp9EJmpUg2DanSjknFryrITW64y4hw7KeWpiwZ7Gu07+aZSii
         SE6GbdjfD3gg3WLW5WDhl0DZD7iVodjR3PFSzVrhpyxmec6r9IzVk/cnXCjwJoyAiT7G
         VjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804274; x=1740409074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPzjBHrzzVCbUkGlqURX2pauy/TIgkOkpaFezU8RL+8=;
        b=YophrVa5C0mKa0CLDWHJcQnZ+eP8pBJQtU7kNe5ICZyF5jBAFVX3RrE09WL/TPPxDS
         UsWoWqMpKuJe3PODAMiFAX4h5DaX1LuvNpuVcn3mzzjdjXBgZhlw86CoqqhNyb0Um1na
         EpnATyODktBGQ4KdANY2+i3yyoDfNzN+5WvO6Zy1cxRnGVkryc88aj2FLC1tdB9k5asw
         JI1XihiFYoooFqO8f4N0/fGo5/6Z8Q+n6cfEEMy8g8nlHWs0h8mk14+gMPc3EHZ9piKV
         tb3dDThYQJbWjX0tnc0CtzFI+xwOT1dme95VmPk4zITuHukzXsFfKhtnxJO4y4xFH+RX
         fVyw==
X-Forwarded-Encrypted: i=1; AJvYcCV9ujHTkBiA9EOEjut0cplwJkUOoN6t6Z9cQGWeKJzPmrEN8IPxBavUzunvmKOoIxMJVGY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYkX/P2ZkamUzC7wUedD/oe61Q7Pdpgej3ASOaE9Ok200i1pfc
	ANgcvKxjCngGc70ErUESpg7loz10fHw8e8YxGO7ZcB42GOo/6x4U
X-Gm-Gg: ASbGncvbVHPyQvulIieLecBXi2+e/+vJ4GcgQrnSSmxGL60Yd7l8lSeLRjOdxbMCrK1
	IZtEyNDH3mFe1HJN6SrJdlxBAXJ28Cp0HaX8BncKVUNBbbqiRBSYqiawM4XeaYc+nZ/fwYAkMV9
	4OGMcdPpRej2wNypz8MmVm6tfUEJvMA0fQVff6TgqFyQAvLW5u8aEST9iRrgELaz+CxN7xZgQJ2
	8ulP9BjZFKip/Ht/WF+G8Y1oVR4VxM18vaXGkxlzf5DzNo3zjSU2idkzUIGQBPPISXPnc4KdUeh
	Aaz033D4IF2S5c+1GgsZgnYDfdkX6ho=
X-Google-Smtp-Source: AGHT+IGK7+cIXXgIKkuykxAfls8SaqI808N2jXSNqI/UIxUmdRXsLloVYzsBEB3YjD9VWOD/Jw0UYA==
X-Received: by 2002:a5d:438c:0:b0:38f:2856:7dc4 with SMTP id ffacd0b85a97d-38f33f62c72mr8242324f8f.55.1739804274078;
        Mon, 17 Feb 2025 06:57:54 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:48e7:ac19:aeba:f677])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm12645020f8f.56.2025.02.17.06.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:57:53 -0800 (PST)
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
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx8mp-verdin-dahlia: add Microphone Jack to sound card
Date: Mon, 17 Feb 2025 15:56:40 +0100
Message-ID: <20250217145744.179213-2-eichest@gmail.com>
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

Fixes: 874958916844 ("arm64: dts: freescale: verdin-imx8mp: dahlia: add sound card")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index da8902c5f7e5b..1493319aa748d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -28,10 +28,10 @@ sound {
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

