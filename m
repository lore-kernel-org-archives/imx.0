Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20BC28EC63
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849227; cv=none; b=g6IuasmSWMojFPs7cqIb8OwzG3WtE2BdonT5EZDXbxLyQpPUgBkJNX0O0dX61BbrX6fXMXqnmTUBN8bvyKnJoD3Ye7dhyMGZVHSm183chD8RRvRBThb6Y1umWxhs7lbRADcrJ1PbonBbTUc96Dy9xSkBRiyi/OlUXx404wxE0j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849227; c=relaxed/simple;
	bh=KORkN1JbFadO12AYohqRnD+/9L55tKfJwb/Dj8+D4jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtSA8R8Iwr3dvVL7+iJpk90YU3KqIavVFTtBnuaIZjTj6AavQwdAvY3MhUPhfPaEiXBfBg3JbTAUz71ikeMgkwGURcgun76Q4VxAS0onsh8cDP4pQUSxOvJskYYAEnnDUVY+3IQo2XqVIUlFz02l9/G4bkwWT+OgCUZqswvFuF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXdp0-0004Ev-J9; Tue, 14 Jan 2025 11:06:54 +0100
Message-ID: <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
Date: Tue, 14 Jan 2025 11:06:53 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Haibo Chen <haibo.chen@nxp.com>,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 14.01.25 10:49, Andy Shevchenko wrote:
> On Tue, Jan 14, 2025 at 12:20 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>
>> Some drivers have had deterministic GPIO numbering for most of
>> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
>> ("gpio/mxc: specify gpio base for device tree probe"), more than
>> 12 years ago.
>>
>> Reverting this to dynamically numbered will break existing setups in
>> the worst manner possible: The build will succeed, the kernel will not
>> print warnings, but users will find their devices essentially toggling
>> GPIOs at random with the potential of permanent damage.
>>
>> As these concerns won't go away until the sysfs interface is removed,
>> let's add a new struct gpio_chip::legacy_static_base member that can be
>> used by existing drivers that have been grandfathered in to suppress
>> the warning currently being printed:
>>
>>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
>>   use dynamic allocation.
> 
> Warning is harmless and still a good reminder for the stuff that needs
> more love.
> NAK.

A warning is a call-to-action and it's counterproductive to keep tricking
people into removing the static base and breaking other users' scripts.

I don't understand what love you think this will spawn with regards
to the i.MX GPIO driver. Can you explain?

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
