Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308359;
	b=R0737oFtX5qt2yV4upT1IBk0IqhMDWHOMC+B8+AHnTBM3OK0S4YL8kzbR12lckn21VG5
	 n1G533rOOLPlmI4PdQnIFDGpgiuMcSAWVx7+0TOAdS3GTB+UoZfhzwk5HAhX3rbVJICMp
	 CZTaDELUdvszPkDp/kTVMb/QaPZoe9vgAo3GCivWWBnqLXIWoFuQkKMoJjAgiNPiUosfP
	 2qS3E6gG2NU+vSFGXR9qGFDxYK1IHMApXR5r84fAIKsj2YawQSxEAVRaHmQXhZRkFB462
	 20iXFhFG0RaYmXMcGhn+Dx87QTdm/lyubx9LhgWVn10Ns02OUzjQP1AK3ZGENCK4Vdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
	b=XaQilPi9jx5d6BcUTIHniSWEqYflWEvo+cb8aHUfNLKgEUicyGcZO/avQG9vut/zNx47
	 SQnqf/pP/nFDMAVpTsa3vqlA1C8hJjFSMYqmUQGy+b4VWtGna7S6ocGOianeCLA9+GVWw
	 9mzQLGSHZ8IxgkZdcskk+8pH29tDEQQUditT8U6W5RH6diolJz6yM03ixnC7Q2RkVKFYC
	 BALU4c2rppdjvb2ExkZ0eVDXA6AaWnOeOx/JFCi1fHHPDp6vVub1ctIF3nnoHBDY0bu7r
	 /ApK5AMXD2gHXmM0TALXC8kCPGohKAJgzLtrhirugxUtxT+Zl3L/qLEF1vT1FlmkKKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OMdNLv+/";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB6D606A325
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB6D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMdNLv+/
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so988389f8f.0
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 02:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308357; x=1794913157; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
        b=OMdNLv+/TUJbwVBHhQ+UpqttBzY/yzvitmWdU6t7WaGWktNMcFjtinuJGeCVKCVQQ7
         BgbfP2MkIotSNdsctB8da9QSC/At7jKve0ubm/NA0RLikYBYyYHLPliLSFJQMjZrripX
         blZDmhVGqlXWgy100CcOQx9eNIy6u4l3aZ8AKy1BnKAEcFMVNT00DJ6RrDVhynugnGeO
         teRc2IZbqMiZzXV4kyJGlMWYURG6sN3zQ4ubDAaL4HScVIqAuhxyaS6UnGKgZmnry8ED
         rs5mWv8X+iqn2JtP/KWWc6SQQSJRNKFR7If9LTpAUSGOOnowTqzRZay/yxPOeAr9VKJW
         DLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308357; x=1794913157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
        b=XfsK3IaEHVx14SB/66+Vya1F1TF1kS+e+40qLQVTuvP6F3JqMx5KF1ANL1OWIw65Au
         63rM6RJxXVAVuwgapVlVw0sj2ZpIcsQPcIZmR1D6h29Oip6mD5/NBj30rhgxE0o9H3Bg
         04iy/+bRj1C9W7SrmYyDMNUOpZsmc1cpjSdE6qkh8Po9xMfkWqUqqAzRn5gyPbd8wFu+
         a1ASlVeqhgsEVuQhR9F1Q+8k0FLe1wUaDAyBPaxWISTp16gpXYbwXtU2aFMAAMKS/Exs
         yGLRgjSFUtAfXvwRVOfd+dve66t7EHYaXyMCdSEJTjQROU6QpUbKA+LdSlzM0Wr6bFf9
         C8zg==
X-Forwarded-Encrypted: i=1; AL+hErG9jlfStUjN5b4mfQME/j7uHGT4LowX3WJVzUy5BbOEr0RazA86Cxef/Gjp8e9/XzYNe+8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Ikf8G4aqAH+IPiDq8w7U51kjtTmDxmDspS1PK12E8GE/onPMS
	oD6Khy6ViBnp6hYZZ6DtXtYrhbUkt0/K8hnLPCtKf9YKeo9WnysMyPQV
X-Gm-Gg: AYBFou3b6Hbj51rZidTfoknYSU1LmZpOsYAFZ32i9Q7V0vT9Y0dGGS4L0L782UGS87V
	zQtpUKWd1sPz8ffynrjbwayUBMZhcfmOacTEPNSY7oKkGvpcK/o6JocVVyQiuSaNL0kZih5c5O1
	vnnD222KONxz9w4UrB7EN3o9kv1z+WKpMUrRH1wT5Fsc1Etk2xrq5tuGrVkZEYQwc6OW2P5jIzZ
	AcRM9k30aPK787iEVZDU7B7m9e163jW7IIVdq2be78THzfD0hKcF9TySJeDiIc2wdu63j6oDCjF
	OKQR57IICMat54l4S1S89kmKNEhZoFQ+98skVWJra/q+hXiA4yaS3L5YufH8UV1gnPh4V9sfFqh
	0Z064M6x8P6ruaVNjDXtR8CPCM9XiWN2Ttv6+xxfU883E+R1kL1aTGJCe8ZiCrmvmjjcA1/307Q
	WfORgf9etRJDGXpmSEjT8Y72e66J4/CmNM3FSHQNCPyyAirvhOgLgqCk3L4z0/1qXjtkL+PRCHH
	sRU9xl8rbrweQ1F04Dc79eOrUHRPFpler+iw7eLereh/NXUOSb78e/z4RuVQaEkfPo3USsE4Zrz
	8IwPPXGr1DnfHAUciMaIWNXTGNmYnqI0hhsUA980O2DxsaDVAH10Md/ihW2h2n1TqeO8GiiKA92
	15P5irpH0Ssz63UqH/hM5dRiM6tzvYgKAdtWUQt6PUzWSh7GMnME=
X-Received: by 2002:a05:600c:3e88:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4ba022c9b40mr36726835e9.0.1794308356995;
        Tue, 10 Nov 2026 02:59:16 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:16 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Subject: [PATCH v2 0/6] ARM: dts: Add Colibri iMX6 overlays
Date: Tue, 10 Nov 2026 11:59:12 +0100
Message-Id: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zh2REBX3sOwKHSQSYCa1jQQ0
 rtbuYDL95L//g6BvXCAe7GD5yhB3JKBTgX0o1lejGIzAymqtNI37N0knReUea3QRfaT2QKaqzV
 Nyd2gqYa8fXseZD26zzbzKOHj/HbcRP2z/4pRo0IuraKmpvrS0CMHjOX13LsZ2pTSF8ftL8u8A
 AAA
X-Change-ID: 20261019-colibri-imx6-overlays-a5da84ebf127
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=RGp/rEfbSkTgb/XJ9d5cOGIySUNjBN/q8d0hynymqts=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JNZUnrRga3XGc5UPHh2d8EKpUfHb+/01uYwzVepk
 +f4Jm+8vaOUhUGMi0FWTJEl44mqIJ9CiKwHR3MyzBxWJpAhDFycAjARhjiGf7r6VxitJX6FSvy5
 3MxW9/vdD5t8DfetugU8XPwrWU8khTAydK97pucj3H6ieKUe7+c4wYeh2+rLRftMxQ/Z3HvKtJe
 PCQA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

This series adds device tree overlays for the Colibri iMX6 SoM. The
overlays cover HDMI, VGA and parallel displays.

The series adds support for:

- HDMI Displays, through a generic i.MX6QDL HDMI overlay
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- VGA Displays

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
Changes in v2:
- Include 'tdx' in the display panel overlay names, to make it clear that
  these are Toradex products.
- Replace the Colibri-specific HDMI overlay with a generic imx-hdmi
  overlay that can be shared by i.MX6QDL boards, as suggested by Frank.
- Link to v1: https://lore.kernel.org/r/20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com

---
Antoine Gouby (6):
      ARM: dts: imx: Add generic HDMI overlay
      ARM: dts: imx6dl-colibri: Add HDMI DTBs
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add VGA overlay

 arch/arm/boot/dts/nxp/imx/Makefile                 | 85 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso            | 14 ++++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 +++++++++++++++
 ...colibri-tdx-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++
 ...colibri-tdx-panel-res-touch-7inch-parallel.dtso | 29 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso  | 67 +++++++++++++++++
 6 files changed, 290 insertions(+)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261019-colibri-imx6-overlays-a5da84ebf127

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>

