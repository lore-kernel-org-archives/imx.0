Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31B31B6CE9
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736689153; cv=none; b=SDLLIg/3OiFwqrvhRNPdaF/tB3Mj8BzH8bWA4eyQVbGpg7cwRfAt2+ic9yKTPAbCYNl8stFUvxwaLkn8fq/0ld30zets2UoXolC+yfbNGe3UIEMCyAhuHmvZX9jVXK/g1H4mnacQYWqonxTNwjcsDVnvYk6btO2CbMJJ42wGOUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736689153; c=relaxed/simple;
	bh=x+i17n32J9BE3xJWGZWzaweD1AZbhL+oqQjbrPfkdJw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OOH9O6q4//DPDBtaKIOpeXg4QQFIfIgqTFdEkZwkB8X94Jv1n1CpxhXe+GLmfxeSsYH5eXugqMg9KGtxDLRViR+fEozAqxWWB2uKNQy0tCAlPi/lalzQnFLu7G2j/9/F0ay/iaPG1KGdZIHg/Oc7BwK+9gruJmim+xF/SmlUHco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lfV/bwUR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lfV/bwUR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43616bf3358so4500245e9.3
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 05:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689150; x=1737293950; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7Ty18ut1e9jMhl/AkSFuE2MdVzmvveKnbQmIojHQTU=;
        b=lfV/bwURI+irfrP0A3shwFNeWsI4nVmlRqMbnsi2aj0F2PyjU7iAHq3Cm1gIHxpq1l
         n5lgT9LuGsCC7b9c0Dpp+fix7fJ2mBgdP1LWgZjiSStwD0e2ICrli9/fXbXfYPWTv343
         9eRCjU8iUPgW/eb4FxuXrFS1xT6Lb6pnqm3FH8qFKgpdRQxrDjfAUl8/imxhyU0VsGXP
         EUXDoOSfgHTf2WdY1yTUwEqdP1n7ixsAz3JLa5mdEgFtgWOp+k4iNWSOaVacGL5QO+ke
         TaFVEWU3EFmzUbzGKv7t6cPoSLcn7hNm//uZD70hmAO4MntsHlWc70fmYVx3ibDzE6tn
         IPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689150; x=1737293950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7Ty18ut1e9jMhl/AkSFuE2MdVzmvveKnbQmIojHQTU=;
        b=ELx8ZmV98kx+KL29jQ5gSLzAYqHJUcdhGE9K4g609Upfd4QWcrcw6QyUuH/Y5rjlWB
         lhmoIrPOG+MEw0BT3TDkpwQiFY07cwaB8ZxRrs/Oa/iDgcxFMCe0dPWhaeyx5HM+0h68
         xpTzEDv38QGfBH2hXS234kPlLML5isVr1fo4fKmnzK7uYLNfZOpxoy/kkhu7WvI3Mmzc
         aZGqps7TOJe8tJ1tBeuWxb9KPmVFqhAo+rmA34VYw7B6kNd9QymVbP/KP9VvuhO4NM3j
         6DwaeLgrh0A74D+fPzWIZiAk7bBfW6RHhOA26juL1Yu7kh4WaCB7XUIvNyPPMShZPYg2
         wBsw==
X-Forwarded-Encrypted: i=1; AJvYcCVHl9sZSD6tZucvnNULyN5WmrId9m4FuHpkPnElCh73Wyiu3DTo3+E+vdK4QNv6GdidoK4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzSJNU3aSDK2bjlP8eUm6eMvlSeOXLmKHdjr61R5FTxd/caN7j
	E9vjaK/AsiN2wPJuTFcGjxdIwZvIBFF7elp9KPFci1uxzuOzVufvI87HU014ihU=
X-Gm-Gg: ASbGncvSY10/gEypQRIDIMzjES539Qso0xxX2iO+eGU/xqJ+XVzSTLQS9Al60U3+PyD
	725acVZKchvzzkO+liWR4LX0Sw/0Hzxlo3r23c0mpva8RwKvf0+jkqmG/VTsPLeMcM6qVK9Ps2q
	0I9kCYfnfbU1q+wi8Cg8Td21d12YYO0MK+zAGNeYFbVFAbrBzcp0e7UWtkMIk7lQr41IFgEkgOY
	Z1JkIlD22GR+m+eSE5fuz99oIUn82+uB0mUFSJsIHY8d+81XaKmThPt32K3L+su3aj+d4RL
X-Google-Smtp-Source: AGHT+IHhfop11bEN74u0ET9V0abdMLDcSBys+gSbyZcc1Oyi50RffMGbjeAYxlnbPrRkwqyrU0ID3Q==
X-Received: by 2002:a05:600c:a09:b0:434:f1d5:144a with SMTP id 5b1f17b1804b1-436e2557087mr63456395e9.0.1736689150005;
        Sun, 12 Jan 2025 05:39:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c006sm9581924f8f.46.2025.01.12.05.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:39:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] PCI: Simplify few things
Date: Sun, 12 Jan 2025 14:39:01 +0100
Message-Id: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXFg2cC/x2MQQqAMAzAviI9W3AVEf2KeJC1akHmWEEU2d8dH
 kNIXjBJKgZj9UKSS03PUMDVFfh9CZugcmGghrrGOUJ7zJ8BY5F8CC5pM4xekYe+a/uBiJmh1DH
 Jqvd/nuacP7HF0+1pAAAA
X-Change-ID: 20250112-syscon-phandle-args-pci-d97537922ddd
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=666;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=x+i17n32J9BE3xJWGZWzaweD1AZbhL+oqQjbrPfkdJw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8X3fpKo9Fo2SJTRBmFQDvDSbyoSOE5+H61jh
 WVIyJ+vkH2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PF9wAKCRDBN2bmhouD
 1wnKD/4gxTfv+tXPYb5SNsiZrYl54aARJsvzHavNU/1Oep+K0WSyRw+jj2XwM3C+OYsw4RhApPR
 2OoXL0k+JjPCwoDdX5E3hGTdIpJR3TrixOEteHnc3xs2lxeeHh3nt9iRGa2ZjMlE+5p12BDy8K4
 hnhqOE8qIT5+j7vsJwTJt/7nQqwgCvBRY9JvlaKfc1TRRIY7Y4dOzvSSKhjA/KQrO18YaybJ3qq
 Bnace1Td91tf1hDQwMy6d/pmermVgtYHqtY84HNY7Rcqyul7VtiTmoXXPSqruEIKxupAoJie3T8
 hHv1Lj0AeEV3geNQ8/CviDs5+fHAt9ybjCdLevrdhunHcEic2U9dlpx0+Dn1rthZJj3oeXMdMno
 iWT6sI7VL+wUD7SrQBWQlst3HfwCKkQqj03Leh90PKuvyIeRaqgp+ZokavbtdyO4Mpd0gMgrL7Y
 gNBtIAMICO559+r6VpoXytH7OdIJKJ0Z7Ohn+sKk7PBh8kHMkC3+JTjNtSWQhyDNOcmh7Tu42DV
 2njcZXMQksL97QcbGfAcgi8U+WsG3HeITLzJVuNq8e8YHOuyjLNHhmeJ/axSTjMc0n5uiT61P4p
 6Il0Pk1UozPnyoc+VNNbPIYwGwkJ3S//dY8kkyV+srFvKF8rARseRo4CqNKvnnfVky4ozzDmdXA
 lSYkUsupahUkEmQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few code simplifications without functional impact.  Not tested on
hardware.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      PCI: dwc: dra7xx: Use syscon_regmap_lookup_by_phandle_args
      PCI: dwc: layerscape: Use syscon_regmap_lookup_by_phandle_args

 drivers/pci/controller/dwc/pci-dra7xx.c     | 27 ++++++---------------------
 drivers/pci/controller/dwc/pci-layerscape.c | 10 ++++------
 2 files changed, 10 insertions(+), 27 deletions(-)
---
base-commit: 2ddfbff29a2d45551e8c3e4f0c6b7c4618de24b7
change-id: 20250112-syscon-phandle-args-pci-d97537922ddd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

