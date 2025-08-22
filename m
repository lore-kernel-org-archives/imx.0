Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDCE2FFDEF
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869486; cv=none; b=Ge7Bx5H/YBjaDPCbs/mIIdFzVu11HXGAUHk+cdybv9p1k8ipQF5rqJeizhY3DXotpIOhfNthb9sYXkfVDjjCp0HVZ9BKvl/4K+ODiXLdmdIfW6p3H9rQHKJmppLbnKOoQBVXaYhOadGUl1oZo4RnGwYmAIc+4djKpdjUAlAbjlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869486; c=relaxed/simple;
	bh=8E6nImJ8N1opGmR7K7GVvgClRbKq2rqRED8a2qwcAxQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ktwv6IBbJPMstzVOFVMsffmsFYcbLAYtXdEmW7NNMyBralHXRlsaJNjIe32SyGUp6+TgsL50hpl6JAouiB/cnBAWp/4zZXyKmPYg0zmBlTWRpnQ4LaPJNArzzrknix57nlXKrr7xdjFhAOV2MvKQt1CydDYEYOzmUXEvith/qnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lh9QygtA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lh9QygtA"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7aecf92so33697666b.3
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 06:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869482; x=1756474282; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXR/Mce4wnzCN/euqWV2Ip2YQgL/Gld/DHXWnsUXf5U=;
        b=lh9QygtArgCQo5+bUWk892oN+ViO9GEUoXoGGn+n4wW26m9N6ssuHvh7al9pUr9sFz
         y8h11JiNFH7EkNLlS8KKmE4lfRmKqpo2I3r9cxEISUqpsnHm4asBFRO1GUDhiqtq1vkT
         CHkPfMfjq10VpMX3LaM3ABvO1LAzFqUSpZp6l0qSVeUYTcFxuE8d6HZ44w+BIYikP4Mr
         zpvqwSlCdGVrVWQmlhyoxU94k6VHDi+gn3+PtoOSPvUuoIo3zChgk5rU98Ce8qJNDOh4
         RpXu8UISb8SyKO6HiiRgRkU5zpwlsTxub0cgdp25del4Ow9Pe5OQvCkpgstqVoE6dIl1
         pmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869482; x=1756474282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXR/Mce4wnzCN/euqWV2Ip2YQgL/Gld/DHXWnsUXf5U=;
        b=sSrZOHAXvX7Pnmw1kI2Hj+itJgv9e7uyAkxz3Zls4rUHUurfwH1HtanAWR6KbzHHwh
         CWZ9UNb440Phb+K/sFZ3EjcHuzXsHfhgBwzahhal/TlfhQv3FttcsiumEYa/uHJii/F9
         r0uGpKrwxX6ucPezbFgURpJp3UzcPxszmaRCnYr0x3F5/dpOqpa0JrtOElvNuNtHar8p
         P5t3pXfgzsEHY59i4i231mK3krxRtAX6GjZDFGgysvSMEwbz7v4UHqj/CSuR/fVIsenH
         wymX9PI2jOJci87KKdjskWBBu46X1sv87Sm1lJduhmCNNzjbgGyrFrNl1+UInBVFCzgf
         yNRA==
X-Forwarded-Encrypted: i=1; AJvYcCUdCNSU5Dlzo6ISCRyS3tY4A07gSyLpN4bpF/aj2kM3nCym3/lyTItrzMnakVL5WFbZqZo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ3rywd8u8kU1aopyY4XFECmO1RUmSQ4t/qTUwWPP8hkLVxRFa
	y/gsCSaTANc+f3D/dCnX7tG6z7dGbmVh7xnVkhnLF49U3h2JyD6ras2/HUQOg4xg0e4=
X-Gm-Gg: ASbGncv+8GlkbYhkMwmqTzYWcWEy37TkCeBYIiX5v2C4zzBlhc9HuaGI8qV7pyJYLF5
	iFovlWofT956pqH+6mkBrUMHwgPIHJpQTfynZkSPRJ+or8LELCBTA2VIDZd4pwlgdKrbQ1f5510
	932b5/7bSWciOycV8clpxDVhI7XFVq1pb0GH90U2AidMvI0MD1ML0HInWUUo4WLszykU12kZyL5
	4nKTCS29342MiUKcoCV30G2T7zIqWraxYhzogEbCbtNgEhqNNpPO1e8XkTnKnHTtCUY89uZalXX
	GFJgYN+R1USD7fAFjF/M+dLp3WbiFdRwzie/MJ+Fainj9Clwbr4pmJ1CUBDz4xexBPe1lmShxd1
	x0kALJfrJizJwJL4ZQQ2cmUR6zIkdxBsD27RDtnzYpJjR+qE75g==
X-Google-Smtp-Source: AGHT+IE1SyS7rdAiTfqSibtZfokao085p20ry5c6FKV9TDDo0DnlnMgSkdOJ4Z1Iyt5EsBmYWbKM5g==
X-Received: by 2002:a17:907:6e92:b0:af9:6666:4acb with SMTP id a640c23a62f3a-afe295279f9mr138617666b.10.1755869482347;
        Fri, 22 Aug 2025 06:31:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/10] arm64: dts: freescale/nxp/imx: Minor GIC
 interrupt-map cleanups
Date: Fri, 22 Aug 2025 15:31:09 +0200
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1xqGgC/x2NQQqDQAwAvyI5N+CmiuJXSg+riTWgW0m2RRD/3
 qXHmcPMCS6m4jBUJ5h81fWdCoRbBdMS00tQuTBQTW3dE+HYIGdHTVnMPnvGyGzijpOsa/HbgU0
 bA/XzeO8CQwntJrMe/8njeV0/GPNdgnQAAAA=
X-Change-ID: 20250822-b4-dts-interrupt-address-cells-imx-45a128fb371d
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8E6nImJ8N1opGmR7K7GVvgClRbKq2rqRED8a2qwcAxQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEfkFR5SYp6LIxDwIDpcspsTQNZOP6eApiR0
 nS5WmK7QLOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxHwAKCRDBN2bmhouD
 10JzEACXW7APJRig+9Zh6eycLANivQsTEwANrpmd+3ax0sbYfgY6QZmkaTbajHW0mqLqGx5qT09
 Wl+6pVSZ5648eRy/NFIhmrw2R/qYgWb43mbRqx9FyOOoNLn5HRjv+vOhDX+QjADkgW+ar7USaBK
 XsdAcnQe9chvXnwPD4Wta63I7uqczB56/wmt94B1pfVyPwUJMgeNqt70+PGCvCn4qoo0T3q7Sur
 Q1m/qVsJIX3dBFk2/xElUddPPiCiPX+eb4RkvxrJSm6f/WlbG9aMORnoxMw2m8GktzxLNxic/ra
 R36wXN0kGTkIynY/jm7n63paNMnF+xixTE8ZAimjMWRjutg9xf8pYRRgg9guBvT5xc+F3H1w8i6
 tK49RrcKVoY+6GowWiNp5jsoycJ80jCV+jxRlHHQvUSz92Ui0peThrbEC6hS6AdAZ1iPb+DN4QY
 rlD1zs2ap2SxjISRpxBM/xjoTfeigfgpWkOogXtgkHCXGkhykAYKnK1We0H8wlDmyFnNX8b9dZD
 f5o5CgjqGSLyUm+nGKDRKBAku9xJ72jHmtgQBfv/+qyWOiDZmMQuLbXnG/oPD/QACNrSa4JAr1A
 01BVWhlM+Guez6MGZbrRfxYk3Osvcqvi8OVQhP0pa9CWgR4hLUoVmoHEsTZ8O5+KmdO7C76iJN+
 XDPt04+eMv0SsGA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

One W=1 warning cleanup for Freescale.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      arm64: dts: fsl-ls1012a: Add default GIC address cells
      arm64: dts: fsl-ls1043a: Add default GIC address cells
      arm64: dts: fsl-ls1046a: Add default GIC address cells
      arm64: dts: imx8dxl: Add default GIC address cells
      arm64: dts: imx8mm: Add default GIC address cells
      arm64: dts: imx8mp: Add default GIC address cells
      arm64: dts: imx8mq: Add default GIC address cells
      arm64: dts: imx8qm: Add default GIC address cells
      arm64: dts: imx8qxp: Add default GIC address cells
      arm64: dts: imx8: Use GIC_SPI for interrupt-map for readability

 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi    |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |  1 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  1 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  1 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  1 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  | 16 ++++++++--------
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  1 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |  1 +
 12 files changed, 25 insertions(+), 16 deletions(-)
---
base-commit: 812efb8b495f2ca50795062b77415b0e8d9d7e53
change-id: 20250822-b4-dts-interrupt-address-cells-imx-45a128fb371d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

