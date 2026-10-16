Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197B13BE174
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 20:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183723; cv=none; b=pOAW8O8oRGfSxFxhmo02loQJwac4LCCLyoINt5W9rrA791QGATBjUmMOMrCKItwPGwqzSCiCnm3N7BhrIJmEzQL9H4kCtT3+quY1V3nHvrF1STlERlKpiaLVNiaEQehW/gXmU1/gef9mMTl/jHSPqoCyl777vkRint7cI/TPJyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183723; c=relaxed/simple;
	bh=FhSBZW7Jpj+THEoTkniaEwqOd1DSuDXMTlV1dtr09P8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n79GsmV1flLojC/gAoKCroXw0r0UXp7qMUD5KJoGquB64yWdIDHQzrx9MYYTOi8iaXXd28nOOqXjqQdygl0UiJTCH11z6YRH3dBHxZGAdK9LkBgobEf/3CAOFTOeEAOUN1RxeB45HeUg6mBCLItxBsFtYHeJv9OVl8yBRdiljSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1E0uytl; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1E0uytl"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so214577e0c.2
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 13:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792183716; x=1792788516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbKdCffk3oF5JNe4bLXvDyGBPerJKYVxL0w+jpUvxD4=;
        b=G1E0uytl8EzyeY/Ge270bFKuYuDUHg5J0iA30W6ik+nqctNbq4CKNZpLe7dieZE5Sj
         ZUuQcdHpczitnG40FEGlLapgcVal4B8V/PE4nO03AtPIgm9U/vRl8t+ofY0ysKnm3Vbm
         uI7fBG5PzNGuAUEtIFsp3W6K4Fnr8lJDSMkv6UOe+sJcbth+WA+yksolUCMDMQ1NzFuX
         xSNGh92fUNNqD/t0SPKm4PQ3LEL50OFQ6vQWSmIlFUpcTIrYrVWT1bkRv9nSyoodgKsI
         rx2MwQzCyR2Wcp2lc7jDMvg1u3ujnyu4U6NYUDdyY/9dNXCNRxTJI2tohIl17sOA7Q5t
         XrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792183716; x=1792788516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbKdCffk3oF5JNe4bLXvDyGBPerJKYVxL0w+jpUvxD4=;
        b=AZL5eRvj/iOwLYwEJEDmyYGHf49EqFAoW3HwKL+lz9sV+Rd5rwsi9iF7OsMK6789Iv
         VF2RPXK1EnvjjLmxL7qhrJlJlhdWDoy5CP2c7FCDoF2NnWM990UAOEzCQCk1mpma2IQh
         uEFpr7bVwOligo+AM/cK0iMYn8bScHKg6VN39IW6d9rPvaTj6ikaZ51qbq18EarFgvgD
         zkOE1d+iwmR0wEaAjPCoWSeD1su8C4N+gZxfh+UxYSc7uSHDzz/tLeqLQZu8dKG0ZBtV
         FjdZ4UElIib7qzkUaowPnNgnMW1e7bvUwG6A6WzhAuFujAfuktNgbFax721HI03Uo9Tj
         llUQ==
X-Forwarded-Encrypted: i=1; AKwUvByo7wTpHqyVN8BT3tljmwK+EhITvUbMY5QvPCOw+OX5CErwCLrq3ZDDzBia8wspFgJURDE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIZ8jOQu/bY9kHa60AyEs0EpydRdGnAUq1V5eU1DTuB/SZhvueq
	VdqCV+5n5p02WnHRo1BeeysHNtFsOk/ar3sFsTs5KAxPScMUOvlfKbCk
X-Gm-Gg: AYBFou3GnNkNpvPThJFsfciuohAMeZwVx8tR1BY/pswB9JOeWmX+53FPvNNdhvnxDj1
	taUFxZ99umjyYXFAQ7iAkR89uL6UQ5fSPV3MLFnIHt+Vt9HdaJhoQWNBqg6KNtZaXu1zUfJ4HLH
	imbcg2EvSEbF/CcmMKP1AjV7q3qU75DwOO1803IjAs3XtO0mfeBg2q6NIbgvx7KZjCgmHHnMV6/
	JMXdyTZPFGbNSCFMxwc2WIKr6Xb11m5nYXEpzq3M1UpEgWYa9bTzYoTvZUmJARRqW+ibwYgkO68
	1R/kcGz78AfJ/Ov6ntg747p3SNxifdmer60jkbzKvCqjHWz8gcTA2PyJLAuuBjDfBTJhYB2oAqV
	6LhjqJnAR16BJTEBpLInYSofhD6xJKvAsIlTkHOQlQat6QbSB1+Hcr1lv1kkqiJ/clyAGPqRTfb
	XsKXQDe0FBBPWxzrPDXgR9UnvO7N2jw3FJAqfhGdsCo3tychPRFWuBlMPNZs2Im/r7RpPmAdax6
	tUuaz06EucwYwNNwDCPqb8fAqmCVp9c9C2vrZiPknnkST8=
X-Received: by 2002:a05:6122:4889:b0:5ea:9f1d:c842 with SMTP id 71dfb90a1353d-5eaaa6647cbmr588454e0c.15.1792183715924;
        Fri, 16 Oct 2026 13:48:35 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b55cc65sm2463872e0c.17.2026.10.16.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:48:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] ARM: dts: imx27-eukrea: Remove invalid spi-cpol
Date: Fri, 16 Oct 2026 17:48:17 -0300
Message-ID: <20261016204817.463567-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADS7846 timing diagrams show DCLK low when inactive, and its pin
descriptions specify that DIN is latched on the rising edge of DCLK
while DOUT is shifted on the falling edge. This corresponds to SPI mode
0, with CPOL=0 and CPHA=0.

The spi-cpol property without spi-cpha instead selects SPI mode 2,
which uses the opposite clock edges and does not match the ADS7846
serial interface. Remove the invalid property.

This also matches the driver behavior: ads7846_probe() clears
SPI_MODE_X_MASK and selects SPI_MODE_0 before calling spi_setup().

This fixes the following dtbs_check warning:

  imx27-eukrea-mbimxsd27-baseboard.dtb: ads7846@0 (ti,ads7846):
    Unevaluated properties are not allowed (spi-cpol was unexpected)

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:

- Remove spi-cpol from the dts instead of adding it to the binding. (Sashiko)

 arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
index 26833ed3339e..cf5603ec6826 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
@@ -77,7 +77,6 @@ ads7846@0 {
 		pinctrl-0 = <&pinctrl_touch>;
 		reg = <0>;
 		interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
-		spi-cpol;
 		spi-max-frequency = <1500000>;
 		ti,keep-vref-on;
 	};
-- 
2.43.0

