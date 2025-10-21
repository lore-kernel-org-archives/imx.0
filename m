Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B432E744
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043050; cv=none; b=IvnVm01fPtC9Ek429jWg/mFoj+LXQTxApf/c7l3Sakwk4Nw4zkIlwdwbXJqM/R5BAXqccAcUf5b+hyVhF74AC41hBcTt7HuNdv6y1JgQNrp3/h0p1fONUoeD4LRCUm+JbR9qSvrOhB8MOhjmafBMLaTwBIb9QedB+dg4/vve6Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043050; c=relaxed/simple;
	bh=G8bIrdKOREeaQWFYl+BVblIyK/tNvhnzk9i8+sGZ5Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6RQ5gElWn/5yYSrNrH5zqG6IAs+8rlawu9vkRFHw7j2bfzmvAFmgoKXJtvvfs+yqippf8AmJM3jjUHabEAV0ju1LXyupt/jzyEhckzzt405T6q1SD0UNnUR02ilVy0V//2ppUhmvW1n/tFM6CEIzgWsdFK5WtN5fE2X5hZiV3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d1jT2UIA; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d1jT2UIA"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-633c1b740c5so5218812d50.3
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761043046; x=1761647846; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=du/uiA2g0ruAK2UrT7r+xEuTy7bML0SpAVcY8ooVq04=;
        b=d1jT2UIAHEOH3mk5FDP57hythtmI9o24mlvz71ss1iRjVpAyqmr5AD2sUHjoHRflbU
         YiGgQUcgdYHyEdtKrye22W6tqBa0qv5fi9207M4o3Wcdebv5SlIrVE0051e4m44YjRu2
         vboRmOkpbEDBXYCxrDmxO4+0SYkyNfK5go+9Q07/LRfqoE+43ZDRXnTwioqqv4x6XYZe
         WtwVPZvBomEwFTK57qFllX+5d30WxMseF1gg1BQzs6Yp/IcfwU/imcL4DC0xiBLLAKee
         ghIfutxXTfj+gmvkfSTQQKiY/PLk1EaNiqJe/FaJc5ne2g498t3Zq+zhLCCfP21+y0n9
         agLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043046; x=1761647846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=du/uiA2g0ruAK2UrT7r+xEuTy7bML0SpAVcY8ooVq04=;
        b=rWB8S03USKIiqxtcqvb/V+wjdSNfMxhSIvtTobZRBsBs2oLFAgmfM9LBoSt4wMNJCg
         Eg2pRHDUvX0T4HG0P3b4aQSZWEMYpLR9EyiMremrYIQW5E/R9OurUBC31iQm2AOORsFR
         ek5jad5OBTgz1JFMh+hbaKaoWrWe8QLEcCHDjUa55lz+aBfq2hrqo0g0xZPEApKm8sdT
         FGTnmPM050bFVHE/MOp4lFkoem/UjrXsM1tK1jfkbk8bpQERJOhl4d2A5yJnBJw/+WoC
         BsCq4CKIc1Vhg8sd85cPqcapSWkBX5U/CTlDvliRcU1HF2nNH8Bjocwe4go6jZm5DTq8
         1AFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFiFPq7Z6/+iQPHgZ9uJS1gXvrO5OgZWLveypQs5V1dHc5R+041gwId+nScg22g6ilccw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0PAx1uPzLEoXk/tcWCXC3DG1tKgVv1tIpx2zvO/vT3E6FLKtU
	sPwCPTkloj7gRR0JSSyQwhOcOCsz5nNPyRIZZ23GLEI3xecWVGtICRKLeRolvnu0CrpEhcwagHp
	6GYHXmrWdrmPlDgACzDaS6s72zFvr8fTIkwyoSR0GDw==
X-Gm-Gg: ASbGncus4ROV19pwsH8/mmnsur6AiQiV041rriTrqNvm0oAoheK393NsD36v0pBz+zK
	3ZZC/JnBYnDO8NqM858n/SAp0EuVBmHAFNfxnusBtjM3f1eKEYPgRJWPgMva3ZjmwoUz5X31IwF
	Vg+aDEmONGk5DkfluO+RfzRrOK9Q7ZjQMji+gx/0GPsNR3EVMth0S/rC6qsq+F4KyHslT7vsqth
	fYaf/xA7bK/1zXzZKpV2PUt+eMahNGVe9z4q4kiznG1bTtweewyY8E7WjVnhg==
X-Google-Smtp-Source: AGHT+IFFOhRKu4kQW/XKD1Pm8VUPug9hRZQumhyHTlK9vebZPyquvLC0TgCPXJX5yR8+F8jVszRXlOsVXxUxv7obTms=
X-Received: by 2002:a05:690e:4090:b0:63e:3e77:a7c4 with SMTP id
 956f58d0204a3-63e3e77a7fdmr3660188d50.1.1761043045615; Tue, 21 Oct 2025
 03:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com> <20251015071420.1173068-10-herve.codina@bootlin.com>
In-Reply-To: <20251015071420.1173068-10-herve.codina@bootlin.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Oct 2025 12:36:49 +0200
X-Gm-Features: AS18NWAi-o77CPd71JT42D3mLl8vqFN7eYPAV53oOUDllJc5eKGrXIzOLUEhLMM
Message-ID: <CAPDyKFrkJp4Ny1kUoWy6LHmv6zCOGK-jVEYk95s2ayhqEbDOpw@mail.gmail.com>
Subject: Re: [PATCH v4 09/29] drivers: core: Use fw_devlink_set_device()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Oct 2025 at 09:18, Herve Codina <herve.codina@bootlin.com> wrote:
>
> The code set directly fwnode->dev field.
>
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/base/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 3e81b1914ce5..9da630d75d17 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3739,7 +3739,7 @@ int device_add(struct device *dev)
>          * device and the driver sync_state callback is called for this device.
>          */
>         if (dev->fwnode && !dev->fwnode->dev) {
> -               dev->fwnode->dev = dev;
> +               fw_devlink_set_device(dev->fwnode, dev);
>                 fw_devlink_link_device(dev);
>         }
>
> @@ -3899,7 +3899,7 @@ void device_del(struct device *dev)
>         device_unlock(dev);
>
>         if (dev->fwnode && dev->fwnode->dev == dev)
> -               dev->fwnode->dev = NULL;
> +               fw_devlink_set_device(dev->fwnode, NULL);
>
>         /* Notify clients of device removal.  This call must come
>          * before dpm_sysfs_remove().
> --
> 2.51.0
>
