Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD951482E0
	for <imx@lists.linux.dev>; Sun, 31 Mar 2024 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711916951; cv=none; b=WkCEnzL84fRs4T0qvKanhayCbKa7gnxM2lhkZXOUAVBXNq8u2+9HY2YvSQGx7l0m9EOMXtx0VZfNHryb8xaqi5GfI71G4C0KyCRMGaIgvZbKG5rzrD/A19eAb6aQDyCWC3WnNpiHZvoq8c5ElelkTOPPK/R3+ZfUNwWf8yVLsqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711916951; c=relaxed/simple;
	bh=3Nz5IHmPVWRwHFsw4a2c0uKZtmM9s7xJPi4nSL2SZJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZOWp3ANPNkG6KgoAYdpHtdPl/KR/aF4z7JXxWtb3ufRmXrr7RV7gR/4iRMmfF76RNYQ1nzIcCKd49+1P5T8xjbnhzem+u5fydHmgIMq5e5nXlrBiqoVAUE9uoK5aYvX74o3UHGFh6FpXjw8cOLRU4YUM0ils2gGvnf29lb11bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVVseoZI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVVseoZI"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-515c3eeea5dso3907962e87.1
        for <imx@lists.linux.dev>; Sun, 31 Mar 2024 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711916947; x=1712521747; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGWVh/Zr3LGFqNC/PDJ+t+m+rq2p7BOWG0ebyvpQons=;
        b=wVVseoZI0Q5h72BKXLQDxojAt4AosIkzq4PAqJOwVUUX5f3G77Ad+P6Wyku5nRZc0y
         j1cWvVRNVBZpVdTM1IKcf+u9hn1YHQxP1hs8NojxS52bVLvcE0+NGippn/vWIMfL8ads
         bBD8NUpI9+2TWaCbH0Wj4okim/wWbSIP3JkuAkyMc79kL2ypOIqwCkg0x6Pt57YQwBJB
         OZkElS/nuF9cMWUeblOc5PdpEs/nBoawJhXVxuPBHZzyH5+gcw1VibmDbg/bUJPKiKKE
         ZiYhlhvWisvr5YLZ39BskfmTZQFscH2qto5YQyD0+hfhMwui/FMt1mG7bOyTYl2xaf90
         XVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711916947; x=1712521747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGWVh/Zr3LGFqNC/PDJ+t+m+rq2p7BOWG0ebyvpQons=;
        b=a2ZhbsjMmN62Hds1D/O6Jgf0yFv718/hHN7/AkQF/LUC5CBBVep5zkRHjZRwTgTIYC
         tHukpga+CQT1scZjIBuTsVBWjJwOz3qoghDeEY6rTRPPYCAGOtfvmYFtxN85DNN0XXph
         v8Dnw1SklN51IyuOju0z662Sg+YPyxf/CwlgBgoEi72Q5dELPKy4ytMRX3CZEgjN3/DX
         4MtaKAvN7pXMIJKymD7fHkozrTU09iEnI2mKzs/eCfWlSKbDyB2aSjHPuL8g8Jw+lIK5
         H9IWJypZ8/+7CFjH5jpH0JB0L4LjaUh7B3Ix3S2i9jgkLuINmVG1S5qN7Tu+Tx10KoDj
         VyuA==
X-Forwarded-Encrypted: i=1; AJvYcCUm01R80jO1B7YDUATmzS0QhGrXWiDA0/TDM8d8SoYN8P8vr55aShwMcbbizwXa/1EcUgPfebkGvbp8YDI2KPYUptbO
X-Gm-Message-State: AOJu0YylIGbjPGXBOotyK0Re4v3j+Qa6lFrMSJ6DWLDLo9u/yqhVcBkq
	9XpzFiTZHplFmciGkqNYYE1sjheLhxRFzrn+O1FOrTVKRymLPjwDmfV5E9A7rAA=
X-Google-Smtp-Source: AGHT+IErgrRoQvxgZumBivM+Pb0YMQVGa5TcuZqM+SRcVE2qbrjJzJG0RqIIHvoWbmgR8bTP+gcaJw==
X-Received: by 2002:ac2:5e62:0:b0:513:fad:3a79 with SMTP id a2-20020ac25e62000000b005130fad3a79mr4662754lfr.41.1711916947600;
        Sun, 31 Mar 2024 13:29:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 13:29:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:28:59 +0300
Subject: [PATCH v2 02/12] dt-bindings: display: imx/ldb: drop ddc-i2c-bus
 property
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-2-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3Nz5IHmPVWRwHFsw4a2c0uKZtmM9s7xJPi4nSL2SZJE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceOQEdxUBjYVGcqNd2OmrDFYajZlrsDacoPO
 CuZPZV1962JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjgAKCRCLPIo+Aiko
 1SgTB/9h3CyJDldBv5uM4m088XmQ8/63HBIR0KmKsg2ApUeLlsUQVFPWv6HCxXEHhmoroNSzibq
 6tblygXjqEY7bhNq3EvQb67kyg6LhARbVAc+3d/idawgHzRewcnAuylIV6WFd8nDUT8AMmhhYac
 El3My4G/fyldP7NqLXkTfQHs4HtfNnEjwjCXCeAxxccIsz+T7kMKndy1i8BUrqTk5kA/wG54jbR
 k5JMTXaOx6tshdQ0kirRA4BAkOgtir/k2M+Rs9/FPAI03mg9xiib6Mdhgee1nnns4riNinorjxl
 A03KUxKfJAma3OVCmDJoQmR7FaMLMBIwgFi9quEUEv5eKIYY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The in-kernel DT files do not use ddc-i2c-bus property with the iMX LVDS
Display Bridge. If in future a need arises to support such usecase, the
panel-simple should be used, which is able to handle the DDC bus.

Acked-by: Rob Herring <robh@kernel.org>
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

