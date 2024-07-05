Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3821F94C
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720201142; cv=none; b=Qo69Z0uMh9XRsb8V895+vzKNkNaaiy2c8Vrvxr1F9xjexmXQsSEm8ODr95y9sECYyiVcJgO+yARk6Sr0FMNHF73lTARD3WV10aKzqBc+gql5RjbsKeky7xRWhuYZZqjwjGPXIjeF6eU4PQ+vWwZGyLA72Lj6M7TqOSUN+GAMKEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720201142; c=relaxed/simple;
	bh=uLVfBqhE/F059/4NlG6w4dj5glhnxKMh93m/OyjAXcE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fIs5rEh9TBrNxZxp2Xih+SZKgZDUqwWZD4aJaPLGaknwfCBm3V7YS5hMkE7YL5Ih8zvd18yTvV2U0XvCEn66+N82na9ucmXfjPFrfv9wnrFGrxGr4A1JGt+3pRjyJOhE35HD8z3CHhk549QDCNR7LrYvvcjjAfshrf0nLuvpfxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hh3FS1y+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hh3FS1y+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42641dec7c3so11633925e9.0
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720201140; x=1720805940; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0uzQFhxd/mAUsK60UuDZbgZFzTMenSzsMSc4Ot7YaY=;
        b=hh3FS1y+evbd3oOx4/XM9lFjq9HFqB8a7adjQstbZ1Wt5HM7OCnDkofplEmF7u+QHL
         LbZufeY/e/ZX536Cevi6xxSU7vFyGktgTJ2jaZSEnFPMGUcimb71J4TkcI467Y9kDrdg
         2D12ui5VzKh5yorFQcwSjcBEm1I9/t6MKTQLCtdh9nBosAkx7uw0dtQ3Q/QsQr0H2+js
         c07XmoWJW+quY8Nl1R2HH1nF0DET2zBVdbWZifMaaCUL87cQeQDJxzXW9ObtcH35bGl5
         88SeV+zdeyY6h3Fq4H8a7+GGlVlObY6ok2SLPHbIVyoS18Hc/zUUotM4p5rhkYJ+/GM4
         HDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720201140; x=1720805940;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0uzQFhxd/mAUsK60UuDZbgZFzTMenSzsMSc4Ot7YaY=;
        b=HS1+6gtpCf4+GHCS5CtqAaW0q9toapBYK56hNNACn77bxI1dUHMhTlbbrIHdEKXd3G
         7rdLx0VxCBuP3JzOHu3mQxszdlNbJaz1xWL1dD8QaIHnfkUuRiSzQan7J3mmt7EKn5vl
         uQ84fWDe4c2sB13BVYEd4c+TemKv6x+8f3gQFqldHX8JUEroow04acRpmN48JUU9+EsG
         pmjaHt0Y2hbZdHJqSNlXBN1H5G29wVc8bjnoOL/+6PcBn7uADycuVqXQ8/e9hGBRHG5i
         NWPiEMCOL8bz5pVF8utJ4lZif2lx0z0BoYWRxyKFOIYkL4RIA2cSe2uEWbglIggsF/6Y
         /W9A==
X-Forwarded-Encrypted: i=1; AJvYcCVzXJdkU+IT8c7VnGKZ8DnFQZhN/Ua/NOYQ87f4TOSlDXpfroEPI4RN7HNa99wN1NdeJEXRvLjUepZcFNM/0MCQw5zz
X-Gm-Message-State: AOJu0YyqMvqdZNuZmn66FwsSYyVcNWRT2zJufmVkaD0lV4prz4D5RzxQ
	ieKzSDcQz069KYKY9yHrsiebm9g3xAf9wAsAbAwLeXuydyggTCK0
X-Google-Smtp-Source: AGHT+IFelT0b09dBTjSrUvzyoZ4ltSTetwb4SzRHnt1d+1Rcyah9yX6f1nUB59ZwR+67KzoW9MVjmg==
X-Received: by 2002:a05:600c:2059:b0:421:5609:115d with SMTP id 5b1f17b1804b1-4264a4566fbmr34869765e9.41.1720201139399;
        Fri, 05 Jul 2024 10:38:59 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-4adb-3312-ca75-bf55.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:4adb:3312:ca75:bf55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679b1e5f31sm4850466f8f.33.2024.07.05.10.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 10:38:58 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] Input - constify read-only struct regmap_config
Date: Fri, 05 Jul 2024 19:38:49 +0200
Message-Id: <20240705-input-const-regmap_config-v1-0-f712a4494883@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKkviGYC/x3MTQqAIBBA4avErBtQ+4OuEhGVo80iE7UIorsnL
 b/Few9ECkwR+uKBQBdHPlyGLAtYt9lZQtbZoISqRScaZOfPhOvhYsJAdp/9lGHYYt1qZZZKSrF
 oyL0PZPj+38P4vh/4uvA4awAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720201137; l=761;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=uLVfBqhE/F059/4NlG6w4dj5glhnxKMh93m/OyjAXcE=;
 b=1Zm/Q9o4Brm2oxTFrNOWYYbIy25spad+FQanBfkmRw+ND/RqYbke2g3NvFy1O2+w1w4KZepJw
 ncYxNxch8OHDPT1T17ijj5Uu6ZT5l4grKqy1M+07eYj4zuewX4f2T+g
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series adds the const modifier to the remaining regmap_config
structs in the input subsystem that are effectively used as const
(i.e., only read after their declaration), but kept as writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      Input: qt1050 - constify struct regmap_config
      Input: fsl-imx25-tcq - constify struct regmap_config

 drivers/input/keyboard/qt1050.c           | 2 +-
 drivers/input/touchscreen/fsl-imx25-tcq.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240705-input-const-regmap_config-46d2fb3110bd

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

