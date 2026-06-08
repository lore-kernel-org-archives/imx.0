Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1743D7D82
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929694; cv=none; b=E09Ve0BE7y7YStFAXrdFDihDdZ3kfvbbAucTolw09hKTzDF/uSLwuywymMeEdglPKk7CBk87K9i1kO4/9Wa65N4m3TD3XNtPQknxk+5qrctglc/KWX+MKrDnBl2WGT7UW2duNU1xASr42+zZh9mbcVxAWN/QTNKPbUgAkNAhSds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929694; c=relaxed/simple;
	bh=MkKtOKSAFSfH3HpuvW02i0uEm9hF7g1DUQA7Q9AMED0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3lgBXS5lukFAGRyd4fNo1a1PkV25LvibPLCHLD+Yfmx3d4uw23XjDGd2wBzjYC/dG9BTqq13H0JVW3S712hkJrcG5MkCkY5TwjM1X4oWoZkpJmX3VHxCX3vUu3D+G0zqLBAM7iS1YIr3VFx/GZJAapGeaRqoff7kjcRPJi7Aw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHBgnhFD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHBgnhFD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef616daf6so4019078f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929692; x=1781534492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvRlDNPd907U87yIndLhCKBBwk0x0oHkEk0pAVg2DU8=;
        b=MHBgnhFDGHo1dySdxuyiZ3FsicSLdrMjtvephEAiCcHntKyjMScoi2VFGc41vY/yiQ
         h5Dav22B6XUB8ZSWvrecY6MNY1RUrhI7sOZTqDiaro85/pVV7SzB0bCki5M+b5kPNTJF
         In1LGL5xnIVCzjPhqi3RP+K77tiHg02sLdtxfZPD8abYjgwo+jqMoj2ECgT4si7vR87y
         WRvTLMAs29ZArWJb/XKGQyZUrxp7fEyWPKUDTPerdewr1wJqfd+xaeNOHw5FwwrnutF6
         e22wTzPxmGnVavvSl9k7lfbInBNlnLAbZK4g869fEyS8J+kt7XOYB6CrxwsAGzgql7iE
         fyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929692; x=1781534492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvRlDNPd907U87yIndLhCKBBwk0x0oHkEk0pAVg2DU8=;
        b=gSE+vp2YDCiY52dAcZn7gJXxa+Rj2FHnf0/eZUYDe9Z7HyIaz4pe8fPKIR+AxVfsc0
         pBEevEHLkui8OQfj4pG+DVdotO5R7d5kZYZMjpKZRhZmi1Pbm/q7wzBAvTZZekYKxNnw
         yrgCH/J2VKCOfso5xuY5cv1jqrFFouxVtn43QQt+hY3zXc7P2465ZHV3KmGIy5nPfio+
         52VQqNweP++hS/IXvv3O7mkveA2V5zD4C+iikS4lqZPUE+N2yU7hCEOfTIClmcI7yUCF
         j6VJeAWYvice+jJBhegIW9UpampX22z/12QsktmZD12PeX4KHWDrRvTnkDRClqVBzjyP
         eg8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9B7e3Havph6GhyYWRS4ylVnSPdZNHs38f9TqVk66MRqCPqguqSCSZlSLoB9s8QRilt6wc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ3E3rbc/yMPTV/bfvpbTQH1uCCRfADt4VNRea2QT+RJxrB2Dh
	jW59LFveBzQoN7GNfkopz07W9glMW1i6XssfQBhJlEdrItLRCh5oOL8ul7zJyw==
X-Gm-Gg: Acq92OF2+Y0ycHO3O/7P0IVtUta6/uIj57apDVKMhsjKCUaV9lZSepiAnXdjqfwJnDV
	sTkizBmI9R0Tg3G3ASoMhWf867csjiTk6vSBXZHwXADyqVZ6PsEKHnbwhYWZ8op8AXVbQ+JIk6+
	LlGH+TWqPLSTnxMnPuTZaOW1+Ej2J//0hVwsWmcT8J9Hn+fdGhGcVfdqNNjQ0bDMmAW2QV2A7vM
	otnohIGKR84CZDVeDuI4Kchs1sN2px3r/barkjjx/DF+klQu7ZMEACPFN5M3pMkrM+iVmqJuWbZ
	WYea7kWz1CcIvs9F0qnXotJArAfUFrO+q+9IJP8y+UpLFbN98bsNhFLUVrd2I5RKRRD91okSQFq
	Pvhy6yG887nDCjQpl9xF80PDtmJgddgqPBFasjv6mWyHRMwkdnyVd2EXUp7fOKoph7NlvFbFsmc
	+NbeTdnORm6dgluWPg3OK1pnB1FgFM+lJlDxQm2SYkAIN/KEB9X+rxpucG/f1Oi9PNT2sm4rsK3
	AL5OfFva/tVUHCp/CeHMRrVoeu49yHp09kSJ2HMU8PkFUoD
X-Received: by 2002:a5d:4610:0:b0:460:e00:1215 with SMTP id ffacd0b85a97d-46030617c50mr17401096f8f.31.1780929691647;
        Mon, 08 Jun 2026 07:41:31 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:31 -0700 (PDT)
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
Subject: [PATCH v5 08/14] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Mon,  8 Jun 2026 16:41:09 +0200
Message-ID: <cf961b59769f34505a9b6f1f73849346c57ca7c0.1780929317.git.stefano.r@variscite.com>
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

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 0beaee5f81c9..f8a4b5b2e9fb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -195,6 +195,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -306,6 +321,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

