Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA02A22128B
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 19:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905192; cv=none; b=iCokLR82KrIyf1TdrB0CDPNhh2ZbuLyDynof7aadcXgfzaSb7OQ51i+N76vXTC/qeNZYmhDqDLExg0BCTuOgBmj16aYQ6TaKCL1pBNVST2Llhtg9F8YjuN9OMIZQA8jIXD2eVnJ0OjavFbRpafpnPG/7h6uKUDs7XgegsBSghmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905192; c=relaxed/simple;
	bh=kidXAy0mvcs3fegsiwVQUUCUIiIdfC0KACC45Gf8Baw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQm43bJ3/wFwAwJJAEpLTE+u85OBSjCwwOXy0JgzxLoCdVP/SQm4yru178y/ttUqQhJOGYAwkpLFzEik4X8wykyv3ZlneATQV1rrESENPM1kJN9tPsC9+XwN7TmZ6Hf112AfFMckNafM2Y6AKvxmMWpZzMYWOFimUc1yIm6+sWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aek4YHyw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aek4YHyw"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b782cca9a0so155084f8f.1
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905189; x=1754509989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIjCGhz8tLixz44uwO4xKNvBCCKp5RNzQO4yWFCNcHo=;
        b=aek4YHywHfNSqAWU53R1Xzcp3DfZ8oVfnhyK91aedfeRxXmT5q0EABtVXYQrtKqEoV
         GIMhI7E9KsY7s6txOr/EI3Kjt1efYFwIYN17jP49ARgtqnAIigtK3MydVDXcmjfYD51S
         SWQ7dV+n7C8AdngMcu9UEncPaG+TJezdymLldqx4eI3N4/bxcYnK6niKwAEge3WwKYzF
         cThPIGvPmvGHFwvwuLTo8ahzOs+Nfv5nORg88rWNv3Kq9/EAyVrLvoLTsgefBtK458Qk
         6leXNZ40ZZGIKUxiA9KkiqDzNbYcHoWlsjoX0qhdilm+4dDWmYdTI7KutDrGtY6C1SUj
         b5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905189; x=1754509989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIjCGhz8tLixz44uwO4xKNvBCCKp5RNzQO4yWFCNcHo=;
        b=AfwH5lw3dbbWbsbTsIoThCP/YkbchLyl+CD+wa1GZIGwPvy82sFcS5a8PkQquuOe1/
         kLwalR6ojSlM9/4OA3iUgAQ8sdE3K5NeGDeueWRI6x589nuSB6cHqrVF785By+hhuS0v
         cNS8la23BWYTtuWAdrC+ewAOjFKlOqp+GtSN6sqVCy+61Xc7TfJe/wLv2Fb+eLDbY83L
         0a0l4StWt2yaM93QQ/ZKWiRCenXqHEquv/iTpf/QvukwRO/zuzUGY8LyB7RXOhUn1NTZ
         5cE5xA71AmIrPZ2JMv0vJf6gaBQUWfbWc+jqxmrixxwn2BlEAbeH5nv2RmICHucYBhgq
         KkWA==
X-Forwarded-Encrypted: i=1; AJvYcCVHLW2ChpfVJqEj1WX8tUfEhskUDRjKuBVZiO6y73bSXOgt0Jk3m7m70bLdFE9TkkfSrXk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPWDXGajbjgAZAPtJ1fWTsSGGHgjp6mDZKuX/xKFoYZsLxp1GW
	H7j/8R6lukEOl6RekzyGsOYiK5i6AxeNXef6O5sHH+hlFNA7q5roB1UpczjdQk+HyMo=
X-Gm-Gg: ASbGncvK4bdKMf5mwIgfb3r4RvNdjcuwiiIFl6YVETS21qXtnmorhDsufeuMFL0MvXw
	ggIhxeZ1K978bEqPecQrUwHnLvDVdOKSxAIWmApaZDTtsSBS+qm4FoRZrnlb7xCoo+g2ie0vJqA
	e6hEkhj8FmbMlBbkE+yftwPzqXOLcEGii8Q4r0P041WboIBn5tSFTxBD5zVcUmGeawUm2JAbgnv
	TBYmlL4roLJfTu1/TpqZOus7fiB8E3x/RcsDBYXSjZOgXGCu2xT6dtEzaWQuDMExiL4PWSquc2d
	Et38Tcwp4gVk2ByQ8cu49osjfep7FmqxdQCw1d42fkEx1X0Z+uwRNkAvifObI4UrnmxnjqZRqsV
	G5aSCZsRa7FfbTLK5y5sH5RHxT0gw3a7zyfgk+wPsmA2TsUFo
X-Google-Smtp-Source: AGHT+IEmsYHO0oNTJZYruShh/TW9R20EpAqhA//OGFPfdlNYdNfaTg5M72i1uh4bkKDQ8O6mJZ4IOg==
X-Received: by 2002:a5d:54cb:0:b0:3b7:889e:2b2b with SMTP id ffacd0b85a97d-3b795010da3mr2683397f8f.47.1753905189071;
        Wed, 30 Jul 2025 12:53:09 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:08 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 6/8] arm64: dts: s32g274-rd2: Enable the SWT watchdog
Date: Wed, 30 Jul 2025 21:50:19 +0200
Message-ID: <20250730195022.449894-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SWT0 is directly connected to the reset line and only one instance
is useful for its purpose. Let's enable it for the s32g274-rd2.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index 505776d19151..4f58be68c818 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -56,6 +56,10 @@ &stm3 {
 	status = "okay";
 };
 
+&swt0 {
+	status = "okay";
+};
+
 &usdhc0 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc0>;
-- 
2.43.0

