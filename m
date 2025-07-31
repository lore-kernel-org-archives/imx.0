Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD662D3EC1
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 14:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753970527; cv=none; b=MXj3mQacM47gIH641jfSj9DKByJRhK0Bq79nZYuj0fSYvV08Vpb4Qs7Zs+jgqrjqoh2DUveBILBjE/NzL4yARBQIEcX5qZK9RQBmbUsnSgmDmfhoYYMfI3Hcj5nLQO0W50uXFYaZRYUMEHspM0/AFfvI8fe/24TwXY7gnANo9R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753970527; c=relaxed/simple;
	bh=kidXAy0mvcs3fegsiwVQUUCUIiIdfC0KACC45Gf8Baw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BeUuNxhUC97/XK3maySsk9TMfcvyYAhAt7mZmsrA+nv5y2UmpDPR8+ssx5uYl7fV6K5BZBxFv5LGktE28b1zXL8hg9xPeB15dwqWMITpb4+sp6lBlI1W2MeM1fE2FS1wE9OeH9b9kVjtqZ3yHDBDPj+zFpEfznnzc3cQzvlTSis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KXhCeAkN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXhCeAkN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-456108bf94bso5995965e9.0
        for <imx@lists.linux.dev>; Thu, 31 Jul 2025 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970524; x=1754575324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIjCGhz8tLixz44uwO4xKNvBCCKp5RNzQO4yWFCNcHo=;
        b=KXhCeAkNa0DdBlyt0FlmrDVtuhOygezV1fMc3ekmqZdewAPfBUEWJc02tgqa2dVq2l
         /qzA3ZFcyF5Gh5LCHoxLWdveYHudRpSCZj62TFS3W5K/zNaWP4GOgOtIyex3PRkGNlpV
         vpHpm3zI2M+c9JB/B8Qn1XdkqXibockHgtwVIM0qB3bIUkKrtPm435l74jXw6ZwY5HbS
         pAzqzSn47gTFlA9HkscZcPR7oquA1h2SYq4O+s9QUYrW4o4TOEj9/5cQXFn27DvWAVTM
         5pT0I8uEpEjlMRvEmu0RhFOon8CdQF+0lRd8+k9rh8tFcxsKi8fRkjFG/V7nhjU5qVNk
         c8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970524; x=1754575324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIjCGhz8tLixz44uwO4xKNvBCCKp5RNzQO4yWFCNcHo=;
        b=UbglSky8W8lGgr90j1nA0NN7C20YuqyjFgC/KQNLMD70p/AGzOR8iePEFRmDWlcbo5
         65rwdFpfKmoCGdSJxFWQRw7wqGfClqM88my/m7Kwx76LZo4QS8YjaY+tnwLbrzvwmUbf
         Ae7cdHtZ4c7JNv+NQM9smRHnwVHpq9+r2Z7VgrJpCCyjVrO7Tzw7uS4cokXikfZUZ4Dt
         Ww73BMKm/ouK+4bqj0X3+qZ+XD8DnplZf+NiTDeEb5oGnQJelCQNA9lLHPY6gZR1oHg2
         PHGl7ANLsY2/jrrED45hYTv1ydP5SE91u6P9BU+YV0WHRULYW+qAOfGwmo+V469W/g7h
         5Pfg==
X-Forwarded-Encrypted: i=1; AJvYcCVZdyvSEGLXXRQ1VRxmCJQdKAc61GpRYQmfr/pf6vKrwxFayFFEb+0ppupOvKK8HlR6u2s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEcGTMkr1P/yEUV2IR7oFnwkwJf8tpAmR3peisS1dDn9cl4/FE
	78LpeOe01f1c+GH85pqvxXqWQX3TcCHjNfFpGVwt0QuQ3CGrJbD8XIuC+UJUqeX/h7k=
X-Gm-Gg: ASbGncvSFTGcHMXqhS54vv/vvmYEYLwYAqvcItiHdQacg5WOakItGS0mjB+HQ1uejT8
	TaXcKMMuq9G8TYeFjU1Br5iv8mE45vP1vbuCZzW6GdLFY4axJx/D6WiI6Zc0eLwTr14yoCcRA40
	Qq7R9h/yUNAHSxBjMCYhdGNdd5sXEmZsco7WqReZtfsw9YfquWkWZ3Xwfytfo80xtmUIOFNPQ2k
	OGUSf6QZbYvyooXYUeqEhEWFOAGfac03gBzlZcUrDfMvXywd4Sm2VeBMDiIb41LV6zVo8AnOZLa
	q1jhukEfzFUgP2V1kkIt8vY+/n/7HIGUYpkP0bMD+htXgFa2R5PyhnW3by337z+Kr85avyJdw+u
	LcDe4QFNguVXCpEm0mg2MjW8RHjMS86KTDdbWMox6o368MjSKOztt0c0NEgg=
X-Google-Smtp-Source: AGHT+IG/HsPKeTgglpnFos4WwXnhrkZuA5HfDzh0mWx5wGuKVHOsX/A/E/TRT6CmAsPxomm8vH7Xvg==
X-Received: by 2002:a05:6000:400e:b0:3b7:994b:8409 with SMTP id ffacd0b85a97d-3b7994b8636mr4606215f8f.39.1753970523586;
        Thu, 31 Jul 2025 07:02:03 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:02:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH v2 6/8] arm64: dts: s32g274-rd2: Enable the SWT watchdog
Date: Thu, 31 Jul 2025 16:01:39 +0200
Message-ID: <20250731140146.62960-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SWT0 is directly connected to the reset line and only one instance
is useful for its purpose. Let's enable it for the s32g274-rd2.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index 505776d19151..4f58be68c818 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -56,6 +56,10 @@ &stm3 {
 	status = "okay";
 };
 
+&swt0 {
+	status = "okay";
+};
+
 &usdhc0 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc0>;
-- 
2.43.0

