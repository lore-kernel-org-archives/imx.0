Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9B92EA172
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 17:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631801; cv=none; b=et+n6r1LY/nT+kuqYOsPhLZ+B86028T2Ys4rLn87Z3f7GPjx7+SpidhG6ZXm9Bltru9M3kfRZ6MPvqOaXn3XdwoLPjAlYaiuDtkvVzGQoYfdr6EOcBc9zfqUWyR4bn/08ZjHedl53R8oYruTtAE0K8u99DAFwJKDFzleadiCJvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631801; c=relaxed/simple;
	bh=ieDfxlzG2E3LaTCNMrozmh423Pobxbf4YDtO1gx/bAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vn9GSe67WySJkN2pAEoMrItT04Rxne4IKIWynoCMNzP7Ms/xQ3auO3lZRH4WYeRHYy3i33vRh2YfZ/OZdKbKxIuuYTIYDyMu/JsDyoCii/qAiXMyoDsc7gINKASlq3rBpRZd2Y1r5y++z/nxDYLO46R8H1yB+TCkletJSZABOnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLLoQVy4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLLoQVy4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so23033945e9.2
        for <imx@lists.linux.dev>; Fri, 27 Mar 2026 10:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774631798; x=1775236598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vV6E9yjY+PcJxkfGX/VZyyMBIRVFPjQlBGDGet9H4gE=;
        b=KLLoQVy4hAjiJV6eSHyVLXaMDdhIt3irKGIvdqlqvOd9NIE7ANJIMnakC3N+pDmawr
         /2GxYTQLkqgPrb5PKPtOhO6stmH/WDHObxrWS6tGLVXfvsIxgCRlM1THlA+IsfZsiGiE
         oHrlQWELX+msWYGgLNYg/lN1FRiWB4DnLjdMP1VvZewNnsqNGOlaEL8MeTmDSG6HW9DI
         to5tEJarnmLNKzhv+0lHwibHa6EzwfE3TeQKF7fmLsJyLjAAqaRT9qQOg9dVTajgPsn6
         oQVX97SARtDgRuAKLvrYUPmhiE288AP4tSI+Ju5gshGPlwCrTMQF+Bw4ZJ47jhJakhj1
         mpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631798; x=1775236598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vV6E9yjY+PcJxkfGX/VZyyMBIRVFPjQlBGDGet9H4gE=;
        b=rXZCUICmERd4daxXZXeD4f1YQbYAqfz0kzF8nUvgSCaqDML9jUYSkh5CIq+ym+GSyb
         E+yMDGUXjiWYPFn6KGmKOQRQr69LTctqfYda558Ghp3LFQL/QUdqORI2/WEjsK0tYDR7
         Sm05OhR58kL9ckvLxDVxQsSWjA4CBtPI6a+fcmNZUP9zpgRgsGw9XbQRpClioxfSKxXl
         sW3cFIr6GgS0owKF9OyYByRfcaua+mPXWtBQkxKvr86S9/FFbFj5as1I2HeCDzfrW/LZ
         vo5C/h1sdif2jrBMhyJCtvtfVkIEF+SCUnZyaRwqdhZAHQt0vKxyIkv8ZU48o16PLTUS
         Gn1g==
X-Forwarded-Encrypted: i=1; AJvYcCWPm2BAsOnA8/zSB2HiGu0/meVN1rrEaMQvp/OU8WanCKXqAOpnXfTLIfTHkeBWjrDhrgY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPt769gMLqYOqG+HWeFDsgACLNyPm4RBITuCUdMga5HYi/pBqm
	al4YwcILvtrV9sh2ATWtViTW56lO9HapsytathoakTqJTyvb2clDEZtH
X-Gm-Gg: ATEYQzw0MKItUO+DQLqjItfJo250nuHLfxAow8XIbVRRjaRxFvY1IIwIX7IWkzy9jVJ
	OjPa7wrg1SVTu8EE3Tc9H6VOogCUV7uNmD9oUQIjJmQyPCZguT8Po72Lne+NPdkBP/AXUn2NwQj
	ybWBEnRIokyokuBbPUO7CXlaG6a1Fkq+KXGWkeTHuQpxFzL6T7pBmaiz4jPFstmWW3ynscXgoMl
	v/CiBT4EG8KSt8mcdGpxrj+RxPsmgwfgIm1DJ15FaIdrn3NO9rolQcpcY17lPhGQX70SQCt1jMi
	U8VUHyhETJxS4SPpL/JFEtZ9Kv0ya54SNJ3kPK76Dqqim03AISJEfEK5H1aTe6WTW7cMyCQOBWV
	xCISMMii8oOzWT4/TKmP5CEWkWqwgUF++Et5Zes8khdYHC+VPCEGMcCbS19+LIeGejbTJWeSNku
	yAXbGatJMnIL6ObjWMFnf1PE2gJE1AtgKY0I9uxI+gS2cFqo1mD5t5LU1tB9dCoSRG886zsi5X6
	wJaIIVIahZbJ3mNa7d0PeD+jO8m2MVQC6yE7+/wJjY=
X-Received: by 2002:a05:600d:1c:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-48727ec7681mr45535245e9.21.1774631798048;
        Fri, 27 Mar 2026 10:16:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9e85fsm34322455e9.1.2026.03.27.10.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:16:36 -0700 (PDT)
Date: Fri, 27 Mar 2026 18:16:34 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <aca7ckVY9ure8Cwe@Lord-Beerus.station>
References: <20260327163243.17334-1-stefano.r@variscite.com>
 <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>

Hi Frank,

On Fri, Mar 27, 2026 at 12:51:25PM -0400, Frank Li wrote:
> On Fri, Mar 27, 2026 at 05:32:43PM +0100, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > RGB_SEL controls the routing of some carrier board lines on the Sonata
> > board. The two PCA6408 GPIO expanders depend on that path being enabled,
> > so describe the selector as a fixed regulator and use it as their
> > vcc-supply.
> 
> Does below resolve your problem?
>  https://lore.kernel.org/imx/20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com/
> 
> So needn't hack select as regualtor
> 

Thanks for pointing me your patch, interesting improvement!

Actually, in this case RGB_SEL is not meant to model a selectable mux
on the Sonata carrier.
On this board it must stay asserted permanently, otherwise the
downstream path to the two PCA6408 expanders is not accessible.

Modeling it as a mux might be confusing for users of the DART-MX91, as
as it would suggest that the routing is configurable, while on this
board it is actually fixed.

Best Regards,
Stefano
