Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED671531EA
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730733536; cv=none; b=MRtLwHLe76kaPteAMMQfcMOPBJL3RrahIAK6/WSp6rGSqiLH6aHyTk1zpOE/5a/u1PUXxhQ24HMRablFUc1tQxCaQZ6RQr30CVq3ky1OZnev2wx+MAMxKp7sdZdrxW269gCG1uo3XwDmxASWL9SwP7tIhZVZkr5Y8KHws4jBcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730733536; c=relaxed/simple;
	bh=M2SMFs3z5T9RjlrdCCugR9b4oeKa5QKrSBJ4lvKuhZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c32ij5q8qGKHVUEgz69FUlazVNWJdvgusFvPqKWQwh7TjqUadCRA5ZHNkIpeHbf8pIRIh/maC9EL2r6i6/0GiZyalEWfAawoE5d/h0fwzHRQGWvP70etK5Pz6//YJ35ZVGBOc4V0asZQuA4tI1WLfIuW6SM/fbPy52REr56nbig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71ec997ad06so3562064b3a.3
        for <imx@lists.linux.dev>; Mon, 04 Nov 2024 07:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733534; x=1731338334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vteU5ewralNN6plRa3U2y/lnGpPjYiCg4kQzNe8iJvk=;
        b=s5peBW+ZhcWJ8R+hhdeZPZ3rLnmV33AalJteJoJ3YLiNgkVf02rJCfsPiylHGB+grI
         /6U4n08mX1T+2ZA9/2HS4qzxO3yEcUvhnhN3va5TW14aT8a30DUO4iEVm7mmpaO/f4/9
         t19bdxMaEJS07N2VD7U7KyGt+eIdvYi2ph5LISkgTVz5piW6TVHHxYFd4gIxR+vK9KJi
         F4THz/1hhIvw3Nu4I0QyY/vAT8JqVnd6DVzP3Ax4tr/7DJ+QLQMQUpUJ7zZnsJe836HD
         1nwXDlqGhAk8adn6SkZ4DFkRtHQQZDiS6kd4jeRVC0EGPXIv+tusHqaPHV0fzsu12fYm
         c04A==
X-Forwarded-Encrypted: i=1; AJvYcCWFTrCCcDR8AHfPA1fGb1r5uoMxPUpfIZLDn9zwVH+R2reDEok7qFb8IxKqjHpKP34TRM8=@lists.linux.dev
X-Gm-Message-State: AOJu0YztLj0DHoH2lfgYKDuB9HzBV1cIJA29S6eQMzKIC6+r4B0QWnF/
	HQhmN7C2XEEFe5YKHPdjVxq7LBsQngLoZkeUVrjG2q9jXYt7sROI
X-Google-Smtp-Source: AGHT+IHdB2N8KaOSgq4Vj//H/vT+ujkhoSXOnjrxtoiNLljOwRnCUpgEJW7ULiCejD+/6PEWsk3VNQ==
X-Received: by 2002:aa7:88c6:0:b0:71d:feb7:37f4 with SMTP id d2e1a72fcca58-720ab39eca2mr27194183b3a.6.1730733534172;
        Mon, 04 Nov 2024 07:18:54 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8992sm7612222b3a.44.2024.11.04.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:18:53 -0800 (PST)
Date: Tue, 5 Nov 2024 00:18:51 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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
Message-ID: <20241104151851.GA3388469@rocinante>
References: <20241030103250.83640-1-eichest@gmail.com>
 <20241101193412.GA1317741@bhelgaas>
 <20241102120403.GF2260768@rocinante>
 <20241104151230.bxsdu4fcf6fssx4e@thinkpad>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104151230.bxsdu4fcf6fssx4e@thinkpad>

Hello,

> > [...]
> > > > Without this patch, suspend/resume will fail on i.MX6QDL devices if a
> > > > PCIe device is connected. Upon resuming, the kernel will hang and
> > > > display an error. Here's an example of the error encountered with the
> > > > ath10k driver:
> > > > ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> > > > Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> > > [...]
> > > 
> > > Richard and Lucas, does this look OK to you?  Since you're listed as
> > > maintainers of pci-imx6.c, I'd like to have your ack before merging
> > > this.
> > 
> > If things look fine here, then I would like to pick it up.
> > 
> 
> LGTM, feel free to pick it up.

Sounds good!  Thank you!

	Krzysztof
