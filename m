Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2359381B8
	for <imx@lists.linux.dev>; Sun,  2 Jun 2024 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717329891; cv=none; b=mg5Da3aOUTPM+4F/Ul1lXZpuKZdYV5iDJkhYHc9lr50FGIBNlh1NmFHYyrQ+zf/3Kx2tpA7rOLwND4SefTidqOTStGDxky2mFoUYwvso0kb9uzhthNkILUGqrEk3WUwrzdKaQU8j5LJ2of45YP7ku+PcxUk3oWR3k5jY+IrwbnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717329891; c=relaxed/simple;
	bh=SFNXn1zh/yUH5lKBoXzlQkp+p1CQ7cqY5rYlPQmKP7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLzJulEqva54uCTLYSbadSvnnBTZinUkKEolLrgB4TrYfQqo4H3ZPl+hg2crn46qqBR2iJFw2YN0M6cbKaG11lVlDpxceUVsc/gj4paUECecGAE8gjC2QACZdSmjZgZTGErUFCmciDFc1ZVxxGFwWfq/L9hC43Jy+dCDijPsB2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EcW6KNTl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EcW6KNTl"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b8e0e98adso2411028e87.0
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717329888; x=1717934688; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQWdjTwgnIdZS6takOhMDQQy8XjSBnwUC2ksC3WzZco=;
        b=EcW6KNTlZPgqfAznHTkFu/kqXWcq4nz8oRAMDLDgC0l71tLOJpbhR/AcAtzaHnMPLQ
         d7a2vEec4dfS6EmkAZZ1St7ZW9AG+rGxZvHq+2rI2qnbDmnaYFwrEqCoq9ubytNrVEIe
         NGH8CYF/HRjDrG+b7XhnF2QdHajzvTN/4WJszTo+s2/T4cdYUT75FUVfHx0LgveG0kOI
         Uc0D1ifW+BFZtGF1sUiOMHJziWtMscKbu1LtcC7O/FR2sJjohZb4mn4CFxnnNlDGGJhK
         cQpFaCCVwqE+orEbucH7UPdv5yh1JodNQCUX2YSRt2m0TZ0gz9h7sQojj3BROZs6gZCW
         rnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717329888; x=1717934688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQWdjTwgnIdZS6takOhMDQQy8XjSBnwUC2ksC3WzZco=;
        b=fdc25PKFkjMOwXvYtgaBSoD3Jd3a+M9JzyvR/KYtYB2RQegEHalMe4W0rg5liKh0Ot
         wNsVwDJAnCZAmoRVoVKLvYo4AroqapQ/XJMsrj8dvwW2sIESFnmb4KSC71nVx/wznFX+
         oVYJ+YiDsb3jOxxbgZAVPBq2e3saHDPyhEYwLsvXI1vrjFDHcic2cweMemAMC6Z1ddvy
         t7LuDSXI9OHVMkTuQQIE/fhFWSSFOdONpWMYh9KK7ci7qbsF45S5FY1hjRwvfnIjdGyP
         HSF/X1LjirYp6RQtJn+8DD+dSSUkwGvMcf7xs0ILfEKdwTy7oG8mkfHYW8vCvuTJWCqD
         G7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSecIh+6ZmMEJlq88WjK0SMCzfIN/M0808D903AWAWG20mOl284EHJArtCEbg3e5q3UCQJvu12EHl7AaZ5IhOnvrfP
X-Gm-Message-State: AOJu0Yy2OXT+nW5769rfO79OLsBrk3Hb9y6zQPjQNdy9C+F8KExSd/d/
	3AA9YbU9gc2HlVybxDdgx62pgg8bqK39YE0QGYCJFUA3trq4Nyi+iQAmIt9wmeo=
X-Google-Smtp-Source: AGHT+IGfozs4AwvcZe4Ex5alE8/DWJLLE0peGqkDlWeKv2/RBkKRrvdguJMijbWU1spsIZJp4mhVRw==
X-Received: by 2002:ac2:4c86:0:b0:51f:696b:949a with SMTP id 2adb3069b0e04-52b896c7ae7mr4279067e87.48.1717329887841;
        Sun, 02 Jun 2024 05:04:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 05:04:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:41 +0300
Subject: [PATCH v3 01/12] dt-bindings: display: fsl-imx-drm: drop edid
 property support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-1-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pM/J2vZz5Isk1dyi0v4TtXuFzuvoLEo4zOkvkbo396q
 dcI1ed2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiU1XZ/8rn3ldQjYy/vUz1
 1W3lC1Uxdfwmr+15haMreA5z6us5d1/sl+cV/7F9nXztqmde39LbHA92W/Qtj45XWC+yqWq6cnm
 o6kz7LPszV7Zs+CexOdpE66wmb/XGx3kHI74KN8i9mXT1Q6KBwjwe7WePr7ulZ175o9++4pSA4/
 XeGol1K6oq/Ccu+y+iqv//ntisVcpnG3LXJdpO+K5p6WibssF/v/r5d5xJhofe5laHLpvEbSs9/
 cjR8tJ/P3kn64tv2c/IOPeMt+ExH+ZZneyquzqenwhae2POpquM56XPVp5n5eP+nqMczKm1UIFd
 ebftxBcS/UqXLzhWyVYne6S/jPXIdGhpeWhuFu1v9O8BAA==
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

