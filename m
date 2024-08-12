Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1881C16A948
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723462851; cv=none; b=RxgUCQb+FXIeuAEwYc3S0MDAj33Ykw1vYAA6p6lHic6t0rkKfcaQfdPod4WUiMFva7mt/UhD73LCgX1uBuNi4gqBrd/tDEA0uwb+SYTeFctSjWuhNq13HSuFbMXv60IWTk5Lz7ocWBQLFWqxiMFzq+2507l6kT1M2ia/JKk2u4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723462851; c=relaxed/simple;
	bh=8mNkyAe4QwRPsdp54TZvRjolS22NXvzqQatP3Nieljs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsDVwtoJ7wKLTXD+VsukvUYAAi0jcrmlhuZaIXX/+VV7kWO6bBjmaI3Ems0G2XZ0gTTzUwkqISC9YzF8uNGKQjHL/bwku0nvmn8b9/X3HQPSzlFAHX57VBicNU1MEDHQpqalPXfHiOMbYS3DgmifjaK85deNVwdZlW0Fe342xkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=p1SjPgL4; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="p1SjPgL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Ts55m7mpTC0I6LnjoJa/C+UU7cvRLo6zyXkhTE+BCwc=;
	b=p1SjPgL4fc/+FyGB3+JkVdSTZOiOsfmNkovu7AK9JwRWW0uQU16aUtmFtiqChm
	R7B+clntBzOf/5HV/1UfM3VYx4Uq7YXehK0TRFwML879EKeouK21BDMh9Q/ieJGj
	RIlNhG8AQBirCpUX+92Mr3ISGisoMoCCPuY/M23hHIKL8=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXH8Ch9Llmd4EQAg--.625S3;
	Mon, 12 Aug 2024 19:40:19 +0800 (CST)
Date: Mon, 12 Aug 2024 19:40:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 1/2] ARM: dts: imx53-qsb-hdmi: Do not disable TVE
Message-ID: <Zrn0oR3ocKPBrI8H@dragon>
References: <20240722030413.3456203-1-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722030413.3456203-1-victor.liu@nxp.com>
X-CM-TRANSID:M88vCgCXH8Ch9Llmd4EQAg--.625S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsBMNUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwc5ZWa578UNDgAAsm

On Mon, Jul 22, 2024 at 11:04:12AM +0800, Liu Ying wrote:
> SII9022 and TVE are connected with IPU DI0 and IPU DI1 respectively, so
> they are in two different display pipelines and may run simultaneously.
> Keep TVE being enabled as imx53-qsb-common.dtsi does by not setting it's
> status property to "disabled".
> 
> Fixes: eeb403df953f ("ARM: dts: imx53-qsb: add support for the HDMI expander")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied both, thanks!

