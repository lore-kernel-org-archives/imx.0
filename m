Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391FD146D7D
	for <imx@lists.linux.dev>; Thu,  1 Aug 2024 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722541170; cv=none; b=fmO+AClfYtNk43kKXTb0TDlM4VpY+OXjVwPqvzlItjk6Bx422NwUnI6t25MGuUZFaCNxZ40dZfwPCGSICNwBFOc6LoOTUJj1Ww1GHERqr6C9RoPcdiNU3wcXkWqOiaNiSBZfJVgGqzpRR+pUhGxGkkeqw5xIrGGRbzWriZQugHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722541170; c=relaxed/simple;
	bh=pruHyweAxvTF8KZPMqMexwOT/eXlJIsyJylJGRu4L50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hm4o7P3A0l8ZUsyHSuAUI60UsC4o/BQvehS6B2+SeJrJldTMgKks/GCGMR29Flq4eGpXQ0HoWojkBE+DUDf7m4r+1AXkLSB0gsZQpbmooW19D/T2kyiFA5+3fSg768YgW+3Y0LDu7MjvWAYNJCAmXr4lhckUp//f7zgFK+Lrzkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UMawL5+2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UMawL5+2"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efaae7edfso7631113e87.2
        for <imx@lists.linux.dev>; Thu, 01 Aug 2024 12:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722541166; x=1723145966; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FF7YlDE2fmvKgJlSPDnCcR+1U0vYYzkU05WjvfGWSIA=;
        b=UMawL5+2sa0Ek4egxYz4FIzRWGRL0y4F6gcS5VFojap7nq0AeFJQcpaEz4fkR3G5hG
         /1RCdIxxOnfQB9r1+Ud+Cw5BWZdgLn4IP5dk7MPM05JVrr6+zr8ou7Focc6O2qBVQgWL
         7IeE+iy0Q0l/IDrbi69KnBNknfJlTFN4Z+4CoiZd8RIZf7RSaSCsWup+I+z0Eoz82aHn
         kvq6jCaCJ3G9oLZ2gNTKvjn+sCtqlGO+RUTRl74ZoTmc6KahT3kH9brlSM0DxKBl65/P
         ouGHYG15utnNsB2l8nzj8uz58nnkHKuu+9cUwQOeJdVrMISoXLD/HN1mY0vWnMDiJTxM
         46/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722541166; x=1723145966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FF7YlDE2fmvKgJlSPDnCcR+1U0vYYzkU05WjvfGWSIA=;
        b=SRrhej0iuaO+AtwWVslIJZnpnIALgVLGIDFwSBJ8swf7jLZGSMlm5nB2KasIpofYVH
         KcWKWGaAfwh50zwhQfNOF/HGEhPANYP3xnaIY6jn3WGIIy1mQJBcHo4Tr7HYlDD+cHQR
         RzxW3TY2q4oc60d1I4VSO2WbwH/5fHWMCHSLtIHBOQ3+8AJcgtIsRM1GwhNxNsIHmsKg
         aRC3J917PDSJyrPGJ5vbcwPWQlYgXEZ22T8kHjXf3bXlLF8vRHTbY04rHjSva5YWvM4h
         9RSrAY2qZdO2cBcEDqYxk9RyqhHFnTFhlGx0Pyn1l8t36TerAwJqKc6tpAQATM7o81hn
         IYhA==
X-Forwarded-Encrypted: i=1; AJvYcCVzALTyYEOqMjddDxM973yEXFIznn4B/L3fcFKSm19dNuGGN/h/K4PCrwc1SAyBV8m7PJWudOeMl2kLkECXCRmdo6c7
X-Gm-Message-State: AOJu0YyfNoK+EnhmOC8o4hvpDUyJxPczaLBnco6r65JpLtCnXvyMoAM3
	gmKagpnIY8e1Zl7TnoXnB2P9f4qggEiq5EaNhbIfHT18ItEmZ0cZ7QGEZWZXWu8=
X-Google-Smtp-Source: AGHT+IHrfRFcjOkfOudMpARrfaByr0AHB5uVht7/mS+qeXuKcC7aluLzL18A0DURifyH8O0ikf4Tjw==
X-Received: by 2002:a05:6512:3a88:b0:52f:d5a9:7065 with SMTP id 2adb3069b0e04-530bb6c7ecemr653340e87.53.1722541166115;
        Thu, 01 Aug 2024 12:39:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba35ab8sm35544e87.234.2024.08.01.12.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 12:39:25 -0700 (PDT)
Date: Thu, 1 Aug 2024 22:39:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Xu Yang <xu.yang_2@nxp.com>, robh@kernel.org, conor+dt@kernel.org, 
	festevam@gmail.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
	s.hauer@pengutronix.de, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org, andersson@kernel.org, 
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <gamwnlydm5btay6dupjqm734njticous53tmgvakcnye56p2nd@cy5syyuy5oh7>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <3akk6hydu6iguqik3ek2pb67knihnjcepyxtbsnnasq74ikpsg@7txsek3mx5rp>
 <20240801141501.yt6ytrf2gzmravwx@hippo>
 <20240801162946.l423ue5ihfcxfiia@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801162946.l423ue5ihfcxfiia@pengutronix.de>

On Thu, Aug 01, 2024 at 06:29:46PM GMT, Marco Felsch wrote:
> Hi,
> 
> On 24-08-01, Xu Yang wrote:
> > On Thu, Aug 01, 2024 at 02:49:33PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Aug 01, 2024 at 02:49:05PM GMT, Xu Yang wrote:
> > > > Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> > > > used for connecting, disconnecting and switching orientation of
> > > > the SuperSpeed lines in USB Type-C applications.
> > > > 
> > > > PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> > > > 
> > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > 
> > > > ---
> > > > Changes in v2:
> > > >  - add Acked-by tag
> > > >  - s/SBU/SuperSpeed in commit message
> > > > ---
> > > >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > > index 8a5f837eff94..152849f744c1 100644
> > > > --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > > @@ -20,6 +20,7 @@ properties:
> > > >      items:
> > > >        - enum:
> > > >            - nxp,cbdtu02043
> > > > +          - nxp,ptn36043
> > > 
> > > PTN36043 isn't an SBU mux, so it is incorrect to declare that it is
> > > compatible with the "gpio-sbu-mux".
> > 
> > Well, so I should create a compatible such as "gpio-ss-mux" and make some
> > changes on the driver, right?
> 
> You're aware that I already sent patches regarding this topic:
> 
> https://lore.kernel.org/all/20230504-b4-v6-3-topic-boards-imx8mp-evk-dual-role-usb-v2-0-3889b1b2050c@pengutronix.de

I browsed through your series. I think it has the same problem: it
underrepresents the SS signals. You have specified the SS signals
between the connector and PTN36043. Please also add the SS signals going
between PTN36043 and your USB host or PHY.
Moreover, there is no such thing as just "gpio-ss-mux", there is an NXP
chip which providess SS mux / switching functionality (I think the
datasheet calls it a switch, maybe that's a better name), so there
should be two compatibles for the device (like all the gpio-sbu-mux
devices have).

> 
> Regards,
>   Marco
> 
> > 
> > Thanks,
> > Xu Yang
> > 
> > > 
> > > >            - onnn,fsusb43l10x
> > > >            - pericom,pi3usb102
> > > >            - ti,tmuxhs4212
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> > 

-- 
With best wishes
Dmitry
