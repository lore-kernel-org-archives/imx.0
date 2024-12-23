Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31634C8E
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734960675; cv=none; b=uUIiW/r2kjF+I5SGe71Vs+Piv1hBaLuNyNP+13AreUj4YmulnhcBT5oe5vfKZBJh6VDIPE1LbqvHjfu1ppo87m7XBxuaayDmlFDDTwknq9WRGtahPWcNSR9NJEuzEtgTU9OtXwSCD7XhDiCYxdVWFCZpOI4YPkA7flQCve14s2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734960675; c=relaxed/simple;
	bh=/EeD7LqHcTZ3/1Ng4iRA0q/Q9oTbn7vVY0BQy1PKauQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnNTkk8kmxAeTaZL6qzHARBsZc1MqH+K/REuyoqjViTMHEtUqBbyNoqk2Ln5x9p1ELFC4XEcXMmYMoiGHgu0jrreqvS6lciSGWzeyIGfRMiN1BsRqQ6nWLFFSV3stZg2zDtgro37Y39skeuZulk/KjdYosGkaiNbOE8Z12T4Ydo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdEAf8Y9; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdEAf8Y9"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so9528351a12.0
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 05:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734960672; x=1735565472; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=;
        b=YdEAf8Y9nWF1ygTRXvvNV7v/65UCllA4PytewVS2gIkVMIeSiygjBwABrmkdyw4VIB
         jvVAql+/EumsDqI1JTt3ewvU63vqamVehhccTSv3spao0jmoM0eVF+XKWVjwb4dsI7s5
         bzb30oespvR9jP78jL6OisC7nRJKowYen/CCROWrladC372/u/TdGhfuXj4qOYPy+qK2
         N5j+yA6j2q8pk/WjWOIy2pTEbt3UWProG+moR9JoH+yKd2evFA/tTh4XBSOrqfbEuEpb
         YniXtSj7/KQnJ14Etiactaa70nPXyFUXm2uLKQUh8Xe5farFFepk6K+hsTc0tFm5dKw4
         6hOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734960672; x=1735565472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwPuXDf5OOwhnI0ZOOII5GNLjUS47fPFuHS4/Stj1TM=;
        b=h/KLBvBAocm8nHwIOP1k8flWCjDsCDrPN76pts2IFM21kOIn/GKr9g3oet/YmjH7O4
         WW3xxVdK7IUwk2+x6YsKskIY0X+NH6Ju+WImTYXF75ABXoNBsXN2ZNL1PzNz/517lU9C
         sJzGmMPDuG8ol7MtaUSzigSOfhfsf9rWz4a+Rf2FJDxpj2s/8xf8hlLERd4pb3mHon35
         t62LXpT2MoY/aU8eVLl3NSA+TfAJIkmpypqeuhV57QtLVpDhJrAgMqxs6vQlN8GMAMgG
         fQEn0IWijaUdjs7JIwWnEW+Smo05Y//Z0XoO+wfBhUQypqKG4KeVW/4vEWmsfV/rWMcJ
         vf3g==
X-Forwarded-Encrypted: i=1; AJvYcCXLNUxQgg6/fFA9t+SeZCeiL/sCKPY4asizMBpmHaYOx8qFyaRmyqzW7c2pyQb43fj8koI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjjE7S6knu4yrItx+qs711CqFQJkiS833g94q5Ka4UVMVxunV1
	5JezF4ZXWHVo3tfuitCUvIgJYlbg2cD3/bT/pKvLDRapRzIyqVLU
X-Gm-Gg: ASbGncsNOlkk7lDs0fV7l5s7BGjLAJ5Wf0C+2wItuG2o4xNAlWPkoobVZJCSIwaTjFM
	kcX/oPikZwy6oygJpPZKlvwKgr84DcpMIRM9DhEh2xJqMonG8lLfP/sINUfWX7XO8aA9Ohz4JMx
	VjrWRzc8PsBNc6iC+eOYcYiooSoaHwGKj/+iPfVSmmLK83ZbLpPX1G3e5w0Jy2tnTNC3OGcHIjX
	jDz2UnNlGM+L13F1N81GFPBu6q5XneQO3TDfRLvaquKuXoQx9ua43E+Gva0wPNihC+af8Zl+/3y
	PAgvwO+tehj1Fzu+9q/FgeS5PQ==
X-Google-Smtp-Source: AGHT+IEAjOSElAIIGrGWGIQMWdMK2o7RI6v/y07lVKjYb6AqUZp1yJSKckWfo1Bm53K/zjmZVsKLjg==
X-Received: by 2002:a17:907:3faa:b0:aa6:9540:570f with SMTP id a640c23a62f3a-aac081579eemr1553450066b.18.1734960671961;
        Mon, 23 Dec 2024 05:31:11 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e895502sm523749966b.63.2024.12.23.05.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 05:31:11 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 23 Dec 2024 16:30:39 +0300
Subject: [PATCH v5 1/2] power: supply: max17042: make interrupt shared
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-b4-max17042-v5-1-e4e409723bce@gmail.com>
References: <20241223-b4-max17042-v5-0-e4e409723bce@gmail.com>
In-Reply-To: <20241223-b4-max17042-v5-0-e4e409723bce@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734960669; l=1055;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=/EeD7LqHcTZ3/1Ng4iRA0q/Q9oTbn7vVY0BQy1PKauQ=;
 b=ltc3kA6HcpduIZKYmVftqNij2lf7rbl9PER+OdeUoULkpB6JPpKkulYdc4j7/w7rYHRt1LhYp
 zt4lvjE87Z+B8qqX5eyIYMrKZZuAMRSM/NZnPIuV9vCF2JBkS3lLuE7
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
2.39.5

