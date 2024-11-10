Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFDD146A7A
	for <imx@lists.linux.dev>; Sun, 10 Nov 2024 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731266671; cv=none; b=sPf4lPKmn0eT7aG7qNqxDy4kIpjWHGimW1IONots7blydbYglDECQ11SWk98MF7J2D5gZRJSydF2qe1NyGRJZRljNbhx1FwClFt3oAEaoYTqpv0+ZqjYhXCuAC0BPZFZXDdwkThNU52F6wy6LnORZedfcO1DD0vW1/4pHYGjYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731266671; c=relaxed/simple;
	bh=gES/YI8J+uY43qFcYFJFQDdZCjIIvFKdVHt8Cx7j4Ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6R29HxcZn+z5pamznpxDlQlaXZ57nXYCNPYoZvEd/ysGFRapEfFeii7e1/0tBp8GKTrHqxTea6QPUlE+XiMJA0NS9I4ESd1rLjmPJW6cEdgFjVK5goDQUJYOXNkcN9a1gODlhGmxN53AJUM8U4ZBqvrFkUsk91PyRsMO9/i5dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzCbvWZS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzCbvWZS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4314f38d274so48795765e9.1
        for <imx@lists.linux.dev>; Sun, 10 Nov 2024 11:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731266668; x=1731871468; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7VSA4VpES10XaA8gB1WdvZsXgmDNfsDCe5+S5WIIkA=;
        b=PzCbvWZS3yNrzGaBeqsFNWg76+ZJP9basHNjtflx+nIv9THDpe8VQVpAP7o5aFDAsz
         obb1DVlOSQH2j4+aHBj+UUFMy6Li+nMYekmFDT21zB5XwrERC5Jfix084yJH10o9IUMw
         O0PIqL3btv6x3CbrDpeqpjRUvfL+XzEKhnp8aW/KWLD3iTGXNkh4dK/oDYLeiw7Eft04
         VQ3vD690gVnFz5nLFwqIakhidgz2RPEjsGV3DA/QhmsR24lwKVR/LWxq3GQ6YutXExZ5
         pPyNRvPm+DaI1JWQbIJ3F/ypQ3A+Qc5XWBoQVeVsE0A+fx741QxVhqEPousHZbyR5Y18
         RnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731266668; x=1731871468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7VSA4VpES10XaA8gB1WdvZsXgmDNfsDCe5+S5WIIkA=;
        b=RinnHzzLeC71ezpsNKKX9wfis7oqz27DG9KojFN3SHgWyOUkqlseuRbaDKaIkgCJ7C
         vhnnh9p4mxLTUfwOl1OdCGmScBynUSzQg+JVDYMhfAII1rWsqIVFLjMXXU9qVpuKm+mx
         ekGi1HM2vsVqK4rbH9fvnxzpMWw3dzVpGByh/VmN0KAqf64IZ1Zgp74l+v3fHEfOHXiO
         BwNOJ0yISXD8KLb/5M/zRStrAXVekEiF+Gjtl+9JMlhUv7gPEYEH6IxCOyFgEVI07iY1
         hYIiQgaXfpIO7Cu1S+q/IINJNHHznUMKoLJdGKby+SuI3HYT8Nv/imx/CTATpgNH1iVM
         o3mA==
X-Forwarded-Encrypted: i=1; AJvYcCXdF3j4QCDLF9UovuKJmIlSX8bNXQYEBtBjgP4+bf05CHou5nzVVrmLmCcT7Op9/PPSyx4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXiDZXMogvBQ/veo5+Y0qUOyeR3G6wWugJhLx1njUfCCWe3K9h
	gneBOfBTZq1qdzrXny+wz+6znRH0kgC88OtbuQR95tcmJVJZXo5v
X-Google-Smtp-Source: AGHT+IGgpSw3jllLpv9qQZg4A+baIMwrCRGNX/rDvc376OiGzFy2u/Lnf48/wvV7+Plv5EMw7gqc9g==
X-Received: by 2002:a5d:6c66:0:b0:37d:47e0:45fb with SMTP id ffacd0b85a97d-381f186c5f2mr11167988f8f.21.1731266668020;
        Sun, 10 Nov 2024 11:24:28 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9ee0e0fabesm502497666b.174.2024.11.10.11.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 11:24:27 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sun, 10 Nov 2024 22:24:15 +0300
Subject: [PATCH v2 1/2] power: supply: max17042: make interrupt shared
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-b4-max17042-v2-1-f058f7a16bab@gmail.com>
References: <20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com>
In-Reply-To: <20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com>
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
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731266662; l=1055;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=gES/YI8J+uY43qFcYFJFQDdZCjIIvFKdVHt8Cx7j4Ks=;
 b=hkNy7+sERWKdTJVRRUXl6kSD0hutXgVSx9H34Jeil05Y2fuKUhG/CScfxoHg1ESGkG6jYCRBA
 rN9iIrmtHkCCHftg66YAeKHeBlQNA7x7LKlJkd0nxvrukflRvAwcT+L
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Make interrupt
shared.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/power/supply/max17042_battery.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 496c3e1f2ee6..99bf6915aa23 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -1103,14 +1103,7 @@ static int max17042_probe(struct i2c_client *client)
 	}
 
 	if (client->irq) {
-		unsigned int flags = IRQF_ONESHOT;
-
-		/*
-		 * On ACPI systems the IRQ may be handled by ACPI-event code,
-		 * so we need to share (if the ACPI code is willing to share).
-		 */
-		if (acpi_id)
-			flags |= IRQF_SHARED | IRQF_PROBE_SHARED;
+		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
 
 		ret = devm_request_threaded_irq(&client->dev, client->irq,
 						NULL,

-- 
2.39.2

