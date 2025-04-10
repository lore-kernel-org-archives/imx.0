Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDDE1D61BC
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 00:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246785; cv=none; b=dUjKx5lvrCWZO2tiTSn+7EAL/qGv9J9BLwQCUL/vWmjqD7DSqFunGSYPZPlaL3o30ekTyl+AhhVEZ+XMJPRfqSnXQfjfrex4DXPVrHF4Pr3bihIQIf4rbriquPrzdg/EJCud6eLPuvtnjeoqA5Ah25M96cIMgPbU/NVHUgTnNN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246785; c=relaxed/simple;
	bh=ATC5BQWr41nq+0czBY9pUXOwuR5QyJNs0mlqkPhiBCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nt1YHueYUNsr/gT4IugyLCXPJmBVIDZzvbBLX6VSUlxdrmqIfuJv9DHe70j7O78hZULyB0iclzNQcl2pYW6fPabuUIHTxd9xcIdoQxHrGBPkGsmAeV+3XKKOTxLHpLBCuxFK2c503BfX4pypyz9HcBEZf6IXvf0IZ1wVci9W4Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFUmCSJ+; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFUmCSJ+"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c0e135e953so31969285a.2
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 17:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246783; x=1744851583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21NBbHnJEvc3EKg8F1yzaK/H/yAjd0XIMDAW7xtC5ew=;
        b=jFUmCSJ+S24oCbhVpW167HwFMlB9mTPmWGd7PvV3+qyidM9glQtpUYjvgyaQfVhggb
         X+jLPVimsPAD4i67F45ObLnKod10leOaPtNbwmf+LQ1jsjeHnGpLFulVK8eis2ZsDmKG
         CkarsBoX/Vol5EevzGSAWIW+74mTjq+S+563iV1iJQZqkuN5QDN9LtARmQpbZA9cGl5n
         sl5l3HD0R18wvlURRtvOYGvd9kEm3tUb5ciibQJtzeVbbLGVWpCpgDcC3eXz6FXDknIP
         OUSOhqkW+++pEIEIvvR20q7AZzEMpO62kKtSajKJ2vEQT8WL1izHagopvXt7+Rw27dmm
         4dvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246783; x=1744851583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21NBbHnJEvc3EKg8F1yzaK/H/yAjd0XIMDAW7xtC5ew=;
        b=FWpVzeSztSYCxvAHCOjn2fZRG9TywH1C2tUZKFDF77aqIX7PdaSKVoaWLoxlY3vgwA
         iL3iPMNjJPl8UOo/SknVjgzrU7llrr9vHFIpHmwqloYaNqXmsWE7NR6xudB2/phQIxKP
         FmN7drkTViJjzb7FannOW4919zGBrJPwk00c2vv7DJXdJAZ8CL/vBriZW93AHFyXgnbc
         rFkBiOAYbRZU4hLLl3XG4InAzfPZFVM4OjQHaLCp9pP5zaQyHYyOUAQc6dTxbeYtpdcW
         170tEoaOnGy2loKo47GmgqinYcg8BceEvCq/Fc4vZrrbXhzue3+ESYSB/RpjELxPCl6h
         wScQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnX78eTTHy+nV2p273GX0IMv2TLwrWJsEBnOkKOFTe2FUjVhPs3/Zl9HDZ1jsjNJaqYhE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUBcfPYO47Fo/zs9ocGQKMrvnLKfsvhy3b3XjwvSY/VywAD9zX
	ZtBDlrV4N3ItnGMalVkyPHPrhmlGVXtPlKHGVOz0qZ8d4lYkXTKY
X-Gm-Gg: ASbGncvwnUF/xiimydvIXJVpmLUsocOdZRPKFOh2nje0F8rL7ssIltM/qi9h1uTYakz
	d4UrXJLuuAxJsxVpqNdA9KQW+/PysZz7Nl+eK2WIT+wrPz+X1egtvwAI4Q3MYWfsV1buSQoIaBG
	Pt1ML8KEDzqn6MAKbCqDRID9U8jIm6wHr/7l6LFQZXLLW0fSxdtSAjnZ+bFt3NpH+02ajBEQkCx
	Z4MKtDXw6Pl57pi4yD/f5B5tZRw+tDvgHV/ocVc1g6zI9UfeD9esve8JHDjQZsndkpOn9XPcDwf
	jR2oMqpKNcp9tcLYRwDAhgDVfQ9iyWEPS7s2H2OXjKfFmNj67GKUjTI0g/23k6QNOPnOlghegqt
	E9tJPYLnegJV8cPc=
X-Google-Smtp-Source: AGHT+IGkn5DN9CLotIyJwd+pEk5Z4mTZgh2X4YBP62+cyvObhjex171ZLRHaadE2Sva4HkX98HZhxA==
X-Received: by 2002:a05:620a:2988:b0:7c5:a542:10f with SMTP id af79cd13be357-7c7a76bf8c0mr139525485a.35.1744246782717;
        Wed, 09 Apr 2025 17:59:42 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:42 -0700 (PDT)
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
Subject: [PATCH 9/9] arm64: dts: imx8mn-beacon: Enable RTC interrupt and wakeup-source
Date: Wed,  9 Apr 2025 19:59:03 -0500
Message-ID: <20250410005912.118732-9-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The external RTC has the ability to be used as an alarm when
interrupts are enabled and configured as a wakeup-source.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index b3692b367a42..987c14d3af9d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -245,7 +245,12 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -365,6 +370,12 @@ MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1

