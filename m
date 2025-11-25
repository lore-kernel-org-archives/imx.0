Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75BC29B795
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764052980; cv=none; b=SxQ659J+GFnrhevYJ9MOIn2nu4HyLxHXSv3pGYX5RJOPZgmUeSG0J1hguZ0ZRNuKBv9dgqtIH+ATZaCGvNC4P0ynLZhoPxfpasgCN2IBNLPsC7HkivwZwVRqSU6IXvavYqXH7iysXXonXqSZD4NbZAzct39xiTyCK/EOHlBmLgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764052980; c=relaxed/simple;
	bh=bMVM6nwiRnBB3ygequtCXeKaSYZ8JKMr74Alu8bdTfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PE6fv+EmPLjdeAcb8yp0oCiV+VZNtkBoSkz1bgHFACNOzeOgsnxrfnr+JaRPWks2X0ys/soKOrPz/5Cs58ZLkwo8Pj1ggFRgcw8j1sRFrhi6EX92zPqFxMIYdE+8R5R9Mom2Yr1p25XSsjpsW7VCCmaynBFN6f6d7lwpkiGdMn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SahkQFKW; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SahkQFKW"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a2dced861so55237271fa.1
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 22:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764052975; x=1764657775; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oDwgPrbqR3WPQpKO2RN5Ep6D/2LO+UnqChlfZRK6eKg=;
        b=SahkQFKWkPzLPiQc5MMtWNig9ISNxUQD+atnAixz+IUaMDW4q9uaXmBRrSVnXoYMaP
         4i+5BC21zFdlPHlqelk0jMF/Qr/A08AKZLs5c58VAUzjT4b+tNMYi5qlRVIAy96GpMvA
         18rdOsAwHIDj3w3VKUcifkwfw0rUt1i+00b9NFiuqdOlHsvU6bhUlYZyz+qgzoj6kfdD
         BSsaI52ObYHsmhr2aEMhtPko9tTK+hFKzZ74OHNtcWqjmeXB62YH9asHjpN8xdosc2HM
         6ImsQN2NrHE24jOGDEJtDH3zSsbandrfpSnAnrd8kwwD6KFlSu3KkiHX8QpWG3MCaxTd
         1TaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764052975; x=1764657775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDwgPrbqR3WPQpKO2RN5Ep6D/2LO+UnqChlfZRK6eKg=;
        b=Xk/BMELIw+FNxYVvGcLfYCKygFrvJVThd6uuKN2tKAzTvAunM7nBxiYRyK033NqdWz
         H0scW9xZxJbf9y5baBE1K2z2LuE5LzeMX3vj0u/5yxjT8+rUitbgQNbOLHYdzQGz5vYb
         dkYQMRqs0GHhBYguHbOctMgWu7QBeYyzJ2ABukzpuocW0QAzr1gizyeweLERz4gvWeb9
         pb1VE3Axoj9PRcuVnlGv6khF5WaUyKXxttit5170cWMjOiknWiI6YE1JTz7fSLotgDcK
         SOgTDQ7aKlzerg7SlCLQAysvwFRogrx6iweViIaeN29LHsYFy6kyB+YeR00BTREXOFJ2
         s1jA==
X-Forwarded-Encrypted: i=1; AJvYcCVNCgkuC1ywB0MzGMIdph7CKHezkxALDDmHXrwLmEYlaMXACC85dY4XA7CtD7iRmfF94Oo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMNJvcXoAf0GDMWnwGclK9j33gvSVhGJ9kTiFc+UB9HMss77yy
	2U8LNusC/+74vxH5h3LnCIBWXPIakUZjv396z78VTwk15s6W7fRbtQal
X-Gm-Gg: ASbGncv2UIPdwJ0VsqTvdYda8t5Kd9nc7h9TJxLq/WAcHFQCpmBgNMNfL5k4E4FqD6r
	b5E96KWMHM0HzT3zx8DkfMX9dQ2iWUCOCHX46fMCj3iDdNAdo+I9QaMEbae/5ndsRyPId5S8JWr
	j9wNv9CDx1bn5RTSp1zd1eQ//9NArfOKso8USt0GQlkJ9TqS/1/vVtU0zRF+FVMshZD1WGY0FPe
	Av1fj46boU24bFTs36GcWda0khnbRwUOzipbIduIe8cncXowvnAxWj6PkqfXcCm2LyIqcoMqbDQ
	CarUQ9MU4SfJcklPyAeD2A5VWB6fCvczJgi0cLc1dfQy0eUQfvumvNJw+Kxi1089Rjb4vlZai8H
	gA5fAw+2j1CfaGQKwlHE+umiYnvrtfZh2QhgJ7Ebvw/d6WaMz91N3gxIMi0JOys5TRkWVBPVHbv
	MCBykFanUOMJNxEv8vFJ+GFmsb45zLlc39IoZqc+6OefWebX0Q+a2PSbSabGaeO/63SjCi
X-Google-Smtp-Source: AGHT+IGn4O/LdPwrRfIUFu/wkzsPRHVD6YOLdNx92wJy+rnsWi85zUpEuMS1eU2wO8cl4kItz2sVag==
X-Received: by 2002:a2e:a805:0:b0:37a:3910:6c77 with SMTP id 38308e7fff4ca-37cc82af4a6mr55071391fa.5.1764052974535;
        Mon, 24 Nov 2025 22:42:54 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59ff5sm31356131fa.15.2025.11.24.22.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 22:42:53 -0800 (PST)
Message-ID: <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
Date: Tue, 25 Nov 2025 08:42:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
To: Rob Herring <robh@kernel.org>, Kalle Niemi <kaleposti@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
 Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
 Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-2-herve.codina@bootlin.com>
 <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
 <CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
 <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com>
 <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2025 19:01, Rob Herring wrote:
> On Mon, Nov 24, 2025 at 10:44 AM Kalle Niemi <kaleposti@gmail.com> wrote:
>>
>>
>> On 11/24/25 16:53, Rob Herring wrote:
>>> On Mon, Nov 24, 2025 at 8:48 AM Kalle Niemi <kaleposti@gmail.com> wrote:
>>>> On 10/15/25 10:13, Herve Codina wrote:
>>>>> From: Saravana Kannan <saravanak@google.com>
>>>>>
>>>>> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
>>>>>
>>>>> While the commit fixed fw_devlink overlay handling for one case, it
>>>>> broke it for another case. So revert it and redo the fix in a separate
>>>>> patch.
>>>>>
>>>>> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
>>>>> Reported-by: Herve Codina <herve.codina@bootlin.com>
>>>>> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
>>>>> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
>>>>> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
>>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>>>>> Link: https://lore.kernel.org/lkml/20240411235623.1260061-2-saravanak@google.com/
>>>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>>>> Acked-by: Mark Brown <broonie@kernel.org>
>>>>> ---
>>>>>     drivers/bus/imx-weim.c    | 6 ------
>>>>>     drivers/i2c/i2c-core-of.c | 5 -----
>>>>>     drivers/of/dynamic.c      | 1 -
>>>>>     drivers/of/platform.c     | 5 -----
>>>>>     drivers/spi/spi.c         | 5 -----
>>>>>     5 files changed, 22 deletions(-)
>>>>>
>>>>> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
>>>>> index 83d623d97f5f..87070155b057 100644
>>>>> --- a/drivers/bus/imx-weim.c
>>>>> +++ b/drivers/bus/imx-weim.c
>>>>> @@ -327,12 +327,6 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
>>>>>                                  "Failed to setup timing for '%pOF'\n", rd->dn);
>>>>>
>>>>>                 if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
>>>>> -                     /*
>>>>> -                      * Clear the flag before adding the device so that
>>>>> -                      * fw_devlink doesn't skip adding consumers to this
>>>>> -                      * device.
>>>>> -                      */
>>>>> -                     rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>>>>>                         if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
>>>>>                                 dev_err(&pdev->dev,
>>>>>                                         "Failed to create child device '%pOF'\n",
>>>>> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
>>>>> index eb7fb202355f..30b48a428c0b 100644
>>>>> --- a/drivers/i2c/i2c-core-of.c
>>>>> +++ b/drivers/i2c/i2c-core-of.c
>>>>> @@ -176,11 +176,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
>>>>>                         return NOTIFY_OK;
>>>>>                 }
>>>>>
>>>>> -             /*
>>>>> -              * Clear the flag before adding the device so that fw_devlink
>>>>> -              * doesn't skip adding consumers to this device.
>>>>> -              */
>>>>> -             rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>>>>>                 client = of_i2c_register_device(adap, rd->dn);
>>>>>                 if (IS_ERR(client)) {
>>>>>                         dev_err(&adap->dev, "failed to create client for '%pOF'\n",
>>>>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>>>>> index 2eaaddcb0ec4..b5be7484fb36 100644
>>>>> --- a/drivers/of/dynamic.c
>>>>> +++ b/drivers/of/dynamic.c
>>>>> @@ -225,7 +225,6 @@ static void __of_attach_node(struct device_node *np)
>>>>>         np->sibling = np->parent->child;
>>>>>         np->parent->child = np;
>>>>>         of_node_clear_flag(np, OF_DETACHED);
>>>>> -     np->fwnode.flags |= FWNODE_FLAG_NOT_DEVICE;
>>>>>
>>>>>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>>>>
>>>>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>>>>> index f77cb19973a5..ef9445ba168b 100644
>>>>> --- a/drivers/of/platform.c
>>>>> +++ b/drivers/of/platform.c
>>>>> @@ -739,11 +739,6 @@ static int of_platform_notify(struct notifier_block *nb,
>>>>>                 if (of_node_check_flag(rd->dn, OF_POPULATED))
>>>>>                         return NOTIFY_OK;
>>>>>
>>>>> -             /*
>>>>> -              * Clear the flag before adding the device so that fw_devlink
>>>>> -              * doesn't skip adding consumers to this device.
>>>>> -              */
>>>>> -             rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>>>>>                 /* pdev_parent may be NULL when no bus platform device */
>>>>>                 pdev_parent = of_find_device_by_node(parent);
>>>>>                 pdev = of_platform_device_create(rd->dn, NULL,
>>>>> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
>>>>> index 2e0647a06890..b22944a207c9 100644
>>>>> --- a/drivers/spi/spi.c
>>>>> +++ b/drivers/spi/spi.c
>>>>> @@ -4791,11 +4791,6 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
>>>>>                         return NOTIFY_OK;
>>>>>                 }
>>>>>
>>>>> -             /*
>>>>> -              * Clear the flag before adding the device so that fw_devlink
>>>>> -              * doesn't skip adding consumers to this device.
>>>>> -              */
>>>>> -             rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>>>>>                 spi = of_register_spi_device(ctlr, rd->dn);
>>>>>                 put_device(&ctlr->dev);
>>>>>
>>>> Sorry, some of you will receive this message now for second time. First
>>>> message was sent to older series of patches.
>>>> -
>>>>
>>>> Hello,
>>>>
>>>> Test system testing drivers for ROHM ICs bisected this commit to cause
>>>> BD71847 drivers probe to not be called.
>>> This driver (and overlay support) is in linux-next or something out of
>>> tree on top of linux-next?
>>>
>>> Rob
>>
>> Yes the driver is in mainline linux: /drivers/mfd/rohm-bd718x7.c
> 
> I don't see any support to apply overlays in that driver.

Ah. Sorry for the confusion peeps. I asked Kalle to report this without 
proper consideration. 100% my bad.

While the bd718x7 drive indeed is mainline (and tested), the actual 
'glue-code' doing the overlay is part of the downstream test 
infrastructure. So yes, this is not a bug in upstream kernel - this 
falls in the category of an upstream change causing downstream things to 
break. So, feel free to say: "Go fix your code" :)

Now that this is sorted, if someone is still interested in helping us to 
get our upstream drivers tested - the downstream piece is just taking 
the compiled device-tree overlay at runtime (via bin-attribute file), 
and applying it using the of_overlay_fdt_apply(). The approach is 
working for our testing purposes when the device is added to I2C/SPI 
node which is already enabled. However, in case where we have the I2C 
disabled, and enable it in the same overlay where we add the new device 
- then the new device does not get probed.

I would be really grateful if someone had a pointer for us.

Yours,
	-- Matti

-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
