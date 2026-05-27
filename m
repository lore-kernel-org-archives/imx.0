Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828652571C7
	for <imx@lists.linux.dev>; Wed, 27 May 2026 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877164; cv=none; b=kzymrYY4upDXrWqVM1wrF6vXlH8XYYwknOb4BIbylcnvQEkr6i3zKnfIkG7ieSBQbrb0HgRGPmtP/yZxUCb6J1NW7X5UeCjA3NNncE6VSP9Isrm9USHVgPZZKDK9p8wBa8mHk14RvbP1khViDhmLNt6KNvkl6CGNl6H2aD6SfWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877164; c=relaxed/simple;
	bh=8zVJf4ehl0i1tJ0T6O4LQGiWHk6gdqUy6omYjg9+BfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVPvRR6ENzt/nLog545ZflVxpy1EDjnZDd4D3cIUqL99Ya5P0Ul3+tl1YF6mQlakWllPhggK20QBb/Z76WCRjUZStWihBUvQsX2gon27LOEwrltFBWL8xp6HhsjHPXgkGFyYTpzGS6IoZXp/BPpE66KKcy/w29X96gXUkC2Z31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lcw5RgcA; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lcw5RgcA"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso13020301a12.2
        for <imx@lists.linux.dev>; Wed, 27 May 2026 03:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779877161; x=1780481961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV1/2EFhl/qGJB2u0g887w6RZpeM4jTCX3x2gkFo0HA=;
        b=Lcw5RgcATqhpzo0HcJWbM7adAIhojBFeVdFgKhrYTjdz9uA4D3MYEVBgozz0p6nBQi
         VIjj/NFprqO06avhahjUCmGKM83IptCHeXY7EYUkmVm0mj6PZDHlW+kNtCziNGoygEL8
         XBt3YqodzPOXsYZVudkE80egpp0Hbna5ggy+y7RzORFKQAbulKe0xsWzIfXkyLEd8r9h
         reC5zXFOOfDiBsonUIUSe5/j9sGqF2UQvMCc4LSVCjSLEiBQ8VGZGfbVjPq+Vx73A+WR
         0bgV/RR5yFEod778q6hV+zGQT93Sosw88NDzflUOIQxAzi4n2aMQ9iDv6s7woqNDvUuH
         /pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779877161; x=1780481961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JV1/2EFhl/qGJB2u0g887w6RZpeM4jTCX3x2gkFo0HA=;
        b=JUKOn8CSptr1REnF8N+XOcGKWSgVOQWvaNoykNvC1EhFUmR/7v4SUpxe0Il3xf4Mnj
         Yrvn3kuplz6hqcSjPjq8HWhCv1EVFb9+3KGaIPPlMWm+xkUdZa9o7ZjNvI50XDYOpsuR
         zt7pv1MRubVs49/HpLF2YM1pImssJRPOALxpQNb7UuuLg1G01xTj77TbrzwY8DFP4iiS
         gElJANibP65XRqlw7ui3oSHUaJvLWLNdG3L6IauenYrZwwuIlXXOOa5bksOb2axvn+DF
         lmmBJ4W+VIXPEq50ZchoCdZoN0TiJGTdR2Y7JLwvCCwdjzgESLiRvog4w6/ETiVPHJxy
         a7Bg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZRy1wn/q+6fWhko+aDDk7sRwDrjURFgU2VlZckXvfC/W00CBDAiE+51OjNAtQe4t5zCM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuPsC+NLHawOALt+WraVtrdpGKRCWDLPcQjKQ3/pbadF2Fzjtm
	8ytfP6bUWEuc47ci4MRtrN3k1AuiJO///Uf6HYqzfuuKH98J5Xy9G5Rb
X-Gm-Gg: Acq92OHpOTfccTBJd37/z6Jo14FzMKK3pWMXzxsQ/UQVLLb5Cy8uaM028GK9v2ZvLG+
	j/BpD47pRQ389rVuYrE8ENmgXVH8l4xJuK6PBsS/5wNNBFAUsYs6247sL5hN1OHjmIU3ehGG12s
	Zr5Yvy1ARrKg+d/puDHZ8V8KlUQch8lw1o/7C0fHb6IW4tCeAXEGOR+BYsQ4r891PmethF2NpAd
	pecGwu+2b1yzZt5jgumQccUBTe6fRkYOUdFGGMWyBGJdMWqeYIH4Qug3s/SbEuO7wnULchDg/wJ
	oNQSUnWVvVibuEviu9rwij9IGmvuY974Z7GI7bxu/v1lr6/YGXAqHCuKONbvzQLaSruSLp4L7dc
	pLxAja13s/55jZF3MsXVOZHVOfDBQFgOCuefbnTD3SumosJuWAyhJLuBBLCE3bFkThcymzSVcKz
	qWatA=
X-Received: by 2002:a17:907:c003:b0:bd5:7a3:a593 with SMTP id a640c23a62f3a-bdd2b0d6a45mr1469039266b.46.1779877160585;
        Wed, 27 May 2026 03:19:20 -0700 (PDT)
Received: from rafiki.local ([2001:470:6180::e68d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd50sm590369066b.4.2026.05.27.03.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:19:20 -0700 (PDT)
From: Lech Perczak <lech.perczak@gmail.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lech Perczak <lechu@hswro.org>,
	Lech Perczak <lech.perczak@gmail.com>
Subject: [PATCH v3] ARM: dts: imx7d-pico-pi: add OV5645 camera support
Date: Wed, 27 May 2026 12:19:12 +0200
Message-ID: <20260527101912.14910-1-lech.perczak@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524175312.10952-1-lech.perczak@gmail.com>
References: <20260524175312.10952-1-lech.perczak@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add OV5645 camera device node and enable relevant components in the
video capture data path, so output stream can be captured, and the
camera itself can be controlled over I²C bus.

This is roughly based on descriptions found in downstream kernel tree [1],
adapted to match upstream bindings.

The camera can probe successfully and establish an image path through
MIPI-CSIS and CSI peripherals, and capture the picture at 1280x960px
resolution, or even more, although i.MX7D is a bit underpowered to
stream this uncompressed.

Link: https://github.com/technexion-android/kernel_imx/blob/ce8fd74abf518dac0a09e8dcb37f3496f6375124/arch/arm/boot/dts/imx7d-pico.dtsi#L874 [1]

Signed-off-by: Lech Perczak <lech.perczak@gmail.com>
---

v3:
- drop the CSI wrap clock override - it is unnecessary to alter it,
  camera can work just with default 166MHz set there.
  While testing v2, I actually had it set at 144MHz by accident.
- Add explicit 1.5V regulator-fixed for the cameras vddd-supply,
  instead of previous 1.8V fixed regulator. This doesn't affect
  camera operation -  I can only assume the hardware provides correct
  voltage anyway, as I don't have the device schematics.

v2:
- Confirmed the video capture is actually possible with this setup.
  24MHz wrap clock actually works.
- Updated MIPI wrap clock to use assigned-clocks binding.

 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts | 67 +++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
index 62221131336f..8982575d3219 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
@@ -19,6 +19,14 @@ led {
 		};
 	};
 
+	reg_1p5v: regulator-1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P5V";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx7-sgtl5000";
@@ -59,6 +67,33 @@ polytouch: touchscreen@38 {
 		touchscreen-size-x = <800>;
 		touchscreen-size-y = <480>;
 	};
+
+	camera@3c {
+		compatible = "ovti,ov5645";
+		reg = <0x3c>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_camera>;
+
+		clocks = <&clks IMX7D_CLKO1_ROOT_DIV>;
+		assigned-clocks = <&clks IMX7D_CLKO1_ROOT_DIV>;
+		assigned-clock-rates = <24000000>;
+
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
+
+		vdda-supply = <&reg_2p5v>;
+		vdddo-supply = <&reg_vref_1v8>;
+		vddd-supply = <&reg_1p5v>;
+
+		port {
+			ov5645_to_mipi_csi2: endpoint {
+				remote-endpoint = <&mipi_csi2_in>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
 };
 
 &usdhc1 {
@@ -93,5 +128,37 @@ MX7D_PAD_EPDC_DATA04__GPIO2_IO4		0x14
 			MX7D_PAD_EPDC_DATA13__GPIO2_IO13	0x14
 		>;
 	};
+};
+
+&iomuxc_lpsr {
+	pinctrl_camera: cameragrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x15
+			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x15
+			MX7D_PAD_LPSR_GPIO1_IO02__CCM_CLKO1	0x7d
+		>;
+	};
+};
+
+&csi {
+	status = "okay";
+};
+
+&mipi_csi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi_csi2_in: endpoint {
+				remote-endpoint = <&ov5645_to_mipi_csi2>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
 
+&video_mux {
+	status = "okay";
 };

base-commit: 79bd2dded182b1d458b18e62684b7f82ffc682e5
-- 
2.47.3

