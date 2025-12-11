Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C9D23BD02
	for <imx@lists.linux.dev>; Thu, 11 Dec 2025 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461156; cv=none; b=d4jbrmOwLfD7Lbd0fVGQ3U/HRnT6QvXJ8WScZhE+xKXWLlOA1DP6P5E4x0jgae2xLc2oNbJuilPagRQSd95QgN5mIxllUXC2VuHhFejoxlgo3DRAmP/FLpbEENhJ3+Zcu/A2MZwAKhNmJ0t39FmstqK+M07KIajhDxW8dTgCH+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461156; c=relaxed/simple;
	bh=G75QtHwaXyoGaF97/dwbuAjoqGb0m37v7wfeVaP4ZQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTW1DgIRGTNN2lKbBPDGdADcVm4Gcqut3sXAivRVtqNkrvjfI6qJ3s8vNpqohFJdyHKqfinmgVV+LYL2UuUy27kYzUnixzkjlq0h3xNKbGkix+PAwd902pj3YjwxqxO8Kbt7odejSZL0A79s4MeaJmWwOva4wf3cFVn1Q82d9+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKVf8acn; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKVf8acn"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-594285c6509so131943e87.0
        for <imx@lists.linux.dev>; Thu, 11 Dec 2025 05:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765461152; x=1766065952; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OyF8Llfg/KLa+0XknFO643JOUJVOQHSA+WqT/UvRncg=;
        b=GKVf8acn21svvU4zx0+GoN+RW8puraJ4Dnd8ZG+BJfXS833lH9wIU+d70NTdNwMKGK
         KGm9j+nu1niUh+CYx7tYBVQQBkxXwT7x9UMEnwbKjj9GdenuJz3E4J9AlSHHlmgFvUxF
         kGSauzHvH1DbEZ+ILRC0ihWLpvHN1Rhn3TLzGAppqEoP2j1/3PEo43O8knYw8cUzpwjr
         x0Q3gzCYXRmUk1EoiRgECLBdiadgdZWN8BNXqV7u4WfYFfvwAT2a/mOVHlG3E4oYefn1
         uEoSIwsNZ17rtlAHO7IAXh885nRqQMYNWMNcc2qD2p1ZRtv13QrwT1VlAumAa1SUIFO8
         pqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461152; x=1766065952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyF8Llfg/KLa+0XknFO643JOUJVOQHSA+WqT/UvRncg=;
        b=h8H5JK72//3Bor9Ynf/bZ4p9wyigN8QcuG3HXiiwtdkTb0hOD89PaStoIeOQbk63+/
         EgdFe0f1lLI7ejmRvlxjP9dZCP60KbEjiO4l+kCzGPN5+EccxO2X8v8KT8kmt80K2Mpy
         V+mIrsytvn3JQkYYFUcj/oFTTyh9/H+fzPecjoltg5gZANeNxr15m++BwRTX727ZZB/2
         hkcd/qdAUNbs/awJJJaYgLFKkzmsrLLbI6OrjwGimoCo6OGnmlPhUa/A6JT6S072XW34
         kOWQHlr82HSWFpGsCe/CyUyFA51+GrfbQA7YkonlNfSbUinm6+MA4vuTM/oloIUDoWbf
         fwLw==
X-Forwarded-Encrypted: i=1; AJvYcCWy49pCWbw4QYsz1EuKEXyhwujjJoKX4ImuNFH8VxC2+ttEcICklwznm+P+98sJ+Mbejvs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9ZMil77ZcQMRz6ffjNGJq3F81WggiSrCZCNwZzgxWoudF/RLe
	guF8qqT1fd2eXQIrecANMoukcBRzg2RJpcn0SCTmC4Z244o7jiAure+z
X-Gm-Gg: AY/fxX5uGu3/fgv7KRzgUZZJ8qQp+X35anOJ198pSFHfxG2q0ID3ogs5WcdmeQycsUw
	9JrnV+ovfMGsr0fisvGoKWpXs5imG66UDR6LobZMBH4efbd+yeOItD55I9ctT2szHpJ7rniHnr9
	DwwEfO8kH+BnkLLPqbg8lsxl/HmECTyUbpu4mdnNmLi6w6v/6i2Gqn5izcPbHFfE0uQLhPC9Ua/
	48wQAQYgXxcRWK1pvHg8iB0PGjgMI0/eBqgAZKyZesFgbg9SJWMcGTppGTxNqQ2h+iLv0yzpJNr
	NOxm9s01IpW/IzvvJjwVl0Lo/o+bFiYY8fMgZv99onEfMDhAqC5Pwh7mnXwUyRTKoQ3MgaEyzqR
	zGyI0KHhlyQk0722FP662ReF0/Ppf/CB6k/6DIalGdeHK40pkqoad9RWDfLijFV2uxw5mz6AeLl
	5KeDGkAav0GF1FHaoVD+bX6G4lh9TNliJxYd1BAgGNxqjZIWOJ1A5VcvRh0PpSF2UoiaBH
X-Google-Smtp-Source: AGHT+IFWJFGGAGC5oB/hILZqbH9Fl+tM9Ekock+BvVcvC2+WO2RAGZK2t4qHgeuRfvNMm8ED4+amVw==
X-Received: by 2002:a05:6512:1390:b0:594:28f6:b065 with SMTP id 2adb3069b0e04-598ee47cf27mr2467104e87.17.1765461151758;
        Thu, 11 Dec 2025 05:52:31 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f37951sm877935e87.4.2025.12.11.05.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 05:52:30 -0800 (PST)
Message-ID: <1b9fa77b-d74a-4fa7-b2e7-8b389d59a5a0@gmail.com>
Date: Thu, 11 Dec 2025 15:52:28 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
To: Herve Codina <herve.codina@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
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
 Bjorn Helgaas <bhelgaas@google.com>,
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
 Dan Williams <dan.j.williams@intel.com>, Wolfram Sang <wsa@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
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
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
 <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
 <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com>
 <20251202102619.5cd971cc@bootlin.com>
 <088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com>
 <20251202175836.747593c0@bootlin.com>
 <dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com>
 <20251204083839.4fb8a4b1@bootlin.com>
 <CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
 <20251210132140.32dbc3d7@bootlin.com>
 <c50c40cc-69f6-436c-a94e-94a3a10f6727@gmail.com>
 <20251211132044.10f5b1ea@bootlin.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251211132044.10f5b1ea@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2025 14:20, Herve Codina wrote:
> Hi Matti,
> 
> On Thu, 11 Dec 2025 10:34:46 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
/snip

> 
> Do you see the same trace with:
> - "pinctrl-0 = <&i2c1_pins>;" in your overlay
> - fragment0 removed from the overlay (i2c1_pins definition removed from
>    the overlay.
> - i2c1_pins node defined in your base DT.

Just tested. The i2c1 appears and the test-overlay probe gets called, 
when the i2c1_pins is in the base-dt and not in the overlay.

> In other word, is the issues related to adding a pinctrl sub-node (pinctrl
> pins definition) in the overlay or is it something else?

Seems to be related to the pinctrl.


Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
