Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB573FB9F
	for <imx@lists.linux.dev>; Tue, 17 Sep 2024 06:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726556315; cv=none; b=QdRnUlmMfJM2WQziZ49mh1AXkN+3tl3ujNHwgMK9WBKwJx+YRsfBIa042D5WJgLcCNNtZ2CwXItAvxeGuQ2pbxrhmgaRkx2IbOpV2X0SzK+F83rhlphyMSQVmPV/k4gnOHNoBUGnSv8tzoBLBSUtlxvEuLzZo4hD7rZaXlYyY8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726556315; c=relaxed/simple;
	bh=HvKjEaTed6/+RfsVR4nP0piQihMfmcB16bZRUl8o+qs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ejOPa9lAMRhPu57igV1o3ChavQNY6sS2vRy5dsz87cemTRFfLF0cmZVP9s8+9YJB5DauCKzJZL3OgysrGmqDsyCQWV1ue51fJvJgVsxrHP9nvLn0KOae4CIF9dQSdvQAX1ZvonZZlHpeCCcJrhKaTXjTg+U88t68o58LfDCVA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKrJBZmL; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKrJBZmL"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5365cf5de24so6702725e87.1
        for <imx@lists.linux.dev>; Mon, 16 Sep 2024 23:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726556311; x=1727161111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7wsxkt8kD2tv/Cwg977j2CL2XAhPdhs/VJmk8MeTU4=;
        b=AKrJBZmLNB70U3AoeO5aKk7aWDGA8N2Oil3Q6mi4i7HuOgju9txTNvL+WsT4L94fx7
         NAKyG1WQkTCUYX2RhJwi+PlCLbCxmAA6aZrsP3WtvUfiBkzATMwDusrS+CdnOWUMMWyf
         eHwKj2fu+78k90QT7bFu3ctWC1vJsM2gODEYAJEYt+Nsze6j7yev0NXezTETxbctqQDd
         9PU1KCpr42F9NH2hdyE2JUx9VwK5HFKnuvVDs46j+Pn8MMxIJRjo0tVuIrXWKLzKysWa
         xGLMGhelNX4v7fPF5fywcd77Fwbte4f2mbWigU23gM8iSGV2JH9Jj0QZjq7hSdEKqhfe
         K3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726556311; x=1727161111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7wsxkt8kD2tv/Cwg977j2CL2XAhPdhs/VJmk8MeTU4=;
        b=VtgNxRdJWHJnzR8sjsjPeBoViBTY5qmgl6fsOeKn59d8Ytb912SbwB0023FwUEqbId
         c7hCOlTkDWX6E0ciq7FtQjMziWQw3cCF1vWNxAcYpabxnek/rWM7jhJK4EiKvZTdkUVM
         G4td9rUN26zAj6FgXX/xqGhgSHq3fMU5s4OpvjR9IpHN7P8gFkQBIXcw78sSc0NxDtxD
         dJkLkeJ6WtEe8qaQw4j5Ff55oupbJ6wegIMrPMi80SLAi9tmHohNCjkzBrVImX3YMWyy
         gh6+zjsoPnTcn2VKOGRh4VnrsgoRa5Ul4Tir6RYx0ouWz+zs6HCg4xl/Z2ZHe5W4rbj5
         Ux0w==
X-Forwarded-Encrypted: i=1; AJvYcCWh7mYk28Vn2LJ1vbbqf+eifH9DDygzFPCOegHtSIsZcmO8blIezHf+yQlLDK38ONScLt4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8KsEgFiiZ1Ledpm8rfi64Mc6R+npFIZtGU91eTWCLX9CbAOwS
	/aPdeJRAgZeBvhzF4SJ/vZzj1QiSbQHbBhiUzJNEF4u7oOUSFRo8
X-Google-Smtp-Source: AGHT+IGkjhSF7e+whaWFPHV7ed3DYwsF94+etu0W20gL9z5Qoa7dvhLLxv9lP4XynRZRJ9Hm9pDrxQ==
X-Received: by 2002:a05:6512:ba8:b0:52f:413:7e8c with SMTP id 2adb3069b0e04-53678fb6a90mr9664342e87.14.1726556311324;
        Mon, 16 Sep 2024 23:58:31 -0700 (PDT)
Received: from ld-100007.ds1.internal (77.119.220.220.wireless.dyn.drei.com. [77.119.220.220])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a90610f4510sm405100666b.67.2024.09.16.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:58:31 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	diogompaissilva@gmail.com
Subject: [PATCH v2] arm64: dts: imx8: Fix lvds0 device tree
Date: Tue, 17 Sep 2024 08:58:01 +0200
Message-Id: <20240917065801.2579750-1-diogompaissilva@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some clock output names on lvds0 device tree were duplicated from mipi1,
which caused an -EEXIST when registering these clocks during probe.

Fixes: 0fba24b3b956 ("arm64: dts: imx8: add basic lvds0 and lvds1 subsystem")
Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi
index d00036204a8c..dad0dc8fb431 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi
@@ -14,7 +14,7 @@ qm_lvds0_lis_lpcg: qxp_mipi1_lis_lpcg: clock-controller@56243000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x56243000 0x4>;
 		#clock-cells = <1>;
-		clock-output-names = "mipi1_lis_lpcg_ipg_clk";
+		clock-output-names = "lvds0_lis_lpcg_ipg_clk";
 		power-domains = <&pd IMX_SC_R_MIPI_1>;
 	};
 
@@ -22,9 +22,9 @@ qm_lvds0_pwm_lpcg: qxp_mipi1_pwm_lpcg: clock-controller@5624300c {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5624300c 0x4>;
 		#clock-cells = <1>;
-		clock-output-names = "mipi1_pwm_lpcg_clk",
-				     "mipi1_pwm_lpcg_ipg_clk",
-				     "mipi1_pwm_lpcg_32k_clk";
+		clock-output-names = "lvds0_pwm_lpcg_clk",
+				     "lvds0_pwm_lpcg_ipg_clk",
+				     "lvds0_pwm_lpcg_32k_clk";
 		power-domains = <&pd IMX_SC_R_MIPI_1_PWM_0>;
 	};
 
@@ -32,8 +32,8 @@ qm_lvds0_i2c0_lpcg: qxp_mipi1_i2c0_lpcg: clock-controller@56243010 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x56243010 0x4>;
 		#clock-cells = <1>;
-		clock-output-names = "mipi1_i2c0_lpcg_clk",
-				     "mipi1_i2c0_lpcg_ipg_clk";
+		clock-output-names = "lvds0_i2c0_lpcg_clk",
+				     "lvds0_i2c0_lpcg_ipg_clk";
 		power-domains = <&pd IMX_SC_R_MIPI_1_I2C_0>;
 	};
 
-- 
2.34.1

