Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB3835968
	for <imx@lists.linux.dev>; Mon,  2 Jun 2025 14:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872896; cv=none; b=L4SqDp+pHjOnTVoASaZ3jEVtjfILhEKiqO+rKWS/0FEnygynFnpW8aFkbsR52AYivfOPddTgyNEk+7j8TyqPaXvV/ju6xQftCg0ZRp7KSoQRqnY59VyZPLUpz0j/GM0/Sn8PGd+UOejAAA55JqYA2gcyTuwPS0jVMCtL9rO8YUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872896; c=relaxed/simple;
	bh=NagQOnPJDvkb2mkYf+XeOB5En0lYB8s9niseheZBotI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mai6HCXcIl4xwzoTczTxKIspfrRJnZ7heZBBHe2GPbRs3uCPj6bxENRuA4LsCc2AqzQRn2FcrAo41cyK96A4tzrg8/heH7RuowUwrMbsO1/yAr8us+9HWYg0Tw9nhsyox29cU2f+npLUu/oBtsUQPOWx9gRSAHjSTagUmytpg9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vyTI7pBv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vyTI7pBv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a363d15c64so3099177f8f.3
        for <imx@lists.linux.dev>; Mon, 02 Jun 2025 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748872892; x=1749477692; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIbBoniHrQ8ysPUakN2ZSVqOUqWXbm4NXe1FWYc3Lms=;
        b=vyTI7pBv1UvckbUZ0X21RXyfZ1UYYcasVpNEMQzSaECimuEDHzRbHpgNyPXBu7VqGS
         KTS/daDb9fPjypMUQQ9AjVc1txKt7x1cQm8pT58HrcnXxtOahNVegNrJzFyNqkxbcswp
         2OaHRVZGg44SyQQhGTP17w8UuZ4yXlFuh1uxharVXqsDfy4/CaNAKOUXIXsESVbBuFU8
         rKZIqOJGjL6o5ukekruvjJmLVprVhmdGLxo9avQDEE+9Nzzib4gJsJII7y6NzwTBHgYE
         saBOCIYVU7aDZi72WVm/dZ6H6mG10NxvRBqupUZRUxlgyg2rOp4lg8zaEgatzi/UxHw0
         i+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872892; x=1749477692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIbBoniHrQ8ysPUakN2ZSVqOUqWXbm4NXe1FWYc3Lms=;
        b=JmCtjuzt2/c+gO0j6TUE+GojFxeAG6PM457PHgeUnQR02IC21qG8EPd5o7N5JfpBVN
         aHV+Fb6+i+GrnfBa2w5FgmzNPuiWVKORF0DZPh+5XOSwb+dYCZmlxA+fcqblADJOqPMA
         UaOsgJD0jZX0z6NYZ2r25jsrBhVtoe4B5GC6bYaod+QZqO+0yYhXuplBolNGSow/CagI
         +CYTCF0oPMro1+89Q9Tn03fD3vhAuPYvpOqcC0CZhW/1VRFe/D87lx8SK4BJuh9kUne0
         iZ7+3o8oWK91eRE3qpr8fAy+B/ZwGL9WkH7EEkA+fJ1wV2R6IMdfZqfJZ/HUaF5kD8mq
         31UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh3jydfIlxbWOgN7AJWn3Fr8VarOlDyIk6KB9U26qu2+rNzscF9Hj74kuNPaRYmxP3bJ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbBuQqJCOyXz438l4gEFoEmkfxubtQwU2dEmEwDpwZo8KcZPGg
	ykr2izUxl9oBfqxNkxzrfA1q/BPg7aLB5YGl4AIOzNTTx0KQbnufvW5MzGJoQYxGcFw=
X-Gm-Gg: ASbGnctEOsdq5+93W6bAUXoFvvoTceqOwg28zdqmj+RwRF5DPh2vZ3HbM0MqeBj2H10
	5rk0OEAUHiiEDpd6uhirNZYUzsVG+ngxHHMoacgxp1dj0kjPDhe8mGnF6/GiyGtVFei8oY91VmU
	wuEtpcKeZMc9X9C9MqHD5setVCeesOya6hkRRz6vP5sqjncFTr4cjXQZA3yeUYEi2YOUuNQoGSJ
	UpLqGeX76ZvAy5Vt+9djqEcLMXwZdUv59RdmywpVN3z+BA2sO2aEwaGHuulRqljRv6y9bxoOB0V
	0+1qE42tqndx7LtFDJdY6n1PLfeTTeeCPbz65chIZC6Petw9s2uIDpLRRWpjlgjGmnk=
X-Google-Smtp-Source: AGHT+IFcK/6ISQPxykPrncma5VHws55L2Y9hI5oNzFpiILYMm6BZyuZo0dKaVkm4FGL7w36sh5Q2lg==
X-Received: by 2002:a05:6000:2409:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a4f7a3650bmr10615706f8f.27.1748872892237;
        Mon, 02 Jun 2025 07:01:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe5b871sm15236681f8f.13.2025.06.02.07.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 07:01:31 -0700 (PDT)
Date: Mon, 2 Jun 2025 17:01:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: Re: [PATCH 2/4] usb: chipidea: usbmisc: s32g: Add a
 REINIT_DURING_RESUME flag
Message-ID: <aD2uuP6Tx9NH7wVg@stanley.mountain>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <b1ddbc5993b2906cf916d023fdf27b07088a9672.1748453565.git.dan.carpenter@linaro.org>
 <aDd/pNP0jt73PKtb@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDd/pNP0jt73PKtb@lizhi-Precision-Tower-5810>

On Wed, May 28, 2025 at 05:27:00PM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 10:57:20PM +0300, Dan Carpenter wrote:
> > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >
> > The s32g2 and s32g3 chips will need to re-initialize in the resume path.
> > Add a REINIT_DURING_RESUME flag which will trigger the reinitialization.
> 
> why power_lost_check() doesn't work for you?
> 

Yeah.  That looks like it should work.  Thanks.

regards,
dan carpenter

