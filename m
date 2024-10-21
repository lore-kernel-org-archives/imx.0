Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A691CCEE9
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525987; cv=none; b=CY9dZUVXdlkSiQMz6e4hfMV5Mi8mYNoATnz/uorg+FPSvI3eApHsoSb0+iC3vTDB2pW/TeW5B2SZI3mBmd/xOIOXIz6p+UQlA7bqavHPCzO0uTeMsknkyCjq1aec6Bp8qhsBL5/MV3q6xaZ9tEY7KwzE1ivoEVwzwvbqenRO4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525987; c=relaxed/simple;
	bh=aHNIg5OGX+TEVsp9sHHJ9mDSCCmiLBrqL7nScghLPQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X6wQADHTdgyXJH91ayeltVPL6u3eE24q+kzBUTLX2ruE7V7cqqLPaSPbezbHxDdb26uc42vHtZFqoXpVF34lTayoZUYddIMggLHNxzGBBjpNwF3xQPxojH8ef1RrKuVAWdpboDLz1YbfRqtmWfnpZAinG9fGqFxt4tdA4Jy2vb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGHXHZo5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGHXHZo5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so6048933a12.2
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729525983; x=1730130783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8NU6xaU+/gHYs3WP937bfG8Ssm1Eyb+DSVQQgrlKdA=;
        b=eGHXHZo5JVgc5OsWETvB5uyDvQe/c4fHKFZ4B4XcfGmgOEYQNOKBG6mFF2gWzUdv9o
         Fh27V3t5sQ98XScu8sMFD0O5aHHIlXAKXQgEfEwgJR+6R1JonLASYDtRExdjoL7BQ6lB
         dmKttZCN6bOWAJ72BDsmFsQfOpAkaykhEUgXD1mfgfm3G+A+iTxnjFI7f/dkW2b8XNgl
         wYgP/BKBETmjlN0C7ymwsw3vglsx0Fd+YbgM3RqL02aQlki3kZ7uo1LsYzolHbLPWcff
         xMPyE3ixQP2StIHnV6bMIpmr3F/PZlx8YCJ7elty5G7xNqRr7hqdRsMcv0aC4WXkMRtE
         eY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525983; x=1730130783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8NU6xaU+/gHYs3WP937bfG8Ssm1Eyb+DSVQQgrlKdA=;
        b=A5t9truTKjq7O3+rOFbVPf5RBwwMvEpA7VhyUDDxYbtuJrQYf0+SMhIWiAko4rZY6v
         F7DDOZojdRHbtpaHrB1Q7Ql1uzx6Pb36C7gz5lCH6U4O53cQdmmFUAEdjdwbkvuI4qdf
         SQpFqCFyjUDPd2yJ/ZM5tH/RwU34OdV3L0zlJ6Y/XCD7aN+VVBOrP2fHgnsZePv1lgQA
         e9qHdv4s7lmF4G522Q5fJIGMrz8G2yuJrfX3TesxnNWllZrS0qGcuyoluGS5g0vP6zvG
         y5DVq6hBm/lvqfd5thhyQD2wE8B3DrCMupPi3ATxcNVRGfugAHvFCsvKABroYmv7uFjT
         6Haw==
X-Forwarded-Encrypted: i=1; AJvYcCUc3oy/qQGuYlEFbrbjC8U5P/9Kz5zBFQJikT2aUM2ntoqiDIaSNtjMp71WngzAR+9NtuU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTeRZdQOPZmJvLfKRV6e8K3CvVPumEK7raSUAY8O7p1lC+J6wk
	osTlixAYXM/4dYOv0nBU+95u44A9hgzoP06cCMIuWYQWFC1MxSrCjUcNae0N
X-Google-Smtp-Source: AGHT+IE7VmTplSzaBge5LnjVsaDHPckhTTbMQH/FFB5snlb+eRZHFk6ZJLJ8QNK5VZw5GdOB9/5Klw==
X-Received: by 2002:a17:907:7ba0:b0:a99:caf5:c897 with SMTP id a640c23a62f3a-a9a69a752c5mr1147624966b.20.1729525983134;
        Mon, 21 Oct 2024 08:53:03 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912edfd0sm218614366b.67.2024.10.21.08.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:53:02 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/6] arm64: dts: imx8-ss-audio: configure dsp node for rproc usage
Date: Mon, 21 Oct 2024 11:52:17 -0400
Message-Id: <20241021155221.112073-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
References: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The 'dsp' node is currently configured for running an audio firmware.
Since the firmware requires that some audio-related IPs be disabled in
Linux, this will clash with the configurations from the imx8 board DTs
(i.e: imx8qm-mek, imx8qxp-mek, etc...), thus making the dsp unusable
(since the firmware won't function properly).

To avoid this issue, configure the 'dsp' node for rproc. This way, users
will be able to use the dsp alongside the board-level audio configuration
as long as the firmware doesn't need the audio IPs.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx8-ss-audio.dtsi     | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
index ff5df0fed9e9..a60ebb718789 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi
@@ -431,22 +431,19 @@ dsp_ram_lpcg: clock-controller@59590000 {
 	};
 
 	dsp: dsp@596e8000 {
-		compatible = "fsl,imx8qxp-dsp";
+		compatible = "fsl,imx8qxp-hifi4";
 		reg = <0x596e8000 0x88000>;
 		clocks = <&dsp_lpcg IMX_LPCG_CLK_5>,
 			 <&dsp_ram_lpcg IMX_LPCG_CLK_4>,
 			 <&dsp_lpcg IMX_LPCG_CLK_7>;
 		clock-names = "ipg", "ocram", "core";
-		power-domains = <&pd IMX_SC_R_MU_13A>,
-			<&pd IMX_SC_R_MU_13B>,
-			<&pd IMX_SC_R_DSP>,
-			<&pd IMX_SC_R_DSP_RAM>;
-		mbox-names = "txdb0", "txdb1",
-			"rxdb0", "rxdb1";
-		mboxes = <&lsio_mu13 2 0>,
-			<&lsio_mu13 2 1>,
-			<&lsio_mu13 3 0>,
-			<&lsio_mu13 3 1>;
+		power-domains = <&pd IMX_SC_R_MU_13B>,
+				<&pd IMX_SC_R_MU_2A>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&lsio_mu13 0 0>,
+			 <&lsio_mu13 1 0>,
+			 <&lsio_mu13 3 0>;
+		firmware-name = "imx/dsp/hifi4.bin";
 		status = "disabled";
 	};
 
-- 
2.34.1

