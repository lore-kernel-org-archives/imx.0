Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06E23B7A0
	for <imx@lists.linux.dev>; Mon, 11 Mar 2024 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710156043; cv=none; b=igNfU94zkn5e/Z9klUtebKQboTeISf7f3W4HbXSIdqkar4suYoPTdKX2kqKoPmPjUyJJX92hy5qjYtyhCEtTFZj3tVb01eIy8UonaIbUnO4u76Pr7Gw0XnCc4iwsD/V5sug4LPHK3eETO0mVADhtwJJIDyi51Wn+eEYY7YO0k6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710156043; c=relaxed/simple;
	bh=HJWqx05Y7sFlh+0kSF4Jp43KRSRtmVmSwPbpig+Jz/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1RgoR0n3JhM3IgseIgeqd3TyWAi7h91ifWJehbDzTsSAxIYU4jSWYzF84m99nOyS0vreLegU+7gSbYe2rlaELcXWIJwWOcSbm1+lH8xbjtT/C4V8AZGwajCOmPkowYJBYtr5MdQJnlioZkWe/p2btjHcsqB265azGYVfiwFBTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHJG28EG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHJG28EG"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d3f962a9dfso30208901fa.1
        for <imx@lists.linux.dev>; Mon, 11 Mar 2024 04:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710156040; x=1710760840; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOnGUUSPDhVt2hmPu4weKhalmHR2vV5a1NMlqOPGhZM=;
        b=UHJG28EGXdA73O6fkkukqoG16D8v0whnAUlwtlvG7fhFNKbKE8j1oL2zvkSnaAenlS
         9U0Zuq8+EzytgieKryY7shJRVEp1hodZIC3QYC1/Kxn+ieAvzkiMVoGzI7K9DE7UkZUy
         qvoNkKz2JYipolSuvyZmGzksU6pJZPr7Bbk2OWt646sn6AYXNeYu6I89FlCbw4yiRfYG
         WGXDPP7hYdnQUwYTlziucNVQVwLbHnnTAP3N3+CD5Xj7RJVrZGmYMms+XpBla2g2zZxA
         JGlo3XfGuS1uVwzqxYdMWVyyJg0Exu1oe1rZmN5BLA0v9hmDAlnVWrWyuxNUbKsaN+Hk
         e9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156040; x=1710760840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOnGUUSPDhVt2hmPu4weKhalmHR2vV5a1NMlqOPGhZM=;
        b=E0Cgt5PGZ60Orxipps1BCNlDnaOONpyRXwB3lMvDoCyXbxVFJWC1NUODzBKJCOynZA
         S5YSGkVc0fAWLaCsLEDD24vRMvv1N5gMVO6yVo56zqWo6TaDeApaW0qyNV0nTHHVRKzV
         nFH/u37xvB+vVuO+QRwq4F1/0dFtR562VuBV00xSzrC0310PF8GVQ5SGZZiA4EeHtXSY
         eeKOtq5Ct6x9blcdIgZXZbEdT/JL24+Z47pcWPPP2TYPCqmjet/VySvVetLfjnVL1B3T
         m6U9kvRRZMd+gk0KxylqE6CL7KmvLcBmmI6TlnY0pVx3mGQ09chwufSgm4bzNmUFLO2x
         ouWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN+jePqC2UNG0Zfym0b5GLWFk2fKi/osjT0IrCmwviqu4ADZGkrngULVVpWeIZo9cSwRtlkh8RzDZNP2VQDa5liBlK
X-Gm-Message-State: AOJu0YzZPklttGd0mRcPch8RXqKrCYadv2o4VgnZwLkh6Xkwoqh/punq
	FjHQ81lCAwe05hFAwgDo58kqzJ3yXORsqlvPJThKllHax+25c5bZLgKAkmYRpdk=
X-Google-Smtp-Source: AGHT+IHckBn7OVk6ZNbhFfGx+109UqdO7X75yFgk7cEh5ltxLP0S0lkQQAPlPytUbqRVpqfoZAqIOQ==
X-Received: by 2002:a2e:9153:0:b0:2d2:9e6b:27f8 with SMTP id q19-20020a2e9153000000b002d29e6b27f8mr3942230ljg.50.1710156039914;
        Mon, 11 Mar 2024 04:20:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:20:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:10 +0200
Subject: [PATCH 02/12] dt-bindings: display: imx/ldb: drop ddc-i2c-bus
 property
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-2-e104f05caa51@linaro.org>
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
In-Reply-To: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HJWqx05Y7sFlh+0kSF4Jp43KRSRtmVmSwPbpig+Jz/w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukDPDKCwBOTTQDaMy+fAoU3+mAeWJ79vy8hZ
 HXiIFHMrqOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pAwAKCRCLPIo+Aiko
 1Ud9B/48QbueaFlREX/3zgbkla7nTCKzXqKHUxFNfTU0aFAnEG+CUtAhb+6cCPIwi6oHD+mONx3
 rAkCur8LLUVLh9nVzExyPa2J8Q5BwXfN/Nkhesnp08Tf5l1PdYo5mAzE6yo0tfcmjZdHC8K9WcV
 w4g7PGdxRybCLJs8PlrR9Pr5xJLvylg29b9JTmugzVgK2y40F3xWWi0Zb+lbYHBQgguTOZapdYB
 foMN6HZnH1y+GbLZL3n/7/VwYRsYASaj3ALQs25mr62h/7lbUpy8sXtPEDvRvuAYVV2rpAOODJT
 b4Q3FFjDK2PKTczRrn62jy99/quRZ1HHaXCiyO0VsmrdQCO/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The in-kernel DT files do not use ddc-i2c-bus property with the iMX LVDS
Display Bridge. If in future a need arises to support such usecase, the
panel-simple should be used, which is able to handle the DDC bus.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/imx/ldb.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/imx/ldb.txt b/Documentation/devicetree/bindings/display/imx/ldb.txt
index 8e6e7d797943..03653a291b54 100644
--- a/Documentation/devicetree/bindings/display/imx/ldb.txt
+++ b/Documentation/devicetree/bindings/display/imx/ldb.txt
@@ -62,7 +62,6 @@ Required properties:
    display-timings are used instead.
 
 Optional properties (required if display-timings are used):
- - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
  - display-timings : A node that describes the display timings as defined in
    Documentation/devicetree/bindings/display/panel/display-timing.txt.
  - fsl,data-mapping : should be "spwg" or "jeida"

-- 
2.39.2

