Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3485389107
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422384; cv=none; b=nDcasJoG4tUgb9WuKvqi6PRE7nvBc6GHD+5sZxOOC/1DoSuxELovEcukeuJke+hgfsdtFoMAnFq5tXLEbOlLRGOleEsOChXSYHafWbi/1Jx+2jgJUXEe/t9RoicnNWG9hTzHkOCZowdUIRAWrDdYmfUeqE3JRcpgAF729UxzwzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422384; c=relaxed/simple;
	bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goRw/g7Qz/B5w3Knfg5wOAyp51NNxXcaoSqFZKzbTy15eHcpnbdO69mOxuCl8bI2e1nblS84AXwmg+6xK9EOm9kf1ix/+jf+Xayjcox2q49FoHVTkg9RWUxXHPwmeN25ps+UmyuddojhelnOtAFH9urw8TPPuj6W/fcXmH4gUNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJFZfFvh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJFZfFvh"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-484415c8bf2so1502288f8f.0
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 00:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422381; x=1789027181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
        b=AJFZfFvhg2LY+pb4OvCz3mN4WfM3j3yGibltuUiDIByEMTXDZ9sr/Su/srQcNMvt4x
         atw78cj6DIQDOjOyftyZGwvQvyWIC6TvKBpvoZolQJCS8ldBtR6e+XKRPPypcrqAuhBg
         eqge1PT1m4rIv2HbC1JpaGdHd8c5NAqdZn5+kgyAFBotXsKn4QJhralXhcTKFKLxDQZE
         F95v2LOb5DGwjSVXY+Jbp+VFIAW8Szrd7tkktfEPyMiX9Q6y0c5P+GzfF7IYdAc3K5VF
         jIvIl8G71CAyDs4ioR9qMWF20CvVfSWneQS77/+iv8VMumVMbMplwZZTUJP4Q0xb4BKQ
         f0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422381; x=1789027181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f7Emp76RF4wDRv+c9hXs+xIqJJvCmxjiKd++hQJZ1M=;
        b=ZfGdz5zXq93xS1nWLQO0+S6Q8b8nURG+NRK4+AZ3mmEmdY8/aaz/G6WPtDBUNZP0id
         8tPSGv7tFYnj1YTiVdNRIrO8J1k63Ep9dHSn3P6ANmsktrMk+V2np4zYP1wVhj+APEv9
         xBKQilYgDauCXmm7o1WSL327OLFihvig4VgpdbsaBXI/KFEmxpIAtQ+ixkHx+/BHtTwb
         OXZnwQt0Nz8pbcj97BesFrqmi3tqV4AhXOxXCmHJTP8U2otTwz2LAecErIDgrXsWw8nr
         f4avYVLSmNyC+3BjQVoOSPZdQPl0ZXRF2eqwu8t+GT/15RiGNcWmDeUUC381PQV1j8fs
         GIhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoq52NMCnRiLsXvltKkYr7O2k3Q35IwiL8OnIv4HK1dQcYJbJQQ+wGb74u7mYKSHCkLcM=@lists.linux.dev
X-Gm-Message-State: AFuF++nT37YBeRCjorPLFv+j5s6aN+ifOFwPwOJTJv8ytc10fHXY3wD2
	mnu3tJ4a/noYdmOK/dbMFhqh/hGqz6Mjz1wOZO7QhaeSxiRWD5Na+8yI
X-Gm-Gg: AYBFou2Vl1lexeT98sjxxzAzLEMrJGlTu3htMtOB8R59jrmW7fnLyiLbcZHo1veCcWr
	r+ulK4GqbXvF2wG+CaDiCme+Tt3ZNlK8I3j/JlbVCHczIDwolGu4kN/h4Zi3Hyai477HvSC1Kb+
	VM7uWyViSRA3UCnT+yfGlA5mD+JsvBQbvw7KIoGe1y7S2GhnAurLZHM6Iq/vjuqu3qDqwFE7taE
	LjHs0//ckCISC8NnaeJXB6itbjeVn4WfJQzK/z0EhwiehkPe2J4bCW3wvJ5//ixXh0+Vg5iK5Xy
	mmUqQS41CYg76ed1mrh8gT5PRxfqbMUO7hm9Js3IkqIW8abcDXncEiFrju2RN0x2m5lKRZQjUS7
	Izcvf7H2+IPEL1tfN+CuAugLe4rsF+kt773t5ZYmcqt62zjncNP6ZF9pI2oOQeMaOESHa1HBnFz
	iaeW4raSkxGlNZ7mblDuE0+9Z9T2FettoP3Jsf85exTIjhitC2KHFsEXI7u16B2Gz1AQ==
X-Received: by 2002:a5d:5d8a:0:b0:484:41cb:d5f0 with SMTP id ffacd0b85a97d-48488f103d7mr17847999f8f.17.1788422380714;
        Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 09:59:36 +0200
Message-ID: <20260903075936.2089280-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903075021.7AF3F1F000E9@smtp.kernel.org>
References: <20260903073143.2068494-4-mehmet.fide@gmail.com> <20260903075021.7AF3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Are we correctly parsing the packed pin configuration value here?

Yes: gpiochip_generic_get_config() hands back what
pinctrl_gpio_get_config() returns, the bare argument, so config is 0 or
1 here. The problem is the get_config() documentation in patch 2, which
says "packed" where the implementation says "argument"; a driver written
to that text would indeed break this check. Patch 2 gets the wording
fixed in v5, this patch stays as it is.

Mehmet
