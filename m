Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628EC3D332B
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929694; cv=none; b=hR1XhdXg33Z+EHxeNGFvywkcXAcRBP7kmj+udzkAP9UuAYkZhwf4SZ0EwHCNXTOqDoLxLYCCkcD5rOVdZT8fbmsAYw7583U5lzwKvZzJVxDvmBCkjkx+JsJHxh3BJO00lj2s0dQdiNrk4yUFo7dL7klvQ2igw1DIPP1Fcguu7Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929694; c=relaxed/simple;
	bh=R0Z0w3pzcd7hvzgUGg68GXouwsZHRDKWxJ+hHZRL96s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cx2FbJEv9C5K8rx7IJfW3HGTB0M2w4VbU1NSBySw25cC8S7194A+7KZveuVbAYxhDyXJa46iuJ9nTHkUifrvVYk8JBwROQeM1x0ckYPcTTkE2WX6jMLWEFrWM01AnqhzmrcZLudPZBNkigwpAaje/cV5hpw4HDJYijaJe84ikSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rXGUCISd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXGUCISd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so3093733f8f.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929690; x=1781534490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oml2/FGrlWi30Gq33/V2Fpu8C4n8TmTdona2QadZTxw=;
        b=rXGUCISdt2UTbSmFkXx1N3CKZcrcenbJyxIJTUkmRht2D33lbUSi913fehjQyFKsuh
         7Wi0lFd31acvcVx8VthCuYxjw73HFyZcKFsvr20QP0NGpJ4lNDRfYDmsJfTvXNNzJZcP
         Kb794kmVmy5LN5B//wYGWoAKjkQtt53JGjjR0xECCY1VK+bY8mA31jM/Er+lLZOsDwDQ
         hfAVQvP8a6gnge8z+5fDNYIYUkgFpSrGtcb6yx4fuU+xicXkUfAm8jaVUnXhcmMAaqJX
         wnWrSmeTV7yPBjvg0B+7tSHPxsyvqMX7jUf3Bdh45zx7RvF+woo6KmSRHDmpXpcCEmcO
         5tCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929690; x=1781534490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oml2/FGrlWi30Gq33/V2Fpu8C4n8TmTdona2QadZTxw=;
        b=o0NVxceS4p8yx8S0v4dP6XqwboRBIMj4Lgp2hff2FXC2gxrK0Y47+xDhuXLTzCa5tV
         OIs2ZVOjbgT5U01fgQ4BYLHYaxbudXjG4KJDvDcyDJ2nx3A3JHHgaiEJn4grQ28FWUcv
         MLM6NVG6V0nNGXebADVYDFEZYK37K0U+u8EUoXzfH8ozIxyjae0CNcPrlZ7Zt7J/FtIC
         EH1Y4D3kfFHisEdRFulys1AW9qO11PQkmQfCDCTcCmNuiZJcG5sqXj4elxirja4g0Gau
         zMmqFHuG5wLCrfm1BjiU/iBob9EXcI7t4EgjBYAe8GsfFfuy/TUBRlrLk0oLGA3fU6Dq
         OdwA==
X-Forwarded-Encrypted: i=1; AFNElJ/XdtevB/U5VhAlwzmT4QjaoSkwbIIBK/nm3Zwudi+3LMjxDgpgOEj4cWZU3NXxZBnlteU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUKPCvFyc7Z2SmhZ5LJMWouNJ00NeLhq1kzvQ3R4heQ4tmBCOQ
	PiSGpVV0p0bfS5nqwTuY4LOPwftv3+ONYK2MOe0CRMdXF+7jjQym6K2b
X-Gm-Gg: Acq92OH3IzBDAWtD52WYKGcgunacKFkwknA1a51p87XG7pjgQjSlfgzOFlP9rtjH3i3
	SYpAcsc0GwvvDT7gWGai+3x2WsJsZV37SS3SegBA+2Q7PyH7+GOWOAX1Egb3l8lJpMlSJgSNtDk
	/28OmWYqkHB8mQUSmSzUMWmS8KPMV2vE+T87iUHyE/+LMJiXHyfk+bF3Tt3kjoQ96JEtV3K5Gt4
	SXzDHwK0LjLmyYsHpK0XzxNX7JR+XftETv0J3X0q6DCmiDAH1XSVS+Ij2JU1vgL2jIteKShm96v
	+n6++4A71OL1Hh3xTnWOaDfeZfoA3+1rnEYanuDeEES3rwENCSzoyx4GnWtkrB/pg7j50Qo5+Vd
	FeVDxhgQk8ItNG1F8GY13fwscFkYkxdrWtNelaZyhHTvKUKgcp+OMRuWz41moWuo39Swf24sZVU
	cyXuOMMGxY99RHJQgxWUCpjg5lbWkQ9rhU9Pr0g9tMVlvSXxpY6h3O9DYAD0p0YjFdqgd7/u0PU
	OyTuD2gj+qi+HgytLeWlFv2PGhnEztEGbe482LYAHXE+WBG
X-Received: by 2002:adf:f911:0:b0:460:24c1:db8 with SMTP id ffacd0b85a97d-46030777545mr20410603f8f.38.1780929689827;
        Mon, 08 Jun 2026 07:41:29 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:29 -0700 (PDT)
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
Subject: [PATCH v5 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Mon,  8 Jun 2026 16:41:07 +0200
Message-ID: <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Describe the PERST# reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - Add pcie reset-gpios instead of deprecated one

v2->v3:
 - 

v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index fdac4ceb4c19..698f02fc39a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,18 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3

