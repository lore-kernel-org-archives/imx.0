Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF641B14FE
	for <imx@lists.linux.dev>; Thu, 20 Jun 2024 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718901038; cv=none; b=FDyVIj+8/tNp/nqPkwVbU0iQ5GEZZIVOhcu0fojPltHIh2+X7wcVls+87WVwrQBr2dsRXQ1IFRvDFC8w1E1xY6FIkAmWmQdMI5CQb3WYAkTSDXZSQTkuJQ68Mlffstdh4MYRfEDj7lbDGevhgzmqcQ4LZOFsA7A4Q6XG/6TvNDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718901038; c=relaxed/simple;
	bh=Z7wFmenBZTlsebiBGRtqRQxklYko51QR4XutUm2q4MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofIopdqU7WxeVo/3QHanHXtCpr1THo4OWwvLKemRbiP+w8FiARUuTlNs4as0GqejTzpYUjj2Kq6nVZIESMR6FqUfKgadramxHlFqae28xX+xaeRDzZy7kH91358eeAcNueLOWPZHZrHNDB2iLk7+4kf6jpUFDjCLKDN7melFcqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwTQEZow; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwTQEZow"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7062c11d0d1so1035737b3a.1
        for <imx@lists.linux.dev>; Thu, 20 Jun 2024 09:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718901036; x=1719505836; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsyYBnBD4C+9cyxgt//5+wZQ+goYBnLsU/vC89c+kzo=;
        b=kwTQEZow9DBHYhVcOiWV5dqftzJaXuLOi6Ioin8R0/OvG3BoZ9td5BUfU9WyT/VkPn
         daeNPbU+YE1LqJuBi42hfhkvEwcICzu6H552IXpyDramPYkwGwNrSQ/SzHtIVEDqxZ6t
         AuATVVg9NJxKN3G+0mcYm9NMXKqpPru2cmAjiHeE42FyyNw2uMzGD8jMt1EJBvocWhdH
         nxrpDj54EqG+46vWPnM8+XQ4h7n0gs0TcGX4tUzX42v+D4cl/0OKALkIQsusNJ7F5R3X
         6pf2Y8mUgvf+Y3g5ptGw9kwolKro1MGaHYtK08gd1Xl8GvXS7yQ0TAIwjPEUiI5rps+2
         2QoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718901036; x=1719505836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsyYBnBD4C+9cyxgt//5+wZQ+goYBnLsU/vC89c+kzo=;
        b=DnedQBFvdiSBfxOfzA+Lnx3MOa47BgBfw0wvxNY6uFuLGGhOMtKPPpe4bjuUyzyybN
         JCSBuNxu53HUM9ke4RBCg3Z42oMkZnPfI8Bh2L6ZZqCXSZgAszsWoczdREP50wJGvLsg
         7xYg4toNC5TkK8hI9O0xs1sj7vPaRorXNROiuBOxzbXFYfOYv+d6INXO3xqp/wMZt/I1
         kkbWFb1D9nTUrVD1jMggOwdkPSVMHY6mhitg00fintDTj3mWmqUccjZdyWb5gO3tL4RJ
         dE0ko+dC1mNMs5E0TNKcFe+dlF8CixyF//1xNdUiczGW9dhUgRyzB/K4Gm0ExLfQrkkR
         +7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVMVnz1BPa2rR9mngJoGjhpNgC0qj4O2t6d7TTuyS7gscfnSArAy+4hxXtYMBg7ar73g2OtF80rZGvXoLaRFrXBvn5x
X-Gm-Message-State: AOJu0YyGnjjsofHNGeTc+iog8hMsavU3nO/78VDkw3jdUBC0lHgMUKIS
	/4GDFADtDHXJHmidDsOcBVQdDjqelDOmnjjqVrvrFq5uwpVOix6Y
X-Google-Smtp-Source: AGHT+IGndCdN78CF73lLg0AoJ92l4TcuUZFfs+eZAg3UI09VK75VmrkOJNgBpK+jw/bXD4JUtOZVuw==
X-Received: by 2002:a05:6a20:a891:b0:1b8:d79:55f6 with SMTP id adf61e73a8af0-1bcbb40ee1dmr5691357637.25.1718901036424;
        Thu, 20 Jun 2024 09:30:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb67b29sm12936722b3a.141.2024.06.20.09.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:30:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 20 Jun 2024 09:30:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: conor@kernel.org, vkoul@kernel.org, kishon@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	frank.li@nxp.com, conor+dt@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, imx@lists.linux.dev
Subject: Re: [PATCH v7 2/2] phy: freescale: imx8qm-hsio: Add i.MX8QM HSIO PHY
 driver support
Message-ID: <2f15baba-68b5-4e99-bdb5-6d2e05b7688b@roeck-us.net>
References: <1716962565-2084-1-git-send-email-hongxing.zhu@nxp.com>
 <1716962565-2084-3-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1716962565-2084-3-git-send-email-hongxing.zhu@nxp.com>

On Wed, May 29, 2024 at 02:02:45PM +0800, Richard Zhu wrote:
> Add i.MX8QM HSIO PHY driver support.
> 
> i.MX8QM HSIO has three lane PHY instances, and can be bound to the
> following controllers in the different use cases listed in below table.
> - two lanes capable PCIEA controller.
> - one lane PCIEB controller.
> - AHCI SATA controller.
> 
> i.MX8QM HSIO PHYs support the following use cases.
> +----------------------------------------------------+
> |                               | Lane0| Lane1| Lane2|
> |-------------------------------|------|------|------|
> | use case 1: PCIEAX2SATA       | PCIEA| PCIEA| SATA |
> |-------------------------------|------|------|------|
> | use case 2: PCIEAX2PCIEB      | PCIEA| PCIEA| PCIEB|
> |-------------------------------|------|------|------|
> | use case 3: PCIEAPCIEBSATA    | PCIEA| PCIEB| SATA |
> +----------------------------------------------------+
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Building alpha:allmodconfig ... failed
--------------
Error log:
drivers/phy/freescale/phy-fsl-imx8qm-hsio.c: In function 'imx_hsio_set_mode':
drivers/phy/freescale/phy-fsl-imx8qm-hsio.c:459:15: error: implicit declaration of function 'FIELD_PREP'

Guenter
