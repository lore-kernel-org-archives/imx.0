Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B74A174EDB
	for <imx@lists.linux.dev>; Fri, 29 Nov 2024 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732871410; cv=none; b=CqhAp+8IOxDPCb/Sk9IqrmrEBn31OQrcsSz0fqMyRfkIJdCVVciufuOs6rwOIIxU6SfsSUuJrsPhSmG/qFQdmqERSr9phc6PMiblytCub7kY2pnlXT6ZcanF6QNR67wmp01O3Fq1rduwvmud4y8L63iU1Mr7peQkf9X3yVuaPGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732871410; c=relaxed/simple;
	bh=aE7dRaUlw9RRqWAw95Nml53/6tAi/ph07reiaRvoGMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cQd8skRCF7gYohw2sWcFkwOcab0pFYM3tT7CNmij5TWSkvsr8j9Bc/CCxWb4BJwTBvVLLFxtsQjA+iqKxNnOgzstpiP0wq4LYdpeI/lY3JhV48krRD7Ar4lXg7CSunZybbxNaaIu06/MOwGNvr7eHxhu0VDHEQcYWdPi4DHbNlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyQ1B/tR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyQ1B/tR"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa560a65fd6so292446166b.0
        for <imx@lists.linux.dev>; Fri, 29 Nov 2024 01:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732871407; x=1733476207; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=85Dz/V9UNKV76gRXI1CKiKH4NgkQ/KQtgXeRQo92xPc=;
        b=SyQ1B/tRrjrmAdyL1wCTyUM6f/1NAuCFyrfPghWc/9QtV6XdfTuJjhXcITwZ2/jt3O
         Mmr+EKvZ/nbqUqz4yJZRr3xMfzzhTvkVzxdiM+L/gk0t+nlCvM0MSXzAVK+pge6xqxIz
         xgfthAiHCpcKvFh+qWfmB1gPAci6w3BmbT+dMWXl+GNXRx/1mPighpR4BCVnRfJnQItB
         Ehy9Hcl05J9llGr6k4nsOrHYBTqasZTijii8tUlh0sU3eibEUOMUWGSOGZrywrNYwKAf
         6q2WpbtdGSUZJqWF5Sd7cYtOEp8xbaKmAFBWYXjUDBSbpQ5R+IwSKhWOueoNveP2jH6W
         6caQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732871407; x=1733476207;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85Dz/V9UNKV76gRXI1CKiKH4NgkQ/KQtgXeRQo92xPc=;
        b=BlM7KuBvpYzw3TduPggrUKFyEWvbjxXYLOfnj8X0UHiAMdnZuauZ0NlXx6bxQEDQGf
         +NCKymopeqg+XkOVovzHnK+17fXya1+LODHM5nIno+BYMlHTOfjDefGKBRDqg7nJuNK1
         N+fw2ohhsfbYm5EgMqjpkx/nA/ncXxcY4A8LNE9UTjkqOEucrxgvnarPQvP7PwkFVVAE
         QAxYCI1FMSHmsmuco67dcAND3rvRJVGjILW5VVjRYDUu7+eIS5BDta611imnND3rfTvy
         WSSzY2tCW3OIZylMwoxjl9DsJKIuMeboLrFchz6PeEG44ayvGLgPl+OWrwpTBUW4Ta1+
         BoAg==
X-Forwarded-Encrypted: i=1; AJvYcCU2tUQzpO7bBLx+cYK6SpALJgVTgJA7ZUz6aPhKPdwdVnx95sgp3stoqH9dWurBz0OtaIo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0tqSt/vYPI2QdTqgnQKemoZDPttBs4CDdWVmit3CgzOI9Qf6o
	Z/7uHnoZUj1HOl2KLzfHF5sLH4/CtCaVzQhGDNi5YnCFdI4ZTcNr
X-Gm-Gg: ASbGnctgd/msxJoZ46etTklCwrsT+5bxVQQdY670fx1hPqLL1ka6QEeUnKFyh43vnfN
	0x6Ic2shzSCI3VEyYcnTKi8c+jK0IMNIqS0oaQhb9ZopBnawPvyR6r0Zt3yx7hDUDNQhecgpX5o
	4eFJuki1gRgpW44H434jCACIF1CJgiH3oVZIUzIyZq88KNQABzXKEBywxvEd3RHh/4ijfiwJTmY
	2J8wb6QoKyscVvQeSv+TtVXWDF6va7FRNnFEvJok66L9Q3V
X-Google-Smtp-Source: AGHT+IHIfo/Ci32R+3fuYfGuVl7F/1TNk43TxxJOhgBJQfOEEtpCwcdgMeOiUXDwjeg7ubOfHuymCg==
X-Received: by 2002:a17:907:784a:b0:aa5:3b1c:77ab with SMTP id a640c23a62f3a-aa594506715mr768627966b.3.1732871407175;
        Fri, 29 Nov 2024 01:10:07 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa5999032c1sm152775766b.133.2024.11.29.01.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 01:10:06 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v4 0/2] power: supply: max17042: cleanup and more features
Date: Fri, 29 Nov 2024 12:09:52 +0300
Message-Id: <20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOCESWcC/12OQQqDMBBFryJZNyWJ0WhXvUfpYhInGqhakhIs4
 t0bhYK6fAPv/ZlJQO8wkFs2E4/RBTcOCeQlI6aDoUXqmsREMCE5ZxXVkvYwccWkoHXOSmtUARa
 QJOPt0bppqz2eiTsXPqP/bvHI1+u/Ux86kVNGaxSaKSwkqvLe9uBeVzP2ZO1EsXePP0SRXMuKy
 irgpQZ9dvOdy09uvu5qA9iAFMAOu8uy/ADAGWJLHgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732871405; l=1934;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=aE7dRaUlw9RRqWAw95Nml53/6tAi/ph07reiaRvoGMg=;
 b=MpsLaQHP6PEqDLQx/1zd9njOiFfLHMjNFpFZoSzPujsZA6u9/YSZmQu8s1Qx/jeSkLw4JnU0u
 uI2twrAR4BSA453tyWNnPAMVvjMXqXe1oF/lCxFpdv1/SaCd5AOVv53
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

 drivers/power/supply/max17042_battery.c | 125 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 93 insertions(+), 32 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

