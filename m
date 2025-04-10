Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692D62594
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 00:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246767; cv=none; b=W5PP1DRT587/qNwEUr5sPcGXZ9Po84SAjSk+VraXYO/CwIKlQ+04BRsgmtZTxDR1yRXGY5prilMqmBrV9C2U73TUbDduR6nUD5Ivxowagfk6d7sQC8g2UI3W7hbetdpMpVaziuG1aFNljAgbfPjTDbihuWbODklv8e//tFwKuE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246767; c=relaxed/simple;
	bh=n+nZ9BCxcvkMDMHsUavJJTtBrqhvcI6fc4cWqjw7f04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ggyzWgMReyDp0Grtkrdia2MVkQUcvSF8P7+PUKM9ybo33Pl2Bxpzci5UbwHRJI+GVQtAj4UBbNe7ybPbdLhZXnPbjUcZD+mDQVQh5mJSDv2pq65vsxfPhJ35oDLxxoZcaXkalLaBsmq0cdoFqzddYLMQEY0EuYNeZx+S2ff/0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHoLb8K5; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHoLb8K5"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c560c55bc1so31376685a.1
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 17:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246765; x=1744851565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kyPVB1rxXM0m//xddyhd4EsUDRcFjA3X1gP8LtL3Ps=;
        b=eHoLb8K5AwesQPbE7vTyB96By1tlGuHnxMOeLf+nWWMiLMag+zcye25x0bF6Rrk9Sw
         dpfIEFwLsYPAs9WtPUIm1wwrP9dX9EnWAUirNkKD27//udFDMVTmHUpD+/SVR4fowUGK
         O2xfREtUvqhDI+fgAGggxL0eXadFJq8ydgQ9uVrQj9RqZIQUmP+t5H4J7qfnEs9HweM+
         8y5uP7kP77I27csqe3R9cQlatJ7KzKCe5wl0Y4w2WahifUUc0v5TesVdUKEvTJ8qzvGg
         pj2h8oZ4cCMkyqASWXOl5faVchMHMl3or3UbhxyyhtGQla1XLOGVxDfKF+JcugyGroKE
         bm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246765; x=1744851565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kyPVB1rxXM0m//xddyhd4EsUDRcFjA3X1gP8LtL3Ps=;
        b=vd16/5AcVmk9CdJ/WXereFWP5mDmMGYtxzoG3Pj4D1VvXk54zTL0rw8ONAZtzx/uyA
         5ffmQVwbin+HV8tHdVf1JJP3svGqyDwZO7/cH2LAsZV2E9FszKQ1sSrUWP7/ZSb9ekbj
         zTBpvWmmXy2PshI/4jV37Z5Rr4RK0awn1+AWWhcSbgjacR0xFYm7yPfKEp1sahpASf7Y
         HsLU+wcT6YOvJ1tIp/MkN6oV/qOCKxSeJonvjmd5+/tY437tbhl22LH+XK+R2dIteJm4
         6U8johZ3EyM/7DKeyIJd5Zkf9uQQmBt2/NM5ya4ipdJrx/o9vYHMZfPMApoWXqafkmDW
         p1og==
X-Forwarded-Encrypted: i=1; AJvYcCVdP6M5brMEo0vvo91QjBmdJAUauQ9mNh9sIOqSdkJWYfPD+5ofSIEg2k8OP8QbMC30gdk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP0RM4VD04Ph424mnP0xcEHnaNqRe3zgs6WJaoFDxuSZzxJcAM
	Agpd0r1ytG9CniFAt88dQteyclt7UfPyaQzYIKKSWlHegbeZyg56
X-Gm-Gg: ASbGnctHWMZ/AfSjqbTgeWGcNNe+X0B64xvQKL5j3KkxXTfkgBKH6xVGmWRJKlVh16j
	AAKyjkO/SeiGLHO+k0WBQs/h9muOqbj1jfo7ofbmjld1JD3OGR98MNlW8lcW1FVYl3omIuCCY6x
	D+F7iUMMDy55gtuDtLJ71EBJpQCblsh78kYzpjawVCgXAXgdSQuE2Eup7uSVhrUiUEdKXrFdd/f
	BejbQSEIWaTqxAYXossyHFkmVFZfYeZu1UHo3u3cnnC/DLmiJxwniSUeGE89SQOhbPPg2fBlwPl
	UEAriShFhu343CevrkxuwQWhRVieZbJI6ykH0S7MSjplpaCWPjcBWzMK/SQNSxIsW+EqHaXrBh4
	GW2Lw4VC+fR/yP0I=
X-Google-Smtp-Source: AGHT+IE/6x1aCGCmhdtAA2IZ9Tq3qv3Y1gkoo0rM9bXUYtA375cdw94zz6Z3IyZoPnI/FmVsMxW2XA==
X-Received: by 2002:a05:620a:4550:b0:7c7:a543:d878 with SMTP id af79cd13be357-7c7a7654195mr115046085a.12.1744246765254;
        Wed, 09 Apr 2025 17:59:25 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:24 -0700 (PDT)
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
Subject: [PATCH 1/9] arm64: dts: imx8mm-beacon: Fix RTC capacitive load
Date: Wed,  9 Apr 2025 19:58:55 -0500
Message-ID: <20250410005912.118732-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although not noticeable when used every day, the RTC appears to drift
when left to sit over time.  This is due to the capacitive load
default being 7000, when the hardware is really using 12500.
Fixing this setting to fix the drift.

Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 62ed64663f49..9ba0cb89fa24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -233,6 +233,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1

