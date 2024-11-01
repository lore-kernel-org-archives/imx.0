Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26294087C
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 08:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730451536; cv=none; b=lTEn4nEcMe/W4U5oXFi4IdwNGiSCOeaJ/PeYLcN6Cb28ksnuOcZgSFqTkOcFJu+Ilkg3ZAgw3EnI4sw4iDplMO4FuG/MDgXLeLlauGY5J7nSv8a27QJJb6vHbe/zION/WUaqqosX8Qf5Ur7VBgZUghxdbCkVaamRU8y/6jQCvEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730451536; c=relaxed/simple;
	bh=T0Hx7Xag3FRTXmP6XGYR2vtat49C3n0alPW8ATG7aUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODYeDHyuLyShS8o4r7nS1J/mLyvA4BJY5/5Ni/tUBkmhITuy+viy41wzSf6zp/IBZ1oc+g82t7tFlt8MC7n7zMUE9O+EXbVqbyZ14FV2RaFlyscAtJ82532Af//4V+TvJduYdFB3mzwizmmdChY/eZlbuA/5E178+dCB8rPmaS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=aPmnC14z; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="aPmnC14z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IeaVJHhC0vZY63A4QtQYExEgCz/IQApw8RhqgXRhQ5A=;
	b=aPmnC14zcu7eUaNpshEHexKf8C8or9kGiWOh6N82pnkymJELLGh+LVNYWq+P0x
	lOcTL39BG6IH9r2tVtoOZ3kXhnxe19/KuaKkg9ITumylG7q0vcyhGiqAiQy1PNTF
	sulrv32U3bIpJ79x58DqJ9jtHBMRwXzIpWpHSMTYQl8/g=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3P0uVlSRn0vRiAQ--.13641S3;
	Fri, 01 Nov 2024 16:47:19 +0800 (CST)
Date: Fri, 1 Nov 2024 16:47:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mq-zii-ultra: remove #address-cells
 of eeprom@a4
Message-ID: <ZySVlU2gPSN3KKSl@dragon>
References: <20241018183117.740439-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018183117.740439-1-Frank.Li@nxp.com>
X-CM-TRANSID:Mc8vCgC3P0uVlSRn0vRiAQ--.13641S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWfXFy3tw13Ar47JrWrKrg_yoWftrXEyw
	1fuw4UG395ArW7C3s8Zw40qwnFk34UA34fJw1fXr4DKayav3y3K397J3yrJr9xGF43Krs5
	AFn8tF1kJ345KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8qYLPUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxyKZWckPo77kgABsj

On Fri, Oct 18, 2024 at 02:31:16PM -0400, Frank Li wrote:
> Remove #address-cells and #size-cells of eeprom@a4 because no children
> nodes under eeprom@a4.

Hmm, bindings/nvmem/zii,rave-sp-eeprom.txt suggests there could be child
nodes?

Shawn

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> index 0c960efd9b3d5..c7bbba45f3685 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> @@ -517,8 +517,6 @@ eeprom@a3 {
>  		eeprom@a4 {
>  			compatible = "zii,rave-sp-eeprom";
>  			reg = <0xa4 0x4000>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
>  			zii,eeprom-name = "main-eeprom";
>  		};
>  	};
> -- 
> 2.34.1
> 

