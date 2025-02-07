Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4274118DB18
	for <imx@lists.linux.dev>; Fri,  7 Feb 2025 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945403; cv=none; b=jSYEYiTciCKBlvScYWCOz829pLPtOTN5G3aAcZti3/CHs6xJK08nm72bBD4mJYBD6v1wUrBoTnY0bQnjCHd+c7lTkQ/e7Ioo2mKV0OIK/5jmkVmb+/iVeLpSDrRDe7XZxypJjgKC471ycs7C0Oyne1bHwWZzOFapf9mGDLKtENk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945403; c=relaxed/simple;
	bh=aztBnTzCPQ753+4bH4DC2UVXl8izsnBgtGLfLurb5C4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H+FR70RyxspUd2L9Hn0QfYv9zaNche0O60U2lFwJAAeD93Jf7qIDAVapxSUugB4PmlOw4+Ltcjcvc4R5ywpp2dC6CoRZ840X5Q0vIkjX1qyP8RpsUffWzZ0BVvVuY0tDOUSVuQe+sokIsglybBTjW9zS/JcCtvDMs2Jis9pKECg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2UVzW1e; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2UVzW1e"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436341f575fso27543275e9.1
        for <imx@lists.linux.dev>; Fri, 07 Feb 2025 08:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738945399; x=1739550199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=244kmp+zUzlsCQhOo4YUMFoLrVMjk2D9KCw2SKaVoS4=;
        b=Q2UVzW1eUsS4F3/FkBYHzix4Hgxx77tts+gAwo7IOo5WM0UtisFRdmcaVZy32nYmWB
         jzsc5cym1ax9ionESURZUnp8QTGWVfkh+xd0a4w2Utp2JbfLhJ4soalZWjhvn0tbEYtm
         jHaDrHE6bJrT6HikFnsvMZl7UU8Ke2RGAHXjTwRCWj8iXrkokBZSU4LBwWtuuB/RsKca
         jpNVhZy3LdUboPhZrzACpj6RCpXfLCyyogJ54vpsHuWUhoZJzxTVylUhmfVFyJeIbprt
         VoBp+h91LiPHPazwM0joD4FpPx+yt04FN6l9cvKs8utZdIVaDCmLFxxrdHWym3Ob1UNd
         KI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945399; x=1739550199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=244kmp+zUzlsCQhOo4YUMFoLrVMjk2D9KCw2SKaVoS4=;
        b=ElLucyDP78fVKbH+DFbQRg6y7iGyQBGuS9BC0Apn4AZ8toV9eYb8o88xncGFXRTAsb
         Hf2zzHvRNWfOTBg80A6dQNQvVDsJHGzzvVs5l+R1mE0KUYe+xx9v0NBZx2Jq32a43uwZ
         kFTi7JGMBC6SmeC2Xt3LhQHp43YuDR4Wy2qQc05UpxkotTrwl8w4tNFm2ncwA6KMpBvp
         ur1MyziFlJZr9gAZaIyLMlU+fOtONNqqNVDHMOFggRzOm7nGLGdulB0QvZPWzaxvyM+D
         tnAZ8pKV1MAEm1RjgjcXpXo6ETJ7g3aoFWA3bYiQNg8ohlCntpFlpF32tlJtcMcYKnwU
         XlKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWTw6yaBru6qkOE6g97/MI96qxP2oDicw3WZPdoPR8p+MrFbT+OJZ2lvGMcU4nCcwgZ0s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4D2XZNUR1Gn+9X23A84UFMFYsACt1Ix0qf8Hlgp7M73UD56BB
	SGprI7FlQpUWKbqTM3mPG0SWpcx+Llm5lVtZbCwQ1IW3iwzDmCbm
X-Gm-Gg: ASbGnct84RQ2IsMWIuclKaGUWKDTOTTanc8PF2JqrTq+uM8JZ7gmCZyzZu/4zVFnRKS
	LOlpzNZz+cRTnJ2MFBAAGdumPP/Bov5+BBSbz7EkBzJ48Iw/csJtl1/LgJquvd3+91kPiE1XE7h
	KX6H7cENUdmpIp95MnJhBW5aXhTdE/K0AkICt+cwZbKFWZiIVHUtAtGwFlMOlB7jq+D2nCQ4BTj
	nzAGefuiF2T3EHS4G2pX0u53eU7kNgivRGPGvi4fAaaQAg8DHM3J9BWqf0LzkqtRixuyaynV7JX
	KatZ8jyuyKHS0qbC/eLr0YdUpWdBmvwxKEchcJENjBMLn0twvmm2mA==
X-Google-Smtp-Source: AGHT+IGu7KsMLsyvby6jH7B5UD+lDpo9NWbHvE00AcX6RMM1KN9EerejjqgH+06hClEiApShaz1WZg==
X-Received: by 2002:a05:600c:358b:b0:436:2238:97f6 with SMTP id 5b1f17b1804b1-4392497d4femr35808285e9.1.1738945399087;
        Fri, 07 Feb 2025 08:23:19 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm61260825e9.2.2025.02.07.08.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:23:18 -0800 (PST)
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
Subject: [PATCH v3 0/7] Refactor imx drivers and introduce support for imx95
Date: Fri,  7 Feb 2025 11:22:39 -0500
Message-Id: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
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
Changes in v3:

- drop the patch that shuffles structure and function definitions
in imx8.c

- drop comment regarding "clk_bulk_prepare_enable" having no
effect if number of clocks is 0.

- add Frank's R-b

- link to v2: https://lore.kernel.org/lkml/20250205203022.2754-1-laurentiumihalcea111@gmail.com/

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

Laurentiu Mihalcea (7):
  ASoC: SOF: imx: introduce more common structures and functions
  ASoC: SOF: imx8: use common imx chip interface
  ASoC: SOF: imx8: use IMX_SOF_* macros
  ASoC: SOF: imx8: drop unneeded/unused macros/header includes
  ASoC: SOF: imx: merge imx8 and imx8m drivers
  ASoC: SOF: imx: merge imx8 and imx8ulp drivers
  ASoC: SOF: imx: add driver for the imx95 chip

 sound/soc/sof/imx/Kconfig      |  17 +-
 sound/soc/sof/imx/Makefile     |   6 +-
 sound/soc/sof/imx/imx-common.c | 431 ++++++++++++++++++-
 sound/soc/sof/imx/imx-common.h | 151 +++++++
 sound/soc/sof/imx/imx8.c       | 753 ++++++++++++---------------------
 sound/soc/sof/imx/imx8m.c      | 567 -------------------------
 sound/soc/sof/imx/imx8ulp.c    | 520 -----------------------
 sound/soc/sof/imx/imx9.c       | 137 ++++++
 8 files changed, 988 insertions(+), 1594 deletions(-)
 delete mode 100644 sound/soc/sof/imx/imx8m.c
 delete mode 100644 sound/soc/sof/imx/imx8ulp.c
 create mode 100644 sound/soc/sof/imx/imx9.c

-- 
2.34.1

