Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C993002A6
	for <imx@lists.linux.dev>; Wed, 24 Sep 2025 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719279; cv=none; b=hSMlfzz5htLPSVWeNk/ofXGCaS3kdpZMsqNnfuf6tn2VzHYF15CQFnHc5qtYuAh/jQnQOVqJYXc+DYj28fc7OIOXQ0/OnIK35YiNWfMUtJOS9AyLKiehNY1+HH7pay3aRVGmAZpa9f4vIAlYRUT8bgMbNXct8eVchZn3rZHFNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719279; c=relaxed/simple;
	bh=S9krJNAXbYfiBjHOowFzU/MHlCd/viA3rjI5GntmR2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GE8tTJZNC7DgORhpUIoMknn/Cj1cySzU0PdYVC1bEGxGzbBir6re09cC+Ny83ZLknuzjhv8j9g9YMQaRqQS4szqg2toMpckvKXbYO6O3P3uma9Cr36zu/y7ErI4xTjMLz2gWll4Gypfj6A9mLwVjQFd+9kGs/3uBYaT7h+o544k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=p3S5aNzj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="p3S5aNzj"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b33d785de7cso67844166b.1
        for <imx@lists.linux.dev>; Wed, 24 Sep 2025 06:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758719275; x=1759324075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr4AHNLZpak0/qwDXluW3tBh9480ZbWvsfmpnJ8cepg=;
        b=p3S5aNzjJTrKgsXH92Q8Azff8MQh1hAXJlX4SPbV11AZ/RZiTkYK/9YqPqDEMqXtBj
         21r/Zy/USolHfIfJzrjsiFbpkB542hatI+5Ea4sB0+1Vc24kLFm1Flg7uYVaM7qwJHhE
         +JWHSCKnopDt793G1zalDzry7ukBE5zr5u9vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719275; x=1759324075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr4AHNLZpak0/qwDXluW3tBh9480ZbWvsfmpnJ8cepg=;
        b=HglKO7di+jFB88jiN9jZOixK17qNtCwWFaGdNpPAx49PvnCEYl9mrZzY1ztZHOtx8Q
         m2BQIJqXykN7APm7PApfcW8UJHL1d+BR6QJTkINcfIeKGOYs6h+Qr76+GuBvgOMnJ6Bs
         p+w1Q/mcHqOQ1d9v4q+dPauCFK6JnUfznLM0k1LZgHsYiQM+qSTsEBltCtoqcM8fFUsc
         EBwmkCr345Lu7fw+yTVbK30g8MTfHzwghsE7KdXNfelIsFvmgRP6NyB46AjSABbiTOQp
         HeKumXnBVi/MdBrWDbGh5cr+O7dXfFmTtKAQT7b8Ja9NMvieXIYuf49oCKZ8hzFqkIZ3
         uSzg==
X-Forwarded-Encrypted: i=1; AJvYcCUKxTMc+HhGX85y73gcge5FsUBLpOGOT1OY30ENNOOd0ilCeLxKgcYpfaoQvyT0Mq5a62U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt1u750qXiqRV/l6eKCr97D+fNLq6o6y/RyL768Ey9GZJpthKW
	/krhl5vzHVm2UrjvZ/ezfFQ2mUQX1ZZeu5Gm3zxpJNIAwL3q8PWEJH4jJnD8turjh4A=
X-Gm-Gg: ASbGncsRh/x+apsuEO4iQ7g1Yx1oCLqE94fYCfuTXVf+w/+SLrv0hSkWjTJD9Neh28z
	RkpGcWPtPAcCSF0vSAHtRmg23Wwksl0y8pOtdKAt7P4/CLVYDTVf5ckXCYJgtwJ5Zhd1SJTJuEF
	7H/Rfp5byPODtt/ha6MHJ+TqAGtAW2GOWXItYCSToo2/Eol2bZ06imp8rUNa7KfyE2Pvb8zaVlZ
	b8aYqbj0xDRVMaWLsDyW8sBvKORmVtSZ8HAKbGH/SdoYgN1X2qA40pIXSFpIN3zCr999pdp5vjN
	q7I3QvpxkAGxjSzQI7pDlrbCmS0Y17OAKs8M3UefEfJYENM1xDq33FLArdFRnxcYcf3aMOz0fs8
	XdnM/gpWcVzemoWHrDOgg+j8Jr9lDJJlSgb1iBm1p+5GVLGk0N3GIw4snLtVUIlDFTyXpX99esG
	oEf3J5OjZHKjeQMvQ0yDqeLuDtYJlzRVswn3uUdx0A3tCVPINvj51egOWu2cw=
X-Google-Smtp-Source: AGHT+IFx9RJ+/2IFWtcGeD4AIDWcZcKVdKo7r0/4aN/+yno0pYXxsSMoGTi5NzRLLyVL5lFzEdLoFQ==
X-Received: by 2002:a17:906:6a03:b0:afe:dd76:7cd4 with SMTP id a640c23a62f3a-b302b21c432mr677014766b.57.1758719275523;
        Wed, 24 Sep 2025 06:07:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f382b0sm1574379866b.2.2025.09.24.06.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:07:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 3/3] ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm
Date: Wed, 24 Sep 2025 15:07:46 +0200
Message-ID: <20250924130749.3012071-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
References: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable TLV320AIC3X I2C codec and simple-card support used on Amarula
rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/configs/mxs_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 3b08c63b6de4..603fb003b223 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -100,6 +100,8 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_MXS_SOC=y
 CONFIG_SND_SOC_MXS_SGTL5000=y
+CONFIG_SND_SOC_TLV320AIC3X_I2C=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-- 
2.43.0

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: microgea-rmm-audio
