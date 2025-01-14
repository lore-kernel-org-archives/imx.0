Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9B3DABF3
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848536; cv=none; b=nFTjmk5KwlgnkOpPDf5jqGXxVoYiL3fTx7z6rezN3bOctIErVPUdL3shvKc1cBBd0MvqfJWfUBrHDqJLhYlTwiijTQjahFRnWuxJSRKMC61i6DtFqk9GKCcrQve4iccXvZgWxP+HTvPEsxUcn+NZxOTEuHgPNtQg9lGPldLJaQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848536; c=relaxed/simple;
	bh=Wf7Ij/bbTSH9F+tunPrr1EksbaNI5ggnkDzx2XjAQBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAqKycc0cuNYuU/KpoHdYLozVXewFerfhZ7wLW59k/EXGP+6jrlf4/hq76IBXye0bHwGTf6Nc32S5CmFab7Fl00846u4q3X/O7jSY/MPaX2e9hCjSA1qGHsYREjTy7KgymBIAZS4KyGvGq2J4TvPsP9lyLyjfx6XAaY82Q8kxCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXddj-0003GN-6L; Tue, 14 Jan 2025 10:55:15 +0100
Message-ID: <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
Date: Tue, 14 Jan 2025 10:55:12 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
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
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Andy,

On 14.01.25 10:46, Andy Shevchenko wrote:
> On Tue, Jan 14, 2025 at 12:19 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>
>> The i.MX GPIO driver has had deterministic numbering for the GPIOs
>> for more than 12 years.
>>
>> Reverting this to dynamically numbered will break existing setups in the
>> worst manner possible: The build will succeed, the kernel will not print
>> warnings, but users will find their devices essentially toggling GPIOs
>> at random with the potential of permanent damage. We thus want to keep
>> the numbering as-is until the SysFS API is removed and script fail
>> instead of toggling GPIOs dependent on probe order.
> 
> While I understand the issue this tends to get never fixed until the
> entire support of iMX boards will be dropped.

i.MX is an actively developed and widely used platform. Why should support
be dropped?

> Personally I do not like
> this series at all. Rather let's try to go the hard way and understand
> what's going on to fix the current issues.

/sys/class/gpio is deprecated and when it is finally removed, this series can
be reverted again. The alternatives are either do nothing and live with 6 kernel
warnings cluttering every boot or show users the finger as described in
the cover letter.

Do you see a different path forward?

Cheers,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
