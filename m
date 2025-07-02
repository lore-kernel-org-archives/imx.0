Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D582A1AA
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751450670; cv=none; b=MtIoTnLtHuiKM8GaBBVNdhcjhGQnv966J5lUpAs9hQOz9541fZZktIWFY8/iAOXZrVa4qgpRPmrdbO043qZPNZxmuB0YwmZp6aqqG4/mqTtFnP9MR6kpQ4RYZtzQCMPy/BEFIygBAhjTkmAzauE1NgY5ZfPHTU/aj2ZLLc3me/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751450670; c=relaxed/simple;
	bh=YmWB2PS5k+I/h85xHtp1DrV94Gk+P3all4vfXIO5H0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdJjy3kb9Ew2lwRRIV0nB/xOHtX4IbUmxAl3vtJbjrS5Fl7iyU94FOSonNKRZd3/XFi6nEuPSe/KN9TxtnFVJdQ+afLYPZit+YAzlsCdMJ24ilbpfimvOuHd6tf/Zf2UHBsxuZlgrULu1favuPmX/eMh4JtZj0HTJJ0jqPXSfQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gkqMxnx3; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gkqMxnx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=fe/YxVKoC2fn46SpQ1KgS3L3WodKPIMLOl4hzG83lAM=;
	b=gkqMxnx3uoIlJH5llmNZd4DLnuRBkeFsEB58E8+ZEbFfFGqBeCw4/sRbCMLM4j
	F9Y/qF4T8goy1lXk5MrOrLEoFE19j37iBv8UWFnZfWYL35QOEg4ZlYSsLBVZxUiY
	wrt9bgvtw8hviTdpfyXWHYWLzWFWIRbvsOm7B+UnD7K3U=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3tuPOA2VoldwpAA--.26848S3;
	Wed, 02 Jul 2025 18:02:56 +0800 (CST)
Date: Wed, 2 Jul 2025 18:02:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH v4 00/10] Support Engicam MicroGEA boards
Message-ID: <aGUDza5XRGDqfz5n@dragon>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID:Ms8vCgC3tuPOA2VoldwpAA--.26848S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr4kuFWkJF4kGF15Gw1fCrg_yoWxtFcEka
	1rGF48X3yYgrZIqw13uws0qrn0qw1rXr43JFWjvr13Wr9Fyrn0kF4rt3Z3WFWUJ3WYvF1D
	JFW8Ga4Sqr1DWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj73kJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQl+ZWhkuzL7xgAAsr

On Fri, Jun 20, 2025 at 10:27:04AM +0200, Dario Binacchi wrote:
> Dario Binacchi (10):
>   dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
>   ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
>   ARM: dts: imx6ul: support Engicam MicroGEA BMM board
>   ARM: imx_v6_v7_defconfig: cleanup with savedefconfig
>   ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
>   dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
>   ARM: dts: imx6ul: support Engicam MicroGEA RMM board
>   dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
>   ARM: dts: imx6ul: support Engicam MicroGEA GTW board
>   ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

Applied all, thanks!

