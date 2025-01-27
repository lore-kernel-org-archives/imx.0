Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55241FC7ED;
	Mon, 27 Jan 2025 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982001; cv=none; b=M+CozeMis1QGyUNBF2UR2dTfvEwXeEELJx4PF/Hj/D738zVNrf8qKvG1gWfNlcDBTkuUUn0GIgFkK2qJbyezRgIzkR0TyUYw6l85EtMo+lvh4p63zrET5Sz9U2rN9f//3ZQiqEQXbjhRu2hrLT6Y+0Mb8qDFhL9UPWO1QSaK+kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982001; c=relaxed/simple;
	bh=RfFf9mqe7wnUpvIjSrHj6CQMvmZLwVEjIiP2MewLm8g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K1y6mVENz/UgzvVoj7IYxlOuD5gUNzRh9oBK8gJ6dO6Nyu7eFSRchB1Xgm/jEL24q851Y1Y7NEi9OnZbd4RvYML89YEmPIr/Ij05hu46Q+Fj0s+qjS9RNaL5aGLRezQPmuK9MKB92+4Rfwh/04QeL8E33YviRaHTn3qhUSxUPfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxyPYVtl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxyPYVtl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436341f575fso47838345e9.1;
        Mon, 27 Jan 2025 04:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737981998; x=1738586798; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z8eYln85d4V0XxkISkF3B47hIlXSQBbJiZ4zG36gYUY=;
        b=BxyPYVtlrq6qucNYXVuqt7nxIDNgewP1LDXd/9BUXHXeeCmCg5SsSy4HgHNBNJ9McX
         xIlaRJWvJPuLfFkLlpBv83dRS7pqdlGl2ksWegP0Yk1+DdyvcupWtUxBraWwjtC5iUaC
         lMKlTV8LFMIVspJKS+h1VJWvwE3FE/u8hglHa+5qQulLcA8kizNO6KPmVuxvVThkUIcM
         j3YHBzQNy7iMlJXag20oTmby+ovsdy4RuyD2vCFFf7LagdO3qYNHOtm+gTQ5Kn7R1Ble
         gwyHl6fLtCDLEKwAwiazUjrJmFTmPNVHQ5OEowa+iAKt92pSOw4UIDn2CLMx7F1Ne884
         AY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737981998; x=1738586798;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8eYln85d4V0XxkISkF3B47hIlXSQBbJiZ4zG36gYUY=;
        b=SKnLDEjpJjNvA0Ox2JhReT43c95bYCPtP/UfIdEdPnIdB7xSwQA/9hUlfKGfSNBAan
         VgT1nf7Nkg3Nr5yNdR/Fw9kZKQK25OSGDeUzx94GNlOCuwREb+PCLVBefWmtKhSUjUNX
         f5NvMp+N0YvWFIKyRM2CVjtQfe2g+3FW2iG79jJwN5tYWw5SsuTABkhZVlD1W9p2K4s5
         pWc6QV55W56z2FgUt0U5Tg1cBZAqOCxpzw5Hn2E9TxYNLH2g61rXR6gyU3rM1hVFPZQU
         ZdPAzOaBK3DdGvh3SK7PAOvVgkjxPOlegqYF5ExxHxQWe2XFoR9ANIyVjDCQzsr8O8uG
         a/4w==
X-Forwarded-Encrypted: i=1; AJvYcCWQXfeH7wYqy7UiiGmtNgXerFE4bwXvm+2W2Tqh4+KD52CKOsDpiXEJ3zQEnWRSDy2+FNM=@lists.linux.dev, AJvYcCWhDXywUeSNXBLzm9w2glUsefOSqz0o+JyDqRREkkP1wI59LTBUhv0dgVU7yweUdD0Zm4XyIUQjwVlXoxk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmLX+2H6Vc2h9rB4hPewbAcqS5r0D994gbpufhEeQtwcOSPkOK
	eeyvEY1bRkZRwWceil88aCBZ/B9/QDdNcpz3OZrPHsGtKFlJ/EVT
X-Gm-Gg: ASbGnctlfXhULCxLfJuCqq1BK551rreItzA28yeQwkSqmsNkaxRGXs97sqbOaD2juv0
	T2wf0UNv/q7M0xGIVgX07bZI6RB6M+VVyi3P6CAh7aEFr8MK0neuLK+Iykm1LXVldfXqXNBE2lh
	hfIKa7WxpT3Ejx4j9VQRrVahThblXMC8KJryrhk74LTpzwKUIfKkeANeuCs/A2oYEk3YwOD6odE
	4c2AMnqjyqINm6y8PJv7ikgf81hXirAkq4xMGvJHTM+136YTIDDkldSFOylTC6LVbS9SXusfx+q
	tBjM
X-Google-Smtp-Source: AGHT+IFfSd38Ri9jN8sfQ5L5B554TUZX0q25wsFyyX/2uMgyGS67py+XFULHlQy6v7HbU7SVRYe6KQ==
X-Received: by 2002:a05:600c:3495:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-4389143b450mr317083695e9.21.1737981997803;
        Mon, 27 Jan 2025 04:46:37 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4b9990sm135476565e9.29.2025.01.27.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:37 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [RFC PATCH 00/14] AHCI power management cleanup
Date: Mon, 27 Jan 2025 13:45:55 +0100
Message-Id: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAOAl2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0Nj3YLc+MSSRN2UpGQD8yTjJIOUNGMloOKCotS0zAqwQdGxtbUAIVP
 XsFgAAAA=
X-Change-ID: 20250113-pm_ata-dbc07b3b0df3
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=RfFf9mqe7wnUpvIjSrHj6CQMvmZLwVEjIiP2MewLm8g=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AqHXy802/pdPDCEw20R6+hBBw+dOLQVfY0K
 QKOcufY0oGJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKgAKCRDnIYpo1BLC
 te79EACIeSoH/vfRi6LCb3ARwUq4Q7HhYCKxv2xDX3f+4IFS6pryCyaXp3kgdqBqgNYaMdQ5ShF
 VKytt+DR+0DGoHcn+C1yMz3KxmukzDBedfB8k+fdD5hjGgh795mkqmPw6E5AETkN6odr6wAyzIg
 tWrhzoJpeY6SH+gkPflAR3Tc/PXkxWMQgV5zCrvWb3KmYDX/BrBPHX0A6LwyF7L8v6t4As3cIHH
 QC+bBsP+G0uA4AFupeTs/LMOX+UkfCKthpVUYsspVDUpXv6ntLa/zQn8F2lhD4b3U9cP5OchTmz
 g76Etrn5y2YHML03AKRXgtNpQNcpyedeIHMY7I4EcyKhK/dka5UTl/sM1W18Js+vQUbDo+OhEQo
 uerK1Ke58MwavucFUFK+hmqJtJJXwhjOqUUzAFRoVSWNLuod0jGTTB1rGC6IasIdP3cSsOYxpF3
 AJqZ0p8Vpad0JWvKza2mYOsdtAMvX4ym8T6iwt70ipD2TONcNxhaNuLJYc5Ae3zvTgE6kjd5Uph
 hS0V69QysEsSK6BhUOHKlR5Y6G3/nhCSvV9iTjMhfMP+MToZO1ZCZrKN/J3FtuVHDDZHeNHTZ49
 sMTOG3cHWP5kkCzdI0rnBPZAVzQlmyvrDmr+O298eFnNIKSWDq21+i7ubogmftWYSINmMsEQ2j5
 VG38IVjlMtsqAIg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Several AHCI drivers expose suspend/resume functions in a way that can
be simplified.  Using pre-processor operation can lead to errors, while
relying on automatic kernel configuration is safer.  It also shrinks the
kernel size when CONFIG_PM_SLEEP is not used[1].

This has been compile-tested on x86, arm and arm64.

[1] https://lore.kernel.org/lkml/261f9fac-82de-4f39-bf5c-cdfcee917588@gmail.com/

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (14):
      ahci: brcm: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: ceva: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: da850: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: dm816: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: imx: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: mtk: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: platform: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: qoriq: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: seattle: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: sunxi: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: pata_arasan_cf: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: pata_imx: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: sata_highbank: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: sata_rcar: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()

 drivers/ata/ahci_brcm.c      | 6 +++---
 drivers/ata/ahci_ceva.c      | 8 ++++----
 drivers/ata/ahci_da850.c     | 7 ++++---
 drivers/ata/ahci_dm816.c     | 8 ++++----
 drivers/ata/ahci_imx.c       | 6 ++----
 drivers/ata/ahci_mtk.c       | 7 ++++---
 drivers/ata/ahci_platform.c  | 7 ++++---
 drivers/ata/ahci_qoriq.c     | 9 ++++-----
 drivers/ata/ahci_seattle.c   | 7 ++++---
 drivers/ata/ahci_sunxi.c     | 9 ++++-----
 drivers/ata/pata_arasan_cf.c | 6 ++----
 drivers/ata/pata_imx.c       | 6 ++----
 drivers/ata/sata_highbank.c  | 9 ++++-----
 drivers/ata/sata_rcar.c      | 6 +-----
 14 files changed, 46 insertions(+), 55 deletions(-)
---
base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
change-id: 20250113-pm_ata-dbc07b3b0df3

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

