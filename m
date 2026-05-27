Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB79024A069
	for <imx@lists.linux.dev>; Wed, 27 May 2026 00:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779843142; cv=none; b=LINtafABZ2pUuSjB8wE5tDId65WkpyBSCYldqbpJXCZETeTNoqCj/6Jkt8Lakop6geqcEJyzDsXzxmY8dXGo0no5dpilaxXpP++KHBeDPAvhu2xB81fnjy0PWFdXtlm9Xq/nJGOjCfTxXw/eN0m4+MlhBJtLpl3EHlnyk8U8g94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779843142; c=relaxed/simple;
	bh=BXPA79c7AXy97mro3mLUwS9xuKHDqiCGFVGiZ2aKS4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LObNPCewRx703dMhxNwqyc2tfi68zavAqCiLAXSHoYtghAuGP1uUqaYhuCHuK3UwLbLq9irjU8yfb65EvKa3R0nKnB4kxbeSs3KmRrNdu6SZP0ZuTPn6GBaZ1DSQupsxq7ZX3sayeRQvhx9eTRt97LOQAk8B5veQNpNmcVMV8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPr/WatI; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPr/WatI"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6886be3d39bso8064043a12.3
        for <imx@lists.linux.dev>; Tue, 26 May 2026 17:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779843139; x=1780447939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vvYCYPzBbkk7mEYfuB3CXLyJoA4/Vj0QiGuls4NhH8=;
        b=PPr/WatIeiNXNBOhguqRluDftEeMMzOT7tfldnW1gLnZXWULf53TpOGAFfn60tE3VM
         +0DXtY4CtdYk5YhTgHaDoymrwN/Uwb+xa7uqb+hSKhPVrB9sRQUh7Xcd5A5PoHpOdXzW
         CDLLBpfPuUUDKg97voXnpDpIu39GPgfush4SKU4yp65gBS5wwlkePz5qvrAQnGFSK5Hu
         qOWxjhGChWalk2SMFz3XNeEJ4ec2z4lFdIULjDN6rRVq/zdoB5BVmKW0EMYrSQ31o5vo
         uQCrszWT+IDl4BWx71chuHBr6YDB6ko4YdxFPfciwP1rRsDJpjEzsXx31Ke2ONy+FiBi
         hrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779843139; x=1780447939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2vvYCYPzBbkk7mEYfuB3CXLyJoA4/Vj0QiGuls4NhH8=;
        b=e+7kqINN1edg5djI8X+aLZyJtafMdPvapEgU8FE4pvXFQx0y2yjfUfB188O6qVNBfx
         myIu+91+5Gpd+ID2E7o2+BxXsOyfkuBRI7JbxHTweyOd4xq/maRkrtBawTro44A0hVY+
         Pv5+JY5k/0QVJiwe/MCanFfPWWcFgKwixFTczXznqpYuIqYBq0G9kaLFey/T1+8zx0Qc
         WGZIXOH5dG4luGR3/U+Zhv2XTlGAlLGD19RY7ds0OgxyAQyTipyerNy0A6cXSCI1l7ZU
         fvM935FPJ0MjqMznSmP7sIoACutYdEjx1ZM5ZE9ya490UPkeeOD76dQIBHBspXEDEz6n
         i/4w==
X-Forwarded-Encrypted: i=1; AFNElJ9+L6EwpGCXyP8zN9jBleE4lrSxyzcOefhgOYBjnlSEFugjKcnjwBKFE/OmY7oDnnVn2mA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7yl6sZ3e49grhPxStz/4HSZO2hOVBiIPK0Sa4//RzdkxpiABI
	ykvImQxsMBgsMWIcL8UKcEazA52EAMMCIiRYR3TBiwzEhCZIsR/Q+ZTX
X-Gm-Gg: Acq92OFgqiognJEbTe26ljnCJzxscPDsQ5EhRoGx3vwQrtwEoghRVEGLopRbm+OkX7G
	hRjsjOBYaKU3N83kEH6zOgX6CqgGtgWr6ZIPHv25Fjbt5RmxDg80m4nlta1csWZ4JITUV0vc6SU
	qkveW6psNj3bFlQL5rXSy+n3RvtwI77xnklj6BK+St7rWNMxZNn/Ahs3dY/RNNBhMVylkKvJznT
	BjG9yFY+3aD6bx1mnPFw33ngCgQekHeKBzi5KK+0uLsH3OlrdRHsi6GyTpKq11JCpLNESaWjCn8
	d+OGdQKBQtF5hCW2ANMOpKjdx02app7ebRygrEd7tSzw7TVtACK3NEy7YmlBAl7+QEJba74fk9j
	/7TIgW61dU/yUsYgBIM3I8psJnxdLgNYJ45+/l+SDhlcgSS1AHtCXek1FXWs23DpGig5QmpXsgj
	fZXnQ=
X-Received: by 2002:a05:6402:320f:b0:67d:5c3d:8633 with SMTP id 4fb4d7f45d1cf-6889cc6f56fmr11104056a12.26.1779843139108;
        Tue, 26 May 2026 17:52:19 -0700 (PDT)
Received: from rafiki.local ([2001:470:6180::e68d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6fb4115csm230672a12.30.2026.05.26.17.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 17:52:18 -0700 (PDT)
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
Subject: [PATCH v2] ARM: dts: imx7d-pico-pi: add OV5645 camera support
Date: Wed, 27 May 2026 02:52:13 +0200
Message-ID: <20260527005213.6019-1-lech.perczak@gmail.com>
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

v2:
- Confirmed the video capture is actually possible with this setup.
  24MHz wrap clock actually works.
- Updated MIPI wrap clock to use assigned-clocks binding.

 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts | 61 +++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
index 62221131336f..6a6c3c743b41 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
@@ -59,6 +59,33 @@ polytouch: touchscreen@38 {
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
+		vddd-supply = <&reg_vref_1v8>;
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
@@ -93,5 +120,39 @@ MX7D_PAD_EPDC_DATA04__GPIO2_IO4		0x14
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
+	assigned-clocks = <&clks IMX7D_MIPI_CSI_ROOT_CLK>;
+	assigned-clock-rates = <24000000>;
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

