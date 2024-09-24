Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F662E419
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727197385; cv=none; b=A7kPpydkRqfL7CSLF6dnekULjZ87zFN25llqVOVDQvDY1f6OJ4rcCa1WuCnvEzxiIBlU16OPSfdBSNiiutMyZe4f0WDnwaKtk3ndteFDz3TCuQ0m+1QH7RZlnFCYbkszxxAWxdpIRAlxg5zLOyz2nOMe8D4KNoVjEn0rDO8itMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727197385; c=relaxed/simple;
	bh=2OpMkPIwvrCs1mSsYtTeavFVMt2m/J/G+IqR/gjs/6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGa3k93qndaveKPbZc9uHrdPGu196ITBz5EMlNSCJgom2I6HnzXDZlCvH7J9gnrXLC6kqQ32dHhsxyMOviVisKAmM+Cezq16IZdMmtjMjotCHVXzHuAFtYOVi0XpBkLsWPJhzPgoHNY0uC5bsVsSvbD+4VFlOQ6Zv63sc6NQQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfgOpwOK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfgOpwOK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d8a54f1250so3798258a91.0
        for <imx@lists.linux.dev>; Tue, 24 Sep 2024 10:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727197383; x=1727802183; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ri+GAU/GeYWJ7kAA7IwGhSHyAI6OloJr9cBh+i/4KD0=;
        b=mfgOpwOKigt/4AACBeOAHtZX3701GKPcJFHZRibf7b4UO/FkWcywpcdwE56iOVBI7s
         yBLGSVU8U6hAdgte9qny91zWDN9FCaHsZMI8NAtEtcaOdzJ7jBNsbClFCDscEiyPJbP3
         p5lpbMGqptsHNPpFI2Jo6ZqCsS9AjSZjWMd9xh30o1pi0ZQDIRV9BH2TUgmL+rG7miqd
         Xz0cGHTLQ2ivPu0c5/t8aLYyq4AwxOjfbzG55ubVec/KHNvZzxul4ohAhg/Q/1gpUmtP
         IUmkKhEVkJPYswY7i7q9ELxM+qsxSeX5dReSE4zOz3B71TVfPU985wITJg5W39jOK55r
         81NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727197383; x=1727802183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ri+GAU/GeYWJ7kAA7IwGhSHyAI6OloJr9cBh+i/4KD0=;
        b=JbFg+WZxxbWI7CnPCoCP3ayj0/dj6EF9wRjAkWIjRNRE5kQ/Inau26KwEAfAjh6GQ7
         mK6IxsCTUSp+hSM93OKMlcTixWOprjt59EcY9z7cw1/mSfhFL1WL6AaNraB/jNMjEvOe
         hJssUleDpfOlKWDki5XTSfcsUj7pS8fxq1SPIDZ2c5XrXA1aPN9FtPsL+FoixWl/18SA
         ht0qlTi957aKuEcTSvyzS8hwKayxUKsdH6QkKhExnDOfl2CYP2NVvR2hpwsuASm25+c4
         nTfD5mHt7jRuKUhrsDAWsv4pvSMRuwflgHVWGU4RxGij5Dgoz4yLKh8pNtlXfjSU6Fq4
         /8Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVbgy+ppnS8K7jKS7+hBPDhJhT6ZJQw4w08tKXw9IEwILKxDvaqtuk5F5YAHZdW+wmak2k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqoSXkqNkPWOC0r3xEp0UGLpl9ccg7qP6EP+F7I7RV94vZZn60
	UbpUN8bSelVDtOOHhA2bP11eSQxyz9H+4zHBT4oP/1f1qrwpcqwL
X-Google-Smtp-Source: AGHT+IFKCI4MDKi4ygHlEjuHRjdP+HLRKNnYJF/sTyPhgmEdcEPM4C9gNFo1BFv48YUeTBRut9mF3A==
X-Received: by 2002:a17:90b:1286:b0:2d3:c892:9607 with SMTP id 98e67ed59e1d1-2dd80c175c9mr17637988a91.12.1727197383448;
        Tue, 24 Sep 2024 10:03:03 -0700 (PDT)
Received: from joaog-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd837875d2sm9908018a91.21.2024.09.24.10.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 10:03:02 -0700 (PDT)
Date: Tue, 24 Sep 2024 14:02:54 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: imx8mp-verdin: add labels
 to som nodes
Message-ID: <20240924170254.yx4v2m23evppfa6l@joaog-nb>
References: <20240924114053.127737-1-francesco@dolcini.it>
 <20240924114053.127737-3-francesco@dolcini.it>
 <ZvLUmqM5FWqKPxoi@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvLUmqM5FWqKPxoi@lizhi-Precision-Tower-5810>

Hi Frank,

On Tue, Sep 24, 2024 at 11:02:50AM -0400, Frank Li wrote:
> On Tue, Sep 24, 2024 at 01:40:52PM +0200, Francesco Dolcini wrote:
> > From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> >
> > Add labels to ti-ads1015 and fec ethernet mdio node to make it easier to
> > reference them from other nodes.
> >
> > Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > index a19ad5ee7f79..e9518b7c7aa8 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> > @@ -320,7 +320,7 @@ &fec {
> >  	pinctrl-0 = <&pinctrl_fec>;
> >  	pinctrl-1 = <&pinctrl_fec_sleep>;
> >
> > -	mdio {
> > +	verdin_eth2_mdio: mdio {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> >
> > @@ -591,11 +591,12 @@ hwmon_temp_module: sensor@48 {
> >  		vs-supply = <&reg_vdd_1v8>;
> >  	};
> >
> > -	adc@49 {
> > +	verdin_som_adc: adc@49 {
> >  		compatible = "ti,ads1015";
> >  		reg = <0x49>;
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> > +		#io-channel-cells = <1>;
> 
> Why add this? it is not related with what descript in commit message

The #io-channel-cells property is required to reference the ADC
node as an IIO channel producer in consumer nodes, otherwise, DT check
warnings will occur. I agree that the commit message could be improved,
but I consider this a minor issue. Would it be acceptable to keep it as
is, or would you prefer a v2?

Best Regards,
João Paulo Gonçalves
