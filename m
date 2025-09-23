Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4972321268
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758625847; cv=none; b=G3faiJMYFd4AnJ419AEiGU+yRFCVwHFquoJ1hjS96/qdJzRbGTjtXTfryxekWO3aXlAjXFf3O1OzsCVvbvmRXoxGisGt2xrsYMMCIUAsmht3TrG1Y9ur3Btd85RCgMX5Z/vcSxqvXDHf8m9cM+lH5whij8+1W/UHIXNCoGryZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758625847; c=relaxed/simple;
	bh=L8If8mhhgNYtNxzT0sBTVnoIcsxkhNehSrPzVwevgF0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYbxRayZROLMKpJDMyOvhx19lfD7i/gt0+to87kSiJJcsPQv1nyV/g4nixcYf+dqe+oq2ge8rDgxBC80xNVr6EiU52gJhaePIcvlaziVcSxG4Df7+gn1Dyzog0i8mNphSRfgmgC3ib9C6TZ8jY9bIOo2IELEUdNAppREIUeQQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJLXEhE+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJLXEhE+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b0ce15fso9216575e9.3
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625844; x=1759230644; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/M4chbTCwJie6GL25HuGRFhPc1V63zKjOJLKGItv6qU=;
        b=FJLXEhE+5I6Th7Dp2puIhjJVZtuTD7+NTPSHHvl+9Bdl9kPuqJbzD597O98JKAEz7M
         M4QLeylrCCvNZBQ9A4cbfVt4121cJpW80pwexZ9ZjorsTMPoU/tZwTcsnirtGYVhcL3A
         TVP2F+vjPgZDddh6vN6MM0xh84lmKnEwcCrOqeYwgUiPDv207grtaiXNwCJ32wNEoXEc
         A8GfFm7jFCvZAzMfxc4tCoUDM/L0s7bempbSkxgZoZJ3IQmoWhXvSjhsv/HYfZYpd265
         aRLK5luMt3/Rs5ylG1WR/nHn5NPh8qDLxHV+q+NqfwEPLPs/alAu5edDKEKB1r/QTLMp
         Q0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625844; x=1759230644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M4chbTCwJie6GL25HuGRFhPc1V63zKjOJLKGItv6qU=;
        b=lZXrO27LA3pNEUNCGAGEid+t8kRmY0WYrBXPkut/zte60dO9FeWMMazAFAx1DHaFTz
         l6ikDmW7UzjJtYxn1PayaxzukfrsIAmI9R4q1yoSb2BT/bU1TAJlOi+s6YNGgw6jd2MC
         2Daqwn9I6aveJXqSaOhwpIEgCXBS/Rle0d1h55VOmZI0BjbYCNkE0weonczSFR1KgWMh
         L4DB7XSX7gj45lgM02TBqC0TRJOaZcJI10wkKFlBoYrpaqSrinPmH4C4WHy2h90IR2JT
         rRGHMZuHIKzpmKL1XBuOV+E4MmjEuJo7a3cVvXXwvPCmmGbPsXInKP5y6iMzh7kX4tl1
         NMbg==
X-Forwarded-Encrypted: i=1; AJvYcCV29TIoMXOi8yfLMwcQ7ntNNLn9VtMTDUqsbhUMGty0qejVFtzhnQvneTqoq/wgQxEs5XE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1TAYBAFWnDJFHLA3hHzrnOi67ZnoOrJdOYSbp78srQHLRD58A
	LgqFglDHvOwzbsVXs41qyYhLCd6ig12yX2mbStMngteHGjhWjsSX6+Q9
X-Gm-Gg: ASbGncva3sKj9R2QQ5H+fj/TkEKlAI0FdGAnMfAv3lXillarMDCftkkR7BDO6Z4JKSK
	lyifQ1KMbXSPK+ut831rSN44PDWRUnrUEuVGVRJRvzw453XtvteBS6w7QlWmfExiZscr+25X46H
	xT+Le+b3t2SPil95bR61gvEG2X83tfurPCQC7hZU6+IVUXYMTVlpwY6ZJXXlIOyhk94hPzL0nus
	JepjP60AXz4zNd5amvBKeUhxecizCqRC8BW5xguwAEe3L9MVo0dq3RkGr9WsYdK/x6cDoqdsKey
	h1SH9K7Z2hvCpy21Vi+As1Ypppnh94FghDims7ZpySI+JVCheIZDrs0JUimEnYHDInXdxt4+edN
	N5gB7fGaHEmzeILoE8Kl8uN8=
X-Google-Smtp-Source: AGHT+IHhlp7t8Mif75guovtxrXuNcYEIzhCdfujdY3LaIWfy1jJmzn6mmtcb1ThUszzhbFiPUhqUdw==
X-Received: by 2002:a05:600c:4ed3:b0:45f:2919:5e8d with SMTP id 5b1f17b1804b1-46e1d98c40bmr12841095e9.1.1758625842783;
        Tue, 23 Sep 2025 04:10:42 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:2e0a:df05:253e:8b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e23adcce3sm3208595e9.11.2025.09.23.04.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:10:41 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
X-Google-Original-From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Tue, 23 Sep 2025 14:10:38 +0300
To: Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: dts: fsl-lx2160a: include rev2 chip's dts
Message-ID: <20250923111038.qluh2kjmc534ytig@skbuf>
References: <20240826-2160r2-v1-0-106340d538d6@nxp.com>
 <20240826-2160r2-v1-3-106340d538d6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-2160r2-v1-3-106340d538d6@nxp.com>

Hi Shawn,

On Mon, Aug 26, 2024 at 05:38:34PM -0400, Frank Li wrote:
> The mass production lx2160 rev2 use designware PCIe Controller. Old Rev1
> which use mobivel PCIe controller was not supported. Although uboot
> fixup can change compatible string fsl,lx2160a-pcie to fsl,ls2088a-pcie
> since 2019, it is quite confused and should correctly reflect hardware
> status in dtb. Change freescale's board to use rev2's dtsi firstly.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> index 4d721197d837e..71d0d6745e44a 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> @@ -6,7 +6,7 @@
>  
>  /dts-v1/;
>  
> -#include "fsl-lx2160a.dtsi"
> +#include "fsl-lx2160a-rev2.dtsi"
>  
>  / {
>  	model = "NXP Layerscape LX2160AQDS";
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> index 0c44b3cbef773..2373e1c371e8c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> @@ -6,7 +6,7 @@
>  
>  /dts-v1/;
>  
> -#include "fsl-lx2160a.dtsi"
> +#include "fsl-lx2160a-rev2.dtsi"
>  
>  / {
>  	model = "NXP Layerscape LX2160ARDB";
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
> index 9f5ff1ffe7d5e..7a595fddc0273 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
> @@ -6,7 +6,7 @@
>  
>  /dts-v1/;
>  
> -#include "fsl-lx2160a.dtsi"
> +#include "fsl-lx2160a-rev2.dtsi"
>  
>  / {
>  	model = "NXP Layerscape LX2162AQDS";
> 
> -- 
> 2.34.1
> 
> 

Sorry for digging up an old thread, but I'm curious why you applied
patch 2/3 but not this one? Currently,
arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi has no user.

Thread here.
https://lore.kernel.org/lkml/20240826-2160r2-v1-0-106340d538d6@nxp.com/
