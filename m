Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451C1477E40
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488010; cv=none; b=tPUPszeM7kFBhlaMyh8DWTDT6aRpgHig75vDj7ltGqwL96k3Sb0a37Ynk7ozH7vNF8MgA6VBGRjx/TFU/ijSSy1MB61YTuNTisODnnmr5UwT5C3eI9x+1+xMWA/DyHaSkWkHus03RzohDQkEU3p/oB+2T1rOLrHXl2KYLwZUdqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488010; c=relaxed/simple;
	bh=PGbBXyPSfP5yXW0TXTzdPz22YK+eL/YQBfFVYXU17pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M50JCc8dyEFG0Wr9FyslD41CDp0oFTLH8/rBWV5U9A/A0G96SnTbspv1DokJ83xytDVgqLGGvpy84u0DDRACa8bkv3LauAuPVnH3xEZjtz/UeaRzzMvJ01//MosPmzZPv+LZfOdii5aBdcE7lyNY4E6laxEJndKNIS9nMKWXjK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wuo56aRZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wuo56aRZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4908b92904fso73058045e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488008; x=1781092808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEpNdkvG3qeZqCTI9NkgE9+3r/xOTGW4/MLX3MDeIt4=;
        b=Wuo56aRZWpN3ctLzNYrJ4FE2ZTxV2o1shtLlAi9ZRqCJccnHgZjdQQT8m2JKjLg7+r
         0rLZBuLHyAebf0iRHu3bFZGK09EjaB2hK5P0gV9RlckwgZcjnstrO4s44CMaOF99qx7M
         JyfGp3jsLKcbdkdnCL7AJynV8EF8RP0NIqf4p2o6EPCrVLcEqfvKdw06Vaaw0VRv1TwS
         saCyXRoxOnJW/b1T6cbMUMieuq0T5hy5fsYipoDrGC616oPaCTeK6Or0752hC+rsrzBW
         nL8Xg7cNmRswMtFQqhqlicA9iOt66ZWwtCW0IDcbpiDjy97Xoc9eZDaBx7GapDqz2uQ/
         2+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488008; x=1781092808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEpNdkvG3qeZqCTI9NkgE9+3r/xOTGW4/MLX3MDeIt4=;
        b=qm4rd0ocUh112Bp9aDgLq4U+8YEhV0bG8g43Y9hu/cZSXzL88IDEAscKLsvkXT/6iv
         9PMfDfyuN2SczopHzlR5S1Wgt5kYTKusQEIZwQu2BZuGJGWoqPj1LTtnf/4vK4Pm91RT
         Wk3p/JQyU9/aZZqfbcuLWZ7iDWUpul/a/oe1Dg3lp91bcAqHF0xKQdtYbTi3qTzTPGpr
         MCkGvO1czZX1GrvqDURlVq8Xg1XyArsv8VoaryinN9qqnQYcoE+Swa1EIDZWshJXBNMo
         fx5QCIRIzJ7oA5OvqglhukDPhl5hacK+N4twVOaifdmcoD1O7t+0M9xjaO+ydx+CCV8t
         beRA==
X-Forwarded-Encrypted: i=1; AFNElJ92Wpw3dFIcB/d+kl+QYd7I4dCyM4O/bNKHYC2YEGyh0Z+FQdPCUgWGNkfGvPGWEdrHl9w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlrTE456kQpYjfexvnKPKm+W22PETKpK7VDyR9zvP1wXa0Ah6n
	mqTbukcAgEh2Llp5zBQ2upcOMUkrzJc+DIusc77LG5OuGbklqKHNR/8E
X-Gm-Gg: Acq92OFyNhl6QfNJqWr/IPRHJDI6UKNIJ8J6WnIGA/kUpt6hPT6Kb9U2oWGAB5R9wg3
	etLxPQyr4aZWs8UAmM7vvGhvlUhnwH2Xu35yFudLXcgSNx15U8pKXAoCgUWBjthA5/MVYCZN1ie
	7UiQ4qYHz/3L9m5eh3g0Vkcwzss9+XDY7rmVcPniZQjA3M3rJAlWrOfVgZQEzU5W/RnLmfV8OLN
	aAp6k0ygTb5ZznhkRZwW4TWnLDGl/wtFYeGQgcaTTwKhK7CPN+bcy1VIBbqboBTINfzHWEXN2GM
	HIaLIyt2od6hQ5eGry+Hm4hChEVyfFV/erGx2oem6HJUaAyb7ui2wh+8KeVWbmrmx1kOmVIXs6k
	7mqCwxoXgiq4Jf2KeoR/MpiZ2RA00FMxiJLBADq5y0OyxiL91vrtLOc6JEbaj4jGPz3HPFoXTtf
	A/xGWV8WHvLraWTcRt2MHV72tQDS3kl3uGhOiRbf7aNGveP0ZUQneWGeUE+wfHrbThSoPNnpLAI
	eFVNW5QydjamFZa7aptQIILIXJ/E5EgsAHU52jt8zz5RdIb
X-Received: by 2002:a05:600c:3e05:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490b6101131mr53564315e9.28.1780488007482;
        Wed, 03 Jun 2026 05:00:07 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:07 -0700 (PDT)
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
Subject: [PATCH v1 07/12] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Wed,  3 Jun 2026 13:55:45 +0200
Message-ID: <35c4e4182d90db29f447d0ea96794d7230a75fac.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable HDMI output on Symphony iMX8MP Carrier Board along with audio
support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index fe1699649414..6878b89c4db8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,41 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
-- 
2.47.3

