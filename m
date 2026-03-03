Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2AE37DE9E
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529253; cv=none; b=sBCOoDhZ4dKefZZhDZ9ets0ZXmfryStK0CcB2Dnxpgy4eFrSNAbhtRRD3iurxfERK8JerNvWRCjW4AuxhWK3XeL+S+TzUZ3zVq0ZW13Cthf/lKw+NFzmwVPDxt4TVUqzOnlFiPwMbyMAlxPPS+kAsvgfabqUTJdjsKOzl8OeYGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529253; c=relaxed/simple;
	bh=5l2Kz22xEk2Atptg+7LjAz1lULYa/VgXF4E1315Awb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNZ+KgGkwJ/Ug2mmhIPCCIdvvlBvcRNB+H4MzAdCr+c4cNVMAOHSaNfTvRoDpbNqDl49yqUD/aIShj9XFkjaY47jGm6O32Axh7DUWZC/WgqyxDMzIWBVanrLycD4VKIq6dpO9i/KcJlqlBGAc1R3mTiPYIrN8aGwRsEhcJ5Urg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcyZ1KRt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcyZ1KRt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso47386555e9.3
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 01:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529251; x=1773134051; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfdnRKMwt4rIrADe9QK97cFlPrIqJK1YbAhHvdHHa88=;
        b=lcyZ1KRtL7mv7H6xMzSPbzev1T4ldxmof4mr9dJVaS3U4CdJgLCBJbFh8Gd/NXmo9d
         b14h2ZYmM4HsvC6bRdspEbUanPf8VMDxBYVIoh1ssmQdGqLtmkEpYIeBiH/NacZgj3Tr
         LIYm6ssPm9+naCpvtBK1r34mmtXpkAh16CQLBkdv5qg00+EOWozM1DEbEUseQnp3r2Y4
         sQTceyOf9+xGOmTOao7yUosTbG2tD0YhRXJIxeke3taohaDl2mqUZ9UO3ESAkrfF3oNN
         4l/uCYSPLA1AqeU+pyLEoa3FpxDJP7KzlyHhd1fb4rkfwBbWrm8EL9Lmdw/IgKTaRZ0Q
         f3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529251; x=1773134051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfdnRKMwt4rIrADe9QK97cFlPrIqJK1YbAhHvdHHa88=;
        b=C00l+6rJzhCGp7zfVuexeTTLXa+gTu8XM3YDiNsP3cdI+UbApC8qIysilM2cIOZZta
         EFV8/pSF9MBmWpvdmNX8Km+LCmzi9NhmVE9EeYhALYzwjIKGkQjFbhSYl6RvxRzAQz1H
         ItQgeHXnRn51AE49zKRIVzCxhB65l7gI9pKft84xi0EpS8avYuIVf9V0xmfPsK6y7RFo
         0sN7x537epQBOxEx5dE/UFuKQzvvQHiwkMJB8ESqi89tHskknF6oroocZ+lZzxIrdfjc
         R4zdngclvcUYbnmd8ckjHn8JPTCIvtDRd6fIiAcxOIvR1d/q540iJtvv8mx43WzdAjQ6
         N7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEucDrnfEbSNp/7s0PGRNJkYrsjwDDgfhzEnJEzeweHP83eEnTUWM59+HuK+TwD1GtsjE=@lists.linux.dev
X-Gm-Message-State: AOJu0YygN5bLbL5K1bQ6VWqZYgZqNXS0Qbl0IUeWl+VYbLWlTADKd/L6
	3nSTrnqi4nwKJ3z6Pvls31E2XbqzUqZeGrECU/8PSkwRSHUSbCZ6YQbG
X-Gm-Gg: ATEYQzzDeYqNt8qS/x2d4f0be1Q1SnNo8h3KPXMdUv/buwy9BSZU+gogT4h/TXwwama
	lXu/5yilOe4r0g3UkoMwnY4aBtlqFbaRee3ng3MCLAIQJvCgotQP84P0v6sxzzOrGMZu1D+buxY
	uHBDRX+F7bb+/dmzst3AlK/PdkeqWPfyrPz+0I8wLPnP8PL+wQxsAeLIUPF+fO8wZY6DhC0jg58
	dFHvDBbu+EaYn5GHRiSoEbi2Ywgp5LU4kHWkhVsoe8OD+eYL6f8eUi/s2s7rPcyowymxHJQIR4B
	TUdrvZxlqTmKYWo2ZuaoqYuy2mXuHENjS1OEsVTFnrrwlBMZtQMcdeP+86L4ASk2HrwznLgL+jS
	DmGLy6EYki7osfGo+kwxH+V2ElpmY0i5ZMvCjlE1NkGM8DuGFIcTg0nGPqrrxe+3gflSPCce0br
	/bp9LGNB4D00ur+dh0zCgmCys=
X-Received: by 2002:a05:600c:a16:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-483c9bfb2f2mr273658985e9.19.1772529250689;
        Tue, 03 Mar 2026 01:14:10 -0800 (PST)
Received: from eichest-laptop ([77.109.188.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7030b9sm376259165e9.4.2026.03.03.01.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:14:10 -0800 (PST)
Date: Tue, 3 Mar 2026 10:14:08 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: imx: ensure no clock is generated after last
 read
Message-ID: <aaamYByn9dZEIBWb@eichest-laptop>
References: <20260218150940.131354-1-eichest@gmail.com>
 <20260218150940.131354-3-eichest@gmail.com>
 <aZXoTGK_v3L4pc-E@lizhi-Precision-Tower-5810>
 <aZXq4gn4xhInQQlq@eichest-laptop>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZXq4gn4xhInQQlq@eichest-laptop>

Hi Frank,

On Wed, Feb 18, 2026 at 05:37:54PM +0100, Stefan Eichenberger wrote:
> Hi Frank,
> 
> On Wed, Feb 18, 2026 at 11:26:52AM -0500, Frank Li wrote:
> > On Wed, Feb 18, 2026 at 04:08:50PM +0100, Stefan Eichenberger wrote:
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > >
> > > When reading from the I2DR register, right after releasing the bus by
> > > clearing MSTA and MTX, the I2C controller might still generate an
> > > additional clock cycle which can cause devices to misbehave. Ensure to
> > 
> > Do you means SCL have additional toggle? You capture waveform?
> > 
> 
> Yes exactly. We were able to capture the waveform when the issue
> happens. It doesn't always happen though, it depends on how much time
> passes between clearing MSTA and MTX and reading from I2DR.
> 
> If you want to see the waveform, I uploaded it to our server:
> https://share.toradex.com/dwnhcrl6b9toib6
> You can see the additional clock at the right end, after "0x17 + NAK".

Have you had a chance to look at the waveform? Do you have any concerns
about the proposed solution?

Best regards,
Stefan
