Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7B43B796
	for <imx@lists.linux.dev>; Mon, 11 Mar 2024 11:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710156043; cv=none; b=dgHVTEqpvcS9fP/2AC6itRNYuQ/bNk0ObPyqHfpVBqlKSM6t/Aa583hhwbg+TWCY5CNFtkdQGMnUlYfI3apYnaU2+g6+tNr+uPx9ofaiPvTL5GIzJqv6cff5gDBGIMzrTMRTefD9F0Y46aYL8fQbArithmnraDXFv4oYNfF303o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710156043; c=relaxed/simple;
	bh=qEtbmPTQ1hWUAljrEFOM5fEpd9T1vWp4LF7YuGb47NU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1NCBVa09jPtOiCc8ddKm80ItLWrBYlYH4n1UTPzK2CP1M1hWazJfBvDzN55cyshXA7W9B/CsPMSl8vHWj1oXOPUkqgWF40/bumBZ9di5DPAZIWPiJ/xV5q47iciz5HI7aN1Y7ujmrabPzsRF18YrUMIr+bgpA0TU3KQAMAQh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mOkXxHso; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mOkXxHso"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d33986dbc0so45993351fa.2
        for <imx@lists.linux.dev>; Mon, 11 Mar 2024 04:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710156039; x=1710760839; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5K+8RS+ahU3ghC9Eek+RlKhdxsgzsxyDagZOon3+/co=;
        b=mOkXxHsokJnw0tF2KHpS9WCZaKECy2S8ntZd0zC/kz3LfyHUSH3TL4iMY2+54onv71
         9OGzVdNgBSD90mFvGuVrwDGiQs9MU2LvMWNBa5SSmiYW+gr4/sfz0R1hCrKIz8EmtorX
         ef/c9/htOI8L3o0r3roNNYU0hqrbIzkqgSmEtZ3lbcGS80kqRFSy3Ccg6hTxzkQ7GwcP
         cH0EG8UcUkkoB0Ug1c7PLr+12ggF7CXRT3I9iz4h7zPOw5vQkBkky1yTNMl6o+2lQQoJ
         p8aX/6Ka8veKydKOGG07BNsuU5r3giW8RpEVmungFtDUPsDaf1vlPeSS6KWW7R41ytjC
         Rl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156039; x=1710760839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K+8RS+ahU3ghC9Eek+RlKhdxsgzsxyDagZOon3+/co=;
        b=D/o4mrzY+H460EEvHPfz846UKTFY54leTcT+shVd5xAUGXILZ7Yzm9fnws44dJGBGg
         xDfJB+watZBIFGJzh6bYGkgBMmTR2vak0VF9Mn95N0IZgVZ7YjWqPr2zit8HeoeO0M2j
         1ZaosUO5BjktS3GnFHp0a2Lz6BoSfRz2mjADoz6ZPQ6CbBi+GpK+zHTOc2logXGVRRmU
         hiL2qSPzydyN94r09mJZuYUUxMYldxtbycfrpNGvX20ADNGKa5LCDkVyvOB0DIkh1rVn
         JsAU7+zDtQAJHpusoFgIVc72TZq4zOd/9S2pCTE6Z08eGo2+IYibC9FvCJaygTbbDxYJ
         dlZw==
X-Forwarded-Encrypted: i=1; AJvYcCVjxHW3ddp6wyfY2gkB3eYGxdYeJ8GuEo8rngZ086FgkrKCJzL+eMJZaXMUysHfmYQ6oN0fZHBV46gldScSs5mhrtfI
X-Gm-Message-State: AOJu0Yz/mferFH4t9/huJPp5BBr43CLmNt1BqyvuQv5iZArUKiybHLGJ
	i5V9sxIJKmTm+bnPxkfOGEEZAsqO5BMUhAtoUTHSbXQK6s5M4YK1eqcUsQImocI=
X-Google-Smtp-Source: AGHT+IEJhMAtLOGdKJeKecm7sYEKvYcwwx9duwSC/xm8nUskzRXaHqSqFQNqsYJ+HOB9PEoneZGAlw==
X-Received: by 2002:a2e:bc17:0:b0:2d4:2651:1483 with SMTP id b23-20020a2ebc17000000b002d426511483mr4965661ljf.35.1710156039078;
        Mon, 11 Mar 2024 04:20:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:20:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:09 +0200
Subject: [PATCH 01/12] dt-bindings: display: fsl-imx-drm: drop edid
 property support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-1-e104f05caa51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qEtbmPTQ1hWUAljrEFOM5fEpd9T1vWp4LF7YuGb47NU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukDR8/XphsjX9E6ftv7NHIwcR6vVy3NYlC/d
 zXcBG5F1AKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pAwAKCRCLPIo+Aiko
 1S/TB/9vuXwtn84QJjHwWRO7IIGZ4o7Fqk8/BZcRorA2Fibr15CVuzrPG05KtxepCR49FHcaL3o
 G4d8QEWJTkQDEdZge69TTVqoSWw1GyhXhSc4G3Fwwa8ZOiz8KRjjjfrU2hxcFbqH7iRn1/cJCtk
 70J7bqowfyNagfeYY9+cyAzLGxG73o5my1xA5NmcILa/IwDguTDE3TFvfV2RLUVPFfeRSPmTiaU
 HTYUs7p0BgIoClf9wen96Ee/SZQ9lbbYlcNx2D0vNTe/EgUVSycN/80gkxjVxcteUUGIDLx/ibh
 kJ7Ypvg9Ti7aOhkeSWy65CdQpiACyht6VgF/WLPThx5CcM2z
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

None of the in-kernel DT files ever used edid override with the
fsl-imx-drm driver. In case the EDID needs to be specified manually, DRM
core allows one to either override it via the debugfs or to load it via
request_firmware by using DRM_LOAD_EDID_FIRMWARE. In all other cases
EDID and/or modes are to be provided as a part of the panel driver.

Drop the edid property from the fsl-imx-drm bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
index 3c35338a2867..269b1ae2fca9 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
@@ -119,7 +119,6 @@ Optional properties:
 - interface-pix-fmt: How this display is connected to the
   display interface. Currently supported types: "rgb24", "rgb565", "bgr666"
   and "lvds666".
-- edid: verbatim EDID data block describing attached display.
 - ddc: phandle describing the i2c bus handling the display data
   channel
 - port@[0-1]: Port nodes with endpoint definitions as defined in
@@ -131,7 +130,6 @@ example:
 
 disp0 {
 	compatible = "fsl,imx-parallel-display";
-	edid = [edid-data];
 	interface-pix-fmt = "rgb24";
 
 	port@0 {

-- 
2.39.2

