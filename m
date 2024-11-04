Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75CB2B9A2
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 15:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730733161; cv=none; b=W38M9sXJl3QB8GKxaov4vDpAsKHfSxFc7JhPPsspVPZ3COzN3sNEZvjgGQ1deN1OAguS2cunOmDrBMHLsJanJr7PJ6hHXfjfCxUs8UF3VleQF+pQxuyBam5zRJ39MklWoqSGjihdhZFbMfGdRMjRxdRktmfVHhAFkocqVWnmKpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730733161; c=relaxed/simple;
	bh=qkGrV1uyjS9Cqhj5IWzafZBjQzq/m8MRer83C1OFZLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZCb+zd0Qg1JaojLUzVP+thcd6Ic/9n+/7+AX0kcZTAWyuveTmhpOAmrzHoglACPjH2A57YpgTCtrL3Fmkmq24Qsf4Fm7kGmzY0oSN0nknjYj/N/x3TVO3drm05l2PjfMvppclXwtFWvLur15lXdIYIAf1utI30PnM1zZ/f+VAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zf7gu1In; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zf7gu1In"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so3826460b3a.3
        for <imx@lists.linux.dev>; Mon, 04 Nov 2024 07:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730733159; x=1731337959; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JKuo9CTAykduP5fMt3ym5ibpLBBhoEvoUSqeN+sce8=;
        b=Zf7gu1InvH5FKCDCoxs6z+CLYxR4gZmFEfI/nFFTsKoqm5IOARi/7TZhtEj2TVduwf
         9isR/7HS7OqQucq/T6PuXuS7kYA7OjI+Ctn8ilInLr9HMe5qxEGnsh0Z4GyoDI2hDb9B
         0qcBj260CwB6XMKQq2yGieA14Dm04uTMGfkT8DX8lrsGa7rYx4i4cqMXeZ4RMhpok5vE
         1CG99QsNRaYMUpM2KmxhjZ0J2+XwSWs38CtMhM8shjA9oML/k49wd2R2CoW3/4JrWP5y
         S4/9AHRPD/uTS5REPHz47N2rCGhiC26/5OyrwKDzmnWOIPMI0AlDXf0K8XigyxcjKb+O
         Zuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733159; x=1731337959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JKuo9CTAykduP5fMt3ym5ibpLBBhoEvoUSqeN+sce8=;
        b=QrcyUiuzIxORUT/VHhWgSrf7L2lEVmVR7xEU+85BuU0q2vHmGZQXoFQJg5soi1W6uH
         1mq+DtWyhoYeo2h8vHhSwB2NNKvNs5zK8JwyAn4WzZk8LJlRwGqveyLYlPVBNQX3gj7s
         XAxpC0zDKwZWoxGoaYXuDOhTN4LDBGuHJUFJBIUDtTK/uL17zlGRgk8VfxZK53jEr6hX
         Mzqgxdo/rek9kwwR1gfc6gfPCSZzo2srCTMv5uYDko9beMTk0i7kqLojrbf3DJw8bScl
         DWkz4QkWdVjAaCDfdRgAJGR84954PBvnLcI5654/ISFt8tsH3VXVN/r5HFQQRjNSWEO+
         oAQg==
X-Forwarded-Encrypted: i=1; AJvYcCUCAogRTcwb0jqC6WO4UpkgkM53tdgkWIlHVa2MAULLu1QINJS/7SvRZANBWoJ4/wARzeQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFFI6uK5CX+aczN7hSitWzSezshkNZw/ERmo4QaoB9uJ0yH3zI
	20UgE8l98LeJryj0eCaGmAiLX+x0rMvo0ATSu3bgV6AicL2XPohRYIXNAmqD0A==
X-Google-Smtp-Source: AGHT+IEGoyeuH2l+G925Avh2F986QTf6nNmEZxSYqlhaBxmXN61/88Q3SSZ9ynilZvc+TeUuYfyKeQ==
X-Received: by 2002:a05:6a20:7f81:b0:1db:dfc8:9d8f with SMTP id adf61e73a8af0-1dbdfc89d96mr3916387637.44.1730733158828;
        Mon, 04 Nov 2024 07:12:38 -0800 (PST)
Received: from thinkpad ([2409:40f4:3049:1cc7:217b:63a:40ce:2e01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452991f0sm7076953a12.13.2024.11.04.07.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:12:38 -0800 (PST)
Date: Mon, 4 Nov 2024 20:42:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Stefan Eichenberger <eichest@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <20241104151230.bxsdu4fcf6fssx4e@thinkpad>
References: <20241030103250.83640-1-eichest@gmail.com>
 <20241101193412.GA1317741@bhelgaas>
 <20241102120403.GF2260768@rocinante>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241102120403.GF2260768@rocinante>

On Sat, Nov 02, 2024 at 09:04:03PM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> [...]
> > > Without this patch, suspend/resume will fail on i.MX6QDL devices if a
> > > PCIe device is connected. Upon resuming, the kernel will hang and
> > > display an error. Here's an example of the error encountered with the
> > > ath10k driver:
> > > ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> > > Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> > [...]
> > 
> > Richard and Lucas, does this look OK to you?  Since you're listed as
> > maintainers of pci-imx6.c, I'd like to have your ack before merging
> > this.
> 
> If things look fine here, then I would like to pick it up.
> 

LGTM, feel free to pick it up.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
