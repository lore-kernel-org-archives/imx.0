Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6830825F781
	for <imx@lists.linux.dev>; Mon, 28 Apr 2025 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834353; cv=none; b=IZmWIiKQ1oXhFaNM3ZrFdipbw4Bjgz5j2c0KbhxbmTc9zWxz3ic8NIm03FY7uqeUA2t4VyHmnEwmxMMG2JduqAVFQS3SwnqhMIF0OcCt6Xgop5RCoObp26LHJbSIiLOzUAulVB0kUoQiJ26bUUPwr1xEQgfJl1JHCiLnRklplJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834353; c=relaxed/simple;
	bh=NnpDnaecEjaxgC/9EoeWEeuNxdMbouz16eL8rW7sxFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4aa4HkjcKPqrEoMvrqSmHkYhB+k6cw5lcs/yQxiX+pO31xBEJvFA2uf2asb1x1ZCkGudSwvIxMfVyl9M3dG9w3/4gAnmrYpbsgDOFabZQVj18CkQrWUKBlR+Tpoqere2lD4wJAHbyiokmef04M/zFjh3cXc89uJxdhVPIfAQec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LVUqZmJO; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVUqZmJO"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e731cd5f2adso1952849276.0
        for <imx@lists.linux.dev>; Mon, 28 Apr 2025 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745834350; x=1746439150; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgHog5j3bHubplZHipHB2WxTh+7XYb3lCIW6vc6Lfpk=;
        b=LVUqZmJOcRIEVe84bsiExSBp6voXPT0PPJ/ZRKth3bbl0lERH0vDBtmlqzTUlIiCX8
         agxbraQOxHJABVpv4fQQtnDFByeI5elX+J1UdDHnhIcoQXcmiBFsL4NuiXOlb6AJ8/TG
         h/+Qjnctbb0zGL84y0+EEpUXu8eNUXMbs6wKMgj76gPcnm+IzTt3dR4aFQUjq7p4jMs2
         oaoa3lyclKrzlMd6spK9sympvIbgNvNTpr5XWMocW+j6lEofu4jU/40/pPpJasEXUSwb
         jtE3mauzgJQGi5+VMIl4RY1EXHT8WRKIRr0T4eJ//GKS26gBYH6cUGsIn29OybCGHoEL
         nPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834350; x=1746439150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgHog5j3bHubplZHipHB2WxTh+7XYb3lCIW6vc6Lfpk=;
        b=t7i+SBlk3lUCYaG6vkJPsoubw+bwnpJKyyfVhgIRax4cR/W81ESZPNBWuMeoSgmoth
         lYJu1iJG3GotRFSUqikLMdfX2wl73teNjCfsEmOVs1HwjK79cYACw0je8J70yOiNlSE2
         fU1L+FoVQXjwIMqqZq33k9LRDe7E6fsH+P7tCUr2Irdnmrn0BfE/FI5e6OwpUh2OfQxz
         wyohxHGoo6Y8uwibiq5v1WcLoyR5l79TKgwSg1VGJbfYNaQZhQLxLYwNnW/G8OJpRUqN
         CZjZFcMJPL6b270YmlqxYtm+v3kCDaiTWx4P7nhm8DJQKJ4t39QtTgfYOuIxHNh5PPZ/
         2ueQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSOJsYECxAn53/rLLA64Uhx7pyvfmzOL+tFlqCdEdiknmETjxvVezjowk9TOve0C+V4AU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy88BegQ3P8FLP1URxBpTWWdxe6jBl+p9EK5ZrwN3BOfEZw9v4t
	YsVLQpFWKZKWHeIIvjB8Xh8wFQalw9RBwS0f7JsFfLmzMjCzCC3wdScOxUulxzr7crr4DyDT9p+
	GpQHGcV2AtIuZKI8PW20zM3faZ/nvZLdDM4Nc+Q==
X-Gm-Gg: ASbGncuQ5qEz9MWw8S1xJHkH53NA7RYuduzuwKw4D5aqXwVPznlrLlidodzZgWAQg9G
	TAWeyzQe3E7PCxMqJxiV1ODR6XNrj4yHyuAANmtNi8Gkc9HHt4ObjwTZX+YprBLA84Unkiw0j1/
	9NoOcUYZW3oCilJaEzaDv6b98=
X-Google-Smtp-Source: AGHT+IGzqA988NBw7sdHyV2pa28mJrkNSc68Mx4LZTYc3yj0PJhv5acQ0zBwmMN9hv6uRI1W/EgLr/AniunkS+8k1Ek=
X-Received: by 2002:a05:6902:2e05:b0:e6d:f157:c601 with SMTP id
 3f1490d57ef6-e7316aa4b6cmr12912739276.17.1745834350357; Mon, 28 Apr 2025
 02:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 11:58:34 +0200
X-Gm-Features: ATxdqUESjgj-C7jn03RVVXo_02Q8tUEdsDkHYmNdSurwgrXAz3FKSyh0hhQHxd4
Message-ID: <CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com>
Subject: Re: [PATCH 00/11] mmc: rename mmc_retune_* to mmc_host_retune_*
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Aubin Constans <aubin.constans@microchip.com>, Ben Dooks <ben-linux@fluff.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Hu Ziji <huziji@marvell.com>, 
	imx@lists.linux.dev, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Viresh Kumar <vireshk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 13:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> As discussed previously[1], here is the next set of MMC core function
> renaming to indicate if an action is relevant for the host or for the
> card. Local build tests went fine, buildbots were happy too.
>
> [1] https://lore.kernel.org/r/CAPDyKFpsJpLre2bO9T7gsSthsta9f3JXoXTGZbjTjWVXH47gCw@mail.gmail.com
>
> Wolfram Sang (11):
>   mmc: rename mmc_retune_enable() to mmc_host_retune_enable()
>   mmc: rename mmc_retune_disable() to mmc_host_retune_disable()
>   mmc: rename mmc_retune_hold() to mmc_host_retune_hold()
>   mmc: rename mmc_retune_release() to mmc_host_retune_release()
>   mmc: rename mmc_retune() to mmc_host_retune()
>   mmc: rename mmc_retune_pause() to mmc_host_retune_pause()
>   mmc: rename mmc_retune_unpause() to mmc_host_retune_unpause()
>   mmc: rename mmc_retune_clear() to mmc_host_retune_clear()
>   mmc: rename mmc_retune_hold_now() to mmc_host_retune_hold_now()
>   mmc: rename mmc_retune_recheck() to mmc_host_retune_recheck()
>   mmc: rename mmc_retune_needed() to mmc_host_retune_needed()
>
>  drivers/mmc/core/block.c           | 16 +++++++-------
>  drivers/mmc/core/core.c            | 28 ++++++++++++------------
>  drivers/mmc/core/host.c            | 34 +++++++++++++++---------------
>  drivers/mmc/core/host.h            | 22 +++++++++----------
>  drivers/mmc/core/mmc.c             |  8 +++----
>  drivers/mmc/core/mmc_ops.c         | 12 +++++------
>  drivers/mmc/core/mmc_test.c        |  4 ++--
>  drivers/mmc/core/sdio.c            |  6 +++---
>  drivers/mmc/core/sdio_io.c         |  4 ++--
>  drivers/mmc/host/sdhci-acpi.c      |  4 ++--
>  drivers/mmc/host/sdhci-esdhc-imx.c |  6 +++---
>  drivers/mmc/host/sdhci-of-arasan.c |  2 +-
>  drivers/mmc/host/sdhci-of-at91.c   |  2 +-
>  drivers/mmc/host/sdhci-of-esdhc.c  |  2 +-
>  drivers/mmc/host/sdhci-omap.c      |  2 +-
>  drivers/mmc/host/sdhci-pci-core.c  |  6 +++---
>  drivers/mmc/host/sdhci-pltfm.c     |  2 +-
>  drivers/mmc/host/sdhci-pxav3.c     |  4 ++--
>  drivers/mmc/host/sdhci-s3c.c       |  4 ++--
>  drivers/mmc/host/sdhci-spear.c     |  2 +-
>  drivers/mmc/host/sdhci-st.c        |  2 +-
>  drivers/mmc/host/sdhci-xenon.c     |  2 +-
>  drivers/mmc/host/sdhci.c           |  2 +-
>  drivers/mmc/host/sdhci_am654.c     |  2 +-
>  drivers/mmc/host/tmio_mmc_core.c   |  4 ++--
>  include/linux/mmc/host.h           |  2 +-
>  26 files changed, 92 insertions(+), 92 deletions(-)
>

Sorry if my suggestion was unclear. I only had the MMC_CAP|CAP2_*
related functions in mind. I think we should leave the mmc_retune*
functions as is as they are not "can" functions.

mmc_host_cmd23, mmc_host_done_complete, mmc_boot_partition_access,
mmc_host_uhs. All in drivers/mmc/core/host.h

According to your earlier renaming series, we should rename these function too:
mmc_host_can_cmd23, mmc_host_can_done_complete,
mmc_host_can_boot_partition, mmc_host_can_uhs

Does this make sense to you?

Kind regards
Uffe
