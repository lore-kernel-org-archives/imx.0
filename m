Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC4B2038AE
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730195465; cv=none; b=ESV8Nkx6bo/c3mQDrXjLXqQ4VG2R8ddm+x2KdPOUg0OZgc4WOZkeTotrEYO9I/Y36/A3BJ0dugKv8CxDzKTQXlub9XuTzuF/Kj0YVTd17+doZv858XYMOUap1eOF9O3W3D1oIZtuOWn5bGQ+sAGZOdisg82Sdangmlcxv4SPDnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730195465; c=relaxed/simple;
	bh=39opx4AEbFgsPisd21xZY2yvTQjSfsl257y2kw2k4Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dS81hcGgpXOELXIdsb0RqsIiwWtjUZZIHXTerFRKoTfYsF2DAC0B0Iqc0y43v3UURyOrQGY+MPahDqfNwpQINovpntH2UFM9PyumM/lRznEagkIThGJyTNsixWK5skQCHzUmm2piXkF13SkK4SPnig2Sbk2Qm7OY1HfRBLA14Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPV6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1t5isG-0007ky-Lq; Tue, 29 Oct 2024 10:50:52 +0100
Message-ID: <4addc413-dd13-4867-8c49-45539af7b45b@pengutronix.de>
Date: Tue, 29 Oct 2024 10:50:51 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx: Remove fsl,imx6sx-lcdif fallback
To: Fabio Estevam <festevam@gmail.com>, Andreas Kemnade <andreas@kemnade.info>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>,
 Marek Vasut <marex@denx.de>, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20241028180844.154349-1-festevam@gmail.com>
 <20241028180844.154349-2-festevam@gmail.com> <20241028194728.0655edd3@akair>
 <CAOMZO5APJM57_ixBiRFZSZex3AiawA=mtqMszdGezVoajaXYhA@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAOMZO5APJM57_ixBiRFZSZex3AiawA=mtqMszdGezVoajaXYhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

[Cc += Marek, who maintains the Linux driver]

On 28.10.24 20:48, Fabio Estevam wrote:
> Hi Andreas,
> 
> On Mon, Oct 28, 2024 at 3:47 PM Andreas Kemnade <andreas@kemnade.info> wrote:
> 
>> As the devicetree might also be used with other software (e.g. u-boot),
>> this might break something.  So if u-boot (or any other software) does
>> work with fsl,imx28-lcdif because it only uses a subset of features of
>> fsl,imx6sx, it might be worth changing the binding instead.

Thanks for raising this point, Andreas. I think it's important to adjust
the binding's compatible list binding if need be to avoid breaking DT
consumers.

>> Same for Patch 1. But I cannot test that and do not have a strong
>> opinion here.
> 
> U-Boot would not be broken after these series:
> 
> https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/video/mxsfb.c?ref_type=heads#L388

The barebox driver only matches against fsl,imx23-lcdif and fsl,imx28-lcdif:
https://elixir.bootlin.com/barebox/v2024.10.0/source/drivers/video/stm.c#L579

The MXSFB IP appears to be completely backwards compatible. Otherwise the
i.MX6SL/i.MX6SLL integration of it wouldn't have worked as it used to match
against imx28-lcdif so far. Checking the Linux driver, the differences to
the i.MX6SX also look like they are not backwards incompatible.

On the other hand, Linux users may start to make use of the new features
that aren't available without having imx6sx-lcdif in the compatible list,
like the overlay plane and the CRC32 functionality.

With an eye towards improving device tree stability, I think it's more
appropriate to adjust the binding to have three compatibles instead.

Thanks,
Ahmad

> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
