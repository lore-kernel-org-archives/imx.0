Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7B32E6A4
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043045; cv=none; b=fXY/OwK6ClYXO0BYTJgdb1xMbe2+NU7uxBpS9EgUvdk0/C9QrhXY26a5i5qKTAki3OKWrK1PxgfoEOVsheotR329J56P87w/6wfq4Z1J7qKl+rK0epgzgsfbz5UD/fgvolBemEDAAvqQ56Pfzb9Cw7Oh2cOnQYknV0rbjfp0DCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043045; c=relaxed/simple;
	bh=jY85f0BTm4xZQJc0duQtrHNO8Jvd21YwmPqak4eZGgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTmcdQu0fuayg6au78qtjWTSxKkZIV9GutUsIPfFZoLBoEsSKPvbIWuFBcLM0fRedDfTQpyv0l6C3pJteMqz5HW0w9KiZHbc70Mzu6J2cSMCkLE5n2AHNu6c/xklw0Ft3EJGXk48C3vfaURl7PDfaNskic7xqfqGpjzdMvUDkZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pmk8XqEu; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pmk8XqEu"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7832691f86cso70792737b3.1
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761043041; x=1761647841; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/A+ENDDOHSgvE5iS6/3zjzMWUCCsA0O3Bo7N+5kZEq0=;
        b=Pmk8XqEunDIUAgQuuFVSLNg/LzzI+MWy8vTv5fm/FW2bRHDrwqbIflzZBDMDsIWWEL
         gdpIn1gi2LS93+9TwC+k6LGcn1hooSuiKAcK6+bR9l/QivaUFXmVYlTlZcj27vYso4tu
         3LBk/dVto9CmSG4gaVELNG7ZkLjthSGmCVOGocXOocQb07sZKXBfbL7Jt7S6EB8ydbJX
         /8u908lNu+TzSsB+R/H1VBsooDJE74VKY4Vh1SfQLJyuGLXa01FBeIG/D+TWbNdkImT2
         R0Hbs6TDU4N8wYFyWU6TRcVhS6c2N7xKrAt1SZ+c+YAIk2J+XoFJ2yMEPsViPpgvjeQ7
         i1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043041; x=1761647841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/A+ENDDOHSgvE5iS6/3zjzMWUCCsA0O3Bo7N+5kZEq0=;
        b=ZSn4v7fR5ROs8BTmcxdbjwee2ZTSlrFbIZlSDm7oZ5QoDWy8PppHj4hxsCjqySOecx
         jKa77B7/vibGJnOoPtPlToWPQbaSEym4TZLLxTp4X7CTmMOu33zRyuRMH8nTiXOwJCSL
         5Y2mLLcamFcNUb3P5BuJvCPshtVG5+YvBhqZJ4VstCYNauiJ7LO0MuH5UiXZgoq2/sjd
         Lje2Ja0xgks6vlgIDGi936ZAvS15PApJmMVGkp0ZfnPKmMNRm6ate28/IcjvoRhpS9MM
         6QSjKzfeTO3f0zM6LkOZ9ofCG/8Qmw1Jo+KMhPkc0nFKK9KDRUk8gTEx3r/3EiBbtO5t
         usFw==
X-Forwarded-Encrypted: i=1; AJvYcCXsOSgiawFHogpSAamS9V7fHGZGkKnuq1ZwQOmw+421BLpVZA64tiYKbdx2I2FW0moNz/A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLs7ldeFQDnQJWwGJyr9IM1SDiQR4zPX7TYQT1yVMSBX/swYdp
	+1a/rAdCuXZN24u8skfanvLNn4148ngkEOoILrOlqPKSUjXCMe+3x7tvLdxfmEO0NB7bhIaUFMG
	DLqw/k5+ZJYCWc7QvmubjvD42dOA5qakt1ekkDu14sA==
X-Gm-Gg: ASbGncu/rFoKLQphjg/9BW375UI7RyHm/JkhxC5vaW1JG0Ru9fCoXeIwQPntI/RxaXI
	7ZRdeiN627uPMyiaQbIua1DSJMKQffw6j2H3xHIbpZ1oKC98Ra3lzX4rcUtCqCtQv8cRK0uq63R
	Ac114IHIrE6H3PF4T4YjxbQi1Et2XvF9er0CYy1KIXDDSUpIT+iwry5Z8gn2n/aYnkZpaY6dCo3
	w+4dhnhj8RRpkSWL9Ccou90mPmMppwfJhJaHlqzwFtTTdg2Uf5oVvhe0QPFWw==
X-Google-Smtp-Source: AGHT+IHoJvOW0/D6MieN+AKPcyEQMvpsuZMp0uNhFRTQ30AAyYSDWJV0Zne8KGeUusjjnlwIFn81QpMo/9iO3PYky6c=
X-Received: by 2002:a05:690e:134a:b0:63e:34ed:a11f with SMTP id
 956f58d0204a3-63e34eda840mr5668133d50.27.1761043041095; Tue, 21 Oct 2025
 03:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com> <20251015071420.1173068-9-herve.codina@bootlin.com>
In-Reply-To: <20251015071420.1173068-9-herve.codina@bootlin.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Oct 2025 12:36:44 +0200
X-Gm-Features: AS18NWD7omNxrmhFqrJYVWmQS9VjywGnfIZM0lhZMuwUv9gCSC75_xRcZL7iDfA
Message-ID: <CAPDyKFr8C2VifsPa4YRPBEt4iAtM3eqnpH+C6wdSASF10fMO0w@mail.gmail.com>
Subject: Re: [PATCH v4 08/29] driver core: fw_devlink: Introduce fw_devlink_set_device()
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

On Wed, 15 Oct 2025 at 09:17, Herve Codina <herve.codina@bootlin.com> wrote:
>
> Setting fwnode->dev is specific to fw_devlink.
>
> In order to avoid having a direct 'fwnode->dev = dev;' in several
> place in the kernel, introduce fw_devlink_set_device() helper to perform
> this operation.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  include/linux/fwnode.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> index a921ca2fe940..a1345e274125 100644
> --- a/include/linux/fwnode.h
> +++ b/include/linux/fwnode.h
> @@ -231,4 +231,10 @@ void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
>  void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode);
>  bool fw_devlink_is_strict(void);
>
> +static inline void fw_devlink_set_device(struct fwnode_handle *fwnode,
> +                                        struct device *dev)
> +{
> +       fwnode->dev = dev;
> +}
> +
>  #endif
> --
> 2.51.0
>
