Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4CE374F1
	for <imx@lists.linux.dev>; Thu,  1 Aug 2024 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722540640; cv=none; b=CzFCm0xSDtHEoRcxYXDJ0ugFxP7dFBWS56T57FIun3ad96BXm269LqldfNDCduGSXpC7GLSiQ43mjlFVVmNau6mt2iHNC6PJHAeO1tzpp9c0mRCOtiKnm3kS1DTD+84Xx859sbcm67A608vGAAmu/o76+Qf/UJeyYLE2qjzfQhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722540640; c=relaxed/simple;
	bh=CV/5T++UO2MD0pMWx0sHBAVs0Edh74GTn1C9saOlejo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mB47JqgXAOPFiJupXnOY3/A9D3+9m2lJ6CVUH4ILA7WJ2aGgeIZMvVFpRb6e47Cbz7vxreI3EytleZ9xN//jXlhGuxA4Cz51IxAoUDfVBY0sgDnsP3VvSwZ1ZzaKkPg4zbSzzszvZxfmUREtcGaB5ZXmTo24+rrFGnforC+Huu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FZVR9pk2; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZVR9pk2"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so110250451fa.3
        for <imx@lists.linux.dev>; Thu, 01 Aug 2024 12:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722540636; x=1723145436; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xl4XS3WUjBaaPZ57sgkK+WuC+L1cKpw0Puffj1HgsgM=;
        b=FZVR9pk2RctST5xrhReUbDYYU4tNHkFo/fEJY4oyxhemQ6rmUdSEYAPj040wlILROS
         nfs/uaOcw9COaqYBtsbSUYG8niuoMvm++oT0juSt9wItZ4yNAeMtxtm43vVmGxHaBmBb
         MWUZEIFn2F7HlmqpFfRz36ySUfePI4mCfnP0RGggn54SL+2uhLfTYtuV/O+C93v1STM7
         wIDGOkW1zalKE9vESwSogtJbiii2at3HjWoF+qqk9fwNhFv7wX6jNSJxX6nkEqm/b834
         5vnLZNGbnzu74S3ZEkU5PFQQg+UXk2MME9aasOZTDHn6vr1+54i1/iHXi77bVN6qOOK1
         VjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722540636; x=1723145436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl4XS3WUjBaaPZ57sgkK+WuC+L1cKpw0Puffj1HgsgM=;
        b=vRy1Vo5RL1RLmPBAAC9xkO9XbC08SOH1p64MZSgPHVU78DUDq23HULOuf0RWFoiLC6
         Ju+8fYAOxfhei47w42s5PM4Cy+E08xIjf6WSNVAqsCE0UXVG1HTwLtwe/U6b00qpRn9F
         juhSz4DmS2uak2JmZaciEYjKRZ+6xTcEqJSU5abNEG2evDZhAk8jch3i2goA/BFgVRSG
         XnDaNsjnc4z0uOzQ9t4H6zTv41zf3BD4YGS42JCj9llGc5anR+oBfueZZsckGEWLlR7q
         oEFCaH0Cacsliw2U2q3n4kJQNlC9Ngyv1VK3jbjLKgUL/D4NvA3AngZHLUfOL52L8mcs
         3xWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0F+PfdElZTm7VqY0gcC68COaUvrHIaEfstWR0wf54ly9rHhi6tKk13f6sf0WluDtjREk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz73cW5eXOL4vRAfktp7ToEVm0zAKTcQJRJlFJjdBucads6Jkhd
	55dURUcZ4KHk6B94RI6KpjtqHe7B28ZEwo8CEGFxuepxkP6lDlJo+SunHsxZdtg=
X-Google-Smtp-Source: AGHT+IF+fQISwlNQQAd55q0eA0+6wHKsOJIFh01nL17s+tQVD5GNsE9pxJ2rZPIoF9c/DZKs3MFdZQ==
X-Received: by 2002:a05:6512:3d20:b0:52c:d76f:4604 with SMTP id 2adb3069b0e04-530bb3b4664mr915571e87.46.1722540636197;
        Thu, 01 Aug 2024 12:30:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba10db7sm36496e87.74.2024.08.01.12.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 12:30:35 -0700 (PDT)
Date: Thu, 1 Aug 2024 22:30:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mp-evk: add typec node
Message-ID: <2x2u7fam2pzvnnbudjazhyfpgb5admm6p7pqlgm5yvnchuz5z2@qes67wpndrd4>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <20240801064907.3818939-2-xu.yang_2@nxp.com>
 <lzbqvgpla2souin67crolhwyun4rxy5r6ax424xnd7ypuottjf@hyvhzywqu4u6>
 <20240801140856.cadyjvjoidexaxqp@hippo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801140856.cadyjvjoidexaxqp@hippo>

On Thu, Aug 01, 2024 at 10:08:56PM GMT, Xu Yang wrote:
> On Thu, Aug 01, 2024 at 02:51:06PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Aug 01, 2024 at 02:49:06PM GMT, Xu Yang wrote:
> > > The first port of USB with type-C connector, which has dual data
> > > role and dual power role.
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > ---
> > > Changes in v2:
> > >  - modify endpoint label
> > >  - fix usb phy tunning property dtbinding warning
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 104 +++++++++++++++++++
> > >  1 file changed, 104 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > > index 938347704136..ef9b821a0ae2 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > > @@ -6,6 +6,7 @@
> > >  /dts-v1/;
> > >  
> > >  #include <dt-bindings/phy/phy-imx8-pcie.h>
> > > +#include <dt-bindings/usb/pd.h>
> > >  #include "imx8mp.dtsi"
> > >  
> > >  / {
> > > @@ -26,6 +27,20 @@ backlight_lvds: backlight-lvds {
> > >  		status = "disabled";
> > >  	};
> > >  
> > > +	cbdtu02043: typec-mux {
> > > +		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_typec_mux>;
> > > +		select-gpios =<&gpio4 20 GPIO_ACTIVE_HIGH>;
> > > +		orientation-switch;
> > > +
> > > +		port {
> > > +			usb3_data_ss: endpoint {
> > > +				remote-endpoint = <&typec_con_ss>;
> > 
> > Where do SS lines go after the cbdtu02043?
> 
> I got your point. I should represent the signal route on dts even though
> the driver doesn't use this information.

Yes, please. Bindings / DTS describe the hardware, not the driver's view
on it.

> 
> > Also could you please point out the datasheet for the chip.
> 
> https://www.nxp.com/docs/en/data-sheet/CBTU02043.pdf

Thanks!

> 
> > 
> > > +			};
> > > +		};
> > > +	};
> > > +
> > >  	hdmi-connector {
> > >  		compatible = "hdmi-connector";
> > >  		label = "hdmi";
> > > @@ -535,6 +550,49 @@ adv7535_out: endpoint {
> > >  
> > >  		};
> > >  	};
> > > +
> > > +	ptn5110: tcpc@50 {
> > > +		compatible = "nxp,ptn5110", "tcpci";
> > > +		reg = <0x50>;
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_typec>;
> > > +		interrupt-parent = <&gpio4>;
> > > +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +		usb_con: connector {
> > > +			compatible = "usb-c-connector";
> > > +			label = "USB-C";
> > > +			power-role = "dual";
> > > +			data-role = "dual";
> > > +			try-power-role = "sink";
> > > +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> > > +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> > > +				     PDO_VAR(5000, 20000, 3000)>;
> > > +			op-sink-microwatt = <15000000>;
> > > +			self-powered;
> > > +
> > > +			ports {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				port@0 {
> > > +					reg = <0>;
> > > +
> > > +					typec_con_hs: endpoint {
> > > +						remote-endpoint = <&usb3_data_hs>;
> > > +					};
> > > +				};
> > > +
> > > +				port@1 {
> > > +					reg = <1>;
> > > +
> > > +					typec_con_ss: endpoint {
> > > +						remote-endpoint = <&usb3_data_ss>;
> > > +					};
> > > +				};
> > 
> > SBU lines are not connected?
> 
> Not use SBU signal.
> 
> Thanks,
> Xu Yang
> 
> > 
> > > +			};
> > > +		};
> > > +	};
> > >  };
> > >  
> > >  &i2c3 {
> > > @@ -704,7 +762,41 @@ &uart2 {
> > >  	status = "okay";
> > >  };
> > >  
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
