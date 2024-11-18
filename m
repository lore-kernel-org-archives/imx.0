Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119EA3D551
	for <imx@lists.linux.dev>; Mon, 18 Nov 2024 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924604; cv=none; b=MZLfgqS74U7dARniGTVGuZmz3eTpz1DDn4jXmtm8rMmJZoKdhbDIvb2M+skmOqPMiJ/tVJdMXTPg1nH7mMZtuOtNwQ9qYCgXdDW/riVQLZa9wsQCb0IcmI5HI9JIho09DiZVa8zec/b+nXXWTIb5pOBmMagoccRHULDp2s757oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924604; c=relaxed/simple;
	bh=gES/YI8J+uY43qFcYFJFQDdZCjIIvFKdVHt8Cx7j4Ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mz+RVnwbbB3XZ2TKBIhsxDoDl8pwyL3B28vWhl6ppdZE1WQzz2iVQsd7uzWogqujofBYVYpZ5dgzWPaho4nNE8Imnt+R2xVE0kjTGJ9dKs7BZTdhn676ghdbL8m6mEESKA1Dz5uiGkMBGIl8g9tn8mq+uXdFeKvNJYAQLlft84s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mvv/RNp2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mvv/RNp2"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa1f73966a5so387613266b.2
        for <imx@lists.linux.dev>; Mon, 18 Nov 2024 02:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731924601; x=1732529401; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7VSA4VpES10XaA8gB1WdvZsXgmDNfsDCe5+S5WIIkA=;
        b=Mvv/RNp2i9zimnCTOxYwpPXpfAyJQLZZEd7iyUMLmjofDZS1KPSEOvJ3ZA8kgb0ony
         gDmXo7zh8LKVvoCi8M6o5D/m+nVgrFiN/qWjfD4Vh6mwFyfm2er5VEEeLwxOpjX8ctWp
         sVytydlo/vIHDgmGKOa94WAEQwwBDEvksIg0WdOeqUXvF3EenvCljRe/IuTWfPTUdvV6
         OGdQjAp6QHGjjPaIcYijIINcan3ix2Cjqt2DawnOocEI9X8eH43IlpYX+FKrm8jduVBL
         UxyUT9znIPFscS0IMeqbq69jLypNg/PTsRJg68v8WLoq8POjH2zzscXIosGschIsYN0D
         XLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924601; x=1732529401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7VSA4VpES10XaA8gB1WdvZsXgmDNfsDCe5+S5WIIkA=;
        b=pVdG/FpCxu5/zNXDWWy/2jOfEmMOiJS216OdOn5KB4tFI+0Zt3PPzi7GsJr+J2abn4
         7uKa1HPjIdV+UhvXDlF6IfRwQtLw46CWMwqi/7SPH8xXwNbpwgOzAeYb2/Kp+8vJKiSC
         WzK21Eh0osPb5LV2U9V4TSynPEdVOloij9yKRKtoRLqLuGQhUIKxR/lE2Jfp1Y/hv6Ph
         5nxqSyBJ7cXaBesAiEjC11Rf3M65elFRzhdO38+1HbOnQh9+34C7ovHBVxuw+JW7DFtq
         WB9aquKMh6DaPFKoPjw8Kb9sXTWdc5TkMHDUCnuxDwfOJu9Rg986cLuF/pNLvRAQi96+
         2fMw==
X-Forwarded-Encrypted: i=1; AJvYcCWqs8wYYbqj+RlhZFtsgO1j2h4GMs+jiG3qcJUmMi8n2CnkrKHc09lebJa75ysoyWlA2jU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi9H9twObKwyYS1m4KHCbzKax6IIt5/ROakush37DTGOtYX93u
	s1xLq/JzqS/dA6fq6JTFt/yepPQGYJF3+zwLURs3QtD+0vmaKDvb
X-Google-Smtp-Source: AGHT+IFVn+W6t7IcvDHzZ8JEBQMCSTtIpGFYZyel7ibDDUcP897/DW1p4IYqqtYfdKiVpsTwnCY1Iw==
X-Received: by 2002:a17:906:daca:b0:a99:88ab:c7cb with SMTP id a640c23a62f3a-aa48347e0fbmr879397366b.33.1731924601276;
        Mon, 18 Nov 2024 02:10:01 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa20e046932sm518546366b.170.2024.11.18.02.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:10:00 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 18 Nov 2024 13:09:53 +0300
Subject: [PATCH v3 1/2] power: supply: max17042: make interrupt shared
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-b4-max17042-v3-1-9bcaeda42a06@gmail.com>
References: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
In-Reply-To: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731924598; l=1055;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=gES/YI8J+uY43qFcYFJFQDdZCjIIvFKdVHt8Cx7j4Ks=;
 b=r/k4DDMvo/iWEzDXWTNKTdhAJ+2yN2gMZDbBBo0/+qpXaIxtBxrxlSbcICNM9WInILIvXpnR+
 +H8C6RzzOzvBbSTtw42c+JXXlJIvIZMBNAH/oZfjB9gXGMlrJC/ZiNZ
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

