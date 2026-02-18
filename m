Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66E131D371
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771432680; cv=none; b=OVcEjeWIFVe1+i6kO7myGJc9kCronJx9NQuNRDtdJZUpfmnlOveYosS3uUQPlOGlTdi9/2nX6r1m1RFw6Hg6+MIrorg9UDh2pBlqZdOlDbmJx12WaLMdmwvnAVnNdb6WmEvDW2wKQyMjzIjfRSon/AITbVDc3zfS/Y0gmBBI+fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771432680; c=relaxed/simple;
	bh=UFp07q0ioASXzFZZUzkNI/LzekItwem0tA37Xcrofyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKyoLaMJoaJ8Nclsa7A9OsTAFnRvmne5RT9XHwvKPqJ5+IzMjpw89s41REBMb8pWHgHe6QaIHOanXbWGnskfKOxQ3jFjqW6n0EywlSfRjpv7/8EIG35H6X7JBXzELmuUAbfuRmIrH0UGSeR7Xz6NWjPWGuZhh3d3pRUBSlXd7v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fenscuol; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fenscuol"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so33198f8f.0
        for <imx@lists.linux.dev>; Wed, 18 Feb 2026 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771432677; x=1772037477; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=syJvSBYWmoc2bQ+suPVmqNX1ElaxT5/1N2KtMvR5unw=;
        b=FenscuoljkZNKNr5Jf87WNLWDI9TeAQimdNSl/eWg/3mryaWfECHj/WflMJSDP+Rr6
         YZiRoUMRy4x/QFQn3TrU8a0kEP4Idl2d4yERmzDVYlZDzTwtbUxkNz3Zq4oit2Mijfxk
         9otwvU9sN8nAkKtWOW3h1S9gcxF87lACcsCngb8MROjV6VtNYulcDJ2RyedFWK4Uuhc/
         OKKHeewBRWBuYcDKAaJMYtLKZ/adTwSY85nuGSlTBeK7JcsqLHfudnJ562IH9SAO83hX
         5EQAByJkF+sp+0JOariUz+zYOvYKn7QxNmp/B+Wh/YzCLDg+l6Wx+mzsIQjgAcOhqh1m
         9wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771432677; x=1772037477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syJvSBYWmoc2bQ+suPVmqNX1ElaxT5/1N2KtMvR5unw=;
        b=JpgNCoQp4U0XZ4C6UtSjJUZhZN1QolZGYicNEpl/XJkBw2/c2OVw5RZSqFLN+N3sCg
         ZnNP5NL6pGJoGdKjYnvdnacVQS6z3HL/o1lJkUT3ak/F2qZwB5jEvYpWidwztvl9pL+P
         UPsZc4dEpYGq7XbgoUMV6tp2HwsdT/LSxNhMXvF++pHt89A6eJLf0QhSWboOIVKwWZ7I
         sCZwor7ZDA8n/CYsjJQaTvjYRwcH1XSL+P3FkKneV1m2hCMDJ5XQc9C7jBeUYWk32E9l
         pnRThwpcN/wW8mhs7fGGi3qz1z9gf1AehU3wb+o9Rr6w/nag7RTJDgANdEuFeIKZKBaV
         rtHw==
X-Forwarded-Encrypted: i=1; AJvYcCXjHhYKnwsPW/GjNv0l4YCifSHT55jFTj00BImcLdMRbzC02n8VW6gl8jQf/nTzcHw7v9o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPs1Q44f8oLs17gNs7XM6yxWyn0hn1ctnuX/L1EKHEDpMEaRUc
	O/LAflBXNTWy6QL2XS67NoK8/ICfVcAi4iFFxe0I9xpvddblbo44YWAL
X-Gm-Gg: AZuq6aJq+7RErb50DMs2lv/iJlULvolR9xh26GbKMuiSThcZcLIlByfFtpDamkn0S/z
	amQjPKFaHy8conYajYz7dJ8bvQlTrDR/3idg1ek5FvGKw6Zfj43stBHW7n4SdprzMQiigTLS5Ne
	L5vQ2ojqLmthoYPXjWDOq1iXjV1NYyBiiel+nMsDk4O3EMec2Yl4+d4IHpMSmO4t6ZDm5jb6tc3
	8swxRT/wU99ILlgCjnvVeARpCOg8jg1yxHk8isIfWuQkI5e+ThYXIOo6aDGqymGEi/jeln7B7yr
	pOwuVJJnniB8MOP3DImmaSiPE/gOV/hM245We1T4tgh4aVUMpCWWDIQMPRFt1csviBCwjfRNPXx
	505dTW16iZYkUNsKSgp64I/ZQvRyr59iBvqDU2lyOCgmdpvCgw69JJBwKyeeOn5NJD+IUYZ7Wef
	O0uIfKMIFKjIcMtOJN+Rg75DaAh4m4z5/VDq8W
X-Received: by 2002:a05:6000:26cf:b0:435:95dc:b8ca with SMTP id ffacd0b85a97d-43958e4c9a0mr4169076f8f.40.1771432676926;
        Wed, 18 Feb 2026 08:37:56 -0800 (PST)
Received: from eichest-laptop ([178.197.206.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm43928122f8f.32.2026.02.18.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 08:37:56 -0800 (PST)
Date: Wed, 18 Feb 2026 17:37:54 +0100
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
Message-ID: <aZXq4gn4xhInQQlq@eichest-laptop>
References: <20260218150940.131354-1-eichest@gmail.com>
 <20260218150940.131354-3-eichest@gmail.com>
 <aZXoTGK_v3L4pc-E@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZXoTGK_v3L4pc-E@lizhi-Precision-Tower-5810>

Hi Frank,

On Wed, Feb 18, 2026 at 11:26:52AM -0500, Frank Li wrote:
> On Wed, Feb 18, 2026 at 04:08:50PM +0100, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > When reading from the I2DR register, right after releasing the bus by
> > clearing MSTA and MTX, the I2C controller might still generate an
> > additional clock cycle which can cause devices to misbehave. Ensure to
> 
> Do you means SCL have additional toggle? You capture waveform?
> 

Yes exactly. We were able to capture the waveform when the issue
happens. It doesn't always happen though, it depends on how much time
passes between clearing MSTA and MTX and reading from I2DR.

If you want to see the waveform, I uploaded it to our server:
https://share.toradex.com/dwnhcrl6b9toib6
You can see the additional clock at the right end, after "0x17 + NAK".

Regards,
Stefan
