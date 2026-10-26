Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006951;
	b=rRCp8sOK0C+WG4xB3TNxrs3Yl3WUmE853SPgf7dJtjf3zvduIQEimC3urmeWWZ66JKmJ
	 x6WCGydORrgSeWMtVkwRASCHxNJpgYJBMepmwqlNJBiRo8zt3hhoZZpCHJFXvR7XCcb1E
	 iCynnWlSZf4Sx4xmjPpkg6cYp4ofzs5jkaVJ2YWmZqCkRFrOPZUMT3qa2ESwgtxJxGPd7
	 oUTnpJAFmWwQe3Xhe0QNdC3hg8a948FM16H2Pf0rVnpEXN/Fj/hGVqTukTVy3g/vrmo2+
	 15eMqYoySq9hdkF84PFbLxQXX0K9/yhOF5F4dJYyOiMB2+HBAcZEEIeFbZxjv1is2eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
	b=YQ9co67xiynvBtxXHzc2HiZta0FMl7mKJro4o6TSqcuV8aY1jtqBEy6ZiyeTALW5R68f
	 WJQNISqQ+ZurXr7qihucZzMA8bscePrFTycsDnlu9ZlrW/WeDX/umnasG1TS8ej2iV3kB
	 Gz7yyt/zWeeQuC9qe1Ca26TecD5htqUrwmxDW4rLtePoe4fJuXreFbXYvbYeznfk439hR
	 5KNZ6orzqaANEVoFxy7AjS6uFWufivKI877CrpQTypoN41LPHFYwyKFw+5aLkYjA6tGvz
	 /rIFpBQOpUx1qhFiIwm33IDtTodIxyDZEi6/Q7wSOo/jSNI2XVs4q6+MfQ+yEWL7b4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Voxj4o+P;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF0A606A332
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 09:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF0A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Voxj4o+P
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso8660415e9.1
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006949; x=1793611749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
        b=Voxj4o+PLSVI6a7dCPh4Uze9azZnUaHYrao2JqsLoEb+OQRWhhAl31FWFEaz38z+LM
         9momdFTJfZiLd6hwseP5FKNKNh7YB9qpWE6IC2DIVq2meCjS3czs5GarCoBYPAzzuCOv
         hxjzeqQuAX7VJWoAk+Im/n55lqbbaihrcdNBJ9ifD2Zd1/0iEPBMKczKwSGkmG/cp8Mu
         5TqwBhw7gDLezi5xFzpd7CF2OC18MM02ci30c6RDz92yhIMX+NrKCER0n5Ow6v4IxAZB
         HjtWB4DO+vyFZnVoyRK0eLajsKAWhdYBsWaxlF1emQ2mVUsRGBoTxa337zU5Hnxtetg9
         TWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006949; x=1793611749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHJl2Qh8Tnlk572C5kNHQyc3XqOREsPzi1FpNma4L3I=;
        b=iJVAhA4WoyfawX/G4IJZTNQhflaG/x1Yy/kIy7xEUoXVMaiU4Rxzr50GSMUoHb8XOK
         d/BqBRoI0MRyBHzFhWV+hAlS3N3tQGqszBG23AqcdIp7oNsQ1jXbmJhwRc9YMwhPCs2a
         /loQiH9W/cDnlw6dfD3xXiuTj+KnBw08u5AxQFaBq760H0ucrD6WGIjR/KFkhhUF38dK
         ab+KYjhzI6cXJwD12x+uY/H/YlyXIxYJ0gbbH6/lulRIhk05DSW3tE729tBF8ExmURz+
         r6e4pEXyScYFEwMna0RfpiM/BcycW3UYIP1hCdBU0aIPsjDTBLg3BVEW6o4U0BQSR97m
         aE+g==
X-Forwarded-Encrypted: i=1; AKwUvBxvTKmKltBUG3B9Fmg7oBjzGEYJ1og/ZHM6AYwVjjrLnPMwgT7lgkux+x2/yzP6h9RldqI=@lists.linux.dev
X-Gm-Message-State: AFq9FYL00SiQ7FmI2zZIF+0L2Ayc8q00454H2hIWhaMlwvI2wtGKUNuS
	quosYK04uX/P6AhCuMiLT2ml81ijBK1oq5tQzE/KoFDb40FL67I8vpyj
X-Gm-Gg: AYBFou0fTspf/W5uDOlt2Hr9/cM6sToATZmrEyoPuSklnMfVriNcPvFJS94e2cR4A6a
	KxbSeEe392YYxDAn9/fUvmNcvHlmKzru5kS7G/tkNe1BFDxubrlePRw+U/3jR8qLnJIydYZntuk
	cDlV/QbxIsF6jamXu5BadhLE1umB2UiWfnVDoK5ZjX2mKHUgNL9NFgnS7A4u32gCJsQd8rbFj+n
	Uos/kcwBvMKX7tpN/PwlXPid5TfyPEG0PKxH6kzDHzv10DLAJss5QCF79Pj1jnsKe+M8WD7qYNB
	NtoFoxOQjAdUC6FP4iSiwjxGv3TzK6nVOB9u4bnGDFNpFlE8WW5kOMkE+fasOv7tzrI+31n3QUy
	SiDXmU/KygEoyAKCes+h8fwh3VgdfOldToqqW98T5NFnhVYBRstYeBPFWP0pTyYVJPzt9g4Vtqa
	B+LgfeEvFgruRVd7lJLPb89ovq4GMWDEz9OWoS5uA7fw2wzysnUi1d5UM3AEIU2H2p6T5+BEUDN
	uRxHetcsvlQ8mv7Sq8Wv7S1w2AmMTDP1YF+lJ7WfEz/tbMs/3G1FClZErmKMXseH2yR8qZFzdQl
	ZUC3+nNdYvgqAXqy7SSQJ4hOiFrcw6KUBiYgIW46TXeld+gz/4k9XfQL/6oB3dWDyJYnh0IgDWg
	=
X-Received: by 2002:a05:600c:a04:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a7555d89c5mr4396695e9.12.1793006948732;
        Mon, 26 Oct 2026 02:29:08 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm187356525e9.11.2026.10.26.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:29:08 -0700 (PDT)
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
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix PCIe PHY init
Date: Mon, 26 Oct 2026 10:28:58 +0100
Message-ID: <20261026092858.10591-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The PCIe PHY times out during initialization on the DART-MX8M Mini
with the Sonata carrier, preventing PCIe device enumeration.

Add fsl,clkreq-unsupported to configure the PHY for operation without
CLKREQ# support. This makes the PHY driver clear AUX_EN_OVERRIDE,
allowing PHY initialization to complete.

Fixes: 770aba46ea0f ("arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..ccc81e5b3d36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -267,6 +267,7 @@ &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	fsl,tx-deemph-gen1 = <0x2d>;
 	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
 	clocks = <&pcie0_refclk>;
 	status = "okay";
 };
-- 
2.47.3

