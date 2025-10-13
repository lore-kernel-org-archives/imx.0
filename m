Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C87D3090D4
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367152; cv=none; b=pGLnOSeSaoQpFjG+9pGSVn0iCAeH7jqTE8IEwNFGvxD2ypEyfT51Pj3CxGfMoDoxhc1dgodJ/YKr/72II5QaAn71kVIpGzFgGkzd+3h7ayTk0OETMXsmGAQcaFOpYAGefpc9ImKM63VEymrAieQ3j3NotY9JzP6HKGsTsXSKJDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367152; c=relaxed/simple;
	bh=ehKGfZgSjS6V9yj3+PS5sl4s+AURZPsv7Zg5nNIPtno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NU+3IyJrd6sDPf3/fxob7L4exlj+gSlvA6ExbvbYnCDVXAyZS/vwbhjdXV2fXLHL1kx/7WW908FF6/TOGzfGm8Ir/nDLMiVFqYOpIDot3vZFQrKTf9dvCuSWxEd718WUzTADWtVnxKxkmFrxbFkDi7xutYg4OGoRSaaaVfW5ohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ip1dcTFB; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ip1dcTFB"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-36639c30bb7so29633301fa.3
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760367148; x=1760971948; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndqybwsxO2QFLLjTy3qgkVgt9RREczDl4RIa/Rwx+w0=;
        b=ip1dcTFBfB1a0GFtVP+Z6MaORy2ZAw2cM+y78o11lXXAkm1yzqetC92tXNW6725Bfj
         jmkZPhY0jz0D0muM3f/oNqutZ8fhHK5XKM4nt4o70RPDpEb9Sv2zrn6iJbbSsrfhtbxC
         z17UNP25ErFh2BwJ4xqFrJ+gWuIUqEM+PZg2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367148; x=1760971948;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndqybwsxO2QFLLjTy3qgkVgt9RREczDl4RIa/Rwx+w0=;
        b=ZdxiC3zlpVXvsjpiLuxIgLdMKsVatWVdvrOqEVldqGMPXxK8TUjiKPcYn9/iksgvkF
         VcfjTqaWRAs0IOwarjl0Yd2qrV6gbv6mKMWOr+qwW7mziIv4cnwCxx+y7CWjlVYj5/Np
         eN95QzfCnnoExw8S0ebd3JMSfM/5iLPWL5zZIRzcYoD6PGoWTxmJ8odvlyzS+OdkHEYV
         YO253rZ94IfvhoAhKtNHRLJIg/hAENhhyT6pl3tFinHxg7NCpF95zdtFpImkLSREU4Go
         k0pYAzk31ffU4vpiYkGxilns/C3297dS3Ww/tDEtWSQ5DyWFhCjxF4XWhhHqha3gIjL0
         2yJg==
X-Forwarded-Encrypted: i=1; AJvYcCWMyqlw3AzpLvmRpmctEZSlQaPmyfdVSKqp4Vu2q31f8E6I0xu3Asay/p9xqh5g7rjMxbo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgavk8w1A/b2ZHcmwNcoGGSYLGxEOb9GJmZTSMJDjGETK9fyku
	5n2dNf0lKKij8e1yBz2FnEmwGD6ykNI6M5JxAousY1Nazxfs730fBO+AGWPYW/Sz5Q==
X-Gm-Gg: ASbGncuEXYRX+UEosAS7/21ad60Wee+xBrfHd7ev+YxUCG3v5z7uTHvsfZrsE4rt46e
	1FIjZ2GIzQwbrbiNfxmpzU+Fh8JNttWvG+0undoIwNImRMcFCBq+qbYlUl4y6YBRXj8vdHiRhSS
	CtuXqTUyuSvaTXEavkeuUy9P0jVe+9E1UDV9UySl+DW8NlDmKEjx3mzqOZJxJzsTnBpqo63+Mev
	9/ebUTz/fOUWMuPs5dzb/77TyYxBt5qBeW4gkL+8E7P34ERLRgjeRAvqInI6x189Y+8U8zwYwI9
	CWQw9Ke8X8FObH9lCcs4fyJDxisAlUls1CaEA3HO1PHqPsr4bSgo/YiVFd+hiKIWPrdPsPdqbVW
	v9ZOrtMI0dHR3tMJV8AbWna/4YLr+b5cXvMgXPgwfTNSDPXxSytz/W1xIeQHacNHQUvlvrR2OOw
	TaBRetix8HQmYACzuwOg==
X-Google-Smtp-Source: AGHT+IHv11J/UiQuXRPc53mXWiSRrpkDd1UzSDOJ4DL+ON/DEt7ZP7ZjRbXESDq57CD/XFRcpXXCtA==
X-Received: by 2002:a2e:a582:0:b0:372:9bf0:aed6 with SMTP id 38308e7fff4ca-37609e64b6bmr49929971fa.25.1760367147927;
        Mon, 13 Oct 2025 07:52:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77b8a6sm31980121fa.10.2025.10.13.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:52:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:52:20 +0000
Subject: [PATCH] dt-bindings: media: fsl,imx6q-vdoa: Remove redundant quote
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-dts-v1-1-5731ed92684a@chromium.org>
X-B4-Tracking: v=1; b=H4sIACMS7WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3ZSSYl0L4+RU8zTzJMtUUxMloMqCotS0zAqwKdGxtbUAwYGFfFU
 AAAA=
X-Change-ID: 20251013-dts-83ce7f7b9e54
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Latest dts-ci complains about this:
./Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml:19:12: [error] string value is redundantly quoted with any quotes (quoted-strings)

Fix it to make our CI happy.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
index 511ac0d67a7f2360afe22b81d76644575081089b..988a5b3a62bdebeda6b922a986b9ac93d0933e51 100644
--- a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
@@ -16,7 +16,7 @@ maintainers:
 
 properties:
   compatible:
-    const: "fsl,imx6q-vdoa"
+    const: fsl,imx6q-vdoa
 
   reg:
     maxItems: 1

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-dts-83ce7f7b9e54

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

