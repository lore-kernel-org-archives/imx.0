Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517B6AB8
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730549047; cv=none; b=X7mBkT3yvZdW4Q6ZcQXVt6HG3dYWXReLRPUd0SIeKZP2GFfS75jPNUiXCKH20U9swXitOZYEZ/MR7sSGC1RSu9FXHBTZv6/k0wSjn9x8/s347Y1sBG6QkwEsKilBucedA5GANKC/jUD1R247yMT76zCxzMotbgQnYoLdAF5yDIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730549047; c=relaxed/simple;
	bh=EQ8XAxpuqUA8Ez0JQdFpsCuHCg9R67pnEbTFpmmFa9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7QNYPThuX6QzxnIovaPHt1gOrSXFfySrb/09bBL8ZslKkzujRJ6oGYV+CqbUrNcF8uTFX8KzftVyDrvKF6rvkkwsA54Pc1DGLkDxzw+NCX3QsCn7GYhioZ1hyupkQi6m0hE1zP8u/ymVchOZO4n/BK6LRJoHUcWVCHoZzNYLeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e681bc315so1970161b3a.0
        for <imx@lists.linux.dev>; Sat, 02 Nov 2024 05:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730549046; x=1731153846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF6tF/ronwtGaLPzR1Y+1eJC2THWzh90BDnwiyxyUlA=;
        b=XVtWc7SEo7k+ZzS7MWtjgbUgRb4lT1N1dFF8fwPd8DCBf48InX4JlrM4Mp1RahvVkz
         HzCvnIe5/h2Eo6hPDeffRInRQXu6K9FbMYH9nen0jWfoltR6OzRKAMn0NNXuIUWzQ40E
         PTdwojE4i/b3FsPedHeIvDVynGWqsNm0XuuCMBiCM8Mvl5r61a/Z41F5E7UQ588olnEV
         zQ1hcP+fstwPNiuv0+oFBq/wCjOz8lErgLCbdY9Hsfa+LtVBd49Ia7O6XfrU18hBo8k1
         75a6N/WsRuJrZkLFz0wAmH+V/1mBkyMmVdDG5fFpkdyZTnLSLqNvpLSUtL6bJRGsDvYq
         eHJA==
X-Forwarded-Encrypted: i=1; AJvYcCVXkVOZNaoKdC3hdcmO86rGzcLLTDJMKwdevJy9O80Mx/VPvY8k1KvpUAXelT5ER4S71EA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVI9jhlv1pzN+yXwGVAP4iTX5FcqHgJdwJjlOdbBcao3cPqP0B
	+NjD/xWTmqdkDj2HkgG8hqmFayJHpnYp5HPv2h48J2eCev/fTgM1
X-Google-Smtp-Source: AGHT+IH3QBupALD0Xsyr4GM4EVgvwE8anNNXOVnVeSjs243gIoBttfPnD+0+H2RFRYw7KFhojBYygw==
X-Received: by 2002:a05:6a00:6386:b0:71e:427e:e679 with SMTP id d2e1a72fcca58-720c965da56mr8996435b3a.4.1730549045701;
        Sat, 02 Nov 2024 05:04:05 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ef741sm4062238b3a.82.2024.11.02.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 05:04:05 -0700 (PDT)
Date: Sat, 2 Nov 2024 21:04:03 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Stefan Eichenberger <eichest@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <20241102120403.GF2260768@rocinante>
References: <20241030103250.83640-1-eichest@gmail.com>
 <20241101193412.GA1317741@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101193412.GA1317741@bhelgaas>

Hello,

[...]
> > Without this patch, suspend/resume will fail on i.MX6QDL devices if a
> > PCIe device is connected. Upon resuming, the kernel will hang and
> > display an error. Here's an example of the error encountered with the
> > ath10k driver:
> > ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> > Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> [...]
> 
> Richard and Lucas, does this look OK to you?  Since you're listed as
> maintainers of pci-imx6.c, I'd like to have your ack before merging
> this.

If things look fine here, then I would like to pick it up.

	Krzysztof
