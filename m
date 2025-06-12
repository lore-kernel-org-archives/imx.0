Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A02D320B
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754258; cv=none; b=XhpxlGU6vSiawrp0wH4G87tdJxWot5Ubp3M3/YKBEgs6MLlt9rNtAL02IYmBXvWGt1ESLSMX8VVszCu7OzhY/PE6Jw3dkoioSjTfjj114ngKn5eg8YwfODrywwvaGmk3ZCmcTHUNJ6iNQnSe1VsbuUfAAguTYRgy7BBCiSPfGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754258; c=relaxed/simple;
	bh=KzTTs/ugVGZL81EZM6r1DC5THbX9ekJQpMdwtR6aQYo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSHB7GeRsq6GXZMC6jdb3MwnHIgCdX7Q30T/liKtGoEz7kcGB1Fi1rn7OalrAI5d16fqyX9Xya9yTpGwq55gAa+2NVbDscdT+ExkUMmlQ/07HmP079b4ce8cnNFAOoUayzHJllIuQaBR+27f0Cg7m12vzCAF2f/qOij8XN4yxvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQ3cII1j; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQ3cII1j"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d6ade159so11711065e9.1
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754255; x=1750359055; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/WDJPrQPxRbp8NBRHRZm/xuQ8N47zspth9KJHjwxXA=;
        b=YQ3cII1jQ8UNBC1fG4rNkjCqi+dC8JzvpJ5R6nm+410S5kbK7Q2QE0K9BU03gvChEq
         wnmuz2eePxljqihWMyF6f91F7WERUuxWiEZ1srQtp+2xLFHZn+OJGdABQ4b2xIM16ogs
         sSzOuFVd8ZDtl+vsD1ai3FP9m9qRUNxMcW+Qo8radPcS+5NLHwq9HlIM8sp9H9xgtK5E
         BJ15hXvRrci1WrhXmZ+yqAgsTLdvi+eLiZSwDZxU317JSm+pUXiKt1ANu5vRDiOWM9Ec
         uHr/0+sWdk/dU8bpvnBFG6/EPUKEPMqKGjAx9GgkylSPE59c7nyybspoSvfm7wbfotW+
         fCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754255; x=1750359055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/WDJPrQPxRbp8NBRHRZm/xuQ8N47zspth9KJHjwxXA=;
        b=WViEYbc8lqc0jQTdwNCqU2oZ6zt1RH1C45Mn0GLBkadS5zes2sd6zIXA8Hk2EPYdpd
         VOSD+ZJaBKboadtNKZgQQWqzFVTJB/ilmbzTihniwkZn0IcJ4djJJyz7RekN9vOydYrC
         tsNpxvNYRG2y6Sb09m7gWzfHQkjoXZbmizMUrJVfXzvJuGK66CJNfik0vRnnIGCo9661
         BaaL+WyEpbR9oWHbakEOTgIhoT+aAzuXgqg1JVF6+0SmsKV0v7knHA1FRBXP+ef1OXVB
         2d6ChD4GyuvCRTn5UtKCrn+8bFjcvq7d/SQVV8dllBvuOe7261U3S677rsjQuxj80lVd
         ssZg==
X-Forwarded-Encrypted: i=1; AJvYcCVIHeH1Vh8TdoiiYeQKxAMMJkqpTm7+Y8CBW6ltrd4XiRol8FRjBuC3OKfIAfsSVzReSbo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+EzjkLn6LplwgKgynHOhv3d2Sxgswwntf31ObK3bObY5ZEuEd
	gtK1DIdbmmZDCEMinUd8xKh1PfLCKtlE8vHjVWiSnakJyxWOBuKUA8al6CuV5lmYRgM=
X-Gm-Gg: ASbGncvBZf2Mt+ntaX6d87x9DSA8hZuzrpJNbFe2bR1VLjpSCjqECUmynFCiv5laWVi
	5mGjQvDogKR8A3wuBoCvtLRYempjmQOOXpg2d9OlUmoOUfGI8zmdjhFSB9cXVmXu+hodQiuEae3
	WBP7c8gTLJwQ/QQC/bJHLqHmFcNm1AcHiM9iSWYO1Atzw/LlQn/0L2V85HRE9QJclAntNfeYMle
	oyZPwYO6VK82iG/VogrqaJRfsHEz+WJGVzGQoH3+VI7x4Ox5tpxmyPdBu0531e0fB5kVMPrL/ru
	9SvkKtOrMJ12gy0uZNxcf0eGdUYyXGs7JOaMfOZLxetzDFTbUMT4Z21OpZQ2w783yflEuVEfexV
	sfLMhkA==
X-Google-Smtp-Source: AGHT+IGzQ7CInmhyLVNO9NWc9ioy6OsDMOMV4BghZVu8RO7M8cKhgzv5GG0sczaNKS+6ukRU1kkY5g==
X-Received: by 2002:a05:600c:1c86:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-45334a83221mr2953015e9.10.1749754254976;
        Thu, 12 Jun 2025 11:50:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453305a0d9dsm22086435e9.21.2025.06.12.11.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:50:54 -0700 (PDT)
From: Ghennadi Procopciuc <dan.carpenter@linaro.org>
X-Google-Original-From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Date: Thu, 12 Jun 2025 21:50:51 +0300
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 1/3 v2] dt-bindings: usb: Add compatible strings for
 s32g2/s32g3
Message-ID: <cb3970d93f2df0d350f3f3de27d9f0cdb41d0d3b.1749747898.git.dan.carpenter@linaro.org>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749747898.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Add the compatible strings for the NXP s32g2 and s32g3.  These chips
are mostly compatible.  The one difference is that the s32g2-usbmisc
device has an errata ERR050474 which requires a special flag to be set
for handling packages that aren't 4 byte aligned.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes since v1:
1: Alphabetize
2: Update the commit message a bit.

 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 2 ++
 Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index cc5787a8cfa3..f6372b76ed5a 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -23,6 +23,8 @@ properties:
           - nvidia,tegra30-udc
           - nvidia,tegra114-udc
           - nvidia,tegra124-udc
+          - nxp,s32g2-usb
+          - nxp,s32g3-usb
           - qcom,ci-hdrc
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
index 019435540df0..ca677d1a8274 100644
--- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
@@ -21,6 +21,8 @@ properties:
           - fsl,imx53-usbmisc
           - fsl,imx6q-usbmisc
           - fsl,vf610-usbmisc
+          - nxp,s32g2-usbmisc
+          - nxp,s32g3-usbmisc
       - items:
           - enum:
               - fsl,imx6ul-usbmisc
-- 
2.47.2

