Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402E727979A
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765551847; cv=none; b=vCc9y2URjwmXAmST1Tb77mnPwWlqLvNoLUwqqN5cxxQJloug6SpC/glvOCSdaxjhqC1MAVXkfePz5NHqcdh9WpruoZqpvLVTR4eXqYyA2MGqH2beozN9C5Fmq/LlQiBk/Zk3nyI1Pwy1GncPUTb5lVvcpgxXT3g39tqw7IzvriA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765551847; c=relaxed/simple;
	bh=fZAcqRD50Wi9zC/Droas8GpHjMnmrcAYigk011caHOo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=QbGEYq8Wn2ophPmBS0ujAvFAJ7QMeeh+HOhXN/nsuxVBmQIHKLZp3fQm4z3mn2c5vn+YUodLCwsIQ7uBEqpMytO5xX5nHAhNbpJ1Nl9NsQ89MMRI6IQ8C1FIdgNRnoboGEUW+gxdL+2M0PlqQFpgTpySXjoOIKQC3ugrFSlzt6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JyT7KsnV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JyT7KsnV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765551845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rgxpVSt066TUyJCGi3OmDYi9BAgnnOl/eGNX0JHnjDw=;
	b=JyT7KsnVgIWWE8aP2OWeZ1h/C4awlSp9CBnBeP0lm2OuMKSf1XXG2MUPfUtEVukwCMylmO
	443QFCL/Ry2ivhot3UONrT+II6+5u2X8C+PKVY8LMaYwzp2P/2Inqce8SCyVfgMvBj8UCf
	bDek1/vgkKEpTQKHw8wGQd3t4VKXbQk=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-q5RSUg-uOcWWsaWqhHD4ZQ-1; Fri, 12 Dec 2025 10:04:03 -0500
X-MC-Unique: q5RSUg-uOcWWsaWqhHD4ZQ-1
X-Mimecast-MFC-AGG-ID: q5RSUg-uOcWWsaWqhHD4ZQ_1765551843
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso2120953b3a.0
        for <imx@lists.linux.dev>; Fri, 12 Dec 2025 07:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765551843; x=1766156643;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgxpVSt066TUyJCGi3OmDYi9BAgnnOl/eGNX0JHnjDw=;
        b=QdPuvNC8RCuIcIBMcEwQ2uoBPGgKICyqSUNFiuohySK7NXNSMI+iQ9mRKu6uUcz7F+
         CCfTc317CVyXfXLC8fmEYo+gNYHmjT1Xsom4CzUsbqzsnfmlzWKc6Xsy/TNXRSNB1j8y
         8atOlQC8HoXCTG4uIy7CaWhH/rHC4zxfKt5kIxDncQXrQXlUpnQdP8mcKTfiySHv56qL
         tMQKw8PGeOMNzGs30ug6t2Pun3R6k1Kk8ZlOwnRl/gpuzbKlNpAFAdjxs5GKHg0zQl2k
         gDQXuvfBUng+xsbEIOO2IhWQNfJkHG7bdrhesrY8qvgeEv9qI+v4dHCKDjmnvkfi1HxJ
         4YxA==
X-Forwarded-Encrypted: i=1; AJvYcCXi+TO20G/ogB9Rc3xORRYEg8HKSbBmC89bj6TyzJvubtmFFeV+pgclpDbuTUW30dPunek=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXN++oDfqX6cauHz2SwLQYAVZsD2YHkHIkYCWqHMiXa5i21OhC
	uie/ZEnxJ8hq+clmrWCkmb17M9D8NnF95lUvIYNbuT4rxN8rKQZP48SaXWQEEhWczYXWQKSfhpY
	MPj3nyA/+03Tjw5NoE1B+lHveX5dDdgBFe3nQY7Wh1F4b7zdlgnqCaQ==
X-Gm-Gg: AY/fxX4hw5LWET4j1bdOokvYoWbZWKfFvfqSLMFJMhVuyuxETBwTuqjc1JMP1QroYxK
	FrYGGD21BSfwou7sQ7b4B6HpIbADzoQ+4iA/XeYCut2TpI2ywkl7KPLiVD6dCWxu99Cj4xd3QGI
	nkyJ3qXSRSljSLZvUbDKp1X2YCNXO1TaH15fCkJwT5CvW5DDZQ4ND061SJZMRRR4iA3lIM6tBhe
	Twz2Q7+ZayIs0542/dpZAGhbv4RQWWf3jUtTLWuqZD4O71LRVTtA1BYOezJj5/Rq/bmdiEeLkK0
	PUGHpzMdvdTHKqocKAOaKYNeJNsY4wJnHOhkx23/vGWcX3O4OzqWiQ87U0nmYpAUnP7Qkug0Rgg
	5j/nbFDfErzh3LfWrpnYVAF4B50ejLMypatv0eJBbAg==
X-Received: by 2002:a05:7022:ed02:b0:11a:f5e0:dc8 with SMTP id a92af1059eb24-11f34c4ce6dmr1085516c88.28.1765551842649;
        Fri, 12 Dec 2025 07:04:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb1zyrPRFVrIwsGWsg/+MOeas9yeMDNDfquzoK4AyHa02WZnuzqW3kokEIkkaJiXX2KbIydA==
X-Received: by 2002:a05:7022:ed02:b0:11a:f5e0:dc8 with SMTP id a92af1059eb24-11f34c4ce6dmr1085495c88.28.1765551841915;
        Fri, 12 Dec 2025 07:04:01 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4403:8750:d964:d6a9:f204:ed2b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f392500cdsm1113616c88.7.2025.12.12.07.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:04:01 -0800 (PST)
From: Jared Kangas <jkangas@redhat.com>
Date: Fri, 12 Dec 2025 07:03:17 -0800
Subject: [PATCH] mmc: sdhci-esdhc-imx: add alternate ARCH_S32 dependency to
 Kconfig
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20251212-s32g-sdhci-kconfig-v1-1-8e278c8d7f78@redhat.com>
X-B4-Tracking: v=1; b=H4sIALQuPGkC/x3MTQqAIBBA4avErBtIy/6uEi3KRhsCCwcikO6et
 PwW7yUQikwCY5Eg0s3CZ8hQZQF2X4In5C0bdKWN0kqh1NqjbLtlPOwZHHs0vVnboRpctzaQwyu
 S4+efTvP7fgsuFhhkAAAA
X-Change-ID: 20251211-s32g-sdhci-kconfig-585b6909f7b4
To: Ulf Hansson <ulf.hansson@linaro.org>, Haibo Chen <haibo.chen@nxp.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chester Lin <chester62515@gmail.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
 Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765551836; l=1453;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=fZAcqRD50Wi9zC/Droas8GpHjMnmrcAYigk011caHOo=;
 b=gwmpJ5jaWiW+bNeO8y1ltBZKRvbuoEtgP5r39xeccaPH9fbkH2Wq76atnFsPgELe37jtmkqLJ
 7aWyvSXJ9R0C3SBL3godhPcGZcJ3watT7QPUteYodMwfmQvQaOLRTIQ
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kooGsRoQy-oJ58ced2zhAiBoKG2heo-CW_Bw44HgjZk_1765551843
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

MMC_SDHCI_ESDHC_IMX requires ARCH_MXC despite also being used on
ARCH_S32, which results in unmet dependencies when compiling strictly
for ARCH_S32. Resolve this by adding ARCH_S32 as an alternative to
ARCH_MXC in the driver's dependencies.

Fixes: 5c4f00627c9a ("mmc: sdhci-esdhc-imx: add NXP S32G2 support")
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/mmc/host/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 10d0ef58ef493102d3586d7a31d755543297999a..c94ae4794545de1c818ad50be7f91331862b6acf 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -315,14 +315,14 @@ config MMC_SDHCI_ESDHC_MCF
 
 config MMC_SDHCI_ESDHC_IMX
 	tristate "SDHCI support for the Freescale eSDHC/uSDHC i.MX controller"
-	depends on ARCH_MXC || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
 	depends on MMC_SDHCI_PLTFM
 	depends on OF
 	select MMC_SDHCI_IO_ACCESSORS
 	select MMC_CQHCI
 	help
 	  This selects the Freescale eSDHC/uSDHC controller support
-	  found on i.MX25, i.MX35 i.MX5x and i.MX6x.
+	  found on i.MX25, i.MX35, i.MX5x, i.MX6x, and S32G.
 
 	  If you have a controller with this interface, say Y or M here.
 

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251211-s32g-sdhci-kconfig-585b6909f7b4

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>

