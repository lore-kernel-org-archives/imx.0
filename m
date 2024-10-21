Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F079A1E3DF9
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729508809; cv=none; b=nrcpEcCorLJfFSp0snrklUDNpcKr33W5ZWPZXFpkiGZmRyDkb6qtIiCbxrBKLRKKIvipZGvkZ9UhCPmxZdT38WhsyXaLKiDbqfevupQBmDDT3wzhRrtP+aXtVBExhR3jzxHe2b16elkaxh4tVbKEtbfZ98y6cpffH8MSgm8wmM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729508809; c=relaxed/simple;
	bh=j/cqU4YQ9xO8Fy6AsqoJKZ8kYO9WpzGiOTJL1LCyPps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSbNUyhUp9PcS2P0tPriSgt1DkoQQSAL7bbwIDfvy2YQWtbMdXFkhT3l84wYow031buzLd9QtQPk6oQMgmpTb0KVHoSA4KNJW4pK/7eLryJGfUBHe8vVzDU8PN8dtiFJDpYiJY9Dnkvxgyt1SBTmMjKF7MAzqUFTlfDB8DLiyC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lH1X8urh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lH1X8urh"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e8586b53so4517462e87.1
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 04:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729508804; x=1730113604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RnolULg5KM7EXLrBuCEsj9PWWGa59GTkIO/LQyKKSQ4=;
        b=lH1X8urhTEScAXs2Z7qEm4PLKaWoV9chdITAVDyn40/WirReeAXUboFuaC2NfbnDfA
         JDSi5qqrnRzQUSQOBU+9awcOWPzgHGZ4Y6LUlMKshatuB7HiQMkTKRlAjTrTxAzjVgkJ
         2GJALyRGOIXl+3hcPiqFCcxoU2oC4wEuVTgTtsEAPtiAMbFS/iHeXso+wSnZljBxyL8d
         OhZ9bqyIxu9R4Enh8MJYeKD69ChERQM/0PrZoTAocUkHKTbyn6dacuFawebaEdgtluDV
         LTl5S+CaUnv2+y9uyrcFgLDTGgriED9edtvS7KHP39DVQYVgtDfEvKbOTrrmSdvVnHib
         Z1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729508804; x=1730113604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnolULg5KM7EXLrBuCEsj9PWWGa59GTkIO/LQyKKSQ4=;
        b=e5G0w2QdyblRtEv0SHxbYts42bgyaIJAKInxvkYOOSyLvnXCECrBYPr2T09MKk8i4h
         Zp8Sh9Z7L+1mAEqUaPILGgVc5K0dxyAHqKiWdUcsOEGyixc7g5Zq9YGJMvsOhZ/Db8R5
         s/9KBUTf1Kgu+qUUqsKftUYt/Se9I31MorpQ09UgSUpOG4GmjBYAQME+9He4BAs/AucM
         3qVluNa3P7RxuLusU6cSAcA1ARjTOi/rAbj+NMh4rx8VdI5EQ3VPtooYl+NCSo6QVOW5
         P29WW/3ChJXAhHT7D9tcZS9DfzR+ajbyUXRc9lOdyevJGUlLneMu5NEanP6nz+HAnuln
         dYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIWOQA/FJS/SszsF1rUmUu/BMtzNgtiLVMiw4nxE527xBXGUsLMJx71cvr5ZHn/Wnhr1o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzS8F/U3zfcfqQj03Al3Bppbvte2zQg8IOqTitpg+hFCxQx35/g
	jzq7oSCyb2SSOgWldalXRNQe2jAugTq9KPi/47V7A6nZbgj0dKF06PVRKRbnArw=
X-Google-Smtp-Source: AGHT+IGm7aR5j3IDD6zj2Is7qEysFSvXPXkRuXdOrYhmnokCl1jooJeLNZfITl/g4HX8vOeeK4W3tw==
X-Received: by 2002:a05:6512:3d8b:b0:539:e263:331c with SMTP id 2adb3069b0e04-53a1586059emr4022787e87.17.1729508803900;
        Mon, 21 Oct 2024 04:06:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2242017csm456428e87.130.2024.10.21.04.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 04:06:42 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:06:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 09/15] dt-bindings: display:
 panel-simple-lvds-dual-ports: Reference lvds-dual-ports.yaml
Message-ID: <xzvjrvp6raqeyx555x3msbdm3ugyjefv4b5qv3dwt3thnblsvf@r37cjtcicuuv>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-10-victor.liu@nxp.com>
 <3qrtknxsgxzyhwivd7d4eqqg7v6twgtczxotg7rhkdumjkl3p7@u2fso5hexiu4>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3qrtknxsgxzyhwivd7d4eqqg7v6twgtczxotg7rhkdumjkl3p7@u2fso5hexiu4>

On Mon, Oct 21, 2024 at 09:43:30AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 21, 2024 at 02:44:40PM +0800, Liu Ying wrote:
> > This schema documents LVDS panels with dual links.  lvds-dual-ports.yaml
> > documents dual-link LVDS display common properties.  Reference the ports
> > property defined in lvds-dual-ports.yaml to save lines.
> > 
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v3:
> > * New patch.  (Dmitry)
> > 
> >  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +------------------
> >  1 file changed, 1 insertion(+), 19 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > index 10ed4b57232b..e80fc7006984 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > @@ -22,6 +22,7 @@ description: |
> >    If the panel is more advanced a dedicated binding file is required.
> >  
> >  allOf:
> > +  - $ref: /schemas/display/lvds-dual-ports.yaml#
> >    - $ref: panel-common.yaml#
> 
> So dual link panels common binding does not fit here? sorry, this is
> just introducing mess and confusion.

Why? It's allOf, so it is panel-common.yaml AND lvds-dual-ports.yaml.
Where does the confusion come from?

-- 
With best wishes
Dmitry
