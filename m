Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8DE1632DA
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787452; cv=none; b=DKEqVVTFl40jwlYnidOJ1fXnnEUfz25P5Vs2YnvbmRTRewINYJYoSgaglMrmtyBYU39V85nbf0UgIDfMhGOt8/0M31cxQfWyVb6M2aEuMUlzvJVME5jzVZp4oJ1P2OT1EHNcimxNU/mm2/Q62YoHBkiqorG/H3jvDGuoBoOJWEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787452; c=relaxed/simple;
	bh=gsvloyrHQbF5ITKDlmSSkt2ueR1SRS1afrphFsjrNcg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e7dveMyhfVQTLtVj1GME1kILCVuZiQcoEn2dIC1hUtNfLRnHtdWGETy1dtziYaVH5mGLHTkpmycATgdvpihXymKMJZ1bQJvLLzteJvNXxXoURq9Du+JgH+5e7HuagoeTIpLLB7HLQ/XuwB4CW0gOTE4dMjiIlYTEmmvdatrgMSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwBiXlcu; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwBiXlcu"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaeef97ff02so39430366b.1
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 12:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787448; x=1739392248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7quq08y7bRrmivY2j2MkuwnN5G3wZhEJZY8NVvoNqNk=;
        b=fwBiXlcutGgUevFID45lUb8tusNl7uFLxEL3jkzc/PLku8ZLG11ht2TK+EnGNFqn5Z
         Q83bHmj0zBZvS43b+qk6wOBqWmCbZ7S9VQwwhaC9xYqrOK2SKejE8rX5lT4HO8Kr36WN
         1GSGmc5SDKF+0ZhkLmiYaF9OPPHPvic5MfW0Cv9lR1M8BwdNiZi6oLbB3Drzr0S5y2Hb
         q0Tzd0FEi4XmKK9nrt8bJ0R/1X4xevS2290F17brr43spEiiKyyJoFTzb8ZQDx6L7YdF
         egOY5asfinUxL0hDfCu/R38sDv59wRFn0EhIztxgDDYP7V0Qj14IWdq9SIUyovYB7CeW
         zdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787448; x=1739392248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7quq08y7bRrmivY2j2MkuwnN5G3wZhEJZY8NVvoNqNk=;
        b=Agid15Dt3vnP+TpukMzcpi90XT66zSK5XXgjsj7ZRZE0hNOYbwBrYp8OojGQ6Frj2H
         gvaUWPGX87Bq++SI6fkCH3bihr90u3JSAesvL0NYIWOy9A2SPWX5dRUbIvvyHkyEk3jt
         kaWLdcM3yYEnfZSH7cOuvgtXXcRbMBxt64b4ZnxYpBjjumyKsOA1tVAWq4QsfkeWOUGh
         ZF7OsN2O3+gzLXduE+COHWyldGzSjCQ7Rt71ayOoPV263UMGuPEI5DLz8/9WtjBfpiZQ
         KxZICx/crYqYY90iXgK20c1DUE8ekvv4pVREnIrJ3O+FfFw6gKB+EcVI4i+JCH0F+f/4
         YUzw==
X-Forwarded-Encrypted: i=1; AJvYcCVu73+DQgZXN21YevmeQXTMXu/I7weNCmSy8pilHPugM6aIDsSl0D7ZNMF6vX+525CHLSY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGWSWITSQYQqOUUpeX6bnjlJyzeLrhR9LjgZ3i28OrMeDHDTOS
	UvsT+611/kLHe0dFFcrBim8v76ydnkSNTg1rglqkQGQ1lYT88/vD
X-Gm-Gg: ASbGncs5J7rLeaK0LrlUEO5C6lVgdnO/aYzxGf13eIeIemZ7fePEGBMttu0xARePEHi
	JEbjW04iFq9lXR0t2KXmk1icpQ0Y1PhnuehfosVklvtEkVvP5roJJ/wJ/SGaM5i2lJ9XnlmF5nF
	3Tll+PPzjOks1fHdIsNeB0IaqO+gE4AZzgTCLZuHu4KSawtzvg8G/BSxJ8iNB2i8DdgqIhjaSO2
	/BmgjF72O0EZZciwsUijVm5yzBcz072Cr287qulfxDykURWo/AoFLY7lQ5tYII4ZM+oCeZLmfFl
	MHG0rGrwfQtKPtgWuU2YBkB08cCbN7Kh3yKVU+mW++5/rDPefT7Yzg==
X-Google-Smtp-Source: AGHT+IFOD2JdT4b4zcb0pnGAJjlvVdplZV+7EHudMQJN2SH3I8xeIW0t3W0wFtUyTAAvSp5bA/xr8w==
X-Received: by 2002:a17:906:3583:b0:ab7:66d3:bc88 with SMTP id a640c23a62f3a-ab766d3cbaemr261988466b.52.1738787448480;
        Wed, 05 Feb 2025 12:30:48 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:30:47 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 0/8] Refactor imx drivers and introduce support for imx95
Date: Wed,  5 Feb 2025 15:30:14 -0500
Message-Id: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

A rather aggressive but arguably much needed refactorization of the SOF
imx drivers. The refactorization is meant to address the code duplication
in the imx drivers and decrease the coding effort required for introducing
a new imx platform.

After refactorization and imx95 introduction, only two drivers remain:
imx8 (meant for the imx8 series: imx8 (imx8qm), imx8x (imx8qxp), imx8m,
and imx8ulp) and imx9 (meant for the imx9 series: imx95 (for now)).

The series also includes the introduction of the imx95 driver.

---
Changes in v2:

- fixed order of includes in "imx-common.c". They're now sorted
alphabetically.

- use reverse xmas tree ordering for variable declarations.

- add missing call to "of_reserved_mem_device_release()"

- add two new fields: "drv" and "num_drv" in "struct imx_chip_info"

- drop previously obtained R-b's on patches affected by aforementioned
changes.

- link to v1: https://lore.kernel.org/imx/20250203171808.4108-10-laurentiumihalcea111@gmail.com/T/
---

Laurentiu Mihalcea (8):
  ASoC: SOF: imx: introduce more common structures and functions
  ASoC: SOF: imx8: use common imx chip interface
  ASoC: SOF: imx8: use IMX_SOF_* macros
  ASoC: SOF: imx8: shuffle structure and function definitions
  ASoC: SOF: imx8: drop unneeded/unused macros/header includes
  ASoC: SOF: imx: merge imx8 and imx8m drivers
  ASoC: SOF: imx: merge imx8 and imx8ulp drivers
  ASoC: SOF: imx: add driver for the imx95 chip

 sound/soc/sof/imx/Kconfig      |  17 +-
 sound/soc/sof/imx/Makefile     |   6 +-
 sound/soc/sof/imx/imx-common.c | 432 ++++++++++++++++++-
 sound/soc/sof/imx/imx-common.h | 151 +++++++
 sound/soc/sof/imx/imx8.c       | 743 ++++++++++++---------------------
 sound/soc/sof/imx/imx8m.c      | 567 -------------------------
 sound/soc/sof/imx/imx8ulp.c    | 520 -----------------------
 sound/soc/sof/imx/imx9.c       | 137 ++++++
 8 files changed, 984 insertions(+), 1589 deletions(-)
 delete mode 100644 sound/soc/sof/imx/imx8m.c
 delete mode 100644 sound/soc/sof/imx/imx8ulp.c
 create mode 100644 sound/soc/sof/imx/imx9.c

-- 
2.34.1

