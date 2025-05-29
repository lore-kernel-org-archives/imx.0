Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A84C22D9F9
	for <imx@lists.linux.dev>; Thu, 29 May 2025 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529367; cv=none; b=uvWUeUEVmF83VMzTDFiJeJBdGx5Fgh5zUoXG3MG6zVRwdWlxExC8q4BiAOOH4yUkwoIwrmwgPQSGiAb/8RZIWB2fY55s/MS4K1LSYA6cqeTa8xW/lV9xOTjadXpFr09LKEdlIN55KuMkMxmqCkLF+gSZ8Kd2tRtIU+NqPG/55kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529367; c=relaxed/simple;
	bh=GeXs2YTmkQkV79yulDXUH0yLLyz3ctNNGJzYo9oqVmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpG2OuWVT2W6XvDQ0EApvbV8XdXasvnFDB7x627itIx+IhrwUhjyKdYWE+tcd2TywlBGQFctK9Fv19E0NTRLCWiktrmFGWmnrKKEKQD34Xi/Cko61c+XjYOubHYbqdfrZZ443zLDasrT2klczYyeN+ommd56lFakY1LW3tUhvM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ch/yHbYX; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ch/yHbYX"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso1671428a12.0
        for <imx@lists.linux.dev>; Thu, 29 May 2025 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529364; x=1749134164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTXx7XXdzk7EWRnp78xo+LM1GM1iIdxfMvNDWhkbA/U=;
        b=ch/yHbYXkoHEZ4PNBC7ZEw9zanMLKbY7Hk0qO/urKuIotKFbi9aPlNYpQ/E92jirbY
         HNJERx5dofmTGb8sD4XljGNApWQNgR0rAc8bfynSM0l/51enJu4cVilI1gChdDlnOTjz
         BYx717YPpWqvtvRGao7850jwEHakeMwMBGGsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529364; x=1749134164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTXx7XXdzk7EWRnp78xo+LM1GM1iIdxfMvNDWhkbA/U=;
        b=C5IDA7BLFcGV2eM54LlEOnwpTTnmR+e7AT5faolrtw6owpWR2yWa6wH74OnO1vEqmL
         70626XW8T7eKxuqZXxGxbKqDPHVNe616ZJgy3tHV0VF9GYPia84vf4P606ta+YMCBDYv
         dabd1Lf9LR01nVdV6whqsz2lkvbv486GoGXLlIkEYi8jL6b+kW7eD2xsmtJkDjL0dpfN
         yYY0zolUoebNY/lLJIfirPO1OKifVX+0wbNjExBpF8w1r/l1lDVlkz+NT8YmwDs67eaW
         CKRPLY+/MLjO4vvS7EGzFOrJPbBsSjUDPx7Wytzs0IPW4Bv5SSdDTzR0TTEIoIPiPpr9
         OOCg==
X-Forwarded-Encrypted: i=1; AJvYcCV1BWRAiCarR4zrbXAmx2TyjTDonGmaC8yKC3qsQcm0o/HEami1amlnCACHqCJREPTAFZc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmYH/PoRhLRNmYdtCopRgTFLfHDHLmvvhhOhpTIg/c37ttxgnV
	m6OrPJyOKphMXgabtg/NxlyJxqT+IIX+PXa6PqRjakXMtM8BQ9t0ejC5krYuPnFTyQg=
X-Gm-Gg: ASbGncup5KSClV3+buC3v0KUsWfPSihf3AY1SDoacsB8+E0Ml97q79PjjGehkyOrAXV
	y40teYvuGtlObreaWAcgC3q5T7bkY52jCjuTTzDXSSlnFS1ztSrwRfa4T0onsg3X+NJ9bYacYWm
	yOoXR3qI9Q7YVXcGdky/cArAE7pVW9gepkYdd6dhWnV2izmJd4SfVcIQjOYSto89oZB0VQ2fsdh
	3xl4IdEtiXzVAjRtagvPlT5NC0EZnLCIyuGCSdTmfE4PmGpK1/9AweuH6NLtCneQ0WxjBF7FGYS
	YbEKujFpW9iXws/3MWruanxYWvI24aREPMjtBDz9dgy4Bhx8g25z41fqNcCLj744/s+yR8+W+hw
	Jr7SJi53vEyti/jlW
X-Google-Smtp-Source: AGHT+IGNd99MwT3JpoTl6fZS3HsjpB6dOJqE1wiiL6YvPMiOlp0uVZuWybnPHDsSV0wIHKZmVqHGfA==
X-Received: by 2002:a17:907:9611:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-adacda55ce4mr238586366b.3.1748529363612;
        Thu, 29 May 2025 07:36:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:36:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 6/6] ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
Date: Thu, 29 May 2025 16:35:13 +0200
Message-ID: <20250529143544.2381031-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the options required by the imx28-amarula-rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- In mxs-lradc.txt:
  - Fix typo Low-Resoulution -> Low-Resolution'
  - Wrap lines at 80 char.
  - Drop '|' from the description
  - Describe what each interrupt is for.
  - Move touchscreen-wires constraint for imx28 to the top level
- In imx28-amarula-rmm.dts:
  - Drop label property (deprecated) under the leds sub-nodes.
  - Add microSD comment above the ssp0 node.
- Add patch 5/6 "ARM: mxs_defconfig: Cleanup mxs_defconfig"
- Add patch 6/6 "ARM: mxs_defconfig: select new drivers used by
  imx28-amarula-rmm"

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

 arch/arm/configs/mxs_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 91723fdd3c04..3b08c63b6de4 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -64,8 +64,11 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
 CONFIG_TOUCHSCREEN_MXS_LRADC=y
 CONFIG_TOUCHSCREEN_TSC2007=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_PWM_BEEPER=y
 # CONFIG_SERIO is not set
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_AMBA_PL011=y
-- 
2.43.0

