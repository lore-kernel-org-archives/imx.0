Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6FB39AD3B
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 21:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397717; cv=none; b=FQMQE4/nrLkSLx10fylEVTETCuVRSXCNh6DolGT8Tfn6rYvemegPNWqJ7P0Td8T4T9qy0ljocgxhuF9PPK7Z8CPyJhtlv5XqQftgJrwMEn6obMGAE8YJfLPKS7gJPoEuK+QjqtNfsSPyqFWZkyf7QrUsRVKg5QnyIk84fYs5AVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397717; c=relaxed/simple;
	bh=CgrdsEAeyUWGXWmt1TyNpvrFyX5I14CiWtQo7IqLgss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TIwlC2r3BY/sVRYbSmXyS0iZ1IIMysg+N1hK22Xk6oWFvaY+XlUbjKKrzweNG8W0XntjRLHZIgVC/ctIciNus8ojo1Zx8vDuTzgLGLrLivLbkDDN0pfcz/uLvNm7oW1CF6bTJDUyl6OulEt805QUUQd2RbG2RwyPMTMg9n3VkQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=DUDyNCEt; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="DUDyNCEt"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96D48118B78;
	Mon, 10 Aug 2026 23:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786397708; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Hwj3nUg1FBP5shh7DqZ3NtUOXglAZAadgRkvkF0DEMI=;
	b=DUDyNCEtSxV9XNpmuwXO4GCErT0GIbCgNyGsEnqjj2wBDaoJJc+tcaYWTblRr9yqI1UUtM
	E5b32/9f83zobT+y4RdaXNfHvv/gwMvS3RUrED9PkX2PNfG/bzLq5/H0JYOFqUYYMCl9Hw
	f7Adbk75G0irnV4xuQVGbgSR7Wdv/UUlUrij3S3FPpjfe13ZMbnwO2rIL0NrsKWS3nygWX
	ty0dnadhaskeTXGO/vmToO4vCoQliuzb7Z9iNl+0aVtf27ZR4vrP1xXDLl0HvlSi3hz6A1
	aJOBuPSzlxZLhXZDWy7aehy1GTA7gClIgbwC3y4h0AVNOmd666chygcBJANJVQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Fedor Ross <fedor.ross@ifm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: Select HAVE_SHARED_GPIOS for ARCH_MXC
Date: Mon, 10 Aug 2026 23:34:38 +0200
Message-ID: <20260810213456.1268831-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Some NXP i.MX platforms use shared GPIOs. Enable support for them by
selecting the Kconfig switch provided by GPIOLIB.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Fedor Ross <fedor.ross@ifm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac730037..bc279b864d3cb 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -275,6 +275,7 @@ config ARCH_MXC
 	bool "NXP i.MX SoC family"
 	select ARM64_ERRATUM_843419
 	select ARM64_ERRATUM_845719 if COMPAT
+	select HAVE_SHARED_GPIOS
 	select IMX_GPCV2
 	select IMX_GPCV2_PM_DOMAINS
 	select PM
-- 
2.53.0

