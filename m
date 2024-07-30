Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C34194A63
	for <imx@lists.linux.dev>; Tue, 30 Jul 2024 11:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722337958; cv=none; b=k9qO6kk49SLd60bb3Gq1Upicv2udHIIPdk7TG0whGnczxFsRu1QEYXDnBLyVNPLU7mdCPs2vpaBuhIPAG5xSA7zk1j0tP24gh3G4Qi3mR/tC0Dz8uxXTvq8tcr/iBtEBn25JZ0psqOvnJFeVVFy/Qc6HAWWOnIHqK3XzXU0Vlkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722337958; c=relaxed/simple;
	bh=N7lqSf5AO0WbYGPFlk+06BHDm4ESUR4XJgtnxoK2O70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHkGv+P8I+qkKxIYvBIAA4QRJOSthgx9+Wm6WaIC/pMS7q+dY1hqj25+XSgJUqjuiJCrvm2ZdJGtA8hS+8Ytz9TdC0zdnm8RgzmvWsulWD+mKMwWMaIMhI/8cpOcF5YZ7zkJP8Vw7anG5dMUkM8QgBzYcv0MgBgN04AGIC73oAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rrNui69m; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rrNui69m"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f04c1e58eso5752351e87.3
        for <imx@lists.linux.dev>; Tue, 30 Jul 2024 04:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722337955; x=1722942755; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HozFc70ppioaxUQeurqe5EazU/NJguJmDUXHTU07LQ=;
        b=rrNui69mXH/bCeAc13nVc1ArE+dcFOf6tdrDeBGc/l74CU0cNzBKLl+KKAZg4houUU
         4lvFZ0pxZyzFX2w7a3mkKThQUDDVXxPOQO08+ztT1rtVa+O6WPxNPyunt+Bd9fSqse8y
         5P0epcPi3UqiqCOFHPxgX7rnY+G4XoFzlF4gCqE2DGl55CwGzyQ1bfu2p77dBMJ3W4Sb
         rtFJm6biCxQFuWxSvjr8Axa+07gn4n5ckbJxwggqRsLoZXnkAlOg5AKJYbnOm5kSD2nE
         zdHImhMqe/EBePbClXOOr3njb8yQdZuTNQX/ta7H6WpKOVbiNtYNFeLyiN959wM7fTk1
         E/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722337955; x=1722942755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HozFc70ppioaxUQeurqe5EazU/NJguJmDUXHTU07LQ=;
        b=QyI3VzOBBz07qumfaFgRPwp8xRWvOYh8EV4mtg9PiEiU1QBYxX4V1zAwNAgKSt+SdL
         IBVfHGuEIumYspFhEpvkTsr/11a5XlJQmHqPkF9ZCY/F4GlFXLzEeljGi/OKktsPc/6U
         PbgMBA0DyydkR+YWDy7jYw6x0Nbv6MG4KSem5SLNkOSfxYKNF2yFtBdw07XG5SC4f3kj
         XHsrRmbEWe/+i9F5Msdi/cRi8DpZB9sPusNSOAYLFvwseFwwVN4awexfb0JdBtbJP7Fa
         zNudfsKPxOFYXXRJmxPYLjg6nmDMeZEWZafdg1dovfLONCp7Bcky+/B7zcrzHolcfP6P
         v5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWyAT5qdJCgYv8WsfNtnWmbs7KfeJFoLBUq7W/bk/YOpQVuNyuFZLRz3BOHw4elH3gMdyIcWqpKTzHJO7TvNpbAIRja
X-Gm-Message-State: AOJu0Yxjz8XCDypafsD7wA5uiWeSiYhOPJqvv3MO01jJryFn90S3vUN4
	KmPDPFBkEWTkn6Pj0OSaCKSHRLaRLBWbZkKsE9+2WwQnix0MP+RqASU6xmzIMsw=
X-Google-Smtp-Source: AGHT+IETyOU+BVaq0nxGbsyKgG83TJMfWwawfhmuw27Fu8otQEXo4m3r5dLoEMYAGXZwPrSqaMrXcg==
X-Received: by 2002:a05:6512:39c1:b0:52e:fa5f:b6a7 with SMTP id 2adb3069b0e04-5309b2706eamr11020166e87.13.1722337954674;
        Tue, 30 Jul 2024 04:12:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc414esm1848644e87.22.2024.07.30.04.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 04:12:34 -0700 (PDT)
Date: Tue, 30 Jul 2024 14:12:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <7gojzjkcpq753x2eb67osvvwfzxytqkm6sxm5qyank4qpdmdnb@mdunl7yq5wd6>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
 <a3trxkx2fue2oahscjkc4silnfhesrws5xn7brjefjmke5emci@dn3cbb7yzmux>
 <20240730025844.b647xuoolg6zq6f5@hippo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730025844.b647xuoolg6zq6f5@hippo>

On Tue, Jul 30, 2024 at 10:58:44AM GMT, Xu Yang wrote:
> On Mon, Jul 29, 2024 at 10:57:33PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Jul 29, 2024 at 04:10:37PM GMT, Xu Yang wrote:
> > > Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> > > used for connecting, disconnecting and switching orientation of
> > > the SBU lines in USB Type-C applications.
> > 
> > NAK, this is not correct. PTN36043 switchies SuperSpeed lines and not
> > SBU.
> 
> Yes. Since this gpio mux is able to switch both sbu line and ss line,
> I will change SBU to SuperSpeed in next version in commit message to avoid
> confusion.

Ack. This needs new compatible and probably more schema (and driver)
changes. I think you can't just terminate SS lanes in the mux, they
should go to the actual SoC part (like the SS controller or PHY).

> 
> Thanks,
> Xu Yang
> 
> > 
> > > 
> > > PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > index 8a5f837eff94..152849f744c1 100644
> > > --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > @@ -20,6 +20,7 @@ properties:
> > >      items:
> > >        - enum:
> > >            - nxp,cbdtu02043
> > > +          - nxp,ptn36043
> > >            - onnn,fsusb43l10x
> > >            - pericom,pi3usb102
> > >            - ti,tmuxhs4212
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
