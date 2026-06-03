Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FFD383990
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477942; cv=none; b=RIi/cWTQzUN9Yc1O0ocoNhe9kuLdUh6PV4caH/lgVSrLPmHj623bjWZRSCFgGPSH7nENbKc89lv0RjlehBySOGuzWeT1OkUWp4wZMm6OG/j0DnEY88A5JoiD/NYAtVPqppE495unqCC11VoZbYNLO1UANVnnrdgQDD8GaGG9UUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477942; c=relaxed/simple;
	bh=3+cgJYxtN/cU3yRwvtnpc5EaqECC20THPXie3jHikQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0FR6TEHb9DVXFBVlFoBiLqA22w8XQ9JMW3j/Pr3kyYKaDskEH0WF8A5wJtSbt8ZZzNuJMwnrkgA37ncridWuAt29p7YhjH/qIn6zqR/B6H9+HGyK826RF4gPHwHwjDMMih71f8G47O/hVDCNkgWnByd5o5O550Ae94j30U42V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgIRfIn6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgIRfIn6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4908b92904fso71264875e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780477939; x=1781082739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hkz0Eq0uDpMi6XdoQlTFpPc33Fvk2t3F5VcoWVOi/A=;
        b=EgIRfIn6Q3+TFgH9jYnAsl0nC8+lkoiyReC+CJMBmSZPbUc/4O5COSZf8Ntr5R0VpM
         E3/fvI7TJ5jomQvXMhNWWPpz4dXN0WAqxqTMditlhI15UDDSbHKcKJqSJAFDlZBKfrvO
         Q+v6aaEko+1IcSVmwPMuizBL4bCGUup4qKeDZNhcpOKfVV02/S19+q6UJeMKRSEPf5vq
         M0kJ8DJVa3Qnjfi61mv/2E5+8B2+v1mMJSoLjNS3O08vSRCJwgfizzysly8q/hp7S15j
         s9xiApTSWJhCb/34KUp4oUkJKgY4vtBEnZI/Fpj4UAHSuJ0/k6rZ4Xh0CX2lKQ7c1e36
         Xbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477939; x=1781082739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Hkz0Eq0uDpMi6XdoQlTFpPc33Fvk2t3F5VcoWVOi/A=;
        b=ICebyDIoUY9z4xeS/0nkbYucT3l9EyTXPXQ4Dp+pfHx/415ALHmtfP9ZbIhAl8lond
         tmE/2u7g+YPoZMqrVVmGgKaRJKtrH8l05YaEjO4rYuG9z4ewF4u84isDqR6of9Gsz7aI
         4mhqRC2OGJ0MNnXUSSA4l4qGJHhPJEyVyepntKazcKnmIJxrPBecz4FBNG7on8e6J+cK
         nTehHnahsmnf0RWKOzNP6ktrHpq9KVbGkg7sRg3Kzldl/WlxGw/fn0nX+Ccd93hXQ186
         5j8lDEDZBwiCiRy06wRqZVdacmJ5KNd2JvrBvSW7muRWwBSUTlI+0ffQiYs4xoS3f+CO
         d5BQ==
X-Forwarded-Encrypted: i=1; AFNElJ8owdpyznkyTKQfHaqLDRzjjsVdx0YDkGL1+jTO19Qi5JHDo/dyecwRmGiE8+LAc/f8EVk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWtF+etyTsGW0pNiNecDGKJ1PBY2lhwFcNYbkidknBvTqfApVt
	3y8B4M+f5su4/Z13eIOvtmWpkRWEpLW4sU6PG2OJRzFbMwv1IWx/rDWP
X-Gm-Gg: Acq92OFL0LYZSJ+DWKZkv4cym01KRpwAxcyQ3K/E9ZesnBGFUCawuIAjMU65ctFNM68
	6kQxXqyB5pdJFgug+//hwZRqxhnrkIcZr7Q1A/KJ+xPdKpVTN6BxjEBZcphoaoqeFfOtTkxPm11
	aV1sE5kU0oEMmxHm8BrsR4AKIyWRQjsZkgULTrRsEaGW1CLB6mwL/Ag3sMHCC9/xx4OKhwmReUu
	xIpQmscP0wsvQKqnAb9J28V8dmHPfcQBu7QDGhm/pU10jQxOe54vXg7CkHqAd5HKLXDb+HgU5sH
	e3Wr3E3fe1C91ZlJTkVF5Q8vgxzmVzIe1BhD3gVdLIBDDYb8ZyNoqXqnyyhnbHLmbehcPdI5aUb
	vHOcOfkmDJNVNY/7c7fQ+pg39P+AZSOYlHW1zqz3tTBn5lmvGqGreVja7Ykmdp6X+TAtvrhoR+f
	ZLEFb1DjcE13QfCH/XXt08ch+Zt0nhvNoUvhe7NbXCrU1FOGAxYnKk6YL/F4NcnW6OvLrkPvfGu
	UCdBy1XIlqknDgi2AWlZ3b9x5n9OE2L7qoaiFVZVJEY1RD8UiBiPYxNYynZth7/HA==
X-Received: by 2002:a05:600c:4510:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490b60f001amr37402095e9.24.1780477939047;
        Wed, 03 Jun 2026 02:12:19 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7c6b966sm25579115e9.2.2026.06.03.02.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:12:18 -0700 (PDT)
Date: Wed, 3 Jun 2026 11:12:16 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-som-symphony: fix RGB_SEL
 handling
Message-ID: <ah_v8E78aV3n1TZx@Lord-Beerus.station>
References: <20260529134850.22196-1-stefano.r@variscite.com>
 <ah3uuIeZ4Z6BMwfi@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah3uuIeZ4Z6BMwfi@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jun 01, 2026 at 04:42:32PM -0400, Frank Li wrote:
> On Fri, May 29, 2026 at 03:48:50PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > RGB_SEL is a board-level signal driven by the PCAL6408 GPIO expander on
> > the Symphony carrier board.
> >
> > The signal needs to be driven high on the i.MX91 variant to keep the
> > board in the expected display configuration. Move the handling of this
> > line from a fixed regulator tied to the PCAL6408 supply to a GPIO hog on
> > the correct GPIO expander.
> 
> Look like this can't resolve your problem.  gpio driver may probe later
> than display, so gpio-hog may not set correct when display setup.
> 
> Frank
> >

thanks for looking at this.

The main issue I am trying to fix here is that the current upstream DT
describes RGB_SEL on the wrong GPIO expander.

The existing DT drives RGB_SEL from pca9534 GPIO 7 and also uses it as a
fake supply for the pca6408. That is not correct for this board. RGB_SEL
is actually connected to pca6408 GPIO 7, so the current description does
not drive the intended line at all.

With this change, RGB_SEL is driven by the correct GPIO controller and
this fixes the hardware configuration issue I am seeing on the i.MX91
Symphpony board, making it working now as expected.

Best Regards,
Stefano
