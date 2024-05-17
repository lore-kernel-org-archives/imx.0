Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFB9224D6
	for <imx@lists.linux.dev>; Fri, 17 May 2024 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715940227; cv=none; b=ruW8o0InD+efC3+QtXTKg2w/dsVXqSzt7Of+RlFqGpx40UDAxZB3h/vWizpj7FoWjC2nDa5pVqn8bK0XW637XElqUw0yEMAazZO2QbcbPjIGUXLrg1UhH9i5ua3L1ZLGCbNZe3vSUc8HYqCi5TbI6NTtMJyNI2JHohHSgco88Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715940227; c=relaxed/simple;
	bh=KTvHkD4t7m7AeWaw3jJ8wF+rE0nZ8h8GT4S/NuIQso0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4xQuVaqQoH1f3DHkHsrzAWLWKa/ryGZKLwpCEaY6BzWzoX4s4Cibw9EOiNwr3oi/WXm1sfh5avXeAjylsGAHhFLASS5D/HeFp7SpygSa8aFIjlpxIsMmDneqEKaG4jq9DagjjXUivQrbE2paXMgmTl9L5jQFlP3gjJ2OmSsS3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f447976de7so1051001b3a.1
        for <imx@lists.linux.dev>; Fri, 17 May 2024 03:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715940225; x=1716545025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwJnP0jzgbtYCYE/TGqvXm+jWtQ0BeP318A4PrkoVEo=;
        b=RGL9yrX888XjpVuZtyKMxn02r9fKEfMSOoipxbDOnEUBL2RPi9oIF5aEWnZUfHL3sq
         Tz/SYw7TPmtltuA6rbmTmxYSlfpNKla0G40vrlUG1YbpvuUaOfzxGwWVwXpN1+f8TPi0
         CkjNTzgN366dKUGmE4xEOeo7mlWx05C1xKeQqUqZNA/6yC6z+qfP1BgUOgJNNgr0hD1s
         VLIt3bT8YcHCU183bk9bxWAO8Yz8AIr6Aqd/N+4+yPBIzDD42StWjSWbZET7fVD/rfbh
         ILjMfHDuvZ/9zKD9Hhi7THguXHt4fy2OpZ83xJdGy6WY2qCkQdcTlL99P2YCmWVWBXZK
         1TlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvaT+0edXO2JLuZMCfeFa5Os58TpZj4HhfiZhQXqkYYJbTDDuCW3b8990sjNnEUZmecVPSiScvfrBT1V/7SymlDW4z
X-Gm-Message-State: AOJu0YwyWWP9mAtO0Hgtz7bzjvUY2Rc8XIcDT30z4eKelTBeOHd5MBIy
	jAl/4wmUnQQhi5/o9BZSsOF5GGLD2wYoQ6COU3Dn0QQIYfStBmvh
X-Google-Smtp-Source: AGHT+IFEnocnIxpqMKzPKfYWajwvbdGfdO0iddkAZ29hJ3xisxn+ehmDKHZLmk1oxDsoXb4bJU4PjA==
X-Received: by 2002:a05:6a20:431a:b0:1af:6911:ddf3 with SMTP id adf61e73a8af0-1afde0af0bbmr24122517637.7.1715940225424;
        Fri, 17 May 2024 03:03:45 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f676723725sm4657372b3a.78.2024.05.17.03.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 03:03:44 -0700 (PDT)
Date: Fri, 17 May 2024 19:03:42 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: manivannan.sadhasivam@linaro.org, imx@lists.linux.dev, arnd@arndb.de,
	cassel@kernel.org, gregkh@linuxfoundation.org, kishon@kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 1/1] misc: pci_endpoint_test: Refactor
 dma_set_mask_and_coherent() logic
Message-ID: <20240517100342.GA202520@rocinante>
References: <20240502195903.3191049-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502195903.3191049-1-Frank.Li@nxp.com>

Hello,

> dma_set_mask_and_coherent() should never fail when the mask is >= 32bit,
> unless the architecture has no DMA support. So no need check for the error
> and also no need to set dma_set_mask_and_coherent(32) as a fallback.
> 
> Even if dma_set_mask_and_coherent(48) fails due to the lack of DMA support
> (theoretically), then dma_set_mask_and_coherent(32) will also fail for the
> same reason. So the fallback doesn't make sense.
> 
> Due to the above reasons, let's simplify the code by setting the streaming
> and coherent DMA mask to 48 bits.

Applied to misc, thank you!

[1/1] misc: pci_endpoint_test: Refactor dma_set_mask_and_coherent() logic
      https://git.kernel.org/pci/pci/c/27ea748a3abd

	Krzysztof
