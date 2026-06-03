Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC50481640
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492384; cv=none; b=bEyghs6mPn9ZFXfmK2FVZC66Aqe/iTC5OIU/0BlZ/8qVc1+dNhfXoN0jY1tI99vTEhZoXZNOyO3WOhNih2pAfhKNHLi0hrnu1lYDmy0lV9TFDRHVbN0eyUzF+4uMe01qU/f5npKc92P9R+xvyDxOiQt+VxgPdSpChvL/X4cfvjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492384; c=relaxed/simple;
	bh=O17UYKeQwvGp7EMKn9kl2+p192HpPzciALyLUt8KEfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHYc+HTVU5GCnAcK6YNKSieJDjdcSCTH1oahDGxTyleoyQowvYXc18USMlvia4IeLP68OJ3oxm7nLVEBcJHfCYbaBLnTM+JkyM3zDiwmqs/PUxYOqr8AXLNNPhYNa8NU11TFdlIHm95Hwy7b0QyjLPsWZXzPd1PmX3Z0SijzorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhN9d6MQ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhN9d6MQ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2822912f8f.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492378; x=1781097178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/Ry7Y+SgX8+uyjFiPrjz62v23JIOFXHYpzUoqPxgZQ=;
        b=FhN9d6MQgo9FJHJA9+ka2Kj8MDr2IZWKZhg3tL5RXABN1dlrfPeeDrTrLQ0tCQ7bKF
         ZmMC7Zq5SrrSzrdkZuXdzC2jAiXNADcH0T48o4T63Rd1f9bDKlk2YOpt0R5s52CxEOk7
         ax2ME0J1q7smKxeL/fIuzz9vmejNpxCIkXHcQnnPeddLh6MuTHqinXnESecShV4JOGRG
         rVMq92lU9TgTkx/j+2AiTGppAS/ZUw51BZXw6Jsu1UcGvV6w03IHuyO1zcO4e4BRpn6E
         fP8iRIcMa/8UKBk8967P+ovcGj+rGjegcW/mruGmo8z5ZIxlrAwmS7756AWwJIPzX8cQ
         n0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492378; x=1781097178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/Ry7Y+SgX8+uyjFiPrjz62v23JIOFXHYpzUoqPxgZQ=;
        b=B/TURiik8Xq6UCGcG0EAE8g0Or11BwVKuEY8Iv2Tmy1aDJElZY6/DgYwNoaH6WO8Oo
         d4ingmm6tDLbIRUBALsSL78xQE9NDilTMUPyORTEccO9pcReTNjn0P24FvP0Y3wGH3DC
         lbFl8oMVQVYPVw8+izXam2pENCjv8/9/x967jeJtHo4+QmlpDAjPrWIwSknMd3bsUDPO
         mUTVYEYMpsnUIJ2NRdaPLUWRaxNkF94yWsryaMXuxT3Rqp+6uXPDGyAcm5pf1QG+ORRZ
         bEXsHHxtQbkkbHcfSvMk5CP6xQQz+0bMOICAyIQAXmjmjMEPmM3IVxE/IeYp3U1tq/US
         dXDg==
X-Forwarded-Encrypted: i=1; AFNElJ8byXNngmLzNZK1tRFbF9/IV/hPAaFV+w6nd9Qm2ZxAvNqwYJFnEru386bxFdcz6HJKyMA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5rjnOiWB1E9yvErSyo0KcPZRTGxNiAKBg0NpBs1YehbIalfcO
	tHNxYZN3fyqdNKb4ucnKfFwwN+weI7iKk1g3wlLwpARiwYsjjMcyDzNJ
X-Gm-Gg: Acq92OGtwQyj8mQ2DRGta4E5CRw4kPbt7a7Z5SH3lIwt2ZjxX2F61WAY0fidqP1A8Bw
	q9+AJkzjqv+YS7FvaiWx5o4zJioChxENyiqa/pRzvqAvzSbf8ZQWA7dAWfsSTA6y0zhbxJTWcxd
	/OhDrL1jeksaFHfitXLG3jXx40Lv58r0Cu2/bb4oMDH6N7IUns9sxdMO0TWOoI1f0XE6nbhEsda
	kluI3Kj4dL/UmmNZ784gZM18droSrBkn4cEphiuVBdXmneVbYW/EJL+YYb8kQtY4rZMNvm7d7gV
	gzFXQc6LX5qmPvbw2mZZMuJOerEVbRVIzPGRawqJ4ianqBOsYfFO/YH0BFzqmddY1LPX9ytRM0C
	E6gkvOZss2rL2tAgG2Ll85OcKjOVgU7hb1H4lk3Xens3xJUKhF7boOK8cq7arHDN/i9f1Pvmuui
	P1d3JQWdzYVGUrNEdtlvrSPhN41GDMHu/DYmiZi/DBBG30lnegsdYSciMBT/e85MmWzfVoaiNum
	HjOmq1eP5OIj8Gaz5d84o8JZwLFitNw54Y8FvqXo0mJW9BE
X-Received: by 2002:adf:f8c6:0:b0:45e:ed7e:f8fd with SMTP id ffacd0b85a97d-46021783b1dmr3363286f8f.2.1780492377877;
        Wed, 03 Jun 2026 06:12:57 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:57 -0700 (PDT)
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
Subject: [PATCH v2 04/12] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Wed,  3 Jun 2026 15:12:42 +0200
Message-ID: <7758fd3b241c8e09e8b0f4b3224220325f8a069a.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6c19a63ce405..b15ca44b9a92 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

