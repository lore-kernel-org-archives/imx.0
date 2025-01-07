Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59221E3779
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736242310; cv=none; b=JEABQRS9gaTzW6kLbx5QH6t8wdKG7rXfgIX9F090JTzY06/7gl8YZ3pCtQARxNTSBqTthsHL6gPY89AxbBAvovafLRrLRLDCcUxOGaOMzfEL4CHD15V098e5GclFTlaB8lu9iDNFPjuvgwiIUEHyYEt8ossnobWMwKW1Lg3VzPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736242310; c=relaxed/simple;
	bh=OsA1dEJLjjYZ2BIUPRu/DSyAQjTWyqdaRkl5xknsg7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWd+vaQ8zfSMDw7ruzdiyuVNkvWUKEaODNKPQwA18deuU45GRmM6JBGuibpuD742IcylBV1C9eGoRKEm994OPPGFwavzbxTM/6+o/lOvvlWernGxwk8QiRWdc0CbyWJYmdWt2XBoWpga3Rekie/J0edKI1WGqeNnR+vbjsbleiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+WwoJYC; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+WwoJYC"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fdafso32175066a12.0
        for <imx@lists.linux.dev>; Tue, 07 Jan 2025 01:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736242305; x=1736847105; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVVIvwMJ1kFj7ARNI9PQB5xeCct+X8ALPUkf7yd8p6g=;
        b=P+WwoJYC8QBv7T/jL7nuxhh0hKqEPAOi3DnN1a78Jz8C4rlkbrh+2LG9yQkfgFIdUf
         2BKQrrK+hFzJOE8cOJV/cTMUtBdxqlzHNUNIDV5/ATB2+Yz7MjWyTF5VMlUTZKXTVhpf
         k0RdsNpNDpnNzqSvCVnRcuF1b3VKa+i8xda4HBbUIsQy6C0kvb7EkVBuZXfhPpdc77Ug
         HfHuobBO31p0PdXbeXHDZKGcc+DFGRVriJ+GiTbp6PMP9jorKj0mFw3ju6Z/8uUMTNyg
         HIVV6ReW25kcVjL0QCBNQlAS0uJpJdX3zgZuQrLhZW/JCj+auXYlptzGVog3ru3jbs+k
         tzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242305; x=1736847105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVVIvwMJ1kFj7ARNI9PQB5xeCct+X8ALPUkf7yd8p6g=;
        b=lNp0YdrCE7flVFDzS7U8T50IavKk+GlUaR4qcREP/CuPpRVICVcg11ndqrxPoMbaPd
         4TAhihnNFW0j0SmfXwmBxqVRxVgWb06S4LAcMp4nVHyuPelEpezxpQ4nnwmuWGx0TF5z
         bi6oRFgfSG9333j4jUKDu8IepdPvb/0RFtZ/0/Ih80V9cZc2KoiA3WRIXKMo+DY0NayF
         FdHBsZLZSUeYoXTjiUxzAPyXaOw4cQdd6X8tqSnqyMLDQb7dPkb16TToH7lG5pz8+Hq7
         9ZdXSE8XDK/v9Ine8Q9e4GZxfvaQTuNfolDXtlfPH4IlTQRcIrISVHuUC+8QASU6PD9N
         qREg==
X-Forwarded-Encrypted: i=1; AJvYcCUj+Qw3pr5OWciQcObfJY18aJxnE7G4fz6UIGin69MSvoFjlbviJ4Btn3jNcDtTUhwmWbw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+IFEaTWc+D0CvqvCPbfW63FWOeSF3t0/jSm4wp/dOrAUR8EjA
	Gi679jfWAsz49KK7qXI9UmGtcp1cQ8sorP2Kgkxa2M0i2i+fSDpq
X-Gm-Gg: ASbGncsq4aTu+JuHK6GuecRhnN++NTfxY3rGRkOCOzdQwh3yWyipSTFM/B1voL9+myt
	dGJ56HdY5OegWG8U3F1g68LTlWvt6kW8OpRdppjXps5QHM+WhKsj7nw95eBgD40EosMcz1woYzf
	J6ZIglxd/jyWsZ0A1qc1O2MX9yXFiUoOPk1QPhB9d/z+J4ut/qCjJs4wx5MAVPIEejcXUDPXcEt
	mJhDkXNE48mSmMyMI5bI91k65EmS8O7qk8qZFfqVUuv6u4QArPYjEc97pIym+kHyCkVYIGzW8kO
	FCB3fEryylnltmpJB1BxNqqifg==
X-Google-Smtp-Source: AGHT+IFxd3YBOxk4ntPc+MGfHTxmMyeBqIw3Ey/TIoViFJfaz0wCgI08UnQ4BfUpSjzeL2SymnOtSw==
X-Received: by 2002:a50:cb83:0:b0:5d9:a55:810c with SMTP id 4fb4d7f45d1cf-5d90a55817emr12774693a12.5.1736242304417;
        Tue, 07 Jan 2025 01:31:44 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806feddfasm24976300a12.58.2025.01.07.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:31:43 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 07 Jan 2025 12:31:30 +0300
Subject: [PATCH v6 1/2] power: supply: max17042: make interrupt shared
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-b4-max17042-v6-1-3d0104ad5bc7@gmail.com>
References: <20250107-b4-max17042-v6-0-3d0104ad5bc7@gmail.com>
In-Reply-To: <20250107-b4-max17042-v6-0-3d0104ad5bc7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736242298; l=1245;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=OsA1dEJLjjYZ2BIUPRu/DSyAQjTWyqdaRkl5xknsg7U=;
 b=J0dWnGbnmiouoiodH/YY3fMMFLG4B8Gx/vWl0yc/WZJl8KQeP94ZetXT2O/N9KE1/fYvk0BB4
 x1EvIJYj6moAFniEnk39u1QMcPvRqdk7vkeILsipJQhrNpB8Lnhv7v2
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Fuelgauge blocks often are incorporated in bigger chip, which may use
only 1 line for interrupts. Make interrupt shared.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- reformat commit message with vim 'gq' to wrap closer to 75 chars
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

