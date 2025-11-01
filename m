Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F69A34D3B4
	for <imx@lists.linux.dev>; Sat,  1 Nov 2025 20:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762028961; cv=none; b=MT1Fjhy3lpUCq8O9r4JkQb6X9Hia0C8xeb/MojOyk5kIb40fcgKElJGKe40cQnsMgC7BprPg+ZL+8AoTSoQfozrw8Kz9FaWHWKm2HuCvE/LRZKdrfWP0e53cQTuViyHLeHM7wbmV+eCvMCsdiWblmU8gFRmlC3hcfb5NXjJbt84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762028961; c=relaxed/simple;
	bh=f4ly8cg8WNIJApwHlFk7r+UQI1Q1uI2E782wrY3RmGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s8RCuZX81hLmQeKytdkH+GS3D3vHJWCcqEwIgofXYUkp9nPoiWgeBMSMRDcb7VaO4fgSQP0+YK5hnd9tf25kP6CFsCcg5PDLUCbH6trRxYNn4w43TsLmmFpSB+EPkpGSxcTZFyL78uEK4p2H9IiKUU/WnqqecuBQHgFoE1qmsAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KN16mONW; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KN16mONW"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8906eb94264so404644585a.0
        for <imx@lists.linux.dev>; Sat, 01 Nov 2025 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762028958; x=1762633758; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXG3lN4x/ShRe5qXk1rZTrbqpeJ5XP/xqHhXD9nerjs=;
        b=KN16mONWqSBilqsDEdNaTrhZH23O9OxSwJDPiVvfC/gpqGgoZRMFTSd0x+988Qrdjo
         g5FjcDsyyUpqCtaR0+8Fe5IH/REJFoG6qD5h61O1EsSzSEkdE2DwhLKfYF7jwkUljHMK
         ir6BkyfCVAQUNe8321qU9KHgOULZUVl0toWG05p8fKI37zxV8isidu5Jv/waEhKOVtWf
         Bj97gry6IRR8vrRcgJg0cyXQFvoSTapaRIL5U5ZujLdOo9a0Vhz0QZOJWuhEDUuRwBwb
         uBj/Fgt5/TrW5FpcA1eKB5wWWMMtx0Guc72wpw9C3tT5Cm1isQWekaGVcAF6PI1aSRB0
         3K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762028958; x=1762633758;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXG3lN4x/ShRe5qXk1rZTrbqpeJ5XP/xqHhXD9nerjs=;
        b=j/93NyX+zFBvTwVuZMUxGfGJme9yANumI+P6DQ/xhqZBeLEpdT5C9wIk7qPCnCXBeD
         he2b0vTkdsijMveZAQTPtI9EWREx0R5KHGkiu0mU6j8rRQSPj0Uu1LAEJLyr2+Z98h8Y
         tDh8CzjovRJZFJJE5kO+cKnEPLPgI/JNiJ2NzplRcUxN/q+RWy+J6cVXFTjobl5qXIBB
         8krAgl9vMuF6PPkLUHglNP+EydeQm92Ns9zo7gl8r8dtI2JdQ9u7Cu4xy5NiLfifKvaF
         EtfoXDdbdNbdY4fY4bTxR2y1PDUq19O8JP0QxnXLygkszAQvyvRTwXoA8dXGGmztx/NF
         dK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRsQ2KmfFK+ZQJHztjVXPXlu2lLCwMtPm1mNapDZYuOFjU+dX4MPkPfIHJiefOkz6rayU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsyzq+liklojVkVjppweF6eYisHAwDc9lwkRCJJQpV4zTSzYrB
	10Zv8+w52Sn171h5SFde2nJsI0LkXIQu1ALs9vcQYkysWcIBWddD3Maum6+rwWwm
X-Gm-Gg: ASbGncu9padu+qpePXgIGkamNE3MwVydgOzs1y2NlwZDR7W16scxb7CGSt+ZrFQwDoE
	S5cavCcslNOJVUw7PRRiZpSMIEcBLV8aXTg+X8b9522/iPt55FvnRkEPXDcZR8xbHC3NXb2W2Rk
	1XtxwGukwXpHOAh5bc5k+8ldXF8WE6xZcrMRlWEo7EQaOavIN408r9fQjMs2tFK6k0meqjhVcvq
	2JcpamTXlvCIaqEQDY1HQJbSQEt9+zyE0drwBss21w1booiuzhtBdu5Lei/j+zIunsdeg8Mzxi0
	ePNQQUs8JOqFlZjZX9Z5ooraZMf+82Q4i1hiz9QuOCfPRZEX4yH5BoUt1s+odB4DDAfeWtMAB68
	WxZS4SYemIzKs+sLatz/tJGKtSIwK4/N7pIOLJlCvnLBl2wW/jzV7InnZnd2ICgzBiDPbkxvQrU
	ONkV/L0JmrkrGvHNRb
X-Google-Smtp-Source: AGHT+IGIbFfwxftIcSQPMj+XA/sS67b8NDWPfF8Kb4beEyqUHTpSix4Gfe2Z2Mgh1GHHIM3iPiAGoA==
X-Received: by 2002:a05:620a:4016:b0:85b:8a42:eff9 with SMTP id af79cd13be357-8ab9acee01bmr979641085a.53.1762028958452;
        Sat, 01 Nov 2025 13:29:18 -0700 (PDT)
Received: from [10.73.222.215] ([142.182.130.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed352deaf3sm30290891cf.29.2025.11.01.13.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 13:29:17 -0700 (PDT)
From: Samuel Kayode <samkay014@gmail.com>
Date: Sat, 01 Nov 2025 16:28:47 -0400
Subject: [PATCH v2] MAINTAINERS: update PF1550 driver email address
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-update-email-v2-1-175d221ec40f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH5tBmkC/3XOQQ7CIBAF0Ks0rMXAUBBdeQ/TxRQGJbFWgTaap
 ncXde3y/8l/mYVlSpEyOzQLSzTHHMdbDbBpmLvg7Uw8+poZCNBSwJ5Pd4+FOA0YrzxY7FvwEjX
 tWZ3cE4X4/HKnruZLzGVMr68+y0/7B5ollzwoG1qN6IDs8fzpt24cWLf+5ESPqf5XfjzrMROv9
 yGWQ4M7b0BrFH1QApwAi85YoU1rlEJTTR2MlL5i6xvNc3la9AAAAA==
X-Change-ID: 20251029-update-email-f8ab42d1a5e9
To: Lee Jones <lee@kernel.org>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>, 
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>, 
 Samuel Kayode <samkay014@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sean Nyekjaer <sean@geanix.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762028956; l=1134;
 i=samkay014@gmail.com; s=20251028; h=from:subject:message-id;
 bh=f4ly8cg8WNIJApwHlFk7r+UQI1Q1uI2E782wrY3RmGE=;
 b=Q6W8p83xhBLpUQv/Kus5iJ+jaQweIa1jJo11C9T/BzNslQMtocpefTW+kzY7l7u6foGia4ybA
 7QiGFn5K8YlDSdV4wiFd3OMp45/q6fFwtcSIcyyU1S8H60rDS8ZL6HV
X-Developer-Key: i=samkay014@gmail.com; a=ed25519;
 pk=favoK08ilD1j62PrGf+RHihBzbqJGWMC6f2nszR5UIc=

Update Sam's email address for the PF1550 PMIC driver.

Signed-off-by: Samuel Kayode <samkay014@gmail.com>
---
Changes in v2:
- rebase on ib-mfd-input-power-regulator-v6.19
- Link to v1: https://lore.kernel.org/r/20251029-update-email-v1-1-f38f45aac2e8@gmail.com
---
I left Savoir-faire Linux but I do intend to continue maintaining this
driver.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a9330f05e2fca6b8661bb698dea17dcfd7fc254..c44d2cf7e7b85104a6eb09142da8ef3d9fa7e55d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18608,7 +18608,7 @@ F:	Documentation/devicetree/bindings/regulator/nxp,pf5300.yaml
 F:	drivers/regulator/pf530x-regulator.c
 
 NXP PF1550 PMIC MFD DRIVER
-M:	Samuel Kayode <samuel.kayode@savoirfairelinux.com>
+M:	Samuel Kayode <samkay014@gmail.com>
 L:	imx@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/nxp,pf1550.yaml

---
base-commit: a7d6255a0bf302c028ac680564633a6aac5f611d
change-id: 20251029-update-email-f8ab42d1a5e9

Best regards,
-- 
Samuel Kayode <samkay014@gmail.com>

