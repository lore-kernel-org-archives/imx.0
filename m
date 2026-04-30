Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA454266AE
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555308; cv=none; b=I6D62VqkAi1zSfvWjKhR805TCZE6N/LcRGiq5exp8HCLZTwiqAFyDJm+9bOMQZFKWV0N0WH7qGtenowUlDjab6hZKY5g3GTCO/4HiQWzmHoqyCpVdnNbuCKFJBBvk2JPlKWdOF6/fX/8tOmj5/b8ebf4HQW2XcZL8CT5ZpPBkl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555308; c=relaxed/simple;
	bh=NwNLBanCJfWdivsHH3TQq4KhfsrK1t6xAmGPuWJEvUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeeLQX3GiRThHVG6HBR5oOKkRmyOJch/crUOnO0LjObVeUV8UdiItCBsDlGLiJOJrDTR0ufokix1MBGpLfYTofrzynz9pckDR+9dL2C2LWq3gkfGMBLKlLI75UyjYXBv3ZauWxPm+CwMVZW99+VCasGzDhthpNMxuK16tiU5F3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=fDIkkp/W; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="fDIkkp/W"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso6514825e9.3
        for <imx@lists.linux.dev>; Thu, 30 Apr 2026 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777555305; x=1778160105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KQEi+9Iq6a0oI1284HueD/sDdeYdOgMZIf6VRafu5Y=;
        b=fDIkkp/WjltIqn9o37mzJyyBcsfAH7H0+vVHteXBMTKIFATjO/Qsbr4gEE5nDgAdrn
         yLtIDbw9eV9Umay10QDuYNsq99iS1Hk5fdYnKM2/6t+0su8FvdXyYOQW/ZkcUdrM6aYW
         f2L4skC+jX5TI/fEOdtr/CYnfX7ddvzQRLSBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555305; x=1778160105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KQEi+9Iq6a0oI1284HueD/sDdeYdOgMZIf6VRafu5Y=;
        b=W+O26SqIcEV8rMhCQYxH6ftnREeoBWX4qR3wXwhqZiXaMyQdsUDotI4Pg1C6MCZAeO
         +dEaT14jNA8Fj4SRJ9/xRHwQQBRBhxV7Y9obOFkUTqHw93i6+p//MaUh9O5wfZz4Ouxu
         pkICK0S4BdNLoMxylMpCnGx7+vq3XuDcf/Ngh+RpcstQ2vfoR/Ry8hfkJ6+y6DiCfNdU
         lgGpJHdeB/q6231eLlOI6LgZOBlD1BREI6wmYdrg3HPpv2s3lNetLCeoTBiAaaEt7QJz
         mF7LMDIBXUvN2Nv7JKKiTeXS45WzcNZHvSvXuaygsbUYJEhfz4v/5JhZDbDaNdwL3fvY
         ghGw==
X-Forwarded-Encrypted: i=1; AFNElJ+oQUe8Syjf2Znxspve6YczS4zIe3irhNBOsGBMACEYqXELWwFXlJa2jET08pW7TVfXq5c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yygkl6+P0lVuCwAAVXFWLVqFlqgTM7GvRkY97XKg8cpxG0ddLnP
	SOMQ/namVXjOjS4vGFDTFHi1dh78BoD2EIvGuevlNsOfXaOI6M/oQiol1T6rbiMHNi0=
X-Gm-Gg: AeBDietFM4zDm8FLCLBtDu3rAP5sxOIAm9cmcjMyvNlQzYveIlXhDl5petayqdVVRVW
	7tRr9CcpzLNTyOuRUvpNw5bXKaB2CDq5IoJXikpUpBclvLx415R/u6KQlWPEdO3aNQJPPY59VcP
	9Cf5oeFMSE483OfsCrrJ950NawfKIe9haw8mui6a4xEegmg10zVHMZY1svBCI8o/uYU+57CnIFw
	cI01cWO5V1ayvmBiTMVS7OI5/3IMxLEuGBYf/bFjyo/e0IEkLKEv72K6DaK/6bVS5qInT/U+shu
	0/DAtjs0PaKCjMtoIzA51GrnEXtZetzsk1uZ5+bGsIXRLsMPmu/6weXdgAKoZ4bEQP1XeuRFBAm
	g0pRC8sy1OLgPejSXRbCU4tkTYuGVHG36vL6lXP61pakm22KuoIUVoPnG/azUaL0EuJvB4EDUG5
	PelEsmGAnO8yP9hqMyKkV5IXbACJcxGRD3XbnRgjkAaLGkVH8PoCn2qLpWyc1gXPO1nCg=
X-Received: by 2002:a05:600c:8b04:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-48a8445fc28mr51917765e9.26.1777555305440;
        Thu, 30 Apr 2026 06:21:45 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm106210325e9.13.2026.04.30.06.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:21:44 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	m.facchin@arduino.cc,
	dmitry.baryshkov@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 1/3] arm64: qcom: agatti: Add dai@3
Date: Thu, 30 Apr 2026 15:21:38 +0200
Message-ID: <20260430132140.30369-2-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

This will be used for audio over USB-C in Arduino UNO Q board.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1e..01e98ef52271 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2275,6 +2275,10 @@ dai@1 {
 							dai@2 {
 								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 							};
+
+							dai@3 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
+							};
 						};
 					};
 
-- 
2.53.0

