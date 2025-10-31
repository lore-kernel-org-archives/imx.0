Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682EA346FDA
	for <imx@lists.linux.dev>; Fri, 31 Oct 2025 12:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915071; cv=none; b=Cl2GEPEgVi+ONpYEE8xn7bHYqZiA7iI2ksWApSkzYGdBOWEMxfBKRRn5Hqq8xlW+hBZXXiLekzzyc/IYg3ZDzYEIOxi83pD3WLMK2JClyWXEd3AtbX9A1vd59jLGJUZHvUG94+GmnLZop2yh/ZTMAXdBIE2fUskAlVlSpDY9DDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915071; c=relaxed/simple;
	bh=yTQ4aG8Os9zC9co1gqLAKPoiHIsPKOdPXlkGytgtgvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQGfLEGPZaq/yruIahVGKwlQJew2AbybBjHEj+TAQbLiJcBApDA8HR9qhjMVgCOgxU/vwrteLHMKpf8WmxYAm5bBZhbxGTASIOwBMd2gLDFfozFHHmHacGmkxZ3V+mk3zIsBmpUyE8JTWkG8+J5+CEz1PwDyifE8d21jUxK2xj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPulj5Sm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPulj5Sm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so1799153f8f.0
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761915068; x=1762519868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0M1HrUEsEWAYtX+bmlZLBJ9NI4B7ItCBmyvB4tSMhI=;
        b=QPulj5Smao2sp4Ba7w1uekEayM/W96XFj63d/fenjbyLDh5pPmkN4pBib5frZqlsAW
         W3SqqfC86AvDLRoE96yVvXuvoQM1laGgJ2MZCpUFI3SQV/DUppi7tvFAvhylyGxDRrV0
         zJ8SHrnLOZ+cGOZYtpyWC4cdlUM21TmZP0w4weocy4KoqI/mfdLHarPpXR4AAxhtYPGc
         HfAI6BWts7exaW+U+2WNgWPVQ9b0+p2/wEG5s0viI8JTmXEF/wH8Ocj6MnCvQDhflOh3
         fqEZKRRn+Cj0FgtdeXqKjA+yKB9oGSdUXYhStEZbDQ2NG5fqGzqvSt82W1ekhAMi4aa5
         FViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915068; x=1762519868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0M1HrUEsEWAYtX+bmlZLBJ9NI4B7ItCBmyvB4tSMhI=;
        b=nXGPz2F/Izs2wJH1EvUZEiaVgg0+ujzbIyuLXk5uI2fBeN12Js7DRC3LoXkhNtK8iW
         OdD91uukc+z9eMNOV1I6BL9iDu1kN/+IuN41VL0HnJozEY2XOV+T7Y7aSnk1XKPi5dIN
         GczNMj/LiKEsR20Jdo7hpa7cyX4OjvlHEKYor67WR6yQzjwJLQxEOmMF42EbHqnJS3VZ
         I4TVCBg1dsSxPO8+acZRkavoweIzHKWdFQEvLGhz4C9shaRlsHBev4VjU0APqc5/gnBk
         H0OztPWzBSLt+DW14ii5UcX949/0LxkErLCGupq8KaH5fvKQRDgHY+K61IGjdTCkr71L
         tniQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPWapJYbvqK+cLz622p2oYE+L1CzUROPj4gbpRRX6rzJcZcUIu0MqkgvQhO8LTCwyIjVE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRGTshV5VVRk7aXkO2ooHcNsaKA0HL+ptu5uANnFfgD/OUptJH
	WnkCasEdJtFeLuO9b3I6ySlB4NtE29wLbNh+tgrzzLqSGpXsoyl9lnzQ
X-Gm-Gg: ASbGncvZV5jsfijTRYXyUKn64wTHDEFcVmO8TNk4f9jb/pt89zdaiNv+bJ8csKFWior
	UMIe+TpaSyGtedmt7iYlCsXbEc0nK2IjhTeSiXHNJUK+UbJ95/4AIsgDfhjdSM3vfCjhFjtRiBQ
	YEwwsTEC74k2x7uyTrNnIc9zsKLNUeP43NWzhJmNmGxk7quAUydgsZSaJJGVy1uqP+sf1/oSil5
	dj/Ll3p8MCDUaR2NtuahoLAxc0EmYXUwCF0Q0Rl9k/MLwXIwF1je4iPRH4GLwXmyQvHWBM10qzo
	IeXjz6pYnlNVT1c6uydibfK6702REcj1KSwSQLLZaEVqxtWKc3MiAOPcCK6LkYopnTi2hl9yLim
	PfqGQc4z3/FPKNLsAzOI2GkN721vF7nv2WzCPlQcBgWEMm9FA5tfDMp5eSJpi0I7HGZwjGt5SGM
	3VjIvvpU/tQasVGZkp0IDlao1VTuSf0lISFLhWnD8g5K11qaFsO9y3WeQcU/Rhtg3FM+wU1y6hI
	dJjzKWuo+72F5Mk
X-Google-Smtp-Source: AGHT+IHSXX4DYRrtxww9sHrkDWOZg/LLH6sryU74L9AN/Ia96ozwZZVUVNQDnIRYpK3dD0oTSYgkpw==
X-Received: by 2002:a05:6000:2407:b0:429:8c31:84b7 with SMTP id ffacd0b85a97d-429bd6a0004mr3158228f8f.39.1761915067646;
        Fri, 31 Oct 2025 05:51:07 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f1d4csm3144559f8f.39.2025.10.31.05.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:51:07 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: colibri-imx8x: Add cma memory
Date: Fri, 31 Oct 2025 13:49:43 +0100
Message-ID: <20251031125003.275033-4-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251031125003.275033-1-max.oss.09@gmail.com>
References: <20251031125003.275033-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Philippe Schenker <philippe.schenker@toradex.com>

Add CMA in device tree and set its size to 416MiB for all
Colibri iMX8X.
The size is tuned to be enough to play full HD video using gst-play
and to fit in the SKU with the lowest amount of RAM (1GB).

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 32bca4c6f37e..d4bf30d91d69 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -86,6 +86,19 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "usbh_vbus";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			linux,cma-default;
+			reusable;
+			size = <0 0x1a000000>;
+		};
+	};
+
 	sound-card {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&dailink_master>;
-- 
2.42.0

