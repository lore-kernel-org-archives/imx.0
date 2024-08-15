Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8358044C8F
	for <imx@lists.linux.dev>; Thu, 15 Aug 2024 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723749277; cv=none; b=XGCwjx9LqEI7krJrrxIgBetgMFbTkrb4D4kAdEv3Ybz4K26Sm4lp5gwss5OSMe/G8K79139O6aR2ICb7Jn0TEeWqatszsjKyr4Gd1oOhyeupMZxh8Nabx62RvH+2/eDoyV0aZ8mp6fGL2OWQpDs+cw/Mi5IbEn2L2jMa8UA/Lts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723749277; c=relaxed/simple;
	bh=ZZ/G5UApgamR1bZhb2gVHjVkFTPdIRkoeKz9QdIpCek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIsEPxZgQAHJlp6GtYFxgjuNZJZkWYlrGeXRyInTwRitDgaYi/5rmfbl7sXG9Ls2Zxs7o6uVVubsjuFfw6c99HMiIe2p0Qxorw9vL6UnzLZn1PjpwwuieDrkA/wYeEV1kOPpXJ88mKgY82tNMIoIIEgPfagN6Ud5+gbJWdmkkyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAtKSicr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAtKSicr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb5789297eso930534a91.3
        for <imx@lists.linux.dev>; Thu, 15 Aug 2024 12:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723749276; x=1724354076; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z7WMncMgmKEb+KbsAwgAmYN6PSSe41pQsIcx1ldX02Q=;
        b=lAtKSicrWU+hroZUraURHR7ycCq/babCJCCfGrzHzVBT/QYhUU1to8faygvuDWGTxw
         udZytSDJbuyYg9gaY6TYb9d0Fvp0bqFzFiJ7+k77byiTrAQx/kJz9OBjfju7n3Dj093q
         wrLwRihSf4e8ueXnutoFTBXWJhClpU1wgtxUKcBCi/Kh/I5fqXJDNxjGEmZ18tAeOyDZ
         YBkKkgXeNpBplim502kK0WaP0xsSREMxd1C1yGH+PoVCZY8Ti+PJkex7cPeRz+m6fezh
         dbIcdQdwqoeJ3ajPpDKQwAiNAthdRYCEpprdvPYX1h0wLlkIppUvgfRwSZRMrqJOkwLi
         mzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723749276; x=1724354076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7WMncMgmKEb+KbsAwgAmYN6PSSe41pQsIcx1ldX02Q=;
        b=N09djuET8Nb+/5oSu5paFXEFweTk+qgcvcQ23ehagtvk40VYvDxKmhE6P51RBwydbq
         S6Oar9EkznSoLQh+EFutTZbhaayjRWrb0FTdQzeBPxxWHgslYhfnpXuiaeIjJOj05eAu
         QwoGH09DJrUT7g/HrYevLftM5lMx62vKcVSLQWX35oO2rRNwexNPB4wErHGVtn2PQzAV
         UkKQa0ofTzjmWRBTF/Kqch9QChwWioWm307dwycMGhhfHUjc+wFiZhda9a/LNY/vm8SR
         xw9zxj7YsZlekcXf32Jn8PD41nqNbofFxERfdUE6+dcr+9gXIgdQapaP3DtniEuvCYJn
         m6aA==
X-Forwarded-Encrypted: i=1; AJvYcCU1JZyT93/gOU7Cl7yyZh1lujef3NjzQdCP1jjsXhHLVN3hXsILo3/zplC21rBcTTnWXlvPEzZY1l2vP+3U+6u8LJtZ
X-Gm-Message-State: AOJu0YyqxwymM/LFbX/eIVzmgLAdVxkoHePpwHwPbJwHiWZ7YZidtqMC
	wn2Y3xkqQWHn2eiz+ZHSsJv9JrIkVvgH9CP5Y/11gmRFnDZ1vvts
X-Google-Smtp-Source: AGHT+IGcVeNgkntbw2cZPknkiVRzDRUVnj2hzr5w9yADfwCWLixg2lLFoSq+Drgxr9JvKyFlLM6+Dg==
X-Received: by 2002:a17:90a:8a02:b0:2c8:87e:c2d9 with SMTP id 98e67ed59e1d1-2d3e03e89dcmr771031a91.39.1723749275678;
        Thu, 15 Aug 2024 12:14:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1ffe:470a:d451:c59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7ca35fsm3968643a91.9.2024.08.15.12.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 12:14:35 -0700 (PDT)
Date: Thu, 15 Aug 2024 12:14:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 ads7846.txt to yaml
Message-ID: <Zr5TmAkd67XcyYvJ@google.com>
References: <20240815161413.4182796-1-Frank.Li@nxp.com>
 <5864cdcf-a1f2-45a6-a034-a05315402663@denx.de>
 <Zr5RwL5qRVBKbHcc@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr5RwL5qRVBKbHcc@lizhi-Precision-Tower-5810>

On Thu, Aug 15, 2024 at 03:06:40PM -0400, Frank Li wrote:
> On Thu, Aug 15, 2024 at 08:44:56PM +0200, Marek Vasut wrote:
> > On 8/15/24 6:14 PM, Frank Li wrote:
> >
> > [...]
> >
> > > +  ti,debounce-max:
> > > +    deprecated: true
> > > +    $ref: /schemas/types.yaml#/definitions/uint16
> > > +    description: Max number of additional readings per sample (u16).
> >
> > Could you drop the (u16) which is already part of the $ref'd type ?
> 
> Sorry, I forget it.
> 
> >
> > [...]
> >
> > > +  ti,x-max:
> > > +    deprecated: true
> > > +    $ref: /schemas/types.yaml#/definitions/uint16
> > > +    description: Maximum value on the X axis (u16).
> > > +
> > > +  ti,x-min:
> >
> > Is this deprecated too, the same way as x-max above is deprecated ?
> 
> I am not sure. I guest x-min and y-min is still useful becasue it may
> indicate invalidated touch. but x-max and y-max should not usefull because
> max value should be Vcc.  x-min and y-min help filter out some noise.

There are standard properties touchscreen-min-x and touchscreen-min-y
that will be used if present, so I think ti,x-min can also be marked as
deprecated.

Thanks.

-- 
Dmitry
