Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA873194C78
	for <imx@lists.linux.dev>; Fri, 11 Oct 2024 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659159; cv=none; b=OMI2y20Mfr1GYIxN5fIePuV1ZFTmiaOHg5Wauxl1D/Ofen92p9PRaMxXNvny83qFxqAcCM+6jW4WuDsxlTN+gk22Gwgzox0y2hkpOt6D3ZE6+3G1LloHCIn9fbPur8NaxGEKjobskz11if/0xGbpXZiWzbYXcMN/KSmZsuoQyxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659159; c=relaxed/simple;
	bh=vr0UmcnaAYhZzZTJilHV3JxY4AJdeK6+5d+Q00WbqBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lx22KY3AdCmcPOSbDoc2/Mg0IB0Qom02ptxMBxwMgk+OM6KWVtEDGZpZNn3uzJpvjQgtz1t/Qa+Kgksrza4v2HyAT06hP/8l1yHOiW99oxZkGuO8ePpEP4Hn6Y3FDs+DoKG0oRzg+fp3FhUKfAgFGbLVGZ6mxru25u+WJ3p3dBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ckc0EYcy; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ckc0EYcy"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9960371b62so242804966b.3
        for <imx@lists.linux.dev>; Fri, 11 Oct 2024 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728659155; x=1729263955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwFmMBQpvB09DklGuZpIpvbFiWo+i75RNFs8vYOVIHk=;
        b=Ckc0EYcykcoSSMP5NXGXdBDBq6IUzoqkpdtp2pCxUVWCS3L72OLyq4qjii3Z4j2HMH
         yPRcXEr5O7GlgDIOhIR9iJsaXF4+HQbKmeFF1Y7SZbHHDpauwV5OnuNrjYLtxN/RsMQk
         0JiN0WvpTARz/4dpY/SXXS8zXqMBZuzfkKbHlME0+lOwZ/XCR3waibhJWhuPlGuoXYip
         8CbLzLpjZIMqkEa7IOZFaTHC66ONSzEGGzK/A5HaxAjjH87Shke/tNeQTzqjCzs9hoZs
         v90shozkLy4FDAqirU4fNKMbSwfOF7huSE6jQK3PJnrxyaLSsKma9lPVnHdt6xqE15Zq
         /O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659155; x=1729263955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwFmMBQpvB09DklGuZpIpvbFiWo+i75RNFs8vYOVIHk=;
        b=W2m8weP1zTBkYt+7EtpfyvT9LPF+Cnch02IocIpiEB0EjtzvvYYi4yigWoztsxqAFx
         9s/RIqRoTI9oAq47EEZCVslC8BOxqm6iMGML97cSqUoysnS4Zw1QC6wXUYGM9OQk97aD
         kq2TdR8g4DUrEMUdvKvhz4AM8XwB1Xekhm6eyA5wQs5oXnEj0V+jaX22ocoSVtgSA2Xn
         W3avHwTRJD36Ge5K/t+XAXD/1N0ddoUjUpycBlNCPVqwyOzidg+3PgQxTSFk306ZNn8C
         Vyj8R0qGyvU3ZBarlgdzgnqj+y9XT2rL0FB1W3e2uHuRMWv81ZZOTM/o8h6Zr6uizhB6
         Eflg==
X-Forwarded-Encrypted: i=1; AJvYcCVyjRymMh2tM8LH3KD+a9GUCx9XvIFxoil8kM09Qh1Z4iUaBFps250e6okziv0alQOt7eQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeSQ+WR7qtu5CTFUORNW73gWyMDmMv6OcPjzX2rjRY/PcboFkD
	GFQPJPN1wTSvZ1wB9nwWmwjmJnMyn9kk9gkQN5BSoMbo1SJz1cxT
X-Google-Smtp-Source: AGHT+IFgUEPF+5evxRwSi49X2ukDLzYTC+t6yJMgeOY7nvbeTzeO4nYl+8niLu+yuW1dInB/APU9eA==
X-Received: by 2002:a17:907:e6df:b0:a8a:91d1:5262 with SMTP id a640c23a62f3a-a99b957fdd6mr274182866b.28.1728659154754;
        Fri, 11 Oct 2024 08:05:54 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5b0b5sm220879366b.94.2024.10.11.08.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:05:53 -0700 (PDT)
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
Subject: [PATCH v3 3/6] arm64: dts: imx8qxp-mek: add dsp rproc-related mem regions
Date: Fri, 11 Oct 2024 11:04:36 -0400
Message-Id: <20241011150439.4027-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
References: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add missing dsp rproc-related reserved memory regions and
assign them to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 936ba5ecdcac..4c4e71d39bac 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -21,6 +21,24 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0 0x40000000>;
 	};
 
+	reserved-memory {
+		dsp_vdev0vring0: memory@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: memory@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: memory@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
+	};
+
 	reg_usdhc2_vmmc: usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "SD1_SPWR";
@@ -63,7 +81,8 @@ sound-wm8960 {
 };
 
 &dsp {
-	memory-region = <&dsp_reserved>;
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
 	status = "okay";
 };
 
-- 
2.34.1

