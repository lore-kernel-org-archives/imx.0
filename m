Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99B1140E38
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 21:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732741560; cv=none; b=rHN2EETTCA9wmNLNzsmXjE+6/Gg9qCQRSt55Rlkp/7gpwOnO8W4O8TjW1ucrHxNqmU6GLJlCCzrAvMc15w2wSzNcIUBVEDgDjUl+QjRGa6Lvf7CtnVSjYyRHE66NsJRMdZ7hdFTp6JKXUbi07korjlYvRlcXAACauDgRt4VqGdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732741560; c=relaxed/simple;
	bh=UGjEIk59Hd3O8oCv+dlj3obMsOyxXh7mzUzFv1kOh00=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PMSiIveYS1WcvWubGQuGqaCYaJplh8zy+K2Ss4QDBKfXRbH8Gx6J4foe7ctms7+N5ZM9/AGn7SnHPZUnwwVt7FcQ4RpxSkyfA3Yxu4ZehrycW4FQqutRaaytJXssVmYAcRuW+BJYqcNZcB7/oMY5bOAkGk9ViVsyZpfqyacaER4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=fGJQCtlN; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="fGJQCtlN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=X8EVmq9yK79N3HwiRhmW5k5GKfVb5mMq7WA79LDiM8c=; b=fGJQCtlNLqTKDt2sl8pEl1CfLT
	JuLxmsMQvVRyKrmwmkkqPGfh3RXw7QDcQTr9DEoMzrQg+nzOiWaFby9hQST/WP7Yl2Mf4ayA74OYQ
	etNy4EkhAkTlhOygjBvOBouIoJRz30bcyjp8ASec7We1MZlkqPu8U2+wFMQpTP+wtBIi9rHeBHXrR
	t30Ly6UvbVLO4/r0h24DwW9E2zWCU1Mi3tglTbPB0pdp5NTTsRzo+nA73hp6MtkMk3LPqKwTKO/98
	SMVk2fwF/Hhn737OG8BfAfKbVNk+1aaucc5OktW9HO7Fx2Q/66YTtGmmuo6FjPiITA1QwU3IjZDlK
	2O8dWaWw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tGPEL-000IEN-IE; Wed, 27 Nov 2024 22:05:49 +0100
Received: from [87.49.45.24] (helo=localhost)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tGPEK-000I82-35;
	Wed, 27 Nov 2024 22:05:49 +0100
From: Esben Haabendal <esben@geanix.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org,  linux@armlinux.org.uk,  s.hauer@pengutronix.de,
  linus.walleij@linaro.org,  linux-arm-kernel@lists.infradead.org,
  imx@lists.linux.dev,  linux@roeck-us.net,  arnd@arndb.de,  Fabio Estevam
 <festevam@denx.de>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com> (Fabio Estevam's
	message of "Wed, 27 Nov 2024 16:06:05 -0300")
References: <20241127190605.1367157-1-festevam@gmail.com>
Date: Wed, 27 Nov 2024 22:05:48 +0100
Message-ID: <87ed2wfkur.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27470/Wed Nov 27 10:59:44 2024)

Fabio Estevam <festevam@gmail.com> writes:

> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
>
> Fix it by selecting CONFIG_PINCTRL as before.
>
> This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
> pinctrl"), but it is the less invasive fix for the boot regressions.
>
> The attempt to build Layerscape without pinctrl can still be explored
> later as suggested by Arnd:
>
> "Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards."

While that is possibly true in most cases, wouldn't it be possible to
use a kernel for an i.MX platform without having pinctrl support in the
kernel. If bootloader or something else before the running kernel have
setup pin functions properly.

By reverting the change, you will also make it impossible to do this
without patching the kernel.

But if not breaking existing defconfigs is more important than allowing
flexible configurations on the short term, then I guess that is how it
should go.

> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Reintroduce "select PINCTRL" as a minimal fix for 6.13-rc.
>
>  arch/arm/mach-imx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index e4fe059cd861..dc47b2312127 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -6,6 +6,7 @@ menuconfig ARCH_MXC
>  	select CLKSRC_IMX_GPT
>  	select GENERIC_IRQ_CHIP
>  	select GPIOLIB
> +	select PINCTRL
>  	select PM_OPP if PM
>  	select SOC_BUS
>  	select SRAM

Instead of doing this at top level ARCH_MXC level, it could also be done
at the SOC level.  Something like

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index e4fe059cd861..26d29dea1721 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -59,6 +59,7 @@ config SOC_IMX1
        bool "i.MX1 support"
        select CPU_ARM920T
        select MXC_AVIC
+       select PINCTRL
        help
          This enables support for Freescale i.MX1 processor

That way existing defconfigs should work as before, while SOC_LS1021A
builds would be able to leave out pinctrl.

Even thouh LS1021A is clearly officially a Layerscape SoC, I think the
reasons for it being placed in mach-imx is that the effort needed to not
do that is more than it might be worth.

/Esben
