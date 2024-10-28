Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA833A268
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 18:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141268; cv=none; b=cfTTw99xhtTIxXckR26Q2DoFmDfjmtAkwFWxezsb9MUmo59U3/xfp8q5vWmKlMZEQwhAsmRKVZ6znN/Frke67ahxfcM1Wm8bRMREY5eONBpFmlRP+3F9zI45LuhZ6ITsWlPQXZqkUfOqAtEBHYmzBXnj6aX6pEnd3jOZbgvy5WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141268; c=relaxed/simple;
	bh=r8iGMR8HMG2eBXS4RZBW37+L8nJK2UFHqnYo8ScEnV0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eajT2Yev/r1+0PRO/otQXSZLa1hvSSJiPcUb0AVJOBXjFuTeCyFLs0hsFAiLX7raiYb2FsBdvNXn7URZCjOFmI+X5fQHOKQCWtkvj5be5rCdPxwwCgaaJxk8hExjNZBnPopEXPaoIhyA8QU3M+wR0pfr49DK0TzX0GQwMUaWjJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Ox7UQMIN; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Ox7UQMIN"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t5Um9-00AIAG-1E
	for imx@lists.linux.dev;
	Mon, 28 Oct 2024 19:47:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=keYcC9fhxqNbYuzzzk2WhE2mtMjSjj0nBQVIyjqHiRw=; b=Ox7UQMINWv7qTuRqJRZEbZECAy
	Tzf47LEPIniNHdmIm6V1FNmDhWvHMy5BM9liiZo4H4mDGUFtsWlIeoeUpiJ6KemJ9Pf+psb0LF2SN
	zW+xXgMZbiWyUFxUrly/O8UNFE6kTbv18g4w00NqIoy3uRx6WN/Sz5wzLSFcw6dSyKJK6ExILFrX2
	+oQSgMLlntb7PLDs8G+0DZa8UPyadU055ESjhzcdaKi8vzecL18YWm3OLEIomwf2LHQvM0i5pMXKB
	MnauT4aJr1AQnet7+OuuhTOkMdx0wCmxiEsGSa1ljLlCDchyZnGcg7EP7Pw0w0kLsp4bYOu5t0cRJ
	975QpCDA==;
Date: Mon, 28 Oct 2024 19:47:28 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx: Remove fsl,imx6sx-lcdif fallback
Message-ID: <20241028194728.0655edd3@akair>
In-Reply-To: <20241028180844.154349-2-festevam@gmail.com>
References: <20241028180844.154349-1-festevam@gmail.com>
	<20241028180844.154349-2-festevam@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Am Mon, 28 Oct 2024 15:08:44 -0300
schrieb Fabio Estevam <festevam@gmail.com>:

> From: Fabio Estevam <festevam@denx.de>
> 
> According to fsl,lcdif.yaml, "fsl,imx6sx-lcdif" does not have any
> fallback.
> 
> Change it accordingly to fix the following dt-schema warnings:
> 
> ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

As the devicetree might also be used with other software (e.g. u-boot),
this might break something.  So if u-boot (or any other software) does
work with fsl,imx28-lcdif because it only uses a subset of features of
fsl,imx6sx, it might be worth changing the binding instead.

Same for Patch 1. But I cannot test that and do not have a strong
opinion here.

But thanks for touching this annoying warning.

Regards,
Andreas
