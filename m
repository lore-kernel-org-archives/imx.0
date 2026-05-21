Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1702F1FDF
	for <imx@lists.linux.dev>; Thu, 21 May 2026 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374720; cv=none; b=i65h9TW6IIyw3rL97xHNdmRmSKgrXKnGIM55+Nc0sIf58L+c4j2vtsJ+5QOqw8oVyMz7GBNPrctaL1Kmkuse6YbERKliAbn68GHrXtfVSF2hdsBeWvFWRn3wkA+8zj6qFXhHw7r2yxcV16PLDuRlkU6OEINdtBFc3DdcWHM5er8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374720; c=relaxed/simple;
	bh=niGbdLtWYmxOuaPaN43bokPEuaiPAfLAecgrPZ1TUoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amSrhe3ybjgmxeZ8pXVgaF/AdY6+7lqPOKC8tXLG8giYZ5V7KJv6HcRDNLv4zqxMcX9erW8wYlywees82Ua6ZRJ1R/O8tlcimwbrmDhk83C+bIHgW5n92hzPa+G39P4qB+9yhthDgUUfAMqi0mvd+u7lyVjG3g0r3X46W3P1rUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH1VyJEf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH1VyJEf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ba1e9d3687so40447235ad.3
        for <imx@lists.linux.dev>; Thu, 21 May 2026 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374717; x=1779979517; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LTiYFbcU6wC49KHcSNJ/mVq4ewVk4truPy8q0vUtbk=;
        b=eH1VyJEfriZ+pG6YMKU1B1pjDyn9EvH+x9xBjm2dPBLkv7USfYuMsRbXusgh3wskaR
         ad+xcOrKVsCDFiDycB6yND0gFe8I5g/RdptO0CHPuYDpubC57z7Ojg1S+sqzJfcPmG+1
         p3yG3GjrLE88b9IGEU9eqkQczEheiuosMyhNO+RNS/BjqNHOj4C89hZX3fwR0eJWMdnh
         JXIYpmS/An5ivrUcRSi8qHJHchs7WcKULPMqo3O6vv46j8mkUk6FEdWGxjOswLkShjtv
         1zGQyT9dbiImQSpMRc6c4A84GPQd/VB0YrC1oapCPdh1COk7eO7w/e9CFb6vXualHqSd
         qybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374717; x=1779979517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3LTiYFbcU6wC49KHcSNJ/mVq4ewVk4truPy8q0vUtbk=;
        b=BDpHxQCKCKITyGrmMxCCDIqXvSQZQ7HMM8LGpveqH7jCsGxFcrz4Yb2pJHOl134Um8
         uOpEMVzACNKw2AWK1H4ZhzQZuUzO6ik9ZHEXAzNA9QT6UIjwqXIOFNiGagcagYH+/n4D
         S3bRmIb7ZPhb1TjR48jXs5kuSFQAGRoykHW3bbQB50VGQn83MpU+zEuf5M6dFE3fBeNb
         Lf2apfizNtNTVxFral0Tr16iuWrujIFeqVEj929YLNB/hdLWdhZDNPF8tNPmmfBmyvtK
         nfhT/2HblaZL8f3zjTBsznOziNBkfE8DIAjURSkZDW+ELsZ3iqk6Bcz8NDdD3XRBq+D8
         Xsyw==
X-Forwarded-Encrypted: i=1; AFNElJ/NtCE3a+iU/A+KzqpXv6w5auTVWEcJoH3S7LXl0ag6siQKZxWWxjXmUQ4kCsCZ981g5Zw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl5Hcux2dTNJmj9653j14Gvm95bkn97OHqueIrrRyYttkOczW+
	izq02mnAu+ncxDNS1HH1kyhLdLi8DXHTNatLnXM/YGDg/XRS9VHracET
X-Gm-Gg: Acq92OHUZwmBcngH23S9VdWPvaEacpeDggyHbae+IKkBEvKc60uStz7vbRuauw7Gm61
	ees9oCzSWmvp8qE7ybwqvrKGx/AVpxDfHQKY7/VnGSP1GeXDyHlfOwTq1GyLN2l1YfT4orRf+Wl
	SlAec9/bzdqJ2UsRcXe86NAU/plwuJvo7QSPvgHRJY1ULaDv7mf6WJvf6oxQ1gA/perPfKk+O7d
	cCpsuhh0dRo3binmzsEhJRNd0xX0n+Tp2z280dx0ZxeKIv40WXoDbpXKpaLdUR7kzcBmdpBt34x
	rReZ3arQ9UrrRAYDqLq+U/ZbP92p2BeVjfANyqTAaHqsvgatEKawh+AiNb9Nw1eOcuOAwe38RyH
	MvYtnh37ruf6CgCSp8HOPnyameLg/fvBEb6Ar5xNnpRzYDMrZ3xKniXuZ0NSqIZh92QsisTmjyI
	Iru2etMdYgiQtuHC1NSQ3vLOy8RmJKUA==
X-Received: by 2002:a17:902:ec84:b0:2bd:c5f8:504f with SMTP id d9443c01a7336-2bea35e13bdmr34721505ad.40.1779374717456;
        Thu, 21 May 2026 07:45:17 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea990f667sm13261475ad.62.2026.05.21.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:45:17 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Thu, 21 May 2026 22:44:45 +0800
Subject: [PATCH v2 1/2] spi: dt-bindings: fsl-qspi: support SpacemiT K3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-1-52bce26e5fd8@gmail.com>
References: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
In-Reply-To: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Wei Fu <wefu@redhat.com>, Zhengyu He <hezhy472013@gmail.com>, 
 Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=niGbdLtWYmxOuaPaN43bokPEuaiPAfLAecgrPZ1TUoQ=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDxpvWmnMnZ47DBxJRrP0paCNfmcE8KttLsrcO
 fWP+VpDyxiJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCag8abwAKCRDN9pw2gLgN
 2EDjEACF70KrGYUz1B8eIr18DxEfVXeO3tv1w2uDnROb018ze368iFdbCEj3A4Wumpzc5w8kcJc
 TMa+xI7ZxJUOYkBY4oqlM9XFzdPtjHJHDmUeIiIXR8uu9o6IXw/ijjK02N7Kgj+GxvLPrjCjFSO
 eDtbVSh5gX4/zb/wl85yojEjGXyedk+jQ1XXzd1j8PtmSFe+oS27v81jTI0cW/iIKMuZ6ZVfZY2
 F0pDcaM5eCgZgmIr3AjDWJMaWmD+N7x8expa/8m6kmfcoBxmckIHD+UN5axI7fI7a2yrNmV3bWl
 pt1PuuopiusSOTV/3cnvV1XOlydtpzfTyPysZVIBwI6iluzeiS387jd7j0jw97l7pDx/La4k9Tj
 v3WSw+LoJc/L1rxwgjwmSfvbsQQ5t/PiJnNMFvSaFkvJnSvHjUGCMiAzeQQBtCjxLjwluczk9hk
 J2XZDVEo6hkQxnd2TZ1dAX4yBp60YDqeY42HfZWTWVc9EqoVqBR8qebOcfrQShLr4F1rAK7n+y7
 DdaZDUB8yvdQvTQE9wHPgYkm0DZxmW4LOZhKO0wL5O8ZtNhjxXTjaf1nsrZV0/d2n0n6ag9TQF+
 nlYc6ZcDfLLpHjr4Gh+IvUYlErDGiT0GrwzRO5gi50BZNfL1Ej+MivsjgarP28XsWaCzNbqUHQq
 HGCObBeI2tXNlDw==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

Add the SpacemiT K3 QSPI compatible to the fsl-qspi binding.

K3 and K1 use the same QSPI controller, so document the K3 compatible
with "spacemit,k1-qspi" as fallback.

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Changes in v2:
- Use "spacemit,k1-qspi" as fallback for "spacemit,k3-qspi".
- Reordered Signed-off-by trailers.
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 1d10cfbad86c..504df31a4f90 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -20,6 +20,9 @@ properties:
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
           - spacemit,k1-qspi
+      - items:
+          - const: spacemit,k3-qspi
+          - const: spacemit,k1-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi

-- 
2.53.0

