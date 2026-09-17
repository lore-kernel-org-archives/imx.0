Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A74D489D
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657759; cv=none; b=B9Am0uQ1XHwlGqNJCb7+Lk58l7PfDfeLvHJS3lYNz/kgJAz3E7Ys5xYg7vsYp//gVostJ7RG3r88ReEYy1/hokg61yrbqyA+e+GV05gHXx4VbQtX6DE6XK2/UvX9F+AUy68lGJNmeZ2E4bEtJSMv9OBv6sAN0L7dl3Hz+DKHWD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657759; c=relaxed/simple;
	bh=ZNQ+cRgP+nXk8+UUGlAkoMqikfrO1wJLVlFUQk1/0iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfxdRAAPkAriBqjeksACRgx+A6b7V5XAyCeTt8iwCrPA/vmt+8aK0U8PBfvUqszNk79kzlY4tcF6OFRYThaTdPKXyuP9GLg4TQ+o6EG7WZE1c719M/v4qQYRCuxAQ1563egGX6tSjpj6zj6EXHQ2kBJR2CM047hwqvxsCmMWS1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0OIx5sG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0OIx5sG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so5488285e9.3
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657742; x=1790262542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b/fhEwmBPxpFcptPOeQ0kZ30PMWIDMPcXHfa9JyTQU=;
        b=e0OIx5sGdyCDDZEZQ29ePOGARKKpJ5LcbyNlLyr/QxB+ZOJK/VsNero3eyiWdWy9K4
         fJdoEa9ydkFH0f0W5TeBOBbKD2JoqdMjZvXOph7iAldaTd2RVwKRDJWwwZTcIVzwCpKM
         ILWulgYRVgo4WEjOIXIOeSuJsO+rxvQlCMRHvLlWt0hmYfNYPs6jCH4NTcykX6fw1pOj
         cNg90LYMc6Au1Tnc73gytj94qyahNS70W8RTtW4r+i6wJ37ZH2nRAwMTDVW3PoX5VPzY
         cphQ9LHZVoWGs6sBXYZlP/VMi4HoeYAX45mRLdI7J2SUyXw/Om8hfE6uJ/3TFRwcJZhD
         PFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657742; x=1790262542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9b/fhEwmBPxpFcptPOeQ0kZ30PMWIDMPcXHfa9JyTQU=;
        b=WWzemHdKwdhg9LjsgLtCYKxJVkbyRvWHD+BjXHkJ/LK+GNItPvycjJkDRCSzIryiRe
         vTiBXTOn5EGqYodvHur5Febo9Y/xBAKzjvdKnCFMvlRCVp67IfJRVwFEe568Szf4IKSM
         4df2dqjwiEYf9ntxTKbQuz114YZ9zMh97E7WgVuiLOOZuYQAXoXZIk6x24kQZRjSVhB1
         XFOwG9Dzbgk3lQigXQwrjlCimSEy1/3mTWeWFZ3+Ddq4b+UT7/b+m0U5j1/6KHYyMFT9
         wpH7FABHksSjIuTkwJYHOD9spaxbYegGZEh6WtYZ74vZrxhqMj2Z9sA3SFAi0S349An9
         p8zg==
X-Forwarded-Encrypted: i=1; AKwUvBx7bk8YSXKkXVD0x83Fnm0ZFNQbSIVjW/k3OrcpOLAuVWXatmg6TYnnhe7FF456D7K9ZH0=@lists.linux.dev
X-Gm-Message-State: AFuF++lqZD4wXDfim1L4lqDrXqRMFibWD5vjd+lyBn/80DV6ku+B4RiJ
	q7TFtcqrmVmhf1Yo0mnm3Hm7xkjQFJADvGq/SorPVRkKMYo3H3+bp+ts
X-Gm-Gg: AYBFou2HZTAVmWG826fHjwY9Xh427qpNVFwvMFd0QQcO+y0+lc8q4j5Xy99Pj7ChZpL
	KlvBeMqAkIcTvZCy/QVvPsg1YcxgpJB4ru5oF7gIrvIOcalV6cJAPyo7bhjef56ymcSh4v2relO
	BYAnofXL13+3j5DoVM4dRfJajOE8KeRHi6o7EyEwmTwCOOjDz4O5t1WB7tbilOOEYScXACWFqBi
	DVsMl7M0cI53X160ZchHNZOSj3zoRMG20aLfINJIZn1h5HRIWBdcJSWfcbfHsJzOMJzdKy5qyWN
	o2Q5qeKU9oot5MDL+X+0K6Yfa/nU6JBI7HulA4SJXDsXHjPxJewI/enxlo/FPwV3pgifEbva/iG
	44Sn938vLgwUYNc/kwUx4YedTOvVtfHsoNMFkEtK5boBEsnZIeHG3ePsnLz7yKFG0jA37YU0ssP
	lCmGWQbbw6qYdDWjuGhV6gTAFp3wZ/LB8FAUpYly+8aXVDBeHaQRElDnPQM5LiHw5FCD33FJj8i
	lqtKPlM5mdCf2OMe7ZRsQ7S6mYssaDZyk50qkTapeR+XV2kwOy2nDn2kcqibHTkRioMenAIVV5N
	Bn9flW7swHgR228xy74BLg==
X-Received: by 2002:a05:600c:314a:b0:49d:16f1:94a5 with SMTP id 5b1f17b1804b1-49eb732b59emr86524435e9.25.1789657742060;
        Thu, 17 Sep 2026 08:09:02 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:09:01 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v1 3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
Date: Thu, 17 Sep 2026 17:08:45 +0200
Message-ID: <197308a77fb4310a3615bbef084b25fb1874c753.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet PHY reset signal also controls the regulators supplying
VDDA2P5 and VDD1P0, so releasing reset restores the PHY's 2.5 V and
1.0 V analog supplies.

The existing 100 ms reset deassertion delay is not sufficient for
reliable PHY detection. The TI DP83867 requires 200 ms of stabilization
after power-up before MDIO register access.

Increase the reset deassertion delay to 200 ms to ensure reliable PHY
detection across repeated boots.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 9fc0f7e551ca..fcd937d8d29a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -123,7 +123,7 @@ ethphy0: ethernet-phy@0 {
 			reg = <0>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <100000>;
+			reset-deassert-us = <200000>;
 			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
-- 
2.47.3

