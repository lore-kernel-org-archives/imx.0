Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605EF181B9E
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720021081; cv=none; b=nAJQMmib8zEbeVQ42bWMveJXTqpeqyiz9LS8GZYklqZbYMky8Xn4xvuMiAXF/O+uNLXYdsQ28B5uXefW5Y+U/HjTeMtjbqar4ShdhtaAy+jZI1SKy2maj65Vt02lhQogh/YLc8qJk3yUKgkxSUNA+tFLnhz7asP2qXgYVk0IyDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720021081; c=relaxed/simple;
	bh=8qNQgtXLskJ3JD7MfZcxgVkS1/WPuU7p5nRkqlB17Cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AydyxuwNVHJkydBbqcWGNc1z6Jr1PVsdz/Cwx1QpMhIdXWZ8CUA3S/E7ZQe94aBBzGBz1F+dg0JG/BOB85pTCyVJohf9bvpElaSYxULqyacIcuslqDxbPPJKiuHor1jeO6Nyct6EFG4ZY0Mo+/Yjbo+j6E//5vhtrsgXRumNYLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aT7Hifm9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aT7Hifm9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so3917915a12.1
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720021078; x=1720625878; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BZW6Clmw00UsBy9Or8rZFzpnqAmpBKvhrxIEAj2Ylg=;
        b=aT7Hifm9aowi6gmZXqiEtLsGkp22eAASU3OGlrp2w/9zSzLpm0UhX4H/TNDib0cugu
         Wy3w1KTBVf/KORLDWVik6wwjWdap1NvxBMrGPlKXrhuaxaKiXdgJh93v9KBesDkjWNwE
         LzXKOjv4zWKQIhx5bLTeMYG+VbT1WwlPahbHR+xXxKDumWFd22gTYh3OAOGrrJThWGyA
         liyWsJTQ+v1pHAYwc+6dKzXvyLIHU8gV3EreylDKr8ali2fDQLSOZBQQJHLJmM95AaMr
         VACDAi+dmcqxkKI1dnPx8NZUGwJBXQFahMD3aRLrKg92knMHDyzLgl/vDqQ/H/gfRfBX
         tyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720021078; x=1720625878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BZW6Clmw00UsBy9Or8rZFzpnqAmpBKvhrxIEAj2Ylg=;
        b=Urwf1XpCQFI4wXVFJLgRRxMp9Agftk4q/Ry+wNVmDIYGHjHPA9gvv819XgxUdR+02f
         N6NWm0N/IiHil4wqPQNIXqbqoSudwbwHcMPHnOabqYFdhqgSNR/X6REs/MelB351UZcO
         xISg9wW69hjSi/HXNaG4PYFuDQZqrpUBcUXvSkiJUAax2Fx6WOwAXYFn6cbQ/BSH/+gg
         YPwkhJG+ObVn6hyEgUVytDESlxm/DGF52zM/+QHi5MONyxipNLvr+9na7j+A773VfJbU
         5NWSC8Q3kHZm1u8G3GFCnnwxfyGQ2cmoeWMwaoMFaD7oSX1NF0/qfO2MgZRY41QNeIBJ
         TiDg==
X-Forwarded-Encrypted: i=1; AJvYcCWW7GwBMOOn+NzLmeJkPFbJphHZpw+B8M7rdkhT1CK/lHsmW5GKb6kH90LXdZmJ0rqNIhwvZ5wckdweQk7J1jROuEEy
X-Gm-Message-State: AOJu0Yxy4OwLodGeyvqKDV3Ebm9hScVX+WXL7g8WGFGVGgqxjv7txARu
	rCMbr9q5rY/aMoOXzR6lPu5/2J+Oi0+uUIJek2L06iLTmzCcdO2NBt3EkfV8
X-Google-Smtp-Source: AGHT+IGFCEGCVL8xe48SJMKTBOgWG1qXrZGAA6LbS42EdNNuflIBA1IaCbstX5MqqaIgbYZM1pm5bQ==
X-Received: by 2002:a05:6402:84b:b0:57a:1e0a:379f with SMTP id 4fb4d7f45d1cf-5879efce90dmr7971249a12.16.1720021077494;
        Wed, 03 Jul 2024 08:37:57 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861503b4c5sm7119512a12.93.2024.07.03.08.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:37:57 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 17:37:34 +0200
Subject: [PATCH 1/7] mfd: da9062-core: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-mfd-const-regmap_config-v1-1-aa6cd00a03bd@gmail.com>
References: <20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com>
In-Reply-To: <20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720021075; l=1046;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=8qNQgtXLskJ3JD7MfZcxgVkS1/WPuU7p5nRkqlB17Cw=;
 b=tA0HRKlqggTv2Fd1V19K86G+Yyi45xWEVdHkWl7kQMrbRuJ6OCFOtxuinqMC1lblNZPbVt9pP
 aAkD4iyxYcuCXevg9WBtFHzkib+xOP+J8NejZoUYzN5IZtAIKb803LS
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`da9061_regmap_config` and `da9062_regmap_config` are not modified and
can be declared as const to move their data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/da9062-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index dbbc4779170a..5e55c6cbf5e0 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -470,7 +470,7 @@ static const struct regmap_range_cfg da9061_range_cfg[] = {
 	}
 };
 
-static struct regmap_config da9061_regmap_config = {
+static const struct regmap_config da9061_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.ranges = da9061_range_cfg,
@@ -576,7 +576,7 @@ static const struct regmap_range_cfg da9062_range_cfg[] = {
 	}
 };
 
-static struct regmap_config da9062_regmap_config = {
+static const struct regmap_config da9062_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.ranges = da9062_range_cfg,

-- 
2.40.1

