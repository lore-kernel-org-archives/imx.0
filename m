Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891F2376EF
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455292; cv=none; b=JpOW+o6obDVHRVcG+JuDTO0oP3DYlQ0nqxwAWokypRz38iBYS8G8olsyiT8TCAU2vWJlVC3i4aP4ks1lAOLReqoCm+FfFNXm5KgSIjhwOKXJ5o2fXmY9H0af1+I+QQKDY9Ko7Y5nD1NeIbSOMmzPx3FD2KBj7plet+oFADbLXUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455292; c=relaxed/simple;
	bh=JZcPrmMT5XJkv0+F82G6GQ0CgzHmHpYaIi6+hrUGM9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUItEEM8Ej4Jmg/RG8qo4UWY5E6zd2d4bRoIDax5S6vi+ZzATQQrOt8eBe8S884pufBD7dQLjsNVvj3OCXsgy8c2bEdyXEq62TdWUnEeRv84uWxmTD6M0HPr4q2EXo/gOOHNJLVrV9THg5/BHiWbMa+2Yv8rnm/mwMDnkN9HnzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HygtWGK9; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HygtWGK9"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3dda399db09so23616545ab.3
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 14:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750455290; x=1751060090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bV4/erAwfXPlPi2hHxXtxfl2Kz2FSJD4cbVQEOlp7w=;
        b=HygtWGK9gKyiY9NDQpl/wGmyCXshjeFvmcXLcjtzYbAKXXRx42I1hm1i3BkxCW5U89
         PlMpFbhrbKCBKwZ2m1MBghY+EX0Ratl4juyvK++yhrxyzn0a1tGFZApw+aVYwdZHogCN
         cb2Qr+yQucZk1R7CNqDR8poQ3TxJc7n51omqr8K+ogYAFMsTL+FYkpmiiPtpql8D0X7x
         nRn5Kd20DdjS4brIVnNU7w++R8erfqEkp0kjd0ei5R+gUt9gjDPVbsEPcyOshGga4viG
         aUb4f3oMCLmXUD5obwxPD0gOLfI+ARw2HrueDklMQVIG1lKQcnEWNeaTz+xppjPtubAd
         8rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455290; x=1751060090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bV4/erAwfXPlPi2hHxXtxfl2Kz2FSJD4cbVQEOlp7w=;
        b=SnUu6I2q5rsrMVpHGV+9TczxxODZChxZdbWmsvs6N8+otGcd6TohTtXLx04ECPq/ch
         b5LpdG1M3DIgKBe8XaoaN7fnzf0f7HQmXlVvQumEA9TvyQUEcCYPjJGExbRunvE+Yox/
         TNilgpAv9noJgr0/KtXyncS5sHWHU27GgxGVRmyLkAREaE6HJ/pW84YxblwEuX/eR1Y3
         JAmHAhsLS6gI1M7jIcSvk34L0qknRbZejFl3EzxNqwVl5JGMKp3LQ+KiytZLTBKKTJI9
         +pLL8I40Ld6aYhq0Xkfwoekm3jwnOSHjIflbt/UXMFHOifiwSBMS9/5gTcQQgChcWdKs
         OtFg==
X-Forwarded-Encrypted: i=1; AJvYcCV9o8ChzSVtJ+OEjj/f48a0CgwTl+nFITWuVePkZgMYh2eisya5HHpXfHOrs6FhgYTesM8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyFnWaA6l1ijFCHpj6mPfRpaBEYGXTM6rJMope4VIjS7pJyrOd
	5OH4V7cdyM1LXCJ6jO/E/dIPZ7Clx1Im3lKQWMtxnH5Q2VtvXbiKDy84
X-Gm-Gg: ASbGncv/5+lIHhldyJeQ08iKc+18GUOgzHUOCEWQWzKCFM+myHxhLbD6AAMcqjh5kMw
	vBxyeNMXs18DGfKtWvffPvTKaNkb3BkQzkeFdemqA1WGnJ6VfNbQ51VHXdXPsDP6CHoDDPnODRq
	AYtI+eYpM1SRxujlLpqe5/KFtwpH+HxMt78DR+1MEF4KJWaF4DfJLvLVUZvz9IHQpjkje7lDaF7
	RY8zK7u8/90BS8fu28/3I8mJkJJEhIoJS1l9jFRKfXjv6oQ7A0gPRz7YwxIO87crD5EMx+o4A2l
	uXqHSxrCP3RlS6fSrupx8UlAXLoY0VEfFyB9ME7MmyjFo8rI7wf8bT/LH+kp8/FOanXa4/NfoN3
	yHt50rHifXbvBb3oY/m+pGdoHWWiYy2b3X3Zb
X-Google-Smtp-Source: AGHT+IFXCoHIdC1hxKQ8Wh2O6ePURz9GDmLlEmjUZKSPhjqSp4Y9n5TQYb99KGPA9gmaBHSnoG7uqw==
X-Received: by 2002:a05:6e02:228e:b0:3dc:87c7:a5a6 with SMTP id e9e14a558f8ab-3de38c1e68cmr54940105ab.4.1750455290137;
        Fri, 20 Jun 2025 14:34:50 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019e0d03e7sm546707173.139.2025.06.20.14.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:34:49 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
Date: Fri, 20 Jun 2025 16:34:45 -0500
Message-ID: <20250620213447.56392-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reference manual for the i.MX8MM states the clock rate in
MMC mode is 1/2 of the input clock, therefore to properly run
at HS400 rates, the input clock must be 400MHz to operate at
200MHz.  Currently the clock is set to 200MHz which is half the
rate it should be, so the throughput is half of what it should be
for HS400 operation.

Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 21bcd82fd092..8287a7f66ed3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -294,6 +294,8 @@ &usdhc3 {
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	assigned-clocks = <&clk IMX8MM_CLK_USDHC3>;
+	assigned-clock-rates = <400000000>;
 	bus-width = <8>;
 	non-removable;
 	status = "okay";
-- 
2.48.1

