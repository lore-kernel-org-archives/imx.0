Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F12B2054EB
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603143; cv=none; b=IFa2ikMYiI5nHxSEfthGTxY84zBPgRoGnpo/51hL4gWVs9VlZcuX5g8YhMrFp+rQiEzIgEs/lt7ISyv4dqoX9pVICxIjJu+gq3idobVpnhYm4Ft2Cp+SMSx3gYGKPnAU6KYgcZsBWdCORGkmwdT5jgjwiBavAfhX2UE0498stdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603143; c=relaxed/simple;
	bh=b2bP8LitvDNj7CfFRPBpuZHhWhmBIqxUapiyUlqTDyY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nHbpdiaZ7t3HYvpY/mKxrWirs7X4gQ7N+pC/dVlaOUt3X6SiHLVnjc5lJJBoQUITysDSC/ARToKw1RC/WYIQkl6/tSqN28Z+A7fiZKz6xVHLDqLCCfrGVOqpmlvy9gdTmAHBBzj5DkzMYA5e9qRMEDMPad7JjKcVaXF3G1Ve2xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glQj0KvT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glQj0KvT"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa68b513abcso827564566b.0
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 09:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603139; x=1739207939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYyPN/CoLmZHDGSIz9krlFLu7ZkZcaS755QZ2CPhXfU=;
        b=glQj0KvTwtOW2vyn3bQuIFQyd3FjaVATMEv/ZsymNH/q5gTzfOLPI/HDP8fzonl5eD
         IqcEmyN3M9Bh+I+qEHYWAuZrXW6vw33o3rEcJ3qfXV7rjHs2h9Ums2sNkadctt7ptXH2
         h04al66PCijiQI3eJbX0uMJgN1nFqARtMlCIBDyeOQuY6feg5+9VS2jO8lFWMnn5ZRas
         R+THvNPFgumTcJvcFbDxDjVUi+UMcYHr/h+JDnCs3qr3fnzj6RI2OzVrOZrfETFueKOh
         SfBaX1oAaeNyAh602DPbgY3Be5j2M5NaC+F8/X/GFhe7P3Klypxn0deTGjgLaoc/Qlcx
         KCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603139; x=1739207939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYyPN/CoLmZHDGSIz9krlFLu7ZkZcaS755QZ2CPhXfU=;
        b=TIntCtLNXyU9WavFHFVNhP/ZQITKw2EdL4MPAvKEt55dzkyIpsEWsWg0pJN1uQk/ro
         nXwMgl15/GXGvNeRLTXI911Bm1iL9icyiL0q6WcxqIsSU1BvEWE6V0kbhvpKCX3rZUkk
         Sea7beNhoauvKYM0t/XkhHhv3NGkeWqoU9MM1zTjAbkucb/vRDbmhcb5A+yB/+NDrwyf
         8M+gNfrmuw6Pzw32ZQ1HFAUzwh1i2O/+SNgne5qUH8RhapNOYtWqd6uRu8YMGPW4mkzE
         3RlfvMk8Y52R1I9GU4fSlXWC3Z4Fx941AmMXj3Bs426KzJVL6o3kntXchgpzxlSN+JnR
         cZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCUCemRAcR4v51yADrdTs9HHuqqhiuI6rI1wpcaE5g5MmOUzs7mZIQFcujiJ28/YACr8Kzo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqawjt+RWj/ShPt1EtB8klGY3qIHUD+R2G/xcjEv294T+/LbpO
	YDGFOu2PnA3HL4KpwRlfjCvbQOxYw2aCs96ea6Hj2LVAMy4wv5li
X-Gm-Gg: ASbGncutGFyd3lQEyekrwdEKMbJCsv/fTAZIdBeRE54wc/6+lF5Gw2hM3Mm9JyyGdCD
	o2IiOYHYkl2d0jDAyH06No5uZUBiPwvHVDdzAJX0nsbmXgzsU6cTh18lBofUn87VtQGYtES+2d+
	/teEwvsyRtPTKA9XSacI2u5NHppiJeBBmWQWuk9Mdr8z9Nmk3n7s9G+U2oykkin6V0o/pIcHWTm
	sOoV1k13zFUg9+iMhLgoL7Kfb6YIW6vHLZR01Th26OmoP2clc7mUBt1y8Yx7LzO/LkNw1Wmw+4m
	pA3aAuEh/hHHFYAaB5vN6WAl+uRY2I7pmV2F1yR/PGHY4SIBjw==
X-Google-Smtp-Source: AGHT+IEv+cl0Fd8s1P7svgvOOR5EpY/b8v5nnTR9TZ2xpr7AWoXyn9Y55BNSQS7sJRYpl7kOaXuXAQ==
X-Received: by 2002:a17:907:7213:b0:aa6:a7ef:7f1f with SMTP id a640c23a62f3a-ab6cfcb3b41mr2987689966b.11.1738603139193;
        Mon, 03 Feb 2025 09:18:59 -0800 (PST)
Received: from playground.localdomain ([92.120.5.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d21aasm784253866b.74.2025.02.03.09.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:18:58 -0800 (PST)
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
Subject: [PATCH 0/9] Refactor imx drivers and introduce support for imx95
Date: Mon,  3 Feb 2025 12:17:59 -0500
Message-Id: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
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
imx8 (meant for the imx8 series: imx8 (imx8qm), imx8x (imx8x), imx8m, and
imx8ulp) and imx9 (meant for the imx9 series: imx95 (for now)).

The series also includes the introduction of the imx95 driver.

Laurentiu Mihalcea (9):
  ASoC: SOF: imx: introduce more common structures and functions
  ASoC: SOF: imx8: use common imx chip interface
  ASoC: SOF: imx8: use IMX_SOF_* macros
  ASoC: SOF: imx8: shuffle structure and function definitions
  ASoC: SOF: imx8: drop unneeded/unused macros/header includes
  ASoC: SOF: imx8: make imx8_ops_init() an util function
  ASoC: SOF: imx: merge imx8 and imx8m drivers
  ASoC: SOF: imx: merge imx8 and imx8ulp drivers
  ASoC: SOF: imx: add driver for the imx95 chip

 sound/soc/sof/imx/Kconfig      |  17 +-
 sound/soc/sof/imx/Makefile     |   6 +-
 sound/soc/sof/imx/imx-common.c | 419 +++++++++++++++++-
 sound/soc/sof/imx/imx-common.h | 149 +++++++
 sound/soc/sof/imx/imx8.c       | 751 ++++++++++++---------------------
 sound/soc/sof/imx/imx8m.c      | 567 -------------------------
 sound/soc/sof/imx/imx8ulp.c    | 520 -----------------------
 sound/soc/sof/imx/imx9.c       | 135 ++++++
 8 files changed, 974 insertions(+), 1590 deletions(-)
 delete mode 100644 sound/soc/sof/imx/imx8m.c
 delete mode 100644 sound/soc/sof/imx/imx8ulp.c
 create mode 100644 sound/soc/sof/imx/imx9.c

-- 
2.34.1

