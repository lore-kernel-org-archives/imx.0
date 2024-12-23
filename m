Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AF946B5
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734960674; cv=none; b=UhEfnNoJWrrLIv09s1tY/BnBntJg4r4dRv5/EiSZDp/SPtq6O3osP5/SlfjRqlSLWAKQU/Cd9uDBCazA80Bi41eNDTYTtMbbB3FDWBH5xi8U55bbIF6RYYk5h9Gwdv4rXQllwt49TCEworgHD1/6LrVj+0+dmJnCmJu8dtZAZQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734960674; c=relaxed/simple;
	bh=o4Fom0Rpm9fWzhbvqugXg9BmbPqo3cs/0znTlLu54ck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lJodlWKMB5Mepyk4XiGo7MbR3E0uSPRQWliBL87+BBNjK5RIyVT5yYnxiKJH57LZiF6GpU9AndYJvmT57sEAmOOk0/7CW54oEkiKv3TQw7iVGHMk+tUnk9XdOjHUqhl14EPdabHVWDptGf/TGhU3IxEp9WTeACMTmrMBUM2T19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dg2kBSfS; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dg2kBSfS"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaecf50578eso199107166b.2
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 05:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734960671; x=1735565471; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0E20nH4nI7hZl+zQi4Z91y7ffU07fB4nfSqv0rzeH8M=;
        b=Dg2kBSfSAPBfC2nSXMCorS3GWFLbQ7OagBdmWT2a5muAgbkTuv9NzBHgEDR0xuC8WA
         haZywhyNoe90aL5v8WVEhhhDgvwdTlL9g2uIdV/W3opRWikacyxDLgE++Ms9WBkEhqT6
         wG/rGPrFi+AbzSXYz4IBoWTOrSUC5sXN0rWt/tw3oKIbk1OjAYxwrlVL8vzGnbPBHHZR
         SBCCLlmZsoj0kUDP5LtdewcSLBMJloWaRUNUY8X1rvgetb4Gi1dim50H9YcOXaMSimdG
         0AVxz2i62LSiuXe9QapLaUSLhJ7Cj9Wa2LCus+qXVMQQ8ErbAzap5pqhY9lMliuPya0n
         yiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734960671; x=1735565471;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0E20nH4nI7hZl+zQi4Z91y7ffU07fB4nfSqv0rzeH8M=;
        b=pIUk2batOY0ZtogZdmh7JhPIyW0H4sUvX2zINkwiXSu7Asaspbp0a/PUhfv1l66P/k
         VYIAndYjrMOG5aGg3wycRlUdZtH6lfGxI/lQjy1SOGbaEx/8/IPumWCvD23BG9EfUn+B
         IO2KsfmgMJk5v4/GYJRSk9DexFD0d8sZWrm7YH9c7vJOLDoeWPvpTDdXkaKDx31c0qv2
         Lkpy/OjFhJBR0ZIrDDqsehmQtudcMWvoHZ7CqyHK0MMotfMVAdvgpWih6Mac5Oc4cHaQ
         OkpjgW4NvhzD+LZOD+XMsM6AvX40A2R/J3c7JepGYrimTQJAxnU4UnckFo5o64XYDb7Q
         DEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJsHJ3TxXIeFUbvRBeqtlsv4zW7rWnyYns4h3s3z2IB0+XTe02aZ0SlcpLWwnaTrwJiFc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyE7vSHsCIh0QM7aerVhG21oDcDisH2haStUpTFyteYRBUWw5td
	6aoK95kwlRN+yyIucjwYacvzZueKa/tUOBk1/IMY37GaeukIKC6P
X-Gm-Gg: ASbGncvlhLUkjip4kY4A6uxxv8jOOvHvpNfXojAL4EP6AFRSIaIIwFQVmt34Xm11jqL
	pqwPuvSjfQ6P//EjBewa3Ai+qppcXpxFxKXOeBRIUsG9lPngtVFbX91bifNXNA+5TTm+5yEo0Rl
	EPriBIb8RPo7qH9mGmV6Pu5mbWvY2rlx1n/OjHlqfWEbDyNqXHZS4MzLKm4xZM870XkxyRf7eyn
	BKGo5++ron8vqP0zYp1QBwR5xZ/vSD6mzPoXt1I4c02wbwLu8I92EWaG7ho8WsJPzsgFLIYX76W
	lB9dRMSoRHlS0JzlqQ2ZN1yv0w==
X-Google-Smtp-Source: AGHT+IFtl3Jc4R8ZM18OiD8T35sINFW2yCCL1hkjUfHrIzuM/MvcGihGAKcF6iZA6+Q/hgFepUAa8g==
X-Received: by 2002:a17:907:96a4:b0:aab:7507:7a94 with SMTP id a640c23a62f3a-aac2ad84badmr1228517466b.16.1734960670508;
        Mon, 23 Dec 2024 05:31:10 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e895502sm523749966b.63.2024.12.23.05.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 05:31:10 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v5 0/2] power: supply: max17042: cleanup and more features
Date: Mon, 23 Dec 2024 16:30:38 +0300
Message-Id: <20241223-b4-max17042-v5-0-e4e409723bce@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP5laWcC/32OzQrCMBAGX6XkbCR/bRpPvod42CSbNmBbaSVUp
 O9uKghVweO3MDP7IBOOESdyKB5kxBSnOPR5lLuCuBb6Bmn0eRPBhOKc1dQq2sHMNVOCGsmq4HQ
 JAZBk4jpiiPPLdjrn3cbpNoz3lzzx9fr2mA9P4pRRg8IyjaVCXR2bDuJl74aOrJ4ktuznD0lkN
 rCyDhp4ZcF+s3LD8i9Wrl3rAD0oAeynq/50VWZr7SpvjJVe+i27LMsT2LeUIloBAAA=
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734960669; l=2342;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=o4Fom0Rpm9fWzhbvqugXg9BmbPqo3cs/0znTlLu54ck=;
 b=f8X4xAir/UsYai9B01gBdXs+JRfS4B/GpHsSQ6bQ+wpNPfRjetFZ6uLzwavBXVG0SW/VerEor
 87W4HwyJbVHB0I2ApwmvSY313JIzXsnoxdlHPVOGMYxp9vDxQqJ8SlI
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Shared-irq
handles that case by requesting irq as shared.

Maxim PMICs may include fuel gauge with additional features, which is
out of single Linux power supply driver scope.

For example, in max77705 PMIC fuelgauge has additional registers,
like IIN_REG, VSYS_REG, ISYS_REG. Those needed to measure PMIC input
current, system voltage and current respectively. Those measurements
cannot be bound to any of fuelgauge properties.

The solution here add and option to use max17042 driver as a MFD
sub device, thus allowing any additional functionality be implemented as
another sub device. This will help to reduce code duplication in MFD
fuel gauge drivers.

Make max17042 interrupt shared, and add platform driver
version.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v5:
- platform version: use parent device of_node as current device.
  This is because mfd driver matches fuel gauge node, and max17042
  platform variant is intended to match a mfd subdevice.
- fix platform version issues.
- Link to v4: https://lore.kernel.org/r/20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com

Changes in v4:
- review fixes.
- Link to v3: https://lore.kernel.org/r/20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com

Changes in v3:
- pass dev pointer to probe
- Link to v2: https://lore.kernel.org/r/20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com

Changes in v2:
- drop NACKed commits
- make shared interrupts unconditionally
- rework descriptions
- add platform driver version
- Link to v1: https://lore.kernel.org/r/20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com

---
Dzmitry Sankouski (2):
      power: supply: max17042: make interrupt shared
      power: supply: max17042: add platform driver variant

 drivers/power/supply/max17042_battery.c | 200 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------
 1 file changed, 142 insertions(+), 58 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

