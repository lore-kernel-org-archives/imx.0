Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB9198822
	for <imx@lists.linux.dev>; Fri, 11 Oct 2024 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659164; cv=none; b=sISRRR3telUldlb5Ut6HALeXHHH8qw0/VA7C4adDYkbd4qgebVYZ5mQQ7W+Jt7UGt8Lsqw0pTX36zhb78LmZCzV/3o0qAiDR8UxO52VLGhoijFFFMSVuzhZKE/6giF+b4W9dtkNCi7UxP6A3marnmL6SZeHra3j+WYwLCjp6yHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659164; c=relaxed/simple;
	bh=HOrUBsmnTP5kUCPQrgNppvm3i8MgiMn7KdUPyymMl5I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YPhynN1Z4e/pX+oSI1EapLy3whhmGm6d45WsAPk/FJT7ojGU+9E09CnvmqLkhFB7xAEqfkOwSa/N6+68Upeyp+I3bJF7GV9EXUfL8CZjrIg1S0PJogsCS6q9BzmkHnaO4qCNMTxZQFnYoc0GX0IJYnVJMAT43iu+shhPaji32AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5I+mLz7; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5I+mLz7"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53997328633so3674169e87.3
        for <imx@lists.linux.dev>; Fri, 11 Oct 2024 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728659161; x=1729263961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqRNfnCg/qPRyymj7N8Ka+MkmJ8hZ2bKmM3stNf1O/A=;
        b=i5I+mLz7w6TD78nOlCe5BVX6wxAIOEPoEjzj3tYTcoPlRtVOV3RvyIL7sKtJAWc/ib
         3lH5NJaW9OAhOAsQJql1Y0B+3pxQjChQHpTBRvSIUMTerrDpSN5f0GdbvDK7UvBQ5xZe
         ekIahj6y8MMBjy83cZjWZpF+rFztTTvp4E18iO4Gqlf6OFZwhWva02vuQo/ms9Qs3YPm
         apPTjXjSvcnCY7weqV9uaCwaIB980Fetfh2hKz2ag7LXMjUte7ZTjkA/6Wg6FOYEMpdx
         LUENDZdgJBrJwfOfSDLNcUSw/PkLn5Susj5+A+e/zVDEsJgOe9BdvJlkzVWssfSnKaTe
         DPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659161; x=1729263961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqRNfnCg/qPRyymj7N8Ka+MkmJ8hZ2bKmM3stNf1O/A=;
        b=BXZqG0VWNp/mt/kirpGO0j9/cONGAVu46sffUqqCAWV8CXE5ipK7odce9Wd3iQY/0w
         ry5ZZXyL0bmM+hb0YHJ6KlfMCSz+GrZny7fzP2SICj/2pPbVgTqT8xa91a7Pmzk8Xbm/
         N/Mk64ptIjhALK5y0FlfimMjumvcsDSzKGykuvzdxginaTgUAI4gkLxzz3MLXcHIjZdm
         vtLxUMjAN3JH298+DjdRGERQg7gq3i4WtAewL5o+v2X/010cF7xlojYkuYm78NgHrbyt
         zhpmDhMwbPYlbbCOVkK21HIqRA52npb24vm2yhwDemKj+cZdiZqReou8iU0RoMb95Agz
         rdDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTYa+S2BN1bKJAQ0iGlMJoHoc7ylLGAgz4iWeKFZKgY/XlZn/XN2hIzZ9UrigymdHGDs4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNFFZAY1NLRN2G9+jUayjIXE7CFRsI+RJJaWNAmjQ2Rb30jZKy
	SKMRdd+/wUbKkexaUxiz8saoJ7uuicT7OdHZIh+yKueILgz4Y7Wv
X-Google-Smtp-Source: AGHT+IEKT0YkXSTJh2zrXW7Gn7aBjsFlDsfYaG04GDGzDuTHMb+ZgvkgKBp+eaHUzrpn0jmr8e3R7w==
X-Received: by 2002:a05:6512:1113:b0:536:55cc:963e with SMTP id 2adb3069b0e04-539da564a1dmr2617584e87.44.1728659160589;
        Fri, 11 Oct 2024 08:06:00 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5b0b5sm220879366b.94.2024.10.11.08.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:05:59 -0700 (PDT)
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
Subject: [PATCH v3 5/6] arm64: dts: imx8qm: add node for VPU dsp
Date: Fri, 11 Oct 2024 11:04:38 -0400
Message-Id: <20241011150439.4027-6-laurentiumihalcea111@gmail.com>
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

Add DT node for i.MX8QM's DSP, which is found in the VPU subsystem.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index f8b577ebdbef..74857a94bcd3 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -581,6 +581,32 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
 		clock-output-names = "mipi_pll_div2_clk";
 	};
 
+	vpu_subsys_dsp: bus@55000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x55000000 0x0 0x55000000 0x1000000>;
+
+		vpu_dsp: dsp@556e8000 {
+			compatible = "fsl,imx8qm-hifi4";
+			reg = <0x556e8000 0x88000>;
+			clocks = <&clk_dummy>,
+				 <&clk_dummy>,
+				 <&clk_dummy>;
+			clock-names = "ipg", "ocram", "core";
+			power-domains = <&pd IMX_SC_R_MU_13B>,
+					<&pd IMX_SC_R_DSP>,
+					<&pd IMX_SC_R_DSP_RAM>,
+					<&pd IMX_SC_R_MU_2A>;
+			mbox-names = "tx", "rx", "rxdb";
+			mboxes = <&lsio_mu13 0 0>,
+				 <&lsio_mu13 1 0>,
+				 <&lsio_mu13 3 0>;
+			firmware-name = "imx/dsp/hifi4.bin";
+			status = "disabled";
+		};
+	};
+
 	/* sorted in register address */
 	#include "imx8-ss-cm41.dtsi"
 	#include "imx8-ss-audio.dtsi"
-- 
2.34.1

