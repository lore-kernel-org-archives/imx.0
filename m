Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22919181B80
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720021079; cv=none; b=rJVRL/Arla/AhN5DHVQ6e63Dq4lKEN/ZAImgP3MrRsV7yGOjztcE5bDOUKE/Og5MbGOe0o4vyDnb/RCV7W8a/HJm/q0pgh3/C3GswIbLjaj9ZmVbbhrQqPT2av9VF0yySUkFds1pgGpu891AUUEOSA8OmPjq+M2IJOUlKTctjH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720021079; c=relaxed/simple;
	bh=ToTvATnp4WABvxAFVRt/CR2K+RafSr9oJSdMneycmR8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yda3mOHXq1iBI4o0H0aOy+a+tp+nt5iqkPWqM3ZXRHwTKzFjTlbXqv5ntO4egnAHQM5+lX1+q5yukz3Gy1/wNIdMCwB/lXY0yQ7hqN8qIGoqK3w3j6RvNnB+9iNFkeicKmAp4MIsk0dyABvWEPF8Zy44w0Cz7BIzj9FkydfJp38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlSDIa8m; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlSDIa8m"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111b0so2132993a12.3
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 08:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720021076; x=1720625876; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0qoGRCwGNsTclf/4dZ4LBPFCeRN6TBtp4p8AKuUCcKw=;
        b=UlSDIa8mJZJUXVt5rupoYUx6qjt8GCwCSOGtWctt4pGwukijtVWba+gp8csza2BoUH
         ll8iHhG50i/qm5hrwldc3oBJgwJUrxFriWss3SauFkc3Q2UDF1/UyA8cjax8OXOala0k
         OIZ0GCAKoJ0AhMWKf+hw1d73Us4L07ShFB+ccS9zHUjNYftr27yxu5p2usli+NZO3Gjp
         3IRprp3xOj42wYl24dYsG4claILvZqneklTWSPhDkMYi3/oVe20bFw2rlMsvoIOkqrAG
         SyuSVucoXZkvqi6BgdhhEE47n/lL7rPfIUA8hdrbIk4dk3EexqzG6Qh5RnX1og3Y3PWt
         bRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720021076; x=1720625876;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qoGRCwGNsTclf/4dZ4LBPFCeRN6TBtp4p8AKuUCcKw=;
        b=jKozLS+HSPaQDH5u8qTUUo+xiqxTyvVaALD5TqLysu4wNcbxyJ6CTzbfTwMR6uxHho
         Rm+KynINESRsjHg5vwYaQa9v5jsB4K/ytW/E5j5OABumnzXSjqg3rPR01P2w2tEb9G7d
         yR6HV6v8Yh7XSetzuJJBKioCV5mlcvtw2o7E2iVhBvcpRmMzW++00i+DZHdMGYQ55oTW
         SH+PmGT5/38gQoJMnvjgEJkT5OLxMh+vg23OiroAdkBECs01UdspxWNYsdMqgMnvnJDB
         wumaCzC7J+y8y+u2n3SQhJEcbt5VsCWCLM5+55wGh3c+mCUpYWzvyS491tyPkd9/HioX
         JDHg==
X-Forwarded-Encrypted: i=1; AJvYcCW3VNeAXoo+vjFqxA+ZoSgFzbvgRIpulthJ5BXOYUrNhkSBtHtrGF+i8WVyYWde0j5neAsBHbtQmCfubq5NupnhnueR
X-Gm-Message-State: AOJu0YyaLCJ43WVYzd+KrNlT2OF2Vgemu+xEcGcFXZHnuzyYrjnelTG/
	7AQcFo9bMTI631OjTlW6A2Wum0DiJKOUcIOr5pFwiUYN1tlfai7n
X-Google-Smtp-Source: AGHT+IG9tUs1K8wFUzZ6FBE31DCX9QrAQqkQU0GQjvqCXnv+VDlXB8CazidTqdklLVnNbx5+M6zTjA==
X-Received: by 2002:aa7:cf8f:0:b0:58c:3252:3ab8 with SMTP id 4fb4d7f45d1cf-58c32523b82mr2920229a12.37.1720021076222;
        Wed, 03 Jul 2024 08:37:56 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861503b4c5sm7119512a12.93.2024.07.03.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:37:55 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/7] mfd: Constify struct regmap_config
Date: Wed, 03 Jul 2024 17:37:33 +0200
Message-Id: <20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD1whWYC/x3MTQqAIBBA4avErBvQyv6uEhGSo80iC40IpLsnL
 b/FewkiBaYIY5Eg0M2RD58hywLWTXtHyCYbKlE1ohM17tbgevh4YSC363PJsOxwaI1WJHvdKwu
 5PgNZfv7zNL/vBxreTUxpAAAA
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720021075; l=1254;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ToTvATnp4WABvxAFVRt/CR2K+RafSr9oJSdMneycmR8=;
 b=AGMaznePLnXgEW/jSt4EEspaxMwtnpG/rCVqCkUct9H+d4UivQMvlfVn37EjkyWRm2dkQGY+o
 seS0kQN09fvChJ2BEWEfUN6pOnxm4tP8hnbzbcmFXGqGGXfAz97JeW5
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series adds the const modifier to the remaining regmap_config
structs within mfd that are effectively used as const (i.e., only
read after their declaration), but kept as writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (7):
      mfd: da9062-core: Constify struct regmap_config
      mfd: fsl-imx25-tsadc: Constify struct regmap_config
      mfd: hi655x-pmic: Constify struct regmap_config
      mfd: wcd934x: Constify struct regmap_config
      mfd: tps6105x: Constify struct regmap_config
      mfd: rohm-bd9576: Constify struct regmap_config
      mfd: intel-m10-bmc: Constify struct regmap_config

 drivers/mfd/da9062-core.c        | 4 ++--
 drivers/mfd/fsl-imx25-tsadc.c    | 2 +-
 drivers/mfd/hi655x-pmic.c        | 2 +-
 drivers/mfd/intel-m10-bmc-pmci.c | 2 +-
 drivers/mfd/intel-m10-bmc-spi.c  | 2 +-
 drivers/mfd/rohm-bd9576.c        | 2 +-
 drivers/mfd/tps6105x.c           | 2 +-
 drivers/mfd/wcd934x.c            | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-mfd-const-regmap_config-96da5e18a85f

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

