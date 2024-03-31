Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A610147C6A
	for <imx@lists.linux.dev>; Sun, 31 Mar 2024 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711916950; cv=none; b=WE8vNA1bB+8Kh1xsXWkyeOlsxn2c3gKZo8azgP1hX60eFUckPiZlnzn0gRrIyxv8gy7YMUOAa+Ktl5qFCDe9hlglYSdSZ7AqKkdLtEZOB/XUy+fhY0EKq5eztDjTyZybNnwyqdiHw2BHRrsRLDFMUGKwX8CVxZ5muh9FDkVYN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711916950; c=relaxed/simple;
	bh=SFNXn1zh/yUH5lKBoXzlQkp+p1CQ7cqY5rYlPQmKP7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uOyHV9GqV0Qc9enhVNFgVORqIpnhcw/c5YmmJ5CPWpmsACww/BqZkI/q9Ia9U6tyAMnII1mPRjv89bRaMpa4u0vSms6VGn1wrty8Ivn6YL4wGsG/rsemHWyftNdzkXf2ketxVOrnIsbzaUiNHFwcqFGz/UXJL6WHPJsbL0N7UTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lCnotT9I; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lCnotT9I"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513e25afabaso3711899e87.2
        for <imx@lists.linux.dev>; Sun, 31 Mar 2024 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711916946; x=1712521746; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQWdjTwgnIdZS6takOhMDQQy8XjSBnwUC2ksC3WzZco=;
        b=lCnotT9IOLj5sE6wQHYa+Ez7UkRXcHJYRu6tQPSy77yvLI85r4nNi4cvh4OKz7JapW
         WSJLpZtR28gNgM1Q/46j5D4GOtuII40DCvSx07X+vKsxb2WxMr4tdER50gmkkctbS1tm
         Nw/TFpqy+8Wd1zCv70EW7GYVeYqoTC+ssHtd/DM1n/bXRRVHFlZFEeNKDgH54zYJZNbM
         TNLKhayP91S9zMefi4SWyT4UfCC0LGO2IXrjQ4DVxOSE0LHQfDiXkBYOQ68szLTOEZWS
         1GlrXcAA2KmzqLjP9W73oqFCqScEgZuouQW+Yru8VDluPfJNkVaT8QKfb20qdrddQaIM
         Nrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711916946; x=1712521746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQWdjTwgnIdZS6takOhMDQQy8XjSBnwUC2ksC3WzZco=;
        b=EumYeGuV1ykeraLRk61bxat7KRj7X8AXLLsKSKzEcYw22T7zBekXsucYhlfJs5gsMs
         uoHjTv2ipwTeU6lFpqbHhxEPFg9QoZwpF66W0fRbjJWItT3Vn2ZETC0mGeV/ZFTfCxPq
         aUoQ/HFESqgR0QaIEKfN13smvAypKfegLWjxULT6nsJlwchVFWZpkuKMcNT3mOYiiOu4
         fbJZN0RVsL0QiBuJSEm4XEHvcLydN5/hyFqZrpwRcFWopALzyDNC8Kiv92NvXjsyPt+J
         xKQalcK4SraiJO7PVBYtZ94PnCNfdlYQTkVZLLrxwWT5uVoi0Qv/QH98bTGEUNppFmdd
         sohA==
X-Forwarded-Encrypted: i=1; AJvYcCUgsdK1lgAC+nEWBsCq4NZIZiKcMwPMdQN/70xc64DnW7muIJ1AvRlHny9sSNGEUEJpemMsI80cYdhIw+dRk0u/ezBx
X-Gm-Message-State: AOJu0YxucvNj89h1TvPmemTBgDR/qlXXywlgNCH5g7uZN4lP8CN0B4jd
	9fHxD4qtuOyBNa40HTqFWOXy3CacKpbChKhzLW66k9XI+pMq5RC6aNVtJa4Antg=
X-Google-Smtp-Source: AGHT+IGQdqPZQuZrp4rMIkttCQZXwzzfHQ8qGULNfSAfqZZSLM5BQiVtoEAQJyL03sBpJPsmSiXibg==
X-Received: by 2002:ac2:465e:0:b0:515:d100:1650 with SMTP id s30-20020ac2465e000000b00515d1001650mr4831112lfo.57.1711916946553;
        Sun, 31 Mar 2024 13:29:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 13:29:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:28:58 +0300
Subject: [PATCH v2 01/12] dt-bindings: display: fsl-imx-drm: drop edid
 property support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-1-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SFNXn1zh/yUH5lKBoXzlQkp+p1CQ7cqY5rYlPQmKP7Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceOu5x7edAmH8+j3eGaGmmWCs+FoRdo+9fSq
 UX49KHJUhWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjgAKCRCLPIo+Aiko
 1XkMB/4jYrMQ2Pto+iPk8j5wCQ3lBNRQBXOOxIa36gpTWGBLXN2GMgq4T7AeSxsn9W4uYJAhsST
 zHQ4WQaOaSHhKvVfvr6alCYvShW1Yffn7kru9PtHsb1YlYvbfyYV6GJy4r+eOitmea2us9BMgqd
 75bzb0KkIdLmVYWRygT8xARQ/AZ0RZRvmWJKAKq94B62Yj3eNCDbWUkpHtkte3s5Z1IawpY75jR
 RCDDAnQO9BSYH2we2tHqKiIbf4TJBGRQpIM3486HR19gxyNT2AVWyZVuMY2UxZ9drbNgwIfG20z
 311P8qvYPgPF4VXolTrtGq+n9JR6WwA+ID/jrmIaxce/aZRk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

None of the in-kernel DT files ever used edid override with the
fsl-imx-drm driver. In case the EDID needs to be specified manually, DRM
core allows one to either override it via the debugfs or to load it via
request_firmware by using DRM_LOAD_EDID_FIRMWARE. In all other cases
EDID and/or modes are to be provided as a part of the panel driver.

Drop the edid property from the fsl-imx-drm bindings.

Acked-by: Rob Herring <robh@kernel.org>
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

