Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471BF30BB96
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376136; cv=none; b=iaQNSFnx9AP5tUyeR4wJ1uVbRNs+OqPXDjoxCmOGlfTugXr5gWSFC/wnCYhU39ZjabOI8k4LB/QpIVUPWlsMyw4S68D4q2rmtZ3oRxCXjOdU0N20IkEde8ofNheYgYA2L/l4fWSM4AZjSaRR5wftTk19TrMV7Ox6ZUeQdHKSKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376136; c=relaxed/simple;
	bh=7zIHfbYuxqEFfC5pFIBPbouxdTNkb8pQDDivm5vTvI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZViIxzVAB2PqQvS75sXPjIhLo8xbIbgEzUiooDdwHy+ZGP6CiEsaTYvRC5hdEHY1so0oJPOBp7DzbjNjA8hbTpAJ+20M+XVM30cyg32Sf5CcX93CkjEE5dQcVYmGDrzH7imUesqtYhh59FXKx5jaCMI0p3OLVeCmEfetDd6pWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvVU9RVR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvVU9RVR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b7d485204so884465e9.0
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 03:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756376133; x=1756980933; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXANAbHwVPpe4jvCbblWLvMrGtujuwItYgIeQizTWw0=;
        b=xvVU9RVRSlHMyOWixR5kai84zjDjb61P6BL1pn2ZuDF5AFyjky6ZW5cyBulxwRhpNk
         E3VrHPEJMEvyMSe223icrPBGQKyTKaMYsofSENhfLzW9DQdSJm1syXULUYYCQsr+u0yY
         TsSRwBSZDHn1PHaj5TzZJ4EmtGWkHUm9YMrCLtgZFFFo4lSnFaWkH8+h08ZCKl3pp2fi
         XngBJM45EB9DiIvV80wSOuqmOl+gFKD8aleT986ywtbLxkEOp5l3MvTYBFBAOWdE4X+L
         U/M/SXXwu4dsbdN7jV0R90FHXT98EwQNUw8XLYK3dp5VqvxB2VcCbVVHkAI8hgoxXfR9
         cdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376133; x=1756980933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXANAbHwVPpe4jvCbblWLvMrGtujuwItYgIeQizTWw0=;
        b=dgNFsHEira/jYXVID7EciFiYtu3CRmCRW/3wNblQzTFswOLZEDyieBhqhIunxRDz/t
         3+f6GcJi3/sCQ1zBMlU3pF9qhl8YDpMOapOLnrs04kupctzvkvyMcHgErG+EJ5XKUDmX
         Ri+n3tbyPU2MIII5xw3XklhCRB91qQ9fvfXDeHxsPBoU8U4lXA+9+NTd824/sQYD+rkb
         L1j1Yss2yut63pis572Xi0nCixZgIRxs8vEjnp9QnXvLekUEChKqM7jBsflFxEQR+2Kp
         c/W3MH9qxpZMs/jio77fKCDbT4Ch4lbZIlOaicKgjPopnBbJlygSZ8kAy5SZyeXt3vs9
         8wYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvD9AJGzeOPi0TifWBgMEBxqSO+K/yyrz24IThClW5JJ9BHMPW5B/7QjqcyA9/ehI2hGo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwbhyIJ2I8jq+SRX1/sH51HfOxU+AkBhEtOEV/4obRyk+ws0DF
	hmyCg8qNmfGL96nSTOoFjPTvELYbVYHARSt/KJ1M+qo3DwD6IdJV8cPZna670pDTmzM=
X-Gm-Gg: ASbGncumlOgCRH0h5e/VDmNHSjyX6Sq/RTx8Rt2oaW3gRu7T234A8ZkUYFI2jDQxnmG
	aOyAMA2EJ7hCx2ypcJcUKWZETuGPEyV0QaGRTAEu5EE2q6WdkSrgc9/z+jxspQWmzFCFd08U1UJ
	J62SPR+2GKWr7TwBK+bL8cqjshv1ZEeDAfTs0k1JT5ACUX6bIV1cuN+Tw+JfL/g6n7dbbkG5UvE
	0mCOXVYmkJUlaisorNZn2GYSWVOotrgZsyIZVHWmvYZ++qKJ2BdykNH5tTW+fEaxjNWnFGNcuGE
	1sN1oiau5/tsfuzPuuYXaKUpOSBEqr/Kyj/7tV27xLSHn2nCh9qmybzHsIUEfHZFR4SH27aAUPx
	0x6lMdIHMUzrNy/WhJnc+9zSQqQmtMt4=
X-Google-Smtp-Source: AGHT+IEPuV+SVBjgix8/NEPnZ8nglpuTYsTPM2vPoIioxa72GpCO8DZr4EiqG2j2YOqQDR084wp4Tg==
X-Received: by 2002:a05:6000:18ad:b0:3b7:948a:1361 with SMTP id ffacd0b85a97d-3c5da741330mr16413826f8f.6.1756376132441;
        Thu, 28 Aug 2025 03:15:32 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm49976305e9.5.2025.08.28.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:15:31 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 28 Aug 2025 11:14:44 +0100
Subject: [PATCH v2 5/9] dt-bindings: lpspi: Document support for S32G
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-james-nxp-lpspi-v2-5-6262b9aa9be4@linaro.org>
References: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
In-Reply-To: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Larisa Grigore <larisa.grigore@oss.nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com
Cc: James Clark <james.clark@linaro.org>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

Add compatible strings 'nxp,s32g2-lpspi' and 'nxp,s32g3-lpspi' for S32G2
and S32G3. Require nxp,s32g3-lpspi to fallback to nxp,s32g2-lpspi since
they are currently compatible.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
index a65a42ccaafe..a82360bed188 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - fsl,imx7ulp-spi
           - fsl,imx8qxp-spi
+          - nxp,s32g2-lpspi
       - items:
           - enum:
               - fsl,imx8ulp-spi
@@ -27,6 +28,10 @@ properties:
               - fsl,imx94-spi
               - fsl,imx95-spi
           - const: fsl,imx7ulp-spi
+      - items:
+          - const: nxp,s32g3-lpspi
+          - const: nxp,s32g2-lpspi
+
   reg:
     maxItems: 1
 

-- 
2.34.1

